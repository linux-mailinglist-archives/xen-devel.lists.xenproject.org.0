Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D1914A881
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 18:00:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw7i9-0000sz-8I; Mon, 27 Jan 2020 16:58:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5TJ9=3Q=amazon.co.uk=prvs=288783767=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iw7i7-0000su-DH
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 16:58:03 +0000
X-Inumbo-ID: 2e3e4f64-4126-11ea-8e9a-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e3e4f64-4126-11ea-8e9a-bc764e2007e4;
 Mon, 27 Jan 2020 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580144283; x=1611680283;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1u2E6QiF+OyuvzxiwYYLGuRWaTJk7dd0s8rvLhP3y+w=;
 b=eFWVn+NeBTC6acnbDM9VAwhuZUfWx8VGseG5OyhJPaD4nyZ10J3PSela
 BlGGAUx9+sQfUWnbYSeBNjQgwpfa8DP+0hFS7y0g3tryQIZCWqL31DhJh
 gaIl8Ro5H+tYF+4+9VPGU32z6FRP4EFhqYgmEuo5hSnoGPBk+xsE7UwDS o=;
IronPort-SDR: puiysKS8+Ux2DotsaJ4Ff6wxNTmMGIAq1EnK/lZEu2rcIsqL67MoiXpqDebyPX7AZPPHFIiJw/
 IWZbKYZv7/LA==
X-IronPort-AV: E=Sophos;i="5.70,370,1574121600"; d="scan'208";a="14414454"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 27 Jan 2020 16:58:02 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id 91186A2707; Mon, 27 Jan 2020 16:57:59 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 16:57:59 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 16:57:58 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 27 Jan 2020 16:57:57 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@eu.citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] docs: Fix StudlyCaps in libxc-migration-stream.pandoc
 and xl.1.pod
Thread-Index: AQHV1TFxA1WoTBta3U+kXl/rmsbdtKf+uxiQ
Date: Mon, 27 Jan 2020 16:57:57 +0000
Message-ID: <7d8076d81f53462999e109fff47ad38d@EX13D32EUC003.ant.amazon.com>
References: <20200127164547.5993-1-ian.jackson@eu.citrix.com>
In-Reply-To: <20200127164547.5993-1-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.48]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] docs: Fix StudlyCaps in
 libxc-migration-stream.pandoc and xl.1.pod
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgo+IFNlbnQ6IDI3IEphbnVhcnkgMjAyMCAxNjo0Ngo+IFRvOiB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzogRHVycmFudCwgUGF1bCA8cGR1cnJh
bnRAYW1hem9uLmNvLnVrPjsgSWFuIEphY2tzb24KPiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+
Owo+IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFsbCA8anVsaWVu
QHhlbi5vcmc+OyBLb25yYWQKPiBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IFN1Ympl
Y3Q6IFtQQVRDSF0gZG9jczogRml4IFN0dWRseUNhcHMgaW4gbGlieGMtbWlncmF0aW9uLXN0cmVh
bS5wYW5kb2MgYW5kCj4geGwuMS5wb2QKPiAKPiAkIGdpdC1ncmVwIGxpYnhlbmN0cmwgfCB3YyAt
bAo+IDk5Cj4gJCBnaXQtZ3JlcCBsaWJ4YyB8IHdjIC1sCj4gMjA2Cj4gJCBnaXQtZ3JlcCBsaWJ4
ZW5saWdodCB8IHdjIC1sCj4gNDgKPiAkIGdpdC1ncmVwIGxpYnhsIHwgd2MgLWwKPiAxMzQzMwo+
ICQgZ2l0LWdyZXAgTGliWGVuIHwgd2MgLWwKPiAyCj4gJAo+IAo+IFJlcG9ydGVkLWJ5OiBQYXVs
IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gLS0tCj4gIGRvY3MvbWFuL3hsLjEucG9k
LmluICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gIGRvY3Mvc3BlY3MvbGlieGMtbWlncmF0
aW9uLXN0cmVhbS5wYW5kb2MgfCAyICstCgpXaGF0IGFib3V0IGRvY3Mvc3BlY3MvbGlieGwtbWln
cmF0aW9uLXN0cmVhbS5wYW5kb2M/IEl0IGNvdWxkIHVzZSBhIHNpbWlsYXIgZml4IHdoaWxlIHlv
dSdyZSBhdCBpdC4KCiAgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
