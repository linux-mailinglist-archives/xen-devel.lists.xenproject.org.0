Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D186B2D13FE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 15:49:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46670.82750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmHp1-0006Ot-7G; Mon, 07 Dec 2020 14:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46670.82750; Mon, 07 Dec 2020 14:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmHp1-0006OU-42; Mon, 07 Dec 2020 14:49:03 +0000
Received: by outflank-mailman (input) for mailman id 46670;
 Mon, 07 Dec 2020 14:49:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DX/D=FL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmHoz-0006OP-G2
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 14:49:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bbb6fdf3-c5e6-48ce-b202-d0b8f07a0dba;
 Mon, 07 Dec 2020 14:49:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F1A2AB63;
 Mon,  7 Dec 2020 14:48:59 +0000 (UTC)
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
X-Inumbo-ID: bbb6fdf3-c5e6-48ce-b202-d0b8f07a0dba
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607352539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3jt2Zre32XJyVR5/Pd2ncuWrHMxYQyWnVOWainLoUmw=;
	b=HKD3kOYi1/vmaEM4LYBC/IAZjrHn06E+wBaweE7AI6lu/xNn0hJGKUij0ActByRFuM+Twk
	BaTWejFEnWYQuU9mvR4AdNjRuIghN20RP+BQHFgmUtvFohX/QWCgE6c7z/gd3g05ISiIvH
	Qu5l3OgYuHia1vfORI7NZC+Wgh52nY0=
Subject: Re: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-5-jgross@suse.com>
 <a0bac022-fe6e-aae6-6d07-6a2b9bc492b3@suse.com>
 <eed1baac-a6eb-f10b-7272-742c08f5124e@suse.com>
 <eb2e47aa-6c82-f3dd-83e7-b1853816c41c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d21da8c1-fdb9-6184-06f1-dce6ed683d92@suse.com>
Date: Mon, 7 Dec 2020 15:48:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <eb2e47aa-6c82-f3dd-83e7-b1853816c41c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TNumpRhGdK1eAkg13d4zxXx299HLpTVSk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TNumpRhGdK1eAkg13d4zxXx299HLpTVSk
Content-Type: multipart/mixed; boundary="eDS3yjH2os8VjBdjo7yqfRZloBPkgm1PL";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <d21da8c1-fdb9-6184-06f1-dce6ed683d92@suse.com>
Subject: Re: [PATCH v2 04/17] xen/cpupool: switch cpupool id to unsigned
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-5-jgross@suse.com>
 <a0bac022-fe6e-aae6-6d07-6a2b9bc492b3@suse.com>
 <eed1baac-a6eb-f10b-7272-742c08f5124e@suse.com>
 <eb2e47aa-6c82-f3dd-83e7-b1853816c41c@suse.com>
In-Reply-To: <eb2e47aa-6c82-f3dd-83e7-b1853816c41c@suse.com>

--eDS3yjH2os8VjBdjo7yqfRZloBPkgm1PL
Content-Type: multipart/mixed;
 boundary="------------FE7B507EBBDDF0E1B5BB60C5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FE7B507EBBDDF0E1B5BB60C5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.12.20 10:59, Jan Beulich wrote:
> On 01.12.2020 10:01, J=C3=BCrgen Gro=C3=9F wrote:
>> On 01.12.20 09:55, Jan Beulich wrote:
>>> On 01.12.2020 09:21, Juergen Gross wrote:
>>>> --- a/xen/common/sched/private.h
>>>> +++ b/xen/common/sched/private.h
>>>> @@ -505,8 +505,8 @@ static inline void sched_unit_unpause(const stru=
ct sched_unit *unit)
>>>>   =20
>>>>    struct cpupool
>>>>    {
>>>> -    int              cpupool_id;
>>>> -#define CPUPOOLID_NONE    (-1)
>>>> +    unsigned int     cpupool_id;
>>>> +#define CPUPOOLID_NONE    (~0U)
>>>
>>> How about using XEN_SYSCTL_CPUPOOL_PAR_ANY here? Furthermore,
>>> together with the remark above, I think you also want to consider
>>> the case of sizeof(unsigned int) > sizeof(uint32_t).
>>
>> With patch 5 this should be completely fine.
>=20
> I don't think so, as there still will be CPUPOOLID_NONE !=3D
> XEN_SYSCTL_CPUPOOL_PAR_ANY in the mentioned case.

I don't see that being relevant, as we have in cpupool_do_sysctl():

poolid =3D (op->cpupool_id =3D=3D XEN_SYSCTL_CPUPOOL_PAR_ANY) ?
             CPUPOOLID_NONE: op->cpupool_id;


Juergen

--------------FE7B507EBBDDF0E1B5BB60C5
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

--------------FE7B507EBBDDF0E1B5BB60C5--

--eDS3yjH2os8VjBdjo7yqfRZloBPkgm1PL--

--TNumpRhGdK1eAkg13d4zxXx299HLpTVSk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/OQNoFAwAAAAAACgkQsN6d1ii/Ey9n
vQf7BdYARAAWdD+qmWicbkyKvsjGl18p0rehtbTcHQa0/NQaRAeFQB+ow2QIIlsYZqgRv53WEn0A
KLnSemjcivqFC17gy7SnvCVTTRpWZ4n5S0z21Aq5eQ1FVl4fleeCqmmJwFI5e1jvVmrctXVwsCXz
2BQK799YeedZfMN4lgBqBtf7IeAYQHgWucst/zFUJ0GEJHn5jGyQKozGtd3aTnMEw0uDo7PPHnb5
x1TNYuWJK8E60UIeCcgwcNtDW6Qmp+BavA69OOix01qvacfpc/0GWRAnrNrYhpJt7J4z7ZDPdj+a
IV2yg/KlvVQP1noXfFbiYZzVRlsuFiX5dSUwb8F2+Q==
=SJA+
-----END PGP SIGNATURE-----

--TNumpRhGdK1eAkg13d4zxXx299HLpTVSk--

