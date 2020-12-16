Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 121A32DC3DE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Dec 2020 17:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.55328.96435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZUY-0003yO-92; Wed, 16 Dec 2020 16:17:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 55328.96435; Wed, 16 Dec 2020 16:17:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpZUY-0003xz-4x; Wed, 16 Dec 2020 16:17:30 +0000
Received: by outflank-mailman (input) for mailman id 55328;
 Wed, 16 Dec 2020 16:17:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DJND=FU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kpZUV-0003xr-UY
 for xen-devel@lists.xenproject.org; Wed, 16 Dec 2020 16:17:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59c38dab-fbf7-4445-9458-3f2f9547e977;
 Wed, 16 Dec 2020 16:17:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14A49AC7F;
 Wed, 16 Dec 2020 16:17:26 +0000 (UTC)
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
X-Inumbo-ID: 59c38dab-fbf7-4445-9458-3f2f9547e977
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608135446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eF8iye3aJJjmodiyRNp30ALVMd3SgTP6MMfVPx1JXbo=;
	b=NtpiP/s+f+heouA/WqGKApJn6vrDzpI8PLnqLar5QEh/Kn9hJTx6zt1j2c8qDp51TYX/FA
	jY0lkblfWlOnpbiAFqfpn6ecySlDQ8y2lkAM5FybZYWWiSoYdTI5qX037IvF+eqqwKdAzH
	/rhgvOutzs5AmQ8qHprTcgXntSdJJnY=
Subject: Re: [PATCH v3 2/8] xen/hypfs: switch write function handles to const
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-3-jgross@suse.com>
 <bdd553b4-968a-ff71-4bac-2824f86ba869@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <be37658b-2a56-8506-70d0-e74328b61c5a@suse.com>
Date: Wed, 16 Dec 2020 17:17:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <bdd553b4-968a-ff71-4bac-2824f86ba869@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MMIz031IqXfpEShhdWMREFyWWvEkpbCLG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MMIz031IqXfpEShhdWMREFyWWvEkpbCLG
Content-Type: multipart/mixed; boundary="wCanPexOv0N3dgKkpbmAztiNGhQswaR8X";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <be37658b-2a56-8506-70d0-e74328b61c5a@suse.com>
Subject: Re: [PATCH v3 2/8] xen/hypfs: switch write function handles to const
References: <20201209160956.32456-1-jgross@suse.com>
 <20201209160956.32456-3-jgross@suse.com>
 <bdd553b4-968a-ff71-4bac-2824f86ba869@suse.com>
In-Reply-To: <bdd553b4-968a-ff71-4bac-2824f86ba869@suse.com>

--wCanPexOv0N3dgKkpbmAztiNGhQswaR8X
Content-Type: multipart/mixed;
 boundary="------------8746C9B61E947DE71B19CCFE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8746C9B61E947DE71B19CCFE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.12.20 17:08, Jan Beulich wrote:
> On 09.12.2020 17:09, Juergen Gross wrote:
>> --- a/xen/include/xen/guest_access.h
>> +++ b/xen/include/xen/guest_access.h
>> @@ -26,6 +26,11 @@
>>       type *_x =3D (hnd).p;                         \
>>       (XEN_GUEST_HANDLE_PARAM(type)) { _x };      \
>>   })
>> +/* Same for casting to a const type. */
>> +#define guest_handle_const_cast(hnd, type) ({       \
>> +    const type *_x =3D (const type *)((hnd).p);       \
>> +    (XEN_GUEST_HANDLE_PARAM(const_##type)) { _x };  \
>> +})
>=20
> Afaict this allow casting from e.g. uint to const_ulong. We
> don't want to permit this (i.e. if really needed one is to
> go through two steps). I think all it takes is dropping the
> cast:
>=20
> #define guest_handle_const_cast(hnd, type) ({      \
>      const type *_x =3D (hnd).p;                      \
>      (XEN_GUEST_HANDLE_PARAM(const_##type)) { _x }; \
> })
>=20
> With this
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> and I'd be okay making the adjustment while committing
> (provided it works and I didn't overlook anything).

At least it is still compiling, and I guess that was the main
concern.


Juergen

--------------8746C9B61E947DE71B19CCFE
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

--------------8746C9B61E947DE71B19CCFE--

--wCanPexOv0N3dgKkpbmAztiNGhQswaR8X--

--MMIz031IqXfpEShhdWMREFyWWvEkpbCLG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/aMxUFAwAAAAAACgkQsN6d1ii/Ey/V
Xwf/ewhGO0C2HoSru6BAk4TZ1LYIDQL97/eLHajGPH/BGT4l1/0SDeVVTc8a4/ZNdAHiP5d/Z5iI
nEZ3OhIIhwuOuwbZ6/+qYq6vdU5oH35+4cjuYmj0K1e1x8Yd9k3xLA+MzCT7tY0WPCHfqL3ILLjp
0vVO1gClpgESsCLJ81/w1qh/gyqMWXg3UCuuNIHIhi09mYOPKw4B8fmOAistamjgeHAiZIpCz2Gc
pN+6kYtUQZ9hCklaPZ4Ms1Z2FBP+hWEvpS+ZvO1L7fDB3WmWTDHPCzax2gPO4Ki7NtUK74fGQhdw
xaVwStK83imhmcE0GROkKgInlIU/6rtdooIZ6KZbaw==
=VsSN
-----END PGP SIGNATURE-----

--MMIz031IqXfpEShhdWMREFyWWvEkpbCLG--

