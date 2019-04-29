Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2482EB66
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 22:11:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLCa0-0006EM-L3; Mon, 29 Apr 2019 20:08:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kVn5=S7=amazon.de=prvs=015f510af=wipawel@srs-us1.protection.inumbo.net>)
 id 1hLCZz-0006EH-P1
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 20:08:47 +0000
X-Inumbo-ID: 97ff957c-6aba-11e9-843c-bc764e045a96
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 97ff957c-6aba-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 20:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1556568525; x=1588104525;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=EB5zCFqbB/iF52hSKXoxSXRO8cIM3l68nyBsUEmOt/4=;
 b=QSVhD+/R1l3+Q24eRYiQ7shQteHXPGPLZpk4RfHaXGOkg1/CZhUWl1PO
 tRlk+seHjXUJyfbFAgVgqQw54cmvkfIixid29L6CoRWmUfG2kEObFkbJw
 ZLayEQqslFrjXVbAF1odz++BFHDRlQDoCaSVA4wPJnh3YGp0hSPU91U/q Q=;
X-IronPort-AV: E=Sophos;i="5.60,410,1549929600"; d="scan'208";a="394475715"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-8549039f.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 29 Apr 2019 15:43:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2a-8549039f.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3TFhmiW086741
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 29 Apr 2019 15:43:53 GMT
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 15:43:52 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 15:43:52 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 29 Apr 2019 15:43:52 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [Xen-devel] [livepatch-build-tools 4/4] livepatch-build: Handle
 newly created object files
Thread-Index: AQHU7eWlRnLadQcrBEOjBIkm2/JetaZTSfwAgAAe6IA=
Date: Mon, 29 Apr 2019 15:43:51 +0000
Message-ID: <97D1EEC1-43F3-4E76-815F-6A1738514813@amazon.com>
References: <20190408083224.104802-1-wipawel@amazon.de>
 <20190408083224.104802-4-wipawel@amazon.de>
 <48e629c2-f1f3-bacf-6d86-1c2d1045a41f@citrix.com>
