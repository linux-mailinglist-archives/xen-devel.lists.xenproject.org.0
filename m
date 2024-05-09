Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D05AF8C0CFA
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 10:59:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719141.1121740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4zcD-0007uh-26; Thu, 09 May 2024 08:59:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719141.1121740; Thu, 09 May 2024 08:59:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4zcC-0007sM-Vg; Thu, 09 May 2024 08:59:00 +0000
Received: by outflank-mailman (input) for mailman id 719141;
 Thu, 09 May 2024 08:59:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cZF+=MM=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s4zcB-0007sG-Ka
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 08:58:59 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ecf55b8-0de2-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 10:58:57 +0200 (CEST)
Received: from AS9PR06CA0595.eurprd06.prod.outlook.com (2603:10a6:20b:486::29)
 by PA4PR08MB5917.eurprd08.prod.outlook.com (2603:10a6:102:f1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 08:58:55 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:486:cafe::72) by AS9PR06CA0595.outlook.office365.com
 (2603:10a6:20b:486::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Thu, 9 May 2024 08:58:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Thu, 9 May 2024 08:58:54 +0000
Received: ("Tessian outbound daa456608199:v315");
 Thu, 09 May 2024 08:58:54 +0000
Received: from c1bf2658ad95.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2948FFA0-EB45-491A-8867-C9AFF8573DA3.1; 
 Thu, 09 May 2024 08:58:47 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c1bf2658ad95.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 May 2024 08:58:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB6714.eurprd08.prod.outlook.com (2603:10a6:10:2a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Thu, 9 May
 2024 08:58:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 08:58:45 +0000
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
X-Inumbo-ID: 5ecf55b8-0de2-11ef-909c-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=LFfsvtQB6lv+VK3l6n8InjlKp+ftF9jLJdEGPoy+eNoJ8J0BrLH3YvWYVoMMOPJNOf3KdLSCjaaVh9tJT56xDh3cqhVsRmKTZWpx16bhEH9ZVLOpZujdWC7JA3gB9QNQ31hJ4a4SsCuWfG+tmxHQjnMEmmW0Lq8TOLQxJIZ6wgCBzp52M468bd2VcjRAumq+/NPQY4rKDxN3Adhp8EILfGBrDMdqhDUsqDE290/JKamWiAa4S6kDUMGSFbVtRwC1/TlA9TDLsE5LrhLnhOyTOz0+q5IQOURbP7PmGoMrITJ6/TmUzglRfpu9bG2tlPZMMYQpFSO7YrlhOK6T0WjEhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB07rgyqgbV5QuSTYi/imjCNAQ3g6YJl1ZO3tXKI8eM=;
 b=gqwiznNXFuFklCz1vFmSgXdt3K02x8TtnG40oe42woL67kb6xac5uk0ANI14QsZSvljWlagzxvyEWy3qKpewhzEmbPCxqHfgGtHpmpzMDDrVfg8YlzzQMxVl+BKzSMMI1tB7JvX4BuDmQlICz1AZMC9T+kq7o2YnwbQNb5TspHTBeD1jVvLX1uy+gUhX/x7c7wvffwd2gZZbviFrhntr6t25QweeEBANPEz6bIaqMKnFyFPIo06pn/sw343F7nbuYDMnI73mFuy8to1DdP0tgQW7CuQvRLqdI//5KJzPhVPZVW/ebr8Cruqw2pFLNls4CgoafKZbwKouT+BLRw2jzw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB07rgyqgbV5QuSTYi/imjCNAQ3g6YJl1ZO3tXKI8eM=;
 b=jDn1hZPh6j6VVSSK+nU73AcJ6ywXn1k1fjEkHOgLtniW7tmYiPZwyWWWHHvOWuRn+/Ud+U5uQtkPO8asWoWN0st0DQq7oV5WG8KptVNvzvi4uNoLSl12sC+xZC/50m6hD30NryMTr68XibCiWaqakLJKpIKSkgvbgaOIvbY/mu0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ba81e519cf24e559
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i6sMbQzMVc4q7BXVYFduQOHyQ9b4TvB4mLy/m3nhQvK4uU8ru0onu8JnRvBTvflRee5LtGJ374p6QGwmTdo/fF3+lIVDNpmk+tNqQZpmtUqId0BZrnQB4eflSi2g7gAtq6DMKTqV+gswum9HoYg9DFghs00+rey+Ju+qxhcmJobOehDtdK34keLy5sFeU8gL0QqN9HLcApAKi/64xT2Y37urhJbwK7JU+OlAePoyIBa+adDLzGR16+lmuvfZJWVr8JI10ulJMFwy9h0bFIoJTAI8xeNALTwtMRCn8D0E0UzesUSYmwzCuq7L6izxs76omKjcriK2d7NP7HetEGRdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GB07rgyqgbV5QuSTYi/imjCNAQ3g6YJl1ZO3tXKI8eM=;
 b=NdO7RFQUGy8GswiZyV3KAfDhATat9UntPm7ib1dQ3CIv3TBtFLpPZdiRdsWCWQ9x0pIcnqqlJLjvHu+FRgLohGO5M+Ae3mE9gGV+yQYSX2JyxwlBDZz62diVp4OdiL69Y9a3HtF9Q/P4C50+acctoxe0oHMCZyszrngwIjFs1rx56hDFjpuw7UDyky3PZn2LGxj5wvELwroQ4/M10y3lQqhyKL33HHnvf4LTx9qT91kG2Ja3V88/Fgng/Pz/TfKue5ofeQKe5DR6D1JQ6Bae8emeIYhqxKtUlrz+x8mf5eCeAmb4+BTGFDc581QeS1He47yyKhFjZqWfFDutAVpBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GB07rgyqgbV5QuSTYi/imjCNAQ3g6YJl1ZO3tXKI8eM=;
 b=jDn1hZPh6j6VVSSK+nU73AcJ6ywXn1k1fjEkHOgLtniW7tmYiPZwyWWWHHvOWuRn+/Ud+U5uQtkPO8asWoWN0st0DQq7oV5WG8KptVNvzvi4uNoLSl12sC+xZC/50m6hD30NryMTr68XibCiWaqakLJKpIKSkgvbgaOIvbY/mu0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/7] xen/arm: Parse xen,shared-mem when host phys address
 is not provided
Thread-Topic: [PATCH 4/7] xen/arm: Parse xen,shared-mem when host phys address
 is not provided
Thread-Index: AQHalVfmskMuPI2TlEqCln/x5OWH6LGNVmgAgAAV/wCAAUcPgA==
Date: Thu, 9 May 2024 08:58:45 +0000
Message-ID: <E3AC4A71-1C0E-48A7-B2FA-09EC8B5F86FD@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-5-luca.fancellu@arm.com>
 <59b02ed2-e543-4bfd-946e-6a82919c582d@amd.com>
 <A9708869-7739-4306-8527-1A0978D542FF@arm.com>
In-Reply-To: <A9708869-7739-4306-8527-1A0978D542FF@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB6714:EE_|AMS1EPF00000048:EE_|PA4PR08MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: e39114c9-dd45-4bf1-f394-08dc70064171
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TG03TEUwL1pCbHBWdE5mWnhTVTZxOVhvdzJMWFlxSkVRMTNXQzJkNSt1VGYx?=
 =?utf-8?B?K0Uyak1DeERxNFdBTzBkMmNraXY1N3hUL1Z4N3ZsQUU5K3p2U09ZWFl4UHBy?=
 =?utf-8?B?cXdkRmlrYTJpdVpoV2VCaWUrNkVtc2RvcVlYMGRkSU9TOENuVklMOHVuWHM5?=
 =?utf-8?B?SUtsZ05Td0FEMVM4dG9KaTRlWEx1TUxWTk5Nd0dKNlVjL2J6U2VRU0ZUYkRt?=
 =?utf-8?B?elNodUJ1dmJGUWNmK0xOMTR5aUhtancvSWhFMHRvL0c4bFBPY1IyYnlQc1Fa?=
 =?utf-8?B?aXBNTm44Zjd0elNtWktjRDR4Wm5PRWcvbUw3UTlXOUJob3VkeWhOZStMb1kw?=
 =?utf-8?B?T3YzSlBpN1VoV2VEOXgyMUlhWWoraE5YTWZZTEt2Tks0ZEhDY0NyUU80QThF?=
 =?utf-8?B?aDlrK1lpUVBLUDg2MmxkdUwwWUlDR0pUQy9Sem5mWGRLZkNWelZjN3JKSWNQ?=
 =?utf-8?B?VExDOWlqcWVmYXIwZWU3UVR1YVJvejZ3dUZhMURnK2VzL3dhUTNkcHk4S0g2?=
 =?utf-8?B?Z1VaZjdqUk9zQXcxWmVXSjd6RzdjMk1MZkNiV3AzK2lwa3REWWVqWFcrQTBu?=
 =?utf-8?B?aDRQVEJiWmQ1Z0ZNNm5vZHdpSi9ybnhOeU1aQndBM2hzZzRiZFR4aDV5OVFy?=
 =?utf-8?B?d0lDZEhzTk1uOEc0b0FPZmdSZ2Vmc3hJR2RQLzFWMDlNbWdERnN0Q2IxV2oz?=
 =?utf-8?B?VUl5TTI1ZS9ZV0ZnOTBBRXBrajFMQVBPbEFJLzFGRXNoOGUvd3dDUXl5V3pY?=
 =?utf-8?B?aTYwcW1UV1RWSTllMUVlN0lrc3dBWVpRVjBQRjdBTEFGR3RlNGpWUHZ4Y2dw?=
 =?utf-8?B?dWNzMnNORzZLYzA3cCtlQVE2RGZWSG5FY2kwUyt0QU9GaTFXN2wwdnZUVzMy?=
 =?utf-8?B?ekdPY2lQVUpjdDViZi9MbUZWU2VGclQyUUczT1JRMzUvR1hSYlJDSHo2eEJB?=
 =?utf-8?B?RHNvZjVQcDBrcDRhb1YvZnhEWkxISzVmMXlxZDc4OUZtSmIzNE1GMkRYTDBh?=
 =?utf-8?B?c0Z2NVFhQWh3d1kvd0Uvc3ZsNnNzck52c2tlSGpoM09zME42b0N4VWhkQm9M?=
 =?utf-8?B?b3hadUdXSGw5ZkRhWE5qcXlYQmRYOFdjNVR3dmJQTmpMNEhCQmQ4UXFjTldP?=
 =?utf-8?B?R3IvZU5iNUIvVE1hRjVydktIUjlwTFpqbURITWxsVUdzTVZSb3E1VlhmTk02?=
 =?utf-8?B?L2s2WXhueGx6V0Z0VDdKQmdmd3ZsNjR2Qyt2WTV0NUYrdG9yNC9yM2pQVkFt?=
 =?utf-8?B?UkhDNmhTRkVzaUFrVFdxQ3A5RENsOWl3QzVwaDByd1hrelpEWmJUd1NaS2da?=
 =?utf-8?B?R1JSWHN3MTV4SFN3bCt6QkFkSlFhMEc2QS9VNVUzeCtQQzNGdXI4TTBTUERW?=
 =?utf-8?B?OTFxOWNPVXZxTm1zVSt0aUI1bXkwRGZMaE1KYlNNb2JkeVV2bmNScUdCMUVh?=
 =?utf-8?B?ellJZVRlSm1ZRzErYVdaWWpMVTY0YndVNEJBWUdCQUl0M00yUWNiTERjT05S?=
 =?utf-8?B?dDhuWHRvUW5xS3o1SHhub3poSzc4b0dvYlR5MEJZQndra1RjQ1VPczVrMjEw?=
 =?utf-8?B?dks1cjEwMkFBZTI2NzVtT2xrdDIwNmZ1eEFzd0hOS1pzQVduZ0UwVlB2Wkx1?=
 =?utf-8?B?TXV0SFNWK05sR1h4RmlXM012QkkxOVYrNkdESmlJWEZwMWpRa1FIOEZkS3NR?=
 =?utf-8?B?Q3RaSEdjQS9LbVg2YkRSNXAzaGpYdmxaM1ZYemx3VjExTHR1bXVtQzM1RnZH?=
 =?utf-8?B?L0JHWktnUE9NUGE1cVBiS1Zwa3gyNWIxdzRtOHBEeHd5dXkxbDF2WXhjQXJN?=
 =?utf-8?B?TVc0bFF2RzhjS3ZCd2R0Zz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <13318C2E59F5A94A9B959424F9C096B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6714
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	253d6509-e540-4263-3e14-08dc70063bd8
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|376005|35042699013|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnB4ckhIZDBRd2FzYzRscTlqOHF3dmduN05xNlRaT2haMmZPdHMxUUhwNlpN?=
 =?utf-8?B?S0xYd01hYndseXVoUXR1ZGg2NWpWMzNLU2ZtK2pZdVBGa2dUSHp2blVVdWRr?=
 =?utf-8?B?a1VZcmJXTkF1eU9EUzVKYitKNkRNNWpBekFwUFhESWladnhHd1I5SUhhdG1G?=
 =?utf-8?B?RWM4MmpBM01WSkVDTjZzTURXTnhNaGVvSWZCQ2locXMyWXFWY0trdG4yQmlx?=
 =?utf-8?B?QWF3RmpIb3VjdkdZMzkzNDJyZ0xkR0dGMWJVOHh5NUhSQ01tQldXa0YzZmhD?=
 =?utf-8?B?V2VhTkNyTjNrdm9ZY3ZjV0lyVDZlS3hHRHN0S2hiTEFsaUhQMlFPQXBoZlNv?=
 =?utf-8?B?TnI4eHhLN2QvR0VpbUpTWkU2TjRocDdJM1lCT0g2Sys5QWlHKytXUktMRzN2?=
 =?utf-8?B?dUtMRTQ2K05ndW5aOEJxRXJmOURpYlJyTEVnZTVVZVJuc3FXOEgwR05JZEpj?=
 =?utf-8?B?c0ZJamFxbW5tY3EyUGJWZFR0LzBKU1NrVWNxOUpZUDVQVmNFSEdtWGRVSEdm?=
 =?utf-8?B?VVJaN3BKN1MvclhKc095NGtIWUFtbE9UWUVDVVMwZWFnWjZuaGgxdzdqZWRS?=
 =?utf-8?B?TDlLYjdvQ1Z1ZC9UV2lBMGFOYXVzNUxPdEhKSlR6cTAxRWFpN012MVFCS0Jp?=
 =?utf-8?B?NzV0WmZGUjk0VlE3OGNBb0hQa1d0aTJvV2Rka2VWVnlrcEhjVDI2Ky81cThs?=
 =?utf-8?B?MG1KOGNlTnoyN3BzUHBaK2d4RWFqc3JublU3ZDVOaURpUVZhUE93OVAzelJS?=
 =?utf-8?B?MFFMVnB0YlFGVjFvSUh0WHlldjJobnc0N012OU5scE9xMHVrNytMOTIwM1JE?=
 =?utf-8?B?aFZiaGVCcGVjYmdCSE01dnJpaVMwODZUS2xESlg4NnBobXFrRkNtbGtPQWQ1?=
 =?utf-8?B?UGpBbVB2N0NRRzhSTE11OU4zRFpESEZOR3hXenkzdFZPUjNhSE05UFFuOW1r?=
 =?utf-8?B?THJIeXh6UDY3K1dCakJ2MmdJck9XTHFIcEdLbThjOVNaMXlCR3Q2dURwL2lq?=
 =?utf-8?B?WnB6UEFaZXVpZEh4WjBZNzd4L2VDRm5EVUlZUVY0TDZ5L01oU2d2WmIyRGwr?=
 =?utf-8?B?dnlFV3ZRQTJCdTM3a290cC9jcGRpeWx6R0ZPSnVOcitxTTlBUmcwVWt2K2c1?=
 =?utf-8?B?TGxUeThvYm1MOG4rODA2TkZhOFBReDdYVzNmcUMyMEN2ZXNkTFozQzY4YXpM?=
 =?utf-8?B?V2NvVGd0MkZDT01HSkVrdXhFWnRTTEdCU3MrVlhXb0VCY3N5U2FKYWY5TWh6?=
 =?utf-8?B?Y0tEeUJXUjNNS1RzeXhVMUJWUTRpZnVjNUhNTi81TE1oTnNhZzZCS3pWMHk0?=
 =?utf-8?B?YUt4QUxUbFZSRVo5bk9hVjg4SXpMYTZ1bHhtSmUyRmVuNkRFMFg3YjNnVktZ?=
 =?utf-8?B?UjZ0dHczL2Jjc0RpYkFLOHhkQ0JRZXZFaVEyYjJzeHNZRWtnTE4zOFRWSXlI?=
 =?utf-8?B?Tkk4MWN3QU1HZnJmb1JVVTJUYzE1c0IzTzJBV3RJcGRaYnVTcG9ZNWRrSFZs?=
 =?utf-8?B?UHF4clE1K0ZIUm1jNHVmeGNrazYwa1dISERwa2dGaGZVTFlLbm90S1BOOGlr?=
 =?utf-8?B?WWdaN3E3NVZiVlduOU9vZDJIUW1pdklOUkVBanZNckN0OUtOU0lPZ0JyVTF6?=
 =?utf-8?B?Y2hoWHBvbkJCbnlVWFNzSGduYjBBT1Y3SE55Zkh2WmNKcG1VKzVRZ1Z1TjVy?=
 =?utf-8?B?Qlg4ZmthMW0xd0M1bE13NXliWUtVc2Jkd1FzN3h2TlI0SW9IVXdDWFJ3cnlj?=
 =?utf-8?B?SVQxejVudnduZVdKTVVzcVJXeTlUdGNnS1JPd09zUHlPdnUxMlZ6bDdTcDZj?=
 =?utf-8?Q?w54CV5VevVo0Dqt3kOKtJ3wrDvaR150Pxt+MM=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(35042699013)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 08:58:54.9244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39114c9-dd45-4bf1-f394-08dc70064171
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5917

SGkgTWljaGFsLA0KDQo+PiANCj4+PiArICAgICAgICBpZiAoIHNobV9pZF9tYXRjaCApDQo+Pj4g
ICAgICAgIHsNCj4+PiAtICAgICAgICAgICAgaWYgKCBzdHJuY21wKHNobV9pZCwgc2htZW1fZXh0
cmFbaV0uc2htX2lkLA0KPj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgTUFYX1NITV9JRF9M
RU5HVEgpID09IDAgICkNCj4+PiArICAgICAgICAgICAgLyoNCj4+PiArICAgICAgICAgICAgICog
UmVnaW9ucyBoYXZlIHNhbWUgc2htX2lkIChjYXNlcyk6DQo+Pj4gKyAgICAgICAgICAgICAqIDEp
IHBoeXNpY2FsIGhvc3QgYWRkcmVzcyBpcyBzdXBwbGllZDoNCj4+PiArICAgICAgICAgICAgICog
ICAgLSBPSzogICBwYWRkciBpcyBlcXVhbCBhbmQgc2l6ZSBpcyBlcXVhbCAoc2FtZSByZWdpb24p
DQo+Pj4gKyAgICAgICAgICAgICAqICAgIC0gRmFpbDogcGFkZHIgZG9lc24ndCBtYXRjaCBvciBz
aXplIGRvZXNuJ3QgbWF0Y2ggKHRoZXJlDQo+Pj4gKyAgICAgICAgICAgICAqICAgICAgICAgICAg
Y2Fubm90IGV4aXN0cyB0d28gc2htZW0gcmVnaW9ucyB3aXRoIHNhbWUgc2htX2lkKQ0KPj4+ICsg
ICAgICAgICAgICAgKiAyKSBwaHlzaWNhbCBob3N0IGFkZHJlc3MgaXMgTk9UIHN1cHBsaWVkOg0K
Pj4+ICsgICAgICAgICAgICAgKiAgICAtIE9LOiAgIHNpemUgaXMgZXF1YWwgKHNhbWUgcmVnaW9u
KQ0KPj4+ICsgICAgICAgICAgICAgKiAgICAtIEZhaWw6IHNpemUgaXMgbm90IGVxdWFsIChzYW1l
IHNobV9pZCBtdXN0IGlkZW50aWZ5IG9ubHkgb25lDQo+Pj4gKyAgICAgICAgICAgICAqICAgICAg
ICAgICAgcmVnaW9uLCB0aGVyZSBjYW4ndCBiZSB0d28gZGlmZmVyZW50IHJlZ2lvbnMgd2l0aCBz
YW1lDQo+Pj4gKyAgICAgICAgICAgICAqICAgICAgICAgICAgc2htX2lkKQ0KPj4+ICsgICAgICAg
ICAgICAgKi8NCj4+PiArICAgICAgICAgICAgYm9vbCBzdGFydF9tYXRjaCA9IHBhZGRyX2Fzc2ln
bmVkID8gKHBhZGRyID09IG1lbS0+YmFua1tpXS5zdGFydCkgOg0KPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlOw0KPj4+ICsNCj4+PiArICAg
ICAgICAgICAgaWYgKCBzdGFydF9tYXRjaCAmJiBzaXplID09IG1lbS0+YmFua1tpXS5zaXplICkN
Cj4+PiAgICAgICAgICAgICAgICBicmVhazsNCj4+PiAgICAgICAgICAgIGVsc2UNCj4+PiAgICAg
ICAgICAgIHsNCj4+PiAtICAgICAgICAgICAgICAgIHByaW50aygiZmR0OiB4ZW4sc2htLWlkICVz
IGRvZXMgbm90IG1hdGNoIGZvciBhbGwgdGhlIG5vZGVzIHVzaW5nIHRoZSBzYW1lIHJlZ2lvbi5c
biIsDQo+Pj4gKyAgICAgICAgICAgICAgICBwcmludGsoImZkdDogZGlmZmVyZW50IHNoYXJlZCBt
ZW1vcnkgcmVnaW9uIGNvdWxkIG5vdCBzaGFyZSB0aGUgc2FtZSBzaG0gSUQgJXNcbiIsDQo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgIHNobV9pZCk7DQo+Pj4gICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+Pj4gICAgICAgICAgICB9DQo+Pj4gICAgICAgIH0NCj4+PiAtICAgICAgICBl
bHNlIGlmICggc3RybmNtcChzaG1faWQsIHNobWVtX2V4dHJhW2ldLnNobV9pZCwNCj4+PiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICBNQVhfU0hNX0lEX0xFTkdUSCkgIT0gMCApDQo+Pj4gLSAg
ICAgICAgICAgIGNvbnRpbnVlOw0KPj4+ICAgICAgICBlbHNlDQo+Pj4gICAgICAgIHsNCj4+IFRo
ZXJlIGlzIG5vIG5lZWQgZm9yIHRoaXMgZWxzZSBhbmQgZW50aXJlIGJsb2NrIGdpdmVuIHRoYXQg
dGhlIGJsb2NrIHdpdGhpbiBpZiBlaXRoZXIgY2FsbHMgYnJlYWsgb3IgcmV0dXJuDQo+IA0KPiBU
aGVyZSB3YXMgYSBNSVNSQSBkaXNjdXNzaW9uIGFib3V0IGVsc2UgYXQgdGhlIGVuZCBvZiBpZiAu
Li4gZWxzZSBpZiAuLi4gKFIxNS43KSBhbmQgSSBkb27igJl0IHJlbWVtYmVyDQo+IHRoZSBvdXRj
b21lDQoNClNvcnJ5IEkgd2FzIG1pc3JlYWRpbmcgdGhlIGNvZGUgaGVyZSwgc3VyZSBJ4oCZbGwg
cmVtb3ZlIHRoZSBlbHNlLg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

