Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 350714DAD5E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 10:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291121.493936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUPs4-0002i6-3z; Wed, 16 Mar 2022 09:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291121.493936; Wed, 16 Mar 2022 09:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUPs4-0002fu-0S; Wed, 16 Mar 2022 09:23:08 +0000
Received: by outflank-mailman (input) for mailman id 291121;
 Wed, 16 Mar 2022 09:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/w4J=T3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUPs2-0002fo-Q7
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 09:23:06 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af636a25-a50a-11ec-8eba-a37418f5ba1a;
 Wed, 16 Mar 2022 10:23:05 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0FF4E1F38C;
 Wed, 16 Mar 2022 09:23:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC015139FE;
 Wed, 16 Mar 2022 09:23:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zsP+N3isMWJbfQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Mar 2022 09:23:04 +0000
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
X-Inumbo-ID: af636a25-a50a-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647422585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=92IYh2EHXhcp2ghi4d653UoN8re1uPGJeBITLLs/VPw=;
	b=pnR1hlkowJOXArKNT96pSZfDoI8wPrIPU1dlIvnftR2LskICiPLdHb/cdsbixcc+GUVHqz
	qZYPtvc+T2PavNXC1H43tRkXQz3CfmJVt07gFlklfsP99fs3QkXsQEtNAXmavzmrnj02Rb
	Z6N227UEpuEj5O3Z645woXq9h/x8Yzo=
Message-ID: <245b98ef-e0b3-daee-b186-020abbe53b92@suse.com>
Date: Wed, 16 Mar 2022 10:23:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] include/public: add command result definitions to
 vscsiif.h
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20220228112224.18942-1-jgross@suse.com>
 <c489f4f8-c24e-ba73-b33e-b797527d25ac@suse.com>
 <b31ccba4-6a99-9ac6-b50a-a2b32e570a44@suse.com>
 <e836cd5d-b59e-948f-5de2-61766377b27d@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <e836cd5d-b59e-948f-5de2-61766377b27d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------06cPaq5Ej0NAIMRw4tFitcJI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------06cPaq5Ej0NAIMRw4tFitcJI
Content-Type: multipart/mixed; boundary="------------SMk0y100lipGo1YQsjzlYZ0n";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <245b98ef-e0b3-daee-b186-020abbe53b92@suse.com>
Subject: Re: [PATCH] include/public: add command result definitions to
 vscsiif.h
References: <20220228112224.18942-1-jgross@suse.com>
 <c489f4f8-c24e-ba73-b33e-b797527d25ac@suse.com>
 <b31ccba4-6a99-9ac6-b50a-a2b32e570a44@suse.com>
 <e836cd5d-b59e-948f-5de2-61766377b27d@suse.com>
In-Reply-To: <e836cd5d-b59e-948f-5de2-61766377b27d@suse.com>

--------------SMk0y100lipGo1YQsjzlYZ0n
Content-Type: multipart/mixed; boundary="------------ZYqOcLw0W6faGQSxsk48E3fz"

