Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA71B3C87
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 16:28:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9rvf-0007cm-2u; Mon, 16 Sep 2019 14:24:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ffgk=XL=redhat.com=lersek@srs-us1.protection.inumbo.net>)
 id 1i9rvc-0007cf-UN
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 14:24:32 +0000
X-Inumbo-ID: b1adc002-d88d-11e9-b299-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1adc002-d88d-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 14:24:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2C4E7307BCC4;
 Mon, 16 Sep 2019 14:24:29 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-96.rdu2.redhat.com
 [10.10.124.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B12171ED;
 Mon, 16 Sep 2019 14:24:27 +0000 (UTC)
To: devel@edk2.groups.io, anthony.perard@citrix.com
References: <20190913145100.303433-1-anthony.perard@citrix.com>
 <20190913145100.303433-2-anthony.perard@citrix.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <dce11ad0-7d7f-78ec-0dd8-7593347b77d7@redhat.com>
Date: Mon, 16 Sep 2019 16:24:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190913145100.303433-2-anthony.perard@citrix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 16 Sep 2019 14:24:29 +0000 (UTC)
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 01/11] OvmfPkg/XenBusDxe: Fix
 missing \n in DEBUG messages
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

T24gMDkvMTMvMTkgMTY6NTAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IEZpeCBtaXNzaW5nIFxu
IGluIERFQlVHIG1lc3NhZ2VzIGluIFhlbkJ1c0R4ZSBhbmQgdXNlIERFQlVHXyouCj4gCj4gU2ln
bmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4g
LS0tCj4gIE92bWZQa2cvWGVuQnVzRHhlL0V2ZW50Q2hhbm5lbC5jIHwgMyArKy0KPiAgT3ZtZlBr
Zy9YZW5CdXNEeGUvWGVuU3RvcmUuYyAgICAgfCA2ICsrKy0tLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvT3ZtZlBr
Zy9YZW5CdXNEeGUvRXZlbnRDaGFubmVsLmMgYi9Pdm1mUGtnL1hlbkJ1c0R4ZS9FdmVudENoYW5u
ZWwuYwo+IGluZGV4IDY5MDAwNzE3ODIuLmM2YjM4NzE3ODEgMTAwNjQ0Cj4gLS0tIGEvT3ZtZlBr
Zy9YZW5CdXNEeGUvRXZlbnRDaGFubmVsLmMKPiArKysgYi9Pdm1mUGtnL1hlbkJ1c0R4ZS9FdmVu
dENoYW5uZWwuYwo+IEBAIC00NCw3ICs0NCw4IEBAIFhlbkJ1c0V2ZW50Q2hhbm5lbEFsbG9jYXRl
ICgKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBFVlRDSE5PUF9hbGxvY191
bmJvdW5kLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZQYXJhbWV0ZXIp
Owo+ICAgIGlmIChSZXR1cm5Db2RlICE9IDApIHsKPiAtICAgIERFQlVHICgoRUZJX0RfRVJST1Is
ICJFUlJPUjogYWxsb2NfdW5ib3VuZCBmYWlsZWQgd2l0aCByYz0lZCIsIFJldHVybkNvZGUpKTsK
PiArICAgIERFQlVHICgoREVCVUdfRVJST1IsICJFUlJPUjogYWxsb2NfdW5ib3VuZCBmYWlsZWQg
d2l0aCByYz0lZFxuIiwKPiArICAgICAgICBSZXR1cm5Db2RlKSk7Cj4gICAgICByZXR1cm4gUmV0
dXJuQ29kZTsKPiAgICB9Cj4gICAgKlBvcnQgPSBQYXJhbWV0ZXIucG9ydDsKPiBkaWZmIC0tZ2l0
IGEvT3ZtZlBrZy9YZW5CdXNEeGUvWGVuU3RvcmUuYyBiL092bWZQa2cvWGVuQnVzRHhlL1hlblN0
b3JlLmMKPiBpbmRleCAzNDg5MGFlNDBiLi43MjUzZDhhZTM3IDEwMDY0NAo+IC0tLSBhL092bWZQ
a2cvWGVuQnVzRHhlL1hlblN0b3JlLmMKPiArKysgYi9Pdm1mUGtnL1hlbkJ1c0R4ZS9YZW5TdG9y
ZS5jCj4gQEAgLTczOCw3ICs3MzgsNyBAQCBYZW5TdG9yZVJlYWRSZXBseSAoCj4gICAgICBYRU5T
VE9SRV9TVEFUVVMgU3RhdHVzOwo+ICAgICAgU3RhdHVzID0gWGVuU3RvcmVQcm9jZXNzTWVzc2Fn
ZSAoKTsKPiAgICAgIGlmIChTdGF0dXMgIT0gWEVOU1RPUkVfU1RBVFVTX1NVQ0NFU1MgJiYgU3Rh
dHVzICE9IFhFTlNUT1JFX1NUQVRVU19FQUdBSU4pIHsKPiAtICAgICAgREVCVUcgKChFRklfRF9F
UlJPUiwgIlhlblN0b3JlLCBlcnJvciB3aGlsZSByZWFkaW5nIHRoZSByaW5nICglZCkuIiwKPiAr
ICAgICAgREVCVUcgKChERUJVR19FUlJPUiwgIlhlblN0b3JlLCBlcnJvciB3aGlsZSByZWFkaW5n
IHRoZSByaW5nICglZCkuXG4iLAo+ICAgICAgICAgICAgICAgIFN0YXR1cykpOwo+ICAgICAgICBy
ZXR1cm4gU3RhdHVzOwo+ICAgICAgfQo+IEBAIC0xMDc2LDcgKzEwNzYsNyBAQCBYZW5TdG9yZURl
aW5pdCAoCj4gICAgaWYgKCFJc0xpc3RFbXB0eSAoJnhzLlJlZ2lzdGVyZWRXYXRjaGVzKSkgewo+
ICAgICAgWEVOU1RPUkVfV0FUQ0ggKldhdGNoOwo+ICAgICAgTElTVF9FTlRSWSAqRW50cnk7Cj4g
LSAgICBERUJVRyAoKEVGSV9EX1dBUk4sICJYZW5TdG9yZTogUmVnaXN0ZXJlZFdhdGNoZXMgaXMg
bm90IGVtcHR5LCBjbGVhbmluZyB1cC4uLiIpKTsKPiArICAgIERFQlVHICgoREVCVUdfV0FSTiwg
IlhlblN0b3JlOiBSZWdpc3RlcmVkV2F0Y2hlcyBpcyBub3QgZW1wdHksIGNsZWFuaW5nIHVwLi4u
XG4iKSk7Cj4gICAgICBFbnRyeSA9IEdldEZpcnN0Tm9kZSAoJnhzLlJlZ2lzdGVyZWRXYXRjaGVz
KTsKPiAgICAgIHdoaWxlICghSXNOdWxsICgmeHMuUmVnaXN0ZXJlZFdhdGNoZXMsIEVudHJ5KSkg
ewo+ICAgICAgICBXYXRjaCA9IFhFTlNUT1JFX1dBVENIX0ZST01fTElOSyAoRW50cnkpOwo+IEBA
IC0xMDkyLDcgKzEwOTIsNyBAQCBYZW5TdG9yZURlaW5pdCAoCj4gICAgLy8KPiAgICBpZiAoIUlz
TGlzdEVtcHR5ICgmeHMuV2F0Y2hFdmVudHMpKSB7Cj4gICAgICBMSVNUX0VOVFJZICpFbnRyeTsK
PiAtICAgIERFQlVHICgoRUZJX0RfV0FSTiwgIlhlblN0b3JlOiBXYXRjaEV2ZW50cyBpcyBub3Qg
ZW1wdHksIGNsZWFuaW5nIHVwLi4uIikpOwo+ICsgICAgREVCVUcgKChERUJVR19XQVJOLCAiWGVu
U3RvcmU6IFdhdGNoRXZlbnRzIGlzIG5vdCBlbXB0eSwgY2xlYW5pbmcgdXAuLi5cbiIpKTsKPiAg
ICAgIEVudHJ5ID0gR2V0Rmlyc3ROb2RlICgmeHMuV2F0Y2hFdmVudHMpOwo+ICAgICAgd2hpbGUg
KCFJc051bGwgKCZ4cy5XYXRjaEV2ZW50cywgRW50cnkpKSB7Cj4gICAgICAgIFhFTlNUT1JFX01F
U1NBR0UgKk1lc3NhZ2UgPSBYRU5TVE9SRV9NRVNTQUdFX0ZST01fTElOSyAoRW50cnkpOwo+IAoK
UmV2aWV3ZWQtYnk6IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
