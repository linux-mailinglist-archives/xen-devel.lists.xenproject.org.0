Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC17325FCD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 10:15:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90165.170625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZDI-0000sP-Sb; Fri, 26 Feb 2021 09:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90165.170625; Fri, 26 Feb 2021 09:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFZDI-0000s0-Pe; Fri, 26 Feb 2021 09:15:08 +0000
Received: by outflank-mailman (input) for mailman id 90165;
 Fri, 26 Feb 2021 09:15:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScZz=H4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lFZDI-0000rv-1m
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 09:15:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7383fb95-ada9-4ace-883b-fabbe6cfdad6;
 Fri, 26 Feb 2021 09:15:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8A54CAE7F;
 Fri, 26 Feb 2021 09:15:06 +0000 (UTC)
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
X-Inumbo-ID: 7383fb95-ada9-4ace-883b-fabbe6cfdad6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614330906; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MVqf+6P7NgMTIo1bBRbmI+TeVBA095XQsl4CCk2FjmQ=;
	b=Sp4F6hF3gWBgTQma3ANXsWbokAd8QsQrDfjaDYFbbXNhmu+cUB0wzzZJUmzaVirJ+AH+iT
	tsp4efWNk3hRvCdkBI+lvVerEH8V+3vEe0L4WmjWdhe1fS2hKwn+an6W8niJki0dm1+jtB
	UFky8ggr6rsl7EQQN+aNbR6bvdD0ef8=
Subject: Re: [PATCH for-4.15 5/5] tools/xenstored: Silence coverity when using
 xs_state_* structures
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 "Manthey, Norbert" <nmanthey@amazon.de>
References: <20210225174131.10115-1-julien@xen.org>
 <20210225174131.10115-6-julien@xen.org>
 <0aa89914-8fae-3731-a5a0-ccf4316ce96b@suse.com>
 <37e219e6-a66b-383d-2a60-b61fdd1d66a8@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0b1875a0-9c42-d778-6574-dbab73da0f8a@suse.com>
Date: Fri, 26 Feb 2021 10:15:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <37e219e6-a66b-383d-2a60-b61fdd1d66a8@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="voVPsjpDiK9b0IyDi9b6UtG5X38R1QPW9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--voVPsjpDiK9b0IyDi9b6UtG5X38R1QPW9
Content-Type: multipart/mixed; boundary="yQPH7TVCtHo0Ergb7h0bnhRxhInnsbE8b";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 "Manthey, Norbert" <nmanthey@amazon.de>
Message-ID: <0b1875a0-9c42-d778-6574-dbab73da0f8a@suse.com>
Subject: Re: [PATCH for-4.15 5/5] tools/xenstored: Silence coverity when using
 xs_state_* structures
References: <20210225174131.10115-1-julien@xen.org>
 <20210225174131.10115-6-julien@xen.org>
 <0aa89914-8fae-3731-a5a0-ccf4316ce96b@suse.com>
 <37e219e6-a66b-383d-2a60-b61fdd1d66a8@xen.org>
In-Reply-To: <37e219e6-a66b-383d-2a60-b61fdd1d66a8@xen.org>

--yQPH7TVCtHo0Ergb7h0bnhRxhInnsbE8b
Content-Type: multipart/mixed;
 boundary="------------250CA52837D796791E934D2B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------250CA52837D796791E934D2B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26.02.21 09:57, Julien Grall wrote:
> Hi Juergen,
>=20
> On 26/02/2021 07:10, J=C3=BCrgen Gro=C3=9F wrote:
>> On 25.02.21 18:41, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Coverity will report unitialized values for every use of xs_state_*
>>> structures in the save part. This can be prevented by using the [0]
>>> rather than [] to define variable length array.
>>>
>>> Coverity-ID: 1472398
>>> Coverity-ID: 1472397
>>> Coverity-ID: 1472396
>>> Coverity-ID: 1472395
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Sorry, but Coverity is clearly wrong here.
> I saw what Andrew wrote but neither of you really provided enough=20
> information to infer the same. Care to provide more details?
>=20
>>
>> Should we really modify our code to work around bugs in external
>> static code analyzers?
>=20
> I don't think it is OK to have 866 issues (and counting) and keep=20
> ignoring them because Coverity may be wrong. We should fix them one way=
=20
> or another. If this means telling Coverity they are reporting false=20
> positive, then fine.
>=20
> But for that, I first needs a bit more details why they are clearly wro=
ng.

Lets put it this way: why is a[0] not critical, but a[] is?

Semantically there is no difference, so Coverity MUST be wrong in
some way (either a[] is really not critical, or a[0] should be
critical).

Juergen

--------------250CA52837D796791E934D2B
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

--------------250CA52837D796791E934D2B--

--yQPH7TVCtHo0Ergb7h0bnhRxhInnsbE8b--

--voVPsjpDiK9b0IyDi9b6UtG5X38R1QPW9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA4vBkFAwAAAAAACgkQsN6d1ii/Ey9s
Hgf+NUil6kTVxq+F799YDlzgbnrOQrWfS04LDvRc894+QA+ZTUAtywxu+kSxxa/88m8ThAna+zs6
v3HGMKMXeDbVRjJCaB482uzL3YKV/4BiFmRAw9j0f/NvPZ7O/sOvNsHKtsosN0AR57u1SrSaHiND
DEBB1XdoMWoyP+scAlH7Z8441P9JRbS6enIe/RfnC53ALaiLdSI14d5tUd4oFPMQ/jgDKahbOJeo
DoDzHAQUDYGlj5AN0GdUgLGaxLIsgHBwcD5DrRmxohJL2OuDii0rZOlCgQnkCxPSjA8BL6POWud1
VIarJPAHn15nQW82LLEZpmYqjQyiU0HpFHWKBQC7/w==
=YY/q
-----END PGP SIGNATURE-----

--voVPsjpDiK9b0IyDi9b6UtG5X38R1QPW9--

