Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233F2124A91
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 16:02:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihalx-0006GL-4t; Wed, 18 Dec 2019 14:57:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cNHo=2I=amazon.com=prvs=24851c453=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ihalu-0006GF-VQ
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:57:54 +0000
X-Inumbo-ID: bfeba762-21a6-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfeba762-21a6-11ea-b6f1-bc764e2007e4;
 Wed, 18 Dec 2019 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576681067; x=1608217067;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z47/nWIAIbiT1LsZnLmczH9ZcZ9HZWSkuZsOnvP7DSc=;
 b=N/eHH3aW8Hr3qRVtk4B/VylafXUCstV27KiahUHvacbllfP4v0MaMQU5
 d62I/x71w+Sbo5PCgfh6EVK4n+O7cD07zmGAr/6wXy3YiMcAUZLIbZYpF
 krhQWt0lVcqmELwUKbuL+af0kUER7wKuyCQzHbGqlu9PT6U15H3hBbg7o M=;
IronPort-SDR: 1+AzChT7tnFXC44W028bUI54r9ko6jzqmOMqUwobjnk/5GeZa/CciCQZhxJuHMSESg3grzWHTp
 iRoy7XdKSJCQ==
X-IronPort-AV: E=Sophos;i="5.69,329,1571702400"; d="scan'208";a="15642254"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 18 Dec 2019 14:57:36 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6F28EA061C; Wed, 18 Dec 2019 14:57:34 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 14:57:33 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Dec 2019 14:57:33 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 18 Dec 2019 14:57:33 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 3/6] x86/viridian: drop private copy of definitions
 from synic.c
Thread-Index: AQHVtbGFqHPdamhv+U+cJD7jgrcxXqe/+2Zw
Date: Wed, 18 Dec 2019 14:57:32 +0000
Message-ID: <77c842abb5614388a0a275f4b34c838e@EX13D32EUC003.ant.amazon.com>
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-4-liuwe@microsoft.com>
In-Reply-To: <20191218144233.15372-4-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.29]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 3/6] x86/viridian: drop private copy of
 definitions from synic.c
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
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5
IDE0OjQzCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IE1pY2hhZWwgS2VsbGV5IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsg
RHVycmFudCwgUGF1bAo+IDxwZHVycmFudEBhbWF6b24uY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IFBhdWwgRHVycmFudAo+IDxwYXVsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy82XSB4ODYvdmlyaWRpYW46IGRy
b3AgcHJpdmF0ZSBjb3B5IG9mIGRlZmluaXRpb25zCj4gZnJvbSBzeW5pYy5jCj4gCj4gVXNlIGh5
cGVydi10bGZzLmggaW5zdGVhZC4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KClJldmlld2VkLWJ5
OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
