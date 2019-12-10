Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9A118D64
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 17:19:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieiCG-0008F9-4Y; Tue, 10 Dec 2019 16:17:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieiCF-0008Ez-30
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 16:17:11 +0000
X-Inumbo-ID: 8417d114-1b68-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8417d114-1b68-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 16:17:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0FFACACD0;
 Tue, 10 Dec 2019 16:17:09 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-6-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <58dd4638-e23d-4ffc-1e4a-13edf73ebb93@suse.com>
Date: Tue, 10 Dec 2019 17:17:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191025091618.10153-6-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 5/7] x86: use running_on_hypervisor
 to gate hypervisor_setup
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTAuMjAxOSAxMToxNiwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
c2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gQEAgLTE1NzcsNyArMTU3Nyw3
IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3Ap
Cj4gICAgICAgICAgICAgIG1heF9jcHVzID0gbnJfY3B1X2lkczsKPiAgICAgIH0KPiAgCj4gLSAg
ICBpZiAoIHhlbl9ndWVzdCApCj4gKyAgICBpZiAoIHJ1bm5pbmdfb25faHlwZXJ2aXNvciApCj4g
ICAgICAgICAgaHlwZXJ2aXNvcl9zZXR1cCgpOwoKVGhpcyBjb2RlIGlzIHVzaW5nIGh5cGVydmlz
b3JfbmFtZSBhbHJlYWR5LCBzbyBJIGd1ZXNzIHRoZSBwYXRjaApoYXMgYmVjb21lIHVubmVjZXNz
YXJ5PwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
