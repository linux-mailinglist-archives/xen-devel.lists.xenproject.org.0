Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D784536FD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 17:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226423.391314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn12B-0000VJ-2U; Tue, 16 Nov 2021 16:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226423.391314; Tue, 16 Nov 2021 16:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mn12A-0000TH-VZ; Tue, 16 Nov 2021 16:10:10 +0000
Received: by outflank-mailman (input) for mailman id 226423;
 Tue, 16 Nov 2021 16:10:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Wk1=QD=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mn129-0007jn-Ij
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 16:10:09 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab3a755b-46f7-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 17:10:08 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52F8D1FD26;
 Tue, 16 Nov 2021 16:10:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E01713C25;
 Tue, 16 Nov 2021 16:10:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g6/fDeDXk2FPRwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 16 Nov 2021 16:10:08 +0000
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
X-Inumbo-ID: ab3a755b-46f7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637079008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ypb1gZP/qFn/Nc2cwD8eE7gissGSLHhWjECL1VbKa7U=;
	b=f99V7TL6Gvztv0x03Hl4Jsm7qkYJxJVdGf4EyhKmFW0ifeC4fOY4lUxTToz5nQgSdHbbiF
	oN3n2lInJW0p8RTJ4M5NcIHf1zjzUDK3QDB62pmIDixuaSjEcp90pgCOmnipBRR/PgBQ+W
	frovXAlYe0UJ1K00hDgY+T4QawuYTWw=
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Xen.org security team" <security@xen.org>
References: <a6cbc3b1-dfdb-ab22-a00e-09db81c25c3f@suse.com>
Subject: Re: Bug Bounty program
Message-ID: <a796699d-ff16-d236-d678-ad8bd638f2ba@suse.com>
Date: Tue, 16 Nov 2021 17:10:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a6cbc3b1-dfdb-ab22-a00e-09db81c25c3f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Z0bHqhodIHesa6lxz8SgQbNCMT69XNA7q"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Z0bHqhodIHesa6lxz8SgQbNCMT69XNA7q
Content-Type: multipart/mixed; boundary="j9S8WZ3q1M02g52hYGitPe1jvpHDbYOtR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Xen.org security team" <security@xen.org>
Message-ID: <a796699d-ff16-d236-d678-ad8bd638f2ba@suse.com>
Subject: Re: Bug Bounty program
References: <a6cbc3b1-dfdb-ab22-a00e-09db81c25c3f@suse.com>
In-Reply-To: <a6cbc3b1-dfdb-ab22-a00e-09db81c25c3f@suse.com>

--j9S8WZ3q1M02g52hYGitPe1jvpHDbYOtR
Content-Type: multipart/mixed;
 boundary="------------4C8717FF9EC678D9B5A449E9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4C8717FF9EC678D9B5A449E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.11.21 17:10, Juergen Gross wrote:
> Recently we (the Xen security team) have been invited by HackerOne
> to join the Internet Bug Bounty https://hackerone.com/ibb (citing the
> original mail):
>=20
>  > The Internet Bug Bounty <https://hackerone.com/ibb> was created with=

>  > the goal of helping to secure critical open source infrastructure.
>  > After almost $1M paid out for vulnerabilities in open source, we are=

>  > expanding the program's scope with more OSS Projects, and I=E2=80=99=
m reaching
>  > out to you today because Xen Hypervisor was specifically requested b=
y
>  > multiple partners.
>  >
>  > - Partners contribute funds to a shared pool, and nominate projects
>  >=C2=A0=C2=A0 for inclusion
>  > - Projects opt-in for inclusion in the program
>  > - Vulnerabilities are reported directly to project maintainers by yo=
ur
>  >=C2=A0=C2=A0 preferred process
>  > - After a public advisory is released, the Finder submits a bounty
>  >=C2=A0=C2=A0 claim to the IBB
>  > - Bounty is split 80% for finder and 20% to the project
>=20
> This is something we as the security team don't want to decide without
> discussing it in the open. We've brought that topic up in today's (Nov
> 2nd) community call. As maybe not everyone wanting to bring something
> up was in that call, I volunteered to write this mail to xen-devel.
>=20
> There are a few things we already discussed:
>=20
> - As a large quantity of security bugs is actually detected by the
>  =C2=A0 security team while looking at other security bugs, we feel tha=
t the
>  =C2=A0 members of the security team should not be claiming bug bountie=
s for
>  =C2=A0 issues they find in the code.
>=20
> - We are aware of the possibility that someone (being a contributor or
>  =C2=A0 a maintainer) might try to sneak in a patch introducing a secur=
ity
>  =C2=A0 bug, in order to claim a bounty for it later. OTOH setting up r=
ules
>  =C2=A0 for a (hopefully) never occurring case feels like overkill, and=
 we
>  =C2=A0 don't want to drive away potential new contributors or maintain=
ers by
>  =C2=A0 excluding them at least partially from the bounty program. So r=
ight
>  =C2=A0 now we are inclined to not setup further exclusion rules for cl=
aiming
>  =C2=A0 any bounties.
>=20
> - General consensus seems to be to let the bug bounty program only cove=
r
>  =C2=A0 our coding. Any vulnerabilities reported against the Xen projec=
t's
>  =C2=A0 infrastructure (web sites, ...) should not qualify for claiming=
 a bug
>  =C2=A0 bounty.
>=20
> Are there any further topics we need to discuss, or is there any concer=
n
> with above statements?

Seems as if there is no specific need for further discussion, given that
2 weeks have passed without any response to this mail.

As the advisory board is fine with us joining the Internet Bug Bounty,
we'll do that.

The following restrictions apply:

- Members of the security team can't claim bounties.

- Nobody should claim a bounty for a vulnerability introduced by a
   patch for which he/she has given any of a "Signed-off-by:",
   "Acked-by:" or "Reviewed-by:" tag. In case someone thinks that
   a special case needs an exception from that rule, it is always
   possible to request that from the community manager or the security
   team (before claiming the bounty).

- Only security issues in our code base are covered by the Bug Bounty
   program.


Juergen

--------------4C8717FF9EC678D9B5A449E9
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

--------------4C8717FF9EC678D9B5A449E9--

--j9S8WZ3q1M02g52hYGitPe1jvpHDbYOtR--

--Z0bHqhodIHesa6lxz8SgQbNCMT69XNA7q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGT198FAwAAAAAACgkQsN6d1ii/Ey/g
nQf/dKnM6uWmb0KT1lxvuF7z/qncr8fWqRs90vFDgD6McqCNHomGHuLQRqpGFt7R5MWJ2XNS8xZg
vn6hIc9d+SEswEmY2OZjV93xYsHyU0XbRmz3ZK4f9LhjELCXGARNHaBo0cdsMQ8ArljaddWHQbuD
ihXvnIiMiDr7bsLqZH0a1+8fFv1G10y920TmBzFSuSzkNX8ANbsxoGzdQ2oZCEUcwfqYC0SpAm7Z
hdva5DasyQmgjBcAC32cqOfmajsSljmGduSqp9Vn0VV1ohUXfm4Krnk7qjyGK2SWj5A+IX29731j
/1lXrsGKkJ1nnM4Z6wHmbX+FGYPZ/lQy+Rx3cTiflQ==
=iC6B
-----END PGP SIGNATURE-----

--Z0bHqhodIHesa6lxz8SgQbNCMT69XNA7q--

