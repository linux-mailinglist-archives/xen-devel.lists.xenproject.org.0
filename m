Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C516A2DD06E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Dec 2020 12:33:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55875.97479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kprWp-0004DB-Ib; Thu, 17 Dec 2020 11:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55875.97479; Thu, 17 Dec 2020 11:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kprWp-0004Cm-EY; Thu, 17 Dec 2020 11:33:03 +0000
Received: by outflank-mailman (input) for mailman id 55875;
 Thu, 17 Dec 2020 11:33:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gjir=FV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kprWn-0004Ch-LY
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 11:33:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62190456-6a27-4ad0-85e0-fe3ec6325ab6;
 Thu, 17 Dec 2020 11:33:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7FBAB740;
 Thu, 17 Dec 2020 11:32:59 +0000 (UTC)
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
X-Inumbo-ID: 62190456-6a27-4ad0-85e0-fe3ec6325ab6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608204779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1uGNf6DVjBIWoNS7RqfmaXCqdOqych2XEQKJZFo6jyg=;
	b=nUUD8xFxhUvWcs/Z9FVh94BZEbJAlfH1b+SvCwp5EXu4Rr212r7EQZDRCSiVtSnp0T5EN7
	F4j5myCPXc35g69/yF8qgxRHs37qx5YOmgpVkFoBuFrQjT7DiUMrR60iLcnAItd1tXhGvU
	xu5kfzGju4yc0+kmc6tWB4ATZAPkpQc=
Subject: Re: [PATCH v3 5/8] xen/hypfs: add support for id-based dynamic
 directories
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-6-jgross@suse.com>
 <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d4c408eb-08d8-42a8-0c0a-6580fce0e181@suse.com>
Date: Thu, 17 Dec 2020 12:32:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qCDbGZsZmV0aaaRIoV0quLwOF5oMuhMrZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qCDbGZsZmV0aaaRIoV0quLwOF5oMuhMrZ
Content-Type: multipart/mixed; boundary="DqE4c3xl7ypjgWc1CxhrPue5l3uUOF89Y";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <d4c408eb-08d8-42a8-0c0a-6580fce0e181@suse.com>
Subject: Re: [PATCH v3 5/8] xen/hypfs: add support for id-based dynamic
 directories
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-6-jgross@suse.com>
 <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>
In-Reply-To: <2894a231-9150-7c09-cc5c-7ef52087acf5@suse.com>

--DqE4c3xl7ypjgWc1CxhrPue5l3uUOF89Y
Content-Type: multipart/mixed;
 boundary="------------6A4BCA8D705FCF7E7E6657AF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6A4BCA8D705FCF7E7E6657AF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.12.20 12:28, Jan Beulich wrote:
> On 09.12.2020 17:09, Juergen Gross wrote:
>> +static const struct hypfs_entry *hypfs_dyndir_enter(
>> +    const struct hypfs_entry *entry)
>> +{
>> +    const struct hypfs_dyndir_id *data;
>> +
>> +    data =3D hypfs_get_dyndata();
>> +
>> +    /* Use template with original enter function. */
>> +    return data->template->e.funcs->enter(&data->template->e);
>> +}
>=20
> At the example of this (applies to other uses as well): I realize
> hypfs_get_dyndata() asserts that the pointer is non-NULL, but
> according to the bottom of ./CODING_STYLE this may not be enough
> when considering the implications of a NULL deref in the context
> of a PV guest. Even this living behind a sysctl doesn't really
> help, both because via XSM not fully privileged domains can be
> granted access, and because speculation may still occur all the
> way into here. (I'll send a patch to address the latter aspect in
> a few minutes.) While likely we have numerous existing examples
> with similar problems, I guess in new code we'd better be as
> defensive as possible.

What do you suggest? BUG_ON()?

You are aware that this is nothing a user can influence, so it would
be a clear coding error in the hypervisor?

>=20
>> +/*
>> + * Fill dyndata with a dynamically generated directory based on a tem=
plate
>> + * and a numerical id.
>> + * Needs to be kept in sync with hypfs_read_dyndir_id_entry() regardi=
ng the
>> + * name generated.
>> + */
>> +struct hypfs_entry *hypfs_gen_dyndir_id_entry(
>> +    const struct hypfs_entry_dir *template, unsigned int id, void *da=
ta)
>> +{
>=20
> s/directory/entry/ in the comment (and as a I realize only now
> then also for hypfs_read_dyndir_id_entry())?

Oh, indeed.


Juergen

--------------6A4BCA8D705FCF7E7E6657AF
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

--------------6A4BCA8D705FCF7E7E6657AF--

--DqE4c3xl7ypjgWc1CxhrPue5l3uUOF89Y--

--qCDbGZsZmV0aaaRIoV0quLwOF5oMuhMrZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/bQeoFAwAAAAAACgkQsN6d1ii/Ey+P
Rgf+JJt5b8p9JhNfH+fwNmspT0E/p9m/2z5TO7P5S6xg+w2ckBbO4JwLSRObq2tS3ryonXsK35+g
MI3HBreWbSL+gvPIVGnIkFpPYvaOVPZ7Zl0bm5VmIa824tsxXPrA6FcBKQSsAnnHNYrvmLMKMN7K
sO1dy51dJVbHVFBZITgEMjTBTfLbacH+tJRFeoOmm0oWBDLx+pQTeoHYBt11QLEHQUVo/h2EhAFt
XvT+EWhzB49NLmq+cax0YO1ZyBKcwM1oA2yurWlINIjcI60IqNR2LXBTSfOcjqSM0MIRv2sa0rFa
Oo5WpW/iJB3XneoOsRSboAinI592QeCmkWcdtDcnOQ==
=DCmR
-----END PGP SIGNATURE-----

--qCDbGZsZmV0aaaRIoV0quLwOF5oMuhMrZ--

