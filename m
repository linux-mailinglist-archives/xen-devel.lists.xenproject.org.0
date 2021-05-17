Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FA3823F2
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 08:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128030.240447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liWPa-00044s-Da; Mon, 17 May 2021 06:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128030.240447; Mon, 17 May 2021 06:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liWPa-000426-AI; Mon, 17 May 2021 06:07:30 +0000
Received: by outflank-mailman (input) for mailman id 128030;
 Mon, 17 May 2021 06:07:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=frGc=KM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1liWPY-000420-D6
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 06:07:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6487a78-84b3-45c7-af65-ff66772a6c66;
 Mon, 17 May 2021 06:07:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6A45B195;
 Mon, 17 May 2021 06:07:25 +0000 (UTC)
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
X-Inumbo-ID: b6487a78-84b3-45c7-af65-ff66772a6c66
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621231645; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FqLH/VtAy0PQS9wOptFGjOCuKLp7AxzOxWM+3+rSrcU=;
	b=Il8JoTICmHz+jtN/mO3kTeA5J6DZr3p3wbv8+7lQw1Oh+nWo1nlZFAIKccHsM1Ofdym0Jj
	UWBfuk3AUpYLaeL2KJboV2kpeJmJ7scfkHlEivGoIzHR9nSd/M8ZLXePdX6VqzrVGSRcGi
	dqjCI8lZoIpUSlfxUyBkepQ2uEAWjjY=
Subject: Re: [PATCH v2 1/2] tools/xenstore: move per connection read and write
 func hooks into a struct
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210514115620.32731-1-jgross@suse.com>
 <20210514115620.32731-2-jgross@suse.com>
 <7cdd7f43-3f3f-12e4-abf9-0e4d698a85b1@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <fa09bf28-8aab-b90c-b0bf-937e4867afa0@suse.com>
Date: Mon, 17 May 2021 08:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <7cdd7f43-3f3f-12e4-abf9-0e4d698a85b1@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FwFs7zGLzu17JuxcLR6sz0s90RqKhiY18"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FwFs7zGLzu17JuxcLR6sz0s90RqKhiY18
Content-Type: multipart/mixed; boundary="xVBvLyV4pfW39HtDfdXXBDOPpsXq7Mw4C";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <fa09bf28-8aab-b90c-b0bf-937e4867afa0@suse.com>
Subject: Re: [PATCH v2 1/2] tools/xenstore: move per connection read and write
 func hooks into a struct
References: <20210514115620.32731-1-jgross@suse.com>
 <20210514115620.32731-2-jgross@suse.com>
 <7cdd7f43-3f3f-12e4-abf9-0e4d698a85b1@xen.org>
In-Reply-To: <7cdd7f43-3f3f-12e4-abf9-0e4d698a85b1@xen.org>

--xVBvLyV4pfW39HtDfdXXBDOPpsXq7Mw4C
Content-Type: multipart/mixed;
 boundary="------------E04E6C0CA53741A6FB7D1439"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E04E6C0CA53741A6FB7D1439
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.05.21 18:33, Julien Grall wrote:
> Hi Juergen,
>=20
> On 14/05/2021 12:56, Juergen Gross wrote:
>> -struct connection *new_connection(connwritefn_t *write, connreadfn_t =

>> *read);
>> +struct connection *new_connection(const struct interface_funcs *funcs=
);
>> =C2=A0 struct connection *get_connection_by_id(unsigned int conn_id);
>> =C2=A0 void check_store(void);
>> =C2=A0 void corrupt(struct connection *conn, const char *fmt, ...);
>> @@ -254,10 +256,7 @@ void finish_daemonize(void);
>> =C2=A0 /* Open a pipe for signal handling */
>> =C2=A0 void init_pipe(int reopen_log_pipe[2]);
>> -int writefd(struct connection *conn, const void *data, unsigned int=20
>> len);
>> -int readfd(struct connection *conn, void *data, unsigned int len);
>> -
>> -extern struct interface_funcs socket_funcs;
>> +extern const struct interface_funcs socket_funcs;
> Shouldn't this be protected with #ifdef NO_SOCKETS?

Yes, I can add it.

>=20
> The rest looks good to me:
>=20
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Thanks,

Juergen


--------------E04E6C0CA53741A6FB7D1439
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

--------------E04E6C0CA53741A6FB7D1439--

--xVBvLyV4pfW39HtDfdXXBDOPpsXq7Mw4C--

--FwFs7zGLzu17JuxcLR6sz0s90RqKhiY18
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmCiCBwFAwAAAAAACgkQsN6d1ii/Ey9T
4gf+OXR6DXWcKVnVy18z/6VCi/61pXrNNrvKUebdrGta/86Ofmt+Y2kVbXnwP9XeXMASFJt/cr6g
aJvKvqjJtVSS7potmuro+7TRseYqHLSRz9PH38n40ATg2sacWzW7oMt+H7+owR/fXRzoCYvaKz7j
zaamTPMGJHOHjyB/FFjrmIxJFYiZuwoWK7aguHjk1Z6wEzRVm5F8YYET0o7Ud0LZFmSkggCvGsEz
ThPsUZUTJZY6Ygg87TQJh8NryG3Gmd2LyjRMqASDik/HCwscb4Oaml6Y5eX7q4ZlK5WfniJWr+LB
iw4stRHjSmP9qPDSPcQYGNLRk4ph9a+qkKvrtu6dow==
=E8px
-----END PGP SIGNATURE-----

--FwFs7zGLzu17JuxcLR6sz0s90RqKhiY18--

