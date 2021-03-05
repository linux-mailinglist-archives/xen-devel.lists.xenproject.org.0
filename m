Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66532ED84
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 15:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93808.177153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBru-0001LH-02; Fri, 05 Mar 2021 14:55:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93808.177153; Fri, 05 Mar 2021 14:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIBrt-0001Kt-Sp; Fri, 05 Mar 2021 14:55:53 +0000
Received: by outflank-mailman (input) for mailman id 93808;
 Fri, 05 Mar 2021 14:55:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XWNu=ID=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lIBrs-0001Km-7D
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 14:55:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db4daecf-010d-473c-9070-db0d49d89970;
 Fri, 05 Mar 2021 14:55:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C2F0AE85;
 Fri,  5 Mar 2021 14:55:50 +0000 (UTC)
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
X-Inumbo-ID: db4daecf-010d-473c-9070-db0d49d89970
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614956150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JlmVnUdfqpPlY5D2J/A/rW5yGaXaU1QP08qiofZ/ntY=;
	b=UZEUXRFLyo2/uaGp9zHomDhomedlEC7/qKUYDJ7359CffX+1jvgL1mplGs/J/EgYoELjQy
	oC4n1Loiea9k4Y+LYbzRPFscDSzf4QP3lsHrTJVy6ULORvXScjsKZvbC9yc+OjllAW2PPh
	FaFqXg6nVP3WOicxp2CdWHuVJuyPCWg=
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the
 maximum number of parameters
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, raphning@amazon.co.uk,
 Julien Grall <jgrall@amazon.com>
References: <20210305121029.7047-1-julien@xen.org>
 <24642.12417.651929.972294@mariner.uk.xensource.com>
 <eb65580f-0b6b-717c-f599-73dc32d790cf@suse.com>
 <24642.16967.563767.105312@mariner.uk.xensource.com>
 <817a49d7-5f11-e53f-5bf5-55d22b157bec@suse.com>
 <24642.17467.425438.233285@mariner.uk.xensource.com>
 <24642.17658.843482.352849@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b9435aa0-e47c-85ad-558e-cfa7adeb2a4a@suse.com>
Date: Fri, 5 Mar 2021 15:55:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24642.17658.843482.352849@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XLKtTpvcC8ftJfvlvJ9HoZDm1e7dp0NKB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XLKtTpvcC8ftJfvlvJ9HoZDm1e7dp0NKB
Content-Type: multipart/mixed; boundary="dYnWJC0exz3qXt5xXFK3UG2eVNulXQeZN";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, raphning@amazon.co.uk,
 Julien Grall <jgrall@amazon.com>
Message-ID: <b9435aa0-e47c-85ad-558e-cfa7adeb2a4a@suse.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the
 maximum number of parameters
References: <20210305121029.7047-1-julien@xen.org>
 <24642.12417.651929.972294@mariner.uk.xensource.com>
 <eb65580f-0b6b-717c-f599-73dc32d790cf@suse.com>
 <24642.16967.563767.105312@mariner.uk.xensource.com>
 <817a49d7-5f11-e53f-5bf5-55d22b157bec@suse.com>
 <24642.17467.425438.233285@mariner.uk.xensource.com>
 <24642.17658.843482.352849@mariner.uk.xensource.com>
In-Reply-To: <24642.17658.843482.352849@mariner.uk.xensource.com>

--dYnWJC0exz3qXt5xXFK3UG2eVNulXQeZN
Content-Type: multipart/mixed;
 boundary="------------0598BDE6253E476000556D85"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0598BDE6253E476000556D85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05.03.21 15:49, Ian Jackson wrote:
> Ian Jackson writes ("Re: [PATCH for-4.15] tools/xenstored: liveupdate: =
Increase the maximum number of parameters"):
>> J=C3=BCrgen Gro=C3=9F writes ("Re: [PATCH for-4.15] tools/xenstored: l=
iveupdate: Increase the maximum number of parameters"):
>>> On 05.03.21 15:37, Ian Jackson wrote:
>>>> J=C3=BCrgen Gro=C3=9F writes ("Re: [PATCH for-4.15] tools/xenstored:=
 liveupdate: Increase the maximum number of parameters"):
>>>>> This is the max number of 0 delimited string parameters. Especially=
 the
>>>>> stubdom case needs a binary blob (with length, of course) as parame=
ter,
>>>>> and the number of 0 bytes in this data is just limited by the allow=
ed
>>>>> payload length.
>>>>>
>>>>> See the comment in line 111 of xenstored_control.c.
>>>>
>>>> AFAICT this "live-update" command is variadic.  So why is this
>>>> parameter set here it all then ?
>>>
>>> In order to avoid allocating an array for 4000 arguments when there
>>> are only 5 which need to be treated as strings.
>>
>> So this parameter is doing two jobs: 1. enabling non-variadic commands=

>> to take binary input; 2. preventing variadic commands from allocating
>> unbounded memory.
>>
>> The problem with this is that in case 1 exceeding the value is normal
>> and the final argument is binary data; whereas in case 2 glomming
>> together the arguments together with zeroes is wrong and potentially
>> hazrdous.
>>
>> I suggest we solve problem 2 by imposing a higher fixed (for all
>> commands, variadic or not) limit (20 or something) which causes errors=

>> when exceeded, rather than silent argument misinterpretation.
>=20
> Also, this use of max_pars to do job 2 seems very inconsistent.  It is
> applied only to "live-update".
>=20
> If it is necessary for "live-update", which is it not necessary for
> "check" or whatever ?

live-update is the only command with binary data. The other commands are
checking all parameters to be valid, similar to normal parameter parsing
in a main() function of a user program.


Juergen

--------------0598BDE6253E476000556D85
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

--------------0598BDE6253E476000556D85--

--dYnWJC0exz3qXt5xXFK3UG2eVNulXQeZN--

--XLKtTpvcC8ftJfvlvJ9HoZDm1e7dp0NKB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBCRnUFAwAAAAAACgkQsN6d1ii/Ey8z
lAf/T/YKikRuBHGzTy2oXpA/wnsW+KfyOFyiOjCq4zO8+uECBLy3LEOkhhxAOX3cKWkhbvoBxWaL
Cw6hkEzNAfAeUCgGSYncgISL7+0fmbC7ikix0WQlow+F4RTZXmkqvSwFQVYXS46Kxo27Q+7AM9Jo
D5Kq7zAwfVRszf0jWZX9rAXTfcY2n/9lKg8HMdxr7nWFZwi4OS2Si0eZ/cLNiKksSS1Y95D8Qa+b
wHgppO3UzAMprVK1cyj2jZEyBrICw+eaORyaJdWX0EeqayfRZAhnEpxa2D5zN/vNIg0WsrW6jHS2
xx19J2mFdV6urukkaHBVcCF2ezrqxLkzbgDg9vchEQ==
=1RVa
-----END PGP SIGNATURE-----

--XLKtTpvcC8ftJfvlvJ9HoZDm1e7dp0NKB--

