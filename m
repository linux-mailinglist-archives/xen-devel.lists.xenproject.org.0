Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C71E9431671
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:48:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212015.369753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQBT-0005TF-UI; Mon, 18 Oct 2021 10:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212015.369753; Mon, 18 Oct 2021 10:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQBT-0005Qx-QX; Mon, 18 Oct 2021 10:47:59 +0000
Received: by outflank-mailman (input) for mailman id 212015;
 Mon, 18 Oct 2021 10:47:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J+Bz=PG=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mcQBS-0005On-6S
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:47:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id da0d4083-3000-11ec-82d2-12813bfff9fa;
 Mon, 18 Oct 2021 10:47:56 +0000 (UTC)
Received: from DB6PR07CA0023.eurprd07.prod.outlook.com (2603:10a6:6:2d::33) by
 DB8PR08MB5179.eurprd08.prod.outlook.com (2603:10a6:10:e7::31) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18; Mon, 18 Oct 2021 10:47:52 +0000
Received: from DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::4c) by DB6PR07CA0023.outlook.office365.com
 (2603:10a6:6:2d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.10 via Frontend
 Transport; Mon, 18 Oct 2021 10:47:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT005.mail.protection.outlook.com (10.152.20.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 10:47:52 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Mon, 18 Oct 2021 10:47:52 +0000
Received: from eef06a2ad24a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 390F0E62-FB3A-459D-AC1A-BE15763BB6BD.1; 
 Mon, 18 Oct 2021 10:47:45 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eef06a2ad24a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Oct 2021 10:47:45 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB8PR08MB5258.eurprd08.prod.outlook.com (2603:10a6:10:e0::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Mon, 18 Oct
 2021 10:47:44 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 10:47:43 +0000
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
X-Inumbo-ID: da0d4083-3000-11ec-82d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+NzuueaWOBQNO1DcAK9Wffz37UHWOd65baRCaFge5s=;
 b=Gd+OH91wowzzV2G6ZULPbQKCza/lSUFu/L/EhsHl/nd0fPSerNPLClbGt/xiK2J0UtizMh10ZzPDFBsV/LwUYgnpoza5Aee/UiSiHbafqBn3y90qFYFY+5MKCDT/hiwSAnxhyZVHThKl1hIIZmErQtbHLB4TGb1/00zZnJtc/uY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd61202457f2c40e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Op08nGKsiGFkZnDCahLvEH/ivLot64Q69QM1BbMlhtMlldvMTNE6ZTe0Xf1T7xW1CBiZMUofvKaOa4Iw6kN6VpsR2FalyGxa9KEx1yFkrGhy8Eb30OI3TU1sHq7awArKcopFY75ws4ydHYMb9sUVaGsiXXYjzlK7J/jW7Z2JOT8hbDqvW+/eJHW0m3abZ6kETlNiJDla5F4lJwIP1kk7jS3XAN/0AqvEOKph9yJMIXY0HT0wupOy0UufTFZFuGTSvjEw9FcUMHGkV3C/PZ4TbOGF8Ri6tWtwuMPWQpBWdOdJUVcoqaNho6qO2htexo+d06jWsz8KbHxw4ppbYm4aLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+NzuueaWOBQNO1DcAK9Wffz37UHWOd65baRCaFge5s=;
 b=azfgggcT+dyRhkk4I3ePefE2I+Dqtktllwx8CrhcKx0z2oGeMDBkCihodikTX+T+B8ScKg2B1oytQXSDJTivRil7brwEQlDDKvmdqtVHoH2emgRxVO4kRIu44Ys+NERXTSh7mgHG/uJOxuAiklr+KnKswIcWOeGB/Dodz77Dgn1UnHNP0WvnJOC9yWg+gWjnKT7cjy36tqpoad4w3wPQGQOS1Nlv5Etm6uJD4g98GvB+Z1jzroO0zQwOkqNTO7PREN4EIQ2lbgRqJ6cCIMJLgSeC8k7gAacVjlZt0VNPEgmJvbxpRJiKwRQYCtvPNrh/E6jaIEmIp2a4nVQmodEYaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+NzuueaWOBQNO1DcAK9Wffz37UHWOd65baRCaFge5s=;
 b=Gd+OH91wowzzV2G6ZULPbQKCza/lSUFu/L/EhsHl/nd0fPSerNPLClbGt/xiK2J0UtizMh10ZzPDFBsV/LwUYgnpoza5Aee/UiSiHbafqBn3y90qFYFY+5MKCDT/hiwSAnxhyZVHThKl1hIIZmErQtbHLB4TGb1/00zZnJtc/uY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ian Jackson <iwj@xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Rahul Singh <Rahul.Singh@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM [and 1 more messages]
Thread-Topic: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM [and 1 more messages]
Thread-Index: AQHXxAxJ3B/Rg+jZk0SyvH1t/aZlYKvYkw2A
Date: Mon, 18 Oct 2021 10:47:42 +0000
Message-ID: <55163F8F-2D16-4326-AC70-CB48ED6D0A4C@arm.com>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
 <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
 <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
 <alpine.DEB.2.21.2110151235100.31303@sstabellini-ThinkPad-T480s>
 <YWqpQyKvNzE8GYda@MacBook-Air-de-Roger.local>
 <2b6c80de-f71a-b32e-340f-130f62d9dfd5@suse.com>
 <24941.20117.330072.580007@mariner.uk.xensource.com>
In-Reply-To: <24941.20117.330072.580007@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: xenproject.org; dkim=none (message not
 signed) header.d=none;xenproject.org; dmarc=none action=none
 header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1a8eb03b-a2dc-426a-1fca-08d99224bc69
x-ms-traffictypediagnostic: DB8PR08MB5258:|DB8PR08MB5179:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB51794882BA5C2756619DADC29DBC9@DB8PR08MB5179.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ENwG2uFO/cCPurixmnsBSRcVSGDWHTYIehNmg9Ie4k2qhGJk/0a0XD6UpFxRlrsGVnrZQNiIPf3FkcPnitb0iwffVlwFfxtfpgJvcY2hzm5JotOraWwP7QzEMmOC6e6/KhK6Td6YJ/maCl4GJh3DrRdzZq3RgGZcOQNGalI6juCQQh4PVXBxCdG0i+8DP/PZRlj658byi5ETVCq/GK5CS5IjsqtGqn1VALTBxILgI5PcOtdqwsULG33z0qnNf7tuZdm7K6FaPKtLDKI2sYVhHEyJdIRgDYuknHHBfuBJNn22tRP4+BYXLqBwDPAXUgaa9NF9vpQXmpvo5AcOITAM3uHdCEiZobs0zKABS+HuNbAyThjJodNQsP5NZrmjSek5oFG2nPUtGhQ1a2g/FaodkeV8zoFnOWaHvGl3yDG4o8X8/mTdNRwreS9bcZZiCFfIcBWpr4unxCUICgsvZnYtIuGuIff0pNbxE1oEO/NGJQqsj5CnXzpxvCK1ewt3HTqLXnM4nTl2bJKuhzQ6ewu9JDSk5ZJt2Sf5NRnb3oX48ejpKSCCVgPBjKBjbzpIFKDwbX4MT0iE4FrMv+uOarwuEM2n2rGNT5PYxQFQij3HXJY02OeJz52vdawl8AqXDfgpuRnQjIjhX7x3lwSRsYpeNWpotIvUXHGoEsVZ6Qpi2uA9u29Y04S6lV+wGi+r3EiupijUireFHAhAiBogqjitvBRrnyCJOeiqtU2HfZhDpZremQeKg9crgjdV8HZC7ACO
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(4326008)(91956017)(76116006)(186003)(53546011)(66946007)(66446008)(54906003)(6506007)(38070700005)(6916009)(33656002)(26005)(6486002)(8936002)(71200400001)(508600001)(2616005)(316002)(66476007)(64756008)(66556008)(8676002)(5660300002)(7416002)(86362001)(2906002)(36756003)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DB52705F69DAFF44B30038C69FBC442A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5258
Original-Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9a443bc1-0410-48e2-278f-08d99224b701
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cYt4pEr3/dgaHRlFcuTFSz72qPW0MHLHATPiIp1+7mkU6FFXp+Fyt//gI76rsZVbMQSm+wNDfck1GzT20sMxORjfP50aIxEjKFkNLjhlKraMgArYk7ee5hknY06QaehoiZ2ouvTcJILkCo0ZTpmtdow3ZaWwGsaS49tu+SGUmk1UpXb1acXAocNLB8bKl6+WeKYhonIzW/QQWZMpynXBJWp3BdBXeleO207DTOycMIa9RS81AHCcnKAu0hahIZbS6joxfpdl3AenqCRpZmHiFdgb3kY9KOT0Ru3DyZYagd3Eg2gjJm8RGoAm/y1dKRFFdcOwy57c92LTP7BJfqsX/j2x3FtIDQtNhNFplg0VlCwU88SloQXG5QKNGNGY9Hgm1AhsLm+PsLnxnljBMnM/0ZsplbIZS0G48tUrBSP2P12cSVPVyPC3DZVBQebw7Py1hyOYQZGXO4s5GvJ9mA8GSq8m8iYZdPan6FsOSbbu+yWOwvygYlyOMxVOY8TPsp2hBkZmjKNGwFmNiSX2mvT/QRybbGlyziPefL09UlU4u0N2fkECV8q+P/weWgSSp8SLFwh80f8dn4NXc/j/a99ajY8yXlYMMv9dLX+v9QQFpwv6oNQ2fMA116Ts3lhZJRCoeUJlVEGZn6pL8s6qosaf0Rd3LhdeeDf4UORMGqsXK5vcVuQ88cB3sJ3iYsoDAtT/BJ4SLiTO3AkM85NL15DCUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(186003)(5660300002)(36756003)(36860700001)(508600001)(82310400003)(26005)(316002)(54906003)(107886003)(336012)(53546011)(6506007)(4326008)(6512007)(70586007)(86362001)(70206006)(8936002)(33656002)(47076005)(356005)(6862004)(6486002)(2906002)(8676002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 10:47:52.7039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8eb03b-a2dc-426a-1fca-08d99224bc69
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5179

SGkgSWFuLA0KDQo+IE9uIDE4IE9jdCAyMDIxLCBhdCAxMTozOCwgSWFuIEphY2tzb24gPGl3akB4
ZW5wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+IA0KPiBKdWxpZW4gR3JhbGwgd3JpdGVzICgiUmU6IFtQ
QVRDSCB2OCAyLzVdIHhlbi9hcm06IEVuYWJsZSB0aGUgZXhpc3RpbmcgeDg2IHZpcnR1YWwgUENJ
IHN1cHBvcnQgZm9yIEFSTSIpOg0KPj4gQUZBSUNULCB0aGUgY29kZSBpcyBub3QgcmVhY2hhYmxl
IG9uIEFybSAoPykuIFRoZXJlZm9yZSwgb25lIGNvdWxkIGFyZ3VlIA0KPj4gd2UgdGhpcyBjYW4g
d2FpdCBhZnRlciB0aGUgd2Vlay1lbmQgYXMgdGhpcyBpcyBhIGxhdGVudCBidWcuIFlldCwgSSBh
bSANCj4+IG5vdCByZWFsbHkgY29tZm9ydGFibGUgdG8gc2VlIGtub3duaW5nbHkgYnVnZ3kgY29k
ZSBtZXJnZWQuDQo+IA0KPiBJIGFncmVlIHRoYXQgbWVyZ2luZyBzb21ldGhpbmcgdGhhdCBpcyBr
bm93biB0byBiZSB3cm9uZyB3b3VsZCBiZQ0KPiBxdWl0ZSBpcnJlZ3VsYXIsIGF0IGxlYXN0IHdp
dGhvdXQgYSBjb21wZWxsaW5nIHJlYXNvbi4NCj4gDQo+IEphbiBCZXVsaWNoIHdyaXRlcyAoIlJl
OiBbUEFUQ0ggdjggMi81XSB4ZW4vYXJtOiBFbmFibGUgdGhlIGV4aXN0aW5nIHg4NiB2aXJ0dWFs
IFBDSSBzdXBwb3J0IGZvciBBUk0iKToNCj4+IE9uIDE2LjEwLjIwMjEgMTI6MjgsIFJvZ2VyIFBh
dSBNb25uw6/Cv8K9IHdyb3RlOg0KPj4+IE1heWJlIEknbSBiZWluZyBwZWRhbnRpYywgb3IgdGhl
cmUgd2FzIHNvbWUgY29tbXVuaWNhdGlvbiBvdXRzaWRlIHRoZQ0KPj4+IG1haWxpbmcgbGlzdCwg
YnV0IEkgdGhpbmsgc3RyaWN0bHkgc3BlYWtpbmcgeW91IGFyZSBtaXNzaW5nIGFuIEFjaw0KPj4+
IGZyb20gZWl0aGVyIEphbiBvciBQYXVsIGZvciB0aGUgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMgY2hhbmdlLg0KPj4+IA0KPj4+IElNSE8gc2VlaW5nIGhvdyB0aGF0IGNodW5rIG1vdmVk
IGZyb20gMyBkaWZmZXJlbnQgcGxhY2VzIGluIGp1c3Qgb25lDQo+Pj4gYWZ0ZXJub29uIGFsc28g
ZG9lc24ndCBnaXZlIG1lIGEgbG90IG9mIGNvbmZpZGVuY2UuIEl0J3MgQXJtIG9ubHkgY29kZQ0K
Pj4+IGF0IHRoZSBlbmQsIHNvIGl0J3Mgbm90IGdvaW5nIHRvIGVmZmVjdCB0aGUgZXhpc3Rpbmcg
eDg2IHN1cHBvcnQgYW5kDQo+Pj4gSSdtIG5vdCBzcGVjaWFsbHkgd29ycmllZCwgYnV0IEkgd291
bGQgbGlrZSB0byBhdm9pZCBoYXZpbmcgdG8gbW92ZSBpdA0KPj4+IGFnYWluLg0KPj4gDQo+PiAr
MQ0KPj4gDQo+PiBJJ2xsIGJlIHJlcGx5aW5nIHRvIHRoZSBwYXRjaCBpdHNlbGYgZm9yIHRoZSB0
ZWNobmljYWwgYXNwZWN0cy4gQXMgcGVyDQo+PiBjb250ZXh0IHN0aWxsIHZpc2libGUgYWJvdmUg
dGhpcyBjb2RlIHBhdGggaXMgc3VwcG9zZWRseSB1bnJlYWNoYWJsZQ0KPj4gcmlnaHQgbm93LCB3
aGljaCBtYWtlcyBtZSB3b25kZXIgZXZlbiBtb3JlOiBXaHkgdGhlIHJ1c2g/IERlcGVuZGluZyBv
bg0KPj4gdGhlIGFuc3dlciBwbHVzIGNvbnNpZGVyaW5nIHRoZSBfX2h3ZG9tX2luaXQgaXNzdWUs
IElhbiwgSSdtIGluY2xpbmVkDQo+PiB0byBzdWdnZXN0IGEgcmV2ZXJ0Lg0KPiANCj4gSSBkb24n
dCB3YW50IHRvIGJlIHdhdmluZyBoYW1tZXJzIGFib3V0IGF0IHRoaXMgc3RhZ2UsIGFuZCBJIGhh
dmVuJ3QNCj4gbG9va2VkIGF0IHRoZSB0ZWNobmljYWwgZGV0YWlscyBteXNlbGYsIGJ1dDoNCj4g
DQo+IENhbiBJIGFzayB0aGUgQVJNIGZvbGtzIHRvIG1ha2Ugc3VyZSB0aGF0IHRoaXMgc2l0dWF0
aW9uIGlzIHNvcnRlZCBvdXQNCj4gQVNBUCA/ICBTYXksIGJ5IHRoZSBlbmQgb2YgVGh1cnNkYXkg
Pw0KDQpTdXJlLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IEJ5IHNvcnRlZCBvdXQgSSBt
ZWFuIHRoYXQgdGhlIF9faW5pdF9od2RvbSBpc3N1ZSBpcyBmaXhlZCBhbmQgdGhhdA0KPiB0aGUg
b3ZlcmFsbCBjaGFuZ2VzIHRvIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGhhdmUgYmVl
bg0KPiBwcm9wZXJseSBhcHByb3ZlZC4NCj4gDQo+IEZ1cnRoZXJtb3JlLCBJIHRoaW5rIHRoZXNl
IGZvbGxvd3VwIHBhdGNoZXMgc2hvdWxkIGdvIGluIGFsbCBpbiBvbmUNCj4gZ28sIGFzIGEgc21h
bGwgc2VyaWVzLCB3aGVuIGV2ZXJ5b25lIGlzIE9LIHdpdGggaXQsIHJhdGhlciB0aGFuDQo+IGRy
aWJibGluZyBpbi4gIFRoYXQgd2lsbCBtYWtlIGl0IGVhc2llciB0byBzZWUgdGhlIHdvb2QgZm9y
IHRoZSB0cmVlcw0KPiAoYW5kIGl0IHdvdWxkIGFsc28gbWFrZSBhIHJldmVydCBsZXNzIGNvbXBs
aWNhdGVkKS4NCj4gDQo+IEphbiwgYXJlIHlvdSBPSyB3aXRoIHRoaXMgYXBwcm9hY2ggPw0KPiAN
Cj4gVGhhbmtzLA0KPiBJYW4uDQoNCg==

