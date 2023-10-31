Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE247DD0A4
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 16:37:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625914.975698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqnV-0007pz-3R; Tue, 31 Oct 2023 15:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625914.975698; Tue, 31 Oct 2023 15:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxqnU-0007o2-VJ; Tue, 31 Oct 2023 15:36:52 +0000
Received: by outflank-mailman (input) for mailman id 625914;
 Tue, 31 Oct 2023 15:36:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qxqnU-0007nu-4R
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 15:36:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxqnR-00071q-DY; Tue, 31 Oct 2023 15:36:49 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.9.249]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qxqnR-0005Mu-6f; Tue, 31 Oct 2023 15:36:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=4GfwqLh1nHAjACVFfZQPOO2eTpPBUAVG2Ec+XkQYqbk=; b=VYACEsqcYrY7cJZv1T6usx/0IX
	CtZvrNJH6lJJVJY+8V5tvgKGSOYxwMdYQN3npUVuyhR4/8Jz6C4ckupzE7RR+ZbuxBevBE5GKFNvm
	5MbodiLTi8XDKestPz97/aqcSPgiME+X6PtOhpTHQcQIwU+LqHKUqcVFRRYhk9TIdYsU=;
Message-ID: <2d6c4859-5cca-4cf2-b7f5-1068f0130c99@xen.org>
Date: Tue, 31 Oct 2023 15:36:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH][for-4.19 v5] xen: Add deviations for MISRA C:2012
 Rule 7.1
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <0c86b50a796ba2aaab01e30935ed559ab719d33a.1698418578.git.nicola.vetrini@bugseng.com>
 <98da41d4-f818-44c7-bd3c-b3e3b224ff0d@xen.org>
 <alpine.DEB.2.22.394.2310301544460.1625118@ubuntu-linux-20-04-desktop>
 <ee3c415d-bedd-432e-bf31-6e806b9cf976@xen.org>
 <DFC25ACE-FFBE-43CF-9CE2-90671D122CEC@arm.com>
 <2201cad3353f5deb567f929e91e90fd2@bugseng.com>
 <E0FA2717-D06B-4C51-9E9A-DBD72CE35963@arm.com>
 <e958d555-3075-467b-b3cf-1e5c6ad78405@xen.org>
 <F121A82D-3D86-4923-9E6E-C520F57E8DAA@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <F121A82D-3D86-4923-9E6E-C520F57E8DAA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 31/10/2023 15:32, Luca Fancellu wrote:
> 
> 
>> On 31 Oct 2023, at 15:27, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 31/10/2023 15:12, Luca Fancellu wrote:
>>>> On 31 Oct 2023, at 15:10, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>>>
>>>> On 2023-10-31 15:13, Luca Fancellu wrote:
>>>>>> On 31 Oct 2023, at 13:27, Julien Grall <julien@xen.org> wrote:
>>>>>> Hi Stefano,
>>>>>> On 30/10/2023 22:49, Stefano Stabellini wrote:
>>>>>>> On Mon, 30 Oct 2023, Julien Grall wrote:
>>>>>>>> Hi Nicola,
>>>>>>>> On 27/10/2023 16:11, Nicola Vetrini wrote:
>>>>>>>>> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
>>>>>>>>> index 8511a189253b..8aaaa1473fb4 100644
>>>>>>>>> --- a/docs/misra/deviations.rst
>>>>>>>>> +++ b/docs/misra/deviations.rst
>>>>>>>>> @@ -90,6 +90,13 @@ Deviations related to MISRA C:2012 Rules:
>>>>>>>>>            - __emulate_2op and __emulate_2op_nobyte
>>>>>>>>>            - read_debugreg and write_debugreg
>>>>>>>>>   +   * - R7.1
>>>>>>>>> +     - It is safe to use certain octal constants the way they are defined
>>>>>>>>> +       in specifications, manuals, and algorithm descriptions. Such places
>>>>>>>>> +       are marked safe with a /\* octal-ok \*/ in-code comment, or with a
>>>>>>>>> SAF
>>>>>>>>> +       comment (see safe.json).
>>>>>>>> Reading this, it is unclear to me why we have two ways to deviate the rule
>>>>>>>> r7.1. And more importantely, how would the developper decide which one to use?
>>>>>>> I agree with you on this and we were discussing this topic just this
>>>>>>> morning in the FUSA community call. I think we need a way to do this
>>>>>>> with the SAF framework:
>>>>>>> if (some code with violation) /* SAF-xx-safe */
>>>>>>> This doesn't work today unfortunately. It can only be done this way:
>>>>>>> /* SAF-xx-safe */
>>>>>>> if (some code with violation)
>>>>>>> Which is not always desirable. octal-ok is just an ad-hoc solution for
>>>>>>> one specific violation but we need a generic way to do this. Luca is
>>>>>>> investigating possible ways to support the previous format in SAF.
>>>>>> Why can't we use octal-ok everywhere for now? My point here is to make simple for the developper to know what to use.
>>>>>>> I think we should take this patch for now and harmonize it once SAF is
>>>>>>> improved.
>>>>>> The description of the deviation needs some improvement. To give an example, with the current wording, one could they can use octal-ok everywhere. But above, you are implying that SAF-xx-safe should be
>>>>>> preferred.
>>>>>> I would still strongly prefer if we use octal-ok everywhere because this is simple to remember. But if the other are happy to have both SAF-XX and octal-ok, then the description needs to be completely unambiguous and the patch should contain some explanation why we have two different ways to deviate.
>>>>> Would it be ok to have both, for example: /* SAF-XX-safe octal-ok */
>>>>> So that the suppression engine do what it should (currently it doesn’t suppress the same line, but we could do something about it) and the developer
>>>>> has a way to understand what is the violation here without going to the justification database.
>>>>
>>>> I guess. It could overflow the 80-char limit in xen/arch/x86/hvm/svm/svm.h, though.
>>> Yeah, but we could rule out something in code_style to allow only this kind of trailing comments to exceed the 80 chars
>>
>> In the past I expressed concerned with this kind of the rule because it is not entirely clear how an automatic formatter will be able to check it.
>>
>> Can you clarify whether clang-format would be able to handle your proposed rule?
> 
> So, yesterday Bertrand pointed out a StackOverflow thread for this issue and if we use ReflowComments: false we should
> be able to let the line as it is (not tested).

Wouldn't that prevent reflow for all the comments? If so, I don't think 
this is we want. Instead, we want to allow reflow for any comments but 
the one done at the end of the line.

Cheers,

-- 
Julien Grall

