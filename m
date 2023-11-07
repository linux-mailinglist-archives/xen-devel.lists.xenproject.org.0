Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0073C7E3690
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 09:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628612.980236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0HN1-0007le-HT; Tue, 07 Nov 2023 08:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628612.980236; Tue, 07 Nov 2023 08:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0HN1-0007jb-ET; Tue, 07 Nov 2023 08:23:35 +0000
Received: by outflank-mailman (input) for mailman id 628612;
 Tue, 07 Nov 2023 08:23:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r0HN0-0007jV-35
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 08:23:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0HMo-0004Z9-Gt; Tue, 07 Nov 2023 08:23:22 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r0HMo-0007zC-BS; Tue, 07 Nov 2023 08:23:22 +0000
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
	bh=FU99nNsSKbOGU3acvMAOLvKB1HfvAXlexL0DEQQJpj0=; b=uqkex9Znoo0hTRbkCy74vrtJ6A
	NgWVlFySNMOMMsmG2ZSatjPy3gJn6moyB+L3ZW5ggulDrZYBCEr3xFTmDsZVvP0otRqqIoDhkzB7N
	m7gt0VYmiMiiOiKaUsLk5gPOrRZsUTAMJercLdc9ZjmQ94Wyw9WF3dHD6Ke9m5i/NC14=;
Message-ID: <3ca89630-1625-46cc-b78b-9b9c073ccea3@xen.org>
Date: Tue, 7 Nov 2023 08:23:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Informal voting proposal
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Kelly Choi <kelly.choi@cloud.com>, xen-devel@lists.xenproject.org,
 committers@xenproject.org
References: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com>
 <39e6d4b3-5468-4b91-a030-f36bcce3583d@xen.org>
 <alpine.DEB.2.22.394.2311061254560.3478774@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2311061254560.3478774@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 07/11/2023 04:18, Stefano Stabellini wrote:
> On Mon, 6 Nov 2023, Julien Grall wrote:
>> Hi Kelly,
>>
>> On 06/11/2023 16:40, Kelly Choi wrote:
>>> Hi all,
>>>
>>> As an open-source community, there will always be differences of opinion in
>>> approaches and the way we think. It is imperative, however, that we view
>>> this diversity as a source of strength rather than a hindrance.
>>>
>>> Recent deliberations within our project have led to certain matters being
>>> put on hold due to an inability to reach a consensus. While formal voting
>>> procedures serve their purpose, they can be time-consuming and may not
>>> always lead to meaningful progress.
>>>
>>> Having received agreement from a few maintainers already, I would like to
>>> propose the following:
>>
>> Thanks for the sending the proposal. While I like the idea of informal vote to
>> move faster, I would like to ask some clarifications.
>>
>>> *Informal voting method:*
>>>
>>>      1. Each project should ideally have more than 2 maintainers to
>>>      facilitate impartial discussions. Projects lacking this configuration
>>> will
>>>      be addressed at a later stage.
>>>      2. Anyone in the community is welcome to voice their opinions, ideas,
>>>      and concerns about any patch or contribution.
>>>      3. If members cannot agree, the majority informal vote of the
>>>      maintainers will be the decision that stands. For instance, if, after
>>>      careful consideration of all suggestions and concerns, 2 out of 3
>>>      maintainers endorse a solution within the x86 subsystem, it shall be the
>>>      decision we move forward with.
>>
>> How do you know that all the options have been carefully considered?
> 
> I don't think there is a hard rule on this. We follow the discussion on > the list the same way as we do today.

To me the fact we need to write down the informal rules means that 
something already gone wrong before. So I feel that rules should be 
unambiguous to avoid any problem afterwards.

> 
> While I like the informal vote proposal and effectively we have already
> been following it in many areas of the project, I don't think we should
> change the current processes from that point of view.

I am confused. Are you suggesting that we should not write down how 
informal votes works?

> 
> 
>>>      4. Naturally, there may be exceptional circumstances, as such, a formal
>>>      vote may be warranted but should happen only a few times a year for
>>> serious
>>>      cases only.
>> Similarly here, you are suggesting that a formal vote can be called. But it is
>> not super clear what would be the condition it could be used and how it can be
>> called.
> 
> The formal vote is basically the same we already have today. It would
> follow the existing voting rules and guidelines already part of the
> governance.

Reading through the governance, I couldn't find anywhere indicating in 
which condition the formal votes can be triggered. Hence my question here.

>> For instance, per the informal rule, if 2 out of 3 maintainers accept. Then it
>> would be sensible for the patch to be merged as soon as the 5 days windows is
>> closed. Yet the 3rd maintainer technically object it. So could that maintainer
>> request a formal vote? If so, how long do they have?
> 
> It is difficult to write down a process that works in all cases, and if
> we did it would probably end up being slower rather than faster.
> 
> In my view if someone doesn't agree with his other co-maintainers and he
> is outvoted (e.g. 2/3 of the maintainers prefer a different option), the
> individual is entitled to raise a request for a vote with the
> committers, which is the same as we already have today.
> 
> Ideally a formal vote would be rare, maybe once or twice a year, so I
> hope we won't need to optimize the formal vote.

Ok. So the expectation is that all the maintainers will accept the 
informal votes in the majority of the cases. If this is not the case, 
then we will revise the rules. Is that correct?

>>>      5. Informal votes can be as easy as 2 out of 3 maintainers providing
>>>      their Acked-by/Reviewed-by tag. Alternatively, Maintainers can call an
>>>      informal vote by simply emailing the thread with "informal vote
>>> proposed,
>>>      option 1 and option 2."
>>>      6. *All maintainers should reply with their vote within 5 working days.*
>>
>> While I understand we want to move fast, this means that a maintainer that is
>> away for PTO would not have the opportunity to answer.
> 
> PTO is a bit of a special case because we typically know when one of the
> maintainers is on PTO. If it is a short PTO and if the vacationing
> maintainer could have a strong opinion on the subject then it would make
> sense to wait. If it is a long leave of absence (several weeks or
> months) then I don't think we can wait.
> 
> So I think the 5 working days is OK as a rule of thumb, but of course it
> shouldn't be used to work around objections of a maintainer by waiting
> for him to go on holiday :-)

Well... It has been done before ;). That's why I think it is important 
to write down because at least it is not left to interpretation.

Cheers,

-- 
Julien Grall

