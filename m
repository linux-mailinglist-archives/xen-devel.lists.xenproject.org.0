Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1C89B33F0
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 15:46:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826624.1240951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Qzi-0002mi-Uw; Mon, 28 Oct 2024 14:45:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826624.1240951; Mon, 28 Oct 2024 14:45:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Qzi-0002kN-Rb; Mon, 28 Oct 2024 14:45:22 +0000
Received: by outflank-mailman (input) for mailman id 826624;
 Mon, 28 Oct 2024 14:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MlZD=RY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t5Qzh-0002kH-8P
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 14:45:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20631.outbound.protection.outlook.com
 [2a01:111:f403:260e::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 404e988f-953b-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 15:45:19 +0100 (CET)
Received: from AM9P250CA0026.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::31)
 by FRZPR08MB10928.eurprd08.prod.outlook.com (2603:10a6:d10:135::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 14:45:14 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::5d) by AM9P250CA0026.outlook.office365.com
 (2603:10a6:20b:21c::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25 via Frontend
 Transport; Mon, 28 Oct 2024 14:45:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Mon, 28 Oct 2024 14:45:14 +0000
Received: ("Tessian outbound 0fe1877cedb7:v490");
 Mon, 28 Oct 2024 14:45:14 +0000
Received: from Lc5f426d03744.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BEAE9410-0D12-4729-B2B4-1739AD99A7D3.1; 
 Mon, 28 Oct 2024 14:45:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc5f426d03744.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Oct 2024 14:45:07 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB9635.eurprd08.prod.outlook.com (2603:10a6:10:45e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 14:45:05 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 14:45:05 +0000
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
X-Inumbo-ID: 404e988f-953b-11ef-a0c2-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=is1I1iZiGskLXmFgvpqVBFaS0zkTcHRVOI14divC7uoQhXNL+gHSYPF5mJtZ4ykFUN6zOm4fTEvZXYw+92kZPAGnml9IVC3TfVK5D08udLxgMR6+Tn7hT6+653MIELhfgHJSoVMsDMofyX53YpG5w2og40SLAc0p/71zCuHK07EgdcG8G5GXyc454a04bzmI6acpaOK/K2L9cKRytsmC4IFxlDofOcC3HchOmS/YxYMK42Jn/4hzHc3DuBJh3jeGmo7V6CbULlK0YIZ7Z73iXycqGI2+pAIp3aYph4CeYJiwecFEJ6+fEpNQsrkBX6hEL6oh4UipanwExMWsLmL/3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oX26I12b3G2+XM0slrE6A4HAe5z+uCuHuHK9kdiy9g=;
 b=Yxl11BhRaEiMWS0J2uMgXf+AgJ2rkQ4z+YYolk0Proqn6+JL7K8OHvuqMR3Enk4JGMw7OcTaUQGzhxJ/szZv9yeYM9yLsR8zPEpNpM/Yaliqru1lBTG7wxdrPwsEl876JDSPTSk3OfLfTN1KVrqxrtWv7T099FQWfDnVxFFoBXRLfQA9flfvYY8to0/YqQUe53ClmmWLtMDsSPuNsgHaUGH566nQkX57wI/RR6NFWmOzx96ZJmTXX9eyJIyBgdsXFBMBt+fd6wcZXTS3tTIS7pbCgMGfeBnhmymoVe4KoqNJZslpW6/awCKiCqoCPr277sRn/LC+s96y9Vaz+7aDXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oX26I12b3G2+XM0slrE6A4HAe5z+uCuHuHK9kdiy9g=;
 b=PWU+wNS1W08StzPF+vM7EvdaVT47t4wx7b5eLD/dniuBSUC5/G7QYtRtWJvkZG9+vgJB3Vt+jPsTFOt5AJgOqcYQmpflL+uaOJ+SQtaa7aPGu/6xQxrgAa05fEhDdTo8zvxfL1yPhPTQFpQ0SlwIqSfeBSRkr9IPTSdld1g+S0U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a1f75748f3953a76
X-TessianGatewayMetadata: 12AAh5xE1CSRPpC0EA+G+jt7Ew6csqgj9hWJCeb/dVGe/lh7H0zBgfyihvPjxjv/XVi6GQrmajWlhBpxrBXr/s1pUwKkmJQ13zS51KCobG8u39keFUmLJkzXH47jEl0PhbdQJt5YeBQ351CZlYxgw1ivYSQT5Tv1/j+TTAzS9FM=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ciQRQyymZ0XHmnBnkwjLITVqHs8DUp5AHB6yabuKR3b2rfkBf/4SUj+xrMIgkzSmIv7mhx5O5Zw5cx0hr4xqN7fNNaRhpnxcMsvoch7baD6ieWgNim1PM/aQ7EOQ1r+me6bYGRG200o6vTgRo6+qVqxcpVfMRQsCWw7YsuD3TItnUHJzK2B0640ZJWomeL60SkXOokMmMflr2XWVRICyyDBbV5BHaFVietSjcJ6PAdLqoHvv4S7QxycQ9OcfjpFAXiAIIwQkOZbS+Zy8FeI5D3youWTmrJMCTe0c9F9piAex7qwWK4fR1lJFGoV+sRwgQGuo0+Vpizn4QWfkj7R08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9oX26I12b3G2+XM0slrE6A4HAe5z+uCuHuHK9kdiy9g=;
 b=WzmHnsHJeW3gf7SvKXKuXzqCCq55+Zwamz/n6vIvryi3yOLMsoXRxI3esS3C80aOzEcNZuBJnv7pkKeEjucHThlHytucI9OmZaaSiIKmnwt3g9wIz0yqFrAO0i94/2G9Ja3jc7tVw18wOJrpgD2M0lNn5KPaeFeiT1L8/uFrLPOFKAimx8Nkw9p5+CzSKTbCpogR3lk8ejW8KTPQLZR3OEVwAZSzf10O5ttr6d/2JJqs7gYxSoTzG4nFoC6bde58OyQdefJN/nYSenpFi/eb/3loY0yclukd8/fkGAj7jwaNfoSF2p2KS2UnopUctLVdLO2MifW4fxbsUwUZJpzAPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9oX26I12b3G2+XM0slrE6A4HAe5z+uCuHuHK9kdiy9g=;
 b=PWU+wNS1W08StzPF+vM7EvdaVT47t4wx7b5eLD/dniuBSUC5/G7QYtRtWJvkZG9+vgJB3Vt+jPsTFOt5AJgOqcYQmpflL+uaOJ+SQtaa7aPGu/6xQxrgAa05fEhDdTo8zvxfL1yPhPTQFpQ0SlwIqSfeBSRkr9IPTSdld1g+S0U=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
Thread-Topic: [PATCH v4 1/6] xen/arm: Skip initializing the BSS section when
 it is empty
Thread-Index: AQHbKTdm6ZaHmASNrkyDueCee1TzurKcPXmA
Date: Mon, 28 Oct 2024 14:45:05 +0000
Message-ID: <1A5CB737-9C6C-4ECF-A5FD-B5532C3317EA@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20241028124547.1371867-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB9635:EE_|AM3PEPF0000A798:EE_|FRZPR08MB10928:EE_
X-MS-Office365-Filtering-Correlation-Id: 774b0b25-57d0-48c9-0e7a-08dcf75f2214
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bDFwTEpSYkUveU5qbTNTUnplZWdBRFhobFc2WklzVnBWSzRhWHMrSWVVRFpv?=
 =?utf-8?B?YWRTcnVmaEJkYldlTmZxMitjQUUwNDlBZkdEbkRNT0ZGNGpvaUQyTWtpSkFq?=
 =?utf-8?B?Zk9nTm1zUUpWd0IrYW4wVS9HU2NZSkRJV05qdlRGUjRCVFczWFV6NTN1c3NN?=
 =?utf-8?B?QkYwRUo5K3RBbnZEeFlpeXJQdEZySXYzU2J1TzdJMlAwYUhUMHVYelNaYnha?=
 =?utf-8?B?Rkw5R2N0TFZPRzMzMUg5czRJSGljenR6Z2FpeEdRVzFWYjFHaUpTSnFvOTN4?=
 =?utf-8?B?SUFpazRtbDBFaWRLL1N6eTRrcEtBV1ZqUDlIMjZ2YUJReGhCRkduaElUVmdG?=
 =?utf-8?B?UWNLOTM4S2hPWndPNjhZZUtacG5UbzZwK1kzNElnUU5HT0R1QXpzTXJHcnVW?=
 =?utf-8?B?czhLTjJuVVZwaVkwd0dvRDgvU3NvVStTaGF4RFV2MHJ3RFF4eVNYRFNZL1E2?=
 =?utf-8?B?RFgrL2ljcGpDNXFSTDlGZVNRS29lWnd0NEwvQll3UjRQSVkyd0ZiVFhyN0hn?=
 =?utf-8?B?cEU4TDRySVZ3bG9QMWVjOG9zeTM2S1hMTGFtbVNkQjBXa1EzUTZ4Z05BNHpQ?=
 =?utf-8?B?cDVGbU5mVndGTlRmbGZVZm16WDRUR2VwUEJGN3hOaW1vRnlwWURVSitzN1NV?=
 =?utf-8?B?c210NW9HNGl5aWRLK281MnZNWThzZGpuMllpZ0YrQVpCVWErM3FOS1YxMHNP?=
 =?utf-8?B?Z3pmRDlWTEpia2tocEpnQTZtRmxtVU5LRGFWQXJ3Z2FBa3lCV09pQS9LT1E0?=
 =?utf-8?B?aWhiSDdpQUhkTy8yblB3NUNLN0lKUERBNUxBQ3VaRWVFWFI4ek1qL1pvTnJK?=
 =?utf-8?B?UnlpakdJeG0wL2UvQnZHUlVGUUpnMFNUNlhsd2d2TU9lMkQ5WkpXQ004ZWFh?=
 =?utf-8?B?U1NhdnZPTnQ2RkkxQUhYNUNWN3Jqc0hManFaMURodTNvVjBjeHpzMFo1SS9V?=
 =?utf-8?B?ZHdEQVlhdWlzMjdreXFobVRBRGRhSzJzbzBNc3hoUkJaYTNFa3ZkcVVCcVM2?=
 =?utf-8?B?TFdTalpGaHlEb2psQ1R5UTJOR0hoYnAyM3NNbThLVlVQdzlMS04rR0ZyZmFa?=
 =?utf-8?B?STNqWDhSK1p6T09GbFBrV1l4K1VqQzFGTHg0d0dqWHF0d3lISXRPZDgwcmpS?=
 =?utf-8?B?MmllbHVFaDhwZVFxbjZHU3FSUnRqMXY1RzNUL05tNXk3RWlza0pWMFd2L3Fw?=
 =?utf-8?B?ZS9QRktGTVBJbVJPc1JHd21NVmR1OVUzQmxKOHlUSXZNeFpvN240S3BIYmht?=
 =?utf-8?B?S3FmeDE3T2gxc1YwY3RnTGJ0dE52Y294QWFxQ3FTVFFxMnl3aEtpcSthSE90?=
 =?utf-8?B?R2xvd0FYYWdYRjVUbHZwUnNtOVlaRjNoTWVReHlrY1FWOGw3WWd3eGdlSnNl?=
 =?utf-8?B?QWNxN0pIRlhPM0xNQXluZS9ZdGpRU3pkU3ZOVEpWQjNqay9DYzYwcnJGOEdV?=
 =?utf-8?B?SjBPcTNVOFI3VlBCYW1OR1QzYjZlZmMrQVFpSHhZTXFoQ0gvZ1Jadi9aSXNy?=
 =?utf-8?B?MzFITXFVNGxBWWlONjVYb3RxbzJNWWVqVk1tZW9oV05XOUJTTU1reWdCVVJy?=
 =?utf-8?B?Q0lYWkRrUDNtSUJMU3F2OTk3U0JnVm1rbmZCS1cyZWxoZW1GTGJjUU1ERURO?=
 =?utf-8?B?U0FJTVpBVUJlRmJJaC9JWHpXc0dGS1pIanhjbHRPZ2ZKMFg2MDREUE5EcUNp?=
 =?utf-8?B?c0haZzhTaGZ6RnllUm5VellrdEhhNURJcWJzQUJjVHNqc1M1VlVmUFlXWFQr?=
 =?utf-8?B?VGU4eFpFalRId2IwcDBTbjVGRkVpY3pTeXRNbEkrZkNSakhQVjkreVlINVVp?=
 =?utf-8?Q?YRwF0+c8WDiG1zD7wJD+TpBntoyMrXT23hYuI=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F8F15156C6F2F4F9C8BAB653A0EAF3E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9635
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6dd5701e-aeec-4718-d353-08dcf75f1cc6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|35042699022|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmF2YTFlck9nQ2hLV0plZ2hvVzhsK1NpVVFCZWg4UWF1WDNuQ1RLMkROMXli?=
 =?utf-8?B?T1NYU1pFMDhrb0dvV1lVdkR4R3pFZXBicDBEWDlVYzUwVlM2NEZKK0FXMEMw?=
 =?utf-8?B?bEp6NVNFZW5DNHBucjlUVmdScU50WkFzR1VMRjRoZ1FwTmxJYnZsbWlKVml5?=
 =?utf-8?B?R2M1Vk9kclMyVnkrRVRpN2NDbmtMWlU2WkpVaEQ2SVo5OEhZKzZmSFJPYU5h?=
 =?utf-8?B?cHM1OTBMK2hCUWFRT1hINm9zN09SSGZwMDhRSjgxSXRwUzVFTFpYc0pPcTN0?=
 =?utf-8?B?SlJYS1V1N0g1MlM1NXdQTjlySWlqMS9ieWppY0JHc1R5TFZIK3p1MEwrVk1D?=
 =?utf-8?B?MGZ6TUplbTVDTzZJR0VveVVRbWVtWi9ZZDg1eDRNRlZYOVdWVTFWT0RhVndo?=
 =?utf-8?B?dW5Gdzc1a2Q5RGxIUEsxM0xCM1Rrbmo2UG85N0VHVDlHT3VsUUZDRC9JSXYv?=
 =?utf-8?B?ZjIrdXFPTkl0MjRQQUVyQXFZVVphOFNoeExoMWphTzc1WTgzV0NhNFpiNE8z?=
 =?utf-8?B?dW1DNHlJcVFHTFlzMC85akptdTdjTjFPUlE5c0FhS1BkNlArK2dGY3Z3YjBV?=
 =?utf-8?B?bVZYRVNBb0xrQmhxN1p4UkxMQ1JHZG5uVFNFK01JR1Y3QmhqdTdqN3J4QXZn?=
 =?utf-8?B?NncyR21oU3ZsZEFBRXRIdGlMcklLVEt6aWYzaDJnZW1ZR3Q0MDRobFJPRnJ3?=
 =?utf-8?B?cVl0Mjl6QTRCRnRtZEUyMVhSQy9zQnU2eUlUdkVoQ0xHcVdQQVZIYUpIdnZ6?=
 =?utf-8?B?THRFSG90RVJLRTNld0d5SlJKbzBpUTZCWUMyT3ZYWEwvQVV4amw5YlJ5dmt6?=
 =?utf-8?B?RFpzU2xCN3BaVjZaa1pVdTlza0daNTdXb3N0b3Q0ZlRwcWpDOFdmSVNRUUNH?=
 =?utf-8?B?dzRWK1Qwd2FhSEtkOGpZVWhSalEyRDBUNHNJWVFLNVNBb21iRXUyeHdVMFFz?=
 =?utf-8?B?eHdzdHlpOFZZc1gzUzJYNDdRL3g2SWNxS3pPMWpwMmRWc0FCNTZnbmFZazNS?=
 =?utf-8?B?UG9oR3pCZkFQSVZaMzdjMjhHWVNaMzhJdEVZMS9DZVBSSWg2WlF5MVprVDVT?=
 =?utf-8?B?WUVnNFVFOTZ5aW9LUnRIazNTQ0QxMnpRcDY2TmJvUEF0WTJpcE1FMjd3TnV1?=
 =?utf-8?B?SER3YW9Xb3E1dHlTMjNZTTJUZ01aQVNjYXpiN2xMN0pESmVoMXc1WnRZVEkz?=
 =?utf-8?B?Q3RxQ3VPNkV0NHFTSzRIbUNNcWJYUEUyMWZUWEJCVUhNb0x6d3J4bFZBUS96?=
 =?utf-8?B?TGhnUWRUZ25qOFVDc0wyQ0dhem1zL0NjZFVDNEhQUXNLeWRtSlAwdnlUek5h?=
 =?utf-8?B?NE9iR0w5OGs2SXVad1dTSGRXSUw5ZyttZFZlWDJwSWs0Z0lzZ0ZvQWhGS1g3?=
 =?utf-8?B?ODlIaXhRSWxFNG9TTDVVd3hTVzFwTkJ1ckJtT3d2TE9sREVZUkIvN0IwdlRM?=
 =?utf-8?B?aFNDY1NJUFc5VXpZRXZuTVh2N3hZTlg5b3VrTmlxSHdKN3pHeTE5VndNZ3Vw?=
 =?utf-8?B?YVZMWm1PNDZ0MVU4dnFNaG95SGx5TW1yV1MrSmVzZGh2WCszYnNKM094cnJE?=
 =?utf-8?B?c3R2QmJlSDZ0aldNR2pwVWZXNjExQTdTQi9QNzR2dDJvb29JYSs4a1pMUkJj?=
 =?utf-8?B?R1o1Wk5nYjFtYUZ3MTJEUTdBcWJOZC9sYUhYTXJzZ0d1ZzAwWTgzT3gxRUMx?=
 =?utf-8?B?djVKUmxnRTN5bExwcTk2Z1JqaGVMMVpuNkF4K25YcjN2OWdFV0FKRFphV3Vl?=
 =?utf-8?B?Y1ppK0FldVlRbSs0VVFRVTcrNjZHWHdFUmZBVVNPUVhjWVNXUkp1VzFLS2VG?=
 =?utf-8?B?ZkxCN0RLeDJXR1RwNGRWWHl6cXFXTWhYTTZjRG82R1BnQkZ1QzMzU0w5MWdD?=
 =?utf-8?B?Wk9WL2ZNeGgxMk1qMFd3NlVDTGFtaXdHV3FWRjArUHJyK2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:45:14.4836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 774b0b25-57d0-48c9-0e7a-08dcf75f2214
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB10928

SGkgQXlhbiwNCg0KPiBPbiAyOCBPY3QgMjAyNCwgYXQgMTI6NDUsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IElmIHRoZSBCU1Mgc2Vj
dGlvbiBpcyBlbXB0eSwgdGhlbiB0aGUgZnVuY3Rpb24gc2hvdWxkIHJldHVybi4NCj4gSWYgb25l
IGRvZXMgbm90IGNoZWNrIHdoZXRoZXIgdGhlIEJTUyBzZWN0aW9uIGlzIGVtcHR5IG9yIG5vdCwg
dGhlbiB0aGVyZSBpcyBhDQo+IHJpc2sgb2Ygd3JpdGluZyAwcyBvdXRzaWRlIG9mIEJTUyBzZWN0
aW9uICh3aGljaCBtYXkgY29udGFpbiBjcml0aWNhbCBkYXRhKS4NCj4gDQo+IEZpeGVzOiBkYWM4
NGI2NmNjOWEgKCJ4ZW46IGFybTY0OiBpbml0aWFsIGJ1aWxkICsgY29uZmlnIGNoYW5nZXMsIHN0
YXJ0IG9mIGRheSBjb2RlIikNCj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5
YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+IOKAlA0KDQpMb29rcyBnb29kIHRvIG1lDQoNClJl
dmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0K

