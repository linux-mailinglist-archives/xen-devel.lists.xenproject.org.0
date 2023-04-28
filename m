Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 870996F19FA
	for <lists+xen-devel@lfdr.de>; Fri, 28 Apr 2023 15:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527340.819888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psOTb-00083N-UX; Fri, 28 Apr 2023 13:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527340.819888; Fri, 28 Apr 2023 13:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psOTb-00080a-Qm; Fri, 28 Apr 2023 13:49:31 +0000
Received: by outflank-mailman (input) for mailman id 527340;
 Fri, 28 Apr 2023 13:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=plFI=AT=citrix.com=prvs=475a2a817=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1psOTb-00080U-7J
 for xen-devel@lists.xen.org; Fri, 28 Apr 2023 13:49:31 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e01e082-e5cb-11ed-8611-37d641c3527e;
 Fri, 28 Apr 2023 15:49:28 +0200 (CEST)
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
X-Inumbo-ID: 7e01e082-e5cb-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682689769;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RHamvegccrGji3l8RtMeLDfhu/Zy0+5QMeZ4/KMRwgE=;
  b=AfEc8eqeg7Vmen4dY5CjzCOTD+iSS9ZUBl4wO24LwtodgNuDmiVkpYVn
   Qh1m2VQSn/SXfOY3AFgPaxBPdK7LhbNLIfhvBPg5weQuogVhNWz3TpUcR
   mnoRJbR2ov/Nr6PRA6Bw2wrv/BoNDTBoTQD85Jb3WkYSTntD3UwbUoY5z
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109669889
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8EDZNazXgeAQ4gtIryl6t+dSwSrEfRIJ4+MujC+fZmUNrF6WrkVUx
 mEeDDyAM6yOYGr3f90naIyyo0wPscDVm9ExQAVr+SAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiP6AT4DcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX587
 sQ+Mm4TUiusvOeJ5avhUM5s3tt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwNzxjG9
 zKWrgwVBDkrd/i4wyK/tUiBl77Uoj7FcZIdS7m3o6sCbFq7mTVIVUx+uUGAiee4kEOlW5RcN
 kkd4AIqrK477kvtScPyNzWorXjBshMCVt54F+wh9BrL2qfSpQGDCQAsTDFbb8c9nNQrXjFs3
 ViM9/vrGDhuvbu9WX+bsLCOoluaJykTJmIEeWkLUAoZ/97/iIUyiBvVSZBkCqHdpsbpAzjsx
 CvPoCUgr7ILyMoKzLmgu1TGhTu2od7OVAFdzgzTU3Lj5A5/YoOoT4ip71HB6rBHNonxZlyIo
 HgFltXY9OcPF5CAjgSJQeMEBrbv7PGAWBXbhVNsBIUw7DSF9HuqfIQW6zZ7TG9kKMcHPyTiY
 E7XvQJX67dXPX2jd6gxZJi+Y+wtyaXjDt3jWurjcstVYpNxeQmE+wljfUeVmWvqlSAEmLkyI
 56Bfe6wDHwRDuJsyz/eegsG+eZ1nGZknzqVHM2liU39itJyeUJ5V58aAkC2SPpn8p+/jz7Qz
 PNGbdGty01ABbiWjjbszWIDEbwbBSFlVcqo9pANK7brzhlOQz94VaKIqV81U8k8xvkOyL+Vl
 p2ochUAoGcTk0ErPuljhppLTLr0FahyonsgVcDHFQb5giNzCWpDAUp2SnfWQVXE3LY5pRKMZ
 6NZE/hs+9wWItg9xxwTbIPmsKtpfwmxiASFMkKNOWZvJcA6H1CXp4G9I2MDERXi6QLm3fbSX
 pX6jl+LKXb9b14K4DnqhAKHkArq4Cl1dBNaVErUONhDEHjRHHxRA3Wp1JcfephcQSgvMxPGj
 2569z9E/7iSy2L0mfGV7Z25Q3CBT7EuRBQGQjaFvN5b90DypwKe/GOJa87QFRi1aY8+0P7Ki
 Tl9px0kDMA6oQ==
IronPort-HdrOrdr: A9a23:XtzwN6DbjQauaQ3lHemr55DYdb4zR+YMi2TDtnoBLyC9F/bz+v
 xG88576faZslYssQgb9+xoW5PwJk80l6QFhLX5VI3KNGLbUQ2TXeJfBOPZrwEIcBeOktK1u5
 0QEZSX17XLYmST6q7BkXCFL+o=
X-Talos-CUID: =?us-ascii?q?9a23=3A21U9TWoFMDC8XmnclWFR0rfmUd8XaUX71inOH3S?=
 =?us-ascii?q?XMmNWbaTPU3iQoLwxxg=3D=3D?=
X-Talos-MUID: 9a23:g3hHjgWlzGz/1xnq/A6voBZoLP0v2Ym/WVsyjKsvq8bbMSMlbg==
X-IronPort-AV: E=Sophos;i="5.99,234,1677560400"; 
   d="scan'208";a="109669889"
Date: Fri, 28 Apr 2023 14:49:15 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V3 1/2] docs: Allow generic virtio device types to
 contain device-id
Message-ID: <9395f0e5-3fe6-4235-a6a8-738c45041a82@perard>
References: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <18458fa39433ce4ac950a0a20cc64da93db0b03a.1680771422.git.viresh.kumar@linaro.org>

On Thu, Apr 06, 2023 at 02:28:17PM +0530, Viresh Kumar wrote:
> For generic virtio devices, where we don't need to add compatible or
> other special DT properties, the type field is set to "virtio,device".
> 
> But this misses the case where the user sets the type with a valid
> virtio device id as well, like "virtio,device1a" for file system device.
> The complete list of virtio device ids is mentioned here:
> 
> https://docs.oasis-open.org/virtio/virtio/v1.2/cs01/virtio-v1.2-cs01.html#x1-2160005
> 
> Update documentation to support that as well.
> 
> Fixes: dd54ea500be8 ("docs: add documentation for generic virtio devices")
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

