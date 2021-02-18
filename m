Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D5631E911
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 12:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86544.162638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChl3-00009n-0K; Thu, 18 Feb 2021 11:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86544.162638; Thu, 18 Feb 2021 11:46:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lChl2-00009L-TE; Thu, 18 Feb 2021 11:46:08 +0000
Received: by outflank-mailman (input) for mailman id 86544;
 Thu, 18 Feb 2021 11:46:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UbXw=HU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lChl1-00009G-S1
 for xen-devel@lists.xenproject.org; Thu, 18 Feb 2021 11:46:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 198238a0-3583-45e7-a27f-4142ec84de20;
 Thu, 18 Feb 2021 11:46:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3B2AEACD4;
 Thu, 18 Feb 2021 11:46:06 +0000 (UTC)
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
X-Inumbo-ID: 198238a0-3583-45e7-a27f-4142ec84de20
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613648766; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IBzfMKiSeUEFSAHrVku/Sd9rNaUrGBe91U4xWJTdn5k=;
	b=pbyeaglKkYHe3qoageLH/xq1rK520BEBJihrV1YqsS0Ux9Azs2fSTUkHwz5+hKLzahIEOe
	MJX2pyQ5wcGYkqsAlGBDIfJRjyxPLBqk0wBhx54ZaOWpgOblErKLNJhNjioCfTv3p+KXIJ
	yR6HKu3KiaT452SdbFdDpNtnlCubZfQ=
Subject: Re: [PATCH v2 8/8] xen/evtchn: use READ/WRITE_ONCE() for accessing
 ring indices
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-9-jgross@suse.com>
 <6818fcde-abab-1250-119c-d0ccb8c80488@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ee288ba1-d043-81a7-3900-0b9587625743@suse.com>
Date: Thu, 18 Feb 2021 12:46:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <6818fcde-abab-1250-119c-d0ccb8c80488@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wPTjx05UixzXWOdncPbHQbYBNlaLnhaEg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wPTjx05UixzXWOdncPbHQbYBNlaLnhaEg
Content-Type: multipart/mixed; boundary="gBsCtQn6MpSbLUGhbnq3HWLUqY6yu4TxQ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <ee288ba1-d043-81a7-3900-0b9587625743@suse.com>
Subject: Re: [PATCH v2 8/8] xen/evtchn: use READ/WRITE_ONCE() for accessing
 ring indices
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-9-jgross@suse.com>
 <6818fcde-abab-1250-119c-d0ccb8c80488@citrix.com>
In-Reply-To: <6818fcde-abab-1250-119c-d0ccb8c80488@citrix.com>

--gBsCtQn6MpSbLUGhbnq3HWLUqY6yu4TxQ
Content-Type: multipart/mixed;
 boundary="------------C2FAD25BBA0FE1C6ACA23C63"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C2FAD25BBA0FE1C6ACA23C63
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.02.21 14:29, Ross Lagerwall wrote:
> On 2021-02-11 10:16, Juergen Gross wrote:
>> For avoiding read- and write-tearing by the compiler use READ_ONCE()
>> and WRITE_ONCE() for accessing the ring indices in evtchn.c.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - modify all accesses (Julien Grall)
>> ---
>>   drivers/xen/evtchn.c | 25 ++++++++++++++++---------
>>   1 file changed, 16 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
>> index 421382c73d88..620008f89dbe 100644
>> --- a/drivers/xen/evtchn.c
>> +++ b/drivers/xen/evtchn.c
>> @@ -162,6 +162,7 @@ static irqreturn_t evtchn_interrupt(int irq, void =
*data)
>>   {
>>   	struct user_evtchn *evtchn =3D data;
>>   	struct per_user_data *u =3D evtchn->user;
>> +	unsigned int prod, cons;
>>  =20
>>   	WARN(!evtchn->enabled,
>>   	     "Interrupt for port %u, but apparently not enabled; per-user %=
p\n",
>> @@ -171,10 +172,14 @@ static irqreturn_t evtchn_interrupt(int irq, voi=
d *data)
>>  =20
>>   	spin_lock(&u->ring_prod_lock);
>>  =20
>> -	if ((u->ring_prod - u->ring_cons) < u->ring_size) {
>> -		*evtchn_ring_entry(u, u->ring_prod) =3D evtchn->port;
>> +	prod =3D READ_ONCE(u->ring_prod);
>> +	cons =3D READ_ONCE(u->ring_cons);
>> +
>> +	if ((prod - cons) < u->ring_size) {
>> +		*evtchn_ring_entry(u, prod) =3D evtchn->port;
>>   		smp_wmb(); /* Ensure ring contents visible */
>> -		if (u->ring_cons =3D=3D u->ring_prod++) {
>> +		if (cons =3D=3D prod++) {
>> +			WRITE_ONCE(u->ring_prod, prod);
>>   			wake_up_interruptible(&u->evtchn_wait);
>>   			kill_fasync(&u->evtchn_async_queue,
>>   				    SIGIO, POLL_IN);
>=20
> This doesn't work correctly since now u->ring_prod is only updated if c=
ons =3D=3D prod++.

Right. Thanks for noticing.


Juergen


--------------C2FAD25BBA0FE1C6ACA23C63
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

--------------C2FAD25BBA0FE1C6ACA23C63--

--gBsCtQn6MpSbLUGhbnq3HWLUqY6yu4TxQ--

--wPTjx05UixzXWOdncPbHQbYBNlaLnhaEg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAuU30FAwAAAAAACgkQsN6d1ii/Ey/P
Kwf/VW9ZcEHbrwGNFvfbGIyw3smta72xdAKPF0aGstPUpbZ+sB98qWqf08JRnY9vFMj9KsVDHiA7
htlUBRCQbfK2KuLNP87L5GHc3sNyi5k37ylJ/TdRshwR/J9DpaBEGQzUB0Y3L3CEzE7cNWna3GHr
s0YIsBZhjeU0Sk/j+yqHp/PeXBk4XKtfHIOlUQjhHKxlfW9N3X61lK0MEG4GLKENIjfKIr2CnMGf
ovSJQqOiU43BR7rV4zgclN+WKyv2dZntDalcqG2rB0VmueNQZkgusCXVdKZWd6JdUjPHaSuu4TIB
bJBQEhoO7PaqLARC4bebpOaF6frb03kZc882C86I6w==
=HqmF
-----END PGP SIGNATURE-----

--wPTjx05UixzXWOdncPbHQbYBNlaLnhaEg--

