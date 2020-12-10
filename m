Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103582D5AD0
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 13:47:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49173.86929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLL3-0007ok-5u; Thu, 10 Dec 2020 12:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49173.86929; Thu, 10 Dec 2020 12:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knLL3-0007oP-2X; Thu, 10 Dec 2020 12:46:29 +0000
Received: by outflank-mailman (input) for mailman id 49173;
 Thu, 10 Dec 2020 12:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PZm+=FO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1knLL1-0007oK-Sv
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 12:46:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 770a3515-c483-4872-b784-f47c18e08da4;
 Thu, 10 Dec 2020 12:46:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C67D7AC6A;
 Thu, 10 Dec 2020 12:46:25 +0000 (UTC)
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
X-Inumbo-ID: 770a3515-c483-4872-b784-f47c18e08da4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607604385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r/j7GBPPiVnxEH4aiu/iyhUaMmpI/TnCPrfRtBRKQus=;
	b=HxZe91PG71iaDbz96cYhAe0io14GXqOZG89jsrgv58zOZ8K2yTzm+e/IEB17ohZ0N8nSwE
	chg0wf9uEHlFPd+ePBJBefzOvoid27qmWNMTNW23XEHIE0Y3OzBS8GWH75Bz5s8g7zQlhh
	JOBgcbdhFpexzs+PuiOS5r3HeDmYzNc=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201209161618.309-1-jgross@suse.com>
 <20201209161618.309-3-jgross@suse.com>
 <75232058-4626-80cb-6f71-4ce5253f3ef6@xen.org>
 <8ec5f4f5-4314-9c4d-45f0-1f4686028a82@suse.com>
 <e4fde734-b353-d885-95e8-0ea9c2210994@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH RFC 2/3] xen/domain: add domain hypfs directories
Message-ID: <db24e3f3-c360-1801-ec8a-ca1b948633fa@suse.com>
Date: Thu, 10 Dec 2020 13:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e4fde734-b353-d885-95e8-0ea9c2210994@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AuAjU2w8QFAuDpLnz5M6PEC2EIASVAMsB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AuAjU2w8QFAuDpLnz5M6PEC2EIASVAMsB
Content-Type: multipart/mixed; boundary="DKhSRLXbICi9FruhPkiwYvhFL0Fd7uOr3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <db24e3f3-c360-1801-ec8a-ca1b948633fa@suse.com>
Subject: Re: [PATCH RFC 2/3] xen/domain: add domain hypfs directories
References: <20201209161618.309-1-jgross@suse.com>
 <20201209161618.309-3-jgross@suse.com>
 <75232058-4626-80cb-6f71-4ce5253f3ef6@xen.org>
 <8ec5f4f5-4314-9c4d-45f0-1f4686028a82@suse.com>
 <e4fde734-b353-d885-95e8-0ea9c2210994@xen.org>
In-Reply-To: <e4fde734-b353-d885-95e8-0ea9c2210994@xen.org>

--DKhSRLXbICi9FruhPkiwYvhFL0Fd7uOr3
Content-Type: multipart/mixed;
 boundary="------------BEE83DB8BBEA45535CB2F7EF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BEE83DB8BBEA45535CB2F7EF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.12.20 12:51, Julien Grall wrote:
>=20
>=20
> On 10/12/2020 07:54, J=C3=BCrgen Gro=C3=9F wrote:
>> On 09.12.20 17:37, Julien Grall wrote:
>>>> =C2=A0 only the syntax used in this document):
>>>> =C2=A0 * STRING -- an arbitrary 0-delimited byte string.
>>>> @@ -191,6 +192,15 @@ The scheduling granularity of a cpupool.
>>>> =C2=A0 Writing a value is allowed only for cpupools with no cpu assi=
gned=20
>>>> and if the
>>>> =C2=A0 architecture is supporting different scheduling granularities=
=2E
>>>
>>> [...]
>>>
>>>> +
>>>> +static int domain_dir_read(const struct hypfs_entry *entry,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 XEN_GUEST_HANDLE_PARAM(void) uaddr)
>>>> +{
>>>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>>> +=C2=A0=C2=A0=C2=A0 const struct domain *d;
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 for_each_domain ( d )
>>>
>>> This is definitely going to be an issue if you have a lot of domain=20
>>> running as Xen is not preemptible.
>>
>> In general this is correct, but in this case I don't think it will
>> be a problem. The execution time for each loop iteration should be
>> rather short (in the microsecond range?), so even with 32000 guests
>> we would stay way below one second.
>=20
> The scheduling slice are usually in ms and not second (yet this will=20
> depend on your scheduler). It would be unacceptable to me if another=20
> vCPU cannot run for a second because dom0 is trying to list the domain =

> via HYPFS.

Okay, I did a test.

The worrying operation is the reading of /domain/ with lots of domains.

"xenhypfs ls /domain" with 500 domains running needed 231 us of real
time for the library call, while "xenhypfs ls /" needed about 70 us.
This makes 3 domains per usec, resulting in about 10 msecs with 30000
domains.


Juergen

--------------BEE83DB8BBEA45535CB2F7EF
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

--------------BEE83DB8BBEA45535CB2F7EF--

--DKhSRLXbICi9FruhPkiwYvhFL0Fd7uOr3--

--AuAjU2w8QFAuDpLnz5M6PEC2EIASVAMsB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/SGKEFAwAAAAAACgkQsN6d1ii/Ey8h
WAf8CU0N8nIBIkZBz9JhztleGaMwMpyEtiZ5ssjH1PV7frCN65YW2wFUFaiRzXKsda4H3VxmF+sU
3iBYfHLkAoQVjBKJ2FkjibxJiKt9KJ/i2eHikntlaM+unphRFOM+S0FMZLZY6HnfInRMoYbWrw5I
+GiVdLi24ixQLN9a75f5JKI633S3eJrhP1p3oDk55pOvRWpwgEfTzUZ62LqB6rjWgjg/y+IqNRxv
2gbMxjX8jsW3s8SHFPxYaLw1EbtPfxwNI065FaJpF4CIc3lCEov6yC9fs2iMC6+Pm4bhs0YdejJx
CC4XQihAPgjMJ8jOidt2l7Ms8F7VzrupySVi4lsdag==
=FeCT
-----END PGP SIGNATURE-----

--AuAjU2w8QFAuDpLnz5M6PEC2EIASVAMsB--

