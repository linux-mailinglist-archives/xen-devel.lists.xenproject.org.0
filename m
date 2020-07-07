Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E72168F2
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jul 2020 11:25:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsjqn-0006J5-FY; Tue, 07 Jul 2020 09:25:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gHK=AS=in.bosch.com=manikandan.chockalingam@srs-us1.protection.inumbo.net>)
 id 1jsjql-0006J0-FN
 for xen-devel@lists.xen.org; Tue, 07 Jul 2020 09:25:15 +0000
X-Inumbo-ID: c1b511ec-c033-11ea-bca7-bc764e2007e4
Received: from de-out1.bosch-org.com (unknown [139.15.230.186])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1b511ec-c033-11ea-bca7-bc764e2007e4;
 Tue, 07 Jul 2020 09:25:12 +0000 (UTC)
Received: from fe0vm1649.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 4B1H8k5ssjz1XLDRG;
 Tue,  7 Jul 2020 11:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=in.bosch.com;
 s=key1-intmail; t=1594113910;
 bh=A4qWJiI7Ti4LOjdFz+6O+vb2tWItS3Ce/gtvptC5txA=; l=10;
 h=From:Subject:From:Reply-To:Sender;
 b=nWIFqBgX97OYYZONIEVtYxo4hfMyhhvUfGl1WpYxGghdUc44zTScp3kdENeQcYBgN
 ksSG8kxhURGuXG9bWEjYxPm7SLjMADpa81kE4q21DF0a77ojUen27o/iwcmCK5vUcm
 CNPib0wvGF8P+9X4NEgcryNGLusva9YACLKCnF1M=
Received: from si0vm4642.rbesz01.com (unknown [10.58.172.176])
 by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 4B1H8k5XYGz3Kf;
 Tue,  7 Jul 2020 11:25:10 +0200 (CEST)
X-AuditID: 0a3aad12-235ff700000028b1-8e-5f043f762674
Received: from si0vm1950.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by si0vm4642.rbesz01.com (SMG Outbound) with SMTP id CA.3C.10417.67F340F5;
 Tue,  7 Jul 2020 11:25:10 +0200 (CEST)
Received: from FE-MBX2060.de.bosch.com (fe-mbx2060.de.bosch.com [10.3.231.165])
 by si0vm1950.rbesz01.com (Postfix) with ESMTPS id 4B1H8k4cQLzW7P;
 Tue,  7 Jul 2020 11:25:10 +0200 (CEST)
Received: from SGPMBX2022.APAC.bosch.com (10.187.83.37) by
 FE-MBX2060.de.bosch.com (10.3.231.165) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Tue, 7 Jul 2020 11:25:10 +0200
Received: from SGPMBX2022.APAC.bosch.com (10.187.83.37) by
 SGPMBX2022.APAC.bosch.com (10.187.83.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1979.3; Tue, 7 Jul 2020 17:25:08 +0800
Received: from SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896]) by
 SGPMBX2022.APAC.bosch.com ([fe80::2d4d:b176:b210:896%6]) with mapi id
 15.01.1979.003; Tue, 7 Jul 2020 17:25:08 +0800
From: "Manikandan Chockalingam (RBEI/ECF3)"
 <Manikandan.Chockalingam@in.bosch.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: RE: [BUG] Xen build for RCAR failing
Thread-Topic: [BUG] Xen build for RCAR failing
Thread-Index: AdZUKc5JeR7gPpESR52uLkZK1kYwO///kucA//9vm+A=
Date: Tue, 7 Jul 2020 09:25:08 +0000
Message-ID: <898ca246818146f2bfce961d6ce9d5c1@in.bosch.com>
References: <1b60ed1cd7834ed5957a2b4870602073@in.bosch.com>
 <48b1ea69-f5c1-4ea2-455c-50bab72bc1da@epam.com>
