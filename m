Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E7E1B61E1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 19:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRfYc-00065r-IX; Thu, 23 Apr 2020 17:22:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmme=6H=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jRfYb-00065m-Gf
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 17:22:37 +0000
X-Inumbo-ID: 06474722-8587-11ea-93d9-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06474722-8587-11ea-93d9-12813bfff9fa;
 Thu, 23 Apr 2020 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587662556;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=SXX6Cy3HxWZ7kISvWQb+UKGGpIRrggUJxZYRrimT6nU=;
 b=QYMlwYheiBuz0Ft8IuuqYM/KEk1L4K3GBFNPHAo4zYcxddGUNh6j3x30
 /UlcNDMVo4gqG75hJyTQ/JOiNEXMkeWlu4Pq3jx0KSMeZBtcy2hYBmt6u
 5xwLJEMeZLvlvlz66Q3Xl2fBCeClQin7JZIo3yBcE1wl3hAoyha0DkavD 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /qzOoBD1WyV3+KRJQD94Vx/OmNKtjNdyBy9/vCbhkj2tQkdEEDAXgxIXXd7/UaxnkfdV2ybBeK
 27kZlW4uvt7V+bTsc9LYjB/WOgC/7UTUeJZZePHl3Kahpm2fy8OCZu7KqW79lWAGrc3mFkOCx3
 c6aUwuu+V6KniBWYWzMA78aRW9zQ3aDax8KLTs6EHwmvfu1HvqiSE86w+Qm1XuPNpvzuqzTeLv
 Z4HRly9ZFZKstHPqmpgHPWuWM5J28jTy68EE81uv+T7YE/1voEALzDGClsIg0y0dfussTB0rzv
 x84=
X-SBRS: 2.7
X-MesageID: 16548945
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16548945"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: Golang Xen packages and the golang packaging  system
Thread-Topic: Golang Xen packages and the golang packaging  system
Thread-Index: AQHWGL+431OGV0A6ZUWxyQX/eS/9b6iGcJeAgAAA0oCAAAYAAIAAXRsA
Date: Thu, 23 Apr 2020 17:22:33 +0000
Message-ID: <C10E07AB-FDE8-4588-95E7-6109F0FDB5E2@citrix.com>
References: <FC32A2FB-F339-4F3A-8237-0A4334ADF3D2@citrix.com>
 <24225.31493.220592.722565@mariner.uk.xensource.com>
 <24225.31669.536258.56822@mariner.uk.xensource.com>
 <4085F05B-ABEC-446A-8BB1-06DEE57D71A5@citrix.com>
