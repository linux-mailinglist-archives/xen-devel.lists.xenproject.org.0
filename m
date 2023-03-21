Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02F76C35D0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 16:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512809.793047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee36-00078J-HD; Tue, 21 Mar 2023 15:37:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512809.793047; Tue, 21 Mar 2023 15:37:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pee36-00075O-Dv; Tue, 21 Mar 2023 15:37:20 +0000
Received: by outflank-mailman (input) for mailman id 512809;
 Tue, 21 Mar 2023 15:37:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YM/b=7N=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pee34-00075G-Lk
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 15:37:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42d4d4e3-c7fe-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 16:37:17 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 306B7220E2;
 Tue, 21 Mar 2023 15:37:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D3EE13440;
 Tue, 21 Mar 2023 15:37:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O2u6AS3PGWRaXwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 21 Mar 2023 15:37:17 +0000
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
X-Inumbo-ID: 42d4d4e3-c7fe-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679413037; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QGlEnMj44Txv1AZjZ7/liK4karD/v1E0kNljsQ6EyW8=;
	b=ugokkivbjwJTiPEHks7FT2jC2BE891caMYlsgGtdmh3NcIygHHeo+unBjqOwh9smeyYaWp
	MVywfHZFrciAz09TBYyWApeadl9OjQ1YEzfHgJJ9Z17FwLtOQOVETRF0Yeq5vRQvgp3JCF
	1MVIvJ7UPFOvWvr4W2SG2e+VF6pv4iQ=
Message-ID: <551027c3-04be-be47-96fa-8375b99dcb53@suse.com>
Date: Tue, 21 Mar 2023 16:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20230315154226.4238-1-jgross@suse.com>
 <49c631aa-2a88-4223-a63d-0058bfdbc9e6@perard>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools: use libxenlight for writing xenstore-stubdom
 console nodes
In-Reply-To: <49c631aa-2a88-4223-a63d-0058bfdbc9e6@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oSsARvdk4LLrFaIfC0EvKV4r"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oSsARvdk4LLrFaIfC0EvKV4r
Content-Type: multipart/mixed; boundary="------------Piopm5Z2n3yCmH7vA8lrc4Wu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <551027c3-04be-be47-96fa-8375b99dcb53@suse.com>
Subject: Re: [PATCH] tools: use libxenlight for writing xenstore-stubdom
 console nodes
References: <20230315154226.4238-1-jgross@suse.com>
 <49c631aa-2a88-4223-a63d-0058bfdbc9e6@perard>
In-Reply-To: <49c631aa-2a88-4223-a63d-0058bfdbc9e6@perard>

--------------Piopm5Z2n3yCmH7vA8lrc4Wu
Content-Type: multipart/mixed; boundary="------------9ehZyCyypbLKvRJldfgkqpzB"

