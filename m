Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDD304481
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 18:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75348.135649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RmH-00010D-5Y; Tue, 26 Jan 2021 17:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75348.135649; Tue, 26 Jan 2021 17:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4RmH-0000zt-23; Tue, 26 Jan 2021 17:05:17 +0000
Received: by outflank-mailman (input) for mailman id 75348;
 Tue, 26 Jan 2021 17:05:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BegI=G5=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l4RmF-0000zm-Dr
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 17:05:15 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcd64700-d33a-4823-ad29-e2c4f272d0cb;
 Tue, 26 Jan 2021 17:05:14 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10QH58FT017832;
 Tue, 26 Jan 2021 18:05:08 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 91586281D; Tue, 26 Jan 2021 18:05:08 +0100 (CET)
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
X-Inumbo-ID: bcd64700-d33a-4823-ad29-e2c4f272d0cb
Date: Tue, 26 Jan 2021 18:05:08 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH] libs/gnttab: implement on NetBSD
Message-ID: <20210126170508.GC8309@antioche.eu.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-12-bouyer@antioche.eu.org>
 <20210118175411.lvokghuyvmremdwh@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118175411.lvokghuyvmremdwh@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Tue, 26 Jan 2021 18:05:09 +0100 (MET)

On Mon, Jan 18, 2021 at 06:54:11PM +0100, Roger Pau Monné wrote:
> On Tue, Jan 12, 2021 at 07:12:32PM +0100, Manuel Bouyer wrote:
> > From: Manuel Bouyer <bouyer@netbsd.org>
> > 
> > Implement gnttab interface on NetBSD.
> > The kernel interface is different from FreeBSD so we can't use the FreeBSD
> > version
> 
> Since I'm not familiar with the NetBSD interface I can provide much
> feedback, but you have some hard tabs in the code below which should
> be removed.
> 
> Maybe you would like to be added as a maintainer for the tools NetBSD
> files?

Yes, please.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

