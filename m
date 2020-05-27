Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C6E1E3F4F
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 12:43:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdtWv-0007Aq-17; Wed, 27 May 2020 10:43:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eMJP=7J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jdtWt-0007Ai-Vt
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 10:43:24 +0000
X-Inumbo-ID: e22b481c-a006-11ea-a717-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e22b481c-a006-11ea-a717-12813bfff9fa;
 Wed, 27 May 2020 10:43:21 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tlUAiLy9f0+D4MUI4Y6F83hCylkZvlGEvyD0/lHW1DkMPMptHTE09oxOySCdo0I7J4I5i2tI1j
 Ogb+8HGZlLfbGhTo0HAeKbbmFvkWKd7eHLx1qXSRovYu7B7Q+A6yUF4Pz0uWPhAFmE7Mfn+8b/
 p1wUe8oNHvSg5OP+KHkQzjSMJWwspk351ZfZqS+s5XoHlaW7YywFIkYn+VdWJsIqLAZUQDAOuZ
 gxidGy8iwlLvdPsFyNb/kKzxePHk/S//GDA0zK+r0Sw6T7IG4frW8+4HyMdnMgGSvpsMCLA+u0
 bIs=
X-SBRS: 2.7
X-MesageID: 18558352
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,441,1583211600"; d="scan'208";a="18558352"
Date: Wed, 27 May 2020 11:43:16 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 3/5] automation/archlinux: Add 32-bit glibc headers
Message-ID: <20200527104316.GH2105@perard.uk.xensource.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
 <20200526221612.900922-4-george.dunlap@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200526221612.900922-4-george.dunlap@citrix.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, Wei
 Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 26, 2020 at 11:16:10PM +0100, George Dunlap wrote:
> This fixes the following build error in hvmloader:
> 
> usr/include/gnu/stubs.h:7:11: fatal error: gnu/stubs-32.h: No such file or directory
> 
> Signed-off-by: George Dunlap <george.dunlap@citrix.com>
> ---
>  automation/build/archlinux/current.dockerfile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
> index 9af5d66afc..5095de65b8 100644
> --- a/automation/build/archlinux/current.dockerfile
> +++ b/automation/build/archlinux/current.dockerfile
> @@ -19,6 +19,7 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
>          iasl \
>          inetutils \
>          iproute \
> +        lib32-glibc \
>          libaio \
>          libcacard \
>          libgl \

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

