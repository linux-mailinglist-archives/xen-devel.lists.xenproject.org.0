Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB076B6E
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:22:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr13b-0002dJ-GV; Fri, 26 Jul 2019 14:18:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wloi=VX=intel.com=chen.zhang@srs-us1.protection.inumbo.net>)
 id 1hr13Z-0002d6-9j
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:18:49 +0000
X-Inumbo-ID: 47a72172-afb0-11e9-a426-2f246170c479
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47a72172-afb0-11e9-a426-2f246170c479;
 Fri, 26 Jul 2019 14:18:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jul 2019 07:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,311,1559545200"; d="scan'208";a="194284620"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2019 07:18:45 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 26 Jul 2019 07:18:45 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx109.amr.corp.intel.com (10.18.116.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 26 Jul 2019 07:18:44 -0700
Received: from shsmsx102.ccr.corp.intel.com ([169.254.2.19]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.80]) with mapi id 14.03.0439.000;
 Fri, 26 Jul 2019 22:18:43 +0800
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Thread-Topic: [PATCH V2] tools/libxl: Add iothread support for COLO
Thread-Index: AQHVQ34jM46dmPcw/Ee05PwiiQM1YKbcZD0AgACNe2A=
Date: Fri, 26 Jul 2019 14:18:42 +0000
Message-ID: <9CFF81C0F6B98A43A459C9EDAD400D78061F318C@shsmsx102.ccr.corp.intel.com>
References: <20190726064300.27530-1-chen.zhang@intel.com>
 <20190726134730.GE1242@perard.uk.xensource.com>
