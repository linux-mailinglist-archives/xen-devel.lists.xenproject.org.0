Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBEE406D29
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184455.333100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgwO-0005Wl-S6; Fri, 10 Sep 2021 13:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184455.333100; Fri, 10 Sep 2021 13:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgwO-0005TS-P6; Fri, 10 Sep 2021 13:51:40 +0000
Received: by outflank-mailman (input) for mailman id 184455;
 Fri, 10 Sep 2021 13:51:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dvCC=OA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOgwM-0005TK-U8
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:51:38 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 147edc5c-e521-4a01-9dd6-aed65e8687cb;
 Fri, 10 Sep 2021 13:51:38 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6BA5022411;
 Fri, 10 Sep 2021 13:51:37 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 383811365E;
 Fri, 10 Sep 2021 13:51:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id DvJDDOliO2HBfgAAGKfGzw
 (envelope-from <jgross@suse.com>); Fri, 10 Sep 2021 13:51:37 +0000
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
X-Inumbo-ID: 147edc5c-e521-4a01-9dd6-aed65e8687cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631281897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IL7RrHLyO1ms5CLZ2fiGdAXRGauatY8lCYmybpVEy6E=;
	b=MVkezbcD9xozlvJMYO26w2ZuQzGEKuNkTZZKSGy25jk+uEvEUCpe6BgO0kx1JTplneWk0b
	yMq2XjRNmdrTeUWN2lG5T6+W7qCeRttnSR+rBpiQ7u4J8CsKhWU4IqHH0ovRCQm9uBUjOC
	nJdtnu/TiHtaPA65aSX1XFmmU6PEh1Q=
Subject: Re: Introduction of stable interface between Xenstore and hypervisor
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
 <a192a226-bdfe-6db2-c501-5e5e17c74de0@suse.com>
 <fbb173f8-f8a9-7eef-0e7d-f18dcbb422f3@suse.com>
 <f8c0e296-a942-dd95-6dfc-dc8569386bd9@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <a96ea57e-ab7b-c9ce-02c1-2061a43ee72b@suse.com>
Date: Fri, 10 Sep 2021 15:51:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f8c0e296-a942-dd95-6dfc-dc8569386bd9@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UEX5uIssnXQZuzl1oKR8iyVrTo4aNVydB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UEX5uIssnXQZuzl1oKR8iyVrTo4aNVydB
Content-Type: multipart/mixed; boundary="OC1KpLb1c0HpBKLsF0z28viaoh8UhY3JT";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <a96ea57e-ab7b-c9ce-02c1-2061a43ee72b@suse.com>
Subject: Re: Introduction of stable interface between Xenstore and hypervisor
References: <f7c54683-75d1-ded1-54d6-823dd76db030@suse.com>
 <a192a226-bdfe-6db2-c501-5e5e17c74de0@suse.com>
 <fbb173f8-f8a9-7eef-0e7d-f18dcbb422f3@suse.com>
 <f8c0e296-a942-dd95-6dfc-dc8569386bd9@xen.org>
In-Reply-To: <f8c0e296-a942-dd95-6dfc-dc8569386bd9@xen.org>

--OC1KpLb1c0HpBKLsF0z28viaoh8UhY3JT
Content-Type: multipart/mixed;
 boundary="------------AFE3E502EE27EA7685A5FC01"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AFE3E502EE27EA7685A5FC01
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.09.21 15:49, Julien Grall wrote:
>=20
>=20
> On 10/09/2021 14:46, Juergen Gross wrote:
>> On 10.09.21 15:22, Jan Beulich wrote:
>>> On 09.09.2021 08:27, Juergen Gross wrote:
>>>> - Addition of a new stable hypercall ("get domain state") returning =
the
>>>> =C2=A0=C2=A0=C2=A0 following information:
>>>> =C2=A0=C2=A0=C2=A0 + domid of a domain having the bit set in above b=
itmap
>>>> =C2=A0=C2=A0=C2=A0 + state of that domain (existing, dying)
>>>> =C2=A0=C2=A0=C2=A0 + sequence count of that domain
>>>> =C2=A0=C2=A0=C2=A0 The related bit is reset in the bitmap as a side =
effect of the=20
>>>> call.
>>>
>>> What I'd like us to consider up front is whether xenstored is going
>>> to remain only entity interested in this kind of information. The
>>> entire design looks to leverage that there's only a single consumer
>>> in the system.
>>
>> Right. I'm just writing some RFC patches, and I have coded this
>> interface to be usable only for the domain having VIRQ_DOM_EXC
>> registered.
>>
>> The alternative (IMO) would have been to expose the domain-state
>> bitmap to Xenstore (and/or other interested parties).
>=20
> If we do that, let's do in such way that guest_*_bit() helpers are not =

> necessary because they are a massive hammer on Arm. This means the=20
> bitmap would have to be read-only for the domain.

I strongly prefer my current approach not needing a shared memory page.


Juergen

--------------AFE3E502EE27EA7685A5FC01
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

--------------AFE3E502EE27EA7685A5FC01--

--OC1KpLb1c0HpBKLsF0z28viaoh8UhY3JT--

--UEX5uIssnXQZuzl1oKR8iyVrTo4aNVydB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE7YugFAwAAAAAACgkQsN6d1ii/Ey/b
xAgAlGAzep9SGniObF0t2+TXMcvxoMDfMD4nFabPse+18FvmguR6q/2jEPGG3/2zYKOLFDa9KPUi
FX+dP5+x4hfQkJEEccHcuOyQ7qYiA3zAZxCv/67/iDJ16YS413pAXmB23mTMg8XPyCZ7/9ruaUAm
7yx8eqRji3Bx8G+2W37u6NqIXSBJGQQYSLYBZ9QrYbWEw1XKHYCui5FlEInkJF+VCjtxmbmFrj1t
Qw2Gbvh+XbwiMsYAwMdpNdH4gB7N1qXBZzKtopNugmRErzVQ10yktDwu1UwsLadjyhl0EyYPK6+8
xOjhqPnBLvJ8f1dP+nNT5K1pVcssY1ltMYtYdqPIsw==
=Rc+g
-----END PGP SIGNATURE-----

--UEX5uIssnXQZuzl1oKR8iyVrTo4aNVydB--

