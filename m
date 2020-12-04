Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469532CF7B7
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 00:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45121.80611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klKu1-0002oA-Us; Fri, 04 Dec 2020 23:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45121.80611; Fri, 04 Dec 2020 23:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klKu1-0002nk-Re; Fri, 04 Dec 2020 23:54:17 +0000
Received: by outflank-mailman (input) for mailman id 45121;
 Fri, 04 Dec 2020 23:54:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gNFP=FI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1klKu0-0002nb-8R
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 23:54:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38e12b43-c637-48a7-b068-6383b2eff31a;
 Fri, 04 Dec 2020 23:54:15 +0000 (UTC)
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
X-Inumbo-ID: 38e12b43-c637-48a7-b068-6383b2eff31a
Date: Fri, 4 Dec 2020 15:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607126054;
	bh=6qbAfoHGBHocQsedYQyTCKTMdHTb6QYUplQTl2cKNi4=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=ZhH4VYEGTnpZguj/9y6T2lOccw9QjMm06TdTOHsTHmDrxQo+p0eq9Xm71QCZZJm1y
	 10cmg8nsvgjl+bW3wfY/Nw61SyRuC8GW2mVaYgk7+2qieZm8zz3PdWqW0L46CuBGQD
	 3dGU6So6h+KnBefLTNihMZahQdS9+mBh2J9EZXOM0tyZkl7wo82zox8kXub5k40HHw
	 cFCHKCoOFZyBlLUwBnk9c4dplxp1NZ0UUBTG6pOmHG6LCw47NOcqwmuSrdGAcBW9vj
	 xrnwz2VwocEChqCX5sMiV2Hq+GrnVscrTlUluIbrKYOxpaPdAN2d4KEZlAJIvRkgRv
	 tZQsLHbJ8FRAw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Bertrand Marquis <bertrand.marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 2/7] xen/arm: Add arm64 ID registers definitions
