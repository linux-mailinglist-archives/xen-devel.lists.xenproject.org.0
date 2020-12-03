Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F50A2CD9F3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:14:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43761.78610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqJL-00012L-7p; Thu, 03 Dec 2020 15:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43761.78610; Thu, 03 Dec 2020 15:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqJL-00011z-4b; Thu, 03 Dec 2020 15:14:23 +0000
Received: by outflank-mailman (input) for mailman id 43761;
 Thu, 03 Dec 2020 15:14:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yflw=FH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkqJJ-00011s-C2
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 15:14:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 287800c4-73b6-4983-97ab-e58aa7256a5a;
 Thu, 03 Dec 2020 15:14:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3ACF8AC65;
 Thu,  3 Dec 2020 15:14:19 +0000 (UTC)
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
X-Inumbo-ID: 287800c4-73b6-4983-97ab-e58aa7256a5a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607008459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cAn2gV3OTPE4+DePVqcaxMGFcAzZWJKht69BAfdBfVg=;
	b=ZjA27wArEfi1L+86c1bhieLj1dHbCNkTwNqAEydupkfmm0n2XD3q86/lSnlwEAx5FKQElv
	2MtVGvvX9gYqZ2on0MK5kaccqnwgwtWszS7GevldmYhowm2lZNQhWyTd/kUsLZFB4NuBIi
	C28OrlW6sxQ/T/P595qUtmGO9pG1wWI=
Subject: Re: [PATCH v2 12/17] xen/hypfs: add new enter() and exit() per node
 callbacks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-13-jgross@suse.com>
 <0c57dd86-36d9-c378-6bdb-50221a7812b8@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2503547c-1b3c-2224-c4a9-c647d9d1a058@suse.com>
Date: Thu, 3 Dec 2020 16:14:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0c57dd86-36d9-c378-6bdb-50221a7812b8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DpINg4kaag5UxHPSm2KwlwvvqM6Trvnbl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DpINg4kaag5UxHPSm2KwlwvvqM6Trvnbl
Content-Type: multipart/mixed; boundary="AXnDHrJzysLHpeiJxwKVZv0EOYK9JNuAV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <2503547c-1b3c-2224-c4a9-c647d9d1a058@suse.com>
Subject: Re: [PATCH v2 12/17] xen/hypfs: add new enter() and exit() per node
 callbacks
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-13-jgross@suse.com>
 <0c57dd86-36d9-c378-6bdb-50221a7812b8@suse.com>
In-Reply-To: <0c57dd86-36d9-c378-6bdb-50221a7812b8@suse.com>

--AXnDHrJzysLHpeiJxwKVZv0EOYK9JNuAV
Content-Type: multipart/mixed;
 boundary="------------29B8FDFF0FC4529743171AB6"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------29B8FDFF0FC4529743171AB6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 15:59, Jan Beulich wrote:
> On 01.12.2020 09:21, Juergen Gross wrote:
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
>=20
> I guess I'll learn in subsequent patches why this is necessary /
> useful. Right now it looks odd for the function to simple return
> the incoming argument, as this way it's clear the caller knows
> the correct value already.

Basically for dynamic entries based on a template the entry function
will return the address of template->e instead of the dynamic entry
itself. This will enable to have the standard entry functions for
any nodes being linked to the template.

>=20
>> @@ -100,11 +112,58 @@ static void hypfs_unlock(void)
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
> Under what conditions is this legitimate to happen? IOW shouldn't
> there be an ASSERT_UNREACHABLE() here?

This is for the "/" node.


Juergen

--------------29B8FDFF0FC4529743171AB6
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

--------------29B8FDFF0FC4529743171AB6--

--AXnDHrJzysLHpeiJxwKVZv0EOYK9JNuAV--

--DpINg4kaag5UxHPSm2KwlwvvqM6Trvnbl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/JAMoFAwAAAAAACgkQsN6d1ii/Ey/S
wAgAllJbESpFlfB2uhZ3dc2arq96CBlzuSyYQj1Fz8/7RB9vOiiXP3pwbEIpAtNkBKEKDPQHHmIE
DRLxkyuz8jXWIe39jjlJbdufSeMLgAfHhHts6bFEDZkGNmN0BBDlqS+xu9X2D5INotOKzW3t/M8d
JMIcA8n40w0BVRIQ6qo4TUJs17FQnVhRtziHD69vlSxCK7fPqZDT+hRlvFK7oBaG2XCZAOmy7UpB
KSrHyjXIpVHwVwmrqD9sN4P0yQAUkbOgBOmJbpteel5ZOobtt/l5vgwU6WBHVvJf2wXLVRF26yW4
29bqLEbcj2bIl8mxSjCYg1gTISt2i8orXUr5lzkCZg==
=4kpc
-----END PGP SIGNATURE-----

--DpINg4kaag5UxHPSm2KwlwvvqM6Trvnbl--

