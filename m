Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F9D2CC009
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 15:48:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42793.77016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTQf-0003nw-Q4; Wed, 02 Dec 2020 14:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42793.77016; Wed, 02 Dec 2020 14:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTQf-0003nX-Mg; Wed, 02 Dec 2020 14:48:25 +0000
Received: by outflank-mailman (input) for mailman id 42793;
 Wed, 02 Dec 2020 14:48:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvYF=FG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkTQe-0003nR-H8
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 14:48:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1005b7ee-db6f-432d-8765-000ecfa3ef95;
 Wed, 02 Dec 2020 14:48:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B1CCACC3;
 Wed,  2 Dec 2020 14:48:22 +0000 (UTC)
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
X-Inumbo-ID: 1005b7ee-db6f-432d-8765-000ecfa3ef95
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606920502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3lIaTsxjFMYIQNxaeePaL9KbT8jUcnLCx8Gz61GRcM0=;
	b=XOAmE0X3npWKI/lGX5ZljwuqsxujpMp1fMK3dbXVafCTHYiZ2VJ/DLYR1nM+U9EG/I6l49
	ehM7jGwsJ87A3LNKHTX7omn9BagHn4Y7FxixMA7iZCSEuvmw6LVRG/sQVlE0asBQxR8OD9
	DXnRFMWgZMKiNwxugfX0pYJWvdhzSbU=
Subject: Re: [PATCH v2 04/12] x86/xen: drop USERGS_SYSRET64 paravirt call
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 peterz@infradead.org, luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Deep Shah <sdeep@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-5-jgross@suse.com> <20201202123235.GD2951@zn.tnic>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6be0d1a5-0079-5d90-0c38-85fe4471f1b8@suse.com>
Date: Wed, 2 Dec 2020 15:48:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202123235.GD2951@zn.tnic>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jJ9PpTcxy9lmYsonXHC7Yx0WUyHQN3ZlP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jJ9PpTcxy9lmYsonXHC7Yx0WUyHQN3ZlP
Content-Type: multipart/mixed; boundary="cx6HqDKbye5TwFIy5c3ypsnchRBmnlgeh";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Borislav Petkov <bp@alien8.de>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 peterz@infradead.org, luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Deep Shah <sdeep@vmware.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <6be0d1a5-0079-5d90-0c38-85fe4471f1b8@suse.com>
Subject: Re: [PATCH v2 04/12] x86/xen: drop USERGS_SYSRET64 paravirt call
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-5-jgross@suse.com> <20201202123235.GD2951@zn.tnic>
In-Reply-To: <20201202123235.GD2951@zn.tnic>

--cx6HqDKbye5TwFIy5c3ypsnchRBmnlgeh
Content-Type: multipart/mixed;
 boundary="------------50989C0C7D65F3525DF0B3D1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------50989C0C7D65F3525DF0B3D1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.12.20 13:32, Borislav Petkov wrote:
> On Fri, Nov 20, 2020 at 12:46:22PM +0100, Juergen Gross wrote:
>> @@ -123,12 +115,15 @@ SYM_INNER_LABEL(entry_SYSCALL_64_after_hwframe, =
SYM_L_GLOBAL)
>>   	 * Try to use SYSRET instead of IRET if we're returning to
>>   	 * a completely clean 64-bit userspace context.  If we're not,
>>   	 * go to the slow exit path.
>> +	 * In the Xen PV case we must use iret anyway.
>>   	 */
>> -	movq	RCX(%rsp), %rcx
>> -	movq	RIP(%rsp), %r11
>>  =20
>> -	cmpq	%rcx, %r11	/* SYSRET requires RCX =3D=3D RIP */
>> -	jne	swapgs_restore_regs_and_return_to_usermode
>> +	ALTERNATIVE __stringify( \
>> +		movq	RCX(%rsp), %rcx; \
>> +		movq	RIP(%rsp), %r11; \
>> +		cmpq	%rcx, %r11;	/* SYSRET requires RCX =3D=3D RIP */ \
>> +		jne	swapgs_restore_regs_and_return_to_usermode), \
>> +	"jmp	swapgs_restore_regs_and_return_to_usermode", X86_FEATURE_XENPV
>=20
> Why such a big ALTERNATIVE when you can simply do:
>=20
>          /*
>           * Try to use SYSRET instead of IRET if we're returning to
>           * a completely clean 64-bit userspace context.  If we're not,=

>           * go to the slow exit path.
>           * In the Xen PV case we must use iret anyway.
>           */
>          ALTERNATIVE "", "jmp swapgs_restore_regs_and_return_to_usermod=
e", X86_FEATURE_XENPV
>=20
>          movq    RCX(%rsp), %rcx;
>          movq    RIP(%rsp), %r11;
>          cmpq    %rcx, %r11;     /* SYSRET requires RCX =3D=3D RIP */ \=

>          jne     swapgs_restore_regs_and_return_to_usermode
>=20
> ?
>=20

I wanted to avoid the additional NOPs for the bare metal case.

If you don't mind them I can do as you are suggesting.


Juergen

--------------50989C0C7D65F3525DF0B3D1
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

--------------50989C0C7D65F3525DF0B3D1--

--cx6HqDKbye5TwFIy5c3ypsnchRBmnlgeh--

--jJ9PpTcxy9lmYsonXHC7Yx0WUyHQN3ZlP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/HqTUFAwAAAAAACgkQsN6d1ii/Ey+4
gQf9EFMoWpLKjzw2BVbyD0hiQapRVGseNvB3GqQFjKeRF2cYKO3pdXTP/8/gguKxLu2hewzYnjiK
7bUt7DNePDKIodhyA2PpUNexvDcOkPWFU2gvJLPAeIfFIknZnDCwQRsSlPX0qysGcH+ukEwwNthY
u98BK1NtYIgkdzADu7TB94cXYCIRKhFYZZ81I3TY11Lj7KpTgv1RYb8+JEW8M7m02x9k2FGi9QcU
1ZLJFfVF9djamKm+jymofOLtyE83uoAJcQqjxpMrLH/GhavwLB4x0hiVCDDB3+xoGK6GRPLeVayL
2CjIsvIXdDbHXTAHQ/Cy80yJzLbeK95XQp91LaS4Yw==
=Lxwk
-----END PGP SIGNATURE-----

--jJ9PpTcxy9lmYsonXHC7Yx0WUyHQN3ZlP--

