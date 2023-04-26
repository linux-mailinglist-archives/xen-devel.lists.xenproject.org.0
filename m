Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3A16EEEEC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 09:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526502.818297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZGp-000056-Iw; Wed, 26 Apr 2023 07:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526502.818297; Wed, 26 Apr 2023 07:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prZGp-0008Tq-FV; Wed, 26 Apr 2023 07:08:55 +0000
Received: by outflank-mailman (input) for mailman id 526502;
 Wed, 26 Apr 2023 07:08:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vDOC=AR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1prZGo-0008Td-2f
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 07:08:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32f241c6-e401-11ed-8611-37d641c3527e;
 Wed, 26 Apr 2023 09:08:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A3FC11FDCD;
 Wed, 26 Apr 2023 07:08:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AAA0138F0;
 Wed, 26 Apr 2023 07:08:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id leyDHAPOSGTRbAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 26 Apr 2023 07:08:51 +0000
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
X-Inumbo-ID: 32f241c6-e401-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1682492931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uo1R/xDtWSySdYzunGr1/3kyitjb7qoGsUF+7mCVkbM=;
	b=nakpPi+OsA4jqXGduY4hWxfYpV6DhFsNy0lOIEDdTi63t/ymwW5NhEpSwH9W4GUYsS1CJ8
	eFhoTJUDi79Be+JQhaS/7g5ONULkONJglUcfMsBMD8owD0hTH93CwOsNqBBryFR+mQDz2o
	63Kyx+7S3drij9tx27oWfj8L1NvWWUQ=
Message-ID: <cb57a654-a766-5354-a122-989f43b440d5@suse.com>
Date: Wed, 26 Apr 2023 09:08:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-5-jgross@suse.com>
 <e8003d2d-5557-f5d9-38ca-793c30637e61@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 04/13] tools/xenstore: add framework to commit
 accounting data on success only
In-Reply-To: <e8003d2d-5557-f5d9-38ca-793c30637e61@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i2SxkbUfotlxBg6v2RwT8EVI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i2SxkbUfotlxBg6v2RwT8EVI
Content-Type: multipart/mixed; boundary="------------D0QHExCQktHfRdUz0UEuDZlt";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <cb57a654-a766-5354-a122-989f43b440d5@suse.com>
Subject: Re: [PATCH v4 04/13] tools/xenstore: add framework to commit
 accounting data on success only
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-5-jgross@suse.com>
 <e8003d2d-5557-f5d9-38ca-793c30637e61@xen.org>
In-Reply-To: <e8003d2d-5557-f5d9-38ca-793c30637e61@xen.org>

--------------D0QHExCQktHfRdUz0UEuDZlt
Content-Type: multipart/mixed; boundary="------------TpgdXAoJS5QWpZz20m9R3KN9"

