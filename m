Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BC558C358
	for <lists+xen-devel@lfdr.de>; Mon,  8 Aug 2022 08:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382259.617161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKwKl-0005G5-LL; Mon, 08 Aug 2022 06:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382259.617161; Mon, 08 Aug 2022 06:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oKwKl-0005DK-I0; Mon, 08 Aug 2022 06:33:51 +0000
Received: by outflank-mailman (input) for mailman id 382259;
 Mon, 08 Aug 2022 06:33:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qbuG=YM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oKwKj-0005DB-2f
 for xen-devel@lists.xenproject.org; Mon, 08 Aug 2022 06:33:49 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0dbcebd8-16e4-11ed-924f-1f966e50362f;
 Mon, 08 Aug 2022 08:33:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1BCD3208EE;
 Mon,  8 Aug 2022 06:33:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C732613AB3;
 Mon,  8 Aug 2022 06:33:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1vt/Lkiu8GILIAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 Aug 2022 06:33:44 +0000
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
X-Inumbo-ID: 0dbcebd8-16e4-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659940425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3Dr/K2CH3ZqLF36bJ0KuS/bY6OuBUo3zMHwlZgoOi/c=;
	b=B6CR1S2U2fYT0A1M5P5uSAII7v7GRlZnPp1yhUS1pNxlECczQCnSV1mEiQGk58APsqWamS
	HAWB1DbmYwGNBhIAW4u8OaYamQ4qj6uXHLHH66N7vOzZ0bhjYz11pzdrvUEk0RsqqQgCuI
	sMWBUSzWY/sqYxyh2pgSFQq+gPVBo/c=
Message-ID: <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
Date: Mon, 8 Aug 2022 08:33:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
 <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
In-Reply-To: <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c6Ewid216pdS0YYIK1YUdhK6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c6Ewid216pdS0YYIK1YUdhK6
Content-Type: multipart/mixed; boundary="------------EJCJ6mr3EwF0Ma5GxoML3Slm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
 <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
In-Reply-To: <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>

--------------EJCJ6mr3EwF0Ma5GxoML3Slm
Content-Type: multipart/mixed; boundary="------------BykrYgHIjA05peejZlzq7f4U"

