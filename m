Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006D88AEAC4
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710842.1110372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHvJ-0005d0-Ak; Tue, 23 Apr 2024 15:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710842.1110372; Tue, 23 Apr 2024 15:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHvJ-0005aZ-74; Tue, 23 Apr 2024 15:19:09 +0000
Received: by outflank-mailman (input) for mailman id 710842;
 Tue, 23 Apr 2024 15:19:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agql=L4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rzHvI-0005aT-0S
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:19:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0821a3b-0184-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 17:19:06 +0200 (CEST)
Received: from AM6P195CA0051.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::28)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 15:18:58 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:209:87:cafe::8e) by AM6P195CA0051.outlook.office365.com
 (2603:10a6:209:87::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.33 via Frontend
 Transport; Tue, 23 Apr 2024 15:18:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Tue, 23 Apr 2024 15:18:55 +0000
Received: ("Tessian outbound e14047529286:v313");
 Tue, 23 Apr 2024 15:18:54 +0000
Received: from 82d9686a7326.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 858C246B-6862-4A14-AB79-2279D8C9BCF0.1; 
 Tue, 23 Apr 2024 15:18:47 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82d9686a7326.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Apr 2024 15:18:47 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9726.eurprd08.prod.outlook.com (2603:10a6:10:446::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Tue, 23 Apr
 2024 15:18:45 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 15:18:45 +0000
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
X-Inumbo-ID: d0821a3b-0184-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EsXzfigCCaLtMOrC31dcgH0ojHyUm4xLUi6W/LEqfgZHsptf3cwZ7P8PKChacEr4Wnl7xeRuR9i8R/X31WVOy2wqGbEROAHANMLjb4AYZbGJkABC0xyv11lOrQN4OkQwi4dOlGPKNzF/BaDXcBkQuRBjB55StkajnPreaO6zcsUKCTNhH0/LgiLF8MyxqBMk4u4Njihp9kj2GsRoYrwS1TKNfgKdzRJkdtjKKCaSrJWGrQR1Cqq0Ok0Um/P8BkePMjWdaeNOhZ5YJihKcnFLtdGATJBH2M9IhMPJBrAECUlHdOjf90/5hF2nW/HlisDFrrsDxEqibo2N58O1oigjEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjydwI3EtAJBIiT7QQhDZsOClx81GsqRlrzfKou/s7c=;
 b=BCXICMkmJGcD+sQd96f7Z40Bbl6dcW9DRXupXR9MVeO1F2IkKhyxyN+D3A+NuIKJrtPrkj9xM9N6he9hm3Q36pfHd4Lvs5h355/I1Rd4EWaV3/abuP36+oj2kX5gN4pMBLRFvGQMMH3NLr6asCwWc9b6MNwPrROIzbL9PDd44DjmosutIC0bUf02qfDLlreuRhFXVS+tITqir4JJ+zG05qa5KjSGMMTqXs+e7KOfkT7j3GiYE4eQO9dlhzerYtS5k6gWbBYSMWCyoU3JhvwhkTJEM37NDOiNo25ICgyfRHZ2+iUGzgfRCnaS1GdbTrSHk1/WZecMcj6E/Q95D8ZL5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjydwI3EtAJBIiT7QQhDZsOClx81GsqRlrzfKou/s7c=;
 b=EzHTeFcUdipF3q0v0Cqa7JRkDjb9K3vDRL+bks/cpFd59XX19rHuarMzGfDZBMQV+mXiMDCkfFdYDEuIVmfsMntrciW3SU73TG8v+CW2JdukklZ8fwo5d5gq60v2ruXk3Qyp5eMrba9qrDKyUDvDvcLdLhxwCeJtelGLXVY8Ad0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e95ebf81237b16a1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c284nvR/RGRnnX4JRTFaJjwa2TNOkeb0Q9CsWjk3CxpYzgRXrns9xpjhIWws6xlBsTcrKTbxCesQG47y3SCHYIYAfnphNHxZjlDW+0W6dxznKV40eHIpk+Ss5xayjgbgbwDeobWm/F283UVtNRlAeWEgB/LcstTpi1f3lmZrVOFv0KE3jQo6KSBk59YGsDJTbCvm4s+b5kvsVU0WJLxHBeqf5MxAQSrQHffMxQcK1B8eLJ1iLaBFblU+ZRwWHlz0uuv2lOYHpjCgQz8UzQUJcDEw7Gpfwg53Mw5/uAXiUzUIeTZJNpRumltp3f7hi/KF+fRtcKz3fKGmH5ZyvR9zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjydwI3EtAJBIiT7QQhDZsOClx81GsqRlrzfKou/s7c=;
 b=Qu6zmaA4xtCbWJhjdq4yuR7HJJN+SeRYFJMlBXnKaIso1BKa98yrpkCUqU8eFAgQHQ6lJDu7rcaBmeMz+7Nz+jqjHujrqxBrvYsvilhH7nPkzzJrbH/zBHVh9ERTEvaVTWJiatxNWKPD4P6P1pGmz2k0HhJaI0zx9x/g37g+ZQ/T7ZbNxvQHm2jDxKv8wjhDI5geAS91b4ZEr94JvoSUmfG/7+HTWLxB/O9BIFc9EckdR3Cm8hqOzOVSe8+LfXsPqap/5vMJfS87GyGc+qFOUd/+2AMKRxSEebRgIon07I3rNEJyaqBjlsTZ5qaQflAUEuqywfm9zqI7mKQPq2eSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjydwI3EtAJBIiT7QQhDZsOClx81GsqRlrzfKou/s7c=;
 b=EzHTeFcUdipF3q0v0Cqa7JRkDjb9K3vDRL+bks/cpFd59XX19rHuarMzGfDZBMQV+mXiMDCkfFdYDEuIVmfsMntrciW3SU73TG8v+CW2JdukklZ8fwo5d5gq60v2ruXk3Qyp5eMrba9qrDKyUDvDvcLdLhxwCeJtelGLXVY8Ad0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v2 5/5] xen/arm: ffa: support notification
Thread-Index: AQHalIgAe9tsdsjGFU69yRnUHUkm77F0KqiAgAHNdQCAAAExAIAAAKaA
Date: Tue, 23 Apr 2024 15:18:45 +0000
Message-ID: <11727110-3F3F-4DB6-A427-4CB77092928A@arm.com>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-6-jens.wiklander@linaro.org>
 <e2ffe445-9355-45c9-bbfb-669455df4ea0@xen.org>
 <7B792228-17C6-412C-B0E6-950433FE6C11@arm.com>
 <bf1b49aa-1651-4913-89c3-f523a91ae39b@xen.org>
In-Reply-To: <bf1b49aa-1651-4913-89c3-f523a91ae39b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9726:EE_|AMS1EPF00000047:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c5fc5a-c425-490a-9a06-08dc63a8b0bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?+kppy4ILQCPxKZT6TZ1rkbCVxJev2AAQX1F7xo21gjTqsi+ltYjHQCRg3Efg?=
 =?us-ascii?Q?yyBs51xvo6NCu7Z22g3XS7vRcXLUBznH9PoUrDawKtGACBEW8wcs0oomwWuQ?=
 =?us-ascii?Q?0xzybiaACIKAHXvThx9mRKRnpHhJMPnIANck+Drty0V8SfRBmFUWnsuM/ALT?=
 =?us-ascii?Q?t7jf6FXZgVKTDRoOPAPFSjMzZlt9o8Y2Ny131JFxhCvo65jtdtfaIpux7ZEI?=
 =?us-ascii?Q?EmJK2ZxL2OtMWKeJamihRfPmY6gpvfJNva7ffGizttUDC4hQuuxPAcJEbCqF?=
 =?us-ascii?Q?Qmw47isMod5Jywd3v0KpZt0HASO/K3US4UepDGY9E5vStnT0TAJbM1aF2qKb?=
 =?us-ascii?Q?gp8Oix7oC2acWrdJPn2WPr2pGHf5t6GC4drmVbp3/2Ic90OS0nVMYpdktVOc?=
 =?us-ascii?Q?pOJ4OYW5bt9JWTb/+qiYXNZvSBYpyZv6AcYaFuxSHYYINAQ1+25If2hmzQIA?=
 =?us-ascii?Q?BIgtQzGWP5uSk9ZWpmBYakvZEQHKE1dimrLmHJWlgWtHBAKTAal7xr56zlTW?=
 =?us-ascii?Q?Bw4RFqmxIx89E7quA+O5IXww5K0GD8RNXULro+NiuQCUubiM1bx/UNOKXm9x?=
 =?us-ascii?Q?WSJxehkxa+SWEAB/MkqqKH/HIkOAo0xLgWG8uahudu3z3mQIzMlORWWTt1F2?=
 =?us-ascii?Q?NjGbS3BtJJeqTcYRbQVLivVkwgbLsbCzdI1ntflruYyS1gYQ1UylTZ9m0HeN?=
 =?us-ascii?Q?BFytaZ8a/cjaOKZUrfKP7kYDLa2NVjUIWI969Uwbxq5fSYnFyfEPmZmUbTq8?=
 =?us-ascii?Q?aF2Zn0FNHDPagNy4D+2QKYt31aY9LCF/yrrbSs17G/CecI6bachpoeTM1gvL?=
 =?us-ascii?Q?EwxKOZ6AFGOmn5piAonfO55eVmAzCDFx04WFTEHxyOfPBU22xyRdjUpigJ6H?=
 =?us-ascii?Q?fy2+36UfVbZr0zv1B13gud0PD/4on1s+Pk3azY421QyfFeLtJCP4riltcVru?=
 =?us-ascii?Q?K4iP+2rKs/dttNHx5l07mrUbNzhDo1joIeegi2tJ9nwmXNPnTRLwBZ60pwoX?=
 =?us-ascii?Q?olkUn8SkjY6XdJ9L8/ykqbnLc7Kif0qzP2DiwSNlCudASKdMwk7wlm5IM8Gj?=
 =?us-ascii?Q?gzgw5YuW6IEvHfmmf9YYfh/IvzHUd6CArinCylTT1QlGTDT4MqrndY68H5vO?=
 =?us-ascii?Q?Deyi9AFEBfeCUhni0uMXDSOrMulVbuke4Wk+kb5Eltznz7xBC5/ePLEXUR6A?=
 =?us-ascii?Q?ERNTVkiDWVLDimg5/tBgoOnCJNyfX/7nANkL+DjZYwFbQsUGoPf21LcttPxD?=
 =?us-ascii?Q?7BfRoN9KdKPchg1JJatUudlySBYejVx3DfgyHf4wMyaw1q4OBWJqbcReN1Jz?=
 =?us-ascii?Q?UaXjsSEuheABveYHxA/AaR8tc7pmMda5O0OljtMG/zlpUg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C5AEF0AE06B0D34C8F641F6EB8747DC2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9726
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94fcc311-89ce-4575-c5b7-08dc63a8ab05
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Yh692Ttke70EdeBQHvOFGw7FAG1iukxC3Lhk7I6tkSCJfGh5cupmEEjgD57Z?=
 =?us-ascii?Q?SlcfWiCmPciMnryQxQyxd3BQjiTtNMrwnRg/i7CV1BfgGiSxcKaHJ7jnzLou?=
 =?us-ascii?Q?GVwzG3yd4ql8ITjSeEg7XEZbt9iDqVZfpQ6URzt+dUgAxDYna/z0ahb09g0S?=
 =?us-ascii?Q?eDalDm0Pm0AJr92e1DAW8zB329iCJuBLdI6h6r7P1keQOBY0uozezMioVeue?=
 =?us-ascii?Q?UyuFM3zuyMGjfqeJhXQUyNBwOH0zenduvTE3MgLqDX246e3XLQ2HRQdNw0Fq?=
 =?us-ascii?Q?1JnSrlJDHGF7+Xu9PA3AlMq8ITAC+KORCfYKUIpkaiGWs/prKLN1j29yA8SV?=
 =?us-ascii?Q?bMO9AZ7AYNU/3CPI5yxEzuBowC8Bm5OaeEO59+7z9ceOgjQzdQi+mWfVQcPm?=
 =?us-ascii?Q?WPy+9B/l7xQecyF3Q+/UQ8KKq4lFF4H1AZl9RzylBGP0dmST0x5nnN8IeLrR?=
 =?us-ascii?Q?GJ8As3vmfZMNTzHbKVtGeDc+GLv+3xfn+EjPuIvMWKHVyBDu26WzTqTWzrrO?=
 =?us-ascii?Q?R4o2DSx+SAjeO8aSf/Ibu6PPv/AL13KaRfj+un1c4Y+WGu07XSuMpaIJKsGj?=
 =?us-ascii?Q?mGcZjFOujz4HnWlPdOh1Jp9vA/AGeNiqbpISUma2Up1Lk47U1pBJzpuY2qDs?=
 =?us-ascii?Q?YGJP2qZuw+ZZLmCtBjMJ5Uv9B60nybVFPNenQl88qoFUFz25NtxYjhdd2YBj?=
 =?us-ascii?Q?tqSiBGoA9c2veXpLT+3gBdXnrwAC5rhbaqjZTIyFd+RUyMOC1RgRmwclAfrx?=
 =?us-ascii?Q?Fn7+87UgMMTuNKVAC7QR/knbQIx7iFgyTB3Dov0w6fTttKasNC8sgKiTB7fk?=
 =?us-ascii?Q?LfhSU1T56hSzlXuYkdhmuJoPnr/OePV6QfOXo2soZkejPaLWb0C8TWVtPpYx?=
 =?us-ascii?Q?1JbUq2N+LGAA6iL0yikx7r3Cs2HYy4OIhvzOMCvmQ+WlXi7/X37xyWOkhG0i?=
 =?us-ascii?Q?Cq2e/idbuImnPv0xZcSd1VFmLIuY3Nx3cRAp6DhynKBH3TKijAkVm+IWOxd/?=
 =?us-ascii?Q?BRa7snLSxqKh+pbdjvkqcbQybT+QcAvGf69gK6TbaP8TdjZVMt4KKuD+jHth?=
 =?us-ascii?Q?6gEw+jv2Kmn42H4H70w//Dp6T1K5ZPAjbDCuoWPflcp7v8pPgHle2L3fuHQ2?=
 =?us-ascii?Q?bA4aiOQo0QVShXrgAfuB9bE5h1pK31s8/lQbECu+zn1jBjIYuDsgX3GvJFFE?=
 =?us-ascii?Q?T8yf29lzK1og6+xgC6Pz9XZXKHJ+B5GLtfCwiXKW9yE1eZIgg0n95yb9A4jj?=
 =?us-ascii?Q?fBu01nSYdjW7F0z59FmNjaXUrKjLDDAh//pAlW8WybNA+vE1VJ5OGlUYgxbt?=
 =?us-ascii?Q?+sCiFFI0EZU9axpBSKrmn/i6XL+8OKmCFYie9xhRpBnm+ilZecmiQNxBFk3a?=
 =?us-ascii?Q?15IaRUX6T9U00a2LOvT0oTmP92jk?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 15:18:55.0145
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c5fc5a-c425-490a-9a06-08dc63a8b0bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8385

Hi Julien,

> On 23 Apr 2024, at 17:16, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 23/04/2024 16:12, Bertrand Marquis wrote:
>> Hi Julien,
>>> On 22 Apr 2024, at 13:40, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Jens,
>>>=20
>>> This is not a full review of the code. I will let Bertrand doing it.
>>>=20
>>> On 22/04/2024 08:37, Jens Wiklander wrote:
>>>> +void ffa_notif_init(void)
>>>> +{
>>>> +    const struct arm_smccc_1_2_regs arg =3D {
>>>> +        .a0 =3D FFA_FEATURES,
>>>> +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
>>>> +    };
>>>> +    struct arm_smccc_1_2_regs resp;
>>>> +    unsigned int irq;
>>>> +    int ret;
>>>> +
>>>> +    arm_smccc_1_2_smc(&arg, &resp);
>>>> +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
>>>> +        return;
>>>> +
>>>> +    irq =3D resp.a2;
>>>> +    if ( irq >=3D NR_GIC_SGI )
>>>> +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
>>>> +    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL=
);
>>>=20
>>> If I am not mistaken, ffa_notif_init() is only called once on the boot =
CPU. However, request_irq() needs to be called on every CPU so the callback=
 is registered every where and the interrupt enabled.
>>>=20
>>> I know the name of the function is rather confusing. So can you confirm=
 this is what you expected?
>>>=20
>>> [...]
>>>=20
>>>> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
>>>> index 98236cbf14a3..ef8ffd4526bd 100644
>>>> --- a/xen/arch/arm/tee/ffa_private.h
>>>> +++ b/xen/arch/arm/tee/ffa_private.h
>>>> @@ -25,6 +25,7 @@
>>>>  #define FFA_RET_DENIED                  -6
>>>>  #define FFA_RET_RETRY                   -7
>>>>  #define FFA_RET_ABORTED                 -8
>>>> +#define FFA_RET_NO_DATA                 -9
>>>>    /* FFA_VERSION helpers */
>>>>  #define FFA_VERSION_MAJOR_SHIFT         16U
>>>> @@ -97,6 +98,18 @@
>>>>   */
>>>>  #define FFA_MAX_SHM_COUNT               32
>>>>  +/*
>>>> + * TODO How to manage the available SGIs? SGI 8-15 seem to be entirel=
y
>>>> + * unused, but that may change.
>>>=20
>>> Are the value below intended for the guests? If so, can they be moved i=
n public/arch-arm.h along with the others guest interrupts?
>> The values are to be used by the guest but they will discover them throu=
gh the FFA_FEATURES ABI so I do not think those
>> should belong the public headers.
>=20
> Sorry I should have been clearer. The values in the public headers are no=
t meant for the guest. They are meant for a common understanding between th=
e toolstack and Xen of the guest layout (memory + interrupts).
>=20
> I know that some of the guests started to rely on it. But this is against=
 our policy:
>=20
> * These are defined for consistency between the tools and the
> * hypervisor. Guests must not rely on these hardcoded values but
> * should instead use the FDT.
>=20
> In this case, even if this is only used by Xen (today), I would argue the=
y should defined at the same place because it is easier to understand the l=
ayout if it is in one place.

I see, that makes sense then to add them there.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



