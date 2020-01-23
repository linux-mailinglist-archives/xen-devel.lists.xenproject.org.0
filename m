Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F066D1463B2
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 09:43:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuY2J-0001wO-QT; Thu, 23 Jan 2020 08:40:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WyYo=3M=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuY2I-0001wJ-AH
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 08:40:22 +0000
X-Inumbo-ID: f8bfd5aa-3dbb-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8bfd5aa-3dbb-11ea-b833-bc764e2007e4;
 Thu, 23 Jan 2020 08:40:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E264FAE06;
 Thu, 23 Jan 2020 08:40:11 +0000 (UTC)
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <1659c9ee-37ee-988a-6aaa-e115d1529fd6@suse.de>
Date: Thu, 23 Jan 2020 09:40:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
Subject: Re: [Xen-devel] [PATCH v3 0/4] Use no_vblank property for drivers
 without VBLANK
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
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sean@poorly.run, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 laurent.pinchart@ideasonboard.com, xen-devel@lists.xenproject.org,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============7049544005900832526=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============7049544005900832526==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pCIvLSsYBYOw52ijDqWub0Xa7Pbcuk34Z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pCIvLSsYBYOw52ijDqWub0Xa7Pbcuk34Z
Content-Type: multipart/mixed; boundary="6GUilDKLRS1Nl4WmXujzoC8tlZiZqY5my";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 laurent.pinchart@ideasonboard.com, xen-devel@lists.xenproject.org,
 sean@poorly.run, emil.velikov@collabora.com
Message-ID: <1659c9ee-37ee-988a-6aaa-e115d1529fd6@suse.de>
Subject: Re: [PATCH v3 0/4] Use no_vblank property for drivers without VBLANK
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>
In-Reply-To: <20200121093604.ruclkfho5gmflasq@sirius.home.kraxel.org>

--6GUilDKLRS1Nl4WmXujzoC8tlZiZqY5my
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.01.20 um 10:36 schrieb Gerd Hoffmann:
> On Mon, Jan 20, 2020 at 01:20:47PM +0100, Thomas Zimmermann wrote:
>> Instead of faking VBLANK events by themselves, drivers without VBLANK
>> support can enable drm_crtc_vblank.no_vblank and let DRM do the rest.
>> The patchset makes this official and converts over drivers.
>>
>> The current implementation looks at the number of initialized CRTCs
>> wrt vblanking. If vblanking has been initialized for a CRTC, the drive=
r
>> is responsible for sending out VBLANK events. Otherwise, DRM will send=

>> out the event. The behaviour selected by initializing no_vblank as par=
t
>> of drm_atomic_helper_check_modeset().
>>
>> I went through all drivers, looking for those that call send out VBLAN=
K
>> events but do not call drm_vblank_init(). These are converted to the n=
ew
>> semantics. This affects tiny drivers; drivers for virtual hardware; an=
d
>> a few others, which do not support interrupts. Xen comes with its
>> own VBLANK logic and disables no_vblank explictly.
>=20
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Thanks a lot. v4 will mostly reorganize the patches so I'll keep your A-b=
=2E

Best regards
Thomas

>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--6GUilDKLRS1Nl4WmXujzoC8tlZiZqY5my--

--pCIvLSsYBYOw52ijDqWub0Xa7Pbcuk34Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4pW+oACgkQaA3BHVML
eiNV0gf+IPPOumQscdtQTf7HiwBEYXRigNipidae4Be+fOxcgoEbdgq/mZcSPvx1
Qiutl89HQ0S/9aeZLmXTvJQETVw49f4d14OwPKVk9r6bPipVDuKb1u8893tO+Cfv
uDhBhXeIOVsQj6UQMsKHRXEP89f86srW8QdhPVhpKD0e/wTNDmQNJSr36UGrVHfu
37Qnl1ti99WI25Hv1s3OdZNodLgWmWoEShvzLmXeQimVffHPt3KpNnazmVXJjJXK
ODtGNmgXgg/XP9dV6UURzQSP5fhnHWbiE0KRoE6gSWwfMvQN88LNGRWoNX5sNrVq
388slhf1P3s3iCCsYvnxqKplejINQQ==
=QYNB
-----END PGP SIGNATURE-----

--pCIvLSsYBYOw52ijDqWub0Xa7Pbcuk34Z--


--===============7049544005900832526==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7049544005900832526==--

