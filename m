Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAE819054F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 06:45:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGcJr-0002uP-TL; Tue, 24 Mar 2020 05:41:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8ME=5J=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jGcJq-0002uK-NB
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 05:41:42 +0000
X-Inumbo-ID: 2221d4b0-6d92-11ea-bec1-bc764e2007e4
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2221d4b0-6d92-11ea-bec1-bc764e2007e4;
 Tue, 24 Mar 2020 05:41:39 +0000 (UTC)
IronPort-SDR: 5zpBj+l7aSeN7EOh7iDmG/fjmCmvbURBaacTFSZPmzKDmS4xGy8VX9zvYAoP1hd5k8GoAUXfUb
 qllhv/9rcPYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 22:41:38 -0700
IronPort-SDR: jfFXR+qehHqREvPN/4GvZ0uGBUZacjQjA/hOKF1vnt6uQ5dJFrOCORnpegPkWbS5yG7PzJQTpl
 J/oMo/94NajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,299,1580803200"; d="scan'208";a="281573653"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2020 22:41:38 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 22:41:38 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 23 Mar 2020 22:41:38 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.235]) with mapi id 14.03.0439.000;
 Tue, 24 Mar 2020 13:41:35 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt injection
 when Ack on exit control is used"
Thread-Index: AQHV/urpGxanB9MUKkeByU3KdN9o6qhVUPKAgABvYICAAX4akA==
Date: Tue, 24 Mar 2020 05:41:35 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5ADE@SHSMSX104.ccr.corp.intel.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-2-roger.pau@citrix.com>
 <a1eacbaf-1fb0-94c9-d1e6-716fd1fd38ad@suse.com>
 <20200323144837.GB24458@Air-de-Roger.citrite.net>
In-Reply-To: <20200323144837.GB24458@Air-de-Roger.citrite.net>
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
Subject: Re: [Xen-devel] [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt
 injection when Ack on exit control is used"
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
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDog
TW9uZGF5LCBNYXJjaCAyMywgMjAyMCAxMDo0OSBQTQ0KPiANCj4gT24gTW9uLCBNYXIgMjMsIDIw
MjAgYXQgMDk6MDk6NTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gT24gMjAuMDMu
MjAyMCAyMDowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiA+ID4gVGhpcyByZXZlcnRzIGNv
bW1pdCBmOTZlMTQ2OWFkMDZiNjE3OTZjNjAxOTNkYWFlYjlmOGE5NmQ3NDU4Lg0KPiA+ID4NCj4g
PiA+IFRoZSBjb21taXQgaXMgd3JvbmcsIGFzIHRoZSB3aG9sZSBwb2ludCBvZiBudm14X3VwZGF0
ZV9hcGljdiBpcyB0bw0KPiA+ID4gdXBkYXRlIHRoZSBndWVzdCBpbnRlcnJ1cHQgc3RhdHVzIGZp
ZWxkIHdoZW4gdGhlIEFjayBvbiBleGl0IFZNRVhJVA0KPiA+ID4gY29udHJvbCBmZWF0dXJlIGlz
IGVuYWJsZWQuDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4NCj4gPiBCZWZvcmUgYW55b25lIGdldHMgdG8gbG9v
ayBhdCB0aGUgb3RoZXIgdHdvIHBhdGNoZXMsIHNob3VsZCB0aGlzDQo+ID4gYmUgdGhyb3duIGlu
IHJpZ2h0IGF3YXk/DQo+IA0KPiBJIHdvdWxkIGxpa2UgaWYgcG9zc2libGUgZ2V0IGEgY29uZmly
bWF0aW9uIGZyb20gS2V2aW4gKG9yIGFueW9uZQ0KPiBlbHNlKSB0aGF0IG15IHVuZGVyc3RhbmRp
bmcgaXMgY29ycmVjdC4gSSBmaW5kIHRoZSBuZXN0ZWQgY29kZSB2ZXJ5DQo+IGNvbmZ1c2luZywg
YW5kIEkndmUgYWxyZWFkeSBtYWRlIGEgbWlzdGFrZSB3aGlsZSB0cnlpbmcgdG8gZml4IGl0Lg0K
PiBUaGF0IGJlaW5nIHNhaWQsIHRoaXMgd2FzIHNwb3R0ZWQgYnkgb3NzdGVzdCBhcyBpbnRyb2R1
Y2luZyBhDQo+IHJlZ3Jlc3Npb24sIHNvIEkgZ3Vlc3MgaXQncyBzYWZlIHRvIGp1c3QgdG9zcyBp
dCBpbiBub3cuDQo+IA0KPiBGV0lXIHBhdGNoIDIvMyBhdHRlbXB0cyB0byBwcm92aWRlIGEgZGVz
Y3JpcHRpb24gb2YgbXkgdW5kZXJzdGFuZGluZw0KPiBvZiBob3cgbnZteF91cGRhdGVfYXBpY3Yg
d29ya3MuDQo+IA0KDQpJIGZlZWwgaXQgaXMgbm90IGdvb2QgdG8gdGFrZSB0aGlzIHBhdGNoIGFs
b25lLCBhcyBpdCB3YXMgaW50cm9kdWNlZCB0byBmaXgNCmFub3RoZXIgcHJvYmxlbS4gVy9vIHVu
ZGVyc3RhbmRpbmcgd2hldGhlciB0aGUgd2hvbGUgc2VyaWVzIGNhbg0KZml4IGJvdGggb2xkIGFu
ZCBuZXcgcHJvYmxlbXMsIHdlIG1heSByaXNrIHB1dHRpbmcgbmVzdGVkIGludGVycnVwdA0KbG9n
aWMgaW4gYW4gZXZlbiB3b3JzZSBzdGF0ZS4uLg0KDQpUaGFua3MNCktldmluDQo=

