Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0961331F19
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 07:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95231.179701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJVkR-0002ze-Rl; Tue, 09 Mar 2021 06:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95231.179701; Tue, 09 Mar 2021 06:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJVkR-0002zF-OC; Tue, 09 Mar 2021 06:21:39 +0000
Received: by outflank-mailman (input) for mailman id 95231;
 Tue, 09 Mar 2021 06:21:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jEQk=IH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lJVkP-0002zA-RC
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 06:21:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab51c8f8-39c3-46c9-83f3-3e36d523d880;
 Tue, 09 Mar 2021 06:21:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 02BCDAB8C;
 Tue,  9 Mar 2021 06:21:36 +0000 (UTC)
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
X-Inumbo-ID: ab51c8f8-39c3-46c9-83f3-3e36d523d880
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615270896; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auED0x3wS8Wn3FtixUxpL260TFwTyGn7ZjAoR0lab8s=;
	b=sugliOqHN66fLztniMNHrM6t8IfqY+DtVomXxMlmWAFgzISRB/qAPt21bICd6LaM+SYDMC
	uBJe4j/rZFNmVWAVk7rUJatk9Q2WH4/0xcdziKE/DPYEFx7uK1b7qiM+BnQ6Sa/iGhifNp
	pRhpwN8G26dmaykK/TcT+1FJ6NW+vBk=
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Deep Shah <sdeep@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>
References: <20210308122844.30488-1-jgross@suse.com>
 <20210308122844.30488-12-jgross@suse.com> <20210308183058.GC12548@zn.tnic>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v5 11/12] x86/paravirt: switch functions with custom code
 to ALTERNATIVE
Message-ID: <09410a65-a5dc-db76-d867-f6b0b968323f@suse.com>
Date: Tue, 9 Mar 2021 07:21:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210308183058.GC12548@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qEpMh3Ecfq1JyILFFGFyPlagg1mFokzxT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qEpMh3Ecfq1JyILFFGFyPlagg1mFokzxT
Content-Type: multipart/mixed; boundary="4WZ1ErrJpnSn17WaCS7ULv4vKLVypghm7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Deep Shah <sdeep@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>
Message-ID: <09410a65-a5dc-db76-d867-f6b0b968323f@suse.com>
Subject: Re: [PATCH v5 11/12] x86/paravirt: switch functions with custom code
 to ALTERNATIVE
References: <20210308122844.30488-1-jgross@suse.com>
 <20210308122844.30488-12-jgross@suse.com> <20210308183058.GC12548@zn.tnic>
In-Reply-To: <20210308183058.GC12548@zn.tnic>

--4WZ1ErrJpnSn17WaCS7ULv4vKLVypghm7
Content-Type: multipart/mixed;
 boundary="------------518D9DF2B6D10E464777E18C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------518D9DF2B6D10E464777E18C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.03.21 19:30, Borislav Petkov wrote:
> On Mon, Mar 08, 2021 at 01:28:43PM +0100, Juergen Gross wrote:
>> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/pa=
ravirt.h
>> index 36cd71fa097f..04b3067f31b5 100644
>> --- a/arch/x86/include/asm/paravirt.h
>> +++ b/arch/x86/include/asm/paravirt.h
>> @@ -137,7 +137,8 @@ static inline void write_cr0(unsigned long x)
>>  =20
>>   static inline unsigned long read_cr2(void)
>>   {
>> -	return PVOP_CALLEE0(unsigned long, mmu.read_cr2);
>> +	return PVOP_ALT_CALLEE0(unsigned long, mmu.read_cr2,
>> +				"mov %%cr2, %%rax;", ~X86_FEATURE_XENPV);
>=20
> Just some cursory poking first - indepth review later.
>=20
> Do I see this correctly that the negated feature can be expressed with,=
 to use
> this example here:
>=20
> 	ALTERNATIVE_TERNARY(mmu.read_cr2, X86_FEATURE_XENPV, "", "mov %%cr2, %=
%rax;");
>=20
> ?

No.

This would leave the Xen-pv case with a nop, while we need it to call
mmu.read_cr2().

In the Xen-pv case there must be _no_ alternative patching in order to
have the paravirt patching do its patching (indirect->direct call).

This is exactly the reason why I need to "not feature".

The only other solution I can think of would be a "split static_call"
handling using ALTERNATIVE_TERNARY():

ALTERNATIVE_TERNARY(initial_static_call(mmu.read_cr2),
                     X86_FEATURE_XENPV,
                     final_static_call(mmu.read_cr2),
                     "mov %%cr2, %%rax;");

with initial_static_call() doing an indirect call, while
final_static_call() would do a direct call.

Not sure we really want that.


Juergen

--------------518D9DF2B6D10E464777E18C
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

--------------518D9DF2B6D10E464777E18C--

--4WZ1ErrJpnSn17WaCS7ULv4vKLVypghm7--

--qEpMh3Ecfq1JyILFFGFyPlagg1mFokzxT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBHE+8FAwAAAAAACgkQsN6d1ii/Ey/i
owf+NuM+ZrdiHB4RC1K2m8LT7LKECO0k44bwvIFALNAieBdxJhsPJ4oUIVwCp5FNj9dY8H8tk5GG
3CXFwQV8iLiKeIQduvcf29ZXOJeD0xx29A/9DIHY2MSTdSWTDvIDN4+WtQmOvkSClYirkMZV4A5i
oWppxkVOC+B8ylDaqlXw8tOyAcWoNnPfDJLaEuF9ZqPm4j9EgNkJjnQ7FsBMAu60CynYtrVNGszk
aSpvbPgjLXQse38X+UvDI5oqUnsAWfrYQITmtW2RHM+v4CPGJZcRM/+xvH2/NXvHvbDOMVBF675H
T8YelM8a0PPKgS08dEKpDRXDqkXTIgDRCsraPlQTgQ==
=klAc
-----END PGP SIGNATURE-----

--qEpMh3Ecfq1JyILFFGFyPlagg1mFokzxT--

