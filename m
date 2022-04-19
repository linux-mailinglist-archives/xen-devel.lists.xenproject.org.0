Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11E506700
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 10:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307855.523185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjJK-0000ow-7z; Tue, 19 Apr 2022 08:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307855.523185; Tue, 19 Apr 2022 08:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngjJK-0000nW-34; Tue, 19 Apr 2022 08:34:10 +0000
Received: by outflank-mailman (input) for mailman id 307855;
 Tue, 19 Apr 2022 08:34:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Io9b=U5=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ngjJH-0000nK-Ur
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 08:34:07 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79edd89d-bfbb-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 10:34:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 856191F74D
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 08:34:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73A91139BE
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 08:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NnbWGv5zXmKebwAAMHmgww
 (envelope-from <jgross@suse.com>)
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 08:34:06 +0000
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
X-Inumbo-ID: 79edd89d-bfbb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650357246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+dyq8NDhaklA8OTK/uOevXhK7ZJOgkPcPUjfRKO/Lg=;
	b=MIutdNCmRAp/FUjJl9H6ECM7VZ4dR3DAe96DCtmUyIhPaIcmvCwnB2bNgX7dXdY0dCFdLP
	eQUhGaDVo5CfqexwSOGXDnur2ibUcEnZG0WYrdH1X3SIAT1OTve2rMnLKBI2YT6k/TJAd+
	jua0tT7fivzOmXupKfU1VKS8jPXuq2U=
Message-ID: <73498b4a-2175-32e1-13d3-2aa0a4ed197c@suse.com>
Date: Tue, 19 Apr 2022 10:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
Content-Language: en-US
To: xen-devel@lists.xenproject.org
References: <20220323085831.27057-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220323085831.27057-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YhzFxh5RbdDhS10y5lOacHpG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YhzFxh5RbdDhS10y5lOacHpG
Content-Type: multipart/mixed; boundary="------------IyT0wBcxtthg0ZdZKqooNc5Z";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Message-ID: <73498b4a-2175-32e1-13d3-2aa0a4ed197c@suse.com>
Subject: Re: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
References: <20220323085831.27057-1-jgross@suse.com>
In-Reply-To: <20220323085831.27057-1-jgross@suse.com>

--------------IyT0wBcxtthg0ZdZKqooNc5Z
Content-Type: multipart/mixed; boundary="------------Z2W1WF7pgtCgDouic2FpT2le"

