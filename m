Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E7137C1CA
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 17:04:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126289.237744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqPd-0006zb-3L; Wed, 12 May 2021 15:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126289.237744; Wed, 12 May 2021 15:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgqPc-0006xh-W7; Wed, 12 May 2021 15:04:36 +0000
Received: by outflank-mailman (input) for mailman id 126289;
 Wed, 12 May 2021 15:04:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIkv=KH=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1lgqPb-0006xY-4q
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 15:04:35 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44798e2b-f173-4139-8fc8-ff77527bbcd2;
 Wed, 12 May 2021 15:04:34 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 44798e2b-f173-4139-8fc8-ff77527bbcd2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620831874;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XfrM3QD/84DYsI1vmmrpIh9pwqCM+vWCmFicTrB9Mwk=;
  b=V8byvXzg2W31zjBX2LTAQc+7WwjzAcL+qI9GoQHxW8Pb5uEz09XjmaON
   xTkN5LPfanihK0E/6OJOsdk0WTHnBau6XGdIpHaRNDHj8OVYtF/4kxL3b
   qL84497wTuL4wgNMnHt8GhMIz2EBFWj74PRKzpTqZq2tjzZFUdlARy5kK
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7buVpZ3J6iml1QF7cMyc/n7430L9oeNjIzCY8cC+XQgPLp0dh+GhxuOQgJ0fC6g5fTkd3isLaM
 SFrJFKtWtnzEFt8DJN5zEHGshGcXehcoHXCptao4AqpmWxqfsMDHOR+tPIzaOx0PUPwtBHY/IH
 +qFQsXTD8DHzh7Rz/iHihxpakD73UWGMo5ZtE0IPH5jwd4wyhZRqnnKgApq/RP+CAv3MJruqxj
 B3pmit51gJ9F76dpUqy9/bebzMiKxHN/4pH2E1Fsmw6rtGhTi/R6uVFYnes5cP0q1kIde9Js75
 xsg=
X-SBRS: 5.1
X-MesageID: 44029392
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8yQTGq8/M6ORRYjkHlhuk+AiI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHvJYVMqMk3I9uruBEDtex3hHP1OkOws1NWZLWrbUQKTRekP0WKL+Vbd8kbFh4xgPM
 lbEpSXCLfLfCVHZcSR2njFLz73quP3j5xBho3lvglQpRkBUdAG0+/gYDzraXGfQmN9dPwEPa
 vZ3OVrjRy6d08aa8yqb0N1JdQq97Xw5evbiQdtPW9e1DWz
X-IronPort-AV: E=Sophos;i="5.82,293,1613451600"; 
   d="scan'208";a="44029392"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXdHCXaETK534/OomAp0UdL2Fay5N55ZAoKd2rSAQtBqiuC4WrTuezwEsMzK3ZF/DNZo5RtbZDUC/G4rToTGPvZtbHRSnDiMWeDx/WfxEy1eX4dgtbwKeCgZWFLvR+KyZt0VEResEJ4byYZywnWigg6nqzH/mEacJ2xqbe9SnyL00VEwRQiPuNzkTDq/kK/U+0ieROOTFdgOvnmQKsV9QrPz3vzxaHD/Ott0h9QX6X1BGapBIHLoLyYEeoxnHSD/muYpY8NIhY1Ox5t+g9dZfEQW9bcWAN8cp7yZwLos6G/f6kie3btBwTmaFE9j8i0s+v1txFeDonIC27vGp6RRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfrM3QD/84DYsI1vmmrpIh9pwqCM+vWCmFicTrB9Mwk=;
 b=kOkit8Gii5bCESK2UrzBaykQ+s7hxRvYdXtSrQeDWEPFyl/lU19QTzzHrrpwl+rZvEuF/Ojb1+grf8mtb1qNuMVN2VbjSpEP273wW5MuLqwaDJlEaxiz82TFTjMwj/58NunN6iT0o5czip+gDISAvNP9iKpJa3KjRxDEl6Y9P0Ct+riTO9+Qc1ZGluPWBOF5JzltIhrR0dQVuCgnQJL5AUpGIy9ADM5N4xyKT0n8QVIyIfYQR5AeG2kOqFKpbOvXt5WXv08jXzwUZS4xF2UKlYf3nBq6ZMlDUzqpXsDxB9QFUZQJANGvwQCPANhO1EFgKyKkvgW7JdjfTwzjBRSBKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfrM3QD/84DYsI1vmmrpIh9pwqCM+vWCmFicTrB9Mwk=;
 b=TN33zANNyETdtrN0TUNxkLeBlO7aVGW9F2HwoJIXP+wRTP6l9VcJOLY9hGPIBO8EDGIrpK9+nnACOx/wz0CG8OWyqGoqb0r93us0tTsgI4Obm7L+0pTWTQ9WB/JFERmeKF7tRXvh4ZsKomqJ+RZR9Z9+ywDD9mqADaHa5vaSbmk=
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org"
	<julien@xen.org>, "jgross@suse.com" <jgross@suse.com>, "wl@xen.org"
	<wl@xen.org>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "dave@recoil.org"
	<dave@recoil.org>, George Dunlap <George.Dunlap@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>
