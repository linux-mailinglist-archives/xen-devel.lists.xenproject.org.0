Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6302917F3E8
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 10:43:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBbMZ-0006GO-H8; Tue, 10 Mar 2020 09:39:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBbMY-0006GJ-Ix
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 09:39:46 +0000
X-Inumbo-ID: 12f433f0-62b3-11ea-bc08-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12f433f0-62b3-11ea-bc08-bc764e2007e4;
 Tue, 10 Mar 2020 09:39:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AD259AC37;
 Tue, 10 Mar 2020 09:39:43 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
 <d1c4f00d-3bcd-b6f1-cd4e-24870ad248cc@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5A45@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3d4c25c2-7845-72b3-93d9-8dace2ba45c3@suse.com>
Date: Tue, 10 Mar 2020 10:39:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5A45@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/5] IOMMU: iommu_intpost is x86/HVM-only
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAwMjoxMywgVGlhbiwgS2V2aW4gd3JvdGU6Cj4+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gU2VudDogTW9uZGF5LCBNYXJjaCA5LCAyMDIwIDY6
NDMgUE0KPj4KPj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKPj4g
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKPj4gQEAgLTI5LDYgKzI5
LDE2IEBAIHN0cnVjdCBpb21tdV9vcHMgX19yZWFkX21vc3RseSBpb21tdV9vcHMKPj4KPj4gIGVu
dW0gaW9tbXVfaW50cmVtYXAgX19yZWFkX21vc3RseSBpb21tdV9pbnRyZW1hcCA9Cj4+IGlvbW11
X2ludHJlbWFwX2Z1bGw7Cj4+Cj4+ICsjaWZuZGVmIGlvbW11X2ludHBvc3QKPj4gKy8qCj4+ICsg
KiBJbiB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBWVC1kIHBvc3RlZCBpbnRlcnJ1cHRz
LCBpbiBzb21lCj4+IGV4dHJlbWUKPj4gKyAqIGNhc2VzLCB0aGUgcGVyIGNwdSBsaXN0IHdoaWNo
IHNhdmVzIHRoZSBibG9ja2VkIHZDUFUgd2lsbCBiZSB2ZXJ5IGxvbmcsCj4+ICsgKiBhbmQgdGhp
cyB3aWxsIGFmZmVjdCB0aGUgaW50ZXJydXB0IGxhdGVuY3ksIHNvIGxldCB0aGlzIGZlYXR1cmUg
b2ZmIGJ5Cj4+ICsgKiBkZWZhdWx0IHVudGlsIHdlIGZpbmQgYSBnb29kIHNvbHV0aW9uIHRvIHJl
c29sdmUgaXQuCj4+ICsgKi8KPiAKPiBJcyBhYm92ZSBjb21tZW50IHJlYWxseSBWVC1kIHNwZWNp
ZmljPyBtYXkgdGFrZSB0aGlzIGNoYW5jZSB0byByZWZpbmUKPiBpdCB0b2dldGhlci4KCkF0IHRo
ZSBtb21lbnQgaXQgaXMsIGFzIHdlIHN0aWxsIGRvbid0IGhhdmUgYW55IEFNRCBzaWRlIGNvdW50
ZXJwYXJ0CmNvZGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
