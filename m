Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613CF14BCB0
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:18:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwSaN-0007hm-VC; Tue, 28 Jan 2020 15:15:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwSaM-0007ha-BE
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:15:26 +0000
X-Inumbo-ID: 020ccb31-41e1-11ea-8711-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 020ccb31-41e1-11ea-8711-12813bfff9fa;
 Tue, 28 Jan 2020 15:15:25 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwSaK-0002aq-Do; Tue, 28 Jan 2020 15:15:24 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwSaK-0002Gm-0m; Tue, 28 Jan 2020 15:15:24 +0000
Date: Tue, 28 Jan 2020 15:15:21 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200128151520.al3xp7yxntdpq5el@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-2-liuwe@microsoft.com>
 <da7d04bd-b2cf-996b-df83-49d928040ae1@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da7d04bd-b2cf-996b-df83-49d928040ae1@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 1/7] x86: provide executable fixmap
 facility
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMTI6MDQ6MDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3cm90ZToKPiA+IFRoaXMgYWxsb3dz
IHVzIHRvIHNldCBhc2lkZSBzb21lIGFkZHJlc3Mgc3BhY2UgZm9yIGV4ZWN1dGFibGUgbWFwcGlu
Zy4KPiA+IFRoaXMgZml4ZWQgbWFwIHJhbmdlIHN0YXJ0cyBmcm9tIFhFTl9WSVJUX0VORCBzbyB0
aGF0IGl0IGlzIHdpdGhpbiByZWFjaAo+ID4gb2YgdGhlIC50ZXh0IHNlY3Rpb24uCj4gPiAKPiA+
IFNoaWZ0IHRoZSBwZXJjcHUgc3R1YiByYW5nZSBhbmQgbGl2ZXBhdGNoIHJhbmdlIGFjY29yZGlu
Z2x5Lgo+IAo+IEhtbSwgdGhlIGxpdmVwYXRjaCByYW5nZSBnZXRzIHNocnVuaywgbm90IHNoaWZ0
ZWQsIGJ1dCB5ZXMuIElzIHRoZXJlCj4gYSBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkgeW91IG1vdmUg
dGhlIHN0dWJzIGFyZWEgZG93bj8gSXQgbG9va3MgYXMgaWYKPiB0aGUgcGF0Y2ggd291bGQgYmUg
c21hbGxlciBvdmVyYWxsIGlmIHlvdSBkaWRuJ3QuIChQb3NzaWJseSBkb3duCj4gdGhlIHJvYWQg
dGhlIHN0dWJzIGFyZWEgY291bGQgYmUgbWFkZSBwYXJ0IG9mIHRoZSBGSVhBRERSX1ggcmFuZ2UK
PiBhbnl3YXkuKQoKSSB0aGluayBoYXZpbmcgYSB3ZWxsLWtub3duIGZpeGVkIGFkZHJlc3MgaXMg
bW9yZSB1c2VmdWwgZm9yIGRlYnVnZ2luZy4KCkdvaW5nIHRoZSBvdGhlciB3YXkgYXJvdW5kIHdv
dWxkIG1lYW4gdGhlIGh5cGVyY2FsbCBwYWdlIGxvY2F0aW9uCmJlY29tZXMgZGVwZW5kZW50IG9u
IHRoZSBudW1iZXIgb2YgQ1BVcyBjb25maWd1cmVkLgoKPiAKPiA+IEBAIC01NzYzLDYgKzU3NjUs
MTMgQEAgdm9pZCBfX3NldF9maXhtYXAoCj4gPiAgICAgIG1hcF9wYWdlc190b194ZW4oX19maXhf
dG9fdmlydChpZHgpLCBfbWZuKG1mbiksIDEsIGZsYWdzKTsKPiA+ICB9Cj4gPiAgCj4gPiArdm9p
ZCBfX3NldF9maXhtYXBfeCgKPiA+ICsgICAgZW51bSBmaXhlZF9hZGRyZXNzZXNfeCBpZHgsIHVu
c2lnbmVkIGxvbmcgbWZuLCB1bnNpZ25lZCBsb25nIGZsYWdzKQo+ID4gK3sKPiA+ICsgICAgQlVH
X09OKGlkeCA+PSBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXNfeCk7Cj4gCj4gQWxzbyBjaGVjayBm
b3IgRklYX1hfUkVTRVJWRUQ/CgpBY2suIEluIHRoYXQgY2FzZSB0aGUgc2FtZSBzaG91bGQgYmUg
ZG9uZSBmb3IgX19zZXRfZml4bWFwLgoKPiAKPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
Zml4bWFwLmgKPiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgKPiA+IEBAIC0x
NSw2ICsxNSw5IEBACj4gPiAgI2luY2x1ZGUgPGFzbS9wYWdlLmg+Cj4gPiAgCj4gPiAgI2RlZmlu
ZSBGSVhBRERSX1RPUCAoVk1BUF9WSVJUX0VORCAtIFBBR0VfU0laRSkKPiA+ICsjZGVmaW5lIEZJ
WEFERFJfWF9UT1AgKFhFTl9WSVJUX0VORCAtIFBBR0VfU0laRSkKPiA+ICsvKiBUaGlzIGNvbnN0
YW50IGlzIGRlcml2ZWQgZnJvbSBlbnVtIGZpeGVkX2FkZHJlc3Nlc194IGJlbG93ICovCj4gPiAr
I2RlZmluZSBNQVhfRklYQUREUl9YX1NJWkUgKDIgPDwgUEFHRV9TSElGVCkKPiAKPiBJZiB0aGlz
IGNhbid0IGJlIHByb3Blcmx5IGRlcml2ZWQsIHRoZW4gYSBCVUlMRF9CVUdfT04oKSBpcyBuZWVk
ZWQuCj4gQnV0IGRpZG4ndCB3ZSBkaXNjdXNzIG9uIGlyYyBhbHJlYWR5IHBvc3NpYmxlIGFwcHJv
YWNoZXMgb2YgaG93IHRvCj4gZGVyaXZlIGl0IGZyb20gdGhlIGVudW0/IERpZCBub25lIG9mIHRo
aXMgd29yaz8KPiAKClRoZSBvbmx5IG9wdGlvbiBJIHJlbWVtYmVyIGRpc2N1c3Npbmcgd2FzIHRv
IGRlZmluZSBtYWNyb3MgaW5zdGVhZCBvZgp1c2luZyBlbnVtLiBJIHNhaWQgYXQgdGhlIHRpbWUg
YXQgd291bGQgbWFrZSB1cyBsb3NlIHRoZSBhYmlsaXR5IHRvCmR5bmFtaWNhbGx5IHNpemUgdGhp
cyBhcmVhLgoKSWYgdGhlcmUgYXJlIG90aGVyIHdheXMgdGhhdCBJIG1pc3NlZCwgbGV0IG1lIGtu
b3cuCgo+ID4gQEAgLTg5LDYgKzkyLDMxIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyB2
aXJ0X3RvX2ZpeChjb25zdCB1bnNpZ25lZCBsb25nIHZhZGRyKQo+ID4gICAgICByZXR1cm4gX192
aXJ0X3RvX2ZpeCh2YWRkcik7Cj4gPiAgfQo+ID4gIAo+ID4gK2VudW0gZml4ZWRfYWRkcmVzc2Vz
X3ggewo+ID4gKyAgICAvKiBJbmRleCAwIGlzIHJlc2VydmVkIHNpbmNlIGZpeF94X3RvX3ZpcnQo
MCkgPT0gRklYQUREUl9YX1RPUC4gKi8KPiA+ICsgICAgRklYX1hfUkVTRVJWRUQsCj4gPiArI2lm
ZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKPiA+ICsgICAgRklYX1hfSFlQRVJWX0hDQUxMLAo+ID4g
KyNlbmRpZgo+ID4gKyAgICBfX2VuZF9vZl9maXhlZF9hZGRyZXNzZXNfeAo+ID4gK307Cj4gPiAr
Cj4gPiArI2RlZmluZSBGSVhBRERSX1hfU0laRSAgKF9fZW5kX29mX2ZpeGVkX2FkZHJlc3Nlc194
IDw8IFBBR0VfU0hJRlQpCj4gPiArI2RlZmluZSBGSVhBRERSX1hfU1RBUlQgKEZJWEFERFJfWF9U
T1AgLSBGSVhBRERSX1hfU0laRSkKPiA+ICsKPiA+ICtleHRlcm4gdm9pZCBfX3NldF9maXhtYXBf
eCgKPiA+ICsgICAgZW51bSBmaXhlZF9hZGRyZXNzZXNfeCBpZHgsIHVuc2lnbmVkIGxvbmcgbWZu
LCB1bnNpZ25lZCBsb25nIGZsYWdzKTsKPiA+ICsKPiA+ICsjZGVmaW5lIHNldF9maXhtYXBfeChp
ZHgsIHBoeXMpIFwKPiA+ICsgICAgX19zZXRfZml4bWFwX3goaWR4LCAocGh5cyk+PlBBR0VfU0hJ
RlQsIFBBR0VfSFlQRVJWSVNPUl9SWCB8IE1BUF9TTUFMTF9QQUdFUykKPiAKPiBDYW4ndCBfX3Nl
dF9maXhtYXAoKSBiZSB1c2VkIGhlcmUsIG1ha2luZyBpdHMgaW1wbGVtZW50YXRpb24gZGVyaXZl
Cj4gd2hpY2ggb25lIGlzIG1lYW4gZnJvbSB3aGV0aGVyIF9QQUdFX05YIGlzIHNldCBpbiB0aGUg
cGFzc2VkIGluIGZsYWdzPwoKX19zZXRfZml4bWFwIGFuZCBfX3NldF9maXhtYXBfeCB0YWtlIGRp
ZmZlcmVudCBlbnVtIHR5cGVzIGZvciB0aGVpcgpmaXJzdCBhcmd1bWVudC4gSSB3b3VsZCBwcmVm
ZXIgdHlwZSBzYWZldHkgYW5kIGV4cGxpY2l0bmVzcyBoZXJlLgoKV2VpLgoKPiAKPiBKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
