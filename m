Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6996BF31EF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:04:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjHz-00052L-ME; Thu, 07 Nov 2019 15:01:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zaEo=Y7=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iSjHx-00052G-V3
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:01:33 +0000
X-Inumbo-ID: 7c111f7e-016f-11ea-b678-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c111f7e-016f-11ea-b678-bc764e2007e4;
 Thu, 07 Nov 2019 15:01:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1573138893; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=mltBW21ixHyJu4h3lYzSGySJo3CP7He2tQnF+JaeH64=;
 b=LsAAfVlyiQ03+pCpUZK7Mmt98QWXFSn0OAG0vfTvExzTAFgAuOoRy0YUZWfWSdPaWJQ1kUu0
 +1B1koWYi3QQsbMZCL1rQGr4rT8kOb2vGFhtQV62zcHuoXW9PnOqMbJby972jUbZkXO5J/hV
 Ox8kUL48CBc1q6/wkTnUWx/mxA8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mxa.mailgun.org with ESMTP id 5dc431ca.7f3e83c57a70-smtp-out-n03;
 Thu, 07 Nov 2019 15:01:30 -0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id b3so3330824wrs.13
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2019 07:01:30 -0800 (PST)
X-Gm-Message-State: APjAAAVX4LjvWSDwRxT01CfxWi6gLibZLQMjAwKfNmOmHHNhLh4WldQt
 DhAV/H5zVJs9W6+6CmTeTIBw82mpI//7U/hvptw=
X-Google-Smtp-Source: APXvYqwy6wHHhwIfBPDFR35Rx3ZXq0iJo9gMvQP8Oz5mDJkqfbDwo2POL/o4U/+vFfAY7+mnGqBoU72ZhsE099djP4U=
X-Received: by 2002:a5d:4611:: with SMTP id t17mr3196462wrq.353.1573138888238; 
 Thu, 07 Nov 2019 07:01:28 -0800 (PST)
MIME-Version: 1.0
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <CABfawhmw2d1Ktm2Qkpv6gdCJ6vWXWesxQgqgdRqx0edTBkf3jw@mail.gmail.com>
 <17cc5e81-c229-18fb-41da-64219abb74e7@bitdefender.com>
In-Reply-To: <17cc5e81-c229-18fb-41da-64219abb74e7@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 7 Nov 2019 07:00:50 -0800
X-Gmail-Original-Message-ID: <CABfawhnq2oOypzfJXiFzro9Jm-XMfbJqSwtLKXOfzx9-AYoDNg@mail.gmail.com>
Message-ID: <CABfawhnq2oOypzfJXiFzro9Jm-XMfbJqSwtLKXOfzx9-AYoDNg@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
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
 "julien@xen.org" <julien@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCAxMTo0NiBQTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDA2LjExLjIwMTkgMjM6
MDYsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+IE9uIFdlZCwgTm92IDYsIDIwMTkgYXQgNzoz
NSBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo+ID4gPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29t
PiB3cm90ZToKPiA+Pgo+ID4+IEJ5IGRlZmF1bHQgdGhlIHN2ZSBiaXRzIGFyZSBub3Qgc2V0Lgo+
ID4+IFRoaXMgcGF0Y2ggYWRkcyBhIG5ldyBoeXBlcmNhbGwsIHhjX2FsdHAybV9zZXRfc3VwcmVz
c192ZV9tdWx0aSgpLAo+ID4+IHRvIHNldCBhIHJhbmdlIG9mIHN2ZSBiaXRzLgo+ID4+IFRoZSBj
b3JlIGZ1bmN0aW9uLCBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKCksIGRvZXMgbm90IGJyYWtl
IGluIGNhc2UKPiA+PiBvZiBhIGVycm9yIGFuZCBpdCBpcyBkb2luZyBhIGJlc3QgZWZmb3J0IGZv
ciBzZXR0aW5nIHRoZSBiaXRzIGluIHRoZQo+ID4+IGdpdmVuIHJhbmdlLiBBIGNoZWNrIGZvciBj
b250aW51YXRpb24gaXMgbWFkZSBpbiBvcmRlciB0byBoYXZlCj4gPj4gcHJlZW1wdGlvbiBvbiBi
aWcgcmFuZ2VzLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gPj4KPiA+PiAtLS0KPiA+PiBDaGFuZ2VzIHNpbmNlIFYx
Ogo+ID4+ICAgICAgICAgIC0gUmVtb3ZlICJjb250aW51ZSIKPiA+PiAgICAgICAgICAtIEFkZCBh
IG5ldyBmaWVsZCBpbiB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZSB0byBzdG9yZSB0aGUKPiA+
PiBjb250aW51YXRpb24gdmFsdWUKPiA+PiAgICAgICAgICAtIEhhdmUgcDJtX3NldF9zdXBwcmVz
c192ZV9tdWx0aSgpIHRha2UKPiA+PiB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZSBhcyBhIHBh
cmFtLgo+ID4+IC0tLQo+ID4+ICAgdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggICB8ICAz
ICsrCj4gPj4gICB0b29scy9saWJ4Yy94Y19hbHRwMm0uYyAgICAgICAgIHwgMjUgKysrKysrKysr
KysrKysKPiA+PiAgIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgICAgfCAyMCArKysrKysr
KysrLS0KPiA+PiAgIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgfCA1OCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9odm0v
aHZtX29wLmggfCAgNSArKy0KPiA+PiAgIHhlbi9pbmNsdWRlL3hlbi9tZW1fYWNjZXNzLmggICAg
fCAgMyArKwo+ID4+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0
cmwuaCBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCj4gPj4gaW5kZXggZjQ0MzE2ODdi
My4uMjFiNjQ0ZjQ1OSAxMDA2NDQKPiA+PiAtLS0gYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0
cmwuaAo+ID4+ICsrKyBiL3Rvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3RybC5oCj4gPj4gQEAgLTE5
MjMsNiArMTkyMyw5IEBAIGludCB4Y19hbHRwMm1fc3dpdGNoX3RvX3ZpZXcoeGNfaW50ZXJmYWNl
ICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1aW50MTZfdCB2aWV3X2lkKTsKPiA+PiAgIGludCB4Y19hbHRwMm1fc2V0X3N1cHByZXNz
X3ZlKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwKPiA+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBnZm4sIGJv
b2wgc3ZlKTsKPiA+PiAraW50IHhjX2FsdHAybV9zZXRfc3VwcmVzc192ZV9tdWx0aSh4Y19pbnRl
cmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsCj4gPj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgdWludDE2X3Qgdmlld19pZCwgeGVuX3Bmbl90IHN0YXJ0X2dmbiwKPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBuciwgYm9vbCBz
dmUpOwo+ID4+ICAgaW50IHhjX2FsdHAybV9nZXRfc3VwcHJlc3NfdmUoeGNfaW50ZXJmYWNlICpo
YW5kbGUsIHVpbnQzMl90IGRvbWlkLAo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDE2X3Qgdmlld19pZCwgeGVuX3Bmbl90IGdmbiwgYm9vbCAqc3ZlKTsKPiA+PiAgIGlu
dCB4Y19hbHRwMm1fc2V0X21lbV9hY2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90
IGRvbWlkLAo+ID4+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19hbHRwMm0uYyBiL3Rvb2xz
L2xpYnhjL3hjX2FsdHAybS5jCj4gPj4gaW5kZXggMDlkYWQwMzU1ZS4uNjYwNWQ5YWJiZSAxMDA2
NDQKPiA+PiAtLS0gYS90b29scy9saWJ4Yy94Y19hbHRwMm0uYwo+ID4+ICsrKyBiL3Rvb2xzL2xp
YnhjL3hjX2FsdHAybS5jCj4gPj4gQEAgLTIzNCw2ICsyMzQsMzEgQEAgaW50IHhjX2FsdHAybV9z
ZXRfc3VwcHJlc3NfdmUoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLAo+ID4+
ICAgICAgIHJldHVybiByYzsKPiA+PiAgIH0KPiA+Pgo+ID4+ICtpbnQgeGNfYWx0cDJtX3NldF9z
dXByZXNzX3ZlX211bHRpKHhjX2ludGVyZmFjZSAqaGFuZGxlLCB1aW50MzJfdCBkb21pZCwKPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCB2aWV3X2lkLCB4
ZW5fcGZuX3Qgc3RhcnRfZ2ZuLAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IG5yLCBib29sIHN2ZSkKPiA+PiArewo+ID4+ICsgICAgaW50IHJjOwo+ID4+
ICsgICAgREVDTEFSRV9IWVBFUkNBTExfQlVGRkVSKHhlbl9odm1fYWx0cDJtX29wX3QsIGFyZyk7
Cj4gPj4gKwo+ID4+ICsgICAgYXJnID0geGNfaHlwZXJjYWxsX2J1ZmZlcl9hbGxvYyhoYW5kbGUs
IGFyZywgc2l6ZW9mKCphcmcpKTsKPiA+Cj4gPiBEb2VzIHhjX2h5cGVyY2FsbF9idWZmZXJfYWxs
b2MgbnVsbC1pbml0aWFsaXplIHRoZSBzdHJ1Y3R1cmU/Cj4gPgo+Cj4gSXQgY2FsbHMgeGVuY2Fs
bF9hbGxvY19idWZmZXJfcGFnZXMoKSB3aGljaCBjYWxscyBtZW1zZXQocCwgMCwgbnJfcGFnZXMK
PiAqIFBBR0VfU0laRSkgYmVmb3JlIHJldHVybmluZy4KClRoYW5rcyEKClJldmlld2VkLWJ5OiBU
YW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
