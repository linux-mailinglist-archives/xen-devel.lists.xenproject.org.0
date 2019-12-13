Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E2C11E034
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 10:06:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifgno-00062k-G3; Fri, 13 Dec 2019 09:00:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifgnn-00062f-1R
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 08:59:59 +0000
X-Inumbo-ID: eabb674e-1d86-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eabb674e-1d86-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 08:59:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D9FCAE3F;
 Fri, 13 Dec 2019 08:59:48 +0000 (UTC)
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191211152956.5168-1-pdurrant@amazon.com>
 <20191211152956.5168-4-pdurrant@amazon.com>
 <cfd8f169-e925-dbff-64b2-d471300a6694@suse.com>
Message-ID: <1c12f2d7-ce67-41fc-f022-e39ea0c4e1df@suse.com>
Date: Fri, 13 Dec 2019 09:59:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <cfd8f169-e925-dbff-64b2-d471300a6694@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/4] xen/interface: re-define
 FRONT/BACK_RING_ATTACH()
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMTkgMDc6MDQsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMTEuMTIuMTkgMTY6
MjksIFBhdWwgRHVycmFudCB3cm90ZToKPj4gQ3VycmVudGx5IHRoZXNlIG1hY3JvcyBhcmUgZGVm
aW5lZCB0byByZS1pbml0aWFsaXplIGEgZnJvbnQvYmFjayByaW5nCj4+IChyZXNwZWN0aXZlbHkp
IHRvIHZhbHVlcyByZWFkIGZyb20gdGhlIHNoYXJlZCByaW5nIGluIHN1Y2ggYSB3YXkgdGhhdCBh
bnkKPj4gcmVxdWVzdHMvcmVzcG9uc2VzIHRoYXQgYXJlIGFkZGVkIHRvIHRoZSBzaGFyZWQgcmlu
ZyB3aGlsc3QgdGhlIAo+PiBmcm9udC9iYWNrCj4+IGlzIGRldGFjaGVkIHdpbGwgYmUgc2tpcHBl
ZCBvdmVyLiBUaGlzLCBpbiBnZW5lcmFsLCBpcyBub3QgYSBkZXNpcmFibGUKPj4gc2VtYW50aWMg
c2luY2UgbW9zdCBmcm9udGVuZCBpbXBsZW1lbnRhdGlvbnMgd2lsbCBldmVudHVhbGx5IGJsb2Nr
IAo+PiB3YWl0aW5nCj4+IGZvciBhIHJlc3BvbnNlIHdoaWNoIHdvdWxkIGVpdGhlciBuZXZlciBh
cHBlYXIgb3IgbmV2ZXIgYmUgcHJvY2Vzc2VkLgo+Pgo+PiBTaW5jZSB0aGUgbWFjcm9zIGFyZSBj
dXJyZW50bHkgdW51c2VkLCB0YWtlIHRoaXMgb3Bwb3J0dW5pdHkgdG8gcmUtZGVmaW5lCj4+IHRo
ZW0gdG8gcmUtaW5pdGlhbGl6ZSBhIGZyb250L2JhY2sgcmluZyB1c2luZyBzcGVjaWZpZWQgdmFs
dWVzLiBUaGlzIGFsc28KPj4gYWxsb3dzIEZST05UL0JBQ0tfUklOR19JTklUKCkgdG8gYmUgcmUt
ZGVmaW5lZCBpbiB0ZXJtcyBvZgo+PiBGUk9OVC9CQUNLX1JJTkdfQVRUQUNIKCkgdXNpbmcgYSBz
cGVjaWZpZWQgdmFsdWUgb2YgMC4KPj4KPj4gTk9URTogQkFDS19SSU5HX0FUVEFDSCgpIHdpbGwg
YmUgdXNlZCBkaXJlY3RseSBpbiBhIHN1YnNlcXVlbnQgcGF0Y2guCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKUGF1bCwgSSB0aGluayB5b3Ugc2hvdWxk
IHNlbmQgYSBwYXRjaCBjaGFuZ2luZyByaW5nLmggaW4gdGhlIFhlbiB0cmVlLgoKQXMgc29vbiBh
cyBpdCBoYXMgYmVlbiBhY2NlcHRlZCBJJ2xsIHRha2UgeW91ciBzZXJpZXMgZm9yIHRoZSBrZXJu
ZWwuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
