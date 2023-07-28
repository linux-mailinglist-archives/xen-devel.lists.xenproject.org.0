Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E359C766E15
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 15:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571467.895388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPNSQ-0003yY-Qh; Fri, 28 Jul 2023 13:24:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571467.895388; Fri, 28 Jul 2023 13:24:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPNSQ-0003wX-LP; Fri, 28 Jul 2023 13:24:38 +0000
Received: by outflank-mailman (input) for mailman id 571467;
 Fri, 28 Jul 2023 13:24:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPNSP-0003wR-TG
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 13:24:38 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1876a130-2d4a-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 15:24:36 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4D81B219BB;
 Fri, 28 Jul 2023 13:24:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 24374133F7;
 Fri, 28 Jul 2023 13:24:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Iio6B5PBw2TPBwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 13:24:35 +0000
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
X-Inumbo-ID: 1876a130-2d4a-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690550675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wMzkTIcAbS6CKxpofvrAfdhXppr2iFSWs/hW4SKk7t4=;
	b=SrNmNvMc9etZnDpYYL6Vz4hm5BYV1pKHcqhthVtLLdmLJEUreljzMtUaCNzIWyyL3Dc0n+
	ahFmq7HmGOKdDVzYX1M5dFn2UtEOikVCQFt9NbbV+0nWUB6e4CwTZLC97ldNcluQCAoDcE
	pgbq7v31yiEbfF6MiRap1LRCuYN2kdw=
Message-ID: <4d36876c-e943-06ac-782d-5d94851040e2@suse.com>
Date: Fri, 28 Jul 2023 15:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
 <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
 <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
In-Reply-To: <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------anOO0u0NmGSfsffD3HFpF04W"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------anOO0u0NmGSfsffD3HFpF04W
Content-Type: multipart/mixed; boundary="------------rVtUMORx2Lv502Yu0LyxB0fv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <4d36876c-e943-06ac-782d-5d94851040e2@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-18-jgross@suse.com>
 <b2d2a346-12c0-8ea4-38a2-b4748396540f@xen.org>
 <9a6d9c8b-350b-9a3e-4c23-0d7fd312e77a@suse.com>
 <3cce8892-1494-775f-8d75-80e87f0643cf@xen.org>
 <a9d55381-df3a-a343-7c4b-c5d5f6e7695b@suse.com>
 <27ba8831-89cb-9470-0b1c-03ad817e8292@xen.org>
 <68acbf84-218b-f2f7-9526-d9e07f845f6e@suse.com>
 <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
 <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
 <b8b8e733-6be0-a4d9-33b7-d93366ec0091@xen.org>
 <8a5854d1-2594-ed4f-ace8-e21db4fe4c7b@suse.com>
 <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>
In-Reply-To: <75dc26f0-0ea7-2097-47b2-1f857e1d7236@xen.org>

--------------rVtUMORx2Lv502Yu0LyxB0fv
Content-Type: multipart/mixed; boundary="------------HlRjGhF8IfiKPf8rrN9uHM3x"

