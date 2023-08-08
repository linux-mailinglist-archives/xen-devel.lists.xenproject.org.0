Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 359B27739D5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 13:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579632.907699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKUm-0005BM-1Q; Tue, 08 Aug 2023 11:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579632.907699; Tue, 08 Aug 2023 11:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKUl-000581-Up; Tue, 08 Aug 2023 11:03:23 +0000
Received: by outflank-mailman (input) for mailman id 579632;
 Tue, 08 Aug 2023 11:03:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw+Y=DZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qTKUk-00057v-GU
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 11:03:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f2ca625-35db-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 13:03:20 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CAC2E2031C;
 Tue,  8 Aug 2023 11:03:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9BA46139D1;
 Tue,  8 Aug 2023 11:03:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fsBGJPcg0mTVRwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 08 Aug 2023 11:03:19 +0000
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
X-Inumbo-ID: 2f2ca625-35db-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691492599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qodi7cWZzIyQxgbGlhauM6FDc8cfLIWh9gf+S++C2Z4=;
	b=XsAwUa+FzgnLkoQQ0N2TqGGrDsmyWUag34JpdlsXJr0ExcLTm1g/EWkiaOqXRXolwIQFPh
	FN24RAKK215ShD5NpVhFPZ0oqd2acwZgzWZsMclUHREX4S7X+yIFWsM3ZJQjQDMp2AwfUu
	tdPp54dQPj/cykafk74yqUAcVYqlBVA=
Message-ID: <77a85400-91b7-f560-9581-7ddfe5667853@suse.com>
Date: Tue, 8 Aug 2023 13:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools: add configure option for disabling pygrub
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230804060000.27710-1-jgross@suse.com>
 <20230804060000.27710-2-jgross@suse.com>
 <e6f63e6d-af0a-0e2d-b9ac-68cfaa083c7b@citrix.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <e6f63e6d-af0a-0e2d-b9ac-68cfaa083c7b@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3LNuFQBYUNSPDYNLL0xigtBd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3LNuFQBYUNSPDYNLL0xigtBd
Content-Type: multipart/mixed; boundary="------------m0f6FjJmF066Uurzwru0JOml";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <77a85400-91b7-f560-9581-7ddfe5667853@suse.com>
Subject: Re: [PATCH 1/2] tools: add configure option for disabling pygrub
References: <20230804060000.27710-1-jgross@suse.com>
 <20230804060000.27710-2-jgross@suse.com>
 <e6f63e6d-af0a-0e2d-b9ac-68cfaa083c7b@citrix.com>
In-Reply-To: <e6f63e6d-af0a-0e2d-b9ac-68cfaa083c7b@citrix.com>

--------------m0f6FjJmF066Uurzwru0JOml
Content-Type: multipart/mixed; boundary="------------Gj0rgRjsBl0FHbvDu5LRuzKe"