Subject: Re: [PATCH v2 00/17] live update and gnttab patches
Thread-Topic: [PATCH v2 00/17] live update and gnttab patches
Thread-Index: AQHXRpBYbSP9+kXyy06RGaCma1VeS6retOQAgADsBACAACz3AIAAJTAA
Date: Wed, 12 May 2021 15:04:25 +0000
Message-ID: <a61829312384fa5cf3cd170dc97a12a55eed4598.camel@citrix.com>
References: <cover.1620755942.git.edvin.torok@citrix.com>
	 <c744d834-659a-e361-df97-128032402950@citrix.com>
	 <7c1a9a8b317fcbc778acaa218ee96e01d15b98d5.camel@citrix.com>
	 <bbd8ccf8-6bb4-7cc0-515d-1f14cd4404b7@citrix.com>
In-Reply-To: <bbd8ccf8-6bb4-7cc0-515d-1f14cd4404b7@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.36.4-0ubuntu1 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4995a421-bab7-4d19-f04e-08d915573b88
x-ms-traffictypediagnostic: SJ0PR03MB5902:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR03MB5902B87B188BED8A84370B689B529@SJ0PR03MB5902.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RFjlALXB43q3C06wo9TeplTHgFyt1AK3rfRiU7Nr1dUX8QIwpO5wivmpbdabIjEZ9/a78rUjC07LB/v4kCn4qRUFyHTPms3O8FR1DL2g1qPvsPYiqz9WUOvE266TSCLdpup3cQNflyy0/SobTjK0NpSqmI3HnErBkIaiTJrpENClNj3IJAiQNviKdzenCnmCOw7wf7arFAk9XI+9fdY9kClrittaTmHKANhudkimrvn0PwXn5980VEKtQZzFoaeBh77R2TGpLZHAjMb4mLLCg4lucpO17FOxm67YVFuo4KKBUezDKnXVn7S5lGAZoAc8/afdT2s1cv5WB4Q5A4QeuWRg45ObR6g2pwmNawuE3LI9gqKktlj0JQdVMnCD3vKBD8DkqQO7PrOHdDQ9eV9WbcBwEU7i7lGaaMl4tKSg9dq9db02GranUAb0ngpJ8WhCDYLVyg4iN/clA91+KdLZlub5lMVnvtrQRSubFQ7Nchz3W3MKpESv24l6MzP1yrvX3COLDeErdFA7doDGrGquNEAvkdGocITp5IxKDhmND0VROtHI+Hjn05Gd/os6zW6FKiB4wBzpMIkBcRzEtV8CP2qcBMTsbHqfRkynECDgSvI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5888.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39850400004)(396003)(64756008)(36756003)(6512007)(66446008)(186003)(107886003)(66946007)(110136005)(86362001)(6486002)(38100700002)(122000001)(316002)(26005)(4326008)(478600001)(2616005)(91956017)(66556008)(2906002)(71200400001)(66476007)(6506007)(54906003)(76116006)(5660300002)(8936002)(8676002)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SG9TdWlMRXVGMERleVoxWVFmZnErTmNTY3lYb2c3NzZNQjh0OWEvdWRnQ0lL?=
 =?utf-8?B?TW5kQVpVTDhpQ01kalYxS3hVbTFPVk10VVkzelJabTZNKy9ZQ09MSEZTVGw5?=
 =?utf-8?B?aVFKRDVaTkR0dk5URzVWbW9nR0hORjlKaThlL2wwd2NmaW1NMTJuVXNhOTlS?=
 =?utf-8?B?cVo2RlRNVjhQSFBIdERkYkZKZWRXVUtQWjlsS2VuU3RObWtOQkJjQzNkOFJV?=
 =?utf-8?B?T2JjSmN3MGlPcU1BaVhpSXF4N2xJdHFGS2VTNVQvQTY1djl2TnhjTTBnQTJv?=
 =?utf-8?B?dHVyTUZ2aUtPbEF3UU8xcklFd01QdEUxYnFRNDk4VnpPalpib05mYnZWZ2Uv?=
 =?utf-8?B?L2lNbGorVWttL3dVMGFYQmt2WUlLLzhLMmkvOHZ3aVFFZ3dueXhmaG1ZemlD?=
 =?utf-8?B?MnkzTEtHd2hHaDR4TldHMGxJR0lJTnI2dnRlcjRkdTU4SUdEWFZTSU1kckkw?=
 =?utf-8?B?RU9sMjh3b1ZrWDFnMlhmVVI4RFdnOGNndEhxMjRGVEpYcW4xSDZ6TmYrbDhG?=
 =?utf-8?B?OHZDSkRrN21qSDJLbDdNSGFDU1JMT1dzNGRFY0VlSUh2MThueGc3MWI4K2Zt?=
 =?utf-8?B?MUVCRjFjcE1FY2V4VDZCckNhdko4MTdWYytyY2crNHdtc1VyMGhFMUVwYWx2?=
 =?utf-8?B?WTRjY05iMGdCSDNlQTZrWmQzN3ZFQzgrSGh3YlFSVnd4UUJqY0hkSnlGMk5X?=
 =?utf-8?B?aWV3V1BLQ0JZRTgyMmg5L1BIUHF5MDZNYTl3UGdmRGhUWjJwNFhmSFBWZGJV?=
 =?utf-8?B?dThYaDc2ODgwTkFaS2l2a08vVnNXa3ZzK0FGbXpCVFgvS0tPbzhxRTFLNjhV?=
 =?utf-8?B?Qmh0aGpUQklGZUJ4Lzd2b1JCOEwrU0JFLzB3WTdDVXdYMDBsbWxIc0crQlRl?=
 =?utf-8?B?VkhnNUI0TTZocmtGUmhOZ2tIbWVGTzBkWDZQQXlVbm92QlphTExkbVNwc3BX?=
 =?utf-8?B?RkxYWmMwei8wZWgvRUljV3E1M1VzVEpPT0M2TUYvdERVeElsckRFbjRTcTky?=
 =?utf-8?B?a0RzQWZnSjNwdGhRWEJZZ0FyZm1JRW5YRDFITlZiak4raCtYL21xTE05QlFB?=
 =?utf-8?B?cnZpWlZWUGYrNE42c1QyemwrOHRkWHRneDRlZ3hpWTlaSEpqa09yK1N6ZG5u?=
 =?utf-8?B?TzZDV2JHNXRNSU94eUVHQmR0QTVRRW9ZMWlIbk1hb3ZTZnVQZzNpTnZ3bnE0?=
 =?utf-8?B?N0xUWGZSaTZ1SlgxWGJYUG9sc0xzQ1FoY2JHdnhVdUFRNTZxK1dSWTF3bllL?=
 =?utf-8?B?QnZWVk9JL3gyNk9jZUtsMWpvM2w0ODcvTmFvcmxoTVJxVkx4a1NzWDRYY1M4?=
 =?utf-8?B?TjkyY3ZzdVBBZE1Zb0dUc1dwUEFzck53MmpRSUdEWXI5YmZzamJIWVY3SkE1?=
 =?utf-8?B?QTN2Wlc4TTFWejBtbFBDVlpITDh2MnBOZEkxZWV0d04yVTBuT1VhY2NTRzQx?=
 =?utf-8?B?L0RLeEh3RVVNNE9sTnAyLy9mMXJpQ0grK1FEd3Z1T252anhhLy9BMFBuUE5F?=
 =?utf-8?B?dGNkWm52bFZpdmpPbTV2MTBwUTRIblF2cXFlRjRQUHUxN3MxTFB4UlB4eThm?=
 =?utf-8?B?RVRnNlUvcGNRNW5maC9icm5vcm9hNDNsS1gydm9VaHQvd25QRnBxMzZ0aC9X?=
 =?utf-8?B?V0hPRno1RUthaFZsei9tVHlWbEV0OVkwNWVzUzFVQXJ1MU9pd2ZvL3FnZHdo?=
 =?utf-8?B?ZDZqbHlLUmtaRDVIMHNFa2duRjl4Qms1N0xoTTUwelhBTVFiVmoyWlhUZEFP?=
 =?utf-8?Q?zcJ5dNuopWcqYGs5f2RrExckKW3W9lXPD89a35U?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <853665380688AB439F8409152FAFF17C@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5888.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4995a421-bab7-4d19-f04e-08d915573b88
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 15:04:25.2215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dcXOIWB7ffVn2FeZz5kc/fNmC/TSKbq9JEtf17mqAvkQzobxLPZ85VejSW7/745IGywBBXic+DdLBgWBJFewcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5902
X-OriginatorOrg: citrix.com

