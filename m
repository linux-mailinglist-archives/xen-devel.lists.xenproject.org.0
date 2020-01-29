Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC3C14CB37
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 14:11:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwn6c-0005hL-Sf; Wed, 29 Jan 2020 13:10:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwn6b-0005Uz-0q
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 13:10:05 +0000
X-Inumbo-ID: a946b066-4298-11ea-88b8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a946b066-4298-11ea-88b8-12813bfff9fa;
 Wed, 29 Jan 2020 13:10:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0130CB22B;
 Wed, 29 Jan 2020 13:10:01 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <fcf622c778b440f4ef2a0cbe707e018216a3aaab.1580148227.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a74262f0-0417-7a74-de07-b1c36a7d76ab@suse.com>
Date: Wed, 29 Jan 2020 14:09:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <fcf622c778b440f4ef2a0cbe707e018216a3aaab.1580148227.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 7/9] xen/mem_access: Use
 __get_gfn_type_access in set_mem_access
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFVzZSBfX2dldF9n
Zm5fdHlwZV9hY2Nlc3MgaW5zdGVhZCBvZiBwMm0tPmdldF9lbnRyeSB0byB0cmlnZ2VyIHBhZ2Ut
Zm9ya2luZwo+IHdoZW4gdGhlIG1lbV9hY2Nlc3MgcGVybWlzc2lvbiBpcyBiZWluZyBzZXQgb24g
YSBwYWdlIHRoYXQgaGFzIG5vdCB5ZXQgYmVlbgo+IGNvcGllZCBvdmVyIGZyb20gdGhlIHBhcmVu
dC4KCllvdSB0YWxraW5nIG9mIHBhZ2UtZm9ya2luZyBoZXJlLCBkb24ndCB5b3UgbWVhbiAuLi4K
Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9tZW1fYWNjZXNzLmMKPiBAQCAtMzAzLDExICszMDMsMTAgQEAgc3RhdGljIGludCBzZXRf
bWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAo+ICAg
ICAgQVNTRVJUKCFhcDJtKTsKPiAgI2VuZGlmCj4gICAgICB7Cj4gLSAgICAgICAgbWZuX3QgbWZu
Owo+ICAgICAgICAgIHAybV9hY2Nlc3NfdCBfYTsKPiAgICAgICAgICBwMm1fdHlwZV90IHQ7Cj4g
LQo+IC0gICAgICAgIG1mbiA9IHAybS0+Z2V0X2VudHJ5KHAybSwgZ2ZuLCAmdCwgJl9hLCAwLCBO
VUxMLCBOVUxMKTsKPiArICAgICAgICBtZm5fdCBtZm4gPSBfX2dldF9nZm5fdHlwZV9hY2Nlc3Mo
cDJtLCBnZm5feChnZm4pLCAmdCwgJl9hLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBQMk1fQUxMT0MsIE5VTEwsIGZhbHNlKTsKCi4uLiBQMk1fVU5TSEFSRSBo
ZXJlPwoKQWxzbyBzaG91bGRuJ3QgeW91IGhhdmUgQ2MtZWQgUGV0cmUgYW5kIEFsZXhhbmRydSBv
biB0aGlzIHBhdGNoCihmb3IgdGhlaXIgUjogZW50cmllcykgYW5kIGF0IGxlYXN0IEdlb3JnZSAo
cGVyaGFwcyBhbHNvIEFuZHJldwphbmQgbWUpIHRvIGdldCBhbiBhY2ssIHNlZWluZyB0aGF0IHlv
dSdyZSB0aGUgb25seSBtYWludGFpbmVyCm9mIHRoZSBmaWxlPwoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
