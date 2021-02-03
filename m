Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BD30D356
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 07:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80811.148025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7BVA-0002s9-Io; Wed, 03 Feb 2021 06:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80811.148025; Wed, 03 Feb 2021 06:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7BVA-0002rk-Fn; Wed, 03 Feb 2021 06:18:56 +0000
Received: by outflank-mailman (input) for mailman id 80811;
 Wed, 03 Feb 2021 06:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l7BV9-0002pp-4C
 for xen-devel@lists.xen.org; Wed, 03 Feb 2021 06:18:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daf6892a-fbc7-458b-a8fd-3d62486c466a;
 Wed, 03 Feb 2021 06:18:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8805CAC55;
 Wed,  3 Feb 2021 06:18:52 +0000 (UTC)
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
X-Inumbo-ID: daf6892a-fbc7-458b-a8fd-3d62486c466a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612333132; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=agnCdG+yE8W9o2rLyktiMQiKSvmoPTMMb/dtschoNQU=;
	b=mnoXJs8GYbKWEG8XhWIZvzAnHaTUEDDEZM5zZUlhoPxgkCEbFv5Xa/qtrezaBeOKSwR33s
	6UiBx8WL9SmZlidXQwkHhvP3SsbUKMeeMOiZHkfy4Faq03gA0zLzHSGKaGsn7NS/jj2PHB
	dQKgwG/vTw1/GtQL6YelQ4tfVEIwVkw=
To: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xen.org
References: <20210202183735.GA25046@mail.soc.lip6.fr>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: xenstored file descriptor leak
Message-ID: <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
Date: Wed, 3 Feb 2021 07:18:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210202183735.GA25046@mail.soc.lip6.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HMyAnnFbcawsWSY5v1w65020AJa86Xat5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HMyAnnFbcawsWSY5v1w65020AJa86Xat5
Content-Type: multipart/mixed; boundary="UBpALOHG4koNejao7WISFnVg2yKlct4lY";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Manuel Bouyer <bouyer@antioche.eu.org>, xen-devel@lists.xen.org
Message-ID: <b6ed10d4-7976-6a61-434d-35e467763deb@suse.com>
Subject: Re: xenstored file descriptor leak
References: <20210202183735.GA25046@mail.soc.lip6.fr>
In-Reply-To: <20210202183735.GA25046@mail.soc.lip6.fr>

--UBpALOHG4koNejao7WISFnVg2yKlct4lY
Content-Type: multipart/mixed;
 boundary="------------F325049DE409B717F4744AFE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F325049DE409B717F4744AFE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.02.21 19:37, Manuel Bouyer wrote:
> Hello,
> on NetBSD I'm tracking down an issue where xenstored never closes its
> file descriptor to /var/run/xenstored/socket and instead loops at 100%
> CPU on these descriptors.
>=20
> xenstored loops because poll(2) returns a POLLIN event for these
> descriptors but they are marked is_ignored =3D true.
>=20
> I'm seeing this with xen 4.15, 4.13 and has also been reported with 4.1=
1
> with latest security patches.
> It seems to have started with patches for XSA-115 (A user reported this=

> for 4.11)
>=20
> I've tracked it down to a difference in poll(2) implementation; it seem=
s
> that linux will return something that is not (POLLIN|POLLOUT) when a
> socket if closed; while NetBSD returns POLLIN (this matches the NetBSD'=
s
> man page).

Yeah, Linux seems to return POLLHUP additionally.

>=20
> First I think there may be a security issue here, as, even on linux it =
should
> be possible for a client to cause a socket to go to the is_ignored stat=
e,
> while still sending data and cause xenstored to go to a 100% CPU loop.

No security issue, as sockets are restricted to dom0 and user root.

In case you are suspecting a security issue, please don't send such
mails to xen-devel in future, but to security@lists.xenproject.org.

> I think this is needed anyway:
>=20
> --- xenstored_core.c.orig	2021-02-02 18:06:33.389316841 +0100
> +++ xenstored_core.c	2021-02-02 19:27:43.761877371 +0100
> @@ -397,9 +397,12 @@
>   			     !list_empty(&conn->out_list)))
>   				*ptimeout =3D 0;
>   		} else {
> -			short events =3D POLLIN|POLLPRI;
> -			if (!list_empty(&conn->out_list))
> -				events |=3D POLLOUT;
> +			short events =3D 0;
> +			if (!conn->is_ignored) {
> +				events |=3D POLLIN|POLLPRI;
> +			        if (!list_empty(&conn->out_list))
> +				        events |=3D POLLOUT;
> +			}
>   			conn->pollfd_idx =3D set_fd(conn->fd, events);
>   		}
>   	}

Yes, I think this is a good idea.

>=20
> Now I wonder if, on NetBSD at last, a read error or short read shouldn'=
t
> cause the socket to be closed, as with:
>=20
> @@ -1561,6 +1565,8 @@
>  =20
>   bad_client:
>   	ignore_connection(conn);
> +	/* we don't want to keep this connection alive */
> +	talloc_free(conn);
>   }

This is wrong for non-socket connections, as we want to keep the domain
in question to be known to xenstored.

For socket connections this should be okay, though.


Juergen

--------------F325049DE409B717F4744AFE
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

--------------F325049DE409B717F4744AFE--

--UBpALOHG4koNejao7WISFnVg2yKlct4lY--

--HMyAnnFbcawsWSY5v1w65020AJa86Xat5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAaQEsFAwAAAAAACgkQsN6d1ii/Ey+B
jAf9Fz6myhY1UgusTb2PWf+t5daZaqpwtjBZ4920cO0r0kc1S5x7jaje9bVxxE2KrqqW3ofxqPAP
JP7H/mqJ2pm9HjHkbsKrDxRkaxMFLlSOdTQHnpkrVsD7CSwNimvU7VlfyIAb9xbIQoTRo3HRfDO8
UHPdhCQK25hUoOWnnGALkD7wyDu/cceS8oChGJVg4Ro8GTHFzkDl15g7NHym1M/Gg8tNwFe/abt8
x9IT3aLWdVcfSK8lLjWxDpznnrsiqRfUbxarO1eJBjFFFeMkBzXRYJThk7VcSl5BQVvvIqtOTVNy
Jxl0lDgEpMVzyPtRhbdeOZ7/BddwShWrfe/we2qYSg==
=N/Qe
-----END PGP SIGNATURE-----

--HMyAnnFbcawsWSY5v1w65020AJa86Xat5--

