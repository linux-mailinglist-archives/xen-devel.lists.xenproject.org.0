Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1144C144E02
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 09:55:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuBln-0000ig-Hp; Wed, 22 Jan 2020 08:53:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=U0A3=3L=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iuBlm-0000iZ-Py
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 08:53:50 +0000
X-Inumbo-ID: b5030066-3cf4-11ea-bbf6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5030066-3cf4-11ea-bbf6-12813bfff9fa;
 Wed, 22 Jan 2020 08:53:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C23D2B080;
 Wed, 22 Jan 2020 08:53:47 +0000 (UTC)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200120122051.25178-2-tzimmermann@suse.de>
 <20200122083139.GP43062@phenom.ffwll.local>
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
Message-ID: <3ad03b06-f9be-37c7-9cc7-044468cdf300@suse.de>
Date: Wed, 22 Jan 2020 09:53:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122083139.GP43062@phenom.ffwll.local>
Subject: Re: [Xen-devel] [PATCH v3 1/4] drm: Add drm_crtc_has_vblank()
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
Cc: laurent.pinchart@ideasonboard.com, david@lechnology.com,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie, sean@poorly.run,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 hdegoede@redhat.com, kraxel@redhat.com, xen-devel@lists.xenproject.org,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============0757694755313818368=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0757694755313818368==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ukGbA0WF7ueGJSb0kAo69CYC5oJMXwLf5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ukGbA0WF7ueGJSb0kAo69CYC5oJMXwLf5
Content-Type: multipart/mixed; boundary="vrjq2MwPI2wsvdcv8O7Xzud45fILL1HN9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: david@lechnology.com, oleksandr_andrushchenko@epam.com, airlied@linux.ie,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 kraxel@redhat.com, xen-devel@lists.xenproject.org,
 emil.velikov@collabora.com, sean@poorly.run,
 laurent.pinchart@ideasonboard.com
Message-ID: <3ad03b06-f9be-37c7-9cc7-044468cdf300@suse.de>
Subject: Re: [PATCH v3 1/4] drm: Add drm_crtc_has_vblank()
References: <20200120122051.25178-1-tzimmermann@suse.de>
 <20200120122051.25178-2-tzimmermann@suse.de>
 <20200122083139.GP43062@phenom.ffwll.local>
In-Reply-To: <20200122083139.GP43062@phenom.ffwll.local>

--vrjq2MwPI2wsvdcv8O7Xzud45fILL1HN9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.01.20 um 09:31 schrieb Daniel Vetter:
> On Mon, Jan 20, 2020 at 01:20:48PM +0100, Thomas Zimmermann wrote:
>> The new interface drm_crtc_has_vblank() return true if vblanking has
>> been initialized for a certain CRTC, or false otherwise. This function=

>> will be useful for initializing CRTC state.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_vblank.c | 21 +++++++++++++++++++++
>>  include/drm/drm_vblank.h     |  1 +
>>  2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index 1659b13b178c..c20102899411 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -501,6 +501,27 @@ int drm_vblank_init(struct drm_device *dev, unsig=
ned int num_crtcs)
>>  }
>>  EXPORT_SYMBOL(drm_vblank_init);
>> =20
>> +/**
>> + * drm_crtc_has_vblank - test if vblanking has been initialized for
>> + *                       a CRTC
>> + * @crtc: the CRTC
>> + *
>> + * Drivers may call this function to test if vblank support is
>> + * initialized for a CRTC. For most hardware this means that vblankin=
g
>> + * can also be enabled on the CRTC.
>> + *
>> + * Returns:
>> + * True if vblanking has been initialized for the given CRTC, false
>> + * otherwise.
>> + */
>> +bool drm_crtc_has_vblank(const struct drm_crtc *crtc)
>=20
> So making this specific to a CRTC sounds like a good idea. But it's not=

