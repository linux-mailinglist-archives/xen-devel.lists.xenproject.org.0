Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8C4ED943
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:06:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296906.505569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtZ8-0008OM-24; Thu, 31 Mar 2022 12:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296906.505569; Thu, 31 Mar 2022 12:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZtZ7-0008Lh-UV; Thu, 31 Mar 2022 12:06:13 +0000
Received: by outflank-mailman (input) for mailman id 296906;
 Thu, 31 Mar 2022 12:06:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJRK=UK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nZtZ6-0008La-M8
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 12:06:12 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3f95211-b0ea-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 14:06:10 +0200 (CEST)
Received: from DB7PR03CA0107.eurprd03.prod.outlook.com (2603:10a6:10:72::48)
 by VE1PR08MB5007.eurprd08.prod.outlook.com (2603:10a6:803:10c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Thu, 31 Mar
 2022 12:06:08 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::ac) by DB7PR03CA0107.outlook.office365.com
 (2603:10a6:10:72::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.22 via Frontend
 Transport; Thu, 31 Mar 2022 12:06:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 12:06:07 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Thu, 31 Mar 2022 12:06:07 +0000
Received: from 097ad0b26c65.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49C330E5-7316-4249-9976-6D735336E5C1.1; 
 Thu, 31 Mar 2022 12:06:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 097ad0b26c65.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 31 Mar 2022 12:06:00 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM9PR08MB7291.eurprd08.prod.outlook.com (2603:10a6:20b:436::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 12:05:59 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 12:05:58 +0000
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
X-Inumbo-ID: f3f95211-b0ea-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjKb2H8J3NmCttTZe7q9rioXkJslGBgXsPhk+4Tacfw=;
 b=PlVYgFbuHFr/YMn+xvfuw1IF8n4fBVGmSm8oOlW4fRSoLoi71Lun/So4Y59yKQ1fa8wUIzpmy9o58IQF+MtXLCnNoAQaWWoGvfzRnTjjv6k54tssku784KiiL5dAjgZW1rUivliXE4Wvhk56Tm3I0nQ55BbxSMNyTHiTVUMekqw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3afbf11788d8c29
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRLhS7Wcce7PhmQ5ki4EW/4p3flxyja9K/bI1ombBOsr/Hy7xB5VmEbI3ftwkgwAUTSvCdzEfP8SkdVZG18af3j1meELdmX5D955totcGhNvazxadbFzVwhsVkduni5U0nLM01GyIvPd7btink6v6ncBm/gK3o9LNK0AXECEEDGIRqFnX46sFU8r3OgmWFwOxVCdI1R/xQlujgVEgE5lh6VvzZfrxbncMHjZ3WYUDgldB1cnRiRbjQy9gahHquVz+T7pWRreBZSIyAgecE5YuO4dBBtLvS1o72gVE43C2Z2HVY7751iSWFe2Z0Uy3PnvuKKO7AyLKNGUm/w/s72yWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjKb2H8J3NmCttTZe7q9rioXkJslGBgXsPhk+4Tacfw=;
 b=Wba7xWHEuU28KJJZ7GZDiEGkSEKweM2J7ygGmH48tNbiBRDK5fwgVGQwTvkQ9LGA69Tbv1n6TZB5I/Z1MlgQsQFZmc5ZdK1Lp5wMOYiChTu3wzudPerl5TT6fipSENUODsR/Qzaj6KIap1a5MQZ+6TsvFJJYMMY6X04/H/krLj1+m0IbsfwzSnh+SsQKHM/odbWD+B8VrcRyem8ex0biCqKYuxkjrm3TBlYsmrUA6f1s1q3+d4MgQzo3/cYE83gPQURfHi6rqbUd70eKdQX/XUxFfk3mt2Hk7iveAiHyAwR+WREhmExvfZbsiKv8MhAOaCvJH2DSNQlADsKIIfKhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjKb2H8J3NmCttTZe7q9rioXkJslGBgXsPhk+4Tacfw=;
 b=PlVYgFbuHFr/YMn+xvfuw1IF8n4fBVGmSm8oOlW4fRSoLoi71Lun/So4Y59yKQ1fa8wUIzpmy9o58IQF+MtXLCnNoAQaWWoGvfzRnTjjv6k54tssku784KiiL5dAjgZW1rUivliXE4Wvhk56Tm3I0nQ55BbxSMNyTHiTVUMekqw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it
Thread-Topic: [PATCH v2] Grab the EFI System Resource Table and check it
Thread-Index: AQHYRHEH4zzX/uDlcEa4/lbFmRQ7HKzZEkOAgABR+QCAAAI8AA==
Date: Thu, 31 Mar 2022 12:05:58 +0000
Message-ID: <C06993F9-42E5-4048-B698-2D4C825D8FA1@arm.com>
References: <YkS3FthpZU0xQ2Y7@itl-email>
 <783D6789-9BC6-49BC-8345-478A862083E2@arm.com> <YkWXszMR0/b3BcZg@itl-email>
In-Reply-To: <YkWXszMR0/b3BcZg@itl-email>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1dea85af-20c6-48d3-5c31-08da130ed69b
x-ms-traffictypediagnostic:
	AM9PR08MB7291:EE_|DB5EUR03FT026:EE_|VE1PR08MB5007:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5007E73A92C290AFEA046559E4E19@VE1PR08MB5007.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F7DzzeioLoQU8DEIhXrzB2ZTL2ONpmHF8TxlUMos+wUlOaNrQoRbaVD2z1rZOjB8A+GzXWc3708wobmD/MFrig54batNldVPacKyOFyRRefRdYVHIczTnrrhsTbPvEjYeVoVqcUd4+bUxkP2gb+/Tv+ST7jP+199lDXddqe361ILTMMMcLhTrU2grE0PWrCxWHrNpKaGlSR3qp0b0SHrjHvoVYqtFiFi11skzqGIFszft3UEBSDIi6FqD+b1QR7zXeVsjp/H78lYGZehUvWcS5n9JMh4FQ4agVI11VBJ7AnnqWZ8mwbPnHX1mOmPL7NGj3Shw1oFTqeve+/lK/7sHCDcExVw7QNeQxuKiPOo9e+HdIc0aPwwsF9I6hBKuypsy1bAaSleRjfKmINhrcQ4gE980LtMo4iUCDTgQb2c/po02W6I1vWoe1ZE8vl3L9Q0rTRJKXqDpK8kx2tvw2CgvybW5aJk3bvbJ8XQHQAPt5qItaKLe6LynQVTRnRN4i0bLXPD4D1wNdnrGvGi4fKpyPT4SgTr/UrNZT+e4uV+ufem7VmXigs+EgoI3IdeuDHJXsdB8ras1iwtL3G17AwNgQlb/7XjA1AZmuK5VyGFKXQccutXTNLgpsc1VM3nPZq6sb97ErSaLSGnTLQWltvs1OWoowIZiHINGNeH68VHlpW0zMndYGkkc1bhn6UYxOYVaiHX5uihu/e0uJFL17zVZuy5cba6ieIQZv6SVluR9NxQ2tGpwxC3+JPdLyBaGIub
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(66556008)(83380400001)(64756008)(66446008)(66476007)(8676002)(38100700002)(91956017)(66946007)(4326008)(33656002)(38070700005)(186003)(76116006)(26005)(86362001)(2616005)(71200400001)(53546011)(6486002)(6512007)(6506007)(122000001)(508600001)(2906002)(5660300002)(36756003)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BFC0FF48C1F434F8E281E26672EBFBA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7291
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f8920a3a-b4d9-4404-44c5-08da130ed162
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QSyw/QWL100gdFmXxp8gY+XFVvcApOHR9UXdnGf5fKM8dqIkF5kW8rYNNEsOj3yy0Cmg0Ej28nMrk9ndHtpuXaABt2mKCGGE7UtV+oak1bkzunCT5HN7qEdWlAtxUerzVJdYHTN9hQ/2J511d7kibFsTxyGY3AgcdVcA2L/tiXn9nhgJ5wZpPAWKQlwfvcbmZ7JDFFs5x2uzkoWXemw6BUWhHovEyF26snsWAUCl+HU1aRsE4D2RfqLKmIXu7h3lfSQuBZnxgen75r7plrDGV3qTPy9btlQVgpTu4HN53f7/Sw5Fl/8vsKPAQJe3pLJhMXwfcGMWihHOqJXk7jasIb5XdrdKw3+izrnmKBNnABPHQcBNdTwg1GUy7+M1cebOVxJBkpdNeni6gq5LEnnppnjy+Q+TxwPpaa7/owQ4WFSgs6BVUXswQ7sJKWj0Ci4ia2fgiVacS3oLTMSGxqy0ApZrRrDg+gYjHUotsLghrNeYL78tdhZzu7JYJM/R1UQDWdPw8laFaLhTG85sl49nlqh4T4Z2qC1DmjkeaLTE76rwZBhGG0sOw+5zmmSfdFjBG7mye8IY1vP0ZEqNztN6LXeo+OriXjfh4FkossSKz5WzzgJ+3ryoorck5kUU6NvFlnEAVQDPwFeJJ16x/jeLA0vpS1wm8NJVmBd4mR5h5T8pALCVbMwbZYwKORU9Jhkb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6486002)(5660300002)(83380400001)(33656002)(8936002)(47076005)(316002)(356005)(36860700001)(81166007)(508600001)(2616005)(70206006)(36756003)(82310400004)(6506007)(26005)(186003)(6512007)(70586007)(2906002)(336012)(53546011)(4326008)(40460700003)(86362001)(8676002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 12:06:07.7166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dea85af-20c6-48d3-5c31-08da130ed69b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5007

DQoNCj4gT24gMzEgTWFyIDIwMjIsIGF0IDEyOjU3LCBEZW1pIE1hcmllIE9iZW5vdXIgPGRlbWlA
aW52aXNpYmxldGhpbmdzbGFiLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUaHUsIE1hciAzMSwgMjAy
MiBhdCAwNzowNDozNEFNICswMDAwLCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gSGksDQo+PiAN
Cj4+PiANCj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oIGIveGVu
L2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oDQo+Pj4gaW5kZXggNDU4Y2ZiYmVkNC4uMzk4YTI0MTFh
MSAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgNCj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgNCj4+PiBAQCAtMTg3LDcgKzE4Nyw4IEBAIHN0
YXRpYyBib29sIF9faW5pdCBtZW1pbmZvX2FkZF9iYW5rKHN0cnVjdCBtZW1pbmZvICptZW0sDQo+
Pj4gDQo+Pj4gc3RhdGljIEVGSV9TVEFUVVMgX19pbml0IGVmaV9wcm9jZXNzX21lbW9yeV9tYXBf
Ym9vdGluZm8oRUZJX01FTU9SWV9ERVNDUklQVE9SICptYXAsDQo+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBVSU5UTiBtbWFwX3NpemUsDQo+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFVJTlROIGRlc2Nf
c2l6ZSkNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgVUlOVE4gZGVzY19zaXplLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25zdCBFRklfTUVNT1JZX0RFU0NSSVBUT1IgKmNvbnN0IGVzcnRf
ZGVzYykNCj4+PiB7DQo+Pj4gICAgaW50IEluZGV4Ow0KPj4+ICAgIEVGSV9NRU1PUllfREVTQ1JJ
UFRPUiAqZGVzY19wdHIgPSBtYXA7DQo+Pj4gQEAgLTE5OSw2ICsyMDAsNyBAQCBzdGF0aWMgRUZJ
X1NUQVRVUyBfX2luaXQgZWZpX3Byb2Nlc3NfbWVtb3J5X21hcF9ib290aW5mbyhFRklfTUVNT1JZ
X0RFU0NSSVBUT1IgKg0KPj4+ICAgICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlMb2Fk
ZXJDb2RlIHx8DQo+Pj4gICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUxvYWRlckRh
dGEgfHwNCj4+PiAgICAgICAgICAgICAgKCFtYXBfYnMgJiYNCj4+PiArICAgICAgICAgICAgICAg
ZGVzYyAhPSBlc3J0X2Rlc2MgJiYNCj4+IA0KPj4gSSB3YXMgZ29pbmcgdG8gdGVzdCBpdCBidXQg
dGhpcyBsaW5lIGlzIGJyZWFraW5nIGFybSBidWlsZC4NCj4gDQo+IE5vdCB0b28gc3VycHJpc2lu
ZzsgSSBkb27igJl0IHRoaW5rIEkgYWN0dWFsbHkgYnVpbHQgdGhpcyBmb3IgQVJNLiAgQ2FuDQo+
IHlvdSBwb3N0IHRoZSBlcnJvciB5b3UgZ2V0PyAgSeKAmWxsIHNlbmQgYSB2MyBvbmNlIHRoYXQg
aXMgZml4ZWQuDQoNCkkgdGhpbmsgSSBjbGVhbmVkIG15IGxvZ3MsIGJ1dCBpdCB3YXMgYW4gZWFz
eSBvbmUgbGlrZSDigJxkZXNjIGlzIG5vdCBkZWZpbmVk4oCdLA0KcHJvYmFibHkgeW91IHdlcmUg
bG9va2luZyBmb3Ig4oCcZGVzY19wdHLigJ0/DQoNCg0K

