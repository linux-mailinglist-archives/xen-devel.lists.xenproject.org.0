Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7A9188C9D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 18:53:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEGNS-0000gN-AB; Tue, 17 Mar 2020 17:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=53vu=5C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jEGNQ-0000gH-Sd
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 17:51:40 +0000
X-Inumbo-ID: f488976a-6877-11ea-92cf-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f488976a-6877-11ea-92cf-bc764e2007e4;
 Tue, 17 Mar 2020 17:51:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F28D20714;
 Tue, 17 Mar 2020 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584467499;
 bh=qIYcfKhw/0Dyrl/1SmgQY2B8J4yO5KKfM3U4cXXRaqo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BI5S+QOVvcaEbmXP51w3iavMMeBhW/9SxnUAE9i6FfErfVlSpoLA4+93ZrlEroZtF
 gBfvaAA21Go1cWLfQhbZQ413RnisRfSYxTcSQJ6KRiJpZXg+RSY2++Zslbg2GBNdPS
 hwh5rjJPtIFnZ67yZDlVhW8iSCqf7uGPl4mFV57o=
Date: Tue, 17 Mar 2020 10:51:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
In-Reply-To: <72604419-b3a1-3c14-c937-07d9ec7fd62b@xen.org>
Message-ID: <alpine.DEB.2.21.2003171051280.1846@sstabellini-ThinkPad-T480s>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-3-anthony.perard@citrix.com>
 <alpine.DEB.2.21.2003131605490.1269@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2003131614160.1269@sstabellini-ThinkPad-T480s>
 <72604419-b3a1-3c14-c937-07d9ec7fd62b@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [XEN PATCH v3 2/2] xen/arm: Configure early printk
 via Kconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNyBNYXIgMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDEz
