Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101CA69CD88
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 14:50:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498133.768946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU6Y9-00063w-HL; Mon, 20 Feb 2023 13:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498133.768946; Mon, 20 Feb 2023 13:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU6Y9-00061h-E4; Mon, 20 Feb 2023 13:49:49 +0000
Received: by outflank-mailman (input) for mailman id 498133;
 Mon, 20 Feb 2023 13:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HMXb=6Q=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pU6Y7-00061Z-Tq
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 13:49:47 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eab3720-b125-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 14:49:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D6052032B;
 Mon, 20 Feb 2023 13:49:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5322A139DB;
 Mon, 20 Feb 2023 13:49:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b7zoEnh682PUHQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Feb 2023 13:49:44 +0000
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
X-Inumbo-ID: 6eab3720-b125-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1676900984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3IuN9ge3ye6XDouALoQxVmCLtROBDYgWqlRftjG4Q+U=;
	b=r68moE7l/3l426cC8GMDZ+7mFgSxziLRYDT3RbegvCsCYeyvx9CaJGS5z3ISn0vSULXHVf
	uf+7btatOyeSEB8MGqH7sbYttPVKKSrpva2KwXby6eINDPpY4E96vRKi1TFeTH0wnwMtyU
	MSUrDHCaMaZx57yIdGRI+wCpBRjMIfA=
Message-ID: <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
Date: Mon, 20 Feb 2023 14:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
In-Reply-To: <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qW0mnbweOxsilN0CNqwAc3R0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qW0mnbweOxsilN0CNqwAc3R0
Content-Type: multipart/mixed; boundary="------------Fpnc3FBfLv9gEQ00OJYwEAcN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
In-Reply-To: <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>

--------------Fpnc3FBfLv9gEQ00OJYwEAcN
Content-Type: multipart/mixed; boundary="------------6RU3kLjQq0sIjNdaU38520vH"

