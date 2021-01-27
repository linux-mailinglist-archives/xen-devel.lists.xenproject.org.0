Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC1306400
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 20:29:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76356.137747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qVO-0002C0-NY; Wed, 27 Jan 2021 19:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76356.137747; Wed, 27 Jan 2021 19:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4qVO-0002Bb-KK; Wed, 27 Jan 2021 19:29:30 +0000
Received: by outflank-mailman (input) for mailman id 76356;
 Wed, 27 Jan 2021 19:29:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOO2=G6=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4qVN-0002BW-2o
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 19:29:29 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a645bf5d-1d9c-4168-a8bf-d4d414040d4e;
 Wed, 27 Jan 2021 19:29:26 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10RJTOMF016698;
 Wed, 27 Jan 2021 20:29:24 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10RJTNsl007027;
 Wed, 27 Jan 2021 20:29:24 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 16B477218; Wed, 27 Jan 2021 20:29:22 +0100 (MET)
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
X-Inumbo-ID: a645bf5d-1d9c-4168-a8bf-d4d414040d4e
Date: Wed, 27 Jan 2021 20:29:22 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: Introduce locking functions
Message-ID: <20210127192922.GA26055@mail.soc.lip6.fr>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-3-bouyer@antioche.eu.org>
 <24593.36178.400654.382841@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24593.36178.400654.382841@mariner.uk.xensource.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 27 Jan 2021 20:29:25 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Wed, Jan 27, 2021 at 03:57:06PM +0000, Ian Jackson wrote:
> Manuel Bouyer writes ("[PATCH] NetBSD hotplug: Introduce locking functions"):
> > From: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > On NetBSD, some block device configuration requires serialisation.
> > Introcuce locking functions, and use them in the block script where
> > appropriate.
> 
> Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

thanks, but I submitted a v2 patch which uses a locking.sh derived
from the linux one, based on your feedback.
Should I add your Reviewed-by to the v2 ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

