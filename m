Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 927BEE184C
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 12:53:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNEDM-0002IE-Kd; Wed, 23 Oct 2019 10:50:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sGrY=YQ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNEDL-0002Hj-5q
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 10:50:03 +0000
X-Inumbo-ID: dd552198-f582-11e9-beca-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd552198-f582-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 10:50:02 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b24so19143015wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Oct 2019 03:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4knivng2KBKnNMdrMSwe8dQRaETnGEacJ5GixMwAIao=;
 b=uUWPBWaO0HnYy9QKJNeD2SDGp4/cOxXvsEA2tri2W3qpW6jazgqtWoPKVLa50kQ30E
 JpWtcK+Hw6F2LXvhsGzi9WbgPTOt5evRyd/gitoqKZ0Sr0kXjFFOSsO7J3co9JHyNm0X
 HZ5oSI7lV73Xs4O6P3Up4LUrTXj77xx2U01k7mbqBQo/rKeAZV/tb+3ACaqswgYCVbMZ
 xOot4GLnD/Lkq683GfDpWowsmk7ck2Z5E9W3DbE3yt3/4sN42T4ID6vrdFWPbDahc0BZ
 0T513aDNuZVzK1pRgUUui/e6sRPU/XKCCqHXk9vGD4Grp3P5d1tOR8+9c/jU5tVi3d+f
 qxsw==
X-Gm-Message-State: APjAAAUNdsvd79oyuVg8vIR+vBMMOzggkIBAZ9rh2isDLAIvzCvFMwtI
 pMUnF2IsnD6dt1SoF7Cyon0=
X-Google-Smtp-Source: APXvYqyltf22gRbCOxkVzGer7JNdvNwAm33fhqWQww7xqv6FEsSLfivq2i5chu+BM/ep+VtTEV09qw==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr7170155wmc.42.1571827801584; 
 Wed, 23 Oct 2019 03:50:01 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id s21sm25950255wrb.31.2019.10.23.03.50.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 03:50:00 -0700 (PDT)
Date: Wed, 23 Oct 2019 11:49:59 +0100
From: Wei Liu <wl@xen.org>
To: Paul Durrant <pdurrant@gmail.com>
Message-ID: <20191023104959.beuj5dyohrswrb54@debian>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-2-liuwe@microsoft.com>
 <CACCGGhAk04+HBvCZsahhzEQB8my97=RVLbsxUbPkYRBX_TukVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACCGGhAk04+HBvCZsahhzEQB8my97=RVLbsxUbPkYRBX_TukVg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v3 1/9] x86: introduce CONFIG_GUEST
 and move code
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMDg6NTU6MjRBTSArMDEwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IE9uIE1vbiwgMjEgT2N0IDIwMTkgYXQgMTY6NTksIFdlaSBMaXUgPHdsQHhlbi5vcmc+
IHdyb3RlOgo+ID4KPiA+IFhlbiBpcyBhYmxlIHRvIHJ1biBhcyBhIGd1ZXN0IG9uIFhlbi4gV2Ug
cGxhbiB0byBtYWtlIGl0IGFibGUgdG8gcnVuCj4gPiBvbiBIeXBlci1WIGFzIHdlbGwuCj4gPgo+
ID4gSW50cm9kdWNlIENPTkZJR19HVUVTVCB3aGljaCBpcyBzZXQgdG8gdHJ1ZSBpZiBlaXRoZXIg
cnVubmluZyBvbiBYZW4KPiA+IG9yIEh5cGVyLVYgaXMgZGVzaXJlZC4gUmVzdHJ1Y3R1cmUgY29k
ZSBoaWVyYXJjaHkgZm9yIG5ldyBjb2RlIHRvCj4gPiBjb21lLgo+ID4KPiA+IE5vIGZ1bmN0aW9u
YWwgY2hhbmdlIGludGVuZGVkLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdl
QG1pY3Jvc29mdC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCA0ICsrKysKPiA+ICB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgIHwgNSArLS0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC94
ZW4vTWFrZWZpbGUgICAgICAgICAgICAgICB8IDQgKysrKwo+ID4gIHhlbi9hcmNoL3g4Ni9ndWVz
dC97ID0+IHhlbn0vaHlwZXJjYWxsX3BhZ2UuUyB8IDAKPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3Qv
eyA9PiB4ZW59L3B2aC1ib290LmMgICAgICAgfCAwCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L3sg
PT4geGVufS94ZW4uYyAgICAgICAgICAgIHwgMAo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2Fy
Y2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZQo+ID4gIHJlbmFtZSB4ZW4vYXJjaC94ODYvZ3Vlc3Qv
eyA9PiB4ZW59L2h5cGVyY2FsbF9wYWdlLlMgKDEwMCUpCj4gPiAgcmVuYW1lIHhlbi9hcmNoL3g4
Ni9ndWVzdC97ID0+IHhlbn0vcHZoLWJvb3QuYyAoMTAwJSkKPiA+ICByZW5hbWUgeGVuL2FyY2gv
eDg2L2d1ZXN0L3sgPT4geGVufS94ZW4uYyAoMTAwJSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L0tjb25maWcgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ID4gaW5kZXggMjhiM2I0
NjkyYS4uODY3ZGU4NTdlOCAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4g
PiArKysgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ID4gQEAgLTE2MSw4ICsxNjEsMTIgQEAgY29u
ZmlnIFhFTl9BTElHTl8yTQo+ID4KPiA+ICBlbmRjaG9pY2UKPiA+Cj4gPiArY29uZmlnIEdVRVNU
Cj4gPiArICAgICAgIGJvb2wKPiA+ICsKPiA+ICBjb25maWcgWEVOX0dVRVNUCj4gPiAgICAgICAg
IGRlZl9ib29sIG4KPiA+ICsgICAgICAgc2VsZWN0IEdVRVNUCj4gPiAgICAgICAgIHByb21wdCAi
WGVuIEd1ZXN0Igo+ID4gICAgICAgICAtLS1oZWxwLS0tCj4gPiAgICAgICAgICAgU3VwcG9ydCBm
b3IgWGVuIGRldGVjdGluZyB3aGVuIGl0IGlzIHJ1bm5pbmcgdW5kZXIgWGVuLgo+IAo+IFRoaXMg
dGV4dCBuZWVkcyB0byBiZSBtb2RpZmllZC4gUGVyaGFwcyBqdXN0IHNheSAnd2hlbiBpdCBpcyBy
dW5uaW5nCj4gaW4gYSB2aXJ0dWFsIG1hY2hpbmUnLiBUaGF0IHNob3VsZCBiZSBmdXR1cmUtcHJv
b2YuCj4gCgpJIGRvbid0IHRoaW5rIGl0IHNob3VsZCBiZSBtb2RpZmllZCAtLSBYRU5fR1VFU1Qg
aGVyZSByZWFsbHkgbWVhbnMKc3BlY2lmaWNhbGx5IHJ1bm5pbmcgdW5kZXIgWGVuIGJ1dCBub3Qg
b3RoZXJzLgoKV2Ugd2lsbCBsYXRlciBpbnRyb2R1Y2VkIEhZUEVSVl9HVUVTVC4KCldlaS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
