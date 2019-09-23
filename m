Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A74BB234
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:26:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLWG-00013Z-24; Mon, 23 Sep 2019 10:24:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQlp=XS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCLWF-00013T-79
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:24:35 +0000
X-Inumbo-ID: 54c897e0-ddec-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 54c897e0-ddec-11e9-978d-bc764e2007e4;
 Mon, 23 Sep 2019 10:24:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54966142F;
 Mon, 23 Sep 2019 03:24:31 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FD7F3F694;
 Mon, 23 Sep 2019 03:24:29 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c23b9a00-bf54-9e51-2d14-9e1684945e0b@arm.com>
Date: Mon, 23 Sep 2019 11:24:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/6] arch/arm: optee: fix TODOs and
 change status to "Tech Preview"
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
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8wOS8yMDE5IDE5OjUwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBIZWxsbywK
CkhpLAoKPiBUaGlzIGlzIHRoZSBzZWNvbmQgdmVyc2lvbiBmb3IgbWF0dXJpbmcgdGhlIE9QLVRF
RSBtZWRpYXRvci4KPiAKPiBDaGFuZ2VzIGFsc28gY2FuIGJlIHB1bGxlZCBmcm9tIFsyXS4KPiAK
PiBDaGFuZ2VzIGZyb20gdjE6Cj4gICAtIEFkZGVkIHBhdGNoIHRoYXQgdXBkYXRlcyBTVVBQT1JU
Lm1kCj4gICAtIEluc3RlYWQgb2YgcmVtb3ZpbmcgImV4cGVyaW1lbnRhbCIgc3RhdHVzIEkgY2hh
bmdlZCBpdCB0byAiVGVjaCBQcmV2aWV3Igo+ICAgLSBPdGhlciBjaGFuZ2VzIGFyZSBkZXNjcmli
ZWQgaW4gdGhlIGNvcnJlc3BvbmRpbmcgcGF0Y2hlcwo+IAo+IENvdmVyIGxldHRlciBmb3IgdjE6
Cj4gCj4gVGhpcyBwYXRjaCBzZXJpZXMgZml4ZXMgdmFyaW91cyB1bmZpbmlzaGVkIGl0ZW1zIGlu
IHRoZSBPUC1URUUgbWVkaWF0b3IuCj4gTW9zdGx5IHRoaXMgaXMgYWJvdXQgbGltaXRpbmcgcmVz
b3VyY2VzIHRoYXQgZ3Vlc3QgY2FuIGNvbnN1bWUuIFRoaXMKPiBpbmNsdWRlcyBib3RoIG1lbW9y
eSBhbmQgdGltZSAtIGhvdyBtYW55IGJ1ZmZlcnMgZ3Vlc3QgY2FuIHNoYXJlIHdpdGgKPiBPUC1U
RUUgKHRoaXMgdXNlcyBYZW4gbWVtb3J5KSBhbmQgd2hlbiBtZWRpYXRvciBzaG91bGQgcHJlZW1w
dCBpdHNlbGYsCj4gdG8gbWFrZSBzdXJlIHRoYXQgZ3Vlc3QgZG9lcyBub3Qgc3RyZXNzIHNjaGVk
dWxpbmcuCj4gCj4gQXBhcnQgZnJvbSB0aGlzLCB0aGVyZSB3ZXJlIG9uZSBjYXNlLCB3aGVuIG1l
ZGlhdG9yJ3MgYWN0aW9ucyBtaWdodCBsZWFkCj4gdG8gbWVtb3J5IGxlYWsgaW4gYSBnb29kLWJl
aGF2aW5nIGd1ZXN0LiBUbyBmaXggdGhpcyBpc3N1ZSBJIGhhZCB0bwo+IGV4dGVuZCBtZWRpYXRv
ciBsb2dpYywgc28gbm93IGl0IGNhbiBpc3N1ZSBSUEMgcmVxdWVzdHMgdG8gZ3Vlc3QgaW4gdGhl
Cj4gc2FtZSB3YXksIGFzIE9QLVRFRSBkb2VzIHRoaXMuIFRoaXMgaXMgdXNlZnVsIGZlYXR1cmUs
IGJlY2F1c2UgaXQKPiBhbGxvd3MgdG8gcHJlZW1wdCBtZWRpYXRvciBkdXJpbmcgbG9uZyBvcGVy
YXRpb25zLiBTbywgaW4gdGhlIGZ1dHVyZQo+IGl0IHdpbGwgYmUgcG9zc2libGUgdG8gcmVtb3Zl
IHNoYXJlZCBidWZmZXIgc2l6ZSBsaW1pdGF0aW9uLCBiZWNhdXNlCj4gbWVkaWF0b3IgY2FuIHBy
ZWVtcHQgc2VsZiBkdXJpbmcgYnVmZmVyIHRyYW5zbGF0aW9uLgo+IAo+IFRoaXMgcGF0Y2ggc2Vy
aWVzIGNhbiBiZSBwdWxsZWQgZnJvbSBbMV0uCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9s
b3JjL3hlbi90cmVlL29wdGVlM192MQo+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vbG9yYy94ZW4v
dHJlZS9vcHRlZTNfdjIKPiAKPiAKPiBWb2xvZHlteXIgQmFiY2h1ayAoNik6Cj4gICAgeGVuL2Fy
bTogb3B0ZWU6IGltcG9zZSBsaW1pdCBvbiBzaGFyZWQgYnVmZmVyIHNpemUKPiAgICB4ZW4vYXJt
OiBvcHRlZTogY2hlY2sgZm9yIHByZWVtcHRpb24gd2hpbGUgZnJlZWluZyBzaGFyZWQgYnVmZmVy
cwo+ICAgIHhlbi9hcm06IG9wdGVlOiBsaW1pdCBudW1iZXIgb2Ygc2hhcmVkIGJ1ZmZlcnMKCkkg
aGF2ZSBjb21taXR0ZWQgcGF0Y2ggMS0zLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
