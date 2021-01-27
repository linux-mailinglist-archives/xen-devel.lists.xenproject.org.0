Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70C305749
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:47:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75887.136804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hQM-0007VU-Nx; Wed, 27 Jan 2021 09:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75887.136804; Wed, 27 Jan 2021 09:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4hQM-0007Ux-KP; Wed, 27 Jan 2021 09:47:42 +0000
Received: by outflank-mailman (input) for mailman id 75887;
 Wed, 27 Jan 2021 09:47:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOO2=G6=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1l4hQL-0007Ui-9b
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:47:41 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6d79ed5-8834-47a7-a47b-668f2d90fa17;
 Wed, 27 Jan 2021 09:47:40 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10R9lX8F001532;
 Wed, 27 Jan 2021 10:47:34 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10R9lXkk028249;
 Wed, 27 Jan 2021 10:47:33 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 508D57218; Wed, 27 Jan 2021 10:47:33 +0100 (MET)
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
X-Inumbo-ID: a6d79ed5-8834-47a7-a47b-668f2d90fa17
Date: Wed, 27 Jan 2021 10:47:33 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH] NetBSD hotplug: fix block unconfigure on destroy
Message-ID: <20210127094733.GB22565@mail.soc.lip6.fr>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-4-bouyer@antioche.eu.org>
 <20210115152712.njzgo2zqpiwyhmds@Air-de-Roger>
 <20210126164749.GA8309@antioche.eu.org>
 <20210127094043.lkccsom63xswygio@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210127094043.lkccsom63xswygio@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 27 Jan 2021 10:47:34 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Wed, Jan 27, 2021 at 10:40:43AM +0100, Roger Pau Monné wrote:
> That's weird. Linux hotplug script will unconditionally read the
> params node and we had no complaints there. Can you assert this still
> happens with the latest version of Xen?

It does with Xen 4.13 for sure. 

> 
> As said I think fetching vnd on detach is fine because there's no need
> to fetch the other nodes, but this seems to be masking some kind of
> error elsewhere.

My priority is to get the patches in at this point. Each round takes me
hours to get them in shape.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

