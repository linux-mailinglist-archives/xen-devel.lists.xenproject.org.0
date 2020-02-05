Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2FB15286C
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:35:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izH25-0007Yc-CO; Wed, 05 Feb 2020 09:31:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lMay=3Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1izH24-0007YX-2i
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:31:40 +0000
X-Inumbo-ID: 4f66b6b0-47fa-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4f66b6b0-47fa-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 09:31:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3EB57ADEB;
 Wed,  5 Feb 2020 09:31:38 +0000 (UTC)
To: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>
References: <2704996.bt05f1kDAn@amur.mch.fsc.net>
 <3076850.sjLd3Rl8CD@amur.mch.fsc.net>
 <2c7f8172-b2c9-4831-f91d-d5b83a668527@suse.com>
 <2063375.Nye48AXmgY@amur.mch.fsc.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c975ae29-bdc2-e57f-d0b7-8ef829de6f1b@suse.com>
Date: Wed, 5 Feb 2020 10:31:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <2063375.Nye48AXmgY@amur.mch.fsc.net>
Content-Language: en-US
Subject: Re: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAgMTA6MDMsIERpZXRtYXIgSGFobiB3cm90ZToKPiBBbSBEaWVuc3RhZywgNC4g
RmVicnVhciAyMDIwLCAxNToxODo1MyBDRVQgc2NocmllYiBKw7xyZ2VuIEdyb8OfOgo+PiBPbiAw
NC4wMi4yMCAxNTowNywgRGlldG1hciBIYWhuIHdyb3RlOgo+Pj4gQW0gRnJlaXRhZywgMzEuIEph
bnVhciAyMDIwLCAyMjo1OToxOSBDRVQgc2NocmllYiBJZ29yIERydXpoaW5pbjoKPj4+PiBPbiAz
MC8wMS8yMDIwIDEzOjAzLCBEaWV0bWFyIEhhaG4gd3JvdGU6Cj4+Pj4+IEhpLAo+Pj4+Pgo+Pj4+
PiB3ZSB1c2UgU0xFUzEyIHdpdGgga2VybmVsLWRlZmF1bHQtNC4xMi4xNC05NS40NS4xLng4Nl82
NCBhbmQKPj4+Pj4geGVuLTQuMTEuM18wMi0yLjIwLjEueDg2XzY0Cj4+Pj4+Cj4+Pj4+IFRoZSBk
dW1wIGtlcm5lbCBkb2Vzbid0IHN0YXJ0IGFmdGVyICJlY2hvIGMgPiAvcHJvYy9zeXNycV90cmln
Z2VyIi4KPj4+Pj4gTGFzdCBtZXNzYWdlcyBvbiBjb25zb2xlIGFyZToKPj4+Pj4gWyAgMzg1Ljcx
NzUzMl0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IEZhdGFsIGV4Y2VwdGlvbgo+Pj4+PiBb
ICAzODUuNzM0NTY1XSBLZXJuZWwgT2Zmc2V0OiBkaXNhYmxlZAo+Pj4+PiAoWEVOKSBIYXJkd2Fy
ZSBEb20wIGNyYXNoZWQ6IEV4ZWN1dGluZyBrZXhlYyBpbWFnZSBvbiBjcHU1OAo+Pj4+PiAoWEVO
KSBTaG90IGRvd24gYWxsIENQVXMKPj4+Pj4KPj4+Pj4gQWZ0ZXIgYSBzaG9ydCB0aW1lIGEgcmVi
b290IGlzIGluaXRpYXRlZC4KPj4+Pj4gV2l0aG91dCB4ZW4gdGhlIGtkdW1wIHdvcmtzLgo+Pj4+
Pgo+Pj4+PiBXZSBzZWUgdGhpcyBiZWhhdmlvdXIgb25seSBvbiBuZXdlciBoYXJkd2FyZSwgZm9y
IGV4YW1wbGUgYSBzZXJ2ZXIgd2l0aAo+Pj4+PiBJbnRlbChSKSBYZW9uKFIpIEdvbGQgNjI0MiBD
UFUgQCAyLjgwR0h6Cj4+Pj4+Cj4+Pj4+IEkgYnVpbHQgdGhlIGZyZXNoIHJlbGVhc2VkIHhlbi00
LjEzIG15c2VsZiBhbmQgdHJpZWQgaXQgYnV0IHRoaXMgZG9lc24ndCBoZWxwLgo+Pj4+Pgo+Pj4+
PiBJIHRyaWVkIHgyYXBpYz1vZmYgb24gdGhlIHhlbiBzaWRlIGFuZCBub3gyYXBpYyBvbiB0aGUg
bGludXggc2lkZSBidXQgbm8gc3VjY2Vzcy4KPj4+Pgo+Pj4+IFN0YXJ0aW5nIGZyb20gWGVuIDQu
MTIgd2Uga2VlcCBJT01NVSBlbmFibGVkIGR1cmluZyBrZXhlYyB0cmFuc2l0aW9uCj4+Pj4gd2hp
Y2ggcmVzb2x2ZWQgdGhlIHByb2JsZW0geW91J3JlIGRlc2NyaWJpbmcuIEJ1dCB5b3UgYWxzbyBu
ZWVkIHRvIG1ha2UKPj4+PiBzdXJlIElPTU1VIGlzIGVuYWJsZWQgaW4geW91ciBrZXhlYyBrZXJu
ZWwgKHdoaWNoIEkgdGhpbmsgaXMgbm93IHRoZQo+Pj4+IGRlZmF1bHQgZm9yIG1vc3QgZGlzdHJv
cykuIFlvdSBjYW4gc3RpbGwgdHJ5IHRvIHdvcmthcm91bmQgdGhlIGlzc3VlCj4+Pj4geW91J3Jl
IHNlZWluZyBvbiA0LjExIGJ5IHVzaW5nICJpb21tdT1kb20wLXBhc3N0aG91Z2giIFhlbiBvcHRp
b24uCj4+Pgo+Pj4gSSBhZGRlZCAiaW9tbXU9ZG9tMC1wYXNzdGhyb3VnaCIgdG8gdGhlIHhlbi00
LjExIGNvbW1hbmQgbGluZSBidXQgbm8gc3VjY2Vzcy4KPj4+IEZ1cnRoZXIgSSBhZGRlZCBlYXJs
eXByaW50az0uLi4gdG8gdGhlIHRoZSBrZHVtcCBrZXJuZWwgYW5kIEkgY291bGQgc2VlIHRoZQo+
Pj4gZHVtcCBrZXJuZWwgc3RhcnRlZCBhbmQgb25seSBvbmUgbWVzc2FnZSBmcm9tIGV4dHJhY3Rf
a2VybmVsKCkKPj4+IHdhcyBwcmludGVkLiBUaGVuIHRoZSByZWJvb3QgZm9sbG93ZWQuCj4+Cj4+
IFdoaWNoIG1lc3NhZ2U/Cj4+Cj4+IEFueSBjaGFuY2UgeW91IGNhbiBidWlsZCB0aGUga2R1bXAg
a2VybmVsIHdpdGggQ09ORklHX1g4Nl9WRVJCT1NFX0JPT1RVUAo+PiBlbmFibGVkPwo+IAo+IFll
cyBpdCdzIHN3aXRjaGVkIG9uLiBUaGUgTWVzc2FnZSBpcyBmcm9tIHRoZSBmaXJzdCBkZWJ1ZyBt
ZXNzYWdlIGluCj4gZXh0cmFjdF9rZXJuZWwoKSAtIGRlYnVnX3B1dGFkZHIoaW5wdXRfZGF0YSk6
Cj4gImlucHV0X2RhdGE6IDB4IgoKV2VpcmQsIHRoZXJlIHNob3VsZCBiZSAiZWFybHkgY29uc29s
ZSBpbiBleHRyYWN0X2tlcm5lbFxuIiBiZWZvcmUgdGhhdC4KCj4gQnV0IG5vdCBhbGwgb2YgdGhl
IHRleHQgaXMgc2VlbiEKCldlaXJkIGFnYWluIC0gdGhlIGFkZHJlc3Mgc2hvdWxkIGJlIHByaW50
ZWQuCgo+IElmIEkgdW50ZXJzdGFuZCB0aGUgZWFybHlfc2VyaWFsX2luaXQgY29kZSBpbiBhcmNo
L3g4Ni9ib290L2Vhcmx5X3NlcmlhbF9jb25zb2xlLmMKPiBjb3JyZWN0bHkgdGhlIHNlcmlhbCBs
aW5lIHdvcmtzIHdpdGggcG9sbGluZyAobm8gaW50ZXJydXB0cyksIHNvIGl0IHNlZW1zIHRoZQo+
IHJlYm9vdCBpcyBpbml0aWF0ZWQgYmVmb3JlIHRoZSBjb21wbGV0ZSBtZXNzYWdlIGlzIHByaW50
ZWQuCgpCdXQgcG9sbGluZyBpcyBzeW5jaHJvbm91cyAoc2VlIHNlcmlhbF9wdXRjaGFyKCkgaW4K
YXJjaC94ODYvYm9vdC9jb21wcmVzc2VkL21pc2MuYykuIFNvIGEgcmVib290IGluZGljYXRlcyBh
IHZlcnkgZWFybHkKZmFpbHVyZS4KCkNhbiB5b3UgcGxlYXNlIHNob3cgdGhlIGNvbXBsZXRlIGtk
dW1wIGtlcm5lbCBib290IHBhcmFtZXRlcnM/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
