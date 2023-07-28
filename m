Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F116766AF8
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 12:47:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571423.895228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPL0E-0004Yf-PF; Fri, 28 Jul 2023 10:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571423.895228; Fri, 28 Jul 2023 10:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPL0E-0004Vk-MU; Fri, 28 Jul 2023 10:47:22 +0000
Received: by outflank-mailman (input) for mailman id 571423;
 Fri, 28 Jul 2023 10:47:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qPL0C-0004UR-Nr
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 10:47:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20065a5b-2d34-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 12:47:19 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1E2C9218F2;
 Fri, 28 Jul 2023 10:47:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E75F7133F7;
 Fri, 28 Jul 2023 10:47:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6JwRN7acw2RlMgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 28 Jul 2023 10:47:18 +0000
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
X-Inumbo-ID: 20065a5b-2d34-11ee-b24d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690541239; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HvGKNdCN9YdpM0WRY1MKfqkkqseDt7KZzpXjaUH9VS0=;
	b=t/OCKcqilw3x+EagNwbnPmGZksMZDHqgNyqLBeD6UMvFjcdW3b6YlfbZ6H+pEUtYvDketI
	/QWYjrYqBIjM8DO+RVt6v35nMFVHdavGgxobVhSAZDegvTvH5YRHwPhb0mlVjul21poks7
	2dbwImGLp8WnwBWpRYNY1A2ZbYhTjyY=
Message-ID: <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
Date: Fri, 28 Jul 2023 12:47:18 +0200
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
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 17/25] tools/xenstore: rework struct xs_tdb_record_hdr
In-Reply-To: <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gPRrSh0EAoGlF7A6rZgG4L0K"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gPRrSh0EAoGlF7A6rZgG4L0K
Content-Type: multipart/mixed; boundary="------------Ks3jMNmnpSsK7GIKtqn513Fu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <6a376365-a731-2413-16c7-14ede5224eea@suse.com>
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
In-Reply-To: <8cea1316-db0b-f29d-c467-6fd5c4a6321c@xen.org>

--------------Ks3jMNmnpSsK7GIKtqn513Fu
Content-Type: multipart/mixed; boundary="------------mHUW10edPu05OGZyJFk1hBgT"

