Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E377F76FFF0
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 14:06:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577130.904021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRtYm-0007QQ-TP; Fri, 04 Aug 2023 12:05:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577130.904021; Fri, 04 Aug 2023 12:05:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRtYm-0007OO-Qs; Fri, 04 Aug 2023 12:05:36 +0000
Received: by outflank-mailman (input) for mailman id 577130;
 Fri, 04 Aug 2023 12:05:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRtYl-0007OI-MO
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 12:05:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 369ce50f-32bf-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 14:05:33 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB3B62186B;
 Fri,  4 Aug 2023 12:05:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C10A513904;
 Fri,  4 Aug 2023 12:05:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MqdELYzpzGQ2aAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 12:05:32 +0000
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
X-Inumbo-ID: 369ce50f-32bf-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691150732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ki4eE8KIJGI7HsBWhntynRPipCidvB8DSebuHEtMRdc=;
	b=TnMEI2zK1EtgKbVg9MlMVT8fdfAz5+3JVSs3CT60CGFTfjBhhR19aTOMsvvNw7bxUnAzcc
	zYLVtroEGlbjXWAVVqKzjhjbDFdooVfQvkWNJJRboB7IPANs3T89EKoOgvHbKBxoIGjLNa
	4c5NKtJxbhQHXaL9+4w1YUGyudOoV34=
Message-ID: <8f9a76fc-283a-e3f3-d19f-04401389a7de@suse.com>
Date: Fri, 4 Aug 2023 14:05:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
 <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
 <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
 <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
 <8e7d18a0-0130-4ae5-adac-cfc122d6fb16@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
In-Reply-To: <8e7d18a0-0130-4ae5-adac-cfc122d6fb16@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qJ7UYErQpPpJ0NC64ye50hJo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qJ7UYErQpPpJ0NC64ye50hJo
Content-Type: multipart/mixed; boundary="------------6fMLqb9HaWUIBj2asiWGeC08";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <8f9a76fc-283a-e3f3-d19f-04401389a7de@suse.com>
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
 <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
 <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
 <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
 <8e7d18a0-0130-4ae5-adac-cfc122d6fb16@xen.org>
In-Reply-To: <8e7d18a0-0130-4ae5-adac-cfc122d6fb16@xen.org>

--------------6fMLqb9HaWUIBj2asiWGeC08
Content-Type: multipart/mixed; boundary="------------rhPx0TzYaFyAMCT9HPkaQvWR"

