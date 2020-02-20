Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F4C165CF1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 12:48:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4kHE-0000mY-So; Thu, 20 Feb 2020 11:45:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iWzT=4I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4kHC-0000mR-KB
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 11:45:54 +0000
X-Inumbo-ID: 8ca528bc-53d6-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ca528bc-53d6-11ea-bc8e-bc764e2007e4;
 Thu, 20 Feb 2020 11:45:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2194CAD06;
 Thu, 20 Feb 2020 11:45:53 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <b5d94bd8-9a39-c88b-4c3c-f89e655f3abf@suse.com>
 <2a9a998e-f2d0-3c07-e85e-7fdda18b506e@suse.com>
 <20200220114331.m6yolb4hoyfvfmsa@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d9584c2-9c7f-f3e5-283c-c80bb9bebd73@suse.com>
Date: Thu, 20 Feb 2020 12:45:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220114331.m6yolb4hoyfvfmsa@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/5] libxl/PCI: align reserved device memory
 boundary for HAP guests
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDIuMjAyMCAxMjo0MywgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEZlYiAxOCwgMjAy
MCBhdCAwNDo0Nzo0OVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQXMgdGhlIGNvZGUg
Y29tbWVudCBzYXlzLCB0aGlzIHdpbGwgYWxsb3cgdXNlIG9mIGEgMk1iIHN1cGVyIHBhZ2UKPj4g
bWFwcGluZyBhdCB0aGUgZW5kIG9mICJsb3ciIG1lbW9yeS4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+Pgo+PiAtLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9kbS5jCj4+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKPj4gQEAgLTU2Myw2ICs1
NjMsMTMgQEAgaW50IGxpYnhsX19kb21haW5fZGV2aWNlX2NvbnN0cnVjdF9yZG0obAo+PiAgICAg
ICAgICAvKiBKdXN0IGNoZWNrIGlmIFJETSA+IG91ciBtZW1vcnkgYm91bmRhcnkuICovCj4+ICAg
ICAgICAgIGlmIChyZG1fc3RhcnQgPiByZG1fbWVtX2JvdW5kYXJ5KSB7Cj4+ICAgICAgICAgICAg
ICAvKgo+PiArICAgICAgICAgICAgICogRm9yIEhBUCBndWVzdHMgcm91bmQgZG93biB0byBhIDJN
YiBib3VuZGFyeSB0byBhbGxvdyB1c2UKPj4gKyAgICAgICAgICAgICAqIG9mIGxhcmdlIHBhZ2Ug
bWFwcGluZ3MuCj4+ICsgICAgICAgICAgICAgKi8KPj4gKyAgICAgICAgICAgIGlmIChsaWJ4bF9k
ZWZib29sX3ZhbChkX2NvbmZpZy0+Y19pbmZvLmhhcCkKPj4gKyAgICAgICAgICAgICAgICAmJiBy
ZG1fc3RhcnQgPiAweDIwMDAwMCkKPiAKPiBQbGVhc2UgdXNlIE1CKDIpIGhlcmUuCgpXaWxsIGRv
LCBidXQgdGhlbiB3aGF0IGFib3V0IHRoZSB+MHgxZmZmZmYgb24gdGhlIG5leHQgbGluZT8gU2hv
dWxkCnRoaXMgYmVjb21lIH4oTUIoMikgLSAxKT8KCj4gV2l0aCB0aGlzIGZpeGVkOgo+IAo+IEFj
a2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKVGhhbmtzLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
