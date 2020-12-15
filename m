Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D672DA880
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 08:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52931.92379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp4kB-0000hR-MU; Tue, 15 Dec 2020 07:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52931.92379; Tue, 15 Dec 2020 07:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp4kB-0000h2-JK; Tue, 15 Dec 2020 07:27:35 +0000
Received: by outflank-mailman (input) for mailman id 52931;
 Tue, 15 Dec 2020 07:27:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2CwE=FT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kp4kA-0000gw-25
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 07:27:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a59419f-79ff-438e-8231-ca57484818ca;
 Tue, 15 Dec 2020 07:27:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59F13AC7F;
 Tue, 15 Dec 2020 07:27:31 +0000 (UTC)
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
X-Inumbo-ID: 0a59419f-79ff-438e-8231-ca57484818ca
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608017251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nj9ihax1/LrptfS9HSC1+VTxcZq+NVNUTCtfqAvgkPo=;
	b=FozNUbfhAKc8ap0AvXU0MWeqHO0YYsbgxBpCqBLfwmZdg26YtFCRWG+CzdTZ+voDttAXG4
	Cgea/51PqVE0bNbQ9w6SSKS327Oocp2np39zl9AApNdl+Ucec2sjKOJSyHImcnzP6+x9dw
	sPWSaMCky4j69xCMPosIrJmduYpkEec=
To: Julien Grall <julien@xen.org>, aams@amazon.de
Cc: linux-kernel@vger.kernel.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 foersleo@amazon.de
References: <ce881240-284f-8470-10f1-5cce353ee903@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: xen/evtchn: Interrupt for port 34, but apparently not enabled;
 per-user 00000000a86a4c1b on 5.10
Message-ID: <b5c32c48-3e74-2045-62ec-560b19766389@suse.com>
Date: Tue, 15 Dec 2020 08:27:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <ce881240-284f-8470-10f1-5cce353ee903@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aZ8yJ9HMcgUBjSDsb6zsumgc5RgbItXS0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aZ8yJ9HMcgUBjSDsb6zsumgc5RgbItXS0
Content-Type: multipart/mixed; boundary="ykQYKCMfBobgZ4ASufJVLpgcjHbZd6Ss7";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, aams@amazon.de
Cc: linux-kernel@vger.kernel.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 foersleo@amazon.de
Message-ID: <b5c32c48-3e74-2045-62ec-560b19766389@suse.com>
Subject: Re: xen/evtchn: Interrupt for port 34, but apparently not enabled;
 per-user 00000000a86a4c1b on 5.10
References: <ce881240-284f-8470-10f1-5cce353ee903@xen.org>
In-Reply-To: <ce881240-284f-8470-10f1-5cce353ee903@xen.org>

--ykQYKCMfBobgZ4ASufJVLpgcjHbZd6Ss7
Content-Type: multipart/mixed;
 boundary="------------BFD7A9977F6A02DCE726E85E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BFD7A9977F6A02DCE726E85E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.12.20 22:25, Julien Grall wrote:
> Hi Juergen,
>=20
> When testing Linux 5.10 dom0, I could reliably hit the following warnin=
g=20
> with using event 2L ABI:
>=20
> [=C2=A0 589.591737] Interrupt for port 34, but apparently not enabled; =

> per-user 00000000a86a4c1b
> [=C2=A0 589.593259] WARNING: CPU: 0 PID: 1111 at=20
> /home/ANT.AMAZON.COM/jgrall/works/oss/linux/drivers/xen/evtchn.c:170=20
> evtchn_interrupt+0xeb/0x100
> [=C2=A0 589.595514] Modules linked in:
> [=C2=A0 589.596145] CPU: 0 PID: 1111 Comm: qemu-system-i38 Tainted: G=20
> W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.10.0+ #180
> [=C2=A0 589.597708] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009),=
 BIOS=20
> rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> [=C2=A0 589.599782] RIP: e030:evtchn_interrupt+0xeb/0x100
> [=C2=A0 589.600698] Code: 48 8d bb d8 01 00 00 ba 01 00 00 00 be 1d 00 =
00 00=20
> e8 d9 10 ca ff eb b2 8b 75 20 48 89 da 48 c7 c7 a8 31 3d 82 e8 65 29 a0=
=20
> ff <0f> 0b e9 42 ff ff ff 0f 1f 40 00 66 2e 0f 1f 84 00 00 00 00 00 0f
> [=C2=A0 589.604087] RSP: e02b:ffffc90040003e70 EFLAGS: 00010086
> [=C2=A0 589.605102] RAX: 0000000000000000 RBX: ffff888102091800 RCX:=20
> 0000000000000027
> [=C2=A0 589.606445] RDX: 0000000000000000 RSI: ffff88817fe19150 RDI:=20
> ffff88817fe19158
> [=C2=A0 589.607790] RBP: ffff88810f5ab980 R08: 0000000000000001 R09:=20
> 0000000000328980
> [=C2=A0 589.609134] R10: 0000000000000000 R11: ffffc90040003c70 R12:=20
> ffff888107fd3c00
> [=C2=A0 589.610484] R13: ffffc90040003ed4 R14: 0000000000000000 R15:=20
> ffff88810f5ffd80
> [=C2=A0 589.611828] FS:=C2=A0 00007f960c4b8ac0(0000) GS:ffff88817fe0000=
0(0000)=20
> knlGS:0000000000000000
> [=C2=A0 589.613348] CS:=C2=A0 10000e030 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> [=C2=A0 589.614525] CR2: 00007f17ee72e000 CR3: 000000010f5b6000 CR4:=20
> 0000000000050660
> [=C2=A0 589.615874] Call Trace:
> [=C2=A0 589.616402]=C2=A0 <IRQ>
> [=C2=A0 589.616855]=C2=A0 __handle_irq_event_percpu+0x4e/0x2c0
> [=C2=A0 589.617784]=C2=A0 handle_irq_event_percpu+0x30/0x80
> [=C2=A0 589.618660]=C2=A0 handle_irq_event+0x3a/0x60
> [=C2=A0 589.619428]=C2=A0 handle_edge_irq+0x9b/0x1f0
> [=C2=A0 589.620209]=C2=A0 generic_handle_irq+0x4f/0x60
> [=C2=A0 589.621008]=C2=A0 evtchn_2l_handle_events+0x160/0x280
> [=C2=A0 589.621913]=C2=A0 __xen_evtchn_do_upcall+0x66/0xb0
> [=C2=A0 589.622767]=C2=A0 __xen_pv_evtchn_do_upcall+0x11/0x20
> [=C2=A0 589.623665]=C2=A0 asm_call_irq_on_stack+0x12/0x20
> [=C2=A0 589.624511]=C2=A0 </IRQ>
> [=C2=A0 589.624978]=C2=A0 xen_pv_evtchn_do_upcall+0x77/0xf0
> [=C2=A0 589.625848]=C2=A0 exc_xen_hypervisor_callback+0x8/0x10
>=20
> This can be reproduced when creating/destroying guest in a loop.=20
> Although, I have struggled to reproduce it on a vanilla Xen.
>=20
> After several hours of debugging, I think I have found the root cause.
>=20
> While we only expect the unmask to happen when the event channel is=20
> EOIed, there is an unmask happening as part of handle_edge_irq() becaus=
e=20
> the interrupt was seen as pending by another vCPU (IRQS_PENDING is set)=
=2E
>=20
> It turns out that the event channel is set for multiple vCPU is in=20
> cpu_evtchn_mask. This is happening because the affinity is not cleared =

> when freeing an event channel.
>=20
> The implementation of evtchn_2l_handle_events() will look for all the=20
> active interrupts for the current vCPU and later on clear the pending=20
> bit (via the ack() callback). IOW, I believe, this is not an atomic=20
> operation.
>=20
> Even if Xen will notify the event to a single vCPU, evtchn_pending_sel =

> may still be set on the other vCPU (thanks to a different event=20
> channel). Therefore, there is a chance that two vCPUs will try to handl=
e=20
> the same interrupt.
>=20
> The IRQ handler handle_edge_irq() is able to deal with that and will=20
> mask/unmask the interrupt. This will mess us with the lateeoi logic=20
> (although, I managed to reproduce it once without XSA-332).

Thanks for the analysis!

> My initial idea to fix the problem was to switch the affinity from CPU =
X=20
> to CPU0 when the event channel is freed.
>=20
> However, I am not sure this is enough because I haven't found anything =

> yet preventing a race between evtchn_2l_handle_events9) and=20
> evtchn_2l_bind_vcpu().
>=20
> So maybe we want to introduce a refcounting (if there is nothing=20
> provided by the IRQ framework) and only unmask when the counter drop to=
 0.
>=20
> Any opinions?

I think we don't need a refcount, but just the internal states "masked"
and "eoi_pending" and unmask only if both are false. "masked" will be
set when the event is being masked. When delivering a lateeoi irq
"eoi_pending" will be set and "masked "reset. "masked" will be reset
when a normal unmask is happening. And "eoi_pending" will be reset
when a lateeoi is signaled. Any reset of "masked" and "eoi_pending"
will check the other flag and do an unmask if both are false.

I'll write a patch.


Juergen

--------------BFD7A9977F6A02DCE726E85E
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

--------------BFD7A9977F6A02DCE726E85E--

--ykQYKCMfBobgZ4ASufJVLpgcjHbZd6Ss7--

--aZ8yJ9HMcgUBjSDsb6zsumgc5RgbItXS0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/YZWIFAwAAAAAACgkQsN6d1ii/Ey9i
9wf/b3sDzT31CkscSrcxgPD9r3ZhiLCSL5VKnepG49iucBjyHPBak30xHzsegjQrLZOG1arML5aH
J5xipgP6VoHP+N2TMrvGCoIb9zQC2iMtuIBhfcYCWcixUWttMOenfkz5Y4HQsdqsXqSunOBqc+t3
MdtvdqkT4oNuftOkTrpiFPabF0aaiykskPf7/ldiiz5xEUJ663P8arJo+4eChbeEk5cp8YThVi6x
2xlC1w14i3PsUOdaqADwLctlkhtifzIokB675+/qRfICq1EA7Wmp8RE7zqaP26Bwa8+L2dL/Tk8o
l0cTrHJUYYKsrschyZl9zy6TCi5e0D5l66iZ5GZ8JQ==
=Mf3s
-----END PGP SIGNATURE-----

--aZ8yJ9HMcgUBjSDsb6zsumgc5RgbItXS0--

