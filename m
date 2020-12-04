Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D92CEA39
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:53:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44149.79158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pQ-0006F6-UR; Fri, 04 Dec 2020 08:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44149.79158; Fri, 04 Dec 2020 08:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6pQ-0006Ee-R1; Fri, 04 Dec 2020 08:52:36 +0000
Received: by outflank-mailman (input) for mailman id 44149;
 Fri, 04 Dec 2020 08:52:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov5/=FI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kl6pP-0006ED-1q
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:52:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3720c652-cbaf-46c8-8d10-4aa98d53ccc1;
 Fri, 04 Dec 2020 08:52:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80709ACC1;
 Fri,  4 Dec 2020 08:52:31 +0000 (UTC)
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
X-Inumbo-ID: 3720c652-cbaf-46c8-8d10-4aa98d53ccc1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607071951; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zku6R6kuLFsg36142FeNi5AOowt8MhdJ5wlwtSAhXjo=;
	b=Dufe4201viJzWoqGPmu5cKUs0R/ggVOxd+vXQoP5LKdN1vD8GLZsGL7CbuPKQToq0DVX0Y
	THr0zjnKs25hbyKkDkCUz+EBeqAnj0DXbJ3J6dCEi9VrU9qucJJGQa+4rWacF1+FHt6lmW
	usquLKM9plD/o2uwia+GXFSyufTWrbI=
Subject: Re: [PATCH v2 14/17] xen/hypfs: add support for id-based dynamic
 directories
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-15-jgross@suse.com>
 <369bcb0b-5554-8976-d3fe-5066b3d7cdce@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <774ca9f3-3bbe-817f-5ecb-76054aa619f5@suse.com>
Date: Fri, 4 Dec 2020 09:52:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <369bcb0b-5554-8976-d3fe-5066b3d7cdce@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vg2sd2UFiGpcpldpQB7g7D2KVCYDpX48W"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vg2sd2UFiGpcpldpQB7g7D2KVCYDpX48W
Content-Type: multipart/mixed; boundary="AAmXXDQhMXpMdHqJx3JuHlzZfsya0dLR3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <774ca9f3-3bbe-817f-5ecb-76054aa619f5@suse.com>
Subject: Re: [PATCH v2 14/17] xen/hypfs: add support for id-based dynamic
 directories
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-15-jgross@suse.com>
 <369bcb0b-5554-8976-d3fe-5066b3d7cdce@suse.com>
In-Reply-To: <369bcb0b-5554-8976-d3fe-5066b3d7cdce@suse.com>

--AAmXXDQhMXpMdHqJx3JuHlzZfsya0dLR3
Content-Type: multipart/mixed;
 boundary="------------78B258B6CAB4FDC7EA31554D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------78B258B6CAB4FDC7EA31554D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 16:44, Jan Beulich wrote:
> On 01.12.2020 09:21, Juergen Gross wrote:
>> --- a/xen/common/hypfs.c
>> +++ b/xen/common/hypfs.c
>> @@ -355,6 +355,81 @@ unsigned int hypfs_getsize(const struct hypfs_ent=
ry *entry)
>>       return entry->size;
>>   }
>>  =20
>> +int hypfs_read_dyndir_id_entry(const struct hypfs_entry_dir *template=
,
>> +                               unsigned int id, bool is_last,
>> +                               XEN_GUEST_HANDLE_PARAM(void) *uaddr)
>> +{
>> +    struct xen_hypfs_dirlistentry direntry;
>> +    char name[HYPFS_DYNDIR_ID_NAMELEN];
>> +    unsigned int e_namelen, e_len;
>> +
>> +    e_namelen =3D snprintf(name, sizeof(name), template->e.name, id);=

>> +    e_len =3D DIRENTRY_SIZE(e_namelen);
>> +    direntry.e.pad =3D 0;
>> +    direntry.e.type =3D template->e.type;
>> +    direntry.e.encoding =3D template->e.encoding;
>> +    direntry.e.content_len =3D template->e.funcs->getsize(&template->=
e);
>> +    direntry.e.max_write_len =3D template->e.max_size;
>> +    direntry.off_next =3D is_last ? 0 : e_len;
>> +    if ( copy_to_guest(*uaddr, &direntry, 1) )
>> +        return -EFAULT;
>> +    if ( copy_to_guest_offset(*uaddr, DIRENTRY_NAME_OFF, name,
>> +                              e_namelen + 1) )
>> +        return -EFAULT;
>> +
>> +    guest_handle_add_offset(*uaddr, e_len);
>> +
>> +    return 0;
>> +}
>> +
>> +static struct hypfs_entry *hypfs_dyndir_findentry(
>> +    const struct hypfs_entry_dir *dir, const char *name, unsigned int=
 name_len)