--------------rhPx0TzYaFyAMCT9HPkaQvWR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjMgMTI6MzMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA0LzA4LzIwMjMgMTE6MTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwNC4wOC4yMyAxMjowMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpLA0KPj4+DQo+
Pj4gT24gMDQvMDgvMjAyMyAxMDozNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24g
MDMuMDguMjMgMjM6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpLA0KPj4+Pj4N
Cj4+Pj4+IE9uIDI0LzA3LzIwMjMgMTI6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+
Pj4gVG9kYXkgaXNfdmFsaWRfbm9kZW5hbWUoKSBpcyBhbHdheXMgY2FsbGVkIGRpcmVjdGx5
IGFmdGVyIGNhbGxpbmcNCj4+Pj4+PiBjYW5vbmljYWxpemUoKSwgd2l0aCB0aGUgZXhjZXB0
aW9uIG9mIGRvX3Vud2F0Y2goKSwgd2hlcmUgdGhlIGNhbGwNCj4+Pj4+PiBpcyBtaXNzaW5n
ICh3aGljaCBpcyBub3QgY29ycmVjdCwgYnV0IHJlc3VsdHMganVzdCBpbiBhIHdyb25nIGVy
cm9yDQo+Pj4+Pj4gcmVhc29uIGJlaW5nIHJldHVybmVkKS4NCj4+Pj4+DQo+Pj4+PiBXaGls
ZSB0aGlzIGNoYW5nZSBtYWtlcyBzZW5zZS4uLg0KPj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IE1l
cmdlIGlzX3ZhbGlkX25vZGVuYW1lKCkgaW50byBjYW5vbmljYWxpemUoKS4gV2hpbGUgYXQg
aXQgbWVyZ2UNCj4+Pj4+PiB2YWxpZF9jaGFycygpIGludG8gaXQsIHRvby4NCj4+Pj4+DQo+
Pj4+PiAuLi4gSSBhbSBub3QgaW4gZmF2b3Igb2YgZm9sZGluZyB0aGUgY29kZSBpc192YWxp
ZF9ub2RlbmFtZSgpIGFuZCANCj4+Pj4+IHZhbGlkX2NoYXJzKCkgaW50byBjYW5vbmljYWxp
emUoKSBiZWNhdXNlIHRoZSBjb2RlIGlzIG5vdyBtb3JlIGRpZmZpY3VsdCB0byANCj4+Pj4+
IHJlYWQuIEFsc28sIHRoZSBrZWVwaW5nIHRoZSBzcGxpdCB3b3VsZCBhbGxvdyB0byBmcmVl
IHRoZSAnbmFtZScgaW4gY2FzZSBvZiANCj4+Pj4+IGFuIGVycm9yIHdpdGhvdXQgYWRkaW5n
IHRvbyBtdWNoIGdvdG8gaW4gdGhlIGNvZGUuDQo+Pj4+DQo+Pj4+IEkgZG9uJ3QgdGhpbmsg
d2UgY2FuIGVhc2lseSBmcmVlIG5hbWUgaW4gYW4gZXJyb3IgY2FzZSwgYXQgdGhhdCB3b3Vs
ZCByZXF1aXJlDQo+Pj4+IHRvIGtlZXAga25vd2xlZGdlIHRoYXQgbmFtZSB3YXMganVzdCBh
bGxvY2F0ZWQgaW4gdGhlIG5vbi1jYW5vbmljYWwgY2FzZS4NCj4+Pg0KPj4+IEhvdyBhYm91
dCB0aGlzOg0KPj4+DQo+Pj4gY29uc3QgY2hhciAqY2Fub25pY2FsaXplKHN0cnVjdCBjb25u
ZWN0aW9uICpjb25uLCBjb25zdCB2b2lkICpjdHgsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqbm9kZSwgYm9v
bCBhbGxvd19zcGVjaWFsKQ0KPj4+IHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNo
YXIgKnByZWZpeDsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKm5hbWU7DQo+
Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmICghbm9kZSkNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4+Pg0KPj4+IMKgwqDCoMKgwqDC
oMKgwqAgaWYgKG5vZGVbMF0gPT0gJ0AnICYmICFhbGxvd19zcGVjaWFsKQ0KPj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPj4+DQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoCBpZiAoIW5vZGUgfHwgKG5vZGVbMF0gPT0gJy8nKSB8fCAobm9kZVsw
XSA9PSAnQCcpKQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biBub2RlOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqAgcHJlZml4ID0gZ2V0X2ltcGxpY2l0X3Bh
dGgoY29ubik7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAocHJlZml4KSB7DQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFtZSA9IHRhbGxvY19hc3ByaW50Zihj
dHgsICIlcy8lcyIsIHByZWZpeCwgbm9kZSk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKG5hbWUpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPj4+IMKgwqDCoMKgwqDCoMKg
wqAgfSBlbHNlDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbmFtZSA9
IG5vZGU7DQo+Pj4NCj4+PiDCoMKgwqDCoMKgwqDCoMKgIGlmICghaXNfdmFsaWRfbm9kZW5h
bWUoY29ubiwgbm9kZSwgYWxsb3dfc3BlY2lhbCkpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiBSZWxlYXNlIHRoZSBtZW1vcnkgaWYgJ25hbWUnIHdhcyBh
bGxvY2F0ZWQgYnkgdXMgKi8NCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoIG5hbWUgIT0gbm9kZSApDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRhbGxvY19mcmVlKG5hbWUpOw0KPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPj4+IMKgwqDCoMKgwqDC
oMKgwqAgfQ0KPj4+DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gbmFtZTsNCj4+PiB9
DQo+Pj4NCj4+PiBBbmQgYmVmb3JlIHlvdSBhc2ssIEkgZG9uJ3Qgc2VlIHRoZSBiZW5lZml0
cyB0byBwYXJ0aWFsbHkgdmFsaWRhdGUgdGhlIG5hbWUgDQo+Pj4gYmVmb3JlIGFsbG9jYXRp
bmcuIEhlbmNlIHdoeSBJIHN1Z2dlc3QgdG8ga2VlcCBpc192YWxpZF9ub2RlbmFtZSgpIGFz
IHRoaXMgDQo+Pj4ga2VlcCB0aGUgZnVuY3Rpb24gc21hbGwuDQo+Pg0KPj4gUGFydGlhbGx5
IHZhbGlkYXRpbmcgYmVmb3JlIGRvaW5nIHRoZSBhbGxvY2F0aW9uIGlzIGEgYmVuZWZpdCBh
cyBpdCBkb2Vzbid0DQo+PiBzcGVuZCBjeWNsZXMgb24gdmFsaWRhdGluZyB0aGUga25vd24g
Z29vZCBwcmVmaXguDQo+IA0KPiBXaGljaCBpcyBwcmV0dHkgbXVjaCBhIGRyb3AgaW4gdGhl
IG9jZWFuIGluIHRoZSBjb250ZXh0IG9mIFhlbnN0b3JlZCA6KS4gSW4gDQo+IHJlYWxpdHkg
bW9zdCBvZiB0aGUgdmFsaWRhdGlvbiBjYW4gYmUgZG9uZSBiZWZvcmUgdGhlIGFsbG9jYXRp
b24gd2l0aCBhIGJpdCBvZiANCj4gd29yay4NCg0KWWVzLCBidXQgdGhpcyB3b3VsZCBuZWVk
IGEgbW9yZSBjb21wbGljYXRlZCBsb2dpYyByZWxhdGVkIHRvIHRoZSBoYW5kbGluZw0Kb2Yg
bG9jYWxfb2ZmLiBJIHRob3VnaHQgYWJvdXQgdGhhdCwgYnV0IGRpZG4ndCB3YW50IHRvIG1h
a2UgdGhlIHBhdGNoIG1vcmUNCmNvbXBsaWNhdGVkLg0KDQpBbmQgcmVnYXJkaW5nIHBlcmZv
cm1hbmNlIC0geWVzLCBpdCB3aWxsIGJlIG1pbmltYWwsIGJ1dCBpdCB3YXMgcmF0aGVyIGxv
dw0KaGFuZ2luZyBmcnVpdC4NCg0KPj4gQWRkaXRpb25hbGx5IHlvdXIgZXhhbXBsZSB3b24n
dCB2YWxpZGF0ZSBhbiBhYnNvbHV0ZSBwYXRobmFtZSBhdCBhbGwuDQo+IA0KPiBUaGF0J3Mg
YW4gZXJyb3IgaW4gdGhlIGxvZ2ljLiBUaGlzIGNhbiBiZSBzb3J0ZWQgb3V0Lg0KPiANCj4+
DQo+PiBXaGF0IGFib3V0IHRoaXMgdmFyaWFudDoNCj4gDQo+IEkgc3RpbGwgZG9uJ3Qgc2Vl
IHRoZSB2YWx1ZSBvZiBmb2xkaW5nIGlzX3ZhbGlkX25vZGVfbmFtZSgpLiBCdXQgaWYgdGhl
IG90aGVyIA0KPiBhZ3JlZXMgd2l0aCB5b3UgdGhlbi4uLg0KDQpJIGRpZG4ndCBzZWUgdGhl
IHZhbHVlIG9mIGtlZXBpbmcgdGhlbSBhcGFydCwgYXMgdGhlIG9ubHkgY2FsbGVyIG9mDQpp
c192YWxpZF9ub2RlX25hbWUoKSB3b3VsZCBiZSBjYW5vbmljYWxpemUoKSBhZnRlciB0aGlz
IHBhdGNoLiA6LSkNCg0KPiANCj4+DQo+PiBjb25zdCBjaGFyICpjYW5vbmljYWxpemUoc3Ry
dWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNvbnN0IHZvaWQgKmN0eCwNCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKm5v
ZGUsIGJvb2wgYWxsb3dfc3BlY2lhbCkNCj4+IHsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgY29u
c3QgY2hhciAqbmFtZTsNCj4+IMKgwqDCoMKgwqDCoMKgwqAgaW50IGxvY2FsX29mZiA9IDA7
DQo+PiDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBkb21pZDsNCj4+DQo+PiDCoMKg
wqDCoMKgwqDCoMKgIC8qDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKiBJbnZhbGlkIGlmIGFu
eSBvZjoNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqIC0gbm8gbm9kZSBhdCBhbGwNCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCAqIC0gaWxsZWdhbCBjaGFyYWN0ZXIgaW4gbm9kZQ0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgICogLSBzdGFydHMgd2l0aCAnQCcgYnV0IG5vIHNwZWNpYWwgbm9k
ZSBhbGxvd2VkDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+IMKgwqDCoMKgwqDCoMKg
wqAgZXJybm8gPSBFSU5WQUw7DQo+PiDCoMKgwqDCoMKgwqDCoMKgIGlmICghbm9kZSB8fA0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnNwbihub2RlLCAiQUJDREVGR0hJSktM
TU5PUFFSU1RVVldYWVphYmNkZWZnaGlqa2xtbm9wcXJzdHV2d3h5eiINCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIwMTIzNDU2Nzg5
LS9fQCIpICE9IHN0cmxlbihub2RlKSB8fA0KPiANCj4gLi4uIEkgd291bGQgcmF0aGVyIGtl
ZXAgY2FsbGluZyB2YWxpZF9jaGFycygpIGhlcmUuIFRoZSByZXN0IGxvb2tzIGZpbmUgZXZl
biANCj4gdGhvdWdoIHRoaXMgaXMgZGVmaW5pdGVseSBub3QgbXkgcHJlZmVyZW5jZS4NCg0K
SSBjYW4gZG8gdGhhdCwgZXZlbiBpZiBJIGRvbid0IHNlZSB0aGUgcmVhbCB2YWx1ZSB3aXRo
IHRoZSBjb21tZW50IGFib3ZlIHRoZSBpZi4NCg0KDQpKdWVyZ2VuDQo=
--------------rhPx0TzYaFyAMCT9HPkaQvWR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------rhPx0TzYaFyAMCT9HPkaQvWR--

--------------6fMLqb9HaWUIBj2asiWGeC08--

--------------qJ7UYErQpPpJ0NC64ye50hJo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTM6YwFAwAAAAAACgkQsN6d1ii/Ey8G
OwgAjKxR3TMtLnmXXylq1ltnZmfH762kDM2YzO96504/ImdvXFGJ0MVF6szFSwVEDd3ukKRpCfnB
tqfsusvj8raAAKKiVSerTdkpg6Ah4GHznqpFlhyrnXlYpTFQj76z/K0K74wSvOISvwckbFtFXNrs
TWnNXS10D4vOyBXndXM/SmTGdbiY7KOjVUp7l5hxPviN7Ef57qdbZIgCdBQgKfJcaDY/RndAfVFv
Aq5U3xH1Fu6faKURR4S/mEf7sV+rNj44bACiMIspKOoT+TrN7x5oWwUGNK5Lcfi9zKbtBskpv2++
dlQJYbhY26JyXem/RV1Rd0knxOeJgEE6a1eGv6JT6w==
=dQJY
-----END PGP SIGNATURE-----

--------------qJ7UYErQpPpJ0NC64ye50hJo--

