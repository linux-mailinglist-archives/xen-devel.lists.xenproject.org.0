Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351F16C1288
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 14:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511894.791287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peF9J-000707-L2; Mon, 20 Mar 2023 13:02:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511894.791287; Mon, 20 Mar 2023 13:02:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peF9J-0006x3-Hk; Mon, 20 Mar 2023 13:02:05 +0000
Received: by outflank-mailman (input) for mailman id 511894;
 Mon, 20 Mar 2023 13:02:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QRzq=7M=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1peF9I-0006wv-4w
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 13:02:04 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6888dddf-c71f-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 14:02:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AA98E1F890;
 Mon, 20 Mar 2023 13:02:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 848C113A00;
 Mon, 20 Mar 2023 13:02:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oWDKHkpZGGQQcAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Mar 2023 13:02:02 +0000
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
X-Inumbo-ID: 6888dddf-c71f-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679317322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bE9jxlwnzRP2i5+gaGU1nUuSfWi3ABMne7ETypVdgII=;
	b=Zay2zV+W8DOczjVp6EdrIMfUZY6jZ9uHMlGa8HI656u2e0WyvwpkOBB9es7bdJARR0iJDU
	19zjkQv7pEI8VcopU6MlmrjiJfJxT0mogjcrjJgxOE+5VA4d7hrbqmigvsOdGCgOjyCJgY
	5gj+pPak8M6jP9tlp5P1e556rrKU30M=
Message-ID: <0303d8a7-722f-3c84-042a-1cdb059beee6@suse.com>
Date: Mon, 20 Mar 2023 14:02:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
 <0834ffcb-978d-5c5b-4efc-64f3527e1038@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
In-Reply-To: <0834ffcb-978d-5c5b-4efc-64f3527e1038@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j3e8JCrW3e0yyV9YXTA1EmY2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------j3e8JCrW3e0yyV9YXTA1EmY2
Content-Type: multipart/mixed; boundary="------------fWSvfWXpM3502uD0fF3sRIRk";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <0303d8a7-722f-3c84-042a-1cdb059beee6@suse.com>
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <cf55f9d9-42c2-f5e3-ed91-f75cc4ee9641@suse.com>
 <0834ffcb-978d-5c5b-4efc-64f3527e1038@suse.com>
In-Reply-To: <0834ffcb-978d-5c5b-4efc-64f3527e1038@suse.com>

--------------fWSvfWXpM3502uD0fF3sRIRk
Content-Type: multipart/mixed; boundary="------------W7RQHYhloTQSrRAtF0PUx65f"

