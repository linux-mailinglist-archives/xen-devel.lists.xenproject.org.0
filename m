Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A23D67B447
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 22:21:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYbI-0004Q7-Gy; Tue, 30 Jul 2019 20:20:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsYbG-0004Q0-OQ
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 20:19:58 +0000
X-Inumbo-ID: 668f8d72-b307-11e9-971b-bbdc207585c1
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 668f8d72-b307-11e9-971b-bbdc207585c1;
 Tue, 30 Jul 2019 20:19:58 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62A2C20693;
 Tue, 30 Jul 2019 20:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564517997;
 bh=5rpaHBTNjLKpzjQLyM0P2I/HdgGOPMJHzqUMCoBPTYY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=yWO93GYsY2yEgC6kFNHrtTaB5rN0Yn0Vob81G3boXcbsvAU9LSgLIJw1t+H3CupuH
 NfztOOASxsG4wQ1++U6ATLxeYO1SjhtOOPdbczEIn1jiTF9wkMnX5XLxn29SBWIP/i
 zBzfQMkL4jwCvYXSBEauPsBSh7XfOsRojqJlZJo4=
Date: Tue, 30 Jul 2019 13:19:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-29-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301319440.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-29-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 28/35] xen/arm32: head: Document
 enable_mmu()
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IERvY3VtZW50IHRoZSBi
ZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdpdGhpbiBlbmFibGVfbW11KCku
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
ClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
CgoKPiAtLS0KPiAgICAgQ2hhbmdlcyBpbiB2MjoKPiAgICAgICAgIC0gUGF0Y2ggYWRkZWQKPiAt
LS0KPiAgeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0z
Mi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gaW5kZXggZWY4OTc5OTU5Yi4u
NDA4MWE1MmRmYSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4gKysr
IGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+IEBAIC00MjIsNiArNDIyLDEzIEBAIHZpcnRw
aHlzX2NsYXNoOgo+ICAgICAgICAgIGIgICAgIGZhaWwKPiAgRU5EUFJPQyhjcmVhdGVfcGFnZV90
YWJsZXMpCj4gIAo+ICsvKgo+ICsgKiBUdXJuIG9uIHRoZSBEYXRhIENhY2hlIGFuZCB0aGUgTU1V
LiBUaGUgZnVuY3Rpb24gd2lsbCByZXR1cm4gb24gdGhlIDE6MQo+ICsgKiBtYXBwaW5nLiBJbiBv
dGhlciB3b3JkLCB0aGUgY2FsbGVyIGlzIHJlc3BvbnNpYmxlIHRvIHN3aXRjaCB0byB0aGUgcnVu
dGltZQo+ICsgKiBtYXBwaW5nLgo+ICsgKgo+ICsgKiBDbG9iYmVycyByMCAtIHIzCj4gKyAqLwo+
ICBlbmFibGVfbW11Ogo+ICAgICAgICAgIFBSSU5UKCItIFR1cm5pbmcgb24gcGFnaW5nIC1cclxu
IikKPiAgCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
