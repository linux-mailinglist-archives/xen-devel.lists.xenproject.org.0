Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92986606A1
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 15:33:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOHT-0004VL-Po; Fri, 05 Jul 2019 13:29:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8AU=VC=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hjOHS-0004VG-7C
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 13:29:38 +0000
X-Inumbo-ID: eef944ca-9f28-11e9-bea6-63c32038ce44
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eef944ca-9f28-11e9-bea6-63c32038ce44;
 Fri, 05 Jul 2019 13:29:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5744566971;
 Fri,  5 Jul 2019 13:29:26 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-244.ams2.redhat.com
 [10.36.116.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E12CD7FD2D;
 Fri,  5 Jul 2019 13:29:23 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-3-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b79c1a87-8bd6-b840-b34f-644ae81f3e95@redhat.com>
Date: Fri, 5 Jul 2019 15:29:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-3-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Fri, 05 Jul 2019 13:29:31 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 02/35] OvmfPkg: Create platform OvmfXen
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
 Jordan Justen <jordan.l.justen@intel.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE92bWZYZW4gaXMgYSBj
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
Y2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjM6Cj4gICAgIC0gcmViYXNlZCwg
U1BEWCArIDgyNTkvODI1NCBjaGFuZ2VzCj4gCj4gIE92bWZQa2cvT3ZtZlhlbi5kc2MgfCA3Mjkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgT3ZtZlBrZy9P
dm1mWGVuLmZkZiB8IDQzOSArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDExNjggaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgT3ZtZlBrZy9P
dm1mWGVuLmRzYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgT3ZtZlBrZy9Pdm1mWGVuLmZkZgoKUmV2
aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
