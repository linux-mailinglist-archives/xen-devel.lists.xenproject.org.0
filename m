Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E5415BC7B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:15:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BTh-0007YH-KW; Thu, 13 Feb 2020 10:12:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2BTg-0007YC-85
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:12:12 +0000
X-Inumbo-ID: 4c929db4-4e49-11ea-b874-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c929db4-4e49-11ea-b874-12813bfff9fa;
 Thu, 13 Feb 2020 10:12:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B046BAC15;
 Thu, 13 Feb 2020 10:12:10 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <20200212164949.56434-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9fc88888-a670-a68e-f1b6-c0d258ab7b6e@suse.com>
Date: Thu, 13 Feb 2020 11:12:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212164949.56434-4-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] x86: add accessors for scratch cpu mask
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDIuMjAyMCAxNzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEBAIC0yMjMsNyAr
MjIzLDEwIEBAIHN0YXRpYyB2b2lkIF9jbGVhcl9pcnFfdmVjdG9yKHN0cnVjdCBpcnFfZGVzYyAq
ZGVzYykKPiAgICAgIHRyYWNlX2lycV9tYXNrKFRSQ19IV19JUlFfQ0xFQVJfVkVDVE9SLCBpcnEs
IHZlY3RvciwgdG1wX21hc2spOwo+ICAKPiAgICAgIGlmICggbGlrZWx5KCFkZXNjLT5hcmNoLm1v
dmVfaW5fcHJvZ3Jlc3MpICkKPiArICAgIHsKPiArICAgICAgICBwdXRfc2NyYXRjaF9jcHVtYXNr
KCk7Cj4gICAgICAgICAgcmV0dXJuOwo+ICsgICAgfQoKSSdtIG5vdCBvdmVybHkgaGFwcHkgdG8g
c2VlIGEgbmVlZCBpbnRyb2R1Y2VkIHRvIGRvIGNsZWFudXAgbGlrZQp0aGlzIG9uZSwgYnV0IGF0
IGxlYXN0IG1pc3NpbmcgYSBwYXRoIGlzIGEgZGVidWctYnVpbGQgcHJvYmxlbQpvbmx5LgoKPiAt
LS0gYS94ZW4vYXJjaC94ODYvc21wYm9vdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3Qu
Ywo+IEBAIC01Nyw2ICs1NywzMCBAQCBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShjcHVtYXNr
X3Zhcl90LCBjcHVfY29yZV9tYXNrKTsKPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoY3B1
bWFza192YXJfdCwgc2NyYXRjaF9jcHVtYXNrKTsKPiAgc3RhdGljIGNwdW1hc2tfdCBzY3JhdGNo
X2NwdTBtYXNrOwo+ICAKPiArI2lmbmRlZiBOREVCVUcKPiArY3B1bWFza190ICpzY3JhdGNoX2Nw
dW1hc2soY29uc3QgY2hhciAqZm4pCgpQbGVhc2UgZG9uJ3QgcGFzcyBhbiBhcmd1bWVudCB0aGF0
IHlvdSBjYW4gZGVkdWNlLCBhbmQgdGhlbgpwcm92aWRlIGV2ZW4gbW9yZSBtZWFuaW5nZnVsIGRh
dGE6Cgo+ICt7Cj4gKyAgICBzdGF0aWMgREVGSU5FX1BFUl9DUFUoY29uc3QgY2hhciAqLCBzY3Jh
dGNoX2NwdW1hc2tfdXNlKTsKPiArCj4gKyAgICAvKgo+ICsgICAgICogU2NyYXRjaCBjcHVtYXNr
IGNhbm5vdCBiZSB1c2VkIGluIElSUSBjb250ZXh0LCBvciBlbHNlIHdlIHdvdWxkIGhhdmUgdG8K
PiArICAgICAqIG1ha2Ugc3VyZSBhbGwgdXNlcnMgaGF2ZSBpbnRlcnJ1cHRzIGRpc2FibGVkIHdo
aWxlIHVzaW5nIHRoZSBzY3JhdGNoCj4gKyAgICAgKiBtYXNrLgo+ICsgICAgICovCj4gKyAgICBC
VUdfT04oaW5faXJxKCkpOwo+ICsKPiArICAgIGlmICggZm4gJiYgdW5saWtlbHkodGhpc19jcHUo
c2NyYXRjaF9jcHVtYXNrX3VzZSkpICkKPiArICAgIHsKPiArICAgICAgICBwcmludGsoIiVzOiBz
Y3JhdGNoIENQVSBtYXNrIGFscmVhZHkgaW4gdXNlIGJ5ICVzXG4iLAo+ICsgICAgICAgICAgICAg
IGZuLCB0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2tfdXNlKSk7CgpVc2UgX19idWlsdGluX3JldHVy
bl9hZGRyZXNzKDApIGhlcmUsIHdoaWNoIHdpbGwgYWxsb3cKaWRlbnRpZnlpbmcgd2hpY2ggb2Yg
cGVyaGFwcyBtdWx0aXBsZSB1c2VzIGluIGEgZnVuY3Rpb24gaXMKdGhlIG9mZmVuZGluZyBvbmUu
CgpBbHNvLCB3aHkgaW4gc21wYm9vdC5jIGluc3RlYWQgb2YgaW4gc21wLmM/IFRoaXMgaXNuJ3Qg
YQpib290IG9yIENQVS1ob3Qtb25saW5lIHJlbGF0ZWQgZnVuY3Rpb24gYWZhaWN0LgoKRmluYWxs
eSwgaXQgd291bGQgc2VlbSBuaWNlIGlmIG11bHRpcGxlIHVzZXMgYnkgdGhlIHNhbWUgY2FsbGVy
CmNvdWxkIGJlIHBlcm1pdHRlZDoKCiAgICBmb3IgKCAuLi4gKQogICAgewogICAgICAgIGlmICgg
Li4uICkKICAgICAgICB7CiAgICAgICAgICAgIG1hc2sgPSBnZXRfc2NyYXRjaF9jcHVtYXNrKCk7
CiAgICAgICAgICAgIC4uLgogICAgICAgIH0KICAgICAgICBlbHNlCiAgICAgICAgewogICAgICAg
ICAgICAvKiBubyB1c2Ugb2YgZ2V0X3NjcmF0Y2hfY3B1bWFzaygpICovCiAgICAgICAgICAgIC4u
LgogICAgICAgIH0KICAgIH0KCiAgICBwdXRfc2NyYXRjaF9jcHVtYXNrKCk7CgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
