Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC020336F8E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Mar 2021 11:04:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96430.182412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIAX-000164-FU; Thu, 11 Mar 2021 10:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96430.182412; Thu, 11 Mar 2021 10:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKIAX-00015f-CE; Thu, 11 Mar 2021 10:03:49 +0000
Received: by outflank-mailman (input) for mailman id 96430;
 Thu, 11 Mar 2021 10:03:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+5TX=IJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lKIAV-00015a-KB
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 10:03:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f41bf96-6f13-44d1-8822-397f7f101b01;
 Thu, 11 Mar 2021 10:03:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14E6AAB8C;
 Thu, 11 Mar 2021 10:03:45 +0000 (UTC)
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
X-Inumbo-ID: 7f41bf96-6f13-44d1-8822-397f7f101b01
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615457025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zrBv3yeNQEi4FTxVugbZXds0AEKq7Mvbc2a2lRJY2NY=;
	b=s/HnHuR0Vq8+vCNuY4Jcd/4byaFQRwoP58YP+aKAVIYwPRAlBvOrEi8hT2oQSd7hV+QWhd
	m+ioUCfdRWCmaKgg58i8qPohLMJUN5iXwCZ9WDmTO0O0f771VRVbCXA4DVqaaGKBtNGwIE
	TYx2r1JBkyZT/gfqk80jydlxtOMpxms=
Subject: Re: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <161545564302.24868.14477928469038686899.stgit@Wayrath>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <56a8d23e-fb81-c1bb-1cb4-f0f74d80fb59@suse.com>
Date: Thu, 11 Mar 2021 11:03:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <161545564302.24868.14477928469038686899.stgit@Wayrath>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="w7gTCpuakZWKQJf7O4hYgFKIg1G2PhE8S"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--w7gTCpuakZWKQJf7O4hYgFKIg1G2PhE8S
Content-Type: multipart/mixed; boundary="Tibby8DABs1JDji2gMJ56LRe5HWENJR2R";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <56a8d23e-fb81-c1bb-1cb4-f0f74d80fb59@suse.com>
Subject: Re: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
References: <161545564302.24868.14477928469038686899.stgit@Wayrath>
In-Reply-To: <161545564302.24868.14477928469038686899.stgit@Wayrath>

--Tibby8DABs1JDji2gMJ56LRe5HWENJR2R
Content-Type: multipart/mixed;
 boundary="------------4DF93F1E9B9E1A54608ABA86"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4DF93F1E9B9E1A54608ABA86
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.03.21 10:40, Dario Faggioli wrote:
> When running an hypervisor build with NR_CPUS=3D1 for_each_cpu does not=

> take into account whether the bit of the CPU is set or not in the
> provided mask.
>=20
> This means that whatever we have in the bodies of these loops is always=

> done once, even if the mask was empty and it should never be done. This=

> is clearly a bug and was in fact causing an assert to trigger in credit=
2
> code.
>=20
> Removing the special casing of NR_CPUS =3D=3D 1 makes things work again=
=2E
>=20
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Wei Liu <wl@xen.org>
> ---
> I'm not really sure whether this should be 4.15 material.
>=20
> It's definitely a bug, IMO. The risk is also pretty low, considering
> that no one should really run Xen in this configuration (NR_CPUS=3D1, I=

> mean). Which is also the reason why it's probably not really important
> that we fix it at this point of the release cycle.
> ---
>   xen/include/xen/cpumask.h |    5 -----
>   1 file changed, 5 deletions(-)
>=20
> diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
> index 256b60b106..e69589fc08 100644
> --- a/xen/include/xen/cpumask.h
> +++ b/xen/include/xen/cpumask.h
> @@ -368,15 +368,10 @@ static inline void free_cpumask_var(cpumask_var_t=
 mask)
>   #define FREE_CPUMASK_VAR(m) free_cpumask_var(m)
>   #endif
>  =20
> -#if NR_CPUS > 1
>   #define for_each_cpu(cpu, mask)			\
>   	for ((cpu) =3D cpumask_first(mask);	\
>   	     (cpu) < nr_cpu_ids;		\
>   	     (cpu) =3D cpumask_next(cpu, mask))
> -#else /* NR_CPUS =3D=3D 1 */
> -#define for_each_cpu(cpu, mask)			\
> -	for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)(mask))
> -#endif /* NR_CPUS */

Wouldn't it make sense to drop the other NR_CPUS =3D=3D 1 optimization
further down, too?

IMO this is adding clutter for no real gain, as NR_CPUS =3D=3D 1 Xen
hypervisor builds aiming at high performance are probably not
existing anywhere in the universe.


Juergen

--------------4DF93F1E9B9E1A54608ABA86
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------4DF93F1E9B9E1A54608ABA86--

--Tibby8DABs1JDji2gMJ56LRe5HWENJR2R--

--w7gTCpuakZWKQJf7O4hYgFKIg1G2PhE8S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBJ6wAFAwAAAAAACgkQsN6d1ii/Ey8U
RAf9EZ+AYD7wC7n6JwmhbaotDCQ3ZTkMy3jy06XpcXNKjsXvLZ6Memywm0LTb9tPWsSYN51o2QAB
8z88RhSAKbPPL3rwt+Hb3Q8cqZQWA/BCwHKJunjhFIHMU9TnG/z2cc97wrDYXbC5WGkVDX5egCiV
nMzGKdRWY13JtfTAA7U3F/PgilcTRAKAtX1w3mAini5bE0W+hb7Fc63fnsiSxLeXp0KjXwEbp1bb
d5Tt3csx7bmCZVoliK7wr7F/F8/UItB5FoVmrumidHUC4pSL2A3rzhMiKKyKsA9DI43DVEAZH8lj
BUEzrUSrQxoKQIHZR125bwoXUYxAC31iXlvOuk0SuA==
=/i7+
-----END PGP SIGNATURE-----

--w7gTCpuakZWKQJf7O4hYgFKIg1G2PhE8S--

