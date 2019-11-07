Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A424EF3055
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 14:46:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSi3S-0006eB-B4; Thu, 07 Nov 2019 13:42:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y2MP=Y7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iSi3Q-0006e6-PS
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 13:42:28 +0000
X-Inumbo-ID: 6fc29276-0164-11ea-a1c8-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fc29276-0164-11ea-a1c8-12813bfff9fa;
 Thu, 07 Nov 2019 13:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573134147;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=C8pl6WDph/ukgwPURm3u6r5aMTNib2og6Y0fA1/Zaoo=;
 b=S0iUydo/3gXKCx+U7DOM+/mW1uft28xbqls9lPQYhKuoo67r79dNyvwW
 upFpYAbOSyHuakVbs6D3Dr3vGQV20FJUfGgjZ2wXefYzXrZtr744dW16y
 ljiO7nT02HBKPMfX41wLJyL+YUvfI9FO0nmto24EYoVC01uJlnbVbtIpO U=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Df2EgaucKZxjGzwE7CuCxSOsBMR9JD7+MUHV0Blx/jInzTv7R4b1OdoKwKaOuJMN+l42Ox2r8k
 bTSBmHsbYV6lXwzifgyy6+DGltiWBahjhJdmMpRQPJBWAYfUvv005UYwVW8IT109KLi3EMO80B
 VxsFmENjq2ot4wZPaMZrnMvMq40Tb+AbbDw6112BAf14rxO+UvogENsIQ8+We33Vy6j8683zJG
 7eoa/uLfGGSpIMewbQ/dpk68eVRLBoPnfkbBUDXnRV8ct+vuRqcJzZC0dAJ3lQlackL+FkUQF+
 ru4=
X-SBRS: 2.7
X-MesageID: 8343678
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,278,1569297600"; 
   d="scan'208";a="8343678"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: IMPORTANT CORRECTION - Community Call: Call for Agenda Items and
 call details for Nov 7, CORRECTED TIME 16:00 - 17:00 UTC
Thread-Index: AQHVlXEuEgdOLEqPK0SVeV8ezZ3OXw==
Date: Thu, 7 Nov 2019 13:42:21 +0000
Message-ID: <7923D5D5-3DE7-4A64-8153-20C666DC180C@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <F81A1DAEEE76E74E831947EAC6995F38@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] IMPORTANT CORRECTION - Community Call: Call for
 Agenda Items and call details for Nov 7, CORRECTED TIME 16:00 - 17:00 UTC
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
Cc: Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Brian
 Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Amit Shah <amit@infradead.org>, Matt
 Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Varad Gautam <varadgautam@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen
 Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan, 
 Janakarajan" <jnataraj@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpJIHRyaXBwZWQgb3ZlciB0aGUgZmFjdCB0aGF0IGh0dHBzOi8vd3d3LnRpbWVh
