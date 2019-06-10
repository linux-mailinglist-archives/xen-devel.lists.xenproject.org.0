Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 454783BDFE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 23:05:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haRS4-00012g-Cz; Mon, 10 Jun 2019 21:03:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haRS2-00012b-Vg
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 21:03:35 +0000
X-Inumbo-ID: 34c20f7e-8bc3-11e9-b6ab-1ffc7ec5491f
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 34c20f7e-8bc3-11e9-b6ab-1ffc7ec5491f;
 Mon, 10 Jun 2019 21:03:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E25344;
 Mon, 10 Jun 2019 14:03:33 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B89C43F73C;
 Mon, 10 Jun 2019 14:03:31 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190508161603.21964-1-julien.grall@arm.com>
 <20190508161603.21964-5-julien.grall@arm.com>
 <alpine.DEB.2.21.1905091307080.25766@sstabellini-ThinkPad-T480s>
 <5fe19f3a-e17b-04b5-ff15-5579ebe789eb@arm.com>
 <cc1d2550-794c-842d-26db-178f614f81b3@arm.com>
 <4b1d9bf6-bf3b-a5ec-da06-534618bb34a8@arm.com>
 <alpine.DEB.2.21.1905101050260.25766@sstabellini-ThinkPad-T480s>
 <10c3ba27-c0df-a0d4-4033-530ec99291ac@arm.com>
 <alpine.DEB.2.21.1905201357570.16404@sstabellini-ThinkPad-T480s>
 <471832b3-c328-2275-2abd-845371be819b@arm.com>
 <alpine.DEB.2.21.1906101347270.8691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <091bcd75-6a83-cedd-c0c1-8c5559ccf57c@arm.com>
Date: Mon, 10 Jun 2019 22:03:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906101347270.8691@sstabellini-ThinkPad-T480s>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Andrii Anisov <Andrii_Anisov@epam.com>,
 "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMTAvMTkgOTo1MSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMjAgTWF5IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMjAvMDUv
MjAxOSAyMjowMSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gRnJpLCAxMCBNYXkg
MjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEZlZWwgZnJlZSB0byBzdWdnZXN0IGFuIGlu
LWNvZGUgY29tbWVudCBzbyB3ZSBjYW4gZGlzY3VzcyBvbiB0aGUgd29ydGhpbmVzcy4KPj4+Cj4+
PiBJIHN1Z2dlc3Qgc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZzoKPj4+Cj4+PiAgICAvKgo+
Pj4gICAgICogRmx1c2ggYWxsIGh5cGVydmlzb3IgbWFwcGluZ3MgZnJvbSB0aGUgVExCIG9mIHRo
ZSBsb2NhbCBwcm9jZXNzb3IuIE5vdGUKPj4+ICAgICAqIHRoYXQgaW5zdHJ1Y3Rpb24gY2FjaGUg
bWFpbnRlbmFuY2UgbWlnaHQgYWxzbyBiZSByZXF1aXJlZCB3aGVuIHNlbGYKPj4+ICAgICAqIG1v
ZGlmeWluZyBYZW4gY29kZSwgc2VlIEQ1LTI1MjIgaW4gQVJNIERESSAwNDg3RC5hIGFuZCBCMy4x
MS4yIGluIEFSTQo+Pj4gICAgICogRERJIDA0MDZDLmMuCj4+PiAgICAgKi8KPj4KPj4gVGhpcyBs
b29rcyBxdWl0ZSBvdXQtb2YtY29udGV4dCwgd2hhdCBpcyB0aGUgcmVsYXRpb24gYmV0d2Vlbgo+
PiBzZWxmLW1vZGlmeWluZyBjb2RlIGFuZCBUTEIgZmx1c2g/Cj4gCj4gIkZsdXNoIGFsbCBoeXBl
cnZpc29yIG1hcHBpbmdzIGZyb20gdGhlIFRMQiBvZiB0aGUgbG9jYWwgcHJvY2Vzc29yIiBpcwo+
IHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgZnVuY3Rpb24gYmVsb3cgKGl0IGNhbm5vdCBiZSBzZWVu
IGhlcmUgYnV0IGl0J3MKPiB0aGUgZnVuY3Rpb24gb24gdG9wIG9mIHdoaWNoIHRoaXMgY29tbWVu
dCBpcyBzdXBwb3NlZCB0byBiZSBvbiwKPiBmbHVzaF94ZW5fZGF0YV90bGJfbG9jYWwpLiBUaGUg
cmVzdCBvZiB0aGUgY29tbWVudCBpcyBpbmZvcm1hdGl2ZQo+IHJlZ2FyZGluZyBkaWZmaWN1bHQg
Y2FzZXMgc3VjaCBhcyBzZWxmLW1vZGlmeWluZyBjb2RlLCB3aGljaCB3YXMgcHJlc2VudAo+IGlu
IHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBjb2RlIGFuZCBJIHdvdWxkIGxpa2UgdG8gcmV0
YWluLiBUaGUKPiByZWxhdGlvbiBpcyB0aGF0IHRoZXJlIGlzIGEgZ29vZCBjaGFuY2UgeW91IG5l
ZWQgdG8gZG8gYm90aC4KU29ycnkgYnV0IHRoaXMgZG9lc24ndCBtYWtlIHNlbnNlIHRvIG1lLiBZ
b3UgYXJlIHVubGlrZWx5IGdvaW5nIHRvIAptb2RpZnkgbWFwcGluZyB3aGVuIHVzaW5nIHNlbGYt
bW9kaWZ5aW5nLiBBbmQgaWYgeW91IHdlcmUsIHRoZW4gYmVjYXVzZSAKaW5zdHJ1Y3Rpb25zIGNh
Y2hlcyBhcmUgaW1wbGVtZW50aW5nIHRoZSBJVklQVCBleHRlbnNpb24gKGFzc3VtaW5nIHdlIApm
b3JiaWQgSVZJVlQgY2FjaGUgYXMgc3VnZ2VzdGVkIGJ5IHBhdGNoICMxIGZvciBBcm0zMikgdGhl
cmUgYXJlIG5vIG5lZWQgCnRvIG1vZGlmeWluZyB0aGUgY2FjaGUgYmVjYXVzZSB0aGUgcGh5c2lj
YWwgYWRkcmVzcyB3b3VsZCBiZSBkaWZmZXJlbnQuCgpBbGwgdGhlIHNlbGYtbW9kaWZ5aW5nIGNv
ZGUgaW4gWGVuIChpLmUgYWx0ZXJuYXRpdmUsIGxpdmVwYXRjaCkgZG9uJ3QgCnJlcXVpcmVzIGEg
VExCIG1haW50ZW5hbmNlLiBJIGFsc28gY2FuJ3Qgc2VlIHdoZW4gdGhlIHR3byB3b3VsZCBiZSAK
bmVjZXNzYXJ5IGF0IHRoZSBzYW1lLgoKQ2FuIHlvdSBwbGVhc2UgZ2l2ZSBhIGNvbmNyZXRlIGV4
YW1wbGUgd2hlcmUgaXQgd291bGQgYmUgbmVjZXNzYXJ5PwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
