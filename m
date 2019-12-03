Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B2D10FD91
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 13:26:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic7Bi-0005TR-WB; Tue, 03 Dec 2019 12:21:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7s2f=ZZ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ic7Bh-0005TM-10
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 12:21:53 +0000
X-Inumbo-ID: 7c063aa2-15c7-11ea-81d9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c063aa2-15c7-11ea-81d9-12813bfff9fa;
 Tue, 03 Dec 2019 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575375711;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=HxuLw3mVV23dI6pWQEdg4T0ztoBTFFPc7dhJe9Ac0lk=;
 b=VaQKgYYwn0R69DqNKC5L8s/1C8WJa9vx4ZTS07uDXH+Npch9X8dDjifJ
 V8g9zunFZwdFANuA4yPlygJrfrS6gxwLGAkvy3IhzE9U7GxndQOiXXCTq
 EDHt6MiJbZIN5Hh/f6ZQH1W/nv7A01mrH0dEhFdMJAmkdDiS8z6WCKajS k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1QA9GZjJ6AzSs0hwoertDCsRcUInwkTPJtfTucxASTtg73INQsf5FQ6gJDy0S9ipmaMQC8Sph1
 glCvFpajGLVmMloDpg+z2ToUHN+0SlNHXEyhdtA+NFIegSY1XU3NO0MJ4L9lagbNHQLhs7pnew
 8rBbWGhLSfJBUP5qGfe9H5XHQMxWogP+ak80VLxLnW1+E62XfZiFj9tV4I8EjbJQPMUkBQLfpS
 kh28EtUdfYV86NBegXMyETmnVxriMcLllzAB6qNAO5pllhY64+BirO7+wkLrSH1+ZQ4TPH+b6L
 MDY=
X-SBRS: 2.7
X-MesageID: 9664031
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,273,1571716800"; 
   d="scan'208";a="9664031"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: Community Call: Call for Agenda Items and call details for
 Thursday Dec 5, 16:00 - 17:00 UTC
Thread-Index: AQHVqdQ6koXOJVqV7kSqTdOUc1Jy/w==
Date: Tue, 3 Dec 2019 12:21:45 +0000
Message-ID: <7DD3E89A-0B3F-486D-8DB3-FB7C3987CD13@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <A64783E6E9151849B85DAC41B6CF811A@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Community Call: Call for Agenda Items and call
 details for Thursday Dec 5, 16:00 - 17:00 UTC
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
 Amit Shah <amit@infradead.org>, Matt Spencer <Matt.Spencer@arm.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Varad Gautam <varadgautam@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, Kevin
 Pearson <kevin.pearson@ortmanconsulting.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>, Stewart
 Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29ycmVjdGlvbjogdGhlIG1lZXRpbmcgaXMgdGhpcyBUaHVyc2RheSwgdGhlIDV0aA0KQXBvbG9n
