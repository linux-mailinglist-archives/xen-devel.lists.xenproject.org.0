Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5CE15339D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 16:05:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izMDK-00074a-Pn; Wed, 05 Feb 2020 15:03:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izMDJ-00074V-BA
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 15:03:37 +0000
X-Inumbo-ID: af741ef2-4828-11ea-9123-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af741ef2-4828-11ea-9123-12813bfff9fa;
 Wed, 05 Feb 2020 15:03:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izMDI-0007uX-1i; Wed, 05 Feb 2020 15:03:36 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izMDH-0001nO-Ob; Wed, 05 Feb 2020 15:03:35 +0000
Date: Wed, 5 Feb 2020 15:03:32 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20200205150332.zz5z2vbh6gfg4rew@debian>
References: <20200204153704.15934-1-liuwe@microsoft.com>
 <20200204153704.15934-6-liuwe@microsoft.com>
 <20200205140416.GT4679@Air-de-Roger>
 <20200205150024.44b5gmjnrzmr6sfr@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205150024.44b5gmjnrzmr6sfr@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v7 05/10] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDM6MDA6MjRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIEZlYiAwNSwgMjAyMCBhdCAwMzowNDoxNlBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+IFsuLi5dCj4gPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJj
YWxsX3BhZ2Uodm9pZCkKPiA+ID4gK3sKPiA+ID4gKyAgICB1bmlvbiBodl94NjRfbXNyX2h5cGVy
Y2FsbF9jb250ZW50cyBoeXBlcmNhbGxfbXNyOwo+ID4gPiArICAgIHVuaW9uIGh2X2d1ZXN0X29z
X2lkIGd1ZXN0X2lkOwo+ID4gPiArICAgIHVuc2lnbmVkIGxvbmcgbWZuOwo+ID4gPiArCj4gPiA+
ICsgICAgQlVJTERfQlVHX09OKEhWX0hZUF9QQUdFX1NISUZUICE9IFBBR0VfU0hJRlQpOwo+ID4g
PiArCj4gPiA+ICsgICAgcmRtc3JsKEhWX1g2NF9NU1JfR1VFU1RfT1NfSUQsIGd1ZXN0X2lkLnJh
dyk7Cj4gPiA+ICsgICAgaWYgKCAhZ3Vlc3RfaWQucmF3ICkKPiA+ID4gKyAgICB7Cj4gPiA+ICsg
ICAgICAgIGd1ZXN0X2lkLnJhdyA9IGdlbmVyYXRlX2d1ZXN0X2lkKCk7Cj4gPiA+ICsgICAgICAg
IHdybXNybChIVl9YNjRfTVNSX0dVRVNUX09TX0lELCBndWVzdF9pZC5yYXcpOwo+ID4gPiArICAg
IH0KPiA+ID4gKwo+ID4gPiArICAgIHJkbXNybChIVl9YNjRfTVNSX0hZUEVSQ0FMTCwgaHlwZXJj
YWxsX21zci5hc191aW50NjQpOwo+ID4gPiArICAgIGlmICggIWh5cGVyY2FsbF9tc3IuZW5hYmxl
ICkKPiA+ID4gKyAgICB7Cj4gPiA+ICsgICAgICAgIG1mbiA9IEhWX0hDQUxMX01GTjsKPiA+ID4g
KyAgICAgICAgaHlwZXJjYWxsX21zci5lbmFibGUgPSAxOwo+ID4gPiArICAgICAgICBoeXBlcmNh
bGxfbXNyLmd1ZXN0X3BoeXNpY2FsX2FkZHJlc3MgPSBtZm47Cj4gPiA+ICsgICAgICAgIHdybXNy
bChIVl9YNjRfTVNSX0hZUEVSQ0FMTCwgaHlwZXJjYWxsX21zci5hc191aW50NjQpOwo+ID4gPiAr
ICAgIH0KPiA+ID4gKyAgICBlbHNlCj4gPiA+ICsgICAgICAgIG1mbiA9IGh5cGVyY2FsbF9tc3Iu
Z3Vlc3RfcGh5c2ljYWxfYWRkcmVzczsKPiA+IAo+ID4gSXMgaXQgZXhwZWN0ZWQgdGhhdCB0aGUg
Z3Vlc3QgSUQgb3IgdGhlIGh5cGVyY2FsIHBhZ2UgaXMgYWxyZWFkeQo+ID4gc2V0dXA/Cj4gPiAK
PiA+IEllOiB3b3VsZCB2aXJ0dWFsIGZpcm13YXJlIHNldHVwIGFueSBvZiB0aGlzPyAoYW5kIG5v
dCBjbGVhbiBpdCB1cAo+ID4gYWZ0ZXJ3YXJkcykKPiAKPiBUaGVyZSBpcyBubyBkZWZpbml0aXZl
IGFuc3dlciB0byB3aHkvd2hlbiB0aGlzIGhhcHBlbnMgaW4gVExGUywgYnV0IGl0Cj4gZG9lcyBy
ZXF1aXJlIGd1ZXN0IHRvIHJlc3BlY3QgdGhhdCBpcyBhbHJlYWR5IGluIHRoZSBNU1IuCgpNeSBn
dWVzcyB3b3VsZCBiZSBhZnRlciBtaWdyYXRpb24gSHlwZXItViBzZXRzIHVwIHRoZSBzYW1lIE1T
Ui9wYWdlCkZXSVcuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
