Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 324492CECC0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:09:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44411.79561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8xQ-0006RU-Nu; Fri, 04 Dec 2020 11:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44411.79561; Fri, 04 Dec 2020 11:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl8xQ-0006Qw-J1; Fri, 04 Dec 2020 11:09:00 +0000
Received: by outflank-mailman (input) for mailman id 44411;
 Fri, 04 Dec 2020 11:08:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov5/=FI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kl8xP-0006Pa-Hv
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:08:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96c48557-3014-4078-a48d-3e4800ea4c71;
 Fri, 04 Dec 2020 11:08:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D5FECACA8;
 Fri,  4 Dec 2020 11:08:57 +0000 (UTC)
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
X-Inumbo-ID: 96c48557-3014-4078-a48d-3e4800ea4c71
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607080138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=84ResGlc+MxjQNmlNLcjLRxG7gWahDfMvrJUwuJlK3k=;
	b=KbfwJmAi8Im+J0vWgJMDG/P/J2zxMI1eBTzFcXrYLXbVQwXF9zB1f5K1zRc71zTssfDPre
	u9hBG3Da9xysVr6fX8Xz1pXdbqb+/HTVrYVN1UZVmCEkdpJLT3RyZk2Hl/K7L5uzMpI/zC
	aFVnS+QeDsSD9KDwlE7WHK3orrMh2yY=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
 <e14fa4a4-3a3e-ceac-af38-8561baf58aa8@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
Message-ID: <72e2300c-6367-5469-d7fd-767dd411dcb8@suse.com>
Date: Fri, 4 Dec 2020 12:08:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e14fa4a4-3a3e-ceac-af38-8561baf58aa8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EuENw2daS39mqXviIERXk4Mk2BkRTOegc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EuENw2daS39mqXviIERXk4Mk2BkRTOegc
Content-Type: multipart/mixed; boundary="PNNEg4wEdAXvKcCwGwjUJj48DdcaVibf6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Message-ID: <72e2300c-6367-5469-d7fd-767dd411dcb8@suse.com>
Subject: Re: [PATCH v2 15/17] xen/cpupool: add cpupool directories
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-16-jgross@suse.com>
 <e14fa4a4-3a3e-ceac-af38-8561baf58aa8@suse.com>
In-Reply-To: <e14fa4a4-3a3e-ceac-af38-8561baf58aa8@suse.com>

