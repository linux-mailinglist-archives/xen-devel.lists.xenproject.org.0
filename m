Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AF91B056
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 08:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ4PG-00089H-AW; Mon, 13 May 2019 06:25:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cGAx=TN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQ4PE-00089C-H8
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 06:25:48 +0000
X-Inumbo-ID: efacc8b6-7547-11e9-8a3d-03ef6d2cf58a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efacc8b6-7547-11e9-8a3d-03ef6d2cf58a;
 Mon, 13 May 2019 06:25:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 13 May 2019 00:25:42 -0600
Message-Id: <5CD90DE1020000780022DF5B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 13 May 2019 00:25:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-2-roger.pau@citrix.com>
 <bbca70d1-a42e-f016-26aa-fc7cd15bbf24@citrix.com>
In-Reply-To: <bbca70d1-a42e-f016-26aa-fc7cd15bbf24@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/5] pci: use pci_sbdf_t in pci_dev
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA1LjE5IGF0IDE4OjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTAvMDUvMjAxOSAxNzoxMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiAtLS0g
YS94ZW4vYXJjaC94ODYvaHZtL3Ztc2kuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3Ztc2ku
Ywo+PiBAQCAtNjg4LDggKzY4OCw4IEBAIHN0YXRpYyBpbnQgdnBjaV9tc2lfdXBkYXRlKGNvbnN0
IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MzJfdCBkYXRhLAo+PiAgICAgICAgICB7Cj4+ICAg
ICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLAo+PiAgICAgICAgICAgICAgICAgICAgICAg
IiUwNHg6JTAyeDolMDJ4LiV1OiBmYWlsZWQgdG8gYmluZCBQSVJRICV1OiAlZFxuIiwKPj4gLSAg
ICAgICAgICAgICAgICAgICAgIHBkZXYtPnNlZywgcGRldi0+YnVzLCBQQ0lfU0xPVChwZGV2LT5k
ZXZmbiksCj4+IC0gICAgICAgICAgICAgICAgICAgICBQQ0lfRlVOQyhwZGV2LT5kZXZmbiksIHBp
cnEgKyBpLCByYyk7Cj4+ICsgICAgICAgICAgICAgICAgICAgICBwZGV2LT5zYmRmLnNlZywgcGRl
di0+c2JkZi5idXMsIHBkZXYtPnNiZGYuZGV2LAo+PiArICAgICAgICAgICAgICAgICAgICAgcGRl
di0+c2JkZi5mdW5jLCBwaXJxICsgaSwgcmMpOwo+IAo+IEEgcGNpX3NiZGZfdCBpcyAzMiBiaXRz
IHdpZGUuICBJIGRvIGFjdHVhbGx5IGhhdmUgYSBjdXN0b20gJXAgZm9ybWF0dGVyCj4gZnJvbSBh
IHllYXIgb3Igc28gYWdvLCB3aGljaCBzaW1wbGlmaWVzIGNvZGUgbGlrZSB0aGlzIHN1YnN0YW50
aWFsbHkuCj4gCj4gSXMgdGhlcmUgYW55IGludGVyZXN0IGluIGR1c3Rpbmcgb2ZmIHRoYXQgcGF0
Y2ggYW5kIGZvbGRpbmcgaXQgaW50byB0aGlzCj4gY2xlYW51cCBzZXJpZXM/ICBJU1RSIGl0IGFs
c28gY2FtZSB3aXRoIHNldmVyYWwgY29ycmVjdGlvbnMgdG8gZXhpc3RpbmcKPiBTQkRGIHJlbmRl
cmluZy4KCkFmYWljOiBZZXMgcGxlYXNlISBUaGUgb25lIHRoaW5nIEknbSBub3Qgc3VyZSBhYm91
dCBpcyB3aGV0aGVyIHRoaXMKc2hvdWxkIGJlIFBDSS1zcGVjaWZpYywgb3Igd2hldGhlciBpdCB3
b3VsZG4ndCBiZXR0ZXIgYmUgYSBtb3JlCmdlbmVyYWwgZGV2aWNlIHRoaW5nLiBCdXQgSSBndWVz
cyB3ZSB1c2UgU0JERiBhbHNvIGluZGVwZW5kZW50IG9mCnN0cnVjdCBwY2lfZGV2LgoKSmFuCgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
