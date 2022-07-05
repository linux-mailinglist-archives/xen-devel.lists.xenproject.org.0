Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BC8566716
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 11:52:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360699.590134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8fE0-0000tS-Tk; Tue, 05 Jul 2022 09:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360699.590134; Tue, 05 Jul 2022 09:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8fE0-0000ql-Qq; Tue, 05 Jul 2022 09:52:08 +0000
Received: by outflank-mailman (input) for mailman id 360699;
 Tue, 05 Jul 2022 09:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWfX=XK=citrix.com=prvs=1787b3430=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o8fDz-0000qf-JF
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 09:52:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f74aff1-fc48-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 11:52:05 +0200 (CEST)
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
X-Inumbo-ID: 1f74aff1-fc48-11ec-a8e4-439420d8e422
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657014725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0OZgWbX3Z4laFHJRntrRBS1Y1NcUpD4ge4AzoKJG7ok=;
  b=fmz1vv4obVCbl2KDqLt2/h904Qi+OZVVC7Vt/FtMioBmTjbUkEwROXej
   sNfUpphTM04nrjNzu6rOqfu+FBrdzS3US9rWpJL+78u5yeWTiz8ji0akg
   ZWlovxb/SLZD8cuMdUHbXi4/bjLV6qc5BQONWP6OsMyGzh3NDAtFmvX4N
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 77650235
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:jdXj1aP5SbNZpsDvrR2ll8FynXyQoLVcMsEvi/4bfWQNrUomhTIAn
 2UXWT+Eb/6KYWrzcot2YYTjpE9QsZOAnYU1TAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZm2tMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z7
 +5Nv56fRycSHpKdxb0wQydUHjt1MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRQqiDP
 5BCNFKDajyfMwdiJXgeS6tiu9mEhn7afjxHul288P9fD2/7k1UqjemF3MDuUuOHRIN+nkuej
 mvc+iLyBRRyHMOb4SqI9DSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLp3A
 UEO5jAnq6R00UWxV8T8RDWxunvCtRkZM/J0DuYzri+EzKHZ5wKELmEeS3hKb9lOiSMtbWV0j
 BnTxYqvXGEx9u3OIZ6AyluKhRSJOSIXAmEiXg87HFZczsndrIwphR2aG76PD5WJYs3J9SDYm
 m7X8nZl1uRC1KbnxI3gowmZ3mvESozhC1dsu16JBj/NAhZRPtbNWmC+1bTMAR+sxq69R0LJg
 nULktP2AAsmXcDUz3zlrAng8diUCxe53N702wcH82EJrWjFxpJaVdk4DMtCDEloKN0YXjTif
 VXevwhcjLcKYib0PPImM9vgV5xzpUQFKTgCfqmNBuein7ArLFPXlM2QTRT4M5/RfLgEzvhkZ
 MbznTeEBncGE6V3pAeLqxMm+eZznEgWnDqLLbiilkjP+efPPxa9FOZaWGZim8hktctoVi2Oq
 4YBXyZLoj0CONDDjt7/qNJMcwlXdSJkXfgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc3h9/gsQw
 kyAZw==
IronPort-HdrOrdr: A9a23:0zvK3qB5uaEqdBPlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.92,245,1650945600"; 
   d="scan'208";a="77650235"
Date: Tue, 5 Jul 2022 10:51:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH] tools/helpers: fix snprintf argument in init-dom0less.c
Message-ID: <YsQJtoPCdwm3oBAe@perard.uk.xensource.com>
References: <20220629124938.26498-1-luca.fancellu@arm.com>
 <4DB9F3AE-0BCC-45BA-9934-0304FBF84E82@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4DB9F3AE-0BCC-45BA-9934-0304FBF84E82@arm.com>

On Mon, Jul 04, 2022 at 03:32:08PM +0000, Bertrand Marquis wrote:
> Hi Luca,
> 
> > On 29 Jun 2022, at 13:49, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
> > 
> > Fix snprintf argument in init-dom0less.c because two instances of
> > the function are using libxl_dominfo struct members that are uint64_t
> > types, so change "%lu" to "%"PRIu64 to handle it properly when
> > building on arm32 and arm64.
> > 
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

