Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896AF2C419A
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 15:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37803.70330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khvMn-0002EW-OO; Wed, 25 Nov 2020 14:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37803.70330; Wed, 25 Nov 2020 14:01:53 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khvMn-0002E7-Jr; Wed, 25 Nov 2020 14:01:53 +0000
Received: by outflank-mailman (input) for mailman id 37803;
 Wed, 25 Nov 2020 14:01:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khvMl-0002DO-U2
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 14:01:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f2e1c82-3c26-4abe-9eca-f6c55a7ad8bd;
 Wed, 25 Nov 2020 14:01:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9473AAC22;
 Wed, 25 Nov 2020 14:01:49 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X3kr=E7=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khvMl-0002DO-U2
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 14:01:52 +0000
X-Inumbo-ID: 2f2e1c82-3c26-4abe-9eca-f6c55a7ad8bd
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2f2e1c82-3c26-4abe-9eca-f6c55a7ad8bd;
	Wed, 25 Nov 2020 14:01:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606312909; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hFzhXzFFghZZk4ZpDbGxeUJ0LHm6treS6Oq94x67l3Q=;
	b=VVjfRpJJ9ndcRbbUXwpPhVk562st3Csoq/6/iF7FYodZApf9j/veNuc9r0+VwF+Dxabbuu
	QHydgOyOdjxW6WzTAHdlCHMOs1Z8ItFyGWJE65R6pl5Vn8akX6S/OS5PzdAhENo7e0fc7T
	gLh5TxUdgULZ7TWkcyiR3yeXZhqwAkM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9473AAC22;
	Wed, 25 Nov 2020 14:01:49 +0000 (UTC)
Subject: Re: Xen 4.15: Proposed release schedule
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, George Dunlap <George.Dunlap@citrix.com>
References: <24510.24778.433048.477008@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f46207ec-5022-2415-c823-e27ee8b74f9c@suse.com>
Date: Wed, 25 Nov 2020 15:01:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <24510.24778.433048.477008@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="iq6o53iNID9ZPMy97LKYPfBJzRBTyu9Fc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--iq6o53iNID9ZPMy97LKYPfBJzRBTyu9Fc
Content-Type: multipart/mixed; boundary="JsFG8kzwkduzFc83dt57SkXSIiZAungJ1";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: committers@xenproject.org, George Dunlap <George.Dunlap@citrix.com>
Message-ID: <f46207ec-5022-2415-c823-e27ee8b74f9c@suse.com>
Subject: Re: Xen 4.15: Proposed release schedule
References: <24510.24778.433048.477008@mariner.uk.xensource.com>
In-Reply-To: <24510.24778.433048.477008@mariner.uk.xensource.com>

--JsFG8kzwkduzFc83dt57SkXSIiZAungJ1
Content-Type: multipart/mixed;
 boundary="------------AD3675CBC7F429925466476B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AD3675CBC7F429925466476B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.11.20 14:48, Ian Jackson wrote:
