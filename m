Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C821D2FE486
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 09:00:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71919.129160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2UtF-0008Kc-Nw; Thu, 21 Jan 2021 08:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71919.129160; Thu, 21 Jan 2021 08:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2UtF-0008KD-Jc; Thu, 21 Jan 2021 08:00:25 +0000
Received: by outflank-mailman (input) for mailman id 71919;
 Thu, 21 Jan 2021 08:00:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EIdR=GY=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l2UtE-0008K7-B3
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 08:00:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4e63b373-3599-4075-a4a3-a123458a40c0;
 Thu, 21 Jan 2021 08:00:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 479E2AAAE;
 Thu, 21 Jan 2021 08:00:22 +0000 (UTC)
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
X-Inumbo-ID: 4e63b373-3599-4075-a4a3-a123458a40c0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611216022; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rX611O/1eiOtl3hKRQVbutoPHX3pqIfrHFv56IOZxjQ=;
	b=BeNMdyzVJ2T/29e343R4V12D97rEndSYGyxW6LoZuHJDjXKyRscy1LJgwKq6jIVPvZzk/Z
	iZ89wGpQUe6VwxQ9P8z3KhmTOSeAPyn3kUoQFNQXEPe3LJSnrzL7Zmuy10NAnsmniB7Trr
	QDu8J9QagLHbXlGgafarknCe/IrKvIg=
Subject: Re: [PATCH v6 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-2-jgross@suse.com>
 <4e8cc6e6-dc55-6dda-ffbc-6487e45d5aaf@xen.org>
 <9437a37b-a32c-c8c9-a539-fcc1ac3bfc3d@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ea98e8d3-e28a-6bd3-d211-7d37741040cf@suse.com>
Date: Thu, 21 Jan 2021 09:00:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9437a37b-a32c-c8c9-a539-fcc1ac3bfc3d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5JSX8kaTkjHWcLoGve7ApqR5Yw0Q92FA7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5JSX8kaTkjHWcLoGve7ApqR5Yw0Q92FA7
Content-Type: multipart/mixed; boundary="iIaZpvITTretzfpPgvq2Wgynvca0gdgDg";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <ea98e8d3-e28a-6bd3-d211-7d37741040cf@suse.com>
Subject: Re: [PATCH v6 1/3] xen/arm: add support for
 run_in_exception_handler()
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-2-jgross@suse.com>
 <4e8cc6e6-dc55-6dda-ffbc-6487e45d5aaf@xen.org>
 <9437a37b-a32c-c8c9-a539-fcc1ac3bfc3d@suse.com>
In-Reply-To: <9437a37b-a32c-c8c9-a539-fcc1ac3bfc3d@suse.com>

--iIaZpvITTretzfpPgvq2Wgynvca0gdgDg
Content-Type: multipart/mixed;
 boundary="------------49C70DA602238F8C38CFC43E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------49C70DA602238F8C38CFC43E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 21.01.21 08:55, Jan Beulich wrote:
> On 20.01.2021 19:20, Julien Grall wrote:
>> On 16/01/2021 10:33, Juergen Gross wrote:
>>> Add support to run a function in an exception handler for Arm. Do it
>>> as on x86 via a bug_frame, but pass the function pointer via a
>>> register (this needs to be done that way, because inline asm support
>>> for 32-bit Arm lacks the needed functionality to reference an
>>> arbitrary function via the bugframe).
>>
>> I was going to commit the series, but then realized the commit message=

>> and comment needs some tweaking because technically GCC is supporting
>> 'i' (I managed to get it working with -fno-pie).
>>
>> So how about:
>>
>> "This is needed to be done that way because GCC complains about invali=
d
>> constraint when using a function pointer with "i" and PIE is enabled
>> (default on most of GCC shipped with distro). Clang happily accepts it=
,
>> so it may be a bug in GCC."
>=20
> May I ask why you think it's a bug in gcc? I'd rather consider it
> a bug in clang. Taking the address of a symbol doesn't yield a
> constant in PIC or PIE code, aiui.

Maybe we should just not add the suspect of a bug in the compiler to
either commit message or a comment.

It could be a bug in gcc, or just a shortcoming (feature combination
not supported).

It could be a bug in clang, or clang is clever enough to produce
correct code for "i" + PIE.


Juergen


--------------49C70DA602238F8C38CFC43E
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

--------------49C70DA602238F8C38CFC43E--

--iIaZpvITTretzfpPgvq2Wgynvca0gdgDg--

--5JSX8kaTkjHWcLoGve7ApqR5Yw0Q92FA7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAJNJUFAwAAAAAACgkQsN6d1ii/Ey8+
BQf/bMPvVha49K84miJVTm5VaM1bl+MOvrna786INKjdosOuxSS1IvlLSdfOqiOz0J0NkudlZP35
JNioT39h8XnxrDWP2bDC9jpAgcltDYeqhSUMKDNwudfG8fTSHOkJa44nGN0M5VmC2MqUpDBo03Qs
VS6WBveBawop9fz/0uhACMt1uN9mkoJSLDm8X9vKhd2u+aTjEfa/l5ATyTYfRJ0USOFB5Ok37frN
HaOM6bZebKwbdqd9rTqZ4nc6tC5XwEGdOOMjKuQz85pRY85N0mP5XxBUkcK1bexmejad5Py4GYhx
FdIsvJMovLhk3uryQhlsotaJ5c16vuy6pIV7gtL73g==
=eFLJ
-----END PGP SIGNATURE-----

--5JSX8kaTkjHWcLoGve7ApqR5Yw0Q92FA7--

