Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1147C17921F
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:14:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Uln-0002qK-Bn; Wed, 04 Mar 2020 14:13:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9Ull-0002q3-Mk
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:13:05 +0000
X-Inumbo-ID: 43152638-5e22-11ea-a3ec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43152638-5e22-11ea-a3ec-12813bfff9fa;
 Wed, 04 Mar 2020 14:13:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 24E54B2AC;
 Wed,  4 Mar 2020 14:13:03 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-10-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ca632bd-4712-d9fe-f7a9-852465fc4dbd@suse.com>
Date: Wed, 4 Mar 2020 15:13:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-10-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 09/23] xen/build: extract clean
 target from Rules.mk
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@gmail.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gRnJvbTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGdtYWlsLmNvbT4KPiAKPiBNb3N0IG9mIHRoZSBjb2Rl
IGV4ZWN1dGVkIGJ5IFJ1bGVzLm1rIGlzbid0IG5lY2Vzc2FyeSBmb3IgdGhlIGNsZWFuCj4gdGFy
Z2V0LCBlc3BlY2lhbGx5IG5vdCB0aGUgQ0ZMQUdTLiBUaGlzIHBhdGNoIG1ha2VzIHJ1bm5pbmcg
bWFrZSBjbGVhbgo+IG11Y2ggZmFzdGVyLgo+IAo+IFRoZSBwYXRjaCBleHRyYWN0IHRoZSBjbGVh
biB0YXJnZXQgaW50byBhIGRpZmZlcmVudCBNYWtlZmlsZSwKPiBNYWtlZmlsZS5jbGVhbi4KPiAK
PiBTaW5jZSBNYWtlZmlsZS5jbGVhbiwgZG9lc24ndCB3YW50IHRvIGluY2x1ZGUgQ29uZmlnLm1r
LCB3ZSBuZWVkIHRvCj4gZGVmaW5lIHRoZSB2YXJpYWJsZXMgREVQU19JTkNMVURFIGFuZCBERVBT
IGluIGEgcGxhY2UgY29tbW9uIHRvCj4gUnVsZXMubWsgYW5kIE1ha2VmaWxlLmNsZWFuLCB0aGlz
IGlzIEtidWlsZC5pbmNsdWRlLiBERVBTX1JNIGlzIG9ubHkKPiBuZWVkZWQgaW4gTWFrZWZpbGUu
Y2xlYW4gc28gY2FuIGJlIGRlZmluZWQgdGhlcmUuCj4gCj4gRXZlbiBzbyBSdWxlcy5tayBpbmNs
dWRlcyBDb25maWcubWssIGl0IGluY2x1ZGVzIEtidWlsZC5pbmNsdWRlIGFmdGVyLAo+IHNvIHRo
ZSBlZmZlY3RpdmUgZGVmaW5pdGlvbiBvZiBERVBTX0lOQ0xVREUgaXMgInhlbi8iIG9uZSBhbmQg
dGhlCj4gc2FtZSBvbmUgYXMgdXNlZCBieSBNYWtlZmlsZS5jbGVhbi4KPiAKPiBUaGlzIGlzIGlu
c3BpcmVkIGJ5IEtidWlsZCwgd2l0aCBNYWtlZmlsZS5jbGVhbiBwYXJ0aWFsbHkgY29waWVkIGZy
b20KPiBMaW51eCB2NS40Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
