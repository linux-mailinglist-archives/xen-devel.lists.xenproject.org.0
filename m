Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 971EA129335
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2019 09:42:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijJFF-0006dw-JJ; Mon, 23 Dec 2019 08:39:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Htmo=2N=amazon.com=prvs=2537494bb=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ijJFE-0006dq-D1
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2019 08:39:16 +0000
X-Inumbo-ID: b40b5d0e-255f-11ea-88e7-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b40b5d0e-255f-11ea-88e7-bc764e2007e4;
 Mon, 23 Dec 2019 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1577090357; x=1608626357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RlltwVvG/+afOEqrUoqxw7MA5aA9XRDhObWIO9rA6Ts=;
 b=gBKsge3I9453O+qaF9GwDzQFR43gFc96kP2VKRC1E7RogUoWpmIUXSqX
 Wwl8FpT91bqC7DSeaipnk4lNuQVB5bxdc56FDq/ieNUISZLKC5TIasmCA
 wbDLa6uQ6oP74eDay3Ff4v5su4pB7cYmuH9oByxgE/ABcTy/9GxHN3YB4 o=;
IronPort-SDR: i+a1ybXnSTwvS4id7RxSrPeMs66KuAzuYI8jA5/O+gegadVYfyJg7pD6wuryhIGLkvnybVq75S
 FZ4swZc8Ol7A==
X-IronPort-AV: E=Sophos;i="5.69,346,1571702400"; 
   d="scan'208";a="9693841"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 23 Dec 2019 08:39:16 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 63CE8A27F3; Mon, 23 Dec 2019 08:39:14 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Dec 2019 08:39:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 23 Dec 2019 08:39:13 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 23 Dec 2019 08:39:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/3] x86/viridian: drop viridian_stimer_config_msr
Thread-Index: AQHVuR51uGc6Esz4GUu6yHe/btxLAafHZolw
Date: Mon, 23 Dec 2019 08:39:12 +0000
Message-ID: <1c330a97466540b6b06bd641021a28ab@EX13D32EUC003.ant.amazon.com>
References: <20191222232035.31613-1-liuwe@microsoft.com>
 <20191222232035.31613-4-liuwe@microsoft.com>
