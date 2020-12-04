Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BAD2CECD2
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 12:14:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44426.79585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl92O-0007ep-IY; Fri, 04 Dec 2020 11:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44426.79585; Fri, 04 Dec 2020 11:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl92O-0007eQ-F0; Fri, 04 Dec 2020 11:14:08 +0000
Received: by outflank-mailman (input) for mailman id 44426;
 Fri, 04 Dec 2020 11:14:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov5/=FI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kl92M-0007eJ-TS
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 11:14:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec751bf6-e80f-410e-adee-38b408202e31;
 Fri, 04 Dec 2020 11:14:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19B46AC9A;
 Fri,  4 Dec 2020 11:14:05 +0000 (UTC)
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
X-Inumbo-ID: ec751bf6-e80f-410e-adee-38b408202e31
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607080445; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fa+6wf9gpQk6n/ZBCOz5HQR4MFwQCd1iFk58SnFZmeg=;
	b=EMqWX1eE6rgSiCL1KsuXoE3aiA4lUs8b0e85FR3dSR9z5whLzyZGmryZNsK4HL58A2BW29
	rT7dykOatX8UtnGy8ArdxL+WnC9+O1a1s1HPA/esLb+a6KbFML45uqLWmhSAdiwxAQpLXc
	PuWCVzjOtrLq+eMjjVL443RAUwtgYU0=
Subject: Re: [PATCH v2 11/17] xen/hypfs: add getsize() and findentry()
 callbacks to hypfs_funcs
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-12-jgross@suse.com>
 <57d62a37-b953-a4fa-8c73-79336d634cb0@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2493b7d2-ec7d-d465-15c7-a4b9b009103c@suse.com>
Date: Fri, 4 Dec 2020 12:14:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <57d62a37-b953-a4fa-8c73-79336d634cb0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SNZGQxuofIzTs1d2RJWwBBSisZ7nr2zip"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SNZGQxuofIzTs1d2RJWwBBSisZ7nr2zip
Content-Type: multipart/mixed; boundary="R3Ebz5NwFFSkgryU6FeeOVCymXCMMEFvs";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <2493b7d2-ec7d-d465-15c7-a4b9b009103c@suse.com>
Subject: Re: [PATCH v2 11/17] xen/hypfs: add getsize() and findentry()
 callbacks to hypfs_funcs
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-12-jgross@suse.com>
 <57d62a37-b953-a4fa-8c73-79336d634cb0@suse.com>
In-Reply-To: <57d62a37-b953-a4fa-8c73-79336d634cb0@suse.com>

--R3Ebz5NwFFSkgryU6FeeOVCymXCMMEFvs
Content-Type: multipart/mixed;
 boundary="------------81C0EB144C998EA99B4EA86C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------81C0EB144C998EA99B4EA86C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.12.20 09:58, Jan Beulich wrote:
> On 01.12.2020 09:21, Juergen Gross wrote:
>> @@ -197,28 +235,12 @@ static struct hypfs_entry *hypfs_get_entry_rel(s=
truct hypfs_entry_dir *dir,
>>               end =3D strchr(path, '\0');
>>           name_len =3D end - path;
>>  =20
>> -        again =3D false;
>> +        entry =3D dir->e.funcs->findentry(dir, path, name_len);
>> +        if ( IS_ERR(entry) || !*end )
>> +            return entry;
>>  =20
>> -        list_for_each_entry ( entry, &dir->dirlist, list )
>> -        {
>> -            int cmp =3D strncmp(path, entry->name, name_len);
>> -            struct hypfs_entry_dir *d =3D container_of(entry,
>> -                                                     struct hypfs_ent=
ry_dir, e);
>> -
>> -            if ( cmp < 0 )
>> -                return ERR_PTR(-ENOENT);
>> -            if ( !cmp && strlen(entry->name) =3D=3D name_len )
>> -            {
>> -                if ( !*end )
>> -                    return entry;
>> -
>> -                again =3D true;
>> -                dir =3D d;
>> -                path =3D end + 1;
>> -
>> -                break;
>> -            }
>> -        }
>> +        path =3D end + 1;
>> +        dir =3D container_of(entry, struct hypfs_entry_dir, e);
>>       }
>=20
> Looking at patch 15 my understanding is that "dir" may get invalidated
> by the call to the ->findentry() hook above. That is, use of dir has
> to be avoided between the two calls. This isn't at all obvious, so I
> wonder whether at least a comment wouldn't want adding to avoid future
> mistakes.

Will add a comment.

>=20
> And of course the same comment applies to the IS_ERR() use here vs NULL=

> coming back that I already gave for the ->enter() call site.

I'll add an ASSERT().


Juergen

--------------81C0EB144C998EA99B4EA86C
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

--------------81C0EB144C998EA99B4EA86C--

--R3Ebz5NwFFSkgryU6FeeOVCymXCMMEFvs--

--SNZGQxuofIzTs1d2RJWwBBSisZ7nr2zip
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/KGfwFAwAAAAAACgkQsN6d1ii/Ey+5
wwf+KNbt27pH+AZTk52LTcWYnCbHBhet/flU1ftGrS+nEdHcAQMsV63b9T8hoBquOE3NWfQ/F1Vx
BjoC/NdZ1clrzCJV7eRnGboWGqOCVVKd9xfoX+iXJwI/0UV89+HdaglMlmWUaVgVlnNRDARXzVlP
Zw7F1Tuaw4HzY1TnoW3gJM/A/4zcsjkKrpd8aMUgU3G25NyVS0Qt8v0RihU2DqEp5Nq9SJjQl/hp
d/2ucMgqdDYGjk8eRlrvzTq32R8L/juDrEaWvaER0lk5Tf58OzIX0MqDKZKFsTM23WS+rwaroeNk
HUCSSXP/zYo9IucdYgXAl/3+iqn1SfVxUDw6rJfqHA==
=Xc8u
-----END PGP SIGNATURE-----

--SNZGQxuofIzTs1d2RJWwBBSisZ7nr2zip--

