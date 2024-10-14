Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 814C399D70D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 21:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818860.1232150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0QTT-0002ED-Qv; Mon, 14 Oct 2024 19:11:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818860.1232150; Mon, 14 Oct 2024 19:11:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0QTT-0002C5-OI; Mon, 14 Oct 2024 19:11:23 +0000
Received: by outflank-mailman (input) for mailman id 818860;
 Mon, 14 Oct 2024 19:11:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7KN=RK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t0QTS-0002Bz-Ro
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 19:11:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2612::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 189de7b7-8a60-11ef-a0be-8be0dac302b0;
 Mon, 14 Oct 2024 21:11:21 +0200 (CEST)
Received: from AM5PR0301CA0006.eurprd03.prod.outlook.com
 (2603:10a6:206:14::19) by DB3PR08MB8796.eurprd08.prod.outlook.com
 (2603:10a6:10:433::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 14 Oct
 2024 19:11:16 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:206:14:cafe::2) by AM5PR0301CA0006.outlook.office365.com
 (2603:10a6:206:14::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Mon, 14 Oct 2024 19:11:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Mon, 14 Oct 2024 19:11:15 +0000
Received: ("Tessian outbound cd6aa7fa963a:v473");
 Mon, 14 Oct 2024 19:11:15 +0000
Received: from L89532d193e08.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B8EB5F18-E6DD-4269-AE6F-17F76FE0BBB0.1; 
 Mon, 14 Oct 2024 19:11:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L89532d193e08.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2024 19:11:08 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAVPR08MB9747.eurprd08.prod.outlook.com (2603:10a6:102:31e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 19:11:06 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 19:11:06 +0000
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
X-Inumbo-ID: 189de7b7-8a60-11ef-a0be-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sqqtUn06FTla6hBJmSokkPJWKMxMrBcMWDF96Z0OTu0YbyMTqDOL/N0P0Jvo1+x/JsA+8SfqvHCC9e8i9TNq9oifh17BGqmEvAnMU0E0072LYBrFCxpcmkXJV3DIFbTsDweQFascfFprbr6nHj/GoIwsFccMsL+2W9WuAHxZdMkA61hbBwR25dJZ9A2yvNsnzPRmkSSCHQk7CbA03sC7xdnsVvYaSpCeQvXBa9h68NadfH2CB18J8wGVrqSneRaY7JgMmxrq2LNEROReaoMvUpBotBILaqrZDYivTK+BjUVLTizBbwGO1WeTFt0klfiuQ7AYI6Jv39TdTucjTIFC9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE7k2SmLLhqYbNviwomGEU/K/QmSH8pn9ExHoSq5SUY=;
 b=SClCzA8Xc7awVhW6NT3zPZKug+NAISCXyMFP95OE/fOS3JeTD2Bj0cwiODTUfynZki3npBuOYX2jU226JtlYSP47EGTpwPcugYB9dAXCG1KM05chxZGIWktgkhhUv7XoDTdT/+xxofUXW2pyrsmJdkYsA8h5npbNLOjDhuaE6A6AKHZVpkF/DqJEF++dBCFp5dEoMs/ONOd2komkrHHE9TSeYi+igJPGa9tsw872GzGKUGqeZB/iXX+Tz+b6h0n0SMlAb/vBPnSXm7oGwKDW8AbGsfwNUfXFEqnl8RkEu6t7TniO4ropQ6PglBB9eLLMle8WubR23fsU/cDvBGpDJQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE7k2SmLLhqYbNviwomGEU/K/QmSH8pn9ExHoSq5SUY=;
 b=c1Qi0SMF/gUfd798wkHWhRQJNYUouScNEGCgPCsRKIMWAMhMXmHNaJGxpG5Q1BsknUfxqpaf07EVd/ne/RLLaR7B6D4U5DKzBlC668c8VPuLWfehg3ITYrK6+GAseyis4rE6hjMeyy0IZP80VbG3sHlLJOdX67QYvMhkVfEiuJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fda2988afb4874d5
X-TessianGatewayMetadata: GU/IhCrPs8BRLIEWdFhKYbrYwDWKhPhX+JRvnG69tMECiPQZofTOXfHm8ZsczhFXKZaHkb96BAIPqdcYdFkUDRV2rFloohFtEwYNJ1MtcCTluPy0H76T2xQXqFRkVicXSrr9p08ScFnWnIoJq5QMKQ977ZHzHEcqAxLwt+mMx+U=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srB3TUS5JcCsOa7UjwLNXuN+n+WQ5ngOfm10/Yq+ipUYppxupI95s9MgWsbJ/wsniWM0nIRCjK/3Glpf3cbvR2YazNNR/M2rRA4+VRxSPlqtM4RxT+KLbHlxAo4HIqAdGS0+3IH9L0xSsd9WX6JtoopOReYrsEmCowkt/s5A5FMZkSOGb/W1S5Wza1wgejTU6mWA++TQ/Q49GzV7AABysu4N7Phe/1Wkk9kjucxTu1iyYuqHUFKRy4eP6LFuaYE1tnzydy4o0PzUCAzLKqODf01Fhep4E6UjHxZvypLRwLJAcawINXFLE6+RijgQcT2TcS6nTdZBW55NY4VIU9GAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE7k2SmLLhqYbNviwomGEU/K/QmSH8pn9ExHoSq5SUY=;
 b=mPxzL/LG/MtSplUG9CTxpY56mvrBCVOYQeq3zYjof3cqX3mWHRk8W3hvR97vBqUd3hfALfFvI3brOHOhOAgu1YUgge/rEMBDE4rhENQ618p+7+TGkfbT7eJO30uowgUAWHqOu5sP8/E5ZZ3lENC0PliYPGzXpJyzC6tkqjRXDVjvoM0KbWWlbdOioF1TJ49ESL+iHDUg41ytMysBQQsdPloK+RF2IKFEk+Qqo2zj2vetrOcOJpVXS1HFhyR7Nq7GaCV2QUksh4my+s9HGvFwk1qi4gCfKov5n3nQd8aAjPj5sVPLtyHThEdvEqdlgnXpvtw6MWYqkv5yKv+Fjr855w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE7k2SmLLhqYbNviwomGEU/K/QmSH8pn9ExHoSq5SUY=;
 b=c1Qi0SMF/gUfd798wkHWhRQJNYUouScNEGCgPCsRKIMWAMhMXmHNaJGxpG5Q1BsknUfxqpaf07EVd/ne/RLLaR7B6D4U5DKzBlC668c8VPuLWfehg3ITYrK6+GAseyis4rE6hjMeyy0IZP80VbG3sHlLJOdX67QYvMhkVfEiuJI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Topic: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Index: AQHbGx2Ge9N55hTx/U2iD9lYiTVQprKGo1uA
Date: Mon, 14 Oct 2024 19:11:06 +0000
Message-ID: <6B1407DF-6FCD-4823-959A-F516CAEAA309@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
In-Reply-To: <20241010140351.309922-6-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAVPR08MB9747:EE_|AM2PEPF0001C70E:EE_|DB3PR08MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: 0161363c-c3de-413d-76f1-08dcec83f9c6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?PYW+2H65xbBW39VbhnN/HwR1U/mJNOz+EFwd1UWMWRfw+UVJwxCgdrzsO9Kh?=
 =?us-ascii?Q?O2ocEZiEcyZWGEOKSjSCYHFV3HwJJjssQkZ/+aoBsXwI7drbLnPIfkpRkxnI?=
 =?us-ascii?Q?VDkQvxzlsR2zDE1u2TGHUqTXr7uLEOs5XTcKC7rwhT9RLfOMH4rhEJyHhBis?=
 =?us-ascii?Q?jdGGMFR09SXCvwdbau0gq5PZWAaj7sGhIYqvKOkX3C/EXCRgxzYRFR71QeFp?=
 =?us-ascii?Q?F0jL6n43BhVnpyWZS0bm3877a7kxHnXWY+iumzzdeAW46zLWnJThM6/A3bvz?=
 =?us-ascii?Q?QAV86pQyqeIEvwEBvqWsZ84KRTJrvLa0YBW/5zHbWBvu18Q8dRqrkliu2KII?=
 =?us-ascii?Q?mk7YXj31Nn5ulg3JQXZCCO9DNT/s/+obo3yCRPWUL2l/e04RzVo8VYMoKAYm?=
 =?us-ascii?Q?7L53+OBYwL/vC7BpB5jSK2ZTrlE34rOwNfGxhKkmOx9bLhd+jSaQfYfa966T?=
 =?us-ascii?Q?1Na8rkyIWcYmc5xLR35L3LldLHbbzaLLqk56QHsfZbvViFisM87/qQuebiOx?=
 =?us-ascii?Q?SYgZaRTrW7rMH8LLkcz5zGMFLXdQWEKd+QnQEZwOPhbe98j2auLGImH0ggxu?=
 =?us-ascii?Q?HMGbSuaKStAekkeVzBkKVrI3B2TV9Ev9LzRIiUOi4+TIadpvXOiuVP4/mtOO?=
 =?us-ascii?Q?w9TYP7tpkzrJBbp6uD230ATGlejX3XYhi/yZqfqVLJvkiLeMYUxqfo5ESZVv?=
 =?us-ascii?Q?SpLBhAnNjfNIk5umF+QlI4MK7H2AjFH6vSrwLzP7JIgI88+Yhstycu/LnqXH?=
 =?us-ascii?Q?7oc0lRXdchNDVufQ4cSGG9466aaOZSsAWtzgPIjEp2etiW85tN5ebiT16D0S?=
 =?us-ascii?Q?ZwgvgIFj5IglWpRzpv+PcADmpFMt9L4i8SelAYu6I/BuDlJbu4/vpiEB2ssb?=
 =?us-ascii?Q?NElX9wfnzA+tW7U5B+UckWMDEnqQFMq8/BQwNmXZe9xeP0WZPLjRgVGd4Fw/?=
 =?us-ascii?Q?ANyxm4rFsg2QkbrmJiecgZh4NC/fsDfUlrtcyemg5ShzFkcgwY3zVVuNfJbN?=
 =?us-ascii?Q?HPMQ9iXrSc4M9nf6SUWe1Yt3dhDVgMX5HZDWdNYfuw7fcuIuPrWNOSriDUYb?=
 =?us-ascii?Q?QKztGfdJqHCTqjgEtJgFeqVC/R3kHf9eiHAqPAkBME4SnGEobwFqz5lN/lYy?=
 =?us-ascii?Q?SY+hgUoLA15gC7/X9qF8JdyQj/P8B7n0H/dD0ezWs2IfQ3pp9bq8NvsmjEFw?=
 =?us-ascii?Q?Ht2YZZjHgVykBXUCgqjAwN71vZW/bPp+DfHYpDYFPq6gDZATjYy8OZ3MaMBE?=
 =?us-ascii?Q?2vStqcMGe9AA6UzC5zhbT9SQw/rHkafVCt3xN2gA0KEUYM3gJomaK0qDrrly?=
 =?us-ascii?Q?8Enkmh1ivQsa0QyqKsLAOSFK2VBhafgI20z+3lwncYwO5A=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8ACFF1F1625CF141B5DC18FA2CE749D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9747
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4c239ca2-d3a7-4bb1-bdc0-08dcec83f44d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6GRRKljx8hJUQcsaDZe6ew/yfqUW09nMQNCjQcrhuG8b+y0xK8n5nCgBLb/N?=
 =?us-ascii?Q?8P9qZ3SrZslQOKn+TQt95C9Rfqez1f9fSk0rBBIzlqLYe/I16NBYtWkyoUDL?=
 =?us-ascii?Q?Txf1qBXt5XMxIPiENDg9ssCZYf6I1XSrEI249QdMHkbDxd8efKiBF/KfIHvv?=
 =?us-ascii?Q?lxKvGE07dqc/iNr2aIHiVXj5hAVNOX2SNiJv63cq8D8nWC0bJLinlv4hWfEQ?=
 =?us-ascii?Q?Ou+Z7GgFFui1P/0IR6py7WKojhYgCJeoX7ZxUyPQcmRaU/FY4tvfi+ayfMFK?=
 =?us-ascii?Q?gNnHSiXuEv6kc1Rf6II+NLMJQEMBT3iATlNYxOoPbNek0NB1n6rt5AtKEIkN?=
 =?us-ascii?Q?w0/4WvcwbeHiK14h6wFSFVOM3kNdkasNmcYjd+pakE5ZhcezQs4AqHy3T2QR?=
 =?us-ascii?Q?4S4kFX9mOFspgKGwlLj6sAuYHjEKhOY2xC80s95K+rInH9RXwLAOJDU+JzNJ?=
 =?us-ascii?Q?1CgIkXjKZp8py2a4KhvAWWyaR0JCMvh/h8jzVj1WfvZwx99eMl1zz/m6RPiD?=
 =?us-ascii?Q?d1xvjy/vg75YzzaEtdxlwoRszokSaJ5KxCkK35NjgfFQa2w+ICoKY/R7HyRy?=
 =?us-ascii?Q?ZEKQgMGsRw2rdmvzc4hGzsY9jLUVW9yLZ6jlYX/EvLZAIOgI0wruwb4E4/cl?=
 =?us-ascii?Q?/Po/g8k+mrUJij3qRapuF8wEMg/rQ1JLfuSqy+kaavISrQUyzXorxU7yOPBb?=
 =?us-ascii?Q?VwcFFTWqGiG3I/un1uiZyUDhS3opuMonp0K3385HEwFaIVPakBVRy9nQx6yP?=
 =?us-ascii?Q?MEGWLdgO5U9Q8lcrroY0DhAJtFWGxZnbU2LtIIK5Wt0KHRJnKo3MbplSPcNh?=
 =?us-ascii?Q?1sCq9Q9z7Jlf5E7O0BXx5yFY1BAywa6LAI5GcEOLo9+/guySA1r7q6FTb5ol?=
 =?us-ascii?Q?HLtcGJj63rwow36J8PB4P/UV/PtO7lMeY2XNF8LIK9Xq+9DjcYQOuIIZKYYD?=
 =?us-ascii?Q?cAKcCrI7eBdbnm4ZumsX9KyolMEI3TmxoDXrfs2+wFLpumQaqWZ05YvpnMDi?=
 =?us-ascii?Q?LPVDDfo8hYlrxs6IxZfpvyOU5fEa55EuCVqjN6Z+Tfzs/a52oP4jUmMItZ5n?=
 =?us-ascii?Q?YFM4sYINAgDhnvioLnpCdJC5gUFdkZrSF+RpKkX2mrc4684U4TXB/XLemJJR?=
 =?us-ascii?Q?y6jXMWsYmw7Zz5EoMTV8lP8BdbUF/Yvn9WmzVdup/z55lmIn0VZnARVxOu5w?=
 =?us-ascii?Q?DqFLuYStxA1Y0XkDahgWNsmFNmQJj2xWEAHsSyZGAZQGYLPp9SlOh+46HOZT?=
 =?us-ascii?Q?Hb2bqksEM+COrXVT8q9HmkVD9hoWyF7I5ZYBmxEVNslJWikDNwn9+fbXVYNw?=
 =?us-ascii?Q?0ptHP6B5VAy8M7QSZsPwmkLjTiMev7O9RMCvq/pgLfuc3z0ccPEOv2OtoIA6?=
 =?us-ascii?Q?qzkQXlJiOzxPa6rip1T8kKT8AzDk?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 19:11:15.4703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0161363c-c3de-413d-76f1-08dcec83f9c6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8796

Hi Ayan,

> /*
>  * Maps the various sections of Xen (described in xen.lds.S) as different=
 MPU
>  * regions.
> @@ -68,10 +92,11 @@
>  * Inputs:
>  *   lr : Address to return to.
>  *
> - * Clobbers x0 - x5
> + * Clobbers x0 - x6
>  *
>  */
> FUNC(enable_boot_cpu_mm)
> +    mov   x6, lr
>=20
>     /* Check if the number of regions exceeded the count specified in MPU=
IR_EL2 */
>     mrs   x5, MPUIR_EL2
> @@ -113,7 +138,7 @@ FUNC(enable_boot_cpu_mm)
>     beq 5f
>     prepare_xen_region x0, x1, x2, x3, x4, x5
>=20
> -5:
> +5:  mov   lr, x6

Shall these changes to enable_boot_cpu_mm be part of the previous commit?

The rest looks good to me:
Reviewed-by: Luca Fancellu <luca.fancelllu@arm.com>


