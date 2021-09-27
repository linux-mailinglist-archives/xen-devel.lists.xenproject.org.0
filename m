Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1121D4190AA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 10:20:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.196498.349364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlsP-0006DE-0W; Mon, 27 Sep 2021 08:20:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 196498.349364; Mon, 27 Sep 2021 08:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUlsO-0006BA-Tj; Mon, 27 Sep 2021 08:20:40 +0000
Received: by outflank-mailman (input) for mailman id 196498;
 Mon, 27 Sep 2021 08:20:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eI72=OR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mUlsN-0006B2-6Q
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 08:20:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb6e9c60-1f6b-11ec-bc42-12813bfff9fa;
 Mon, 27 Sep 2021 08:20:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6930F1FF54;
 Mon, 27 Sep 2021 08:20:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 53A5913A42;
 Mon, 27 Sep 2021 08:20:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dl41E9V+UWFgSQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Sep 2021 08:20:37 +0000
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
X-Inumbo-ID: cb6e9c60-1f6b-11ec-bc42-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632730837; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+2pgmZ9PBvLLM0BIolHE/Tn+LBvVRbm1JLOt9XmsCMc=;
	b=j4Hgc7x75S6IBvzp4fm/pWg3FAobqB402nnZtY9SW3tSpr68Mcyw7WOcrjr1+bclAQKcZm
	QOiYM0/g6ypszovQ9xeeLmAydwRIz4SquDa6rh7datt+4ppUCHyoGPN9GVXuOOiFqmEbdj
	Br8n1LKYbjkD7QcBlYuR9LW3POA5wVw=
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20210924150424.10047-1-jgross@suse.com>
 <20210924150424.10047-2-jgross@suse.com>
 <8d9f549c-108f-17a8-e8f3-fb9b52442d5f@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/2] include/public: add possible status values to usbif.h
Message-ID: <28a9b815-0903-a06c-1b17-4aeceb3604f5@suse.com>
Date: Mon, 27 Sep 2021 10:20:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8d9f549c-108f-17a8-e8f3-fb9b52442d5f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xpwh3UHZK6BgyEDnDPX0bKDMeqSKSvmLL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xpwh3UHZK6BgyEDnDPX0bKDMeqSKSvmLL
Content-Type: multipart/mixed; boundary="Knre5ARVZOlZWr52fSLknyf3PAa8097Uz";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <28a9b815-0903-a06c-1b17-4aeceb3604f5@suse.com>
Subject: Re: [PATCH 1/2] include/public: add possible status values to usbif.h
References: <20210924150424.10047-1-jgross@suse.com>
 <20210924150424.10047-2-jgross@suse.com>
 <8d9f549c-108f-17a8-e8f3-fb9b52442d5f@suse.com>
In-Reply-To: <8d9f549c-108f-17a8-e8f3-fb9b52442d5f@suse.com>

--Knre5ARVZOlZWr52fSLknyf3PAa8097Uz
Content-Type: multipart/mixed;
 boundary="------------7ED7949F2496B598604B06CA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7ED7949F2496B598604B06CA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.09.21 10:13, Jan Beulich wrote:
> On 24.09.2021 17:04, Juergen Gross wrote:
>> The interface definition of PV USB devices is lacking the specificatio=
n
>> of possible values of the status filed in a response. Those are
>=20
> Nit: "field"?

Yes, of course.

>=20
>> negative errno values as used in Linux, so they might differ in other
>> OS's. Specify them via appropriate defines.
>=20
> What if new errno values got used by the driver? Would we alter the
> public header every time? Or is the likelihood of further values ever
> getting used vanishingly small? In how far would it be possible to tie
> these to Xen's public/errno.h instead?

Those are the current values returned by the backend. Other ones used
internally in the backend should IMO tried to be mapped to the values
defined in the interface specification.

>=20
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>>   xen/include/public/io/usbif.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/include/public/io/usbif.h b/xen/include/public/io/usb=
if.h
>> index c6a58639d6..fbd6f953f8 100644
>> --- a/xen/include/public/io/usbif.h
>> +++ b/xen/include/public/io/usbif.h
>> @@ -221,6 +221,13 @@ struct usbif_urb_response {
>>   	uint16_t id; /* request id */
>>   	uint16_t start_frame;  /* start frame (ISO) */
>>   	int32_t status; /* status (non-ISO) */
>> +#define USBIF_STATUS_OK		0
>> +#define USBIF_STATUS_NODEV	-19
>> +#define USBIF_STATUS_INVAL	-22
>> +#define USBIF_STATUS_STALL	-32
>> +#define USBIF_STATUS_IOERROR	-71
>> +#define USBIF_STATUS_BABBLE	-75
>> +#define USBIF_STATUS_SHUTDOWN	-108
>=20
> Nit: While probably benign for all practical uses, these negative
> values nevertheless would better be parenthesized.

Okay, fine with me.


Juergen

--------------7ED7949F2496B598604B06CA
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

--------------7ED7949F2496B598604B06CA--

--Knre5ARVZOlZWr52fSLknyf3PAa8097Uz--

--xpwh3UHZK6BgyEDnDPX0bKDMeqSKSvmLL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFRftQFAwAAAAAACgkQsN6d1ii/Ey9M
iQf/TPJrYZRCYEoqhWblye96zNt6yP4Pc8SKl7v4bSWqbEroGNnK5/0+MPxBosFW9f3vfCPL32fK
W+fd86VgNxK+B7g3wkAOmURhwFQeMg4BD+/9Oz5ZwMsxMjAOPhLVa5r97ZvMQ+QHBjetHHMN9fIa
m/y1P4FrAZ8h7g9aVq9osj8Y0ZK+z73vV7gIx5dS4A+KBH4klZPr+pWLLyxOSXzcaoXtJqmRArWc
BkfgRqfiK9WbOn5Gn9W3n63luJYgtJEBq+QJRV5ktYHyoouhh7AUqxOlxOxuFcUaywtZJhFARbT7
w0Ao+O2/U/d91NQDaOnOeBo5F24NEmeZUbxSKKmKSw==
=ZvU2
-----END PGP SIGNATURE-----

--xpwh3UHZK6BgyEDnDPX0bKDMeqSKSvmLL--