> the reality, drm_vblank.c assumes that either everything or nothing
> supports vblanks.
>=20
> The reason for dev->num_crtcs is historical baggage, it predates kms by=
 a
> few years. For kms drivers the only two valid values are either 0 or
> dev->mode_config.num_crtcs. Yes that's an entire different can of worms=

> that's been irking me since forever (ideally drm_vblank_init would some=
how
> loose the num_crtcs argument for kms drivers, but some drivers call thi=
s
> before they've done all the drm_crtc_init calls so it's complicated).

Maybe as a first step, drm_vblank_init() could use
dev->mode_config.num_crtcs if the supplied number of CRTCs is zero.

>=20
> Hence drm_dev_has_vblank as I suggested. That would also allow you to
> replace a bunch of if (dev->num_crtcs) checks in drm_vblank.c, which
> should help quite a bit in code readability.

OK, but I still don't understand why this interface is better overall.
We don't loose anything by passing in the crtc instead of the device
structure. And if there's ever a per-crtc vblank initialization, we'd
have the interface in place already. The tests with "if
(dev->num_crtcs)" could probably be removed in most places in any case.

We should also consider forking the vblank code for non-KMS drivers.
While working in this, I found the support for legacy drivers is getting
in the way at times. With such a fork, legacy drivers could continue
using struct drm_vblank_crtc, while modern drivers could maybe store
vblank state directly in struct drm_crtc.

Anyway, all this is for another patch. Unless you change your mind, I'll
replace drm_crtc_has_vblank() with drm_dev_has_vblank() for the
patchset's next iteration.

Best regards
Thomas

>=20
> Cheers, Daniel
>=20
>> +{
>> +	struct drm_device *dev =3D crtc->dev;
>> +
>> +	return crtc->index < dev->num_crtcs;
>> +}
>> +EXPORT_SYMBOL(drm_crtc_has_vblank);
>> +
>>  /**
>>   * drm_crtc_vblank_waitqueue - get vblank waitqueue for the CRTC
>>   * @crtc: which CRTC's vblank waitqueue to retrieve
>> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
>> index c16c44052b3d..531a6bc12b7e 100644
>> --- a/include/drm/drm_vblank.h
>> +++ b/include/drm/drm_vblank.h
>> @@ -206,6 +206,7 @@ struct drm_vblank_crtc {
>>  };
>> =20
>>  int drm_vblank_init(struct drm_device *dev, unsigned int num_crtcs);
>> +bool drm_crtc_has_vblank(const struct drm_crtc *crtc);
>>  u64 drm_crtc_vblank_count(struct drm_crtc *crtc);
>>  u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
>>  				   ktime_t *vblanktime);
>> --=20
>> 2.24.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vrjq2MwPI2wsvdcv8O7Xzud45fILL1HN9--

--ukGbA0WF7ueGJSb0kAo69CYC5oJMXwLf5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4oDZYACgkQaA3BHVML
eiMsSAf/eR0FZiJzOsVBcz3DBaFTiM5pFltivDonnJagTG6sWR9peCCPccGuKwtX
UOV3t89CfGkO086lBvh4drvJZ7YsarwPhgLn01E6EMNqzHzK2wuSFRD4jtWotaIY
DQVMAG8qMKOUb73KEAUkDw+KXohoezRHsMFPOETSpwizATfXhidEt6irGh7WjhNt
ECADQpwp4jecRk9EfDY5oHFP8BWMRb1lBipufQ3ozm37wmJws52/kiYxKssxc4A1
QLdCR0mkFMDQ3GN1hPWiAC8wIRTQWyxlrmJDUf08FeJxOX1PjQzl3UKVJ0N2eeAi
sASQ1s84N8wBT3YyIwAg9xuhg2O1Zg==
=Dldh
-----END PGP SIGNATURE-----

--ukGbA0WF7ueGJSb0kAo69CYC5oJMXwLf5--


--===============0757694755313818368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0757694755313818368==--

