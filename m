Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E55C14BE30
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 17:58:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwU9F-0001iq-LS; Tue, 28 Jan 2020 16:55:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4/zE=3R=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwU9E-0001il-3B
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:55:32 +0000
X-Inumbo-ID: fe26c3a0-41ee-11ea-8396-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe26c3a0-41ee-11ea-8396-bc764e2007e4;
 Tue, 28 Jan 2020 16:55:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z7so16828229wrl.13
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2020 08:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YeCgwmkCYfPYhU/h0QLtOewLk+EtQAkI6eXg9aDXtxw=;
 b=EZznKij9YcdEPs2aqS1w7w57WawlSFb/u6252C2N6xx6ecpy+nAurh5ODWnV/289fR
 3+p9556m+xhSJDP24u32k6HgY61Zt+FJzz1v7UR/CarHdK2V1aSK+aT35O2W/jk/XhEN
 GJ2gvzbNOkx62yrvRXfF8vVX8mu9lT9jxFgdnpk9csImZ9mTGYC4Y17ZBBGXDL4VTDnS
 zNZqG9HcbQrnSc8dhDDqVT/3cx3b1yWQgRqIlFVNyF3nJUnoqErFhp/jOG6CEhlx1K5J
 ajhCgM2yhkvyOxQ6AMEhLD7UMbitPH8cOgRlS4pGX+fB5o8EOyowI6FmhscPDpFrv6uq
 +BzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YeCgwmkCYfPYhU/h0QLtOewLk+EtQAkI6eXg9aDXtxw=;
 b=cLqht36vl/L0azeYzWaOhfanCyMbypIwot1A7Tycx4uVvlWLI6n9KiQl2OtVRH+cPg
 oMnC4tfeMZnVb1e8qhIHhENSL4vjhrhdalWn09FNFLZIYNfXMuRTTiaqwlDj4HzwRoUu
 fhMkUuINZ09gWlzjTsJfXp3W+oINjw91v71QYFW0bi8fsuGIbffieZ25jUU4dB0CDft+
 KhQ8NIADXzU86TUK0c4RBwahXDG/RM62TcOdEl8pUISfivQMGWk0lBEG0ESy9viQ4IRN
 g81zwufS6UqXUTMQkyIT2CGAILvzvCWcNdYkYaKrZOCuQYWQvSpn17oS/3k4vhL/FvIM
 EyWA==
X-Gm-Message-State: APjAAAX4fiKX2BZH5o6t5u9D7mt7L0ibvOIb2Fkf+e6XMUSY+dJI2aRR
 IROLivnQWJj1sQNj8ID/SpHWw2u5ccrwspjBNbA=
X-Google-Smtp-Source: APXvYqyedcI9pfQ98qI4IeokrB7YGwfRcobH0Ee9iAn0xXG2MFUUSr4NfC+zDiL1CiC4zFbm8TojuFAU2CVVv728JWw=
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr31134099wre.390.1580230530624; 
 Tue, 28 Jan 2020 08:55:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <0f94706731f30e8407f64064d33a27f549554250.1580148227.git.tamas.lengyel@intel.com>
 <60bfe54a-0395-228b-d74d-017db819c279@suse.com>
