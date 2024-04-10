Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2418A01EB
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 23:25:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703640.1099396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rufRi-0004oM-JY; Wed, 10 Apr 2024 21:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703640.1099396; Wed, 10 Apr 2024 21:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rufRi-0004me-FZ; Wed, 10 Apr 2024 21:25:30 +0000
Received: by outflank-mailman (input) for mailman id 703640;
 Wed, 10 Apr 2024 21:25:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rufRh-0004mY-Rs
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 21:25:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9ad6a56-f780-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 23:25:28 +0200 (CEST)
Received: from AM4PR07CA0035.eurprd07.prod.outlook.com (2603:10a6:205:1::48)
 by AS8PR08MB9907.eurprd08.prod.outlook.com (2603:10a6:20b:563::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 21:25:20 +0000
Received: from AM2PEPF0001C70C.eurprd05.prod.outlook.com
 (2603:10a6:205:1:cafe::94) by AM4PR07CA0035.outlook.office365.com
 (2603:10a6:205:1::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 21:25:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70C.mail.protection.outlook.com (10.167.16.200) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Wed, 10 Apr 2024 21:25:19 +0000
Received: ("Tessian outbound 9d16f63426bd:v300");
 Wed, 10 Apr 2024 21:25:19 +0000
Received: from be2072fd9d38.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FB91E031-3A56-485F-9973-18B4F60E31AA.1; 
 Wed, 10 Apr 2024 21:25:12 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be2072fd9d38.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Apr 2024 21:25:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PAXPR08MB7624.eurprd08.prod.outlook.com (2603:10a6:102:242::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 21:25:10 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 21:25:04 +0000
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
X-Inumbo-ID: d9ad6a56-f780-11ee-94a3-07e782e9044d
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mGmyE48tZrqDvqyIBla7W9gJQIZ0P/3VkUprFZM0z8LjUjsrFgX07Q3r3jR5yRv7vU352tUdVVk6oPE3U7AEJ0x9Fj7tCu2oWnt7izFnrj/tv6BgKdJSHQy3G/84/q2iBdTr8cXLUXgGnFgaU9R2s1SVAOch/9xelRonzhMzY7rzaKPCS/uq7sPxgaRgiIq6tOObzoldDWNFFHN8FTq9LxzTxYcWtFpWreJUjaSn9TQO7DAjoT0Z+UFpqXNMB8Q4ZykxSwQuuodAg1CpWy0vBABe6HIJ73+LHNdO66QgytqfeftQQsOpQZnDvOLDMecwVWCVaoNSR9+mPfxfA4pxGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDvMN3MgnnAmQU6/16NDMx6S7t9Nf12Lr1HgJkf34iY=;
 b=Sfo5mSNS2BiFHU30GapCkY8c3wAfV1GQ4v1mod7IMTZnJPfSYczRa0qXS4/ReUe5xUVH6A34PSe3YnHv5LUuZXhrli4GXB4qEiXvAMzkaWIEfmyGxjGsTAVWIuMmhB2oOOSmJLSPuB6Fief4kUAs43QsS7LUU7nd7iMFBoltMotGTuDnbmLNkCtxD7gHDW2Xd9f/59bQVuh+kwIYgR8GUL3PPlhET5Lizfg3rFdsTgJhld5jj/rxTDoTzbnL04Lf8vPamKPx/lr0+cQEo/lY05UEzjwyxUQTa0E31WtKJ1dDTtQACCIp+Zl3JuvLSfgKtA5f0urA3X2ziFJ0uoFCQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDvMN3MgnnAmQU6/16NDMx6S7t9Nf12Lr1HgJkf34iY=;
 b=bNW0mybl2R3GWO7urxpZo+3RcCO1/gYeJ6OREykEDLaBKnoRCwK75zd5Fh/sH4EDwYLA4tHMHRcRM2LJ8yHveaYazDWQR/aQ6upvC3D4XFMTIZRRz+Yw1CxmbplCyP9KZXlSEZzIIzXB7eqTi4JoU5XzjmH4C8+lCy302GXlr1Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29612702012b73e2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZNqqDdb2vGdKLAeabLgVkruOdnbVzNjIy/tKWsFqv/izCCz0jkyAwZX5Xmpq1Lf+bzmB/QmePuz1u+LxEsa+pmefaBeyG0utCu1TL1L5zeYLixSNfQMmj51LRxCF9MhfLYHo47mAcdlVUf8vxIdCx2voqo7lAT1RLIknYxLsUAmBfRQEeD7miIwj1/LRlaq8zwbNCK6McQBfU9b///fbmYUWfw/wMQGqxPG0T13MvwSRGKHFoaqiHuTK3wX1SzxwpTZo9fT7nuc5pBRvxaHvcv1x/YXV6zQV57ip83aiozpHfnpKtL6KPPkS9WllylxzCbGL77bpF3hqjKdBDtlUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDvMN3MgnnAmQU6/16NDMx6S7t9Nf12Lr1HgJkf34iY=;
 b=grTBTq9NYzoX3ZNboIopZ7GifZRp5H0cSrbg9jdtDc3mvHNNMxY1QvTbMBP/1Iwqtnx3UfACSBXMO6KSJER0CQnHSBYIPXj76yaLpr3VywoUHBEqQWiyZjx+s6jgZ6r7ozv1gql0Y4v4SL1kxF/lpoeLJBfyCb1IdOk4DGtlCmuAhGUrLPJqrim9Z6P1tUxDQ+PwPKYvkUrOn7iymRQU6cdWKw66MFP6iraswO6LVJVzXmU4IYwEaD0Dt5IwTlL3wGdXUE2eocEMQHkv5zN2lo8HUkAl4s7Can2JFNe58/z+3FsQNjwIaKugfFb2qGK+TV2uI/DgiZ7GpX0w3HntZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDvMN3MgnnAmQU6/16NDMx6S7t9Nf12Lr1HgJkf34iY=;
 b=bNW0mybl2R3GWO7urxpZo+3RcCO1/gYeJ6OREykEDLaBKnoRCwK75zd5Fh/sH4EDwYLA4tHMHRcRM2LJ8yHveaYazDWQR/aQ6upvC3D4XFMTIZRRz+Yw1CxmbplCyP9KZXlSEZzIIzXB7eqTi4JoU5XzjmH4C8+lCy302GXlr1Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] xen/vPCI: Remove shadowed variable
Thread-Topic: [PATCH] xen/vPCI: Remove shadowed variable
Thread-Index: AQHai34Se9wADCtXik2K5//57Y0vDrFiBBIA
Date: Wed, 10 Apr 2024 21:25:04 +0000
Message-ID: <09CAF1CC-40B9-4E3B-877B-1516B68D0740@arm.com>
References: <20240410193348.1492018-1-andrew.cooper3@citrix.com>
In-Reply-To: <20240410193348.1492018-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PAXPR08MB7624:EE_|AM2PEPF0001C70C:EE_|AS8PR08MB9907:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 K0jzKfNZ+1AtZolgGiCdE1yv+OklQhHgEJuEdBV+pJlU7WhYNeSipAFLYpvOEZ6Tye44XtSArdp0D/LAi57+ZJRfNPRrV6NRe8xdgaJtOkUCzwSfOW0paiaD98oTugqY6GckUbOcolzB3EbezZ+dpMfknGBmzQ9W7xxhZDlxqzExGFfqQgeBfxE3liSBsZzuXzjRuYlTCb4FWeAenIkqr18WaeEEZMhJ0a2wDvFMABUeT+FXX0Xsnxiz7Q/4uvWIepK0gj5DwObdWMEf+bU1HmwI2rZ+6a/evUIT7eeFDi3weXI261VS5TpGpyO/vBm5JiWbYaT9V++RthJsvCIyWnesQXzISIxzdw9zg5tyoZjWEzFGYEU+AjyoFt8bsHSUSwNUzrptMZ+ii7flb+ElQCP7/G60YunWUhnqhUon5MavsAk6Gegoa0izGdRsc+zCD5ZckG5fDJWcRZHt3/ew8WutQnXSKd5Q+saSNsBo2jMrASAs9O6qkIOuMw4UIYjJt9hv9qEr1BeLk46G3G3xsPc1d19D0FrCmX2v0BgcbQMSLRkNjVDUgG4GQ/4+vqWjxj3k3Tfxk/b+bhmDMWQ4gtecyxyT+OMlpJ20DWaG8cIqRjwlGRFWQOiuBJzcTbvQL80pphSHhmCcb6qH7HqPrVI2x6E5AFXHTj2gznMVK9U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CE7BA49E63B18449BFA4C1A5F5414E38@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7624
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f1516e8-5745-41e2-41f2-08dc59a4b927
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	olOPpm0og0cZwoPS1HCjW80KPCNpgZIjhe/AnqUyxtVqQ8fMhc4C6XEHUdyrDXoeDaQaB6RnkkvMXtTntPtv/4TQMY4gK1yMJVrqTQo0lrNc13BAfg0RTvD8T0wUjQh4hWw6JJdtW7zQbp+OuMMD8fnFTmIvi1hYeTSv446A3sTQ7fC6VpQBhrvc/W3VMCBZWiFffWvmpCLqSRBcppybNeU0mBoAu6ZShEbT0LaZsrHuX8AUC+rN5U1yhXfNOG6quJCtdKJ2kSU94NKqw7MqzGI9CkWl4IXehPj4n2I2bVcQwLegD1njroSruNtx85UqqHwRKj3nfMYvsqnhb21q8udAI9CR6D4vrNOxLIXLBXnUcCkUDto4qt0ysrOQjuvkihamUOew4BdZTQFAJY6vKLcVvFhrTiJDdodHplFCsYQegWlpyyhg/ZT+7KGZyzJoExYOo5vRThbyI2qAzrPmd/lm0J7OXSfxtJgHxMf4GZ2D7Oqz8ITq047/MMlzsbTDg6zAcDlZDxATHPB9epVA7dUs6HuFtuog0oNW2eFMi4oA+dna5e62wMC21ya62rCAD4Cu7O9nfpzxnku6xSDv0o90eCSE+d7bLBIoWLmZ/BsCnyEZBu3QCHSIqVMsvV2oZmLs89trQXMb/twn/DEuPakkZ2Q7szZQ83tKNqqP109TTLN7oK6Ydwt+a8ZSvlcfKlDuy6uAl8YJXfwwYbjBTEASQoUmQFNsjzkhd746MH55Po4vrM8rZRYSxSZfendS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:25:19.5009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f1516e8-5745-41e2-41f2-08dc59a4b927
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9907



> On 10 Apr 2024, at 20:33, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> Resolves a MISRA R5.3 violation.
>=20
> Fixes: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




