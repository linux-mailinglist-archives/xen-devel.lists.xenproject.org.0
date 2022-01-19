Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21259493321
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 03:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258693.445838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA12j-0000JQ-Uf; Wed, 19 Jan 2022 02:49:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258693.445838; Wed, 19 Jan 2022 02:49:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA12j-0000HC-Q4; Wed, 19 Jan 2022 02:49:49 +0000
Received: by outflank-mailman (input) for mailman id 258693;
 Wed, 19 Jan 2022 02:49:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CaTf=SD=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1nA12i-0000H6-CW
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 02:49:48 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50088.outbound.protection.outlook.com [40.107.5.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 758917d9-78d2-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 03:49:45 +0100 (CET)
Received: from DU2PR04CA0204.eurprd04.prod.outlook.com (2603:10a6:10:28d::29)
 by AM8PR08MB6580.eurprd08.prod.outlook.com (2603:10a6:20b:369::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 02:49:11 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::6f) by DU2PR04CA0204.outlook.office365.com
 (2603:10a6:10:28d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11 via Frontend
 Transport; Wed, 19 Jan 2022 02:49:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.9 via Frontend Transport; Wed, 19 Jan 2022 02:49:11 +0000
Received: ("Tessian outbound 741ca6c82739:v113");
 Wed, 19 Jan 2022 02:49:11 +0000
Received: from af079e4da500.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 677A0DF4-75F7-4FB7-88FA-50CFA8952044.1; 
 Wed, 19 Jan 2022 02:49:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af079e4da500.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 Jan 2022 02:49:05 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB8PR08MB4188.eurprd08.prod.outlook.com (2603:10a6:10:b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Wed, 19 Jan
 2022 02:49:02 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::4463:2795:6645:5dd0%6]) with mapi id 15.20.4888.013; Wed, 19 Jan 2022
 02:49:02 +0000
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
X-Inumbo-ID: 758917d9-78d2-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ytwro7Mk5CruANDZuOOefJLoX/o3qtD2UMYOdtJ+P7s=;
 b=4rk6fzslOFjGui5pVwFaRFIrptr3m6X7EJ/Lh+Z1gHUW6RBNDXHAXajqImUS59RyhGRihnCZ7YU/OjLfAnaGatUrcWtS23AFMjqOaZ0WcUzHGDiGfjxQlGWeUZ29qQgH3GRC4FsI/6MQ6iieyC1sq2FRAn/sGYftV7aHZ50UMzM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9MuXT2szxhgWuz5M3JbMWYhSXokp/HGps57c3U3bpkJRkqCTRoR4Sv60xLj1F5vq6RX+6U08p7d848qii+fo4gsRvU6IKyBgMWVaqSqEfCxOoL7nNCCQOZXQEcL6Ef+j8yeYmiTQ/3aQF8KzzbqcmgZtENGTeRK8hq2rXQngRB7NRAqvuNqFARU2nb0C5eU1T0AzhJDFVM5x0wB9FW7V38/GyAuvngopjIjUSJIK+hbwLXWHPggqRgP/2L29NsmuDwYcI1wgf7UX9fUKEZxrXr13SkQqpPynGAV3CVlsXoOqfHVg3vfVZCX2nDicUjRm69nuaCYBvnAJ7wRx+UFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ytwro7Mk5CruANDZuOOefJLoX/o3qtD2UMYOdtJ+P7s=;
 b=O6Xr0Ami+2dko/Y4BqRPXQrD9LeiH9WSEtC1qmJwRslr4yB42ioTUQt8kOVuFussr5KUJgPv8mXbtIc3NqnzK1zZaNw31J11INRA5S6b+AKAB1LYeJyZ2l5A5/scoAMaogXZgNan1mTILDjcLRP+p7GsZEnvJdNi1rMqZXvKX5ysWrJBS3sJKPb+gFbm8qnFNTzXXqhnAa8KFobxckSIz3p9UuNWSv8ERcMrB+QDDZpHlrMGkRMcn9+5I132uUSKbZOLeU5jSGmKcRmSMIyz2zKrC2yI2SEHAdPdjUkTCJuNMANm6vXvhtG4N24kH8KwUFVVh/WujSDqIN4rGKkajw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ytwro7Mk5CruANDZuOOefJLoX/o3qtD2UMYOdtJ+P7s=;
 b=4rk6fzslOFjGui5pVwFaRFIrptr3m6X7EJ/Lh+Z1gHUW6RBNDXHAXajqImUS59RyhGRihnCZ7YU/OjLfAnaGatUrcWtS23AFMjqOaZ0WcUzHGDiGfjxQlGWeUZ29qQgH3GRC4FsI/6MQ6iieyC1sq2FRAn/sGYftV7aHZ50UMzM=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org"
	<julien@xen.org>
Subject: RE: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Topic: [PATCH 04/37] xen: introduce an arch helper for default dma zone
 status
Thread-Index:
 AQHXsHMGx8xGhif/FUCDSa9NS/fSLqxoGKiAgAD49HCAABTIAIAACXAAgABbKICAANEXUA==
Date: Wed, 19 Jan 2022 02:49:02 +0000
Message-ID:
 <PAXPR08MB742030298FE53A7B5AB5D1499E599@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
 <20210923120236.3692135-5-wei.chen@arm.com>
 <345944c4-78dd-8009-6f64-f9c7901a5497@suse.com>
 <PAXPR08MB7420CD3B7CFB4D2D81019F479E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <378fcc9b-abfe-28f2-ee67-f5510e99436c@suse.com>
 <PAXPR08MB7420FE209E822108AB1B41E19E589@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <fd328410-caf0-274e-08b0-f775a6c9a08c@suse.com>
In-Reply-To: <fd328410-caf0-274e-08b0-f775a6c9a08c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E90370D0568F4A4EB51CFD63032B53CB.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 5e3989a3-ba42-4c81-b3ae-08d9daf64570
x-ms-traffictypediagnostic:
	DB8PR08MB4188:EE_|DB5EUR03FT025:EE_|AM8PR08MB6580:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB65809E7F6764EB0CB3260EAB9E599@AM8PR08MB6580.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VSeYgvriZy2u8CfQSKotn1yB9fqTA4WIYBQSe6tn9kuECdA2SqYMRJ++6kXum9bAocfduMaSvqpULDxB98a+lafnTg5wFfaohBmaePjVYU9Xo4sNTVctN+OiYTelJPKC9uzn+uLRC3wlVqFQUiZ3zw6QcUwcULybKV2i7XIxgsJy9w6FnUuaVEpdOuvOE19y33pARMIydobF74zYKWmVCLyj7aVomS0zqIMyI7DLExAseVySuFAb1NNbghovnAP5l+C6pSZtAWpIdHsQfaI5KT/VzhEtXkwa3U+USZszEbnlA1IiCxCWkdzJUgjNVOU3Z2MopTCIUFqOYGEzRB2dU35dgBgWqYOZcs/YkYnSrzzusXsRvFNcwc8MuD2XoVH9CJ3i2DvpMj+3HqP32Tq0MearRT1/ld9nHepLZr86GMNSwqKG+t/mLQaOmClBUoEYLOQaHZs6u6xYLGt5PDX1GiiYXtupFeYXA6xGybYWpjx6P7fN+MteqvgzJ+gZ1KZz797Q2VAYLfWE7qm04xgr/OZqBcvRkYuyoOt5zqDjDbRSnVekjLoyKDpllcO+FzmSDEVk+vxEC9FZzPQy3NmosGydm8B2UcI/lvPH2J7xmlgj+J+bkFzjkP7mShu/v6Uxmaar88Jx9Jw5bcq9XQ67AZB/BHzFSz7ZtJKGVJgkMUzzONudeZQe/Ot8j8W772CX8p92VYOVGubYPCenlxWGdA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(71200400001)(38100700002)(122000001)(55016003)(2906002)(508600001)(66946007)(52536014)(8936002)(76116006)(8676002)(38070700005)(6916009)(33656002)(64756008)(66556008)(66476007)(26005)(186003)(4326008)(6506007)(53546011)(86362001)(7696005)(66446008)(54906003)(316002)(9686003)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4188
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd20471b-0a09-44ee-c03c-08d9daf6407f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iUDIs5bBSKMkVqUzoLGrcmC10kYGaPiiSRcPYFi3C8bs1enBZYY3rGj/8qcr6qkPli/rDFTTjO03a2QOCKYnSUb1VEsK8eKBHumnP8RCF4NDAsXGyvbIBUrS4XSX26kkUSj1zXiG6zSjvmkAxy9FMi88DEyJHlJlMlkCMuRQaZWS5CcR5ScOD1exZKesdtkcdYrfDA6iQ5T+X9geZSoueYfZyHSQrI3zyO4YypTwoezbLqV9qFp5T6pJowcX9ZQffVWHWfwxQkNN7gRKOLxLwpEknszoZJTW5S64qiaPGj4C7wGFVMqsZezyI7dwzdtzfi6nlD0DfrxzaLWE1bmnWLPGdPyxOTe0KOgiZSOpjzSraC7dnXlDmkUdFZRGav0Wjfkqi8piZ8976A6fQLrNUAJc5T5CCs1CHOTf5Q+lPBmT0YG5eqzukUP1nXqCej2lsEY5CW3qH+eU/dlhm+wuUCyZrcrOdv6YzgGGGEdeyQyEbpLGLoGG9lhcYBSIR0noVWVNXViFPS+yzgjSzergBLBjUEFwYCXCfiQPGOjhHb1yQkRN7LoJOnWc/8fjBq6OfcJIvqcuTpk6f8HHFmrX4SVhP6+oPC2sRNcCCEu4+Zubs8cca4rsl5Bdk1c3+jdpp/Te3Xgi2qFqQEeVU9kGNDSfqtmvD2ONywnjYOXg8lp2pO37V0K/ffEEe/EszotaKpJyCT37GnM0EWBhS/PDDuseVBmGsHpoiSQCOcHFayCeLoCptmOgTRhLFKHHI42N8jS6YKSS6wBUuaM7BOUr5Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700002)(316002)(8676002)(9686003)(186003)(6862004)(40460700001)(4326008)(26005)(508600001)(8936002)(70206006)(36860700001)(356005)(7696005)(54906003)(47076005)(6506007)(83380400001)(70586007)(55016003)(52536014)(5660300002)(336012)(53546011)(33656002)(82310400004)(81166007)(86362001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 02:49:11.1303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3989a3-ba42-4c81-b3ae-08d9daf64570
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6580

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMuW5tDHmnIgxOOaXpSAyMjoxNg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqdWxpZW5AeGVuLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDA0LzM3XSB4ZW46IGludHJvZHVjZSBhbiBhcmNoIGhlbHBlciBmb3IgZGVm
YXVsdCBkbWENCj4gem9uZSBzdGF0dXMNCj4gDQo+IE9uIDE4LjAxLjIwMjIgMTA6MjAsIFdlaSBD
aGVuIHdyb3RlOg0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
ID4+IFNlbnQ6IDIwMjLlubQx5pyIMTjml6UgMTY6MTYNCj4gPj4NCj4gPj4gT24gMTguMDEuMjAy
MiAwODo1MSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+Pj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPg0KPiA+Pj4+IFNlbnQ6IDIwMjLlubQx5pyIMTjml6UgMDoxMQ0KPiA+Pj4+
IE9uIDIzLjA5LjIwMjEgMTQ6MDIsIFdlaSBDaGVuIHdyb3RlOg0KPiA+Pj4+PiBJbiBjdXJyZW50
IGNvZGUsIHdoZW4gWGVuIGlzIHJ1bm5pbmcgaW4gYSBtdWx0aXBsZSBub2RlcyBOVU1BDQo+ID4+
Pj4+IHN5c3RlbSwgaXQgd2lsbCBzZXQgZG1hX2JpdHNpemUgaW4gZW5kX2Jvb3RfYWxsb2NhdG9y
IHRvIHJlc2VydmUNCj4gPj4+Pj4gc29tZSBsb3cgYWRkcmVzcyBtZW1vcnkgZm9yIERNQS4NCj4g
Pj4+Pj4NCj4gPj4+Pj4gVGhlcmUgYXJlIHNvbWUgeDg2IGltcGxpY2F0aW9ucyBpbiBjdXJyZW50
IGltcGxlbWVudGF0aW9uLiBCZWN1YXNlDQo+ID4+Pj4+IG9uIHg4NiwgbWVtb3J5IHN0YXJ0cyBm
cm9tIDAuIE9uIGEgbXVsdGlwbGUgbm9kZXMgTlVNQSBzeXN0ZW0sIGlmDQo+ID4+Pj4+IGEgc2lu
Z2xlIG5vZGUgY29udGFpbnMgdGhlIG1ham9yaXR5IG9yIGFsbCBvZiB0aGUgRE1BIG1lbW9yeS4g
eDg2DQo+ID4+Pj4+IHByZWZlciB0byBnaXZlIG91dCBtZW1vcnkgZnJvbSBub24tbG9jYWwgYWxs
b2NhdGlvbnMgcmF0aGVyIHRoYW4NCj4gPj4+Pj4gZXhoYXVzdGluZyB0aGUgRE1BIG1lbW9yeSBy
YW5nZXMuIEhlbmNlIHg4NiB1c2UgZG1hX2JpdHNpemUgdG8gc2V0DQo+ID4+Pj4+IGFzaWRlIHNv
bWUgbGFyZ2VseSBhcmJpdHJhcnkgYW1vdW50IG1lbW9yeSBmb3IgRE1BIG1lbW9yeSByYW5nZXMu
DQo+ID4+Pj4+IFRoZSBhbGxvY2F0aW9ucyBmcm9tIHRoZXNlIG1lbW9yeSByYW5nZXMgd291bGQg
aGFwcGVuIG9ubHkgYWZ0ZXINCj4gPj4+Pj4gZXhoYXVzdGluZyBhbGwgb3RoZXIgbm9kZXMnIG1l
bW9yeS4NCj4gPj4+Pj4NCj4gPj4+Pj4gQnV0IHRoZSBpbXBsaWNhdGlvbnMgYXJlIG5vdCBzaGFy
ZWQgYWNyb3NzIGFsbCBhcmNoaXRlY3R1cmVzLiBGb3INCj4gPj4+Pj4gZXhhbXBsZSwgQXJtIGRv
ZXNuJ3QgaGF2ZSB0aGVzZSBpbXBsaWNhdGlvbnMuIFNvIGluIHRoaXMgcGF0Y2gsIHdlDQo+ID4+
Pj4+IGludHJvZHVjZSBhbiBhcmNoX2hhdmVfZGVmYXVsdF9kbWF6b25lIGhlbHBlciBmb3IgYXJj
aCB0byBkZXRlcm1pbmUNCj4gPj4+Pj4gdGhhdCBpdCBuZWVkIHRvIHNldCBkbWFfYml0c2l6ZSBm
b3IgcmVzZXJ2ZSBETUEgYWxsb2NhdGlvbnMgb3Igbm90Lg0KPiA+Pj4+DQo+ID4+Pj4gSG93IHdv
dWxkIEFybSBndWFyYW50ZWUgYXZhaWxhYmlsaXR5IG9mIG1lbW9yeSBiZWxvdyBhIGNlcnRhaW4N
Cj4gPj4+PiBib3VuZGFyeSBmb3IgbGltaXRlZC1jYXBhYmlsaXR5IGRldmljZXM/IE9yIGlzIHRo
ZXJlIG5vIG5lZWQNCj4gPj4+PiBiZWNhdXNlIHRoZXJlJ3MgYW4gYXNzdW1wdGlvbiB0aGF0IEkv
TyBmb3Igc3VjaCBkZXZpY2VzIHdvdWxkDQo+ID4+Pj4gYWx3YXlzIHBhc3MgdGhyb3VnaCBhbiBJ
T01NVSwgbGlmdGluZyBhZGRyZXNzIHNpemUgcmVzdHJpY3Rpb25zPw0KPiA+Pj4+IChJIGd1ZXNz
IGluIGEgIVBWIGJ1aWxkIG9uIHg4NiB3ZSBjb3VsZCBhbHNvIGdldCByaWQgb2Ygc3VjaCBhDQo+
ID4+Pj4gcmVzZXJ2YXRpb24uKQ0KPiA+Pj4NCj4gPj4+IE9uIEFybSwgd2Ugc3RpbGwgY2FuIGhh
dmUgc29tZSBkZXZpY2VzIHdpdGggbGltaXRlZCBETUEgY2FwYWJpbGl0eS4NCj4gPj4+IEFuZCB3
ZSBhbHNvIGRvbid0IGZvcmNlIGFsbCBzdWNoIGRldmljZXMgdG8gdXNlIElPTU1VLiBUaGlzIGRl
dmljZXMNCj4gPj4+IHdpbGwgYWZmZWN0IHRoZSBkbWFfYml0c2l6ZS4gTGlrZSBSUGkgcGxhdGZv
cm0sIGl0IHNldHMgaXRzDQo+IGRtYV9iaXRzaXplDQo+ID4+PiB0byAzMC4gQnV0IGluIG11bHRp
cGxlIE5VTUEgbm9kZXMgc3lzdGVtLCBBcm0gZG9lc24ndCBoYXZlIGEgZGVmYXVsdA0KPiA+Pj4g
RE1BIHpvbmUuIE11bHRpcGxlIG5vZGVzIGlzIG5vdCBhIGNvbnN0cmFpbnQgb24gZG1hX2JpdHNp
emUuIEFuZCBzb21lDQo+ID4+PiBwcmV2aW91cyBkaXNjdXNzaW9ucyBhcmUgcGxhY2VkIGhlcmUg
WzFdLg0KPiA+Pg0KPiA+PiBJJ20gYWZyYWlkIHRoYXQgZG9lc24ndCBnaXZlIG1lIG1vcmUgY2x1
ZXMuIEZvciBleGFtcGxlLCBpbiB0aGUgbWFpbA0KPiA+PiBiZWluZyByZXBsaWVkIHRvIHRoZXJl
IEkgZmluZCAiVGhhdCBtZWFucywgb25seSBmaXJzdCA0R0IgbWVtb3J5IGNhbg0KPiA+PiBiZSB1
c2VkIGZvciBETUEuIiBZZXQgdGhhdCdzIG5vdCBhbiBpbXBsaWNhdGlvbiBmcm9tIHNldHRpbmcN
Cj4gPj4gZG1hX2JpdHNpemUuIERNQSBpcyBmaW5lIHRvIG9jY3VyIHRvIGFueSBhZGRyZXNzLiBU
aGUgc3BlY2lhbCBhZGRyZXNzDQo+ID4+IHJhbmdlIGlzIGJlaW5nIGhlbGQgYmFjayBpbiBjYXNl
IGluIHBhcnRpY3VsYXIgRG9tMCBpcyBpbiBuZWVkIG9mIHN1Y2gNCj4gPj4gYSByYW5nZSB0byBw
ZXJmb3JtIEkvTyB0byBfc29tZV8gZGV2aWNlcy4NCj4gPg0KPiA+IEkgYW0gc29ycnkgdGhhdCBt
eSBsYXN0IHJlcGx5IGhhc24ndCBnaXZlbiB5b3UgbW9yZSBjbHVlcy4gT24gQXJtLCBvbmx5DQo+
ID4gRG9tMCBjYW4gaGF2ZSBETUEgd2l0aG91dCBJT01NVS4gU28gd2hlbiB3ZSBhbGxvY2F0ZSBt
ZW1vcnkgZm9yIERvbTAsDQo+ID4gd2UncmUgdHJ5aW5nIHRvIGFsbG9jYXRlIG1lbW9yeSB1bmRl
ciA0R0Igb3IgaW4gdGhlIHJhbmdlIG9mIGRtYV9iaXRzaXplDQo+ID4gaW5kaWNhdGVkLiBJIHRo
aW5rIHRoZXNlIG9wZXJhdGlvbnMgbWVldCB5b3VyIGFib3ZlIERvbTAgc3BlY2lhbCBhZGRyZXNz
DQo+ID4gcmFuZ2UgZGVzY3JpcHRpb24uIEFzIHdlIGhhdmUgYWxyZWFkeSBhbGxvY2F0ZWQgbWVt
b3J5IGZvciBETUEsIHNvIEkNCj4gPiB0aGluayB3ZSBkb24ndCBuZWVkIGEgRE1BIHpvbmUgaW4g
cGFnZSBhbGxvY2F0aW9uLiBJIGFtIG5vdCBzdXJlIGlzIHRoYXQNCj4gPiBhbnN3ZXJzIHlvdXIg
ZWFybGllciBxdWVzdGlvbj8NCj4gDQo+IEkgdmlldyBhbGwgb2YgdGhpcyBhcyBmbGF3ZWQsIG9y
IGFzIGEgd29ya2Fyb3VuZCBhdCBiZXN0LiBYZW4gc2hvdWxkbid0DQo+IG1ha2UgYXNzdW1wdGlv
bnMgb24gd2hhdCBEb20wIG1heSBuZWVkLiBJbnN0ZWFkIERvbTAgc2hvdWxkIG1ha2UNCj4gYXJy
YW5nZW1lbnRzIHN1Y2ggdGhhdCBpdCBjYW4gZG8gSS9PIHRvL2Zyb20gYWxsIGRldmljZXMgb2Yg
aW50ZXJlc3QuDQo+IFRoaXMgbWF5IGludm9sdmUgYXJyYW5naW5nIGZvciBhZGRyZXNzIHJlc3Ry
aWN0ZWQgYnVmZmVycy4gQW5kIGZvciB0aGlzDQo+IHRvIGJlIHBvc3NpYmxlLCBYZW4gd291bGQg
bmVlZCB0byBoYXZlIGF2YWlsYWJsZSBzb21lIHN1aXRhYmxlIG1lbW9yeS4NCj4gSSB1bmRlcnN0
YW5kIHRoaXMgaXMgY29tcGxpY2F0ZWQgYnkgdGhlIGZhY3QgdGhhdCBkZXNwaXRlIGJlaW5nIEhW
TS1saWtlLA0KPiBkdWUgdG8gdGhlIGxhY2sgb2YgYW4gSU9NTVUgaW4gZnJvbnQgb2YgY2VydGFp
biBkZXZpY2VzIGFkZHJlc3MNCj4gcmVzdHJpY3Rpb25zIG9uIERvbTAgYWRkcmVzcyBzcGFjZSBh
bG9uZSAoaS5lLiB3aXRob3V0IGFueSBYZW4NCj4gaW52b2x2ZW1lbnQpIHdvbid0IGhlbHAgLi4u
DQo+IA0KDQpJIGFncmVlIHdpdGggeW91IHRoYXQgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24g
aXMgcHJvYmFibHkgdGhlIGJlc3QNCmtpbmQgb2Ygd29ya2Fyb3VuZC4gRG8geW91IGhhdmUgc29t
ZSBzdWdnZXN0aW9ucyBmb3IgdGhpcyBwYXRjaCB0bw0KYWRkcmVzcyBhYm92ZSBjb21tZW50cz8g
T3Igc2hvdWxkIEkganVzdCBuZWVkIHRvIG1vZGlmeSB0aGUgY29tbWl0IGxvZw0KdG8gY29udGFp
biBzb21lIG9mIG91ciBhYm92ZSBkaXNjdXNzaW9ucz8NCg0KVGhhbmtzLA0KV2VpIENoZW4NCg0K
PiBKYW4NCg0K

