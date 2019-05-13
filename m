Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0111B879
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:39:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQC4U-0002Rf-W9; Mon, 13 May 2019 14:36:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQC4T-0002RX-5d
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:36:53 +0000
X-Inumbo-ID: 8bf838b0-758c-11e9-a4ba-df97382236e1
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bf838b0-758c-11e9-a4ba-df97382236e1;
 Mon, 13 May 2019 14:36:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85391322"
Date: Mon, 13 May 2019 15:36:49 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190513143649.GQ2798@zion.uk.xensource.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
 <20190513134714.3124-4-wei.liu2@citrix.com>
 <5CD97EC4020000780022E2E4@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD97EC4020000780022E2E4@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH 3/4] README: document that `python` is
 required
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
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDg6Mjc6MTZBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDEzLjA1LjE5IGF0IDE1OjQ3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS9SRUFETUUKPiA+ICsrKyBiL1JFQURNRQo+ID4gQEAgLTE4MSw2ICsxODEs
MTAgQEAgVmFyaW91cyB0b29scywgc3VjaCBhcyBweWdydWIsIGhhdmUgdGhlIGZvbGxvd2luZyBy
dW50aW1lIGRlcGVuZGVuY2llczoKPiA+ICAgICAgICAgICAgVVJMOiAgICBodHRwOi8vd3d3LnB5
dGhvbi5vcmcvIAo+ID4gICAgICAgICAgICBEZWJpYW46IHB5dGhvbgo+ID4gIAo+ID4gK05vdGUg
dGhhdCB0aGUgYnVpbGQgc3lzdGVtIGV4cGVjdHMgYHB5dGhvbmAgdG8gYmUgYXZhaWxhYmxlLiBJ
ZiB5b3VyIHN5c3RlbQo+ID4gK29ubHkgaGFzIGBweXRob24yYCBvciBgcHl0aG9uM2AgYnV0IG5v
dCBgcHl0aG9uYCAoYXMgaW4gTGludXggRnJvbSBTY3JhdGNoKSwKPiA+ICt5b3Ugd2lsbCBuZWVk
IHRvIGNyZWF0ZSBhIHN5bWxpbmsgZm9yIGl0Lgo+IAo+IElzIGNyZWF0aW5nIGEgc3ltbGluayBp
bmRlZWQgdGhlIG9ubHkgb3B0aW9uPyBXaGF0IGFib3V0IHNwZWNpZnlpbmcKPiBQWVRIT049IG9u
IHRoZSBtYWtlIGNtZGxpbmU/IEkgZG9uJ3QgbWVhbiB0byBzYXkgdGhlIHNldCBvZgo+IHdvcmth
cm91bmRzIG5lZWRzIHRvIGJlIGV4aGF1c3RpdmUgaGVyZSwgYnV0IHBlcmhhcHMgYWRkIGF0Cj4g
bGVhc3QgImUuZy4iIGlmIHRoZXJlIGFyZSBvdGhlciBvcHRpb25zIGFzIHdlbGw/CgpYZW4ncyBi
dWlsZCBzeXN0ZW0gaXMgc3RyYW5nZSBpbiB0aGF0CgogICBtYWtlIEE9QgoKaXMgbm90IHRoZSBz
YW1lIGFzIAoKICAgQT1CIG1ha2UKCi4KCkluIHByYWN0aWNlIHRoaXMgaGFzIGJpdHRlbiBhIGZl
dyBwZW9wbGUgaW4gdGhlIHBhc3QuIFRoYXQncyB3aHkgSSBvcHRlZAp0byBub3QgbWVudGlvbiB0
aGF0IHZhcmlhbnQuCgpCdXQgc2luY2UgeW91IGFzaywgSSBjYW4gYWRkIGl0IHRvIG5leHQgdmVy
c2lvbi4KCldlaS4KCj4gCj4gSmFuCj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
