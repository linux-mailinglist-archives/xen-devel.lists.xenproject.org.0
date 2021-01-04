Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0E92E9BE2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 18:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61412.108050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTXZ-0001y1-9q; Mon, 04 Jan 2021 17:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61412.108050; Mon, 04 Jan 2021 17:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTXZ-0001xc-6m; Mon, 04 Jan 2021 17:21:09 +0000
Received: by outflank-mailman (input) for mailman id 61412;
 Mon, 04 Jan 2021 17:21:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwTXX-0001xX-60
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 17:21:07 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cee7cbc-f540-4056-897a-8bb17fffaf1a;
 Mon, 04 Jan 2021 17:21:05 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne
 [IPv6:2001:41d0:fe9d:1100:221:70ff:fe0c:9885])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104HKugL021759;
 Mon, 4 Jan 2021 18:20:56 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 0974D281D; Mon,  4 Jan 2021 18:20:55 +0100 (CET)
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
X-Inumbo-ID: 9cee7cbc-f540-4056-897a-8bb17fffaf1a
Date: Mon, 4 Jan 2021 18:20:55 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 07/24] Remove NetBSD's system headers. We'll use the
 system-provided ones, which are up to date.
Message-ID: <20210104172055.GA645@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-8-bouyer@netbsd.org>
 <20201229114638.yegfswyqzhz7tj25@Air-de-Roger>
 <20210104102552.GC2005@antioche.eu.org>
 <20210104170907.hrj4aa6u4hjvidhu@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210104170907.hrj4aa6u4hjvidhu@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [IPv6:2001:41d0:fe9d:1100:a00:20ff:fe1c:276e]); Mon, 04 Jan 2021 18:20:57 +0100 (MET)

On Mon, Jan 04, 2021 at 06:09:07PM +0100, Roger Pau Monné wrote:
> We usually take a different approach for Linux and FreeBSD in
> order to support all kernels: test if the new ioctl is available, or
> else fallback to the old implementation. But this requires having the
> new header even on old systems in order to have the ioctl definition
> for the build, even if it's not implemented on the currently running
> kernel.
> 
> I guess you would have to use preprocessor conditionals in order to
> keep the build on older versions when adding the new features.

Or just assume that version X of Xen needs version Y of NetBSD.
This is already the case, because of bug fixes.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

