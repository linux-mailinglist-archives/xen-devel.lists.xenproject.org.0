Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610618505
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 08:01:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOc5Y-0000w1-0s; Thu, 09 May 2019 05:59:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hXi=TJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hOc5W-0000vs-6Y
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 05:59:26 +0000
X-Inumbo-ID: 982ccc40-721f-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 982ccc40-721f-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 05:59:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1ABBABD4;
 Thu,  9 May 2019 05:59:22 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20190506065644.7415-1-jgross@suse.com>
 <20190506065644.7415-3-jgross@suse.com>
 <06d4c89b-202e-bea4-23f9-c41dd8d17d52@citrix.com>
 <33e39539-2087-3bbb-cc46-a8d309c9d8d2@suse.com>
 <54785fa3c24d14de6c00d343046711f25ea28700.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <3276dcdd-c740-05f2-df89-df0c3e3d3432@suse.com>
Date: Thu, 9 May 2019 07:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <54785fa3c24d14de6c00d343046711f25ea28700.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH RFC V2 02/45] xen/sched: use new sched_item
 instead of vcpu in scheduler interfaces
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDUvMjAxOSAwNzo1NiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gVGh1LCAyMDE5
LTA1LTA5IGF0IDA3OjM2ICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwOC8wNS8y
MDE5IDE4OjM1LCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gNS82LzE5IDc6NTYgQU0sIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4KPj4+ICdpdGVtJyByZWFsbHkgc2VlbXMgbGlrZSB0aGUg
d3Jvbmcgd29yZCBoZXJlLiAgVG8gbWUgJ2l0ZW0nIGFsd2F5cwo+Pj4gbWVhbnMKPj4+IG9uZSB0
aGluZzsgd2hlcmVhcyB3aGF0IHlvdSdyZSBwbGFubmluZyBvbiBkb2luZyBpcyBncm91cGluZwo+
Pj4gdG9nZXRoZXIKPj4+IHZjcHVzIHRvIHNjaGVkdWxlIHRvZ2V0aGVyOyB3aGljaCB3b3VsZCBt
ZWFuICJ1bml0IiAoYXMgaW4sIGEKPj4+IG1pbGl0YXJ5Cj4+PiB1bml0KS4KPj4+Cj4+PiBJIHJl
YWxpemUgY2hhbmdpbmcgaXQgaGVyZSBwcm9iYWJseSBtZWFucyBhbHNvIGNoYW5naW5nIGl0IGlu
IHRoZQo+Pj4gbmV4dAo+Pj4gNDMgcGF0Y2hlcyBhcyB3ZWxsLgo+Pgo+PiBPbmx5IGFib3V0IDEw
MDAgbGluZXMgdG8gY2hhbmdlLgo+Pgo+PiBUQkgsIHJlcGxhY2luZyAiaXRlbSIgd2l0aCAidW5p
dCIgaXMgZG9hYmxlIHZpYSBzZWQuIERvaW5nIHRoZSBzYW1lCj4+IHdpdGgKPj4gKGFzIERhcmlv
IHN1Z2dlc3RlZCkgImVudGl0eSIgaXMgbW9yZSBwYWluZnVsLCBhcyBJIHdvdWxkIG5lZWQgdG8K
Pj4gY2hlY2sKPj4gY29kaW5nIHN0eWxlIChsaW5lIGxlbmd0aCwgaW5kZW50YXRpb24pIG1hbnVh
bGx5IGFmdGVyd2FyZHMuIAo+Pgo+IEFoLCByaWdodCwgSSBkaWRuJ3Qgc3BvdCB0aGF0ICdpdGVt
JyBhbmQgJ3VuaXQnIGFyZSB0aGUgc2FtZSBsZW5ndGguCj4gTWFrZXMgc2Vuc2UuCj4gCj4+IFNv
IERhcmlvLAo+PiB3b3VsZCB5b3UgYmUgZmluZSB3aXRoICJ1bml0Ij8gVGhpcyBtaWdodCBzYXZl
IG1lIHNvbWUgaG91cnMgb2Ygd29yay4KPj4KPiBJIGd1ZXNzIEkgYW0sIHllcy4gSSBsaWtlIGl0
IG1vcmUgdGhhbiAnaXRlbScgdG9vIGFuZCwgYXMgbXVjaCBhcyBJCj4gbGlrZSAnZW50aXR5Jywg
SSBhZ3JlZSBpdCdzIG5vdCB3b3J0aCB0aGUgZXh0cmEgZWZmb3J0LgoKVGhhbmtzLiBTbyAidW5p
dCIgaXQgaXMgdGhlbi4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
