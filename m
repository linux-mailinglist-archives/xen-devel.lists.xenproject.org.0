Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F522B6829
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 16:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29072.58296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2Tz-0004PO-NI; Tue, 17 Nov 2020 15:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29072.58296; Tue, 17 Nov 2020 15:01:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf2Tz-0004Oz-KI; Tue, 17 Nov 2020 15:01:23 +0000
Received: by outflank-mailman (input) for mailman id 29072;
 Tue, 17 Nov 2020 15:01:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kf2Ty-0004Ou-S0
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:01:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15b73f8c-0cce-44e5-805f-d965e866ca55;
 Tue, 17 Nov 2020 15:01:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42C85AC23;
 Tue, 17 Nov 2020 15:01:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=J6Lq=EX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kf2Ty-0004Ou-S0
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 15:01:22 +0000
X-Inumbo-ID: 15b73f8c-0cce-44e5-805f-d965e866ca55
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 15b73f8c-0cce-44e5-805f-d965e866ca55;
	Tue, 17 Nov 2020 15:01:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605625281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ibuZn72g8bYhvlka5ILnkbgS6avpop6EoFBhrrIahqw=;
	b=aJjY+HcEHoAr46kS23yBdZlUVqpTiDEZLNF52YBrRZogwfInQPylhzEzqdOZsPPw4TSlSF
	JBTqjurlcQx6w4UNlqao+ZGvdlBLD2/fZ6H+lS8sDkqjOqQbwqam6ETkxLbuYG5MzMntQ5
	e9LoN3gttCwaG9pAtL/Ckyhkv4QMtbc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 42C85AC23;
	Tue, 17 Nov 2020 15:01:21 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-11-jgross@suse.com>
 <0c199e96-c686-2045-8972-036e69600873@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
Message-ID: <de52d6b3-9b6a-16a2-51cf-b032df58671c@suse.com>
Date: Tue, 17 Nov 2020 16:01:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0c199e96-c686-2045-8972-036e69600873@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4kcXVnjuzAwd3oqi2Rqe4TSGxRakGonCU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4kcXVnjuzAwd3oqi2Rqe4TSGxRakGonCU
Content-Type: multipart/mixed; boundary="4oFseI7xPoJmgbvHgpXNKFz86eNi0bTwi";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Message-ID: <de52d6b3-9b6a-16a2-51cf-b032df58671c@suse.com>
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-11-jgross@suse.com>
 <0c199e96-c686-2045-8972-036e69600873@suse.com>
In-Reply-To: <0c199e96-c686-2045-8972-036e69600873@suse.com>

--4oFseI7xPoJmgbvHgpXNKFz86eNi0bTwi
Content-Type: multipart/mixed;
 boundary="------------F444E41C153C39471BD66BDF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F444E41C153C39471BD66BDF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.11.20 15:13, Jan Beulich wrote:
> On 26.10.2020 10:13, Juergen Gross wrote:
>> @@ -992,6 +994,78 @@ static struct notifier_block cpu_nfb =3D {
>>       .notifier_call =3D cpu_callback
>>   };
>>  =20
>> +#ifdef CONFIG_HYPFS
>> +static HYPFS_DIR_INIT(cpupool_pooldir, "id");
>=20
> This "id" string won't appear anywhere, will it? I would have
> expected this to act as the format string used when generating
> names of the dynamic entries. This would e.g. allow CPU pools
> to have decimal numbered names, but other entries also hex
> ones, and then if so desired also e.g. with leading zeros.

I like that idea.