>      Andrew Cooper <andrew.cooper3@citrix.com>,
>      George Dunlap <george.dunlap@citrix.com>,
>      Jan Beulich <jbeulich@suse.com>,
>      Julien Grall <julien@xen.org>,
>      Stefano Stabellini <sstabellini@kernel.org>,
>      =3D?iso-8859-1?Q?J=3DFCrgen_Gro=3DDF?=3D <jgross@suse.com>,
>      Paul Durrant <xadimgnik@gmail.com>,
>      Wei Liu <wl@xen.org>
> FCC: ~/mail/Outbound
> --text follows this line--
> Hi.  I've done a little bit of consultation with previous release
> managers, and reviewed various list archives and calendars.  These
> consultations seemed to suggest some folklore that wasn't captured in
> our process doc - hence the proposed patch, below.
>=20
> I would like to tentatively propose the following schedule and
> policies for Xen 4.15.
>=20
> If you have opinions, please comment as soon as you can so that we can
> have an open dialogue.  Comments must be submitted at the very latest
> by 1700 UTC on Wednesday the 2nd of December.
>=20
> Having never done this before, I am particularly interested in
> comments from previous release managers.
>=20
> ** DRAFT **
>=20
>    Friday 8th January    Last posting date
>=20
>      Patches adding new features should be posted to the mailing list
>      by this cate, although perhaps not in their final version.
>=20
>    Friday 22nd January   Feature freeze
>  =20
>      Patches adding new features should be committed by this date.
>      Straightforward bugfixes may continue to be accepted by
>      maintainers.
>=20
>    Friday 12th February **tentatve**   Code freeze
>=20
>      Bugfixes only, all changes to be approved by the Release Manager.
>=20
>    Week of 12th March **tentative**   Release
>      (probably Tuesday or Wednesday)
>=20
> Any patches containing substantial refactoring are to treated as
> new features, even if they intent is to fix bugs.
>=20
> Freeze exceptions will not be routine, but may be granted in
> exceptional cases for small changes on the basis of risk assessment.
> Large series will not get exceptions.  Contributors *must not* rely on
> getting, or expect, a freeze exception.
>=20
> Chinese New Year falls around the 11th-19th of February this year.  In
> my plan above, that falls within the hard code freeze period.  If we
> don't manage to get the tree to an acceptable quality level by the
> tentative codefreeze and release dates above, these dates will slip.
>=20
> I have not yet started tracking "big ticket" items, and bugs.  I
> expect to start doing that starting after Christmas.  NB the primary
> responsibility for driving a feature's progress to meet the release
> schedule, lies with the feature's proponents.
>=20
> If as a feature proponent you feel your feature is at risk and there
> is something the Xen Project could do to help, please consult me or
> the Community Manager.  In such situations please reach out earlier
> rather than later.
>=20
> ** END OF DRAFT **
>=20
> Thanks,
> Ian.
>=20
>>From b34f4ddace0b8d76d8c340a46288a2db79c99460 Mon Sep 17 00:00:00 2001
> From: Ian Jackson <iwj@xenproject.org>
> To: xen-devel@lists.xenproject.org
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Julien Grall <julien@xen.org>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Date: Wed, 25 Nov 2020 13:22:08 +0000
> Subject: [PATCH] xen-release-management doc: More info on schedule
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> This documents our practice, established in 2018
>    https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html
> et seq
>=20
> CC: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> CC: Paul Durrant <xadimgnik@gmail.com>
> CC: Wei Liu <wl@xen.org>
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> ---
>   docs/process/xen-release-management.pandoc | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/docs/process/xen-release-management.pandoc b/docs/process/=
xen-release-management.pandoc
> index e1aa1eda8f..a5d70fed67 100644
> --- a/docs/process/xen-release-management.pandoc
> +++ b/docs/process/xen-release-management.pandoc
> @@ -15,8 +15,10 @@ that they can have an idea what to expect from the R=
elease Manager.
>  =20
>   # Xen release cycle
>  =20
> -The Xen hypervisor project now releases every 8 months. The actual rel=
ease date
> -depends on a lot of factors.
> +The Xen hypervisor project now releases every 8 months.  We aim to
> +release in the first half of March/July/November.  These dates have
> +been chosen to avoid major holidays and cultural events; if one
> +release slips, ideally the previous release cycle would be shortened.

s/previous/following/

Maybe add a reference to the mail thread in the xen-devel archives?

>  =20
>   We can roughly divide one release into two periods. The development p=
eriod
>   and the freeze period. The former is 6 months long and the latter is =
about 2
> @@ -33,6 +35,12 @@ During freeze period, the tree is closed for new fea=
tures. Only bug fixes are
>   accepted. This period can be shorter or longer than 2 months. If it e=
nds up
>   longer than 2 months, it eats into the next development period.
>  =20
> +The precise release schedule depends on a lot of factors and needs to
> +be set afresh by the Release Manager in each release cycle.  When the
> +release is in March, particular consideration should be given to the
> +Chinese New Year holidaty which will then typically occur curing the

s/holidaty/holiday/

> +freeze, so the freeze should probably be extended to compensate.
> +
>   # The different roles in a Xen release
>  =20
>   ## Release Manager
>=20


Juergen

--------------AD3675CBC7F429925466476B
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

--------------AD3675CBC7F429925466476B--

--JsFG8kzwkduzFc83dt57SkXSIiZAungJ1--

--iq6o53iNID9ZPMy97LKYPfBJzRBTyu9Fc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl++Y8wFAwAAAAAACgkQsN6d1ii/Ey/u
ogf9Hqe83P/o/oUUn23gSAEzdAkt+TzuEA1Fx8tIsQOl86X2m6C90hqrnWy7jc1kH8U931vOgIMp
RvyUSYNVGLrFW5jl2d9uDLboKacsgh9iD60KEcz+OqOI/gocizbRg88u9q8xpOxy5ZRwFnk0z2Aq
RD60hEcsbAYuyrvgg0DQGfh6RZbKlg7odPh9wSoVU7QS63lWrGSJaMh3gugBqPUyUpu2zecAddmm
nVTRrAyOlmFHem8u2ssA5IEgR/EoTDB0CzXB+G5AL2WIe4EpOQjdUqDeh5ZJvnYNekYt75UmMs5T
S3Fk64AmZc4Ra0baGCk06ppCyxtqimYB0S48Aq2aUQ==
=951n
-----END PGP SIGNATURE-----

--iq6o53iNID9ZPMy97LKYPfBJzRBTyu9Fc--

