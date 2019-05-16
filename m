Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6642200C8
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 10:00:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRBGG-0006ZZ-6s; Thu, 16 May 2019 07:57:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJgO=TQ=huawei.com=wencongyang2@srs-us1.protection.inumbo.net>)
 id 1hRBGE-0006ZJ-6t
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 07:57:06 +0000
X-Inumbo-ID: 2e593e90-77b0-11e9-9e67-2b394166e810
Received: from huawei.com (unknown [45.249.212.191])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e593e90-77b0-11e9-9e67-2b394166e810;
 Thu, 16 May 2019 07:57:00 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 74E4FBD2C53EEB637EF6;
 Thu, 16 May 2019 15:56:57 +0800 (CST)
Received: from [127.0.0.1] (10.177.249.165) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 16 May 2019 15:56:46 +0800
To: Andrew Cooper <andrew.cooper3@citrix.com>, <xen-devel@lists.xenproject.org>
References: <6bca3b07-c2aa-124f-e77e-59d5eb7bbd5c@huawei.com>
 <5cdbd5ec-3ee9-04ff-5ce8-73c542b8b752@citrix.com>
From: "wencongyang (A)" <wencongyang2@huawei.com>
Message-ID: <e30d844e-72e6-8ec5-354c-e61ef5c82093@huawei.com>
Date: Thu, 16 May 2019 15:56:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <5cdbd5ec-3ee9-04ff-5ce8-73c542b8b752@citrix.com>
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

