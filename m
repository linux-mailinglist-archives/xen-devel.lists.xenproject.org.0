Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90B77B6C6
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 12:35:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583535.913770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVUuG-0001N8-3U; Mon, 14 Aug 2023 10:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583535.913770; Mon, 14 Aug 2023 10:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVUuF-0001KR-WD; Mon, 14 Aug 2023 10:34:40 +0000
Received: by outflank-mailman (input) for mailman id 583535;
 Mon, 14 Aug 2023 10:34:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmUR=D7=citrix.com=prvs=5834829d3=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qVUuE-00014s-MM
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 10:34:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 290e6ed7-3a8e-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 12:34:36 +0200 (CEST)
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
X-Inumbo-ID: 290e6ed7-3a8e-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692009276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=54eVl5tp67GYsQNN8HVOxtzzG1ohJSsMGo7h1IcTFXk=;
  b=ItYqVeoGw9WozqaOkztnK+i55pb2pBMh4k8A+LyQi2aJQuruUVO2unKi
   yt/EP5ZBbMlpGgm+4pnuMgrEzu3nMU1P2vAp8Rnn3c6zPRJ2ZdWellnrm
   KTYA/octbaxKDyPII8skFvFIU2xV66ufsf75ZV/rb3qrZ7pVPVNm1yIbP
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 119294902
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:v65L9KlXE8wAdtS2BBNTs2fo5gyxJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdWmmEPKmLNGWgLtp2PYSx/BsEvJWDxtQ1TAA6/C0zQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgb5QOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 e0eKGAKaD/ZvMuRxOO3U7FHquAoMfC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQth/B9
 ziXozWhWHn2MvSy9gqMyjGeiNXRgA3kdq8KF7243/V11Qj7Kms7V0RNCArTTeOCokyxQdVEM
 GQP5zEj66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLgtfoCDpHoLCTD3WH+d+8pCu/IyEPIUceZCUPSk0O5NyLnW0opkuRFJA5Svfz14CrX2iqm
 FhmsRTSmZ0Ci85b0KOUp2vupDb9qoGRZSIR7RjuCzfNAhxCWKapYImh6F7+5PlGLZqEQlTpg
 EXoi/Ry/8hVU8jTyXXlrPElWejwuq3baGG0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5yYCl/iI+TfNDKq8gj9yjn9ZLVbvwc2WTRTMt10BaWB1+U3FB
 b+VcNy3EVERArl9wTy9So81iOF6n3FjnD2PGcyik3xLNIZyg1bPFd843KamNLhlvMtoXi2Em
 zqgCyd640oGC7CvCsUm2YUSMUoLPRAG6WPe8qRqmhq4ClM+QgkJUqaBqY7NjqQ5x8y5YM+Up
 CDiMqKZoXKj7UD6xfKiMCA8Oe2zAc8i9RrW/0UEZD6V5pTqWq73hI93Snf9VeBPGDBLpRKsc
 8Q4Rg==
IronPort-HdrOrdr: A9a23:0arLCqvdww3m1N+k+/5hRVzW7skDpNV00zEX/kB9WHVpm5qj5r
 yTddAgpGTJYVEqKQkdcLG7SdC9qBbnn6KdjrNhXotKMDOHhILsFvAG0WKA+UyHJ8SdzJ8+6U
 46SdkFNDSYNzET5voSojPId+rIq+P3l5xA692+815dCSl3dqd64x59Gm+gYzBLrcp9aabR1q
 Dw2iOKnVWdkL0sAPiGOg==
X-Talos-CUID: =?us-ascii?q?9a23=3AMrn5FGuM7hMyT/iV09gCoI1C6Is0dH2Ny3H/eXS?=
 =?us-ascii?q?RLmI4RKTNYnO0875dxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AzVjfhQzU9DdnLmoGrZBOQTwAyZeaqImROEk10qc?=
 =?us-ascii?q?IgdeZGzNeFi+ejDSeSZByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.01,172,1684814400"; 
   d="scan'208";a="119294902"
Date: Mon, 14 Aug 2023 11:34:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH v4 18/19] tools/config: add XEN_RUN_STORED to config.h
Message-ID: <afcc7e49-1e7b-4b62-9b2c-97f3b7784ad3@perard>
References: <20230814074707.27696-1-jgross@suse.com>
 <20230814074707.27696-19-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230814074707.27696-19-jgross@suse.com>

On Mon, Aug 14, 2023 at 09:47:06AM +0200, Juergen Gross wrote:
> Instead of adding the definition of XEN_RUN_STORED to CFLAGS in
> multiple Makefiles, let configure add it to tools/config.h instead.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

I think with this change, you could probably remove XEN_RUN_STORED from
"config/Paths.mk.in".

In any case, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

