Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F469739E84
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 12:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553492.864073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCHTS-0004co-5L; Thu, 22 Jun 2023 10:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553492.864073; Thu, 22 Jun 2023 10:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCHTS-0004an-2f; Thu, 22 Jun 2023 10:23:34 +0000
Received: by outflank-mailman (input) for mailman id 553492;
 Thu, 22 Jun 2023 10:23:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KQdr=CK=citrix.com=prvs=530e6dbed=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qCHTQ-0004ah-SS
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 10:23:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d481f040-10e6-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 12:23:30 +0200 (CEST)
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
X-Inumbo-ID: d481f040-10e6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687429410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=25h0k3i1feSXgqFdMTGzVDHE1FNVLGTHPKpp0OibsJ8=;
  b=YzUv0esdSSXdFrsKqWTdGUloTW6PUMTgIiutorSdRZpj7tUCdVQVdDq7
   HUheEtpkh/J1FpDGsEfZnB65312O2oExHbYDDiIyV83jy9HzFnbWEVSRr
   +D55eTwKKHsKD5VXWKXR12+hj1zEXICj4xUyIFe22FOjNAqN1MGdQxPSF
   E=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113617169
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:3NohD6wwUDD5na5qj516t+fmxirEfRIJ4+MujC+fZmUNrF6WrkUEn
 WQWUT/XP/jeM2XxKNxyb47n9BhQvZCDx4QySQZppSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgP6oT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KT9H2
 PwicQxdVy+albqkxp+8QPtLpv12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMxRjB+
 TuYrgwVBDlBGsKn2GCE3k7xj/TCsCHdY5gUH5yRo6sCbFq7mTVIVUx+uUGAifuzh1O6WtlfA
 1cJ4Sdopq83nGSpR9/xRQylo1aLuxcdX5xbFOhSwAOQzqvZ5S6JC25CSSROAPQ9r9M/TzEu0
 l6PnvvqCCZpvbnTTmiSnp+LqRuiNC5TKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWr7wLgNQCzamT4VHNiDXqrZ/MJjPZ/S2OADjjtFkgItf4OcrxswOzAet8wJixEFCsv
 EJdp5in0/kcVYOLuSuHUsItJeT8jxqaCwEwkWKDDrF4qWTyoCDzI9wAiN1tDBw3a5hZIFcFd
 GeW4FoMv8ELYRNGeIctO+qM59IWIb8M/DgPftTddZJwb5d4b2drFwk+NBfLjwgBfKXB+JzT2
 Kt3ku72Vx728Yw9kFKLqx41iNfHPBwWy2LJXozcxB+6y7eYb3P9Ye5bYATVMbpjvPvZ+1S9H
 zNj2y2ikU43vArWOHO/zGLuBQpScShT6W7e9aS7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 ijVZ6Os83Km3SevAVzTOhhehEbHAc4XQYQTYXZ9Yj5FGhELPe6S0UvoX8FnI+F4qrA9kq4co
 jtsU5zoP8mjgw/vo1w1BaQRZqQ4HPh3rWpi5xaYXQU=
IronPort-HdrOrdr: A9a23:MscrIKD0Cugz+CHlHeky55DYdb4zR+YMi2TDtnoQdfUxSKelfq
 +V8sjzuSWE8Qr5O0tOpfmlNLObSX3RsbRx6ZMKVI3SPjUO2lHIEGgK1+KLqVCNJ8SZzJ8h6U
 4JSdkENDTeNykdsS+Q2njBLz9P+qj4zImYwcvY0ndxXUVLRshbnnZE4k3yKDwNeOA8P+tbKL
 OsovBp4xKrc3gMdK2Adx44dtmGnfKOsJ79exYJCzQj4BOV5AnYjYLSIlyj8VMjSDMn+8ZHzY
 EdqX2E2kx0iYDF9iPh
X-Talos-CUID: 9a23:kTyy4G1q9grwrvpYepWht7xfRMkIckeE8CfpHFaqUXRvZbqfW3iwwfYx
X-Talos-MUID: 9a23:dL/BaAvy+S4S7/9/T82n3x98DNYy4oiSVUkWnLgEnfKeMydREmLI
X-IronPort-AV: E=Sophos;i="6.00,263,1681185600"; 
   d="scan'208";a="113617169"
Date: Thu, 22 Jun 2023 11:23:18 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jandryuk@gmail.com>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH 1/3] build: define ARCH and SRCARCH later
Message-ID: <5fa2229d-0b0e-413b-9dce-51bea8f3a88a@perard>
References: <20230621161959.1061178-1-anthony.perard@citrix.com>
 <20230621161959.1061178-2-anthony.perard@citrix.com>
 <f7d9e5a9-993a-89dd-3026-3b59f9b52bb5@citrix.com>
 <28d92bf2-5157-665f-9c91-9112dc8892dc@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <28d92bf2-5157-665f-9c91-9112dc8892dc@suse.com>

On Thu, Jun 22, 2023 at 10:15:42AM +0200, Jan Beulich wrote:
> On 21.06.2023 18:25, Andrew Cooper wrote:
> > On 21/06/2023 5:19 pm, Anthony PERARD wrote:
> >> +
> >> +ARCH := $(XEN_TARGET_ARCH)
> >> +SRCARCH := $(shell echo $(ARCH) | \
> >> +          sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> >> +              -e s'/riscv.*/riscv/g')
> >> +export ARCH SRCARCH
> >> +
> >>  export TARGET_SUBARCH  := $(XEN_TARGET_ARCH)
> >>  export TARGET_ARCH     := $(shell echo $(XEN_TARGET_ARCH) | \
> >>                              sed -e 's/x86.*/x86/' -e s'/arm\(32\|64\)/arm/g' \
> > 
> > The change looks plausible to fix this issue, but could we take the
> > opportunity to dedup the sed expression into a $(call src-arch ...) or so ?
> > 
> > Except, given that ARCH := $(XEN_TARGET_ARCH) now, doesn't that mean
> > SRCARCH is always TARGET_ARCH ?
> > 
> > Can't we simplify this to just be plain aliases?
> 
> Or, putting it differently, do we actually need both TARGET_* values
> when they match other (exported) variables anyway?

Sounds good to me, I can remove both TARGET_* variables.

Thanks,

-- 
Anthony PERARD

