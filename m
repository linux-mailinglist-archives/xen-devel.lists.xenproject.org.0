Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E09310BAD
	for <lists+xen-devel@lfdr.de>; Fri,  5 Feb 2021 14:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81714.151078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l810k-0000jg-B8; Fri, 05 Feb 2021 13:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81714.151078; Fri, 05 Feb 2021 13:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l810k-0000jF-6u; Fri, 05 Feb 2021 13:18:58 +0000
Received: by outflank-mailman (input) for mailman id 81714;
 Fri, 05 Feb 2021 13:18:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v9N4=HH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l810i-0000hQ-7L
 for xen-devel@lists.xenproject.org; Fri, 05 Feb 2021 13:18:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d820693-8c42-47cc-8878-00c93a2ac977;
 Fri, 05 Feb 2021 13:18:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66EBDACD4;
 Fri,  5 Feb 2021 13:18:54 +0000 (UTC)
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
X-Inumbo-ID: 1d820693-8c42-47cc-8878-00c93a2ac977
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612531134; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pTSZLOXEgriFpz3J0lut/vOgfOdOE2zwhFyH5OaUsvE=;
	b=p2PWaNzHxTlrtgHO3+ZlY7hCMFejkNQBWzsvkSmW6zKrZimnj4ZyzLuLg7ytjQh+DDNspM
	rDzTeCQN2+Tez546DM9l38nqs1vgTU3MZR9mICrtQl4SSlcxcoHKmdRTDfYuRSzPD0ruBi
	bTzVrufbHzRR+SE6wxk6taGVrmf2iDY=
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
 <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
 <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
 <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
 <d6cf3dbc-9f82-8e1a-e088-f7ae036d16e3@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86/PV=3a_conditionally_a?=
 =?UTF-8?Q?void_raising_=23GP_for_early_guest_MSR_accesses?=
Message-ID: <c1346b04-0582-8e23-e44f-aa93a79b34bd@suse.com>
Date: Fri, 5 Feb 2021 14:18:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <d6cf3dbc-9f82-8e1a-e088-f7ae036d16e3@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iGlwj6RZQN2aqa54xdeBQjbTrxhYrC5l9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iGlwj6RZQN2aqa54xdeBQjbTrxhYrC5l9
Content-Type: multipart/mixed; boundary="lEe35Nm1HQbxtuyMt3UaMR52LtQdeVVdm";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c1346b04-0582-8e23-e44f-aa93a79b34bd@suse.com>
Subject: =?UTF-8?Q?Re=3a_Ping=c2=b2=3a_=5bPATCH=5d_x86/PV=3a_conditionally_a?=
 =?UTF-8?Q?void_raising_=23GP_for_early_guest_MSR_accesses?=
References: <7e69db81-cee7-3c7b-be64-4f5ff50fbe9c@suse.com>
 <cf814663-0319-6a30-f3a2-dc43432eedb1@citrix.com>
 <cf24a63e-afe9-be6a-3ab9-cc65e19a7a0f@suse.com>
 <aad25a24-b598-4c35-05f0-80f39152c11e@suse.com>
 <d4be9aea-0c14-dac6-5fb6-431f7899f075@suse.com>
 <d6cf3dbc-9f82-8e1a-e088-f7ae036d16e3@suse.com>
In-Reply-To: <d6cf3dbc-9f82-8e1a-e088-f7ae036d16e3@suse.com>

--lEe35Nm1HQbxtuyMt3UaMR52LtQdeVVdm
Content-Type: multipart/mixed;
 boundary="------------42C2FE7AE410DAD1C0CF4B04"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------42C2FE7AE410DAD1C0CF4B04
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05.02.21 14:00, Jan Beulich wrote:
> On 05.02.2021 11:56, J=C3=BCrgen Gro=C3=9F wrote:
>> As we need to consider backports of processor bug mitigations
>> in old guests, too, I think we need to have a "catch-all"
>> fallback.
>>
>> Not being able to run an old updated guest until we add handling
>> for a new MSR isn't a viable option IMO.
>=20
> I'm not sure I follow you here: Such backports should still make
> use of the respective CPUID bits, and hence shouldn't contain
> "blind" MSR accesses. And if there's really something needing to
> probe an MSR, then I'd expect such a backport to make sure the
> probing actually works in a prereq (presumably) backport.

We know that Linux partially relies on blind MSR accesses to be
tolerated on bare metal. With this and older Xen versions having
worked by _not_ faulting when the guest accesses illegal MSRs
it is not that unlikely that some guests will suddenly fail to
boot.

Especially when backporting processor bug mitigations I could
envision not all distros will thoroughly test the kernel to still
run as PV guest on newest Xen.


Juergen

--------------42C2FE7AE410DAD1C0CF4B04
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

--------------42C2FE7AE410DAD1C0CF4B04--

--lEe35Nm1HQbxtuyMt3UaMR52LtQdeVVdm--

--iGlwj6RZQN2aqa54xdeBQjbTrxhYrC5l9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAdRb0FAwAAAAAACgkQsN6d1ii/Ey+/
gAf/fTVCQWkt3W5yU1JvSQNNF/4qXLqhQ2YjXHR+8fOz/vuiqhIIvdL0O7z6rvbrp0THyr4HmwlZ
Kvn6O8ubfqiXXwRF220u6ND35tEsEA+EFNVIggMdcpAzRacY+KFsX0DijLSl37XxApJ9ZgW8xGPr
q/uoDz40tKOpyIYzJQrkvpMmQdbtPlE5LBh6tkmRXSZKDvWLw1TRYFtgSVLSsbdw8DfEPnHn3jau
W6TqtTYDQeRX4yU2z3S5kwkqolFMNlGvuMheaKD6ZoNKHjLE8wIsBM71Tu76tRKj08GwNdN159N/
O8xFRrKAFXq68z+gG4DJ9M7CSySR+x5m84c3aKX/Tg==
=z9qQ
-----END PGP SIGNATURE-----

--iGlwj6RZQN2aqa54xdeBQjbTrxhYrC5l9--

