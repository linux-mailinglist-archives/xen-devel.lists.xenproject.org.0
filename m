Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F34E51F9
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 13:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293874.499400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWzs6-0005vM-Nd; Wed, 23 Mar 2022 12:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293874.499400; Wed, 23 Mar 2022 12:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWzs6-0005sr-JW; Wed, 23 Mar 2022 12:13:50 +0000
Received: by outflank-mailman (input) for mailman id 293874;
 Wed, 23 Mar 2022 12:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E8iV=UC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nWzs4-0005si-UW
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 12:13:48 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b11f7f74-aaa2-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 13:13:47 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5E522210F4;
 Wed, 23 Mar 2022 12:13:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48C38132BA;
 Wed, 23 Mar 2022 12:13:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5D1IEPsOO2L5AQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 23 Mar 2022 12:13:47 +0000
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
X-Inumbo-ID: b11f7f74-aaa2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1648037627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7/HcKW6ZS3Tq2LqI1/wXTCckKPaDhzm22jBh5Hg3mdM=;
	b=p/R9lXePWwX6Xb3iD++X7tgAM5C+h+y9FZSuqTuyG35vcCjz1vxZGFGCwV2Vc0Cv9PznAO
	Ney069/t+J/0SEKIldWwP06hwexOjJvOyVvW3DwXrL2UmhVDHvqLyWgSVpLY2tXB2Bixj5
	G1o+1D0+oQDAIFbelC76JFLbsLILwxM=
Message-ID: <0c85502e-f654-ff56-acec-d20b0c7bb7e2@suse.com>
Date: Wed, 23 Mar 2022 13:13:46 +0100
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
 <E1CB4644-C2B7-428F-A3F5-AD15681A0E01@arm.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <E1CB4644-C2B7-428F-A3F5-AD15681A0E01@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZNS0THHpRNqL01ytEQLb04tT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZNS0THHpRNqL01ytEQLb04tT
Content-Type: multipart/mixed; boundary="------------twi0zjI6fDS9ySqhbJXyjl0A";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <0c85502e-f654-ff56-acec-d20b0c7bb7e2@suse.com>
Subject: Re: [PATCH v2] include/public: add command result definitions to
 vscsiif.h
References: <20220323085831.27057-1-jgross@suse.com>
 <C69C67B6-4959-4594-A32B-78044CB0EDB2@arm.com>
 <E1CB4644-C2B7-428F-A3F5-AD15681A0E01@arm.com>
In-Reply-To: <E1CB4644-C2B7-428F-A3F5-AD15681A0E01@arm.com>

--------------twi0zjI6fDS9ySqhbJXyjl0A
Content-Type: multipart/mixed; boundary="------------o0v9kl9lWl0vFDfWcJQ7aGvm"

