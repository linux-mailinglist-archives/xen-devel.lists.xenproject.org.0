Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C364E51F1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 13:12:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293871.499388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWzqR-0005MU-BC; Wed, 23 Mar 2022 12:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293871.499388; Wed, 23 Mar 2022 12:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWzqR-0005Jp-7x; Wed, 23 Mar 2022 12:12:07 +0000
Received: by outflank-mailman (input) for mailman id 293871;
 Wed, 23 Mar 2022 12:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E8iV=UC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nWzqP-0005JQ-3m
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 12:12:05 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7330f53f-aaa2-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 13:12:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6011B1F37F;
 Wed, 23 Mar 2022 12:12:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A2FF132BA;
 Wed, 23 Mar 2022 12:12:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KjvbDJMOO2LxfwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Mar 2022 12:12:03 +0000
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
X-Inumbo-ID: 7330f53f-aaa2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648037523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zCsGzqigVI6l83Qgei5aX4ROvt2TW2vFKVAVCIYcWq0=;
	b=F8+AaayAOLfDFxECRZCLhVZVcOFOP22IFGDBgOk+YYxaxxVOt72EjqwIIae7UuCxSfya+C
	YWzgvggvadowP3DoD/Zwl/x9YXawM1wQptOnPKBnp28M15pF391sCkiUj6/iVF+eVFTrYs
	f9aB4ZeRhpSjqLHXcBz6sMufVPL7lW4=
Message-ID: <018d1ab1-c661-2e4c-1e70-ee0f8f3f24ce@suse.com>
Date: Wed, 23 Mar 2022 13:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220323085831.27057-1-jgross@suse.com>
 <C69C67B6-4959-4594-A32B-78044CB0EDB2@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <C69C67B6-4959-4594-A32B-78044CB0EDB2@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------b2hbZBvbBfQozz0P8B0nzBS8"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------b2hbZBvbBfQozz0P8B0nzBS8
Content-Type: multipart/mixed; boundary="------------50jKW0DJfQ869GppBOFgwMlB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <018d1ab1-c661-2e4c-1e70-ee0f8f3f24ce@suse.com>
Subject: Re: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
References: <20220323085831.27057-1-jgross@suse.com>
 <C69C67B6-4959-4594-A32B-78044CB0EDB2@arm.com>
In-Reply-To: <C69C67B6-4959-4594-A32B-78044CB0EDB2@arm.com>

--------------50jKW0DJfQ869GppBOFgwMlB
Content-Type: multipart/mixed; boundary="------------tA0YNQWcKizMJ01aTIC9o0lJ"

