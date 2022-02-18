Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B54BBACC
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275539.471460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4Pw-0002ZT-5c; Fri, 18 Feb 2022 14:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275539.471460; Fri, 18 Feb 2022 14:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4Pw-0002Xd-2l; Fri, 18 Feb 2022 14:39:28 +0000
Received: by outflank-mailman (input) for mailman id 275539;
 Fri, 18 Feb 2022 14:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Bzb=TB=citrix.com=prvs=041dc651e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nL4Pt-0002XX-W0
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:39:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9083a1f9-90c8-11ec-8723-dd0c611c5f35;
 Fri, 18 Feb 2022 15:39:24 +0100 (CET)
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
X-Inumbo-ID: 9083a1f9-90c8-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645195164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=EYs7NGzGuJbaaYQP0j8NOvWe47eafHSpFNrbjUk83Vo=;
  b=HYCbxbvJNo1kEdne7ZczMYeuXrfn/p9/9UL12n4pyIeTtYY3cKez2c/R
   5LlxrbcSbTrUr+uxZRYxra03IWoLcUzZidmNYUjInhmBDH7Gh/5c9bZlh
   3EqMDLBfE/eD3Q7RUw4Dtp2+PSiRYPGFFCb6OOlCHEK+WMipOvPf15VL2
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 63960861
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bd9TV62cyPVg6acygvbD5f1xkn2cJEfYwER7XKvMYLTBsI5bpzRUm
 GtKXj+EMv+Da2Dwc9wnaIXk/UIP75DWytBrSQM/pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx0YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Rq8aKZCwCMpfVwt4bUjlKHSshFrZvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiFN
 pRBOWQ2BPjGSwBNJlMQOLE6pcW5rGTgQTpYq0/NoZNitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEpMXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4GOQg5AaA4qHd+QqeCy4PSTspVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3quK9wmfEgMZF3ZYXykFbRkL6YbIu6hm23ojUe1fOKKyi9T0HxT5z
 DaLsDUyit0vsCIb60mo1QuZ2mzx//AlWiZwv1yKBTz9smuVcab4P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQ8hJG9eFoSfLkWVsDNdWfRYB3iEsI2KBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YtKVbdoHk/ORDJhQgBdXTAd4lma
 P93lu72UB4n5VlPlmLqF4/xL5dwrszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnnBBcDkQKn3SevxMfjQikLVY4DlK1X9RoTVRHA937ys5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:XXILAKogRpOZaH9dxDZw4ZsaV5oteYIsimQD101hICG8cqSj+f
 xGuM5rsSMc7wxhP03I+OrwXZVoLkmwyXcY2+Us1PKZLW/bUQiTXeNfBOnZowEIcheWnoU26U
 4jSdkcNDSZNykCsS+Q2miF+rgbr+W6zA==
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="63960861"
Date: Fri, 18 Feb 2022 14:39:20 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Wei Liu <wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Jan
 Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] CI: Add gnu grep to alpine containers
Message-ID: <Yg+vmEsWzurilMNy@perard.uk.xensource.com>
References: <20220218131740.30922-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220218131740.30922-1-andrew.cooper3@citrix.com>

On Fri, Feb 18, 2022 at 01:17:40PM +0000, Andrew Cooper wrote:
> A forthcoming change is going to want more support than busybox's grep can
> provide.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Jan Beulich <JBeulich@suse.com>
> 
> I've already rebuilt the containers and confirmed that the build is still fine.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