--------------Z2W1WF7pgtCgDouic2FpT2le
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZz8NCg0KT24gMjMuMDMuMjIgMDk6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IFRo
ZSByZXN1bHQgZmllbGQgb2Ygc3RydWN0IHZzY3NpaWZfcmVzcG9uc2UgaXMgbGFja2luZyBh
IGRldGFpbGVkDQo+IGRlZmluaXRpb24uIFRvZGF5IHRoZSBMaW51eCBrZXJuZWwgaW50ZXJu
YWwgc2NzaSBkZWZpbml0aW9ucyBhcmUgYmVpbmcNCj4gdXNlZCwgd2hpY2ggaXMgbm90IGEg
c2FuZSBpbnRlcmZhY2UgZm9yIGEgUFYgZGV2aWNlIGRyaXZlci4NCj4gDQo+IEFkZCBtYWNy
b3MgdG8gY2hhbmdlIHRoYXQgYnkgdXNpbmcgdG9kYXkncyB2YWx1ZXMgaW4gdGhlIFhFTiBu
YW1lc3BhY2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQo+IC0tLQ0KPiBWMjoNCj4gLSBwdXQgbWFjcm8gcGFyYW1ldGVycyBpbiBw
YXJlbnRoZXNlcyAoSmFuIEJldWxpY2gpDQo+IC0gY29ycmVjdCBYRU5fVlNDU0lJRl9SU0xU
X0hPU1QoKSAoSmFuIEJldWxpY2gpDQo+IC0gbW9yZSB2ZXJib3NlIHJlc3VsdCBkZWZpbmVz
IChKYW4gQmV1bGljaCkNCj4gLSBhZGQgcmVzZXQgcmVzdWx0IGRlZmluZXMgKEphbiBCZXVs
aWNoKQ0KPiAtLS0NCj4gICB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8vdnNjc2lpZi5oIHwgNTEg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDUxIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJs
aWMvaW8vdnNjc2lpZi5oIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3ZzY3NpaWYuaA0KPiBp
bmRleCBjOWNlYjE4ODRkLi44NTUzYjE3Y2M2IDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVk
ZS9wdWJsaWMvaW8vdnNjc2lpZi5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9pby92
c2NzaWlmLmgNCj4gQEAgLTMxNSw2ICszMTUsNTcgQEAgc3RydWN0IHZzY3NpaWZfcmVzcG9u
c2Ugew0KPiAgIH07DQo+ICAgdHlwZWRlZiBzdHJ1Y3QgdnNjc2lpZl9yZXNwb25zZSB2c2Nz
aWlmX3Jlc3BvbnNlX3Q7DQo+ICAgDQo+ICsvKiBTQ1NJIEkvTyBzdGF0dXMgZnJvbSB2c2Nz
aWlmX3Jlc3BvbnNlLT5yc2x0ICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfU1RB
VFVTKHgpICAoKHgpICYgMHgwMGZmKQ0KPiArDQo+ICsvKiBIb3N0IEkvTyBzdGF0dXMgZnJv
bSB2c2NzaWlmX3Jlc3BvbnNlLT5yc2x0ICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JT
TFRfSE9TVCh4KSAgICAoKCh4KSAmIDB4MDBmZjAwMDApID4+IDE2KQ0KPiArI2RlZmluZSBY
RU5fVlNDU0lJRl9SU0xUX0hPU1RfT0sgICAgICAgICAgICAgICAgICAgMA0KPiArLyogQ291
bGRuJ3QgY29ubmVjdCBiZWZvcmUgdGltZW91dCAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJ
Rl9SU0xUX0hPU1RfTk9fQ09OTkVDVCAgICAgICAgICAgMQ0KPiArLyogQnVzIGJ1c3kgdGhy
b3VnaCB0aW1lb3V0ICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9CVVNf
QlVTWSAgICAgICAgICAgICAyDQo+ICsvKiBUaW1lZCBvdXQgZm9yIG90aGVyIHJlYXNvbiAq
Lw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfVElNRV9PVVQgICAgICAgICAg
ICAgMw0KPiArLyogQmFkIHRhcmdldCAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xU
X0hPU1RfQkFEX1RBUkdFVCAgICAgICAgICAgNA0KPiArLyogQWJvcnQgZm9yIHNvbWUgb3Ro
ZXIgcmVhc29uICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9BQk9SVCAg
ICAgICAgICAgICAgICA1DQo+ICsvKiBQYXJpdHkgZXJyb3IgKi8NCj4gKyNkZWZpbmUgWEVO
X1ZTQ1NJSUZfUlNMVF9IT1NUX1BBUklUWSAgICAgICAgICAgICAgIDYNCj4gKy8qIEludGVy
bmFsIGVycm9yICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9FUlJPUiAg
ICAgICAgICAgICAgICA3DQo+ICsvKiBSZXNldCBieSBzb21lYm9keSAqLw0KPiArI2RlZmlu
ZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfUkVTRVQgICAgICAgICAgICAgICAgOA0KPiArLyog
VW5leHBlY3RlZCBpbnRlcnJ1cHQgKi8NCj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9I
T1NUX0JBRF9JTlRSICAgICAgICAgICAgIDkNCj4gKy8qIEZvcmNlIGNvbW1hbmQgcGFzdCBt
aWQtbGF5ZXIgKi8NCj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1BBU1NUSFJP
VUdIICAgICAgICAgMTANCj4gKy8qIFJldHJ5IHJlcXVlc3RlZCAqLw0KPiArI2RlZmluZSBY
RU5fVlNDU0lJRl9SU0xUX0hPU1RfU09GVF9FUlJPUiAgICAgICAgICAxMQ0KPiArLyogSGlk
ZGVuIHJldHJ5IHJlcXVlc3RlZCAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hP
U1RfSU1NX1JFVFJZICAgICAgICAgICAxMg0KPiArLyogUmVxdWV1ZSBjb21tYW5kIHJlcXVl
c3RlZCAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfUkVRVUVVRSAgICAg
ICAgICAgICAxMw0KPiArLyogVHJhbnNwb3J0IGVycm9yIGRpc3J1cHRlZCBJL08gKi8NCj4g
KyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1RSQU5TUE9SVF9ESVNSVVBURUQgMTQN
Cj4gKy8qIFRyYW5zcG9ydCBjbGFzcyBmYXN0ZmFpbGVkICovDQo+ICsjZGVmaW5lIFhFTl9W
U0NTSUlGX1JTTFRfSE9TVF9UUkFOU1BPUlRfRkFJTEZBU1QgIDE1DQo+ICsvKiBQZXJtYW5l
bnQgdGFyZ2V0IGZhaWx1cmUgKi8NCj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NU
X1RBUkdFVF9GQUlMVVJFICAgICAgMTYNCj4gKy8qIFBlcm1hbmVudCBuZXh1cyBmYWlsdXJl
IG9uIHBhdGggKi8NCj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX05FWFVTX0ZB
SUxVUkUgICAgICAgMTcNCj4gKy8qIFNwYWNlIGFsbG9jYXRpb24gb24gZGV2aWNlIGZhaWxl
ZCAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfQUxMT0NfRkFJTFVSRSAg
ICAgICAxOA0KPiArLyogTWVkaXVtIGVycm9yICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlG
X1JTTFRfSE9TVF9NRURJVU1fRVJST1IgICAgICAgIDE5DQo+ICsvKiBUcmFuc3BvcnQgbWFy
Z2luYWwgZXJyb3JzICovDQo+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9UUkFO
U1BPUlRfTUFSR0lOQUwgIDIwDQo+ICsNCj4gKy8qIFJlc3VsdCB2YWx1ZXMgb2YgcmVzZXQg
b3BlcmF0aW9ucyAqLw0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX1JFU0VUX1NVQ0NF
U1MgIDB4MjAwMg0KPiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX1JFU0VUX0ZBSUxFRCAg
IDB4MjAwMw0KPiArDQo+ICAgREVGSU5FX1JJTkdfVFlQRVModnNjc2lpZiwgc3RydWN0IHZz
Y3NpaWZfcmVxdWVzdCwgc3RydWN0IHZzY3NpaWZfcmVzcG9uc2UpOw0KPiAgIA0KPiAgIA0K
DQo=
--------------Z2W1WF7pgtCgDouic2FpT2le
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Z2W1WF7pgtCgDouic2FpT2le--

--------------IyT0wBcxtthg0ZdZKqooNc5Z--

--------------YhzFxh5RbdDhS10y5lOacHpG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmJec/4FAwAAAAAACgkQsN6d1ii/Ey8c
eQf/bQMkknTQZG3NxjxcDIO9m4XDd3PTxiMPwdTyEiL7jc49kWOq/95drIipEiMTQqOHfGHbTo92
wfEUOnd3mTB/um2VblfM4E7Y4glFrDXxMML9f5CGVgO+QL266lIk7TFbMwxfANHIJbXUSp4Ybati
b4hxotcGx56X8EBtpCB2Sd3PTNTKQ4RFmFBhz8C/tvcr8vKvllIvTyg+7pYlPUkmLjyx13fVbSQH
eF/93zSYcpKyMOPx79PxnO3qFE9JJ0lPgdLUh3opvsrVN9tZQdM1lVTWLjVlndzlWhqtm1OC840q
PMQEiMK7wZZJWEZ11oEfISNsvWVDmUZ1MFc8yZuKrg==
=09u3
-----END PGP SIGNATURE-----

--------------YhzFxh5RbdDhS10y5lOacHpG--

