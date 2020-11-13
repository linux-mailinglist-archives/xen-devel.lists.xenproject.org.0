Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A962B1F6C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 17:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26739.55211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdbVG-0003tV-E7; Fri, 13 Nov 2020 16:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26739.55211; Fri, 13 Nov 2020 16:00:46 +0000
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
	id 1kdbVG-0003t6-B1; Fri, 13 Nov 2020 16:00:46 +0000
Received: by outflank-mailman (input) for mailman id 26739;
 Fri, 13 Nov 2020 16:00:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZ2H=ET=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kdbVE-0003sz-Lw
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 16:00:44 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbd86e06-fe96-41c0-a164-130a4c41145e;
 Fri, 13 Nov 2020 16:00:42 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ADG0aTX014346
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 17:00:37 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 858AC2E9CA8; Fri, 13 Nov 2020 17:00:31 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rZ2H=ET=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kdbVE-0003sz-Lw
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 16:00:44 +0000
X-Inumbo-ID: fbd86e06-fe96-41c0-a164-130a4c41145e
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fbd86e06-fe96-41c0-a164-130a4c41145e;
	Fri, 13 Nov 2020 16:00:42 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ADG0aTX014346
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 13 Nov 2020 17:00:37 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 858AC2E9CA8; Fri, 13 Nov 2020 17:00:31 +0100 (MET)
Date: Fri, 13 Nov 2020 17:00:31 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
Message-ID: <20201113160031.GA3512@antioche.eu.org>
References: <20201112155715.GA5003@antioche.eu.org>
 <20201112163240.6xswol2iswikdzef@Air-de-Roger>
 <20201112172704.GA5899@antioche.eu.org>
 <20201112201939.be6ztg2iipwa6hkb@Air-de-Roger>
 <20201113115457.GD1512@antioche.eu.org>
 <20201113143349.gehu36wsipvpkrt7@Air-de-Roger>
 <20201113151428.GE1512@antioche.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113151428.GE1512@antioche.eu.org>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 13 Nov 2020 17:00:38 +0100 (MET)

On Fri, Nov 13, 2020 at 04:14:28PM +0100, Manuel Bouyer wrote:
> I can try a kernel without this driver, to see if other devices reports
> interrupt.

This didn't change anything, I don't get more interrupts with this driver
commented out.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

