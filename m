Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267E47D7E22
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:12:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623561.971503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvTj-0002U7-Gu; Thu, 26 Oct 2023 08:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623561.971503; Thu, 26 Oct 2023 08:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvTj-0002SH-CP; Thu, 26 Oct 2023 08:12:31 +0000
Received: by outflank-mailman (input) for mailman id 623561;
 Thu, 26 Oct 2023 08:12:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VqC+=GI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvvTh-0002SB-FP
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:12:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 671b7b61-73d7-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 10:12:28 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A15AE4EE0742;
 Thu, 26 Oct 2023 10:12:27 +0200 (CEST)
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
X-Inumbo-ID: 671b7b61-73d7-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 26 Oct 2023 10:12:27 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3] xen: Add deviations for MISRA C:2012
 Rule 7.1
In-Reply-To: <f740f6db-ccec-1187-7c19-1cb37d8cf4b6@suse.com>
References: <5e0f1bcd7b4325141e64a3c2d581034956b42293.1698136547.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2310241329390.271731@ubuntu-linux-20-04-desktop>
 <78107fe9-de43-30b8-7423-240450bc0da8@suse.com>
 <alpine.DEB.2.22.394.2310251532290.271731@ubuntu-linux-20-04-desktop>
 <f740f6db-ccec-1187-7c19-1cb37d8cf4b6@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <937dc59860ce757c1a8de80a44a41ccb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2023 08:49, Jan Beulich wrote:
> On 26.10.2023 00:34, Stefano Stabellini wrote:
>> On Wed, 25 Oct 2023, Jan Beulich wrote:
>>> On 24.10.2023 22:30, Stefano Stabellini wrote:
>>>> On Tue, 24 Oct 2023, Nicola Vetrini wrote:
>>>>> As specified in rules.rst, these constants can be used
>>>>> in the code.
>>>>> 
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - replace some SAF deviations with configurations
>>>>> Changes in v3:
>>>>> - refine configurations and justifications
>>>>> ---
>>>>>  automation/eclair_analysis/ECLAIR/deviations.ecl | 10 ++++++----
>>>>>  docs/misra/deviations.rst                        |  5 +++++
>>>>>  docs/misra/safe.json                             |  8 ++++++++
>>>>>  xen/arch/x86/hvm/svm/emulate.c                   |  6 +++---
>>>>>  xen/common/inflate.c                             |  4 ++--
>>>>>  5 files changed, 24 insertions(+), 9 deletions(-)
>>>>> 
>>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>>>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> index fa56e5c00a27..ea5e0eb1813f 100644
>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>> @@ -85,10 +85,12 @@ conform to the directive."
>>>>>  # Series 7.
>>>>>  #
>>>>> 
>>>>> --doc_begin="Usage of the following constants is safe, since they 
>>>>> are given as-is
>>>>> -in the inflate algorithm specification and there is therefore no 
>>>>> risk of them
>>>>> -being interpreted as decimal constants."
>>>>> --config=MC3R1.R7.1,literals={safe, 
>>>>> "^0(007|37|070|213|236|300|321|330|331|332|333|334|335|337|371)$"}
>>>>> +-doc_begin="It is safe to use certain octal constants the way they 
>>>>> are defined in
>>>>> +specifications, manuals, and algorithm descriptions."
>>>>> +-file_tag+={x86_svm_h, "^xen/arch/x86/hvm/svm/svm\\.h$"}
>>>>> +-file_tag+={x86_emulate_c, "^xen/arch/x86/hvm/svm/emulate\\.c$"}
>>>>> +-config=MC3R1.R7.1,reports+={safe, 
>>>>> "any_area(any_loc(any_exp(file(x86_svm_h)&&macro(^INSTR_ENC$))))"}
>>>>> +-config=MC3R1.R7.1,reports+={safe, 
>>>>> "any_area(text(^.*octal-ok.*$)&&any_loc(any_exp(file(x86_emulate_c)&&macro(^MASK_EXTR$))))"}
>>>>>  -doc_end
>>>>> 
>>>>>  -doc_begin="Violations in files that maintainers have asked to not 
>>>>> modify in the
>>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>>> index 8511a189253b..26c6dbbc9ffe 100644
>>>>> --- a/docs/misra/deviations.rst
>>>>> +++ b/docs/misra/deviations.rst
>>>>> @@ -90,6 +90,11 @@ Deviations related to MISRA C:2012 Rules:
>>>>>           - __emulate_2op and __emulate_2op_nobyte
>>>>>           - read_debugreg and write_debugreg
>>>>> 
>>>>> +   * - R7.1
>>>>> +     - It is safe to use certain octal constants the way they are 
>>>>> defined in
>>>>> +       specifications, manuals, and algorithm descriptions.
>>>> 
>>>> I think we should add that these cases have "octal-ok" as a in-code
>>>> comment. Everything else looks OK so this small change could be done 
>>>> on
>>>> commit.
>>> 
>>> But that needs wording carefully, as it doesn't hold across the 
>>> board:
>>> Right now relevant MASK_EXTR() uses gain such comments, but 
>>> INSTR_ENC()
>>> ones (deliberately) don't.
>> 
>> What about:
>> 
>> * - R7.1
>>   - It is safe to use certain octal constants the way they are defined
>>     in specifications, manuals, and algorithm descriptions. Such 
>> places
>>     are marked safe with a /* octal-ok */ in-code comment, or with a 
>> SAF
>>     comment (see safe.json).
> 
> Fine with me.
> 
> Jan

Ok, I'll update the deviation record.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