--------------tA0YNQWcKizMJ01aTIC9o0lJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjIgMTI6MTAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDIzIE1hciAyMDIyLCBhdCAwODo1OCwgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToNCj4+DQo+PiBUaGUgcmVzdWx0IGZpZWxkIG9mIHN0cnVjdCB2c2NzaWlmX3Jl
c3BvbnNlIGlzIGxhY2tpbmcgYSBkZXRhaWxlZA0KPj4gZGVmaW5pdGlvbi4gVG9kYXkgdGhl
IExpbnV4IGtlcm5lbCBpbnRlcm5hbCBzY3NpIGRlZmluaXRpb25zIGFyZSBiZWluZw0KPj4g
dXNlZCwgd2hpY2ggaXMgbm90IGEgc2FuZSBpbnRlcmZhY2UgZm9yIGEgUFYgZGV2aWNlIGRy
aXZlci4NCj4+DQo+PiBBZGQgbWFjcm9zIHRvIGNoYW5nZSB0aGF0IGJ5IHVzaW5nIHRvZGF5
J3MgdmFsdWVzIGluIHRoZSBYRU4gbmFtZXNwYWNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gVjI6DQo+PiAt
IHB1dCBtYWNybyBwYXJhbWV0ZXJzIGluIHBhcmVudGhlc2VzIChKYW4gQmV1bGljaCkNCj4+
IC0gY29ycmVjdCBYRU5fVlNDU0lJRl9SU0xUX0hPU1QoKSAoSmFuIEJldWxpY2gpDQo+PiAt
IG1vcmUgdmVyYm9zZSByZXN1bHQgZGVmaW5lcyAoSmFuIEJldWxpY2gpDQo+PiAtIGFkZCBy
ZXNldCByZXN1bHQgZGVmaW5lcyAoSmFuIEJldWxpY2gpDQo+PiAtLS0NCj4+IHhlbi9pbmNs
dWRlL3B1YmxpYy9pby92c2NzaWlmLmggfCA1MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysNCj4+IDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby92c2NzaWlmLmggYi94ZW4vaW5j
bHVkZS9wdWJsaWMvaW8vdnNjc2lpZi5oDQo+PiBpbmRleCBjOWNlYjE4ODRkLi44NTUzYjE3
Y2M2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2lvL3ZzY3NpaWYuaA0K
Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3ZzY3NpaWYuaA0KPj4gQEAgLTMxNSw2
ICszMTUsNTcgQEAgc3RydWN0IHZzY3NpaWZfcmVzcG9uc2Ugew0KPj4gfTsNCj4+IHR5cGVk
ZWYgc3RydWN0IHZzY3NpaWZfcmVzcG9uc2UgdnNjc2lpZl9yZXNwb25zZV90Ow0KPj4NCj4+
ICsvKiBTQ1NJIEkvTyBzdGF0dXMgZnJvbSB2c2NzaWlmX3Jlc3BvbnNlLT5yc2x0ICovDQo+
PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX1NUQVRVUyh4KSAgKCh4KSAmIDB4MDBmZikN
Cj4+ICsNCj4+ICsvKiBIb3N0IEkvTyBzdGF0dXMgZnJvbSB2c2NzaWlmX3Jlc3BvbnNlLT5y
c2x0ICovDQo+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1QoeCkgICAgKCgoeCkg
JiAweDAwZmYwMDAwKSA+PiAxNikNCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9T
VF9PSyAgICAgICAgICAgICAgICAgICAwDQo+PiArLyogQ291bGRuJ3QgY29ubmVjdCBiZWZv
cmUgdGltZW91dCAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX05PX0NP
Tk5FQ1QgICAgICAgICAgIDENCj4+ICsvKiBCdXMgYnVzeSB0aHJvdWdoIHRpbWVvdXQgKi8N
Cj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9CVVNfQlVTWSAgICAgICAgICAg
ICAyDQo+PiArLyogVGltZWQgb3V0IGZvciBvdGhlciByZWFzb24gKi8NCj4+ICsjZGVmaW5l
IFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9USU1FX09VVCAgICAgICAgICAgICAzDQo+PiArLyog
QmFkIHRhcmdldCAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0JBRF9U
QVJHRVQgICAgICAgICAgIDQNCj4+ICsvKiBBYm9ydCBmb3Igc29tZSBvdGhlciByZWFzb24g
Ki8NCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9BQk9SVCAgICAgICAgICAg
ICAgICA1DQo+PiArLyogUGFyaXR5IGVycm9yICovDQo+PiArI2RlZmluZSBYRU5fVlNDU0lJ
Rl9SU0xUX0hPU1RfUEFSSVRZICAgICAgICAgICAgICAgNg0KPj4gKy8qIEludGVybmFsIGVy
cm9yICovDQo+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfRVJST1IgICAgICAg
ICAgICAgICAgNw0KPj4gKy8qIFJlc2V0IGJ5IHNvbWVib2R5ICovDQo+PiArI2RlZmluZSBY
RU5fVlNDU0lJRl9SU0xUX0hPU1RfUkVTRVQgICAgICAgICAgICAgICAgOA0KPj4gKy8qIFVu
ZXhwZWN0ZWQgaW50ZXJydXB0ICovDQo+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hP
U1RfQkFEX0lOVFIgICAgICAgICAgICAgOQ0KPj4gKy8qIEZvcmNlIGNvbW1hbmQgcGFzdCBt
aWQtbGF5ZXIgKi8NCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9QQVNTVEhS
T1VHSCAgICAgICAgIDEwDQo+PiArLyogUmV0cnkgcmVxdWVzdGVkICovDQo+PiArI2RlZmlu
ZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfU09GVF9FUlJPUiAgICAgICAgICAxMQ0KPj4gKy8q
IEhpZGRlbiByZXRyeSByZXF1ZXN0ZWQgKi8NCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JT
TFRfSE9TVF9JTU1fUkVUUlkgICAgICAgICAgIDEyDQo+PiArLyogUmVxdWV1ZSBjb21tYW5k
IHJlcXVlc3RlZCAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1JFUVVF
VUUgICAgICAgICAgICAgMTMNCj4+ICsvKiBUcmFuc3BvcnQgZXJyb3IgZGlzcnVwdGVkIEkv
TyAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1RSQU5TUE9SVF9ESVNS
VVBURUQgMTQNCj4+ICsvKiBUcmFuc3BvcnQgY2xhc3MgZmFzdGZhaWxlZCAqLw0KPj4gKyNk
ZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1RSQU5TUE9SVF9GQUlMRkFTVCAgMTUNCj4+
ICsvKiBQZXJtYW5lbnQgdGFyZ2V0IGZhaWx1cmUgKi8NCj4+ICsjZGVmaW5lIFhFTl9WU0NT
SUlGX1JTTFRfSE9TVF9UQVJHRVRfRkFJTFVSRSAgICAgIDE2DQo+PiArLyogUGVybWFuZW50
IG5leHVzIGZhaWx1cmUgb24gcGF0aCAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNM
VF9IT1NUX05FWFVTX0ZBSUxVUkUgICAgICAgMTcNCj4+ICsvKiBTcGFjZSBhbGxvY2F0aW9u
IG9uIGRldmljZSBmYWlsZWQgKi8NCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9T
VF9BTExPQ19GQUlMVVJFICAgICAgIDE4DQo+PiArLyogTWVkaXVtIGVycm9yICovDQo+PiAr
I2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfTUVESVVNX0VSUk9SICAgICAgICAxOQ0K
Pj4gKy8qIFRyYW5zcG9ydCBtYXJnaW5hbCBlcnJvcnMgKi8NCj4+ICsjZGVmaW5lIFhFTl9W
U0NTSUlGX1JTTFRfSE9TVF9UUkFOU1BPUlRfTUFSR0lOQUwgIDIwDQo+IA0KPiBIaSBKdWVy
Z2VuLA0KPiANCj4gV291bGQgaXQgbWFrZXMgc2Vuc2UgdG8gZGVmaW5lIHRoZSB2YWx1ZXMg
aW4gaGV4IGxpa2UgaW4gaW5jbHVkZS9zY3NpL3Njc2lfc3RhdHVzLmgNCj4gc28gdGhhdCB0
aGV5IGFyZSBtb3JlIGVhc3kgdG8gY29tcGFyZT8NCg0KVGhleSBhcmUgbm90IG1lYW50IHRv
IGJlIGNvbXBhcmVkLCBldmVuIGlmIHRoZXkgaGF2ZSAodG9kYXkpIHRoZSBzYW1lDQp2YWx1
ZS4NCg0KPiANCj4gSG93ZXZlciB0aGlzIGxvb2tzIGdvb2QgdG8gbWUsDQo+IA0KPiBSZXZp
ZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQpUaGFu
a3MsDQoNCg0KSnVlcmdlbg0K
--------------tA0YNQWcKizMJ01aTIC9o0lJ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------tA0YNQWcKizMJ01aTIC9o0lJ--

--------------50jKW0DJfQ869GppBOFgwMlB--

--------------b2hbZBvbBfQozz0P8B0nzBS8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI7DpIFAwAAAAAACgkQsN6d1ii/Ey8l
mwf/dyKdpSrl8+VCIp+v859rYF/VxMPWdGe7z4l0aDzRoezulShZbKKIrotDMjp8gxX0SjK0noME
k5o3uXEDASINWPYDjVc0xxRYau99w7LzJOwqAH+3JcawCeNlJnRSKCTHP4Chx7PlHjHvAirYAK+H
8SH3n7R9W+RSGknIEZAWPsnpeTZt17N+mZXh+qFpRI8k1TPv60LyDmfPxuZNKBhnQILZl2QL1X5J
qlAf9cA957gOrKZ/YglH6xVbOxb2nerHSnDv/KcIwSKke+JCc2JvLVAwQQNavQQkfu/iTHxhTeMU
QuROCsbIYF6n4jdAEhX39K7xCsC0afLhfC9y8Hu/oA==
=1ADw
-----END PGP SIGNATURE-----

--------------b2hbZBvbBfQozz0P8B0nzBS8--

