Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E52E7337A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 18:16:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJuA-0000uj-Kd; Wed, 24 Jul 2019 16:14:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uJlF=VV=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hqJu9-0000ud-ER
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 16:14:13 +0000
X-Inumbo-ID: 12f58565-ae2e-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 12f58565-ae2e-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 16:14:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0A9628;
 Wed, 24 Jul 2019 09:14:11 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B6813F71F;
 Wed, 24 Jul 2019 09:14:10 -0700 (PDT)
Date: Wed, 24 Jul 2019 17:14:08 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>
Message-ID: <20190724171408.01d5abc4@donnerap.cambridge.arm.com>
In-Reply-To: <f2ec25b534e948389926eb21488cb7a0@dornerworks.com>
References: <f2ec25b534e948389926eb21488cb7a0@dornerworks.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/2] ns16550: Add compatible string for
 Raspberry Pi 4
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNCBKdWwgMjAxOSAxNDozNDo1NSArMDAwMApTdGV3YXJ0IEhpbGRlYnJhbmQgPFN0
ZXdhcnQuSGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+IHdyb3RlOgoKSGksCgpJIGFtIGFmcmFp
ZCB0aGlzIGlzIG5vdCBlbm91Z2guIEluIHlvdXIgcmVwbyB5b3UgaGFjayB0aGUgRFQgdG8gY29u
dGFpbgp0aGUgcmVnLXNoaWZ0IGFuZCBpby13aWR0aCBwcm9wZXJ0aWVzLCBidXQgdGhvc2UgYXJl
IG5vdCBwYXJ0IG9mIHRoZQoiYnJjbSxiY20yODM1LWF1eC11YXJ0IiBiaW5kaW5nLiBVc2luZyAz
Mi1iaXQgYWNjZXNzZXMgaXMgYW4gaW50ZWdyYWwKcHJvcGVydHkgb2YgdGhpcyBVQVJULCBhbmQg
c2luY2UgaXQgaXMgb25seSAqc29tZXdoYXQqIGNvbXBhdGlibGUgdG8gYW4KODI1MCBvciBEVyBV
QVJULCBpdCBjYW5ub3QgdXNlIHRoYXQgYmluZGluZy4gU28gSSBoYWQgdGhlIGZvbGxvd2luZwph
ZGRpdGlvbmFsIGh1bmsgaW46CgpAQCAtMTU3Miw2ICsxNTcyLDEyIEBAIHN0YXRpYyBpbnQgX19p
bml0IG5zMTY1NTBfdWFydF9kdF9pbml0KHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LAogICAg
IGlmICggdWFydC0+cmVnX3dpZHRoICE9IDEgJiYgdWFydC0+cmVnX3dpZHRoICE9IDQgKQogICAg
ICAgICByZXR1cm4gLUVJTlZBTDsKIAorICAgIGlmICggZHRfZGV2aWNlX2lzX2NvbXBhdGlibGUo
ZGV2LCAiYnJjbSxiY20yODM1LWF1eC11YXJ0IikgKQorICAgIHsKKyAgICAgICAgdWFydC0+cmVn
X3dpZHRoID0gNDsKKyAgICAgICAgdWFydC0+cmVnX3NoaWZ0ID0gMjsKKyAgICB9CisKICAgICBy
ZXMgPSBwbGF0Zm9ybV9nZXRfaXJxKGRldiwgMCk7CiAgICAgaWYgKCAhIHJlcyApCiAgICAgICAg
IHJldHVybiAtRUlOVkFMOwoKRmVlbCBmcmVlIHRvIHVzZSB0aGF0IHNuaXBwZXQsIHRoYXQgc2hv
dWxkIHdvcmsgd2l0aCB0aGUgbm9ybWFsIERULgoKQ2hlZXJzLApBbmRyZS4KCj4gU2lnbmVkLW9m
Zi1ieTogU3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3Mu
Y29tPgo+IC0tLQo+IHhlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jIHwgMSArCj4gMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL2NoYXIv
bnMxNjU1MC5jIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBpbmRleCBlNTE4ZjJkNzkw
Li5jOGQ3YzliNzEwIDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCj4g
KysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBAQCAtMTYxMSw2ICsxNjExLDcgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggbnMxNjU1MF9kdF9tYXRjaFtdIF9f
aW5pdGNvbnN0ID0KPiAgICAgIERUX01BVENIX0NPTVBBVElCTEUoIm5zMTY1NTAiKSwKPiAgICAg
IERUX01BVENIX0NPTVBBVElCTEUoIm5zMTY1NTBhIiksCj4gICAgICBEVF9NQVRDSF9DT01QQVRJ
QkxFKCJzbnBzLGR3LWFwYi11YXJ0IiksCj4gKyAgICBEVF9NQVRDSF9DT01QQVRJQkxFKCJicmNt
LGJjbTI4MzUtYXV4LXVhcnQiKSwKPiAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKPiB9Owo+IC0t
Cj4gMi4yMi4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