In-Reply-To: <20190726134730.GE1242@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNmE3ZjNlNDQtMzBlNy00NTk5LTgwZjMtYzAyY2M4MjFhYzQ4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibDVnbjR5UksySGJcLzU5MTVoUUQrajlwMnBkQ1V6VkFycUh6V2NoVXBiNVE2M21DRU9pQVdiaDVqa1U0TG5yYjYifQ==
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

Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBBbnRob255IFBFUkFSRCBbbWFp
bHRvOmFudGhvbnkucGVyYXJkQGNpdHJpeC5jb21dCj4gU2VudDogRnJpZGF5LCBKdWx5IDI2LCAy
MDE5IDk6NDggUE0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPgo+IENj
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFdlaSBMaXUgPHdsQHhl
bi5vcmc+OyB4ZW4tCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFpoYW5nIENoZW4gPHpo
YW5nY2tpZEBnbWFpbC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMl0gdG9vbHMvbGlieGw6
IEFkZCBpb3RocmVhZCBzdXBwb3J0IGZvciBDT0xPCj4gCj4gT24gRnJpLCBKdWwgMjYsIDIwMTkg
YXQgMDI6NDM6MDBQTSArMDgwMCwgWmhhbmcgQ2hlbiB3cm90ZToKPiA+IEZyb206IFpoYW5nIENo
ZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPgo+ID4KPiA+IFhlbiBDT0xPIGFuZCBLVk0gQ09MTyBz
aGFyZWQgbG90cyBvZiBjb2RlIGluIFFlbXUuCj4gPiBLVk0gQ09MTyBoYXMgYWRkZWQgdGhlIGlv
dGhyZWFkIHN1cHBvcnQsIHNvIHdlIGFkZCBpdCBvbiBYZW4uCj4gCj4gSXQgd291bGQgYmUgdXNl
ZnVsIHRvIGV4cGFuZCB0aGUgY29tbWVudCBvZiB0aGUgY29tbWl0IGFuZCBleHBsYWluIHdoeSB0
aGUKPiBjaGFuZ2UgaXMgcmVxdWlyZWQuIEkgd291bGQgYWRkIHRoZSBmb2xsb3dpbmc6Cj4gCj4g
ICAgIFRoZSBjb2xvLWNvbXBhcmUgb2JqZWN0IGluIFFFTVUgbm93IHJlcXVpcmVzIGFuIGBpb3Ro
cmVhZCcgcHJvcGVydHkKPiAgICAgc2luY2UgUUVNVSAyLjExLgo+IAoKTWFrZSBzZW5zZS4gSSB3
aWxsIGFkZCBpdCBpbiBuZXh0IHZlcnNpb24uCgo+ID4gRGV0YWlsOgo+ID4gaHR0cHM6Ly93aWtp
LnFlbXUub3JnL0ZlYXR1cmVzL0NPTE8KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBDaGVu
IDxjaGVuLnpoYW5nQGludGVsLmNvbT4KPiA+IC0tLQo+IAo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnhsL2xpYnhsX3R5cGVzLmlkbCBiL3Rvb2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbAo+ID4g
aW5kZXggYjYxMzk5Y2UzNi4uZWRhOTU4ZWI0YiAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2xpYnhs
L2xpYnhsX3R5cGVzLmlkbAo+ID4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCj4g
PiBAQCAtNzI3LDYgKzcyNyw3IEBAIGxpYnhsX2RldmljZV9uaWMgPSBTdHJ1Y3QoImRldmljZV9u
aWMiLCBbCj4gPiAgICAgICgiY29sb19maWx0ZXJfcmVkaXJlY3RvcjFfcXVldWUiLCBzdHJpbmcp
LAo+ID4gICAgICAoImNvbG9fZmlsdGVyX3JlZGlyZWN0b3IxX2luZGV2Iiwgc3RyaW5nKSwKPiA+
ICAgICAgKCJjb2xvX2ZpbHRlcl9yZWRpcmVjdG9yMV9vdXRkZXYiLCBzdHJpbmcpLAo+ID4gKyAg
ICAoImNvbG9faW90aHJlYWQiLCBzdHJpbmcpLAo+ID4gICAgICAoImNvbG9fY29tcGFyZV9wcmlf
aW4iLCBzdHJpbmcpLAo+ID4gICAgICAoImNvbG9fY29tcGFyZV9zZWNfaW4iLCBzdHJpbmcpLAo+
ID4gICAgICAoImNvbG9fY29tcGFyZV9vdXQiLCBzdHJpbmcpLAo+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3hsL3hsX3BhcnNlLmMgYi90b29scy94bC94bF9wYXJzZS5jIGluZGV4Cj4gPiBlMTA1YmRh
MmJiLi4wYjgxODlmMzc1IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMveGwveGxfcGFyc2UuYwo+ID4g
KysrIGIvdG9vbHMveGwveGxfcGFyc2UuYwo+ID4gQEAgLTUyMSw2ICs1MjEsOCBAQCBpbnQgcGFy
c2VfbmljX2NvbmZpZyhsaWJ4bF9kZXZpY2VfbmljICpuaWMsCj4gWExVX0NvbmZpZyAqKmNvbmZp
ZywgY2hhciAqdG9rZW4pCj4gPiAgICAgICAgICByZXBsYWNlX3N0cmluZygmbmljLT5jb2xvX2Zp
bHRlcl9yZWRpcmVjdG9yMV9pbmRldiwgb3BhcmcpOwo+ID4gICAgICB9IGVsc2UgaWYgKE1BVENI
X09QVElPTigiY29sb19maWx0ZXJfcmVkaXJlY3RvcjFfb3V0ZGV2IiwgdG9rZW4sIG9wYXJnKSkK
PiB7Cj4gPiAgICAgICAgICByZXBsYWNlX3N0cmluZygmbmljLT5jb2xvX2ZpbHRlcl9yZWRpcmVj
dG9yMV9vdXRkZXYsIG9wYXJnKTsKPiA+ICsgICAgfSBlbHNlIGlmIChNQVRDSF9PUFRJT04oImNv
bG9faW90aHJlYWQiLCB0b2tlbiwgb3BhcmcpKSB7Cj4gPiArICAgICAgICByZXBsYWNlX3N0cmlu
ZygmbmljLT5jb2xvX2lvdGhyZWFkLCBvcGFyZyk7Cj4gPiAgICAgIH0gZWxzZSBpZiAoTUFUQ0hf
T1BUSU9OKCJjb2xvX2NvbXBhcmVfcHJpX2luIiwgdG9rZW4sIG9wYXJnKSkgewo+ID4gICAgICAg
ICAgcmVwbGFjZV9zdHJpbmcoJm5pYy0+Y29sb19jb21wYXJlX3ByaV9pbiwgb3BhcmcpOwo+ID4g
ICAgICB9IGVsc2UgaWYgKE1BVENIX09QVElPTigiY29sb19jb21wYXJlX3NlY19pbiIsIHRva2Vu
LCBvcGFyZykpIHsKPiAKPiBXaGF0IEkgaGFkIGluIG1pbmQgd2hpbGUgcmV2aWV3aW5nIHRoZSB2
MSBvZiB0aGUgcGF0Y2ggd2FzIHRvIHJlbW92ZSBib3RoCj4gYGNvbG9faW90aHJlYWQnIGFuZCBg
Y29sb19jb21wYXJlX2lvdGhyZWFkJyBmcm9tIHRoZSBsaWJ4bCBBUEkgYW5kIHhsIGNvbmZpZwo+
IG9wdGlvbi4gSSBkb24ndCB0aGluayB0aGVyZSBhcmUgdXNlZnVsLiBXaHkgZGlkIHlvdSBrZWVw
IGBjb2xvX2lvdGhyZWFkJz8KCk9oLCBpdCBsb29rcyBJIG1pc3VuZGVyc3Rvb2QgeW91ciBtZWFu
cy4KRG8geW91IHRoaW5rIHdlIGp1c3QgbmVlZCBoYXJkIGNvZGUgdGhlIGlvdGhyZWFkIG5hbWUg
aGVyZT8KRm9yIGV4YW1wbGUgdGhlICJpb3RocmVhZC0xIj8KClRoYW5rcwpaaGFuZyBDaGVuCgo+
IAo+IFRoYW5rcywKPiAKPiAtLQo+IEFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
