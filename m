Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10BF7DED94
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 08:45:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626743.977269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qySNp-0001aU-E1; Thu, 02 Nov 2023 07:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626743.977269; Thu, 02 Nov 2023 07:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qySNp-0001Yh-B6; Thu, 02 Nov 2023 07:44:53 +0000
Received: by outflank-mailman (input) for mailman id 626743;
 Thu, 02 Nov 2023 07:44:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WoC4=GP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qySNn-0001Ya-Ls
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 07:44:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2ad9d8a-7953-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 08:44:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 926651F74D;
 Thu,  2 Nov 2023 07:44:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 64F30138EC;
 Thu,  2 Nov 2023 07:44:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xx2oFm9TQ2UEOAAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 02 Nov 2023 07:44:47 +0000
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
X-Inumbo-ID: b2ad9d8a-7953-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698911087; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xUkVkarzemYJWnARJgoQ50yihwwGL1zBckyZIigLsYI=;
	b=CIedBYpf/tN7XJM5ItCKohZB4sIkB+Sd3Dll2Eo2vK+gDB9jjG33a4j6KQiKEBLujJrYAa
	jri+LgVVboNjfTcCuDO+gHmN7T2qqiFZA9WGKAEbAEAvih8qJg97HD6I4ahYBsX+2b5fKI
	0YUEKinfIBECmL8Fxs0mDDYMgUmcKjc=
Message-ID: <9b60fe7c-a960-4463-a0cf-1126ba29bcaf@suse.com>
Date: Thu, 2 Nov 2023 08:44:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/29] tools: add a new xen logging daemon
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-3-jgross@suse.com>
 <CAKf6xpt6LwSB2QaCnW7MvKJWq5rkR6qoFEG4ZCKVqv3MKeMMuQ@mail.gmail.com>
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
In-Reply-To: <CAKf6xpt6LwSB2QaCnW7MvKJWq5rkR6qoFEG4ZCKVqv3MKeMMuQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6vJ6nJfAAau7w1K6kD3BFb7y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6vJ6nJfAAau7w1K6kD3BFb7y
Content-Type: multipart/mixed; boundary="------------9jx2nsC100vxE9UDSgK8VEqy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <9b60fe7c-a960-4463-a0cf-1126ba29bcaf@suse.com>
Subject: Re: [PATCH 02/29] tools: add a new xen logging daemon
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-3-jgross@suse.com>
 <CAKf6xpt6LwSB2QaCnW7MvKJWq5rkR6qoFEG4ZCKVqv3MKeMMuQ@mail.gmail.com>
In-Reply-To: <CAKf6xpt6LwSB2QaCnW7MvKJWq5rkR6qoFEG4ZCKVqv3MKeMMuQ@mail.gmail.com>

--------------9jx2nsC100vxE9UDSgK8VEqy
Content-Type: multipart/mixed; boundary="------------ps9EnAjf7uCHLzXvR6MedG3w"

