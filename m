Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F21E2581
	for <lists+xen-devel@lfdr.de>; Tue, 26 May 2020 17:31:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdbXV-0005xr-TV; Tue, 26 May 2020 15:30:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdbXU-0005xm-VR
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 15:30:48 +0000
X-Inumbo-ID: df2fb900-9f65-11ea-8993-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df2fb900-9f65-11ea-8993-bc764e2007e4;
 Tue, 26 May 2020 15:30:47 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WPOi4qXKf/pfHPv9Ze4jVAH3PwSLSf2+5uL4bYenxgN0O/x6oiwBKbFwY7HXil2GPaWSdwRn33
 fxD0TWPbcOXVgJtxgnb4JW8aBy2YZ7zjevlhRs+EGuxzBXybIFS23NtQhSWY4vAYTdnHiPZ9xa
 QfRJ54/uUH+w8Fe9eu7hoJCbXDDF9RWXENtLNGOXpN4TaDiu2SEPydpk+jm35nK3KT9l7Cld8w
 wY4un+TBpy+adY942kApJ1Tqv+HhIecxzIlyS2CLTK/dCzI1BDChXupZ9JRY9PClYWbBVo1ZTO
 Jys=
X-SBRS: 2.7
X-MesageID: 19202148
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,437,1583211600"; d="scan'208";a="19202148"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH 5/5] gitignore: Ignore golang package directory
Thread-Topic: [PATCH 5/5] gitignore: Ignore golang package directory
Thread-Index: AQHWMFPdiIMBJ2MNy0CkFZ0ooWSGmqi6SAuAgAAbAoA=
Date: Tue, 26 May 2020 15:30:43 +0000
Message-ID: <A525D330-BCF9-4998-BEC5-425BA6C26CCF@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
 <20200522161240.3748320-6-george.dunlap@citrix.com>
 <24269.8059.28506.353748@mariner.uk.xensource.com>
