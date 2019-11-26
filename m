Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693D1109A5F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 09:44:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZWQF-0008WG-FB; Tue, 26 Nov 2019 08:42:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZWQD-0008WB-S9
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 08:42:09 +0000
X-Inumbo-ID: a19909d8-1028-11ea-a39c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a19909d8-1028-11ea-a39c-12813bfff9fa;
 Tue, 26 Nov 2019 08:42:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E602ADFE;
 Tue, 26 Nov 2019 08:42:08 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1574715937-13565-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <abdc01eb-de2a-c7ff-3803-e7dfd6c022d4@suse.com>
Date: Tue, 26 Nov 2019 09:42:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1574715937-13565-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] AMD/IOMMU: honour IR setting while
 pre-filling DTEs
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
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAyMjowNSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMKPiBAQCAtMTI3OSw3ICsxMjc5LDcgQEAgc3RhdGlj
IGludCBfX2luaXQgYW1kX2lvbW11X3NldHVwX2RldmljZV90YWJsZSgKPiAgICAgICAgICBmb3Ig
KCBiZGYgPSAwLCBzaXplIC89IHNpemVvZigqZHQpOyBiZGYgPCBzaXplOyArK2JkZiApCj4gICAg
ICAgICAgICAgIGR0W2JkZl0gPSAoc3RydWN0IGFtZF9pb21tdV9kdGUpewo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC52ID0gdHJ1ZSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAu
aXYgPSB0cnVlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIC5pdiA9IGlvbW11X2ludHJl
bWFwLAoKVGhpcyB3YXMgdmVyeSBpbnRlbnRpb25hbGx5ICJ0cnVlIiwgYW5kIGlnbm9yaW5nICJp
b21tdV9pbnRyZW1hcCI6CldlJ3JlIF9wcmVfLWZpbGxpbmcgRFRFcyBoZXJlLiBUaGVpciBhY3R1
YWwgdmFsdWVzIHdpbGwgYmUKZXN0YWJsaXNoZWQgYnkgdGhlIGxvb3AgZnVydGhlciBkb3duIGlu
IHRoZSBmdW5jdGlvbiwgYW5kIGp1c3QKZm9yIHRob3NlIGRldmljZXMgdGhhdCBhY3R1YWxseSBl
eGlzdC4gQnkgdW5pbGF0ZXJhbGx5IHNldHRpbmcgSVYKaGVyZSB3ZSBtYWtlIHN1cmUgdGhhdCBh
bGwgaW50ZXJydXB0IHJlcXVlc3RzIGZyb20gZGV2aWNlcyB3ZQpkb24ndCByZWNvZ25pemUgZ2V0
IGJsb2NrZWQgcmF0aGVyIHRoYW4gYWxsb3dlZCB0aHJvdWdoIGluIGFuCnVuLXJlbWFwcGVkIGZh
c2hpb24uCgpUaGUgcXVlc3Rpb24gY29udGludWVzIHRvIGJlIHdoaWNoIHNwZWNpZmljIERURSB0
aGUgbG9vcCBiZWxvdwptYXkgd3JvbmdseSBsZWF2ZSB1bnRvdWNoZWQuIEV2ZW4gaWYgdGhlIHRo
ZSBJREUgZGV2aWNlIG9mIHRoZQpjaGlwc2V0IGhhcyBubyBNU0kvTVNJLVgsIGFtZF9pb21tdV9z
ZXRfaW50cmVtYXBfdGFibGUoKSBhdAp0aGUgYm90dG9tIG9mIHRoZSBsb29wIHNob3VsZCBzdGls
bCBnZXQgaW52b2tlZCwgYW5kIGhlbmNlIElWCnNob3VsZCBzdGlsbCBnZXQgc2V0IHRvIGZhbHNl
IHRoZXJlIHdoZW4gIWlvbW11X2ludHJlbWFwLiBUaGVyZSdzCmZ1cnRoZXIgaW52ZXN0aWdhdGlv
biBuZWNlc3NhcnksIEknbSBhZnJhaWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
