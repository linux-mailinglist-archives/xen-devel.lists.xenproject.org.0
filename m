Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593161612C1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 14:12:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3g9V-0001vV-Ow; Mon, 17 Feb 2020 13:09:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=y8gL=4F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j3g9T-0001vQ-Sz
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 13:09:31 +0000
X-Inumbo-ID: bbe4d430-5186-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bbe4d430-5186-11ea-bc8e-bc764e2007e4;
 Mon, 17 Feb 2020 13:09:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 69D53AF76;
 Mon, 17 Feb 2020 13:09:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <b477ca71-e5c7-0804-d3cb-f6a51f6bd46c@suse.com>
 <056a856a-147e-612b-d476-50be80406581@suse.com>
 <2d25edcb-908a-5318-830b-8811abb125ef@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <62532a65-efa2-dea5-3ef2-41ccb20023e3@suse.com>
Date: Mon, 17 Feb 2020 14:09:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2d25edcb-908a-5318-830b-8811abb125ef@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] AMD/IOMMU: replace a few literal numbers
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxNToyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wMi8yMDIw
IDA5OjQzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSW50cm9kdWNlIElPTU1VX1BERV9ORVhUX0xF
VkVMX3tNSU4sTUFYfSB0byByZXBsYWNlIGxpdGVyYWwgMSwgNiwgYW5kIDcKPj4gaW5zdGFuY2Vz
LiBXaGlsZSBkb2luZyBzbyByZXBsYWNlIHR3byB1c2VzIG9mIG1lbXNldCgpIGJ5IGluaXRpYWxp
emVycy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IAo+IFRoaXMgZG9lcyBub3QgbG9vayB0byBiZSBhbiBpbXByb3ZlbWVudC7CoCBJT01NVV9Q
REVfTkVYVF9MRVZFTF9NSU4gaXMKPiBkZWZpbml0ZWx5IGJvZ3VzLCBhbmQgaW4gYWxsIGNhc2Vz
LCBhIGxpdGVyYWwgMSBpcyBiZXR0ZXIsIGJlY2F1c2UgdGhhdAo+IGlzIGhvdyB3ZSBkZXNjcmli
ZSBwYWdldGFibGUgbGV2ZWxzLgoKSSBkaXNhZ3JlZS4gVGhlIGRldmljZSB0YWJsZSBlbnRyeSdz
IG1vZGUgZmllbGQgaXMgYm91bmRlZCBieSAxCihtaW4pIGFuZCA2IChtYXgpIGZvciB0aGUgbGVn
aXRpbWF0ZSB2YWx1ZXMgdG8gcHV0IHRoZXJlLgoKPiBTb21ldGhpbmcgdG8gcmVwbGFjZSBsaXRl
cmFsIDYvNyBwcm9iYWJseSBpcyBvaywgYnV0IGRvZXNuJ3Qgd2FudCB0byBiZQo+IGRvbmUgbGlr
ZSB0aGlzLgo+IAo+IFRoZSBtYWpvcml0eSBvZiB0aGUgcHJvYmxlbXMgaGVyZSBhcyBjYXVzZWQg
YnkgaW9tbXVfcGRlX2Zyb21fZGZuKCkncwo+IHNpbGx5IEFCSS7CoCBUaGUgcHRfbWZuW10gYXJy
YXkgaXMgcHJvYmxlbWF0aWMgKGJlY2F1c2UgaXQgaXMgdXNlZCBhcyBhCj4gMS1iYXNlZCBhcnJh
eSwgbm90IDAtYmFzZWQpIGFuZCB1c2VsZXNzIGJlY2F1c2UgYm90aCBjYWxsZXJzIG9ubHkgd2Fu
dAo+IHRoZSA0ay1lcXVpdmVsZW50IG1mbi7CoCBGaXhpbmcgdGhlIEFCSSBnZXRzIHJpZCBvZiBx
dWl0ZSBhIGxvdCBvZiB3YXN0ZWQKPiBzdGFjayBzcGFjZSwgZXZlcnkgdXNlIG9mICcxJywgYW5k
IGV2ZXJ5IHVwcGVyIGJvdW5kIG90aGVyIHRoYW4gdGhlIGJ1Zwo+IG9uIGFuZCBhbWRfaW9tbXVf
Z2V0X3BhZ2luZ19tb2RlKCkuCgpJIGRpZG4ndCBtZWFuIHRvIGFsdGVyIHRoYXQgZnVuY3Rpb24n
cyBiZWhhdmlvciwgYXQgdGhlIHZlcnkgbGVhc3QKbm90IHVudGlsIGJlaW5nIGNlcnRhaW4gdGhl
cmUgd2Fzbid0IGEgcmVhc29uIGl0IHdhcyBjb2RlZCB3aXRoIHRoaXMKYXJyYXkgYXBwcm9hY2gu
IElPVyB0aGUgYWx0ZXJuYXRpdmUgdG8gZ29pbmcgd2l0aCB0aGlzIHBhdGNoCihzdWJqZWN0IHRv
IGNvcnJlY3Rpb25zIG9mIGNvdXJzZSkgaXMgZm9yIG1lIHRvIGRyb3AgaXQgYWx0b2dldGhlciwK
a2VlcGluZyB0aGUgaGFyZC1jb2RlZCBudW1iZXJzIGluIHBsYWNlLiBKdXN0IGxldCBtZSBrbm93
LgoKPj4gLS0tCj4+IFRCRDogV2Ugc2hvdWxkIHJlYWxseSBob25vciB0aGUgaGF0cyBmaWVsZCBv
ZiB1bmlvbgo+PiAgICAgIGFtZF9pb21tdV9leHRfZmVhdHVyZXMsIGJ1dCB0aGUgc3BlY2lmaWNh
dGlvbiAob3IgYXQgbGVhc3QgdGhlCj4+ICAgICAgcGFydHMgSSBkaWQgbG9vayBhdCBpbiB0aGUg
Y291cnNlIG9mIHB1dHRpbmcgdG9nZXRoZXIgdGhpcyBwYXRjaCkKPj4gICAgICBpcyB1bmNsZWFy
IGFib3V0IHRoZSBtYXhpbXVtIHZhbGlkIHZhbHVlIGluIGNhc2UgRUZSU3VwIGlzIGNsZWFyLgo+
IAo+IEl0IGlzIGF2YWlsYWJsZSBmcm9tIFBDSSBjb25maWcgc3BhY2UgKE1pc2MwIHJlZ2lzdGVy
LCBjYXArMHgxMCkgZXZlbiBvbgo+IGZpcnN0IGdlbiBJT01NVXMsCgpJIGRvbid0IHRoaW5rIGFu
eSBvZiB0aGUgYWRkcmVzcyBzaXplIGZpZWxkcyB0aGVyZSBtYXRjaGVzIHdoYXQKSEFUUyBpcyBh
Ym91dCAobGltaXRpbmcgb2YgdGhlIHZhbHVlcyB2YWxpZCB0byBwdXQgaW4gYSBEVEUncwptb2Rl
IGZpZWxkKS4gSW4gZmFjdCBJJ20gaGF2aW5nIHNvbWUgZGlmZmljdWx0eSBicmluZ2luZyB0aGUK
dHdvIGluIChzZW5zaWJsZSkgc3luYy4KCj4gYW5kIHRoZSBJVlJTIHRhYmxlIGluIFR5cGUgMTAu
CgpXaGljaCBtYXkgaW4gdHVybiBiZSBhYnNlbnQsIGkuZS4gdGhlIHF1ZXN0aW9uIG9mIHdoYXQg
dG8gdXNlIGFzCmEgZGVmYXVsdCBtZXJlbHkgZ2V0cyBzaGlmdGVkLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
