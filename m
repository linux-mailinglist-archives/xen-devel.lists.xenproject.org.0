Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CB47A551
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 12:00:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOsi-0002F3-UJ; Tue, 30 Jul 2019 09:57:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsOsh-0002Eu-CQ
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:57:19 +0000
X-Inumbo-ID: 6a8ffc89-b2b0-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6a8ffc89-b2b0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:57:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2606C30BD1C2;
 Tue, 30 Jul 2019 09:57:18 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B2D6519C67;
 Tue, 30 Jul 2019 09:57:16 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-14-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <c6df1ab2-f5d7-5ea3-e6a8-958e4e1818b3@redhat.com>
Date: Tue, 30 Jul 2019 11:57:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-14-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 30 Jul 2019 09:57:18 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 13/35]
 OvmfPkg/Library/XenPlatformLib: New library
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

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoZSBwdXJwb3NlIG9m
IFhlblBsYXRmb3JtTGliIGlzIHRvIHJlZ3JvdXAgdGhlIGZldyBmdW5jdGlvbnMgdGhhdCBhcmUK
PiB1c2VkIGluIHNldmVyYWwgcGxhY2VzIHRvIGRldGVjdCBpZiBYZW4gaXMgZGV0ZWN0ZWQsIGFu
ZCB0byBnZXQgdGhlCj4gWGVuSW5mbyBIT0IuCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRp
YW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogTGFzemxv
IEVyc2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjQ6Cj4g
ICAgIC0gZml4IHRvcC1sZXZlbCBjb21tZW50IHN0eWxlCj4gICAgIC0gVXBkYXRlIE1haW50YWlu
ZXJzLnR4dAo+ICAgICAKPiAgICAgdjM6Cj4gICAgIC0gdXNlIFNQRFgKPiAgICAgLSBhZGQgWGVu
UGxhdGZvcm1MaWIuaCB0byBbTGlicmFyeUNsYXNzZXNdIGluIE92bWZQa2cuZGVjCj4gICAgIC0g
Zml4IHR5cG9zCj4gCj4gIE92bWZQa2cvT3ZtZlBrZy5kZWMgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICA0ICsrCj4gIE92bWZQa2cvT3ZtZlhlbi5kc2MgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKPiAgLi4uL0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIu
aW5mIHwgMzMgKysrKysrKysrCj4gIE92bWZQa2cvSW5jbHVkZS9MaWJyYXJ5L1hlblBsYXRmb3Jt
TGliLmggICAgICB8IDUzICsrKysrKysrKysrKysrCj4gIC4uLi9MaWJyYXJ5L1hlblBsYXRmb3Jt
TGliL1hlblBsYXRmb3JtTGliLmMgICB8IDY5ICsrKysrKysrKysrKysrKysrKysKPiAgTWFpbnRh
aW5lcnMudHh0ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKwo+ICA2IGZpbGVz
IGNoYW5nZWQsIDE2MiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBPdm1mUGtn
L0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuaW5mCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBPdm1mUGtnL0luY2x1ZGUvTGlicmFyeS9YZW5QbGF0Zm9ybUxpYi5oCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBPdm1mUGtnL0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1M
aWIuYwoKWy4uLl0KCj4gZGlmZiAtLWdpdCBhL01haW50YWluZXJzLnR4dCBiL01haW50YWluZXJz
LnR4dAo+IGluZGV4IDAxNjUyM2I0MDEuLmY1MTczMWE2YjYgMTAwNjQ0Cj4gLS0tIGEvTWFpbnRh
aW5lcnMudHh0Cj4gKysrIGIvTWFpbnRhaW5lcnMudHh0Cj4gQEAgLTM2NSw2ICszNjUsNyBAQCBG
OiBPdm1mUGtnL0luY2x1ZGUvR3VpZC9YZW5JbmZvLmgKPiAgRjogT3ZtZlBrZy9JbmNsdWRlL0lu
ZHVzdHJ5U3RhbmRhcmQvWGVuLwo+ICBGOiBPdm1mUGtnL0luY2x1ZGUvTGlicmFyeS9YZW5IeXBl
cmNhbGxMaWIuaAo+ICBGOiBPdm1mUGtnL0luY2x1ZGUvTGlicmFyeS9YZW5Jb01taW9MaWIuaAo+
ICtGOiBPdm1mUGtnL0luY2x1ZGUvTGlicmFyeS9YZW5QbGF0Zm9ybUxpYi5oCj4gIEY6IE92bWZQ
a2cvSW5jbHVkZS9Qcm90b2NvbC9YZW5CdXMuaAo+ICBGOiBPdm1mUGtnL0luY2x1ZGUvUHJvdG9j
b2wvWGVuSW8uaAo+ICBGOiBPdm1mUGtnL0xpYnJhcnkvUGNpSG9zdEJyaWRnZUxpYi9YZW5TdXBw
b3J0LmMKPiBAQCAtMzcyLDYgKzM3Myw3IEBAIEY6IE92bWZQa2cvTGlicmFyeS9QbGF0Zm9ybUJv
b3RNYW5hZ2VyTGliL0Jkc1BsYXRmb3JtLmMKPiAgRjogT3ZtZlBrZy9MaWJyYXJ5L1hlbkNvbnNv
bGVTZXJpYWxQb3J0TGliLwo+ICBGOiBPdm1mUGtnL0xpYnJhcnkvWGVuSHlwZXJjYWxsTGliLwo+
ICBGOiBPdm1mUGtnL0xpYnJhcnkvWGVuSW9NbWlvTGliLwo+ICtGOiBPdm1mUGtnL0xpYnJhcnkv
WGVuUGxhdGZvcm1MaWIvCj4gIEY6IE92bWZQa2cvT3ZtZlhlbi4qCj4gIEY6IE92bWZQa2cvT3Zt
ZlhlbkVsZkhlYWRlckdlbmVyYXRvci5jCj4gIEY6IE92bWZQa2cvUGxhdGZvcm1QZWkvTWVtRGV0
ZWN0LmMKPiAKClJldmlld2VkLWJ5OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
