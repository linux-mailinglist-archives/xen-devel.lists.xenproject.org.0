Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC338ADF4
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 14:19:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130918.244963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhdP-0004wo-S3; Thu, 20 May 2021 12:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130918.244963; Thu, 20 May 2021 12:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhdP-0004te-O9; Thu, 20 May 2021 12:18:39 +0000
Received: by outflank-mailman (input) for mailman id 130918;
 Thu, 20 May 2021 12:18:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RJtO=KP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ljhdN-0004tS-VY
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 12:18:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12a63026-878b-4a1c-a4bf-f847a4ad8bcc;
 Thu, 20 May 2021 12:18:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08A69AD8A;
 Thu, 20 May 2021 12:18:36 +0000 (UTC)
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
X-Inumbo-ID: 12a63026-878b-4a1c-a4bf-f847a4ad8bcc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621513116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DEnIaLnARTFMf0ucnUE9Ck7bXS+MzTaCuja+6DqC3tc=;
	b=p0F0zqVhkj6JvuqFs3ZJs5R8Xq9YrWxGR9jBQd4NUwjYAlN6vfDBNR7kLFR157K0bNLjc3
	7nKmF0g53Dm4RK2ujjAjJzs/fMNhqcQFFgO1PInKsllIcHiTLxqjBI95KkyFr0ofNkFb7c
	FQJrHQjyberxyOsXefiUuGIJCt18fgE=
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
 <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0f407fc3-8513-341c-ef40-27d45ea74e3d@suse.com>
Date: Thu, 20 May 2021 14:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q72iP5e8UkjNkT0fjKmBcbhoD46qs6rR8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q72iP5e8UkjNkT0fjKmBcbhoD46qs6rR8
Content-Type: multipart/mixed; boundary="R2yJUS4kCF1sNHP6dXOyuqj0bUdSofBLn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <0f407fc3-8513-341c-ef40-27d45ea74e3d@suse.com>
Subject: Re: [PATCH] x86/Xen: swap NX determination and GDT setup on BSP
References: <12a866b0-9e89-59f7-ebeb-a2a6cec0987a@suse.com>
 <65bbc317-893e-da41-97e0-c8f2e1feb3e2@suse.com>
 <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>
In-Reply-To: <f594a439-ec1d-34fa-3ccf-b162441fa0af@suse.com>

--R2yJUS4kCF1sNHP6dXOyuqj0bUdSofBLn
Content-Type: multipart/mixed;
 boundary="------------30DC238A4BA0140D098F400D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------30DC238A4BA0140D098F400D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.05.21 14:08, Jan Beulich wrote:
> On 20.05.2021 13:57, Juergen Gross wrote:
>> On 20.05.21 13:42, Jan Beulich wrote:
>>> xen_setup_gdt(), via xen_load_gdt_boot(), wants to adjust page tables=
=2E
>>> For this to work when NX is not available, x86_configure_nx() needs t=
o
>>> be called first.
>>>
>>> Reported-by: Olaf Hering <olaf@aepfle.de>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
> Thanks. I guess I forgot
>=20
> Cc: stable@vger.kernel.org
>=20
> If you agree, can you please add this before pushing to Linus?

Yes, will do that.


Juergen


--------------30DC238A4BA0140D098F400D
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------30DC238A4BA0140D098F400D--

--R2yJUS4kCF1sNHP6dXOyuqj0bUdSofBLn--

--Q72iP5e8UkjNkT0fjKmBcbhoD46qs6rR8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCmU5oFAwAAAAAACgkQsN6d1ii/Ey+j
kAf/eyhf0HkvKabgDFSpdhVuwaxThATuBr75ewpXtn2n9D0iSv5VdUPbzCMRKxsSKnI96tCJ8s6l
1R2Ml0cqIK7cChueaGFnspQT6yJrC12f9cz6BL+YYjgQuBTN849Y+gUTe2HLjKTZmBso0IpKfvOy
aaQ9euDeRiClkijxLEgpoUoP+zTjemVGgT7+Ob/aKjH5pwTsykGBxLpSO4AbAMa57YEpeTjEa7E9
zXFnNrHje9LTZx+iXNhKnhQoGAk8TNxDberVP9rGoPv75PiC9QR5h46mCm44AC1WI2bJQ/+CyIna
7mJFRN5vpfo0ANVL0bN6wa9V0bF/ztQmvd9BvMiHzA==
=VBU2
-----END PGP SIGNATURE-----

--Q72iP5e8UkjNkT0fjKmBcbhoD46qs6rR8--

