Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422EE1619D
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 12:01:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNwr5-0002As-58; Tue, 07 May 2019 09:57:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5sH=TH=citrix.com=prvs=0233d00f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hNwr3-0002Ak-No
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 09:57:45 +0000
X-Inumbo-ID: 8acf41e6-70ae-11e9-bead-93b967b6df21
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8acf41e6-70ae-11e9-bead-93b967b6df21;
 Tue, 07 May 2019 09:57:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="85206016"
Date: Tue, 7 May 2019 10:57:34 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190507095733.GA2798@zion.uk.xensource.com>
References: <20190506124624.54454-1-elnikety@amazon.com>
 <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32d91d7a-a02d-65e3-d166-deb3b64ab592@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] mm: option to _always_ scrub freed domheap
 pages
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Eslam Elnikety <elnikety@amazon.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMTA6NTU6NTFBTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA1LzYvMTkgMTo0NiBQTSwgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4gPiBHaXZl
IHRoZSBhZG1pbmlzdHJhdG9yIGZ1cnRoZXIgY29udHJvbCBvbiB3aGVuIHRvIHNjcnViIGRvbWhl
YXAgcGFnZXMgYnkgYWRkaW5nCj4gPiBhbiBvcHRpb24gdG8gYWx3YXlzIHNjcnViLiBUaGlzIGlz
IGEgc2FmZXR5IGZlYXR1cmUgdGhhdCwgd2hlbiBlbmFibGVkLAo+ID4gcHJldmVudHMgYSAoYnVn
Z3kpIGRvbWFpbiBmcm9tIGxlYWtpbmcgc2VjcmV0cyBpZiBpdCBhY2NpZGVudGFsbHkgZnJlZXMg
YSBwYWdlCj4gPiB3aXRob3V0IHByb3BlciBzY3J1YmJpbmcuCj4gPiAKPiA+IFNpZ25lZC1vZmYt
Ynk6IEVzbGFtIEVsbmlrZXR5IDxlbG5pa2V0eUBhbWF6b24uY29tPgo+IAo+IE5vdyB0aGF0IEkg
dGhpbmsgYWJvdXQgaXQgLS0gQW5keSwgaXNuJ3QgdGhlcmUgYSBwYXRjaCBpbiB0aGUgWGVuU2Vy
dmVyCj4gcGF0Y2hxdWV1ZSB0byBlbmFibGUgc2NydWJiaW5nIGJ5IGRlZmF1bHQ/Cj4gCj4gSSdt
IHdvbmRlcmluZyBpZiB0aGlzIHNob3VsZCBkZWZhdWx0IHRvICd0cnVlJywgYW5kIHBlb3BsZSB3
aG8gcmVhbGx5Cj4gd2FudCB0aGUgZXh0cmEgcGVyZm9ybWFuY2Ugc2hvdWxkIHR1cm4gaXQgb2Zm
Lgo+IAo+IE9ubHkgb25lIG90aGVyIG1pbm9yIGNvbW1lbnQ6Cj4gCj4gPiAtLS0KPiA+ICBkb2Nz
L21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MgfCAgOCArKysrKysrKwo+ID4gIHhlbi9jb21t
b24vcGFnZV9hbGxvYy5jICAgICAgICAgICB8IDExICsrKysrKysrKy0tCj4gPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0t
Z2l0IGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIGIvZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jCj4gPiBpbmRleCA3ZGNiMjI5MzJhLi41YTkyOTQ5YzVhIDEwMDY0
NAo+ID4gLS0tIGEvZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jCj4gPiArKysgYi9k
b2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKPiA+IEBAIC0yNzAsNiArMjcwLDE0IEBA
IGFuZCBub3QgcnVubmluZyBzb2Z0aXJxcy4gUmVkdWNlIHRoaXMgaWYgc29mdGlycXMgYXJlIG5v
dCBiZWluZyBydW4gZnJlcXVlbnRseQo+ID4gIGVub3VnaC4gU2V0dGluZyB0aGlzIHRvIGEgaGln
aCB2YWx1ZSBtYXkgY2F1c2UgYm9vdCBmYWlsdXJlLCBwYXJ0aWN1bGFybHkgaWYKPiA+ICB0aGUg
Tk1JIHdhdGNoZG9nIGlzIGFsc28gZW5hYmxlZC4KPiA+ICAKPiA+ICsjIyMgc2NydWJfZG9taGVh
cAo+ID4gKz4gYD0gPGJvb2xlYW4+YAo+ID4gKwo+ID4gKz4gRGVmYXVsdDogYGZhbHNlYAo+ID4g
Kwo+ID4gK1NjcnViIGRvbWFpbnMnIGZyZWVkIHBhZ2VzLiBUaGlzIGlzIGEgc2FmZXR5IG5ldCBh
Z2FpbnN0IGEgKGJ1Z2d5KSBkb21haW4KPiA+ICthY2NpZGVudGFsbHkgbGVha2luZyBzZWNyZXRz
IGJ5IHJlbGVhc2luZyBwYWdlcyB3aXRob3V0IHByb3BlciBzYW5pdGl6YXRpb24uCj4gPiArCj4g
PiAgIyMjIGNsb2Nrc291cmNlICh4ODYpCj4gPiAgPiBgPSBwaXQgfCBocGV0IHwgYWNwaSB8IHRz
Y2AKPiA+ICAKPiA+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCj4gPiBpbmRleCBiZTQ0MTU4MDMzLi42NzhhMDBhYzliIDEwMDY0
NAo+ID4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMKPiA+ICsrKyBiL3hlbi9jb21tb24v
cGFnZV9hbGxvYy5jCj4gPiBAQCAtMjE0LDYgKzIxNCwxMiBAQCBjdXN0b21fcGFyYW0oImJvb3Rz
Y3J1YiIsIHBhcnNlX2Jvb3RzY3J1Yl9wYXJhbSk7Cj4gPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcg
X19pbml0ZGF0YSBvcHRfYm9vdHNjcnViX2NodW5rID0gTUIoMTI4KTsKPiA+ICBzaXplX3BhcmFt
KCJib290c2NydWJfY2h1bmsiLCBvcHRfYm9vdHNjcnViX2NodW5rKTsKPiA+ICAKPiA+ICsvKgo+
ID4gKyAqIHNjcnViX2RvbWhlYXAgLT4gRG9taGVhcCBwYWdlcyBhcmUgc2NydWJiZWQgd2hlbiBm
cmVlZAo+ID4gKyAqLwo+ID4gK3N0YXRpYyBib29sX3Qgb3B0X3NjcnViX2RvbWhlYXAgPSAwOwoK
UGxlYXNlIGNoYW5nZSBib29sX3QgdG8gYm9vbCBhbmQgMCB0byBmYWxzZSB3aGlsZSB5b3UncmUg
YXQgaXQuIDotKQoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
