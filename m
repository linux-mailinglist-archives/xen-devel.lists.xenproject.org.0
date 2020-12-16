Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55F52DBF7A
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 12:33:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55185.96105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpV3a-00012H-I9; Wed, 16 Dec 2020 11:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55185.96105; Wed, 16 Dec 2020 11:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpV3a-00011v-F4; Wed, 16 Dec 2020 11:33:22 +0000
Received: by outflank-mailman (input) for mailman id 55185;
 Wed, 16 Dec 2020 11:33:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DJND=FU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpV3Z-00011q-Dk
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 11:33:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfaaeef9-92c5-4f78-b723-5baab26969ae;
 Wed, 16 Dec 2020 11:33:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58993AD89;
 Wed, 16 Dec 2020 11:33:19 +0000 (UTC)
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
X-Inumbo-ID: bfaaeef9-92c5-4f78-b723-5baab26969ae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608118399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7qLSy5xwkYpjzjAI7FCDXImiebyhEClZDy/Z1mpd5T4=;
	b=lpEEecLTxZo9Rzo7MLRN51UTgtKCuf1lJpmoRyqc0N6QVXnfphbQFXFPMGgjaE4x4ioV0J
	xv+PqbtiDy08yqhpZW3LQnTEebdqsAbnYdk0NH9moq2E5kRWR7VbdPLl+lwCszTpI2CjKF
	s8P/ovVqVFpNQ5aWbXrTxdezyQ5MAaQ=
Subject: Re: [PATCH v10 04/25] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <20201215163603.21700-1-jgross@suse.com>
 <20201215163603.21700-5-jgross@suse.com>
 <3c8ab988-725e-2823-23f6-d9286a04243e@citrix.com>
 <e33205e7-11cb-e463-8c6f-92cfff2c74da@suse.com>
 <0ae8f6c8-266f-98e2-df83-17eeacabeaed@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <11e504a9-eab4-6dbc-ec1d-d1c8940fe56d@suse.com>
Date: Wed, 16 Dec 2020 12:33:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <0ae8f6c8-266f-98e2-df83-17eeacabeaed@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HTX4G267rjK0LiJ0qSmWJPr38r05EQrKD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HTX4G267rjK0LiJ0qSmWJPr38r05EQrKD
Content-Type: multipart/mixed; boundary="9PZJwYakkF5NodLjmZBnbbrHnD0eiI60i";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
Message-ID: <11e504a9-eab4-6dbc-ec1d-d1c8940fe56d@suse.com>
Subject: Re: [PATCH v10 04/25] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
References: <20201215163603.21700-1-jgross@suse.com>
 <20201215163603.21700-5-jgross@suse.com>
 <3c8ab988-725e-2823-23f6-d9286a04243e@citrix.com>
 <e33205e7-11cb-e463-8c6f-92cfff2c74da@suse.com>
 <0ae8f6c8-266f-98e2-df83-17eeacabeaed@citrix.com>
In-Reply-To: <0ae8f6c8-266f-98e2-df83-17eeacabeaed@citrix.com>

--9PZJwYakkF5NodLjmZBnbbrHnD0eiI60i
Content-Type: multipart/mixed;
 boundary="------------F27EC543E916B3D437042C85"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F27EC543E916B3D437042C85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.12.20 12:22, Andrew Cooper wrote:
> On 16/12/2020 06:06, J=C3=BCrgen Gro=C3=9F wrote:
>> On 15.12.20 19:09, Andrew Cooper wrote:
>>>
>>> Additionally, something in core.c should check for unknown flags and
>>> reject them them with EINVAL.=C2=A0 It was buggy that this wasn't don=
e
>>> before, and really needs to be implemented before we start having cas=
es
>>> where people might plausibly pass something other than 0.
>>
>> Are you sure this is safe? I'm not arguing against it, but we consider=
ed
>> to do that and didn't dare to.
>=20
> Well - you're already breaking things by adding meaning to bit 0 where
> it was previously ignored.

Fair enough.

> But fundamentally - any caller passing non-zero to begin with is buggy,=

> and it will be less bad to fix up our input validation and given them a=

> clean EINVAL now.

Fine with me.

> The alternative is no error and some weird side effect when we implemen=
t
> whichever bit they were settings.

Hmm, yes. I'll add the check.


Juergen

--------------F27EC543E916B3D437042C85
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

--------------F27EC543E916B3D437042C85--

--9PZJwYakkF5NodLjmZBnbbrHnD0eiI60i--

--HTX4G267rjK0LiJ0qSmWJPr38r05EQrKD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/Z8H4FAwAAAAAACgkQsN6d1ii/Ey/Y
MQf/eS2HPluXdtTR7kDq40NDkLWmCaDObxS5xKVCzlbDZwE6UfxMbxzyvPHQG1B2G/VBL5TvMdEf
joRUYw18IJbhNIB6ajmgkWyaq7ELLW0pEQSdNe3bqk3mG4ha6qSYXRkuH5qWBjUKi0ZLBciD3DjL
0l0oWDEMs/N71tNbvfmE9ZcvfFCzoRcDFDC4Abrl6gfDbv5EuVN52dSX65AcFgqZmnfHdoffQsPv
kUmtL//8a7WPBgRfGdKN95HbaxrW9RfHAmrOgO1f6cIqg/TWn+kEO/sVJzX0k2IiG72Im65XFLTa
aCXtMCRoHsReYLYkGMmzILC4LR5ztjfIjdq+EWkXxg==
=Wvng
-----END PGP SIGNATURE-----

--HTX4G267rjK0LiJ0qSmWJPr38r05EQrKD--

