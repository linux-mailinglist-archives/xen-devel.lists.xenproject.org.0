Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F03F206F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2019 22:11:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSSWq-00005s-9S; Wed, 06 Nov 2019 21:07:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Sya=Y6=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iSSWo-00005n-Ak
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2019 21:07:46 +0000
X-Inumbo-ID: 7a1639ca-00d9-11ea-a1b3-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a1639ca-00d9-11ea-a1b3-12813bfff9fa;
 Wed, 06 Nov 2019 21:07:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1573074465; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=8kSv9gbNcR3R3lAGNyp0haOUp9i1zb6BVTxoQpyuzsY=;
 b=ifMsm6RX9e9FL6CNt78YyCuDgq0knwoXMvT+RaTRPGBpaGrRb+icQW8o1TouGVzX0LPKtTZc
 4tTKuNsLlgn8MRitv/5RafTfB4YsuYa/fOn4w1Ync4Sfm2Q8Idj5uF7XI/Gcrs4uuuQ+yd0P
 IlHeutcIJxdBm5fUoLIl5T1csjQ=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mxa.mailgun.org with ESMTP id 5dc3360a.7f5b4a60ecb0-smtp-out-n01;
 Wed, 06 Nov 2019 21:07:22 -0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id t26so5288618wmi.4
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2019 13:07:21 -0800 (PST)
X-Gm-Message-State: APjAAAXFXkzhXkO1zmBYFZEyXkEfFMOeo8NqHYM7cND+Fy5uLbNeXprD
 rPUpEWjDcKoP+s2dDeMoRvh+2XKQlrwcN06IWHY=
X-Google-Smtp-Source: APXvYqyC8V4srxfEqQkdcMQxwSIbN8jNJe0+5XA89lk0wkjOJc+IxI+mwBDxbNr4Jl5OwkPxwj89E8Um1pRc9PX3PeM=
X-Received: by 2002:a7b:c762:: with SMTP id x2mr4383813wmk.128.1573074440532; 
 Wed, 06 Nov 2019 13:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20191106153442.12776-1-aisaila@bitdefender.com>
In-Reply-To: <20191106153442.12776-1-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 6 Nov 2019 13:06:43 -0800
X-Gmail-Original-Message-ID: <CABfawhmw2d1Ktm2Qkpv6gdCJ6vWXWesxQgqgdRqx0edTBkf3jw@mail.gmail.com>
Message-ID: <CABfawhmw2d1Ktm2Qkpv6gdCJ6vWXWesxQgqgdRqx0edTBkf3jw@mail.gmail.com>
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

