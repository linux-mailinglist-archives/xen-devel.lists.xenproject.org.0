Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3616474
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 15:20:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNzyX-00049X-BK; Tue, 07 May 2019 13:17:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M5sH=TH=citrix.com=prvs=0233d00f1=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hNzyV-00049N-EH
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 13:17:39 +0000
X-Inumbo-ID: 7bb8b901-70ca-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7bb8b901-70ca-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 13:17:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,441,1549929600"; d="scan'208";a="85212112"
Date: Tue, 7 May 2019 14:17:27 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <20190507131727.GC2798@zion.uk.xensource.com>
References: <20190507083548.27883-1-elnikety@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507083548.27883-1-elnikety@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] libxl: make vkbd tunable for HVM guests
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Amit Shah <aams@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDg6MzU6NDhBTSArMDAwMCwgRXNsYW0gRWxuaWtldHkg
d3JvdGU6Cj4gRWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2JkIGZyb250ZW5kL2Jh
Y2tlbmQgcGFpciAoYy9zIGViYmQyNTYxYjRjKS4KPiBUaGlzIGNvbnN1bWVzIGhvc3QgcmVzb3Vy
Y2VzIHVubmVjZXNzYXJpbHkgZm9yIGd1ZXN0cyB0aGF0IGhhdmUgbm8gdXNlIGZvcgo+IHZrYmQu
IE1ha2UgdGhpcyBiZWhhdmlvdXIgdHVuYWJsZSB0byBhbGxvdyBhbiBhZG1pbmlzdHJhdG9yIHRv
IGNob29zZS4gVGhlCj4gY29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVoYXZpb3VyIC0tIEhW
TSBndWVzdHMgc3RpbGwgZ2V0IHZrZGIgdW5sZXNzCj4gc3BlY2lmaWVkIG90aGVyd2lzZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1hem9uLmNvbT4KCldo
byAvIHdoYXQgaXMgdG8gc2V0IHRoaXMgZmllbGQ/CgpJdCBhcHBlYXJzIHRoaXMgcGF0Y2ggb25s
eSBjb250YWlucyBvbmUgY2hhbmdlIHRvIHhsIHRvIHByaW50IG91dCBpdHMKdmFsdWUuCgo+IC0t
LQo+ICB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgfCA5ICsrKysrKy0tLQo+ICB0b29scy9s
aWJ4bC9saWJ4bF90eXBlcy5pZGwgfCAxICsKPiAgdG9vbHMveGwveGxfc3hwLmMgICAgICAgICAg
IHwgMiArKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgYi90b29scy9s
aWJ4bC9saWJ4bF9jcmVhdGUuYwo+IGluZGV4IDg5ZmU4MGZjOWMuLmIwOTI0NDA1OGYgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiArKysgYi90b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYwo+IEBAIC0zMTAsNiArMzEwLDcgQEAgaW50IGxpYnhsX19kb21haW5fYnVp
bGRfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAqZ2MsCj4gICAgICAgICAgbGlieGxfZGVmYm9v
bF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLnZwdF9hbGlnbiwgICAgICAgICAgdHJ1ZSk7Cj4g
ICAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLmFsdHAybSwg
ICAgICAgICAgICAgZmFsc2UpOwo+ICAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgm
Yl9pbmZvLT51Lmh2bS51c2IsICAgICAgICAgICAgICAgIGZhbHNlKTsKPiArICAgICAgICBsaWJ4
bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+dS5odm0udmtiX2RldmljZSwgICAgICAgICB0
cnVlKTsKPiAgICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+dS5odm0u
eGVuX3BsYXRmb3JtX3BjaSwgICB0cnVlKTsKPiAgCj4gICAgICAgICAgbGlieGxfZGVmYm9vbF9z
ZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLnNwaWNlLmVuYWJsZSwgZmFsc2UpOwo+IEBAIC0xNDE2
LDkgKzE0MTcsMTEgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2xhdW5jaF9kbShsaWJ4bF9fZWdj
ICplZ2MsIGxpYnhsX19tdWx0aWRldiAqbXVsdGlkZXYsCj4gICAgICAgICAgbGlieGxfX2Rldmlj
ZV9jb25zb2xlX2FkZChnYywgZG9taWQsICZjb25zb2xlLCBzdGF0ZSwgJmRldmljZSk7Cj4gICAg
ICAgICAgbGlieGxfX2RldmljZV9jb25zb2xlX2Rpc3Bvc2UoJmNvbnNvbGUpOwo+ICAKPiAtICAg
ICAgICBsaWJ4bF9kZXZpY2VfdmtiX2luaXQoJnZrYik7Cj4gLSAgICAgICAgbGlieGxfX2Rldmlj
ZV9hZGQoZ2MsIGRvbWlkLCAmbGlieGxfX3ZrYl9kZXZ0eXBlLCAmdmtiKTsKPiAtICAgICAgICBs
aWJ4bF9kZXZpY2VfdmtiX2Rpc3Bvc2UoJnZrYik7Cj4gKyAgICAgICAgaWYgKCBsaWJ4bF9kZWZi
b29sX3ZhbChkX2NvbmZpZy0+Yl9pbmZvLnUuaHZtLnZrYl9kZXZpY2UpICkgewoKTm8gc3BhY2Ug
aW5zaWRlIGlmKCkgcGxlYXNlLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
