Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F668ACAE6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 12:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709874.1108892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryr5J-0002Xf-UI; Mon, 22 Apr 2024 10:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709874.1108892; Mon, 22 Apr 2024 10:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryr5J-0002Uc-RF; Mon, 22 Apr 2024 10:39:41 +0000
Received: by outflank-mailman (input) for mailman id 709874;
 Mon, 22 Apr 2024 10:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyNC=L3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ryr5J-0002UW-4P
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 10:39:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ec7ec92-0094-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 12:39:39 +0200 (CEST)
Received: from DU2PR04CA0251.eurprd04.prod.outlook.com (2603:10a6:10:28e::16)
 by PAWPR08MB9733.eurprd08.prod.outlook.com (2603:10a6:102:2e6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 10:39:33 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::d7) by DU2PR04CA0251.outlook.office365.com
 (2603:10a6:10:28e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Mon, 22 Apr 2024 10:39:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Mon, 22 Apr 2024 10:39:32 +0000
Received: ("Tessian outbound 01a47eb2eb85:v313");
 Mon, 22 Apr 2024 10:39:32 +0000
Received: from 226ed55d2e1a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 83CD5A4A-CB93-4845-95B3-D1F05BEB8114.1; 
 Mon, 22 Apr 2024 10:39:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 226ed55d2e1a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Apr 2024 10:39:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB6457.eurprd08.prod.outlook.com (2603:10a6:10:23e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Mon, 22 Apr
 2024 10:39:17 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7472.044; Mon, 22 Apr 2024
 10:39:17 +0000
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
X-Inumbo-ID: 9ec7ec92-0094-11ef-909a-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=gw6AzCmpOHUvvwNTGms7DlyiPm/GyOFEoqvNV1Rexfe0Yu0Uss7d/pyr1h+r1+kywQyYsle244ScoF7K4R2nNL7B3s9qL+EOmSfhrT+c9xYeRN/EgIKEUddkPUP+7R0PwQ69M+4pj6XoOxvdq9MG9eVada0PFhRa4QZ4GL4Y1cKpCGs29cRLVqxTfUiD2Tdf18VrzvSjBfP0MHiPujHupHfC6QeON3c9ZkX6cdYpx8nAYO4ACEvx/V1K3+ljYuO+zF+S6pcjb9W7uspzqiboAvMw6FmVfWUzVmTrq/MkwOpwo+NWEhjS9L/kJXoyIWWD8335EQwfP1dhPiX7U8VScQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v/ppRaU0YydfhYEfWAoxvpWf2KNMcWrRVS9hN2aAw8=;
 b=gmvPrRVDTFC9bKVzUhUSFFR8QOZh4TXkqha6WpmXBhMvgQ1jjy3DzDd5eZ7p00FyV5A4io9VcYMnYKd26RogcpRUD5Mww5Vv2uc5MN4bYUKzvVKbTRMN9wLI5ya4xw86bS4cr0Ko75QYCbd8pTSu9t4NrkSrAHEMVVg9sco/vAjuf6RqcpZH6DWX39cKa6syxbj809btVWGFeZWaNFXD/UDt4awfTs1ujAp4C/oPJkN6vC/2A1LgwOni92GTvn/S9MCj3ELNbawSZka2rMrte0mXizBDHjWT72dtNhDhy+lsb7qoZfjf/zpdUm0+vmx1b5CV4VS+VeDOo8UmGXAWMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v/ppRaU0YydfhYEfWAoxvpWf2KNMcWrRVS9hN2aAw8=;
 b=W7/joO90T9iNaWJdVhZYNvb7jPObwO90/ixoas8njal88nMl6WVtjVLlUPZX7zTYq9PWKYhBvpnKqz7dqp6VFrnWbkFX6lrxr0JSf3kGkLmKpCYLx9OftFDQwmsr8vC8kIPS4PMtyQhrx8BAI4Ji0rVthZx/yQWVAkxVVa7ujM8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4b93ee587c37457
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3kUToOoRkvyO0v5MsTcrYapCCeAK4uqJE9OAQHN7B5gI7ypk2UVeKchOSPv1UDOrRr8HkKWE5H9qQD/tQ8F+ie/lkTCQVMDgQY75dOF0L4Irqfb3CO723lIexkmNXwLpdM70KiqRpnvXvyKLwbzYSJOjJx2SUXU5/OfDQDxyEuCapyCjD98sFJGrXm0zuetuLFcHRT9nOXmx8UeU+HYUAzBpoCIHmREpLsrkjBxPlLgPa9mj3ZkPzYlBXMykhQhLxICiVeji0JdTeUNCWfMr2o5rJMK2bOFNWURxdLIY4H/4r3+yg2gXhCV/bLkz2Jib9i2Z+RCCSCQ1QFsJ7fDIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/v/ppRaU0YydfhYEfWAoxvpWf2KNMcWrRVS9hN2aAw8=;
 b=cPe9SUeZe2idl99R0uMIQA3QQoHCTxBLq/yp5SgJzKQMGHzCc4ioyD7Ae7Lng+mZj5SXVwk7Elius4jOkyjRquEseR0mbbAiuDen/lKDxQcynBjl+zm5MoXUy2Znl44vIyniyoe0atOfTUSMUlkulusTaqT+gINAmZV/Cy/yONUU58Iqr7SylQZRamOFFckfLkdys2b7Pj1rj5cQwvaQRLYhQmBso/KgVFa3Q8NnJbAzzVl2zNNtnt598T5sK4EdFnhyEBD/qUnzMh5+j74YMThUOaBj3ot7Bl09z2tQjSC4fwVD7C+vVnKBdMNMQ+QSCJSp2ryAovjaHQSExIezaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/v/ppRaU0YydfhYEfWAoxvpWf2KNMcWrRVS9hN2aAw8=;
 b=W7/joO90T9iNaWJdVhZYNvb7jPObwO90/ixoas8njal88nMl6WVtjVLlUPZX7zTYq9PWKYhBvpnKqz7dqp6VFrnWbkFX6lrxr0JSf3kGkLmKpCYLx9OftFDQwmsr8vC8kIPS4PMtyQhrx8BAI4Ji0rVthZx/yQWVAkxVVa7ujM8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Topic: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Index: AQHakWRKhhfM1dXXeUO6IItBh4LVR7Fz8i4AgAADG4CAABZagIAAD/UAgAAENgA=
Date: Mon, 22 Apr 2024 10:39:17 +0000
Message-ID: <A2E35819-9A67-4B6D-AA9F-DD3A8D618C9C@arm.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
 <20240418073652.3622828-13-luca.fancellu@arm.com>
 <a46e7e41-cbb8-44e8-9c69-533b949f6a4a@amd.com>
 <9A107B24-E606-4926-BE1C-6FC0C6E86CF7@arm.com>
 <f7318988-85fa-4a40-8242-67db3305a397@amd.com>
 <5de5dec4-7e2a-4e96-84c6-214ad781562a@xen.org>
In-Reply-To: <5de5dec4-7e2a-4e96-84c6-214ad781562a@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB6457:EE_|DB1PEPF000509F7:EE_|PAWPR08MB9733:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ee5a45-bbb5-4273-a061-08dc62b87ef6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VzZSVmZ4TThHNmxEUVd1bHhDK2xYUWhma3VZdXE5RVQzYThDajBsMFppS3BK?=
 =?utf-8?B?KzRHSTREQ3A1b21nYkUwN1Z6czYxcmlWYlBHdTlvUW5LNmlaOGg2dG13SzJ1?=
 =?utf-8?B?c01EY2xIa2kyUVZLMzhseGpDWWg0S0VQNFI5M21TRTVZekJlbS84azQ0Z25J?=
 =?utf-8?B?TFFWTmtSd2daTmxCZiswV0ZJRTBZRVhBd0JjZzNUZ2IvcEtVYzVpc2pQSE9H?=
 =?utf-8?B?UE9TZEVrL3VKb0xseXJQc2MzeGNrWTg2NkdNaFZzcWxMSDJxWlFSaUZsMTZ4?=
 =?utf-8?B?UEl0NVVmNVhYWndab3h4NnJ5UkcxRUphZXR5TlhQby9sNzhBS2pucGRTMEM1?=
 =?utf-8?B?RWxvWjFoRVpQWXNOWVdhZEc0VElQMTBwOHdKMmNHUlVydmFNbC85T21WRVNZ?=
 =?utf-8?B?dC93S2RTek1leWdzd3RaRHRkRkp5ZTdPbWZZcTBmYXZlM3hseDlPeEcySkhI?=
 =?utf-8?B?ZnJpamhRNDJ3K1o4eHRuU1lWNHZMLzY0SmtKZWdJSlFnWmxmOG9FbVB3ZTFE?=
 =?utf-8?B?RllPYkx2Z0FIai9sTS8xOEllYlFubCtsc2RzNjl1UUR5OWQ2MDhMU0hxSTVC?=
 =?utf-8?B?UzY0MVZLZlNScWJHc25GNFdqNVN2d29VbWlEZ25HdU1XSEVhUnh4aHFNWnlm?=
 =?utf-8?B?QTJWNXpEZVF5bVVYTy9IMDBqWDZWQzhlc1MzOW51WDRNUlFNaTZrVURRTXpq?=
 =?utf-8?B?d1g1eWhsUWh3MkVBMy9vUkRaSnJreDc5bE1iK0ZZTU5SbXZya2V3SXFPS0k3?=
 =?utf-8?B?YmRVMEROblRPc1RueEl3emlUOXZMMEZkWmtIN2tCbW5WYmIwL0p0YjdhL0Vs?=
 =?utf-8?B?WG0xZXNJSVFtMXdpbHIwSkxxVGdGU1h1TjFiOUNMN3h5RFlCRjlxM0p3b1J5?=
 =?utf-8?B?OUF3blFmVno3cTF2aG1ZK1l3QmtZUi9WeVU2NTh4SXlFSTlHWHRsL3lNZUdv?=
 =?utf-8?B?Rnl4RGpZcDMrQ2NpNGIyOFlnNDFiNFZQNEhtWXlBR0tnSjdGMVpVSlZPYVdC?=
 =?utf-8?B?RVhnazNiWEFuNVEzZkJxUnkreklrckgxNk5xc1o3NjVmcXlBL1RvT0VBZEhG?=
 =?utf-8?B?aFhFMG1LL2lvNHVvK1d4cjBRby80akk1alZwU3pQMFgzNjJSUGRpNjQwcFpw?=
 =?utf-8?B?Y3l0c0xickFHdVJFMm56TXRhZUpWck1ZL1lFR3g5NXR5L0w1QisvcktiVmZC?=
 =?utf-8?B?MmFheUxPdXptaWdoMDVSYkx4ZHNhQVhSS0o0R2pLU1dTTEZ4UnF2Nm5rQUM2?=
 =?utf-8?B?LzNoTExGaGFsR0NGSWZBdE90NmVNMHR5VTBsMjIrRUZ2M1MvN2R4emdMaEVO?=
 =?utf-8?B?dWpQdFgycWR6VDY3NHhQSkhaQjNML0xhTzlyaXAwL1NFTWlkWGNwUGZUbmNN?=
 =?utf-8?B?QndnbnA2VTlwaTBEYVFYazFhOHNBL0lTRDBDbmZCM0pMTzJMckg0eHQrTzJu?=
 =?utf-8?B?VDZscCtXdHI0MGRGODZoNWc0UGliVld3Tk1kYy92aEt5eWtaYjJWUU5Vcy9H?=
 =?utf-8?B?VUJxOEMxdmtWcTR1bjdrMFFlTk03R0ZhMTlXd0xkcExnRnVyU2pKR2JseTVK?=
 =?utf-8?B?K0V1cUJnWitOOVpXTmg5RW5XRG1TWkR5Zm9ITURxQmtlUlUwRG9Mbmo0QUMv?=
 =?utf-8?B?S1hKWERSajYydVVjNmlNbDJxSE5BdVVqOTVIajcxUEd1OFNmUnZ4MzJtSkJv?=
 =?utf-8?B?L3N1Nkd0dkN1dm1ndXh6QzhBZWx1TFhHaTF1Q0tXQzdldVJkbzh2Ym5qaWZH?=
 =?utf-8?B?U1lFbTVTOTNCQnZzNmJCd2V3YVhSeldzdTlLamxCNkhXRTJsZFJTK0hrd2NH?=
 =?utf-8?B?RVphZ3NxZXBqMGhIZU1ydz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <98014549CBEB7E4EBC953BFF351A5F78@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6457
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5b91b9a-a931-4e87-635f-08dc62b875da
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0o1dE1ncDgxNm5VWUdzSG1CZ2lERFdodXBhcXpNTWVMUHJYWjRLbk5xZEd0?=
 =?utf-8?B?K2lWazBqclRDdTFEZEJzY2VBaDhQWVYrK1BOdE9kNll1NGpnZGtySXowWjhk?=
 =?utf-8?B?ejFWOWVhN0doQkxvREVzUXVmdGdlRmlWcVg4QVNMUDRNdXNSNDdyYVN2L05Z?=
 =?utf-8?B?M0x1eTUxMU1jbUYwaHdEVUJ2OWFPczA5MnlzbnArZVAzMkc0Y2NkMVJsNmFh?=
 =?utf-8?B?ZkYrOFh4dVVaUFRsZ3FQTVc5QStrSjFpZmV3Zmx5RUVjV0tQVElCenUySGs5?=
 =?utf-8?B?dEwyUk42d0JZZldQZ0xCTXZ3anRES09FdE5pR2tIa0UyV3d5cG5nODIxNlgx?=
 =?utf-8?B?aGNJd01UY2JsOEgxekF6SU9yOGVsdlA0WElid1JzdnhMcnhlYXo3SnMvdlB4?=
 =?utf-8?B?R05VcWU1VHU1M0N6ZTNkWUZvS0x2bjFiVytnTTY3TjJoWGR1WlcvdmJjS1di?=
 =?utf-8?B?REFoYTNyaFM5NlBMNFFrM2ZIZXFzZ0J1M0NrK2paRkFmWmlaY01sNjFBek94?=
 =?utf-8?B?TnJOUU5OdXVuYS83YWJyVDlZZlZETkd5UzlmdktMTHNheCs3Vm0zcjZPOWE0?=
 =?utf-8?B?RmRkMVh6R0ZNY2c2dGhJcHc3YVBmdXYzVGxINTFhUzRpUXFVSnZsVm1WRGh1?=
 =?utf-8?B?TG1ENmdXTlp6VE1UWlZxNmwreTVlY0U0Z21EMmxOME9icUN3NVJ2aGpsa2N0?=
 =?utf-8?B?N3pYWW00cThXQkZROXp5Y0lCQkxRVnRJWjFsc1dQYzI4WktoblNvc1VyUERE?=
 =?utf-8?B?ZXhXY3NaejF5STR3RXY1YWYzZ0J1b1V5OWI4MmI2VzA5dlJyOVFSY3ZvUkZK?=
 =?utf-8?B?YU5zK0lmdFRzK2lLZ3VPVzhBdVU4MGVMWTRJdUJmY1FkdWxGS0hGSkJ2dzQ3?=
 =?utf-8?B?Y1FVNVVFekN5TDhrYVFONHBITlAzcUp2UFR2T2txQ3JRak1ZMWxtUWNiSGQ1?=
 =?utf-8?B?ZlhmaU9GYWFIRGZWT2wwclcveTdpaVFsR2VjNzRVZG0zUTNyNXBBcVQwc0w3?=
 =?utf-8?B?bDJLdFpZUU1nalAxUlowTU5NVFFqSUhqV1l6bStBSEtDWVpvSEtXZzRheTE1?=
 =?utf-8?B?bThYNStzK0U1eDU1MHdKTWdtZVVhcEc0NGl2anh0TzZhTmt4QzgwWmc0dHh3?=
 =?utf-8?B?VXFUTC9DckxhbFNReXRFc1RlYUxYamgwWmxQVlR6aW5YVUxlaUQrUzBsOFor?=
 =?utf-8?B?dm1ieWxHczlSRmJzVmY0cnI0TU43YmEyT2lQekRBYWh1Wi9ZamhxQmI2REtB?=
 =?utf-8?B?MytWZG5zdWplMk5lcWg5Qjd4K1RGdks3UHRsWHg3MnlBeC9ybmE4ZUltelZV?=
 =?utf-8?B?YWJDalR3V3FqUDA4bVNxcEZxZ1BiL1hqS2pNQit5T3E1ODdoVWkvOHpxRHUx?=
 =?utf-8?B?UzE5YXgvN0Y4YWdDMHdqdkRFQmNvTlIrRWJQKzkxL3BYaW5FejgxZ0ZTS2F3?=
 =?utf-8?B?OXREL2N2bmJBWnpFVWNWVGZGQVBiSGM3amFZVkkvQm5MWGRJZHpySnEwQ3NY?=
 =?utf-8?B?QzJvWHZLb3FmWEZ4Y1FGSHhXUGw5ZmVyWVhBbWNHZWswTEp4MDlrMlJnR3FM?=
 =?utf-8?B?YVc4djlVVE1yL1AvdC9NTE1EY0p5UUFzQWZGakc1eStJQVhieVJna3k5ak9x?=
 =?utf-8?B?RjF6RmtRNWwrV0ZyUkF3a0Rud0p4a0ZQV2xudXpBbHk4WXVCekRNYmJDRExn?=
 =?utf-8?B?ZG9ndk5tMzlWZUI4VlZobDVoVU13M0x2QmE5YjdVOFRIclU1UWhWTGNjbzFs?=
 =?utf-8?B?UDYrc3BLazVMc0JrSUNjYTNMZkdqV1JTTmZUbGZySE9CTFc5WFF1Rm4zV01n?=
 =?utf-8?B?Ykc4WGNTRnpBK1hCa1VaMDk1UDlsb0MyRFZBbWtQTXluZ2wrVk1Gd2x1VXN2?=
 =?utf-8?Q?9RdVd7Y9STOS6?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 10:39:32.3364
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ee5a45-bbb5-4273-a061-08dc62b87ef6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9733

DQoNCj4gT24gMjIgQXByIDIwMjQsIGF0IDExOjI0LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMjIvMDQvMjAyNCAxMDoyNiwgTWljaGFs
IE9yemVsIHdyb3RlOg0KPj4gT24gMjIvMDQvMjAyNCAxMDowNywgTHVjYSBGYW5jZWxsdSB3cm90
ZToNCj4+PiANCj4+PiANCj4+PiBIaSBNaWNoYWwsDQo+Pj4gDQo+Pj4+PiArICAgIGZvciAoIGNl
bGxzID0gcmVnLCBpID0gMDsgY2VsbHMgPCByZWcgKyBucl9jZWxsczsgaSsrLCBjZWxscyArPSBy
ZWdfc2l6ZSApDQo+Pj4+PiArICAgIHsNCj4+Pj4+ICsgICAgICAgIHU2NCBzdGFydCA9IGR0X3Jl
YWRfbnVtYmVyKGNlbGxzLCBhZGRyY2VsbHMpOw0KPj4+PiBXZSBzaG91bGQgbm8gbG9uZ2VyIHVz
ZSBMaW51eCBkZXJpdmVkIHR5cGVzIGxpa2UgdTY0LiBVc2UgdWludDY0X3QuDQo+Pj4+IA0KPj4+
Pj4gKyAgICAgICAgdTY0IHNpemUgPSBkdF9yZWFkX251bWJlcihjZWxscyArIGFkZHJjZWxscywg
c2l6ZWNlbGxzKTsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAgICAgIGR0X2RwcmludGsoIiAgQmFuayAl
ZDogJSMiUFJJeDY0Ii0+JSMiUFJJeDY0IlxuIiwNCj4+Pj4+ICsgICAgICAgICAgICAgICAgICAg
aSwgc3RhcnQsIHN0YXJ0ICsgc2l6ZSk7DQo+Pj4+IGkgaXMgdW5zaWduZWQgc28gdGhlIGNvcnJl
Y3QgZm9ybWF0IHNwZWNpZmllciBzaG91bGQgYmUgJXUNCj4+PiANCj4+PiBSaWdodCwgc2hvdWxk
IGhhdmUgYmVlbiBtb3JlIGNhcmVmdWwgd2hlbiBjb3B5aW5nIHRoZSBjb2RlIGZyb20gYWJvdmUN
Cj4+PiANCj4+Pj4+IA0KPj4+Pj4gK3ZvaWQgX19pbml0IHNobV9tZW1fbm9kZV9maWxsX3JlZ19y
YW5nZShjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0KPj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2JlMzIgKnJlZywgaW50ICpucl9jZWxscywN
Cj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGFkZHJj
ZWxscywgaW50IHNpemVjZWxscykNCj4+Pj4+ICt7DQo+Pj4+PiArICAgIGNvbnN0IHN0cnVjdCBt
ZW1iYW5rcyAqbWVtID0gJmtpbmZvLT5zaG1fbWVtLmNvbW1vbjsNCj4+Pj4+ICsgICAgdW5zaWdu
ZWQgaW50IGk7DQo+Pj4+PiArICAgIF9fYmUzMiAqY2VsbHM7DQo+Pj4+PiArDQo+Pj4+PiArICAg
IEJVR19PTighbnJfY2VsbHMgfHwgIXJlZyk7DQo+Pj4+PiArDQo+Pj4+PiArICAgIGNlbGxzID0g
JnJlZ1sqbnJfY2VsbHNdOw0KPj4+Pj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IG1lbS0+bnJfYmFu
a3M7IGkrKyApDQo+Pj4+PiArICAgIHsNCj4+Pj4+ICsgICAgICAgIHU2NCBzdGFydCA9IG1lbS0+
YmFua1tpXS5zdGFydDsNCj4+Pj4gZGl0dG8NCj4+PiANCj4+PiBXaWxsIGZpeCwgaGVyZSBwYWRk
cl90IHNob3VsZCBiZSBvayBpc27igJl0IGl0Pw0KPj4geWVzDQo+Pj4gDQo+Pj4+IA0KPj4+PiBS
ZXN0IExHVE06DQo+Pj4+IFJldmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBh
bWQuY29tPg0KPj4+IA0KPj4+IFRoYW5rcywgSSB3aWxsIHNlbmQgdGhlIG5leHQgb25lIHNob3J0
bHkuDQo+PiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGEgbmVlZCB0byByZXNwaW4gdGhlIHdob2xl
IHNlcmllcyBqdXN0IGZvciB0aGVzZSBmaXhlcy4NCj4+IFlvdSBzaG91bGQgd2FpdCBmb3IgdGhl
IGNvbW1pdHRlcnMgb3Bpbmlvbi4NCj4gDQo+IEFGQUlDVCwgdGhlcmUgYXJlIG11bHRpcGxlIGNo
YW5nZXMgcmVxdWVzdGVkIGluIHZhcmlvdXMgbGluZS4gU28gSSB3b3VsZCByYXRoZXIgcHJlZmVy
IGlmIHRoaXMgaXMgcmVzcGlubmVkLg0KPiANCj4gSWYgdGhpcyBpcyB0aGUgb25seSBwYXRjaCB0
aGF0IHJlcXVpcmVzIHRvIGNoYW5nZS4gWW91IGNvdWxkIHNlbmQgYSBuZXcgb25lIGluIHJlcGx5
LXRvIHRoaXMgcGF0Y2guIEkgdGhpbmsgYjQgaXMgY2xldmVyIGVub3VnaCB0byBwaWNrIHVwIHRo
ZSBuZXcgdmVyc2lvbiBpbiB0aGF0IGNhc2UuDQoNCkFsbCB0aGUgb3RoZXIgcGF0Y2hlcyBhcmUg
YWxyZWFkeSByZXZpZXdlZCBieSBNaWNoYWwsIGlmIHlvdSBhZ3JlZSB3aXRoIGhpcyByZXZpZXcg
aXTigJlzIG9rIGZvciBtZSB0byByZXNwaW4gb25seSB0aGlzIG9uZQ0KDQpDaGVlcnMsDQpMdWNh
DQoNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0KPiBKdWxpZW4gR3JhbGwNCg0K

