Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220E18429D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:29:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCfeq-0004nf-Il; Fri, 13 Mar 2020 08:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHM7=46=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jCfep-0004na-3s
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:27:03 +0000
X-Inumbo-ID: 69952a9a-6504-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69952a9a-6504-11ea-bec1-bc764e2007e4;
 Fri, 13 Mar 2020 08:27:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 01184B22E;
 Fri, 13 Mar 2020 08:26:59 +0000 (UTC)
To: Miroslav Benes <mbenes@suse.cz>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, jpoimboe@redhat.com
References: <20200312142007.11488-1-mbenes@suse.cz>
 <20200312142007.11488-3-mbenes@suse.cz>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <75224ad1-f160-802a-9d72-b092ba864fb7@suse.com>
Date: Fri, 13 Mar 2020 09:26:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200312142007.11488-3-mbenes@suse.cz>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 2/2] x86/xen: Make the secondary CPU
 idle tasks reliable
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
Cc: xen-devel@lists.xenproject.org, x86@kernel.org, jslaby@suse.cz,
 linux-kernel@vger.kernel.org, live-patching@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAgMTU6MjAsIE1pcm9zbGF2IEJlbmVzIHdyb3RlOgo+IFRoZSB1bndpbmRlciBy
ZXBvcnRzIHRoZSBzZWNvbmRhcnkgQ1BVIGlkbGUgdGFza3MnIHN0YWNrIG9uIFhFTiBQViBhcwo+
IHVucmVsaWFibGUsIHdoaWNoIGFmZmVjdHMgYXQgbGVhc3QgbGl2ZSBwYXRjaGluZy4KPiBjcHVf
aW5pdGlhbGl6ZV9jb250ZXh0KCkgc2V0cyB1cCB0aGUgY29udGV4dCBvZiB0aGUgQ1BVIHRocm91
Z2gKPiBWQ1BVT1BfaW5pdGlhbGlzZSBoeXBlcmNhbGwuIEFmdGVyIGl0IGlzIHdva2VuIHVwLCB0
aGUgaWRsZSB0YXNrIHN0YXJ0cwo+IGluIGNwdV9icmluZ3VwX2FuZF9pZGxlKCkgZnVuY3Rpb24g
YW5kIGl0cyBzdGFjayBzdGFydHMgYXQgdGhlIG9mZnNldAo+IHJpZ2h0IGJlbG93IHB0X3JlZ3Mu
IFRoZSB1bndpbmRlciBjb3JyZWN0bHkgZGV0ZWN0cyB0aGUgZW5kIG9mIHN0YWNrCj4gdGhlcmUg
YnV0IGl0IGlzIGNvbmZ1c2VkIGJ5IE5VTEwgcmV0dXJuIGFkZHJlc3MgaW4gdGhlIGxhc3QgZnJh
bWUuCj4gCj4gUkZDOiBJIGhhdmVuJ3QgZm91bmQgdGhlIHdheSB0byB0ZWFjaCB0aGUgdW53aW5k
ZXIgYWJvdXQgdGhlIHN0YXRlIG9mCj4gdGhlIHN0YWNrIHRoZXJlLiBUaHVzIHRoZSB1Z2x5IGhh
Y2sgdXNpbmcgYXNzZW1ibHkuIFNpbWlsYXIgdG8gd2hhdAo+IHN0YXJ0dXBfeGVuKCkgaGFzIGdv
dCBmb3IgYm9vdCBDUFUuCj4gCj4gSXQgaW50cm9kdWNlcyBvYmp0b29sICJ1bnJlYWNoYWJsZSBp
bnN0cnVjdGlvbiIgd2FybmluZyBqdXN0IHJpZ2h0IGFmdGVyCj4gdGhlIGp1bXAgdG8gY3B1X2Jy
aW5ndXBfYW5kX2lkbGUoKS4gSXQgc2hvdWxkIHNob3cgdGhlIGlkZWEgd2hhdCBuZWVkcwo+IHRv
IGJlIGRvbmUgdGhvdWdoLCBJIHRoaW5rLiBJZGVhcyB3ZWxjb21lLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IE1pcm9zbGF2IEJlbmVzIDxtYmVuZXNAc3VzZS5jej4KPiAtLS0KPiAgIGFyY2gveDg2L3hl
bi9zbXBfcHYuYyAgIHwgIDMgKystCj4gICBhcmNoL3g4Ni94ZW4veGVuLWhlYWQuUyB8IDEwICsr
KysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vc21wX3B2LmMgYi9hcmNoL3g4Ni94
ZW4vc21wX3B2LmMKPiBpbmRleCA4MDJlZTViYmE2NmMuLjZiODhjZGNiZWY4ZiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3g4Ni94ZW4vc21wX3B2LmMKPiArKysgYi9hcmNoL3g4Ni94ZW4vc21wX3B2LmMK
PiBAQCAtNTMsNiArNTMsNyBAQCBzdGF0aWMgREVGSU5FX1BFUl9DUFUoc3RydWN0IHhlbl9jb21t
b25faXJxLCB4ZW5faXJxX3dvcmspID0geyAuaXJxID0gLTEgfTsKPiAgIHN0YXRpYyBERUZJTkVf
UEVSX0NQVShzdHJ1Y3QgeGVuX2NvbW1vbl9pcnEsIHhlbl9wbXVfaXJxKSA9IHsgLmlycSA9IC0x
IH07Cj4gICAKPiAgIHN0YXRpYyBpcnFyZXR1cm5fdCB4ZW5faXJxX3dvcmtfaW50ZXJydXB0KGlu
dCBpcnEsIHZvaWQgKmRldl9pZCk7Cj4gK2V4dGVybiB1bnNpZ25lZCBjaGFyIGFzbV9jcHVfYnJp
bmd1cF9hbmRfaWRsZVtdOwo+ICAgCj4gICBzdGF0aWMgdm9pZCBjcHVfYnJpbmd1cCh2b2lkKQo+
ICAgewoKV291bGQgYWRkaW5nIHRoaXMgaGVyZSB3b3JrPwoKKwlhc20gdm9sYXRpbGUgKFVOV0lO
RF9ISU5UKE9SQ19SRUdfVU5ERUZJTkVELCAwLCBPUkNfVFlQRV9DQUxMLCAxKSk7CgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
