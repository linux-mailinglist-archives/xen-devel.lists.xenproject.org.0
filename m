Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216CC2CFA4A
	for <lists+xen-devel@lfdr.de>; Sat,  5 Dec 2020 08:42:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.45240.80760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klSC2-0008Jr-NT; Sat, 05 Dec 2020 07:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 45240.80760; Sat, 05 Dec 2020 07:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klSC2-0008JS-Jj; Sat, 05 Dec 2020 07:41:22 +0000
Received: by outflank-mailman (input) for mailman id 45240;
 Sat, 05 Dec 2020 07:41:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nC0X=FJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1klSC1-0008JN-84
 for xen-devel@lists.xenproject.org; Sat, 05 Dec 2020 07:41:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7a6ad24-f473-4425-8d68-be403e4c5339;
 Sat, 05 Dec 2020 07:41:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4BAA6AB63;
 Sat,  5 Dec 2020 07:41:19 +0000 (UTC)
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
X-Inumbo-ID: b7a6ad24-f473-4425-8d68-be403e4c5339
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607154079; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LXQhJTON3yW+DHRMhOGOJwrdrbXm044P08RZ1yd5BR8=;
	b=NZpGzBbQYU3PLJVqQNYA0ra0wspHSoTfE7imUyzfxxqQHq0k58GriI519p+q2iLySSm0y2
	L4OxFLyEEfOPNGlcU230/rYTiko7C2ax2cmCjkYwBDgsLKWy+KtqjUjiXlaGCKyaRAzFoT
	/77Kyeo+AcO4ip0boHqCiR7dZeiLMh8=
Subject: Re: [PATCH v2 00/17] xen: support per-cpupool scheduling granularity
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201201082128.15239-1-jgross@suse.com>
 <a12de6ea-584c-49ca-3a09-f94b65933a62@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9a09bc6f-ab4b-4792-98f1-b3b811c14649@suse.com>
Date: Sat, 5 Dec 2020 08:41:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a12de6ea-584c-49ca-3a09-f94b65933a62@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YjpNXze1rb8tauUlInMiNPPVD8rEjefN7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YjpNXze1rb8tauUlInMiNPPVD8rEjefN7
Content-Type: multipart/mixed; boundary="lW5klSyhbMU2ukONhkXu6RIv80SCpfv28";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <9a09bc6f-ab4b-4792-98f1-b3b811c14649@suse.com>
Subject: Re: [PATCH v2 00/17] xen: support per-cpupool scheduling granularity
References: <20201201082128.15239-1-jgross@suse.com>
 <a12de6ea-584c-49ca-3a09-f94b65933a62@citrix.com>
In-Reply-To: <a12de6ea-584c-49ca-3a09-f94b65933a62@citrix.com>

--lW5klSyhbMU2ukONhkXu6RIv80SCpfv28
Content-Type: multipart/mixed;
 boundary="------------8EBDA8785DD754ABC9BA4365"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8EBDA8785DD754ABC9BA4365
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05.12.20 00:53, Andrew Cooper wrote:
> On 01/12/2020 08:21, Juergen Gross wrote:
>> Support scheduling granularity per cpupool. Setting the granularity is=

>> done via hypfs, which needed to gain dynamical entries for that
>> purpose.
>>
>> Apart from the hypfs related additional functionality the main change
>> for cpupools was the support for moving a domain to a new granularity,=

>> as this requires to modify the scheduling unit/vcpu relationship.
>>
>> I have tried to do the hypfs modifications in a rather generic way in
>> order to be able to use the same infrastructure in other cases, too
>> (e.g. for per-domain entries).
>>
>> The complete series has been tested by creating cpupools with differen=
t
>> granularities and moving busy and idle domains between those.
>>
>> Changes in V2:
>> - Added several new patches, especially for some further cleanups in
>>    cpupool.c.
>> - Completely reworked the locking scheme with dynamical directories:
>>    locking of resources (cpupools in this series) is now done via new
>>    callbacks which are called when traversing the hypfs tree. This
>>    removes the need to add locking to each hypfs related cpupool
>>    function and it ensures data integrity across multiple callbacks.
>> - Reordered the first few patches in order to have already acked
>>    patches in pure cleanup patches first.
>> - Addressed several comments.
>>
>> Juergen Gross (17):
>>    xen/cpupool: add cpu to sched_res_mask when removing it from cpupoo=
l
>>    xen/cpupool: add missing bits for per-cpupool scheduling granularit=
y
>>    xen/cpupool: sort included headers in cpupool.c
>>    xen/cpupool: switch cpupool id to unsigned
>>    xen/cpupool: switch cpupool list to normal list interface
>>    xen/cpupool: use ERR_PTR() for returning error cause from
>>      cpupool_create()
>>    xen/cpupool: support moving domain between cpupools with different
>>      granularity
>>    docs: fix hypfs path documentation
>>    xen/hypfs: move per-node function pointers into a dedicated struct
>>    xen/hypfs: pass real failure reason up from hypfs_get_entry()
>>    xen/hypfs: add getsize() and findentry() callbacks to hypfs_funcs
>>    xen/hypfs: add new enter() and exit() per node callbacks
>>    xen/hypfs: support dynamic hypfs nodes
>>    xen/hypfs: add support for id-based dynamic directories
>>    xen/cpupool: add cpupool directories
>>    xen/cpupool: add scheduling granularity entry to cpupool entries
>>    xen/cpupool: make per-cpupool sched-gran hypfs node writable
>=20
> Gitlab CI is fairly (but not completely) reliably hitting an failure in=

> ARM randconfig against this series only.
>=20
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/225445864 is one=

> example.
>=20
> Error is:
>=20
> cpupool.c:102:12: error: 'sched_gran_get' defined but not used
> [-Werror=3Dunused-function]
>  =C2=A0 102 | static int sched_gran_get(const char *str, enum sched_gra=
n *mode)
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~
>=20

Ah, this is without CONFIG_HYPFS.

Will fix.


Juergen

--------------8EBDA8785DD754ABC9BA4365
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

--------------8EBDA8785DD754ABC9BA4365--

--lW5klSyhbMU2ukONhkXu6RIv80SCpfv28--

--YjpNXze1rb8tauUlInMiNPPVD8rEjefN7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/LOZ4FAwAAAAAACgkQsN6d1ii/Ey/V
agf+PWFy8YLg2pXrX47ZCELzxhnyBndFQMxSawRoYFLjY+GarBlNSPT2+9ShIjIFMRfea5uuJiHE
YyaLkqycVqd7xAL6aXlxba0uqFGZTdtNlMzh3BkS3uD6bKleAd3/S6vwzL5gTHnkqcnGhPvnt6TW
MXAvOCh9XMpZEb4j6IXjW55tSbfviWMtD3i0oQ2DlLl5gOCEmU+R0FRx9QkdKemllAGxDb2Ym6IN
zdxoyFfYmxEx48gKpfyj3iKhZY81H98iHCD9ZdJULou/OYdcGcXXoBbMvAMeU5uz7Vn8NCp1QMbF
7DI26kV+MJ/ePBlch6AzQt9BhupcIQzz25vSHwieyw==
=uQcD
-----END PGP SIGNATURE-----

--YjpNXze1rb8tauUlInMiNPPVD8rEjefN7--

