Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E775F41F11B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 17:21:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200754.355323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWKLA-0004KP-76; Fri, 01 Oct 2021 15:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200754.355323; Fri, 01 Oct 2021 15:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWKLA-0004I9-34; Fri, 01 Oct 2021 15:20:48 +0000
Received: by outflank-mailman (input) for mailman id 200754;
 Fri, 01 Oct 2021 15:20:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kuDH=OV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mWKL8-0004Hn-EH
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 15:20:46 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1b0d5ae-b3d0-462c-a74f-7cc97aa39a8a;
 Fri, 01 Oct 2021 15:20:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3BF920063;
 Fri,  1 Oct 2021 15:20:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 826FA13C6D;
 Fri,  1 Oct 2021 15:20:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pf6EHkwnV2FyRQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Oct 2021 15:20:44 +0000
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
X-Inumbo-ID: a1b0d5ae-b3d0-462c-a74f-7cc97aa39a8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633101644; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bVBXsAy0b+itOER7N3I1oQ05RMyRcTR4aLXyKhF7/ow=;
	b=WnVojoIqXGMCT3eLYfMopamfp7uBnYbCeyIQb5gjrfzq7m1Xl3Q/TJCmSZYUAFy0RkpQ7n
	onDxqjmTbJ1Nx62uwCUVJo4GYn20sVBfZC+SdbZMn6VMtH87h2FOfmefDgGJ+dEcs8mGgd
	iE38tX47/B4oO9zPcFRF1y1uFDhCKAU=
Subject: Re: [PATCH v5 2/3] usb: Introduce Xen pvUSB frontend (xen hcd)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20211001150039.15921-1-jgross@suse.com>
 <20211001150039.15921-3-jgross@suse.com> <YVclpB4HP4hynENV@kroah.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <de25b52e-7db3-3845-38e9-dc8353b23308@suse.com>
Date: Fri, 1 Oct 2021 17:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YVclpB4HP4hynENV@kroah.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Hrj6TJnAjNUwTljeSgccEyMV8hhYdDI7S"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Hrj6TJnAjNUwTljeSgccEyMV8hhYdDI7S
Content-Type: multipart/mixed; boundary="Rd4R2m5iuBTmN24qGWaADmT8GM6YKMIGa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: xen-devel@lists.xenproject.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <de25b52e-7db3-3845-38e9-dc8353b23308@suse.com>
Subject: Re: [PATCH v5 2/3] usb: Introduce Xen pvUSB frontend (xen hcd)
References: <20211001150039.15921-1-jgross@suse.com>
 <20211001150039.15921-3-jgross@suse.com> <YVclpB4HP4hynENV@kroah.com>
In-Reply-To: <YVclpB4HP4hynENV@kroah.com>

--Rd4R2m5iuBTmN24qGWaADmT8GM6YKMIGa
Content-Type: multipart/mixed;
 boundary="------------12BBFCA059E989F27D2F36B1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------12BBFCA059E989F27D2F36B1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.10.21 17:13, Greg Kroah-Hartman wrote:
> On Fri, Oct 01, 2021 at 05:00:38PM +0200, Juergen Gross wrote:
>> --- /dev/null
>> +++ b/drivers/usb/host/xen-hcd.c
>> @@ -0,0 +1,1641 @@
>> +/*
>> + * xen-hcd.c
>=20
> Need a SPDX line here, instead of the license boiler-plate text you
> have.
>=20
> Did you run checkpatch on this thing?  I thought that would have told
> you about this.
>=20
>> + *
>> + * Xen USB Virtual Host Controller driver
>> + *
>> + * Copyright (C) 2009, FUJITSU LABORATORIES LTD.
>> + * Author: Noboru Iwamatsu <n_iwamatsu@jp.fujitsu.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modi=
fy
>> + * it under the terms of the GNU General Public License as published =
by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see <http://www.gnu.org/licenses/=
>.
>> + *
>> + * Or, by your choice:
>> + *
>> + * When distributed separately from the Linux kernel or incorporated =
into
>> + * other software packages, subject to the following license:
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtain=
ing a copy
>> + * of this software and associated documentation files (the "Software=
"), to
>> + * deal in the Software without restriction, including without limita=
tion the
>> + * rights to use, copy, modify, merge, publish, distribute, sublicens=
e, and/or
>> + * sell copies of the Software, and to permit persons to whom the Sof=
tware is
>> + * furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be inc=
luded in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL THE
>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHE=
R
>> + * DEALINGS IN THE SOFTWARE.
>=20
> Dual licensing a USB host controller driver is, um, a very dubious
> thing given that you can only interact with symbols exported with
> EXPORT_SYMBOL_GPL() from the USB stack.
>=20
> So you might want to change this...

Ah, right. I thought I wouldn't be able to do so, as the original driver
was including above license text, but reading it again I think I can
just make it GPL-V2.


Juergen

--------------12BBFCA059E989F27D2F36B1
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------12BBFCA059E989F27D2F36B1--

--Rd4R2m5iuBTmN24qGWaADmT8GM6YKMIGa--

--Hrj6TJnAjNUwTljeSgccEyMV8hhYdDI7S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFXJ0sFAwAAAAAACgkQsN6d1ii/Ey9C
twf/Te9k/zYG2ynHFJXt3Ui3BhE+h5hZmqEvNpXtPnu1iQI9iRSVsSFBO7hIdbAhCWYubVGXxe4A
1bijW5NnHOo891xlHI9VCgRQv3Wmg80oFVXtU5kQTIK+iacHkowzull4b9WnOZV1Yo9ROd8/PotQ
PbCLiGrfNiUXGikjD30glIjvLOGpQIPXdGsWsxXWxM81gG/X74/863Sh4QrroGxC/J1a9v7j+xgr
x5Jgd8AX85q0I0K7yGjBphj5vQZHkLd82WxH+be301EfJjwqUFsyNXxFn9wEZTpMlWPa7PWKA4pk
k4t69HGXEgfO+zOptlC2E99ZusHYh7sdcDfoy3Crzg==
=xvfH
-----END PGP SIGNATURE-----

--Hrj6TJnAjNUwTljeSgccEyMV8hhYdDI7S--

