Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D187D2C24
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621046.967040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupuM-0008KO-8v; Mon, 23 Oct 2023 08:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621046.967040; Mon, 23 Oct 2023 08:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupuM-0008Hl-6C; Mon, 23 Oct 2023 08:03:30 +0000
Received: by outflank-mailman (input) for mailman id 621046;
 Mon, 23 Oct 2023 08:03:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qupuK-0008Hf-Qv
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:03:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a52d4fee-717a-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 10:03:26 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4550E4EE0740;
 Mon, 23 Oct 2023 10:03:26 +0200 (CEST)
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
X-Inumbo-ID: a52d4fee-717a-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Mon, 23 Oct 2023 10:03:26 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v2] xen: Add SAF deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <7d7ebafa-9751-bd0a-c47a-1894d9edadf5@suse.com>
References: <a9c52c943380f2c35f0a6ccab8215c03e87c99dc.1697712857.git.nicola.vetrini@bugseng.com>
 <de2b666e-ca48-58d2-73eb-5adc797f818e@suse.com>
 <d879b8e4689e51131f081edcb3b2abe6@bugseng.com>
 <dd58e1cb-8f17-986d-f4f9-f39e998e05a0@suse.com>
 <5b1cd4fba12664f2ef49bcc2eb198e31@bugseng.com>
 <d83c024b-05a9-5298-9e43-e693675c2da5@suse.com>
 <6a90edf81f410db8069526228de75d7e@bugseng.com>
 <7d7ebafa-9751-bd0a-c47a-1894d9edadf5@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <800b2c809829942210323804b6778c40@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2023 08:34, Jan Beulich wrote:
> On 20.10.2023 16:58, Nicola Vetrini wrote:
>> On 20/10/2023 15:24, Jan Beulich wrote:
>>> On 20.10.2023 12:33, Nicola Vetrini wrote:
>>>> On 20/10/2023 08:38, Jan Beulich wrote:
>>>>> On 19.10.2023 18:34, Nicola Vetrini wrote:
>>>>>> On 19/10/2023 17:57, Jan Beulich wrote:
>>>>>>> On 19.10.2023 13:04, Nicola Vetrini wrote:
>>>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>>>> @@ -85,10 +85,10 @@ conform to the directive."
>>>>>>>>  # Series 7.
>>>>>>>>  #
>>>>>>>> 
>>>>>>>> --doc_begin="Usage of the following constants is safe, since 
>>>>>>>> they
>>>>>>>> are
>>>>>>>> given as-is
>>>>>>>> -in the inflate algorithm specification and there is therefore 
>>>>>>>> no
>>>>>>>> risk
>>>>>>>> of them
>>>>>>>> -being interpreted as decimal constants."
>>>>>>>> --config=MC3R1.R7.1,literals={safe,
>>>>>>>> "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>>>>>>> +-doc_begin="Octal constants used as arguments to macro 
>>>>>>>> INSTR_ENC
>>>>>>>> or
>>>>>>>> MASK_EXTR
>>>>>>>> +can be used, because they appear as is in specifications,
>>>>>>>> manuals,
>>>>>>>> and
>>>>>>>> +algorithm descriptions."
>>>>>>>> +-config=MC3R1.R7.1,reports+={safe,
>>>>>>>> "any_area(any_loc(any_exp(macro(^(INSTR_ENC|MASK_EXTR)$))))"}
>>>>>>> 
>>>>>>> INSTR_ENC() is a local macro in x86'es AMD SVM code. A macro of 
>>>>>>> the
>>>>>>> same
>>>>>>> name could imo be introduced without issues in, say, Arm code. 
>>>>>>> The
>>>>>>> above
>>>>>>> would then needlessly suppress findings there, aiui.
>>>>>>> 
>>>>>>> MASK_EXTR() otoh is a global macro which ise used for various
>>>>>>> purposes.
>>>>>>> Excluding checking there is imo going too far, too.
>>>>>> 
>>>>>> I should have thought about it; I can simply enforce the deviation
>>>>>> to
>>>>>> additionally match
>>>>>> only a specific file for each of the macros.
>>>>> 
>>>>> That'll work for INSTR_ENC(), but not for MASK_EXTR().
>>>>> 
>>>> 
>>>> Why? What I'm deviating is reports due to octal constants used in
>>>> expressions
>>>> that contain MASK_EXTR in their expansion if and only if these are
>>>> located in the
>>>> file svm.h.
>>>> No extra octal constant will match all these constraints.
>>> 
>>> New MASK_EXTR() uses can appear at any time, without necessarily
>>> matching the justification.
>>> 
>>> Jan
>> 
>> Sorry, but I don't understand what's your concern exactly. With the
>> improvements I proposed
>> (hence a new patch revision) I see the following possible future
>> scenarios:
>> 
>> 1. an use of MASK_EXTR() in a file other than x86/hvm/svm/emulate.c
>> appears, with no
>>     use of octal constants in the expansion. This won't be deviated;
>> 2. an use of MASK_EXTR() in x86/hvm/svm/emulate.c appears, with no use
>> of octal
>>     constants in the expansion. This won't be deviated;
>> 3. an use of MASK_EXTR() in x86/hvm/svm/emulate.c appears, with octal
>>     constants in the expansion. This will be deviated;
> 
> This is what I'm concerned of: How do you know up front whether such 
> new
> uses want deviating?
> 
> Jan
> 

I understand you concern now. I can argue that all the macros in that 
table have indeed
an octal constant in their definition (0 is explicitly allowed by 
MISRA).
This is also specified in the comment above the INSTR_ENC macro 
definition, therefore any
new addition should have an octal the second argument to INSTR_ENC.

>> 4. an use of any other macro with an octal constant in its expansion
>> won't be deviated,
>>     unless the configuration is suitably edited.
>> 
>> Does this address your concern?

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

