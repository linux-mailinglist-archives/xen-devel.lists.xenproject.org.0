Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FB832B648
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 10:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92783.174871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHO3T-0008C7-0n; Wed, 03 Mar 2021 09:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92783.174871; Wed, 03 Mar 2021 09:44:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHO3S-0008Bi-Tz; Wed, 03 Mar 2021 09:44:30 +0000
Received: by outflank-mailman (input) for mailman id 92783;
 Wed, 03 Mar 2021 09:44:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f8FS=IB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lHO3R-0008Bd-AH
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 09:44:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06593551-3f10-4e5f-8606-65ad8265a4db;
 Wed, 03 Mar 2021 09:44:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 78B53AC54;
 Wed,  3 Mar 2021 09:44:27 +0000 (UTC)
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
X-Inumbo-ID: 06593551-3f10-4e5f-8606-65ad8265a4db
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614764667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0eQBWFaY+hfpppgdoHy3KgIb/hWTcuY6Y9bjqFpaLwo=;
	b=adLmFtxyY5F+7eKFqKB0GbFKmAcNyqI0QJJRYIKEWQZS4QAtfd+Q8obA/TDjT5xuq0B0uR
	NuksD/023giBQbpHu3v0ocpllcdJXeyph1YclOfbwCLQ3K9x9jO09PaV/7EROjvcppwBLX
	8qZEg8FTzfzntQUQvHnfXBU8Y9EJAyg=
Subject: Re: [PATCH] efi: x86/xen: fix -Wmissing-prototypes warning
To: maqiang <maqianga@uniontech.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20210303093651.6801-1-maqianga@uniontech.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <153688d9-e4f3-fd93-5300-0732e0bddfab@suse.com>
Date: Wed, 3 Mar 2021 10:44:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210303093651.6801-1-maqianga@uniontech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="gsB2zVgEDaHkEhFZK58kWsnSfLaBdI847"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--gsB2zVgEDaHkEhFZK58kWsnSfLaBdI847
Content-Type: multipart/mixed; boundary="Lyzg1M5AwBmFicUVozbLG4FQnBANBQJ1L";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: maqiang <maqianga@uniontech.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Message-ID: <153688d9-e4f3-fd93-5300-0732e0bddfab@suse.com>
Subject: Re: [PATCH] efi: x86/xen: fix -Wmissing-prototypes warning
References: <20210303093651.6801-1-maqianga@uniontech.com>
In-Reply-To: <20210303093651.6801-1-maqianga@uniontech.com>

--Lyzg1M5AwBmFicUVozbLG4FQnBANBQJ1L
Content-Type: multipart/mixed;
 boundary="------------D2FF094F8A371A408A393371"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D2FF094F8A371A408A393371
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.03.21 10:36, maqiang wrote:
> We get 1 warning when building kernel with W=3D1:
> arch/x86/xen/efi.c:130:13: warning:
>   no previous prototype for =E2=80=98xen_efi_init=E2=80=99 [-Wmissing-p=
rototypes]
>   void __init xen_efi_init(struct boot_params *boot_params)
>=20
> In fact, this function is declared as a static inline function
> in header file, but is not decorated as a static inline function
> in source file.
> So this patch marks this function with 'static inline'.
>=20
> Signed-off-by: maqiang <maqianga@uniontech.com>
> ---
>   arch/x86/xen/efi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/xen/efi.c b/arch/x86/xen/efi.c
> index 7d7ffb9c826a..cf2e9ff3866d 100644
> --- a/arch/x86/xen/efi.c
> +++ b/arch/x86/xen/efi.c
> @@ -127,7 +127,7 @@ static enum efi_secureboot_mode xen_efi_get_secureb=
oot(void)
>   	return efi_secureboot_mode_enabled;
>   }
>  =20
> -void __init xen_efi_init(struct boot_params *boot_params)
> +static inline void __init xen_efi_init(struct boot_params *boot_params=
)

This is an absolutely wrong "fix". You are breaking a normal build
as xen_efi_init() will no longer be callable from other sources.


Juergen

--------------D2FF094F8A371A408A393371
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

--------------D2FF094F8A371A408A393371--

--Lyzg1M5AwBmFicUVozbLG4FQnBANBQJ1L--

--gsB2zVgEDaHkEhFZK58kWsnSfLaBdI847
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA/WnoFAwAAAAAACgkQsN6d1ii/Ey91
Vgf8DXDzaxMx46XQ1TEMYyqiHJXzNnOqq5+0qjL5M+zF8ZOT03eembA9mIiz6IS2nX4bReouhgNk
Fp5jAPuPro8ucxPJ1vXl0QL5CofTr7EE2o1yFuIR4lYE6dLVRHtCtoP0NbzgBCgaipunoNNLrcoe
h1idRfOG+j30cdwl0KWf2QGLRirHeTbDW/Ytzu3YQ3fbs4Dh+371M2mKBwtQien7pT91BR+mvFVA
gp58d913cqQCsIQ9pYAk06aFQ5Ex0U9C4FH60IoBWpp4um2RnKZh5yUfNIffCYp8sSa2ssPV8ztg
Bhrgs95/xUFAnLVhl+wu04/q9KopwV+O1JN1zEEXLA==
=wcBO
-----END PGP SIGNATURE-----

--gsB2zVgEDaHkEhFZK58kWsnSfLaBdI847--

