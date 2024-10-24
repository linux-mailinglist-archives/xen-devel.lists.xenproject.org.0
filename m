Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B4F9ADE53
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 09:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824980.1239168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3si7-00071n-PQ; Thu, 24 Oct 2024 07:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824980.1239168; Thu, 24 Oct 2024 07:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3si7-0006ys-MS; Thu, 24 Oct 2024 07:56:47 +0000
Received: by outflank-mailman (input) for mailman id 824980;
 Thu, 24 Oct 2024 07:56:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sutq=RU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t3si5-0006ym-PH
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 07:56:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f403:2614::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82cbc704-91dd-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 09:56:44 +0200 (CEST)
Received: from DU6P191CA0037.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::16)
 by PAVPR08MB9676.eurprd08.prod.outlook.com (2603:10a6:102:31f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 07:56:37 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::c1) by DU6P191CA0037.outlook.office365.com
 (2603:10a6:10:53f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18 via Frontend
 Transport; Thu, 24 Oct 2024 07:56:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 07:56:35 +0000
Received: ("Tessian outbound 60a4253641a2:v473");
 Thu, 24 Oct 2024 07:56:34 +0000
Received: from L9308e4ef1f61.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F688755B-616D-4797-B613-18E218751942.1; 
 Thu, 24 Oct 2024 07:56:25 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L9308e4ef1f61.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 07:56:25 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA4PR08MB6158.eurprd08.prod.outlook.com (2603:10a6:102:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 07:56:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 07:56:21 +0000
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
X-Inumbo-ID: 82cbc704-91dd-11ef-a0bf-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NE89wSw/8/kSFcL8bH0oH/1UAC5/RVzoF7ss0iEHiO3xZ38F/jCXILlr7wVA33D/v5rWYbDjfc1JmaBgusLI99OFub3xIV7uMbryuDAL4ZBjmGvXnxaN8yDUSbW+acyRvGIkFMSMf7eBqAXHcNUud8+eK6EsESZ2gHk259Biyi50V6xzIaa5v8YxPM70Kg87bJoe5dPsoouR/D2DHbhEyn/CZ+DhcqovGkBOwDqllwyJkbDJYKxZjLSYmOZG2cS37tbsrr+FVlrtKzO4H9/ZvNZTmH81F/Y4hbKVpYdLu8FcL4q/dDuoGxSZJP8P/z7oBkMnpozN9ts5ZGmSe0qgHg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnqOQXUyg5uSf4gYTBlGLyNmtlBemF3lVNNNgo8RtPk=;
 b=ne2V6zXf/YOH6VA1M+tRO0G6Wcmw9JhSUPtsjjC5rdAmc7pJe8mtuTVrIOYmPBEJyUNuo+PbXWNUTOrMUUYGyeA/yWD3D6Bwjg/UVMCVlgvT7F2mrWonYmFa34RaWmyStpFWa/WzWSF/4wf6No45ba3s/GvtQr0lD0BJgMPy/VQD/aQh8h21Jx1ttXNz980FDwAI1Sc5j3jEixdvc9viwq8PArvv+lF5mU5ccAAlBbp4BDJF2VtY+cLLzxnXNddg0eFuzuWKanv93i38cNOQnyb6SZJgUbYxeg1cw6+sL0Ez/lXijdqv91tGDcKcaoafKK73JMLcBXkXegT5w9OtIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnqOQXUyg5uSf4gYTBlGLyNmtlBemF3lVNNNgo8RtPk=;
 b=UQIdU5+TsNtLeoePGww29JlV2BTJCOuRd8AOZmpy17aLDNle945okGqO7I73r4h47g93bdsjjdk2FVALIEpMQY5Q/VSvbo4/axlPE3H+6cBwEav9LEnq11tZsxumInnVg+ZLz0Tdh9/VsZnxpGn/BP4fE+G+gcEHshzz1y1XvYg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0802c2103a81fee6
X-TessianGatewayMetadata: 5PdNQEjnFTuR0u8XqtrYgUu1yilupx51OPCFe8MdIgUbXNLYCozrKfa3iuMzvtYF3zQNPnI05ir5MuyI5u53eJy+mv6WOPpVss01/W4IROBfto29tL9UHL4qVvJtvUfa3S3Ti5XrUDuERH+MgCKlD+sRVJ5c9n3JYwR/WeoUbbc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQSOGVmO4xkz/MA+8bXRKhyzT4HuB5EzCA35UfUzq5pqaCVnige21U1lTR2jSRPLilfJHvbwqBGl8SpvUvpbZAWkUzpX3kXIomwU/jUbCT+7QKZrkUOjmiLziWxUyiJt0DWOL/K+lElwGCUuDjRRzjMSCfiJETu/TpSanoQMkLs6bVvG3DPYFYQT4LfKhbTNBld9LjVAuhGlSjuueJ8XR1/ztoD8EJI25iP9M1N1F/Ar5Bctt6ZFvd451CrOupmZIcMY13BXs+0quCPhA9pTpOOTlTlzo6T5xjvNrUemnXay53sNbe0l0k9G01GXcms7juMk+zSpVgj+QY/uGQxr9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JnqOQXUyg5uSf4gYTBlGLyNmtlBemF3lVNNNgo8RtPk=;
 b=DIrqZR/B0+WoPK1k51G0IsnqzUsqNjp33UCxtYcXhG3b3hA/q7ZhruHyu5oklHiXWVxuXlJw9BowHcjNbHcWQ2dWp+Dw1mYSj7vhvbg/AQLHaD6qr42GjJUOKkuz65dVumGQpq+pkk/yp9YVjVmvaH4cnrpTzX9sx1FaZNrSyEKHtUjYEGfJlIdS3pHvcKKl+BDurddj5UcrmVAXggQnS1fBS51clNHvayd31UaZtK96w6R/bo0Ioja0g2qFbxIDIi5KKLkLFbHZiZoapinltFVwnf+3ydL8ylSz0eBIimVh+ve5QpXiQ/Y8JZfqTtuj1/00vlBE/4CDIhX1SYunuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnqOQXUyg5uSf4gYTBlGLyNmtlBemF3lVNNNgo8RtPk=;
 b=UQIdU5+TsNtLeoePGww29JlV2BTJCOuRd8AOZmpy17aLDNle945okGqO7I73r4h47g93bdsjjdk2FVALIEpMQY5Q/VSvbo4/axlPE3H+6cBwEav9LEnq11tZsxumInnVg+ZLz0Tdh9/VsZnxpGn/BP4fE+G+gcEHshzz1y1XvYg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 06/10] xen/arm: ffa: Use bit 15 convention for SPs
Thread-Topic: [PATCH v2 06/10] xen/arm: ffa: Use bit 15 convention for SPs
Thread-Index: AQHbH6X4Kzq6WyYLgEicHYTh9yXtYLKUXBIAgAE5AgA=
Date: Thu, 24 Oct 2024 07:56:21 +0000
Message-ID: <F164CCF2-E7FA-4444-BC1D-0D720AB2154D@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <dec1c02aa0142263796c53b8df917fa25e2d2675.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44Gfkt-DOv0hZv+tPypgS59dVFrvLm=X-Dn=+Xu-hS-g+A@mail.gmail.com>
In-Reply-To:
 <CAHUa44Gfkt-DOv0hZv+tPypgS59dVFrvLm=X-Dn=+Xu-hS-g+A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA4PR08MB6158:EE_|DB1PEPF0003922E:EE_|PAVPR08MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: b9e29ea6-586f-47af-bee3-08dcf40161ca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?N01idE1HcmJGUVc2RnVwcFhERndZOU9vMm9sSmFIcm01QlpJYmRHN0FFSUJq?=
 =?utf-8?B?UCtxaG5wVjlCTVNpakNBWDBIYWJiYytONS9aQU81azZvTUlxMFlCNkRFQyt6?=
 =?utf-8?B?cGoxVWE4VlMyOTg3aFpSeVNTR2pLVlQwc1R2NlRHWTdBQ1VwczdURlNMN0pJ?=
 =?utf-8?B?aE5zcEJMNDFRRUhXYTA2eUduSDdKRTRVanRRWS8rTkxpdUQ5N3JPTVRsNE9n?=
 =?utf-8?B?U2xRVU1RZFdsVkpLS3RHVEtCMmlua2ZNSXFQRzZqNmRxZmtXbG8wVzF3MitY?=
 =?utf-8?B?Y0pzUDdycGI5K0M1M0JlVXVzaUloRXgxMFpQMkVpVFJyWDFJSzBCdkhZUk10?=
 =?utf-8?B?Z28wVEdCZkljOUdmZnAvYzBYcHJjc0lDYjJIbWwvcEtPR0NqL0dpREd4Qi8y?=
 =?utf-8?B?SWVHelhQaU5pK21EUFY4VnpWdlU3OTRjekoxWFF1MndEVnN3SGtlL3NaaDZl?=
 =?utf-8?B?bmhRdlc2NDVxdzRCRGhFcFpoMnJmT1FVcWdKTVNWWUJWck5zSEI1dlcwMFpa?=
 =?utf-8?B?S29VRU5nOFo2ay9saE5BUkRJbjJtRWtobm00SUJsQlYwc3FxWWhIZVpwdjY4?=
 =?utf-8?B?VWRqTUUxZTNWK0xqaHFhV28xODhGU1NSb3IwdEhxSG1sbW1pNEp3VWI1d0Rs?=
 =?utf-8?B?YVhvZ3FGV1o5bkp0azNycHBTWnVMVDR6ZG4ycWV3NTk3SGU4VVI5Z0JHZG43?=
 =?utf-8?B?b1p3NWxWS2cwVlJPTTVSdGw5VCs1TjR5TFRwN0FGaWNYbktCb2syMHVlTnlz?=
 =?utf-8?B?aXhVT1NuKzRtdG1LT05wQmIxVmEwSHFjSkltdXZwV2VscGxTWmRzYjdibklw?=
 =?utf-8?B?bzhZRUdMNlIrdXNHS24vMzhLdXJLUlZQNXliSWoxdHAvdW9HM283bDJIdFkv?=
 =?utf-8?B?Yi83eENvMU1jSEJ5M004bDRRQzlHYUt1QU1oNU9xMHlUZS91UUZFUTBTSmZZ?=
 =?utf-8?B?SWNRVm8vdEVjSWcvY3JCd3huc3NsWno4Y0E5K1JVSjlqMktaQUphczdWVm1z?=
 =?utf-8?B?RkJWemJ1WHNDK3JlVW14NkRkTE05NXdxYWQ0QW10UldmNjF0QjIyMHlXK2NN?=
 =?utf-8?B?bTdqU25sM3lBQ2ZxZ0pGN2tVaTVvRVVRWm15elNaN3VkSFBOaUJBOGlNdzFz?=
 =?utf-8?B?VTZFNjBzRmFaWjlJRDhlTGhXZE5WbUJuM1dXeURQTzdYMmNFR3ovMEszSUNS?=
 =?utf-8?B?aWpkck13OTltMGJJVW10a2I4eDAxeVcwV1BCTkpvYlh6blBtMHg0cFJLREEw?=
 =?utf-8?B?WGtqTzBGZ2gwZ1dmcnkwTmNJdVJyT25WQ0F4N2JFMnJtdGFUR1lMQnA4UWY2?=
 =?utf-8?B?cDBnbTdoT0g1SFNBZDkrRERvQ2xVUkpaUG02eHVHUXFDeUtxSEdZWFVwOGRF?=
 =?utf-8?B?UDNuZ1Y2Um1CWEQyTTZWdFpUd05HcDJiL1dOTlpYUzY4akRzQWJzNWlnREhT?=
 =?utf-8?B?ZDIrdDVFQ0d4OGw3Q1oxUitPOHE3Z0NBUEhqbXYzU2R2UElzeCtodU9VbDg2?=
 =?utf-8?B?cmtkT0cxNlFXdjcxQWpJV2c4NDBNcG5ubStKNS9qdlZzc29jbUl6dlhwU0VV?=
 =?utf-8?B?eS90a2JDN2VhZ3dWNSt5SzJkUTY3ZnFPYWV2YkY2MDBNMk5BNG5nU2w5dHZj?=
 =?utf-8?B?bFZ3bC95dHYwaDI1cmRvYkpiZ0cxb3BITFdKV3NGb2JkZWhZdDZNWnNGbElD?=
 =?utf-8?B?SlNkSSt3SE8waW9BVnlGNFZSL04wcHZYSGRzUCtWVFpSeXNqNysvSE8rdjRs?=
 =?utf-8?B?VTU1VjBuVGFoVzhhNjlxblY3R2dMbUJNR25iTDFETlhQMFR6N0RkcHZnME1z?=
 =?utf-8?Q?fGvv/cw+nAnv4xXvKHgMOWzOPfOvrgkR19hB8=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <48390B08532DF54BBFE1BEEBC3B881D1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6158
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	531267f5-3120-4b2f-94f0-08dcf4015968
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXBCTzl0NzZaVHpHQ3hONEtpRlE1ZDVjTEpFQjgxNkd5cDFrVnRiZVhjN200?=
 =?utf-8?B?QmU3L0I0RkdILzlxR0t6K1JkWFRmQXhhOGYwMW9vaWdXSnM0SGRGM1RCMDJ5?=
 =?utf-8?B?TFRDOHpZTEwvdHNCL1ZZd1NvbjMyUWFjWGRrWEJNZGVSb3BRekN6SUh1d1ZP?=
 =?utf-8?B?ekJhdmdGN2R3bnQ3UHRURERCREwxbHNxSmRidjV2UFNtVlBrNEZpTnRkendK?=
 =?utf-8?B?K1pnYVZYU21vV0VwaEM4UithVWJLZmhwdzlHNGp6YVBvcEJDQ3hua0tmWkla?=
 =?utf-8?B?UlVLQ2JzQVdxeTdoSnZycWFIeHVkVHF1VkdPVU9MYmVGa0pNblNZSzZ4T3hi?=
 =?utf-8?B?dUhVdHVLM3lWcHYrYURMU1VTK1hiUmY0OU5qQ0lpV0kvUW42NUJLdCtqbHdS?=
 =?utf-8?B?b3dUNG9ZYXNmY0ZBSU9uOS9rZERUT0cvV011SC9pa0lBNFo3TjlsMHFwK3Rv?=
 =?utf-8?B?eFFPYk5TeXdKR2Nlczd0aTZHeitPdWpyZmFSRnJpcGpxaWFSWXRkM25QbWhy?=
 =?utf-8?B?a1ZuaGQ1Zlpjd0J5Z0hQM2ZtOE5oQnlrekdWdFZuV2Y5aE95NzdBa3VvdGtS?=
 =?utf-8?B?TlNZT1RjMmU5QnVuUWxSZUpqWlNzZlUwWE5uMlQ3SDZmajBCOUxKcXFiMlBP?=
 =?utf-8?B?Z2luam9WL1dNenpoTWVIS2J1OWJPQ1I3RXE1SjJmUzJuU1MzZ1lJd3F6V1M5?=
 =?utf-8?B?M2hFSWgvZ2hzUXc4eE43THlUNFhXVy9GM2tycERLOERzU3lNd1Q1djgvTy83?=
 =?utf-8?B?Vk1qOHFiOEkwZ014dk53WTFPK29FSE1kS3F6dkpZVXNtRWZoSlQ5QkhNRWIz?=
 =?utf-8?B?UWVQNktOaHFBMEVsUDFoYWt1UzZLNnpWSldLdjBVN2EwTElSMTVBM3dFUEVG?=
 =?utf-8?B?Vm9FRUVCdCtIeWRoaFN6eDVEMEprb0hvWGdZNUJ0a0dmUEIxQzBIV2JUbkxT?=
 =?utf-8?B?bEp6ek9aazdDSHNXa3l0WnhiRnREQ05XUWYzNWNQR0lVcFM0K290bmtvdXpO?=
 =?utf-8?B?Q2J5ZG03eXhFaTFpOVdkMjl3T2Z4NlJhWmFvK2RUaUNsWnVUV3VJUGprWUJs?=
 =?utf-8?B?TnR4Y2VVbHAvL1dUZ0c4TVpHWVN2T29LZjlFVG9yUlJodUo3eXB6Q3F3b2VF?=
 =?utf-8?B?bzRPQkYvOGg0QnpmckU1TWxKQUptanBtMDVLZ1VmVWM3OGQ1cTVRdVEvOXFu?=
 =?utf-8?B?NkZmRWxvQU5OUC9ET3BoV05oSWc3OTV2UXUvYWZ2OHFLNmVHeXhzZi9jRE5I?=
 =?utf-8?B?dkxNWVB1T0xQWlpjZi9UaG5FYVZGbmZwSWd1RXhla0cveGFzdjJsbXlFMk44?=
 =?utf-8?B?ekhWdEF3MkhHZUVCblR0TGVxYjVNbU1zcXk5WjR2WGk5R1hteTZRY0VNTHpQ?=
 =?utf-8?B?NmVreFZ4bGFyVEljMzArTkJ6R0JUL01pdTRJZHdBQnJDNDRKK0ZzakREdUZ6?=
 =?utf-8?B?SVV1a0IvaXRlSUhVTFVveFYzY2VrNFk1STZPRDFZYXdRMGZSaC9CcEZkNFIx?=
 =?utf-8?B?OUZFSEN5WGlEKzBLYVl5S28wWThPWTBpeDYvS0twUkNCL25Pa3gzZVhoNXR5?=
 =?utf-8?B?TW1RNm9yenZZNFYweFNabXdJTXZBaWxNSmFWcUMxK2JTaXFXRlFsdDNpRUJx?=
 =?utf-8?B?Nm11NUlnRlUrdXA3S1ZyUUFkcElzRno3REZNek9tdHluZFZDNUp4ODZCN3h1?=
 =?utf-8?B?NUdhaWlhM3BXRkpTSldJckRNLzVnZ0oxc0duQXdJOStYVDd4b0k0TGxlYU5O?=
 =?utf-8?B?UFNuVzhSUFcvUGtlcXZVcGxnMDB1cjlvblJ0Ylp4UTBzZU5aUHczVm5DeUNF?=
 =?utf-8?B?a1lLWVgwcmdTSFJ4cEc0RlNoQy9sV3F6MXJ2enBXdHpKcit5MFdwZytTUzRx?=
 =?utf-8?B?SnZwbnBoVXQ0YzV1WUttZXFIUWV3b3RMYTBLKzNLV3BuSlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 07:56:35.2589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e29ea6-586f-47af-bee3-08dcf40161ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9676

SGkgSmVucywNCg0KPiBPbiAyMyBPY3QgMjAyNCwgYXQgMTU6MTUsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6MzLigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBNYWtlIHVzZSBhbmQg
cmVxdWlyZWQgdG8gaGF2ZSBiaXQgMTUgY29udmVudGlvbiByZXNwZWN0ZWQgYnkgc2VjdXJlDQo+
PiB3b3JsZCAoaGF2aW5nIGJpdCAxNSBvZiBJRHMgc2V0IGZvciBzZWN1cmUgZW5kcG9pbnRzIGFu
ZCBub24tc2V0IGZvcg0KPj4gbm9uLXNlY3VyZSBvbmVzKS4NCj4+IElmIGFueSBzZWN1cmUgcGFy
dGl0aW9uIGhhcyBhbiBJRCB3aXRoIGJpdCAxNSBub3Qgc2V0LCBpdCB3aWxsIG5vdCBiZQ0KPj4g
cG9zc2libGUgdG8gY29udGFjdCBvciBkZXRlY3QgdGhlbS4NCj4+IFByaW50IGFuIGVycm9yIGxv
ZyBkdXJpbmcgcHJvYmUgZm9yIGVhY2ggc2VjdXJlIGVuZHBvaW50IGRldGVjdGVkIHdpdGgNCj4+
IGJpdCAxNSBub3Qgc2V0Lg0KPj4gDQo+PiBXZSBhcmUgc3dpdGNoaW5nIHRvIHRoaXMgY29udmVu
dGlvbiBiZWNhdXNlIFhlbiBpcyBjdXJyZW50bHkgbm90IHVzaW5nDQo+PiBWTUlEcyB3aXRoIGJp
dCAxNSBzZXQgc28gd2UgYXJlIHN1cmUgdGhhdCBubyBWTSB3aWxsIGhhdmUgaXQgc2V0ICh0aGlz
DQo+PiBpcyBlbnN1cmVkIGJ5IEJVSUxEX0JVR19PTiBpbiBjYXNlIHRoaXMgYmVjb21lcyBmYWxz
ZSBpbiB0aGUgZnV0dXJlKS4NCj4+IEl0IGlzIGFsbG93aW5nIHRvIGVhc2lseSBkaXN0aW5ndWlz
aCBiZXR3ZWVuIHNlY3VyZSBhbmQgbm9uLXNlY3VyZQ0KPj4gZW5kcG9pbnRzLCBwcmV2ZW50aW5n
IHRoZSBuZWVkIHRvIHN0b3JlIGEgbGlzdCBvZiBzZWN1cmUgZW5kcG9pbnQgSURzIGluDQo+PiBY
ZW4uDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRyYW5kLm1h
cnF1aXNAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gQ2hhbmdlcyBpbiB2MjoNCj4+IC0gcmViYXNlDQo+
PiAtLS0NCj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhLmMgICAgICAgICAgfCAyMiArKysrKysrKysr
Ky0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcGFydGluZm8uYyB8IDU0ICsrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLQ0KPj4geGVuL2FyY2gvYXJtL3RlZS9mZmFfcHJpdmF0ZS5o
ICB8ICA3ICsrKysrDQo+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYyAgICAgIHwgMTIgKysr
KysrKy0NCj4+IDQgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25z
KC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jIGIveGVuL2Fy
Y2gvYXJtL3RlZS9mZmEuYw0KPj4gaW5kZXggNGI1NWU4YjQ4ZjAxLi5hMjkyMDAzY2E5ZmUgMTAw
NjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYS5jDQo+PiArKysgYi94ZW4vYXJjaC9h
cm0vdGVlL2ZmYS5jDQo+PiBAQCAtMTk1LDYgKzE5NSwxNCBAQCBzdGF0aWMgdm9pZCBoYW5kbGVf
bXNnX3NlbmRfZGlyZWN0X3JlcShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdWludDMyX3Qg
ZmlkKQ0KPj4gICAgICAgICBnb3RvIG91dDsNCj4+ICAgICB9DQo+PiANCj4+ICsgICAgLyogd2Ug
ZG8gbm90IHN1cHBvcnQgZGlyZWN0IG1lc3NhZ2VzIHRvIFZNcyAqLw0KPj4gKyAgICBpZiAoICFG
RkFfSURfSVNfU0VDVVJFKHNyY19kc3QgJiBHRU5NQVNLKDE1LDApKSApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIHJlc3AuYTAgPSBGRkFfRVJST1I7DQo+PiArICAgICAgICByZXNwLmEyID0gRkZB
X1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4gKyAgICAgICAgZ290byBvdXQ7DQo+PiArICAgIH0NCj4+
ICsNCj4+ICAgICBhcmcuYTEgPSBzcmNfZHN0Ow0KPj4gICAgIGFyZy5hMiA9IGdldF91c2VyX3Jl
ZyhyZWdzLCAyKSAmIG1hc2s7DQo+PiAgICAgYXJnLmEzID0gZ2V0X3VzZXJfcmVnKHJlZ3MsIDMp
ICYgbWFzazsNCj4+IEBAIC0zOTEsMTEgKzM5OSwxNSBAQCBzdGF0aWMgaW50IGZmYV9kb21haW5f
aW5pdChzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gDQo+PiAgICAgaWYgKCAhZmZhX2Z3X3ZlcnNpb24g
KQ0KPj4gICAgICAgICByZXR1cm4gLUVOT0RFVjsNCj4+IC0gICAgIC8qDQo+PiAtICAgICAgKiBX
ZSBjYW4ndCB1c2UgdGhhdCBsYXN0IHBvc3NpYmxlIGRvbWFpbiBJRCBvciBmZmFfZ2V0X3ZtX2lk
KCkgd291bGQNCj4+IC0gICAgICAqIGNhdXNlIGFuIG92ZXJmbG93Lg0KPj4gLSAgICAgICovDQo+
PiAtICAgIGlmICggZC0+ZG9tYWluX2lkID49IFVJTlQxNl9NQVgpDQo+PiArICAgIC8qDQo+PiAr
ICAgICAqIFdlIGFyZSB1c2luZyB0aGUgZG9tYWluX2lkICsgMSBhcyB0aGUgRkYtQSBJRCBmb3Ig
Vk1zIGFzIEZGLUEgSUQgMCBpcw0KPj4gKyAgICAgKiByZXNlcnZlZCBmb3IgdGhlIGh5cGVydmlz
b3IgYW5kIHdlIG9ubHkgc3VwcG9ydCBzZWN1cmUgZW5kcG9pbnRzIHVzaW5nDQo+PiArICAgICAq
IEZGLUEgSURzIHdpdGggQklUIDE1IHNldCB0byAxIHNvIG1ha2Ugc3VyZSB0aG9zZSBhcmUgbm90
IHVzZWQgYnkgWGVuLg0KPj4gKyAgICAgKi8NCj4+ICsgICAgQlVJTERfQlVHX09OKERPTUlEX0ZJ
UlNUX1JFU0VSVkVEID49IFVJTlQxNl9NQVgpOw0KPj4gKyAgICBCVUlMRF9CVUdfT04oKERPTUlE
X01BU0sgJiBCSVQoMTUsIFUpKSAhPSAwKTsNCj4+ICsNCj4+ICsgICAgaWYgKCBkLT5kb21haW5f
aWQgPj0gRE9NSURfRklSU1RfUkVTRVJWRUQgKQ0KPj4gICAgICAgICByZXR1cm4gLUVSQU5HRTsN
Cj4+IA0KPj4gICAgIGN0eCA9IHh6YWxsb2Moc3RydWN0IGZmYV9jdHgpOw0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2Zm
YV9wYXJ0aW5mby5jDQo+PiBpbmRleCA3NWEwNzNkMDkwZTAuLjNjZjgwMTUyMzI5NiAxMDA2NDQN
Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMNCj4+ICsrKyBiL3hlbi9h
cmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMNCj4+IEBAIC0xNjksMTQgKzE2OSwyNiBAQCB2b2lk
IGZmYV9oYW5kbGVfcGFydGl0aW9uX2luZm9fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
KQ0KPj4gDQo+PiAgICAgaWYgKCBmZmFfc3BfY291bnQgPiAwICkNCj4+ICAgICB7DQo+PiAtICAg
ICAgICB1aW50MzJfdCBuOw0KPj4gKyAgICAgICAgdWludDMyX3QgbiwgcmVhbF9udW0gPSBmZmFf
c3BfY291bnQ7DQo+IA0KPiBOaXQ6IGhvdyBhYm91dCBuX2xpbWl0IGluc3RlYWQgb2YgcmVhbF9u
dW0/DQoNClN1cmUgaSB3aWxsIGNoYW5nZSB0aGF0IGluIHYzLg0KDQo+IA0KPj4gICAgICAgICB2
b2lkICpzcmNfYnVmID0gZmZhX3J4Ow0KPj4gDQo+PiAgICAgICAgIC8qIGNvcHkgdGhlIHNlY3Vy
ZSBwYXJ0aXRpb25zIGluZm8gKi8NCj4+IC0gICAgICAgIGZvciAoIG4gPSAwOyBuIDwgZmZhX3Nw
X2NvdW50OyBuKysgKQ0KPj4gKyAgICAgICAgZm9yICggbiA9IDA7IG4gPCByZWFsX251bTsgbisr
ICkNCj4+ICAgICAgICAgew0KPj4gLSAgICAgICAgICAgIG1lbWNweShkc3RfYnVmLCBzcmNfYnVm
LCBkc3Rfc2l6ZSk7DQo+PiAtICAgICAgICAgICAgZHN0X2J1ZiArPSBkc3Rfc2l6ZTsNCj4+ICsg
ICAgICAgICAgICBzdHJ1Y3QgZmZhX3BhcnRpdGlvbl9pbmZvXzFfMSAqZnBpID0gc3JjX2J1ZjsN
Cj4+ICsNCj4+ICsgICAgICAgICAgICAvKiBmaWx0ZXIgb3V0IFNQIG5vdCBmb2xsb3dpbmcgYml0
IDE1IGNvbnZlbnRpb24gaWYgYW55ICovDQo+PiArICAgICAgICAgICAgaWYgKCBGRkFfSURfSVNf
U0VDVVJFKGZwaS0+aWQpICkNCj4+ICsgICAgICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAg
IG1lbWNweShkc3RfYnVmLCBzcmNfYnVmLCBkc3Rfc2l6ZSk7DQo+PiArICAgICAgICAgICAgICAg
IGRzdF9idWYgKz0gZHN0X3NpemU7DQo+PiArICAgICAgICAgICAgfQ0KPj4gKyAgICAgICAgICAg
IGVsc2UNCj4+ICsgICAgICAgICAgICB7DQo+PiArICAgICAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfSU5GTyAiZmZhOiBzcCBpZCAweCUwNHggc2tpcHBlZCwgYml0IDE1IGlzIDBcbiIsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICBmcGktPmlkKTsNCj4gDQo+IFdlIGhhdmUgYWxyZWFkeSBs
b2dnZWQgdGhpcyBpbiBpbml0X3N1YnNjcmliZXJzKCkgYmVsb3cuIElzIHRoZXJlIGENCj4gcmlz
ayBvZiBmbG9vZGluZyB0aGUgbG9ncyB3aXRoIHRoaXM/DQoNCllvdSBhcmUgcmlnaHQsIGhhdmlu
ZyBpdCBwcmludGVkIG9uY2UgaXMgZW5vdWdoLg0KSSB3aWxsIHJlbW92ZSB0aGlzIExPRy4NCg0K
Q2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+IEplbnMNCj4gDQo+PiArICAgICAg
ICAgICAgICAgIGZmYV9zcF9jb3VudC0tOw0KPj4gKyAgICAgICAgICAgIH0NCj4+ICAgICAgICAg
ICAgIHNyY19idWYgKz0gc3JjX3NpemU7DQo+PiAgICAgICAgIH0NCj4+ICAgICB9DQo+PiBAQCAt
Mjc2LDEwICsyODgsMjUgQEAgc3RhdGljIGJvb2wgaW5pdF9zdWJzY3JpYmVycyh1aW50MTZfdCBj
b3VudCwgdWludDMyX3QgZnBpX3NpemUpDQo+PiAgICAgew0KPj4gICAgICAgICBmcGkgPSBmZmFf
cnggKyBuICogZnBpX3NpemU7DQo+PiANCj4+IC0gICAgICAgIGlmICggZnBpLT5wYXJ0aXRpb25f
cHJvcGVydGllcyAmIEZGQV9QQVJUX1BST1BfTk9USUZfQ1JFQVRFRCApDQo+PiAtICAgICAgICAg
ICAgc3Vic2NyX3ZtX2NyZWF0ZWRfY291bnQrKzsNCj4+IC0gICAgICAgIGlmICggZnBpLT5wYXJ0
aXRpb25fcHJvcGVydGllcyAmIEZGQV9QQVJUX1BST1BfTk9USUZfREVTVFJPWUVEICkNCj4+IC0g
ICAgICAgICAgICBzdWJzY3Jfdm1fZGVzdHJveWVkX2NvdW50Kys7DQo+PiArICAgICAgICAvKg0K
Pj4gKyAgICAgICAgICogV2UgbmVlZCB0byBoYXZlIHNlY3VyZSBwYXJ0aXRpb25zIHVzaW5nIGJp
dCAxNSBzZXQgY29udmVudGlvbiBmb3INCj4+ICsgICAgICAgICAqIHNlY3VyZSBwYXJ0aXRpb24g
SURzLg0KPj4gKyAgICAgICAgICogSW5mb3JtIHRoZSB1c2VyIHdpdGggYSBsb2cgYW5kIGRpc2Nh
cmQgZ2l2aW5nIGNyZWF0ZWQgb3IgZGVzdHJveQ0KPj4gKyAgICAgICAgICogZXZlbnQgdG8gdGhv
c2UgSURzLg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBpZiAoICFGRkFfSURfSVNfU0VD
VVJFKGZwaS0+aWQpICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiAiZmZhOiBGaXJtd2FyZSBpcyBub3QgdXNpbmcgYml0IDE1IGNvbnZlbnRpb24gZm9y
IElEcyAhIVxuIg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmZmE6IFNlY3Vy
ZSBwYXJ0aXRpb24gd2l0aCBpZCAweCUwNHggY2Fubm90IGJlIHVzZWRcbiIsDQo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZnBpLT5pZCk7DQo+PiArICAgICAgICB9DQo+PiArICAg
ICAgICBlbHNlDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgaWYgKCBmcGktPnBhcnRp
dGlvbl9wcm9wZXJ0aWVzICYgRkZBX1BBUlRfUFJPUF9OT1RJRl9DUkVBVEVEICkNCj4+ICsgICAg
ICAgICAgICAgICAgc3Vic2NyX3ZtX2NyZWF0ZWRfY291bnQrKzsNCj4+ICsgICAgICAgICAgICBp
ZiAoIGZwaS0+cGFydGl0aW9uX3Byb3BlcnRpZXMgJiBGRkFfUEFSVF9QUk9QX05PVElGX0RFU1RS
T1lFRCApDQo+PiArICAgICAgICAgICAgICAgIHN1YnNjcl92bV9kZXN0cm95ZWRfY291bnQrKzsN
Cj4+ICsgICAgICAgIH0NCj4+ICAgICB9DQo+PiANCj4+ICAgICBpZiAoIHN1YnNjcl92bV9jcmVh
dGVkX2NvdW50ICkNCj4+IEBAIC0yOTksMTAgKzMyNiwxMyBAQCBzdGF0aWMgYm9vbCBpbml0X3N1
YnNjcmliZXJzKHVpbnQxNl90IGNvdW50LCB1aW50MzJfdCBmcGlfc2l6ZSkNCj4+ICAgICB7DQo+
PiAgICAgICAgIGZwaSA9IGZmYV9yeCArIG4gKiBmcGlfc2l6ZTsNCj4+IA0KPj4gLSAgICAgICAg
aWYgKCBmcGktPnBhcnRpdGlvbl9wcm9wZXJ0aWVzICYgRkZBX1BBUlRfUFJPUF9OT1RJRl9DUkVB
VEVEICkNCj4+IC0gICAgICAgICAgICBzdWJzY3Jfdm1fY3JlYXRlZFtjX3BvcysrXSA9IGZwaS0+
aWQ7DQo+PiAtICAgICAgICBpZiAoIGZwaS0+cGFydGl0aW9uX3Byb3BlcnRpZXMgJiBGRkFfUEFS
VF9QUk9QX05PVElGX0RFU1RST1lFRCApDQo+PiAtICAgICAgICAgICAgc3Vic2NyX3ZtX2Rlc3Ry
b3llZFtkX3BvcysrXSA9IGZwaS0+aWQ7DQo+PiArICAgICAgICBpZiAoIEZGQV9JRF9JU19TRUNV
UkUoZnBpLT5pZCkgKQ0KPj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIGlmICggZnBpLT5w
YXJ0aXRpb25fcHJvcGVydGllcyAmIEZGQV9QQVJUX1BST1BfTk9USUZfQ1JFQVRFRCApDQo+PiAr
ICAgICAgICAgICAgICAgIHN1YnNjcl92bV9jcmVhdGVkW2NfcG9zKytdID0gZnBpLT5pZDsNCj4+
ICsgICAgICAgICAgICBpZiAoIGZwaS0+cGFydGl0aW9uX3Byb3BlcnRpZXMgJiBGRkFfUEFSVF9Q
Uk9QX05PVElGX0RFU1RST1lFRCApDQo+PiArICAgICAgICAgICAgICAgIHN1YnNjcl92bV9kZXN0
cm95ZWRbZF9wb3MrK10gPSBmcGktPmlkOw0KPj4gKyAgICAgICAgfQ0KPj4gICAgIH0NCj4+IA0K
Pj4gICAgIHJldHVybiB0cnVlOw0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZh
X3ByaXZhdGUuaCBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4gaW5kZXggZTVi
YzczZjkwMzllLi5hZmU2OWI0M2RiZWYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vdGVl
L2ZmYV9wcml2YXRlLmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0K
Pj4gQEAgLTEwOCw2ICsxMDgsMTMgQEANCj4+ICAqLw0KPj4gI2RlZmluZSBGRkFfQ1RYX1RFQVJE
T1dOX0RFTEFZICAgICAgICAgIFNFQ09ORFMoMSkNCj4+IA0KPj4gKy8qDQo+PiArICogV2UgcmVs
eSBvbiB0aGUgY29udmVudGlvbiBzdWdnZXN0ZWQgYnV0IG5vdCBtYW5kYXRlZCBieSB0aGUgRkYt
QQ0KPj4gKyAqIHNwZWNpZmljYXRpb24gdGhhdCBzZWN1cmUgd29ybGQgZW5kcG9pbnQgaWRlbnRp
ZmllcnMgaGF2ZSB0aGUgYml0IDE1DQo+PiArICogc2V0IGFuZCBub3JtYWwgd29ybGQgaGF2ZSBp
dCBzZXQgdG8gMC4NCj4+ICsgKi8NCj4+ICsjZGVmaW5lIEZGQV9JRF9JU19TRUNVUkUoaWQpICAg
ICgoaWQpICYgQklUKDE1LCBVKSkNCj4+ICsNCj4+IC8qIEZGLUEtMS4xLVJFTDAgc2VjdGlvbiAx
MC45LjIgTWVtb3J5IHJlZ2lvbiBoYW5kbGUsIHBhZ2UgMTY3ICovDQo+PiAjZGVmaW5lIEZGQV9I
QU5ETEVfSFlQX0ZMQUcgICAgICAgICAgICAgQklUKDYzLCBVTEwpDQo+PiAjZGVmaW5lIEZGQV9I
QU5ETEVfSU5WQUxJRCAgICAgICAgICAgICAgMHhmZmZmZmZmZmZmZmZmZmZmVUxMDQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3RlZS9mZmFfc2htLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2Zm
YV9zaG0uYw0KPj4gaW5kZXggZWZhNWI2N2RiOGUxLi4yOTY3NWY5YmEzZjcgMTAwNjQ0DQo+PiAt
LS0gYS94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9zaG0uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3Rl
ZS9mZmFfc2htLmMNCj4+IEBAIC00NjksNiArNDY5LDcgQEAgdm9pZCBmZmFfaGFuZGxlX21lbV9z
aGFyZShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAgICBpbnQgcmV0ID0gRkZBX1JF
VF9ERU5JRUQ7DQo+PiAgICAgdWludDMyX3QgcmFuZ2VfY291bnQ7DQo+PiAgICAgdWludDMyX3Qg
cmVnaW9uX29mZnM7DQo+PiArICAgIHVpbnQxNl90IGRzdF9pZDsNCj4+IA0KPj4gICAgIGlmICgg
IWZmYV9md19zdXBwb3J0c19maWQoRkZBX01FTV9TSEFSRV82NCkgKQ0KPj4gICAgIHsNCj4+IEBA
IC01MzcsNiArNTM4LDE1IEBAIHZvaWQgZmZhX2hhbmRsZV9tZW1fc2hhcmUoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpDQo+PiAgICAgICAgIGdvdG8gb3V0X3VubG9jazsNCj4+IA0KPj4gICAg
IG1lbV9hY2Nlc3MgPSBjdHgtPnR4ICsgdHJhbnMubWVtX2FjY2Vzc19vZmZzOw0KPj4gKw0KPj4g
KyAgICBkc3RfaWQgPSBBQ0NFU1NfT05DRShtZW1fYWNjZXNzLT5hY2Nlc3NfcGVybS5lbmRwb2lu
dF9pZCk7DQo+PiArICAgIGlmICggIUZGQV9JRF9JU19TRUNVUkUoZHN0X2lkKSApDQo+PiArICAg
IHsNCj4+ICsgICAgICAgIC8qIHdlIGRvIG5vdCBzdXBwb3J0IHNoYXJpbmcgd2l0aCBWTXMgKi8N
Cj4+ICsgICAgICAgIHJldCA9IEZGQV9SRVRfTk9UX1NVUFBPUlRFRDsNCj4+ICsgICAgICAgIGdv
dG8gb3V0X3VubG9jazsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gICAgIGlmICggQUNDRVNTX09OQ0Uo
bWVtX2FjY2Vzcy0+YWNjZXNzX3Blcm0ucGVybSkgIT0gRkZBX01FTV9BQ0NfUlcgKQ0KPj4gICAg
IHsNCj4+ICAgICAgICAgcmV0ID0gRkZBX1JFVF9OT1RfU1VQUE9SVEVEOw0KPj4gQEAgLTU2Nyw3
ICs1NzcsNyBAQCB2b2lkIGZmYV9oYW5kbGVfbWVtX3NoYXJlKHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzKQ0KPj4gICAgICAgICBnb3RvIG91dF91bmxvY2s7DQo+PiAgICAgfQ0KPj4gICAgIHNo
bS0+c2VuZGVyX2lkID0gdHJhbnMuc2VuZGVyX2lkOw0KPj4gLSAgICBzaG0tPmVwX2lkID0gQUND
RVNTX09OQ0UobWVtX2FjY2Vzcy0+YWNjZXNzX3Blcm0uZW5kcG9pbnRfaWQpOw0KPj4gKyAgICBz
aG0tPmVwX2lkID0gZHN0X2lkOw0KPj4gDQo+PiAgICAgLyoNCj4+ICAgICAgKiBDaGVjayB0aGF0
IHRoZSBDb21wb3NpdGUgbWVtb3J5IHJlZ2lvbiBkZXNjcmlwdG9yIGZpdHMuDQo+PiAtLQ0KPj4g
Mi40Ny4wDQoNCg0K

