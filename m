Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D96A8C64C3
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 12:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722129.1126019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7BW3-00070B-Gh; Wed, 15 May 2024 10:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722129.1126019; Wed, 15 May 2024 10:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7BW3-0006yc-Cm; Wed, 15 May 2024 10:05:43 +0000
Received: by outflank-mailman (input) for mailman id 722129;
 Wed, 15 May 2024 10:05:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kRjG=MS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s7BW1-0006xB-Sd
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 10:05:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2607::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aebf3125-12a2-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 12:05:40 +0200 (CEST)
Received: from DB9PR01CA0025.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::30) by AS4PR08MB8142.eurprd08.prod.outlook.com
 (2603:10a6:20b:58d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 10:05:36 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::c3) by DB9PR01CA0025.outlook.office365.com
 (2603:10a6:10:1d8::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Wed, 15 May 2024 10:05:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Wed, 15 May 2024 10:05:36 +0000
Received: ("Tessian outbound ba75727f6dca:v315");
 Wed, 15 May 2024 10:05:36 +0000
Received: from 1be2dac11444.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4306D45D-15FF-4DE0-9B3C-0338FB4B1341.1; 
 Wed, 15 May 2024 10:05:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1be2dac11444.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 May 2024 10:05:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB7413.eurprd08.prod.outlook.com (2603:10a6:10:351::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 10:05:21 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 10:05:21 +0000
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
X-Inumbo-ID: aebf3125-12a2-11ef-909d-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SFUm932Tz4AnUD9SF28nLDFabLNOc2t9gmBFYgTtGS075ZdKZEIJGh7xwZhc5YkvYBPBIlLst4crLUEWJl9DJPIxVmudawQatMJZ/q2fRzmB5Li7fBfo59+6QJEwGEXs7SA7+lUNyGaz/0COF0sqdP4D78/e2Vka1RN/jOZKs/Qos5R0gc5Bz1hP80iTZPAiocC+r8vEu197XSxn8ImFvzwqhvfRV5UbaVe0CPCtbvE9YEktk4ElXsWUYUQBbwz5JR3duiCWXFxU/Rl7/qN6UztWbMLJEXSfzsQd8k0rxAcmVmUPtMN+IwaVI9ZMPdaG+WZgU38pchsEncHCWloA7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaDAydz/Q82yXYNpdavomn0aM1mGqVxyXJ57CCbCVRQ=;
 b=EvpfcOfouGo59zgKlx0J0EyzlFRcfIYC/QGhnoU+ydL/5MlAYKUH0HYSFK+WnlpxnPG2uEKuyoB5ONPn7yOTtAG98JFZOeVdyPJTSYwBLBEE6IzmQTul0jA6fmiSXgNv0qP6OGQpH/JafMpm1mstmOvFtzwqZjxCHAghKnO2cE+MQyHHGBjqWfrNm+Mx4u977H+gIg5Podud6PoiHbBcL8zlcWIZWzu0+6bUjjp/mGswsaxJyoU4GHPALgPrGLImuyspX0rN59+dSlqL9yW0hcYI+Sur4V73ucmuJybQtN4tnvEKoGK3Yt+vrNjsG4DAN+dbxZ5OrZHpYYJ4z7JrmA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaDAydz/Q82yXYNpdavomn0aM1mGqVxyXJ57CCbCVRQ=;
 b=nBb9CHxJwzf+Ex+1D9AiksMZl8SiWpt0jyqaBMT37StP2Hq9Rp3PEWZVR6+AUqhbtdvsC4ppwVkLlyuL9Exx1TYQZ/OCrDdhAfvuMy9uudLKo+m4QaOiPHiBzJ7wm1zX0NphHJtjYg78awc1U9TFyd6nXfB789e7keAM60Q+KEo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c23f8325cbf8baba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=apFVMNhwC/MqDi1uTPrg4BNNiTeGnWP3cstnkYmzT7oPuP+38WGZaLagqRuZLpn2a1leve9bwtMXOX7hchVk3FP2eSqUTOiC7WfzQYg1SH6DwUeIJUXubrP9Acc+y/TF98xtRykm6G26WSsK7AxycsW9+PC82RiCUFfdoHa45oQdimQqWaQZwxUQJKs7OjU4NgUS795KKx8Bj+TYuNR+0LzZ6uq045LXbc3KEwKOTCBCsdQU94ney9fIPL02wpiYIF+NXcajtwjU5vvJTYJn5bNETqOCBWv6K2FkxKkhDqM2MyRl2GotZc/VK7TaPOzlCT1FztiENn0Y8Gw1jhgGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OaDAydz/Q82yXYNpdavomn0aM1mGqVxyXJ57CCbCVRQ=;
 b=aO9gLypaWLjxQx6SlNpbkwXRkaHKT8ukAVHX6WUpA4nI3rAz01Qq2uxMD4isoZYvgAXDD06T5P5Cz1WLg90jMwQK1tQ/NqMzbrQJ67Hrl+MfEmLPj8YiXA2cTonaSkUZYUn2FS/eShLolxamxQVDSXFyqsojZaeLopuOroAIicDqrNlx4iT6oIn7rO1Alju8zMF8xYfLOeTumoUpdXj1Op/fS2uWpsrnxcZgcLNA61l4xep/unciFJmv4qyQDVVFBpirTRZBoUoNWuxMdMd0m39K1rnF4jS/4bUW2kyQr3PIKzESuF400sWRgeYSjn0xye9JgaSFnHYmq4doYG1tJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OaDAydz/Q82yXYNpdavomn0aM1mGqVxyXJ57CCbCVRQ=;
 b=nBb9CHxJwzf+Ex+1D9AiksMZl8SiWpt0jyqaBMT37StP2Hq9Rp3PEWZVR6+AUqhbtdvsC4ppwVkLlyuL9Exx1TYQZ/OCrDdhAfvuMy9uudLKo+m4QaOiPHiBzJ7wm1zX0NphHJtjYg78awc1U9TFyd6nXfB789e7keAM60Q+KEo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 1/2] xen/arm: Add DT reserve map regions to
 bootinfo.reserved_mem
Thread-Topic: [RFC PATCH 1/2] xen/arm: Add DT reserve map regions to
 bootinfo.reserved_mem
Thread-Index: AQHalxIi36RR5t8uSEeoUslJ6d4QpLGV0j4AgACnKQCAAN2CAIAA2a+A
Date: Wed, 15 May 2024 10:05:21 +0000
Message-ID: <F353B76B-D159-43A0-898F-EF8048342B07@arm.com>
References: <20240425131119.2299629-1-luca.fancellu@arm.com>
 <20240425131119.2299629-2-luca.fancellu@arm.com>
 <a9629975-87d1-457b-b6aa-cbeb91fd4854@xen.org>
 <0A931CEA-59CA-4B1F-A8E4-A4CB990C0476@arm.com>
 <d41b633a-7702-41f6-b2b3-26321de53af2@xen.org>
In-Reply-To: <d41b633a-7702-41f6-b2b3-26321de53af2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB7413:EE_|DU6PEPF0000B61B:EE_|AS4PR08MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 06359aaf-eef6-4fd3-e32c-08dc74c690ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aEowN0g5NWRNMk9HZVpWNWhNRHFuVWZuTERLYi9ybXB2MXVYRk1oRlNUWkU5?=
 =?utf-8?B?MVU4S2YwWnZLUlg0czdMSDlIUXNuNVNFWkdNVnpNKzQxbUxqN3NZU3NYVWJU?=
 =?utf-8?B?dCsrTExOZ0tZVWVQOHpIamthNWM1S0lVVW5ERU5qeGRsTnlYazAzS0NUMXRn?=
 =?utf-8?B?aHZhcEIrWHByeEVVN3dnd2VlVmVBLzk1cGc1amo4RmRlR04vL1FLQldNMkJW?=
 =?utf-8?B?MkFIM0RGN29HTFI2bVozcXFwQy9kNlIxTEhZTmNTenlNd3lLOTN2amdoQlkx?=
 =?utf-8?B?SkhJK1ltYWJlQzN6VVJ4am9DS1NIVWVhT2JXZXJiQkpsNGhPN0NKS3BTWGho?=
 =?utf-8?B?K2ZuTE9aTERyTlhMUzRqR2prcTdwUFplVGlVQWlDdHhGZWpDTjkwMFlKditX?=
 =?utf-8?B?OXowdHIzVzBHemhxaDFLT3VUQk9zSXVFWlVwUVVlRlpsQm5IWEJiRVBjM3pO?=
 =?utf-8?B?eWlqa0dubHhzZlVrbDFRT0owRVZWOXg1dCtXNnhGQkFzRDlYdlMzZ0tKUlB5?=
 =?utf-8?B?WnhvbE9FR0hpT3JTcHZJZVRwM0gyYlBhRVlVbHhyUFdkUS9xSlpSaW5lOEgy?=
 =?utf-8?B?RVdONjJ0R0xqZHFLS1Z2bkhMcDVMZHg0ZGtLSmp0OTNSMnNWZ3FHVTV2RjFz?=
 =?utf-8?B?ZnJKMWVsa25OUzlGVlVkTXl2a00yR0lvbk9ZeXRhZlJ4MGZObEd3VnJBTkp0?=
 =?utf-8?B?VkRRTitNL2JFQ09HalRQNG5ZN3FLdDIrOUQ1aDlmM2tTMmhKcEh0aGZ1dno5?=
 =?utf-8?B?ZWl2ZnUvYllRQWFraFBTVFlwWWJzSkRDR1BlajFlREtsT0lKVWc0N0VZL3dn?=
 =?utf-8?B?NytlSWkyY1VNTys0SFJXVEpxSWpWOFhHQ0NCZzd5U0JBQUxIZGJIajVrUnps?=
 =?utf-8?B?aFR1VTUwSFZMV0pyOFgzamRBSXZBSzNLMGVSSUorMXljeG9UT2E2Uks4cmE4?=
 =?utf-8?B?aHNkY0JmRm1TMmwzdzZKZkFMakJ2TGdOU0hoZElaSXc2R2JBektNRHYxK3M2?=
 =?utf-8?B?SmFEbnRsbndxRVVHaVlDRjMwbHhTWGFhdE43aERWdTAyYk9Rc1F5WWFBdm5a?=
 =?utf-8?B?Sk1MVUthUXUyZTQ4Ym9BNG9PTFlFWTYvOXdyMHI3eERLZEdhM1B2LzFQWGkw?=
 =?utf-8?B?VmdRNjVBVEdWbFZRaWpObHd3eXZSakR4WjZIYzNtcXFIQnI4OW1uKzVMUzZU?=
 =?utf-8?B?cXAyZU5oSVczNU5CVkVNOWZNN05Vayt4U0RZWkM5aVcyNUU3a0NPVnZKd0tl?=
 =?utf-8?B?OHBtQnVKTHRuQWFGWFJiTUFrQXQzR1pJazdUSWduTytPblY0YWFzOGVwdUgx?=
 =?utf-8?B?V2hkUVNoYVJWV096ZU4yaVVOS2JsYzhIUGNpcWhqYTN1RmJ2Y0NKTDV3UXZC?=
 =?utf-8?B?Q3RTOWYwSXZXTUhMbXEvRldDMjJjQk10UWhWczhHNnNpbjlEQzlyMXE0eGRz?=
 =?utf-8?B?Y1JsNTltdUxjdkplNHBuWHFPamJraHBUSWtqSkRvd1F4WDVmcjErRWUxQ1pV?=
 =?utf-8?B?UXMxMFlTN0tOMGo0S1VXc3ZhZWRGYS9hV3U3M1VLYklEekYya0gxNTNnUW5N?=
 =?utf-8?B?QkZOVUtBZzZCTW1KWUhOeGYrS2x5Z3NTZWdHQWRQR2RrbXVWUWw5QTRQMW1G?=
 =?utf-8?B?RmY3VGQzZ09YT3RXMEV6amZqQmxnRko5YzBGeDJOZU11a0hCWEtsQzFlOXZV?=
 =?utf-8?B?U0lBWDgwb0NoVGhoRFdiSVAxMmJoSXRDd1BScjMvb2lTZ2kyU1YvMDErVW1o?=
 =?utf-8?B?UTVUSkF4YTVrcFh0K1poa1g4WFZUUzU5ZUpmTXRBSFRGd3lpOHppM2FiWDB1?=
 =?utf-8?B?bFZGRXM5LzErSTZNenJmZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <314FCE7D8F06A04BAA0793B203249D75@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7413
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1111403-7fbe-492a-ba3b-08dc74c6882d
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|35042699013|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzFNaVFFNFpFQTg2Tm5iWnpOcnBaU3R3M0k3V2ZjNnd3MklWT1pQeFVBR0sz?=
 =?utf-8?B?TVZQU2E2ZVlmVCtzY2ZXYUJmdmgwU3Z1dWhEVGpoL2ZleFk3cVdKZkliR2lt?=
 =?utf-8?B?MWEwcSsyZFFzRU5sT2Q5aVk4SUpZWlNMNVlETFR0VjZKNUpjYUhhd2ZtTTVy?=
 =?utf-8?B?SXN5aFNLRHhnczBwUHdKa2JPYWpIemh5dFdBY1RtUDRVMEUwdjROUjAzSnox?=
 =?utf-8?B?cFZUenZpbE5GR0NMTm1DRWVORVlqbWd1dVYrUnNmV3dTNVNPTXlyR09sa1RS?=
 =?utf-8?B?OHZUZUdPdkZKazB5Zmg1MmhDL0c4b3J3Ti8xVEh1QXZoNVYxNERJb3FOakdr?=
 =?utf-8?B?eTBQbHpQcTdjWngvSENNSng4dmpuVEZsTTVka2orK1dJam0zclJQWnJBd2JK?=
 =?utf-8?B?YkZvV1J1djJEM2RIUVJiMkxzVy9RcWdJdzlxV3FudFpFZHJLdDQ5SWczNC9Q?=
 =?utf-8?B?ZmtSTWRLN25tZDVGQ0RIZ1hRN0JrSG02WWNKeEt1Rmd5bXNlNTAxMUZzT3lC?=
 =?utf-8?B?YUZPMXBWMDFJOWNvMmJ3Qkwxd1RpeC9zcURON3VEcmptZ1pCM2NaMkVSSXpQ?=
 =?utf-8?B?ZHVNQjk1WDlnaW9KQ2ZhVm1FT0hNS2toRzB6a2VxdSsyUEJSNXR1Um5WNHcz?=
 =?utf-8?B?Qnh5UDhLN013ekpGOXJOTXdwS2hwZ0dnQmQ5OVppOHlvOG9Yb044enFMYlNp?=
 =?utf-8?B?REtKdG9XWlZudDdiODFtSmFvYlZSSlJpaWMyUGNzdGQ3dVBCbEcyK2R1Tkdj?=
 =?utf-8?B?WVZNbnpNc1pJOXNxV3F1cVVkcVlvVWJUUTlORU5JVWdtd1NvSWszWmlzbndn?=
 =?utf-8?B?cXVQWkpBcUQ2OGFPcVlpUjRiWUxBbmNaNlpYNEVhandDdXVtMWs4L2FtR2hu?=
 =?utf-8?B?QnR4ek9MY3QxdTQyQU12aHo0Y1N6TTBlNzNIRHA5bEdYTkZkZHdGZDFDaTJm?=
 =?utf-8?B?bFd1M3c3V2EybDh1TmlMeDA3RGNtcWNoOUJjRzkwdCtWQ3d1Z0ZRMy90K3lI?=
 =?utf-8?B?OENoWHYyR0xOVlU1YnBjcFROYS9lUHJmVFlQS1FjcWhpcGQvUEZLQkd4WTR5?=
 =?utf-8?B?NHE1bGJEY0RaZkFuT0ZBWS9nNGlBTUJORzJwUlFKU1pGYXJydnRUMy9qRFhG?=
 =?utf-8?B?Ti9NQmZ3RlpnMWlQaGRFVEVLVllncU83NUtCTkxsYmpaMU9yVWd1L0RRN1hs?=
 =?utf-8?B?YmFUbEg1R1hGNmF0UnVSUVQxcDJQS1ZCVk8xdlZqV2ZUT3lBN01rWGs4SFFH?=
 =?utf-8?B?MnZJVDZVMVAzRmxDckI5b0ovRWU3TkxyYkVGeG96cTMvK0RsK2ZLZG5ENzkx?=
 =?utf-8?B?eCtRWm5uanp6Y2V6TWM3VVcyNlZrakFmYldxNmN0UEFibTlpNFVUQlVpR0NK?=
 =?utf-8?B?THZodXJsNW94MmhldDV4QWlTUkl3OG9SeHoyM1JoMnl2V1VpSjlWSXp4WHNv?=
 =?utf-8?B?b0xKNmFQd2d4WGdkQi9BSXRNMHgyTGdxOXIzQ2s2R3NJZzZhcnBadlVVVHFG?=
 =?utf-8?B?MHZ4VWdGTitNdko4ZC9GOVE1R2lTWjIzWWJDTWpxcGwreXZvbmpJdVRNOWg5?=
 =?utf-8?B?YmRVNGZZZis4NSt6amhZdlBtakZTMTFTTnpXc1lwU2NVTm0vbTdBQklVOGtv?=
 =?utf-8?B?QzBNTTVuNXphRlpaTlhEMzNaOVJtRGJ5Z2ZqNWREL0tqclpoNlFkVG1Ubkpy?=
 =?utf-8?B?UXNBQm90T2xpM0htTlI4MHdVeXFWU2YzUjB2Tm9TaDJWQjYwK2dSaEhDTGI5?=
 =?utf-8?B?QkJPcGVuRFZxMzdDQzRybkRiTC9mZ3JHdnRlYnJ6TS9QSnVBNzQ2OEhlWThx?=
 =?utf-8?B?dDVFNEVLOTZlWFJtY3FpSUZQMWloRHF1RXpPTGwwa0dLd2NHTjV1a2tHVlVn?=
 =?utf-8?Q?v1DRJrNtKGXrQ?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(35042699013)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 10:05:36.3623
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06359aaf-eef6-4fd3-e32c-08dc74c690ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8142

DQoNCj4gT24gMTQgTWF5IDIwMjQsIGF0IDIyOjA2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTQvMDUvMjAyNCAwODo1MywgTHVjYSBG
YW5jZWxsdSB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4+IFRoYW5rcyBmb3IgaGF2aW5nIGEgbG9v
ayBvbiB0aGUgcGF0Y2gsDQo+Pj4gT24gMTMgTWF5IDIwMjQsIGF0IDIyOjU0LCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBMdWNhLA0KPj4+IA0KPj4+
IE9uIDI1LzA0LzIwMjQgMTQ6MTEsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+IEN1cnJlbnRs
eSB0aGUgY29kZSBpcyBsaXN0aW5nIGRldmljZSB0cmVlIHJlc2VydmUgbWFwIHJlZ2lvbnMNCj4+
Pj4gYXMgcmVzZXJ2ZWQgbWVtb3J5IGZvciBYZW4sIGJ1dCB0aGV5IGFyZSBub3QgYWRkZWQgaW50
bw0KPj4+PiBib290aW5mby5yZXNlcnZlZF9tZW0gYW5kIHRoZXkgYXJlIGZldGNoZWQgaW4gbXVs
dGlwbGUgcGxhY2VzDQo+Pj4+IHVzaW5nIHRoZSBzYW1lIGNvZGUgc2VxdWVuY2UsIGNhdXNpbmcg
ZHVwbGljYXRpb24uIEZpeCB0aGlzDQo+Pj4+IGJ5IGFkZGluZyB0aGVtIHRvIHRoZSBib290aW5m
by5yZXNlcnZlZF9tZW0gYXQgZWFybHkgc3RhZ2UuDQo+Pj4gDQo+Pj4gRG8gd2UgaGF2ZSBlbm91
Z2ggc3BhY2UgaW4gYm9vdGluZm8ucmVzZXJ2ZWRfbWVtIGZvciB0aGVtPw0KPj4gU28gd2UgaGF2
ZSAyNTUgYmFua3MsIGluIG15IGV4cGVyaWVuY2UgSSB3b3VsZCBzYXkgSeKAmXZlIG5ldmVyIHNh
dyB0b28gbWFueSByZXNlcnZlZCByZWdpb25zDQo+PiBpbiB0aGUgRFQsIG1heWJlIGEgY291cGxl
LCBidXQgSeKAmXZlIGFsd2F5cyBoYWQgdG8gZGVhbCB3aXRoIGVtYmVkZGVkIHBsYXRmb3Jtcy4N
Cj4+IEnigJl2ZSB0ZXN0ZWQgdGhpcyBvbmUgd2l0aCBBRExJTksgQVZBIGJvYXJkLCBuMXNkcCwg
SnVubywgcmFzcGJlcnJ5IHBpLCBxZW11LCBmdnAuDQo+PiBJbiB5b3VyIGV4cGVyaWVuY2UsIGhh
dmUgeW91IHNlZW4gYW55IG51bWJlcnMgdGhhdCBjb3VsZCBiZSBjb25jZXJuaW5nPw0KPiBJIGtu
b3cgaW4gdGhlIHBhc3Qgd2UgaGFkIHRvIGJ1bXAgdGhlIG1lbW9yeSBiYW5rcyBhIGZldyB0aW1l
cy4gQnV0IGFzIHlvdSB0ZXN0ZWQgb24gYSBmZXcgcGxhdGZvcm1zLCBJIHRoaW5rIHdlIHNob3Vs
ZCBiZSBvay4NCj4gDQo+IEl0IHdvdWxkIGJlIGJlc3QgaWYgdGhpcyBwYXRjaCBnb2VzIHNvb25l
ciB0aGFuIGxhdGVyIHRvIGFsbG93IHdpZGVyIHRlc3RpbmcgYmVmb3JlIHdlIHJlbGVhc2UgNC4x
OS4NCj4gDQo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KDQpZ
ZXMgaXQgd291bGQgbWFrZSBzZW5zZSwgdGhpcyBwYXRjaCBtYWtlcyBzZW5zZSBvbiBpdHMgb3du
LCB3b3VsZCB5b3UvYW55b25lIGNvbW1pdCBpdCBzZXBhcmF0ZWx5IHdoaWxlIEkgd29yayBvbiB0
aGUgc2Vjb25kDQpwYXRjaD8gDQoNCg==

