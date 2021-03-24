Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE32347ACD
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 15:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101038.192902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP4Zq-0003HQ-T0; Wed, 24 Mar 2021 14:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101038.192902; Wed, 24 Mar 2021 14:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP4Zq-0003H1-Pn; Wed, 24 Mar 2021 14:33:42 +0000
Received: by outflank-mailman (input) for mailman id 101038;
 Wed, 24 Mar 2021 14:33:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jyEQ=IW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lP4Zp-0003Gw-M0
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 14:33:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 672a35e8-a348-4e98-8b7a-962e36718b72;
 Wed, 24 Mar 2021 14:33:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED58DAD71;
 Wed, 24 Mar 2021 14:33:39 +0000 (UTC)
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
X-Inumbo-ID: 672a35e8-a348-4e98-8b7a-962e36718b72
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616596420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e7O6wYBwRTWDHH+9K25PLF7adhliAliaratZDYHJsoE=;
	b=Z9JubgCgL/uCyjyt+lnI0P0x0mChc245CB8mHbDMm6DbSEEt/KjyPr0mQ5tAWgGk1R/3ki
	Bz22jfhDPL8FFaGLB5YMXGM2H84j8Xdl5vtECrfgbEzuWkG0jU3uzAR0wUHJ7OKx9tfVAS
	WRjApHQv/a7FSceqZ4GcYs/qv/jo00A=
Subject: Re: [PATCH-for-4.15 V2] tools/libs/store: tidy up libxenstore
 interface
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210324113035.32691-1-jgross@suse.com>
 <043461f3-9b5e-7d29-bc52-275d663579c9@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <88a63fe9-e752-285d-3a3f-f00db02df980@suse.com>
Date: Wed, 24 Mar 2021 15:33:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <043461f3-9b5e-7d29-bc52-275d663579c9@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dLZiR1TFE3jfV6P41ejYBDaHLjeh8d2cW"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dLZiR1TFE3jfV6P41ejYBDaHLjeh8d2cW
Content-Type: multipart/mixed; boundary="0s4sHMYbdtnWM6dNywJ84eBya1rvwbwJ3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <88a63fe9-e752-285d-3a3f-f00db02df980@suse.com>
Subject: Re: [PATCH-for-4.15 V2] tools/libs/store: tidy up libxenstore
 interface
References: <20210324113035.32691-1-jgross@suse.com>
 <043461f3-9b5e-7d29-bc52-275d663579c9@xen.org>
In-Reply-To: <043461f3-9b5e-7d29-bc52-275d663579c9@xen.org>

--0s4sHMYbdtnWM6dNywJ84eBya1rvwbwJ3
Content-Type: multipart/mixed;
 boundary="------------39B79158E291CA851F0A7E61"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------39B79158E291CA851F0A7E61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.03.21 15:09, Julien Grall wrote:
> Hi Juergen,
>=20
> On 24/03/2021 11:30, Juergen Gross wrote:
>> xenstore_lib.h is in need to be tidied up a little bit:
>>
>> - the definition of struct xs_tdb_record_hdr shouldn't be here
>> - some symbols are not namespaced correctly
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2: minimal variant (Ian Jackson)
>> ---
>> =C2=A0 tools/include/xenstore_lib.h=C2=A0=C2=A0=C2=A0=C2=A0 | 17 ++++-=
------------
>> =C2=A0 tools/libs/store/libxenstore.map |=C2=A0 6 +++---
>> =C2=A0 tools/libs/store/xs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 12 ++++++------
>> =C2=A0 tools/xenstore/utils.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
>> =C2=A0 tools/xenstore/xenstore_client.c | 12 ++++++------
>> =C2=A0 5 files changed, 30 insertions(+), 28 deletions(-)
>>
>> diff --git a/tools/include/xenstore_lib.h b/tools/include/xenstore_lib=
=2Eh
>> index 4c9b6d1685..f74ad7024b 100644
>> --- a/tools/include/xenstore_lib.h
>> +++ b/tools/include/xenstore_lib.h
>> @@ -43,15 +43,6 @@ struct xs_permissions
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum xs_perm_type perms;
>> =C2=A0 };
>> -/* Header of the node record in tdb. */
>> -struct xs_tdb_record_hdr {
>> -=C2=A0=C2=A0=C2=A0 uint64_t generation;
>> -=C2=A0=C2=A0=C2=A0 uint32_t num_perms;
>> -=C2=A0=C2=A0=C2=A0 uint32_t datalen;
>> -=C2=A0=C2=A0=C2=A0 uint32_t childlen;
>> -=C2=A0=C2=A0=C2=A0 struct xs_permissions perms[0];
>> -};
>> -
>> =C2=A0 /* Each 10 bits takes ~ 3 digits, plus one, plus one for nul=20
>> terminator. */
>> =C2=A0 #define MAX_STRLEN(x) ((sizeof(x) * CHAR_BIT + CHAR_BIT-1) / 10=
 * 3=20
