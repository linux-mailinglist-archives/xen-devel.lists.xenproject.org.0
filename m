Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F258276FD6C
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 11:35:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577029.903832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrDE-0006yX-Jo; Fri, 04 Aug 2023 09:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577029.903832; Fri, 04 Aug 2023 09:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrDE-0006vb-Gm; Fri, 04 Aug 2023 09:35:12 +0000
Received: by outflank-mailman (input) for mailman id 577029;
 Fri, 04 Aug 2023 09:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRrDC-0006Nv-5a
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 09:35:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33418d94-32aa-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 11:35:08 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 02A6121850;
 Fri,  4 Aug 2023 09:35:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA9A613904;
 Fri,  4 Aug 2023 09:35:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fhTQL0vGzGTiGgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 09:35:07 +0000
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
X-Inumbo-ID: 33418d94-32aa-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691141708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w7LLnOp8LCthZbY696Byjs4KFF/n5P3CrUO7UZIttrU=;
	b=Gp/pROm+/dKAhCOylqHdW9J8GJ2JgVIZ9b+e+ymcIKHXQRBooV1vHDk+flluSRebowQCAU
	Den/CEnvaV9FQwSx6co5HoVaE2pUpEeVYCRiowb71LFpZIIpoadipdmdTFzlvVpdZgMzHp
	cUU+sv3ygol6jN7Smu2KuM+jh3TdKlA=
Message-ID: <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
Date: Fri, 4 Aug 2023 11:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
In-Reply-To: <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MSBXNsa07h0I5Zi0x2e2rg42"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MSBXNsa07h0I5Zi0x2e2rg42
Content-Type: multipart/mixed; boundary="------------GqtWKLDOehE7LWmdWF8ZYshW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
In-Reply-To: <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>

--------------GqtWKLDOehE7LWmdWF8ZYshW
Content-Type: multipart/mixed; boundary="------------lovGiV5xcwSCiRO9WbGhT5zC"

