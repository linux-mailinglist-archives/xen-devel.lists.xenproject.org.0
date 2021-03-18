Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D4C340079
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 08:55:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98834.187725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMnU6-0001tO-54; Thu, 18 Mar 2021 07:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98834.187725; Thu, 18 Mar 2021 07:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMnU6-0001sz-1m; Thu, 18 Mar 2021 07:54:22 +0000
Received: by outflank-mailman (input) for mailman id 98834;
 Thu, 18 Mar 2021 07:54:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ztDP=IQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lMnU4-0001su-5p
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 07:54:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca0553d6-f24f-4936-9f84-e1fa217f704e;
 Thu, 18 Mar 2021 07:54:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 12D71AC17;
 Thu, 18 Mar 2021 07:54:18 +0000 (UTC)
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
X-Inumbo-ID: ca0553d6-f24f-4936-9f84-e1fa217f704e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616054058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KqVTQOSlwTnfGVatGEsqZH6VD+3sffoqhHtQT353LWI=;
	b=iji9pk69Hcds/yscgjDIX7sMc55IS7SzAMrua3FS9Q2RC2JaGJuZXQOJuc2dAUPZlfjBjt
	XlEhqOvMikPGltEzTD0qjb0DO0iHLMgdEPXmVnF65XSlT/KECBuwGKl0zS+TNow8TnHaXB
	EOlzINDi7EVX+YJxvEz7CavBa/XVUMc=
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jgrall@amazon.com" <jgrall@amazon.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
Message-ID: <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
Date: Thu, 18 Mar 2021 08:54:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TKNWxujNkbkYNCaB91laL1dpKBarJ4Dgu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TKNWxujNkbkYNCaB91laL1dpKBarJ4Dgu
Content-Type: multipart/mixed; boundary="OqlQoihluSx1iltbYMXdla8xQvGq1xXXE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "jgrall@amazon.com" <jgrall@amazon.com>
Message-ID: <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>

--OqlQoihluSx1iltbYMXdla8xQvGq1xXXE
Content-Type: multipart/mixed;
 boundary="------------E9E146BC0F21D1B1EA776613"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E9E146BC0F21D1B1EA776613
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.03.21 15:32, Luca Fancellu wrote:
>=20
> Hi all,
>=20
> we've been encountering an issue when using the kernel 5.10 with=20
> preempt_rt support for Dom0, the problem is that during the boot of=20
> Dom0, it hits a BUG_ON(!irqs_disabled()) from the=20
> function=C2=A0evtchn_fifo_unmask defined in events_fifo.c.
>=20
> This is the call stack:
>=20
> [ =C2=A0 17.817018] ------------[ cut here ]------------
> [ =C2=A0 17.817021] kernel BUG at drivers/xen/events/events_fifo.c:258!=

