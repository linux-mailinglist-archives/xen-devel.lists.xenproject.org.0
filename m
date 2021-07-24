Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D87EB3D4579
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jul 2021 09:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160436.294991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7BdY-0004TK-Of; Sat, 24 Jul 2021 06:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160436.294991; Sat, 24 Jul 2021 06:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7BdY-0004Qq-Kp; Sat, 24 Jul 2021 06:59:52 +0000
Received: by outflank-mailman (input) for mailman id 160436;
 Sat, 24 Jul 2021 06:22:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eVmC=MQ=sf-tec.de=eike-kernel@srs-us1.protection.inumbo.net>)
 id 1m7B3d-0000lo-7D
 for xen-devel@lists.xenproject.org; Sat, 24 Jul 2021 06:22:45 +0000
Received: from mail.sf-mail.de (unknown
 [2a01:4f8:1c17:6fae:616d:6c69:616d:6c69])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9733439d-7b15-4264-ab79-b49cf74a2000;
 Sat, 24 Jul 2021 06:22:42 +0000 (UTC)
Received: (qmail 29130 invoked from network); 24 Jul 2021 06:21:54 -0000
Received: from p548c622d.dip0.t-ipconnect.de ([::ffff:84.140.98.45]:48018 HELO
 daneel.sf-tec.de) (auth=eike@sf-mail.de)
 by mail.sf-mail.de (Qsmtpd 0.38dev) with (TLS_AES_256_GCM_SHA384 encrypted)
 ESMTPSA
 for <linux-kernel@vger.kernel.org>; Sat, 24 Jul 2021 08:21:54 +0200
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
X-Inumbo-ID: 9733439d-7b15-4264-ab79-b49cf74a2000
From: Rolf Eike Beer <eike-kernel@sf-tec.de>
To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, Logan Gunthorpe <logang@deltatee.com>
Cc: Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>, Martin Oliveira <martin.oliveira@eideticom.com>, Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v2 21/21] dma-mapping: Disallow .map_sg operations from returning zero on error
Date: Sat, 24 Jul 2021 08:22:28 +0200
Message-ID: <2591613.mvXUDI8C0e@daneel.sf-tec.de>
In-Reply-To: <20210723175008.22410-22-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com> <20210723175008.22410-22-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart11795432.O9o76ZdvQC"; micalg="pgp-sha1"; protocol="application/pgp-signature"

--nextPart11795432.O9o76ZdvQC
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Freitag, 23. Juli 2021, 19:50:08 CEST schrieb Logan Gunthorpe:
> Now that all the .map_sg operations have been converted to returning
> proper error codes, drop the code to handle a zero return value,
> add a warning if a zero is returned and update the comment for the
> map_sg operation.

I see no comment being touched here.

Eike
--nextPart11795432.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSaYVDeqwKa3fTXNeNcpIk+abn8TgUCYPuxpAAKCRBcpIk+abn8
TmEXAJ4y9fSVV7pgh2KPWXQ4YaTcwXP08ACgkfbFqKsGtxv2IZPJJiPcxo/F4Bg=
=swGr
-----END PGP SIGNATURE-----

--nextPart11795432.O9o76ZdvQC--




