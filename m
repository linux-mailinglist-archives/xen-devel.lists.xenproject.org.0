Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7EDA1EC7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 17:20:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3MBf-0005uj-6j; Thu, 29 Aug 2019 15:18:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELCR=WZ=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i3MBd-0005ue-O6
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 15:18:09 +0000
X-Inumbo-ID: 339182c5-ca70-11e9-ae6b-12813bfff9fa
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 339182c5-ca70-11e9-ae6b-12813bfff9fa;
 Thu, 29 Aug 2019 15:18:07 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 08:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,443,1559545200"; d="scan'208";a="182370528"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga007.fm.intel.com with ESMTP; 29 Aug 2019 08:18:03 -0700
Date: Thu, 29 Aug 2019 23:22:08 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190829152206.GA3174@gao-cwp>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
 <131d5f04-7ef9-9a2b-3009-2a93587186ef@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <131d5f04-7ef9-9a2b-3009-2a93587186ef@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTI6MDM6NDRQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAyOS4wOC4yMDE5IDExOjAyLCBDaGFvIEdhbyB3cm90ZToKPj4gQ3VycmVudGx5LCBm
b3IgYSBIVk0gb24gWGVuLCBubyByZXNldCBtZXRob2QgaXMgdmlydHVhbGl6ZWQuIFNvIGluIGEg
Vk0ncwo+PiBwZXJzcGVjdGl2ZSwgYXNzaWduZWQgZGV2aWNlcyBjYW5ub3QgYmUgcmVzZXQuIEJ1
dCBzb21lIGRldmljZXMgcmVseSBvbiBQQ0kKPj4gcmVzZXQgdG8gcmVjb3ZlciBmcm9tIGhhcmR3
YXJlIGhhbmdzLiBXaGVuIGJlaW5nIGFzc2lnbmVkIHRvIGEgVk0sIHRob3NlCj4+IGRldmljZXMg
Y2Fubm90IGJlIHJlc2V0IGFuZCB3b24ndCB3b3JrIGFueSBsb25nZXIgaWYgYSBoYXJkd2FyZSBo
YW5nIG9jY3Vycy4KPj4gV2UgaGF2ZSB0byByZWJvb3QgVk0gdG8gdHJpZ2dlciBQQ0kgcmVzZXQg
b24gaG9zdCB0byByZWNvdmVyIHRoZSBkZXZpY2UuCj4KPkRpZCB5b3UgY29uc2lkZXIgYSBob3Qt
dW5wbHVnLCByZXNldCAoYnkgaG9zdCksIGhvdC1wbHVnIGN5Y2xlIGluc3RlYWQ/CgpZZXMuIEkg
Y29uc2lkZXJlZCB0aGlzIG1lYW5zLiBCdXQgaXQgbmVlZHMgaG9zdCB0byBpbml0aWF0ZSB0aGlz
IGFjdGlvbi4KSG93ZXZlciwgd2hlbiBhIGRldmljZSBuZWVkcyByZXNldCBpcyBkZXRlcm1pbmVk
IGJ5IHRoZSBkZXZpY2UgZHJpdmVyCmluIFZNLiBTbyBpbiBwcmFjdGljZSwgVk0gc3RpbGwgbmVl
ZHMgYSB3YXkgdG8gbm90aWZ5IGhvc3QgdG8gZG8KdW5wbHVnL3Jlc2V0L3BsdWcuIEFzIHRoZSBz
dGFuZGFyZCBGTFIgY2FwYWJpbGl0eSBjYW4gbWVldCB0aGUKcmVxdWlyZW1lbnQsIEkgZG9uJ3Qg
dHJ5IHRvIGludmVudCBvbmUuCgo+Cj4+ICtzdGF0aWMgaW50IHhlbl9wdF9kZXZjdGxfcmVnX3dy
aXRlKFhlblBDSVBhc3N0aHJvdWdoU3RhdGUgKnMsCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFhlblBUUmVnICpjZmdfZW50cnksIHVpbnQxNl90ICp2YWwsCj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGRldl92YWx1ZSwgdWludDE2
X3QgdmFsaWRfbWFzaykKPj4gK3sKPj4gKyAgICBpZiAocy0+cmVhbF9kZXZpY2UuaXNfcmVzZXRh
YmxlICYmICgqdmFsICYgUENJX0VYUF9ERVZDVExfQkNSX0ZMUikpIHsKPj4gKyAgICAgICAgeGVu
X3B0X3Jlc2V0KHMpOwo+PiArICAgIH0KPj4gKyAgICByZXR1cm4geGVuX3B0X3dvcmRfcmVnX3dy
aXRlKHMsIGNmZ19lbnRyeSwgdmFsLCBkZXZfdmFsdWUsIHZhbGlkX21hc2spOwo+Cj5JIHRoaW5r
IHlvdSBhbHNvIG5lZWQgdG8gY2xlYXIgdGhlIGJpdCBiZWZvcmUgaGFuZGluZyBvbiB0aGUgcmVx
dWVzdCwKPnN1Y2ggdGhhdCByZWFkcyB3aWxsIGFsd2F5cyBvYnNlcnZlIGl0IGNsZWFyLgoKV2ls
bCBkby4KClRoYW5rcwpDaGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
