Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D49572A7E8F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 13:29:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19776.45134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaeNm-0003TP-J1; Thu, 05 Nov 2020 12:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19776.45134; Thu, 05 Nov 2020 12:28:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaeNm-0003T0-FX; Thu, 05 Nov 2020 12:28:50 +0000
Received: by outflank-mailman (input) for mailman id 19776;
 Thu, 05 Nov 2020 12:28:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRUF=EL=crudebyte.com=qemu_oss@srs-us1.protection.inumbo.net>)
 id 1kaeNk-0003Sq-4F
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 12:28:48 +0000
Received: from lizzy.crudebyte.com (unknown [91.194.90.13])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59d1186d-e553-43cb-bc94-407a058bac8e;
 Thu, 05 Nov 2020 12:28:47 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=mRUF=EL=crudebyte.com=qemu_oss@srs-us1.protection.inumbo.net>)
	id 1kaeNk-0003Sq-4F
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 12:28:48 +0000
X-Inumbo-ID: 59d1186d-e553-43cb-bc94-407a058bac8e
Received: from lizzy.crudebyte.com (unknown [91.194.90.13])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 59d1186d-e553-43cb-bc94-407a058bac8e;
	Thu, 05 Nov 2020 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Content-ID:Content-Description;
	bh=YPq/3yfFXLfPvAw4wtoOounGC9mB9vXYDsxqJBUvGTo=; b=Che2Ca+e11VJP8CmIRlpunNLMr
	qRQYJY4aEOG0sW7s1/7HUUp1XpWOrnMQhEb929HTWWJVhd+a4HkpskarxDIq0Mx5NJDMkLSzlv4VU
	yFcXwTsWK9Zs1Mj3kZL1g8mRojrX7WB/Uy3pxPoLLQGo/c55dsUS2KFv/49dHaSDSc5JNGbkRljuE
	qAnqlj3I9P12l8yLegvSKpZyeBET7x7v9yXLWzM3e8xfxSyep95AX6+4VfUDDJoCdPoah94WEtGnQ
	Olx7AccVhzmuG0AHKIG/Nk/isz/Zgy/ZfRPtwS4tbj5DgBKVrZ9xU6aBL0JTHG3q1xebPNdtoNHOe
	kF4G/s6Q==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Greg Kurz <groug@kaod.org>
Cc: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>, qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel P . Berrange" <berrange@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Cornelia Huck <cohuck@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH-for-5.2 v3 2/4] hw/9pfs: Fix Kconfig dependency problem between 9pfs and Xen
Date: Thu, 05 Nov 2020 13:28:31 +0100
Message-ID: <2140852.vo20GZeEQY@silver>
In-Reply-To: <20201105132346.5e0adf94@bahia.lan>
References: <20201104115706.3101190-1-philmd@redhat.com> <17370310-d69c-91ff-763d-52a1355ad605@redhat.com> <20201105132346.5e0adf94@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Donnerstag, 5. November 2020 13:23:46 CET Greg Kurz wrote:
> On Thu, 5 Nov 2020 13:15:59 +0100
>=20
> Philippe Mathieu-Daud=E9 <philmd@redhat.com> wrote:
> > On 11/4/20 6:54 PM, Greg Kurz wrote:
> > > On Wed, 04 Nov 2020 13:18:09 +0100
> > >=20
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > >> On Mittwoch, 4. November 2020 12:57:04 CET Philippe Mathieu-Daud=E9=
=20
wrote:
> > >>> Commit b2c00bce54c ("meson: convert hw/9pfs, cleanup") introduced
> > >>> CONFIG_9PFS (probably a wrong conflict resolution). This config is
> > >>> not used anywhere. Backends depend on CONFIG_FSDEV_9P which itself
> > >>> depends on CONFIG_VIRTFS.
> > >>>=20
> > >>> Remove the invalid CONFIG_9PFS and use CONFIG_FSDEV_9P instead, to
> > >>>=20
> > >>> fix the './configure --without-default-devices --enable-xen' build:
> > >>>   /usr/bin/ld: libcommon.fa.p/hw_xen_xen-legacy-backend.c.o: in
> > >>>   function
> > >>>=20
> > >>> `xen_be_register_common': hw/xen/xen-legacy-backend.c:754: undefined
> > >>> reference to `xen_9pfs_ops' /usr/bin/ld:
> > >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x8): undefined
> > >>> reference to
> > >>> `local_ops' /usr/bin/ld:
> > >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x20): undefined
> > >>> reference
> > >>> to `synth_ops' /usr/bin/ld:
> > >>> libcommon.fa.p/fsdev_qemu-fsdev.c.o:(.data.rel+0x38): undefined
> > >>> reference
> > >>> to `proxy_ops' collect2: error: ld returned 1 exit status
> > >>>=20
> > >>> Fixes: b2c00bce54c ("meson: convert hw/9pfs, cleanup")
> > >>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > >>> Acked-by: Greg Kurz <groug@kaod.org>
> > >>> Tested-by: Greg Kurz <groug@kaod.org>
> > >>> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > >>=20
> > >> Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > >=20
> > > Phil,
> > >=20
> > > Same questioning as Connie. Do you intend to get this merged or should
> > > Christian or I take care of that ?
> >=20
> > Same answer too =3D) If you are preparing a pull request, please go ahe=
ad!
>=20
> Heh I've just seen your answer.
>=20
> Christian,
>=20
> Maybe you can add this patch in your next PR ?

Yes, I will prepare a 9p PR today anyway, so I will include this patch.

Best regards,
Christian Schoenebeck



