Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996E2A82E7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 17:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19903.45397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kahgy-0007Ff-GA; Thu, 05 Nov 2020 16:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19903.45397; Thu, 05 Nov 2020 16:00:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kahgy-0007FG-Cu; Thu, 05 Nov 2020 16:00:52 +0000
Received: by outflank-mailman (input) for mailman id 19903;
 Thu, 05 Nov 2020 16:00:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kahgx-0007FB-5Q
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 16:00:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ef9137a-4b1f-4f5c-933c-55065bd2630e;
 Thu, 05 Nov 2020 16:00:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A048CAB4C;
 Thu,  5 Nov 2020 16:00:49 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N0uV=EL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kahgx-0007FB-5Q
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 16:00:51 +0000
X-Inumbo-ID: 6ef9137a-4b1f-4f5c-933c-55065bd2630e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6ef9137a-4b1f-4f5c-933c-55065bd2630e;
	Thu, 05 Nov 2020 16:00:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604592049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QnSmKXuUvQC0v84Z/vr73YbP+4gA75cbChIWCXLpeiI=;
	b=MHj6Kq8E14/D6+HbMg4T22qsbktj3J2mj7Zg/JShRnJtXci2+XVxw6+FGex6oLwdk+Vv96
	+VwvPpPoLfBtPS83MJDN5XINRLztavKpzuT55XDRyZf6mInY8AovN9I8Tbzz1e3rpdgVnD
	Zeyi2zV7DB16q/7uPq+ZgjJjA/zmGJ0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A048CAB4C;
	Thu,  5 Nov 2020 16:00:49 +0000 (UTC)
Subject: Re: [ANNOUNCE] Call for agenda items for 5 November 2020 Community
 Call @ 16:00 UTC
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <948CC2D7-B53D-48CD-879B-6C0DDE0B1EE2@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50195240-8375-5f9b-d5b7-2a89ec8c99d0@suse.com>
Date: Thu, 5 Nov 2020 17:00:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <948CC2D7-B53D-48CD-879B-6C0DDE0B1EE2@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.10.2020 15:47, George Dunlap wrote:
> Hi all,
> 
> The proposed agenda is in https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/ and you can edit to add items.  Alternatively, you can reply to this mail directly.
> 
> Agenda items appreciated a few days before the call: please put your name besides items if you edit the document.
> 
> Note the following administrative conventions for the call:
> * Unless, agreed in the pervious meeting otherwise, the call is on the 1st Thursday of each month at 1600 British Time (either GMT or BST)
> * I usually send out a meeting reminder a few days before with a provisional agenda
> 
> * To allow time to switch between meetings, we'll plan on starting the agenda at 16:05 sharp.  Aim to join by 16:03 if possible to allocate time to sort out technical difficulties &c
> 
> * If you want to be CC'ed please add or remove yourself from the sign-up-sheet at https://cryptpad.fr/pad/#/2/pad/edit/D9vGzihPxxAOe6RFPz0sRCf+/
> 
> Best Regards
> George
> 
> 
> 
> == Dial-in Information ==
> ## Meeting time
> 16:00 - 17:00 UTC
> Further International meeting times: https://www.timeanddate.com/worldclock/meetingdetails.html?year=2020&month=11&day=5&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
> 
> 
> ## Dial in details
> Web: https://www.gotomeet.me/GeorgeDunlap
> 
> You can also dial in using your phone.
> Access Code: 168-682-109
> 
> China (Toll Free): 4008 811084
> Germany: +49 692 5736 7317

FYI: This number continues to not work.

Jan

