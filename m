Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A35380699
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 12:01:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127314.239263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUcs-0005KT-4z; Fri, 14 May 2021 10:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127314.239263; Fri, 14 May 2021 10:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhUcs-0005HJ-0p; Fri, 14 May 2021 10:00:58 +0000
Received: by outflank-mailman (input) for mailman id 127314;
 Fri, 14 May 2021 10:00:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDpF=KJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lhUcq-0005HB-AZ
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 10:00:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9cb16d02-9d14-4602-a466-10c142f6ac6e;
 Fri, 14 May 2021 10:00:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6BE3AABF6;
 Fri, 14 May 2021 10:00:54 +0000 (UTC)
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
X-Inumbo-ID: 9cb16d02-9d14-4602-a466-10c142f6ac6e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620986454; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S1AasyfX6dCn7eKy9VmzPxCNY0w7MLgEqeTYoimG95M=;
	b=KVjFKKs3eW6M1ftQosK1jd9O4JCjhh7bDVra+G9S7eY4zNb2nMVaxyFlDKw2s1tXtp3Om9
	MBpKRArS4dNSMhlFSzZH4u4o6WNLwF3usk9J2O0ldHOlzvnKC6dnXVotQlPYfpUxtVZEOQ
	k8Ls81Uq5qKk6Li/oW2mLVKtnfOlXs0=
Subject: Re: [PATCH v2 2/3] arm64: do not set SWIOTLB_NO_FORCE when swiotlb is
 required
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, hch@lst.de, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
 <20210512201823.1963-2-sstabellini@kernel.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <12d992d9-30de-2d74-9e87-5e5dfdf8e785@suse.com>
Date: Fri, 14 May 2021 12:00:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210512201823.1963-2-sstabellini@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4LHxa7KdNQCrLvpAMN7ARqgIqLpVDMjIM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4LHxa7KdNQCrLvpAMN7ARqgIqLpVDMjIM
Content-Type: multipart/mixed; boundary="RlFh2c8j1O0H9rdQGzratxOGFlAhxMIMn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: boris.ostrovsky@oracle.com, hch@lst.de, catalin.marinas@arm.com,
 will@kernel.org, linux-arm-kernel@lists.infradead.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <12d992d9-30de-2d74-9e87-5e5dfdf8e785@suse.com>
Subject: Re: [PATCH v2 2/3] arm64: do not set SWIOTLB_NO_FORCE when swiotlb is
 required
References: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
 <20210512201823.1963-2-sstabellini@kernel.org>
In-Reply-To: <20210512201823.1963-2-sstabellini@kernel.org>

--RlFh2c8j1O0H9rdQGzratxOGFlAhxMIMn
Content-Type: multipart/mixed;
 boundary="------------653F18E978F1107FBF01B043"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------653F18E978F1107FBF01B043
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.05.21 22:18, Stefano Stabellini wrote:
> From: Christoph Hellwig <hch@lst.de>
>=20
> Although SWIOTLB_NO_FORCE is meant to allow later calls to swiotlb_init=
,
> today dma_direct_map_page returns error if SWIOTLB_NO_FORCE.
>=20
> For now, without a larger overhaul of SWIOTLB_NO_FORCE, the best we can=

> do is to avoid setting SWIOTLB_NO_FORCE in mem_init when we know that i=
t
> is going to be required later (e.g. Xen requires it).
>=20
> CC: boris.ostrovsky@oracle.com
> CC: jgross@suse.com
> CC: catalin.marinas@arm.com
> CC: will@kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> Fixes: 2726bf3ff252 ("swiotlb: Make SWIOTLB_NO_FORCE perform no allocat=
ion")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------653F18E978F1107FBF01B043
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

--------------653F18E978F1107FBF01B043--

--RlFh2c8j1O0H9rdQGzratxOGFlAhxMIMn--

--4LHxa7KdNQCrLvpAMN7ARqgIqLpVDMjIM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCeSlUFAwAAAAAACgkQsN6d1ii/Ey8l
OggAif18ZgrsFLVdYp+O0xPpes+xFlJKXgKPZayoWc2m1hSqUAFdmf6xQIux2zdRRedU4m2xOr2u
hKk69P6JQIIYm7cRyQ79HAlhjNWRWuioOyQG5DIJK5cMRyJOGjgyN7lgnunhStsoJ1/IAdgdPVbw
ta5gnV2mk2RsaiWupp9AZIBg2RxF/r/SsCG7ehVMJsB1pJU8eIrtGdgC7JqjUErDopk4RBo7/wxf
g3O+CTKu4wZUvAH9mgVbQ6sOnQ0XWDKWpl4BDqgDnLEuz1tD8OW/uK4qNrKY5Zi+7R51hk6lXzHr
nOPCUkxYH1vZBHEU8ceH4M1I7aQYEfYrmkzuGj/1tQ==
=Lz5u
-----END PGP SIGNATURE-----

--4LHxa7KdNQCrLvpAMN7ARqgIqLpVDMjIM--

