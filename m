Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80733295FC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 06:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92059.173719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGxFx-0000eT-42; Tue, 02 Mar 2021 05:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92059.173719; Tue, 02 Mar 2021 05:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGxFw-0000dz-WA; Tue, 02 Mar 2021 05:07:36 +0000
Received: by outflank-mailman (input) for mailman id 92059;
 Tue, 02 Mar 2021 05:07:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRZ7=IA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lGxFv-0000dm-TZ
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 05:07:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 667f7717-0b9f-4331-8bae-4ab92f2dcaa0;
 Tue, 02 Mar 2021 05:07:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 08255AAC5;
 Tue,  2 Mar 2021 05:07:34 +0000 (UTC)
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
X-Inumbo-ID: 667f7717-0b9f-4331-8bae-4ab92f2dcaa0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614661654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zhd56q2h40yf4CYwyVp1J0Yqjyjn/Qq0s2SUWt6v318=;
	b=P+c1C7vdHpFnSHPWx8bYJSb6v395/iIeVQybU1ErFGA1d+Tu6Ip70hAfCye8A+WfNaEqfa
	Wl9t+LzoxKbaD5ijXylDZqhduJMFZT9MODSo85rczQamkGjzDorI/deysiFHqqA+1PPOlp
	+B37tioOuWVkEo66WFa8wI1lKE6nb0U=
Subject: Re: [PATCH XENSTORE v1 02/10] xenstore: fix print format string
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.co.uk>, Michael Kurth <mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-3-nmanthey@amazon.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8416bc5a-2b22-ec0f-45c5-c2c9b86bbc12@suse.com>
Date: Tue, 2 Mar 2021 06:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210226144144.9252-3-nmanthey@amazon.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9xVuo9y3JK8BNgRTfDA76bmJEPU6oxCWN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9xVuo9y3JK8BNgRTfDA76bmJEPU6oxCWN
Content-Type: multipart/mixed; boundary="ANqM4DtVSQI2qDhEIO4PPxDLfI427vRfE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.co.uk>, Michael Kurth <mku@amazon.de>
Message-ID: <8416bc5a-2b22-ec0f-45c5-c2c9b86bbc12@suse.com>
Subject: Re: [PATCH XENSTORE v1 02/10] xenstore: fix print format string
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-3-nmanthey@amazon.de>
In-Reply-To: <20210226144144.9252-3-nmanthey@amazon.de>

--ANqM4DtVSQI2qDhEIO4PPxDLfI427vRfE
Content-Type: multipart/mixed;
 boundary="------------C08D011092BAC5186A0CA174"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C08D011092BAC5186A0CA174
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26.02.21 15:41, Norbert Manthey wrote:
> Use the correct format specifier for unsigned values. Additionally, a
> cast was dropped, as the format specifier did not require it anymore.
>=20
> This was reported by analysis with cppcheck.
>=20
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Thomas Friebel <friebelt@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------C08D011092BAC5186A0CA174
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

--------------C08D011092BAC5186A0CA174--

--ANqM4DtVSQI2qDhEIO4PPxDLfI427vRfE--

--9xVuo9y3JK8BNgRTfDA76bmJEPU6oxCWN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA9yBUFAwAAAAAACgkQsN6d1ii/Ey96
nQf/YKtgLQ59zozz9M3hjFJyUv263zdM9wYenYHtxobWRKgZB8aeXtBhKJO7LRq6KCIpmPv8yOuN
/yZIy40PETWRUnuZV0rYzeoSn3cIDhI/QtXbPS57RF6bB5JsBq3OjIi3yYtkg8U1zGHYcXrsb9Mn
gXEgr36o14XgUMYzA8Miyron8rkGAdjXTGfrIUq1zkp3AhoI5L8nt1sqoczNe56+v1olT43nZjsQ
Vy239p17e4Hft3ZP/Ur9yR4XL2ioq6hY+qh+SR1k62f97G/B+RWse7WcvfZYAXalXmDNiF304tET
g6PCnX4Vrt0+C+Xvm3L1n+oT7vHWMqHcdcvxPUHfog==
=9VnZ
-----END PGP SIGNATURE-----

--9xVuo9y3JK8BNgRTfDA76bmJEPU6oxCWN--

