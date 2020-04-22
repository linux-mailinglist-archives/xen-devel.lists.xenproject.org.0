Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7041B398F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 10:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRALe-0000Sd-26; Wed, 22 Apr 2020 08:03:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EBpN=6G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jRALc-0000SY-8U
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 08:03:08 +0000
X-Inumbo-ID: b194679c-846f-11ea-9238-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b194679c-846f-11ea-9238-12813bfff9fa;
 Wed, 22 Apr 2020 08:03:06 +0000 (UTC)
IronPort-SDR: k7XY5TUkW3kqkIKwMwJDU7gJeCtH1MkGbGbVVjRxIdfWo/3qyiO2+hSddPPqyBzdSD6V6c5+jE
 tUVOWhvE7kRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 01:03:05 -0700
IronPort-SDR: B8D5zln76yC8y2E9XKweAVTJ6kzxVfDz6mbmU9HIrU2cCBvRGIxQVvoSelc9Zs2Tl3Y1RecW2a
 7NwORHQYWPKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,412,1580803200"; d="scan'208";a="258990228"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 01:03:05 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 22 Apr 2020 01:02:36 -0700
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 22 Apr 2020 01:02:36 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 22 Apr 2020 01:02:35 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.209]) with mapi id 14.03.0439.000;
 Wed, 22 Apr 2020 16:02:34 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/3] x86/boot: Don't enable EFER.SCE for !CONFIG_PV builds
Thread-Topic: [PATCH 2/3] x86/boot: Don't enable EFER.SCE for !CONFIG_PV builds
Thread-Index: AQHWFyRLs5sm5DaTOEa1b2TGziQ7AqiEylaw
Date: Wed, 22 Apr 2020 08:02:33 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D86F81E@SHSMSX104.ccr.corp.intel.com>
References: <20200420145911.5708-1-andrew.cooper3@citrix.com>
 <20200420145911.5708-3-andrew.cooper3@citrix.com>
In-Reply-To: <20200420145911.5708-3-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50
OiBNb25kYXksIEFwcmlsIDIwLCAyMDIwIDEwOjU5IFBNDQo+IA0KPiBUaGlzIHdpbGwgY2F1c2Ug
YWxsIFNZU0NBTEwvU1lTUkVUIGluc3RydWN0aW9ucyB0byBzdWZmZXIgI1VEIHJhdGhlciB0aGFu
DQo+IGZvbGxvd2luZyB0aGUgTVNSX3tMLEN9U1RBUiBwb2ludGVycywgYWxsb3dpbmcgdXMgdG8g
ZHJvcCB0aGUgc3Rhcl9lbnRlcigpDQo+IHBhbmljIGhlbHBlciwgYWxsb3dpbmcgdXMgdG8gY2xl
YW4gdXAgdGhlIElTVCBzdGFja3MgaW4gYSBzdWJzZXF1ZW50IHBhdGNoLg0KPiANCj4gRHJvcCB0
aGUgbm93LWRlYWQgY29uZGl0aW9uYWwgU1lTRU5URVIgbG9naWMgaW4gdGhlIG1pZGRsZSBvZg0K
PiBzdWJhcmNoX3BlcmNwdV90cmFwc19pbml0KCkuDQo+IA0KPiBJbiBhZGRpdGlvbiwgdm14X3Jl
c3RvcmVfaG9zdF9tc3JzKCkgbmVlZCBub3QgcmVzdG9yZSBhbnkgaG9zdA0KPiBzdGF0ZS4gIChS
ZWdhcmRpbmcgdGhlIGFzeW1tZXRyaWMgY2hhbmdlcywgVlQteCBhdXRvbWF0aWNhbGx5IHJlc3Rv
cmVzDQo+IFNZU0VOVEVSIHN0YXRlIG9uIHZtZXhpdCwgYW5kIFNWTSByZXN0b3JlcyBib3RoIFNZ
U0NBTEwvU1lTRU5URVIgc3RhdGUNCj4gd2l0aA0KPiB0aGUgVk1TQVZFL1ZNTE9BRCBpbnN0cnVj
dGlvbnMuKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPg0K