LzAzLzIwMjAgMjM6MTQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIEZyaSwgMTMg
TWFyIDIwMjAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gT24gTW9uLCA5IE1hciAy
MDIwLCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+ID4gPiBBdCB0aGUgbW9tZW50LCBlYXJseSBw
cmludGsgY2FuIG9ubHkgYmUgY29uZmlndXJlZCBvbiB0aGUgbWFrZSBjb21tYW5kCj4gPiA+ID4g
bGluZS4gSXQgaXMgbm90IHZlcnkgaGFuZHkgYmVjYXVzZSBhIHVzZXIgaGFzIHRvIHJlbW92ZSB0
aGUgb3B0aW9uCj4gPiA+ID4gZXZlcnl0aW1lIGl0IGlzIHVzaW5nIGFub3RoZXIgY29tbWFuZCBv
dGhlciB0aGFuIGNvbXBpbGluZyB0aGUKPiA+ID4gPiBoeXBlcnZpc29yLgo+ID4gPiA+IAo+ID4g
PiA+IEZ1cnRoZXJtb3JlLCBlYXJseSBwcmludGsgaXMgb25lIG9mIHRoZSBmZXcgb2RkcyBvbmUg
dGhhdCBhcmUgbm90Cj4gPiA+ID4gdXNpbmcgS2NvbmZpZy4KPiA+ID4gPiAKPiA+ID4gPiBTbyB0
aGlzIGlzIGFib3V0IHRpbWUgdG8gbW92ZSBpdCB0byBLY29uZmlnLgo+ID4gPiA+IAo+ID4gPiA+
IFRoZSBuZXcga2NvbmZpZ3Mgb3B0aW9ucyBhbGxvdyBhIHVzZXIgdG8gZWF0aGVyIHNlbGVjdCBh
IFVBUlQgZHJpdmVyCj4gPiA+ID4gdG8gdXNlIGF0IGJvb3QgdGltZSwgYW5kIHNldCB0aGUgcGFy
YW1ldGVycywgb3IgaXQgaXMgc3RpbGwgcG9zc2libGUKPiA+ID4gPiB0byBzZWxlY3QgYSBwbGF0
Zm9ybSB3aGljaCB3aWxsIHNldCB0aGUgcGFyYW1ldGVycy4KPiA+ID4gPiAKPiA+ID4gPiBJZiBD
T05GSUdfRUFSTFlfUFJJTlRLIGlzIHByZXNlbnQgaW4gdGhlIGVudmlyb25tZW50IG9yIG9uIHRo
ZSBtYWtlCj4gPiA+ID4gY29tbWFuZCBsaW5lLCBtYWtlIHdpbGwgcmV0dXJuIGFuIGVycm9yLgo+
ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+Cj4gPiA+ID4gCj4gPiA+ID4gLS0tCj4gPiA+ID4gCj4gPiA+ID4g
T3JpZ2luYWwgcGF0Y2g6Cj4gPiA+ID4gICAgICBbUEFUQ0ggZm9yLTQuMTNdIHhlbi9hcm06IEFk
ZCBTa2VsZXRvbiBmb3IgdXNpbmcgY29uZmlndXJpbmcgZWFybHkKPiA+ID4gPiBwcmludGsgdXNp
bmcgS2NvbmZpZwo+ID4gPiA+ICAgICAgPDIwMTkwOTEzMTAzOTUzLjgxODItMS1qdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAKPiA+ID4gPiBOb3RlczoKPiA+ID4gPiAg
ICAgIHYzOgo+ID4gPiA+ICAgICAgLSByZW5hbWUgRUFSTFlfUFJJTksgdG8gQ09ORklHX0VBUkxZ
X1BSSU5USyBpbiBtYWtlZmlsZSBoZXJlICh3aGljaAo+ID4gPiA+ICAgICAgICBzZWxlY3Qgd2hp
Y2ggb2JqZWN0IHRvIGJ1aWxkKS4KPiA+ID4gPiAgICAgIC0gcmVuYW1lIEVBUkxZX1VBUlRfQkFV
RF9SQVRFIHRvIEVBUkxZX1VBUlRfUEwwMTFfQkFVRF9SQVRFCj4gPiA+ID4gICAgICAtIHR5cG9z
Cj4gPiA+ID4gICAgICAtIGRyb3AgdGhlIGxpc3Qgb2YgYWxpYXNlcyBpbiBlYXJseS1wcmludGsu
dHh0LiBLY29uZmlnIGNob2ljZSBtZW51Cj4gPiA+ID4gICAgICAgIHNob3VsZCBiZSBlbm91Z2gu
Cj4gPiA+ID4gICAgICAtIHJld29yZCBlYXJseS1wcmludGsudHh0Lgo+ID4gPiA+ICAgICAgLSBy
ZXdvcmsgaG93IEVBUkxZX1BSSU5USyBpcyBzZXQgdG8gWQo+ID4gPiA+ICAgICAgICBhbmQgdXNl
IHRoYXQgaW5zdGVhZCBvZiBhIGxpc3Qgb2YgYWxsIEVBUkxZX1VBUlRfKgo+ID4gPiA+ICAgICAg
LSBBZGQgYSBjaGVjayB0byBhc2sgdXNlciB0byB1c2UgS2NvbmZpZyB0byBzZXQgZWFybHkgcHJp
bnRrLgo+ID4gPiA+ICAgICAgLSByZXdvcmsgdGhlIHBvc3NpYmxlIGNob2ljZSB0byBoYXZlIGFs
bCB1YXJ0IGRyaXZlciBhbmQgcGxhdGZvcm0KPiA+ID4gPiAgICAgICAgc3BlY2lmaWMgb3B0aW9u
IHRvZ2V0aGVyLgo+ID4gPiA+ICAgICAgLSBoYXZlIGFkZGVkIG9yIHJld29yZCBwcm9tcHQgYW5k
IGhlbHAgbWVzc2FnZXMgb2YgdGhlIGRpZmZlcmVudAo+ID4gPiA+ICAgICAgICBvcHRpb25zLiBU
aGUgcGxhdGZvcm0gc3BlY2lmaWMgb3B0aW9uIGRvbid0IGhhdmUgZXh0ZW5kZWQgaGVscCwKPiA+
ID4gPiB0aGUKPiA+ID4gPiAgICAgICAgcHJvbXB0IGlzIHByb2JhYmx5IGVub3VnaC4KPiA+ID4g
PiAgICAgICAgKFRoZSBub24tcGxhdGZvcm0gc3BlY2lmaWMgb3B0aW9ucyBoYXZlIHRoZSBoZWxw
IG1lc3NhZ2UgdGhhdAo+ID4gPiA+IEp1bGllbgo+ID4gPiA+ICAgICAgICBoYXZlIHdyaXR0ZW4g
aW4gdGhlIGZpcnN0IHZlcnNpb24uKQo+ID4gPiA+ICAgICAgLSBoYXZlIG1hZGUgRUFSTFlfVUFS
VF9JTklUIGRlcGVuZGVudCBvbiB0aGUgdmFsdWUgb2YKPiA+ID4gPiAgICAgICAgRUFSTFlfVUFS
VF9QTDAxMV9CQVVEX1JBVEUgc28gdGhhdCB0aGVyZSBpcyBubyBuZWVkIHRvIGV4cG9zZQo+ID4g
PiA+IF9JTklUIHRvCj4gPiA+ID4gICAgICAgIHVzZXJzLgo+ID4gPiA+IAo+ID4gPiAKPiA+ID4g
VGhlIHBhdGNoIGlzIGZpbmUgYnkgbWUuIEkgb25seSBoYXZlIG9uZSB2ZXJ5IG1pbm9yIGNvbW1l
bnQgYmVsb3cuCj4gPiAKPiA+IEkgZm9yZ290IHRvIGFkZAo+ID4gCj4gPiBUZXN0ZWQtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPiBUaGFuayB5b3Ug
Zm9yIHRoZSB0ZXN0aW5nLiBUaGlzIHBhdGNoIGNvbnRhaW5zIGEgcXVlc3Rpb24gZm9yIHlvdSAo
c2VlIFsxXSkuCj4gQ2FuIHlvdSBwbGVhc2UgdGFrZSBhIGxvb2s/Cj4gCj4gQ2hlZXJzLAo+IAo+
IFsxXSA8NzcyMGY1NGUtN2VmNy05ZGFlLWRmZGItMzhiODlhMDg5MmE2QHhlbi5vcmc+CgpTbyB0
aGUgcXVlc3Rpb24gaXM6Cgo+IEkgbm90aWNlZCBiZWxvdyB5b3UgYWRkZWQgImRlcGVuZHMgb24g
QVJNXzY0IiBvbiB0aGUgWGlsaW54IFNvQy4gSW4gCj4gZ2VuZXJhbCwgcGxhdGZvcm0gc3BlY2lm
aWMgb3B0aW9ucyBhcmUgdGllZCB0byBlaXRoZXIgYXJtMzIgb3IgYXJtNjQsIAo+IGV2ZW4gaWYg
dGhlIFVBUlQgImRyaXZlciIgaXMgYXJjaCBhZ25vc3RpYy4KPiAKPiBZb3UgY291bGQgdGVjaG5p
Y2FsbHkgYm9vdCBYZW4gb24gQXJtIDMyLWJpdCBvbiBBcm12OCBIVyBwcm92aWRlZCB0aGV5IAo+
IHN1cHBvcnQgMzItYml0IGF0IHRoZSBoeXBlcnZpc29yIGxldmVsLCBidXQgd2UgbmV2ZXIgc3Vw
cG9ydGVkIHRoaXMgCj4gY2FzZS4gU28gSSBhbSB3b25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQg
YWRkIGRlcGVuZHMgb24gZWFjaCAKPiBlYXJseXByaW50ay4gU3RlZmFubywgYW55IG9waW5pb25z
PwoKV2VsbCBzcG90dGVkLgoKWGlsaW54IGRvZXNuJ3Qgc3VwcG9ydCAzMi1iaXQgWGVuIG9uIHRo
ZWlyIGJvYXJkcywgInN1cHBvcnQiIGFzIGluIHRlc3QsCnJ1biBvciB2YWxpZGF0ZS4gU28gaXQg
d291bGQgbm90IGJlIGEgcHJvYmxlbSBmcm9tIFhpbGlueCBwb2ludCBvZiB2aWV3CnRvIGFkZCBh
ICJkZXBlbmRzIG9uIEFSTV82NCIuCgpJIHRha2UgdGhhdCB5b3UgYXJlIHN1Z2dlc3RpbmcgYWRk
aW5nICJkZXBlbmRzIG9uIEFSTV82NC8zMiIgdW5kZXIgdGhlCmxlZ2FjeSBwbGF0Zm9ybSBlYXJs
eXByaW50ayBvcHRpb25zLCBmcm9tIEVBUkxZX1BSSU5US19CUkNNIHRvCkVBUkxZX1BSSU5US19a
WU5RTVAgcmlnaHQ/IElmIHNvLCBJIGFtIGZpbmUgd2l0aCBpdCwgYW5kIGl0IHNlZW1zIGxpa2Ug
YQpnb29kIGlkZWEuCgpUaGUgb3RoZXIgbmV3IGdlbmVyaWMgZWFybHlwcmludGsgb3B0aW9ucywg
dGhlIG9uZXMgdGhhdCBvbmx5IGRlcGVuZCBvbgp0aGUgdWFydCBkcml2ZXIsIGZyb20gRUFSTFlf
VUFSVF9DSE9JQ0VfODI1MCB0byBFQVJMWV9VQVJUX0NIT0lDRV9TQ0lGLAppdCBmZWVscyBtb3Jl
IG5hdHVyYWwgdG8gbGVhdmUgdGhlbSB3aXRob3V0IGEgc3BlY2lmaWMgYXJjaCBkZXBlbmRlbmN5
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
