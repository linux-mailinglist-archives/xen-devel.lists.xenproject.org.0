Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54481368E63
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 10:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115941.221257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZqnt-0000T2-4n; Fri, 23 Apr 2021 08:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115941.221257; Fri, 23 Apr 2021 08:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZqnt-0000Rt-1N; Fri, 23 Apr 2021 08:04:45 +0000
Received: by outflank-mailman (input) for mailman id 115941;
 Fri, 23 Apr 2021 08:04:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwNy=JU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lZqnr-0000Ra-Uw
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 08:04:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a43aa86-c47f-4c65-9eaa-77f3120b750b;
 Fri, 23 Apr 2021 08:04:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43C66AFD7;
 Fri, 23 Apr 2021 08:04:42 +0000 (UTC)
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
X-Inumbo-ID: 7a43aa86-c47f-4c65-9eaa-77f3120b750b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619165082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AQgpXqpqVe/bVy58qF3bnspjQyycb6OTgqVpMz/1hr4=;
	b=XAlNi6xQ5HnYip+nUFUUBHjx4vCyeAfaaz05Dha0p34wu6qDlUtaQ6XVfz3IZFxd+MEyKy
	XVSHRl+FlJ9wSgCIxTp/rdWbPkrwbAuFRKKRlnIvzJgooT66S2otqlr03Zoge8J4glBbdM
	IQ6ufb9/q8uN2XUQgmpNVqnbWebMUHM=
Subject: Re: [PATCH] xen/pciback: Fix incorrect type warnings
To: Muhammad Usama Anjum <musamaanjum@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>,
 open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 colin.king@canonical.com, dan.carpenter@oracle.com
References: <20210326181442.GA1735905@LEGION>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8a07f428-0835-efa5-f285-817229492651@suse.com>
Date: Fri, 23 Apr 2021 10:04:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326181442.GA1735905@LEGION>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lrp80yW3hM8erKV88EXiHa3NmyISQVXUV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lrp80yW3hM8erKV88EXiHa3NmyISQVXUV
Content-Type: multipart/mixed; boundary="5JvMzIyznpelaOsjRxselBNmkpPH1pTgb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Muhammad Usama Anjum <musamaanjum@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>,
 open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 colin.king@canonical.com, dan.carpenter@oracle.com
Message-ID: <8a07f428-0835-efa5-f285-817229492651@suse.com>
Subject: Re: [PATCH] xen/pciback: Fix incorrect type warnings
References: <20210326181442.GA1735905@LEGION>
In-Reply-To: <20210326181442.GA1735905@LEGION>

--5JvMzIyznpelaOsjRxselBNmkpPH1pTgb
Content-Type: multipart/mixed;
 boundary="------------260D26FC03A0C094DBCEF425"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------260D26FC03A0C094DBCEF425
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26.03.21 19:14, Muhammad Usama Anjum wrote:
> Correct enum pci_channel_io_normal should be used instead of putting
> integer value 1.
>=20
> Fix following smatch warnings:
> drivers/xen/xen-pciback/pci_stub.c:805:40: warning: incorrect type in a=
rgument 2 (different base types)
> drivers/xen/xen-pciback/pci_stub.c:805:40:    expected restricted pci_c=
hannel_state_t [usertype] state
> drivers/xen/xen-pciback/pci_stub.c:805:40:    got int
> drivers/xen/xen-pciback/pci_stub.c:862:40: warning: incorrect type in a=
rgument 2 (different base types)
> drivers/xen/xen-pciback/pci_stub.c:862:40:    expected restricted pci_c=
hannel_state_t [usertype] state
> drivers/xen/xen-pciback/pci_stub.c:862:40:    got int
> drivers/xen/xen-pciback/pci_stub.c:973:31: warning: incorrect type in a=
rgument 2 (different base types)
> drivers/xen/xen-pciback/pci_stub.c:973:31:    expected restricted pci_c=
hannel_state_t [usertype] state
> drivers/xen/xen-pciback/pci_stub.c:973:31:    got int
>=20
> Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>

Pushed to xen/tip.git for-linus-5.13


Juergen

--------------260D26FC03A0C094DBCEF425
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

--------------260D26FC03A0C094DBCEF425--

--5JvMzIyznpelaOsjRxselBNmkpPH1pTgb--

--lrp80yW3hM8erKV88EXiHa3NmyISQVXUV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCCf5kFAwAAAAAACgkQsN6d1ii/Ey9z
Bwf/ef4bUO4tEqa798jN0Xc/MX89v8tXTn2YAGZoh6IEQdzcOHflv6c+Kv6KgGM2G4FyQJfpaWFS
jbCugMrvx85n7JhcuCjZL/KtXzuaU6GI5NmEoTUiRrN6ZWWTEKd19ohSWP+aiVklj5QyD77rgHQp
7GBYTnhtQ3Jwu7MhgJVx+CbHyRn7cX9uIburAqbIqt08jNvD98JZpQVyq1EfT+ZaS+ab5vQDOHi3
JNMw32F52lS+BSQbsEaVKNwFqVeTfvmIV+nqGVbRSu8UsgBC1444cqnOZQyO0MZq/F/XOTGQ5MME
dWmdWyyAVN4yRv8G8XhsWOTg0c42g3Nkhe0Xg6LYcw==
=pE5U
-----END PGP SIGNATURE-----

--lrp80yW3hM8erKV88EXiHa3NmyISQVXUV--

