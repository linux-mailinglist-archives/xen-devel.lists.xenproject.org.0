Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ED0B3CBD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 16:41:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9s8t-0000bO-M8; Mon, 16 Sep 2019 14:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ffgk=XL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1i9s8s-0000bF-GP
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 14:38:14 +0000
X-Inumbo-ID: 9c2e3c14-d88f-11e9-978d-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9c2e3c14-d88f-11e9-978d-bc764e2007e4;
 Mon, 16 Sep 2019 14:38:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 198D8883825;
 Mon, 16 Sep 2019 14:38:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-96.rdu2.redhat.com
 [10.10.124.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0A511001B09;
 Mon, 16 Sep 2019 14:38:10 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-3-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <f7b2faaf-a511-86c6-a533-848fe22b2505@redhat.com>
Date: Mon, 16 Sep 2019 16:38:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190913145100.303433-3-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Mon, 16 Sep 2019 14:38:12 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 02/11] OvmfPkg/XenBusDxe: Have
 XenStoreFindWatch take a pointer
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
Cc: Jordan Justen <jordan.l.justen@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMTMvMTkgMTY6NTAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IFJld29yayBYZW5TdG9y
ZUZpbmRXYXRjaCgpIHRvIGJlIGFibGUgdG8gc2VhcmNoIGZvciBhIHJlZ2lzdGVyZWQgd2F0Y2gK
PiB3aXRoIGEgcG9pbnRlciBpbnN0ZWFkIG9mIGEgc3RyaW5nLgo+IAo+IFJlZjogaHR0cHM6Ly9i
dWd6aWxsYS50aWFub2NvcmUub3JnL3Nob3dfYnVnLmNnaT9pZD0yMTkwCj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gIE92
bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMgfCAyMCArKysrKysrKysrKy0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYyBiL092bWZQa2cvWGVuQnVzRHhl
L1hlblN0b3JlLmMKPiBpbmRleCA3MjUzZDhhZTM3Li43Mjc2NDFhMGZlIDEwMDY0NAo+IC0tLSBh
L092bWZQa2cvWGVuQnVzRHhlL1hlblN0b3JlLmMKPiArKysgYi9Pdm1mUGtnL1hlbkJ1c0R4ZS9Y
ZW5TdG9yZS5jCj4gQEAgLTI1MywxNCArMjUzLDEyIEBAIFNwbGl0ICgKPiAgU1RBVElDCj4gIFhF
TlNUT1JFX1dBVENIICoKPiAgWGVuU3RvcmVGaW5kV2F0Y2ggKAo+IC0gIElOIENPTlNUIENIQVI4
ICpUb2tlbgo+ICsgIElOIFZPSUQgKlRva2VuCj4gICAgKQo+ICB7Cj4gLSAgWEVOU1RPUkVfV0FU
Q0ggKldhdGNoLCAqV2FudGVkV2F0Y2g7Cj4gKyAgWEVOU1RPUkVfV0FUQ0ggKldhdGNoOwo+ICAg
IExJU1RfRU5UUlkgKkVudHJ5Owo+ICAKPiAtICBXYW50ZWRXYXRjaCA9IChWT0lEICopIEFzY2lp
U3RySGV4VG9VaW50biAoVG9rZW4pOwo+IC0KPiAgICBpZiAoSXNMaXN0RW1wdHkgKCZ4cy5SZWdp
c3RlcmVkV2F0Y2hlcykpIHsKPiAgICAgIHJldHVybiBOVUxMOwo+ICAgIH0KPiBAQCAtMjY4LDcg
KzI2Niw3IEBAIFhlblN0b3JlRmluZFdhdGNoICgKPiAgICAgICAgICFJc051bGwgKCZ4cy5SZWdp
c3RlcmVkV2F0Y2hlcywgRW50cnkpOwo+ICAgICAgICAgRW50cnkgPSBHZXROZXh0Tm9kZSAoJnhz
LlJlZ2lzdGVyZWRXYXRjaGVzLCBFbnRyeSkpIHsKPiAgICAgIFdhdGNoID0gWEVOU1RPUkVfV0FU
Q0hfRlJPTV9MSU5LIChFbnRyeSk7Cj4gLSAgICBpZiAoV2F0Y2ggPT0gV2FudGVkV2F0Y2gpCj4g
KyAgICBpZiAoKFZPSUQgKikgV2F0Y2ggPT0gVG9rZW4pCj4gICAgICAgIHJldHVybiBXYXRjaDsK
PiAgICB9Cj4gIAo+IEBAIC02MzIsMTIgKzYzMCwxNiBAQCBYZW5TdG9yZVByb2Nlc3NNZXNzYWdl
ICgKPiAgICBCb2R5W01lc3NhZ2UtPkhlYWRlci5sZW5dID0gJ1wwJzsKPiAgCj4gICAgaWYgKE1l
c3NhZ2UtPkhlYWRlci50eXBlID09IFhTX1dBVENIX0VWRU5UKSB7Cj4gKyAgICBWT0lEICpDb252
ZXJ0ZWRUb2tlbjsKPiArCj4gICAgICBNZXNzYWdlLT51LldhdGNoLlZlY3RvciA9IFNwbGl0KEJv
ZHksIE1lc3NhZ2UtPkhlYWRlci5sZW4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICZNZXNzYWdlLT51LldhdGNoLlZlY3RvclNpemUpOwo+ICAKPiArICAgIENvbnZlcnRl
ZFRva2VuID0KPiArICAgICAgKFZPSUQgKikgQXNjaWlTdHJIZXhUb1VpbnRuIChNZXNzYWdlLT51
LldhdGNoLlZlY3RvcltYU19XQVRDSF9UT0tFTl0pOwo+ICsKPiAgICAgIEVmaUFjcXVpcmVMb2Nr
ICgmeHMuUmVnaXN0ZXJlZFdhdGNoZXNMb2NrKTsKPiAtICAgIE1lc3NhZ2UtPnUuV2F0Y2guSGFu
ZGxlID0KPiAtICAgICAgWGVuU3RvcmVGaW5kV2F0Y2ggKE1lc3NhZ2UtPnUuV2F0Y2guVmVjdG9y
W1hTX1dBVENIX1RPS0VOXSk7Cj4gKyAgICBNZXNzYWdlLT51LldhdGNoLkhhbmRsZSA9IFhlblN0
b3JlRmluZFdhdGNoIChDb252ZXJ0ZWRUb2tlbik7Cj4gICAgICBERUJVRyAoKEVGSV9EX0lORk8s
ICJYZW5TdG9yZTogV2F0Y2ggZXZlbnQgJWFcbiIsCj4gICAgICAgICAgICAgIE1lc3NhZ2UtPnUu
V2F0Y2guVmVjdG9yW1hTX1dBVENIX1RPS0VOXSkpOwo+ICAgICAgaWYgKE1lc3NhZ2UtPnUuV2F0
Y2guSGFuZGxlICE9IE5VTEwpIHsKPiBAQCAtMTM4NCw4ICsxMzg2LDcgQEAgWGVuU3RvcmVVbnJl
Z2lzdGVyV2F0Y2ggKAo+ICAKPiAgICBBU1NFUlQgKFdhdGNoLT5TaWduYXR1cmUgPT0gWEVOU1RP
UkVfV0FUQ0hfU0lHTkFUVVJFKTsKPiAgCj4gLSAgQXNjaWlTUHJpbnQgKFRva2VuLCBzaXplb2Yg
KFRva2VuKSwgIiVwIiwgKFZPSUQgKikgV2F0Y2gpOwo+IC0gIGlmIChYZW5TdG9yZUZpbmRXYXRj
aCAoVG9rZW4pID09IE5VTEwpIHsKPiArICBpZiAoWGVuU3RvcmVGaW5kV2F0Y2ggKFdhdGNoKSA9
PSBOVUxMKSB7Cj4gICAgICByZXR1cm47Cj4gICAgfQo+ICAKPiBAQCAtMTM5Myw2ICsxMzk0LDcg
QEAgWGVuU3RvcmVVbnJlZ2lzdGVyV2F0Y2ggKAo+ICAgIFJlbW92ZUVudHJ5TGlzdCAoJldhdGNo
LT5MaW5rKTsKPiAgICBFZmlSZWxlYXNlTG9jayAoJnhzLlJlZ2lzdGVyZWRXYXRjaGVzTG9jayk7
Cj4gIAo+ICsgIEFzY2lpU1ByaW50IChUb2tlbiwgc2l6ZW9mIChUb2tlbiksICIlcCIsIChWT0lE
ICopIFdhdGNoKTsKPiAgICBYZW5TdG9yZVVud2F0Y2ggKFdhdGNoLT5Ob2RlLCBUb2tlbik7Cj4g
IAo+ICAgIC8qIENhbmNlbCBwZW5kaW5nIHdhdGNoIGV2ZW50cy4gKi8KPiAKClJldmlld2VkLWJ5
OiBMYXN6bG8gRXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
