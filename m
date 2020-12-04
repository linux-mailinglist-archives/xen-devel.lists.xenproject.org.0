Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FB62CEEA1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 14:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44746.80190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klApQ-0007o9-Fp; Fri, 04 Dec 2020 13:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44746.80190; Fri, 04 Dec 2020 13:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klApQ-0007nj-Bv; Fri, 04 Dec 2020 13:08:52 +0000
Received: by outflank-mailman (input) for mailman id 44746;
 Fri, 04 Dec 2020 13:08:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov5/=FI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1klApO-0007nd-GR
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 13:08:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58737cbc-61c9-4ca7-b6f8-55c38b937905;
 Fri, 04 Dec 2020 13:08:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 985D0AC9A;
 Fri,  4 Dec 2020 13:08:48 +0000 (UTC)
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
X-Inumbo-ID: 58737cbc-61c9-4ca7-b6f8-55c38b937905
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607087328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QG1t6H4LuO7yyYllIoahT4cqZrKS3yGt0avt04oGB2U=;
	b=O2voHMi1byHV69MAQAs1zhO2fFzKLUzdjDboQ17JnZJoMLxajD2yVpURWtzhO5N+6zK603
	tiEyN81aQdaATK6Pg/v6wiYlqw7Yvtjuxleb5W9Hx26qjuT5g3J3x3GBR5QCoA+03xRr/4
	MQRaZdHdaMWV2bqv+TMyirGbZgfOjeA=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-15-jgross@suse.com>
 <369bcb0b-5554-8976-d3fe-5066b3d7cdce@suse.com>
 <774ca9f3-3bbe-817f-5ecb-76054aa619f5@suse.com>
 <f81a011d-101c-29e7-cba2-0b52506cc027@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 14/17] xen/hypfs: add support for id-based dynamic
 directories
Message-ID: <181448f7-fffb-ee5d-b420-40500bdb608d@suse.com>
Date: Fri, 4 Dec 2020 14:08:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f81a011d-101c-29e7-cba2-0b52506cc027@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lCIpEXYcdbo2k1dkeB1pVwZQuauXNeZew"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lCIpEXYcdbo2k1dkeB1pVwZQuauXNeZew
Content-Type: multipart/mixed; boundary="1py2jHGkOkJFRyKDxi109fP3ISlgPf5Yb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <181448f7-fffb-ee5d-b420-40500bdb608d@suse.com>
Subject: Re: [PATCH v2 14/17] xen/hypfs: add support for id-based dynamic
 directories
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-15-jgross@suse.com>
 <369bcb0b-5554-8976-d3fe-5066b3d7cdce@suse.com>
 <774ca9f3-3bbe-817f-5ecb-76054aa619f5@suse.com>
 <f81a011d-101c-29e7-cba2-0b52506cc027@suse.com>
In-Reply-To: <f81a011d-101c-29e7-cba2-0b52506cc027@suse.com>

--1py2jHGkOkJFRyKDxi109fP3ISlgPf5Yb
Content-Type: multipart/mixed;
 boundary="------------D5A47AE5AE2EB7D5E2E35E37"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D5A47AE5AE2EB7D5E2E35E37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.12.20 10:16, Jan Beulich wrote:
> On 04.12.2020 09:52, J=C3=BCrgen Gro=C3=9F wrote:
>> On 03.12.20 16:44, Jan Beulich wrote:
>>> On 01.12.2020 09:21, Juergen Gross wrote:
>>>> --- a/xen/common/hypfs.c
>>>> +++ b/xen/common/hypfs.c
>>>> @@ -355,6 +355,81 @@ unsigned int hypfs_getsize(const struct hypfs_e=
ntry *entry)
>>>>        return entry->size;
>>>>    }
>>>>   =20
>>>> +int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *templa=
te,
>>>> +                               unsigned int id, bool is_last,
>>>> +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)=

