Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648E22D971D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 12:11:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52139.91239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kollI-0008Ec-GK; Mon, 14 Dec 2020 11:11:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52139.91239; Mon, 14 Dec 2020 11:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kollI-0008ED-Cx; Mon, 14 Dec 2020 11:11:28 +0000
Received: by outflank-mailman (input) for mailman id 52139;
 Mon, 14 Dec 2020 11:11:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XC/h=FS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kollG-0008E8-DL
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 11:11:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab620cb7-f03d-42ab-9152-9c1195cf0725;
 Mon, 14 Dec 2020 11:11:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A023CAC10;
 Mon, 14 Dec 2020 11:11:24 +0000 (UTC)
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
X-Inumbo-ID: ab620cb7-f03d-42ab-9152-9c1195cf0725
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607944284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=emJZN2S2qXQhrmBMSpLQuldS8IQJcUyy+pQmjM0bZu0=;
	b=IACYz4Db6DT/EV5dDwRA0N7mLhoub7jhdkNj8d7WouS5Ko1H/6733h45EOR2JpK83E/ow2
	uia2bjaEJA9TfTVKeZVY789KBQb9v5R7oYl8fm0Bz7rjH+uYMKjWREsyVuWss0HGNloa0C
	mIuTXOKJgV4/KtvOFYOTIz/fCebSFZY=
Subject: Re: [PATCH v4 3/3] xen: add support for automatic debug key actions
 in case of crash
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-4-jgross@suse.com>
 <8dc62a3f-db2d-51b9-1264-28af3a13052d@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <08c72f15-c89b-5887-b828-a7cfdeb4834a@suse.com>
Date: Mon, 14 Dec 2020 12:11:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8dc62a3f-db2d-51b9-1264-28af3a13052d@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9U3WsiJymg4oJTBtMr0uOCQM3lKl1Fs1k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9U3WsiJymg4oJTBtMr0uOCQM3lKl1Fs1k
Content-Type: multipart/mixed; boundary="83vukAr0ktrel4PgkgiFLSgP8sMRwveNy";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <08c72f15-c89b-5887-b828-a7cfdeb4834a@suse.com>
Subject: Re: [PATCH v4 3/3] xen: add support for automatic debug key actions
 in case of crash
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-4-jgross@suse.com>
 <8dc62a3f-db2d-51b9-1264-28af3a13052d@xen.org>
In-Reply-To: <8dc62a3f-db2d-51b9-1264-28af3a13052d@xen.org>

--83vukAr0ktrel4PgkgiFLSgP8sMRwveNy
Content-Type: multipart/mixed;
 boundary="------------C3C4FBCB5B66B8C291814506"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C3C4FBCB5B66B8C291814506
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.12.20 11:24, Julien Grall wrote:
> Hi Juergen,
>=20
> On 14/12/2020 07:56, Juergen Gross wrote:
>> diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
>> index de120fa092..806355ed8b 100644
>> --- a/xen/common/keyhandler.c
>> +++ b/xen/common/keyhandler.c
>> @@ -3,7 +3,9 @@
>> =C2=A0=C2=A0 */
>> =C2=A0 #include <asm/regs.h>
>> +#include <xen/delay.h>
>> =C2=A0 #include <xen/keyhandler.h>
>> +#include <xen/param.h>
>> =C2=A0 #include <xen/shutdown.h>
>> =C2=A0 #include <xen/event.h>
>> =C2=A0 #include <xen/console.h>
>> @@ -519,6 +521,59 @@ void __init initialize_keytable(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> +#define CRASHACTION_SIZE=C2=A0 32
>> +static char crash_debug_panic[CRASHACTION_SIZE];
>> +string_runtime_param("crash-debug-panic", crash_debug_panic);
>> +static char crash_debug_hwdom[CRASHACTION_SIZE];
>> +string_runtime_param("crash-debug-hwdom", crash_debug_hwdom);
>> +static char crash_debug_watchdog[CRASHACTION_SIZE];
>> +string_runtime_param("crash-debug-watchdog", crash_debug_watchdog);
>> +#ifdef CONFIG_KEXEC
>> +static char crash_debug_kexeccmd[CRASHACTION_SIZE];
>> +string_runtime_param("crash-debug-kexeccmd", crash_debug_kexeccmd);
>> +#else
>> +#define crash_debug_kexeccmd NULL
>> +#endif
>> +static char crash_debug_debugkey[CRASHACTION_SIZE];
>> +string_runtime_param("crash-debug-debugkey", crash_debug_debugkey);
>> +
>> +void keyhandler_crash_action(enum crash_reason reason)
>> +{
>> +=C2=A0=C2=A0=C2=A0 static const char *const crash_action[] =3D {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CRASHREASON_PANIC] =3D cr=
ash_debug_panic,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CRASHREASON_HWDOM] =3D cr=
ash_debug_hwdom,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CRASHREASON_WATCHDOG] =3D=
 crash_debug_watchdog,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CRASHREASON_KEXECCMD] =3D=
 crash_debug_kexeccmd,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 [CRASHREASON_DEBUGKEY] =3D=
 crash_debug_debugkey,
>> +=C2=A0=C2=A0=C2=A0 };
>> +=C2=A0=C2=A0=C2=A0 static bool ignore;
>> +=C2=A0=C2=A0=C2=A0 const char *action;
>> +
>> +=C2=A0=C2=A0=C2=A0 /* Some handlers are not functional too early. */
>=20
> Can you explain in the commit message why this is necessary (An example=
=20
> would be useful)?

Okay.


Juergen

--------------C3C4FBCB5B66B8C291814506
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

--------------C3C4FBCB5B66B8C291814506--

--83vukAr0ktrel4PgkgiFLSgP8sMRwveNy--

--9U3WsiJymg4oJTBtMr0uOCQM3lKl1Fs1k
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/XSFsFAwAAAAAACgkQsN6d1ii/Ey+2
Cgf5AZZ6mmzodkEf0x9u02teHJYOe+U9e4jZ7BbR99T8F9O3HNPDDATzflxznFEa3OjzvJOh1hXN
tgiLLOnTJsRnJ87Mjuj/qAnWNDQ7Gaxd235ToFslR00jjbe12u29mOoZ7Xem1atZ7oYLjdFuxqmk
oDG2Un+oIe0v22zjQU/edMWEkCv0BfBaVrin4bLjedxZQXfyMowmWvPxo/uEOlqvXVkqmIrv+xpc
+O12R4oJzaZLqt5+IwXkeLsbWm8NIda6OJM7V7kAwxieZftj7EFm4GA1fzU+YqSC1OU8ou6P0Nd+
Sdtgx996QUqmgfD4sd2w/dT3+2+zxI7mC7Owd9BdQQ==
=BbKb
-----END PGP SIGNATURE-----

--9U3WsiJymg4oJTBtMr0uOCQM3lKl1Fs1k--

