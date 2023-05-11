Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D696FEB29
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 07:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533101.829467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwynq-0003PO-6p; Thu, 11 May 2023 05:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533101.829467; Thu, 11 May 2023 05:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwynq-0003Md-3d; Thu, 11 May 2023 05:25:22 +0000
Received: by outflank-mailman (input) for mailman id 533101;
 Thu, 11 May 2023 05:25:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d7zm=BA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pwyno-0003MX-QH
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 05:25:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37842da9-efbc-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 07:25:18 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ECDF41FD7F;
 Thu, 11 May 2023 05:25:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C266C134B2;
 Thu, 11 May 2023 05:25:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Gx75LT18XGQXJQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 11 May 2023 05:25:17 +0000
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
X-Inumbo-ID: 37842da9-efbc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683782717; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KS7xG2fXBnwEWqZoii+gVbaS9E2m6HU4IykCzTn/790=;
	b=JfkVGyUkfshLObmpMrq1GhTlzc95O6EvHMBmCHUSoWHY2yEASwksGOqay5/ejA4ej9VILB
	nWSiFsvVm/8cpQv6fbro611vH0CoZSlCcQ3dny9Rf/mAmvGDayiyMgYlUXBiuJbruPO+ft
	bYYAw0+llB5qK1bA/AS6BbGQhFA7Xqo=
Message-ID: <de77cc78-e07a-934f-e241-15fe851706df@suse.com>
Date: Thu, 11 May 2023 07:25:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-6-jgross@suse.com>
 <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
 <9745474f-db84-c8f3-3662-95728d4d5bd3@suse.com>
 <91380959-b63d-7d4f-0920-7d87dc0fc19d@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 05/14] tools/xenstore: use accounting buffering for
 node accounting
In-Reply-To: <91380959-b63d-7d4f-0920-7d87dc0fc19d@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Oxa8OChYtf600Y8nslRhB0at"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Oxa8OChYtf600Y8nslRhB0at
Content-Type: multipart/mixed; boundary="------------qjlX8CfRPQMwjt9HJoa6GDl0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <de77cc78-e07a-934f-e241-15fe851706df@suse.com>
Subject: Re: [PATCH v5 05/14] tools/xenstore: use accounting buffering for
 node accounting
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-6-jgross@suse.com>
 <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
 <9745474f-db84-c8f3-3662-95728d4d5bd3@suse.com>
 <91380959-b63d-7d4f-0920-7d87dc0fc19d@xen.org>
In-Reply-To: <91380959-b63d-7d4f-0920-7d87dc0fc19d@xen.org>

--------------qjlX8CfRPQMwjt9HJoa6GDl0
Content-Type: multipart/mixed; boundary="------------0Zm7E48OkOpN6PDYFH0NFfEj"

