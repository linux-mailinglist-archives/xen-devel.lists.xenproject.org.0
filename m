Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA581396BC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 17:49:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir2rF-0006RV-Nw; Mon, 13 Jan 2020 16:46:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ir2rE-0006RQ-AG
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 16:46:28 +0000
X-Inumbo-ID: 3ce6b91f-3624-11ea-82a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ce6b91f-3624-11ea-82a9-12813bfff9fa;
 Mon, 13 Jan 2020 16:46:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39052AE03;
 Mon, 13 Jan 2020 16:46:26 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <8b795995-4f61-af08-2ead-5a841cb709f0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e32e75f1-08f1-bdff-b347-23293dafb933@suse.com>
Date: Mon, 13 Jan 2020 17:46:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8b795995-4f61-af08-2ead-5a841cb709f0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] EFI development issues
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAxNzowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBNeSByZWNlbnQgYm9v
dCBwYWdldGFibGUgY2hhbmdlcyBoYXZlIGNhdXNlZCBtZSB0byB3b3JrIHdpdGggdGhlIEVGSQo+
IGJ1aWxkIG9mIFhlbiByYXRoZXIgbW9yZSB0aGFuIHByZXZpb3VzbHkuCj4gCj4gRmlyc3QsIHRo
ZXJlIGlzIGEgZGVwZW5kZW5jeSB0cmFja2luZyBidWcgaW4gdGhlIGJ1aWxkIHN5c3RlbS7CoCBF
ZGl0cyB0bwo+IHhlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaCBkb24ndCBjYXVzZSB4ZW4uZWZp
IHRvIGJlIHJlZ2VuZXJhdGVkLsKgIEZyb20KPiB3aGF0IEkgY2FuIHRlbGwsIHRoZSBmaWxlIGRv
ZXNuJ3QgZXZlbiBnZXQgcmVjb21waWxlZCwgYmVjYXVzZSBzeW50YXgKPiBlcnJvcnMgZXZlbiBn
byB1bm5vdGljZWQuCgpOb3QgYW4gaXNzdWUgaGVyZSwgSSd2ZSBqdXN0IG5vdyB0cmllZCBpdCBv
dXQuIC5ib290Lm8uZCBhbHNvCmNvcnJlY3RseSBuYW1lcyB0aGUgZmlsZSBoZXJlLgoKPiBTZWNv
bmQsIGFuZCB0aGUgbWFpbiBwb2ludCBvZiB0aGUgZW1haWwuCj4gCj4gVGhlIEVGSSBjb2RlIGhh
cyBzb21lIGxvZ2ljIHdoaWNoIGRvZXM6Cj4gCj4gaWYgKCAhYmFzZV92aWRlbyApCj4gewo+IMKg
wqDCoCAuLi4KPiAKPiDCoMKgwqAgaWYgKCBiZXN0ICE9IFN0ZE91dC0+TW9kZS0+TW9kZSApCj4g
wqDCoMKgIMKgwqDCoCBTdGRPdXQtPlNldE1vZGUoU3RkT3V0LCBiZXN0KTsKPiB9Cj4gCj4ganVz
dCBiZWZvcmUgcHJpbnRpbmcgb3V0IHRoZSBYZW4gYmFubmVyLsKgIFRoaXMgaGFzIGEgc2lkZSBl
ZmZlY3Qgb2YKPiBjYXVzaW5nIGFsbCBmdXJ0aGVyIHVzZSBvZiBTdGRPdXQvU3RkRXJyIHRvIGNl
YXNlIHdvcmtpbmcsIGFuZAo+IGludGVyZmVyaW5nIGNvbXBsZXRlbHkgd2l0aCBkZWJ1Z2dpbmcg
YWN0aXZpdGllcy4KCkludGVyZXN0aW5nLCBhbmQgY2VydGFpbmx5IHVuaW50ZW5kZWQuIE9idmlv
dXNseSB0aGUgIm5vcm1hbCIgb3V0cHV0CndvcmtzIChmb3IgbWUgYXQgbGVhc3QsIHdpdGggb3Ig
d2l0aG91dCBzZXJpYWwgY29uc29sZSwgYWxiZWl0IEkKZG9uJ3QgdGhpbmsgSSd2ZSBldmVyIHRy
aWVkIGhlYWRsZXNzLCBpLmUuIF9qdXN0XyBhIHNlcmlhbCBjb25zb2xlKSwKc28gaXQncyBub3Qg
ZXhhY3RseSBjbGVhciB0byBtZSB3aGF0IG90aGVyICJkZWJ1Z2dpbmcgYWN0aXZpdGllcyIgaXQK
bWF5IGludGVyZmVyZSB3aXRoLiBBIGJyb2tlbiBTdGRPdXQgLyBTdGRFcnIgcHJvdG9jb2wgaW1w
bGVtZW50YXRpb24KaW4gdGhlIGZpcm13YXJlPwoKPsKgIChXYWl0aW5nIGZvciBhCj4ga2V5cHJl
c3Mgb24gU3RkSW4gaG93ZXZlciBkb2VzIHdvcmssIHdoaWNoIGlzIGhvdyBJIGV2ZW50dWFsbHkg
ZGlhZ25vc2VkCj4gdGhhdCBpdCB3YXMgYW4gb3V0cHV0IHByb2JsZW0uKcKgIFNraXBwaW5nIHRo
aXMgbG9naWMgYWxsb3dzIGRlYnVnZ2luZyB0bwo+IHdvcmsuCgpBcyBzaG91bGQgdGhlbiBkbyAt
YmFzZXZpZGVvLgoKPiBUaGUgY29kZSBhcHBlYXJlZCBpbiBiZjY1MDFhNjIgIng4Ni02NDogRUZJ
IGJvb3QgY29kZSIgYW5kIGhhcyBubwo+IHNwZWNpZmljIGRlc2NyaXB0aW9uIG9mIHdoYXQgaXQg
aXMgZG9pbmcgYW5kL29yIHRyeWluZyB0byBhY2hpZXZlLgoKZWZpX2NvbnNvbGVfc2V0X21vZGUo
KSBpcyBzaW1wbGUgZW5vdWdoIEkgdGhpbms6IEl0IHRyaWVzIHRvIG1heGltaXplCnNjcmVlbiBk
aW1lbnNpb25zLiAoVGhlcmUncyBzb21lIGhpc3RvcmljYWwgY29udGV4dCBoZXJlLCBhcyB0aGUK
Y29kZSB3YXNuJ3Qgd3JpdHRlbiBmcm9tIHNjcmF0Y2g6IFNlcmlhbCBjb25zb2xlcyBvZnRlbiB3
ZXJlbid0CmF2YWlsYWJsZSB3aGVuIGNvbGxlYWd1ZXMgb2YgbWluZSBhbmQgSSBkaWQgc29tZSBv
ZiB0aGUgb3JpZ2luYWwgRUZJCmVuYWJsaW5nIHdvcmsgZm9yIGEgbG9uZyBjYW5jZWxlZCBwcm9q
ZWN0LiBQbHVzIHRoZXJlIHdlIGhhZCBhIHJhdGhlcgpiZXR0ZXIgKHRtKSBrZXJuZWwgZGVidWdn
ZXIsIHdhbnRpbmcgdG8gdXRpbGl6ZSBhcyBoaWdoIHJlc29sdXRpb24gYQpzY3JlZW4gYXMgcG9z
c2libGUgdG8gc2hvdyBhcyBtdWNoIHVzZWZ1bCBpbmZvcm1hdGlvbiBhcyBwb3NzaWJsZSBhdAph
bnkgcG9pbnQgaW4gdGltZS4pCgo+IEl0IGlzIGFsc28gbm90IGVudGlyZWx5IGNsZWFyIHdoeSBp
dCBpcyBnYXRlZCBvbiBoYXZpbmcgYSBjZmcgZmlsZSBpbgo+IHRoZSBmaXJzdCBwbGFjZSAoYy9z
ICxjMzhjZjg2NWVjOCwgbm90IHRoYXQgdGhlcmUgaXMgYWRlcXVhdGUgY29udGV4dAo+IGZvciB3
aHkpCgpUaGUgZGVzY3JpcHRpb24gb2YgdGhlIGNpdGVkIGNvbW1pdCBpcyBjbGVhciBlbm91Z2gs
IGlzbid0IGl0PwpUaGlzIGlzIGp1c3QgdGhlIHNhbWUgZGlzdGluY3Rpb24gKGp1c3QgcGxhY2Vk
IGRpZmZlcmVudGx5KSBmb3IKQXJtIGFzIHRoYXQgYmV0d2VlbiBlZmlfc3RhcnQoKSAoZG9pbmcg
bW9zdCBvZiB0aGlzIHN0dWZmKSBhbmQKZWZpX211bHRpYm9vdDIoKSAobm90IGRvaW5nIHNvLCBp
biBwYXJ0aWN1bGFyIHRoZSBjb21tYW5kIGxpbmUKcGFyc2luZywgYW5kIGUuZy4gbm90IGV2ZW4g
cHJvdmlkaW5nIGEgbWVhbnMgdG8gc3VwcHJlc3MgdGhlCmNhbGwgdG8gZWZpX2NvbnNvbGVfc2V0
X21vZGUoKSkuCgpGb3IgYW55dGhpbmcgYmV5b25kIHRoaXMgSSBoYXZlIHRvIGRlZmVyIHRvIHRo
ZSBBcm0gZm9sa3MsIHdobwp3YW50ZWQgaXQgdGhpcyB3YXkuCgo+IG9yIHdoeSB0aGVyZSBpcyBh
IFhlbiBjb21tYW5kIGxpbmUgYXJndW1lbnQgIi1iYXNldmlkZW8iCj4gaW50cm9kdWNlZCBpbiB0
aGUgYmVnaW5uaW5nIHRvIHNraXAgdGhpcyBiZWhhdmlvdXIuCgpUcmFkaXRpb25hbGx5IHZpZGVv
IG1vZGUgc2V0dGluZyBoYWQgaXRzIHByb2JsZW1zLCBoZW5jZSB3ZQphbnRpY2lwYXRlZCB0aGVy
ZSBtYXkgYmUgcHJvYmxlbXMgYWxzbyB3aXRoIEVGSSBkb2luZyBzby4gQXMgYQpyZXN1bHQgd2Ug
d2FudGVkLCBmcm9tIHRoZSB2ZXJ5IGJlZ2lubmluZywgYSBzaW1wbHkgbWVhbnMgdG8KZ2V0IHBh
c3QgYW55IHN1Y2guCgo+IEFzIGEgcG9pbnQgb2YgcmVmZXJlbmNlLCBJIGRvbid0IHNlZSBMaW51
eCBtYWtpbmcgYW55IFNldE1vZGUgY2FsbHMuCgpXZWxsLCBpZiBJJ20gbm90IG1pc3Rha2VuIFhl
bidzIHN1cHBvcnQgZm9yIGJvb3RpbmcgYXMgYW4gRUZJCmFwcGxpY2F0aW9uIHByZWRhdGVzIExp
bnV4J2VzIGJ5IHF1aXRlIGEgYml0LCBzbyB0aGVyZSB3YXMgbm90aGluZwp0byByZWZlcmVuY2Ug
dGhlcmUuIEFzIHNhaWQsIHRoZSBvcmlnaW4gb2YgdGhpcyBjb2RlIGlzIGVsc2V3aGVyZS4KCj4g
V2hhdCBpcyB0aGUgcHVycG9zZSBvZiBjaGFuZ2luZyB0byBhIGRpZmZlcmVudCBtb2RlP8KgIENl
cnRhaW5seSBhcyBmYXIKPiBhcyBzZXJpYWwgY29uc29sZXMgZ28sIHN0aWNraW5nIHdpdGggdGhl
IG1vZGUgdGhlIGxvYWRlciB1c2VzIGNlcnRhaW5seQo+IGZlZWxzIGxpa2UgYSBzYWZlciBvcHRp
b24uCgpEb2VzIGEgc2VyaWFsIGNvbnNvbGUgcmVwb3J0IGEgInJlc29sdXRpb24iIGluIHRoZSBm
aXJzdCBwbGFjZT8gQW5kCmlmIHdlIHdlcmUgYWJsZSB0byAoc3VmZmljaWVudGx5IGVhc2lseSkg
dGVsbCB2aWRlbyBmcm9tIHNlcmlhbApjb25zb2xlLCBob3cgd291bGQgd2UgZGVhbCB3aXRoIHRo
ZSBjYXNlIG9mIFN0ZE91dCAvIFN0ZEVyciBiZWluZwptdWx0aXBsZXhlZCB0byBib3RoPwoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
