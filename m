Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1A7DAE61
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2019 15:30:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iL5m0-0007Kg-3Q; Thu, 17 Oct 2019 13:25:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HL6h=YK=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iL5ly-0007Kb-D6
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2019 13:24:58 +0000
X-Inumbo-ID: 7d02f400-f0e1-11e9-93d1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d02f400-f0e1-11e9-93d1-12813bfff9fa;
 Thu, 17 Oct 2019 13:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571318687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uZ3wj9JSq/36YW8Ij7AUmoAZYMJV/LZe0wDXOXhccJ4=;
 b=UGh+q80MOH6iuSPdvsnW5izYLw8CMxHszWM42WGU7HudqklC6h3FM3/M
 LxayrAIII3tHax44dGpjEivRoJBMFNK9BCpI3Lx9SLUTCVUiervWeHSkk
 YBaxwX2wLkRIjewsImmKtasqgYNaZVeEfb7NNpxAshHeTl0p+ZUrjLUm/ 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
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
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NfYsuSxYoBcnB9wanfFjMuD3RxLg3cCKHKlpMctwhxFfrE+lO4EzqrwD4jfYv6g0nH+wOrScRL
 5xxRGc95w5tvz+obLexexWXj/G7d4O1XQsRN9q6L9xcval+sl6+sN1fza9GUtEEUizirN2k4v8
 LFXsskCo+129BP3MugVCMqfo8P8YSv/lFE3vjHEtfpdSdu8eXJ0pL3wOLwjgFGMdqBLSmFpm8y
 RTRvmqBsStCjwScS0tBJxsXeKlGbZbTg4bAvpSPqCrUCevkNcZq6GW5zKA2/BTyaHc6zerqufu
 BCw=
X-SBRS: 2.7
X-MesageID: 7345294
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,307,1566878400"; 
   d="scan'208";a="7345294"
From: Lars Kurth <lars.kurth@citrix.com>
To: Rich Persaud <persaur@gmail.com>, Lars Kurth <lars.kurth.xen@gmail.com>
Thread-Topic: [Xen-devel] [RFC] Documentation formats, licenses and file
 system structure
Thread-Index: AQHVf2cRdQE5+PIufEarnRjQ6zCVf6dT+XmAgAAogYCAAGMNAIAAtDWAgAWecoCAAK9DAIAB1/uAgAFt+gA=
Date: Thu, 17 Oct 2019 13:24:42 +0000
Message-ID: <5CFB62F9-89FA-445F-89EA-17D5F71E78AB@citrix.com>
References: <AC0692FB-99DB-40A5-BF7E-258A038679EC@xenproject.org>
 <26E88F34-5956-4491-A1A6-9F6FCF87C54E@gmail.com>
