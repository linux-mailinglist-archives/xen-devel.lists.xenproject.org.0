Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9B02B1E9D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 16:27:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26675.55117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdayl-0007gL-Q7; Fri, 13 Nov 2020 15:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26675.55117; Fri, 13 Nov 2020 15:27:11 +0000
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
	id 1kdayl-0007fw-MX; Fri, 13 Nov 2020 15:27:11 +0000
Received: by outflank-mailman (input) for mailman id 26675;
 Fri, 13 Nov 2020 15:27:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rZ2H=ET=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kdayk-0007fr-8w
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:27:10 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3732ce84-e327-4226-8af4-3d09026eed3c;
 Fri, 13 Nov 2020 15:27:09 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ADFR3Bh003574
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 13 Nov 2020 16:27:04 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 4B9ED2E9CA8; Fri, 13 Nov 2020 16:26:58 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rZ2H=ET=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kdayk-0007fr-8w
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 15:27:10 +0000
X-Inumbo-ID: 3732ce84-e327-4226-8af4-3d09026eed3c
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3732ce84-e327-4226-8af4-3d09026eed3c;
	Fri, 13 Nov 2020 15:27:09 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ADFR3Bh003574
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 13 Nov 2020 16:27:04 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 4B9ED2E9CA8; Fri, 13 Nov 2020 16:26:58 +0100 (MET)
Date: Fri, 13 Nov 2020 16:26:58 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: dom0 PVH: 'entry->arch.pirq != INVALID_PIRQ' failed at vmsi.c:843
Message-ID: <20201113152658.GH1512@antioche.eu.org>
References: <20201112155715.GA5003@antioche.eu.org>
 <20201112163240.6xswol2iswikdzef@Air-de-Roger>
 <20201112172704.GA5899@antioche.eu.org>
 <20201112201939.be6ztg2iipwa6hkb@Air-de-Roger>
 <20201113115457.GD1512@antioche.eu.org>
 <20201113143513.5mvfb4tyczyo2rwx@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113143513.5mvfb4tyczyo2rwx@Air-de-Roger>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 13 Nov 2020 16:27:04 +0100 (MET)

On Fri, Nov 13, 2020 at 03:35:13PM +0100, Roger Pau Monné wrote:
> Forgot to mention, it might also be helpful to boot Xen with
> iommu=debug, just in case.

I put the serial console log at
http://www-soc.lip6.fr/~bouyer/xen-log2.txt
in case it helps

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

