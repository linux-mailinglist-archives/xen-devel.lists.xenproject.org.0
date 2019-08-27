Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFC19DCAF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 06:39:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2TDC-0006Ew-QE; Tue, 27 Aug 2019 04:36:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YViL=WX=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i2TDB-0006Ep-5K
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 04:36:05 +0000
X-Inumbo-ID: 2c4b5f5a-c884-11e9-8980-bc764e2007e4
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c4b5f5a-c884-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 04:36:02 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 21:36:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,435,1559545200"; d="scan'208";a="187804818"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2019 21:36:00 -0700
Date: Tue, 27 Aug 2019 12:40:05 +0800
From: Chao Gao <chao.gao@intel.com>
To: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Message-ID: <20190827044004.GA28246@gao-cwp>
References: <20190809083831.GA30839@gao-cwp>
 <20190826211728.GF2840@reaktio.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826211728.GF2840@reaktio.net>
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTI6MTc6MjhBTSArMDMwMCwgUGFzaSBLw6Rya2vDpGlu
ZW4gd3JvdGU6Cj5IaSBDaGFvLAo+Cj5PbiBGcmksIEF1ZyAwOSwgMjAxOSBhdCAwNDozODozM1BN
ICswODAwLCBDaGFvIEdhbyB3cm90ZToKPj4gSGkgZXZlcnlvbmUsCj4+IAo+PiBJIGhhdmUgYSBk
ZXZpY2Ugd2hpY2ggb25seSBzdXBwb3J0cyBzZWNvbmRhcnkgYnVzIHJlc2V0LiBBZnRlciBiZWlu
Zwo+PiBhc3NpZ25lZCB0byBhIFZNLCBpdCB3b3VsZCBiZSBwbGFjZWQgdW5kZXIgaG9zdCBicmlk
Z2UuIEZvciBkZXZpY2VzCj4+IHVuZGVyIGhvc3QgYnJpZGdlLCBzZWNvbmRhcnkgYnVzIHJlc2V0
IGlzIG5vdCBhcHBsaWNhYmxlLiBUaHVzLCBhIFZNCj4+IGhhcyBubyB3YXkgdG8gcmVzZXQgdGhp
cyBkZXZpY2UuCj4+IAo+PiBUaGlzIGRldmljZSdzIHVzYWdlIHdvdWxkIGJlIGxpbWl0ZWQgd2l0
aG91dCBQQ0kgcmVzZXQgKGZvciBleGFtcGxlLCBpdHMKPj4gZHJpdmVyIGNhbm5vdCByZS1pbml0
aWFsaXplIHRoZSBkZXZpY2UgcHJvcGVybHkgd2l0aG91dCBQQ0kgcmVzZXQsIHdoaWNoCj4+IG1l
YW5zIGluIFZNIGRldmljZSB3b24ndCBiZSB1c2FibGUgYWZ0ZXIgdW5sb2FkaW5nIHRoZSBkcml2
ZXIpLCBpdCB3b3VsZAo+PiBiZSBtdWNoIGJldHRlciBpZiB0aGVyZSBpcyBhIHdheSBhdmFpbGFi
bGUgdG8gVk1zIHRvIHJlc2V0IHRoZSBkZXZpY2UuCj4+IAo+PiBJbiBteSBtaW5kLCBhIHN0cmFp
Z2h0Zm93YXJkIHNvbHV0aW9uIGlzIHRvIGNyZWF0ZSBhIHZpcnR1YWwgYnJpZGdlCj4+IGZvciBh
IFZNIGFuZCBwbGFjZSB0aGUgcGFzcy10aHJ1IGRldmljZSB1bmRlciBhIHZpcnR1YWwgYnJpZGdl
LiBCdXQgaXQKPj4gaXNuJ3Qgc3VwcG9ydGVkIGluIFhlbiAoS1ZNL1FFTVUgc3VwcG9ydHMpIGFu
ZCBlbmFibGluZyBpdCBsb29rcyBuZWVkCj4+IGEgbG90IG9mIGVmZm9ydHMuIEFsdGVybmF0aXZl
bHksIGVtdWxhdGluZyBGTFIgKEZ1bmN0aW9uIExldmVsIFJlc2V0KQo+PiBjYXBhYmlsaXR5IGZv
ciB0aGlzIGRldmljZSBtaWdodCBiZSBhIGZlYXNpYmxlIHdheSBhbmQgb25seSBuZWVkcwo+PiBy
ZWxhdGl2ZWx5IGZldyBjaGFuZ2VzLiBJIGFtIHBsYW5uaW5nIHRvIGVuYWJsZSBhbiBvcHQtaW4g
ZmVhdHVyZQo+PiAobGlrZSAncGVybWlzc2l2ZScpIHRvIGFsbG93IHFlbXUgdG8gZXhwb3NlIEZM
UiBjYXBhYmlsaXR5IHRvIGd1ZXN0IGZvcgo+PiBwYXNzLXRocnUgZGV2aWNlcyBhcyBsb25nIGFz
IHRoaXMgZGV2aWNlIGlzIHJlc2V0YWJsZSBvbiBkb20wIChpLmUuIHRoZQo+PiBkZXZpY2UgaGFz
ICdyZXNldCcgYXR0cmlidXRlIHVuZGVyIGl0cyBzeXNmcykuIEFuZCB3aGVuIGd1ZXN0IGluaXRp
YXRlcwo+PiBhbiBGTFIsIHFlbXUganVzdCBlY2hvIDEgdG8gdGhlICdyZXNldCcgYXR0cmlidXRl
IG9uIGRvbTAuCj4+IAo+PiBEbyB5b3UgdGhpbmsgZW11bGF0aW5nIEZMUiBjYXBhYmlsaXR5IGlz
IGRvYWJsZT8KPj4gCj4KPkkgd29uZGVyIGlmIHRoZXNlIHBhdGNoZXMgZnJvbSBhbm90aGVyIHRo
cmVhZCBoZWxwIHdpdGggeW91ciByZXNldCBpc3N1ZToKPgo+aHR0cHM6Ly9saXN0cy54ZW4ub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDgvbXNnMDIzMDQuaHRtbAoKVGhhbmtzIGZv
ciB5b3VyIGF0dGVudGlvbi4KClRoZSBsaW5rIHlvdSBwcm92aWRlcyBzZWVtcyBhYm91dCBob3cg
aG9zdCByZXNldHMgYSBkZXZpY2UuIEVtdWxhdGluZyBGTFIKY2FwYWJpbGl0eSBpcyB0byBleHBv
c2UgRkxSIGNhcGFiaWxpdHkgdG8gZ3Vlc3Qgc3VjaCB0aGF0IGd1ZXN0IGNhbgpyZXNldCBhc3Np
Z25lZCBkZXZpY2VzLiBEZWZpbml0ZWx5LCBxZW11IHdvdWxkIGludGVyY2VwdCBndWVzdCdzCmlu
aXRpYXRpbmcgYW4gRkxSIGFuZCByZWRpcmVjdCBpdCBpbnRvIGEgZGV2aWNlIHJlc2V0IG9uIGhv
c3QuCgpUaGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
