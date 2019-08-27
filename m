Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 553AF9EAB6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:18:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2cEr-0007x1-W7; Tue, 27 Aug 2019 14:14:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2cEp-0007ww-OJ
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:14:23 +0000
X-Inumbo-ID: f73bc3bc-c8d4-11e9-ae35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f73bc3bc-c8d4-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 14:14:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 16D5AACC1;
 Tue, 27 Aug 2019 14:14:21 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190822065132.48200-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a36d6996-8427-5096-7576-cadca31e1a71@suse.com>
Date: Tue, 27 Aug 2019 16:14:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822065132.48200-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] print: introduce a format specifier for
 pci_sbdf_t
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
Cc: KevinTian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDguMjAxOSAwODo1MSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBuZXcgZm9y
bWF0IHNwZWNpZmllciBpcyAnJXBwJywgYW5kIHByaW50cyBhIHBjaV9zYmRmX3QgdXNpbmcgdGhl
Cj4gc2VnOmJ1czpkZXYuZnVuYyBmb3JtYXQuIFJlcGxhY2UgYWxsIFNCREZzIHByaW50ZWQgdXNp
bmcKPiAnJTA0eDolMDJ4OiUwMnguJXUnIHRvIHVzZSB0aGUgbmV3IGZvcm1hdCBzcGVjaWZpZXIu
Cj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBz
aW5jZSB2MToKPiAgIC0gVXNlIGJhc2UgOCB0byBwcmludCB0aGUgZnVuY3Rpb24gbnVtYmVyLgo+
ICAgLSBTb3J0IHRoZSBhZGRpdGlvbiBpbiB0aGUgcG9pbnRlciBmdW5jdGlvbiBhbHBoYWJldGlj
YWxseS4KPiAtLS0KPiAgIGRvY3MvbWlzYy9wcmludGstZm9ybWF0cy50eHQgICAgICAgICAgICAg
ICAgfCAgIDUgKwo+ICAgeGVuL2FyY2gveDg2L2h2bS92bXNpLmMgICAgICAgICAgICAgICAgICAg
ICB8ICAxMCArLQo+ICAgeGVuL2FyY2gveDg2L21zaS5jICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAzNSArKystLS0KPiAgIHhlbi9jb21tb24vdnNwcmludGYuYyAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMTggKysrKwo+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2Fj
cGkuYyAgICB8ICAxNyArKy0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9j
bWQuYyAgICAgfCAgIDUgKy0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9k
ZXRlY3QuYyAgfCAgIDUgKy0KPiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9p
bml0LmMgICAgfCAgMTIgKy0tCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVf
aW50ci5jICAgIHwgICAzICstCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2Ft
ZF9pb21tdS5jIHwgIDI1ICsrLS0tCj4gICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyAg
ICAgICAgICAgICAgIHwgMTE0ICsrKysrKysrLS0tLS0tLS0tLS0tCj4gICB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC92dGQvZG1hci5jICAgICAgICAgIHwgIDI1ICsrKy0tCj4gICB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvaW50cmVtYXAuYyAgICAgIHwgIDExICstCj4gICB4ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgICAgICAgIHwgIDgwICsrKysrKy0tLS0tLS0tCj4g
ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcXVpcmtzLmMgICAgICAgIHwgIDIyICsrLS0K
PiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC91dGlscy5jICAgICAgICAgfCAgIDYgKy0K
PiAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9hdHMuYyAgICAgICAgICAgfCAgMTMgKy0t
Cj4gICB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAgICAgICAgICAgICAgICAgIHwgIDExICst
Cj4gICB4ZW4vZHJpdmVycy92cGNpL21zaS5jICAgICAgICAgICAgICAgICAgICAgIHwgICA2ICst
Cj4gICB4ZW4vZHJpdmVycy92cGNpL21zaXguYyAgICAgICAgICAgICAgICAgICAgIHwgIDI0ICsr
LS0tCj4gICAyMCBmaWxlcyBjaGFuZ2VkLCAxODkgaW5zZXJ0aW9ucygrKSwgMjU4IGRlbGV0aW9u
cygtKQoKSW4gb3JkZXIgdG8gbm90IGJsb2NrIGZvcndhcmQgcHJvZ3Jlc3MsIGZvciBqdXN0IHRo
ZSBwaWVjZXMgd2hlcmUgSSBhbQp0aGUgb25seSBtYWludGFpbmVyCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkJ5IGltcGxpY2F0aW9uIEkgc3RpbGwgZG9uJ3QgcmVh
bGx5IGFncmVlIHdpdGggdXNpbmcgYSAlcCBleHRlbnNpb24KaGVyZS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
