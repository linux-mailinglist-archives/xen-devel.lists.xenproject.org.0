Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDB8193637
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 03:53:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHIZv-0005pX-Jn; Thu, 26 Mar 2020 02:49:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ASzm=5L=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jHIZt-0005pS-RI
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 02:49:05 +0000
X-Inumbo-ID: 5a35deac-6f0c-11ea-8725-12813bfff9fa
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a35deac-6f0c-11ea-8725-12813bfff9fa;
 Thu, 26 Mar 2020 02:49:03 +0000 (UTC)
IronPort-SDR: 5bnp2zVehEDyg19CmThLjOzD2d1yq31p0QU8MsfiBSEuyGqTVS6ntRJeBYxHBHh0cKZCYXEMsJ
 sQNNBuNEWrwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 19:49:02 -0700
IronPort-SDR: P65TcxPe810E6GLQtDLZvHDmaq7/cuLM9yqfdN93QUvX+pe4EWMPYL5xfZJdxvNXq2EzERNxs0
 CPqAYixCv1cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="240551639"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga008.fm.intel.com with ESMTP; 25 Mar 2020 19:49:02 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Mar 2020 19:49:02 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 25 Mar 2020 19:49:02 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Thu, 26 Mar 2020 10:48:58 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/4] x86/nvmx: only update SVI when using Ack on exit
Thread-Index: AQHWAo7kepp5FSbvFkKTE7MMIPyAoqhaLP6Q
Date: Thu, 26 Mar 2020 02:48:58 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7EA70B@SHSMSX104.ccr.corp.intel.com>
References: <20200325101910.29168-1-roger.pau@citrix.com>
 <20200325101910.29168-3-roger.pau@citrix.com>
In-Reply-To: <20200325101910.29168-3-roger.pau@citrix.com>
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
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/nvmx: only update SVI when using
 Ack on exit
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

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIE1hcmNoIDI1LCAyMDIwIDY6MTkgUE0NCj4gDQo+IENoZWNrIHdoZXRoZXIgdGhl
cmUncyBhIHZhbGlkIGludGVycnVwdCBpbiBWTV9FWElUX0lOVFJfSU5GTyBpbiBvcmRlcg0KPiB0
byBkZWNpZGUgd2hldGhlciB0byB1cGRhdGUgU1ZJIGluIG52bXhfdXBkYXRlX2FwaWN2LiBJZiBB
Y2sgb24gZXhpdA0KPiBpcyBub3QgYmVpbmcgdXNlZCBWTV9FWElUX0lOVFJfSU5GTyB3b24ndCBo
YXZlIGEgdmFsaWQgaW50ZXJydXB0IGFuZA0KPiBoZW5jZSBTVkkgc2hvdWxkbid0IGJlIHVwZGF0
ZWQgdG8gc2lnbmFsIHRoZSBpbnRlcnJ1cHQgaXMgY3VycmVudGx5IGluDQo+IHNlcnZpY2UgYmVj
YXVzZSBpdCB3b24ndCBiZSBBY2tlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KDQpSZXZpZXdlZC1ieTogS2V2aW4gVGlhbiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+DQo=

