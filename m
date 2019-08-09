Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D5487B01
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 15:22:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw4oW-0007i5-IF; Fri, 09 Aug 2019 13:20:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7QoQ=WF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hw4oV-0007hz-FV
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:20:11 +0000
X-Inumbo-ID: 688b6371-baa8-11e9-8980-bc764e045a96
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 688b6371-baa8-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 13:20:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 06:20:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="186666673"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2019 06:20:07 -0700
Date: Fri, 9 Aug 2019 21:24:14 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190809132412.GA12877@gao-cwp>
References: <20190809083831.GA30839@gao-cwp>
 <e6e17b65-3d91-84fa-1831-571676503e2c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6e17b65-3d91-84fa-1831-571676503e2c@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMTA6NDk6MzJBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwOS4wOC4yMDE5IDEwOjM4LCBDaGFvIEdhbyB3cm90ZToKPj5JIGhhdmUgYSBkZXZp
Y2Ugd2hpY2ggb25seSBzdXBwb3J0cyBzZWNvbmRhcnkgYnVzIHJlc2V0LiBBZnRlciBiZWluZwo+
PmFzc2lnbmVkIHRvIGEgVk0sIGl0IHdvdWxkIGJlIHBsYWNlZCB1bmRlciBob3N0IGJyaWRnZS4g
Rm9yIGRldmljZXMKPj51bmRlciBob3N0IGJyaWRnZSwgc2Vjb25kYXJ5IGJ1cyByZXNldCBpcyBu
b3QgYXBwbGljYWJsZS4gVGh1cywgYSBWTQo+PmhhcyBubyB3YXkgdG8gcmVzZXQgdGhpcyBkZXZp
Y2UuCj4+Cj4+VGhpcyBkZXZpY2UncyB1c2FnZSB3b3VsZCBiZSBsaW1pdGVkIHdpdGhvdXQgUENJ
IHJlc2V0IChmb3IgZXhhbXBsZSwgaXRzCj4+ZHJpdmVyIGNhbm5vdCByZS1pbml0aWFsaXplIHRo
ZSBkZXZpY2UgcHJvcGVybHkgd2l0aG91dCBQQ0kgcmVzZXQsIHdoaWNoCj4+bWVhbnMgaW4gVk0g
ZGV2aWNlIHdvbid0IGJlIHVzYWJsZSBhZnRlciB1bmxvYWRpbmcgdGhlIGRyaXZlciksIGl0IHdv
dWxkCj4+YmUgbXVjaCBiZXR0ZXIgaWYgdGhlcmUgaXMgYSB3YXkgYXZhaWxhYmxlIHRvIFZNcyB0
byByZXNldCB0aGUgZGV2aWNlLgo+Pgo+PkluIG15IG1pbmQsIGEgc3RyYWlnaHRmb3dhcmQgc29s
dXRpb24gaXMgdG8gY3JlYXRlIGEgdmlydHVhbCBicmlkZ2UKPj5mb3IgYSBWTSBhbmQgcGxhY2Ug
dGhlIHBhc3MtdGhydSBkZXZpY2UgdW5kZXIgYSB2aXJ0dWFsIGJyaWRnZS4gQnV0IGl0Cj4+aXNu
J3Qgc3VwcG9ydGVkIGluIFhlbiAoS1ZNL1FFTVUgc3VwcG9ydHMpIGFuZCBlbmFibGluZyBpdCBs
b29rcyBuZWVkCj4+YSBsb3Qgb2YgZWZmb3J0cy4KPgo+TWVhbndoaWxlIEkgdGhpbmsgYSBjb3Vw
bGUgb2YgeWVhcnMgYWdvIHRoZXJlIHdhcyBzb21lIGluaXRpYWwgZWZmb3J0Cj50byBnZXQgYSBu
ZXdlciBjaGlwc2V0IChRMzUgaWlyYykgZW11bGF0ZWQgZm9yIEhWTSBndWVzdHMuCgpZZXMuIEJ1
dCBpdCBzZWVtcyB0aGF0IG5vIG9uZSBpcyB3b3JraW5nIG9uIHRoaXMgZmVhdHVyZSBub3cuCgo+
Cj4+QWx0ZXJuYXRpdmVseSwgZW11bGF0aW5nIEZMUiAoRnVuY3Rpb24gTGV2ZWwgUmVzZXQpCj4+
Y2FwYWJpbGl0eSBmb3IgdGhpcyBkZXZpY2UgbWlnaHQgYmUgYSBmZWFzaWJsZSB3YXkgYW5kIG9u
bHkgbmVlZHMKPj5yZWxhdGl2ZWx5IGZldyBjaGFuZ2VzLiBJIGFtIHBsYW5uaW5nIHRvIGVuYWJs
ZSBhbiBvcHQtaW4gZmVhdHVyZQo+PihsaWtlICdwZXJtaXNzaXZlJykgdG8gYWxsb3cgcWVtdSB0
byBleHBvc2UgRkxSIGNhcGFiaWxpdHkgdG8gZ3Vlc3QgZm9yCj4+cGFzcy10aHJ1IGRldmljZXMg
YXMgbG9uZyBhcyB0aGlzIGRldmljZSBpcyByZXNldGFibGUgb24gZG9tMCAoaS5lLiB0aGUKPj5k
ZXZpY2UgaGFzICdyZXNldCcgYXR0cmlidXRlIHVuZGVyIGl0cyBzeXNmcykuIEFuZCB3aGVuIGd1
ZXN0IGluaXRpYXRlcwo+PmFuIEZMUiwgcWVtdSBqdXN0IGVjaG8gMSB0byB0aGUgJ3Jlc2V0JyBh
dHRyaWJ1dGUgb24gZG9tMC4KPj4KPj5EbyB5b3UgdGhpbmsgZW11bGF0aW5nIEZMUiBjYXBhYmls
aXR5IGlzIGRvYWJsZT8KPgo+V291bGRuJ3QgYSBzdWNoIGVtdWxhdGVkIGd1ZXN0IGluaXRpYXRl
ZCByZXNldCBhZmZlY3Qgb3RoZXIgZGV2aWNlcwo+KGxpa2VseSBub3QgdW5kZXIgY29udHJvbCBv
ZiB0aGlzIGd1ZXN0KSBhcyB3ZWxsPwoKTm8uIExpbnV4IGtlcm5lbCBndWFyYW50ZWVzIHRoYXQg
cmVzZXQgdG8gYSBkZXZpY2Ugd29uJ3QgYWZmZWN0Cm90aGVyIGRldmljZXMuIE90aGVyd2lzZSwg
c3VjaCBkZXZpY2UgY2Fubm90IGJlIHJlc2V0IGFuZCBubwoncmVzZXQnIGF0dHJpYnV0ZSB3aWxs
IGJlIGNyZWF0ZWQgdW5kZXIgZGV2aWNlJ3Mgc3lzZnMuClNwZWNmaWNhbGx5LCB0aGUgaW52b2Nh
dGlvbiBvZiBwY2lfZGV2X3Jlc2V0X3Nsb3RfZnVuY3Rpb24oKSBhbmQKcGNpX3BhcmVudF9idXNf
cmVzZXQoKSBpbiBwY2lfcHJvYmVfcmVzZXRfZnVuY3Rpb24oKSB3aWxsIGNoZWNrIHdoZXRoZXIK
dGhlIGRldmljZSAoZnVuY3Rpb24pIGlzIHRoZSBvbmx5IG9uZSB1bmRlciB0aGUgc2xvdCBvciBi
dXMKcmVzcGVjdGl2ZWx5LiBJbiBwY2lfY3JlYXRlX2NhcGFiaWxpdGllc19zeXNmcygpLCAncmVz
ZXQnIGF0dHJpYnV0ZSBpcwpjcmVhdGVkIG9ubHkgaWYgZGV2LT5yZXNldF9mbiBpcyBub3QgemVy
by4gCgpUaGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
