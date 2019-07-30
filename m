Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0605E7B446
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:21:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYZk-0004LX-4f; Tue, 30 Jul 2019 20:18:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsYZi-0004LS-K7
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:18:22 +0000
X-Inumbo-ID: 2cb10700-b307-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2cb10700-b307-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 20:18:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56C1A20693;
 Tue, 30 Jul 2019 20:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564517900;
 bh=vZcm0v0lRtdNgrKmMpdKPgU7ObCf+pJoO1H7Dd6eRxM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0BrzaycdLwq86Rmg85uaJvw2h/4Rqp5jECqOF3LCArgmpEPY+Ht0CCv09Vj9k7YL7
 PK1CNekOshJBZqysjYWW9oUX76TYfD7F2knLrWAQ9In89z6pMfoSxQcSAq/Gt5AeJD
 8ar0hTLd8AHq3ZOHs6sqwLN8omt5Y6fnQFaxLJHQ=
Date: Tue, 30 Jul 2019 13:18:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-28-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301318080.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-28-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 27/35] xen/arm32: head: Document
 create_pages_tables()
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IERvY3VtZW50IHRoZSBi
ZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiB0aGUgZnVuY3Rpb24u
Cj4gTm90ZSB0aGF0IHI2IGlzIG5vdyBvbmx5IHVzZWQgd2l0aGluIHRoZSBmdW5jdGlvbiwgc28g
aXQgZG9lcyBub3QgbmVlZAo+IHRvIGJlIHBhcnQgb2YgdGhlIGNvbW1vbiByZWdpc3Rlci4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQWNr
ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0t
LQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBQYXRjaCBhZGRlZAo+IC0tLQo+ICB4
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIHwgMzAgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2Fy
bS9hcm0zMi9oZWFkLlMKPiBpbmRleCAxMTlkMmEwZGY4Li5lZjg5Nzk5NTliIDEwMDY0NAo+IC0t
LSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCj4gQEAgLTUzLDcgKzUzLDcgQEAKPiAgICogICByMyAgLQo+ICAgKiAgIHI0ICAtCj4g
ICAqICAgcjUgIC0KPiAtICogICByNiAgLSBpZGVudGl0eSBtYXAgaW4gcGxhY2UKPiArICogICBy
NiAgLQo+ICAgKiAgIHI3ICAtCj4gICAqICAgcjggIC0gRFRCIGFkZHJlc3MgKGJvb3QgQ1BVIG9u
bHkpCj4gICAqICAgcjkgIC0gcGFkZHIoc3RhcnQpCj4gQEAgLTMwMSwxOCArMzAxLDI2IEBAIGNw
dV9pbml0X2RvbmU6Cj4gICAgICAgICAgbW92ICAgcGMsIHI1ICAgICAgICAgICAgICAgICAgICAg
ICAgLyogUmV0dXJuIGFkZHJlc3MgaXMgaW4gcjUgKi8KPiAgRU5EUFJPQyhjcHVfaW5pdCkKPiAg
Cj4gKy8qCj4gKyAqIFJlYnVpbGQgdGhlIGJvb3QgcGFnZXRhYmxlJ3MgZmlyc3QtbGV2ZWwgZW50
cmllcy4gVGhlIHN0cnVjdHVyZQo+ICsgKiBpcyBkZXNjcmliZWQgaW4gbW0uYy4KPiArICoKPiAr
ICogQWZ0ZXIgdGhlIENQVSBlbmFibGVzIHBhZ2luZyBpdCB3aWxsIGFkZCB0aGUgZml4bWFwIG1h
cHBpbmcKPiArICogdG8gdGhlc2UgcGFnZSB0YWJsZXMsIGhvd2V2ZXIgdGhpcyBtYXkgY2xhc2gg
d2l0aCB0aGUgMToxCj4gKyAqIG1hcHBpbmcuIFNvIGVhY2ggQ1BVIG11c3QgcmVidWlsZCB0aGUg
cGFnZSB0YWJsZXMgaGVyZSB3aXRoCj4gKyAqIHRoZSAxOjEgaW4gcGxhY2UuCj4gKyAqCj4gKyAq
IElucHV0czoKPiArICogICByOSA6IHBhZGRyKHN0YXJ0KQo+ICsgKiAgIHIxMDogcGh5cyBvZmZz
ZXQKPiArICoKPiArICogQ2xvYmJlcnMgcjAgLSByNgo+ICsgKgo+ICsgKiBSZWdpc3RlciB1c2Fn
ZSB3aXRoaW4gdGhpcyBmdW5jdGlvbjoKPiArICogICByNiA6IElkZW50aXR5IG1hcCBpbiBwbGFj
ZQo+ICsgKi8KPiAgY3JlYXRlX3BhZ2VfdGFibGVzOgo+ICAgICAgICAgIC8qCj4gLSAgICAgICAg
ICogUmVidWlsZCB0aGUgYm9vdCBwYWdldGFibGUncyBmaXJzdC1sZXZlbCBlbnRyaWVzLiBUaGUg
c3RydWN0dXJlCj4gLSAgICAgICAgICogaXMgZGVzY3JpYmVkIGluIG1tLmMuCj4gLSAgICAgICAg
ICoKPiAtICAgICAgICAgKiBBZnRlciB0aGUgQ1BVIGVuYWJsZXMgcGFnaW5nIGl0IHdpbGwgYWRk
IHRoZSBmaXhtYXAgbWFwcGluZwo+IC0gICAgICAgICAqIHRvIHRoZXNlIHBhZ2UgdGFibGVzLCBo
b3dldmVyIHRoaXMgbWF5IGNsYXNoIHdpdGggdGhlIDE6MQo+IC0gICAgICAgICAqIG1hcHBpbmcu
IFNvIGVhY2ggQ1BVIG11c3QgcmVidWlsZCB0aGUgcGFnZSB0YWJsZXMgaGVyZSB3aXRoCj4gLSAg
ICAgICAgICogdGhlIDE6MSBpbiBwbGFjZS4KPiAtICAgICAgICAgKi8KPiAtCj4gLSAgICAgICAg
LyoKPiAgICAgICAgICAgKiBJZiBYZW4gaXMgbG9hZGVkIGF0IGV4YWN0bHkgWEVOX1ZJUlRfU1RB
UlQgdGhlbiB3ZSBkb24ndAo+ICAgICAgICAgICAqIG5lZWQgYW4gYWRkaXRpb25hbCAxOjEgbWFw
cGluZywgdGhlIHZpcnR1YWwgbWFwcGluZyB3aWxsCj4gICAgICAgICAgICogc3VmZmljZS4KPiAt
LSAKPiAyLjExLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
