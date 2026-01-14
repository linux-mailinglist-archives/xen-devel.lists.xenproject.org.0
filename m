Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7FD1E517
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 12:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202903.1518302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfyk5-0003SX-Gu; Wed, 14 Jan 2026 11:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202903.1518302; Wed, 14 Jan 2026 11:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfyk5-0003QG-Da; Wed, 14 Jan 2026 11:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1202903;
 Wed, 14 Jan 2026 11:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K09h=7T=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vfyk3-0003OU-8q
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 11:08:47 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62535220-f139-11f0-9ccf-f158ae23cfc8;
 Wed, 14 Jan 2026 12:08:41 +0100 (CET)
Received: from DUZPR01CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::12) by PA6PR08MB10739.eurprd08.prod.outlook.com
 (2603:10a6:102:3d8::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 11:08:37 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::bf) by DUZPR01CA0058.outlook.office365.com
 (2603:10a6:10:469::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 11:08:53 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Wed, 14 Jan 2026 11:08:36 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DB9PR08MB6731.eurprd08.prod.outlook.com (2603:10a6:10:2a4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 11:07:31 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 11:07:31 +0000
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
X-Inumbo-ID: 62535220-f139-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w0lBKP1oH7ijk0CZl0g7AwLMAcuzlWUDwDCPJeniFJUD1LDsV0PjtMnJUWMGXlw2pdPr3BaaZZ06lfIdUrfGVtLjGwQgVd49X8ZCrZxBogxiVtKkkvIlt8lb+qJQA0EC7mlXSDocMXJZUY5Hn5cYxXyWO06ove/bEzgtsTiN7k4KBSkyN1kkj6Iw8LyZcJLyhdvYdbLiuOjli8Nsm9hoZpDlGhXBuSkffRKHY9h0qV4XKW6pWVhn3c5Enmqa3jt1UdsuDDJPaiEKmMK8BvWvl6/7gOP3UeBo+wpl/NnQqDG9hmjzRvbjjXLb8WlC/i/Ivw5Q0+Y6ffciYVwtjF8LkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaSyDhtGvTHeVrT4IN3p8vE5r39tyrkkpkQ7ahmkb8k=;
 b=WP/NL+7G/NnSAWXZe/nlcuum2m/no1PwGGLA3BkdtPhJtl9BlvBXR0+OLI0SmO424i//T0Gz1mKZvLMr56b+b09W3jn4eO8LXPuq5dQPD6M4otlr9aQe4KD/XlC9B1HoOraA5Ya6WgKarvrcWmSGFqVywMWxlu+FWUK65cbivV62OXsgQtnsRZpmfG/hqoBs0PucgZwHFvBRohgnBoxRVJ95PGSR+VWb2gN0PlkdIIKCkBLDO6kL3oZA/uyzJoqb/HI6nXCmCyYbccQc4/vqGtrcdgx6crK38XGykAXu8SWFd7yuEHA+BiUqW8J4lPeQ4FBSBFG9AsgMOU7A4Z88bQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaSyDhtGvTHeVrT4IN3p8vE5r39tyrkkpkQ7ahmkb8k=;
 b=GCqzWLN23Ss+PwKAhGG/m546C1Px3VtQHuF6JfDmwPkWtvQ1PskAIWTODyohASEbZP0aYglmdr+lVITknEPHGWPFj6hGD66HsMKzVtcUByE31ykVPX+M+W7QD/V7IUvV8dE4plPBWckxhiJq0IrGbcMzPYxn4ljmqWZ0XK0wp1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vA2qBdJYENzP9GXQoF02GNcm1HzGp7ADlOcKLQn8UymPshoZVv+wRqZw8qERoNYzLUB4pG/r3445CTUwy/T8kibUwkd3l0X2RVnXed8+zXcndTkelvQNy04OsZN6C8OLU38jjyPp7fOjXSSHsP0Pu7ooaXV+gFmvft4f62TS7dPeId9bYlKTKkczMv4K0FaLPwhjcg5kh62zgoa08at7Jah7ASHOyNhBShEn/ZmeA2SPPP2c/2iROhxN3yal3MhVV+1ykWHfQTJAIc6ocJju20XwDQEIqtCLFnXWNXPi9yKrdRqKfi4TobdifC5iPHZImZYLK5OkKAWSgEv+YFEy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaSyDhtGvTHeVrT4IN3p8vE5r39tyrkkpkQ7ahmkb8k=;
 b=UnftzqI9MjGmILGEu1BW2otC1l8e3uWSRTBYtDLRXwxwGQ1gyivS3Z1BmnoJdxE848XTljmWBUc8/0zGbRmoALwx2vBv/VAujAT19xhRKJDvcJWiMFQghTkWheJJP0ijIALv3GPBoxcmUFJMZFQL5zG8EDsP6f8/E1fBNxiaELhlLOtNclM24c3R8ygD+eQbP9yZem5eL3wfQq48U4xxosENSMxd7jM2DT00BOHc49Lg/0PcXhtnDRLzYX71QYFxZFQt5GU17NGiVN4aJTO2JJlFtSN0Us3Uv/9B/83TxplsUe36amcW9lunO3drftl1bUFP6m9ySCfvI79ReahN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaSyDhtGvTHeVrT4IN3p8vE5r39tyrkkpkQ7ahmkb8k=;
 b=GCqzWLN23Ss+PwKAhGG/m546C1Px3VtQHuF6JfDmwPkWtvQ1PskAIWTODyohASEbZP0aYglmdr+lVITknEPHGWPFj6hGD66HsMKzVtcUByE31ykVPX+M+W7QD/V7IUvV8dE4plPBWckxhiJq0IrGbcMzPYxn4ljmqWZ0XK0wp1M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 2/6] arm/mpu: Implement vmap functions for MPU
Thread-Topic: [PATCH v3 2/6] arm/mpu: Implement vmap functions for MPU
Thread-Index: AQHchThCncyVuPEinUCTQtinTDX+lLVRgV4A
Date: Wed, 14 Jan 2026 11:07:31 +0000
Message-ID: <E5F825CB-0EBB-4AFD-959D-AF5B7D0D2CAC@arm.com>
References: <20260113162309.6766-1-harry.ramsey@arm.com>
 <20260113162309.6766-3-harry.ramsey@arm.com>
 <1cb6fc36-fd16-499b-a616-4d321ae83572@amd.com>
In-Reply-To: <1cb6fc36-fd16-499b-a616-4d321ae83572@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DB9PR08MB6731:EE_|DB5PEPF00014B9B:EE_|PA6PR08MB10739:EE_
X-MS-Office365-Filtering-Correlation-Id: 3878e3a5-7c2d-411b-c264-08de535d43b6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WERmRjhVRXhOL3dYV0JESlozaVRsT0Y2dXM0MG5sdHpxdVZOOFpzWFRVdTRV?=
 =?utf-8?B?SEpiMjZhSVhHcHhsVlhUckwvZkZ4T2RneXhoajBqQVM3QkFYaEZraVgxT2h3?=
 =?utf-8?B?cUpKN0hqZXhFUUdHOUJZVFF4ZGQ5U1N5aWFoU05XTjJGR1pqaUtrSlU3YXRM?=
 =?utf-8?B?dXg1ZGNRRG1TZE5wczVmdWF5VU4veXB5NjdjOFpXUG50NTBCOU9Xazh2emRB?=
 =?utf-8?B?RElCWTc1cklzMDNvVHdoQ1llREI1NHFLWUpqb25KYjNGM1UyLzArbnlSZFR6?=
 =?utf-8?B?U3ZldzRiQlZtYXhvd0RDS2dvVnc0Q1BnNmlUWU1oYjNrZ2VUcTVGYm50Rnpz?=
 =?utf-8?B?T1BPbElUM05yQXAxcmp2bHF4R0NSMWxIb1pFVEk1Y3d6NGpmNFFIcWx0bTVR?=
 =?utf-8?B?bTRVU3pieWpuQ1VyMDQ2VGZzRnA5VGdrSTMzMldORURsWW54eStFZmFlRW9G?=
 =?utf-8?B?Z2ZPTDJJLytHemoyUkxoeFBBbnQ3Njlqc1V2cHh5YXBLNkRZNnlTUG56WDlH?=
 =?utf-8?B?cDFpZmRlOFhBVjlWMkVZRHNrM1pXSEw0TXM5VmtBSkIwU3hoaEdtUTVYdW9s?=
 =?utf-8?B?b1U1cGhuWlg4ZTgvTmlhdHVXRHZwODlMZGhWRnVlMGxoL2djMThnNG95M1BX?=
 =?utf-8?B?SER1S2tlbVlmSFhGbU85TmNpQUt0Qi9MMXRYTjZRc01vU3k1SFI4aEtoYll3?=
 =?utf-8?B?T3lkN3FXUS9CUi9jTnl4TEw1Y2toQS8xZUYzYkI1ZzF1a3dBV1dNSWJYUjNr?=
 =?utf-8?B?MVlCcE9CYjA1TnRjM0xkQkhBb29UVm43ZHBwZmxPbzRIQk5GNnR5dVp5R0ZU?=
 =?utf-8?B?bDdmQjBtaFZDNjB4b0d2RjFFd052S2FwRDlzem9Jd0h3RGRSMDRNWnpjZk5Y?=
 =?utf-8?B?NCtzam5xNEF0N2NMcVJKSHM4cEwyNmFNZE1kSzVrTFVNTzVFSGc5bnZmZDF2?=
 =?utf-8?B?dUhxc0JYNnRQUDY1K25ZeWpSOHJ2aXMrZ1FnekxsZkxFWSswSVFyOHUwUEor?=
 =?utf-8?B?ekhoWXNLaXNHbSthK003cmJPcVo1QW9yOXRSSGFKQ3NpUnhnRmQ0MGFTQUty?=
 =?utf-8?B?bzQvV003aWFLdFNWMVVVV3huOEIvL1FJQWNqQUxpazFxQzJlWjF1MmFSbTBI?=
 =?utf-8?B?K25xb24zd1lYZlhDZk5zbFF6T2pwU2RZVzZUUlJyd2hlUUZrRTI3YVVVZmwx?=
 =?utf-8?B?OVE0UlI0eCtXYTZVWDF4TlNWTWJURWFuRVZ6b01SV3VHb3lJWWM5RGpuSUg4?=
 =?utf-8?B?eGdQSFBsWFU3UFVYcUlzNXdxY3ZvTVNRNW9FMGdlQ2JBVzhOYlN0Y3lxMXJM?=
 =?utf-8?B?RHRyMGxZdjJpaDdvczkzY0RZV29IbHBhSlVsdTBtVkN5ZjlzRitxblZIWUdp?=
 =?utf-8?B?eWU4aE8vSVNKbDFIb2xnWGwreWhwQXdKclFVbFNHSnV6dEJxTkkvZzVmSDVO?=
 =?utf-8?B?VkNhckgxcWNsbXJNTTk1UmNCUWs1eFcxZStXS3hJOHlKbWVJTGF0SENtYVd2?=
 =?utf-8?B?Z2kyQWNPL2pBVjI5QXZkWkFHWXgxdi9FTVBSdjFmRFFFdDBMVy9aYXJ4K2xt?=
 =?utf-8?B?YW1QZ015c0FpbFFidTY4SlQxRXhibGpJTzVqeDBQbk50ZzNxRW0wM3dzeDdY?=
 =?utf-8?B?MDZOOUhXdHZJMmZvdnVYWHg5ZW5raURkdlkzMzBIQzZGU0U0eGQvYkk0citK?=
 =?utf-8?B?cERUVDdmSFFxQ0NuQnYxZmo0Y3Q1eTl1eU9wWjVKQjVYTEtJY3JZWjVHZW9W?=
 =?utf-8?B?RVg4OUZqZ1kvTkhYTVNPN2pXckg3ZzNNVnNmWHFOS21BaDhvRFdrTzNnSG1V?=
 =?utf-8?B?R1dHN3F4b0t6KzcweVM0ajd4WDFlTjZBSUYyZ1F4KzMxbjNERWR6cXNxR2Rl?=
 =?utf-8?B?M2Q5M0swV2I4MENLc1c0U0EydTE3elR4S3FtOUFLblQyTmJ4SUtQQWpUeVcx?=
 =?utf-8?B?YUEzT3d0OEc2YThCWWpnZnQwNE5wK1VqaXFNOUU0Wm83U0hINGdKK1R0amlX?=
 =?utf-8?B?SjQwT3B2Rzg2ZDIxRk9hZXhWd0tRZW9aSmFTVnZFcjB5TjRESGxTQTRzNGMz?=
 =?utf-8?B?K1NKNHI2eEtLQlgxL25EejhNQm44Z3JwdHVMWmZOUHYvMzYvNlVBellPbzhX?=
 =?utf-8?B?YU9GVVlUTnA0WVpOMytEbGUzSlBueDgrcEN1ZHhPRE5TNm9sL2pla1VxcWU1?=
 =?utf-8?Q?EHaRsovSdVGzMTRw8A3Ui2U=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <197A0A4407FA344281EDDA37E96D53B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6731
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	96488539-c4f9-4f50-e731-08de535d1caf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGhYUE9ucE1qck51MVZlT1N5Rk9udmZ0Zi9ta2dpRHFRaUJlSldIdVhxalZa?=
 =?utf-8?B?VzJRczRsRlBFUFRGdmNsZHlMVzVOaG80L0RZR3ljR0NnaDZBdE84MVlJenl4?=
 =?utf-8?B?UXREbVViOERVbG9JQklYTkRHbHZRVm1kVmlzU1NDQ0VkL3FBY2laR2t5dUZu?=
 =?utf-8?B?NmJXUVZodXJFNldjelRCbWNqU1VpdVhOdEgxV0lXcjVoZ0RYbVRrOGw0Wlhh?=
 =?utf-8?B?WnJzc2VWbEVueFgyY3hGMmNGa0pncXhYMW9kRml4bjFidzVzWms3Qm45QVR0?=
 =?utf-8?B?SUI1WFVjaDFDRitlV2lYc3BSbFhvSHFramVjMHhWQTdLd3o0bzFONzhNSjc0?=
 =?utf-8?B?WHo0MnBxbnp3UkpVeDMyQm42TUdXa21FanllOUIyR0dnRm1DVGxlU3VRUjlr?=
 =?utf-8?B?S241L1dZaFBkaFJZei9TejdXVEdSNDc0ZUY5bUpGVytDak5nb2RvdnprYUVp?=
 =?utf-8?B?VXgzb3JDRml1cXl2Uy9Uc1gvR0I4cnNhQzJTVVRIeTJvNW9Kd0ZaV2Njdkdm?=
 =?utf-8?B?dm44N2JiQ2hEbmovYWZ3dmFiV3lVY2t6ekN0K3cybVVwZTJGVGllbVlXQWpn?=
 =?utf-8?B?NThKbUFrUEp5ZWkxRkxYb1J3OG9QWjgrMDJvWlcxTHVIU3oybTkrRmcxWGNB?=
 =?utf-8?B?WGw0dVY4MWtyV01TQTQ4Y0JjcVRDSmo0Z29DdGFBWUJkMzdWUklwMVY2cEZP?=
 =?utf-8?B?K2orS25JKytaNEp2UWlnMUYrYm42RCtTTXBFbWpGdG1aenlCeWFuQ3hPaG1z?=
 =?utf-8?B?bzZwVmFjaU1mRjBqdlFKUnhuKzhFYUsyVm5ZL3dON21UUkU3eVlaWXBabG9C?=
 =?utf-8?B?N1dheGZHcndHOFc2TTIrRkpwdWhqUVVZSzhpdmJmeFVYUVVQd1NNVTlJVDBP?=
 =?utf-8?B?bzM2VUMxU2ptWnV5bTUwcVdCV1lnRjBGRzFNQ2N1cFhzV2pTSmI5ZUtFcjdp?=
 =?utf-8?B?VHNlTnVLMUhWc1Z3dFlhTGcwU0JucjZjNWNVbHJ5WXhPekk5azc3OGtwRE03?=
 =?utf-8?B?OVFkdDRZWnRJWEJ4ODdBdmpPd2ZRZjcxd29rVC9SQmY5cDVzbFpOYmFCSlJU?=
 =?utf-8?B?emNTSDJXU1hmaFduUWIvQTFRQit1VVU1RWRFVFB4MW1ML3VTbk1JSHV6c01W?=
 =?utf-8?B?eUU0OE5HL2oweFNpeHNneVF6b2F2N0hrTU5IZ0NBaEFTU2VFM2s5dkxmcG1S?=
 =?utf-8?B?dmtZZG9jTWtBUXhmVkpGSmREMEZEOHZjQi9MdFhkS1Q4UExyb3J2KzJTSTIv?=
 =?utf-8?B?WEorWUdpQ3M3Q2JzR2NkRzM5aVdnbmx2am5nUUNLNGNmdE1EZTFmbmVMYXc2?=
 =?utf-8?B?RFFmbkhBZUdnMTV5Z2NiRmVpMExSNmE4bjh4UnBzaUtjSURlclMvZXRKWUF5?=
 =?utf-8?B?VEo4cndPZ2dndTVtN0hYdWQwN0NNTUpkUmkxRnAxdkMwY1lLdS9YQm85eVVI?=
 =?utf-8?B?Y3IrREw4dVRadVV3U1RzVytuR0dkZVpXdGxGTEc1aEtqRWhFWUV3eVB0b08z?=
 =?utf-8?B?VVdlVTluT085YVB0cS9KNXdwSGEwRml1ZzAwZ0UyN3pBZVJSU21LUk5mSXUz?=
 =?utf-8?B?L3NUN0ovNWtteHlnd1p6OGpXZjBKN0NXbXZrTmpjQlZML25seitpTE9zNUo0?=
 =?utf-8?B?SE1jZ1U4YXhaMDM2THR0YXZwYlYrbmwvMEd5N2lid2NiVTJLOE5uU0dVUlcz?=
 =?utf-8?B?V2hCR091V2tJNTcyUU5GREkvSkxYN29ZUnZDekpSeUYzdVVxSEdjTHdJQ2tw?=
 =?utf-8?B?RHJXd0lLTVdRSVpyazVmdEEyblZaY1ZiTytFMmxPN0d4L2tZZ2tITE82SDVz?=
 =?utf-8?B?K2JYMlJScnBUYWE1Y3YyVFFTSFB0WjVRbTNPWXBVc0tTa3VaNzRpbXJsbXRa?=
 =?utf-8?B?NDdJN1hUc213Ri9qYjlUWmlFTmZENXdkVlFORWJsS1BMbEJQaTdhejFCYkth?=
 =?utf-8?B?ZUJIL05ldUdPZnJxSzN2MVp1Zm5KT1RVUGE2ejFoQllkWVYwZ2RQU0dER1No?=
 =?utf-8?B?b3JmTlVTd3NOT3VmVG1CbWZMNmlNby8wSytQeUxIQzJOR0ZTRTNXbVpLOFR2?=
 =?utf-8?B?TW04Q3BERkNGUEF2TTVoak9uVldlNG8xVnZiWDlwOTROT2YybTl6UVovZU9B?=
 =?utf-8?B?NGs3UmsvVG4wSEkrUGo1Tm5zL05jQ1BmMnc4NXlmbVFmN2xmRDRVOTlHY29q?=
 =?utf-8?B?dDJDL0dqREd2aC93dmlWc1JwVHVzU2oydTFXY2lrUmxXWUZFUmRFLzJGSW9T?=
 =?utf-8?B?R3I4ZGRUcVZLNWVFVUZZdUlmNmp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 11:08:36.4799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3878e3a5-7c2d-411b-c264-08de535d43b6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10739

SGkgTWljaGFsLA0KDQo+PiANCj4+ICsvKg0KPj4gKyAqIEZyZWUgYSB4ZW5fbXB1bWFwIGVudHJ5
IGdpdmVuIHRoZSBpbmRleC4gQSBtcHUgcmVnaW9uIGlzIGFjdHVhbGx5IGRpc2FibGVkDQo+PiAr
ICogd2hlbiB0aGUgcmVmY291bnQgaXMgMCBhbmQgdGhlIHJlZ2lvbiB0eXBlIGlzIE1QVU1BUF9S
RUdJT05fRk9VTkQuDQo+PiArICoNCj4+ICsgKiBAcGFyYW0gaWR4ICAgICAgICAgICAgICAgICAg
IEluZGV4IG9mIHRoZSBtcHVtYXAgZW50cnkuDQo+PiArICogQHBhcmFtIHJlZ2lvbl9mb3VuZF90
eXBlICAgICBNUFVNQVBfUkVHSU9OXyogdmFsdWUuDQo+PiArICogQHJldHVybiAgICAgICAgICAg
ICAgICAgICAgICAwIG9uIHN1Y2Nlc3MsIG90aGVyd2lzZSBuZWdhdGl2ZSBvbiBlcnJvci4NCj4+
ICsgKi8NCj4+ICtzdGF0aWMgaW50IHhlbl9tcHVtYXBfZnJlZV9lbnRyeSh1aW50OF90IGlkeCwg
aW50IHJlZ2lvbl9mb3VuZF90eXBlKQ0KPj4gK3sNCj4+ICsgICAgQVNTRVJUKHNwaW5faXNfbG9j
a2VkKCZ4ZW5fbXB1bWFwX2xvY2spKTsNCj4+ICsgICAgQVNTRVJUKGlkeCAhPSBJTlZBTElEX1JF
R0lPTl9JRFgpOw0KPj4gKyAgICBBU1NFUlQoTVBVTUFQX1JFR0lPTl9PVkVSTEFQICE9IHJlZ2lv
bl9mb3VuZF90eXBlKTsNCj4+ICsNCj4+ICsgICAgaWYgKCBNUFVNQVBfUkVHSU9OX05PVEZPVU5E
ID09IHJlZ2lvbl9mb3VuZF90eXBlICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcHJpbnRrKFhF
TkxPR19FUlIgIkNhbm5vdCByZW1vdmUgZW50cnkgdGhhdCBkb2VzIG5vdCBleGlzdFxuIik7DQo+
PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAo
IHhlbl9tcHVtYXBbaWR4XS5yZWZjb3VudCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHhlbl9t
cHVtYXBbaWR4XS5yZWZjb3VudCAtPSAxOw0KPj4gKyAgICAgICAgcmV0dXJuIDA7DQo+PiArICAg
IH0NCj4+ICsNCj4+ICsgICAgaWYgKCBNUFVNQVBfUkVHSU9OX0ZPVU5EID09IHJlZ2lvbl9mb3Vu
ZF90eXBlICkNCj4+ICsgICAgICAgIGRpc2FibGVfbXB1X3JlZ2lvbl9mcm9tX2luZGV4KGlkeCk7
DQo+PiArICAgIGVsc2UNCj4+ICsgICAgew0KPj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIg
IkNhbm5vdCByZW1vdmUgYSBwYXJ0aWFsIHJlZ2lvblxuIik7DQo+PiArICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4+ICsgICAgfQ0KPiBOSVQ6IFRyeSB0byBsaW1pdCB0aGUgbnVtYmVyIG9mIGlm
L2Vsc2UgYmxvY2tzIHRvIG1ha2UgdGhlIGNvZGUgcmVhZCBiZXR0ZXIuDQo+IEhlcmUgeW91IGNv
dWxkIGRvIHRoZSBmb2xsb3dpbmcgdG8gcmVtb3ZlIG9uZSBlbHNlOg0KPiAgICBpZiAoIE1QVU1B
UF9SRUdJT05fRk9VTkQgIT0gcmVnaW9uX2ZvdW5kX3R5cGUgKQ0KPiAgICB7DQo+ICAgICAgICBw
cmludGsoWEVOTE9HX0VSUiAiQ2Fubm90IHJlbW92ZSBhIHBhcnRpYWwgcmVnaW9uXG4iKTsNCj4g
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAgICB9DQo+IA0KPiAgICBkaXNhYmxlX21wdV9yZWdp
b25fZnJvbV9pbmRleChpZHgpOw0KPiANCj4gICAgcmV0dXJuIDA7DQoNCk1ha2VzIHNlbnNlLCB3
aGlsZSB3ZSBhcmUgdGhlcmUsIHNoYWxsIHdlIGhhdmUgYWxzbyBhIGNvbW1lbnQgYWJvdmUgdGhh
dCBjaGVjaywgc29tZXRoaW5nIGxpa2UgdGhpczoNCg0KLyoNCiAqIElmIHdlIHJlYWNoZWQgdGhp
cyBwb2ludCwgdGhlIHJlZ2lvbiBpcyBkdWUgdG8gYmUgZGVzdHJveWVkLCBhcyBhIHNhZmV0eQ0K
ICogY2hlY2sgd2UgbmVlZCB0byBlbnN1cmUgdGhlIEFQSSBpcyBjYWxsZWQgd2l0aCB0aGUgZXhh
Y3QgcmVnaW9uLCB0byBwcmV2ZW50DQogKiBkZXN0cm95aW5nIGEgcmVnaW9uIHVzaW5nIGEgcGFy
dGlhbCBtZW1vcnkgcmFuZ2UuDQogKi8NCg0KV2hhdCBkbyB5b3UgdGhpbms/IE90aGVyd2lzZSBz
b21lb25lIGluIHRoZSBmdXR1cmUgbWlnaHQgdGhpbmsgaXTigJlzIG9rIHRvIG1vdmUgdGhpcyBj
aGVjaw0KdG9nZXRoZXIgd2l0aCB0aGUgb3RoZXIgb24gdG9wLg0KDQo+PiANCj4+IA0KPj4gdm9p
ZCB2dW5tYXAoY29uc3Qgdm9pZCAqdmEpDQo+PiB7DQo+PiAtICAgIEJVR19PTigidW5pbXBsZW1l
bnRlZCIpOw0KPj4gKyAgICBwYWRkcl90IGJhc2UgPSB2aXJ0X3RvX21hZGRyKHZhKTsNCj4+ICsN
Cj4+ICsgICAgaWYgKCBkZXN0cm95X3hlbl9tYXBwaW5nX2NvbnRhaW5pbmcoYmFzZSkgKQ0KPj4g
KyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byB2dW5tYXAgcmVnaW9uXG4iKTsNCj4+IH0NCj4gTG9v
a2luZyBhdCB0aGlzIHNlcmllcyBhcyBhIHdob2xlLCBhdCB0aGUgZW5kIHdlIHdpbGwgZW5kIHVw
IHdpdGgNCj4gdm1hcF9jb250aWcvdnVubWFwIHRvIGNvbnRhaW4gdGhlIHNhbWUgaW1wbGVtZW50
YXRpb24gYXMgbWFwX2RvbWFpbl9wYWdlIGFuZA0KPiBhbGlrZSBmcm9tIHRoZSBsYXN0IHBhdGNo
LiBTaG91bGRuJ3Qgd2UgZGVmaW5lIG9uZXMgdXNpbmcgdGhlIG90aGVycz8NCg0KV2UgY2FuIGRv
IGl0LCB0aGUgb25seSB0aGluZyBpcyB0aGF0IGlmIHZ1bm1hcCBmYWlscywgd2Ugd2lsbCBnZXQg
YSBsZXNzIHNwZWNpZmljIGVycm9yIG1lc3NhZ2UsDQppZiB5b3UgYXJlIG9rIHdpdGggdGhhdCB3
ZSB3aWxsIGRvIHRoZSBjaGFuZ2UuDQoNCkNoZWVycywNCkx1Y2ENCg0K