--------------ps9EnAjf7uCHLzXvR6MedG3w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDEuMTEuMjMgMTk6MzYsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgMTA6MjfigK9BTSBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
IHdyb3RlOg0KPj4NCj4+IEFkZCAieGVubG9nZCIsIGEgbmV3IGxvZ2dpbmcgZGFlbW9uIG1l
YW50IHRvIHN1cHBvcnQgaW5mcmFzdHJ1Y3R1cmUNCj4+IGRvbWFpbnMgKGUuZy4geGVuc3Rv
cmUtc3R1YmRvbSkgdG8gd3JpdGUgbG9nIGZpbGVzIGluIGRvbTAuDQo+IA0KPiBBcyBJIHVu
ZGVyc3RhbmQgaXQsIHlvdXIgbmV3IGRhZW1vbiBpcyBhIGdlbmVyaWMgOXBmcyBiYWNrZW5k
LCB3aGljaA0KPiB5b3UgdXNlIGZvciBsb2dnaW5nLiAgSSB0aGluayBuYW1pbmcgaXQgc29t
ZXRoaW5nIGxpa2UgeGVuOXBmc2Qgd291bGQNCj4gbW9yZSBhY2N1cmF0ZWx5IGRlc2NyaWJl
IGl0cyBmdW5jdGlvbmFsaXR5Lg0KDQpGaW5lIHdpdGggbWUuIEknbGwgd2FpdCBhIGxpdHRs
ZSBiaXQgdG8gc2VlIHdoYXQgb3RoZXJzIHRoaW5rLg0KDQo+PiBGb3Igbm93IG9ubHkgYWRk
IHRoZSBjb2RlIG5lZWRlZCBmb3Igc3RhcnRpbmcgdGhlIGRhZW1vbiBhbmQNCj4+IHJlZ2lz
dGVyaW5nIGl0IHdpdGggWGVuc3RvcmUgdmlhIGEgbmV3ICIvdG9vbC94ZW5sb2cvc3RhdGUi
IG5vZGUgYnkNCj4+IHdyaXRpbmcgdGhlICJydW5uaW5nIiBzdGF0ZSB0byBpdC4NCj4gDQo+
IFRvIHN1cHBvcnQgZHJpdmVyIGRvbWFpbiB1c2UgY2FzZXMsIEkgdGhpbmsgeW91IHdhbnQg
dG8gdXNlIGEgcmVsYXRpdmUNCj4gWGVuc3RvcmUgcGF0aC4gIFdoaWxlIHRoaXMgZGFlbW9u
IGlzIGluZGVwZW5kZW50IGZyb20gbGlieGwsIGl0IG1pZ2h0DQo+IGJlIGVhc2llc3QgdG8g
dXNlICJsaWJ4bC94ZW5sb2cvIiAoImxpYnhsL3hlbjlwZnMvIikgdG8gdGFrZSBhZHZhbnRh
Z2UNCj4gb2YgZHJpdmVyIGRvbWFpbnMgaGF2aW5nIGEgcmVhZC13cml0ZSAibGlieGwvIiBk
aXJlY3RvcnkuDQoNCllvdSBoYXZlIGEgcG9pbnQgaGVyZS4gQW5kIGFzIGl0IGlzIGxpYnhs
IGNvbnRyb2xsaW5nIHRoZSBzdGFydCBvZiB0aGUNCmRhZW1vbiwgcHV0dGluZyBpdCB1bmRl
ciAibGlieGwiIGlzIGZpbmUgSU1PLg0KDQo+IA0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiANCj4gVGhlIGNvZGUgbG9va3MgZ29vZCB0
byBtZS4NCg0KVGhhbmtzLA0KDQoNCkp1ZXJnZW4NCg0K
--------------ps9EnAjf7uCHLzXvR6MedG3w
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

--------------ps9EnAjf7uCHLzXvR6MedG3w--

--------------9jx2nsC100vxE9UDSgK8VEqy--

--------------6vJ6nJfAAau7w1K6kD3BFb7y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVDU24FAwAAAAAACgkQsN6d1ii/Ey8j
zwf/ZlFuksdLPA0/1V8nOHDfqkMRAsX5f6CsV2GtYmbSnad6D9o1vUi+Ge6sJZPmUigbev0RH8Eh
WZ4Gv+CLmGYFnbj+iKH9cbV/U9yd6VsB/pAHor+zqiEaKq+A8WcBiBmXYbwGRf57jkRaZzOmgvig
2NrbvwhQTmPs3hHJ8KWSpBYugJscu9MxruhspdFPpZPcYSIY/xo/9Iag/JOvFLltpKCMXoR5BY8f
kKD0IvhgYoCoJT21WhZZB80ZCU3nnVF7HAQ+UOK+xMUeYYpDMFxaSPj8g+YAshHTzJWVJ6W+3T9k
L4GTaKbL0DP4ttJfPCk6F3OzfNpfW6Ep0XF5AEb1vA==
=rIwe
-----END PGP SIGNATURE-----

--------------6vJ6nJfAAau7w1K6kD3BFb7y--

