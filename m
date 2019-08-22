Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 958F599072
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2019 12:10:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0k0I-0005YH-3u; Thu, 22 Aug 2019 10:07:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r9la=WS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i0k0G-0005YC-UT
 for xen-devel@lists.xen.org; Thu, 22 Aug 2019 10:07:36 +0000
X-Inumbo-ID: a86bc228-c4c4-11e9-8980-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a86bc228-c4c4-11e9-8980-bc764e2007e4;
 Thu, 22 Aug 2019 10:07:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C94D15A2;
 Thu, 22 Aug 2019 03:07:32 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0FFC3F246;
 Thu, 22 Aug 2019 03:07:30 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
 <680c5b24-b3fd-97b6-c048-49a2bdba4a3d@arm.com>
 <BEEC1E7D-4A4D-406E-97C3-D5433BAE8CAF@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5526b464-24a6-6aca-a9f3-095492abecdd@arm.com>
Date: Thu, 22 Aug 2019 11:07:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BEEC1E7D-4A4D-406E-97C3-D5433BAE8CAF@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
 applied/reverted state tracking marker
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMi8wOC8yMDE5IDA4OjQ0LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4g
Cj4+IE9uIDIxLiBBdWcgMjAxOSwgYXQgMjM6MzQsIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20gCj4+IDxtYWlsdG86anVsaWVuLmdyYWxsQGFybS5jb20+PiB3cm90ZToKPj4gT24g
OC8yMS8xOSA5OjE5IEFNLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPj4+IExpdmVwYXRj
aCBvbmx5IHRyYWNrcyBhbiBlbnRpcmUgcGF5bG9hZCBhcHBsaWVkL3JldmVydGVkIHN0YXRlLiBC
dXQsCj4+PiB3aXRoIGFuIG9wdGlvbiB0byBzdXBwbHkgdGhlIGFwcGx5X3BheWxvYWQoKSBhbmQv
b3IgcmV2ZXJ0X3BheWxvYWQoKQo+Pj4gZnVuY3Rpb25zIGFzIG9wdGlvbmFsIGhvb2tzLCBpdCBi
ZWNvbWVzIHBvc3NpYmxlIHRvIGludGVybWl4IHRoZQo+Pj4gZXhlY3V0aW9uIG9mIHRoZSBvcmln
aW5hbCBhcHBseV9wYXlsb2FkKCkvcmV2ZXJ0X3BheWxvYWQoKSBmdW5jdGlvbnMKPj4+IHdpdGgg
dGhlaXIgZHluYW1pY2FsbHkgc3VwcGxpZWQgY291bnRlcnBhcnRzLgo+Pj4gSXQgaXMgaW1wb3J0
YW50IHRoZW4gdG8gdHJhY2sgdGhlIGN1cnJlbnQgc3RhdGUgb2YgZXZlcnkgZnVuY3Rpb24KPj4+
IGJlaW5nIHBhdGNoZWQgYW5kIHByZXZlbnQgc2l0dWF0aW9ucyBvZiB1bmludGVudGlvbmFsIGRv
dWJsZS1hcHBseQo+Pj4gb3IgdW5hcHBsaWVkIHJldmVydC4KPj4+IFRvIHN1cHBvcnQgdGhhdCwg
aXQgaXMgbmVjZXNzYXJ5IHRvIGV4dGVuZCBwdWJsaWMgaW50ZXJmYWNlIG9mIHRoZQo+Pj4gbGl2
ZXBhdGNoLiBUaGUgc3RydWN0IGxpdmVwYXRjaF9mdW5jIGdldHMgYWRkaXRpb25hbCBmaWVsZCBo
b2xkaW5nCj4+PiB0aGUgYXBwbGllZC9yZXZlcnRlZCBzdGF0ZSBtYXJrZXIuCj4+PiBUbyByZWZs
ZWN0IHRoZSBsaXZlcGF0Y2ggcGF5bG9hZCBBQkkgY2hhbmdlLCBidW1wIHRoZSB2ZXJzaW9uIGZs
YWcKPj4+IExJVkVQQVRDSF9QQVlMT0FEX1ZFUlNJT04gdXAgdG8gMi4KPj4+IFRoZSBhYm92ZSBz
b2x1dGlvbiBvbmx5IGFwcGxpZXMgdG8geDg2IGFyY2hpdGVjdHVyZSBmb3Igbm93Lgo+Pgo+PiBJ
cyB0aGlzIGdvaW5nIHRvIGJyZWFrIGxpdmVwYXRjaCBvbiBBcm0/IElmIHNvLCBkbyB5b3UgaGF2
ZSBhbnkgcGxhbiB0byBmaXggaXQ/Cj4+Cj4gCj4gTm8sIEkgZG8gbm90IHRoaW5rIGl0IGlzLiBC
dXQsIEkgYW0gdW5hYmxlIHRvIHRlc3Qgb24gQXJtIChObyBhY2Nlc3MgdG8gSFcgYW5kIFNXKSwK
PiBzbyBJIHRvb2sgdGhlIGNvbnNlcnZhdGl2ZSBhcHByb2FjaCBoZXJlLgpBcm0gcHJvdmlkZXMg
ZGVjZW50IGZyZWUgbW9kZWwgKHNlZSBGb3VuZGF0aW9uTW9kZWwpIHRoYXQgeW91IGNhbiB1c2Ug
Zm9yIGJhc2ljIAp0ZXN0aW5nLiBBbHRlcm5hdGl2ZWx5LCB5b3UgUUVNVSBhbHNvIHN1cHBvcnQg
dmlydHVhbGl6YXRpb24gZXh0ZW5zaW9uLgoKTGV0IG1lIGhhdmUgYSBsb29rIGF0IHRoZSBjb2Rl
IChJIHdpbGwgYW5zd2VyIHNlcGFyYXRlbHkpIHRvIHNlZSBpZiBJIGNhbiBzcG90IAphbnl0aGlu
Zy4KCj4gCj4+IFsuLi5dCj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpdmVw
YXRjaC5oIGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCj4+PiBpbmRleCAyYWVjNTMyZWUy
Li5hOTMxMjZmNjMxIDEwMDY0NAo+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5o
Cj4+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKPj4+IEBAIC0xMTcsNyArMTE3
LDcgQEAgaW50IGFyY2hfbGl2ZXBhdGNoX3F1aWVzY2Uodm9pZCk7Cj4+PiDCoHZvaWQgYXJjaF9s
aXZlcGF0Y2hfcmV2aXZlKHZvaWQpOwo+Pj4gwqDCoMKgdm9pZCBhcmNoX2xpdmVwYXRjaF9hcHBs
eShzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgKmZ1bmMpOwo+Pj4gLXZvaWQgYXJjaF9saXZlcGF0Y2hf
cmV2ZXJ0KGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYyk7Cj4+PiArdm9pZCBhcmNo
X2xpdmVwYXRjaF9yZXZlcnQoc3RydWN0IGxpdmVwYXRjaF9mdW5jICpmdW5jKTsKPj4KPj4gSSBk
b3VidCBsaXZlcGF0Y2ggb24gQXJtIHdpbGwgY29tcGlsZSBhZnRlciB0aGlzIGNoYW5nZS4KPj4K
PiAKPiBXaGF0IHdvdWxkIGJlIHlvdSBzdWdnZXN0aW9uIHRoZW4/CgpDcm9zcy1jb21waWxlciBh
cmUgbm93YWRheXMgd2lkZWx5IGF2YWlsYWJsZS4gU28gYnVpbGQgdGVzdGluZyB5b3VyIGNoYW5n
ZXMgaW4gCmNvbW1vbiBjb2RlIHdvdWxkIGJlIHRoZSBtaW5pbXVtLgoKSW4gdGhpcyBjYXNlLCBh
cyB5b3UgZHJvcHBlZCB0aGUgY29uc3QgZnJvbSB0aGUgcHJvdG90eXBlLCB5b3Ugd2lsbCBuZWVk
IHRvIGRvIAp0aGUgc2FtZSBpbiB0aGUgZGVjbGFyYXRpb24uCgo+IFNoYWxsIEkgbGltaXQgdGhl
IGNoYW5nZSB0byBYODYgZXZlcnl3aGVyZQo+ICDCoE9yIG1heWJlIGRyb3AgdGhlIGNvbXBpbGF0
aW9uIGZsYWcgY29tcGxldGVseT8KCkkgYW0gYSBiaXQgY29uZnVzZWQuIFdoaWNoIGNvbXBpbGF0
aW9uIGZsYWcgZG8geW91IHJlZmVyIHRvPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
