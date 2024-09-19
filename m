Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB197C991
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2024 14:54:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800762.1210757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srGf2-0008NP-Mg; Thu, 19 Sep 2024 12:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800762.1210757; Thu, 19 Sep 2024 12:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1srGf2-0008LW-Jd; Thu, 19 Sep 2024 12:53:28 +0000
Received: by outflank-mailman (input) for mailman id 800762;
 Thu, 19 Sep 2024 12:53:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lyjY=QR=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1srGf0-0008LM-VD
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2024 12:53:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20601.outbound.protection.outlook.com
 [2a01:111:f403:2614::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2881cb03-7686-11ef-99a2-01e77a169b0f;
 Thu, 19 Sep 2024 14:53:25 +0200 (CEST)
Received: from AS4P192CA0019.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::8)
 by AS8PR08MB8611.eurprd08.prod.outlook.com (2603:10a6:20b:563::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 12:53:18 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::69) by AS4P192CA0019.outlook.office365.com
 (2603:10a6:20b:5e1::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Thu, 19 Sep 2024 12:53:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 19 Sep 2024 12:53:16 +0000
Received: ("Tessian outbound 467a4accc038:v457");
 Thu, 19 Sep 2024 12:53:15 +0000
Received: from Lcaaa79d127ec.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 97536E81-DE60-4BCF-A264-DA396C088B38.1; 
 Thu, 19 Sep 2024 12:52:24 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lcaaa79d127ec.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Sep 2024 12:52:24 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB8330.eurprd08.prod.outlook.com (2603:10a6:150:85::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.7; Thu, 19 Sep
 2024 12:52:18 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 12:52:17 +0000
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
X-Inumbo-ID: 2881cb03-7686-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cXm77Pb0diokKKg9H6BGuuZTdTQ611WQEPik1VjP74ndpYZ0Fo1mp3Dt+Y4xtNsKjZZeMXQLI1YxTbDQyBGV3iJ3FGVvxFktA50rKXNz6T+6slPXNqoaFWSD5E9zR/6kFFC9SsA/i5UXxUxuaw0mc+fCGymrZIOfYRYmZJGbBrpKIOuHwn8JbRvPbc6/g+MoVWxaoY2zsOdYk0s/VjxmKp73rIvM0lH93ycBgwZdAECTL2/ce/FwzF4F/w1tAh1023ehvP+Qey54ZumvaLoFfJo1525e17IcSN0z/tCHHcQRphE1E6g4Py6leJb6g4nzFQy0+lR/i5ygFgwshmeo3w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b32//qwQ70c5v3kMPJuxHwMrpfzQ8QD7lNYNaIvqG4E=;
 b=eQp5dDZltpEO0ZLYsqNxS1Jl/IT2O79PAts11hZw4zq89CRxvfKO8JSkeklasUYUM7WOBHYjuVXtN4N+3Tu0JnlFIECt0BgoqTs//Wa0mo4VvnxpOpEqlwKanNVj9WlClgNo/fOntv6RAg3nHLqdgBb26epTmz+c+YBu2OxJnmKm6/ZY0a/DdsS/N6nKHvNcyuu87YLZjLwf4hseohYHQ4woAYYrsg08B/oFIXbQ+4KtzP2sHYpbcEDSjHGzbbeQ95IVILn7PL8dHQXuGoOxxx20v/nUZfAGtJhHPZOYc2Rsmd13EmOkuHcNKz4aXLmIEoDYoWNI49KLtDVLxnf8vw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b32//qwQ70c5v3kMPJuxHwMrpfzQ8QD7lNYNaIvqG4E=;
 b=aSyrqYCicSFKYm6qdAK8E9w5cgtHLi/mnRClL6jH0k9xIb4b6stXTorwMpabJIo0JsIqwmY0dYKIa48+bAEmnRLJVQOXbq+io/ohv9VvaqQev22FiAMFfBTHd6feWAfdjngDs5eUXiJWfWhF1Lts4+7wQuR5tKYi/I3go8wdzrQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ab817616cbf69b2e
X-TessianGatewayMetadata: FhzEsI00y/lu2Rpd4GKcODGXuWCaC8Y20+Z4Iom1qKXmNYee+1DP44njTjW/AqefNMULZjz7DWmGOOYWoWO8YyDRpwNSdTPpPw2D8B5DQT+hnMKxlDM6qzE1A3jMkVf1ByOgPlXBEvuhsyK9RF5B8mzEFmh60lMPzyFrreV5HRU=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiOUoKb0jeekFkFP4ClzEUxJ6jAvKpm3mdfpHpRJQQoGX+HJRhM/YHoYOXSBM3aCtwHqu2ovrXRaF5x5614VNnZKEUPotN0wm3d+F+05RT5SdlNQ47qDrm7beP7KakfpNDLOyg+Sjp9qduIer4ECk62bUvNc+iqgquHyZtWtPX40og0sX6d4yXrVKzbHYP7KiEHDefR6vVZxBcGkihsjZRu4I5vSDIVtjdVqLhAnehkVIjddMGZ0jYi0M4W9NLlhRvze0ujtKuQ7LHCHQDrpVIYv1dBe+TfTEWE7sVTGPAdxvMIO44ArUDjuF9u+ClxB7P6+eoR47+kopWbjKV/bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b32//qwQ70c5v3kMPJuxHwMrpfzQ8QD7lNYNaIvqG4E=;
 b=ZTil1pyQYz4NBvUUK+CxG7MHXLUaj+Kb8OeW/CZe1k+k4J8VdiHwNuAVO8XHiQr+f4hG20X5JcmfBi56gHLxrlxEwdY+Vka6t/KMSiQ+11mNWhbAXuIP/k6391NEWb3EB7iUloiKFM3lWMrqWHRVjhCOxVuwsr9T9t3w8HmisCya8JNJEUL5GcLpw+AqbQ+i9C5ULsdC/7CFVN9IDx0rrgrKt8GseHB8rvxsb4J6gQlSoYxBwlvXPBc3SZkr3kcUx5q6uncWfU6SjDJX7HKBqxfn53fZQJ3kA5+t24OhMQTzjYamI48jfiaeWCpAtXe+fFg5rQJ41IXMwUfsJeDCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b32//qwQ70c5v3kMPJuxHwMrpfzQ8QD7lNYNaIvqG4E=;
 b=aSyrqYCicSFKYm6qdAK8E9w5cgtHLi/mnRClL6jH0k9xIb4b6stXTorwMpabJIo0JsIqwmY0dYKIa48+bAEmnRLJVQOXbq+io/ohv9VvaqQev22FiAMFfBTHd6feWAfdjngDs5eUXiJWfWhF1Lts4+7wQuR5tKYi/I3go8wdzrQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
Thread-Topic: [PATCH v2 1/4] xen/arm: mpu: Introduce choice between MMU and
 MPU
Thread-Index: AQHbCfNyDmiIxIguw0SW7joLZtbx7LJfDHaAgAAFGoA=
Date: Thu, 19 Sep 2024 12:52:17 +0000
Message-ID: <8C89B819-42D6-4E3E-9E12-EED3960258DA@arm.com>
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-2-ayan.kumar.halder@amd.com>
 <e32674d8-4c3c-4eda-9300-35130e048a05@xen.org>
In-Reply-To: <e32674d8-4c3c-4eda-9300-35130e048a05@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB8330:EE_|AM3PEPF0000A791:EE_|AS8PR08MB8611:EE_
X-MS-Office365-Filtering-Correlation-Id: 034320ce-3e77-447b-2e67-08dcd8aa07e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?AL2h/fEdd11H6IlLVivKP8tR5T/G04Xv35/PC27VxRFmws7J+J2uxCJ9nIdu?=
 =?us-ascii?Q?KI9ztRyUlCQCrFnNPw8IqpZdnBV1caLKbDUk00S6e6fHhX7iVKZe5rZqd/iE?=
 =?us-ascii?Q?AMBarWkNytAcguMBQYt9mZ0Z1q1Ev25U25tMqyk1aCaOwulBEKBngPmh6AP0?=
 =?us-ascii?Q?g6T76ZqNHL18MyX4n7ibXeJ36NcavdE/syF55xrg9n0asYVermVwuHbUPO8/?=
 =?us-ascii?Q?RjobdGlWzEBVx5lBKvRWObt61wFL0Y6xEp9xSAL6Wh21xn07HwdRPdcxPn3J?=
 =?us-ascii?Q?wXgFNdEJMZ3bir6dugPssqWP7KWyk1UIzBArp4HzWIjXcrxTBMhhavVJjleP?=
 =?us-ascii?Q?qRWzwqhoPt9gE4fp4609ayCJbuGPkuCUiW3pboyc9/dyWg4zf/mQjWWTlmmz?=
 =?us-ascii?Q?2uqB59NLFd+6jVBBfEAVczo7pRP0Z/pCwQyTJyZeRZzyAz/VQ66/wfmFPwVo?=
 =?us-ascii?Q?RAFoem6yMpJzakFt4btJuHtRUhDAl+GIGUreHZYLdBaWuYAXQZ0NCh2rLzjL?=
 =?us-ascii?Q?pnEMHW86qwkHpvNNRuTdtT8oQl8NeZ1wpEw2hCGHAqjXF19Eemu6cHCNVE7V?=
 =?us-ascii?Q?eP5qZXF/wcdcJQ+eKqZ8Mgi+bv1k6aQgxxbZFNpL7Kv/1g9gIoR2mcQ04dhC?=
 =?us-ascii?Q?AU5UlwEmSLauIi59jW8kI/1J7hPrZlPuL5HVO453mViTdPRbooPvdTxS4Kb7?=
 =?us-ascii?Q?b2SFGw/JW31ws7EqzFQ9G75dIfxwDG9GnGNjdPRbbMRKbFfsJy4DNN0kQyGl?=
 =?us-ascii?Q?We/GyxKmEdAdO/Mf59YQrEpnlQVL+lzyMsEZXI0Hinkh1lpdzVu6JAO8zriX?=
 =?us-ascii?Q?ZB35PNQFKdu9cUl31GVy9o7W2c6rWuiesuXgR5+/A+x1q0+hcH5DE4TBU41i?=
 =?us-ascii?Q?FUXvYY99Tpl2sfNj2uMF7AkX3qoIPy0NMLo9yF3GJfgNqxRD2CqQ422uF7Kv?=
 =?us-ascii?Q?mEUfNl0uH5h/WEv7ZNlVj21rQxvBnAcXYxp4I5nDcLesAPa8l3t9GPEWChvj?=
 =?us-ascii?Q?OEQZ5g4awa8DKZr4K9dZGWFci3pKo+mdr4AjAtoVvrM6SkcifOqGV8/DiVhB?=
 =?us-ascii?Q?r7+dFXIPYtjQQNukgn8O+3Fbu8bAi90gtj5lsjRY6d905o/QLDJiyJOnG7Pn?=
 =?us-ascii?Q?9cX8VRYJM6hKTm/iQ7ZGAa3gFuIm4mPPwtWvvpkbsPsOmXvPNeQmNe6ccrLC?=
 =?us-ascii?Q?nIOGJVysKREPPNK5PLeqoTr5H9Kqpc9+CzHBM+y6nNzKnFH3CWuLcH1lrtGb?=
 =?us-ascii?Q?ehTd7haOac0Q2HTi4JhWR4HjLn3dE0KUuRBr2t21jB1/CtfVwmCPTfFPTi7u?=
 =?us-ascii?Q?6hPUbtxnKyalm6ST4jv4Gj+uN0OLU4uM151E/vD7FjQPXVyyE+onGJQeV2Wg?=
 =?us-ascii?Q?TKEXxvoRL9530IkTbBUbfzbotIZRwxbTS4gWaPjfYfbtQWrEPQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CE27A54DD33B7D48A4334DBEA0DB9D87@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8330
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6eab1b92-a86c-4bc7-4765-08dcd8a9e4ca
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LFq3I5yw/NdxgZSEzxlJ4+i4EGvwViI7zMQqDSZJ3lMXiWyJk24KCWYM59he?=
 =?us-ascii?Q?wWFTYltfmGT+9Pr1VeZ00QWVvnEpBLHKvgCXPfjBl3AMLBI3HprdaE6AZ6KR?=
 =?us-ascii?Q?h70c7cB/jEAuW7Ybv6HWqG5Gsb+F9FSRnUwzNAqpZnHNG9o1z/dUt+81qFIH?=
 =?us-ascii?Q?XTghw3cWSrZ6npbb5np0s8i9Hp3icrQTtgt08P/6AdyMf7yPwUNpD5IlaT5i?=
 =?us-ascii?Q?mzfK0i936jLkDmWQg4WHOaVQ+fvbOmXubisExFnOoZcjqpFPV+qBdYfI01qD?=
 =?us-ascii?Q?KVq3JI7iLmBY7VlWDvmlUAlSklj6V4TCabAd8AJXM2bIAY3VhvGxEhmnT2VE?=
 =?us-ascii?Q?3wUUElJNNENCX/8NeJ6qV1XLshUKBuSzOjxiPsNuWSZF/gTcOsAphWVmdZt4?=
 =?us-ascii?Q?XPbWKXlASgbOAJ7fv2m/8Dkc/BIVOHwNN298a3yoFor082uUD5RnfxW85sOl?=
 =?us-ascii?Q?t2nPeQV3RMUGmFkgTEO7LpzYMr4/f09tJ6TC2q5ZLYzfvo2G9ev96Bg6dvRA?=
 =?us-ascii?Q?TcYhnAr6e2/QhiOTGyWul7B1HMNPyVLAURE1kTQVhEhVn6wPJuY98KGzB39u?=
 =?us-ascii?Q?I8BXkrI+YtzfNKNn8pjuLmTXcj8FgSLjKntTm7DuvBGYHjyHOaptKJXdS9GP?=
 =?us-ascii?Q?qy1rSgRnI4sVABIBHLWycFDmnKnyemstygNwZS8Nq5tp2m9aLD3X94nbMsZH?=
 =?us-ascii?Q?3ddCyoz1uOJ9apahBMPORWoQ6Ujn4BuwmfW6ewIpdY/+hR9csBl5fOXhrZAw?=
 =?us-ascii?Q?jLAL1zBcpSuaIdX2p6wYh2DEC7dzjtN3XXAeBBvbvkkcndGmEXi76t2Sf9AN?=
 =?us-ascii?Q?hgv383ldy27l6ozUaKjybC8ge7ZzkSXe7PMrfCOQR9IGVxhb0Eynw+QEJTDw?=
 =?us-ascii?Q?geNViHEuP3Qb9DrNkuRKXD7HfZYbmN8jq3h3Sa/b8v4cFXkD5gWnR8j9vIla?=
 =?us-ascii?Q?VAHpXu1GZcZNpF3zrZj313/gawksx5S49ZwHQQIVW+QdPRw2WUuBalWb9uY6?=
 =?us-ascii?Q?TOKyRb1wSuMY7CQQ6hKEFIDxBZgs7AJmErZHjyTC5qIPAG5zARQSHLzHwOz+?=
 =?us-ascii?Q?ZI8PGRHymE7XT8hZiExJ0pyRS8TAMufrtlpQWLU7A/NvcdxWNXAI8jjP4k+o?=
 =?us-ascii?Q?zGlynV6ifstqCYmRgUNqJ7x+ry2G/F3uyg1yvgTxV+RbDrrE2Z2wa09z9TCd?=
 =?us-ascii?Q?3UMShgtbrU7sISSAkPmdlUr5U+Eh92h/oBVkwNVtzrvnznwhcr74z5PLwvxA?=
 =?us-ascii?Q?6Zp53TqtNC3Y9TDtSUkjpwRYdOw308sYlMVi1CgGP44nFXdEfqWEVXSjSNx/?=
 =?us-ascii?Q?+Dojg62+vVmrJyL8ieODA3InHKIdESFJHgMsClhkPCY1izfln68RsWQkv/y5?=
 =?us-ascii?Q?QmKwCwSPFJwEiCBvVkp5+yx4RC3TYBcPv5z+30g8WrxMLvaN/J3TnUbFF5Q5?=
 =?us-ascii?Q?XqO+USsbY0jDh7+sPB60wyvzUkXmrtcj?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 12:53:16.7708
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 034320ce-3e77-447b-2e67-08dcd8aa07e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8611

Hi,

> On 19 Sep 2024, at 14:33, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Ayan,
>=20
> On 18/09/2024 19:50, Ayan Kumar Halder wrote:
>> There are features in the forthcoming patches which are dependent on
>> MPU. For eg fixed start address.
>> Also, some of the Xen features (eg STATIC_MEMORY) will be selected
>> by the MPU configuration.
>> Thus, this patch introduces a choice between MMU and MPU for the type
>> of memory management system. By default, MMU is selected.
>> MPU is now gated by UNSUPPORTED.
>> Updated SUPPORT.md to state that the support for MPU is experimental.
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>> Changes from :-
>> v1 - 1. Reworded the help messages.
>> 2. Updated Support.md.
>>  SUPPORT.md                     |  1 +
>>  xen/arch/arm/Kconfig           | 16 +++++++++++++++-
>>  xen/arch/arm/platforms/Kconfig |  2 +-
>>  3 files changed, 17 insertions(+), 2 deletions(-)
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index 23dd7e6424..3f6d788a43 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -40,6 +40,7 @@ supported in this document.
>>        Status, Xen in AArch64 mode: Supported
>>      Status, Xen in AArch32 mode: Tech Preview
>> +    Status, Xen with MPU: Experimental
>>      Status, Cortex A57 r0p0-r1p1: Supported, not security supported
>>      Status, Cortex A77 r0p0-r1p0: Supported, not security supported
>>  diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 323c967361..e881f5ba57 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -58,10 +58,24 @@ config PADDR_BITS
>>   default 40 if ARM_PA_BITS_40
>>   default 48 if ARM_64
>>  +choice
>> + prompt "Memory management system"
>> + default MMU if ARM
>> + help
>> +   User can choose between the different forms of memory management sys=
tem.
>> +
>>  config MMU
>> - def_bool y
>> + bool "MMU"
>>   select HAS_PMAP
>>   select HAS_VMAP
>> + help
>> +   Select it if you plan to run Xen on A-profile Armv7+
>> +
>> +config MPU
>> + bool "MPU" if UNSUPPORTED
>> + help
>> +   Memory protection unit is supported on some Armv8-R systems (UNSUPPO=
RTED).
>=20
> I am a bit confused with this statement. Does this mean that not all Armv=
8-R supports MPU? Or are you trying to say that not all of them support EL2=
?
>=20
> If the former, we probably want to check pretty early during boot that th=
e an MPU is present *and* we have enough regions.

On Armv8-R if there is EL2 then there is an MPU at EL2.
Only EL1 might have an MMU with the MPU (but i do not think it can have onl=
y an MMU).

Cheers
Bertrand

>=20
>> +endchoice
>>    source "arch/Kconfig"
>>  diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kc=
onfig
>> index 76f7e76b1b..02322c259c 100644
>> --- a/xen/arch/arm/platforms/Kconfig
>> +++ b/xen/arch/arm/platforms/Kconfig
>> @@ -1,5 +1,5 @@
>>  choice
>> - prompt "Platform Support"
>> + prompt "Platform Support" if MMU
>>   default ALL_PLAT
>>   help
>>   Choose which hardware platform to enable in Xen.
>=20
> Cheers,
>=20
> --=20
> Julien Grall



