Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0901001CF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 10:54:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWdgK-0004il-Qr; Mon, 18 Nov 2019 09:50:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWdgJ-0004ig-1Y
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 09:50:51 +0000
X-Inumbo-ID: e6962412-09e8-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6962412-09e8-11ea-b678-bc764e2007e4;
 Mon, 18 Nov 2019 09:50:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D32FAB14E;
 Mon, 18 Nov 2019 09:50:48 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <177843fa29560291b8af90db5daffe4852ea96b7.1570034362.git.hongyax@amazon.com>
 <98238224-df4e-5ff0-95d1-1f9f93ca0ab6@suse.com>
 <20191115171627.vqafpuo2ic3ymhvj@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ac32255-5cb8-27ba-f9c5-37a9c27a9054@suse.com>
Date: Mon, 18 Nov 2019 10:50:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191115171627.vqafpuo2ic3ymhvj@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/9] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Hongyan Xia <hongyax@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxODoxNiwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIE5vdiAxNSwgMjAx
OSBhdCAwNDoyMzozMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDIuMTAuMjAx
OSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4+PiBAQCAtNDg0NywyMiArNDg0OCw1MCBAQCBp
bnQgbW1jZmdfaW50ZXJjZXB0X3dyaXRlKAo+Pj4gIH0KPj4+ICAKPj4+ICB2b2lkICphbGxvY194
ZW5fcGFnZXRhYmxlKHZvaWQpCj4+PiArewo+Pj4gKyAgICBtZm5fdCBtZm47Cj4+PiArCj4+PiAr
ICAgIG1mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7Cj4+PiArICAgIEFTU0VSVCghbWZu
X2VxKG1mbiwgSU5WQUxJRF9NRk4pKTsKPj4+ICsKPj4+ICsgICAgcmV0dXJuIG1hcF94ZW5fcGFn
ZXRhYmxlX25ldyhtZm4pOwo+Pj4gK30KPj4+ICsKPj4+ICt2b2lkIGZyZWVfeGVuX3BhZ2V0YWJs
ZSh2b2lkICp2KQo+Pj4gK3sKPj4+ICsgICAgaWYgKCBzeXN0ZW1fc3RhdGUgIT0gU1lTX1NUQVRF
X2Vhcmx5X2Jvb3QgKQo+Pj4gKyAgICAgICAgZnJlZV94ZW5fcGFnZXRhYmxlX25ldyh2aXJ0X3Rv
X21mbih2KSk7Cj4+PiArfQo+Pj4gKwo+Pj4gK21mbl90IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3
KHZvaWQpCj4+PiAgewo+Pj4gICAgICBpZiAoIHN5c3RlbV9zdGF0ZSAhPSBTWVNfU1RBVEVfZWFy
bHlfYm9vdCApCj4+PiAgICAgIHsKPj4+ICAgICAgICAgIHZvaWQgKnB0ciA9IGFsbG9jX3hlbmhl
YXBfcGFnZSgpOwo+Pj4gIAo+Pj4gICAgICAgICAgQlVHX09OKCFoYXJkd2FyZV9kb21haW4gJiYg
IXB0cik7Cj4+PiAtICAgICAgICByZXR1cm4gcHRyOwo+Pj4gKyAgICAgICAgcmV0dXJuIHZpcnRf
dG9fbWZuKHB0cik7Cj4+PiAgICAgIH0KPj4+ICAKPj4+IC0gICAgcmV0dXJuIG1mbl90b192aXJ0
KG1mbl94KGFsbG9jX2Jvb3RfcGFnZXMoMSwgMSkpKTsKPj4+ICsgICAgcmV0dXJuIGFsbG9jX2Jv
b3RfcGFnZXMoMSwgMSk7Cj4+PiAgfQo+Pj4gIAo+Pj4gLXZvaWQgZnJlZV94ZW5fcGFnZXRhYmxl
KHZvaWQgKnYpCj4+PiArdm9pZCAqbWFwX3hlbl9wYWdldGFibGVfbmV3KG1mbl90IG1mbikKPj4K
Pj4gVGhlcmUncyBubyBuZWVkIGZvciB0aGUgbWFwL3VubWFwIGZ1bmN0aW9ucyB0byBoYXZlIGEg
X25ldwo+PiBzdWZmaXgsIGlzIHRoZXJlPwo+Pgo+IAo+IEl0IGlzIG1vcmUgY29uc2lzdGVudC4K
CkJ1dCB3aWxsIHJlcXVpcmUgdG91Y2hpbmcgYWxsIGNhbGxlcnMgYWdhaW4gd2hlbiB0aGUgX25l
dyBzdWZmaXhlcwpnZXQgZHJvcHBlZC4KCj4+PiAgewo+Pj4gLSAgICBpZiAoIHN5c3RlbV9zdGF0
ZSAhPSBTWVNfU1RBVEVfZWFybHlfYm9vdCApCj4+PiAtICAgICAgICBmcmVlX3hlbmhlYXBfcGFn
ZSh2KTsKPj4+ICsgICAgcmV0dXJuIG1mbl90b192aXJ0KG1mbl94KG1mbikpOwo+Pj4gK30KPj4+
ICsKPiBbLi4uXQo+Pgo+Pj4gK3sKPj4+ICsgICAgLyogWFhYIHN0aWxsIHVzaW5nIHhlbmhlYXAg
cGFnZSwgbm8gbmVlZCB0byBkbyBhbnl0aGluZy4gICovCj4+Cj4+IEkgd29uZGVyIGlmIGl0IHdv
dWxkbid0IGJlIGEgZ29vZCBpZGVhIHRvIGF0IGxlYXN0IGhhdmUgc29tZQo+PiBsZWFrIGRldGVj
dGlvbiBoZXJlIHRlbXBvcmFyaWx5LCBzdWNoIHRoYXQgd2UgaGF2ZSBhIGNoYW5jZSBvZgo+PiBu
b3RpY2luZyBwYXRocyBub3QgcHJvcGVybHkgZG9pbmcgdGhlIG5lY2Vzc2FyeSB1bm1hcHBpbmcu
Cj4+Cj4+IFRoZSBhZ2FpbiBhIHF1ZXN0aW9uIGlzIHdoeSB5b3UgaW50cm9kdWNlIHN1Y2ggYSBt
YXAvdW5tYXAgcGFpcgo+PiBpbiB0aGUgZmlyc3QgcGxhY2UuIFRoaXMgaXMgZ29pbmcgdG8gYmUg
YSB0aGluIHdyYXBwZXIgYXJvdW5kCj4+IHssdW59bWFwX2RvbWFpbl9wYWdlKCkgaW4gdGhlIGVu
ZCBhbnl3YXksIGFuZCBoZW5jZSBjYWxsZXJzCj4+IGNvdWxkIGFzIHdlbGwgYmUgc3dpdGNoZWQg
dG8gY2FsbGluZyB0aG9zZSBmdW5jdGlvbiBkaXJlY3RseSwKPj4gYXMgdGhleSdyZSBuby1vcHMg
b24gWGVuIGhlYXAgcGFnZXMuCj4gCj4gCj4gQWxsIHJvYWRzIGxlYWQgdG8gUm9tZSwgYnV0IHNv
bWUgcm9hZHMgYXJlIGVhc2llciB0aGFuIG90aGVycy4gIEhhdmluZyBhCj4gc2V0IG9mIEFQSXMg
dG8gZGVhbCB3aXRoIHBhZ2UgdGFibGVzIG1ha2UgdGhlIGNvZGUgZWFzaWVyIHRvIGZvbGxvdyBJ
TU8uCj4gCj4gQW5kIHdlIGNhbiBwb3RlbnRpYWxseSBkbyBtb3JlIHN0dWZmIGluIHRoaXMgZnVu
Y3Rpb24sIGZvciBleGFtcGxlLCBtYWtlCj4gdGhlIHVubWFwIGZ1bmN0aW9uIHRlc3QgaWYgdGhl
IHBhZ2UgaXMgcmVhbGx5IGEgcGFnZSB0YWJsZSB0byBhdm9pZAo+IG1pc3VzZTsgb3IgbGlrZSB5
b3Ugc2FpZCwgaGF2ZSBzb21lIGxlYWsgZGV0ZWN0aW9uIGNoZWNrIHRoZXJlLgo+IAo+IEFsc28s
IHBsZWFzZSBjb25zaWRlciB0aGVyZSBhcmUgZG96ZW5zIG9mIHBhdGNoZXMgdGhhdCBhcmUgYnVp
bHQgb24gdG9wCj4gb2YgdGhpcyBzZXQgb2YgbmV3IEFQSXMuICBIYXZpbmcgdG8gcmV3cml0ZSB0
aGVtIGp1c3QgZm9yIG1lY2hhbmljYWwKPiBjaGFuZ2VzIGlzIG5vdCBmdW4gZm9yIEhvbmd5YW4u
IEkgd291bGQgc3VnZ2VzdCB3ZSBiZSBtb3JlIHByYWdtYXRpYwo+IGhlcmUuCgpXaGV0aGVyIHRv
IHVzZSBzZXBhcmF0ZSBmdW5jdGlvbnMgZGVwZW5kcyAtIGFzIHlvdSBzYXkgLSBvbiB0aGUKbG9u
Z2VyIHRlcm0gcGxhbnMuIElmIHRoZXJlJ3MgYSBnb29kIHJlYXNvbnMgdG8gaGF2ZSB0aGVzZSBz
ZXBhcmF0ZQooYW5kIHRoYXQgcmVhc29uIGlzIHN0YXRlZCBpbiB0aGUgZGVzY3JpcHRpb24pLCB0
aGVuIHllcywgSSdsbCBiZQpmaW5lIHdpdGggaGF2aW5nIHRoZW0uIEJ1dCBpbnRyb2R1Y2luZyB0
aGVtIGp1c3QgZm9yIHRoZSBzYWtlIG9mCmRvaW5nIHNvIGlzbid0IGFwcHJvcHJpYXRlIGltby4K
CkFzIHRvIGRvemVucyBvZiBwYXRjaGVzIG9uIHRvcCAtIEknbSBzb3JyeSB0byBzYXkgaXQgdGhp
cyBibHVudGx5LApidXQgdGhhdCdzIHRoZSByaXNrIGFueW9uZSB0YWtlcyB3aGVuIGNvbXBpbGlu
ZyBsYXJnZSBzZXJpZXMKd2l0aG91dCBzdWZmaWNpZW50IHVwIGZyb250IGFncmVlbWVudC4gSSd2
ZSB0b28gYmVlbiBzdWZmZXJpbmcgZnJvbQpzdWNoIGEgcGVuYWx0eSBpbiBhIGZldyBjYXNlczsg
dGhhdCdzIHNpbXBseSB0aGUgd2F5IGl0IGlzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
