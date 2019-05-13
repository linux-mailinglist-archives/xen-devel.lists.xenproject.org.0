Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DE01B1A4
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 09:58:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ5nr-0006we-Si; Mon, 13 May 2019 07:55:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4FnS=TN=amazon.com=prvs=0292d62ee=elnikety@srs-us1.protection.inumbo.net>)
 id 1hQ5nq-0006wY-B7
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 07:55:18 +0000
X-Inumbo-ID: 721edec0-7554-11e9-8980-bc764e045a96
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 721edec0-7554-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1557734117; x=1589270117;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YrLuupNw1HSsoLX353WPR8AVidF+2+TLOh2w0ONB+mU=;
 b=v2Bou1wYI6LUwHQvB8KfsPWs9xaR3r6wvTB01C+8phYjjxbGh5GD2+cR
 CQAPoFHm3jhHjBmPCEoYU4AJxQkG9n7v2YNWd6l8f2iXPg+yhS8M2/e3/
 BQk1MdOKTqkpHXahjErc53r632LTx4DOwvF7aym64/RnilqR3IaL50cKU 8=;
X-IronPort-AV: E=Sophos;i="5.60,464,1549929600"; d="scan'208";a="799291705"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 13 May 2019 07:55:13 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4D7tCgG042723
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 13 May 2019 07:55:12 GMT
Received: from EX13D18EUA001.ant.amazon.com (10.43.165.58) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 13 May 2019 07:55:12 +0000
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13D18EUA001.ant.amazon.com (10.43.165.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 13 May 2019 07:55:11 +0000
Received: from EX13D03EUA002.ant.amazon.com ([10.43.165.166]) by
 EX13D03EUA002.ant.amazon.com ([10.43.165.166]) with mapi id 15.00.1367.000;
 Mon, 13 May 2019 07:55:11 +0000
From: "Elnikety, Eslam" <elnikety@amazon.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] libxl: make vkbd tunable for HVM guests
Thread-Index: AQHVBNxB6vYhHh/FmUuQ++duuEyoBaZouKaA
Date: Mon, 13 May 2019 07:55:10 +0000
Message-ID: <94CDF863-FAB1-4121-B8A6-486FD138DEA4@amazon.com>
References: <20190507135320.103953-1-elnikety@amazon.com>
In-Reply-To: <20190507135320.103953-1-elnikety@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.155]
Content-ID: <E605795A0DD9294AA8BEFD10EEBEBE78@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] libxl: make vkbd tunable for HVM guests
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wei.liu2@citrix.com>, "Shah, Amit" <aams@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gNy4gTWF5IDIwMTksIGF0IDE1OjUzLCBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1h
em9uLmNvbT4gd3JvdGU6Cj4gCj4gRWFjaCBIVk0gZ3Vlc3QgY3VycmVudGx5IGdldHMgYSB2a2Jk
IGZyb250ZW5kL2JhY2tlbmQgcGFpciAoYy9zIGViYmQyNTYxYjRjKS4KPiBUaGlzIGNvbnN1bWVz
IGhvc3QgcmVzb3VyY2VzIHVubmVjZXNzYXJpbHkgZm9yIGd1ZXN0cyB0aGF0IGhhdmUgbm8gdXNl
IGZvcgo+IHZrYmQuIE1ha2UgdGhpcyBiZWhhdmlvdXIgdHVuYWJsZSB0byBhbGxvdyBhbiBhZG1p
bmlzdHJhdG9yIHRvIGNob29zZS4gVGhlCj4gY29tbWl0IHJldGFpbnMgdGhlIGN1cnJlbnQgYmVo
YXZpb3VyIC0tIEhWTSBndWVzdHMgc3RpbGwgZ2V0IHZrZGIgdW5sZXNzCj4gc3BlY2lmaWVkIG90
aGVyd2lzZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBFc2xhbSBFbG5pa2V0eSA8ZWxuaWtldHlAYW1h
em9uLmNvbT4KPiAKPiAtLS0KPiAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAtIEFkZGVkIGEg
bWlzc2luZyBodW5rIC8gc2V0dGluZyB2a2JfZGV2aWNlIHBlciBjb25maWcKPiAtLS0KPiB0b29s
cy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgfCA5ICsrKysrKy0tLQo+IHRvb2xzL2xpYnhsL2xpYnhs
X3R5cGVzLmlkbCB8IDEgKwo+IHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICB8IDEgKwo+IHRv
b2xzL3hsL3hsX3N4cC5jICAgICAgICAgICB8IDIgKysKPiA0IGZpbGVzIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhs
L2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBpbmRleCA4OWZl
ODBmYzljLi4wM2NlMTY2ZjRmIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0
ZS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKPiBAQCAtMzEwLDYgKzMxMCw3
IEBAIGludCBsaWJ4bF9fZG9tYWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdChsaWJ4bF9fZ2MgKmdj
LAo+ICAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZtLnZwdF9h
bGlnbiwgICAgICAgICAgdHJ1ZSk7Cj4gICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQo
JmJfaW5mby0+dS5odm0uYWx0cDJtLCAgICAgICAgICAgICBmYWxzZSk7Cj4gICAgICAgICBsaWJ4
bF9kZWZib29sX3NldGRlZmF1bHQoJmJfaW5mby0+dS5odm0udXNiLCAgICAgICAgICAgICAgICBm
YWxzZSk7Cj4gKyAgICAgICAgbGlieGxfZGVmYm9vbF9zZXRkZWZhdWx0KCZiX2luZm8tPnUuaHZt
LnZrYl9kZXZpY2UsICAgICAgICAgdHJ1ZSk7Cj4gICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRl
ZmF1bHQoJmJfaW5mby0+dS5odm0ueGVuX3BsYXRmb3JtX3BjaSwgICB0cnVlKTsKPiAKPiAgICAg
ICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVsdCgmYl9pbmZvLT51Lmh2bS5zcGljZS5lbmFibGUs
IGZhbHNlKTsKPiBAQCAtMTQxNiw5ICsxNDE3LDExIEBAIHN0YXRpYyB2b2lkIGRvbWNyZWF0ZV9s
YXVuY2hfZG0obGlieGxfX2VnYyAqZWdjLCBsaWJ4bF9fbXVsdGlkZXYgKm11bHRpZGV2LAo+ICAg
ICAgICAgbGlieGxfX2RldmljZV9jb25zb2xlX2FkZChnYywgZG9taWQsICZjb25zb2xlLCBzdGF0
ZSwgJmRldmljZSk7Cj4gICAgICAgICBsaWJ4bF9fZGV2aWNlX2NvbnNvbGVfZGlzcG9zZSgmY29u
c29sZSk7Cj4gCj4gLSAgICAgICAgbGlieGxfZGV2aWNlX3ZrYl9pbml0KCZ2a2IpOwo+IC0gICAg
ICAgIGxpYnhsX19kZXZpY2VfYWRkKGdjLCBkb21pZCwgJmxpYnhsX192a2JfZGV2dHlwZSwgJnZr
Yik7Cj4gLSAgICAgICAgbGlieGxfZGV2aWNlX3ZrYl9kaXNwb3NlKCZ2a2IpOwo+ICsgICAgICAg
IGlmIChsaWJ4bF9kZWZib29sX3ZhbChkX2NvbmZpZy0+Yl9pbmZvLnUuaHZtLnZrYl9kZXZpY2Up
KSB7Cj4gKyAgICAgICAgICAgIGxpYnhsX2RldmljZV92a2JfaW5pdCgmdmtiKTsKPiArICAgICAg
ICAgICAgbGlieGxfX2RldmljZV9hZGQoZ2MsIGRvbWlkLCAmbGlieGxfX3ZrYl9kZXZ0eXBlLCAm
dmtiKTsKPiArICAgICAgICAgICAgbGlieGxfZGV2aWNlX3ZrYl9kaXNwb3NlKCZ2a2IpOwo+ICsg
ICAgICAgIH0KPiAKPiAgICAgICAgIGRjcy0+c2Rzcy5kbS5ndWVzdF9kb21pZCA9IGRvbWlkOwo+
ICAgICAgICAgaWYgKGxpYnhsX2RlZmJvb2xfdmFsKGRfY29uZmlnLT5iX2luZm8uZGV2aWNlX21v
ZGVsX3N0dWJkb21haW4pKQo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF90eXBlcy5p
ZGwgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKPiBpbmRleCBiNjg1YWM0N2FjLi45YTBi
OTJmMWQ0IDEwMDY0NAo+IC0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ICsrKyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+IEBAIC01ODMsNiArNTgzLDcgQEAgbGlieGxf
ZG9tYWluX2J1aWxkX2luZm8gPSBTdHJ1Y3QoImRvbWFpbl9idWlsZF9pbmZvIixbCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyAtICJ0YWJsZXQiIGZvciBhYnNvbHV0
ZSBtb3VzZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjIC0gIm1v
dXNlIiBmb3IgUFMvMiBwcm90b2NvbCByZWxhdGl2ZSBtb3VzZQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICgidXNiZGV2aWNlIiwgICAgICAgIHN0cmluZyksCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgidmtiX2RldmljZSIsICAgICAg
IGxpYnhsX2RlZmJvb2wpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICgic291bmRodyIsICAgICAgICAgIHN0cmluZyksCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKCJ4ZW5fcGxhdGZvcm1fcGNpIiwgbGlieGxfZGVmYm9vbCksCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKCJ1c2JkZXZpY2VfbGlzdCIsICAg
bGlieGxfc3RyaW5nX2xpc3QpLAo+IGRpZmYgLS1naXQgYS90b29scy94bC94bF9wYXJzZS5jIGIv
dG9vbHMveGwveGxfcGFyc2UuYwo+IGluZGV4IDM1MmNkMjE0ZGQuLmUxMDViZGEyYmIgMTAwNjQ0
Cj4gLS0tIGEvdG9vbHMveGwveGxfcGFyc2UuYwo+ICsrKyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMK
PiBAQCAtMjY1Miw2ICsyNjUyLDcgQEAgc2tpcF91c2JkZXY6Cj4gICAgICAgICAgICAgZnByaW50
ZihzdGRlcnIsInhsOiBVbmFibGUgdG8gcGFyc2UgdXNiZGV2aWNlLlxuIik7Cj4gICAgICAgICAg
ICAgZXhpdCgtRVJST1JfRkFJTCk7Cj4gICAgICAgICB9Cj4gKyAgICAgICAgeGx1X2NmZ19nZXRf
ZGVmYm9vbChjb25maWcsICJ2a2JfZGV2aWNlIiwgJmJfaW5mby0+dS5odm0udmtiX2RldmljZSwg
MCk7Cj4gICAgICAgICB4bHVfY2ZnX3JlcGxhY2Vfc3RyaW5nIChjb25maWcsICJzb3VuZGh3Iiwg
JmJfaW5mby0+dS5odm0uc291bmRodywgMCk7Cj4gICAgICAgICB4bHVfY2ZnX2dldF9kZWZib29s
KGNvbmZpZywgInhlbl9wbGF0Zm9ybV9wY2kiLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmYl9pbmZvLT51Lmh2bS54ZW5fcGxhdGZvcm1fcGNpLCAwKTsKPiBkaWZmIC0tZ2l0IGEvdG9v
bHMveGwveGxfc3hwLmMgYi90b29scy94bC94bF9zeHAuYwo+IGluZGV4IDNlNjExN2QwY2QuLjM1
OWEwMDE1NzAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMveGwveGxfc3hwLmMKPiArKysgYi90b29scy94
bC94bF9zeHAuYwo+IEBAIC0xMzgsNiArMTM4LDggQEAgdm9pZCBwcmludGZfaW5mb19zZXhwKGlu
dCBkb21pZCwgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsIEZJTEUgKmZoKQo+ICAgICAg
ICAgZnByaW50ZihmaCwgIlx0XHRcdChib290ICVzKVxuIiwgYl9pbmZvLT51Lmh2bS5ib290KTsK
PiAgICAgICAgIGZwcmludGYoZmgsICJcdFx0XHQodXNiICVzKVxuIiwgbGlieGxfZGVmYm9vbF90
b19zdHJpbmcoYl9pbmZvLT51Lmh2bS51c2IpKTsKPiAgICAgICAgIGZwcmludGYoZmgsICJcdFx0
XHQodXNiZGV2aWNlICVzKVxuIiwgYl9pbmZvLT51Lmh2bS51c2JkZXZpY2UpOwo+ICsgICAgICAg
IGZwcmludGYoZmgsICJcdFx0XHQodmtiX2RldmljZSAlcylcbiIsCj4gKyAgICAgICAgICAgICAg
IGxpYnhsX2RlZmJvb2xfdG9fc3RyaW5nKGJfaW5mby0+dS5odm0udmtiX2RldmljZSkpOwo+ICAg
ICAgICAgZnByaW50ZihmaCwgIlx0XHQpXG4iKTsKPiAgICAgICAgIGJyZWFrOwo+ICAgICBjYXNl
IExJQlhMX0RPTUFJTl9UWVBFX1BWOgo+IC0tIAo+IDIuMTUuMy5BTVpOCj4gCgoKV2VpLCBhbnkg
cGFydGljdWxhciB0aG91Z2h0cyBvbiB2Mj8KCkNoZWVycywKRXNsYW0KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
