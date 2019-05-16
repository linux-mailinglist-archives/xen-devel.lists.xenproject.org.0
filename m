Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8E7200E7
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 10:07:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRBN4-00085s-3o; Thu, 16 May 2019 08:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJgO=TQ=huawei.com=wencongyang2@srs-us1.protection.inumbo.net>)
 id 1hRBN1-00085n-Ta
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:04:07 +0000
X-Inumbo-ID: 29d4fb92-77b1-11e9-8f92-77a4a8654d0b
Received: from huawei.com (unknown [45.249.212.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29d4fb92-77b1-11e9-8f92-77a4a8654d0b;
 Thu, 16 May 2019 08:04:03 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id EACE3FFD70D32FB5D0BE;
 Thu, 16 May 2019 16:03:58 +0800 (CST)
Received: from [127.0.0.1] (10.177.249.165) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 16 May 2019 16:03:52 +0800
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <6bca3b07-c2aa-124f-e77e-59d5eb7bbd5c@huawei.com>
 <5cdbd5ec-3ee9-04ff-5ce8-73c542b8b752@citrix.com>
 <e30d844e-72e6-8ec5-354c-e61ef5c82093@huawei.com>
 <67885e5e-d67c-8067-eded-69290429714b@citrix.com>
From: "wencongyang (A)" <wencongyang2@huawei.com>
Message-ID: <e81d2bfb-869b-e8c6-5cc7-7d616307bf6b@huawei.com>
Date: Thu, 16 May 2019 16:03:43 +0800
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
 "Liujinsong \(Paul\)" <liu.jinsong@huawei.com>,
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
YWRzIG9mIHRoZSBzYW1lIGNvcmUuCgpUaGFua3MgZm9yIHlvdSBleHBsYW5hdGlvbi4gSSBnb3Qg
aXQuCgpXZW4gQ29uZ3lhbmcKCj4gCj4gfkFuZHJldwo+IAo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
