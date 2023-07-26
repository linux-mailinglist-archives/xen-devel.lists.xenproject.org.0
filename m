Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1E4763025
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 10:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570197.891773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOa8G-0001KO-JS; Wed, 26 Jul 2023 08:44:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570197.891773; Wed, 26 Jul 2023 08:44:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOa8G-0001Ie-GL; Wed, 26 Jul 2023 08:44:32 +0000
Received: by outflank-mailman (input) for mailman id 570197;
 Wed, 26 Jul 2023 08:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iO1l=DM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qOa8F-0001IY-8Q
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 08:44:31 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a27c8a36-2b90-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 10:44:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F2E61F74A;
 Wed, 26 Jul 2023 08:44:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 263AE139BD;
 Wed, 26 Jul 2023 08:44:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d+bbB+3cwGSGTgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 26 Jul 2023 08:44:29 +0000
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
X-Inumbo-ID: a27c8a36-2b90-11ee-b242-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690361069; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+L4bV9A3r7ZQPoItmh52b7MPUNFug+pWtexA1gSBeJg=;
	b=YYgqFDSRl67jXm/1C6geiCWQfmvkMjTd3PJntCNptuCljnuGg5MK35nh8NSD/H8M1Zgwlu
	hRjTyJUf8zCMAPWM9g5drFlZXZtrjDrWxYqtdnMrzRmoyuRYn4KjoT44fkvweRtioT/BWV
	kj0463ajHmBRexRFDjwNmRwQUj4njXk=
Message-ID: <3d2daedf-b2c0-5a26-a57d-4742f69f08b7@suse.com>
Date: Wed, 26 Jul 2023 10:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-9-jgross@suse.com>
 <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
 <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
 <f0a115a6-843e-74ff-7f0f-28cf0545932e@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 08/25] tools/xenstore: make hashtable key and value
 parameters const
In-Reply-To: <f0a115a6-843e-74ff-7f0f-28cf0545932e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HcqkV0qsmzf808KTJkaI7EnF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HcqkV0qsmzf808KTJkaI7EnF
Content-Type: multipart/mixed; boundary="------------IxMF7yNro0sfm27XhShMNOb5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <3d2daedf-b2c0-5a26-a57d-4742f69f08b7@suse.com>
Subject: Re: [PATCH v3 08/25] tools/xenstore: make hashtable key and value
 parameters const
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-9-jgross@suse.com>
 <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
 <a6370aa2-ec6c-259f-3e24-bc1a74ead2a6@suse.com>
 <f0a115a6-843e-74ff-7f0f-28cf0545932e@xen.org>
In-Reply-To: <f0a115a6-843e-74ff-7f0f-28cf0545932e@xen.org>

--------------IxMF7yNro0sfm27XhShMNOb5
Content-Type: multipart/mixed; boundary="------------4YYRWBuh4xJX9GVFUWJSGnr4"

