Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0F94860E9
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 08:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253829.435107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Mxs-0008JL-5T; Thu, 06 Jan 2022 07:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253829.435107; Thu, 06 Jan 2022 07:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5Mxs-0008G8-1Z; Thu, 06 Jan 2022 07:13:36 +0000
Received: by outflank-mailman (input) for mailman id 253829;
 Thu, 06 Jan 2022 07:13:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kr4l=RW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n5Mxp-0008G2-I6
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 07:13:33 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2707dd58-6ec0-11ec-9ce5-af14b9085ebd;
 Thu, 06 Jan 2022 08:13:31 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8DDE0210F8;
 Thu,  6 Jan 2022 07:13:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4923413AF2;
 Thu,  6 Jan 2022 07:13:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wh1zD5qW1mFTOAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 06 Jan 2022 07:13:30 +0000
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
X-Inumbo-ID: 2707dd58-6ec0-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641453210; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6/7J4YmIVh8QnRP9LZTy17g49XpNEPO2mq8LhZVMSDU=;
	b=VPe9Ki+NYhFGZsJnRpwwknxNKon/te1adB/DoeQvtdwvokbX8fIoLC93fQdtRAq2g8oXlG
	B3jTvU7KeAbgfI8zlQD88AUuzI1X4JRLdvpTNi6M04WS8ug/yvYjAGuy/c5IbjTfBDXZHy
	EAq6GA4g5DqOYinyTXBooHkvKUFs0iM=
Subject: Re: request for feedback on a Xen/Linux compatibility issue
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: julien@xen.org, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4ea34f61-e72e-76c3-5c20-879fefe4c7f7@suse.com>
Date: Thu, 6 Jan 2022 08:13:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MmbLZO1jJYTQuSjuy9YXSDmANcO7f1pTn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MmbLZO1jJYTQuSjuy9YXSDmANcO7f1pTn
Content-Type: multipart/mixed; boundary="DegpTjLogTqnplVc1lHbdJKg1K5UKPynM";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com
Cc: julien@xen.org, bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Message-ID: <4ea34f61-e72e-76c3-5c20-879fefe4c7f7@suse.com>
Subject: Re: request for feedback on a Xen/Linux compatibility issue
References: <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2112131729100.3376@ubuntu-linux-20-04-desktop>

--DegpTjLogTqnplVc1lHbdJKg1K5UKPynM
Content-Type: multipart/mixed;
 boundary="------------6D36CE6935C7D300B9D9E473"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6D36CE6935C7D300B9D9E473
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.01.22 01:40, Stefano Stabellini wrote:
> Hi all,
>=20
> Today Xen dom0less guests are not "Xen aware": the hypervisor node
> (compatible =3D "xen,xen") is missing from dom0less domUs device trees =
and
> as a consequence Linux initializes as if Xen is not present. The reason=

> is that interfaces like grant table and xenstore (xenbus in Linux) don'=
t
> work correctly in a dom0less environment at the moment.
>=20
> The good news is that I have patches for Xen to implement PV drivers
> support for dom0less guests. They also add the hypervisor node to devic=
e
> tree for dom0less guests so that Linux can discover the presence of Xen=

> and related interfaces.
>=20
> When the Linux kernel is booting as dom0less kernel, it needs to delay
> the xenbus initialization until the interface becomes ready. Attempts t=
o
> initialize xenbus straight away lead to failure, which is fine because
> xenbus has never worked in Linux when running as dom0less guest up unti=
l
> now. It is reasonable that a user needs a newer Linux to take advantage=

> of dom0less with PV drivers. So:
>=20
> - old Xen + old/new Linux -> Xen not detected in Linux
> - new Xen + old Linux     -> xenbus fails to initialize in Linux
> - new Xen + new Linux     -> dom0less PV drivers working in Linux
>=20
>=20
> The problem is that Linux until recently couldn't deal with any errors
> in xenbus initialization. Instead of returning error and continuing
> without xenbus, Linux would crash at boot.
>=20
> I upstreamed two patches for Linux xenbus_probe to be able to deal with=

> initialization errors. With those two fixes, Linux can boot as a
> dom0less kernel with the hypervisor node in device tree. The two fixes
> got applied to master and were already backported to all the supported
> Linux stable trees, so as of today:
>=20
> - dom0less with hypervisor node + Linux 5.16+           -> works
> - dom0less with hypervisor node + stable Linux 5.10     -> works
> - dom0less with hypervisor node + unpatched Linux 5.10  -> crashes
>=20
>=20
> Is this good enough? Or for Xen/Linux compatibility we want to also be
> able to boot vanilla unpatched Linux 5.10 as dom0less kernel? If so,
> the simplest solution is to change compatible string for the hypervisor=

> node, so that old Linux wouldn't recognize Xen presence and wouldn't tr=
y
> to initialize xenbus (so it wouldn't crash on failure). New Linux can o=
f
> course learn to recognize both the old and the new compatible strings.
> (For instance it could be compatible =3D "xen,xen-v2".) I have prototyp=
ed
> and tested this solution successfully but I am not convinced it is the
> right way to go.
>=20
> Do you have any suggestion or feedback?
>=20
> The Linux crash on xenbus initialization failure is a Linux bug, not a
> Xen issue. For this reason, I am tempted to say that we shouldn't chang=
e
> compatible string to work-around a Linux bug, especially given that the=

> Linux stable trees are already all fixed.

What about adding an option to your Xen patches to omit the hypervisor
node in the device tree? This would enable the user to have a mode
compatible to today's behavior.


Juergen

--------------6D36CE6935C7D300B9D9E473
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

--------------6D36CE6935C7D300B9D9E473--

--DegpTjLogTqnplVc1lHbdJKg1K5UKPynM--

--MmbLZO1jJYTQuSjuy9YXSDmANcO7f1pTn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHWlpkFAwAAAAAACgkQsN6d1ii/Ey8+
kwf/T6kNAt8UZqsErtGN9sjHE0C6iOVK4H9bW3m3Sp2taouPfmd8VukHSBYLUiiJL7n6+kOq61VU
tBLeHA2TzzIrhDmw2OScRrowF9jvmG8LY5em5xPKz5mQbT/HzM1y3yd0dp7J0fhw6ECE23QAEr2g
5DRLSqCotS3yRhHXepofeLU05LUromONc0LFupLotWMqxRxD3gbsqwpTGndKmNWFdlYB0c3RD6a+
de2XedGFjZnCHCc57ZrcCPkz7PWahcG9cps3oEVkTGv3OQNaAePw711I9BKjkR7QymSjnczAMWnv
sMV5g0fB0llFhDzyC/zkTKG1jrQgh5Wzfe/ZM22v+Q==
=KsxE
-----END PGP SIGNATURE-----

--MmbLZO1jJYTQuSjuy9YXSDmANcO7f1pTn--

