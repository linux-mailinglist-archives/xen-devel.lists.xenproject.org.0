Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2937A8AD
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:37:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRLK-0006Vm-9A; Tue, 30 Jul 2019 12:35:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QE78=V3=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hsRLJ-0006Vh-3D
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:35:01 +0000
X-Inumbo-ID: 71fa20a0-b2c6-11e9-b767-633bd76d1230
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71fa20a0-b2c6-11e9-b767-633bd76d1230;
 Tue, 30 Jul 2019 12:35:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 724AA3078A3C;
 Tue, 30 Jul 2019 12:34:59 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.36.118.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 164BB5D6B2;
 Tue, 30 Jul 2019 12:34:57 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190729153944.24239-1-anthony.perard@citrix.com>
 <20190729153944.24239-32-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <d74a5bfc-e651-456d-9a59-2661becf3982@redhat.com>
Date: Tue, 30 Jul 2019 14:34:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729153944.24239-32-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 30 Jul 2019 12:34:59 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH v4 31/35]
 OvmfPkg/PlatformBootManagerLib: Use a Xen console for ConOut/ConIn
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

T24gMDcvMjkvMTkgMTc6MzksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIGEgWGVuIFBWSCBn
dWVzdCwgbm9uZSBvZiB0aGUgZXhpc3Rpbmcgc2VyaWFsIG9yIGNvbnNvbGUgaW50ZXJmYWNlCj4g
d29ya3MsIHNvIHdlIGFkZCBhIG5ldyBvbmUsIGJhc2VkIG9uIFhlbkNvbnNvbGVTZXJpYWxQb3J0
TGliLCBhbmQKPiBpbXBsZW1lbnRlZCB2aWEgU2VyaWFsRHhlLgo+IAo+IFRoYXQgaXMgYSBzaW1w
bGUgY29uc29sZSBpbXBsZW1lbnRhdGlvbiB0aGF0IGNhbiB3b3JrcyBvbiBib3RoIFBWSAo+IGd1
ZXN0IGFuZCBIVk0gZ3Vlc3RzLCBldmVuIGlmIGl0IHJhcmVseSBnb2luZyB0byBiZSB1c2Ugb24g
SFZNLgo+IAo+IEhhdmUgUGxhdGZvcm1Cb290TWFuYWdlckxpYiBsb29rIGZvciB0aGUgbmV3IGNv
bnNvbGUsIHdoZW4gcnVubmluZyBhcyBhCj4gWGVuIGd1ZXN0Lgo+IAo+IFNpbmNlIHdlIHVzZSBW
RU5ET1JfVUFSVF9ERVZJQ0VfUEFUSCwgZml4IGl0cyBkZXNjcmlwdGlvbiBhbmQgY29kaW5nCj4g
c3R5bGUuCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRpYW5vY29yZS5vcmcvc2hvd19idWcu
Y2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KPiBSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0
LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAgICAgdjQ6Cj4gICAgIC0gaW5zdGVhZCBvZiBjcmVh
dGluZyBhIG5ldyBYRU5fQ09OU09MRV9ERVZJQ0VfUEFUSCwgdXNlIHRoZSBleGlzdGluZwo+ICAg
ICAgIFZFTkRPUl9VQVJUX0RFVklDRV9QQVRILiBBbmQgZXhwbGFpbiB3aHkgVkVORE9SX1VBUlRf
REVWSUNFX1BBVEgKPiAgICAgICBjaGFuZ2VkIGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiAgICAg
Cj4gICAgIHYzOgo+ICAgICAtIHJlbW92ZWQgUGNpU2lvU2VyaWFsRHhlIGFuZCBJc2FTZXJpYWxE
eGUgZnJvbSBPdm1mWGVuLCBzaW5jZSB0aGV5Cj4gICAgICAgd291bGQgbm90IGJlIHVzZWQsIG1h
eWJlLCB0byBjaGVjay4KPiAgICAgLSBzb21lIGNvZGluZyBzdHlsZSBmaXgKPiAgICAgCj4gICAg
IC0gbm90IGNoYW5nZWQ6IFBjaVNpb1NlcmlhbER4ZTogZXZlbiBpZiB3ZSBhZGQgU2VyaWFsRHhl
LCB3ZSBzdGlsbCBuZWVkcwo+ICAgICAgIFBjaVNpb1NlcmlhbER4ZSB0byBoYXZlIE9WTUYgdXNl
IHRoZSBlbXVsYXRlZCBzZXJpYWwgcG9ydCBvbiBIVk0uCj4gICAgIAo+ICAgICB2MjoKPiAgICAg
LSBVc2UgTWRlTW9kdWxlUGtnL1VuaXZlcnNhbC9TZXJpYWxEeGUgaW5zdGVhZCBvZiBzb21ldGhp
bmcgbmV3Lgo+ICAgICAtIEhhdmUgUGxhdGZvcm1Jbml0aWFsaXplQ29uc29sZSgpIGxvb2sgZm9y
IGl0IGJ5IHVzaW5nIHRoZQo+ICAgICAgIGtub3duLWluLWFkdmFuY2UgZGV2aWNlIHBhdGggZm9y
IHRoZSB4ZW4gY29uc29sZSBpbiB0aGUKPiAgICAgICBQTEFURk9STV9DT05TT0xFX0NPTk5FQ1Rf
RU5UUlkuCj4gCj4gIE92bWZQa2cvT3ZtZlhlbi5kc2MgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICA0ICsrCj4gIE92bWZQa2cvT3ZtZlhlbi5mZGYgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAxICsKPiAgLi4uL1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIuaW5mICAgICAgICAgICAgICAg
IHwgIDQgKysKPiAgLi4uL1BsYXRmb3JtQm9vdE1hbmFnZXJMaWIvQmRzUGxhdGZvcm0uaCAgICAg
IHwgIDEgKwo+ICAuLi4vUGxhdGZvcm1Cb290TWFuYWdlckxpYi9CZHNQbGF0Zm9ybS5jICAgICAg
fCAgMyArLQo+ICAuLi4vUGxhdGZvcm1Cb290TWFuYWdlckxpYi9QbGF0Zm9ybURhdGEuYyAgICAg
fCA0OSArKysrKysrKysrKysrKysrKy0tCj4gIDYgZmlsZXMgY2hhbmdlZCwgNTggaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCkxvb2tzIGdvb2QsIHRoYW5rcy4KTGFzemxvCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