--------------lovGiV5xcwSCiRO9WbGhT5zC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDMuMDguMjMgMjM6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyNC8wNy8yMDIzIDEyOjAyLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gVG9kYXkgaXNf
dmFsaWRfbm9kZW5hbWUoKSBpcyBhbHdheXMgY2FsbGVkIGRpcmVjdGx5IGFmdGVyIGNhbGxp
bmcNCj4+IGNhbm9uaWNhbGl6ZSgpLCB3aXRoIHRoZSBleGNlcHRpb24gb2YgZG9fdW53YXRj
aCgpLCB3aGVyZSB0aGUgY2FsbA0KPj4gaXMgbWlzc2luZyAod2hpY2ggaXMgbm90IGNvcnJl
Y3QsIGJ1dCByZXN1bHRzIGp1c3QgaW4gYSB3cm9uZyBlcnJvcg0KPj4gcmVhc29uIGJlaW5n
IHJldHVybmVkKS4NCj4gDQo+IFdoaWxlIHRoaXMgY2hhbmdlIG1ha2VzIHNlbnNlLi4uDQo+
IA0KPj4NCj4+IE1lcmdlIGlzX3ZhbGlkX25vZGVuYW1lKCkgaW50byBjYW5vbmljYWxpemUo
KS4gV2hpbGUgYXQgaXQgbWVyZ2UNCj4+IHZhbGlkX2NoYXJzKCkgaW50byBpdCwgdG9vLg0K
PiANCj4gLi4uIEkgYW0gbm90IGluIGZhdm9yIG9mIGZvbGRpbmcgdGhlIGNvZGUgaXNfdmFs
aWRfbm9kZW5hbWUoKSBhbmQgdmFsaWRfY2hhcnMoKSANCj4gaW50byBjYW5vbmljYWxpemUo
KSBiZWNhdXNlIHRoZSBjb2RlIGlzIG5vdyBtb3JlIGRpZmZpY3VsdCB0byByZWFkLiBBbHNv
LCB0aGUgDQo+IGtlZXBpbmcgdGhlIHNwbGl0IHdvdWxkIGFsbG93IHRvIGZyZWUgdGhlICdu
YW1lJyBpbiBjYXNlIG9mIGFuIGVycm9yIHdpdGhvdXQgDQo+IGFkZGluZyB0b28gbXVjaCBn
b3RvIGluIHRoZSBjb2RlLg0KDQpJIGRvbid0IHRoaW5rIHdlIGNhbiBlYXNpbHkgZnJlZSBu
YW1lIGluIGFuIGVycm9yIGNhc2UsIGF0IHRoYXQgd291bGQgcmVxdWlyZQ0KdG8ga2VlcCBr
bm93bGVkZ2UgdGhhdCBuYW1lIHdhcyBqdXN0IGFsbG9jYXRlZCBpbiB0aGUgbm9uLWNhbm9u
aWNhbCBjYXNlLg0KDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gVjM6DQo+PiAtIG5ldyBwYXRjaA0KPj4g
LS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jwqAgfCA4OSArKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVu
c3RvcmVkX2NvcmUuaMKgIHzCoCA2ICstLQ0KPj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX3dhdGNoLmMgfCAxNiArKy0tLS0NCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKSwgNjYgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRf
Y29yZS5jDQo+PiBpbmRleCBlYTVhMWE5Y2NlLi5lYzIwYmMwNDJkIDEwMDY0NA0KPj4gLS0t
IGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gKysrIGIvdG9vbHMveGVu
c3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gQEAgLTEyMTAsNDIgKzEyMTAsNiBAQCB2b2lk
IHNlbmRfYWNrKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBlbnVtIA0KPj4geHNkX3NvY2tt
c2dfdHlwZSB0eXBlKQ0KPj4gwqDCoMKgwqDCoCBzZW5kX3JlcGx5KGNvbm4sIHR5cGUsICJP
SyIsIHNpemVvZigiT0siKSk7DQo+PiDCoCB9DQo+PiAtc3RhdGljIGJvb2wgdmFsaWRfY2hh
cnMoY29uc3QgY2hhciAqbm9kZSkNCj4+IC17DQo+PiAtwqDCoMKgIC8qIE5vZGVzIGNhbiBo
YXZlIGxvdHMgb2YgY3JhcC4gKi8NCj4+IC3CoMKgwqAgcmV0dXJuIChzdHJzcG4obm9kZSwN
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJBQkNERUZHSElKS0xNTk9QUVJT
VFVWV1hZWiINCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJhYmNkZWZnaGlq
a2xtbm9wcXJzdHV2d3h5eiINCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIw
MTIzNDU2Nzg5LS9fQCIpID09IHN0cmxlbihub2RlKSk7DQo+PiAtfQ0KPj4gLQ0KPj4gLWJv
b2wgaXNfdmFsaWRfbm9kZW5hbWUoY29uc3Qgc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNv
bnN0IGNoYXIgKm5vZGUsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29s
IGFsbG93X3NwZWNpYWwpDQo+PiAtew0KPj4gLcKgwqDCoCBpbnQgbG9jYWxfb2ZmID0gMDsN
Cj4+IC3CoMKgwqAgdW5zaWduZWQgaW50IGRvbWlkOw0KPj4gLQ0KPj4gLcKgwqDCoCAvKiBN
dXN0IHN0YXJ0IGluIC8gb3IgLSBpZiBzcGVjaWFsIG5vZGVzIGFyZSBhbGxvd2VkIC0gaW4g
QC4gKi8NCj4+IC3CoMKgwqAgaWYgKCFzdHJzdGFydHMobm9kZSwgIi8iKSAmJiAoIWFsbG93
X3NwZWNpYWwgfHwgIXN0cnN0YXJ0cyhub2RlLCAiQCIpKSkNCj4+IC3CoMKgwqDCoMKgwqDC
oCByZXR1cm4gZmFsc2U7DQo+PiAtDQo+PiAtwqDCoMKgIC8qIENhbm5vdCBlbmQgaW4gLyAo
dW5sZXNzIGl0J3MganVzdCAiLyIpLiAqLw0KPj4gLcKgwqDCoCBpZiAoc3RyZW5kcyhub2Rl
LCAiLyIpICYmICFzdHJlcShub2RlLCAiLyIpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVy
biBmYWxzZTsNCj4+IC0NCj4+IC3CoMKgwqAgLyogTm8gZG91YmxlIC8vLiAqLw0KPj4gLcKg
wqDCoCBpZiAoc3Ryc3RyKG5vZGUsICIvLyIpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVy
biBmYWxzZTsNCj4+IC0NCj4+IC3CoMKgwqAgaWYgKHNzY2FuZihub2RlLCAiL2xvY2FsL2Rv
bWFpbi8lNXUvJW4iLCAmZG9taWQsICZsb2NhbF9vZmYpICE9IDEpDQo+PiAtwqDCoMKgwqDC
oMKgwqAgbG9jYWxfb2ZmID0gMDsNCj4+IC0NCj4+IC3CoMKgwqAgaWYgKGRvbWFpbl9tYXhf
Y2hrKGNvbm4sIEFDQ19QQVRITEVOLCBzdHJsZW4obm9kZSkgLSBsb2NhbF9vZmYpKQ0KPj4g
LcKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+IC0NCj4+IC3CoMKgwqAgcmV0dXJu
IHZhbGlkX2NoYXJzKG5vZGUpOw0KPj4gLX0NCj4+IC0NCj4+IMKgIC8qIFdlIGV4cGVjdCBv
bmUgYXJnIGluIHRoZSBpbnB1dDogcmV0dXJuIE5VTEwgb3RoZXJ3aXNlLg0KPj4gwqDCoCAq
IFRoZSBwYXlsb2FkIG11c3QgY29udGFpbiBleGFjdGx5IG9uZSBudWwsIGF0IHRoZSBlbmQu
DQo+PiDCoMKgICovDQo+PiBAQCAtMTI3OSwxNiArMTI0Myw0NiBAQCBzdGF0aWMgY2hhciAq
cGVybXNfdG9fc3RyaW5ncyhjb25zdCB2b2lkICpjdHgsIGNvbnN0IA0KPj4gc3RydWN0IG5v
ZGVfcGVybXMgKnBlcm1zLA0KPj4gwqAgfQ0KPj4gwqAgY29uc3QgY2hhciAqY2Fub25pY2Fs
aXplKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCBjb25zdCB2b2lkICpjdHgsDQo+PiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKm5vZGUpDQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKm5vZGUsIGJvb2wgYWxsb3dfc3BlY2lhbCkN
Cj4+IMKgIHsNCj4+IC3CoMKgwqAgY29uc3QgY2hhciAqcHJlZml4Ow0KPj4gK8KgwqDCoCBj
aGFyICpuYW1lOw0KPj4gK8KgwqDCoCBpbnQgbG9jYWxfb2ZmID0gMDsNCj4+ICvCoMKgwqAg
dW5zaWduZWQgaW50IGRvbWlkOw0KPj4gLcKgwqDCoCBpZiAoIW5vZGUgfHwgKG5vZGVbMF0g
PT0gJy8nKSB8fCAobm9kZVswXSA9PSAnQCcpKQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVy
biBub2RlOw0KPj4gLcKgwqDCoCBwcmVmaXggPSBnZXRfaW1wbGljaXRfcGF0aChjb25uKTsN
Cj4+IC3CoMKgwqAgaWYgKHByZWZpeCkNCj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gdGFs
bG9jX2FzcHJpbnRmKGN0eCwgIiVzLyVzIiwgcHJlZml4LCBub2RlKTsNCj4+IC3CoMKgwqAg
cmV0dXJuIG5vZGU7DQo+PiArwqDCoMKgIGVycm5vID0gRUlOVkFMOw0KPj4gK8KgwqDCoCBp
ZiAoIW5vZGUpDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7DQo+PiArDQo+PiAr
wqDCoMKgIGlmIChzdHJzcG4obm9kZSwgIkFCQ0RFRkdISUpLTE1OT1BRUlNUVVZXWFlaYWJj
ZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXoiDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICIwMTIzNDU2Nzg5LS9fQCIpICE9IHN0cmxlbihub2RlKSkNCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gTlVMTDsNCj4+ICsNCj4+ICvCoMKgwqAgaWYgKG5vZGVbMF0gPT0gJ0AnICYm
ICFhbGxvd19zcGVjaWFsKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPj4g
Kw0KPj4gK8KgwqDCoCBpZiAobm9kZVswXSAhPSAnLycgJiYgbm9kZVswXSAhPSAnQCcpIHsN
Cj4+ICvCoMKgwqDCoMKgwqDCoCBuYW1lID0gdGFsbG9jX2FzcHJpbnRmKGN0eCwgIiVzLyVz
IiwgZ2V0X2ltcGxpY2l0X3BhdGgoY29ubiksDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm9kZSk7DQo+IA0KPiBUaGlzIGlzIGFsbG9jYXRl
ZCBidXQgbm90IGZyZWVkIG9uIGVycm9yLiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBwYXJ0IG9m
IHRoZSANCj4gJ2N0eHQnIGFuZCB0aGVyZWZvcmUgd2lsbCBiZSBmcmVlIGxhdGVyIG9uLiBC
dXQgdGhpcyBtZWFucyB0ZW1wb3JhcnkgbWVtb3J5IHdpbGwgDQo+IGJlIGFsbG9jYXRlZCBm
b3IgbG9uZ2VyLiBTbyBiZXN0IHRvIGNsZWFuLXVwIHdoZW4geW91IGNhbi4NCg0KUmVhbGx5
Pw0KDQpJdCBpcyBwb3NzaWJsZSwgb2YgY291cnNlLCBidXQgaXQgaXMgYWRkaW5nIG1vcmUg
Y29kZSBjaHVybi4gUmVtZW1iZXIgdGhhdA0KIm5hbWUiIGlzIGFsbG9jYXRlZCBvbmx5IGlu
IGNhc2Ugb2YgYSByZWxhdGl2ZSBwYXRoLCBzbyBmcmVlaW5nIGl0IG5lZWRzDQp0byBiZSBj
b25kaXRpb25hbCwgdG9vICh5ZXMsIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHZpYSBjb21wYXJp
bmcgbmFtZSB0byBub2RlKS4NCg0KSW4gY2FzZSB5b3Ugd2FudCBtZSB0byBnbyB0aGlzIHJv
dXRlLCBJIGNhbiByZWFycmFuZ2UgdGhlIGNvZGUgaW4gb3JkZXIgdG8NCmF2b2lkIG11bHRp
cGxlIGVycm9yIGV4aXRzIGJ5IGhhdmluZyBvbmx5IG9uZSBsYXJnZSBpZiAoKSB0ZXN0aW5n
IGZvciBhbGwNCnBvc3NpYmxlIHZpb2xhdGlvbnMuDQoNCj4gDQo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKCFuYW1lKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIE5VTEw7
DQo+PiArwqDCoMKgIH0gZWxzZQ0KPj4gK8KgwqDCoMKgwqDCoMKgIG5hbWUgPSAoY2hhciAq
KW5vZGU7DQo+IA0KPiBXaHkgZG9lcyBuYW1lIG5lZWQgdG8gYmUgY29uc3Q/DQoNCkkgdGhp
bmsgdGhlIHF1ZXN0aW9uIHdhcyBwb3NlZCBpbiBhIHdyb25nIHdheS4gOi0pDQoNCkknbGwg
Y2hhbmdlIG5hbWUgdG8gYmUgY29uc3QgY2hhciAqLg0KDQoNCkp1ZXJnZW4NCg0K
--------------lovGiV5xcwSCiRO9WbGhT5zC
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------lovGiV5xcwSCiRO9WbGhT5zC--

--------------GqtWKLDOehE7LWmdWF8ZYshW--

--------------MSBXNsa07h0I5Zi0x2e2rg42
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTMxksFAwAAAAAACgkQsN6d1ii/Ey/K
rwf/YVlysIoK7vmG25Q4w5hor18SofMcxfmWcHGB/uikDke82b56ZnvvUQ1t50LeZBIpfrJBqXlT
Z0aw9yaVCjpDa3HMTttx17UpiCqiKIoOVR/mJv2WIwmUWgLU4uK9ZQCwPHogiSH5DJI/eqYudggr
EkdOM2Yq8Cpzl2xc1cBGYIY9ee6j7TfdvkWpCSy9CUvWylEt81+dcduR8i1G5kWoM1Dl4j8YE25v
EBjtpO7wjAH4X/ExBImw4tLF/zI14pkMNGo65uB6ourwC7N0IcG7w7mbXUzHqQB/U4bvqMx716Mc
LMP0Wx35Ip6rV/2WLdzG5eQGfIIfKiB3PzRDDpc7ww==
=mtdd
-----END PGP SIGNATURE-----

--------------MSBXNsa07h0I5Zi0x2e2rg42--

