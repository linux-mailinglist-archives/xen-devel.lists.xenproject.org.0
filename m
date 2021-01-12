Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125412F2820
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 07:01:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65487.116040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzCju-0008Dk-12; Tue, 12 Jan 2021 06:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65487.116040; Tue, 12 Jan 2021 06:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzCjt-0008DL-UC; Tue, 12 Jan 2021 06:01:09 +0000
Received: by outflank-mailman (input) for mailman id 65487;
 Tue, 12 Jan 2021 06:01:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WoC4=GP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kzCjs-0008DG-1N
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 06:01:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36f018cc-8da0-4907-82d9-0c854500f912;
 Tue, 12 Jan 2021 06:01:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 20F16AD8C;
 Tue, 12 Jan 2021 06:01:04 +0000 (UTC)
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
X-Inumbo-ID: 36f018cc-8da0-4907-82d9-0c854500f912
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610431264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LW50fkT9pbcIoLx27JBsLKhMoBZYtY/y9LDUYpghBOs=;
	b=oysNYkxglUNBB4hBVlYM+gB8JlZZ4eoVgEvb6DUfiDASZNC5yodVJ1MXByK6/4SzE4FlVd
	08IKG22O2YQ/N6OfYs29XlAWCzr6mPiPdCmS0vLcc+6Cr2V+IVWWQhhzhMfYB8yETQs5VS
	SxOrCS1S9fJIGhc/ay+0LrR83CTgdJw=
Subject: Re: [PATCH] xen/privcmd: allow fetching resource sizes
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <amc96@cam.ac.uk>, boris.ostrovsky@oracle.com,
 Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210111152958.7166-1-roger.pau@citrix.com>
 <555ba53c-1b6b-6cf7-9887-52d4179f7456@oracle.com>
 <ed089f3f-4950-f3e9-6df6-07ca9148e6a6@cam.ac.uk>
 <22da01ad-a345-75b9-5f2d-6f8958f31749@suse.com>
Message-ID: <86a9f7f1-1b6d-5c89-2bb5-a6fa2833fdce@suse.com>
Date: Tue, 12 Jan 2021 07:01:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <22da01ad-a345-75b9-5f2d-6f8958f31749@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xPA2A1u4u21pSsqK89wvpojrTtW6I1fQa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xPA2A1u4u21pSsqK89wvpojrTtW6I1fQa
Content-Type: multipart/mixed; boundary="cA4SSTpbt3B3ebaSSO0QqfTU8nhwtt1oF";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <amc96@cam.ac.uk>, boris.ostrovsky@oracle.com,
 Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <86a9f7f1-1b6d-5c89-2bb5-a6fa2833fdce@suse.com>
Subject: Re: [PATCH] xen/privcmd: allow fetching resource sizes
References: <20210111152958.7166-1-roger.pau@citrix.com>
 <555ba53c-1b6b-6cf7-9887-52d4179f7456@oracle.com>
 <ed089f3f-4950-f3e9-6df6-07ca9148e6a6@cam.ac.uk>
 <22da01ad-a345-75b9-5f2d-6f8958f31749@suse.com>
In-Reply-To: <22da01ad-a345-75b9-5f2d-6f8958f31749@suse.com>

--cA4SSTpbt3B3ebaSSO0QqfTU8nhwtt1oF
Content-Type: multipart/mixed;
 boundary="------------7BA3B2B792E5707DDD688E95"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7BA3B2B792E5707DDD688E95
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.01.21 06:50, J=C3=BCrgen Gro=C3=9F wrote:
> On 11.01.21 23:39, Andrew Cooper wrote:
>> On 11/01/2021 22:09, boris.ostrovsky@oracle.com wrote:
>>> On 1/11/21 10:29 AM, Roger Pau Monne wrote:
>>>> +=C2=A0=C2=A0=C2=A0 xdata.domid =3D kdata.dom;
>>>> +=C2=A0=C2=A0=C2=A0 xdata.type =3D kdata.type;
>>>> +=C2=A0=C2=A0=C2=A0 xdata.id =3D kdata.id;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 if (!kdata.addr && !kdata.num) {
>>>
>>> I think we should not allow only one of them to be zero. If it's only=
=20
>>> kdata.num then we will end up with pfns array set to ZERO_SIZE_PTR=20
>>> (which is 0x10). We seem to be OK in that we are not derefencing pfns=
=20
>>> (either in kernel or in hypervisor) if number of frames is zero but=20
>>> IMO we shouldn't be tempting the fate.
>>>
>>>
>>> (And if it's only kdata.addr then we will get a vma but I am not sure=
=20
>>> it will do what we want.)
>>
>> Passing addr =3D=3D 0 without num being 0 is already an error in Xen, =
and
>> passing num =3D=3D 0 without addr being 0 is bogus and will be an erro=
r by
>> the time I'm finished fixing this.
>>
>> FWIW, the common usecase for non-trivial examples will be:
>>
>> xenforeignmem_resource_size(domid, type, id, &size);
>> xenforeignmem_map_resource(domid, type, id, NULL, size, ...);
>>
>> which translates into:
>>
>> ioctl(MAP_RESOURCE, NULL, 0) =3D> size
>> mmap(NULL, size, ...) =3D> ptr
>> ioctl(MAP_RESOURCE, ptr, size)
>>
>> from the kernels point of view, and two hypercalls from Xen's point of=

>> view.=C2=A0 The NULL's above are expected to be the common case for le=
tting
>> the kernel chose the vma, but ought to be filled in by the time the
>> second ioctl() occurs.
>>
>> See
>> https://lore.kernel.org/xen-devel/20200922182444.12350-1-andrew.cooper=
3@citrix.com/T/#u=20
>>
>> for all the gory details.
>=20
> I don't think the kernel should rely on the hypervisor to return
> an error in case addr !=3D 0 and num =3D=3D 0.
>=20
> The driver should return -EINVAL in that case IMO.

And additionally I think the kernel should check num to be not too
large (in the interface it is u64, while intermediate values are
stored in unsigned int), limiting it to something below INT_MAX
seems to be sensible.


Juergen

--------------7BA3B2B792E5707DDD688E95
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

--------------7BA3B2B792E5707DDD688E95--

--cA4SSTpbt3B3ebaSSO0QqfTU8nhwtt1oF--

--xPA2A1u4u21pSsqK89wvpojrTtW6I1fQa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/9Ox8FAwAAAAAACgkQsN6d1ii/Ey8M
kAf+LPupyNDtqEahUwQRRyanWySjxDs63i/JNSPaGlUzPDwwEu7JszEVWny+/BzUunDmSirVqrC8
5GVZtU5Rs4AaqQdaDMc56jfYeA9pO7lEsMDpnD5y9LiDZ2EcjfToBx3GG3wrVvI/GlUvh610oXiN
1aa+SrD0xDluvpORnhjQZFQGJw6vgyjT0GFrbVRssqVQmcgs7MgS6eD78001MJ0gVPPnewBL79EW
CMD9LLMMNSQ72ECdXmGoP+oZf7+s6nQR5igMfVpK40ZgMZWr5V4AkB6kl+MwENOJvi4htBKZR2Si
dCoqfkiDWZ0+YfU8l65LnHtZqBkRpniB+mcqwucNHQ==
=tzzm
-----END PGP SIGNATURE-----

--xPA2A1u4u21pSsqK89wvpojrTtW6I1fQa--

