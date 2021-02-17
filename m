Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 463D231D3C0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 02:24:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86085.161207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCBZH-00052T-3g; Wed, 17 Feb 2021 01:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86085.161207; Wed, 17 Feb 2021 01:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCBZH-000524-0a; Wed, 17 Feb 2021 01:23:51 +0000
Received: by outflank-mailman (input) for mailman id 86085;
 Wed, 17 Feb 2021 01:23:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrWw=HT=ozlabs.org=dgibson@srs-us1.protection.inumbo.net>)
 id 1lCBZE-00051z-R2
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 01:23:49 +0000
Received: from ozlabs.org (unknown [203.11.71.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1540d77-9901-44cf-a17e-1308f2308352;
 Wed, 17 Feb 2021 01:23:46 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DgKqL3R2Nz9sBy; Wed, 17 Feb 2021 12:23:42 +1100 (AEDT)
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
X-Inumbo-ID: d1540d77-9901-44cf-a17e-1308f2308352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1613525022;
	bh=i5csGyCZLyAc9i3KKGsKbSkGDjy55sFRwjE1x4+/oxY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ff/K0Qzt0Q0AP2MItzycNnHmFdzI6mf9iC+lPlww1oKVeZmInviIjsR7ruUoYr7V9
	 ymzTMv9Yst0C5F2rAOX9Zn3/plSkuqmotvRNBmq1cTFoofq3So1dLvfeGPXrDZbUFn
	 J7yiV4TKbyfDnYdtPavRMb1n0MclRaE4K6TOf7zY=
Date: Wed, 17 Feb 2021 11:44:41 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, julien@xen.org, stefano.stabellini@linaro.org,
	stefano.stabellini@xilinx.com, andre.przywara@arm.com,
	stratos-dev@op-lists.linaro.org, xen-devel@lists.xenproject.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH  v2 3/7] device_tree: add qemu_fdt_setprop_string_array
 helper
Message-ID: <YCxm+e2UzO9cTnl8@yekko.fritz.box>
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-4-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TO/drffHYp5rg2K/"
Content-Disposition: inline
In-Reply-To: <20210211171945.18313-4-alex.bennee@linaro.org>


--TO/drffHYp5rg2K/
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 05:19:41PM +0000, Alex Benn=E9e wrote:
> A string array in device tree is simply a series of \0 terminated
> strings next to each other. As libfdt doesn't support that directly
> we need to build it ourselves.

Hm, that might not make a bad extension to libfdt...

>=20
> Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20201105175153.30489-4-alex.bennee@linaro.org>
>=20
> ---
> v2
>   - checkpatch long line fix
> ---
>  include/sysemu/device_tree.h | 17 +++++++++++++++++
>  softmmu/device_tree.c        | 26 ++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>=20
> diff --git a/include/sysemu/device_tree.h b/include/sysemu/device_tree.h
> index 982c89345f..8a2fe55622 100644
> --- a/include/sysemu/device_tree.h
> +++ b/include/sysemu/device_tree.h
> @@ -70,6 +70,23 @@ int qemu_fdt_setprop_u64(void *fdt, const char *node_p=
ath,
>                           const char *property, uint64_t val);
>  int qemu_fdt_setprop_string(void *fdt, const char *node_path,
>                              const char *property, const char *string);
> +
> +/**
> + * qemu_fdt_setprop_string_array: set a string array property
> + *
> + * @fdt: pointer to the dt blob
> + * @name: node name
> + * @prop: property array
> + * @array: pointer to an array of string pointers
> + * @len: length of array
> + *
> + * assigns a string array to a property. This function converts and
> + * array of strings to a sequential string with \0 separators before
> + * setting the property.
> + */
> +int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
> +                                  const char *prop, char **array, int le=
n);
> +
>  int qemu_fdt_setprop_phandle(void *fdt, const char *node_path,
>                               const char *property,
>                               const char *target_node_path);
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index b9a3ddc518..2691c58cf6 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -21,6 +21,7 @@
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "qemu/bswap.h"
> +#include "qemu/cutils.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/loader.h"
> @@ -397,6 +398,31 @@ int qemu_fdt_setprop_string(void *fdt, const char *n=
ode_path,
>      return r;
>  }
> =20
> +/*
> + * libfdt doesn't allow us to add string arrays directly but they are
> + * test a series of null terminated strings with a length. We build
> + * the string up here so we can calculate the final length.
> + */
> +int qemu_fdt_setprop_string_array(void *fdt, const char *node_path,
> +                                  const char *prop, char **array, int le=
n)
> +{
> +    int ret, i, total_len =3D 0;
> +    char *str, *p;
> +    for (i =3D 0; i < len; i++) {
> +        total_len +=3D strlen(array[i]) + 1;
> +    }
> +    p =3D str =3D g_malloc0(total_len);
> +    for (i =3D 0; i < len; i++) {
> +        int len =3D strlen(array[i]) + 1;
> +        pstrcpy(p, len, array[i]);
> +        p +=3D len;
> +    }
> +
> +    ret =3D qemu_fdt_setprop(fdt, node_path, prop, str, total_len);
> +    g_free(str);
> +    return ret;
> +}
> +
>  const void *qemu_fdt_getprop(void *fdt, const char *node_path,
>                               const char *property, int *lenp, Error **er=
rp)
>  {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--TO/drffHYp5rg2K/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAsZvkACgkQbDjKyiDZ
s5JkeBAAh1nq//jzuoFXH1RTHHchSWcXwSOQwwoKtEgNymV0OYnJvVeI87h02Ryf
Q4AkWX0TRNC7xTP7fk9rJpYlIvDu+3M3fEQKu9Paz9taWc3lat8lHdRN+qoBaDuG
91smdKfWYGI1RHSj0C+pjDPa73He3JaNE4ooyJcpcAJEP38/jdVTBx1g82ZrksJQ
iKBSapz/RBX5e7LSfm5NIB7OMDXWo8vORFopz+pUKIKDKNHTWGsf29zQchuNj7v9
n62ahTYFfN7CvOsEkwccA0sqaHEKSptUFeZ9YApO9zMj/FVlyjw73RCMGFbaWTlm
m5dzj+wS+2n8iriX2pjbDp2bpREI3AJM23D5qArXfeH4ArmXNEc98canOD4/Y5zO
KrnErOnvghtt7CXfjYYyKoWixTCMw0StbSnXsWJBnF0NXhtRr2DXKLbI2mPFRzac
AnNXXAEs8CKtvWt/xPAwCTEMCTw9PkaUk18USAx2edDm+8lOWwzvRgMfDvvMRl7L
ZJxr5MXP6ZWflZCY3tLXd4nD2DT+okaxNiKv8ZuNW0HEo4pYdwni0IVc8m8ZWlIB
kEvPySjaxF5s38NoxB0ryAsuCEMnuJR8KP2cz3bYyVJ/tLE86+gevg1ztqCQzkyz
sw23wgg9Ze5ypekPbLZJ/fpVNr5/bOs3tEAvLoc14qPVaJ4PpaQ=
=OXJn
-----END PGP SIGNATURE-----

--TO/drffHYp5rg2K/--

