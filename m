Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38AF64BB4F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 18:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461011.719035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p59LN-0006Zs-Iy; Tue, 13 Dec 2022 17:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461011.719035; Tue, 13 Dec 2022 17:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p59LN-0006Wt-G5; Tue, 13 Dec 2022 17:45:29 +0000
Received: by outflank-mailman (input) for mailman id 461011;
 Tue, 13 Dec 2022 17:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TMzb=4L=armlinux.org.uk=linux+xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1p59LM-0006Wn-IY
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 17:45:28 +0000
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed9bea97-7b0d-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 18:45:27 +0100 (CET)
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35696)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1p59LJ-0007QC-0d; Tue, 13 Dec 2022 17:45:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1p59LH-0006d0-Vw; Tue, 13 Dec 2022 17:45:23 +0000
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
X-Inumbo-ID: ed9bea97-7b0d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z0omR0ISWAA4du1XKL80E5Cf5YbDXbqPmELEAXHKvQo=; b=oEeJCQRTr3YsEUk4WlvGuWYrWO
	MmgYaL2cPSShnoGVDBLrFUmnaAJapVRvgMNLCrsoAysmkulQQV4JNQduZVticVd/l67BlfPCFan9k
	f1+BrhK5ZSCAnpthmveiFJ98zTsYarYTTx0k/YplqYLnItSSIKOaEDd8YVlNZYwaj3svQY+v4oWSD
	U7NRAB78y4u6BCMR4ymIphcrEeh8QShAKSOyxoCfl7Ossfcyr0FzXNe4kjTXAep8YvaEV1g7MJaDg
	riGz3On3drqZLxqx99C5PN6peFFhyj0WB08lrEgaWCAZC0CoH6w4f/xDLKcHvhVD8/Y4g4pEAnYPT
	669iiaiA==;
Date: Tue, 13 Dec 2022 17:45:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Seija K." <doremylover123@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH] arch: change variable types to match those of what is
 assigned to them
Message-ID: <Y5i6M/9XEr0zvenj@shell.armlinux.org.uk>
References: <CAA42iKx2f2LsAQ9C5rxnCTPhOB6n+L35Winc5WK1K2EySAjvXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA42iKx2f2LsAQ9C5rxnCTPhOB6n+L35Winc5WK1K2EySAjvXA@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Dec 13, 2022 at 12:35:35PM -0500, Seija K. wrote:
> There are many places where "int len = strlen(foo);" is written, just
> for len to be passed as a parameter of size_t. This causes truncation
> and then expansion back from int to size_t. Not to mention this is
> poor logic and needless truncations can add extra unneeded
> instructions.
> 
> This patch aims to fix the worst offenders.

I suggested to test _not_ on the mailing lists, because it adds
unnecessary noise - and remember that your email needlessly gets
sent to thousands of recipients.

Yet again, the patch is mangled, but is better than the last one.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

