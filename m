Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6972DA2AC76
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 16:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882999.1293092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3pn-0003Th-GZ; Thu, 06 Feb 2025 15:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882999.1293092; Thu, 06 Feb 2025 15:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3pn-0003Qm-Cr; Thu, 06 Feb 2025 15:30:31 +0000
Received: by outflank-mailman (input) for mailman id 882999;
 Thu, 06 Feb 2025 15:30:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUPl=U5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tg3pl-0003QJ-S0
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 15:30:29 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b9b77f7-e49f-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 16:30:29 +0100 (CET)
Received: from AS9PR06CA0420.eurprd06.prod.outlook.com (2603:10a6:20b:461::7)
 by GV1PR08MB10977.eurprd08.prod.outlook.com (2603:10a6:150:1f5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:30:26 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:20b:461:cafe::d5) by AS9PR06CA0420.outlook.office365.com
 (2603:10a6:20b:461::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.21 via Frontend Transport; Thu,
 6 Feb 2025 15:30:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 6 Feb 2025 15:30:25 +0000
Received: ("Tessian outbound b77899637302:v567");
 Thu, 06 Feb 2025 15:30:25 +0000
Received: from La72b946e65e5.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 06F76F0F-BF7B-4CBF-B453-5C904ECF4544.1; 
 Thu, 06 Feb 2025 15:30:19 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 La72b946e65e5.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Feb 2025 15:30:19 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB4PR08MB7933.eurprd08.prod.outlook.com (2603:10a6:10:37b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 15:30:16 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 15:30:16 +0000
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
X-Inumbo-ID: 4b9b77f7-e49f-11ef-a073-877d107080fb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qVlguVQ/5B17kgvPPlTo8fQNjc1uFTT9/DsX+46Gn9jW9k4F/Q00UP8PAVg+jah8nqh7DNmESQ93WbBmBl7iuQmsQlTtF5QJ4PkNwZj8Fc4KLw/HjF2/v0n4p4xqZDd4J9xRNXyO1DjkgYvk9hTMtkPPBU/YALPnElaUPr5JsEQm7UaGFTWiOmGmrLfF90MsCEfxgYK+uuo9GvbB1cZ6yAUMppIumf5y/cjHZR1nNy3tPGRJflVKq8MhLVGMmCVPAdF042Fs0XQ+xqmhlQgVtfI9o97LHPNzJrrU4pG7CzUjG8npaKA0O94h1FItbadhPtVQ0Br++hqRqTHTeRFnmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdeheWgbTia143D7szvPjBeyxQsYlYraAFxGKLCsUGo=;
 b=E32iGiiZGvXvRe0sEUfMZZGpIy4LETIXG09rDKeJ85bUa3XX3zFHK3wXkiSSxZyp3+zNY7v61q2D/y8MH8YfrzHLWlCTUx3wE6MQhj4CuvmFTBamPOE0+GlIG3cLF6Ycz9JbBDOTIw+DuCEpEWY/OxdDL1C8CQOnCtQRXGTmKb4+x4tXt1lq7sSoRLYP+152lzJYjWoCT6HvQWKLphzBZhJyysHMfrCR/+kRsRKD/h1zZa4yYfCu7mFD6YIA3z6HRaSOqTUET902DuyRWlxzoaDOhPV8U+54XKFyVKQXPHiGUJHIwYxo/KuTA2e302nHKj84KwraJVI9YiFgJNNRXw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdeheWgbTia143D7szvPjBeyxQsYlYraAFxGKLCsUGo=;
 b=BTBGv90xTdl+ZTPlXKsvJYwcn4S3fw/2akOX4CNRjoNrOOXRQfP0K/1KdwKAlS1wRCnJScZyRl4r+By69JxfjGe+vZJOSqc1BfFmEhUBAfjOvh2YR1SHIABbLXJ68yjCSvYVfmFg35UrUZBpNA6oCnRUyf/8fCuoHq9wOvtpQC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24a8763a1a4de5e5
X-TessianGatewayMetadata: qzRwrw6XmiplE0t8DhMz7zPimoWL1tBSmfE6xxg0pn0RjjOGDwjQQw+wCPwMHh/YVw0jnQvMZQx4ACVTMwrEG8iT1rclXHOw7OxN7rmt5Ah4Oy7v4ahUJeqAffG7m1CF9y97CxLJI5/keW4J5V+5OU4T+slhoYx0NY9WMsT+ChY=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jNrM7HRjCnhYJTb7ZbMyKHzK4kOQ4VyXvmK0YLs1wq782XMTSqoh+0ih3h8T3qDOe96Z8w++zzPLMXih2cMlxc8YWO1zyUu2RhenS/7YqvP+u/tzeK5eog5ePW/vuWnzeNMSiFerfFQ0da7oc0PgBb1Qvw0wx5EGmc/FOnYuwfHW5JcPPLh0FMBNOsbHjon0p0NHeGMU/O6DLPLlXi8Xi2GyH6NY9kiKAHQUdF4gnJwN8DaDOZuFedFmg9xdsa4hpRvs/fzamDnCJq5WHqk3FpByZPp+CAQy9s3RKkWVI6QPKlWQTQ3vqEqryvmLJ5Y5TMtgMVqyj0eXhB60+QZPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdeheWgbTia143D7szvPjBeyxQsYlYraAFxGKLCsUGo=;
 b=gFZzGB4o8DJ1zneJsS1S9vt9CUQ9ZEbZ4YY6NYKGSdvUXgMxpwm/4GhN68fFp3K62InP+1h4a85O2RAH/slagjVC4po4m0UbIgcc2j1P8ksCRo87RcX/t77iZI2htj6Ahy9xTcga4x5UW6VQdQQ7JVJWdFItLbheOgqUae0SfwSZTwpSR4nSIJOFp+cTC5LhYItim6WkUoGU+5IiXAnZbqMqaAnreWK4n3F2dCVCGeuRefJ6rVclKTIhekXOAUQQ16WNfGjXb4IQpj08pepjPDs3nM8IBiupF8xT/TNUBezMxA6/LHXjcgqEct8YMU3EDuefEP4EHUhAfb3ZAh5qmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdeheWgbTia143D7szvPjBeyxQsYlYraAFxGKLCsUGo=;
 b=BTBGv90xTdl+ZTPlXKsvJYwcn4S3fw/2akOX4CNRjoNrOOXRQfP0K/1KdwKAlS1wRCnJScZyRl4r+By69JxfjGe+vZJOSqc1BfFmEhUBAfjOvh2YR1SHIABbLXJ68yjCSvYVfmFg35UrUZBpNA6oCnRUyf/8fCuoHq9wOvtpQC0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 5/5] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm (arm32)
Thread-Topic: [PATCH 5/5] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm (arm32)
Thread-Index: AQHbdzpzChlUH5HiNkyUjGOD7H25LLM6aXIA
Date: Thu, 6 Feb 2025 15:30:16 +0000
Message-ID: <C5FB4A92-019D-47AC-9BB1-602F693F51BF@arm.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-6-ayan.kumar.halder@amd.com>
In-Reply-To: <20250204192357.1862264-6-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB4PR08MB7933:EE_|AM3PEPF0000A79C:EE_|GV1PR08MB10977:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c5a949-7cc9-4b9c-4d1f-08dd46c32df5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?9Aps225FB9yAmU2ZxzSG0YgmNG8rQ7AECfLMAL5qTkyXhSJjV1rfdWl9PxIV?=
 =?us-ascii?Q?er1ke/5s6rnfD9VZoEj0nr1dDt0nUfTfx0E/0sZy4T4Is2KhL6l4NWsVXfkI?=
 =?us-ascii?Q?oJF+Xu5weCu/FVy/SVyBKSxOtqdrZWQcWDFf2EzGxIEbwRK9c3yzsTq6kVRL?=
 =?us-ascii?Q?fENem1bHRI+CSf7cu0nOab+GaVGv5D2xWalp1c/H+JZNX+EpoYn0xIxM9N88?=
 =?us-ascii?Q?YECnpL8eZf7Ty1SIwWS1KMNu7rac1qfOFp7rKAHEuTse5qWttfvMUBImNGIb?=
 =?us-ascii?Q?WMnbRNvmsq2SjSZbONNXQHBGgNsgPMRxIhETT0u19c6oEHZ7iv5HmYFFMs/d?=
 =?us-ascii?Q?Vrf6FrNex13jCd27NKCMDjxbVJM3ajdvw4JhOwaIQ2qz8dilptHlmVj3WciH?=
 =?us-ascii?Q?YONDPAZdokKpfvwuNyKybm/VEF/lTNiLayS3UnTge2TKWAptZQhsqqcLIDBv?=
 =?us-ascii?Q?fwjQTF5Qw1gjV2RJLjUwJeTHniEaaZaVg7aTtDfg3aDxOg+iNBJ+Wz+owE44?=
 =?us-ascii?Q?Tp5CftY9eES4hIt31n4/TVaxUVSX8KxriFszPCJDk/3mJfH/YxuNO3q0WlDj?=
 =?us-ascii?Q?hOUycwCcE32VIlWl2cPRjiTRcmuQPo5Dd7988rouTuzndBnpoQ1UgZJQQMum?=
 =?us-ascii?Q?a7N/IEVrfvBLezNnn+jpNDob51nP64fsllwZQw/kHZamSB8SEMLIBJBa7fmN?=
 =?us-ascii?Q?vGb/dBH0ec4einyIyyRvmsH0Qw1hvTn9aQn8zmuudlhb+U8CDXDjzqNiXHIe?=
 =?us-ascii?Q?X6ebOgq6X/S4WHcZ35sgxJGdofPoLxlqRh1aGoRSx8/I2X6Zha8Efv48qD8m?=
 =?us-ascii?Q?EuSIG7CBcQVW2QAaDD4K/GxJxyyCek0w91Ac6SEU9QoY35OjSyoTwh0ph5/N?=
 =?us-ascii?Q?XVSA42WEZHneeEgKEf+ppGDvlwop4l3xNMEc8qWHsNUw2Y4AoAIl5/AXl/eT?=
 =?us-ascii?Q?TMNQrccwZWySrqn3ufAlJ/8DkNvWMdZLRKXG3pN7t8LEY/Odjf6kdJM7ThFM?=
 =?us-ascii?Q?uKq4AkOZe8YJcNZzJD1285eEWvhJ0RG4tCxL4JmgUzUh2DX2LmHzCG4pisdF?=
 =?us-ascii?Q?y3mrGyaeEoR1kqJ8904FFFYRpPqKtshRxX3MDggP712k8zcf7kIoIi9W8w83?=
 =?us-ascii?Q?A5k3iwKsBpqAgRNAJLmcej5KU+HHJn5+rIMWYzAVed0qyd37g7niiIqqKqr6?=
 =?us-ascii?Q?Phjj2/IrH4rXuCkFBDjktnYGSiUph8Xv5ugctFVfVrriRXPOXmvRZBuiTxv3?=
 =?us-ascii?Q?mZVrliCQaZI4NW5q972WwMHCAMc797lHYGhqziShuKhiJxAWoV4mg1EmXgJ3?=
 =?us-ascii?Q?D5PPRBwWgVZ+UgB/OIZqwFxyEcR35owhkwFfEeLpQPGAXgb0xTGUchKEYfh3?=
 =?us-ascii?Q?Td0aJY3+vhiioq/KIRgXwbMt7ZBIAn1rtZ08dmiRMC5EYKPkDJSOF7JV9LSo?=
 =?us-ascii?Q?uKz1TDtpKTc7vqAussasY55zbrZIh/Jr?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C894E834F6BC2B4A9F4660700D04D13A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7933
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3b29135-2703-4e32-3948-08dd46c32871
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|376014|35042699022|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qQnvVYD4Uk3Agtxy1Dyk65adHzz80UtrS85lSZwsRbJ+28qLzIpOkoMzATLP?=
 =?us-ascii?Q?JIHpa9FLeKUmQY7vBhe8YdsDq7sR51yTGLASOaXhTEoYcMKuJigIyF/j6csX?=
 =?us-ascii?Q?Zrm9V0CeBVrr/uZDP5cII+tX17mZTOifB20tVh4/pGS6DpMiNlf1eCh1LqPU?=
 =?us-ascii?Q?LC25q1vqlDti4wzFStTm+uZ/En0tFB0REoSB2aHV0ZIPlVD4yp4Vb5RM8tws?=
 =?us-ascii?Q?qaHD3mYuWp7FP6Rn8XUOSd4IQK6/Q9I7V42spYGx0c9xSJcXRTQlFTBfMqSz?=
 =?us-ascii?Q?V7+vj6yR/1HiwIG61XVoc4NIpRNo3FPM3QnwfBNIuGd/P166GoNe6qGX+txl?=
 =?us-ascii?Q?6qtCmZsoM4hob9L0MLa8M4pwRhzp+hYW1XsnpC4gbFaZegoaSsPWbNOWMi4z?=
 =?us-ascii?Q?xVk7PpmpgWnwKlWPODoAxhZ60jK8GkVr3M08Gr+J2smNSEZYE1zRvDlOQFIf?=
 =?us-ascii?Q?Y9lLW3pfWkliApK1ad5TV294k2iZ1vemrJSwNAvrwCSbBaZHkJe6kymx951G?=
 =?us-ascii?Q?KXITm1ele5Ze82Z43Eg865AQ9shBRrPcZS/0Vdo0iNDZrtlFLSsY0TpYtbGB?=
 =?us-ascii?Q?usagWmbhDFmIMXmqtz6t/v3WwtQHrO8TKauIk8QoLcmgFfTZ7dqpxh6sykid?=
 =?us-ascii?Q?Mgm1wByd+IBzwe+nO2sxayV0heS/XT822sGxFJcZIjluatsbgkd8ggrT6T4e?=
 =?us-ascii?Q?sDr2tpYizyRsNTWpZu6HTuu6qsT0amVLnDg1Mw5E4pRUjc/HzpLEw2O7zLXC?=
 =?us-ascii?Q?VPdooCrkMt3Nbc2qoSfUIUneUK6yz9l5KvMFLbwyPHXTBqa4aW1mSAUR/roc?=
 =?us-ascii?Q?LF5Rp2Ydo83OUW3VO0yR1LZCgu0a2ngA5clC2JshS0UWGQvsT6YYRCDTkWk1?=
 =?us-ascii?Q?YVJns3BiMVQFukGdtV0exJ7RqjF+sYNcbzJW93GZzsPqzko479aSFPK5fMlh?=
 =?us-ascii?Q?tMlLHSIVmB4j7sQcFEYEoScveuSSjCX6LlHjcl83tzDR+PlmlGr7Km+9I9pT?=
 =?us-ascii?Q?hbYIop3I0OcOHS81cHF+OlXEXYiwFUlKag6gJg+4LTfmoJQWeCUcl8gketDb?=
 =?us-ascii?Q?wtRW9fqw7yJ8FJP4IFk3LiTsUlX9H9tONLZj8c6Y89gM4QByoNzBmpJ33/mS?=
 =?us-ascii?Q?Qig+zSl0JVufbuhcEHBgUkvG2i2YTHSzq3UiClnp0SEOQT2oILej1g6QRiUg?=
 =?us-ascii?Q?Ww1j3GZQ2A9BEsTTQIqQa8Wuy36gW2tSmHN4+YxD8ksvT98dt1bAXLcCbzQN?=
 =?us-ascii?Q?bdWmBsVJon7Xl2DVtKtoN80sJX9nYTKf4yWGMWhCjogCW2ZpQqKBt/RfNIa1?=
 =?us-ascii?Q?19nx51RoyJBpzZepV62aj4LWcDBXT8fLVBLhGwXUHIwI+ZbQcHudCHIdiZoP?=
 =?us-ascii?Q?Y4Ff4KKkRl2TGVC0FFrbkQyazAeGbMxHt9xa6RpeRilzjmhYD+earivBIzVv?=
 =?us-ascii?Q?hJ5tOYwXcbUdeHjbQtSFKcEQplvNPxT/1nKEFvIeDDRMXV1GvHchUe9MLxa7?=
 =?us-ascii?Q?m4X45bsZa+w2OEg=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(35042699022)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:30:25.9471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c5a949-7cc9-4b9c-4d1f-08dd46c32df5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10977

Hi Ayan,

> On 4 Feb 2025, at 19:23, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> Secondary cpus initialization is not yet supported. Thus, we print an
> appropriate message and put the secondary cpus in WFE state.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



