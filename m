Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC12DC402
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 17:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55335.96445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZb1-0004ya-50; Wed, 16 Dec 2020 16:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55335.96445; Wed, 16 Dec 2020 16:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZb1-0004yE-1n; Wed, 16 Dec 2020 16:24:11 +0000
Received: by outflank-mailman (input) for mailman id 55335;
 Wed, 16 Dec 2020 16:24:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DJND=FU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpZaz-0004y9-Jn
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 16:24:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a32b00a-2925-4195-a578-56f65e8e920e;
 Wed, 16 Dec 2020 16:24:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9F7E7AC7F;
 Wed, 16 Dec 2020 16:24:07 +0000 (UTC)
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
X-Inumbo-ID: 5a32b00a-2925-4195-a578-56f65e8e920e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608135847; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8bCNpvRu1aaYztt7lNYPM2+/3ZIjutOceBP40ILDXYc=;
	b=Rcvkt0nPQMiHntsr/DRTPjJyI9l/up7yGk9FflhK6CC9yXPhppMXHO2WysYUzvID+Y2dr6
	6Mn5u/XH0/HY/65WLAvT5Wh+BQVrwWIUENN3y7FRjj4OMjY+1fsdedujJVgVa6y6gqCPqJ
	fwIwOTrrq/vBeTVBgCqXUePGD70mAPI=
Subject: Re: [PATCH v3 3/8] xen/hypfs: add new enter() and exit() per node
 callbacks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-4-jgross@suse.com>
 <36469295-8c77-0e58-654a-35fd992c11a1@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aad9131f-ca42-94b4-1ce2-18c6db0ac381@suse.com>
Date: Wed, 16 Dec 2020 17:24:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <36469295-8c77-0e58-654a-35fd992c11a1@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ufMjG3EonlO7vLn4ZjMp1F7MEwBHxDMCm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ufMjG3EonlO7vLn4ZjMp1F7MEwBHxDMCm
Content-Type: multipart/mixed; boundary="s4HuKqeIBHtLZcNXJ2v91T4sw7bLFGTcp";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <aad9131f-ca42-94b4-1ce2-18c6db0ac381@suse.com>
Subject: Re: [PATCH v3 3/8] xen/hypfs: add new enter() and exit() per node
 callbacks
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-4-jgross@suse.com>
 <36469295-8c77-0e58-654a-35fd992c11a1@suse.com>
In-Reply-To: <36469295-8c77-0e58-654a-35fd992c11a1@suse.com>

--s4HuKqeIBHtLZcNXJ2v91T4sw7bLFGTcp
Content-Type: multipart/mixed;
 boundary="------------E1DAC578A47395658EADEB73"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E1DAC578A47395658EADEB73
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.12.20 17:16, Jan Beulich wrote:
> On 09.12.2020 17:09, Juergen Gross wrote:
>> In order to better support resource allocation and locking for dynamic=

>> hypfs nodes add enter() and exit() callbacks to struct hypfs_funcs.
>>
>> The enter() callback is called when entering a node during hypfs user
>> actions (traversing, reading or writing it), while the exit() callback=

>> is called when leaving a node (accessing another node at the same or a=

>> higher directory level, or when returning to the user).
>>
>> For avoiding recursion this requires a parent pointer in each node.
>> Let the enter() callback return the entry address which is stored as
>> the last accessed node in order to be able to use a template entry for=

