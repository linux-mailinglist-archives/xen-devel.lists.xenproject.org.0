Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC95658FFF
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2019 03:54:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgg1V-0001ph-Tp; Fri, 28 Jun 2019 01:49:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hXUM=U3=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hgg1U-0001pc-TN
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2019 01:49:56 +0000
X-Inumbo-ID: 06d16e3a-9947-11e9-8980-bc764e045a96
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 06d16e3a-9947-11e9-8980-bc764e045a96;
 Fri, 28 Jun 2019 01:49:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 18:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,425,1557212400"; d="scan'208";a="162829205"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga008.fm.intel.com with ESMTP; 27 Jun 2019 18:49:52 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 18:49:52 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 18:49:52 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.185]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.246]) with mapi id 14.03.0439.000;
 Fri, 28 Jun 2019 09:49:49 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/vvmx: set CR4 before CR0
Thread-Index: AQHVLFGzCnDPBbcMiUOxeOsSEBUjVqawTszw
Date: Fri, 28 Jun 2019 01:49:49 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CAA474D@SHSMSX104.ccr.corp.intel.com>
References: <20190626190212.15365-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190626190212.15365-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNTc1YzYzMjAtYTc5Ni00MjBjLThiYTktN2VhNzQxODhmODQ5IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiS0lCVDBNc0RxKzZVeGlJdDB6cVNJN1NpdmJOUFMzTmFvMXRKUXFCb21CeUJTTWlNN3dJM2pUQ0lPbWhcL2UzTngifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: set CR4 before CR0
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVGh1cnNkYXksIEp1bmUgMjcsIDIwMTkgMzowMiBBTQ0KPiANCj4gRnJvbTogU2Vy
Z2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPg0KPiANCj4gT3RoZXJ3aXNlIGh2
bV9zZXRfY3IwKCkgd2lsbCBjaGVjayB0aGUgd3JvbmcgQ1I0IGJpdHMgKEwxIGluc3RlYWQgb2Yg
TDINCj4gYW5kIHZpY2UtdmVyc2EpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5IER5YXNs
aSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPg0KPiBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEtldmluIFRpYW4gPGtl
dmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
