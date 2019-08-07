Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E1F85303
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 20:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvQhJ-0007Vt-8a; Wed, 07 Aug 2019 18:30:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvQhI-0007OQ-CV
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 18:30:04 +0000
X-Inumbo-ID: 5ddc30a0-b941-11e9-bddc-0f45930ef2e7
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5ddc30a0-b941-11e9-bddc-0f45930ef2e7;
 Wed, 07 Aug 2019 18:30:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCA1028;
 Wed,  7 Aug 2019 11:30:00 -0700 (PDT)
Received: from [10.37.9.94] (unknown [10.37.9.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8D7E3F575;
 Wed,  7 Aug 2019 11:29:59 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-7-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6bf4ba38-0e1d-3302-4bcf-f48b917c31a7@arm.com>
Date: Wed, 7 Aug 2019 19:29:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806214925.7534-7-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 7/7] xen/arm: add reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDgvNi8xOSAxMDo0OSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IFJlc2VydmVkIG1lbW9yeSByZWdpb25zIGFyZSBhdXRvbWF0aWNhbGx5IHJlbWFwcGVkIHRv
IGRvbTAuIFRoZWlyIGRldmljZQo+IHRyZWUgbm9kZXMgYXJlIGFsc28gYWRkZWQgdG8gZG9tMCBk
ZXZpY2UgdHJlZS4gSG93ZXZlciwgdGhlIGRvbTAgbWVtb3J5Cj4gbm9kZSBpcyBub3QgY3VycmVu
dGx5IGV4dGVuZGVkIHRvIGNvdmVyIHRoZSByZXNlcnZlZCBtZW1vcnkgcmVnaW9ucwo+IHJhbmdl
cyBhcyByZXF1aXJlZCBieSB0aGUgc3BlYy4gIFRoaXMgY29tbWl0IGZpeGVzIGl0Lgo+IAo+IENo
YW5nZSBtYWtlX21lbW9yeV9ub2RlIHRvIHRha2UgYSAgc3RydWN0IG1lbWluZm8gKiBpbnN0ZWFk
IG9mIGEKPiBrZXJuZWxfaW5mby4gQ2FsbCBpdCB0d2ljZSBmb3IgZG9tMCwgb25jZSB0byBjcmVh
dGUgdGhlIGZpcnN0IHJlZ3VsYXIKPiBtZW1vcnkgbm9kZSwgYW5kIHRoZSBzZWNvbmQgdGltZSB0
byBjcmVhdGUgYSBzZWNvbmQgbWVtb3J5IG5vZGUgd2l0aCB0aGUKPiByYW5nZXMgY292ZXJpbmcg
cmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMuCj4gCj4gQWxzbywgbWFrZSBhIHNtYWxsIGNvZGUgc3R5
bGUgZml4IGluIG1ha2VfbWVtb3J5X25vZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBT
dGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