In-Reply-To: <60bfe54a-0395-228b-d74d-017db819c279@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 28 Jan 2020 09:54:54 -0700
Message-ID: <CABfawhnsNa-HZRtsuMop-dvV++WRNQj75TmN0LFW=ucs9Dz=SQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 2/9] x86/hvm: introduce
 hvm_copy_context_and_params
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMjgsIDIwMjAgYXQgOTo0OCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gQEAgLTQxMzksNDkgKzQxNDAsMzIgQEAgc3RhdGljIGludCBodm1fYWxsb3dfc2V0
X3BhcmFtKHN0cnVjdCBkb21haW4gKmQsCj4gPiAgICAgIHJldHVybiByYzsKPiA+ICB9Cj4gPgo+
ID4gLXN0YXRpYyBpbnQgaHZtb3Bfc2V0X3BhcmFtKAo+ID4gLSAgICBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHhlbl9odm1fcGFyYW1fdCkgYXJnKQo+ID4gK3N0YXRpYyBpbnQgaHZtX3NldF9wYXJh
bShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBpbmRleCwgdWludDY0X3QgdmFsdWUpCj4gPiAg
ewo+ID4gICAgICBzdHJ1Y3QgZG9tYWluICpjdXJyX2QgPSBjdXJyZW50LT5kb21haW47Cj4gPiAt
ICAgIHN0cnVjdCB4ZW5faHZtX3BhcmFtIGE7Cj4gPiAtICAgIHN0cnVjdCBkb21haW4gKmQ7Cj4g
PiAgICAgIHN0cnVjdCB2Y3B1ICp2Owo+ID4gICAgICBpbnQgcmM7Cj4gPgo+ID4gLSAgICBpZiAo
IGNvcHlfZnJvbV9ndWVzdCgmYSwgYXJnLCAxKSApCj4gPiAtICAgICAgICByZXR1cm4gLUVGQVVM
VDsKPiA+IC0KPiA+IC0gICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+ID4gKyAg
ICBpZiAoIGluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+ID4gICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7Cj4KPiBUaGUgZXF1aXZhbGVudCBvZiB0aGlzIG9uIHRoZSAiZ2V0IiBwYXRoIG5vdyBzZWVt
cyB0byBiZSBnb25lLiBJcwo+IHRoZXJlIGFueSByZWFzb24gdGhlIG9uZSBoZXJlIGlzIHN0aWxs
IG5lZWRlZD8KPgo+ID4gK2ludCBodm1vcF9zZXRfcGFyYW0oCj4gPiArICAgIFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0oeGVuX2h2bV9wYXJhbV90KSBhcmcpCj4gPiArewo+ID4gKyAgICBzdHJ1Y3Qg
eGVuX2h2bV9wYXJhbSBhOwo+ID4gKyAgICBzdHJ1Y3QgZG9tYWluICpkOwo+ID4gKyAgICBpbnQg
cmM7Cj4gPiArCj4gPiArICAgIGlmICggY29weV9mcm9tX2d1ZXN0KCZhLCBhcmcsIDEpICkKPiA+
ICsgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ID4gKwo+ID4gKyAgICBpZiAoIGEuaW5kZXggPj0g
SFZNX05SX1BBUkFNUyApCj4gPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICsKPiA+ICsg
ICAgLyogTWFrZSBzdXJlIHRoZSBhYm92ZSBib3VuZCBjaGVjayBpcyBub3QgYnlwYXNzZWQgZHVy
aW5nIHNwZWN1bGF0aW9uLiAqLwo+ID4gKyAgICBibG9ja19zcGVjdWxhdGlvbigpOwo+ID4gKwo+
ID4gKyAgICBkID0gcmN1X2xvY2tfZG9tYWluX2J5X2FueV9pZChhLmRvbWlkKTsKPiA+ICsgICAg
aWYgKCBkID09IE5VTEwgKQo+ID4gKyAgICAgICAgcmV0dXJuIC1FU1JDSDsKPiA+ICsKPiA+ICsg
ICAgcmMgPSAtRUlOVkFMOwo+ID4gKyAgICBpZiAoICFpc19odm1fZG9tYWluKGQpICkKPiA+ICsg
ICAgICAgIGdvdG8gb3V0Owo+Cj4gRGVzcGl0ZSB5b3VyIGNsYWltIHRvIGhhdmUgYWRkcmVzc2Vk
IG15IHJlbWFpbmluZyBjb21tZW50IGZyb20gdjQsCj4geW91IHN0aWxsIHVzZSBnb3RvIGhlcmUg
d2hlbiB0aGVyZSdzIGFuIGVhc3kgYWx0ZXJuYXRpdmUuCgpJIGRpZG4ndCB3cml0ZSB0aGlzIGNv
ZGUuIFRoaXMgaXMgcHJlZXhpc3RpbmcgY29kZSB0aGF0IEknbSBqdXN0Cm1vdmluZy4gSSBkb24n
dCB3YW50IHRvIHJld3JpdGUgcHJlZXhpc3RpbmcgY29kZSBoZXJlLgoKPgo+ID4gQEAgLTUyOTcs
NiArNTMyMiwzNyBAQCB2b2lkIGh2bV9zZXRfc2VnbWVudF9yZWdpc3RlcihzdHJ1Y3QgdmNwdSAq
diwgZW51bSB4ODZfc2VnbWVudCBzZWcsCj4gPiAgICAgIGFsdGVybmF0aXZlX3ZjYWxsKGh2bV9m
dW5jcy5zZXRfc2VnbWVudF9yZWdpc3Rlciwgdiwgc2VnLCByZWcpOwo+ID4gIH0KPiA+Cj4gPiAr
aW50IGh2bV9jb3B5X2NvbnRleHRfYW5kX3BhcmFtcyhzdHJ1Y3QgZG9tYWluICpkc3QsIHN0cnVj
dCBkb21haW4gKnNyYykKPiA+ICt7Cj4gPiArICAgIGludCByYzsKPiA+ICsgICAgdW5zaWduZWQg
aW50IGk7Cj4gPiArICAgIHN0cnVjdCBodm1fZG9tYWluX2NvbnRleHQgYyA9IHsgfTsKPiA+ICsK
PiA+ICsgICAgZm9yICggaSA9IDA7IGkgPCBIVk1fTlJfUEFSQU1TOyBpKysgKQo+ID4gKyAgICB7
Cj4gPiArICAgICAgICB1aW50NjRfdCB2YWx1ZSA9IDA7Cj4gPiArCj4gPiArICAgICAgICBpZiAo
IGh2bV9nZXRfcGFyYW0oc3JjLCBpLCAmdmFsdWUpIHx8ICF2YWx1ZSApCj4gPiArICAgICAgICAg
ICAgY29udGludWU7Cj4gPiArCj4gPiArICAgICAgICBpZiAoIChyYyA9IGh2bV9zZXRfcGFyYW0o
ZHN0LCBpLCB2YWx1ZSkpICkKPiA+ICsgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiArICAgIH0K
PiA+ICsKPiA+ICsgICAgYy5zaXplID0gaHZtX3NhdmVfc2l6ZShzcmMpOwo+ID4gKyAgICBpZiAo
IChjLmRhdGEgPSB2bWFsbG9jKGMuc2l6ZSkpID09IE5VTEwgKQo+ID4gKyAgICAgICAgcmV0dXJu
IC1FTk9NRU07Cj4gPiArCj4gPiArICAgIGlmICggIShyYyA9IGh2bV9zYXZlKHNyYywgJmMpKSAp
Cj4KPiBBbHNvIGNvbnRyYXJ5IHRvIHlvdXIgY2xhaW0geW91IHN0aWxsIGRvIGFsbG9jYXRpb24g
YW5kIHNhdmUKPiBhZnRlciB0aGUgbG9vcCwgbGVhdmluZyBkc3QgaW4gYSBwYXJ0bHkgbW9kaWZp
ZWQgc3RhdGUgaW4gbW9yZQo+IGNhc2VzIHRoYW4gbmVjZXNzYXJ5LiBNYXkgSSBhc2sgdGhhdCB5
b3UgZ28gYmFjayB0byB0aGUgdjQKPiBjb21tZW50cyBvbmUgbW9yZSB0aW1lPwoKSSBndWVzcyBJ
J2xsIGRvIHRoYXQgY2F1c2UgSSB0aG91Z2h0IHlvdSBhc2tlZCBmb3IgdGhlIGFsbG9jYXRpb24g
dG8KYmUgbW92ZWQgYXQgdGhlIGVuZC4gSXQgd2FzIHRoZSBvdGhlciB3YXkgYXJvdW5kIGJlZm9y
ZSwgc28gSSBndWVzcyBJCmRvbid0IGtub3cgd2hhdCB5b3UgYXJlIGFza2luZyBmb3IuCgpUYW1h
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
