Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B599D3AC9D
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 03:07:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ha8gq-0008Lv-8w; Mon, 10 Jun 2019 01:01:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y1/0=UJ=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1ha8gp-0007xt-31
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 01:01:35 +0000
X-Inumbo-ID: 472bd896-8b1b-11e9-ad99-131a9a7982af
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 472bd896-8b1b-11e9-ad99-131a9a7982af;
 Mon, 10 Jun 2019 01:01:30 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 10 Jun
 2019 08:57:58 +0800
To: George Dunlap <George.Dunlap@citrix.com>
References: <8d9990d4a71c6ba858689ce2e119a96d@sslemail.net>
 <516B653D-D319-4335-A428-5AD6F9D12750@citrix.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <01a46a67-42ef-961c-54c6-a4ef6e85e1e5@mxnavi.com>
Date: Mon, 10 Jun 2019 09:00:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <516B653D-D319-4335-A428-5AD6F9D12750@citrix.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH v3] xen: make tracebuffer configurable
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvNS8xOSAxODozOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPgo+PiBPbiBKdW4gNSwgMjAx
OSwgYXQgMjoyNyBBTSwgQmFvZG9uZyBDaGVuIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90
ZToKPj4KPj4gWGVuIGludGVybmFsIHJ1bm5pbmcgc3RhdHVzKHRyYWNlIGV2ZW50KSB3aWxsIGJl
IHNhdmVkIHRvCj4+IHRyYWNlIG1lbW9yeSB3aGVuIGVuYWJsZWQuIHRyYWNlIGV2ZW50IGRhdGEg
YW5kIGNvbmZpZyBwYXJhbXMgY2FuIGJlCj4+IHJlYWQvY2hhbmdlZCBieSBzeXN0ZW0gY29udHJv
bCBoeXBlcmNhbGwgYXQgcnVuIHRpbWUuCj4+Cj4+IENhbiBiZSBkaXNhYmxlZCBmb3Igc21hbGxl
ciBjb2RlIGZvb3RwcmludC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQmFvZG9uZyBDaGVuIDxjaGVu
YmFvZG9uZ0BteG5hdmkuY29tPgo+PiAtLS0KPj4geGVuL2NvbW1vbi9LY29uZmlnICAgICAgfCAg
OSArKysrKysrKysKPj4geGVuL2NvbW1vbi9NYWtlZmlsZSAgICAgfCAgMiArLQo+PiB4ZW4vaW5j
bHVkZS94ZW4vdHJhY2UuaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4+IDMgZmls
ZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnCj4+IGluZGV4IGM4
Mzg1MDYuLmQ5MDhmZTEgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZwo+PiArKysg
Yi94ZW4vY29tbW9uL0tjb25maWcKPj4gQEAgLTM2OCw0ICszNjgsMTMgQEAgY29uZmlnIERPTTBf
TUVNCj4+Cj4+IAkgIExlYXZlIGVtcHR5IGlmIHlvdSBhcmUgbm90IHN1cmUgd2hhdCB0byBzcGVj
aWZ5Lgo+Pgo+PiArY29uZmlnIFRSQUNFQlVGRkVSCj4+ICsJYm9vbCAiRW5hYmxlIHRyYWNpbmcg
aW5mcmFzdHJ1Y3R1cmUiICBpZiBFWFBFUlQgPSAieSIKPj4gKwlkZWZhdWx0IHkKPj4gKwktLS1o
ZWxwLS0tCj4+ICsJICBFbmFibGUgaW4gdHJhY2luZyBpbmZyYXN0cnVjdHVyZSBhbmQgcHJlLWRl
ZmluZWQgdHJhY2Vwb2ludHMgd2l0aGluIFhlbi4KPiBTb3JyeSwgYW4gZWRpdGluZyBtaXN0YWtl
IGNhdXNlZCBtZSB0byBpbmNsdWRlIGEgc3RyYXkg4oCYaW7igJkgaW4gdGhpcyBzZW50ZW5jZSB3
aGVuIEkgc3VnZ2VzdGVkIHRoaXMgdGV4dC4gOi0pCj4KPiBUaGlzIGNvdWxkIGJlIHJlbW92ZWQg
b24gY2hlY2staW4uICBXaXRoIHRoYXQgZml4ZWQsIHRoZSBjb21taXQgbWVzc2FnZSBsb29rcyBP
SyB0byBtZS4KCkhlbGxvIEdlb3JnZSwKCnNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4KCkZpeGVk
IGFjY29yZGluZyB0byB5b3VyIGNvbW1lbnRzIGluIHY0LgoKPiAgIC1HZW9yZ2UKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
