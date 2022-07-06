Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A645686BD
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 13:33:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362159.592097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93HM-0001IF-9X; Wed, 06 Jul 2022 11:33:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362159.592097; Wed, 06 Jul 2022 11:33:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o93HM-0001FB-5r; Wed, 06 Jul 2022 11:33:12 +0000
Received: by outflank-mailman (input) for mailman id 362159;
 Wed, 06 Jul 2022 11:33:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AgEa=XL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o93HK-0001F5-P1
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 11:33:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 692cf0dd-fd1f-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 13:33:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DBF652272B;
 Wed,  6 Jul 2022 11:33:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7CBFE13A7D;
 Wed,  6 Jul 2022 11:33:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TK0KHfRyxWKrdQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 06 Jul 2022 11:33:08 +0000
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
X-Inumbo-ID: 692cf0dd-fd1f-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657107188; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HDZTuB45+6jVAoIDGG/LFM3iPuJIyyHb7bWYibnQiV4=;
	b=KTtnwfeOJsxLK1vxnn0QRAy34zTNRIWEqbA4SAP7tb4Sf5R364qOu4khBD5EMUFLVIavh4
	8bNGtyBMXAvMO+/VmAbcQH3rCWwErsQHxmmET2YjfbK6gCboIWB+7VpkgyNJtU52jtRiyn
	l+4UtOAh6L9KUgW9ytXqDjhzrse8k/0=
Message-ID: <b8d33902-0080-fea9-515c-2721e8cfcc23@suse.com>
Date: Wed, 6 Jul 2022 13:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
 <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
 <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
 <DCF75039-2719-4FC4-AA0A-2E5A00018823@arm.com>
 <77952dd3-e777-f4ca-75d0-c168c10d46d0@xen.org>
 <CC88A73E-FD16-4F41-9478-9979FE498725@arm.com>
 <a84b6911-3f15-587d-029b-66f1ed343e99@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
In-Reply-To: <a84b6911-3f15-587d-029b-66f1ed343e99@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VNNkFKPml18H8NQ0OCFmnpj7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VNNkFKPml18H8NQ0OCFmnpj7
Content-Type: multipart/mixed; boundary="------------BCSJQRoR3Lzgqx0pIovebDgH";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Rahul Singh <Rahul.Singh@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Message-ID: <b8d33902-0080-fea9-515c-2721e8cfcc23@suse.com>
Subject: Re: [PATCH 5/8] xen/evtchn: don't close the static event channel.
References: <cover.1655903088.git.rahul.singh@arm.com>
 <91656930b5bfd49e40ff5a9d060d7643e6311f4f.1655903088.git.rahul.singh@arm.com>
 <b64a7980-e51b-417b-4929-94a020c81438@xen.org>
 <7403EAA7-67A4-4A8D-835E-6015463B9016@arm.com>
 <a5cd291d-45b1-baf4-4d0b-907140b38eab@xen.org>
 <DC011AED-F74B-4055-8DEE-6FFC6FC5215C@arm.com>
 <dbdf3bb2-edc6-e622-f17a-8819f6fcb43d@xen.org>
 <67EA3F72-5F6D-4150-A9BA-EAF92E6C9EA1@arm.com>
 <289ebc8b-96f2-8764-5b17-680734e473fe@xen.org>
 <DCF75039-2719-4FC4-AA0A-2E5A00018823@arm.com>
 <77952dd3-e777-f4ca-75d0-c168c10d46d0@xen.org>
 <CC88A73E-FD16-4F41-9478-9979FE498725@arm.com>
 <a84b6911-3f15-587d-029b-66f1ed343e99@xen.org>
In-Reply-To: <a84b6911-3f15-587d-029b-66f1ed343e99@xen.org>

--------------BCSJQRoR3Lzgqx0pIovebDgH
Content-Type: multipart/mixed; boundary="------------vINSUXvVkn15CUSCPgudBR0P"

