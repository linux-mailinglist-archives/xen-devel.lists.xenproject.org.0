Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCC2D2D95
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 15:54:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47493.84029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeN4-0005TD-Rl; Tue, 08 Dec 2020 14:53:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47493.84029; Tue, 08 Dec 2020 14:53:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmeN4-0005So-Oa; Tue, 08 Dec 2020 14:53:42 +0000
Received: by outflank-mailman (input) for mailman id 47493;
 Tue, 08 Dec 2020 14:53:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LMSP=FM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmeN3-0005Sj-Ds
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 14:53:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 504f9fbc-cb7b-47a3-8d2e-0598a0dc6a49;
 Tue, 08 Dec 2020 14:53:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CA2A6AD6B;
 Tue,  8 Dec 2020 14:53:38 +0000 (UTC)
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
X-Inumbo-ID: 504f9fbc-cb7b-47a3-8d2e-0598a0dc6a49
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607439218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V44Jrby2MLB2tq4c63oLWb52M0EgLJBv4Sbc98uXpxY=;
	b=WmbosEv9wDftM4rmmVjBmtjZbCrWZ7AZ47mEC9pE35DRneHndgiwdGtgGWPW2kLrUhlUvK
	FUjPWrfWCJA1gy7hUm33eUibxenfCelYcNfc8jzFVPsPDHts/rl4Zh1S5Qf1QbKOvwiHfd
	SNxEByDEPluL9dx154ub92WCy0GrOUE=
Subject: Re: [PATCH] xen: CONFIG_PV_SHIM_EXCLUSIVE and CONFIG_HVM are mutually
 exclusive
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20201208135146.30540-1-jgross@suse.com>
 <6d68bb96-b57f-f13a-9242-47bb8bb7fc86@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3eb661e5-ec09-af4a-868d-0e3909136802@suse.com>
Date: Tue, 8 Dec 2020 15:53:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6d68bb96-b57f-f13a-9242-47bb8bb7fc86@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZPKGI4IVok2fegTUvmt2muuekcEasmhdV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZPKGI4IVok2fegTUvmt2muuekcEasmhdV
Content-Type: multipart/mixed; boundary="9tDm7sMYzcWNTQnMvaKLotNDOX0BJyQS7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Message-ID: <3eb661e5-ec09-af4a-868d-0e3909136802@suse.com>
Subject: Re: [PATCH] xen: CONFIG_PV_SHIM_EXCLUSIVE and CONFIG_HVM are mutually
 exclusive
References: <20201208135146.30540-1-jgross@suse.com>
 <6d68bb96-b57f-f13a-9242-47bb8bb7fc86@citrix.com>
In-Reply-To: <6d68bb96-b57f-f13a-9242-47bb8bb7fc86@citrix.com>

--9tDm7sMYzcWNTQnMvaKLotNDOX0BJyQS7
Content-Type: multipart/mixed;
 boundary="------------8814A09FA15D196BB17691F0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8814A09FA15D196BB17691F0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.12.20 15:33, Andrew Cooper wrote:
> On 08/12/2020 13:51, Juergen Gross wrote:
>> With CONFIG_PV_SHIM_EXCLUSIVE some sources required for CONFIG_HVM are=

>> not built, so let CONFIG_HVM depend on !CONFIG_PV_SHIM_EXCLUSIVE.
>>
>> Let CONFIG_HVM default to !CONFIG_PV_SHIM instead.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> So while this will fix the randconfig failure, the statement isn't
> true.=C2=A0 There are HVM codepaths which aren't even dead in shim-excl=
usive
> mode.

I only said that CONFIG_PV_SHIM_EXCLUSIVE disables building some
sources which are required for CONFIG_HVM, and this is certainly true.

> The problem here is the way CONFIG_PV_SHIM_EXCLUSIVE abuses the Kconfig=

> system.=C2=A0 What is currently happening is that this option is trying=
 to
> enforce the pv shim defconfig in the dependency system.
>=20
> We already have a defconfig, which is used in appropriate locations.=C2=
=A0 We
> should not have two different things fighting over control.
>=20
> This is the fault of c/s 8b5b49ceb3d which went in despite my
> objections.=C2=A0 The change is not related to PV_SHIM_EXCLUSIVE - it i=
s to
> do with not supporting a control domain, which a) better describes what=

> it is actually doing, and b) has wider utility than PV Shim.

Yes, maybe.

Random build failures are not nice, so in case there is no agreement
how to proceed I'd be in favor for fixing the fallout and then discuss
a proper solution.


Juergen

--------------8814A09FA15D196BB17691F0
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

--------------8814A09FA15D196BB17691F0--

--9tDm7sMYzcWNTQnMvaKLotNDOX0BJyQS7--

--ZPKGI4IVok2fegTUvmt2muuekcEasmhdV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/Pk3IFAwAAAAAACgkQsN6d1ii/Ey+v
Awf9FKkt7HtG1aboK+3gUVaXQdt4oDQG2qKLWGfZph/Er/p/Xq4tJCIBkadDNKHgUwyoPz448eEn
lI62LgvtPH2/wXuecD1bKDc2oKzF0qhuX9Uy9z0B9IN7pvGNzE9pu/q2fh+rul5kK6OXoPOgViAh
YlYYmCOwPS006Fh9WUL3qF7/+PAr3ZYSCrWJRpyV83uBywGPqhQRmX/I+w8R3TKc4rbKcvDw/gMQ
fdweqoYqxwdPRofXD955dsBTh7qWyplJDmVTYoTGW4oS269r8eXS+OmcN5Vp+14YmzI9tt15ZVkn
Vly7b02dPXUDUBj2h/71RB3LogLo7SLfeDSa4H//hA==
=Qi28
-----END PGP SIGNATURE-----

--ZPKGI4IVok2fegTUvmt2muuekcEasmhdV--

