Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942DE17C10B
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 15:57:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAEN2-0004kh-7G; Fri, 06 Mar 2020 14:54:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cGyn=4X=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jAEN1-0004kc-1K
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 14:54:35 +0000
X-Inumbo-ID: 63c59ec8-5fba-11ea-b74d-bc764e2007e4
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63c59ec8-5fba-11ea-b74d-bc764e2007e4;
 Fri, 06 Mar 2020 14:54:33 +0000 (UTC)
X-ASG-Debug-ID: 1583506472-0dce56145dbdb90001-RNp3Ad
Received: from mail.ainfosec.com ([10.201.1.88]) by mail.ainfosec.com with
 ESMTP id N51Kll0cMOjh4dd0 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384
 bits=256 verify=NO); Fri, 06 Mar 2020 09:54:32 -0500 (EST)
X-Barracuda-Envelope-From: rosbrookn@ainfosec.com
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Fri, 6 Mar
 2020 09:54:32 -0500
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Fri, 6 Mar 2020 09:54:31 -0500
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.007; Fri, 6 Mar 2020 09:54:31 -0500
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] golang/xenlight: Fix handling of marshalling of empty
 elements for keyed unions
X-ASG-Orig-Subj: Re: [PATCH] golang/xenlight: Fix handling of marshalling of
 empty elements for keyed unions
Thread-Index: AQHV86vxQFhe+HxrgEmlV58KPfaDIag7pSqj
Date: Fri, 6 Mar 2020 14:54:31 +0000
Message-ID: <95b61c2b510945b89d1086fbf84d57c4@ainfosec.com>
References: <20200306113939.693911-1-george.dunlap@citrix.com>
In-Reply-To: <20200306113939.693911-1-george.dunlap@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.101.172]
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.201.1.88]
X-Barracuda-Start-Time: 1583506472
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://10.69.69.46:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at ainfosec.com
X-Barracuda-Scan-Msg-Size: 1735
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5143 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.80486
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Fix handling of
 marshalling of empty elements for keyed unions
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBLZXllZCB0eXBlcyBpbiBsaWJ4bF90eXBlcy5pZGwgY2FuIGhhdmUgZWxlbWVudHMgb2YgdHlw
ZSAnTm9uZScuwqAgVGhlCj4gZ29sYW5nIHR5cGUgZ2VuZXJhdG9yIChjb3JyZWN0bHkpIGRvbid0
IGltcGxlbWVudCBhbnkgdW5pb24gdHlwZXMgZm9yCj4gdGhlc2UgZW1wdHkgZWxlbWVudHMuwqAg
SG93ZXZlciwgdGhlIHRvQyBhbmQgZnJvbUMgaGVscGVyIGdlbmVyYXRvcnMKPiBpbmNvcnJlY3Rs
eSB0cmVhdCB0aGVzZSBlbGVtZW50cyBhcyBpbnZhbGlkLgo+Cj4gQ29uc2lkZXIgZm9yIGV4YW1w
bGUsIGxpYnhsX2NoYW5uZWxpbmZvLsKgIFRoZSBpZGwgY29udGFpbnMgdGhlCj4gZm9sbG93aW5n
IGtleWVkIGVsZW1lbnQ6Cj4KPiDCoMKgwqAgKCJ1IiwgS2V5ZWRVbmlvbihOb25lLCBsaWJ4bF9j
aGFubmVsX2Nvbm5lY3Rpb24sICJjb25uZWN0aW9uIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBb
KCJ1bmtub3duIiwgTm9uZSksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoInB0eSIsIFN0cnVj
dChOb25lLCBbKCJwYXRoIiwgc3RyaW5nKSxdKSksCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAo
InNvY2tldCIsIE5vbmUpLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIF0pKSwKPgo+IEJ1dCB0aGUg
dG9DIG1hcnNoYWxsZXIgY3VycmVudGx5IGxvb2tzIGxpa2UgdGhpczoKPiAKPiDCoMKgwqDCoMKg
wqDCoCBzd2l0Y2ggeC5Db25uZWN0aW9uIHsKPiDCoMKgwqDCoMKgwqDCoCBjYXNlIENoYW5uZWxD
b25uZWN0aW9uUHR5Ogo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0bXAsIG9rIDo9
IHguQ29ubmVjdGlvblVuaW9uLihDaGFubmVsaW5mb0Nvbm5lY3Rpb25VbmlvblB0eSkKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgIW9rIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnJvcnMuTmV3KCJ3cm9uZyB0eXBl
IGZvciB1bmlvbiBrZXkgY29ubmVjdGlvbiIpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFyIHB0eSBDLmxpYnhsX2No
YW5uZWxpbmZvX2Nvbm5lY3Rpb25fdW5pb25fcHR5Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmIHRtcC5QYXRoICE9ICIiIHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHB0eS5wYXRoID0gQy5DU3RyaW5nKHRtcC5QYXRoKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHB0eUJ5dGVzIDo9IEMuR29CeXRlcyh1bnNhZmUuUG9pbnRlcigmcHR5KSwgQy5zaXplb2Zf
bGlieGxfY2hhbm5lbGluZm9fY29ubmVjdGlvbl91bmlvbl9wdHkpCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvcHkoeGMudVs6XSwgcHR5Qnl0ZXMpCj4gwqDCoMKgwqDCoMKgwqAg
ZGVmYXVsdDoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGZtdC5FcnJv
cmYoImludmFsaWQgdW5pb24ga2V5ICcldiciLCB4LkNvbm5lY3Rpb24pCj4gwqDCoMKgwqDCoMKg
wqAgfQo+Cj4gV2hpY2ggbWVhbnMgdG9DKCkgd2lsbCBmYWlsIGZvciBDaGFubmVsQ29ubmVjdGlv
blVua25vd24gb3IKPiBDaGFubmVsQ29ubmVjdGlvblNvY2tldC4KPgo+IE1vZGlmeSB0aGUgZ2Vu
ZXJhdG9yIHRvIGhhbmRsZSBrZXllZCB1bmlvbiBlbGVtZW50cyBvZiB0eXBlICdOb25lJy4KPiBG
b3IgZnJvbUMsIHNldCB0aGUgdmFsdWUgdG8gJ25pbCc7IGZvciB0b0MsIGxlYXZlIHRoaW5ncyBh
cy1pcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMu
Y29tPgoKCiAgICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
