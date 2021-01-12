Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8523F2F2CEE
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 11:34:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65577.116206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzH0G-0000Xu-O8; Tue, 12 Jan 2021 10:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65577.116206; Tue, 12 Jan 2021 10:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzH0G-0000XV-L1; Tue, 12 Jan 2021 10:34:20 +0000
Received: by outflank-mailman (input) for mailman id 65577;
 Tue, 12 Jan 2021 10:34:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WoC4=GP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kzH0E-0000XQ-Tx
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 10:34:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2041c83f-b0e1-444c-a755-1452973c1816;
 Tue, 12 Jan 2021 10:34:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17F14ACB0;
 Tue, 12 Jan 2021 10:34:17 +0000 (UTC)
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
X-Inumbo-ID: 2041c83f-b0e1-444c-a755-1452973c1816
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610447657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SFZZDpfF7iQgyLB64Gjy2Ec9M50ve9zfNS2JavecGYQ=;
	b=Bhvj3wcMfvAoe4ex0UbCsOIaj5S8seJzu2rAgpLKZlrwBtboWVJ4Vn7elSdYfakXoj3Zzp
	cLOqwgpUu1DsEdo2LT8Jpk6RMexkdN2et408qMOSPVgpLAcdn5cjFtzh07O+kpicUVXP90
	OwO23nPE7Lj+K7EX2r2Dp1qgsI40IAI=
Subject: Re: [PATCH] xen/privcmd: allow fetching resource sizes
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20210111152958.7166-1-roger.pau@citrix.com>
 <5063e696-5a7f-4429-048e-2bf0d14881d7@suse.com>
 <20210112100324.ii34oqldfrtmfd2f@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <67725689-2eab-fd17-d330-626f3505c6c1@suse.com>
Date: Tue, 12 Jan 2021 11:34:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210112100324.ii34oqldfrtmfd2f@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UxwirFONVMB8JJkV5PFLwVBx0yZsMxDDs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UxwirFONVMB8JJkV5PFLwVBx0yZsMxDDs
Content-Type: multipart/mixed; boundary="RLMrMBUN4PwnA8AozxpnEc9O4jRLfXPBz";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <67725689-2eab-fd17-d330-626f3505c6c1@suse.com>
Subject: Re: [PATCH] xen/privcmd: allow fetching resource sizes
References: <20210111152958.7166-1-roger.pau@citrix.com>
 <5063e696-5a7f-4429-048e-2bf0d14881d7@suse.com>
 <20210112100324.ii34oqldfrtmfd2f@Air-de-Roger>
In-Reply-To: <20210112100324.ii34oqldfrtmfd2f@Air-de-Roger>

--RLMrMBUN4PwnA8AozxpnEc9O4jRLfXPBz
Content-Type: multipart/mixed;
 boundary="------------51AE5625E0FB982B0C9D67DA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------51AE5625E0FB982B0C9D67DA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.01.21 11:03, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 12, 2021 at 06:57:30AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 11.01.21 16:29, Roger Pau Monne wrote:
>>> Allow issuing an IOCTL_PRIVCMD_MMAP_RESOURCE ioctl with num =3D 0 and=

>>> addr =3D 0 in order to fetch the size of a specific resource.
>>>
>>> Add a shortcut to the default map resource path, since fetching the
>>> size requires no address to be passed in, and thus no VMA to setup.
>>>
>>> Fixes: 3ad0876554caf ('xen/privcmd: add IOCTL_PRIVCMD_MMAP_RESOURCE')=

>>
>> I don't think this addition is a reason to add a "Fixes:" tag. This is=

>> clearly new functionality.
>=20
> It could be argued that not allowing to query the resource size was a
> shortcoming of the original implementation, but a backport request to
> stable would be more appropriate than a fixes tag I think. Will drop
> on next version and add a backport request if you agree.

Yes, please.


Juergen

--------------51AE5625E0FB982B0C9D67DA
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

--------------51AE5625E0FB982B0C9D67DA--

--RLMrMBUN4PwnA8AozxpnEc9O4jRLfXPBz--

--UxwirFONVMB8JJkV5PFLwVBx0yZsMxDDs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/9eygFAwAAAAAACgkQsN6d1ii/Ey9W
9wf/SlRDkyc7MfvskNQS68Enzp7CN4wYqum4ecVl4Z3K/agV/7NRcM63knd9fQZGroZRW5+zY6Df
RGtoOdbzKD+3sg4XM1xilmPqFZqdJQcGnI6FW8C3qjFkxiQLMhkf803KYQfLxoFHROLOsrXrdCL5
VxwfoJbEfggJY4jmU+ijnGDt8tc5lrOznsnho5lc+/aJjtGuJAPPW+RdSkcxFwwuIUA8iADm5X7k
fKPpYzxbYG5yrFVXXQigPsxpsn+fazX1+UiUJtkZbQu1a3ISQQxD/vdm/9R3QdgdD0UzVZHZcpNc
AkD8EEPyezYo7zcFuCB5mHlHXx2Er+nLlJzTdF8Ccw==
=gOyn
-----END PGP SIGNATURE-----

--UxwirFONVMB8JJkV5PFLwVBx0yZsMxDDs--

