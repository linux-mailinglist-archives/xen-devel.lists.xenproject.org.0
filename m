Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 616BC145A49
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:53:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuJEJ-0005DP-6B; Wed, 22 Jan 2020 16:51:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EGdE=3L=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iuJEH-0005DH-KG
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:51:45 +0000
X-Inumbo-ID: 78b0de56-3d37-11ea-aecd-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78b0de56-3d37-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 16:51:45 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f129so7933886wmf.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 08:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1tAtegONbnKeG3wuK+ngmFpFuFsNpc0Gm8PAh/UtyRo=;
 b=u6wz1XM9K7vPi+O70y5RkN86y6p9eL7CFixR/UlNDSftGla7y++NBrip/420NsslO8
 FiZXkvedRaXxmA/VR841/VZP6fi2SpDhmdyV2YpqMzADJITxmTYa+u+Ce2+DAtQI+3Lx
 dy3UBHcA0HTGptbMOXl/uO+3frboNJH2lARyWQdZXumxwk+yiKY/qv4GnSlNO6ETOvym
 K5pNiBvtV8f7LY4YoL1f1Cc7t5RZ+EjQjRkN+GvrUFaHgv9bDkTPR9TTPRoA8EpRNcgk
 mRd/CbUYAZNDdQmHJcTORW7gFKcULleVstmtk03LA3XICUbHFYdOFkWewf0yLRi+Zo81
 RtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1tAtegONbnKeG3wuK+ngmFpFuFsNpc0Gm8PAh/UtyRo=;
 b=i3gx96RbSFxNd8KG42YKOyHCD9Fiu4rJqsw2ZtWZofIDoVwZaScDZ95M6V2aYdumOL
 XSw9UAcb9RRdpMGOiu5eHZWfVWwlkVc2bMC5J6ykfRLqENzvSYzQGxY4fdI6Mq/JpyK2
 sqWeLcBv5BpVCgT19ymjbsgV0oeJhx6UMFHkEq3A2IZglXgOnxDFdWwuO/KXxy1MH9Xh
 O4APXer4GsZI9BLsW+hLC0hawM4DWaXxgpLaYTkN0bKp2M5QwVxDE4g2ofrNFEb3jtc9
 a6JxwPQHytsKi163/iXjv3JUCZMpnEBcbDIsy2HCjoNtriFgFln/XHgg98JRd2TRFeHu
 mAwg==
X-Gm-Message-State: APjAAAV6EkGa6yklMZXhzwtdfgDMEYTZoyo9+PadvFXM0D6ZRS8cn3Mf
 0Tu3JX0AZuY35Ip2zpbOrXtbpPVebay9XlTgFkg=
X-Google-Smtp-Source: APXvYqzQp4xlccJY6VOrM56aEZgIa6nzN8M4t8BGFrpv/7wC0Y75KufwC7SV8SMLW/mrq9a6vw18eqhMNfZm66gh6f0=
X-Received: by 2002:a7b:cbcc:: with SMTP id n12mr3892333wmi.186.1579711904072; 
 Wed, 22 Jan 2020 08:51:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <17ea032201adfecdb5dedc3a0b9667eccdf7f118.1579628566.git.tamas.lengyel@intel.com>
 <6cb72a36-d9af-5b96-76df-2c6746dfa245@suse.com>
