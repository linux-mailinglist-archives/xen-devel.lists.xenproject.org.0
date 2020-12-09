Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6AA2D421B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 13:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48237.85282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmyUH-00035u-Cc; Wed, 09 Dec 2020 12:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48237.85282; Wed, 09 Dec 2020 12:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmyUH-00035U-9B; Wed, 09 Dec 2020 12:22:29 +0000
Received: by outflank-mailman (input) for mailman id 48237;
 Wed, 09 Dec 2020 12:22:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmyUF-00035P-Ln
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 12:22:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e598f9fa-fb91-44d1-bb95-32e8fa1abd17;
 Wed, 09 Dec 2020 12:22:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2AE30ACEB;
 Wed,  9 Dec 2020 12:22:25 +0000 (UTC)
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
X-Inumbo-ID: e598f9fa-fb91-44d1-bb95-32e8fa1abd17
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607516545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=d6BLSrmEsvAmBCGh/lx0C5ZfrqtSEHsMuHBG2XnZ/Ro=;
	b=ncPpEGPcbHUJafnkDYQ/1H+ADDcCm5mL63ULlOfqMBhAnbc4yg/Gky2O5504x9o/tZrBrw
	DP7jhSJhM4Fpz8OxbijA5E0XwoPASgyWTUDdc+ATpiMeMmSQpO0kHNOkr8o9+l+8OPlFsh
	ixuwSO3VZGgWks6WWKL58SRm0h4vXUU=
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-8-jgross@suse.com> <20201208184315.GE27920@zn.tnic>
 <2510752e-5d3d-f71c-8a4c-a5d2aae0075e@suse.com>
 <20201209120307.GB18203@zn.tnic>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 07/12] x86: add new features for paravirt patching
Message-ID: <9e989b07-84e8-b07b-ba6e-c2a3ed19d7b1@suse.com>
Date: Wed, 9 Dec 2020 13:22:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201209120307.GB18203@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qobO3V9L9yPkUmsoDuHQESsEkFOc5p2K2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qobO3V9L9yPkUmsoDuHQESsEkFOc5p2K2
Content-Type: multipart/mixed; boundary="j7y3yD5DTlqLcvANFz2bK4alg1dWK3UG5";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <9e989b07-84e8-b07b-ba6e-c2a3ed19d7b1@suse.com>
Subject: Re: [PATCH v2 07/12] x86: add new features for paravirt patching
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-8-jgross@suse.com> <20201208184315.GE27920@zn.tnic>
 <2510752e-5d3d-f71c-8a4c-a5d2aae0075e@suse.com>
 <20201209120307.GB18203@zn.tnic>
In-Reply-To: <20201209120307.GB18203@zn.tnic>

--j7y3yD5DTlqLcvANFz2bK4alg1dWK3UG5
Content-Type: multipart/mixed;
 boundary="------------CA72DA38978A6BC0090784A9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CA72DA38978A6BC0090784A9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.12.20 13:03, Borislav Petkov wrote:
> On Wed, Dec 09, 2020 at 08:30:53AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> Hey, I already suggested to use ~FEATURE for that purpose (see
>> https://lore.kernel.org/lkml/f105a63d-6b51-3afb-83e0-e899ea40813e@suse=
=2Ecom/
>=20
> Great minds think alike!
>=20
> :-P
>=20
>> I'd rather make the syntax:
>>
>> ALTERNATIVE_TERNARY <initial-code> <feature> <code-for-feature-set>
>>                                               <code-for-feature-unset>=

>>
>> as this ...
>=20
> Sure, that is ok too.
>=20
>> ... would match perfectly to this interpretation.
>=20
> Yap.
>=20
>> Hmm, using flags is an alternative (pun intended :-) ).
>=20
> LOL!
>=20
> Btw, pls do check how much the vmlinux size of an allyesconfig grows
> with this as we will be adding a byte per patch site. Not that it would=

> matter too much - the flags are a long way a comin'. :-)
>=20
>> No, this is needed for non-Xen cases, too (especially pv spinlocks).
>=20
> I see.
>=20
>>> Can you give an example here pls why the paravirt patching needs to r=
un
>>> first?
>>
>> Okay.
>=20
> I meant an example for me to have a look at. :)
>=20
> If possible pls.

Ah, okay.

Lets take the spin_unlock() case. With patch 11 of the series this is

PVOP_ALT_VCALLEE1(lock.queued_spin_unlock, lock,
                   "movb $0, (%%" _ASM_ARG1 ");",
                   X86_FEATURE_NO_PVUNLOCK);

which boils down to ALTERNATIVE "call *lock.queued_spin_unlock"
                                 "movb $0,(%rdi)" X86_FEATURE_NO_PVUNLOCK=


The initial (paravirt) code is an indirect call in order to allow
spin_unlock() before paravirt/alternative patching takes place.

Paravirt patching will then replace the indirect call with a direct call
to the correct unlock function. Then alternative patching might replace
the direct call to the bare metal unlock with a plain "movb $0,(%rdi)"
in case pvlocks are not enabled.

In case alternative patching would occur first, the indirect call might
be replaced with the "movb ...", and then paravirt patching would
clobber that with the direct call, resulting in the bare metal
optimization being removed again.


Juergen

--------------CA72DA38978A6BC0090784A9
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

--------------CA72DA38978A6BC0090784A9--

--j7y3yD5DTlqLcvANFz2bK4alg1dWK3UG5--

--qobO3V9L9yPkUmsoDuHQESsEkFOc5p2K2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/QwYAFAwAAAAAACgkQsN6d1ii/Ey8C
rwgAjKCTh8rwB+MLx5PuBMufLtRi8vf4GP26O85xV8wEvfWhch7/qy70h5Gw5A6BOCCxQLWZSINQ
ufDERwJjYhLC6lWo60Twwu3XlwUy3XC3/OC2xMrCeFGb6aoPL7Cis1jgNN+Rv3sBDx5y5doXRQZI
uQTYdLfiUnFW8Gow9yS0sofiHJjgcpzkF/kgft19MRGadRYH/AIJhLUko8bHBptLLkwSbqzZWKBP
pXOdsFjwYHLJkCog8GqKVx4pTgBmJGuDHh9stdFY7co9u3nLz4jISxEgEoPrl/cRD+JKeTkSkiPm
mVjAzQ02EJP47h09rTGf0nTohZHBTjzJVqDg/yeeLw==
=MeHc
-----END PGP SIGNATURE-----

--qobO3V9L9yPkUmsoDuHQESsEkFOc5p2K2--

