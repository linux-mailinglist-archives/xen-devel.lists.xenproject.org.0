Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB38F1E6DAB
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:30:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQ6o-0001Yv-E5; Thu, 28 May 2020 21:30:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oNcS=7K=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jeQ6n-0001YS-5B
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:30:37 +0000
X-Inumbo-ID: 77a57f42-a12a-11ea-8993-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77a57f42-a12a-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 21:30:36 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: EusOiouMvTaXx6zJNG9zrV9DEYJA66X4YRaJTu37Vo6llw/tyaBW5sc2+NrQZ8bcuiLDFsS3ja
 QaZixovxj0H6a/3DPFL6fXa5EhywSZBpBVpGSdENY77lZYtJdBBW1cbIBlg/tADl9GVSqDfzHc
 IR1R7Ktkd/nomRp2ID/NdFEjhQembJhGqNs1NUQ9/eUovGESkyLXezi/vCdejNrtq/pevltHJv
 0DaYADBtnOS3fLuCGpO+7L+j965vZsJvK5V5TnCU3r9TERpSdakY+k3+mQceIBrRtL19iw4Cfz
 5Uk=
X-SBRS: 2.7
X-MesageID: 18707096
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,446,1583211600"; d="scan'208";a="18707096"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Call for agenda items for June XenProject Community Call @ 15:00 UTC
Thread-Topic: Call for agenda items for June XenProject Community Call @ 15:00
 UTC
Thread-Index: AQHWNTc1Ql8FFk3g90eJ8vkDj8k8tw==
Date: Thu, 28 May 2020 21:30:29 +0000
Message-ID: <48D62274-9C3A-46C6-B7A0-0B11BC224BC8@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <BC5BB855E3960B4BBE68C2225642209E@citrix.com>
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
Cc: Rian
 Quinn <rianquinn@gmail.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLRG91ZyBHb2xkc3RlaW4=?=
 <cardoe@cardoe.com>, Brian Woods <brian.woods@xilinx.com>,
 Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLQW1pdCBTaGFo?= <amit@infradead.org>,
 Matt Spencer <Matt.Spencer@arm.com>, Bobby Eshleman <bobby.eshleman@gmail.com>,
 Robert Townley <rob.townley@gmail.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 =?utf-8?B?4oCL4oCL4oCL4oCL4oCL4oCL4oCLVmFyYWQgR2F1dGFt?=
 <varadgautam@gmail.com>, Julien Grall <julien@xen.org>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, Kevin
 Pearson <kevin.pearson@ortmanconsulting.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>, Stewart
 Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Olivier
 Lambert <olivier.lambert@vates.fr>, David
 Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpUaGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC90T09LRTcyendJS09pVDA1cXVtZ0k5ZXkvIGFuZCB5b3UgY2FuIGVk
