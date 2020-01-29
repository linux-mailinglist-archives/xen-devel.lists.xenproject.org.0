Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A66214CCB6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:45:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwoYR-000726-80; Wed, 29 Jan 2020 14:42:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JZHc=3S=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwoYP-000721-R7
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:42:53 +0000
X-Inumbo-ID: a142c550-42a5-11ea-88ec-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a142c550-42a5-11ea-88ec-12813bfff9fa;
 Wed, 29 Jan 2020 14:42:53 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwoYO-0000Bg-2U; Wed, 29 Jan 2020 14:42:52 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwoYN-0003kg-Pf; Wed, 29 Jan 2020 14:42:52 +0000
Date: Wed, 29 Jan 2020 14:42:48 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200129144248.w7dk6h5dxl75hpg4@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-2-liuwe@microsoft.com>
 <da7d04bd-b2cf-996b-df83-49d928040ae1@suse.com>
 <20200128151520.al3xp7yxntdpq5el@debian>
 <345b5392-2f89-0a37-bac8-e88b0714028c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <345b5392-2f89-0a37-bac8-e88b0714028c@suse.com>
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

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgMDQ6Mzg6NDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjguMDEuMjAyMCAxNjoxNSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwgSmFu
IDIzLCAyMDIwIGF0IDEyOjA0OjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDIyLjAxLjIwMjAgMjE6MjMsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IFRoaXMgYWxsb3dzIHVzIHRv
IHNldCBhc2lkZSBzb21lIGFkZHJlc3Mgc3BhY2UgZm9yIGV4ZWN1dGFibGUgbWFwcGluZy4KPiA+
Pj4gVGhpcyBmaXhlZCBtYXAgcmFuZ2Ugc3RhcnRzIGZyb20gWEVOX1ZJUlRfRU5EIHNvIHRoYXQg
aXQgaXMgd2l0aGluIHJlYWNoCj4gPj4+IG9mIHRoZSAudGV4dCBzZWN0aW9uLgo+ID4+Pgo+ID4+
PiBTaGlmdCB0aGUgcGVyY3B1IHN0dWIgcmFuZ2UgYW5kIGxpdmVwYXRjaCByYW5nZSBhY2NvcmRp
bmdseS4KPiA+Pgo+ID4+IEhtbSwgdGhlIGxpdmVwYXRjaCByYW5nZSBnZXRzIHNocnVuaywgbm90
IHNoaWZ0ZWQsIGJ1dCB5ZXMuIElzIHRoZXJlCj4gPj4gYSBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkg
eW91IG1vdmUgdGhlIHN0dWJzIGFyZWEgZG93bj8gSXQgbG9va3MgYXMgaWYKPiA+PiB0aGUgcGF0
Y2ggd291bGQgYmUgc21hbGxlciBvdmVyYWxsIGlmIHlvdSBkaWRuJ3QuIChQb3NzaWJseSBkb3du
Cj4gPj4gdGhlIHJvYWQgdGhlIHN0dWJzIGFyZWEgY291bGQgYmUgbWFkZSBwYXJ0IG9mIHRoZSBG
SVhBRERSX1ggcmFuZ2UKPiA+PiBhbnl3YXkuKQo+ID4gCj4gPiBJIHRoaW5rIGhhdmluZyBhIHdl
bGwta25vd24gZml4ZWQgYWRkcmVzcyBpcyBtb3JlIHVzZWZ1bCBmb3IgZGVidWdnaW5nLgo+ID4g
Cj4gPiBHb2luZyB0aGUgb3RoZXIgd2F5IGFyb3VuZCB3b3VsZCBtZWFuIHRoZSBoeXBlcmNhbGwg
cGFnZSBsb2NhdGlvbgo+ID4gYmVjb21lcyBkZXBlbmRlbnQgb24gdGhlIG51bWJlciBvZiBDUFVz
IGNvbmZpZ3VyZWQuCj4gCj4gRGVwZW5kaW5nIG9uIGhvdyBmdXR1cmUgaW5zZXJ0aW9ucyBhcmUg
ZG9uZSBpbnRvCj4gZW51bSBmaXhlZF9hZGRyZXNzZXNfeCwgdGhlIGFkZHJlc3MgYWxzbyB3b24n
dCBiZSAid2VsbC1rbm93biBmaXhlZCIuCgpHb2luZyBiYWNrIHRvIHRoaXMsIG5vdCBtb3Zpbmcg
c3R1YnMgd2lsbCBtYWtlIHRoZSBjaGFuZ2UgdG8KYWxsb2Nfc3R1Yl9wYWdlIGJlY29tZSB1bm5l
Y2Vzc2FyeSAob25lIGxpbmUpOyBvbiB0aGUgb3RoZXIgaGFuZCBpdAptYWtlcyBGSVhfWF9BRERS
X1NUQVJUIGJlY29tZSBYRU5fVklSVF9FTkQgLSBOUl9DUFVTICogUEFHRV9TSVpFIC0KUEFHRV9T
SVpFLgoKQXJlIHlvdSByZWFsbHkgY29uY2VybmVkIGFib3V0IHRoaXM/IEkgY2FuIG1ha2UgdGhl
IGNoYW5nZSBpZiB5b3UgcmVhbGx5CndhbnQgdGhhdCwgYnV0IGl0IGlzIGp1c3Qgd29yayB3aXRo
IG5vIGFwcGFyZW50IGJlbmVmaXQuCgo+IAo+ID4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L2ZpeG1hcC5oCj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZml4bWFwLmgKPiA+Pj4g
QEAgLTE1LDYgKzE1LDkgQEAKPiA+Pj4gICNpbmNsdWRlIDxhc20vcGFnZS5oPgo+ID4+PiAgCj4g
Pj4+ICAjZGVmaW5lIEZJWEFERFJfVE9QIChWTUFQX1ZJUlRfRU5EIC0gUEFHRV9TSVpFKQo+ID4+
PiArI2RlZmluZSBGSVhBRERSX1hfVE9QIChYRU5fVklSVF9FTkQgLSBQQUdFX1NJWkUpCj4gPj4+
ICsvKiBUaGlzIGNvbnN0YW50IGlzIGRlcml2ZWQgZnJvbSBlbnVtIGZpeGVkX2FkZHJlc3Nlc194
IGJlbG93ICovCj4gPj4+ICsjZGVmaW5lIE1BWF9GSVhBRERSX1hfU0laRSAoMiA8PCBQQUdFX1NI
SUZUKQo+ID4+Cj4gPj4gSWYgdGhpcyBjYW4ndCBiZSBwcm9wZXJseSBkZXJpdmVkLCB0aGVuIGEg
QlVJTERfQlVHX09OKCkgaXMgbmVlZGVkLgo+ID4+IEJ1dCBkaWRuJ3Qgd2UgZGlzY3VzcyBvbiBp
cmMgYWxyZWFkeSBwb3NzaWJsZSBhcHByb2FjaGVzIG9mIGhvdyB0bwo+ID4+IGRlcml2ZSBpdCBm
cm9tIHRoZSBlbnVtPyBEaWQgbm9uZSBvZiB0aGlzIHdvcms/Cj4gPiAKPiA+IFRoZSBvbmx5IG9w
dGlvbiBJIHJlbWVtYmVyIGRpc2N1c3Npbmcgd2FzIHRvIGRlZmluZSBtYWNyb3MgaW5zdGVhZCBv
Zgo+ID4gdXNpbmcgZW51bS4gSSBzYWlkIGF0IHRoZSB0aW1lIGF0IHdvdWxkIG1ha2UgdXMgbG9z
ZSB0aGUgYWJpbGl0eSB0bwo+ID4gZHluYW1pY2FsbHkgc2l6ZSB0aGlzIGFyZWEuCj4gPiAKPiA+
IElmIHRoZXJlIGFyZSBvdGhlciB3YXlzIHRoYXQgSSBtaXNzZWQsIGxldCBtZSBrbm93Lgo+IAo+
IEkgc2VlbSB0byByZWNhbGwgcmVjb21tZW5kaW5nIHRvIGV4cG9ydCBhYnNvbHV0ZSBzeW1ib2xz
IGZyb20KPiBhc3NlbWJseSBjb2RlLiBUaGUgcXVlc3Rpb24gaXMgaG93IGVhc2lseSB1c2FibGUg
dGhleSB3b3VsZAo+IGJlIGZyb20gQywgb3IgaG93IGNsdW1zeSB0aGUgcmVzdWx0aW5nIGNvZGUg
d291bGQgbG9vay4KCkV2ZW4gaWYgSSB1c2UgYWJzb2x1dGUgc3ltYm9sIEkgd291bGQgc3RpbGwg
bmVlZCB0byBkZWZpbmUgYSBtYWNybyBmb3IKaXQuIFRoZXJlIGlzIG5vIHdheSBhcm91bmQgaXQs
IGJlY2F1c2UgZW51bSBjYW4ndCBiZSB1c2VkIGluIGFzbSBvcgpsaW5rZXIgc2NyaXB0LgoKSSB3
YW50IHRvIGtlZXAgdXNpbmcgZW51bSBiZWNhdXNlIHRoYXQgd291bGQgYWxsb3cgdXMgdG8gc2l6
ZSB0aGUgYXJlYQphY2NvcmRpbmcgdG8gS2NvbmZpZy4KCldlaS4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
