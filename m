Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF010C6A1
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:27:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaGyX-0007r8-IW; Thu, 28 Nov 2019 10:24:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaGyW-0007qx-9b
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:24:40 +0000
X-Inumbo-ID: 439bc7a6-11c9-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 439bc7a6-11c9-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 10:24:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 57407ACA0;
 Thu, 28 Nov 2019 10:24:30 +0000 (UTC)
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <bba7474f-a9f7-0486-627d-16841436714a@suse.com>
 <8406B39C-7C6B-47CE-865D-76E591AEBB1E@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7254dcea-9e81-78f2-9e4a-ac042547f874@suse.com>
Date: Thu, 28 Nov 2019 11:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <8406B39C-7C6B-47CE-865D-76E591AEBB1E@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: StefanoStabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMTkgMTE6MTcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gCj4+IE9uIE5vdiAyOCwg
MjAxOSwgYXQgOTo1NSBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToK
Pj4+Pj4gSGFzIGFueW9uZSBhY3R1YWxseSB0cmllZCBidWlsZGluZyBhIGxpdmVwYXRjaCB3aXRo
IHRoaXMgY2hhbmdlIGluIHBsYWNlPwo+Pj4+IEFjdHVhbGx5IC0gd2hhdCBpcyB5b3VyIGNvbmNl
cm4gaGVyZT8gVGhlIGV4YWN0IHNwZWxsaW5nIG9mIHN5bWJvbHMKPj4+PiBuYW1lcyBzaG91bGQg
YmUgb2Ygbm8gaW50ZXJlc3QgdG8gdGhlIHRvb2wuIEFmdGVyIGFsbCB0aGUgY29tcGlsZXIgaXMK
Pj4+PiBmcmVlIHRvIGludmVudCBhbGwgc29ydHMgb2YgbmFtZXMgZm9yIGl0cyBsb2NhbCBzeW1i
b2xzLCBpbmNsdWRpbmcKPj4+PiB0aGUgb25lcyB3ZSB3b3VsZCBwcm9kdWNlIHdpdGggdGhpcyBj
aGFuZ2UgaW4gcGxhY2UuIEFsbCB0aGUgdG9vbAo+Pj4+IGNhcmVzIGFib3V0IGlzIHRoYXQgdGhl
IG5hbWVzIGJlIHVuYW1iaWd1b3VzLiBIZW5jZSBhbnkgKHRoZW9yZXRpY2FsKQo+Pj4+IHJlZ3Jl
c3Npb24gaGVyZSB3b3VsZCBiZSBhIGJ1ZyBpbiB0aGUgdG9vbHMsIHdoaWNoIGltbyBpcyBubyBy
ZWFzb24KPj4+PiB0byBkZWxheSB0aGlzIGNoYW5nZSBhbnkgZnVydGhlci4gKEdyYW50ZWQgSSBz
aG91bGQgaGF2ZSBnb3QgdG8gaXQKPj4+PiBlYXJsaWVyLCBidXQgaXQgaGFkIGJlZW4gY29udGlu
dWluZyB0byBnZXQgZGVmZXJyZWQuKQo+Pj4KPj4+IFRoaXMgbWlnaHQgYWxsIGJlIHRydWUgKHRo
ZW9yZXRpY2FsbHkpLgo+Pj4KPj4+IFRoZSBsaXZlcGF0Y2ggYnVpbGQgdG9vbHMgYXJlIGZyYWdp
bGUgYW5kIHZlcnkgc2Vuc2l0aXZlIHRvIGhvdyB0aGUKPj4+IG9iamVjdCBmaWxlcyBhcmUgbGFp
ZCBvdXQuICBUaGVyZSBpcyBhIHZlcnkgcmVhbCByaXNrIHRoYXQgdGhpcyBjaGFuZ2UKPj4+IGFj
Y2lkZW50YWxseSBicmVha3MgbGl2ZXBhdGNoaW5nIHRvdGFsbHksIGV2ZW4gb24gR0NDIGJ1aWxk
cy4KPj4+Cj4+PiBXZXJlIHRoaXMgdG8gaGFwcGVuLCBpdCB3b3VsZCBiZSB5ZXQgYW5vdGhlciA0
LjEzIHJlZ3Jlc3Npb24uCj4+Cj4+IEl0J3MgcGVyaGFwcyBhIG1hdHRlciBvZiBwZXJjZXB0aW9u
LCBidXQgSSdkIHN0aWxsIGNhbGwgdGhpcyBhCj4+IGxpdmUgcGF0Y2hpbmcgdG9vbHMgYnVnIHRo
ZW4sIG5vdCBhIDQuMTMgcmVncmVzc2lvbi4KPiAKPiBBZnRlciB0aGUgZGlzY3Vzc2lvbiB5ZXN0
ZXJkYXksIEkgd2FzIHRoaW5raW5nIGEgYml0IG1vcmUgYWJvdXQgdGhpcywgYW5kIEnigJltIG5v
dCBoYXBweSB3aXRoIHRoZSBwcmluY2lwbGUgQW5keSBzZWVtcyB0byBiZSBvcGVyYXRpbmcgb24s
IHRoYXQgaXTigJlzIHJlYXNvbmFibGUgdG8gY29tcGxldGVseSBibG9jayBhIGJ1Zy1maXhpbmcg
cGF0Y2ggdG8gWGVuLCBmb3JjaW5nIGEgd29yay1hcm91bmQgdG8gYmUgdXNlZCBpbiBhIHJlbGVh
c2UsIGJlY2F1c2UgaXQgaGFzIHVua25vd24gZWZmZWN0cyBvbiBsaXZlcGF0Y2hpbmcuCj4gCj4g
Q29uc2lkZXIgdGhlIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIFhlbiBhbmQgTGludXgsIGZvciBleGFt
cGxlLiAgU3VwcG9zZSB0aGF0IGEgcGF0Y2ggd2VyZSBwb3N0ZWQgdG8gTGludXggdG8gZml4IGFu
IGlzc3VlLCBhbmQgSnVlcmdlbiByZXNwb25kZWQgYnkgc2F5aW5nIHRoYXQgaGUgd2FzbuKAmXQg
aGFwcHkgd2l0aCBpdCBiZWNhdXNlIGl0ICBtaWdodCBwb3NzaWJseSBicmVhayB0aGluZ3MgcnVu
bmluZyB1bmRlciBYZW4uICBCdXQgaGUgZGlkbuKAmXQgYWN0dWFsbHkgdGVzdCBpdCBoaW1zZWxm
LCBub3IgcHJvcG9zZSBzb21lIGFsdGVybmF0ZSB3YXkgb2YgZml4aW5nIHRoZSBvcmlnaW5hbCBw
cm9ibGVtOyByYXRoZXIsIGhlIGV4cGVjdGVkIHRoZSBvcmlnaW5hbCBwYXRjaCBzdWJtaXR0ZXIs
IHdobyBkb2VzbuKAmXQgdXNlIFhlbiwgdG8gc2V0IHVwIGEgWGVuIHN5c3RlbSBhbmQgdGVzdCBp
dCB0aGVtc2VsdmVzIGJlZm9yZSBhY2NlcHRpbmcgaXQuCj4gCj4gRG8geW91IHRoaW5rIGFueW9u
ZSBpbiB0aGUga2VybmVsIGNvbW11bml0eSB3b3VsZCBzdGFuZCBmb3IgdGhhdD8gIE9mIGNvdXJz
ZSBub3QuICBOYXR1cmFsbHkgdGhlIHBhdGNoIHdvdWxkIGJlICpwYXVzZWQqIHdoaWxlICpwZW9w
bGUgaW4gdGhlIFhlbiBjb21tdW5pdHkqIHRlc3RlZCBhbmQgb3IgcHJvcG9zZWQgYWx0ZXJuYXRl
IHNvbHV0aW9uczsgYnV0IGlmIHRoZXJlIHdhcyBhIGRlbGF5LCBldmVudHVhbGx5IGl0IHdvdWxk
IGJlIGNoZWNrZWQgaW4uCj4gCj4gSSB0aGluayB0aGUgc2FtZSBwcmluY2lwbGUgc2hvdWxkIGFw
cGx5IGhlcmUuICBJZiBwZW9wbGUgdXNpbmcgdGhlIGxpdmVwYXRjaCBjb2RlIGFyZSBhZnJhaWQg
dGhhdCBKYW7igJlzIHBhdGNoICptYXkqIGFmZmVjdCBsaXZlcGF0Y2hpbmcgb24gZ2NjLCB0aGVu
IHRoZXkgc2hvdWxkIGJlIGdpdmVuIHRpbWUgdG8gcmV2aWV3LCB0ZXN0LCBhbmQvb3IgcHJvcG9z
ZSBhbHRlcm5hdGUgc29sdXRpb25zLiAgQnV0IGl0IHNob3VsZCBiZSB0aGUgcmVzcG9uc2liaWxp
dHkgb2YgcGVvcGxlIHdvcmtpbmcgb24gdGhhdCBjb2RlLCBub3QgdGhlIHJlc3BvbnNpYmlsaXR5
IG9mIGRldmVsb3BlcnMgd2hvIGRvbuKAmXQgdXNlIHRoYXQgY29kZS4KPiAKPj4gICBJZiB0aGV5
J3JlIHNvCj4+IGV4dHJlbWVseSBmcmFnaWxlLCB0aGVuIEkgdGhpbmsgdGhpcyBuZWVkcyB1cmdl
bnRseSB0YWtpbmcgY2FyZSBvZgo+PiBieSB0aGVpciBtYWludGFpbmVycy4gQXMgbWVudGlvbmVk
IGJlZm9yZSAtIGhvdyBleGFjdGx5IHN0YXRpYwo+PiBzeW1ib2xzIGdldCByZXByZXNlbnRlZCBp
cyB1cCB0byB0aGUgY29tcGlsZXIsIGkuZS4gbWF5IGNoYW5nZSBhdAo+PiBhbnkgdGltZS4gQXMg
YSByZXN1bHQsIGFueSBjaGFuZ2Ugd2hhdHNvZXZlciB3b3VsZCBuZWVkIHN1Y2gKPj4gcmVncmVz
c2lvbiB0ZXN0aW5nLCBubyBtYXR0ZXIgdGhhdCBJIGFncmVlIHRoYXQgYSBsYXJnZXIgc2NvcGUK
Pj4gY2hhbmdlIGxpa2UgdGhpcyBvbmUgaGFzIHNsaWdodGx5IGhpZ2hlciBwb3RlbnRpYWwgb2Yg
dHJpZ2dlcmluZwo+PiBzb21lIGlzc3VlLgo+IAo+IFRoaXMgaXMgYW5vdGhlciBhcmd1bWVudCBJ
IHdvdWxkIGFncmVlIHdpdGguCj4gCj4gR2l2ZW4gdGhlIGNsb3NlbmVzcyB0byB0aGUgcmVsZWFz
ZSwgSeKAmWQgZmF2b3IgY2hlY2tpbmcgaW4gdGhlIHBhdGNoIHRvZGF5IG9yIHRvbW9ycm93LCBy
ZWdhcmRsZXNzIG9mIHRlc3Rpbmcgc3RhdHVzLCBzbyB0aGF0IGl0IGNhbiBnZXQgbW9yZSB0ZXN0
aW5nIGluIG91ciBhdXRvbWF0ZWQgc3lzdGVtczsgaXQgY2FuIGFsd2F5cyBiZSByZXZlcnRlZCBp
ZiBpdCBpcyBzaG93biB0byBicmVhayBsaXZlcGF0Y2hpbmcgb24gZ2NjLgoKSW4gdGhhdCBjYXNl
OiBwbGVhc2UgcmF0aGVyIHRvZGF5IHRoYW4gdG9tb3Jyb3cuIFRoZSBlYXJsaWVyIHRoZQpiZXR0
ZXIuCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