In-Reply-To: <20191222232035.31613-4-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 3/3] x86/viridian: drop
 viridian_stimer_config_msr
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAyMiBEZWNlbWJlciAyMDE5
IDIzOjIxCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IFBhdWwgRHVycmFudAo+IDxwYXVsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggMy8zXSB4ODYvdmlyaWRpYW46IGRyb3Ag
dmlyaWRpYW5fc3RpbWVyX2NvbmZpZ19tc3IKPiAKPiBVc2UgaHZfc3RpbWVyX2NvbmZpZyBpbnN0
ZWFkLiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxs
aXV3ZUBtaWNyb3NvZnQuY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4u
b3JnPgoKPiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMgICB8IDI4ICsr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmly
aWRpYW4uaCB8IDE5ICstLS0tLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS92aXJpZGlhbi90aW1lLmMKPiBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4vdGlt
ZS5jCj4gaW5kZXggMGYxY2Q5ZTIwOC4uM2RlNTY2NWMwMiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRp
YW4vdGltZS5jCj4gQEAgLTIyMCw3ICsyMjAsNyBAQCBzdGF0aWMgdm9pZCBwb2xsX3N0aW1lcihz
dHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgaW50Cj4gc3RpbWVyeCkKPiAgICAgICAqIGlzIGRpc2Fi
bGVkIG1ha2Ugc3VyZSB0aGUgcGVuZGluZyBiaXQgaXMgY2xlYXJlZCB0byBhdm9pZCByZS0KPiAg
ICAgICAqIHBvbGxpbmcuCj4gICAgICAgKi8KPiAtICAgIGlmICggIXZzLT5jb25maWcuZW5hYmxl
ZCApCj4gKyAgICBpZiAoICF2cy0+Y29uZmlnLmVuYWJsZSApCj4gICAgICB7Cj4gICAgICAgICAg
Y2xlYXJfYml0KHN0aW1lcngsICZ2di0+c3RpbWVyX3BlbmRpbmcpOwo+ICAgICAgICAgIHJldHVy
bjsKPiBAQCAtMjM5LDcgKzIzOSw3IEBAIHN0YXRpYyB2b2lkIHBvbGxfc3RpbWVyKHN0cnVjdCB2
Y3B1ICp2LCB1bnNpZ25lZCBpbnQKPiBzdGltZXJ4KQo+ICAgICAgaWYgKCB2cy0+Y29uZmlnLnBl
cmlvZGljICkKPiAgICAgICAgICBzdGFydF9zdGltZXIodnMpOwo+ICAgICAgZWxzZQo+IC0gICAg
ICAgIHZzLT5jb25maWcuZW5hYmxlZCA9IDA7Cj4gKyAgICAgICAgdnMtPmNvbmZpZy5lbmFibGUg
PSAwOwo+ICB9Cj4gCj4gIHZvaWQgdmlyaWRpYW5fdGltZV9wb2xsX3RpbWVycyhzdHJ1Y3QgdmNw
dSAqdikKPiBAQCAtMjg1LDcgKzI4NSw3IEBAIHN0YXRpYyB2b2lkIHRpbWVfdmNwdV90aGF3KHN0
cnVjdCB2Y3B1ICp2KQo+ICAgICAgewo+ICAgICAgICAgIHN0cnVjdCB2aXJpZGlhbl9zdGltZXIg
KnZzID0gJnZ2LT5zdGltZXJbaV07Cj4gCj4gLSAgICAgICAgaWYgKCB2cy0+Y29uZmlnLmVuYWJs
ZWQgKQo+ICsgICAgICAgIGlmICggdnMtPmNvbmZpZy5lbmFibGUgKQo+ICAgICAgICAgICAgICBz
dGFydF9zdGltZXIodnMpOwo+ICAgICAgfQo+ICB9Cj4gQEAgLTM1NSwxMiArMzU1LDEyIEBAIGlu
dCB2aXJpZGlhbl90aW1lX3dybXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdAo+IGlkeCwgdWlu
dDY0X3QgdmFsKQo+IAo+ICAgICAgICAgIHN0b3Bfc3RpbWVyKHZzKTsKPiAKPiAtICAgICAgICB2
cy0+Y29uZmlnLnJhdyA9IHZhbDsKPiArICAgICAgICB2cy0+Y29uZmlnLmFzX3VpbnQ2NCA9IHZh
bDsKPiAKPiAgICAgICAgICBpZiAoICF2cy0+Y29uZmlnLnNpbnR4ICkKPiAtICAgICAgICAgICAg
dnMtPmNvbmZpZy5lbmFibGVkID0gMDsKPiArICAgICAgICAgICAgdnMtPmNvbmZpZy5lbmFibGUg
PSAwOwo+IAo+IC0gICAgICAgIGlmICggdnMtPmNvbmZpZy5lbmFibGVkICkKPiArICAgICAgICBp
ZiAoIHZzLT5jb25maWcuZW5hYmxlICkKPiAgICAgICAgICAgICAgc3RhcnRfc3RpbWVyKHZzKTsK
PiAKPiAgICAgICAgICBicmVhazsKPiBAQCAtMzgzLDExICszODMsMTEgQEAgaW50IHZpcmlkaWFu
X3RpbWVfd3Jtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90Cj4gaWR4LCB1aW50NjRfdCB2YWwp
Cj4gICAgICAgICAgdnMtPmNvdW50ID0gdmFsOwo+IAo+ICAgICAgICAgIGlmICggIXZzLT5jb3Vu
dCAgKQo+IC0gICAgICAgICAgICB2cy0+Y29uZmlnLmVuYWJsZWQgPSAwOwo+ICsgICAgICAgICAg
ICB2cy0+Y29uZmlnLmVuYWJsZSA9IDA7Cj4gICAgICAgICAgZWxzZSBpZiAoIHZzLT5jb25maWcu
YXV0b19lbmFibGUgKQo+IC0gICAgICAgICAgICB2cy0+Y29uZmlnLmVuYWJsZWQgPSAxOwo+ICsg
ICAgICAgICAgICB2cy0+Y29uZmlnLmVuYWJsZSA9IDE7Cj4gCj4gLSAgICAgICAgaWYgKCB2cy0+
Y29uZmlnLmVuYWJsZWQgKQo+ICsgICAgICAgIGlmICggdnMtPmNvbmZpZy5lbmFibGUgKQo+ICAg
ICAgICAgICAgICBzdGFydF9zdGltZXIodnMpOwo+IAo+ICAgICAgICAgIGJyZWFrOwo+IEBAIC00
NTQsNyArNDU0LDcgQEAgaW50IHZpcmlkaWFuX3RpbWVfcmRtc3IoY29uc3Qgc3RydWN0IHZjcHUg
KnYsIHVpbnQzMl90Cj4gaWR4LCB1aW50NjRfdCAqdmFsKQo+ICAgICAgICAgIHVuc2lnbmVkIGlu
dCBzdGltZXJ4ID0gKGlkeCAtIEhWX1g2NF9NU1JfU1RJTUVSMF9DT05GSUcpIC8gMjsKPiAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgdmlyaWRpYW5fc3RpbWVyICp2cyA9Cj4gICAgICAgICAgICAgICZh
cnJheV9hY2Nlc3Nfbm9zcGVjKHZ2LT5zdGltZXIsIHN0aW1lcngpOwo+IC0gICAgICAgIHVuaW9u
IHZpcmlkaWFuX3N0aW1lcl9jb25maWdfbXNyIGNvbmZpZyA9IHZzLT5jb25maWc7Cj4gKyAgICAg
ICAgdW5pb24gaHZfc3RpbWVyX2NvbmZpZyBjb25maWcgPSB2cy0+Y29uZmlnOwo+IAo+ICAgICAg
ICAgIGlmICggISh2aXJpZGlhbl9mZWF0dXJlX21hc2soZCkgJiBIVk1QVl9zdGltZXIpICkKPiAg
ICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfRVhDRVBUSU9OOwo+IEBAIC00NjQsOSArNDY0LDkg
QEAgaW50IHZpcmlkaWFuX3RpbWVfcmRtc3IoY29uc3Qgc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90
Cj4gaWR4LCB1aW50NjRfdCAqdmFsKQo+ICAgICAgICAgICAqIHRoZSBlbmFibGVkIGZsYWcgaXMg
Y2xlYXIuCj4gICAgICAgICAgICovCj4gICAgICAgICAgaWYgKCAhY29uZmlnLnBlcmlvZGljICYm
IHRlc3RfYml0KHN0aW1lcngsICZ2di0+c3RpbWVyX3BlbmRpbmcpICkKPiAtICAgICAgICAgICAg
Y29uZmlnLmVuYWJsZWQgPSAwOwo+ICsgICAgICAgICAgICBjb25maWcuZW5hYmxlID0gMDsKPiAK
PiAtICAgICAgICAqdmFsID0gY29uZmlnLnJhdzsKPiArICAgICAgICAqdmFsID0gY29uZmlnLmFz
X3VpbnQ2NDsKPiAgICAgICAgICBicmVhazsKPiAgICAgIH0KPiAKPiBAQCAtNTQ5LDcgKzU0OSw3
IEBAIHZvaWQgdmlyaWRpYW5fdGltZV9zYXZlX3ZjcHVfY3R4dCgKPiAgICAgIHsKPiAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgdmlyaWRpYW5fc3RpbWVyICp2cyA9ICZ2di0+c3RpbWVyW2ldOwo+IAo+
IC0gICAgICAgIGN0eHQtPnN0aW1lcl9jb25maWdfbXNyW2ldID0gdnMtPmNvbmZpZy5yYXc7Cj4g
KyAgICAgICAgY3R4dC0+c3RpbWVyX2NvbmZpZ19tc3JbaV0gPSB2cy0+Y29uZmlnLmFzX3VpbnQ2
NDsKPiAgICAgICAgICBjdHh0LT5zdGltZXJfY291bnRfbXNyW2ldID0gdnMtPmNvdW50Owo+ICAg
ICAgfQo+ICB9Cj4gQEAgLTU2NCw3ICs1NjQsNyBAQCB2b2lkIHZpcmlkaWFuX3RpbWVfbG9hZF92
Y3B1X2N0eHQoCj4gICAgICB7Cj4gICAgICAgICAgc3RydWN0IHZpcmlkaWFuX3N0aW1lciAqdnMg
PSAmdnYtPnN0aW1lcltpXTsKPiAKPiAtICAgICAgICB2cy0+Y29uZmlnLnJhdyA9IGN0eHQtPnN0
aW1lcl9jb25maWdfbXNyW2ldOwo+ICsgICAgICAgIHZzLT5jb25maWcuYXNfdWludDY0ID0gY3R4
dC0+c3RpbWVyX2NvbmZpZ19tc3JbaV07Cj4gICAgICAgICAgdnMtPmNvdW50ID0gY3R4dC0+c3Rp
bWVyX2NvdW50X21zcltpXTsKPiAgICAgIH0KPiAgfQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2h2bS92aXJpZGlhbi5oIGIveGVuL2luY2x1ZGUvYXNtLQo+IHg4Ni9odm0vdmly
aWRpYW4uaAo+IGluZGV4IGQ2OTRkODM1MjEuLmQ5MTM4NTYyZTYgMTAwNjQ0Cj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9odm0vdmlyaWRpYW4uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL3ZpcmlkaWFuLmgKPiBAQCAtMjgsMjcgKzI4LDEwIEBAIHN0cnVjdCB2aXJpZGlhbl9w
YWdlCj4gICAgICB2b2lkICpwdHI7Cj4gIH07Cj4gCj4gLXVuaW9uIHZpcmlkaWFuX3N0aW1lcl9j
b25maWdfbXNyCj4gLXsKPiAtICAgIHVpbnQ2NF90IHJhdzsKPiAtICAgIHN0cnVjdAo+IC0gICAg
ewo+IC0gICAgICAgIHVpbnQ2NF90IGVuYWJsZWQ6MTsKPiAtICAgICAgICB1aW50NjRfdCBwZXJp
b2RpYzoxOwo+IC0gICAgICAgIHVpbnQ2NF90IGxhenk6MTsKPiAtICAgICAgICB1aW50NjRfdCBh
dXRvX2VuYWJsZToxOwo+IC0gICAgICAgIHVpbnQ2NF90IHZlY3Rvcjo4Owo+IC0gICAgICAgIHVp
bnQ2NF90IGRpcmVjdF9tb2RlOjE7Cj4gLSAgICAgICAgdWludDY0X3QgcmVzZXJ2ZWRfemVybzE6
MzsKPiAtICAgICAgICB1aW50NjRfdCBzaW50eDo0Owo+IC0gICAgICAgIHVpbnQ2NF90IHJlc2Vy
dmVkX3plcm8yOjQ0Owo+IC0gICAgfTsKPiAtfTsKPiAtCj4gIHN0cnVjdCB2aXJpZGlhbl9zdGlt
ZXIgewo+ICAgICAgc3RydWN0IHZjcHUgKnY7Cj4gICAgICBzdHJ1Y3QgdGltZXIgdGltZXI7Cj4g
LSAgICB1bmlvbiB2aXJpZGlhbl9zdGltZXJfY29uZmlnX21zciBjb25maWc7Cj4gKyAgICB1bmlv
biBodl9zdGltZXJfY29uZmlnIGNvbmZpZzsKPiAgICAgIHVpbnQ2NF90IGNvdW50Owo+ICAgICAg
dWludDY0X3QgZXhwaXJhdGlvbjsKPiAgICAgIGJvb2wgc3RhcnRlZDsKPiAtLQo+IDIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