In-Reply-To: <24269.8059.28506.353748@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7C7329DB0A56D429ED95CC69AAD5C83@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDI2LCAyMDIwLCBhdCAyOjU0IFBNLCBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIltQQVRD
SCA1LzVdIGdpdGlnbm9yZTogSWdub3JlIGdvbGFuZyBwYWNrYWdlIGRpcmVjdG9yeSIpOg0KPj4g
U2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPg0K
PiANCj4gSSBoYXZlIHRvIHNheSB0aGF0IGZpbmRpbmcgYSBkaXJlY3Rvcnkgc3JjLyBpbiBnaXRp
Z25vcmUgaXMgdmVyeQ0KPiBzdGFydGxpbmcuDQo+IA0KPiBUaGlzIGRpcmVjdG9yeSBzcmMvIGNv
bnRhaW5zIG9ubHkgb3V0cHV0IGZpbGVzID8NCg0KV2l0aCBnb2xhbmcsIHlvdSBkb27igJl0IHJl
YWxseSBkaXN0cmlidXRlIHBhY2thZ2UgYmluYXJpZXM7IHlvdSBvbmx5IGRpc3RyaWJ1dGUgc291
cmNlIGZpbGVzLg0KDQpIb3dldmVyLCB3ZSBkb27igJl0IHdhbnQgdG8gd2FpdCB1bnRpbCBzb21l
b25lIHRyaWVzIHRvIGNsb25lIHRoZSBwYWNrYWdlIHRvIHNlZSBpZiB3ZeKAmXZlIGJyb2tlbiB0
aGUgYnVpbGQ7IHNvIHRoZSBjdXJyZW50IG1ha2VmaWxlIGRvZXMgYSDigJxidWlsZCB0ZXN04oCd
IG9mIHRoZSBwYWNrYWdlIGZpbGVzLg0KDQpCZWZvcmUgZ29sYW5n4oCZcyDigJxtb2R1bGVz4oCd
IGZlYXR1cmUsIHRoZSBvbmx5IHdheSB0byBkbyB0aGlzIHdhcyB0byBoYXZlIHRoZSBjb2RlIHRv
IGJ1aWxkIGluc2lkZSAkR09QQVRIL3NyYy8kUEFDS0FHRU5BTUUuICBXZSBjYW4gc2V0IEdPUEFU
SCBidXQgd2UgY2Fu4oCZdCBjaGFuZ2UgdGhlIOKAnHNyY+KAnSBjb21wb25lbnQgb2YgdGhhdC4g
IFNvIHdlIHVzZWQgdG8gc2V0IEdPUEFUSCB0byAkWEVOUk9PVC90b29scy9nb2xhbmcsIHB1dCB0
aGUgZmlsZXMgaW4gJFhFTlJPT1QvdG9vbHMvZ29sYW5nL3NyYy8kUEFDS0FHRU5BTUUsIGFuZCAN
Cg0KV2l0aCB0aGUg4oCcbW9kdWxlc+KAnSBmZWF0dXJlLCBjb2RlIGNhbiBiZSBidWlsdCBhbnl3
aGVyZTsgdGhlIGJ1aWxkIGF0IHRoZSBtb21lbnQgZG9lc27igJl0IHJlcXVpcmUgR09QQVRILg0K
DQpJZiB3ZeKAmXJlIHdpbGxpbmcgdG8gbGltaXQgb3Vyc2VsdmVzIHRvIHVzaW5nIHZlcnNpb25z
IG9mIGdvbGFuZyB3aGljaCBzdXBwb3J0IG1vZHVsZXMgYnkgZGVmYXVsdCAoMS4xMispLCB0aGVu
IHdlIGNhbiBwcm9iYWJseSBnZXQgcmlkIG9mIHRoaXMgYml0IGluc3RlYWQuICAoQW5kIGlmIHdl
IGRvIHdhbnQgdG8gc3VwcG9ydCBvbGRlciB2ZXJzaW9ucywgd2Ugc2hvdWxkIHJlYWxseSBhZGQg
c29tZSBjb2RlIGluIHRoZSBjb25maWd1cmUgc2NyaXB0IHRvIGRldGVybWluZSB3aGV0aGVyIHRv
IGJ1aWxkIHdpdGggbW9kdWxlcyBvciBHT1BBVEguKQ0KDQpOaWNrLCBhbnkgb3BpbmlvbnM/DQoN
Cj4gSXMgdGhlcmUgbm90IGEgcmlzayB0aGF0IGh1bWFucyB3aWxsIHRyeSB0byBlZGl0IGl0ID8N
Cg0KSSBzdXBwb3NlIHNvbWVvbmUgbWlnaHQuICBJZiB3ZSBkZWNpZGUgd2Ugd2FudCB0byBzdXBw
b3J0IG9sZGVyIHZlcnNpb25zIG9mIGdvLCB3ZSBwcm9iYWJseSB3YW50IHRvIGZpZ3VyZSBzb21l
dGhpbmcgb3V0IHRoZXJlLiAgT3B0aW9uczoNCg0KMS4gQ29weSB0aGUgZmlsZXMgdG8gYSB0ZW1w
IGRpcmVjdG9yeSBpbnN0ZWFkLiAgVGhpcyBpcyBjb21wbGljYXRlZCBiZWNhdXNlIHdlIGhhdmUg
dG8gZmluZCBhIGdvb2QgdGVtcCBkaXJlY3RvcnksIGFuZCB3ZeKAmWQgaGF2ZSB0byBjb3B5IHRo
ZW0gZXZlcnkgdGltZSwgc2xvd2luZyBkb3duIHRoZSBpbmNyZW1lbnRhbCBidWlsZCAodGhvdWdo
IG5vdCB0aGF0IG11Y2gpLg0KDQoyLiBQdXQgYSBmaWxlIGluIHRoZSBnZW5lcmF0ZWQgZGlyZWN0
b3J5IGxpa2Ug4oCcR0VORVJBVEVEX0RPX05PVF9FRElU4oCdLg0KDQozLiBQdXQgdGhlbSBpbiB0
b29scy9nb2xhbmcvR0VORVJBVEVEX0RPX05PVF9FRElUL3NyYyBpbnN0ZWFkLg0KDQogLUdlb3Jn
ZQ==