--------------0Zm7E48OkOpN6PDYFH0NFfEj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMDUuMjMgMjM6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxMC8wNS8yMDIzIDEzOjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDkuMDUu
MjMgMjA6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+
Pj4gT24gMDgvMDUvMjAyMyAxMjo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gQWRk
IHRoZSBub2RlIGFjY291bnRpbmcgdG8gdGhlIGFjY291bnRpbmcgaW5mb3JtYXRpb24gYnVm
ZmVyaW5nIGluDQo+Pj4+IG9yZGVyIHRvIGF2b2lkIGhhdmluZyB0byB1bmRvIGl0IGluIGNh
c2Ugb2YgZmFpbHVyZS4NCj4+Pj4NCj4+Pj4gVGhpcyByZXF1aXJlcyB0byBjYWxsIGRvbWFp
bl9uYmVudHJ5X2RlYygpIGJlZm9yZSBhbnkgY2hhbmdlcyB0byB0aGUNCj4+Pj4gZGF0YSBi
YXNlLCBhcyBpdCBjYW4gcmV0dXJuIGFuIGVycm9yIG5vdy4NCj4+Pj4NCj4+Pj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4+PiAtLS0NCj4+
Pj4gVjU6DQo+Pj4+IC0gYWRkIGVycm9yIGhhbmRsaW5nIGFmdGVyIGRvbWFpbl9uYmVudHJ5
X2RlYygpIGNhbGxzIChKdWxpZW4gR3JhbGwpDQo+Pj4+IC0tLQ0KPj4+PiDCoCB0b29scy94
ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jwqDCoCB8IDI5ICsrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQo+Pj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uaCB8
wqAgNCArKy0tDQo+Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAy
NCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3Jl
L3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+
Pj4+IGluZGV4IDgzOTJiZGVjOWIuLjIyZGE0MzRlMmEgMTAwNjQ0DQo+Pj4+IC0tLSBhL3Rv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+Pj4gKysrIGIvdG9vbHMveGVuc3Rv
cmUveGVuc3RvcmVkX2NvcmUuYw0KPj4+PiBAQCAtMTQ1NCw3ICsxNDU0LDYgQEAgc3RhdGlj
IHZvaWQgZGVzdHJveV9ub2RlX3JtKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCANCj4+Pj4g
c3RydWN0IG5vZGUgKm5vZGUpDQo+Pj4+IMKgIHN0YXRpYyBpbnQgZGVzdHJveV9ub2RlKHN0
cnVjdCBjb25uZWN0aW9uICpjb25uLCBzdHJ1Y3Qgbm9kZSAqbm9kZSkNCj4+Pj4gwqAgew0K
Pj4+PiDCoMKgwqDCoMKgIGRlc3Ryb3lfbm9kZV9ybShjb25uLCBub2RlKTsNCj4+Pj4gLcKg
wqDCoCBkb21haW5fbmJlbnRyeV9kZWMoY29ubiwgZ2V0X25vZGVfb3duZXIobm9kZSkpOw0K
Pj4+PiDCoMKgwqDCoMKgIC8qDQo+Pj4+IMKgwqDCoMKgwqDCoCAqIEl0IGlzIG5vdCBwb3Nz
aWJsZSB0byBlYXNpbHkgcmV2ZXJ0IHRoZSBjaGFuZ2VzIGluIGEgdHJhbnNhY3Rpb24uDQo+
Pj4+IEBAIC0xNjQ1LDYgKzE2NDQsOSBAQCBzdGF0aWMgaW50IGRlbG5vZGVfc3ViKGNvbnN0
IHZvaWQgKmN0eCwgc3RydWN0IA0KPj4+PiBjb25uZWN0aW9uICpjb25uLA0KPj4+PiDCoMKg
wqDCoMKgIGlmIChyZXQgPiAwKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFdB
TEtfVFJFRV9TVUNDRVNTX1NUT1A7DQo+Pj4+ICvCoMKgwqAgaWYgKGRvbWFpbl9uYmVudHJ5
X2RlYyhjb25uLCBnZXRfbm9kZV9vd25lcihub2RlKSkpDQo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gV0FMS19UUkVFX0VSUk9SX1NUT1A7DQo+Pj4NCj4+PiBJIHRoaW5rIHRoZXJl
IGlzIGEgcG90ZW50aWFsIGlzc3VlIHdpdGggdGhlIGJ1ZmZlcmluZyBoZXJlLiBJbiBjYXNl
IG9mIA0KPj4+IGZhaWx1cmUsIHRoZSBub2RlIGNvdWxkIGhhdmUgYmVlbiByZW1vdmVkLCBi
dXQgdGhlIHF1b3RhIHdvdWxkIG5vdCBiZSANCj4+PiBwcm9wZXJseSBhY2NvdW50ZWQuDQo+
Pg0KPj4gWW91IG1lYW4gdGhlIGNhc2Ugd2hlcmUgYW5vdGhlciBub2RlIGhhcyBiZWVuIGRl
bGV0ZWQgYW5kIGR1ZSB0byBhY2NvdW50aW5nDQo+PiBidWZmZXJpbmcgdGhlIGNvcnJlY3Rl
ZCBhY2NvdW50aW5nIGRhdGEgd291bGRuJ3QgYmUgY29tbWl0dGVkPw0KPj4NCj4+IFRoaXMg
aXMgbm8gcHJvYmxlbSwgYXMgYW4gZXJyb3IgcmV0dXJuZWQgYnkgZGVsbm9kZV9zdWIoKSB3
aWxsIHJlc3VsdCBpbg0KPj4gY29ycnVwdCgpIGJlaW5nIGNhbGxlZCwgd2hpY2ggaW4gdHVy
biB3aWxsIGNvcnJlY3QgdGhlIGFjY291bnRpbmcgZGF0YS4NCj4gDQo+IFRvIG1lIGNvcnJ1
cHQoKSBpcyBhIGJpZyBoYW1tZXIgYW5kIGl0IGZlZWxzIHdyb25nIHRvIGNhbGwgaXQgd2hl
biBJIHRoaW5rIHdlIA0KPiBoYXZlIGVhc2llci9mYXN0ZXIgd2F5IHRvIGRlYWwgd2l0aCB0
aGUgaXNzdWUuIENvdWxkIHdlIGluc3RlYWQgY2FsbCANCj4gYWNjX2NvbW1pdCgpIGJlZm9y
ZSByZXR1cm5pbmc/DQoNCllvdSBhcmUgYXdhcmUgdGhhdCB0aGlzIGlzIGEgdmVyeSBwcm9i
bGVtYXRpYyBzaXR1YXRpb24gd2UgYXJlIGluPw0KDQpXZSBjb3VsZG4ndCBhbGxvY2F0ZSBh
IHNtYWxsIGFtb3VudCBvZiBtZW1vcnkgKGFyb3VuZCA2NCBieXRlcykhIFhlbnN0b3JlZA0K
d2lsbCBwcm9iYWJseSBkaWUgd2l0aGluIG1pbGxpc2Vjb25kcy4gVXNpbmcgdGhlIGJpZyBo
YW1tZXIgaW4gc3VjaCBhDQpzaXR1YXRpb24gaXMgZmluZSBJTU8uIEl0IHdpbGwgbWF5YmUg
cmVzdWx0IGluIHNvbHZpbmcgdGhlIHByb2JsZW0gYnkNCmZyZWVpbmcgb2YgbWVtb3J5IChx
dWl0ZSB1bmxpa2VseSwgdGhvdWdoKSwgYnV0IGl0IHdvbid0IGxlYXZlIHhlbnN0b3JlZA0K
aW4gYSB3b3JzZSBzdGF0ZSB0aGFuIHdpdGggeW91ciBzdWdnZXN0aW9uLg0KDQpBbmQgY2Fs
bGluZyBhY2NfY29tbWl0KCkgaGVyZSB3b3VsZG4ndCByZWFsbHkgaGVscCwgYXMgYWNjb3Vu
dGluZyBkYXRhDQpjb3VsZG4ndCBiZSByZWNvcmRlZCwgc28gdGhlcmUgYXJlIG1pc3Npbmcg
dXBkYXRlcyBhbnl3YXkgZHVlIHRvIHRoZSBmYWlsZWQNCmNhbGwgb2YgZG9tYWluX25iZW50
cnlfZGVjKCkuDQoNCj4+PiBBbHNvLCBJIHRoaW5rIGEgY29tbWVudCB3b3VsZCBiZSB3YXJy
YW50IHRvIGV4cGxhaW4gd2h5IHdlIGFyZSByZXR1cm5pbmcgDQo+Pj4gV0FMS19UUkVFX0VS
Uk9SX1NUT1AgaGVyZSB3aGVuLi4uDQo+Pj4NCj4+Pj4gKw0KPj4+PiDCoMKgwqDCoMKgIC8q
IEluIGNhc2Ugb2YgZXJyb3Igc3RvcCB0aGUgd2Fsay4gKi8NCj4+Pj4gwqDCoMKgwqDCoCBp
ZiAoIXJldCAmJiBkb190ZGJfZGVsZXRlKGNvbm4sICZrZXksICZub2RlLT5hY2MpKQ0KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFdBTEtfVFJFRV9TVUNDRVNTX1NUT1A7DQo+
Pj4NCj4+PiAuLi4gdGhpcyBpcyBub3QgdGhlIGNhc2Ugd2hlbiBkb190ZGJfZGVsZXRlKCkg
ZmFpbHMgZm9yIHNvbWUgcmVhc29ucy4NCj4+DQo+PiBUaGUgbWFpbiBpZGVhIHdhcyB0aGF0
IHRoZSByZW1vdmUgaXMgd29ya2luZyBmcm9tIHRoZSBsZWFmcyB0b3dhcmRzIHRoZSByb290
Lg0KPj4gSW4gY2FzZSBvbmUgZW50cnkgY2FuJ3QgYmUgcmVtb3ZlZCwgd2Ugc2hvdWxkIGp1
c3Qgc3RvcC4NCj4+DQo+PiBPVE9IIHJldHVybmluZyBXQUxLX1RSRUVfRVJST1JfU1RPUCBt
aWdodCBiZSBjbGVhbmVyLCBhcyB0aGlzIHdvdWxkIG1ha2Ugc3VyZQ0KPj4gdGhhdCBhY2Nv
dW50aW5nIGRhdGEgaXMgcmVwYWlyZWQgYWZ0ZXJ3YXJkcy4gRXZlbiBpZiBkb190ZGJfZGVs
ZXRlKCkgY2FuJ3QNCj4+IHJlYWxseSBmYWlsIGluIG5vcm1hbCBjb25maWd1cmF0aW9ucywg
YXMgdGhlIG9ubHkgZmFpbHVyZSByZWFzb25zIGFyZToNCj4+DQo+PiAtIHRoZSBub2RlIGlz
bid0IGZvdW5kIChxdWl0ZSB1bmxpa2VseSwgYXMgd2UganVzdCByZWFkIGl0IGJlZm9yZSBl
bnRlcmluZw0KPj4gwqDCoCBkZWxub2RlX3N1YigpKSwgb3INCj4+IC0gd3JpdGluZyB0aGUg
dXBkYXRlZCBkYXRhIGJhc2UgZmFpbGVkIChpbiBub3JtYWwgY29uZmlndXJhdGlvbnMgaXQg
aXMgaW4NCj4+IMKgwqAgYWxyZWFkeSBhbGxvY2F0ZWQgbWVtb3J5LCBzbyBubyB3YXkgdG8g
ZmFpbCB0aGF0KQ0KPj4NCj4+IEkgdGhpbmsgSSdsbCBzd2l0Y2ggdG8gcmV0dXJuIFdBTEtf
VFJFRV9FUlJPUl9TVE9QIGhlcmUuDQo+IA0KPiBTZWUgYWJvdmUgZm9yIGEgZGlmZmVyZW50
IHByb3Bvc2FsLg0KDQpXaXRob3V0IGRlbGV0aW5nIHRoZSBub2RlIGluIHRoZSBkYXRhIGJh
c2UgdGhpcyB3b3VsZCBiZSBhbm90aGVyIGFjY291bnRpbmcNCmRhdGEgaW5jb25zaXN0ZW5j
eSwgc28gY2FsbGluZyBjb3JydXB0KCkgaXMgdGhlIGNvcnJlY3QgY2xlYW51cCBtZWFzdXJl
Lg0KDQoNCkp1ZXJnZW4NCg==
--------------0Zm7E48OkOpN6PDYFH0NFfEj
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0Zm7E48OkOpN6PDYFH0NFfEj--

--------------qjlX8CfRPQMwjt9HJoa6GDl0--

--------------Oxa8OChYtf600Y8nslRhB0at
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRcfD0FAwAAAAAACgkQsN6d1ii/Ey+L
9Af/QOPog6phu0BAHnNX+tA3/PCaz2ee4YLmFlF+2t7aJpeb0GhRFEjZ+5a6D1azZzV/dmc7GJCE
fcC/ZGQsF7hT96DeYaRLawBhdqukjEBNabOKUbzFJUuDdZqmvV987liVtoXEkgT0OdqJolvtILOJ
nwNrDVciuQqX4pHaoUnEmfCOtxggHd1pI+4ylsyszO9u5AANd5PtdkyyJcwaULlC4V8vnoBQprJU
XI37QV9ZqrT/v95bAst17yhdJttnSUb7JKW2TMhBDDbVtFbB5n0BaPnVWeAjaEBhsLCeaxghwZBN
0bgnswhDMM5S0lKTqvveQqPNn6OfSB5KAQDXk+zBmw==
=8MZl
-----END PGP SIGNATURE-----

--------------Oxa8OChYtf600Y8nslRhB0at--