bmRkYXRlLmNvbS93b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bSB1c2VzIFVUQyBhcyBmaXhl
ZCBwb2ludCB3aGVyZWFzIG15IGNhbGVuZGFyIHVzZXMgdGhlIGxvY2FsIHRpbWUgYXMgZml4ZWQg
cG9pbnQsIHNvIHRoZSBtZWV0aW5nIG1pc3Rha2VubHkgZ290IHB1c2hlZCBhbiBob3VyIGVhcmxp
ZXIgd2hlbiBEU1QgZmluaXNoZWQuIFRoZSBjb3JyZWN0IHRpbWUgKHdoaWNoIHNob3VsZCBjb3Jy
ZXNwb25kIHRvIHlvdXIgY2FsZW5kYXIgZW50cmllcykgaXMNCg0KICAgICAgICAxNjowMCAtIDE3
OjAwIFVUQw0KICAgICAgICAwODowMCAtIDA5OjAwIFBTVCAoU2FuIEZyYW5jaXNjbykgLSBzb3Jy
eSBmb3IgdGhlIGVhcmx5IHRpbWUgc2xvdC4gSWYgdGhpcyBpcyBhIHByb2JsZW0sIGxldCdzIGRp
c2N1c3MgYXQgdGhlIGNhbGwNCiAgICAgICAgMTI6MDAgLSAxMzowMCBFU1QgKE5ldyBZb3JrKQ0K
ICAgICAgICAxNjowMCAtIDE3OjAwIEZNVCAoTG9uZG9uKQ0KICAgICAgICAxNzowMCAtIDE4OjAw
IENFVCAoQmVybGluKQ0KICAgICAgICAyMzowMCAtIDAxOjAwIENTVCAoQmVpamluZykNCiAgICAg
ICAgRnVydGhlciBJbnRlcm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6IGh0dHBzOi8vd3d3LnRpbWVh
bmRkYXRlLmNvbS93b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDE4Jm1vbnRo
PTExJmRheT03JmhvdXI9MTYmbWluPTAmc2VjPTAmcDE9MjI0JnAyPTI0JnAzPTE3OSZwND0xMzYm
cDU9MzcmcDY9MzMNCg0KQmVzdCBSZWdhcmRzDQpMYXJzDQoNCu+7v09uIDA3LzExLzIwMTksIDA3
OjI0LCAiTGFycyBLdXJ0aCIgPGxhcnMua3VydGhAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICBI
aSBhbGwsDQogICAgDQogICAgcXVpY2sgcmVtaW5kZXIgcmUgYWdlbmRhIGl0ZW1zLiBXaGF0IEkg
aGF2ZSBzbyBmYXIgaXMgYXQgaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0L1Nr
ZVUrWjVKOVdJSVU5WnNYbG9qaVhjUS8gDQogICAgDQogICAgQy4xKSBBbnkgbW9yZSA0LjEzIGNv
b3JkaW5hdGlvbiAoSnVlcmdlbikNCiAgICBDLjIpIFZvbHVudGVlcnMvc3VnZ2VzdGlvbnMgZm9y
IFJlbGVhc2UgTWFuYWdlcnMgZm9yIDQuMTMgKExhcnMgLyBKdWVyZ2VuKQ0KICAgIEMuMykgNC4x
MyBSZWxlYXNlIE5vdGVzIC8gQmxvZyBQb3N0IC8gRmVhdHVyZSBMaXN0IC0gbmVlZHMgcmV2aWV3
IChMYXJzKQ0KICAgIFNlZSBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFFcGln
dnhEemVvYzFkT01Gd1E5aXREWFk0dlk3bnZ4UGlMR2NOUVFtWDI4L2VkaXQ/dXNwPXNoYXJpbmcN
CiAgICANCiAgICBBT0INCiAgICAxKSBUcmF2ZWwgYW5kIGRpc2N1c3Npb25zDQogICAgUmljaCBQ
ZXJzYXVkLCBDaHJpc3RvcGhlciBDbGFyayAmIERhbmllbCBTbWl0aCB3aWxsIGJlIGluIENhbWJy
aWRnZSBEZWMgMTAgcG0gJiAxMSBhbSANCiAgICBEaXNjdXNzaW9ucyBhcmUgcGxhbm5lZCBhcm91
bmQgYSBudW1iZXIgb2YgdG9waWNzIHN1Y2ggYXMgc3RhdGUgb2YgWFNNLCBEb21CIHByb3Bvc2Fs
IGFzIGEgc2VjdXJlIG1lYW5zIHRvIHN0YXJ0IGFuIEwwL0wxIGNvbmZpZ3VyYXRpb24sIEtDT05G
SUcgZm9yIEwwIHZlcnNpb24gb2YgWGVuLCBldGMuDQogICAgQ2l0cml4IHdpbGwgaG9zdCwgYnV0
IG90aGVycyBhcmUgd2VsY29tZSB0byBqb2luIChwbGVhc2UgY29udGFjdCBMYXJzIGZvciBsb2dp
c3RpY3MpDQogICAgDQogICAgRmVlbCBmcmVlIHRvIHJlcXVlc3QgYWRkaXRpb25hbCBpdGVtcw0K
ICAgIA0KICAgIFJlZ2FyZHMNCiAgICBMYXJzDQogICAgDQogICAgT24gMDQvMTEvMjAxOSwgMDU6
MzcsICJMYXJzIEt1cnRoIiA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToNCiAgICANCiAg
ICAgICAgRGVhciBjb21tdW5pdHkgbWVtYmVycywNCiAgICAgICAgIA0KICAgICAgICBwbGVhc2Ug
c2VuZCBtZSBhZ2VuZGEgaXRlbXMgZm9yIG5leHQgd2Vla+KAmXMgY29tbXVuaXR5IGNhbGwuIEEg
ZHJhZnQgYWdlbmRhIGlzIGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9T
a2VVK1o1SjlXSUlVOVpzWGxvamlYY1EvDQogICAgICAgIFBsZWFzZSBhZGQgYWdlbmRhIGl0ZW1z
IHRvIHRoZSBkb2N1bWVudCBvciByZXBseSB0byB0aGlzIGUtbWFpbA0KICAgICAgICBOb3RlIHRo
YXQgSSBhbSBvbiBQVE8gdG9kYXkgYW5kIHRvbW9ycm93DQogICAgICAgICANCiAgICAgICAgTGFz
dCBtb250aOKAmXMgbWludXRlcyBhcmUgYXQgaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3Bh
ZC9lZGl0LzRGR0V3ODFmbFBVaWl2a2prdXZRSi1DSy8NCiAgICAgICAgIA0KICAgICAgICBCZXN0
IFJlZ2FyZHMNCiAgICAgICAgTGFycw0KICAgICAgICANCiAgICAgICAgIyMgTWVldGluZyB0aW1l
IChwbGVhc2UgZG91YmxlIGNoZWNrIHRoZSB0aW1lcw0KICAgICAgICAxNTowMCAtIDE2OjAwIFVU
Qw0KICAgICAgICAwNzowMCAtIDA4OjAwIFBTVCAoU2FuIEZyYW5jaXNjbykgLSBzb3JyeSBmb3Ig
dGhlIGVhcmx5IHRpbWUgc2xvdC4gSWYgdGhpcyBpcyBhIHByb2JsZW0sIGxldCdzIGRpc2N1c3Mg
YXQgdGhlIGNhbGwNCiAgICAgICAgMTA6MDAgLSAxMTowMCBFU1QgKE5ldyBZb3JrKQ0KICAgICAg
ICAxNTowMCAtIDE2OjAwIEZNVCAoTG9uZG9uKQ0KICAgICAgICAxNjowMCAtIDE3OjAwIENFVCAo
QmVybGluKQ0KICAgICAgICAyMzowMCAtIDIyOjAwIENTVCAoQmVpamluZykNCiAgICAgICAgRnVy
dGhlciBJbnRlcm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6IGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRl
LmNvbS93b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDE4Jm1vbnRoPTExJmRh
eT03JmhvdXI9MTUmbWluPTAmc2VjPTAmcDE9MjI0JnAyPTI0JnAzPTE3OSZwND0xMzYmcDU9Mzcm
cDY9MzMNCiAgICAgICAgDQogICAgICAgICMjIERpYWwgaW4gZGV0YWlscw0KICAgICAgICBXZWI6
IGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL2xhcnNrdXJ0aA0KICAgICAgICANCiAgICAgICAgWW91
IGNhbiBhbHNvIGRpYWwgaW4gdXNpbmcgeW91ciBwaG9uZS4NCiAgICAgICAgQWNjZXNzIENvZGU6
IDkwNi04ODYtOTY1DQogICAgICAgIA0KICAgICAgICBDaGluYSAoVG9sbCBGcmVlKTogNDAwOCA4
MTEwODQNCiAgICAgICAgR2VybWFueTogKzQ5IDY5MiA1NzM2IDczMTcNCiAgICAgICAgUG9sYW5k
IChUb2xsIEZyZWUpOiAwMCA4MDAgMTEyNDc1OQ0KICAgICAgICBVbml0ZWQgS2luZ2RvbTogKzQ0
IDMzMCAyMjEgMDA4OA0KICAgICAgICBVbml0ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0K
ICAgICAgICANCiAgICAgICAgTW9yZSBwaG9uZSBudW1iZXJzDQogICAgICAgIEF1c3RyYWxpYTog
KzYxIDIgOTA4NyAzNjA0DQogICAgICAgIEF1c3RyaWE6ICs0MyA3IDIwODEgNTQyNw0KICAgICAg
ICBBcmdlbnRpbmEgKFRvbGwgRnJlZSk6IDAgODAwIDQ0NCAzMzc1DQogICAgICAgIEJhaHJhaW4g
KFRvbGwgRnJlZSk6IDgwMCA4MSAxMTENCiAgICAgICAgQmVsYXJ1cyAoVG9sbCBGcmVlKTogOCA4
MjAgMDAxMSAwNDAwDQogICAgICAgIEJlbGdpdW06ICszMiAyOCA5MyA3MDE4DQogICAgICAgIEJy
YXppbCAoVG9sbCBGcmVlKTogMCA4MDAgMDQ3IDQ5MDYNCiAgICAgICAgQnVsZ2FyaWEgKFRvbGwg
RnJlZSk6IDAwODAwIDEyMCA0NDE3DQogICAgICAgIENhbmFkYTogKzEgKDY0NykgNDk3LTkzOTEN
CiAgICAgICAgQ2hpbGUgKFRvbGwgRnJlZSk6IDgwMCAzOTUgMTUwDQogICAgICAgIENvbG9tYmlh
IChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4IDQ0ODMNCiAgICAgICAgQ3plY2ggUmVwdWJsaWMgKFRv
bGwgRnJlZSk6IDgwMCA1MDA0NDgNCiAgICAgICAgRGVubWFyazogKzQ1IDMyIDcyIDAzIDgyDQog
ICAgICAgIEZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCiAgICAgICAgRnJhbmNlOiArMzMgMTcw
IDk1MCA1OTQNCiAgICAgICAgR3JlZWNlIChUb2xsIEZyZWUpOiAwMCA4MDAgNDQxNCAzODM4DQog
ICAgICAgIEhvbmcgS29uZyAoVG9sbCBGcmVlKTogMzA3MTMxNjkNCiAgICAgICAgSHVuZ2FyeSAo
VG9sbCBGcmVlKTogKDA2KSA4MCA5ODYgMjU1DQogICAgICAgIEljZWxhbmQgKFRvbGwgRnJlZSk6
IDgwMCA3MjA0DQogICAgICAgIEluZGlhIChUb2xsIEZyZWUpOiAxODAwMjY2OTI3Mg0KICAgICAg
ICBJbmRvbmVzaWEgKFRvbGwgRnJlZSk6IDAwNyA4MDMgMDIwIDUzNzUNCiAgICAgICAgSXJlbGFu
ZDogKzM1MyAxNSAzNjAgNzI4DQogICAgICAgIElzcmFlbCAoVG9sbCBGcmVlKTogMSA4MDkgNDU0
IDgzMA0KICAgICAgICBJdGFseTogKzM5IDAgMjQ3IDkyIDEzIDAxDQogICAgICAgIEphcGFuIChU
b2xsIEZyZWUpOiAwIDEyMCA2NjMgODAwDQogICAgICAgIEtvcmVhLCBSZXB1YmxpYyBvZiAoVG9s
bCBGcmVlKTogMDA3OTggMTQgMjA3IDQ5MTQNCiAgICAgICAgTHV4ZW1ib3VyZyAoVG9sbCBGcmVl
KTogODAwIDg1MTU4DQogICAgICAgIE1hbGF5c2lhIChUb2xsIEZyZWUpOiAxIDgwMCA4MSA2ODU0
DQogICAgICAgIE1leGljbyAoVG9sbCBGcmVlKTogMDEgODAwIDUyMiAxMTMzDQogICAgICAgIE5l
dGhlcmxhbmRzOiArMzEgMjA3IDk0MSAzNzcNCiAgICAgICAgTmV3IFplYWxhbmQ6ICs2NCA5IDI4
MCA2MzAyDQogICAgICAgIE5vcndheTogKzQ3IDIxIDkzIDM3IDUxDQogICAgICAgIFBhbmFtYSAo
VG9sbCBGcmVlKTogMDAgODAwIDIyNiA3OTI4DQogICAgICAgIFBlcnUgKFRvbGwgRnJlZSk6IDAg
ODAwIDc3MDIzDQogICAgICAgIFBoaWxpcHBpbmVzIChUb2xsIEZyZWUpOiAxIDgwMCAxMTEwIDE2
NjENCiAgICAgICAgUG9ydHVnYWwgKFRvbGwgRnJlZSk6IDgwMCA4MTkgNTc1DQogICAgICAgIFJv
bWFuaWEgKFRvbGwgRnJlZSk6IDAgODAwIDQxMCAwMjkNCiAgICAgICAgUnVzc2lhbiBGZWRlcmF0
aW9uIChUb2xsIEZyZWUpOiA4IDgwMCAxMDAgNjIwMw0KICAgICAgICBTYXVkaSBBcmFiaWEgKFRv
bGwgRnJlZSk6IDgwMCA4NDQgMzYzMw0KICAgICAgICBTaW5nYXBvcmUgKFRvbGwgRnJlZSk6IDE4
MDA3MjMxMzIzDQogICAgICAgIFNvdXRoIEFmcmljYSAoVG9sbCBGcmVlKTogMCA4MDAgNTU1IDQ0
Nw0KICAgICAgICBTcGFpbjogKzM0IDkzMiA3NSAyMDA0DQogICAgICAgIFN3ZWRlbjogKzQ2IDg1
MyA1MjcgODI3DQogICAgICAgIFN3aXR6ZXJsYW5kOiArNDEgMjI1IDQ1OTkgNzgNCiAgICAgICAg
VGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2NjYgODU0DQogICAgICAgIFRoYWlsYW5kIChUb2xs
IEZyZWUpOiAwMDEgODAwIDAxMSAwMjMNCiAgICAgICAgVHVya2V5IChUb2xsIEZyZWUpOiAwMCA4
MDAgNDQ4OCAyMzY4Mw0KICAgICAgICBVa3JhaW5lIChUb2xsIEZyZWUpOiAwIDgwMCA1MCAxNzMz
DQogICAgICAgIFVuaXRlZCBBcmFiIEVtaXJhdGVzIChUb2xsIEZyZWUpOiA4MDAgMDQ0IDQwNDM5
DQogICAgICAgIFVydWd1YXkgKFRvbGwgRnJlZSk6IDAwMDQgMDE5IDEwMTgNCiAgICAgICAgVmll
dCBOYW0gKFRvbGwgRnJlZSk6IDEyMiA4MCA0ODENCiAgICAgICAgDQogICAgICAgIEZpcnN0IEdv
VG9NZWV0aW5nPyBMZXQncyBkbyBhIHF1aWNrIHN5c3RlbSBjaGVjazoNCiAgICAgICAgaHR0cHM6
Ly9saW5rLmdvdG9tZWV0aW5nLmNvbS9zeXN0ZW0tY2hlY2sNCiAgICAgICAgDQogICAgICAgIA0K
ICAgICAgICANCiAgICANCiAgICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