--------------W7RQHYhloTQSrRAtF0PUx65f
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDMuMjMgMTE6MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxNy4wMy4yMDIz
IDE0OjU2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMTUuMDIuMjMgMDk6MzEsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IEV2ZW50dWFsbHkgeWVzLiBCdXQgSSB3b3VsZCBwcmVm
ZXIgdG8gc29ydCB0aGUgYWJvdmUgcXVlc3Rpb24gZmlyc3QNCj4+PiAod2hpY2ggSSdtIHN1
cmUgd291bGQgaGF2ZSBiZWVuIHJhaXNlZCBieSB0aGVtLCBpbiBwZXJoYXBzIG1vcmUNCj4+
PiBoYXJzaCBhIHdheSksIGhlbmNlIHRoZSBpbml0aWFsbHkgbGltaXRlZCBleHBvc3VyZS4N
Cj4+DQo+PiBJJ2QgcmF0aGVyIGFkZCBfb25lXyBob29rIGZvciBYZW4tUFYgaW4gY2hlY2tf
YnVncygpIGp1c3QgYmVmb3JlIHRoZSBjYWxsDQo+PiBvZiBhcmNoX3NtdF91cGRhdGUoKS4g
VGhpcyBjYW4gdGhlbiBjb3JyZWN0IGFueSBuZWVkZWQgbWl0aWdhdGlvbiBzZXR0aW5ncy4N
Cj4gDQo+IERvaW5nIHRoaXMgaW4gc2luZ2xlIGNlbnRyYWwgcGxhY2UgaXMgd2hhdCBJIHdh
cyBvcmlnaW5hbGx5IGhvcGluZyBJDQo+IGNvdWxkIGRvLiBCdXQgdGhhdCBzaW1wbHkgZG9l
c24ndCB3b3JrIChhZmFpY3QpOiBJdCBpcyBmb3IgYSByZWFzb24NCj4gdGhhdCBJIGFwcGx5
IHRoZSBhZGp1c3RtZW50IGluIHRoZSBSRVRCTEVFRF9NSVRJR0FUSU9OX0lCUEIgY2FzZSwg
YnkNCj4gc3VwcHJlc3NpbmcgdGhlIHNldHRpbmcgb2YgdGhlIGZlYXR1cmUgYml0LiBOb3Qg
dGhlIGxlYXN0IGJlY2F1c2UgLi4uDQo+IA0KPj4gU28gc29tZXRoaW5nIGxpa2UgKG5vdGUg
dGhhdCBkdWUgdG8gdXNpbmcgY3B1X2ZlYXR1cmVfZW5hYmxlZChYODZfRkVBVFVSRV9YRU5Q
VikNCj4+IERDRSBpcyBoYXBwZW5pbmcgaW4gY2FzZSBDT05GSUdfWEVOX1BWIGlzbid0IGRl
ZmluZWQpIjoNCj4+DQo+PiAtLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlwZXJ2
aXNvci5oDQo+PiArKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS94ZW4vaHlwZXJ2aXNvci5o
DQo+PiBAQCAtNjMsNCArNjMsNyBAQCB2b2lkIF9faW5pdCB4ZW5fcHZoX2luaXQoc3RydWN0
IGJvb3RfcGFyYW1zICpib290X3BhcmFtcyk7DQo+PiAgICB2b2lkIF9faW5pdCBtZW1fbWFw
X3ZpYV9oY2FsbChzdHJ1Y3QgYm9vdF9wYXJhbXMgKmJvb3RfcGFyYW1zX3ApOw0KPj4gICAg
I2VuZGlmDQo+Pg0KPj4gK2ludCBfX2luaXQgeGVuX3ZtX2Fzc2lzdF9pYnBiKGJvb2wgZW5h
YmxlKTsNCj4+ICt2b2lkIF9faW5pdCB4ZW5fcHZfZml4X21pdGlnYXRpb25zKHZvaWQpOw0K
Pj4gKw0KPj4gICAgI2VuZGlmIC8qIF9BU01fWDg2X1hFTl9IWVBFUlZJU09SX0ggKi8NCj4+
IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcHUvYnVncy5jDQo+PiArKysgYi9hcmNoL3g4Ni9r
ZXJuZWwvY3B1L2J1Z3MuYw0KPj4gQEAgLTE4LDYgKzE4LDggQEANCj4+ICAgICNpbmNsdWRl
IDxsaW51eC9wZ3RhYmxlLmg+DQo+PiAgICAjaW5jbHVkZSA8bGludXgvYnBmLmg+DQo+Pg0K
Pj4gKyNpbmNsdWRlIDx4ZW4veGVuLmg+DQo+PiArDQo+PiAgICAjaW5jbHVkZSA8YXNtL3Nw
ZWMtY3RybC5oPg0KPj4gICAgI2luY2x1ZGUgPGFzbS9jbWRsaW5lLmg+DQo+PiAgICAjaW5j
bHVkZSA8YXNtL2J1Z3MuaD4NCj4+IEBAIC0xNzcsNiArMTc5LDkgQEAgdm9pZCBfX2luaXQg
Y2hlY2tfYnVncyh2b2lkKQ0KPj4gICAgICAgICAgIHNyYmRzX3NlbGVjdF9taXRpZ2F0aW9u
KCk7DQo+PiAgICAgICAgICAgbDFkX2ZsdXNoX3NlbGVjdF9taXRpZ2F0aW9uKCk7DQo+Pg0K
Pj4gKyAgICAgICBpZiAoY3B1X2ZlYXR1cmVfZW5hYmxlZChYODZfRkVBVFVSRV9YRU5QVikp
DQo+PiArICAgICAgICAgICAgICAgeGVuX3B2X2ZpeF9taXRpZ2F0aW9ucygpOw0KPj4gKw0K
Pj4gICAgICAgICAgIGFyY2hfc210X3VwZGF0ZSgpOw0KPj4NCj4+ICAgICNpZmRlZiBDT05G
SUdfWDg2XzMyDQo+PiAtLS0gYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmMNCj4+ICsr
KyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYw0KPj4gQEAgLTE0NzYsNiArMTQ3Niwy
MyBAQCBzdGF0aWMgdWludDMyX3QgX19pbml0IHhlbl9wbGF0Zm9ybV9wdih2b2lkKQ0KPj4g
ICAgICAgICAgIHJldHVybiAwOw0KPj4gICAgfQ0KPj4NCj4+ICtpbnQgX19pbml0IHhlbl92
bV9hc3Npc3RfaWJwYihib29sIGVuYWJsZSkNCj4+ICt7DQo+PiArICAgICAgIC8qDQo+PiAr
ICAgICAgICAqIE5vdGUgdGhhdCB0aGUgVk0tYXNzaXN0IGlzIGEgZGlzYWJsZSwgc28gYSBy
ZXF1ZXN0IHRvIGVuYWJsZSBJQlBCDQo+PiArICAgICAgICAqIG9uIG91ciBiZWhhbGYgbmVl
ZHMgdG8gdHVybiB0aGUgZnVuY3Rpb25hbGl0eSBvZmYgKGFuZCB2aWNlIHZlcnNhKS4NCj4+
ICsgICAgICAgICovDQo+PiArICAgICAgIHJldHVybiBIWVBFUlZJU09SX3ZtX2Fzc2lzdChl
bmFibGUgPyBWTUFTU1RfQ01EX2Rpc2FibGUNCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA6IFZNQVNTVF9DTURfZW5hYmxlLA0KPj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgVk1BU1NUX1RZUEVfbW9kZV9zd2l0Y2hfbm9f
aWJwYik7DQo+PiArfQ0KPj4gKw0KPj4gK3ZvaWQgX19pbml0IHhlbl9wdl9maXhfbWl0aWdh
dGlvbnModm9pZCkNCj4+ICt7DQo+PiArICAgICAgIGlmICgheGVuX3ZtX2Fzc2lzdF9pYnBi
KHRydWUpKQ0KPj4gKyAgICAgICAgICAgICAgIHNldHVwX2NsZWFyX2NwdV9jYXAoWDg2X0ZF
QVRVUkVfRU5UUllfSUJQQik7DQo+IA0KPiAuLi4gdXNpbmcgYm90aCBzZXR1cF9jbGVhcl9j
cHVfY2FwKCkgKGhlcmUpIGFuZCBzZXR1cF9mb3JjZV9jcHVfY2FwKCkNCj4gKGluIHJldGJs
ZWVkX3NlbGVjdF9taXRpZ2F0aW9uKCkgd29uJ3Qgd29yazogVGhlIGxhdHRlciB3aW5zLCBk
dWUgdG8NCj4gaG93IGFwcGx5X2ZvcmNlZF9jYXBzKCkgd29ya3MuDQoNCk9oLCByaWdodC4N
Cg0KSnVzdCBhIHdpbGQgZ3Vlc3Mgb2YgbWluZTogcHJvYmFibHkgdGhlIHg4NiBtYWludGFp
bmVycyB3b3VsZCBzdGlsbCBwcmVmZXINCmEgc2luZ2xlIFhlbiBob29rIHBsdXMgc29tZXRo
aW5nIGxpa2UgYSBzZXR1cF91bmZvcmNlX2NwdV9jYXAoKSBhZGRpdGlvbi4NCg0KPiBCdXQg
b2YgY291cnNlIGNhbGxpbmcgYm90aCBmdW5jdGlvbnMgZm9yIHRoZSBzYW1lIGZlYXR1cmUg
aXMgYm9ndXMNCj4gYW55d2F5LiBJbiBmYWN0IEkgdGhpbmsgaXQgaXMgZm9yIGEgZ29vZCBy
ZWFzb24gdGhhdCBpbiBYZW4gd2UgbG9nIGENCj4gbWVzc2FnZSBpbiBzdWNoIGFuIGV2ZW50
Lg0KDQpEZXBlbmRzLiBGb3IgWGVuIHdlIGRvIHNvIGluIHRoZSBrZXJuZWwgZm9yIG11bHRp
cGxlIGZlYXR1cmVzLCBzZWUNCnhlbl9pbml0X2NhcGFiaWxpdGllcygpLg0KDQoNCkp1ZXJn
ZW4NCg0K
--------------W7RQHYhloTQSrRAtF0PUx65f
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------W7RQHYhloTQSrRAtF0PUx65f--

--------------fWSvfWXpM3502uD0fF3sRIRk--

--------------j3e8JCrW3e0yyV9YXTA1EmY2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmQYWUoFAwAAAAAACgkQsN6d1ii/Ey8s
7Qf/Z+Jy7QTg3PeySLoGko4dDGsipEJkxjXhz6brOK1AMWhGW82thcaYs+/NHWbpqVoGbUyth8KW
6ReokJ9SyHnyMcpeL+4M865sA+EAbc4axDKx72Jwuvzi3JRaOxb1P6C1Xlgnacp+7ZuQ7OGcu4Dv
eyDS5fDIwGAL4I3e4OuRSA7+BjIW2qNeICdaa6F0pvJfU1+3OGoT1uWzPjkrBdKMFEhK+WxyDTAR
o87Pj5kn1gSQNCf3RkugPuZKy+Bww/6kaGPoT5xGO3MbVdIfmB34irWi0lGWLgTgl36Zm40selDn
Bb/Llqi1oGAx59c2lg7C9ol6/oHDrM3S0PlIyCmtGQ==
=2PLo
-----END PGP SIGNATURE-----

--------------j3e8JCrW3e0yyV9YXTA1EmY2--

