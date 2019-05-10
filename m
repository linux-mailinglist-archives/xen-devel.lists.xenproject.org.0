Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FFB19F73
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 16:40:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6f5-0003VA-NR; Fri, 10 May 2019 14:38:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP6f4-0003V4-FR
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:38:10 +0000
X-Inumbo-ID: 3af9f960-7331-11e9-984f-87e95d3d2dc0
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3af9f960-7331-11e9-984f-87e95d3d2dc0;
 Fri, 10 May 2019 14:38:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D296FA78;
 Fri, 10 May 2019 07:38:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4EC93F73C;
 Fri, 10 May 2019 07:38:07 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
 <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
Message-ID: <4b1d9bf6-bf3b-a5ec-da06-534618bb34a8@arm.com>
Date: Fri, 10 May 2019 15:38:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/7] xen/arm: page: Clarify the Xen TLBs
 helpers name
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
Cc: xen-devel@lists.xenproject.org, nd@arm.com,
 Andrii Anisov <Andrii_Anisov@epam.com>, Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDUvMjAxOSAyMjo0NiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDA5
LzA1LzIwMTkgMjE6MzIsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGksCj4+Cj4+IE9uIDA5LzA1
LzIwMTkgMjE6MTMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFdlZCwgOCBNYXkg
MjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IMKgIC8qIFJlbGVhc2UgYWxsIF9faW5pdCBh
bmQgX19pbml0ZGF0YSByYW5nZXMgdG8gYmUgcmV1c2VkICovCj4+Pj4gZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvcGFnZS5oIAo+Pj4+IGIveGVuL2luY2x1ZGUvYXNtLWFy
bS9hcm0zMi9wYWdlLmgKPj4+PiBpbmRleCA0MGE3N2RhYTlkLi4wYjQxYjkyMTRiIDEwMDY0NAo+
Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvcGFnZS5oCj4+Pj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9hcm0zMi9wYWdlLmgKPj4+PiBAQCAtNjEsMTIgKzYxLDggQEAgc3Rh
dGljIGlubGluZSB2b2lkIGludmFsaWRhdGVfaWNhY2hlX2xvY2FsKHZvaWQpCj4+Pj4gwqDCoMKg
wqDCoCBpc2IoKTvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyog
U3luY2hyb25pemUgZmV0Y2hlZCBpbnN0cnVjdGlvbiBzdHJlYW0uICovCj4+Pj4gwqAgfQo+Pj4+
IC0vKgo+Pj4+IC0gKiBGbHVzaCBhbGwgaHlwZXJ2aXNvciBtYXBwaW5ncyBmcm9tIHRoZSBkYXRh
IFRMQiBvZiB0aGUgbG9jYWwKPj4+PiAtICogcHJvY2Vzc29yLiBUaGlzIGlzIG5vdCBzdWZmaWNp
ZW50IHdoZW4gY2hhbmdpbmcgY29kZSBtYXBwaW5ncyBvcgo+Pj4+IC0gKiBmb3Igc2VsZiBtb2Rp
ZnlpbmcgY29kZS4KPj4+PiAtICovCj4+Pj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBmbHVzaF94ZW5f
ZGF0YV90bGJfbG9jYWwodm9pZCkKPj4+PiArLyogRmx1c2ggYWxsIGh5cGVydmlzb3IgbWFwcGlu
Z3MgZnJvbSB0aGUgVExCIG9mIHRoZSBsb2NhbCBwcm9jZXNzb3IuICovCj4+Pgo+Pj4gSSByZWFs
aXplIHRoYXQgdGhlIHN0YXRlbWVudCAiVGhpcyBpcyBub3Qgc3VmZmljaWVudCB3aGVuIGNoYW5n
aW5nIGNvZGUKPj4+IG1hcHBpbmdzIG9yIGZvciBzZWxmIG1vZGlmeWluZyBjb2RlIiBpcyBub3Qg
cXVpdGUgYWNjdXJhdGUsIGJ1dCBJIHdvdWxkCj4+PiBwcmVmZXIgbm90IHRvIHJlbW92ZSBpdCBj
b21wbGV0ZWx5LiBJdCB3b3VsZCBiZSBnb29kIHRvIHJldGFpbiBhIHdhcm5pbmcKPj4+IHNvbWV3
aGVyZSBhYm91dCBJQyBiZWVuIG5lZWRlZCB3aGVuIGNoYW5naW5nIFhlbidzIG93biBtYXBwaW5n
cy4gTWF5YmUKPj4+IG9uIHRvcCBvZiBpbnZhbGlkYXRlX2ljYWNoZV9sb2NhbD8KPj4KPj4gQ2Fu
IHlvdSBwbGVhc2UgZXhwYW5kIGluIHdoaWNoIGNpcmN1bXN0YW5jZSB5b3UgbmVlZCB0byBpbnZh
bGlkIHRoZSAKPj4gaW5zdHJ1Y3Rpb24gY2FjaGUgd2hlbiBjaGFuZ2luZyBYZW4ncyBvd24gbWFw
cGluZ3M/Cj4gCj4gUmVhZGluZyB0aGUgQXJtdjcgKEIzLjExLjIgaW4gQVJNIERESSAwNDA2Qy5j
KSBhbmQgQXJtdjggKEQ1LjExLjIgaW4gQVJNIERESSAKPiAwNDg3RC5hKSwgbW9zdCBvZiB0aGUg
aW5zdHJ1Y3Rpb24gY2FjaGVzIGltcGxlbWVudCB0aGUgSVZJUFQgZXh0ZW5zaW9uLiBUaGlzIAo+
IG1lYW5zIHRoYXQgaW5zdHJ1Y3Rpb24gY2FjaGUgbWFpbnRlbmFuY2UgaXMgcmVxdWlyZWQgb25s
eSBhZnRlciB3cml0ZSBuZXcgZGF0YSAKPiB0byBhIFBBIHRoYXQgaG9sZHMgaW5zdHJ1Y3Rpb25z
IChzZWUgRDUtMjUyMiBpbiBBUk0gRERJIDA0ODdELmEgYW5kIEIzLjExLjIgaW4gCj4gQVJNIERE
SSAwNDA2Qy5jKS4KPiAKPiBUaGUgb25seSBvbmUgdGhhdCBkaWZmZXJzIHdpdGggdGhhdCBiZWhh
dmlvciBpcyBBU0lEIGFuZCBWTUlEIHRhZ2dlZCBWSVZUIAo+IGluc3RydWN0aW9uIGNhY2hlcyB3
aGljaCBpcyBvbmx5IHByZXNlbnQgaW4gQXJtdjcgKEkgY2FuJ3QgcmVtZW1iZXIgd2h5IGl0IHdh
cyAKPiBkcm9wcGVkIGluIEFybXY4KS4gSW5zdHJ1Y3Rpb24gY2FjaGUgbWFpbnRlbmFuY2UgY2Fu
IGJlIHJlcXVpcmVkIHdoZW4gY2hhbmdpbmcgCj4gdGhlIHRyYW5zbGF0aW9uIG9mIGEgdmlydHVh
bCBhZGRyZXNzIHRvIGEgcGh5c2ljYWwgYWRkcmVzcy4KCkkgdGhvdWdodCBhYm91dCB0aGlzIGEg
Yml0IG1vcmUgYW5kIGNoYXQgd2l0aCBteSB0ZWFtIGF0IEFybS4gWGVuIG9uIEFybSBvbmx5IApz
dXBwb3J0IENvcnRleC1BNywgQ29ydGV4LUExNSBhbmQgQnJhaG1hIDE1IChzZWUgdGhlIENQVSBJ
RCBjaGVjayBpbiBhcm0zMi9oZWFkLlMpLgoJCk5vbmUgb2YgdGhlbSBhcmUgYWN0dWFsbHkgdXNp
bmcgVklWVCBpbnN0cnVjdGlvbiBjYWNoZXMuIEluIGdlbmVyYWwsIFZJVlQgY2FjaGVzIAphcmUg
bW9yZSBkaWZmaWN1bHQgdG8gZGVhbCB3aXRoIGJlY2F1c2UgdGhleSByZXF1aXJlIG1vcmUgZmx1
c2guIFNvIEkgd291bGQgYmUgCm1vcmUgaW5jbGluZSB0byBkZW55IGJvb3RpbmcgWGVuIG9uIHBs
YXRmb3JtIHdoZXJlIHRoZSBpbnN0cnVjdGlvbiBjYWNoZXMgZG9uJ3QgCnN1cHBvcnQgSVZJVlQg
ZXh0ZW5zaW9uLgoKSSBkb24ndCB0aGluayB0aGF0IHdpbGwgaGF2ZSBhIG1ham9yIGltcGFjdCBv
biB0aGUgdXNlciBiZWNhdXNlIG9mIG15IHBvaW50IGFib3ZlLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
