Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCCDA1D758
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 14:52:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877928.1288098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPWr-00026r-Iv; Mon, 27 Jan 2025 13:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877928.1288098; Mon, 27 Jan 2025 13:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcPWr-00024u-EY; Mon, 27 Jan 2025 13:51:53 +0000
Received: by outflank-mailman (input) for mailman id 877928;
 Mon, 27 Jan 2025 13:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0bb=UT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tcPWq-00024k-3g
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 13:51:52 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [2a01:111:f403:260e::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbe7252f-dcb5-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 14:51:51 +0100 (CET)
Received: from DUZPR01CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::17) by PAVPR08MB8967.eurprd08.prod.outlook.com
 (2603:10a6:102:326::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Mon, 27 Jan
 2025 13:51:48 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::bc) by DUZPR01CA0085.outlook.office365.com
 (2603:10a6:10:46a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.22 via Frontend Transport; Mon,
 27 Jan 2025 13:51:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Mon, 27 Jan 2025 13:51:47 +0000
Received: ("Tessian outbound ad34cb01f105:v554");
 Mon, 27 Jan 2025 13:51:47 +0000
Received: from L882fb65b4a27.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4A91ABE5-8FDC-4F85-93E4-C07970692D85.1; 
 Mon, 27 Jan 2025 13:51:37 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L882fb65b4a27.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 27 Jan 2025 13:51:37 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM0PR08MB5299.eurprd08.prod.outlook.com (2603:10a6:208:18d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 13:51:34 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 13:51:34 +0000
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
X-Inumbo-ID: dbe7252f-dcb5-11ef-a0e6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nPFWPmGyq8HXOqDqr13xvYWCPwoHXiUqWTkmJX0ZVO2a2wzURBik6M8+s8bGtYxRUOJEODiyEjBEyqu6M/0thvjK5PapknOkQgLPYYyBi238dqdKTrkojw75Jy1Q0L0FFmjcNW+BecrUCMFlN9hvQOrZDrdvlDov7F7Biawk7j4XFW6+9MnSiAYB83eU6C+ZmzbeZS8K3u5yTCLdYPxEhTR9p2W8O+tmLb7faRGoYZxm0R6SnRHPY+P2wnPTlyFHYZJODDB5gVgvk1LiJXjjnH6CSJcsFgdU7F+6aX3go66vtvgSEdD3ovyhP3vx1IsOheFBT2EJiF01ymsqTn2jrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0UngerHxIiVcYKEVBGoiv30EvIV7W3EgfyQ0zkoTZY=;
 b=McxXq6Xcg732FHY17gDH0eyKhjPznI+Nef6YPRzUhGAvQ+JVvJGmBAFxCl/pyloPQ/o8Lppr9TpjR6smGkOJ5NCk3+g5d1zSnR1Y2Ur8DS1dV73h+V7KFqgvyzRIEZkKKe7nGm32GVycFMktUYGIzr0X1XzvlyxTVODS4d+ETQdCQ4DHQC3MiGS+lgoft8zV3qx4wbx3wZQAx6dfHYZfatxvvkB4Yh/I9JYPjUWOTbx5KKl8ZuDVzJTBHMPrVpKZuOkrdknss7B7qrXdQeP9yunBdXXJwhw4pnAbabHDuNyril6R/q+nMaPTe+vViGaSlpnBS/DuO6a7MiCt9JPIIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0UngerHxIiVcYKEVBGoiv30EvIV7W3EgfyQ0zkoTZY=;
 b=IE83fCnild9CWuHJ4uTeyhv2K03BRbs9krNcgTh4KThI1fRKsf6qGe9t98CbXX/h1mOJHIiF1IKG0PwnoJgzVJ4L3ymN5y/aMF9w1T36Jjg00oeEIxdkZAMObU5y9AXNmpugo9Mpa7WheC3LXC0Q+ou1dASXT3UYA7kfauCzivc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef338ff48d46c1a6
X-TessianGatewayMetadata: kenzaENbonGJSaR91deSg6slZv1wsqijL7KvRFxWCqrP4l9AS4Bt2n9mGDZjxXLiYx3l8uJzmU1QUlYCBJAJuI4zlwn2+vxbs1nj4o+1lzamGxlTJqfA+pZOvh+ftO1sZA3cPhhICl0M5IIYyWdR2vIIxVWY48v4/U7cF1IaViI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FTENZ8D3VQOkXoOQfVHy3lgHP4hglD+bHbXZVhTrTjhdr0w3Gw1TsYvsuLUv6oBfjFwtfW3MfJPiNv9Ic59nqJOjDEyoUD1zokgihD0R2NEwxOqppZLbtA55FjGuf/G8yA4ufgwyeMXjIGYbbXb7FXjHougB9CodqTrsUUuS9+7ljNbZDajRq7uvSsjVdvnkZSWXe1+3UW5/h7Sj7zY3iavXenVrgFK4CW6V0rlGPydXtzf1JaCnNwETHFF+YeQhWD9ASIPQAb+y4RCTv2HCugd3+fs/Z30Rif+o5M3kdzJ0LRuuJ45fH7mHJFghRNEACvxNFi/3I/hxTYsn073uKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0UngerHxIiVcYKEVBGoiv30EvIV7W3EgfyQ0zkoTZY=;
 b=bh2h5VTQrR/DtY4ooqgx4mFC6dCUgO4o52ZNWTSmZAKaEyCbbEMnRmsrpPZvCD+mFnyJWVGQ5UMGWSDHvdqaqo1IVDR19cNoMexUKUZNmCXiwiC1XsygVRPED+buxBvt6Z0K9LlKG6zQhXuj4HPJhFcpX6dh0bW7I3bKfPR4RlUEJ+ZACmwqdKuUpFcI0yLh3acJq6rY+NI0fnKt4pM/ff314qr97xOAw3LwXxxLzyZyyeo0EaYi+Ts1QUflAxFjyKRofNp8JuGc++8V7GNeMk++Bhu/UMnwKoOHxRRvx9swP6QMrWrS04qttqJpazcKh9+yOiFMqrPPIHRDldojog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0UngerHxIiVcYKEVBGoiv30EvIV7W3EgfyQ0zkoTZY=;
 b=IE83fCnild9CWuHJ4uTeyhv2K03BRbs9krNcgTh4KThI1fRKsf6qGe9t98CbXX/h1mOJHIiF1IKG0PwnoJgzVJ4L3ymN5y/aMF9w1T36Jjg00oeEIxdkZAMObU5y9AXNmpugo9Mpa7WheC3LXC0Q+ou1dASXT3UYA7kfauCzivc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "oleksii.kurochko@gmail.com"
	<oleksii.kurochko@gmail.com>
Subject: Re: [for-4.20][PATCH 2/2] xen/arm: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
Thread-Topic: [for-4.20][PATCH 2/2] xen/arm: Fix build issue when
 CONFIG_PHYS_ADDR_T_32=y
Thread-Index: AQHbcKi5BZvZjkd9yUSyaUeahkEn8LMqo7IA
Date: Mon, 27 Jan 2025 13:51:34 +0000
Message-ID: <E2EF4E08-8D6D-4F43-99D1-BDAE3FB76CF4@arm.com>
References: <20250127104556.175641-1-michal.orzel@amd.com>
 <20250127104556.175641-3-michal.orzel@amd.com>
In-Reply-To: <20250127104556.175641-3-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM0PR08MB5299:EE_|DB1PEPF000509F0:EE_|PAVPR08MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd62256-320a-4c67-6b82-08dd3ed9be68
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZEZrNGxUS3lhL0drbTJHSVYwbGVFSXNDTjB1T2tKdndGYVYxNXhyMHZJUFY4?=
 =?utf-8?B?bW9ZT1FyeFRMUjhkWXlMMlNNQVdSNlE5QW5WUUtneC9ZZDA2Y3J6Yk4rR2lS?=
 =?utf-8?B?b1AxRGFKaFZqWUZlMWNjTTRBZVE3VDBXV3R5RmNhazQvQjVoNTRtMS9Rc1pC?=
 =?utf-8?B?MHJlQ3lQSlFwbGlEdXF0eUZEVjhKYU56anNabC9UbDA0OUV6ZkJFa3RYcitz?=
 =?utf-8?B?bVlCTUhyb09FblBBVUw1eS9qODJLVDM4bFpzenRRY1ZtVDVPcTZPSXFudTdW?=
 =?utf-8?B?WWhrUnkraFRlcjdMYkVjc3Z5aXc2OWRJU09XRlJDaG1MMFErcE14RDA5QkxT?=
 =?utf-8?B?MTFpUTJsQmhITXpVZThPWEtTNWNCbU8vTTVhamJrUkxjUi9iM2VXUE52dkc1?=
 =?utf-8?B?cWExVTg4MnVJbEtvVWhHNlpKTU5PdCtqbWQ5dXZuU3Q4cGF5VlpGY2FqdmVK?=
 =?utf-8?B?S0hXZDIxeW5KeUlDS05TdHZ5R2ljOWxRMWYzd3owTG5nNWVVMHdmNU5xYTdV?=
 =?utf-8?B?VlhGUnM4dHp6aWZERkFIUmJmVjVFWkFSUmJGVGZIRUxzUGdMcW01WmErQ3Q2?=
 =?utf-8?B?Mi9Mdm91VUZEa2loVnR3OUJ2d1REeWFBc1lnWEtSV3JYVGF3UUhKc2lpUFE5?=
 =?utf-8?B?c3o4NWFYSDQrYkJ4eWRDaFJ0WVV6dmZ5RGh0Vkp2c1pabEhSZUxlb1FkN0VY?=
 =?utf-8?B?bVI0SWprVkVvcjk5NVJuczhOZGJwRHlEY3NvZzYreUM1TjNXSTV4bjVGRldn?=
 =?utf-8?B?S3JMdm0yTWpCWVMvMjRXaDZlenR6QnBWdXN5aVVocnVmVHdSM2I2MTdEOXRJ?=
 =?utf-8?B?OUd2dnRvb0xSNEtzMmdvdWRWZXppWDcvMHpPMU1GYi9BS0VIWFl1cmgxdFEx?=
 =?utf-8?B?eFpIcWFXQjNNWjYza2tlZXJYMXZKbFozaVNZWVloc3V4bm5iYUhGcC9SOU92?=
 =?utf-8?B?bC9GdW8rd2h0U3FxR0l5SmtvNXphbEN2REJxT2diM25NbnlnTlhLYnVPZGtS?=
 =?utf-8?B?dmFWY05JN0gzUzgweGpNcExrU1p4OTQwMDIvbnpxQTFmMzNzekMyTzdpUC82?=
 =?utf-8?B?ZDBqVVlTSnBmVUVucnM2c1prZjJRVUpRUCtESDFDQ1Fuci8vSUlLanc0TTZt?=
 =?utf-8?B?TjA3S0ppRmcxYWtHd2dwdnNwN3dWZEY4UXNiR0xtaVovRDh6OUlQc3pSRWhz?=
 =?utf-8?B?bEpNNXlDNnVMSTFYUlVrMlhUM2FnUVRETzlQWEt6MnRhQnBoR2hUWE9LTG9s?=
 =?utf-8?B?NkpCQkhwWkdZTmxzeDJGMEQ1YUt3WE1pWWpoWVpmUk1URWs5Ni9aSXB5R2ky?=
 =?utf-8?B?bkl2OGVEdDVuOFVjYXJHNFlWdmxKZS96dzZzWkd2OHVhMVNEOFJvbkovOHNt?=
 =?utf-8?B?REJOUFdaSld6Mkw5NTMrWDBEUEdpekxTYnc2cFRZT3VweWZYL2t5NDQ3Sktj?=
 =?utf-8?B?NExmbHNZc1FHWG5TSkhNdXJoUi9jMTUyZkN0NkQ3MEtzNHF1SStwVFlnRkdL?=
 =?utf-8?B?cXVoS1k1Y0xTREpzT0RpeEFpQkVWaTdXWTQ5U3VjSm5CdzdsTEJwTmRXc0Y1?=
 =?utf-8?B?OEh6M3ZYVkpRZlZ6bVZqeDU4a1dWamdjNGhsMTBTcjZPWlBFYWtGdmNJV3pw?=
 =?utf-8?B?UUhGUjVSRSt2ekx1Y3RFdDBQS2ZGdDdjRVRkOGxwZ1NIZWZkS20vZjJXK2cx?=
 =?utf-8?B?Q081U21uVFVuK044VWFMczRWQkxsRUhlTGdHL3BZVUJRL09CV1ZmdUg5eFNL?=
 =?utf-8?B?QlNiNE90a0RyU0lxZEFPbzE3SFI0cFdRbVYzM2lEKzJlYVU5VzVoU2RrbzRU?=
 =?utf-8?B?Nm94RHJmU3NTaHFqd1c5bGRWNmkwZDZHOFVSVTJPWXBxN200NVhrOXpGcXhz?=
 =?utf-8?B?RDd3ZlFXYWJjQzFadVNzditIK2dmcWpxbFU4Q1dMWTdsVEhhNDNEeCs1UnF2?=
 =?utf-8?Q?sYvHp7jJ24m27DJ+DUkO+tM0kOeO6+wX?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE8EA91EB689F545A7BE70A2DB3030E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5299
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	906bf5c9-9495-4720-8201-08dd3ed9b692
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|14060799003|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXAwSlFSNXRoNk0yM05tNCtiUDdDazBjOGVkTytaZ2hvTmR0V0RvbXlXVi9W?=
 =?utf-8?B?Qksxamh0UkRvQ09SQzFkNDM4cUJvTTJ0VlBMU3BpUkgrMEF2TnArdmNROWNB?=
 =?utf-8?B?WWxTM2xyK2dKMFJic1NJMndUTk1xanN0WE5hTld3QTg4TTd4RElzdFUvMHFH?=
 =?utf-8?B?dkVITU9DWG9zRWVnTG1GRXNWcHl1ZytwYTR4QzlPaGpETjh1U0RUN3d2RDFi?=
 =?utf-8?B?akFKTmxTRnU3ZDFvQnNIaVhPLzdCTVU1NFZjblFrK2VmL1RBQWtGS1MrdVJp?=
 =?utf-8?B?dEhwa0FKMDRZZ3hKSWZzYWtIcGQxcnYrbEhqSUxoLzFZU2dlbkhsWGt3SG8w?=
 =?utf-8?B?c0RBYllwV0draGl2WXZXd2VBV244VEF6c3B2cnhBYWVuSlBmai9vS0d5UHVj?=
 =?utf-8?B?b0ZEWWlPMSs5UTFoNEs5d1lLeXNXaWd1RnE2U3N4a3lVaUgzVjhuQUhJMEEr?=
 =?utf-8?B?V2NzWFdoeHUxTi9rUDlHWWVKR2JhM3pQOWgzUGVqSnVXOW9FL3YzRXM2RnhO?=
 =?utf-8?B?TUlRcDRFSWk5bjVDVGpNRFkyMXJPQzE3TXBRVU5ucUMrY2tGbFM5UUl4aE42?=
 =?utf-8?B?Wkc2MGtTTlNWV0NFNUM4ODZEQlBJTjl3YWlsc3NWL0R4S0lpU3RNa2JHR3ZP?=
 =?utf-8?B?Rmkrb0VQekVyNG1UWWlINUwxRERveG5ZM1g4V01odzZTVUplTjl5b0VwZGVT?=
 =?utf-8?B?NXJzWi9VVkV2R25HZUMyUllxR2MxanhXcm1DcGh3RjVrc3QyNXlMQ3h4N1Z2?=
 =?utf-8?B?RW1ORHBIL0ppMzhBblJYRmplQ1ZMb3ZjMnNHc3plM2RuTWJsQ2dYcjlaTDFI?=
 =?utf-8?B?NnFUS0xEdWVPelJrakdGc1pOTjlCajJwak5xcW5zSXplZkR3OEU1TnVpTmNS?=
 =?utf-8?B?WnFtTS9FZmI5N1hXZ2NncG5UUXVLUnh5bzJySzlEWDM2aloyeW9IdUFhc0dw?=
 =?utf-8?B?ak1lYXg1ZFJDcm13azBWdmh6MmVEdjhySnBsMXJGUG96MkRZNU9aaHliTlNV?=
 =?utf-8?B?RzhxZG5mZkhCeXo0WXhoc0pCcm4ydzBOeGJISFhRdVRXR2ZPYkM5bUJlNWx4?=
 =?utf-8?B?QWlxbHpUSDMrVzJqbDhoN2VXUnhuTVkvMWVQbW1BY2p1WEdRUnE0bHpKT1N1?=
 =?utf-8?B?czZGMXc5UVFnMUhxQWFKVExOK0YwRUszSktpQUlpSEVvSGh3Sjk3K0ZpU2ZH?=
 =?utf-8?B?QWFEdXJvZS8vaEYvak15N0NVMDlKZmExVUYrZFFqZFpNOGkvMHBWWmYrMkR4?=
 =?utf-8?B?SWx6VzM5amlnYytGR2J5UzlYOHZKcDMyVmRUcWR4aEhOMVN2U0QwWHl5cTlH?=
 =?utf-8?B?aUdxazFxM2dmUDdhV2k5bWN2LzkxK0dMQm94MHFtVklkRURNRHFPS2xFM2V3?=
 =?utf-8?B?cm9XMEFHaWtEaktFYWI5dlFMZENMNVVzdXpxanlDdDcxcEQxbEcwaFNRMVVQ?=
 =?utf-8?B?SjdUNys2Mis2RS84ZkZhTFl1dCtkNGE2NnhPL2puYklpK1M3QjVkblllenRQ?=
 =?utf-8?B?c1lKMEF2QWVOMmV3NGVLLzBuTjBpSjNsMVhLYVN4cXhwaFRYdHo0TkhYWTZE?=
 =?utf-8?B?LzlCMW1oa25TVW1USFJidTRPSlRISW5XeWpPcVBwczQ0ZEw4MXZxQXdvRy9X?=
 =?utf-8?B?bzhPOWRHeXpYcHNVclV0UmNHdWF4Ym52UVBKakx0QXpkYmhiaytNZ25zb3BI?=
 =?utf-8?B?SmJiZkRJTU5xakhycWVrRlFpc2FsWlRwZVFYTGg5c3ArQVovOFViZlVieUhJ?=
 =?utf-8?B?YjFDcWxOd2RiYllWTC9abGFyMWJiVFZzRkZXd1BBQk1BWjQ1NWtUU1lXamRr?=
 =?utf-8?B?SDZBbkFqU1JpaU1YclIvbGpZK2tUL2FDRVNXajU1L2EwMEZHdzVGTm5tZDJq?=
 =?utf-8?B?MlB1WVNFOWZ6YktKcGNpVERPbFZlMkY3dkdtNDhzR0owbWQvNGtpajU0b1E4?=
 =?utf-8?B?enlseVgxT1JDNkhYNnhCeWg2Qm44ZURhaDR2ckxGVDE1QWxxMUZBOERTbjJ4?=
 =?utf-8?Q?jd8VuLPFBeUZP0fdCzH/Bqld1bZ39Q=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(14060799003)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 13:51:47.9818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd62256-320a-4c67-6b82-08dd3ed9be68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8967

SGkgTWljaGFsLA0KDQo+IE9uIDI3IEphbiAyMDI1LCBhdCAxMDo0NSwgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBBcm0zMiwgd2hlbiBDT05GSUdf
UEhZU19BRERSX1RfMzIgaXMgc2V0LCBhIGJ1aWxkIGZhaWx1cmUgaXMgb2JzZXJ2ZWQ6DQo+IGFy
Y2gvYXJtL3BsYXRmb3Jtcy92ZXhwcmVzcy5jOiBJbiBmdW5jdGlvbiAndmV4cHJlc3Nfc21wX2lu
aXQnOg0KPiBhcmNoL2FybS9wbGF0Zm9ybXMvdmV4cHJlc3MuYzoxMDI6MTI6IGVycm9yOiBmb3Jt
YXQgJyVseCcgZXhwZWN0cyBhcmd1bWVudCBvZiB0eXBlICdsb25nIHVuc2lnbmVkIGludCcsIGJ1
dCBhcmd1bWVudCAyIGhhcyB0eXBlICdsb25nIGxvbmcgdW5zaWduZWQgaW50JyBbLVdlcnJvcj1m
b3JtYXQ9XQ0KPiAgMTAyIHwgICAgIHByaW50aygiU2V0IFNZU19GTEFHUyB0byAlIlBSSXBhZGRy
IiAoJXApXG4iLA0KPiANCj4gV2hlbiBDT05GSUdfUEhZU19BRERSX1RfMzIgaXMgc2V0LCBwYWRk
cl90IGlzIGRlZmluZWQgYXMgdW5zaWduZWQgbG9uZy4NCj4gQ29tbWl0IDk2ZjM1ZGU2OWU1OSBk
cm9wcGVkIF9fdmlydF90b19tYWRkcigpIHdoaWNoIHVzZWQgcGFkZHJfdCBhcyBhDQo+IHJldHVy
biB0eXBlLiBXaXRob3V0IGEgY2FzdCwgdGhlIGV4cHJlc3Npb24gdHlwZSBpcyB1bnNpZ25lZCBs
b25nIGxvbmcNCj4gd2hpY2ggY2F1c2VzIHRoZSBpc3N1ZS4gRml4IGl0Lg0KPiANCj4gRml4ZXM6
IDk2ZjM1ZGU2OWU1OSAoIng4NitBcm06IGRyb3AgKHJlbmFtZSkgX192aXJ0X3RvX21hZGRyKCkg
LyBfX21hZGRyX3RvX3ZpcnQoKSIpDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBPcnplbCA8bWlj
aGFsLm9yemVsQGFtZC5jb20+DQo+IC0tLQ0KDQpJ4oCZdmUgdGVzdGVkIHRoaXMgb25lIGFuZCBp
dCBmaXggdGhlIGNvbXBpbGF0aW9uIGlzc3VlIG9uIHRoZSBhYm92ZSBzZXR1cCwgSeKAmXZlIGFs
c28gdGVzdGVkDQp0aGF0IGl0IGRvZXNu4oCZdCBpbnRyb2R1Y2UgaXNzdWVzIG9uIG90aGVyIHNl
dHVwIChlLmcuIGFybTY0KQ0KDQpSZXZpZXdlZC1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5j
ZWxsdUBhcm0uY29tPg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFy
bS5jb20+DQoNCg==

