Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3812D3C39
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 08:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47997.84910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmtwA-0005sj-Ko; Wed, 09 Dec 2020 07:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47997.84910; Wed, 09 Dec 2020 07:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmtwA-0005sN-Hi; Wed, 09 Dec 2020 07:30:58 +0000
Received: by outflank-mailman (input) for mailman id 47997;
 Wed, 09 Dec 2020 07:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kmtw9-0005sI-Eo
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 07:30:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e10f250-94b3-4d36-889d-e4c6fbbfe0c5;
 Wed, 09 Dec 2020 07:30:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0AEC7AC94;
 Wed,  9 Dec 2020 07:30:55 +0000 (UTC)
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
X-Inumbo-ID: 9e10f250-94b3-4d36-889d-e4c6fbbfe0c5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607499055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BGmU10Ccy1IYdgF9pruKnoo3bFbtLiADIpY7MKZDn4U=;
	b=UKdm82/P/I+41Vt6FKZLzvwNykB+hEKMXh5aZqq5yudUO+YmFjqCJcqVYF44a4rAvq3UCP
	Nag65QqHWulJX4CxotdQUmoQyezXHBWv/Fjus9v2QMcGfwtv4N7AEVFu4cVgYdV4vHhUdJ
	9KxYQa032LCgEZb+AR4NAFnwymzIgxs=
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-8-jgross@suse.com> <20201208184315.GE27920@zn.tnic>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 07/12] x86: add new features for paravirt patching
Message-ID: <2510752e-5d3d-f71c-8a4c-a5d2aae0075e@suse.com>
Date: Wed, 9 Dec 2020 08:30:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208184315.GE27920@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vGZzNM2H5synFpsP7FReEyUMxt3ir0vhv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vGZzNM2H5synFpsP7FReEyUMxt3ir0vhv
Content-Type: multipart/mixed; boundary="zEkN86S7Ztx9Wlh91q0PqkQHgAmyleFIX";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, peterz@infradead.org, luto@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <2510752e-5d3d-f71c-8a4c-a5d2aae0075e@suse.com>
Subject: Re: [PATCH v2 07/12] x86: add new features for paravirt patching
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-8-jgross@suse.com> <20201208184315.GE27920@zn.tnic>
In-Reply-To: <20201208184315.GE27920@zn.tnic>

--zEkN86S7Ztx9Wlh91q0PqkQHgAmyleFIX
Content-Type: multipart/mixed;
 boundary="------------674AAB7D9F3E491CB4034860"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------674AAB7D9F3E491CB4034860
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.12.20 19:43, Borislav Petkov wrote:
> On Fri, Nov 20, 2020 at 12:46:25PM +0100, Juergen Gross wrote:
>> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm=
/cpufeatures.h
>> index dad350d42ecf..ffa23c655412 100644
>> --- a/arch/x86/include/asm/cpufeatures.h
>> +++ b/arch/x86/include/asm/cpufeatures.h
>> @@ -237,6 +237,9 @@
>>   #define X86_FEATURE_VMCALL		( 8*32+18) /* "" Hypervisor supports the=
 VMCALL instruction */
>>   #define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* "" VMware prefers VMM=
CALL hypercall instruction */
>>   #define X86_FEATURE_SEV_ES		( 8*32+20) /* AMD Secure Encrypted Virtu=
alization - Encrypted State */
>> +#define X86_FEATURE_NOT_XENPV		( 8*32+21) /* "" Inverse of X86_FEATUR=
E_XENPV */
>> +#define X86_FEATURE_NO_PVUNLOCK		( 8*32+22) /* "" No PV unlock functi=
on */
>> +#define X86_FEATURE_NO_VCPUPREEMPT	( 8*32+23) /* "" No PV vcpu_is_pre=
empted function */
>=20
> Ew, negative features. ;-\

Hey, I already suggested to use ~FEATURE for that purpose (see
https://lore.kernel.org/lkml/f105a63d-6b51-3afb-83e0-e899ea40813e@suse.co=
m/=20
).

>=20
> /me goes forward and looks at usage sites:
>=20
> +	ALTERNATIVE_2 "jmp *paravirt_iret(%rip);",			\
> +		      "jmp native_iret;", X86_FEATURE_NOT_XENPV,	\
> +		      "jmp xen_iret;", X86_FEATURE_XENPV
>=20
> Can we make that:
>=20
> 	ALTERNATIVE_TERNARY "jmp *paravirt_iret(%rip);",
> 		      "jmp xen_iret;", X86_FEATURE_XENPV,
> 		      "jmp native_iret;", X86_FEATURE_XENPV,

Would we really want to specify the feature twice?

I'd rather make the syntax:

ALTERNATIVE_TERNARY <initial-code> <feature> <code-for-feature-set>
                                              <code-for-feature-unset>

as this ...

>=20
> where the last two lines are supposed to mean
>=20
> 			    X86_FEATURE_XENPV ? "jmp xen_iret;" : "jmp native_iret;"

=2E.. would match perfectly to this interpretation.

>=20
> Now, in order to convey that logic to apply_alternatives(), you can do:=

