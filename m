Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24982AB0D6
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 06:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21950.48283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbznu-0003Hb-Di; Mon, 09 Nov 2020 05:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21950.48283; Mon, 09 Nov 2020 05:33:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbznu-0003HC-AM; Mon, 09 Nov 2020 05:33:22 +0000
Received: by outflank-mailman (input) for mailman id 21950;
 Mon, 09 Nov 2020 05:33:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kbzns-0003H7-Rm
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 05:33:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd2cfa72-6093-40b5-b8ed-f0a955cb0d64;
 Mon, 09 Nov 2020 05:33:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14BE8ABD1;
 Mon,  9 Nov 2020 05:33:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kbzns-0003H7-Rm
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 05:33:20 +0000
X-Inumbo-ID: cd2cfa72-6093-40b5-b8ed-f0a955cb0d64
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cd2cfa72-6093-40b5-b8ed-f0a955cb0d64;
	Mon, 09 Nov 2020 05:33:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604899999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NOCklL+dKjEBoXv5GNo9qN09vViqY6+JBVmLpt5WKQg=;
	b=V1LysvaHbM6GhlwsChd6yzwtwq5UI+QoF0lFHNURAqWLw62WXoFg9lOn5vAV6s4etOBxDN
	InKdArnbOOGFfo1qoi/dePLp+cj+yXux5N7Urx+uJmUO306HBQymgA5C6vCAfQj7CxA3Qw
	8eWm9iBnuSW4UakiT1aslQTsUVV8iOE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 14BE8ABD1;
	Mon,  9 Nov 2020 05:33:19 +0000 (UTC)
Subject: Re: [xen-unstable test] 156556: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-156556-mainreport@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3660b9c9-8246-ba12-db7a-00b07a85d6d6@suse.com>
Date: Mon, 9 Nov 2020 06:33:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <osstest-156556-mainreport@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="WBlBx1QOj8ghiAb6qb2SbL7Ho1fKaSjap"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--WBlBx1QOj8ghiAb6qb2SbL7Ho1fKaSjap
Content-Type: multipart/mixed; boundary="2rL9Pd7kUwZUmJXWSJPuoKH8SHeO7RyR2";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <3660b9c9-8246-ba12-db7a-00b07a85d6d6@suse.com>
Subject: Re: [xen-unstable test] 156556: regressions - FAIL
References: <osstest-156556-mainreport@xen.org>
In-Reply-To: <osstest-156556-mainreport@xen.org>

--2rL9Pd7kUwZUmJXWSJPuoKH8SHeO7RyR2
Content-Type: multipart/mixed;
 boundary="------------AD26196B0B9F9DAF7BA22B74"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AD26196B0B9F9DAF7BA22B74
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.11.20 03:09, osstest service owner wrote:
> flight 156556 xen-unstable real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/156556/
>=20
> Regressions :-(
>=20
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   test-amd64-i386-xl-xsm       14 guest-start              fail REGR. v=
s. 156443
>   test-amd64-amd64-xl-xsm      14 guest-start              fail REGR. v=
s. 156443
>   test-amd64-i386-libvirt-xsm  14 guest-start              fail REGR. v=
s. 156443
>   test-amd64-amd64-libvirt-xsm 14 guest-start              fail REGR. v=
s. 156443
>   test-amd64-amd64-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-i=
nstall fail REGR. vs. 156443
>   test-amd64-i386-xl-qemut-stubdom-debianhvm-amd64-xsm 12 debian-hvm-in=
stall fail REGR. vs. 156443
>   test-amd64-i386-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fai=
l REGR. vs. 156443
>   test-amd64-amd64-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-inst=
all fail REGR. vs. 156443
>   test-amd64-i386-libvirt-qemuu-debianhvm-amd64-xsm 12 debian-hvm-insta=
ll fail REGR. vs. 156443
>   test-amd64-i386-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fai=
l REGR. vs. 156443
>   test-amd64-amd64-xl-qemut-debianhvm-i386-xsm 12 debian-hvm-install fa=
il REGR. vs. 156443
>   test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install fa=
il REGR. vs. 156443

Breakage due to policy_rwlock taken with interrupts off in evtchn_send()
hinting at the further need to NOT take the per event channel lock with
the irqsave variant.


Juergen

--------------AD26196B0B9F9DAF7BA22B74
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

--------------AD26196B0B9F9DAF7BA22B74--

--2rL9Pd7kUwZUmJXWSJPuoKH8SHeO7RyR2--

--WBlBx1QOj8ghiAb6qb2SbL7Ho1fKaSjap
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+o1J4FAwAAAAAACgkQsN6d1ii/Ey/i
iAf/TrcDkALZf0KQRTSYwVDjNh9nt2GOTTBSs99tBOVNpxumdlWdaadhzu9ZbGFlUZ4YBNlyGKUZ
qCCxKbqhRfKKxkkK1hfl/1em1odnzhDqW65Ta47cftSQdc8lf5oZA2/xEyI2nRZfOhmvlUatCupv
yhk/gkPLJ/fXqHzktpL1pmQzahW1or0XQu0wmpHjR32pWifuzVKRXsI8KpiQeb3jbgpSBjQvHrfo
OeoHiYfo5b1oUQKw4nwM5X3l4IU+lNhwD/9GHNUhcu1CrRw+ShgGFHuUY5shyFTzX1LOAXMxav6M
wqSTgYsACOSzQ9g1fu4b6p1jOH/3+iJu93EDoNO3zA==
=qmbm
-----END PGP SIGNATURE-----

--WBlBx1QOj8ghiAb6qb2SbL7Ho1fKaSjap--