>> + 2)
>> @@ -78,18 +69,18 @@ bool xs_perm_to_string(const struct xs_permissions=
=20
>> *perm,
>> =C2=A0 unsigned int xs_count_strings(const char *strings, unsigned int=
 len);
>> =C2=A0 /* Sanitising (quoting) possibly-binary strings. */
>> -struct expanding_buffer {
>> +struct xs_expanding_buffer {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *buf;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int avail;
>> =C2=A0 };
>> =C2=A0 /* Ensure that given expanding buffer has at least min_avail=20
>> characters. */
>> -char *expanding_buffer_ensure(struct expanding_buffer *, int min_avai=
l);
>> +char *xs_expanding_buffer_ensure(struct xs_expanding_buffer *, int=20
>> min_avail);
>> =C2=A0 /* sanitise_value() may return NULL if malloc fails. */
>> -char *sanitise_value(struct expanding_buffer *, const char *val,=20
>> unsigned len);
>> +char *xs_sanitise_value(struct xs_expanding_buffer *, const char=20
>> *val, unsigned len);
>> =C2=A0 /* *out_len_r on entry is ignored; out must be at least strlen(=
in)+1=20
>> bytes. */
>> -void unsanitise_value(char *out, unsigned *out_len_r, const char *in)=
;
>> +void xs_unsanitise_value(char *out, unsigned *out_len_r, const char=20
>> *in);
>> =C2=A0 #endif /* XENSTORE_LIB_H */
>> diff --git a/tools/libs/store/libxenstore.map=20
>> b/tools/libs/store/libxenstore.map
>> index 9854305a2c..fc1c213f13 100644
>> --- a/tools/libs/store/libxenstore.map
>> +++ b/tools/libs/store/libxenstore.map
>> @@ -42,8 +42,8 @@ VERS_3.0.3 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xs_strings_to_p=
erms;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xs_perm_to_stri=
ng;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xs_count_string=
s;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 expanding_buffer_ensure;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sanitise_value;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsanitise_value;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xs_expanding_buffer_ensure=
;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xs_sanitise_value;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xs_unsanitise_value;
>=20
> Isn't libxenstore considered stable? If so, shouldn't we bump the=20
> version to avoid any breakage for existing app?

See https://lists.xen.org/archives/html/xen-devel/2021-03/msg01267.html


Juergen


--------------39B79158E291CA851F0A7E61
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

--------------39B79158E291CA851F0A7E61--

--0s4sHMYbdtnWM6dNywJ84eBya1rvwbwJ3--

--dLZiR1TFE3jfV6P41ejYBDaHLjeh8d2cW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBbTcMFAwAAAAAACgkQsN6d1ii/Ey+t
KAgAj092oOEHz/FWoRO4HUJW0a9WRurCdKFlUPqLoCG418vEHH64ijlDBOWhvL+Z8wl9FFcyL1BQ
MeuGzVvyh7tgjmPVus4r7G7bDpJXThIclacLjXS8Nrlyn/LWnPZsky+k9iLOa2t5pt01TrSQmxd9
AXTQzVb8I0q4fLKmgFb9FWRmm5O+uvUlXI9KTwHQNZrgNWz+Yqv/2Kiu9V9dlqAmYBdJIR2opbAw
03NtZxDcp2Oyg308uUoGaxeVBaR4gYUyFSsUQCu/rsV5iumP7vG39UsKf56RkvnoQaMZqbwNENWV
SbP7kNuMn3D28wlvDCqEZiv7JcAI9GlhGJ5kROCMow==
=P/KB
-----END PGP SIGNATURE-----

--dLZiR1TFE3jfV6P41ejYBDaHLjeh8d2cW--

