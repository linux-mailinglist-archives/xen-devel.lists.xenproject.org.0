Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD451B8CC
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:43:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQC8K-0003Sw-Kg; Mon, 13 May 2019 14:40:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rpFc=TN=citrix.com=prvs=0298122e9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hQC8I-0003Sj-T8
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:40:50 +0000
X-Inumbo-ID: 19beb197-758d-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 19beb197-758d-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:40:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,465,1549929600"; d="scan'208";a="85391574"
Date: Mon, 13 May 2019 15:40:42 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Message-ID: <20190513144042.GR2798@zion.uk.xensource.com>
References: <20190513134714.3124-1-wei.liu2@citrix.com>
 <20190513134714.3124-4-wei.liu2@citrix.com>
 <62fa5069-b65b-e540-1981-a464e84c076a@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62fa5069-b65b-e540-1981-a464e84c076a@citrix.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDM6Mzg6MjRQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiA1LzEzLzE5IDI6NDcgUE0sIFdlaSBMaXUgd3JvdGU6Cj4gPiBUaGUgaHlwZXJ2
aXNvciBidWlsZCBzeXN0ZW0gcmVxdWlyZXMgYHB5dGhvbmAuIFRvIGF2b2lkIHB1dHRpbmcgdG9v
Cj4gPiBtdWNoIChjb25mdXNpbmcpIGluZm9ybWF0aW9uIGluIFJFQURNRSwgbWFuZGF0ZSBhdmFp
bGFiaWxpdHkgb2YKPiA+IGBweXRob25gLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4gLS0tCj4gPiAgUkVBRE1FIHwgNCArKysrCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvUkVB
RE1FIGIvUkVBRE1FCj4gPiBpbmRleCAyM2U0ZjdjM2RjLi5hNjBjY2Y2ZTljIDEwMDY0NAo+ID4g
LS0tIGEvUkVBRE1FCj4gPiArKysgYi9SRUFETUUKPiA+IEBAIC0xODEsNiArMTgxLDEwIEBAIFZh
cmlvdXMgdG9vbHMsIHN1Y2ggYXMgcHlncnViLCBoYXZlIHRoZSBmb2xsb3dpbmcgcnVudGltZSBk
ZXBlbmRlbmNpZXM6Cj4gPiAgICAgICAgICAgIFVSTDogICAgaHR0cDovL3d3dy5weXRob24ub3Jn
Lwo+ID4gICAgICAgICAgICBEZWJpYW46IHB5dGhvbgo+ID4gIAo+ID4gK05vdGUgdGhhdCB0aGUg
YnVpbGQgc3lzdGVtIGV4cGVjdHMgYHB5dGhvbmAgdG8gYmUgYXZhaWxhYmxlLiBJZiB5b3VyIHN5
c3RlbQo+ID4gK29ubHkgaGFzIGBweXRob24yYCBvciBgcHl0aG9uM2AgYnV0IG5vdCBgcHl0aG9u
YCAoYXMgaW4gTGludXggRnJvbSBTY3JhdGNoKSwKPiA+ICt5b3Ugd2lsbCBuZWVkIHRvIGNyZWF0
ZSBhIHN5bWxpbmsgZm9yIGl0Lgo+IAo+IFNpbmNlIHdlJ3JlIG5vdCBpbiBhIHJlbGVhc2UgY3J1
bmNoIGFueSBtb3JlLCBpdCBzZWVtcyBsaWtlIHVwZGF0aW5nCj4gLi9jb25maWd1cmUgdG8gbG9v
ayBmb3IgIiJweXRob24zIiwgInB5dGhvbjIiLCBhbmQgInB5dGhvbiIgKHByb2JhYmx5IGluCj4g
dGhhdCBvcmRlcikgd291bGQgYmUgYSBiZXR0ZXIgc29sdXRpb24gaGVyZS4KCk5vLCBpdCBpcyBu
b3QgYWJvdXQgdG9vbHMgYnVpbGQuIEh5cGVydmlzb3IgYnVpbGQgZGVwZW5kcyBvbiBgcHl0aG9u
YApidXQgd2UgZG9uJ3Qgd2FudCBpdCB0byBkZXBlbmQgb24gY29uZmlndXJlLgoKU2VlICJIeXBl
cnZpc29yIGJ1aWxkIGNhbid0IHdvcmsgd2l0aG91dCBgcHl0aG9uYCAoV2FzOiBSZTogWGVuIGNv
bW1pdAo5YjBiYzkxYjMgcG9zc2libHkgcmVtb3ZlZCB0b28gbXVjaCBpbmZvIGZyb20gUkVBRE1F
KSIKCldlaS4KCj4gCj4gIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
