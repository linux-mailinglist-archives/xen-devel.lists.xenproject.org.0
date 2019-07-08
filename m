Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3DF6209C
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 16:38:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkUjC-0003KV-4j; Mon, 08 Jul 2019 14:34:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qgCs=VF=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1hkUjA-0003KQ-Dx
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 14:34:48 +0000
X-Inumbo-ID: 885f1971-a18d-11e9-8980-bc764e045a96
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 885f1971-a18d-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 14:34:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 76B36883BA;
 Mon,  8 Jul 2019 14:34:33 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-117-3.ams2.redhat.com
 [10.36.117.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14A285C46B;
 Mon,  8 Jul 2019 14:34:28 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>, devel@edk2.groups.io
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-14-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <ed568807-b96c-4238-7d11-e3e69f40fb90@redhat.com>
Date: Mon, 8 Jul 2019 16:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190704144233.27968-14-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 08 Jul 2019 14:34:41 +0000 (UTC)
Subject: Re: [Xen-devel] [PATCH v3 13/35] OvmfPkg/Library/XenPlatformLib:
 New library
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

T24gMDcvMDQvMTkgMTY6NDIsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFRoZSBwdXJwb3NlIG9m
IFhlblBsYXRmb3JtTGliIGlzIHRvIHJlZ3JvdXAgdGhlIGZldyBmdW5jdGlvbnMgdGhhdCBhcmUK
PiB1c2VkIGluIHNldmVyYWwgcGxhY2VzIHRvIGRldGVjdCBpZiBYZW4gaXMgZGV0ZWN0ZWQsIGFu
ZCB0byBnZXQgdGhlCj4gWGVuSW5mbyBIT0IuCj4gCj4gUmVmOiBodHRwczovL2J1Z3ppbGxhLnRp
YW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTE2ODkKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255
IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KPiAtLS0KPiAKPiBOb3RlczoKPiAg
ICAgdjM6Cj4gICAgIC0gdXNlIFNQRFgKPiAgICAgLSBhZGQgWGVuUGxhdGZvcm1MaWIuaCB0byBb
TGlicmFyeUNsYXNzZXNdIGluIE92bWZQa2cuZGVjCj4gICAgIC0gZml4IHR5cG9zCj4gCgpbc25p
cF0KCj4gZGlmZiAtLWdpdCBhL092bWZQa2cvSW5jbHVkZS9MaWJyYXJ5L1hlblBsYXRmb3JtTGli
LmggYi9Pdm1mUGtnL0luY2x1ZGUvTGlicmFyeS9YZW5QbGF0Zm9ybUxpYi5oCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5hODM0NzYwMmI3Cj4gLS0tIC9kZXYvbnVs
bAo+ICsrKyBiL092bWZQa2cvSW5jbHVkZS9MaWJyYXJ5L1hlblBsYXRmb3JtTGliLmgKPiBAQCAt
MCwwICsxLDUzIEBACj4gKy8qKiBAZmlsZQo+ICsqICBHZXQgaW5mb3JtYXRpb24gYWJvdXQgWGVu
Cj4gKyoKPiArKiAgVGhpcyBsaWJyYXJ5IHNpbXBseSBhbGxvdyB0byBmaW5kIG91dCBpZiBPVk1G
IGlzIHJ1bm5pbmcgdW5kZXIgWGVuIGFuZAo+ICsqICBhbGxvdyB0byBnZXQgbW9yZSBpbmZvcm1h
dGlvbiB3aGVuIGl0IGlzIHRoZSBjYXNlLgo+ICsqCj4gKyogIENvcHlyaWdodCAoYykgMjAxOSwg
Q2l0cml4IFN5c3RlbXMsIEluYy4KPiArKgo+ICsqICBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
QlNELTItQ2xhdXNlLVBhdGVudAo+ICsqCj4gKyoqLwoKW3NuaXBdCgoKPiBkaWZmIC0tZ2l0IGEv
T3ZtZlBrZy9MaWJyYXJ5L1hlblBsYXRmb3JtTGliL1hlblBsYXRmb3JtTGliLmMgYi9Pdm1mUGtn
L0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuYwo+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNmYyN2NiZmZhOAo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9Pdm1mUGtnL0xpYnJhcnkvWGVuUGxhdGZvcm1MaWIvWGVuUGxhdGZvcm1MaWIuYwo+IEBA
IC0wLDAgKzEsNjkgQEAKPiArLyoqIEBmaWxlCj4gKyogIEdldCBpbmZvcm1hdGlvbiBhYm91dCBY
ZW4KPiArKgo+ICsqICBUaGlzIGxpYnJhcnkgc2ltcGx5IGFsbG93IHRvIGZpbmQgb3V0IGlmIE9W
TUYgaXMgcnVubmluZyB1bmRlciBYZW4gYW5kCj4gKyogIGFsbG93IHRvIGdldCBtb3JlIGluZm9y
bWF0aW9uIHdoZW4gaXQgaXMgdGhlIGNhc2UuCj4gKyoKPiArKiAgQ29weXJpZ2h0IChjKSAyMDE5
LCBDaXRyaXggU3lzdGVtcywgSW5jLgo+ICsqCj4gKyogIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiBCU0QtMi1DbGF1c2UtUGF0ZW50Cj4gKyoKPiArKiovCgpUaGVzZSBjb21tZW50IGJsb2NrcyBz
aG91bGQgbm90IGhhdmUgYSBjb2x1bW4gb2YgIioiIHRvIHRoZSBsZWZ0LgoKV2l0aCB0aGF0IGZp
eGVkOgoKUmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpUaGFu
a3MKTGFzemxvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
