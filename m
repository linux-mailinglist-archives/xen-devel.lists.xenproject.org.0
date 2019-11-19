Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A510203F
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 10:26:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWzjb-0006gx-3b; Tue, 19 Nov 2019 09:23:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWzjZ-0006go-BZ
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 09:23:41 +0000
X-Inumbo-ID: 4521b706-0aae-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4521b706-0aae-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 09:23:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2F287B07D;
 Tue, 19 Nov 2019 09:23:38 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <8c928769-c0ea-8a48-3bda-aba7d17133ba@bitdefender.com>
 <9141e27c-edd4-301a-ee76-e3fcf5e787af@suse.com>
 <559c1807-2f5d-2267-c563-448c0bd88725@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b653b14f-bf46-85ef-c412-876d5ad26ade@suse.com>
Date: Tue, 19 Nov 2019 10:23:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <559c1807-2f5d-2267-c563-448c0bd88725@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxMDowNSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTguMTEuMjAxOSAxNjowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE4LjExLjIwMTkgMTQ6
MzksIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gRm9yIHRoaXMgSFZNT1BfQUxU
UDJNX0lOVEVSRkFDRV9WRVJTSU9OIHNob3V0IGJlIGluY3JlYXNlZC4gSSB3aWxsIGxlYXZlCj4+
PiBpdCB0byBUYW1hcyB0byBkZWNpZGUgaWYgd2Ugd2lsbCBuZWVkIGEgZGlmZmVyZW50IHN0cnVj
dHVyZSBmb3IKPj4+IHhlbl9odm1fYWx0cDJtX3N1cHByZXNzX3ZlX211bHRpIHRvIGtlZXAgdGhl
IGNvbXBhdGliaWxpdHkuCj4+Cj4+IFdhc24ndCBpcyB0aGF0IGR1ZSB0byB0aGUgcG9zc2libGUg
Z3Vlc3QgZXhwb3N1cmUgaXQgd2FzIGRlY2lkZWQKPj4gdGhhdCB0aGUgaW50ZXJmYWNlIHZlcnNp
b24gYXBwcm9hY2ggd2FzIG5vdCBzdWl0YWJsZSBoZXJlLCBhbmQgaGVuY2UKPj4gaXQgc2hvdWxk
bid0IGJlIGJ1bXBlZCBhbnkgZnVydGhlcj8KPj4KPiAKPiBUaGF0IGlzIGNvcnJlY3QgYnV0IHRo
ZXJlIHdhcyBhbHNvIHJlcXVlc3RlZCB0byBhZGQgdGhlIG5ldyBvcGFxdWUgZmllbGQgCj4gc28g
SSBkb24ndCBrbm93IGhvdyB0byBoYXZlIHRoYXQgYW4gc3RpbGwga2VlcCB0aGUgc2FtZSB2ZXJz
aW9uLgoKTmV3IHN1Yi1vcD8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
