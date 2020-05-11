Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57A11CDD48
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 16:32:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY9TM-000227-76; Mon, 11 May 2020 14:32:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HsYJ=6Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jY9TK-000222-C2
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 14:31:58 +0000
X-Inumbo-ID: 2ac84c0c-9394-11ea-a218-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ac84c0c-9394-11ea-a218-12813bfff9fa;
 Mon, 11 May 2020 14:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QvLqClO0VU5s88qCAN1HUjc1Bvco4H+r7Pt7jrgc59Q=; b=H/tKsRWlYRVZcZfRKQAnXEM+Sp
 ebxcJKqmVHqdK/g1HvDHCBrFcI1LouAMnuEGK9VTTzar5o2My1d1jl0YDLdUYqwH3AMVkeor5yk7o
 rEFcsYlTDoxZuZhEp533BQ/P8p1p8PRSzDc2JEgGDxBig080nRSokrZblDxDamYT8da8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jY9TH-0008NC-MB; Mon, 11 May 2020 14:31:55 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jY9TH-0007x9-7o; Mon, 11 May 2020 14:31:55 +0000
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
To: Jan Beulich <jbeulich@suse.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
 <24244.16076.627203.282982@mariner.uk.xensource.com>
 <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
 <4017f7f0-744b-70ff-8fa4-b33c53a8b9e2@suse.com>
 <ca115637-5e84-2990-65e8-e2f04ec0ddb5@xen.org>
 <803876ce-503a-2e97-f310-0413e515970b@suse.com>
 <bbc12f81-7854-ad72-63ee-3ec94b378bf9@xen.org>
 <bf6a9ed3-fd7e-c588-9f72-8084dab1f556@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ac8f85db-8d94-b616-9cdc-3c996f3a1d43@xen.org>
Date: Mon, 11 May 2020 15:31:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bf6a9ed3-fd7e-c588-9f72-8084dab1f556@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 11/05/2020 15:14, Jan Beulich wrote:
> On 11.05.2020 16:11, Julien Grall wrote:
>> Hi,
>>
>> On 11/05/2020 15:07, Jan Beulich wrote:
>>> On 11.05.2020 15:57, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 11/05/2020 14:40, Jan Beulich wrote:
>>>>> On 11.05.2020 15:30, Julien Grall wrote:
>>>>>> Hi Ian,
>>>>>>
>>>>>> Thank you for the clarification.
>>>>>>
>>>>>> On 07/05/2020 18:01, Ian Jackson wrote:
>>>>>>> Julien Grall writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>>>>>>>> On 04/05/2020 13:34, Ian Jackson wrote:
>>>>>>>>> George Dunlap writes ("Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the menuconfig directly"):
>>>>>>>>>> On Apr 30, 2020, at 3:50 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>>>>>>>>>> Well, if I'm not mis-remembering it was on purpose to make it more
>>>>>>>>>>> difficult for people to declare themselves "experts". FAOD I'm not
>>>>>>>>>>> meaning to imply I don't see and accept the frustration aspect you
>>>>>>>>>>> mention further up. The two need to be carefully weighed against
>>>>>>>>>>> one another.
>>>>>>>>>
>>>>>>>>> Yes, it was on purpose.  However, I had my doubts at the time and
>>>>>>>>> I think experience has shown that this was a mistake.
>>>>>>>>>
>>>>>>>>>> I don’t think we need to make it difficult for people to declare
>>>>>>>>>> themselves experts, particularly as “all” it means at the moment is,
>>>>>>>>>> “Can build something which is not security supported”.  People who
>>>>>>>>>> are building their own hypervisors are already pretty well advanced;
>>>>>>>>>> I think we can let them shoot themselves in the foot if they want
>>>>>>>>>> to.
>>>>>>>>>
>>>>>>>>> Precisely.
>>>>>>>>
>>>>>>>> Can I consider this as an Acked-by? :)
>>>>>>>
>>>>>>> I am happy with the principle of the change.  I haven't reviewed the
>>>>>>> details of the commit message etc.
>>>>>>>
>>>>>>> I reviewed the thread and there were two concernes raised:
>>>>>>>
>>>>>>>      * The question of principle.  I disagree with this concern
>>>>>>>        because I approve of principle of the patch.
>>>>>>>
>>>>>>>      * Some detail about the precise justificaton as written in
>>>>>>>        the commit message, regarding `clean' targets.  Apparently the
>>>>>>>        assertion may not be completely true.  I haven't seen a proposed
>>>>>>>        alternative wording.
>>>>>>
>>>>>> I have checked the latest staging, the `clean` target doesn't trash
>>>>>> .config anymore.
>>>>>>
>>>>>>>
>>>>>>> I don't feel I should ack a controversial patch with an unresolved
>>>>>>> wording issue.  Can you tell me what your proposed wording is ?
>>>>>>> To avoid blocking this change I would be happy to review your wording
>>>>>>> and see if it meets my reading of the stated objection.
>>>>>>
>>>>>> Here a suggested rewording:
>>>>>>
>>>>>> "EXPERT mode is currently used to gate any options that are in technical
>>>>>> preview or not security supported At the moment, the only way to select
>>>>>> it is to use XEN_CONFIG_EXPERT=y on the make command line.
>>>>>>
>>>>>> However, if the user forget to add the option when (re)building or when
>>>>>> using menuconfig, then .config will get rewritten. This may lead to a
>>>>>> rather frustrating experience as it is difficult to diagnostic the
>>>>>> issue.
>>>>>
>>>>> To me this looks very similar to e.g. not suitably overriding the
>>>>> default toolchain binaries, if one has a need to build with newer
>>>>> ones than what a distro provides. According to some of my routinely
>>>>> built configs both can be done by putting suitable entries into
>>>>> ./.config (not xen/.config), removing the need to remember adding
>>>>> either to the make command line.
>>>>
>>>> I have never heard of ./.config before. So what are you referring to?
>>>
>>> I'm referring to this line in ./Config.mk:
>>>
>>> -include $(XEN_ROOT)/.config
>>
>> Great another undocumented way to do things...
>>
>>>
>>>> But yes, there are ways to make it permanent. But that involves hacking
>>>> Xen source.
>>>
>>> Why would there be any need for a source modification? Just like
>>> xen/.config, ./.config is not considered part of the source.
>>>
>>>> This is not a very great approach because if you need to
>>>> bisect, then you have to remember to apply the change everytime. It also
>>>> doesn't work if you have to build for multiple different target from the
>>>> same source.
>>>
>>> Why wouldn't it? I'm doing exactly this, far beyond just x86 and
>>> Arm builds, and it all works fine. (It would work even better
>>> with out-of-tree builds, but it looks like Anthony is getting us
>>> there.)
>>
>> ... let me ask it differently. Are you concerned of my wording or by the
>> fact we make easier to a user to EXPERT mode?
> 
> I'm trying to make the point that your patch, to me, looks to be
> trying to overcome a problem for which we have had a solution all
> the time.

For a first, AFAICT, your solution is not documented anywhere at all... 
It would be possible to document it thought.

However, having two .config for managing Xen options is not very great. 
You have to remember where to add the options and that you need to 
provide the two files if you want someone else to reproduce your setup.

So I would still like to push for a single .config.

As an aside, if you look at the placement of ./.config, it is meant to 
be applied for the full tree. XEN_CONFIG_EXPERT is a config specific to 
the hypervisor, so it is a bit counterintuitive to put it in that file.

Cheers,

-- 
Julien Grall

