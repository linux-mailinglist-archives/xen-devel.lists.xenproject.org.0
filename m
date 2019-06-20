Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4317A4D0BB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 16:48:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdyJ3-0002nF-I7; Thu, 20 Jun 2019 14:44:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ln/=UT=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hdyJ1-0002nA-NS
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 14:44:51 +0000
X-Inumbo-ID: f44b5f32-9369-11e9-96db-db400a678273
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f44b5f32-9369-11e9-96db-db400a678273;
 Thu, 20 Jun 2019 14:44:49 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1sCmiKCYkoe89KWYsURXFs9tBSqHb1xjM95LYeqbwYSY7AhHT6qPPUQNls9YvgrS09Fu9aPyM3
 4qLNsqZiZk0+UKY/5xMd7R61wZ5ox5hiiQm0g58xGELo7oxA1bEzAStndEWztgyG5cvugyrWsS
 ho7DVdNZMWWMnECA1Fn9piuvhGR7ec9jec1SxfJjPocjBweFzlwxND6Q/DvA/ekLGn90VT1VqS
 YG+Gz/J1/Sn6zQyoZpIax7gZa6+TjkpMFkx5vrRE1Vq6XG/u8fU/NXKzSbXvEE4+J5U/qHCJAq
 S70=
X-SBRS: 2.7
X-MesageID: 2019550
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,397,1557201600"; 
   d="scan'208";a="2019550"
