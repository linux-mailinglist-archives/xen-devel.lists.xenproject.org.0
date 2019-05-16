Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B8F2059B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:51:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREs6-0004Ae-JT; Thu, 16 May 2019 11:48:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJgO=TQ=huawei.com=wencongyang2@srs-us1.protection.inumbo.net>)
 id 1hREs5-0004AZ-Bc
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:48:25 +0000
X-Inumbo-ID: 8209c4d6-77d0-11e9-8980-bc764e045a96
Received: from huawei.com (unknown [45.249.212.190])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8209c4d6-77d0-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:48:24 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id F0FDCF1F6A5A233EB7C0;
 Thu, 16 May 2019 19:48:21 +0800 (CST)
Received: from [127.0.0.1] (10.177.249.165) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 16 May 2019 19:48:13 +0800
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <6bca3b07-c2aa-124f-e77e-59d5eb7bbd5c@huawei.com>
 <5cdbd5ec-3ee9-04ff-5ce8-73c542b8b752@citrix.com>
 <e30d844e-72e6-8ec5-354c-e61ef5c82093@huawei.com>
 <67885e5e-d67c-8067-eded-69290429714b@citrix.com>
From: "wencongyang (A)" <wencongyang2@huawei.com>
Message-ID: <cdd37ad5-d54f-6f52-bbb6-49ef7a7ace21@huawei.com>
Date: Thu, 16 May 2019 19:48:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <67885e5e-d67c-8067-eded-69290429714b@citrix.com>
X-Originating-IP: [10.177.249.165]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] Question about MDS mitigation
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
Cc: gaowanlong <gaowanlong@huawei.com>,
 "Liujinsong \(Paul\)" <liu.jinsong@huawei.com>, maoming.maoming@huawei.com,
 Huangzhichao <huangzhichao@huawei.com>, "Chentao
 \(Boby\)" <boby.chen@huawei.com>, guijianfeng <guijianfeng@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMDE5LzUvMTYgMTU6NTgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTYvMDUvMjAx
OSAwODo1Niwgd2VuY29uZ3lhbmcgKEEpIHdyb3RlOgo+Pgo+PiBPbiAyMDE5LzUvMTYgMTU6Mzgs
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+PiBPbiAxNi8wNS8yMDE5IDAzOjQ2LCB3ZW5jb25neWFu
ZyAoQSkgd3JvdGU6Cj4+Pj4gSGkgYWxsCj4+Pj4KPj4+PiBGaWxsIGJ1ZmZlcnMsIGxvYWQgcG9y
dHMgYXJlIHNoYXJlZCBiZXR3ZWVuIHRocmVhZHMgb24gdGhlIHNhbWUgcGh5c2ljYWwgY29yZS4K
Pj4+PiBXZSBuZWVkIHRvIHJ1biBtb3JlIHRoYW4gb25lIHZtIG9uIHRoZSBzYW1lIHBoeXNpY2Fs
IGNvcmUuCj4+Pj4gSXMgdGhlcmUgYW55IGNvbXBsZXRlIG1pdGlnYXRpb24gZm9yIGVudmlyb25t
ZW50cyB1dGlsaXppbmcgU01UPwo+Pj4gTm8gLSBub3QgcmVhbGx5Lgo+Pj4KPj4+IEFuIGFwcHJv
YWNoIHdoaWNoIHdhcyB3b3JrZWQgb24gd2FzIHRoYXQgb2Ygc3luY2hyb25pc2VkIHNjaGVkdWxp
bmcsCj4+PiB3aGVyZWJ5IHByaXZpbGVnZSB0cmFuc2l0aW9ucyBhcmUgc3luY3Job25pc2VkIHRv
IGVuc3VyZSB0aGF0IHdlJ3JlCj4+PiBuZXZlciBydW5uaW5nIGNvZGUgZnJvbSBkaWZmZXJlbnQg
cHJpdmlsZWdlIGxldmVscyBjb25jdXJyZW50bHkgb24KPj4+IGFkamFjZW50IHRocmVhZHMuICAo
VGhpcyBpcyB0aGUgbWl0aWdhdGlvbiBkZXNjcmliZWQgYXMgR3JvdXAgU2NoZWR1bGluZwo+Pj4g
aW4KPj4+IGh0dHBzOi8vc29mdHdhcmUuaW50ZWwuY29tL3NlY3VyaXR5LXNvZnR3YXJlLWd1aWRh
bmNlL2luc2lnaHRzL2RlZXAtZGl2ZS1pbnRlbC1hbmFseXNpcy1taWNyb2FyY2hpdGVjdHVyYWwt
ZGF0YS1zYW1wbGluZwo+Pj4gKQo+PiBzeW5jaHJvbmlzZWQgc2NoZWR1bGluZyBpcyBub3QgYSBj
b21wbGV0ZSBtaXRpZ2F0aW9uLiBHdWVzdCBBIGFuZCBHdWVzdCBCCj4+IHJ1biBvbiB0aGUgc2Ft
ZSBwaHlzaWNhbCBjb3JlLCBhbmQgdGhlIHByaXZpbGVnZSBsZXZlbCBpcyB0aGUgc2FtZS4gU28K
Pj4gR3Vlc3QgQSBjYW4gaW5mZXIgZGF0YSBmcm9tIEd1ZXN0IEIuIEd1ZXN0IEEgY2Fubm90IGlu
ZmVyIGRhdGEgZnJvbSBoeXBlcnZpc29yCj4+IGJlY2F1c2UgdGhleSBhcmUgaW4gZGlmZmVyZW50
IHByaXZpbGVnZSBsZXZlbHMuCj4gCj4gVGhpcyBpcyAob25lIG9mIHRoZSByZWFzb25zKSB3aHkg
Y29yZSBzY2hlZHVsaW5nIGlzIGEgcHJlcmVxdWlzaXRlIHRvCj4gc3luY2hyb25pc2VkIHNjaGVk
dWxpbmcuCj4gCj4gV2l0aCBjb3JlIHNjaGVkdWxpbmcgYWN0aXZlLCB5b3Ugd2lsbCBuZXZlciBo
YXZlIGd1ZXN0IEEgYW5kIEIKPiBjb25jdXJyZW50bHkgcnVubmluZyBvbiBhZGphY2VudCB0aHJl
YWRzIG9mIHRoZSBzYW1lIGNvcmUuCgpBbm90aGVyIHF1ZXN0aW9uOgpUaGVyZSBhcmUgYSBDUFVJ
RCBiaXQoVFNYX0ZPUkNFX0FCT1JUKSBhbmQgTVNSKE1TUl9UU1hfRk9SQ0VfQUJPUlQpIGluIHhz
YTI5Ny94c2EyOTctNC43LTEucGF0Y2guCkJ1dCB3ZSBkbyBub3QgZmluZCB0aGVtIGluIHRoZSBw
YXRjaHMgb2Yga3ZtLgoKSUlVQywgdGhpcyBNU1IgaXMgbm90IGZvciBNRFMgbWl0aWdhdGlvbi4g
SXMgdGhpcyByaWdodD8KClRoYW5rcwpXZW4gQ29uZ3lhbmcKCj4gCj4gfkFuZHJldwo+IAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