--------------4YYRWBuh4xJX9GVFUWJSGnr4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjYuMDcuMjMgMTA6MjAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI2LzA3LzIwMjMgMDc6MTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyNS4wNy4yMyAxODowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+
Pj4gT24gMjQvMDcvMjAyMyAxMjowMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gVGhl
IGtleSBhbmQgdmFsdWUgYXJlIG5ldmVyIG1vZGlmaWVkIGJ5IGhhc2h0YWJsZSBjb2RlLCBz
byB0aGV5IHNob3VsZA0KPj4+PiBiZSBtYXJrZWQgYXMgY29uc3QuDQo+Pj4NCj4+PiBZb3Ug
d3JvdGUgdGhpcyBidXQuLi4NCj4+Pg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBWMzoNCj4+Pj4g
LSBtYWtlIHZhbHVlIGNvbnN0LCB0b28uDQo+Pj4+IC0tLQ0KPj4+PiDCoCB0b29scy94ZW5z
dG9yZS9oYXNodGFibGUuYyB8IDcgKysrKy0tLQ0KPj4+PiDCoCB0b29scy94ZW5zdG9yZS9o
YXNodGFibGUuaCB8IDQgKystLQ0KPj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3hlbnN0b3JlL2hhc2h0YWJsZS5jIGIvdG9vbHMveGVuc3RvcmUvaGFzaHRhYmxlLmMNCj4+
Pj4gaW5kZXggMTFmNmJmOGYxNS4uNjcwZGMwMTAwMyAxMDA2NDQNCj4+Pj4gLS0tIGEvdG9v
bHMveGVuc3RvcmUvaGFzaHRhYmxlLmMNCj4+Pj4gKysrIGIvdG9vbHMveGVuc3RvcmUvaGFz
aHRhYmxlLmMNCj4+Pj4gQEAgLTExLDcgKzExLDggQEANCj4+Pj4gwqAgc3RydWN0IGVudHJ5
DQo+Pj4+IMKgIHsNCj4+Pj4gLcKgwqDCoCB2b2lkICprLCAqdjsNCj4+Pj4gK8KgwqDCoCBj
b25zdCB2b2lkICprOw0KPj4+PiArwqDCoMKgIHZvaWQgKnY7DQo+Pj4NCj4+Pg0KPj4+IC4u
LiB0aGlzIGlzIG5vdCBjb25zdCBhbmQgLi4uDQo+Pj4NCj4+Pj4gwqDCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgaDsNCj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZW50cnkgKm5leHQ7DQo+Pj4+
IMKgIH07DQo+Pj4+IEBAIC0xNDAsNyArMTQxLDcgQEAgc3RhdGljIGludCBoYXNodGFibGVf
ZXhwYW5kKHN0cnVjdCBoYXNodGFibGUgKmgpDQo+Pj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7
DQo+Pj4+IMKgIH0NCj4+Pj4gLWludCBoYXNodGFibGVfYWRkKHN0cnVjdCBoYXNodGFibGUg
KmgsIHZvaWQgKmssIHZvaWQgKnYpDQo+Pj4+ICtpbnQgaGFzaHRhYmxlX2FkZChzdHJ1Y3Qg
aGFzaHRhYmxlICpoLCBjb25zdCB2b2lkICprLCBjb25zdCB2b2lkICp2KQ0KPj4+PiDCoCB7
DQo+Pj4+IMKgwqDCoMKgwqAgLyogVGhpcyBtZXRob2QgYWxsb3dzIGR1cGxpY2F0ZSBrZXlz
IC0gYnV0IHRoZXkgc2hvdWxkbid0IGJlIHVzZWQgKi8NCj4+Pj4gwqDCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgaW5kZXg7DQo+Pj4+IEBAIC0xNjQsNyArMTY1LDcgQEAgaW50IGhhc2h0YWJs
ZV9hZGQoc3RydWN0IGhhc2h0YWJsZSAqaCwgdm9pZCAqaywgdm9pZCAqdikNCj4+Pj4gwqDC
oMKgwqDCoCBlLT5rID0gazsNCj4+Pj4gwqDCoMKgwqDCoCBpZiAoaC0+ZmxhZ3MgJiBIQVNI
VEFCTEVfRlJFRV9LRVkpDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB0YWxsb2Nfc3RlYWwo
ZSwgayk7DQo+Pj4+IC3CoMKgwqAgZS0+diA9IHY7DQo+Pj4+ICvCoMKgwqAgZS0+diA9ICh2
b2lkICopdjsNCj4+Pg0KPj4+IC4uLiB5b3UgY2FzdC1hd2F5IHRoZSBjb25zdCBoZXJlLiBJ
IHRoaW5rIHRoaXMgaXMgYSBwcmV0dHkgYmFkIGlkZWEuDQo+Pj4NCj4+PiBDYW4geW91IGNs
YXJpZnkgd2h5IHlvdSBhcmUgZG9pbmcgbGlrZSB0aGF0Pw0KPj4NCj4+IFRoZSB2YWx1ZSBp
cyBuZXZlciBjaGFuZ2VkIGJ5IHRoZSBoYXNodGFibGUgY29kZSwgYnV0IGl0IG1pZ2h0IGJl
IGNoYW5nZWQgYnkNCj4+IGUuZy4gYSBjYWxsZXIgb2YgaGFzaHRhYmxlX3NlYXJjaCgpIChz
ZWUgZS5nLiBjYWxsZXJzIG9mIGZpbmRfZG9tYWluX3N0cnVjdCgpKS4NCj4+DQo+PiBTb21l
d2hlcmUgSSBuZWVkIHRvIGNhc3QgdGhlIGNvbnN0IGF3YXkuIEkgY291bGQgZG8gc28gaW4g
aGFzaHRhYmxlX3NlYXJjaCgpDQo+PiBpbiBjYXNlIHlvdSBwcmVmZXIgbWUgdG8gZG8gc28u
DQo+IA0KPiBNeSBwcm9ibGVtIGlzIG5vdCB3aXRoIHRoZSBwbGFjZW1lbnQgb2YgdGhlIGNv
bnN0IGJ1dCB0aGUgZmFjdCB5b3UgYXJlIHJlbW92aW5nIA0KPiB0aGUgY29uc3QuDQo+IA0K
PiBJIGFncmVlIHRoYXQgdGhlIGhhc2h0YWJsZSBjb2RlIGlzIG5vdCBtZWFudCB0byBtb2Rp
ZnkgdGhlIGNvbnRlbnQuIEhvd2V2ZXIsIGFzIA0KPiB5b3Ugd3JvdGUsIHRoZSBjYWxsZXIg
b2YgaGFzaHRhYmxlX3NlYXJjaCgpIGNvdWxkIG1vZGlmeSB0aGUgY29udGVudC4gU28sIGZv
ciANCj4gbWUsIHRoZSB2YWx1ZSBzaG91bGQgbm90IGJlIGNvbnN0IGluIHRoZSBoYXNodGFi
bGUgY29kZS4NCg0KVGhpcyBpcyBhcmd1YWJsZSBJTUhPLg0KDQo+IFRvIGdpdmUgYSBjb25j
cmV0ZSBleGFtcGxlLCB3aXRoIHRoZSBjdXJyZW50IGludGVyZmFjZSB3ZSBhcmUgdGVsbGlu
ZyB0aGUgdXNlciANCj4gdGhhdCB3aGF0IHRoZXkgc3RvcmUgaW4gdGhlIGhhc2h0YWJsZSBj
YW4gYmUgbW9kaWZpZWQgYXQgc29tZSBwb2ludC4gQnkgYWRkaW5nIA0KPiAnY29uc3QnIGZv
ciB0aGUgdmFsdWUgaW4gaGFzaHRhYmxlX2FkZCgpLCB3ZSBjYW4gbWlzbGVhZCBhIHVzZXIg
dG8gdGhpbmsgaXQgaXMgDQo+IGZpbmUgdG8gc3RvcmUgc3RhdGljIHN0cmluZywgeWV0IHRo
aXMgaXMgbm90IGVuZm9yY2VkIGFsbCB0aGUgd2F5IHRocm91Z2guIFNvIA0KPiBvbmUgY291
bGQgbWlzdGFrZW5seSB0aGluayB0aGF0IHZhbHVlcyByZXR1cm5lZCBoYXNodGFibGVfc2Vh
cmNoKCkgY2FuIGJlIA0KPiBtb2RpZmllZC4gQW5kIHRoZSBjb21waWxlciB3aWxsIG5vdCBi
ZSBoZXJlIHRvIGhlbHAgZW5mb3JjaW5nIGl0IGJlY2F1c2UgeW91IA0KPiBjYXN0LWF3YXkg
dGhlIGNvbnN0Lg0KDQpZZXMsIGxpa2UgaW4gdGhlIGNhc2Ugb2Ygc3Ryc3RyKCkuDQoNCkl0
IHRha2VzIHR3byBjb25zdCBjaGFyICogcGFyYW1ldGVycyBhbmQgaXQgaXMgcmV0dXJuaW5n
IGNoYXIgKiwgZXZlbiB3aXRoIGl0DQpwb2ludGluZyBpbnRvIHRoZSBmaXJzdCBwYXJhbWV0
ZXIuDQoNCj4gRG8geW91IGhhdmUgYW55IGNvZGUgaW4gdGhpcyBzZXJpZXMgdGhhdCByZXF1
aXJlcyB0aGUgJ2NvbnN0JyBpbiANCj4gaGFzaHRhYmxlX2FkZCgpPyBJZiBzbywgY2FuIHlv
dSBwb2ludCBtZSB0byB0aGUgcGF0Y2ggYW5kIEkgd2lsbCBoYXZlIGEgbG9vaz8NCg0KSSBo
YWQgaXQgd2hlbiB3cml0aW5nIHRoaXMgcGF0Y2gsIGJ1dCB0aGlzIHJlcXVpcmVtZW50IGlz
IGdvbmUgbm93LiBCdXQgcGxlYXNlDQpub3RlIHRoYXQgdGhpcyBtZWFucyB0byBkcm9wIHRo
ZSBjb25zdCBmcm9tIGRiX3dyaXRlKCksIHRvby4NCg0KPiBJZiBub3QsIHRoZW4gSSB3aWxs
IHN0cm9uZ2x5IGFyZ3VlIHRoYXQgdGhpcyBzaG91bGQgYmUgZHJvcHBlZCBiZWNhdXNlIGRy
b3BwaW5nIA0KPiBhIGNvbnN0IGlzIGFsd2F5cyBhIHJlY2lwZSBmb3IgZGlzYXN0ZXIuDQoN
CkRlcGVuZHMgSU1PLg0KDQpJIGJlbGlldmUgaXQgaXMgYmV0dGVyIGFzIEkndmUgZG9uZSBp
dCwgYnV0IGluIGNhc2UgeW91IGluc2lzdCBvbiBpdCBJIGNhbiBkcm9wDQp0aGUgcGF0Y2gu
DQoNCkFuIGFsdGVybmF0aXZlIHdvdWxkIGJlIG1ha2UgaGFzaHRhYmxlX3NlYXJjaCgpIHJl
dHVybiBhIGNvbnN0IGFuZCBvbmx5IGNhc3QgdGhlDQpjb25zdCBhd2F5IHdoZXJlIGl0IGlz
IHJlYWxseSBuZWVkZWQgKGFuZCBwcm9iYWJseSB3aXRoIGEgcHJvbWluZW50IGNvbW1lbnQg
YXQNCnRoZSByZWxhdGVkIGhhc2h0YWJsZV9hZGQoKSBwbGFjZSkuIEkgdGhpbmsgdGhpcyB3
aWxsIGhpdCB4ZW5zdG9yZWRfZG9tYWluLmMgdXNlDQpjYXNlcyBvbmx5Lg0KDQoNCkp1ZXJn
ZW4NCg==
--------------4YYRWBuh4xJX9GVFUWJSGnr4
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

--------------4YYRWBuh4xJX9GVFUWJSGnr4--

--------------IxMF7yNro0sfm27XhShMNOb5--

--------------HcqkV0qsmzf808KTJkaI7EnF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTA3OwFAwAAAAAACgkQsN6d1ii/Ey/I
pgf8Dmvx5rQ7U/QXq0qoVYOayR6mhNNmKoYdFpe+FiJOTH1NtTQSwv3nK3u3KxsuBx/B74EKJId7
vYwktLLdRnyGaMSV6A8aQbl7+H1GmBNdiPTCMcGzAhv2XZne/hYUZpDX+AVAwOX3x1ZXtKyC9MoH
4IoVryMgh83/ob5I/P41aCMwMPMS65GevUhjQ3GKhZ9S5dPhgUKmUCuNbFicpGYALJJSqbos2uvN
g1snCQwOeR9Qgqj5ezhj8NXZwoOKRjKuQwARrF+faj+YujgR5RYJLV0CohaNtCj9J7KYnaBUlW2n
a5lhtnb4GAT1QWxlyXdEBv7nPc7U1pAxMmjTCsnZow==
=ILHv
-----END PGP SIGNATURE-----

--------------HcqkV0qsmzf808KTJkaI7EnF--

