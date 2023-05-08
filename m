Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDB76FA2F3
	for <lists+xen-devel@lfdr.de>; Mon,  8 May 2023 11:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.531313.826898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvwoy-0007YP-Ge; Mon, 08 May 2023 09:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 531313.826898; Mon, 08 May 2023 09:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pvwoy-0007Vg-Dl; Mon, 08 May 2023 09:06:16 +0000
Received: by outflank-mailman (input) for mailman id 531313;
 Mon, 08 May 2023 09:06:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SOTd=A5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pvwow-0007Va-Nm
 for xen-devel@lists.xenproject.org; Mon, 08 May 2023 09:06:14 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9485aec0-ed7f-11ed-b226-6b7b168915f2;
 Mon, 08 May 2023 11:06:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63D5121F84;
 Mon,  8 May 2023 09:06:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 396E11346B;
 Mon,  8 May 2023 09:06:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /nl8DIS7WGSXYwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 May 2023 09:06:12 +0000
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
X-Inumbo-ID: 9485aec0-ed7f-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683536772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jx1vHKXG9BsC/fOShussz6KjHmMB37fDHsvcq+nBraY=;
	b=gIAwOVQHFUi0RkRmgYdaf57/kV8Sw8hK6dbWT0iFmVPTb5NwknXSuZfb9onV2+oe+Ge1o6
	cjNo69FO+380vyG4x0IX+NsDXo0G0+Md7T6LM+bpOXwKhzl1pRllrB50nKEtEW7BfpZY7G
	+NyrBRy/aCIppyb66PLOgaNes0bBlhk=
Message-ID: <d8224847-ffc5-3faf-1bc5-6ad3d7966b26@suse.com>
Date: Mon, 8 May 2023 11:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1] tools: convert bitfields to unsigned type
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20230503150142.4987-1-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230503150142.4987-1-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yLil7GVoUqhlZCx4zmNgOb4n"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yLil7GVoUqhlZCx4zmNgOb4n
Content-Type: multipart/mixed; boundary="------------LOjdMT803timFkv0B3Ya03KN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Message-ID: <d8224847-ffc5-3faf-1bc5-6ad3d7966b26@suse.com>
Subject: Re: [PATCH v1] tools: convert bitfields to unsigned type
References: <20230503150142.4987-1-olaf@aepfle.de>
In-Reply-To: <20230503150142.4987-1-olaf@aepfle.de>

--------------LOjdMT803timFkv0B3Ya03KN
Content-Type: multipart/mixed; boundary="------------cwzj5DxJhdEW0LCD3VU5Lqq2"

