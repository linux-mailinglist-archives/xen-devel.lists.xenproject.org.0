Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FB864A463
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 16:47:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459742.717513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4l0a-000514-2l; Mon, 12 Dec 2022 15:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459742.717513; Mon, 12 Dec 2022 15:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4l0Z-0004y5-VC; Mon, 12 Dec 2022 15:46:23 +0000
Received: by outflank-mailman (input) for mailman id 459742;
 Mon, 12 Dec 2022 15:46:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xn9i=4K=citrix.com=prvs=338000f17=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p4l0Y-0004xx-DP
 for xen-devel@lists.xen.org; Mon, 12 Dec 2022 15:46:22 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ea5bfa7-7a34-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 16:46:20 +0100 (CET)
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
X-Inumbo-ID: 1ea5bfa7-7a34-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670859980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V1RCm2ClogbX4ZaJEZCU4t9Apjk5vFMsbYRRgBK8u04=;
  b=X31mk6QosgJv/QBTspPi7b8AQQ9XBkwt2pH//m3dC2/DHQCDDLpmiheU
   wHudkqAUVEH/5Ja/Vbv7fbJh1TatklVoDvoB3E1M/BSsi1xACWXmAg2ZM
   nizrnO08JCymiSvGwhie2nXmXBA5oC2yv8UoIC/o86d0vkp91W4tEyB+M
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 88320561
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wl9hg6AuZX/DFRVW/9vjw5YqxClBgxIJ4kV8jS/XYbTApDh3hjxWz
 WZOUWrVO66MNjCgL493PYvl8kIE6p7TzIVhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WlB5ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6OVvKllEq
 O0iJDkwMyzcouzn25m4Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2o0BPjDS0Qn1lM/AZQinOCulz/nfidRsl69rqsr+WnDigd21dABNfKFKofQHZgLxy50o
 EqZ3UPmHhIQHuCl2BeGsUu3pcXknBnSDdd6+LqQqacx3Qz7KnYoIAMXU1C2p+X/hVO/R85YN
 2QQ+ywnt69081akJvH0WxCo5nSJuBgRVvJUEusz8gbLzbDbiy6CGmUKRzhGLsc6vcU7QTgr0
 F6hj9LtBDp/9raSTBq19KqQrD60ETgYKykFfyBsZRUE+dT4oMcwkxfGVP5nEai8lNqzHiv/q
 xiaoS57i7gNgMoj06Sg4UuBkz+q4J/TQWYd5ArNWXm+xhhkf4PjbIutgWU39t4ZctzfFAPY+
 iFZxY7Ot4jiEK1higSfQ/0mJLv09syJOQCBvQFKEcg63DeErivLkZ9r3BlyI0JgM8AhcDDvY
 VPOtQ452KK/LEdGfocsPdvvVp1CIbzIUI28C6uKNoYmjo1ZLlfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYH7H8uTI/ePi+D2iJuppVAtbjOzghgRtv/sneks2
 4832zG24xteSvbiRSLc7JQeK1sHRVBiW8+u9JwMK7DTeVo3cI3ENxM26epxE7GJYowPzruYl
 p1DchAwJKXDaY3vdlzRNyELhELHVpdjt3MrVRHAzn7xs0XPlb2Htf9FH7NuJOlPyQCW5aIsJ
 xXzU5naU6snp/Wu02h1UKQRW6Q7L0T11VPTZXT7CNX9FrY5LzH0FhbfVlOH3EEz4uCf7qPSf
 5XIOtvnfKc+
IronPort-HdrOrdr: A9a23:Yd5G+qMuvvsyLcBcTgajsMiBIKoaSvp037Eqv3oBLyC9E/b5qy
 nKpp8mPHDP6Qr5NEtQ/OxoW5PwOE80l6QFmbX5VI3KNGaJhILBFvAY0WKI+UyFJ8SRzJ876Y
 5QN4VFJZnXK3MSt6rHCQ+DeeoI8Z283Jrtr8H44FdCcTpDVoFHyENCJjvzKDwUeCB2QZU4EZ
 aH5tlKvVObFEg/ZNigG38AU/PiirTw5fDbXSI=
X-IronPort-AV: E=Sophos;i="5.96,238,1665460800"; 
   d="scan'208";a="88320561"
Date: Mon, 12 Dec 2022 15:46:09 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>, Alex
 =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH V8 1/3] libxl: Add support for generic virtio device
Message-ID: <Y5dMwYDbQBO+cd+j@perard.uk.xensource.com>
References: <cover.1670839220.git.viresh.kumar@linaro.org>
 <0e58df1510d7d8c0186da6620882b7c4e4035ab0.1670839220.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0e58df1510d7d8c0186da6620882b7c4e4035ab0.1670839220.git.viresh.kumar@linaro.org>

On Mon, Dec 12, 2022 at 03:35:53PM +0530, Viresh Kumar wrote:
> This patch adds basic support for configuring and assisting generic
> Virtio backends, which could run in any domain.
> 
> An example of domain configuration for mmio based Virtio I2C device is:
> virtio = ["type=virtio,device22,transport=mmio"]
> 
> To make this work on Arm, allocate Virtio MMIO params (IRQ and memory
> region) and pass them to the backend and update guest device-tree to
> create a DT node for the Virtio devices.
> 
> Add special support for I2C and GPIO devices, which require the
> "compatible" DT property to be set, among other device specific
> properties. Support for generic virtio devices is also added, which just
> need a MMIO node but not any special DT properties, for such devices the
> user needs to pass "virtio,device" in the "type" string.
> 
> The parsing of generic virtio device configurations will be done in a
> separate commit.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

