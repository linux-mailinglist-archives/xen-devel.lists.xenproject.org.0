Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3807C35B1D2
	for <lists+xen-devel@lfdr.de>; Sun, 11 Apr 2021 07:35:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108376.206879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVSjl-0004EC-Is; Sun, 11 Apr 2021 05:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108376.206879; Sun, 11 Apr 2021 05:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVSjl-0004Dn-Fa; Sun, 11 Apr 2021 05:34:21 +0000
Received: by outflank-mailman (input) for mailman id 108376;
 Sun, 11 Apr 2021 05:34:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cnp7=JI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lVSjj-0004Di-VB
 for xen-devel@lists.xenproject.org; Sun, 11 Apr 2021 05:34:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c197115b-5a91-4d45-8207-3dcf9cf612da;
 Sun, 11 Apr 2021 05:34:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE31CAEB6;
 Sun, 11 Apr 2021 05:34:17 +0000 (UTC)
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
X-Inumbo-ID: c197115b-5a91-4d45-8207-3dcf9cf612da
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618119257; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sG3BNuAw3+Fh0IlaF5NlAouMGBXgqhZROTRMgZgP8cw=;
	b=DaIkO0D4whttNxaKinpQhZ3dgEpvqyvmPSPZ9efROgO/xUrUQXNet6ETnDhpSD4CzFKTET
	0xy2c8UoQOG5QZv45oQppcz0vhOqU2kSLnpr9fuYKviHKucwojdf7gERvbIDe6UCNVRjIN
	/zFPBIo6FMR+ZkjX5BHxnx8UKaXLrxg=
Subject: Re: xenstore utils dropped support for -s in 4.15
To: Henrik Riomar <rio@riomar.se>, xen-devel@lists.xenproject.org
References: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>
From: Juergen Gross <jgross@suse.com>
Message-ID: <215bcc74-baff-6345-73ed-16f7da266a1b@suse.com>
Date: Sun, 11 Apr 2021 07:34:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2dmD4BbUrtvlsodY5R1yhseiCJEwwWQ1T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2dmD4BbUrtvlsodY5R1yhseiCJEwwWQ1T
Content-Type: multipart/mixed; boundary="uDsvZhSRg6XDBko65kvXUX4dRgHBVx0eF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Henrik Riomar <rio@riomar.se>, xen-devel@lists.xenproject.org
Message-ID: <215bcc74-baff-6345-73ed-16f7da266a1b@suse.com>
Subject: Re: xenstore utils dropped support for -s in 4.15
References: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>
In-Reply-To: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>