--------------TpgdXAoJS5QWpZz20m9R3KN9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjUuMDQuMjMgMTk6NTIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA1LzA0LzIwMjMgMDg6MDMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBJ
bnN0ZWFkIG9mIG1vZGlmeWluZyBhY2NvdW50aW5nIGRhdGEgYW5kIHVuZG8gdGhvc2UgbW9k
aWZpY2F0aW9ucyBpbg0KPj4gY2FzZSBvZiBhbiBlcnJvciBkdXJpbmcgZnVydGhlciBwcm9j
ZXNzaW5nLCBhZGQgYSBmcmFtZXdvcmsgZm9yDQo+PiBjb2xsZWN0aW5nIHRoZSBuZWVkZWQg
Y2hhbmdlcyBhbmQgY29tbWl0IHRoZW0gb25seSB3aGVuIHRoZSB3aG9sZQ0KPj4gb3BlcmF0
aW9uIGhhcyBzdWNjZWVkZWQuDQo+Pg0KPj4gVGhpcyBzY2hlbWUgY2FuIHJldXNlIGxhcmdl
IHBhcnRzIG9mIHRoZSBwZXIgdHJhbnNhY3Rpb24gYWNjb3VudGluZy4NCj4+IFRoZSBjaGFu
Z2VkX2RvbWFpbiBoYW5kbGluZyBjYW4gYmUgcmV1c2VkLCBidXQgdGhlIGFycmF5IHNpemUg
b2YgdGhlDQo+PiBhY2NvdW50aW5nIGRhdGEgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGJlIGRp
ZmZlcmVudCBmb3IgYm90aCB1c2UgY2FzZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBWMzoNCj4+IC0gY2Fs
bCBhY2NfY29tbWl0KCkgZWFybGllciAoSnVsaWVuIEdyYWxsKQ0KPj4gLSBhZGQgYXNzZXJ0
KCkgdG8gYWNjX2NvbW1pdCgpDQo+PiAtIHVzZSBmaXhlZCBzaXplZCBhY2MgYXJyYXkgaW4g
c3RydWN0IGNoYW5nZWRfZG9tYWluIChKdWxpZW4gR3JhbGwpDQo+PiAtLS0NCj4+IMKgIHRv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmPCoMKgIHzCoCA5ICsrKystLQ0KPj4gwqAg
dG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaMKgwqAgfMKgIDMgKysNCj4+IMKgIHRv
b2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyB8IDUzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKy0NCj4+IMKgIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4u
aCB8wqAgNSArKy0NCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMNCj4+IGlu
ZGV4IDNjYTY4NjgxZTMuLjg0MzM1ZjVmM2QgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9y
ZWRfY29yZS5jDQo+PiBAQCAtMTAyMyw2ICsxMDIzLDkgQEAgc3RhdGljIHZvaWQgc2VuZF9l
cnJvcihzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgaW50IGVycm9yKQ0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4g
wqDCoMKgwqDCoCB9DQo+PiArDQo+PiArwqDCoMKgIGFjY19kcm9wKGNvbm4pOw0KPj4gKw0K
Pj4gwqDCoMKgwqDCoCBzZW5kX3JlcGx5KGNvbm4sIFhTX0VSUk9SLCB4c2RfZXJyb3JzW2ld
LmVycnN0cmluZywNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJsZW4o
eHNkX2Vycm9yc1tpXS5lcnJzdHJpbmcpICsgMSk7DQo+PiDCoCB9DQo+PiBAQCAtMTAzNCw2
ICsxMDM3LDkgQEAgdm9pZCBzZW5kX3JlcGx5KHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBl
bnVtIA0KPj4geHNkX3NvY2ttc2dfdHlwZSB0eXBlLA0KPj4gwqDCoMKgwqDCoCBhc3NlcnQo
dHlwZSAhPSBYU19XQVRDSF9FVkVOVCk7DQo+PiArwqDCoMKgIGNvbm4tPmluID0gTlVMTDsN
Cj4gDQo+IEFGQUlVLCB5b3UgYXJlIHNldHRpbmcgY29ubi0+aW4gdG8gTlVMTCBpbiBvcmRl
ciB0byBwbGVhc2UuLg0KPiANCj4+ICvCoMKgwqAgYWNjX2NvbW1pdChjb25uKTsNCj4gDQo+
IC4uLiB0aGlzIGNhbGwuIEhvd2V2ZXIgaW4gY2FzZSBvZiBhbiBlcnJvciBsaWtlLi4uDQo+
IA0KPj4gKw0KPj4gwqDCoMKgwqDCoCBpZiAoIGxlbiA+IFhFTlNUT1JFX1BBWUxPQURfTUFY
ICkgeyA+wqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VuZF9lcnJvcihjb25uLCBFMkJJRyk7DQo+
IA0KPiAuLi4gaGVyZSwgc2VuZF9yZXBseSgpIHdpbGwgYmUgY2FsbGVkIGFnYWluLiBCdXQg
dGhlIGVycm9yIHdpbGwgbm90IGJlIHNldCANCj4gYmVjYXVzZSBjb25uLT5pbiBpcyBOVUxM
Lg0KPiANCj4gU28gSSB0aGluayB5b3Ugd2FudCB0byByZXN0b3JlIGNvbm4tPmluIHJld3Jp
dGUgYWNjX2NvbW1pdCgpLiBUaGUgb3JkZXJpbmcgd291bGQgDQo+IGFsc28gZGVzZXJ2ZSBh
biBleHBsYW5hdGlvbiBpbiBhIGNvbW1lbnQuDQoNCkp1c3QgdG8gbWFrZSBzdXJlIEkgdW5k
ZXJzdGFuZCB5b3UgY29ycmVjdGx5IChJIGhhdmUgc29tZSBkaWZmaWN1bHRpZXMNCnBhcnNp
bmcgIlNvIEkgdGhpbmsgeW91IHdhbnQgdG8gcmVzdG9yZSBjb25uLT5pbiByZXdyaXRlIGFj
Y19jb21taXQoKS4iDQpjb21wbGV0ZWx5KToNCg0KWW91IGFyZSBzdWdnZXN0aW5nIHRvIG1v
dmUgc2V0dGluZyBjb25uLT5pbiB0byBOVUxMIHRvIGFjY19jb21taXQoKSBhbmQNCnRvIHJl
c3RvcmUgaXQgYmVmb3JlIHJldHVybmluZz8gSSdtIGZpbmUgd2l0aCB0aGF0Lg0KDQo+IA0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsNCj4+IEBAIC0xMDU5LDggKzEwNjUsNiBA
QCB2b2lkIHNlbmRfcmVwbHkoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIGVudW0gDQo+PiB4
c2Rfc29ja21zZ190eXBlIHR5cGUsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gwqDC
oMKgwqDCoCB9DQo+PiAtwqDCoMKgIGNvbm4tPmluID0gTlVMTDsNCj4+IC0NCj4+IMKgwqDC
oMKgwqAgLyogVXBkYXRlIHJlbGV2YW50IGhlYWRlciBmaWVsZHMgYW5kIGZpbGwgaW4gdGhl
IG1lc3NhZ2UgYm9keS4gKi8NCj4+IMKgwqDCoMKgwqAgYmRhdGEtPmhkci5tc2cudHlwZSA9
IHR5cGU7DQo+PiDCoMKgwqDCoMKgIGJkYXRhLT5oZHIubXNnLmxlbiA9IGxlbjsNCj4+IEBA
IC0yMTk1LDYgKzIxOTksNyBAQCBzdHJ1Y3QgY29ubmVjdGlvbiAqbmV3X2Nvbm5lY3Rpb24o
Y29uc3Qgc3RydWN0IA0KPj4gaW50ZXJmYWNlX2Z1bmNzICpmdW5jcykNCj4+IMKgwqDCoMKg
wqAgbmV3LT5pc19zdGFsbGVkID0gZmFsc2U7DQo+PiDCoMKgwqDCoMKgIG5ldy0+dHJhbnNh
Y3Rpb25fc3RhcnRlZCA9IDA7DQo+PiDCoMKgwqDCoMKgIElOSVRfTElTVF9IRUFEKCZuZXct
Pm91dF9saXN0KTsNCj4+ICvCoMKgwqAgSU5JVF9MSVNUX0hFQUQoJm5ldy0+YWNjX2xpc3Qp
Ow0KPj4gwqDCoMKgwqDCoCBJTklUX0xJU1RfSEVBRCgmbmV3LT5yZWZfbGlzdCk7DQo+PiDC
oMKgwqDCoMKgIElOSVRfTElTVF9IRUFEKCZuZXctPndhdGNoZXMpOw0KPj4gwqDCoMKgwqDC
oCBJTklUX0xJU1RfSEVBRCgmbmV3LT50cmFuc2FjdGlvbl9saXN0KTsNCj4+IGRpZmYgLS1n
aXQgYS90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oIGIvdG9vbHMveGVuc3RvcmUv
eGVuc3RvcmVkX2NvcmUuaA0KPj4gaW5kZXggYzU5YjA2NTUxZi4uMWY4MTFmMzhjYiAxMDA2
NDQNCj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgNCj4+ICsrKyBi
L3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmgNCj4+IEBAIC0xMzksNiArMTM5LDkg
QEAgc3RydWN0IGNvbm5lY3Rpb24NCj4+IMKgwqDCoMKgwqAgc3RydWN0IGxpc3RfaGVhZCBv
dXRfbGlzdDsNCj4+IMKgwqDCoMKgwqAgdWludDY0X3QgdGltZW91dF9tc2VjOw0KPj4gK8Kg
wqDCoCAvKiBOb3QgeWV0IGNvbW1pdHRlZCBhY2NvdW50aW5nIGRhdGEgKHZhbGlkIGlmIGlu
ICE9IE5VTEwpLiAqLw0KPj4gK8KgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIGFjY19saXN0Ow0K
Pj4gKw0KPj4gwqDCoMKgwqDCoCAvKiBSZWZlcmVuY2VkIHJlcXVlc3RzIG5vIGxvbmdlciBw
ZW5kaW5nLiAqLw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIHJlZl9saXN0Ow0K
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9kb21haW4uYyANCj4+
IGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2RvbWFpbi5jDQo+PiBpbmRleCAzMGZiOWFj
ZWM2Li4xNDRjYmFmYjczIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX2RvbWFpbi5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfZG9tYWlu
LmMNCj4+IEBAIC05MSw2ICs5MSw4IEBAIHN0cnVjdCBkb21haW4NCj4+IMKgwqDCoMKgwqAg
Ym9vbCB3cmxfZGVsYXlfbG9nZ2VkOw0KPj4gwqAgfTsNCj4+ICsjZGVmaW5lIEFDQ19DSERf
TiAoQUNDX1RSX04gPCBBQ0NfUkVRX04gPyBBQ0NfUkVRX04gOiBBQ0NfVFJfTikNCj4gDQo+
IEJvdGggQUNDX1RSX04gYW5kIEFDQ19SRVFfTiBhcmUgZml4ZWQuIENhbiB5b3UgZXhwbGFp
biB3aHkgd2UgbmVlZCB0aGlzIG1hZ2ljPw0KPiANCj4gUmVsYXRlZCwgd291bGRuJ3QgaXQg
YmUgYmV0dGVyIHRvIGRlZmluZSBpdCBpbiB0aGUgZW51bT8NCg0KSSBjYW4gZG8gdGhhdCwg
b2YgY291cnNlLiBJIGp1c3QgZGlkbid0IHdhbnQgdG8gbWFrZSB0aGUgZW51bSBldmVuIG1v
cmUNCmNvbXBsZXguIDotKQ0KDQpCdXQgd2l0aCBhIGNvbW1lbnQgdGhpcyBzaG91bGQgYmUg
b2theSBJTU8uDQoNCg0KSnVlcmdlbg0K
--------------TpgdXAoJS5QWpZz20m9R3KN9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------TpgdXAoJS5QWpZz20m9R3KN9--

--------------D0QHExCQktHfRdUz0UEuDZlt--

--------------i2SxkbUfotlxBg6v2RwT8EVI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRIzgMFAwAAAAAACgkQsN6d1ii/Ey+6
Qgf+IouX8kt/GqNbQiCQ+p7FNpmrElWIqMeKA0i/TooBzhHmRCPkUE+k+1W/nZ3LZmra9NXeke2C
jdQBomqO7vIrdVDX0E4zuozijimkZbtvKnOZ9lvzY6cSa4nbGga9bEIc4HIwMBAXburd7JyvntJf
7giCw78rNxutWhkoonPqniE407PYGnc3wWIy2DPN+ytGRqX+JMk8L7UGcPXkt/cvFEYlGaaQBQUt
fEbVIKfK6wSKxJyfwKPc0PxxY1mawIKoR2iUdJj4U/Rg8FdPjEdjHlLT26+UyxMIJaTN99ApnZIn
VMGzGnSogawUzQ2pChnPBvV2/hTD7EcZg+1goyPA1A==
=4gde
-----END PGP SIGNATURE-----

--------------i2SxkbUfotlxBg6v2RwT8EVI--

