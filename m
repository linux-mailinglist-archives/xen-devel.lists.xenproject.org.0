Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80178A3BF6D
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 14:07:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892886.1301831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjn5-0007rs-KY; Wed, 19 Feb 2025 13:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892886.1301831; Wed, 19 Feb 2025 13:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkjn5-0007pJ-GP; Wed, 19 Feb 2025 13:07:03 +0000
Received: by outflank-mailman (input) for mailman id 892886;
 Wed, 19 Feb 2025 13:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+zk=VK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tkjn3-0007pA-Mx
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 13:07:02 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2606::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67396c6a-eec2-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 14:06:59 +0100 (CET)
Received: from DU2PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:10:3b::34)
 by AS8PR08MB10269.eurprd08.prod.outlook.com (2603:10a6:20b:63c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Wed, 19 Feb
 2025 13:06:55 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::d5) by DU2PR04CA0029.outlook.office365.com
 (2603:10a6:10:3b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Wed,
 19 Feb 2025 13:06:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Wed, 19 Feb 2025 13:06:54 +0000
Received: ("Tessian outbound 30fe832213d4:v567");
 Wed, 19 Feb 2025 13:06:54 +0000
Received: from L7622e6d70437.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ACD63DB6-F371-4949-9A55-40F4974E062B.1; 
 Wed, 19 Feb 2025 13:06:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7622e6d70437.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 19 Feb 2025 13:06:42 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU0PR08MB8067.eurprd08.prod.outlook.com (2603:10a6:10:3ea::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 13:06:39 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 13:06:39 +0000
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
X-Inumbo-ID: 67396c6a-eec2-11ef-9aa8-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D2MHx51XC0QcxpojcEs9JG5zTc/cRUJ3iLFUeGfeKV1mwIuH1vak5+WvVFEygldMVDq6XlIizjgHDdLBDt+ntQwQ/M4JXcBMU69WplE9QgEOGpkwiXMDWVdPO74Y+qsPQsnKKANQMv3hikV794rH+2etekgdMOkqKmqaFisgvf0BWgXZgcx2aLHI81MpYsP5P3gIYBDgYWKk1mR9vu0w97i6s4SX86yBEWSwpAme5bngAk49cmTF0vuLuFjBjAAWRgsC+4Cdx4JTxBxybB4o2yEGB2mLpXkBacY+SoicUMSGcqO3uCJb6A2Af2PytRxvPlHR/aTfTHlOkEe1UsZ5jA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlKsNoV/ugriVGzNI8cEwEZvt5JsteMpeKDaWiaCgXU=;
 b=csytqT48gbliDCjnKMa8NOJmdZYfkDqgbg23Kp6A5hGc9OWeA7u/BWAUQmEKCHqhNhAZs8E0/tPx0B3RL/NeZj8GkChm+tnvOs0cM2sOlI3coC70HaR9eKDpUUlEsAxGZ9xTGfxZWo5dCOuR5YF89F2cBZhAjfk55E6iJv9oqrcUgRv678PuDyWdJqiQUtQVpl5wPobA/w/nnP1px68OeToMMmMNLAaJmNOPIJSPEU058X5nf2ISKPN4jKbEegrJi8Jx2zaKZkYP4NCfFSO/2l+pbHkFh9V766B36c7ofqBdut6nKQxfzn6kzkwV57ck/Z8Y+F13Yf+cXvG7ofqvKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlKsNoV/ugriVGzNI8cEwEZvt5JsteMpeKDaWiaCgXU=;
 b=J2YOYpVAZAgZUV7PJ2bf9lamBNt6d9477g5EeVldLbSsPtJhHeA21JmdEAj4kSh+HvIW0inxquw/0CvfvvHbYnOVVs2MBjhrJLCnA5CZ6JABaJdTNsnCgZrVSO4yhCubipyLv2PRq9Mu06uuvSUmqUJD02Tc4EBYALM/PYwEqd0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 69a62d7f4baed300
X-TessianGatewayMetadata: vlOv5uAv3dGyv6offz4RWTcaYaVpP6b2jAEtBWfYiVeuoygqFOJBKumVkgLZbdRFo7DdeHN7HEd/6c8/V0DXTAy7156MKSlZrf0/mtt9sqC0xYpPewyS+2g8VXw0K3bTakO6b+nc6amuTPIzUFE+BKKto6+QhKBEIixF3sBn9Nc=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a73GQhJ80CP5LGQ1IqNGo2roltbl+VZ658CAMdD0aOiVP70wR86D494ouXnSxj1cEwJXJM5Ny6t6sCHdJifBzuKRenb15Slxj3GZVZDRVUjVvjB++0/XMX6WDf247vepX0ldRUtlEE/kOtpXsNNZB6ci0w7zn5gRW3NldcdWbQM08t32mPR5AwW+2mLQnQ+bQr3QLjMO+EWh1/cfsWTui9FfG32D7uAuI8hLnMarxD/ZdmoFmL0wvCpVwlYkdGkqyP571o0mIYHsjEKQqqjCfiQyyO8nxpcw4qEvl0bjDS+WvvtcCC757cmn8RfznsAW6t2HeOeafEJ7ZMAz+3A/MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlKsNoV/ugriVGzNI8cEwEZvt5JsteMpeKDaWiaCgXU=;
 b=PzD3+VS80dgv6svReHm7XSPof67VPjrDMqBq0ARyViiEsA0DWS70OkNqBtVmkdKuONLc4E7G2pzSXETkR3yzJEb/FxB+qzx9VqcWMopUiY+KmhYCXJugNK1Y+CZ5oPMqNMFnjxgXnIm18G6ib0uxiDUMPWEgi66ZRxbhRFfKnKge2Mj9ZhdiJlHx5/pYTcoSeZH2ILQpUnhWy8AQ14Xy8fk0rkXGBGZvPC6wr0H2tPRVEaXQ4hFyjNyomAkpTK+zA+lyRIom5ePYBmd3GXlJ2vkGZsiTHdfRNMqZV4GUEl1wfsdkmKCMetJzi1SlmCa/nazIQ6ys1uYcZ4gB4JDjIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlKsNoV/ugriVGzNI8cEwEZvt5JsteMpeKDaWiaCgXU=;
 b=J2YOYpVAZAgZUV7PJ2bf9lamBNt6d9477g5EeVldLbSsPtJhHeA21JmdEAj4kSh+HvIW0inxquw/0CvfvvHbYnOVVs2MBjhrJLCnA5CZ6JABaJdTNsnCgZrVSO4yhCubipyLv2PRq9Mu06uuvSUmqUJD02Tc4EBYALM/PYwEqd0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH v3 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbgeq9NiESuirZAUKjxGV4IoLUtLNOlIQAgAAFvIA=
Date: Wed, 19 Feb 2025 13:06:39 +0000
Message-ID: <E6E21F32-EA02-4DE1-80CC-98D3A21FBF79@arm.com>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-2-luca.fancellu@arm.com>
 <bc6b785c-627e-4185-aa02-b90b9e592d08@suse.com>
In-Reply-To: <bc6b785c-627e-4185-aa02-b90b9e592d08@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU0PR08MB8067:EE_|DB1PEPF000509F1:EE_|AS8PR08MB10269:EE_
X-MS-Office365-Filtering-Correlation-Id: a307b36f-829b-4385-bcff-08dd50e6487f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?QUVDTlBtNEVVaXRicDYvRzlocFhqblA4aWRKMWo3RnNXV0VZc2tXaENTR3pJ?=
 =?utf-8?B?dWxWNnBLeVp1N1gvM1RDL1psTjArVEJCci9OVjV6MHBWL0dYSElxRXlaaDlJ?=
 =?utf-8?B?YkQ2dmhCQkFmMWdBaS91dnIvODNUeEh0WWVUZHNZMlN2R2RMeTBFUlpEeFls?=
 =?utf-8?B?Q2JMRlphZGFIUGczckhZenB1RWNHQW1yaERCMTVaNm01dHJjNFZPcVFYZFN0?=
 =?utf-8?B?eklRZmg4N2RrRVRpOEF6VUxHME9yVHFrQk9tU3R3dDAvdnlkSkZTSDlSOGZ4?=
 =?utf-8?B?QWx0bGdrTTgrOE5pOEpzYndKMEJIQ1JrVzFrR1hLd1c3QXc5SWJmMFpuVzc4?=
 =?utf-8?B?MEx6QloybS9YRHhjRW1kelNqU00yWjhUN1NONDcrOGlpUWlXSmpiaTFIOHRY?=
 =?utf-8?B?U0xxN0RsOWhyWGJsWEczN0QwVDcreHNibG10TGdsK2t3dzJ2ZjdxN200eEVC?=
 =?utf-8?B?V05ZOW1aZmJCODhIVkgvVmpoUmo4NUZQVlJXYUtCMzk0NnVOWkYxU1FnWlFE?=
 =?utf-8?B?MHVXdTBwakxKMDZ2MUk5ZUxiR2h6ZVN2TFljK2hCbmhZZGlSMEthNkRJZzJE?=
 =?utf-8?B?V0ZIcWpFZVJiUkRhVHBPT2JuWmR4T0kyaC96R3NjTit4VGdHTjJWajZ2anZ2?=
 =?utf-8?B?ZzI0U2l4QTA2TXFLRmI2eHM5SktxQm1MWXoyM2dUZkEweTBtT2lMTlFvYUEz?=
 =?utf-8?B?eURqSXpDTU9IUkI2VWpBNjEyRWw5L0lZZzJPdWxqc3M0NGJuK2E2OHEwc1Q4?=
 =?utf-8?B?U0U4djcyU1Z5SHV0NlJUNi9yZjBleTBRZVpUVXhxV1g3TnZnRDdPTXdTUDA3?=
 =?utf-8?B?VEo3NWswWXJwcGtuazh0MXBhT0IrdUIycHM2M2NLb1hNSE5lOXhKcElnUURo?=
 =?utf-8?B?VkZpN2FxdUdTeHhXRlQwUSt4UjNpV1QxeXdEUVpiMmdXREFSZDdyUG9pUU40?=
 =?utf-8?B?U0VkN1hYSlVaekpCT0pUZGFZK09tN1VUNzdiUmorZzBrMEgwZU5DZXdKYW5M?=
 =?utf-8?B?SXdFV3o3c3ptNmQ4SitlWXFlOFR3MWd4QmZ0TFhEL2lVYnYzdVN2Sk9ldXY5?=
 =?utf-8?B?TGxWVzZNc3FIdEY0dVJ2UEpoV1UzZGZHL3k2Z1VsYnFuN3NmVmtXakJYODV4?=
 =?utf-8?B?dTUyd3RNdlgrTlM5SkN1Smg2WGFDaWlORUlHdURxbzIvUko3YmpOeklaT0Fl?=
 =?utf-8?B?MGsrRVVUdEh3RmNJaS9JT2wycFh2WFBidU00NHo3ZXNUZ0ZramR2ZnpOR0JN?=
 =?utf-8?B?T2loTGd4cnhzVVNZRVg0SHVJUzVvUUZud2M5Y005MWw5T2ptd244QklqNU9y?=
 =?utf-8?B?MXhxekg1RUNaRHQ1Wkswd1JGQndqOUw3dnhXWTh2cEp1UmtnMzN5QXd2QmVn?=
 =?utf-8?B?dElDNFIyZWRndWxlQ0tOY3hxR2g4d2NXazhiQkE0STlnSzVjRWFEK3c3V1VT?=
 =?utf-8?B?V3dUaE5ncEV3M2FjMjJ6SEdiN1Q5MmVydW1yb2o0bHdpOFhETnpZTjRzUUUy?=
 =?utf-8?B?OVV1TjNROG1NV25WTFBKeVdZblJ0K0pLRGxaOFNZbG4vbEpCR1FlV2NybG45?=
 =?utf-8?B?TFIxaTlrbHpLYzN3TnJMcmhUNEV6LzNCK2JLUHc2QjVOa1pYQzNWQmJuNHZi?=
 =?utf-8?B?NVhRTWFOTUQwL2QydGNGR2pLblB0YlJhbGRXb0wxbW9VTm1aQUZIdEhLb3hs?=
 =?utf-8?B?d1AwTlppb1NxU0ZTeUl5dzVUSHF6eGxJOVNGNmpFVDZKejJNU2xwRWlqUVB3?=
 =?utf-8?B?Mmg2dzc2MVo1YnlTU3UyYXl4MjJRN09MZFp3dXliN2dTR1pYTzZxeHdIZ3Nk?=
 =?utf-8?B?RzdYNkNoNFlmL2RFZDZOdGsxS2V0ZU5XbndYdkpob0VBRnRpbEt1aWxqK3VT?=
 =?utf-8?B?SlNMQlN3dnZoK3dkMHZZUHBuZDhHN3lVNnhYUzlITFVqenF0Y01kYkJQYTRk?=
 =?utf-8?Q?rv0P/DpkVRlBUs+mA947Z07V8gfMIyfo?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A17E9F3BAFF2F4FB2208EA82F2CAEAC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8067
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	688a9e11-348a-47c2-d8bd-08dd50e63fa0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UE1QdHA1R2RHUGp4SWE3SGkvY2NVeUJpdERNN2p5MFB5ZlNPQi91MVloK3Jl?=
 =?utf-8?B?bmNCTnFFTWV4dHk2N2FzUXQvRjNMZi9Bc2VXVHRYUytOdGdmb2o5a0ZKejhT?=
 =?utf-8?B?VmQ4UnRHbURFOElEKzlNOVFnNXBPVFZ5d2dZWVdjWXZxN2xFcGtJUCtGUCtC?=
 =?utf-8?B?VWlyMUo0Y2dyQUsySkNDd25OQWVDVFdkYTcwMDVWTng3dHpPRHByQk1wWk9N?=
 =?utf-8?B?Zm9nZHRPbkZ4UEdiMy9UMWlsS0N6VlBDdm54Vkhtdmg3N3prOHNmWjEwSVdM?=
 =?utf-8?B?WGd3WkhHUnBmMUZOWGcvZzczazdmNFFzUEpyRVpWTjI0cDFJVG9lR2JXZmtM?=
 =?utf-8?B?VXdiMU5HamNHRFNvclMyNHZrT0Mva3lWaTN4bGNBbXNyTG5EU1hOOHh5d1Nt?=
 =?utf-8?B?eHZxV1NQRElwMHRsTFByejd1dVgwS3dXTHFsa2xLN3cvU3RYR2tJOVZ5a2tv?=
 =?utf-8?B?YU9VZzh2WWVGNm9CZXowSUltZmtpdzA3bmVQdWZiZUN6TDhKWUhnRTRWUmx1?=
 =?utf-8?B?S0IwYk5VUzloSkRJWFlnVHRyRHpGUXRwVjQyLzcrdXlQSkxtaXdRSzZtZkNv?=
 =?utf-8?B?L2JOR3dXRzFWdjFlT3UyTEpaMThsL1orU2FtMlIvdEpSV1FUY0t2RGgxL2Vi?=
 =?utf-8?B?c0J4eExmTHdlb0V0NVlxUGZmTW9FN2Y5VXZpQ0NqZDc4alhzVG1qSENvM21U?=
 =?utf-8?B?NUFRU2k1Q0lpMjYvcTYxZkxac3NIQmYvcFR1SkJya2ZPaGU0WkEwU3EySUJI?=
 =?utf-8?B?V3VVT1drcm5IenFmdDkwUmFnSkswQWQ4cnZsWjdyR04wdUtocmplUTdleVRl?=
 =?utf-8?B?TkRzU2x3QVZxRzExVUcweGYxOU9mL3cyZlM1b2hQWGhXbUJTQm1FZk5uTFJk?=
 =?utf-8?B?VlMvWTNxclJkMlVqbnd2ajNKT2F1eDhwcitXeVVBOTZ2eUhhR0lXY2w5SElu?=
 =?utf-8?B?U2gxSlQ1QUZoS2xEQzNBSGlVa2JNRkFsN0ViaGlKQVRxNUhicFRCeTVjTkhX?=
 =?utf-8?B?WCtocW5EN1pmdFVJaXRCQVpFR2JGdXNPbWkwTVNqWE5paEowOGw4K25obTdD?=
 =?utf-8?B?bGNLTEpvRTVCYnp6R2VTaEdiTVZuaGt5MmZRc2M0eFZoeE91UVY1K2xGRE9L?=
 =?utf-8?B?RjY3TXZRa0hZaENSeDlITFBDQzE2THlmN1V0OFRCdU5QWEp2dWJmbGtqSEFq?=
 =?utf-8?B?RUI0SFZTYXd2Rk1hakFibUczWTVhUjA2TTlJeC9sNjFUd2xtZTVTN2FRN0ZR?=
 =?utf-8?B?UVBTS2lhK1ZRT0JaU3lxcnNxd1Q3a1F2bzNpbmszWFRYV09BaitpZW8xRjJh?=
 =?utf-8?B?NUJxRmE4OUNoOFo3bXVmOUtEb2J5RkhURG81eklWdU1hdjBoNm40Tk80K0xI?=
 =?utf-8?B?YmVxOEFOdnRhL3BzdEtUdnJMQm9nUHBBTnVrQ01PVXNlbjNlNW5VdHkwZm5I?=
 =?utf-8?B?MmZibjNBVkI0WWI5ODVKdE1rYk9ObnZ2YTlPclRZYVNqVmhtNmZabXFQeDZG?=
 =?utf-8?B?anBGTEtwQzV5SVBzM29vSkhtemZ2Smp2bCtUdnhsWUJXT09iVDRmc29tc05R?=
 =?utf-8?B?dUpXM0ptK3RWajRzOTZLNlpDNitwTDBjQ01hV0dDS3JLUllMSEwzUGVOQXNu?=
 =?utf-8?B?YjV5dFhCQ3RtcVhCbDFCdGEvV3M1SHhsMC9XdEJlSWhRaDhDd2dCTWZwZXU1?=
 =?utf-8?B?TUxqVUx2dXBBSk9nckRuQ0ZXV1ZzNTBCS3E5NTZhLzJTV09tOUJyNi9iTEEy?=
 =?utf-8?B?aHB3eE5nNk04bkJjTzNqcWRYQW5DU0pueTNuSnRwV1Q2SUVFUFhzZlNoaEEv?=
 =?utf-8?B?U3c3QnBPcE1iMXhkTzl3M1kzNENJcmk0WDIwQkdZM0VVbGdxWjJ4S3RWRnhV?=
 =?utf-8?B?ZVFQYkhuQ0tjaGg2NXJMam4yUzhkdWZOTTlmZlJYVloxTW9SWVJyMkdkMVNa?=
 =?utf-8?B?a1FFRExvWnZuMHU3c2ltWHh2dENwSDJWZDRiQzgrbHpWOVdiV1pvdjdSRlFS?=
 =?utf-8?Q?NhsJOpBeiagFYEvS6hE4oWD6VqHzr4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 13:06:54.5353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a307b36f-829b-4385-bcff-08dd50e6487f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10269

DQoNCj4gT24gMTkgRmViIDIwMjUsIGF0IDEyOjQ1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTguMDIuMjAyNSAxMDo1MSwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+PiArKysgYi94ZW4vaW5j
bHVkZS94ZW4vaW9tbXUuaA0KPj4gQEAgLTExMCw2ICsxMTAsOCBAQCBleHRlcm4gaW50OF90IGlv
bW11X2h3ZG9tX3Jlc2VydmVkOw0KPj4gDQo+PiBleHRlcm4gdW5zaWduZWQgaW50IGlvbW11X2Rl
dl9pb3RsYl90aW1lb3V0Ow0KPj4gDQo+PiArI2lmZGVmIENPTkZJR19IQVNfUEFTU1RIUk9VR0gN
Cj4+ICsNCj4+IGludCBpb21tdV9zZXR1cCh2b2lkKTsNCj4+IGludCBpb21tdV9oYXJkd2FyZV9z
ZXR1cCh2b2lkKTsNCj4+IA0KPj4gQEAgLTEyMiw2ICsxMjQsMjggQEAgaW50IGFyY2hfaW9tbXVf
ZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7DQo+PiB2b2lkIGFyY2hfaW9tbXVfY2hlY2tf
YXV0b3RyYW5zbGF0ZWRfaHdkb20oc3RydWN0IGRvbWFpbiAqZCk7DQo+PiB2b2lkIGFyY2hfaW9t
bXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKTsNCj4+IA0KPj4gKyNlbHNlDQo+PiArDQo+
PiArc3RhdGljIGlubGluZSBpbnQgaW9tbXVfc2V0dXAodm9pZCkNCj4+ICt7DQo+PiArICAgIHJl
dHVybiAtRU5PREVWOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW5saW5lIGludCBpb21tdV9k
b21haW5faW5pdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgb3B0cykNCj4+ICt7DQo+
PiArICAgIC8qDQo+PiArICAgICAqIFdoZW4gIUhBU19QQVNTVEhST1VHSCwgaW9tbXVfZW5hYmxl
ZCBpcyBzZXQgdG8gZmFsc2UgYW5kIHRoZSBleHBlY3RlZA0KPj4gKyAgICAgKiBiZWhhdmlvdXIg
b2YgdGhpcyBmdW5jdGlvbiBpcyB0byByZXR1cm4gc3VjY2VzcyBpbiB0aGF0IGNhc2UuDQo+PiAr
ICAgICAqLw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+IA0KPiBIbW0uIFdvdWxkIHRoZSBm
dW5jdGlvbiBiZSBhbnl3aGVyZSBuZWFyIGxpa2VseSB0byBkbyBhbnl0aGluZyBlbHNlIHRoYW4N
Cj4gd2hhdCBpdCdzIGV4cGVjdGVkIHRvIGRvPyBNeSBvcmlnaW5hbCBjb25jZXJuIGhlcmUgd2Fz
IHdpdGggIm9wdHMiDQo+IHBlcmhhcHMgYXNraW5nIGZvciBzb21ldGhpbmcgdGhhdCBjYW5ub3Qg
YmUgc3VwcG9ydGVkLiBCdXQgdGhhdCB3YXMgd3JvbmcNCj4gdGhpbmtpbmcgb24gbXkgcGFydC4g
SGVyZSB3aGF0IHlvdSBkbyBpcyBlZmZlY3RpdmVseSBvcGVuLWNvZGUgd2hhdCB0aGUNCj4gcmVh
bCBpb21tdV9kb21haW5faW5pdCgpIHdvdWxkIGRvOiBSZXR1cm4gc3VjY2VzcyB3aGVuICFpc19p
b21tdV9lbmFibGVkKCkuDQo+IFdoaWNoIGluIHR1cm4gZm9sbG93cyBmcm9tICFpb21tdV9lbmFi
bGVkIHdoZW4gIUhBU19QQVNTVEhST1VHSC4NCj4gDQo+IE9uIHRoYXQgYmFzaXMgSSdkIGJlIG9r
YXkgaWYgdGhlIGNvbW1lbnQgd2FzIGRyb3BwZWQgYWdhaW4uIEVsc2UgaXQgaW1vDQo+IHdhbnRz
IHJlLXdvcmRpbmcgdG8gZ2V0IGNsb3NlciB0byB0aGUgZXhwbGFuYXRpb24gYWJvdmUuDQoNCldv
dWxkIGl0IGJlIG9rIGZvciB5b3UgYSBjb21tZW50IHNheWluZzoNCuKAnFRoaXMgc3R1YiByZXR1
cm5zIHRoZSBzYW1lIGFzIHRoZSByZWFsIGlvbW11X2RvbWFpbl9pbml0KCkNCiBmdW5jdGlvbjog
c3VjY2VzcyB3aGVuICFpc19pb21tdV9lbmFibGVkKCksIHdoaWNoIHZhbHVlIGlzIGJhc2VkIG9u
IGlvbW11X2VuYWJsZWQNCnRoYXQgaXMgZmFsc2Ugd2hlbiAhSEFTX1BBU1NUSFJPVUdIIg0KDQoN
Cj4gDQo+PiBAQCAtMzgzLDEyICs0MjksMTIgQEAgc3RydWN0IGRvbWFpbl9pb21tdSB7DQo+PiAj
ZGVmaW5lIGlvbW11X3NldF9mZWF0dXJlKGQsIGYpICAgc2V0X2JpdChmLCBkb21faW9tbXUoZCkt
PmZlYXR1cmVzKQ0KPj4gI2RlZmluZSBpb21tdV9jbGVhcl9mZWF0dXJlKGQsIGYpIGNsZWFyX2Jp
dChmLCBkb21faW9tbXUoZCktPmZlYXR1cmVzKQ0KPj4gDQo+PiArI2lmZGVmIENPTkZJR19IQVNf
UEFTU1RIUk9VR0gNCj4+IC8qIEFyZSB3ZSB1c2luZyB0aGUgZG9tYWluIFAyTSB0YWJsZSBhcyBp
dHMgSU9NTVUgcGFnZXRhYmxlPyAqLw0KPj4gI2RlZmluZSBpb21tdV91c2VfaGFwX3B0KGQpICAg
ICAgIChJU19FTkFCTEVEKENPTkZJR19IVk0pICYmIFwNCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZG9tX2lvbW11KGQpLT5oYXBfcHRfc2hhcmUpDQo+PiANCj4+IC8qIERv
ZXMgdGhlIElPTU1VIHBhZ2V0YWJsZSBuZWVkIHRvIGJlIGtlcHQgc3luY2hyb25pemVkIHdpdGgg
dGhlIFAyTSAqLw0KPj4gLSNpZmRlZiBDT05GSUdfSEFTX1BBU1NUSFJPVUdIDQo+PiAjZGVmaW5l
IG5lZWRfaW9tbXVfcHRfc3luYyhkKSAgICAgKGRvbV9pb21tdShkKS0+bmVlZF9zeW5jKQ0KPj4g
DQo+PiBpbnQgaW9tbXVfZG9fZG9tY3RsKHN0cnVjdCB4ZW5fZG9tY3RsICpkb21jdGwsIHN0cnVj
dCBkb21haW4gKmQsDQo+IA0KPiBDb21pbmcgYmFjayB0byBteSB2MiBjb21tZW50OiBXaHkgZXhh
Y3RseSBpcyB0aGlzIGNoYW5nZSBuZWVkZWQgaGVyZT8gSWYNCj4gdGhpbmdzIGJ1aWxkIGZpbmUg
d2l0aG91dCB0aGUgbWFjcm8gYmVpbmcgZGVmaW5lZCB3aGVuICFIQVNfUEFTU1RIUk9VR0gsDQo+
IHN1cmVseSB0aGV5IHdpbGwgYWxzbyBidWlsZCBmaW5lIHdpdGggaXQgYmVpbmcgZGVmaW5lZD8N
Cg0KSeKAmXZlIGRlZmluZWQgYW4gZW1wdHkgc3R1YiBvbiBhbiBoZWFkZXIgaW5jbHVkZWQgb25s
eSBvbiBNUFUgc3lzdGVtcyBmb3IgdGhlDQpwMm0gbW9kdWxlLCB0aGlzIGlzIHdoeSBpdCBpcyBi
dWlsZGluZw0KDQpJIGRpZG7igJl0IG1vZGlmeSBwMm1fc2V0X3dheV9mbHVzaCgpIHdoaWNoIGxp
dmVzIGluIGFybSBjb21tb24gY29kZSwgYmVjYXVzZQ0KaXQgd2lsbCBiZSB1c2VkIGFsc28gb24g
TVBVIHN5c3RlbXMgKFI4MiBoYXMgTVBVIGF0IEVMMiBidXQgTU1VL01QVSBhdCBFTDEpDQphbmQg
SSB3b3VsZCBsaWtlIHRvIHN0YXkgdGhlIHNhbWUgYW5kIGJlIHVzZWQgYnkgTU1VL01QVSBzdWJz
eXN0ZW1zLg0KDQo+IEFzIHBlciB0aGUNCj4gcmVzcGVjdGl2ZSByZXZsb2cgZW50cnksIHRoaXMg
Y2hhbmdlIGxvb2tzIHRvIGJlbG9uZyBpbnRvIHdoYXRldmVyIGlzDQo+IGdvaW5nIHRvIGJlIGRv
bmUgdG8gZGVhbCB3aXRoIHRoZSBvbmUgQXJtIHVzZSBvZiB0aGUgbWFjcm8uIE9yIG1heWJlDQo+
IGl0J3MgdW5uZWVkZWQgYWx0b2dldGhlci4NCg0KSSBkaWRu4oCZdCB1bmRlcnN0YW5kIHRoYXQg
eW91IHdlcmUgb3Bwb3NpbmcgdG8gcHJvdGVjdGluZyBpb21tdV91c2VfaGFwX3B0KCkgd2hlbg0K
IUhBU19QQVNTVEhST1VHSCwgSSB0aG91Z2h0IHlvdSB3ZXJlIHJlZmVycmluZyBvbmx5IHRvIHRo
ZSBzdHViIGluIHRoZSAjZWxzZQ0KYnJhbmNoLg0KQ2FuIEkgYXNrIHdoeT8gaW4gYW55IGNhc2Ug
d2hlbiAhSEFTX1BBU1NUSFJPVUdILCB0aGlzIG1hY3JvIGlzIG5vdCB1c2FibGUNCnNpbmNlIGRv
bV9pb21tdSgpIGlzIHJlc29sdmVkIHRvIGEgbWVtYmVkIHRoYXQgZG9lc27igJl0IGV4aXN0IGlu
IHRoZSBjb25maWd1cmF0aW9uLA0KYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8NCg0KQ2hlZXJzLA0K
THVjYQ0KDQo=

