Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEDD145A6C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 17:58:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuJJ0-0005Ue-FV; Wed, 22 Jan 2020 16:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihv9=3L=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iuJIy-0005UE-12
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 16:56:36 +0000
X-Inumbo-ID: 2074ff96-3d38-11ea-9fd7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2074ff96-3d38-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 16:56:26 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1579712187; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=C9PzWuGVDijPX3aMKP21lDLPIsSXvTMjy9QfUYkdj6g=;
 b=jDTQNSFehrJoU1fqE+cOWRwe6T5IjwoIyGX7VTIe7fjqARiqvQKPh/eDATkQuFhnVNF/iS51
 2314PcUJ4HDWFBuPhWZ9poT6R8uXBvT8ReaUKMtlPgn9uSSm0aJN/vllSJX2+lbiMrznOQt5
 vC9dSygHWvfHpCBtmusxQXcGRHE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mxa.mailgun.org with ESMTP id 5e287eb6.7f28029c65f0-smtp-out-n03;
 Wed, 22 Jan 2020 16:56:22 -0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id s144so2022193wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 08:56:21 -0800 (PST)
X-Gm-Message-State: APjAAAU8tRqe4MrRUJQyMlZyJ7GgYNLSS4OhxiYp6z54JeqtuHgH1iG3
 w4IvRPj2sx3FcV08qFx3F454fvK4rxdF2gLs3Kc=
X-Google-Smtp-Source: APXvYqyR9j45I360n8oLKgVTIR5XIiMjryQbqanfUymfdE3Rarc5T2B5IRmRBu5DMebp6LInVR8K+fAiQfgQwl13Gqg=
X-Received: by 2002:a7b:c216:: with SMTP id x22mr4047628wmi.51.1579712180448; 
 Wed, 22 Jan 2020 08:56:20 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <a62c17b05d8c2de1d6c2a08874092d81ab86db04.1579628566.git.tamas.lengyel@intel.com>
 <dba48653-b26f-98d1-7c09-12c1a3227392@suse.com>
In-Reply-To: <dba48653-b26f-98d1-7c09-12c1a3227392@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 22 Jan 2020 09:55:43 -0700
X-Gmail-Original-Message-ID: <CABfawhk7WCnUN6MKk8wHZAewxtJHG5Eki8qcvWGGWzRFyK+TaQ@mail.gmail.com>
Message-ID: <CABfawhk7WCnUN6MKk8wHZAewxtJHG5Eki8qcvWGGWzRFyK+TaQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v5 11/18] x86/mem_sharing: Replace
 MEM_SHARING_DEBUG with gdprintk
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

