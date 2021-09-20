Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDC6410F27
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 07:02:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190230.340060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSBQF-0005P7-2P; Mon, 20 Sep 2021 05:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190230.340060; Mon, 20 Sep 2021 05:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSBQE-0005Mp-Ug; Mon, 20 Sep 2021 05:00:54 +0000
Received: by outflank-mailman (input) for mailman id 190230;
 Mon, 20 Sep 2021 05:00:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSBQC-0005Mh-Om
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 05:00:52 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c38f531d-3ba5-4e8b-bb69-3fdc0f73afe7;
 Mon, 20 Sep 2021 05:00:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6883D21F96;
 Mon, 20 Sep 2021 05:00:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5209F13AC9;
 Mon, 20 Sep 2021 05:00:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id P727EoIVSGFxRQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Sep 2021 05:00:50 +0000
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
X-Inumbo-ID: c38f531d-3ba5-4e8b-bb69-3fdc0f73afe7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632114050; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DU3s4YmsIh5ZGnyJm3rw1HbPXvF4HLEnafqBXU5a/+E=;
	b=IT2HVrYqYLxNoaDTX4CPKHmV151ePx3B1TdwN+CktujabPEEFPhBJS9lHqiHVifWQMTnV7
	fFRt3DKc0iABLdov909RLxKvlhL3pJWfvWunX2DsKRNsAHih/crMrIdF78nzuIxDUmKNHs
	DoFUznCioIXRfA9Xx1aeNsFBm4XEcZI=
Subject: Re: [linux-linus test] 165122: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-165122-mainreport@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7f310a51-471c-8b2f-9d0e-5f5a5ed1e765@suse.com>
Date: Mon, 20 Sep 2021 07:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <osstest-165122-mainreport@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AljxGCrPcO425AYhuasZsrvn96ME2Jfv3"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AljxGCrPcO425AYhuasZsrvn96ME2Jfv3
Content-Type: multipart/mixed; boundary="0v7ZkDnGmK2plBidXbJntrf8OMKh5SvGP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <7f310a51-471c-8b2f-9d0e-5f5a5ed1e765@suse.com>
Subject: Re: [linux-linus test] 165122: regressions - FAIL
References: <osstest-165122-mainreport@xen.org>
In-Reply-To: <osstest-165122-mainreport@xen.org>

--0v7ZkDnGmK2plBidXbJntrf8OMKh5SvGP
Content-Type: multipart/mixed;
 boundary="------------1B1F2A7E7A3B138CD10E16A5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1B1F2A7E7A3B138CD10E16A5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.09.21 03:26, osstest service owner wrote:
> flight 165122 linux-linus real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/165122/
>=20
> Regressions :-(
>=20
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   test-amd64-amd64-dom0pvh-xl-amd 17 guest-saverestore     fail REGR. v=
s. 152332
>   test-amd64-coresched-amd64-xl 17 guest-saverestore       fail REGR. v=
s. 152332
>   test-amd64-amd64-xl-pvshim   17 guest-saverestore        fail REGR. v=
s. 152332
>   test-amd64-amd64-dom0pvh-xl-intel 17 guest-saverestore   fail REGR. v=
s. 152332
>   test-amd64-amd64-xl-credit1  17 guest-saverestore        fail REGR. v=
s. 152332
>   test-amd64-amd64-xl          17 guest-saverestore        fail REGR. v=
s. 152332
>   test-amd64-amd64-xl-pvhv2-intel 17 guest-saverestore     fail REGR. v=
s. 152332
>   test-amd64-amd64-xl-shadow   17 guest-saverestore        fail REGR. v=
s. 152332
>   test-amd64-amd64-libvirt     17 guest-saverestore        fail REGR. v=
s. 152332
>   test-amd64-amd64-xl-multivcpu 17 guest-saverestore       fail REGR. v=
s. 152332
>   test-amd64-amd64-xl-credit2  17 guest-saverestore        fail REGR. v=
s. 152332
>   test-amd64-amd64-xl-xsm      17 guest-saverestore        fail REGR. v=
s. 152332
>   test-amd64-amd64-libvirt-xsm 17 guest-saverestore        fail REGR. v=
s. 152332
>   test-amd64-amd64-pair 26 guest-migrate/src_host/dst_host fail REGR. v=
s. 152332
>   test-amd64-amd64-libvirt-pair 26 guest-migrate/src_host/dst_host fail=
 REGR. vs. 152332
>   test-amd64-amd64-xl-pvhv2-amd 17 guest-saverestore       fail REGR. v=
s. 152332
>   test-arm64-arm64-libvirt-xsm 13 debian-fixup             fail REGR. v=
s. 152332
>   test-arm64-arm64-xl-credit1  13 debian-fixup             fail REGR. v=
s. 152332
>   test-arm64-arm64-xl-credit2  13 debian-fixup             fail REGR. v=
s. 152332
>   test-arm64-arm64-xl-thunderx 13 debian-fixup             fail REGR. v=
s. 152332
>   test-arm64-arm64-xl          13 debian-fixup             fail REGR. v=
s. 152332
>   test-armhf-armhf-xl-credit1 18 guest-start/debian.repeat fail REGR. v=
s. 152332

Nice to see the linux-linus tests being usable again. :-)

They already found a new bug in the kernel, introduced by one of my
recent patches. Writing a fix now.


Juergen

--------------1B1F2A7E7A3B138CD10E16A5
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

--------------1B1F2A7E7A3B138CD10E16A5--

--0v7ZkDnGmK2plBidXbJntrf8OMKh5SvGP--

--AljxGCrPcO425AYhuasZsrvn96ME2Jfv3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFIFYEFAwAAAAAACgkQsN6d1ii/Ey/x
fAgAmduzzRlGFMlbuGsVhLiCrb8VhpJpHAzI2q9CZaPtgYogNFgM5QGXnW91BQ1iFhICwlbwMkRT
26ibQWdKVjX7jERr2ejdFhQ3PS9Pgqq62vS6xa95ok1HnAa95TAvZQw1nWFd3wqYXIxVc1nklXOO
XoFnnvbylz4rUkGmvkzEEFUx90zyeVNOABqXIynEGbS94RnL0l8UIQkbciMwmwlzGES76bqshe/l
B7o+VKDSfjKyHVPXuKt5na5dJqoL0tPL5Op1J7sVgNOd4efhJ1177KsJuNCpLUj5jxDE9zbf+YhU
O/jlPEsRrU+qRvhVBTV7ajXdSUk+WpInnOW2FFgoVA==
=b/+A
-----END PGP SIGNATURE-----

--AljxGCrPcO425AYhuasZsrvn96ME2Jfv3--

