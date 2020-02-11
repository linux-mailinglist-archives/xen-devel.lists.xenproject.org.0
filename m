Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E828D158CB8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 11:33:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Snl-0004kF-Tl; Tue, 11 Feb 2020 10:29:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNmK=37=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j1Snj-0004jl-St
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 10:29:55 +0000
X-Inumbo-ID: 71ab28be-4cb9-11ea-852a-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71ab28be-4cb9-11ea-852a-bc764e2007e4;
 Tue, 11 Feb 2020 10:29:55 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g3so10517977wrs.12
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2020 02:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Tqu8uBBwJ7gkwImgXshGcu7qmmrd0Lm/9vd4J49YLos=;
 b=nPad41t3gJBOTRqL9kDT4zXT3Brj7zK04qA8SSyvDD5Q0s9DCN6BqSKHYnEX4mI0H6
 QuEkDjJIAjJJq0KeCJk8n4rslOTgmzgAfGOKU8eAlQ1LjDrVP/XJ9lnS/MT1oufcip7g
 AbIPWOnv7WY8zmsgCKTVQ8UL23QKDTyZwN2Moi16+5lnnSsgElcLLI0V2eUdSYBF7yvT
 xbdAHvRLaoCO1xLCQTscyKrrK59QLSRCf6jH1Hm4iFWMmJtZxxYBlye0diJuD9h+NMK7
 Mgllb0bTMkbCR4DiBEdu1Qvz3TWqrOTTsZ7B0cA5orjzyiDq0UMyhe8nk34RnEj2R6fE
 TNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Tqu8uBBwJ7gkwImgXshGcu7qmmrd0Lm/9vd4J49YLos=;
 b=EByRXOXDS54VozXAQChbAOrgc2TSIdoYspDe8aHAKFvJDRtveDnTsrbPKX2aqj2DjO
 6IQTacMwWK0ROoCU58y+S7tOIwpw1icWeqTLlVn9mKMDsShXtJGEYMie3uZ9pZh5gLx9
 9tO3tqbm6R+s/3EtCtY7iCnzj9On25TQChxi2YWMBzitDi1lILzZ8COAGE4SZyEWD27A
 gHctdy32jc0uNetnoGu3ScXQlEs58/bqaw026yP4Brl9ipYMe+eDeQg3N9/knyeqsF9d
 7mPL5V8Q83zpsiByREkBU0EVlOKTKt4vrpXvfuMVlmUqTEZLgfqvtvOoN574rNtfbp8i
 aU8A==
X-Gm-Message-State: APjAAAVfIf1tp43rBxQlt9WAB9s/lF47v4SBXuxkF/OlcLYl8SVZ2e8b
 pF1EvBvdXf10uBa2LKtSqon9dNmLCq2aOyHDwvc=
X-Google-Smtp-Source: APXvYqx/I0K/4GSjRLsoHvF7BYAjBT0BBJussgn+5ZR6PeVCYBlFewVcqPN4ZKCyiFqc5bxF0C5d+EpLFX+BZPIL0VY=
X-Received: by 2002:a05:6000:1201:: with SMTP id
 e1mr8008417wrx.386.1581416994206; 
 Tue, 11 Feb 2020 02:29:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581362050.git.tamas.lengyel@intel.com>
 <cf992d6e4dd09acc48afb42d43be4a900baee189.1581362050.git.tamas.lengyel@intel.com>
 <f620590a-147b-eeb8-707c-72cac10753bd@suse.com>
