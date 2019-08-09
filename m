Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFC987C62
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 16:12:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw5aK-00031Y-HG; Fri, 09 Aug 2019 14:09:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7QoQ=WF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hw5aI-00031T-GW
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 14:09:34 +0000
X-Inumbo-ID: 4f297b39-baaf-11e9-8980-bc764e045a96
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4f297b39-baaf-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 14:09:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 07:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="326640650"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga004.jf.intel.com with ESMTP; 09 Aug 2019 07:09:30 -0700
Date: Fri, 9 Aug 2019 22:13:37 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190809141336.GA17062@gao-cwp>
References: <20190809083831.GA30839@gao-cwp>
 <e6e17b65-3d91-84fa-1831-571676503e2c@suse.com>
 <20190809132412.GA12877@gao-cwp>
 <b3887a04-a7a0-61ee-2037-36322c388d6b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b3887a04-a7a0-61ee-2037-36322c388d6b@suse.com>
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

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDM6MjM6NTlQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAwOS4wOC4yMDE5IDE1OjI0LCBDaGFvIEdhbyB3cm90ZToKPj5PbiBGcmksIEF1ZyAw
OSwgMjAxOSBhdCAxMDo0OTozMkFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+T24gMDku
MDguMjAxOSAxMDozOCwgQ2hhbyBHYW8gd3JvdGU6Cj4+Pj5BbHRlcm5hdGl2ZWx5LCBlbXVsYXRp
bmcgRkxSIChGdW5jdGlvbiBMZXZlbCBSZXNldCkKPj4+PmNhcGFiaWxpdHkgZm9yIHRoaXMgZGV2
aWNlIG1pZ2h0IGJlIGEgZmVhc2libGUgd2F5IGFuZCBvbmx5IG5lZWRzCj4+Pj5yZWxhdGl2ZWx5
IGZldyBjaGFuZ2VzLiBJIGFtIHBsYW5uaW5nIHRvIGVuYWJsZSBhbiBvcHQtaW4gZmVhdHVyZQo+
Pj4+KGxpa2UgJ3Blcm1pc3NpdmUnKSB0byBhbGxvdyBxZW11IHRvIGV4cG9zZSBGTFIgY2FwYWJp
bGl0eSB0byBndWVzdCBmb3IKPj4+PnBhc3MtdGhydSBkZXZpY2VzIGFzIGxvbmcgYXMgdGhpcyBk
ZXZpY2UgaXMgcmVzZXRhYmxlIG9uIGRvbTAgKGkuZS4gdGhlCj4+Pj5kZXZpY2UgaGFzICdyZXNl
dCcgYXR0cmlidXRlIHVuZGVyIGl0cyBzeXNmcykuIEFuZCB3aGVuIGd1ZXN0IGluaXRpYXRlcwo+
Pj4+YW4gRkxSLCBxZW11IGp1c3QgZWNobyAxIHRvIHRoZSAncmVzZXQnIGF0dHJpYnV0ZSBvbiBk
b20wLgo+Pj4+Cj4+Pj5EbyB5b3UgdGhpbmsgZW11bGF0aW5nIEZMUiBjYXBhYmlsaXR5IGlzIGRv
YWJsZT8KPj4+Cj4+PldvdWxkbid0IGEgc3VjaCBlbXVsYXRlZCBndWVzdCBpbml0aWF0ZWQgcmVz
ZXQgYWZmZWN0IG90aGVyIGRldmljZXMKPj4+KGxpa2VseSBub3QgdW5kZXIgY29udHJvbCBvZiB0
aGlzIGd1ZXN0KSBhcyB3ZWxsPwo+Pgo+Pk5vLiBMaW51eCBrZXJuZWwgZ3VhcmFudGVlcyB0aGF0
IHJlc2V0IHRvIGEgZGV2aWNlIHdvbid0IGFmZmVjdAo+Pm90aGVyIGRldmljZXMuIE90aGVyd2lz
ZSwgc3VjaCBkZXZpY2UgY2Fubm90IGJlIHJlc2V0IGFuZCBubwo+PidyZXNldCcgYXR0cmlidXRl
IHdpbGwgYmUgY3JlYXRlZCB1bmRlciBkZXZpY2UncyBzeXNmcy4KPj5TcGVjZmljYWxseSwgdGhl
IGludm9jYXRpb24gb2YgcGNpX2Rldl9yZXNldF9zbG90X2Z1bmN0aW9uKCkgYW5kCj4+cGNpX3Bh
cmVudF9idXNfcmVzZXQoKSBpbiBwY2lfcHJvYmVfcmVzZXRfZnVuY3Rpb24oKSB3aWxsIGNoZWNr
IHdoZXRoZXIKPj50aGUgZGV2aWNlIChmdW5jdGlvbikgaXMgdGhlIG9ubHkgb25lIHVuZGVyIHRo
ZSBzbG90IG9yIGJ1cwo+PnJlc3BlY3RpdmVseS4gSW4gcGNpX2NyZWF0ZV9jYXBhYmlsaXRpZXNf
c3lzZnMoKSwgJ3Jlc2V0JyBhdHRyaWJ1dGUgaXMKPj5jcmVhdGVkIG9ubHkgaWYgZGV2LT5yZXNl
dF9mbiBpcyBub3QgemVyby4KPgo+QWgsIGdvb2QuIEJ1dCB0aGVuIHRoZSBvcHBvc2l0ZSBxdWVz
dGlvbiBhcmlzZXM6IEhvdyB3b3VsZCB5b3VyCj5wcm9wb3NlZCBjaGFuZ2UgaGVscCBpZiB0aGUg
ZGV2aWNlIHNoYXJlcyBhIGJ1cyB3aXRoIG90aGVycz8KCkl0IHdvdWxkbid0LiBJZiB0aGUgZGV2
aWNlIHN1cHBvcnRzIGFueSB3YXkgdG8gcmVzZXQgaXQgaW4gZG9tMCwgdGhpcwpjaGFuZ2Ugd291
bGQgaGVscC4gSWYgZXZlbiBpbiBkb20wIHRoZXJlIGlzIG5vIHdheSB0byByZXNldCBhIGRldmlj
ZSwKaXQgd29uJ3QgaGVscC4gQnV0IEkgdGhpbmsgZm9yIHN1Y2ggZGV2aWNlLCBpdCBjYW5ub3Qg
YmUgc2FmZWx5IGFzc2lnbmVkCnRvIGEgVk0gYmVjYXVzZSB3ZSByZWx5IG9uIFBDSSByZXNldCB0
byBjbGVhbiB1cCBzZW5zaXRpdmUgZGF0YSBpbiB0aGUKZGV2aWNlIHByb2dyYW1tZWQgYnkgdGhl
IHByZXZpb3VzIG93bmVyLgoKVGhhbmtzCkNoYW8KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