--------------mHUW10edPu05OGZyJFk1hBgT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDcuMjMgMTI6MzQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAyOC8wNy8yMDIzIDEwOjQ1LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gT24gMjguMDcu
MjMgMTE6MzgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBKdWVyZ2VuLA0KPj4+DQo+
Pj4gT24gMjgvMDcvMjAyMyAxMDoxNCwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24g
MjguMDcuMjMgMTA6NTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+IEhpIEp1ZXJnZW4s
DQo+Pj4+Pg0KPj4+Pj4gT24gMjgvMDcvMjAyMyAwNzoyMywgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4+Pj4+PiBPbiAyNy4wNy4yMyAyMzo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+
Pj4+PiBIaSBKdWVyZ2VuLA0KPj4+Pj4+Pg0KPj4+Pj4+PiBPbiAyNC8wNy8yMDIzIDEyOjAy
LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+Pj4+Pj4gU3RydWN0IHhzX3RkYl9yZWNvcmRf
aGRyIGlzIHVzZWQgZm9yIG5vZGVzIHN0b3JlZCBpbiB0aGUgZGF0YSBiYXNlLg0KPj4+Pj4+
Pj4gV2hlbiB3b3JraW5nIG9uIGEgbm9kZSwgc3RydWN0IG5vZGUgaXMgYmVpbmcgdXNlZCwg
d2hpY2ggaXMgaW5jbHVkaW5nDQo+Pj4+Pj4+PiB0aGUgc2FtZSBpbmZvcm1hdGlvbiBhcyBz
dHJ1Y3QgeHNfdGRiX3JlY29yZF9oZHIsIGJ1dCBpbiBhIGRpZmZlcmVudA0KPj4+Pj4+Pj4g
Zm9ybWF0LiBSZXdvcmsgc3RydWN0IHhzX3RkYl9yZWNvcmRfaGRyIGluIG9yZGVyIHRvIHBy
ZXBhcmUgaW5jbHVkaW5nDQo+Pj4+Pj4+PiBpdCBpbiBzdHJ1Y3Qgbm9kZS4NCj4+Pj4+Pj4+
DQo+Pj4+Pj4+PiBEbyB0aGUgZm9sbG93aW5nIG1vZGlmaWNhdGlvbnM6DQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gLSBtb3ZlIGl0cyBkZWZpbml0aW9uIHRvIHhlbnN0b3JlZF9jb3JlLmgsIGFz
IHRoZSByZWFzb24gdG8gcHV0IGl0IGludG8NCj4+Pj4+Pj4+IMKgwqAgdXRpbHMuaCBhcmUg
bm8gbG9uZ2VyIGV4aXN0aW5nDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gLSByZW5hbWUgaXQgdG8g
c3RydWN0IG5vZGVfaGRyLCBhcyB0aGUgInRkYiIgaW4gaXRzIG5hbWUgaGFzIG9ubHkNCj4+
Pj4+Pj4+IMKgwqAgaGlzdG9yaWNhbCByZWFzb25zDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gLSBy
ZXBsYWNlIHRoZSBlbXB0eSBwZXJtaXNzaW9uIGFycmF5IGF0IHRoZSBlbmQgd2l0aCBhIGNv
bW1lbnQgYWJvdXQNCj4+Pj4+Pj4+IMKgwqAgdGhlIGxheW91dCBvZiBkYXRhIGluIHRoZSBk
YXRhIGJhc2UgKGNvbmNhdGVuYXRpb24gb2YgaGVhZGVyLA0KPj4+Pj4+Pj4gwqDCoCBwZXJt
aXNzaW9ucywgbm9kZSBjb250ZW50cywgYW5kIGNoaWxkcmVuIGxpc3QpDQo+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4gLSB1c2UgbmFycm93ZXIgdHlwZXMgZm9yIG51bV9wZXJtcyBhbmQgZGF0YWxl
biwgYXMgdGhvc2UgYXJlIG5hdHVyYWxseQ0KPj4+Pj4+Pj4gwqDCoCBsaW1pdGVkIHRvIFhF
TlNUT1JFX1BBWUxPQURfTUFYIChjaGlsZGxlbiBpcyBkaWZmZXJlbnQgaGVyZSwgYXMgaXQg
aXMNCj4+Pj4+Pj4+IMKgwqAgaW4gdGhlb3J5IGJhc2ljYWxseSB1bmxpbWl0ZWQpDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IFRoZSBhc3N1bXB0aW9uIGlzIFhFTlNUT1JFX1BBWUxPQURfTUFYIHdp
bGwgbmV2ZXIgY2hhbmdlIGFuZC9vciBhbHdheXMgDQo+Pj4+Pj4+IGFwcGx5IGZvciBhbGwg
dGhlIGNvbm5lY3Rpb24uIEkgYW0gYXdhcmUgb2YgYXQgbGVhc3Qgb25lIGRvd25zdHJlYW0g
dXNlIA0KPj4+Pj4+PiB3aGVyZSB0aGlzIGlzIG5vdCB0aGUgY2FzZS4NCj4+Pj4+Pj4NCj4+
Pj4+Pj4gSSBhbSBoYXBweSB0byB1c2UgbmFycm93ZXIgdHlwZXMsIGJ1dCBJIHdvdWxkIGF0
IGxlYXN0IGxpa2Ugc29tZSBjaGVja3MgDQo+Pj4+Pj4+IGluIFhlbnN0b3JlIHRvIGVuc3Vy
ZSB0aGUgbGltaXRzIGFyZSBub3QgcmVhY2hlZC4NCj4+Pj4+Pg0KPj4+Pj4+IEkgd2lsbCBh
ZGQgYSBCVUlMRF9CVUdfT04oKS4NCj4+Pj4+DQo+Pj4+PiBJbml0aWFsbHkgSSB3YXMgdGhp
bmtpbmcgYWJvdXQgYSBydW50aW1lIGNoZWNrLCBidXQgSSBhbSBhbHNvIGZpbmUgd2l0aCBh
IA0KPj4+Pj4gQlVJTERfQlVHX09OKCkgaWYgaXQgaXMgcmlnaHQgbmV4dCB0byBsZW5ndGgg
Y2hlY2sgaW4gaGFuZGxlX2lucHV0KCkuIFNvIGlmIA0KPj4+Pj4gc29tZW9uZSBkZWNpZGVk
IHRvIGFkZCBkaWZmZXJlbnQgcGF5bG9hZCBzaXplIGRlcGVuZGluZyBvbiB0aGUgZG9tYWlu
IChzdWNoIA0KPj4+Pj4gYXMgcHJpdmlsZWdlZCBkb21haW4gY291bGQgZG8gbW9yZSksIGl0
IHdvdWxkIGJlIGVhc2llciB0byBzcG90IHdoYXQgZWxzZSANCj4+Pj4+IG5lZWRzIHRvIGJl
IGNoYW5nZWQuDQo+Pj4+DQo+Pj4+IElzIHRoaXMgcmVhbGx5IHRoZSBjb3JyZWN0IHBsYWNl
bWVudD8NCj4+Pg0KPj4+IEkgdGhpbmsgc28uIEJ5IGFkZGluZyB0aGUgQlVJTERfT05fQlVH
KCkgcmlnaHQgYWJvdmUgdGhlIGxlbmd0aCBjaGVjaywgaXQgDQo+Pj4gd291bGQgYmUgZWFz
aWVyIGZvciBldmVyeW9uZSB0byBrbm93IHRoYXQgdGhlIGRhdGFzdHJ1Y3R1cmUgbWF5IGFs
c28gbmVlZCB0byANCj4+PiBjaGFuZ2UuIFRoaXMgLi4uDQo+Pj4NCj4+Pj4NCj4+Pj4gSSd2
ZSBwdXQgaXQgaW50byB3cml0ZV9ub2RlX3JhdygpLCBhcyB0aGlzIGlzIHdoZXJlIHRoZSBy
ZWxhdGVkIGRhdGFsZW4gbWVtYmVyDQo+Pj4+IGlzIGJlaW5nIGZpbGxlZC4gDQo+Pj4NCj4+
PiAuLi4gd291bGQgYmUgbGVzcyBvYnZpb3VzIGhlcmUgYW5kIEkgdGhpbmsgaXQgbWlnaHQg
YmUgbWlzcy4NCj4+DQo+PiBBc3N1bWluZyB0aGF0IHNvbWVvbmUgY2hhbmdpbmcgWEVOU1RP
UkVfUEFZTE9BRF9NQVggd291bGQgZG8gYSBidWlsZCBhZnRlcndhcmRzLA0KPj4gSSBkb24n
dCBzZWUgaG93IHN1Y2ggYSBmYWlsdXJlIGNvdWxkIGJlIG1pc3NlZC4NCj4gDQo+IEJlY2F1
c2Ugb25lIG1heSB3YW50IGRvbTAgdG8gc2VuZCBwYXlsb2FkIGJpZ2dlciB0aGFuIFhFTlNU
T1JFX1BBWUxPQURfTUFYLiANCj4gU29tZXRoaW5nIGxpa2U6DQo+IA0KPiBpZiAoIGNvbm4t
PmlkICE9IDAgJiYgbGVuIDwgWEVOU1RPUkVfUEFZTE9BRF9NQVggKQ0KPiANCj4gU3VjaCBj
aGFuZ2Ugd291bGQgbm90IGJlIGNhdWdodCBkdXJpbmcgY29tcGlsYXRpb24uIEFXUyBoYXMg
YSBzaW1pbGFyIGNoZWNrIGluIA0KPiB0aGUgZG93bnN0cmVhbSB0cmVlIGJlY2F1c2UgdGhl
IGltcGxlbWVudGF0aW9uIG9mIG5vbi1jb29wZXJhdGl2ZSBtaWdyYXRpb24gaXMgDQo+IHVz
aW5nIFhlbnN0b3JlIGNvbW1hbmQgYW5kIHdlIHdhbnQgdG8gYmUgYWJsZSB0byB0cmFuc2Zl
ciB0aGUgc3RhdGUgaW4gYSBzaW5nbGUgDQo+IGNvbW1hbmQuDQoNCkFuZCBob3cgZGlyZWN0
bHkgaXMgdGhpcyByZWxhdGVkIHRvIHRoZSBtYXggZGF0YSBzaXplIG9mIG5vZGUgY29udGVu
dHM/DQoNCkFzIHNvb24gYXMgeW91IGFyZSBhbGxvd2luZyBkb20wIHRvIHdyaXRlIGxhcmdl
ciBub2RlcywgeW91IGFyZSByaXNraW5nIHRvDQpraWxsIGNsaWVudCBjb25uZWN0aW9ucyB0
cnlpbmcgdG8gcmVhZCBzdWNoIGEgbm9kZS4gU28gdGhlIG5vZGUgc2l6ZSBzaG91bGQNCnN0
aWxsIGJlIGxpbWl0ZWQgdG8gWEVOU1RPUkVfUEFZTE9BRF9NQVguDQoNCklNTyBhbm90aGVy
IHJlYXNvbiB0byB1c2UgdGhlIHBsYWNlbWVudCBJJ3ZlIHN1Z2dlc3RlZC4gQVdTIHNob3Vs
ZCBldmVuIGFkZA0KYSBzaXplIGNoZWNrIHdoZW4gd3JpdGluZyBub2RlcyB0byBtYWtlIHN1
cmUgZG9tMCBkb2Vzbid0IGRvIGV2aWwgdGhpbmdzLg0KDQo+IA0KPj4gSW4gY2FzZSBvZiBh
IHJ1bnRpbWUgY2hlY2sgSQ0KPj4gYWdyZWUgdGhhdCBhIG1vcmUgY2VudHJhbCBwbGFjZSB3
b3VsZCBiZSBwcmVmZXJyZWQuDQo+Pg0KPj4gSW4gdGhlIGVuZCBJIGRvbid0IG1pbmQgdGhh
dCBtdWNoLCBidXQNCj4+DQo+PiDCoMKgwqDCoMKgQlVJTERfQlVHX09OKFhFTlNUT1JFX1BB
WUxPQURfTUFYID49DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAodHlwZW9mKChz
dHJ1Y3Qgbm9kZV9oZHIgKilOVUxMLT5kYXRhbGVuKSkoLTEpKTsNCj4+DQo+PiBpcyBhIGxp
dHRsZSBiaXQgY2x1bXN5IElNSE8uDQo+IA0KPiBBZ3JlZS4gV2UgY291bGQgaW50cm9kdWNl
IEZJRUxEX1NJWkVPRigpIChhcyBMaW51eCBkaWQpIHRvIGhpZGUgdGhlIGNvbXBsZXhpdHku
IA0KPiBUaGUgY29kZSB3b3VsZCB0aGVuIGxvb2sgbGlrZToNCj4gDQo+ICA+PSAoOCAqIEZJ
RUxEX1NJWkVPRihzdHJ1Y3Qgbm9kZV9oZHIsIGRhdGFsZW4pKQ0KDQpPaCwgSSBndWVzcyB5
b3UgbWVhbiBzaXplb2ZfZmllbGQoKS4NCg0KQW5kIGV2ZW4gd2l0aCB0aGF0IGl0IHdvdWxk
IGxvb2sgcXVpdGUgY2x1bXN5Og0KDQoJQlVJTERfQlVHX09OKFhFTlNUT1JFX1BBWUxPQURf
TUFYID49DQoJCSAgICAgKDFVTCA8PCAoOCAqIHNpemVvZl9maWVsZChzdHJ1Y3Qgbm9kZV9o
ZHIsIGRhdGFsZW4pKSkpOw0KDQoNCkp1ZXJnZW4NCg==
--------------mHUW10edPu05OGZyJFk1hBgT
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mHUW10edPu05OGZyJFk1hBgT--

--------------Ks3jMNmnpSsK7GIKtqn513Fu--

--------------gPRrSh0EAoGlF7A6rZgG4L0K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTDnLYFAwAAAAAACgkQsN6d1ii/Ey91
iwgAjq2IWypUIQ6qd5nUa9SGnnC4ymhGV3jh8YNprdv2eAwLWHx4cFLW6/QQoFb238E6m4kxUYG2
xs4ap56oYhOfrE80pmUzGKFHKrfcgEj8gcr5kmrZOuoUpajj7F1r85Qqx9gZG+AU0dtsbKUQ/vh8
I1E/mfIDi+vA6tGbraT3V1k+2+OZ1V/6x8PA6EnEfMcE/bjdb7MKx4651DzoLBLKJyY4mSHLU7YW
XptzbeotlDbSyhAzDVa9WNL/Hjs+BcGoEHoovu5odr7ou+xQduS7Eegs3yHqIbcccjI0aAfCw9u9
bmRyE+r9sDNBbuuwpyEVC5fGZv+WoN0RFGcmov7cfg==
=+FBd
-----END PGP SIGNATURE-----

--------------gPRrSh0EAoGlF7A6rZgG4L0K--

