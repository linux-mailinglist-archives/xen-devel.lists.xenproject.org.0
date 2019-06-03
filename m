Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00053263A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 03:52:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXc5f-0001Nm-M8; Mon, 03 Jun 2019 01:48:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXc5e-0001Nh-Fl
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 01:48:46 +0000
X-Inumbo-ID: b52f5b8a-85a1-11e9-8817-dbc4bec93bfc
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b52f5b8a-85a1-11e9-8817-dbc4bec93bfc;
 Mon, 03 Jun 2019 01:48:40 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 09:46:25 +0800
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <9df204f9ae2cc9c80a6afde5ea82cb27@sslemail.net>
 <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <49547fa1-b1a9-55d8-68b4-d91ef35ce921@mxnavi.com>
Date: Mon, 3 Jun 2019 09:48:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f3dbafae-4865-5233-3c8f-ede397c5f293@arm.com>
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

Ck9uIDUvMzEvMTkgMTg6NTIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPgo+IE9uIDUvMzEv
MTkgNDoxOCBBTSwgQmFvZG9uZyBDaGVuIHdyb3RlOgo+PiBUaHVzLCBzaXplb2Yoc3RydWN0IGNw
dXBvb2wpIHdpbGwgc2F2ZSA4IGJ5dGVzIGZvciA2NC1iaXQgc3lzdGVtLgo+Cj4gSSBhbSBoYXBw
eSB3aXRoIHRoZSBjaGFuZ2UsIGFsdGhvdWdoIEFGQUlLIGNwdXBvb2wgaXMgbm90IGluc3RhbnRp
YXRlZCAKPiB0aGF0IG9mdGVuLiBBcmUgeW91IHBsYW5uaW5nIHRvIGhhdmUgbW9yZSBpbnN0YW50
aWF0aW9uIG9mIGl0Pwo+Cj4gQ2hlZXJzLAo+Ck5vLCBJJ20gbm90IHBsYW5uaW5nIHRvIGNyZWF0
ZSBsb3RzIG9mIGNwdXBvb2wgaW5zdGFuY2UuCgpJJ20gc3R1ZHlpbmcgeGVuIGZvciBhIGZldyB3
ZWVrcyBhbmQgbXkgcGxhbiBpczoKCnJ1biB4ZW4gZm9yIGVtYmVkZWQgYXV0b21vdGl2ZSB1c2Ug
Y2FzZSB3aXRoIGRvbTBsZXNzLCBudWxsIHNjaGVkdWxlciwgCnNtYWxsIGNvZGUgYmFzZSBmb3Ig
c2FmZXR5IGNlcnRpZmllZCBtYXliZSBhIHBsdXMobm90IHN1cmUgd2hldGhlciBjYW4gCmRvIHRo
aXMpLgoKCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJhb2RvbmcgQ2hlbiA8Y2hlbmJhb2RvbmdAbXhu
YXZpLmNvbT4KPj4gLS0tCj4+IMKgIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMiArLQo+
PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLWlmLmgKPj4gaW5kZXggOTJiYzdhMC4uZjBjZjIxMCAxMDA2NDQKPj4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3NjaGVkLWlmLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLWlm
LmgKPj4gQEAgLTIxMyw5ICsyMTMsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfZnJlZV9k
b21kYXRhKGNvbnN0IAo+PiBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAo+PiDCoCBzdHJ1Y3QgY3B1cG9v
bAo+PiDCoCB7Cj4+IMKgwqDCoMKgwqAgaW50wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3B1
cG9vbF9pZDsKPj4gK8KgwqDCoCB1bnNpZ25lZCBpbnTCoMKgwqDCoCBuX2RvbTsKPj4gwqDCoMKg
wqDCoCBjcHVtYXNrX3Zhcl90wqDCoMKgIGNwdV92YWxpZDvCoMKgwqDCoMKgIC8qIGFsbCBjcHVz
IGFzc2lnbmVkIHRvIHBvb2wgKi8KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgY3B1cG9vbMKgwqAgKm5l
eHQ7Cj4+IC3CoMKgwqAgdW5zaWduZWQgaW50wqDCoMKgwqAgbl9kb207Cj4+IMKgwqDCoMKgwqAg
c3RydWN0IHNjaGVkdWxlciAqc2NoZWQ7Cj4+IMKgwqDCoMKgwqAgYXRvbWljX3TCoMKgwqDCoMKg
wqDCoMKgIHJlZmNudDsKPj4gwqAgfTsKPj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
