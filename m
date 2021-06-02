Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF7398269
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:01:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135517.251748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKs2-0005LB-5F; Wed, 02 Jun 2021 07:00:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135517.251748; Wed, 02 Jun 2021 07:00:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKs2-0005IU-24; Wed, 02 Jun 2021 07:00:54 +0000
Received: by outflank-mailman (input) for mailman id 135517;
 Wed, 02 Jun 2021 07:00:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loKs0-0005IM-0V
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 07:00:52 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 244085fd-4871-4959-9ff6-5ab815bfa2b1;
 Wed, 02 Jun 2021 07:00:51 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 993EE21937;
 Wed,  2 Jun 2021 07:00:50 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7809D118DD;
 Wed,  2 Jun 2021 07:00:50 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YKk1HKIst2A0UgAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 07:00:50 +0000
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
X-Inumbo-ID: 244085fd-4871-4959-9ff6-5ab815bfa2b1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622617250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fa3RUNw+SKpVsbmLK+o0PKvms/4JNeoONXmILzCMOfE=;
	b=gTxVpRZHxGHR83iKqdcL5xgF9im7Dirgal0eAkUfbvMOIMuJz80Z2bzFLcJFObGooIJ70l
	N0PAB1vnC5JnceOAuJtGo/54yY0h8bxiMvzTyHAFafskgUOQicHlfRVoT3qO8PBI7BQm+h
	CXwhRybmIwzkvkkgb6+AaaWt4H/DF2A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622617250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fa3RUNw+SKpVsbmLK+o0PKvms/4JNeoONXmILzCMOfE=;
	b=gTxVpRZHxGHR83iKqdcL5xgF9im7Dirgal0eAkUfbvMOIMuJz80Z2bzFLcJFObGooIJ70l
	N0PAB1vnC5JnceOAuJtGo/54yY0h8bxiMvzTyHAFafskgUOQicHlfRVoT3qO8PBI7BQm+h
	CXwhRybmIwzkvkkgb6+AaaWt4H/DF2A=
Subject: Re: [PATCH v20210601 00/38] leftover from 2020
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20210601161118.18986-1-olaf@aepfle.de>
 <24670339-c080-7e47-c2a8-22c22f7a719e@suse.com>
 <20210602085403.40064aed.olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <51055fa2-b57e-c66b-78d1-6f07e0164b5b@suse.com>
Date: Wed, 2 Jun 2021 09:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602085403.40064aed.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0R5yR0kmJDthhk6p7sd2UWkPl6r3fhbtk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0R5yR0kmJDthhk6p7sd2UWkPl6r3fhbtk
Content-Type: multipart/mixed; boundary="B8fhApnKctGNEhD5FJdK2EN2rNrsZclQK";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
Message-ID: <51055fa2-b57e-c66b-78d1-6f07e0164b5b@suse.com>
Subject: Re: [PATCH v20210601 00/38] leftover from 2020
References: <20210601161118.18986-1-olaf@aepfle.de>
 <24670339-c080-7e47-c2a8-22c22f7a719e@suse.com>
 <20210602085403.40064aed.olaf@aepfle.de>
In-Reply-To: <20210602085403.40064aed.olaf@aepfle.de>

--B8fhApnKctGNEhD5FJdK2EN2rNrsZclQK
Content-Type: multipart/mixed;
 boundary="------------E7EB69D824C6B123C0AD1ADA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E7EB69D824C6B123C0AD1ADA
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.06.21 08:54, Olaf Hering wrote:
> Am Wed, 2 Jun 2021 08:10:21 +0200
> schrieb Juergen Gross <jgross@suse.com>:
>=20
>> Would it be possible to split this into multiple independent
>> patches/series?
>=20
> Sure, I can send each individual part that was already sent over and ov=
er again.

IMO this will make it more probable to get at least parts committed.


Juergen

--------------E7EB69D824C6B123C0AD1ADA
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

--------------E7EB69D824C6B123C0AD1ADA--

--B8fhApnKctGNEhD5FJdK2EN2rNrsZclQK--

--0R5yR0kmJDthhk6p7sd2UWkPl6r3fhbtk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3LKEFAwAAAAAACgkQsN6d1ii/Ey+S
PAf9Ff/vwymgCqWXpq71uKpWOGKKwso8Mn9TJ7UTOFUSuPWg3FqQWvqj0ozl+2H+ZGXSaKZSaVOh
WYkCzmQ+T53zTpTjZXNw1fouBu2hC0oyDQKZiwxhDiVxp8EijSVdimO9CtIjkHqIGaPbY2QEIvSR
rgI3g64ZsYk9aYZxavm1oRGOvvEe7rqllp0Xf+jNo2WhhyS1yb1Q0H7dEQFHZdC/qizTQiDonp1D
/O9DkOhBY+AHxJdF4285ZDNtZETa9KZPe2bLqPvfkpt5z3dQ7OtPHGb0akAL7JDrrFno2E8GpHSX
krcAKEfitMMWFC5IC6nkwu2NGSdbwpXchRAGoCJ6fw==
=F354
-----END PGP SIGNATURE-----

--0R5yR0kmJDthhk6p7sd2UWkPl6r3fhbtk--

