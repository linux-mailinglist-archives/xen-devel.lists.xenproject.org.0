Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4B57322D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:50:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqIY7-0001FJ-GO; Wed, 24 Jul 2019 14:47:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mQw0=VV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqIY6-0001FE-1c
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:47:22 +0000
X-Inumbo-ID: f039ebc5-ae21-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f039ebc5-ae21-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 14:47:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A900E28;
 Wed, 24 Jul 2019 07:47:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1264E3F71A;
 Wed, 24 Jul 2019 07:47:17 -0700 (PDT)
To: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <b947a9eee2bb43d490ddb4f9378f2ff5@dornerworks.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e85ac1a4-4ef4-3423-35f3-6796f45b72b2@arm.com>
Date: Wed, 24 Jul 2019 15:47:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b947a9eee2bb43d490ddb4f9378f2ff5@dornerworks.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/2] Raspberry Pi 4 support
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaGFuayB5b3UgZm9yIHlvdXIgc2VyaWVzLiBQbGVhc2UgdXNlIGdpdC1zZW5kLWVtYWls
IHNvIHlvdXIgc2VyaWVzIGlzIHRocmVhZGVkIApjb3JyZWN0bHkgYW5kIHNlbnQgaW4gcGxhaW4g
dGV4dCAobm90IEhUTUwhKS4KCk9uIDI0LzA3LzIwMTkgMTU6MzQsIFN0ZXdhcnQgSGlsZGVicmFu
ZCB3cm90ZToKPiBUaGlzIGlzIGEgc2VyaWVzIHRvIGVuYWJsZSBwcmludGsgYW5kIFVBUlQgY29u
c29sZSBmb3IgUmFzcGJlcnJ5IFBpIDQuCj4gCj4gSSBoYXZlIGJlZW4gYWJsZSB0byBnZXQgWGVu
K2RvbTArZG9tVXMgYm9vdGluZy4gVGVzdGVkIHdpdGggWGVuIDQuMTIgYW5kIExpbnV4IAo+IDQu
MTkueSAoUmFzcGJlcnJ5IFBpIGxpbnV4IHRyZWUgKyBhIGNvdXBsZSBvZiBwYXRjaGVzKS4gUGxl
YXNlIHNlZSBbMV0gZm9yIGJ1aWxkIAo+IGluc3RydWN0aW9ucyBhbmQgbGltaXRhdGlvbnMuCgpJ
IGd1ZXNzIHlvdSBhcmUgbm90IHVzaW5nIEFuZHJlJ3MgQVRGIHBvcnQ/IElmIHlvdSBhcmUsIHRo
ZW4gWGVuIDQuMTIgaXMgCmRlZmluaXRlbHkgbm90IHNhZmUgb24gdGhhdCBwbGF0Zm9ybSBiZWNh
dXNlIHdlIGRvbid0IGhhbmRsZSByZXNlcnZlZC1yZWdpb24geWV0IAphbmQgdGhlcmVmb3JlIFhl
biBtYXkgcmUtdXNlIHNvbWUgb2YgdGhvc2UgcmVnaW9ucy4KCkFsc28sIHRoZXJlIGEgZmV3IG90
aGVyIGludGVyZXN0aW5nIHByb2JsZW1zIHdpdGggdGhlIFJQSTQgdGhhdCB3aWxsIG5lZWQgdG8g
YmUgCnNvbHZlZDoKICAgIDEpIFRoZSBVQVJUIGlzIHNoYXJpbmcgdGhlIHNhbWUgcGFnZSBhcyBz
b21lIG90aGVyIGRldmljZXMuIFdlIGVpdGhlciBuZWVkIAp0byBibGFja2xpc3QgdGhlbSBzbyB0
aGV5IGNhbid0IGJlIHVzZWQgYnkgYSBndWVzdCAoaW5jbHVkaW5nIERvbTApLCBvciB3ZSBuZWVk
IAp0byB0cmFwIGFuZCBzYW5pdGl6ZSBhY2Nlc3MuCiAgICAyKSBYZW4gaXMgbWFwcGluZyBtZW1v
cnkgdXNpbmcgMUdCIG1hcHBpbmcuIEFGQUlLLCB0aGVyZSBhcmUgMUdCIHNsb3QgdGhhdCAKaXMg
c2hhcmVkIGJldHdlZW4gUkFNIGFuZCBNTUlPLiBUaGlzIHdpbGwgcmVzdWx0IHRvIGNhY2hlIGlu
Y29oZXJlbmN5LgoKPiAKPiBBbmRyZSDigJMgaXQgYXBwZWFycyB0aGF0IHdlIGVhY2ggaW5kZXBl
bmRlbnRseSBjYW1lIHVwIHdpdGggYSBwcmludGsgCj4gY29uZmlndXJhdGlvbiBbMl0uIFdpdGgg
dGhpcyBzZXJpZXMsIHlvdeKAmWQgbm8gbG9uZ2VyIG5lZWQgdG8gcmVtZW1iZXIgdGhlIGJhc2Ug
Cj4gYWRkcmVzcywganVzdCBkbyBDT05GSUdfRUFSTFlfUFJJTlRLPXJwaTQuCgpQbGVhc2Ugbm8g
bW9yZSBlYXJseXByaW50ayBhbGlhcy4gVGhlcmUgYXJlIG5vIHJlYWwgdmFsdWUgZm9yIHRoZW0g
b3RoZXIgdGhhbiAKY2x1dHRlcmluZyBhIGJpdCBtb3JlIFJ1bGVzLm1rLgoKVGhpcyBwbGF0Zm9y
bSB3aWxsIGRlZmluaXRlbHkgbmVlZCBzb21lIGRvY3VtZW50YXRpb24gYXMgc3VwcG9ydCBpcyBz
dGlsbCBXSVAuIApTbyB0aGUgZWFybHlwcmludGsgY29uZmlndXJhdGlvbiBjYW4gYmUgd3JpdHRl
biBpbiB0aGUgd2lraSBwYWdlLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
