Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDE13EFD23
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 08:52:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168112.306917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGFQo-0003yr-22; Wed, 18 Aug 2021 06:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168112.306917; Wed, 18 Aug 2021 06:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGFQn-0003wp-TR; Wed, 18 Aug 2021 06:52:09 +0000
Received: by outflank-mailman (input) for mailman id 168112;
 Wed, 18 Aug 2021 06:52:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jUNG=NJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGFQl-0003vP-Vs
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 06:52:08 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd399256-fff0-11eb-a53b-12813bfff9fa;
 Wed, 18 Aug 2021 06:52:07 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 49AED20057;
 Wed, 18 Aug 2021 06:52:06 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 22966134B1;
 Wed, 18 Aug 2021 06:52:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id LSjYBhauHGFQdgAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 18 Aug 2021 06:52:06 +0000
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
X-Inumbo-ID: cd399256-fff0-11eb-a53b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629269526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bcH1Hvx714f5Z/FXE9D4oVygXDGX9Xuh7xI+v5UZ1r8=;
	b=Vbfhdx2Q8ruftzQRa6IBNJDlEm+ELmel9X8RrllFywfu+VMLhajGMxI9SiW8kVDBEoh1wM
	tyr9MbdAf8J5FZLeoa/aEcGglloHwjFMBbP0ml4WBkwb1ECb/2fnkgKDS/hemKH/hbkXga
	0ga/gi+H3fBCKjpi9FPTugLujDl9PIM=
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YRvMy9NgGxYKRcNc@mail-itl>
 <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
 <d700e9f6-8c64-52b6-6881-5816c2895200@suse.com>
 <d0f3c58e-fb2b-3d67-b9c1-1c8cdddb9055@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get
Message-ID: <e9ccc790-196c-c740-f0d4-2f2cc5e4e538@suse.com>
Date: Wed, 18 Aug 2021 08:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d0f3c58e-fb2b-3d67-b9c1-1c8cdddb9055@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lDkyriCvHj96FMGlEin7exAURzHbQFD7D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lDkyriCvHj96FMGlEin7exAURzHbQFD7D
Content-Type: multipart/mixed; boundary="OCoJAccrOnUanfikGNbUv5GDyO9H7Azaw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <e9ccc790-196c-c740-f0d4-2f2cc5e4e538@suse.com>
Subject: Re: S3 resume issue in cpufreq ->
 get_cpu_idle_time->vcpu_runstate_get
References: <YRvMy9NgGxYKRcNc@mail-itl>
 <42948041-59a5-e243-ed39-6e2afe3fd1cd@suse.com>
 <d700e9f6-8c64-52b6-6881-5816c2895200@suse.com>
 <d0f3c58e-fb2b-3d67-b9c1-1c8cdddb9055@suse.com>
In-Reply-To: <d0f3c58e-fb2b-3d67-b9c1-1c8cdddb9055@suse.com>

--OCoJAccrOnUanfikGNbUv5GDyO9H7Azaw
Content-Type: multipart/mixed;
 boundary="------------0FC338B658635CD03DC606AB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0FC338B658635CD03DC606AB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.08.21 08:41, Jan Beulich wrote:
> On 18.08.2021 08:24, Juergen Gross wrote:
>> Could you please try the attached patch?
>=20
> Seeing the patch, two questions:
>=20
> 1) Can idle_vcpu[cpu] ever be NULL when cpu_online(cpu) returned true?

No.

> 2) Seeing get_sched_res()'es access to per-CPU data, would it make sens=
e
> to move the cpu_online() check into there? While I guess the majority o=
f
> users are guaranteed to invoke it for online CPUs, I wonder if there
> aren't any further uses on the CPU bringup / teardown code paths.

As get_sched_res() is private to the scheduler sources, this would imply
a scheduler function being used for an offline cpu, which is rather
unlikely. Especially as get_cpu_idle_time() is the only official
scheduler function taking a physical cpu number as parameter. All other
functions only work with vcpus, and this would require to wake, pause,
=2E.. an idle vcpu of an offline cpu to hit the problem.


Juergen

--------------0FC338B658635CD03DC606AB
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

--------------0FC338B658635CD03DC606AB--

--OCoJAccrOnUanfikGNbUv5GDyO9H7Azaw--

--lDkyriCvHj96FMGlEin7exAURzHbQFD7D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEcrhUFAwAAAAAACgkQsN6d1ii/Ey+l
kAf/RTyvg8gB8JHTWeix3OJPq0g0ErB7fJCsrkPQh4Tb/u27CIDoYPHD5HOWng3wRyGr+OJw+tXo
zV6O8oY6YK2rPhjSm6hpak2LruuxM5W3q5Q+t+9oyg7rUlFgBkQJ7bcDZfFCAK9bLGp+cEpxsBIM
2/cY5I9ZivBXIVTrPPRuUVl+StZIiXjDPYa2iSXVRWMrwr/PjxBhI1J5L1X02Nqcbbld+rdngAs6
HL1TXCsSFlDujp91mttOeUYhx5au7HBl9PFsvv9L/Cj3oLGdsbd7Ll/aqh0RKb9IlREuJqymPqen
AxusxZj5pVNUfQbHu8Au6j17zUDqrkG3oiAOYNw+4g==
=QUhk
-----END PGP SIGNATURE-----

--lDkyriCvHj96FMGlEin7exAURzHbQFD7D--

