Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0935D12932F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 09:40:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijJCi-0006Ri-NC; Mon, 23 Dec 2019 08:36:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htmo=2N=amazon.com=prvs=2537494bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijJCg-0006Rd-Nu
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 08:36:38 +0000
X-Inumbo-ID: 561442ba-255f-11ea-96b2-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 561442ba-255f-11ea-96b2-12813bfff9fa;
 Mon, 23 Dec 2019 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577090199; x=1608626199;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T9Rgx3Z8KuCsT8EI25KDspmgkawWjCL6oYXPGzZtryw=;
 b=AxmUS878dwLViQnr+FdzNzl3+v8Ywis47Zqgewz2qJVAnK6FoDqqvlPa
 LJZth1B93JnF5o/ttbDCIbWvvOpz/a0HROuida5l7i6WVZLTgtWeJZPxS
 +5/oWHGo+pebx3M/+o+ASdBxW4YJlPBYy44unfCAD5gOw7VgNHGgb0QRL U=;
IronPort-SDR: inpaixx/q7zcdLeOzyYDPglgDuYe1nJPrNEX1A3aTEr79ufzQv52MpumD6o4p8g0Iwm+ECBecA
 h81T6QO5aNJQ==
X-IronPort-AV: E=Sophos;i="5.69,346,1571702400"; 
   d="scan'208";a="9693289"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-57e1d233.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 23 Dec 2019 08:36:27 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-57e1d233.us-east-1.amazon.com (Postfix) with ESMTPS
 id 730F11417D1; Mon, 23 Dec 2019 08:36:24 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 23 Dec 2019 08:36:23 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Dec 2019 08:36:22 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 23 Dec 2019 08:36:22 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/3] x86/viridian: drop a wrong invalid value from
 reference TSC implementation
Thread-Index: AQHVuR54c94MHGiSpE6xRi3Sb6nA9KfHZZZQ
Date: Mon, 23 Dec 2019 08:36:22 +0000
Message-ID: <6a695538fb014e338fbaa57ce9ce2235@EX13D32EUC003.ant.amazon.com>
References: <20191222232035.31613-1-liuwe@microsoft.com>
 <20191222232035.31613-2-liuwe@microsoft.com>
In-Reply-To: <20191222232035.31613-2-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 1/3] x86/viridian: drop a wrong invalid
 value from reference TSC implementation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VjI/Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogV2VpIExpdSA8d2VpLmxp
