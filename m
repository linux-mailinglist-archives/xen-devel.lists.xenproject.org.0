Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F1976C49
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:04:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1iT-0008R1-KN; Fri, 26 Jul 2019 15:01:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wloi=VX=intel.com=chen.zhang@srs-us1.protection.inumbo.net>)
 id 1hr1iR-0008Qw-Si
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 15:01:03 +0000
X-Inumbo-ID: 2ec85882-afb6-11e9-9b8c-e7d05e8f9fb6
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ec85882-afb6-11e9-9b8c-e7d05e8f9fb6;
 Fri, 26 Jul 2019 15:01:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 08:01:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="173053232"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga003.jf.intel.com with ESMTP; 26 Jul 2019 08:01:00 -0700
Received: from fmsmsx118.amr.corp.intel.com (10.18.116.18) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 26 Jul 2019 08:01:00 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx118.amr.corp.intel.com (10.18.116.18) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 26 Jul 2019 08:01:00 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.19]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.249]) with mapi id 14.03.0439.000;
 Fri, 26 Jul 2019 23:00:58 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [PATCH V2] tools/libxl: Add iothread support for COLO
Thread-Index: AQHVQ34jM46dmPcw/Ee05PwiiQM1YKbcZD0AgACNe2D//3+agIAAjGvQ
Date: Fri, 26 Jul 2019 15:00:57 +0000
Message-ID: <9CFF81C0F6B98A43A459C9EDAD400D78061F4355@shsmsx102.ccr.corp.intel.com>
References: <20190726064300.27530-1-chen.zhang@intel.com>
 <20190726134730.GE1242@perard.uk.xensource.com>
 <9CFF81C0F6B98A43A459C9EDAD400D78061F318C@shsmsx102.ccr.corp.intel.com>
 <20190726143419.GF1242@perard.uk.xensource.com>
In-Reply-To: <20190726143419.GF1242@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODFjMTIzNTctNTExMC00MWY2LWFhMzYtMDYzZTg4ODU4MDZhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidTU0Z0lyUThkSmFvNmxtQVBKUTlISjJUXC9nT0JkcEVqVXRGeWEzR0xHaU1XWFJcL2cyU2tmMFhMOHBGR0lLYWNNIn0=
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH V2] tools/libxl: Add iothread support for
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Zhang Chen <zhangckid@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogQW50aG9ueSBQRVJBUkQgW21h
aWx0bzphbnRob255LnBlcmFyZEBjaXRyaXguY29tXQo+IFNlbnQ6IEZyaWRheSwgSnVseSAyNiwg
MjAxOSAxMDozNCBQTQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+Cj4g
Q2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgV2VpIExpdSA8d2xA
eGVuLm9yZz47IHhlbi0KPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgWmhhbmcgQ2hlbiA8
emhhbmdja2lkQGdtYWlsLmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIIFYyXSB0b29scy9saWJ4
bDogQWRkIGlvdGhyZWFkIHN1cHBvcnQgZm9yIENPTE8KPiAKPiBPbiBGcmksIEp1bCAyNiwgMjAx
OSBhdCAwMjoxODo0MlBNICswMDAwLCBaaGFuZywgQ2hlbiB3cm90ZToKPiA+Cj4gPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiA+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWlsdG86
YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiA+ID4gU2VudDogRnJpZGF5LCBKdWx5IDI2LCAy
MDE5IDk6NDggUE0KPiA+ID4KPiA+ID4gT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMDI6NDM6MDBQ
TSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90ZToKPiA+ID4gV2hhdCBJIGhhZCBpbiBtaW5kIHdoaWxl
IHJldmlld2luZyB0aGUgdjEgb2YgdGhlIHBhdGNoIHdhcyB0byByZW1vdmUKPiA+ID4gYm90aCBg
Y29sb19pb3RocmVhZCcgYW5kIGBjb2xvX2NvbXBhcmVfaW90aHJlYWQnIGZyb20gdGhlIGxpYnhs
IEFQSQo+ID4gPiBhbmQgeGwgY29uZmlnIG9wdGlvbi4gSSBkb24ndCB0aGluayB0aGVyZSBhcmUg
dXNlZnVsLiBXaHkgZGlkIHlvdSBrZWVwCj4gYGNvbG9faW90aHJlYWQnPwo+ID4KPiA+IE9oLCBp
dCBsb29rcyBJIG1pc3VuZGVyc3Rvb2QgeW91ciBtZWFucy4KPiA+IERvIHlvdSB0aGluayB3ZSBq
dXN0IG5lZWQgaGFyZCBjb2RlIHRoZSBpb3RocmVhZCBuYW1lIGhlcmU/Cj4gPiBGb3IgZXhhbXBs
ZSB0aGUgImlvdGhyZWFkLTEiPwo+IAo+IFllcywgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhcmQg
Y29kZSBmb3Igbm93LCBidXQgd2l0aCBhIG5hbWUgd2hpY2ggYmV0dGVyCj4gZGVzY3JpYmUgd2hl
cmUgdGhlIGlvdGhyZWFkIGlzIHVzZWQsIGhvdyBhYm91dCAiY29sby1jb21wYXJlLWlvdGhyZWFk
LTEiID8KPiAKCkl0IGlzIGZpbmUgZm9yIG1lLgpUaGFua3MgeW91ciBjb21tZW50cy4KClRoYW5r
cwpaaGFuZyBDaGVuCgo+IFRoYW5rcywKPiAKPiAtLQo+IEFudGhvbnkgUEVSQVJECgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