--------------ZYqOcLw0W6faGQSxsk48E3fz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDMuMjIgMTA6MDksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNi4wMy4yMDIy
IDEwOjAzLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTQuMDMuMjIgMTA6NTUsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDI4LjAyLjIwMjIgMTI6MjIsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9PSyAgICAg
ICAgIDANCj4+Pj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX05PX0NPTk4gICAg
MSAvKiBDb3VsZG4ndCBjb25uZWN0IGJlZm9yZSB0aW1lb3V0ICovDQo+Pj4+ICsjZGVmaW5l
IFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9CVVNfQlVTWSAgIDIgLyogQlVTIGJ1c3kgdGhyb3Vn
aCB0aW1lb3V0ICovDQo+Pj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9USU1F
X09VVCAgIDMgLyogVElNRUQgT1VUIGZvciBvdGhlciByZWFzb24gKi8NCj4+Pj4gKyNkZWZp
bmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0JBRF9UQVJHICAgNCAvKiBCQUQgdGFyZ2V0ICov
DQo+Pj4NCj4+PiBBcmUgdGhlIGFsbC11cHBlci1jYXNlIHdvcmRzIHJlYWxseSBpbiBuZWVk
IG9mIG1pcnJvcmluZyB0aGlzDQo+Pj4gYXNwZWN0IGZyb20gTGludXg/IFRvIG1lIGl0IGdp
dmVzIHRoZSBpbXByZXNzaW9uIG9mIHRoaXMgYmVpbmcNCj4+PiBhY3JvbnltcyBvZiBzb21l
IHNvcnQgYXQgdGhlIGZpcnN0IGdsYW5jZS4NCj4+DQo+PiBUaGUgYmFja2VuZCBjYW4gcmV0
dXJuIGFsbCB0aGVzZSB2YWx1ZXMsIHNvIEkgdGhpbmsgSSBuZWVkIHRvIGRlZmluZQ0KPj4g
dGhlbSBoZXJlLg0KPiANCj4gT2gsIEkgcmVhbGl6ZSBJIGRpZG4ndCBzYXkgc28gZXhwbGlj
aXRseSBhbmQgaGVuY2Ugd2hhdCBJIHNhaWQNCj4gZW5kZWQgdXAgYmVpbmcgYW1iaWd1b3Vz
OiBUaGUgcmVtYXJrIHdhcyBvbmx5IGFib3V0IHRoZSBhbGwtDQo+IHVwcGVyLWNhc2Ugd29y
ZHMgaW4gdGhlIGNvbW1lbnRzLiBJIHdvdWxkIHRoaW5rIHRoZXkgY2FuIGJlDQo+IHNwZWxs
ZWQgbm9ybWFsbHkuDQoNCkFoLCBva2F5LiA6LSkNCg0KV2lsbCBjaGFuZ2UgdGhhdC4NCg0K
PiANCj4+Pj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0FCT1JUICAgICAgNSAv
KiBBYm9ydCBmb3Igc29tZSBvdGhlciByZWFzb24gKi8NCj4+Pj4gKyNkZWZpbmUgWEVOX1ZT
Q1NJSUZfUlNMVF9IT1NUX1BBUklUWSAgICAgNiAvKiBQYXJpdHkgZXJyb3IgKi8NCj4+Pj4g
KyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0VSUk9SICAgICAgNyAvKiBJbnRlcm5h
bCBlcnJvciAqLw0KPj4+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfUkVTRVQg
ICAgICA4IC8qIFJlc2V0IGJ5IHNvbWVib2R5ICovDQo+Pj4+ICsjZGVmaW5lIFhFTl9WU0NT
SUlGX1JTTFRfSE9TVF9CQURfSU5UUiAgIDkgLyogVW5leHBlY3RlZCBpbnRlcnJ1cHQgKi8N
Cj4+Pj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1BBU1NUSFIgICAxMCAvKiBG
b3JjZSBjb21tYW5kIHBhc3QgbWlkLWxheWVyICovDQo+Pj4+ICsjZGVmaW5lIFhFTl9WU0NT
SUlGX1JTTFRfSE9TVF9TT0ZUX0VSUiAgMTEgLyogUmV0cnkgcmVxdWVzdGVkICovDQo+Pj4+
ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9JTU1fUkVUUiAgMTIgLyogSGlkZGVu
IHJldHJ5IHJlcXVlc3RlZCAqLw0KPj4+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hP
U1RfUkVRVUVVRSAgIDEzIC8qIFJlcXVldWUgY29tbWFuZCByZXF1ZXN0ZWQgKi8NCj4+Pj4g
KyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0RJU1JVUFQgICAxNCAvKiBUcmFuc3Bv
cnQgZXJyb3IgZGlzcnVwdGVkIEkvTyAqLw0KPj4+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9S
U0xUX0hPU1RfRkFJTEZBU1QgIDE1IC8qIFRyYW5zcG9ydCBjbGFzcyBmYXN0ZmFpbGVkICov
DQo+Pj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9UQVJHX0ZBSUwgMTYgLyog
UGVybWFuZW50IHRhcmdldCBmYWlsdXJlICovDQo+Pj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlG
X1JTTFRfSE9TVF9ORVhfRkFJTCAgMTcgLyogUGVybWFuZW50IG5leHVzIGZhaWx1cmUgb24g
cGF0aCAqLw0KPj4+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfTk9NRU0gICAg
IDE4IC8qIFNwYWNlIGFsbG9jYXRpb24gZmFpbGVkICovDQo+Pj4+ICsjZGVmaW5lIFhFTl9W
U0NTSUlGX1JTTFRfSE9TVF9NRURfRVJSICAgMTkgLyogTWVkaXVtIGVycm9yICovDQo+Pj4+
ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9NQVJHSU5BTCAgMjAgLyogVHJhbnNw
b3J0IG1hcmdpbmFsIGVycm9ycyAqLw0KPj4+DQo+Pj4gU29tZSBvZiB0aGUgbmFtZSBzaG9y
dGVuaW5nIHRoYXQgeW91IGRpZCwgY29tcGFyaW5nIHdpdGggdGhlDQo+Pj4gTGludXggbmFt
ZXMsIGhhcyBnb25lIGEgbGl0dGxlIHRvbyBmYXIgZm9yIG15IHRhc3RlLiBCdXQgeW91J3Jl
DQo+Pj4gdGhlIG1haW50YWluZXIgLi4uDQo+Pg0KPj4gVGhlcmUgYXJlIGJhc2ljYWxseSB0
aGUgZm9sbG93aW5nIGFsdGVybmF0aXZlczoNCj4+DQo+PiAtIHVzZSBsb25nZXIgbmFtZXMg
KHVzaW5nIHRoZSBMaW51eCBuYW1lcyB3b3VsZCBlbmQgdXAgaW4gZS5nLg0KPj4gICAgIFhF
Tl9WU0NTSUlGX1JTTFRfSE9TVF9UUkFOU1BPUlRfRElTUlVQVEVELCBtYWtpbmcgaXQgMTAg
Y2hhcnMgbG9uZ2VyDQo+PiAtIGRyb3Agc29tZSBwYXJ0IG9mIHRoZSBjb21tb24gcHJlZml4
LCBlLmcuIHRoZSAiUlNMVF9IT1NUXyIgcGFydA0KPj4gLSBrZWVwIGl0IGFzIGlzDQo+Pg0K
Pj4gSSdtIGJhc2ljYWxseSBmaW5lIHdpdGggYW55IG9mIHRob3NlLg0KPiANCj4gTXkgcGVy
c29uYWwgcHJlZmVyZW5jZSB3b3VsZCBiZSBpbiB0aGUgb3JkZXIgeW91IG5hbWVkIHRoZQ0K
PiBhbHRlcm5hdGl2ZXMsIHBlcmhhcHMgd2l0aCBwcmVwZW5kaW5nIHRoZW0gYnkgInVzZSBs
b25nZXIgbmFtZXMsDQo+IGJ1dCBpbiBleHRyZW1lIGNhc2VzIG5vdCBxdWl0ZSBhcyBsb25n
IGFzIExpbnV4J2VzIi4NCg0KT2theSwgZmluZSB3aXRoIG1lLg0KDQoNCkp1ZXJnZW4NCg==

