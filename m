Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB256473F7
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 17:13:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457276.715172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3JVj-0006ja-VP; Thu, 08 Dec 2022 16:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457276.715172; Thu, 08 Dec 2022 16:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3JVj-0006hn-SA; Thu, 08 Dec 2022 16:12:35 +0000
Received: by outflank-mailman (input) for mailman id 457276;
 Thu, 08 Dec 2022 16:12:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1p3JVi-0006hg-Mv
 for xen-devel@lists.xen.org; Thu, 08 Dec 2022 16:12:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f58e367-7713-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 17:12:33 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B06733751;
 Thu,  8 Dec 2022 16:12:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4BE2138E0;
 Thu,  8 Dec 2022 16:12:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id lqMRKvAMkmPWHwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 08 Dec 2022 16:12:32 +0000
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
X-Inumbo-ID: 1f58e367-7713-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1670515953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3D56ixHg4GEvROv0g+h9EpASNrVkm5n82P5FiEPpmwA=;
	b=XgNzeg1x/da/TA6tHQZzVItq+Q5Zb/6H0T/+iaEhWFYR8jZzifjloG3dcVsuKWMJWUwec4
	kCKeR4nnzAQg/GLyBGoca52lrB653EWvsXb4YzHeixg9tKN8EY9pR4mvANFH+YYfE35x0/
	t2SGmvUXS17H4HTroHQBfSeREc6rAQw=
Message-ID: <e22fcdce-f029-de46-81a6-60f5ffc9c9a2@suse.com>
Date: Thu, 8 Dec 2022 17:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Xen Security Advisory 424 v1 (CVE-2022-42328,CVE-2022-42329) -
 Guests can trigger deadlock in Linux netback driver
Content-Language: en-US
To: Pratyush Yadav <ptyadav@amazon.de>,
 "Xen.org security team" <security@xen.org>
Cc: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com,
 "Xen.org security team" <security-team-members@xen.org>
References: <E1p2ZhW-0005Xe-FG@xenbits.xenproject.org>
 <mafs0lenhlwcv.fsf@dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <mafs0lenhlwcv.fsf@dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Epe70gCUpcHe4aA3CqDhOehN"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Epe70gCUpcHe4aA3CqDhOehN
Content-Type: multipart/mixed; boundary="------------BBFSoseI0wFH390kzl0Q9A3S";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Pratyush Yadav <ptyadav@amazon.de>,
 "Xen.org security team" <security@xen.org>
Cc: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com,
 "Xen.org security team" <security-team-members@xen.org>
Message-ID: <e22fcdce-f029-de46-81a6-60f5ffc9c9a2@suse.com>
Subject: Re: Xen Security Advisory 424 v1 (CVE-2022-42328,CVE-2022-42329) -
 Guests can trigger deadlock in Linux netback driver
References: <E1p2ZhW-0005Xe-FG@xenbits.xenproject.org>
 <mafs0lenhlwcv.fsf@dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com>
In-Reply-To: <mafs0lenhlwcv.fsf@dev-dsk-ptyadav-1c-37607b33.eu-west-1.amazon.com>

--------------BBFSoseI0wFH390kzl0Q9A3S
Content-Type: multipart/mixed; boundary="------------FOIUDD6mMxRMmhHZoX2ZnxJ0"

