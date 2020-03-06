Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7D17B896
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 09:50:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jA8e0-0008Nm-Og; Fri, 06 Mar 2020 08:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D+BG=4X=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jA8dz-0008Nh-49
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 08:47:43 +0000
X-Inumbo-ID: 23a4c900-5f87-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23a4c900-5f87-11ea-90c4-bc764e2007e4;
 Fri, 06 Mar 2020 08:47:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 72803B353;
 Fri,  6 Mar 2020 08:47:40 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-10-jgross@suse.com>
 <61640156-0e35-6808-829a-2eb8accbfb94@suse.com>
 <1a6e1c6c-7e88-3396-885b-62371bb24db4@suse.com>
 <36259bf3-8469-5aac-fb02-3966ae1500fd@suse.com>
 <fab9f226-e3a8-85c1-669c-07fd19325d18@suse.com>
 <725efae2-d7e4-1d13-5b25-7cd1a52a2a63@suse.com>
 <bd54ba1a-ce9e-35a3-3b15-82f74040baea@suse.com>
 <1c86f9c7-c2fd-e2d9-67ef-ceefa95a9851@suse.com>
 <9d239e78-49bd-43be-1096-8cdfa7a29e5a@suse.com>
 <a593f09f-1e79-8b87-7399-0c03161a5ad6@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0b6e7f36-786c-f788-0c13-7e0ed41d77df@suse.com>
