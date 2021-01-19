Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AE02FB5B2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 12:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70294.126112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1pIY-0005dq-Ih; Tue, 19 Jan 2021 11:35:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70294.126112; Tue, 19 Jan 2021 11:35:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1pIY-0005dQ-FE; Tue, 19 Jan 2021 11:35:46 +0000
Received: by outflank-mailman (input) for mailman id 70294;
 Tue, 19 Jan 2021 11:35:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=299E=GW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l1pIW-0005dF-Np
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 11:35:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae755dea-bf1d-4db4-95e6-628b3c39ad6f;
 Tue, 19 Jan 2021 11:35:43 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D4E57AC8F;
 Tue, 19 Jan 2021 11:35:42 +0000 (UTC)
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
X-Inumbo-ID: ae755dea-bf1d-4db4-95e6-628b3c39ad6f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611056143; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gpscQ+ry3D0aBJJjBo94VXE/FRCNtrHj+UvlHFS+Veo=;
	b=fbvIGIFuVPP6/ERbazeHt9dSawI1HjIaJUXDaFYFQtbA11bnw0Fp8vk0f+zmCxssgWaCGK
	Meu4jhUITOG3h7IIf5w9qlWzytxY6MvI+9nRbMQKye/is+UDb3GV/lPaea6S1y1Tz6ff1M
	nBvJ0mHX5Is85rzIfuxJ2OQ2PrDLE7M=
Subject: Re: [PATCH v3 07/15] x86/alternative: support "not feature" and
 ALTERNATIVE_TERNARY
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20201217093133.1507-1-jgross@suse.com>
 <20201217093133.1507-8-jgross@suse.com> <20210107190819.GI14697@zn.tnic>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5ed34a1d-86c4-ed03-4c92-b275a555c41c@suse.com>
Date: Tue, 19 Jan 2021 12:35:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210107190819.GI14697@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0uwsXwgjCC58khCi7aVmZVWQ3hQMuwUIh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0uwsXwgjCC58khCi7aVmZVWQ3hQMuwUIh
Content-Type: multipart/mixed; boundary="2HZuOF5yMr7z4N1W9je7pKeX4DttW2NH2";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <5ed34a1d-86c4-ed03-4c92-b275a555c41c@suse.com>
Subject: Re: [PATCH v3 07/15] x86/alternative: support "not feature" and
 ALTERNATIVE_TERNARY
References: <20201217093133.1507-1-jgross@suse.com>
 <20201217093133.1507-8-jgross@suse.com> <20210107190819.GI14697@zn.tnic>
In-Reply-To: <20210107190819.GI14697@zn.tnic>

--2HZuOF5yMr7z4N1W9je7pKeX4DttW2NH2
Content-Type: multipart/mixed;
 boundary="------------A99D9741BE5A0D4DF4E23EDD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A99D9741BE5A0D4DF4E23EDD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.01.21 20:08, Borislav Petkov wrote:
> On Thu, Dec 17, 2020 at 10:31:25AM +0100, Juergen Gross wrote:
>> Instead of only supporting to modify instructions when a specific
>> feature is set, support doing so for the case a feature is not set.
>>
>> As today a feature is specified using a 16 bit quantity and the highes=
t
>> feature number in use is around 600, using a negated feature number fo=
r
>> specifying the inverted case seems to be appropriate.
>>
>>    ALTERNATIVE "default_instr", "patched_instr", ~FEATURE_NR
>>
>> will start with "default_instr" and patch that with "patched_instr" in=

>> case FEATURE_NR is not set.
>>
>> Using that add ALTERNATIVE_TERNARY:
>>
>>    ALTERNATIVE_TERNARY "default_instr", FEATURE_NR,
>>                        "feature_on_instr", "feature_off_instr"
>>
>> which will start with "default_instr" and at patch time will, dependin=
g
>> on FEATURE_NR being set or not, patch that with either
>> "feature_on_instr" or "feature_off_instr".
>=20
> How about an even simpler one (only build-tested):
>=20
> ---
> diff --git a/arch/x86/include/asm/alternative-asm.h b/arch/x86/include/=
asm/alternative-asm.h
> index 464034db299f..d52b423d3cab 100644
> --- a/arch/x86/include/asm/alternative-asm.h
> +++ b/arch/x86/include/asm/alternative-asm.h
> @@ -109,6 +109,9 @@
>   	.popsection
>   .endm
>  =20
> +#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\=

