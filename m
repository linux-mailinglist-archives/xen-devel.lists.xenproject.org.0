Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A55FB2F2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:56:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUu0x-0001z8-KB; Wed, 13 Nov 2019 14:52:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XROl=ZF=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iUu0w-0001z3-8k
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:52:58 +0000
X-Inumbo-ID: 297fd416-0625-11ea-a233-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 297fd416-0625-11ea-a233-12813bfff9fa;
 Wed, 13 Nov 2019 14:52:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1573656728; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=ZWB9majjS4P+wVM27X95SZcE58whpa/bFrjGBSF1uvM=;
 b=pLf44lSM5rsYCJoAhlT/OClVXyLfkIOkInmJbQEsJzNTVkymqKcqFFcsmy1sAQ1ZC6p5KXWF
 18jA5J14UQ1u4KY21/KzbSqjIY5TP4q30QIuVRkGQkN66J6/tXmIcwI0lVW1i5DZt7r/6/mr
 AJKtwJZaWi63T3YxzfSyQ48FKuw=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mxa.mailgun.org with ESMTP id 5dcc1892.7fbcfec030b0-smtp-out-n03;
 Wed, 13 Nov 2019 14:52:02 -0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id l1so2307366wme.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Nov 2019 06:52:02 -0800 (PST)
X-Gm-Message-State: APjAAAXEZiJJM+G4tnltE9pZ4a7exefNKWoxfI1FyKMG1NjMVhGq8t7F
 IuMwPl/OjDTd5MJ0Ub2HZqlilJrqvMM8EmEmroA=
X-Google-Smtp-Source: APXvYqwBSR6kPWG0zVBpTB4wiff+vdwUF8zWrEBc+2W04JI2bB8xE2nmKNR42zcUrJVVILqvKUDwg+msA1cGQ89bKGw=
X-Received: by 2002:a7b:c642:: with SMTP id q2mr3144839wmk.169.1573656720955; 
 Wed, 13 Nov 2019 06:52:00 -0800 (PST)
MIME-Version: 1.0
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <CABfawhkjgmyYa11CMH1fBZG+Ee2ngvsoFzBvCixrj08FMcMT5A@mail.gmail.com>
 <2ba0e8d7-0e58-62c0-6c2b-8d9934b1137e@suse.com>
