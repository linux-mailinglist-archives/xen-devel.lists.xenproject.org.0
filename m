Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0298E0A5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 00:23:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hy1dt-0001a9-Ny; Wed, 14 Aug 2019 22:21:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fj01=WK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hy1ds-0001a4-E0
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 22:21:16 +0000
X-Inumbo-ID: d49b93f2-bee1-11e9-8b98-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d49b93f2-bee1-11e9-8b98-12813bfff9fa;
 Wed, 14 Aug 2019 22:21:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E4D02067D;
 Wed, 14 Aug 2019 22:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565821275;
 bh=8BOiUB9Qcz6CG4WBJmWmLDTQHV4j23vdxygZS5+loD4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=yxbR05bz2KOTmCIO2xKL6FDS9NKDKH/X5XTounjFzU8Mu5bdRoEskLGmmsIPZhm3w
 uEfErVYeFspBHVSWtNyeO/GXTBr9HV2+S8Cojx+ZSdiG0M2igj5hjjeoQi7n1eZocH
 KlfujWTfVp99LS4l7wR51Q+wjvvHgBfBKw893Ou0=
Date: Wed, 14 Aug 2019 15:21:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <81216c46-b1b8-8278-367f-66f9c83aaef4@arm.com>
Message-ID: <alpine.DEB.2.21.1908141520570.8737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-4-sstabellini@kernel.org> <87d0h9gmwb.fsf@epam.com>
 <81216c46-b1b8-8278-367f-66f9c83aaef4@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v5 4/7] xen/arm: early_print_info print
 reserved_mem
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxMyBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDgv
MTMvMTkgMzoyOCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gPiAKPiA+IFN0ZWZhbm8g
U3RhYmVsbGluaSB3cml0ZXM6Cj4gPiAKPiA+ID4gSW1wcm92ZSBlYXJseV9wcmludF9pbmZvIHRv
IGFsc28gcHJpbnQgdGhlIGJhbmtzIHNhdmVkIGluCj4gPiA+IGJvb3RpbmZvLnJlc2VydmVkX21l
bS4gUHJpbnQgdGhlbSByaWdodCBhZnRlciBSRVNWRCwgaW5jcmVhc2luZyB0aGUgc2FtZQo+ID4g
PiBpbmRleC4KPiA+ID4gCj4gPiA+IFNpbmNlIHdlIGFyZSBhdCBpdCwgYWxzbyBzd2l0Y2ggdGhl
IGV4aXN0aW5nIFJFU1ZEIHByaW50IHRvIHVzZSB1bnNpZ25lZAo+ID4gPiBpbnQuCj4gPiA+IAo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5j
b20+Cj4gPiBSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15ci5iYWJjaHVr
QGVwYW0uY29tPgoKVGhhbmtzCgoKPiA+IEJ1dCwgcGxlYXNlIHNlZSBOSVQgYmVsb3cuCj4gPiAK
PiA+ID4gLS0tCj4gPiA+IENoYW5nZXMgaW4gdjU6Cj4gPiA+IC0gc3dpdGNoIHRvIHVuc2lnbmVk
Cj4gPiA+IAo+ID4gPiBDaGFuZ2VzIGluIHY0Ogo+ID4gPiAtIG5ldyBwYXRjaAo+ID4gPiAtLS0K
PiA+ID4gICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5jIHwgMTEgKysrKysrKysrLS0KPiA+ID4gICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+
ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0vYm9v
dGZkdC5jCj4gPiA+IGluZGV4IDBiMGUyMmEzZDAuLjMyMTUzZTYyMDcgMTAwNjQ0Cj4gPiA+IC0t
LSBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMKPiA+ID4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3Rm
ZHQuYwo+ID4gPiBAQCAtMzM3LDkgKzMzNywxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9z
Y2FuX25vZGUoY29uc3Qgdm9pZCAqZmR0LAo+ID4gPiAgIHN0YXRpYyB2b2lkIF9faW5pdCBlYXJs
eV9wcmludF9pbmZvKHZvaWQpCj4gPiA+ICAgewo+ID4gPiAgICAgICBzdHJ1Y3QgbWVtaW5mbyAq
bWkgPSAmYm9vdGluZm8ubWVtOwo+ID4gPiArICAgIHN0cnVjdCBtZW1pbmZvICptZW1fcmVzdiA9
ICZib290aW5mby5yZXNlcnZlZF9tZW07Cj4gPiA+ICAgICAgIHN0cnVjdCBib290bW9kdWxlcyAq
bW9kcyA9ICZib290aW5mby5tb2R1bGVzOwo+ID4gPiAgICAgICBzdHJ1Y3QgYm9vdGNtZGxpbmVz
ICpjbWRzID0gJmJvb3RpbmZvLmNtZGxpbmVzOwo+ID4gPiAtICAgIGludCBpLCBucl9yc3ZkOwo+
ID4gPiArICAgIHVuc2lnbmVkIGludCBpLCBqLCBucl9yc3ZkOwo+ID4gPiAgICAgICAgIGZvciAo
IGkgPSAwOyBpIDwgbWktPm5yX2JhbmtzOyBpKysgKQo+ID4gPiAgICAgICAgICAgcHJpbnRrKCJS
QU06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCj4gPiA+IEBAIC0zNjEsOSArMzYyLDE1
IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlYXJseV9wcmludF9pbmZvKHZvaWQpCj4gPiA+ICAgICAg
ICAgICAgICAgY29udGludWU7Cj4gPiA+ICAgICAgICAgICAvKiBmZHRfZ2V0X21lbV9yc3YgcmV0
dXJucyBsZW5ndGggKi8KPiA+ID4gICAgICAgICAgIGUgKz0gczsKPiA+ID4gLSAgICAgICAgcHJp
bnRrKCIgUkVTVkRbJWRdOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLAo+ID4gPiArICAg
ICAgICBwcmludGsoIiBSRVNWRFsldV06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCj4g
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgaSwgcywgZSk7Cj4gPiBOSVQ6IEkgc2VlIG5vIHJl
YXNvbiwgd2h5IHRoaXMgcHJpbnRrIGlzIHNwbGl0IGludG8gdHdvIGxpbmVzLCBhcyBuaWNlbHkK
PiA+IGZpdHMKPiA+IGludG8gb25lIGxpbmUuCj4gCj4gTm90IG1lbnRpb25pbmcgdGhlIHdyb25n
IGluZGVudGF0aW9uIGluIHByZXR0eSBtdWNoIGFsbCB0aGlzIGZ1bmN0aW9uIDspLiBJCj4gd291
bGQgcHJlZmVyIGlmIHdlIHRha2UgY2FyZSBvZiB0aGUgaW5kZW50YXRpb24gaXNzdWVzIGluIGEg
cGF0Y2ggYmVmb3JlIHRoaXMKPiBvbmUuCgpJJ2xsIGFkZCBhIHBhdGNoCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