> +	ALTERNATIVE_2 oldinstr, newinstr1, feature, newinstr2, X86_FEATURE_TE=
RNARY
> +
>   #endif  /*  __ASSEMBLY__  */
>  =20
>   #endif /* _ASM_X86_ALTERNATIVE_ASM_H */
> diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm/=
alternative.h
> index 13adca37c99a..f170cbe89539 100644
> --- a/arch/x86/include/asm/alternative.h
> +++ b/arch/x86/include/asm/alternative.h
> @@ -175,6 +175,9 @@ static inline int alternatives_text_reserved(void *=
start, void *end)
>   	ALTINSTR_REPLACEMENT(newinstr2, feature2, 2)			\
>   	".popsection\n"
>  =20
> +#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	\=

> +	ALTERNATIVE_2(oldinstr, newinstr1, feature, newinstr2, X86_FEATURE_TE=
RNARY)
> +
>   #define ALTERNATIVE_3(oldinsn, newinsn1, feat1, newinsn2, feat2, newi=
nsn3, feat3) \
>   	OLDINSTR_3(oldinsn, 1, 2, 3)						\
>   	".pushsection .altinstructions,\"a\"\n"					\
> @@ -206,6 +209,9 @@ static inline int alternatives_text_reserved(void *=
start, void *end)
>   #define alternative_2(oldinstr, newinstr1, feature1, newinstr2, featu=
re2) \
>   	asm_inline volatile(ALTERNATIVE_2(oldinstr, newinstr1, feature1, new=
instr2, feature2) ::: "memory")
>  =20
> +#define alternative_ternary(oldinstr, feature, newinstr1, newinstr2)	\=

> +	asm_inline volatile(ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1,=
 newinstr2) ::: "memory")
> +
>   /*
>    * Alternative inline assembly with input.
>    *
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/=
cpufeatures.h
> index 84b887825f12..cc634db0b91f 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -108,7 +108,7 @@
>   #define X86_FEATURE_EXTD_APICID		( 3*32+26) /* Extended APICID (8 bit=
s) */
>   #define X86_FEATURE_AMD_DCM		( 3*32+27) /* AMD multi-node processor *=
/
>   #define X86_FEATURE_APERFMPERF		( 3*32+28) /* P-State hardware coordi=
nation feedback capability (APERF/MPERF MSRs) */
> -/* free					( 3*32+29) */
> +#define X86_FEATURE_TERNARY		( 3*32+29) /* "" Synthetic bit for ALTERN=
ATIVE_TERNARY() */

In fact this should rather be named "X86_FEATURE_TRUE", as this is its
semantics.

And I think I can define it to the value 0xffff instead of using a
"real" bit for it.


Juergen

--------------A99D9741BE5A0D4DF4E23EDD
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

--------------A99D9741BE5A0D4DF4E23EDD--

--2HZuOF5yMr7z4N1W9je7pKeX4DttW2NH2--

--0uwsXwgjCC58khCi7aVmZVWQ3hQMuwUIh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAGxA4FAwAAAAAACgkQsN6d1ii/Ey/u
RAf9HxBCYh293K63rqFeErBKKWecXKPDZ19v+uspx8+kijFzuDHkuHEBz1ZDMccDGlzgqVyQVGEK
shiMgntfBbPr28QDR7UEEM1+HUISa9bXctMjepv8Xp61da8QWSTFDEjmb+oYM9XPsYNGWDJD6M5/
iEJDPwn91tdLPRmPqqAe7D0l/K9imPQbdftuZF6P4bgppgEu5IEetjzelmJa8lGHAaKql5NZ1uOF
zv8lGdGJ5XPLunXtFzJA+2LNNEJAIK5ULL4FnpMMDqU+ZL7DjeegaFXZ3W8ly/r8GFbRlkk5e0ov
bTXzkMIFEcIg4YPxPtOhkNEouQEWj4fin4MzKoPzBw==
=5QW4
-----END PGP SIGNATURE-----

--0uwsXwgjCC58khCi7aVmZVWQ3hQMuwUIh--

