Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88ACB47E1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 09:08:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA7YG-0007sa-Lw; Tue, 17 Sep 2019 07:05:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yLhv=XM=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1iA7YE-0007sR-DF
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 07:05:26 +0000
X-Inumbo-ID: 847f6a36-d919-11e9-978d-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 847f6a36-d919-11e9-978d-bc764e2007e4;
 Tue, 17 Sep 2019 07:05:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Sep 2019 00:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,515,1559545200"; d="scan'208";a="187379822"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga007.fm.intel.com with ESMTP; 17 Sep 2019 00:05:21 -0700
Date: Tue, 17 Sep 2019 15:09:23 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190917070922.GA10190@gao-cwp>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <3f3ef22a-0a56-ac77-3deb-513031c8baaa@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f3ef22a-0a56-ac77-3deb-513031c8baaa@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v10 00/16] improve late microcode loading
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTA6NDc6MzZBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAxMi4wOS4yMDE5IDA5OjIyLCBDaGFvIEdhbyB3cm90ZToKPj4gVGhpcyBzZXJpZXMg
aW5jbHVkZXMgYmVsb3cgY2hhbmdlczoKPj4gIDEuIFBhdGNoIDEtMTE6IGludHJvZHVjZSBhIGds
b2JhbCBtaWNyb2NvZGUgY2FjaGUgYW5kIHNvbWUgY2xlYW51cAo+PiAgMi4gUGF0Y2ggMTI6IHN5
bmNocm9uaXplIGxhdGUgbWljcm9jb2RlIGxvYWRpbmcKPj4gIDMuIFBhdGNoIDEzOiBzdXBwb3J0
IHBhcmFsbGVsIG1pY3JvY29kZXMgdXBkYXRlIG9uIGRpZmZlcmVudCBjb3Jlcwo+PiAgNC4gUGF0
Y2ggMTQ6IGJsb2NrICNOTUkgaGFuZGxpbmcgZHVyaW5nIG1pY3JvY29kZSBsb2FkaW5nCj4+ICA1
LiBQYXRjaCAxNTogZGlzYWJsZSBsYXRlIHVjb2RlIGxvYWRpbmcgZHVlIHRvIEJERjkwCj4+ICA2
LiBQYXRjaCAxNjogY2FsbCB3YmludmQoKSBjb25kaXRpb25hbGx5Cj4KPkkgZG9uJ3Qga25vdyB3
aHkgaXQgZGlkbid0IG9jY3VyIHRvIG1lIGVhcmxpZXIsIGJ1dCB3aGF0IGFib3V0Cj5wYXJrZWQg
LyBvZmZsaW5lZCBDUFVzPyBUaGV5J2xsIGhhdmUgdGhlaXIgdWNvZGUgdXBkYXRlZCB3aGVuIHRo
ZXkKPmdldCBicm91Z2h0IGJhY2sgb25saW5lLCBidXQgdW50aWwgdGhlbiB0aGVpciB1Y29kZSB3
aWxsIGRpc2FncmVlCj53aXRoIHRoYXQgb2YgdGhlIG9ubGluZSBDUFVzLiBGb3IgdHJ1bHkgb2Zm
bGluZSBDUFVzIHRoaXMgbWF5IGJlCj5maW5lLCBidXQgcGFya2VkIG9uZXMgc2hvdWxkIHByb2Jh
Ymx5IGJlIHVwZGF0ZWQsIHBlcmhhcHMgdmlhIHRoZQo+c2FtZSBhcHByb2FjaCBhcyB1c2VkIHdo
ZW4gQy1zdGF0ZSBkYXRhIGJlY29tZXMgYXZhaWxhYmxlIChzZWUKPnNldF9jeF9wbWluZm8oKSk/
CgpZZXMuIEl0IHByb3ZpZGVzIGEgbWVhbnMgdG8gd2FrZSB1cCB0aGUgcGFya2VkIENQVSBhbmQg
YSBjaGFuY2UgdG8gcnVuCnNvbWUgY29kZSAobGlrZSBsb2FkaW5nIHVjb2RlKS4gQnV0IHBhcmtl
ZCBDUFVzIGFyZSBjbGVhcmVkIGZyb20Kc2libGluZyBpbmZvIGFuZCBjcHVfb25saW5lX21hcCAo
c2VlIF9fY3B1X2Rpc2FibGUoKSkuIElmIHBhcmFsbGVsCnVjb2RlIGxvYWRpbmcgaXMgZXhwZWN0
ZWQgb24gcGFya2VkIENQVXMsIHdlIHNob3VsZCBiZSBhYmxlIHRvCmRldGVybWluZSB0aGUgcHJp
bWFyeSB0aHJlYWRzIGFuZCB0aGUgbnVtYmVyIG9mIGNvcmVzIG5vIG1hdHRlciBpdCBpcwpvbmxp
bmUgb3IgcGFya2VkLiBUbyB0aGlzIGVuZCwgYSBuZXcgc2libGluZyBtYXAgc2hvdWxkIGJlIG1h
aW50YWluZWQKZm9yIGVhY2ggQ1BVIGFuZCB0aGlzIG1hcCBpc24ndCBjaGFuZ2VkIHdoZW4gYSBD
UFUgZ2V0cyBwYXJrZWQuCgpJbiBMaW51eCBrZXJuZWwsIHRoZSBhcHByb2FjaCBpcyBxdWl0ZSBz
aW1wbGU6IGxhdGUgbG9hZGluZyBpcwpwcm9oaWJpdGVkIGlmIGFueSBDUFUgaXMgcGFya2VkOyBh
ZG1pbiBzaG91bGQgb25saW5lIGFsbCBwYXJrZWQgQ1BVCmJlZm9yZSBsb2FkaW5nIHVjb2RlLgoK
RG8geW91IGhhdmUgYW55IHByZWZlcmVuY2U/CgpUaGFua3MKQ2hhbwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