>>>> +{
>>>> +    struct xen_hypfs_dirlistentry direntry;
>>>> +    char name[HYPFS_DYNDIR_ID_NAMELEN];
>>>> +    unsigned int e_namelen, e_len;
>>>> +
>>>> +    e_namelen =3D snprintf(name, sizeof(name), template->e.name, id=
);
>>>> +    e_len =3D DIRENTRY_SIZE(e_namelen);
>>>> +    direntry.e.pad =3D 0;
>>>> +    direntry.e.type =3D template->e.type;
>>>> +    direntry.e.encoding =3D template->e.encoding;
>>>> +    direntry.e.content_len =3D template->e.funcs->getsize(&template=
->e);
>>>> +    direntry.e.max_write_len =3D template->e.max_size;
>>>> +    direntry.off_next =3D is_last ? 0 : e_len;
>>>> +    if ( copy_to_guest(*uaddr, &direntry, 1) )
>>>> +        return -EFAULT;
>>>> +    if ( copy_to_guest_offset(*uaddr, DIRENTRY_NAME_OFF, name,
>>>> +                              e_namelen + 1) )
>>>> +        return -EFAULT;
>>>> +
>>>> +    guest_handle_add_offset(*uaddr, e_len);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static struct hypfs_entry *hypfs_dyndir_findentry(
>>>> +    const struct hypfs_entry_dir *dir, const char *name, unsigned i=
nt name_len)
>>>> +{
>>>> +    const struct hypfs_dyndir_id *data;
>>>> +
>>>> +    data =3D hypfs_get_dyndata();
>>>> +
>>>> +    /* Use template with original findentry function. */
>>>> +    return data->template->e.funcs->findentry(data->template, name,=
 name_len);
>>>> +}
>>>> +
>>>> +static int hypfs_read_dyndir(const struct hypfs_entry *entry,
>>>> +                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
>>>> +{
>>>> +    const struct hypfs_dyndir_id *data;
>>>> +
>>>> +    data =3D hypfs_get_dyndata();
>>>> +
>>>> +    /* Use template with original read function. */
>>>> +    return data->template->e.funcs->read(&data->template->e, uaddr)=
;
>>>> +}
>>>> +
>>>> +struct hypfs_entry *hypfs_gen_dyndir_entry_id(
>>>> +    const struct hypfs_entry_dir *template, unsigned int id)
>>>> +{
>>>> +    struct hypfs_dyndir_id *data;
>>>> +
>>>> +    data =3D hypfs_get_dyndata();
>>>> +
>>>> +    data->template =3D template;
>>>> +    data->id =3D id;
>>>> +    snprintf(data->name, sizeof(data->name), template->e.name, id);=

>>>> +    data->dir =3D *template;
>>>> +    data->dir.e.name =3D data->name;
>>>
>>> I'm somewhat puzzled, if not confused, by the apparent redundancy
>>> of this name generation with that in hypfs_read_dyndir_id_entry().
>>> Wasn't the idea to be able to use generic functions on these
>>> generated entries?
>>
>> I can add a macro replacing the double snprintf().
>=20
> That wasn't my point. I'm concerned of there being two name generation
> sites in the first place. Is this perhaps simply some form of
> optimization, avoiding hypfs_read_dyndir_id_entry() to call
> hypfs_gen_dyndir_entry_id() (but risking the two going out of sync)?

Be aware that hypfs_read_dyndir_id_entry() is generating a struct
xen_hypfs_dirlistentry, which is different from the internal
representation of the data produced by hypfs_gen_dyndir_entry_id().

So the main common part is the name generation. What else would you
want apart from making it common via e.g. a macro? Letting
hypfs_read_dyndir_id_entry() call hypfs_gen_dyndir_entry_id() would
just be a more general approach with all the data but the generated
name of hypfs_gen_dyndir_entry_id() dropped or just copied around
a second time.


Juergen

--------------D5A47AE5AE2EB7D5E2E35E37
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

--------------D5A47AE5AE2EB7D5E2E35E37--

--1py2jHGkOkJFRyKDxi109fP3ISlgPf5Yb--

--lCIpEXYcdbo2k1dkeB1pVwZQuauXNeZew
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/KNN8FAwAAAAAACgkQsN6d1ii/Ey8K
zAf/fUCIp8Ek6K4pNdzwzydfMUQAWebuq/kK4hZPqZgORrDti4nxuOMOhmLEW7cXw6FkwG9gDoEA
B2QkSWtr5cApYQGX/gmOUbiBS4jUfWv6uLpFXxeLHuO/xniKZmofYOOj+KAgML6bHsLTpeEmT5Lp
+76ddW1r1j5jgfQGtzisfGHGtu2HyEKsSqDEeoqBgs8Uq3ZuBYE6uSkNH45nVHtK6DgvvSZdGhpc
pOyYg9aBmu1bqW2wtQf5QUQdWHZxCs1qnFkcvS09qUfF8sUP8wzbyjgSwz0uRdF41qqZ+qoLYKe8
FhBGz74wbX1XUfLB3v4Gj0rv100vm8It3bseVjZcjw==
=qniA
-----END PGP SIGNATURE-----

--lCIpEXYcdbo2k1dkeB1pVwZQuauXNeZew--

