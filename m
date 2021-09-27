Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA64190FE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:39:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196518.349397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmAM-000134-7r; Mon, 27 Sep 2021 08:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196518.349397; Mon, 27 Sep 2021 08:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUmAM-00010j-4S; Mon, 27 Sep 2021 08:39:14 +0000
Received: by outflank-mailman (input) for mailman id 196518;
 Mon, 27 Sep 2021 08:39:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eI72=OR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mUmAK-00010d-OB
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:39:12 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21fa6869-18a8-48d7-8370-d93c1aae2b8f;
 Mon, 27 Sep 2021 08:39:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB6BD1FCA1;
 Mon, 27 Sep 2021 08:39:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF67213A6A;
 Mon, 27 Sep 2021 08:39:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zrCPLS6DUWFgUwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Sep 2021 08:39:10 +0000
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
X-Inumbo-ID: 21fa6869-18a8-48d7-8370-d93c1aae2b8f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632731950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/PepU/LSHcq6TFMs1pB5DOt7QZ46FEunMd4xzBPB8Kg=;
	b=lOvVl+S37dWhlanslNkNr+R9cEIAm7v4xwXqiELFLpvkN9GoZ0n/Z2MDOVUifx/Bx2sxeu
	tb98hgNqvxjQn3stPf7vJFLw+Km7D5/Wy7B5MD8sgpzc5qtwkGilLw7yAyE6hDIz5pf3yk
	aplDGCVpNzP/2pqu4Ltd8ByXZZvY5vA=
Subject: Re: [PATCH 1/2] include/public: add possible status values to usbif.h
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20210924150424.10047-1-jgross@suse.com>
 <20210924150424.10047-2-jgross@suse.com>
 <8d9f549c-108f-17a8-e8f3-fb9b52442d5f@suse.com>
 <28a9b815-0903-a06c-1b17-4aeceb3604f5@suse.com>
 <795058eb-7489-8303-fd24-14b94762f74d@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e8de197a-78c2-fa79-217b-8d3e62b08576@suse.com>
Date: Mon, 27 Sep 2021 10:39:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <795058eb-7489-8303-fd24-14b94762f74d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fZOZ0TIThMgs5RRlYgAo5Tw6GHLWZxf08"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fZOZ0TIThMgs5RRlYgAo5Tw6GHLWZxf08
Content-Type: multipart/mixed; boundary="YIMQNNkCwCgJGF6oeDmBuOaUlum7PWgzI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <e8de197a-78c2-fa79-217b-8d3e62b08576@suse.com>
Subject: Re: [PATCH 1/2] include/public: add possible status values to usbif.h
References: <20210924150424.10047-1-jgross@suse.com>
 <20210924150424.10047-2-jgross@suse.com>
 <8d9f549c-108f-17a8-e8f3-fb9b52442d5f@suse.com>
 <28a9b815-0903-a06c-1b17-4aeceb3604f5@suse.com>
 <795058eb-7489-8303-fd24-14b94762f74d@suse.com>
In-Reply-To: <795058eb-7489-8303-fd24-14b94762f74d@suse.com>

--YIMQNNkCwCgJGF6oeDmBuOaUlum7PWgzI
Content-Type: multipart/mixed;
 boundary="------------97330C727B8B157167884C5A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------97330C727B8B157167884C5A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.09.21 10:27, Jan Beulich wrote:
> On 27.09.2021 10:20, Juergen Gross wrote:
>> On 27.09.21 10:13, Jan Beulich wrote:
>>> On 24.09.2021 17:04, Juergen Gross wrote:
>>>> The interface definition of PV USB devices is lacking the specificat=
ion
>>>> of possible values of the status filed in a response. Those are
>>>> negative errno values as used in Linux, so they might differ in othe=
r
>>>> OS's. Specify them via appropriate defines.
>>>
>>> What if new errno values got used by the driver? Would we alter the
>>> public header every time? Or is the likelihood of further values ever=

>>> getting used vanishingly small? In how far would it be possible to ti=
e
>>> these to Xen's public/errno.h instead?
>>
>> Those are the current values returned by the backend. Other ones used
>> internally in the backend should IMO tried to be mapped to the values
>> defined in the interface specification.
>=20
> In which case I'd like to reword my question: Is the set of values adde=
d
> sufficiently rich? There's e.g. no ENOMEM equivalent.

Those are mapped to ESHUTDOWN today.

> One other observation: Why is this header using tab indentation? This i=
s
> by far the largest (albeit sadly not the only) of the style violators i=
n
> xen/include/public/io/.

Good question. This seems to date back to its introduction back in
2009.

I can add a style fixup patch to the series.


Juergen

--------------97330C727B8B157167884C5A
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

--------------97330C727B8B157167884C5A--

--YIMQNNkCwCgJGF6oeDmBuOaUlum7PWgzI--

--fZOZ0TIThMgs5RRlYgAo5Tw6GHLWZxf08
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFRgy4FAwAAAAAACgkQsN6d1ii/Ey9v
hgf/enOFGES+bH3bIVamGP6JFrCREZa4+wIuhJhjB9+QEVvSwwU6/YNXnBkK5NRL1WoV2ii3Fzen
YaOvI/o+5Hcqra8l8fo/ZyFaggwO1v9xqQbCsi2+QSOzPaMf89uDzghDFeLCZqMGh+57VlcDF8hU
svOygf0C7UJgvFvdGn038dAtmT/QuMq3AzMLG3d+2yuJSAP1wU4wfDvFsiH26zsF2aCJXIyxQ+BP
dXg2BEppnVGqSjaDooS19vx3Pq05tnQtVlJr08YdsWMe4rm2WAAf7hRXQYoFPG2UqDLzMQfUie96
fyc0aWPVFT8vEP/u/C+/W3uXilWt2Uaj8gK1Of463w==
=+p45
-----END PGP SIGNATURE-----

--fZOZ0TIThMgs5RRlYgAo5Tw6GHLWZxf08--

