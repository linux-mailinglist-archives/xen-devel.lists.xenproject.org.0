Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4BF3F5F54
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 15:38:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171391.312755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWdH-0004XH-Ku; Tue, 24 Aug 2021 13:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171391.312755; Tue, 24 Aug 2021 13:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIWdH-0004Ub-Gx; Tue, 24 Aug 2021 13:38:27 +0000
Received: by outflank-mailman (input) for mailman id 171391;
 Tue, 24 Aug 2021 13:38:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mIWdG-0004UV-J9
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:38:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mIWdG-0004D6-Ch
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:38:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mIWdG-0003fd-BW
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 13:38:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mIWdB-0004HP-Dg; Tue, 24 Aug 2021 14:38:21 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Zhz1TK2nUhctPQlmY+EvQnCrkdyL3JeXcPuuN2WXYKs=; b=POaSfrk5fjVxy7OgBzRtJnJexj
	gtJhuOsdXdF7lY/CAd1KP1yAs7sAorvjo+6p6PB32ulOevJjNvvDlxGa6fKcnbnjpdTsFLDhdmtNn
	9Yp6bcRSOee0rmV33K1z7dqrKk6f30h0OQ1GTTNSsFYs4z/Yyhi/KQ+8RyDXgjb0L880=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24868.63053.121473.979573@mariner.uk.xensource.com>
Date: Tue, 24 Aug 2021 14:38:21 +0100
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
    xen-devel@lists.xenproject.org,
    George Dunlap <George.Dunlap@citrix.com>,
    committers@xenproject.org
Subject: Re: Xen 4.16: Proposed release manager and schedule
In-Reply-To: <db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
	<5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
	<24862.31351.137596.242803@mariner.uk.xensource.com>
	<db112874-eb0a-c9ad-4509-6d048b056038@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: Xen 4.16: Proposed release manager and schedule"):
> On 19/08/2021 16:36, Ian Jackson wrote:
> > One option is to slip the whole release, in the expectation (hope!) of
> > collecting more input.  In practical terms because of the impact of
> > Christmas and New Year on many of our contributors, a month's slip now
> > is probably more like two months' slip to the release.  So arguably
> > for this to be worth it, we ought to plan to slip 2 months now and
> > release in February.
> 
> A 2 months slip looks appealling to get more features. But it means we 
> will end up to split all the future releases.

No, it wouldn't, really.  Our usual release interval is 9 months.
9+2 = 11, so the result would be a one month longer release, if we
delayed this one by 2 months.  In practice it is always a bit of a
struggle to keep things to time (that's the way things are set up with
this system) so I think this is well within our usual tolerances.

For the avoidance of doubt, I am not arguing in favour of this option.
But I wanted to present it as a reasonable option the community might
want to consider.

Jan, do you have an opnion about this ?  Do you expect that a 2-3
month slip would help with your review backlog, bearing in mind the
people who are currently on leave and when they'll be back ?

If no-one wishes to argue in favour of the longer slip I think we
should go with the normal plan.

> At the moment, my preference is to stick with the release in December. 
> We don't have major contributions checked in yet on Arm, but there is a 
> chance to have a couple of them with the current schedule on Arm.
> 
> We also have a collection of bug fixes which makes Arm running better on 
> some platform.
> 
> So I think the release would still be worthwhile even in the worst case 
> where nothing major is merged.

Thanks for the opinion.


Can I at least get a +1 from someone for appointing me as RM
for 4.16 ? :-)

Thanks,
Ian.

