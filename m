Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6068232B
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 05:13:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487345.754957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMi00-0003Ty-Uy; Tue, 31 Jan 2023 04:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487345.754957; Tue, 31 Jan 2023 04:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMi00-0003RQ-Rf; Tue, 31 Jan 2023 04:12:00 +0000
Received: by outflank-mailman (input) for mailman id 487345;
 Tue, 31 Jan 2023 04:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gnQn=54=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pMhzy-0003RK-Nl
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 04:11:59 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655f300e-a11d-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 05:11:55 +0100 (CET)
Received: from DB6P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:6:28::11) by
 AS4PR08MB8048.eurprd08.prod.outlook.com (2603:10a6:20b:588::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 04:11:52 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:28:cafe::31) by DB6P191CA0001.outlook.office365.com
 (2603:10a6:6:28::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Tue, 31 Jan 2023 04:11:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36 via Frontend Transport; Tue, 31 Jan 2023 04:11:51 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Tue, 31 Jan 2023 04:11:51 +0000
Received: from a39a1b8ec813.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A9BA2675-AF35-4371-9DEA-14C59964F59F.1; 
 Tue, 31 Jan 2023 04:11:41 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a39a1b8ec813.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Jan 2023 04:11:41 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com (2603:10a6:208:13c::21)
 by AS8PR08MB9480.eurprd08.prod.outlook.com (2603:10a6:20b:61f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 04:11:38 +0000
Received: from AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab]) by AM0PR08MB4530.eurprd08.prod.outlook.com
 ([fe80::ee26:4b5e:4334:b7ab%3]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 04:11:38 +0000
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
X-Inumbo-ID: 655f300e-a11d-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiB+/urnfzXe/eo3tHgQ/gRpy1d7SMVHvIeRb+JAkKg=;
 b=7SBKQ0iQ6aq1c/BLgcfp0OW5oMxkG3LayZqmtc8pcIkZc5aLsfX4dw3keYvqDMaywMZfxDmq2cD2NTfres5T2bRwHTR3OtB8RKMcawCmCGPBHAk+j9DQTWtzW21DwnvVYZNEiLJf62cAkeUpEyqdazU9k2SgXyUpHFiQOUqacmY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyDKuKCPAQBu8xW2wJ0IgJPw+ZHKrzxYqzAzhl4gtUb0/wFvOVh4b1jdMMRbRaEZvzT9qErOvRArv8a3TDORxR5E88yiBEph8KTjkh4wziBrn37rZyJjF5mE3rglSJTbFT0b0uxU+BvLIHPEnnVs4lAWQtdO13CN9TLqgc9EGCz7kZ5C30Nusr5enE7IqzcTC+9LbiiqITagoyDOCyCycdxb9H5KwQtyKNo6aHBmIhkoyZHuXUnOuSthCGPlSyogTzAh0Mqye4dBgUoreCVhtyNN8yBoVlT36v7Ewqg4xNH2lrkeaxMTqYSyCOZI83MM/KuZC1DLOveIZ4SQUkwC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QiB+/urnfzXe/eo3tHgQ/gRpy1d7SMVHvIeRb+JAkKg=;
 b=iOUSUKGQeRUrnhgtS1O7tcj9BbKcPFtFNWR0lfzXhN/PpHwJvdcmWw3fIDgxGjujR3kW8ktG+oG8KmFRnUhocD5Ya80Qtjc0DUWLmEDExqWvel1cGJZko6j499TsMgMc8iWVD1LSrL+YEln/L6MXcQ096TrI6liYbScH7tPzZyYYeHPI/FEo/IN/krJH5mrkKK82Pdbb015zLjx0OWuojJyVTNKiWgUxnFO74z3QTR0cNz75WuCRDPnwUBr7S0xluWyr+NpLs2tH29q2xw6yYLwHPMtD+3wjOOvqm2Qj59VRB+zGjESp+nB6+bVfeVOECc9LvMcWm6amaqzK3X7cIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QiB+/urnfzXe/eo3tHgQ/gRpy1d7SMVHvIeRb+JAkKg=;
 b=7SBKQ0iQ6aq1c/BLgcfp0OW5oMxkG3LayZqmtc8pcIkZc5aLsfX4dw3keYvqDMaywMZfxDmq2cD2NTfres5T2bRwHTR3OtB8RKMcawCmCGPBHAk+j9DQTWtzW21DwnvVYZNEiLJf62cAkeUpEyqdazU9k2SgXyUpHFiQOUqacmY=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, "ayan.kumar.halder@xilinx.com"
	<ayan.kumar.halder@xilinx.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Topic: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Thread-Index:
 AQHZJxAhTWb1zeTHm029bSgcZo/2Yq6l4H6AgA7nVJCAAFMfgIAAHOxggAGXmACAARsywA==
Date: Tue, 31 Jan 2023 04:11:38 +0000
Message-ID:
 <AM0PR08MB45309F6DCB1B1E0975A741B7F7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <7931e70f-3754-363c-28d8-5fde3198d70f@xen.org>
 <AM0PR08MB45308D5CD69EBB5FE85A4B88F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3c915633-ddb8-d1e4-f42e-064aaff168b2@xen.org>
In-Reply-To: <3c915633-ddb8-d1e4-f42e-064aaff168b2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions:
 Wei.Chen@arm.com,sstabellini@kernel.org,Bertrand.Marquis@arm.com,ayan.kumar.halder@xilinx.com
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F2E2FC6CCAE42C449A4090FAEF29058B.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB4530:EE_|AS8PR08MB9480:EE_|DBAEUR03FT052:EE_|AS4PR08MB8048:EE_
X-MS-Office365-Filtering-Correlation-Id: 07613e93-c352-4384-9f80-08db034147a8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 O1eOdZwSAzmoeiVc8QoznTPS33c1W4o+GBxIVYmK/FzmfL09k1UwzQedewvjR0HCHH+6lKnISyUqT6zZvKfbmvYD6c4Or/kjoQuCDApj4xf2IE7jT7v4Ohpq0YeTxDtTzIasB+VE8VZZG6QFEtVzHbIoHbzXG1YqeISuTIZ2Z5i50+rXFDm2eDjdPHnn4KhuThdsME8aa557g9R7+P6CJdhG7bvOZT9AVnhC1yhmUVq37IwfStXaBq0UHRmo6cdY15COHldFJTvHgFV6vqn3F8lMmfW0WXRe8solS0FH58Op4fdOCznGSjt1ZqwMCMeKetBLLdHekmart+IdiTyLkIdOtefWEKQsJbgNscUhjqDBrLqnx0v+cu7q4s/X2936JnSZ1soUHhRUmwwFbzHFOXUb4xitvizB8MXh/SzBl+U6EqlYLqVsDkUVE0Dao0DFxA+wCyUw3h2gWVEmCQdGJCcSPqVPpiYn8GHsWp1eao/dj78ryvOIcypcSCd5aTevCNCezE/3rCBIDanxNRM7mLl6lhmg9KuN3inyS1izVIsvDTICVYewc7Rxrof5r14imfwUEHrMUSP0UsFrad4AeXX5fBhAY6rpV5kYoFMHT0dXP+5Sa9wB+o1WP1KkPUHis5WMbi38MBwEknDHW+6DWmhBjJ77n0vkIc0q63Vtye5SYxpLvxdGVTLfjWUCUHHbmF0rIyKpr28dnDdaKjrtZg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB4530.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(451199018)(4326008)(66946007)(76116006)(41300700001)(64756008)(66556008)(8676002)(66446008)(66476007)(33656002)(55016003)(8936002)(52536014)(316002)(5660300002)(110136005)(53546011)(83380400001)(71200400001)(2906002)(7696005)(186003)(9686003)(26005)(478600001)(6506007)(38070700005)(86362001)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9480
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35e87b48-f51f-4c84-c8ee-08db03413fd4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X50AutmX49K3NGTlGhY7cjVCNsEwlFW35lkXPX7i/Li9c8jfZqFir6ENyW5KJBhknS1V6ydwTXUxD7TOuqtKNkSxvCMl3vFP79KeZ1JLkF4dr1rOds4zlR1wzAMOk83o69d0+qphVJ4oJpz+Mvz08hXwx5Wc3pu4e5Qji16UMfpb1bur2ayWuee0LbONYhRBR3Sf08gClf1B6VU0NdSe3R60YenSAKdbyzL3ks1DzvOED4KmF8cTtNCY1N1PqzDLOugtxjIohBpwO2CZFyMZOTh9PrCdIqMXYTKiKgDoL6Jc6efsyskHsxtlBZbHM4lzKKsJAUDqwbZrnK/ezVbINiWGrSPtih7jtQIjpEAZ0ibtrUjG0cBZg2nNUsqJl8BWXvmk0QHqwhyvn3zlDS4pfAS99zyylIj0AN+HG1fPBIM+3IBnUEb+HOodGltRX3GQcThKQSrwPPO6+N1lIqIukTQoCxQ/My5fMzf+UZJ1mixNCZlK8nEc10Pp9Flxv2FZpeqLgpzOn/omLIfdCZCe4COUOMwh1gkD81oi6elMNdif25JPLo94sQQIzAQGmWoznC4bgu7aeCcqAIRrPWIu0uK9NuklUR+3aN1IKCnrVPKUgpfQC1zDq2u+eUJVqRWZlTC0/asVFafvClrMv+tcSx5VAOP9dX1jE3XgIpaTfT0iJZt+e3xQml8+lIl690c68TSc0GrQsa+MtG27qVPXCQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(136003)(396003)(376002)(451199018)(36840700001)(46966006)(40470700004)(5660300002)(55016003)(40480700001)(36860700001)(82310400005)(82740400003)(2906002)(33656002)(86362001)(40460700003)(478600001)(6506007)(53546011)(26005)(336012)(9686003)(7696005)(81166007)(356005)(110136005)(83380400001)(186003)(70206006)(70586007)(47076005)(107886003)(4326008)(8676002)(316002)(41300700001)(52536014)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 04:11:51.3047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07613e93-c352-4384-9f80-08db034147a8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8048

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogTW9uZGF5LCBKYW51YXJ5IDMwLCAyMDIz
IDU6NDAgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBXZWkgQ2hlbiA8V2VpLkNoZW5AYXJtLmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47DQo+IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAxMS80MF0geGVuL21wdTogYnVpbGQgdXAgc3RhcnQtb2YtZGF5IFhlbiBNUFUNCj4gbWVtb3J5
IHJlZ2lvbiBtYXANCj4gDQo+IEhpIFBlbm55LA0KPiANCj4gT24gMzAvMDEvMjAyMyAwNTo0NSwg
UGVubnkgWmhlbmcgd3JvdGU6DQo+ID4gICBUaGVyZSBhcmUgdGhyZWUgdHlwZXMgb2YgTVBVIHJl
Z2lvbnMgZHVyaW5nIGJvb3QtdGltZToNCj4gPiAxLiBGaXhlZCBNUFUgcmVnaW9uDQo+ID4gUmVn
aW9ucyBsaWtlIFhlbiB0ZXh0IHNlY3Rpb24sIFhlbiBoZWFwIHNlY3Rpb24sIGV0Yy4NCj4gPiAy
LiBCb290LW9ubHkgTVBVIHJlZ2lvbg0KPiA+IFJlZ2lvbnMgbGlrZSBYZW4gaW5pdCBzZWN0aW9u
cywgZXRjLiBJdCB3aWxsIGJlIHJlbW92ZWQgYXQgdGhlIGVuZCBvZiBib290aW5nLg0KPiA+IDMu
ICAgUmVnaW9ucyBuZWVkIHN3aXRjaGluZyBpbi9vdXQgZHVyaW5nIHZjcHUgY29udGV4dCBzd2l0
Y2gNCj4gPiBSZWdpb24gbGlrZSBzeXN0ZW0gZGV2aWNlIG1lbW9yeSBtYXAuDQo+ID4gRm9yIGV4
YW1wbGUsIGZvciBGVlBfQmFzZVJfQUVNdjhSLCB3ZSBoYXZlIFsweDgwMDAwMDAwLCAweGZmZmZm
MDAwKSBhcw0KPiA+IHRoZSB3aG9sZSBzeXN0ZW0gZGV2aWNlIG1lbW9yeSBtYXAgZm9yIFhlbihp
ZGxlIHZjcHUpIGluIEVMMiwgIHdoZW4NCj4gPiBjb250ZXh0IHN3aXRjaGluZyB0byBndWVzdCB2
Y3B1LCBpdCBzaGFsbCBiZSByZXBsYWNlZCB3aXRoDQo+ID4gZ3Vlc3Qtc3BlY2lmaWMgZGV2aWNl
IG1hcHBpbmcsIGxpa2UgdmdpYywgdnBsMDExLCBwYXNzdGhyb3VnaCBkZXZpY2UsIGV0Yy4NCj4g
Pg0KPiA+IFdlIGRvbid0IGhhdmUgdHdvIG1hcHBpbmdzIGZvciBkaWZmZXJlbnQgc3RhZ2UgdHJh
bnNsYXRpb25zIGluIE1QVSwgbGlrZQ0KPiB3ZSBoYWQgaW4gTU1VLg0KPiA+IFhlbiBzdGFnZSAx
IEVMMiBtYXBwaW5nIGFuZCBzdGFnZSAyIG1hcHBpbmcgYXJlIGJvdGggc2hhcmluZyBvbmUgTVBV
DQo+ID4gbWVtb3J5IG1hcHBpbmcoeGVuX21wdW1hcCkgU28gdG8gc2F2ZSB0aGUgdHJvdWJsZSBv
ZiBodW50aW5nIGRvd24NCj4gZWFjaA0KPiA+IHN3aXRjaGluZyByZWdpb25zIGluIHRpbWUtc2Vu
c2l0aXZlIGNvbnRleHQgc3dpdGNoLCB3ZSBtdXN0IHJlLW9yZGVyDQo+IHhlbl9tcHVtYXAgdG8g
a2VlcCBmaXhlZCByZWdpb25zIGluIHRoZSBmcm9udCwgYW5kIHN3aXRjaGluZyBvbmVzIGluIHRo
ZQ0KPiBoZWVscyBvZiB0aGVtLg0KPiANCj4gIEZyb20gbXkgdW5kZXJzdGFuZGluZywgaHVudGlu
ZyBkb3duIGVhY2ggc3dpdGNoaW5nIHJlZ2lvbnMgd291bGQgYmUgYQ0KPiBtYXR0ZXIgdG8gbG9v
cCBvdmVyIGEgYml0bWFwLiBUaGVyZSB3aWxsIGJlIGEgc2xpZ2h0IGluY3JlYXNlIGluIHRoZSBu
dW1iZXINCj4gb2YgaW5zdHJ1Y3Rpb25zIGV4ZWN1dGVkLCBidXQgSSBkb24ndCBiZWxpZXZlIGl0
IHdpbGwgYmUgbm90aWNlYWJsZS4NCj4gDQo+ID4NCj4gPiBJbiBQYXRjaCBTZXJpZSB2MSwgSSB3
YXMgYWRkaW5nIE1QVSByZWdpb25zIGluIHNlcXVlbmNlLCAgYW5kIEkNCj4gPiBpbnRyb2R1Y2Vk
IGEgc2V0IG9mIGJpdG1hcHMgdG8gcmVjb3JkIHRoZSBsb2NhdGlvbiBvZiBzYW1lIHR5cGUNCj4g
PiByZWdpb25zLiBBdCB0aGUgZW5kIG9mIGJvb3RpbmcsIEkgbmVlZCB0byAqZGlzYWJsZSogTVBV
IHRvIGRvIHRoZQ0KPiByZXNodWZmbGluZywgYXMgSSBjYW4ndCBtb3ZlIHJlZ2lvbnMgbGlrZSB4
ZW4gaGVhcCB3aGlsZSBNUFUgb24uDQo+ID4NCj4gPiBBbmQgd2UgZGlzY3Vzc2VkIHRoYXQgaXQg
aXMgdG9vIHJpc2t5IHRvIGRpc2FibGUgTVBVLCBhbmQgeW91DQo+ID4gc3VnZ2VzdGVkIFsxXSAi
DQo+ID4+IFlvdSBzaG91bGQgbm90IG5lZWQgYW55IHJlb3JnIGlmIHlvdSBtYXAgdGhlIGJvb3Qt
b25seSBzZWN0aW9uDQo+ID4+IHRvd2FyZHMgaW4gdGhlIGhpZ2hlciBzbG90IGluZGV4IChvciBq
dXN0IGFmdGVyIHRoZSBmaXhlZCBvbmVzKS4NCj4gPiAiDQo+IA0KPiBSaWdodCwgbG9va2luZyBh
dCB0aGUgbmV3IGNvZGUuIEkgcmVhbGl6ZSB0aGF0IHRoaXMgd2FzIHByb2JhYmx5IGEgYmFkIGlk
ZWENCj4gYmVjYXVzZSB3ZSBhcmUgYWRkaW5nIGNvbXBsZXhpdHkgaW4gdGhlIGFzc2VtYmx5IGNv
ZGUuDQo+IA0KPiA+DQo+ID4gTWF5YmUgaW4gYXNzZW1ibHksIHdlIGtub3cgZXhhY3RseSBob3cg
bWFueSBmaXhlZCByZWdpb25zIGFyZSwNCj4gPiBib290LW9ubHkgcmVnaW9ucyBhcmUsIGJ1dCBp
biBDIGNvZGVzLCB3ZSBwYXJzZSBGRFQgdG8gZ2V0IHN0YXRpYw0KPiBjb25maWd1cmF0aW9uLCBs
aWtlIHdlIGRvbid0IGtub3cgaG93IG1hbnkgZml4ZWQgcmVnaW9ucyBmb3IgeGVuIHN0YXRpYw0K
PiBoZWFwIGlzIGVub3VnaC4NCj4gPiBBcHByb3hpbWF0aW9uIGlzIG5vdCBzdWdnZXN0ZWQgaW4g
TVBVIHN5c3RlbSB3aXRoIGxpbWl0ZWQgTVBVIHJlZ2lvbnMsDQo+ID4gc29tZSBwbGF0Zm9ybSBt
YXkgb25seSBoYXZlIDE2IE1QVSByZWdpb25zLCBJTUhPLCBpdCBpcyBub3Qgd29ydGh5DQo+IHdh
c3RpbmcgaW4gYXBwcm94aW1hdGlvbi4NCj4gDQo+IEkgaGF2ZW4ndCBzdWdnZXN0ZWQgdG8gdXNl
IGFwcHJveGltYXRpb24gYW55d2hlcmUgaGVyZS4gSSB3aWxsIGFuc3dlcg0KPiBhYm91dCB0aGUg
bGltaXRlZCBudW1iZXIgb2YgZW50cmllcyBpbiB0aGUgb3RoZXIgdGhyZWFkLg0KPiANCj4gPg0K
PiA+IFNvIEkgdGFrZSB0aGUgc3VnZ2VzdGlvbiBvZiBwdXR0aW5nIHJlZ2lvbnMgaW4gdGhlIGhp
Z2hlciBzbG90IGluZGV4Lg0KPiA+IFB1dHRpbmcgZml4ZWQgcmVnaW9ucyBpbiB0aGUgZnJvbnQs
IGFuZCBwdXR0aW5nIGJvb3Qtb25seSBhbmQNCj4gPiBzd2l0Y2hpbmcgb25lcyBhdCB0YWlsLiBU
aGVuLCBhdCB0aGUgZW5kIG9mIGJvb3RpbmcsIHdoZW4gd2UgcmVvcmcgdGhlDQo+IG1wdSBtYXBw
aW5nLCB3ZSByZW1vdmUgYWxsIGJvb3Qtb25seSByZWdpb25zLCBhbmQgZm9yIHN3aXRjaGluZyBv
bmVzLCB3ZQ0KPiBkaXNhYmxlLXJlbG9jYXRlKGFmdGVyIGZpeGVkIG9uZXMpLWVuYWJsZSB0aGVt
LiBTcGVjaWZpYyBjb2RlcyBpbiBbMl0uDQo+IA0KPiAgRnJvbSB0aGlzIGRpc2N1c3Npb24sIGl0
IGZlZWxzIHRvIG1lIHRoYXQgeW91IGFyZSB0cnlpbmcgdG8gbWFrZSB0aGUgY29kZQ0KPiBtb3Jl
IGNvbXBsaWNhdGVkIGp1c3QgdG8ga2VlcCB0aGUgc3BsaXQgYW5kIHNhdmUgYSBmZXcgY3ljbGVz
IChzZWUgYWJvdmUpLg0KPiANCj4gSSB3b3VsZCBzdWdnZXN0IHRvIGludmVzdGlnYXRlIHRoZSBj
b3N0IG9mICJodW50aW5nIGRvd24gZWFjaCBzZWN0aW9uIi4NCj4gRGVwZW5kaW5nIG9uIHRoZSBy
ZXN1bHQsIHdlIGNhbiBkaXNjdXNzIHdoYXQgdGhlIGJlc3QgYXBwcm9hY2guDQo+IA0KDQpDb3Jy
ZWN0IG1lIGlmIEknbSB3cm9uZywgdGhlIGNvbXBsaWNhdGVkIHRoaW5ncyBpbiBhc3NlbWJseSB5
b3UgYXJlIHdvcnJpZWQgYWJvdXQNCmlzIHRoYXQgd2UgY291bGRuJ3QgZGVmaW5lIHRoZSBpbmRl
eCBmb3IgaW5pdGlhbCBzZWN0aW9ucywgbm8gaGFyZGNvZGVkIHRvIGtlZXAgc2ltcGxlLg0KQW5k
IGZ1bmN0aW9uIHdyaXRlX3ByLCBpaywgaXMgcmVhbGx5IGEgYmlnIGNodW5rIG9mIGNvZGVzLCBo
b3dldmVyIHRoZSBsb2dpYyBpcyBzaW1wbGUgdGhlcmUsDQpqdXN0IGEgYnVuY2ggb2YgInN3aXRj
aC1jYXNlcyIuDQoNCklmIHdlIGFyZSBhZGRpbmcgTVBVIHJlZ2lvbnMgaW4gc2VxdWVuY2UgYXMg
eW91IHN1Z2dlc3RlZCwgd2hpbGUgdXNpbmcgYml0bWFwIGF0IHRoZQ0Kc2FtZSB0aW1lIHRvIHJl
Y29yZCB1c2VkIGVudHJ5Lg0KVEJILCB0aGlzIGlzIGhvdyBJIGRlc2lnbmVkIGF0IHRoZSB2ZXJ5
IGJlZ2lubmluZyBpbnRlcm5hbGx5LiBXZSBmb3VuZCB0aGF0IGlmIHdlIGRvbid0DQpkbyByZW9y
ZyBsYXRlLWJvb3QgdG8ga2VlcCBmaXhlZCBpbiBmcm9udCBhbmQgc3dpdGNoaW5nIG9uZXMgYWZ0
ZXIsIGVhY2ggdGltZSB3aGVuIHdlDQpkbyB2Y3B1IGNvbnRleHQgc3dpdGNoLCBub3Qgb25seSB3
ZSBuZWVkIHRvIGh1bnQgZG93biBzd2l0Y2hpbmcgb25lcyB0byBkaXNhYmxlLA0Kd2hpbGUgd2Ug
YWRkIG5ldyBzd2l0Y2gtaW4gcmVnaW9ucywgdXNpbmcgYml0bWFwIHRvIGZpbmQgZnJlZSBlbnRy
eSBpcyBzYXlpbmcgdGhhdCB0aGUNCnByb2Nlc3MgaXMgdW5wcmVkaWN0YWJsZS4gVW5jZXJ0YWlu
dHkgaXMgd2hhdCB3ZSB3YW50IHRvIGF2b2lkIGluIEFybXY4LVIgYXJjaGl0ZWN0dXJlLiANCg0K
SG1tbSwgVEJILCBJIHJlYWxseSByZWFsbHkgbGlrZSB5b3VyIHN1Z2dlc3Rpb24gdG8gcHV0IGJv
b3Qtb25seS9zd2l0Y2hpbmcgcmVnaW9ucyBpbnRvDQpoaWdoZXIgc2xvdC4gSXQgcmVhbGx5IHNh
dmVkIGEgbG90IHRyb3VibGUgaW4gbGF0ZS1pbml0IHJlb3JnIGFuZCBhbHNvIGF2b2lkcyBkaXNh
YmxpbmcgTVBVDQphdCB0aGUgc2FtZSB0aW1lLiBUaGUgc3BsaXQgaXMgYSBzaW1wbGUgYW5kIGVh
c3ktdG8tdW5kZXJzdGFuZCBjb25zdHJ1Y3Rpb24gY29tcGFyZWQNCndpdGggYml0bWFwIHRvby4N
Cg0KSU1ITywgcmVvcmcgaXMgcmVhbGx5IHdvcnRoIGRvaW5nLiBXZSBwdXQgYWxsIGNvbXBsaWNh
dGVkIHRoaW5ncyBpbiBib290LXRpbWUgdG8NCm1ha2UgcnVudGltZSBjb250ZXh0LXN3aXRjaCBz
aW1wbGUgYW5kIGZhc3QsIGV2ZW4gZm9yIGEgZmV3IGN5Y2xlcy4NCkFzIHRoZSBBcm12OC1SIGFy
Y2hpdGVjdHVyZSBwcm9maWxlIGZyb20gdGhlIGJlZ2lubmluZyBpcyBkZXNpZ25lZCB0byBzdXBw
b3J0IHVzZQ0KY2FzZXMgdGhhdCBoYXZlIGEgaGlnaCBzZW5zaXRpdml0eSB0byBkZXRlcm1pbmlz
dGljIGV4ZWN1dGlvbi4gKGUuZy4gRnVlbCBJbmplY3Rpb24sDQpCcmFrZSBjb250cm9sLCBEcml2
ZSB0cmFpbnMsIE1vdG9yIGNvbnRyb2wgZXRjKS4NCkhvd2V2ZXIsIHdoZW4gdGFsa2luZyBhYm91
dCBhcmNoaXRlY3R1cmUgdGhpbmcsIEkgbmVlZCBtb3JlIHByb2Zlc3Npb25hbCBvcGluaW9ucywg
DQpAV2VpIENoZW4gQEJlcnRyYW5kIE1hcnF1aXMNCkFsc28sIFdpbGwgUjUyIGltcGxlbWVudGF0
aW9uIGVuY291bnRlciB0aGUgc2FtZSBpc3N1ZS4gQGF5YW4ua3VtYXIuaGFsZGVyQHhpbGlueC5j
b20NCkBTdGVmYW5vIFN0YWJlbGxpbmkNCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4g
R3JhbGwNCg0KQ2hlZXJzLA0KDQotLQ0KUGVubnkgWmhlbmcNCg==

