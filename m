Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863FA2DB12C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:21:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54424.94535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD4I-0002l7-F8; Tue, 15 Dec 2020 16:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54424.94535; Tue, 15 Dec 2020 16:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD4I-0002kl-B8; Tue, 15 Dec 2020 16:20:54 +0000
Received: by outflank-mailman (input) for mailman id 54424;
 Tue, 15 Dec 2020 16:20:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpD4H-0002kg-6H
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:20:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 916408b3-7a26-445f-8e26-8c526473c38a;
 Tue, 15 Dec 2020 16:20:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2D1E2AF73;
 Tue, 15 Dec 2020 16:20:51 +0000 (UTC)
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
X-Inumbo-ID: 916408b3-7a26-445f-8e26-8c526473c38a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608049251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DmZ7h/DBLCoQhOY4oQX/tAxepYegymf/YYc9L7Mu8Wc=;
	b=E/KYPHowoNLHSMLu1r2r/XkoZFxZht/XQQ1OWpERcYphdMxBz1Ixava7bltbdaiSJdVKhR
	Mkh8rSiIyjQG/vx4p+p4WXjhjNFKzuu8pUqe4XON4FL6B2FuzPIzAKn6cf4AoQAiytGqXV
	pL+Y+QJeHVgoUgdS+Uw5eHzW7J25YRY=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201215112610.1986-1-julien@xen.org>
 <c45407e5-3173-4f0d-453b-1a01969b667c@suse.com>
 <cbae7c17-829e-f48f-3a6a-7fee489711c2@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
Message-ID: <805b2663-ca64-1e8a-6bbf-b93ecabec979@suse.com>
Date: Tue, 15 Dec 2020 17:20:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <cbae7c17-829e-f48f-3a6a-7fee489711c2@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wdmixVwwhuxrZmeRQS48MzSJhdAj4DCSv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wdmixVwwhuxrZmeRQS48MzSJhdAj4DCSv
Content-Type: multipart/mixed; boundary="wd5TEZrMehPRZMIsv2ryB2LuRqVSKFMlJ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <805b2663-ca64-1e8a-6bbf-b93ecabec979@suse.com>
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
References: <20201215112610.1986-1-julien@xen.org>
 <c45407e5-3173-4f0d-453b-1a01969b667c@suse.com>
 <cbae7c17-829e-f48f-3a6a-7fee489711c2@xen.org>
In-Reply-To: <cbae7c17-829e-f48f-3a6a-7fee489711c2@xen.org>

--wd5TEZrMehPRZMIsv2ryB2LuRqVSKFMlJ
Content-Type: multipart/mixed;
 boundary="------------2B0BC78ED9B355EDBE488736"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2B0BC78ED9B355EDBE488736
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.12.20 14:11, Julien Grall wrote:
> Hi Juergen,
>=20
> On 15/12/2020 11:31, J=C3=BCrgen Gro=C3=9F wrote:
>> On 15.12.20 12:26, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> So far, our implementation of WARN_ON() cannot be used in the followi=
ng
>>> situation:
>>>
>>> if ( WARN_ON() )
>>> =C2=A0=C2=A0=C2=A0=C2=A0 ...
>>>
>>> This is because the WARN_ON() doesn't return whether a warning. Such
>>
>> ... warning has been triggered.
>=20
> I will add it.
>=20
>>
>>> construction can be handy to have if you have to print more informati=
on
>>> and now the stack track.
>>
>> Sorry, I'm not able to parse that sentence.
>=20
> Urgh :/. How about the following commit message:
>=20
> "So far, our implementation of WARN_ON() cannot be used in the followin=
g=20
> situation:
>=20
> if ( WARN_ON() )
>  =C2=A0 ...
>=20
> This is because WARN_ON() doesn't return whether a warning has been=20
> triggered. Such construciton can be handy if you want to print more=20
> information and also dump the stack trace.
>=20
> Therefore, rework the WARN_ON() implementation to return whether a=20
> warning was triggered. The idea was borrowed from Linux".

Better :-)

With that you can add my:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------2B0BC78ED9B355EDBE488736
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

--------------2B0BC78ED9B355EDBE488736--

--wd5TEZrMehPRZMIsv2ryB2LuRqVSKFMlJ--

--wdmixVwwhuxrZmeRQS48MzSJhdAj4DCSv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/Y4mIFAwAAAAAACgkQsN6d1ii/Ey+k
Wwf9Gu+Att8ikpwk4skeFzaW+XI8EJA+P4pPbr9x8BCUoO65W9l5/TdAmgjZvG6jDTL/iFx9wsJx
bQotyHTEouk5zjnM5Lz8kt1UB2y9XSkW9WS5uTMHK8H5/9+qEVVUIXJhgz2yRDeEPxTokGlfA7Qs
FOl5MKttNYMUSqj5E/F5kzbb0BcXhq02Zsy6XaRN2wwDg6/jAVkE+s8QY7oNOuIvMBwJOV2JGtlq
4VMhkdFfeZr4D10RHo36Mc6qMJI6bUUWUF/bqviXqFpFShJzKK9f4NBG/gtQJOPvr7mjJiB5eEsO
Pq6YA/7sFXCFkBH1J6U1gKamIUsw7WpBNtoj3Mqi7g==
=EHuk
-----END PGP SIGNATURE-----

--wdmixVwwhuxrZmeRQS48MzSJhdAj4DCSv--

