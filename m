Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9288AEA47
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:12:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710784.1110232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHop-0004Sk-1t; Tue, 23 Apr 2024 15:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710784.1110232; Tue, 23 Apr 2024 15:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHoo-0004Q2-Uo; Tue, 23 Apr 2024 15:12:26 +0000
Received: by outflank-mailman (input) for mailman id 710784;
 Tue, 23 Apr 2024 15:12:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agql=L4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rzHon-0004N5-8D
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:12:25 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2608::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e37acca7-0183-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:12:24 +0200 (CEST)
Received: from DUZP191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::14)
 by VI1PR08MB10299.eurprd08.prod.outlook.com (2603:10a6:800:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 15:12:20 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::f5) by DUZP191CA0015.outlook.office365.com
 (2603:10a6:10:4f9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 15:12:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19 via
 Frontend Transport; Tue, 23 Apr 2024 15:12:18 +0000
Received: ("Tessian outbound caed45120527:v313");
 Tue, 23 Apr 2024 15:12:18 +0000
Received: from 08b3ec6a6f75.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C9CF5838-A422-48CF-B0CC-56F5F1B67181.1; 
 Tue, 23 Apr 2024 15:12:12 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 08b3ec6a6f75.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Apr 2024 15:12:12 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9986.eurprd08.prod.outlook.com (2603:10a6:20b:649::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 15:12:10 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 15:12:10 +0000
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
X-Inumbo-ID: e37acca7-0183-11ef-909a-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VuWX/gCGWmhJTCqLWpTJsGDUzNj+RlIxOTT+mJ8NcE14cedtC7MyzOaOJ8q8TOvy+M/A5pBpCnRcDl00EncsvtgRFdfqzu8h8n/sg4jSvxQwlNpUanYEfI90LCNqNzA/Uouv4hbajg+TQ/EEAuIdhShRKZkzUwjmQTNmAINYa631UGglsTCgKp4J32fw0H9al3Xl5Mhg5oBwlZqMswpwyIImLslUbaQGU2+l4otgHrxj4qlmvRIuviVevigTaBtc4Dzn7wp+AVq7lkF5jfm1qPO4eaYxoGLiQcvyW26x5ofdNy9MUkHS+m830rAanRZwEWXXYDYOs/k3zdSxKKLPtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6Q2rAEaiC++SkwNWoBcN4EvFSyaKpbpvyRIDF7u5F4=;
 b=fU7cK49bi14bU49K2EoyEzI9fBX1xU1CJcUDQO067jNXwmR1pMtBfBH/Ai7GqXKmRmuD54kZxTHnYlu9Ot6FuJQSIgyzX8lryPa5MMU110fyqFwAa3JdQWvwxwmWPHwHFYIzJJ3rmVmv4eUU4HEUqDqsi/sc4g6uabCWisor8iJEUsVBnCITGyITqco7YBtOxPl7K2WQDblOa4pfUfrRAXliQ1DSTTid/8KtTu045PtKn61lqE/m7FTcrWb+vIB/59XBtOmF3CNtFmXl7+TGc3qHOUysLSy3jGCaE9DSf8Mu6YZHG+ghBn0avOJSokWPtCS3fFpfT1Ps/tUVuqn12g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6Q2rAEaiC++SkwNWoBcN4EvFSyaKpbpvyRIDF7u5F4=;
 b=nZ9AH1KvudvAwEjXdT3N/2DEaAhjff9TvXbZqOcbj67khuigHclXnUYMybV6gHJuCHVCFwwCvGuUAYHY4XA3aUsILYWD4DSvXqoh3UxNUsPg22y+6PevjHUqM03xCjV/nDTSl6q1TAfIzkVQCOt6Y5guYODVDQaLV4PBvFnjj5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87f86dc2967d045a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9Hj+91bKe2kUTMcN0c18Duf4nndamycRveC76hjGLXJai9EW+WEYY4Ol/odfH5GS1v4oEDcYx22mEKCqBBvfMdeFcM+C5yviWU50hkD3BSxYhlfWvBKt7Ik4yeY5kf6FqILthKXK1Ka3nXHC6LzZN/g+w+WR2vIhuOhbc3TWSZKOZzqnTkd18Vw4HUQOYhmr5Cpx31wy5j7Sj/DZS3iSWlWe7NFRogHKXfPhp8dZFnzH1b1fKv73eJ2Er6nLpNK0Cbu57CG64xI6AXNsCGAKD8kJfAEdsXcvADkhrmksr6H1HoOLELBGcfS7dJ7zwN3qpQB6nQ64YZ3d0wE+OovxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6Q2rAEaiC++SkwNWoBcN4EvFSyaKpbpvyRIDF7u5F4=;
 b=Wn59+6ddXfPdnM0NZUFzeMD8YxRl9ZHxjQu6LlklQrtJJpmpAsDxB2cxrTphAmhDj395EwrbDErpu56aIv8BpeuRCXpsBuHpVhm2aIOnFil0Xc8WnhAWpDgc4faJPTOoPZeOEmWIjIglU8MavXd/SCFNKAyO9Y6dvetzdWEz2eLQPy1xEMAptz3Z4iw6yML2a2ouB2mwATGx8ngVz0XLolB6oMjwweLAv7PuyPhIKguS4IUjahQIpGRA9iQ+95Qqmtxp3sbpQC+PafThxW5r6ocxbFwczw9Scn4NUGVzvm1Rynao0Y7WFlQqhs++nAjYJah8vRwV2ae31JfxE0nAzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6Q2rAEaiC++SkwNWoBcN4EvFSyaKpbpvyRIDF7u5F4=;
 b=nZ9AH1KvudvAwEjXdT3N/2DEaAhjff9TvXbZqOcbj67khuigHclXnUYMybV6gHJuCHVCFwwCvGuUAYHY4XA3aUsILYWD4DSvXqoh3UxNUsPg22y+6PevjHUqM03xCjV/nDTSl6q1TAfIzkVQCOt6Y5guYODVDQaLV4PBvFnjj5c=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Thread-Index: AQHalIgAe9tsdsjGFU69yRnUHUkm77F0KqiAgAHNdQA=
Date: Tue, 23 Apr 2024 15:12:10 +0000
Message-ID: <7B792228-17C6-412C-B0E6-950433FE6C11@arm.com>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-6-jens.wiklander@linaro.org>
 <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
In-Reply-To: <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9986:EE_|DU2PEPF0001E9C1:EE_|VI1PR08MB10299:EE_
X-MS-Office365-Filtering-Correlation-Id: 15db362d-7c32-4d24-0bf7-08dc63a7c476
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?f15Rk2w4riBNvyWbBe6yv/VE7HtGLge7yFq7a795TtImAm1o7FdE5+ZgYX1P?=
 =?us-ascii?Q?GmJ6fFAJpQUID64ESonKrT+oygFoZAmETDZ2N964tuRLW+S9/l0DdaHSQOiv?=
 =?us-ascii?Q?6qL+bJGHiO/uVJXBTtpg3drRfgZJeedwx3H41J8oVV28HonZiADjY2W0FHJL?=
 =?us-ascii?Q?6BknS2p3x0CF9+FJnpDivYyJSWjFTTg5H/r3ScUtWHHnmUyK0lA0OwmenD06?=
 =?us-ascii?Q?aP074jopd2M86ddgdQbcgKrnbZe73x4yJaOMfYSst1gG5NLhR54uYvwnolW3?=
 =?us-ascii?Q?e73u/Q0gi6/GCX1DXSkAxnDyWNvD9ulwrJbUN67bfrzc7eAN/0LWo5izg9s8?=
 =?us-ascii?Q?naidjYpJEM9B/UB2UHv28IJlFzkHn5TWZLF6UDpr1ZuhQNk7uzotLW3pkZS4?=
 =?us-ascii?Q?1Ju0ryPQtusKxhzQ34FWWLukRdXPM3xN9F9xIMPJyYHUjjv9HqYu8xZODqea?=
 =?us-ascii?Q?9RJUpsDiQ8YUC3czUh0fVIrlRbFEe+rAmoUINUWytG7S96NhE+ApibZpec1Q?=
 =?us-ascii?Q?W5oIvHyRbfAX7kEYgakRTL53uKrCehio8D5zJ+o7zHB9AzkOpF/Az7geGAse?=
 =?us-ascii?Q?igRSnUpO8tQwXi+iAgrMmcgXG0R8TJFUc8XC7hHdz7Q4Zf11sMqI9WhTgg2O?=
 =?us-ascii?Q?EH6KZIedWqUhJftZmkiAFRvtzhH8QzVJCPQmapc4rnOrjYgibVkFQs/UDM1g?=
 =?us-ascii?Q?51KF/EE1pTTw6HOBmzkA6LHTcUB+YmfCX/yCZP+NtbK48HOy0nIaQSl6i9ur?=
 =?us-ascii?Q?BvNSdYuu+q/mN6hrwwMr8Gh5NYYU7fR8bevmj4JWOS5GOkdr9wvwn2PK0p0z?=
 =?us-ascii?Q?SZzkWDL2fRGGAaNRF7jqw79ntgrWhYWrzyorT2H/H1t4pq2VBEQWcTEzQZE0?=
 =?us-ascii?Q?qj2G0XRO/r6QsCTi8LZ4+6W+cQSWzOkAhB2UtcpaAGCvBDCbUfCBa3CrG54o?=
 =?us-ascii?Q?Y3aSwo4tZTAqH6CmPI9blsyrrPm8+hbh76KmP52bHSw1zI0v/1OZvQnagl9S?=
 =?us-ascii?Q?+sbGD2IL5WmJc7mO0NOE9PLReghM0+D/fiZh0iJvK9/6lA/5/zWiZYdgluVH?=
 =?us-ascii?Q?feyc0/h1xrxZeiPpL9f/iLkwCFQVQ18fxJ9I/38L55HN6gl37iJ56CzLjyw2?=
 =?us-ascii?Q?djxVPSrNuD3IwLD6egFtTOxB8J31kKel/BC/rwceQ+yCNLQIEDuwK94k7/bU?=
 =?us-ascii?Q?vQdX+9RJw2OJIhhOSQyJLs+m14cA/H5OAQJnYxSHMWf12WwwIoEvLWySws7e?=
 =?us-ascii?Q?7OeNCRrNx8IXTJuNZzoKu/aa83sryUSB888C5MHHDt7gE+Xs+9zjrPJb5zRC?=
 =?us-ascii?Q?J5NV6Dipiuy6T3fd1aCLGlA74OfEcl23BvMiP4k07L7QrQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6B0790F67499EB46BBE4899ABF7D756A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9986
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fe480b2-6397-43aa-e48d-08dc63a7bfb5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9eo5k2KSjrdnmmD9FJMkR95mSW1z00MU9/eLCs0k+U6rbCKeYTMqjCts9A5g?=
 =?us-ascii?Q?xA5NymbfXX9yp4Kfcuo8TIk5uv4qarZ1+WQKA+j3FVwOjJXhhs+yQTDD570l?=
 =?us-ascii?Q?OWNHSmN5qdPPf6LchqcfL+qo5alZCwhc3BtxcBtwcbol7vn6+8VfdTvFruI4?=
 =?us-ascii?Q?RmaeawRtj9n8stn0FDCjwmgYkZvcob2jmpFx1rJTaR78dbX1hxxaQgr/8uJB?=
 =?us-ascii?Q?MY1gkzxhv4GPUruE8J+TYCwDeOGmdBoFChfxND7lTSIRyNDH9qyZb318LXQl?=
 =?us-ascii?Q?1vPHpf005CB1lQgcZHuyvi34VLgof2eh98gSV2O/DLsvL4XG9Mn47cMuE+jH?=
 =?us-ascii?Q?4sbbelpzfYf4zUtD9B1/HZEBY/McpYBSBNVVrQBNx6bY3zLqIaZAoOD5LGbG?=
 =?us-ascii?Q?s3wVILuoZ2lC0YzO2tFgNUNNXDmkCpz0A9tPIAnZJlgnnwwk53runblKK4ps?=
 =?us-ascii?Q?5QUvcrLWbF4f54/jHLsrpbkdjwTWuK7hqhtjmmEMSY56q+5I4RitULBy6qQh?=
 =?us-ascii?Q?P1urqDT1+etoOJyRhVrDQzgDhR/KQLSGkVcWDSBszXrVYPWq+9i1+4XQnf8A?=
 =?us-ascii?Q?ncjct0y6SlgWRsGwgYY2toKAM8MrrqJMUjw8suhcKrlc8NiokHMNM3fXS4Js?=
 =?us-ascii?Q?vw2sGpu1t0cWN8AjhXI3GRjTkP4tcZR46Xe+W4VrOMxUWvQaqm830eBiVsy1?=
 =?us-ascii?Q?K41Zzdg/qaIPE0zdQURowVsDVbbpdgqfq9vV9n9nly7UI8YwreSf9fJZ+7i4?=
 =?us-ascii?Q?GJvAM7Z7VaYTPLTHbW3KN7VCsHReE+7fNX80W6U82g6snTeFKMCrrnRnA5Ow?=
 =?us-ascii?Q?oi0aKX02L0YUaubqq6BMvtM9T7gEBNXDDHAxlK2lQ0El3NzcvVCBIdgA3O5k?=
 =?us-ascii?Q?UGtt2YgPEZiKikMftmfeoEA54GvbXZUoHQpFcn0WoTRFQ+KgJ/1U0Hf2GRhH?=
 =?us-ascii?Q?kM+81QH5EuFoQBxt9BjY26IAdzi0ZmqlrTvIVN0XO5xaF69JLIiSKAdTGEAj?=
 =?us-ascii?Q?14Na5JQVcf2USoktgpM0wT447FANn3EnrYGrLR7UHMrpxpxUVvNZdEMTIwOk?=
 =?us-ascii?Q?lJ9DWiOJosGEbq5fVAj1P2dYQ27+dNjG2EUtNDOlO7cP9MFnZmaq65NcnB0u?=
 =?us-ascii?Q?UuBiwEbD8RILz2omRe9mYox4RljM1W0HaqP4IburnRsyMGAqjkee+OHF1FLl?=
 =?us-ascii?Q?kqE4AUyYFujHm92btY5fLko1dpwRPwXHOxEeSHhvcInUXxUy0PRuNBxloiiW?=
 =?us-ascii?Q?QYdjXJCbQwgi6DULIR+zknNVp1i0XzST7f/IDn6ymI66eVO1lgy2B90I0dJz?=
 =?us-ascii?Q?nEw2aFub368/uPTIi0L8NOw9y3UNLgfO4jEfO0dFyXauV+48oRS1HIak59Ji?=
 =?us-ascii?Q?VV9Lu05Z+EzTG4H5lvtEv9hcDx2R?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 15:12:18.6526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15db362d-7c32-4d24-0bf7-08dc63a7c476
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10299

Hi Julien,

> On 22 Apr 2024, at 13:40, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jens,
>=20
> This is not a full review of the code. I will let Bertrand doing it.
>=20
> On 22/04/2024 08:37, Jens Wiklander wrote:
>> +void ffa_notif_init(void)
>> +{
>> +    const struct arm_smccc_1_2_regs arg =3D {
>> +        .a0 =3D FFA_FEATURES,
>> +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
>> +    };
>> +    struct arm_smccc_1_2_regs resp;
>> +    unsigned int irq;
>> +    int ret;
>> +
>> +    arm_smccc_1_2_smc(&arg, &resp);
>> +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
>> +        return;
>> +
>> +    irq =3D resp.a2;
>> +    if ( irq >=3D NR_GIC_SGI )
>> +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
>> +    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
>=20
> If I am not mistaken, ffa_notif_init() is only called once on the boot CP=
U. However, request_irq() needs to be called on every CPU so the callback i=
s registered every where and the interrupt enabled.
>=20
> I know the name of the function is rather confusing. So can you confirm t=
his is what you expected?
>=20
> [...]
>=20
>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_priva=
te.h
>> index 98236cbf14a3..ef8ffd4526bd 100644
>> --- a/xen/arch/arm/tee/ffa_private.h
>> +++ b/xen/arch/arm/tee/ffa_private.h
>> @@ -25,6 +25,7 @@
>>  #define FFA_RET_DENIED                  -6
>>  #define FFA_RET_RETRY                   -7
>>  #define FFA_RET_ABORTED                 -8
>> +#define FFA_RET_NO_DATA                 -9
>>    /* FFA_VERSION helpers */
>>  #define FFA_VERSION_MAJOR_SHIFT         16U
>> @@ -97,6 +98,18 @@
>>   */
>>  #define FFA_MAX_SHM_COUNT               32
>>  +/*
>> + * TODO How to manage the available SGIs? SGI 8-15 seem to be entirely
>> + * unused, but that may change.
>=20
> Are the value below intended for the guests? If so, can they be moved in =
public/arch-arm.h along with the others guest interrupts?

The values are to be used by the guest but they will discover them through =
the FFA_FEATURES ABI so I do not think those
should belong the public headers.

Cheers
Bertrand

>=20
>> + *
>> + * SGI is the preferred delivery mechanism. SGIs 8-15 are normally not =
used
>> + * by a guest as they in a non-virtualized system typically are assigne=
d to
>> + * the secure world. Here we're free to use SGI 8-15 since they are vir=
tual
>> + * and have nothing to do with the secure world.
>=20
> Do you have a pointer to the specification?
>=20
> [...]
>=20
> Cheers,
>=20
> --=20
> Julien Grall


