Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EB76F67E2
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 11:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529639.824240 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUog-0000ZO-SB; Thu, 04 May 2023 08:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529639.824240; Thu, 04 May 2023 08:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puUog-0000WN-Of; Thu, 04 May 2023 08:59:58 +0000
Received: by outflank-mailman (input) for mailman id 529639;
 Thu, 04 May 2023 08:59:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VaLI=AZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1puUof-0000WF-H1
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 08:59:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a32a5d0-ea5a-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 10:59:56 +0200 (CEST)
Received: from DU2PR04CA0323.eurprd04.prod.outlook.com (2603:10a6:10:2b5::28)
 by DB9PR08MB10378.eurprd08.prod.outlook.com (2603:10a6:10:3da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 08:59:53 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::8) by DU2PR04CA0323.outlook.office365.com
 (2603:10a6:10:2b5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 08:59:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.22 via Frontend Transport; Thu, 4 May 2023 08:59:53 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Thu, 04 May 2023 08:59:53 +0000
Received: from 054332754a50.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D8824C4-A056-4F05-A9D7-D31265CD6C0C.1; 
 Thu, 04 May 2023 08:59:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 054332754a50.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 08:59:46 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB9741.eurprd08.prod.outlook.com (2603:10a6:20b:617::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Thu, 4 May
 2023 08:59:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::9283:e527:bed8:ab23]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::9283:e527:bed8:ab23%7]) with mapi id 15.20.6363.022; Thu, 4 May 2023
 08:59:45 +0000
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
X-Inumbo-ID: 0a32a5d0-ea5a-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe4iGj8pxSowClsFdNt0rI/Ih7O9o6ufQz/RjTFFtZY=;
 b=4oSeY/Jd/EJOwmBOY7IyEYD+aiybvQKu+mkXUJdB6sN79v+NODW5bdeqDS2TgH6n46vrpegLe94RK+XYQpteBIO5gLGhjN4y+1iixye/Bny8yalj/Ozs5GyiREuchFl+DgY2o4F7+B7sPwWJoR8X9JZOPM3DaDWl4DYVF1YtuRU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f6b78dfc23327d82
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFUYSGY6Fi7KpZ1EpOD78bU4SjdODDDGXYYJf9cHx9cP/11HeJrrH5njMMxkH3jA5uYDXXx2V3Nw1bixeMRwZgFadbcixg/QI1BzXOyHn0xHi5EgPICgJ5JTo8e6ChJ/IcIpYsK4qmwYeQOrc9v6SDqNhmI/IzpFC8SEGycMVjF3S21oWov0tJfEBOpHn65Fj5j26R2d30aYGOdIn+M5hIVenKClmMN+qKyzpVOipU412xtTN/gQuy2Bjt/EVfcPwFb7a8dPNJXDdxUZPq2mWbio48CleGGAfPxij2T9vVjnaSkjrcZg/VmYyPiQ9rNPxS3HHciQ0W6JmnR6S+QYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pe4iGj8pxSowClsFdNt0rI/Ih7O9o6ufQz/RjTFFtZY=;
 b=B8ueVsysN5bjB2BbbX4UxWBO/eoLEW3pxKR+ElVbPOmBBPeCs/8rdnC6L6/LGtNt6R2EjVpAEXID6XJuW0kAvzlVflykJOFY++oJM6t1/QLoDWWdLrJY8aqUb7a5HPpBH09jwvW4Zm5EsDOE3vCBDun1FVkhvXK+AyItXyIfeeGL2CqZsVImOyFo9TFKEpXyyN/zs68R5nIINbZUR3ACI40qDbGBXO/wzbe71voyItZar2VAXyozWLFwsC+b5MZPpXcflpT819tjUkJej5nnSmN77zCDoYJahJJmmsPaBzpbJ8vP97HlTJwz9Qv3MebDxRFORnv/z1ErAGn41/al4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe4iGj8pxSowClsFdNt0rI/Ih7O9o6ufQz/RjTFFtZY=;
 b=4oSeY/Jd/EJOwmBOY7IyEYD+aiybvQKu+mkXUJdB6sN79v+NODW5bdeqDS2TgH6n46vrpegLe94RK+XYQpteBIO5gLGhjN4y+1iixye/Bny8yalj/Ozs5GyiREuchFl+DgY2o4F7+B7sPwWJoR8X9JZOPM3DaDWl4DYVF1YtuRU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stewart Hildebrand <Stewart.Hildebrand@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: pci: fix -Wtype-limits warning in
 pci-host-common.c
Thread-Topic: [PATCH] xen/arm: pci: fix -Wtype-limits warning in
 pci-host-common.c