In-Reply-To: <2ba0e8d7-0e58-62c0-6c2b-8d9934b1137e@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 13 Nov 2019 07:51:24 -0700
X-Gmail-Original-Message-ID: <CABfawhnUtzWm25XOpr+BLkUuqA-OtpOUAh+91xBsk93dprWAyg@mail.gmail.com>
Message-ID: <CABfawhnUtzWm25XOpr+BLkUuqA-OtpOUAh+91xBsk93dprWAyg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgNzozMSBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMTIuMTEuMjAxOSAxNTowNSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgNDo1NCBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+IE9uIDA2LjExLjIwMTkgMTY6MzUsIEFsZXhhbmRy
dSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+ID4+PiArICAgICAgICBlbHNlCj4gPj4+ICsgICAgICAg
IHsKPiA+Pj4gKyAgICAgICAgICAgIHJjID0gcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShkLCAm
YS51LnN1cHByZXNzX3ZlKTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICAgICAgaWYgKCByYyA9PSAt
RVJFU1RBUlQgKQo+ID4+PiArICAgICAgICAgICAgICAgIGlmICggX19jb3B5X2ZpZWxkX3RvX2d1
ZXN0KGd1ZXN0X2hhbmRsZV9jYXN0KGFyZywKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB4ZW5faHZtX2FsdHAybV9vcF90KSwKPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmYSwgdS5zdXBwcmVzc192ZS5vcGFx
dWUpICkKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgcmMgPSAtRUZBVUxUOwo+ID4+Cj4gPj4g
SWYgdGhlIG9wZXJhdGlvbiBpcyBiZXN0IGVmZm9ydCwgX3NvbWVfIGluZGljYXRpb24gb2YgZmFp
bHVyZSBzaG91bGQKPiA+PiBzdGlsbCBiZSBoYW5kZWQgYmFjayB0byB0aGUgY2FsbGVyLiBXaGV0
aGVyIHRoYXQncyB0aHJvdWdoIHRoZSBvcGFxdWUKPiA+PiBmaWVsZCBvciBieSBzb21lIG90aGVy
IG1lYW5zIGlzIHNlY29uZGFyeS4gSWYgbm90IHZpYSB0aGF0IGZpZWxkCj4gPj4gKHdoaWNoIHdv
dWxkIG1ha2UgdGhlIG91dGVyIG9mIHRoZSB0d28gaWYoKS1zIGRpc2FwcGVhciksIHBsZWFzZSBm
b2xkCj4gPj4gdGhlIGlmKCktcy4KPiA+Cj4gPiBBdCBsZWFzdCBmb3IgbWVtX3NoYXJpbmdfcmFu
Z2Vfb3Agd2UgYWxzbyBkbyBhIGJlc3QtZWZmb3J0IGFuZCBkb24ndAo+ID4gcmV0dXJuIGFuIGVy
cm9yIGZvciBwYWdlcyB3aGVyZSBpdCB3YXNuJ3QgcG9zc2libGUgdG8gc2hhcmUuIFNvIEkKPiA+
IGRvbid0IHRoaW5rIGl0J3MgYWJzb2x1dGVseSBuZWNlc3NhcnkgdG8gZG8gdGhhdCwgZXNwZWNp
YWxseSBpZiB0aGUKPiA+IGNhbGxlciBjYW4ndCBkbyBhbnl0aGluZyBhYm91dCB0aG9zZSBlcnJv
cnMgYW55d2F5Lgo+Cj4gbWVtLXNoYXJpbmcgaXMgYSBsaXR0bGUgZGlmZmVyZW50IGluIG5hdHVy
ZSwgaXNuJ3QgaXQ/IElmIHlvdQo+IGNhbid0IHNoYXJlIGEgcGFnZSwgYm90aCBpbnZvbHZlZCBn
dWVzdHMgd2lsbCBjb250aW51ZSB0byBydW4KPiB3aXRoIHRoZWlyIG93biBpbnN0YW5jZXMuIElm
IHlvdSB3YW50IHRvIHN1cHByZXNzICNWRSBkZWxpdmVyeQo+IGFuZCBpdCBmYWlscywgYmVoYXZp
b3Igd29uJ3QgYmUgdHJhbnNwYXJlbnRseSBjb3JyZWN0LCBhcwo+IHRoZXJlJ2xsIHBvdGVudGlh
bGx5IGJlICNWRSB3aGVuIHRoZXJlIHNob3VsZCBiZSBub25lLiBXaGV0aGVyCj4gdGhhdCdzIGJl
bmlnbiB0byB0aGUgZ3Vlc3QgdmVyeSBtdWNoIGRlcGVuZHMgb24gaXRzIGhhbmRsZXIuCgpNYWtl
cyBtZSB3b25kZXIgd2hldGhlciBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8gZmxpcCB0aGlz
IHRoaW5nIG9uCml0cyBoZWFkIGFuZCBoYXZlIHN1cHJlc3NfdmUgYmUgc2V0IGJ5IGRlZmF1bHQg
KHNpbmNlIGl0cyBpZ25vcmVkIGJ5CmRlZmF1bHQpIGFuZCB0aGVuIGhhdmUgcGFnZXMgZm9yIHdo
aWNoIHRoZSBFUFQgdmlvbGF0aW9uIHNob3VsZCBiZQpjb252ZXJ0aWJsZSB0byAjVkUgYmUgc3Bl
Y2lmaWNhbGx5IGVuYWJsZWQgYnkgdHVybmluZyBzdXBwcmVzc192ZSBvZmYuClRoYXQgd291bGQg
ZWxpbWluYXRlIHRoZSBwb3NzaWJpbGl0eSBvZiBoYXZpbmcgdGhlIGluLWd1ZXN0IGhhbmRsZXIK
Z2V0dGluZyAjVkUgZm9yIHBhZ2VzIGl0IGlzIG5vdCByZWFkeSB0byBoYW5kbGUuIFRoZSBoeXBl
cnZpc29yIChhbmQKdGhlIGV4dGVybmFsIFZNSSB0b29sc3RhY2spIE9UT0ggc2hvdWxkIGFsd2F5
cyBiZSBpbiBhIHBvc2l0aW9uIHRvCmhhbmRsZSBFUFQgdmlvbGF0aW9ucyBpdCBpdHNlbGYgY2F1
c2VzIGJ5IGNoYW5naW5nIHRoZSBwYWdlCnBlcm1pc3Npb25zLgoKVGFtYXMKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
