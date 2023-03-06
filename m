Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07106AB736
	for <lists+xen-devel@lfdr.de>; Mon,  6 Mar 2023 08:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506713.779838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5X1-0004ef-3M; Mon, 06 Mar 2023 07:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506713.779838; Mon, 06 Mar 2023 07:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZ5X0-0004cx-W1; Mon, 06 Mar 2023 07:45:14 +0000
Received: by outflank-mailman (input) for mailman id 506713;
 Mon, 06 Mar 2023 07:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kIMi=66=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pZ5Wz-0004bK-9F
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 07:45:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d295ddab-bbf2-11ed-96b4-2f268f93b82a;
 Mon, 06 Mar 2023 08:45:11 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 772C81FDAE;
 Mon,  6 Mar 2023 07:45:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3819713A66;
 Mon,  6 Mar 2023 07:45:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2emSCwaaBWS3MQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Mar 2023 07:45:10 +0000
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
X-Inumbo-ID: d295ddab-bbf2-11ed-96b4-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1678088710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bvfUC8q+00MK02gRZBfK7bnH1M/87l0GuCubGKvjr8o=;
	b=POVgT2F43rYV/4zWzfvBgeTzNP6KzhS35wm6kheV+iLgTQHyFTaDEqF76jK644FsicSKr2
	4hGB/BRtJDyufE2+yxnWM5F3IIsIPGTSory2lz6LHnjsczM84bpq9NWX9ntZMVV9XITIEn
	GZv3kA5uvw+x1QladW6bTV3OC5G9ZTI=
Message-ID: <0f699825-e9dc-137c-2246-903a5934ca27@suse.com>
Date: Mon, 6 Mar 2023 08:45:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 15/17] xen: remove MODULE_LICENSE in non-modules
Content-Language: en-US
To: Nick Alcock <nick.alcock@oracle.com>, mcgrof@kernel.org
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230302211759.30135-1-nick.alcock@oracle.com>
 <20230302211759.30135-16-nick.alcock@oracle.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20230302211759.30135-16-nick.alcock@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5uQ0hU8nmKsloiZybUwzi7yw"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5uQ0hU8nmKsloiZybUwzi7yw
Content-Type: multipart/mixed; boundary="------------D6gu70LtnR6qDUrrJ6LmOs1H";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Nick Alcock <nick.alcock@oracle.com>, mcgrof@kernel.org
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <0f699825-e9dc-137c-2246-903a5934ca27@suse.com>
Subject: Re: [PATCH 15/17] xen: remove MODULE_LICENSE in non-modules
References: <20230302211759.30135-1-nick.alcock@oracle.com>
 <20230302211759.30135-16-nick.alcock@oracle.com>
In-Reply-To: <20230302211759.30135-16-nick.alcock@oracle.com>

--------------D6gu70LtnR6qDUrrJ6LmOs1H
Content-Type: multipart/mixed; boundary="------------jYSLBxLnUVAbNmnkv1k4J42A"

--------------jYSLBxLnUVAbNmnkv1k4J42A
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDIuMDMuMjMgMjI6MTcsIE5pY2sgQWxjb2NrIHdyb3RlOg0KPiBTaW5jZSBjb21taXQg
OGI0MWZjNDQ1NGUgKCJrYnVpbGQ6IGNyZWF0ZSBtb2R1bGVzLmJ1aWx0aW4gd2l0aG91dA0K
PiBNYWtlZmlsZS5tb2RidWlsdGluIG9yIHRyaXN0YXRlLmNvbmYiKSwgTU9EVUxFX0xJQ0VO
U0UgZGVjbGFyYXRpb25zDQo+IGFyZSB1c2VkIHRvIGlkZW50aWZ5IG1vZHVsZXMuIEFzIGEg
Y29uc2VxdWVuY2UsIHVzZXMgb2YgdGhlIG1hY3JvDQo+IGluIG5vbi1tb2R1bGVzIHdpbGwg
Y2F1c2UgbW9kcHJvYmUgdG8gbWlzaWRlbnRpZnkgdGhlaXIgY29udGFpbmluZw0KPiBvYmpl
Y3QgZmlsZSBhcyBhIG1vZHVsZSB3aGVuIGl0IGlzIG5vdCAoZmFsc2UgcG9zaXRpdmVzKSwg
YW5kIG1vZHByb2JlDQo+IG1pZ2h0IHN1Y2NlZWQgcmF0aGVyIHRoYW4gZmFpbGluZyB3aXRo
IGEgc3VpdGFibGUgZXJyb3IgbWVzc2FnZS4NCj4gDQo+IFNvIHJlbW92ZSBpdCBpbiB0aGUg
ZmlsZXMgaW4gdGhpcyBjb21taXQsIG5vbmUgb2Ygd2hpY2ggY2FuIGJlIGJ1aWx0IGFzDQo+
IG1vZHVsZXMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEFsY29jayA8bmljay5hbGNv
Y2tAb3JhY2xlLmNvbT4NCj4gU3VnZ2VzdGVkLWJ5OiBMdWlzIENoYW1iZXJsYWluIDxtY2dy
b2ZAa2VybmVsLm9yZz4NCj4gQ2M6IEx1aXMgQ2hhbWJlcmxhaW4gPG1jZ3JvZkBrZXJuZWwu
b3JnPg0KPiBDYzogbGludXgtbW9kdWxlc0B2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IEhpdG9taSBIYXNlZ2F3YSA8aGFzZWdh
d2EtaGl0b21pQGZ1aml0c3UuY29tPg0KPiBDYzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPg0KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQoNClJldmlld2Vk
LWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQoNCg0KSnVlcmdlbg0KDQo=

--------------jYSLBxLnUVAbNmnkv1k4J42A
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

--------------jYSLBxLnUVAbNmnkv1k4J42A--

--------------D6gu70LtnR6qDUrrJ6LmOs1H--

--------------5uQ0hU8nmKsloiZybUwzi7yw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQFmgUFAwAAAAAACgkQsN6d1ii/Ey9l
3Af/chWbP3S4hRcNsV/TYIYcYV3Hl5/2xH0rooUUpra4ICftGFDMh6nCrqkHw/uTnIiSJa963Tjv
KI9tdIdslI+j0+BI/JTupeoAIi32xY00Q6e18SDqaKW92br5nsmpCDHDrgIzB8IVDR9xoZTWfvdf
EYYVORkuEfPtenkRWRw/oKrkUABgZII0kW4MzzBiHVJd7T382UuC5JSI/nrGjy7OjEUt8g8ohSeG
+UL3Es9HPWivDOI1n86VokML35/LZv+WRGuHQMI0oUe+YSmQ/DSsTR27lMz1Qp0ajhMBi/tvo4zs
GEgeFmKg6ELCPL6xHlaN3rL4lPjJZ7w0h7CsOdOZBA==
=oy5r
-----END PGP SIGNATURE-----

--------------5uQ0hU8nmKsloiZybUwzi7yw--

