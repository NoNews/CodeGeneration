package ${packageName}.activities${dotSubpackage};

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

import ${packageName}.interfaces.views${dotSubpackage}.${viewName};
import ${packageName}.presenters${dotSubpackage}.${presenterName};
import ${packageName}.activities.BaseActivity;
import ${packageName}.R;
<#if useButterKnife>
import butterknife.ButterKnife;
</#if>
<#if extendsBaseActivity><#if applicationPackage??>import ${applicationPackage}.ui.activity.BaseActivity;</#if><#else></#if>
<#if extendsBaseActivity!!>import com.arellomobile.mvp.MvpActivity;</#if>
<#if applicationPackage??>
import ${applicationPackage}.R;
</#if>

import com.arellomobile.mvp.presenter.InjectPresenter;

public class ${className} extends BaseActivity implements ${viewName} {

    private static final int LAYOUT = R.layout.${activityName};

    //@formatter:off
	@InjectPresenter	${presenterName} m${presenterName};
    //@formatter:on

	<#if includeFactory>
    public static Intent getIntent(final Context context) {
        Intent intent = new Intent(context, ${className}.class);
        return intent;
    }
	</#if>

	<#if includeLayout>

	@Override
	protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(LAYOUT);
		<#if useButterKnife>
        ButterKnife.bind(this);
        </#if>
	}
	</#if>
}
