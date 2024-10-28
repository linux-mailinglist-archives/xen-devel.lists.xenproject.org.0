Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4AD9B3489
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826656.1240992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RSV-0000xt-1q; Mon, 28 Oct 2024 15:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826656.1240992; Mon, 28 Oct 2024 15:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5RSU-0000v5-V7; Mon, 28 Oct 2024 15:15:06 +0000
Received: by outflank-mailman (input) for mailman id 826656;
 Mon, 28 Oct 2024 15:15:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MlZD=RY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t5RST-0000uz-Ae
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:15:05 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2060b.outbound.protection.outlook.com
 [2a01:111:f403:2607::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68051bb4-953f-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:15:03 +0100 (CET)
Received: from DU7P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::8) by
 AS8PR08MB9044.eurprd08.prod.outlook.com (2603:10a6:20b:5c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 15:14:57 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::43) by DU7P251CA0017.outlook.office365.com
 (2603:10a6:10:551::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23 via Frontend
 Transport; Mon, 28 Oct 2024 15:14:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Mon, 28 Oct 2024 15:14:55 +0000
Received: ("Tessian outbound 8223600b7a9c:v490");
 Mon, 28 Oct 2024 15:14:54 +0000
Received: from Lc07ac40fcf80.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB13192F-7D6C-44C9-944E-8DA5AAE5BAEC.1; 
 Mon, 28 Oct 2024 15:14:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc07ac40fcf80.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Oct 2024 15:14:42 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Mon, 28 Oct
 2024 15:14:39 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8093.023; Mon, 28 Oct 2024
 15:14:39 +0000
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
X-Inumbo-ID: 68051bb4-953f-11ef-a0c2-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KmCw37ajOEFKPT+rwcuIbCYcu0Xbq3wzPWmBTkmHLumHr5YXfXFAGIlQ7TfxSguffJ8Yu537lY6V19ZKn5b7Z+g25Jh7w0f15SFmQKodjAUENu9sLKzjynIuGTtRkcD4YuYv8IVOJqdK/L83uEGaaVF8gSnIwZ7yk0omWjRaRQwbtJAdwcPTmoxtqDkrMbmo9aH+Y4gemaflynyCZJvr4BV2tMUrgjnyXJFJXxVDmYrWlLniLMn5c+gNE8gsRxJ6UkklPMhNIJbXiB6OjwPdyf7g/CrPODqp5YzpdnwyLG2ZFe1VehI8AxQ8IbwGXrSDhacnQbbennax9OC4Zv/a1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t47u8dPzArt7iHDqPqIsBJupOS8h6fCg5yUUihDNO+A=;
 b=kAWpWfr9uk+F+fySl7D5HmRqtSnLWnJdbXt2VyYU5ay/UscHS2eVLTCxiF8E4bNC9aS1tog+bCBcPGRMrOZXFUFjQV3+baaZmSsNlcSJgl502ERJPyjD/PcwMex8YXpfRdxig5fDUSOq2AZoRzSy1i/kUfBbR40O4kJcnfNlKgTWu4cbVcyr71je3tSbIx0HVZwVD54SAmwJQa98AbctgBWRtOzdwVAStbO8K8dDur6q8Q3Qfv1CvOSzpJeDUrm2QerzOKWvntPmzblhGO4UxMo0Th8ZzaOA8rxq3phXtS0fbArCj97OUCT/HqKlOjXHu6SxUWfv61XODHDrIrVSjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t47u8dPzArt7iHDqPqIsBJupOS8h6fCg5yUUihDNO+A=;
 b=o1pJsEJ6hvYaI4M0BSp5jEU7lKiKraiC/wyxT9KI4D5bPyQzP+kM8q8BndweKxYtVG/OPiZ/kDPjavr0YougND9cbpBfxRP4/PaSXhV89PUPrfMbTe5SeQraNobIl1DRW9E32E3HGrYIDFhqRTQNlEPhJlPciUpbLDHuFICZxoA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 973bd89aaac9affa
X-TessianGatewayMetadata: bialLZx8+w6GrDL2/oBzkgbTIEPYPaNk9NlwCqAMUthvTlp4ZEZa8JSF5ieAo0XOCs1dPA4bzfYLdEUcxfqreZrfC38RgIGrGlcaTOGOtB4/uYD515qjbkSX4OGk/SfWO1xk8A0LBQeRrjG1SM2ydEf4/LcWZyo69SEe0MhgZr0=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d64zBAlM/8auKoVoYyaB5AF6E3sR6suXMrbZB4VpJQyPFU30bnhIe5bh1CfmxUID86uaq9tpTbt83fgBAiz3k9294IcCc0Zu2Q0FVdmQv3e4gzbzqSw9DaJSSN2QXSM81+O+Ue0ZnK1NlkcxA1nnXondqwp+f7R0h+1tYf5MPlGi16dGR7DAf2V4ToFEz7gDRh8cRpje6RrofqnMnCEujLS3ObeN/6GgXeTMPg9wztB3NkjhhQCmd5BVGFOyROTA7DwVelh8rrVr9m8yNAgsH446FVblFx3fYCyfLFi29T020VAO7cAwgFsZpm0SeNrY69r1d5wHHA2HPpOqWQR1+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t47u8dPzArt7iHDqPqIsBJupOS8h6fCg5yUUihDNO+A=;
 b=CJg0mhZf4Lsq+oarb/GPvrxgXh7LKftqPdK84DRuJ/K76My1PQXuDXfb4/ZI3ecggqpMYBnHTuEVDkDRYfPisJTA6qV3ESuFYo5pN2wGVZ3vchkMBiWgH1N/J6pmwyMMpoXZy9xR4WoC08uvQivF7weOeHXZRw8Vk0TRUDKfWzwPgq91ktaNtOifJWw/xTvsGsehg4x/7R4fEFR2l1tUwt94zwPVxaIC9658eo5AS5l2ABeb3l/+380btXZWYQpWUs3x7cP89Ah0IfFpkf7bQC2Lf2Vc535x1dPg6PZraRvuUw6WvX50qp8QzGBtOuNiumm6vijVXFLIuEIqwm+u8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t47u8dPzArt7iHDqPqIsBJupOS8h6fCg5yUUihDNO+A=;
 b=o1pJsEJ6hvYaI4M0BSp5jEU7lKiKraiC/wyxT9KI4D5bPyQzP+kM8q8BndweKxYtVG/OPiZ/kDPjavr0YougND9cbpBfxRP4/PaSXhV89PUPrfMbTe5SeQraNobIl1DRW9E32E3HGrYIDFhqRTQNlEPhJlPciUpbLDHuFICZxoA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Topic: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
Thread-Index: AQHbKTd3r9ds8GMpC0a1KoGz65CsELKcRboA
Date: Mon, 28 Oct 2024 15:14:39 +0000
Message-ID: <DE7DF8D0-2843-4572-A53E-E65D8CB8358B@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
In-Reply-To: <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB6568:EE_|DU2PEPF00028D0F:EE_|AS8PR08MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: 778c63be-26ae-4ac8-07e4-08dcf763476b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?T25qWXNXVFFxLzhTR2M0YTVNWVpqL3F4YVhBS29IWmdVSlYwOHIzSkpDMm9t?=
 =?utf-8?B?RDJrRzFPTFhRblhLYjREVjlyUE1FZFpCZ01Yd2s5dnBIWWlYckVXRG5yTUNw?=
 =?utf-8?B?SU9md3JtN0xKaGR5QkJhMDJZdDM3QTg5MDljYkttUUlITmVRSDdhRHl5SUgy?=
 =?utf-8?B?d2RvL3JvRCtHd3BTbW83MGhpMElDenZMdk41YW9LK3lDdGdwV1lGMndJazE2?=
 =?utf-8?B?Q3lYMmI2WGVLUzJ2UW9OOHlMdHliZmFEOSsyTmtISHU3VE1sTWRoMHB6ejNU?=
 =?utf-8?B?bGpySzlTL0hEelBSMjhoaUd6dWZEQXAzd1U2NFBxTE9aNjlDOXdCM2pDTGJR?=
 =?utf-8?B?UjRQdGVFZnhVVC85MC9MUXVHTkhzeEJOcGxHYm5DR2VjelgrUHl3ZkRtNmFp?=
 =?utf-8?B?Y2swNi9VN3NtRnhYaTBYUGxjbFcwZ2RFc21TVFN5M3lzRHcxdmVicTJnNDRz?=
 =?utf-8?B?QjJvUG1PNXYzRHhsY0V2ZW54bE1HS2hUelRGV3VHWnN5RjlCZWZhUXN6Qm5m?=
 =?utf-8?B?WkVSUjl6YjVjQUxMemYrTlpmTGRqZis4d09NSndGZGJsMWM1TjBPOFRZWWZE?=
 =?utf-8?B?UFFTOG0xKzFnc1hsK3dneWowcjNVZlZTUlRRSExjc1p4Y01kU2o1Q0N1ZXBH?=
 =?utf-8?B?bXRkcGhkRWVkdzBkVE1obnN4b0F4VkhIU1hOblJORGhvS09ZekNsNThpZmxS?=
 =?utf-8?B?ZFZuMm4vR1NKY25zRnFYa29uOENybGtuK0VPR2loNjE5NWhwUmpDYjg4R1BI?=
 =?utf-8?B?YUtsQ1JqMnh5Z2paZk9laElNdVZXb0NTUm9uUCtHMUlRY0tTZGovSWVHcVIv?=
 =?utf-8?B?Z1ZuNlBUaWpsYlZSZTZ2eHh4SW1RdnFtVFYvdmpCRDZKeFB3Rjlqa0JTc1d0?=
 =?utf-8?B?c0hnVjdtS1RtM0x3VE9GN3h2S05VSVR1TXBZWjh4RzJQbGlRMEE3VGx4OEdO?=
 =?utf-8?B?TDRZN2RUTlV2dEtHbklOS1orVk95Uk81VVFwYVFBT3RDN2hxbFRCV3phR0tj?=
 =?utf-8?B?MDk1dFJ3M2wreHRVclBsUEQ1TFRpcGpyejN0VXFYMzhodVZRUXpzcTdQT1Fx?=
 =?utf-8?B?K0NiVmNrZGZKcU9NVHVWeUJXTWNzcnAwcWxsakgxWFZrRXNHVjJzeXp2bnlr?=
 =?utf-8?B?UHRFZjMwZHJNd24xVXJyY29kYmRRODJhRURCY0JrNmxybTBLcU03TnR6bVN1?=
 =?utf-8?B?UFBZbk9tS0Jlc2plckFibllMQUlmTHd4bFhvRHBoRkJVcUdtZ0FjMkNya2Vr?=
 =?utf-8?B?YlF4YzFiNi9IdkpKNmhxNWVJZ1o0QmhXQTVZd1Y0ZFg3YjR4OVpDdnNCdHRx?=
 =?utf-8?B?SWFkNjZKdHZJeEJ4L1FRSG1ybldtdVVkU3QzWWdtaHRMYWpWOHkrYkFJTWdE?=
 =?utf-8?B?dXZ0VG45bm85Q1FlYkRud2lnQ01BM3JmTDJsS2MyNDNaMFZNd0JRRlVGeGZZ?=
 =?utf-8?B?QUJUZnB6Rnh4R1pqRFBtV1FYTEdRMmd3UDBLNGxYaW15SFNLaStocFlPTXky?=
 =?utf-8?B?RUJ3aHBQaXc4bTByZGwzOG4yVGhiVXY3SXhidytZTVhtc3NoSUVMQXhIcjVY?=
 =?utf-8?B?ekVVeGxDUytQUzAyTVdVVVZudW9XTkdnZFRxY0ZTUFQ0MUxZa1ZWUno1dVFr?=
 =?utf-8?B?OFVzZVY2OTJwaEZEY0czcWdTNU5hSkJOdE1XMHF4di9aMC9leExwT0ZnQUNt?=
 =?utf-8?B?R1hXYVdIVmVaZHZ3ZExPTVcySG5Gd3VXT0pxclJhRk8vYW1jOU9nMml0ZFh6?=
 =?utf-8?B?UENqbldsTkE5R3pEYWpzZWJPUVdkWFYvWGdXeHhNc0J4Vkt2akJDZzNDVXRi?=
 =?utf-8?Q?CxJYjUcwsmRHb+elIMtsI6QkRP2ggXZcbMTlo=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD307F0848731E4A9FA2FB47E18A7C50@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f6d84cba-633e-4364-5e8f-08dcf7633de9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2ZsQ1l1TVA3UVB2b0tNbndkY1A5c1RDRUQyK2M4MWVOQU96ZnJIemYzV0Jy?=
 =?utf-8?B?Zm85T0VSOGFYYVNWVU5oT2xnMGU5MVNsNHcxQm5Wd3hjaWRjUXN2VTJuNFND?=
 =?utf-8?B?WHg5aGt6RHVhdmtKOUNlaitpbUFRaDBoTENvOU9EZ2ZCOGxkcFNqUmhZSEE0?=
 =?utf-8?B?WDhaVlB0V0gxUXFybDZrRTFna1NZMXI0V3B6Y3FQNXM3VW5IMnBGNXcvcVF5?=
 =?utf-8?B?dU5jWnFpK1Fjak1uWnhYOGZ3MUxUS1RkWkZCQWhjZVZsRUx2WHN0a3VFUVVY?=
 =?utf-8?B?OHhJZ3IwNGlSN2pQUlprZkJ3dS9ibnBDQk9hR0dZaHdQay90YUp0SDMxdjFC?=
 =?utf-8?B?elhucWVIYnRWWngwUGJYaTYxVWIvVWZISkhqbEZ3RHlDQkFOeU9la2tiL1JZ?=
 =?utf-8?B?RGxwSFRzTGxrL29GcHYzbzZIKzk5SnpPcW5Xc1FUME53WUxiK3VpOGdwakZG?=
 =?utf-8?B?SGlYUGN5eEgwY29vaFZRYXo3YVhQcmlvM2Q2RWZ3bjZpdFJUcFd0ai9wNUxH?=
 =?utf-8?B?NTdmeElwelk0WSs2UGFIbVpMeUZUN2hoK3hUTUZJK1dvOHY0Nzh6MTNvaWM4?=
 =?utf-8?B?UGc2UHJqL2xzdzJQN2hYb3pKeG40ZEVENXpTYUtpcnl6MWo3Q2lMUGZmV2dh?=
 =?utf-8?B?MnYvL2RRaFJjanliUVEyZGdQQlNMT2x1TGw5dStjSllITjEvVy9yM0sxbFZP?=
 =?utf-8?B?Y09iV3RBYVhQL1JFbVBnRWRaaCtoN1B3MkpYbFNKNU1lZFpPdWVFS3NKNEYr?=
 =?utf-8?B?VE83VG1KNHE2WkdLTDNUQnE5cjV1am1ySXJ6N1dZdVR5UnZjWDZMVUVrN3U0?=
 =?utf-8?B?YUFJenhZNTZ6am1ocS9ieUhldUhvR3Z3RUxtazhsSEFldGtpRkdaUlVENHp5?=
 =?utf-8?B?U3RVRnRsVnI3dWhwcnFaZW0zV2NnNGprLzd6UDc2UHRncllWTUM4c29NNitw?=
 =?utf-8?B?Y1JlRGNkRjd5ekJaME1NVlZZUWtOSHBQR1c2ajBvVjhQVks0ZlpPZkh1dUdX?=
 =?utf-8?B?VVFDanNsLzZkYWF2QnZrZlZYcHVpQWRaV0FMWlBRVEoxeWI0dDJXcjBZMlE2?=
 =?utf-8?B?eHFIR2c2bEpMTWFlcEtuMzF5YVhWUHorQThvUzhaK1NOemp1cVNPcG1lNHhn?=
 =?utf-8?B?UWJ4V2VvN0RJcU1SR0FxSVJHcnl3czBBTXJoL1gzS3JYU1ZBV0thSjkxbkx0?=
 =?utf-8?B?dUlFQTFjVnVvV2FzeE5xM2VlQkhHUDFaUWROdnZ2U2VEQkRIVG5ONk93cTlC?=
 =?utf-8?B?eFVJWE41K0J5bkpVN2J1WDZzbjRoY2t5cHdQSFMraktSVEhVOHBVNVBRUC84?=
 =?utf-8?B?OEpueWdreU5pZ2srYnByVFBGM0RXN2VaalJLYXFCN1RndW1KZkN6ZFZMS1Vs?=
 =?utf-8?B?SmlndEIxc080L05SNWdrdjhqenppNTlEbG1GOXVYNmRuekJtbVVITVEyNkdz?=
 =?utf-8?B?eWZUSEwrWnNNcHFROFdMU3F5VGJjL1I4aW83MDJHTFB3WDdPaU9QOEI3Nkdj?=
 =?utf-8?B?aXpHYUdSZkdDaWl2dENBNHdXdEJ6S1J3bkd5cDdsK3ZHMGpCTHlhRjc2Vll3?=
 =?utf-8?B?dzRCRWFDRmlqcVcreGFxcGdlTjE0VDFlQmk2b2tZREtqYXNpOVpWdXdGbFZB?=
 =?utf-8?B?cDhDYytXN3cxRHN0TnBseCtwVFB5ZFdxZ01nU2h4djFEeTVtSm1KTE1mdE4y?=
 =?utf-8?B?VndONWhqbUFRQndhUzROUkt0UFBOc3pBd3E4eDJBOFA5R1d3azdEczdMMCtF?=
 =?utf-8?B?Nk5jTWE2VGU3Z0pUUWEyOEVXQ1lTelIya1kvcktocEk3NmQzT2VHV3VjV1hU?=
 =?utf-8?B?dVZvZnZrS2xkZ0FEaTEyOEpzTFZheEh3b2hSQlpZQUVvNktQWlZIaXRsa0p4?=
 =?utf-8?B?aFBCVzI4c0RLblMwSTRIbG9ZOGRHNE5DaGVZYktQMGk2RGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 15:14:55.1318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778c63be-26ae-4ac8-07e4-08dcf763476b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9044

SGkgQXlhbiwNCg0KPiBPbiAyOCBPY3QgMjAyNCwgYXQgMTI6NDUsIEF5YW4gS3VtYXIgSGFsZGVy
IDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IERlZmluZSBlbmFibGVf
Ym9vdF9jcHVfbW0oKSBmb3IgdGhlIEFBcmNoNjQtVjhSIHN5c3RlbS4NCg0KQ291bGQgeW91IHVz
ZSBoZXJlICJBcm12OC1SIEFBcmNoNjTigJ0gaW5zdGVhZCBvZiDigJxBQXJjaDY0LVY4UiINCg0K
PiANCj4gTGlrZSBib290LXRpbWUgcGFnZSB0YWJsZSBpbiBNTVUgc3lzdGVtLCB3ZSBuZWVkIGEg
Ym9vdC10aW1lIE1QVSBwcm90ZWN0aW9uDQo+IHJlZ2lvbiBjb25maWd1cmF0aW9uIGluIE1QVSBz
eXN0ZW0gc28gWGVuIGNhbiBmZXRjaCBjb2RlIGFuZCBkYXRhIGZyb20gbm9ybWFsDQo+IG1lbW9y
eS4NCj4gDQo+IFRvIGRvIHRoaXMsIFhlbiBtYXBzIHRoZSBmb2xsb3dpbmcgc2VjdGlvbnMgb2Yg
dGhlIGJpbmFyeSBhcyBzZXBhcmF0ZSByZWdpb25zDQo+ICh3aXRoIHBlcm1pc3Npb25zKSA6LQ0K
PiAxLiBUZXh0IChSZWFkIG9ubHkgYXQgRUwyLCBleGVjdXRpb24gaXMgcGVybWl0dGVkKQ0KPiAy
LiBSTyBkYXRhIChSZWFkIG9ubHkgYXQgRUwyKQ0KPiAzLiBSTyBhZnRlciBpbml0IGRhdGEgYW5k
IFJXIGRhdGEgKFJlYWQvV3JpdGUgYXQgRUwyKQ0KPiA0LiBJbml0IFRleHQgKFJlYWQgb25seSBh
dCBFTDIsIGV4ZWN1dGlvbiBpcyBwZXJtaXR0ZWQpDQo+IDUuIEluaXQgZGF0YSBhbmQgQlNTIChS
ZWFkL1dyaXRlIGF0IEVMMikNCj4gDQo+IEJlZm9yZSBjcmVhdGluZyBhIHJlZ2lvbiwgd2UgY2hl
Y2sgaWYgdGhlIGNvdW50IGV4Y2VlZHMgdGhlIG51bWJlciBkZWZpbmVkIGluDQo+IE1QVUlSX0VM
Mi4gSWYgc28sIHRoZW4gdGhlIGJvb3QgZmFpbHMuDQo+IA0KPiBBbHNvIHdlIGNoZWNrIGlmIHRo
ZSByZWdpb24gaXMgZW1wdHkgb3Igbm90LiBJT1csIGlmIHRoZSBzdGFydCBhbmQgZW5kIGFkZHJl
c3MNCj4gYXJlIHNhbWUsIHdlIHNraXAgbWFwcGluZyB0aGUgcmVnaW9uLg0KPiANCj4gVG8gbWFw
IGEgcmVnaW9uLCBYZW4gdXNlcyB0aGUgUFJCQVJfRUwyLCBQUkxBUl9FTDIgYW5kIFBSU0VMUl9F
TDIgcmVnaXN0ZXJzLg0KPiBPbmUgY2FuIHJlZmVyIHRvIEFSTSBEREkgMDYwMEIuYSBJRDA2Mjky
MiBHMS4zICAiR2VuZXJhbCBTeXN0ZW0gQ29udHJvbA0KPiBSZWdpc3RlcnMiLCB0byBnZXQgdGhl
IGRlZmluaXRpb25zIG9mIHRoZXNlIHJlZ2lzdGVycy4gQWxzbywgcmVmZXIgdG8gRzEuMg0KPiAi
QWNjZXNzaW5nIE1QVSBtZW1vcnkgcmVnaW9uIHJlZ2lzdGVycyIsIHRoZSBmb2xsb3dpbmcNCj4g
DQo+IGBgYA0KPiBUaGUgTVBVIHByb3ZpZGVzIHR3byByZWdpc3RlciBpbnRlcmZhY2VzIHRvIHBy
b2dyYW0gdGhlIE1QVSByZWdpb25zOg0KPiAtIEFjY2VzcyB0byBhbnkgb2YgdGhlIE1QVSByZWdp
b25zIHZpYSBQUlNFTFJfRUx4LCBQUkJBUjxuPl9FTHgsIGFuZA0KPiBQUkxBUjxuPl9FTHguDQo+
IGBgYA0KPiANCj4gV2UgdXNlIHRoZSBhYm92ZSBtZWNoYW5pc20gdG8gY3JlYXRlIHRoZSBNUFUg
bWVtb3J5IHJlZ2lvbnMuDQo+IA0KPiBNUFUgc3BlY2lmaWMgcmVnaXN0ZXJzIGFyZSBkZWZpbmVk
IGluDQo+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9tcHUvc3lzcmVncy5oLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVyQGFt
ZC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIGZyb20gOi0NCj4gDQo+IHYxIC0gMS4gSW5zdGVhZCBv
ZiBtYXBwaW5nIGEgKFhFTl9TVEFSVF9BRERSRVNTICsgMk1CKSBhcyBhIHNpbmdsZSBNUFUgcmVn
aW9uLA0KPiB3ZSBoYXZlIHNlcGFyYXRlIE1QVSByZWdpb25zIGZvciBkaWZmZXJlbnQgcGFydHMg
b2YgdGhlIFhlbiBiaW5hcnkuIFRoZSByZWFzb24NCj4gYmVpbmcgZGlmZmVyZW50IHJlZ2lvbnMg
d2lsbCBubmVkIGRpZmZlcmVudCBwZXJtaXNzaW9ucyAoYXMgbWVudGlvbmVkIGluIHRoZQ0KPiBs
aW5rZXIgc2NyaXB0KS4NCj4gDQo+IDIuIEludHJvZHVjZWQgYSBsYWJlbCAoX19pbml0X2RhdGFf
YmVnaW4pIHRvIG1hcmsgdGhlIGJlZ2lubmluZyBvZiB0aGUgaW5pdCBkYXRhDQo+IHNlY3Rpb24u
DQo+IA0KPiAzLiBNb3ZlZCBNUFUgc3BlY2lmaWMgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgdG8gbXB1
L3N5c3JlZ3MuaC4NCj4gDQo+IDQuIEZpeGVkIGNvZGluZyBzdHlsZSBpc3N1ZXMuDQo+IA0KPiA1
LiBJbmNsdWRlZCBwYWdlLmggaW4gbXB1L2hlYWQuUyBhcyBwYWdlLmggaW5jbHVkZXMgc3lzcmVn
cy5oLg0KPiBJIGhhdmVuJ3Qgc2VlbiBzeXNyZWdzLmggaW5jbHVkZWQgZGlyZWN0bHkgZnJvbSBo
ZWFkLlMgb3IgbW11L2hlYWQuUy4NCj4gKE91dHN0YW5kaW5nIGNvbW1lbnQgbm90IGFkZHJlc3Nl
ZCkuDQo+IA0KPiB2MiAtIDEuIEV4dHJhY3RlZCAiZW5hYmxlX21wdSgpIiBpbiBhIHNlcGFyYXRl
IHBhdGNoLg0KPiANCj4gMi4gUmVtb3ZlZCBhbGlnbm1lbnQgZm9yIGxpbWl0IGFkZHJlc3MuDQo+
IA0KPiAzLiBNZXJnZWQgc29tZSBvZiB0aGUgc2VjdGlvbnMgZm9yIHByZXBhcmluZyB0aGUgZWFy
bHkgYm9vdCByZWdpb25zLg0KPiANCj4gNC4gQ2hlY2tlZCBmb3IgdGhlIG1heCBsaW1pdCBvZiBN
UFUgcmVnaW9ucyBiZWZvcmUgY3JlYXRpbmcgYSBuZXcgcmVnaW9uLg0KPiANCj4gNS4gQ2hlY2tl
ZCBmb3IgZW1wdHkgcmVnaW9ucy4NCj4gDQo+IHYzIDotIDEuIE1vZGlmaWVkIHByZXBhcmVfeGVu
X3JlZ2lvbigpIHNvIHRoYXQgd2UgY2hlY2sgZm9yIGVtcHR5IHJlZ2lvbiB3aXRoaW4NCj4gdGhp
cy4gQWxzbywgaW5kZXggb2YgcmVnaW9ucyAodG8gYmUgcHJvZ3JhbW1lZCBpbiBQUlNFTFJfRUwy
KSBzaG91bGQgc3RhcnQgZnJvbQ0KPiAwLg0KPiANCj4gMi4gUmVtb3ZlZCBsb2FkX3BhZGRyKCkg
YXMgdGhlIG9mZnNldCBpcyAwLg0KPiANCj4gMy4gSW50cm9kdWNlZCBmYWlsX2luc3VmZmljaWVu
dF9yZWdpb25zKCkgdG8gaGFuZGxlIGZhaWx1cmUgY2F1c2VkIHdoZW4gdGhlDQo+IG51bWJlciBv
ZiByZWdpb25zIHRvIGJlIGFsbG9jYXRlZCBpcyBub3Qgc3VmZmljaWVudC4NCj4gDQo+IHhlbi9h
cmNoL2FybS9hcm02NC9tcHUvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAxICsNCj4geGVuL2Fy
Y2gvYXJtL2FybTY0L21wdS9oZWFkLlMgICAgICAgICAgICAgICAgfCAxMjIgKysrKysrKysrKysr
KysrKysrKw0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvbXB1L3N5c3JlZ3MuaCB8
ICAyNyArKysrDQo+IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tbS5oICAgICAgICAgICAgICAg
IHwgICAyICsNCj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9hcm02NC9tbS5oICAgICAg
fCAgMjIgKysrKw0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1L21tLmggICAgICAgICAg
ICB8ICAyMCArKysNCj4geGVuL2FyY2gvYXJtL3hlbi5sZHMuUyAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKw0KPiA3IGZpbGVzIGNoYW5nZWQsIDE5NSBpbnNlcnRpb25zKCspDQo+IGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQuUw0KPiBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L21wdS9zeXNyZWdzLmgNCj4g
Y3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUvYXJtNjQvbW0u
aA0KPiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9tbS5o
DQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L21wdS9NYWtlZmlsZSBiL3hl
bi9hcmNoL2FybS9hcm02NC9tcHUvTWFrZWZpbGUNCj4gaW5kZXggYjE4Y2VjNDgzNi4uYThhNzUw
YTNkMCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L21wdS9NYWtlZmlsZQ0KPiAr
KysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L01ha2VmaWxlDQo+IEBAIC0xICsxLDIgQEANCj4g
K29iai15ICs9IGhlYWQubw0KPiBvYmoteSArPSBtbS5vDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC9hcm0vYXJtNjQvbXB1L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9tcHUvaGVhZC5TDQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAuLjkzNzdhZTc3OGMNCj4g
LS0tIC9kZXYvbnVsbA0KPiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvbXB1L2hlYWQuUw0KPiBA
QCAtMCwwICsxLDEyMiBAQA0KPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAt
b25seSAqLw0KPiArLyoNCj4gKyAqIFN0YXJ0LW9mLWRheSBjb2RlIGZvciBhbiBBcm12OC1SIE1Q
VSBzeXN0ZW0uDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUgPGFzbS9tbS5oPg0KPiArI2luY2x1
ZGUgPGFzbS9hcm02NC9tcHUvc3lzcmVncy5oPg0KPiArDQo+ICsjZGVmaW5lIFJFR0lPTl9URVhU
X1BSQkFSICAgICAgIDB4MzggICAgLyogU0g9MTEgQVA9MTAgWE49MDAgKi8NCj4gKyNkZWZpbmUg
UkVHSU9OX1JPX1BSQkFSICAgICAgICAgMHgzQSAgICAvKiBTSD0xMSBBUD0xMCBYTj0xMCAqLw0K
PiArI2RlZmluZSBSRUdJT05fREFUQV9QUkJBUiAgICAgICAweDMyICAgIC8qIFNIPTExIEFQPTAw
IFhOPTEwICovDQoNCk5JVDogYWxpZ25tZW50DQoNCj4gKw0KPiArI2RlZmluZSBSRUdJT05fTk9S
TUFMX1BSTEFSICAgICAweDBmICAgIC8qIE5TPTAgQVRUUj0xMTEgRU49MSAqLw0KPiArDQo+ICsv
Kg0KPiArICogTWFjcm8gdG8gcHJlcGFyZSBhbmQgc2V0IGEgRUwyIE1QVSBtZW1vcnkgcmVnaW9u
Lg0KPiArICogV2Ugd2lsbCBhbHNvIGNyZWF0ZSBhbiBhY2NvcmRpbmcgTVBVIG1lbW9yeSByZWdp
b24gZW50cnksIHdoaWNoDQo+ICsgKiBpcyBhIHN0cnVjdHVyZSBvZiBwcl90LCAgaW4gdGFibGUg
XHBybWFwLg0KPiArICoNCj4gKyAqIElucHV0czoNCj4gKyAqIHNlbDogICAgICAgICByZWdpb24g
c2VsZWN0b3INCj4gKyAqIGJhc2U6ICAgICAgICByZWcgc3RvcmluZyBiYXNlIGFkZHJlc3MgKHNo
b3VsZCBiZSBwYWdlLWFsaWduZWQpDQo+ICsgKiBsaW1pdDogICAgICAgcmVnIHN0b3JpbmcgbGlt
aXQgYWRkcmVzcw0KPiArICogcHJiYXI6ICAgICAgIHN0b3JlIGNvbXB1dGVkIFBSQkFSX0VMMiB2
YWx1ZQ0KPiArICogcHJsYXI6ICAgICAgIHN0b3JlIGNvbXB1dGVkIFBSTEFSX0VMMiB2YWx1ZQ0K
PiArICogbWF4Y291bnQ6ICAgIG1heGltdW0gbnVtYmVyIG9mIEVMMiByZWdpb25zIHN1cHBvcnRl
ZA0KPiArICogYXR0cl9wcmJhcjogIFBSQkFSX0VMMi1yZWxhdGVkIG1lbW9yeSBhdHRyaWJ1dGVz
LiBJZiBub3Qgc3BlY2lmaWVkIGl0IHdpbGwgYmUNCj4gKyAqICAgICAgICAgICAgICBSRUdJT05f
REFUQV9QUkJBUg0KPiArICogYXR0cl9wcmxhcjogIFBSTEFSX0VMMi1yZWxhdGVkIG1lbW9yeSBh
dHRyaWJ1dGVzLiBJZiBub3Qgc3BlY2lmaWVkIGl0IHdpbGwgYmUNCj4gKyAqICAgICAgICAgICAg
ICBSRUdJT05fTk9STUFMX1BSTEFSDQoNCk5JVDogc2hhbGwgd2UgYWxzbyBhbGlnbiB0aGUgdGV4
dCBhZnRlciB0aGUgY29sb24/DQoNCj4gKyAqLw0KPiArLm1hY3JvIHByZXBhcmVfeGVuX3JlZ2lv
biwgc2VsLCBiYXNlLCBsaW1pdCwgcHJiYXIsIHBybGFyLCBtYXhjb3VudCwgYXR0cl9wcmJhcj1S
RUdJT05fREFUQV9QUkJBUiwgYXR0cl9wcmxhcj1SRUdJT05fTk9STUFMX1BSTEFSDQo+ICsgICAg
LyogQ2hlY2sgaWYgdGhlIHJlZ2lvbiBpcyBlbXB0eSAqLw0KPiArICAgIGNtcCAgIFxiYXNlLCBc
bGltaXQNCj4gKyAgICBiZXEgICAxZg0KPiArDQo+ICsgICAgLyogQ2hlY2sgaWYgdGhlIG51bWJl
ciBvZiByZWdpb25zIGV4Y2VlZGVkIHRoZSBjb3VudCBzcGVjaWZpZWQgaW4gTVBVSVJfRUwyICov
DQo+ICsgICAgY21wICAgXHNlbCwgXG1heGNvdW50DQo+ICsgICAgYmdlICAgZmFpbF9pbnN1ZmZp
Y2llbnRfcmVnaW9ucw0KPiArDQo+ICsgICAgLyogUHJlcGFyZSB2YWx1ZSBmb3IgUFJCQVJfRUwy
IHJlZyBhbmQgcHJlc2VydmUgaXQgaW4gXHByYmFyLiovDQo+ICsgICAgYW5kICAgXGJhc2UsIFxi
YXNlLCAjTVBVX1JFR0lPTl9NQVNLDQo+ICsgICAgbW92ICAgXHByYmFyLCAjXGF0dHJfcHJiYXIN
Cj4gKyAgICBvcnIgICBccHJiYXIsIFxwcmJhciwgXGJhc2UNCj4gKw0KPiArICAgIC8qIExpbWl0
IGFkZHJlc3Mgc2hvdWxkIGJlIGluY2x1c2l2ZSAqLw0KPiArICAgIHN1YiAgIFxsaW1pdCwgXGxp
bWl0LCAjMQ0KPiArICAgIGFuZCAgIFxsaW1pdCwgXGxpbWl0LCAjTVBVX1JFR0lPTl9NQVNLDQo+
ICsgICAgbW92ICAgXHBybGFyLCAjXGF0dHJfcHJsYXINCj4gKyAgICBvcnIgICBccHJsYXIsIFxw
cmxhciwgXGxpbWl0DQo+ICsNCj4gKyAgICBtc3IgICBQUlNFTFJfRUwyLCBcc2VsDQo+ICsgICAg
aXNiDQo+ICsgICAgbXNyICAgUFJCQVJfRUwyLCBccHJiYXINCj4gKyAgICBtc3IgICBQUkxBUl9F
TDIsIFxwcmxhcg0KPiArICAgIGRzYiAgIHN5DQo+ICsgICAgaXNiDQo+ICsNCj4gKzE6DQo+ICsu
ZW5kbQ0KPiArDQo+ICsvKg0KPiArICogRmFpbHVyZSBjYXVzZWQgZHVlIHRvIGluc3VmZmljaWVu
dCBNUFUgcmVnaW9ucy4NCj4gKyAqLw0KPiArRlVOQ19MT0NBTChmYWlsX2luc3VmZmljaWVudF9y
ZWdpb25zKQ0KPiArICAgIFBSSU5UKCItIE51bWJlciBvZiBNUFUgcmVnaW9ucyBzZXQgaW4gTVBV
SVJfRUwyIGlzIHRvbyBsZXNzIC1cclxuIikNCg0KTVBVSVJfRUx4IGlzIGEgcmVhZCBvbmx5IHJl
Z2lzdGVyLCBzbyBJIHdvdWxkIHJlcGhyYXNlIHRoaXMgbWVzc2FnZSBpbiBzb21ldGhpbmcgbGlr
ZToNCg0K4oCcU2VsZWN0ZWQgTVBVIHJlZ2lvbiBpcyBhYm92ZSB0aGUgaW1wbGVtZW50ZWQgbnVt
YmVyIGluIE1QVUlSX0VMMiINCg0KPiArMTogIHdmZQ0KPiArICAgIGIgICAxYg0KPiArRU5EKGZh
aWxfaW5zdWZmaWNpZW50X3JlZ2lvbnMpDQo+ICsNCj4gKy8qDQo+ICsgKiBNYXBzIHRoZSB2YXJp
b3VzIHNlY3Rpb25zIG9mIFhlbiAoZGVzY3JpYmVkIGluIHhlbi5sZHMuUykgYXMgZGlmZmVyZW50
IE1QVQ0KPiArICogcmVnaW9ucy4NCj4gKyAqDQo+ICsgKiBJbnB1dHM6DQo+ICsgKiAgIGxyIDog
QWRkcmVzcyB0byByZXR1cm4gdG8uDQo+ICsgKg0KPiArICogQ2xvYmJlcnMgeDAgLSB4NQ0KPiAr
ICoNCj4gKyAqLw0KPiArRlVOQyhlbmFibGVfYm9vdF9jcHVfbW0pDQo+ICsNCj4gKyAgICAvKiBH
ZXQgdGhlIG51bWJlciBvZiByZWdpb25zIHNwZWNpZmllZCBpbiBNUFVJUl9FTDIgKi8NCj4gKyAg
ICBtcnMgICB4NSwgTVBVSVJfRUwyDQo+ICsNCj4gKyAgICAvKiB4MDogcmVnaW9uIHNlbCAqLw0K
PiArICAgIG1vdiAgIHgwLCB4enINCj4gKyAgICAvKiBYZW4gdGV4dCBzZWN0aW9uLiAqLw0KPiAr
ICAgIGxkciAgIHgxLCA9X3N0ZXh0DQo+ICsgICAgbGRyICAgeDIsID1fZXRleHQNCj4gKyAgICBw
cmVwYXJlX3hlbl9yZWdpb24geDAsIHgxLCB4MiwgeDMsIHg0LCB4NSwgYXR0cl9wcmJhcj1SRUdJ
T05fVEVYVF9QUkJBUg0KDQpBZnRlciB0aGlzIHJlZ2lvbiBpcyB3cml0dGVuLCB0aGVyZSBpcyBu
byBjb2RlIHRvIGluY3JlbWVudCB4MCwgc28gYWxsIHRoZSBzdWJzZXF1ZW50IHdpbGwgb3ZlcnJp
ZGUgdGhlDQpyZWdpb24gMC4NCg0KPiArDQo+ICsgICAgLyogWGVuIHJlYWQtb25seSBkYXRhIHNl
Y3Rpb24uICovDQo+ICsgICAgbGRyICAgeDEsID1fc3JvZGF0YQ0KPiArICAgIGxkciAgIHgyLCA9
X2Vyb2RhdGENCj4gKyAgICBwcmVwYXJlX3hlbl9yZWdpb24geDAsIHgxLCB4MiwgeDMsIHg0LCB4
NSwgYXR0cl9wcmJhcj1SRUdJT05fUk9fUFJCQVINCj4gKw0KPiArICAgIC8qIFhlbiByZWFkLW9u
bHkgYWZ0ZXIgaW5pdCBhbmQgZGF0YSBzZWN0aW9uLiAoUlcgZGF0YSkgKi8NCj4gKyAgICBsZHIg
ICB4MSwgPV9fcm9fYWZ0ZXJfaW5pdF9zdGFydA0KPiArICAgIGxkciAgIHgyLCA9X19pbml0X2Jl
Z2luDQo+ICsgICAgcHJlcGFyZV94ZW5fcmVnaW9uIHgwLCB4MSwgeDIsIHgzLCB4NCwgeDUNCj4g
Kw0KPiArICAgIC8qIFhlbiBjb2RlIHNlY3Rpb24uICovDQo+ICsgICAgbGRyICAgeDEsID1fX2lu
aXRfYmVnaW4NCj4gKyAgICBsZHIgICB4MiwgPV9faW5pdF9kYXRhX2JlZ2luDQo+ICsgICAgcHJl
cGFyZV94ZW5fcmVnaW9uIHgwLCB4MSwgeDIsIHgzLCB4NCwgeDUsIGF0dHJfcHJiYXI9UkVHSU9O
X1RFWFRfUFJCQVINCj4gKw0KPiArICAgIC8qIFhlbiBkYXRhIGFuZCBCU1Mgc2VjdGlvbi4gKi8N
Cj4gKyAgICBsZHIgICB4MSwgPV9faW5pdF9kYXRhX2JlZ2luDQo+ICsgICAgbGRyICAgeDIsID1f
X2Jzc19lbmQNCj4gKyAgICBwcmVwYXJlX3hlbl9yZWdpb24geDAsIHgxLCB4MiwgeDMsIHg0LCB4
NQ0KPiArDQo+ICsgICAgcmV0DQo+ICsNCj4gK0VORChlbmFibGVfYm9vdF9jcHVfbW0pDQoNClRo
ZSByZXN0IGxvb2tzIG9uIHRvIG1lDQoNCg0KDQo=