Date: Fri, 6 Mar 2020 09:47:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a593f09f-1e79-8b87-7399-0c03161a5ad6@suse.com>
Content-Type: multipart/mixed; boundary="------------38BC1E079100A48025CB843F"
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 09/12] xen: add runtime parameter access
 support to hypfs
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a multi-part message in MIME format.
--------------38BC1E079100A48025CB843F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06.03.20 09:20, Jan Beulich wrote:
> On 06.03.2020 07:42, Jürgen Groß wrote:
>> On 05.03.20 09:26, Jan Beulich wrote:
>>> On 05.03.2020 07:01, Jürgen Groß wrote:
>>>> On 04.03.20 17:56, Jan Beulich wrote:
>>>>> On 04.03.2020 17:31, Jürgen Groß wrote:
>>>>>> On 04.03.20 16:19, Jan Beulich wrote:
>>>>>>> On 04.03.2020 16:07, Jürgen Groß wrote:
>>>>>>>> On 04.03.20 12:32, Jan Beulich wrote:
>>>>>>>>> On 26.02.2020 13:47, Juergen Gross wrote:
>>>>>>>>>> +static void update_ept_param_append(const char *str, int val)
>>>>>>>>>> +{
>>>>>>>>>> +    char *pos = opt_ept_setting + strlen(opt_ept_setting);
>>>>>>>>>> +
>>>>>>>>>> +    snprintf(pos, sizeof(opt_ept_setting) - (pos - opt_ept_setting),
>>>>>>>>>> +             ",%s=%d", str, val);
>>>>>>>>>> +}
>>>>>>>>>> +
>>>>>>>>>> +static void update_ept_param(void)
>>>>>>>>>> +{
>>>>>>>>>> +    snprintf(opt_ept_setting, sizeof(opt_ept_setting), "pml=%d", opt_ept_pml);
>>>>>>>>>> +    if ( opt_ept_ad >= 0 )
>>>>>>>>>> +        update_ept_param_append("ad", opt_ept_ad);
>>>>>>>>>
>>>>>>>>> This won't correctly reflect reality: If you look at
>>>>>>>>> vmx_init_vmcs_config(), even a negative value means "true" here,
>>>>>>>>> unless on a specific Atom model. I think init_ept_param() wants
>>>>>>>>> to have that erratum workaround logic moved there, such that
>>>>>>>>> you can then assme the value to be non-negative here.
>>>>>>>>
>>>>>>>> But isn't not mentioning it in the -1 case correct? -1 means: do the
>>>>>>>> correct thing on the current hardware.
>>>>>>>
>>>>>>> Well, I think the output here should represent effective settings,
>>>>>>
>>>>>> The minimum requirement is to reflect the effective parameters, like
>>>>>> cmdline is doing for boot-time only parameters. With runtime parameters
>>>>>> we had no way of telling what was set, and this is now possible.
>>>>>>
>>>>>>> and a sub-item should be suppressed only if a setting has no effect
>>>>>>> at all in the current setup, like ...
>>>>>>>
>>>>>>>>>> +    if ( opt_ept_exec_sp >= 0 )
>>>>>>>>>> +        update_ept_param_append("exec-sp", opt_ept_exec_sp);
>>>>>>>>>
>>>>>>>>> I agree for this one - if the value is still -1, it has neither
>>>>>>>>> been set nor is its value of any interest.
>>>>>>>
>>>>>>> ... here.
>>>>>>
>>>>>> I think we should not mix up specified parameters and effective
>>>>>> settings. In case an effective setting is of common interest it should
>>>>>> be reported via a specific node (like e.g. specific mitigation settings
>>>>>> where the cmdline is not providing enough details).
>>>>>
>>>>> But then a boolean option that wasn't specified on the command line
>>>>> should produce no output at all. And hence we'd need a way to tell
>>>>> whether an option was set from command line for _all_ of them. I
>>>>> don't think this would be very helpful.
>>>>
>>>> I disagree here.
>>>>
>>>> This is important only for cases where the hypervisor treats the
>>>> parameter as a tristate: true/false/unspecified. In all cases where
>>>> the bool value is really true or false it can be reported as such.
>>>
>>> The problem I'm having with this is the resulting inconsistency:
>>> When we write the variable with 0 or 1 in case we find it to be
>>> -1 after command line parsing, the externally visible effect will
>>> be different from the case where we leave it to be -1 yet still
>>> treat it as (pseudo-)boolean. This, however, is an implementation
>>> detail, while imo the hypfs presentation should not depend on
>>> such implementation details.
>>>
>>>> Reporting 0/1 for e.g. "ad" if opt_ept_ad==-1 would add a latent problem
>>>> if any other action would be derived from the parameter variable being
>>>> -1.
>>>>
>>>> So either opt_ept_ad should be modified to change it to 0/1 instead of
>>>> only setting the VCMS flag,
>>>
>>> That's what I did suggest.
>>>
>>>> or the logic should be kept as is in this
>>>> patch. IMO changing the setting of opt_ept_ad should be done in another
>>>> patch if this is really wanted.
>>>
>>> And of course I don't mind at all doing so in a prereq patch.
>>> It's just that the patch here provides a good place _where_ to
>>> actually do such an adjustment.
>>
>> I was thinking of something like this:
>>
>> --- a/xen/arch/x86/hvm/vmx/vmcs.c
>> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
>> @@ -313,12 +313,12 @@ static int vmx_init_vmcs_config(void)
>>        {
>>            rdmsrl(MSR_IA32_VMX_EPT_VPID_CAP, _vmx_ept_vpid_cap);
>>
>> +        if ( /* Work around Erratum AVR41 on Avoton processors. */
>> +             boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x4d &&
>> +             opt_ept_ad < 0 )
>> +            opt_ept_ad = 0;
>>            if ( !opt_ept_ad )
>>                _vmx_ept_vpid_cap &= ~VMX_EPT_AD_BIT;
>> -        else if ( /* Work around Erratum AVR41 on Avoton processors. */
>> -                  boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x4d &&
>> -                  opt_ept_ad < 0 )
>> -            _vmx_ept_vpid_cap &= ~VMX_EPT_AD_BIT;
>>
>>            /*
>>             * Additional sanity checking before using EPT:
> 
> And I was specifically hoping to avoid doing this in a non-__init
> function.

Should be fairly easy (see attached patch).


Juergen

--------------38BC1E079100A48025CB843F
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-xen-vmx-let-opt_ept_ad-always-reflect-the-current-se.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-xen-vmx-let-opt_ept_ad-always-reflect-the-current-se.pa";
 filename*1="tch"

From 32f307522c2044130bb8ed66189efc411c540103 Mon Sep 17 00:00:00 2001
From: Juergen Gross <jgross@suse.com>
Date: Fri, 6 Mar 2020 07:30:36 +0100
Subject: [PATCH] xen/vmx: let opt_ept_ad always reflect the current setting

In case opt_ept_ad has not been set explicitly by the user via command
line or runtime parameter, it is treated as "no" on Avoton cpus.

Change that handling by setting opt_ept_ad to 0 for this cpu type
explicitly if no user value has been set.

By putting this into the (renamed) boot time initialization of vmcs.c
_vmx_cpu_up() can be made static.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/hvm/vmx/vmcs.c        | 22 +++++++++++++++-------
 xen/arch/x86/hvm/vmx/vmx.c         |  4 +---
 xen/include/asm-x86/hvm/vmx/vmcs.h |  3 +--
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 4c23645454..24f2bd6e43 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -315,10 +315,6 @@ static int vmx_init_vmcs_config(void)
 
         if ( !opt_ept_ad )
             _vmx_ept_vpid_cap &= ~VMX_EPT_AD_BIT;
-        else if ( /* Work around Erratum AVR41 on Avoton processors. */
-                  boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x4d &&
-                  opt_ept_ad < 0 )
-            _vmx_ept_vpid_cap &= ~VMX_EPT_AD_BIT;
 
         /*
          * Additional sanity checking before using EPT:
@@ -652,7 +648,7 @@ void vmx_cpu_dead(unsigned int cpu)
     vmx_pi_desc_fixup(cpu);
 }
 
-int _vmx_cpu_up(bool bsp)
+static int _vmx_cpu_up(bool bsp)
 {
     u32 eax, edx;
     int rc, bios_locked, cpu = smp_processor_id();
@@ -2108,9 +2104,21 @@ static void vmcs_dump(unsigned char ch)
     printk("**************************************\n");
 }
 
-void __init setup_vmcs_dump(void)
+int __init vmx_vmcs_init(void)
 {
-    register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
+    int ret;
+
+    if ( opt_ept_ad < 0 )
+        /* Work around Erratum AVR41 on Avoton processors. */
+        opt_ept_ad = (boot_cpu_data.x86 == 6 &&
+                      boot_cpu_data.x86_model == 0x4d) ? 0 : 1;
+
+    ret = _vmx_cpu_up(true);
+
+    if ( !ret )
+        register_keyhandler('v', vmcs_dump, "dump VT-x VMCSs", 1);
+
+    return ret;
 }
 
 static void __init __maybe_unused build_assertions(void)
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index d265ed46ad..d0ad2ed879 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2478,7 +2478,7 @@ const struct hvm_function_table * __init start_vmx(void)
 {
     set_in_cr4(X86_CR4_VMXE);
 
-    if ( _vmx_cpu_up(true) )
+    if ( vmx_vmcs_init() )
     {
         printk("VMX: failed to initialise.\n");
         return NULL;
@@ -2549,8 +2549,6 @@ const struct hvm_function_table * __init start_vmx(void)
         vmx_function_table.get_guest_bndcfgs = vmx_get_guest_bndcfgs;
     }
 
-    setup_vmcs_dump();
-
     lbr_tsx_fixup_check();
     bdf93_fixup_check();
 
diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
index be4661a929..b346a132e2 100644
--- a/xen/include/asm-x86/hvm/vmx/vmcs.h
+++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
@@ -21,11 +21,10 @@
 #include <asm/hvm/io.h>
 
 extern void vmcs_dump_vcpu(struct vcpu *v);
-extern void setup_vmcs_dump(void);
+extern int vmx_vmcs_init(void);
 extern int  vmx_cpu_up_prepare(unsigned int cpu);
 extern void vmx_cpu_dead(unsigned int cpu);
 extern int  vmx_cpu_up(void);
-extern int  _vmx_cpu_up(bool bsp);
 extern void vmx_cpu_down(void);
 
 struct vmcs_struct {
-- 
2.16.4


--------------38BC1E079100A48025CB843F
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--------------38BC1E079100A48025CB843F--

