Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67015348CD7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 10:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101349.193792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPMIJ-0000lV-3M; Thu, 25 Mar 2021 09:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101349.193792; Thu, 25 Mar 2021 09:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPMII-0000l0-Vx; Thu, 25 Mar 2021 09:28:46 +0000
Received: by outflank-mailman (input) for mailman id 101349;
 Thu, 25 Mar 2021 09:28:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWHm=IX=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1lPMII-0000je-7c
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 09:28:46 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 595761af-4e95-4cc0-8c96-0a784fdb6d17;
 Thu, 25 Mar 2021 09:28:41 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 12P9SWEX000942;
 Thu, 25 Mar 2021 10:28:32 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 0389927E3; Thu, 25 Mar 2021 10:28:32 +0100 (CET)
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
X-Inumbo-ID: 595761af-4e95-4cc0-8c96-0a784fdb6d17
Date: Thu, 25 Mar 2021 10:28:31 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
        Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 4/6] CHANGELOG.md: NetBSD lib/gnttab support
Message-ID: <YFxXvyF4j32uTa5S@antioche.eu.org>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-4-george.dunlap@citrix.com>
 <YFxUJwF45F1HD2jU@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YFxUJwF45F1HD2jU@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Thu, 25 Mar 2021 10:28:32 +0100 (MET)

On Thu, Mar 25, 2021 at 10:13:11AM +0100, Roger Pau Monné wrote:
> On Wed, Mar 24, 2021 at 04:44:05PM +0000, George Dunlap wrote:
> > Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> 
> LGTM, maybe Manuel has something else to add.

no, it's OK for me too

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

