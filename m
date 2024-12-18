Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFB09F680B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 15:12:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860432.1272449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNumu-0000Bv-Fr; Wed, 18 Dec 2024 14:12:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860432.1272449; Wed, 18 Dec 2024 14:12:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNumu-00009b-DE; Wed, 18 Dec 2024 14:12:32 +0000
Received: by outflank-mailman (input) for mailman id 860432;
 Wed, 18 Dec 2024 14:12:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNums-00009V-VC
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 14:12:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2613::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d017927-bd4a-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 15:12:28 +0100 (CET)
Received: from DB3PR08CA0005.eurprd08.prod.outlook.com (2603:10a6:8::18) by
 DB5PR08MB10236.eurprd08.prod.outlook.com (2603:10a6:10:4a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 14:12:24 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::da) by DB3PR08CA0005.outlook.office365.com
 (2603:10a6:8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Wed,
 18 Dec 2024 14:12:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via
 Frontend Transport; Wed, 18 Dec 2024 14:12:23 +0000
Received: ("Tessian outbound 867970499bdc:v528");
 Wed, 18 Dec 2024 14:12:22 +0000
Received: from Lb8c52f79d2b9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 08639C5D-EDC3-42E5-97BF-AA704E4AAA81.1; 
 Wed, 18 Dec 2024 14:12:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb8c52f79d2b9.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 14:12:15 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB8723.eurprd08.prod.outlook.com (2603:10a6:10:3d1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 14:12:12 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 14:12:12 +0000
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
X-Inumbo-ID: 1d017927-bd4a-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=T32/thXX0YSL2eSz/azH104uVIKKTcp+mlPsSzSYShQ4UfHC7rJnhPzgwiMprGFZ8sP5wUm3jb0oiz/JUYaimM3zI1fx5xqdg97rROx5f+vjhpoR0SfYhyhb1JPw/iRO8Awptu8AdVy5gQw1oyzzbJcgob3r0iFSsg6aJjYvHg6fpZrAep6cp3xG9DuxJhn7Bmf4yRZ0s0YvHzdkRfDNpWD0jPfcW79z188eiI+G0Gjxwbsv9FkDcaKQSQ3/e+Gb7IsD1haKFJgk6cbbM43F4GJ57dVewLiKvUWdOx/+flTTpeehk/RNEsy35ge+V4QLDnxh7cjTqBNNf370Doso9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0YhzDvwP5sZj5QdxOC9wK73scv72qM2xljUF+C9HE8=;
 b=wRWG6HeuINq+cv+3d10rzlkAk1+8XIFoCErBUlE37vexfZhPOZ0nXv3EiXOMcaL8omjwyM9/4vsFss88nqdt3nP0pRm5wmo2oxYNtE27lhsmAQSjlA901YiTz0ObU32liCR6p2T+GZt5GnHrSiT7tKbF1LHEfam4mzq00NFYiPdKdsnhiuRLeazIIYASfWZyERdvdUUoXgCMkh+1o5LJcHwukDr8gpIx7iBAzmJ42TS0I93g3E3oertRKIWr35NHqJGobJmTOHQ14XwQELlBaNlOGU/dbEyIakFtfn9ehWHTnazyZoONO/d6jPYuvSGzzyeYGF6kdQnaxX05nBO5dg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0YhzDvwP5sZj5QdxOC9wK73scv72qM2xljUF+C9HE8=;
 b=jRE+jCVUVAIV61SJ93coNEWXCSA+MsahpZ5SB7Il2bmZxUj7NeKHkBc17usDXN+FqLa2p11+AgdOCHsAuyZIux4RBhjHRPbzP7yxerE1+XTAzxdwW7EsunyYT4F8Fp1K6MbdkXDj7/Dpxzs/jvgBIyIHao1m1OqJR4LR/Nv++Uo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f30b15428fe8d3ed
X-TessianGatewayMetadata: 0ucLMFV8xNgefFxUgbvh7cg8S6q/zDtfjjLtao2Imapkf8woK5tArkiAzmctfhyOz+5rfDjuu8oM/b0c3IS3L43GbmixFYuNjKF0oTCdHhlNrgw8AdrGsRdvnnDs/Gn/jlogwr0BCM+FVPOI9a2c9yHs7c3DhT12+nvpTQNQdzs=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I44KEua44pj+sSRtf5SGVE3vUXpzkZOGxzs/qNqTvGTEGka5i0Fn8Lg8eKa1kYcaSUDe17XOW+4ZDwRpZjSo8BgtNR5v/EW1Wkk6giVc55WmOwPlxZyXuidnaL2h3WwWgh+F1HcFjjh2aO8yf0J9oflYnbszPhDhT87Gl9Bjn7dJnbMb1C9ROimCiv9gb2R7K7eTTp9lDkpCZx+tGbbqjndZONpQEawDi3ognWQ+FNPReuv7B8LrTu5ZH2mnsglWaCGjmEbeKdvrrcilyF4QjD1LWqedT1zY5ILc4OKHNeqZpxkQa4scPe+QP3Wkwm4VQ8s/szcO3z3TkKUQ9aCh9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U0YhzDvwP5sZj5QdxOC9wK73scv72qM2xljUF+C9HE8=;
 b=RmbhaAR5Nb/dA2CUmuWjU+6vF+6tcZAbqhuMDTU7Eeocu6uVHAKIn1ryFyjuvNDfw00T6lZ5V/BHGG+usMjdTK5AALQLW9IQPE/Tf6zNtMJ2YWgCEKUDpGB9+IAIzoHktEiqnAEAXBouwDVbzbff3J/h4zwgIc9pNevaJxWHB9+if/3hJaf56enKvbWnEMR5MrJQby8BU/o+46LsN75PMxRFGYkmT4TXbeXpJiPjtL97IfoEF2i6r9EqUZxoPflk8pRA5neD/V0Bomq2XYuyE4xbYJfOfsR2WG3q62yN5pFDG5XDVqj/PLcye7wDCqvkysSQ9oz8pS3cXlyrS19tAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U0YhzDvwP5sZj5QdxOC9wK73scv72qM2xljUF+C9HE8=;
 b=jRE+jCVUVAIV61SJ93coNEWXCSA+MsahpZ5SB7Il2bmZxUj7NeKHkBc17usDXN+FqLa2p11+AgdOCHsAuyZIux4RBhjHRPbzP7yxerE1+XTAzxdwW7EsunyYT4F8Fp1K6MbdkXDj7/Dpxzs/jvgBIyIHao1m1OqJR4LR/Nv++Uo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Topic: [PATCH v2] docs: fusa: Add dom0less domain configuration
 requirements
Thread-Index:
 AQHbTMiRgWsw6YUipkyfuZOmy7e9xLLrs5oAgAA0fwCAABobAIAADYkAgAAA9ICAAAKcgIAAAL6A
Date: Wed, 18 Dec 2024 14:12:12 +0000
Message-ID: <72439F83-3602-499A-92B9-C5DD60B89AD0@arm.com>
References: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
 <779AFC45-3F8C-4065-A39E-9325F9C72AAD@arm.com>
 <2cf952f4-69cf-4eea-aace-4b7bf291b9f3@amd.com>
 <983EB0F5-8C88-4063-9C97-EC8BB89AA5B0@arm.com>
 <3984b69d-e15f-4863-8af9-53b6cc0f6bd1@amd.com>
 <E4F0C26E-9FD2-4C48-A3F1-4CC599B4EC04@arm.com>
 <702f8ee6-e53d-4bde-b773-745a2aa5b4b4@amd.com>
In-Reply-To: <702f8ee6-e53d-4bde-b773-745a2aa5b4b4@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB8723:EE_|DU2PEPF0001E9C0:EE_|DB5PR08MB10236:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d153100-ed05-4966-34cc-08dd1f6dfe08
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?rA2Ca2Pn8dZ2vLW/VgDuUZ1sWgh54QP1yiN/ma91DgISGGzHoYUar1O1rdqI?=
 =?us-ascii?Q?1jAaicf29THNjaijWiK7c9pRjqZTTAO7iAgZzz/EeRtpaGP+M/080CEpbJx3?=
 =?us-ascii?Q?PHb0HeSyG3MXvqI2JF48qF8+VTQ8NO85ejHCsWtXZsvMOUHOPrDV/sRaBE1j?=
 =?us-ascii?Q?etaRdKLpdXlv21mBcvKuZ9un4PnZciROPGb6QgdQQUcPRC8qoS+ZA/cAcSJq?=
 =?us-ascii?Q?FsISNS8tFNSCE5kcqeIvBV5X+SIrEG9NjYgWgT7/jtGXfa4UiiCWL0ASxXUn?=
 =?us-ascii?Q?GCKWLORmNjYiYJm6DSzFL1pEB2XkX5rfnewRj3ENhMECvdYQVeDDqNousKiH?=
 =?us-ascii?Q?NCDDIbpFgklKVpNxgQ+TrqTWlB7CqKEJ7h4PTd5zOPa2N71xk+kg4szDiJmw?=
 =?us-ascii?Q?kHdfBoQfyUahWhWEtyaQA/Y7FDguI3op+G3v7UcqzeCcyEPC+pQuQwzYANYv?=
 =?us-ascii?Q?xndfcK5ZpglO2NFX1Fht5YbQoAHqdP4YcR/k44cDs57369z4U4uO8PGuIMWA?=
 =?us-ascii?Q?V94j+VwMyBXCY7sIb59HOHKx3Q5eTyoDFb4le0U9K1CrGcICZ7C29SA5h6ku?=
 =?us-ascii?Q?jnvke6+uUDlRFSbaSFmtAWTyYBWqeT/xXiiXZZHhxszWq3q7alc0dk+5Hx1u?=
 =?us-ascii?Q?MpvjOL2ZzejJMZg4623CMqTs8QVLL1zxnbGIIEb+p/LJNS+os0SYdBeYK9ed?=
 =?us-ascii?Q?ta5M8d5EaE2xBVMwT+xDy7KkHz+OaayNA+x+yDVrwlGm+nY0jRbZjmf34OrY?=
 =?us-ascii?Q?4grrJSj1DYuHQjc1rTwj6aAEffQ4CS3Wd20n6TbCLcnEDDJlTv6Ikcn8qipN?=
 =?us-ascii?Q?TYPjZtjHT564Qx+GgoDnKLx6M5LRaoSRH+jXPRad8vfHBSuufchxWdbNT3fq?=
 =?us-ascii?Q?55K4U9nG5pS1bGTj4tpFGCOSx7wsbUN0kk0wtxq5uCfQhWITBzSr4DIF1pCP?=
 =?us-ascii?Q?NvwW0pnPie+Jj0hxYb0fIZj3yQ+GXZwaG5k9wEGJwWzG/MTZ6Bry9fiDPdw0?=
 =?us-ascii?Q?wGLqqzFyUGRAJOF9+6ebdD/DCcjABy2gNyz1XzI/QdiAv5qdyhlFWDaKe8uY?=
 =?us-ascii?Q?V/uV2nfEBKkMVEExKKsSRQ20U5W+wGtfR3VF2eztQizQxn3G7/BpRTNDJ1Ji?=
 =?us-ascii?Q?wjYK/HbCeRRB759wV8+B8ZHz7tORQ+EsDYLot1GGFjaPHxH6mkg3BNYwv+of?=
 =?us-ascii?Q?EgWNu/rdip+m0l/bddj1JD45mIhDGdjr9vLsADAFOtmrtbiDo05U+lAhKMN/?=
 =?us-ascii?Q?sfdi/ObKhy2aqytTmOpQxkLZ42AWxFmEOYZ3qymyhKyF9K/VY2F7lWkJ4ieO?=
 =?us-ascii?Q?DUgB+fz+7u7lpZ0w1IRP/qlg9PpwvbxfIoE6e27EYz5T85CBRkLufQcv/2Hd?=
 =?us-ascii?Q?2j9hSeEw+SgNDnHnnkkzYtoZAQNr?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E6AD6C8C753B97408EAE18D86CA9EA8A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8723
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a1d459cf-d94a-46a9-7213-08dd1f6df79c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZWrdBhkDARp0omhGzZA+Kh7W8FCLm/au6r8KZ66IGn5IDcN7ReMOHDZfqW7/?=
 =?us-ascii?Q?m6eMvVg+slaCxZfHsi5CjgmGYzXMkXTKuFwqHbs7tUlBeZJKGWgoFD3Ob91D?=
 =?us-ascii?Q?5v3tGrdIZ98d03U7cbL8h+x9X8n3f/Z9yfg/oKXXD01d03rKJ/rOiF/GKiTe?=
 =?us-ascii?Q?WD22uxMYCaSlRCRo1oHAc5nnjN03gCA6gDisNXq27zts8DD5oZX2onsPvksF?=
 =?us-ascii?Q?fSGCtnqnjKbTLPQ91kJFjO98SDif3anI1kvlHBF101Bf98Y0A4ej6Z512uLD?=
 =?us-ascii?Q?5Sk7DaHSLLQ/1tTx0cvDAslFivlm82SMDDWoBDUOpiWrstoL6Ls2CVSsGI9M?=
 =?us-ascii?Q?n5MD6zUkXLr9aeoPmQXJQLFOGVP5TOAgze4mebhG5qXSnAjGwsoKeJCH2rQw?=
 =?us-ascii?Q?LZiZKqtapU7YeJP6qCirY2zkSKC7ZhzRhY2nw84mfpgcamodDKhEurMUXZm8?=
 =?us-ascii?Q?kGjx37MmdTB5MjXEtrxVNBwcMFJqx2ockqVzIbWl5TjT/++bWHu827Mw0iG9?=
 =?us-ascii?Q?RxVTaCGNTlmFIAei7G8X7KsPtLtqtoake+iDGNfkT95LjTUDvKuCU5imdkbn?=
 =?us-ascii?Q?zMjMsJRMvMYjU7H9zXdv6foOWG7zcvicZqSSSvSsiU96zCU5a6TGvP6aARpL?=
 =?us-ascii?Q?YthqXZoO89NfEWOH8x+VCsT4/A4T/hDyNpLdLq6CKtQhy+oQQFSDTw6RGXG+?=
 =?us-ascii?Q?7sMGLRU5yLUVnwD8fzQLyCuDKq6xC6+Tur/04SD/xingM7J6SLyvQ3bv6h2y?=
 =?us-ascii?Q?fTUKgpAKeMTXdA/rZceMDGlYLxcmEdKMppMnAZUfsCNALVlWG6NttPc+wJfy?=
 =?us-ascii?Q?mCNhx5IApRTuXABhBlBXj+ufrzcddEXhB+NoZK8gE+M6OVBAl1AkVyZfCo7V?=
 =?us-ascii?Q?nV+mp8fObS6VtsUlgZofTHPazS4sOIqAHrmcbPQGxLk9BaxcbgHijLO/Fzkb?=
 =?us-ascii?Q?UGHlv7yRJWIprNQymUmngkxEO36DjenOsIk3wGVdUgCwdfAnAY/EXEHf3Hn2?=
 =?us-ascii?Q?FDG77n9XXI0omP1gDX8+kiUz95ntRT/hxa4cS/bCjAZAcE1dOkyVFdNpx67t?=
 =?us-ascii?Q?j+Z+VaVESPs5ew/+mJV8Whm2qQ73yOzZ53LS400wLuQFrQCJCrPv+9XrNNys?=
 =?us-ascii?Q?4PHOQp/l0qJDrPJ+f1t0m6orfWrhgyaw2A7kDK9/NgkfTmGIpenNbnGT8XXS?=
 =?us-ascii?Q?imEsbfpyTaLNwF3w8F1qi1ix0mWPqXNKy4WGPvxviJZuMvp/ImIIeaoTEEUM?=
 =?us-ascii?Q?6CxHsUriCM14YdqSJgV6cpt3jRjyv0jrmmozNEZjY8+8a4cTNOkoqg0NgeCI?=
 =?us-ascii?Q?bQVft/I1n0tl57F7gF/nWC5IZq+3Tmkdn2Mt46bLHbwvmu8jCslpL5s95uuo?=
 =?us-ascii?Q?2aXXqKapFx2Qd3chYZhGWXFPyKdfQnUJgX8WZiq3XZZCufzkUufThKHAXqYV?=
 =?us-ascii?Q?pOJ6GNHZz3SLWHv64IfkEZ27/bV1/4t5?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 14:12:23.0169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d153100-ed05-4966-34cc-08dd1f6dfe08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10236

Hi,

> On 18 Dec 2024, at 15:09, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> Hi Bertrand/Michal,
>=20
> On 18/12/2024 14:00, Bertrand Marquis wrote:
>> Hi Michal,
>>=20
>>> On 18 Dec 2024, at 14:56, Michal Orzel <michal.orzel@amd.com> wrote:
>>>=20
>>>=20
>>>=20
>>> On 18/12/2024 14:08, Bertrand Marquis wrote:
>>>>=20
>>>> Hi Ayan,
>>>>=20
>>>>> On 18 Dec 2024, at 12:34, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>>>=20
>>>>>=20
>>>>> On 18/12/2024 08:27, Bertrand Marquis wrote:
>>>>>> Hi Ayan,
>>>>> Hi Bertrand,
>>>>>>> On 12 Dec 2024, at 20:03, Ayan Kumar Halder <ayan.kumar.halder@amd.=
com> wrote:
>>>>>>>=20
>>>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>>>=20
>>>>>>> Add requirements for dom0less domain creation.
>>>>>>>=20
>>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>>> ---
>>> [...]
>>>=20
>>>>>>> +SPIs
>>>>>>> +----
>>>>>>> +
>>>>>>> +`XenSwdgn~spis~1`
>>>>>>> +
>>>>>>> +Description:
>>>>>>> +Xen shall allocate a specified number of shared peripheral interru=
pts for a
>>>>>>> +domain.
>>>>>> This is very ambiguous. What do you mean here ?
>>>>> Xen shall provide a way to specify the number of shared peripheral in=
terrupts for a domain via the device tree .
>>>> I am lost in how you achieve such a thing in the configuration.
>>>> All you can do is assigned an interrupt to a domain, but the sharing p=
art I do not see what Xen has to do with it.
>>> This req is about Arm's SPIs (Shared Peripheral Interrupts) and the max=
 number you can allocate to a domU.
>>> You can see more here:
>>> https://xenbits.xenproject.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Ddocs/mi=
sc/arm/device-tree/booting.txt;hb=3DHEAD#l172
>> Oh right, no idea how i came to shared interrupts instead of Arm SPIs.
>>=20
>> Then this is Arm specific and we need to have a bit more context/clear u=
p here (as comment or introduction).
>> And also this should have arm64 somewhere.
>=20
> ok, I can add Arm specific bits in the comments. Also, will put arm64 in =
the tag.
>=20
> Thinking again, this should be a product requirement as it explains the i=
nterface to Xen (in this case a dt property), Is this correct understanding=
 ?

Yes it should.

>=20
> Also, to your other comment :-
>=20
>>> I start to wonder if we should create interface requirements from the g=
uest PoV:
>=20
>>> A domain shall have a configurable number of vCPUs (1 to XX).
>=20
> This should be a product requirement as well. Correct ?

Correct.

Cheers
Bertrand

>=20
> - Ayan



