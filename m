Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D693098BD
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 00:08:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79118.144079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5zLQ-0003O6-U7; Sat, 30 Jan 2021 23:07:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79118.144079; Sat, 30 Jan 2021 23:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5zLQ-0003Nh-R2; Sat, 30 Jan 2021 23:07:56 +0000
Received: by outflank-mailman (input) for mailman id 79118;
 Sat, 30 Jan 2021 23:07:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bcvp=HB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1l5zLP-0003Nc-AP
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 23:07:55 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1e2fb99-3ee9-4652-9a5e-2b29a7f9251b;
 Sat, 30 Jan 2021 23:07:54 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 10UN7jED023480;
 Sun, 31 Jan 2021 00:07:45 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 6153B281D; Sun, 31 Jan 2021 00:07:45 +0100 (CET)
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
X-Inumbo-ID: e1e2fb99-3ee9-4652-9a5e-2b29a7f9251b
Date: Sun, 31 Jan 2021 00:07:45 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
        Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] libs/light: pass some infos to qemu
Message-ID: <20210130230745.GA6221@antioche.eu.org>
References: <20210126224800.1246-1-bouyer@netbsd.org>
 <20210126224800.1246-12-bouyer@netbsd.org>
 <YBKbEhavZlpD75fU@Air-de-Roger>
 <20210129104653.GG2015@antioche.eu.org>
 <YBQhHuEF4U9wHHry@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YBQhHuEF4U9wHHry@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Sun, 31 Jan 2021 00:07:47 +0100 (MET)

On Fri, Jan 29, 2021 at 03:52:14PM +0100, Roger Pau Monné wrote:
> 
> Right, but the default script provided will do bridging mode only, and
> even if you add 'script=vif-ip' to the network configuration line it
> won't do what you expect. Instead it will try to add the tap network
> interface to the default xenbr0 bridge.
> 
> I'm not opposed to having it this way right now, as it's better to
> have this than no support at all, but we should have the shortcoming
> documented somewhere. Can be done as a separate patch.

I just sent a v3, with a patch to xl-network-configuration.5.pod

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

