Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5434C3F1CF0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 17:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168905.308457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGk5k-0004Sp-Ow; Thu, 19 Aug 2021 15:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168905.308457; Thu, 19 Aug 2021 15:36:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGk5k-0004PM-LR; Thu, 19 Aug 2021 15:36:28 +0000
Received: by outflank-mailman (input) for mailman id 168905;
 Thu, 19 Aug 2021 15:36:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGk5i-0004PG-QE
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 15:36:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGk5i-0002aS-Nc
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 15:36:26 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mGk5i-0005dw-Md
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 15:36:26 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mGk5f-000287-DA; Thu, 19 Aug 2021 16:36:23 +0100
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
	bh=iD8F9g+Qhymb1AvgV+01Y41A36faXzVbEUVpUitSXyI=; b=EQd6L4u+fG+tcvATRbris6FU1s
	/m0hjhdl/+bhmmEjjVIhLc54oG4noo7K9B/8Ew17aZk9p+QIAmJT9C8QiyUN/p8o2edIRJ8RzpDEQ
	mtuFKadXmUgU8N08kulLre9z8Hm+n35PoNItZyIgWeBLp+p4wPqILI3idz+yd9iAbJJw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24862.31351.137596.242803@mariner.uk.xensource.com>
Date: Thu, 19 Aug 2021 16:36:23 +0100
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
    George Dunlap <George.Dunlap@citrix.com>,
    committers@xenproject.org
Subject: Re: Xen 4.16: Proposed release manager and schedule
In-Reply-To: <5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
References: <24861.8902.217023.673705@mariner.uk.xensource.com>
	<5198b3ce-8a7c-a5b1-4ddd-f2052e1d4181@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("Re: Xen 4.16: Proposed release manager and schedule"):
> On 18.08.2021 17:09, Ian Jackson wrote:
> > ** DRAFT **
> > 
> >   Friday 17th September                 Last posting date
> > 
> >     Patches adding new features should be posted to the mailing list
> >     by this cate, although perhaps not in their final version.
> >     (3 weeks)
> 
> Without meaning this to express any opposition to the proposed schedule,
> I'd like to point out that as of mid July there's been unusually little
> changes getting committed. The above leaves less than a month (plus the
> 3 weeks of until feature freeze); at the present rate this would mean
> about no further (larger) changes.

Thanks for your reply.  I recognise the problems you describe.
From my pov as (putative) RM it is difficult to see what could
constructively be done about this situation.

One option is to slip the whole release, in the expectation (hope!) of
collecting more input.  In practical terms because of the impact of
Christmas and New Year on many of our contributors, a month's slip now
is probably more like two months' slip to the release.  So arguably
for this to be worth it, we ought to plan to slip 2 months now and
release in February.

Some of the thinness of this release in particular relates to an
unusual combination of substantial leave taken by many key
contributors, so maybe this is a thing we should consider.
Even my proposing this schedule was rather late, in part for those
reasons.

I don't personally have a strong opinion about the right decision.
But if we are intending to release in December, I think something like
my proposed schedule is probably about right.  Perhaps it could be
compressed a bit due to the lack of major contributions so far.

I would love to hear other opinions.

Ian.