In-Reply-To: <48b1ea69-f5c1-4ea2-455c-50bab72bc1da@epam.com>
Accept-Language: en-US, en-SG
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.187.56.214]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnkeLIzCtJLcpLzFFi42Lhslorq1tmzxJv8OyGtsWH1e9ZLZZ8XMzi
 wORxZ+lORo+ju38zBTBFcdmkpOZklqUW6dslcGU0nGtnLFgnVrFuSht7A+MT0S5GTg4JAROJ
 T2deMnUxcnEICcxgktjZ+o8FwtnDKHFxygZmCOcDo0T/4nuMIC1CAp8YJc5OdIFIHGSUuPW6
 hwkkwSYQIrFv7w12EFtEoFRiz/tTzCC2sICuRNe52VBxPYmtC/tZIWwriQmrfrJ1MXJwsAio
 SByY5QsS5hWwlphxdzM7xK5ciZY7e8HKOQVsJPbNWg4WZxSQlVh0cxILiM0sIC5x68l8Joh3
 BCSW7DnPDGGLSrx8/I8VwlaUWDZ/FTvIKmYBTYn1u/QhWhUlpnQ/ZIdYKyhxcuYTlgmM4rOQ
 TJ2F0DELSccsJB0LGFlWMYoWZxqU5ZqYmRjpFSWlFlcZGOol5+duYoTEldAOxl8dH/QOMTJx
 MB5ilOBgVhLh7dVmjBfiTUmsrEotyo8vKs1JLT7EKM3BoiTOq8KzMU5IID2xJDU7NbUgtQgm
 y8TBKdXApLc0Vv9n/vU1tVEcUVu+LPgWOlf68BFV85pnpRdE2hQ0jacs4wq6+Fik9ob+2n4J
 490WUffq6yeUx9hGvOLtPKGXqJv5bYfLl6q8/Qx3T3KZZd0rfDll087dCZNPzz69s8Hmmdky
 cbsvL3g3nX3Z/W3LVI46nfzYops3hOe1Kt0PT/Htej3DpvXP91QZWQPXbVZeogrVG5c+WdLe
 zXDAxJHx0+6DJxjit/EytRvkFKW84/N48XZSo9nHkgjX2NANIpkiU4o1Hs0+7GpzILn7zP8P
 BxZz3xRhWszjvp5LwXTe7jnCUn5Gm90jK5267s8ueZ55oTmn0GLd9o6wzvvBz3V7rdQyZUyW
 58o29T1TYinOSDTUYi4qTgQAP2CL+xoDAAA=
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28sDQoNClRoYW5rcyBmb3IgeW91ciBxdWljayBy
ZXNwb25zZS4gSSBhbSB1c2luZyB0aGUgeW9jdG8gdmVyc2lvblt5b2N0b18yLjE5XSBtZW50aW9u
ZWQgaW4gdGhlIGxpbmsuIFN0aWxsIEkgZmFjZSB0aGUgaXNzdWUuDQoNCk1pdCBmcmV1bmRsaWNo
ZW4gR3LDvMOfZW4gLyBCZXN0IHJlZ2FyZHMNCg0KIENob2NrYWxpbmdhbSBNYW5pa2FuZGFuDQoN
CkVTLUNNIENvcmUgZm4sQURJVCAoUkJFSS9FQ0YzKQ0KUm9iZXJ0IEJvc2NoIEdtYkggfCBQb3N0
ZmFjaCAxMCA2MCA1MCB8IDcwMDQ5IFN0dXR0Z2FydCB8IEdFUk1BTlkgfCB3d3cuYm9zY2guY29t
DQpUZWwuICs5MSA4MCA2MTM2LTQ0NTIgfCBGYXggKzkxIDgwIDY2MTctMDcxMSB8IE1hbmlrYW5k
YW4uQ2hvY2thbGluZ2FtQGluLmJvc2NoLmNvbQ0KDQpSZWdpc3RlcmVkIE9mZmljZTogU3R1dHRn
YXJ0LCBSZWdpc3RyYXRpb24gQ291cnQ6IEFtdHNnZXJpY2h0IFN0dXR0Z2FydCwgSFJCIDE0MDAw
Ow0KQ2hhaXJtYW4gb2YgdGhlIFN1cGVydmlzb3J5IEJvYXJkOiBGcmFueiBGZWhyZW5iYWNoOyBN
YW5hZ2luZyBEaXJlY3RvcnM6IERyLiBWb2xrbWFyIERlbm5lciwgDQpQcm9mLiBEci4gU3RlZmFu
IEFzZW5rZXJzY2hiYXVtZXIsIERyLiBNaWNoYWVsIEJvbGxlLCBEci4gQ2hyaXN0aWFuIEZpc2No
ZXIsIERyLiBTdGVmYW4gSGFydHVuZywNCkRyLiBNYXJrdXMgSGV5biwgSGFyYWxkIEtyw7ZnZXIs
IENocmlzdG9waCBLw7xiZWwsIFJvbGYgTmFqb3JrLCBVd2UgUmFzY2hrZSwgUGV0ZXIgVHlyb2xs
ZXINCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxPbGVrc2FuZHJfQW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4gDQpTZW50OiBUdWVzZGF5
LCBKdWx5IDcsIDIwMjAgMTo0MiBQTQ0KVG86IE1hbmlrYW5kYW4gQ2hvY2thbGluZ2FtIChSQkVJ
L0VDRjMpIDxNYW5pa2FuZGFuLkNob2NrYWxpbmdhbUBpbi5ib3NjaC5jb20+OyB4ZW4tZGV2ZWxA
bGlzdHMueGVuLm9yZw0KU3ViamVjdDogUmU6IFtCVUddIFhlbiBidWlsZCBmb3IgUkNBUiBmYWls
aW5nDQoNCg0KT24gNy83LzIwIDEwOjU4IEFNLCBNYW5pa2FuZGFuIENob2NrYWxpbmdhbSAoUkJF
SS9FQ0YzKSB3cm90ZToNCj4NCj4gSGVsbG8gVGVhbSwNCj4NCj4gSSBhbSB0cnlpbmcgdG8gYnVp
bGQgeGVuIGh5cGVydmlzb3IgZm9yIFJDQVIgYW5kIGZvbGxvd2luZyB0aGUgaHR0cHM6Ly93aWtp
LnhlbnByb2plY3Qub3JnL3dpa2kvWGVuX0FSTV93aXRoX1ZpcnR1YWxpemF0aW9uX0V4dGVuc2lv
bnMvU2FsdmF0b3ItWCBzdGVwcy4NCj4NCj4gQnV0IGFtIGZhY2luZyB0aGUgZm9sbG93aW5nIGlz
c3Vlcw0KPg0KPiAxLlNSQ19VUkk9Imh0dHA6Ly92My5zay9+bGt1bmRyYWsvZGV2ODYvYXJjaGl2
ZS9EZXY4NnNyYy0ke1BWfS50YXIuZ3ogaW4gcmVjaXBlcy1leHRlbmRlZC9kZXY4Ni9kZXY4Nl8w
LjE2LjIwLmJiIGlzIG5vdCBhY2Nlc2libGUNCj4NCj4gKk1vZGlmaWNhdGlvbiBkb25lOipTUkNf
VVJJPWh0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL2xvb2thc2lkZS9leHRyYXMvZGV2ODYv
RGV2ODZzcmMtMC4xNi4yMC50YXIuZ3ovNTY3Y2Y0NjBkMTMyZjlkODc3NWRkOTVmOTIwOGU0OWEv
RGV2ODZzcmMtJHtQVn0udGFyLmd6IDxodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9sb29r
YXNpZGUvZXh0cmFzL2Rldjg2L0Rldjg2c3JjLTAuMTYuMjAudGFyLmd6LzU2N2NmNDYwZDEzMmY5
ZDg3NzVkZDk1ZjkyMDhlNDlhL0Rldjg2c3JjLSQlN2JQViU3ZC50YXIuZ3o+DQo+DQpZb3UgY2Fu
IHRyeSB3aGF0IHdlIHVzZSBbMV0uIEFuZCB0aGUgaXNzdWUgeW91IGFyZSBmYWNpbmcgaXMgcmF0
aGVyIFlvY3RvIHJlbGF0ZWQsIG5vdCBSLUNhciBzcGVjaWZpYywgSU1PDQoNClsxXSBodHRwczov
L2dpdGh1Yi5jb20veGVuLXRyb29wcy9tZXRhLXh0LXByb2QtZGV2ZWwvYmxvYi9tYXN0ZXIvcmVj
aXBlcy1kb21kL2RvbWQtaW1hZ2Utd2VzdG9uL2ZpbGVzL21ldGEteHQtcHJvZC1leHRyYS9yZWNp
cGVzLWV4dGVuZGVkL2Rldjg2L2Rldjg2XyUyNS5iYmFwcGVuZA0K

