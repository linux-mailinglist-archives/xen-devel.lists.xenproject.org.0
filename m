Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E89A64BAF8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 18:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460980.718999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p595G-0002TD-7X; Tue, 13 Dec 2022 17:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460980.718999; Tue, 13 Dec 2022 17:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p595G-0002RD-4s; Tue, 13 Dec 2022 17:28:50 +0000
Received: by outflank-mailman (input) for mailman id 460980;
 Tue, 13 Dec 2022 17:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TMzb=4L=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1p595E-0002R7-Bu
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 17:28:49 +0000
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97aafae4-7b0b-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 18:28:46 +0100 (CET)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35694)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1p5956-0007O7-04; Tue, 13 Dec 2022 17:28:40 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1p5951-0006c0-Lf; Tue, 13 Dec 2022 17:28:35 +0000
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
X-Inumbo-ID: 97aafae4-7b0b-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+gHcL0GavN66hEyQQto3Gxp/s7JccGCmVE4ksMartuc=; b=svtedpfrmgRz4xaWewVFJm/yqD
	yqeYYjNiqllJeWMYVvO+hGpYRaoRLiwtrOCkBuiaN5D4ma8GagYKR/y3usItIh61p4SRs5FuOTCmv
	K8B84LSgkFMmRSUZ2fPjpdcZv3X6Hn/skU4RME/va+fXJ1nHlrdxCbWA302/9209llsZdYYnH2hCG
	31l2qENg7yJ/X4MPoWpN3r7S8mCGzzA4pIL9d9i9N0BUqOKUya3gsoEpFW3ZgFJea5M4wIMJas0Ck
	18jb1tkQO3d2LE8fn0MTcre9vD/rvQuVYxGY4my9+yKPCVkbhkqLLIRKFkFGGBf7cX9HKwGkyp5Ug
	Xc51TFIA==;
Date: Tue, 13 Dec 2022 17:28:35 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Seija K." <doremylover123@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] arch: change variable types to match those of what is
 assigned to them
Message-ID: <Y5i2Q+wcl3S2JFg4@shell.armlinux.org.uk>
References: <CAA42iKzgsHDC5b+nUyiH8TV0od8LjGp4G-WRyamB=NYtoDtMMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA42iKzgsHDC5b+nUyiH8TV0od8LjGp4G-WRyamB=NYtoDtMMw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Dec 13, 2022 at 12:03:51PM -0500, Seija K. wrote:
> There are many places where "int len = strlen(foo);" is written, just
> for len to be passed as a parameter of size_t. This causes truncation
> and then expansion back from int to size_t. Not to mention this is
> poor logic and needless truncations can add extra unneeded
> instructions.
> This patch aims to fix the worst offenders.

I didn't bother looking too closely as the patch has been severely
mangled. I think you need to reconsider how you send patches and
find a way to test before you send emails to mailing lists.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