In-Reply-To: <87zh2y7gm0.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.2012041553240.32240@sstabellini-ThinkPad-T480s>
References: <cover.1606742184.git.bertrand.marquis@arm.com> <83f4e52dce23d2e83f6118e5ecb3cef22112f9e9.1606742184.git.bertrand.marquis@arm.com> <87zh2y7gm0.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Nov 2020, Volodymyr Babchuk wrote:
> Bertrand Marquis writes:
> 
> > Add coprocessor registers definitions for all ID registers trapped
> > through the TID3 bit of HSR.
> > Those are the one that will be emulated in Xen to only publish to guests
> > the features that are supported by Xen and that are accessible to
> > guests.
> >
> > Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > Changes in V2: rebase
> > ---
> >  xen/include/asm-arm/arm64/hsr.h | 37 +++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/xen/include/asm-arm/arm64/hsr.h b/xen/include/asm-arm/arm64/hsr.h
> > index ca931dd2fe..e691d41c17 100644
> > --- a/xen/include/asm-arm/arm64/hsr.h
> > +++ b/xen/include/asm-arm/arm64/hsr.h
> > @@ -110,6 +110,43 @@
> >  #define HSR_SYSREG_CNTP_CTL_EL0   HSR_SYSREG(3,3,c14,c2,1)
> >  #define HSR_SYSREG_CNTP_CVAL_EL0  HSR_SYSREG(3,3,c14,c2,2)
> >  
> > +/* Those registers are used when HCR_EL2.TID3 is set */
> > +#define HSR_SYSREG_ID_PFR0_EL1    HSR_SYSREG(3,0,c0,c1,0)
> > +#define HSR_SYSREG_ID_PFR1_EL1    HSR_SYSREG(3,0,c0,c1,1)
> > +#define HSR_SYSREG_ID_PFR2_EL1    HSR_SYSREG(3,0,c0,c3,4)
> > +#define HSR_SYSREG_ID_DFR0_EL1    HSR_SYSREG(3,0,c0,c1,2)
> > +#define HSR_SYSREG_ID_DFR1_EL1    HSR_SYSREG(3,0,c0,c3,5)
> > +#define HSR_SYSREG_ID_AFR0_EL1    HSR_SYSREG(3,0,c0,c1,3)
> > +#define HSR_SYSREG_ID_MMFR0_EL1   HSR_SYSREG(3,0,c0,c1,4)
> > +#define HSR_SYSREG_ID_MMFR1_EL1   HSR_SYSREG(3,0,c0,c1,5)
> > +#define HSR_SYSREG_ID_MMFR2_EL1   HSR_SYSREG(3,0,c0,c1,6)
> > +#define HSR_SYSREG_ID_MMFR3_EL1   HSR_SYSREG(3,0,c0,c1,7)
> > +#define HSR_SYSREG_ID_MMFR4_EL1   HSR_SYSREG(3,0,c0,c2,6)
> > +#define HSR_SYSREG_ID_MMFR5_EL1   HSR_SYSREG(3,0,c0,c3,6)
> > +#define HSR_SYSREG_ID_ISAR0_EL1   HSR_SYSREG(3,0,c0,c2,0)
> > +#define HSR_SYSREG_ID_ISAR1_EL1   HSR_SYSREG(3,0,c0,c2,1)
> > +#define HSR_SYSREG_ID_ISAR2_EL1   HSR_SYSREG(3,0,c0,c2,2)
> > +#define HSR_SYSREG_ID_ISAR3_EL1   HSR_SYSREG(3,0,c0,c2,3)
> > +#define HSR_SYSREG_ID_ISAR4_EL1   HSR_SYSREG(3,0,c0,c2,4)
> > +#define HSR_SYSREG_ID_ISAR5_EL1   HSR_SYSREG(3,0,c0,c2,5)
> > +#define HSR_SYSREG_ID_ISAR6_EL1   HSR_SYSREG(3,0,c0,c2,7)
> > +#define HSR_SYSREG_MVFR0_EL1      HSR_SYSREG(3,0,c0,c3,0)
> > +#define HSR_SYSREG_MVFR1_EL1      HSR_SYSREG(3,0,c0,c3,1)
> > +#define HSR_SYSREG_MVFR2_EL1      HSR_SYSREG(3,0,c0,c3,2)
> > +
> > +#define HSR_SYSREG_ID_AA64PFR0_EL1   HSR_SYSREG(3,0,c0,c4,0)
> > +#define HSR_SYSREG_ID_AA64PFR1_EL1   HSR_SYSREG(3,0,c0,c4,1)
> > +#define HSR_SYSREG_ID_AA64DFR0_EL1   HSR_SYSREG(3,0,c0,c5,0)
> > +#define HSR_SYSREG_ID_AA64DFR1_EL1   HSR_SYSREG(3,0,c0,c5,1)
> > +#define HSR_SYSREG_ID_AA64ISAR0_EL1  HSR_SYSREG(3,0,c0,c6,0)
> > +#define HSR_SYSREG_ID_AA64ISAR1_EL1  HSR_SYSREG(3,0,c0,c6,1)
> > +#define HSR_SYSREG_ID_AA64MMFR0_EL1  HSR_SYSREG(3,0,c0,c7,0)
> > +#define HSR_SYSREG_ID_AA64MMFR1_EL1  HSR_SYSREG(3,0,c0,c7,1)
> > +#define HSR_SYSREG_ID_AA64MMFR2_EL1  HSR_SYSREG(3,0,c0,c7,2)
> > +#define HSR_SYSREG_ID_AA64AFR0_EL1   HSR_SYSREG(3,0,c0,c5,4)
> > +#define HSR_SYSREG_ID_AA64AFR1_EL1   HSR_SYSREG(3,0,c0,c5,5)
> > +#define HSR_SYSREG_ID_AA64ZFR0_EL1   HSR_SYSREG(3,0,c0,c4,4)
> > +
> >  #endif /* __ASM_ARM_ARM64_HSR_H */
> >  
> >  /*
> 
> 
> -- 
> Volodymyr Babchuk at EPAM

