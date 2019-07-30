Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8184F7A893
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:34:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRHC-0006Nr-M6; Tue, 30 Jul 2019 12:30:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsRHB-0006Nm-Jb
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:30:45 +0000
X-Inumbo-ID: d9fe7c10-b2c5-11e9-9ff9-ff544d81f1c0
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9fe7c10-b2c5-11e9-9ff9-ff544d81f1c0;
 Tue, 30 Jul 2019 12:30:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 55E16308FBA6;
 Tue, 30 Jul 2019 12:30:44 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCC5D10013A7;
 Tue, 30 Jul 2019 12:30:42 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-31-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <c48e1e25-df94-ada9-8d9a-7e7f8cdd61b1@redhat.com>
Date: Tue, 30 Jul 2019 14:30:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-31-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 30 Jul 2019 12:30:44 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 30/35] OvmfPkg/OvmfXen:
 Introduce XenTimerDxe
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

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ICJPdm1mUGtnLzgyNTRU
aW1lckR4ZSIgaXMgcmVwbGFjZWQgd2l0aCBhIFhlbi1zcGVjaWZpYwo+IEVGSV9USU1FUl9BUkNI
X1BST1RPQ09MIGltcGxlbWVudGF0aW9uLiBBbHNvIHJlbW92ZQo+IDgyNTlJbnRlcnJ1cHRDb250
cm9sbGVyRHhlIGFzIGl0IGlzIG5vdCB1c2VkIGFueW1vcmUuCj4gCj4gVGhpcyBUaW1lciB1c2Vz
IHRoZSBsb2NhbCBBUElDIHRpbWVyIGFzIHRpbWUgc291cmNlIGFzIGl0IGNhbiB3b3JrIG9uCj4g
Ym90aCBhIFhlbiBQVkggZ3Vlc3QgYW5kIGFuIEhWTSBvbmUuCj4gCj4gQmFzZWQgb24gdGhlICJP
dm1mUGtnLzgyNTRUaW1lckR4ZSIgaW1wbGVtZW50YXRpb24uCj4gCj4gUmVmOiBodHRwczovL2J1
Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5
OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBBY2tlZC1ieTog
TGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAg
djQ6Cj4gICAgIC0gZml4IHRoZSBjb21taXQgbWVzc2FnZSB0byByZWZsZWN0IHRoZSBmYWN0IHRo
YXQgdGhlIG9yaWdpbmFsIGNvZGUgYXMKPiAgICAgICBtb3ZlZC4KPiAgICAgLSBVcGRhdGUgTWFp
bnRhaW5lcnMudHh0Cj4gICAgIAo+ICAgICB2MzoKPiAgICAgLSByZWJhc2VkLCBTUERYLCBjb3B5
cmlnaHQKPiAgICAgCj4gICAgIHYyOgo+ICAgICAtIFVzZSBJbml0aWFsaXplQXBpY1RpbWVyIGlu
c3RlYWQgb2YgV3JpdGVMb2NhbEFwaWNSZWcKPiAgICAgLSByZXdvcmsgY29tbWVudHMgKHJlbW92
ZSBtYW55IHRoYXQgZG9uJ3QgYXBwbHkpCj4gICAgIC0gcmVtb3ZlIHVudXNlZCBpbmNsdWRlcywg
YW5kIGxpYnMKPiAgICAgLSBoYXZlIGEgbWFjcm8gdG8gdGhlIHRpbWVydmVjdG9yLgo+ICAgICAt
IGNsZWFudXAsIGNvcHlyaWdodAo+ICAgICAtIHJld29yayBjYWxjdWxhdGlvbiBvZiBUaW1lckNv
dW50LCB2YWx1ZSB0byBiZSB1c2UgYnkgdGhlIEFQSUMgdGltZXIKPiAgICAgLSBjaGVjayBmb3Ig
b3ZlcmZsb3cgb2YgVGltZXJQZXJpb2QsIHdpdGggdGhlIGFwaWMgdGltZXIsIHRoZSBwZXJpb2Qg
Y2FuCj4gICAgICAgYmUgdXAgdG8gYWJvdXQgNDJzIG9uIFhlbiAob3IgZXZlbiBoaWdoZXIgYnkg
Y2hhbmdpbmcgdGhlIERpdmlkZVZhbHVlKS4KPiAKPiAgT3ZtZlBrZy9Pdm1mWGVuLmRzYyAgICAg
ICAgICAgICAgICAgfCAgIDMgKy0KPiAgT3ZtZlBrZy9Pdm1mWGVuLmZkZiAgICAgICAgICAgICAg
ICAgfCAgIDMgKy0KPiAgT3ZtZlBrZy9YZW5UaW1lckR4ZS9YZW5UaW1lckR4ZS5pbmYgfCAgNDIg
KysrKwo+ICBPdm1mUGtnL1hlblRpbWVyRHhlL1hlblRpbWVyRHhlLmggICB8IDE3NyArKysrKysr
KysrKysrKwo+ICBPdm1mUGtnL1hlblRpbWVyRHhlL1hlblRpbWVyRHhlLmMgICB8IDM1NSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIE1haW50YWluZXJzLnR4dCAgICAgICAgICAgICAg
ICAgICAgIHwgICAxICsKPiAgNiBmaWxlcyBjaGFuZ2VkLCA1NzcgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IE92bWZQa2cvWGVuVGltZXJEeGUvWGVu
VGltZXJEeGUuaW5mCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBPdm1mUGtnL1hlblRpbWVyRHhlL1hl
blRpbWVyRHhlLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IE92bWZQa2cvWGVuVGltZXJEeGUvWGVu
VGltZXJEeGUuYwoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL01haW50YWluZXJzLnR4dCBiL01haW50
YWluZXJzLnR4dAo+IGluZGV4IGY1MTczMWE2YjYuLjc4ZTlmODg5YWIgMTAwNjQ0Cj4gLS0tIGEv
TWFpbnRhaW5lcnMudHh0Cj4gKysrIGIvTWFpbnRhaW5lcnMudHh0Cj4gQEAgLTM4NSw2ICszODUs
NyBAQCBGOiBPdm1mUGtnL1hlbklvUGNpRHhlLwo+ICBGOiBPdm1mUGtnL1hlblBsYXRmb3JtUGVp
Lwo+ICBGOiBPdm1mUGtnL1hlblB2QmxrRHhlLwo+ICBGOiBPdm1mUGtnL1hlblJlc2V0VmVjdG9y
Lwo+ICtGOiBPdm1mUGtnL1hlblRpbWVyRHhlLwo+ICBSOiBBbnRob255IFBlcmFyZCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KPiAgUjogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KPiAgCj4gCgpBY2tlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
