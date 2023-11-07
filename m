Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 966BC7E41FB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 15:43:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628842.980715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NHK-00078e-9m; Tue, 07 Nov 2023 14:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628842.980715; Tue, 07 Nov 2023 14:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0NHK-00076I-6p; Tue, 07 Nov 2023 14:42:06 +0000
Received: by outflank-mailman (input) for mailman id 628842;
 Tue, 07 Nov 2023 14:42:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ht7K=GU=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r0NHJ-00076C-1Y
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 14:42:05 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d10e4e72-7d7b-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 15:42:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5055C2191E;
 Tue,  7 Nov 2023 14:42:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25746132FD;
 Tue,  7 Nov 2023 14:42:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iaqnB7tMSmVtBwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 07 Nov 2023 14:42:03 +0000
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
X-Inumbo-ID: d10e4e72-7d7b-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699368123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+px4UGZq3KblvjxWb8eI2RvH4pn3orYeHw1AczoWuZE=;
	b=Zm8+/ODSBerdRaWVaqNcjfxurMrmfmMaBXedGs1rlJGbfowis1Yd1zeUMrNc8JGORZS+An
	Wj2v2bguLgeAGhwTteEUeaFwwal31B0Z2ZA3/4lpvxep13Vp5Maa5U3k/FfoPgcywMXLHi
	maveonjNRYxH/3Cjov8WELnvTq/TX+A=
Message-ID: <e931f9bd-cbeb-43c3-98a6-7b3dff3af8d3@suse.com>
Date: Tue, 7 Nov 2023 15:42:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/29] tools/xenlogd: add 9pfs stat request support
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-13-jgross@suse.com>
 <CAKf6xpt43A6KAsKT_J0CiCnFme2f=OR3tqLgAGWrJE7hhxnHPw@mail.gmail.com>
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
In-Reply-To: <CAKf6xpt43A6KAsKT_J0CiCnFme2f=OR3tqLgAGWrJE7hhxnHPw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------50DbVLnbLib2gBkWMdo2cdXm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------50DbVLnbLib2gBkWMdo2cdXm
Content-Type: multipart/mixed; boundary="------------3Te7Kt0S9uIgji0IoHAvY2e3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <e931f9bd-cbeb-43c3-98a6-7b3dff3af8d3@suse.com>
Subject: Re: [PATCH 12/29] tools/xenlogd: add 9pfs stat request support
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-13-jgross@suse.com>
 <CAKf6xpt43A6KAsKT_J0CiCnFme2f=OR3tqLgAGWrJE7hhxnHPw@mail.gmail.com>
In-Reply-To: <CAKf6xpt43A6KAsKT_J0CiCnFme2f=OR3tqLgAGWrJE7hhxnHPw@mail.gmail.com>

--------------3Te7Kt0S9uIgji0IoHAvY2e3
Content-Type: multipart/mixed; boundary="------------F8vpcIGvnwDZPfYljdpssr8Q"

