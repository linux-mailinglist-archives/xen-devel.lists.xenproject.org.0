Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6C84C8B6A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:20:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281324.479610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1US-0003Gm-6l; Tue, 01 Mar 2022 12:20:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281324.479610; Tue, 01 Mar 2022 12:20:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1US-0003EY-3Q; Tue, 01 Mar 2022 12:20:28 +0000
Received: by outflank-mailman (input) for mailman id 281324;
 Tue, 01 Mar 2022 12:20:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWoc=TM=citrix.com=prvs=05201426e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nP1UR-0003ES-33
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:20:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f88dc28b-9959-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:20:25 +0100 (CET)
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
X-Inumbo-ID: f88dc28b-9959-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646137225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K+M57JmbFWzBV5opLBEASvneUAOtiGXhgVOGDtf1NNA=;
  b=Q3GJsSOtmolKcaeNdVZZbufA9cf8LrkT0C+Cjp7I98yMGLGj0abaD/8B
   ylH+cDsUTRFwrfuiUTKtiJE/26fQ+nUtHObCurY8rLPfUnJW0jxUDS/7u
   2lBfWXij54Q/pVEiwADcZgS3UrdIwWDzjvpTQ3Zomm1igOzoivNCVmdlN
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65211002
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PtWV0qOsMDyim+nvrR25l8FynXyQoLVcMsEvi/4bfWQNrUon0WRTy
 2QbC2GAPK6MZjGkeI0nb4m0pBsC6p+GzYc1Swto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi2tcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 sgQmoS/dgESPfP2xeIPCRtDQwxEFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQKyHP
 pJBM1KDajzickZDJlhGGqg4ws2ap2f5IhZ0tVe88P9fD2/7k1UqjemF3MDuUseRWcxfk0Kcp
 2TH12f0GBcXMJqY0zXt2nmlnOPIkAvwUZgeE7D+/flv6HWDy2pWBBAIWF+TpfiillX4S99ZM
 1YT+Cclse417kPDZsb5dw21pjiDpBF0ZjZLO7RkskfXkPOSulvHQDhfJtJcVDA4nNErGBMy2
 WCPpNC3P2FpoueXUiKwzJ7B+FteJhMpBWMFYCYFSy4M7N/ivJw/g3rzczpzLEKmpoarQG+tm
 lhmuAB73uxO1pBTi81X6Hia22rEm3TfcuIiCuw7tEqB5xgxWoOqbpfABbPzvacZd9bxorVsU
 RE5dymiAAImUMnleM+lGrxl8FSVCxCtamW0bblHRcRJythV0yT/Fb28GRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPErPdruUJp2lPG5RLwJs8w4iPIUOfCdkyfdoUlTibO4hTixwCDAb4llU
 XtkTSpcJSlDUvk2pNZHb+wczaUq1kgDKZD7HvjGI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI9QDBxU6KKmOh5E2Gn9owM/tr1E
 riGchcw4DLCabfvcG1mtlgLhGvTYKtC
IronPort-HdrOrdr: A9a23:yF1F5q7kR5GTYRhLYgPXwMjXdLJyesId70hD6qhwISY6TiW9rb
 HLoB17726QtN9/YhwdcLy7VJVoBEmskqKdgrNhX4tKPjOHhILAFugLhuHfKn/bak7DH4ZmpM
 FdmsNFaeEYY2IUsfrH
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65211002"
Date: Tue, 1 Mar 2022 12:20:20 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>, "Doug
 Goldstein" <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 0/3] automation: auto-build container, check
 generated file
Message-ID: <Yh4PhEXI7RIc5tad@perard.uk.xensource.com>
References: <20220301121133.19271-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220301121133.19271-1-anthony.perard@citrix.com>

On Tue, Mar 01, 2022 at 12:11:30PM +0000, Anthony PERARD wrote:
> Patch series available in this git branch:
> https://xenbits.xen.org/git-http/people/aperard/xen-unstable.git br.gitlab-ci-build-container-v1
> 
> I wanted to automatically check that generated files that we have in our repo
> are up-to-date, those are autoconf and *.gen.go files generataed from
> libxl_types.idl. But this can only be check on debian stable. So new container,
> and I look at building the new container from the CI.
> 
> The second patch depends on some changes to our GitLab runner:
>     https://gitlab.com/xen-project/xen-gitlab-ci/-/merge_requests/15
> I've already apply the changes to one runner, for testing.
> 
> The new debian:stable container is already published, but commiting the change
> should rebuild it.

Forgot to say that this series also depends on my previous one:
    [XEN PATCH 0/4] Some improvement for gitlab CI jobs
    <20220228145523.8954-1-anthony.perard@citrix.com>
(for the last patch)

-- 
Anthony PERARD

