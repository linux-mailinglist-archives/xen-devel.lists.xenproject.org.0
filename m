Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68837403
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 14:22:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYrN9-0003UP-1o; Thu, 06 Jun 2019 12:19:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4YtP=UF=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hYrN7-0003UK-OR
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 12:19:57 +0000
X-Inumbo-ID: 64e271fa-8855-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 64e271fa-8855-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 12:19:56 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=SoftFail smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vX5onzdj11dWpvsrXxH4XQyLxSnC0CxJNKo0hT2y1HDY1EuK9lkqjl7qrHDSPWR6ErVUISiLN6
 TTYQJI5tWHcd0DKP0a5EFeCHTyh6vu8Jl8LJiiYsCTjgpCGTB9HkUvXapBvO6lKSm7hY/BbVe4
 rdt0Hiv9lMfJeQpVfxf2RtayoJ8kFsCsziMn6zY1cotnkj+QgephOwqTlfHhtypsFNNC7H+Qpi
 tK/YDltvxGj2cYXGjgZ0P28gOUZPPUhF4i9mr3bEFsWeuFUUCK0qNxVcXVgqzWQ89BAMccQ820
 Y28=
X-SBRS: -0.9
X-MesageID: 1404083
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1404083"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
Thread-Topic: Xen Project Community Call June 6th: @15:00 UTC Call for agenda
 items
Thread-Index: AQHVF0i0wxsTSbqQdEi32qL4RfQjs6aOD5gA
Date: Thu, 6 Jun 2019 12:19:50 +0000
Message-ID: <352D6056-4B4E-46A6-A396-04266B52B580@citrix.com>
References: <B8AF45C4-A5CB-46D9-A35E-00C90B757CD7@citrix.com>
In-Reply-To: <B8AF45C4-A5CB-46D9-A35E-00C90B757CD7@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.a.190512
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <CDDF0F5440FD2F498C1F730B13E39277@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Xen Project Community Call June 6th: @15:00 UTC
 Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Brian
 Woods <brian.woods@amd.com>, Julien Grall <julien.grall@arm.com>, "Natarajan, 
 Janakarajan" <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KYSBxdWljayByZW1pbmRlciB0aGF0IHRoZSBjYWxsIHdpbGwgYmUgdG9kYXkNClJl
