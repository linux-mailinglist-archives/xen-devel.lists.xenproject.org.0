Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD63114124
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 14:02:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icqiD-0001i0-0i; Thu, 05 Dec 2019 12:58:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w7E+=Z3=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1icqiB-0001hv-Tb
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 12:58:27 +0000
X-Inumbo-ID: ed3cf7a4-175e-11ea-8223-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed3cf7a4-175e-11ea-8223-12813bfff9fa;
 Thu, 05 Dec 2019 12:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575550706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=IPCc+o+LtLkS2DaIwvT7OiN6QRD6F4/Eg7GFu2tnSs8=;
 b=Y3jdDdvepnK6SW+VgasSUSaUq5Is4s/VDIStTZalFC49bN+fY6ul7a1r
 LyNSGi0G32vDtfYN2eMGIF9489Nm2RtUKsIyNXwFT/Omx9MeShduVmeVg
 oIRAI3jqWcowBW3S3Qc48dGx1YFPX5mPHq3hZur2UlXwP6iLXkpfdA2O3 w=;
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
IronPort-SDR: +/gTiZGMF4OQC4Xm7hMiWWkHSVupr0Gi8ZBFnoR6neKuvtL6W83jex030XcMvgpYnZFdIKAU+x
 8u1RlgFJTRVEbgIJ9dLL2VgBRggMMxqkjWqnFPfCeIZl+733QZecNqM+MzyUA2RWi27oX6X/zV
 hDJwa20eQRIsaqUQRVCdDyLCHOjSV8RUTQ4hnzP1fUMFzNRCIt3xp2EOFQ8Qr+4fO8Epwh/4Hy
 Hc+Rpmr8P9dwIoAYho0nHiF1VTtv8cGAqiA1GjFNldikIpGNILkQdC6Gch6wKlgMSpuO86K9Ga
 nyE=
X-SBRS: 2.7
X-MesageID: 9597497
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,281,1571716800"; 
   d="scan'208";a="9597497"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: Community Call: Call for Agenda Items and call details for
 Thursday Dec 5, 16:00 - 17:00 UTC
Thread-Index: AQHVqdQ6koXOJVqV7kSqTdOUc1Jy/6erDlSA
Date: Thu, 5 Dec 2019 12:58:20 +0000
Message-ID: <7EC16346-CBA0-4145-904E-38D1A2E5E840@citrix.com>
References: <7DD3E89A-0B3F-486D-8DB3-FB7C3987CD13@citrix.com>
In-Reply-To: <7DD3E89A-0B3F-486D-8DB3-FB7C3987CD13@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <8542499525666F45858A4550287419C4@citrix.com>
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

