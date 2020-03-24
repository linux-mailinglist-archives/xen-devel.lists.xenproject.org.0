Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C88B3190851
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 09:52:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGfFg-0001et-6M; Tue, 24 Mar 2020 08:49:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8ME=5J=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jGfFe-0001eo-Il
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 08:49:34 +0000
X-Inumbo-ID: 617136b4-6dac-11ea-839e-12813bfff9fa
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 617136b4-6dac-11ea-839e-12813bfff9fa;
 Tue, 24 Mar 2020 08:49:33 +0000 (UTC)
IronPort-SDR: u+d504n2CaEt+HikFOGb+WoFDDpPG2Mp/IhMaigyOdsxS2zP5KLI2DAFU0Brk4w/0R+oK2mbwB
 Pk4JArn7jTwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2020 01:49:31 -0700
IronPort-SDR: fEVjcYeBMvohQ/18ZiBixg549ZPJB5OrnOhaoQfO+MNh7iNLaBgyZQumqkoX5IdPc8thl6MHqR
 VznOFp1HHArQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,299,1580803200"; d="scan'208";a="270269072"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 24 Mar 2020 01:49:31 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 24 Mar 2020 01:49:31 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.43]) with mapi id 14.03.0439.000;
 Tue, 24 Mar 2020 16:49:28 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH 1/3] Revert "x86/vvmx: fix virtual interrupt injection
 when Ack on exit control is used"
Thread-Index: AQHV/urpGxanB9MUKkeByU3KdN9o6qhVUPKAgABvYICAAX4akP//pOaAgACQvkA=
Date: Tue, 24 Mar 2020 08:49:27 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5D72@SHSMSX104.ccr.corp.intel.com>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-2-roger.pau@citrix.com>
 <a1eacbaf-1fb0-94c9-d1e6-716fd1fd38ad@suse.com>
 <20200323144837.GB24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5ADE@SHSMSX104.ccr.corp.intel.com>
 <3d0286dd-1702-e7dd-a0a1-795cbd54ccb3@suse.com>
In-Reply-To: <3d0286dd-1702-e7dd-a0a1-795cbd54ccb3@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE1hcmNoIDI0LCAyMDIwIDQ6MTAgUE0NCj4gDQo+IE9uIDI0LjAzLjIwMjAgMDY6NDEsIFRpYW4s
IEtldmluIHdyb3RlOg0KPiA+PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4NCj4gPj4gU2VudDogTW9uZGF5LCBNYXJjaCAyMywgMjAyMCAxMDo0OSBQTQ0KPiA+
Pg0KPiA+PiBPbiBNb24sIE1hciAyMywgMjAyMCBhdCAwOTowOTo1OUFNICswMTAwLCBKYW4gQmV1
bGljaCB3cm90ZToNCj4gPj4+IE9uIDIwLjAzLjIwMjAgMjA6MDcsIFJvZ2VyIFBhdSBNb25uZSB3
cm90ZToNCj4gPj4+PiBUaGlzIHJldmVydHMgY29tbWl0IGY5NmUxNDY5YWQwNmI2MTc5NmM2MDE5
M2RhYWViOWY4YTk2ZDc0NTguDQo+ID4+Pj4NCj4gPj4+PiBUaGUgY29tbWl0IGlzIHdyb25nLCBh
cyB0aGUgd2hvbGUgcG9pbnQgb2YgbnZteF91cGRhdGVfYXBpY3YgaXMgdG8NCj4gPj4+PiB1cGRh
dGUgdGhlIGd1ZXN0IGludGVycnVwdCBzdGF0dXMgZmllbGQgd2hlbiB0aGUgQWNrIG9uIGV4aXQg
Vk1FWElUDQo+ID4+Pj4gY29udHJvbCBmZWF0dXJlIGlzIGVuYWJsZWQuDQo+ID4+Pj4NCj4gPj4+
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4N
Cj4gPj4+DQo+ID4+PiBCZWZvcmUgYW55b25lIGdldHMgdG8gbG9vayBhdCB0aGUgb3RoZXIgdHdv
IHBhdGNoZXMsIHNob3VsZCB0aGlzDQo+ID4+PiBiZSB0aHJvd24gaW4gcmlnaHQgYXdheT8NCj4g
Pj4NCj4gPj4gSSB3b3VsZCBsaWtlIGlmIHBvc3NpYmxlIGdldCBhIGNvbmZpcm1hdGlvbiBmcm9t
IEtldmluIChvciBhbnlvbmUNCj4gPj4gZWxzZSkgdGhhdCBteSB1bmRlcnN0YW5kaW5nIGlzIGNv
cnJlY3QuIEkgZmluZCB0aGUgbmVzdGVkIGNvZGUgdmVyeQ0KPiA+PiBjb25mdXNpbmcsIGFuZCBJ
J3ZlIGFscmVhZHkgbWFkZSBhIG1pc3Rha2Ugd2hpbGUgdHJ5aW5nIHRvIGZpeCBpdC4NCj4gPj4g
VGhhdCBiZWluZyBzYWlkLCB0aGlzIHdhcyBzcG90dGVkIGJ5IG9zc3Rlc3QgYXMgaW50cm9kdWNp
bmcgYQ0KPiA+PiByZWdyZXNzaW9uLCBzbyBJIGd1ZXNzIGl0J3Mgc2FmZSB0byBqdXN0IHRvc3Mg
aXQgaW4gbm93Lg0KPiA+Pg0KPiA+PiBGV0lXIHBhdGNoIDIvMyBhdHRlbXB0cyB0byBwcm92aWRl
IGEgZGVzY3JpcHRpb24gb2YgbXkgdW5kZXJzdGFuZGluZw0KPiA+PiBvZiBob3cgbnZteF91cGRh
dGVfYXBpY3Ygd29ya3MuDQo+ID4+DQo+ID4NCj4gPiBJIGZlZWwgaXQgaXMgbm90IGdvb2QgdG8g
dGFrZSB0aGlzIHBhdGNoIGFsb25lLCBhcyBpdCB3YXMgaW50cm9kdWNlZCB0byBmaXgNCj4gPiBh
bm90aGVyIHByb2JsZW0uIFcvbyB1bmRlcnN0YW5kaW5nIHdoZXRoZXIgdGhlIHdob2xlIHNlcmll
cyBjYW4NCj4gPiBmaXggYm90aCBvbGQgYW5kIG5ldyBwcm9ibGVtcywgd2UgbWF5IHJpc2sgcHV0
dGluZyBuZXN0ZWQgaW50ZXJydXB0DQo+ID4gbG9naWMgaW4gYW4gZXZlbiB3b3JzZSBzdGF0ZS4u
Lg0KPiANCj4gV2VsbCwgb2theSwgSSdsbCB3YWl0IHRoZW4sIGJ1dCBpdCB3b3VsZCBzZWVtIHRv
IG1lIHRoYXQgcmV2ZXJ0aW5nDQo+IHdvdWxkbid0IHB1dCB1cyBpbiBhIHdvcnNlIHN0YXRlIHRo
YW4gd2Ugd2VyZSBpbiBiZWZvcmUgdGhhdCBjaGFuZ2UNCj4gd2FzIHB1dCBpbi4NCg0KUm9nZXIg
bmVlZHMgdG8gbWFrZSB0aGUgY2FsbCwgaS5lLiB3aGljaCBwcm9ibGVtIGlzIG1vcmUgc2V2ZXJl
LCBvbGQgb3INCm5ldyBvbmUuDQoNClRoYW5rcw0KS2V2aW4NCg==