--------------FOIUDD6mMxRMmhHZoX2ZnxJ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDguMTIuMjIgMTY6NTksIFByYXR5dXNoIFlhZGF2IHdyb3RlOg0KPiANCj4gSGksDQo+
IA0KPiBJIG5vdGljZWQgb25lIGludGVyZXN0aW5nIHRoaW5nIGFib3V0IHRoaXMgcGF0Y2gg
YnV0IEknbSBub3QgZmFtaWxpYXINCj4gZW5vdWdoIHdpdGggdGhlIGRyaXZlciB0byBzYXkg
Zm9yIHN1cmUgd2hhdCB0aGUgcmlnaHQgdGhpbmcgaXMuDQo+IA0KPiBPbiBUdWUsIERlYyAw
NiAyMDIyLCBYZW4ub3JnIHNlY3VyaXR5IHRlYW0gd3JvdGU6DQo+IA0KPiBbLi4uXQ0KPj4N
Cj4+ICBGcm9tIGNmZGY4ZmQ4MTg0NTczNGI2MTUyYjQ2MTc3NDZjMTEyN2VjNTIyMjggTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxDQo+PiBGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQo+PiBEYXRlOiBUdWUsIDYgRGVjIDIwMjIgMDg6NTQ6MjQgKzAxMDANCj4+
IFN1YmplY3Q6IFtQQVRDSF0geGVuL25ldGJhY2s6IGRvbid0IGNhbGwga2ZyZWVfc2tiKCkg
d2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkDQo+Pg0KPj4gSXQgaXMgbm90IGFsbG93ZWQgdG8g
Y2FsbCBrZnJlZV9za2IoKSBmcm9tIGhhcmR3YXJlIGludGVycnVwdA0KPj4gY29udGV4dCBv
ciB3aXRoIGludGVycnVwdHMgYmVpbmcgZGlzYWJsZWQuIFNvIHJlbW92ZSBrZnJlZV9za2Io
KQ0KPj4gZnJvbSB0aGUgc3Bpbl9sb2NrX2lycXNhdmUoKSBzZWN0aW9uIGFuZCB1c2UgdGhl
IGFscmVhZHkgZXhpc3RpbmcNCj4+ICJkcm9wIiBsYWJlbCBpbiB4ZW52aWZfc3RhcnRfeG1p
dCgpIGZvciBkcm9wcGluZyB0aGUgU0tCLiBBdCB0aGUNCj4+IHNhbWUgdGltZSByZXBsYWNl
IHRoZSBkZXZfa2ZyZWVfc2tiKCkgY2FsbCB0aGVyZSB3aXRoIGEgY2FsbCBvZg0KPj4gZGV2
X2tmcmVlX3NrYl9hbnkoKSwgYXMgeGVudmlmX3N0YXJ0X3htaXQoKSBjYW4gYmUgY2FsbGVk
IHdpdGgNCj4+IGRpc2FibGVkIGludGVycnVwdHMuDQo+Pg0KPj4gVGhpcyBpcyBYU0EtNDI0
IC8gQ1ZFLTIwMjItNDIzMjggLyBDVkUtMjAyMi00MjMyOS4NCj4+DQo+PiBGaXhlczogYmU4
MTk5MmY5MDg2ICgieGVuL25ldGJhY2s6IGRvbid0IHF1ZXVlIHVubGltaXRlZCBudW1iZXIg
b2YgcGFja2FnZXMiKQ0KPj4gUmVwb3J0ZWQtYnk6IFlhbmcgWWluZ2xpYW5nIDx5YW5neWlu
Z2xpYW5nQGh1YXdlaS5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+PiBSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1v
bi5oICAgIHwgMiArLQ0KPj4gICBkcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2Uu
YyB8IDYgKysrKy0tDQo+PiAgIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3J4LmMgICAgICAg
IHwgOCArKysrKy0tLQ0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1u
ZXRiYWNrL2NvbW1vbi5oIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmgNCj4+
IGluZGV4IDE1NDVjYmVlNzdhNC4uM2RiZmM4YTY5MjRlIDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmgNCj4+ICsrKyBiL2RyaXZlcnMvbmV0L3hl
bi1uZXRiYWNrL2NvbW1vbi5oDQo+PiBAQCAtMzg2LDcgKzM4Niw3IEBAIGludCB4ZW52aWZf
ZGVhbGxvY19rdGhyZWFkKHZvaWQgKmRhdGEpOw0KPj4gICBpcnFyZXR1cm5fdCB4ZW52aWZf
Y3RybF9pcnFfZm4oaW50IGlycSwgdm9pZCAqZGF0YSk7DQo+Pg0KPj4gICBib29sIHhlbnZp
Zl9oYXZlX3J4X3dvcmsoc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUsIGJvb2wgdGVzdF9r
dGhyZWFkKTsNCj4+IC12b2lkIHhlbnZpZl9yeF9xdWV1ZV90YWlsKHN0cnVjdCB4ZW52aWZf
cXVldWUgKnF1ZXVlLCBzdHJ1Y3Qgc2tfYnVmZiAqc2tiKTsNCj4+ICtib29sIHhlbnZpZl9y
eF9xdWV1ZV90YWlsKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLCBzdHJ1Y3Qgc2tfYnVm
ZiAqc2tiKTsNCj4+DQo+PiAgIHZvaWQgeGVudmlmX2NhcnJpZXJfb24oc3RydWN0IHhlbnZp
ZiAqdmlmKTsNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2sv
aW50ZXJmYWNlLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYw0KPj4g
aW5kZXggNjUwZmExODAyMjBmLi5mM2YyYzA3NDIzYTYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL25ldC94ZW4tbmV0YmFjay9pbnRlcmZhY2UuYw0KPj4gKysrIGIvZHJpdmVycy9uZXQv
eGVuLW5ldGJhY2svaW50ZXJmYWNlLmMNCj4+IEBAIC0yNTQsMTQgKzI1NCwxNiBAQCB4ZW52
aWZfc3RhcnRfeG1pdChzdHJ1Y3Qgc2tfYnVmZiAqc2tiLCBzdHJ1Y3QgbmV0X2RldmljZSAq
ZGV2KQ0KPj4gICAJaWYgKHZpZi0+aGFzaC5hbGcgPT0gWEVOX05FVElGX0NUUkxfSEFTSF9B
TEdPUklUSE1fTk9ORSkNCj4+ICAgCQlza2JfY2xlYXJfaGFzaChza2IpOw0KPj4NCj4+IC0J
eGVudmlmX3J4X3F1ZXVlX3RhaWwocXVldWUsIHNrYik7DQo+PiArCWlmICgheGVudmlmX3J4
X3F1ZXVlX3RhaWwocXVldWUsIHNrYikpDQo+PiArCQlnb3RvIGRyb3A7DQo+PiArDQo+PiAg
IAl4ZW52aWZfa2lja190aHJlYWQocXVldWUpOw0KPj4NCj4+ICAgCXJldHVybiBORVRERVZf
VFhfT0s7DQo+Pg0KPj4gICAgZHJvcDoNCj4+ICAgCXZpZi0+ZGV2LT5zdGF0cy50eF9kcm9w
cGVkKys7DQo+IA0KPiBOb3cgdHhfZHJvcHBlZCBpcyBpbmNyZW1lbnRlZCBvbiBwYWNrZXQg
ZHJvcC4uLg0KPiANCj4+IC0JZGV2X2tmcmVlX3NrYihza2IpOw0KPj4gKwlkZXZfa2ZyZWVf
c2tiX2FueShza2IpOw0KPj4gICAJcmV0dXJuIE5FVERFVl9UWF9PSzsNCj4+ICAgfQ0KPj4N
Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9yeC5jIGIvZHJpdmVy
cy9uZXQveGVuLW5ldGJhY2svcnguYw0KPj4gaW5kZXggOTMyNzYyMTc3MTEwLi4wYmE3NTRl
YmM1YmEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9yeC5jDQo+
PiArKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9yeC5jDQo+PiBAQCAtODIsOSArODIs
MTAgQEAgc3RhdGljIGJvb2wgeGVudmlmX3J4X3Jpbmdfc2xvdHNfYXZhaWxhYmxlKHN0cnVj
dCB4ZW52aWZfcXVldWUgKnF1ZXVlKQ0KPj4gICAJcmV0dXJuIGZhbHNlOw0KPj4gICB9DQo+
Pg0KPj4gLXZvaWQgeGVudmlmX3J4X3F1ZXVlX3RhaWwoc3RydWN0IHhlbnZpZl9xdWV1ZSAq
cXVldWUsIHN0cnVjdCBza19idWZmICpza2IpDQo+PiArYm9vbCB4ZW52aWZfcnhfcXVldWVf
dGFpbChzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwgc3RydWN0IHNrX2J1ZmYgKnNrYikN
Cj4+ICAgew0KPj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+ICsJYm9vbCByZXQgPSB0
cnVlOw0KPj4NCj4+ICAgCXNwaW5fbG9ja19pcnFzYXZlKCZxdWV1ZS0+cnhfcXVldWUubG9j
aywgZmxhZ3MpOw0KPj4NCj4+IEBAIC05Miw4ICs5Myw3IEBAIHZvaWQgeGVudmlmX3J4X3F1
ZXVlX3RhaWwoc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUsIHN0cnVjdCBza19idWZmICpz
a2IpDQo+PiAgIAkJc3RydWN0IG5ldF9kZXZpY2UgKmRldiA9IHF1ZXVlLT52aWYtPmRldjsN
Cj4+DQo+PiAgIAkJbmV0aWZfdHhfc3RvcF9xdWV1ZShuZXRkZXZfZ2V0X3R4X3F1ZXVlKGRl
diwgcXVldWUtPmlkKSk7DQo+PiAtCQlrZnJlZV9za2Ioc2tiKTsNCj4+IC0JCXF1ZXVlLT52
aWYtPmRldi0+c3RhdHMucnhfZHJvcHBlZCsrOw0KPiANCj4gLi4uIGJ1dCBlYXJsaWVyIHJ4
X2Ryb3BwZWQgd2FzIGluY3JlbWVudGVkLg0KPiANCj4gV2hpY2ggb25lIGlzIGFjdHVhbGx5
IGNvcnJlY3Q/IFRoaXMgbGluZSB3YXMgYWRkZWQgYnkgYmU4MTk5MmY5MDg2Yg0KPiAoInhl
bi9uZXRiYWNrOiBkb24ndCBxdWV1ZSB1bmxpbWl0ZWQgbnVtYmVyIG9mIHBhY2thZ2VzIiks
IHdoaWNoIHdhcyB0aGUNCj4gZml4IGZvciBYU0EtMzkyLiBJIHRoaW5rIGluY3JlbWVudGlu
ZyB0eF9kcm9wcGVkIGlzIHRoZSByaWdodCB0aGluZyB0bw0KPiBkbywgYXMgd2FzIGRvbmUg
YmVmb3JlIFhTQS0zOTIgYnV0IGl0IHdvdWxkIGJlIG5pY2UgaWYgc29tZW9uZSBlbHNlDQo+
IHRha2VzIGEgbG9vayBhdCB0aGlzIGFzIHdlbGwuDQoNClllcywgSSB0aGluayB0aGUgWFNB
LTM5MiBwYXRjaCB3YXMgd3JvbmcgaW4gdGhpcyByZWdhcmQuDQoNCg0KSnVlcmdlbg0K
--------------FOIUDD6mMxRMmhHZoX2ZnxJ0
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------FOIUDD6mMxRMmhHZoX2ZnxJ0--

--------------BBFSoseI0wFH390kzl0Q9A3S--

--------------Epe70gCUpcHe4aA3CqDhOehN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmOSDPAFAwAAAAAACgkQsN6d1ii/Ey8i
lAf+JGrVjdHrOS8tbLhxv5V2MZGPw9Q2D8Jwnvh/nURZ87DAwKjuYM4RQ3w/skkWkaqLC+8TR193
4r73qKq/ROxwwaxwmN+gjVSL/OZlP7NKYqiWdLegPMqH3l2GQBo9GiInC/fDT7wxvDCtTwYgSiXx
XyIo3pOHYE1WSfi5r8q3/aNE/mAzpbVrZGPBMz76yqmsrDzGcv0LlX13Ax4g2DBHKCd8SMsvXbH7
4OpRZ9BWmc1WS/ilWqG4jB38iFYD9Tkqra60piHbG7WY5slRCSe/+yCnQ8kog8OVNSB+zBGYYH6L
3pHcKh9bD6wqvVBMDk7M1gddgaHHibHKFgr6YxNhzQ==
=2PYd
-----END PGP SIGNATURE-----

--------------Epe70gCUpcHe4aA3CqDhOehN--

