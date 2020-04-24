Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E81B7AF5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 18:01:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jS0l1-0006gi-6e; Fri, 24 Apr 2020 16:00:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mnRG=6I=amazon.co.uk=prvs=376452958=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jS0kz-0006gZ-EE
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 16:00:49 +0000
X-Inumbo-ID: c3a13874-8644-11ea-94d3-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3a13874-8644-11ea-94d3-12813bfff9fa;
 Fri, 24 Apr 2020 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1587744049; x=1619280049;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=cRXocry/SdioOAei97bJC5uvtohzfyAW1c6Zgm3xsq0=;
 b=skC2LTJbX9oLJopVviWbi9VGd3s82sHGEW6XoIDH/m2v3bEKEuJAvS9r
 ntu2rNrRMK2JVoYKwE/C7mM5X4lACTwjNXa7PDedik4WWjhS5LG6oYHkT
 Z3bCZ/pGewabHnbzZXtOROpaiYzq5zJYfVsaT81BH7Llc9Egt08H64sq4 A=;
IronPort-SDR: wHfuHWvDSaCzXv+GsK6wl2GSTzuQvKxwPkfpBM/9q0z3Risn2TbO96NBRUlMqKS7+KWOA3Nu4K
 tamy/xEHTqWg==
X-IronPort-AV: E=Sophos;i="5.73,311,1583193600"; d="scan'208";a="28596034"
Subject: RE: [ANNOUNCE] Xen 4.14 Development Update
Thread-Topic: [ANNOUNCE] Xen 4.14 Development Update
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 24 Apr 2020 16:00:35 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id B8EC3A1D86; Fri, 24 Apr 2020 16:00:33 +0000 (UTC)
Received: from EX13D37EUB003.ant.amazon.com (10.43.166.251) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 24 Apr 2020 16:00:32 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D37EUB003.ant.amazon.com (10.43.166.251) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 24 Apr 2020 16:00:31 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 24 Apr 2020 16:00:32 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Index: AQHWGguEBjuxACUXz0mOoCZT0DeYwaiIbR6AgAABnfA=
Date: Fri, 24 Apr 2020 16:00:31 +0000
Message-ID: <6a05129703be4d34873ee5a21a808e8e@EX13D32EUC003.ant.amazon.com>
References: <20200424073859.89-1-paul@xen.org>
 <CABfawh=Vkwp96Q=2sFDYXAQrCHqA-MWxZHxfdTJx-fMEs0Md2Q@mail.gmail.com>
In-Reply-To: <CABfawh=Vkwp96Q=2sFDYXAQrCHqA-MWxZHxfdTJx-fMEs0Md2Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.8]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, "Woodhouse, David" <dwmw@amazon.co.uk>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiANCj4gPiAqICBWTSBmb3JraW5nICh2MTEp
DQo+ID4gICAtICBUYW1hcyBLIExlbmd5ZWwNCj4gDQo+IHYxNyBzZW50IHJlY2VudGx5LCBoeXBl
cnZpc29yIHNpZGUgaXMgY29tcGxldGVseSBtZXJnZWQsIG9ubHkgdGhlDQo+IHRvb2xzdGFjayBw
YXRjaCBpcyB3YWl0aW5nIGZvciByZXZpZXcgJiBtZXJnZQ0KPiANCg0KVGhhbmtzIGZvciB0aGUg
dXBkYXRlLg0KDQogIFBhdWwNCg==

