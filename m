Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181A4DAD2E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 10:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291090.493858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUPZN-0005Y5-KK; Wed, 16 Mar 2022 09:03:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291090.493858; Wed, 16 Mar 2022 09:03:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUPZN-0005Uv-GF; Wed, 16 Mar 2022 09:03:49 +0000
Received: by outflank-mailman (input) for mailman id 291090;
 Wed, 16 Mar 2022 09:03:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/w4J=T3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nUPZM-0005Up-3Z
 for xen-devel@lists.xenproject.org; Wed, 16 Mar 2022 09:03:48 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb8ae6e3-a507-11ec-853b-5f4723681683;
 Wed, 16 Mar 2022 10:03:44 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4A61C1F38A;
 Wed, 16 Mar 2022 09:03:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31E6813AE4;
 Wed, 16 Mar 2022 09:03:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OIzfCvCnMWKMdAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 16 Mar 2022 09:03:44 +0000
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
X-Inumbo-ID: fb8ae6e3-a507-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1647421424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wFyLOEwLnyi3cTzMQ2WLCR0Iok7tTBoPgpCIreclGw8=;
	b=UxdqW2UX4m7+9O7MSCKV7DcUy4ciQbmO32i1kBSJNvAPx2mTJ/hh42mFKVogw6syjSFh7f
	kLp9I46oT87yyJQQ8+ses6nzpSctJlE/y21As2KvkKDdAiE+pWHDMOFL+bfh3h1TVRZtkc
	abZyxSJ3vesJ9HQdd5qpglQGXnax7Kk=
Message-ID: <b31ccba4-6a99-9ac6-b50a-a2b32e570a44@suse.com>
Date: Wed, 16 Mar 2022 10:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
References: <20220228112224.18942-1-jgross@suse.com>
 <c489f4f8-c24e-ba73-b33e-b797527d25ac@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] include/public: add command result definitions to
 vscsiif.h
In-Reply-To: <c489f4f8-c24e-ba73-b33e-b797527d25ac@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------e5JD20mlWYf567oHwms0500D"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------e5JD20mlWYf567oHwms0500D
Content-Type: multipart/mixed; boundary="------------pFZ5v8EQMOYqzwM0eAbfMJ3y";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Message-ID: <b31ccba4-6a99-9ac6-b50a-a2b32e570a44@suse.com>
Subject: Re: [PATCH] include/public: add command result definitions to
 vscsiif.h
References: <20220228112224.18942-1-jgross@suse.com>
 <c489f4f8-c24e-ba73-b33e-b797527d25ac@suse.com>
In-Reply-To: <c489f4f8-c24e-ba73-b33e-b797527d25ac@suse.com>

--------------pFZ5v8EQMOYqzwM0eAbfMJ3y
Content-Type: multipart/mixed; boundary="------------puNbJzwg5Bg6wUCwAbTaVFkZ"