--------------BykrYgHIjA05peejZlzq7f4U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjIgMjE6MjgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAwMy8wOC8yMDIyIDEyOjU5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gRXh0ZW5kIHRo
ZSBkZWZpbml0aW9uIG9mIHRoZSBYZW5zdG9yZSBtaWdyYXRpb24gc3RyZWFtIHRvIGNvdmVy
IG5ldw0KPj4gZmVhdHVyZXM6DQo+Pg0KPj4gLSBwZXIgZG9tYWluIGZlYXR1cmVzDQo+PiAt
IGV4dGVuZGVkIHdhdGNoZXMgKHdhdGNoIGRlcHRoKQ0KPj4gLSBwZXIgZG9tYWluIHF1b3Rh
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pg0KPj4gLS0tDQo+PiBWMzoNCj4+IC0gbmV3IHBhdGNoDQo+PiAtLS0NCj4+IMKgIGRvY3Mv
ZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQgfCA4NSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA4MiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kb2NzL2Rlc2lnbnMveGVuc3Rv
cmUtbWlncmF0aW9uLm1kIA0KPj4gYi9kb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9u
Lm1kDQo+PiBpbmRleCBlZmE1MjZmNDIwLi5iMmIxZDNkNWM3IDEwMDY0NA0KPj4gLS0tIGEv
ZG9jcy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZA0KPj4gKysrIGIvZG9jcy9kZXNp
Z25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZA0KPj4gQEAgLTQzLDcgKzQzLDEzIEBAIHRoZSBz
ZXR0aW5nIG9mIHRoZSBlbmRpYW5uZXNzIGJpdC4NCj4+IMKgIHwtLS0tLS0tLS0tLXwtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS18DQo+PiDC
oCB8IGBpZGVudGDCoMKgIHwgMHg3ODY1NmU3Mzc0NmY3MjY1ICgneGVuc3RvcmUnIGluIEFT
Q0lJKcKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4g
LXwgYHZlcnNpb25gIHwgMHgwMDAwMDAwMSAodGhlIHZlcnNpb24gb2YgdGhlIHNwZWNpZmlj
YXRpb24pwqDCoMKgwqAgfA0KPj4gK3wgYHZlcnNpb25gIHwgVGhlIHZlcnNpb24gb2YgdGhl
IHNwZWNpZmljYXRpb24sIGRlZmluZWQgdmFsdWVzOiB8DQo+PiArfMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMHgwMDAwMDAwMTogYWxsIGZpZWxkcyB3aXRob3V0IGFueSBleHBsaWNpdGx5
wqDCoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG1lbnRpb25lZCB2ZXJzaW9uIGRlcGVuZGVuY3kgYXJlwqDCoMKgwqDCoCB8
DQo+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dmFsaWQuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDB4MDAwMDAw
MDI6IGFsbCBmaWVsZHMgdmFsaWQgZm9yIHZlcnNpb24gMSBwbHVzwqDCoCB8DQo+PiArfMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmllbGRzIGV4
cGxpY2l0bHkgc3RhdGVkIHRvIGJlwqDCoMKgwqDCoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN1cHBvcnRlZCBpbiB2ZXJz
aW9uIDIgYXJlIHZhbGlkLsKgwqDCoMKgIHwNCj4gDQo+IEkgYW0gYSBiaXQgY29uY2VybmVk
IHdpdGggdGhlIGJ1bXAgb2YgdGhlIHZlcnNpb25zLiBJdCBtZWFucywgaXQgd2lsbCBiZSAN
Cj4gbmVjZXNzYXJ5IGZvciBYZW5zdG9yZWQgdG8ga25vdyB3aGV0aGVyIHRoZSBuZXcgWGVu
c3RvcmVkIHNwZWFrcyB2MSBvciB2Mi4gVGhpcyANCj4gaXMgbGVzcyBhbiBpc3N1ZSB3aGVu
IExpdmUtTWlncmF0aW9uIChhbHRob3VnaCB0aGVyZSBpcyBhIGZsZWV0IG1hbmFnZW1lbnQg
DQo+IHByb2JsZW0pIGJ1dCBpdCB3aWxsIGJlIG9uZSBmb3IgTGl2ZS1VcGRhdGUgaWYgd2Ug
bmVlZCB0byByb2xsYmFjay4NCj4gDQo+IFNvIEkgYW0gd29uZGVyaW5nIGlmIHdlIGNhbiBh
dm9pZCB0byBidW1wIHRoZSB2ZXJzaW9uIGFuZCB1c2Ugb3RoZXIgbWVhbnMgdG8gDQo+IGRl
dGVjdCB0aGUgZGlmZmVyZW5jZS4NCg0KSW4gdGhlIGVuZCB0aGlzIGlzIGV4YWN0bHkgd2hh
dCB0aGUgdmVyc2lvbiB3YXMgbWVhbnQgdG8gYmUgdXNlZCBmb3IuDQoNCkkgdGhpbmsgaXQg
d291bGQgbWFrZSBtdWNoIG1vcmUgc2Vuc2UgdG8gdGhpbmsgYWJvdXQgdGhlIHdheSB0byBo
YW5kbGUgYQ0KYnVtcCBvZiB0aGUgdmVyc2lvbiBpbiBhIGNvbXBhdGlibGUgd2F5Lg0KDQpN
eSBpZGVhIHdhcyB0byBhZGQgYSB4ZW5zdG9yZWQgY29tbWFuZCBsaW5lIHBhcmFtZXRlciBm
b3IgbGltaXRpbmcgdGhlDQptaWdyYXRpb24gc3RyZWFtIHZlcnNpb24gdG8gYmUgdXNlZCB0
byBhIHNwZWNpZmllZCB2ZXJzaW9uLCBjYXVzaW5nIG5ldw0KZmVhdHVyZXMgcHJvYmFibHkg
dG8gbm90IGJlIGF2YWlsYWJsZSwgdGhvdWdoLg0KDQpJIGRvbid0IHNlZSBob3cgZS5nLiBh
IHJvbGxiYWNrIHdvdWxkIGJlIGRvYWJsZSBpbiBjYXNlIGEgZG9tYWluIGFscmVhZHkNCnN0
YXJ0ZWQgdG8gdXNlIGEgbmV3IGZlYXR1cmUgbGlrZSB0aGUgdGhpcmQgcGFyYW1ldGVyIHdo
ZW4gc2V0dGluZyBhIHdhdGNoLg0KRXZlbiBpZiB3ZSdkIGRyb3AgdGhlIGRlcHRoIGluZm9y
bWF0aW9uIHdoZW4gcm9sbGluZyBiYWNrIGEgd2F0Y2ggc2V0DQphZnRlcndhcmRzIHdpdGgg
YW4gYWRkaXRpb25hbCBkZXB0aCBhZGRlZCB3b3VsZCBiZSByZWplY3RlZCBieSB0aGUgb2xk
ZXINCnhlbnN0b3JlZCwgd2hpY2ggd291bGQgYmUgdW5leHBlY3RlZCBmYWlsdXJlIGZvciB0
aGUgZ3Vlc3QuDQoNCkl0IG1pZ2h0IG1ha2Ugc2Vuc2UgdG8gdHJ5IHRvIHVzZSB0aGUgVjEg
c3RyZWFtIHdoZW4gZG9pbmcgYSBsaXZlIHVwZGF0ZSwNCmUuZy4gY292ZXJpbmcgdGhlIGNh
c2Ugd2hlbiB0aGUgU0VUX0ZFQVRVUkUgY29tbWFuZCB3YXMgdXNlZCBmb3IgZWFjaA0KYWN0
aXZlIGd1ZXN0IHRvIGxpbWl0IHRoZSBmZWF0dXJlcyB0byBWMSBjb21wYXRpYmxlIG9uZXMu
IEEgZm9yY2UgcGFyYW1ldGVyDQptaWdodCBiZSB1c2VkIHRvIHVzZSB0aGUgVjEgc3RyZWFt
IGV2ZW4gaWYgZ3Vlc3RzIGFyZSB1c2luZyBWMiBmZWF0dXJlcywNCnJpc2tpbmcgYnJlYWth
Z2Ugb2YgdGhvc2UgZ3Vlc3RzLg0KDQo+IA0KPj4gwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+
IMKgIHwgYGZsYWdzYMKgwqAgfCAwIChMU0IpOiBFbmRpYW5uZXNzOiAwID0gbGl0dGxlLCAx
ID0gYmlnwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+IMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+
PiBAQCAtMTE3LDcgKzEyMywxNyBAQCB4ZW5zdG9yZWQgc3RhdGUgdGhhdCBuZWVkcyB0byBi
ZSByZXN0b3JlZC4NCj4+IMKgIHwgcnctc29ja2V0LWZkwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8DQo+PiDCoCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSsNCj4+IMKgIHwgZXZ0Y2huLWZkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8DQo+PiArKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+PiAr
fCBuLWRvbS1xdW90YcKgwqAgfCBuLWdsb2ItcXVvdGHCoCB8DQo+PiArKy0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+PiArfCBxdW90YS12YWwgMcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiArKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rDQo+PiArLi4uDQo+PiDCoCArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSsNCj4+ICt8IHF1b3RhLXZhbCBOwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwNCj4+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+ICt8
IHF1b3RhLW5hbWVzDQo+PiArLi4uDQo+PiDCoCBgYGANCj4+IEBAIC0xMjgsNiArMTQ0LDIy
IEBAIHhlbnN0b3JlZCBzdGF0ZSB0aGF0IG5lZWRzIHRvIGJlIHJlc3RvcmVkLg0KPj4gwqAg
fMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwNCj4+IMKgIHwgYGV2dGNobi1mZGDCoMKgwqAgfCBUaGUgZmls
ZSBkZXNjcmlwdG9yIHVzZWQgdG8gY29tbXVuaWNhdGUgd2l0aCB8DQo+PiDCoCB8wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgdGhlIGV2ZW50IGNoYW5uZWwgZHJpdmVywqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiArfMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwNCj4+ICt8IGBuLWRvbS1xdW90YWDCoCB8IE51bWJlciBvZiBxdW90YSB2YWx1
ZXMgd2hpY2ggYXBwbHkgcGVywqDCoMKgwqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgZG9tYWluLiBWYWxpZCBvbmx5IGZvciB2ZXJzaW9uIDIgYW5k
IGxhdGVyLsKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPiANCj4gSSB0aGluayB3ZSBj
YW4gYXZvaWQgZXh0ZW5kaW5nIHRoZSBzdHJ1Y3R1cmUgaGVyZSBieSBjcmVhdGluZyBhIHNl
cGFyYXRlIHJlY29yZCANCj4gZm9yIHRoZSBxdW90YS4NCj4gDQo+IFdpdGggdGhhdCwgdGhl
IG5ldyBYZW5zdG9yZWQgZG9uJ3QgbmVlZCBzcGVjaWZpYyBjb2RlIHRvIGRlYWwgd2l0aCBy
b2xsYmFjayANCj4gYmVjYXVzZSwgYXMgQUZBSUNULCB1bmltcGxlbWVudGVkIHJlY29yZHMg
YXJlIGlnbm9yZWQgYnkgZXhpc3RpbmcgWGVuc3RvcmVkLg0KDQpGb3IgcXVvdGEgdGhpcyB3
b3VsZCBiZSBwb3NzaWJsZSByZWdhcmRpbmcgdGhlIGZ1bmN0aW9uYWxpdHksIGJ1dCB0aGVy
ZSBhcmUNCnVzZSBjYXNlcyB3aGljaCBtaWdodCBzdWZmZXIgaW4gY2FzZSBxdW90YSBhcmUg
bm90IGJlaW5nIGFjY2VwdGVkIGJ5IHRoZQ0KbmV3IGluc3RhbmNlIChlLmcuIGRyaXZlciBk
b21haW5zIG5lZWRpbmcgaGlnaGVyIHF1b3RhKS4NCg0KT1RPSCB0aGlzIGlzIG5vIGd1ZXN0
IHZpc2libGUgaW50ZXJmYWNlLCBzbyBJJ20gb24gdGhlIGVkZ2UgdG8gYWRkIHRoaXMNCmRh
dGEgdG8gVjEuIFRoaXMgd291bGQgZXZlbiBiZSBwb3NzaWJsZSB1c2luZyB0aGUgZ2xvYmFs
IHJlY29yZCBvZiBWMSwgYXMNCnRoZSBsZW5ndGggaW5mb3JtYXRpb24gb2YgdGhlIHJlY29y
ZCBhbGxvd3MgdG8gYWRkIG5ldyBmaWVsZHMgd2l0aG91dA0KaGF2aW5nIHRvIGJ1bXAgdGhl
IHZlcnNpb24uDQoNCj4gDQo+PiArfCBgbi1nbG9iLXF1b3RhYCB8IE51bWJlciBvZiBxdW90
YSB2YWx1ZXMgd2hpY2ggYXBwbHkgZ2xvYmFsbHnCoCB8DQo+PiArfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IG9ubHkuIFZhbGlkIG9ubHkgZm9yIHZlcnNpb24gMiBhbmQg
bGF0ZXIuwqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gK3wgYHF1b3RhLXZh
bGDCoMKgwqAgfCBRdW90YSB2YWx1ZXMsIGZpcnN0IHRoZSBvbmVzIGFwcGx5aW5nIHBlcsKg
wqDCoCB8DQo+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGRvbWFpbiwg
dGhlbiB0aGUgb25lcyBhcHBseWluZyBnbG9iYWxseS4gQcKgwqAgfA0KPj4gK3zCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB2YWx1ZSBvZiAwIGhhcyB0aGUgc2VtYW50aWNz
IG9mICJ1bmxpbWl0ZWQiLiB8DQo+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IFZhbGlkIG9ubHkgZm9yIHZlcnNpb24gMiBhbmQgbGF0ZXIuwqDCoMKgwqDCoMKgwqDC
oMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gK3wgYHF1b3RhLW5hbWVzYMKgIHwg
MCBkZWxpbWl0ZWQgc3RyaW5ncyBvZiB0aGUgcXVvdGEgbmFtZXMgaW7CoMKgwqAgfA0KPj4g
K3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB0aGUgc2FtZSBzZXF1ZW5jZSBh
cyB0aGUgYHF1b3RhLXZhbGAgdmFsdWVzLiB8ID4gDQo+PiArfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IFZhbGlkIG9ubHkgZm9yIHZlcnNpb24gMiBhbmQgbGF0ZXIuwqDC
oMKgwqDCoMKgwqDCoMKgIHwNCj4gDQo+ICBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIGJvdGgg
dmVyc2lvbiBvZiBYZW5zdG9yZWQgbmVlZHMgdG8gYWdyZWUgb24gdGhlIHF1b3RhIA0KPiBu
YW1lcy4gU28gaXQgbWVhbnMgdGhlIG5hbWUgaGF2ZSB0byBiZSBkZWZpbmVkIGFzIHBhcnQg
b2YgdGhlIHNwZWMuIEF0IHdoaWNoIA0KPiBwb2ludCwgSSB0aGluayBpdCB3b3VsZCBiZSBi
ZXR0ZXIgdG8gdXNlIElELg0KDQpJIGRvbid0IHRoaW5rIHNvLiBGb3Igb25lIHRoZSBtaW5p
bWFsIHNldCBvZiBxdW90YSBuYW1lcyBoYXMgYmVlbiBkZWZpbmVkDQphbHJlYWR5IGluIHBh
dGNoIDMuIEFuZCBldmVuIHdpdGggdXNpbmcgYW4gSUQgeW91J2QgaGF2ZSB0aGUgc2FtZSBw
cm9ibGVtDQphZ2FpbiwgYnV0IHdpdGhvdXQgaGF2aW5nIHRoZSBwb3NzaWJpbGl0eSB0byBh
ZGQgdmFyaWFudCBzcGVjaWZpYyBxdW90YQ0KKHJlbWVtYmVyIHRoYXQgdGhlcmUgYWxyZWFk
eSBoYXMgYmVlbiBhIHN0YXRlbWVudCB0aGF0IGRvaW5nIGEgbGl2ZSB1cGRhdGUNCmZyb20g
QyB0byBPQ0FNTCBvciB2aWNlIHZlcnNhIHdvdWxkIHByb2JhYmx5IGJyZWFrIHVzZXJzIGR1
ZSB0byBzb21lDQpkZXZpYXRpb25zIGluIGJlaGF2aW9yKS4NCg0KPiBBbHNvLCBjYW4geW91
IGNsYXJpZnkgd2hhdCB3b3VsZCBoYXBwZW4gaWYgdGhlIHN0cmVhbSBjb250YWlucyBhIHF1
b3RhIG5vdCANCj4gc3VwcG9ydGVkIGJ5IHRoZSBuZXcgWGVuc3RvcmVkPw0KDQpZZXMsIEkn
bGwgYWRkIGEgc2VudGVuY2UgdGhhdCB0aG9zZSBzaG91bGQgYmUgaWdub3JlZC4NCg0KPiAN
Cj4+ICsNCj4+IMKgIHhlbnN0b3JlZCB3aWxsIHJlc3VtZSBpbiB0aGUgb3JpZ2luYWwgcHJv
Y2VzcyBjb250ZXh0LiBIZW5jZSBgcnctc29ja2V0LWZkYA0KPj4gwqAgc2ltcGx5IHNwZWNp
ZmllcyB0aGUgZmlsZSBkZXNjcmlwdG9yIG9mIHRoZSBzb2NrZXQuIFNvY2tldHMgYXJlIG5v
dCBhbHdheXMNCj4+IEBAIC0xNDUsNyArMTc3LDcgQEAgdGhlIGRvbWFpbiBiZWluZyBtaWdy
YXRlZC4NCj4+IMKgIGBgYA0KPj4gwqDCoMKgwqDCoCAwwqDCoMKgwqDCoMKgIDHCoMKgwqDC
oMKgwqAgMsKgwqDCoMKgwqDCoCAzwqDCoMKgwqDCoMKgIDTCoMKgwqDCoMKgwqAgNcKgwqDC
oMKgwqDCoCA2wqDCoMKgwqDCoMKgIDfCoMKgwqAgb2N0ZXQNCj4+IMKgICstLS0tLS0tKy0t
LS0tLS0rLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0rLS0tLS0tLSstLS0tLS0tKy0tLS0tLS0r
DQo+PiAtfCBjb25uLWlkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCBjb25uLXR5cGXCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8DQo+PiArfCBjb25uLWlkwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCBjb25uLXR5cGXCoMKgwqDCoCB8IG4tcXVvdGHCoMKgwqDCoMKgwqAgfA0K
Pj4gwqAgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLSsNCj4+IMKgIHwgY29ubi1zcGVjDQo+PiDCoCAuLi4NCj4+IEBA
IC0xNTQsNiArMTg2LDE3IEBAIHRoZSBkb21haW4gYmVpbmcgbWlncmF0ZWQuDQo+PiDCoCAr
LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKw0KPj4gwqAgfCBkYXRhDQo+PiDCoCAuLi4NCj4+ICsrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+ICt8IGZlYXR1cmVzwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLSsNCj4+ICt8IHF1b3RhLXZhbCAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwNCj4+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsN
Cj4+ICsuLi4NCj4+ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+ICt8
IHF1b3RhLXZhbCBOwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+
ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4+ICt8IHF1b3RhLW5hbWVz
DQo+PiArLi4uDQo+PiDCoCBgYGANCj4+IEBAIC0xNjcsNiArMjEwLDEwIEBAIHRoZSBkb21h
aW4gYmVpbmcgbWlncmF0ZWQuDQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMHgwMDAxOiBzb2NrZXTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDB4MDAwMiAtIDB4RkZGRjogcmVzZXJ2ZWQgZm9yIGZ1dHVyZSB1
c2XCoMKgwqDCoCB8DQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gK3wgYG4tcXVvdGFg
wqDCoMKgwqDCoCB8IE51bWJlciBvZiBxdW90YSB2YWx1ZXMuwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgT25seSBmb3IgYGNvbm4tdHlwZWAgMCAoc2hhcmVkIHJpbmcpLsKgwqDC
oMKgwqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgT25s
eSB2YWxpZCBmb3IgdmVyc2lvbiAyIGFuZCBsYXRlci7CoMKgwqDCoMKgwqDCoMKgwqAgfA0K
Pj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiDCoCB8IGBjb25uLXNwZWNgwqDCoMKgIHwgU2Vl
IGJlbG93wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4g
wqAgfCBgaW4tZGF0YS1sZW5gwqAgfCBUaGUgbGVuZ3RoIChpbiBvY3RldHMpIG9mIGFueSBk
YXRhIHJlYWTCoMKgwqDCoMKgIHwNCj4+IEBAIC0xODIsNiArMjI5LDIyIEBAIHRoZSBkb21h
aW4gYmVpbmcgbWlncmF0ZWQuDQo+PiDCoCB8IGBkYXRhYMKgwqDCoMKgwqDCoMKgwqAgfCBQ
ZW5kaW5nIGRhdGE6IGZpcnN0IGluLWRhdGEtbGVuIG9jdGV0cyBvZsKgwqDCoCB8DQo+PiDC
oCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgcmVhZCBkYXRhLCB0aGVuIG91
dC1kYXRhLWxlbiBvY3RldHMgb2bCoMKgwqDCoMKgwqAgfA0KPj4gwqAgfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IHdyaXR0ZW4gZGF0YSAoYW55IG9mIGJvdGggbWF5IGJl
IGVtcHR5KcKgwqDCoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+PiArfCBgZmVh
dHVyZXNgwqDCoMKgwqAgfCBWYWx1ZSBvZiB0aGUgZmVhdHVyZSBmaWVsZCB2aXNpYmxlIGJ5
IHRoZcKgwqDCoCB8DQo+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGd1
ZXN0IGF0IG9mZnNldCAyMDY0IG9mIHRoZSByaW5nIHBhZ2UuwqDCoMKgwqDCoMKgIHwNCj4+
ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgQWxpZ25lZCB0byB0aGUgbmV4
dCA0IG9jdGV0IGJvdW5kYXJ5LsKgwqDCoMKgwqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgT25seSBmb3IgYGNvbm4tdHlwZWAgMCAoc2hhcmVkIHJp
bmcpLsKgwqDCoMKgwqDCoMKgIHwNCj4gDQo+IEZvciB0aGUgcHVycG9zZSBvZiB0aGUgc3Ry
ZWFtLCBJIHdvdWxkIGNvbnNpZGVyIHRvIG1ha2UgaXQgYXZhaWxhYmxlIGZvciB0aGUgDQo+
IHNvY2tldCBjb25uZWN0aW9uLiBUaGlzIGNvdWxkIHBvdGVudGlhbGx5IGJlIHVzZWQgaW4g
dGhlIGZ1dHVyZSB0byBhbGxvdyBlYWNoIA0KPiBhcHBsaWNhdGlvbiB0byBoYXZlIGEgZGlm
ZmVyZW50IGJlaGF2aW9yIHdoZW4gc29ja2V0IGlzIHVzZWQuDQoNClRoaXMgd291bGQgYnJl
YWsgdGhlIHVzZSBvZiB4ZW5zdG9yZS1zdHViZG9tIGZvciBzdWNoIGEgc2V0dXAuDQoNCj4g
SSBjYW4ndCBtYWtlIG15IG1pbmQgeWV0IGlmIHdlIGNhbiBhdm9pZCBidW1waW5nIHRoZSB2
ZXJzaW9uIGZvciB0aGlzIGZpZWxkLiANCj4gV2hhdCB3b3VsZCBoYXBwZW4gaWYgd2UgbmVl
ZCB0byByb2xsYmFjaz8NCg0KSSB0aGluayBhbiBhY3RpdmUgdXNhZ2Ugb2YgdGhlIG5ldyBm
ZWF0dXJlcyBhbmQgYSByb2xsYmFjayBhcmUgbXV0dWFsbHkNCmV4Y2x1c2l2ZS4gU2VlIGFi
b3ZlLg0KDQo+IA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCBPbmx5
IHZhbGlkIGZvciB2ZXJzaW9uIDIgYW5kIGxhdGVyLsKgwqDCoMKgwqDCoMKgwqDCoCB8ID4g
DQo+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+ICt8IGBxdW90YS12YWxgwqDCoMKgIHwgUXVv
dGEgdmFsdWVzLCBhIHZhbHVlIG9mIDAgaGFzIHRoZSBzZW1hbnRpY3MgfA0KPj4gK3zCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAidW5saW1pdGVkIi7CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwN
Cj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgT25seSBmb3IgYGNvbm4t
dHlwZWAgMCAoc2hhcmVkIHJpbmcpLsKgwqDCoMKgwqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgT25seSB2YWxpZCBmb3IgdmVyc2lvbiAyIGFuZCBs
YXRlci7CoMKgwqDCoMKgwqDCoMKgwqAgfA0KPiANCj4gSSB3b3VsZCBzdWdnZXN0IHRvIGJl
IHZlcnkgb2J2aW91cyBhbmQgc2F5IHRoZSB2YWx1ZSB3aWxsIG92ZXJyaWRlIHRoZSB2YWx1
ZSAoaWYgDQo+IGFueSkNCg0KT2theS4NCg0KPiANCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0K
Pj4gK3wgYHF1b3RhLW5hbWVzYMKgIHwgMCBkZWxpbWl0ZWQgc3RyaW5ncyBvZiB0aGUgcXVv
dGEgbmFtZXMgaW7CoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCB0aGUgc2FtZSBzZXF1ZW5jZSBhcyB0aGUgYHF1b3RhLXZhbGAgdmFsdWVzLiB8DQo+
PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IE9ubHkgZm9yIGBjb25uLXR5
cGVgIDAgKHNoYXJlZCByaW5nKS7CoMKgwqDCoMKgwqDCoCB8DQo+PiArfMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8IE9ubHkgdmFsaWQgZm9yIHZlcnNpb24gMiBhbmQgbGF0
ZXIuwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4gDQo+IEFzIGZvciB0aGUgImdsb2JhbCIgcXVv
dGFzLCBJIHdvdWxkIG1vdmUgdGhlIHF1b3RhcyBpbiBhIHNlcGFyYXRlIHJlY29yZC4gSW4g
DQo+IHRoaXMgY2FzZSwgdGhpcyB3b3VsZCBhbHNvIGJlIHVzZWZ1bCB0byBhdm9pZCBoYXZp
bmcgbWF5IGR5bmFtaWMgbGVuZ3RoIGZpZWxkIA0KPiB3aXRoaW4gdGhlIHNhbWUgcmVjb3Jk
Lg0KDQpJIGxpa2UgaGF2aW5nIHRoZSBkYXRhIHRvZ2V0aGVyIG1vcmUuDQoNCkJ1dCBJJ20g
bm90IHJlYWxseSBmZWVsaW5nIHN0cm9uZyBhYm91dCB0aGF0Lg0KDQo+IA0KPj4gwqAgSW4g
Y2FzZSBvZiBsaXZlIHVwZGF0ZSB0aGUgY29ubmVjdGlvbiByZWNvcmQgZm9yIHRoZSBjb25u
ZWN0aW9uIHZpYSB3aGljaA0KPj4gwqAgdGhlIGxpdmUgdXBkYXRlIGNvbW1hbmQgd2FzIGlz
c3VlZCB3aWxsIGNvbnRhaW4gdGhlIHJlc3BvbnNlIGZvciB0aGUgbGl2ZQ0KPj4gQEAgLTI0
Nyw3ICszMTAsNyBAQCBieSBhIGNvbm5lY3Rpb24gZm9yIHdoaWNoIHRoZXJlIGlzIGBDT05O
RUNUSU9OX0RBVEFgIA0KPj4gcmVjb3JkIHByZXZpb3VzbHkgcHJlc2VudC4NCj4+IMKgIGBg
YA0KPj4gwqDCoMKgwqDCoCAwwqDCoMKgwqDCoMKgIDHCoMKgwqDCoMKgwqAgMsKgwqDCoMKg
wqDCoCAzwqDCoMKgIG9jdGV0DQo+PiAtKy0tLS0tLS0rLS0tLS0tLSstLS0tLS0tKy0tLS0t
LS0rDQo+PiArKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+PiDCoCB8IGNv
bm4taWTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8DQo+
PiDCoCArLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLSsNCj4+IMKgIHwgd3BhdGgt
bGVuwqDCoMKgwqAgfCB0b2tlbi1sZW7CoMKgwqDCoCB8DQo+PiBAQCAtMjU2LDYgKzMxOSw5
IEBAIGJ5IGEgY29ubmVjdGlvbiBmb3Igd2hpY2ggdGhlcmUgaXMgYENPTk5FQ1RJT05fREFU
QWAgDQo+PiByZWNvcmQgcHJldmlvdXNseSBwcmVzZW50Lg0KPj4gwqAgLi4uDQo+PiDCoCB8
IHRva2VuDQo+PiDCoCAuLi4NCj4+ICsrLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0t
LSsNCj4+ICt8IGRlcHRowqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8DQo+PiArKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0rDQo+PiDC
oCBgYGANCj4+IEBAIC0yNzUsNiArMzQxLDEzIEBAIGJ5IGEgY29ubmVjdGlvbiBmb3Igd2hp
Y2ggdGhlcmUgaXMgYENPTk5FQ1RJT05fREFUQWAgDQo+PiByZWNvcmQgcHJldmlvdXNseSBw
cmVzZW50Lg0KPj4gwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwNCj4+IMKgIHwgYHRva2VuYMKgwqDC
oMKgIHwgVGhlIHdhdGNoIGlkZW50aWZpZXIgdG9rZW4sIGFzIHNwZWNpZmllZCBpbiB0aGUg
fA0KPj4gwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IGBXQVRDSGAgb3BlcmF0aW9u
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPj4gK3wgYGRlcHRoYMKgwqDCoMKg
IHwgVGhlIG51bWJlciBvZiBkaXJlY3RvcnkgbGV2ZWxzIGJlbG93IHRoZcKgwqDCoMKgwqDC
oMKgIHwNCj4+ICt8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgd2F0Y2hlZCBwYXRoIHRv
IGNvbnNpZGVyIGZvciBhIG1hdGNoLiBUaGlzwqDCoMKgwqDCoCB8DQo+PiArfMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8IGZpZWxkIGlzIGFsaWduZWQgdG8gdGhlIG5leHQgNCBvY3Rl
dCBib3VuZGFyeS7CoCB8DQo+PiArfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IEEgdmFs
dWUgb2YgMHhmZmZmIGlzIHVzZWQgZm9yIHVubGltaXRlZCBkZXB0aC7CoCB8DQo+PiArfMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IFRoaXMgZmllbGQgaXMgdmFsaWQgb25seSBmb3Ig
dmVyc2lvbiAyIGFuZMKgwqDCoMKgwqAgfA0KPj4gK3zCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCBoaWdoZXIuwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfA0KPiANCj4gSWYgd2Ug
YXJlIGdvaW5nIHRvIGJ1bXAgdGhlIHN0cmVhbSB2ZXJzaW9uLCB0aGVuIEkgdGhpbmsgd2Ug
c2hvdWxkIG1vdmUgdGhlIA0KPiBmaWVsZCBiZWZvcmUgdG9rZW4vcGF0aC4NCg0KSSB0aG91
Z2h0IGFib3V0IHRoYXQsIGJ1dCBsaWtlZCBpdCBiZXR0ZXIgdG8gYmUgYWJsZSB0byBrZWVw
IGEgY29tbW9uIHN0cnVjdA0KbGF5b3V0IGZvciB0aGUgcmVjb3JkIHdpdGggdGhlIFYyIGZp
ZWxkcyBiZWluZyBhdCB0aGUgZW5kLg0KDQpNYWluIHJlYXNvbiBpcyB0aGUgYWJpbGl0eSB0
byBhdm9pZCBkdXBsaWNhdGlvbiBvZiBjb2RlIGZvciBiZWluZyBhYmxlIHRvDQpoYW5kbGUg
Ym90aCB2ZXJzaW9ucy4NCg0KPiANCj4+IMKgIFxwYWdlYnJlYWsNCj4+IEBAIC00MDYsNiAr
NDc5LDEyIEBAIEEgbm9kZSBwZXJtaXNzaW9uIHNwZWNpZmllciBoYXMgdGhlIGZvbGxvd2lu
ZyBmb3JtYXQ6DQo+PiDCoCBOb3RlIHRoYXQgcGVybTEgZGVmaW5lcyB0aGUgZG9tYWluIG93
bmluZyB0aGUgbm9kZS4gU2VlIFs0XSBmb3IgbW9yZQ0KPj4gwqAgZXhwbGFuYXRpb24gb2Yg
bm9kZSBwZXJtaXNzaW9ucy4NCj4+ICtccGFnZWJyZWFrDQo+PiArDQo+PiArIyMjIERPTUFJ
Tl9EQVRBDQo+PiArDQo+PiArDQo+PiArDQo+IA0KPiBXaGF0IHRoaXMgc2VjdGlvbiBpcyBm
b3I/DQoNCk9oIHRoYXQgaXMgYSBzdGFsZSByZXN1bHQgb2YgYSBwcmV2aW91cyB2YXJpYW50
IGNvbnNpZGVyaW5nIGFuIG93biByZWNvcmQNCnR5cGUgZm9yIHF1b3RhIGFuZCBmZWF0dXJl
IGluZm9ybWF0aW9uLiA6LSkNCg0KDQpKdWVyZ2VuDQo=
--------------BykrYgHIjA05peejZlzq7f4U
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------BykrYgHIjA05peejZlzq7f4U--

--------------EJCJ6mr3EwF0Ma5GxoML3Slm--

--------------c6Ewid216pdS0YYIK1YUdhK6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLwrkgFAwAAAAAACgkQsN6d1ii/Ey+d
7Qf/SgzAKIJNUiH40e8sRTctHutjsX5q6ote8/gwTuIw7bY9gao4dk4vKv/9HB2ZdDaLpcvb+F60
fGKyfyr5hH4LB8nX/fgznh0mJPQogDHVNnievrR2nnifiiCzD0W+XT9IDX1Q3Hg44uAXtGr7A5BW
nYc39QlaSvLbRGS0HjYv7WEI5aqHpjfx8Oe/uybgD21t4SGEk0c7HIhFZiELdhB2i6vKqHXUVexS
QO3D/2GmPFPQP3EZDmNafj7Jqf8S+iNCsAKb/AXSCzbXJ49W5mIzleGcsZW/7GOYbRyc3OrjozTF
SB/zoAMAS8kQbWEZcKf0mOggQ/L6G2+oUgOyoMNtYQ==
=XOqk
-----END PGP SIGNATURE-----

--------------c6Ewid216pdS0YYIK1YUdhK6--

