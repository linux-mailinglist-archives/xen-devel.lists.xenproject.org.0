Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69253443264
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 17:10:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220410.381696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhwMe-0001X1-Uh; Tue, 02 Nov 2021 16:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220410.381696; Tue, 02 Nov 2021 16:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhwMe-0001Uh-Re; Tue, 02 Nov 2021 16:10:20 +0000
Received: by outflank-mailman (input) for mailman id 220410;
 Tue, 02 Nov 2021 16:10:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hRh8=PV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhwMd-0001Ub-56
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 16:10:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67eb4f58-7fcc-4201-9158-81075d19ef6a;
 Tue, 02 Nov 2021 16:10:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E2362190C;
 Tue,  2 Nov 2021 16:10:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 659EF13DC7;
 Tue,  2 Nov 2021 16:10:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e3VlF+ligWFoYgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 Nov 2021 16:10:17 +0000
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
X-Inumbo-ID: 67eb4f58-7fcc-4201-9158-81075d19ef6a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635869417; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type;
	bh=RtrT/nU39Z1bSm5jY9fGv4To9a/cMqN3O1fQ+hsOm5w=;
	b=rvmG+cRA3TuCj9K88ewqE9hER0x2+f/vyISqPcFP38G/xvc20vJGrgBQ/oOrY4D5pRgNaU
	ZjAGwtaYhCX51sUyvg4DUlvnnHI378u0AC/xzIdQt9mKgeXUcIvRNajnd00niV6HKgLPai
	2V5lb+koSQBROWJIuBVUY2iLDIF4xWQ=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Xen.org security team" <security@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Bug Bounty program
Message-ID: <a6cbc3b1-dfdb-ab22-a00e-09db81c25c3f@suse.com>
Date: Tue, 2 Nov 2021 17:10:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sjHRvZEv7WrFRxGBt5saQ6brBZuHZkSjE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sjHRvZEv7WrFRxGBt5saQ6brBZuHZkSjE
Content-Type: multipart/mixed; boundary="syvt2uplwEyCSOuA0fmOhf8A49TY5VImg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Xen.org security team" <security@xen.org>
Message-ID: <a6cbc3b1-dfdb-ab22-a00e-09db81c25c3f@suse.com>
Subject: Bug Bounty program

--syvt2uplwEyCSOuA0fmOhf8A49TY5VImg
Content-Type: multipart/mixed;
 boundary="------------1ABCE5C356D00298E7FD5A4F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1ABCE5C356D00298E7FD5A4F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Recently we (the Xen security team) have been invited by HackerOne
to join the Internet Bug Bounty https://hackerone.com/ibb (citing the
original mail):

 > The Internet Bug Bounty <https://hackerone.com/ibb> was created with
 > the goal of helping to secure critical open source infrastructure.
 > After almost $1M paid out for vulnerabilities in open source, we are
 > expanding the program's scope with more OSS Projects, and I=E2=80=99m =
reaching
 > out to you today because Xen Hypervisor was specifically requested by
 > multiple partners.
 >
 > - Partners contribute funds to a shared pool, and nominate projects
 >   for inclusion
 > - Projects opt-in for inclusion in the program
 > - Vulnerabilities are reported directly to project maintainers by your=

 >   preferred process
 > - After a public advisory is released, the Finder submits a bounty
 >   claim to the IBB
 > - Bounty is split 80% for finder and 20% to the project

This is something we as the security team don't want to decide without
discussing it in the open. We've brought that topic up in today's (Nov
2nd) community call. As maybe not everyone wanting to bring something
up was in that call, I volunteered to write this mail to xen-devel.

There are a few things we already discussed:

- As a large quantity of security bugs is actually detected by the
   security team while looking at other security bugs, we feel that the
   members of the security team should not be claiming bug bounties for
   issues they find in the code.

- We are aware of the possibility that someone (being a contributor or
   a maintainer) might try to sneak in a patch introducing a security
   bug, in order to claim a bounty for it later. OTOH setting up rules
   for a (hopefully) never occurring case feels like overkill, and we
   don't want to drive away potential new contributors or maintainers by
   excluding them at least partially from the bounty program. So right
   now we are inclined to not setup further exclusion rules for claiming
   any bounties.

- General consensus seems to be to let the bug bounty program only cover
   our coding. Any vulnerabilities reported against the Xen project's
   infrastructure (web sites, ...) should not qualify for claiming a bug
   bounty.

Are there any further topics we need to discuss, or is there any concern
with above statements?


Juergen, on behalf of the Xen security team

--------------1ABCE5C356D00298E7FD5A4F
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

--------------1ABCE5C356D00298E7FD5A4F--

--syvt2uplwEyCSOuA0fmOhf8A49TY5VImg--

--sjHRvZEv7WrFRxGBt5saQ6brBZuHZkSjE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB4BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGBYugFAwAAAAAACgkQsN6d1ii/Ey+/
awf2L7QxFxhIBWuNgB6gPYJDMfc1YvRRFpU3+H3vnfKXc+2AguB7XpV9ed7J3HGr6A4KbBqDy/91
sEu8vFjus4Q+tzhBN9Xxg29DoS/MS3SowTOEqzBUkx6uWNnOionGvVCTWU8uScZkNCNs3awKonQF
HkcE6+Ggz62ojvqWLfQrWKqK0MuuqIEPKbdFQxBMntMPhzHSF86Brm/8LFiaqcUNUqpyE1c0e7tr
32RRs61PD+NqbQighhVcGHHi3K/kx1Dq4mnSQkUQrpPc+eAsmHzg9VkUQYjijyHoT16AIEGValLW
BN1++aPGqy3D6UnIThubngnXGWlcH5zAiLpf/1Br
=4QN+
-----END PGP SIGNATURE-----

--sjHRvZEv7WrFRxGBt5saQ6brBZuHZkSjE--

