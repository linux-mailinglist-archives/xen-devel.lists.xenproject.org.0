Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 964352542A
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 17:39:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT6oN-00068w-PY; Tue, 21 May 2019 15:36:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jEEf=TV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hT6oL-00068o-Sl
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 15:36:17 +0000
X-Inumbo-ID: 2c353c2c-7bde-11e9-922a-732d936cfb3a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c353c2c-7bde-11e9-922a-732d936cfb3a;
 Tue, 21 May 2019 15:36:17 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E07B2173C;
 Tue, 21 May 2019 15:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558452976;
 bh=hmfbX1qVwnU5y2XJgqxrJQqv3T8uKI0YR0JgXJ1E4+I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=BlxCNNHE2woyxc0hYzmeRv8wicYZTw8LBSTmuIHCHtYnEBCt4yf1FTFGVGqdF9RIt
 UJyusBmTPbx4IHjbslL+LjK6QhD5Oiz4vqCO8QmNUxLl8jKCVC+qEMQtGgF+wIPWUq
 CtTqrI9AfTgF4pYkVw9JrzaoHu7uMZSFMK86v5Gc=
Date: Tue, 21 May 2019 08:36:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190521142913.22394-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1905210836050.16404@sstabellini-ThinkPad-T480s>
References: <20190521142913.22394-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm64: livepatch: Fix build after
 03957f58db
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMSBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IENvbW1pdCAwMzk1N2Y1
OGRiICJ4ZW4vY29uc3Q6IEV4dGVuZCB0aGUgZXhpc3RpbmcgbWFjcm8gQklUIHRvIHRha2UgYQo+
IHN1ZmZpeCBpbiBwYXJhbWV0ZXIiIGRpZG4ndCBjb252ZXJ0IGFsbCB0aGUgY2FsbGVycyBvZiB0
aGUgbWFjcm8gQklULgo+IAo+IFRoaXMgd2lsbCByZXN1bHQgdG8gYSBidWlsZCBicmVha2FnZSB3
aGVuIGVuYWJsaW5nIExpdmVwYXRjaCBvbiBhcm02NC4KPiAKPiBSZXBvcnRlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJt
NjQvbGl2ZXBhdGNoLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvbGl2ZXBh
dGNoLmMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbGl2ZXBhdGNoLmMKPiBpbmRleCAyMjQ3YjkyNWEw
Li41Yzc1Nzc5Mjg0IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0Y2gu
Ywo+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm02NC9saXZlcGF0Y2guYwo+IEBAIC0yMDgsNyArMjA4
LDcgQEAgc3RhdGljIGludCByZWxvY19pbnNuX2ltbShlbnVtIGFhcmNoNjRfcmVsb2Nfb3Agb3As
IHZvaWQgKmRlc3QsIHU2NCB2YWwsCj4gICAgICBzdmFsID4+PSBsc2I7Cj4gIAo+ICAgICAgLyog
RXh0cmFjdCB0aGUgdmFsdWUgYml0cyBhbmQgc2hpZnQgdGhlbSB0byBiaXQgMC4gKi8KPiAtICAg
IGltbV9tYXNrID0gKEJJVChsc2IgKyBsZW4pIC0gMSkgPj4gbHNiOwo+ICsgICAgaW1tX21hc2sg
PSAoQklUKGxzYiArIGxlbiwgVUwpIC0gMSkgPj4gbHNiOwo+ICAgICAgaW1tID0gc3ZhbCAmIGlt
bV9tYXNrOwo+ICAKPiAgICAgIC8qIFVwZGF0ZSB0aGUgaW5zdHJ1Y3Rpb24ncyBpbW1lZGlhdGUg
ZmllbGQuICovCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
