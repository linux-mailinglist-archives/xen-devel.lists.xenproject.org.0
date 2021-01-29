Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C18FE30852D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 06:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77704.140909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5MIK-0004jj-Tn; Fri, 29 Jan 2021 05:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77704.140909; Fri, 29 Jan 2021 05:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5MIK-0004jK-Pu; Fri, 29 Jan 2021 05:26:08 +0000
Received: by outflank-mailman (input) for mailman id 77704;
 Fri, 29 Jan 2021 05:26:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9j1X=HA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l5MIK-0004jF-3B
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 05:26:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72f1992b-bd17-4b53-98ba-d0cce2b72fb4;
 Fri, 29 Jan 2021 05:26:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DA43CAE56;
 Fri, 29 Jan 2021 05:26:03 +0000 (UTC)
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
X-Inumbo-ID: 72f1992b-bd17-4b53-98ba-d0cce2b72fb4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611897964; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1mtl5hlqCovATj6+TX89DVe/hfAobAWAH/SKWPhzPGs=;
	b=SE+DMSthyceyHzFxz8yCw2K0n6cGagPkrFIc39nCgCMbFlCS6AFaLxYLKJMQ8FKvU+UX+1
	J9EirNLl/Wl1A4nzyNjj/RVPMAGwmVcGPzpS+CVc5hQHZv0gbBQuU+Cte5UOfMn+aN77RG
	EMwgzo14+XllZHwMZgdxaA1a7RxgMXg=
Subject: Re: Problems starting Xen domU after latest stable update
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Michael D Labriola <michael.d.labriola@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Sasha Levin <sashal@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <2nft2kipqg.fsf@aragorn.infrastructure.cah>
 <983b87d6-edb8-21ea-7d6f-f653f5c0d048@oracle.com>
 <20210129005129.GA2452@mail-itl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <44068a70-8940-824b-9e39-b800635b92c7@suse.com>
Date: Fri, 29 Jan 2021 06:26:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210129005129.GA2452@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EGwiQzZCoNLZmzRhDQxnU6miBrMwYBCNy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EGwiQzZCoNLZmzRhDQxnU6miBrMwYBCNy
Content-Type: multipart/mixed; boundary="nZPkDkCt3NHURUzEQdZiwXelszA8Yan8e";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Michael D Labriola <michael.d.labriola@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Sasha Levin <sashal@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <44068a70-8940-824b-9e39-b800635b92c7@suse.com>
Subject: Re: Problems starting Xen domU after latest stable update
References: <2nft2kipqg.fsf@aragorn.infrastructure.cah>
 <983b87d6-edb8-21ea-7d6f-f653f5c0d048@oracle.com>
 <20210129005129.GA2452@mail-itl>
In-Reply-To: <20210129005129.GA2452@mail-itl>

--nZPkDkCt3NHURUzEQdZiwXelszA8Yan8e
Content-Type: multipart/mixed;
 boundary="------------F995415C110CA22168F5B32B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F995415C110CA22168F5B32B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 29.01.21 01:51, Marek Marczykowski-G=C3=B3recki wrote:
> On Thu, Jan 28, 2021 at 07:03:00PM -0500, Boris Ostrovsky wrote:
>>
>> On 1/28/21 6:52 PM, Michael D Labriola wrote:
>>> Hey, everyone.  I've run into problems starting up my Xen domUs as of=

>>> the latest batch of stable updates.  Whenever I try to create one, I
>>> get a bunch of block device errors like this:
>>>
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51712
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51728
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51744
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51760
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to add device with path /local/domain/0/backend/vbd/4/51776
>>> libxl: error: libxl_create.c:1452:domcreate_launch_dm: Domain 4:unabl=
e to add disk devices
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51712
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51728
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51744
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51760
>>> libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:u=
nable to remove device with path /local/domain/0/backend/vbd/4/51776
>>> libxl: error: libxl_domain.c:1290:devices_destroy_cb: Domain 4:libxl_=
_devices_destroy failed
>>> libxl: error: libxl_domain.c:1177:libxl__destroy_domid: Domain 4:Non-=
existant domain
>>> libxl: error: libxl_domain.c:1131:domain_destroy_callback: Domain 4:U=
nable to destroy guest
>>> libxl: error: libxl_domain.c:1058:domain_destroy_cb: Domain 4:Destruc=
tion of domain failed
>>>
>>> I'm using Xen 4.13.1 on the box I've been testing with.
>>>
>>> I bisected down to this commit, and reverting it does indeed fix my
>>> problem.  Well, this commit upstream and it's cherry-picked variants
>>> on linux-5.4.y and linux-5.10.y.
>>
>>
>> You most likely need 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1. It hit =
Linus tree a few hours ago.
>=20
> I can confirm this fixes the same issue for me (too?), thanks!
> Shouldn't this patch have Cc: stable?

No, I don't think so.

The issue being fixed by the patch has been introduced only in 5.11
and the fixing patch references the buggy patch via a Fixes: tag.

If the buggy patch has been put into stable this Fixes: tag should
result in the fix being put into the same stable branches as well.


Juergen


--------------F995415C110CA22168F5B32B
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

--------------F995415C110CA22168F5B32B--

--nZPkDkCt3NHURUzEQdZiwXelszA8Yan8e--

--EGwiQzZCoNLZmzRhDQxnU6miBrMwYBCNy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmATnGoFAwAAAAAACgkQsN6d1ii/Ey8e
oAf+MddfaCnGDNsaGVPvbGniUHKmkw89GXzyPr3oGnm71XPEsk/x34EraLyFUhWY0REl24u4W4Y4
G5inX3r1vEoYwCWd259Z5img/ZRDUFZ086lZPX/O2C8nlzROL5h+sUX16Mg/7utcPM080PU9jxPb
hHXjT192f0lmJniBG+Mf2WrVzBstO3X5JWiIXwuuFcWG3MlFf1YCDGQb+46j7bEB6o3TDVrz/x1A
vzdMkJU3LllO62ooRhH6YfWIVGj6fg5W9KM+aIxUOCvovghBdig+ju/TxA8WUMzwAmn6ezB3r/VF
0FsTfgfg7Itq8equm/Mbqsx30oXuR/nKtTsnEwHXAA==
=zlg9
-----END PGP SIGNATURE-----

--EGwiQzZCoNLZmzRhDQxnU6miBrMwYBCNy--

