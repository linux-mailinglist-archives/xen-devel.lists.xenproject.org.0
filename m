Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95542479FB7
	for <lists+xen-devel@lfdr.de>; Sun, 19 Dec 2021 07:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249223.429707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mypOu-0001sp-M3; Sun, 19 Dec 2021 06:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249223.429707; Sun, 19 Dec 2021 06:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mypOu-0001qq-IU; Sun, 19 Dec 2021 06:10:28 +0000
Received: by outflank-mailman (input) for mailman id 249223;
 Sun, 19 Dec 2021 06:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CgLP=RE=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mypOt-0001qk-Kl
 for xen-devel@lists.xen.org; Sun, 19 Dec 2021 06:10:27 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b7f8103-6092-11ec-9e60-abaf8a552007;
 Sun, 19 Dec 2021 07:10:26 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63A8B21108;
 Sun, 19 Dec 2021 06:10:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 459DC13A8A;
 Sun, 19 Dec 2021 06:10:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OrX8DtHMvmHWTQAAMHmgww
 (envelope-from <jgross@suse.com>); Sun, 19 Dec 2021 06:10:25 +0000
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
X-Inumbo-ID: 5b7f8103-6092-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639894225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BHNimrZGb8uhPmDjX+gXjo/vE9VEc0DBrDH+CA3VnpQ=;
	b=pNMQzk7XeWhfJrqEUxz0xT0YMD0JSB3KmcvRbm5jp4ZN60yhlbM/aw1isMPDu+vRmFNRF2
	zg07B1MD4LCv8Dx4mbxDHPj02h+DwipxuMbWY9hjgSU+gjMHwU1+CLFsDV1ZyMqWnT9tvx
	vrLK2n+et/COYvxzyaeLTgzJl8XWjNk=
To: "G.R." <firemeteor@users.sourceforge.net>,
 xen-devel <xen-devel@lists.xen.org>
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <be77e398-7d0b-ceb0-4dac-d5456c9800c4@suse.com>
Date: Sun, 19 Dec 2021 07:10:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uMsSwA2CT25mX5P50N0gBF5OnSglFqAZs"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uMsSwA2CT25mX5P50N0gBF5OnSglFqAZs
Content-Type: multipart/mixed; boundary="O8l6cQNr5w3QZ7Fg27OH8aHbNgEazLysa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "G.R." <firemeteor@users.sourceforge.net>,
 xen-devel <xen-devel@lists.xen.org>
Message-ID: <be77e398-7d0b-ceb0-4dac-d5456c9800c4@suse.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
In-Reply-To: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>

--O8l6cQNr5w3QZ7Fg27OH8aHbNgEazLysa
Content-Type: multipart/mixed;
 boundary="------------6EA7CEFA39964D99A1C8CA13"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6EA7CEFA39964D99A1C8CA13
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.12.21 19:35, G.R. wrote:
> Hi all,
>=20
> I ran into the following error report in the DOM0 kernel after a recent=
 upgrade:
> [  501.840816] vif vif-1-0 vif1.0: Cross page boundary, txp->offset:
> 2872, size: 1460
> [  501.840828] vif vif-1-0 vif1.0: fatal error; disabling device

The dom0 network backend has detected an inconsistency in the data
received from the domU's frontend. In this case a request's memory
buffer crossed a page boundary, which is not allowed.

There has been a recent change in the xen netback driver to stop the
interface in such conditions, as such invalid requests are regarded to
be malicious and might lead to crashes in dom0.

So this issue should be reported to FreeBSD maintainers in order to
have the Xen netfornt driver fixed there.

> [  501.841076] xenbr0: port 2(vif1.0) entered disabled state
> Once this error happens, the DOM-U behind this vif is no-longer
> accessible. And recreating the same DOM-U does not fix the problem.
> Only a reboot on the physical host machine helps.
>=20
> The problem showed up after a recent upgrade on the DOM-U OS from
> FreeNAS 11.3 to TrueNAS 12.0U7 and breaks the iSCSI service while
> leaving other services like NFS intact.
> The underlying OS for the NAS is FreeBSD, version 11.3 and 12.2 respect=
ively.
> So far I have tried the following combos:
> - Linux 4.19 DOM0 + XEN 4.8 + FreeBSD 11.3 DOM-U: Good
> - Linux 4.19 DOM0 + XEN 4.8 + FreeBSD 12.2 DOM-U: Regressed
> - Linux 5.10 DOM0 + XEN 4.8 + FreeBSD 12.2 DOM-U: Regressed
> - Linux 5.10 DOM0 + XEN 4.11 + FreeBSD 12.2 DOM-U: Regressed

This information (especially the FreeBSD version affected) is
probably important for the FreeBSD maintainers.

>=20
> I plan to try out the XEN 4.14 version which is the latest I can get
> from the distro (Debian).
> If that still does not fix the problem, I would build the 4.16 version
> from source as my last resort.

Xen is NOT to blame here.


Juergen


--------------6EA7CEFA39964D99A1C8CA13
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------6EA7CEFA39964D99A1C8CA13--

--O8l6cQNr5w3QZ7Fg27OH8aHbNgEazLysa--

--uMsSwA2CT25mX5P50N0gBF5OnSglFqAZs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG+zNAFAwAAAAAACgkQsN6d1ii/Ey//
iwf/Zx6A9K1BXyqkPvWpRnsSoCPxu/gPbr/UKHxgCl7YqxIfjnm+rrToO+5xfotAhpsblfq9xhi2
oPn23TjPOvl2YWKHLO5zx5MnYlnKWNv/NXAGeV0ZLe003ITv82mX3qiJMKeK0qAvoEhhyMVstmtk
H0ykuTn7fcQsIxcWcLhbbq4mh7aujJA+PGHZfV/RhfOC/GZX7b5Jy6IclWr1OTYPx5bvomTl3J02
k0pcizqgXh6zx86YN/kej/hVE17bJnGpmY0sj2x8U1dBMFLx7RBp1oBOi6db+Og9q2pYGbRyT25l
3IuMZP7thfbn+0aQUr/l77saPNKEd01e5/AQxrkp1A==
=tSss
-----END PGP SIGNATURE-----

--uMsSwA2CT25mX5P50N0gBF5OnSglFqAZs--

