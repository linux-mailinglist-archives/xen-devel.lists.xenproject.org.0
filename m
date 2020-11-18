Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D814C2B7595
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 06:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29337.58663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfFkq-0002JU-43; Wed, 18 Nov 2020 05:11:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29337.58663; Wed, 18 Nov 2020 05:11:40 +0000
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
	id 1kfFkp-0002JC-Tv; Wed, 18 Nov 2020 05:11:39 +0000
Received: by outflank-mailman (input) for mailman id 29337;
 Wed, 18 Nov 2020 05:11:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sH5o=EY=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1kfFko-0002J7-Mc
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 05:11:38 +0000
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce0ca390-75cf-4278-bc02-42c9bbc3f84b;
 Wed, 18 Nov 2020 05:11:37 +0000 (UTC)
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
 (envelope-from <andy@strugglers.net>)
 id 1kfFkj-0007kk-Nj; Wed, 18 Nov 2020 05:11:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sH5o=EY=strugglers.net=andy@srs-us1.protection.inumbo.net>)
	id 1kfFko-0002J7-Mc
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 05:11:38 +0000
X-Inumbo-ID: ce0ca390-75cf-4278-bc02-42c9bbc3f84b
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ce0ca390-75cf-4278-bc02-42c9bbc3f84b;
	Wed, 18 Nov 2020 05:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com; s=alpha;
	h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=N2+2+l5W3BApAH8eEzLL4aB4J2YcCxUUhW6wjo/KqgM=;
	b=n5f6TKpiPS0jh/IwZboS11xoxj6EVzAo+PcfMrwusaBLx2K4Lqh3qL5j/ut1fVHCivaXr0IW1wWwzdEILlJQYcSZba5U8Ij42WLz2D4SyLvAchG4XyBxz9ZpOrhld7Eo6H15W6mJLXcTedFeInZW4eDpPrLZONIQGwb7+tB+FH0X5XhLDR9pg/ub0FEEivPE/ctL9Cqky5Z3MwCZdtwE5+V4KLr1aJ3pWjfiwrowhfk8doeBOJVwXMWJQrxt+Pb7bSa8X3dyizoXq1Q//LGqv8PWyPaaXToXv/yWttVrCGmrW4j/XnNseD1tUBnFyUmGoy0VNJj/U6anUtzftCF35g==;
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
	(envelope-from <andy@strugglers.net>)
	id 1kfFkj-0007kk-Nj; Wed, 18 Nov 2020 05:11:33 +0000
Date: Wed, 18 Nov 2020 05:11:33 +0000
From: Andy Smith <andy@strugglers.net>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Michael Young <m.a.young@durham.ac.uk>, xen-devel@lists.xenproject.org
Subject: Re: zstd compressed kernels
Message-ID: <20201118051133.GV16071@bitfolk.com>
References: <1abcd9d-428f-93d-b63d-996ef4592723@austen3.home>
 <71d36766-1258-0a79-02ff-d888a41e431e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71d36766-1258-0a79-02ff-d888a41e431e@citrix.com>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

On Tue, Nov 17, 2020 at 08:48:25PM +0000, Andrew Cooper wrote:
> For domU's, tools/libs/guest/xg_dom_bzimageloader.c and
> xc_dom_probe_bzimage_kernel()
> 
> (Wow this plumbing is ugly and in need of some rationalisation...)

Though not part of Xen, the PV part of grub could also do with some
love as it is also missing lz4 kernel support. This is particularly
painful since Ubuntu switched to lz4 kernels from the 19.10 release.

I understand from Jürgen though that grub's PVH support just uses
the normal i386 loader so if grub supports a bzImage on bare metal
it should do so with PVH, so that's an option. Certainly that works
for lz4 anyway.

Cheers,
Andy

