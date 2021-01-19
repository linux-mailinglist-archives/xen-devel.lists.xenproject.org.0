Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E1F2FB523
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 11:12:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70240.125986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1nz0-0005hS-Eg; Tue, 19 Jan 2021 10:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70240.125986; Tue, 19 Jan 2021 10:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1nz0-0005h3-Ab; Tue, 19 Jan 2021 10:11:30 +0000
Received: by outflank-mailman (input) for mailman id 70240;
 Tue, 19 Jan 2021 10:11:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=299E=GW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1nyy-0005gy-Vl
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 10:11:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 793657af-7eac-407d-935e-182376022c39;
 Tue, 19 Jan 2021 10:11:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0EE9BACAC;
 Tue, 19 Jan 2021 10:11:27 +0000 (UTC)
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
X-Inumbo-ID: 793657af-7eac-407d-935e-182376022c39
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611051087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JsGTkhtRuxb3Ac4Sx1XpqYNH/VVhKMi8Dm3Oi6h0IzI=;
	b=lgcWFVcjFOkeKZVmlSfj553CkEvLCYCD0J/1huVT/eXp4/5H20zzyC6u3mxnsvoevbLpAW
	qsaFdbayRX+hOtvUflhRDpE7Opn1orstZJ41uhTtRBuVqBI6SXrWxZJ9JOQoRkyW+wuC1R
	YfgF/5P7aQIXp6YDB4j1lGh9Oqho070=
Subject: Re: [PATCH] xen-blkfront: don't make discard-alignment mandatory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Arthur Borsboom <arthurborsboom@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe
 <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org
References: <20210118151528.81668-1-roger.pau@citrix.com>
 <7cef385d-efe3-2661-bee2-9d21f159a5fb@suse.com>
 <20210119100651.afyccratx6ha52kc@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20969962-331d-50d9-dc65-772b564ab1c6@suse.com>
Date: Tue, 19 Jan 2021 11:11:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210119100651.afyccratx6ha52kc@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ylEqUBRZNTFs0WBSkCXClikBiPWK8t7Ny"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ylEqUBRZNTFs0WBSkCXClikBiPWK8t7Ny
Content-Type: multipart/mixed; boundary="UgLdTB1bgFg08HjZtFhPNLleFdwEFI4mE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, Arthur Borsboom <arthurborsboom@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Jens Axboe
 <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org
Message-ID: <20969962-331d-50d9-dc65-772b564ab1c6@suse.com>
Subject: Re: [PATCH] xen-blkfront: don't make discard-alignment mandatory
References: <20210118151528.81668-1-roger.pau@citrix.com>
 <7cef385d-efe3-2661-bee2-9d21f159a5fb@suse.com>
 <20210119100651.afyccratx6ha52kc@Air-de-Roger>
In-Reply-To: <20210119100651.afyccratx6ha52kc@Air-de-Roger>

--UgLdTB1bgFg08HjZtFhPNLleFdwEFI4mE
Content-Type: multipart/mixed;
 boundary="------------D45C3EBEC939FF19C0556E34"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D45C3EBEC939FF19C0556E34
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.01.21 11:06, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 19, 2021 at 08:43:01AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 18.01.21 16:15, Roger Pau Monne wrote:
>>> Don't require the discard-alignment xenstore node to be present in
>>> order to correctly setup the feature. This can happen with versions o=
f
>>> QEMU that only write the discard-granularity but not the
>>> discard-alignment node.
>>>
>>> Assume discard-alignment is 0 if not present. While there also fix th=
e
>>> logic to not enable the discard feature if discard-granularity is not=

>>> present.
>>>
>>> Reported-by: Arthur Borsboom <arthurborsboom@gmail.com>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> ---
>>> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>>> Cc: Juergen Gross <jgross@suse.com>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
>>> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
>>> Cc: Jens Axboe <axboe@kernel.dk>
>>> Cc: xen-devel@lists.xenproject.org
>>> Cc: linux-block@vger.kernel.org
>>> Cc: Arthur Borsboom <arthurborsboom@gmail.com>
>>> ---
>>>    drivers/block/xen-blkfront.c | 25 +++++++++++++------------
>>>    1 file changed, 13 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/block/xen-blkfront.c b/drivers/block/xen-blkfron=
t.c
>>> index 5265975b3fba..5a93f7cc2939 100644
>>> --- a/drivers/block/xen-blkfront.c
>>> +++ b/drivers/block/xen-blkfront.c
>>> @@ -2179,22 +2179,23 @@ static void blkfront_closing(struct blkfront_=
info *info)
>>>    static void blkfront_setup_discard(struct blkfront_info *info)
>>>    {
>>> -	int err;
>>> -	unsigned int discard_granularity;
>>> -	unsigned int discard_alignment;
>>> +	unsigned int discard_granularity =3D 0;
>>> +	unsigned int discard_alignment =3D 0;
>>> +	unsigned int discard_secure =3D 0;
>>> -	info->feature_discard =3D 1;
>>> -	err =3D xenbus_gather(XBT_NIL, info->xbdev->otherend,
>>> +	xenbus_gather(XBT_NIL, info->xbdev->otherend,
>>>    		"discard-granularity", "%u", &discard_granularity,
>>>    		"discard-alignment", "%u", &discard_alignment,
>>> +		"discard-secure", "%u", &discard_secure,
>>>    		NULL);
>>
>> This would mean that "discard-secure" will be evaluated only if the
>> other two items are set in Xenstore. From blkif.h I can't see this is
>> required, and your patch is modifying today's behavior in this regard.=

>>
>> You might want to have three xenbus_read_unsigned() calls instead.
>=20
> You are right, discard-secure should be fetched regardless of whether
> discard-alignment exists.
>=20
> I can fetch discard-granularity and discard-alignment using
> xenbus_gather and keep discard-secure using xenbus_read_unsigned. Let
> me send a new version.

I'm still not convinced this is correct. blkif.h doesn't mention that
discard-alignment will be valid only with discard-granularity being
present.


Juergen

--------------D45C3EBEC939FF19C0556E34
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

--------------D45C3EBEC939FF19C0556E34--

--UgLdTB1bgFg08HjZtFhPNLleFdwEFI4mE--

--ylEqUBRZNTFs0WBSkCXClikBiPWK8t7Ny
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAGsE4FAwAAAAAACgkQsN6d1ii/Ey9X
WQgAn3h7ka+ShrUvzZW3mMqgiPrityT/EVEPJDkUSQy2LpYg00BrushWv87RwmViwob/VYUZWgZ0
mBl76Fm5vZVDpuk6ySirpcWgGx3DYHV+C6a25d4c6kstuXC5PNC9kkt7ysr6197lKreTlxjZh0kW
d9hXrP+ImHVNjU1VO2Re9k5GRPrXhwJ+NWMUFET8dP3D81knFa8rxBhJu9Qsx4FNtvzgLxDqtSED
tMUbYYQcIKfrm8OtjnO1dsyWxtizwfz9FozuF4JjjMxnTXIjxZiyAFN1Ig45B8bDcVSToNzeaexb
b/xU5jicMkEnMQ7f/M7J/9uVvS2NTyTyDTfmdp7P1A==
=+mmK
-----END PGP SIGNATURE-----

--ylEqUBRZNTFs0WBSkCXClikBiPWK8t7Ny--

