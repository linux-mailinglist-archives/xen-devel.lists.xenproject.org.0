Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D88D43F19F6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:06:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168763.308127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhk1-0007mf-KE; Thu, 19 Aug 2021 13:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168763.308127; Thu, 19 Aug 2021 13:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGhk1-0007ks-H6; Thu, 19 Aug 2021 13:05:53 +0000
Received: by outflank-mailman (input) for mailman id 168763;
 Thu, 19 Aug 2021 13:05:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7+2=NK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGhk0-0007kk-JZ
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:05:52 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2db16f3e-00ee-11ec-a607-12813bfff9fa;
 Thu, 19 Aug 2021 13:05:51 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C583E1FD97;
 Thu, 19 Aug 2021 13:05:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9F0611340C;
 Thu, 19 Aug 2021 13:05:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id YcnIJC5XHmEGcwAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 19 Aug 2021 13:05:50 +0000
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
X-Inumbo-ID: 2db16f3e-00ee-11ec-a607-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629378350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q9wc82zAqzlqORYo/HLIPewZ0ychsr1D4iYJoWsQtVU=;
	b=uuHJEoRFC6K45fsrbuQyu8nUlWV2n8yEwbne6QQKBHWLyyBqTvtm2oe06ICx0/L1+tAlSn
	HProzkEY5SD19ZwL7wFZ8x5vCcfeSUmpGSjmv5eSEmbJsAuUijd0tyggZFxq+YnNwSzUd2
	JMgKZD5JqBAV5JSZ1P77A68dDCQ02sM=
Subject: Re: [xen-unstable test] 164237: regressions - FAIL
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <osstest-164237-mainreport@xen.org>
 <63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
 <24862.21094.866583.748384@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <771e9b22-222a-6e79-0e70-3e5dec0bddd8@suse.com>
Date: Thu, 19 Aug 2021 15:05:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <24862.21094.866583.748384@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DGuWDHgxS0VsxmNzz13n947TEfM4iP2bU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DGuWDHgxS0VsxmNzz13n947TEfM4iP2bU
Content-Type: multipart/mixed; boundary="hxNhXI5DODKPZXgZAzIDoV1vWbdNwASwn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <771e9b22-222a-6e79-0e70-3e5dec0bddd8@suse.com>
Subject: Re: [xen-unstable test] 164237: regressions - FAIL
References: <osstest-164237-mainreport@xen.org>
 <63c26289-4797-9ac0-af95-56b6efd64cc3@suse.com>
 <24862.21094.866583.748384@mariner.uk.xensource.com>
In-Reply-To: <24862.21094.866583.748384@mariner.uk.xensource.com>

--hxNhXI5DODKPZXgZAzIDoV1vWbdNwASwn
Content-Type: multipart/mixed;
 boundary="------------72DE88423CF44BC51BD4C8AD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------72DE88423CF44BC51BD4C8AD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.08.21 14:45, Ian Jackson wrote:
> Jan Beulich writes ("Re: [xen-unstable test] 164237: regressions - FAIL=
"):
>> Looks like this didn't sort itself (yet). Do you continue to be
>> convinced that it will, eventually?
>=20
> Hooray for explanations in commit messages.
>=20
> I will (1) drop this test and (2) force push staging in the meantime.
>=20
> Ian.
>=20
> commit 6abb2f113025c37e3e5c6bb590b8e5f60c39a861
> Author: Wei Liu <wei.liu2@citrix.com>
> Date:   Thu Nov 2 15:15:04 2017 +0000
>=20
>      make-flight: guest should use jessie to test pvgrub
>     =20
>      stretch has 64bit feature enabled for ext4, which pvgrub can't cop=
e.
>      We want to continue to test pvgrub, so specify jessie in the guest=

>      suite field.
>     =20
>      A consequence is that this test will test jessie forever.  Eventua=
lly
>      jessie will rot so badly that this test fails and then we will no
>      longer be testing pvgrub1.  Hopefully by then no-one will be using=
 it.
>     =20
>      CC: Juergen Gross <jgross@suse.com>
>      Signed-off-by: Wei Liu <wei.liu2@citrix.com>
>      Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
>=20

Does this mean we should de-support pvgrub? Or even remove it?

BTW, I don't see any reason why someone would want to keep using pvgrub
with grub-pv being available...


Juergen

--------------72DE88423CF44BC51BD4C8AD
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

--------------72DE88423CF44BC51BD4C8AD--

--hxNhXI5DODKPZXgZAzIDoV1vWbdNwASwn--

--DGuWDHgxS0VsxmNzz13n947TEfM4iP2bU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEeVy4FAwAAAAAACgkQsN6d1ii/Ey/7
4ggAgEn9jrp/cV6KFFS9LULE3OQwtvnwa5TEY0RuwHseAZJiViH+enJhb8KZa0FhqbgJ4D5bu6Zq
OGVSQLX1ihaVl5qL/BGApF2vxzqS4LF74MvvWRa6mfr/kPTp77q0Mc3Grfmd2bKCtHa7fMLSqFt0
8oN/cSo54n5uMkIlvON2hdI0dFVlTACk1lBO54ayN5l/d86jqyE2CtVqapbfWHqXR8HFFTRxXxYd
7eTZaFKzwvtDj1aGjteAxlhTZvPGnOmM4apevAYbaue6/wGYBliTFq6Lq5o9OH6erJQRI3UMBe9I
clhL6dKAWg4cB0VtqBjJ1CEfaSpOvmLFaERj1TA65Q==
=QXw6
-----END PGP SIGNATURE-----

--DGuWDHgxS0VsxmNzz13n947TEfM4iP2bU--

