Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688F9E1766
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:27:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847583.1262680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPB2-00087z-Ij; Tue, 03 Dec 2024 09:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847583.1262680; Tue, 03 Dec 2024 09:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIPB2-00085m-G1; Tue, 03 Dec 2024 09:26:40 +0000
Received: by outflank-mailman (input) for mailman id 847583;
 Tue, 03 Dec 2024 09:26:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iaGl=S4=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tIPB1-00084R-B4
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:26:39 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1ec6268-b158-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 10:26:37 +0100 (CET)
Received: from AS4P190CA0054.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::18)
 by VE1PR08MB5677.eurprd08.prod.outlook.com (2603:10a6:800:1ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:26:32 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:656:cafe::35) by AS4P190CA0054.outlook.office365.com
 (2603:10a6:20b:656::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Tue,
 3 Dec 2024 09:26:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Tue, 3 Dec 2024 09:26:31 +0000
Received: ("Tessian outbound 3b1f0cd68b0e:v514");
 Tue, 03 Dec 2024 09:26:31 +0000
Received: from Le8669a32a9cf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6AF550CE-4548-485C-ADC8-A7B9668559D5.1; 
 Tue, 03 Dec 2024 09:26:25 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le8669a32a9cf.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 03 Dec 2024 09:26:25 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DU2PR08MB10013.eurprd08.prod.outlook.com (2603:10a6:10:49c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:26:22 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 09:26:22 +0000
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
X-Inumbo-ID: b1ec6268-b158-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D+c0cGlabbZIMaFTKhsVoQTjX4hcHss9LvPvkvMUiHANpvzf50xRw/IBBIkQYAbqNReCB3/JZKk/8g+otUosPNIaGHoyfENXmMrKATRtv9VtaCJHw24W4m4W/cavZjToyWv3OwrEyIOl4AohH8Jvr5otCdR0JwEH1sK5w0n0TvG6LCmLeozspkJ7dvRMoJvHi0XbMnLwes1pwAmFyDCdQtOWiex2lff1EbKQ0cJHd+W01p9L1xOlLmM1f2p4rrmev+3Fs1tYv0bcqtTGR2LJJCq6YucXLYjTX3DY8rJe7F/U0TdHA7+wYEgOGLToFJkQKqdsn2XeWlg2h4FxYA1CGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Y6GPGf96UhUOpaZ7qfGW1EE/OhDxl3YJTjTOPLRSH4=;
 b=krp71+rRRI/AuvwFAdKA+NfYw9K+WsbVgQ4QHX9l2aQSMayO5mV91MC2m5cvQ3aZzkUjRIi5mupLkSN7vcVq363OxBbUfKjShYxXpPQ2wGqq+hvkLasmxfTwgXTFmHBonw5h2USTM/WaCnSZd+trZAcm/ITiugCOF8vlS3eWzcuPBfMbwWG7+rV/tpAIgSzOjz056pXoq5WXSO5nCrJ2dVGt6WFwIwmUjNsD7g8nsgHdpBv0p/JPzmliLcRWfUddWGdCwbkJ27YHEQs3os1Cm7lfnZw9NERA2vKeXpBV5SpGfhJRp7W/uEdtP8cBIHlPNmmMN0sHlezN6omeh3Q+8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y6GPGf96UhUOpaZ7qfGW1EE/OhDxl3YJTjTOPLRSH4=;
 b=kLkBlKh356dvWTF/TRbwz1TJzwjtYxHBf909c6s5xrg64GhpGL387rRqcomDYaGTFcWWqHMRl4EwEKWOe238J8ATQ1lZ0S5UKv0zJ++/+Kh0TwYhS4H0K1qaPIL5D3iUt3dX5xdJ/W/osuioNf6jWgB67Zn6L02at13axzLexxI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f67df11adde3981c
X-TessianGatewayMetadata: oI/6vbCgnFPHCvtyK9cnZJD8BWq01U5U6Y81sQzUbpNSYeBxeQpsFVas93u9Btlo+HmVP0l4OF7iYbKY0gPWOIXi47FdPoEhYl9FfRYMQl4pzo7HcjzUs18OCDgVhM5a0q/EhWQj/JVPQDl1tQH11CmMI50415DQ8ViTLnbgiEg=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tKaMLB1oLm9v3TodGjdQbIJp2jdT6GpieAapBgBzWTAP98nSV37sICrah8JwgNr5Oz/faA9fgWE9YXWiyrFxm9TN31mu2ZExl9JBql+A5s84Db666R5DJUxE4CIyQUiuZX7A9+6dazGb8ArZeN3PHoEQ5auWVF0KukzH9WfnJxRYyOvV3xAC9dlnABP4Bk1PYKOp7KLNLEs99sRbAer/TC9dcUChthdY8njzammZaNExPlPiHgwtXoKzNPeb7MMMsuotkYv+J1XPCdeHoPY9QG0nuYqi1RUxfAzFhfrSnCsmL/mFXFYoHI47918QCljSBhyEGGB9HPRSal5TMulTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Y6GPGf96UhUOpaZ7qfGW1EE/OhDxl3YJTjTOPLRSH4=;
 b=hHeEFQEmlSdhiKnBvYBD78hiB4AcxwPK1YizuGqINuJPhMh8RfjKjm5qv52RMrfq2upDLy37iIlkyJ39tIVtF1F2qX1Bc7jarI3GNPg9jeGSvO5BF/OVeIYDqsCvnmQDC2nGbpr3jzAOPB2R3bbSLhYWOblQwhuR1A3rH+Z3mose4NYRybLdyzX+df/5HPdp+wxW2mJ/GGorjkPfmCd1Rl+ki0vA9P0uGGLrHvBXQL957GAZUzcrPCPb5Bp3/q9RXzW9v5/actFaxZbf47SU5U2ZLGBZQ0LbJPBYi13IqcERiwcShR8zfOvKbHNyknCWteqpF9n1JkaOrQ5i5HlIFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y6GPGf96UhUOpaZ7qfGW1EE/OhDxl3YJTjTOPLRSH4=;
 b=kLkBlKh356dvWTF/TRbwz1TJzwjtYxHBf909c6s5xrg64GhpGL387rRqcomDYaGTFcWWqHMRl4EwEKWOe238J8ATQ1lZ0S5UKv0zJ++/+Kh0TwYhS4H0K1qaPIL5D3iUt3dX5xdJ/W/osuioNf6jWgB67Zn6L02at13axzLexxI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [PATCH] bootfdt: Add missing trailing commas in
 BOOTINFO_{ACPI,SHMEM}_INIT
Thread-Topic: [PATCH] bootfdt: Add missing trailing commas in
 BOOTINFO_{ACPI,SHMEM}_INIT
Thread-Index: AQHbRWTiS8+/Ezdwzk6UJiAaaYX4BrLUP+cA
Date: Tue, 3 Dec 2024 09:26:22 +0000
Message-ID: <F7778598-B320-461B-BC06-B091B04D8C80@arm.com>
References: <20241203092214.276453-1-michal.orzel@amd.com>
In-Reply-To: <20241203092214.276453-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DU2PR08MB10013:EE_|AMS1EPF0000004D:EE_|VE1PR08MB5677:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b34259-4a15-418a-1f7e-08dd137c930c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?lSa1LgAYuES7KdhBDovkzKggg/NZTVe5zMkiKwOCoEgLUlR6KNslztsaWEGJ?=
 =?us-ascii?Q?Ly0IYcxfokeHJYqRAQAqLcgg1PsKEgs+Vdv+eenLVoqvXxR5QehXaw9z9vAz?=
 =?us-ascii?Q?iYPEv9vZW07FOekS2ajBZc/pQ+eFZH3u8k5uI8J0s4Iigi6cnNXf+WPyRSZr?=
 =?us-ascii?Q?zqhw1tirO7mZjHtjII+x7sFu3oObsn73ZEj+cQ3LqtygeuD6dtpkLY1cJvoh?=
 =?us-ascii?Q?1WSL55NC4SYWXIBP9f9+M6TuQvu/R8/e7a4aAmzSL5ES/p7SXWpngGBMntIC?=
 =?us-ascii?Q?GAefXkpyhJqs/mrnI6dOjgYUK5tGhJo0HwkWr15oD/umNNXofbxoGNfQ8EXK?=
 =?us-ascii?Q?fBom97/tkQXHQ9SYy99kvFBkuN/dDZvbo/iMbm+PqrYw4GcVK4kl7nsqAA/Z?=
 =?us-ascii?Q?jJeOwhd8z0sCvi0JJPUirYkaRAUfvA8lGXkDNCoeiaE4dTUwCEbEJV+3eBxi?=
 =?us-ascii?Q?/XlO1C8bwpZlHf6sQglZbUmxBvFVJE8B+vkUxtiUq4JxNn4+9jcfQTwQ1+kA?=
 =?us-ascii?Q?r1lOGAwMklPtCVVISmtSF+D9OQG9toS4hvjKbljEIl3HPes6bHFLXpzyODPk?=
 =?us-ascii?Q?fuvCVwvcpH9PIGzFSk4EOcVqRJCkiXTfJZJPqvfx8PVRWRpuEFXajIP5EsGr?=
 =?us-ascii?Q?g1l2B/3tzG5fGXpQoHQLOxLM6hfK3PD2HEhfLuiTYZPHvGPK6P/MKVr2zoOn?=
 =?us-ascii?Q?zRRJUMN1o+gju7GbW0PTFcLUQQa3bPyWkGBV9jpyRDhF8eqG4S3kobdQgVzW?=
 =?us-ascii?Q?Z+4BovfF0295Cnpew50gUo0zfEHysOfGn0ANoVBIMgTiaavF4J+l40cqJALT?=
 =?us-ascii?Q?EuIKALpEACCOcdUgH0CUHOo8lY05ztHFLPJvYv7npoiQMyZAnzJwWN0oFybg?=
 =?us-ascii?Q?ltZlneWeg3ojgqGvzKs054SWoinEnrWY9BwhtOXrhIgg98nEGrDcqqHb9477?=
 =?us-ascii?Q?las2p9hfCFLRVLSPWTkREe2oFKdDmZdc4qhTabOqhF/5ffxkIlWF8pDBeC0s?=
 =?us-ascii?Q?ritfpC825XyYwyuFaNkGDT4zRenTkE8fjwkqrFFWEWCpLnHAybupXCnLOVE0?=
 =?us-ascii?Q?wdNEP6WlDy/nyJeXUCLyAJQkTnmigiYgzrm0coQIaGp/Si6GqQ2G8plM3kOQ?=
 =?us-ascii?Q?nTDTuAt7rvMfW73UjXDQzBOboCoVtN4Ow4e4SDp+rnH391m3lzjuohvVXFDX?=
 =?us-ascii?Q?w7a6Og85atwJtsf5rdQoZUvbj/Zlo7fQaYA/4g+MgYeGFCVVI5hnZhvQmz2i?=
 =?us-ascii?Q?g+YDQunCAbKCq3+canzQnWfTRByoJtDD68tnbM6KGu7Cah9dh5aYPfjCSd62?=
 =?us-ascii?Q?UihgsJeu6hhOXS4WMWtDgzMIG+lleXsysmRD1pgOCYb1w6thM36QrndAqGqE?=
 =?us-ascii?Q?TyLzM0HK8uUfGiJr9HWWF2CE+0pBKkDPHqKA8gENZ7jSDXLDbg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <57E10F0A1F5D1E46B9E9C64D8D2722F3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10013
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ed0f217-2d02-4cbe-defd-08dd137c8d54
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xMQTwibs6PIB07ZlTeOfrJ67Ra+gP+TqwrDhstNOmxJowD11KgEsGhlF7Ssu?=
 =?us-ascii?Q?/VFGPyLmT1Egq6BHwIUsUG7k2eZPCs7w4dMYyato4+J1RDVFlnrnkv1eE7uY?=
 =?us-ascii?Q?ZpsJp+yytj4loBZavjIJoMJaJSUvsfV/1Ilh4ig+C2u68YTs/SrfJ3eHco+p?=
 =?us-ascii?Q?sIy55OASIO/8B0fPKP2Ewja8slQVC+5DHvin5ZwAQsKxdQ9JODxuOK3HFJuo?=
 =?us-ascii?Q?+h3H9SUYZEWJ/Kq17s7RoL2OyGdDkTKD5ORdbk/gkvEtHjIZMPAYaUznxEOS?=
 =?us-ascii?Q?OWYgrqhaDIoc+lUgzSDy57kTEK8Hv4T1NEJixvpRSc10l4n/napjbUTXz/lb?=
 =?us-ascii?Q?UsJPpsPhlOgGtu5+qOa1NkoU3BZFgx8xMLkRCq7+zXRg6AqqXwmMguzo9eyj?=
 =?us-ascii?Q?69gscNuqSR+CBAt/U/GjycUHGpHb5zJWdNYMQrsOe5QmG0IPe9fi3zNy2JkN?=
 =?us-ascii?Q?c1igbnEQRDGdBUzKBjg0pRLpbN6qM8i0ANynSDTcaQihhAqyKcBkmEo3MMVb?=
 =?us-ascii?Q?SLvEv1szb8jzVdyb9P7pomX69YaVhBZIQmftgWXNWxhinRMHJlkZkbGozi6Y?=
 =?us-ascii?Q?b6MycTBPFVwtq4PBSMKs4WJgiq2cicGEiUlcd2JeEx7g0bET+Z2xpZWBltNz?=
 =?us-ascii?Q?SUeDK6akVNbfVlyDc/0cE0RL+4XvS8S4KfFSqZJKK9xMpWTkJ1DybA4wYD3p?=
 =?us-ascii?Q?xegNROlz6p3JNPaAKWmlMO7uf2tuDxeu6KicwCIlCqb7RG0+h529jLrnNLUq?=
 =?us-ascii?Q?TG2CH98nesTWk+dJ14kjdHNQwhSplG5Ujicbp4Z6gWBdpxJF+6SsNXL5ZHGI?=
 =?us-ascii?Q?0b+h8PtZVn457YyFAx8hxlM6ftFkG/P6qUn3e1Nj0RUJlfCBylJyw4XNG+NB?=
 =?us-ascii?Q?NVjfbbrhB2Xd1OM6OUeow7CIriwfl8uZSitSTaiWpAa/S2kBR//bujpOJDRj?=
 =?us-ascii?Q?NjKAzm6weheXteV2Jq2txVAA14Xw7337bqJiPkwckzOSLq6gU47gM17vjnn1?=
 =?us-ascii?Q?3l8wxBQ2LhjC1cga332e6yIEkBjyRIhGeMlxMl3BLJl4UI9yArFtCl8rbEPm?=
 =?us-ascii?Q?Spv4y+YKFpdBBxbBiaegVQeiRYoYfbFw+J8D/DD9hNfJfIWdu0Qy4YTLWX6z?=
 =?us-ascii?Q?wFp7uqV86wS38egyohdW3H0AzCnIXB/8Th3IDqhJTr5OI233KqAUjHRx+hl0?=
 =?us-ascii?Q?vzLkFZ35O6c1Uggh30GT360EJvnFbE6Cxa1XanxRTETka2mSaPPCozNeZtb5?=
 =?us-ascii?Q?MPH1gycZjW/a9fZrh5nlfufuOeVPsHkAFTGslD1fnytmuvoAwxw5JjOVzyma?=
 =?us-ascii?Q?AMnEdnt6i8rpiE5zSNS0iamkAOp4cWX+8MkKFyM3zXztuh4akGIfhHVUkGEy?=
 =?us-ascii?Q?GXKpyE1WCE7Ikm/mhiCtBvAYl9VDP+Ra8VmEq6Fqazmbi80OIf3FPdGzyJdZ?=
 =?us-ascii?Q?Zt+bY1vtj9WMfLyZBfjIYaL8e7FN+4yO?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:26:31.9927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b34259-4a15-418a-1f7e-08dd137c930c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5677



> On 3 Dec 2024, at 09:22, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Commit a14593e3995a extended BOOTINFO_{ACPI,SHMEM}_INIT initializers
> list with a new 'type' member but forgot to add trailing commas (they
> were present before). This results in a build failure when building
> with CONFIG_ACPI=3Dy and CONFIG_STATIC_SHM=3Dy:
> ./include/xen/bootfdt.h:155:5: error: request for member 'shmem' in somet=
hing not a structure or union
>  155 |     .shmem.common.max_banks =3D NR_SHMEM_BANKS,       \
>      |     ^
> ./include/xen/bootfdt.h:168:5: note: in expansion of macro 'BOOTINFO_SHME=
M_INIT'
>  168 |     BOOTINFO_SHMEM_INIT                             \
>      |     ^~~~~~~~~~~~~~~~~~~
> common/device-tree/bootinfo.c:22:39: note: in expansion of macro 'BOOTINF=
O_INIT'
>   22 | struct bootinfo __initdata bootinfo =3D BOOTINFO_INIT;
>=20
> Fixes: a14593e3995a ("xen/device-tree: Allow region overlapping with /mem=
reserve/ ranges")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---

Thanks Michal, I realise our internal CI is not testing a configuration wit=
h CONFIG_ACPI=3Dy and
CONFIG_STATIC_SHM=3Dy, this is why I missed it.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com <mailto:luca.fancellu@arm=
.com>>

Cheers,
Luca