SGkgYWxsLA0KYSBxdWljayBub3RlIHRvIHNheSB0aGF0IEdlb3JnZSBtYXkgc3RhcnQgdGhlIGNh
bGw6IGhvd2V2ZXIsIHRoZSBjYWxsLWluIGRldGFpbHMgcmVtYWluIHRoZSBzYW1lLiBXZSBoYXZl
IGEgc2NoZWR1bGVkIHBvd2VyIG91dGFnZSB0aGlzIG1vcm5pbmcsIHdoaWNoIEkgd2FzIG9ubHkg
aW5mb3JtZWQgYWJvdXQgeWVzdGVyZGF5LiBBcyB0aGUgcG93ZXIgb3V0YWdlIGFmZmVjdHMgYWxt
b3N0IHRoZSBlbnRpcmUgcGFjaWZpYyBjb2FzdCBpbiBDUiwgaXQgaXMgY29uY2VpdmFibGUgdGhh
dCBJIHdvbid0IGhhdmUgYSBkYXRhIGNvbm5lY3Rpb24gdmlhIDRHIGVpdGhlci4gSW4gYW55IGNh
c2UsIHRoaXMgaXMganVzdCBhIHF1aWNrIG5vdGU6IG1vc3QgbGlrZWx5IGFsbCB3aWxsIHdvcmsg
YXMgdXN1YWwuDQpCZXN0IFJlZ2FyZHMNCkxhcnMNCg0K77u/T24gMDMvMTIvMjAxOSwgMDY6MjEs
ICJMYXJzIEt1cnRoIiA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToNCg0KICAgIENvcnJl
Y3Rpb246IHRoZSBtZWV0aW5nIGlzIHRoaXMgVGh1cnNkYXksIHRoZSA1dGgNCiAgICBBcG9sb2dp
ZXMgZm9yIHRoZSB0eXBvDQogICAgTGFycw0KICAgIA0KICAgIA0KICAgIE9uIDAyLzEyLzIwMTks
IDIwOjA1LCAiTGFycyBLdXJ0aCIgPGxhcnMua3VydGhAY2l0cml4LmNvbT4gd3JvdGU6DQogICAg
DQogICAgICAgIERlYXIgY29tbXVuaXR5IG1lbWJlcnMsDQogICAgICAgICANCiAgICAgICAgcGxl
YXNlIHNlbmQgbWUgYWdlbmRhIGl0ZW1zIGZvciB0aGlzIEZyaWRheeKAmXMgY29tbXVuaXR5IGNh
bGwgKHNvcnJ5IGZvciB0aGUgbGF0ZSBub3RpY2UsIEkgd2FzIG9uIFBUTyBsYXN0IHdlZWspLiBB
IGRyYWZ0IGFnZW5kYSBpcyBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQv
UEN0QnBob1hrQ1RpWEFCSjhjZEwwS3VaLyANCiAgICAgICAgUGxlYXNlIGFkZCBhZ2VuZGEgaXRl
bXMgdG8gdGhlIGRvY3VtZW50IG9yIHJlcGx5IHRvIHRoaXMgZS1tYWlsDQogICAgICAgIA0KICAg
ICAgICBASnVlcmdlbjogSSBhZGRlZCBhIHNsb3QgcmUgdGhlIDQuMTMgcmVsZWFzZQ0KICAgICAg
ICBARG91ZzogSSBzYXcgc29tZSBhY3Rpdml0eSByZWNlbnRseSBhYm91dCB0aGUgQ0kgTG9vcCBz
dHVmZiAtIG1heWJlIHdvcnRoIGRpc2N1c3NpbmcsIGlmIHlvdSBoYXZlIHRpbWUNCiAgICAgICAg
QElhbjogeW91IG1lbnRpb25lZCB0aGF0IHlvdSB3YW50ZWQgdG8gZmluZCBhIHdheSB0byBnZXQg
c3lzYWRtaW4gaGVscCBmcm9tIHNvbWVvbmUgaW4gdGhlIGNvbW11bml0eSB0byBoZWxwIG1haW50
YWluIHRlc3QgaW5mcmEgLSBJIHdhbnRlZCB0byBydW4gdGhpcyBwYXN0IHRoaXMgZ3JvdXAgZmly
c3QgdG8gc2VlIHdoZXRoZXIgYW55IG5hbWVzIGNvbWUgdG8gbWluZC4gVGhlIHJlcXVpcmVkIHNr
aWxsc2V0IGlzIGxpa2VseSB0byBiZSBkaWZmZXJlbnQgdG8gdGhhdCBvZiBhIGRldmVsb3BlciAN
CiAgICAgICAgDQogICAgICAgIFVQREFURTogUGF1bCBEdXJyYW50IHdpbGwgYmUgcmVsZWFzZSBt
YW5hZ2VyIGZvciA0LjE0IC0gY29uZ3JhdHVsYXRpb25zDQogICAgICAgIA0KICAgICAgICBMYXN0
IG1vbnRo4oCZcyBtaW51dGVzIGFyZSBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8jLzIvcGFk
L3ZpZXcvN2wzYTRtaFpUVTR4czBHRTQxNU9YaUFqMFNjS2wzOXhkUTl3bTBjd0FTcy8gDQogICAg
ICAgICANCiAgICAgICAgQmVzdCBSZWdhcmRzDQogICAgICAgIExhcnMNCiAgICAgICAgDQogICAg
ICAgICMjIE1lZXRpbmcgdGltZSAocGxlYXNlIGRvdWJsZSBjaGVjayB0aGUgdGltZXMpDQogICAg
ICAgIDE2OjAwIC0gMTc6MDAgVVRDDQogICAgICAgIDA4OjAwIC0gMDk6MDAgUFNUIChTYW4gRnJh
bmNpc2NvKSAtIHNvcnJ5IGZvciB0aGUgZWFybHkgdGltZSBzbG90LiBJZiB0aGlzIGlzIGEgcHJv
YmxlbSwgbGV0J3MgZGlzY3VzcyBhdCB0aGUgY2FsbA0KICAgICAgICAxMDowMCAtIDExOjAwIENT
VCAoQXVzdGluLCBDb3N0YSBSaWNhKQ0KICAgICAgICAxMTowMCAtIDEyOjAwIEVTVCAoTmV3IFlv
cmspDQogICAgICAgIDE2OjAwIC0gMTc6MDAgRk1UIChMb25kb24pDQogICAgICAgIDE3OjAwIC0g
MTg6MDAgQ0VUIChCZXJsaW4pDQogICAgICAgIDAwOjAwIC0gMDE6MDArMSBDU1QgKEJlaWppbmcp
DQogICAgICAgIA0KICAgICAgICBGdXJ0aGVyIEludGVybmF0aW9uYWwgbWVldGluZyB0aW1lczog
aHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRt
bD95ZWFyPTIwMTkmbW9udGg9MTImZGF5PTUmaG91cj0xNiZtaW49MCZzZWM9MCZwMT0yMjQmcDI9
MjQmcDM9MTc5JnA0PTEzNiZwNT0zNyZwNj0zMw0KICAgICAgICANCiAgICAgICAgIyMgRGlhbCBp
biBkZXRhaWxzDQogICAgICAgIFdlYjogaHR0cHM6Ly93d3cuZ290b21lZXQubWUvbGFyc2t1cnRo
DQogICAgICAgIA0KICAgICAgICBZb3UgY2FuIGFsc28gZGlhbCBpbiB1c2luZyB5b3VyIHBob25l
DQogICAgICAgIEFjY2VzcyBDb2RlOiA5MDYtODg2LTk2NQ0KICAgICAgICANCiAgICAgICAgQ2hp
bmEgKFRvbGwgRnJlZSk6IDQwMDggODExMDg0DQogICAgICAgIEdlcm1hbnk6ICs0OSA2OTIgNTcz
NiA3MzE3DQogICAgICAgIFBvbGFuZCAoVG9sbCBGcmVlKTogMDAgODAwIDExMjQ3NTkNCiAgICAg
ICAgVW5pdGVkIEtpbmdkb206ICs0NCAzMzAgMjIxIDAwODgNCiAgICAgICAgVW5pdGVkIFN0YXRl
czogKzEgKDU3MSkgMzE3LTMxMjkNCiAgICAgICAgDQogICAgICAgIE1vcmUgcGhvbmUgbnVtYmVy
cw0KICAgICAgICBBdXN0cmFsaWE6ICs2MSAyIDkwODcgMzYwNA0KICAgICAgICBBdXN0cmlhOiAr
NDMgNyAyMDgxIDU0MjcNCiAgICAgICAgQXJnZW50aW5hIChUb2xsIEZyZWUpOiAwIDgwMCA0NDQg
MzM3NQ0KICAgICAgICBCYWhyYWluIChUb2xsIEZyZWUpOiA4MDAgODEgMTExDQogICAgICAgIEJl
bGFydXMgKFRvbGwgRnJlZSk6IDggODIwIDAwMTEgMDQwMA0KICAgICAgICBCZWxnaXVtOiArMzIg
MjggOTMgNzAxOA0KICAgICAgICBCcmF6aWwgKFRvbGwgRnJlZSk6IDAgODAwIDA0NyA0OTA2DQog
ICAgICAgIEJ1bGdhcmlhIChUb2xsIEZyZWUpOiAwMDgwMCAxMjAgNDQxNw0KICAgICAgICBDYW5h
ZGE6ICsxICg2NDcpIDQ5Ny05MzkxDQogICAgICAgIENoaWxlIChUb2xsIEZyZWUpOiA4MDAgMzk1
IDE1MA0KICAgICAgICBDb2xvbWJpYSAoVG9sbCBGcmVlKTogMDEgODAwIDUxOCA0NDgzDQogICAg
ICAgIEN6ZWNoIFJlcHVibGljIChUb2xsIEZyZWUpOiA4MDAgNTAwNDQ4DQogICAgICAgIERlbm1h
cms6ICs0NSAzMiA3MiAwMyA4Mg0KICAgICAgICBGaW5sYW5kOiArMzU4IDkyMyAxNyAwNTY4DQog
ICAgICAgIEZyYW5jZTogKzMzIDE3MCA5NTAgNTk0DQogICAgICAgIEdyZWVjZSAoVG9sbCBGcmVl
KTogMDAgODAwIDQ0MTQgMzgzOA0KICAgICAgICBIb25nIEtvbmcgKFRvbGwgRnJlZSk6IDMwNzEz
MTY5DQogICAgICAgIEh1bmdhcnkgKFRvbGwgRnJlZSk6ICgwNikgODAgOTg2IDI1NQ0KICAgICAg
ICBJY2VsYW5kIChUb2xsIEZyZWUpOiA4MDAgNzIwNA0KICAgICAgICBJbmRpYSAoVG9sbCBGcmVl
KTogMTgwMDI2NjkyNzINCiAgICAgICAgSW5kb25lc2lhIChUb2xsIEZyZWUpOiAwMDcgODAzIDAy
MCA1Mzc1DQogICAgICAgIElyZWxhbmQ6ICszNTMgMTUgMzYwIDcyOA0KICAgICAgICBJc3JhZWwg
KFRvbGwgRnJlZSk6IDEgODA5IDQ1NCA4MzANCiAgICAgICAgSXRhbHk6ICszOSAwIDI0NyA5MiAx
MyAwMQ0KICAgICAgICBKYXBhbiAoVG9sbCBGcmVlKTogMCAxMjAgNjYzIDgwMA0KICAgICAgICBL
b3JlYSwgUmVwdWJsaWMgb2YgKFRvbGwgRnJlZSk6IDAwNzk4IDE0IDIwNyA0OTE0DQogICAgICAg
IEx1eGVtYm91cmcgKFRvbGwgRnJlZSk6IDgwMCA4NTE1OA0KICAgICAgICBNYWxheXNpYSAoVG9s
bCBGcmVlKTogMSA4MDAgODEgNjg1NA0KICAgICAgICBNZXhpY28gKFRvbGwgRnJlZSk6IDAxIDgw
MCA1MjIgMTEzMw0KICAgICAgICBOZXRoZXJsYW5kczogKzMxIDIwNyA5NDEgMzc3DQogICAgICAg
IE5ldyBaZWFsYW5kOiArNjQgOSAyODAgNjMwMg0KICAgICAgICBOb3J3YXk6ICs0NyAyMSA5MyAz
NyA1MQ0KICAgICAgICBQYW5hbWEgKFRvbGwgRnJlZSk6IDAwIDgwMCAyMjYgNzkyOA0KICAgICAg
ICBQZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3NzAyMw0KICAgICAgICBQaGlsaXBwaW5lcyAoVG9s
bCBGcmVlKTogMSA4MDAgMTExMCAxNjYxDQogICAgICAgIFBvcnR1Z2FsIChUb2xsIEZyZWUpOiA4
MDAgODE5IDU3NQ0KICAgICAgICBSb21hbmlhIChUb2xsIEZyZWUpOiAwIDgwMCA0MTAgMDI5DQog
ICAgICAgIFJ1c3NpYW4gRmVkZXJhdGlvbiAoVG9sbCBGcmVlKTogOCA4MDAgMTAwIDYyMDMNCiAg
ICAgICAgU2F1ZGkgQXJhYmlhIChUb2xsIEZyZWUpOiA4MDAgODQ0IDM2MzMNCiAgICAgICAgU2lu
Z2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMw0KICAgICAgICBTb3V0aCBBZnJpY2EgKFRv
bGwgRnJlZSk6IDAgODAwIDU1NSA0NDcNCiAgICAgICAgU3BhaW46ICszNCA5MzIgNzUgMjAwNA0K
ICAgICAgICBTd2VkZW46ICs0NiA4NTMgNTI3IDgyNw0KICAgICAgICBTd2l0emVybGFuZDogKzQx
IDIyNSA0NTk5IDc4DQogICAgICAgIFRhaXdhbiAoVG9sbCBGcmVlKTogMCA4MDAgNjY2IDg1NA0K
ICAgICAgICBUaGFpbGFuZCAoVG9sbCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQogICAgICAgIFR1
cmtleSAoVG9sbCBGcmVlKTogMDAgODAwIDQ0ODggMjM2ODMNCiAgICAgICAgVWtyYWluZSAoVG9s
bCBGcmVlKTogMCA4MDAgNTAgMTczMw0KICAgICAgICBVbml0ZWQgQXJhYiBFbWlyYXRlcyAoVG9s
bCBGcmVlKTogODAwIDA0NCA0MDQzOQ0KICAgICAgICBVcnVndWF5IChUb2xsIEZyZWUpOiAwMDA0
IDAxOSAxMDE4DQogICAgICAgIFZpZXQgTmFtIChUb2xsIEZyZWUpOiAxMjIgODAgNDgxDQogICAg
ICAgIA0KICAgICAgICBGaXJzdCBHb1RvTWVldGluZz8gTGV0J3MgZG8gYSBxdWljayBzeXN0ZW0g
Y2hlY2s6DQogICAgICAgIGh0dHBzOi8vbGluay5nb3RvbWVldGluZy5jb20vc3lzdGVtLWNoZWNr
DQogICAgICAgIA0KICAgICAgICANCiAgICAgICAgDQogICAgDQogICAgDQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
