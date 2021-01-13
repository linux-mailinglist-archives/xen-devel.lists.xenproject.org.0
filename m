Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16732F47B8
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 10:40:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66382.117862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzcdS-0005Bc-04; Wed, 13 Jan 2021 09:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66382.117862; Wed, 13 Jan 2021 09:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzcdR-0005BF-TM; Wed, 13 Jan 2021 09:40:13 +0000
Received: by outflank-mailman (input) for mailman id 66382;
 Wed, 13 Jan 2021 09:40:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dbz/=GQ=lip6.fr=manuel.bouyer@srs-us1.protection.inumbo.net>)
 id 1kzcdQ-0005BA-63
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 09:40:12 +0000
Received: from isis.lip6.fr (unknown [2001:660:3302:283c::2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c902c08a-b78a-40d1-8c43-cad69ffc027c;
 Wed, 13 Jan 2021 09:40:11 +0000 (UTC)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 10D9e5IO018207;
 Wed, 13 Jan 2021 10:40:05 +0100 (CET)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.14.4) with ESMTP id 10D9e5hQ024011;
 Wed, 13 Jan 2021 10:40:05 +0100 (MET)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id 0B0897218; Wed, 13 Jan 2021 10:40:04 +0100 (MET)
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
X-Inumbo-ID: c902c08a-b78a-40d1-8c43-cad69ffc027c
Date: Wed, 13 Jan 2021 10:40:04 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Christian Lindig <christian.lindig@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] ocaml/libs/eventchn: drop unneeded evtchn.h
Message-ID: <20210113094004.GA13488@mail.soc.lip6.fr>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-19-bouyer@antioche.eu.org>
 <MWHPR03MB244513C9BE100B2F07DF337BF6A90@MWHPR03MB2445.namprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MWHPR03MB244513C9BE100B2F07DF337BF6A90@MWHPR03MB2445.namprd03.prod.outlook.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 13 Jan 2021 10:40:06 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2

On Wed, Jan 13, 2021 at 09:22:38AM +0000, Christian Lindig wrote:
> Acked-by: Christian Lindig <christian.lindig@citrix.com>

thanks. What should I do now, submit a new patch with this tag, or just wait
for it to be commited ?

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

