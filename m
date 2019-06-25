Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DC35252B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 09:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfg8S-0001YI-LM; Tue, 25 Jun 2019 07:45:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ez/b=UY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hfg8Q-0001YD-7V
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 07:44:58 +0000
X-Inumbo-ID: 206080f7-971d-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 206080f7-971d-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 07:44:56 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: tVsORZX1a6xFxuI/lOintSg1zAaBIfPaKsqWUPvY/BPAqnuG7H7uOWzwPLp4jRYlsSe/QWBvyy
 76r3pxeEG7ngKl1sn7KBBSb9d5ig1ktvkSrIqiylBD76xUTmu4afPSlQXW4n+493yhTUeY2P/W
 wsIzRVp9w1yv2vzrlw54ZaLsH4xVQD5s3qsYR0pO03xvF45p+JT+oYdpPDm8lhA4G3fmhpUSI9
 rdAFBdxOnl/X0nkj19sjThDgUcOBQn6FsAW5FXB7NdJaRmm4k140AXRbx0AJiHTLRn/Q8lJxAw
 liE=
X-SBRS: 2.7
X-MesageID: 2181309
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,415,1557201600"; 
   d="scan'208";a="2181309"
Date: Tue, 25 Jun 2019 09:44:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20190625074446.ywkgkesi6fbooslx@MacBook-Air-de-Roger.local>
References: <alpine.DEB.2.21.1906241135080.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1906241146530.2468@sstabellini-ThinkPad-T480s>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] PCI Passthrough bug with x86 HVM
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
Cc: jgross@suse.com, wl@xen.org, andrew.cooper3@citrix.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, chao.gao@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMjQsIDIwMTkgYXQgMTE6NDc6MDlBTSAtMDcwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+ICsgeGVuLWRldmVsCj4gCj4gT24gTW9uLCAyNCBKdW4gMjAxOSwgU3RlZmFu
byBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gSGkgYWxsLAo+ID4gCj4gPiBJIG1pZ2h0IGhhdmUgZm91
bmQgYSBidWcgd2l0aCBQQ0kgcGFzc3Rocm91Z2ggdG8gYSBMaW51eCBIVk0gZ3Vlc3Qgb24KPiA+
IHg4NiB3aXRoIFhlbiA0LjEyLiBJdCBpcyBub3QgZWFzeSBmb3IgbWUgdG8gZ2V0IGFjY2Vzcywg
YW5kIGVzcGVjaWFsbHkKPiA+IGNoYW5nZSBjb21wb25lbnRzLCBvbiB0aGlzIHBhcnRpY3VsYXIg
c3lzdGVtLCBhbmQgSSBkb24ndCBoYXZlIGFjY2VzcyB0bwo+ID4gb3RoZXIgeDg2IGJveGVzIGF0
IHRoZSBtb21lbnQsIHNvIGFwb2xvZ2llcyBmb3IgdGhlIHBhcnRpYWwgaW5mb3JtYXRpb24KPiA+
IHJlcG9ydC4gVGhlIHNldHVwIGlzIGFzIGZvbGxvdzoKPiA+IAo+ID4gLSB0d28gUENJIGRldmlj
ZXMgaGF2ZSBiZWVuIGFzc2lnbmVkIHRvIGEgSFZNIGd1ZXN0LCBldmVyeXRoaW5nIGlzIGZpbmUK
PiA+IC0gcmVib290IHRoZSBndWVzdCBmcm9tIGluc2lkZSwgaS5lLiBgcmVib290JyBpbiBMaW51
eAo+ID4gLSBhZnRlciB0aGUgcmVib290IGNvbXBsZXRlcywgb25seSBvbmUgZGV2aWNlIGlzIGFz
c2lnbmVkCgpDYW4geW91IHByb3ZpZGUgdGhlIHhsIGRlYnVnIGxvZyBvZiB0aGUgd2hvbGUgcHJv
Y2Vzcz8KCj4gPiBCZWZvcmUgdGhlIHJlYm9vdCwgSSBzZWUgYWxsIHRoZSBhcHByb3ByaWF0ZSB4
ZW5zdG9yZSBlbnRyaWVzIGZvciBib3RoCj4gPiBkZXZpY2VzLiBFdmVyeXRoaW5nIGlzIGZpbmUu
IEFmdGVyIHRoZSByZWJvb3QsIEkgY2FuIG9ubHkgc2VlIHRoZQo+ID4geGVuc3RvcmUgZW50cmll
cyBvZiBvbmUgZGV2aWNlLiBJdCBpcyBhcyBpZiB0aGUgb3RoZXIgZGV2aWNlCj4gPiAiZGlzYXBw
ZWFyZWQiIHdpdGhvdXQgdGhyb3dpbmcgYW55IGVycm9ycy4KClNvIHRoZXJlIGFyZSBubyBlcnJv
cnMgb24gdGhlIGh5cGVydmlzb3IgZG1lc2cgb3IgdGhlIHhsIGxvZ3MgYXQgYWxsPwoKPiA+IEhh
dmUgeW91IHNlZW4gdGhpcyBiZWZvcmU/IERvIHlvdSBrbm93IGlmIGl0IGhhcyBiZWVuIGZpeGVk
IGluIHN0YWdpbmc/Cj4gPiBJIG5vdGljZWQgdGhpcyBmaXggd2hpY2ggc2VlbXMgdG8gYmUgdmVy
eSByZWxldmFudDoKPiA+IAo+ID4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDE4LTExL21zZzAxNjE2Lmh0bWwKPiA+IAo+ID4gYnV0IGl0IGlz
IGFscmVhZHkgaW5jbHVkZWQgaW4gNC4xMi4KCkFGQUlDVCB5b3VyIGlzc3VlIHNlZW1zIHJlbGF0
ZWQgdG8geGwvbGlieGwgbm90IHByb3Blcmx5IHJlLWFkZGluZyB0aGUKZGV2aWNlcyBvbiByZWJv
b3QuIFRoZSBmaXggYWJvdmUgaGFkIHRvIGRvIHdpdGggbGVhdmluZyBkZXZpY2VzIGluIGEKYnJv
a2VuIHN0YXRlIHVuZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcyAoaWU6IHRoZXkgd2hlcmUgYWx3YXlz
IGF0dGFjaGVkCnRvIHRoZSBndWVzdCwganVzdCBub3Qgd29ya2luZyBwcm9wZXJseSkuCgpUaGFu
a3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
