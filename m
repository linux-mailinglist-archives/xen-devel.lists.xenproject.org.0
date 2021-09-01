Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DAD3FD421
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 09:00:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176064.320480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLKDB-0006SK-V8; Wed, 01 Sep 2021 06:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176064.320480; Wed, 01 Sep 2021 06:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLKDB-0006QP-Qt; Wed, 01 Sep 2021 06:59:05 +0000
Received: by outflank-mailman (input) for mailman id 176064;
 Wed, 01 Sep 2021 06:59:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0rUu=NX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mLKD9-0006QJ-Kj
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 06:59:03 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1e57438-37fa-409d-9e25-070c2e6561ae;
 Wed, 01 Sep 2021 06:59:02 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 97205224CB;
 Wed,  1 Sep 2021 06:59:01 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 62F5A13A1F;
 Wed,  1 Sep 2021 06:59:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ZA3wFbUkL2HAcwAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 01 Sep 2021 06:59:01 +0000
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
X-Inumbo-ID: c1e57438-37fa-409d-9e25-070c2e6561ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630479541; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dQEcCvQxlYcDyTgM3abdo+HELlzPwv5DmTjSLpwwCp8=;
	b=J5K5h0fWCcbU5znY17gvu3jIq9XGMSOEqgRfdujdPvWar8cF2r02uv3WQ1vXe5IOl4EUA1
	p5wfzv3NtLvuyjh6pd5OYFU6xJ1Gb8QaQB/TGIil4sYnLScb6E32Rd2R5CHxHElybZnc6u
	SpWUq8AicsFlKqBRKha+VysN9apDjzs=
To: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-3-jgross@suse.com>
 <24836.28.655841.510063@mariner.uk.xensource.com>
 <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
 <6ced9858-d425-887c-0045-1aad8521b826@suse.com>
 <c0a6bb5a-3bd8-b1cf-9973-7a95b347befc@xen.org>
 <9352f82a-1b43-4bf6-8b0a-5916627b7537@citrix.com>
 <24878.15168.981558.748531@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
Message-ID: <ea834f80-45ce-821a-bb2b-4a56dddff156@suse.com>
Date: Wed, 1 Sep 2021 08:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24878.15168.981558.748531@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="577crmY70HNGhRZXW3JEPSJJJKYN1HDBl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--577crmY70HNGhRZXW3JEPSJJJKYN1HDBl
Content-Type: multipart/mixed; boundary="ywNSWkD3TBAB3AsiWAojb1IzUR6xZNn5l";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
Message-ID: <ea834f80-45ce-821a-bb2b-4a56dddff156@suse.com>
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-3-jgross@suse.com>
 <24836.28.655841.510063@mariner.uk.xensource.com>
 <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
 <6ced9858-d425-887c-0045-1aad8521b826@suse.com>
 <c0a6bb5a-3bd8-b1cf-9973-7a95b347befc@xen.org>
 <9352f82a-1b43-4bf6-8b0a-5916627b7537@citrix.com>
 <24878.15168.981558.748531@mariner.uk.xensource.com>
In-Reply-To: <24878.15168.981558.748531@mariner.uk.xensource.com>

--ywNSWkD3TBAB3AsiWAojb1IzUR6xZNn5l
Content-Type: multipart/mixed;
 boundary="------------2FA5F4FC3F8FB8D34C158FAB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2FA5F4FC3F8FB8D34C158FAB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 31.08.21 16:22, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH v3 2/2] tools/xenstore: set open file=
 descriptor limit for xenstored"):
>> xenstored is TCB.=C2=A0 It needs a large number of FDs, and can be tru=
sted
>> with unlimited.
>=20
> I baseically agree with this.
>=20
>> Also, like xenconsoled, we can calculate an upper bound, which is
>> derived from the ABI limit of 32k domids.
>=20
> IMO the default should support at leaat this much.
>=20
> However, I don't think you are right, because xenstored offers console
> connections to (possibly arbitrarily many) local socket connections.
>=20
>> All you're haggling over is the error semantics in the case of:
>> 1) the upper bound calculation is wrong, or
>> 2) there is an fd leak
>>
>> Personally, I think a fixed calculation is right, so fd leaks can be
>> spotted more obviously.
>>
>> An admin knob is not helpful - higher than the upper bound is just
>> wasteful, while lower will cause malfunctions.
>=20
> I don't agree.  Firstly, on a technical level, your statement is true
> only if the admin does not know they will be running a much smaller
> number of domains.  Secondly, we have had several people saying they
> want this to be configurable.  I think if several people say they want
> something to be configurable, we should respect that, even if we think
> the use cases for it are marginal.  If there are hazards in bad
> settings of such a know, that can be dealt with in the docs.
>=20
> Julien's point about not having the limit set by xenstored itself is
> very well taken.
>=20
> ISTM that the following scheme is in the intersection of everyone's
> requirements:
>=20
>   * The limit will be adjusted/imposed in the startup script.
>   * An /etc/{default,sysconfig} parameter will be provided to
>     adjust the setting.
>   * The default should be `unlimtied` since we cannot calculate
>     a safe upper bound for all configurations.
>   * Systems like Citrix Hypervisor (XenServer) which can calculate
>     a safe upper bound can do so, and adjust the default, enabling
>     them to spot fd leaks.

Makes sense for me.

So this would mean:
- the sysconfig parameter will no longer be "number of domains", but the
   fd limit of the Xenstore daemon
- default should be "unlimited"
- the comment should mention the current number of fds needed per domain
   (5 for HVM, 2 for PV/PVH) plus some headroom in dom0 (without any
   guest running on my test system 21 fds are active, so I guess a value
   of 50 seems appropriate)

Is this okay?


Juergen

--------------2FA5F4FC3F8FB8D34C158FAB
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

--------------2FA5F4FC3F8FB8D34C158FAB--

--ywNSWkD3TBAB3AsiWAojb1IzUR6xZNn5l--

--577crmY70HNGhRZXW3JEPSJJJKYN1HDBl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEvJLQFAwAAAAAACgkQsN6d1ii/Ey/m
LAf/augriOmlOWBkKyHqCAop9REFqosu6ecM2bTY+wMEDH1eViKcztGSHMRS5bMWh7B9vhJNrZGR
JAyQ4TZCDniurFuESay4A6up1MAgzomB9ha8LoubESK34kjoias1CO86XQz95+1+2KyRquf7qgaE
dIAuGCHhlobBhHyzFqZ3p5VYJZJGdrtluZpKHy94r/588EJQtSkZh2S9ewFoRtE4bdLB8C5FwmSB
YWCWvqV0fKUDF1wE+asz/zK0yyZckk3vIXwhj5LSWDrC7EC/Odtq1foUakyzxwEDNu0wX+rqiURy
KHOR6jqqXYS9d915P5B6BjZi7qgVJC/9+QjplC6/Bg==
=YC3z
-----END PGP SIGNATURE-----

--577crmY70HNGhRZXW3JEPSJJJKYN1HDBl--