--------------o0v9kl9lWl0vFDfWcJQ7aGvm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjMuMDMuMjIgMTI6MjIsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+IA0KPiANCj4+IE9u
IDIzIE1hciAyMDIyLCBhdCAxMToxMCwgTHVjYSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBh
cm0uY29tPiB3cm90ZToNCj4+DQo+Pg0KPj4NCj4+PiBPbiAyMyBNYXIgMjAyMiwgYXQgMDg6
NTgsIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4gd3JvdGU6DQo+Pj4NCj4+PiBU
aGUgcmVzdWx0IGZpZWxkIG9mIHN0cnVjdCB2c2NzaWlmX3Jlc3BvbnNlIGlzIGxhY2tpbmcg
YSBkZXRhaWxlZA0KPj4+IGRlZmluaXRpb24uIFRvZGF5IHRoZSBMaW51eCBrZXJuZWwgaW50
ZXJuYWwgc2NzaSBkZWZpbml0aW9ucyBhcmUgYmVpbmcNCj4+PiB1c2VkLCB3aGljaCBpcyBu
b3QgYSBzYW5lIGludGVyZmFjZSBmb3IgYSBQViBkZXZpY2UgZHJpdmVyLg0KPj4+DQo+Pj4g
QWRkIG1hY3JvcyB0byBjaGFuZ2UgdGhhdCBieSB1c2luZyB0b2RheSdzIHZhbHVlcyBpbiB0
aGUgWEVOIG5hbWVzcGFjZS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+PiAtLS0NCj4+PiBWMjoNCj4+PiAtIHB1dCBtYWNy
byBwYXJhbWV0ZXJzIGluIHBhcmVudGhlc2VzIChKYW4gQmV1bGljaCkNCj4+PiAtIGNvcnJl
Y3QgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUKCkgKEphbiBCZXVsaWNoKQ0KPj4+IC0gbW9yZSB2
ZXJib3NlIHJlc3VsdCBkZWZpbmVzIChKYW4gQmV1bGljaCkNCj4+PiAtIGFkZCByZXNldCBy
ZXN1bHQgZGVmaW5lcyAoSmFuIEJldWxpY2gpDQo+Pj4gLS0tDQo+Pj4geGVuL2luY2x1ZGUv
cHVibGljL2lvL3ZzY3NpaWYuaCB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKw0KPj4+IDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2lvL3ZzY3NpaWYuaCBiL3hlbi9pbmNs
dWRlL3B1YmxpYy9pby92c2NzaWlmLmgNCj4+PiBpbmRleCBjOWNlYjE4ODRkLi44NTUzYjE3
Y2M2IDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby92c2NzaWlmLmgN
Cj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvaW8vdnNjc2lpZi5oDQo+Pj4gQEAgLTMx
NSw2ICszMTUsNTcgQEAgc3RydWN0IHZzY3NpaWZfcmVzcG9uc2Ugew0KPj4+IH07DQo+Pj4g
dHlwZWRlZiBzdHJ1Y3QgdnNjc2lpZl9yZXNwb25zZSB2c2NzaWlmX3Jlc3BvbnNlX3Q7DQo+
Pj4NCj4+PiArLyogU0NTSSBJL08gc3RhdHVzIGZyb20gdnNjc2lpZl9yZXNwb25zZS0+cnNs
dCAqLw0KPj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfU1RBVFVTKHgpICAoKHgpICYg
MHgwMGZmKQ0KPiANCj4gU29ycnkgSnVlcmdlbiwNCj4gDQo+IEEgdGhpbmcgY2FtZSB0byBt
ZSBhZnRlciBzZW5kaW5nIG15IGZpcnN0IG1lc3NhZ2UsIGlzIFhFTl9WU0NTSUlGX1JTTFRf
U1RBVFVTIG1lYW50DQo+IHRvIGJlIHVzZWQgdG8gY29tcGFyZSB0aGUgcmVzdWx0IHdpdGgg
WEVOX1ZTQ1NJSUZfUlNMVF9SRVNFVF9TVUNDRVNTIG9yDQo+IFhFTl9WU0NTSUlGX1JTTFRf
UkVTRVRfRkFJTEVEPw0KDQpOby4NCg0KWEVOX1ZTQ1NJSUZfUlNMVF9SRVNFVF8qIGFyZSBt
ZWFudCB0byBiZSBjb21wYXJlZCB3aXRoIHZzY3NpaWZfcmVzcG9uc2UtPnJzbHQuDQoNCg0K
SnVlcmdlbg0K
--------------o0v9kl9lWl0vFDfWcJQ7aGvm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------o0v9kl9lWl0vFDfWcJQ7aGvm--

--------------twi0zjI6fDS9ySqhbJXyjl0A--

--------------ZNS0THHpRNqL01ytEQLb04tT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmI7DvoFAwAAAAAACgkQsN6d1ii/Ey8C
Ywf+ILuDZGkTexddQ5aRXdlS4KL7MKf/1di8fYK7v0HrtvSV2FMQtUPfHl5VXQ1qVsd3fTiW5gtb
NO77KBP0fR7eIpFEYMohgRiz6brC4EePH/mQDwLioCgtOxD/JEyoKoAxlcseDXo/TJEQ3IcGNHDi
VaiYDznwkMOExROZT/4oFfTbgIKsSC7WdVazzuwt2peO0ox4z2OdLMAmD5wpazFgqG1jeR046Xlc
Vx+tzbDUuPvApXUdXpupU2YNX9wRZFi/aKucOaMkVlbD4YWo8Rz2e0RKZO49IV5pVzlN5VwaavDT
8ftMWQUK0lC6mMT9xdTkblyXsWoGNVAovKQBYXZwRg==
=6H/G
-----END PGP SIGNATURE-----

--------------ZNS0THHpRNqL01ytEQLb04tT--

