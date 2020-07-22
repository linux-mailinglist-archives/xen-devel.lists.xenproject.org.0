Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B44122987D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 14:49:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyEA5-0007Xk-Tq; Wed, 22 Jul 2020 12:47:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0IpC=BB=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jyEA4-0007Xf-BB
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 12:47:52 +0000
X-Inumbo-ID: 8d794ed8-cc19-11ea-a1a0-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8d794ed8-cc19-11ea-a1a0-12813bfff9fa;
 Wed, 22 Jul 2020 12:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595422071;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=iXF3Nsj4JvxpIT4ZVYF2qgyPJ+WsQnz7naW3sYFT1p0=;
 b=KSRwySH8jouPjtXV5j0TSIpiae6QDmwAH9F6HOqo+gTvW+9XwSEs/NkK
 lZ/Xq0LwWU5j3vyC8YDMjRSlZ71W1KoZh46JF2z/d/1SPu96XBtuore3T
 ghui1DVgJAHrTekrDt9neP5piXSVGYWhKNV7gdrtAgbSzZKs7nPHiFJCQ Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: QuNFg5IDhwSM4Fm4v5++nQSUz5awR7wWVkEXIacXNyJgGN/aImaFdFG0c4s9UrWDnB0ffmtg8z
 dQ9NDbVLVu2C8yFHbUhTBQ6TLWDxdfU2G4PL1aGPhpYGa+7mlwEIqixPrbmDJ3KPljMaHN/XTB
 ScROH88yerC5Z4wGMT2zLIxS+dJQ52JlIFzlfcxDWoqK3qwFjQPmQEx6UGGWx6fRa6gFBoncAV
 VPp0vALMVog9QrrHUgK1bnWqy/CVv9YOaPq5uV8Lp/j/zRKw6C5YBcoQywp2yeBwRpcE2y4lEM
 8wI=
X-SBRS: 2.7
X-MesageID: 23128803
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,381,1589256000"; d="scan'208";a="23128803"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [OSSTEST PATCH 05/14] sg-report-flight: Use WITH to use best
 index use for $flightsq
Thread-Topic: [OSSTEST PATCH 05/14] sg-report-flight: Use WITH to use best
 index use for $flightsq
Thread-Index: AQHWX46t5LGxeS+LX0KNSBltVaDWxqkTa/WA
Date: Wed, 22 Jul 2020 12:47:47 +0000
Message-ID: <12D6C675-582D-467A-A882-B779652AF635@citrix.com>
References: <20200721184205.15232-1-ian.jackson@eu.citrix.com>
 <20200721184205.15232-6-ian.jackson@eu.citrix.com>
