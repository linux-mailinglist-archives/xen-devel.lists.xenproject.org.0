Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AE2177A79
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 16:32:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j99UG-0004LZ-Ja; Tue, 03 Mar 2020 15:29:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j99UF-0004LU-58
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 15:29:35 +0000
X-Inumbo-ID: c8e91aea-5d63-11ea-8adc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8e91aea-5d63-11ea-8adc-bc764e2007e4;
 Tue, 03 Mar 2020 15:29:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ADCE3B120;
 Tue,  3 Mar 2020 15:29:33 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200303122240.27013-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <14bca4bc-5e03-8ca9-74e1-88e27609b8b7@suse.com>
Date: Tue, 3 Mar 2020 16:29:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303122240.27013-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V6] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxMzoyMywgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQXQg
dGhpcyBtb21lbnQgYSBndWVzdCBjYW4gY2FsbCB2bWZ1bmMgdG8gY2hhbmdlIHRoZSBhbHRwMm0g
dmlldy4gVGhpcwo+IHNob3VsZCBiZSBsaW1pdGVkIGluIG9yZGVyIHRvIGF2b2lkIGFueSB1bndh
bnRlZCB2aWV3IHN3aXRjaC4KPiAKPiBUaGUgbmV3IHhjX2FsdHAybV9zZXRfdmlzaWJpbGl0eSgp
IHNvbHZlcyB0aGlzIGJ5IG1ha2luZyB2aWV3cyBpbnZpc2libGUKPiB0byB2bWZ1bmMuCj4gVGhp
cyBpcyBkb25lIGJ5IGhhdmluZyBhIHNlcGFyYXRlIGFyY2guYWx0cDJtX3dvcmtpbmdfZXB0cCB0
aGF0IGlzCj4gcG9wdWxhdGVkIGFuZCBtYWRlIGludmFsaWQgaW4gdGhlIHNhbWUgcGxhY2VzIGFz
IGFsdHAybV9lcHRwLiBUaGlzIGlzCj4gd3JpdHRlbiB0byBFUFRQX0xJU1RfQUREUi4KPiBUaGUg
dmlld3MgYXJlIG1hZGUgaW4vdmlzaWJsZSBieSBtYXJraW5nIHRoZW0gd2l0aCBJTlZBTElEX01G
TiBvcgo+IGNvcHlpbmcgdGhlbSBiYWNrIGZyb20gYWx0cDJtX2VwdHAuCj4gVG8gaGF2ZSBjb25z
aXN0ZW5jeSB0aGUgdmlzaWJpbGl0eSBhbHNvIGFwcGxpZXMgdG8KPiBwMm1fc3dpdGNoX2RvbWFp
bl9hbHRwMm1fYnlfaWQoKS4KPiAKPiBOb3RlOiBJZiBhbHRwMm0gbW9kZSBpcyBzZXQgdG8gbWl4
ZWQgdGhlIGd1ZXN0IGlzIGFibGUgdG8gY2hhbmdlIHRoZSB2aWV3Cj4gdmlzaWJpbGl0eSBhbmQg
dGhlbiBjYWxsIHZtZnVuYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KCkh5cGVydmlzb3IgcGFydHMKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
