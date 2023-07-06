Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B544F749C4C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 14:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559888.875298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHOMM-0000nE-Ab; Thu, 06 Jul 2023 12:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559888.875298; Thu, 06 Jul 2023 12:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHOMM-0000lO-7X; Thu, 06 Jul 2023 12:45:22 +0000
Received: by outflank-mailman (input) for mailman id 559888;
 Thu, 06 Jul 2023 12:45:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qHOMK-0000lI-L0
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 12:45:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHOMD-00016s-Gu; Thu, 06 Jul 2023 12:45:13 +0000
Received: from [54.239.6.185] (helo=[192.168.30.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qHOMD-0002KC-5s; Thu, 06 Jul 2023 12:45:13 +0000
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
	bh=QHzoLoECchFXzDTUbZPqRdCe6SzEqxD8ctaXCoIgKBg=; b=Vmhjr3wBXUTOzPAkIdX2RksJ8O
	hYbGhnOdqi6I+AQLVuchS+P2KGj8g/a9Qaogbh7qEgB4/l3HM0smoaGIOEsGw4CXDI7cj7fpJvjmH
	sjLF4HZ1WDYlcI2paonZxI4WiHjTnKEDcLRomYhFHyOU0gx2YcWAtWocYV+3pNlkg1L0=;
Message-ID: <4aec2aca-e2e6-d9e4-1f73-b5f98245033a@xen.org>
Date: Thu, 6 Jul 2023 13:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 George Dunlap <george.dunlap@cloud.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>, P S
 <pairspace@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <8601CDD7-87F7-4FD0-A6E6-BAEAB12E7956@arm.com>
 <234199F8-DBB1-42B6-9A4C-8800EEF60997@gmail.com>
 <CA+zSX=Y3_g_aq4+sDK7CuZajywVqQ4xOrq7hKZ80eUT3uSxzuQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2307051436120.761183@ubuntu-linux-20-04-desktop>
 <CA+zSX=ashTi590+cVss_3zyLESC8S=zVSMLjTKD00s6xfjZbJA@mail.gmail.com>
 <A89C2FC7-999E-4FCE-8A05-4F4B86573DBA@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <A89C2FC7-999E-4FCE-8A05-4F4B86573DBA@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 06/07/2023 13:31, Luca Fancellu wrote:
> 
> 
>> On 6 Jul 2023, at 11:01, George Dunlap <george.dunlap@cloud.com> wrote:
>>
>>
>>
>> On Wed, Jul 5, 2023 at 11:14 PM Stefano Stabellini <stefano.stabellini@amd.com> wrote:
>> On Wed, 5 Jul 2023, George Dunlap wrote:
>>> On Mon, Jul 3, 2023 at 9:55 PM P S <pairspace@gmail.com> wrote:
>>>        > On Jul 3, 2023, at 15:45, Luca Fancellu <luca.fancellu@arm.com> wrote:
>>>        ﻿>
>>>        >> On 3 Jul 2023, at 18:48, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>        >>
>>>        >>> On Mon, 3 Jul 2023, Daniel P. Smith wrote:
>>>        >>> On 7/1/23 11:13, Luca Fancellu wrote:
>>>        >>>>> On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>>        >>>>>
>>>        >>>>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
>>>        >>>>>> The "dom0less" feature was intended to be the feature where a domU
>>>        >>>>>> domain could be launched without the control domain (Dom0)
>>>        >>>>>> intervention, however the name seems to suggest that Dom0 cannot
>>>        >>>>>> be part of the configuration, while instead it's a possible use case.
>>>        >>>>>>
>>>        >>>>>> To avoid that, rename the "dom0less" configuration with the name
>>>        >>>>>> "hyperlaunch", that is less misleading.
>>>        >>>>>>
>>>        >>>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>        >>>>>> ---
>>>        >>>>>> This is an RFC to get the feeling of the community about the name
>>>        >>>>>> change, for now it's everything in one patch just to see how it
>>>        >>>>>> will look like, if there is interest on proceeding into it, I can
>>>        >>>>>> split in more commit.
>>>        >>>>>
>>>        >>>>> Have you discussed this with Dan and Chris at all?  You haven't even
>>>        >>>>> CC'd them.
>>>        >>>>
>>>        >>>> No, this rename idea started from a chat during the summit, anyway Julien
>>>        >>>> promptly add them to the CC, because I forgot.
>>>        >>>
>>>        >>> No worries and thank you for considering and taking the time to do this RFC.
>>>        >>> It is greatly appreciated that there is a strong willingness to have dom0less
>>>        >>> and hyperlaunch merged.
>>>        >>>
>>>        >>>>>
>>>        >>>>> While there is a lot of end-goal in common between the dom0less and
>>>        >>>>> hyperlaunch, and that the name dom0less is deeply misleading,
>>>        >>>>> hyperlaunch is specifically not this.
>>>        >>>>
>>>        >>>> Yes Hyperlaunch is more than this, however as I said, with this RFC I would
>>>        >>>> like
>>>        >>>> to ear opinions, @Daniel @Christopher could it be a proper name for the
>>>        >>>> dom0less
>>>        >>>> feature?
>>>        >>>
>>>        >>> As Andy has alluded, hyperlaunch is meant to provide a flexible means to
>>>        >>> handle domain construction at boot to meet a wide range of possible use cases.
>>>        >>> One of those use cases is dom0less, so yes, ultimately what dom0less does
>>>        >>> today will be achievable under hyperlaunch. Our intended approach to align the
>>>        >>> two implementations is one that is meant to be minimally disruptive, since
>>>        >>> dom0less is considered a supported (SUPPORT.md) capability. As mentioned, we
>>>        >>> are greatly appreciative to the openness to adopt the name,
>>>        >>
>>>        >> Thanks Daniel!
>>>        >>
>>>        >>
>>>        >>> but a big concern
>>>        >>> I personally have is the confusion it could cause a general user. A blanket
>>>        >>> rename would end up with two documents in the docs tree that provide two
>>>        >>> different explanations of hyperlaunch and two different device tree
>>>        >>> definitions. So I think a more measured approach should be considered here.
>>>        >>>
>>>        >>>> If this patch makes things more difficult for the Hyperlunch serie, I’m ok
>>>        >>>> to drop it,
>>>        >>>> my only aim was just to find a less misleading name for the feature.
>>>        >>>
>>>        >>> What I would like to suggest as a good first step would be an update to the
>>>        >>> dom0less document. Provide a note at the beginning that points to the
>>>        >>> hyperlaunch design doc as a more general approach that will eventually subsume
>>>        >>> dom0less. This would provide a gentler transition for exist users of dom0less.
>>>        >>>
>>>        >>> If it is not too much, I would also ask, please have a look at the design for
>>>        >>> boot modules in the series Christopher just posted. The design pulls from the
>>>        >>> work done by dom0less and expanded upon it. I major step into merging the two
>>>        >>> capabilities will be to have a common set of structures. Once those are in
>>>        >>> place, we can move to a common device tree representation, and at that point
>>>        >>> we would be fairly close, if not at the point of a formal merger of between
>>>        >>> the two.
>>>        >>
>>>        >> At the moment we have a concrete problem with explaining dom0less and
>>>        >> hyperlaunch to potential new users. Using two different names for a
>>>        >> similar feature on arm and x86 causes confusion. It is hurting Xen as a
>>>        >> solution. Personally I already had to switch to use the word
>>>        >> "hyperlaunch" for everything in my users-facing presentations.
>>>        >>
>>>        >> At the summit, we discussed that it would be a good idea to use a single
>>>        >> name to refer to both features on arm and x86. Given that "dom0less"
>>>        >> causes additional issues because it makes people think that there is no
>>>        >> Dom0, the suggestion was to use "hyperlaunch" to refer to both features.
>>>        >>
>>>        >> We don't need to 100% align the two implementations and data structures.
>>>        >> This is not for engineers that are going to look at the specifications
>>>        >> and improve them. This is for users/customers of Xen that are trying to
>>>        >> understand what the hypervisor enables them to do. We need to be able to
>>>        >> show users architecture slides with the same name and explanation on
>>>        >> both ARM and x86.
>>>        >>
>>>        >> I am sure that Daniel and Christopher remember, but for the others on
>>>        >> this email thread, the name "hyperlaunch" was born exactly to be that:
>>>        >> the one name to cover both features on ARM and x86 even if they have a
>>>        >> different implementation. Appended an old email for reference.
>>>        >>
>>>        >> Also I agree with Daniel that we need to be careful about the two docs
>>>        >> under docs/. I think he is right we need to add a paragraph explaining
>>>        >> the history and a pointer to the other document. Something like:
>>>        >>
>>>        >> "Dom0less is the name that was used when initially introducing the
>>>        >> feature on ARM. Then, the "dom0less" name was retired in favor of
>>>        >> "hyperlaunch" to avoid confusion (a Dom0 might still be present) and to
>>>        >> align with x86 (where a similar feature was called hyperlaunch from the
>>>        >> start)."
>>>        >
>>>        > I’m fully ok to add a section like this pointing to the Hyperlaunch design.
>>>
>>>        _If_ this text is added, please include links/references to the Hyperlaunch wiki page and Hyperlaunch design docs.
>>>
>>>        > @Daniel and @Christopher would it be ok for you or the changes in the serie
>>>        > are going to be problematic for your future work? In the end it’s just a mechanical
>>>        > rename, so I guess we just need to agree on naming conventions.
>>>
>>>        Please see the history of trademark litigation about the use of symbolic names to reference similar-but-different artifacts.
>>>        It is much easier to use the same name to refer to entirely different objects. Historically, confusion arises when a name is
>>>        used in similar contexts.
>>>
>>>        There is also versioning.  Could we refer to dom0less as "Hyperlaunch Version -1"?
>>>
>>>        How about renaming dom0less to "Hyperlaunch Lite"?
>>>
>>>
>>> Perhaps it would be helpful if you could explain more clearly your concerns.  I take it that you want a name which can be used specifically
>>> to indicate the full "domB measured boot" functionality that was Daniel and Christopher's original goal, and that you're afraid that using
>>> plain "Hyperlaunch" for only the "start VMs from Xen on boot" functionality will dilute that?
>>>
>>> The "start VMs from Xen on boot" functionality is the *only* thing that a big chunk of the users of this functionality want;  referring to
>>> it as "Hyperlaunch Lite" or "Hyperlaunch -1" will undermine the value of the functionality.
>>>
>>> What if we use "Measured Hyperlaunch", or "Hyperlaunch Measured Boot" to refer to the full measured boot functionality?
>>
>> I think this is the best way.
>>
>>
>>> Or, "Hyperlaunch DT" for "Booting VMs from Xen using Device Tree" (without the involvement of a domB), "Hyperlaunch Boot Domain /
>>> Hyperlaunch domB" for a more general "domB" functionality, and "Hyperlaunch Measured Boot" for the full functionality (assuming there's
>>> more to this than simply having a domB involved)?
>>
>>
>> We need an overarching name to cover the feature "start VMs from Xen on
>> boot" on both ARM and x86. From my understanding and from the original
>> emails on the subject, the name "hyperlaunch" was it.
>>
>> Sure; but think "guitar" vs "acoustic guitar" vs "electric guitar".  "Electric guitar" is new, "guitar" covers them both, but you sometimes need a way to specify "acoustic".  Right now target configurations we're talking about include:
>>
>> 1. Booting all your domains directly from Xen using DT configurations
>> 2. Booting a domB, which then executes some more complicated programmatic configuration to launch VMs before disappearing
>> 3. Doing full measured boot on the whole system using a domB.
>>
>> If "Hyperlaunch" means 1-3, we not only need a way to specify that you're talking about 3, but *also* a way to specify that you're talking about 1.  In the vast majority of cases for the foreseeable future are going to be 1.  Additionally, we want to make sure that "Hyperlaunch" *actually* turns out to mean 1-3, and not just 1.
>>
>> The thing I like about "Hyperlaunch DT" is that to me it sounds pretty cool but also is very descriptive: I haven't talked to people building these systems, but it seems like saying, "The hypervisor launches VMs based on a Device Tree passed to it at boot" will be immediately understood, and stick in people's minds.
> 
> Personally, I like the name “Hyperlaunch DT”, because it tells me that we are launching VMs and the DT is involved, if I understood correctly the design,
> it would be the same also on x86 (and in every architecture that will come later) so being “Hyperlaunch DT” an arch agnostic name makes it a good
> candidate for phase out dom0less name and for the future when a common code will use the DT to launch VMs at Xen boot.

I assume that DT means Device-Tree here. If so, I find a name a bit 
misleading because we are talking about the way to pass the 
configuration rather than what the feature is doing.

My assumption here is that a DomB solution would still use the 
Device-Tree to describe the domains.

Cheers,

-- 
Julien Grall