In-Reply-To: <f620590a-147b-eeb8-707c-72cac10753bd@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 11 Feb 2020 03:29:17 -0700
Message-ID: <CABfawhn6Z3BO6JTEDzcR9TUYaOLQHv1KLOHv1LHXy-5Bw5QSog@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v8 1/5] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMjoxNyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTAuMDIuMjAyMCAyMDoyMSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gVGhlIG93bmVyIGRvbWFpbiBvZiBzaGFyZWQgcGFnZXMgaXMgZG9tX2NvdywgdXNl
IHRoYXQgZm9yIGdldF9wYWdlCj4gPiBvdGhlcndpc2UgdGhlIGZ1bmN0aW9uIGZhaWxzIHRvIHJl
dHVybiB0aGUgY29ycmVjdCBwYWdlIHVuZGVyIHNvbWUKPiA+IHNpdHVhdGlvbnMuIFRoZSBjaGVj
ayBpZiBkb21fY293IHNob3VsZCBiZSB1c2VkIHdhcyBvbmx5IHBlcmZvcm1lZCBpbgo+ID4gYSBz
dWJzZXQgb2YgdXNlLWNhc2VzLiBGaXhpbmcgdGhlIGVycm9yIGFuZCBzaW1wbGlmeWluZyB0aGUg
ZXhpc3RpbmcgY2hlY2sKPiA+IHNpbmNlIHdlIGNhbid0IGhhdmUgYW55IHNoYXJlZCBlbnRyaWVz
IHdpdGggZG9tX2NvdyBiZWluZyBOVUxMLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+Cj4KPiBJIGZpbmQgaXQgcXVpdGUgZGlz
YXBwb2ludGluZyB0aGF0IHRoZSBibGFuayBsaW5lcyByZXF1ZXN0ZWQgdG8gYmUKPiBhZGRlZCAu
Li4KPgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vcDJtLmMKPiA+IEBAIC01NzQsMTEgKzU3NCwxMiBAQCBzdHJ1Y3QgcGFnZV9pbmZvICpw
Mm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCj4gPiAgICAgICAgICAgICAgICAgIGlmICggZmRvbSA9PSBO
VUxMICkKPiA+ICAgICAgICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOwo+ID4gICAgICAgICAg
ICAgIH0KPiA+IC0gICAgICAgICAgICBlbHNlIGlmICggIWdldF9wYWdlKHBhZ2UsIHAybS0+ZG9t
YWluKSAmJgo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAvKiBQYWdlIGNvdWxkIGJlIHNoYXJl
ZCAqLwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAoIWRvbV9jb3cgfHwgIXAybV9pc19zaGFy
ZWQoKnQpIHx8Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAhZ2V0X3BhZ2UocGFnZSwgZG9t
X2NvdykpICkKPiA+IC0gICAgICAgICAgICAgICAgcGFnZSA9IE5VTEw7Cj4gPiArICAgICAgICAg
ICAgZWxzZQo+ID4gKyAgICAgICAgICAgIHsKPiA+ICsgICAgICAgICAgICAgICAgc3RydWN0IGRv
bWFpbiAqZCA9ICFwMm1faXNfc2hhcmVkKCp0KSA/IHAybS0+ZG9tYWluIDogZG9tX2NvdzsKPiA+
ICsgICAgICAgICAgICAgICAgaWYgKCAhZ2V0X3BhZ2UocGFnZSwgZCkgKQo+Cj4gLi4gYWJvdmUg
aGVyZSBhbmQgLi4uCj4KPiA+IEBAIC01OTQsOCArNTk1LDkgQEAgc3RydWN0IHBhZ2VfaW5mbyAq
cDJtX2dldF9wYWdlX2Zyb21fZ2ZuKAo+ID4gICAgICBtZm4gPSBnZXRfZ2ZuX3R5cGVfYWNjZXNz
KHAybSwgZ2ZuX3goZ2ZuKSwgdCwgYSwgcSwgTlVMTCk7Cj4gPiAgICAgIGlmICggcDJtX2lzX3Jh
bSgqdCkgJiYgbWZuX3ZhbGlkKG1mbikgKQo+ID4gICAgICB7Cj4gPiArICAgICAgICBzdHJ1Y3Qg
ZG9tYWluICpkID0gIXAybV9pc19zaGFyZWQoKnQpID8gcDJtLT5kb21haW4gOiBkb21fY293Owo+
ID4gICAgICAgICAgcGFnZSA9IG1mbl90b19wYWdlKG1mbik7Cj4KPiAuLi4gYWJvdmUgaGVyZSBz
dGlsbCBoYXZlbid0IGFwcGVhcmVkLiBObyBtYXR0ZXIgdGhhdCBpdCdzIGVhc3kgdG8KPiBkbyBz
byB3aGlsZSBjb21taXR0aW5nLCB3aGVuIHlvdSBzZW5kIGEgbmV3IHZlcnNpb24geW91IHNob3Vs
ZAo+IHJlYWxseSBhZGRyZXNzIHN1Y2ggcmVtYXJrcyB5b3Vyc2VsZiwgSSB0aGluay4KCk5vdGVk
LiBJIGhhdmVuJ3QgYWRkcmVzc2VkIGl0IHNpbmNlIGl0IGFwcGVhcmVkIHRvIG1lIHRoYXQgdGhp
cyBwYXRjaApoYXMgYmVlbiByZWFkeSB0byBnbyBpbiBmb3IgbGlrZSAzIHJldmlzaW9ucyBhbHJl
YWR5IGFzLWlzIGdpdmVuIHRoZQpibGFuay1saW5lcyB3ZXJlIG5vbi1ibG9ja2Vycy4gQnkgdGhl
IHRpbWUgSSBnZXQgYXJvdW5kIHJvbGxpbmcgYSBuZXcKb25lIEkgc2ltcGx5IGZvcmdldCBudWlz
YW5jZSBzdHlsZSBpc3N1ZXMgbGlrZSB0aGlzLiBJIGtub3cgd2UgaGF2ZQpiZWVuIGhhdmluZyB0
aGUgZGlzY3Vzc2lvbiBhYm91dCBoYXZpbmcgYXV0b21hdGVkIHN0eWxlLWNoZWNrcyBhbmQKc3R5
bGUtZm9ybWF0dGluZyBhZGRlZCB0byBYZW4sIHRoaXMganVzdCBmdXJ0aGVyIGhpZ2hsaWdodHMg
dG8gbWUgdGhlCm5lZWQgZm9yIGl0IGFzIHdlIGFyZSB3YXN0aW5nIHRpbWUgYW5kIGVuZXJneSBv
biBzdHVmZiBsaWtlIHRoaXMgZm9yCm5vIHJlYWwgcmVhc29uLgoKVGFtYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
