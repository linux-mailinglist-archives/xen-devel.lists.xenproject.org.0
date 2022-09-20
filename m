Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772915BDC91
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 07:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409161.652098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaW8T-0002Fn-0U; Tue, 20 Sep 2022 05:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409161.652098; Tue, 20 Sep 2022 05:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaW8S-0002CK-TA; Tue, 20 Sep 2022 05:49:32 +0000
Received: by outflank-mailman (input) for mailman id 409161;
 Tue, 20 Sep 2022 05:49:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OMl1=ZX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oaW8R-0002CE-W2
 for xen-devel@lists.xenproject.org; Tue, 20 Sep 2022 05:49:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe3ea393-38a7-11ed-bad8-01ff208a15ba;
 Tue, 20 Sep 2022 07:49:29 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 20B1321E76;
 Tue, 20 Sep 2022 05:49:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEF1C13ABD;
 Tue, 20 Sep 2022 05:49:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LwjPM2hUKWOdIwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 20 Sep 2022 05:49:28 +0000
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
X-Inumbo-ID: fe3ea393-38a7-11ed-bad8-01ff208a15ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663652969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lX23H5Mmw5Toj1BwLnr2+4Yen8Aug6TwQ9Yk5gvBUEo=;
	b=PWSpncar1OW67iQenc5sDRSuItG2Xe9nX+gaVZF2Wb2hJAPIROzkenNrorCvqmzBW2AJpY
	p5Kx/6tdLzsBliSJPldmN9mIZ6SYfFGaP9Z7/Nt1vYz8U90TPbR9xe5b3o/jnker4UoL2N
	yvnNfYvLBxYrjYw4xTY5IiOL9sW/e+8=
Message-ID: <301dedd2-9407-2386-2c20-f0ad6ee42f42@suse.com>
Date: Tue, 20 Sep 2022 07:49:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: where are xs APIs defined
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Mallela, RaghavendraPrasad (Raghavendra Prasad)"
 <RaghavendraPrasad.Mallela@amd.com>
References: <DM6PR12MB4297953EB76ED8376286F8199F4D9@DM6PR12MB4297.namprd12.prod.outlook.com>
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <DM6PR12MB4297953EB76ED8376286F8199F4D9@DM6PR12MB4297.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JHBBXtEyvBsb8pFM9946uQPD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JHBBXtEyvBsb8pFM9946uQPD
Content-Type: multipart/mixed; boundary="------------vv99lJ8N1mVxzbkZRh0RV3Sf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: "SHARMA, JYOTIRMOY" <JYOTIRMOY.SHARMA@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Mallela, RaghavendraPrasad (Raghavendra Prasad)"
 <RaghavendraPrasad.Mallela@amd.com>
Message-ID: <301dedd2-9407-2386-2c20-f0ad6ee42f42@suse.com>
Subject: Re: where are xs APIs defined
References: <DM6PR12MB4297953EB76ED8376286F8199F4D9@DM6PR12MB4297.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4297953EB76ED8376286F8199F4D9@DM6PR12MB4297.namprd12.prod.outlook.com>

--------------vv99lJ8N1mVxzbkZRh0RV3Sf
Content-Type: multipart/mixed; boundary="------------j4VkwGAPdn2xMGekZPj6bFwD"

--------------j4VkwGAPdn2xMGekZPj6bFwD
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTkuMDkuMjIgMjA6MTMsIFNIQVJNQSwgSllPVElSTU9ZIHdyb3RlOg0KPiBbQU1EIE9m
ZmljaWFsIFVzZSBPbmx5IC0gR2VuZXJhbF0NCj4gDQo+IA0KPiBIZWxsbywNCj4gDQo+IEkg
YW0gbG9va2luZyBmb3IgdGhlIHNvdXJjZSBjb2RlIHdoZXJlIFhlbnN0b3JlIGFjY2VzcyBB
UElzIGxpa2UgeHNfb3BlbigpLCANCj4geHNfcmVhZCgpIGFyZSBkZWZpbmVkLg0KDQpIYXZl
IGEgbG9vayBhdCB0b29scy9saWJzL3N0b3JlLw0KDQpFdmVyIHRob3VnaHQgb2YgdXNpbmcg
c29tZXRoaW5nIGxpa2UgY3Njb3BlPyBFdmVuICJnaXQgZ3JlcCIgd291bGQgaGF2ZSBoZWxw
ZWQNCnRvIGZpbmQgdGhlIGNvcnJlY3Qgc291cmNlLg0KDQoNCkp1ZXJnZW4NCg0K
--------------j4VkwGAPdn2xMGekZPj6bFwD
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------j4VkwGAPdn2xMGekZPj6bFwD--

--------------vv99lJ8N1mVxzbkZRh0RV3Sf--

--------------JHBBXtEyvBsb8pFM9946uQPD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMpVGgFAwAAAAAACgkQsN6d1ii/Ey9z
8gf/ROh1iDntYbCUUtKRJTcQzR5twIS9eWuZS6tX99E6wypjKsHZaXXx4RkVRm9+K0+W9mrrjQg4
4qaUBMJsrlwEIz17fMo1idcfwf2pAFiFakpiaWiorq8/Tlh5ubipPzaew2mlJbVu4p/kOSk8r+Mj
ixBOE2rQZEUe2Wqn8vnqkGf9HWBjf3FVz8lZBbuAXdRWRdhuKkahJ1WF/QKYhRydf3VhEPGGAKpE
/lyHuD/duVANXM7OF8ZJpvAqO7OxDR5Wm0BnQT79LGsSLz7/mJIPYc7tNC6j4pBTBR/RY6EsD9BM
XPpKA6Vtjj4Zf+hIF+IJ3MSwWKbUmQKqbCnbjX4SmA==
=BUrt
-----END PGP SIGNATURE-----

--------------JHBBXtEyvBsb8pFM9946uQPD--

