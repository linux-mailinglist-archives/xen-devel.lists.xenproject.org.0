Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC88357C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 17:40:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv1XP-0007t4-BU; Tue, 06 Aug 2019 15:38:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ad9+=WC=dornerworks.com=nathan.studer@srs-us1.protection.inumbo.net>)
 id 1hv1XO-0007sz-2y
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 15:38:10 +0000
X-Inumbo-ID: 30216d91-b860-11e9-8980-bc764e045a96
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 30216d91-b860-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 15:38:08 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, Amit Tomer <amittomer25@gmail.com>
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
 <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
 <44094e19-48c6-8281-4e04-2b2a24db98db@arm.com>
 <CABHD4K8GmFLXjwrRse5JuJ4rSJ3Wy0_uU_6edqSMF_Yi5-YjDQ@mail.gmail.com>
 <ff55b765-03b5-9cb1-0e56-d342425a608d@arm.com>
From: NathanStuder <nathan.studer@dornerworks.com>
Message-ID: <6b286e50-411f-229f-e6b8-0ebd7e930f22@dornerworks.com>
Date: Tue, 6 Aug 2019 11:37:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ff55b765-03b5-9cb1-0e56-d342425a608d@arm.com>
Content-Language: en-US
X-Originating-IP: [172.27.12.11]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: Re: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, peng.fan@nxp.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA4LzUvMTkgNDozOCBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENBVVRJT046IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNs
aWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNl
bmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+IAo+IEhpLAo+IAo+IEkgaGF2ZSBD
Q2VkIG9uZSBwZXJzb24gZnJvbSBEb25lcndvcmtzLiBJSVJDIHRoZXkgaGF2ZSBiZWVuIHVzaW5n
IHRoZSBJTVg4IGluCj4gdGhlIHBhc3QuCgpBbWl0LAoKCUhhdmUgeW91IGNoZWNrZWQgb3V0IHRo
ZSBOWFAgWGVuIGZvcms/CgoJaHR0cHM6Ly9zb3VyY2UuY29kZWF1cm9yYS5vcmcvZXh0ZXJuYWwv
aW14L2lteC14ZW4vCgoJV2hpbGUgdGhlIHdvcmsgdGhlcmUgaGFzbid0IGJlZW4gdXBzdHJlYW1l
ZCB5ZXQsIHRoZSBzdXBwb3J0IGZvciB0aGUgaU1YOFFNCihRdWFkTWF4KSBpcyBmYWlybHkgY29t
cGxldGUuICBUaGVyZSBhcmUgc29tZSBpbXBvcnRhbnQgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUK
aU1YOE0gYW5kIHRoYXQgU29DIGJleW9uZCB0aG9zZSB5b3UndmUgbm90ZWQgKG5vIEE3MiBjbHVz
dGVyLCBubyBTTU1VLCBhbmQgbm8KU3lzdGVtIENvbnRyb2wgVW5pdCAoU0NVKSksIGJ1dCBpdCBt
aWdodCBzb2x2ZSBzb21lIG9mIHRoZSBpc3N1ZXMgeW91J3ZlIGJlZW4KcnVubmluZyBpbnRvIG9y
IGF2b2lkIHlldCB1bmtub3duIGlzc3VlcyB3aGVuIHlvdSBhdHRlbXB0IHRvIGJvb3QgYSBndWVz
dCBkb21haW4uCgogICAgIE5hdGUKCj4gCj4gT24gMDMvMDgvMjAxOSAyMTo1NCwgQW1pdCBUb21l
ciB3cm90ZToKPj4+IEkgaGF2ZSBzZWVuIG11bHRpcGxlIHRocmVhZHMgZnJvbSB5b3UgcG9pbnRp
bmcgYXQgaXNzdWVzIG9uIHRoZSBJTVguOC4gSGF2ZSB0aGV5Cj4+PiBiZWVuIHJlc29sdmVkPyBJ
cyB0aGlzIHNlcmllcyBlbm91Z2ggdG8gZ2V0IFhlbiBhbmQgRG9tMCBib290aW5nIG9uIHRoZSBO
WFAKPj4+IHBsYXRmb3JtPwo+Pgo+PiBZZWFoLCBtb3N0IG9mIGlzc3VlcyBhcmUgcmVzb2x2ZWQg
bm93IGFuZCBtYWlubGluZSBEVFMgaXMgdXNlZCB0bwo+PiBicmluZyBYRU4gb24gdGhpcyBpLk1Y
OCBwbGF0Zm9ybS4KPj4KPj4gVGhvdWdoIHRoZXJlIGlzIHNtYWxsIGNoYW5nZSB0aGF0IGNvbW1l
bnQgb3V0IEdQQyAod2hpY2ggaXMgdXNlZCByb290Cj4+IGludGVycnVwdCBwYXJlbnQpIGFuZCBp
bnN0ZWFkIHVzZSBHSUMKPj4gaXMgZG9uZSBpbiBEVFMuCj4gCj4gV2hhdCBhcmUgdGhlIGNvbnNl
cXVlbmNlcyB0byBjaGFuZ2UgdGhlIGludGVycnVwdCBwYXJlbnQ/Cj4gCj4+Cj4+IFRoZSBwYXRj
aGVzIGhhcyBiZWVuIHRlc3RlZCBib290aW5nIERPTTAgd2l0aCByYW1mcy4KPiAKPiBJIGRvbid0
IHRoaW5rIHRoaXMgaXMgZW5vdWdoIHRvIGNsYWltIHN1cHBvcnQgZm9yIFhlbiBvbiB0aGUgSS5N
WDhNIHBsYXRmb3JtLgo+IFdoYXQgSSBkb24ndCB3YW50IHRvIGVuZCB1cCBpcyBoYXZpbmcgeWV0
IGFub3RoZXIgVUFSVCBkcml2ZXIgdG8gbWFpbnRhaW4gaW4gWGVuCj4gYnV0IHRoZSBwbGF0Zm9y
bSBpcyBzdGlsbCB1bnVzYWJsZS4KPiAKPiBZb3Ugc2hvdWxkIGF0IGxlYXN0IGJlIGFibGUgdG8g
Ym9vdCBtdWx0aXBsZSBkb21haW5zIGFuZCB1c2UgYSBmdWxseSBmbGVkZ2UKPiBkaXN0cm8gKHlv
Y3RvLCBEZWJpYW4uLi4pIGZyb20gYSBtYXNzIHN0b3JhZ2UgKGFuZCBwb3NzaWJseSBuZXR3b3Jr
KS4KPiAKPiBDaGVlcnMsCj4gCj4gLS0KPiBKdWxpZW4gR3JhbGwKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCj4gCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
