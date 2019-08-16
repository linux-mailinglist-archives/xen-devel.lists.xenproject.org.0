Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F190A62
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 23:42:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyjx4-0000HY-Gp; Fri, 16 Aug 2019 21:40:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n1LD=WM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyjx3-0000Er-QO
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 21:40:01 +0000
X-Inumbo-ID: 65ba2d3e-c06e-11e9-813a-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 65ba2d3e-c06e-11e9-813a-bc764e2007e4;
 Fri, 16 Aug 2019 21:39:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73AF7344;
 Fri, 16 Aug 2019 14:39:59 -0700 (PDT)
Received: from [10.37.12.84] (unknown [10.37.12.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C09213F718;
 Fri, 16 Aug 2019 14:39:57 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Jan Beulich <JBeulich@suse.com>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-4-julien.grall@arm.com>
 <85eea744-c2f9-748e-c2a6-8382320b33fd@suse.com>
 <e5e6be74-8af1-c3cb-2b46-a8ab47605825@arm.com>
Message-ID: <336c950c-2485-dec9-f41c-e5e997803c7d@arm.com>
Date: Fri, 16 Aug 2019 22:39:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e5e6be74-8af1-c3cb-2b46-a8ab47605825@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/4] xen/public: Document
 HYPERCALL_console_io()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xNi8xOSA2OjQyIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMDgv
MDgvMjAxOSAxNTowMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA1LjA4LjIwMTkgMTU6Mjks
IEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IEN1cnJlbnRseSwgT1MgZGV2ZWxvcHBlcnMgd2lsbCBo
YXZlIHRvIGxvb2sgYXQgWGVuIGNvZGUgaW4gb3JkZXIgdG8ga25vdwo+Pj4gdGhlIHBhcmFtZXRl
cnMgb2YgYW4gaHlwZXJjYWxsIGFuZCBob3cgaXQgaXMgbWVhbnQgdG8gd29yay4KPj4+Cj4+PiBU
aGlzIGlzIG5vdCBhIHRyaXZpYWwgdGFzayBhcyB5b3UgbWF5IG5lZWQgdG8gaGF2ZSBhIGRlZXAg
dW5kZXJzdGFuZGluZwo+Pj4gb2YgWGVuIGludGVybmFsLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggYXR0
ZW1wdHMgdG8gZG9jdW1lbnQgdGhlIGJlaGF2aW9yIG9mIAo+Pj4gSFlQRVJDQUxMX2NvbnNvbGVf
aW8oKSB0bwo+Pj4gaGVscCBPUyBkZXZlbG9wZXIuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSnVs
aWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4gQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gd2l0aCBhIGNvdXBsZSBvZiBuaXRzOgo+Pgo+Pj4g
LS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3hlbi5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9wdWJs
aWMveGVuLmgKPj4+IEBAIC00ODYsNyArNDg2LDI5IEBAIERFRklORV9YRU5fR1VFU1RfSEFORExF
KG1tdWV4dF9vcF90KTsKPj4+IMKgwqAgLyogYCB9ICovCj4+PiDCoMKgIC8qCj4+PiAtICogQ29t
bWFuZHMgdG8gSFlQRVJWSVNPUl9jb25zb2xlX2lvKCkuCj4+PiArICogYCBpbnQKPj4+ICsgKiBg
IEhZUEVSVklTT1JfY29uc29sZV9pbyh1bnNpZ25lZCBpbnQgY21kLAo+Pj4gKyAqIGDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgY291bnQs
Cj4+PiArICogYMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNo
YXIgYnVmZmVyW10pOwo+Pj4gKyAqCj4+PiArICogQGNtZDogQ29tbWFuZCAoc2VlIGJlbG93KQo+
Pj4gKyAqIEBjb3VudDogU2l6ZSBvZiB0aGUgYnVmZmVyIHRvIHJlYWQvd3JpdGUKPj4+ICsgKiBA
YnVmZmVyOiBQb2ludGVyIGluIHRoZSBndWVzdCBtZW1vcnkKPj4+ICsgKgo+Pj4gKyAqIExpc3Qg
b2YgY29tbWFuZHM6Cj4+PiArICoKPj4+ICsgKsKgICogQ09OU09MRUlPX3dyaXRlOiBXcml0ZSB0
aGUgYnVmZmVyIG9uIFhlbiBjb25zb2xlLgo+Pgo+PiBzLyBvbiAvIHRvIC8gPwo+IAo+IEkgYW0g
bm90IGVudGlyZWx5IHN1cmUuIExvb2tpbmcgb25saW5lIFsxXSAib24iIHdvdWxkIG1ha2Ugc2Vu
c2UgaGVyZS4KPiAKPiBCdXQgSSBhbSBub3QgYSBuYXRpdmUgZW5nbGlzaCBzcGVha2VyLiBAR2Vv
cmdlLCBASWFuLCBAQW5kcmV3LCBhbnkgCj4gb3BpbmlvbnM/CgpTcGVha2luZyB3aXRoIG15IHBh
cnRuZXIgdG9kYXkgKHdobyBpcyBuYXRpdmUgZW5nbGlzaCksICJ0byIgaXMgYWN0dWFsbHkgCnRo
ZSBjb3JyZWN0IHZlcnNpb24gaGVyZS4gU28gSSB3aWxsIHVzZSAidG8iIGhlcmUuCgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
