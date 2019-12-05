Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB09F1140C8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 13:23:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icq7W-0007FJ-O8; Thu, 05 Dec 2019 12:20:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SJM4=Z3=amazon.com=prvs=235339fe4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1icq7V-0007FE-6q
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 12:20:33 +0000
X-Inumbo-ID: a1924a16-1759-11ea-8223-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1924a16-1759-11ea-8223-12813bfff9fa;
 Thu, 05 Dec 2019 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575548432; x=1607084432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yjQwHfcm2MJ1OsYYUcxfoj/19d8CLsqL4T2mTmfPugU=;
 b=dL5x8BnDnlensMmzakFaYCKhy8FNdOI99UEoVLZn+PaCxRXsJXveXCWD
 ydXOzdM4aiGPKT3PSaZY2NNPVePC0s221uaBBGU2umEtmgQXxX7FbVv6V
 JWplDOVN2sUFoRtUJFi3td2zFDAf6sKsSwy2iISOGuf5+7Wsv6ZxU5fj4 I=;
IronPort-SDR: ESMzIVSY8ZIFM6ddrDvXPuBYTLI/5Tm/H37uqTho/EGgKW/gugbnGG4lnSHx2HDO6bfo/p02DP
 r7MsgKi+O7Yw==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; d="scan'208";a="13169659"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 05 Dec 2019 12:20:20 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 57DF9282165; Thu,  5 Dec 2019 12:20:19 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 12:20:18 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 12:20:17 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 5 Dec 2019 12:20:17 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] passthrough: drop break statement following c/s
 cd7dedad820
Thread-Index: AQHVq2WL/pEByCe0P0SyuL0fbPkidaerdbQg
Date: Thu, 5 Dec 2019 12:20:17 +0000
Message-ID: <79c733c0762347e7b18b148de8ec83b8@EX13D32EUC003.ant.amazon.com>
References: <1575548022-14213-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1575548022-14213-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.177]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] passthrough: drop break statement
 following c/s cd7dedad820
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "linux@eikelenboom.it" <linux@eikelenboom.it>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElnb3IgRHJ1emhpbmluIDxpZ29y
LmRydXpoaW5pbkBjaXRyaXguY29tPgo+IFNlbnQ6IDA1IERlY2VtYmVyIDIwMTkgMTI6MTQKPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gQ2M6IGpiZXVsaWNoQHN1c2UuY29t
OyBsaW51eEBlaWtlbGVuYm9vbS5pdDsgRHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24u
Y29tPjsgSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gU3ViamVj
dDogW1BBVENIIHYyXSBwYXNzdGhyb3VnaDogZHJvcCBicmVhayBzdGF0ZW1lbnQgZm9sbG93aW5n
IGMvcwo+IGNkN2RlZGFkODIwCj4gCj4gVGhlIGxvY2tpbmcgcmVzcG9uc2liaWxpdGllcyBoYXZl
IGNoYW5nZWQgYW5kIGEgcHJlbWF0dXJlIGJyZWFrIGluCj4gdGhpcyBzZWN0aW9uIG5vdyBjYXVz
ZXMgdGhlIGZvbGxvd2luZyBhc3NlcnRpb246Cj4gCj4gQXNzZXJ0aW9uICchcHJlZW1wdF9jb3Vu
dCgpJyBmYWlsZWQgYXQgcHJlZW1wdC5jOjM2Cj4gCj4gU3VnZ2VzdGVkLWJ5OiBQYXVsIER1cnJh
bnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpBY3R1YWxseSwgaXQgd2FzIHN1Z2dlc3RlZCBieSBK
YW4sIGJ1dCB5b3UgY2FuIHB1dCBteSBSLWIgb24gdGhlIHBhdGNoLgoKICBQYXVsCgo+IFJlcG9y
dGVkLWJ5OiBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4QGVpa2VsZW5ib29tLml0Pgo+IFNpZ25l
ZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IC0t
LQo+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8IDEgLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gaW5kZXggY2VkMGMyOC4u
YzA3YTYzOSAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+ICsr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gQEAgLTE3MDUsNyArMTcwNSw2IEBA
IGludCBpb21tdV9kb19wY2lfZG9tY3RsKAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNlZywg
YnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSk7Cj4gICAgICAgICAgICAgICAg
ICByZXQgPSAtRUlOVkFMOwo+ICAgICAgICAgICAgICB9Cj4gLSAgICAgICAgICAgIGJyZWFrOwo+
ICAgICAgICAgIH0KPiAgICAgICAgICBlbHNlIGlmICggIXJldCApCj4gICAgICAgICAgICAgIHJl
dCA9IGFzc2lnbl9kZXZpY2UoZCwgc2VnLCBidXMsIGRldmZuLCBmbGFncyk7Cj4gLS0KPiAyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
