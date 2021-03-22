Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44FB34468F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 15:05:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100228.190843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLBR-0004mX-B0; Mon, 22 Mar 2021 14:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100228.190843; Mon, 22 Mar 2021 14:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOLBR-0004m5-6j; Mon, 22 Mar 2021 14:05:29 +0000
Received: by outflank-mailman (input) for mailman id 100228;
 Mon, 22 Mar 2021 14:05:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx7y=IU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lOLBP-0004m0-BW
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 14:05:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2aaa61d-07b6-48c8-ad8f-caccc87e5d90;
 Mon, 22 Mar 2021 14:05:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7718EAC1F;
 Mon, 22 Mar 2021 14:05:25 +0000 (UTC)
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
X-Inumbo-ID: f2aaa61d-07b6-48c8-ad8f-caccc87e5d90
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616421925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IqsifDIsg4tyBUiOgM2OBSWPkeKV4obEH1uKv8DND2k=;
	b=Z+b+lY+ovWsTzd+fI/i8KEbnrhrZ2BwOIYAO3C2exO8K3CgpS4ArBxrJcQUZaihCOh+Sp8
	OWaVkgDpERfd+W/l3uLGggZ2n4Hz7sZir3cvX50b6ogCWUsIoEtrgy5fVo9a4WXyBj8Kc4
	NqmvI6bcXzeECyYrObeo1r6DVB8uk74=
Subject: Re: [PATCH 0/6] tools/libs: add missing support of linear p2m_list,
 cleanup
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210322105840.11224-1-jgross@suse.com>
 <48642c84-9f19-d029-6823-814e389086d8@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <109e3c6a-a167-d9c5-ef71-113faba78ce7@suse.com>
Date: Mon, 22 Mar 2021 15:05:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <48642c84-9f19-d029-6823-814e389086d8@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qMglr0ZHBnTBgGyBBobtfnUhtlUth0ZDT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qMglr0ZHBnTBgGyBBobtfnUhtlUth0ZDT
Content-Type: multipart/mixed; boundary="q9aMeLn6J3nbyTzQiLX0leeYJwuPjcNX1";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <109e3c6a-a167-d9c5-ef71-113faba78ce7@suse.com>
Subject: Re: [PATCH 0/6] tools/libs: add missing support of linear p2m_list,
 cleanup
References: <20210322105840.11224-1-jgross@suse.com>
 <48642c84-9f19-d029-6823-814e389086d8@citrix.com>
In-Reply-To: <48642c84-9f19-d029-6823-814e389086d8@citrix.com>

--q9aMeLn6J3nbyTzQiLX0leeYJwuPjcNX1
Content-Type: multipart/mixed;
 boundary="------------0751B21AB08A02EDA77F9E0D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0751B21AB08A02EDA77F9E0D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.03.21 13:46, Andrew Cooper wrote:
> On 22/03/2021 10:58, Juergen Gross wrote:
>> There are some corners left which don't support the not so very new
>> linear p2m list of pv guests, which has been introduced in Linux kerne=
l
>> 3.19 and which is mandatory for non-legacy versions of Xen since kerne=
l
>> 4.14.
>>
>> This series adds support for the linear p2m list where it is missing
>> (colo support and "xl dump-core").
>>
>> In theory it should be possible to merge the p2m list mapping code
>> from migration handling and core dump handling, but this needs quite
>> some cleanup before this is possible.
>>
>> The first three patches of this series are fixing real problems, so
>> I've put them at the start of this series, especially in order to make=

>> backports easier.
>>
>> The other three patches are only the first steps of cleanup. The main
>> work done here is to concentrate all p2m mapping in libxenguest instea=
d
>> of having one implementation in each of libxenguest and libxenctrl.
>>
>> Merging the two implementations should be rather easy, but this will
>> require to touch many lines of code, as the migration handling variant=

>> seems to be more mature, but it is using the migration stream specific=

>> structures heavily. So I'd like to have some confirmation that my way
>> to clean this up is the right one.
>>
>> My idea would be to add the data needed for p2m mapping to struct
>> domain_info_context and replace the related fields in struct
>> xc_sr_context with a struct domain_info_context. Modifying the
>> interface of xc_core_arch_map_p2m() to take most current parameters
>> via struct domain_info_context would then enable migration coding to
>> use xc_core_arch_map_p2m() for mapping the p2m. xc_core_arch_map_p2m()=

>> should look basically like the current migration p2m mapping code
>> afterwards.
>>
>> Any comments to that plan?
>>
>> Juergen Gross (6):
>>    tools/libs/guest: fix max_pfn setting in map_p2m()
>>    tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m
>>      table
>>    tools/libs/ctrl: use common p2m mapping code in xc_domain_resume_an=
y()
>>    tools/libs: move xc_resume.c to libxenguest
>>    tools/libs: move xc_core* from libxenctrl to libxenguest
>>    tools/libs/guest: make some definitions private to libxenguest
>=20
> https://gitlab.com/xen-project/patchew/xen/-/jobs/1116936958
>=20
> xenctrl_stubs.c:342:11: error: implicit declaration of function
> 'xc_domain_resume' is invalid in C99
> [-Werror,-Wimplicit-function-declaration]
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result =3D xc_domain_resume=
(_H(xch), c_domid, 1);
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^
> 1 error generated.
>=20
> I suspect you need to shuffle the headers in use for the Ocaml stubs to=
o.

Yes. Patch 4 needs to gain an "#include <xenguest.h>" in
tools/ocaml/libs/xc/xenctrl_stubs.c


Juergen

--------------0751B21AB08A02EDA77F9E0D
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

--------------0751B21AB08A02EDA77F9E0D--

--q9aMeLn6J3nbyTzQiLX0leeYJwuPjcNX1--

--qMglr0ZHBnTBgGyBBobtfnUhtlUth0ZDT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBYpCQFAwAAAAAACgkQsN6d1ii/Ey+p
OQgAkQGbYISAi2CEHje8I+fR6OO02GEqQJKvFlS3zMaJk1NQAEcslOvc/zlRbtQ4K62GBBdTZyR6
eZKDL8nXrMjKnCsJ8G7hatakAfewKer1D6hRR6qP/S5IxYKEUPDZ41EoZGhNEBI/Xs8XtoITRfPB
AZ+ulGoB8hmF6fJe9C/NZ9OmXdHenSuBBx8MAvHChqfE0xskjmgIm1HYf07737TZNTgXInZm25k4
cKaSePfHuxb5bfmD6ijFF5Y6XcZ2hNLSqlmEnEFB4YD0pDWVVgfYBhyAUKngxxV52wIZIOnP0JGQ
ub0ulosgjP89gA2gMUv5a6b21HnCmWB3tXAazuGwzw==
=3lX5
-----END PGP SIGNATURE-----

--qMglr0ZHBnTBgGyBBobtfnUhtlUth0ZDT--