aWVzIGZvciB0aGUgdHlwbw0KTGFycw0KDQoNCu+7v09uIDAyLzEyLzIwMTksIDIwOjA1LCAiTGFy
cyBLdXJ0aCIgPGxhcnMua3VydGhAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICBEZWFyIGNvbW11
bml0eSBtZW1iZXJzLA0KICAgICANCiAgICBwbGVhc2Ugc2VuZCBtZSBhZ2VuZGEgaXRlbXMgZm9y
IHRoaXMgRnJpZGF54oCZcyBjb21tdW5pdHkgY2FsbCAoc29ycnkgZm9yIHRoZSBsYXRlIG5vdGlj
ZSwgSSB3YXMgb24gUFRPIGxhc3Qgd2VlaykuIEEgZHJhZnQgYWdlbmRhIGlzIGF0IGh0dHBzOi8v
Y3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9QQ3RCcGhvWGtDVGlYQUJKOGNkTDBLdVovIA0K
ICAgIFBsZWFzZSBhZGQgYWdlbmRhIGl0ZW1zIHRvIHRoZSBkb2N1bWVudCBvciByZXBseSB0byB0
aGlzIGUtbWFpbA0KICAgIA0KICAgIEBKdWVyZ2VuOiBJIGFkZGVkIGEgc2xvdCByZSB0aGUgNC4x
MyByZWxlYXNlDQogICAgQERvdWc6IEkgc2F3IHNvbWUgYWN0aXZpdHkgcmVjZW50bHkgYWJvdXQg
dGhlIENJIExvb3Agc3R1ZmYgLSBtYXliZSB3b3J0aCBkaXNjdXNzaW5nLCBpZiB5b3UgaGF2ZSB0
aW1lDQogICAgQElhbjogeW91IG1lbnRpb25lZCB0aGF0IHlvdSB3YW50ZWQgdG8gZmluZCBhIHdh
eSB0byBnZXQgc3lzYWRtaW4gaGVscCBmcm9tIHNvbWVvbmUgaW4gdGhlIGNvbW11bml0eSB0byBo
ZWxwIG1haW50YWluIHRlc3QgaW5mcmEgLSBJIHdhbnRlZCB0byBydW4gdGhpcyBwYXN0IHRoaXMg
Z3JvdXAgZmlyc3QgdG8gc2VlIHdoZXRoZXIgYW55IG5hbWVzIGNvbWUgdG8gbWluZC4gVGhlIHJl
cXVpcmVkIHNraWxsc2V0IGlzIGxpa2VseSB0byBiZSBkaWZmZXJlbnQgdG8gdGhhdCBvZiBhIGRl
dmVsb3BlciANCiAgICANCiAgICBVUERBVEU6IFBhdWwgRHVycmFudCB3aWxsIGJlIHJlbGVhc2Ug
bWFuYWdlciBmb3IgNC4xNCAtIGNvbmdyYXR1bGF0aW9ucw0KICAgIA0KICAgIExhc3QgbW9udGji
gJlzIG1pbnV0ZXMgYXJlIGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvdmlldy83
bDNhNG1oWlRVNHhzMEdFNDE1T1hpQWowU2NLbDM5eGRROXdtMGN3QVNzLyANCiAgICAgDQogICAg
QmVzdCBSZWdhcmRzDQogICAgTGFycw0KICAgIA0KICAgICMjIE1lZXRpbmcgdGltZSAocGxlYXNl
IGRvdWJsZSBjaGVjayB0aGUgdGltZXMpDQogICAgMTY6MDAgLSAxNzowMCBVVEMNCiAgICAwODow
MCAtIDA5OjAwIFBTVCAoU2FuIEZyYW5jaXNjbykgLSBzb3JyeSBmb3IgdGhlIGVhcmx5IHRpbWUg
c2xvdC4gSWYgdGhpcyBpcyBhIHByb2JsZW0sIGxldCdzIGRpc2N1c3MgYXQgdGhlIGNhbGwNCiAg
ICAxMDowMCAtIDExOjAwIENTVCAoQXVzdGluLCBDb3N0YSBSaWNhKQ0KICAgIDExOjAwIC0gMTI6
MDAgRVNUIChOZXcgWW9yaykNCiAgICAxNjowMCAtIDE3OjAwIEZNVCAoTG9uZG9uKQ0KICAgIDE3
OjAwIC0gMTg6MDAgQ0VUIChCZXJsaW4pDQogICAgMDA6MDAgLSAwMTowMCsxIENTVCAoQmVpamlu
ZykNCiAgICANCiAgICBGdXJ0aGVyIEludGVybmF0aW9uYWwgbWVldGluZyB0aW1lczogaHR0cHM6
Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFy
PTIwMTkmbW9udGg9MTImZGF5PTUmaG91cj0xNiZtaW49MCZzZWM9MCZwMT0yMjQmcDI9MjQmcDM9
MTc5JnA0PTEzNiZwNT0zNyZwNj0zMw0KICAgIA0KICAgICMjIERpYWwgaW4gZGV0YWlscw0KICAg
IFdlYjogaHR0cHM6Ly93d3cuZ290b21lZXQubWUvbGFyc2t1cnRoDQogICAgDQogICAgWW91IGNh
biBhbHNvIGRpYWwgaW4gdXNpbmcgeW91ciBwaG9uZQ0KICAgIEFjY2VzcyBDb2RlOiA5MDYtODg2
LTk2NQ0KICAgIA0KICAgIENoaW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0KICAgIEdlcm1h
bnk6ICs0OSA2OTIgNTczNiA3MzE3DQogICAgUG9sYW5kIChUb2xsIEZyZWUpOiAwMCA4MDAgMTEy
NDc1OQ0KICAgIFVuaXRlZCBLaW5nZG9tOiArNDQgMzMwIDIyMSAwMDg4DQogICAgVW5pdGVkIFN0
YXRlczogKzEgKDU3MSkgMzE3LTMxMjkNCiAgICANCiAgICBNb3JlIHBob25lIG51bWJlcnMNCiAg
ICBBdXN0cmFsaWE6ICs2MSAyIDkwODcgMzYwNA0KICAgIEF1c3RyaWE6ICs0MyA3IDIwODEgNTQy
Nw0KICAgIEFyZ2VudGluYSAoVG9sbCBGcmVlKTogMCA4MDAgNDQ0IDMzNzUNCiAgICBCYWhyYWlu
IChUb2xsIEZyZWUpOiA4MDAgODEgMTExDQogICAgQmVsYXJ1cyAoVG9sbCBGcmVlKTogOCA4MjAg
MDAxMSAwNDAwDQogICAgQmVsZ2l1bTogKzMyIDI4IDkzIDcwMTgNCiAgICBCcmF6aWwgKFRvbGwg
RnJlZSk6IDAgODAwIDA0NyA0OTA2DQogICAgQnVsZ2FyaWEgKFRvbGwgRnJlZSk6IDAwODAwIDEy
MCA0NDE3DQogICAgQ2FuYWRhOiArMSAoNjQ3KSA0OTctOTM5MQ0KICAgIENoaWxlIChUb2xsIEZy
ZWUpOiA4MDAgMzk1IDE1MA0KICAgIENvbG9tYmlhIChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4IDQ0
ODMNCiAgICBDemVjaCBSZXB1YmxpYyAoVG9sbCBGcmVlKTogODAwIDUwMDQ0OA0KICAgIERlbm1h
cms6ICs0NSAzMiA3MiAwMyA4Mg0KICAgIEZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCiAgICBG
cmFuY2U6ICszMyAxNzAgOTUwIDU5NA0KICAgIEdyZWVjZSAoVG9sbCBGcmVlKTogMDAgODAwIDQ0
MTQgMzgzOA0KICAgIEhvbmcgS29uZyAoVG9sbCBGcmVlKTogMzA3MTMxNjkNCiAgICBIdW5nYXJ5
IChUb2xsIEZyZWUpOiAoMDYpIDgwIDk4NiAyNTUNCiAgICBJY2VsYW5kIChUb2xsIEZyZWUpOiA4
MDAgNzIwNA0KICAgIEluZGlhIChUb2xsIEZyZWUpOiAxODAwMjY2OTI3Mg0KICAgIEluZG9uZXNp
YSAoVG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KICAgIElyZWxhbmQ6ICszNTMgMTUgMzYw
IDcyOA0KICAgIElzcmFlbCAoVG9sbCBGcmVlKTogMSA4MDkgNDU0IDgzMA0KICAgIEl0YWx5OiAr
MzkgMCAyNDcgOTIgMTMgMDENCiAgICBKYXBhbiAoVG9sbCBGcmVlKTogMCAxMjAgNjYzIDgwMA0K
ICAgIEtvcmVhLCBSZXB1YmxpYyBvZiAoVG9sbCBGcmVlKTogMDA3OTggMTQgMjA3IDQ5MTQNCiAg
ICBMdXhlbWJvdXJnIChUb2xsIEZyZWUpOiA4MDAgODUxNTgNCiAgICBNYWxheXNpYSAoVG9sbCBG
cmVlKTogMSA4MDAgODEgNjg1NA0KICAgIE1leGljbyAoVG9sbCBGcmVlKTogMDEgODAwIDUyMiAx
MTMzDQogICAgTmV0aGVybGFuZHM6ICszMSAyMDcgOTQxIDM3Nw0KICAgIE5ldyBaZWFsYW5kOiAr
NjQgOSAyODAgNjMwMg0KICAgIE5vcndheTogKzQ3IDIxIDkzIDM3IDUxDQogICAgUGFuYW1hIChU
b2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgNCiAgICBQZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3
NzAyMw0KICAgIFBoaWxpcHBpbmVzIChUb2xsIEZyZWUpOiAxIDgwMCAxMTEwIDE2NjENCiAgICBQ
b3J0dWdhbCAoVG9sbCBGcmVlKTogODAwIDgxOSA1NzUNCiAgICBSb21hbmlhIChUb2xsIEZyZWUp
OiAwIDgwMCA0MTAgMDI5DQogICAgUnVzc2lhbiBGZWRlcmF0aW9uIChUb2xsIEZyZWUpOiA4IDgw
MCAxMDAgNjIwMw0KICAgIFNhdWRpIEFyYWJpYSAoVG9sbCBGcmVlKTogODAwIDg0NCAzNjMzDQog
ICAgU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMw0KICAgIFNvdXRoIEFmcmljYSAo
VG9sbCBGcmVlKTogMCA4MDAgNTU1IDQ0Nw0KICAgIFNwYWluOiArMzQgOTMyIDc1IDIwMDQNCiAg
ICBTd2VkZW46ICs0NiA4NTMgNTI3IDgyNw0KICAgIFN3aXR6ZXJsYW5kOiArNDEgMjI1IDQ1OTkg
NzgNCiAgICBUYWl3YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4NTQNCiAgICBUaGFpbGFuZCAo
VG9sbCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQogICAgVHVya2V5IChUb2xsIEZyZWUpOiAwMCA4
MDAgNDQ4OCAyMzY4Mw0KICAgIFVrcmFpbmUgKFRvbGwgRnJlZSk6IDAgODAwIDUwIDE3MzMNCiAg
ICBVbml0ZWQgQXJhYiBFbWlyYXRlcyAoVG9sbCBGcmVlKTogODAwIDA0NCA0MDQzOQ0KICAgIFVy
dWd1YXkgKFRvbGwgRnJlZSk6IDAwMDQgMDE5IDEwMTgNCiAgICBWaWV0IE5hbSAoVG9sbCBGcmVl
KTogMTIyIDgwIDQ4MQ0KICAgIA0KICAgIEZpcnN0IEdvVG9NZWV0aW5nPyBMZXQncyBkbyBhIHF1
aWNrIHN5c3RlbSBjaGVjazoNCiAgICBodHRwczovL2xpbmsuZ290b21lZXRpbmcuY29tL3N5c3Rl
bS1jaGVjaw0KICAgIA0KICAgIA0KICAgIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
