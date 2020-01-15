Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2312113C24B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 14:10:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iriOR-0002pL-46; Wed, 15 Jan 2020 13:07:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wJf7=3E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iriOQ-0002pF-8t
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 13:07:30 +0000
X-Inumbo-ID: f6f53460-3797-11ea-b89f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6f53460-3797-11ea-b89f-bc764e2007e4;
 Wed, 15 Jan 2020 13:07:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B3A02ADE3;
 Wed, 15 Jan 2020 13:07:20 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200113175020.32730-1-andrew.cooper3@citrix.com>
 <20200113175020.32730-4-andrew.cooper3@citrix.com>
 <e3ed87ff-5142-5105-2c6f-97a185d0b8e9@suse.com>
 <0a3aa710-3172-3133-58b6-c96b828d06cc@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98464dda-7ced-28ee-7212-fe64ecc512a8@suse.com>
Date: Wed, 15 Jan 2020 14:07:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <0a3aa710-3172-3133-58b6-c96b828d06cc@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] x86/page: Remove bifurcated
 PAGE_HYPERVISOR constant
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDEuMjAyMCAxMzo1MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNC8wMS8yMDIw
IDE2OjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
eDg2XzY0L3BhZ2UuaAo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni94ODZfNjQvcGFnZS5o
Cj4+PiBAQCAtMTcyLDE4ICsxNzIsMTEgQEAgc3RhdGljIGlubGluZSBpbnRwdGVfdCBwdXRfcHRl
X2ZsYWdzKHVuc2lnbmVkIGludCB4KQo+Pj4gICNkZWZpbmUgUEFHRV9IWVBFUlZJU09SX1JYICAg
ICAgKF9fUEFHRV9IWVBFUlZJU09SX1JYICAgICAgfCBfUEFHRV9HTE9CQUwpCj4+PiAgI2RlZmlu
ZSBQQUdFX0hZUEVSVklTT1JfUldYICAgICAoX19QQUdFX0hZUEVSVklTT1IgICAgICAgICB8IF9Q
QUdFX0dMT0JBTCkKPj4+ICAKPj4+IC0jaWZkZWYgX19BU1NFTUJMWV9fCj4+PiAtLyogRGVwZW5k
ZW5jeSBvbiBOWCBiZWluZyBhdmFpbGFibGUgY2FuJ3QgYmUgZXhwcmVzc2VkLiAqLwo+Pj4gLSMg
ZGVmaW5lIFBBR0VfSFlQRVJWSVNPUiAgICAgICAgIFBBR0VfSFlQRVJWSVNPUl9SV1gKPj4+IC0j
IGRlZmluZSBQQUdFX0hZUEVSVklTT1JfVUNNSU5VUyAoX19QQUdFX0hZUEVSVklTT1JfVUNNSU5V
UyB8IF9QQUdFX0dMT0JBTCkKPj4+IC0jIGRlZmluZSBQQUdFX0hZUEVSVklTT1JfVUMgICAgICAo
X19QQUdFX0hZUEVSVklTT1JfVUMgICAgICB8IF9QQUdFX0dMT0JBTCkKPj4+IC0jZWxzZQo+Pj4g
ICMgZGVmaW5lIFBBR0VfSFlQRVJWSVNPUiAgICAgICAgIFBBR0VfSFlQRVJWSVNPUl9SVwo+Pj4g
ICMgZGVmaW5lIFBBR0VfSFlQRVJWSVNPUl9VQ01JTlVTIChfX1BBR0VfSFlQRVJWSVNPUl9VQ01J
TlVTIHwgXAo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfUEFHRV9HTE9C
QUwgfCBfUEFHRV9OWCkKPj4+ICAjIGRlZmluZSBQQUdFX0hZUEVSVklTT1JfVUMgICAgICAoX19Q
QUdFX0hZUEVSVklTT1JfVUMgfCBcCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF9QQUdFX0dMT0JBTCB8IF9QQUdFX05YKQo+PiAuLi4gSSdtIGFmcmFpZCB0aGUgYXNzZW1i
bGVyIGVycm9yIHJlc3VsdGluZyBmcm9tIHNvbWVvbmUgYWN0dWFsbHkKPj4gKGFuZCBtaXN0YWtl
bmx5KSB1c2luZyBvbmUgb2YgdGhlIGNvbnN0YW50cyBtYWtpbmcgdXNlIG9mIF9QQUdFX05YCj4+
IGlzIGdvaW5nIHRvIGJlIHJhdGhlciBjcnlwdGljLiBXaGljaCBpbiB0dXJuIG1heSBtb3RpdmF0
ZSBwZW9wbGUKPj4gdG8gYWN0dWFsbHkgdHJ5IHRvIG1ha2UgX1BBR0VfTlggIndvcmsiIGluIGFz
c2VtYmx5IGNvZGUuIFRoZXJlZm9yZQo+PiBJJ2QgbGlrZSB0byBhc2sgdGhhdCB0b2dldGhlciB3
aXRoIHRoZSBjaGFuZ2VzIGhlcmUgX1BBR0VfTlgncwo+PiAjZGVmaW5lIGJlIGZyYW1lZCBieSAj
aWZuZGVmIF9fQVNTRU1CTFlfXywgc3VjaCB0aGF0IGFueQo+PiBkaWFnbm9zdGljLCBpZiBpdCBt
ZW50aW9ucyBhIHN5bWJvbCBuYW1lLCB3b3VsZCBuYW1lIHRoZSBhY3R1YWwKPj4gcHJvYmxlbSwg
cmF0aGVyIHRoYW4gYSBkZXJpdmVkIG9uZS4KPiAKPiBJIGNhbiBkbyB0aGlzLCBidXQgaXQgZG9l
c24ndCBtYWtlIHRoZSBlcnJvciBhbnkgbGVzcyBjcnlwdGljLgo+IAo+IFdpdGggX1BBR0VfTlgg
aGlkZGVuOgo+IAo+IGhlYWQuUzogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+IGhlYWQuUzo2Nzc6IEVy
cm9yOiBpbnZhbGlkIG9wZXJhbmRzICgqQUJTKiBhbmQgKlVORCogc2VjdGlvbnMpIGZvciBgfCcK
ClRoaXMgaXMgc29tZXRoaW5nIHRoYXQgY291bGQgYmUgaW1wcm92ZWQgaW4gdGhlIGZ1dHVyZSBp
biBnYXMKKGJ5IHNpbXBseSBuYW1pbmcgdGhlIHN5bWJvbCBmb3VuZCB0byBiZSAqVU5EKikuCgo+
IFdpdGggaXQgdmlzaWJsZToKPiAKPiBoZWFkLlM6IEFzc2VtYmxlciBtZXNzYWdlczoKPiBoZWFk
LlM6Njc3OiBFcnJvcjogaW52YWxpZCBjaGFyYWN0ZXIgJz8nIGluIG9wZXJhbmQgMQoKVGhpcywg
b3RvaCwgY2FuJ3Qgc2Vuc2libHkgYmUgZXhwZWN0ZWQgdG8gc2VlIGFuIGltcHJvdmVtZW50Lgoo
V2VsbCwgcGVyaGFwcyB0aGUgZnVsbCBsaW5lIGNvdWxkIGJlIHF1b3RlZCwgYnV0IHRoYXQncyB0
cnVlCmZvciBhYm91dCBldmVyeSBwYXJzaW5nIGVycm9yLikKCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
