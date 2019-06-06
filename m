Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E1937821
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 17:36:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYuOv-0004KP-88; Thu, 06 Jun 2019 15:34:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYuOt-0004Je-O3
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 15:33:59 +0000
X-Inumbo-ID: 809c9cd0-8870-11e9-9a27-13577f3e1452
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 809c9cd0-8870-11e9-9a27-13577f3e1452;
 Thu, 06 Jun 2019 15:33:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C75BA78;
 Thu,  6 Jun 2019 08:33:58 -0700 (PDT)
Received: from [10.1.38.31] (unknown [10.1.38.31])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AC833F690;
 Thu,  6 Jun 2019 08:33:56 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <06a4f534-e671-004c-93bb-31b60ed77d28@arm.com> <8736kt8f2z.fsf@epam.com>
 <59439dbd-dce8-072e-4258-4778f38ebe2a@arm.com> <871s098ojd.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0f4e2e6f-5a1c-ffd0-4804-a001b2ff80a5@arm.com>
Date: Thu, 6 Jun 2019 16:33:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <871s098ojd.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 00/10] TEE mediator (and OP-TEE) support
 in XEN
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gNi80LzE5IDI6MzEgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3Rl
Ogo+IAo+IEhlbGxvIEp1bGllbiwKPiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBPbiA2
LzEvMTkgNTowNyBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+Pgo+Pj4gSGkgSnVsaWVu
LAo+Pgo+PiBIaSBWb2xvZHlteXIsCj4+Cj4+PiBKdWxpZW4gR3JhbGwgd3JpdGVzOgo+Pj4KPj4+
PiBIaSBWb2xvZHlteXIsCj4+Pj4KPj4+PiBJIHRyaWVkIHRvIGFwcGx5IHRoZSBwYXRjaGVzIHRv
IHN0YWdpbmcgYnV0IGZhaWwgYmVjYXVzZSB0aGUgcGF0Y2hlcwo+Pj4+IGNvbnRhaW5zID0yMC4g
RG8geW91IGhhdmUgYSB0cmVlIHdpdGggdGhlIHNlcmllcyBhcHBsaWVkPwo+Pj4KPj4+IFN1cmUs
IHlvdSBjYW4gZmluZCB0aGVtIGF0IFsxXQo+Pgo+PiBUaGFuayB5b3UhIFRoZSBicmFuY2ggaXMg
YmFzZWQgb24gbWFzdGVyLiBUaGlzIGlzIGZhaXJseSBiZWhpbmQKPj4gc3RhZ2luZy4gQ291bGQg
eW91IHJlYmFzZSB0aGlzIG9uIHRvcCBvZiBzdGFnaW5nPwo+Pgo+PiBJIHdpbGwgZ28gdGhyb3Vn
aCB0aGUgc2VyaWVzIG5leHQgd2Vlay4gQXMgdGhpcyBpcyBhIHRlY2ggcHJldmlldywgSQo+PiBh
bSBwbGFubmluZyB0byBtZXJnZSB0aGlzIHZlcnNpb24gdW5sZXNzIEkgZmluZCBzb21ldGhpbmcg
aG9ycmlibHkKPj4gd3JvbmcgaW4gaXQuCj4gVGhhbmsgeW91IGZvciByZXZpZXcuIEkgcmVhbGx5
IGFwcHJlY2lhdGUgdGhpcy4KPiAKPiBJIGp1c3Qgd2FudCB0byBjbGFyaWZ5LCB3aGF0IEkgc2hv
dWxkIGRvIG5leHQuIElmIEkgZ290IHlvdSByaWdodCwgSQo+IHNob3VsZCBzZW5kIHY2LCByZWJh
c2VkIG9uIHN0YWdpbmcgYW5kIHdpdGggeW91ciBjb21tZW50cyBhZGRyZXNzZWQuIElzCj4gdGhp
cyByaWdodD8KClllcyBwbGVhc2UuIENhbiB5b3UgY29sbGVjdCB0aGUgYWNrcyBhdCB0aGUgc2Ft
ZSB0aW1lPyBMZXQgbWUga25vdyBpZiAKdGhlcmUgYXJlIGFueSBtYWpvciBjaGFuZ2VzIG9uIHRo
ZSByZWJhc2Ugb24gc3RhZ2luZy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