In-Reply-To: <20200721184205.15232-6-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <CED72C3E85B75C47BFF6E173743CC6BB@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDIxLCAyMDIwLCBhdCA3OjQxIFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBXaGlsZSB3ZSdyZSBoZXJlLCBjb252ZXJ0
IHRoaXMgRVhJU1RTIHN1YnF1ZXJ5IHRvIGEgSk9JTi4NCj4gDQo+IFBlcmY6IHJ1bnRpbWUgb2Yg
bXkgdGVzdCBjYXNlIG5vdyB+MjAwLTMwMHMuDQo+IA0KPiBFeGFtcGxlIHF1ZXJ5IGJlZm9yZSAo
ZnJvbSB0aGUgUGVybCBEQkkgdHJhY2UpOg0KPiANCj4gICAgICBTRUxFQ1QgKiBGUk9NICgNCj4g
ICAgICAgIFNFTEVDVCBESVNUSU5DVCBmbGlnaHQsIGJsZXNzaW5nDQo+ICAgICAgICAgICAgIEZS
T00gZmxpZ2h0cw0KPiAgICAgICAgICAgICBKT0lOIHJ1bnZhcnMgcjEgVVNJTkcgKGZsaWdodCkN
Cj4gDQo+ICAgICAgICAgICAgV0hFUkUgKGJyYW5jaD0neGVuLXVuc3RhYmxlJykNCj4gICAgICAg
ICAgICAgIEFORCAoIChUUlVFIEFORCBmbGlnaHQgPD0gMTUxOTAzKSBBTkQgKGJsZXNzaW5nPSdy
ZWFsJykgKQ0KPiAgICAgICAgICAgICAgICAgIEFORCBFWElTVFMgKFNFTEVDVCAxDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIEZST00gam9icw0KPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFdIRVJFIGpvYnMuZmxpZ2h0ID0gZmxpZ2h0cy5mbGlnaHQNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEFORCBqb2JzLmpvYiA9ID8pDQo+IA0KPiAgICAgICAgICAgICAgQU5EIHIx
Lm5hbWUgTElLRSAnYnVpbHRfcmV2aXNpb25fJScNCj4gICAgICAgICAgICAgIEFORCByMS5uYW1l
ID0gPw0KPiAgICAgICAgICAgICAgQU5EIHIxLnZhbD0gPw0KPiANCj4gICAgICAgICAgICBPUkRF
UiBCWSBmbGlnaHQgREVTQw0KPiAgICAgICAgICAgIExJTUlUIDEwMDANCj4gICAgICApIEFTIHN1
Yg0KPiAgICAgIE9SREVSIEJZIGJsZXNzaW5nIEFTQywgZmxpZ2h0IERFU0MNCj4gDQo+IFdpdGgg
YmluZCB2YXJpYWJsZXM6DQo+IA0KPiAgICAgInRlc3QtYXJtaGYtYXJtaGYtbGlidmlydCINCj4g
ICAgICdidWlsdF9yZXZpc2lvbl94ZW4nDQo+ICAgICAnMTY1ZjNhZmJmYzNkYjcwZmNmZGNjYWQw
NzA4NWNkZTBhMDNjODU4YicNCj4gDQo+IEFmdGVyOg0KPiANCj4gICAgICBXSVRIIHN1YiBBUyAo
DQo+ICAgICAgICBTRUxFQ1QgRElTVElOQ1QgZmxpZ2h0LCBibGVzc2luZw0KPiAgICAgICAgICAg
ICBGUk9NIGZsaWdodHMNCj4gICAgICAgICAgICAgSk9JTiBydW52YXJzIHIxIFVTSU5HIChmbGln
aHQpDQo+IA0KPiAgICAgICAgICAgIFdIRVJFIChicmFuY2g9J3hlbi11bnN0YWJsZScpDQo+ICAg
ICAgICAgICAgICBBTkQgKCAoVFJVRSBBTkQgZmxpZ2h0IDw9IDE1MTkwMykgQU5EIChibGVzc2lu
Zz0ncmVhbCcpICkNCj4gICAgICAgICAgICAgIEFORCByMS5uYW1lIExJS0UgJ2J1aWx0X3Jldmlz
aW9uXyUnDQo+ICAgICAgICAgICAgICBBTkQgcjEubmFtZSA9ID8NCj4gICAgICAgICAgICAgIEFO
RCByMS52YWw9ID8NCj4gDQo+ICAgICAgICAgICAgT1JERVIgQlkgZmxpZ2h0IERFU0MNCj4gICAg
ICAgICAgICBMSU1JVCAxMDAwDQo+ICAgICAgKQ0KPiAgICAgIFNFTEVDVCAqDQo+ICAgICAgICBG
Uk9NIHN1Yg0KPiAgICAgICAgSk9JTiBqb2JzIFVTSU5HIChmbGlnaHQpDQo+IA0KPiAgICAgICBX
SEVSRSAoMT0xKQ0KPiAgICAgICAgICAgICAgICAgIEFORCBqb2JzLmpvYiA9ID8NCj4gDQo+ICAg
ICAgT1JERVIgQlkgYmxlc3NpbmcgQVNDLCBmbGlnaHQgREVTQw0KDQpJIHdhcyB3b25kZXJpbmcg
aWYgaXQgd291bGQgYmUgdXNlZnVsIGNvbnZlcnRpbmcgdGhpcyB0byBhIGpvaW4gd291bGQgYmUg
dXNlZnVsLiA6LSkNCg0KQWdhaW4sIG5vdCBzdXJlIHdoYXQgdGhlIOKAnCgxPTEpIEFOROKAnSBi
aXQgaXMgZm9yOyBzb21ldGhpbmcgdG8gcG9rZSB0aGUgcXVlcnkgcGxhbm5lciBzb21laG93Pw0K
DQpUaGUgbWFpbiB0aGluZyBJIHNlZSBoZXJlIGlzIHRoYXQgdGhlcmXigJlzIG5vdGhpbmcgKmlu
IHRoZSBxdWVyeSogdGhhdCBndWFyYW50ZWVzIHlvdSB3b27igJl0IGdldCBtdWx0aXBsZSBmbGln
aHRzIGlmIHRoZXJlIGFyZSBtdWx0aXBsZSBqb2JzIGZvciB0aGF0IGZsaWdodCB3aG9zZSDigJhq
b2LigJkgdmFsdWU7IGJ1dCBnaXZlbiB0aGUgbmFtaW5nIHNjaGVtZSBzbyBmYXIsIEnigJltIGd1
ZXNzaW5nIGpvYiBpcyB1bmlxdWXigKY/ICBBcyBsb25nIGFzIHRoZXJl4oCZcyBzb21ldGhpbmcg
ZWxzZSBwcmV2ZW50aW5nIGR1cGxpY2F0aW9uIEkgdGhpbmsgaXTigJlzIGZpbmUuDQoNCiAtR2Vv
cmdlDQoNCg==

