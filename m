Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCFC59F37E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 08:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392195.630383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQjcP-0007A9-7t; Wed, 24 Aug 2022 06:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392195.630383; Wed, 24 Aug 2022 06:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQjcP-00077q-3K; Wed, 24 Aug 2022 06:12:01 +0000
Received: by outflank-mailman (input) for mailman id 392195;
 Wed, 24 Aug 2022 06:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oQjcN-00077k-6s
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 06:11:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8b81fe3-2373-11ed-bd2e-47488cf2e6aa;
 Wed, 24 Aug 2022 08:11:58 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 52E401FAF0;
 Wed, 24 Aug 2022 06:11:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2079113AE9;
 Wed, 24 Aug 2022 06:11:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vrToBS3BBWOQMAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 24 Aug 2022 06:11:57 +0000
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
X-Inumbo-ID: a8b81fe3-2373-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661321517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/NGGdV5zlINSGciFWkZ1v2pxZa2EbaT7oJyJkBMZQxs=;
	b=ET7gOPF/evKbqB3wX6Zaqs/7RvydgHtx+91MqlrU+L4HDvIebjq5aZOdzyCuXSKJRUxt3F
	XY2ZKJEywxtydEctw6gIK/SKKqVA/mzQfRnuJKjxkQMMH0JV1ocCMbUfYwSphT833Vi30l
	5q9j4Eq16O/Gbe6cOEZsm+6zfQ8Ic2w=
Message-ID: <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com>
Date: Wed, 24 Aug 2022 08:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <YwVuwXOGoZX3pM7n@mail-itl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5S6botwjJEwzBqS5v0I0jNkY"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5S6botwjJEwzBqS5v0I0jNkY
Content-Type: multipart/mixed; boundary="------------sHVZTISGKAXDPA8yDFm0XKeA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Message-ID: <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com>
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
In-Reply-To: <YwVuwXOGoZX3pM7n@mail-itl>

--------------sHVZTISGKAXDPA8yDFm0XKeA
Content-Type: multipart/mixed; boundary="------------Ri0nBVFBWgKviEHToqM3cNRy"