--------------puNbJzwg5Bg6wUCwAbTaVFkZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTQuMDMuMjIgMTA6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyOC4wMi4yMDIy
IDEyOjIyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVi
bGljL2lvL3ZzY3NpaWYuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL3ZzY3Np
aWYuaA0KPj4gQEAgLTMxNSw2ICszMTUsMzMgQEAgc3RydWN0IHZzY3NpaWZfcmVzcG9uc2Ug
ew0KPj4gICB9Ow0KPj4gICB0eXBlZGVmIHN0cnVjdCB2c2NzaWlmX3Jlc3BvbnNlIHZzY3Np
aWZfcmVzcG9uc2VfdDsNCj4+ICAgDQo+PiArLyogU0NTSSBJL08gc3RhdHVzIGZyb20gdnNj
c2lpZl9yZXNwb25zZS0+cnNsdCAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9T
VEFUVVMoeCkgICh4ICYgMHgwMGZmKQ0KPiANCj4gTm8gI2RlZmluZS1zIGZvciBpbmRpdmlk
dWFsIHZhbHVlcyBmb3IgdGhpcz8gSSBzZWUgdGhlIGJhY2tlbmQgdXNlDQo+IGUuZy4gU1VD
Q0VTUyBhbmQgRkFJTEVELCB3aGVyZXZlciB0aGVzZSBjb21lIGZyb20gLi4uDQoNCk9oLCBy
aWdodCwgdGhvc2UgYXJlIGJlaW5nIHVzZWQgZm9yIHRoZSByZXNldCBhY3Rpb25zLiBUaGFu
a3MgZm9yDQpzcG90dGluZy4NCg0KVGhlICJub3JtYWwiIHJlcXVlc3QgcmVzdWx0IHZhbHVl
cyBhcmUgZGVmaW5lZCBhdCB0aGUgU0NTSSBsYXllci4NCg0KPiBBbHNvIHBsZWFzZSBwYXJl
bnRoZXNpemUgeCBoZXJlIGFuZCAuLi4NCj4gDQo+PiArLyogSG9zdCBJL08gc3RhdHVzIGZy
b20gdnNjc2lpZl9yZXNwb25zZS0+cnNsdCAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZf
UlNMVF9IT1NUKHgpICAgICgodW5zaWduZWQpeCA+PiAxNikNCj4gDQo+IC4uLiBoZXJlLg0K
DQpPa2F5Lg0KDQo+IFlvdSBjYXN0IHRvIHVuc2lnbmVkIGhlcmUsIGJ1dCByc2x0IGlzIGEg
c2lnbmVkIGZpZWxkLiBJcyBpdCByZWFsbHkNCj4gdGhlIGVudGlyZSB1cHBlciAxNiBiaXRz
IHRoYXQgYXJlIHRoZSBob3N0IEkvTyBzdGF0dXM/DQoNCkkgdGhvdWdodCBJIGhhdmUgc2Vl
biBpdCBiZWluZyB1c2VkIHRoaXMgd2F5LCBidXQgbm93IEkndmUgZm91bmQgdGhlDQpkZWZp
bml0aW9uIG9mICJob3N0X2J5dGUoKSIgaW5kaWNhdGluZyBpdCBpcyBvbmx5IDggYml0cyB3
aWRlLiBXaWxsDQpjaGFuZ2UgdGhhdC4NCg0KPiANCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlG
X1JTTFRfSE9TVF9PSyAgICAgICAgIDANCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRf
SE9TVF9OT19DT05OICAgIDEgLyogQ291bGRuJ3QgY29ubmVjdCBiZWZvcmUgdGltZW91dCAq
Lw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0JVU19CVVNZICAgMiAvKiBC
VVMgYnVzeSB0aHJvdWdoIHRpbWVvdXQgKi8NCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JT
TFRfSE9TVF9USU1FX09VVCAgIDMgLyogVElNRUQgT1VUIGZvciBvdGhlciByZWFzb24gKi8N
Cj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9CQURfVEFSRyAgIDQgLyogQkFE
IHRhcmdldCAqLw0KPiANCj4gQXJlIHRoZSBhbGwtdXBwZXItY2FzZSB3b3JkcyByZWFsbHkg
aW4gbmVlZCBvZiBtaXJyb3JpbmcgdGhpcw0KPiBhc3BlY3QgZnJvbSBMaW51eD8gVG8gbWUg
aXQgZ2l2ZXMgdGhlIGltcHJlc3Npb24gb2YgdGhpcyBiZWluZw0KPiBhY3JvbnltcyBvZiBz
b21lIHNvcnQgYXQgdGhlIGZpcnN0IGdsYW5jZS4NCg0KVGhlIGJhY2tlbmQgY2FuIHJldHVy
biBhbGwgdGhlc2UgdmFsdWVzLCBzbyBJIHRoaW5rIEkgbmVlZCB0byBkZWZpbmUNCnRoZW0g
aGVyZS4NCg0KPiANCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9BQk9SVCAg
ICAgIDUgLyogQWJvcnQgZm9yIHNvbWUgb3RoZXIgcmVhc29uICovDQo+PiArI2RlZmluZSBY
RU5fVlNDU0lJRl9SU0xUX0hPU1RfUEFSSVRZICAgICA2IC8qIFBhcml0eSBlcnJvciAqLw0K
Pj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0VSUk9SICAgICAgNyAvKiBJbnRl
cm5hbCBlcnJvciAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1JFU0VU
ICAgICAgOCAvKiBSZXNldCBieSBzb21lYm9keSAqLw0KPj4gKyNkZWZpbmUgWEVOX1ZTQ1NJ
SUZfUlNMVF9IT1NUX0JBRF9JTlRSICAgOSAvKiBVbmV4cGVjdGVkIGludGVycnVwdCAqLw0K
Pj4gKyNkZWZpbmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX1BBU1NUSFIgICAxMCAvKiBGb3Jj
ZSBjb21tYW5kIHBhc3QgbWlkLWxheWVyICovDQo+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9S
U0xUX0hPU1RfU09GVF9FUlIgIDExIC8qIFJldHJ5IHJlcXVlc3RlZCAqLw0KPj4gKyNkZWZp
bmUgWEVOX1ZTQ1NJSUZfUlNMVF9IT1NUX0lNTV9SRVRSICAxMiAvKiBIaWRkZW4gcmV0cnkg
cmVxdWVzdGVkICovDQo+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfUkVRVUVV
RSAgIDEzIC8qIFJlcXVldWUgY29tbWFuZCByZXF1ZXN0ZWQgKi8NCj4+ICsjZGVmaW5lIFhF
Tl9WU0NTSUlGX1JTTFRfSE9TVF9ESVNSVVBUICAgMTQgLyogVHJhbnNwb3J0IGVycm9yIGRp
c3J1cHRlZCBJL08gKi8NCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9GQUlM
RkFTVCAgMTUgLyogVHJhbnNwb3J0IGNsYXNzIGZhc3RmYWlsZWQgKi8NCj4+ICsjZGVmaW5l
IFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9UQVJHX0ZBSUwgMTYgLyogUGVybWFuZW50IHRhcmdl
dCBmYWlsdXJlICovDQo+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfTkVYX0ZB
SUwgIDE3IC8qIFBlcm1hbmVudCBuZXh1cyBmYWlsdXJlIG9uIHBhdGggKi8NCj4+ICsjZGVm
aW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9OT01FTSAgICAgMTggLyogU3BhY2UgYWxsb2Nh
dGlvbiBmYWlsZWQgKi8NCj4+ICsjZGVmaW5lIFhFTl9WU0NTSUlGX1JTTFRfSE9TVF9NRURf
RVJSICAgMTkgLyogTWVkaXVtIGVycm9yICovDQo+PiArI2RlZmluZSBYRU5fVlNDU0lJRl9S
U0xUX0hPU1RfTUFSR0lOQUwgIDIwIC8qIFRyYW5zcG9ydCBtYXJnaW5hbCBlcnJvcnMgKi8N
Cj4gDQo+IFNvbWUgb2YgdGhlIG5hbWUgc2hvcnRlbmluZyB0aGF0IHlvdSBkaWQsIGNvbXBh
cmluZyB3aXRoIHRoZQ0KPiBMaW51eCBuYW1lcywgaGFzIGdvbmUgYSBsaXR0bGUgdG9vIGZh
ciBmb3IgbXkgdGFzdGUuIEJ1dCB5b3UncmUNCj4gdGhlIG1haW50YWluZXIgLi4uDQoNClRo
ZXJlIGFyZSBiYXNpY2FsbHkgdGhlIGZvbGxvd2luZyBhbHRlcm5hdGl2ZXM6DQoNCi0gdXNl
IGxvbmdlciBuYW1lcyAodXNpbmcgdGhlIExpbnV4IG5hbWVzIHdvdWxkIGVuZCB1cCBpbiBl
LmcuDQogICBYRU5fVlNDU0lJRl9SU0xUX0hPU1RfVFJBTlNQT1JUX0RJU1JVUFRFRCwgbWFr
aW5nIGl0IDEwIGNoYXJzIGxvbmdlcg0KLSBkcm9wIHNvbWUgcGFydCBvZiB0aGUgY29tbW9u
IHByZWZpeCwgZS5nLiB0aGUgIlJTTFRfSE9TVF8iIHBhcnQNCi0ga2VlcCBpdCBhcyBpcw0K
DQpJJ20gYmFzaWNhbGx5IGZpbmUgd2l0aCBhbnkgb2YgdGhvc2UuDQoNCg0KSnVlcmdlbg0K