T24gV2VkLCBOb3YgNiwgMjAxOSBhdCA3OjM1IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBCjxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBCeSBkZWZhdWx0IHRoZSBzdmUgYml0
cyBhcmUgbm90IHNldC4KPiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgaHlwZXJjYWxsLCB4Y19hbHRw
Mm1fc2V0X3N1cHJlc3NfdmVfbXVsdGkoKSwKPiB0byBzZXQgYSByYW5nZSBvZiBzdmUgYml0cy4K
PiBUaGUgY29yZSBmdW5jdGlvbiwgcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aSgpLCBkb2VzIG5v
dCBicmFrZSBpbiBjYXNlCj4gb2YgYSBlcnJvciBhbmQgaXQgaXMgZG9pbmcgYSBiZXN0IGVmZm9y
dCBmb3Igc2V0dGluZyB0aGUgYml0cyBpbiB0aGUKPiBnaXZlbiByYW5nZS4gQSBjaGVjayBmb3Ig
Y29udGludWF0aW9uIGlzIG1hZGUgaW4gb3JkZXIgdG8gaGF2ZQo+IHByZWVtcHRpb24gb24gYmln
IHJhbmdlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0
ZGVmZW5kZXIuY29tPgo+Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSBWMToKPiAgICAgICAgIC0gUmVt
b3ZlICJjb250aW51ZSIKPiAgICAgICAgIC0gQWRkIGEgbmV3IGZpZWxkIGluIHhlbl9odm1fYWx0
cDJtX3N1cHByZXNzX3ZlIHRvIHN0b3JlIHRoZQo+IGNvbnRpbnVhdGlvbiB2YWx1ZQo+ICAgICAg
ICAgLSBIYXZlIHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoKSB0YWtlCj4geGVuX2h2bV9hbHRw
Mm1fc3VwcHJlc3NfdmUgYXMgYSBwYXJhbS4KPiAtLS0KPiAgdG9vbHMvbGlieGMvaW5jbHVkZS94
ZW5jdHJsLmggICB8ICAzICsrCj4gIHRvb2xzL2xpYnhjL3hjX2FsdHAybS5jICAgICAgICAgfCAy
NSArKysrKysrKysrKysrKwo+ICB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgIHwgMjAg
KysrKysrKysrKy0tCj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAgICAgICAgfCA1OCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgeGVuL2luY2x1ZGUvcHVibGljL2h2bS9o
dm1fb3AuaCB8ICA1ICsrLQo+ICB4ZW4vaW5jbHVkZS94ZW4vbWVtX2FjY2Vzcy5oICAgIHwgIDMg
KysKPiAgNiBmaWxlcyBjaGFuZ2VkLCAxMTEgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCBiL3Rvb2xzL2xp
YnhjL2luY2x1ZGUveGVuY3RybC5oCj4gaW5kZXggZjQ0MzE2ODdiMy4uMjFiNjQ0ZjQ1OSAxMDA2
NDQKPiAtLS0gYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAo+ICsrKyBiL3Rvb2xzL2xp
YnhjL2luY2x1ZGUveGVuY3RybC5oCj4gQEAgLTE5MjMsNiArMTkyMyw5IEBAIGludCB4Y19hbHRw
Mm1fc3dpdGNoX3RvX3ZpZXcoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQpOwo+ICBpbnQg
eGNfYWx0cDJtX3NldF9zdXBwcmVzc192ZSh4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3Qg
ZG9taWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IHZpZXdfaWQs
IHhlbl9wZm5fdCBnZm4sIGJvb2wgc3ZlKTsKPiAraW50IHhjX2FsdHAybV9zZXRfc3VwcmVzc192
ZV9tdWx0aSh4Y19pbnRlcmZhY2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qgdmlld19pZCwgeGVuX3Bmbl90IHN0
YXJ0X2dmbiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBu
ciwgYm9vbCBzdmUpOwo+ICBpbnQgeGNfYWx0cDJtX2dldF9zdXBwcmVzc192ZSh4Y19pbnRlcmZh
Y2UgKmhhbmRsZSwgdWludDMyX3QgZG9taWQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQxNl90IHZpZXdfaWQsIHhlbl9wZm5fdCBnZm4sIGJvb2wgKnN2ZSk7Cj4gIGludCB4
Y19hbHRwMm1fc2V0X21lbV9hY2Nlc3MoeGNfaW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRv
bWlkLAo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19hbHRwMm0uYyBiL3Rvb2xzL2xpYnhj
L3hjX2FsdHAybS5jCj4gaW5kZXggMDlkYWQwMzU1ZS4uNjYwNWQ5YWJiZSAxMDA2NDQKPiAtLS0g
YS90b29scy9saWJ4Yy94Y19hbHRwMm0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX2FsdHAybS5j
Cj4gQEAgLTIzNCw2ICsyMzQsMzEgQEAgaW50IHhjX2FsdHAybV9zZXRfc3VwcHJlc3NfdmUoeGNf
aW50ZXJmYWNlICpoYW5kbGUsIHVpbnQzMl90IGRvbWlkLAo+ICAgICAgcmV0dXJuIHJjOwo+ICB9
Cj4KPiAraW50IHhjX2FsdHAybV9zZXRfc3VwcmVzc192ZV9tdWx0aSh4Y19pbnRlcmZhY2UgKmhh
bmRsZSwgdWludDMyX3QgZG9taWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdWludDE2X3Qgdmlld19pZCwgeGVuX3Bmbl90IHN0YXJ0X2dmbiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBuciwgYm9vbCBzdmUpCj4gK3sKPiArICAg
IGludCByYzsKPiArICAgIERFQ0xBUkVfSFlQRVJDQUxMX0JVRkZFUih4ZW5faHZtX2FsdHAybV9v
cF90LCBhcmcpOwo+ICsKPiArICAgIGFyZyA9IHhjX2h5cGVyY2FsbF9idWZmZXJfYWxsb2MoaGFu
ZGxlLCBhcmcsIHNpemVvZigqYXJnKSk7CgpEb2VzIHhjX2h5cGVyY2FsbF9idWZmZXJfYWxsb2Mg
bnVsbC1pbml0aWFsaXplIHRoZSBzdHJ1Y3R1cmU/CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
