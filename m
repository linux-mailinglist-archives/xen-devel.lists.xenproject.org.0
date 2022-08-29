Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE105A4C99
	for <lists+xen-devel@lfdr.de>; Mon, 29 Aug 2022 14:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394582.634040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSeJ6-0003br-I7; Mon, 29 Aug 2022 12:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394582.634040; Mon, 29 Aug 2022 12:56:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSeJ6-0003YV-F8; Mon, 29 Aug 2022 12:56:00 +0000
Received: by outflank-mailman (input) for mailman id 394582;
 Mon, 29 Aug 2022 12:55:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XWGx=ZB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oSeJ5-0003YP-30
 for xen-devel@lists.xenproject.org; Mon, 29 Aug 2022 12:55:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec421673-2799-11ed-bd2e-47488cf2e6aa;
 Mon, 29 Aug 2022 14:55:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 32E9C22DA3;
 Mon, 29 Aug 2022 12:55:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 06C83133A6;
 Mon, 29 Aug 2022 12:55:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3R6+Olu3DGPRQQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 29 Aug 2022 12:55:55 +0000
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
X-Inumbo-ID: ec421673-2799-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1661777756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CX/MpjZVX8x9Qx8o1VlEsGHIaJLNGk93560RKcTD6tA=;
	b=PtLyNNrsL1JLQLSaiTf552oIEAZRF5NRX7lWJQwcBufNqre4g02Kp8Xpmrgmt+ZzipE7cy
	XGUruH+KQqb6maZxWy6fb05LKXb9vj6m3cCX35yNMq5R6ZjV69eZGsABIUL1P6o+TOW/NN
	KwIUIymGQa0jD7548Tc4vLTAO/ZAHU8=
Message-ID: <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com>
Date: Mon, 29 Aug 2022 14:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
 <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com> <Ywr6CfxUZs4zRPYR@itl-email>
From: Juergen Gross <jgross@suse.com>
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
In-Reply-To: <Ywr6CfxUZs4zRPYR@itl-email>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SsILnY7Mkg7XKHZcIp3cpirI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SsILnY7Mkg7XKHZcIp3cpirI
Content-Type: multipart/mixed; boundary="------------pP8TbMCGs9DVyv3OhuXlm0EV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Message-ID: <82458b1a-d6f6-5fa1-8a38-e9869826308f@suse.com>
Subject: =?UTF-8?Q?Re=3a_=e2=80=9cBackend_has_not_unmapped_grant=e2=80=9d_er?=
 =?UTF-8?Q?rors?=
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com> <YwVuwXOGoZX3pM7n@mail-itl>
 <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com> <Ywr6CfxUZs4zRPYR@itl-email>
In-Reply-To: <Ywr6CfxUZs4zRPYR@itl-email>

--------------pP8TbMCGs9DVyv3OhuXlm0EV
Content-Type: multipart/mixed; boundary="------------kk0KOeF2CHkWK8hisZ0JVDPx"

