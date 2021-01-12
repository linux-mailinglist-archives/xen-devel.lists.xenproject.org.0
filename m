Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CEA2F31B0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 14:29:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65681.116400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzJjA-0000dx-VV; Tue, 12 Jan 2021 13:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65681.116400; Tue, 12 Jan 2021 13:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzJjA-0000dY-SF; Tue, 12 Jan 2021 13:28:52 +0000
Received: by outflank-mailman (input) for mailman id 65681;
 Tue, 12 Jan 2021 13:28:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0QE=GP=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kzJj9-0000dT-3j
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 13:28:51 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e80d067e-3ad6-49f2-9804-29e6105930c5;
 Tue, 12 Jan 2021 13:28:48 +0000 (UTC)
Received: from AM6P192CA0077.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::18)
 by DBBPR08MB5996.eurprd08.prod.outlook.com (2603:10a6:10:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 13:28:46 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::6f) by AM6P192CA0077.outlook.office365.com
 (2603:10a6:209:8d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9 via Frontend
 Transport; Tue, 12 Jan 2021 13:28:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Tue, 12 Jan 2021 13:28:45 +0000
Received: ("Tessian outbound 8418c949a3fa:v71");
 Tue, 12 Jan 2021 13:28:44 +0000
Received: from c35fd274c369.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BAB3250A-A3FA-4444-81B6-E11F91106CE0.1; 
 Tue, 12 Jan 2021 13:28:39 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c35fd274c369.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Jan 2021 13:28:39 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB4220.eurprd08.prod.outlook.com (2603:10a6:10:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Tue, 12 Jan
 2021 13:28:36 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3742.012; Tue, 12 Jan 2021
 13:28:36 +0000
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
X-Inumbo-ID: e80d067e-3ad6-49f2-9804-29e6105930c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVdc7htg6k5X+rtTpFVIBnXnDtQP6OKnam0bGR6TiOA=;
 b=qIVFF7GmUDLdlhwKVSIRgtePC599cmdfO7w8aXCisMojupPnBrFms8ldjyDJlad3lEdqok+rH4dmRzR2M9t7siKFR/yKNYeXdz45akMRda+s/3r8by3ZhjGv0sPDaSxODuw+FADOYN5Q1x1K+swlid4FVhCg6iWziChPKX3eNgk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 05e7a60162b7db7b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aL7TOQq1H9xrX3bHcXzuTT5gLTS5qo8aMvPTbZ/Af1RCmR1A0301vuRC0bXZYp8ExNjTQdweZ8ePmrhtGIOThTtWa0z+G8oZfbZat0aUCmQlctWAgnAlRnzIxvMXcNNUuZwRluSsyBD0Ut2BRPixASfIAoVpmWX2SHqX3MFC9UEz4FrTTBjgOKLAZHBYOxPDBdct5+ZVojqlCD/hc0LBGBKRAaEeqFbSD0vm6X6KvD7PWbeTAmfHTR7yazNsMgUNJXgZ1WVH5biWBQAdGzEN1kYkXaluGfGTl7O2oqtCm9JkFsGoRLPb5qKTcirhynUOhf0umzOC6s7c500b3dITsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVdc7htg6k5X+rtTpFVIBnXnDtQP6OKnam0bGR6TiOA=;
 b=GgVwD4RMf+iuEDbfL0YHV/3CUBpdzMEGL7ChR4lyEEE0Cno6H5vhBtGT3ENy74bhWc6EklHBMLJSMOL7i3OZgWGmLXgxL4H+s7MBSea7cLNXGiMxd8a8a6TetWhtLSt4R4Pi08fKgsAys1AhNs324eoEjAe+dVWUK2sKX/yQg+ATVwJzzgXRYVLYbmUakkJXq9sUOf64LK5ybVmP45d0gN4drqt1FfMmbDjYKyQJYO66Md025xA8EFz49mGWcypuTmqWzGq3eAtJrJcGpB/Y/6OOQPUDPRemBGXiJI3BbdEybRIrazxLXdUSrllVOQLnva4D9MZ4CdzEk7M6ZPqzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVdc7htg6k5X+rtTpFVIBnXnDtQP6OKnam0bGR6TiOA=;
 b=qIVFF7GmUDLdlhwKVSIRgtePC599cmdfO7w8aXCisMojupPnBrFms8ldjyDJlad3lEdqok+rH4dmRzR2M9t7siKFR/yKNYeXdz45akMRda+s/3r8by3ZhjGv0sPDaSxODuw+FADOYN5Q1x1K+swlid4FVhCg6iWziChPKX3eNgk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Topic: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
Thread-Index: AQHW6HhYC4i0G8Gp3EOACUUuOGv+16oj03CAgAApR4A=
Date: Tue, 12 Jan 2021 13:28:35 +0000
Message-ID: <265E97F3-1AA1-4DE7-BA26-E208D953302A@arm.com>
References: <20210112001623.28421-1-sstabellini@kernel.org>
 <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org>
In-Reply-To: <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cb10823d-e0c5-433f-0035-08d8b6fdfcb9
x-ms-traffictypediagnostic: DB7PR08MB4220:|DBBPR08MB5996:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB599652EF79AC6B685A7AD597FCAA0@DBBPR08MB5996.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C83YIoY1cjWcWnZ3UQvtV8JJxbCENLuaARy/lWZobYmeZpQ3cYfeiW/SjklwujgWHR/yXEdf7eo1mExdmvGWGPLOcCDn0pXRR6oGo8KkjpVgiOCj3sWwXayYlVr2FM1At2PXDqT+K9PlaOSRcBXbQZccP4vNE84Emkgz1xQuDHSmLI/NpZ0pSXT1xgx82pRcZu3DVsotEa+Azcds7S1jaCgYBcLQmJ0b7dG07JnsVffAU3XSFB3Jd25VSGozCKcSGF8ae9P0NwgmxgT7P6zmFvvaRYmcy8w0E4N4ciLrxbuTUpwJJqbhrRY1eLXt+94b35fesG74irmCf1l26nFBeTJNIptr9W3nMWtvG9h2xUxPLSKhc/6fg6pW38dmiYfN8iQcAnkO+pZv/kXtiuHZ21WYsz8iEiXU3yPRKvudNd+BJPbBvRZGke1FqBt5KdcActcYsEauMIwWsnp2qmA7uyXvWoZaxYRTpKOYuw/Yv589UFQ9h7gkurJZF0yHuC0M1h0GyQo7hzyn5mxuRDE4SBB3e3GyycXjXwefT5eSCik=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(66946007)(66556008)(76116006)(33656002)(64756008)(6506007)(8676002)(91956017)(966005)(83380400001)(66446008)(186003)(2616005)(316002)(36756003)(54906003)(478600001)(6512007)(4326008)(5660300002)(2906002)(71200400001)(86362001)(66476007)(6486002)(53546011)(26005)(8936002)(6916009)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?N3ZLbFJIdTdoTVpLSGd3bHpWQ3FoQThHYzFQR0ZiV2lIVEw2R1ZIdCtuU1hH?=
 =?utf-8?B?MktVdWJFRjM1UzF1UjA3aGlzWjN5akJTY2VnRC9MMjQ0RGJ6eHc1bXhyS0RG?=
 =?utf-8?B?SDVXalBPSERVdUxlbnJoT09MaXQ1YWhTWkczL3l3TzJRSmltWXRCY2tEaGY0?=
 =?utf-8?B?b0g2U3pCeHJrTmxOK2dzdkF2Y1ZxYkl5N1dLSUNVa0dkZk8zR1VWSExDZWp5?=
 =?utf-8?B?QzQ5TUkrbXQxQVZ6V2JseUpROVJ3ZlNNMEtvOUVPNXluTkJ5d25OWkNKYm96?=
 =?utf-8?B?M0FmMW5DbVpOOWNoNHFSeG5SdXBQOXNMeGxhMlZJZVNGSUpFZm5Dck1QQTdI?=
 =?utf-8?B?L3RwUGdtUkdLWWtFMHVmZkNiN25ha2hLOXRoOVMzdk9nWDZUL2tCbUlpK2xB?=
 =?utf-8?B?MFE0c3prWEZrMUxUWGl1YmJ0VDEweSsxSW1vRWN4MHVhMlBQeFpNMTYzaVdq?=
 =?utf-8?B?dHZ6bFNrdnZGYzdsbndVZG9BREMyT3d5QkJMdG90MHdhSFBQdjVpUG4ybjZj?=
 =?utf-8?B?clhzZzc2V1lHUlBtV01GZlZHekRReDM2eXcyNG1uRVRDT25GMGx5bGtQSFl4?=
 =?utf-8?B?WUJKWmVSZzRrVVFoeUQ0QTIzd0x1MXUrazVRZVZSRXY0RnZXckR2MTF2VXRn?=
 =?utf-8?B?T0I1ajU3d1lSdzcxd211akg0WkloRElLTm00YXRsSzdKRk4rekhicGtTaEMr?=
 =?utf-8?B?M3ZYRzJWUVhrS3g5WEJSWGJ4SzFxVjZFd04raklwMXltZWJMZEk4dEN5T21u?=
 =?utf-8?B?eGozMGZvM1BBNHFlSG8vTlM4VDgreEVtaVF2cmpLRGVvNDRjWE5hajZiMHJX?=
 =?utf-8?B?WmNLTkVvNFFSc3dIdlFZRkJWNDhteVBpejVYbjdXWmhXS1hQUDVaRXRBdVM5?=
 =?utf-8?B?NzVzZlpQY1l3VFVqYWdHR2kwWmdEbFJHb1FSbHNQdjg3YUIxSVB3ZDBuRzU3?=
 =?utf-8?B?aEJzWWlRMWRzNzh0WFhmbXRsOW9ZNTFqTEIveVNMalg4VVRFamtPMlZPdFM0?=
 =?utf-8?B?L3dzMHZqMWticDh0NHBDalBzR2huR2JHVTRxYzF3S0REZ3JuVENHaHNKRnlQ?=
 =?utf-8?B?S2F5VkkyOE1ZY1U0OHRRQWpia2JvdCtLbUJtU0dsbndDTEE1MktBVE5ISEd1?=
 =?utf-8?B?UXlPb3Ixc1NESWViRFVtd0hEK2Q3amVrM3FhdUg4N2UvSnhjVU1FYmJ4dmhj?=
 =?utf-8?B?NnlnMitlVG1ZY2dlNE16dUQyNGJFdSs4Wmd6VlViSVN1Q01jTzdJWGpkVlVW?=
 =?utf-8?B?dFgxRU5xTG15cHJNT1Zsc0hmN0lKMVFiZkJyZzc2RDJHamZ6K09vQjBDVW5L?=
 =?utf-8?Q?RZ5AGqu15Ojn7AuSV72CZedEjbYZazXev5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F11AFDBFF253344914352E75B043AB9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4220
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6b6b0bce-e6bf-4891-0055-08d8b6fdf710
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WTbI/HkynDHV7z+kdkhMTLygcbvwHBG2lMSHjAoWZbMsvvAlYHtr2XsjGrz1L/iCOvCpTPdSRy529ozQYCFakky79Y6+zrkw6BW1ZF+TLigSBass3HHMB/h5TftyKkc3td9MJmxW8AvExEL8N3Jv7ij0Q9DDsEy4Wh7MbIcRT6imKVo0BhdHMM51Z7UH3vjXmBhNditLxzXR7ChVSx6nRRe0OcIWvyMUfE8B0lGZY1II4oTeXgZ+kRIVhXnpldAbBeUJg1Pp4AVzSwgpPjvGKHfMjRL2WoLSmZZfjKGGjVEqCFcFP/Q97JJLht5C4MGpnvkjJGcHEvXA/hBywfTm6e7P9cfcXz+NDgechRRROVhgPC1q4RaJsvIpjKYoffNYi47t9ijxD+ep/tuNcYb8KP8uf8CVA55+Z/Ve1R8ZBsHs9/8VwgCEhdHKDlyFrNgBx3ftFafXDjSZYyUwN9G5VSmDOQ3X0zbYaeF1HM4xWq/HWcDzAcrjbM/7F7Ow/ICvqhhqojUNu+Lfs372QfY+XrziIuE4QGFcaL73Sy8cltZyfAvbifphbK9XC9OEZ/vRS51m7wgWtX3TPYreEHj3mgfyhrp6+AZyRcudyaLChEc=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39860400002)(46966006)(33656002)(356005)(81166007)(70206006)(83380400001)(34020700004)(8936002)(2906002)(82310400003)(82740400003)(6512007)(186003)(6862004)(36756003)(70586007)(47076005)(4326008)(5660300002)(316002)(6506007)(6486002)(8676002)(53546011)(26005)(966005)(54906003)(86362001)(107886003)(336012)(2616005)(478600001)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 13:28:45.4109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb10823d-e0c5-433f-0035-08d8b6fdfcb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5996

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDEyIEphbiAyMDIxLCBhdCAxMTowMCBhbSwgSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBTdGVmYW5vLA0KPiANCj4gT24g
MTIvMDEvMjAyMSAwMDoxNiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4gRG9uJ3QgcmVh
ZCBhYXJjaDMyIHN5c3RlbSByZWdpc3RlcnMgYXQgYm9vdCB0aW1lIHdoZW4gdGhlIGFhcmNoMzIg
c3RhdGUNCj4+IGlzIG5vdCBhdmFpbGFibGUuIFRoZXkgYXJlIFVOS05PV04sIHNvIGl0IGlzIG5v
dCB1c2VmdWwgdG8gcmVhZCB0aGVtLg0KPj4gTW9yZW92ZXIsIG9uIENhdml1bSBUaHVuZGVyWCBy
ZWFkaW5nIElEX1BGUjJfRUwxIGNhdXNlcyBhIFhlbiBjcmFzaC4NCj4+IEluc3RlYWQsIG9ubHkg
cmVhZCB0aGVtIHdoZW4gYWFyY2gzMiBpcyBhdmFpbGFibGUuDQo+IEFBcmNoMzIgbWF5IGJlIHN1
cHBvcnRlZCBpbiBFTDAgYnV0IG5vdCBpbiBFTDEuIFNvIEkgdGhpbmsgeW91IHdhbnQgdG8gY2xh
cmlmeSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UvdGl0bGUgd2hpY2ggRUwgeW91IGFyZSByZWZlcnJp
bmcgdG8uDQo+IA0KPj4gTGVhdmUgdGhlIGNvcnJlc3BvbmRpbmcgZmllbGRzIGluIHN0cnVjdCBj
cHVpbmZvX2FybSBzbyB0aGF0IHRoZXkNCj4+IGFyZSByZWFkLWFzLXplcm8gZnJvbSBhIGd1ZXN0
Lg0KPj4gU2luY2Ugd2UgYXJlIGVkaXRpbmcgaWRlbnRpZnlfY3B1LCBhbHNvIGZpeCB0aGUgaW5k
ZW50YXRpb246IDQgc3BhY2VzDQo+PiBpbnN0ZWFkIG9mIDguDQo+IA0KPiBJIHdhcyBnb2luZyB0
byBhc2sgdG8gc3BsaXQgdGhhdCBpbiBhIHNlcGFyYXRlIHBhdGNoLiBCdXQgdGhlbiwgSSBub3Rp
Y2VkIHRoYXQgaXQgYXZvaWRzIHRvIGNoYW5nZSB0aGUgaW5kZW50YXRpb24gb2YgdGhlIGlmIGJv
ZHkgdHdpY2UuIFNvIEkgYW0gb2sgd2l0aCB0aGF0Lg0KPiANCj4+IEZpeGVzOiA5Y2ZkYjQ4OWFm
ODEgKCJ4ZW4vYXJtOiBBZGQgSUQgcmVnaXN0ZXJzIGFuZCBjb21wbGV0ZSBjcHVpbmZvIikNCj4+
IExpbms6IGh0dHBzOi8vbWFyYy5pbmZvLz9sPXhlbi1kZXZlbCZtPTE2MTAzNTUwMTExODA4Ng0K
PiANCj4gTklUOiBJIHdvdWxkIHN1Z2dlc3QgdG8gdXNlIGxvcmUua2VybmVsLm9yZyBqdXN0IGJl
Y2F1c2UgdGhlIGxpbmsgY29udGFpbnMgdGhlIG1lc3NhZ2UtaWQuIFNvIGlmIHRoZSB3ZWJzaXRl
IGdvZXMgZG93biwgaXQgaXMgc3RpbGwgcG9zc2libGUgdG8gdHJhY2sgdGhlIG9yaWdpbmFsIGRp
c2N1c3Npb24uDQo+IA0KPj4gTGluazogaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5v
cmcvb3NzdGVzdC9sb2dzLzE1ODI5My90ZXN0LWFybTY0LWFybTY0LXhsLXhzbS9pbmZvLmh0bWwN
Cj4gDQo+IElJUkMgd2Ugb25seSBrZWVwIHRoZSBsb2dzIGFyb3VuZCBmb3IgYSBjb3VwbGUgb2Yg
d2Vla3MuIFNvIHRoaXMgaXMgZ29pbmcgdG8gYmUgYnJlYWsgcXVpY2tseS4gVGhlcmVmb3JlLCBJ
IHdvdWxkIHN1Z2dlc3QgdG8gcmVtb3ZlIHRoaXMgbGluay4NCj4gDQo+PiBTdWdnZXN0ZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPg0KPj4gLS0tDQo+PiAg
eGVuL2FyY2gvYXJtL2NwdWZlYXR1cmUuYyB8IDM1ICsrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0
aW9ucygtKQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9jcHVmZWF0dXJlLmMgYi94ZW4v
YXJjaC9hcm0vY3B1ZmVhdHVyZS5jDQo+PiBpbmRleCA2OThiZmEwMjAxLi5iMWM4MmFkZTQ5IDEw
MDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL2NwdWZlYXR1cmUuYw0KPj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2NwdWZlYXR1cmUuYw0KPj4gQEAgLTEwMSwyOSArMTAxLDM1IEBAIGludCBlbmFibGVf
bm9uYm9vdF9jcHVfY2Fwcyhjb25zdCBzdHJ1Y3QgYXJtX2NwdV9jYXBhYmlsaXRpZXMgKmNhcHMp
DQo+PiAgICB2b2lkIGlkZW50aWZ5X2NwdShzdHJ1Y3QgY3B1aW5mb19hcm0gKmMpDQo+PiAgew0K
Pj4gLSAgICAgICAgYy0+bWlkci5iaXRzID0gUkVBRF9TWVNSRUcoTUlEUl9FTDEpOw0KPj4gLSAg
ICAgICAgYy0+bXBpZHIuYml0cyA9IFJFQURfU1lTUkVHKE1QSURSX0VMMSk7DQo+PiArICAgIGJv
b2wgYWFyY2gzMiA9IHRydWU7DQo+PiArDQo+PiArICAgIGMtPm1pZHIuYml0cyA9IFJFQURfU1lT
UkVHKE1JRFJfRUwxKTsNCj4+ICsgICAgYy0+bXBpZHIuYml0cyA9IFJFQURfU1lTUkVHKE1QSURS
X0VMMSk7DQo+PiAgICAjaWZkZWYgQ09ORklHX0FSTV82NA0KPj4gLSAgICAgICAgYy0+cGZyNjQu
Yml0c1swXSA9IFJFQURfU1lTUkVHKElEX0FBNjRQRlIwX0VMMSk7DQo+PiAtICAgICAgICBjLT5w
ZnI2NC5iaXRzWzFdID0gUkVBRF9TWVNSRUcoSURfQUE2NFBGUjFfRUwxKTsNCj4+ICsgICAgYy0+
cGZyNjQuYml0c1swXSA9IFJFQURfU1lTUkVHKElEX0FBNjRQRlIwX0VMMSk7DQo+PiArICAgIGMt
PnBmcjY0LmJpdHNbMV0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0UEZSMV9FTDEpOw0KPj4gKw0KPj4g
KyAgICBjLT5kYmc2NC5iaXRzWzBdID0gUkVBRF9TWVNSRUcoSURfQUE2NERGUjBfRUwxKTsNCj4+
ICsgICAgYy0+ZGJnNjQuYml0c1sxXSA9IFJFQURfU1lTUkVHKElEX0FBNjRERlIxX0VMMSk7DQo+
PiAgLSAgICAgICAgYy0+ZGJnNjQuYml0c1swXSA9IFJFQURfU1lTUkVHKElEX0FBNjRERlIwX0VM
MSk7DQo+PiAtICAgICAgICBjLT5kYmc2NC5iaXRzWzFdID0gUkVBRF9TWVNSRUcoSURfQUE2NERG
UjFfRUwxKTsNCj4+ICsgICAgYy0+YXV4NjQuYml0c1swXSA9IFJFQURfU1lTUkVHKElEX0FBNjRB
RlIwX0VMMSk7DQo+PiArICAgIGMtPmF1eDY0LmJpdHNbMV0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0
QUZSMV9FTDEpOw0KPj4gIC0gICAgICAgIGMtPmF1eDY0LmJpdHNbMF0gPSBSRUFEX1NZU1JFRyhJ
RF9BQTY0QUZSMF9FTDEpOw0KPj4gLSAgICAgICAgYy0+YXV4NjQuYml0c1sxXSA9IFJFQURfU1lT
UkVHKElEX0FBNjRBRlIxX0VMMSk7DQo+PiArICAgIGMtPm1tNjQuYml0c1swXSAgPSBSRUFEX1NZ
U1JFRyhJRF9BQTY0TU1GUjBfRUwxKTsNCj4+ICsgICAgYy0+bW02NC5iaXRzWzFdICA9IFJFQURf
U1lTUkVHKElEX0FBNjRNTUZSMV9FTDEpOw0KPj4gKyAgICBjLT5tbTY0LmJpdHNbMl0gID0gUkVB
RF9TWVNSRUcoSURfQUE2NE1NRlIyX0VMMSk7DQo+PiAgLSAgICAgICAgYy0+bW02NC5iaXRzWzBd
ICA9IFJFQURfU1lTUkVHKElEX0FBNjRNTUZSMF9FTDEpOw0KPj4gLSAgICAgICAgYy0+bW02NC5i
aXRzWzFdICA9IFJFQURfU1lTUkVHKElEX0FBNjRNTUZSMV9FTDEpOw0KPj4gLSAgICAgICAgYy0+
bW02NC5iaXRzWzJdICA9IFJFQURfU1lTUkVHKElEX0FBNjRNTUZSMl9FTDEpOw0KPj4gKyAgICBj
LT5pc2E2NC5iaXRzWzBdID0gUkVBRF9TWVNSRUcoSURfQUE2NElTQVIwX0VMMSk7DQo+PiArICAg
IGMtPmlzYTY0LmJpdHNbMV0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0SVNBUjFfRUwxKTsNCj4+ICAt
ICAgICAgICBjLT5pc2E2NC5iaXRzWzBdID0gUkVBRF9TWVNSRUcoSURfQUE2NElTQVIwX0VMMSk7
DQo+PiAtICAgICAgICBjLT5pc2E2NC5iaXRzWzFdID0gUkVBRF9TWVNSRUcoSURfQUE2NElTQVIx
X0VMMSk7DQo+PiArICAgIGMtPnpmcjY0LmJpdHNbMF0gPSBSRUFEX1NZU1JFRyhJRF9BQTY0WkZS
MF9FTDEpOw0KPj4gIC0gICAgICAgIGMtPnpmcjY0LmJpdHNbMF0gPSBSRUFEX1NZU1JFRyhJRF9B
QTY0WkZSMF9FTDEpOw0KPj4gKyAgICBhYXJjaDMyID0gYy0+cGZyNjQuZWwxID09IDI7DQo+IA0K
PiBUaGlzIGlzIGNoZWNraW5nIHRoYXQgQUFyY2gzMiBpcyBhdmFpbGFibGUgaW4gRUwxLiBIb3dl
dmVyLCBpdCBtYXkgbm90IGJlIHRoZSBjYXNlIHlldCBpdCB3b3VsZCBiZSBhdmFpbGFibGUgaW4g
RUwwLg0KDQpBcyBwZXIgbXkgdW5kZXJzdGFuZGluZyBwbGVhc2UgY29ycmVjdCBtZSBpZiBJIGFt
IHdyb25nLCBpZiBBQXJjaDMyIGlzIGFsbG93ZWQgYXQgYW4gRUwsIGl0IG11c3QgYmUgYWxsb3dl
ZCBhbGwgbG93ZXIgRXhjZXB0aW9uIGxldmVscy4gDQoNCkZvciBleGFtcGxlLCBpZiBFTDMgYWxs
b3dzIEFBcmNoMzIsIHRoZW4gaXQgbXVzdCBiZSBhbGxvd2VkIGF0IGFsbCBsb3dlciBFeGNlcHRp
b24gbGV2ZWxzLlRoYXQgbWVhbnMgaWYgd2UgYXJlIGNoZWNraW5nIHRoZSBFTDEgZm9yIEFBcmNo
MzIgRUwwIHNob3VsZCBhbHNvIHN1cHBvcnQgQUFyY2gzMi4gDQoNCkkgdGhpbmsgICJhYXJjaDMy
ID0gYy0+cGZyNjQuZWwxID09IDLigJ0gaXMgY29ycmVjdCB0byBjaGVjay4NCg0KUmVnYXJkcywN
ClJhaHVsDQoNCj4gQXMgYSBjb25zZXF1ZW5jZSwgMzItYml0IHVzZXJzcGFjZSB3b3VsZG4ndCB3
b3JrIHByb3Blcmx5IGFmdGVyIHRoaXMgcGF0Y2guDQo+IA0KPiBUaGUgQXJtIEFybSBtYW5kYXRl
cyB0aGF0IGlmIEFBcmNoMzIgaXMgYXZhaWxhYmxlIGF0IEVMKG4pLCB0aGVuIGl0IG11c3QgYmUg
YXZhaWxhYmxlIGF0IEVMKG4gLSAxKS4NCj4gDQo+IFNvIHdlIHNob3VsZCBjaGVjayB0aGF0IEFB
cmNoMzIgaXMgYXZhaWxhYmxlIGF0IEVMMCBiZWNhdXNlIHRoaXMgd291bGQNCj4gY292ZXIgdGhl
IGNhc2Ugd2hlcmUgQUFyY2gzMiBpcyBlbmFibGVkIGF0IEVMMS4NCj4gDQo+IEZ1cnRoZXJtb3Jl
LCBJIHdvdWxkIGFsc28gbGlrZSB0byBhdm9pZCBoYXJkY29kaW5nIHZhbHVlIGluIHRoZSBjb2Rl
IGFzIGl0IGlzIGxlc3MgcmVhZGFibGUuIFdlIGFscmVhZHkgZGVmaW5lIGNwdV9oYXNfZWwwXzMy
IHdoaWNoIHVzZSB0aGUgYm9vdCBDUFUgZmVhdHVyZS4gTWF5YmUgd2Ugd2FudCB0byBleHBhbmQg
dGhlIG1hY3JvIG9yIHNwbGl0IGl0Pw0KPiANCj4+ICAjZW5kaWYNCj4+ICArICAgIGlmICggYWFy
Y2gzMiApDQo+IEkgcmVhZCB0aGlzIGNoZWNrIGFzICJJZiBBQXJjaDMyIGlzIG5vdCBhdmFpbGFi
bGUgYXQgYW55IEVMIi4gQnV0IHlvdSBhcmUgY2hlY2tpbmcgd2hldGhlciBpdCBpcyBhdmFpbGFi
bGUgYXQgYSBnaXZlbiBsZXZlbC4gU28gSSB3b3VsZCBzdWdnZXN0IHRvIHN1ZmZpeCB3aXRoIHRo
ZSBFTCBmb3IgY2xhcmlmaWNhdGlvbi4NCj4gDQo+IEluIHRoaXMgY2FzZSwgSSB0aGluayB5b3Ug
d2lsbCB3YW50IHRvIGNhbGwgaXQgYWFyY2gzMl9lbDAuDQo+IA0KPj4gKyAgICB7DQo+PiAgICAg
ICAgICBjLT5wZnIzMi5iaXRzWzBdID0gUkVBRF9TWVNSRUcoSURfUEZSMF9FTDEpOw0KPj4gICAg
ICAgICAgYy0+cGZyMzIuYml0c1sxXSA9IFJFQURfU1lTUkVHKElEX1BGUjFfRUwxKTsNCj4+ICAg
ICAgICAgIGMtPnBmcjMyLmJpdHNbMl0gPSBSRUFEX1NZU1JFRyhJRF9QRlIyX0VMMSk7DQo+PiBA
QCAtMTUzLDYgKzE1OSw3IEBAIHZvaWQgaWRlbnRpZnlfY3B1KHN0cnVjdCBjcHVpbmZvX2FybSAq
YykNCj4+ICAjaWZuZGVmIE1WRlIyX01BWUJFX1VOREVGSU5FRA0KPj4gICAgICAgICAgYy0+bXZm
ci5iaXRzWzJdID0gUkVBRF9TWVNSRUcoTVZGUjJfRUwxKTsNCj4+ICAjZW5kaWYNCj4+ICsgICAg
fQ0KPj4gIH0NCj4+ICAgIC8qDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdy
YWxsDQoNCg==