dS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2VpIExpdQo+IFNlbnQ6IDIyIERlY2VtYmVy
IDIwMTkgMjM6MjEKPiBUbzogWGVuIERldmVsb3BtZW50IExpc3QgPHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZz4KPiBDYzogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5j
b20+OyBEdXJyYW50LCBQYXVsCj4gPHBkdXJyYW50QGFtYXpvbi5jb20+OyBXZWkgTGl1IDxsaXV3
ZUBtaWNyb3NvZnQuY29tPjsgUGF1bCBEdXJyYW50Cj4gPHBhdWxAeGVuLm9yZz47IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBSb2dlciBQYXUgTW9ubsOpCj4gPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFtQQVRDSCAxLzNdIHg4Ni92aXJpZGlhbjog
ZHJvcCBhIHdyb25nIGludmFsaWQgdmFsdWUgZnJvbQo+IHJlZmVyZW5jZSBUU0MgaW1wbGVtZW50
YXRpb24KPiAKPiBUaGUgb25seSBpbnZhbGlkIHZhbHVlIG1lbnRpb25lZCBpbiBIeXBlci1WIFRM
RlMgNS4wYyBpcyAwLiBNaWNoYWVsCj4gS2VsbGV5IGNvbmZpcm1lZCB0aGF0IDB4RkZGRkZGRkYg
d2FzIG5ldmVyIHVzZWQgWzBdLgo+IAo+IFswXSBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMi9tc2cwMTU2NC5odG1sCj4gCj4gU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KClJldmlld2VkLWJ5OiBQYXVsIER1cnJh
bnQgPHBhdWxAeGVuLm9yZz4KCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGlt
ZS5jIHwgMTYgKysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92
aXJpZGlhbi90aW1lLmMKPiBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5jCj4gaW5k
ZXggNmIyZDc0NWYzYS4uMGYxY2Q5ZTIwOCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvaHZt
L3ZpcmlkaWFuL3RpbWUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGltZS5j
Cj4gQEAgLTQ1LDE0ICs0NSw5IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yZWZlcmVuY2VfdHNjKGNv
bnN0IHN0cnVjdCBkb21haW4KPiAqZCwgYm9vbCBpbml0aWFsaXplKQo+ICAgICAgaWYgKCAhaG9z
dF90c2NfaXNfc2FmZSgpIHx8IGQtPmFyY2gudnRzYyApCj4gICAgICB7Cj4gICAgICAgICAgLyoK
PiAtICAgICAgICAgKiBUaGUgc3BlY2lmaWNhdGlvbiBzdGF0ZXMgdGhhdCB2YWxpZCB2YWx1ZXMg
b2YgVHNjU2VxdWVuY2UKPiByYW5nZQo+IC0gICAgICAgICAqIGZyb20gMCB0byAweEZGRkZGRkZF
LiBUaGUgdmFsdWUgMHhGRkZGRkZGRiBpcyB1c2VkIHRvIGluZGljYXRlCj4gLSAgICAgICAgICog
dGhpcyBtZWNoYW5pc20gaXMgbm8gbG9uZ2VyIGEgcmVsaWFibGUgc291cmNlIG9mIHRpbWUgYW5k
IHRoYXQKPiAtICAgICAgICAgKiB0aGUgVk0gc2hvdWxkIGZhbGwgYmFjayB0byBhIGRpZmZlcmVu
dCBzb3VyY2UuCj4gLSAgICAgICAgICoKPiAtICAgICAgICAgKiBTZXJ2ZXIgMjAxMiAoNi4yIGtl
cm5lbCkgYW5kIDIwMTIgUjIgKDYuMyBrZXJuZWwpIGFjdHVhbGx5Cj4gLSAgICAgICAgICogdmlv
bGF0ZSB0aGUgc3BlYy4gYW5kIHJlbHkgb24gYSB2YWx1ZSBvZiAwIHRvIGluZGljYXRlIHRoYXQK
PiB0aGlzCj4gLSAgICAgICAgICogZW5saWdodGVubWVudCBzaG91bGQgbm8gbG9uZ2VyIGJlIHVz
ZWQuCj4gKyAgICAgICAgICogVGhlIHZhbHVlIDAgaXMgdXNlZCB0byBpbmRpY2F0ZSB0aGlzIG1l
Y2hhbmlzbSBpcyBubyBsb25nZXIgYQo+ICsgICAgICAgICAqIHJlbGlhYmxlIHNvdXJjZSBvZiB0
aW1lIGFuZCB0aGF0IHRoZSBWTSBzaG91bGQgZmFsbCBiYWNrIHRvIGEKPiArICAgICAgICAgKiBk
aWZmZXJlbnQgc291cmNlLgo+ICAgICAgICAgICAqLwo+ICAgICAgICAgIHAtPnRzY19zZXF1ZW5j
ZSA9IDA7Cj4gCj4gQEAgLTc3LDEwICs3Miw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yZWZlcmVu
Y2VfdHNjKGNvbnN0IHN0cnVjdCBkb21haW4KPiAqZCwgYm9vbCBpbml0aWFsaXplKQo+ICAgICAg
c21wX3dtYigpOwo+IAo+ICAgICAgc2VxID0gcC0+dHNjX3NlcXVlbmNlICsgMTsKPiAtICAgIGlm
ICggc2VxID09IDB4RkZGRkZGRkYgfHwgc2VxID09IDAgKSAvKiBBdm9pZCBib3RoICdpbnZhbGlk
JyB2YWx1ZXMKPiAqLwo+IC0gICAgICAgIHNlcSA9IDE7Cj4gLQo+IC0gICAgcC0+dHNjX3NlcXVl
bmNlID0gc2VxOwo+ICsgICAgcC0+dHNjX3NlcXVlbmNlID0gc2VxID8gc2VxIDogMTsgLyogQXZv
aWQgJ2ludmFsaWQnIHZhbHVlIDAgKi8KPiAgfQo+IAo+ICBzdGF0aWMgdWludDY0X3QgdHJjX3Zh
bChjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBpbnQ2NF90IG9mZnNldCkKPiAtLQo+IDIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