--------------cwzj5DxJhdEW0LCD3VU5Lqq2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDUuMjMgMTc6MDEsIE9sYWYgSGVyaW5nIHdyb3RlOg0KPiBjbGFuZyBjb21wbGFp
bnMgYWJvdXQgdGhlIHNpZ25lZCB0eXBlOg0KPiANCj4gaW1wbGljaXQgdHJ1bmNhdGlvbiBm
cm9tICdpbnQnIHRvIGEgb25lLWJpdCB3aWRlIGJpdC1maWVsZCBjaGFuZ2VzIHZhbHVlIGZy
b20gMSB0byAtMSBbLVdzaW5nbGUtYml0LWJpdGZpZWxkLWNvbnN0YW50LWNvbnZlcnNpb25d
DQo+IA0KPiBUaGUgcG90ZW50aWFsIEFCSSBjaGFuZ2UgaW4gbGlieGVudmNoYW4gaXMgY292
ZXJlZCBieSB0aGUgWGVuIHZlcnNpb24gYmFzZWQgU09OQU1FLg0KPiANCj4gVGhlIHhlbmFs
eXplIGNoYW5nZSBmb2xsb3dzIHRoZSBleGlzdGluZyBwYXR0ZXJuIGluIHRoYXQgZmlsZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE9sYWYgSGVyaW5nIDxvbGFmQGFlcGZsZS5kZT4NCj4g
LS0tDQo+ICAgdG9vbHMvaW5jbHVkZS9saWJ4ZW52Y2hhbi5oIHwgNiArKystLS0NCj4gICB0
b29scy94ZW50cmFjZS94ZW5hbHl6ZS5jICAgfCAyICstDQo+ICAgMiBmaWxlcyBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvaW5jbHVkZS9saWJ4ZW52Y2hhbi5oIGIvdG9vbHMvaW5jbHVkZS9saWJ4ZW52Y2hh
bi5oDQo+IGluZGV4IDMwY2M3M2NmOTcuLjNkM2I4YWE4ZGQgMTAwNjQ0DQo+IC0tLSBhL3Rv
b2xzL2luY2x1ZGUvbGlieGVudmNoYW4uaA0KPiArKysgYi90b29scy9pbmNsdWRlL2xpYnhl
bnZjaGFuLmgNCj4gQEAgLTc5LDExICs3OSwxMSBAQCBzdHJ1Y3QgbGlieGVudmNoYW4gew0K
PiAgIAl4ZW5ldnRjaG5faGFuZGxlICpldmVudDsNCj4gICAJdWludDMyX3QgZXZlbnRfcG9y
dDsNCj4gICAJLyogaW5mb3JtYXRpdmUgZmxhZ3M6IGFyZSB3ZSBhY3RpbmcgYXMgc2VydmVy
PyAqLw0KPiAtCWludCBpc19zZXJ2ZXI6MTsNCj4gKwl1bnNpZ25lZCBpbnQgaXNfc2VydmVy
OjE7DQo+ICAgCS8qIHRydWUgaWYgc2VydmVyIHJlbWFpbnMgYWN0aXZlIHdoZW4gY2xpZW50
IGNsb3NlcyAoYWxsb3dzIHJlY29ubmVjdGlvbikgKi8NCj4gLQlpbnQgc2VydmVyX3BlcnNp
c3Q6MTsNCj4gKwl1bnNpZ25lZCBpbnQgc2VydmVyX3BlcnNpc3Q6MTsNCj4gICAJLyogdHJ1
ZSBpZiBvcGVyYXRpb25zIHNob3VsZCBibG9jayBpbnN0ZWFkIG9mIHJldHVybmluZyAwICov
DQo+IC0JaW50IGJsb2NraW5nOjE7DQo+ICsJdW5zaWduZWQgaW50IGJsb2NraW5nOjE7DQo+
ICAgCS8qIGNvbW11bmljYXRpb24gcmluZ3MgKi8NCj4gICAJc3RydWN0IGxpYnhlbnZjaGFu
X3JpbmcgcmVhZCwgd3JpdGU7DQo+ICAgCS8qKg0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVu
dHJhY2UveGVuYWx5emUuYyBiL3Rvb2xzL3hlbnRyYWNlL3hlbmFseXplLmMNCj4gaW5kZXgg
MTJkY2NhOTY0Ni4uMWI0YTE4OGFhYSAxMDA2NDQNCj4gLS0tIGEvdG9vbHMveGVudHJhY2Uv
eGVuYWx5emUuYw0KPiArKysgYi90b29scy94ZW50cmFjZS94ZW5hbHl6ZS5jDQo+IEBAIC0x
Mzc3LDcgKzEzNzcsNyBAQCBzdHJ1Y3QgaHZtX2RhdGEgew0KPiAgICAgICB0c2NfdCBleGl0
X3RzYywgYXJjX2N5Y2xlcywgZW50cnlfdHNjOw0KPiAgICAgICB1bnNpZ25lZCBsb25nIGxv
bmcgcmlwOw0KPiAgICAgICB1bnNpZ25lZCBleGl0X3JlYXNvbiwgZXZlbnRfaGFuZGxlcjsN
Cj4gLSAgICBpbnQgc2hvcnRfc3VtbWFyeV9kb25lOjEsIHByZWFsbG9jX3VucGluOjEsIHdy
bWFwX2JmOjE7DQo+ICsgICAgdW5zaWduZWQgc2hvcnRfc3VtbWFyeV9kb25lOjEsIHByZWFs
bG9jX3VucGluOjEsIHdybWFwX2JmOjE7DQoNClBsZWFzZSB1c2UgInVuc2lnbmVkIGludCIg
aW5zdGVhZCBvZiBhIHB1cmUgInVuc2lnbmVkIi4NCg0KV2l0aCB0aGF0IHlvdSBjYW4gYWRk
IG15Og0KDQpSZXZpZXdlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
DQoNCkp1ZXJnZW4NCg==
--------------cwzj5DxJhdEW0LCD3VU5Lqq2
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

--------------cwzj5DxJhdEW0LCD3VU5Lqq2--

--------------LOjdMT803timFkv0B3Ya03KN--

--------------yLil7GVoUqhlZCx4zmNgOb4n
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRYu4MFAwAAAAAACgkQsN6d1ii/Ey8E
lwf9E7Qh8x7RzZ0pzgW2fJVNlQTx9ySnBNQ8MuixNnBRkJkpFqxD9UVRvdhr5t/C7HzGEgylFrmn
Sa3ZeyRcxgnNpwwAIG4D0WFPPeHD6OBLe+JyGGZDQRoLxusmytN/Hgq3YFvZBImsWjulLeR+G3cR
SrnKr/S/xgyaSg3lAT0SGDtfuIYwk/MQDf2J535dgt7tBV2AW0QnNkaW9SuGUH9vOI2AQe4baZi2
R5HYyh/rI1sT7vJ9hmqnag5j0IENZzqDjwQbxgvSIeroBOcA17KjPMPjfyA4o/9tSMKpHm3UXbnv
tDJUrV3UhvHRCJHtZqhbV4tjKX79KrMaplydeqYJ8Q==
=J5NL
-----END PGP SIGNATURE-----

--------------yLil7GVoUqhlZCx4zmNgOb4n--