In-Reply-To: <4085F05B-ABEC-446A-8BB1-06DEE57D71A5@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <77DAB79F4C839D46B2BC9950EA0612A4@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nick Rosbrook <rosbrookn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIEFwciAyMywgMjAyMCwgYXQgMTI6NDkgUE0sIEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5k
dW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+PiBPbiBBcHIgMjMsIDIwMjAs
IGF0IDEyOjI3IFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
DQo+PiANCj4+IElhbiBKYWNrc29uIHdyaXRlcyAoIlJlOiBHb2xhbmcgWGVuIHBhY2thZ2VzIGFu
ZCB0aGUgZ29sYW5nIHBhY2thZ2luZyAgc3lzdGVtIik6DQo+Pj4gVGhpcyBpcyBxdWl0ZSB1bnBs
ZWFzYW50LiAgSW4gcGFydGljdWxhciwgaXQgbWFrZXMgYSBnaXQgdHJlZSBvdXQgb2YNCj4+PiBv
dXRwdXQgZmlsZXMuICBXaGF0IHdpbGwgd2UgZG8gd2hlbiBzb21lb25lIHNlbmRzIHVzIHBhdGNo
ZXMgdG8gdGhlDQo+Pj4gYmluZGluZ3MgPw0KPj4gDQo+PiBBbHNvLCBhbnlvbmUgd2hvIHJlZGlz
dHJpYnV0ZXMgeW91ciBwcm9wb3NlZCBnb2xhbmcgcGFja2FnZSBpcw0KPj4gdmlvbGF0aW5nIG91
ciBsaWNlbmNlIHVubGVzcyB0aGV5IHNoaXAgYSBjb3B5IG9mIHhlbi5naXRbMV0gdG9vLCBzaW5j
ZQ0KPj4gdGhlIGdvbGFuZyBwYWNrYWdlIGlzIG5vdCBzb3VyY2UgY29kZS4NCj4+IA0KPj4gWzFd
IFRlY2huaWNhbGx5LCBhIGNvcHkgb2YgdGhlIHJlbGV2YW50IHBhcnRzIHdpbGwgZG8uDQo+IA0K
PiBUaGUg4oCccmVsZXZhbnQgcGFydHPigJ0gd291bGQgcHJpbWFyaWx5IGJlIGdlbmdvdHlwZXMu
cHksIHJpZ2h0PyAgT2gsIGFuZCBJIGd1ZXNzIGxpYnhsX3Rlc3QuaWRsIGFuZCBmcmllbmRzLiAg
bGlieGxfdGVzdC5pZGwgaXNu4oCZdCBpbmNsdWRlZCBpbiB0aGUgZGlzdHJpYnV0aW9uIGVpdGhl
ci4NCj4gDQo+IEnigJltIG5vdCBhbiBleHBlcnQgaW4gdGhlIGdvbGFuZyBidWlsZCBzeXN0ZW0s
IGJ1dCB0aGV5IGdlbmVyYWxseSBzZWVtIHRvIGJlIHRyeWluZyB0byBrZWVwIHRoZSBmdW5jdGlv
bmFsaXR5IHNpbXBsZSAod2hpY2ggb2YgY291cnNlLCBtZWFucyBpZiB5b3Ugd2FudCB0byBkbyBh
bnl0aGluZyBub24tYmFzaWMsIGl04oCZcyBpbmNyZWRpYmx5IGNvbXBsaWNhdGVkIG9yIGNvbXBs
ZXRlbHkgaW1wb3NzaWJsZSkuDQo+IA0KPiBUaGVyZeKAmXMgYSBjb21tYW5kLCBgZ28gZ2VuZXJh
dGVgLCB3aGljaCB3ZSBjb3VsZCB1c2UgdG8gcnVuIGdlbmdvdHlwZXMucHkgdG8gZ2VuZXJhdGUg
dGhlIGFwcHJvcHJpYXRlIGZpbGVzLiAgQnV0IEnigJltIG5vdCBzdXJlIGhvdyB0byB1c2UgdGhh
dCBpbiBhIHByYWN0aWNhbCB3YXkgZm9yIHRoaXMgc29ydCBvZiBwYWNrYWdlOiBpdCBtaWdodCBl
bmQgdXAgdGhhdCBwZW9wbGUgd2FudGluZyB0byB1c2UgdGhlIHBhY2thZ2Ugd291bGQgbmVlZCB0
byBtYW51YWxseSBjbG9uZSBpdCwgdGhlbiBtYW51YWxseSBydW4gYGdvIGdlbmVyYXRlYCBiZWZv
cmUgbWFudWFsbHkgYnVpbGRpbmcgdGhlIHBhY2thZ2UuDQo+IA0KPiBDaGVja2luZyBpbiB0aGUg
Z2VuZXJhdGVkIGZpbGVzIG1lYW5zIHRoYXQgc29tZW9uZSBjYW4gc2ltcGx5IGFkZCBgZ29sYW5n
LnhlbnByb2plY3Qub3JnL3hlbmxpZ2h0YCBhcyBhIGRlcGVuZGVuY3kgKHBlcmhhcHMgd2l0aCBh
IHNwZWNpZmljIHZlcnNpb24gdGFnLCBsaWtlIHY0LjE0KSwgYW5kIGV2ZXJ5dGhpbmcgSnVzdCBX
b3Jrcy4NCj4gDQo+IE5pY2sgbWF5IGhhdmUgc29tZSBpZGVhcyBvbiBob3cgdG8gdXNlIHRoZSBn
b2xhbmcgYnVpbGQgc3lzdGVtIG1vcmUgZWZmZWN0aXZlbHkuDQoNClNvLCB0aGUgZm9sbG93aW5n
IHNlZW1zIHRvIHdvcmsgcXVpdGUgd2VsbCBhY3R1YWxseToNCg0KbWtkaXIgdmVuZG9yDQpsbiAt
cyB2ZW5kb3IvZ29sYW5nLnhlbnByb2plY3Qub3JnIC91c3Ivc2hhcmUvZ29jb2RlL3NyYy9nb2xh
bmcueGVucHJvamVjdC5vcmcNCmVjaG8g4oCcZ29sYW5nLnhlbnByb2plY3Qub3JnL3hlbmxpZ2h0
4oCdID4+IHZlbmRvci9tb2R1bGVzLnR4dA0KZ28gYnVpbGQgLW1vZD12ZW5kb3INCg0KVXNpbmcg
dGhlIGFib3ZlIG1ldGhvZCwgKHNheSkgcmVkY3RsLmdpdCB3b3VsZCBidWlsZCBleGFjdGx5IHRo
ZSBzYW1lIG9uIFhlbiA0LjE0IGFzIG9uIFhlbiA0LjE1IChhc3N1bWluZyByZWRjdGwgd2FzbuKA
mXQgdXNpbmcgYW55dGhpbmcgbm90IGF2YWlsYWJsZSBpbiA0LjE0KS4NCg0KSeKAmW0gaW5jbGlu
ZWQgdG8gc2F5IHdlIHNob3VsZCBzdGFydCB3aXRoIGp1c3QgdGVsbGluZyBwZW9wbGUgdG8gZG8g
dGhhdCwgYW5kIGxvb2sgYXQgZG9pbmcgc29tZXRoaW5nIGVsc2UgaWYgd2UgZGlzY292ZXIgdGhh
dOKAmXMgbm90IHN1aXRhYmxlIGZvciBzb21lIHJlYXNvbi4NCg0KIC1HZW9yZ2U=

