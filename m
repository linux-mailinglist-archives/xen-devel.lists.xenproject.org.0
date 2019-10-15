Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B402D7B19
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:21:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPWJ-00026c-5R; Tue, 15 Oct 2019 16:17:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aDy4=YI=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iKPWH-00026V-77
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:17:57 +0000
X-Inumbo-ID: 57287849-ef67-11e9-9396-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 57287849-ef67-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 16:17:55 +0000 (UTC)
From: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2] xen/arm: platform: fix Raspberry Pi
 compatible string
Thread-Index: AQHVek1xYOB4vaPOaUer8mo/2jN186dSu1cA///MTVCACVayAP//0p8Q
Date: Tue, 15 Oct 2019 16:18:08 +0000
Message-ID: <bac0e5860e8d489cb0606732e943209a@dornerworks.com>
References: <20191004004745.26522-1-stewart.hildebrand@dornerworks.com>
 <39153cd6-efe5-1b5d-baba-b567c151a5f3@arm.com>
 <2474d9869a5c46e39ea862a2c78a04c4@dornerworks.com>
 <8c959176-715b-db7d-cf2f-a810791f676f@arm.com>
In-Reply-To: <8c959176-715b-db7d-cf2f-a810791f676f@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.13.254]
MIME-Version: 1.0
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: platform: fix Raspberry Pi
 compatible string
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlc2RheSwgT2N0b2JlciAxNSwgMjAxOSA3OjAyIEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6
DQo+SGksDQoNCkhpIQ0KDQo+DQo+T24gMTAvOS8xOSA1OjU5IFBNLCBTdGV3YXJ0IEhpbGRlYnJh
bmQgd3JvdGU6DQo+PiBIb3dldmVyLCBldmVuIHdpdGggWGVuIGxvb2tpbmcgZm9yIGJjbTI4Mzgs
IHlvdSB3b3VsZG4ndCBiZSBhYmxlIHRvDQo+PiBncmFiIG9uZSBvZiB0aG9zZSByZWxlYXNlcyBh
bmQgYm9vdCB3aXRob3V0IHJ1bm5pbmcgaW50byBvdGhlciBpc3N1ZXMuDQo+PiBZb3UnZCBzdGls
bCBuZWVkIGEgY291cGxlIG9mIGFkZGl0aW9uYWwgcGF0Y2hlcyBhdCBbNF0uIEN1cnJlbnRseSB0
aGUNCj4+IG9ubHkgd2F5IHRoYXQgSSdtIGF3YXJlIG9mIHRvIHN1Y2Nlc3NmdWxseSBib290IGlu
dG8gZG9tMCBhbmQgbGF1bmNoDQo+PiBkb21VIGlzIHRvIGJ1aWxkIHRoZSBkb20wIGtlcm5lbCBm
cm9tIHNvdXJjZSB3aXRoIHRoZSBleHRyYSBwYXRjaGVzDQo+PiBhcHBsaWVkIGZvdW5kIGF0IFs0
XS4NCj4NCj5JcyB0aGVyZSBhbnkgcGxhbiB0byB1cHN0cmVhbSB0aG9zZSBwYXRjaGVzPw0KDQpU
d28gb2YgdGhlIHBhdGNoZXMgYXJlIGFkZGluZyBkZXZpY2UgdHJlZSBub2RlcyAoeGVuLHhlbi1i
b290YXJncywNCmV0YyksIHNvIHRob3NlIGFyZSB1bmxpa2VseSB0byBiZSB1cHN0cmVhbWVkLiBP
bmUgcGF0Y2ggaXMgYQ0KaGFjay93b3JrYXJvdW5kIHRvIGRpc2FibGUgRE1BIGZvciB0aGUgU0Qg
Y2FyZCwgYWxzbyB1bmxpa2VseSB0byBiZQ0KdXBzdHJlYW1lZC4gRmluYWxseSwgdGhlIGxhc3Qg
cGF0Y2ggYWRkcyBhIGNoZWNrIHRvIGF2b2lkIGludm9raW5nDQp4ZW5fZG1hX29wcyByZWN1cnNp
dmVseS4gVGhpcyBvbmUgY291bGQgcG90ZW50aWFsbHkgYmUgdXBzdHJlYW1lZCwNCnRob3VnaCB3
ZSBoYXZlbid0IHN1Ym1pdHRlZCBvciBnYXRoZXJlZCBhbnkgaW5wdXQgZnJvbSB0aGUgbGludXgg
b3INCnJhc3BiZXJyeSBwaSBjb21tdW5pdGllcyB5ZXQuDQoNCldlIGFyZSB0cmFja2luZyB0aGUg
Zm9sbG93aW5nIHBhdGNoIHNldHMgWzVdIFs2XSBbN10gZm9yIHVwc3RyZWFtLCBhbmQNCm91ciBj
dXJyZW50IHBsYW4gaXMgYmFzaWNhbGx5IHRvIHdhaXQgdW50aWwgdGhleSBoYXZlIGJlZW4gbWVy
Z2VkLCB0cnkNCmJvb3RpbmcgdGhlIHVwc3RyZWFtIGtlcm5lbCwgdGhlbiBzZWUgaWYgaXQgaXMg
c3RpbGwgbmVjZXNzYXJ5IHRvIGFwcGx5DQp0aGUgRE1BIHdvcmthcm91bmRzLg0KDQpbNV0gaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9jb3Zlci8xMTE2NTM5NS8NCls2XSBodHRwczovL3Bh
dGNod29yay5rZXJuZWwub3JnL2NvdmVyLzExMTU5Mzc5Lw0KWzddIGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvY292ZXIvMTExNDE3MTkvDQoNCj4+ICJJZiB5b3UgYXJlIHVzaW5nIGEgZGV2
aWNlIHRyZWUgd2l0aCB0aGUgb2xkIGNvbXBhdGlibGUgc3RyaW5nDQo+PiBicmNtLGJjbTI4Mzgs
IHlvdSB3aWxsIG5lZWQgdG8gdXBncmFkZSB5b3VyIGRldmljZSB0cmVlIHRvIG9uZSB0aGF0IGhh
cw0KPj4gdGhlIG5ldyBicmNtLGJjbTI3MTEgY29tcGF0aWJsZSBzdHJpbmcuIg0KPg0KPlRoYXQn
cyBmaW5lIHdpdGggbWUuDQoNCk9LLCBzaW5jZSBpdCdzIHNpbXBseSBhIG1hdHRlciBvZiBhZGRp
bmcgdGhpcyB0byB0aGUgY29tbWl0IG1lc3NhZ2UsDQpjYW4gaXQgYmUgYWRkZWQgb24gY29tbWl0
PyBPciBzaG91bGQgSSBzcGluIGEgdjMgd2l0aCB0aGUgdXBkYXRlZA0KY29tbWl0IG1lc3NhZ2U/
DQoNCkZpbmFsbHksIEBKdWVyZ2VuLCBhcmUgeW91IHdpbGxpbmcgdG8gYWNjZXB0IHRoaXMgcGF0
Y2ggZm9yIDQuMTM/IFNpbmNlDQpib3RoIHVwc3RyZWFtIGxpbnV4IGFuZCBkb3duc3RyZWFtIHJh
c3BiZXJyeSBwaSBsaW51eCBjb21tdW5pdGllcyBoYXZlDQpkZWNpZGVkIHRvIHVzZSB0aGUgYmNt
MjcxMSBjb252ZW50aW9uLCB3ZSBkb24ndCBjdXJyZW50bHkgbWF0Y2ggdGhpcw0KcGxhdGZvcm0g
Y29tcGF0aWJsZS4gTWVhbmluZyB3ZSBjYW4ndCBjdXJyZW50bHkgYm9vdCBvbiBSUGk0IHdpdGhv
dXQNCnRoaXMgcGF0Y2guDQoNClN0ZXcNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
