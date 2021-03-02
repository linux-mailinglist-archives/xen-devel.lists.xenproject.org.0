Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98339329605
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 06:15:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92087.173815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGxNa-0002V6-Vv; Tue, 02 Mar 2021 05:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92087.173815; Tue, 02 Mar 2021 05:15:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGxNa-0002Uh-SU; Tue, 02 Mar 2021 05:15:30 +0000
Received: by outflank-mailman (input) for mailman id 92087;
 Tue, 02 Mar 2021 05:15:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRZ7=IA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lGxNZ-0002Uc-6j
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 05:15:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e434e1f-7586-48fc-a9c6-615da07a2748;
 Tue, 02 Mar 2021 05:15:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 453BAAAC5;
 Tue,  2 Mar 2021 05:15:27 +0000 (UTC)
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
X-Inumbo-ID: 7e434e1f-7586-48fc-a9c6-615da07a2748
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614662127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P1HJmEBLe02gdILdBiKZ8//oVn+6DgIMWtesj9tNA4w=;
	b=Yca6tVZzhzmzIyDu/Q/7LIx39sG66Y+vlKZsWF4k8qAnMJKSPAUx5r5rOssijX29q5U/uH
	1tNkK8H29W/ljVVGvtw+3fEfSPHOMNc82T0rP6dIt+QPUdlMEah3ylVX2chnnagI01FJsw
	hfBw4PlkkFOG75fnfAu9j6novWnTKF0=
Subject: Re: [PATCH XENSTORE v1 06/10] xenstored: handle port reads correctly
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.co.uk>, Michael Kurth <mku@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-7-nmanthey@amazon.de>
 <a840c4fa-148e-7617-20e5-9b286ace2c40@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fc383f00-7bf9-6f2f-54ab-b1e66eed419d@suse.com>
Date: Tue, 2 Mar 2021 06:15:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a840c4fa-148e-7617-20e5-9b286ace2c40@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NFF5TYVYjkXxGTm1P7LrRVHjTR0sLkBga"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NFF5TYVYjkXxGTm1P7LrRVHjTR0sLkBga
Content-Type: multipart/mixed; boundary="5windFdbY919aeLwnnvFDDlYv8vQI5ROv";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Norbert Manthey <nmanthey@amazon.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.co.uk>, Michael Kurth <mku@amazon.de>
Message-ID: <fc383f00-7bf9-6f2f-54ab-b1e66eed419d@suse.com>
Subject: Re: [PATCH XENSTORE v1 06/10] xenstored: handle port reads correctly
References: <20210226144144.9252-1-nmanthey@amazon.de>
 <20210226144144.9252-7-nmanthey@amazon.de>
 <a840c4fa-148e-7617-20e5-9b286ace2c40@citrix.com>
In-Reply-To: <a840c4fa-148e-7617-20e5-9b286ace2c40@citrix.com>

--5windFdbY919aeLwnnvFDDlYv8vQI5ROv
Content-Type: multipart/mixed;
 boundary="------------A427817A38666E490C6069FB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A427817A38666E490C6069FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26.02.21 16:36, Andrew Cooper wrote:
> On 26/02/2021 14:41, Norbert Manthey wrote:
>> The read value could be larger than a signed 32bit integer. As -1 is
>> used as error value, we should not rely on using the full 32 bits.
>> Hence, when reading the port number, we should make sure we only retur=
n
>> valid values.
>>
>> This change sanity checks the input.
>> The issue is that the value for the port is
>>   1. transmitted as a string, with a fixed amount of digits.
>>   2. Next, this string is parsed by a function that can deal with stri=
ngs
>>      representing 64bit integers
>>   3. A 64bit integer is returned, and will be truncated to it's lower
>>      32bits, resulting in a wrong port number (in case the sender of t=
he
>>      string decides to craft a suitable 64bit value).
>>
>> The value is typically provided by the kernel, which has this value ha=
rd
>> coded in the proper range. As we use the function strtoul, non-digit
>> character are considered as end of the input, and hence do not require=

>> checking. Therefore, this change only covers the corner case to make
>> sure we stay in the 32 bit range.
>>
>> This bug was discovered and resolved using Coverity Static Analysis
>> Security Testing (SAST) by Synopsys, Inc.
>>
>> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
>> Reviewed-by: Thomas Friebel <friebelt@amazon.de>
>> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>
>=20
> Port numbers are currently limited at 2^17, with easy extension to 2^29=

> (iirc), but the entire event channel infrastructure would have to
> undergo another redesign to get beyond that.
>=20
> I think we can reasonably make an ABI statement saying that a port
> number will never exceed 2^31.=C2=A0 This is already pseudo-encoded in =
the
> evtchn_port_or_error_t mouthful.

I agree. There is no need for this patch.


Juergen


--------------A427817A38666E490C6069FB
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

--------------A427817A38666E490C6069FB--

--5windFdbY919aeLwnnvFDDlYv8vQI5ROv--

--NFF5TYVYjkXxGTm1P7LrRVHjTR0sLkBga
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmA9ye4FAwAAAAAACgkQsN6d1ii/Ey9H
qQf/b+gKtN2eeSBenccE1vlTHjfoLUQ/PePp8lHGU5LA3X4QP5mT0vp9a3/qBWzhV/1LlhE50q8m
55LSdPuqGJ4wbRdu14M3FHrhHdZ/NE2Zi+dxBkawb8FAkzO29Cchi+4+FqaufVzZR8ZuHpz8jkfG
+UijdMXvfCW/hceJYes3y+nO5+eqS2ymXCuVC4vz1Zsh2ewhb3ZTuRyAoQPzc4yYbgUF63pD9E8Y
rajE4yfyDyBnGM5ecFC5GZeOLvPgB6mNAu5GL2e7AfHFsoB4kYrCbHl0Nz4daSCfFicqEGOqzm/g
mOdCkcGR66niJHP+XSoHn06x3NHHHqcdCmvZQfiiag==
=5aEa
-----END PGP SIGNATURE-----

--NFF5TYVYjkXxGTm1P7LrRVHjTR0sLkBga--