--------------ZYqOcLw0W6faGQSxsk48E3fz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ZYqOcLw0W6faGQSxsk48E3fz--

--------------SMk0y100lipGo1YQsjzlYZ0n--

--------------06cPaq5Ej0NAIMRw4tFitcJI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIxrHgFAwAAAAAACgkQsN6d1ii/Ey8n
ZAf/aIEzrc5cLTySwrtaiylCLyAbYZcCzAkRXUEBmRnh3rVJQrpcndZP/RiNgdWvoV+J53X/Jofh
fbEGIMcQCe6tk3Q9NcD1veYs7tFQ1XX8p74NouozA7E7EUQsciUfSCvP9TcZxuju0Xg4HsIWgRfz
8HmZVzqznux9pmRFG4d4qrGsoHfxhBUj8eEkKQLDWOLNTzirkm959cI6TPR7XKGIwsmK0IlrlNgb
sNUDDR1gnFGatGb6adxhGhtv5AxMubz5bUr7Ha0f+Any/WoFNA8qYEYelr+q6ti/UhiUgGrbXx8B
efJ7lFyOyux8yKzDthWclMfuYPnmRpBhOa2rtc4dFQ==
=Rntt
-----END PGP SIGNATURE-----

--------------06cPaq5Ej0NAIMRw4tFitcJI--

