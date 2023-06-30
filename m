Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4337435E3
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 09:37:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557329.870589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8gW-0006n4-0F; Fri, 30 Jun 2023 07:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557329.870589; Fri, 30 Jun 2023 07:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF8gV-0006kh-TX; Fri, 30 Jun 2023 07:36:51 +0000
Received: by outflank-mailman (input) for mailman id 557329;
 Fri, 30 Jun 2023 07:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dg0j=CS=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qF8gV-0006MG-1A
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 07:36:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df2489ca-1718-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 09:36:48 +0200 (CEST)
Received: from [172.20.10.2] (unknown [37.163.156.142])
 by support.bugseng.com (Postfix) with ESMTPSA id CFA1A4EE0737;
 Fri, 30 Jun 2023 09:36:44 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: df2489ca-1718-11ee-8611-37d641c3527e
Message-ID: <5ded390f-137a-0604-c78b-4521e1daccc6@bugseng.com>
Date: Fri, 30 Jun 2023 09:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN PATCH 5/5] x86: make parameter names of function
 declarations consistent
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <cover.1688049494.git.federico.serafini@bugseng.com>
 <5ee57d7bcd79daa0314f182ecb73e1eb6d8ecc03.1688049495.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2306291236580.3936094@ubuntu-linux-20-04-desktop>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <alpine.DEB.2.22.394.2306291236580.3936094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Stefano,

On 29/06/23 21:47, Stefano Stabellini wrote:
> On Thu, 29 Jun 2023, Federico Serafini wrote:
>> Change the parameter names of function declarations to be consistent
>> with the names used in the corresponding function definitions
>> so as to fix violations of MISRA C:2012 Rule 8.3.
>>
>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>> ---
>>   
>> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> index d07fcb2bc9..24bf409d8f 100644
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
>> @@ -656,10 +656,10 @@ bool vmx_msr_is_intercepted(struct vmx_msr_bitmap *msr_bitmap,
>>                               unsigned int msr, bool is_write) __nonnull(1);
>>   void virtual_vmcs_enter(const struct vcpu *);
>>   void virtual_vmcs_exit(const struct vcpu *);
>> -u64 virtual_vmcs_vmread(const struct vcpu *, u32 encoding);
>> +u64 virtual_vmcs_vmread(const struct vcpu *, u32 vmcs_encoding);
> 
> Shouldn't the first parameter be "v" to match the definition?
> 
> Or is that a different MISRA C rule?

This is a violation of MISRA C:2012 Rule 8.2:
"function types shall be in prototype form with named parameters".
However, I can propose a new patch version to fix it as well.

>>   enum vmx_insn_errno virtual_vmcs_vmread_safe(const struct vcpu *v,
>>                                                u32 vmcs_encoding, u64 *val);
>> -void virtual_vmcs_vmwrite(const struct vcpu *, u32 encoding, u64 val);
>> +void virtual_vmcs_vmwrite(const struct vcpu *, u32 vmcs_encoding, u64 val);
> 
> same here
> 
> 
>>   enum vmx_insn_errno virtual_vmcs_vmwrite_safe(const struct vcpu *v,
>>                                                 u32 vmcs_encoding, u64 val);
>>   
>> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
>> index dc9db69258..1e4bbc0d78 100644
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
>> @@ -144,9 +144,9 @@ enum vvmcs_encoding_type {
>>       VVMCS_TYPE_HSTATE,
>>   };
>>   
>> -u64 get_vvmcs_virtual(void *vvmcs, u32 encoding);
>> +u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding);
> 
> This one should return uint64_t to match the definition. Or is that a
> different MISRA C rule?

This is a violation of the same rule (8.3) but the focus of this patch 
series was intended to be on be only on parameter names.
I can propose a new version of the patch to also address the additional 
violations discussed.

>>   u64 get_vvmcs_real(const struct vcpu *, u32 encoding);
>> -void set_vvmcs_virtual(void *vvmcs, u32 encoding, u64 val);
>> +void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val);
> 
> This one should be:
> void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t val)
> 
> Other than these, everything else checks out

Regards

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

