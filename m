Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A843C2B182
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 11:44:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVC7r-0004Dy-IR; Mon, 27 May 2019 09:41:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVC7p-0004Ds-OP
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:41:01 +0000
X-Inumbo-ID: 8781aa1e-8063-11e9-8dfe-cf8851c73472
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8781aa1e-8063-11e9-8dfe-cf8851c73472;
 Mon, 27 May 2019 09:40:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 03:40:56 -0600
Message-Id: <5CEBB0A30200007800232BBE@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 03:40:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Lars Kurth" <lars.kurth@citrix.com>
References: <6250372b05e95412cfd0f8e6f558f2376c4f3d94.1558719481.git.lars.kurth@citrix.com>
In-Reply-To: <6250372b05e95412cfd0f8e6f558f2376c4f3d94.1558719481.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, committers@xenproject.org,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI0LjA1LjE5IGF0IDE5OjQ0LCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
PiBGb2xsb3dpbmcgdGhlIHJlY2VudCBkaXNjdXNzaW9uLCB3ZSBoYWQgb24gSVJDIGFuZCB0aGUg
YWN0aW9uIEkgaGFkIGluIAo+IHRoZSBNYXJjaCBjb21tdW5pdHkgY2FsbCwgdGhpcyBmaWxlIHBy
b3ZpZGVzIGEgZmlsZSBmb3JtYXQgdGhhdCAKPiBlbmFibGVzIHdyaXRpbmcgYW4gYXV0b21hdGVk
IHRlc3QgdG8gY2hlY2sgd2hldGhlciBmaWxlcyBhcmUgb3V0IG9mIHN5bmMuIAo+IAo+IEFuIGV4
YW1wbGUsIHdoYXQgZmlsZSBjb250ZW50IG1heSBsb29rIGxpa2UgaXMgZW1iZWRkZWQgYmVsb3cK
PiByZXBvOiBsaW51eC10b3J2YWxkcyBnaXQgCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IAo+IGZpbGU6IHhlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMgbGludXgtdG9ydmFsZHMgCj4gbGludXgvZHJpdmVy
cy9pb21tdS9hcm0tc21tdS5jIGI3N2NmMTFmMDk0MTM2Cj4gCj4gT25jZSB0aGUgZmlsZSBmb3Jt
YXQgaXMgYWdyZWUsIEkgd2lsbCB3cml0ZSBhIHRlc3Qgb3Igc2NyaXB0Lgo+IAo+IEkgYWxzbyBu
ZWVkIHNvbWUgbW9yZSBjb3JyZWN0IHRlc3QgZGF0YSwgYWthIGVudHJpZXMgaW4gdGhlIGZpbGUg
ZnJvbQo+IGNvbW1pdHRlcnMgbG9va2luZyBhZnRlciB0aGUgZm9sbG93aW5nIGZpbGVzCj4gW0ph
bl0KPiB4ZW4vYXJjaC94ODYvY3B1L213YWl0LWlkbGUuYyAKPiBbU3RlZmFubywgSnVsaWVuIC0g
dGhpcyBoYXMgdG8gYmUgZmluYWxpemVkXQo+IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9z
bW11LmMKPiB4ZW4vYXJjaC9hcm0vdmdpYy8qCj4geGVuL2luY2x1ZGUvYXNtLWFybS9kaXY2NC5o
Cj4geGVuL2RyaXZlcnMvY2hhci9tZXNvbi11YXJ0LmMKPiB4ZW4vYXJjaC9hcm0vYXJtMzIvbGli
LyoKPiB4ZW4vYXJjaC9hcm0vYXJtNjQvbGliLyoKPiB4ZW4vYXJjaC9hcm0vYXJtNjQvY2FjaGUu
Uwo+IHhlbi9hcmNoL2FybS9hcm02NC9icGkuUwo+IHhlbi9pbmNsdWRlL2FzbS1hcm0vc3lzdGVt
LmgKPiB4ZW4vYXJjaC9hcm0vYXJtNjQvaW5zbi5jCj4gW090aGVycz9dCj4geGVuL2NvbW1vbi9y
YnRyZWUuYwo+IAo+IE5vdGUgdGhhdCBpbiBzb21lIGNhc2VzIExpbnV4IGhhcyBkaXZlcmdlZCBh
bmQgc29tZSBMaW51eCBmaWxlcyBoYXZlIGRpc2FwcGVhcmVkLiAKPiBKdWxpZW4gYWxzbyByYWlz
ZWQgdGhlIHBvaW50LCB0aGF0IGluIHNvbWUgY2FzZXMgb25seSBhIHN1YnNldCBvZiBjb2RlIGZy
b20gCj4gTGludXggWGVuIGZpbGVzIHdhcyBhcHBsaWVkIG9yIHRoYXQgb25seSBzb21lIGZ1bmN0
aW9ucyBnZXQgbW92ZWQgYWNyb3NzIHRvIAo+IFhlbi4KPiAKPiBJIGJlbGlldmUgdGhhdCBpcyBl
bnRpcmVseSBPSy4gVGhlIHdvcmtmbG93IHdvdWxkIGJlIGluIG1vc3QgY2FzZXMgdGhhdDoKPiAt
IFdlIHVzZSBhIExpbnV4IChzb3VyY2UpIGNvbW1pdCBhcyBhIGJlbmNobWFyayBhbmQgcmVjb3Jk
IHRoZSBjb21taXQgSUQKPiAtIElmIHRoZXJlIGlzIGEgY2hhbmdlIGluIExpbnV4IHRoZSB0ZXN0
IHdpbGwgZmFpbAo+IC0gVGhlIGNvbW1pdHRlciBsb29rcyBhdCB0aGUgZGlmZiBhbmQgZWl0aGVy
Cj4gICAtIERlY2lkZXMgdG8gaWdub3JlIGl0IGFuZCBidW1wcyB0aGUgY29tbWl0IElEIGluIHRo
aXMgZmlsZQo+ICAgLSBEZWNpZGVzIHRoZSBjaGFuZ2UgaXMgbmVlZGVkLCBpbnRlZ3JhdGVzIGl0
IGludG8gWGVuIGFuZCB0aGVuIAo+ICAgICBidW1wcyB0aGUgY29tbWl0IElEIGluIHRoaXMgZmls
ZQoKV2l0aCB0aGlzIC4uLgoKPiBDaGFuZ2VzIHNpbmNlIHYxCj4gKiBSZXF1aXJlIGEgY29sb24g
YWZ0ZXIgcmVwbzosIGZpbGU6LCAuLi4ga2V5d29yZHMKPiAqIFJlcGxhY2UgbWFudWFsOnxhdXRv
OiB3aXRoIGZpbGU6IGFzIHRoZXJlIGF1dG86IHVzZS1jYXNlIHdhcyBpbnZhbGlkCj4gKiBBZGRl
ZCBtb3JlIHZlcmJvc2UgZGVzY3JpcHRpb24gb2YgZm9ybWF0Cj4gCj4gQ2hhbmdlcyBzaW5jZSB2
Mgo+ICogQ2hhbmdlZCBzb21lIGZvcm1hdHRpbmcKPiAqIFJlbW92ZWQgZXhhbXBsZXMKPiAqIFJl
bW92ZWQgcmVmZXJlbmNlcyB0byBodHRwcwoKLi4uIG1vdmUgcGFzdCB0aGUgZmlyc3QgLS0tIHNl
cGFyYXRvciAuLi4KCj4gU2lnbmVkLW9mZi1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRy
aXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