In-Reply-To: <48e629c2-f1f3-bacf-6d86-1c2d1045a41f@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.116]
Content-ID: <F7F37662F8B3E1439E0F4F9B846E614F@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-build-tools 4/4] livepatch-build: Handle
 newly created object files
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIDI5LiBBcHIgMjAxOSwgYXQgMTU6NTMsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIDQvOC8xOSA5OjMyIEFNLCBQYXdlbCBX
aWVjem9ya2lld2ljeiB3cm90ZToNCj4+IFVwIHRvIG5vdyB0aGUgbGl2ZXBhdGNoLWJ1aWxkIGln
bm9yZXMgbmV3bHkgY3JlYXRlZCBvYmplY3QgZmlsZXMuDQo+PiBXaGVuIHBhdGNoIGFwcGxpZXMg
bmV3IC5jIGZpbGUgYW5kIGF1Z21lbnRzIGl0cyBNYWtlZmlsZSB0byBidWlsZCBpdA0KPj4gdGhl
IHJlc3VsdGluZyBvYmplY3QgZmlsZSBpcyBub3QgdGFrZW4gaW50byBhY2NvdW50IGZvciBmaW5h
bCBsaW5raW5nDQo+PiBzdGVwLg0KPj4gU3VjaCBuZXdseSBjcmVhdGVkIG9iamVjdCBmaWxlcyBj
YW4gYmUgZGV0ZWN0ZWQgYnkgY29tcGFyaW5nIHBhdGNoZWQvDQo+PiBhbmQgb3JpZ2luYWwvIGRp
cmVjdG9yaWVzIGFuZCBjb3BpZWQgb3ZlciB0byB0aGUgb3V0cHV0IGRpcmVjdG9yeSBmb3INCj4+
IHRoZSBmaW5hbCBsaW5raW5nIHN0ZXAuDQo+PiBTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9y
a2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+DQo+PiBSZXZpZXdlZC1ieTogQW5kcmEtSXJpbmEg
UGFyYXNjaGl2IDxhbmRyYXByc0BhbWF6b24uY29tPg0KPj4gUmV2aWV3ZWQtYnk6IEJqb2VybiBE
b2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+DQo+PiBSZXZpZXdlZC1ieTogTm9yYmVydCBNYW50aGV5
IDxubWFudGhleUBhbWF6b24uZGU+DQo+PiAtLS0NCj4+ICBsaXZlcGF0Y2gtYnVpbGQgfCA2ICsr
KysrKw0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4+IGRpZmYgLS1naXQg
YS9saXZlcGF0Y2gtYnVpbGQgYi9saXZlcGF0Y2gtYnVpbGQNCj4+IGluZGV4IDc5NjgzOGMuLmI0
MzczMGMgMTAwNzU1DQo+PiAtLS0gYS9saXZlcGF0Y2gtYnVpbGQNCj4+ICsrKyBiL2xpdmVwYXRj
aC1idWlsZA0KPj4gQEAgLTE0Niw2ICsxNDYsMTIgQEAgZnVuY3Rpb24gY3JlYXRlX3BhdGNoKCkN
Cj4+ICAgICAgICAgIGZpDQo+PiAgICAgIGRvbmUNCj4+ICArICAgIE5FV19GSUxFUz0kKGNvbW0g
LTIzIDwoZmluZCBwYXRjaGVkIC10eXBlIGYgLW5hbWUgJyoubycgfCBjdXQgLWYyLSAtZCcvJyB8
IHNvcnQgLXUpIDwoZmluZCBvcmlnaW5hbCAtdHlwZSBmIC1uYW1lICcqLm8nIHwgY3V0IC1mMi0g
LWQnLycgfCBzb3J0IC11KSkNCj4gDQo+IFRoZSBwYXRocyBzaG91bGQgYmUgYHBhdGNoZWQveGVu
YCBhbmQgYG9yaWdpbmFsL3hlbmAgc28gdGhhdCBvbmx5IGh5cGVydmlzb3IgY2hhbmdlcyBhcmUg
cHJvY2Vzc2VkLiBJdCBpcyBkb25lIHRoaXMgd2F5IGVhcmxpZXIgKHNlZSBGSUxFUz0iJChmaW5k
IHhlbiAuLi4pIikuDQoNCkFDSy4gV2lsbCBmaXguDQoNCj4gDQo+IFNpbmNlIHByb2Nlc3Mgc3Vi
c3RpdHV0aW9uIGNyZWF0ZXMgYSBzdWJzaGVsbCwgaXQgbWlnaHQgYmUgc2ltcGxlciB0byBkbyA8
KGNkIHBhdGNoZWQveGVuICYmIGZpbmQgLiAuLi4pIGFuZCB0aGVuIGRyb3AgdGhlIGBjdXRgLiBB
bHNvLCB0aGUgYC11YCBhcmd1bWVudCB0byBzb3J0IHNlZW1zIHVubmVjZXNzYXJ5Lg0KDQpBQ0su
IFdpbGwgZml4Lg0KVGhlIC11IGZvciBzb3J0IGlzIGp1c3QgbXkgcGFyYW5vaWEuDQoNCj4gDQo+
PiArICAgIGZvciBpIGluICRORVdfRklMRVM7IGRvDQo+PiArICAgICAgICBjcCAicGF0Y2hlZC8k
aSIgIm91dHB1dC8kaSINCj4+ICsgICAgICAgIENIQU5HRUQ9MQ0KPj4gKyAgICBkb25lDQo+IA0K
PiBJZiB0aGUgbGl2ZSBwYXRjaCBmb3Igd2hhdGV2ZXIgcmVhc29uIGhhcyBubyAicGF0Y2hlZCIg
b2JqZWN0IGZpbGVzIGFuZCBvbmx5ICJuZXciIG9iamVjdCBmaWxlcywgdGhlbiBpdCBpcyBub3Qg
Z29pbmcgdG8gZG8gYW55dGhpbmcgdXNlZnVsIHNpbmNlIG5vdGhpbmcgd2lsbCB1c2UgdGhlIG5l
dyBmdW5jdGlvbnMuIFRoaXMgc2hvdWxkIGZhaWwgdG8gYnVpbGQgd2l0aCBhbiBlcnJvci4gRS5n
LiBzZXQgTkVXPTEgYWJvdmUgYW5kIHRoZW4gbGF0ZXIgY2hlY2sgZm9yIENIQU5HRUQ9MCAmJiBO
RVc9MS4NCj4gDQoNCkkgZGlzYWdyZWUgaGVyZS4gSW5saW5lIGFzc2VtYmx5IHBhdGNoaW5nIGNh
biB1c2UgbmV3IGZ1bmN0aW9ucyBldmVuIHdpdGhvdXQgaGF2aW5nIGFueSAicGF0Y2hlZCIgb2Jq
ZWN0cy4NCkFsc28gaG90cGF0Y2ggbW9kdWxlcyB3aXRoIGhvb2tzIChmdW5jdGlvbmFsaXR5IEkg
d2lsbCBzZW5kIHVwc3RyZWFtIHNvb24pIGNhbiB1c2UgdGhlICJuZXciIG9iamVjdHMgcHJvdmlk
ZWQNCmZ1bmN0aW9uYWxpdHkgZm9yIHZhcmlvdXMgcmVhc29ucyAocmUtcmVnaXN0cmF0aW5nIGEg
Y2FsbGJhY2sgZm9yIGluc3RhbmNlLCBvciBzb21lIHRlc3RpbmcgcmVsYXRlZCBhY3Rpdml0aWVz
KS4NCg0KPiBQcmV2aW91c2x5IGFsbCBvYmplY3QgZmlsZXMgdGhhdCB3ZXJlIGxpbmtlZCBpbnRv
IHRoZSBsaXZlcGF0Y2ggd2VyZSBmcm9tIHRoZSBvdXRwdXQgb2YgY3JlYXRlLWRpZmYtb2JqZWN0
LiBUaGlzIGNoYW5nZSBqdXN0IGluY2x1ZGVzIHRoZSBuZXdseSBidWlsdCBvYmplY3QgZmlsZXMg
ZGlyZWN0bHkuIEkgd29uZGVyIGlmIHRoZXJlIGFyZSBhbnkgaXNzdWVzIG9yIHN1YnRsZSBkaWZm
ZXJlbmNlcyB3aGVuIGRvaW5nIHRoaXM/IEEgY291cGxlIG9mIGRpZmZlcmVuY2VzIG9mZiB0aGUg
dG9wIG9mIG15IGhlYWQ6DQo+IA0KPiAxKSBUaGUgb2JqZWN0IGZpbGUgd2lsbCBpbmNsdWRlIF9l
dmVyeXRoaW5nXyAoZS5nLiBwb3RlbnRpYWxseSB1bnVzZWQgZnVuY3Rpb25zKSB3aGlsZSBjcmVh
dGUtZGlmZi1vYmplY3QgZ2VuZXJhbGx5IG9ubHkgaW5jbHVkZXMgdGhlIG1pbmltdW0gdGhhdCBp
cyBuZWVkZWQuDQoNClllcywgdGhhdOKAmXMgcmlnaHQuIFdoZW4gYSBwYXRjaCBkZWZpbmVzIG5l
dyBmaWxlcyAoYW5kIHRoZXJlYnkgbmV3IG9iamVjdCBmaWxlcykgaXQgc2hvdWxkIGRvIGl0IHdp
c2VseS4NCg0KPiANCj4gMikgSG9va3MgYW5kIGlnbm9yZWQgZnVuY3Rpb25zL3NlY3Rpb25zIGlu
IHRoZSBuZXcgb2JqZWN0IGZpbGUgd291bGQgbm90IGJlIHByb2Nlc3NlZCBhdCBhbGwuDQoNCk5v
dCBzdXJlIEkgZm9sbG93IHRoZSBwb2ludCBoZXJlLCBidXQgaG9va3MgYW5kIGZ1bmN0aW9ucyBw
cm9wZXJseSBkZWZpbmVkIGluIG5ldyBvYmplY3QgZmlsZXMgd2lsbCBiZQ0KcHJvY2Vzc2VkIGFu
ZCB1c2VkIGR1cmluZyBsaW5rIHRpbWUuDQoNCkkgaGF2ZSBhIHRlc3QgaG90cGF0Y2ggdGhhdCBk
b2VzIHRoYXQuDQoNCj4gDQo+IFRoZSB3YXMgcHJldmlvdXNseSBhIHBhdGNoIG9uIHhlbi1kZXZl
bCB3aGljaCB0b29rIGEgZGlmZmVyZW50IGFwcHJvYWNoIChodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTctMDYvbXNnMDM1MzIuaHRtbCkuIFBl
cmhhcHMgeW91IGNvdWxkIGxvb2sgYXQgaXQgYW5kIHNlZSB3aGljaCBhcHByb2FjaCB3b3VsZCBi
ZSBiZXR0ZXI/DQoNClRha2luZyBhIGxvb2suIFRoYW5rcy4NCg0KPiANCj4gVGhhbmtzLA0KPiAt
LSANCj4gUm9zcyBMYWdlcndhbGwNCj4gDQo+IA0KDQpCZXN0IFJlZ2FyZHMsDQpQYXdlbCBXaWVj
em9ya2lld2ljegoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1
c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhyZXI6IENocmlzdGlhbiBTY2hs
YWVnZXIsIFJhbGYgSGVyYnJpY2gKVXN0LUlEOiBERSAyODkgMjM3IDg3OQpFaW5nZXRyYWdlbiBh
bSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyBIUkIgMTQ5MTczIEIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
