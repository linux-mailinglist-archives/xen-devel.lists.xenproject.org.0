Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5571E7BAF
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 13:27:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedA3-0007XY-7m; Fri, 29 May 2020 11:26:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K2ub=7L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jedA1-0007XT-Ht
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:26:49 +0000
X-Inumbo-ID: 48ff5ee0-a19f-11ea-9947-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 48ff5ee0-a19f-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 11:26:48 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 6grXn+OLhyh93kdoxBZnR91t4WZgnmX5+ICqZyoFk7YiiaFGEyvFonYrYct8qI6FERMJAefL0K
 Jnvk+LJMhlT0Ai7FtoNovy7DVAHiq2elTwjwmg2FXNmnHVta4R5hTGjycK2+nmkZ8W3PH42p4Z
 N/Ao0L3xv9QBaMxb6jtXg4Tj4qOoc3b1iFKnRPxms1XYu8PH+Njm8j/S0IFMgeE3NRh3WfLv2q
 ARHEpXgpEkrBIou5vcvGfokc2nB2fcflNT94yDV7WuuHeRQvNLH7ixkJ/glOwtCTaPmcqJeLNR
 QtM=
X-SBRS: 2.7
X-MesageID: 19001746
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,448,1583211600"; d="scan'208";a="19001746"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Topic: Xen XSM/FLASK policy, grub defaults, etc.
Thread-Index: AQHWND0/xSJFUOR5YU28XikgbPuX46i7+DWAgALLwwCAAANFAIAABtKA
Date: Fri, 29 May 2020 11:26:45 +0000
Message-ID: <96F32637-E410-4EC8-937A-CFC8BE724352@citrix.com>
References: <24270.35349.838484.116865@mariner.uk.xensource.com>
 <0D83AAA6-A205-4256-8A38-CC8122AC063D@citrix.com>
 <24272.59646.746545.343358@mariner.uk.xensource.com>
 <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
In-Reply-To: <4a8e7cf2-8f63-d4d2-e051-9484a5b8c8ed@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <28F1714F0E393C40ABF7D25F43EB4578@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, "cjwatson@debian.org" <cjwatson@debian.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI5LCAyMDIwLCBhdCAxMjowMiBQTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI5LjA1LjIwMjAgMTI6NTAsIElhbiBKYWNrc29u
IHdyb3RlOg0KPj4gR2VvcmdlIER1bmxhcCB3cml0ZXMgKCJSZTogWGVuIFhTTS9GTEFTSyBwb2xp
Y3ksIGdydWIgZGVmYXVsdHMsIGV0Yy4iKToNCj4+Pj4gT24gTWF5IDI3LCAyMDIwLCBhdCA0OjQx
IFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+IDMu
IEZhaWxpbmcgdGhhdCwgWGVuIHNob3VsZCBwcm92aWRlIHNvbWUgb3RoZXIgbWVjaGFuaXNtIHdo
aWNoIHdvdWxkDQo+Pj4+IGVuYWJsZSBzb21ldGhpbmcgbGlrZSB1cGRhdGUtZ3J1YiB0byBkZXRl
cm1pbmUgd2hldGhlciBhIHBhcnRpY3VsYXINCj4+Pj4gaHlwZXJ2aXNvciBjYW4gc2Vuc2libHkg
YmUgcnVuIHdpdGggYSBwb2xpY3kgZmlsZSBhbmQgZmxhc2s9ZW5mb3JjaW5nLg0KPj4+IA0KPj4+
IFNvIHlvdSB3YW50IHVwZGF0ZS1ncnViIHRvIGNoZWNrIHdoZXRoZXIgKnRoZSBYZW4gYmluYXJ5
IGl04oCZcyBjcmVhdGluZyBlbnRyaWVzIGZvciogaGFzIEZMQVNLIGVuYWJsZWQuICBXZSBnZW5l
cmFsbHkgaW5jbHVkZSB0aGUgWGVuIGNvbmZpZyB1c2VkIHRvIGJ1aWxkIHRoZSBoeXBlcnZpc29y
IOKAlCBjb3VsZCB3ZSBoYXZlIGl0IGNoZWNrIGZvciBDT05GSUdfWFNNX0ZMQVNLPw0KPj4gDQo+
PiBUaGF0IHdvdWxkIGJlIGEgcG9zc2liaWxpdHkuICBJbmNsdWRpbmcga2VybmVsIGNvbmZpZ3Mg
aGFzIGdvbmUgb3V0IG9mDQo+PiBmYXNoaW9uIGJ1dCBJIHRoaW5rIG1vc3QgZGlzdHJvcyBzaGlw
IHRoZW0uDQo+PiANCj4+IEFyZSB3ZSBjb25maWRlbnQgdGhhdCB0aGlzIGNvbmZpZyBuYW1lIHdp
bGwgcmVtYWluIHN0YWJsZSA/DQo+IA0KPiBXZWxsLCBpZiBpdCdzIHRvIGJlIHVzZWQgbGlrZSB0
aGlzLCB0aGVuIHdlJ2xsIGhhdmUgdG8ga2VlcCBpdA0KPiBzdGFibGUgaWYgYXQgYWxsIHBvc3Np
YmxlLiBCdXQgdGhhdCdzIHRoZSByZWFzb24gd2h5IEkgZGlzbGlrZQ0KPiB0aGUgLmNvbmZpZyBn
cmVwLWluZyBhcHByb2FjaCAobm90IGp1c3QgZm9yIFhlbiwgYWxzbyBmb3INCj4gTGludXgpLiBJ
dCB3b3VsZCBpbW8gYmUgYmV0dGVyIGlmIHRoZSBiaW5hcnkgaW5jbHVkZWQgc29tZXRoaW5nDQo+
IHRoYXQgY2FuIGJlIHF1ZXJpZWQuIFN1Y2ggYSAic29tZXRoaW5nIiBpcyB0aGVuIG11Y2ggbW9y
ZQ0KPiBsb2dpY2FsIHRvIGtlZXAgc3RhYmxlLCBpbW8uIFRoaXMgInNvbWV0aGluZyIgY291bGQg
YmUgYW4gRUxGDQo+IG5vdGUsIGZvciBleGFtcGxlIChhc3N1bWluZyBhIHNpbWlsYXIgcHJvYmxl
bSB0byB0aGUgb25lIGhlcmUNCj4gZG9lc24ndCBleGlzdCBmb3IgeGVuLmVmaSwgb3IgZWxzZSB3
ZSdkIG5lZWQgdG8gZmluZCBhIHNvbHV0aW9uDQo+IHRoZXJlLCB0b28pLg0KDQpJIHRoaW5rIGFu
IGVsZiBub3RlIG9uIHRoZSBiaW5hcnkgd291bGQgYmUgbmljZTsgYnV0IGl0IHdvbuKAmXQgaGVs
cCB1bnRpbCBhbGwgdGhlIGRpc3Ryb3MgcGljayB1cCBYZW4gNC4xNS4NCg0KV2hpY2ggaXNu4oCZ
dCB0byBzYXkgd2Ugc2hvdWxkbuKAmXQgZG8gaXQ7IGJ1dCBpdCBtaWdodCBiZSBuaWNlIHRvIGFs
c28gaGF2ZSBhbiBpbnRlcm1lZGlhdGUgc29sdXRpb24gdGhhdCB3b3JrcyByaWdodCBub3csIGV2
ZW4gaWYgaXTigJlzIG5vdCBvcHRpbWFsLg0KDQogLUdlb3JnZQ==

