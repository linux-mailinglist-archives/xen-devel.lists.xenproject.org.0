Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E123BF8AD1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 09:41:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iURhf-0007Mk-CD; Tue, 12 Nov 2019 08:39:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CoZ6=ZE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iURhd-0007Mb-Ht
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 08:39:09 +0000
X-Inumbo-ID: e45344c0-0527-11ea-a21a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e45344c0-0527-11ea-a21a-12813bfff9fa;
 Tue, 12 Nov 2019 08:39:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CBC3FAF0D;
 Tue, 12 Nov 2019 08:39:07 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191111205514.2779-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb4ffe73-122e-c96a-114b-b8ed6e74f29c@suse.com>
Date: Tue, 12 Nov 2019 09:39:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191111205514.2779-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: Fix passthrough following c/s
 d7cfeb7c13e
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Jennifer Herbert <jennifer.herbert@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTEuMjAxOSAyMTo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAiQU1EL0lPTU1VOiBk
b24ndCBibGluZGx5IGFsbG9jYXRlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGVzIiBpbnRyb2R1
Y2VzIGEKPiBjYWxsIGF0IHJ1bnRpbWUgZnJvbSBhbWRfaW9tbXVfYWRkX2RldmljZSgpIHRvIGFt
ZF9pb21tdV9zZXRfaW50cmVtYXBfdGFibGUoKQo+IHdoaWNoIGlzIHN0aWxsIG1hcmtlZCBhcyBf
X2luaXQuCj4gCj4gT24gb25lIEFNRCBSb21lIG1hY2hpbmUgd2UgaGF2ZSwgdGhpcyByZXN1bHRz
IGluIGEgY3Jhc2ggdGhlIG1vbWVudCB3ZSB0cnkgdG8KPiB1c2UgYW4gU1ItSU9WIFZGIGluIGEg
Vk0uCj4gCj4gUmVwb3J0ZWQtYnk6IEplbm5pZmVyIEhlcmJlcnQgPGplbm5pZmVyLmhlcmJlcnRA
Y2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCkknbSBzb3JyeSBmb3IgdGhlIGJyZWFrYWdlIC0gSSByZWNhbGwgaGF2aW5nIG1hZGUgdGhl
IGNoYW5nZSwgc28gSSBtdXN0CmhhdmUgbG9zdCBpdCBhdCBzb21lIHBvaW50LgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
