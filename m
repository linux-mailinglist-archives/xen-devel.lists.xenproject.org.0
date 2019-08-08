Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EED185847
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 04:46:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvYQ5-0007Rv-SL; Thu, 08 Aug 2019 02:44:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mVC3=WE=intel.com=chen.zhang@srs-us1.protection.inumbo.net>)
 id 1hvYQ4-0007Rq-59
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 02:44:48 +0000
X-Inumbo-ID: 7b6e7836-b986-11e9-9529-8fa038f7cf71
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b6e7836-b986-11e9-9529-8fa038f7cf71;
 Thu, 08 Aug 2019 02:44:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 19:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,358,1559545200"; d="scan'208";a="179700367"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga006.jf.intel.com with ESMTP; 07 Aug 2019 19:44:45 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 7 Aug 2019 19:44:44 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.19]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.163]) with mapi id 14.03.0439.000;
 Thu, 8 Aug 2019 10:44:43 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V4] tools/libxl: Add iothread support for COLO
Thread-Index: AQHVQ8++Fob6VCf4FUeUJ+C5B5nFJabwnr/Q
Date: Thu, 8 Aug 2019 02:44:42 +0000
Message-ID: <9CFF81C0F6B98A43A459C9EDAD400D780620FC72@shsmsx102.ccr.corp.intel.com>
References: <20190726162723.7443-1-chen.zhang@intel.com>
In-Reply-To: <20190726162723.7443-1-chen.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTc4NjhiODItMGQ3ZS00MDliLTlhMGItZWU1M2JmMDkyOTlhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoicjYxSzEzWlBHdW1aWU5za09LNG83eVdxTjdETlkwSDBcL0JcL0wzNzFNUGt1SEdXc0Z2V2FEeFdcL1h6a2ZRZFV2RCJ9
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V4] tools/libxl: Add iothread support for
 COLO
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
Cc: Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZy4uLgpBbnkgY29tbWVudHM/CgpUaGFua3MKWmhhbmcgQ2hlbgoKCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBaaGFuZywgQ2hlbgo+IFNlbnQ6IFNhdHVyZGF5LCBKdWx5
IDI3LCAyMDE5IDEyOjI3IEFNCj4gVG86IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkKPiBQRVJBUkQgPGFudGhvbnku
cGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBDYzog
WmhhbmcgQ2hlbiA8emhhbmdja2lkQGdtYWlsLmNvbT47IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5n
QGludGVsLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggVjRdIHRvb2xzL2xpYnhsOiBBZGQgaW90aHJl
YWQgc3VwcG9ydCBmb3IgQ09MTwo+IAo+IEZyb206IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50
ZWwuY29tPgo+IAo+IFhlbiBDT0xPIGFuZCBLVk0gQ09MTyBzaGFyZWQgbG90cyBvZiBjb2RlIGlu
IFFlbXUuCj4gVGhlIGNvbG8tY29tcGFyZSBvYmplY3QgaW4gUWVtdSBub3cgcmVxdWlyZXMgYW4g
J2lvdGhyZWFkJyBwcm9wZXJ0eSBzaW5jZQo+IFFFTVUgMi4xMS4KPiAKPiBEZXRhaWw6Cj4gaHR0
cHM6Ly93aWtpLnFlbXUub3JnL0ZlYXR1cmVzL0NPTE8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGFu
ZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiBSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHRvb2xzL2xpYnhsL2xpYnhs
X2RtLmMgfCA0ICsrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMv
bGlieGwvbGlieGxfZG0uYyBpbmRleAo+IGY0ZmM5NjQxNWQuLjgzOWM1YWMyY2QgMTAwNjQ0Cj4g
LS0tIGEvdG9vbHMvbGlieGwvbGlieGxfZG0uYwo+ICsrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2Rt
LmMKPiBAQCAtMTYzNCw4ICsxNjM0LDEwIEBAIHN0YXRpYyBpbnQKPiBsaWJ4bF9fYnVpbGRfZGV2
aWNlX21vZGVsX2FyZ3NfbmV3KGxpYnhsX19nYyAqZ2MsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgIG5pY3NbaV0uY29sb19jb21wYXJlX291dCAmJgo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICBuaWNzW2ldLmNvbG9fY29tcGFyZV9ub3RpZnlfZGV2KSB7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgIGZsZXhhcnJheV9hcHBlbmQoZG1fYXJncywgIi1vYmplY3QiKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgZmxleGFycmF5X2FwcGVuZChkbV9hcmdzLCAiaW90aHJlYWQsaWQ9Y29s
by1jb21wYXJlLQo+IGlvdGhyZWFkLTEiKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgZmxl
eGFycmF5X2FwcGVuZChkbV9hcmdzLCAiLW9iamVjdCIpOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICBmbGV4YXJyYXlfYXBwZW5kKGRtX2FyZ3MsCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEdDU1BSSU5URigiY29sby0KPiBjb21wYXJlLGlkPWMxLHByaW1hcnlfaW49JXMsc2Vjb25k
YXJ5X2luPSVzLG91dGRldj0lcyxub3RpZnlfZGV2PSVzIiwKPiArCj4gKyBHQ1NQUklOVEYoImNv
bG8tY29tcGFyZSxpZD1jMSxwcmltYXJ5X2luPSVzLHNlY29uZGFyeV9pbj0lcyxvdXRkZXY9JXMs
Cj4gKyBub3RpZnlfZGV2PSVzLGlvdGhyZWFkPWNvbG8tY29tcGFyZS1pb3RocmVhZC0xIiwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0uY29sb19jb21wYXJl
X3ByaV9pbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5pY3NbaV0u
Y29sb19jb21wYXJlX3NlY19pbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG5pY3NbaV0uY29sb19jb21wYXJlX291dCwKPiAtLQo+IDIuMTcuR0lUCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
