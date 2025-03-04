Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A7AA4DED3
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 14:10:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901111.1309093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpS2K-0003u1-8F; Tue, 04 Mar 2025 13:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901111.1309093; Tue, 04 Mar 2025 13:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpS2K-0003s1-5F; Tue, 04 Mar 2025 13:10:16 +0000
Received: by outflank-mailman (input) for mailman id 901111;
 Tue, 04 Mar 2025 13:10:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2zF=VX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpS2I-0003rv-Ts
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 13:10:15 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2608::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 018c1c80-f8fa-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 14:10:12 +0100 (CET)
Received: from AS4PR09CA0006.eurprd09.prod.outlook.com (2603:10a6:20b:5e0::16)
 by PAVPR08MB9308.eurprd08.prod.outlook.com (2603:10a6:102:303::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 13:10:07 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e0:cafe::36) by AS4PR09CA0006.outlook.office365.com
 (2603:10a6:20b:5e0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Tue,
 4 Mar 2025 13:10:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 13:10:07 +0000
Received: ("Tessian outbound bc832f6acacf:v585");
 Tue, 04 Mar 2025 13:10:06 +0000
Received: from L8f327cf14d54.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D667CF5B-F9F4-42FB-B89A-EA86AEC59827.1; 
 Tue, 04 Mar 2025 13:10:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L8f327cf14d54.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Mar 2025 13:10:00 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by FRZPR08MB10927.eurprd08.prod.outlook.com (2603:10a6:d10:137::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 13:09:57 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 13:09:57 +0000
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
X-Inumbo-ID: 018c1c80-f8fa-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XV6VPxpGihc0i2A+ssLcvu1azxH6lnbcwCml+N3xaPbezLkCgf0Fg31sBZqKaoeVrwoRu4lS2BfYS07X74iDyk7jQ5IBjvsmWxU3GUc/y2IInF3AJ/qhbunwVtechRjldxNxLfVjk+cs1VQ+pMjZFBr3U0udzNvXv9sJHQicxHotCAa8IICI/7JEcAGOtNzOGmN2bgSiC2RqOD2cLeiL+UCdardOUYxV2UdfN/oW4SiFUPhYeVXFcXM8oQCwUfWAkdFS2j4iULnukknNTGQnRrAuZv06MyC8vc51392GCWYymM55rfEJs1YNAkbibsinHn6Si81LLfAtcazOSxn/sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8WJT6ccS9Y9oaYaix56tGOCJVW7hAmA9S8Xsf8GRaA=;
 b=JnXgw8CyHetTkW8d8xvfQ98RZUE0hPMGsCpQS6TT8XQIDzKWflnA75VL7sI+VfFnmUzZxQcaKID0fuec0TK1soRBVoqjxRrwHoa56Dwl/9DjF1I8oNUU8B4m/fhCc9da+bZbx9u16Nkr/DbUV/SACpyIZdz9G5jaJWy9mxlc+OGX9TVxK7kjSPoCC3fSKJyxz9fK1ZVmoVlqT1x1GCRLh/nEmcdZ1ed+hPJF3+gahctHz5zfJpdli9IXPrc8+9B2V1cdHPbVCDOb7/iYda2jtw+4cyHj0M9qJJgVP0D53mEEk8rovsjoYtQcU8lWZ5CWYoHS1gmcGGeNy8pO2rp2lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8WJT6ccS9Y9oaYaix56tGOCJVW7hAmA9S8Xsf8GRaA=;
 b=SVBQqE8he24DonMpO9k/CuQsTPyctMBjsNK30Ga3d+T8cABJ0WXEQ8IzUHyG7yzG22VOI1eQXS8Hc6J6aC0bosxsG4Ph1Dr0RQQn1C0RmWycb6YX8M/izdCg4UhlXzbm3T8zxHMtYL0XCGpZHxdv2FPAulBwFVrtsXybQSgVoVg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ad31a2dc3774375
X-TessianGatewayMetadata: r9s2FvVsI5IM03m9R+0t1w06ptoM1/wvc2I8eQndNwSsG1XeLka5FjPWyh0JPBX2+Y2Bu/pTRQtzNmxWMfs4tDCBLZRqui1r+3eMGz38gJWRtNzamalZPBkI591/UXKzxYwHsB/2d8z12/Ix8yvVa7d5g4vvH8SSBhdOAoX3W44=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQWUe5u4Zra6qL19bxrbR0YYEvZjMr/7j0H3XvOL3UTJlkWD9BJXVICumqcyvzDM6hXCGUoiQGHVgJTYyMRDst3SohWm7xcqEKcEUKe3eYE+yOhFXcB8ZSfDZY4MN6tCqfKsl/tbwX7KgVRMZq/n9xrhSUPUIE0rTDhFn8+NWaIaMgn1d5avKPeo9V32eRzI6fqM22Jb/2kB8XGk0bDsdI8e/tnJ9imlgvbvDveqiQbxUUC1yeAdY5aIHDAJVpv2xD5Oxz+i+qUCpsJzmvpMqLW1jkZNo/U1/sds57Z2TtCUMVcQLfvxOFCnWhxEP6BVDx1o/E28ZzZPvzWzR3rY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8WJT6ccS9Y9oaYaix56tGOCJVW7hAmA9S8Xsf8GRaA=;
 b=JBGC7yMYyzv8MyNsDmysl/vkbTEG77gZlVhejJi1BaRtKc5LUtEQuKXai3QWJ1ResppwEbWL1B6SWXIU3/e0k7AP2Fv0bHk53K1J717+05F79M5gHXmRDqCiTMsngh29x2u5tYSNF8smT79x3nRhotxP2ZafvPsB9TaAQUHeNdge/aL3V7Q0v0q7kLiNtRbIr/Uy9bzZWIm2evA7yuYD6IAMTpRpKXTBsF4Z4by4wTN4km29+x2Fba8z1rYSD9QozeWWEVIi7JueTt20599onUmFMUWNuPHa/7LHiWA7OcWSluoaLn69ii2JtpuZyi0SSad5sSbsogtw4a8DSXdhYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8WJT6ccS9Y9oaYaix56tGOCJVW7hAmA9S8Xsf8GRaA=;
 b=SVBQqE8he24DonMpO9k/CuQsTPyctMBjsNK30Ga3d+T8cABJ0WXEQ8IzUHyG7yzG22VOI1eQXS8Hc6J6aC0bosxsG4Ph1Dr0RQQn1C0RmWycb6YX8M/izdCg4UhlXzbm3T8zxHMtYL0XCGpZHxdv2FPAulBwFVrtsXybQSgVoVg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
Thread-Topic: [PATCH 3/5] xen/arm: mpu: Move some of the definitions to common
 file
Thread-Index:
 AQHbdzpt64DSSlVqrUGsnEaCrB85rbM6YXOAgB5TtQCAAK0QgIADM9QAgAAUVICABnR7gA==
Date: Tue, 4 Mar 2025 13:09:57 +0000
Message-ID: <518FC65F-E191-4544-A76F-56B7DE02ED49@arm.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-4-ayan.kumar.halder@amd.com>
 <18E074A3-A76B-4C9E-A8B4-8E23B07CB7B7@arm.com>
 <a593bbed-24de-464e-9fea-db988cc61f7b@xen.org>
 <CFF70353-90F6-4ED4-AEE7-155C4480AF98@arm.com>
 <9f5f044f-447e-41f8-b981-3aa2a848d458@xen.org>
 <956eb845-5848-4fbc-9596-e2f088192c43@amd.com>
In-Reply-To: <956eb845-5848-4fbc-9596-e2f088192c43@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|FRZPR08MB10927:EE_|AMS0EPF000001B6:EE_|PAVPR08MB9308:EE_
X-MS-Office365-Filtering-Correlation-Id: 62345df8-ec76-49a4-c030-08dd5b1de2ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?cplVY0PkTkwfLoP5TEetNZadycZUDWnzi3jaq1ms+C2ExSgXgFTiVf/XTfy0?=
 =?us-ascii?Q?tozPEZD1SUYyOzjLJVp1O1ASNeFPcNVr8gae5maOcaZSaTNInoOSoNdeiukM?=
 =?us-ascii?Q?qcU00t5GpIHNB9e+z14vU+r5UbRAWT30mn7TMJhmeN0hHpYenHIP30U3f8Is?=
 =?us-ascii?Q?xzPvffYFYr6pjteEv10bvib1GctfVmcw41J6fUHEPofp2Z6JgGufzxL1CMxl?=
 =?us-ascii?Q?w8q2JbYAcVMvAH7bgaT3ft232dWKCxY+DT9Xz1At/gT3u+ZJsxSk3E1ugmwk?=
 =?us-ascii?Q?1gGbzOpyGKvm7G896TqB8Aj3QkTQBYYXBG7ut5+WqaF0u/aCdZFk3i8OX+TR?=
 =?us-ascii?Q?cZ1IkZz92bzNQWjthIwDOSjKOGF0EDCcFPIHvJe4C8F+0df5LYw9rhhruVdg?=
 =?us-ascii?Q?T0d8FqG3NufAQFY6KbWlRGhFwMY1IQci4zM8l111420akJ/28nIxccLFZ+X4?=
 =?us-ascii?Q?rucV3xREd1oC2j1SkumCE5j4kIvIAow+/6J8xddiUN26fuCRnhgN5kpmAlWw?=
 =?us-ascii?Q?hQiGKeiPRT8eY6xcO2QeEPspSTQLVFRHVbaDhmhcbDcuCmqjoQuXcdy93uZm?=
 =?us-ascii?Q?wIr8oDRJ/TuPqNMjZES/jFwWmfHmevJVYnaztIkozP4W6BU0+kp8cppse/Qn?=
 =?us-ascii?Q?TdKc3LP+NHYrqfMc5te0HA1UqC8ysvNol6GyllyQria+amPKV0ri9v1KEsu+?=
 =?us-ascii?Q?sKgiBgny77xqxD2aNPRHQ/k4JcwG4ruNnV2nCH803KvXiRBrplHyZoo4FIpH?=
 =?us-ascii?Q?g67vvnMHwidc2wbFjkUDAAnXMpA+qoGFw55GB8Z1guIu5otq/EDdJJkPFSmX?=
 =?us-ascii?Q?2Ba5+Vvistr+VH7VZ4rs/Ze+6ed/7B11/B6DblMS650ehISy4QdYvALMk28A?=
 =?us-ascii?Q?6cGgSgOstq+GmMSGUxvnZHJfVP4PdtawcPt//q4jWRJzx8lOyBZEFHtilFPh?=
 =?us-ascii?Q?Q8Y3UmA9gjOYyAobHJYEWMZkXnYjhNlq1jpdf5pSaI/jgobTEINxQ0dtD4Zx?=
 =?us-ascii?Q?mXGXN4JZeZ+Rn2D2bRmc7+hufFxyepj2jdD6/LmYVCBc/0jXz7NaJAAVDp0D?=
 =?us-ascii?Q?l8qyQSo530tTo+v0azz8o6Ka/P2twl+dsJnHWCpo5yw/D+Bq05kFnSEQjUVB?=
 =?us-ascii?Q?zs3vbfU5kGh6nMjXkM3nApYeWwEfQBOAfhkPYaz/KHGstRnF5SR65lj1SeEg?=
 =?us-ascii?Q?5SD5RT2BCIDCGI+M/3nGR9ixX7Ut2pNARMYNqNbS7FzwApmAkGCeTiCbb6Gc?=
 =?us-ascii?Q?vGdrNuPbL7zS1ty5Va91lpc6LJmBenUJ1xm5zjYHpW8ivFskxKQDaKZhemqI?=
 =?us-ascii?Q?cyp983uMGtpKEs3T93D9DHwC4ldgen+7tlbKf2YmgLDl2omPhCkD/Je7cgM1?=
 =?us-ascii?Q?RWJFsP96cUj3VIiaAw4tRO9mJJlhyMaK4u03nB6/jfqZwH6tO/WUD2Rv9JFe?=
 =?us-ascii?Q?7QE4qb5p5pnQivhyEUKZDi8PTbB4iYNM?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3241EE1DE48C6240825158C0965BB935@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10927
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	adfc8b05-3d98-46fb-3cd6-08dd5b1ddd1f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zmvucsI2ZM6fDfyeJD0PZdYuWYFENHuMAxUPvyw8k/Oa57s92lehPHE+L+UM?=
 =?us-ascii?Q?f/WSGDFGg5lSU8XBULppzHKtsJHHZa1e6Opu+SJMaB36kVrHUZ6UioXdpPMm?=
 =?us-ascii?Q?H3SYpXZfb6tOHBwP94qQSJ1U0TG0eED5CktWw2lf4OnYIR3GFqdX8g/QtuU5?=
 =?us-ascii?Q?Ehsp9OukV3hPwwLWJzO1izPxlEMKXbeKqNWXp0W+AICX7g5b46f8ucNpLwfc?=
 =?us-ascii?Q?iysQzCfeEiVzRfLzrnZJ4ZI5P0JjX5tZ1mrRyRlw6x6PtbFrcCszdB99L92f?=
 =?us-ascii?Q?Y4qLwqpKVX3u8Ucjxjuh/mbf8mrDP3f1vFv6p8UGVd5nmzrdnZVTMEN1Hdpt?=
 =?us-ascii?Q?xnOiA9LN/7hXZMWlV/DJ4bnNTzdPiD4vqAZRTeyNnjp+HuZo+RxLbBtBZRxD?=
 =?us-ascii?Q?ZDQ8nkodfBoKMqVd1FBWJ1bKVkwMTHLfRoNsoXKa8k+8aLQiFdOlWqqdjB3m?=
 =?us-ascii?Q?c4VjghoGgzeZEcSaI+YzJzYuMlcv+83YORY8SUgCInE3/ASaAdZkC2QliUdn?=
 =?us-ascii?Q?aPdHL+PxQK2agKkA0frSGUt3oVgj1mvSdqHEimY3dXMV3gz1t5Ype970IhAR?=
 =?us-ascii?Q?ubaPZmOjqJMwzS2DccX9L2KDn+z4nQhNpDowmIdYubAgpSvO61G9Gp484JtG?=
 =?us-ascii?Q?3OcgIL+QxI1I9OBMMa54Sl4ZipHqpKdXR1DwH38/eE+YOCWeskuqnltiZRTT?=
 =?us-ascii?Q?QOJl1uJNtxC4gbtHxVmkpCZ/t6N4+4QxwkS0AmPSIC7fhMsQnAIT/1tO4WyS?=
 =?us-ascii?Q?DpXTXOgEVr7eq0qCg2JkLKasbwRt+goiWoJXFeT3Jr1DqmHz6Q7Kmtbre83u?=
 =?us-ascii?Q?99fd8Frt3uVV8366kwX7mIbkyF1UMdgl5Szd/SbWyIzVKixTpCeWWoLYBmSY?=
 =?us-ascii?Q?eaBNKkxI0fagHVBTgHhwaneYd3kJFUFSiK4Coru3zUyF54XfKhPKDH5wHlcT?=
 =?us-ascii?Q?yDUAGPicvemHt0xEyuDCmEw797flFGgoCRWvXGVF+GJvoe5WPyKAJt7eCUzN?=
 =?us-ascii?Q?X1s4lApHMlfoZBBOTYHa/UmvbZCrRM9rc5bXU8/pL+6f549VXxrXNX3HjtGx?=
 =?us-ascii?Q?hAslABvWZZR4UdOf05AZ3ILCRu8VKoE5Q3R3YISybO+uj6bJJtSdU8y8TIur?=
 =?us-ascii?Q?28UT7rViIluinpocwtNOQcwoFcRKepmxm15/XW2chzuVSEnxB0uZCEK7pFh+?=
 =?us-ascii?Q?5ia1PolzhFFS5Gs8r4LbWdP9IHWq45Yvvhv0ZV2pJUmJtL7d4yDbVeFzc5Vv?=
 =?us-ascii?Q?E8K+t6u54IjkNLLkAjy9g02I5JLRpjb5FsE48lyhEKGOYeOWcGZAXZOBTbML?=
 =?us-ascii?Q?cLkBIxdodVWmEhhaHomG86bSzExIte6KrY38MGyFlLiOE239PINpPaiHEOrO?=
 =?us-ascii?Q?ZVl1zjXXXD+ctt9iP415DMqxfI0cIYEvOyzMmiYW6by9Zyz6ADW67XwvX7lt?=
 =?us-ascii?Q?gZDr814LLmJY2PqY/F76sHcQgcNPJuI0gW5VTA9m8Ntcoa24EdnLaaqGR0qd?=
 =?us-ascii?Q?uXPSUKRCsunOMGM=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 13:10:07.1134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62345df8-ec76-49a4-c030-08dd5b1de2ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9308



> On 28 Feb 2025, at 10:34, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Julien/Luca,
>=20
> On 28/02/2025 09:22, Julien Grall wrote:
>>=20
>>=20
>> On 26/02/2025 08:28, Luca Fancellu wrote:
>>> Hi Julien,
>>=20
>> Hi Luca,
>>=20
>>>=20
>>>>>>=20
>>>>>> #ifdef CONFIG_EARLY_PRINTK
>>>>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/inc=
lude/asm/mpu.h
>>>>> Why not in include/mpu/ ?
>>>>=20
>>>> Do you mean include/asm/mpu? or something different?
>>>=20
>>> Yes, sorry typo, I mean include/asm/mpu/mpu.h
>>=20
>> Thanks for the clarification. I don't have a strong opinion either way. =
I will let Ayan decide.
> Can I leave as it is for the time being ?
>=20
> I mean I will create "xen/arch/arm/include/asm/mpu/" directory when I kno=
w there will be more files.
>=20
> Let me know what you suggest.
>=20
> - Ayan

Ok, as agreed on Matrix that Ayan would like to go with include/asm/mpu.h:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


>=20
>>=20
>> Cheers,
>>=20