T24gV2VkLCAyMDIxLTA1LTEyIGF0IDEzOjUxICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBPbiAxMi8wNS8yMDIxIDExOjEwLCBFZHdpbiBUb3JvayB3cm90ZToNCj4gPiBPbiBUdWUsIDIw
MjEtMDUtMTEgYXQgMjE6MDUgKzAxMDAsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+ID4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwveGVuc3RvcmVkL2Rpc2subWwNCj4gPiBiL3Rvb2xz
L29jYW1sL3hlbnN0b3JlZC9kaXNrLm1sDQo+ID4gaW5kZXggNTk3OTQzMjRlMS4uYjc2NzhhZjg3
ZiAxMDA2NDQNCj4gPiAtLS0gYS90b29scy9vY2FtbC94ZW5zdG9yZWQvZGlzay5tbA0KPiA+ICsr
KyBiL3Rvb2xzL29jYW1sL3hlbnN0b3JlZC9kaXNrLm1sDQo+ID4gQEAgLTE3Niw3ICsxNzYsNyBA
QCBsZXQgd3JpdGUgc3RvcmUgPQ0KPiA+ICAgICAgICAgICAgIG91dHB1dF9ieXRlIGNoIGkNCj4g
PiAgDQo+ID4gICAgICAgICBsZXQgdzMyIGNoIHYgPQ0KPiA+IC0gICAgICAgICAgIGFzc2VydCAo
diA+PSAwICYmIHYgPD0gMHhGRkZGX0ZGRkYpOw0KPiA+ICsgICAgICAgICAgIGFzc2VydCAodiA+
PSAwICYmIEludDY0Lm9mX2ludCB2IDw9IDB4RkZGRl9GRkZGTCk7DQo+IA0KPiBJbiB0aGUgY2Fz
ZSB0aGF0IHYgaXMgMzIgYml0cyB3aWRlLCBpdCB3aWxsIHVuZGVyZmxvdyBhbmQgZmFpbCB0aGUg
dg0KPiA+PQ0KPiAwIGNoZWNrLCBiZWZvcmUgdGhlIHVwY2FzdCB0byBJbnQ2NC4NCg0KSSdsbCBo
YXZlIHRvIHJldmlldyB0aGUgY2FsbGVycyBvZiB0aGlzLCBJIHRoaW5rIG15IGludGVudGlvbiB3
YXMgdG8NCmZvcmJpZCBkdW1waW5nIG5lZ2F0aXZlIHZhbHVlcyBiZWNhdXNlIGl0IGlzIGFtYmln
b3VzIHdoYXQgaXQgbWVhbnMuDQpJbiBjYXNlIHlvdSBhcmUgcnVubmluZyBvbiA2NC1iaXQgdGhh
dCBpcyBtb3N0IGxpa2VseSBhIGJ1ZyBiZWNhdXNlIEkNCnRoaW5rIG1vc3QgMzItYml0IHZhbHVl
cyB3ZXJlIGRlZmluZWQgYXMgdW5zaWduZWQgaW4gdGhlIG1pZ3JhdGlvbiBzcGVjDQpvciBpbiB0
aGUgb3JpZ2luYWwgeGVuIHB1YmxpYyBoZWFkZXJzIChJJ2xsIGhhdmUgdG8gZG91YmxlIGNoZWNr
KS4NCg0KSG93ZXZlciBpbiBjYXNlIG9mIGEgMzItYml0IHN5c3RlbSB3ZSBjYW4gaGF2ZSBuZWdh
dGl2ZSB2YWx1ZXMgd2hlcmUgYW4NCm90aGVyd2lzZSB1bnNpZ25lZCAzMi1iaXQgcXVhbnRpdHkg
aW4geGVuIGlzIHJlcHJlc2VudGVkIGFzIGFuIG9jYW1sDQppbnQsIG9yIGV2ZW4gc2lsZW50bHkg
dHJ1bmNhdGVkIChpZiB0aGUgeGVuIHZhbHVlIGFjdHVhbGx5IHVzZXMgYWxsIDMyLQ0KYml0cywg
YmVjYXVzZSBPQ2FtbCBpbnRzIGFyZSBvbmx5IDMxLWJpdHMgb24gMzItYml0IHN5c3RlbXMsIG9u
ZSB3b3VsZA0KaGF2ZSB0byB1c2UgdGhlIGludDMyIHR5cGUgdG8gZ2V0IHRydWUgMzItYml0IHF1
YW50aXRpZXMgaW4gb2NhbWwgYnV0DQp0aGF0IGNvbWVzIHdpdGggYWRkaXRpb25hbCBib3hpbmcg
YW5kIGEgbW9yZSBjb21wbGljYXRlZCBzeW50YXgsDQpzbyBpbiBtb3N0IHBsYWNlcyBpbiBYZW4g
SSBzZWUgdGhlIGRpZmZlcmVuY2UganVzdCBiZWluZyBpZ25vcmVkKS4NCg0KUGVyaGFwcyB0aGlz
IHNob3VsZCBmb3JiaWQgbmVnYXRpdmUgdmFsdWVzIG9ubHkgb24gNjQtYml0IHN5c3RlbXMNCih3
aGVyZSB0aGF0IHdvdWxkIGJlIGEgYnVnKSwgYW5kIGFsbG93IGl0IG9uIDMyLWJpdCBzeXN0ZW1z
ICh3aGVyZSBhDQpuZWdhdGl2ZSB2YWx1ZSBtaWdodCBiZSBsZWdpdGltYXRlIG9yIGEgYnVnLCB3
ZSBjYW4ndCB0ZWxsKS4NCkNoZWNraW5nIFN5cy53b3JkX3NpemUgc2hvdWxkIHRlbGwgdXMgd2hh
dCBzeXN0ZW0gd2UgYXJlIG9uLg0KDQpCZXN0IHJlZ2FyZHMsDQotLUVkd2luDQo=

