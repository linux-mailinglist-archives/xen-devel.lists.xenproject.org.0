Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4939133D657
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 16:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98346.186510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBEm-0003h6-DR; Tue, 16 Mar 2021 15:04:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98346.186510; Tue, 16 Mar 2021 15:04:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMBEm-0003gi-A9; Tue, 16 Mar 2021 15:04:00 +0000
Received: by outflank-mailman (input) for mailman id 98346;
 Tue, 16 Mar 2021 15:03:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4u2H=IO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lMBEl-0003gd-8g
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 15:03:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc1658b2-effb-4266-887f-c14327b862d4;
 Tue, 16 Mar 2021 15:03:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59B3BAD72;
 Tue, 16 Mar 2021 15:03:57 +0000 (UTC)
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
X-Inumbo-ID: bc1658b2-effb-4266-887f-c14327b862d4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615907037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k1nZcjDpdu+poBSXNwFWYDFI7JDSS46d5Da0XbaYFxc=;
	b=M7cXjsAiU8cZnHqgJ0BfphEErgJextR3gRyDLOt0nJj9BIPFxTxpnZ9jTy2OwPojdrxzls
	UkzPNnqR+PPBICNwoqLIhQPOtzx/KGfOXAQkoSrMnp9oEZyU90xu/uS+sHRZQR4BWwevCW
	5En3bZbFVH+ybF5OKgW34RPqvTPAs6k=
Subject: Re: libxl / xen-pciback interaction
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
Date: Tue, 16 Mar 2021 16:03:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lozyrYSf1icFEANjtLBBeq2rxAmJsZBAB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lozyrYSf1icFEANjtLBBeq2rxAmJsZBAB
Content-Type: multipart/mixed; boundary="nGkb9WbA7obsvSYnVumQTs2Z1dhuV1YZE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <fb22429c-4f33-4d13-1861-977d093ba471@suse.com>
Subject: Re: libxl / xen-pciback interaction
References: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>
In-Reply-To: <c9bf77ec-8a82-5a6e-c0eb-36e4cc373b23@suse.com>

--nGkb9WbA7obsvSYnVumQTs2Z1dhuV1YZE
Content-Type: multipart/mixed;
 boundary="------------85D18B880C0D7F3894E3D66D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------85D18B880C0D7F3894E3D66D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.03.21 15:27, Jan Beulich wrote:
> All,
>=20
> while trying to test a pciback fix for how SR-IOV VFs get placed in the=

> guest PCI topology I noticed that my test VM would only ever see the 1s=
t
> out of 3 VFs that I passed to it. As it turns out, the driver watches
> its own (backend) node, and upon first receiving notification it
> evaluates state found in xenstore to set up the backend device.
> Subsequently it switches the device to Initialised. After this switchin=
g,
> not further instances of the watch triggering would do anything.
>=20
> In all instances I observed the watch event getting processed when the
> "num_devs" node still reported 1. Trying to deal with this in libxl, by=

> delaying the writing of the "num_devs" node, led to a fatal error
> ("num_devs" not being available to read) in the driver, causing the
> device to move to Closing state. Therefore I decided that the issue has=

> to be addressed in the driver, resulting in a patch (reproduced below)
> that I'm not overly happy with. I think the present libxl behavior is
> wrong - it shouldn't trigger driver initialization without having fully=

> populated the information the driver is supposed to consume for its
> device initialization. The only solution that I can think of, however,
> doesn't look very appealing either: Instead of putting all pieces of th=
e
> data for one device in a transaction, make a single transaction cover
> all devices collectively.

Any reason why you don't like this solution? Its not as if there would
be a large problem to be expected with using a single transaction for
all PCI devices passed through (assuming you didn't mean to pack really
all devices of the guest into that single transaction).


Juergen

--------------85D18B880C0D7F3894E3D66D
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

--------------85D18B880C0D7F3894E3D66D--

--nGkb9WbA7obsvSYnVumQTs2Z1dhuV1YZE--

--lozyrYSf1icFEANjtLBBeq2rxAmJsZBAB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBQyNwFAwAAAAAACgkQsN6d1ii/Ey9j
lwf9FOfwDDSrWEeFXcCzkwxjS4mxgywS/+aACxZsVkfuOXKEoz075zgcZ9eLe5naRZ91Fl2koLzl
LcBeh93citjrXj6tFTkS6q2CmNWM7Q12AFTIB2tHhtbUU5ikjEHSOGeD4Alz3J9K5Yiaa3+EwH+P
t1NIlaTuQDsnyfqwYcFBqRweKCjEzvrF3x4Wrdx+rBYBTVUHa0HkHmT7IbTvs1zOAmI9InxHuIcj
KBozpw8ELO/3j+hxs9V1dAJxgvOt2ilKdaQvmN9BvpQwa3+pHouZ8YtbNEg8T2n9/UC9JkPYp9q9
YaF4CZ9dtm62IULMISZOMGJmfx+JJ3E8C+SiqUaV5A==
=9yzP
-----END PGP SIGNATURE-----

--lozyrYSf1icFEANjtLBBeq2rxAmJsZBAB--

