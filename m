Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E932CD849
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 14:58:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43508.78190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkp7m-0005u3-69; Thu, 03 Dec 2020 13:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43508.78190; Thu, 03 Dec 2020 13:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkp7m-0005ti-32; Thu, 03 Dec 2020 13:58:22 +0000
Received: by outflank-mailman (input) for mailman id 43508;
 Thu, 03 Dec 2020 13:58:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yflw=FH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkp7j-0005td-Rr
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 13:58:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c51bb16-f35b-404d-9181-6f17607f8d0a;
 Thu, 03 Dec 2020 13:58:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B4389AC65;
 Thu,  3 Dec 2020 13:58:17 +0000 (UTC)
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
X-Inumbo-ID: 6c51bb16-f35b-404d-9181-6f17607f8d0a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607003897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N23/COHZQncimNjvea6Pe3W/rZSgf2seWr1DUgrMBvc=;
	b=u7hN5EPd1VB/PdTkap9kNasJWwKf1VkkaXT7XT1TFBpEGJX7Z1kL01qn7F9pCoRx3XKRQu
	k+AE2+jBe4CSgGHQ/hhaJOT3xELxh1D/7qKXOjfz3WFEatQdGgnE6iQUzbUg93qIZRSfoE
	cauAhX+/IAnYTxfrXO/xE3paT6MLfWY=
Subject: Re: [PATCH v5 0/4] Xen ABI feature control
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Julien Grall' <julien@xen.org>, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
 <roger.pau@citrix.com>, 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>, 'Wei Liu' <wl@xen.org>
References: <20201203124159.3688-1-paul@xen.org>
 <7417f158-2cad-3909-2676-f9d5a90f4202@suse.com>
 <00b101d6c97b$660c4990$3224dcb0$@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0443f0f9-c0e1-08f4-9580-8af0eb4cd17d@suse.com>
Date: Thu, 3 Dec 2020 14:58:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <00b101d6c97b$660c4990$3224dcb0$@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="RfRr3j1tyiPOvXfA3ZzN67KW0SZ9saOtN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RfRr3j1tyiPOvXfA3ZzN67KW0SZ9saOtN
Content-Type: multipart/mixed; boundary="QPTCE5VTTwZ3Fqb1IqNCeL5BpmfRxl8uT";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Anthony PERARD' <anthony.perard@citrix.com>,
 'Christian Lindig' <christian.lindig@citrix.com>,
 'David Scott' <dave@recoil.org>, 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Jan Beulich' <jbeulich@suse.com>,
 'Julien Grall' <julien@xen.org>, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
 <roger.pau@citrix.com>, 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>, 'Wei Liu' <wl@xen.org>
Message-ID: <0443f0f9-c0e1-08f4-9580-8af0eb4cd17d@suse.com>
Subject: Re: [PATCH v5 0/4] Xen ABI feature control
References: <20201203124159.3688-1-paul@xen.org>
 <7417f158-2cad-3909-2676-f9d5a90f4202@suse.com>
 <00b101d6c97b$660c4990$3224dcb0$@xen.org>
In-Reply-To: <00b101d6c97b$660c4990$3224dcb0$@xen.org>

--QPTCE5VTTwZ3Fqb1IqNCeL5BpmfRxl8uT
Content-Type: multipart/mixed;
 boundary="------------4AB2994FE6748FD61D1446E7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4AB2994FE6748FD61D1446E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 14:51, Paul Durrant wrote:
>> -----Original Message-----
>> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
>> Sent: 03 December 2020 13:15
>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper <andrew.cooper3@=
citrix.com>; Anthony PERARD
>> <anthony.perard@citrix.com>; Christian Lindig <christian.lindig@citrix=
=2Ecom>; David Scott
>> <dave@recoil.org>; George Dunlap <george.dunlap@citrix.com>; Ian Jacks=
on <iwj@xenproject.org>; Jan
>> Beulich <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Roger Pau =
Monn=C3=A9 <roger.pau@citrix.com>;
>> Stefano Stabellini <sstabellini@kernel.org>; Volodymyr Babchuk <Volody=
myr_Babchuk@epam.com>; Wei Liu
>> <wl@xen.org>
>> Subject: Re: [PATCH v5 0/4] Xen ABI feature control
>>
>> On 03.12.20 13:41, Paul Durrant wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> This series was previously called "evtchn: Introduce a per-guest knob=
 to
