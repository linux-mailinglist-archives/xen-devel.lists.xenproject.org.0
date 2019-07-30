Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F237A3C4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOC6-0005mU-Tb; Tue, 30 Jul 2019 09:13:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsOC4-0005mN-TU
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:13:16 +0000
X-Inumbo-ID: 4321fdc5-b2aa-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4321fdc5-b2aa-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:13:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E446999C48;
 Tue, 30 Jul 2019 09:13:14 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 864AA60BE5;
 Tue, 30 Jul 2019 09:13:13 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-3-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <7562c32f-0af8-d177-ac3e-1ddd8d063726@redhat.com>
Date: Tue, 30 Jul 2019 11:13:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-3-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 30 Jul 2019 09:13:15 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 02/35] OvmfPkg: Create
 platform OvmfXen
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE92bWZYZW4gaXMgYSBj
b3B5IG9mIE92bWZYNjQsIHJlbW92aW5nIFZpcnRJTyBhbmQgc29tZSBTTU0uCj4gCj4gVGhpcyBu
ZXcgcGxhdGZvcm0gd2lsbCBiZSBjaGFuZ2VkIHRvIG1ha2UgaXQgd29ya3Mgb24gdHdvIHR5cGVz
IG9mIFhlbgo+IGd1ZXN0OiBIVk0gYW5kIFBWSC4KPiAKPiBDb21wYXJlIHRvIE92bWZYNjQsIHRo
aXMgcGF0Y2g6Cj4gCj4gLSBjaGFuZ2VkOiBQTEFURk9STV9HVUlELCBPVVRQVVRfRElSRUNUT1JZ
LCBGTEFTSF9ERUZJTklUSU9OCj4gLSByZW1vdmVkOiBWaXJ0aW9MaWIgY2xhc3MgcmVzb2x1dGlv
bgo+IC0gcmVtb3ZlZDogYWxsIFVFRklfRFJJVkVSIG1vZHVsZXMgZm9yIHZpcnRpbyBkZXZpY2Vz
Cj4gLSByZW1vdmVkOiBEWEVfU01NX0RSSVZFUiBhbmQgU01NX0NPUkUgbGliIGNsYXNzIHJlc29s
dXRpb25zCj4gLSByZW1vdmVkOiBEWEVfU01NX0RSSVZFUiBhbmQgU01NX0NPUkUgRkRGIHJ1bGVz
Cj4gLSByZW1vdmVkOiBFdmVyeXRoaW5nIHJlbGF0ZWQgdG8gU01NX1JFUVVJUkU9PXRydWUKPiAt
IHJlbW92ZWQ6IEV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBTRUNVUkVfQk9PVF9FTkFCTEU9PXRydWUK
PiAtIHJlbW92ZWQ6IEV2ZXJ5dGhpbmcgcmVsYXRlZCB0byBUUE0yX0VOQUJMRT09dHJ1ZQo+IC0g
Y2hhbmdlZDogUGNkUGNpRGlzYWJsZUJ1c0VudW1lcmF0aW9uIGR5bmFtaWMgZGVmYXVsdCBmbGlw
cGVkIHRvIFRSVUUKPiAtIGNoYW5nZWQ6IGRlZmF1bHQgRkRfU0laRV9JTl9LQiB0byAyTS4KPiAt
IHJldmVydGVkIGQyNzI0NDlkOWUxZSwgIk92bWZQa2c6IHJhaXNlIERYRUZWIHNpemUgdG8gMTEg
TUIiCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dp
P2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRA
Y2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNv
bT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjQ6Cj4gICAgIC0gcmViYXNlZAo+ICAgICAtIFVw
ZGF0ZSBNYWludGFpbmVycy50eHQKPiAgICAgCj4gICAgIHYzOgo+ICAgICAtIHJlYmFzZWQsIFNQ
RFggKyA4MjU5LzgyNTQgY2hhbmdlcwo+IAo+ICBPdm1mUGtnL092bWZYZW4uZHNjIHwgNzI5ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIE92bWZQa2cvT3Zt
Zlhlbi5mZGYgfCA0MzkgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgTWFpbnRhaW5lcnMu
dHh0ICAgICB8ICAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTE2OSBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBPdm1mUGtnL092bWZYZW4uZHNjCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBPdm1mUGtnL092bWZYZW4uZmRmCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvTWFpbnRhaW5l
cnMudHh0IGIvTWFpbnRhaW5lcnMudHh0Cj4gaW5kZXggMDI5ODAxMDgwOS4uOThmNmQ4MjhlYiAx
MDA2NDQKPiAtLS0gYS9NYWludGFpbmVycy50eHQKPiArKysgYi9NYWludGFpbmVycy50eHQKPiBA
QCAtMzcyLDYgKzM3Miw3IEBAIEY6IE92bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJvb3RNYW5hZ2Vy
TGliL0Jkc1BsYXRmb3JtLmMKPiAgRjogT3ZtZlBrZy9MaWJyYXJ5L1hlbkNvbnNvbGVTZXJpYWxQ
b3J0TGliLwo+ICBGOiBPdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliLwo+ICBGOiBPdm1m
UGtnL0xpYnJhcnkvWGVuSW9NbWlvTGliLwo+ICtGOiBPdm1mUGtnL092bWZYZW4uKgo+ICBGOiBP
dm1mUGtnL1BsYXRmb3JtUGVpL01lbURldGVjdC5jCj4gIEY6IE92bWZQa2cvUGxhdGZvcm1QZWkv
UGxhdGZvcm0uKgo+ICBGOiBPdm1mUGtnL1BsYXRmb3JtUGVpL1hlbi4qCj4gCgpSZXZpZXdlZC1i
eTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
