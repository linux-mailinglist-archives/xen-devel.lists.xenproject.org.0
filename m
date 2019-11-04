Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A53EE3E1
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:33:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iReKW-0008G5-HS; Mon, 04 Nov 2019 15:31:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iReKU-0008Fr-L9
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:31:42 +0000
X-Inumbo-ID: 32bcbb7a-ff18-11e9-a181-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32bcbb7a-ff18-11e9-a181-12813bfff9fa;
 Mon, 04 Nov 2019 15:31:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 54471B293;
 Mon,  4 Nov 2019 15:31:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
 <20191101202502.31750-2-andrew.cooper3@citrix.com>
 <618aa239-278d-ab34-0f91-3cf7f257a612@suse.com>
 <447d5543-dcca-0126-b987-7b5de86e7c66@citrix.com>
 <77d8c562-2541-3d69-f03b-451dad94751e@suse.com>
 <708290ba-9d5f-1ec7-889a-1e90488a6016@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0776abb4-fbf7-d3e7-67ea-c1516fa3894c@suse.com>
Date: Mon, 4 Nov 2019 16:31:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <708290ba-9d5f-1ec7-889a-1e90488a6016@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/3] x86/boot: Remove cached CPUID data from
 the trampoline
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMjAxOSAxNjoyMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNC8xMS8yMDE5
IDE1OjAzLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDQuMTEuMjAxOSAxNTo1OSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDA0LzExLzIwMTkgMTM6MjUsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE9uIDAxLjExLjIwMTkgMjE6MjUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9jcHUvaW50ZWwuYwo+Pj4+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1
L2ludGVsLmMKPj4+Pj4gQEAgLTI3MCw2ICsyNzAsNyBAQCBzdGF0aWMgdm9pZCBlYXJseV9pbml0
X2ludGVsKHN0cnVjdCBjcHVpbmZvX3g4NiAqYykKPj4+Pj4gIAlpZiAoZGlzYWJsZSkgewo+Pj4+
PiAgCQl3cm1zcmwoTVNSX0lBMzJfTUlTQ19FTkFCTEUsIG1pc2NfZW5hYmxlICYgfmRpc2FibGUp
Owo+Pj4+PiAgCQlib290c3ltKHRyYW1wb2xpbmVfbWlzY19lbmFibGVfb2ZmKSB8PSBkaXNhYmxl
Owo+Pj4+PiArCQlib290c3ltKHRyYW1wb2xpbmVfZWZlcikgfD0gRUZFUl9OWDsKPj4+Pj4gIAl9
Cj4+Pj4gSSdtIGZpbmUgd2l0aCBhbGwgb3RoZXIgY2hhbmdlcyBoZXJlLCBqdXN0IHRoaXMgb25l
IGNvbmNlcm5zIG1lOgo+Pj4+IEJlZm9yZSB5b3VyIGNoYW5nZSB3ZSBsYXRjaCBhIHZhbHVlIGlu
dG8gdHJhbXBvbGluZV9taXNjX2VuYWJsZV9vZmYKPj4+PiBqdXN0IHRvIGJlIHVzZWQgZm9yIHN1
YnNlcXVlbnQgSUEzMl9NSVNDX0VOQUJMRSB3cml0ZXMgd2UgZG8uIFRoaXMKPj4+PiBtZWFucyB0
aGF0LCBvbiBhIGh5cGVydmlzb3IgKGxpa2UgWGVuIGl0c2VsZikgc2ltcGx5IGRpc2NhcmRpbmcK
Pj4+PiBndWVzdCB3cml0ZXMgdG8gdGhlIE1TUiAod2hpY2ggaXMgImZpbmUiIHdpdGggdGhlIGRl
c2NyaWJlZCB1c2FnZQo+Pj4+IG9mIG91cnMgdXAgdG8gbm93KSwgd2l0aCB5b3VyIGNoYW5nZSB3
ZSdkIG5vdyBlbmQgdXAgdHJ5aW5nIHRvIHNldAo+Pj4+IEVGRVIuTlggd2hlbiB0aGUgZmVhdHVy
ZSBtYXkgbm90IGFjdHVhbGx5IGJlIGVuYWJsZWQgaW4KPj4+PiBJQTMyX01JU0NfRU5BQkxFLiBX
b3VsZG4ndCBzdWNoIGFuIEVGRVIgd3JpdGUgYmUgbGlhYmxlIHRvICNHUCgwKT8KPj4+PiBJLmUu
IGRvbid0IHdlIG5lZWQgdG8gcmVhZCBiYWNrIHRoZSBNU1IgdmFsdWUgaGVyZSwgYW5kIHZlcmlm
eQo+Pj4+IHdlIGFjdHVhbGx5IG1hbmFnZWQgdG8gY2xlYXIgdGhlIGJpdCBiZWZvcmUgYWN0dWFs
bHkgT1ItaW5nIGluCj4+Pj4gRUZFUl9OWD8KPj4+IElmIHRoaXMgaXMgYSBwcm9ibGVtIGluIHBy
YWN0aWNlLCBleGVjdXRpb24gd29uJ3QgY29udGludWUgYmV5b25kIHRoZQo+Pj4gbmV4dCBpZigp
IGNvbmRpdGlvbiBqdXN0IG91dCBvZiBjb250ZXh0LCB3aGljaCBzZXQgRUZFUi5OWCBvbiB0aGUg
QlNQCj4+PiB3aXRoIGFuIHVuZ3VhcmRlZCBXUk1TUi4KPj4gQW5kIGhvdyBpcyB0aGlzIGFueSBn
b29kPyBUaGlzIGtpbmQgb2YgY3Jhc2ggaXMgZXhhY3RseSB3aGF0IEknbQo+PiBhc2tpbmcgdG8g
YXZvaWQuCj4gCj4gV2hhdCBpcyB0aGUgcG9pbnQgb2Ygd29ya2luZyBhcm91bmQgYSB0aGVvcmV0
aWNhbCBlZGdlIGNhc2Ugb2YgYnJva2VuCj4gbmVzdGluZyB1bmRlciBYZW4gd2hpY2ggZGVtb25z
dHJhYmx5IGRvZXNuJ3QgZXhpc3QgaW4gcHJhY3RpY2U/CgpXZWxsLCBzbyBmYXIgbm90aGluZyB3
YXMgc2FpZCBhYm91dCB0aGlzIG5vdCBiZWluZyBhbiBhY3R1YWwgcHJvYmxlbS4KSSBzaW1wbHkg
ZG9uJ3Qga25vdyB3aGV0aGVyIGhhcmR3YXJlIHdvdWxkIHJlZnVzZSBzdWNoIGFuIEVGRVIgd3Jp
dGUuCklmIGl0IGRvZXMsIGl0IHdvdWxkIGJlIGFwcHJvcHJpYXRlIGZvciBoeXBlcnZpc29ycyB0
byBhbHNvIHJlZnVzZQppdC4gSS5lLiBpZiB3ZSBkb24ndCBkbyBzbyByaWdodCBub3csIGNvcnJl
Y3RpbmcgdGhlIGJlaGF2aW9yIHdvdWxkCnRyaXAgdGhlIGNvZGUgaGVyZS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