--------------6RU3kLjQq0sIjNdaU38520vH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjAuMDIuMjMgMTM6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDIwLzAyLzIwMjMgMTE6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAyMC4wMi4yMyAxMDo0NiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IEhpIEp1ZXJnZW4s
DQo+Pj4NCj4+PiBPbiAyMC8wMS8yMDIzIDEwOjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+PiBUaGUgYWNjb3VudGluZyBmb3IgdGhlIG51bWJlciBvZiBub2RlcyBvZiBhIGRvbWFp
biBpbiBhbiBhY3RpdmUNCj4+Pj4gdHJhbnNhY3Rpb24gaXMgbm90IHdvcmtpbmcgY29ycmVj
dGx5LCBhcyBpdCBhbGxvd3MgdG8gY3JlYXRlIGFyYml0cmFyeQ0KPj4+PiBudW1iZXIgb2Yg
bm9kZXMuIFRoZSB0cmFuc2FjdGlvbiB3aWxsIGZpbmFsbHkgZmFpbCBkdWUgdG8gZXhjZWVk
aW5nDQo+Pj4+IHRoZSBudW1iZXIgb2Ygbm9kZXMgcXVvdGEsIGJ1dCBiZWZvcmUgY2xvc2lu
ZyB0aGUgdHJhbnNhY3Rpb24gYW4NCj4+Pj4gdW5wcml2aWxlZ2VkIGd1ZXN0IGNvdWxkIGNh
dXNlIFhlbnN0b3JlIHRvIHVzZSBhIGxvdCBvZiBtZW1vcnkuDQo+Pj4NCj4+PiBJIGtub3cg
SSBzYWlkIEkgd291bGQgZGVsYXkgbXkgZGVjaXNpb24gb24gdGhpcyBwYXRjaC4gSG93ZXZl
ciwgSSB3YXMgc3RpbGwgDQo+Pj4gZXhwZWN0aW5nIHRoZSBjb21taXQgbWVzc2FnZSB0byBi
ZSB1cGRhdGVkIGJhc2VkIG9uIG91ciBwcmV2aW91cyBkaXNjdXNzaW9uLg0KPj4NCj4+IEFz
IHNhaWQgYmVmb3JlLCBJIHdhcyB3YWl0aW5nIG9uIHRoZSBzZXR0bGVtZW50IG9mIG91ciBk
aXNjdXNzaW9uIGJlZm9yZQ0KPj4gZG9pbmcgdGhlIHVwZGF0ZS4NCj4gDQo+IFRoaXMgaXMg
bm90IGEgdmVyeSBnb29kIHByYWN0aWNlIHRvIHJlc2VuZCBhIHBhdGNoIHdpdGhvdXQgcmVj
b3JkaW5nIHRoZSANCj4gZGlzYWdyZWVtZW50IGJlY2F1c2UgbmV3IHJldmlld2VycyBtYXkg
bm90IGJlIGF3YXJlIG9mIHRoZSBkaXNhZ3JlZW1lbnQgYW5kIHRoaXMgDQo+IGNvdWxkIGVu
ZCB1cCB0byBiZSBjb21taXR0ZWQgYnkgbWlzdGFrZS4uLg0KDQpZb3Ugc2FpZCB5b3Ugd2Fu
dGVkIHRvIGxvb2sgaW50byB0aGlzIHBhdGNoIGluIGRldGFpbCBhZnRlciB0aGUgcHJldmlv
dXMNCnNlcmllcywgc28gSSBtb3ZlIGl0IGludG8gdGhpcyBzZXJpZXMuIFRoZSB3b3JkaW5n
IHVwZGF0ZSB3b3VsZCBzdHJvbmdseQ0KZGVwZW5kIG9uIHRoZSBvdXRjb21lIG9mIHRoZSBk
aXNjdXNzaW9uIElNTywgc28gSSBkaWRuJ3QgZG8gaXQgeWV0Lg0KDQpOb3QgYWRkaW5nIHRo
ZSBwYXRjaCBpbiB0aGlzIHNlcmllcyB3b3VsZCByZXF1aXJlIHNvbWUgYWRkaXRpb25hbCBy
ZWJhc2UNCmVmZm9ydCwgc28gSSBrZXB0IHRoZSBwYXRjaCBhcyBpcy4NCg0KPj4+IEFsc28g
dGhpbmtpbmcgbW9yZSBhYm91dCBpdCwgIlRoZSB0cmFuc2FjdGlvbiB3aWxsIGZpbmFsbHkg
ZmFpbCBkdWUgdG8gDQo+Pj4gZXhjZWVkaW5nIHRoZSBudW1iZXIgb2Ygbm9kZXMgcXVvdGEi
IG1heSBub3QgYmUgdHJ1ZSBmb3IgYSBjb3VwbGUgb2YgcmVhc29uczoNCj4+PiDCoMKgIDEp
IFRoZSB0cmFuc2FjdGlvbiBtYXkgcmVtb3ZlZCBhIG5vZGUgYWZ0ZXJ3YXJkcy4NCj4+DQo+
PiBZZXMsIGFuZD8gSnVzdCBiZWNhdXNlIGl0IGlzIGEgdHJhbnNhY3Rpb24sIHRoaXMgaXMg
c3RpbGwgYSB2aW9sYXRpb24gb2YNCj4+IHRoZSBxdW90YS4gRXZlbiBvdXRzaWRlIGEgdHJh
bnNhY3Rpb24geW91IGNvdWxkIHVzZSB0aGUgc2FtZSByZWFzb25pbmcsDQo+PiBidXQgeW91
IGRvbid0ICh3aGljaCBpcyBjb3JyZWN0LCBvZiBjb3Vyc2UpLg0KPiANCj4gSSBjYW4gdW5k
ZXJzdGFuZCB5b3VyIHBvaW50LiBIb3dldmVyLCB0byBtZSwgdGhlIGdvYWwgb2YgdGhlIHRy
YW5zYWN0aW9uIGlzIHRvIA0KPiBjb21taXQgZXZlcnl0aGluZyBpbiBvbmUgZ28gYXQgdGhl
IGVuZC4gU28gdGhlIHZpb2xhdGlvbnMgaW4gdGhlIG1pZGRsZSBzaG91bGQgDQo+IG5vdCBt
YXR0ZXIuDQoNCk9mIGNvdXJzZSB0aGV5IHNob3VsZC4NCg0KV2Ugd291bGRuJ3QgYWxsb3cg
dG8gd3JpdGUgb3Zlci1zaXplZCBub2RlcywgZXZlbiBpZiB0aGV5IGNvdWxkIGJlIHJld3Jp
dHRlbiBpbg0KdGhlIHNhbWUgdHJhbnNhY3Rpb24gd2l0aCBhIHNtYWxsZXIgc2l6ZS4NCg0K
V2Ugd291bGRuJ3QgYWxsb3cgdG8gY3JlYXRlIG5vZGVzIHdoaWNoIHdvdWxkIHZpb2xhdGUg
b3ZlcmFsbCBtZW1vcnkNCmNvbnN1bXB0aW9uLg0KDQpXZSB3b3VsZG4ndCBhbGxvdyBub2Rl
cyB3aXRoIG1vcmUgcGVybWlzc2lvbiBlbnRyaWVzIHRoYW4gYWxsb3dlZCwgZXZlbiBpZiB0
aGV5DQpjb3VsZCBiZSByZWR1Y2VkIGluIHRoZSBzYW1lIHRyYW5zYWN0aW9uIGFnYWluLg0K
DQpJIGRvbid0IHNlZSB3aHkgdGhlIG51bWJlciBvZiBub2RlcyBzaG91bGRuJ3QgYmUgdGFr
ZW4gaW50byBhY2NvdW50Lg0KDQo+IEZ1cnRoZXJtb3JlLCBJIHdvdWxkIGV4cGVjdCBhIHRy
YW5zYWN0aW9uIHRvIHdvcmsgb24gYSBzbmFwc2hvdCBvZiB0aGUgc3lzdGVtLiANCj4gU28g
aXQgZmVlbHMgcmVhbGx5IHN0cmFuZ2UgdG8gbWUgdGhhdCB3ZSBhcmUgY29uc3RhbnRseSBj
aGVja2luZyB0aGUgcXVvdGEgd2l0aCANCj4gdGhlIHVwZGF0ZWQgdmFsdWVzIHJhdGhlciB0
aGFuIHRoZSBpbml0aWFsIG9uZS4NCg0KWW91IGFyZSBhd2FyZSB0aGF0IHRoZSBjb2RlIHdp
dGhvdXQgdGhpcyBwYXRjaCBpcyBqdXN0IG5lZ2xlY3RpbmcgdGhlIG5vZGVzDQpjcmVhdGVk
IGluIHRoZSB0cmFuc2FjdGlvbj8gSXQganVzdCBpcyB1c2luZyB0aGUgY3VycmVudCBudW1i
ZXIgb2Ygbm9kZXMNCm91dHNpZGUgYW55IHRyYW5zYWN0aW9uIGZvciBxdW90YSBjaGVjay4g
U28gSSBjb3VsZCBlYXNpbHkgY3JlYXRlIGEgc2NlbmFyaW8NCndoZXJlIG15IG5ldyBjb2Rl
IHdpbGwgc3VjY2VlZCwgYnV0IHRoZSBjdXJyZW50IG9uZSBpcyBmYWlsaW5nOg0KDQpBc3N1
bWUgbm9kZSBxdW90YSBpcyAxMDAwLCBhbmQgYXQgc3RhcnQgb2YgdGhlIHRyYW5zYWN0aW9u
IHRoZSBndWVzdCBpcyBvd25pbmcNCjk5OSBub2Rlcy4gSW4gdGhlIHRyYW5zYWN0aW9uIHRo
ZSBndWVzdCBpcyBkZWxldGluZyAxMCBub2RlcywgdGhlbiBkb20wIGlzDQpjcmVhdGluZyA1
IGFkZGl0aW9uYWwgbm9kZXMgb3duZWQgYnkgdGhlIGd1ZXN0LiBUaGUgY2VudHJhbCBub2Rl
IGNvdW50ZXIgaXMgbm93DQoxMDA0IChvdmVyIHF1b3RhKSwgd2hpbGUgdGhlIGluLXRyYW5z
YWN0aW9uIGNvdW50IGlzIDk5NC4gSW4gdGhlIHRyYW5zYWN0aW9uIHRoZQ0KZ3Vlc3QgY2Fu
IG5vdyBoYXBwaWx5IGNyZWF0ZSBhIG5ldyBub2RlICgjOTk1KSB3aXRoIG15IHBhdGNoLCBi
dXQgd2lsbCBmYWlsIHRvDQpkbyBzbyB3aXRob3V0IChpdCBzZWVzIHRoZSAxMDA0IGR1ZSB0
byB0aGUgdHJhbnNhY3Rpb24gY291bnQgYmVpbmcgaWdub3JlZCkuDQoNCj4+IEluIGNhc2Ug
eW91IG5ldmVyIGZpbmlzaCB0aGUgdHJhbnNhY3Rpb24sIHlvdSBhcmUgb3duZXIgb2YgbW9y
ZSB0aGFuDQo+PiBhbGxvd2VkIG5vZGVzLg0KPiBIb3cgc28/IFRoZSBub2RlcyB3b3VsZCBu
b3QgYmUgY29tbWl0dGVkIHNvIHlvdSBkb24ndCByZWFsbHkgb3duIHRoZW0uDQoNCkJ1dCB5
b3UgY2FuIHVzZSB0aGVtIGluc2lkZSB0aGUgdHJhbnNhY3Rpb24uDQoNCj4gV2UgYWxzbyBo
YXZlIHF1b3RhcyB0byBsaW1pdCB0aGUgbnVtYmVyIG9mIG5vZGVzIGFjY2Vzc2VkIGluIGEg
dHJhbnNhY3Rpb24uDQoNClllcywgYnV0IHlvdSBjYW4gdXNlIHRoZSBleGNlc3Mgbm9kZXMg
aW4gdGhlIHRyYW5zYWN0aW9uIHVudGlsIHRoYXQgcXVvdGENCmlzIHJlYWNoZWQuDQoNCj4+
PiDCoMKgIDIpIEEgbm9kZSBtYXkgaGF2ZSBiZWVuIHJlbW92ZWQgb3V0c2lkZSBvZiB0aGUg
dHJhbnNhY3Rpb24uDQo+Pg0KPj4gSWYgdGhlIHJlbW92ZWQgbm9kZSBoYXNuJ3QgYmVlbiB0
b3VjaGVkIGJ5IHRoZSB0cmFuc2FjdGlvbiwgaXQgd2lsbCBiZQ0KPj4gYWNjb3VudGVkIGZv
ciBjb3JyZWN0bHkuDQo+IA0KPiBJdCBkZXBlbmRzIG9uIHdoZW4gdGhlIG5vZGUgd2FzIHJl
bW92ZWQuIElmIGl0IGlzIHJlbW92ZWQgKmFmdGVyKiB0aGUgcXVvdGEgd2FzIA0KPiBoaXQg
dGhlbiB5b3VyIHRyYW5zYWN0aW9uIHdpbGwgZmFpbC4NCg0KWWVzLiBUaGF0IGlzIHdoeSB0
aGUgcXVvdGEgY2hlY2sgYXQgdGhlIGZpbmFsaXphdGlvbiBvZiB0aGUgdHJhbnNhY3Rpb24g
aGFzDQp0byBiZSBrZXB0Lg0KDQo+IA0KPj4gwqBJZiBpdCBoYXMgYmVlbiB0b3VjaGVkLCB0
aGUgdHJhbnNhY3Rpb24gd2lsbA0KPj4gZmFpbCBhbnl3YXkuDQo+IFNvIHRoZSB0cmFuc2Fj
dGlvbiB3aWxsIGZhaWwgdG8gY29tbWl0IGJlY2F1c2UgdGhlcmUgaXMgYSBjb25mbGljdC4g
U28gdGhlIA0KPiBjbGllbnQgaXMgZXhwZWN0ZWQgdG8gcmV0cnkgaXQuIFdlIHNob3VsZCBu
b3QgZXhwZWN0ZWQgdGhlIGNsaWVudCB0byByZXRyeSBmb3IgDQo+IGVycm9yIGxpa2UgcXVv
dGEuDQoNCkNvcnJlY3QuIFRoZSBmYWlsdXJlIEknbSBtZW50aW9uaW5nIGlzbid0IGR1ZSB0
byBxdW90YSwgYnV0IGR1ZSB0byBhIGNvbmZsaWN0Lg0KDQo+IFNvIHRoZSBvdmVyYWxsIGJl
aGF2aW9yIGlzIGNoYW5nZWQuDQoNCldlIGRvIHNvIGZvciBhbnkgYnVnLWZpeC4gQW5kIElN
TyBteSBwYXRjaCBpcyBhIGJ1Zy1maXguDQoNCg0KSnVlcmdlbg0K
--------------6RU3kLjQq0sIjNdaU38520vH
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------6RU3kLjQq0sIjNdaU38520vH--

--------------Fpnc3FBfLv9gEQ00OJYwEAcN--

--------------qW0mnbweOxsilN0CNqwAc3R0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmPzencFAwAAAAAACgkQsN6d1ii/Ey9m
Vgf9EjWvQLh1YtdkuMBAk5lMovM2oABwUboblIuNhwgLPMFdFGZN3MyVnnTQwmQGHzdO/WMNF32N
NXgO1MKdlFT7MGr2N0+ya3eeXaxKzvG7WvJKe1EPWEqBp7IMybT+/8M+7Qtljnb03+qHhawBZggp
5DPcPx5zAHFPx4VwstnBoMvpTNSgLECQyYU9Eb/69H2yd9lnBMjd9TW9r9Fa+YX1mjaoQaABcYWD
YsfcpFFbHSwfXm5XlNSSbpsVUR14kWq8t5pDp8EGiN9GsyAjxy2o0T5zF381fUCY0ipR0lKQNot4
NI0qcF4XAZA7iutYyiBOv/7U2bOX9MHJgLO+llIMjA==
=A5JF
-----END PGP SIGNATURE-----

--------------qW0mnbweOxsilN0CNqwAc3R0--