--------------puNbJzwg5Bg6wUCwAbTaVFkZ
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------puNbJzwg5Bg6wUCwAbTaVFkZ--

--------------pFZ5v8EQMOYqzwM0eAbfMJ3y--

--------------e5JD20mlWYf567oHwms0500D
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmIxp+8FAwAAAAAACgkQsN6d1ii/Ey/c
8QgAlHljT94K2mytJpfyI7Dm8Hy3a2cgTxJQp634A5VkcCWdYjmTAzXEYfnJGRh1yeK/fmFRf7pM
4OtrmEY+Rz9D6K7VODPelpx5+h1VkyvoF5LsqWvfTDJBSEDAJnUSuBWvbmzUJ44XMEya/MFQDnHU
N2d1+Xum38DOJh4CvFoJeN0N/fwgejtTMmHi2G0FtzVHnKiCRNG7K9qNRoGZxHySP+DZmylCGP5V
HB8mBUC3wSx4TqxsdSpmj0x1yE9p4Ykw/bpxnT+o2Dy3wXyUTxNNp3IUJtxriIIoKkjZVr7ToWsi
4Yr5B/Cani7FdnH5rfCTtuHyFTdcLFtYLoXICtECOw==
=7wTm
-----END PGP SIGNATURE-----

--------------e5JD20mlWYf567oHwms0500D--

