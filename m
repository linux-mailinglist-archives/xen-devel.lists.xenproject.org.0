Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E6985CC6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 10:27:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvdkA-00081D-FM; Thu, 08 Aug 2019 08:25:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvdk9-000818-HK
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 08:25:53 +0000
X-Inumbo-ID: 20d62196-b9b6-11e9-9935-5ba8783836fe
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20d62196-b9b6-11e9-9935-5ba8783836fe;
 Thu, 08 Aug 2019 08:25:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9030CAE49;
 Thu,  8 Aug 2019 08:25:48 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-3-jgross@suse.com>
 <ab0314ec-9af8-e1b3-343c-b7183152418d@suse.com>
 <0db0162e-6d43-7540-4d4a-c53605b57eeb@suse.com>
 <686598d3-b09f-fbad-6115-71188c5ab28c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <423736b9-c420-92f2-6bb6-8a5ac68beb0f@suse.com>
Date: Thu, 8 Aug 2019 10:25:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <686598d3-b09f-fbad-6115-71188c5ab28c@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 2/4] xen: add new CONFIG_SPINLOCK_DEBUG
 option
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
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMDk6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjA4LjIwMTkgMDk6
MjMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA4LjA4LjE5IDA4OjM0LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDA3LjA4LjIwMTkgMTY6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gLS0tIGEveGVuL0tjb25maWcuZGVidWcKPj4+PiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zwo+
Pj4+IEBAIC00NCw2ICs0NCwxMyBAQCBjb25maWcgQ09WRVJBR0UKPj4+PiAgwqDCoMKgwqDCoMKg
wqAgSWYgdW5zdXJlLCBzYXkgTiBoZXJlLgo+Pj4+ICtjb25maWcgU1BJTkxPQ0tfREVCVUcKPj4+
PiArwqDCoMKgIGJvb2wgIlNwaW5sb2NrIGRlYnVnZ2luZyIKPj4+PiArwqDCoMKgIGRlZmF1bHQg
REVCVUcKPj4+PiArwqDCoMKgIC0tLWhlbHAtLS0KPj4+PiArwqDCoMKgwqDCoCBFbmFibGUgZGVi
dWdnaW5nIGZlYXR1cmVzIG9mIHNwaW5sb2NrIGhhbmRsaW5nLsKgIFNvbWUgYWRkaXRpb25hbAo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY2hlY2tzIHdpbGwgYmUgcGVyZm9ybWVkIHdoZW4gYWNx
dWlyaW5nIGFuZCByZWxlYXNpbmcgbG9ja3MuCj4+Pj4gKwo+Pj4+ICDCoCBjb25maWcgTE9DS19Q
Uk9GSUxFCj4+Pgo+Pj4gV2hpbGUgdGhlIHByZS1leGlzdGluZyBMT0NLX1BST0ZJTEUgc3VnZ2Vz
dHMgdGhlIG9wcG9zaXRlLCBJJ2QKPj4+IHN0aWxsIGxpa2UgdG8gcHJvcG9zZSB0aGF0IHdlIHVu
aWZvcm1seSBuYW1lIGFsbCBkZWJ1Z2dpbmcKPj4+IG9wdGlvbnMgQ09ORklHX0RFQlVHXyogKHJh
dGhlciB0aGFuIGhhdmluZyB0aGUgREVCVUcgYXQgdGhlCj4+PiBlbmQpLiBUaG91Z2h0cz8KPj4K
Pj4gRmluZSB3aXRoIG1lLiBJIGNhbiByZW5hbWUgdGhlIExPQ0tfUFJPRklMRSBvcHRpb24gaW4g
cGF0Y2ggNCBhcyBJJ20KPj4gdG91Y2hpbmcgaXQgYW55d2F5Lgo+IAo+IE9uZSBtb3JlIHRoaW5n
OiBQZXJoYXBzIGl0IHdvdWxkIGJldHRlciBiZSBERUJVR19MT0NLIChpLmUuCj4gd2l0aG91dCAi
U1BJTiIpIG9yIERFQlVHX0xPQ0tTLCB0byBhbHNvIGFsbG93IGl0IHRvIGNvdmVyIHIvdwo+IGxv
Y2tzLCBzaG91bGQgYW55b25lIHdhbnQgdG8gaW5zdHJ1bWVudCB0aGVtIGFzIHdlbGwuCgpZZXMu
IEknbGwgc3dpdGNoIHRvIERFQlVHX0xPQ0tTLgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
