Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E837B7EF7
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 14:23:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612529.952467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo0uE-0001Tf-6z; Wed, 04 Oct 2023 12:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612529.952467; Wed, 04 Oct 2023 12:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo0uE-0001Qt-4J; Wed, 04 Oct 2023 12:23:10 +0000
Received: by outflank-mailman (input) for mailman id 612529;
 Wed, 04 Oct 2023 12:23:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k75u=FS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qo0uD-0001Qk-CB
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 12:23:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5b7f86c-62b0-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 14:23:06 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 6949A4EE0737;
 Wed,  4 Oct 2023 14:23:06 +0200 (CEST)
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
X-Inumbo-ID: c5b7f86c-62b0-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Wed, 04 Oct 2023 14:23:06 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Xen-devel
 <xen-devel@lists.xenproject.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Rog?=
 =?UTF-8?Q?er_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Henry Wang
 <Henry.Wang@arm.com>, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] xen: Add SAF deviations for MISRA C:2012 Rule 7.1
In-Reply-To: <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
References: <338d8e574db943a86c7605e4c6d9a299d45f067d.1696347345.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310031345190.2348112@ubuntu-linux-20-04-desktop>
 <e1736215-52ba-4737-9da3-8f1ba7e832a6@citrix.com>
 <DB96C095-5FAF-40A1-9CA8-002291AA1933@arm.com>
 <2894008e8f612296da84267346ae4240@bugseng.com>
 <B00BC78B-E707-4043-A0B4-D320C6717472@arm.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <d14ac69a2034580b7f340ff74f92c65b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 04/10/2023 12:52, Luca Fancellu wrote:
>> On 4 Oct 2023, at 11:29, Nicola Vetrini <nicola.vetrini@bugseng.com> 
>> wrote:
>> 
>> On 04/10/2023 12:06, Luca Fancellu wrote:
>>> Hi Nicola,
>>>> On 4 Oct 2023, at 10:56, andrew.cooper3@citrix.com wrote:
>>>> On 03/10/2023 9:46 pm, Stefano Stabellini wrote:
>>>>> On Tue, 3 Oct 2023, Nicola Vetrini wrote:
>>>>>> As specified in rules.rst, these constants can be used
>>>>>> in the code.
>>>>>> Their deviation is now accomplished by using a SAF comment,
>>>>>> rather than an ECLAIR configuration.
>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> "SAF" discussion aside that can be resolved elsewhere:
>>>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>>> Well no.  "SAF" aside (and SAF does need fixing before reposting 
>>>> this patch, otherwise it's just unnecessary churn), ...
>>>>>> diff --git a/xen/arch/x86/hvm/svm/svm.h 
>>>>>> b/xen/arch/x86/hvm/svm/svm.h
>>>>>> index d2a781fc3fb5..d0623b72ccfa 100644
>>>>>> --- a/xen/arch/x86/hvm/svm/svm.h
>>>>>> +++ b/xen/arch/x86/hvm/svm/svm.h
>>>>>> @@ -57,14 +57,23 @@ static inline void svm_invlpga(unsigned long 
>>>>>> linear, uint32_t asid)
>>>>>> #define INSTR_INT3 INSTR_ENC(X86EMUL_OPC( 0, 0xcc), 0)
>>>>>> #define INSTR_ICEBP INSTR_ENC(X86EMUL_OPC( 0, 0xf1), 0)
>>>>>> #define INSTR_HLT INSTR_ENC(X86EMUL_OPC( 0, 0xf4), 0)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_XSETBV INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0321)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_VMRUN INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0330)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_VMCALL INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0331)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_VMLOAD INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0332)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_VMSAVE INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0333)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_STGI INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0334)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_CLGI INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0335)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_INVLPGA INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0337)
>>>>>> +/* SAF-2-safe */
>>>>>> #define INSTR_RDTSCP INSTR_ENC(X86EMUL_OPC(0x0f, 0x01), 0371)
>>>>>> #define INSTR_INVD INSTR_ENC(X86EMUL_OPC(0x0f, 0x08), 0)
>>>>>> #define INSTR_WBINVD INSTR_ENC(X86EMUL_OPC(0x0f, 0x09), 0)
>>>> ... this has broken a tabulated structure to have comments ahead of 
>>>> lines with octal numbers, while ...
>>>>>> diff --git a/xen/arch/x86/hvm/svm/emulate.c 
>>>>>> b/xen/arch/x86/hvm/svm/emulate.c
>>>>>> index aa2c61c433b3..c5e3341c6316 100644
>>>>>> --- a/xen/arch/x86/hvm/svm/emulate.c
>>>>>> +++ b/xen/arch/x86/hvm/svm/emulate.c
>>>>>> @@ -90,9 +90,9 @@ unsigned int svm_get_insn_len(struct vcpu *v, 
>>>>>> unsigned int instr_enc)
>>>>>> if ( !instr_modrm )
>>>>>> return emul_len;
>>>>>> - if ( modrm_mod == MASK_EXTR(instr_modrm, 0300) &&
>>>>>> - (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) &&
>>>>>> - (modrm_rm & 7) == MASK_EXTR(instr_modrm, 0007) )
>>>>>> + if ( modrm_mod == MASK_EXTR(instr_modrm, 0300) && /* SAF-2-safe 
>>>>>> */
>>>>>> + (modrm_reg & 7) == MASK_EXTR(instr_modrm, 0070) && /* SAF-2-safe 
>>>>>> */
>>>>>> + (modrm_rm & 7) == MASK_EXTR(instr_modrm, 0007) ) /* SAF-2-safe 
>>>>>> */
>>>>>> return emul_len;
>>>>>> }
>>>> ... this has comments at the end of lines with octal numbers.
>>>> So which is it?
>>> I agree with Andrew here in this sense: the in-code comment is
>>> supposed to be on the line *before* the violation,
>>> not on the same line, so I’m also wondering how it is fixing the very
>>> first violation.
>>> Cheers,
>>> Luca
>> 
> 
> Hi Nicola,
> 
>> Actually it justifies what is on either the previous line or the same 
>> because it's
>> translated to /* -E> safe MC3R1.R7.1 1 */, where the last number is 
>> how many lines besides
>> the current one are to be deviated (e.g. you can have 0 deviate only 
>> the current line).
> 
> Just to understand, does this way:
> 
> <line A>
> /* -E> safe MC3R1.R7.1 1 */
> <line B>
> 
> Justifies only line B? Because I thought so, but now I want to be
> sure, otherwise it doesn’t act
> as intended.
> 
> 

Yes, line A is untouched.

<line A>
/* -E> safe MC3R1.R7.1 1 */ (deviated)
<line B>                    (deviated)



-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

