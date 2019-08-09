Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E987B10
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 15:24:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw4qn-0007qb-1P; Fri, 09 Aug 2019 13:22:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j/zc=WF=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hw4ql-0007qU-Dx
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 13:22:31 +0000
X-Inumbo-ID: bb57fb98-baa8-11e9-9fed-af339617c68b
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb57fb98-baa8-11e9-9fed-af339617c68b;
 Fri, 09 Aug 2019 13:22:27 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: h1YFYghHt9i4cSFzgwC2GZh76AFjYDXmvUkdl+GrFhefUYsFGneYLaNZtHuQlYEk+zbEaVdeyG
 q5ElgNFyolcDPXFbOETompyXGfLHD3MYZn6+rWSOo+r8kSCEjpmSulAgwYmMK7Zt2/WEIH6tAj
 AF6ZhR0VyqdL05Pg9f4edYnUISUOj7ls1rPTjzRDDCOifTnQIUEYXkhERUOptkGmJ3VLrdbuDA
 HVhIAMUZ6PmYy7dcPn5TdP51fxX9Ibjj+fIqpDJBWJNXneJwfQkN9nA6lvg1AR0R+nOhRxNk0U
 ae4=
X-SBRS: 2.7
X-MesageID: 4074586
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,364,1559534400"; 
   d="scan'208";a="4074586"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
Thread-Topic: [Xen-summit-2019] Design Session Notes
Thread-Index: AQHVTrV6kKrubnMuM0+L2Hphxqf8bQ==
Date: Fri, 9 Aug 2019 13:22:23 +0000
Message-ID: <FA014711-E7D7-46B2-A24C-449C0330FA22@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <407A69B0C5ADAE4AB838B5ABEB4BD38C@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [Xen-summit-2019] Design Session Notes
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Andrii Anisov <andrii_anisov@epam.com>,
 Wei Liu <wl@xen.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, Rich Persaud <persaur@gmail.com>,
 "thibodux@gmail.com" <thibodux@gmail.com>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpJIGNvbGxhdGVkIGFsbCB0aGUgZGVzaWduIHNlc3Npb24gZGVzY3JpcHRpb25z
IGFuZCBhbGwgdGhlIG5vdGVzIEkgY291bGQgZmluZCBvbiB4ZW4tZGV2ZWxAIA0KYXQgaHR0cHM6
Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvRGVzaWduX1Nlc3Npb25zXzIwMTkNCg0KSSBtYXkg
YmUgbWlzc2luZyBhIGZldyBmcm9tIGRheSAxLCBhcyB3ZSBsb3N0IHNvbWUgb2YgdGhlIHNlc3Np
b24gaW4gdGhlIHN5c3RlbSB3aGVuIHdlIGltcHJvdmlzZWQgdGhlIHNjaGVkdWxlIHRvIHBhY2sg
bW9yZSBzZXNzaW9ucyBpbg0KDQpUaGVyZSB3ZXJlIGEgZmV3LCB3aGljaCBtYXkgaGF2ZSBiZWVu
IHBvc3RlZCwgYnV0IEkgZGlkbuKAmXQgZmluZC4gSWYgeW91IGFyZSBDQ+KAmWVkLCB5b3UgaG9z
dGVkIGEgc2Vzc2lvbiBmb3Igd2hpY2ggSSBkb27igJl0IGhhdmUgbm90ZXMvbWF0ZXJpYWwuIFBs
ZWFzZSBzZW5kIG1lIGEgbGluayAoeW91IGNhbiByZXBseSB0byB0aGUgdGhyZWFkIHdpdGggdGhl
IHRpdGxlKSBvciB1cGRhdGUgdGhlIHdpa2kuIE5vdGUgdGhhdCBzb21lIG1heSBoYXZlIGJlZW4g
cG9zdGVkIHVuZGVyIGEgdGl0bGUgbWFraW5nIHRoZSBub3RlcyBub3QgZWFzaWx5IGlkZW50aWZp
YWJsZS4NCg0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvRGVzaWduX1Nlc3Npb25z
XzIwMTkjQV9Kb3VybmV5X3Rocm91Z2hfVW5pa3JhZnQuMjdzX0J1aWxkX1N5c3RlbQ0KU2ltb24N
Cg0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvRGVzaWduX1Nlc3Npb25zXzIwMTkj
RXhwb3NpbmdfaGFyZHdhcmUtYmFja2VkX0NQVV90aW1lcnNfdG9fbGltaXRfb3ZlcmhlYWRfZnJv
bV9YZW4uMjdzX3NvZnR3YXJlX3RpbWVycw0KUnlhbiwgQ2hyaXN0b3BoZXINCg0KaHR0cHM6Ly93
aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvRGVzaWduX1Nlc3Npb25zXzIwMTkjTGl2ZVBhdGNoX2lt
cHJvdmVtZW50c19hbmRfZmVhdHVyZXMNClBhd2VsDQoNCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0
Lm9yZy93aWtpL0Rlc2lnbl9TZXNzaW9uc18yMDE5I1hlbl9BZHZlbnR1cmVzX2luX0VkZ2VfQ29t
cHV0aW5nDQpSaWNoDQoNCmh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL0Rlc2lnbl9T
ZXNzaW9uc18yMDE5I1J1bi10aW1lX2NvbnRyb2xfb2ZfU3BlY3VsYXRpdmVfbWl0aWdhdGlvbl9m
YWNpbGl0aWVzDQpTZXJnZXkNCg0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvRGVz
aWduX1Nlc3Npb25zXzIwMTkjQV9uZXdfYm9va19vbl9YZW4uM0YNCldlaQ0KDQpodHRwczovL3dp
a2kueGVucHJvamVjdC5vcmcvd2lraS9EZXNpZ25fU2Vzc2lvbnNfMjAxOSNOZXN0ZWRfdmlydHVh
bGl6YXRpb24NCkRhbmllbA0KDQpodHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9EZXNp
Z25fU2Vzc2lvbnNfMjAxOSNNdWx0aS1kb21haW5fYnVpbGRfc3lzdGVtDQpBbmRyaWkNCg0KaHR0
cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvRGVzaWduX1Nlc3Npb25zXzIwMTkjWGVuX2h5
cGVyY2FsbF9BQklfcmV3b3JrDQpKdWxpZW4NCg0KaHR0cHM6Ly93aWtpLnhlbnByb2plY3Qub3Jn
L3dpa2kvRGVzaWduX1Nlc3Npb25zXzIwMTkjWGVuX29uX1JJU0MtViANClJpY2gNCg0KUmVnYXJk
cw0KTGFycw0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