--------------vINSUXvVkn15CUSCPgudBR0P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDYuMDcuMjIgMTM6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gKCsgSnVlcmdlbiBm
b3IgdGhlIExpbnV4IHF1ZXN0aW9uKQ0KPiANCj4gT24gMDYvMDcvMjAyMiAxMTo0MiwgUmFo
dWwgU2luZ2ggd3JvdGU6DQo+PiBIaSBKdWxpZW4sDQo+Pg0KPj4+IE9uIDUgSnVsIDIwMjIs
IGF0IDI6NTYgcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+
DQo+Pj4NCj4+Pg0KPj4+IE9uIDA1LzA3LzIwMjIgMTQ6MjgsIFJhaHVsIFNpbmdoIHdyb3Rl
Og0KPj4+PiBIaSBKdWxpZW4sDQo+Pj4NCj4+PiBIaSBSYWh1bCwNCj4+Pg0KPj4+Pj4gT24g
MjggSnVuIDIwMjIsIGF0IDQ6MTggcG0sIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+
IHdyb3RlOg0KPj4+Pj4+IGEgbmV3IGRyaXZlciBpbiBsaW51eCBrZXJuZWwsIGV0YyB3aGVy
ZSByaWdodCBub3cgd2UganVzdCBuZWVkIHRvIA0KPj4+Pj4+IGludHJvZHVjZSBhbiBleHRy
YSBJT0NUTCBpbiBsaW51eCB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZS4NCj4+Pj4+DQo+Pj4+
PiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdvdWxkIG5lZWQgYSBuZXcgZHJpdmVyLCBldGMu
IEdpdmVuIHRoYXQgeW91IGFyZSANCj4+Pj4+IGludHJvZHVjaW5nIGEgbmV3IElPQ1RMIHlv
dSBjb3VsZCBwYXNzIGEgZmxhZyB0byBzYXkgIlRoaXMgaXMgYSBzdGF0aWMgDQo+Pj4+PiBl
dmVudCBjaGFubmVsIHNvIGRvbid0IGNsb3NlIGl0Ii4NCj4+Pj4gSSB0cmllZCB0byBpbXBs
ZW1lbnQgb3RoZXIgc29sdXRpb25zIHRvIHRoaXMgaXNzdWUuIFdlIGNhbiBpbnRyb2R1Y2Ug
YSBuZXcgDQo+Pj4+IGV2ZW50IGNoYW5uZWwgc3RhdGUg4oCcRUNTX1NUQVRJQ+KAnSBhbmQg
c2V0IHRoZQ0KPj4+PiBldmVudCBjaGFubmVsIHN0YXRlIHRvIEVDU19TVEFUSUMgd2hlbiBY
ZW4gYWxsb2NhdGUgYW5kIGNyZWF0ZSB0aGUgc3RhdGljIA0KPj4+PiBldmVudCBjaGFubmVs
cy4NCj4+Pg0KPj4+IMKgRnJvbSB3aGF0IHlvdSB3cm90ZSwgRUNTX1NUQVRJQyBpcyBqdXN0
IGFuIGludGVyZG9tYWluIGJlaGluZCBidXQgd2hlcmUgeW91IA0KPj4+IHdhbnQgWGVuIHRv
IHByZXZlbnQgY2xvc2luZyB0aGUgcG9ydC4NCj4+Pg0KPj4+IMKgRnJvbSBYZW4gUG9WLCBp
dCBpcyBzdGlsbCBub3QgY2xlYXIgd2h5IHRoaXMgaXMgYSBwcm9ibGVtIHRvIGxldCBMaW51
eCANCj4+PiBjbG9zaW5nIHN1Y2ggcG9ydC4gRnJvbSB0aGUgZ3Vlc3QgUG9WLCB0aGVyZSBh
cmUgb3RoZXIgd2F5IHRvIHBhc3MgdGhpcyANCj4+PiBpbmZvcm1hdGlvbiAoc2VlIGJlbG93
KS4NCj4+DQo+PiBJZiBMaW51eCBjbG9zZXMgdGhlIHBvcnQsIHRoZSBzdGF0aWMgZXZlbnQg
Y2hhbm5lbCBjcmVhdGVkIGJ5IFhlbiBhc3NvY2lhdGVkIA0KPj4gd2l0aCBzdWNoIHBvcnQg
d2lsbCBub3QgYmUgYXZhaWxhYmxlIHRvIHVzZSBhZnRlcndhcmQuDQo+Pg0KPj4gV2hlbiBJ
IHN0YXJ0ZWQgaW1wbGVtZW50ZWQgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsIHNlcmllcywg
SSB0aG91Z2h0IHRoZSANCj4+IHN0YXRpYyBldmVudCBjaGFubmVsIGhhcyB0byBiZSBhdmFp
bGFibGUgZm9yIHVzZSBkdXJpbmcNCj4+IHRoZSBsaWZldGltZSBvZiB0aGUgZ3Vlc3QuIFRo
aXMgcGF0Y2ggYXZvaWRzIGNsb3NpbmcgdGhlIHBvcnQgaWYgdGhlIExpbnV4IA0KPj4gdXNl
ci1zcGFjZSBhcHBsaWNhdGlvbiB3YW50cyB0byB1c2UgdGhlIGV2ZW50IGNoYW5uZWwgYWdh
aW4uDQo+Pg0KPj4gVGhpcyBwYXRjaCBpcyBmaXhpbmcgdGhlIHByb2JsZW0gZm9yIExpbnV4
IE9TLCBhbmQgSSBhZ3JlZSB3aXRoIHlvdSB0aGF0IHdlIA0KPj4gc2hvdWxkIG5vdCBtb2Rp
ZnkgdGhlIFhlbiB0byBmaXggdGhlIExpbnV4IHByb2JsZW0uDQo+PiBUaGVyZWZvcmUsIElm
IHRoZSBndWVzdCBkZWNpZGVkIHRvIGNsb3NlIHRoZSBzdGF0aWMgZXZlbnQgY2hhbm5lbCwg
WGVuIHdpbGwgDQo+PiBjbG9zZSB0aGUgcG9ydC4gRXZlbnQgQ2hhbmVsIGFzc29jaWF0ZWQg
d2l0aCB0aGUgcG9ydA0KPj4gd2lsbCBub3QgYmUgYXZhaWxhYmxlIGZvciB1c2UgYWZ0ZXIg
dGhhdC5JIHdpbGwgZGlzY2FyZCB0aGlzIHBhdGNoIGluIHRoZSBuZXh0IA0KPj4gc2VyaWVz
Lg0KPj4NCj4+Pg0KPj4+PiDCoEZyb20gZ3Vlc3QgT1Mgd2UgY2FuIGNoZWNrIGlmIHRoZSBl
dmVudCBjaGFubmVsIGlzIHN0YXRpYyAodmlhIA0KPj4+PiBFVlRDSE5PUF9zdGF0dXMoKcKg
IGh5cGVyY2FsbCApLCBpZiB0aGUgZXZlbnQgY2hhbm5lbCBpcw0KPj4+PiBzdGF0aWMgZG9u
4oCZdCB0cnkgdG8gY2xvc2UgdGhlIGV2ZW50IGNoYW5uZWwuIElmIGd1ZXN0IE9TIHRyeSB0
byBjbG9zZSB0aGUgDQo+Pj4+IHN0YXRpYyBldmVudCBjaGFubmVsIFhlbiB3aWxsIHJldHVy
biBlcnJvciBhcyBzdGF0aWMgZXZlbnQgY2hhbm5lbCBjYW7igJl0IGJlIA0KPj4+PiBjbG9z
ZWQuDQo+Pj4gV2h5IGRvIHlvdSBuZWVkIHRoaXM/IFlvdSBhbHJlYWR5IG5lZWQgYSBiaW5k
aW5nIGluZGljYXRpbmcgd2hpY2ggcG9ydHMgd2lsbCANCj4+PiBiZSBwcmUtYWxsb2NhdGVk
LiBTbyB5b3UgY291bGQgdXBkYXRlIHlvdXIgYmluZGluZyB0byBwYXNzIGEgZmxhZyB0ZWxs
aW5nIA0KPj4+IExpbnV4ICJkb24ndCBjbG9zZSBpdCIuDQo+Pj4NCj4+PiBJIGhhdmUgYWxy
ZWFkeSBwcm9wb3NlZCB0aGF0IGJlZm9yZSBhbmQgSSBoYXZlbid0IHNlZW4gYW55IGV4cGxh
bmF0aW9uIHdoeSANCj4+PiB0aGlzIGlzIG5vdCBhIHZpYWJsZSBzb2x1dGlvbi4NCj4+DQo+
PiBTb3JyeSBJIGRpZG7igJl0IG1lbnRpb24gdGhpcyBlYXJsaWVyLCBJIHN0YXJ0ZWQgd2l0
aCB5b3VyIHN1Z2dlc3Rpb24gdG8gZml4IHRoZSANCj4+IGlzc3VlIGJ1dCBhZnRlciBnb2lu
ZyB0aHJvdWdoIHRoZSBMaW51eCBldnRjaG4gZHJpdmVyIGNvZGUNCj4+IGl0IGlzIG5vdCBz
dHJhaWdodCBmb3J3YXJkIHRvIHRlbGwgTGludXggZG9u4oCZdCBjbG9zZSB0aGUgcG9ydC4g
TGV0IG1lIHRyeSB0byANCj4+IGV4cGxhaW4uDQo+Pg0KPj4gSW4gTGludXgsIHN0cnVjdCB1
c2VyX2V2dGNobiB7fSBpcyB0aGUgc3RydWN0IHRoYXQgaG9sZCB0aGUgaW5mb3JtYXRpb24g
Zm9yIA0KPj4gZWFjaCB1c2VyIGV2dGNobiBvcGVuZWQuIFdlIGNhbiBhZGQgb25lIGJvb2wg
cGFyYW1ldGVyIGluIHRoaXMgc3RydWN0IHRvIHRlbGwgDQo+PiBMaW51eCBkcml2ZXINCj4+
IHZpYSBJT0NUTCBpZiBldnRjaG4gaXMgc3RhdGljLiBXaGVuIHVzZXIgYXBwbGljYXRpb24g
Y2xvc2UgdGhlIGZkIA0KPj4gIi9kZXYveGVuL2V2dGNobuKAnSAsIGV2dGNobl9yZWxlYXNl
KCkgd2lsbCB0cmF2ZXJzZSBhbGwgdGhlIGV2dGNobiBhbmQgY2FsbCANCj4+IGV2dGNobl91
bmJpbmRfZnJvbV91c2VyKCkNCj4+IGZvciBlYWNoIGV2dGNobi4gZXZ0Y2huX3VuYmluZF9m
cm9tX3VzZXIoKSB3aWxsIGNhbGzCoCBfX3VuYmluZF9mcm9tX2lycShpcnEpIA0KPj4gdGhh
dCB3aWxsIGNhbGwgeGVuX2V2dGNobl9jbG9zZSgpIC4gV2UgbmVlZCByZWZlcmVuY2VzIHRv
ICJzdHJ1Y3QgdXNlcl9ldnRjaG7igJ0gaW4NCj4+IGZ1bmN0aW9uIF9fdW5iaW5kX2Zyb21f
aXJxKCkgdG8gcGFzcyBhcyBhcmd1bWVudCB0byB4ZW5fZXZ0Y2huX2Nsb3NlKCkgbm90IHRv
IA0KPj4gY2xvc2UgdGhlIHN0YXRpYyBldmVudCBjaGFubmVsLsKgIEkgYW0gbm90IGFibGUg
dG8gZmluZCBhbnkgd2F5IHRvIGdldA0KPj4gc3RydWN0IHVzZXJfZXZ0Y2huIGluIGZ1bmN0
aW9uIF9fdW5iaW5kX2Zyb21faXJxKCkgLCB3aXRob3V0IG1vZGlmeWluZyB0aGUgDQo+PiBv
dGhlciBMaW51eCBzdHJ1Y3R1cmUuDQoNClRoZSAic3RhdGljIiBmbGFnIHNob3VsZCBiZSBh
ZGRlZCB0byBzdHJ1Y3QgaXJxX2luZm8uIEluIGNhc2UgYWxsIHJlbGV2YW50DQpldmVudCBj
aGFubmVscyBhcmUgcmVhbGx5IHVzZXIgb25lcywgd2UgY291bGQgZWFzaWx5IGFkZCBhbm90
aGVyICJzdGF0aWMiDQpmbGFnIHRvIGV2dGNobl9tYWtlX3JlZmNvdW50ZWQoKSwgd2hpY2gg
aXMgYWxyZWFkeSB1c2VkIHRvIHNldCBhIHVzZXINCmV2ZW50IGNoYW5uZWwgc3BlY2lmaWMg
dmFsdWUgaW50byBzdHJ1Y3QgaXJxX2luZm8gd2hlbiBiaW5kaW5nIHRoZSBldmVudA0KY2hh
bm5lbC4NCg0KDQpKdWVyZ2VuDQoNCg0K
--------------vINSUXvVkn15CUSCPgudBR0P
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------vINSUXvVkn15CUSCPgudBR0P--

--------------BCSJQRoR3Lzgqx0pIovebDgH--

--------------VNNkFKPml18H8NQ0OCFmnpj7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLFcvMFAwAAAAAACgkQsN6d1ii/Ey8D
IAf/ah8W4Hq2MWMJWolw+W+xKt63F64RYAkWhLYjRP/YlVSx0f+o/tlLMUdgdBoWIcTb3sqg/F+9
wh0xwTa4qiihTAcApNi9ofGH0vLR1eg8LC7BNpi837ox2LBmoQgLMHRfF01ceDkpF/hDMZZKO1Cg
eHEStS3i9V1RzQYJTEGv0LpCA2/AxiHDT4FNKSZkHZkbsH48gaTeOPx9CYruxrLnPDL370jWMQzb
lnW6BtQnwUldzLcIlHWdbizZjdNZMfVUpduddHDtCa0hyKg2dFe1xtabjoBQTh2lXPjRMsfKPh24
7V+wOYg5daxx/g6zDgZLnoxzUAvi5chiFb84XdeaYg==
=Db6w
-----END PGP SIGNATURE-----

--------------VNNkFKPml18H8NQ0OCFmnpj7--

