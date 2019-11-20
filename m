Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2C2103CBD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 14:58:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXQSv-0005PW-8D; Wed, 20 Nov 2019 13:56:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXQSt-0005PR-PH
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 13:56:15 +0000
X-Inumbo-ID: 83e4f79c-0b9d-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83e4f79c-0b9d-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 13:56:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8BB6BB1B9;
 Wed, 20 Nov 2019 13:56:13 +0000 (UTC)
To: Julien Grall <julien.grall.oss@gmail.com>
References: <20191120133751.67925-1-jgrall@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3ceac08c-cdf3-aad5-de55-9e3055fa079e@suse.com>
Date: Wed, 20 Nov 2019 14:56:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191120133751.67925-1-jgrall@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: Add missing va_end() in
 hypercall_create_continuation()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAxNDozNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEZyb206IEp1bGllbiBH
cmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gCj4gVGhlIGRvY3VtZW50YXRpb24gcmVxdWlyZXMgdmFf
c3RhcnQoKSB0byBhbHdheXMgYmUgbWF0Y2hlZCB3aXRoIGEKPiBjb3JyZXNwb25kaW5nIHZhX2Vu
ZCgpLiBIb3dldmVyLCB0aGlzIGlzIG5vdCB0aGUgY2FzZSBpbiB0aGUgcGF0aCB1c2VkCj4gZm9y
IGJhZCBmb3JtYXQuCj4gCj4gVGhpcyB3YXMgaW50cm9kdWNlZCBieSBYU0EtMjk2Lgo+IAo+IENv
dmVyaXR5LUlEOiAxNDg4NzI3Cj4gRml4ZXM6IDBiZjlmOGQzZTMgKCJ4ZW4vaHlwZXJjYWxsOiBE
b24ndCB1c2UgQlVHKCkgZm9yIHBhcmFtZXRlciBjaGVja2luZyBpbiBoeXBlcmNhbGxfY3JlYXRl
X2NvbnRpbnVhdGlvbigpIikKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
