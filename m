Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8691E7B14
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jecij-0002nF-AM; Fri, 29 May 2020 10:58:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K2ub=7L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jecih-0002n9-Cd
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:58:35 +0000
X-Inumbo-ID: 56f79746-a19b-11ea-8993-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56f79746-a19b-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 10:58:34 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 1NFytPxIw25jPXcWDGl2CV7si/0dB4EPPX9WJk1Eu9998TMB8wpwiwKpd6EJVAut/MhZjt5si1
 WhgTrUt+JD9OQ6idUX4Vxe67WhXY1DYODeEQWvIUky26OGLS/y0uaVxBbKq7kNodqKaJIZDjIT
 b7/jld0cB6ydLPWKAYSId4UVNeW3oMBbTLw/GKQ2hlwh64dY5LfNz+WpZiC7L1qXo4X192skRB
 XCLtPKer+ffonrDdy0j+QPGNeKgiLMGTBPEeukBXVv43aJWyvFfcdn85SG6oIgw5CEM2kXhGFU
 vIU=
X-SBRS: 2.7
X-MesageID: 18766074
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,448,1583211600"; d="scan'208";a="18766074"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Topic: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Index: AQHWND0/xSJFUOR5YU28XikgbPuX46i7+DWAgALLwwCAAAIzAA==
Date: Fri, 29 May 2020 10:58:30 +0000
Message-ID: <A4F2A1E4-CED3-4390-9CE8-51912A08F511@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
In-Reply-To: <24272.59646.746545.343358@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <74EE9DB3CAA28D45B86914045689FEA0@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "cjwatson@debian.org" <cjwatson@debian.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI5LCAyMDIwLCBhdCAxMTo1MCBBTSwgSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gR2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTog
WGVuIFhTTS9GTEFTSyBwb2xpY3ksIGdydWIgZGVmYXVsdHMsIGV0Yy4iKToNCj4+PiBPbiBNYXkg
MjcsIDIwMjAsIGF0IDQ6NDEgUE0sIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29t
PiB3cm90ZToNCj4+PiAzLiBGYWlsaW5nIHRoYXQsIFhlbiBzaG91bGQgcHJvdmlkZSBzb21lIG90
aGVyIG1lY2hhbmlzbSB3aGljaCB3b3VsZA0KPj4+IGVuYWJsZSBzb21ldGhpbmcgbGlrZSB1cGRh
dGUtZ3J1YiB0byBkZXRlcm1pbmUgd2hldGhlciBhIHBhcnRpY3VsYXINCj4+PiBoeXBlcnZpc29y
IGNhbiBzZW5zaWJseSBiZSBydW4gd2l0aCBhIHBvbGljeSBmaWxlIGFuZCBmbGFzaz1lbmZvcmNp
bmcuDQo+PiANCj4+IFNvIHlvdSB3YW50IHVwZGF0ZS1ncnViIHRvIGNoZWNrIHdoZXRoZXIgKnRo
ZSBYZW4gYmluYXJ5IGl04oCZcyBjcmVhdGluZyBlbnRyaWVzIGZvciogaGFzIEZMQVNLIGVuYWJs
ZWQuICBXZSBnZW5lcmFsbHkgaW5jbHVkZSB0aGUgWGVuIGNvbmZpZyB1c2VkIHRvIGJ1aWxkIHRo
ZSBoeXBlcnZpc29yIOKAlCBjb3VsZCB3ZSBoYXZlIGl0IGNoZWNrIGZvciBDT05GSUdfWFNNX0ZM
QVNLPw0KPiANCj4gVGhhdCB3b3VsZCBiZSBhIHBvc3NpYmlsaXR5LiAgSW5jbHVkaW5nIGtlcm5l
bCBjb25maWdzIGhhcyBnb25lIG91dCBvZg0KPiBmYXNoaW9uIGJ1dCBJIHRoaW5rIG1vc3QgZGlz
dHJvcyBzaGlwIHRoZW0uDQo+IA0KPiBBcmUgd2UgY29uZmlkZW50IHRoYXQgdGhpcyBjb25maWcg
bmFtZSB3aWxsIHJlbWFpbiBzdGFibGUgPw0KDQpCZWZvcmUgdGFraW5nIHRoaXMgYXBwcm9hY2gs
IHdlIHNob3VsZCBwcm9iYWJseSBhZ3JlZSB0byBkZWNsYXJlIGl0IHN0YWJsZSwgYW5kIHdyaXRl
IGEgY29tbWVudCB0byB0aGF0IGVmZmVjdCBpbiB0aGUgS2NvbmZpZyBmaWxlcy4NCg0KPiANCj4g
QW5kIEkgZ3Vlc3MgaWYgdGhlIC5jb25maWcgY2FuJ3QgYmUgZm91bmQgdGhlbiB0aGUgWFNNIGJv
b3QgZW50cnkNCj4gc2hvdWxkIGJlIGluY2x1ZGVkID8NCg0KSXQgbG9va3MgbGlrZSBhdCB0aGUg
bW9tZW50IGV4cGVyaW1lbnRhbCBjb25maWcgZW50cmllcyBhcmUg4oCcdW5wZXJzb25z4oCdIHdp
dGhvdXQgQ09ORklHX0VYUEVSSU1FTlRBTD15OyBhdCBsZWFzdCwgYHJtIC5jb25maWcgJiYgbWFr
ZSBkZWZjb25maWcgJiYgZ3JlcCAtaSBmbGFza2AgZG9lc27igJl0IHR1cm4gdXAgYW55dGhpbmcg
Zm9yIG1lLg0KDQogLUdlb3JnZQ==

