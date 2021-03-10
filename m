Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C68133408F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 15:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96156.181679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK02K-0003ZW-B4; Wed, 10 Mar 2021 14:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96156.181679; Wed, 10 Mar 2021 14:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK02K-0003Z7-7P; Wed, 10 Mar 2021 14:42:08 +0000
Received: by outflank-mailman (input) for mailman id 96156;
 Wed, 10 Mar 2021 14:42:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YKvx=II=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lK02I-0003Yz-BA
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 14:42:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f9eb122-2aa9-4f04-b1f7-49811c1d7b4a;
 Wed, 10 Mar 2021 14:42:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83989AE78;
 Wed, 10 Mar 2021 14:42:04 +0000 (UTC)
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
X-Inumbo-ID: 8f9eb122-2aa9-4f04-b1f7-49811c1d7b4a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615387324; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+/0syBVLNk8kdInbBQltckRnqMuyIZPKIEM/Rs/ny3Y=;
	b=l9N0AUkqrrHFm/Jp2ESxBj2Y1aKWtXMc+9gTZ8Y4eObL6pCL0JhzS9VWNqD5KgmRemvX/L
	sqR8uK+2F+v/8JJjxjkKkU+S3cvFrCF7gkk3NJYvw+gN2T7sWttXdXdp2XyjiZB1/bxxg3
	7hYEgI7txiHx6Rs0W07H21ysOoHiev0=
Subject: Re: [PATCH v6 05/12] x86/alternative: support ALTERNATIVE_TERNARY
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>
References: <20210309134813.23912-1-jgross@suse.com>
 <20210309134813.23912-6-jgross@suse.com> <20210310142754.GH23521@zn.tnic>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <544d2242-9a1d-b7cb-dd8f-e40c9277a3de@suse.com>
Date: Wed, 10 Mar 2021 15:42:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310142754.GH23521@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yUa0AJIhNLS0Uyf0hnyo1orD0saQSud6E"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yUa0AJIhNLS0Uyf0hnyo1orD0saQSud6E
Content-Type: multipart/mixed; boundary="kJ8l9mKS7p0DVZOe2szQ2JoMiNQgWluHZ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Peter Zijlstra <peterz@infradead.org>
Message-ID: <544d2242-9a1d-b7cb-dd8f-e40c9277a3de@suse.com>
Subject: Re: [PATCH v6 05/12] x86/alternative: support ALTERNATIVE_TERNARY
References: <20210309134813.23912-1-jgross@suse.com>
 <20210309134813.23912-6-jgross@suse.com> <20210310142754.GH23521@zn.tnic>
In-Reply-To: <20210310142754.GH23521@zn.tnic>

--kJ8l9mKS7p0DVZOe2szQ2JoMiNQgWluHZ
Content-Type: multipart/mixed;
 boundary="------------B77F5407A0AB926917EEBC34"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B77F5407A0AB926917EEBC34
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.03.21 15:27, Borislav Petkov wrote:
> On Tue, Mar 09, 2021 at 02:48:06PM +0100, Juergen Gross wrote:
>> diff --git a/arch/x86/include/asm/alternative.h b/arch/x86/include/asm=
/alternative.h
>> index 89889618ae01..4fb844e29d26 100644
>> --- a/arch/x86/include/asm/alternative.h
>> +++ b/arch/x86/include/asm/alternative.h
>> @@ -178,6 +178,9 @@ static inline int alternatives_text_reserved(void =
*start, void *end)
>>   	ALTINSTR_REPLACEMENT(newinstr2, 2)				\
>>   	".popsection\n"
>>  =20
>> +#define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr1, newinstr2)	=
\
>> +	ALTERNATIVE_2(oldinstr, newinstr2, X86_FEATURE_ALWAYS, newinstr1, fe=
ature)
>=20
> Make that:
>=20
> /*
>   * If @feature is set, patch @newinstr_yes, else @newinstr_no
>   */
> #define ALTERNATIVE_TERNARY(oldinstr, feature, newinstr_yes, newinstr_n=
o) \
>          ALTERNATIVE_2(oldinstr, newinstr_no, X86_FEATURE_ALWAYS, newin=
str_yes, feature)
>=20
> and in alternative-asm.h too pls.

Okay.

>=20
> Regardless, this looks nice! :)

Thanks,


Juergen

--------------B77F5407A0AB926917EEBC34
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

--------------B77F5407A0AB926917EEBC34--

--kJ8l9mKS7p0DVZOe2szQ2JoMiNQgWluHZ--

--yUa0AJIhNLS0Uyf0hnyo1orD0saQSud6E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBI2rsFAwAAAAAACgkQsN6d1ii/Ey/H
8Af+Mp6GwCI/zjkP3UBP3qphr21aQq25jWKZb9guCkcsrn2XmX5MCZQw9K1ZCMohoLa5VVbDuNA+
6DoaPJOl5RIAewSCKcNIseCY8+ulrddEsk8oJs9WfMQfPSHWQOs7F5MvyFVz9YAhTGOIMZVYfPj5
Vw4eNcyeZZ/SlUPcsUQ4wIfoSh4s8H3Nhi5NHdri/vs3MEOtxwCgGXRYgG1VTRQRfHIk3k/DcOBc
e0AzBBzMPSyFQh36RIse5cc0cuFT/0tVQ5nvIBbr89YO259csXG7Bx+S8e7KUYL9F3DbFbVPbKRs
4o2+vNL1+u5BVlR+jcDygOpspt2ataDtxVIurSiFWQ==
=+cHb
-----END PGP SIGNATURE-----

--yUa0AJIhNLS0Uyf0hnyo1orD0saQSud6E--