In-Reply-To: <6cb72a36-d9af-5b96-76df-2c6746dfa245@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 22 Jan 2020 09:51:06 -0700
Message-ID: <CABfawhkzPyFas7kasNjBoCyCMi+kkfC6DrvYv4PCuPtK7A5MNA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v5 03/18] x86/p2m: Allow
 p2m_get_page_from_gfn to return shared entries
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

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgODoyMyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gVGhlIG93bmVyIGRvbWFpbiBvZiBzaGFyZWQgcGFnZXMgaXMgZG9tX2NvdywgdXNl
IHRoYXQgZm9yIGdldF9wYWdlCj4gPiBvdGhlcndpc2UgdGhlIGZ1bmN0aW9uIGZhaWxzIHRvIHJl
dHVybiB0aGUgY29ycmVjdCBwYWdlLgo+Cj4gSSB0aGluayB0aGlzIGRlc2NyaXB0aW9uIG5lZWRz
IGltcHJvdmVtZW50OiBUaGUgZnVuY3Rpb24gZG9lcyB0aGUKPiBzcGVjaWFsIHNoYXJlZCBwYWdl
IGRhbmNlIGluIG9uZSBwbGFjZSAob24gdGhlICJmYXN0IHBhdGgiKQo+IGFscmVhZHkuIFRoaXMg
d2FudHMgbWVudGlvbmluZywgZWl0aGVyIGJlY2F1c2UgaXQgd2FzIGEgbWlzdGFrZQo+IHRvIGhh
dmUgaXQganVzdCB0aGVyZSwgb3IgYmVjYXVzZSBhIG5ldyBuZWVkIGhhcyBhcHBlYXJlZCB0byBh
bHNvCj4gaGF2ZSBpdCBvbiB0aGUgInNsb3cgcGF0aCIuCgpJdCB3YXMgYSBwcmUtZXhpc3Rpbmcg
ZXJyb3Igbm90IHRvIGdldCB0aGUgcGFnZSBmcm9tIGRvbV9jb3cgZm9yIGEKc2hhcmVkIGVudHJ5
IGluIHRoZSBzbG93IHBhdGguIEkgb25seSByYW4gaW50byBpdCBub3cgYmVjYXVzZSB0aGUKZXJy
b25lb3VzIHR5cGVfY291bnQgY2hlY2sgbW92ZSBpbiB0aGUgcHJldmlvdXMgdmVyc2lvbiBvZiB0
aGUgc2VyaWVzCndhcyByZXN1bHRpbmcgaW4gYWxsIHBhZ2VzIGJlaW5nIGZ1bGx5IGRlZHVwbGlj
YXRlZCBpbnN0ZWFkIG9mIG1vc3RseQpiZWluZyBzaGFyZWQuIE5vdyB0aGF0IHRoZSBwYWdlcyBh
cmUgcHJvcGVybHkgc2hhcmVkIHJ1bm5pbmcgTGliVk1JIG9uCnRoZSBmb3JrIHJlc3VsdGVkIGlu
IGZhaWx1cmVzIGRvIHRvIHRoaXMgYnVnLgoKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
Ywo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPiBAQCAtNTk0LDcgKzU5NCwxMCBA
QCBzdHJ1Y3QgcGFnZV9pbmZvICpwMm1fZ2V0X3BhZ2VfZnJvbV9nZm4oCj4gPiAgICAgIGlmICgg
cDJtX2lzX3JhbSgqdCkgJiYgbWZuX3ZhbGlkKG1mbikgKQo+ID4gICAgICB7Cj4gPiAgICAgICAg
ICBwYWdlID0gbWZuX3RvX3BhZ2UobWZuKTsKPiA+IC0gICAgICAgIGlmICggIWdldF9wYWdlKHBh
Z2UsIHAybS0+ZG9tYWluKSApCj4gPiArICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBwMm0t
PmRvbWFpbikgJiYKPiA+ICsgICAgICAgICAgICAgLyogUGFnZSBjb3VsZCBiZSBzaGFyZWQgKi8K
PiA+ICsgICAgICAgICAgICAgKCFkb21fY293IHx8ICFwMm1faXNfc2hhcmVkKCp0KSB8fAo+ID4g
KyAgICAgICAgICAgICAgIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cpKSApCj4KPiBXaGlsZSB0aGVy
ZSBtYXkgYmUgYSByZWFzb24gd2h5IG9uIHRoZSBmYXN0IHBhdGggdHdvIGdldF9wYWdlKCkKPiBp
bnZvY2F0aW9ucyBhcmUgYmUgbmVjZXNzYXJ5LCBjb3VsZG4ndCB5b3UgZ2V0IGF3YXkgd2l0aCBq
dXN0Cj4gb25lCj4KPiAgICAgICAgIGlmICggIWdldF9wYWdlKHBhZ2UsICFkb21fY293IHx8ICFw
Mm1faXNfc2hhcmVkKCp0KSA/IHAybS0+ZG9tYWluCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiBkb21fY293KSApCj4KPiBhdCBs
ZWFzdCBoZXJlPyBJdCdzIGFsc28gbm90IHJlYWxseSBjbGVhciB0byBtZSB3aHkgaGVyZSBhbmQK
PiB0aGVyZSB3ZSBuZWVkICIhZG9tX2NvdyB8fCAhcDJtX2lzX3NoYXJlZCgqdCkiIC0gd291bGRu
J3QKPiBwMm1faXNfc2hhcmVkKCkgcmV0dXJuIGNvbnNpc3RlbnRseSAiZmFsc2UiIHdoZW4gIWRv
bV9jb3cgPwoKSSBzaW1wbHkgY29waWVkIHRoZSBleGlzdGluZyBjb2RlIGZyb20gdGhlIHNsb3df
cGF0aCBhcy1pcy4gSU1ITyBpdAp3b3VsZCBzdWZmaWNlIHRvIGRvIGEgc2luZ2xlIGdldF9wYWdl
KHBhZ2UsICFwMm1faXNfc2hhcmVkKCp0KSA/CnAybS0+ZG9tYWluIDogZG9tX2Nvdyk7ICBzaW5j
ZSB3ZSBjYW4ndCBoYXZlIGFueSBlbnRyaWVzIHRoYXQgYXJlCnNoYXJlZCB3aGVuIGRvbV9jb3cg
aXMgTlVMTCBzbyB0aGlzIGlzIHNhZmUsIG5vIG5lZWQgZm9yIHRoZSBleHRyYQohZG9tX2NvdyBj
aGVjay4gSWYgeW91IHByZWZlciBJIGNhbiBtYWtlIHRoZSBjaGFuZ2UgZm9yIGJvdGgKbG9jYXRp
b25zLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