In-Reply-To: <26E88F34-5956-4491-A1A6-9F6FCF87C54E@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <F5BA8F2834421F46952318AF0B4BBECD@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC] Documentation formats,
 licenses and file system structure
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Committers <committers@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDE2LzEwLzIwMTksIDE3OjM1LCAiUmljaCBQZXJzYXVkIiA8cGVyc2F1ckBnbWFp
bC5jb20+IHdyb3RlOg0KDQogICAgPiBPbiBPY3QgMTUsIDIwMTksIGF0IDA4OjI3LCBMYXJzIEt1
cnRoIDxsYXJzLmt1cnRoLnhlbkBnbWFpbC5jb20+IHdyb3RlOg0KLi4uDQogICAgPiANCiAgICA+
IE15IHBvaW50IHJlYWxseSB3YXMgaXMgdGhhdCBkdWUgdG8gc3RvcmluZyB0aGUgZmlsZXMgaW4g
Z2l0LCB3ZSBlc3NlbnRpYWxseSBkbyBOT1QgdG9kYXkgZG8gdGhpcy4NCiAgICA+IFNvIHdlIHdv
dWxkIG5lZWQgdG8gdGFrZSBleHRyYSBhY3Rpb246IGUuZy4gbWFudWFsbHkgb3IgdGhyb3VnaCB0
b29saW5nDQogICAgPiANCiAgICA+Pj4gICA0LjI6IFdlIGNvdWxkIHJlcXVpcmUgaW5kaXZpZHVh
bCBhdXRob3JzIHRvIGJlIGNyZWRpdGVkOiBpbiB0aGF0DQogICAgPj4+ICAgICAgICAgICBjYXNl
IHdlIHByb2JhYmx5IG91Z2h0IHRvIGxlYWQgYnkgZXhhbXBsZSBhbmQgbGlzdCB0aGUgYXV0aG9y
cw0KICAgID4+PiAgICAgICAgICAgaW4gYSBjcmVkaXQvbGljZW5zZSBzZWN0aW9uIGFuZCBleHRy
YWN0IHRoZSBpbmZvcm1hdGlvbiBmcm9tDQogICAgPj4+ICAgICAgICAgICBnaXQgbG9ncyB3aGVu
IHdlIGdlbmVyYXRlIGl0IChhdCBzb21lIHBvaW50IGluIHRoZSBmdXR1cmUpDQogICAgPj4+IDU6
IFlvdSBnaXZlIGFuIGluZGljYXRpb24gd2hldGhlciB5b3UgbWFkZSBjaGFuZ2VzIC4uLiBpbiBw
cmFjdGljZQ0KICAgID4+PiB0aGlzIG1lYW5zIHlvdSBoYXZlIHRvIHN0YXRlIHNpZ25pZmljYW50
IGNoYW5nZXMgbWFkZSB0byB0aGUgd29ya3MNCiAgICA+PiANCiAgICA+PiBUaGlzIGlzIGFsc28g
aGVscGZ1bCBmb3IgcHJvdmVuYW5jZSBvZiBjaGFuZ2VzLCB3aGljaCBpcyByZWxldmFudCBpbiBz
YWZldHktb3JpZW50ZWQgZG9jdW1lbnRhdGlvbi4gIEl0IGNhbiBiZSB1c2VkIHRvIGNsZWFybHkg
ZGVsaW5lYXRlIENDLWxpY2Vuc2VkIGNvbnRlbnQgKHdoaWNoIG1heSBiZSByZXVzZWQgYnkgbWFu
eSBjb21wYW5pZXMpIGZyb20gIkFsbCBSaWdodHMgUmVzZXJ2ZWQiIGNvbW1lcmNpYWwgY29udGVu
dCB0aGF0IG1heSBiZSBhZGRlZCBmb3IgYSBzcGVjaWZpYyBjb21tZXJjaWFsIGF1ZGllbmNlIG9y
IHB1cnBvc2UuDQogICAgPiANCiAgICA+IEkgYWdyZWUNCiAgICA+IA0KICAgID4gSSB0aGluayB0
aGUgb3V0Y29tZSBvZiB0aGlzIGFuYWx5c2lzIGlzIHJlYWxseSB0aGF0IHRoZSBvbmx5IHNpZ25p
ZmljYW50IGRpZmZlcmVuY2UgYmV0d2VlbiBCU0QgYW5kIENDLUJZIGluIHRoaXMgY29udGV4dCBp
cyB0aGUgICJBbGwgUmlnaHRzIFJlc2VydmVkIiBwb3J0aW9uDQogICAgDQogICAgQWxzbyAtIEJT
RCBpcyBhICJzb2Z0d2FyZSIgbGljZW5zZSB3aGlsZSBDQy1CWSBpcyBhICJjb250ZW50IiBsaWNl
bnNlLCBzbyB0aGV5IGFyZSBub3Qgc3RyaWN0bHkgY29tcGFyYWJsZSwgZXZlbiBpZiB0aGV5IHVz
ZSBzaW1pbGFyIHRlcm1pbm9sb2d5Lg0KDQpUcnVlLCBidXQgYXMgd2UgaGF2ZSBub3RpY2VkIHRo
ZSBib3VuZGFyeSBiZXR3ZWVuIGNvbnRlbnQgYW5kIGluLWNvZGUgZG9jcyBjb250ZW50IGlzIGZ1
enp5Lg0KICAgIA0KICAgID4+IFRoZXJlIGlzIGEgZGlmZmVyZW5jZSBiZXR3ZWVuICJzb2Z0d2Fy
ZSIgd2hpY2ggInJ1bnMgb24gbWFjaGluZXMiIGFuZCAiZG9jdW1lbnRhdGlvbiIgd2hpY2ggInJ1
bnMgb24gaHVtYW5zIi4gIENvbWJpbmVkIHNvZnR3YXJlIChlLmcuIEJTRCBjb2RlIGZyb20gdHdv
IG9yaWdpbnMpIGlzIGV4ZWN1dGVkIGlkZW50aWNhbGx5LCBkZXNwaXRlIG9yaWdpbi4gIEh1bWFu
cyBtYWtlIHZhbHVlIGp1ZGdlbWVudHMgYmFzZWQgb24gdGhlIGF1dGhvci9vcmlnaW4gb2YgY29u
dGVudCwgaGVuY2UgdGhlIGZvY3VzIG9uIGF0dHJpYnV0aW9uLiAgWWVzLCB0aGVyZSBpcyBhIHBy
b3ZlbmFuY2UgZ3JhcGggaW4gZ2l0IChzb2Z0d2FyZS9kYXRhKSwgYnV0IHRoYXQncyBub3QgdHlw
aWNhbGx5IHZpc2libGUgdG8gaHVtYW4gcmVhZGVycywgZXhjZXB0IGFzIGEgZ2VuZXJhdGVkIHJl
cG9ydCwgaS5lLiBkb2N1bWVudGF0aW9uLg0KICAgID4gDQogICAgPiBZZXMgdHJ1ZS4gQnV0IGFs
c28gdHJ1ZSBmb3IgQ0MtQlktNCBzb3VyY2VzIHN0b3JlZCBpbiBnaXQgdW5sZXNzIGV4dHJhIGFj
dGlvbiBpcyB0YWtlbiANCiAgICA+IA0KICAgID4gQnV0IG15IHBvaW50IGlzOiANCiAgICA+ICog
SWYgd2UgdGFrZSBleHRyYSBhY3Rpb24gYXMgZS5nLiBwcm9wb3NlZCBpbiA0LjIgd2UgY2FuIGFw
cGx5IHRoaXMgdW5pZm9ybWx5IHRvIEJTRCBhcyB3ZWxsIGFzIENDLUJZIHBhZ2VzDQogICAgPiAq
IFdlIGNhbiBhZGQgYSBzZWN0aW9uIG9uIHJlLXVzZSBhcyBwcm9wb3NlZCBpbiA0LjIgd2hpY2gg
cmVjb21tZW5kcyBiZXN0IHByYWN0aWNlcyBhcm91bmQgNS4gIA0KICAgID4gKiBXZSBjYW4gaGln
aGxpZ2h0IHNlY3Rpb25zIHRoYXQgYXJlIEJTRCB2cyBDQy1CWSBpbiBzdWNoIGEgc2VjdGlvbiwg
c3VjaCB0aGF0IHNvbWVvbmUgd2hvIGhhcyBpc3N1ZSBjYW4gcmVtb3ZlIHRoZXNlIGVhc2lseQ0K
ICAgID4gDQogICAgPiBJbiBhZGRpdGlvbiB0byB0aGVzZSBwb2ludHM6IG1heWJlIGl0IGlzIHRv
byBpbXByYWN0aWNhbCB0byBjcmVhdGUgQUJJIGRvY3VtZW50YXRpb24gYmFzZWQgb24gQ0MtQlkt
NCAoZ2l2ZW4gdGhhdCBhIGxvdCBvZiB3aGF0IHdlIG5lZWQgaXMgYWxyZWFkeSBpbiBCU0Qgc291
cmNlcykuIA0KICAgID4gV2UgY291bGQganVzdCBjb3B5IHNvbWUgb2YgdGhlIGNvbnRlbnQgaW4g
dGhlIEJTRCBzb3VyY2VzIHRvIG5ldyBDQy1CWS00IHNvdXJjZXMsIGJ1dCBpbiBwcmFjdGljZSBp
dCB3b3VsZCBqdXN0IGJlIGhpZGluZyB0aGUgcG90ZW50aWFsIGxlZ2FsIGlzc3VlcyBiZWhpbmQg
aXQuIA0KICAgID4gU29tZW9uZSBjb3VsZCBjb250ZXN0IHRoZSBjcmVhdGlvbiBhbmQgYXJndWUg
dGhhdCBwb3J0aW9ucyBvZiB0aGUgbm93IENDLUJZLTQgc291cmNlcyBhcmUgaW4gZmFjdCBCU0Q6
IGluIHByYWN0aWNlIHRoaXMgaXMgZXh0cmVtZWx5IHVubGlrZWx5LCBidXQgaXQgaXMgcG9zc2li
bGUuDQogICAgPiANCiAgICA+Pj4gQXMgc3VjaCwgQlNELTIvMy1DbGF1c2UgaW4gb3VyIGNvbnRl
eHQgd29ya3Mgc2ltaWxhcmx5IHRvIENDLUJZLTQNCiAgICA+Pj4gZnJvbSBhIGRvd25zdHJlYW0n
cyBwZXJzcGVjdGl2ZS4gSW4gZmFjdCBDQy1CWS00IGlzIHNvbWV3aGF0IHN0cmljdGVyDQogICAg
Pj4gDQogICAgPj4gSWYgd2UgZG9uJ3Qgd2FudCB0aGUgaW5jZW50aXZlcyBhbmQgcHJvdmVuYW5j
ZSBwcm9wZXJ0aWVzIG9mIENDLUJZLCB0aGVyZSBpcyB0aGUgb3B0aW9uIG9mIENDMCwgd2hpY2gg
aXMgdGhlIGVxdWl2YWxlbnQgb2YgcHVibGljIGRvbWFpbi4gIFRoaXMgd291bGQgZGVsZWdhdGUg
dGhlIHRhc2sgb2Ygc2VwYXJhdGluZyBjb21tZXJjaWFsIHZzIENDIGNvbnRlbnQgdG8gZWFjaCBy
ZWFkZXIsIHdpdGhvdXQgYW55IGxpY2Vuc2UtcmVxdWlyZWQgYXR0cmlidXRpb24gb3Igc2VwYXJh
dGlvbi4NCiAgICA+PiANCiAgICA+PiBTb21lIGJhY2tncm91bmQgb24gbGljZW5zZXMgZGVzaWdu
ZWQgZm9yIGRvY3VtZW50YXRpb24sIHdoaWNoIGhhcyBkaWZmZXJlbnQgbGVnYWwgcmVxdWlyZW1l
bnRzIHRoYW4gc29mdHdhcmU6DQogICAgPj4gDQogICAgPj4gaHR0cHM6Ly93d3cuZHJlYW1zb25n
cy5jb20vSUhFL0lIRS01MC5odG1sDQogICAgPj4gaHR0cHM6Ly9jcmVhdGl2ZWNvbW1vbnMub3Jn
L2ZhcS8jd2hhdC1hcmUtY3JlYXRpdmUtY29tbW9ucy1saWNlbnNlcyAobm90IGZvciBzL3cpDQog
ICAgPiANCiAgICA+IEkgd2lsbCBoYXZlIGEgbG9vay4gQnV0IHRoZSBjb3JlIGlzc3VlIC0gd2hp
Y2ggaXMgd2h5IEkgaGF2ZSBwcm9wb3NlZCB3aGF0IEkgaGF2ZSAtIGlzIHRoZSBxdWVzdGlvbiBv
biBob3cgcHJhY3RpY2FsbHkgQUJJIGRvY3VtZW50YXRpb24gcHVibGlzaGVkIHVuZGVyIENDLUJZ
LTQsIHdoZW4gbXVjaCBvZiB0aGlzIGluZm9ybWF0aW9uIGhhcyBhbHJlYWR5IGJlZW4gcHVibGlz
aGVkIGluIHRoZSBwYXN0IGFzIGNvZGUgdW5kZXIgQlNELg0KICAgIA0KICAgIElzIHRoZXJlIGEg
cmVmZXJlbmNlIHNhbXBsZSBvZjoNCiAgICANCiAgICAtIHByZXZpb3VzbHkgcHVibGlzaGVkLCBC
U0QtbGljZW5zZWQsIEFCSSBzcGVjaWZpY2F0aW9uLWFzLXNvdXJjZS1jb2RlDQoNCkFsbCBvZiBo
dHRwOi8veGVuYml0cy54ZW4ub3JnL2RvY3MvdW5zdGFibGUvaHlwZXJjYWxsDQpBbmQgc29tZSBj
YW4gYmUgY29udGVudCByaWNoIGFzIHNlZW4gaW4gaHR0cDovL3hlbmJpdHMueGVuLm9yZy9kb2Nz
L3Vuc3RhYmxlL2h5cGVyY2FsbC9hcm0vaW5jbHVkZSxwdWJsaWMseGVuLmguaHRtbCNGdW5jX0hZ
UEVSVklTT1JfbW11X3VwZGF0ZQ0KIA0KICAgIC0gdGhlIGNvcnJlc3BvbmRpbmcgRnVTQSBBQkkg
ZG9jdW1lbnRhdGlvbiBmb3IgdGhhdCBzb3VyY2UgZmlsZQ0KDQpXZSBkbyBOT1QgaGF2ZSBBTlkg
RnVTQSBkb2N1bWVudGF0aW9uIGF0IHRoaXMgc3RhZ2UuIEFuZCB0aGVyZSBhcmUgTk8gZXhhbXBs
ZXMgb2Ygc3VjaCBkb2NzIGluIHRoZSBwdWJsaWMgZG9tYWluDQpJIGFtIHdhaXRpbmcgZm9yIGEg
c2FuaXRpc2VkIHNtYWxsaXNoIHN5c3RlbSBzb2Z0d2FyZSBleGFtcGxlIHRvIGJlIG1hZGUgYXZh
aWxhYmxlLCB3aGljaCBzaG91bGQgaGVscCB1cyBpZGVudGlmeSB0aGUgcHJhY3RpY2FsIGltcGxp
Y2F0aW9ucyANCkhvd2V2ZXIsIEFCSSBkb2N1bWVudGF0aW9uIHdvdWxkIGJlIHBhcnQgb2YgaXQN
CiAgICANCiAgICBJZiB0aGVyZSBpcyBhbG1vc3QgYSAxOjEgY29ycmVzcG9uZGVuY2UgYmV0d2Vl
biBBQkkgImRvY3MiIGFuZCAiY29kZSIsIGNvdWxkIHRoZSBuZWNlc3NhcnkgRnVTQSBhbm5vdGF0
aW9ucyBiZWNvbWUgcGFydCBvZiB0aGUgc291cmNlIGNvZGUgZmlsZSwgZS5nLiBjb21tZW50cyBv
ciB0YWdzPyAgT3IgaXMgdGhlcmUgYSByZXF1aXJlbWVudCBmb3IgdGhlIEFCSSBkb2N1bWVudGF0
aW9uIHRvIGhhdmUgYSBzcGVjaWZpYyBsYXlvdXQgaW4gYSBwcmludGFibGUgcmVwb3J0Pw0KICAg
IA0KSSBkb27igJl0IHRoaW5rIHRoZXJlIHdpbGwgYmUgYSAxOjEgbWFwcGluZy4gVGhlIGRvY3Vt
ZW50YXRpb24gd291bGQgdHlwaWNhbGx5IGJlDQotIEludGVyZmFjZSBkb2NzIChlLmcuIEFCSSBk
b2NzKSAtIHRoZXJlIHdpbGwgbGlrZWx5IGJlIGEgY2xlYW4gbWFwcGluZyANCi0gUmVxdWlyZW1l
bnRzOiBzcGVjaWZ5aW5nIHdoYXQgdGhlIHN5c3RlbSBpcyBzdXBwb3NlZCB0byBkbyAtIG5vIGNs
ZWFuIG1hcHBpbmcgdG8gc291cmNlDQotIERlc2lnbnMsIEFyY2hpdGVjdHVyZSBkb2NzLCAuLi4g
LSBubyBjbGVhbiBtYXBwaW5nIHRvIHNvdXJjZQ0KLSBUZXN0IFNwZWNzIC0gc2hvdWxkIGhhdmUg
Y2xlYW4gbWFwcGluZyB0byB0ZXN0IGNvZGUsIGJ1dCBub3QgdG8gdGVzdGVkIGNvZGUNCg0KV2Ug
ZG8gc3RpbGwgbmVlZCBzb21lIHNvcnQgb2YgdGFnZ2luZyBmb3IgdHJhY2FiaWxpdHkNCg0KSW4g
YW55IGNhc2U6IEkgdGhpbmsgd2UgYXJlIGF0IHRoZSBzdGFnZSB3aGVyZSB3ZSBuZWVkIHRvIGhl
YXIgZnJvbSBBbmR5IGFuZCBvdGhlcnMNCg0KUmVnYXJkcw0KTGFycw0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
