Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0272CDA01
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 16:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43769.78623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqNF-0001IU-Qh; Thu, 03 Dec 2020 15:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43769.78623; Thu, 03 Dec 2020 15:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkqNF-0001I4-Lx; Thu, 03 Dec 2020 15:18:25 +0000
Received: by outflank-mailman (input) for mailman id 43769;
 Thu, 03 Dec 2020 15:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yflw=FH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkqND-0001Hz-Vk
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 15:18:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d46ee3e-dd18-497c-b9ed-9d0d31441d37;
 Thu, 03 Dec 2020 15:18:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 068C5ABCE;
 Thu,  3 Dec 2020 15:18:21 +0000 (UTC)
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
X-Inumbo-ID: 3d46ee3e-dd18-497c-b9ed-9d0d31441d37
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607008701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jwDV5HhaydAvzJYaCReQGhRny3sveDf76+NkX356SB4=;
	b=RXl90IvfLV3B+eIkJ57tFQH7Z9LhFEo8jn6VF7uTy7eFhE75Kp+S/2G4M446S3wE+xeNyM
	F6o+8xUPwqxiCM3bhkg5lXCFnHxEeL5cIYZzaHk5z5aFXO0J4T6c4kCzGKj81XmEZtp+C9
	yBIjUZzztMY9OvQgs2WM6Di7GVkVAkY=
Subject: Re: [PATCH v2 13/17] xen/hypfs: support dynamic hypfs nodes
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-14-jgross@suse.com>
 <a02fe2e6-428f-9bea-0108-92fa03729420@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0efe5d36-da32-7f0d-5515-5fb5994ea2d9@suse.com>
Date: Thu, 3 Dec 2020 16:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <a02fe2e6-428f-9bea-0108-92fa03729420@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="axbB0pP5sZ4QuvTln0IxeS0coD5uAjvTT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--axbB0pP5sZ4QuvTln0IxeS0coD5uAjvTT
Content-Type: multipart/mixed; boundary="XrT8D4fGhKOAxx1M7yVO0Qsd6Ea7gOe3z";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <0efe5d36-da32-7f0d-5515-5fb5994ea2d9@suse.com>
Subject: Re: [PATCH v2 13/17] xen/hypfs: support dynamic hypfs nodes
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-14-jgross@suse.com>
 <a02fe2e6-428f-9bea-0108-92fa03729420@suse.com>
In-Reply-To: <a02fe2e6-428f-9bea-0108-92fa03729420@suse.com>

--XrT8D4fGhKOAxx1M7yVO0Qsd6Ea7gOe3z
Content-Type: multipart/mixed;
 boundary="------------D60063E3C3802B61D4D5134A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D60063E3C3802B61D4D5134A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 16:08, Jan Beulich wrote:
> On 01.12.2020 09:21, Juergen Gross wrote:
>> Add a HYPFS_VARDIR_INIT() macro for initializing such a directory
>> statically, taking a struct hypfs_funcs pointer as parameter additiona=
l
>> to those of HYPFS_DIR_INIT().
>>
>> Modify HYPFS_VARSIZE_INIT() to take the function vector pointer as an
>> additional parameter as this will be needed for dynamical entries.
>>
>> For being able to let the generic hypfs coding continue to work on
>> normal struct hypfs_entry entities even for dynamical nodes add some
>> infrastructure for allocating a working area for the current hypfs
>> request in order to store needed information for traversing the tree.
>> This area is anchored in a percpu pointer and can be retrieved by any
>> level of the dynamic entries. The normal way to handle allocation and
>> freeing is to allocate the data in the enter() callback of a node and
>> to free it in the related exit() callback.
>>
>> Add a hypfs_add_dyndir() function for adding a dynamic directory
>> template to the tree, which is needed for having the correct reference=

>> to its position in hypfs.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - switch to xzalloc_bytes() in hypfs_alloc_dyndata() (Jan Beulich)
>> - carved out from previous patch
>> - use enter() and exit() callbacks for allocating and freeing
>>    dyndata memory
>=20
> I can't seem to be able to spot what this describes, and the
> respective part of the description therefore also remains unclear

I think all pieces are coming together with patch 15.

> to me. Not the least again when considering multi-level templates,
> where potentially each of the handlers may want to allocate dyndata,
> yet only one party can at a time.

Right now: yes.

In case needed it will be rather easy to have a linked list of dyndata
entities, with the percpu dyndata variable pointing to the most recent
one (the one of the currently deepest nesting level).

>=20
>> - add hypfs_add_dyndir()
>=20
> Overall this patch adds a lot of (for now) dead code, which makes it
> hard to judge whether this is what's needed. I guess I'll again
> learn more by reding further patches.

I hope so.


--------------D60063E3C3802B61D4D5134A
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

--------------D60063E3C3802B61D4D5134A--

--XrT8D4fGhKOAxx1M7yVO0Qsd6Ea7gOe3z--

--axbB0pP5sZ4QuvTln0IxeS0coD5uAjvTT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/JAbwFAwAAAAAACgkQsN6d1ii/Ey94
HQgAhnWo2c4OidZB+HhTJGIh8tmFTFFuWBJKJBODAiGsvI2FbdwcnjtLx7MSmVeihAvMPYyYI7ls
BYTbp4DdTpQLKCMvnzWCTWY8iR0EZv37PL1zQUajzyvAFszVyLL9lvhxdfd27KNCgzOLy7KbwEZt
7eW0yGtJhqveO2OSA7hnIy30v9mr3NIdsU7FewSqEHpIG/B3G0Pouk4AAt8bGYbZqfJHImpyWYfl
oTn+q4c0Yxz6Wix0VZT5gdR/1XSvfb+t5B0jqR3wB/x7JDf2HdVBJLNnd15CEGQjFXruDG17B+j5
/Vo52CN3M5oHx/b1EAdhUcZzkQd1fDLKkeCsBOLAWA==
=fzpe
-----END PGP SIGNATURE-----

--axbB0pP5sZ4QuvTln0IxeS0coD5uAjvTT--