--------------HlRjGhF8IfiKPf8rrN9uHM3x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDcuMjMgMTQ6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyOC8wNy8yMDIzIDEzOjA2LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjguMDcu
MjMgMTM6MTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+PiBJbiBjYXNlIG9mIGEgcnVu
dGltZSBjaGVjayBJDQo+Pj4+Pj4gYWdyZWUgdGhhdCBhIG1vcmUgY2VudHJhbCBwbGFjZSB3
b3VsZCBiZSBwcmVmZXJyZWQuDQo+Pj4+Pj4NCj4+Pj4+PiBJbiB0aGUgZW5kIEkgZG9uJ3Qg
bWluZCB0aGF0IG11Y2gsIGJ1dA0KPj4+Pj4+DQo+Pj4+Pj4gwqDCoMKgwqDCoEJVSUxEX0JV
R19PTihYRU5TVE9SRV9QQVlMT0FEX01BWCA+PQ0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICh0eXBlb2YoKHN0cnVjdCBub2RlX2hkciAqKU5VTEwtPmRhdGFsZW4pKSgt
MSkpOw0KPj4+Pj4+DQo+Pj4+Pj4gaXMgYSBsaXR0bGUgYml0IGNsdW1zeSBJTUhPLg0KPj4+
Pj4NCj4+Pj4+IEFncmVlLiBXZSBjb3VsZCBpbnRyb2R1Y2UgRklFTERfU0laRU9GKCkgKGFz
IExpbnV4IGRpZCkgdG8gaGlkZSB0aGUgDQo+Pj4+PiBjb21wbGV4aXR5LiBUaGUgY29kZSB3
b3VsZCB0aGVuIGxvb2sgbGlrZToNCj4+Pj4+DQo+Pj4+PiDCoD49ICg4ICogRklFTERfU0la
RU9GKHN0cnVjdCBub2RlX2hkciwgZGF0YWxlbikpDQo+Pj4+DQo+Pj4+IE9oLCBJIGd1ZXNz
IHlvdSBtZWFuIHNpemVvZl9maWVsZCgpLg0KPj4+Pg0KPj4+PiBBbmQgZXZlbiB3aXRoIHRo
YXQgaXQgd291bGQgbG9vayBxdWl0ZSBjbHVtc3k6DQo+Pj4+DQo+Pj4+IMKgwqDCoMKgwqBC
VUlMRF9CVUdfT04oWEVOU1RPUkVfUEFZTE9BRF9NQVggPj0NCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKDFVTCA8PCAoOCAqIHNpemVvZl9maWVsZChzdHJ1Y3Qgbm9kZV9o
ZHIsIGRhdGFsZW4pKSkpOw0KPj4+DQo+Pj4gSG93IGFib3V0IGtlZXBpbmcgdGhlIEJVSUxE
X0JVR19PTigpIGluIHdyaXRlX25vZGVfcmF3KCkgYW5kIGFkZCB0aGUgDQo+Pj4gZm9sbG93
aW5nIGNvbW1lbnQgb24gdG9wIG9mIGhhbmRsZV9pbnB1dCgpOg0KPj4+DQo+Pj4gU29tZSBm
aWVsZHMgaW4gWGVuc3RvcmVkIGFyZSBzaXplZCBiYXNlZCBvbiB0aGUgbWF4IHBheWxvYWQg
KHNlZSB2YXJpb3VzIA0KPj4+IEJVSUxEX0JVR19PTigpKS4gVGhpcyB3b3VsZCBuZWVkIGV4
dHJhIHJ1bnRpbWUgY2hlY2sgaWYgd2UgZXZlciBkZWNpZGUgdG8gDQo+Pj4gaGF2ZSBhIGR5
bmFtaWMgcGF5bG9hZCBzaXplLg0KPj4NCj4+IEkgX2NvdWxkXyBkbyB0aGF0LCBidXQgd2hl
cmUgdG8gc3RvcCBhZGRpbmcgc3VjaCBjb21tZW50cz8NCj4gDQo+IFdoZW4gc29tZW9uZSBv
dGhlciB0aGFuIHRoZSBhdXRob3IgaXMgYWJsZSB0byB1bmRlcnN0YW5kIHRoZSBjb2RlIHdp
dGhvdXQgdG9vIA0KPiBtdWNoIGVmZm9ydC4gTW9yZSBjb21tZW50cyBuZXZlciBodXJ0cywg
bGVzcyB3aWxsIGluIHRoZSBsb25nZXIgcnVuIChzZWUgYmVsb3cpLg0KDQpJIGFncmVlIHdp
dGggdGhhdCBzdGF0ZW1lbnQgaW4gZ2VuZXJhbCwgYnV0IHJlcXVlc3RpbmcgYSBjb21tZW50
IHRvIGFpZCBhDQpmdXR1cmUgcG90ZW50aWFsIGNoYW5nZSB2aW9sYXRpbmcgdGhlIFhlbnN0
b3JlIHdpcmUgcHJvdG9jb2wgaXMgYSBsaXR0bGUgYml0DQp3ZWlyZC4NCg0KPiANCj4+DQo+
PiBUQkgsIEkgcmVhbGx5IGRvbid0IHNlZSB0aGUgcG9pbnQgZG9pbmcgdGhhdC4NCj4+DQo+
PiBJbiBjYXNlIGEgcGF0Y2ggY2FtZSB1cCB1cHN0cmVhbSB0cnlpbmcgdG8gdmlvbGF0ZSBY
RU5TVE9SRV9QQVlMT0FEX01BWCBJIHdvdWxkDQo+PiBzdXJlbHkgTkFDSyBpdC4NCj4gVGhh
dCdzIGFzc3VtaW5nIHlvdSB3aWxsIHN0aWxsIGJlIGFyb3VuZCB3aGVuIHRoaXMgaGFwcGVu
cyA6KS4gSSBhbSBub3Qgd2lzaGluZyANCj4gYW55dGhpbmcgYmFkIGJ1dCB0aGUgY29kZSB3
aWxsIGxpa2VseSBvdXRsYXN0IGFueSBvZiB1cy4NCg0KTWF5YmUuIEJ1dCB3b3VsZCB5b3Ug
cmVhbGx5IEFjayBwYXRjaGVzIGFkZGluZyBjb21tZW50cyBsaWtlIHRoYXQgaW4gb3RoZXIN
CmFyZWFzPyBFLmcuIGNhc2VzIHdoZXJlIHRoZSBkb21pZCBpcyBzdG9yZWQgaW4gYW4gdW5z
aWduZWQgaW50IGFuZCBtZSBhZGRpbmcNCmEgY29tbWVudCB0byBiZSBjYXJlZnVsIGluIGNh
c2UgZG9taWRzIGV2ZXIgZ3JvdyB0byA2NCBiaXRzPw0KDQo+IFNvIHdlIG5lZWQgdG8gbWFr
ZSBlYXN5IGZvciBhIGZ1dHVyZSBtYWludGFpbmVycy9yZXZpZXdlcnMgdG8ga25vdyB0aGUg
DQo+IGFzc3VtcHRpb25zIGFuZCBpbXBsaWNhdGlvbnMgb2YgY2hhbmdpbmcgc29tZSBvZiB0
aGUgbGltaXRzLg0KDQpZZXMsIHRoYXQncyB3aGF0IHRoZSBCVUlMRF9CVUdfT04oKSBpcyBt
ZWFudCBmb3IuDQoNCj4+IEluIGNhc2Ugd2UgbmVlZCBwYXlsb2FkcyBsYXJnZXIgdGhhbiBY
RU5TVE9SRV9QQVlMT0FEX01BWCB3ZSBzaG91bGQgc3BsaXQgdGhlDQo+PiByZWxhdGVkIG9w
ZXJhdGlvbiBpbiBtdWx0aXBsZSBwYXJ0cyAoc2VlIGUuZy4gWFNfRElSRUNUT1JZX1BBUlQg
b3IgWFNfQ09OVFJPTA0KPj4gZm9yIHVwbG9hZGluZyBhIG5ldyBrZXJuZWwgdG8gWGVuc3Rv
cmUtc3R1YmRvbSBmb3IgbGl2ZSB1cGRhdGUpLiBXaGljaCBpcywgQlRXLA0KPj4gdGhlIHdh
eSBBV1Mgc2hvdWxkIGhhdmUgaGFuZGxlZCB0aGUgbWlncmF0aW9uIHByb2JsZW0gKHRyYW5z
YWN0aW9ucyBjb21lIHRvIG15DQo+PiBtaW5kIGluIHRoaXMgY29udGV4dCkuDQo+IA0KPiBJ
IHdhc24ndCBwYXJ0IG9mIHRoZSBvcmlnaW5hbCBkZXNpZ24sIGJ1dCBJIGNhbiBzZWUgd2h5
IGl0IHdhcyBkb25lIGxpa2UgdGhhdC4NCg0KSSBjYW4gc2VlIHdoeSBpdCB3YXMgZG9uZSB0
aGF0IHdheSwgYnV0IHRoaXMgZG9lc24ndCBtZWFuIEkgY2FuIHVuZGVyc3RhbmQNCndoeSBz
dWNoIGEgZGVzaWduIHNob3VsZCBiZSBzdXBwb3J0ZWQgYnkgYWRkaW5nIGNvbW1lbnRzIGhl
bHBpbmcgdG8gcmVwZWF0IHN1Y2gNCmEgYmFkIGRlY2lzaW9uLg0KDQo+IFVzaW5nIG11bHRp
cGxlIGNvbW1hbmRzIGhhcyBhbHNvIGl0cyBkb3duc2lkZS4gVGhlIGZpcnN0IHRoYXQgY29t
ZXMgdG8gbXkgbWluZCANCj4gaWYgdGhhdCB5b3UgbmVlZCB0byBrZWVwIGFyb3VuZCB0aGUg
ZGF0YS4gQnV0LCB3aXRoIHlvdXIgcHJvcG9zYWwsIHlvdSB3ZSANCj4gd291bGRuJ3QgYmUg
YWJsZSB0byBzdG9yZSBpdCBpbiB0aGUgZGF0YWJhc2UgKGxpa2UgZm9yIHRyYW5zYWN0aW9u
IHVwZGF0ZSkgYXMgDQo+IGRhdGFsZW4gY2FuIG9ubHkgYmUgNjVLQi4NCg0KSSB3YXNuJ3Qg
YXdhcmUgdGhhdCBhIGNvbXBsZXRlIHRyYW5zYWN0aW9uIG5lZWRzIHRvIGJlIGtlcHQgaW4g
YSBzaW5nbGUgZGF0YQ0KYmFzZSByZWNvcmQuIDotKQ0KDQpJdCB3b3VsZCB3b3JrIHBlcmZl
Y3RseSBmaW5lIHRvIGFsbG9jYXRlIHRoZSBuZWVkZWQgbWVtb3J5IHZpYSB0YWxsb2MoKSBh
bmQgdG8NCnJlZmVyZW5jZSBpdCBmcm9tIGEgc3BlY2lhbCBub2RlIGJlaW5nIHBhcnQgb2Yg
dGhlIHRyYW5zYWN0aW9uLCBvciB0byBub3QgdXNlDQphIG5vZGUgYXQgYWxsIChzZWUgYWdh
aW4gdGhlIFhTX0NPTlRST0wgZXhhbXBsZSkuDQoNCj4gDQo+IFNvIG9uZSBjb21tYW5kIGFz
IHRoZSBhZHZhbnRhZ2UgdG8gc2ltcGx5IGEgbG90IHRoZSBsb2dpYyBpbiBYZW5zdG9yZWQu
DQoNClNpbXBsaWZ5aW5nIHRoZSBsb2dpYyB3aGlsZSB2aW9sYXRpbmcgdGhlIGJhc2ljIHdp
cmUgcHJvdG9jb2wgaXMgYSBiYWQgZGVzaWduDQpkZWNpc2lvbiAoSSdtIHJlcGVhdGluZyBt
eXNlbGYsIEkga25vdykuDQoNCj4gQW55d2F5LCB0aGlzIGlzIGdldHRpbmcgYSBiaXQgb2Zm
IHRvcGljLiBNeSBvbmx5IHJlcXVlc3QgaXMgdG8gd3JpdGUgZG93biANCj4gYXNzdW1wdGlv
biBtb3JlIGV4cGxpY2l0bHkgcmF0aGVyIHRoYW4gaGlkaW5nIHRoZW0uIEEgY29tbWVudCBv
biB0b3Agb2YgdGhlIA0KPiBjaGVjayBpcyBhIG5pY2Ugd2F5IHRvIGhlbHAgdGhlIGRldmVs
b3BwZXIgdG8gYXZvaWQgbWFraW5nIGEgImJhZCIgZGVjaXNpb24uDQoNCkkgaGF2ZSBhZGRl
ZCBhIGJyaWVmIGNvbW1lbnQgd2h5IHRoZSBjaGVjayBpcyBleGlzdGluZyBhdCBhbGwuIEkg
ZXZlbiBtYW5hZ2VkDQp0byBhdm9pZCBhbnkgc3Ryb25nIGxhbmd1YWdlLiA6LSkNCg0KCS8q
IFNvbWUgZG93bnN0cmVhbXMgbW9kaWZ5IFhFTlNUT1JFX1BBWUxPQURfTUFYLiAqLw0KDQpC
dXQgbWF5YmUgdGhhdCBjb21tZW50IHdhcyBiYXNlZCBvbiB3cm9uZyBhc3N1bXB0aW9ucywg
bGlrZSB0aGUgbWVudGlvbmVkDQpjaGFuZ2Ugbm90IHZpb2xhdGluZyB0aGUgcHJvdG9jb2wu
DQoNCj4gSSBhbSBoYXBweSB0byByZXdyaXRlIHRoZSBjb21tZW50IHNvIGl0IGRvZXNuJ3Qg
bGVhZCB0byB0aGluayB0aGF0IHlvdSAoYXMgdGhlIA0KPiBtYWludGFpbmVyKSBhcmUgb3Bl
biB0byBoYXZlIGEgbW9yZSByZWxheCBsZW5ndGggY2hlY2suDQoNClllcywgcGxlYXNlIG1h
a2UgYSBzdWdnZXN0aW9uIGZvciBhIHByb3BlciBjb21tZW50IG5vdCBzdWdnZXN0aW5nIHdl
IGFyZSBmaW5lDQp0byB2aW9sYXRlIHRoZSB3aXJlIHByb3RvY29sLg0KDQoNCkp1ZXJnZW4N
Cg==
--------------HlRjGhF8IfiKPf8rrN9uHM3x
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

--------------HlRjGhF8IfiKPf8rrN9uHM3x--

--------------rVtUMORx2Lv502Yu0LyxB0fv--

--------------anOO0u0NmGSfsffD3HFpF04W
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTDwZIFAwAAAAAACgkQsN6d1ii/Ey93
Cgf/dzsRNjO0jUi5rWsghnqAT9w4DTc4l6xgC3rZlsy7gJoU7S14emMXKdaQMasATe2/g2ghY3tR
rW1S20vq1XoqJN2aMmt8hr1Va2Y4Mzy7R+f1oceyzb9euzANaZIIm4cjJ0C02U+VfAMRkhOgM7ey
FVhF6a7pqAwCUhq931RNIrZqQNkaCRSny2tfOQefNk8HnlAS6F2o8JC37yiFUorX18Ja7k6fp82R
UbMbkN2+zXGqO/JSSBmuTTT1lxMmeHS/C+enlS5JovfPbz58K2razjqCfcutnNphRgUdnV3vN0fq
jNIxp3pVHmdKCDSkaY3TL1zd9t7jL4rBE7wfpFhU9A==
=P/Xf
-----END PGP SIGNATURE-----

--------------anOO0u0NmGSfsffD3HFpF04W--

