Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E276FE49
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 12:18:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577073.903922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrsi-0007hK-TR; Fri, 04 Aug 2023 10:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577073.903922; Fri, 04 Aug 2023 10:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRrsi-0007fG-Qk; Fri, 04 Aug 2023 10:18:04 +0000
Received: by outflank-mailman (input) for mailman id 577073;
 Fri, 04 Aug 2023 10:18:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRrsh-0007f8-70
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 10:18:03 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30bdba83-32b0-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 12:18:01 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 969371F8AE;
 Fri,  4 Aug 2023 10:18:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6196D13904;
 Fri,  4 Aug 2023 10:18:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0rxoFVjQzGTHLwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 10:18:00 +0000
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
X-Inumbo-ID: 30bdba83-32b0-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691144280; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=di3ivyrNeyF0VS8VuVBxnfkN9kNd9gXCabW2V/BS6vk=;
	b=DPKBM4gsD2irqRO4LOnMDBIQUh26cGBzZesUd4i+b09aCjRXL/bRkOI/RkK940MSJ8XvrA
	BNIH8f95XJxhL6vYGBlqSD/tPvNe9XrXNokFaKVqqejgr+ALMOL+79S+jtaDgjpyKdOt/0
	qFIJ++Mujr53OVDsIEFdAI1hTBuFXrM=
Message-ID: <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
Date: Fri, 4 Aug 2023 12:17:59 +0200
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
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
In-Reply-To: <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7eGtJhfWD2eV7lNNV2nDPntC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7eGtJhfWD2eV7lNNV2nDPntC
Content-Type: multipart/mixed; boundary="------------LxLvMJZ1H0p7ahM0kf3VUuVy";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
 <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
 <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
In-Reply-To: <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>

--------------LxLvMJZ1H0p7ahM0kf3VUuVy
Content-Type: multipart/mixed; boundary="------------VKt5a6eOm5Zv9WEb3rzgJgOh"

