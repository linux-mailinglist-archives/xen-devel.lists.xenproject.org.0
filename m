Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45FC87A60
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 14:44:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw4Dr-0004Yz-S1; Fri, 09 Aug 2019 12:42:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qfww=WF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hw4Dp-0004Yo-Ug
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 12:42:17 +0000
X-Inumbo-ID: 1e62c342-baa3-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1e62c342-baa3-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 12:42:16 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CCU/+jBNta44SBii62QGGcUTebksHiOqfKWpENnnTd/Jw2sEQhL3i+Pv78HnUmTBh+1u2VkNxn
 qFa7H0Ynf18oaS6WvYcCpBV16tkoITGSfjm7SuRmeqssqjSj0dOnS4p6z8l42eF+VCjd1g1BpD
 RXpo7tYlZWao1++WYMtqztNhkFA3YMqQ993rUpCR66DOsBlTCrL5VagipWTT4sA2iXBPpUTYN6
 S5nuMbi9+pg6sFvCgEuDN/fXKwFGjftx8ZK/dko8LOZNI6V0yTB9BiTKOA5aGDcpa6fz1lfdXG
 x1Q=
X-SBRS: 2.7
X-MesageID: 4244262
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4244262"
Date: Fri, 9 Aug 2019 14:42:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190809124209.pidkngdt45vtt35p@Air-de-Roger>
References: <20190809083831.GA30839@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809083831.GA30839@gao-cwp>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDQ6Mzg6MzNQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gSGkgZXZlcnlvbmUsCj4gCj4gSSBoYXZlIGEgZGV2aWNlIHdoaWNoIG9ubHkgc3VwcG9ydHMg
c2Vjb25kYXJ5IGJ1cyByZXNldC4gQWZ0ZXIgYmVpbmcKPiBhc3NpZ25lZCB0byBhIFZNLCBpdCB3
b3VsZCBiZSBwbGFjZWQgdW5kZXIgaG9zdCBicmlkZ2UuIEZvciBkZXZpY2VzCj4gdW5kZXIgaG9z
dCBicmlkZ2UsIHNlY29uZGFyeSBidXMgcmVzZXQgaXMgbm90IGFwcGxpY2FibGUuIFRodXMsIGEg
Vk0KPiBoYXMgbm8gd2F5IHRvIHJlc2V0IHRoaXMgZGV2aWNlLgoKSSB0aGluayBpbiBnZW5lcmFs
IHdlIGRvbid0IGFsbG93IGd1ZXN0cyB0byBwZXJmb3JtIGFueSBraW5kIG9mIHJlc2V0Cm9mIFBD
SSBkZXZpY2VzLCB0aGF0J3MgYWx3YXlzIGluIGNvbnRyb2wgb2YgdGhlIGhhcmR3YXJlIGRvbWFp
bi4KCkhvdyBhcmUgZm9yIGV4YW1wbGUgQkFScyBnb2luZyB0byBiZSBwbGFjZWQgYWZ0ZXIgc3Vj
aCByZXNldD8KCj4gVGhpcyBkZXZpY2UncyB1c2FnZSB3b3VsZCBiZSBsaW1pdGVkIHdpdGhvdXQg
UENJIHJlc2V0IChmb3IgZXhhbXBsZSwgaXRzCj4gZHJpdmVyIGNhbm5vdCByZS1pbml0aWFsaXpl
IHRoZSBkZXZpY2UgcHJvcGVybHkgd2l0aG91dCBQQ0kgcmVzZXQsIHdoaWNoCj4gbWVhbnMgaW4g
Vk0gZGV2aWNlIHdvbid0IGJlIHVzYWJsZSBhZnRlciB1bmxvYWRpbmcgdGhlIGRyaXZlciksIGl0
IHdvdWxkCj4gYmUgbXVjaCBiZXR0ZXIgaWYgdGhlcmUgaXMgYSB3YXkgYXZhaWxhYmxlIHRvIFZN
cyB0byByZXNldCB0aGUgZGV2aWNlLgoKSXMgdGhpcyBzb21ldGhpbmcgY29tbW9uIChpZTogcmVx
dWlyaW5nIGRldmljZSByZXNldCBmdW5jdGlvbmFsaXR5KQpmb3IgZHJpdmVycyB0byB3b3JrIGNv
cnJlY3RseT8KClNvIGZhciB3ZSBzZWVtIHRvIGhhdmUgbWFuYWdlZCB0byBnZXQgYXdheSB3aXRo
b3V0IGl0LgoKPiBJbiBteSBtaW5kLCBhIHN0cmFpZ2h0Zm93YXJkIHNvbHV0aW9uIGlzIHRvIGNy
ZWF0ZSBhIHZpcnR1YWwgYnJpZGdlCj4gZm9yIGEgVk0gYW5kIHBsYWNlIHRoZSBwYXNzLXRocnUg
ZGV2aWNlIHVuZGVyIGEgdmlydHVhbCBicmlkZ2UuIEJ1dCBpdAo+IGlzbid0IHN1cHBvcnRlZCBp
biBYZW4gKEtWTS9RRU1VIHN1cHBvcnRzKSBhbmQgZW5hYmxpbmcgaXQgbG9va3MgbmVlZAo+IGEg
bG90IG9mIGVmZm9ydHMuIEFsdGVybmF0aXZlbHksIGVtdWxhdGluZyBGTFIgKEZ1bmN0aW9uIExl
dmVsIFJlc2V0KQo+IGNhcGFiaWxpdHkgZm9yIHRoaXMgZGV2aWNlIG1pZ2h0IGJlIGEgZmVhc2li
bGUgd2F5IGFuZCBvbmx5IG5lZWRzCj4gcmVsYXRpdmVseSBmZXcgY2hhbmdlcy4gSSBhbSBwbGFu
bmluZyB0byBlbmFibGUgYW4gb3B0LWluIGZlYXR1cmUKPiAobGlrZSAncGVybWlzc2l2ZScpIHRv
IGFsbG93IHFlbXUgdG8gZXhwb3NlIEZMUiBjYXBhYmlsaXR5IHRvIGd1ZXN0IGZvcgo+IHBhc3Mt
dGhydSBkZXZpY2VzIGFzIGxvbmcgYXMgdGhpcyBkZXZpY2UgaXMgcmVzZXRhYmxlIG9uIGRvbTAg
KGkuZS4gdGhlCj4gZGV2aWNlIGhhcyAncmVzZXQnIGF0dHJpYnV0ZSB1bmRlciBpdHMgc3lzZnMp
LiBBbmQgd2hlbiBndWVzdCBpbml0aWF0ZXMKPiBhbiBGTFIsIHFlbXUganVzdCBlY2hvIDEgdG8g
dGhlICdyZXNldCcgYXR0cmlidXRlIG9uIGRvbTAuCgpTbyB5b3Ugd291bGQgZXhwb3NlIHRoZSBk
ZXZpY2UgYXMgRkxSIGNhcGFibGUgYW5kIGp1c3QgaW1wbGVtZW50IGl0IGFzCmEgc2Vjb25kYXJ5
IGJ1cyByZXNldCBvbiB0aGUgZGV2aWNlIG1vZGVsPwoKVGhhdCBzZWVtcyBmZWFzaWJsZSwgYnV0
IGFzIG5vdGVkIGFib3ZlIEkgd291bGQgYmUgd29ycmllZCBhYm91dCB0aGUKcmVzb3VyY2VzIG93
bmVkIGJ5IHRoZSBkZXZpY2UsIGFuZCBob3cgdGhleSBhcmUgZ29pbmcgdG8gYmUgcGxhY2VkCmFm
dGVyIHN1Y2ggcmVzZXQuIE5vdGUgeW91IHdvdWxkIGFsc28gaGF2ZSB0byBub3RpZnkgWGVuIHNv
bWVob3cgb2YKc3VjaCByZXNldCwgc28gaXQgdGVhcnMgZG93biBhbGwgdGhlIHN0YXRlIHJlbGF0
ZWQgdG8gdGhlIGRldmljZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