--PNNEg4wEdAXvKcCwGwjUJj48DdcaVibf6
Content-Type: multipart/mixed;
 boundary="------------AFB756D8916BB5F08C1BC606"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AFB756D8916BB5F08C1BC606
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.12.20 10:10, Jan Beulich wrote:
> On 01.12.2020 09:21, Juergen Gross wrote:
>> @@ -1003,12 +1006,131 @@ static struct notifier_block cpu_nfb =3D {
>>       .notifier_call =3D cpu_callback
>>   };
>>  =20
>> +#ifdef CONFIG_HYPFS
>> +static const struct hypfs_entry *cpupool_pooldir_enter(
>> +    const struct hypfs_entry *entry);
>> +
>> +static struct hypfs_funcs cpupool_pooldir_funcs =3D {
>=20
> Yet one more const missing?

Already fixed locally.

>=20
>> +    .enter =3D cpupool_pooldir_enter,
>> +    .exit =3D hypfs_node_exit,
>> +    .read =3D hypfs_read_dir,
>> +    .write =3D hypfs_write_deny,
>> +    .getsize =3D hypfs_getsize,
>> +    .findentry =3D hypfs_dir_findentry,
>> +};
>> +
>> +static HYPFS_VARDIR_INIT(cpupool_pooldir, "%u", &cpupool_pooldir_func=
s);
>> +
>> +static const struct hypfs_entry *cpupool_pooldir_enter(
>> +    const struct hypfs_entry *entry)
>> +{
>> +    return &cpupool_pooldir.e;
>> +}
>> +
>> +static int cpupool_dir_read(const struct hypfs_entry *entry,
>> +                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
>> +{
>> +    int ret =3D 0;
>> +    const struct cpupool *c;
>> +    unsigned int size =3D 0;
>> +
>> +    list_for_each_entry(c, &cpupool_list, list)
>> +    {
>> +        size +=3D hypfs_dynid_entry_size(entry, c->cpupool_id);
>=20
> Why do you maintain size here? I can't spot any use.

Oh, indeed.

This is a remnant of an earlier variant.

>=20
> With this dropped the function then no longer depends on its
> "entry" parameter, which makes me wonder ...
>=20
>> +        ret =3D hypfs_read_dyndir_id_entry(&cpupool_pooldir, c->cpupo=
ol_id,
>> +                                         list_is_last(&c->list, &cpup=
ool_list),
>> +                                         &uaddr);
>> +        if ( ret )
>> +            break;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static unsigned int cpupool_dir_getsize(const struct hypfs_entry *ent=
ry)
>> +{
>> +    const struct cpupool *c;
>> +    unsigned int size =3D 0;
>> +
>> +    list_for_each_entry(c, &cpupool_list, list)
>> +        size +=3D hypfs_dynid_entry_size(entry, c->cpupool_id);
>=20
> ... why this one does. To be certain their results are consistent
> with one another, I think both should produce their results from
> the same data.

In the end they do. Creating a complete direntry just for obtaining its
size is overkill, especially as hypfs_read_dyndir_id_entry() is not
directly calculating the size, but copying the fixed and the variable
parts in two portions.

>=20
>> +    return size;
>> +}
>> +
>> +static const struct hypfs_entry *cpupool_dir_enter(
>> +    const struct hypfs_entry *entry)
>> +{
>> +    struct hypfs_dyndir_id *data;
>> +
>> +    data =3D hypfs_alloc_dyndata(sizeof(*data));
>=20
> I generally like the added type safety of the macro wrappers
> around _xmalloc(). I wonder if it wouldn't be a good idea to have
> such here as well, to avoid random mistakes like
>=20
>      data =3D hypfs_alloc_dyndata(sizeof(data));

Fine with me.

>=20
> However I further notice that the struct allocated isn't cpupool
> specific at all. It would seem to me that such an allocation
> therefore doesn't belong here. Therefore I wonder whether ...
>=20
>> +    if ( !data )
>> +        return ERR_PTR(-ENOMEM);
>> +    data->id =3D CPUPOOLID_NONE;
>> +
>> +    spin_lock(&cpupool_lock);
>=20
> ... these two properties (initial ID and lock) shouldn't e.g. be
> communicated via the template, allowing the enter/exit hooks to
> become generic for all ID templates.

The problem with the lock is that it is rather user specific. For
domains this will be split (rcu_read_lock(&domlist_read_lock) for
the /domain directory, and get_domain() for the per-domain level).

And memory allocation might need other data as well, so this won't
be the same structure for all cases. A two level dynamic directory
(e.g. domain/vcpu) might want to allocate the needed dyndata for
both levels already when entering /domain.

>=20
> Yet in turn I notice that the "id" field only ever gets set, both
> in patch 14 and here. But yes, I've now spotted the consumers in
> patch 16.
>=20
>> +    return entry;
>> +}
>> +
>> +static void cpupool_dir_exit(const struct hypfs_entry *entry)
>> +{
>> +    spin_unlock(&cpupool_lock);
>> +
>> +    hypfs_free_dyndata();
>> +}
>> +
>> +static struct hypfs_entry *cpupool_dir_findentry(
>> +    const struct hypfs_entry_dir *dir, const char *name, unsigned int=
 name_len)
>> +{
>> +    unsigned long id;
>> +    const char *end;
>> +    const struct cpupool *cpupool;
>> +
>> +    id =3D simple_strtoul(name, &end, 10);
>> +    if ( end !=3D name + name_len )
>> +        return ERR_PTR(-ENOENT);
>> +
>> +    cpupool =3D __cpupool_find_by_id(id, true);
>=20
> Silent truncation from unsigned long to unsigned int?

Oh, indeed. Need to check against UINT_MAX.

>=20
>> +    if ( !cpupool )
>> +        return ERR_PTR(-ENOENT);
>> +
>> +    return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
>> +}
>> +
>> +static struct hypfs_funcs cpupool_dir_funcs =3D {
>=20
> Yet another missing const?

Already fixed.

>=20
>> +    .enter =3D cpupool_dir_enter,
>> +    .exit =3D cpupool_dir_exit,
>> +    .read =3D cpupool_dir_read,
>> +    .write =3D hypfs_write_deny,
>> +    .getsize =3D cpupool_dir_getsize,
>> +    .findentry =3D cpupool_dir_findentry,
>> +};
>> +
>> +static HYPFS_VARDIR_INIT(cpupool_dir, "cpupool", &cpupool_dir_funcs);=

>=20
> Why VARDIR? This isn't a template, is it? Or does VARDIR really
> serve multiple purposes?

Basically it just takes an additional parameter for the function vector.
Maybe I should rename it to HYPFS_DIR_INIT_FUNC()?

>=20
>> +static void cpupool_hypfs_init(void)
>> +{
>> +    hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
>> +    hypfs_add_dyndir(&cpupool_dir, &cpupool_pooldir);
>> +}
>> +#else
>> +
>> +static void cpupool_hypfs_init(void)
>> +{
>> +}
>> +#endif
>=20
> I think you want to be consistent with the use of blank lines next
> to #if / #else / #endif. In cases when they enclose multiple entities,
> I think it's generally better to have intervening blank lines
> everywhere. I also think in such cases commenting #else and #endif is
> helpful. But you're the maintainer of this code ...

I think I'll change it.


Juergen

--------------AFB756D8916BB5F08C1BC606
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

--------------AFB756D8916BB5F08C1BC606--

--PNNEg4wEdAXvKcCwGwjUJj48DdcaVibf6--

--EuENw2daS39mqXviIERXk4Mk2BkRTOegc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/KGMgFAwAAAAAACgkQsN6d1ii/Ey/F
0Af+IM5LPMZiEtpZAzwLT4o0m0CPErJkmADKNFqO6rh93GkEa7lu+LZ+pcRk1W+5so76CuAQM8uY
extKPqNUUpxRaZ+aIHfrwqCxwOI7mRtQPJZZvnuAS7N9nsw3TVJIYCNuJ7JIP3vbIMJFnMNMymGw
KrAC5MIJ19JisUGHBeqzvl8p+CrB0H6jznxLGs6mWM0GblzJMsv9e4G5L4u8as9WD0NyCaqP6Ud3
uZCyWw4z9F8Jc7OZHfSdhMoPDj4Z1noHR+70RXIt6N6q9MIdvZf1zwwNb7zyeKFHUflWYNaA1JTy
JQ9n2aKJQKKZ+jibh5AD2+Ov8y+9buD80Q9/l5y9RQ==
=VnYv
-----END PGP SIGNATURE-----

--EuENw2daS39mqXviIERXk4Mk2BkRTOegc--