>> +{
>> +    const struct hypfs_dyndir_id *data;
>> +
>> +    data =3D hypfs_get_dyndata();
>> +
>> +    /* Use template with original findentry function. */
>> +    return data->template->e.funcs->findentry(data->template, name, n=
ame_len);
>> +}
>> +
>> +static int hypfs_read_dyndir(const struct hypfs_entry *entry,
>> +                             XEN_GUEST_HANDLE_PARAM(void) uaddr)
>> +{
>> +    const struct hypfs_dyndir_id *data;
>> +
>> +    data =3D hypfs_get_dyndata();
>> +
>> +    /* Use template with original read function. */
>> +    return data->template->e.funcs->read(&data->template->e, uaddr);
>> +}
>> +
>> +struct hypfs_entry *hypfs_gen_dyndir_entry_id(
>> +    const struct hypfs_entry_dir *template, unsigned int id)
>> +{
>> +    struct hypfs_dyndir_id *data;
>> +
>> +    data =3D hypfs_get_dyndata();
>> +
>> +    data->template =3D template;
>> +    data->id =3D id;
>> +    snprintf(data->name, sizeof(data->name), template->e.name, id);
>> +    data->dir =3D *template;
>> +    data->dir.e.name =3D data->name;
>=20
> I'm somewhat puzzled, if not confused, by the apparent redundancy
> of this name generation with that in hypfs_read_dyndir_id_entry().
> Wasn't the idea to be able to use generic functions on these
> generated entries?

I can add a macro replacing the double snprintf().

> Also, seeing that other function's name, wouldn't the one here
> want to be named hypfs_gen_dyndir_id_entry()?

Fine with me.


Juergen

--------------78B258B6CAB4FDC7EA31554D
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

--------------78B258B6CAB4FDC7EA31554D--

--AAmXXDQhMXpMdHqJx3JuHlzZfsya0dLR3--

--vg2sd2UFiGpcpldpQB7g7D2KVCYDpX48W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/J+M4FAwAAAAAACgkQsN6d1ii/Ey/z
XQgAkrAibvKRTV2lrR+LhLqWxo8kTfxnnfst48ZN2SjR9PDsK/teWqKgGWd8WGyt5pd6GHAUtYlo
3AE+ERrCernU+prqDe4BnPT7jxaj2nwGV7B43TAsXc/3WMrdcTNnp+Cy/0RYe57E/qqhrghQdj1D
+kCJy1ltpeY9Zd9qnu3kiH7VTcsOrmEcR+jjHmFElvbcZXEZr62BdwNkv5qXapvH4cSgfsB5uUAI
LM7xXM6NM0VXj2o9R7JY1+mPIJZ/eReoi40y87jqS0T1kiWdq0+R6jRlhfNRI+zo5i8/+1pgVz3z
M5qjB45nCR919CsfSxqFql3BXEQsN9YYmfS4PTzsjQ==
=zC6S
-----END PGP SIGNATURE-----

--vg2sd2UFiGpcpldpQB7g7D2KVCYDpX48W--