> [ =C2=A0 18.817079] Internal error: Oops - BUG: 0 [#1] PREEMPT_RT SMP
> [ =C2=A0 18.817081] Modules linked in: bridge stp llc ipv6
> [ =C2=A0 18.817086] CPU: 3 PID: 558 Comm: xenstored Not tainted=20
> 5.10.16-rt25-yocto-preempt-rt #1
> [ =C2=A0 18.817089] Hardware name: Arm Neoverse N1 System Development=20
> Platform (DT)
> [ =C2=A0 18.817090] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=3D=
--)
> [ =C2=A0 18.817092] pc : evtchn_fifo_unmask+0xd4/0xe0
> [ =C2=A0 18.817099] lr : xen_irq_lateeoi_locked+0xec/0x200
> [ =C2=A0 18.817102] sp : ffff8000123f3cc0
> [ =C2=A0 18.817102] x29: ffff8000123f3cc0 x28: ffff0000427b1d80
> [ =C2=A0 18.817104] x27: 0000000000000000 x26: 0000000000000000
> [ =C2=A0 18.817106] x25: 0000000000000001 x24: 0000000000000001
> [ =C2=A0 18.817107] x23: ffff0000412fc900 x22: 0000000000000004
> [ =C2=A0 18.817109] x21: 0000000000000000 x20: ffff000042e06990
> [ =C2=A0 18.817110] x19: ffff0000427b1d80 x18: 0000000000000010
> [ =C2=A0 18.817112] x17: 0000000000000000 x16: 0000000000000000
> [ =C2=A0 18.817113] x15: 0000000000000002 x14: 0000000000000001
> [ =C2=A0 18.817114] x13: 000000000001a7e8 x12: 0000000000000040
> [ =C2=A0 18.817116] x11: ffff000040400248 x10: ffff00004040024a
> [ =C2=A0 18.817117] x9 : ffff800011be5200 x8 : ffff000040400270
> [ =C2=A0 18.817119] x7 : 0000000000000000 x6 : 0000000000000003
> [ =C2=A0 18.817120] x5 : 0000000000000000 x4 : ffff000040400308
> [ =C2=A0 18.817121] x3 : ffff0000408a400c x2 : 0000000000000000
> [ =C2=A0 18.817122] x1 : 0000000000000000 x0 : ffff0000408a4000
> [ =C2=A0 18.817124] Call trace:
> [ =C2=A0 18.817125] =C2=A0evtchn_fifo_unmask+0xd4/0xe0
> [ =C2=A0 18.817127] =C2=A0xen_irq_lateeoi_locked+0xec/0x200
> [ =C2=A0 18.817129] =C2=A0xen_irq_lateeoi+0x48/0x64
> [ =C2=A0 18.817131] =C2=A0evtchn_write+0x124/0x15c
> [ =C2=A0 18.817134] =C2=A0vfs_write+0xf0/0x2cc
> [ =C2=A0 18.817137] =C2=A0ksys_write+0xe0/0x100
> [ =C2=A0 18.817139] =C2=A0__arm64_sys_write+0x20/0x30
> [ =C2=A0 18.817142] =C2=A0el0_svc_common.constprop.0+0x78/0x1a0
> [ =C2=A0 18.817145] =C2=A0do_el0_svc+0x24/0x90
> [ =C2=A0 18.817147] =C2=A0el0_svc+0x14/0x20
> [ =C2=A0 18.817151] =C2=A0el0_sync_handler+0x1a4/0x1b0
> [ =C2=A0 18.817153] =C2=A0el0_sync+0x174/0x180
> [ =C2=A0 18.817156] Code: 52800120 b90023e6 97e6d104 17fffff0 (d4210000=
)
> [ =C2=A0 18.817158] ---[ end trace 0000000000000002 ]---
>=20
> Our last tested kernel was the 5.4 and our analysis pointed out that th=
e=20
> introduction of the lateeoi framework (xen/events: add a new "late EOI"=
=20
> evtchn framework) in conjunction with the preempt_rt patches (irqs kept=
=20
> enabled between spinlock_t/rwlock_t _irqsave///=E2=80=8B_irqrestore ope=
rations)=20
> is the root cause.
>=20
> Given that many modifications were made to the mask/unmask operations, =
a=20
> big one from=C2=A0Juergen Gross (xen/events: don't unmask an event chan=
nel=20
> when an eoi is pending), is the BUG_ON(...) still needed?
>=20
> With the mentioned commit every call to a mask/unmask operation is=20
> protected by a spinlock, so I would like to have some feedbacks from wh=
o=20
> has more experience than me on this part of the code.

I think this BUG_ON() can be removed.

Are you planning to send a patch?


Juergen

--------------E9E146BC0F21D1B1EA776613
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

--------------E9E146BC0F21D1B1EA776613--

--OqlQoihluSx1iltbYMXdla8xQvGq1xXXE--

--TKNWxujNkbkYNCaB91laL1dpKBarJ4Dgu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBTBygFAwAAAAAACgkQsN6d1ii/Ey+i
aQgAmE15CmXClDlmul+s2G428TjtQULnxpJfHeNWNyiDO/1Jp05Dc1fzM+geso8HkOeBQp8sKItD
08M20G6FJx7h8OiYnAMFQXmZjHTPP6LE1AIYJkVLYRZ+WpHd4OSYlfsNKI+HcujHVrlpQqIUuwIW
2g0SfLQH9977mjc7/vK8MjAwVnhnMLaap51A/FKchL4/n3D/m96vKwPRuPLOXIIzBQjUFoVwnvfx
lHigeEu3r9wQ2bJzSEY2FUtzD04VTHH0R2q4dhvpT/ZTB5/nF4WyqXyTcUrb61H5GpR2HWADZttk
atb2VOySNwUJkfYzf4t8cR4PThozKoYpXS3aQfyowQ==
=mfN4
-----END PGP SIGNATURE-----

--TKNWxujNkbkYNCaB91laL1dpKBarJ4Dgu--

