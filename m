Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903DD53ADA5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 22:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340780.565890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwUwc-0002hk-A5; Wed, 01 Jun 2022 20:27:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340780.565890; Wed, 01 Jun 2022 20:27:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwUwc-0002f4-6u; Wed, 01 Jun 2022 20:27:54 +0000
Received: by outflank-mailman (input) for mailman id 340780;
 Wed, 01 Jun 2022 20:27:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L9V=WI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nwUwa-0002ek-5n
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 20:27:52 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d9f2572-e1e9-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 22:27:50 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 35869B81985;
 Wed,  1 Jun 2022 20:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DA0C385B8;
 Wed,  1 Jun 2022 20:27:45 +0000 (UTC)
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
X-Inumbo-ID: 4d9f2572-e1e9-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654115266;
	bh=mSmM2+7GRV4+/0dAzKlo87gel3iDbQlAbmki+vKiF6E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l8s3AkTdah2m0bxUpiOYsuMpbealnOFc9MRKhSmAhzJgncpSuS+YrstHaI3tss9eh
	 ySf/GqGp5ACqr9yVQrJbe3vjkibWmeIrTWTOdOspBmG+HKjNyjreGQWztO36m7rFny
	 aTOLsXElaW2vej4mbxsG1p6Ak7ncfQNAaBRJ5asxgBVEqGr+XHnHyJsW/i2sWcn1T1
	 muQ6YYgKBDbF0WDNVmHk9sO5N/pg32qcf2rFLDZIYKFW6WVXtMZP4pjuQ8i9RHO4Xi
	 h12IDANhHsw6xCjpdTBbdzT/v6fGCF+cHUhTUsFArd9uJsrmwNXeIGkPmmOCnkX6Wt
	 Dpyr83trwi2JA==
Date: Wed, 1 Jun 2022 13:27:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: George Dunlap <George.Dunlap@citrix.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, jbeulich@suse.com, 
    Andrew.Cooper3@citrix.com, julien@xen.org, Bertrand.Marquis@arm.com, 
    fusa-sig@lists.xenproject.org
Subject: Re: MOVING COMMUNITY CALL Call for agenda items for 9 June Community
 Call @ 1500 UTC
In-Reply-To: <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2206011324400.1905099@ubuntu-linux-20-04-desktop>
References: <CC75A251-2695-4E9E-95A7-043874B22F32@citrix.com> <alpine.DEB.2.22.394.2206010942010.1905099@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Reducing CC and adding fusa-sig

Actually Jun 9 at 8AM California / 4PM UK doesn't work for some of you,
so it is either:
1) Jun 9 at 7AM California / 3PM UK
2) Jun 14 at 8AM California / 4PM UK

My preference is the first option because it is sooner but let me know
if it doesn't work and we'll try the second option.



On Wed, 1 Jun 2022, Stefano Stabellini wrote:
> Hi all,
> 
> I would like to suggest to have the MISRA C meeting just before the
> community call (7AM California time). If it is difficult for any of the
> must-have attendees, then I would like to ask to reserve 30 minutes of
> the community call to make progress on MISRA.
> 
> Cheers,
> 
> Stefano
> 
> 
> On Wed, 1 Jun 2022, George Dunlap wrote:
> > Hi all,
> > 
> > Sorry for sending this out so late; my calendar was screwed up.  Due to it being a public holiday in the UK, I propose moving the monthly community call to NEXT THURSDAY, 9 June, same time.
> > 
> > The proposed agenda is in https://cryptpad.fr/pad/#/2/pad/edit/URCDNNBOVKsEK2grXf2l954a/ and you can edit to add items.  Alternatively, you can reply to this mail directly.
> > 
> > Agenda items appreciated a few days before the call: please put your name besides items if you edit the document.
> > 
> > Note the following administrative conventions for the call:
> > * Unless, agreed in the pervious meeting otherwise, the call is on the 1st Thursday of each month at 1600 British Time (either GMT or BST)
> > * I usually send out a meeting reminder a few days before with a provisional agenda
> > 
> > * To allow time to switch between meetings, we'll plan on starting the agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate time to sort out technical difficulties &c
> > 
> > * If you want to be CC'ed please add or remove yourself from the sign-up-sheet at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
> > 
> > Best Regards
> > George
> > 
> > 
> > 
> > == Dial-in Information ==
> > ## Meeting time
> > 15:00 - 16:00 UTC
> > Further International meeting times: https://www.timeanddate.com/worldclock/meetingdetails.html?year=2022&month=06&day=9&hour=15&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
> > 
> > 
> > ## Dial in details
> > Web: https://meet.jit.si/XenProjectCommunityCall
> > 
> > Dial-in info and pin can be found here:
> > 
> > https://meet.jit.si/static/dialInInfo.html?room=XenProjectCommunityCall
> > 
> 