>=20
>> +static int cpupool_dir_read(const struct hypfs_entry *entry,
>> +                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
>> +{
>> +    int ret =3D 0;
>> +    struct cpupool **q;
>=20
> I was going to ask for const here, but the way for_each_cpupool()
> works looks to prohibit this. Nevertheless I wonder whether the
> extra level of indirection there wouldn't better be dropped. Of
> the users, only cpupool_destroy() looks to need it, so open-
> coding the loop there (or introducing an auxiliary variable)
> would allow improvements here and elsewhere. (Actually I notice
> there's also a similar use in cpupool_create(), but the general
> consideration remains.)

I'll have a look.

>=20
>> +    spin_lock(&cpupool_lock);
>> +
>> +    for_each_cpupool(q)
>> +    {
>> +        ret =3D hypfs_read_dyndir_id_entry(&cpupool_pooldir, (*q)->cp=
upool_id,
>> +                                         !(*q)->next, &uaddr);
>> +        if ( ret )
>> +            break;
>> +    }
>> +
>> +    spin_unlock(&cpupool_lock);
>> +
>> +    return ret;
>> +}
>> +
>> +static unsigned int cpupool_dir_getsize(const struct hypfs_entry *ent=
ry)
>> +{
>> +    struct cpupool **q;
>> +    unsigned int size =3D 0;
>> +
>> +    spin_lock(&cpupool_lock);
>> +
>> +    for_each_cpupool(q)
>> +        size +=3D HYPFS_DIRENTRY_SIZE(snprintf(NULL, 0, "%d", (*q)->c=
pupool_id));
>=20
> Beyond the remark above I consider this problematic: If the pool
> ID was negative, the use of %d here would get things out of sync
> with the %u uses in hypfs.c. I guess exposing
> HYPFS_DIRENTRY_SIZE() isn't the right approach, and you instead
> need another hypfs library function.

Fine with me.

>=20
>> +static struct hypfs_entry *cpupool_dir_findentry(struct hypfs_entry_d=
ir *dir,
>> +                                                 const char *name,
>> +                                                 unsigned int name_le=
n)
>> +{
>> +    unsigned long id;
>> +    const char *end;
>> +    struct cpupool *cpupool;
>> +
>> +    id =3D simple_strtoul(name, &end, 10);
>> +    if ( id > INT_MAX || end !=3D name + name_len )
>=20
> What does this INT_MAX match up with? Afaics
> XEN_SYSCTL_CPUPOOL_OP_CREATE is fine to have an effectively
> negative pool ID passed in (the public interface struct uses
> uint32_t, but this gets converted to plain int first thing in
> the sysctl handler).

Oh, this wants to be fixed.

>=20
>> +        return ERR_PTR(-ENOENT);
>> +
>> +    spin_lock(&cpupool_lock);
>> +
>> +    cpupool =3D __cpupool_find_by_id(id, true);
>> +
>> +    spin_unlock(&cpupool_lock);
>> +
>> +    if ( !cpupool )
>> +        return ERR_PTR(-ENOENT);
>> +
>> +    return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);
>=20
> The latest this one makes clear that cpupool_lock nests inside
> the hypfs one. I think this wants spelling out next to the
> definition of the former, as it implies that there are
> restrictions on what can be done from inside cpupool-locked
> regions. hypfs_read_dyndir_id_entry(), for example, has to
> remain lock free for this reason.

Okay, I'll add a comment.


Juergen

--------------F444E41C153C39471BD66BDF
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

--------------F444E41C153C39471BD66BDF--

--4oFseI7xPoJmgbvHgpXNKFz86eNi0bTwi--

--4kcXVnjuzAwd3oqi2Rqe4TSGxRakGonCU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+z5cAFAwAAAAAACgkQsN6d1ii/Ey9Z
YQf/co6Y42Ze2niGcK5/fh1EpqGclwegSdl5Z1g1Q6wh7VaDR67Oqnnwd1BNhcvJ9YaUHzyPe57O
OuWz/IHl8s44Mzobh2qETwYm1xahgddsLHvqoy0xiUxqhBEWxQX8b91GNX1jsGwrW6MDmWQ+r149
lLnUi8mNhNUbWa59dCP5Kn1ABqHwdEKiWaqIxodwppZcbmb8MGQGckhfcG0rIfoT4zbxxaAkmxBG
b3Bq11vGlgAkgpxkOhS0ujMmlOPQmXKB+H34bC7Zpkw1UtWXJVN0c0gJ8pwjI9RsUR7b5/TrmUPF
Wfl+M5+qoxHrtPLNMAixjT/QE0kSqaomyzAOmkMaaQ==
=Z4AO
-----END PGP SIGNATURE-----

--4kcXVnjuzAwd3oqi2Rqe4TSGxRakGonCU--

