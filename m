Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2CF13DA3F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 13:43:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is4S4-00077J-KQ; Thu, 16 Jan 2020 12:40:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is4S2-00077E-Pa
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 12:40:42 +0000
X-Inumbo-ID: 660bca7e-385d-11ea-871a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 660bca7e-385d-11ea-871a-12813bfff9fa;
 Thu, 16 Jan 2020 12:40:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C4966AE2A;
 Thu, 16 Jan 2020 12:40:37 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200115170015.249667-1-anthony.perard@citrix.com>
 <20200115170015.249667-3-anthony.perard@citrix.com>
 <1b0dcb84-425c-48a2-dba8-03385d3bf4e2@suse.com>
 <20200116122922.GA1288@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f09684ed-4a82-0547-8cd1-019a6b762fe4@suse.com>
Date: Thu, 16 Jan 2020 13:40:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200116122922.GA1288@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 2/6] xen: Have Kconfig check $(CC)'s
 version
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxMzoyOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MTYsIDIwMjAgYXQgMTI6MzA6NDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE1
LjAxLjIwMjAgMTg6MDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gLS0tIGEveGVuL0tjb25m
aWcKPj4+ICsrKyBiL3hlbi9LY29uZmlnCj4+PiBAQCAtNCw5ICs0LDI1IEBACj4+PiAgIwo+Pj4g
IG1haW5tZW51ICJYZW4vJChTUkNBUkNIKSAkKFhFTl9GVUxMVkVSU0lPTikgQ29uZmlndXJhdGlv
biIKPj4+ICAKPj4+ICtzb3VyY2UgInNjcmlwdHMvS2NvbmZpZy5pbmNsdWRlIgo+Pj4gKwo+Pj4g
IGNvbmZpZyBCUk9LRU4KPj4+ICAJYm9vbAo+Pj4gIAo+Pj4gK2NvbmZpZyBDQ19JU19HQ0MKPj4+
ICsJZGVmX2Jvb2wgJChzdWNjZXNzLCQoQ0MpIC0tdmVyc2lvbiB8IGhlYWQgLW4gMSB8IGdyZXAg
LXEgZ2NjKQo+Pj4gKwo+Pj4gK2NvbmZpZyBHQ0NfVkVSU0lPTgo+Pj4gKwlpbnQKPj4+ICsJZGVm
YXVsdCAkKHNoZWxsLCQoQkFTRURJUikvc2NyaXB0cy9nY2MtdmVyc2lvbi5zaCAkKENDKSkKPj4+
ICsKPj4+ICtjb25maWcgQ0NfSVNfQ0xBTkcKPj4+ICsJZGVmX2Jvb2wgJChzdWNjZXNzLCQoQ0Mp
IC0tdmVyc2lvbiB8IGhlYWQgLW4gMSB8IGdyZXAgLXEgY2xhbmcpCj4+PiArCj4+PiArY29uZmln
IENMQU5HX1ZFUlNJT04KPj4+ICsJaW50Cj4+PiArCWRlZmF1bHQgJChzaGVsbCwkKEJBU0VESVIp
L3NjcmlwdHMvY2xhbmctdmVyc2lvbi5zaCAkKENDKSkKPj4KPj4gSSBjb250aW51ZSB0byBiZSB1
bmhhcHB5IGFib3V0IHRoZSByZWR1bmRhbmN5LCBidXQgSSB3aWxsIGFjY2VwdAo+PiBpdCBpZiBv
dGhlcnMgaW5kZWVkIHRoaW5rIHRoaXMgaXMgaGVscGZ1bC4gSG93ZXZlciwgSSBkb24ndCBzZWUK
Pj4gdGhlbiB3aHkgdGhlIHNldHRpbmcgb2YgQ0NfSVNfKiBuZWVkIGFub3RoZXIgc2hlbGwgaW52
b2NhdGlvbgo+PiBlYWNoIC0gdGhpcyBjb3VsZCBqdXN0IGJlICpfVkVSU0lPTiA+IDAgdGhlbiwg
c2VlaW5nIHRoYXQgdGhlCj4+IHNjcmlwdHMgYWxyZWFkeSB0byBhIHJlc3BlY3RpdmUgZ3JlcCBv
ZiB0aGUgLS12ZXJzaW9uIG91dHB1dC4KPiAKPiBGcm9tIGZ1bmN0aW9uYWxpdHkgcG9pbnQgb2Yg
dmlldywgcmVwbGFjaW5nIHRoZSBtYWNybyBieQo+ICJkZWZfYm9vbCAlX1ZFUlNJT04gPiAwIiBp
biAiY29uZmlnIENDX0lTXyUiIHdvdWxkIGJlIGZpbmUsIGV2ZW4gc28gaXQKPiB3b3VsZCBiZSB3
ZWlyZCB0byByZWFkLiBJIHRoaW5rIHRoYXQgd291bGQgbmVlZCBhIGNvbW1lbnQgc2F5aW5nOgo+
ICAgIyAlLXZlcnNpb24uc2ggaXMgZXhwZWN0ZWQgdG8gcmV0dXJuICIwIiB3aGVuICQoQ0MpIGlz
bid0ICUKPiAKPiBUaGF0IGNvdWxkIGJlIGRvbmUgb24gY29tbWl0LgoKU3VyZS4KCj4+IEV2ZW4g
YmV0dGVyIHdvdWxkIGltbyBiZSwgYXMgc3VnZ2VzdGVkIGJlZm9yZSwgYSAiZGVwZW5kcyBvbgo+
PiBDQ19JU18qIiBvbiBlYWNoICpfVkVSU0lPTi4KPiAKPiBIYXZlbid0IHdlIGRpc2N1c3NlZCB0
aGlzIGJlZm9yZT8KCkluZGVlZCwgaGVuY2UgYWxzbyBteSAiYXMgc3VnZ2VzdGVkIGJlZm9yZSIu
IEkgcmVtYWluIHVuY29udmluY2VkCnRoYXQgaXMgaXQgdXNlZnVsIHRvIGhhdmUgZS5nLgoKQ09O
RklHX0dDQ19WRVJTSU9OPTgwMzAwCkNPTkZJR19DTEFOR19WRVJTSU9OPTAKCmluIHhlbi8uY29u
ZmlnLiBUaGlzIGlzIGF0IGJlc3QgY29uZnVzaW5nLCBiZWNhdXNlIGl0IG1heSBub3QKcmVwcmVz
ZW50IHdoYXQgdGhlIHN5c3RlbSBhY3R1YWxseSBoYXMgaW5zdGFsbGVkICh3aGljaCBJIHJlYWxp
emUKaXMgYWxzbyBub3QgdGhlIGludGVudGlvbiwgYnV0IHRoZSB2YXJpYWJsZSBuYW1pbmcgc3Vn
Z2VzdHMgdGhhdAp0aGlzIGlzIHdoYXQgd2FzIGZvdW5kIG9uIHRoZSBzeXN0ZW07IEkgaGF2ZSBu
byBiZXR0ZXIgbmFtaW5nCnN1Z2dlc3Rpb24sIHRvIHByZWVtcHQgYSBwb3NzaWJsZSBxdWVzdGlv
biB0byB0aGlzIGVmZmVjdCkuCgo+PiBBcyBhIG5pdCAtIGNvbW1vbiBzdHlsZSBlbHNld2hlcmUg
d291bGQgc3VnZ2VzdCB0aGF0IHRoZXJlIG91Z2h0Cj4+IHRvIGJlIGEgYmxhbmsgYWZ0ZXIgdGhl
IGNvbW1hcyBpbiAkKG1hY3JvLCAuLi4pIGludm9jYXRpb25zLgo+PiBUaGlzIHdvdWxkIHRoZW4g
ZXh0ZW5kIHRvIEtjb25maWcuaW5jbHVkZSBhcyB3ZWxsLCB1bmxlc3MgdGhhdCdzCj4+IGEgbGFy
Z2VseSB2ZXJiYXRpbSBpbmhlcml0ZWQgZmlsZS4KPiAKPiBUaGF0J3Mgbm90IGEgZ29vZCBpZGVh
LCBpdCBtYXkgbm90IG1hdHRlciBpbiB0aGlzIGNhc2UgYnV0IGFkZGluZyBhCj4gc3BhY2UgYWZ0
ZXIgY29tbWFzIGluIHNvbWUgb3RoZXIgY2FzZXMgd2lsbCBub3QgZG8gd2hhdCBvbmUgd2FudHMu
IG1ha2UKPiBhbmQgS2NvbmZpZyBrZWVwcyB0aGUgc3BhY2VzIHdoZW4gZXhwYW5kaW5nIHRoZSBt
YWNyby4KCldoZXJlIGJsYW5rcyBtYXR0ZXIgdGhleSBzaG91bGQgb2YgY291cnNlIGJlIG9taXR0
ZWQuIFdoZW4gdGhleQpkb24ndCBtYXR0ZXIsIHBlcnNvbmFsbHkgSSB0aGluayBjb21tb24gc3R5
bGUgZ3VpZGVsaW5lcyBzaG91bGQgYmUKaG9ub3JlZC4gQnV0IHRoaXMgbWF5IGJlIGp1c3QgbWUg
Li4uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
