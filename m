Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FD2D94E2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 10:20:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52011.90995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok1P-0003gZ-5F; Mon, 14 Dec 2020 09:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52011.90995; Mon, 14 Dec 2020 09:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok1P-0003gA-1R; Mon, 14 Dec 2020 09:19:59 +0000
Received: by outflank-mailman (input) for mailman id 52011;
 Mon, 14 Dec 2020 09:19:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XC/h=FS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kok1N-0003g5-L1
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:19:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 883f80e2-fb5a-45db-b464-bb6f6fec97ee;
 Mon, 14 Dec 2020 09:19:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9FA7AC10;
 Mon, 14 Dec 2020 09:19:55 +0000 (UTC)
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
X-Inumbo-ID: 883f80e2-fb5a-45db-b464-bb6f6fec97ee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607937595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zAWigpfJMXrhYnFqL7KXlLIgod5mhUz+XtyC+Hf5HJw=;
	b=ibYgMUFpBOA71Ll9iOVZp0+vLTzm4EFPn+aFsjERMT4E2c6zlSRsSO1aam706yjMwVTCsG
	KZerycvaMS71uwEdH8yF16h1V06Ji9EtJdD1+8WEmBYUzqNGqN4qp7vKNIGjr1mR+88NrX
	9O2FsY4U33jFQFAR/xeDJdYxXuqSPXU=
Subject: Re: [PATCH v4 3/3] xen: add support for automatic debug key actions
 in case of crash
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-4-jgross@suse.com>
 <d1b33e7f-2dd8-9d44-62c9-86ec46d919fe@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <858755cd-ea76-c537-00ba-8670465871be@suse.com>
Date: Mon, 14 Dec 2020 10:19:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d1b33e7f-2dd8-9d44-62c9-86ec46d919fe@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="es9mkHtinfBtJHjT5515SHq3r67F6URJ0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--es9mkHtinfBtJHjT5515SHq3r67F6URJ0
Content-Type: multipart/mixed; boundary="xyp1LgC1FKjWYb7HihTA5FkQ0HiAxhxzY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <858755cd-ea76-c537-00ba-8670465871be@suse.com>
Subject: Re: [PATCH v4 3/3] xen: add support for automatic debug key actions
 in case of crash
References: <20201214075615.25038-1-jgross@suse.com>
 <20201214075615.25038-4-jgross@suse.com>
 <d1b33e7f-2dd8-9d44-62c9-86ec46d919fe@suse.com>
In-Reply-To: <d1b33e7f-2dd8-9d44-62c9-86ec46d919fe@suse.com>

--xyp1LgC1FKjWYb7HihTA5FkQ0HiAxhxzY
Content-Type: multipart/mixed;
 boundary="------------1F1D5D90A7A4BF8D9F983D81"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1F1D5D90A7A4BF8D9F983D81
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.12.20 10:16, Jan Beulich wrote:
> On 14.12.2020 08:56, Juergen Gross wrote:
>> @@ -519,6 +521,59 @@ void __init initialize_keytable(void)
>>       }
>>   }
>>  =20
>> +#define CRASHACTION_SIZE  32
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
>> +    static const char *const crash_action[] =3D {
>> +        [CRASHREASON_PANIC] =3D crash_debug_panic,
>> +        [CRASHREASON_HWDOM] =3D crash_debug_hwdom,
>> +        [CRASHREASON_WATCHDOG] =3D crash_debug_watchdog,
>> +        [CRASHREASON_KEXECCMD] =3D crash_debug_kexeccmd,
>> +        [CRASHREASON_DEBUGKEY] =3D crash_debug_debugkey,
>> +    };
>> +    static bool ignore;
>> +    const char *action;
>> +
>> +    /* Some handlers are not functional too early. */
>> +    if ( system_state < SYS_STATE_smp_boot )
>> +        return;
>> +
>> +    /* Avoid recursion. */
>> +    if ( ignore )
>> +        return;
>> +    ignore =3D true;
>> +
>> +    if ( (unsigned int)reason >=3D ARRAY_SIZE(crash_action) )
>> +        return;
>> +    action =3D crash_action[reason];
>> +    if ( !action )
>> +        return;
>=20
> If we consider either of the last two "return"s to possibly be
> taken, I think the "ignore" logic wants to live below them, not
> above, avoiding no output at all when a recursive invocation
> turns out to be a "good" one. Then, as before,
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Fine with me.


Juergen


--------------1F1D5D90A7A4BF8D9F983D81
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

--------------1F1D5D90A7A4BF8D9F983D81--

--xyp1LgC1FKjWYb7HihTA5FkQ0HiAxhxzY--

--es9mkHtinfBtJHjT5515SHq3r67F6URJ0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/XLjoFAwAAAAAACgkQsN6d1ii/Ey/c
5wf/cWKLNaGKZUioY+HjtU9k0sUXbRsKUBSxeEv0glPrRtnd28FEhiZMErngoGB/6QCs07PeM9Wk
RNjYSKfTTI4bjSalehydpVYmBoe+/z1780OQVDZMwHSuARuF2Z1akV7drLwmfTxhmlUYNAMODm33
YtzJqumb5NihIdqDJLEARLlss8uIRqiiFbUL06D3vLEt/kfOVZzeJq4LtTRoNNPcTMnht96EzIuJ
yK7EAQJT1pcdylG619z361G4yNnP7JyH/OZ2AThS2ekwZSAfwBpL5sQpShZajAzbcr67hOCQpkHO
9q3g8BVUZe5/PZzv/hst3IW3lHwfUhDuILA3KOfuUA==
=LSUw
-----END PGP SIGNATURE-----

--es9mkHtinfBtJHjT5515SHq3r67F6URJ0--

