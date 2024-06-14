Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD7F908576
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2024 09:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.740472.1147566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI1pR-0003oh-2Y; Fri, 14 Jun 2024 07:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 740472.1147566; Fri, 14 Jun 2024 07:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sI1pQ-0003n6-W6; Fri, 14 Jun 2024 07:58:32 +0000
Received: by outflank-mailman (input) for mailman id 740472;
 Fri, 14 Jun 2024 07:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BY3m=NQ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1sI1pP-0003n0-Sk
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2024 07:58:32 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on20600.outbound.protection.outlook.com
 [2a01:111:f403:2600::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2929496-2a23-11ef-b4bb-af5377834399;
 Fri, 14 Jun 2024 09:58:29 +0200 (CEST)
Received: from DUZPR01CA0252.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::22) by VI1PR08MB9984.eurprd08.prod.outlook.com
 (2603:10a6:800:1c7::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 07:58:24 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::38) by DUZPR01CA0252.outlook.office365.com
 (2603:10a6:10:4b5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25 via Frontend
 Transport; Fri, 14 Jun 2024 07:58:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Fri, 14 Jun 2024 07:58:24 +0000
Received: ("Tessian outbound e43fd1351ded:v332");
 Fri, 14 Jun 2024 07:58:24 +0000
Received: from 8e5663abba87.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4027F759-80AB-4772-8B45-37473E5CDD19.1; 
 Fri, 14 Jun 2024 07:54:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e5663abba87.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 Jun 2024 07:54:41 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8309.eurprd08.prod.outlook.com (2603:10a6:20b:554::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 07:54:36 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%3]) with mapi id 15.20.7677.019; Fri, 14 Jun 2024
 07:54:36 +0000
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
X-Inumbo-ID: e2929496-2a23-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Cj9SCKfASqQYXfl3ql5z0nZxgE+iKTtBUEVCukHzMHd3uo/TlxrYMmf+QsGa3EFMHJFZ+c8O+ytHHvdjbjNwm+iKN9kqMiUi1s/YvYEjBQxDlFY0hrxAxEG7XsC+v56CqlzjchrOLRoJUh/aB8LE77ySMaMUPvqyAn9I9k57dSSxCNncJYRfvnI7d9HO2UbtU9kHEMy/BUPLTDE7Cd42H0+DqW2EO01mNNZIt5mwbiv6NrhDJ4EU5XdpOlzfMIfO27FAZIQKKIRYdSf03eOfNHdlWR2IjqOzpnasLFQr+CC1Jn8Lg2o7LaGJlCdgtPMWqBvxLY+qFRWsUZAF6D0eSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UGpXkunA9fOoYkDFW40muvm+1IVctnokFDRn8Lwnqk=;
 b=eNdz8YxevacI6iEGciN7f7Vqit9mMwZoVq4q0cgKyvorZdJiHCw6uVYZayHOVjT2gkzm2t/sJ5egF4N0aB48Ic3HA+0jYO8K2NYoGAw/gDqlzhFwqGAJOnPzbBuk1pf2rqihi+BIgezXs7UkFJ4GZe1GSgsHvnJW+lsoFsmVErUtqo3LrVH4BASuO0pXnkyJKn8qCmbTJ91e5cllQj2J8pYVNpMie1zmXoDtV3seamp7Cuw8kMNmk0EhSdKw9HWuuSeGV809lf8cWHs1HwvRJulvEfz1F/mWrQB7MVlqzXguxNYbA/1jxRxRE5G9cTtQ5T7V/4RbEbl0O8HvLP01rA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UGpXkunA9fOoYkDFW40muvm+1IVctnokFDRn8Lwnqk=;
 b=T2V3ZwSMScP2JrI7AI0eRkC0b1tHauB/9m7ZwqbhwAP5el7StbgtF6AQgE1J/dqMXvz8oEtGtv+ycSySEk5MWFknwfpDWrXZuxVXC3Vwi2buyVir+YAxXza5/LM3hCANDVjybOmQhCEnLcT+7RACmicPnyV3dghyoaLs+WaSUg4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3d1bde0996cf9d7b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dtQMQnki+MuLrpc5/CmT8qi91BXhh4njHKFYDv+Hk2NLz1T0M+9E5vSRUP7j8l5YdeabN2/r7olZbyiQRe5Wh8fwpCw/RjVqbAmX/SD3jOA1ijlddeQQPZuCygBGIVbkLCPG+6++cX+tyLXrFAB9Pk8tWfiCEAkPB5h99fHQuIEFf4Ck4zBAJ5g00nQFM5bA/3XcxptZFVKchdn1/rGb1FHb4foNEWv0MzvextHJ+NnA2CPU0YgWBiZY50f4qNcG0djt6K1CoaX6Jvx/MlFAWzILYm5C3efNzPa7+7LNcppWooCHKH1GoWKqtYO22+4dmU93ES+/vHVN1fA/fAQ+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UGpXkunA9fOoYkDFW40muvm+1IVctnokFDRn8Lwnqk=;
 b=JsfgRNvwsQCYN0hVYpH8hzUi5Eh7lPP+HgGG1IdxjmZkeb9JOmeDZIeQE3gCTNpU1QA/URoP7KIGlX33O2GDuTT1d1mzxricK9xGwA2mfAlzcQK9BkfL2gs0tUaxIq0KMtUBmyhGNhv2cvKXLh0UMY+sunZOpp72DxUlOrpvgZASPvXGD1Om/ggfvkw2Rm9HGOIsCVRoK1ic1ko7Ivd1bz6/DD/vBTmYRnNSpt3Wp67ESH+WqDC2I2Mrxs0Gj04elnf2F0g+NbujjWjzJ1u+yzjItwm9/sAcN3nXsOe98B4U08zImMgImFyLZmorJaFidaS+/vELwq3WHE4AxK3DFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6UGpXkunA9fOoYkDFW40muvm+1IVctnokFDRn8Lwnqk=;
 b=T2V3ZwSMScP2JrI7AI0eRkC0b1tHauB/9m7ZwqbhwAP5el7StbgtF6AQgE1J/dqMXvz8oEtGtv+ycSySEk5MWFknwfpDWrXZuxVXC3Vwi2buyVir+YAxXza5/LM3hCANDVjybOmQhCEnLcT+7RACmicPnyV3dghyoaLs+WaSUg4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH v4 0/7] Static shared memory followup v2 - pt2
