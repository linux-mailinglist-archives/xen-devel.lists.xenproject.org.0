Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8B43336B1
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 08:52:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95885.181031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJte7-0002a2-Nx; Wed, 10 Mar 2021 07:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95885.181031; Wed, 10 Mar 2021 07:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJte7-0002Zd-Jx; Wed, 10 Mar 2021 07:52:43 +0000
Received: by outflank-mailman (input) for mailman id 95885;
 Wed, 10 Mar 2021 07:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YKvx=II=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJte6-0002ZY-Bg
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 07:52:42 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d94ed53f-f894-4c97-aa0b-37368bcb87d7;
 Wed, 10 Mar 2021 07:52:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E5E6DAE44;
 Wed, 10 Mar 2021 07:52:40 +0000 (UTC)
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
X-Inumbo-ID: d94ed53f-f894-4c97-aa0b-37368bcb87d7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615362761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fmagm0g6SG9wOn5qY9NDsKJhRGoqp/JA1hP32sWV3T4=;
	b=VyZrbZQKMeSMXCTWCSyz0CqR7B2gWSK3gyj6vBitCnWoQi7styoaQILCubHOquaJugUypv
	ovDZFEds58x63Nt44akxgZiZ4BSosHqqH92NNeihDJ/FNj5MIk3ysmnm9p42v5UM3/fAEh
	IKGW1y8bpuZ2EbURSOq7bZEdO9hkQPE=
Subject: Re: [PATCH v6 04/12] x86/alternative: support not-feature
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20210309134813.23912-1-jgross@suse.com>
 <20210309134813.23912-5-jgross@suse.com> <20210310060705.GB23521@zn.tnic>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <1b95376a-56e1-ab3e-aa85-73a9d38aaaf7@suse.com>
Date: Wed, 10 Mar 2021 08:52:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210310060705.GB23521@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dTWXoiEr2CUu22HQ0ZizVBKitnbXxMRRZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dTWXoiEr2CUu22HQ0ZizVBKitnbXxMRRZ
Content-Type: multipart/mixed; boundary="p5M5sLIHJQkn6BTbMQSaAVowf7JqkAJIS";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <1b95376a-56e1-ab3e-aa85-73a9d38aaaf7@suse.com>
Subject: Re: [PATCH v6 04/12] x86/alternative: support not-feature
References: <20210309134813.23912-1-jgross@suse.com>
 <20210309134813.23912-5-jgross@suse.com> <20210310060705.GB23521@zn.tnic>
In-Reply-To: <20210310060705.GB23521@zn.tnic>

--p5M5sLIHJQkn6BTbMQSaAVowf7JqkAJIS
Content-Type: multipart/mixed;
 boundary="------------67B61F63DAEE5E8820EB9FAE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------67B61F63DAEE5E8820EB9FAE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.03.21 07:07, Borislav Petkov wrote:
> On Tue, Mar 09, 2021 at 02:48:05PM +0100, Juergen Gross wrote:
>> Add support for alternative patching for the case a feature is not
>> present on the current cpu.
>>
>> For users of ALTERNATIVE() and friends an inverted feature is specifie=
d
>> by applying the ALT_NOT() macro to it, e.g.:
>>
>> ALTERNATIVE(old, new, ALT_NOT(feature))
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V5:
>> - split off from next patch
>> - reworked to use flag byte (Boris Petkov)
>> V6:
>> - rework again to not use flag byte (Boris Petkov)
>> ---
>>   arch/x86/include/asm/alternative-asm.h |  3 +++
>>   arch/x86/include/asm/alternative.h     |  3 +++
>>   arch/x86/kernel/alternative.c          | 19 ++++++++++++++-----
>>   3 files changed, 20 insertions(+), 5 deletions(-)
>=20
> LGTM, minor touchups I'd do ontop:
>=20
> ---
>=20
> diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/=
alternative.h
> index 89889618ae01..fd205cdcfbad 100644
> --- a/arch/x86/include/asm/alternative.h
> +++ b/arch/x86/include/asm/alternative.h
> @@ -55,18 +55,18 @@
>   	".long 999b - .\n\t"					\
>   	".popsection\n\t"
>  =20
> +#define ALTINSTR_FLAG_INV	(1 << 15)
> +#define ALT_NOT(feat)		((feat) | ALTINSTR_FLAG_INV)
> +
>   struct alt_instr {
>   	s32 instr_offset;	/* original instruction */
>   	s32 repl_offset;	/* offset to replacement instruction */
>   	u16 cpuid;		/* cpuid bit set for replacement */
> -#define ALTINSTR_FLAG_INV (1 << 15)
>   	u8  instrlen;		/* length of original instruction */
>   	u8  replacementlen;	/* length of new instruction */
>   	u8  padlen;		/* length of build-time padding */
>   } __packed;
>  =20
> -#define ALT_NOT(feat)	((feat) | ALTINSTR_FLAG_INV)
> -

Did you look at patch 13? :-)

>   /*
>    * Debug flag that can be tested to see whether alternative
>    * instructions were patched in already:
> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternativ=
e.c
> index d8e669a1546f..133b549dc091 100644
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -397,9 +397,10 @@ void __init_or_module noinline apply_alternatives(=
struct alt_instr *start,
>   		BUG_ON(feature >=3D (NCAPINTS + NBUGINTS) * 32);
>  =20
>   		/*
> -		 * Drop out if either:
> -		 * - feature not available, but required, or
> -		 * - feature available, but NOT required
> +		 * Patch if either:
> +		 * - feature is present
> +		 * - feature not present but ALTINSTR_FLAG_INV is set to mean,
> +		 *   patch if feature is *NOT* present.

Okay.


Juergen

--------------67B61F63DAEE5E8820EB9FAE
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

--------------67B61F63DAEE5E8820EB9FAE--

--p5M5sLIHJQkn6BTbMQSaAVowf7JqkAJIS--

--dTWXoiEr2CUu22HQ0ZizVBKitnbXxMRRZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBIesgFAwAAAAAACgkQsN6d1ii/Ey8v
Qwf+PVmZMZVTwfKPrQb5E1WzsyCFL0Gr06M/AR0VARJ5+OhMaH1oGGeSsE8Td0O7+R6P3m6+c4j2
4vxCddjvA/a7Z5CBWOs70yOGK282YHUdSanfGGbWD0EE89h8IvxqIvpKIvedJZeaykynOFl2u3gp
F7QUw8FzZMfuMeFMHTiOxrv0kJ797jvbzLjhZRIOxaStCMj2FAwqpSHfWANXwJ39POD3kO3n/dBc
E2BCQSmYxijJUHHrUTcYk5bgVwbtVX1H7t47zru6RLWbjJkeYXENYYaXZjBQHh8dJTPFPJqWhbH7
qNC1tndU9dCCQQvfB2c5MsMw9K8kcDvN600vlT5Npg==
=bcO9
-----END PGP SIGNATURE-----

--dTWXoiEr2CUu22HQ0ZizVBKitnbXxMRRZ--

