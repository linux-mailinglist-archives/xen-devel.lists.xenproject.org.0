Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70957AACC1
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 22:08:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5y0l-0007bE-Q4; Thu, 05 Sep 2019 20:05:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/daD=XA=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i5y0j-0007b9-Fo
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 20:05:41 +0000
X-Inumbo-ID: 88e3e8d6-d018-11e9-abda-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 88e3e8d6-d018-11e9-abda-12813bfff9fa;
 Thu, 05 Sep 2019 20:05:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5444C1000;
 Thu,  5 Sep 2019 13:05:40 -0700 (PDT)
Received: from [10.37.12.167] (unknown [10.37.12.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57DD93F67D;
 Thu,  5 Sep 2019 13:05:37 -0700 (PDT)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20190902145014.36442-1-paul.durrant@citrix.com>
 <20190902145014.36442-3-paul.durrant@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <61a56674-207f-9c63-dd7f-cb2cd9c2e1cd@arm.com>
Date: Thu, 5 Sep 2019 21:05:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190902145014.36442-3-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 2/6] domain: introduce
 XEN_DOMCTL_CDF_iommu flag
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
 Christian Lindig <christian.lindig@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, David Scott <dave@recoil.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzIvMTkgMzo1MCBQTSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IGRpZmYgLS1naXQg
YS94ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwo+IGluZGV4IGU5ZDJj
NjEzZTAuLjdkZmIyNTdjNTAgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsr
KyBiL3hlbi9jb21tb24vZG9tYWluLmMKPiBAQCAtMzAxLDcgKzMwMSw4IEBAIHN0YXRpYyBpbnQg
c2FuaXRpc2VfZG9tYWluX2NvbmZpZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNv
bmZpZykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX2hhcCB8
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl9zM19pbnRlZ3Jp
dHkgfAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0RPTUNUTF9DREZfb29zX29m
ZiB8Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgIFhFTl9ET01DVExfQ0RGX3hzX2RvbWFp
bikgKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl94c19kb21h
aW4gfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICBYRU5fRE9NQ1RMX0NERl9pb21tdSkg
KQo+ICAgICAgIHsKPiAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgIlVua25vd24gQ0RG
IGZsYWdzICUjeFxuIiwgY29uZmlnLT5mbGFncyk7Cj4gICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+IEBAIC0zMjAsNiArMzIxLDEyIEBAIHN0YXRpYyBpbnQgc2FuaXRpc2VfZG9tYWluX2NvbmZp
ZyhzdHJ1Y3QgeGVuX2RvbWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykKPiAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7Cj4gICAgICAgfQo+ICAgCj4gKyAgICBpZiAoIChjb25maWctPmZsYWdzICYg
WEVOX0RPTUNUTF9DREZfaW9tbXUpICYmICFpb21tdV9lbmFibGVkICkKPiArICAgIHsKPiArICAg
ICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLCAiSU9NTVUgaXMgbm90IGVuYWJsZWRcbiIpOwo+ICsg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAgfQo+ICsKCkxvb2tpbmcgYXQgdGhpcyBwYXRj
aCBhZ2FpbiwgdGhlIGltcGxlbWVudGF0aW9uIG9mIAphcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25m
aWcoKSBmb3IgQXJtIHdpbGwgb25seSBhY2NlcHRzIGNvbmZpZy0+ZmxhZ3MgdG8gCmJlIGVxdWFs
IHRvIENERl9odm1fZ3Vlc3QgfCBDREZfaGFwLgoKU28gYWZ0ZXIgdGhpcyBwYXRjaCwgaXQgd2ls
bCBub3QgYmUgcG9zc2libGUgdG8gY3JlYXRlIGFueSBkb21haW4gd2hlbiAKQ0RGX2lvbW11IGlz
IHNldC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