--------------kk0KOeF2CHkWK8hisZ0JVDPx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjguMDguMjIgMDc6MTUsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gT24gV2Vk
LCBBdWcgMjQsIDIwMjIgYXQgMDg6MTE6NTZBTSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90
ZToNCj4+IE9uIDI0LjA4LjIyIDAyOjIwLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
d3JvdGU6DQo+Pj4gT24gVHVlLCBBdWcgMjMsIDIwMjIgYXQgMDk6NDg6NTdBTSArMDIwMCwg
SnVlcmdlbiBHcm9zcyB3cm90ZToNCj4+Pj4gT24gMjMuMDguMjIgMDk6NDAsIERlbWkgTWFy
aWUgT2Jlbm91ciB3cm90ZToNCj4+Pj4+IEkgcmVjZW50bHkgaGFkIGEgVk3igJlzIC9kZXYv
eHZkYiBzdG9wIHdvcmtpbmcgd2l0aCBhIOKAnGJhY2tlbmQgaGFzIG5vdA0KPj4+Pj4gdW5t
YXBwZWQgZ3JhbnTigJ0gZXJyb3IuICBTaW5jZSAvZGV2L3h2ZGIgd2FzIHRoZSBWTeKAmXMg
cHJpdmF0ZSB2b2x1bWUsDQo+Pj4+PiB0aGF0IHJlbmRlcmVkIHRoZSBWTSBlZmZlY3RpdmVs
eSB1c2VsZXNzLiAgSSBoYWQgdG8ga2lsbCBpdCB3aXRoDQo+Pj4+PiBxdm0ta2lsbC4NCj4+
Pj4+DQo+Pj4+PiBUaGUgYmFja2VuZCBvZiAvZGV2L3h2ZGIgaXMgZG9tMCwgc28gYSBtYWxp
Y2lvdXMgYmFja2VuZCBpcyBjbGVhcmx5IG5vdA0KPj4+Pj4gdGhlIGNhdXNlIG9mIHRoaXMu
ICBJIGJlbGlldmUgdGhlIGFjdHVhbCBjYXVzZSBpcyBhIHJhY2UgY29uZGl0aW9uLCBzdWNo
DQo+Pj4+PiBhcyB0aGUgZm9sbG93aW5nOg0KPj4+Pj4NCj4+Pj4+IDEuIEdVSSBhZ2VudCBp
biBWTSBhbGxvY2F0ZXMgZ3JhbnQgWC4NCj4+Pj4+IDIuIEdVSSBhZ2VudCB0ZWxscyBHVUkg
ZGFlbW9uIGluIGRvbTAgdG8gbWFwIFguDQo+Pj4+PiAzLiBHVUkgYWdlbnQgZnJlZXMgZ3Jh
bnQgWC4NCj4+Pj4+IDQuIGJsa2Zyb250IGFsbG9jYXRlcyBncmFudCBYIGFuZCBwYXNzZXMg
aXQgdG8gZG9tMC4NCj4+Pj4+IDUuIGRvbTDigJlzIGJsa2JhY2sgbWFwcyBncmFudCBYLg0K
Pj4+Pj4gNi4gYmxrYmFjayB1bm1hcHMgZ3JhbnQgWC4NCj4+Pj4+IDcuIEdVSSBkYWVtb24g
bWFwcyBncmFudCBYLg0KPj4+Pj4gOC4gYmxrZnJvbnQgdHJpZXMgdG8gcmV2b2tlIGFjY2Vz
cyB0byBncmFudCBYIGFuZCBmYWlscy4gIERpc2FzdGVyDQo+Pj4+PiAgICAgICBlbnN1ZXMu
DQo+Pj4+Pg0KPj4+Pj4gV2hhdCBjb3VsZCBiZSBkb25lIHRvIHByZXZlbnQgdGhpcyByYWNl
PyAgUmlnaHQgbm93IGFsbCBvZiB0aGUNCj4+Pj4+IGFwcHJvYWNoZXMgSSBjYW4gdGhpbmsg
b2YgYXJlIGhvcnJpYmx5IGJhY2t3YXJkcy1pbmNvbXBhdGlibGUuICBUaGV5DQo+Pj4+PiBy
ZXF1aXJlIHJlcGxhY2luZyBncmFudCBJRHMgd2l0aCBzb21lIHNvcnQgb2YgaGFuZGxlLCBh
bmQgcmVxdWlyaW5nDQo+Pj4+PiB1c2Vyc3BhY2UgdG8gcGFzcyB0aGVzZSBoYW5kbGVzIHRv
IGlvY3Rscy4gIEl0IGlzIGFsc28gcG9zc2libGUgdGhhdA0KPj4+Pj4gbmV0ZnJvbnQgYW5k
IGJsa2Zyb250IGNvdWxkIHJhY2UgYWdhaW5zdCBlYWNoIG90aGVyIGluIGEgd2F5IHRoYXQg
Y2F1c2VzDQo+Pj4+PiB0aGlzLCB0aG91Z2ggSSBzdXNwZWN0IHRoYXQgcmFjZSB3b3VsZCBi
ZSBtdWNoIGhhcmRlciB0byB0cmlnZ2VyLg0KPj4+Pj4NCj4+Pj4+IFRoaXMgaGFzIGhhcHBl
bmVkIG1vcmUgdGhhbiBvbmNlIHNvIGl0IGlzIG5vdCBhIGZsdWtlIGR1ZSB0byBlLmcuIGNv
c21pYw0KPj4+Pj4gcmF5cyBvciBvdGhlciByYW5kb20gYml0LWZsaXBzLg0KPj4+Pj4NCj4+
Pj4+IE1hcmVrLCBkbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnM/DQo+Pj4+DQo+Pj4+IFRv
IG1lIHRoYXQgc291bmRzIGxpa2UgdGhlIGludGVyZmFjZSBvZiB0aGUgR1VJIGlzIHRoZSBj
dWxwcml0Lg0KPj4+Pg0KPj4+PiBUaGUgR1VJIGFnZW50IGluIHRoZSBndWVzdCBzaG91bGQg
b25seSBmcmVlIGEgZ3JhbnQsIGlmIGl0IGdvdCBhIG1lc3NhZ2UNCj4+Pj4gZnJvbSB0aGUg
YmFja2VuZCB0aGF0IGl0IGNhbiBkbyBzby4gSnVzdCBhc3N1bWluZyB0byBiZSBhYmxlIHRv
IGZyZWUgaXQNCj4+Pj4gYmVjYXVzZSBpdCBpc24ndCBpbiB1c2UgY3VycmVudGx5IGlzIHRo
ZSBicm9rZW4gYXNzdW1wdGlvbiBoZXJlLg0KPj4+DQo+Pj4gRldJVywgSSBoaXQgdGhpcyBp
c3N1ZSB0d2ljZSBhbHJlYWR5IGluIHRoaXMgd2VlayBDSSBydW4sIHdoaWxlIGl0IG5ldmVy
DQo+Pj4gaGFwcGVuZWQgYmVmb3JlLiBUaGUgZGlmZmVyZW5jZSBjb21wYXJlZCB0byBwcmV2
aW91cyBydW4gaXMgTGludXgNCj4+PiA1LjE1LjU3IHZzIDUuMTUuNjEuIFRoZSBsYXR0ZXIg
cmVwb3J0cyBwZXJzaXN0ZW50IGdyYW50cyBkaXNhYmxlZC4NCj4+DQo+PiBJIHRoaW5rIHRo
aXMgYWRkaXRpb25hbCBidWcgaXMganVzdCB0cmlnZ2VyaW5nIHRoZSByYWNlIGluIHRoZSBH
VUkNCj4+IGludGVyZmFjZSBtb3JlIGVhc2lseSwgYXMgYmxrZnJvbnQgd2lsbCBhbGxvY2F0
ZSBuZXcgZ3JhbnRzIHdpdGggYQ0KPj4gbXVjaCBoaWdoZXIgZnJlcXVlbmN5Lg0KPj4NCj4+
IFNvIGZpeGluZyB0aGUgcGVyc2lzdGVudCBncmFudCBpc3N1ZSB3aWxsIGp1c3QgcGFwZXIg
b3ZlciB0aGUgcmVhbA0KPj4gaXNzdWUuDQo+IA0KPiBJbmRlZWQgc28sIGJ1dCBtYWtpbmcg
dGhlIGJ1ZyBoYXBwZW4gbXVjaCBsZXNzIGZyZXF1ZW50bHkgaXMgc3RpbGwgYQ0KPiBzaWdu
aWZpY2FudCB3aW4gZm9yIHVzZXJzLg0KDQpQcm9iYWJseSwgeWVzLg0KDQo+IEluIHRoZSBs
b25nIHRlcm0sIHRoZXJlIGlzIG9uZSBzaXR1YXRpb24gSSBkbyBub3QgaGF2ZSBhIGdvb2Qg
c29sdXRpb24NCj4gZm9yOiByZWNvdmVyeSBmcm9tIEdVSSBhZ2VudCBjcmFzaGVzLiAgSWYg
dGhlIEdVSSBhZ2VudCBjcmFzaGVzLCB0aGUNCj4ga2VybmVsIGl0IGlzIHJ1bm5pbmcgdW5k
ZXIgaGFzIHR3byBiYWQgY2hvaWNlcy4gIEVpdGhlciB0aGUga2VybmVsIGNhbg0KPiByZWNs
YWltIHRoZSBncmFudHMsIHJpc2tpbmcgdGhlbSBiZWluZyBtYXBwZWQgYXQgYSBsYXRlciB0
aW1lIGJ5IHRoZSBHVUkNCj4gZGFlbW9uLCBvciBpdCBjYW4gbGVhayB0aGVtLCB3aGljaCBp
cyBiYWQgZm9yIG9idmlvdXMgcmVhc29ucy4gIEkNCj4gYmVsaWV2ZSB0aGUgY3VycmVudCBp
bXBsZW1lbnRhdGlvbiBtYWtlcyB0aGUgZm9ybWVyIGNob2ljZS4NCg0KSXQgZG9lcy4NCg0K
SSBkb24ndCBoYXZlIGVub3VnaCBpbmZvcm1hdGlvbiBhYm91dCB0aGUgR1VJIGFyY2hpdGVj
dHVyZSB5b3UgYXJlIHVzaW5nLg0KV2hpY2ggY29tcG9uZW50cyBhcmUgaW52b2x2ZWQgb24g
dGhlIGJhY2tlbmQgc2lkZSwgYW5kIHdoaWNoIG9uIHRoZQ0KZnJvbnRlbmQgc2lkZT8gRXNw
ZWNpYWxseSB0aGUgcmVzcG9uc2liaWxpdGllcyBhbmQgY29tbXVuaWNhdGlvbiByZWdhcmRp
bmcNCmdyYW50cyBpcyBpbXBvcnRhbnQgaGVyZS4NCg0KPiBUbyBmaXggdGhpcyBwcm9ibGVt
LCBJIHJlY29tbWVuZCB0aGUgZm9sbG93aW5nIGNoYW5nZXM6DQo+IA0KPiAxLiBUcmVhdCDi
gJxiYWNrZW5kIGhhcyBub3QgdW5tYXBwZWQgZ3JhbnTigJ0gZXJyb3JzIGFzIG5vbi1mYXRh
bC4gIFRoZSBtb3N0DQo+ICAgICBsaWtlbHkgY2F1c2UgaXMgYnVnZ3kgdXNlcnNwYWNlIHNv
ZnR3YXJlLCBub3QgYW4gYXR0ZW1wdCB0byBleHBsb2l0DQo+ICAgICBYU0EtMzk2LiAgSW5z
dGVhZCBvZiBkaXNhYmxpbmcgdGhlIGRldmljZSwganVzdCBsb2cgYSB3YXJuaW5nIG1lc3Nh
Z2UNCj4gICAgIGFuZCBwdXQgdGhlIGdyYW50IG9uIHRoZSBkZWZlcnJlZCBxdWV1ZS4gIEV2
ZW4gbGVha2luZyB0aGUgZ3JhbnQNCj4gICAgIHdvdWxkIGJlIHByZWZlcmFibGUgdG8gdGhl
IGN1cnJlbnQgYmVoYXZpb3IsIGFzIGRpc2FibGluZyBhIGJsb2NrDQo+ICAgICBkZXZpY2Ug
dHlwaWNhbGx5IGxlYXZlcyB0aGUgVk0gdW51c2FibGUuDQoNClNvcnJ5LCBJIGRvbid0IGFn
cmVlLiBUaGlzIGlzIGEgbWFqb3IgdmlvbGF0aW9uIG9mIHRoZSBub3JtYWwgSS9PDQphcmNo
aXRlY3R1cmUuIFlvdXIgcmVhc29uaW5nIHdpdGggdGhlIGRpc2FibGVkIGJsb2NrIGRldmlj
ZSBkb2Vzbid0IG1ha2UNCm11Y2ggc2Vuc2UgSU1ITywgYXMgdGhlIG1hcHBlZCBncmFudCB3
YXMgZHVlIHRvIGEgYmFkIGludGVyZmFjZSBsZWFkaW5nIHRvDQphbm90aGVyIGNvbXBvbmVu
dCB1c2luZyBhIGdyYW50IGl0IHdhcyBub3QgbWVhbnQgdG8gdXNlLg0KDQpTaHV0dGluZyBk
b3duIHRoZSBibG9jayBkZXZpY2UgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGhlcmUsIGFz
IGRhdGENCmNvcnJ1cHRpb24gbWlnaHQgYmUgaGFwcGVuaW5nLg0KDQo+IDIuIEVuc3VyZSB0
aGF0IHRoZSBzYW1lIGdyYW50IGJlaW5nIG1hcHBlZCB0d2ljZSBpcyBoYW5kbGVkIGNvcnJl
Y3RseS4NCj4gICAgIEF0IGxlYXN0IExpbnV4IGlzIGtub3duIHRvIGhhdmUgYnVncyBpbiB0
aGlzIHJlZ2FyZC4NCg0KSSBhZ3JlZSB0aGF0IHRoaXMgc2hvdWxkIGJlIHJlcGFpcmVkLg0K
DQo+IDMuIFByb3ZpZGUgYSBtZWFucyBmb3IgYSBkb21haW4gdG8gYmUgbm90aWZpZWQgYnkg
WGVuIHdoZW5ldmVyIG9uZSBvZg0KPiAgICAgaXRzIGdyYW50cyBpcyB1bm1hcHBlZC4gIFNl
dHRpbmcgYW4gZXZlbnQgY2hhbm5lbCBhbmQgd3JpdGluZyB0byBhDQo+ICAgICBzaGFyZWQg
cmluZyB3b3VsZCBzdWZmaWNlLiAgVGhpcyB3b3VsZCBhbGxvdyBlbGltaW5hdGluZyB0aGUg
a2x1ZGd5DQo+ICAgICBkZWZlcnJlZCBmcmVlaW5nIG1lY2hhbmlzbS4NCg0KSW50ZXJlc3Rp
bmcgaWRlYS4NCg0KSSBiZWxpZXZlIHN1Y2ggYW4gaW50ZXJmYWNlIHdvdWxkIG5lZWQgdG8g
YmUgYWN0aXZhdGVkIHBlciBncmFudCwgYXMNCm90aGVyd2lzZSBwZXJmb3JtYW5jZSBjb3Vs
ZCBzdWZmZXIgYSBsb3QuIFRoZXJlIGFyZSBzdGlsbCBzb21lIHVudXNlZCBiaXRzDQppbiB0
aGUgZ3JhbnQgZmxhZ3MsIG9uZSBjb3VsZCBiZSB1c2VkIGZvciB0aGF0IHB1cnBvc2UuDQoN
CkknbSBub3Qgc3VyZSBob3cgb2Z0ZW4gdGhpcyB3b3VsZCBiZSB1c2VkLiBJbiBjYXNlIGl0
IGlzIG9ubHkgZm9yIHRoZSByYXJlDQpjYXNlIG9mIHVuZXhwZWN0ZWRseSBsb25nIG1hcHBl
ZCBncmFudCBwYWdlcywgYSBzaW1wbGUgZXZlbnQgbWlnaHQgZG8gdGhlDQpqb2IsIHdpdGgg
dGhlIGV2ZW50IGhhbmRsZXIganVzdCBza2ltbWluZyB0aHJvdWdoIHRoZSBwZW5kaW5nIHVu
bWFwcyB0bw0KZmluZCB0aGUgZ3JhbnRzIGJlaW5nIGF2YWlsYWJsZSBhZ2Fpbi4NCg0KDQpK
dWVyZ2VuDQo=
--------------kk0KOeF2CHkWK8hisZ0JVDPx
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------kk0KOeF2CHkWK8hisZ0JVDPx--

--------------pP8TbMCGs9DVyv3OhuXlm0EV--

--------------SsILnY7Mkg7XKHZcIp3cpirI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMMt1sFAwAAAAAACgkQsN6d1ii/Ey96
jAf5ASfmvr3CctbttRdF/wk4gs+W2yaEFwE8FvFNRa5ocnPJtFHZcRO9oKqSD8PNmu8PClRBkVqI
GeEbretmpj/4QLcv2yEAsr6/bHKg9sxQFwUJlBPaGHXFsG9sZ8dPRmdQh0tQrVK3jV7AhWM5Y4fM
9xu8eRa+8Io6482XJGU0nGNpbK6GnVyyQ7XZzVUR/mpVgSKrOaWpbam5aO1TwsT9wWXmlOWZpkep
QvovR3N5tw9GO6s/qe/VnLHs7gM3V77CW38B3vrDuiNFY4ITj7QNv6yW+Qg3Y5nN26q4JBDFKYNO
8pxO6Eyxfoqa7u/wFGTqbZ9QiQhLvZV+AbgPPRe5hA==
=BK3e
-----END PGP SIGNATURE-----

--------------SsILnY7Mkg7XKHZcIp3cpirI--

