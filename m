Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C147B15012B
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 06:23:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyU9T-0003T4-8n; Mon, 03 Feb 2020 05:20:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E9R5=3X=intel.com=liming.gao@srs-us1.protection.inumbo.net>)
 id 1iyQdh-0001d2-0q
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 01:35:01 +0000
X-Inumbo-ID: 6342351e-4625-11ea-8e11-12813bfff9fa
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6342351e-4625-11ea-8e11-12813bfff9fa;
 Mon, 03 Feb 2020 01:34:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Feb 2020 17:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,396,1574150400"; d="scan'208";a="429301496"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga005.fm.intel.com with ESMTP; 02 Feb 2020 17:34:57 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 2 Feb 2020 17:34:57 -0800
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Feb 2020 09:34:55 +0800
Received: from shsmsx606.ccr.corp.intel.com ([10.109.6.216]) by
 SHSMSX606.ccr.corp.intel.com ([10.109.6.216]) with mapi id 15.01.1713.004;
 Mon, 3 Feb 2020 09:34:55 +0800
From: "Gao, Liming" <liming.gao@intel.com>
To: Laszlo Ersek <lersek@redhat.com>, Anthony PERARD
 <anthony.perard@citrix.com>, "devel@edk2.groups.io" <devel@edk2.groups.io>
Thread-Topic: [PATCH 2/5] MdePkg: Allow PcdFSBClock to by Dynamic
Thread-Index: AQHV1r69ewqbWYIeh0aB29LAD6y7HagE2qLw
Date: Mon, 3 Feb 2020 01:34:55 +0000
Message-ID: <c283b839b42e4262bfde10474bf6a794@intel.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-3-anthony.perard@citrix.com>
 <b7590b41-e7f6-f4df-959c-2ee188db1e66@redhat.com>
In-Reply-To: <b7590b41-e7f6-f4df-959c-2ee188db1e66@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Feb 2020 05:20:01 +0000
Subject: Re: [Xen-devel] [PATCH 2/5] MdePkg: Allow PcdFSBClock to by Dynamic
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
Cc: "Feng, Bob C" <bob.c.feng@intel.com>, Julien Grall <julien@xen.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Justen,
 Jordan L" <jordan.l.justen@intel.com>, "Kinney,
 Michael D" <michael.d.kinney@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueToNCiAgVGhpcyBjaGFuZ2UgaXMgT0sgdG8gbWUuIEJ1dCBpZiB0aGlzIFBDRCBpcyBj
