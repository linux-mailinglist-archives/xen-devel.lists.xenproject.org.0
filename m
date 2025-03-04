Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFAA4DCC8
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 12:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900982.1308968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQcQ-0006xx-TS; Tue, 04 Mar 2025 11:39:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900982.1308968; Tue, 04 Mar 2025 11:39:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQcQ-0006wC-Pc; Tue, 04 Mar 2025 11:39:26 +0000
Received: by outflank-mailman (input) for mailman id 900982;
 Tue, 04 Mar 2025 11:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2zF=VX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpQcO-0006w5-Md
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 11:39:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2606::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50fe03ad-f8ed-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 12:39:22 +0100 (CET)
Received: from AM0PR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::29) by DBBPR08MB6060.eurprd08.prod.outlook.com
 (2603:10a6:10:20a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 11:39:18 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:208:10e:cafe::fd) by AM0PR01CA0088.outlook.office365.com
 (2603:10a6:208:10e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.28 via Frontend Transport; Tue,
 4 Mar 2025 11:39:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Tue, 4 Mar 2025 11:39:17 +0000
Received: ("Tessian outbound c3a902884497:v585");
 Tue, 04 Mar 2025 11:39:16 +0000
Received: from L667afe623bc4.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CCA46CC8-0B51-4155-8775-CD30A09F32E5.1; 
 Tue, 04 Mar 2025 11:39:05 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L667afe623bc4.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 04 Mar 2025 11:39:05 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by VI0PR08MB10681.eurprd08.prod.outlook.com (2603:10a6:800:204::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 11:39:03 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 11:39:03 +0000
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
X-Inumbo-ID: 50fe03ad-f8ed-11ef-9ab4-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=t9uyIgbRpKe/jBiIqoeT9Dltv+nO1GtCINdQtzgOz2fTyru6asVN0mRSNQVFeNLWgHopykUGI+8Dfs+iRjLfwRbpaV/FmYXJliBPqsmlJgYhSlMmCjuPRFkCYIzr0Jgg1Gf2sE49pa6oHQgiEWgztbQfeVFpBjZeJqeNG1TM6SjI08smu9c6m2I8FzNkmxELMpYQX6JGWRIfcTc40mTf2sriYebcvgulai8NYs/IF+kK82NJQWxAeMBw+rC3LGx/P2L/cABMsr+T0Mhiw/qTPOvJACtRwDRsXFwfh25KspxX+Lt9rN2n50GnmFgdprWFeILajldEb8m+LOKEu8lYSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPBj+9q7WavLXy84FpuMkTkd0Wj7tDbK6piRkm98cQ0=;
 b=MPatdXx40/Qm2/guByL884c1HgWRfUj/xgGxQUtaVP6OwD0IpsN67aYV1Z+1FZuKmwFFX6zGEC42nfZaiqdWkH1ipo3rrA0SYYJ3tw5wxILa9DRXwhyEQhsPkKdRz2bntHT6uFze/yHAqQ31R7y0OaEPK799+XxElNZtdDo+9XT/j/esC9Qf+hm3O3KFBZWkeF0nz8tMyfz4PBlnQ0/pO/ZnPoNcpH5Tf1yIsev2coJzn5hOI7VLet101jZT7Pl5uvKVL3VLtmaOxIAFxZkwk2Kq931wF2vTUVLKvPp65WIqArOUCiaR/7IeyWa13PIyd/lQRnZxodZancStNYY3lA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPBj+9q7WavLXy84FpuMkTkd0Wj7tDbK6piRkm98cQ0=;
 b=CX/UnAY+MXCqDdqCrux0hqGPt42rYVMBmefBevKwlD5tx0x6jylC11Bp7v29yKgDT7x+X6XNlbKncgFEIEaPEux+KBNezTywes/TiBf4IgGqnfIT12HesAb8Lr7+O14sVilTOxPzV7m2jfqHICgoM7nLacE0ReYbL/yQMCrp3Xk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f8a3e2ce5f44375e
X-TessianGatewayMetadata: MQAvJRg0cDRT6mEcTB53f0qLLQwYakZCObJ2O9I4kmbuQgnlZeovDXI6rQdmPNm0oyssdBA5JLLb+8l3X8p06OlsNq2gRaSmJ61iWjZFAMSm0W00nHf1n0vg5EQl5bh14bturpL/KunGhnDtimsX2rquTXbKCICjajBDDyX0kgA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyQVCvKaibH8PXxQbgy7mW3YYv7GaLCTUoYezrwYyQRwcGHZoAUtP9mYK121q2+2ix2aOHtngJKoG0/JMsag14MMxW3i4s5sNolpJq9eUr/9LB02/zNP3Taj0677VjFTMMurYqFf6Hfojmvg69LU1q9xZPETXvSaZqeJ0ETVv5SUjrwMTWi8FC8+nbLDtkwYLwRfPkeo7Toc8CVwvNRv2ihUVGzM66NtYUoZX2RNeyqKrmaFJ8QaqwlyLWYo/fMb7KqMXcFEcL6oOyP0RAPQm3yhKmFgegC8W1JlRZodi99joPDPsiK8h0eRdah91f5syY7EMjKF93ok952SJQzDXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPBj+9q7WavLXy84FpuMkTkd0Wj7tDbK6piRkm98cQ0=;
 b=AvJeo+AGcRTYATvCiBACyJm2oWinTinykCB9mw/teOTuiMCyhyGMzArJC4pQ0awXstce5QlnfLnpmeWwwQwtgY+QlIWzvYn2+E6BIHEgOLvzqnGcBI9sYoYIyLmkfjPX0mf9yTMZu+Yhm5/YTud1zYkdeS3hM18ctCcOKRe/OtFbZALHCvLLUAGnMg4UZSkkUDjl7DkQfqhKrzCw07gEQ8uaDVlMYk0Dyl1GPfASNgEXmiAwPeKrcrn4MPa8UzQsOoRyWdyT30gr8auzWxB9VKkjZgWYUrwdPtOOUbxTwwJixCz0yq1vot3zM6tG/kUP5BukI/8ZdC5Hs/KJwAhyPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPBj+9q7WavLXy84FpuMkTkd0Wj7tDbK6piRkm98cQ0=;
 b=CX/UnAY+MXCqDdqCrux0hqGPt42rYVMBmefBevKwlD5tx0x6jylC11Bp7v29yKgDT7x+X6XNlbKncgFEIEaPEux+KBNezTywes/TiBf4IgGqnfIT12HesAb8Lr7+O14sVilTOxPzV7m2jfqHICgoM7nLacE0ReYbL/yQMCrp3Xk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
Thread-Topic: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
Thread-Index: AQHbgerA9DmOxi5W4Eufnv1ogXYtfbNNErSAgAAVW4CAAAFcgIAVxqqA
Date: Tue, 4 Mar 2025 11:39:03 +0000
Message-ID: <769DE9A1-0F3F-4564-9A37-0812ECCA3234@arm.com>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-3-luca.fancellu@arm.com>
 <eeb91fb4-ef2e-4f07-a1b8-1812f0371113@suse.com>
 <1133b3cc-4051-44d9-83ab-88c4c30f260a@amd.com>
 <4b31f272-2bb2-40d8-94d9-8137586b59fa@suse.com>
In-Reply-To: <4b31f272-2bb2-40d8-94d9-8137586b59fa@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|VI0PR08MB10681:EE_|AM2PEPF0001C709:EE_|DBBPR08MB6060:EE_
X-MS-Office365-Filtering-Correlation-Id: 79705bd9-6945-4a10-a62f-08dd5b113250
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?IIjKx3fTkA7buLTdvamB6JGXsu1mIgGaYXv2tQItQUdyjcznCf91KkyhLa8i?=
 =?us-ascii?Q?fvyeXnSZtBNl5scVJnTaCDvkgfCQQwAtw0dpKK+5WCOTElwxKbUNvy7xuPOy?=
 =?us-ascii?Q?GcF6P8Sb8y/DH14CcGwuEnxfsUJstAW+oVdsU5OTZt3W7LctqJN2DXWvM5u7?=
 =?us-ascii?Q?IUz17StB4ngG2Vk96OFo7VlrKM0Q6zfr5IEuo7ANvocySfDY8fKih9nl87f9?=
 =?us-ascii?Q?ESMzFSi+0UTO/+Rs0wWyFfErbR+WxpXTJ9pFvnKEb/wimPTkw3x1MKX1sSf0?=
 =?us-ascii?Q?tqN8xpiAyMjaEVEWKTsKepJIOL9ceLE9BRuQ948WLabjAVqsIuT57FApjX2D?=
 =?us-ascii?Q?GrmEEAGHA6+PeSOFwrPLS7JSi00EM4aJxGuLMLCBhwFMW9XVAbNaXQix+94c?=
 =?us-ascii?Q?2oV97E1M6u6idKUx3SCC1BkPuGTcw0wGux7unrLtjKsn0pmgiKrtmEYBz51O?=
 =?us-ascii?Q?tC3nHPJ+P8Xyasb6mE0fNgqddmb1btHKIcxXiqbKnIsoWrois+aaZ7cL0/u1?=
 =?us-ascii?Q?LrWq8Lp9pBJ2AlvSOw7xQu94F+MrMOS2tltDYxt0exi0b0bptYAp86BTFQ5x?=
 =?us-ascii?Q?vPqBiFj9Vi2J3N4QhlQwIAIrb77ADCPn9Vm0UG9MTHP3+cpN5LkigyZAjG1V?=
 =?us-ascii?Q?MUQRoz32jMr2iFuQjE/vC0Mb/m0TyPEHtPggASAoFoMoyiyBdjOk0N0+nXhu?=
 =?us-ascii?Q?ZFmLQ+7GZ4/l138apNgXido9QvZiAANnQ7My0mVnSB+sStQckxRGHmsrwLkP?=
 =?us-ascii?Q?d0C97xwJyCF72+CSmsQ8CP8WHslUvA5PVFmIfT7w91kBZ2OH4Jq7aB3I6f4R?=
 =?us-ascii?Q?hnGV3r6IHmtu1beV9MPGbgPjyVjmuicu7HJxsf6AP6JtFoVSLIP+mKJR7DSF?=
 =?us-ascii?Q?Duj4crubFM4P/6w71Gut9tMEGVUKIJsnODsqSughfWTUg68IJxwwCGR+OP7q?=
 =?us-ascii?Q?mjhbgphONg/LiiOlMQf6w+jI6Bl77lzpyRsEnnBcq98oSvkaSIzStSo7I5t1?=
 =?us-ascii?Q?A5QR9pen871bKd2hKKz0zZbM8VPUn7SjWyBUzzD/BbhuYIAiyyOfSX6lXPY7?=
 =?us-ascii?Q?T9Ueim83ffGavzlwlpqO8NBkzn2lZxByl5GLlRKoXLtrI2HzFJdtIwHouRpL?=
 =?us-ascii?Q?JcatA6D2O9s67TpRIf3Z4aCNEXA/GW+GTKFcgMUrwYcXwharvEkGZcvSNVkU?=
 =?us-ascii?Q?K/87MQjuVFOC7ujPGdO/5LvjgQrTBKF8A3W5rX/mW+ishthEuevcZk3wJWLK?=
 =?us-ascii?Q?ZNvzOaulL6UAw7v07Wc4NtbLk6Pij2rlSbe4XtnoOXLarfkwfat9lBoGUL6J?=
 =?us-ascii?Q?StNm4cxUScKi+aNqvu73UI0I60h7EJ9xjIChk3cotb6O+vgrozGj62Pc6qxl?=
 =?us-ascii?Q?IG/b2Faa5yEK/wdcG1vrurg8F3vazB3jQiYORqpquiaPrCMneAzyuqattQve?=
 =?us-ascii?Q?UCmWa7wnFGK60VzyVIkIMyEpnKIibf5u?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <92C53C9910CD64428D772122559290C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10681
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9941d2ee-cccf-4a17-a306-08dd5b112a1f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|35042699022|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wuGhjO1eoewuTXbROOHyK8s4hBtRsZ8JaOFjLgOTyzHr+2x+n+3F8NYLDyIx?=
 =?us-ascii?Q?+HfCZF9JkJnact74OlW9GQ+wAVuKzBDBEvhPuyGRJnDa9BcmFe0zm/4dHD/k?=
 =?us-ascii?Q?YQfIVCKKz2dpWi3XfaAwWa8+nXEhb2u/Qu8rzihd3yzQTqGqK0jcYPn2BmJt?=
 =?us-ascii?Q?l8/7yTvSsJUxl9+g9Cr+s3E2Y/E2B6sv92hwYvMgJkA8ic/W6BLrbAq+O4vP?=
 =?us-ascii?Q?1uB76sKjjedHgQFojCbEQTSO4zagNUXCSfF3lTLsjzEKPy6H0pnPqJFn01Hm?=
 =?us-ascii?Q?FdOCmHIj2G6BnnAFMd8iiGoXQMGeUGpP1qVjOjPUq6bWWdFyqctGfuGVbTlr?=
 =?us-ascii?Q?wir5dRlQJ5BSy5y8ZoWNL90FiHgejO1QCEvVnC2Cij4N2awgVf++B8VrIee8?=
 =?us-ascii?Q?nLZYwi4ui9SE8mph8dGAAIvKdO/eGPSwvGhVa9zls4bO4uHdaAkvNx30mYHy?=
 =?us-ascii?Q?6xugki63W+qyQGJlAqq3TYU/q5eXMOuUYthJzIncqjzhKqC8M9P8se1Q1EvK?=
 =?us-ascii?Q?YSaYZs6f6UsMQaOsXODDxmS5uBMo2BYT2HFKF3OD+fcbED4pgKByWToYKhOd?=
 =?us-ascii?Q?bUvf1K3woLAYU9nF23BcJ2U2Ass704KwW49Z7p+GemF+YtCmS1AFtcWyJW1e?=
 =?us-ascii?Q?0AZo0RhFR2sCilyAQe5uFV5ZI4ywZad+ewVguEhEdQkkC9qR+07kwTjR1wHv?=
 =?us-ascii?Q?ARNBFiQrEhs8bqYQj67f51fmnAZL79a7lkLFEEaBmNGAZfzgn559fZnM9V+7?=
 =?us-ascii?Q?gmX0LIVwy5Kdr9m1jE7jk+faDuDstn4j02oX+HFRhD7AAs7Hx0v+T2MeRBVm?=
 =?us-ascii?Q?iAy72zJFAbkA/A+EFCkMpADs843ZADRcmOkHK0fDWkV2CGLU1ixHiBp7P3yX?=
 =?us-ascii?Q?FLJLqxyfqALbOKZPgnlTqt6p5yqvaNUFS08H7MpIUNiF+KuP6sCQV3yi+SmE?=
 =?us-ascii?Q?2fEfAH28u5GVW4wO9FkqmkGbJ/NRrsUFRaSaAUTvPhBH/j0zESpTvIXgaWbq?=
 =?us-ascii?Q?PRFAcsSRR3AbxqJedE3nt2mITgkso2Ktdo5CAL8qtxK7hbXUfWOW8dlG5eiE?=
 =?us-ascii?Q?qFB1kQhgDaQxyYG3r5xxHyQmlfdNporJyW8cGDbuW+W09+NlJdoBS36HO9cR?=
 =?us-ascii?Q?afI44cchV1SPBu1E29r8Fc4mShSxYcrDdHy/rOhXJo4gyY2YukDaYtSrnzqX?=
 =?us-ascii?Q?bY8HWRUupxY6K3wCMb8jGhi+uuxcyIKQtziWqdOVcFqoATrGiqdm12kjLjYa?=
 =?us-ascii?Q?jtovs7I/fux7mkfXy+9TZkhA9OovoUX1PcqUfuMLinAqtsjOWz+e6rMrABS1?=
 =?us-ascii?Q?agRplZf1v+ju16tNNWPfnnAmC7v1fUeye9sjauuFEtwcEv4vaEQPce+zmoKs?=
 =?us-ascii?Q?qa+qpZpvg4Chdr3Q1b0EzF5iySDjd+RAqbBfm237Q65E4qDYAh5IxdS6WMIf?=
 =?us-ascii?Q?IE2p4Nwc/odAQCMWdmbZQ7LzXXLKnniEWNZHI4A0sq8iWmdUpWj8/TOnJ1ca?=
 =?us-ascii?Q?lTUCMzFFc6xGtZA=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(35042699022)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 11:39:17.2727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79705bd9-6945-4a10-a62f-08dd5b113250
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6060

Hi,

> On 18 Feb 2025, at 15:06, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 18.02.2025 16:01, Orzel, Michal wrote:
>> On 18/02/2025 14:44, Jan Beulich wrote:
>>> On 18.02.2025 10:51, Luca Fancellu wrote:
>>>> LLC coloring can be used only on MMU system,
>>>=20
>>> Just for my own education: Why is this?
>> I read this as it refers to the feature we have in Xen, not the generic =
concept.
>> You could in theory achieve cache coloring without MMU using static allo=
cation
>> or some custom allocator but in general we benefit from being able to ma=
p VA
>> to PA aligning with cache coloring scheme.
>=20
> Oh, okay. Then maybe the sentence would better be worded to express that
> it's our present choice, rather than an inherent limitation?

Is this better? Can be addressed on commit?

Xen LLC coloring feature can be used only on MMU system, move the code
that selects it from ARM_64 to MMU and add the ARM_64 dependency.


>=20
> Jan
>=20


