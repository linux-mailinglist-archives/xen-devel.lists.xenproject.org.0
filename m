Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1C8C2E61
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 09:47:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFCq0-0003WV-Co; Tue, 01 Oct 2019 07:44:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=71kl=X2=amazon.de=prvs=17079a38a=wipawel@srs-us1.protection.inumbo.net>)
 id 1iFCpy-0003WQ-Dm
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 07:44:46 +0000
X-Inumbo-ID: 55d23eb5-e41f-11e9-96f3-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by localhost (Halon) with ESMTPS
 id 55d23eb5-e41f-11e9-96f3-12813bfff9fa;
 Tue, 01 Oct 2019 07:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1569915885; x=1601451885;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=aEiuSRDDnnCPtqwdG8QjB4yq/v2HWbBc48NwgXlXijU=;
 b=nnWAiAVH4gSy4lzQb9uiwxUmQtQTnjoVj9j0L04IKUfxlGeiRDN2nmzF
 Nrqx0SSTTW0k21q7VLFMEtehV07CFQI4DxyyMgOQWnEDSZG3u+W7yVa/z
 dYgL05KOuFeln0psrBC+xJ3C1QKd96FJfI+7vnXxQ5rFEq62pt6k2Srqa s=;
X-IronPort-AV: E=Sophos;i="5.64,570,1559520000"; d="scan'208";a="754542225"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 01 Oct 2019 07:44:43 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 94520A2233; Tue,  1 Oct 2019 07:44:38 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 07:44:37 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 1 Oct 2019 07:44:36 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 1 Oct 2019 07:44:37 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v4 12/12] livepatch: Add python bindings for
 livepatch operations
Thread-Index: AQHVdg9f59XCTvGHmUS00tlcD1cJ+KdEVzkAgAEUzQA=
Date: Tue, 1 Oct 2019 07:44:37 +0000
Message-ID: <A678A340-7913-4ED7-B5E4-24743E70BC8E@amazon.com>
References: <20190928151305.127380-1-wipawel@amazon.de>
 <20190928151305.127380-13-wipawel@amazon.de>
 <257215dc-4219-cae7-5d3d-af806664a5e3@citrix.com>
In-Reply-To: <257215dc-4219-cae7-5d3d-af806664a5e3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.48]
Content-ID: <9705AFACBE037548A032D3DB5E2C59F2@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 12/12] livepatch: Add python bindings for
 livepatch operations
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 =?iso-8859-1?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, "Pohlack, Martin" <mpohlack@amazon.de>,
 "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDMwLiBTZXAgMjAxOSwgYXQgMTc6MTMsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPiB3cm90ZToKPiAKPiBPbiA5LzI4LzE5IDQ6MTMgUE0sIFBhd2VsIFdp
ZWN6b3JraWV3aWN6IHdyb3RlOgo+PiBFeHRlbmQgdGhlIFhDIHB5dGhvbiBiaW5kaW5ncyBsaWJy
YXJ5IHRvIHN1cHBvcnQgYWxzbyBhbGwgY29tbW9uCnNuaXAKPj4gCj4+ICsKPj4gKyAgICBmZCA9
IG9wZW4oZmlsZW5hbWUsIE9fUkRPTkxZKTsKPj4gKyAgICBpZiAoIGZkIDwgMCApCj4+ICsgICAg
ICAgIGdvdG8gZXJyb3I7Cj4+ICsKPj4gKyAgICBpZiAoIGZzdGF0KGZkLCAmYnVmKSAhPSAwICkK
Pj4gKyAgICAgICAgZ290byBlcnJvcjsKPj4gKwo+PiArICAgIGxlbiA9IGJ1Zi5zdF9zaXplOwo+
PiArICAgIGZidWYgPSBtbWFwKDAsIGxlbiwgUFJPVF9SRUFELCBNQVBfUFJJVkFURSwgZmQsIDAp
Owo+PiArICAgIGlmICggZmJ1ZiA9PSBNQVBfRkFJTEVEICkKPj4gKyAgICAgICAgZ290byBlcnJv
cjsKPj4gKwo+PiArICAgIHJjID0geGNfbGl2ZXBhdGNoX3VwbG9hZChzZWxmLT54Y19oYW5kbGUs
IG5hbWUsIGZidWYsIGxlbik7Cj4+ICsKPj4gKyAgICBzYXZlZF9lcnJubyA9IGVycm5vOwo+PiAr
ICAgIG11bm1hcChmYnVmLCBsZW4pOwo+PiArICAgIGNsb3NlKGZkKTsKPj4gKyAgICBlcnJubyA9
IHNhdmVkX2Vycm5vOwo+PiArCj4+ICtlcnJvcjoKPj4gKyAgICByZXR1cm4gcmMgPyBweXhjX2Vy
cm9yX3RvX2V4Y2VwdGlvbihzZWxmLT54Y19oYW5kbGUpIDogUHlfTm9uZTsKPj4gK30KPj4gKwo+
IFRoZSBmc3RhdCgpIGFuZCBtbWFwKCkgZXJyb3IgcGF0aHMgbGVhayBmZCBvbiBlcnJvci4KPiAK
Ck9oIGJveSwgdGhlIGJldHRlciBpcyBzb21ldGltZXMgYW4gZW5lbXkgb2YgZ29vZCA6LSkuCkkg
d2lsbCBmaXggaXQsIHRoYW5rcyEKCj4gUmVnYXJkcywKPiAtLSAKPiBSb3NzIExhZ2Vyd2FsbAoK
QmVzdCBSZWdhcmRzLApQYXdlbCBXaWVjem9ya2lld2ljegoKCgoKCgpBbWF6b24gRGV2ZWxvcG1l
bnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hh
ZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJh
Z2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6
OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
