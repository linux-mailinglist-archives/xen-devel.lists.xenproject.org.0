Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E114A36E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 13:02:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw32y-0003Dq-8U; Mon, 27 Jan 2020 11:59:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6bwx=3Q=suse.de=tzimmermann@srs-us1.protection.inumbo.net>)
 id 1iw32w-0003Dl-Mr
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 11:59:14 +0000
X-Inumbo-ID: 6a609e04-40fc-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6a609e04-40fc-11ea-b833-bc764e2007e4;
 Mon, 27 Jan 2020 11:59:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B50C8AEDE;
 Mon, 27 Jan 2020 11:59:03 +0000 (UTC)
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "david@lechnology.com" <david@lechnology.com>,
 "noralf@tronnes.org" <noralf@tronnes.org>, "sean@poorly.run"
 <sean@poorly.run>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-16-tzimmermann@suse.de>
 <74d7bb19-642f-49da-8198-56ea0c0d1a4a@epam.com>
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
Message-ID: <514e72de-76d2-ae36-506b-57e5ba035926@suse.de>
Date: Mon, 27 Jan 2020 12:59:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <74d7bb19-642f-49da-8198-56ea0c0d1a4a@epam.com>
Subject: Re: [Xen-devel] [PATCH v4 15/15] drm/xen: Explicitly disable
 automatic sending of vblank event
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>
Content-Type: multipart/mixed; boundary="===============1973739724233803891=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1973739724233803891==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vqjTbWA0zBV41FMiLSiqJ0uSdIBMqNRY9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vqjTbWA0zBV41FMiLSiqJ0uSdIBMqNRY9
Content-Type: multipart/mixed; boundary="ArlxMdsqaLtIIvoCK6DR97iWgpsIhOC3Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>,
 "david@lechnology.com" <david@lechnology.com>,
 "noralf@tronnes.org" <noralf@tronnes.org>, "sean@poorly.run"
 <sean@poorly.run>, "sam@ravnborg.org" <sam@ravnborg.org>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <514e72de-76d2-ae36-506b-57e5ba035926@suse.de>
Subject: Re: [PATCH v4 15/15] drm/xen: Explicitly disable automatic sending of
 vblank event
References: <20200123092123.28368-1-tzimmermann@suse.de>
 <20200123092123.28368-16-tzimmermann@suse.de>
 <74d7bb19-642f-49da-8198-56ea0c0d1a4a@epam.com>
In-Reply-To: <74d7bb19-642f-49da-8198-56ea0c0d1a4a@epam.com>

--ArlxMdsqaLtIIvoCK6DR97iWgpsIhOC3Y
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.01.20 um 10:53 schrieb Oleksandr Andrushchenko:
> Sorry for jumping in late
>=20
> On 1/23/20 11:21 AM, Thomas Zimmermann wrote:
>> The atomic helpers automatically send out fake VBLANK events if no
>> vblanking has been initialized. This would apply to xen, but xen has
>> its own vblank logic. To avoid interfering with the atomic helpers,
>> disable automatic vblank events explictly.
>>
>> v4:
>> 	* separate commit from core vblank changes
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>=

>=20
>> ---
>>   drivers/gpu/drm/xen/xen_drm_front_kms.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm=
/xen/xen_drm_front_kms.c
>> index 4f34c5208180..efde4561836f 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> @@ -220,6 +220,18 @@ static bool display_send_page_flip(struct drm_sim=
ple_display_pipe *pipe,
>>   	return false;
>>   }
>>  =20
>> +static int display_check(struct drm_simple_display_pipe *pipe,
>> +			 struct drm_plane_state *plane_state,
>> +			 struct drm_crtc_state *crtc_state)
>> +{
>> +	/* Make sure that DRM helpers don't send VBLANK events
> Could you please put the comment on a separate line?

You mean to add an empty line between comment and code?

>> +	 * automatically. Xen has it's own logic to do so.
>> +	 */
>> +	crtc_state->no_vblank =3D false;
> And it is still confusing, e.g. comment says
> "Make sure that DRM helpers don't send VBLANK"
> and we set "no_vblank" flag to false...

I'll rephrase and add some more context.

Best regards
Thomas

>> +
>> +	return 0;
>> +}
>> +
>>   static void display_update(struct drm_simple_display_pipe *pipe,
>>   			   struct drm_plane_state *old_plane_state)
>>   {
>> @@ -284,6 +296,7 @@ static const struct drm_simple_display_pipe_funcs =
display_funcs =3D {
>>   	.enable =3D display_enable,
>>   	.disable =3D display_disable,
>>   	.prepare_fb =3D drm_gem_fb_simple_display_pipe_prepare_fb,
>> +	.check =3D display_check,
>>   	.update =3D display_update,
>>   };
>>  =20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--ArlxMdsqaLtIIvoCK6DR97iWgpsIhOC3Y--

--vqjTbWA0zBV41FMiLSiqJ0uSdIBMqNRY9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4u0IYACgkQaA3BHVML
eiPmlwgAwCofNVRLKZmi9VADhSPulFVCsG1rDvFt2sRfI3lPDNUTYb6V1De8u0qQ
MeiCGF0wK8pYXObqGtNFpeF8h8/Aw0CMKPKy/GDCi1EjAzgqwtQ/t5Te2UtNODJb
GmamClhHyTtUs85rx00P/+YLRyG7hPDHpfAMJm8m+JyQUu6TpDy36UtBJ8WNXNNV
LXwSGPvmdvKX5powX98APbx9MIfc4Ub/+Mc/q3dG3//LorUl5PyreXt0eqDtVCB7
Da8NMzcPdMi/MOWEXAK+OgFignf/d4yY415sDALKSbFahWt6q+cU8Cw1tS0rtp+h
DsbKRXTLYvnW88m/xlL66cErXfL6tA==
=Ci8H
-----END PGP SIGNATURE-----

--vqjTbWA0zBV41FMiLSiqJ0uSdIBMqNRY9--


--===============1973739724233803891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1973739724233803891==--

