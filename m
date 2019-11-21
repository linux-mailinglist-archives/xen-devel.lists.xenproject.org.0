Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E50104FA2
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 10:50:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXj4V-00011P-4G; Thu, 21 Nov 2019 09:48:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXj4U-00011H-Cy
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 09:48:18 +0000
X-Inumbo-ID: 0a906398-0c44-11ea-a326-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a906398-0c44-11ea-a326-12813bfff9fa;
 Thu, 21 Nov 2019 09:48:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE985AE39;
 Thu, 21 Nov 2019 09:48:15 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191120173920.8705-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <861a7ddf-b87f-0572-a586-56b9a2f840b0@suse.com>
Date: Thu, 21 Nov 2019 10:48:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120173920.8705-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vlapic: allow setting
 APIC_SPIV_FOCUS_DISABLED in x2APIC mode
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAxODozOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQgY29k
ZSB1bmNvbmRpdGlvbmFsbHkgcHJldmVudHMgc2V0dGluZyBBUElDX1NQSVZfRk9DVVNfRElTQUJM
RUQKPiByZWdhcmRsZXNzIG9mIHRoZSBwcm9jZXNzb3IgbW9kZWwsIHdoaWNoIGlzIG5vdCBjb3Jy
ZWN0IGFjY29yZGluZyB0bwo+IHRoZSBzcGVjaWZpY2F0aW9uLgo+IAo+IEZpeCBpdCBieSBhbGxv
d2luZyBzZXR0aW5nIEFQSUNfU1BJVl9GT0NVU19ESVNBQkxFRCBiYXNlZCBvbiB0aGUKPiBkb21h
aW4gY3B1aWQgcG9saWN5LgoKV291bGQgeW91IG1pbmQgYWRkaW5nIGhhbGYgYSBzZW50ZW5jZSB0
byBjbGFyaWZ5IHdoZXRoZXIgdGhpcyBpcyBhCnByb2JsZW0gb2JzZXJ2ZWQgaW4gcHJhY3RpY2Us
IG9yIHNpbXBseSBmb3VuZCBieSBjb2RlIGluc3BlY3Rpb24/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vdmxhcGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZsYXBpYy5jCj4gQEAgLTk3
Nyw2ICs5NzcsNyBAQCBpbnQgZ3Vlc3Rfd3Jtc3JfeDJhcGljKHN0cnVjdCB2Y3B1ICp2LCB1aW50
MzJfdCBtc3IsIHVpbnQ2NF90IG1zcl9jb250ZW50KQo+ICB7Cj4gICAgICBzdHJ1Y3QgdmxhcGlj
ICp2bGFwaWMgPSB2Y3B1X3ZsYXBpYyh2KTsKPiAgICAgIHVpbnQzMl90IG9mZnNldCA9IChtc3Ig
LSBNU1JfWDJBUElDX0ZJUlNUKSA8PCA0Owo+ICsgICAgY29uc3Qgc3RydWN0IGNwdWlkX3BvbGlj
eSAqY3B1aWQgPSB2LT5kb21haW4tPmFyY2guY3B1aWQ7CgpXZSBjb21tb25seSBuYW1lIHN1Y2gg
dmFyaWFibGVzICJjcCIuCgo+IEBAIC05OTMsNiArOTk0LDE0IEBAIGludCBndWVzdF93cm1zcl94
MmFwaWMoc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwgdWludDY0X3QgbXNyX2NvbnRlbnQp
Cj4gIAo+ICAgICAgY2FzZSBBUElDX1NQSVY6Cj4gICAgICAgICAgaWYgKCBtc3JfY29udGVudCAm
IH4oQVBJQ19WRUNUT1JfTUFTSyB8IEFQSUNfU1BJVl9BUElDX0VOQUJMRUQgfAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICogQVBJQ19TUElWX0ZPQ1VTX0RJU0FCTEVEIGlzIG5vdCBzdXBwb3J0ZWQgb24KPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKiBJbnRlbCBQZW50aXVtIDQgYW5kIFhlb24gcHJvY2Vz
c29ycy4KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAoKGNwdWlkLT54ODZfdmVuZG9yICE9IFg4Nl9WRU5ET1JfSU5URUwg
fHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdldF9jcHVfZmFtaWx5KGNwdWlk
LT5iYXNpYy5yYXdfZm1zLCBOVUxMLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgTlVMTCkgIT0gMTUpID8KPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIEFQSUNfU1BJVl9GT0NVU19ESVNBQkxFRCA6IDApIHwKCkRvIHdlIGFjdHVhbGx5IG5l
ZWQgdGhpcyAodmlydHVhbCkgZmFtaWx5IGNoZWNrPyBJZiBJJ20gbm90IG1pc3Rha2VuCi0gcGh5
c2ljYWwgZmFtaWx5IDB4ZiBDUFVzIGRvbid0IHN1cHBvcnQgeDJBUElDLAotIGluIHhBUElDIG1v
ZGUsIHdyaXRpbmcgcmVzZXJ2ZWQgYml0cyB3b3VsZG4ndCBmYXVsdCAtIHN1Y2ggd3JpdGVzCiAg
d291bGQgc2ltcGx5IGJlIGlnbm9yZWQuClRoZXJlZm9yZSBJIHNlZSBubyByaXNrIGluIGFsd2F5
cyBwZXJtaXR0aW5nIHRoZSBiaXQgdG8gZ2V0IHNldAoobGlrZSB0aGUgY29ycmVzcG9uZGluZyB4
QVBJQyBsb2dpYyBkb2VzLCBzYWRseSBieSB1c2luZyBhIGxpdGVyYWwKbnVtYmVyIGluc3RlYWQg
b2YgQVBJQ19TUElWXyopLiBPbiB0aGUgY29udHJhcnksIGNvZGUgc2VlaW5nIGFuCngyQVBJQyBt
aWdodCBhc3N1bWUgdGhlIGZsYWcgdG8gYmUgc2V0dGFibGUgcmVnYXJkbGVzcyBvZiBmYW1pbHkK
KGJlY2F1c2UgaW1wbGljaXRseSBpdCB3b3VsZG4ndCBleHBlY3QgdG8gYmUgb24gZmFtaWx5IDB4
ZikuCgpJZiB5ZXMgLSAiWGVvbiIgaXMgd2F5IHRvbyBicm9hZCBhIHN0YXRlbWVudCBoZXJlLiBZ
ZXMsIEludGVsJ3MgZG9jCmFzIHdlbGwgYXMgb2xkIGNvZGUgZWxzZXdoZXJlIGluIFhlbiBzYXkg
c28gdG9vLCBidXQgc2luY2UgdGhlbiB0aGUKbmFtZSB3YXMgdXNlZCBmb3IgYSBsYXJnZSByYW5n
ZSBvZiBmYW1pbHkgNiBzZXJ2ZXIgQ1BVcyBhcyB3ZWxsLgoKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoVkxBUElDX1ZFUlNJT04gJiBBUElDX0xWUl9ESVJFQ1RFRF9FT0kKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgPyBBUElDX1NQSVZfRElSRUNURURfRU9JIDogMCkp
ICkKPiAgICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfRVhDRVBUSU9OOwo+IAoKSWYgeW91IGFs
cmVhZHkgdGFrZSBjYXJlIG9mIHRoaXMgZmFtaWx5IGRpZmZlcmVuY2UsIHdvdWxkbid0IHlvdQpi
ZXR0ZXIgYWRkcmVzcyB0aGUgb3RoZXIgb25lIChhZmZlY3RpbmcgdGhlIGxvdyA0IGJpdHMpIGFz
IHdlbGwKKGF0IGxlYXN0IGluIHRoZSB4QVBJQyBjYXNlKT8gKEZBT0QgaWYgdGhlIHZpcnR1YWwg
ZmFtaWx5CmRlcGVuZGVuY3kgd2FzIGRyb3BwZWQgYWJvdmUsIHRoZW4gSSdkIHJhdGhlciBub3Qg
c2VlIG9uZQppbnRyb2R1Y2VkIGZvciB0aGlzIGNhc2UgZWl0aGVyLikKCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