T24gV2VkLCBKYW4gMjIsIDIwMjAgYXQgODozMCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gQEAgLTUzOCwyNCArNTM1LDI2IEBAIHN0YXRpYyBpbnQgYXVkaXQodm9pZCkKPiA+
ICAgICAgICAgICAgICBkID0gZ2V0X2RvbWFpbl9ieV9pZChnLT5kb21haW4pOwo+ID4gICAgICAg
ICAgICAgIGlmICggZCA9PSBOVUxMICkKPiA+ICAgICAgICAgICAgICB7Cj4gPiAtICAgICAgICAg
ICAgICAgIE1FTV9TSEFSSU5HX0RFQlVHKCJVbmtub3duIGRvbTogJWh1LCBmb3IgUEZOPSVseCwg
TUZOPSVseFxuIiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZy0+ZG9t
YWluLCBnLT5nZm4sIG1mbl94KG1mbikpOwo+ID4gKyAgICAgICAgICAgICAgICBnZHByaW50ayhY
RU5MT0dfRVJSLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAiVW5rbm93biBkb206ICVw
ZCwgZm9yIFBGTj0lbHgsIE1GTj0lbHhcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
IGQsIGctPmdmbiwgbWZuX3gobWZuKSk7Cj4KPiBXaXRoICJpZiAoIGQgPT0gTlVMTCApIiBhcm91
bmQgdGhpcyB5b3UgaGFyZGx5IG1lYW4gdG8gcGFzcyBkIHRvCj4gdGhlIGZ1bmN0aW9uIGhlcmUu
IFRoaXMgaXMgYSBjYXNlIHdoZXJlIHlvdSByZWFsbHkgbmVlZCB0byBzdGljawo+IHRvIGxvZ2dp
bmcgYSByYXcgbnVtYmVyLgoKSW5kZWVkLi4KCj4KPiA+ICAgICAgICAgICAgICAgICAgZXJyb3Jz
Kys7Cj4gPiAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gICAgICAgICAgICAgIH0KPiA+
ICAgICAgICAgICAgICBvX21mbiA9IGdldF9nZm5fcXVlcnlfdW5sb2NrZWQoZCwgZy0+Z2ZuLCAm
dCk7Cj4gPiAgICAgICAgICAgICAgaWYgKCAhbWZuX2VxKG9fbWZuLCBtZm4pICkKPiA+ICAgICAg
ICAgICAgICB7Cj4gPiAtICAgICAgICAgICAgICAgIE1FTV9TSEFSSU5HX0RFQlVHKCJJbmNvcnJl
Y3QgUDJNIGZvciBkPSVodSwgUEZOPSVseC4iCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJFeHBlY3RpbmcgTUZOPSVseCwgZ290ICVseFxuIiwKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZy0+ZG9tYWluLCBnLT5nZm4sIG1mbl94KG1mbiksIG1m
bl94KG9fbWZuKSk7Cj4gPiArICAgICAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJJ
bmNvcnJlY3QgUDJNIGZvciBkPSVwZCwgUEZOPSVseC4iCj4KPiBIZXJlIGFuZCBlbHNld2hlcmUg
bWF5IEkgcmVjb21tZW5kIGRyb3BwaW5nIGQ9IChvciBkb209IGZ1cnRoZXIKPiBkb3duKT8KClNH
VE0KCj4KPiA+IEBAIC03NTcsMTAgKzc1NiwxMCBAQCBzdGF0aWMgaW50IGRlYnVnX21mbihtZm5f
dCBtZm4pCj4gPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+ICAgICAgfQo+ID4KPiA+IC0g
ICAgTUVNX1NIQVJJTkdfREVCVUcoCj4gPiAtICAgICAgICAiRGVidWcgcGFnZTogTUZOPSVseCBp
cyBjaT0lbHgsIHRpPSVseCwgb3duZXI9JXBkXG4iLAo+ID4gLSAgICAgICAgbWZuX3gocGFnZV90
b19tZm4ocGFnZSkpLCBwYWdlLT5jb3VudF9pbmZvLAo+ID4gLSAgICAgICAgcGFnZS0+dS5pbnVz
ZS50eXBlX2luZm8sIHBhZ2VfZ2V0X293bmVyKHBhZ2UpKTsKPiA+ICsgICAgZ2RwcmludGsoWEVO
TE9HX0VSUiwKPiA+ICsgICAgICAgICAgICAgIkRlYnVnIHBhZ2U6IE1GTj0lbHggaXMgY2k9JWx4
LCB0aT0lbHgsIG93bmVyX2lkPSVkXG4iLAo+ID4gKyAgICAgICAgICAgICBtZm5feChwYWdlX3Rv
X21mbihwYWdlKSksIHBhZ2UtPmNvdW50X2luZm8sCj4gPiArICAgICAgICAgICAgIHBhZ2UtPnUu
aW51c2UudHlwZV9pbmZvLCBwYWdlX2dldF9vd25lcihwYWdlKS0+ZG9tYWluX2lkKTsKPgo+IEFz
IGluZGljYXRlZCBiZWZvcmUgKEkgdGhpbmspLCBwbGVhc2UgcHJlZmVyICVwZCBhbmQgYSBzdHJ1
Y3QgZG9tYWluCj4gcG9pbnRlciBvdmVyIHBhc3NpbmcgLT5kb21haW5faWQgKGF0IGxlYXN0IG9u
ZSBtb3JlIGluc3RhbmNlIGZ1cnRoZXIKPiBkb3duKS4KCkkgdGhvdWdodCBJIGZpeGVkIHRoZW0g
YWxsIGJ1dCBldmlkZW50bHkgc29tZSByZW1haW5lZC4KClRoYW5rcywKVGFtYXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
