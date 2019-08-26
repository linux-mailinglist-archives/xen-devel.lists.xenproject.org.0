Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C683E9D802
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 23:19:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2MMn-0006hm-8X; Mon, 26 Aug 2019 21:17:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=h3Cn=WW=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1i2MMm-0006hh-6r
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 21:17:32 +0000
X-Inumbo-ID: e9423734-c846-11e9-ae29-12813bfff9fa
Received: from emh04.mail.saunalahti.fi (unknown [62.142.5.110])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9423734-c846-11e9-ae29-12813bfff9fa;
 Mon, 26 Aug 2019 21:17:30 +0000 (UTC)
Received: from ydin.reaktio.net (reaktio.net [85.76.255.15])
 by emh04.mail.saunalahti.fi (Postfix) with ESMTP id 3CB7130033;
 Tue, 27 Aug 2019 00:17:28 +0300 (EEST)
Received: by ydin.reaktio.net (Postfix, from userid 1001)
 id A9C8736C0F6; Tue, 27 Aug 2019 00:17:28 +0300 (EEST)
Date: Tue, 27 Aug 2019 00:17:28 +0300
From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190826211728.GF2840@reaktio.net>
References: <20190809083831.GA30839@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809083831.GA30839@gao-cwp>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [Xen-devel] Reset pass-thru devices in a VM
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQ2hhbywKCk9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDA0OjM4OjMzUE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+IEhpIGV2ZXJ5b25lLAo+IAo+IEkgaGF2ZSBhIGRldmljZSB3aGljaCBvbmx5
IHN1cHBvcnRzIHNlY29uZGFyeSBidXMgcmVzZXQuIEFmdGVyIGJlaW5nCj4gYXNzaWduZWQgdG8g
YSBWTSwgaXQgd291bGQgYmUgcGxhY2VkIHVuZGVyIGhvc3QgYnJpZGdlLiBGb3IgZGV2aWNlcwo+
IHVuZGVyIGhvc3QgYnJpZGdlLCBzZWNvbmRhcnkgYnVzIHJlc2V0IGlzIG5vdCBhcHBsaWNhYmxl
LiBUaHVzLCBhIFZNCj4gaGFzIG5vIHdheSB0byByZXNldCB0aGlzIGRldmljZS4KPiAKPiBUaGlz
IGRldmljZSdzIHVzYWdlIHdvdWxkIGJlIGxpbWl0ZWQgd2l0aG91dCBQQ0kgcmVzZXQgKGZvciBl
eGFtcGxlLCBpdHMKPiBkcml2ZXIgY2Fubm90IHJlLWluaXRpYWxpemUgdGhlIGRldmljZSBwcm9w
ZXJseSB3aXRob3V0IFBDSSByZXNldCwgd2hpY2gKPiBtZWFucyBpbiBWTSBkZXZpY2Ugd29uJ3Qg
YmUgdXNhYmxlIGFmdGVyIHVubG9hZGluZyB0aGUgZHJpdmVyKSwgaXQgd291bGQKPiBiZSBtdWNo
IGJldHRlciBpZiB0aGVyZSBpcyBhIHdheSBhdmFpbGFibGUgdG8gVk1zIHRvIHJlc2V0IHRoZSBk
ZXZpY2UuCj4gCj4gSW4gbXkgbWluZCwgYSBzdHJhaWdodGZvd2FyZCBzb2x1dGlvbiBpcyB0byBj
cmVhdGUgYSB2aXJ0dWFsIGJyaWRnZQo+IGZvciBhIFZNIGFuZCBwbGFjZSB0aGUgcGFzcy10aHJ1
IGRldmljZSB1bmRlciBhIHZpcnR1YWwgYnJpZGdlLiBCdXQgaXQKPiBpc24ndCBzdXBwb3J0ZWQg
aW4gWGVuIChLVk0vUUVNVSBzdXBwb3J0cykgYW5kIGVuYWJsaW5nIGl0IGxvb2tzIG5lZWQKPiBh
IGxvdCBvZiBlZmZvcnRzLiBBbHRlcm5hdGl2ZWx5LCBlbXVsYXRpbmcgRkxSIChGdW5jdGlvbiBM
ZXZlbCBSZXNldCkKPiBjYXBhYmlsaXR5IGZvciB0aGlzIGRldmljZSBtaWdodCBiZSBhIGZlYXNp
YmxlIHdheSBhbmQgb25seSBuZWVkcwo+IHJlbGF0aXZlbHkgZmV3IGNoYW5nZXMuIEkgYW0gcGxh
bm5pbmcgdG8gZW5hYmxlIGFuIG9wdC1pbiBmZWF0dXJlCj4gKGxpa2UgJ3Blcm1pc3NpdmUnKSB0
byBhbGxvdyBxZW11IHRvIGV4cG9zZSBGTFIgY2FwYWJpbGl0eSB0byBndWVzdCBmb3IKPiBwYXNz
LXRocnUgZGV2aWNlcyBhcyBsb25nIGFzIHRoaXMgZGV2aWNlIGlzIHJlc2V0YWJsZSBvbiBkb20w
IChpLmUuIHRoZQo+IGRldmljZSBoYXMgJ3Jlc2V0JyBhdHRyaWJ1dGUgdW5kZXIgaXRzIHN5c2Zz
KS4gQW5kIHdoZW4gZ3Vlc3QgaW5pdGlhdGVzCj4gYW4gRkxSLCBxZW11IGp1c3QgZWNobyAxIHRv
IHRoZSAncmVzZXQnIGF0dHJpYnV0ZSBvbiBkb20wLgo+IAo+IERvIHlvdSB0aGluayBlbXVsYXRp
bmcgRkxSIGNhcGFiaWxpdHkgaXMgZG9hYmxlPwo+IAoKSSB3b25kZXIgaWYgdGhlc2UgcGF0Y2hl
cyBmcm9tIGFub3RoZXIgdGhyZWFkIGhlbHAgd2l0aCB5b3VyIHJlc2V0IGlzc3VlOgoKaHR0cHM6
Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDIzMDQu
aHRtbAoKClRoYW5rcywKCi0tIFBhc2kKCgo+IFRoYW5rcwo+IENoYW8KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
