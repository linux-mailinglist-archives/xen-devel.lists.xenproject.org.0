Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A740668E
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 06:45:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183932.332339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOYP1-00068X-Lf; Fri, 10 Sep 2021 04:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183932.332339; Fri, 10 Sep 2021 04:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOYP1-00066S-Hn; Fri, 10 Sep 2021 04:44:39 +0000
Received: by outflank-mailman (input) for mailman id 183932;
 Fri, 10 Sep 2021 04:44:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dvCC=OA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mOYOz-00066M-Ul
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 04:44:37 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c494b8d3-6bb9-46d3-82e0-3b4fa6b2a295;
 Fri, 10 Sep 2021 04:44:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 08AED1FE3D;
 Fri, 10 Sep 2021 04:44:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D815013BB2;
 Fri, 10 Sep 2021 04:44:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id le9DM7PiOmE4eAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Sep 2021 04:44:35 +0000
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
X-Inumbo-ID: c494b8d3-6bb9-46d3-82e0-3b4fa6b2a295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631249076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gDHnr6rSrqz9WZGMFBuEgXHRVpjqKevg2d5p7wUIXic=;
	b=YrOoe8H1VnhcP7MWfmWDicjO2rcuT2iLS+i15YpPCJIxWpuJbw6fl5L8eetbd/Imsoe4eR
	FMa0v1YAT5hpReF1roDHDG9mGtO6ddjdYFodxZt3R8/UffWbNazdrxMI76mEUK8Hk80VDP
	9U2mUwsOu1UZgLgO8dOEJZLOuDOej9w=
Subject: Re: [OSSTEST PATCH 4/4] mfi-common: Drop Linux dom0 i386 tests for
 newer Linux branches
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210909164703.19426-1-iwj@xenproject.org>
 <20210909164703.19426-4-iwj@xenproject.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <32619ebe-5967-4c1e-78ea-cc3e517d14ae@suse.com>
Date: Fri, 10 Sep 2021 06:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210909164703.19426-4-iwj@xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NzGroIA1Re0ObjdRqVTG2qoqMbIDhaR84"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NzGroIA1Re0ObjdRqVTG2qoqMbIDhaR84
Content-Type: multipart/mixed; boundary="Fs0diPdXcDv82H41xA5aU7wjavJVjJ47O";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Message-ID: <32619ebe-5967-4c1e-78ea-cc3e517d14ae@suse.com>
Subject: Re: [OSSTEST PATCH 4/4] mfi-common: Drop Linux dom0 i386 tests for
 newer Linux branches
References: <20210909164703.19426-1-iwj@xenproject.org>
 <20210909164703.19426-4-iwj@xenproject.org>
In-Reply-To: <20210909164703.19426-4-iwj@xenproject.org>

--Fs0diPdXcDv82H41xA5aU7wjavJVjJ47O
Content-Type: multipart/mixed;
 boundary="------------687478118A328316FDA25142"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------687478118A328316FDA25142
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.09.21 18:47, Ian Jackson wrote:
> This makes radical changes to the test ste for the linux-linus and
> linux-next branches.
>=20
> Mostly, tests are dropped but some 64-bit dom0 tests are added to
> replace them.
>=20
> Requested-by: Juergen Gross <jgross@suse.com>
> Signed-off-by: Ian Jackson <iwj@xenproject.org>

Thanks!

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------687478118A328316FDA25142
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

--------------687478118A328316FDA25142--

--Fs0diPdXcDv82H41xA5aU7wjavJVjJ47O--

--NzGroIA1Re0ObjdRqVTG2qoqMbIDhaR84
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE64rMFAwAAAAAACgkQsN6d1ii/Ey9x
6gf+OuvV7ognuFHN0e2iMVFRk6D/oJKn8eYBdeX/1WQLMC2TX1ttpqnKwJHUhMVqGPadTPWfo9e9
7hZQWchIqDCDUSwGRVS064pUCXly+IG1pJ5ZtSvExVN8tXua+3QYWaTt7xqupsyl3JcGlfSriF9R
bkasW0kjRZvbewbasNxX9+U2ocRR8SsgMuprBKHcz6v+dOzmZ6n7HHbTVbAogIv8SAdy4A3eBBZk
G7jleVLvjduDyGfzf9GlUTmaRTW43sTd1nCFL8NQIXGMKgDq4vZAKjhXyx6PyCYkSqgI+SuuSinY
yQF5y581NgeLQNjGOfzM3HLnul89ppHCpcsmLQts7Q==
=DaCC
-----END PGP SIGNATURE-----

--NzGroIA1Re0ObjdRqVTG2qoqMbIDhaR84--

