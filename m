Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D59B0F8B
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:07:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Om8-0003Uh-F1; Thu, 12 Sep 2019 13:04:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8Om7-0003Uc-Dn
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:04:39 +0000
X-Inumbo-ID: df0864ff-d55d-11e9-9598-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df0864ff-d55d-11e9-9598-12813bfff9fa;
 Thu, 12 Sep 2019 13:04:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E0CF0AF59;
 Thu, 12 Sep 2019 13:04:36 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190912111744.40410-1-paul.durrant@citrix.com>
 <20190912111744.40410-4-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7cd00313-8d28-708b-23b1-4f6b0ff89cdf@suse.com>
Date: Thu, 12 Sep 2019 15:04:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912111744.40410-4-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 3/6] sysctl / libxl: report whether
 IOMMU/HAP page table sharing is supported
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
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, DavidScott <dave@recoil.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMzoxNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L2FybS9zeXNjdGwuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9zeXNjdGwuYwo+IEBAIC0xNSw2ICsx
NSw5IEBACj4gIHZvaWQgYXJjaF9kb19waHlzaW5mbyhzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5m
byAqcGkpCj4gIHsKPiAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlTQ0FQ
X2h2bSB8IFhFTl9TWVNDVExfUEhZU0NBUF9oYXA7Cj4gKwo+ICsgICAgaWYgKCBpb21tdV9lbmFi
bGVkICYmIGlvbW11X2hhcF9wdF9zaGFyZSApCj4gKyAgICAgICAgcGktPmNhcGFiaWxpdGllcyB8
PSBYRU5fU1lTQ1RMX1BIWVNDQVBfaW9tbXVfaGFwX3B0X3NoYXJlOwo+ICB9CgpJIHRoaW5rIHRo
aXMgc2hvdWxkIGJlIGRvbmUgaW4gY29tbW9uIGNvZGUuCgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9z
eXNjdGwuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwo+IEBAIC0xNjQsNyArMTY0LDEy
IEBAIHZvaWQgYXJjaF9kb19waHlzaW5mbyhzdHJ1Y3QgeGVuX3N5c2N0bF9waHlzaW5mbyAqcGkp
Cj4gICAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX1BWKSApCj4gICAgICAgICAgcGktPmNhcGFi
aWxpdGllcyB8PSBYRU5fU1lTQ1RMX1BIWVNDQVBfcHY7Cj4gICAgICBpZiAoIGh2bV9oYXBfc3Vw
cG9ydGVkKCkgKQo+ICsgICAgewo+ICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZ
U0NUTF9QSFlTQ0FQX2hhcDsKPiArCj4gKyAgICAgICAgaWYgKCBpb21tdV9lbmFibGVkICYmIGlv
bW11X2hhcF9wdF9zaGFyZSApCj4gKyAgICAgICAgICAgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVO
X1NZU0NUTF9QSFlTQ0FQX2lvbW11X2hhcF9wdF9zaGFyZTsKPiArICAgIH0KPiAgfQoKQW5kIGlm
IGl0J3MgaW1wb3J0YW50IHRvIG5vdCBoYXZlIHRoZSBiaXQgc2V0IHdoZW4gIWh2bV9oYXBfc3Vw
cG9ydGVkKCksCnRoZW4gaW9tbXVfaGFwX3B0X3NoYXJlIHNob3VsZCBiZSBjbGVhcmVkIGluIF9f
aW5pdCBjb2RlIGluIHRoaXMgY2FzZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