--------------VKt5a6eOm5Zv9WEb3rzgJgOh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjMgMTI6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAwNC8wOC8yMDIzIDEwOjM1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMDMuMDgu
MjMgMjM6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+IE9uIDI0
LzA3LzIwMjMgMTI6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IFRvZGF5IGlzX3Zh
bGlkX25vZGVuYW1lKCkgaXMgYWx3YXlzIGNhbGxlZCBkaXJlY3RseSBhZnRlciBjYWxsaW5n
DQo+Pj4+IGNhbm9uaWNhbGl6ZSgpLCB3aXRoIHRoZSBleGNlcHRpb24gb2YgZG9fdW53YXRj
aCgpLCB3aGVyZSB0aGUgY2FsbA0KPj4+PiBpcyBtaXNzaW5nICh3aGljaCBpcyBub3QgY29y
cmVjdCwgYnV0IHJlc3VsdHMganVzdCBpbiBhIHdyb25nIGVycm9yDQo+Pj4+IHJlYXNvbiBi
ZWluZyByZXR1cm5lZCkuDQo+Pj4NCj4+PiBXaGlsZSB0aGlzIGNoYW5nZSBtYWtlcyBzZW5z
ZS4uLg0KPj4+DQo+Pj4+DQo+Pj4+IE1lcmdlIGlzX3ZhbGlkX25vZGVuYW1lKCkgaW50byBj
YW5vbmljYWxpemUoKS4gV2hpbGUgYXQgaXQgbWVyZ2UNCj4+Pj4gdmFsaWRfY2hhcnMoKSBp
bnRvIGl0LCB0b28uDQo+Pj4NCj4+PiAuLi4gSSBhbSBub3QgaW4gZmF2b3Igb2YgZm9sZGlu
ZyB0aGUgY29kZSBpc192YWxpZF9ub2RlbmFtZSgpIGFuZCANCj4+PiB2YWxpZF9jaGFycygp
IGludG8gY2Fub25pY2FsaXplKCkgYmVjYXVzZSB0aGUgY29kZSBpcyBub3cgbW9yZSBkaWZm
aWN1bHQgdG8gDQo+Pj4gcmVhZC4gQWxzbywgdGhlIGtlZXBpbmcgdGhlIHNwbGl0IHdvdWxk
IGFsbG93IHRvIGZyZWUgdGhlICduYW1lJyBpbiBjYXNlIG9mIA0KPj4+IGFuIGVycm9yIHdp
dGhvdXQgYWRkaW5nIHRvbyBtdWNoIGdvdG8gaW4gdGhlIGNvZGUuDQo+Pg0KPj4gSSBkb24n
dCB0aGluayB3ZSBjYW4gZWFzaWx5IGZyZWUgbmFtZSBpbiBhbiBlcnJvciBjYXNlLCBhdCB0
aGF0IHdvdWxkIHJlcXVpcmUNCj4+IHRvIGtlZXAga25vd2xlZGdlIHRoYXQgbmFtZSB3YXMg
anVzdCBhbGxvY2F0ZWQgaW4gdGhlIG5vbi1jYW5vbmljYWwgY2FzZS4NCj4gDQo+IEhvdyBh
Ym91dCB0aGlzOg0KPiANCj4gY29uc3QgY2hhciAqY2Fub25pY2FsaXplKHN0cnVjdCBjb25u
ZWN0aW9uICpjb25uLCBjb25zdCB2b2lkICpjdHgsDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqbm9kZSwgYm9vbCBh
bGxvd19zcGVjaWFsKQ0KPiB7DQo+ICDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpwcmVm
aXg7DQo+ICDCoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpuYW1lOw0KPiANCj4gIMKgwqDC
oMKgwqDCoMKgIGlmICghbm9kZSkNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gTlVMTDsNCj4gDQo+ICDCoMKgwqDCoMKgwqDCoCBpZiAobm9kZVswXSA9PSAn
QCcgJiYgIWFsbG93X3NwZWNpYWwpDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIE5VTEw7DQo+IA0KPiAgwqDCoMKgwqDCoMKgwqAgaWYgKCFub2RlIHx8IChu
b2RlWzBdID09ICcvJykgfHwgKG5vZGVbMF0gPT0gJ0AnKSkNCj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gbm9kZTsNCj4gIMKgwqDCoMKgwqDCoMKgIHByZWZp
eCA9IGdldF9pbXBsaWNpdF9wYXRoKGNvbm4pOw0KPiAgwqDCoMKgwqDCoMKgwqAgaWYgKHBy
ZWZpeCkgew0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5hbWUgPSB0YWxs
b2NfYXNwcmludGYoY3R4LCAiJXMvJXMiLCBwcmVmaXgsIG5vZGUpOw0KPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChuYW1lKQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4gIMKgwqDCoMKg
wqDCoMKgIH0gZWxzZQ0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5hbWUg
PSBub2RlOw0KPiANCj4gIMKgwqDCoMKgwqDCoMKgIGlmICghaXNfdmFsaWRfbm9kZW5hbWUo
Y29ubiwgbm9kZSwgYWxsb3dfc3BlY2lhbCkpIHsNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKiBSZWxlYXNlIHRoZSBtZW1vcnkgaWYgJ25hbWUnIHdhcyBhbGxvY2F0
ZWQgYnkgdXMgKi8NCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIG5h
bWUgIT0gbm9kZSApDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHRhbGxvY19mcmVlKG5hbWUpOw0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiBOVUxMOw0KPiAgwqDCoMKgwqDCoMKgwqAgfQ0KPiANCj4gIMKg
wqDCoMKgwqDCoMKgIHJldHVybiBuYW1lOw0KPiB9DQo+IA0KPiBBbmQgYmVmb3JlIHlvdSBh
c2ssIEkgZG9uJ3Qgc2VlIHRoZSBiZW5lZml0cyB0byBwYXJ0aWFsbHkgdmFsaWRhdGUgdGhl
IG5hbWUgDQo+IGJlZm9yZSBhbGxvY2F0aW5nLiBIZW5jZSB3aHkgSSBzdWdnZXN0IHRvIGtl
ZXAgaXNfdmFsaWRfbm9kZW5hbWUoKSBhcyB0aGlzIGtlZXAgDQo+IHRoZSBmdW5jdGlvbiBz
bWFsbC4NCg0KUGFydGlhbGx5IHZhbGlkYXRpbmcgYmVmb3JlIGRvaW5nIHRoZSBhbGxvY2F0
aW9uIGlzIGEgYmVuZWZpdCBhcyBpdCBkb2Vzbid0DQpzcGVuZCBjeWNsZXMgb24gdmFsaWRh
dGluZyB0aGUga25vd24gZ29vZCBwcmVmaXguDQoNCkFkZGl0aW9uYWxseSB5b3VyIGV4YW1w
bGUgd29uJ3QgdmFsaWRhdGUgYW4gYWJzb2x1dGUgcGF0aG5hbWUgYXQgYWxsLg0KDQpXaGF0
IGFib3V0IHRoaXMgdmFyaWFudDoNCg0KY29uc3QgY2hhciAqY2Fub25pY2FsaXplKHN0cnVj
dCBjb25uZWN0aW9uICpjb25uLCBjb25zdCB2b2lkICpjdHgsDQogICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnN0IGNoYXIgKm5vZGUsIGJvb2wgYWxsb3dfc3BlY2lhbCkNCnsNCiAg
ICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7DQogICAgICAgICBpbnQgbG9jYWxfb2ZmID0gMDsN
CiAgICAgICAgIHVuc2lnbmVkIGludCBkb21pZDsNCg0KICAgICAgICAgLyoNCiAgICAgICAg
ICAqIEludmFsaWQgaWYgYW55IG9mOg0KICAgICAgICAgICogLSBubyBub2RlIGF0IGFsbA0K
ICAgICAgICAgICogLSBpbGxlZ2FsIGNoYXJhY3RlciBpbiBub2RlDQogICAgICAgICAgKiAt
IHN0YXJ0cyB3aXRoICdAJyBidXQgbm8gc3BlY2lhbCBub2RlIGFsbG93ZWQNCiAgICAgICAg
ICAqLw0KICAgICAgICAgZXJybm8gPSBFSU5WQUw7DQogICAgICAgICBpZiAoIW5vZGUgfHwN
CiAgICAgICAgICAgICBzdHJzcG4obm9kZSwgIkFCQ0RFRkdISUpLTE1OT1BRUlNUVVZXWFla
YWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXoiDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICIwMTIzNDU2Nzg5LS9fQCIpICE9IHN0cmxlbihub2RlKSB8fA0KICAgICAgICAgICAgIChu
b2RlWzBdID09ICdAJyAmJiAhYWxsb3dfc3BlY2lhbCkpDQogICAgICAgICAgICAgICAgIHJl
dHVybiBOVUxMOw0KDQogICAgICAgICBpZiAobm9kZVswXSAhPSAnLycgJiYgbm9kZVswXSAh
PSAnQCcpIHsNCiAgICAgICAgICAgICAgICAgbmFtZSA9IHRhbGxvY19hc3ByaW50ZihjdHgs
ICIlcy8lcyIsIGdldF9pbXBsaWNpdF9wYXRoKGNvbm4pLA0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG5vZGUpOw0KICAgICAgICAgICAgICAgICBpZiAoIW5h
bWUpDQogICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQogICAgICAgICB9
IGVsc2UNCiAgICAgICAgICAgICAgICAgbmFtZSA9IG5vZGU7DQoNCiAgICAgICAgIGlmIChz
c2NhbmYobmFtZSwgIi9sb2NhbC9kb21haW4vJTV1LyVuIiwgJmRvbWlkLCAmbG9jYWxfb2Zm
KSAhPSAxKQ0KICAgICAgICAgICAgICAgICBsb2NhbF9vZmYgPSAwOw0KDQogICAgICAgICAv
Kg0KICAgICAgICAgICogT25seSB2YWxpZCBpZjoNCiAgICAgICAgICAqIC0gZG9lc24ndCBl
bmQgaW4gLyAodW5sZXNzIGl0J3MganVzdCAiLyIpDQogICAgICAgICAgKiAtIG5vIGRvdWJs
ZSAvLw0KICAgICAgICAgICogLSBub3QgdmlvbGF0aW5nIG1heCBhbGxvd2VkIHBhdGggbGVu
Z3RoDQogICAgICAgICAgKi8NCiAgICAgICAgIGlmICghKHN0cmVuZHMobmFtZSwgIi8iKSAm
JiAhc3RyZXEobmFtZSwgIi8iKSkgJiYNCiAgICAgICAgICAgICAhc3Ryc3RyKG5hbWUsICIv
LyIpICYmDQogICAgICAgICAgICAgIWRvbWFpbl9tYXhfY2hrKGNvbm4sIEFDQ19QQVRITEVO
LCBzdHJsZW4obmFtZSkgLSBsb2NhbF9vZmYpKQ0KICAgICAgICAgICAgICAgICByZXR1cm4g
bmFtZTsNCg0KICAgICAgICAgLyogUmVsZWFzZSB0aGUgbWVtb3J5IGlmICduYW1lJyB3YXMg
YWxsb2NhdGVkIGJ5IHVzLiAqLw0KICAgICAgICAgaWYgKG5hbWUgIT0gbm9kZSkNCiAgICAg
ICAgICAgICAgICAgdGFsbG9jX2ZyZWUobmFtZSk7DQogICAgICAgICByZXR1cm4gTlVMTDsN
Cn0NCg0KDQpKdWVyZ2VuDQo=
--------------VKt5a6eOm5Zv9WEb3rzgJgOh
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

--------------VKt5a6eOm5Zv9WEb3rzgJgOh--

--------------LxLvMJZ1H0p7ahM0kf3VUuVy--

--------------7eGtJhfWD2eV7lNNV2nDPntC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTM0FcFAwAAAAAACgkQsN6d1ii/Ey+d
lQf8DN4dsSrsVaUssLuGXXukxw6DVPvUs4mEGILtFequmwW4mrA74eUezFtof87AOY8xc3pSqABA
4JdCutZ8iPRkZ8i+Bc4lEFRxRTXsi+/e3bKf1R5xF3fZhabUcaBGT0uVgXnsOpt+RIZLAaEmJ6fq
XeT5bsvB+gv94gOhlNoDLS4v2fLxJ0sFFfahn5rBAGXAKPteB+zKLl3nl/LI0Z8qLGv6+VJVpquM
xSQjylPzrVl/RqLQkUutK+sl9tf7JBC0QS58b+gRC64opwHCcKIRo4cN+ODgN36v/4VWnMSUhaGy
Io2hmsFjd0FDOUeZl2ISVCL/7pi3/N91D4Dy1zoSvQ==
=Mr4I
-----END PGP SIGNATURE-----

--------------7eGtJhfWD2eV7lNNV2nDPntC--

