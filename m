Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA22418E2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Aug 2020 11:29:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5Qai-00036m-0S; Tue, 11 Aug 2020 09:29:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WNGP=BV=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k5Qag-00036h-Cw
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 09:29:06 +0000
X-Inumbo-ID: 0996057e-7809-4ef2-9344-a73527705eae
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0996057e-7809-4ef2-9344-a73527705eae;
 Tue, 11 Aug 2020 09:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597138144;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=OHliDdVbPNGFDbiyD0TsTlGgXfNGsUkjd5RojvmRIZs=;
 b=QqMhl3qXEV+N06LFojN8aHTHON++dBoDAZQkg6E5O6h6ewJdN/RXk7rq
 GmAzEAwiqsDf6tIj9cvf5++MA6SSvD43IU/bdPKixzIWL5qwAx2mexdQq
 4m4w13N8qnt8V5J6XkCPEeyYpX+lnc2+grjlQyz/8V0EZdK+p0qh8vNjf k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NPm4fEWVBwm6Kybw5NVUjabtQahPHvyo3rqJCBolImRnF6ObK65R1HAGnDuMGdc9tbz9UzWh+2
 rdxPxHkJopmj5OtwJN0XyfNcRzicy5e7uOjFHNGZBhiMNTPehJE734SF8TP9ujMQ/Wltwh/NFs
 NUI++4JkLt2WcahYeKY8Du4AH31HVNdYoLKicM/7N+yYI4TrW7SjhY1vNjEGJsxgPuPH/aEBj4
 1ixykLsMRxZZW0YDlrWE6DFxb3QlWfdcmsQGJBkML4wEs5YMdqn1hzkp7owBcw4AyBcqqNPVGr
 BDc=
X-SBRS: 2.7
X-MesageID: 24268493
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,460,1589256000"; d="scan'208";a="24268493"
From: George Dunlap <George.Dunlap@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: RESCHEDULED Call for agenda items for Community Call, August 13 @
 15:00 UTC
Thread-Topic: RESCHEDULED Call for agenda items for Community Call, August 13
 @ 15:00 UTC
Thread-Index: AQHWZoSNV69Oim50MkyA6CRuliqKJqkgITQAgAFbngCAAAB2gIAAAmyAgATCygCADDS6AIAAHegA
Date: Tue, 11 Aug 2020 09:29:00 +0000
Message-ID: <206FC1AD-11A2-4245-8F05-38ABF4F8D869@citrix.com>
References: <1E023F6E-0E3C-4CD5-A074-7BF62635E123@citrix.com>
 <40615946-FF55-48DB-91FB-58DD603FDD69@citrix.com>
 <9bfef1bf-31a7-1c95-60fa-2ca665942fda@suse.com>
 <047B12C2-71AA-459F-853C-DF1CD040D6C1@citrix.com>
 <37d5e973-7645-d4eb-7bd6-f8d3226d7cb5@suse.com>
 <b72f7526-4874-b29b-39d3-913b2b62799b@suse.com>
 <20200811074158.GA22095@Air-de-Roger>
