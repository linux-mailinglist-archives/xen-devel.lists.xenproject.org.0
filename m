Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4860454EA6
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 14:17:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfkMK-0007PS-37; Tue, 25 Jun 2019 12:15:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HSsO=UY=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hfkMJ-0007PN-6s
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 12:15:35 +0000
X-Inumbo-ID: ed4d5eba-9742-11e9-b69a-37a6450d2052
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed4d5eba-9742-11e9-b69a-37a6450d2052;
 Tue, 25 Jun 2019 12:15:32 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jzMjGp2oOSgAYukMJEFmdv21qoN8fFsfwHa7nM+kaQM9tO8q+RNa21Kl63Q/Sk1vv2uhlQUJYR
 HcyDK3oRFs5ADxF1YcIvF40D/a1cxGoZllENMfHlkupDs7Vop/Szf+A9Sgj0NGvSh6X002odWr
 RJ3N7GUbFvFBh7EAKUxRdgxxjBLy6si8VHadIIksGKwpWU7RDLcjDdZQqDtN9b9D3SFKURa6h8
 hmf4EO+E0rhlTC39PhxiAFJnahM2d8B6Ko4hMg/yo20HyxbrQuNJbrrGINgQU9jrzoT+8QInlQ
 60A=
X-SBRS: 2.7
X-MesageID: 2184581
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,415,1557201600"; 
   d="scan'208";a="2184581"
From: Lars Kurth <lars.kurth@citrix.com>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>
Thread-Topic: Migrating key developer docs to xen.git sphinx docs and
 refreshing them in the process
Thread-Index: AQHVKogYFsqm61IG8EyIbkU2yX65b6aq95aAgAAV6wCAABEmAIAADMIAgAAwgoCAAJdFAIAARlSA
Date: Tue, 25 Jun 2019 12:15:28 +0000
Message-ID: <BB14443D-9037-4D24-BB69-F94849799AAB@citrix.com>
References: <B591280C-E140-4A3B-AEC0-E86E99525F0C@citrix.com>
 <alpine.DEB.2.21.1906241059191.2468@sstabellini-ThinkPad-T480s>
 <88dee4d2-d7cb-f342-118f-97c37f43f6ff@arm.com>
 <alpine.DEB.2.21.1906241317280.2468@sstabellini-ThinkPad-T480s>
 <20d7c8ce-a149-52c5-ba44-0ff5d8e63419@arm.com>
 <alpine.DEB.2.21.1906241430320.2468@sstabellini-ThinkPad-T480s>
 <90c2cbd6-2b00-03cc-55fd-cbc8ac80cde9@arm.com>