CgpPbiAyMDE5LzUvMTYgMTU6MzgsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTYvMDUvMjAx
OSAwMzo0Niwgd2VuY29uZ3lhbmcgKEEpIHdyb3RlOgo+PiBIaSBhbGwKPj4KPj4gRmlsbCBidWZm
ZXJzLCBsb2FkIHBvcnRzIGFyZSBzaGFyZWQgYmV0d2VlbiB0aHJlYWRzIG9uIHRoZSBzYW1lIHBo
eXNpY2FsIGNvcmUuCj4+IFdlIG5lZWQgdG8gcnVuIG1vcmUgdGhhbiBvbmUgdm0gb24gdGhlIHNh
bWUgcGh5c2ljYWwgY29yZS4KPj4gSXMgdGhlcmUgYW55IGNvbXBsZXRlIG1pdGlnYXRpb24gZm9y
IGVudmlyb25tZW50cyB1dGlsaXppbmcgU01UPwo+IAo+IE5vIC0gbm90IHJlYWxseS4KPiAKPiBB
biBhcHByb2FjaCB3aGljaCB3YXMgd29ya2VkIG9uIHdhcyB0aGF0IG9mIHN5bmNocm9uaXNlZCBz
Y2hlZHVsaW5nLAo+IHdoZXJlYnkgcHJpdmlsZWdlIHRyYW5zaXRpb25zIGFyZSBzeW5jcmhvbmlz
ZWQgdG8gZW5zdXJlIHRoYXQgd2UncmUKPiBuZXZlciBydW5uaW5nIGNvZGUgZnJvbSBkaWZmZXJl
bnQgcHJpdmlsZWdlIGxldmVscyBjb25jdXJyZW50bHkgb24KPiBhZGphY2VudCB0aHJlYWRzLiAg
KFRoaXMgaXMgdGhlIG1pdGlnYXRpb24gZGVzY3JpYmVkIGFzIEdyb3VwIFNjaGVkdWxpbmcKPiBp
bgo+IGh0dHBzOi8vc29mdHdhcmUuaW50ZWwuY29tL3NlY3VyaXR5LXNvZnR3YXJlLWd1aWRhbmNl
L2luc2lnaHRzL2RlZXAtZGl2ZS1pbnRlbC1hbmFseXNpcy1taWNyb2FyY2hpdGVjdHVyYWwtZGF0
YS1zYW1wbGluZwo+ICkKCnN5bmNocm9uaXNlZCBzY2hlZHVsaW5nIGlzIG5vdCBhIGNvbXBsZXRl
IG1pdGlnYXRpb24uIEd1ZXN0IEEgYW5kIEd1ZXN0IEIKcnVuIG9uIHRoZSBzYW1lIHBoeXNpY2Fs
IGNvcmUsIGFuZCB0aGUgcHJpdmlsZWdlIGxldmVsIGlzIHRoZSBzYW1lLiBTbwpHdWVzdCBBIGNh
biBpbmZlciBkYXRhIGZyb20gR3Vlc3QgQi4gR3Vlc3QgQSBjYW5ub3QgaW5mZXIgZGF0YSBmcm9t
IGh5cGVydmlzb3IKYmVjYXVzZSB0aGV5IGFyZSBpbiBkaWZmZXJlbnQgcHJpdmlsZWdlIGxldmVs
cy4KClRoYW5zawpXZW4gQ29uZ3lhbmcKCj4gCj4gSG93ZXZlci4uLgo+IAo+IEZpcnN0IG9mIGFs
bCwgaXQgZGVwZW5kcyBvbiBjb3JlIHNjaGVkdWxpbmcgYXMgYSBwcmVyZXF1aXNpdGUsIGFuZCBh
cwo+IHlvdSBjYW4gc2VlLCB0aGF0IGlzIHN0aWxsIGEgd29yay1pbi1wcm9ncmVzcyBmb3IgWGVu
LiAgVGhlcmUgYXJlIG1hbnkKPiBvdGhlciBnb29kIHJlYXNvbnMgZm9yIGRvaW5nIGNvcmUgc2No
ZWR1bGluZywgc28gd2Ugd2lsbCBiZSBjb250aW51aW5nCj4gd2l0aCB0aGF0IHdvcmsuCj4gCj4g
Rm9yIHBhcnRuZXJzIHdobyBhbHJlYWR5IGhhZCBjb3JlIHNjaGVkdWxpbmcgYW5kIGV4cGVyaW1l
bnRlZCB3aXRoCj4gc3luY2hyb25pc2VkIHNjaGVkdWxpbmcsIG5vLW9uZSBmb3VuZCBhIHdheSBv
ZiBtYWtpbmcgaXQgZnVuY3Rpb24gd2l0aAo+IGxlc3Mgb3ZlcmhlYWQgdGhhbiBkaXNhYmxpbmcg
aHlwZXJ0aHJlYWRpbmcgaW4gdGhlIGZpcnN0IHBsYWNlLiAgVGhpcwo+IHdhcyB3YXMgYSBuYXRp
dmUgT1MgY2FzZSAtIHRoZSB2aXJ0dWFsaXNlZCBjYXNlIGdldHMgYSBjb21wb3VuZAo+IHBlcmZv
cm1hbmNlIGhpdCBiZWNhdXNlIGV2ZXJ5IHRpbWUgdGhlIGd1ZXN0IGtlcm5lbCB0cmllcyB0bwo+
IHN5bmNocm9uaXNlLCBpdCBmb3JjZXMgWGVuIHRvIHN5bmNocm9uaXNlLCBiZWNhdXNlIHRoZXJl
IGlzIG5vCj4gdmlydHVhbGlzYXRpb24gb2YgSVBJcyBhdmFpbGFibGUgaW4gYWZmZWN0ZWQgaGFy
ZHdhcmUuCj4gCj4gCj4gT3ZlcmFsbCwgaXQgbG9va3MgbGlrZSB0aGUgb25lIG1pdGlnYXRpb24g
b3B0aW9uIHdoaWNoIHdvdWxkIGFsbG93Cj4gaHlwZXJ0aHJlYWRpbmcgdG8gcmVtYWluIGFjdGl2
ZSBoYWQgYSBsYXJnZXIgcGVyZm9ybWFuY2UgcGVuYWx0eSB0aGFuCj4gZGlzYWJsaW5nIGh5cGVy
dGhyZWFkaW5nIChvbiBuYXRpdmUsIGFuZCByZW1lbWJlciB0aGF0IGl0IGlzIGNvbXBvdW5kZWQK
PiB3aGVuIHZpcnR1YWxpc2VkKSwgYW5kIGlzIGEgdmVyeSBpbnZhc2l2ZSBjaGFuZ2UgdG8gdGhl
IGVudHJ5L2V4aXQgY29kZS4KPiAKPiBVbmxlc3Mgc29tZW9uZSBmaW5kcyBhIHJlYWxseSBjbGV2
ZXIgYWx0ZXJuYXRpdmUgcGxhbiwgdGhlcmUgZG9lc24ndAo+IGFwcGVhciB0byBiZSBhIHZpYWJs
ZSBhbHRlcm5hdGl2ZSB0byB0dXJuaW5nIG9mZiBoeXBlcnRocmVhZGluZyB3aGVuCj4gY3Jvc3Mt
dGhyZWFkIGxlYWthZ2UgaXMgYSBjb25jZXJuLgo+IAo+IH5BbmRyZXcKPiAKPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