--------------F8vpcIGvnwDZPfYljdpssr8Q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTEuMjMgMTU6MDQsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgNTozNOKAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIHRoZSBzdGF0IHJlcXVlc3Qgb2YgdGhlIDlwZnMgcHJvdG9j
b2wuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPg0KPj4gLS0tDQo+PiAgIHRvb2xzL3hlbmxvZ2QvaW8uYyB8IDg5ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDg5IGluc2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVubG9n
ZC9pby5jIGIvdG9vbHMveGVubG9nZC9pby5jDQo+PiBpbmRleCAzNGYxMzdiZTFiLi42ZTky
NjY3ZmFiIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVubG9nZC9pby5jDQo+PiArKysgYi90
b29scy94ZW5sb2dkL2lvLmMNCj4+IEBAIC0zMyw2ICszMyw3IEBADQo+IA0KPj4gK3N0YXRp
YyB2b2lkIGZpbGxfcDlfc3RhdChzdHJ1Y3QgcDlfc3RhdCAqcDlzLCBzdHJ1Y3Qgc3RhdCAq
c3QsIGNvbnN0IGNoYXIgKm5hbWUpDQo+PiArew0KPj4gKyAgICBtZW1zZXQocDlzLCAwLCBz
aXplb2YoKnA5cykpOw0KPj4gKyAgICBmaWxsX3FpZChOVUxMLCAmcDlzLT5xaWQsIHN0KTsN
Cj4+ICsgICAgcDlzLT5tb2RlID0gc3QtPnN0X21vZGUgJiAwNzc3Ow0KPj4gKyAgICBpZiAo
IFNfSVNESVIoc3QtPnN0X21vZGUpICkNCj4+ICsgICAgICAgIHA5cy0+bW9kZSB8PSBQOV9D
UkVBVEVfUEVSTV9ESVI7DQo+PiArICAgIHA5cy0+YXRpbWUgPSBzdC0+c3RfYXRpbWU7DQo+
PiArICAgIHA5cy0+bXRpbWUgPSBzdC0+c3RfbXRpbWU7DQo+PiArICAgIHA5cy0+bGVuZ3Ro
ID0gc3QtPnN0X3NpemU7DQo+PiArICAgIHA5cy0+bmFtZSA9IG5hbWU7DQo+PiArICAgIHA5
cy0+dWlkID0gIiI7DQo+PiArICAgIHA5cy0+Z2lkID0gIiI7DQo+PiArICAgIHA5cy0+bXVp
ZCA9ICIiOw0KPj4gKyAgICBwOXMtPmV4dGVuc2lvbiA9ICIiOw0KPj4gKyAgICBwOXMtPm5f
dWlkID0gMDsNCj4+ICsgICAgcDlzLT5uX2dpZCA9IDA7DQo+IA0KPiBJZiB0aGUgZGFlbW9u
IGlzIHJ1bm5pbmcgYXMgcm9vdCBhbmQgbWFuYWdpbmcgdGhlIGRpcmVjdG9yaWVzLCB0aGVz
ZQ0KPiBwcm9iYWJseSBtYXRjaC4gIFN0aWxsLCBkbyB3ZSB3YW50IHVpZCAmIGdpZCB0byBi
ZSBwb3B1bGF0ZWQgZnJvbSB0aGUNCj4gc3RhdCBzdHJ1Y3Q/DQoNCkkgd291bGRuJ3Qgd2Fu
dCB0byBkbyB0aGF0LiBJbiB0aGUgZW5kIHRoZSBwZXJtaXNzaW9ucyBvZiB0aGUgZGFlbW9u
IGFyZQ0KcmVsZXZhbnQgZm9yIGJlaW5nIGFibGUgdG8gYWNjZXNzIHRoZSBmaWxlcy4gVGhl
cmUgaXMgbm8gbmVlZCB0byBsZWFrIGFueQ0KdWlkcyBhbmQgZ2lkcyBmcm9tIHRoZSBob3N0
IHRvIHRoZSBndWVzdHMuDQoNCj4gDQo+PiArICAgIHA5cy0+bl9tdWlkID0gMDsNCj4+ICsN
Cj4+ICsgICAgLyoNCj4+ICsgICAgICogU2l6ZSBvZiBpbmRpdmlkdWFsIGZpZWxkcyB3aXRo
b3V0IHRoZSBzaXplIGZpZWxkLCBpbmNsdWRpbmcgNSAyLWJ5dGUNCj4+ICsgICAgICogc3Ry
aW5nIGxlbmd0aCBmaWVsZHMuDQo+PiArICAgICAqLw0KPj4gKyAgICBwOXMtPnNpemUgPSA3
MSArIHN0cmxlbihwOXMtPm5hbWUpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBw
OV9zdGF0KGRldmljZSAqZGV2aWNlLCBzdHJ1Y3QgcDlfaGVhZGVyICpoZHIpDQo+PiArew0K
Pj4gKyAgICB1aW50MzJfdCBmaWQ7DQo+PiArICAgIHN0cnVjdCBwOV9maWQgKmZpZHA7DQo+
PiArICAgIHN0cnVjdCBwOV9zdGF0IHA5czsNCj4+ICsgICAgc3RydWN0IHN0YXQgc3Q7DQo+
PiArICAgIHVpbnQxNl90IHRvdGFsX2xlbmd0aDsNCj4gDQo+IHRvdGFsX2xlbmd0aCA9IDA7
DQo+IA0KPiBPdGhlcndpc2UgaXQgaXMgdXNlZCB1bmluaXRpYWxpemVkLg0KDQpJIGRvbid0
IHRoaW5rIHNvLiBUaGVyZSBpcyBhIHNpbmdsZSB1c2VyIGp1c3QgYWZ0ZXIgc2V0dGluZyB0
aGUgdmFyaWFibGUuDQoNCg0KSnVlcmdlbg0K
--------------F8vpcIGvnwDZPfYljdpssr8Q
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

--------------F8vpcIGvnwDZPfYljdpssr8Q--

--------------3Te7Kt0S9uIgji0IoHAvY2e3--

--------------50DbVLnbLib2gBkWMdo2cdXm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVKTLoFAwAAAAAACgkQsN6d1ii/Ey/Z
qQgAkGggQvXTPgr43LvI3qLpi++V7/7qE7zCePy7dqz8l8NrKBzmY7+PqeatGDDSWTIUe/GsAHhj
4V0ntjqeaHMLB437iacln78qw9yYW0ARhZqi1tfzZAkOzCvdu2/MS8lT2Vd43kgRPrI0XPbNZVwC
Hm7btGkd20H7O+opDkKqJlOdchxI8xDn6DB0AGzKZ4j4UwfYXLWWxyrrsAargcsN0W6qnjNVBJkB
3GCV0fWPheOuJuFRttsYdLyZOALrfRviNdFUQqYdP+03fgHH3uhd6I86dj/nQ59tY33Slr69JlMF
s6a6C0cuOY9Jgj5gwan10oxCH4nLPqd42SjdTk60IA==
=6Szf
-----END PGP SIGNATURE-----

--------------50DbVLnbLib2gBkWMdo2cdXm--

