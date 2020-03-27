Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6062194EE2
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 03:27:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHede-00062s-Iz; Fri, 27 Mar 2020 02:22:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WxMQ=5M=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHedd-00062j-0n
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2020 02:22:25 +0000
X-Inumbo-ID: cb0cf5d2-6fd1-11ea-88dc-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cb0cf5d2-6fd1-11ea-88dc-12813bfff9fa;
 Fri, 27 Mar 2020 02:22:24 +0000 (UTC)
IronPort-SDR: xcZ+NGqHt8G0Ql4faOjXO07ysdrhy6VWWO0gX2YYSU4ioM2WUJJ7ZdlaTqZgohko/42HCbQYad
 1TUP2L4x+MUQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2020 19:22:23 -0700
IronPort-SDR: cb0LOASiN91pPzvKU53btkf+qMf7qjk+M+za5d2J/cWqlIpMr/zlAwC6TUAURhgtc+sH1KItAi
 ztJXiWohmLHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,310,1580803200"; d="scan'208";a="358352935"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga001.fm.intel.com with ESMTP; 26 Mar 2020 19:22:23 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 26 Mar 2020 19:22:22 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 26 Mar 2020 19:22:22 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 26 Mar 2020 19:22:22 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.96]) with mapi id 14.03.0439.000;
 Fri, 27 Mar 2020 10:22:19 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 4/4] x86/nvmx: update exit bitmap when using virtual
 interrupt delivery
Thread-Index: AQHWA4Mk5cn0/gJbQ0uGYolHip+df6hbtekw
Date: Fri, 27 Mar 2020 02:22:19 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EC9F3@SHSMSX104.ccr.corp.intel.com>
References: <20200326152720.36970-1-roger.pau@citrix.com>
 <20200326152720.36970-5-roger.pau@citrix.com>
In-Reply-To: <20200326152720.36970-5-roger.pau@citrix.com>
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
Subject: Re: [Xen-devel] [PATCH v3 4/4] x86/nvmx: update exit bitmap when
 using virtual interrupt delivery
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBU
aHVyc2RheSwgTWFyY2ggMjYsIDIwMjAgMTE6MjcgUE0NCj4gDQo+IEZvcmNlIGFuIHVwZGF0ZSBv
ZiB0aGUgRU9JIGV4aXQgYml0bWFwIGluIG52bXhfdXBkYXRlX2FwaWN2LCBiZWNhdXNlDQo+IHRo
ZSBvbmUgcGVyZm9ybWVkIGluIHZteF9pbnRyX2Fzc2lzdCBtaWdodCBub3QgYmUgcmVhY2hlZCBp
ZiB0aGUNCj4gaW50ZXJydXB0IGlzIGludGVyY2VwdGVkIGJ5IG52bXhfaW50cl9pbnRlcmNlcHQg
cmV0dXJuaW5nIHRydWUuDQo+IA0KPiBFeHRyYWN0IHRoZSBjb2RlIHRvIHVwZGF0ZSB0aGUgZXhp
dCBiaXRtYXAgZnJvbSB2bXhfaW50cl9hc3Npc3QgaW50byBhDQo+IGhlbHBlciBhbmQgdXNlIGl0
IGluIG52bXhfdXBkYXRlX2FwaWN2Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4NCg==