b25maWd1cmVkIGFzIER5bmFtaWMsIGl0cyB2YWx1ZSB3aWxsIGJlIGdvdCBmcm9tIFBDRCBzZXJ2
aWNlLiBUaGlzIG9wZXJhdGlvbiB3aWxsIHRha2Ugc29tZSB0aW1lIGFuZCBjYXVzZSB0aGUgaW5h
Y2N1cmF0ZSB0aW1lIGRlbGF5LiBIYXZlIHlvdSBtZWFzdXJlZCBpdHMgaW1wYWN0Pw0KDQpUaGFu
a3MNCkxpbWluZw0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXN6bG8g
RXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFyeSAzMCwg
MjAyMCAxMjoxMSBBTQ0KPiBUbzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJp
eC5jb20+OyBkZXZlbEBlZGsyLmdyb3Vwcy5pbw0KPiBDYzogS2lubmV5LCBNaWNoYWVsIEQgPG1p
Y2hhZWwuZC5raW5uZXlAaW50ZWwuY29tPjsgQXJkIEJpZXNoZXV2ZWwgPGFyZC5iaWVzaGV1dmVs
QGxpbmFyby5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IEdhbywgTGlt
aW5nIDxsaW1pbmcuZ2FvQGludGVsLmNvbT47IEp1c3RlbiwgSm9yZGFuIEwgPGpvcmRhbi5sLmp1
c3RlbkBpbnRlbC5jb20+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgRmVuZywgQm9i
IEMNCj4gPGJvYi5jLmZlbmdAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvNV0g
TWRlUGtnOiBBbGxvdyBQY2RGU0JDbG9jayB0byBieSBEeW5hbWljDQo+IA0KPiBPbiAwMS8yOS8y
MCAxMzoxMiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+ID4gV2UgYXJlIGdvaW5nIHRvIHdhbnQg
dG8gY2hhbmdlIHRoZSB2YWx1ZSBvZiBQY2RGU0JDbG9jayBhdCBydW4gdGltZSBpbg0KPiA+IE92
bWZYZW4sIHNvIG1vdmUgaXQgdG8gdGhlIFBjZHNEeW5hbWljIHNlY3Rpb24uDQo+ID4NCj4gPiBS
ZWY6IGh0dHBzOi8vYnVnemlsbGEudGlhbm9jb3JlLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjQ5MA0K
PiA+IFNpZ25lZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXgu
Y29tPg0KPiA+IC0tLQ0KPiA+IENDOiBCb2IgRmVuZyA8Ym9iLmMuZmVuZ0BpbnRlbC5jb20+DQo+
ID4gQ0M6IExpbWluZyBHYW8gPGxpbWluZy5nYW9AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBN
ZGVQa2cvTWRlUGtnLmRlYyB8IDggKysrKy0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9NZGVQa2cv
TWRlUGtnLmRlYyBiL01kZVBrZy9NZGVQa2cuZGVjDQo+ID4gaW5kZXggZDAyMmNjNWUzZWYyLi44
ZjVhNDgzNDZlNTAgMTAwNjQ0DQo+ID4gLS0tIGEvTWRlUGtnL01kZVBrZy5kZWMNCj4gPiArKysg
Yi9NZGVQa2cvTWRlUGtnLmRlYw0KPiA+IEBAIC0yMTk0LDEwICsyMTk0LDYgQEAgW1BjZHNGaXhl
ZEF0QnVpbGQsUGNkc1BhdGNoYWJsZUluTW9kdWxlXQ0KPiA+ICAgICMgQFZhbGlkTGlzdCAgMHg4
MDAwMDAwMSB8IDgsIDE2LCAzMg0KPiA+ICAgIGdFZmlNZGVQa2dUb2tlblNwYWNlR3VpZC5QY2RQ
b3J0ODBEYXRhV2lkdGh8OHxVSU5UOHwweDAwMDAwMDJkDQo+ID4NCj4gPiAtICAjIyBUaGlzIHZh
bHVlIGlzIHVzZWQgdG8gY29uZmlndXJlIFg4NiBQcm9jZXNzb3IgRlNCIGNsb2NrLg0KPiA+IC0g
ICMgQFByb21wdCBGU0IgQ2xvY2suDQo+ID4gLSAgZ0VmaU1kZVBrZ1Rva2VuU3BhY2VHdWlkLlBj
ZEZTQkNsb2NrfDIwMDAwMDAwMHxVSU5UMzJ8MHgwMDAwMDAwYw0KPiA+IC0NCj4gPiAgICAjIyBU
aGUgbWF4aW11bSBwcmludGFibGUgbnVtYmVyIG9mIGNoYXJhY3RlcnMuIFVlZkxpYiBmdW5jdGlv
bnM6IEFzY2lpUHJpbnQoKSwgQXNjaWlFcnJvclByaW50KCksDQo+ID4gICAgIyAgUHJpbnRYWSgp
LCBBc2NpaVByaW50WFkoKSwgUHJpbnQoKSwgRXJyb3JQcmludCgpIGJhc2Ugb24gdGhpcyBQQ0Qg
dmFsdWUgdG8gcHJpbnQgY2hhcmFjdGVycy4NCj4gPiAgICAjIEBQcm9tcHQgTWF4aW11bSBQcmlu
dGFibGUgTnVtYmVyIG9mIENoYXJhY3RlcnMuDQo+ID4gQEAgLTIyOTcsNSArMjI5Myw5IEBAIFtQ
Y2RzRml4ZWRBdEJ1aWxkLCBQY2RzUGF0Y2hhYmxlSW5Nb2R1bGUsIFBjZHNEeW5hbWljLCBQY2Rz
RHluYW1pY0V4XQ0KPiA+ICAgICMgQFByb21wdCBCb290IFRpbWVvdXQgKHMpDQo+ID4gICAgZ0Vm
aU1kZVBrZ1Rva2VuU3BhY2VHdWlkLlBjZFBsYXRmb3JtQm9vdFRpbWVPdXR8MHhmZmZmfFVJTlQx
NnwweDAwMDAwMDJjDQo+ID4NCj4gPiArICAjIyBUaGlzIHZhbHVlIGlzIHVzZWQgdG8gY29uZmln
dXJlIFg4NiBQcm9jZXNzb3IgRlNCIGNsb2NrLg0KPiA+ICsgICMgQFByb21wdCBGU0IgQ2xvY2su
DQo+ID4gKyAgZ0VmaU1kZVBrZ1Rva2VuU3BhY2VHdWlkLlBjZEZTQkNsb2NrfDIwMDAwMDAwMHxV
SU5UMzJ8MHgwMDAwMDAwYw0KPiA+ICsNCj4gPiAgW1VzZXJFeHRlbnNpb25zLlRpYW5vQ29yZS4i
RXh0cmFGaWxlcyJdDQo+ID4gICAgTWRlUGtnRXh0cmEudW5pDQo+ID4NCj4gDQo+IExvb2tzIGdv
b2QgdG8gbWU6DQo+IA0KPiBSZXZpZXdlZC1ieTogTGFzemxvIEVyc2VrIDxsZXJzZWtAcmVkaGF0
LmNvbT4NCj4gDQo+IE1pa2Ugb3IgTGltaW5nIHdpbGwgaGF2ZSB0byBBQ0suDQo+IA0KPiBUaGFu
a3MhDQo+IExhc3psbw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
