Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C708E64B3A3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 11:56:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460468.718381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52xM-0001oX-3x; Tue, 13 Dec 2022 10:56:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460468.718381; Tue, 13 Dec 2022 10:56:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p52xM-0001lp-15; Tue, 13 Dec 2022 10:56:16 +0000
Received: by outflank-mailman (input) for mailman id 460468;
 Tue, 13 Dec 2022 10:56:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CKYI=4L=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1p52xL-0001lj-4G
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 10:56:15 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2040.outbound.protection.outlook.com [40.107.15.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a1faa85-7ad4-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 11:51:31 +0100 (CET)
Received: from DB6PR0202CA0003.eurprd02.prod.outlook.com (2603:10a6:4:29::13)
 by DBBPR08MB5929.eurprd08.prod.outlook.com (2603:10a6:10:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Tue, 13 Dec
 2022 10:56:10 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:29:cafe::8) by DB6PR0202CA0003.outlook.office365.com
 (2603:10a6:4:29::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11 via Frontend
 Transport; Tue, 13 Dec 2022 10:56:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.21 via Frontend Transport; Tue, 13 Dec 2022 10:56:10 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Tue, 13 Dec 2022 10:56:10 +0000
Received: from 2d5b50c9d11e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E05CB3EB-A968-4292-9DB2-3ABD5A1AE3BE.1; 
 Tue, 13 Dec 2022 10:56:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d5b50c9d11e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Dec 2022 10:56:00 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by VI1PR08MB10050.eurprd08.prod.outlook.com (2603:10a6:800:1c4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.10; Tue, 13 Dec
 2022 10:55:55 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::b45:fa8a:caad:25c0%4]) with mapi id 15.20.5924.010; Tue, 13 Dec 2022
 10:55:55 +0000
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
X-Inumbo-ID: 1a1faa85-7ad4-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTdLLYaDC3+ZSY+aa8x5LCfn5EC6Euf4pS1uAG6MKx4=;
 b=HPgos1KD+5K7emMdcxFGCzWGNwievqYwJWX7fgIB3MKBHiM9+lln2K6qUxB/zVeLuu2b922FZeDnoEhFuSl2bgYAHSgoIKNPt4Hxf8Fh6ZBn5fSDy55tk5RbaueCi46/yw3rfXt5kyxcASEHZcC4v1REy2+yoI9zcLrh8EsnsVE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 089b1512e8883f9d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xmcv2lszNBvsxPob/pidv8y0MBTwy0rXLbLFbtb4ZAMxSR43yNxCsKFhTpg35zElhF0DhMztr+dm1tvhXL00vxLZOtaIEnJeoGQ4ygjtm+PAMRMrpI+qgJ5GJqHh08vPfFEQL9S+69vM0OQQcdHGecHj88NaNJvQW2RbK45fhM3I8qNDiX/tY9tDa0Xmuar5lBJrZwKKl6/V1n7LCMFZXFpeZmoKNJMmpVLx98Q2Ny3IpCXswUbjhfR0r8trDjiP6W/OlbNPaPV/jpLoIvWO4yQtIDWkOcMSR1qEjJP7e+Pp+syfvF/v010pyEhdCSXizeIEMt8ZVbOcPKeIAIJw+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTdLLYaDC3+ZSY+aa8x5LCfn5EC6Euf4pS1uAG6MKx4=;
 b=IEF7t9hCpFOYrvZxT5I6YsY70o1ossgsO4OSxCXrszfFgv86NCbB67tORLYhWPWJpfWQGwPHhTPH5jN69NQEH9HLP0b0DEcWJNAvEBhyuSwavL4+1OJM9VpKKVVKdgjJp8+5eoA7a7/T2n5xhpCFEYOMpa6+t2PJjbfBwSu3kNUKbApCNnSPSs77KOQEZQxGj/awDM2Ds0KdFBu+tnJtu9jmi1EflLTMseNcn9zAEFryi60NXqv7fkU5KGKF2nh4EVx7r2ndDKZfGnRFdF5OWNvrJriYrYvPHM+DWZQ9IoD4J+O88QEmLBWnpBziyGmCqK0Y9x2VbKzkjCPTzmYbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTdLLYaDC3+ZSY+aa8x5LCfn5EC6Euf4pS1uAG6MKx4=;
 b=HPgos1KD+5K7emMdcxFGCzWGNwievqYwJWX7fgIB3MKBHiM9+lln2K6qUxB/zVeLuu2b922FZeDnoEhFuSl2bgYAHSgoIKNPt4Hxf8Fh6ZBn5fSDy55tk5RbaueCi46/yw3rfXt5kyxcASEHZcC4v1REy2+yoI9zcLrh8EsnsVE=
From: Rahul Singh <Rahul.Singh@arm.com>
To: sisyphean <sisyphean@zlw.email>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [BUG]Add PCIE devie to SMMUv3 fail
Thread-Topic: [BUG]Add PCIE devie to SMMUv3 fail
Thread-Index: AQHZC5XCObk04ipFEE+2cKVjhEnU1a5lUAQAgARztoCAAEeegIAA9McAgACrnIA=
Date: Tue, 13 Dec 2022 10:55:55 +0000
Message-ID: <7A3DEEF0-F5B2-4CBD-BFB7-47C38C024E46@arm.com>
References: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
 <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>
 <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
 <e7766518-275c-1030-e8c0-51a5787a9985@xen.org>
 <757ac91b-150d-53fe-751b-7f42ec447f15@zlw.email>
In-Reply-To: <757ac91b-150d-53fe-751b-7f42ec447f15@zlw.email>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|VI1PR08MB10050:EE_|DBAEUR03FT049:EE_|DBBPR08MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c35d8b-d656-48d6-1de3-08dadcf8a4e3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zSSYYwVoefZKq6L5UGHBEF4NJvgmPPB5GvOqHxMO6lhsRIzE5RSOx2+W+H2xAycsKQ16TjhijYwkrNWudiZcjwPor3xu9b6prdCLa+jwnTgxCNC1Pp8E3qIhXLkHVapGhp2Js6R+fhZmJkafUm4pAktxRcNTsC2OUdMYIV0Pdw5nNDGW8HHOW+FOGPeWWEfoV3E4Igd5yUmrK1VQwrP2qknE4Rd1B72wqQZEc8pXV8/J5UrlbpmoVlE9WR71wJgZKKiZrhPNOAhqbZWcuqBtUg+wJ2dBUzMDzO2pfLSUhAYxE1h3Woh9CophZq+r2TGluSXZJtP3wXkgn+P4f5/gFAayJqJ75hDn5cGHHrDD/kD/GcQyONI6zWsyfx5x0YIub06bbHFpPnLZUPPDTcAe0BM/5jISauUi23tGWB6HuJlm020LNdkdEvaH2VZ1+/FvYdKIUXf4OgppCEt/aFlK4iYDycdksmzQ6++lbpU2QoEnaSAsRK0cEznsa+hY3MNFZRI9vEsvYSCjO2FAM/hbZUfmoEfv/WD7XI62gxSQ/9p6SOGtQUQ3eJmrFEEYC+/MmVmA2BH1z8RDShDhv9Nqz27zep0j8R4jnueRr4VVEBbb5Ubd37hUePEN9REvlq9dSnIC5QFFzUpmhClzb8oFIvPQCEJ6yo3UWkoL3aklUrcFEOXMyZYooSuP6RS+dY7HOJAgIrG+cnAbEKXIqRrb06+eBN7txHxsZNqbH6w3XWs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(122000001)(38100700002)(33656002)(83380400001)(38070700005)(5660300002)(66556008)(2906002)(4326008)(64756008)(66476007)(8936002)(8676002)(66446008)(66946007)(41300700001)(76116006)(53546011)(186003)(6506007)(6512007)(26005)(316002)(54906003)(6916009)(91956017)(6486002)(2616005)(478600001)(71200400001)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <16E3658F9DE0E34C9DE725C390B92F31@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10050
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	684b9cb9-1b01-47a0-1756-08dadcf89c07
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H0PMBclR/QXINPhpMityUrQUNaOEkCEIyvZKXtYn7O046wPFIFk8zfAF6ARsthCbnt7Dvk6lDrgF3T+P37Q06nEbOmuBxDvGSWv9ezosX0v0LcsHeaSMtP2VP3yrK2Nc0HggGKHqhsKA/n8tOei9hdq8JKX9446RDeOTc5ElcYUdaAGe0vRKcNISdrfwbifpDPszYoYq11dU6fY5Vpr2RL2h3rF5oMmqjHRy5dCnamUGw4qvFy3goawCEa0zziJrsyLAMLq+FGygffyIxSmaIL4gSEpL1rTaPkFVKbbLgzS+03fEHbKJT1GD0TiHEZxNdWFEG1NYvBuYdvkUaHPaPIhEWj7ughQ94tjYSGWi/HNkc25GrrcIikFbXdFxTKifu3Nd71cAzeurtrq2ssCw34LrjgDLd2fFLuT95r5oGBFqkvyEq/JCSFoVqaopn6GjCFbJguQ6qy8Y0w3lDsniYDtvMLQJHvIP3NUYlJYdU8RiDe3T8ZMLR4vCMHoI9j8DFmk0oIqHbFJjM6ZPVzIHqaMeYbmzzhHzkufLcjM72/p5X4Xp4imOsyTdOxHR4+rAoKyISFDRT6/jEjIJ79lgUjusPr0ajvhnGME5OGxNM/jMkqP7wZbbV0ve5uwBRAaYGednkF7VhKU4y/oIUbTfG0kc/z/4XED0iHqZKpKAWQZsgU8lJ9UOAeUOTxb+3951zN1HQ3nxABw1YjD457MsVg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(6486002)(316002)(4326008)(36756003)(70206006)(478600001)(54906003)(70586007)(8676002)(36860700001)(83380400001)(81166007)(82310400005)(40480700001)(82740400003)(356005)(6506007)(53546011)(336012)(47076005)(26005)(2616005)(6512007)(186003)(40460700003)(86362001)(41300700001)(8936002)(6862004)(5660300002)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 10:56:10.2538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c35d8b-d656-48d6-1de3-08dadcf8a4e3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5929

SGkgU2lzeXBoZWFuLA0KDQo+IE9uIDEzIERlYyAyMDIyLCBhdCAxMjo0MSBhbSwgc2lzeXBoZWFu
IDxzaXN5cGhlYW5Aemx3LmVtYWlsPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4g5ZyoIDIwMjIv
MTIvMTIgMTg6MDUsIEp1bGllbiBHcmFsbCDlhpnpgZM6DQo+PiANCj4+IE9uIDEyLzEyLzIwMjIg
MDU6NDksIHNpc3lwaGVhbiB3cm90ZToNCj4+PiBIaSwNCj4+IA0KPj4gSGksDQo+IFNvcnJ5IGZv
ciBteSBuZWdsaWdlbmNlLCBJIHdpbGwgYWRkIGEgY2MgdG8gYWxsIHN1YnNlcXVlbnQgZW1haWxz
Lg0KPj4gV2hlbiBzdWJtaXR0aW5nIGEgYnVnIHJlcG9ydCBmb3IgQXJtLCBjYW4geW91IHBsZWFz
ZSBDQyB0aGUgQXJtIG1haW50YWluZXJzPw0KPj4gDQo+Pj4g5ZyoIDIwMjIvMTIvOSAxNzo1MCwg
UmFodWwgU2luZ2gg5YaZ6YGTOg0KPj4+IEFmdGVyIHNldHRpbmcgWEVOIGFuZCBrZXJuZWwgYXMg
YWJvdmUsIEkgdHJpZWQgdGhlIGZvbGxvd2luZyB0d28gbWV0aG9kcyB0byBhZGQgYSBQQ0lFIGRl
dmljZSBwYXNzdGhyb3VnaDoNCj4+PiANCj4+PiAxLiBBY2NvcmRpbmcgdG8geW91ciBzdWdnZXN0
aW9uLCB1c2UgdGhlIGNvbW1hbmQgeGwgcGNpLWFzc2lnbmFibGUtYWRkIDAwMDI6MjE6MDAuMCB0
byBzZXQgaW4gdGhlIERvbTAuIEJ1dCBpbiBmdW5jdGlvbg0KPj4+IGlvbW11X2RvX3BjaV9kb21j
dGwsICBhZnRlciBkZXZpY2VfYXNzaWduZWQgaXMgY2FsbGVkLCBFTk9ERVYgZXJyb3IgaXMgb2J0
YWluZWQuDQo+Pj4gDQo+Pj4gMi4gQWRkIHhlbi1wY2liYWNrLmhpZGU9KDAwMDI6MjE6MDAuMCkg
dG8gZG9tMC1ib290YXJncyBpbiB0aGUgZGV2aWNlIHRyZWUsIEkgZW5jb3VudGVyZWQgdGhlIHNh
bWUgcHJvYmxlbSBhcyBiZWZvcmUNCj4+PiB3aGVuIGluaXRpYWxpemluZyB0aGUga2VybmVsLiBJ
biBmdW5jdGlvbiBwY2lfYWRkX2RldmljZSwgUENJRSBkZXZpY2VzIGNhbm5vdCBiZSBhZGRlZCB0
byBTTU1VdjMuDQo+Pj4gDQo+Pj4gVGhlIGtlcm5lbCB2ZXJzaW9uIEkgdXNlIGlzIDUuMTAuIERv
ZXMgdGhpcyBoYXZlIGFuIGltcGFjdD8NCj4+PiANCj4+PiBJbiBhZGRpdGlvbiwgYW4gZXJyb3Ig
d2FzIGVuY291bnRlcmVkIGFmdGVyIFhFTiBlbmFibGluZyBJVFM6DQo+Pj4gDQo+Pj4gSW4gZnVu
Y3Rpb24gZ2ljdjNfY3B1X2luaXQsIGdpY3YzX2l0c19zZXR1cF9jb2xsZWN0aW9uIHJldHVybiAt
RVRJTUVET1VULiBUaGlzIHByb2JsZW0gd2FzIHNvbHZlZCBhZnRlciBJIG1hZGUgdGhlDQo+Pj4g
Zm9sbG93aW5nIGNoYW5nZXM6DQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9n
aWMtdjMtaXRzLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jDQo+Pj4gaW5kZXggOTU1OGJh
ZC4uYTEyYzBkMSAxMDA2NDQNCj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXYzLWl0cy5jDQo+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2dpYy12My1pdHMuYw0KPj4+IEBAIC0xMTgsMTEgKzExOCwx
MSBAQCBzdGF0aWMgaW50IGl0c19zZW5kX2NvbW1hbmQoc3RydWN0IGhvc3RfaXRzICpod19pdHMs
IGNvbnN0IHZvaWQgKml0c19jbWQpDQo+Pj4gICAgICAgfQ0KPj4+IA0KPj4+ICAgICAgIG1lbWNw
eShod19pdHMtPmNtZF9idWYgKyB3cml0ZXAsIGl0c19jbWQsIElUU19DTURfU0laRSk7DQo+Pj4g
LSAgICBpZiAoIGh3X2l0cy0+ZmxhZ3MgJiBIT1NUX0lUU19GTFVTSF9DTURfUVVFVUUgKQ0KPj4+
ICsgICAgLy8gaWYgKCBod19pdHMtPmZsYWdzICYgSE9TVF9JVFNfRkxVU0hfQ01EX1FVRVVFICkN
Cj4+IA0KPj4gVGhpcyBpcyBzdWdnZXN0aW5nIHRoYXQgdGhlIGxvZ2ljIGluIGl0c19tYXBfY2Jh
c2VyKCkgZG9lc24ndCBkZXRlY3QgdGhlIGNvbW1hbmQgcXVldWUgaXMgdW5jYWNoZWFibGUuDQo+
PiANCj4+IExvb2tpbmcgYXQgdGhlIGNvZGUsIFhlbiB3aWxsIHdyaXRlIHRoZSByZWdpc3RlciB3
aXRoIHRoZSBzaGFyZWFiaWxpdHkgaXQgd2FudHMgYW5kIHRoZW4gcmVhZCBiYWNrIHRvIGNvbmZp
cm0gdGhlIElUUyAiYWNjZXB0IGl0Ii4gSWYgaXQgZGlkbid0IGFjY2VwdCwgdGhlbiB3ZSB3aWxs
IHVzZSB1bmNhY2hlYWJsZS4NCj4+IA0KPiBGdW5jdGlvbiBpdHNfbWFwX2NiYXNlcigpIGlzIGNh
bGxlZCB0d2ljZSwgYW5kIHRoZSByZWcgdmFsdWVzIHJlYWQgYnkgcmVhZHFfcmVsYXhlZChjYmFz
ZXJlZykNCj4gYXJlIDB4QjgwMDAwMDBFQkQwMDRGRiBhbmQgMHhCODAwMDAwMEVCQzAwNEZGIHJl
c3BlY3RpdmVseQ0KPj4gQ2FuIHlvdSBwcmludCB0aGUgdmFsdWUgcmVhZCBmcm9tIHRoZSBJVFMg
aW4gaXRzX21hcF9jYmFzZXIoKT8NCg0KWGVuIHdyaXRlcyAiSW5uZXJDYWNoZSwgYml0cyBbNjE6
NTldIiB0byAweDcgKE5vcm1hbCBJbm5lciBDYWNoZWFibGUgUmVhZC1hbGxvY2F0ZSwgV3JpdGUt
YWxsb2NhdGUsIFdyaXRlLWJhY2sgKSBvZiBjYmFzZXIgdG8gcGh5c2ljYWwgSVRTIGFuZA0Kd2hl
biB3ZSByZWFkIGJhY2sgd2UgYXJlIGdldHRpbmcgdGhlIHNhbWUgdmFsdWUgdGhhdCBtZWFucyBj
b21tYW5kIHF1ZXVlIG1lbW9yeSBpcyBtYXBwZWQgYXMgY2FjaGVkIGFzIHBlciBwaHlzaWNhbCBJ
VFMuDQoNCkJ1dCB3aGF0IHlvdSBhcmUgb2JzZXJ2aW5nIGlzIG9wcG9zaXRlLCBjb21tYW5kIHF1
ZXVlIG1lbW9yeSBpcyB1bmNhY2hlZCB0aGF0IGlzIHdoeSB5b3UgaGF2ZSB0byBjbGVhbiBhbmQg
aW52YWxpZGF0ZSB0aGUgZGNhY2hlLg0KSSBhbSBub3Qgc3VyZSB3aHkgdGhpcyBpcyBoYXBwZW5p
bmcgYnV0IG1heWJlIEhXIGlzIG5vdCBvcGVyYXRpbmcgY29ycmVjdGx5Lg0KIA0KUmVnYXJkcywN
ClJhaHVs

