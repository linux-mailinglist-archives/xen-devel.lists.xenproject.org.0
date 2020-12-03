Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCDA2CD9E2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43743.78599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqGQ-0000kn-P8; Thu, 03 Dec 2020 15:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43743.78599; Thu, 03 Dec 2020 15:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqGQ-0000kN-Lb; Thu, 03 Dec 2020 15:11:22 +0000
Received: by outflank-mailman (input) for mailman id 43743;
 Thu, 03 Dec 2020 15:11:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yflw=FH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkqGP-0000kE-D2
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 15:11:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b965dbb1-944c-4fd0-8e8d-b9f24e04ae41;
 Thu, 03 Dec 2020 15:11:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9A798ABE9;
 Thu,  3 Dec 2020 15:11:19 +0000 (UTC)
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
X-Inumbo-ID: b965dbb1-944c-4fd0-8e8d-b9f24e04ae41
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607008279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6AQrTGM70WvRjacy6wu+regu1TCCTX4sGmyLOct/hy0=;
	b=TeeLctapG7qWpcOhd2l2RMYZUNxnFdP//iQPQui7nxBIjbhEEfALnueqt7AOfxWlAQQtvi
	lhLoZchwl0xWUhxtQ+bmguUaA18xtcG3YqJYt+dIiZkM6EZQGNZjovyPyPGC7BXWVq51/2
	NtaAblCGNShg2GBq3TZ1j2+JfoBqWrA=
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
 <89f52bed-c611-70c5-1349-63838530debd@suse.com>
 <0613c7e2-724a-e16c-91f7-f99298d04ab2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1cc0569c-5d6d-e28a-b5c4-36081c6eb2ac@suse.com>
Date: Thu, 3 Dec 2020 16:11:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0613c7e2-724a-e16c-91f7-f99298d04ab2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IBRapjFuAUaEMXRlTBC2maKlUZ02LHv8c"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IBRapjFuAUaEMXRlTBC2maKlUZ02LHv8c
Content-Type: multipart/mixed; boundary="8sj6s2QdyjsyosFvFACeITFUx1yNAG8us";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Message-ID: <1cc0569c-5d6d-e28a-b5c4-36081c6eb2ac@suse.com>
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
 <89f52bed-c611-70c5-1349-63838530debd@suse.com>
 <0613c7e2-724a-e16c-91f7-f99298d04ab2@suse.com>
In-Reply-To: <0613c7e2-724a-e16c-91f7-f99298d04ab2@suse.com>

--8sj6s2QdyjsyosFvFACeITFUx1yNAG8us
Content-Type: multipart/mixed;
 boundary="------------2DBB41EF7B7C5BC488EF78F6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2DBB41EF7B7C5BC488EF78F6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 15:46, Jan Beulich wrote:
> On 02.12.2020 16:46, J=C3=BCrgen Gro=C3=9F wrote:
>> On 01.12.20 09:21, Juergen Gross wrote:
>>> @@ -1003,12 +1006,131 @@ static struct notifier_block cpu_nfb =3D {
>>>        .notifier_call =3D cpu_callback
>>>    };
>>>   =20
>>> +#ifdef CONFIG_HYPFS
>>> +static const struct hypfs_entry *cpupool_pooldir_enter(
>>> +    const struct hypfs_entry *entry);
>>> +
>>> +static struct hypfs_funcs cpupool_pooldir_funcs =3D {
>>> +    .enter =3D cpupool_pooldir_enter,
>>> +    .exit =3D hypfs_node_exit,
>>> +    .read =3D hypfs_read_dir,
>>> +    .write =3D hypfs_write_deny,
>>> +    .getsize =3D hypfs_getsize,
>>> +    .findentry =3D hypfs_dir_findentry,
>>> +};
>>> +
>>> +static HYPFS_VARDIR_INIT(cpupool_pooldir, "%u", &cpupool_pooldir_fun=
cs);
>>> +
>>> +static const struct hypfs_entry *cpupool_pooldir_enter(
>>> +    const struct hypfs_entry *entry)
>>> +{
>>> +    return &cpupool_pooldir.e;
>>> +}
>> I have found a more generic way to handle entering a dyndir node,
>> resulting in no need to have cpupool_pooldir_enter() and
>> cpupool_pooldir_funcs.
>>
>> This will add some more lines to the previous patch, but less than
>> saved here.
>=20
> Which may then mean it's not a good use of time to look at v2 patch
> 14, considering there's a lot of other stuff in need of looking at?

All of V2 patch 14 remains valid, there is just a generic enter function
added in V3.


Juergen

--------------2DBB41EF7B7C5BC488EF78F6
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

--------------2DBB41EF7B7C5BC488EF78F6--

--8sj6s2QdyjsyosFvFACeITFUx1yNAG8us--

--IBRapjFuAUaEMXRlTBC2maKlUZ02LHv8c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/JABYFAwAAAAAACgkQsN6d1ii/Ey/O
YAf+IvhT5Ghw+E4r+XW8n9M5ef91bVbz2Dlxk1EoDt5wX1efV9ARxkNcl7objd6oBfO5LG+SriVX
JSt2avXjfRI2dSHXrpLc7jX71RQ/0F7Tr0OvIxduNC7urksGAAhE4J3Jaz7RCz76e9G4mPFIBy0C
mBlL1OC8ixwobKrAm5NJh9xYDy7+XLkdG+dy//2pZdGc1Ogj3XWbf+L6COptDDRksLCDEyyOQh9s
wTLO51rSwvYHW8JjfFKNy5aAGo6ZWyM5oRp4nu0ojWpNrntwCFiMz+P5KWhMvpVdK21Cewd7p2bK
lYv48KnFlMMh6C+GmplAxP4BD8z7F3MGKGPQR6/SxQ==
=Id8K
-----END PGP SIGNATURE-----

--IBRapjFuAUaEMXRlTBC2maKlUZ02LHv8c--

