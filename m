Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542A12FA2B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:16:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPaS-0007CA-7F; Fri, 03 Jan 2020 16:14:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inPaR-0007C5-8P
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:14:07 +0000
X-Inumbo-ID: 0bc8d548-2e44-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0bc8d548-2e44-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 16:13:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94806AC3F;
 Fri,  3 Jan 2020 16:13:57 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191229183341.14877-1-liuwe@microsoft.com>
 <20191229183341.14877-3-liuwe@microsoft.com>
 <CACCGGhDpQ4Df9KcgeTY30XPri9cP+Nv=NZsm7oZA4J_Z7ZS_Jg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <da233f18-0982-8356-ac2e-aeeb28bee007@suse.com>
Date: Fri, 3 Jan 2020 17:14:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CACCGGhDpQ4Df9KcgeTY30XPri9cP+Nv=NZsm7oZA4J_Z7ZS_Jg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/8] x86/hyperv: detect absolutely necessary
 MSRs
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Paul Durrant <pdurrant@gmail.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDEuMjAyMCAxMjowMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE9uIFN1biwgMjkgRGVj
IDIwMTkgYXQgMTg6MzQsIFdlaSBMaXUgPHdsQHhlbi5vcmc+IHdyb3RlOgo+PiAtLS0gYS94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvaHlwZXJ2LmMKPj4gQEAgLTMyLDYgKzMyLDggQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBoeXBlcnZpc29yX29wcyBvcHMgPSB7Cj4+ICBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
Kl9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKPj4gIHsKPj4gICAgICB1aW50MzJfdCBlYXgsIGVi
eCwgZWN4LCBlZHg7Cj4+ICsgICAgdWludDY0X3QgcmVxdWlyZWRfbXNycyA9IEhWX1g2NF9NU1Jf
SFlQRVJDQUxMX0FWQUlMQUJMRSB8Cj4+ICsgICAgICAgIEhWX1g2NF9NU1JfVlBfSU5ERVhfQVZB
SUxBQkxFOwo+Pgo+PiAgICAgIGNwdWlkKDB4NDAwMDAwMDAsICZlYXgsICZlYngsICZlY3gsICZl
ZHgpOwo+PiAgICAgIGlmICggISgoZWJ4ID09IDB4NzI2MzY5NGQpICYmICAvKiAiTWljciIgKi8K
Pj4gQEAgLTU3LDYgKzU5LDE1IEBAIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0
IGh5cGVydl9wcm9iZSh2b2lkKQo+PiAgICAgIG1zX2h5cGVydi5tYXhfdnBfaW5kZXggPSBlYXg7
Cj4+ICAgICAgbXNfaHlwZXJ2Lm1heF9scF9pbmRleCA9IGVieDsKPj4KPj4gKyAgICBpZiAoICht
c19oeXBlcnYuZmVhdHVyZXMgJiByZXF1aXJlZF9tc3JzKSAhPSByZXF1aXJlZF9tc3JzICkKPj4g
KyAgICB7Cj4+ICsgICAgICAgIC8qIE9vcHMsIHJlcXVpcmVkIE1TUnMgYXJlIG5vdCBhdmFpbGFi
bGUuIFRyZWF0IHRoaXMgYXMKPj4gKyAgICAgICAgICogIkh5cGVyLVYgaXMgbm90IGF2YWlsYWJs
ZSIuCj4+ICsgICAgICAgICAqLwo+IAo+IFRoYXQgYmxvY2sgY29tbWVudCB2aW9sYXRlcyBkZWZh
dWx0IGNvZGluZyBzdHlsZS4KCkFuZCB3aXRoIGl0IGNvcnJlY3RlZApBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