>=20
> struct alt_instr {
>          s32 instr_offset;       /* original instruction */
>          s32 repl_offset;        /* offset to replacement instruction *=
/
>          u16 cpuid;              /* cpuid bit set for replacement */
>          u8  instrlen;           /* length of original instruction */
>          u8  replacementlen;     /* length of new instruction */
>          u8  padlen;             /* length of build-time padding */
> 	u8  flags;		/* patching flags */ 			<--- THIS
> } __packed;

Hmm, using flags is an alternative (pun intended :-) ).

>=20
> and yes, we have had the flags thing in a lot of WIP diffs over the
> years but we've never come to actually needing it.
>=20
> Anyway, then, apply_alternatives() will do:
>=20
> 	if (flags & ALT_NOT_FEATURE)
>=20
> or something like that - I'm bad at naming stuff - then it should patch=

> only when the feature is NOT set and vice versa.
>=20
> There in that
>=20
> 	if (!boot_cpu_has(a->cpuid)) {
>=20
> branch.
>=20
> Hmm?

Fine with me (I'd prefer my ALTERNATIVE_TERNARY syntax, though).

>=20
>>   /* Intel-defined CPU features, CPUID level 0x00000007:0 (EBX), word =
9 */
>>   #define X86_FEATURE_FSGSBASE		( 9*32+ 0) /* RDFSBASE, WRFSBASE, RDGS=
BASE, WRGSBASE instructions*/
>> diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternati=
ve.c
>> index 2400ad62f330..f8f9700719cf 100644
>> --- a/arch/x86/kernel/alternative.c
>> +++ b/arch/x86/kernel/alternative.c
>> @@ -593,6 +593,18 @@ int alternatives_text_reserved(void *start, void =
*end)
>>   #endif /* CONFIG_SMP */
>>  =20
>>   #ifdef CONFIG_PARAVIRT
>> +static void __init paravirt_set_cap(void)
>> +{
>> +	if (!boot_cpu_has(X86_FEATURE_XENPV))
>> +		setup_force_cpu_cap(X86_FEATURE_NOT_XENPV);
>> +
>> +	if (pv_is_native_spin_unlock())
>> +		setup_force_cpu_cap(X86_FEATURE_NO_PVUNLOCK);
>> +
>> +	if (pv_is_native_vcpu_is_preempted())
>> +		setup_force_cpu_cap(X86_FEATURE_NO_VCPUPREEMPT);
>> +}
>> +
>>   void __init_or_module apply_paravirt(struct paravirt_patch_site *sta=
rt,
>>   				     struct paravirt_patch_site *end)
>>   {
>> @@ -616,6 +628,8 @@ void __init_or_module apply_paravirt(struct paravi=
rt_patch_site *start,
>>   }
>>   extern struct paravirt_patch_site __start_parainstructions[],
>>   	__stop_parainstructions[];
>> +#else
>> +static void __init paravirt_set_cap(void) { }
>>   #endif	/* CONFIG_PARAVIRT */
>>  =20
>>   /*
>> @@ -723,6 +737,18 @@ void __init alternative_instructions(void)
>>   	 * patching.
>>   	 */
>>  =20
>> +	paravirt_set_cap();
>=20
> Can that be called from somewhere in the Xen init path and not from
> here? Somewhere before check_bugs() gets called.

No, this is needed for non-Xen cases, too (especially pv spinlocks).

>=20
>> +	/*
>> +	 * First patch paravirt functions, such that we overwrite the indire=
ct
>> +	 * call with the direct call.
>> +	 */
>> +	apply_paravirt(__parainstructions, __parainstructions_end);
>> +
>> +	/*
>> +	 * Then patch alternatives, such that those paravirt calls that are =
in
>> +	 * alternatives can be overwritten by their immediate fragments.
>> +	 */
>>   	apply_alternatives(__alt_instructions, __alt_instructions_end);
>=20
> Can you give an example here pls why the paravirt patching needs to run=

> first?

Okay.


Juergen

--------------674AAB7D9F3E491CB4034860
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

--------------674AAB7D9F3E491CB4034860--

--zEkN86S7Ztx9Wlh91q0PqkQHgAmyleFIX--

--vGZzNM2H5synFpsP7FReEyUMxt3ir0vhv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/QfS4FAwAAAAAACgkQsN6d1ii/Ey8/
lAf/QNrDeVJIsiWDsuQ/oBFqwXuVFoFGJMXJCcMNwDkIpmyXdAz1wdSj5MoOiiTg2mPr40nja7r8
YApOj1Rcbnd42IcJiFn4UjTvjqH8JKkF4CMSiNjQrgJ5y9R5iP8CpHuIcpxSUYkxI76U4f1zbiJk
p2r5fKNt4xTU+LhE3kjnc7dLA/5MLJsz/k6EBUNnpBnC4vv1Ah/aHOvlgJmGZih1O4Tke5Nmjg8R
XPhNz2iQsu6WIoEaAoXPPSE5X8HEvEm4/nHI+Jq8nxFS05Z+D6C6Uq4ymx3d8ZAiOKYz8pNhl76I
/CVt+O2olDWrRt37HVzjl2kF0SrtQ9EaWn6OtAsfPg==
=QPJL
-----END PGP SIGNATURE-----

--vGZzNM2H5synFpsP7FReEyUMxt3ir0vhv--

