Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6010614AD16
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 01:20:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwEZi-0005jQ-Pm; Tue, 28 Jan 2020 00:17:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fY/m=3R=cs.helsinki.fi=ilpo.jarvinen@srs-us1.protection.inumbo.net>)
 id 1iwEZg-0005jL-V6
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 00:17:49 +0000
X-Inumbo-ID: 9c38eb7c-4163-11ea-acc1-bc764e2007e4
Received: from script.cs.helsinki.fi (unknown [128.214.11.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c38eb7c-4163-11ea-acc1-bc764e2007e4;
 Tue, 28 Jan 2020 00:17:47 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Tue,
 28 Jan 2020 02:17:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type; s=dkim20130528; bh=PpKOlZPTTc1YDtf/u
 GzCwk9VBLLUabpmUJfoJrEVI9o=; b=MU09enrDA0Hj6Iu1R8E7RJImBY5mqA+Sk
 Te393MY9QiEgQp5Vm522yiX0zNcHR9pqx3KgaJV6fTWSIedqV87jzU7PCBXAPLdw
 d0QQbHHVt/5u/oP8OKj6Ogaxr8IzFJVbfSKZlq1h5nV497Cy7oNq5O1y9H5S9B5f
 sO55feYbL0=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Tue, 28 Jan 2020 02:17:44 +0200
 id 00000000005A014E.000000005E2F7DA8.00001DFD
Date: Tue, 28 Jan 2020 02:17:44 +0200 (EET)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <517e2a5d-a43b-177e-1afd-119d84634af2@oracle.com>
Message-ID: <alpine.DEB.2.20.2001280216590.10612@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2001271510110.7272@whs-18.cs.helsinki.fi>
 <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
 <20200127213722.GC2995@mail-itl>
 <a486de72-c3bf-2d32-c86c-0e38d9d87f0a@oracle.com>
 <517e2a5d-a43b-177e-1afd-119d84634af2@oracle.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-7701-1580170664-0001-2"
Subject: Re: [Xen-devel] Linux 5.5 fails to boot in VM
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Jason Gunthorpe <jgg@mellanox.com>,
 =?ISO-8859-15?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-7701-1580170664-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Jan 2020, Boris Ostrovsky wrote:

> (Sorry, with proper addressing now)
>=20
> On 1/27/20 6:29 PM, Boris Ostrovsky wrote:
> >
> >
> > On 1/27/20 4:37 PM, Marek Marczykowski-G=F3recki wrote:
> >>
> >>>> Loading Linux 5.5.0-accecn30 ...
> >>>>
> >>>> .[5;22H      [ initrd.img-5.5.0-acc  16.52MiB  100%  10.23MiB/s ].=
[5;1HSetting up swapspace version 1, size =3D 1073737728 bytes
> >>>> /dev/xvda3: clean, 852118/1294896 files, 3076785/5190907 blocks
> >>>> [    2.730931] BUG: kernel NULL pointer dereference, address: 0000=
0000000003b0
> >>>> [    2.730959] #PF: supervisor read access in kernel mode
> >>>> [    2.730966] #PF: error_code(0x0000) - not-present page
> >>>> [    2.730973] PGD 0 P4D 0
> >>>> [    2.730978] Oops: 0000 [#1] SMP PTI
> >>>> [    2.730985] CPU: 1 PID: 402 Comm: qubesdb-daemon Tainted: G           =
O      5.5.0-accecn30 #31
> >>>> [    2.731000] RIP: 0010:mmu_interval_read_begin+0x24/0xc0
> >
> >
> >
> >
> > This looks like it could well be
> > d3eeb1d77c5d0af9df442db63722928238310a86. Can you revert it and see i=
f
> > it makes a difference?
> >
> > (+Jason)
> >
> > -boris
> >
> >
> >
> >
> >>>> [    2.731008] Code: e9 51 66 e1 ff 90 0f 1f 44 00 00 41 54 49 89 =
fc 55 53 48 83 ec 30 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8=
b 47 38 <48> 8b a8 b0 03 00 00 48 8d 5d 0c 48 89 df e8 49 27 6f 00 4d 8b =
64
> >>>> [    2.731030] RSP: 0018:ffff9873001e7d20 EFLAGS: 00010246
> >>>> [    2.731037] RAX: 0000000000000000 RBX: ffff8a4e94712500 RCX: 00=
00000000000000
>=20
>=20
>=20
> I am pretty sure it is.
>=20
> RAX=3D0 most likely means that map->notifier is NULL (assuming your
> compiler generates code similar to mine).
>=20
> I believe you at least need
>=20
>=20
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index 4fc83e3f..d35cf0b 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -1016,7 +1016,8 @@ static int gntdev_mmap(struct file *flip, struct
> vm_area_struct *vma)
> =A0=A0=A0=A0=A0=A0=A0=A0 * and we are holding it now, there is no need =
for the
> notifier_range
> =A0=A0=A0=A0=A0=A0=A0=A0 * locking pattern.
> =A0=A0=A0=A0=A0=A0=A0=A0 */
> -=A0=A0=A0=A0=A0=A0 mmu_interval_read_begin(&map->notifier);
> +=A0=A0=A0=A0=A0=A0 if (use_ptemod)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mmu_interval_read_begin(&ma=
p->notifier);
> =A0
> =A0=A0=A0=A0=A0=A0=A0 if (use_ptemod) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 map->pages_vm_start =3D v=
ma->vm_start;
>=20
>=20
> and maybe more.=A0 Give that a try.

Thanks, I'll try to get these tested tomorrow evening.

--=20
 i.
--=_script-7701-1580170664-0001-2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=_script-7701-1580170664-0001-2--

