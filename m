Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272D30D49D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 09:05:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80836.148120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7DAP-0006GV-Ft; Wed, 03 Feb 2021 08:05:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80836.148120; Wed, 03 Feb 2021 08:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7DAP-0006G9-Ce; Wed, 03 Feb 2021 08:05:37 +0000
Received: by outflank-mailman (input) for mailman id 80836;
 Wed, 03 Feb 2021 08:05:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l7DAN-0006G2-3i
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 08:05:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 594fd395-f28e-42d3-9d82-85847e2e7629;
 Wed, 03 Feb 2021 08:05:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 348ECAF24;
 Wed,  3 Feb 2021 08:05:28 +0000 (UTC)
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
X-Inumbo-ID: 594fd395-f28e-42d3-9d82-85847e2e7629
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612339528; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Z6kPXkuN8m7pIKyFSb5tGREEclWYqoG0xjVfACj8I8=;
	b=dk5+hduupkfuSUa/luTB3/rC/wcLKmonXMzX24zP3Th67HbjJsNPacHyKKu4m+dk1VWiF3
	Y3dtyu1+nwOwoMciX+FSkLcnMyNjUgJlbxzFSM6YBEnBpi0cjkTYQ3PAQSRPs4V5z9kdve
	Dnm/as7sDNaAQn0FMfar2Dva6KPqHs4=
Subject: Re: xenstored file descriptor leak
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xen.org
References: <20210202183735.GA25046@mail.soc.lip6.fr>
 <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
 <20210203075721.GB445@antioche.eu.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
Date: Wed, 3 Feb 2021 09:05:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203075721.GB445@antioche.eu.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4Lnc8Y4g91tVWddJRcZrPfwplW8y75FBS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4Lnc8Y4g91tVWddJRcZrPfwplW8y75FBS
Content-Type: multipart/mixed; boundary="RA2N4GBVvqpx24PKjb7syDgT0H04rTt7e";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xen.org
Message-ID: <7768ff4b-837d-965b-61c7-b6794f677d9e@suse.com>
Subject: Re: xenstored file descriptor leak
References: <20210202183735.GA25046@mail.soc.lip6.fr>
 <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
 <20210203075721.GB445@antioche.eu.org>
In-Reply-To: <20210203075721.GB445@antioche.eu.org>

--RA2N4GBVvqpx24PKjb7syDgT0H04rTt7e
Content-Type: multipart/mixed;
 boundary="------------C09EFC4B4FCE120EFDC7B722"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C09EFC4B4FCE120EFDC7B722
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.02.21 08:57, Manuel Bouyer wrote:
> On Wed, Feb 03, 2021 at 07:18:51AM +0100, J=C3=BCrgen Gro=C3=9F wrote:
>> On 02.02.21 19:37, Manuel Bouyer wrote:
>>> Hello,
>>> on NetBSD I'm tracking down an issue where xenstored never closes its=

>>> file descriptor to /var/run/xenstored/socket and instead loops at 100=
%
>>> CPU on these descriptors.
>>>
>>> xenstored loops because poll(2) returns a POLLIN event for these
>>> descriptors but they are marked is_ignored =3D true.
>>>
>>> I'm seeing this with xen 4.15, 4.13 and has also been reported with 4=
=2E11
>>> with latest security patches.
>>> It seems to have started with patches for XSA-115 (A user reported th=
is
>>> for 4.11)
>>>
>>> I've tracked it down to a difference in poll(2) implementation; it se=
ems
>>> that linux will return something that is not (POLLIN|POLLOUT) when a
>>> socket if closed; while NetBSD returns POLLIN (this matches the NetBS=
D's
>>> man page).
>>
>> Yeah, Linux seems to return POLLHUP additionally.
>=20
> Overall, it seems that the poll(2) behavior with non-regular files
> is highly OS-dependant when it comes to border cases (like a remote
> close of a socket)
>=20
>>
>>>
>>> First I think there may be a security issue here, as, even on linux i=
t should
>>> be possible for a client to cause a socket to go to the is_ignored st=
ate,
>>> while still sending data and cause xenstored to go to a 100% CPU loop=
=2E
>>
>> No security issue, as sockets are restricted to dom0 and user root.
>>
>> In case you are suspecting a security issue, please don't send such
>> mails to xen-devel in future, but to security@lists.xenproject.org.
>=20
> Yes, sorry. Will do next time.
>=20
>>
>>> I think this is needed anyway:
>>>
>>> --- xenstored_core.c.orig	2021-02-02 18:06:33.389316841 +0100
>>> +++ xenstored_core.c	2021-02-02 19:27:43.761877371 +0100
>>> @@ -397,9 +397,12 @@
>>>    			     !list_empty(&conn->out_list)))
>>>    				*ptimeout =3D 0;
>>>    		} else {
>>> -			short events =3D POLLIN|POLLPRI;
>>> -			if (!list_empty(&conn->out_list))
>>> -				events |=3D POLLOUT;
>>> +			short events =3D 0;
>>> +			if (!conn->is_ignored) {
>>> +				events |=3D POLLIN|POLLPRI;
>>> +			        if (!list_empty(&conn->out_list))
>>> +				        events |=3D POLLOUT;
>>> +			}
>>>    			conn->pollfd_idx =3D set_fd(conn->fd, events);
>>>    		}
>>>    	}
>>
>> Yes, I think this is a good idea.
>=20
> Well, after some sleep I don't think it is. We should always keep at la=
st
> POLLIN or we will never notice a socket close otherwise.

Adding the fd of an ignored socket connection to the list is the real
problem here. Why should that be done?

>=20
>>
>>>
>>> Now I wonder if, on NetBSD at last, a read error or short read should=
n't
>>> cause the socket to be closed, as with:
>>>
>>> @@ -1561,6 +1565,8 @@
>>>    bad_client:
>>>    	ignore_connection(conn);
>>> +	/* we don't want to keep this connection alive */
>>> +	talloc_free(conn);
>>>    }
>>
>> This is wrong for non-socket connections, as we want to keep the domai=
n
>> in question to be known to xenstored.
>>
>> For socket connections this should be okay, though.
>=20
> What are "non-socket connections" BTW ? I don't think I've seen one
> in my test.

Every connection to another domain.

> Is there a way to know if a connection is socket or non-socket ?

Active socket connections have conn->fd >=3D 0.


Juergen

--------------C09EFC4B4FCE120EFDC7B722
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

--------------C09EFC4B4FCE120EFDC7B722--

--RA2N4GBVvqpx24PKjb7syDgT0H04rTt7e--

--4Lnc8Y4g91tVWddJRcZrPfwplW8y75FBS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAaWUcFAwAAAAAACgkQsN6d1ii/Ey9J
+ggAnpPLADVSK1szGiSR9UYn1kL6TjcqB7maaRZtdx5pd42zn/bZfLnGS0MITNVfhPGPieyUPfai
dXshjfwKqHwpH8nVtlo4xwrvmgpXifqw7f26zCrdjG13UdzQuh+Z64frJ4W1Qb/IN58lbcT0I4h7
8lZ4DW5LtT8p0kb9g9f2c1dmAo14ATobeBZyZcKWix6MxjiX4/uDGSVyKduYaTfw2sSelKteGEYM
aNtGnbvcIZO+7WttYy8tNDalew1ma8gtlhUU3MCkCrxMzrKwqvtzVtwl6xKWyCsd/X+HDzjVtC8I
xZ4zr+QNHQbspAaW09ZOR78C+fNUyloJPEXGDRnYRA==
=giSS
-----END PGP SIGNATURE-----

--4Lnc8Y4g91tVWddJRcZrPfwplW8y75FBS--