--uDsvZhSRg6XDBko65kvXUX4dRgHBVx0eF
Content-Type: multipart/mixed;
 boundary="------------B82B82BB0A73106FEE33F962"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B82B82BB0A73106FEE33F962
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.04.21 00:02, Henrik Riomar wrote:
> Hi,
>=20
> In Alpine and Debian (probably elsewhere as well), the -s flag removed =
in these two commits:
>   * https://github.com/xen-project/xen/commit/fa06cb8c38832aafe597d7190=
40ba1d216e367b8
>   * https://github.com/xen-project/xen/commit/c65687ed16d2289ec91036ec2=
862a4b4bd34ea4f
> is actually used in the init scripts.
>=20
> On one of the systems I tested 4.15 on things just hangs due to this:
> 2222  open("/lib/libxentoolcore.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) =
=3D -1 ENOENT (No such file or directory)
> 2222  open("/usr/local/lib/libxentoolcore.so.1", O_RDONLY|O_LARGEFILE|O=
_CLOEXEC) =3D -1 ENOENT (No such file or directory)
> 2222  open("/usr/lib/libxentoolcore.so.1", O_RDONLY|O_LARGEFILE|O_CLOEX=
EC) =3D 3
> 2222  fcntl(3, F_SETFD, FD_CLOEXEC)     =3D 0
> 2222  fstat(3, {st_mode=3DS_IFREG|0755, st_size=3D14072, ...}) =3D 0
> 2222  read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\240\20\0\=
0\0\0\0\0"..., 960) =3D 960
> 2222  mmap(NULL, 20480, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x7f9925c0200=
0
> 2222  mmap(0x7f9925c03000, 4096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_F=
IXED, 3, 0x1000) =3D 0x7f9925c03000
> 2222  mmap(0x7f9925c04000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED, 3, 0=
x2000) =3D 0x7f9925c04000
> 2222  mmap(0x7f9925c05000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_=
FIXED, 3, 0x2000) =3D 0x7f9925c05000
> 2222  close(3)                          =3D 0
> 2222  mprotect(0x7f9925c0f000, 4096, PROT_READ) =3D 0
> 2222  mprotect(0x7f9925ca6000, 4096, PROT_READ) =3D 0
> 2222  mprotect(0x7f9925c05000, 4096, PROT_READ) =3D 0
> 2222  mprotect(0x5601e65dc000, 4096, PROT_READ) =3D 0
> 2222  stat("/var/run/xenstored/socket", 0x7ffd95b9f080) =3D -1 ENOENT (=
No such file or directory)
> 2222  access("/dev/xen/xenbus", F_OK)   =3D 0
> 2222  stat("/dev/xen/xenbus", {st_mode=3DS_IFCHR|0600, st_rdev=3Dmakede=
v(0xa, 0x3e), ...}) =3D 0
> 2222  open("/dev/xen/xenbus", O_RDWR|O_LARGEFILE) =3D 3
> 2222  rt_sigaction(SIGPIPE, {sa_handler=3DSIG_IGN, sa_mask=3D[], sa_fla=
gs=3DSA_RESTORER, sa_restorer=3D0x7f9925c59c4b}, {sa_handler=3DSIG_DFL, s=
a_mask=3D[], sa_flags=3D0}, 8) =3D 0
> 2222  write(3, "\2\0\0\0\0\0\0\0\0\0\0\0\2\0\0\0", 16) =3D 16
> 2222  write(3, "/\0", 2)                =3D 2
> 2222  read(3,
>=20
> Reverting the two commits mentioned above restores a booting system.
>=20
> The -s flag was introduced in 2005 or so, so I guess you can say that d=
ropping it should
> at least be mentioned in the release notices, and an alternative be des=
cribed, or
> -s functionally should be brought back.

The -s served exactly no purpose.

It was meant to force socket usage. A socket will be used anyway in
case xenstored is running in dom0, so specifying -s won't change
anything in this case. In case xenstored is running in a stubdom
specifying -s will result in the utility NOT working, as there is
no socket connection to xenstored available.


Juergen

--------------B82B82BB0A73106FEE33F962
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

--------------B82B82BB0A73106FEE33F962--

--uDsvZhSRg6XDBko65kvXUX4dRgHBVx0eF--

--2dmD4BbUrtvlsodY5R1yhseiCJEwwWQ1T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmByilgFAwAAAAAACgkQsN6d1ii/Ey9v
qQf/UZCbtmC3lNDeo1F/4iZRuePBgdLlz0Jx8yYTDPwYHYDj/V++IyBrWTRgCsl7M5qXzmXmQTgi
mP8Yb55/xn0xeNkcaDzMTo2G6pyLjHaddebr5UxYlZNDmdDVBi2fm4bGXRRE4w6WJXhl+d3D34fN
ON2aKvcS1L2N2zkgdS9RM2GXgEMfudV9rEbhrL/oyuNwm3PX1y/cyBhKO7V1EcroLj5r1ZV3dof4
M+suUofFwj1h1Bp3HUnqpxPMUYDR16ZbvRQFLujgNaFM/8+KUBTkEFFapJQQYhjRc34KC7CKB2Fk
gHOcU1ezzO0/E38c2pYKwROXrikfdOVmauOlWwkDzA==
=9sJd
-----END PGP SIGNATURE-----

--2dmD4BbUrtvlsodY5R1yhseiCJEwwWQ1T--

