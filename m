Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57985710C4A
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 14:45:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539567.840581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2ALY-0002MN-LZ; Thu, 25 May 2023 12:45:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539567.840581; Thu, 25 May 2023 12:45:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2ALY-0002KE-IC; Thu, 25 May 2023 12:45:36 +0000
Received: by outflank-mailman (input) for mailman id 539567;
 Thu, 25 May 2023 12:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iF6a=BO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q2ALW-0002K6-TM
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 12:45:35 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09448bea-fafa-11ed-8611-37d641c3527e;
 Thu, 25 May 2023 14:45:32 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EA2A6218E7;
 Thu, 25 May 2023 12:45:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C08D1134B2;
 Thu, 25 May 2023 12:45:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UrYVLWtYb2SoOwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 May 2023 12:45:31 +0000
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
X-Inumbo-ID: 09448bea-fafa-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685018731; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8/qb4mvGXaF5ziF701Ys6QNe9gutXJXSdzsKEpVabFg=;
	b=OEYiHpuV+bO+5fAq5M8BGxfdSJAxk7EpApMsCntWwUygGyAx0Au79r8Tc0C7sbzf3E2WHP
	JkqO883TPvxwHzVSLyxk7pUxRffT6LZEJ8iJrch6FuweYjXthMWIG+MrgJnlxJ1tNgYinX
	cM5CtVKoXjmR1Ro0mTmj/UNo49YDq9I=
Message-ID: <3e440134-6ab8-b22d-5081-b3926e4742a2@suse.com>
Date: Thu, 25 May 2023 14:45:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-6-jgross@suse.com>
 <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
 <9745474f-db84-c8f3-3662-95728d4d5bd3@suse.com>
 <91380959-b63d-7d4f-0920-7d87dc0fc19d@xen.org>
 <de77cc78-e07a-934f-e241-15fe851706df@suse.com>
 <2aaf1cf4-baca-0974-ac0c-80328037ce52@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 05/14] tools/xenstore: use accounting buffering for
 node accounting
In-Reply-To: <2aaf1cf4-baca-0974-ac0c-80328037ce52@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jEsxAE4qVjp09cwkZQ0b88sX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jEsxAE4qVjp09cwkZQ0b88sX
Content-Type: multipart/mixed; boundary="------------NALbn84w27EIjcCQSSFKELUC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <3e440134-6ab8-b22d-5081-b3926e4742a2@suse.com>
Subject: Re: [PATCH v5 05/14] tools/xenstore: use accounting buffering for
 node accounting
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-6-jgross@suse.com>
 <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
 <9745474f-db84-c8f3-3662-95728d4d5bd3@suse.com>
 <91380959-b63d-7d4f-0920-7d87dc0fc19d@xen.org>
 <de77cc78-e07a-934f-e241-15fe851706df@suse.com>
 <2aaf1cf4-baca-0974-ac0c-80328037ce52@xen.org>
In-Reply-To: <2aaf1cf4-baca-0974-ac0c-80328037ce52@xen.org>

--------------NALbn84w27EIjcCQSSFKELUC
Content-Type: multipart/mixed; boundary="------------RmjQVFQea5VWowSoqo2mMzxR"

