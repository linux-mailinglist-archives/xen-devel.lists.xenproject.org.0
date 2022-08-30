Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BF5A603A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Aug 2022 12:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394932.634529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSy7N-0001pi-0t; Tue, 30 Aug 2022 10:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394932.634529; Tue, 30 Aug 2022 10:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSy7M-0001mK-UA; Tue, 30 Aug 2022 10:05:12 +0000
Received: by outflank-mailman (input) for mailman id 394932;
 Tue, 30 Aug 2022 10:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y69e=ZC=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oSy7K-0001mE-R7
 for xen-devel@lists.xenproject.org; Tue, 30 Aug 2022 10:05:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80050.outbound.protection.outlook.com [40.107.8.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a687477-284b-11ed-bd2e-47488cf2e6aa;
 Tue, 30 Aug 2022 12:05:09 +0200 (CEST)
Received: from DB8PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:110::26)
 by DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 30 Aug
 2022 10:05:04 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::ca) by DB8PR04CA0016.outlook.office365.com
 (2603:10a6:10:110::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21 via Frontend
 Transport; Tue, 30 Aug 2022 10:05:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Tue, 30 Aug 2022 10:05:03 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Tue, 30 Aug 2022 10:05:03 +0000
Received: from f5bce6c1b81f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A3A808E2-96CC-4D67-9E86-B033493DC366.1; 
 Tue, 30 Aug 2022 10:04:54 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5bce6c1b81f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 30 Aug 2022 10:04:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB7817.eurprd08.prod.outlook.com (2603:10a6:10:399::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Tue, 30 Aug
 2022 10:04:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::9c75:2d29:bb6a:663f%5]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 10:04:50 +0000
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
X-Inumbo-ID: 3a687477-284b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mr19ZoZ6MJ/KQHQ+6itrENMdHZp2Gqzu677ZhLZBn7/jCPrZU7CBdEfIyveMDlUy8UwRZ8/bCm45MHpb3h8vUJXLIAFJg/S6fycLRd64tA+FYQRj7P2p3D/klUoSaB+rk88UISPWG26z33+bH+rjJpTWlV4HUeLugzmoCyA9j/2a9+TZEjWKPQEHoX0hwMot15RqntK3RkIRyMRBq8uNsqhC+tCtp0nLR75sy9dyI6Tw16Z1Dtx8Ysj/LPDMCM4XN94wV7LxWfFwXTuhiPQaVtZ97la35X4SKtA5gmVF859GY43KoO5DKXizbDC7wqoCbD9XspbGJsWvW3lXAN6DsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qthMqPOK4Zm5n0wFiLqH26a0Ujq2B7pIOp1ugKY5EU=;
 b=g+8nXm8RMpSSfrRgB0dP+Rq4N9MT+Xb0wv/osuhI/t/qkobluudj4GSh5G+QHDL2pgqLdTJDK/tyOJs4CsE2LPvsCwqWQmkSHsv7aqGNrCRJZ94/cl+xRTLdfOGp5bFaTHBL2BZKfZpuTH8cZ0Z0rBoGSJJKq10ZlBm3LBdJkGbni7x7XBS2P2ShsbeLTmmK1CBFwidEdDZjnkAZ94mVQG9GyWhoVk7BHiHzzZTsBWQn60I4xnOQBI+necCT9lMW2aijCatkxFMr1x7kp+HKpI6MzFaArLGQCngsCexVLLtK1n3uMZ1Cvs2TVH7h8S85gO5SwJCQNGlVFoQRni7KoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qthMqPOK4Zm5n0wFiLqH26a0Ujq2B7pIOp1ugKY5EU=;
 b=Rr+sFU/F9XZMk2LMdrhFSo11m4HiN44kkgF9OkHpPehQRqOU45xtORaAjjROpyIgStM+s2QCI7Ub9i0/fXu5V67OkYixfcgqpSL+4QssvAzufSq5KJyRU9bO+fbbuCV3SOTaWP9VZf58e9GjqkiMu1gRfbC/ggGpTKBfbkJbiIs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWelSGymqX4eIol9A1qD7YdtqaX6/qUWQuRp2WgNWT2fGxK8XeLafcOE+gr6OCoUBL1NSrdTb2kfPJ7hyfOWS+/J6SAwpaW7cUpv+oqgiipMhYf9mrkOszbJntYy2nbD7xXq+Wx5B6fzbDFWA2AN+tMHf/qLGwecVSA8yA81PdZh0pXkSjDXdU0Pqgpjm9+g3vzDeGMKnZ7mh3hpIDULeSPvoGpk4ST7/3pmLbFGwQT74UJ6hgdsU4ilHQaf9S9K6+fJnvXZAvgB2golwCes4yQfVV+FDAAaf7egqjUmSdidrmAhpNi6iNsFZIrVt4oKV4UlYuuqMNLeALgr2Tvfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qthMqPOK4Zm5n0wFiLqH26a0Ujq2B7pIOp1ugKY5EU=;
 b=MDyNZ5nw0ALeN/tRDspn6/LD6jAy6uz9+fJ4jb9nssDkxAKUQq2lHa6wyAbwynei7x81k/tJ11VxeS8zfaJx9FRyIYcl9gUWrinqeQ6dElrlXw/UGUEgLF319kT1K6XoaYK0aYryon+BzVjqsO7Ezvuz5ocvLsddzpCTJv3tz3cNxA7RbY8hULvYTMP1ujNQdq6YWga0JoH/Hv9hKq7YUbfeDhtVJDyhjgclsPmHm5YDhyrWfVD88Mb7xzYngR/0/zunAhTfpLEuGLSeY8XfFcsT3sp2nXEe2gLExE253L1x2QRlpWIhngioElIgLv/QGuPHRDEYPPJhP8GiaUaLug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qthMqPOK4Zm5n0wFiLqH26a0Ujq2B7pIOp1ugKY5EU=;
 b=Rr+sFU/F9XZMk2LMdrhFSo11m4HiN44kkgF9OkHpPehQRqOU45xtORaAjjROpyIgStM+s2QCI7Ub9i0/fXu5V67OkYixfcgqpSL+4QssvAzufSq5KJyRU9bO+fbbuCV3SOTaWP9VZf58e9GjqkiMu1gRfbC/ggGpTKBfbkJbiIs=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Topic: [PATCH 2/2] xen/arm: Handle reserved heap pages in boot and heap
 allocator
Thread-Index:
 AQHYt4ugTfbCAM/WyEil7pMplK0r3q2/e0SAgAeAsxCAABaogIAAAyrggAAVl4CAAAH9oIAADu+AgAABegA=
Date: Tue, 30 Aug 2022 10:04:50 +0000
Message-ID:
 <AS8PR08MB7991780D566C3EEEAD7F5BF092799@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-3-Henry.Wang@arm.com>
 <59f69736-a18c-9d08-94dd-791bd264d671@amd.com>
 <AS8PR08MB7991CD1C466399A96B7F45C392799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <bc5eb855-0137-130b-e30b-7f4417798a93@amd.com>
 <AS8PR08MB7991BB31E34ADB02069AE87292799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <536cad9e-53b5-2eae-0cd4-06f899229470@amd.com>
 <AS8PR08MB7991C3859BA3BAF913D50E1C92799@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <c749e3aa-39a2-a4a8-9a21-77a65881dca5@amd.com>
In-Reply-To: <c749e3aa-39a2-a4a8-9a21-77a65881dca5@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0D116A846A035A4F89E9EC3761B9BFDD.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9d8dd242-bdc7-4988-f15d-08da8a6f1bc9
x-ms-traffictypediagnostic:
	DB9PR08MB7817:EE_|DBAEUR03FT030:EE_|DU2PR08MB7325:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dhz2pDC5Yr9z/VxgF0mfy8KxVoJYhUnqav8XhgQURlUgNrI2jWMowEAephMXMqJ45YbIQ4a4+C0fbdE1CQWK8KJiQvQh+6a4XEpi9eTxkZ77yKQgxJxnITKaF2C0D7N1yhQK+42DzSd6i95MV/g3+iR0bLiE3j8KYdjUXjx7SOJDKZIGJTYYmBAg3KIzWQBFmJ8dOQxlFjSfM3E4+1jUyfJU9lDMfbrqcg/ts0egj7WdofXCtOQCBRydFYnDnBMcgx/etx0loeVkANgH17mvp1+0cPGlocUe+nWJLxyVD0sF0TSjWD3woR5BX+JdF1aP+QPMJRsLewSPnQhWqPAW6hPqjkgPpzNTKPLzHsD4Zch+EEJl+yYFRV0vXMiq/aBClImGlz+BoO6sAfs50qh8ihDvytUtiveeERssLXUH2bAMCcjUzTY6zPGIzzjscLRMCGp3dpzRu830m7Fdlzb6Tw244SJlDmnxn7tIg3YXiUGhStgt68hW2PrmWcoWyfoYE5b0GPWdkYQeuppROl/7xIrrauTKzLkMM0bO0yfFMidlE9L56rap/F9x+gOJonrojGdAAHM/2N1dFK2KZtlpVjHZDp/xTRBI0p1UtMvlfqfzZr/m4i1zAeS/p0bNaLEK3JigETWEHEiK/XINPEw3zqNi0i/HSZvGyCu8dt7qG8tWNZlsMXCF6YZqfgZLgoqHrkyq6hCmio/YuW1ywZ+sKQk0iTwQtAjx02uxlqujUYBZx8ldVCA3KUNNWEKL6YOFkaBWRYdtIIdbTjf9F9Cv+g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(316002)(110136005)(86362001)(8676002)(4326008)(66556008)(76116006)(54906003)(66476007)(66946007)(64756008)(66446008)(71200400001)(38070700005)(478600001)(52536014)(41300700001)(5660300002)(8936002)(122000001)(7696005)(6506007)(2906002)(38100700002)(55016003)(83380400001)(9686003)(26005)(186003)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7817
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6882e78-60be-4722-553c-08da8a6f13ef
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Y1rI43aA+JLqi+dlJFV5QyfOjzg1G0WIgebaw0qWAy4F2g7+TKjsf95PH3W4re9a6qy6crt/MXCMCmDxuaVNZi/hJQufX5qYqwfV9vw9f3rvf/2fn/mBIzBrFHX4GSZMB0j6hcUvYBJ3dULpuU7U4Kadd2yXN4eRI5IRndOTnf8R2E4i17CP89w+D/1pOWVUiqZiOb9mCkJMVGi/oa7CgUva6g8aIh39w8x+dW+jImAKlfNP3lRzjACqalQZ+b65NLPqHrsjdlQ4Ifv+JelNt6r6iHSrABeUUDgVBlKGSewcfkzUe69ynNLLgPc41TazQcGnB8oY0NTaMemuskV3DR5DgukM2Xq/OKs2dba+TGrDhypr5gAo/Ek2dP1vpV8FxnoEVwsj9kr9LTlQZ0z3hZqVrNfE6MYP3O7z9dWAlXHNcs8k3LNDUBhDK7B3OOW3xgSpuVadvXKoDnqm9zf7G+Na/l3+/Olo51IBumvIfBhlT3z/2y3XkP47nlIGcXnksljL50T+DM8fdxbrYKAr5YrXjPdLmo2YHBiyUJ4CoyWeTtK/p/ejNjsHH41qUYsr1qrJnjyc/qWv+pQDXkCBmCUVsD7C4Ofs8gc41cVURcqhtC3hjew+S4j72IAGc+9idFQ3zvZifVa8uh9Vi7+FW5RzHB21N50we6QlcvBobgoUX1MDIm4ROWrdlpHdfo6fYgnAmdjFX8kzecp+jTWIMZqgwfydrLG+R4Sy0004O/n0GjDgE7NGmkB87TmR8UsgxJYFD5QzbkUikFwxz664QQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(40470700004)(86362001)(81166007)(82310400005)(70586007)(40480700001)(55016003)(8676002)(4326008)(110136005)(356005)(316002)(70206006)(54906003)(36860700001)(83380400001)(186003)(336012)(47076005)(82740400003)(478600001)(41300700001)(26005)(9686003)(40460700003)(6506007)(7696005)(107886003)(8936002)(5660300002)(2906002)(33656002)(52536014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2022 10:05:03.8568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8dd242-bdc7-4988-f15d-08da8a6f1bc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7325

SGkgTWljaGFsLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1pY2hh
bCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+ID4NCj4gPiBPaCBJIHRoaW5rIGdldCB5
b3VyIHBvaW50LiBMZXQgbWUgdHJ5IHRvIGV4cGxhaW4gbXlzZWxmIGFuZCB0aGFua3MgZm9yIHlv
dXINCj4gPiBwYXRpZW5jZSA6KSkNCj4gPg0KPiA+IFRoZSByZXNlcnZlZCBoZWFwIHJlZ2lvbiBk
ZWZpbmVkIGluIHRoZSBkZXZpY2UgdHJlZSBzaG91bGQgYmUgdXNlZCBmb3INCj4gYm90aA0KPiA+
IFhlbmhlYXAgYW5kIGRvbWFpbiBoZWFwLCBzbyBpZiB3ZSByZXNlcnZlZCBhIHRvbyBzbWFsbCBy
ZWdpb24gKDwzMk0pLA0KPiA+IGFuIGVycm9yIHNob3VsZCBwb3AgYmVjYXVzZSB0aGUgcmVzZXJ2
ZWQgcmVnaW9uIGlzIG5vdCBlbm91Z2ggZm9yDQo+IHhlbmhlYXAsDQo+ID4gYW5kIHVzZXIgc2hv
dWxkIHJlc2VydmUgbW9yZS4NCj4gPiBbLi4uXQ0KPiA+DQo+ID4+IEJ1dCB5b3VyIGNoZWNrIGlz
IGFnYWluc3QgaGVhcCBiZWluZyB0byBzbWFsbCAobGVzcyB0aGFuIDMyTSkuDQo+ID4+IFNvIGJh
c2ljYWxseSBpZiB0aGUgZm9sbG93aW5nIGNoZWNrIGZhaWxzOg0KPiA+PiAiKCByZXNlcnZlZF9o
ZWFwICYmIHJlc2VydmVkX2hlYXBfcGFnZXMgPCAzMjw8KDIwLVBBR0VfU0hJRlQpICkgKSINCj4g
Pj4gaXQgbWVhbnMgdGhhdCB0aGUgaGVhcCByZWdpb24gZGVmaW5lZCBieSBhIHVzZXIgaXMgdG9v
IHNtYWxsIChub3QgdG9vIGxhcmdlKSwNCj4gPj4gYmVjYXVzZSBhY2NvcmRpbmcgdG8gcmVxdWly
ZW1lbnRzIGl0IHNob3VsZCBiZSBhdCBsZWFzdCAzMk0uDQo+ID4NCj4gPiBbLi4uXQ0KPiA+IFNv
IGluIHRoYXQgY2FzZSwgcHJpbnRpbmcgIk5vdCBlbm91Z2ggc3BhY2UgZm9yIHhlbmhlYXAiIG1l
YW5zIHRoZQ0KPiByZXNlcnZlZA0KPiA+IHJlZ2lvbiBjYW5ub3Qgc2F0aXNmeSB0aGUgbWluaW1h
bCByZXF1aXJlbWVudCBvZiB0aGUgc3BhY2Ugb2YgeGVuaGVhcCAoYXQNCj4gbGVhc3QNCj4gPiAz
Mk0pLCBhbmQgdGhpcyBpcyBpbiBjb25zaXN0ZW50IHdpdGggdGhlIGNoZWNrLg0KPiANCj4gT2ss
IGl0IGNsZWFybHkgZGVwZW5kcyBvbiB0aGUgd2F5IHNvbWVvbmUgdW5kZXJzdGFuZHMgdGhpcyBz
ZW50ZW5jZS4NCj4gQ3VycmVudGx5IHRoaXMgcGFuaWMgY2FuIGJlIHRyaWdnZXJlZCBpZiB0aGUg
aGVhcCBzaXplIGlzIHRvbyBsYXJnZSBhbmQNCj4gc2hvdWxkIGJlIHJlYWQgYXMgImhlYXAgaXMg
dG9vIGxhcmdlIHRvIGZpdCBpbiBiZWNhdXNlIHRoZXJlIGlzIG5vdCBlbm91Z2gNCj4gc3BhY2UN
Cj4gd2l0aGluIFJBTSBjb25zaWRlcmluZyBtb2R1bGVzIChlIC0gcyA8IHNpemUpIi4gVXN1YWxs
eSAoYW5kIGFsc28gaW4gdGhpcyBjYXNlKQ0KPiBzcGFjZSByZWZlcnMgdG8gYSByZWdpb24gdG8g
Y29udGFpbiBhbm90aGVyIG9uZS4NCj4gDQo+IFlvdSBhcmUgcmV1c2luZyB0aGUgc2FtZSBtZXNz
YWdlIGZvciBkaWZmZXJlbnQgbWVhbmluZywgdGhhdCBpcyAidXNlcg0KPiBkZWZpbmVkIHRvbw0K
PiBzbWFsbCBoZWFwIGFuZCB0aGlzIHNwYWNlIChyZWFkIGFzIHNpemUpIGlzIG5vdCBlbm91Z2gi
Lg0KDQpZZXMsIHRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiBJIHRoaW5rIG1heWJlIHJld29y
ZGluZyB0aGUgbWVzc2FnZQ0KdG8gIk5vdCBlbm91Z2ggbWVtb3J5IGZvciBhbGxvY2F0aW5nIHhl
bmhlYXAiIHdvdWxkIHJlbW92ZSB0aGUgYW1iaWd1aXR5DQp0byBzb21lIGV4dGVudD8gQmVjYXVz
ZSB0aGUgdXNlci1kZWZpbmVkIGhlYXAgcmVnaW9uIHNob3VsZCBjb3ZlciBib3RoDQp4ZW5oZWFw
IGFuZCBkb21haW4gaGVhcCBhdCB0aGUgc2FtZSB0aW1lLCB0aGUgc21hbGwgdXNlci1kZWZpbmVk
IGhlYXANCm1lYW5zICJ4ZW5oZWFwIGlzIHRvbyBsYXJnZSB0byBmaXQgaW4gdGhlIHVzZXItZGVm
aW5lZCBoZWFwIHJlZ2lvbiIsIHdoaWNoIGlzDQppbiBjb25zaXN0ZW50IHdpdGggeW91ciBpbnRl
cnByZXRhdGlvbiBvZiB0aGUgY3VycmVudCAieGVuaGVhcCBpcyB0b28gbGFyZ2UgdG8gZml0DQpp
biBiZWNhdXNlIHRoZXJlIGlzIG5vdCBlbm91Z2ggc3BhY2Ugd2l0aGluIFJBTSBjb25zaWRlcmlu
ZyBtb2R1bGVzIg0KDQo+IA0KPiBMZXQncyBsZWF2ZSBpdCB0byBzb21lb25lIGVsc2UgdG8gZGVj
aWRlLg0KDQpJIGFncmVlLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiB+TWljaGFs
DQo=