Date: Thu, 20 Jun 2019 15:44:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20190620144446.GD13449@perard.uk.xensource.com>
References: <20190618112341.513-1-anthony.perard@citrix.com>
 <20190618112341.513-2-anthony.perard@citrix.com>
 <20190618121408.GM28525@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618121408.GM28525@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [Qemu-devel] [PATCH v2 1/4] xen: Fix build with
 public headers
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul.durrant@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdW4gMTgsIDIwMTkgYXQgMDE6MTQ6MDhQTSArMDEwMCwgRGFuaWVsIFAuIEJlcnJh
bmfDqSB3cm90ZToKPiBPbiBUdWUsIEp1biAxOCwgMjAxOSBhdCAxMjoyMzozOFBNICswMTAwLCBB
bnRob255IFBFUkFSRCB3cm90ZToKPiA+IEZvbGxvd2luZyAzNzY3N2Q3ZGIzICJDbGVhbiB1cCBh
IGZldyBoZWFkZXIgZ3VhcmQgc3ltYm9scyIsIFFFTVUgc3RhcnQKPiA+IHRvIGZhaWwgdG8gYnVp
bGQ6Cj4gPiAKPiA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSB+L3hlbi90b29scy8uLi90b29scy9p
bmNsdWRlL3hlbi9pby9ibGtpZi5oOjMxOjAsCj4gPiAgICAgICAgICAgICAgICAgIGZyb20gfi94
ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3L2Jsb2NrL3hlbl9ibGtpZi5oOjUsCj4gPiAgICAgICAg
ICAgICAgICAgIGZyb20gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3L2Jsb2NrL3hlbi1ibG9j
ay5jOjIyOgo+ID4gfi94ZW4vdG9vbHMvLi4vdG9vbHMvaW5jbHVkZS94ZW4vaW8vcmluZy5oOjY4
OjA6IGVycm9yOiAiX19DT05TVF9SSU5HX1NJWkUiIHJlZGVmaW5lZCBbLVdlcnJvcl0KPiA+ICAj
ZGVmaW5lIF9fQ09OU1RfUklOR19TSVpFKF9zLCBfc3opIFwKPiA+IAo+ID4gSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIH4veGVuL3Rvb2xzL3FlbXUteGVuLWRpci9ody9ibG9jay94ZW5fYmxraWYuaDo0
OjAsCj4gPiAgICAgICAgICAgICAgICAgIGZyb20gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2h3
L2Jsb2NrL3hlbi1ibG9jay5jOjIyOgo+ID4gfi94ZW4vdG9vbHMvcWVtdS14ZW4tZGlyL2luY2x1
ZGUvaHcveGVuL2lvL3JpbmcuaDo2NjowOiBub3RlOiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0
aGUgcHJldmlvdXMgZGVmaW5pdGlvbgo+ID4gICNkZWZpbmUgX19DT05TVF9SSU5HX1NJWkUoX3Ms
IF9zeikgXAo+ID4gCj4gPiBUaGUgaXNzdWUgaXMgdGhhdCBzb21lIHB1YmxpYyB4ZW4gaGVhZGVy
cyBoYXZlIGJlZW4gaW1wb3J0ZWQgKGJ5Cj4gPiBmNjVlYWRiNjM5ICJ4ZW46IGltcG9ydCByaW5n
LmggZnJvbSB4ZW4iKSBidXQgbm90IGFsbC4gV2l0aCB0aGUgY2hhbmdlCj4gPiBpbiB0aGUgZ3Vh
cmRzIHN5bWJvbGUsIHRoZSByaW5nLmggaGVhZGVyIHN0YXJ0IHRvIGJlIGltcG9ydGVkIHR3aWNl
Lgo+IAo+IEFoLCBzbyB0aGUgaW5jbHVkZS9ody94ZW4vaW8vcmluZy5oIGZpbGUgaW4gdHJlZSBp
cyBhIGNvcHkgb2YKPiAvdXNyL2luY2x1ZGUveGVuL2lvL3JpbmcuaCBmcm9tIHhlbi1kZXZlbC4g
IFByZXZpb3VzbHkgYm90aAo+IHRoZXNlIHVzZWQgIiNpZm5kZWYgX19YRU5fUFVCTElDX0lPX1JJ
TkdfSF9fIi4gQWZ0ZXIKPiB0aGUgaGVhZGVyIGd1YXJkIGNsZWFudXAgaW4gMzc2NzdkN2RiMywg
b3VyIGxvY2FsIGNvcHkgdXNlZCBhCj4gZGlmZmVyZW50IGhlYWRlciBndWFyZCBmcm9tIHRoZSBp
bnN0YWxsZWQgY29weSAmIHRodXMgd2UncmUKPiBub3QgcHJvdGVjdGVkIGZyb20gZHVhbCBpbmNs
dXNpb24uCj4gCj4gSU1ITyB0aGUgcmlnaHQgc29sdXRpb25zIGhlcmUgYXJlIGVpdGhlcgo+IAo+
ICAtIERvbid0IGNvcHkgcHVibGljIFhlbiBoZWFkZXJzIGludG8gb3VyIHRyZWUKPiAgLSBLZWVw
IG91ciBYZW4gaGVhZGVyIGNvcGllcyBpZGVudGljYWwgdG8gdGhlIG9yaWdpbmFscwo+IAo+IElt
cG9ydGluZyBwdWJsaWMgaGVhZGVycyBhbmQgdGhlbiBjaGFuZ2luZyB0aGVtIGxvY2FsbHkgaXMg
dGhlIHdvcnN0Cj4gdGhpbmcgdG8gZG8uIFdpdGggdGhhdCBpbiBtaW5kIEkgdGhpbmsgd2Ugc2hv
dWxkIHJldmVydCB0aGUgcGFydCBvZgo+IGNvbW1pdCAzNzY3N2Q3ZGIzIHRoYXQgdG91Y2hlZCB0
aGUgaW1wb3J0ZWQgWGVuIGhlYWRlcnMuCgpZZXMsIGl0J3MgcHJvcGFibHkgYSBiZXR0ZXIgdGhp
bmcgdG8gZG8uIFNvLCBJJ20gZ29pbmcgdG8gdXBkYXRlIHRoZQpzZXJpZXMgYW5kIGRvOgotIHJl
dmVydCBwYXJ0IG9mIDM3Njc3ZDdkYjMKLSBpbXBvcnQgdGhlIHB1YmxpYyBoZWFkZXJzIHRoYXQg
ZGVwZW5kcyBvbiByaW5nLmguIE9yIGluIG90aGVyIHdvcmRzLAogIHRoZSBvbmUgdGhhdCBkZXNj
cmliZSBhbiBpbnRlcmZhY2Ugd2l0aCBhIGd1ZXN0LgogIEknbGwgZG8gc29tZSBtb2RpZmljYXRp
b24gb24gdGhlIGhlYWRlcnMgYnV0IG9ubHkgdG8gcmVtb3ZlIHRoZSBzdHVmZgogIHRoYXQgUUVN
VSBkb2Vzbid0IG5lZWQgKGxpa2UgaG93IHRvIG1ha2UgYW4gaHlwZXJjYWxsKS4KClRoYW5rcywK
Ci0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
