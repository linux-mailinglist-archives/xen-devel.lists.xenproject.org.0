Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEC632D8E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 12:08:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXjrG-00069b-B6; Mon, 03 Jun 2019 10:06:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXjrE-00069W-Vd
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:06:25 +0000
X-Inumbo-ID: 3c38c1ce-85e7-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c38c1ce-85e7-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 10:06:22 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 18:04:07 +0800
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <9df204f9ae2cc9c80a6afde5ea82cb27@sslemail.net>
 <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
 <49547fa1-b1a9-55d8-68b4-d91ef35ce921@mxnavi.com>
 <3c06a4f6-b2f0-1298-b17f-a311fa4e7b67@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <2e9898ab-d413-bdca-ecd4-102929d27ad8@mxnavi.com>
Date: Mon, 3 Jun 2019 18:06:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3c06a4f6-b2f0-1298-b17f-a311fa4e7b67@arm.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: put cpupool's member 'n_dom' after
 'cpupool_id'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMy8xOSAxNzozMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+Cj4gT24gMDMvMDYv
MjAxOSAwMjo0OCwgY2hlbmJhb2Rvbmcgd3JvdGU6Cj4+Cj4+IE9uIDUvMzEvMTkgMTg6NTIsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+IEhpLAo+Pj4KPj4+IE9uIDUvMzEvMTkgNDoxOCBBTSwgQmFv
ZG9uZyBDaGVuIHdyb3RlOgo+Pj4+IFRodXMsIHNpemVvZihzdHJ1Y3QgY3B1cG9vbCkgd2lsbCBz
YXZlIDggYnl0ZXMgZm9yIDY0LWJpdCBzeXN0ZW0uCj4+Pgo+Pj4gSSBhbSBoYXBweSB3aXRoIHRo
ZSBjaGFuZ2UsIGFsdGhvdWdoIEFGQUlLIGNwdXBvb2wgaXMgbm90IAo+Pj4gaW5zdGFudGlhdGVk
IHRoYXQgb2Z0ZW4uIEFyZSB5b3UgcGxhbm5pbmcgdG8gaGF2ZSBtb3JlIGluc3RhbnRpYXRpb24g
Cj4+PiBvZiBpdD8KPj4+Cj4+PiBDaGVlcnMsCj4+Pgo+PiBObywgSSdtIG5vdCBwbGFubmluZyB0
byBjcmVhdGUgbG90cyBvZiBjcHVwb29sIGluc3RhbmNlLgo+Pgo+PiBJJ20gc3R1ZHlpbmcgeGVu
IGZvciBhIGZldyB3ZWVrcyBhbmQgbXkgcGxhbiBpczoKPj4KPj4gcnVuIHhlbiBmb3IgZW1iZWRl
ZCBhdXRvbW90aXZlIHVzZSBjYXNlIHdpdGggZG9tMGxlc3MsIG51bGwgCj4+IHNjaGVkdWxlciwg
c21hbGwgY29kZSBiYXNlIGZvciBzYWZldHkgY2VydGlmaWVkIG1heWJlIGEgcGx1cyhub3Qgc3Vy
ZSAKPj4gd2hldGhlciBjYW4gZG8gdGhpcykuCj4KPiBGV0lXLCB0aGVyZSBhcmUgZGlzY3Vzc2lv
biB0byBnZXQgWGVuIHNhZmV0eSBjZXJ0aWZpZWQuIFRoZXkgYXJlIAo+IGNhcHR1cmVkIG9uIFsx
XS4KPgo+IENoZWVycywKPgo+IFsxXSAKPiBodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lr
aS9DYXRlZ29yeTpTYWZldHlfQ2VydGlmaWNhdGlvbi9GdVNhX1NJRwoKSGVsbG8gSnVsaWVuLCBU
aGFua3MgZm9yIHlvdXIgaW5mby4KCkkgd2lsbCBmb2xsb3cgdGhlIHdpa2kgbGluayBhbmQgc2Vl
IHdoYXQgaSBjYW4gZG8gYWJvdXQgc2FmZXR5IApjZXJ0aWZpY2F0aW9uLgoKPgo+Pgo+Pgo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29t
Pgo+Pj4+IC0tLQo+Pj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMiArLQo+Pj4+
IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUv
eGVuL3NjaGVkLWlmLmgKPj4+PiBpbmRleCA5MmJjN2EwLi5mMGNmMjEwIDEwMDY0NAo+Pj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKPj4+PiBAQCAtMjEzLDkgKzIxMyw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
Y2hlZF9mcmVlX2RvbWRhdGEoY29uc3QgCj4+Pj4gc3RydWN0IHNjaGVkdWxlciAqcywKPj4+PiDC
oCBzdHJ1Y3QgY3B1cG9vbAo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDCoMKgIGludMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNwdXBvb2xfaWQ7Cj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBpbnTCoMKg
wqDCoCBuX2RvbTsKPj4+PiDCoMKgwqDCoMKgIGNwdW1hc2tfdmFyX3TCoMKgwqAgY3B1X3ZhbGlk
O8KgwqDCoMKgwqAgLyogYWxsIGNwdXMgYXNzaWduZWQgdG8gcG9vbCAqLwo+Pj4+IMKgwqDCoMKg
wqAgc3RydWN0IGNwdXBvb2zCoMKgICpuZXh0Owo+Pj4+IC3CoMKgwqAgdW5zaWduZWQgaW50wqDC
oMKgwqAgbl9kb207Cj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3Qgc2NoZWR1bGVyICpzY2hlZDsKPj4+
PiDCoMKgwqDCoMKgIGF0b21pY190wqDCoMKgwqDCoMKgwqDCoCByZWZjbnQ7Cj4+Pj4gwqAgfTsK
Pj4+Pgo+Pj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
