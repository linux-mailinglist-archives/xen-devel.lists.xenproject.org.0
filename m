Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E12C8217
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:26:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40789.73721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgNd-0007ss-HO; Mon, 30 Nov 2020 10:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40789.73721; Mon, 30 Nov 2020 10:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgNd-0007sT-Dx; Mon, 30 Nov 2020 10:26:01 +0000
Received: by outflank-mailman (input) for mailman id 40789;
 Mon, 30 Nov 2020 10:25:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjgNb-0007sM-MT
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:25:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64067815-f0e1-448f-bbb2-91688457eef9;
 Mon, 30 Nov 2020 10:25:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 358C8AC91;
 Mon, 30 Nov 2020 10:25:58 +0000 (UTC)
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
X-Inumbo-ID: 64067815-f0e1-448f-bbb2-91688457eef9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606731958; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dBEF1eJeXnriytUNl9lwc1WRag97wA2VNUJqIUxwYDY=;
	b=OxF3xbjx7qQfha/QRMYoAUSP8aGCPmdKeAFoYWTDi19BKMWTDgXPyUFZKUIB7kPDWu4Y4T
	jXv3NVpa06QraMTo2FiSeRIVBegcRD+dp+JJgCvkJmXraJBFsPZB7aRyzpxbpRjRdXF6Yg
	Tlshyeudfc11GfnOyZNak44kxLFyqp0=
Subject: Re: [ANNOUNCE] Call for agenda items for December 2020 Community Call
 @ 16:00 UTC
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
References: <6A1AC739-EB53-4996-A99B-EE68358E70DB@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6da4cd56-7364-bc6e-24d8-02976dbd637d@suse.com>
Date: Mon, 30 Nov 2020 11:25:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6A1AC739-EB53-4996-A99B-EE68358E70DB@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 27.11.2020 12:52, George Dunlap wrote:
> The proposed agenda is in https://cryptpad.fr/pad/#/2/pad/edit/OPN55rXaOncupuWuHxtddzWJ/ and you can edit to add items.  Alternatively, you can reply to this mail directly.

The "New series / series requiring attention" section is gone. Was
this intentional? If not, I would have wanted to propose that items
from that list which we didn't get to on the previous call be
automatically propagated. According to my observation it is more
likely than not that nothing would have changed in their status.
Hence it may be easier to take one off the list if indeed it has
got unstalled.

> == Dial-in Information ==
> ## Meeting time
> 16:00 - 17:00 UTC
> Further International meeting times: https://www.timeanddate.com/worldclock/meetingdetails.html?year=2020&month=12&day=3&hour=16&min=0&sec=0&p1=1234&p2=37&p3=224&p4=179
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

From last month's meeting:

   Germany: +49 721 9881 4161

Jan

