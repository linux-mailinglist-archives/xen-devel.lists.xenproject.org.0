Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2A631B574
	for <lists+xen-devel@lfdr.de>; Mon, 15 Feb 2021 07:56:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85061.159449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBXmz-0005WI-58; Mon, 15 Feb 2021 06:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85061.159449; Mon, 15 Feb 2021 06:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBXmz-0005Vr-0k; Mon, 15 Feb 2021 06:55:21 +0000
Received: by outflank-mailman (input) for mailman id 85061;
 Mon, 15 Feb 2021 06:55:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx6I=HR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lBXmw-0005Vm-Jq
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 06:55:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1f5ee29-3f76-4d3c-bac5-230785bc2e34;
 Mon, 15 Feb 2021 06:55:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 998F8ADDB;
 Mon, 15 Feb 2021 06:55:15 +0000 (UTC)
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
X-Inumbo-ID: a1f5ee29-3f76-4d3c-bac5-230785bc2e34
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613372115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gb2YctauaZwx1wpb7VFmE/CdTXsDy0TKF2f3m6ky/to=;
	b=IQ0cjTrz20AhAVvJ2K+wanLj3F/5JLuQJvUBuMSW9EdUMgSwHK8yJ8yeibvVEmDOHsSlhp
	jc43rB2SAM0oPnVSOGncHvIp6rG1B38sZRwuKpspDqiOKfUe82ragNpfDL/VNLXybFn3Yh
	BjmwQBUiqRWEbOewn4ToXQxrn2lPL5s=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-4-jgross@suse.com>
 <eed12192-a740-e767-1762-828c75de66ce@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 3/8] xen/events: avoid handling the same event on two
 cpus at the same time
Message-ID: <c4d930c1-331f-6a1e-7d26-cf066cecda33@suse.com>
Date: Mon, 15 Feb 2021 07:55:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eed12192-a740-e767-1762-828c75de66ce@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7zfISEbWiXTW2yLiOjoHHWptpgt3WYDwu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7zfISEbWiXTW2yLiOjoHHWptpgt3WYDwu
Content-Type: multipart/mixed; boundary="PN3jkXVSs90bn2otpr7vqVYheMbLKyUDx";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <c4d930c1-331f-6a1e-7d26-cf066cecda33@suse.com>
Subject: Re: [PATCH v2 3/8] xen/events: avoid handling the same event on two
 cpus at the same time
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-4-jgross@suse.com>
 <eed12192-a740-e767-1762-828c75de66ce@xen.org>
In-Reply-To: <eed12192-a740-e767-1762-828c75de66ce@xen.org>

--PN3jkXVSs90bn2otpr7vqVYheMbLKyUDx
Content-Type: multipart/mixed;
 boundary="------------E8383365BF43AE4646CD0A35"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E8383365BF43AE4646CD0A35
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.02.21 22:34, Julien Grall wrote:
> Hi Juergen,
>=20
> On 11/02/2021 10:16, Juergen Gross wrote:
>> When changing the cpu affinity of an event it can happen today that
>> (with some unlucky timing) the same event will be handled on the old
>> and the new cpu at the same time.
>>
>> Avoid that by adding an "event active" flag to the per-event data and
>> call the handler only if this flag isn't set.
>>
>> Reported-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - new patch
>> ---
>> =C2=A0 drivers/xen/events/events_base.c | 19 +++++++++++++++----
>> =C2=A0 1 file changed, 15 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/xen/events/events_base.c=20
>> b/drivers/xen/events/events_base.c
>> index e157e7506830..f7e22330dcef 100644
>> --- a/drivers/xen/events/events_base.c
>> +++ b/drivers/xen/events/events_base.c
>> @@ -102,6 +102,7 @@ struct irq_info {
>> =C2=A0 #define EVT_MASK_REASON_EXPLICIT=C2=A0=C2=A0=C2=A0 0x01
>> =C2=A0 #define EVT_MASK_REASON_TEMPORARY=C2=A0=C2=A0=C2=A0 0x02
>> =C2=A0 #define EVT_MASK_REASON_EOI_PENDING=C2=A0=C2=A0=C2=A0 0x04
>> +=C2=A0=C2=A0=C2=A0 u8 is_active;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /* Is event just being handled? */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned irq;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evtchn_port_t evtchn;=C2=A0=C2=A0 /* ev=
ent channel */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned short cpu;=C2=A0=C2=A0=C2=A0=C2=
=A0 /* cpu bound */
>> @@ -622,6 +623,7 @@ static void xen_irq_lateeoi_locked(struct irq_info=
=20
>> *info, bool spurious)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->eoi_time =3D 0;
>> +=C2=A0=C2=A0=C2=A0 smp_store_release(&info->is_active, 0);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_unmask(info, EVT_MASK_REASON_EOI_PEN=
DING);
>> =C2=A0 }
>> @@ -809,13 +811,15 @@ static void pirq_query_unmask(int irq)
>> =C2=A0 static void eoi_pirq(struct irq_data *data)
>> =C2=A0 {
>> -=C2=A0=C2=A0=C2=A0 evtchn_port_t evtchn =3D evtchn_from_irq(data->irq=
);
>> +=C2=A0=C2=A0=C2=A0 struct irq_info *info =3D info_for_irq(data->irq);=

>> +=C2=A0=C2=A0=C2=A0 evtchn_port_t evtchn =3D info ? info->evtchn : 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct physdev_eoi eoi =3D { .irq =3D p=
irq_from_irq(data->irq) };
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rc =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!VALID_EVTCHN(evtchn))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
>> +=C2=A0=C2=A0=C2=A0 smp_store_release(&info->is_active, 0);
>=20
> Would you mind to explain why you are using the release semantics?

It is basically releasing a lock. So release semantics seem to be
appropriate.

> It is also not clear to me if there are any expected ordering between=20
> clearing is_active and clearing the pending bit.

No, I don't think there is a specific ordering required. is_active is
just guarding against two simultaneous IRQ handler calls for the same
event being active. Clearing the pending bit is not part of the guarded
section.

>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear_evtchn(evtchn);
>=20
>=20
> The 2 lines here seems to be a common pattern in this patch. So I would=
=20
> suggest to create a new helper.

Okay.


Juergen

--------------E8383365BF43AE4646CD0A35
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

--------------E8383365BF43AE4646CD0A35--

--PN3jkXVSs90bn2otpr7vqVYheMbLKyUDx--

--7zfISEbWiXTW2yLiOjoHHWptpgt3WYDwu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAqGtIFAwAAAAAACgkQsN6d1ii/Ey89
Bgf/YqzP0frmMc/MfBd2/G9qz9UanDcIsq9kBPzvF1wZyxZ0ez80TwRXnTVCVNxpvVQnoWmCAMUO
jLlR6BdcrM8lhsOUHYfldjFD7mVPf1MeOjhGRcCUEsorosjAljfnkIv0YTLUkJsvhX7G4vafiLwg
VHpGrueqrDg/yf5N1UiuWJT83GsK4UA95I7f+23ox0a96XxnfKVmXxHRt2DPLU8OzK5/4yTWc0Bu
FoxuNchoAoz/4PH0s0d5Ai1iVVyEGxBu9+gyU8+ar4C46Q6bT8JpxpOPMBOFoDNdnZfDEu7n+V7/
LgGyXwFdl99HrQghEeJTuO2RzUQbx8tSU8rYQ+ZOGQ==
=Q2NO
-----END PGP SIGNATURE-----

--7zfISEbWiXTW2yLiOjoHHWptpgt3WYDwu--

