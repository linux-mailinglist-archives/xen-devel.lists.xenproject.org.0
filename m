Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B29879C42B4
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 17:35:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834016.1249373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAXMv-00013V-Pn; Mon, 11 Nov 2024 16:34:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834016.1249373; Mon, 11 Nov 2024 16:34:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAXMv-00010n-Mj; Mon, 11 Nov 2024 16:34:25 +0000
Received: by outflank-mailman (input) for mailman id 834016;
 Mon, 11 Nov 2024 16:34:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNBq=SG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tAXMt-00010h-Ha
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 16:34:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2613::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d769f4-a04a-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 17:34:13 +0100 (CET)
Received: from AS9PR05CA0359.eurprd05.prod.outlook.com (2603:10a6:20b:490::20)
 by VI1PR08MB5535.eurprd08.prod.outlook.com (2603:10a6:803:13e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 16:34:10 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::24) by AS9PR05CA0359.outlook.office365.com
 (2603:10a6:20b:490::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 16:34:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 11 Nov 2024 16:34:08 +0000
Received: ("Tessian outbound 313a6fceb026:v490");
 Mon, 11 Nov 2024 16:34:08 +0000
Received: from Lb513c8eafc49.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D65FF743-718E-4716-977D-4DA915DE71F6.1; 
 Mon, 11 Nov 2024 16:33:56 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb513c8eafc49.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Nov 2024 16:33:56 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB10100.eurprd08.prod.outlook.com (2603:10a6:20b:63e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 16:33:50 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 16:33:50 +0000
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
X-Inumbo-ID: c8d769f4-a04a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjJmIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImM4ZDc2OWY0LWEwNGEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzQyODUzLjQ1NzE1OSwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iuOUrPJ2Yjs0Hc29eWdn0bK17t639kkvUOlodX0hO7RKvQpr/6Q8FAu+K/z0V+2d1vPfbAVQvjDQ3Gp/g6+GUcdSmUUOyeYPAS2mrc5Ngf0cjF1oo4coZ1+epzA0t+u/VNNXaj9Uv9XXSlyNhfTxH054qwMISeVWq6S/nt3fXpX5ZKHwvC6G+wDpo3ONEmPhlVQZTZu4E6hffK4boY3PbdVBSexc03OMtQV/9ZN0mg7xYA/2QDfJil2oecgSpFazbxo1pRr3PMy2UqHcnv7DBBnNzfLcsqn4A8nQU8aiJbAK11+ntRd+dbCu4fBpzey6XumZd+49DucZIuUfDPExdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I06zpplD+QkIuycA5LXZ1gNN6tZ7rIvGTvzyF+xJq0U=;
 b=u7GEiU4qwfsVZu0cazFEA2kP/1cneWJ71+j8L+T3Xi0O2ulWq5pJvzMqhhcwM/3qf06Wlx3zijT/VzIr7JWEjGIjuLRd8YPT5PSd0WYXs5EPNb8wyA+vwrNbs/ky7pQcSkIWFx0jMxpJyVkaq6SwwyFi4LC/xJEwVxr/Ov61BSSx5aGEocBAMd6bHKFn7YD/frDWGiqTANtXN13Z4xl+usqo1w9w25oXxAHN20YLhIC2UkaNbFBLHbveDrAxPC/ondgzfBT+SdahjEl9LWOEOs3tLt1UHjh13+GkJ56RxMxZoYIrhGXulwzps+IB1xEtOf9oUIWCmNQXA5vHyjTQvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I06zpplD+QkIuycA5LXZ1gNN6tZ7rIvGTvzyF+xJq0U=;
 b=XvJ7+4UbYH4q+KSRLLow3gZwCvoN4LYXP780t3+POGVhwhMmBVzwDm6I3AkN30gcIpbIYug+bW+bN0ocounmNsf/FU60Igluz5yuYykS97WIghwg71drie/2UXm1dJomqc78s0c3H8ena+P8cbvrvwk5yBdq17lzZI80YoSUo/4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 121fd2f81aa449cb
X-TessianGatewayMetadata: Ty+R8AO79xEl/tmnvZivLGj862XvL6XcMfbYx+Hmgld7br2LX7AKmryMIZx3ozuXMsenyob5d/6SvD3/hf82pcd+1E5lbxu6rQW5pYfMDpXHLFckat+Y0WG6g+McVnE6pi+ccGywj31HH1cJNiWh0yysYDOMhmLYTEKyv7rlB2Q=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1xjHnEedT6HlxwDZM+e+WjundhHt87b7TE2RlnFWRfmuqsfTE+d6X14Qq6VSFC6VwyU84tabZask7LmxeCWmchHx1Cj8mwJxWlBtnMvnhN9+xHKQ3sNoP8m88sg9gJ23GYXfVFF1pzvLnzNmAsIH2gl4MgXANwije6KrQUWCqRoj16N9/i94U+ent1MpnteCcA+03pIO+P+LfLc+8ohknepC4Kchw570itnPjT93H2EPJe9G0488TDhC2Ksx8mEl/YOYMxDVKZws3Krl6kH8KtrJ/KL66Gc+b+K953NJ/MBhKLErDZ8fCDbH0oJQn5zB9D9ZOteuk5iERK+VUpsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I06zpplD+QkIuycA5LXZ1gNN6tZ7rIvGTvzyF+xJq0U=;
 b=pcN5rx1RK5P1K9+Be5mBkx4xFLOWx+f3ABJWfDq/mMZTM3iTefnXwqz1B+Ch1X9F7WCU7gd8Jyc4hcBSOsoMDlyTzNn1RghR52t4xSG7Ff9epxBgTmKUyANfjDbU6lOIhGMKe4nuJrMIEI/EeMJXunrAQCA0pdrXhI9129B7DC6tm9blajkjUtIxLAaZgi85VZLuUqBMYbJe5bZurhmYfIUGHVmwBG9PAw5SSx5m7pI8pPnVmMEXn//SPUi0dd+3CU+Mma2af4t/A1wD2vkh7Dq03owu00AJsLumHImTLoskb8B1lqaZxzF6EQ5djQOV3e1VMriurCpfttWJgTQilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I06zpplD+QkIuycA5LXZ1gNN6tZ7rIvGTvzyF+xJq0U=;
 b=XvJ7+4UbYH4q+KSRLLow3gZwCvoN4LYXP780t3+POGVhwhMmBVzwDm6I3AkN30gcIpbIYug+bW+bN0ocounmNsf/FU60Igluz5yuYykS97WIghwg71drie/2UXm1dJomqc78s0c3H8ena+P8cbvrvwk5yBdq17lzZI80YoSUo/4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Julien Grall <julien@xen.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Thread-Topic: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Thread-Index: AQHbMhnBgSbSnEnP3kCeg3Nc76pTWrKx8P2AgAAk5QCAAAXeAIAAJc0AgAAJLIA=
Date: Mon, 11 Nov 2024 16:33:50 +0000
Message-ID: <9D3DF4D9-F88E-4419-A048-3B3EC534033B@arm.com>
References: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
 <80ac1e78-5259-43d2-8b18-d5bd3abdca1b@xen.org>
 <2ca98e9c-1a4b-43a2-b707-097dc5093e39@amd.com>
 <6dc2ebd8-d206-479b-ac3a-83ed59c7109f@xen.org>
 <86862f6e-caf3-4a5a-a650-b9bac74b83d3@amd.com>
In-Reply-To: <86862f6e-caf3-4a5a-a650-b9bac74b83d3@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB10100:EE_|AMS1EPF00000040:EE_|VI1PR08MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: 860177a2-2935-493b-3636-08dd026eaa58
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Tll6VWRKQ28xcjBZSHI4aVpiV09jTEgzNGxrK2wxQXpMcXF3cVh3WDZubzhD?=
 =?utf-8?B?bTdiSWJvb1ZzS3B2c1J3R3VpQWlnR256WFpjNjBudDFHSVU4K2swbk0yUzRC?=
 =?utf-8?B?WVQ5TEhPTExodWJBKzQrY2lLV09wdWhjNS9VR3R5MlRydzZxNWphZ1ZmMld0?=
 =?utf-8?B?cTFRTVZoQ0xIdEFTRmZ0NGVyYkhsNlkwaTIxRVZuaW9KazY5blhYYW1PQlZj?=
 =?utf-8?B?U2ZCTkZvVU5xM0dYeFFHSTVvTkFpb0ZtMDZ0VFFPanRSUm9oSm05N1FwMTQ2?=
 =?utf-8?B?aXlJN2pReDZ3dGtXSFowM0pJNGJ5LzQ2QkpOSUJSUUpMTCtqUXRyRWFObnE0?=
 =?utf-8?B?eWNPd3hkdE5kb3gvZnNxaVpKMUFMeW1TZ1ZZZVpRbjRQWlJ5STRjaVNhMHYw?=
 =?utf-8?B?T3JkZkVReko4WTdwekQ3bVBXMW5sQ3d2YmphajlDQ2tCd0JwWmJNNUdROVFJ?=
 =?utf-8?B?QVJLaVVURnVwUHVLTGdIMW5vaHlUd252Vjg3K2NVL0JudWd2OURMK3Z0RTdZ?=
 =?utf-8?B?SDBFUzR4dENkb3RZaEQ2Q0FvWkdmTUlPdXhqU3BHM21qN3Y1U05sSW0veU1w?=
 =?utf-8?B?S3A5OU4yUGx3MUticmlGaWp5UU9wSXhzdldqN0p2eUNOc2t3bHJLSGg3c09p?=
 =?utf-8?B?eXN0am1sU2JqR3VLTXpRbDl6NmNPcjRRb3VWdkp0ZVV4TDBYSXREb21UZUpa?=
 =?utf-8?B?anE4dzM1TFFCSUtFbkpESGdBR3cvSDNXYXh1SlVNdkVjdHhhdGdiNXpNZFFy?=
 =?utf-8?B?NWIxaHZMRTh1NGdQdWZaTThWTHlvdHN0aWJ5cXlqalBacUwxWU1jdlFmcGlU?=
 =?utf-8?B?Nk4vYlplYzdKc2luSWNHa1pVK2VJbURlSXRZUlE0MXB6TlpzTU9GczltN1E3?=
 =?utf-8?B?Y3k1bkVpQVlLTlg3YVQ4OWl4dlI3OGtScDBQQ2NlQkdkenFiSCtNU0J5Tzg2?=
 =?utf-8?B?MkpwdS95QlBrK1RpdnNvZ053aElIV3RIM0h0Y29FUEYwQ1VrbGZjM1FSZUlx?=
 =?utf-8?B?V1JKTVgwNjFzZnFhc0t2Y1lrZHZEL1AvaE16NW9NU2ZXd0VmTFJ5V3ZEaUh2?=
 =?utf-8?B?VjJPOFlpQzZ3RWZvb2FNQ1Nic05DdGlJMEd0dFA0YmxlNFE0WkovSFFNUEVa?=
 =?utf-8?B?d1hHbldiVlI3cUt2UFA2NFFrSHhuMUo0SkdoSEpYc0Q2YVV6cHVPSUxFc21u?=
 =?utf-8?B?L1REZkRzNHRsQkI0RkpSU2FNN1N3d3EvQVNHZUFNL0d0cDhBakliUWFja3VC?=
 =?utf-8?B?VkxmUmFPeWpKNjNTNTFDTWVoMlpHQU9yNU5xYXNqRUJxOFhlYzZaY2hFaFhk?=
 =?utf-8?B?cFlIQkthTUt4akdwZTVyN2NpVk1yZTkyN3BNWFN5WjdlMjAvSEMyZHZOZ3c0?=
 =?utf-8?B?OGhwTkQrUGFFVlkrMi93eTAxeFdXWEhRV3hBZ0R5OUtlcXc3bWNHOEhFWk5Z?=
 =?utf-8?B?d3VPYWtES1ErMG13bGlVaHNhVnlhVFYxTzBCK2M3UWtoZHZrQTR1SUtzdlk5?=
 =?utf-8?B?ZW9sMG9DMmZZaTRhRnlyb01GODllRDF0ZWJSU0F2dEp0U2x2UTNQN0VhNjFY?=
 =?utf-8?B?ZndUZ3F2NG5oVXRxcm9CaU96NlY3ZlJpOGhJWGtybTNEWW1lbWFWOTJFZS9q?=
 =?utf-8?B?eFQ0Um1xWGhEMjlsUFFldlVUOUphOUF1QUtXc3BwTks3SXhDek5DYVlIZ0R4?=
 =?utf-8?B?Vk9HcVp2bFJnc1ByN0NzNDdzTEJma00rTElrRVh4ekcvNjlSU1EwU08wdjFy?=
 =?utf-8?B?UEpvQ0p5dlVFOCtMY2U1SFFXa2tnMUxYUWwzSFFpMUFleHZrMkswQng0SnRm?=
 =?utf-8?Q?flVlRwoP+zzIyk1E1G72vEp0x03xIG7oJB1cY=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F6EF9FAB144044387BFFFBB75533B5E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10100
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	36621653-6c72-4b52-fe28-08dd026e9f6b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|14060799003|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L1VqKzNtbVpSV1hiMzhOdG1uZGxHeHVudTJvNGxJSVlVcEhRS0dPQVVXSjcy?=
 =?utf-8?B?MEhldkNsYlhPN2U0TnFNdjVDeXBKT2VtQTNkTklTUXFtVXJjc0NCM1I0ejJF?=
 =?utf-8?B?Rk9tZjdSR2gzcE5GMGJzWjBIZ3lBa2JERjZMcXFNNkV4SDVVS2JCMkxWYmFL?=
 =?utf-8?B?NjY0NkFHL3JiY1NxdENjZlluaDdNZTVXZ0oxVDZKdndoUzI2SE9WRXdnOEpa?=
 =?utf-8?B?eWdxUGdWWW5DQlM1NHZkODM2MkJ5OWwzQmtTb0xuRjVHU1ZCNXpCdlV3YTlW?=
 =?utf-8?B?ZzliazZYYVplSy9NWWQrSEg1Q0hjWVY2WmI0NW9ZcmMzMmg3MURZV1o1TC9T?=
 =?utf-8?B?Syt0UnBnQlBwNU42NWZFWmQ3V3VrMFROZlgvenl2TXhyRE41Y0lOdkhQb0Ey?=
 =?utf-8?B?ZGdOK2I1RXBYb05NaXZURnc0b2RhRnY2VVVCeGdiVXBiMVdCdmRLOXVwSStW?=
 =?utf-8?B?ekxPTTRZMnBMZ0JtenRycFVWeW5xU0xyT0hIUjNmZGlsYWNrSjQzMFVTakp0?=
 =?utf-8?B?Q2xPam16d2FlUmN0RE1JUGkvSzNrTnJrQi9NdXp4aWdvcEVnR3FkM0ppRE9T?=
 =?utf-8?B?QjN5S0ZQOTl0SmZHVERLUnl2N2ZtdWNCWks4MkYxZG9DOE5uRWhTck9ZWG9G?=
 =?utf-8?B?REIzM3dSKy9YR1BCS0o0anVuR0RYMHFxSnRCTXM5Q2xIY1BVUzV1Zk1uN0lM?=
 =?utf-8?B?SVNnWllZdmprNWNrcnA4bGNKVkd1ZWhWZkpQbDl5SEx5SnhtSG50K0QyZnVT?=
 =?utf-8?B?NDBKLzE3Rlp5T3pRRnhBdm9ESFRhWXhta01OYUJBSmV0WDhCc3YvblFBWVhu?=
 =?utf-8?B?TzQ4U0dqNU16WkdPUXBRZWphQVppSmQ0eHlxRlF1NmxXQTQwN09HOEdoOWFY?=
 =?utf-8?B?N3VieERYcGwwRWpGVVBQVzhCVWJJRVFGa3lEdkFzcWFsRVJZaWg1eUpkZ2s4?=
 =?utf-8?B?SjVXcVZKSkk2bU0rMVZpWGhQQVFZOE9oNm94NEQrV1dJU00zOGJ4dllXbXVq?=
 =?utf-8?B?dGRDRjkvRDd5UENOSnR0Zklua0JvYU1JR2hqUE9Hc1ZLSG1aMHF6YVdZZkl1?=
 =?utf-8?B?Q0YxS3VFTUJZeVdOVHQ0RE1lMTAwbUc5U0dOYURzRTZQVXp0SUpvY0RUVGFN?=
 =?utf-8?B?VDk3Unh6dXlXUmt3UXh2VmlCU0RGRzd2dFd1SEpCOWZ2TW96N09BUEFhMW0v?=
 =?utf-8?B?cCtRendXM3RQUzFuVjBXQk9IZkpVMDZiOHNWck9Mb0pjM28wOXFqMWtTckxl?=
 =?utf-8?B?cEZLdDZMZ0ZJZ21kU0JoUDFrUUNoRHVJRzFPL2toMzFlcVFyVGhiT0JHbVdV?=
 =?utf-8?B?WmpYRzRSWHE3SW9raWZpTTdpaE01NGtSUjF6UW1aQmg5YmxFTjRGS3hrcmJm?=
 =?utf-8?B?djB2dGU1RUJzZE83cWtUK3dQNjN1RjFkSzAyUWxzUW5iYXBTVjdnbFpZTlNm?=
 =?utf-8?B?K2dFaVFRREtINDZqdzh3TURSMk8zK0hTaUxGTjhKL0xpQjNGUGJSUCtNV24x?=
 =?utf-8?B?ZSs1QlMyS0x6czZGYjE4WWtjeGxzeDZDOTROMXBkaFlTR0NvVlVEYkhPeFcz?=
 =?utf-8?B?cHgycDI5Y1ZwOGFCcjlwYmRnbHNMWi8xL3ZGRnU5S3hra0JsbENqNWZCVjBI?=
 =?utf-8?B?R2U5UHlvTkszRDVnendaU2xad2FVamxHc0tuZUtaMG8rUjFPS3E4bGFVOGRL?=
 =?utf-8?B?TnRkRlRCY3ZUUUxjTDYwSWVrV3lPMU8rcDlEaGJLTDR4WGhaQU5UUVUyZnJ3?=
 =?utf-8?B?bHFFQlZPL3dweXc1WU5kWHJjTWMrY2l4K01xTlUyT1AvZjMxTkFPaXZEMHZ1?=
 =?utf-8?B?ZVB6QVpPOTZyeGgvT3Fhem5HM29qWXk1S1FxdlBGV1VIdkEyV0toSHVoRkgr?=
 =?utf-8?B?emQ3WmhMSjZISEFXZDNYTWtKbDVDaW15R1Q3L242dnM5WHc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(14060799003)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 16:34:08.3419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 860177a2-2935-493b-3636-08dd026eaa58
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5535

SGkgQXlhbiwNCg0KDQo+IE9uIDExIE5vdiAyMDI0LCBhdCAxNjowMCwgQXlhbiBLdW1hciBIYWxk
ZXIgPGF5YW5rdW1hQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IE9uIDExLzExLzIwMjQgMTM6
NDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEhpIEF5YW4sDQo+IEhpIEp1bGllbiwNCj4+IA0K
Pj4gT24gMTEvMTEvMjAyNCAxMzoyNCwgQXlhbiBLdW1hciBIYWxkZXIgd3JvdGU6DQo+Pj4gT24g
MTEvMTEvMjAyNCAxMToxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBIaSwNCj4+PiBIaSBK
dWxpZW4sDQo+Pj4+IA0KPj4+PiBPbiAwOC8xMS8yMDI0IDE5OjU5LCBBeWFuIEt1bWFyIEhhbGRl
ciB3cm90ZToNCj4+Pj4+IEZyb206IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0K
Pj4+Pj4gDQo+Pj4+PiBJbiBYZW4sIFNNTVUgc3Vic3lzdGVtIGlzIHN1cHBvcnRlZCBmb3IgTU1V
IHN5c3RlbSBvbmx5LiBUaGUgcmVhc29uIGJlaW5nIFNNTVUNCj4+Pj4+IGRyaXZlciB1c2VzIHRo
ZSBzYW1lIHBhZ2UgdGFibGVzIGFzIE1NVS4NCj4+Pj4+IFRodXMsIHdlIG1ha2UgaXQgZGVwZW5k
ZW50IG9uIENPTkZJR19NTVUuDQo+Pj4+PiANCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFBlbm55IFpo
ZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1h
ciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+ICAg
eGVuL2FyY2gvYXJtL0tjb25maWcgICAgICAgICAgICB8IDIgKy0NCj4+Pj4+ICAgeGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvS2NvbmZpZyB8IDMgKystDQo+Pj4+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4+Pj4gDQo+Pj4+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL0tjb25maWcgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPj4+Pj4gaW5k
ZXggMTViMmU0YTIyNy4uMzY5OWUxNDhlOSAxMDA2NDQNCj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9LY29uZmlnDQo+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vS2NvbmZpZw0KPj4+Pj4gQEAgLTE2
LDcgKzE2LDcgQEAgY29uZmlnIEFSTQ0KPj4+Pj4gICAgICAgc2VsZWN0IEhBU19ERVZJQ0VfVFJF
RQ0KPj4+Pj4gICAgICAgc2VsZWN0IEhBU19QQVNTVEhST1VHSA0KPj4+Pj4gICAgICAgc2VsZWN0
IEhBU19VQlNBTg0KPj4+Pj4gLSAgICBzZWxlY3QgSU9NTVVfRk9SQ0VfUFRfU0hBUkUNCj4+Pj4+
ICsgICAgc2VsZWN0IElPTU1VX0ZPUkNFX1BUX1NIQVJFIGlmIE1NVQ0KPj4+PiANCj4+Pj4gUmVh
bGlzdGljYWxseSwgZXZlcnl0aGluZyB1bmRlciBkcml2ZXJzL3Bhc3N0aHJvdWdoIGlzIE1NVSBz
cGVjaWZpYy4gU28gZG9lcyBpdCBhY3R1YWxseSBtYWtlIGFueSBzZW5zZSB0byBzZWxlY3QgSEFT
X1BBU1NUSFJPVUdIIHJpZ2h0IG5vdz8NCj4+PiANCj4+PiBBY3R1YWxseSB3ZSBhcmUgYWJsZSB0
byBhc3NpZ24gZGV2aWNlcyB0byBkaWZmZXJlbnQgRG9tVXMgKGVnIFVBUlQxIHRvIGRvbVUxKSBh
cyBsb25nIGFzIHRoZSBkZXZpY2UgaXNuJ3QgYmVoaW5kIGFuIElPTU1VLiBTbyBpbiBvdXIgY2Fz
ZSwgdGhlIHBhc3N0aHJvdWdoIGRldmljZSB0cmVlIGhhcyB0aGlzIG5vZGUNCj4+PiANCj4+PiAg
ICAgICAgICB1YXJ0QDljMGIwMDAwIHsNCj4+PiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
cm0scGwwMTFcMGFybSxwcmltZWNlbGwiOw0KPj4+ICAgICAgICAgICAgICByZWcgPSA8MHgwMCAw
eDljMGIwMDAwIDB4MDAgMHgxMDAwMD47DQo+Pj4gICAgICAgICAgICAgIGludGVycnVwdC1wYXJl
bnQgPSA8MHgwMT47DQo+Pj4gICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMCAweDA3IDB4
MDQ+Ow0KPj4+ICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJ1YXJ0Y2xrXDBhcGJfcGNsayI7
DQo+Pj4gICAgICAgICAgICAgIGNsb2NrcyA9IDwweDA2IDB4MDc+Ow0KPj4+ICAgICAgICAgICAg
ICB4ZW4scGF0aCA9ICIvdWFydEA5YzBiMDAwMCI7DQo+Pj4gICAgICAgICAgICAgIHhlbixyZWcg
PSA8MHgwMCAweDljMGIwMDAwIDB4MDAgMHgxMDAwMCAweDAwIDB4OWMwYjAwMDA+Ow0KPj4+ICAg
ICAgICAgICAgICB4ZW4sZm9yY2UtYXNzaWduLXdpdGhvdXQtaW9tbXU7DQo+PiANCj4+IFNvIGhv
dyBkZXZpY2VzIHdpbGwgYmUgcHJvdGVjdGVkIG9uIGFuIE1QVSBzeXN0ZW1zPw0KPj4gDQo+PiA+
ICAgICAgICAgIH07PiBTbywgc2hvdWxkIHdlIHN0aWxsIGRpc2FibGUgSEFTX1BBU1NUSFJPVUdI
IGZvciBNUFUgPw0KPj4gDQo+PiBXaGlsZSBpdCBtYXkgd29yaywgYSBsb3Qgb2YgY29kZSBpbiBk
cml2ZXJzL3Bhc3N0aHJvdWdoIGlzIElPTU1VIHNwZWNpZmljIChzZWUgYWxsIHRoZSBmdW5jdGlv
biBuYW1lZCBpb21tdV8qKS4gU28gSSBmaW5kIHJlYWxseSBvZGQgdGhhdCB5b3UgZGlzYWJsZSBJ
T01NVV9GT1JDRV9QVF9TSEFSRSBidXQgYWxsIHRoZSByZXN0IGlzIHN0aWxsIHByZXNlbnQuLi4N
Cj4+IA0KPj4gSSB0aGluayB3ZSBuZWVkIHNvbWUgY29uc2lzdGVuY3kuIElmIHlvdSBhcmUgcGxh
bm5pbmcgdG8gZG8gZGV2aWNlIHBhc3N0aHJvdWdoIHdpdGhvdXQgYW55IHByb3RlY3Rpb24sIHRo
ZW4gSSBkb24ndCB0aGluayB5b3UgbmVlZCBhbnkgY29kZSB3aXRoaW4gZHJpdmVycy9wYXNzdGhy
b3VnaC8gKGF0IGxlYXN0IGZvciBwbGF0Zm9ybSBkZXZpY2VzKS4NCj4+IA0KPj4gT3ZlcmFsbCwg
Zm9yIHRoaXMgcGF0Y2gsIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHNpbXBseSBzZWxl
Y3QgSEFTX1BBU1NUSFJPVUdIIHdoZW4gTU1VIGlzIGVuYWJsZWQuIFdlIGNhbiByZXZpc2l0IGRl
dmljZSBwYXNzdGhyb3VnaCBvbmNlIHdlIGhhdmUgdGhlIHBhdGNoZXMgb24gdGhlIE1MLg0KPiBZ
ZXMsIHRoaXMgbWFrZXMgc2Vuc2UuIEkgd2lsbCB3YWl0IGZvciBMdWNhIHRvIGNvbmZpcm0gYXMg
d2VsbC4NCg0KSXQgbWFrZXMgc2Vuc2UgdG8gZG9u4oCZdCBjb21waWxlIGFsbCB0aGF0IHN0dWZm
LCBhbnl3YXkgd2UgYXJlIHVzaW5nIHNvbWUgZnVuY3Rpb25zIGZyb20gZHJpdmVycy9wYXNzdGhy
b3VnaC9kZXZpY2VfdHJlZS5jIHRvIHBhc3MgdGhlIHBsMDExIHRvIHRoZSBndWVzdHMsIHdlIHdp
bGwgdHJ5IHRvIGhhbmRsZSB0aGVtIGxhdGVyIGluIHRoZSBzZXJpZXMgdGhlbi4NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQoNCg==

