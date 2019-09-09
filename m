Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DE3AE04B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 23:33:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7RFd-0002tF-1r; Mon, 09 Sep 2019 21:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fSZh=XE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7RFb-0002tA-6N
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 21:31:07 +0000
X-Inumbo-ID: 21a5e294-d349-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 21a5e294-d349-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 21:31:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DD3328;
 Mon,  9 Sep 2019 14:31:06 -0700 (PDT)
Received: from [10.37.12.117] (unknown [10.37.12.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1155F3F67D;
 Mon,  9 Sep 2019 14:31:04 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190823184826.14525-1-volodymyr_babchuk@epam.com>
 <20190823184826.14525-6-volodymyr_babchuk@epam.com>
 <d54ec451-7aa5-d289-8080-708e91d9e39d@arm.com> <87v9ung02w.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a094fc62-5bcd-edb1-e970-3ec023860ec6@arm.com>
Date: Mon, 9 Sep 2019 22:31:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87v9ung02w.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/5] xen/arm: optee: remove experimental
 status
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA4LzIzLzE5IDg6MjAgUE0sIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+IAo+IEhpIEp1
bGllbiwKCkhpLAoKQXBvbG9naWVzIGZvciB0aGUgZGVsYXkuCgo+IAo+IEp1bGllbiBHcmFsbCB3
cml0ZXM6Cj4gCj4+IEhpLAo+Pgo+PiBPbiA4LzIzLzE5IDc6NDggUE0sIFZvbG9keW15ciBCYWJj
aHVrIHdyb3RlOgo+Pj4gQXMgYWxsIFRPRE9zIGFuZCBwb3RlbnRpYWwgc2VjdXJpdHkgaXNzdWVz
IGFyZSByZXNvbHZlZCBub3csCj4+PiByZW1vdmUgZXhwZXJpbWVudGFsIHN0YXR1cyBmcm9tIE9Q
LVRFRSBtZWRpYXRvci4KPj4KPj4gTG9va2luZyBhdCBTVVBQT1JULk1ELCBJIHRoaW5rIE9QLVRF
RSB3aXRob3V0IHRoaXMgc2VyaWVzIHdvdWxkIGJlCj4+IGNvbnNpZGVyZWQgYXMgIkV4cGVyaW1l
bnRhbCIuCj4gUmlnaHQuCj4gCj4+Cj4+IFdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCwgSSBzdGls
bCB0aGluayB3ZSBzaG91bGQga2VlcCB0aGUgS2NvbmZpZwo+PiBiZWhpbmQgRVhQRVJUIGJ1dCBt
YXJrIGl0IGFzICJUZWNobmljYWwgUHJldmlldyIgZm9yIGF0IGxlYXN0IGEKPj4gcmVsZWFzZS4g
VGhpcyB3b3VsZCBlbmNvdXJhZ2UgcGVvcGxlIHRvIHRlc3QgYW5kIHJlcG9ydCBhbnkgcG90ZW50
aWFsCj4+IGlzc3VlcyB3aXRoIE9QLVRFRS4KPj4KPj4gV2UgY2FuIHJlLWRpc2N1c3MgYWJvdXQg
dGhlIHN0YXRlIGluIGEgZmV3IG1vbnRocyBmb3IgZnV0dXJlIHJlbGVhc2UuCj4+Cj4+IEJUVywg
U1VQUE9SVC5NRCBzaG91bGQgYmUgdXBkYXRlZCB0byByZWZsZWN0IHRoZSBzdGF0ZSBvZiBPUC1U
RUUgaW4gWGVuLgo+IEZhaXIgZW5vdWdoLiBJbiB0aGUgbmV4dCB2ZXJzaW9uIEknbGwgcmVwbGFj
ZSB0aGlzIHBhdGNoIHdpdGggcGF0Y2ggdG8KPiBTVVBQT1JULm1kLiBPciBpdCBpcyBiZXR0ZXIg
dG8gcHVzaCBzZXBhcmF0ZSBwYXRjaCBmb3IgdGhlIGRvY3VtZW50YXRpb24/CgpJIHRoaW5rIHRo
ZSBwYXRjaCBpbiBTVVBQT1JULk1EIHNob3VsZCBnbyByZWdhcmRsZXNzIG9mIHRoZSBzdGF0ZSBv
ZiB0aGUgCnJlc3QuIEl0IGlzIGZpbmUgdG8ga2VlcCBpdCBpbiB0aGlzIHNlcmllcy4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