--------------9ehZyCyypbLKvRJldfgkqpzB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDMuMjMgMTY6MDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOg0KPiBPbiBXZWQsIE1h
ciAxNSwgMjAyMyBhdCAwNDo0MjoyNlBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4gQEAgLTE5ODIsNiArMTk4NywxMyBAQCBpbnQgbGlieGxfY29uc29sZV9nZXRfdHR5KGxp
YnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgaW50IGNvbnNfbnVtLA0KPj4gICAgKi8N
Cj4+ICAgaW50IGxpYnhsX3ByaW1hcnlfY29uc29sZV9nZXRfdHR5KGxpYnhsX2N0eCAqY3R4
LCB1aW50MzJfdCBkb21pZF92bSwgY2hhciAqKnBhdGgpOw0KPj4gICANCj4+ICsvKiBsaWJ4
bF9jb25zb2xlX2FkZF94ZW5zdG9yZSB3cml0ZXMgdGhlIFhlbnN0b3JlIGVudHJpZXMgZm9y
IGEgZG9tYWluJ3MNCj4+ICsgKiBwcmltYXJ5IGNvbnNvbGUgYmFzZWQgb24gZG9taWQsIGV2
ZW50IGNoYW5uZWwgcG9ydCBhbmQgdGhlIGd1ZXN0IGZyYW1lDQo+PiArICogbnVtYmVyIG9m
IHRoZSBQViBjb25zb2xlJ3MgcmluZyBwYWdlLg0KPj4gKyAqLw0KPj4gK2ludCBsaWJ4bF9j
b25zb2xlX2FkZF94ZW5zdG9yZShsaWJ4bF9jdHggKmN0eCwgdWludDMyX3QgZG9taWQsIHVp
bnQzMl90IGJhY2tlbmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCBldnRjaCwgdWludDY0X3QgZ2ZuKTsNCj4gDQo+IENvdWxkIHlvdSBtYWtlIHRoaXMgZnVu
Y3Rpb24gYXN5bmMsIGJ5IGFkZGluZyAiY29uc3QgbGlieGxfYXN5bmNvcF9ob3cNCj4gKmFv
X2hvdyIgcGFyYW1ldGVyIGluIGxhc3QgcG9zaXRpb24/DQo+IA0KPiBZb3UgY2FuIGZvbGxv
dyBsaWJ4bF9kb21haW5fcGF1c2UoKSBleGFtcGxlIGhhcyB0byB3cml0ZSBhbiBhc3luYw0K
PiBmdW5jdGlvbiB0aGF0IGlzIGFjdHVhbGx5IHN5bmNocm9ub3VzIChBT19DUkVBVEUsIGxp
YnhsX19hb19jb21wbGV0ZSwNCj4gQU9fSU5QUk9HUkVTUywgQU9fQ1JFQVRFX0ZBSUwpLg0K
PiANCj4gQWRkaW5nIHRoZSBhc3luYyBjYXBhYmlsaXR5IG5vdyBtZWFucyB0aGF0IHdlIHdv
bid0IG5lZWQgdG8gY2hhbmdlIHRoZQ0KPiBBUEkgaWYgdGhlIGZ1bmN0aW9uIGFjdHVhbGx5
IG5lZWQgdG8gYmUgYXN5bmMgb25lIGRheS4NCg0KT2theS4NCg0KPiANCj4+ICsNCj4+ICAg
LyogTWF5IGJlIGNhbGxlZCB3aXRoIGluZm9fciA9PSBOVUxMIHRvIGNoZWNrIGZvciBkb21h
aW4ncyBleGlzdGVuY2UuDQo+PiAgICAqIFJldHVybnMgRVJST1JfRE9NQUlOX05PVEZPVU5E
IGlmIGRvbWFpbiBkb2VzIG5vdCBleGlzdCAodXNlZCB0byByZXR1cm4NCj4+ICAgICogRVJS
T1JfSU5WQUwgZm9yIHRoaXMgc2NlbmFyaW8pLiAqLw0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfY29uc29sZS5jIGIvdG9vbHMvbGlicy9saWdodC9saWJ4bF9j
b25zb2xlLmMNCj4+IGluZGV4IGQ4YjJiYzU0NjUuLmNlM2RlMTAwY2MgMTAwNjQ0DQo+PiAt
LS0gYS90b29scy9saWJzL2xpZ2h0L2xpYnhsX2NvbnNvbGUuYw0KPj4gKysrIGIvdG9vbHMv
bGlicy9saWdodC9saWJ4bF9jb25zb2xlLmMNCj4+IEBAIC0zNDYsNiArMzQ2LDI2IEBAIG91
dDoNCj4+ICAgICAgIHJldHVybiByYzsNCj4+ICAgfQ0KPj4gICANCj4+ICtpbnQgbGlieGxf
Y29uc29sZV9hZGRfeGVuc3RvcmUobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCB1
aW50MzJfdCBiYWNrZW5kLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnQgZXZ0Y2gsIHVpbnQ2NF90IGdmbikNCj4+ICt7DQo+PiArICAgIEdDX0lOSVQoY3R4KTsN
Cj4+ICsgICAgaW50IHJjOw0KPj4gKyAgICBsaWJ4bF9fZGV2aWNlX2NvbnNvbGUgY29uc29s
ZSA9IHsgLmJhY2tlbmRfZG9taWQgPSBiYWNrZW5kLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLm91dHB1dCA9ICJwdHkiLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgLmNvbnNiYWNrID0gTElCWExfX0NPTlNPTEVf
QkFDS0VORF9YRU5DT05TT0xFRCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB9Ow0KPj4gKyAgICBsaWJ4bF9fZG9tYWluX2J1aWxkX3N0YXRlIHN0YXRlID0g
eyAuY29uc29sZV9wb3J0ID0gZXZ0Y2gsDQo+IA0KPiBgY29uc29sZV9wb3J0YCBpcyAidWlu
dDMyX3QiLCBzaG91bGRuJ3QgYGV2dGNobmAgYmUgdGhlIHNhbWUgdHlwZSwgb3IgYXQNCj4g
bGVhc3QgYWxzbyBiZSB1bnNpZ25lZD8NCg0KSSBjYW4gc3dpdGNoIHRoZSB0eXBlIHRvIHVu
c2lnbmVkIGludC4NCg0KPiANCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLmNvbnNvbGVfbWZuID0gZ2ZuLA0KPiANCj4gSSB3b25kZXIgaWYgd2Ugc2hv
dWxkIGNoZWNrIGlmIGBnZm5gIGZpdCBpbiBgY29uc29sZV9tZm5gLCBhcyBpdCBjb3VsZA0K
PiBiZSBzbWFsbGVyIHdoZW4gYnVpbGRpbmcgdGhlIHRvb2xzdGFjayBvbiAzMmJpdCBwbGF0
Zm9ybS4NCg0KSSdsbCBtYWtlIGNvbnNvbGVfbWZuICJ1bnNpZ25lZCBsb25nIiBqdXN0IGxp
a2UgaW4gdGhlIGJ1aWxkIHN0YXRlLg0KDQoNCkp1ZXJnZW4NCg==
--------------9ehZyCyypbLKvRJldfgkqpzB
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

--------------9ehZyCyypbLKvRJldfgkqpzB--

--------------Piopm5Z2n3yCmH7vA8lrc4Wu--

--------------oSsARvdk4LLrFaIfC0EvKV4r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQZzywFAwAAAAAACgkQsN6d1ii/Ey8Y
+gf/W73q0ouf+2ezHZgfAdiqWV0/uTq+jkp+6Q3IZVJtye/yKtGcVRlwObmigw9kyyQfvMWOiZAK
gtrt35SgLTyHtWEmOlKoEpYi7JRFd/LDKIVlYh0c2vYFG5RmWoJjGX7uKW+1IJoQNqAOmssTFTH2
jC+PiaDxfsWuYtCa63+GOAe0pRPOsn4qbkMJ6BgS1PayMFpCnG2z021z1Dnuyg3A4Bm5lVyrPGJV
pKynUilzqYGstLtH1sEzo4IVIgKSL6VTsqPWsFLgZK/UtAehh8364/vD0PIqAOvlTSgojQuOVbSa
siUsPRTaENFq2o+mOmrjOqX4IiDkHmQWbiLR/5Bmmw==
=AHRh
-----END PGP SIGNATURE-----

--------------oSsARvdk4LLrFaIfC0EvKV4r--