Thread-Topic: [PATCH v4 0/7] Static shared memory followup v2 - pt2
Thread-Index: AQHarde1wBZMIqRdOku1vS0eoyuKdLHCnAmAgAAByACAAxERgIABVZYA
Date: Fri, 14 Jun 2024 07:54:36 +0000
Message-ID: <92B10944-083B-4DB3-8257-ADD452FBFF69@arm.com>
References: <20240524124055.3871399-1-luca.fancellu@arm.com>
 <3DDAAFF7-5E43-4B92-9D6B-6D8AFBA8496F@arm.com>
 <66e5d584-b326-4197-81d5-ec2b8233a3fa@amd.com>
 <502d0284-1ca2-478c-b4f4-fda5caff3723@xen.org>
In-Reply-To: <502d0284-1ca2-478c-b4f4-fda5caff3723@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8309:EE_|DU6PEPF0000B620:EE_|VI1PR08MB9984:EE_
X-MS-Office365-Filtering-Correlation-Id: f840c506-c20d-4039-e328-08dc8c47c458
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230035|366011|376009|1800799019|38070700013;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?OWpEWFJlOUJZK3hwSjRiQ2J4V0RxVXRhd3VkNnYzRFQwd1lBM08vTm1OT0Jx?=
 =?utf-8?B?WUJaWmR6SGZXYWthZ1E4ZUlvbUlRdERtM2o5c0ZFZkZaeTQ2SE1nWUJqdkFm?=
 =?utf-8?B?Z2poSXdvS1pkYlAxWnAyVTBKWEwrQ0ZWOVZnUTZ4WHhLWnRWN2RERjdlVmt3?=
 =?utf-8?B?djN5bnI0ZHBVbE83K2IrUUdtMFJSejJPaHdndnN1N3JQK0NlYXcvRmJnRTJ1?=
 =?utf-8?B?Q0ZJN3UxVkphNzFSaUwyNytGM29NOERlaXl1OWY1YzlyV21GRVJJY2ZPWVBS?=
 =?utf-8?B?dU52V1FCcUZxakIyeGs5NUdDR0RLd0VGWFNNVzBHWDFabmVDaFB2YVVsV00r?=
 =?utf-8?B?L2RURVBkMk1GZFJaSHJDbW9rZlM4MDRMdEV0eGgwTHJlQXZZcThCOGNyWDhu?=
 =?utf-8?B?U1ZuQ3pMUkhTVzZxS3FOdUhjV3M3eXdWbUtBd2JPSW10VGQwN3YzNXNYVGEw?=
 =?utf-8?B?VWE3bnBiTFRZaHdYcXZRS1F1bG1lMUpIQUtuK1RaNXBudW91UnFGOGx0K2U4?=
 =?utf-8?B?Ny9Xb2tUR3BOZmFaa1hkYjRkTjZ6aDRIMlV2NjY4OCt4U3B5VFMxYzdLUUhH?=
 =?utf-8?B?VldTd3R0NVE3NEJ6b0dmS0dkZng3YUtZWFk2aDNOayt4VGFmS2ZYcy83SmJl?=
 =?utf-8?B?R05TckdVeFlXendIZmhDemZZZTlVajhSdW9pZ1RJdE9BSVAyVUIwRUpOWk9a?=
 =?utf-8?B?SEFjUzNZV2l1Y1A1VitHdTVGT3pBN3lLSkVRWlpDUjJYTWlmMGxYY2F3MmE5?=
 =?utf-8?B?U3dETVkwSnMvSkdMMXBudVNwb3FQUXAxSzQ5YnNxM3piclBiQWtCa0Jrakdz?=
 =?utf-8?B?aFpScGZLb0cvbEJGMlNsNzZJWHA5aFY5cEVaNERMMTVlQkhCT1ptTVVhOVdv?=
 =?utf-8?B?eVRqczBqQkg1VGFhd0RiVE1adVlIa0hSUVVUMFNRakVQWmxXNXpYdzNrTHRF?=
 =?utf-8?B?UUM4SjY1cHZzeDN6bDhPeFhXbGI3RXdvSHhuRXhKaDQzUzNwNDdsYmFscmJN?=
 =?utf-8?B?Mnh2ZE1PNkFHT1hZblhwSS9LTUJ3bHE0OEp4VVdybmJ0b3JwZDVmcThGaXhL?=
 =?utf-8?B?T1JOdGtkQUV5Y1pubXYwcFQ3WnRtMVNNR3kvZzRDS01ZRVliWC81aFAvaCtX?=
 =?utf-8?B?UXVOT3F1UWhjUWhHWm9qelh6YkthTjRuS2F4RTNXd293UkVpdlFaUzgweXpT?=
 =?utf-8?B?YlU3SVYrcnBSdG9iMXlOM3kxRGpRZVFlNitlUnRWUm9vWFpjUS9DQzlCdXdY?=
 =?utf-8?B?NS9OUmwrdnRjVnpNK2ljU2VPRkUySk1xSnVNQktXeHdxelQ2eXRlUjlFQUtJ?=
 =?utf-8?B?bDQrZ09VdmZpVWRmNGFSczNnaFFKOGRmaUdaN2hVekFQOW9WRHNtMzJ5bThH?=
 =?utf-8?B?QmhvMDdkMjFxdEQwbVVyek1DSFVYWGpQTFFrVGJhU21DbnZrdTUyVEs1U2lr?=
 =?utf-8?B?ZVRXQnhWelpqYW9sZW42a2R6N0lZL040eWVTaVl1V1AwNEFVYkV3dExDYXhi?=
 =?utf-8?B?bEdJOVlLc3FweVBFVzlmRFVZS0hpZWQvRHBEV1RHbktlLzIrc2pGejNhM3ZJ?=
 =?utf-8?B?aW42M0JVOGlhZnQrRE5xRnBsN1RDa2JFbXRKMWk5VWF6NTFsMzRZd2FwZ0p2?=
 =?utf-8?B?MHoxVmdXSVdWdjBrZmxXMkxBUy9iQlpQdGwvRkZrL1ZMYXk5TzVMaW5Oc20x?=
 =?utf-8?B?c1o5MmhBaklHUWtCQmNNTjdHYjZuZDI5SHN2SG1NdEttbkpWekY4TWhqQTU4?=
 =?utf-8?Q?U9iRZv4f13gh0agR7CZH2cUDUVZqUqz5TZcZFd4?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(366011)(376009)(1800799019)(38070700013);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <39EB34B3AA00A04096BFB5000782570D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8309
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8402177b-f265-4332-9fc1-08dc8c473ca4
X-Microsoft-Antispam:
	BCL:0;ARA:13230035|82310400021|1800799019|34020700011|36860700008|35042699017|376009;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WG96RVRhV3lQSDRJeG1hRVl0dlh3RzNkSWtpMll4L2NrT3dDZTIzT2RRVkNF?=
 =?utf-8?B?Y3ZldngvdFFBZ1Zta0pTMVdYMVBxaU5GSzVDWkF5bjQraXlPRklZNUhOK1Bx?=
 =?utf-8?B?RmlPWFNVdlJCOGliaWZWSTUvZmJMWnV1SzBNN09sRWQxNUhrQ1BydVNnZW1r?=
 =?utf-8?B?bml6WTkrRDExWk5JOTVQcGpsSEtZaWljZVZ2NC9WY29kZjFaSlpWSFNQUUdI?=
 =?utf-8?B?NGZBeHZqeXRSWitCMnZndHdzeTAwc0lKUU0zZnhKazJXMEt2ZUloU1hpWWZj?=
 =?utf-8?B?U2lNZkNHNVEvUjdROHlScFhjbjR5ODJEaG9XNm9mbkR6ZncwL3R3TEs3ZjNl?=
 =?utf-8?B?TklKVi9FUFdCVHVhTVBQTUhPakIwWDI2aWViSnpZdWhVY1NFVFFneGs0SG5l?=
 =?utf-8?B?SHJ6UUlLY3NEVnUwcE1zT1pRZ2ZmWjU4SHVhckNhVGcwSUFzTkhRYTdCQURx?=
 =?utf-8?B?bTFhRFg5ZXQzWUNHOUd4SWo5cTEza1dJcWQ0T2J3UkFjVUEvZ3VVa1NyN3BE?=
 =?utf-8?B?SCt2eEUvQ2haYk9QWVVGV3dDcWVXaWpuWGRLOTJwMkFSUEl0RnExODBLdWpH?=
 =?utf-8?B?R1RuLy9JWGpWZWpvMnY2dW5RWDl1dEV0cmJZYnBpdUdHVUViaUczMlFGWkxi?=
 =?utf-8?B?dFZHNERyaUJvcTFQaEJQbWxyNkYwRzlNY2dmRmtib2h2MHFXN3RzcDZ0UktI?=
 =?utf-8?B?S3lOUkNQdW5QbnRLRm5DYkpsVld5WjBHMkt3TGI2UmRNcnowb3hzeGhFaVJz?=
 =?utf-8?B?ZTlLYXd3TitJOE52UjhKcXE1Z3RTUHpYZCs3Zks3YVYrbTZmNWh4UnF0aDlF?=
 =?utf-8?B?c2d3cTlhUys4WFhhaXBCb3MrQVJzc3o1ZU9STW5EZ1pab0pSZWkrbFg0dDlW?=
 =?utf-8?B?Z1hRUzh0dC9pT256Zk0yMExsUmwzVnNqaUNwZmhINVlITGdzZHBhNElMdFlr?=
 =?utf-8?B?UUpqYldRaHRDTU52LzZtc3Q1M0VwcGpYTXJ0aFBiaUZPQms1NDNhaXZSMFpT?=
 =?utf-8?B?R3lrRklROGZ1Yy9WM3I4bVpLV0VSSGtZb2JjWE9DWlhaczFkUkhIVTFBWGZU?=
 =?utf-8?B?OTZvcnk3YU44NFZYZ05QaXBkd0Z2SjRwVnJNenJEZWJqcS9mKzN1SmFEQkJa?=
 =?utf-8?B?QnBjRDFWQVAvZDlJRlZrVDBVN0JmWldpMUZJVUxLN1k5NmROZDJLUW90SDhB?=
 =?utf-8?B?eXdaKzk1QUxGOElDRFRydlNjaFBOYVlTYWdUbTlwWkxCaFBOcGk5cHVMUis4?=
 =?utf-8?B?OHpxU0dTV0Nzc1VVeUlROUZRODB3UDE5NmlCTHdhZWt4TjhkNnMrb2FnSUJO?=
 =?utf-8?B?T3k4dnJUMGJKZjg5L1ZzZFpRSGhwQU5QZFNQRENxLzhEdUplZkRib2ExRTVK?=
 =?utf-8?B?NllJZDExekh1aXE2ckRuWmxzTUlhbWtmb0RjaXRkNGxxeDB1bVMrNW9nZUVX?=
 =?utf-8?B?K3VDeGJXK3Fnek9yZ2ZJVENPNmMrZHo3am1DaGhORWg0M3IvUCs3ZFQ0eTkz?=
 =?utf-8?B?QVNRcEdMRzZlZkJMNTdPRDRRT05TQytPeVVCZ3k5SCthaGNhYU5rbTljRENE?=
 =?utf-8?B?RkIzQ29TZmNIdmFjSDlOOE85MUxaak5EUTZycGFJaC9RRk9vOE1QbVE0Uytr?=
 =?utf-8?B?Mm00emFDNVhvNnA4ZFkwb2xhaHNISEl4WGNpN3lmWWdGZkMwckRycCtYS3lB?=
 =?utf-8?B?alNhMUFrWmM5akltaWk4WFJnb1AwbVd2UDNhblRpUlVsLzcvNDN6VzE4bDlz?=
 =?utf-8?B?WTAvOHI3czF2c3I4cVJnSXh0REUrSkFERW9Qb2UrUi9QaWJXNEsxM1lUakFs?=
 =?utf-8?Q?dQTwwz0aCbERncdLLrylJyqMzti2Ybp3f89fg=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230035)(82310400021)(1800799019)(34020700011)(36860700008)(35042699017)(376009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 07:58:24.4181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f840c506-c20d-4039-e328-08dc8c47c458
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB9984

SGkgSnVsaWVuLA0KDQo+IE9uIDEzIEp1biAyMDI0LCBhdCAxMjozMSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSwNCj4gDQo+IE9uIDExLzA2LzIwMjQgMTM6
NDIsIE1pY2hhbCBPcnplbCB3cm90ZToNCj4+PiBXZSB3b3VsZCBsaWtlIHRoaXMgc2VyaWUgdG8g
YmUgaW4gWGVuIDQuMTksIHRoZXJlIHdhcyBhIG1pc3VuZGVyc3RhbmRpbmcgb24gb3VyIHNpZGUg
YmVjYXVzZSB3ZSB0aG91Z2h0DQo+Pj4gdGhhdCBzaW5jZSB0aGUgc2VyaWUgd2FzIHNlbnQgYmVm
b3JlIHRoZSBsYXN0IHBvc3RpbmcgZGF0ZSwgaXQgY291bGQgaGF2ZSBiZWVuIGEgY2FuZGlkYXRl
IGZvciBtZXJnaW5nIGluIHRoZQ0KPj4+IG5ldyByZWxlYXNlLCBpbnN0ZWFkIGFmdGVyIHNwZWFr
aW5nIHdpdGggSnVsaWVuIGFuZCBPbGVrc2lpIHdlIGFyZSBub3cgYXdhcmUgdGhhdCB3ZSBuZWVk
IHRvIHByb3ZpZGUgYQ0KPj4+IGp1c3RpZmljYXRpb24gZm9yIGl0cyBwcmVzZW5jZS4NCj4+PiAN
Cj4+PiBQcm9zIHRvIHRoaXMgc2VyaWUgaXMgdGhhdCB3ZSBhcmUgY2xvc2luZyB0aGUgY2lyY2xl
IGZvciBzdGF0aWMgc2hhcmVkIG1lbW9yeSwgYWxsb3dpbmcgaXQgdG8gdXNlIG1lbW9yeSBmcm9t
DQo+Pj4gdGhlIGhvc3Qgb3IgZnJvbSBYZW4sIGl0IGlzIGFsc28gYSBmZWF0dXJlIHRoYXQgaXMg
bm90IGVuYWJsZWQgYnkgZGVmYXVsdCwgc28gaXQgc2hvdWxkIG5vdCBjYXVzZSB0b28gbXVjaA0K
Pj4+IGRpc3J1cHRpb24gaW4gY2FzZSBvZiBhbnkgYnVncyB0aGF0IGVzY2FwZWQgdGhlIHJldmll
dywgaG93ZXZlciB3ZeKAmXZlIHRlc3RlZCBtYW55IGNvbmZpZ3VyYXRpb25zIGZvciB0aGF0DQo+
Pj4gd2l0aC93aXRob3V0IGVuYWJsaW5nIHRoZSBmZWF0dXJlIGlmIHRoYXQgY2FuIGJlIGFuIGFk
ZGl0aW9uYWwgdmFsdWUuDQo+Pj4gDQo+Pj4gQ29uczogd2UgYXJlIHRvdWNoaW5nIHNvbWUgY29t
bW9uIGNvZGUgcmVsYXRlZCB0byBwMm0sIGJ1dCBhbHNvIHRoZXJlIHRoZSBpbXBhY3Qgc2hvdWxk
IGJlIG1pbmltYWwgYmVjYXVzZQ0KPj4+IHRoZSBuZXcgY29kZSBpcyBzdWJqZWN0IHRvIGwyIGZv
cmVpZ24gbWFwcGluZyAodG8gYmUgY29uZmlybWVkIG1heWJlIGZyb20gYSBwMm0gZXhwZXJ0IGxp
a2UgSnVsaWVuKS4NCj4+PiANCj4+PiBUaGUgY29tbWVudHMgb24gcGF0Y2ggMyBvZiB0aGlzIHNl
cmllIGFyZSBhZGRyZXNzZWQgYnkgdGhpcyBwYXRjaDoNCj4+PiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoLzIwMjQwNTI4MTI1NjAzLjI0Njc2NDAt
MS1sdWNhLmZhbmNlbGx1QGFybS5jb20vDQo+Pj4gQW5kIHRoZSBzZXJpZSBpcyBmdWxseSByZXZp
ZXdlZC4NCj4+PiANCj4+PiBTbyBvdXIgcmVxdWVzdCBpcyB0byBhbGxvdyB0aGlzIHNlcmllIGlu
IDQuMTksIE9sZWtzaWksIEFSTSBtYWludGFpbmVycywgZG8geW91IGFncmVlIG9uIHRoYXQ/DQo+
PiBBcyBhIG1haW4gcmV2aWV3ZXIgb2YgdGhpcyBzZXJpZXMgSSdtIG9rIHRvIGhhdmUgdGhpcyBz
ZXJpZXMgaW4uIEl0IGlzIG5pY2VseSBlbmNhcHN1bGF0ZWQgYW5kIHRoZSBmZWF0dXJlIGl0c2Vs
Zg0KPj4gaXMgc3RpbGwgaW4gdW5zdXBwb3J0ZWQgc3RhdGUuIEkgZG9uJ3QgZm9yZXNlZSBhbnkg
aXNzdWVzIHdpdGggaXQuDQo+IA0KPiBUaGVyZSBhcmUgY2hhbmdlcyBpbiB0aGUgcDJtIGNvZGUg
YW5kIHRoZSBtZW1vcnkgYWxsb2NhdGlvbiBmb3IgYm9vdCBkb21haW5zLiBTbyBpcyBpdCByZWFs
bHkgZW5jYXBzdWxhdGVkPw0KPiANCj4gRm9yIG1lIHRoZXJlIGFyZSB0d28gcmlza3M6DQo+ICog
cDJtIChhbHJlYWR5IG1lbnRpb25lZCBieSBMdWNhKTogV2UgbW9kaWZ5IHRoZSBjb2RlIHRvIHB1
dCBmb3JlaWduIG1hcHBpbmcuIFRoZSB3b3JzZSB0aGF0IGNhbiBoYXBwZW4gaWYgd2UgZG9uJ3Qg
cmVsZWFzZSB0aGUgZm9yZWlnbiBtYXBwaW5nLiBUaGlzIHdvdWxkIG1lYW4gdGhlIHBhZ2Ugd2ls
bCBub3QgYmUgZnJlZWQuIEFGQUlLLCB3ZSBkb24ndCBleGVyY2lzZSB0aGlzIHBhdGggaW4gdGhl
IENJLg0KPiAqIGRvbWFpbiBhbGxvY2F0aW9uOiBUaGlzIG1haW5seSBsb29rIGxpa2UgcmVmYWN0
b3JpbmcuIEFuZCB0aGUgcGF0aCBpcyBleGVyY2lzZWQgaW4gdGhlIENJLg0KPiANCj4gU28gSSBh
bSBub3QgY29uY2VybmVkIHdpdGggdGhlIGRvbWFpbiBhbGxvY2F0aW9uIG9uZS4gQEx1Y2EsIHdv
dWxkIGl0IGJlIHBvc3NpYmxlIHRvIGRldGFpbCBob3cgZGlkIHlvdSB0ZXN0IHRoZSBmb3JlaWdu
IHBhZ2VzIHdlcmUgcHJvcGVybHkgcmVtb3ZlZD8NCg0KU28gYXQgZmlyc3Qgd2UgdGVzdGVkIHRo
ZSBjb2RlLCB3aXRoL3dpdGhvdXQgdGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGZlYXR1cmUgZW5h
YmxlZCwgY3JlYXRpbmcvZGVzdHJveWluZyBndWVzdCBmcm9tIERvbTAgYW5kIGNoZWNraW5nIHRo
YXQgZXZlcnl0aGluZw0Kd2FzIG9rLg0KDQpBZnRlciBhIGNoYXQgb24gTWF0cml4IHdpdGggSnVs
aWVuIGhlIHN1Z2dlc3RlZCB0aGF0IHVzaW5nIGEgdmlydGlvLW1taW8gZGlzayB3YXMgYmV0dGVy
IHRvIHN0cmVzcyBvdXQgdGhlIGZvcmVpZ24gbWFwcGluZyBsb29raW5nIGZvcg0KcmVncmVzc2lv
bnMuDQoNCkx1Y2tpbHkgSeKAmXZlIGZvdW5kIHRoaXMgc2xpZGUgZGVjayBmcm9tIEBPbGVrc2Fu
ZHI6IGh0dHBzOi8vc3RhdGljLmxpbmFyby5vcmcvY29ubmVjdC9sdmMyMS9wcmVzZW50YXRpb25z
L2x2YzIxLTMxNC5wZGYNCg0KU28gSSBkaWQgYSBzZXR1cCB1c2luZyBmdnAtYmFzZSwgaGF2aW5n
IGEgZGlzayB3aXRoIHR3byBwYXJ0aXRpb25zIGNvbnRhaW5pbmcgRG9tMCByb290ZnMgYW5kIERv
bVUgcm9vdGZzLCBEb20wIHNlZXMNCnRoaXMgZGlzayB1c2luZyBWaXJ0SU8gYmxvY2suDQoNClRo
ZSBEb20wIHJvb3RmcyBjb250YWlucyB0aGUgdmlydGlvLWRpc2sgYmFja2VuZDogaHR0cHM6Ly9n
aXRodWIuY29tL3hlbi10cm9vcHMvdmlydGlvLWRpc2sNCg0KQW5kIHRoZSBEb21VIFhMIGNvbmZp
Z3VyYXRpb24gaXMgdXNpbmcgdGhlc2UgcGFyYW1ldGVyczoNCg0KY21kbGluZT0iY29uc29sZT1o
dmMwIHJvb3Q9L2Rldi92ZGEgcnciDQpkaXNrID0gWycvZGV2L3ZkYTIscmF3LHh2ZGEsdyxzcGVj
aWZpY2F0aW9uPXZpcnRpb+KAmV0NCg0KUnVubmluZyB0aGUgc2V0dXAgYW5kIGNyZWF0aW5nL2Rl
c3Ryb3lpbmcgYSBjb3VwbGUgb2YgdGltZXMgdGhlIGd1ZXN0IGlzIG5vdCBzaG93aW5nIHJlZ3Jl
c3Npb25zLCBoZXJlIGFuIGV4YW1wbGUgb2YgdGhlIG91dHB1dDoNCg0Kcm9vdEBmdnAtYmFzZTov
b3B0L3h0cC9ndWVzdHMvbGludXgtZ3Vlc3RzIyB4bCBjcmVhdGUgLWMgbGludXgtZXh0LWFybTY0
LXN0cmVzc3Rlc3RzLXJvb3Rmcy5jZmcNClBhcnNpbmcgY29uZmlnIGZyb20gbGludXgtZXh0LWFy
bTY0LXN0cmVzc3Rlc3RzLXJvb3Rmcy5jZmcNCm1haW46IHJlYWQgZnJvbnRlbmQgZG9taWQgMg0K
ICBJbmZvOiBjb25uZWN0ZWQgdG8gZG9tMg0KDQpkZW11X3NlcV9uZXh0OiA+WEVOU1RPUkVfQVRU
QUNIRUQNCmRlbXVfc2VxX25leHQ6IGRvbWlkID0gMg0KZGVtdV9zZXFfbmV4dDogZGV2aWQgPSA1
MTcxMg0KZGVtdV9zZXFfbmV4dDogZmlsZW5hbWVbMF0gPSAvZGV2L3ZkYTINCmRlbXVfc2VxX25l
eHQ6IHJlYWRvbmx5WzBdID0gMA0KZGVtdV9zZXFfbmV4dDogYmFzZVswXSAgICAgPSAweDIwMDAw
MDANCmRlbXVfc2VxX25leHQ6IGlycVswXSAgICAgID0gMzMNCmRlbXVfc2VxX25leHQ6ID5YRU5F
VlRDSE5fT1BFTg0KZGVtdV9zZXFfbmV4dDogPlhFTkZPUkVJR05NRU1PUllfT1BFTg0KZGVtdV9z
ZXFfbmV4dDogPlhFTkRFVklDRU1PREVMX09QRU4NCmRlbXVfc2VxX25leHQ6ID5YRU5HTlRUQUJf
T1BFTg0KZGVtdV9pbml0aWFsaXplOiAxIHZDUFUocykNCmRlbXVfc2VxX25leHQ6ID5TRVJWRVJf
UkVHSVNURVJFRA0KZGVtdV9zZXFfbmV4dDogaW9zZXJ2aWQgPSAwDQpkZW11X3NlcV9uZXh0OiA+
UkVTT1VSQ0VfTUFQUEVEDQpkZW11X3NlcV9uZXh0OiBzaGFyZWRfaW9wYWdlID0gMHg3ZjgwYzU4
MDAwDQpkZW11X3NlcV9uZXh0OiA+U0VSVkVSX0VOQUJMRUQNCmRlbXVfc2VxX25leHQ6ID5QT1JU
X0FSUkFZX0FMTE9DQVRFRA0KZGVtdV9zZXFfbmV4dDogPkVWVENITl9QT1JUU19CT1VORA0KZGVt
dV9zZXFfbmV4dDogVkNQVTA6IDMgLT4gNg0KZGVtdV9yZWdpc3Rlcl9tZW1vcnlfc3BhY2U6IDIw
MDAwMDAgLSAyMDAwMWZmDQogIEluZm86ICh2aXJ0aW8vbW1pby5jKSB2aXJ0aW9fbW1pb19pbml0
OjE2NTogdmlydGlvLW1taW8uZGV2aWNlcz0weDIwMEAweDIwMDAwMDA6MzMNCmRlbXVfc2VxX25l
eHQ6ID5ERVZJQ0VfSU5JVElBTElaRUQNCmRlbXVfc2VxX25leHQ6ID5JTklUSUFMSVpFRA0KSU8g
cmVxdWVzdCBub3QgcmVhZHkNCihYRU4pIGQydjAgVW5oYW5kbGVkIFNNQy9IVkM6IDB4ODQwMDAw
NTANCihYRU4pIGQydjAgVW5oYW5kbGVkIFNNQy9IVkM6IDB4ODYwMGZmMDENCihYRU4pIGQydjA6
IHZHSUNEOiBSQVogb24gcmVzZXJ2ZWQgcmVnaXN0ZXIgb2Zmc2V0IDB4MDAwMDBjDQooWEVOKSBk
MnYwOiB2R0lDRDogdW5oYW5kbGVkIHdvcmQgd3JpdGUgMHgwMDAwMDBmZmZmZmZmZiB0byBJQ0FD
VElWRVI0DQooWEVOKSBkMnYwOiB2R0lDUjogU0dJOiB1bmhhbmRsZWQgd29yZCB3cml0ZSAweDAw
MDAwMGZmZmZmZmZmIHRvIElDQUNUSVZFUjANClsgICAgMC4wMDAwMDBdIEJvb3RpbmcgTGludXgg
b24gcGh5c2ljYWwgQ1BVIDB4MDAwMDAwMDAwMCBbMHg0MTBmZDBmMF0NClsgICAgMC4wMDAwMDBd
IExpbnV4IHZlcnNpb24gNi4xLjI1IChsdWNmYW4wMUBlMTI1NzcwKSAoYWFyY2g2NC1wb2t5LWxp
bnV4LWdjYyAoR0NDKSAxMi4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzKSAyLjQwLjIwMjMwMTE5
KSAjNCBTTVAgUFJFRU1QVCBUaHUgSnVuIDEzIDIxOjU1OjA2IFVUQyAyMDI0DQpbICAgIDAuMDAw
MDAwXSBNYWNoaW5lIG1vZGVsOiBYRU5WTS00LjE5DQpbICAgIDAuMDAwMDAwXSBYZW4gNC4xOSBz
dXBwb3J0IGZvdW5kDQpbICAgIDAuMDAwMDAwXSBlZmk6IFVFRkkgbm90IGZvdW5kLg0KWyAgICAw
LjAwMDAwMF0gTlVNQTogTm8gTlVNQSBjb25maWd1cmF0aW9uIGZvdW5kDQoNClsuLi5dDQoNClsg
ICAgMC43Mzc3NThdIHZpcnRpb19ibGsgdmlydGlvMDogMS8wLzAgZGVmYXVsdC9yZWFkL3BvbGwg
cXVldWVzDQpkZW11X2RldGVjdF9tYXBwaW5nc19tb2RlbDogVXNlIGZvcmVpZ24gbWFwcGluZyAo
YWRkciAweDVkNjYwMDAwKQ0KWyAgICAwLjc2NDI1OF0gdmlydGlvX2JsayB2aXJ0aW8wOiBbdmRh
XSA3NDcwOTQgNTEyLWJ5dGUgbG9naWNhbCBibG9ja3MgKDM4MyBNQi8zNjUgTWlCKQ0KWyAgICAw
Ljc4MTg2Nl0gSW52YWxpZCBtYXhfcXVldWVzICg0KSwgd2lsbCB1c2UgZGVmYXVsdCBtYXg6IDEu
DQoNClsuLi5dDQoNCklOSVQ6IEVudGVyaW5nIHJ1bmxldmVsOiA1DQpDb25maWd1cmluZyBuZXR3
b3JrIGludGVyZmFjZXMuLi4gaXA6IFNJT0NHSUZGTEFHUzogTm8gc3VjaCBkZXZpY2UNClN0YXJ0
aW5nIHN5c2xvZ2Qva2xvZ2Q6IGRvbmUNCg0KUG9reSAoWW9jdG8gUHJvamVjdCBSZWZlcmVuY2Ug
RGlzdHJvKSA0LjIuMSBzdHJlc3Nyb290ZnMgL2Rldi9odmMwDQoNCnN0cmVzc3Jvb3RmcyBsb2dp
bjogWyAgIDYyLjU5MzQ0MF0gY2ZnODAyMTE6IGZhaWxlZCB0byBsb2FkIHJlZ3VsYXRvcnkuZGIN
Cg0KUG9reSAoWW9jdG8gUHJvamVjdCBSZWZlcmVuY2UgRGlzdHJvKSA0LjIuMSBzdHJlc3Nyb290
ZnMgL2Rldi9odmMwDQoNCnN0cmVzc3Jvb3RmcyBsb2dpbjogcm9vdA0Kcm9vdEBzdHJlc3Nyb290
ZnM6fiMgbHMgLw0KYmluICAgICAgICAgZXRjICAgICAgICAgbG9zdCtmb3VuZCAgcHJvYyAgICAg
ICAgc3lzICAgICAgICAgdmFyDQpib290ICAgICAgICBob21lICAgICAgICBtZWRpYSAgICAgICBy
dW4gICAgICAgICB0bXANCmRldiAgICAgICAgIGxpYiAgICAgICAgIG1udCAgICAgICAgIHNiaW4g
ICAgICAgIHVzcg0Kcm9vdEBzdHJlc3Nyb290ZnM6fiMNCg0KWy4uLl0NCg0Kcm9vdEBmdnAtYmFz
ZTovb3B0L3h0cC9ndWVzdHMvbGludXgtZ3Vlc3RzIyB4bCBkZXN0cm95IDINCiAgRXJyb3I6IHJl
YWRpbmcgZnJvbnRlbmQgc3RhdGUgZmFpbGVkDQoNCm1haW46IGxvc3QgY29ubmVjdGlvbiB0byBk
b20yDQpkZW11X3RlYXJkb3duOiA8SU5JVElBTElaRUQNCmRlbXVfdGVhcmRvd246IDxERVZJQ0Vf
SU5JVElBTElaRUQNCmRlbXVfZGVyZWdpc3Rlcl9tZW1vcnlfc3BhY2U6IDIwMDAwMDANCmRlbXVf
dGVhcmRvd246IDxFVlRDSE5fUE9SVFNfQk9VTkQNCmRlbXVfdGVhcmRvd246IDxQT1JUX0FSUkFZ
X0FMTE9DQVRFRA0KZGVtdV90ZWFyZG93bjogVkNQVTA6IDYNCmRlbXVfdGVhcmRvd246IDxTRVJW
RVJfRU5BQkxFRA0KZGVtdV90ZWFyZG93bjogPFJFU09VUkNFX01BUFBFRA0KZGVtdV90ZWFyZG93
bjogPFNFUlZFUl9SRUdJU1RFUkVEDQpkZW11X3RlYXJkb3duOiA8WEVOR05UVEFCX09QRU4NCmRl
bXVfdGVhcmRvd246IDxYRU5ERVZJQ0VNT0RFTF9PUEVODQpkZW11X3RlYXJkb3duOiA8WEVORk9S
RUlHTk1FTU9SWV9PUEVODQpkZW11X3RlYXJkb3duOiA8WEVORVZUQ0hOX09QRU4NCmRlbXVfdGVh
cmRvd246IDxYRU5TVE9SRV9BVFRBQ0hFRA0KICBJbmZvOiBkaXNjb25uZWN0ZWQgZnJvbSBkb20y
DQoNCnJvb3RAZnZwLWJhc2U6L29wdC94dHAvZ3Vlc3RzL2xpbnV4LWd1ZXN0cyMgeGwgbGlzdA0K
TmFtZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJRCAgIE1lbSBWQ1BV
cyAgICAgIFN0YXRlICAgVGltZShzKQ0KRG9tYWluLTAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMCAgMTAyNCAgICAgMiAgICAgci0tLS0tICAgICAgNjYuNg0Kcm9vdEBmdnAt
YmFzZTovb3B0L3h0cC9ndWVzdHMvbGludXgtZ3Vlc3RzIw0KDQoNCkNoZWVycywNCkx1Y2ENCg0K