--------------RmjQVFQea5VWowSoqo2mMzxR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDUuMjMgMTQ6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDExLzA1LzIwMjMgMDY6MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAxMC4wNS4yMyAyMzozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+IE9uIDEwLzA1LzIw
MjMgMTM6NTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+IE9uIDA5LjA1LjIzIDIwOjQ2
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+PiBIaSBKdWVyZ2VuLA0KPj4+Pj4NCj4+Pj4+
IE9uIDA4LzA1LzIwMjMgMTI6NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+Pj4gQWRk
IHRoZSBub2RlIGFjY291bnRpbmcgdG8gdGhlIGFjY291bnRpbmcgaW5mb3JtYXRpb24gYnVm
ZmVyaW5nIGluDQo+Pj4+Pj4gb3JkZXIgdG8gYXZvaWQgaGF2aW5nIHRvIHVuZG8gaXQgaW4g
Y2FzZSBvZiBmYWlsdXJlLg0KPj4+Pj4+DQo+Pj4+Pj4gVGhpcyByZXF1aXJlcyB0byBjYWxs
IGRvbWFpbl9uYmVudHJ5X2RlYygpIGJlZm9yZSBhbnkgY2hhbmdlcyB0byB0aGUNCj4+Pj4+
PiBkYXRhIGJhc2UsIGFzIGl0IGNhbiByZXR1cm4gYW4gZXJyb3Igbm93Lg0KPj4+Pj4+DQo+
Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0K
Pj4+Pj4+IC0tLQ0KPj4+Pj4+IFY1Og0KPj4+Pj4+IC0gYWRkIGVycm9yIGhhbmRsaW5nIGFm
dGVyIGRvbWFpbl9uYmVudHJ5X2RlYygpIGNhbGxzIChKdWxpZW4gR3JhbGwpDQo+Pj4+Pj4g
LS0tDQo+Pj4+Pj4gwqAgdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuY8KgwqAgfCAy
OSArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+Pj4+IMKgIHRvb2xzL3hlbnN0
b3JlL3hlbnN0b3JlZF9kb21haW4uaCB8wqAgNCArKy0tDQo+Pj4+Pj4gwqAgMiBmaWxlcyBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDI0IGRlbGV0aW9ucygtKQ0KPj4+Pj4+DQo+Pj4+
Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgDQo+Pj4+
Pj4gYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+Pj4+Pj4gaW5kZXggODM5
MmJkZWM5Yi4uMjJkYTQzNGUyYSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29yZS5jDQo+Pj4+Pj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3Rv
cmVkX2NvcmUuYw0KPj4+Pj4+IEBAIC0xNDU0LDcgKzE0NTQsNiBAQCBzdGF0aWMgdm9pZCBk
ZXN0cm95X25vZGVfcm0oc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIA0KPj4+Pj4+IHN0cnVj
dCBub2RlICpub2RlKQ0KPj4+Pj4+IMKgIHN0YXRpYyBpbnQgZGVzdHJveV9ub2RlKHN0cnVj
dCBjb25uZWN0aW9uICpjb25uLCBzdHJ1Y3Qgbm9kZSAqbm9kZSkNCj4+Pj4+PiDCoCB7DQo+
Pj4+Pj4gwqDCoMKgwqDCoCBkZXN0cm95X25vZGVfcm0oY29ubiwgbm9kZSk7DQo+Pj4+Pj4g
LcKgwqDCoCBkb21haW5fbmJlbnRyeV9kZWMoY29ubiwgZ2V0X25vZGVfb3duZXIobm9kZSkp
Ow0KPj4+Pj4+IMKgwqDCoMKgwqAgLyoNCj4+Pj4+PiDCoMKgwqDCoMKgwqAgKiBJdCBpcyBu
b3QgcG9zc2libGUgdG8gZWFzaWx5IHJldmVydCB0aGUgY2hhbmdlcyBpbiBhIHRyYW5zYWN0
aW9uLg0KPj4+Pj4+IEBAIC0xNjQ1LDYgKzE2NDQsOSBAQCBzdGF0aWMgaW50IGRlbG5vZGVf
c3ViKGNvbnN0IHZvaWQgKmN0eCwgc3RydWN0IA0KPj4+Pj4+IGNvbm5lY3Rpb24gKmNvbm4s
DQo+Pj4+Pj4gwqDCoMKgwqDCoCBpZiAocmV0ID4gMCkNCj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIFdBTEtfVFJFRV9TVUNDRVNTX1NUT1A7DQo+Pj4+Pj4gK8KgwqDCoCBp
ZiAoZG9tYWluX25iZW50cnlfZGVjKGNvbm4sIGdldF9ub2RlX293bmVyKG5vZGUpKSkNCj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFdBTEtfVFJFRV9FUlJPUl9TVE9QOw0KPj4+
Pj4NCj4+Pj4+IEkgdGhpbmsgdGhlcmUgaXMgYSBwb3RlbnRpYWwgaXNzdWUgd2l0aCB0aGUg
YnVmZmVyaW5nIGhlcmUuIEluIGNhc2Ugb2YgDQo+Pj4+PiBmYWlsdXJlLCB0aGUgbm9kZSBj
b3VsZCBoYXZlIGJlZW4gcmVtb3ZlZCwgYnV0IHRoZSBxdW90YSB3b3VsZCBub3QgYmUgDQo+
Pj4+PiBwcm9wZXJseSBhY2NvdW50ZWQuDQo+Pj4+DQo+Pj4+IFlvdSBtZWFuIHRoZSBjYXNl
IHdoZXJlIGFub3RoZXIgbm9kZSBoYXMgYmVlbiBkZWxldGVkIGFuZCBkdWUgdG8gYWNjb3Vu
dGluZw0KPj4+PiBidWZmZXJpbmcgdGhlIGNvcnJlY3RlZCBhY2NvdW50aW5nIGRhdGEgd291
bGRuJ3QgYmUgY29tbWl0dGVkPw0KPj4+Pg0KPj4+PiBUaGlzIGlzIG5vIHByb2JsZW0sIGFz
IGFuIGVycm9yIHJldHVybmVkIGJ5IGRlbG5vZGVfc3ViKCkgd2lsbCByZXN1bHQgaW4NCj4+
Pj4gY29ycnVwdCgpIGJlaW5nIGNhbGxlZCwgd2hpY2ggaW4gdHVybiB3aWxsIGNvcnJlY3Qg
dGhlIGFjY291bnRpbmcgZGF0YS4NCj4+Pg0KPj4+IFRvIG1lIGNvcnJ1cHQoKSBpcyBhIGJp
ZyBoYW1tZXIgYW5kIGl0IGZlZWxzIHdyb25nIHRvIGNhbGwgaXQgd2hlbiBJIHRoaW5rIHdl
IA0KPj4+IGhhdmUgZWFzaWVyL2Zhc3RlciB3YXkgdG8gZGVhbCB3aXRoIHRoZSBpc3N1ZS4g
Q291bGQgd2UgaW5zdGVhZCBjYWxsIA0KPj4+IGFjY19jb21taXQoKSBiZWZvcmUgcmV0dXJu
aW5nPw0KPj4NCj4+IFlvdSBhcmUgYXdhcmUgdGhhdCB0aGlzIGlzIGEgdmVyeSBwcm9ibGVt
YXRpYyBzaXR1YXRpb24gd2UgYXJlIGluPw0KPiANCj4gSXQgaXMgbm90IHZlcnkgY2xlYXIg
ZnJvbSB0aGUgY29kZS4gQW5kIHRoYXQncyB3aHkgY29tbWVudHMgYXJlIGFsd2F5cyB1c2Vm
dWwgdG8gDQo+IGNsYXJpZnkgd2h5IGNvcnJ1cHQoKSBpcyB0aGUgcmlnaHQgY2FsbC4NCg0K
SSBhZ3JlZS4gSSdsbCBhZGQgYSBjb21tZW50Lg0KDQo+IA0KPj4NCj4+IFdlIGNvdWxkbid0
IGFsbG9jYXRlIGEgc21hbGwgYW1vdW50IG9mIG1lbW9yeSAoYXJvdW5kIDY0IGJ5dGVzKSEg
DQo+IA0KPiBTbyBsb25nIHRoaXMgaXMgdGhlIG9ubHkgcmVhc29uIHRoZW4uLi4NCj4gDQo+
IFhlbnN0b3JlZA0KPj4gd2lsbCBwcm9iYWJseSBkaWUgd2l0aGluIG1pbGxpc2Vjb25kcy4g
VXNpbmcgdGhlIGJpZyBoYW1tZXIgaW4gc3VjaCBhDQo+PiBzaXR1YXRpb24gaXMgZmluZSBJ
TU8uIEl0IHdpbGwgbWF5YmUgcmVzdWx0IGluIHNvbHZpbmcgdGhlIHByb2JsZW0gYnkNCj4+
IGZyZWVpbmcgb2YgbWVtb3J5IChxdWl0ZSB1bmxpa2VseSwgdGhvdWdoKSwgYnV0IGl0IHdv
bid0IGxlYXZlIHhlbnN0b3JlZA0KPj4gaW4gYSB3b3JzZSBzdGF0ZSB0aGFuIHdpdGggeW91
ciBzdWdnZXN0aW9uLg0KPiANCj4gLi4uIHRoaXMgbWlnaHQgYmUgT0suIEJ1dCBpbiB0aGUg
cGFzdCwgd2UgaGFkIGEgcGxhY2Ugd2hlcmUgY29ycnVwdCgpIGNvdWxkIGJlIA0KPiByZWxp
YWJseSB0cmlnZ2VyZWQgYnkgYSBndWVzdC4gSWYgeW91IHRoaW5rIHRoYXQncyBub3QgcG9z
c2libGUsIHRoZW4gaXQgc2hvdWxkIA0KPiBiZSBwcm9wZXJseSBkb2N1bWVudGVkLg0KDQpP
a2F5LCB3aWxsIGRvIHNvLg0KDQo+IA0KPj4NCj4+IEFuZCBjYWxsaW5nIGFjY19jb21taXQo
KSBoZXJlIHdvdWxkbid0IHJlYWxseSBoZWxwLCBhcyBhY2NvdW50aW5nIGRhdGENCj4+IGNv
dWxkbid0IGJlIHJlY29yZGVkLCBzbyB0aGVyZSBhcmUgbWlzc2luZyB1cGRhdGVzIGFueXdh
eSBkdWUgdG8gdGhlIGZhaWxlZA0KPj4gY2FsbCBvZiBkb21haW5fbmJlbnRyeV9kZWMoKS4N
Cj4gDQo+IFdlIGFyZSByZW1vdmluZyB0aGUgbm9kZSBhZnRlciB0aGUgYWNjb3VudGluZyBp
cyB1cGRhdGVkLiBTbyBpZiB0aGUgYWNjb3VudGluZyANCj4gZmFpbCwgdGhlbiBpdCBzaG91
bGQgc3RpbGwgYmUgY29ycmVjdCBmb3IgYW55dGhpbmcgdGhhdCB3YXMgcmVtb3ZlZCBiZWZv
cmUuDQoNCk9oLCByaWdodC4NCg0KPiANCj4+DQo+Pj4+PiBBbHNvLCBJIHRoaW5rIGEgY29t
bWVudCB3b3VsZCBiZSB3YXJyYW50IHRvIGV4cGxhaW4gd2h5IHdlIGFyZSByZXR1cm5pbmcg
DQo+Pj4+PiBXQUxLX1RSRUVfRVJST1JfU1RPUCBoZXJlIHdoZW4uLi4NCj4+Pj4+DQo+Pj4+
Pj4gKw0KPj4+Pj4+IMKgwqDCoMKgwqAgLyogSW4gY2FzZSBvZiBlcnJvciBzdG9wIHRoZSB3
YWxrLiAqLw0KPj4+Pj4+IMKgwqDCoMKgwqAgaWYgKCFyZXQgJiYgZG9fdGRiX2RlbGV0ZShj
b25uLCAma2V5LCAmbm9kZS0+YWNjKSkNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIFdBTEtfVFJFRV9TVUNDRVNTX1NUT1A7DQo+Pj4+Pg0KPj4+Pj4gLi4uIHRoaXMgaXMg
bm90IHRoZSBjYXNlIHdoZW4gZG9fdGRiX2RlbGV0ZSgpIGZhaWxzIGZvciBzb21lIHJlYXNv
bnMuDQo+Pj4+DQo+Pj4+IFRoZSBtYWluIGlkZWEgd2FzIHRoYXQgdGhlIHJlbW92ZSBpcyB3
b3JraW5nIGZyb20gdGhlIGxlYWZzIHRvd2FyZHMgdGhlIHJvb3QuDQo+Pj4+IEluIGNhc2Ug
b25lIGVudHJ5IGNhbid0IGJlIHJlbW92ZWQsIHdlIHNob3VsZCBqdXN0IHN0b3AuDQo+Pj4+
DQo+Pj4+IE9UT0ggcmV0dXJuaW5nIFdBTEtfVFJFRV9FUlJPUl9TVE9QIG1pZ2h0IGJlIGNs
ZWFuZXIsIGFzIHRoaXMgd291bGQgbWFrZSBzdXJlDQo+Pj4+IHRoYXQgYWNjb3VudGluZyBk
YXRhIGlzIHJlcGFpcmVkIGFmdGVyd2FyZHMuIEV2ZW4gaWYgZG9fdGRiX2RlbGV0ZSgpIGNh
bid0DQo+Pj4+IHJlYWxseSBmYWlsIGluIG5vcm1hbCBjb25maWd1cmF0aW9ucywgYXMgdGhl
IG9ubHkgZmFpbHVyZSByZWFzb25zIGFyZToNCj4+Pj4NCj4+Pj4gLSB0aGUgbm9kZSBpc24n
dCBmb3VuZCAocXVpdGUgdW5saWtlbHksIGFzIHdlIGp1c3QgcmVhZCBpdCBiZWZvcmUgZW50
ZXJpbmcNCj4+Pj4gwqDCoCBkZWxub2RlX3N1YigpKSwgb3INCj4+Pj4gLSB3cml0aW5nIHRo
ZSB1cGRhdGVkIGRhdGEgYmFzZSBmYWlsZWQgKGluIG5vcm1hbCBjb25maWd1cmF0aW9ucyBp
dCBpcyBpbg0KPj4+PiDCoMKgIGFscmVhZHkgYWxsb2NhdGVkIG1lbW9yeSwgc28gbm8gd2F5
IHRvIGZhaWwgdGhhdCkNCj4+Pj4NCj4+Pj4gSSB0aGluayBJJ2xsIHN3aXRjaCB0byByZXR1
cm4gV0FMS19UUkVFX0VSUk9SX1NUT1AgaGVyZS4NCj4+Pg0KPj4+IFNlZSBhYm92ZSBmb3Ig
YSBkaWZmZXJlbnQgcHJvcG9zYWwuDQo+Pg0KPj4gV2l0aG91dCBkZWxldGluZyB0aGUgbm9k
ZSBpbiB0aGUgZGF0YSBiYXNlIHRoaXMgd291bGQgYmUgYW5vdGhlciBhY2NvdW50aW5nDQo+
PiBkYXRhIGluY29uc2lzdGVuY3ksIHNvIGNhbGxpbmcgY29ycnVwdCgpIGlzIHRoZSBjb3Jy
ZWN0IGNsZWFudXAgbWVhc3VyZS4NCj4gDQo+IEhtbW0uLi4gSSByZWFkIHRoaXMgYXMgdGhp
cyBpcyBhbHJlYWR5IGEgYnVnIHJhdGhlciB0aGFuIG9uZSBpbnRyb2R1Y2VkIGJ5IHRoaXMg
DQo+IHBhdGNoLiBJSVVDLCB0aGVuIHRoaXMgc2hvdWxkIGJlIGRvbmUgaW4gYSBuZXcgY29t
bWl0Lg0KDQpObywgcHJldmlvdXNseSBkb21haW5fbmJlbnRyeV9kZWMoKSBjb3VsZG4ndCBm
YWlsLCBzbyB0aGlzIGlzIGEgbmV3IHNpdHVhdGlvbi4NCk9yIGRpZCBJIG1pc3VuZGVyc3Rh
bmQgd2hhdCB5b3UgbWVhbj8NCg0KDQpKdWVyZ2VuDQo=
--------------RmjQVFQea5VWowSoqo2mMzxR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------RmjQVFQea5VWowSoqo2mMzxR--

--------------NALbn84w27EIjcCQSSFKELUC--

--------------jEsxAE4qVjp09cwkZQ0b88sX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmRvWGsFAwAAAAAACgkQsN6d1ii/Ey/f
SggAjuPmBmkdosMrZMMR3ga/Ukd94KTPukPs4LAXbOOdZ/fYnGUzpwGr0PhDCQ1JuUwkp8h2bF9/
1+GSgbo9+wQCZjod7M1LAKPWjy3jWA91pG0gdH+kPaGHget5JuPsTRcf7ejfbEYpg1aVE/0Ejccu
ovyJ1UvruDx9m2wQFyEDi/s+/D9F+PpSeDLPQ9pdJs9V6yysu4D7fn0G/fNN4a1lGnnkqME5d+No
tBJwZkBPk51rTtpEy7w6AMkH6JPQZROmRWhzafys92kqBIgk95b/AqsSze0991WFji0zyFijnlR1
6jr9pGqaaYYjkERb9mGbC0ctjeuxPQFeTVX2KmdBmA==
=blbb
-----END PGP SIGNATURE-----

--------------jEsxAE4qVjp09cwkZQ0b88sX--

