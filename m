Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82060AD80D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:39:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Hyp-0001az-FN; Mon, 09 Sep 2019 11:37:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Hyn-0001au-BI
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:37:09 +0000
X-Inumbo-ID: 270c4cf8-d2f6-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 270c4cf8-d2f6-11e9-b299-bc764e2007e4;
 Mon, 09 Sep 2019 11:37:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9A624AD44;
 Mon,  9 Sep 2019 11:37:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <68db6d1a-6498-30a6-6604-a568056dd1e0@suse.com>
 <d6419b76-7864-5d45-1ddd-8c84ae4e3271@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f55d7e1c-eee0-b5cf-0aa1-47b47cd4aea2@suse.com>
Date: Mon, 9 Sep 2019 13:37:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d6419b76-7864-5d45-1ddd-8c84ae4e3271@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86emul: fix test harness and fuzzer
 build dependencies
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAxMzowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8wOS8yMDE5
IDE1OjA5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gQ29tbWl0IGZkMzVmMzJiNGIgKCJ0b29scy94
ODZlbXVsOiBVc2Ugc3RydWN0IGNwdWlkX3BvbGljeSBpbiB0aGUKPj4gdXNlcnNwYWNlIHRlc3Qg
aGFybmVzc2VzIikgZGlkbid0IGFjY291bnQgZm9yIHRoZSBkZXBlbmRlbmNpZXMgb2YKPj4gY3B1
aWQtYXV0b2dlbi5oIHRvIHBvdGVudGlhbGx5IGNoYW5nZSBiZXR3ZWVuIGluY3JlbWVudGFsIGJ1
aWxkcy4gSW4KPj4gcGFydGljdWxhciB0aGUgaGFybmVzcyBoYXMgYSAicnVuIiBnb2FsIHdoaWNo
IGlzIHN1cHBvc2VkIHRvIGJlIHVzYWJsZQo+PiBpbmRlcGVuZGVudGx5IG9mIHRoZSByZXN0IG9m
IHRoZSB0b29scyBzdWItdHJlZSBidWlsZGluZywgYW5kIGJvdGggdGhlCj4+IGhhcm5lc3MgYW5k
IHRoZSBmdXp6ZXIgY29kZSBhcmUgYWxzbyBzdXBwb3NlZCB0byBiZSBidWlsZGFibGUKPj4gaW5k
ZXBlbmRlbnRseS4gVGhlcmVmb3JlIGEgcmUtYnVpbGQgb2YgdGhlIGdlbmVyYXRlZCBoZWFkZXIg
bmVlZHMgdG8gYmUKPj4gdHJpZ2dlcmVkIGZpcnN0LCB3aGljaCBpcyBhY2hpZXZlZCBieSBpbnRy
b2R1Y2luZyBhIG5ldyB0b3AtbGV2ZWwgdGFyZ2V0Cj4+IHBhdHRlcm4gKGZvciBqdXN0IHRoZSAi
cnVuIiBwYXJ0IGZvciBub3cpLgo+Pgo+PiBGdXJ0aGVyIGNwdWlkLm8gZGlkIG5vdCBoYXZlIGFu
eSBkZXBlbmRlbmNpZXMgYWRkZWQgZm9yIGl0Lgo+Pgo+PiBGaW5hbGx5LCB3aGlsZSBhdCBpdCwg
YWRkIGEgInJ1biIgdGFyZ2V0IHRvIHRoZSBjcHUtcG9saWN5IHRlc3QgaGFybmVzcy4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEFja2Vk
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLgoK
Pj4gLS0tCj4+IFRCRDogU29tZXRoaW5nIHNpbWlsYXIgd291bGQgYmUgbmljZSBmb3IgYnVpbGRp
bmcgYm90aCB0b29scy90ZXN0cy8qLwo+PiAgICAgIGFuZCB0b29scy9mdXp6LyovLCBidXQgSSdt
IHVuY2VydGFpbiB3aGV0aGVyIHJlc3BlY3RpdmUgdG9wIGxldmVsCj4+ICAgICAgdGFyZ2V0cyBi
dWlsZC10ZXN0cy0lIGFuZCBidWlsZC1mdXp6LSUgd291bGQgYmUgd2VsY29tZS4KPiAKPiBGdXp6
IHRhcmdldHMgYXJlIG11Y2ggbW9yZSBjb21wbGljYXRlZCB0byBzZXQgdXAgYW5kIHJ1biBjb3Jy
ZWN0bHkuwqAgSSdkCj4gc2tpcCB0aGVtIGZvciBub3cuCgpXZWxsLCBidWlsZGluZyBzaG91bGRu
J3QgYmUgdGhhdCBkaWZmaWN1bHQgLSBvbmUgb25seSBuZWVkcyB0byBzZXQgdGhlCmNvbXBpbGVy
IGV0YyBjb3JyZWN0bHkgaWlyYy4gUnVubmluZyBpcyBsZXNzIHN0cmFpZ2h0Zm9yd2FyZCwgd2hp
Y2ggaXMKd2h5IEkndmUgbWVudGlvbmVkIG9ubHkgdGhlIGJ1aWxkIHBhcnQuCgpJbmRlcGVuZGVu
dCBvZiB0aGUgZnV6emVyIGFzcGVjdCwgd2hhdCBhYm91dCBhIHNwZWNpYWwgdG9wIGxldmVsIGJ1
aWxkCnRhcmdldCBmb3IgdGhlIHRlc3QgaGFybmVzc2VzIChhbG9uZ3NpZGUgdGhlIHJ1biBvbmUg
aW50cm9kdWNlZCBoZXJlKT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
