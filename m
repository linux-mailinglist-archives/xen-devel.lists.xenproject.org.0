Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE779DC29C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 12:15:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845932.1261245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGyxQ-0008BS-EF; Fri, 29 Nov 2024 11:14:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845932.1261245; Fri, 29 Nov 2024 11:14:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGyxQ-00088U-BK; Fri, 29 Nov 2024 11:14:44 +0000
Received: by outflank-mailman (input) for mailman id 845932;
 Fri, 29 Nov 2024 11:14:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aowa=SY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tGyxO-00088O-HR
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 11:14:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2612::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e8fc119-ae43-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 12:14:37 +0100 (CET)
Received: from DU2PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:10:232::20)
 by GV2PR08MB8341.eurprd08.prod.outlook.com (2603:10a6:150:bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 11:14:30 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::d3) by DU2PR04CA0075.outlook.office365.com
 (2603:10a6:10:232::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Fri,
 29 Nov 2024 11:14:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Fri, 29 Nov 2024 11:14:29 +0000
Received: ("Tessian outbound 3b1f0cd68b0e:v514");
 Fri, 29 Nov 2024 11:14:29 +0000
Received: from L349b8a2e48ba.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D0FFFC1-EEF3-4B6D-BA6F-74CBF9C5B162.1; 
 Fri, 29 Nov 2024 11:14:22 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L349b8a2e48ba.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Nov 2024 11:14:22 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB8729.eurprd08.prod.outlook.com (2603:10a6:10:403::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 11:14:19 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.014; Fri, 29 Nov 2024
 11:14:19 +0000
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
X-Inumbo-ID: 1e8fc119-ae43-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjJhIiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjFlOGZjMTE5LWFlNDMtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODc4ODc3LjM5NjI5NCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=E6wKuT5hK2PbYx3ltyCu7T1QdsavpTD63Fb2jWjZ0tU2ynjP24Z44OFgt2mZW4VFv8l5xAstkiz7LKR9ZU+wxFOlhwWoEQ1rKlMcDZ+BjMPA4J7BU/ppQLtJquuF/KSfJz4LS9jaFStz1sK1MT/1+rapjnOJEpQ7VBbRqWnxUNpU3Z4uAMfNW4yKi25RkRMcKhREca2zUqQTLEL3bVuHy8xjmITuQkDXgiiWay+reRy13fgaKLXYk/bT0XaIxKn0D6ejur2v8M2s1bshRTGzTZotigjqhfACBJzHZBbSlEUJf2JOs2snTPp7YEc2WwLtkmYelJzk6jV3K2gjVZ2QgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzvttSIp3RkzvLTwE9pq+/CshgN20eq43EVAtb5tpVQ=;
 b=TlmqpaosRYmD1K/Fkrkx+pp9L5Gspn0dHH2+ZFgbT7YKlId+xinxNWq3Rt5x7xFiKEI1tnXOaqQeEVTzHqKQBgh9UHeiFGRssUct0N7z7aCIxkgOR3kR21PhJrm8bdcaFT1mOas9eYHOFTZ/3kGjGKjCKnERqG8uKZm9MakGGkrl75qlwmRgEqnA+8fIbTCnlYWAr/5bHlJrdWkCPp74Bo8Bf+rGWFlaAPY49cC7heb3t1uWzr6GM5GEccl6s4r/ic9upCyP+It4dKRChPkte6VjnnOHzV+JvdEoPvuD0iQ0FOdUheOrnMYDcJGnlLyFk2wuipyZeUAdMxA+XrAXoQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzvttSIp3RkzvLTwE9pq+/CshgN20eq43EVAtb5tpVQ=;
 b=W7BwFl+RxtYUWtQMHMq4ORwjKhNFzGPVJUA/H0U1jLF/+zkftZ5fe6Oso49HxRnHN+rVAF6WwWHxSfnnjPrxDCrpGlyKqy6PDnhk+XJ5SSnoiPEYtKSj/6P0iGpXP0u3SktlMBz+5C9X7RQIshNTTR6D8w2ZAb4sgzMJFhk1av0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c96d1cb7bc9c7498
X-TessianGatewayMetadata: RS+U1XlOrp6G0+BFHEP/ZGc0bwhokJo33ruGGZ/1iiofTzs8yxz4wG0fbpOgnheNLxYVKYNExBreoWASIa0t39qtsH94xrankNjVaE8VErMY20mDEn6Ln8wtWe3NnuahDFq/e6sZaywiu7HPf09g8JZJelR5TijB6yQ7iMNQI2Q=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C0hDL2j9Z4t101KGZt2TyZx8+B9KGC1lMgdfb/wor001YJcJfUwJ+FBD5oOxtP4rvGVNAvyMQYpA+pCM8T3GFRDE61A/eThu3tZOosqnzhliInnWCJOtvBr5ImwxOkn5/KoLHJKMZBA8E4UumfPsvdI1ogeHJFQgegTEMdW223pDdLt4yZWeuD9vIM5LTLDuY2+/LPs/0nVU8xrMkW5AqJ83KzLbXyQNFQrdbN3jVOS7sH7gY6tIzKT6KQvj+ltwDEWdDSraTTy64/e215gynRd+tM/jZx/83CjCthELQySUp39lFq167paacPfZq0MVZgCP/JRH1kG6MV9oYfzl6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzvttSIp3RkzvLTwE9pq+/CshgN20eq43EVAtb5tpVQ=;
 b=LKMd+KmY4FFcJpKnHienVbt6l7dMZ+ig3EOcOsRsWOMjPKOHA4QAQ/59yJdy7ls/HmY03r9e15C1MaQVO3AV8z6UEzy19nZtTIIxg82641SEDE8bUXseAhhP89P2xsEoQ3xBRboNk3jVO+DY/Tb0CMdkWKyl5A6NC9c0Z5oNTlgIGsnoWOHRS4zYOkVT2Gdaope2rJw8SRcA5LYGvwor3bKgUiOKNtYqN5WpGY2Bthtx5dN837OkuIIcyDekfhGPFcAfXHnB1gsYA+JcOF+treT46xpZupFLxAAKWp+VkTypMeq8JGhhMej7sNuK/4c1c6LdSujngVButAekxTwltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzvttSIp3RkzvLTwE9pq+/CshgN20eq43EVAtb5tpVQ=;
 b=W7BwFl+RxtYUWtQMHMq4ORwjKhNFzGPVJUA/H0U1jLF/+zkftZ5fe6Oso49HxRnHN+rVAF6WwWHxSfnnjPrxDCrpGlyKqy6PDnhk+XJ5SSnoiPEYtKSj/6P0iGpXP0u3SktlMBz+5C9X7RQIshNTTR6D8w2ZAb4sgzMJFhk1av0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Topic: [PATCH v3 1/5] common/vmap: Fall back to simple allocator when
 !HAS_VMAP
Thread-Index: AQHbQj8EJeBBpea3PECsMrqs79+q+7LOGRaAgAAB8gA=
Date: Fri, 29 Nov 2024 11:14:19 +0000
Message-ID: <52FD5E2C-A620-486D-A648-5F34531B2681@arm.com>
References: <20241129091237.3409304-1-luca.fancellu@arm.com>
 <20241129091237.3409304-2-luca.fancellu@arm.com>
 <63022d0b-5761-4392-8280-fbfca8c679f7@suse.com>
In-Reply-To: <63022d0b-5761-4392-8280-fbfca8c679f7@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB8729:EE_|DB1PEPF000509EE:EE_|GV2PR08MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 32800a3a-df5d-4942-abc7-08dd1066fe7c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?b3hxUlEyZjMraVBQMHg2V1V2QUVmSGNuR2dsNUR1VE1qSHdLeituemNORTFY?=
 =?utf-8?B?V3lja2JDTCtraE1OZ1QzdkZmN1Q3aGVTL1h1amZHbFJhUk8wUzN2Um5KLzBm?=
 =?utf-8?B?ZzJQbmtxQnZpcFA0aUFaOGR2cXozVFpMZ2J4MXRFYmNsazJaZ1pCWVVUWWdY?=
 =?utf-8?B?MUlBL3BxU1JqUHJsNjArVzV2NzdIU1FnQkM1SCtnc2pHR0UwNDVzdGY2QmdF?=
 =?utf-8?B?RjdQczBmTWlHSG1zSlgwUm40aEdOSFZ6V1ZPZlB5eVJpK3JMRzJVQlFKVXFT?=
 =?utf-8?B?M1N6cjc2RVVEeVFpUVl0OGUrZHNKak1aRFVkVEhwM1U4Q283RmxJSFNET2pZ?=
 =?utf-8?B?RytaQ1lxVFAvVFFOY0JyN05MV1lvRmZ1SlVuMkNsbjc3SnhtWjVPZDltOHlM?=
 =?utf-8?B?Q3FTd2VoYndoYWxMZG11STI4UThsZFQ2UThHZnlTZEt2ZFQxZFBvdkxwT0xO?=
 =?utf-8?B?VmVNQ01FZFpXU1U4RlVkVm9VeG83SG5GOW1FQlVVVU0yV1hjNjJrZnFXOXB0?=
 =?utf-8?B?OFpXY2c5ZmsrYzVKcjU5VTNUN0pHRXhPU0xCaWs1SjYwVXovYUg1TS9yU3N5?=
 =?utf-8?B?Ym1PL3l3ZkkvdTFkVG9xU3U3UFlTNWgvOEs2enkzM1BQbURkYXJSdC9hVjZN?=
 =?utf-8?B?ME9uTjhhRjlYSnZRbzc3VG5JLzRmb0M0Tk1qeldEK3ZUcTBQR0c3ZG1pQUMw?=
 =?utf-8?B?b09CRnErNGZPRjQwTTUwcjcxczVWakhXK1VZbU9zSyt5Z3MwYWhLZkx0R2Fh?=
 =?utf-8?B?ODNpNFliTmVSQk9jQ1kwNzUrODhsR0kxRUZFa201djlEbnNEdFBUWGlVc1dV?=
 =?utf-8?B?RFZxRDNMQ3ZnandDQ3hDcGR3NzRhWHFXTmlORkNDL1hQdUIzaHJGUGxTa1k0?=
 =?utf-8?B?L2Q1YTRlMFl1S0w3ZlFXN21aNjdMbERCcWJ6NThWcGdBSkc4RjdkNVRJMmhJ?=
 =?utf-8?B?ZGpSS1c3bFp4czk0YjdhS1NubFJRM2QxUGg3WExDUG5CbnZFZXc3VmZmYWw1?=
 =?utf-8?B?VFc3WWNES29YWU41N1NvRnp4N0hpL2pRZytyelFzUW10Z0xYYXhJQVcvQTdo?=
 =?utf-8?B?YVYySDVrcjZGaDFiNjlFdkE1ZVNBQjlUMmVDdUNpazMyOHRSTzZMMDZQL1Jr?=
 =?utf-8?B?Tm1BWFlBdS9LREF6b21neWFIS3c5T1ZHb0NUdmNhWkQxamJydXh1ZDZaNDJW?=
 =?utf-8?B?c2RvVGllQzNadEpXckluQ2lNbWFiTXFaOVBlcTJyUW54SlVHdnVreEljdmY3?=
 =?utf-8?B?N09MM3pwTHVyZ1NzY29RUXdocHlkbC9zS091U1VyeUc2M3RvTzAyY01QQUxP?=
 =?utf-8?B?NEwwMSs4TXNXMDlTdy91d0gwYWRsRlZmMGlicUZjRlJoZGd3djUxRWFXeW5M?=
 =?utf-8?B?Snpmc2RoYTJTTWZVYnN4cGFzZjNGWnRCclFBUFN5cG9WQ290ZjNydzhYczJJ?=
 =?utf-8?B?NmNub0x1SXhRZnhxREtKZm1iZkphc3ZyZFZPcE05aDlLbmRhTmo5dmV2Y1M5?=
 =?utf-8?B?ZVZVVWF6NTMyejUxUE9BT0p3OXIyRVhIZmNPcVA0bWVkSzVmZDFwQVhKcENH?=
 =?utf-8?B?TGkwYTU1eGVISUx2VU5Vd3lUcmltbVJtNHRsZnlycHhXQnBWYitKczlZVHRT?=
 =?utf-8?B?QzR0eGw1MzlVNzBxT3FCVVN0U1R0UEUyMXpvTnlkNS9EUDVKRmUrR29PNFlW?=
 =?utf-8?B?dDhieGRNUGVsT1hzbkdnOEhFZmZTSkp2dW9IVHFKcENidGd6YW5wRU4wM0Zk?=
 =?utf-8?B?MXlFYzVTb1QwOGRLV2hPZlRmR3NkUjF3UUR3aEtwOUZxajZTTGtJZ2JIWE5R?=
 =?utf-8?B?RFRxQy8xZU9DQzdMQXZUNmFyTWZQc0xRMU5HNTRTVUhDU3NqdTZPdXdHOUNZ?=
 =?utf-8?B?Ykd1cUFva3E0dTJnby9wTmw2WFpwc2NCYmZqTkFFVDRlbVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <95FE5E723441E74BA1B30DFE2C9E2B78@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8729
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66a07eab-503f-42ac-ee30-08dd1066f870
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|36860700013|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VG9UclF0WVk5V1BZMXFjMm1tWEFjZnVVNFdiR2pZOXZBVWRoRyswTHRoaHlK?=
 =?utf-8?B?ZWgxRHhlaW9Md2pBZElwb1prN2RhajlXUldiU1NEZ2JlcmJMMUl6NDFRQThS?=
 =?utf-8?B?OUEvdDBBQmQrOCt0cC9mbVhmR0N4dmIzK0phUmc2eFNXSmNXaTlEK3V6TkJk?=
 =?utf-8?B?L1g3UFZlRGJGWUFkdHo1eTBhcVIxcGRwOTg3V1JxVHZUU2ZmbTlsT3pBdHZ5?=
 =?utf-8?B?aGR1b0NXdEE2am5ndkNwWWRkT0JZWWM1M05jSC9rWWowODFTNW8vbGxDUG5j?=
 =?utf-8?B?NkFjNFBndkZFeU0xZUpHUUQ4Y3dTa2s2c3V3cVpENXNLNFZtUmtzM2t5U0ZX?=
 =?utf-8?B?aExrOVJEbStFQktyOWxOQnJFNDVnOXJxZ3YwdmxmV1N0b21VUWMzbVh4REI5?=
 =?utf-8?B?TTlUdGxVMXgrTWxUTWJ5enBlM2xuSzdKejFuT1NuSkk2enNjR3QyZGtyb1p6?=
 =?utf-8?B?VU9MaGtOZjhaUjdNcjZJL2FYTHZXYldEdFZabXdZSXR0M3Fickc0dm9lRHRQ?=
 =?utf-8?B?dDF3TFJNT1RhelJIZktoRFdNTkI0OTJqbndoSEh0VU5GdUxBL25QQ0dEay9z?=
 =?utf-8?B?S3p5VnFpVW4xZXQvNWhDbUVKeVJXVmtUaUdRSDlycGMyNXhYVE9jYzM5Tm9n?=
 =?utf-8?B?bENDNU5MUzFYUGlXbFlHQk9pOUtXZFFwMEZxL01lMEwydkY1eURMNUgyRVYw?=
 =?utf-8?B?V282UE5iL2duTXNubzlSN1I3eGNXTEExQlJCOG1ZdStXakcvT3ZaK1pyK3BE?=
 =?utf-8?B?cWova25RRkVZNS8vYTluYThDWmdac0dqTjF1Q2kyMkhiVEh0VkcrM0JJNnVp?=
 =?utf-8?B?RndhTnRkMDduRGVzZGg5dDBpRVRzSFV1ZUpDdmUzdUtOQnQ3U01Ta0ZZTGZo?=
 =?utf-8?B?VXIwd0dMMHJ6VnhqYVRXNW84Z3A0U0RGUXJ5S3RRL3VqeU5vQ0VLMHhPdVo1?=
 =?utf-8?B?Q1VXY1U0Qlc2NzVNVVlYRHZSTGU5Y3gvUU1ORENqMHhFSDhPd0k5d1p1K21k?=
 =?utf-8?B?TFBLWEFlRGJxSHJTSi9SWlZINDV4ZVN3UDZ2UGErN1M3WWN3S3RicldZT3A0?=
 =?utf-8?B?MHRnM2kxUW1Hc3c4WVNEaE1JQ1FCODQvN2dLOGRsV1I5OGxWZHpza1RyejBn?=
 =?utf-8?B?SENPUjlzWjllekttRXhIb3FNVTU3UlIvVHpVczVEYk03c2lrRGxOWnNBalpu?=
 =?utf-8?B?alBnS1RrZUJINFF5dzhOc3QrNnJRY3A5dkNZbVBkRG5hQkhWVTBWRUg3U1Iw?=
 =?utf-8?B?VXk2aWVyRm1OSi84NDJCMTdEY012MU54aE9rNGd4SzRaMkhNR3EyRDcxOEp1?=
 =?utf-8?B?VmJaaEtQTEJUWC80TWsvYW9pR2RrclliUkVtYUE2Nnc3WWV5aGxpSjZTOEp0?=
 =?utf-8?B?czlRK3VoNkdEdFc4VlBZakgzcHdUZ2Y3Z3JvMXVNdlFZakZHdVhyd0N3NzZI?=
 =?utf-8?B?U2lyUUJvSHg4WDMyb2ZHY1hHcFFBWlJzOEhjYjNxWDJZWnIzcVVzVG5uaVpF?=
 =?utf-8?B?TmN5cW83SmZTWWxQNGVRQzRXVGlMVWJOYzhBSk1LNDJ6UlpuOHJWOUtJVElL?=
 =?utf-8?B?cmxzNndlSFcySkI1WGpuVEZOaVYvdEJlVERMUUJ4OGNPckk5a25hSHFhU081?=
 =?utf-8?B?WC9pcVFva0JNM01uOUtNVVFORWgzSU82UTJ6RURicWpGWlhpaGZFTC9hV1cv?=
 =?utf-8?B?MlZGdXU1UjJBYkN6NUlzMDUvMkZ4V2EvS1JiTERxV1E0bmkvcjJmNGZFZExB?=
 =?utf-8?B?YUhodmtTeGxqVHcwSWliY2hXMVBXb2xEZHNjRHp6MERCN1JzZnVpUE10MkZ4?=
 =?utf-8?B?cjR2SzYrbHA2MmN0UTRnWmdZRmlnanZuS2hrMkhSMUhRNWhCSjM1YWp5MWFP?=
 =?utf-8?B?ak5sNEIxL0FaREptSy93dm5qOXM2d3RkMnZDMW1aYlZzM2lHMkgrQnhUaldm?=
 =?utf-8?Q?j5AMvPF9IMLZ/GotmndK6r9Dh0ObfekA?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(36860700013)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 11:14:29.8770
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32800a3a-df5d-4942-abc7-08dd1066fe7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8341

SGkgSmFuLA0KDQo+IE9uIDI5IE5vdiAyMDI0LCBhdCAxMTowNiwgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDI5LjExLjIwMjQgMTA6MTIsIEx1Y2EgRmFu
Y2VsbHUgd3JvdGU6DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4veHZtYWxsb2MuaA0KPj4gKysr
IGIveGVuL2luY2x1ZGUveGVuL3h2bWFsbG9jLmgNCj4+IEBAIC00MCwyMCArNDAsNDYgQEANCj4+
ICAgICAoKHR5cGVvZihwdHIpKV94dnJlYWxsb2MocHRyLCBvZmZzZXRvZih0eXBlb2YoKihwdHIp
KSwgZmllbGRbbnJdKSwgXA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2FsaWdu
b2ZfXyh0eXBlb2YoKihwdHIpKSkpKQ0KPj4gDQo+PiArI2lmZGVmIENPTkZJR19IQVNfVk1BUA0K
Pj4gKw0KPj4gLyogRnJlZSBhbnkgb2YgdGhlIGFib3ZlLiAqLw0KPj4gdm9pZCB4dmZyZWUodm9p
ZCAqdmEpOw0KPj4gDQo+PiArLyogVW5kZXJseWluZyBmdW5jdGlvbnMgKi8NCj4+ICt2b2lkICpf
eHZtYWxsb2Moc2l6ZV90IHNpemUsIHVuc2lnbmVkIGludCBhbGlnbik7DQo+PiArdm9pZCAqX3h2
emFsbG9jKHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxpZ24pOw0KPj4gK3ZvaWQgKl94dnJl
YWxsb2Modm9pZCAqdmEsIHNpemVfdCBzaXplLCB1bnNpZ25lZCBpbnQgYWxpZ24pOw0KPj4gKw0K
Pj4gKyNlbHNlIC8qICFDT05GSUdfSEFTX1ZNQVAgKi8NCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5l
IHZvaWQgeHZmcmVlKHZvaWQgKnZhKQ0KPj4gK3sNCj4+ICsgICAgeGZyZWUodmEpOw0KPj4gK30N
Cj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgKl94dm1hbGxvYyhzaXplX3Qgc2l6ZSwgdW5z
aWduZWQgaW50IGFsaWduKQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIF94bWFsbG9jKHNpemUsIGFs
aWduKTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSB2b2lkICpfeHZ6YWxsb2Moc2l6
ZV90IHNpemUsIHVuc2lnbmVkIGludCBhbGlnbikNCj4+ICt7DQo+PiArICAgIHJldHVybiBfeHph
bGxvYyhzaXplLCBhbGlnbik7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCAq
X3h2cmVhbGxvYyh2b2lkICp2YSwgc2l6ZV90IHNpemUsIHVuc2lnbmVkIGludCBhbGlnbikNCj4+
ICt7DQo+PiArICAgIHJldHVybiBfeHJlYWxsb2ModmEsIHNpemUsIGFsaWduKTsNCj4+ICt9DQo+
IA0KPiBKdXN0IHRvIGRvdWJsZSBjaGVjazogV2FzIGl0IGF0IGxlYXN0IGNvbnNpZGVyZWQgdG8g
dXNlIHNpbXBsZSAjZGVmaW5lLXMNCj4gdG8gZWZmZWN0IHRoZSBhbGlhc2luZz8gV3JhcHBlciBm
dW5jdGlvbnMgbGlrZSB0aGUgYWJvdmUgb25lcyBoYXZlIHRoZQ0KPiBkb3duc2lkZSBvZiBuZWVk
aW5nIHRvdWNoaW5nIChlYXN5IHRvIG1pc3MpIHdoZW4gdGhlIHdyYXBwZWQgZnVuY3Rpb24NCj4g
dHlwZXMgY2hhbmdlIGluIHdoaWNoZXZlciBtaW5vciB3YXkuIChBbmQgeWVzLCBJIGRvIHVuZGVy
c3RhbmQgdGhhdCB3ZQ0KPiBnZW5lcmFsbHkgYWltIGF0IHVzaW5nIGlubGluZSBmdW5jdGlvbnMg
aW4gcHJlZmVyZW5jZSB0byBtYWNyb3MuKQ0KDQpZZXMsIEkgdGhpbmsgSSB0cmllZCBhbmQgSSBk
aWRu4oCZdCBoYXZlIGlzc3VlcyB1c2luZyAjZGVmaW5lLXMsIEkgYXNrZWQgaGVyZQ0KaHR0cHM6
Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L3hlbi1kZXZlbC9wYXRjaC8yMDI0MTExNTEw
NTAzNi4yMTg0MTgtMi1sdWNhLmZhbmNlbGx1QGFybS5jb20vIzI2MTIzNDQ4DQphYm91dCBhIHBy
ZWZlcnJlZCBhcHByb2FjaCwgYnV0IEkgZGlkbuKAmXQgaGF2ZSBhbnkgcmVwbHksIHNvIEkgd2Vu
dCBmb3Igd2hhdA0KSSBiZWxpZXZlZCB3YXMgcHJlZmVycmVkIGFzIHlvdSBzYWlkLCBzdGF0aWMg
aW5saW5lLXMgaW5zdGVhZCBvZiBtYWNyb3MuDQoNCkNoZWVycywNCkx1Y2ENCg0K

