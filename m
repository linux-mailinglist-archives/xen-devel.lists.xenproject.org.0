Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854684655BA
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 19:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236195.409691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msUau-0004BF-Nz; Wed, 01 Dec 2021 18:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236195.409691; Wed, 01 Dec 2021 18:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msUau-00049L-JR; Wed, 01 Dec 2021 18:44:40 +0000
Received: by outflank-mailman (input) for mailman id 236195;
 Wed, 01 Dec 2021 18:44:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msUas-00049B-Hv
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:44:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msUas-00028Y-HA
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:44:38 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1msUas-0006Pt-GH
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 18:44:38 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1msUaq-0007p0-CJ; Wed, 01 Dec 2021 18:44:36 +0000
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
	d=xenproject.org; s=20200302mail; h=Subject:CC:To:Date:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=Tncl+L5L9W21/UcEddn+RWjWVah62Omz46wS+/cdsMk=; b=cJ6DD/DEypXcimGBcsSyolCMmr
	tckHIkQs6XS8161tlnS3ashkoIXaZRQ1OE1oMF89PZYH1SvSOQmB0nOjQYqkGxuvxIlvSo4I9N6IH
	ejwu8T2igKmVKEjUpjc8aZcFpweFMjyE3Snx4UJ0vFH8my62LS8X7dsBV5tMTcLwqCdU=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24999.49811.516694.793307@mariner.uk.xensource.com>
Date: Wed, 1 Dec 2021 18:44:35 +0000
To: xen-devel@lists.xenproject.org
CC: committers@xenproject.org,
    community.manager@xenproject.org
Subject: Xen 4.16 release party, Cambridge
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

We will shortly release Xen 4.16.0.  Some of us will be celebrating in
person in Cambridge: in the pub, next Thursday (9th December).

We'll be at the Haymakers [1], in the gazebo, from 17:00.
  https://www.individualpubs.co.uk/haymakers/
  https://www.openstreetmap.org/way/131306510

In addition, I am leaving Citrix after 12 years working on Xen.
I'll be inviting colleagues from Citrix to come and see me off.

Please join us.  Ideally, please RSVP to me at the address above.
I will book a table and an idea of numbers would be very helpful.
Please RSVP *by 1800 UTC* on Monday (6th December).

The gazebo is covered, but reasonably well ventilated, so we can stay
dry.  Please be vaccinated (subject to availability and medical
advice).  If you are unvaccinated by choice, please stay away this
time, and then I hope to see you at some other point in the future.

Ian.
(Relevantly, Xen 4.16 Release Manager and ian.jackson@citrix.com)

[1] Holding a Cambridge Xen party at the Haymakers is traditional, but
I need to disclose a financial interest: I own shares in Individual
Pubs Ltd, who own the Haymakers.