In-Reply-To: <20200811074158.GA22095@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF80E05FEBF49B459C327D6C42E29C59@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDExLCAyMDIwLCBhdCA4OjQxIEFNLCBSb2dlciBQYXUgTW9ubmUgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIE1vbiwgQXVnIDAzLCAyMDIwIGF0IDAz
OjE4OjA4UE0gKzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4gT24gMzEuMDcuMjAyMCAxNDoz
NSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMzEuMDcuMjAyMCAxNDoyNywgR2VvcmdlIER1
bmxhcCB3cm90ZToNCj4+Pj4+IE9uIEp1bCAzMSwgMjAyMCwgYXQgMToyNSBQTSwgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDMwLjA3LjIwMjAgMTc6NDEs
IEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+Pj4+Pj4+IE9uIEp1bCAzMCwgMjAyMCwgYXQgNDoxNyBQ
TSwgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPiB3cm90ZToNCj4+Pj4+
Pj4gDQo+Pj4+Pj4+IEhleSBhbGwsDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBUaGUgY29tbXVuaXR5IGNh
bGwgaXMgc2NoZWR1bGVkIGZvciBuZXh0IHdlZWssIDYgQXVndXN0LiAgSSwgaG93ZXZlciwgd2ls
bCBiZSBvbiBQVE8gdGhhdCB3ZWVrOyBJIHByb3Bvc2UgcmVzY2hlZHVsaW5nIGl0IGZvciB0aGUg
Zm9sbG93aW5nIHdlZWssIDEzIEF1Z3VzdCwgYXQgdGhlIHNhbWUgdGltZS4NCj4+Pj4+Pj4gDQo+
Pj4+Pj4+IFRoZSBwcm9wb3NlZCBhZ2VuZGEgaXMgaW4gWlpaIGFuZCB5b3UgY2FuIGVkaXQgdG8g
YWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1haWwgZGly
ZWN0bHkuDQo+Pj4+Pj4gDQo+Pj4+Pj4gU29ycnksIGluIGFsbCBteSBtYW51YWwgdGVtcGxhdGlu
ZyBJIHNlZW0gdG8gaGF2ZSBtaXNzZWQgdGhpcyBvbmUuICBIZXJl4oCZcyB0aGUgVVJMOg0KPj4+
Pj4+IA0KPj4+Pj4+IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMy9wYWQvZWRpdC85YzU4OTkz
YTA4ZmU5NzQ1MWYwYTViNmM4YmI5MDZiMS8NCj4+Pj4+IA0KPj4+Pj4gSSBnZXQgIlRoaXMgbGlu
ayBkb2VzIG5vdCBnaXZlIHlvdSBhY2Nlc3MgdG8gdGhlIGRvY3VtZW50Ii4gTWF5YmUgYQ0KPj4+
Pj4gcGVybWlzc2lvbnMgcHJvYmxlbT8gSSd2ZSBtZWFudCB0byBhZGQgYSAibWluaW11bSB0b29s
Y2hhaW4gdmVyc2lvbnMiDQo+Pj4+PiB0b3BpYyAuLi4NCj4+Pj4gDQo+Pj4+IFRyeSB0aGlzIG9u
ZT8NCj4+Pj4gDQo+Pj4+IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9WbExk
aml3N2lCbTBSLWVmT015Q1krS3MvDQo+Pj4gDQo+Pj4gQWggeWVzLCB0aGlzIG9uZSB3b3Jrcy4g
VGhhbmtzLg0KPj4gDQo+PiBBbmQgb3ZlciB0aGUgd2Vla2VuZCBJIHJlYWxpemVkIHRoYXQgdGhl
IHdlZWsgb2YgdGhlIDEzdGggSSdtIGdvaW5nIHRvIGJlDQo+PiBvbiBQVE8sIHNvIHZlcnkgbGlr
ZWx5IHdvbid0IGJlIGFibGUgdG8gbWFrZSB0aGUgY2FsbC4gTm90IHN1cmUgd2hhdCB0bw0KPj4g
c3VnZ2VzdCB5b3UgZG8gd2l0aCB0aGUgdG9waWMgLi4uDQoNCkFuZCBJIHdhcyBvbiBQVE8gd2hl
biB5b3Ugc2VudCB0aGlzIG1lc3NhZ2UsIG9yIGF0IGxlYXN0IEkgY291bGQgaGF2ZSB0cmllZCB0
byBnZXQgeW91ciB2aWV3cG9pbnQuIDotLw0KDQo+IE1heWJlIHdlIGNhbiBwb3N0cG9uZSB0byB0
aGUgbmV4dCBjYWxsPw0KPiANCj4gSSB0aGluayB5b3UgaGF2ZSBzdHJvbmcgb3BpbmlvbnMgb24g
dGhlIHRvcGljLCBzbyBpdCB3b24ndCBzZWVtIGZhaXINCj4gdG8gaGF2ZSB0aGUgZGlzY3Vzc2lv
biB3aXRob3V0IHlvdSBwcmVzZW50Lg0KDQpJIHRoaW5rIHdlIHNob3VsZCBhdCBsZWFzdCBoYXZl
IGEgZGlzY3Vzc2lvbiBhYm91dCBpdCBhbmQgc2VlIHdoZXJlIGRpZmZlcmVudCBwZW9wbGUgYXJl
LiAgSSB0aGluayB0aGVyZSB3aWxsIG5lZWQgdG8gYmUgc29tZSBpbnZlc3RpZ2F0aW9uIG9mIHNv
bWUgc29ydCByZWdhcmRsZXNzLCBhbmQgdGhlbiBhIGZvbGxvdy11cCBkaXNjdXNzaW9uIG9uIHRo
ZSBtYWlsaW5nIGxpc3QuDQoNCiAtR2Vvcmdl