--------------Ri0nBVFBWgKviEHToqM3cNRy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjQuMDguMjIgMDI6MjAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSB3cm90ZToN
Cj4gT24gVHVlLCBBdWcgMjMsIDIwMjIgYXQgMDk6NDg6NTdBTSArMDIwMCwgSnVlcmdlbiBH
cm9zcyB3cm90ZToNCj4+IE9uIDIzLjA4LjIyIDA5OjQwLCBEZW1pIE1hcmllIE9iZW5vdXIg
d3JvdGU6DQo+Pj4gSSByZWNlbnRseSBoYWQgYSBWTeKAmXMgL2Rldi94dmRiIHN0b3Agd29y
a2luZyB3aXRoIGEg4oCcYmFja2VuZCBoYXMgbm90DQo+Pj4gdW5tYXBwZWQgZ3JhbnTigJ0g
ZXJyb3IuICBTaW5jZSAvZGV2L3h2ZGIgd2FzIHRoZSBWTeKAmXMgcHJpdmF0ZSB2b2x1bWUs
DQo+Pj4gdGhhdCByZW5kZXJlZCB0aGUgVk0gZWZmZWN0aXZlbHkgdXNlbGVzcy4gIEkgaGFk
IHRvIGtpbGwgaXQgd2l0aA0KPj4+IHF2bS1raWxsLg0KPj4+DQo+Pj4gVGhlIGJhY2tlbmQg
b2YgL2Rldi94dmRiIGlzIGRvbTAsIHNvIGEgbWFsaWNpb3VzIGJhY2tlbmQgaXMgY2xlYXJs
eSBub3QNCj4+PiB0aGUgY2F1c2Ugb2YgdGhpcy4gIEkgYmVsaWV2ZSB0aGUgYWN0dWFsIGNh
dXNlIGlzIGEgcmFjZSBjb25kaXRpb24sIHN1Y2gNCj4+PiBhcyB0aGUgZm9sbG93aW5nOg0K
Pj4+DQo+Pj4gMS4gR1VJIGFnZW50IGluIFZNIGFsbG9jYXRlcyBncmFudCBYLg0KPj4+IDIu
IEdVSSBhZ2VudCB0ZWxscyBHVUkgZGFlbW9uIGluIGRvbTAgdG8gbWFwIFguDQo+Pj4gMy4g
R1VJIGFnZW50IGZyZWVzIGdyYW50IFguDQo+Pj4gNC4gYmxrZnJvbnQgYWxsb2NhdGVzIGdy
YW50IFggYW5kIHBhc3NlcyBpdCB0byBkb20wLg0KPj4+IDUuIGRvbTDigJlzIGJsa2JhY2sg
bWFwcyBncmFudCBYLg0KPj4+IDYuIGJsa2JhY2sgdW5tYXBzIGdyYW50IFguDQo+Pj4gNy4g
R1VJIGRhZW1vbiBtYXBzIGdyYW50IFguDQo+Pj4gOC4gYmxrZnJvbnQgdHJpZXMgdG8gcmV2
b2tlIGFjY2VzcyB0byBncmFudCBYIGFuZCBmYWlscy4gIERpc2FzdGVyDQo+Pj4gICAgICBl
bnN1ZXMuDQo+Pj4NCj4+PiBXaGF0IGNvdWxkIGJlIGRvbmUgdG8gcHJldmVudCB0aGlzIHJh
Y2U/ICBSaWdodCBub3cgYWxsIG9mIHRoZQ0KPj4+IGFwcHJvYWNoZXMgSSBjYW4gdGhpbmsg
b2YgYXJlIGhvcnJpYmx5IGJhY2t3YXJkcy1pbmNvbXBhdGlibGUuICBUaGV5DQo+Pj4gcmVx
dWlyZSByZXBsYWNpbmcgZ3JhbnQgSURzIHdpdGggc29tZSBzb3J0IG9mIGhhbmRsZSwgYW5k
IHJlcXVpcmluZw0KPj4+IHVzZXJzcGFjZSB0byBwYXNzIHRoZXNlIGhhbmRsZXMgdG8gaW9j
dGxzLiAgSXQgaXMgYWxzbyBwb3NzaWJsZSB0aGF0DQo+Pj4gbmV0ZnJvbnQgYW5kIGJsa2Zy
b250IGNvdWxkIHJhY2UgYWdhaW5zdCBlYWNoIG90aGVyIGluIGEgd2F5IHRoYXQgY2F1c2Vz
DQo+Pj4gdGhpcywgdGhvdWdoIEkgc3VzcGVjdCB0aGF0IHJhY2Ugd291bGQgYmUgbXVjaCBo
YXJkZXIgdG8gdHJpZ2dlci4NCj4+Pg0KPj4+IFRoaXMgaGFzIGhhcHBlbmVkIG1vcmUgdGhh
biBvbmNlIHNvIGl0IGlzIG5vdCBhIGZsdWtlIGR1ZSB0byBlLmcuIGNvc21pYw0KPj4+IHJh
eXMgb3Igb3RoZXIgcmFuZG9tIGJpdC1mbGlwcy4NCj4+Pg0KPj4+IE1hcmVrLCBkbyB5b3Ug
aGF2ZSBhbnkgc3VnZ2VzdGlvbnM/DQo+Pg0KPj4gVG8gbWUgdGhhdCBzb3VuZHMgbGlrZSB0
aGUgaW50ZXJmYWNlIG9mIHRoZSBHVUkgaXMgdGhlIGN1bHByaXQuDQo+Pg0KPj4gVGhlIEdV
SSBhZ2VudCBpbiB0aGUgZ3Vlc3Qgc2hvdWxkIG9ubHkgZnJlZSBhIGdyYW50LCBpZiBpdCBn
b3QgYSBtZXNzYWdlDQo+PiBmcm9tIHRoZSBiYWNrZW5kIHRoYXQgaXQgY2FuIGRvIHNvLiBK
dXN0IGFzc3VtaW5nIHRvIGJlIGFibGUgdG8gZnJlZSBpdA0KPj4gYmVjYXVzZSBpdCBpc24n
dCBpbiB1c2UgY3VycmVudGx5IGlzIHRoZSBicm9rZW4gYXNzdW1wdGlvbiBoZXJlLg0KPiAN
Cj4gRldJVywgSSBoaXQgdGhpcyBpc3N1ZSB0d2ljZSBhbHJlYWR5IGluIHRoaXMgd2VlayBD
SSBydW4sIHdoaWxlIGl0IG5ldmVyDQo+IGhhcHBlbmVkIGJlZm9yZS4gVGhlIGRpZmZlcmVu
Y2UgY29tcGFyZWQgdG8gcHJldmlvdXMgcnVuIGlzIExpbnV4DQo+IDUuMTUuNTcgdnMgNS4x
NS42MS4gVGhlIGxhdHRlciByZXBvcnRzIHBlcnNpc3RlbnQgZ3JhbnRzIGRpc2FibGVkLg0K
DQpJIHRoaW5rIHRoaXMgYWRkaXRpb25hbCBidWcgaXMganVzdCB0cmlnZ2VyaW5nIHRoZSBy
YWNlIGluIHRoZSBHVUkNCmludGVyZmFjZSBtb3JlIGVhc2lseSwgYXMgYmxrZnJvbnQgd2ls
bCBhbGxvY2F0ZSBuZXcgZ3JhbnRzIHdpdGggYQ0KbXVjaCBoaWdoZXIgZnJlcXVlbmN5Lg0K
DQpTbyBmaXhpbmcgdGhlIHBlcnNpc3RlbnQgZ3JhbnQgaXNzdWUgd2lsbCBqdXN0IHBhcGVy
IG92ZXIgdGhlIHJlYWwNCmlzc3VlLg0KDQoNCkp1ZXJnZW4NCg==
--------------Ri0nBVFBWgKviEHToqM3cNRy
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

--------------Ri0nBVFBWgKviEHToqM3cNRy--

--------------sHVZTISGKAXDPA8yDFm0XKeA--

--------------5S6botwjJEwzBqS5v0I0jNkY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMFwSwFAwAAAAAACgkQsN6d1ii/Ey/8
RQf9FsZqJsJmQ9bjinApM8w9XKoKhXFn05pewOwD5rJoq6FsR/P68kXUI6UBlfz6zD0pXWaoONWS
CLUtxTg8T++ohqIzcduSDb9bM2fnhvrp4rLGB1tkhoTXxcLrBFceUIV6e/52WGhreyiZdbXnU4Mp
qvqppJxTNzhTXIf+MT3iiFg8JcuK+l8kFnSlrrUJJhlKm9xTi2odrbWaUI8WN4ed2Dm/Gg+u8JWR
Zpyqm0KzXCWhnnFNpLWH9H2JFAa9B+jNJMt7ffz+EACLI7EI2ipebOyTWwWEayzfg3LU2gvJ6xwR
wFqCqRxIlaECBRJOxgijXumXym9JtyA9WrU2tCbyhA==
=vpPS
-----END PGP SIGNATURE-----

--------------5S6botwjJEwzBqS5v0I0jNkY--