--------------Gj0rgRjsBl0FHbvDu5LRuzKe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMDguMjMgMTI6NTYsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDA0LzA4LzIw
MjMgNjo1OSBhbSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+IEFkZCBhICItLWRpc2FibGUt
cHlncnViIiBvcHRpb24gZm9yIGJlaW5nIGFibGUgdG8gZGlzYWJsZSB0aGUgYnVpbGQNCj4+
IGFuZCBpbnN0YWxsYXRpb24gb2YgcHlncnViLg0KPj4NCj4+IFRoZXJlIGFyZSB0d28gbWFp
biByZWFzb25zIHRvIGRvIHNvOg0KPj4NCj4+IC0gQSBtYWluIHJlYXNvbiB0byB1c2UgcHln
cnViIGlzIHRvIGFsbG93IGEgUFYgZ3Vlc3QgdG8gY2hvb3NlIGl0cw0KPj4gICAgYml0bmVz
cyAoMzItIG9yIDY0LWJpdCkuIFB5Z3J1YiBhbGxvd3MgdGhhdCBieSBsb29raW5nIGludG8g
dGhlIGJvb3QNCj4+ICAgIGltYWdlIGFuZCB0byBzdGFydCB0aGUgZ3Vlc3QgaW4gdGhlIGNv
cnJlY3QgbW9kZSBkZXBlbmRpbmcgb24gdGhlDQo+PiAgICBrZXJuZWwgc2VsZWN0ZWQuIFdp
dGggMzItYml0IFBWIGd1ZXN0cyBiZWluZyBkZXByZWNhdGVkIGFuZCB0aGUNCj4+ICAgIHBv
c3NpYmlsaXR5IHRvIGV2ZW4gYnVpbGQgYSBoeXBlcnZpc29yIHdpdGhvdXQgMzItYml0IFBW
IHN1cHBvcnQsDQo+PiAgICB0aGlzIHVzZSBjYXNlIGlzIGdvbmUgZm9yIGF0IGxlYXN0IHNv
bWUgY29uZmlndXJhdGlvbnMuDQo+Pg0KPj4gLSBQeWdydWIgaXMgcnVubmluZyBpbiBkb20w
IHdpdGggcm9vdCBwcml2aWxlZ2VzLiBBcyBpdCBpcyBvcGVyYXRpbmcNCj4+ICAgIG9uIGd1
ZXN0IGNvbnRyb2xsZWQgZGF0YSAodGhlIGJvb3QgaW1hZ2UpIGFuZCB0YWtpbmcgZGVjaXNp
b25zIGJhc2VkDQo+PiAgICBvbiB0aGlzIGRhdGEsIHRoZXJlIGlzIGEgcG9zc2libGUgc2Vj
dXJpdHkgaXNzdWUuDQo+IA0KPiBUaGlzIGlzbid0IHJlYWxseSBhIHBvc3NpYmxlIHNlY3Vy
aXR5IGlzc3VlLsKgIEl0J3MgYSBoaWdoKGVyKSBzZWN1cml0eSByaXNrLg0KDQpUcnVlLiBJ
J2xsIHMvcG9zc2libGUgc2VjdXJpdHkgaXNzdWUvaGlnaGVyIHNlY3VyaXR5IHJpc2svLg0K
DQo+IA0KPiBQeWdydWIgaXMgc3RpbGwgc2VjdXJpdHkgc3VwcG9ydGVkLCBzbyBmYWxscyB1
bmRlciB0aGUgdXN1YWwgc2VjdXJpdHkNCj4gcHJvY2VzcyBpZiBhbiBpc3N1ZSB3ZXJlIHRv
IGJlIGZvdW5kLg0KPiANCj4+ICAgTm90IGJlaW5nIHBvc3NpYmxlDQo+PiAgICB0byB1c2Ug
cHlncnViIGlzIHRodXMgYSBzdGVwIHRvd2FyZHMgbW9yZSBzZWN1cml0eS4NCj4gDQo+IElN
TywgdGhlIHBocmFzZSB5b3Ugd2FudCB0byB1c2UgaGVyZSBpcyAicmVkdWN0aW9uIGluIGF0
dGFjayBzdXJmYWNlIi4NCg0KVGhhbmtzLiBJJ2xsIHVzZSB0aGF0Lg0KDQo+IA0KPj4gRGVm
YXVsdCBpcyBzdGlsbCB0byBidWlsZCBhbmQgaW5zdGFsbCBweWdydWIuDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+
PiAgIGNvbmZpZy9Ub29scy5tay5pbiB8ICAxICsNCj4+ICAgdG9vbHMvTWFrZWZpbGUgICAg
IHwgIDIgKy0NCj4+ICAgdG9vbHMvY29uZmlndXJlICAgIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4+ICAgdG9vbHMvY29uZmlndXJlLmFjIHwgIDEgKw0KPj4gICA0IGZp
bGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IFNo
b3VsZG4ndCB3ZSBoYXZlIGEgcGF0Y2ggdG8gKGxpYil4bCB3aGljaCBwcm92aWRlcyBhIGNs
ZWFuIGVycm9yDQo+IG1lc3NhZ2UgKHJhdGhlciB0aGFuIC1FU1JDSC9ldGMpIHdoZW4gdGhl
IHVzZXIgc2VsZWN0cyBib290bG9hZGVyPXB5Z3J1YiA/DQo+IA0KPiBGaW5lIHRvIGJlIGEg
c2VwYXJhdGUgcGF0Y2gsIGJ1dCBub3Qgc29tZXRoaW5nIHdoaWNoIHdhbnRzIGZvcmdldHRp
bmcuDQoNCkknbGwgYWRkIGl0Lg0KDQoNCkp1ZXJnZW4NCg==
--------------Gj0rgRjsBl0FHbvDu5LRuzKe
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

--------------Gj0rgRjsBl0FHbvDu5LRuzKe--

--------------m0f6FjJmF066Uurzwru0JOml--

--------------3LNuFQBYUNSPDYNLL0xigtBd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTSIPcFAwAAAAAACgkQsN6d1ii/Ey/C
xgf/aHi7DSv1X+BSJUoiAXrp1SOWj8H+uLAn7VNbulQCwRzMHY8F8oLrYxiB9AAeosLwFIsZXIU5
UUxwodeTxUjSvnY3KZ3mnHCTUzISMvg8CPW0jlkkPflp+TNHm7AW66D18BSOdZlSnyUMsdKFlOya
77ZiG4mQq4Iq79XFER1OuRVEds0yrPWHmLvb4rLAhXmIYqIDOMlQqw5CF/P93vfmw+1JE1DRTLN+
gDcSmN0qrGR0fjyUGOMYzY5EsvtP7JcDqgMmROU+NScM80+1USf2k3nI1T7Nq5283C6yKT+VWif2
3Kk3J5XO5EJ8dSByPfydY+SFqMIsCHEsNu/N/wkVNw==
=84oy
-----END PGP SIGNATURE-----

--------------3LNuFQBYUNSPDYNLL0xigtBd--

