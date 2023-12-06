Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A9E806DC9
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 12:22:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649122.1013509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApym-0007pb-C4; Wed, 06 Dec 2023 11:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649122.1013509; Wed, 06 Dec 2023 11:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rApym-0007nU-9A; Wed, 06 Dec 2023 11:22:12 +0000
Received: by outflank-mailman (input) for mailman id 649122;
 Wed, 06 Dec 2023 11:22:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rApyl-0007nM-Hy
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 11:22:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rApyj-0006rK-Ie; Wed, 06 Dec 2023 11:22:09 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.253]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rApyj-0007ZG-Bk; Wed, 06 Dec 2023 11:22:09 +0000
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
	bh=Bk4scotKvJldVbhydaLC4MXRctvUW7l13LOo9VBJXuQ=; b=Gi+lk7te3y/D0tUu3ovyaJIfww
	of3rRNyr2oDWtJJteM3hTi/TgkukjQ/KorYTk7+JWQWseOdrA+VW3fhgPQXfy4mWgTyXLaOY3EaMC
	Kax0SB9r2CGXLGXYzg8KL2rOhGEZZ8DrrvmT3R4bZRNF+gMLvdOnZmn1fBq0+8vufALo=;
Message-ID: <33d82944-6c53-45c6-93d5-48d0be9257fd@xen.org>
Date: Wed, 6 Dec 2023 11:22:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CODING_STYLE: Add a section of the naming convention
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231205181218.74667-1-julien@xen.org>
 <CA+zSX=aUV00BwnNfFTbCE=6PuVNT=UFvE0tnMO3UhwCMh5jmHQ@mail.gmail.com>
 <50b36423-d1e1-406f-a63f-66f2e4dce68e@suse.com>
 <6f071eba-3995-451b-af80-efe875ec5ea8@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6f071eba-3995-451b-af80-efe875ec5ea8@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/12/2023 11:19, Andrew Cooper wrote:
> On 06/12/2023 8:41 am, Jan Beulich wrote:
>> On 06.12.2023 03:21, George Dunlap wrote:
>>> On Tue, Dec 5, 2023 at 6:12 PM Julien Grall <julien@xen.org> wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Several maintainers have expressed a stronger preference
>>>> to use '-' when in filename and option that contains multiple
>>>> words.
>>>>
>>>> So document it in CODING_STYLE.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> ---
>>>>      Changes in v2:
>>>>          - New wording
>>>>          - Update the section title
>>>>          - Add Jan's acked-by
>>>> ---
>>>>   CODING_STYLE | 9 +++++++++
>>>>   1 file changed, 9 insertions(+)
>>>>
>>>> diff --git a/CODING_STYLE b/CODING_STYLE
>>>> index ced3ade5a6fb..ed13ee2b664b 100644
>>>> --- a/CODING_STYLE
>>>> +++ b/CODING_STYLE
>>>> @@ -144,6 +144,15 @@ separate lines and each line should begin with a leading '*'.
>>>>    * Note beginning and end markers on separate lines and leading '*'.
>>>>    */
>>>>
>>>> +Naming convention for files and command line options
>>>> +----------------------------------------------------
>>>> +
>>>> +'-' should be used to separate words in commandline options and filenames.
>>>> +E.g. timer-works.
>>>> +
>>>> +Note that some of the options and filenames are using '_'. This is now
>>>> +deprecated.
>>> Sorry for not catching this last time; "are using X" isn't really
>>> idiomatic English; more idiomatic would be something like the
>>> following:
>>>
>>> "Note that some existing options and file names use '_'.  This is now
>>> deprecated."
>>>
>>> Since we're changing things, I *think* most style guides would advise
>>> against starting the sentence with a punctuation; so perhaps:
>>>
>>> "Command-line options and file names should use '-' to separate words;
>>> e.g., timer-works."
>>>
>>> And what about adding to the last paragraph:
>>>
>>> "When touching code around command-line parameters still using '_', it
>>> is recommended to modify the documentation to say only '-', but modify
>>> the code to accept both '-' and '_' (for backwards compatibility)."
>> In this context see
>> https://lists.xen.org/archives/html/xen-devel/2020-01/msg01945.html
>> and Andrew's response
>> https://lists.xen.org/archives/html/xen-devel/2020-01/msg02006.html
>> I'm still in favor of addressing the issue centrally (making unnecessary
>> adjustments like you suggest in the new paragraph). Yet I think Andrew's
>> objection would cover such adjustments as much as my generic solution.
> 
> Aliasing - and _ in the cmdline parsing breaks basic usability.
> 
> Its fine for new options to use -, and it's even fine-ish (but only if
> you're going to be the one doing security backports) to rename internal
> files.
> 
> But there is real and detrimental effect for altering the command line.
> 
> You will get people failing to express the option they intended when
> working with an older form of Xen.  You will need an absurd number of
> notes in the command line docs saying "newer versions of Xen accept an
> alias but you need to use the underscore form for backwards compatibility".
> 
> Not to mention that there are years of notes scattered all around the
> internet using the underscore forms, so it's likely that everyone will
> continue to use the underscore form, meaning that you don't even have a
> way to phase them out.
> 
> And for what?  An attempt to pretend that we don't have 2 decades of
> history where underscores where the norm?
> 
> It's tinkering, for no useful benefit and a clear cost.

+1 with what Andrew said.

Cheers,

-- 
Julien Grall

