Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1839F3E4
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 22:19:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2ht9-0005Rk-Mt; Tue, 27 Aug 2019 20:16:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hdZ4=WX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i2ht7-0005Rf-DT
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 20:16:21 +0000
X-Inumbo-ID: 887a0e24-c907-11e9-b95f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 887a0e24-c907-11e9-b95f-bc764e2007e4;
 Tue, 27 Aug 2019 20:16:20 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C490120674;
 Tue, 27 Aug 2019 20:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566936980;
 bh=c4NTcj4kjM+dAZBrMaidkfFe0wWJ3azWafFxXBRVXos=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=175o9hb4ozuQMCBkc3hBtcf/kt0Z+nCC0cU4HkTGzf7SA0JyJpxTDz8VGgCabIw+5
 xzVQNtJq5o/NhjiaelN36cvVtHnbARpOE5XsuUBg0lJHR0zueTmKiOI9GBUwMDFyd3
 vSmEZWq+edd+jcndQHwXKrSiKXPoZkcdQeRCYmNM=
Date: Tue, 27 Aug 2019 13:16:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <877e7ggfls.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1908271316060.25361@sstabellini-ThinkPad-T480s>
References: <20190814093607.22927-1-julien.grall@arm.com>
 <877e7ggfls.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: traps: Remove all zero padding
 before PRIregister format
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxNCBBdWcgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSGkgSnVsaWVu
LAo+IAo+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4gCj4gPiBDb21taXQgYWYxNTZmZjA4NSAieGVu
L2FybTogdHlwZXM6IFNwZWNpZnkgdGhlIHplcm8gcGFkZGluZyBpbiB0aGUKPiA+IGRlZmluaXRp
b24gb2YgUFJJcmVnaXN0ZXIiIG1vdmVkIHRoZSB6ZXJvIHBhZGRpbmcgd2l0aGluIHRoZSBkZWZp
bml0aW9uCj4gPiBvZiBQUklyZWdpc3Rlci4KPiA+Cj4gPiBIb3dldmVyLCBzb21lIG9mIHRoZSB1
c2VycyBzdGlsbCBoYWQgemVybyBwYWRkaW5nIGJlZm9yZSB3aGljaCByZXN1bHQKPiA+IHRvIHBy
aW50IHRlbnMgb2YgemVybyB3aGVuIGR1bXBpbmcgdGhlIENQVSBzdGF0ZS4KPiA+Cj4gPiBUbyBw
cmV2ZW50IHRoaXMsIHJlbW92ZSB0aGUgbGFzdCB1c2VycyBvZiB6ZXJvIHBhZGRpbmcgYmVmb3Jl
Cj4gPiBQUklyZWdpc3Rlci4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1
bGllbi5ncmFsbEBhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9s
b2R5bXlyLmJhYmNodWtAZXBhbS5jb20+CgpUaGFua3MsIGNvbW1pdHRlZAoKPiA+IC0tLQo+ID4g
IHhlbi9hcmNoL2FybS90cmFwcy5jIHwgNCArKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3RyYXBzLmMgYi94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+ID4gaW5kZXggZjA2MmFlNmY2YS4u
YTNiOTYxYmQwNiAxMDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL2FybS90cmFwcy5jCj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vdHJhcHMuYwo+ID4gQEAgLTkzOCw3ICs5MzgsNyBAQCBzdGF0aWMgdm9p
ZCBfc2hvd19yZWdpc3RlcnMoY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsCj4gPiAg
ICAgIHByaW50aygiIFRUQlIwX0VMMjogJTAxNiJQUkl4NjQiXG4iLCBSRUFEX1NZU1JFRzY0KFRU
QlIwX0VMMikpOwo+ID4gICAgICBwcmludGsoIlxuIik7Cj4gPiAgICAgIHByaW50aygiICAgRVNS
X0VMMjogJTA4IlBSSXgzMiJcbiIsIHJlZ3MtPmhzcik7Cj4gPiAtICAgIHByaW50aygiIEhQRkFS
X0VMMjogJTAxNiJQUklyZWdpc3RlciJcbiIsIFJFQURfU1lTUkVHKEhQRkFSX0VMMikpOwo+ID4g
KyAgICBwcmludGsoIiBIUEZBUl9FTDI6ICUiUFJJcmVnaXN0ZXIiXG4iLCBSRUFEX1NZU1JFRyhI
UEZBUl9FTDIpKTsKPiA+ICAKPiA+ICAjaWZkZWYgQ09ORklHX0FSTV8zMgo+ID4gICAgICBwcmlu
dGsoIiAgICAgSERGQVI6ICUwOCJQUkl4MzIiXG4iLCBSRUFEX0NQMzIoSERGQVIpKTsKPiA+IEBA
IC0xNzU5LDcgKzE3NTksNyBAQCB2b2lkIGR1bXBfZ3Vlc3RfczFfd2FsayhzdHJ1Y3QgZG9tYWlu
ICpkLCB2YWRkcl90IGFkZHIpCj4gPiAgICAgIG1mbiA9IGdmbl90b19tZm4oZCwgZ2FkZHJfdG9f
Z2ZuKHR0YnIwKSk7Cj4gPiAgCj4gPiAgICAgIHByaW50aygiZG9tJWQgVkEgMHglMDgiUFJJdmFk
ZHIiXG4iLCBkLT5kb21haW5faWQsIGFkZHIpOwo+ID4gLSAgICBwcmludGsoIiAgICBUVEJDUjog
MHglMDgiUFJJcmVnaXN0ZXIiXG4iLCB0dGJjcik7Cj4gPiArICAgIHByaW50aygiICAgIFRUQkNS
OiAweCUiUFJJcmVnaXN0ZXIiXG4iLCB0dGJjcik7Cj4gPiAgICAgIHByaW50aygiICAgIFRUQlIw
OiAweCUwMTYiUFJJeDY0IiA9IDB4JSJQUklwYWRkciJcbiIsCj4gPiAgICAgICAgICAgICB0dGJy
MCwgbWZuX3RvX21hZGRyKG1mbikpOwo+IAo+IAo+IC0tIAo+IFZvbG9keW15ciBCYWJjaHVrIGF0
IEVQQU0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
