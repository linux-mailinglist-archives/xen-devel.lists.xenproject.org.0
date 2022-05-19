Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB72B52D620
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333033.556819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhDC-0005XI-Ns; Thu, 19 May 2022 14:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333033.556819; Thu, 19 May 2022 14:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhDC-0005Tp-Ju; Thu, 19 May 2022 14:33:10 +0000
Received: by outflank-mailman (input) for mailman id 333033;
 Thu, 19 May 2022 14:33:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qgK=V3=citrix.com=prvs=13100c9ce=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nrhDA-0005Tc-RD
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:33:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98df4682-d780-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 16:33:07 +0200 (CEST)
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
X-Inumbo-ID: 98df4682-d780-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652970787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QT0pu8MxxL6RqJbybWAqXmT9dVU0yAKlVYyXlrkqQg8=;
  b=M9YT39eHY0e7B2YvFofEInPwFiChe6s0vW+Jt3IV+A6WcOjIciZtFCNk
   RelNSiDS1mGrhAoTe60CeHmJphKoGABqCr61fEn4VG4TsgRe3lb7hOe2H
   CkiaLfUnq/OZFLuFJwHP5PT66Xsr6c8aD9nCHeJJWU9APd3jpzMz+PTOA
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 72098467
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:o0mbnaMWTDbw0xHvrR1Gl8FynXyQoLVcMsEvi/4bfWQNrUohhDQPm
 DNLXmHVM6mPNjbwKtB2Pong8xsOvcXWnYVlTwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk298w2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 fxc5d+2ERkSDKDHkfs0ckRGLQZ+MvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRR66PN
 5ZHNlKDajz6Oh9xanIqJq4shf+srH3gMBFDj0ia8P9fD2/7k1UqjemF3MDuUsyHQ4BZk1iVo
 krC/n/lGVcKOdqH0z2H/3mwwOjVkkvTQIsPEJWo+/gsh0ecrkQKBRgLEFG/pvK6oki5Xd1ZN
 goT4CVGhaop8ku0ZsPwUx2xvDiPuRt0c8NdFvB/5AyTx6785QGfCW4ZCDlbZ7QOr887QyAnx
 3eGmtroAXpkt7j9YWmG6r6eoDe2OC4UBWwPfykJSU0C+daLiJg+iw+KUsxiDq+8ivXzHjf/x
 S3MqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEq4xxIpJ4j9ebea5FPS8t9hcZinaVmO6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4gjmFfKsEy/hX1
 XKnnSGEVC9yNEif5GDqL9rxKJdyrszE+UvdRIrg0zOs2qeEaXieRN8taQXTNLBgtv/Z+VuOq
 76z0vdmLD0GAIXDjtT/q9ZPfTjm01BlbXwJlyCnXrHaeVc3cI3QI/TQ3akga+RYc1d9zY/1E
 oWGchYAkjLX3CSfQS3TMywLQO6/DP5X8CNgVQRxbAnA5pTWSdv2hEvpX8BsJudPGS0K5aMcc
 sTpjO3ZUqsQEWydo291gFuUhNUKSSlHTDmmZ0KNCAXTtbY6L+AV0rcIpjfSyRQ=
IronPort-HdrOrdr: A9a23:NdLe2q+ifBk5HTPD6RFuk+DYI+orL9Y04lQ7vn2YSXRuHPBws/
 re+MjztCWE7Qr5N0tMpTntAsW9qDbnhPlICOoqTNWftWvd2FdARbsKheCJ/9SjIVycygc079
 YHT0EUMrzN5DZB4vrH3A==
X-IronPort-AV: E=Sophos;i="5.91,237,1647316800"; 
   d="scan'208";a="72098467"
Date: Thu, 19 May 2022 15:33:01 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Bernhard Beschow <shentey@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	<sstabellini@kernel.org>, <paul@xen.org>, <xen-devel@lists.xenproject.org>,
	John Snow <jsnow@redhat.com>, "open list:IDE" <qemu-block@nongnu.org>
Subject: Re: [PATCH v2 2/3] hw/ide/piix: Add some documentation to
 pci_piix3_xen_ide_unplug()
Message-ID: <YoZVHYJfBxiemFrr@perard.uk.xensource.com>
References: <20220513180957.90514-1-shentey@gmail.com>
 <20220513180957.90514-3-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220513180957.90514-3-shentey@gmail.com>

On Fri, May 13, 2022 at 08:09:56PM +0200, Bernhard Beschow wrote:
> The comment is based on commit message
> ae4d2eb273b167dad748ea4249720319240b1ac2 'xen-platform: add missing disk
> unplug option'. Since it seems to describe design decisions and
> limitations that still apply it seems worth having.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
> diff --git a/hw/ide/piix.c b/hw/ide/piix.c
> index 2345fe9e1d..bc1b37512a 100644
> --- a/hw/ide/piix.c
> +++ b/hw/ide/piix.c
> @@ -173,6 +173,17 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
>      }
>  }
>  
> +/*
> + * The Xen HVM unplug protocol [1] specifies a mechanism to allow guests to
> + * request unplug of 'aux' disks (which is stated to mean all IDE disks,
> + * except the primary master).
> + *
> + * NOTE: The semantics of what happens if unplug of all disks and 'aux' disks
> + *       is simultaneously requested is not clear. The implementation assumes
> + *       that an 'all' request overrides an 'aux' request.
> + *
> + * [1] https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=docs/misc/hvm-emulated-unplug.pandoc
> + */
>  int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
>  {
>      PCIIDEState *pci_ide;

That comments seems to focus on 'aux', but it also gives some pointer on
what calls the function. So it looks fine.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,


-- 
Anthony PERARD

