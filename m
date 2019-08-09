Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0031787C29
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 15:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw5KU-0001y1-Im; Fri, 09 Aug 2019 13:53:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7QoQ=WF=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1hw5KS-0001xo-N2
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:53:12 +0000
X-Inumbo-ID: 05f25b66-baad-11e9-8980-bc764e045a96
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 05f25b66-baad-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 13:53:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 06:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,364,1559545200"; d="scan'208";a="350499643"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by orsmga005.jf.intel.com with ESMTP; 09 Aug 2019 06:53:08 -0700
Date: Fri, 9 Aug 2019 21:57:16 +0800
From: Chao Gao <chao.gao@intel.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Message-ID: <20190809135714.GA14919@gao-cwp>
References: <20190809083831.GA30839@gao-cwp>
 <20190809124209.pidkngdt45vtt35p@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809124209.pidkngdt45vtt35p@Air-de-Roger>
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

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDI6NDI6MDlQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPk9uIEZyaSwgQXVnIDA5LCAyMDE5IGF0IDA0OjM4OjMzUE0gKzA4MDAsIENoYW8g
R2FvIHdyb3RlOgo+PiBIaSBldmVyeW9uZSwKPj4gCj4+IEkgaGF2ZSBhIGRldmljZSB3aGljaCBv
bmx5IHN1cHBvcnRzIHNlY29uZGFyeSBidXMgcmVzZXQuIEFmdGVyIGJlaW5nCj4+IGFzc2lnbmVk
IHRvIGEgVk0sIGl0IHdvdWxkIGJlIHBsYWNlZCB1bmRlciBob3N0IGJyaWRnZS4gRm9yIGRldmlj
ZXMKPj4gdW5kZXIgaG9zdCBicmlkZ2UsIHNlY29uZGFyeSBidXMgcmVzZXQgaXMgbm90IGFwcGxp
Y2FibGUuIFRodXMsIGEgVk0KPj4gaGFzIG5vIHdheSB0byByZXNldCB0aGlzIGRldmljZS4KPgo+
SSB0aGluayBpbiBnZW5lcmFsIHdlIGRvbid0IGFsbG93IGd1ZXN0cyB0byBwZXJmb3JtIGFueSBr
aW5kIG9mIHJlc2V0Cj5vZiBQQ0kgZGV2aWNlcywgdGhhdCdzIGFsd2F5cyBpbiBjb250cm9sIG9m
IHRoZSBoYXJkd2FyZSBkb21haW4uCgpCdXQgcmVzZXQgaXMgdHJhcHBlZCBhbmQgcGVyZm9ybWVk
IGJ5IHRoZSBoYXJkd2FyZSBkb21haW4uIEkgZG9uJ3QgdGhpbmsKaW4gdGhpcyB3YXksIGd1ZXN0
IGNvdWxkIGFjY2VzcyByZWdpc3RlcnMgb3IgZ2FpbiBtb3JlIHBlcm1pc3Npb25zIG92ZXIKc29t
ZSByZWdpc3RlcnMgdGhhbiBpdCBzaG91bGQgYmUuCgo+Cj5Ib3cgYXJlIGZvciBleGFtcGxlIEJB
UnMgZ29pbmcgdG8gYmUgcGxhY2VkIGFmdGVyIHN1Y2ggcmVzZXQ/CgpJIGRvbid0IGtub3cgQkFS
cyBhcmUgcmVsb2NhdGVkIGFmdGVyIHJlc2V0LiBJIHdpbGwgZmlndXJlIGl0IG91dC4KQ29uc2lk
ZXJpbmcgS1ZNL1FlbXUgZG8gc3VwcG9ydCBkZXZpY2UgcmVzZXQsIEkgdGhpbmsgdGhlcmUKc2hv
dWxkIGJlIHNvbWUgbWVhbnMuCgo+Cj4+IFRoaXMgZGV2aWNlJ3MgdXNhZ2Ugd291bGQgYmUgbGlt
aXRlZCB3aXRob3V0IFBDSSByZXNldCAoZm9yIGV4YW1wbGUsIGl0cwo+PiBkcml2ZXIgY2Fubm90
IHJlLWluaXRpYWxpemUgdGhlIGRldmljZSBwcm9wZXJseSB3aXRob3V0IFBDSSByZXNldCwgd2hp
Y2gKPj4gbWVhbnMgaW4gVk0gZGV2aWNlIHdvbid0IGJlIHVzYWJsZSBhZnRlciB1bmxvYWRpbmcg
dGhlIGRyaXZlciksIGl0IHdvdWxkCj4+IGJlIG11Y2ggYmV0dGVyIGlmIHRoZXJlIGlzIGEgd2F5
IGF2YWlsYWJsZSB0byBWTXMgdG8gcmVzZXQgdGhlIGRldmljZS4KPgo+SXMgdGhpcyBzb21ldGhp
bmcgY29tbW9uIChpZTogcmVxdWlyaW5nIGRldmljZSByZXNldCBmdW5jdGlvbmFsaXR5KQo+Zm9y
IGRyaXZlcnMgdG8gd29yayBjb3JyZWN0bHk/CgpJIGRvbid0IHRoaW5rIGl0IGlzIGNvbW1vbi4g
SSBhbSBub3Qgc3VyZSB3aGV0aGVyIGl0IGlzIHJlcXVpcmVkIGZvciBHUFUKcGFzcy10aHJ1IGlu
IHNvbWUgY2FzZXMuIEJ1dCBJIGJlbGlldmUgdGhhdCBJIHNhdyBzb21lIG9ubGluZSBtYXRlcmlh
bHMKYWJvdXQgR1BVIHBhc3MtdGhydSBtZW50aW9uZWQgaG93IHRvIGVuYWJsZSBGTFIgZm9yIGEg
Vk0uCgo+Cj5TbyBmYXIgd2Ugc2VlbSB0byBoYXZlIG1hbmFnZWQgdG8gZ2V0IGF3YXkgd2l0aG91
dCBpdC4KPgo+PiBJbiBteSBtaW5kLCBhIHN0cmFpZ2h0Zm93YXJkIHNvbHV0aW9uIGlzIHRvIGNy
ZWF0ZSBhIHZpcnR1YWwgYnJpZGdlCj4+IGZvciBhIFZNIGFuZCBwbGFjZSB0aGUgcGFzcy10aHJ1
IGRldmljZSB1bmRlciBhIHZpcnR1YWwgYnJpZGdlLiBCdXQgaXQKPj4gaXNuJ3Qgc3VwcG9ydGVk
IGluIFhlbiAoS1ZNL1FFTVUgc3VwcG9ydHMpIGFuZCBlbmFibGluZyBpdCBsb29rcyBuZWVkCj4+
IGEgbG90IG9mIGVmZm9ydHMuIEFsdGVybmF0aXZlbHksIGVtdWxhdGluZyBGTFIgKEZ1bmN0aW9u
IExldmVsIFJlc2V0KQo+PiBjYXBhYmlsaXR5IGZvciB0aGlzIGRldmljZSBtaWdodCBiZSBhIGZl
YXNpYmxlIHdheSBhbmQgb25seSBuZWVkcwo+PiByZWxhdGl2ZWx5IGZldyBjaGFuZ2VzLiBJIGFt
IHBsYW5uaW5nIHRvIGVuYWJsZSBhbiBvcHQtaW4gZmVhdHVyZQo+PiAobGlrZSAncGVybWlzc2l2
ZScpIHRvIGFsbG93IHFlbXUgdG8gZXhwb3NlIEZMUiBjYXBhYmlsaXR5IHRvIGd1ZXN0IGZvcgo+
PiBwYXNzLXRocnUgZGV2aWNlcyBhcyBsb25nIGFzIHRoaXMgZGV2aWNlIGlzIHJlc2V0YWJsZSBv
biBkb20wIChpLmUuIHRoZQo+PiBkZXZpY2UgaGFzICdyZXNldCcgYXR0cmlidXRlIHVuZGVyIGl0
cyBzeXNmcykuIEFuZCB3aGVuIGd1ZXN0IGluaXRpYXRlcwo+PiBhbiBGTFIsIHFlbXUganVzdCBl
Y2hvIDEgdG8gdGhlICdyZXNldCcgYXR0cmlidXRlIG9uIGRvbTAuCj4KPlNvIHlvdSB3b3VsZCBl
eHBvc2UgdGhlIGRldmljZSBhcyBGTFIgY2FwYWJsZSBhbmQganVzdCBpbXBsZW1lbnQgaXQgYXMK
PmEgc2Vjb25kYXJ5IGJ1cyByZXNldCBvbiB0aGUgZGV2aWNlIG1vZGVsPwoKRm9yIHRoZSBkZXZp
Y2UgSSBtZW50aW9uZWQsIHllcy4gQWN0dWFsbHksIGZvciBvdGhlciBkZXZpY2VzLCBpdCBjYW4g
YmUKYW55IHN1cHBvcnRlZCByZXNldCBtZXRob2QuIFRoZXJlIGFyZSBzZXZlcmFsIHdheXMgdG8g
cmVzZXQgYSBmdW5jdGlvbjsKc2Vjb25kYXJ5IGJ1cyByZXNldCBpcyB0aGUgbGFzdCBjaG9pY2Uu
Cgo+Cj5UaGF0IHNlZW1zIGZlYXNpYmxlLCBidXQgYXMgbm90ZWQgYWJvdmUgSSB3b3VsZCBiZSB3
b3JyaWVkIGFib3V0IHRoZQo+cmVzb3VyY2VzIG93bmVkIGJ5IHRoZSBkZXZpY2UsIGFuZCBob3cg
dGhleSBhcmUgZ29pbmcgdG8gYmUgcGxhY2VkCj5hZnRlciBzdWNoIHJlc2V0LiBOb3RlIHlvdSB3
b3VsZCBhbHNvIGhhdmUgdG8gbm90aWZ5IFhlbiBzb21laG93IG9mCj5zdWNoIHJlc2V0LCBzbyBp
dCB0ZWFycyBkb3duIGFsbCB0aGUgc3RhdGUgcmVsYXRlZCB0byB0aGUgZGV2aWNlLgoKSSB3aWxs
IGZpZ3VyZSBvdXQgd2hhdCBzaG91bGQgYmUgZG9uZSBpbiBYZW4gc2lkZS4KClRoYW5rcwpDaGFv
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
