Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D6B1732FC
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 09:34:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7b2w-0003BM-MF; Fri, 28 Feb 2020 08:30:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7b2v-0003BH-0c
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 08:30:57 +0000
X-Inumbo-ID: a39d9674-5a04-11ea-9c17-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a39d9674-5a04-11ea-9c17-bc764e2007e4;
 Fri, 28 Feb 2020 08:30:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A98E3AD5D;
 Fri, 28 Feb 2020 08:30:55 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <640545a6-689a-6ba9-4978-a83183df2e1b@suse.com>
 <6d66b34a-b306-3f9b-2e77-4047212b2d53@citrix.com>
 <c0eb7929-e7e8-9ad3-ec51-57ad49cec284@suse.com>
Message-ID: <85fd1b9a-5f11-d04a-1d34-20ee571061d3@suse.com>
Date: Fri, 28 Feb 2020 09:31:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c0eb7929-e7e8-9ad3-ec51-57ad49cec284@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: correct handling when XT's
 prereq features are unavailable
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAwOToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDIuMjAyMCAx
NjoyNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjcvMDIvMjAyMCAxNDozNCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBAQCAtMTQwMCw5ICsxNDAxLDggQEAgaW50IF9faW5pdCBhbWRfaW9t
bXVfcHJlcGFyZShib29sIHh0KQo+Pj4gICAgICAgICAgaWYgKCByYyApCj4+PiAgICAgICAgICAg
ICAgZ290byBlcnJvcl9vdXQ7Cj4+PiAgCj4+PiAtICAgICAgICByYyA9IC1FTk9ERVY7Cj4+PiAt
ICAgICAgICBpZiAoIHh0ICYmICghaW9tbXUtPmZlYXR1cmVzLmZsZHMuZ2Ffc3VwIHx8ICFpb21t
dS0+ZmVhdHVyZXMuZmxkcy54dF9zdXApICkKPj4+IC0gICAgICAgICAgICBnb3RvIGVycm9yX291
dDsKPj4+ICsgICAgICAgIGlmICggIWlvbW11LT5mZWF0dXJlcy5mbGRzLmdhX3N1cCB8fCAhaW9t
bXUtPmZlYXR1cmVzLmZsZHMueHRfc3VwICkKPj4+ICsgICAgICAgICAgICBub194dCA9IHRydWU7
Cj4+PiAgICAgIH0KPj4+ICAKPj4+ICAgICAgZm9yX2VhY2hfYW1kX2lvbW11ICggaW9tbXUgKQo+
Pgo+PiAuLi4gdGhlIGNvbnRlbnRzIG9mIHRoaXMgbG9vcCBkZXBlbmRzIG9uIHRoZSBlYXJseSBl
eGl0IHBhdGggeW91J3ZlIGp1c3QKPj4gZGVsZXRlZC4KPj4KPj4gSW4gdGhlIGNhc2Ugb2YgeDJh
cGljIG5vdCBiZWluZyBhdmFpbGFibGUsIHdlJ2xsIHN0aWxsIHNldCB7Z2EseHR9X2VuIHRvCj4+
IHRoZSBjYWxsZXIgcmVxdWVzdGVkIHZhbHVlLgo+IAo+IE9oLCBpbmRlZWQgKGFuZCBSb2dlciwg
dGhhbmsgeW91IHRvbyBmb3Igbm90aWNpbmcgdGhpcykuIEluIGZhY3QKPiBpdCBleHBsYWlucyBh
IGhhbmcgbGF0ZXIgZHVyaW5nIGJvb3QgdGhhdCBJIGRpZCBvYnNlcnZlLCBhbmQgdGhhdAo+IEkg
bWVhbnQgdG8gbG9vayBpbnRvIGxhdGVyLiBUaGF0IHNhaWQsIGludGVycnVwdHMgZm9yIERvbTAg
c3RpbGwKPiBkb24ndCBzZWVtIHRvIHdvcmsgcXVpdGUgcmlnaHQgaW4gdGhpcyAocGFydGx5IGJy
b2tlbikgbW9kZSBldmVuCj4gd2l0aCB0aGlzIGZpeGVkICh0aGVyZSBhcmUgc2V2ZXJhbCAiTm8g
aXJxIGhhbmRsZXIgZm9yIHZlY3RvciIKPiBtZXNzYWdlcywgYW5kIGF0IHRoZSB2ZXJ5IGxlYXN0
IHRoZSBkaXNrIGRvZXNuJ3Qgd29yayk7IEknbGwgc2VlCj4gdG8gZmluZCB0aW1lIHRvIGxvb2sg
aW50byB0aGF0IGFzIHdlbGwsIGJ1dCBJJ20gcHJldHR5IGNvbnZpbmNlZAo+IGl0J3MgYW4gaW5k
ZXBlbmRlbnQgaXNzdWUuIChTZWVpbmcgdGhhdCBpbnRlcnJ1cHQgcmVtYXBwaW5nIGdldHMKPiBl
bmFibGVkIHRoaXMgd2F5LCBhbmQgeDJBUElDIGlzIHByZS1lbmFibGVkLCBJJ20gc3VzcGVjdGlu
ZyB0aGlzCj4gaXMgYW5vdGhlciBjYXNlIHdoZXJlIHdlIG5lZWQgdG8gZm9yY2UgcGh5c2ljYWwg
bW9kZS4pCgpBbmQgaW5kZWVkIHgyYXBpY19waHlzIG9uIHRoZSBjb21tYW5kIGxpbmUgbWFrZXMg
dGhpbmdzIHdvcmsuIE5vdwpJJ2xsIGhhdmUgdG8gZmlndXJlIGEgcmVhc29uYWJsZSB3YXkgd2hl
biBhbmQgaG93IHRvIGNvbW11bmljYXRlCnRoZSBuZWVkIHRvIHN3aXRjaCB0aGUgbW9kZS4gKEFu
b3RoZXIgcG90ZW50aWFsIGlzc3VlIEknbSBzZWVpbmcgaXMKdGhhdCBpdCBtYXkgbm90IGJlIG9r
YXkgdG8gYnJpbmcgdXAgYSBDUFUgd2l0aCBBUElDIElEIDB4ZmYgaW4KdGhpcyBjYXNlLCBhbmQg
aXQgcHJldHR5IGNlcnRhaW5seSB3b3VsZCByZXF1aXJlIGZ1cnRoZXIgcHJlY2F1dGlvbnMKaWYg
d2Ugd2VyZSB0byBhbGxvdyBicmluZ2luZyB1cCBDUFVzIHdpdGggZXZlbiBsYXJnZXIgQVBJQyBJ
RHMuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