aXQgdG8gYWRkIGl0ZW1zLiAgQWx0ZXJuYXRpdmVseSwgeW91IGNhbiByZXBseSB0byB0aGlzIG1h
aWwgZGlyZWN0bHkuDQoNCkFnZW5kYSBpdGVtcyBhcHByZWNpYXRlZCBhIGZldyBkYXlzIGJlZm9y
ZSB0aGUgY2FsbDogcGxlYXNlIHB1dCB5b3VyIG5hbWUgYmVzaWRlcyBpdGVtcyBpZiB5b3UgZWRp
dCB0aGUgZG9jdW1lbnQuDQoNCk5vdGUgdGhlIGZvbGxvd2luZyBhZG1pbmlzdHJhdGl2ZSBjb252
ZW50aW9ucyBmb3IgdGhlIGNhbGw6DQoqIFVubGVzcywgYWdyZWVkIGluIHRoZSBwZXJ2aW91cyBt
ZWV0aW5nIG90aGVyd2lzZSwgdGhlIGNhbGwgaXMgb24gdGhlIDFzdCBUaHVyc2RheSBvZiBlYWNo
IG1vbnRoIGF0IDE2MDAgQnJpdGlzaCBUaW1lIChlaXRoZXIgR01UIG9yIEJTVCkNCiogSSB1c3Vh
bGx5IHNlbmQgb3V0IGEgbWVldGluZyByZW1pbmRlciBhIGZldyBkYXlzIGJlZm9yZSB3aXRoIGEg
cHJvdmlzaW9uYWwgYWdlbmRhDQoNCiogSWYgeW91IHdhbnQgdG8gYmUgQ0MnZWQgcGxlYXNlIGFk
ZCBvciByZW1vdmUgeW91cnNlbGYgZnJvbSB0aGUgc2lnbi11cC1zaGVldCBhdCBodHRwczovL2Ny
eXB0cGFkLmZyL3BhZC8jLzIvcGFkL2VkaXQvRDl2R3ppaFB4eEFPZTZSRlB6MHNSQ2YrLw0KDQpC
ZXN0IFJlZ2FyZHMNCkdlb3JnZQ0KDQo9PSBEaWFsLWluIEluZm9ybWF0aW9uID09DQojIyBNZWV0
aW5nIHRpbWUNCjE1OjAwIC0gMTY6MDAgVVRDIChkdXJpbmcgQlNUKQ0KRnVydGhlciBJbnRlcm5h
dGlvbmFsIG1lZXRpbmcgdGltZXM6IGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRlLmNvbS93b3JsZGNs
b2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDIwJm1vbnRoPTUmZGF5PTcmaG91cj0xNSZt
aW49MCZzZWM9MCZwMT0xMjM0JnAyPTM3JnAzPTIyNCZwND0xNzkNCg0KDQojIyBEaWFsIGluIGRl
dGFpbHMNCldlYjogaHR0cHM6Ly93d3cuZ290b21lZXQubWUvR2VvcmdlRHVubGFwDQoNCllvdSBj
YW4gYWxzbyBkaWFsIGluIHVzaW5nIHlvdXIgcGhvbmUuDQpBY2Nlc3MgQ29kZTogMTY4LTY4Mi0x
MDkNCg0KQ2hpbmEgKFRvbGwgRnJlZSk6IDQwMDggODExMDg0DQpHZXJtYW55OiArNDkgNjkyIDU3
MzYgNzMxNw0KUG9sYW5kIChUb2xsIEZyZWUpOiAwMCA4MDAgMTEyNDc1OQ0KVWtyYWluZSAoVG9s
bCBGcmVlKTogMCA4MDAgNTAgMTczMw0KVW5pdGVkIEtpbmdkb206ICs0NCAzMzAgMjIxIDAwODgN
ClVuaXRlZCBTdGF0ZXM6ICsxICg1NzEpIDMxNy0zMTI5DQpTcGFpbjogKzM0IDkzMiA3NSAyMDA0
DQoNCg0KTW9yZSBwaG9uZSBudW1iZXJzDQpBdXN0cmFsaWE6ICs2MSAyIDkwODcgMzYwNA0KQXVz
dHJpYTogKzQzIDcgMjA4MSA1NDI3DQpBcmdlbnRpbmEgKFRvbGwgRnJlZSk6IDAgODAwIDQ0NCAz
Mzc1DQpCYWhyYWluIChUb2xsIEZyZWUpOiA4MDAgODEgMTExDQpCZWxhcnVzIChUb2xsIEZyZWUp
OiA4IDgyMCAwMDExIDA0MDANCkJlbGdpdW06ICszMiAyOCA5MyA3MDE4DQpCcmF6aWwgKFRvbGwg
RnJlZSk6IDAgODAwIDA0NyA0OTA2DQpCdWxnYXJpYSAoVG9sbCBGcmVlKTogMDA4MDAgMTIwIDQ0
MTcNCkNhbmFkYTogKzEgKDY0NykgNDk3LTkzOTENCkNoaWxlIChUb2xsIEZyZWUpOiA4MDAgMzk1
IDE1MA0KQ29sb21iaWEgKFRvbGwgRnJlZSk6IDAxIDgwMCA1MTggNDQ4Mw0KQ3plY2ggUmVwdWJs
aWMgKFRvbGwgRnJlZSk6IDgwMCA1MDA0NDgNCkRlbm1hcms6ICs0NSAzMiA3MiAwMyA4Mg0KRmlu
bGFuZDogKzM1OCA5MjMgMTcgMDU2OA0KRnJhbmNlOiArMzMgMTcwIDk1MCA1OTQNCkdyZWVjZSAo
VG9sbCBGcmVlKTogMDAgODAwIDQ0MTQgMzgzOA0KSG9uZyBLb25nIChUb2xsIEZyZWUpOiAzMDcx
MzE2OTkwNi04ODYtOTY1DQpIdW5nYXJ5IChUb2xsIEZyZWUpOiAoMDYpIDgwIDk4NiAyNTUNCklj
ZWxhbmQgKFRvbGwgRnJlZSk6IDgwMCA3MjA0DQpJbmRpYSAoVG9sbCBGcmVlKTogMTgwMDI2Njky
NzINCkluZG9uZXNpYSAoVG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KSXJlbGFuZDogKzM1
MyAxNSAzNjAgNzI4DQpJc3JhZWwgKFRvbGwgRnJlZSk6IDEgODA5IDQ1NCA4MzANCkl0YWx5OiAr
MzkgMCAyNDcgOTIgMTMgMDENCkphcGFuIChUb2xsIEZyZWUpOiAwIDEyMCA2NjMgODAwDQpLb3Jl
YSwgUmVwdWJsaWMgb2YgKFRvbGwgRnJlZSk6IDAwNzk4IDE0IDIwNyA0OTE0DQpMdXhlbWJvdXJn
IChUb2xsIEZyZWUpOiA4MDAgODUxNTgNCk1hbGF5c2lhIChUb2xsIEZyZWUpOiAxIDgwMCA4MSA2
ODU0DQpNZXhpY28gKFRvbGwgRnJlZSk6IDAxIDgwMCA1MjIgMTEzMw0KTmV0aGVybGFuZHM6ICsz
MSAyMDcgOTQxIDM3Nw0KTmV3IFplYWxhbmQ6ICs2NCA5IDI4MCA2MzAyDQpOb3J3YXk6ICs0NyAy
MSA5MyAzNyA1MQ0KUGFuYW1hIChUb2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgNClBlcnUgKFRv
bGwgRnJlZSk6IDAgODAwIDc3MDIzDQpQaGlsaXBwaW5lcyAoVG9sbCBGcmVlKTogMSA4MDAgMTEx
MCAxNjYxDQpQb3J0dWdhbCAoVG9sbCBGcmVlKTogODAwIDgxOSA1NzUNClJvbWFuaWEgKFRvbGwg
RnJlZSk6IDAgODAwIDQxMCAwMjkNClJ1c3NpYW4gRmVkZXJhdGlvbiAoVG9sbCBGcmVlKTogOCA4
MDAgMTAwIDYyMDMNClNhdWRpIEFyYWJpYSAoVG9sbCBGcmVlKTogODAwIDg0NCAzNjMzDQpTaW5n
YXBvcmUgKFRvbGwgRnJlZSk6IDE4MDA3MjMxMzIzDQpTb3V0aCBBZnJpY2EgKFRvbGwgRnJlZSk6
IDAgODAwIDU1NSA0NDcNClN3ZWRlbjogKzQ2IDg1MyA1MjcgODI3DQpTd2l0emVybGFuZDogKzQx
IDIyNSA0NTk5IDc4DQpUYWl3YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4NTQNClRoYWlsYW5k
IChUb2xsIEZyZWUpOiAwMDEgODAwIDAxMSAwMjMNClR1cmtleSAoVG9sbCBGcmVlKTogMDAgODAw
IDQ0ODggMjM2ODMNClVuaXRlZCBBcmFiIEVtaXJhdGVzIChUb2xsIEZyZWUpOiA4MDAgMDQ0IDQw
NDM5DQpVcnVndWF5IChUb2xsIEZyZWUpOiAwMDA0IDAxOSAxMDE4DQpWaWV0IE5hbSAoVG9sbCBG
cmVlKTogMTIyIDgwIDQ4MQ0K4oCL4oCL4oCL4oCL4oCL4oCL4oCLDQoNCkZpcnN0IEdvVG9NZWV0
aW5nPyBMZXQncyBkbyBhIHF1aWNrIHN5c3RlbSBjaGVjazoNCg0KaHR0cHM6Ly9saW5rLmdvdG9t
ZWV0aW5nLmNvbS9zeXN0ZW0tY2hlY2s=

