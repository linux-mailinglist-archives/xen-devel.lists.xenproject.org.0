Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED983B1D
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 23:31:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv6zq-0007nr-T6; Tue, 06 Aug 2019 21:27:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/mMd=WC=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv6zp-0007nm-M5
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 21:27:53 +0000
X-Inumbo-ID: 0bde0f0e-b891-11e9-8510-131af2a578a3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0bde0f0e-b891-11e9-8510-131af2a578a3;
 Tue, 06 Aug 2019 21:27:52 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 811AC2075B;
 Tue,  6 Aug 2019 21:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565126871;
 bh=91gmSdrXTaEmqscgl05SYE7Ga3gdig1XYB4nyenR1Ck=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=F1T7WUkK/IBytURuUgN2vkRdJmXXyVNwH54iX2LLEHcTIp1UF/YtwLsKkT2modTir
 RlK7ebqU6FRdxDPxb5rNQVB3ZZmzDrft+8j/Wq2QTkhp+fUxlM6LZNYKZtnUzF1Wvf
 twJJ+sMM8Jx5jsofSnegAf99FTC8cOQh3AMhGx8I=
Date: Tue, 6 Aug 2019 14:27:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <3155e28e-24b4-2cbe-8970-1f1feadd5395@arm.com>
Message-ID: <alpine.DEB.2.21.1908061427090.2451@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-6-sstabellini@kernel.org>
 <3155e28e-24b4-2cbe-8970-1f1feadd5395@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 6/6] xen/arm: add reserved-memory regions
 to the dom0 memory node
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMCBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIFN0ZWZhbm8sCj4g
Cj4gT24gNi8yMi8xOSAxMjo1NiBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gUmVz
ZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMgYXJlIGF1dG9tYXRpY2FsbHkgcmVtYXBwZWQgdG8gZG9tMC4g
VGhlaXIgZGV2aWNlCj4gPiB0cmVlIG5vZGVzIGFyZSBhbHNvIGFkZGVkIHRvIGRvbTAgZGV2aWNl
IHRyZWUuIEhvd2V2ZXIsIHRoZSBkb20wIG1lbW9yeQo+ID4gbm9kZSBpcyBub3QgY3VycmVudGx5
IGV4dGVuZGVkIHRvIGNvdmVyIHRoZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucwo+ID4gcmFuZ2Vz
IGFzIHJlcXVpcmVkIGJ5IHRoZSBzcGVjLiAgVGhpcyBjb21taXQgZml4ZXMgaXQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4K
PiA+IC0tLQo+ID4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAxNyArKysrKysrKysr
KysrKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiBpbmRleCA3NmRkNGJmNmY5Li41MDQ3ZWI0
YzI4IDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gPiArKysg
Yi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiA+IEBAIC02NDMsNyArNjQzLDggQEAgc3Rh
dGljIGludCBfX2luaXQgbWFrZV9tZW1vcnlfbm9kZShjb25zdCBzdHJ1Y3QgZG9tYWluCj4gPiAq
ZCwKPiA+ICAgewo+ID4gICAgICAgaW50IHJlcywgaTsKPiA+ICAgICAgIGludCByZWdfc2l6ZSA9
IGFkZHJjZWxscyArIHNpemVjZWxsczsKPiA+IC0gICAgaW50IG5yX2NlbGxzID0gcmVnX3NpemUq
a2luZm8tPm1lbS5ucl9iYW5rczsKPiA+ICsgICAgaW50IG5yX2NlbGxzID0gcmVnX3NpemUgKiAo
a2luZm8tPm1lbS5ucl9iYW5rcyArIChpc19oYXJkd2FyZV9kb21haW4oZCkKPiA+ID8KPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLm5yX2Jh
bmtzIDogMCkpOwo+IAo+IEEgZGV2aWNlLXRyZWUgaXMgYWxsb3dlZCB0byBoYXZlIG11bHRpcGxl
IG1lbW9yeSBub2RlLiBTbyBJIHdvdWxkIGFjdHVhbGx5Cj4gcHJlZmVyIGlmIHdlIGNyZWF0ZSBh
IG5ldyBub2RlIGZvciB0aGUgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMuCj4gCj4gWW91IGNvdWxk
IHJlcGxhY2UgdGhlIGxhc3QgcGFyYW1ldGVyIHdpdGggc3RydWN0IG1lbWluZm8gKi4gTm90ZSB0
aGF0IHlvdQo+IHdvdWxkIG5lZWQgdG8gc3BlY2lmeSBhIHVuaXQgaW4gdGhlIG5vZGUtbmFtZS4K
ClllcywgbWFrZXMgc2Vuc2UsIGdvb2Qgc3VnZ2VzdGlvbi4KCgo+ID4gICAgICAgX19iZTMyIHJl
Z1tOUl9NRU1fQkFOS1MgKiA0IC8qIFdvcnN0IGNhc2UgYWRkcmNlbGxzICsgc2l6ZWNlbGxzICov
XTsKPiA+Cj4gTm90ZSB0aGF0IHlvdSB3aWxsIG92ZXJydW4gcmVnIGhlcmUgaWYgdGhlIHR3byBh
cnJheXMgKHJlc2VydmVkX21lbSBhbmQgbWVtKQo+IGFyZSBmdWxsLgoKV29uJ3QgYmUgYSBwcm9i
bGVtIGFueW1vcmUgYWZ0ZXIgbWFraW5nIHRoZSBzdWdnZXN0ZWQgY2hhbmdlcy4KCgo+ID4gICAg
ICAgX19iZTMyICpjZWxsczsKPiA+ICAgQEAgLTY3Myw2ICs2NzQsMjAgQEAgc3RhdGljIGludCBf
X2luaXQgbWFrZV9tZW1vcnlfbm9kZShjb25zdCBzdHJ1Y3QKPiA+IGRvbWFpbiAqZCwKPiA+ICAg
ICAgICAgICBkdF9jaGlsZF9zZXRfcmFuZ2UoJmNlbGxzLCBhZGRyY2VsbHMsIHNpemVjZWxscywg
c3RhcnQsIHNpemUpOwo+ID4gICAgICAgfQo+ID4gICArICAgIGlmICggaXNfaGFyZHdhcmVfZG9t
YWluKGQpICkKPiA+ICsgICAgewo+ID4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBib290aW5m
by5yZXNlcnZlZF9tZW0ubnJfYmFua3M7IGkrKyApCj4gPiArICAgICAgICB7Cj4gPiArICAgICAg
ICAgICAgdTY0IHN0YXJ0ID0gYm9vdGluZm8ucmVzZXJ2ZWRfbWVtLmJhbmtbaV0uc3RhcnQ7Cj4g
PiArICAgICAgICAgICAgdTY0IHNpemUgPSBib290aW5mby5yZXNlcnZlZF9tZW0uYmFua1tpXS5z
aXplOwo+ID4gKwo+ID4gKyAgICAgICAgICAgIGR0X2RwcmludGsoIiAgQmFuayAlZDogJSMiUFJJ
eDY0Ii0+JSMiUFJJeDY0IlxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgIGksIHN0YXJ0LCBz
dGFydCArIHNpemUpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgIGR0X2NoaWxkX3NldF9yYW5nZSgm
Y2VsbHMsIGFkZHJjZWxscywgc2l6ZWNlbGxzLCBzdGFydCwgc2l6ZSk7Cj4gPiArICAgICAgICB9
Cj4gPiArICAgIH0KPiA+ICsKPiA+ICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShmZHQsICJyZWci
LCByZWcsIG5yX2NlbGxzICogc2l6ZW9mKCpyZWcpKTsKPiA+ICAgICAgIGlmICggcmVzICkKPiA+
ICAgICAgICAgICByZXR1cm4gcmVzOwo+ID4gCj4gCj4gQ2hlZXJzLAo+IAo+IC0tIAo+IEp1bGll
biBHcmFsbAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