In-Reply-To: <90c2cbd6-2b00-03cc-55fd-cbc8ac80cde9@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <1B01D1CF9A0B3B4398F3D057892C6E21@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Migrating key developer docs to xen.git sphinx docs
 and refreshing them in the process
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI1LzA2LzIwMTksIDEwOjAzLCAiSnVsaWVuIEdyYWxsIiA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOg0KDQogICAgPj4+IFRoZSBwb2ludCBoZXJlIGlzIHRoYXQgd2UgY2Fu
IGJlIGZsZXhpYmxlIGFuZCBjcmVhdGl2ZSBhYm91dCB0aGUgd2F5IHRvDQogICAgPj4+IG1haW50
YWluIHRoZSBkb2NzIG9uIHhlbi5naXQuIEJ1dCBhcyBhIHRlY2hub2xvZ3kgaXMgY2VydGFpbmx5
IGJldHRlcg0KICAgID4+PiB0aGFuIHRoZSB3aWtpOiB3ZSBkb24ndCBoYXZlIHRvIGtlZXAgdGhl
bSBhbGwgdXAtdG8tZGF0ZSB3aXRoIHRoZSBjb2RlLA0KICAgID4+PiBidXQgYXQgbGVhc3QgdGhp
cyB3YXkgd2UgaGF2ZSBhIGNoYW5jZSAoaWYgd2Ugd2FudCB0bykuIElmIHdlIGxlYXZlIHRoZW0N
CiAgICA+Pj4gb24gdGhlIHdpa2ksIHRoZXJlIGlzIG5vIGNoYW5jZS4NCiAgICA+Pg0KICAgID4+
IEkgY2FuJ3Qgc2VlIGhvdyB4ZW4uZ2l0IGlzIGdvaW5nIHRvIGJlIGJldHRlciBpZiAid2UgZG9u
J3QgaGF2ZSB0byBrZWVwIHRoZW0NCiAgICA+PiBhbGwgdXAtdG8tZGF0ZSIuDQogICAgPiANCiAg
ICA+IFRoYXQncyBiZWNhdXNlIGEgY29udHJpYnV0b3IgY291bGQgYWRkIGEgcGF0Y2ggYXQgdGhl
IGVuZCBvZiBhIHNlcmllcyB0bw0KICAgID4gdXBkYXRlIG9uZSBvZiB0aGUgZG9jcywgZXZlbiBp
ZiB0aGUgZG9jIGluIHF1ZXN0aW9uIGNvbWVzIHdpdGggbm8NCiAgICA+IHByb21pc2VzIG9mIGJl
aW5nIHVwLXRvLWRhdGUuDQogICAgDQogICAgSSB0aGluayB0aGlzIGlzIGdvaW5nIHRoZSB3cm9u
ZyBkaXJlY3Rpb24uIFRoZSBnb2FsIG9mIHVzaW5nIHhlbi5naXQgaXMgdG8gdHJ5IA0KICAgIHRv
IGtlZXAgdGhlIGRvY3VtZW50YXRpb24gdXAtdG8tZGF0ZS4NCiAgICANCkkgYWdyZWUgd2l0aCBK
dWxpZW4gYW5kIHRoaXMgd2FzIGFsc28gbm90IG15IGludGVudGlvbi4gVGhlIHJlYXNvbiB3aHkg
SSBicm91Z2h0IHRoaXMgdXAgbm93IGlzIHRoYXQgdGhlIGluLXRyZWUgZG9jcyBhcmUgcHJldHR5
IG11Y2ggYSBtZXNzIHRvZGF5IGFuZCBhcmUgc3RhbGUgaW4gbWFueSB3YXlzLiBBbmQgdGhleSBs
b29rIFRFUlJJQkxFIGFuZCBhcmUgbm90IGVhc2lseSBzZWFyY2hhYmxlLiBIb3dldmVyLCBBbmR5
J3MgbGF0ZXN0IHNldCBvZiBwYXRjaGVzIHByb3ZpZGUgYW4gb3Bwb3J0dW5pdHkgdG8gY29uc29s
aWRhdGUgc29tZSBvZiB0aGUgaW4tdHJlZSBkb2NzIGluIGEgbmljZWx5IHJlbmRlcmVkIGFuZCBz
ZWFyY2hhYmxlIGZvcm1hdC4NCg0KSSBoYXZlIGJlZW4gZm9jdXNzaW5nIG9uIHByb2Nlc3MgcmVs
YXRlZCBhbmQga2V5IGRldmVsb3BlciByZWxhdGVkIGRvY3MsIGJlY2F1c2Ugd2hvIG1haW50YWlu
cyB0aGVtIGlzIG5vdCBhY3R1YWxseSBhbiBpc3N1ZSBpbiB0aGVvcnkuIEV2ZXJ5b25lIHJlYWxs
eSBvdWdodCB0byBjYXJlLCBiZWNhdXNlIGV2ZXJ5b25lIGlzIGltcGFjdGVkIGJ5IHRoZXNlLiAN
Cg0KV2hhdCBoYXBwZW5zIHRvZGF5IGZvciBtYW55IG9mIHRoZXNlIHR5cGUgb2YgZG9jcyBhbmQv
b3IgcHJvY2Vzc2VzIGlzIHRoYXQ6DQphKSBXZSBoYXZlIGRpc2N1c3Npb24gYWJvdXQgYSBwcm9j
ZXNzIC8gd29ya2luZyBwcmFjdGljZSBvbiB0aGUgbGlzdCB1bnRpbCB3ZSBjb21lIHRvIGEgY29u
Y2x1c2lvbg0KYikgVGhlbiB3ZSB0YWtlIGl0IGFuZCBjb3B5IGl0IHRvIHRoZSB3aWtpDQpXaHkg
bm90IG1lcmdlIHRoaXMgaW50byBvbmUgYWN0aXZpdHkNCg0KQm90aCBvZiB5b3UgYXJlIGludGVy
ZXN0ZWQgaW4gQXJtIGRvY3MsIGJ1dCB0aGlzIGlzIHNvbWV0aGluZyBJIHdpbGwgbGV0IHlvdSBm
aWdodCBvdXQuIA0KTWF5YmUgeW91IHdhbnQgdG8gY2hhdCBhYm91dCB0aGlzIHNvbWUgbW9yZSBh
dCB0aGUgc3VtbWl0DQoNCiAgICA+PiBCdXQgbXkgcG9pbnQgaGVyZSBpcyBtb3N0IG9mIHRoZSBi
b2FyZCBzaG91bGQgYmUgdHJpdmlhbC4gVGhlIG1vc3Qgb2YgdGhlDQogICAgPj4gbm9uLXRyaXZp
YWwgc2V0dXAgcmVxdWlyZSBub24tdXBzdHJlYW0gcGF0Y2guIFdoaWxlIEkgYW0gaGFwcHkgdG8g
c2VlIHRoYXQgb24NCiAgICA+PiB0aGUgd2lraSwgSSB0aGluayB4ZW4uZ2l0IHNob3VsZCBub3Qg
cHJvbW90ZSBzdWNoIGNvbmZpZ3VyYXRpb24gYXQgYWxsLiBXZSBhcmUNCiAgICA+PiB3b3JraW5n
IHVwc3RyZWFtLCBub3Qgd2l0aCB1bmtub3duL3VudHJ1c3RlZCBzdGFjay4NCiAgICA+Pg0KICAg
ID4+IEZvciBzb21lIHdvcmtpbmcgZnVsbHkgdXBzdHJlYW0sIEkgZG9uJ3QgdGhpbmsgeGVuLmdp
dCBzaG91bGQgcHJvbW90ZSBhbnkNCiAgICA+PiBkaXN0cm9zL3ZlcnNpb25zIG9mIHRoZSBrZXJu
ZWwuIEhvd2V2ZXIsIHRoaXMgaXMgb2sgb24gdGhlIHdpa2kuDQogICAgPiANCiAgICA+IEkgd291
bGQgbGlrZSB0byBzZWUgdGhlIHdpa2kgZGlzYXBwZWFyIGNvbXBsZXRlbHkgaW4gdGhlIGxvbmcg
dGVybS4gQXMNCiAgICA+IHdlIGFyZSBtb3ZpbmcgbW9yZSBjb250ZW50IHRvIHhlbi5naXQsIGl0
IGlzIG5vdCBhIGdvb2QgaWRlYSB0byBoYXZlIHR3bw0KICAgID4gcGxhY2VzIHdoZXJlIHdlIGtl
ZXAgaW5mb3JtYXRpb24sIGZvciBzaW1pbGFyIHJlYXNvbnMgd2h5IHlvdSBzdWdnZXN0ZWQNCiAg
ICA+IHRvIHVzZSBpbi1jb2RlIGNvbW1lbnRzIGluc3RlYWQgb2YgZG9jcyB0byBkb2N1bWVudCBp
bnRlcmZhY2VzLiBJdA0KICAgID4ganVzdCB0YWtlcyBtb3JlIGVmZm9ydHMgdG8gbWFpbnRhaW4g
aW5mb3JtYXRpb24gaW4gdHdvIHBsYWNlcyBhbmQgdGhleQ0KICAgID4gdGVuZCB0byBnZXQgb3V0
IG9mIHN5bmMgd2l0aCBlYWNoIG90aGVycy4NCiAgICA+IA0KICAgID4gSWYgd2UgbWFrZSB0aGUg
d2lraSBnbyBhd2F5IChJIGhvcGUgc28pLCB3ZSdsbCBuZWVkIGEgcGxhY2UgdG8gc3RvcmUgdGhl
DQogICAgPiBBcm0gYm9hcmQtc3BlY2lmaWMgZG9jdW1lbnRzLCBhbmQgb3RoZXIgdHV0b3JpYWxz
Lg0KICAgIA0KICAgIFJlbW92aW5nIHRoZSB3aWtpIGlzIGFuIGhvbm9yYWJsZSBnb2FsLCBob3dl
dmVyIEkgZG9uJ3QgdGhpbmsgYWxsIHRoZSB3aWtpIGlzIA0KICAgIHN1aXRhYmxlIGZvciB4ZW4u
Z2l0LiBUaGUgQXJtIGJvYXJkLXNwZWNpZmljIGRvY3VtZW50cyBpcyBhbiBleGFtcGxlLg0KDQpS
ZW1vdmluZyB0aGUgd2lraSB3YXMgbm90IG15IGFpbS4gVGhlIHdpa2kgaXMgdXNlZnVsIGluIHNv
bWUgY2FzZXMsIGJ1dCBub3QgaW4gb3RoZXJzLg0KDQpMYXJzDQogICAgDQogICAgDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