>>> control FIFO ABI". It is been extensively re-worked and extended to c=
over
>>> another ABI feature.
>>>
>>> Paul Durrant (4):
>>>     domctl: introduce a new domain create flag,
>>>       XEN_DOMCTL_CDF_evtchn_fifo, ...
>>>     domctl: introduce a new domain create flag,
>>>       XEN_DOMCTL_CDF_evtchn_upcall, ...
>>>     libxl: introduce a 'libxl_xen_abi_features' enumeration...
>>>     xl: introduce a 'xen-abi-features' option...
>>>
>>>    docs/man/xl.cfg.5.pod.in         | 50 ++++++++++++++++++++++++++++=
++++
>>>    tools/include/libxl.h            | 10 +++++++
>>>    tools/libs/light/libxl_arm.c     | 22 +++++++++-----
>>>    tools/libs/light/libxl_create.c  | 31 ++++++++++++++++++++
>>>    tools/libs/light/libxl_types.idl |  7 +++++
>>>    tools/libs/light/libxl_x86.c     | 17 ++++++++++-
>>>    tools/ocaml/libs/xc/xenctrl.ml   |  2 ++
>>>    tools/ocaml/libs/xc/xenctrl.mli  |  2 ++
>>>    tools/xl/xl_parse.c              | 50 ++++++++++++++++++++++++++++=
++--
>>>    xen/arch/arm/domain.c            |  3 +-
>>>    xen/arch/arm/domain_build.c      |  3 +-
>>>    xen/arch/arm/setup.c             |  3 +-
>>>    xen/arch/x86/domain.c            |  8 +++++
>>>    xen/arch/x86/hvm/hvm.c           |  3 ++
>>>    xen/arch/x86/setup.c             |  4 ++-
>>>    xen/common/domain.c              |  3 +-
>>>    xen/common/event_channel.c       | 24 +++++++++++++--
>>>    xen/include/public/domctl.h      |  6 +++-
>>>    18 files changed, 229 insertions(+), 19 deletions(-)
>>> ---
>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Cc: Anthony PERARD <anthony.perard@citrix.com>
>>> Cc: Christian Lindig <christian.lindig@citrix.com>
>>> Cc: David Scott <dave@recoil.org>
>>> Cc: George Dunlap <george.dunlap@citrix.com>
>>> Cc: Ian Jackson <iwj@xenproject.org>
>>> Cc: Jan Beulich <jbeulich@suse.com>
>>> Cc: Julien Grall <julien@xen.org>
>>> Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
>>> Cc: Stefano Stabellini <sstabellini@kernel.org>
>>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>>> Cc: Wei Liu <wl@xen.org>
>>>
>>
>> Do we want to add a create flag for each such feature, or would it be
>> better to set options like those via hypfs?
>>
>> It would be fairly easy to ad dynamic hypfs paths, e.g.:
>>
>> /domain/<domid>/abi-features/evtchn-fifo
>> /domain/<domid>/abi-features/evtchn-upcall
>>
>> which would have boolean type and could be set as long as the domain
>> hasn't been started.
>>
>> xl support could even be rather generic, without the need to add codin=
g
>> to xl for each new feature.
>>
>> This is no objection to this series, but just an idea how to avoid
>> extending the use of unstable interfaces.
>>
>> Thoughts?
>>
>=20
> I was not aware we could have something that was dynamic only before I =
domain is started.

Look at my current cpupool/hypfs series: the per-cpupool scheduling
granularity can be modified only if no cpu is assigned to the cpupool.

>=20
> We'd still want libxl to write the features rather than xl doing it dir=
ectly I think as we still want it to be the owner of the default settings=
=2E Personally it still feels like this kind of setting does want to be a=
n explicit part of domain creation, though using hypfs does sound like a =
neat idea.

No problem of doing it in libxl. libxl is already using libxenhypfs.


Juergen

--------------4AB2994FE6748FD61D1446E7
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

--------------4AB2994FE6748FD61D1446E7--

--QPTCE5VTTwZ3Fqb1IqNCeL5BpmfRxl8uT--

--RfRr3j1tyiPOvXfA3ZzN67KW0SZ9saOtN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/I7vgFAwAAAAAACgkQsN6d1ii/Ey9P
tQf/XD8PSfOECyUCNoHxaQu4B5TQWbLmWX6Z/w/lmTI23hSsRrDPNS30k/H99sIM9WeV5wyNl0Q8
RCrTNmTcQyL39wrL5zR1sYHUDy0FxZKB0bv5Q3ny6Ez5MWdfmRwzsKbY8sS2+ascvWJgYElCzQVN
j5+cZ7fkt7/r9oq8UM4SoQCfH6fxAlaEaMv1FdGYtNTH/UYj9QI821L8PT3DQBiTacjRPQsZl5TU
+RRvoyMqxmT2a3kQPC+eL4NNJEgyqkHRCY6cD3B9PNjdDuQ+4a4IJpnhAY19dQrsxF3jaxeuau9N
jspLr6zjXEUGNNs9T4SD6h8CoFUs7YFDrmBgQxrVuw==
=UgtZ
-----END PGP SIGNATURE-----

--RfRr3j1tyiPOvXfA3ZzN67KW0SZ9saOtN--