Z2FyZHMNCkxhcnMNCg0K77u/T24gMzAvMDUvMjAxOSwgMTg6MzUsICJMYXJzIEt1cnRoIiA8bGFy
cy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToNCg0KICAgIEhpIGFsbCwNCiAgICANCiAgICBQbGVh
c2UgcHJvcG9zZSB0b3BpY3MgYnkgZWl0aGVyIGVkaXRpbmcgdGhlIHJ1bm5pbmcgYWdlbmRhIGRv
Y3VtZW50IGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9XWnIyVlRkZm1h
UGR2SXhqWHArY2dTRi0gb3IgYnkgcmVwbHlpbmcgdG8gdGhlIG1haWwuDQogICAgSWRlYWxseSBi
eSBUdWVzZGF5IQ0KICAgIE5vdGUgdGhhdCBJIGFtIHVzaW5nIGFub3RoZXIgc2hhcmluZyBtZWNo
YW5pc20gYXMgcGVyIHJlcXVlc3QuIExldCBtZSBrbm93IGlmIHlvdSBoYXZlIGRpZmZpY3VsdGll
cw0KICAgIA0KICAgIEJlc3QgUmVnYXJkcw0KICAgIExhcnMNCiAgICANCiAgICA9PSBEaWFsLWlu
IEluZm9ybWF0aW9uID09DQogICAgDQogICAgICMjIE1lZXRpbmcgdGltZQ0KICAgICAxNTowMCAt
IDE2OjAwIFVUQw0KICAgICBGdXJ0aGVyIEludGVybmF0aW9uYWwgbWVldGluZyB0aW1lczogDQog
ICAgIGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRlLmNvbS93b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxz
Lmh0bWw/eWVhcj0yMDE5Jm1vbnRoPTYmZGF5PTYmaG91cj0xNSZtaW49MCZzZWM9MCZwMT0yMjUm
cDI9MjI0JnAzPTI0JnA0PTE3OSZwNT0xMzYmcDY9MzcmcDc9MzMNCiAgICANCiAgICANCiAgICAg
IyMgRGlhbCBpbiBkZXRhaWxzDQogICAgIFdlYjogaHR0cHM6Ly93d3cuZ290b21lZXQubWUvbGFy
c2t1cnRoDQogICAgDQogICAgIFlvdSBjYW4gYWxzbyBkaWFsIGluIHVzaW5nIHlvdXIgcGhvbmUu
DQogICAgIEFjY2VzcyBDb2RlOiA5MDYtODg2LTk2NQ0KICAgIA0KICAgICBDaGluYSAoVG9sbCBG
cmVlKTogNDAwOCA4MTEwODQNCiAgICAgR2VybWFueTogKzQ5IDY5MiA1NzM2IDczMTcNCiAgICAg
UG9sYW5kIChUb2xsIEZyZWUpOiAwMCA4MDAgMTEyNDc1OQ0KICAgICBVbml0ZWQgS2luZ2RvbTog
KzQ0IDMzMCAyMjEgMDA4OA0KICAgICBVbml0ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0K
ICAgIA0KICAgICBNb3JlIHBob25lIG51bWJlcnMNCiAgICAgQXVzdHJhbGlhOiArNjEgMiA5MDg3
IDM2MDQNCiAgICAgQXVzdHJpYTogKzQzIDcgMjA4MSA1NDI3DQogICAgIEFyZ2VudGluYSAoVG9s
bCBGcmVlKTogMCA4MDAgNDQ0IDMzNzUNCiAgICAgQmFocmFpbiAoVG9sbCBGcmVlKTogODAwIDgx
IDExMQ0KICAgICBCZWxhcnVzIChUb2xsIEZyZWUpOiA4IDgyMCAwMDExIDA0MDANCiAgICAgQmVs
Z2l1bTogKzMyIDI4IDkzIDcwMTgNCiAgICAgQnJhemlsIChUb2xsIEZyZWUpOiAwIDgwMCAwNDcg
NDkwNg0KICAgICBCdWxnYXJpYSAoVG9sbCBGcmVlKTogMDA4MDAgMTIwIDQ0MTcNCiAgICAgQ2Fu
YWRhOiArMSAoNjQ3KSA0OTctOTM5MQ0KICAgICBDaGlsZSAoVG9sbCBGcmVlKTogODAwIDM5NSAx
NTANCiAgICAgQ29sb21iaWEgKFRvbGwgRnJlZSk6IDAxIDgwMCA1MTggNDQ4Mw0KICAgICAgQ3pl
Y2ggUmVwdWJsaWMgKFRvbGwgRnJlZSk6IDgwMCA1MDA0NDgNCiAgICAgRGVubWFyazogKzQ1IDMy
IDcyIDAzIDgyDQogICAgIEZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCiAgICAgRnJhbmNlOiAr
MzMgMTcwIDk1MCA1OTQNCiAgICAgR3JlZWNlIChUb2xsIEZyZWUpOiAwMCA4MDAgNDQxNCAzODM4
DQogICAgIEhvbmcgS29uZyAoVG9sbCBGcmVlKTogMzA3MTMxNjkNCiAgICAgSHVuZ2FyeSAoVG9s
bCBGcmVlKTogKDA2KSA4MCA5ODYgMjU1DQogICAgIEljZWxhbmQgKFRvbGwgRnJlZSk6IDgwMCA3
MjA0DQogICAgIEluZGlhIChUb2xsIEZyZWUpOiAxODAwMjY2OTI3Mg0KICAgICBJbmRvbmVzaWEg
KFRvbGwgRnJlZSk6IDAwNyA4MDMgMDIwIDUzNzUNCiAgICAgSXJlbGFuZDogKzM1MyAxNSAzNjAg
NzI4DQogICAgIElzcmFlbCAoVG9sbCBGcmVlKTogMSA4MDkgNDU0IDgzMA0KICAgICBJdGFseTog
KzM5IDAgMjQ3IDkyIDEzIDAxDQogICAgIEphcGFuIChUb2xsIEZyZWUpOiAwIDEyMCA2NjMgODAw
DQogICAgIEtvcmVhLCBSZXB1YmxpYyBvZiAoVG9sbCBGcmVlKTogMDA3OTggMTQgMjA3IDQ5MTQN
CiAgICAgTHV4ZW1ib3VyZyAoVG9sbCBGcmVlKTogODAwIDg1MTU4DQogICAgIE1hbGF5c2lhIChU
b2xsIEZyZWUpOiAxIDgwMCA4MSA2ODU0DQogICAgIE1leGljbyAoVG9sbCBGcmVlKTogMDEgODAw
IDUyMiAxMTMzDQogICAgIE5ldGhlcmxhbmRzOiArMzEgMjA3IDk0MSAzNzcNCiAgICAgTmV3IFpl
YWxhbmQ6ICs2NCA5IDI4MCA2MzAyDQogICAgIE5vcndheTogKzQ3IDIxIDkzIDM3IDUxDQogICAg
IFBhbmFtYSAoVG9sbCBGcmVlKTogMDAgODAwIDIyNiA3OTI4DQogICAgIFBlcnUgKFRvbGwgRnJl
ZSk6IDAgODAwIDc3MDIzDQogICAgIFBoaWxpcHBpbmVzIChUb2xsIEZyZWUpOiAxIDgwMCAxMTEw
IDE2NjENCiAgICAgUG9ydHVnYWwgKFRvbGwgRnJlZSk6IDgwMCA4MTkgNTc1DQogICAgIFJvbWFu
aWEgKFRvbGwgRnJlZSk6IDAgODAwIDQxMCAwMjkNCiAgICAgUnVzc2lhbiBGZWRlcmF0aW9uIChU
b2xsIEZyZWUpOiA4IDgwMCAxMDAgNjIwMw0KICAgICBTYXVkaSBBcmFiaWEgKFRvbGwgRnJlZSk6
IDgwMCA4NDQgMzYzMw0KICAgICBTaW5nYXBvcmUgKFRvbGwgRnJlZSk6IDE4MDA3MjMxMzIzDQog
ICAgIFNvdXRoIEFmcmljYSAoVG9sbCBGcmVlKTogMCA4MDAgNTU1IDQ0Nw0KICAgICBTcGFpbjog
KzM0IDkzMiA3NSAyMDA0DQogICAgIFN3ZWRlbjogKzQ2IDg1MyA1MjcgODI3DQogICAgIFN3aXR6
ZXJsYW5kOiArNDEgMjI1IDQ1OTkgNzgNCiAgICAgVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2
NjYgODU0DQogICAgIFRoYWlsYW5kIChUb2xsIEZyZWUpOiAwMDEgODAwIDAxMSAwMjMNCiAgICAg
VHVya2V5IChUb2xsIEZyZWUpOiAwMCA4MDAgNDQ4OCAyMzY4Mw0KICAgICBVa3JhaW5lIChUb2xs
IEZyZWUpOiAwIDgwMCA1MCAxNzMzDQogICAgIFVuaXRlZCBBcmFiIEVtaXJhdGVzIChUb2xsIEZy
ZWUpOiA4MDAgMDQ0IDQwNDM5DQogICAgIFVydWd1YXkgKFRvbGwgRnJlZSk6IDAwMDQgMDE5IDEw
MTgNCiAgICAgVmlldCBOYW0gKFRvbGwgRnJlZSk6IDEyMiA4MCA0ODENCiAgICANCiAgICAgRmly
c3QgR29Ub01lZXRpbmc/IExldCdzIGRvIGEgcXVpY2sgc3lzdGVtIGNoZWNrOg0KICAgICBodHRw
czovL2xpbmsuZ290b21lZXRpbmcuY29tL3N5c3RlbS1jaGVjaw0KICAgIA0KICAgIA0KICAgIA0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