Thread-Index: AQHZffQTsmRRBKh80kOBQgH8fU6H2a9J0ZUA
Date: Thu, 4 May 2023 08:59:44 +0000
Message-ID: <5D298044-314C-473F-97AB-420DA3DA44A2@arm.com>
References: <20230503191820.78322-1-stewart.hildebrand@amd.com>
In-Reply-To: <20230503191820.78322-1-stewart.hildebrand@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB9741:EE_|DBAEUR03FT032:EE_|DB9PR08MB10378:EE_
X-MS-Office365-Filtering-Correlation-Id: 30fad04d-eb30-4116-c8ed-08db4c7decdd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 DcuV7NsL4RyDysu2xbACbluAmjrKp0t+plcOgUJTcr8n+85pm+n5eTPBSi6V4oyp3OJraYMFoDVB8t0huVgKWTv9+GCQfQgrqzSK3s5R+zMFrPCV19NiEz7g8T7wHugTS400vDdQa89Bx2pol4BpxU5DLFczF1BEwQj0AynthYDTHRhfxS7p8Qk6x/GIS5rR+Db5sd+zr/XBEsPQrXoEvoL7i9HPXaQAGeLV19SUp/5t9zm+wYy16cYP6ZtSP6/DPQ4u0LBt6NFLK00VTYtGGOcJPu/vpeBT7b/5Xx4lH+JkKA8/CwIGh7MCVqpaiQMW+NyC8W/LQyCh40Cg8bgcob7Em7stKaZfeNjZqEQA2sIatJtiTTT95d36UWF82KURuwniHCDafSreE8FAm1trtRA655BTJS+obs0aNTAAezIURzxcC2Ebm9Xcf/OYoIJIJ1g6dgug0KUKywCX9Lk/OIDuaQAK4A0rcP6WHmLplWslre/FhSV1Q1TYVImoRyfIjoPSbtqQib3aOPhZANY7pRxbmRE6vDfMGJ+Ylm/dXQn5deZMRsI0szByD4JHr5YR+dxdbwdtyQSq9y54+fcnYcDO2Btp1z/pU252pJQahW8FhyUx5Vt2E7TKfWd618sicJRG7A+OaKtiVJ/8o8LELg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199021)(54906003)(186003)(478600001)(6506007)(2616005)(6512007)(53546011)(71200400001)(6486002)(4326008)(6916009)(66446008)(41300700001)(66556008)(76116006)(66476007)(91956017)(66946007)(64756008)(316002)(83380400001)(5660300002)(8676002)(8936002)(122000001)(2906002)(38100700002)(38070700005)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <99CF58F2C0329B4EBD5E10C71324FF75@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9741
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c34286c9-720b-4b8e-417a-08db4c7de7f9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6IoV9SQAmRE1vymZaHsBsX5BlYowCLJsHFVFVOtNQmIdgCcxOGdJzCzyMCrVMweKjqxVXRyXyzfQtVhPR+C3vKykprdse4xMM9wnx/6h3fcsBoVUkPl0kHx4NgjZOaK1PPegf6n8rPk5Onix2CUdOGcQA7PuCSjBrSBbXWNBJOXyVHLk9aheKoDVLrWk9rG+u1inqMXGmpIGQNfZlffiWcfPz1+gAUz9rlRzP1FC3tpS8DKYz2XlhruDFRVtda44FF5gYnBVOhqdW2Zh4qbaSXUCJ0bQFoVoHCeOICTKxrl/USWNeRiHPCo5qAWgsMgAFhXTH6Qer8JgCc1+VZJYifP5PH+Ya4BxYChDWhPRVoBhjj2+q2Qfznd1lOpXM3F0MGo03BHB3TvbD7rRt5DqQV2LUCu9mSFW5JDyagcoxSfuH9vG6cl14C+jtCRz+Z89oNjRzrvuDRWyQpOOFZlL3NLh+KSllzpq5xQaZAcQwwOIROx+Ojba2Tmbr/c2wAM+TnXbT132BNocEO44GnFX9Vgnot86OKzEzmrKUOKZTGSAvjMGQKYcZq9GOkxdxBJM0/iPh04hqui0XVAvLHQIZ/rNbiOpERB72uHZ1o3XsVsn3sxNVr6LtA/nlgXc69FeMg2WgwkENoo3q24qnoiiNJcdujEa2TvHtWomzCcRld0J0YkAHp3YLMe67OmuItue5f36kKGN/w6aht4mtzpZbriCOx02k78xQpUG38ZTeHU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(451199021)(40470700004)(36840700001)(46966006)(316002)(186003)(41300700001)(2906002)(33656002)(53546011)(6506007)(6512007)(54906003)(2616005)(82310400005)(86362001)(6486002)(107886003)(83380400001)(4326008)(336012)(70206006)(47076005)(26005)(70586007)(36860700001)(478600001)(40460700003)(34020700004)(36756003)(8936002)(82740400003)(6862004)(5660300002)(8676002)(81166007)(356005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 08:59:53.1481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30fad04d-eb30-4116-c8ed-08db4c7decdd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB10378

SGkgU3Rld2FydCwNCg0KPiBPbiAzIE1heSAyMDIzLCBhdCAyMToxOCwgU3Rld2FydCBIaWxkZWJy
YW5kIDxTdGV3YXJ0LkhpbGRlYnJhbmRAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBXaGVuIGJ1aWxk
aW5nIHdpdGggRVhUUkFfQ0ZMQUdTX1hFTl9DT1JFPSItV3R5cGUtbGltaXRzIiwgd2Ugb2JzZXJ2
ZSB0aGUNCj4gZm9sbG93aW5nIHdhcm5pbmc6DQo+IA0KPiBhcmNoL2FybS9wY2kvcGNpLWhvc3Qt
Y29tbW9uLmM6IEluIGZ1bmN0aW9uIOKAmHBjaV9ob3N0X2NvbW1vbl9wcm9iZeKAmToNCj4gYXJj
aC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jOjIzODoyNjogd2FybmluZzogY29tcGFyaXNvbiBp
cyBhbHdheXMgZmFsc2UgZHVlIHRvIGxpbWl0ZWQgcmFuZ2Ugb2YgZGF0YSB0eXBlIFstV3R5cGUt
bGltaXRzXQ0KPiAgMjM4IHwgICAgIGlmICggYnJpZGdlLT5zZWdtZW50IDwgMCApDQo+ICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KPiANCj4gVGhpcyBpcyBkdWUgdG8gYnJpZGdl
LT5zZWdtZW50IGJlaW5nIGFuIHVuc2lnbmVkIHR5cGUuIEZpeCBpdCBieSBpbnRyb2R1Y2luZyBh
DQo+IG5ldyB2YXJpYWJsZSBvZiBzaWduZWQgdHlwZSB0byB1c2UgaW4gdGhlIGNvbmRpdGlvbi4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJy
YW5kQGFtZC5jb20+DQoNCkkgd291bGQgc2VlIHRoaXMgYXMgYSBidWcgZml4IG1vcmUgdGhhbiBh
IGNvbXBpbGVyIHdhcm5pbmcgZml4IGFzIHRoZSBlcnJvciBjb2RlIHdhcw0KaWdub3JlZCBiZWZv
cmUgdGhhdC4NCg0KQW55d2F5Og0KUmV2aWV3ZWQtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRy
YW5kLm1hcnF1aXNAYXJtLmNvbT4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQoNCj4gLS0tDQo+IHhl
bi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMgfCA2ICsrKystLQ0KPiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMgYi94ZW4vYXJjaC9hcm0vcGNpL3Bj
aS1ob3N0LWNvbW1vbi5jDQo+IGluZGV4IGE4ZWNlOTQzMDNjYS4uNzQ3NGQ4NzdkZWI4IDEwMDY0
NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+ICsrKyBiL3hl
bi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9uLmMNCj4gQEAgLTIxNCw2ICsyMTQsNyBAQCBp
bnQgcGNpX2hvc3RfY29tbW9uX3Byb2JlKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2LA0KPiAg
ICAgc3RydWN0IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlOw0KPiAgICAgc3RydWN0IHBjaV9jb25m
aWdfd2luZG93ICpjZmc7DQo+ICAgICBpbnQgZXJyOw0KPiArICAgIGludCBkb21haW47DQo+IA0K
PiAgICAgaWYgKCBkdF9kZXZpY2VfZm9yX3Bhc3N0aHJvdWdoKGRldikgKQ0KPiAgICAgICAgIHJl
dHVybiAwOw0KPiBAQCAtMjM0LDEyICsyMzUsMTMgQEAgaW50IHBjaV9ob3N0X2NvbW1vbl9wcm9i
ZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldiwNCj4gICAgIGJyaWRnZS0+Y2ZnID0gY2ZnOw0K
PiAgICAgYnJpZGdlLT5vcHMgPSAmb3BzLT5wY2lfb3BzOw0KPiANCj4gLSAgICBicmlkZ2UtPnNl
Z21lbnQgPSBwY2lfYnVzX2ZpbmRfZG9tYWluX25yKGRldik7DQo+IC0gICAgaWYgKCBicmlkZ2Ut
PnNlZ21lbnQgPCAwICkNCj4gKyAgICBkb21haW4gPSBwY2lfYnVzX2ZpbmRfZG9tYWluX25yKGRl
dik7DQo+ICsgICAgaWYgKCBkb21haW4gPCAwICkNCj4gICAgIHsNCj4gICAgICAgICBwcmludGso
WEVOTE9HX0VSUiAiSW5jb25zaXN0ZW50IFwibGludXgscGNpLWRvbWFpblwiIHByb3BlcnR5IGlu
IERUXG4iKTsNCj4gICAgICAgICBCVUcoKTsNCj4gICAgIH0NCj4gKyAgICBicmlkZ2UtPnNlZ21l
bnQgPSBkb21haW47DQo+ICAgICBwY2lfYWRkX2hvc3RfYnJpZGdlKGJyaWRnZSk7DQo+IA0KPiAg
ICAgcmV0dXJuIDA7DQo+IC0tIA0KPiAyLjQwLjENCj4gDQoNCg==

