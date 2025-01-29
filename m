Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681EAA21906
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2025 09:28:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878930.1289144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3QY-0001Ts-L0; Wed, 29 Jan 2025 08:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878930.1289144; Wed, 29 Jan 2025 08:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1td3QY-0001RW-Hm; Wed, 29 Jan 2025 08:28:02 +0000
Received: by outflank-mailman (input) for mailman id 878930;
 Wed, 29 Jan 2025 08:28:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Ogr=UV=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1td3QW-0001RQ-F7
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2025 08:28:00 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f403:260c::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1ffe28d-de1a-11ef-a0e6-8be0dac302b0;
 Wed, 29 Jan 2025 09:27:58 +0100 (CET)
Received: from AM0PR10CA0123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::40)
 by GV1PR08MB7801.eurprd08.prod.outlook.com (2603:10a6:150:58::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 08:27:49 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:208:e6:cafe::3c) by AM0PR10CA0123.outlook.office365.com
 (2603:10a6:208:e6::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Wed,
 29 Jan 2025 08:27:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.0 via
 Frontend Transport; Wed, 29 Jan 2025 08:27:48 +0000
Received: ("Tessian outbound f30a9786ee22:v560");
 Wed, 29 Jan 2025 08:27:48 +0000
Received: from Le9b63c57896d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BBE4AC25-AAA5-43F4-B425-32619D748A37.1; 
 Wed, 29 Jan 2025 08:27:41 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le9b63c57896d.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jan 2025 08:27:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB7793.eurprd08.prod.outlook.com (2603:10a6:10:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Wed, 29 Jan
 2025 08:27:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 08:27:37 +0000
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
X-Inumbo-ID: f1ffe28d-de1a-11ef-a0e6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Q4gqCdJqigNrXH0Nz3MtDTWiyKwqJR5eRm2xcjs3pDYmPjfqwfP90/3VTba2MWONY3+n1OAHeUR0fgqCsUtWFv2XvkC98kjhIqbGEjnLzS8vPEvrw/vskIIA7XM4hX+qETMj20/TSBNxc9UdexRS8jgbvFcyUysTKLUUL9NcvaxwzK5EpT20w9Z9oU7pEeuhcR4qzaVBOVcJp26qVj+eribB/PPZWNa7MiKnsGq+l7dMebHFFCYa1qHVYRRROF4DaQ6mvJheM1fkzb06BW20OU8yY1nAB+OcqQ6+24eM2qs/zlPjiUsX77ApgBhBvaQfrE74PD9iTn+C7ZBBw3kkVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gDjSK+QZ2iHDrHwxLIug8xIREgHyKTYFrw68Erz10Y=;
 b=EOYLZxie4sNIXp1rCCOh5CmjonsbGR1mV+C8gX91JBHQ09gGKnv0msyXwPQ93/kDw70uAaD15w+tvWz7UpGv/61BNpuIB+BkrPK5w5NKYXatJRh/Yc/7DoraovZG0z+a/+FbvA1AEPY0QBpY/sR2bZ7I7r4gDNYxaBRNpFIkZ8ZCbp4u5YiQgGbdaVd7apCHOrp0Y7fHjgSITOyssqGf+caawISE3Cj7ePQxXtnQbqRmoRKm/rIdrLCFQrOE4HQpeHggAzEKCxPflJbk1mdChNUH765KUrSk2XCfVMMUYuV8SOg76MRUeBqVIFKpMeLyMXNhbmsFFNy9csVH0GKJEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gDjSK+QZ2iHDrHwxLIug8xIREgHyKTYFrw68Erz10Y=;
 b=iGNqoBvosup4mMa/zKlyhlTUXsbX+qFCkSSZwoZ1ce78CeEL4s4flTXeoQdxv4qBM7w2B/CSJehTqTGx/96MoMwfmnR6i6CZ7Eg+oHQPG4SDZdijCsbxIrxR6Whg9TWN3bDsYyT5vszrKrmBNDBWCU55Tj7k0EoXXHiGHCdbR4Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 012863e28c7184e3
X-TessianGatewayMetadata: 4lZKxrn2R84eN6nI/yH/JrjvySLvSrtjduVfPY7C0uTobrYlsQKG5NKsSQMNa/V64vLIv3kokyJhql3P4jyq+FZUSoMBwuXO9tQgb1OUNSWQJM7/o3oDj2DiNGEBKDrVgwxiVBDK2wsIa2S5wBtXic4bZda8bZM5KEvFH6OMc2Q=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FSPLhA4XwJ4w9tmroUWPBhMYrUvJH0lSgK5sm8x0Q8PIQbmBjLzNEjcpDbr4n5pzhmpRy4ajwA+W++pg1YxnFZ0HyUFGABGg00cmJCR87EL4gxVbYfHmQJcxFmrEf9MU6IjeJiLcO9Criv5T+meFQ+OVKbyKV7TEg2m3jgqqXvkV3OQD0VIzV9eALbTasvSFmf1pOAEEDmAVEyDIE5SJ9s3VJ+nONwcb5MnvzU/s22yioc5KQMrPqLeyn7gYSgrQBuXqv89YVzwiXooO5ui93DFftzLyG4r4kV48MSHqLnekgXd/QxwwPnJbUE3rv7BH2+fWxMYumeSIB2x4tIpXjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gDjSK+QZ2iHDrHwxLIug8xIREgHyKTYFrw68Erz10Y=;
 b=odVzmIVXUUDDfzVlB6/a9ZfNg1Ut5X6zqajx96cqW7ycZDOu0IOQegp93STSXKsPJLX1u03/uUT00IfTqYtzPVsOrytDg3bqXHyR5p4QdCHAEiof5KmQvhH7FTrykTVhD2+2oPgfzqEKk5gVnfcEVBARN20kc0vd65TnlbIXAYIN2AVDtbqeEiEdHh4CSk8KEHP4PGoTx5XiDcofi/5l2hJs0Yau0eRnLKEiSbaUVOaneLfrFVNUW+udy8UjWPoDbBUPmODnYXymRNhz5ytaT8NWJ8hhqQF/Kh9Z9KJ/+V4iSUg7AZK0/2GQJzG+Vybp5DoajgIz0xOYjmkTLJyAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gDjSK+QZ2iHDrHwxLIug8xIREgHyKTYFrw68Erz10Y=;
 b=iGNqoBvosup4mMa/zKlyhlTUXsbX+qFCkSSZwoZ1ce78CeEL4s4flTXeoQdxv4qBM7w2B/CSJehTqTGx/96MoMwfmnR6i6CZ7Eg+oHQPG4SDZdijCsbxIrxR6Whg9TWN3bDsYyT5vszrKrmBNDBWCU55Tj7k0EoXXHiGHCdbR4Q=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v1 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v1 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHbZr2N0lH4GhPB/kOpvRdBJn3PXLMtgcUA
Date: Wed, 29 Jan 2025 08:27:37 +0000
Message-ID: <65584EA7-9B46-40E9-AFD8-B7C8F77A5DA0@arm.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB7793:EE_|AM4PEPF00025F95:EE_|GV1PR08MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: f8640c48-11a5-4630-11a9-08dd403ed0a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?+vOEy2LR7oLldaChIGthoUIMCEsT+8hOrCHOzL79pDxdBkckokX7DtBjzRck?=
 =?us-ascii?Q?OYa81a7E1VucbUqytrDm3uNQS4rghCd5vzTGajKSZWBE8CbRDtJVHz4DFpy4?=
 =?us-ascii?Q?7ir65e/p5/E/+UOJrO5z/of71nhy+S6bTbIAo+bmFyvoldPeWt9rSTXclM44?=
 =?us-ascii?Q?2vlE2iv/qcCy873xlZb8BLYHYjdlyNK7FcRcLnpWZRsuWVgzAOS49VXAIp2N?=
 =?us-ascii?Q?LUs41mYimt0BprtughHm7Fa1J2yTsK9sp12gq/Rjh3bQo9Cj09a/KiI7cYp4?=
 =?us-ascii?Q?DdzsV4vpcIhQQuNLGQMRddo4nlp1nvVmssOVga8UXcSfyQq1waKCOcMwWB3D?=
 =?us-ascii?Q?Qwc2mYdW5Qc8WNt66wiuZGvo414KE+GWnD57khIDrYiGYXbYxkYP5Ce7InTn?=
 =?us-ascii?Q?9YGqnpqhfP2OUTkRJqL3eQUA84QiBud68OKeYw1t2O1yUAylBtg/WF11LbmG?=
 =?us-ascii?Q?z3z+/R/0aC941oHQ+W8Zjxt3/0zvLDfwNPJhMyDpeajNlEyl7wEcSP6X+tOb?=
 =?us-ascii?Q?qzBSibBURQOaTGXjP5k+mdARZ3EeOCqm3A/ZETQsbUNff5JxGbksmSFP48xz?=
 =?us-ascii?Q?R03RlVhESWjHMuoENniVi/hIzViFGUgrdExQxDXdXV+Tm52KcnMGP/M4TUl/?=
 =?us-ascii?Q?H1P7YTdA7FV/ii3EpA9pAGWB8ivhhHUSwg3ntHOvM66HHnW5DWIhJ7/yCALP?=
 =?us-ascii?Q?nmCH79JgR0jjHOXbAq5bQgAXUAzG4fqJXQFu986y6kJiUtfc8UEuGbgZBhZj?=
 =?us-ascii?Q?p3xZmfy93QY68brL5yfkcFfcCq3xLxtkrnntMURhzqJL3YdJAHOflfe0ZJOt?=
 =?us-ascii?Q?gPPkIA5YoWFvjdvKNU1dy8YIA9JesaE9IlpmLjbjwRauerAfF3j0l6w/mJ0U?=
 =?us-ascii?Q?1r5lU38/YWSNx83tzTy6gNQXX38c6jiaaW8XRitMVkEnr9eqpvSv7pMF9Nrr?=
 =?us-ascii?Q?pHQ+c54iWEaWopPf6u4y8sUMYv+K9h1NXBvKfQbkpCdoQo01I74KegtJ7mx/?=
 =?us-ascii?Q?+kyO4iEDD+kQsVrWHFHtvdyny7JajXsvhN7WRMfPEwON2b+JlYMRl7xRi8Kc?=
 =?us-ascii?Q?wd6MwfHUJBlRaX7+mYOVy4Ea1WHPQQvnV0/sjeaFyWctHKqu1gu7FyffNuBJ?=
 =?us-ascii?Q?wZtDpX+uI6cR0dt9nY/6/zlXsPKK2R+OhVQfjGy99LhXbm/0lPOlahYal1xD?=
 =?us-ascii?Q?Skhi/UNcbG/WHz+Slz1I52mI1//ETl6Njy8/fjCWJPyax3BYyFIEwstVDsGq?=
 =?us-ascii?Q?6eMFTB1ctu/qH2c/l8G2xNVF/UJQuWWiTBrIzC7tH8AhAjdFrvzqSfKFEidK?=
 =?us-ascii?Q?YIWzGDNBX1KUFpZvM+rlHwJnpglLwGa+FzcBArJJOwY/gLMLvWwKqkE8A17O?=
 =?us-ascii?Q?QRAPF+jPIwdPmkZc6V7VxicKXhto?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F630C92E0356F64DA487A145CA00141C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7793
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9df8f33d-4eaa-47d7-c32a-08dd403ec9d6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|82310400026|36860700013|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4SYwzfrq+Z4BlYUEoaX2texBHunjYOfD3j3+7FMIlMMdZlCXzZx+FodfjCnQ?=
 =?us-ascii?Q?Y/8i7dIlrS3ITYynDe+QPM/L54XRK+z9vANqr6fbvl5bbdfLiER2ZKJdYn5j?=
 =?us-ascii?Q?90jfhYRejsVajRfiZ2ZuOkxWsxohAtE8bA8KUw9EUGIuZ8xq2xrPp8FK4mla?=
 =?us-ascii?Q?lPQoKXwr4p50X9Ap67hiuPUnj+s0IWJyPDngWjLCRcsopfgQnGwHio6hX9IN?=
 =?us-ascii?Q?dmPCcBOx6oYh0sZep/w8jFTA3fmUl3734G3vvTPwB+Eg+bXRoPehbzZBRxn5?=
 =?us-ascii?Q?GJfc0VHWge9voRDLdbLYuMVxi+uGWe7HJkfR0hTpkHDnAuv+YnCG5l4dwXky?=
 =?us-ascii?Q?+mlu2er4Y7ZBjbIHzSzPKxlnpqKdhrxdWVnHN3K7SBm0GPFKX/dPH8qtXjK+?=
 =?us-ascii?Q?b9MbeMi2WHRtT16ywENLZCCFOuBsYXottRgbdHrRB0L+1ZvfFtPCVAG4CBAg?=
 =?us-ascii?Q?hZsZzLPz1JDQvn0KbvSm2W6iR7eFt0/whbrTVEyMnyocXEgP3Ku2rRPEC253?=
 =?us-ascii?Q?7X8dsAbFu4iuQib9W/d+gaAdViuRvDUA9HKOWKSGqo6np1SIoE8J4cQdAkcf?=
 =?us-ascii?Q?oefuGV5+JXEHJYMapDigZrxFb5XGw+wlLpp95q1afGAIb5+PV4QRuR5DPpnX?=
 =?us-ascii?Q?tKP+i8i3LoRZhn40LxvriefcCMGtoHTRDZlCWtZvpQ/H/RObwzo74LLZJJki?=
 =?us-ascii?Q?Io/eAC3LWsuQH6RC2h1SzsgP1YzTa4vIFXShbgDIPwv+gnutysQfSgjhuZPv?=
 =?us-ascii?Q?kgpIPCY3hFMJBtesXEYC9+KlYDcCIbdBO1Z9nyDifx939crOtt9iaC4tM69R?=
 =?us-ascii?Q?fw7JAwlOpaWcSLjL3As1gPloR8wZj+sBU/BmTJjzIMV+BarNkB5SA1eJIuTp?=
 =?us-ascii?Q?lfDYkd8wXd8oEc0iOuaHOsyTPCkmmFSeAcHgilISUkQZidq3EFCKJQQlM5uE?=
 =?us-ascii?Q?C16urqFETNZ9A25JLCGN0yM6wStX0FmPoZw04b1XbNyWh+gQD0jM3+xoGApX?=
 =?us-ascii?Q?O8SrEX+gp+wziCrZusHMa0obcNclZZESjAEo14ccnGFwiMRPsWjmBBPUooCv?=
 =?us-ascii?Q?QBmUHatSymY640qckDvfWCjDwezINuqOW+feFk7pQuGc2wNlfKwLEV2ijzMC?=
 =?us-ascii?Q?CWRDcD457zKjrT8Fz2DU/aEozJsLIpFzc2shbHMRIXX1ylMTno71CJ2vDBuK?=
 =?us-ascii?Q?xe6TNJcfiecdFxXpqvMFuW+jc4+eAb+Ysn86kuP6NW529LqWBMil514Ho6mC?=
 =?us-ascii?Q?Gjp5MAkgBO5j5IlzFH7ylHOC65uBpwPybpZVsld2SjBo2LSePgPaAghYDD/f?=
 =?us-ascii?Q?moJBkb7CqRbjDlyHSzFgbEgYM7WZyXAN91wKY6FOCmTosEG12XcQBI6MeXbW?=
 =?us-ascii?Q?bmjYApsiSlrtCTYEqVr7Xc0uGgJjGpGzfbK6GjkoPFMrQ7/5koVSxq1ExJoY?=
 =?us-ascii?Q?LWEYSBbqAe4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(82310400026)(36860700013)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 08:27:48.8260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8640c48-11a5-4630-11a9-08dd403ed0a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7801

Hi Ayan,

> On 14 Jan 2025, at 20:50, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> In the current patch, we have defined the requirements which are common f=
or
> all the commands.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 52 ++++++++++++++++
> docs/fusa/reqs/index.rst                      |  2 +
> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
> .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
> 4 files changed, 131 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/r=
eqs/design-reqs/arm64/hypercall.rst
> new file mode 100644
> index 0000000000..66dbcc3026
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
> @@ -0,0 +1,52 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Hypercall
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Instruction
> +-----------
> +
> +`XenSwdgn~arm64_hyp_instr~1`
> +
> +Description:
> +Domains shall use the Arm instruction 'hvc' to interact with Xen.

Why are those requirements defining what "Domains" should do ?
Shouldn't we define them as what Xen shall do ?
Something around:
Xen shall treat Domain hypercall exceptions and hypercall requests from Dom=
ains.

Or something around this idea.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Parameters
> +----------
> +
> +`XenSwdgn~arm64_hyp_param~1`
> +
> +Description:
> +Domains shall use register x0 to pass first parameter, x1 to pass second
> +parameter and so on.

Same

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_first_param~1`
> + - `XenProd~version_hyp_second_param~1`
> +
> +Return value
> +------------
> +
> +`XenSwdgn~arm64_ret_val~1`
> +
> +Description:
> +Xen shall store the return value in x0 register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~version_hyp_ret_val~1`
> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
> index 1088a51d52..d8683edce7 100644
> --- a/docs/fusa/reqs/index.rst
> +++ b/docs/fusa/reqs/index.rst
> @@ -10,5 +10,7 @@ Requirements documentation
>    market-reqs/reqs
>    product-reqs/reqs
>    product-reqs/arm64/reqs
> +   product-reqs/version_hypercall
>    design-reqs/arm64/generic-timer
>    design-reqs/arm64/sbsa-uart
> +   design-reqs/arm64/hypercall
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index 2d297ecc13..0e29fe5362 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -79,3 +79,19 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Version hypercall
> +-----------------
> +
> +`XenMkt~version_hypercall~1`
> +
> +Description:
> +Xen shall provide an interface for the domains to retrieve Xen's version=
, type
> +and compilation information.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fus=
a/reqs/product-reqs/version_hypercall.rst
> new file mode 100644
> index 0000000000..fdb8da04e1
> --- /dev/null
> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Version hypercall
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +First Parameter
> +---------------
> +
> +`XenProd~version_hyp_first_param~1`
> +
> +Description:
> +Domain shall pass the first argument (as an integer) to denote the comma=
nd
> +number for the hypercall.

Same here should be turned as Xen shall.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Second Parameter
> +----------------
> +
> +`XenProd~version_hyp_second_param~1`
> +
> +Description:
> +Domain shall pass the second argument as a pointer to buffer in guest me=
mory.
> +

Ditto

> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> +Return Value
> +------------
> +
> +`XenProd~version_hyp_ret_val~1`
> +
> +Description:
> +Xen shall return 0 in case of success or one of the error codes as defin=
ed in
> +https://man7.org/linux/man-pages/man3/errno.3.html.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~version_hypercall~1`
> +
> +Needs:
> + - XenSwdgn
> +
> --=20
> 2.25.1
>=20

Cheers
Bertrand



