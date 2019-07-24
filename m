Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE25C73375
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 18:15:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJrg-0000pD-69; Wed, 24 Jul 2019 16:11:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mQw0=VV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqJre-0000p8-M3
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 16:11:38 +0000
X-Inumbo-ID: b6648feb-ae2d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id b6648feb-ae2d-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 16:11:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A637928;
 Wed, 24 Jul 2019 09:11:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50FD43F71F;
 Wed, 24 Jul 2019 09:11:35 -0700 (PDT)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <f2ec25b534e948389926eb21488cb7a0@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fa2a33a6-bc53-29f7-807b-2fa1a17c80f6@arm.com>
Date: Wed, 24 Jul 2019 17:11:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f2ec25b534e948389926eb21488cb7a0@dornerworks.com>
Content-Language: en-US
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
 Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgQW5kcmUpCgpIaSBTdGV3YXJ0LAoKT24gMjQvMDcvMjAxOSAxNTozNCwgU3Rld2FydCBIaWxk
ZWJyYW5kIHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2Fy
dC5oaWxkZWJyYW5kQGRvcm5lcndvcmtzLmNvbT4KPiAKPiAtLS0KPiAKPiB4ZW4vZHJpdmVycy9j
aGFyL25zMTY1NTAuYyB8IDEgKwo+IAo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyBiL3hlbi9kcml2ZXJz
L2NoYXIvbnMxNjU1MC5jCj4gCj4gaW5kZXggZTUxOGYyZDc5MC4uYzhkN2M5YjcxMCAxMDA2NDQK
PiAKPiAtLS0gYS94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+IAo+ICsrKyBiL3hlbi9kcml2
ZXJzL2NoYXIvbnMxNjU1MC5jCj4gCj4gQEAgLTE2MTEsNiArMTYxMSw3IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgZHRfZGV2aWNlX21hdGNoIG5zMTY1NTBfZHRfbWF0Y2hbXSAKPiBfX2luaXRjb25z
dCA9Cj4gCj4gIMKgwqDCoMKgIERUX01BVENIX0NPTVBBVElCTEUoIm5zMTY1NTAiKSwKPiAKPiAg
wqDCoMKgwqAgRFRfTUFUQ0hfQ09NUEFUSUJMRSgibnMxNjU1MGEiKSwKPiAKPiAgwqDCoMKgwqAg
RFRfTUFUQ0hfQ09NUEFUSUJMRSgic25wcyxkdy1hcGItdWFydCIpLAo+IAo+ICvCoMKgwqAgRFRf
TUFUQ0hfQ09NUEFUSUJMRSgiYnJjbSxiY20yODM1LWF1eC11YXJ0IiksCgpBIGRpZmZlcmVudCBj
b21wYXRpYmxlIHVzdWFsbHkgbWVhbnMgdGhlIFVBUlQgYmVoYXZlcyBkaWZmZXJlbnRseS4gU28g
eW91ciAKY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGF0IGxlYXN0IGV4cGxhaW4gd2hhdCBhcmUgdGhl
IGRpZmZlcmVuY2VzIGFuZCB3aHkgdGhpcyBpcyAKbm90IG5lY2Vzc2FyeSBmb3IgWGVuLgoKTG9v
a2luZyBhdCB5b3VyIHJlcG8geGVuLXJwaTQtYnVpbGRlciwgeW91IGFyZSBoYWNraW5nIHRoZSBV
QVJUIERUIG5vZGUuIFRoZSBuZXcgCnByb3BlcnRpZXMgYXJlIG5vdCBwYXJ0IG9mIHRoZSBiaW5k
aW5nIGZvciB0aGF0IGNvbXBhdGlibGUgKHNlZSBbMV0pLgoKV2hpbGUgaXQgaXMgaW5ldml0YWJs
ZSB0byBoYWNrIGRldmljZS10cmVlIGZvciBhIGZpcnN0IHBvcnQsIEkgZG9uJ3Qgd2FudCBYZW4g
dG8gCnJlcXVpcmUgdW5vZmZpY2lhbCBiaW5kaW5nLgoKSW5zdGVhZCwgdGhvc2UgcHJvcGVydHkg
c2hvdWxkIGJlIHNldCBpbiB0aGUgZHJpdmVyIHdoZW4gbWF0Y2hpbmcgCmJyY20sYmNtMjgzNS1h
dXgtdWFydC4KCkNoZWVycywKClsxXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
c2VyaWFsL2JyY20sYmNtMjgzNS1hdXgtdWFydC50eHQKCj4gCj4gIMKgwqDCoMKgIHsgLyogc2Vu
dGluZWwgKi8gfSwKPiAKPiB9Owo+IAo+IC0tIAo+IAo+IDIuMjIuMAo+IAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
