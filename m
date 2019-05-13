Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BC1B18B
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 09:56:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ5m1-0006qg-G1; Mon, 13 May 2019 07:53:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQ5lz-0006qb-7G
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 07:53:23 +0000
X-Inumbo-ID: 2a79a25a-7554-11e9-879f-03bec6a29959
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a79a25a-7554-11e9-879f-03bec6a29959;
 Mon, 13 May 2019 07:53:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="89704467"
Date: Mon, 13 May 2019 09:53:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190513075302.echqmnxfkhp524lp@Air-de-Roger>
References: <20190510161056.48648-1-roger.pau@citrix.com>
 <20190510161056.48648-2-roger.pau@citrix.com>
 <bbca70d1-a42e-f016-26aa-fc7cd15bbf24@citrix.com>
 <5CD90DE1020000780022DF5B@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD90DE1020000780022DF5B@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTI6MjU6MzdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEwLjA1LjE5IGF0IDE4OjE2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4gd3JvdGU6Cj4gPiBPbiAxMC8wNS8yMDE5IDE3OjEwLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXNpLmMKPiA+PiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL3Ztc2kuYwo+ID4+IEBAIC02ODgsOCArNjg4LDggQEAgc3RhdGljIGludCB2cGNpX21z
aV91cGRhdGUoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQzMl90IGRhdGEsCj4gPj4g
ICAgICAgICAgewo+ID4+ICAgICAgICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLAo+ID4+ICAg
ICAgICAgICAgICAgICAgICAgICAiJTA0eDolMDJ4OiUwMnguJXU6IGZhaWxlZCB0byBiaW5kIFBJ
UlEgJXU6ICVkXG4iLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICBwZGV2LT5zZWcsIHBkZXYt
PmJ1cywgUENJX1NMT1QocGRldi0+ZGV2Zm4pLAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICBQ
Q0lfRlVOQyhwZGV2LT5kZXZmbiksIHBpcnEgKyBpLCByYyk7Cj4gPj4gKyAgICAgICAgICAgICAg
ICAgICAgIHBkZXYtPnNiZGYuc2VnLCBwZGV2LT5zYmRmLmJ1cywgcGRldi0+c2JkZi5kZXYsCj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgIHBkZXYtPnNiZGYuZnVuYywgcGlycSArIGksIHJjKTsK
PiA+IAo+ID4gQSBwY2lfc2JkZl90IGlzIDMyIGJpdHMgd2lkZS4gIEkgZG8gYWN0dWFsbHkgaGF2
ZSBhIGN1c3RvbSAlcCBmb3JtYXR0ZXIKPiA+IGZyb20gYSB5ZWFyIG9yIHNvIGFnbywgd2hpY2gg
c2ltcGxpZmllcyBjb2RlIGxpa2UgdGhpcyBzdWJzdGFudGlhbGx5Lgo+ID4gCj4gPiBJcyB0aGVy
ZSBhbnkgaW50ZXJlc3QgaW4gZHVzdGluZyBvZmYgdGhhdCBwYXRjaCBhbmQgZm9sZGluZyBpdCBp
bnRvIHRoaXMKPiA+IGNsZWFudXAgc2VyaWVzPyAgSVNUUiBpdCBhbHNvIGNhbWUgd2l0aCBzZXZl
cmFsIGNvcnJlY3Rpb25zIHRvIGV4aXN0aW5nCj4gPiBTQkRGIHJlbmRlcmluZy4KPiAKPiBBZmFp
YzogWWVzIHBsZWFzZSEgVGhlIG9uZSB0aGluZyBJJ20gbm90IHN1cmUgYWJvdXQgaXMgd2hldGhl
ciB0aGlzCj4gc2hvdWxkIGJlIFBDSS1zcGVjaWZpYywgb3Igd2hldGhlciBpdCB3b3VsZG4ndCBi
ZXR0ZXIgYmUgYSBtb3JlCj4gZ2VuZXJhbCBkZXZpY2UgdGhpbmcuIEJ1dCBJIGd1ZXNzIHdlIHVz
ZSBTQkRGIGFsc28gaW5kZXBlbmRlbnQgb2YKPiBzdHJ1Y3QgcGNpX2Rldi4KClNlZSBwYXRjaCA0
IHdoaWNoIGludHJvZHVjZXMgYSBwcmludGYgZm9ybWF0IHNwZWNpZmllciBmb3IgcGNpX3NiZGZf
dC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