>> that purpose in case of dynamic entries.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - new patch
>>
>> V3:
>> - add ASSERT(entry); (Jan Beulich)
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   xen/common/hypfs.c      | 80 +++++++++++++++++++++++++++++++++++++++=
++
>>   xen/include/xen/hypfs.h |  5 +++
>>   2 files changed, 85 insertions(+)
>>
>> diff --git a/xen/common/hypfs.c b/xen/common/hypfs.c
>> index 6f822ae097..f04934db10 100644
>> --- a/xen/common/hypfs.c
>> +++ b/xen/common/hypfs.c
>> @@ -25,30 +25,40 @@ CHECK_hypfs_dirlistentry;
>>        ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
>>  =20
>>   const struct hypfs_funcs hypfs_dir_funcs =3D {
>> +    .enter =3D hypfs_node_enter,
>> +    .exit =3D hypfs_node_exit,
>>       .read =3D hypfs_read_dir,
>>       .write =3D hypfs_write_deny,
>>       .getsize =3D hypfs_getsize,
>>       .findentry =3D hypfs_dir_findentry,
>>   };
>>   const struct hypfs_funcs hypfs_leaf_ro_funcs =3D {
>> +    .enter =3D hypfs_node_enter,
>> +    .exit =3D hypfs_node_exit,
>>       .read =3D hypfs_read_leaf,
>>       .write =3D hypfs_write_deny,
>>       .getsize =3D hypfs_getsize,
>>       .findentry =3D hypfs_leaf_findentry,
>>   };
>>   const struct hypfs_funcs hypfs_leaf_wr_funcs =3D {
>> +    .enter =3D hypfs_node_enter,
>> +    .exit =3D hypfs_node_exit,
>>       .read =3D hypfs_read_leaf,
>>       .write =3D hypfs_write_leaf,
>>       .getsize =3D hypfs_getsize,
>>       .findentry =3D hypfs_leaf_findentry,
>>   };
>>   const struct hypfs_funcs hypfs_bool_wr_funcs =3D {
>> +    .enter =3D hypfs_node_enter,
>> +    .exit =3D hypfs_node_exit,
>>       .read =3D hypfs_read_leaf,
>>       .write =3D hypfs_write_bool,
>>       .getsize =3D hypfs_getsize,
>>       .findentry =3D hypfs_leaf_findentry,
>>   };
>>   const struct hypfs_funcs hypfs_custom_wr_funcs =3D {
>> +    .enter =3D hypfs_node_enter,
>> +    .exit =3D hypfs_node_exit,
>>       .read =3D hypfs_read_leaf,
>>       .write =3D hypfs_write_custom,
>>       .getsize =3D hypfs_getsize,
>> @@ -63,6 +73,8 @@ enum hypfs_lock_state {
>>   };
>>   static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
>>  =20
>> +static DEFINE_PER_CPU(const struct hypfs_entry *, hypfs_last_node_ent=
ered);
>> +
>>   HYPFS_DIR_INIT(hypfs_root, "");
>>  =20
>>   static void hypfs_read_lock(void)
>> @@ -100,11 +112,59 @@ static void hypfs_unlock(void)
>>       }
>>   }
>>  =20
>> +const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry *=
entry)
>> +{
>> +    return entry;
>> +}
>> +
>> +void hypfs_node_exit(const struct hypfs_entry *entry)
>> +{
>> +}
>> +
>> +static int node_enter(const struct hypfs_entry *entry)
>> +{
>> +    const struct hypfs_entry **last =3D &this_cpu(hypfs_last_node_ent=
ered);
>> +
>> +    entry =3D entry->funcs->enter(entry);
>> +    if ( IS_ERR(entry) )
>> +        return PTR_ERR(entry);
>> +
>> +    ASSERT(entry);
>> +    ASSERT(!*last || *last =3D=3D entry->parent);
>> +
>> +    *last =3D entry;
>> +
>> +    return 0;
>> +}
>> +
>> +static void node_exit(const struct hypfs_entry *entry)
>> +{
>> +    const struct hypfs_entry **last =3D &this_cpu(hypfs_last_node_ent=
ered);
>> +
>> +    if ( !*last )
>> +        return;
>=20
> To my question regarding this in v2 you replied
>=20
> "I rechecked and have found that this was a remnant from an earlier
>   variant. *last won't ever be NULL, so the if can be dropped (a NULL
>   will be catched by the following ASSERT())."
>=20
> Now this if() is still there. Why?

I really thought I did remove the if(). Seems as if I did that on
my test machine only and not in my git tree. Sorry for that.


Juergen

--------------E1DAC578A47395658EADEB73
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

--------------E1DAC578A47395658EADEB73--

--s4HuKqeIBHtLZcNXJ2v91T4sw7bLFGTcp--

--ufMjG3EonlO7vLn4ZjMp1F7MEwBHxDMCm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/aNKYFAwAAAAAACgkQsN6d1ii/Ey+8
CAf/b9Uz4HkjVMPncTvi7dMhL8CO6URBZs2uBXbZZIHzEuttx5bxIU9Kzi3H7+0csDISQLo4CMCW
VB7rJ70qa8Of2tPpCYxC5ZrtDN1qG/aszGzu7bh055NqaaluvIydU9Z/JVxCdZYmPkdInf/Jm1mZ
fiOLHK9mEEr04KRNMqhcse3jyFsv0hO5p3UMwkp8MuuUbCWEXPi3W0ZKcGmZ7HwHucu6agTUgemv
Cmvmt9tCkK1ce6XwbcAHf2yKUu0za2zPGwdAOi2EdDAG43NmnZ4io9PGi2fuXlIradHYgNbDNX/K
tiIsdrs06Q5tT6yfepNCjeGkWNEcG6U8N92Ag9DGJA==
=blsI
-----END PGP SIGNATURE-----

--ufMjG3EonlO7vLn4ZjMp1F7MEwBHxDMCm--

