Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AE43C486
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 08:53:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haabt-0004Ie-5X; Tue, 11 Jun 2019 06:50:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1haabr-0004IZ-QQ
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 06:50:19 +0000
X-Inumbo-ID: 2ca8a74e-8c15-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2ca8a74e-8c15-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 06:50:18 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 00:50:17 -0600
Message-Id: <5CFF4F260200007800236D58@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 00:50:14 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Chao Gao" <chao.gao@intel.com>
References: <1558945891-3015-1-git-send-email-chao.gao@intel.com>
 <1558945891-3015-4-git-send-email-chao.gao@intel.com>
 <5CF6883802000078002352A1@prv1-mh.provo.novell.com>
 <20190610053339.GA10195@gao-cwp>
In-Reply-To: <20190610053339.GA10195@gao-cwp>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v7 03/10] microcode: introduce a global
 cache of ucode patch
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA2LjE5IGF0IDA3OjMzLCA8Y2hhby5nYW9AaW50ZWwuY29tPiB3cm90ZToKPiBP
biBUdWUsIEp1biAwNCwgMjAxOSBhdCAwOTowMzoyMEFNIC0wNjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4gT24gMjcuMDUuMTkgYXQgMTA6MzEsIDxjaGFvLmdhb0BpbnRlbC5jb20+IHdyb3Rl
Ogo+Pj4gK3N0YXRpYyB2b2lkIGZyZWVfcGF0Y2goc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbWlj
cm9jb2RlX3BhdGNoKQo+Pj4gK3sKPj4+ICsgICAgc3RydWN0IG1pY3JvY29kZV9hbWQgKm1jX2Ft
ZCA9IG1pY3JvY29kZV9wYXRjaC0+bWNfYW1kOwo+Pj4gKwo+Pj4gKyAgICB4ZnJlZShtY19hbWQt
PmVxdWl2X2NwdV90YWJsZSk7Cj4+PiArICAgIHhmcmVlKG1jX2FtZC0+bXBiKTsKPj4+ICsgICAg
eGZyZWUobWNfYW1kKTsKPj4+ICsgICAgeGZyZWUobWljcm9jb2RlX3BhdGNoKTsKPj4KPj5JIHRo
aW5rIEkgc2FpZCBzbyBiZWZvcmU6IEZyZWVpbmcgb2YgdGhlIGdlbmVyaWMgd3JhcHBlciBzdHJ1
Y3QKPj53b3VsZCBwcm9iYWJseSBiZXR0ZXIgYmUgcGxhY2VkIGluIGdlbmVyaWMgY29kZS4KPiAK
PiBEbyB5b3UgbWVhbiBzb21ldGhpbmcgYXMgc2hvd24gYmVsb3c6Cj4gCj4gLyogaW4gZ2VuZXJp
YyBjb2RlICovCj4gCj4gc3RydWN0IG1pY3JvY29kZV9wYXRjaCB7Cj4gICAgIHVuaW9uIHsKPiAg
ICAgICAgIHN0cnVjdCBtaWNyb2NvZGVfaW50ZWwgKm1jX2ludGVsOwo+IAlzdHJ1Y3QgbWljcm9j
b2RlX2FtZCAqbWNfYW1kOwo+IAl2b2lkICptYzsKPiAgICAgfTsKPiB9Owo+IAo+IHZvaWQgbWlj
cm9jb2RlX2ZyZWVfcGF0Y2goc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqbWljcm9jb2RlX3BhdGNo
KQo+IHsKPiAgICAgbWljcm9jb2RlX29wcy0+ZnJlZV9wYXRjaChtaWNyb2NvZGVfcGF0Y2gtPm1j
KTsKPiAgICAgeGZyZWUobWljcm9jb2RlX3BhdGNoKTsKPiB9Cj4gCj4gLyogaW4gdmVuZG9yLXNw
ZWNpZmljIChBTUQpIGNvZGUgKi8KPiAKPiBzdGF0aWMgdm9pZCBmcmVlX3BhdGNoKHZvaWQgKm1j
KQo+IHsKPiAgICAgc3RydWN0IG1pY3JvY29kZV9hbWQgKm1jX2FtZCA9IG1jOwo+IAo+ICAgICB4
ZnJlZShtY19hbWQtPmVxdWl2X2NwdV90YWJsZSk7Cj4gICAgIHhmcmVlKG1jX2FtZC0+bXBiKTsK
PiAgICAgeGZyZWUobWNfYW1kKTsKPiB9CgpTb21ldGhpbmcgYWxvbmcgdGhlc2UgbGluZXMsIHll
cy4gV2hldGhlciB5b3UgZG8gYXMgYWJvdmUgb3IKd2hldGhlciBpbnN0ZWFkIHlvdSBjb250aW51
ZSB0byBwYXNzIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKgppcyBzZWNvbmRhcnkgKGFuZCByZWFs
bHkgdXAgdG8geW91KS4gUGVyaGFwcyB0aGUgYWJvdmUgdGhlCihzbGlnaHRseSkgYmV0dGVyLgoK
Pj4+IEBAIC00OTcsNyArNTU4LDIwIEBAIHN0YXRpYyBpbnQgY3B1X3JlcXVlc3RfbWljcm9jb2Rl
KHVuc2lnbmVkIGludCBjcHUsIGNvbnN0IHZvaWQgKmJ1ZiwKPj4+ICAgICAgd2hpbGUgKCAoZXJy
b3IgPSBnZXRfdWNvZGVfZnJvbV9idWZmZXJfYW1kKG1jX2FtZCwgYnVmLCBidWZzaXplLAo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJm9mZnNldCkp
ID09IDAgKQo+Pj4gICAgICB7Cj4+PiAtICAgICAgICBpZiAoIG1pY3JvY29kZV9maXRzKG1jX2Ft
ZCwgY3B1KSApCj4+PiArICAgICAgICBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpuZXdfcGF0Y2gg
PSBhbGxvY19taWNyb2NvZGVfcGF0Y2gobWNfYW1kKTsKPj4+ICsKPj4+ICsgICAgICAgIGlmICgg
SVNfRVJSKG5ld19wYXRjaCkgKQo+Pj4gKyAgICAgICAgewo+Pj4gKyAgICAgICAgICAgIGVycm9y
ID0gUFRSX0VSUihuZXdfcGF0Y2gpOwo+Pj4gKyAgICAgICAgICAgIGJyZWFrOwo+Pj4gKyAgICAg
ICAgfQo+Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCBtYXRjaF9jcHUobmV3X3BhdGNoKSApCj4+PiAr
ICAgICAgICAgICAgbWljcm9jb2RlX3VwZGF0ZV9jYWNoZShuZXdfcGF0Y2gpOwo+Pj4gKyAgICAg
ICAgZWxzZQo+Pj4gKyAgICAgICAgICAgIGZyZWVfcGF0Y2gobmV3X3BhdGNoKTsKPj4KPj5XaHkg
ZG8geW91IHJlLWRvIHdoYXQgbWljcm9jb2RlX3VwZGF0ZV9jYWNoZSgpIGFscmVhZHkgZG9lcz8K
Pj5JdCBjYWxscyAtPm1hdGNoX2NwdSgpIGFuZCAtPmZyZWVfcGF0Y2goKSBhbGwgYnkgaXRzZWxm
LiBJdCBsb29rcyBhcwo+PmlmIGl0IHdvdWxkIG5lZWQgdG8gZ2FpbiBvbmUgbW9yZSAtPmZyZWVf
cGF0Y2goKSBpbnZvY2F0aW9uIHRob3VnaC4KPj4KPiAKPiBXaWxsIHJlbW92ZSBib3RoIGludm9j
YXRpb25zIG9mIG1hdGNoX2NwdSgpLgo+IAo+IFRvIHN1cHBvcnQgdGhlIGNhc2UgKHRoZSBicm9r
ZW4gYmlvcykgeW91IGRlc2NyaWJlZCwgYSBwYXRjaCB3aGljaAo+IG5lZWRzIHRvIGJlIHN0b3Jl
ZCBpc24ndCBuZWNlc3NhcnkgdG8gYmUgbmV3ZXIgdGhhbiB0aGUgbWljcm9jb2RlIGxvYWRlZAo+
IHRvIGN1cnJlbnQgQ1BVLiBBcyBsb25nIGFzIHRoZSBwcm9jZXNzb3IncyBzaWduYXR1cmUgaXMg
Y292ZXJlZCBieSB0aGUKPiBwYXRjaCwgd2Ugd2lsbCBzdG9yZSB0aGUgcGF0Y2ggcmVnYXJkbGVz
cyB0aGUgcmV2aXNpb24gbnVtYmVyLgoKV2VsbCwgaWYgc28sIHRoZW4gZmluZS4gSSBkaWQgZ2V0
IHRoZSBpbXByZXNzaW9uIHRoYXQgc3VjY2Vzc2Z1bCBhcHBsaWNhdGlvbgppcyBhIHJlcXVpcmVk
IHByZS1jb25kaXRpb24gZm9yIHN0b3JpbmcuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
