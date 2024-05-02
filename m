Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7ED8B94A3
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 08:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715540.1117241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Pqw-0005C0-Pz; Thu, 02 May 2024 06:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715540.1117241; Thu, 02 May 2024 06:23:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Pqw-0005A1-NA; Thu, 02 May 2024 06:23:34 +0000
Received: by outflank-mailman (input) for mailman id 715540;
 Thu, 02 May 2024 06:23:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7KU=MF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s2Pqv-00059T-0d
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 06:23:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ddec23a-084c-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 08:23:29 +0200 (CEST)
Received: from AS4P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::18)
 by AM8PR08MB5812.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.29; Thu, 2 May
 2024 06:23:26 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::1c) by AS4P195CA0016.outlook.office365.com
 (2603:10a6:20b:5d6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28 via Frontend
 Transport; Thu, 2 May 2024 06:23:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Thu, 2 May 2024 06:23:26 +0000
Received: ("Tessian outbound 082664cc04c1:v315");
 Thu, 02 May 2024 06:23:25 +0000
Received: from 7690f41ef32e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8029D8E6-2EB9-4B9C-A2EF-0F1884B3694C.1; 
 Thu, 02 May 2024 06:23:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7690f41ef32e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 May 2024 06:23:20 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GVXPR08MB10863.eurprd08.prod.outlook.com (2603:10a6:150:154::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Thu, 2 May
 2024 06:23:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 06:23:17 +0000
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
X-Inumbo-ID: 7ddec23a-084c-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NqDlpHHP8KsA8rXOJGVnC6RA8Ly0X+SjEZDfaRT+XMA4SpVKatRiDq2U7QmkhoIRbbU2a6PvmZt6q+JKE/3HDW8T10a+z0HnQIBaKcIlZZjWtLQsIHTYTjg+iUN7a+sRef7OFOAYSGQkj+U2hWC54vlnxBH5jzcCn/ftPKbe7aDDWqfwuh8bF6fHxVD9W4tzl/wo40ztHgNp9DZO0+Drp4c6kDC4RkWjVSBM5xA1MAX4FPI0rmKIOBlASjjHoee0V088XTBwP5ysv7zSgHws0Nwqcw1Y5zuuWRZeoGs6u084A24bHm5BwMsFuONN25bjfg4PP2gB10cbUlld9NaY8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkpJDoPJAcjhomrzoWJJ+nLmvfL+EmAyZtxfxalFIaw=;
 b=Jy0QAdhrQ8EgpwynJvy9FcUNPvR9ipMkmA9xuyfKs6KwyFTE6AUADNEIQ25IU3jgTGYiaM/nZG8JXxhvTixdUHD2nb6Vb2mdAuV2D7H/bgvpfuC4B05s+cqSOoUvOMbOerBvZ3dimJIF3F0JMn9CnXM0b4TS9hbdoAGK8mmEjyBmKSM7utiYW37lBo3CM4BX5GV4vLTJi5ri0M4HOuVMA6HVmzmUEeM70nEPzyD99nBalwtAuyXOeLNZ0B9BD5DfidVEqmNkrSgz0JCzpaEq0tRjHp7pgmiDONJyAQUcC9Lim+gxYFbmpoySaMB27ct+sahyG+qFpWjOpPwnlmqpeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkpJDoPJAcjhomrzoWJJ+nLmvfL+EmAyZtxfxalFIaw=;
 b=GMxSCRMCXxdd7RsLfk1yuAVgRpzwEA8e9oi0DRUEjEbJ2mjpDaCLo3VAhHXRFf8yL5i4HNVgrMgCLaRNTq/HqKSBVht/QXBaMKzSDGMvUmBZJAiu6caThzn43MWV7AYZSr6MZ16gRHI66v8muW6wfiSH02JUlRQCHKP2dFo/P/M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4df3f04030d602a4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwFish/pbUS3o95l4Cv+rMmxrK61WBNv284CfykR4HRj50GKqx06NSq9719kzmCTBKbG/TPIYcUYOTNNmbuqG0d4nGPdQqwq+dOY1dffb9ePaLXdxFYj10mlbgBPdmkwXYzfXFbGkElsJbLovj9ZyFZVlx377vKkBEYdcxyYW/CLqzmLGVwkxZvtJUoS3zlDd/nJeNQoYHtjEu0/UIuAm1xcf2rl2LGrYNaSviav/wml9RoPn2b5o/Em0AAtbngkbA6IAusRGbRWSyRssz0xNMDCJifgY4knUUhIgylVvmxWnLbwLWgCOoQ7SkZvgPaFsv/8GUHXp71gm/dmpJTVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkpJDoPJAcjhomrzoWJJ+nLmvfL+EmAyZtxfxalFIaw=;
 b=iXG0AFhmsVHdYMvHtD5HRUHpgYpVxeLeuYBEtKd4rfr3WVrxSxmBDE3D/PoL+GjY+B1GEAqWi6JGgoHlovpQ5IEPh9H6xbCSbQdK20qOxax/cDjJzfvdoh7OSwM2SGgRYIjH/THvTQ/H/8Um61R1k06rHec+W8R/224R7mGgj5FaZb5gr4Q41DuF/akjdxHl5YsQmjjod0fxJAleBzaE+9fTvKnLH9umNHCRGXyoh4hYXLzwa/cYiAbT76lpV8GzQP1X/7so+dTvLi9v2lUDNDWj4wYclidkih/DhLc1GpslSIZAOZAxhmGqfybzCZHx3Y5IXBg/F4Uixf/sYDcz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkpJDoPJAcjhomrzoWJJ+nLmvfL+EmAyZtxfxalFIaw=;
 b=GMxSCRMCXxdd7RsLfk1yuAVgRpzwEA8e9oi0DRUEjEbJ2mjpDaCLo3VAhHXRFf8yL5i4HNVgrMgCLaRNTq/HqKSBVht/QXBaMKzSDGMvUmBZJAiu6caThzn43MWV7AYZSr6MZ16gRHI66v8muW6wfiSH02JUlRQCHKP2dFo/P/M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "consulting @ bugseng . com" <consulting@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
Thread-Topic: [PATCH 1/2] xen/kernel.h: Import __struct_group from Linux
Thread-Index: AQHamu7vn3o+gufgI0eDMZNP6vgeorGAsTwAgAFBl4CAAYX0AIAAA74A
Date: Thu, 2 May 2024 06:23:17 +0000
Message-ID: <C6F3416D-785A-4C1F-96B9-1C7A53B927EA@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-2-luca.fancellu@arm.com>
 <cd2352aa-e94b-43ef-b3fc-359cc1f43fb0@suse.com>
 <2AB02E85-2746-4DD6-A821-B858E52A6954@arm.com>
 <16815d66-ffe7-45e9-8311-5d4ed8754d2f@suse.com>
In-Reply-To: <16815d66-ffe7-45e9-8311-5d4ed8754d2f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GVXPR08MB10863:EE_|AM4PEPF00027A6B:EE_|AM8PR08MB5812:EE_
X-MS-Office365-Filtering-Correlation-Id: d12aeefa-02c9-48cf-0c4a-08dc6a706044
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UmRxWjNFOTlzWG4wYkx5Y0lTNTVKWExlOHhlTUFmMTZhV05uWEtubGRpQzFY?=
 =?utf-8?B?S2MvdndLVEUyc0k0MmF3aVJYV3FlTlVmaW9VMS9GZW0rcUdaZDBDR1h2ak9Q?=
 =?utf-8?B?V05pRDlEQjFwV3FZdG0rQTRUS0lRN3RzMGg1ckJwYjNGYkllZStuMEdmSUlE?=
 =?utf-8?B?U09IaWFTMUE5N3o5UE1WZHkrRUwvRXF6YzFNTk50ZVlYdjVSaHVjbGRHd3Bj?=
 =?utf-8?B?anc5cTRuL0o3OERjY0JWUGJPQ2NEMy9vV2gvQjNaTy9HK2lmNjBtTE1vRDNr?=
 =?utf-8?B?TVM4TVgwQTh1VlRVS3RpZkh6UXlTQ2NtVXpheHVHYmdCY1BQNGlGRG90dlpL?=
 =?utf-8?B?YXlraFR4TVdvdjkvVjVpbi90bkdBZlJBV0hBYzdEYVZpRUFBSU5ybkQyT1F3?=
 =?utf-8?B?U2xKRi80RGRQQ095VDI0OFhEMXFzZWpBaTljZkhpdkdhdDdlYjRJK0swdXNo?=
 =?utf-8?B?MzBmWW9LajFtTjNWaUwreXllSTlzbVphMVdWWERkZmN0Qlo0R3hOQ09qbG1z?=
 =?utf-8?B?S2E3ZDRUZWhQUXVQUER6NDJIRklPYktrQVFjL0hQWlBkWEdTWFN5akpxSDNF?=
 =?utf-8?B?UjRLalNUR01YR2NETWpyRzhhTXV1Wi8vWU5ZU25VTlBLeklZRUttZi9WM2Qz?=
 =?utf-8?B?c3NwYnMxcVpoK1hEN25uZlQyRnhRUURKdzc3YTdzZ2x0d3lXZis1bEJ0blBh?=
 =?utf-8?B?a0VNdjlYa1NRTTREOXd1UGxJN0hKUTBDa0d6ZHJsT1NxNWxsSUhqeUJBcTMr?=
 =?utf-8?B?cWY5ZGhIMG5SRmljdUFieE9jQ0M0VUQwTkhueGdZbk8vZGlyWjI4b2VjRG1R?=
 =?utf-8?B?TEtkdEVMSC9FbkhVdC96OXNBcUZQNlJUYzlZZXFnclYwYUtWZDNhQlZidmor?=
 =?utf-8?B?aDkvUzNXcGduZndUNVZod3c4Nk82UTVNdXhXUTZyWGFLaGRnM1g5UFhMVTZS?=
 =?utf-8?B?dSsxcVdsSVlVYkxMM1lFTUI2SGNKTGpKbVFEM09DQ0IyVkJyaHM0bllpU3cx?=
 =?utf-8?B?Zmw1YTNtMEMrZEt5N2pyakRGYUMrdXFTTnRCYU9kcnFBZVJBYlhwa2lJd2pD?=
 =?utf-8?B?amJKdytRRHArTGJLME5SZkFyNUk5ajJzQytsa29UZFpaQVFseldJOVpmS2tB?=
 =?utf-8?B?L3QwUE9rbkhmVWo4MUg0MWNoYVEyQ3NkL1ZyeUNlOGxVR3NQYVYvemU4QjJi?=
 =?utf-8?B?M3dZS3hDZ29HZzJtY1hFek0ydWxWQ0dDa01wZG1jd0d2eGlyWUNSZ1FvYXd2?=
 =?utf-8?B?QjY2c3ZlZTlqT2FwYUhYdW0yaEM2dllzY1hBckN5dStVdFdlQTNEazJBb1NI?=
 =?utf-8?B?cjV2UlVvTVp1Z2lZRUpyY21sYUkwRXFQZkpJcHJTek8rYjdwajZMRG9QMXVD?=
 =?utf-8?B?cW1MOWxPWkt2VmNvOFlkbUF1V0ZCanliVGhXK2l3dFpoaVZmcjZnYUNWR0tI?=
 =?utf-8?B?MEo2Rys1SlpKVjl2SjFGVWdLTlZ0Wnc0bEovSDJDWXNjKzNhc3hLLzE0cUlY?=
 =?utf-8?B?c2JrdE1HcUIvZjZtalRMZWdnQ2FoMnBlUC9IeThHUVcvWmkwYlNLMkg5L3Ir?=
 =?utf-8?B?N3BMd0owWDdxc3dVY1o1WEpMUm1RNzM2bjNCSmNYS09Kb3BFVFRPOWNwQVF1?=
 =?utf-8?B?UTg4STg1QzBSOERBME90bGpISWUrbnUrQUU4SmFYZEFNbXFJMGxHc2YxT0J6?=
 =?utf-8?B?aUFLekJzcE1SNWdFeVNCNEFuYXRScmkxY0lGeHZVaVJvamNSMWZqdGRRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B908C8A5061894E8241F4B9308EC9B9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10863
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9aaef03a-3e55-4daa-0178-08dc6a705abd
X-Microsoft-Antispam: BCL:0;ARA:13230031|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M3JFZ1U4V2dOdHdQN0ZhcEVTWDdLMTRHdXJmUi82bEZ5SUNSYlpFbWdydTN3?=
 =?utf-8?B?K045YklxRGFOV1QzMDlFNEdUU1IvcXlpZHNiRHdUN3J1RmhQbkd2OGpNaFMv?=
 =?utf-8?B?cHhPY2hJektCQzkzYlY4QWZoWUg2b2VKQVhMWDc2VE4xcTdSK2Q3YzViTTdI?=
 =?utf-8?B?MTRtKzdyNGRXSnBINFhYeW1xNWJqbXdqY1EzK25UY3FGYkN1RVBSWFJqT1Nq?=
 =?utf-8?B?bVZaaWp6TW9Vc1ZNUDk2OEhMV3hheXNSM2ZOcjB6WlkrV2NHTkQ0OXdjeDY3?=
 =?utf-8?B?WU5DMDFQdFMzZnUrMThVRDh0c0s0WE8yeHNiWEtLbW9jWTRNMTk5b2dlcUkr?=
 =?utf-8?B?ZlZYc0pxOHZ0ZTZBQWVmdDY3U2YwL2ppaUJENFIyZ3RGb2dOSE9ZZG5LUXZu?=
 =?utf-8?B?NmxwWVlXYTY1U1RBNnV0dS9IQVRCNkVDWkI4QUt1OVN4dHkzWmhQU0RHcHZK?=
 =?utf-8?B?SVY2ZXBVTUp5cEI1ODVWbFNHNmRVNmdSWGV4L0x5UGVib2JodDFjU2hDNjM1?=
 =?utf-8?B?ZTF0QklhdmJKNkoreTBhSFZrUVRlNXRqS2Y0d09XV2czR0tQZXdMVWxybnZ0?=
 =?utf-8?B?SWdzSFJqdytaa1VVVE1IY2JrUzF2Y3J4d2J3VUpzdGU0aEF4V0pXVWhXYVRP?=
 =?utf-8?B?MGhzMWJiRTlCYUhxZ1BWMk5CT2VZdFhBa0lnekxkM1phY3l4b3FFSVdsL0JJ?=
 =?utf-8?B?dFQvSGNXM3I5NjRwczhYSXNoZmhpMjZ4c1NzS3o3Ym9COTdHMXhYYms1dmxq?=
 =?utf-8?B?NG1LZW1Bd3lTeXFUaU0wejl3a0cyUVY1MXg0aVlhK3RqZGE5bHlWcXE0Um1w?=
 =?utf-8?B?eS9hKzRRcHJFSnk2RXhMRzVFOXl4VlBZak01SlFxZjVlZkgvZlBNY05QWVZX?=
 =?utf-8?B?blUyR2tVY2NaUG5RdllWbG1wbkhlQ2xnSnk0RE1idDFqbGJIMmRTNnkvbDAx?=
 =?utf-8?B?QlNuOFExRG1WWXVlUVo2RFR6OUZHMTdhblFxci9IVUVJNXo1c1FiQXovS0oz?=
 =?utf-8?B?OXViZ001b0hhaWdFbEhPYVlES09rY1pmd0FxQ0lPWEI0ekxBamE3MU84MjB0?=
 =?utf-8?B?RU9aWjcvVDB1NnlGWHJSWGV6NHZuMHRxUUdGVFlQL0haSVBXYkVUWDFUVTJT?=
 =?utf-8?B?S2paOGRPTjJzM09oWjVvQURQcm9nVlNNdkZVWUtlVHVmTWowWVNLdU8yb3h0?=
 =?utf-8?B?ZTBabzNsazFuNERCMmV3dXp5eEVXYXYxR0kzWXlUSjJUZnl1Um9FblNUcWdL?=
 =?utf-8?B?NFNsRlYzL3R4QzhsakdDVmVHNGdWMUsxZkkwUTV6V09VQTdUVFlla3lRbHlt?=
 =?utf-8?B?bTlBRzBORjJid2VuSzVyem5qdmoyTC9NVmZFUTdLRzhXQ3N3ZEJ1ZitDOWNB?=
 =?utf-8?B?Q0JXMVlxSlh2V2M2bzJpbGVOYU5uSFBGbVlJNFZKWmwrRVhNb0FIUWNRNkll?=
 =?utf-8?B?dndIQ3dGQWRKM2JUWFRQeXpyUHZlYTY4WGRRak5ablM0Ny9OV2tnRHhRdFIz?=
 =?utf-8?B?dUszNlE3dEZ6ZFZXQVcxWkxBQzNMVFk3dXBQUVMxTll5ODIvZHg5TDdzNjRL?=
 =?utf-8?B?SndacXd3SDFsbWhYaGJYUThrZms5TWtOZHhGYlF6OVZGcU1yZFF0Q2oxRWkx?=
 =?utf-8?B?THQzalVQcUVTOXZXeE9oT1BPNmxZYXFUbkNhc012aWQ4R1RFVHdKYTh5ZWJj?=
 =?utf-8?B?NTlSOElzTTRUU2ZvbzB2dlQySm52M0J4VUpEWDdibXZMNDQ0d3FwVjQwUXNV?=
 =?utf-8?Q?z/HBBuaVRtlsvRfbxVBe+BxwlbqHtdYaMpDRz5i?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 06:23:26.3096
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d12aeefa-02c9-48cf-0c4a-08dc6a706044
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A6B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5812

DQoNCj4gT24gMiBNYXkgMjAyNCwgYXQgMDc6MDksIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMS4wNS4yMDI0IDA4OjU0LCBMdWNhIEZhbmNlbGx1IHdy
b3RlOg0KPj4+IE9uIDMwIEFwciAyMDI0LCBhdCAxMjo0MywgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4+PiBPbiAzMC4wNC4yMDI0IDEzOjA5LCBMdWNhIEZhbmNlbGx1
IHdyb3RlOg0KPj4+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4va2VybmVsLmgNCj4+Pj4gKysrIGIv
eGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oDQo+Pj4+IEBAIC01NCw2ICs1NCwyNyBAQA0KPj4+PiAg
ICAgICAgdHlwZW9mX2ZpZWxkKHR5cGUsIG1lbWJlcikgKl9fbXB0ciA9IChwdHIpOyAgICAgICAg
ICAgICBcDQo+Pj4+ICAgICAgICAodHlwZSAqKSggKGNoYXIgKilfX21wdHIgLSBvZmZzZXRvZih0
eXBlLG1lbWJlcikgKTt9KQ0KPj4+PiANCj4+Pj4gKy8qKg0KPj4+PiArICogX19zdHJ1Y3RfZ3Jv
dXAoKSAtIENyZWF0ZSBhIG1pcnJvcmVkIG5hbWVkIGFuZCBhbm9ueW9tb3VzIHN0cnVjdA0KPj4+
PiArICoNCj4+Pj4gKyAqIEBUQUc6IFRoZSB0YWcgbmFtZSBmb3IgdGhlIG5hbWVkIHN1Yi1zdHJ1
Y3QgKHVzdWFsbHkgZW1wdHkpDQo+Pj4+ICsgKiBATkFNRTogVGhlIGlkZW50aWZpZXIgbmFtZSBv
ZiB0aGUgbWlycm9yZWQgc3ViLXN0cnVjdA0KPj4+PiArICogQEFUVFJTOiBBbnkgc3RydWN0IGF0
dHJpYnV0ZXMgKHVzdWFsbHkgZW1wdHkpDQo+Pj4+ICsgKiBATUVNQkVSUzogVGhlIG1lbWJlciBk
ZWNsYXJhdGlvbnMgZm9yIHRoZSBtaXJyb3JlZCBzdHJ1Y3RzDQo+Pj4+ICsgKg0KPj4+PiArICog
VXNlZCB0byBjcmVhdGUgYW4gYW5vbnltb3VzIHVuaW9uIG9mIHR3byBzdHJ1Y3RzIHdpdGggaWRl
bnRpY2FsIGxheW91dA0KPj4+PiArICogYW5kIHNpemU6IG9uZSBhbm9ueW1vdXMgYW5kIG9uZSBu
YW1lZC4gVGhlIGZvcm1lcidzIG1lbWJlcnMgY2FuIGJlIHVzZWQNCj4+Pj4gKyAqIG5vcm1hbGx5
IHdpdGhvdXQgc3ViLXN0cnVjdCBuYW1pbmcsIGFuZCB0aGUgbGF0dGVyIGNhbiBiZSB1c2VkIHRv
DQo+Pj4+ICsgKiByZWFzb24gYWJvdXQgdGhlIHN0YXJ0LCBlbmQsIGFuZCBzaXplIG9mIHRoZSBn
cm91cCBvZiBzdHJ1Y3QgbWVtYmVycy4NCj4+Pj4gKyAqIFRoZSBuYW1lZCBzdHJ1Y3QgY2FuIGFs
c28gYmUgZXhwbGljaXRseSB0YWdnZWQgZm9yIGxheWVyIHJldXNlLCBhcyB3ZWxsDQo+Pj4+ICsg
KiBhcyBib3RoIGhhdmluZyBzdHJ1Y3QgYXR0cmlidXRlcyBhcHBlbmRlZC4NCj4+Pj4gKyAqLw0K
Pj4+PiArI2RlZmluZSBfX3N0cnVjdF9ncm91cChUQUcsIE5BTUUsIEFUVFJTLCBNRU1CRVJTLi4u
KSBcDQo+Pj4+ICsgICAgdW5pb24geyBcDQo+Pj4+ICsgICAgICAgIHN0cnVjdCB7IE1FTUJFUlMg
fSBBVFRSUzsgXA0KPj4+PiArICAgICAgICBzdHJ1Y3QgVEFHIHsgTUVNQkVSUyB9IEFUVFJTIE5B
TUU7IFwNCj4+Pj4gKyAgICB9IEFUVFJTDQo+Pj4gDQo+Pj4gQmVzaWRlcyBteSBoZXNpdGFuY2Ug
dG93YXJkcyBoYXZpbmcgdGhpcyBjb25zdHJ1Y3QsIGNhbiB5b3UgZXhwbGFpbiB3aHkNCj4+PiBB
VFRSIG5lZWRzIHVzaW5nIDMgdGltZXMsIGkuZS4gYWxzbyBvbiB0aGUgd3JhcHBpbmcgdW5pb24/
DQo+PiANCj4+IFRoZSBvcmlnaW5hbCBjb21taXQgZGlkbuKAmXQgaGF2ZSB0aGUgdGhpcmQgQVRU
UlMsIGJ1dCBhZnRlcndhcmRzIGl0IHdhcyBpbnRyb2R1Y2VkIGR1ZSB0bw0KPj4gdGhpczoNCj4+
IA0KPj4gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNz
L3BhdGNoLzIwMjMxMTIwMTEwNjA3Ljk4OTU2LTEtZG1hbnRpcG92QHlhbmRleC5ydS8jMjU2MTAw
NDUNCj4gDQo+IEhtbS4gU2luY2UgZ2VuZXJhbGx5IHBhY2tpbmcgcHJvcGFnYXRlcyB0byBjb250
YWluaW5nIGNvbXBvdW5kIHR5cGVzLCBJJ2QNCj4gc2F5IHRoaXMgY2Fubm90IGdvIHdpdGhvdXQg
YSBjb2RlIGNvbW1lbnQsIG9yIGF0IHRoZSB2ZXJ5IGxlYXN0IGEgbWVudGlvbg0KPiBpbiB0aGUg
ZGVzY3JpcHRpb24uIEJ1dDogRG8gd2UgdXNlIHRoaXMgb2xkIEFCSSBpbiBYZW4gYXQgYWxsPyBJ
T1cgY2FuIHdlDQo+IGdldCBhd2F5IHdpdGhvdXQgdGhpcyAzcmQgaW5zdGFuY2U/DQoNClllcywg
SSB0aGluayBpdCB3b27igJl0IGJlIGEgcHJvYmxlbSBmb3IgWGVuLCBpcyBpdCBzb21ldGhpbmcg
dGhhdCBjYW4gYmUgZG9uZSBvbiBjb21taXQ/DQpBbnl3YXkgaW4gY2FzZSBvZiBjb21tZW50cyBv
biB0aGUgc2Vjb25kIHBhdGNoLCBJ4oCZbGwgcHVzaCB0aGUgY2hhbmdlIGFsc28gZm9yIHRoaXMg
b25lLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

