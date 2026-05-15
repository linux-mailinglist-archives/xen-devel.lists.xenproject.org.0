Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM2jDu4IB2qcqwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:52:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D2D54ECDD
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 13:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309879.1580888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr4V-0004NC-UT; Fri, 15 May 2026 11:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309879.1580888; Fri, 15 May 2026 11:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNr4V-0004KR-RO; Fri, 15 May 2026 11:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1309879;
 Fri, 15 May 2026 11:51:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wNr4T-0004KL-Q5
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 11:51:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNr4S-00Fue3-O9
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 13:51:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0708b0-e002-0a2a0a5209dd-0a2a450a9cb0-2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:51:12 +0200
Received: from [40.107.162.29]
 (helo=PA4PR04CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 6a0708b0-56b3-0a2a450a0019-286ba21d9957-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 13:51:12 +0200
Received: from DU2PR04CA0244.eurprd04.prod.outlook.com (2603:10a6:10:28e::9)
 by DB4PR08MB9216.eurprd08.prod.outlook.com (2603:10a6:10:3f8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 11:51:09 +0000
Received: from DB5PEPF00014B97.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::1c) by DU2PR04CA0244.outlook.office365.com
 (2603:10a6:10:28e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Fri,
 15 May 2026 11:51:09 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B97.mail.protection.outlook.com (10.167.8.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Fri, 15 May 2026 11:51:08 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 11:50:06 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 11:50:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=D7VSCEti2Q0x02HqzENpwga+4rOZjJfYp3nlvanNMzVR0Ovdkbh9R2sBhEcmXOK9Dhz39yCDtZVG1PiEI5TaBx7D4F8D9ZJYj0bOyk/YTSd2D0mvlMc4ckDCDgX8M3nBK8ahCv8ON/g4JJ07qSl5q7EO+LSytv+4nS+jO86sO9sd7CA9vx3c5IFpxB9NEBSOzc8nMPMYGKqKkHetPNDwFLQHqQAbx7u99NC0Ntbl0bSP31UHiVmHye7J/zn8+ocEOZZzXhSb7Kewy9uPcxHqgh0d76YoZRib2ZKmSLZq+gJkRnm03TZc5TjURZqrV1MXF98WLB5iXWYBBHAa29Ooyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ1DQe1F9Ha1zKGB0iIc/Qjo0CwP1ZEYCWbR7VWO6/o=;
 b=nTMhZQofcefzl6g8/LzvdMEs3Oqy6UWFFfVcFLkoZ5xiTGphXu8KVGcg0OU55kK6Xsy+Z0CZr6Bmaxu2J460XkLTqQzJoNHTC98q9C4f2k/IrwsR6R46LXkWpdXDhs2lw7g28W4Tdcxknw2wpfJR27oKXvKCd97b9MtDDOQwyEUtnjLZenBOmqOwA/vJKWbkjX1iUjf7RxTNpfxZN0OIXiX4qVl2SVP9ppMZHFNCa2Ypy4PmcE13a7BEr5jJKEwRAqr7uve93ga88mk973ls/JCqMaNrWXWUNJtBD37drilL86LLFK1akkfZNQa1vt21OkDja8GVGYXzzTfCm1Q72g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ1DQe1F9Ha1zKGB0iIc/Qjo0CwP1ZEYCWbR7VWO6/o=;
 b=n+2dBx1e6BEOv0HiDfQyAKGVIIihn3JHf2u6SxThE5JwjoEw/1kmSzNQWW4yANrj0P0HpocLl2R3AgHJ7nfQ4SIJiNUhzGMaseXafzvyPWZ9lxwteurFuvyOZVcLICRfBt8mPwbM99fH/bGnCuNiDbcmL/zmVhJv/iE7OjGr57c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZhCMJUKpESbj8YAcvhMRSTRr0DqEBpdjXQ+8Z20QHHZ/C2843Kg8E/tw0g0VLqxUO/xI674eG/E9QKcUc+rZ1deRCmITOxXKAjdOf34NsvGQolndwMMNXYQrBeDB8t68GQmHpa7z8mtKlDpdhJgqN194GRud0LN32TkhWsUN7F/001P8jL2ve3QLfaucjHBsgspw0HHR9oRNQ+AFLv7wIPO+J1x6LWaPcOTuFQu0iyDBypwME4k/YQRSyArYaAGyV38iMztj8MR6wKvHo+0wr6xpW1jbbwe/5aUSjHCQeFR/my28Yt68QYNJCc+Wy+/2BH+cQ1mzoG0UiOui9uluA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ1DQe1F9Ha1zKGB0iIc/Qjo0CwP1ZEYCWbR7VWO6/o=;
 b=inVqhfg7F8431hQ3Z+yaMHknJkJC6WPqrqdbn873T2OpwCcDP9Q6TG1dKqhuS82HgeCk4se7xgqkUsDKEa/hn4O0yx3Gb4r6AanpyATirf8USbCfuKVIumUYIo7lFtBsUoSyTNT8h5fOf7xsWA4kV5JBU8Qn7RspTxta2Om9UOeuiOxto76gUwHSJSvzssNyRc7h/tZYwVue5JIiQs/jdQKabLI0bHcjq2mQfTJSXnp7+KYx7noixiDl43V6J8pd3c+CJIQHt2S37by2l7lNW/gvbQMm/pJB7H4UcQHIi9IryDWM7IcB6WEsaTmS7gp9OJOTZngr2tr1Qx5X5q/VDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ1DQe1F9Ha1zKGB0iIc/Qjo0CwP1ZEYCWbR7VWO6/o=;
 b=n+2dBx1e6BEOv0HiDfQyAKGVIIihn3JHf2u6SxThE5JwjoEw/1kmSzNQWW4yANrj0P0HpocLl2R3AgHJ7nfQ4SIJiNUhzGMaseXafzvyPWZ9lxwteurFuvyOZVcLICRfBt8mPwbM99fH/bGnCuNiDbcmL/zmVhJv/iE7OjGr57c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: scan CLIDR Ctype fields upwards when probing LLC
Thread-Topic: [PATCH] xen/arm: scan CLIDR Ctype fields upwards when probing
 LLC
Thread-Index: AQHc26dpSVe9fegCuUahO/LG6twV8rYPCn6A
Date: Fri, 15 May 2026 11:50:05 +0000
Message-ID: <E80EC1E9-35EF-4118-A27B-17D8CEE8D2F4@arm.com>
References:
 <998162706f89bb3100bda409d8fde3c8b143eae6.1777886129.git.mykola_kvach@epam.com>
In-Reply-To:
 <998162706f89bb3100bda409d8fde3c8b143eae6.1777886129.git.mykola_kvach@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB7696:EE_|DB5PEPF00014B97:EE_|DB4PR08MB9216:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b9f931-d409-4282-18fd-08deb27840fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info-Original:
 jADHwF/IXL4/b2eVD4YTzRae+9+O/gb3HSF78r+dRioJ7Cm+KGDAI6Y3/AosAKy95Ck6eaDDZVrUzp4mcMUVIOFhkbFJ4RLjstm8h+L2NO2x9yOjg8owWRMU9TYOLFzRojQf/x89+FXJW7+IDqz3Iq7eQ6fxrCvueWCDW/dAZMlz1pgjaOJpAeLpf7/Ygz2jcXMGrG3UfSdRyaRAT5ZTKG+7WWUFispnO8uixFw7cRKj4n29DC0ZYzTCfVz1nTfDxF74Iy3jXx4HLGBHKppGe7z4nfb0iiyq+4VXT5QCVGMOou9NnbUdWt+BIcGusy6QLy1G+D2YIUcIO17gZvPg+qp4XmUNP0EP/8m1X2bvcAHmD6dL4YCX3s9xH3HKw7b6xnQDoMCwEpuIbRZAuewFQdqywEhUa/e5pivG7CE0xizw2FzwcIyk0BeU47jQIPhvYXaQUR3zGK7HUdT1CIjfFBdrb9gj6vkL5HpgAzKdrYygG2R/ghQujjZQWkBVKpPkYn1kHlaJ6gGP/96C83LpHMEPscZAngNlurHvmlerh2ug8KRxOI3hvZ9il2mZleem+yzxUEKvZ6T10HJJgOoPa3jFXUT371rzNANNwHTP6Hd2V29m+C7+E7j8AsUXXDHA2OebwVKVR2uIB0tE2aS173XBm02/B1nx/z7uQIFnlVFSLMEVib8ow8bZIzZfysAsmevIRKxLT8sFBWFscJVzMD287/ShliLLY62WWvxYygARsKqmyg2ea35iIGx0177T
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021)(3023799003)(11063799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <86379C553606824C8883E6AD00360664@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 lJYIbmqVYg5bIjSQSNhtEnZjE7hcr1yGRY+nXQTxKr2YKO3Ujll9cjToKWMLvl51Ivxi+W8foGlT8jLry0h2qiUq8/rVnjAJMNUCxQz2dAgqMyx3XHwbE+CU3t1k1MgHow2v2YcNIjPu5WW6vwJeM/uS63dlGu9slpVTR8zEahBPkKL9bYTysjnDFW1jadCLgigLUPLUWDtAPu+iwM1ch4OvjOJGQ03jI0nAng6zhhSx4Q+4LapA9/dPJe9M60FkENyFw+BT/YmJijZlI+QVY8SBxR4Ze123dMT/QzOZhBb5lW4DguJaPI5suWe/ory/NxJ87vUzNTXgV+Cs1nIE8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7696
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a4524ea0-dc9e-4aea-158d-08deb2781b73
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700016|35042699022|82310400026|56012099003|18002099003|22082099003|13003099007|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	nUFKve8qbl2eibZNmaFogiOiypoMEL1Uly2bMMhhhFlglOH818E+naMdcAzuUhfdPHZJQCDvBFwrSJfj+7FfbWt4yrl6hHFp9cFeOor6OEacDmD6muOmaWL5dK/uF1lnjpjcaGO0xzUyLKOaC0cHqzRq3rGKu9KV7DcnB8aU2zbi33g9jv67JEsHi6ncqbfUiY2rX9YlzmLv7xvzlP6CfL5Q5F7Kn/KCJqdHeF++S4ADpPeUh9V7CYts/PZfSuumG4CCT9fuIM2bve4TjCJoYPfoeEpb6mZEX/GhZWB7DGP81CQF6peqtXCrDgCN/MuLTC6R/HJj/t4+Xgd0CrdN+SBsxZP6/BVetxAKk6DC+T7bcsSubyG9xogjTuiyr/hTGm0nU4khO36Shj4YMgcIOx20cpOGOhFVHB33kVnk+gpPEp9/TOUrToSFUEy5ddnIAXJNy6DLcRh2Zq+1TGj7p1BIYruzHyzimQ6y3zxndhCil+Lkp6NPvfverh8UbDR/2DeUw61Ujjf1RXf6Uq5z4rujAO8deV1xuFJfuMDynVgdyCPv5pxvg42ujWYNPamOSn62i01h2r2xLfLSa/HAsp8dGRqWmuJ+oxE/l1M3WDeortPetuYBks8fP9SFjp8TuKlrEK4GO8B4hxjX8UzMzoILp20f06ZLTLLVQPmfsEk4HT1lH3lr9rdgWFNTVYmlfP5lLILMQqLRLcBTznCKdZxOk61uJ1JWTs52RrA+GYPdoYnMYFTZo/CEWh9mpryV
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700016)(35042699022)(82310400026)(56012099003)(18002099003)(22082099003)(13003099007)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	A0tQ/q9mvNGCia6DXwqb+itA3FU7WYvHxrcr8rkRIAVotRilcaqd20E0+c4tCgEO/hbEmnJo4nFiD5Fx2EVWLftiHQuOrY0KRUjej2ainsy2m8dG0Wbz13pCetk0NaLhduOcVa6Rn/kQfHdC+/P7U+3WS3yJub0qF5euDYucZ1yUjMN8SeaCcru+kT6euC9i2IhEAn9MpOfd8za1zKl4a9GPI14cycmt+xfBQLICAMPm1Kdy/1/14r/ZeSGN/gbxGAfhS9dmuIgc8H1ZjH2p2ZCtJaX2j34VNVYFgY+fJRa58x2hSFdqlQ5cYK2Me1qHTiyDY7I47HtzXfab95al1ecR71m3uiSqByX6BKsHzjp37MA3PTDYrNAMMXjJqd4PRSNWGmdmaVlaHUk5Q8sxGuKu+6pYz9pgEgieWeEE2vjlpYk38j/d8q7YA6opzxVk
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 11:51:08.8157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b9f931-d409-4282-18fd-08deb27840fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B97.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9216
X-purgate-ID: tlsNG-4011c0/1778845872-7C07C8B7-8AA42EB8/0/0
X-purgate-type: clean
X-purgate-size: 2100
X-Rspamd-Queue-Id: 73D2D54ECDD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email]
X-Rspamd-Action: no action

Hi Mykola,

> On 4 May 2026, at 10:19, Mykola Kvach <xakep.amatop@gmail.com> wrote:
>=20
> From: Mykola Kvach <mykola_kvach@epam.com>
>=20
> get_llc_way_size() currently scans CLIDR_EL1 Ctype fields from the
> highest level downwards and stops at the first unified cache it finds.
>=20
> However, CLIDR_EL1 describes the cache hierarchy from Ctype1 upwards.
> Arm ARM DDI 0487J.a, D19.2.27 says that once software has seen a
> Ctype value of 0b000 while reading from Ctype1 upwards, no caches
> manageable by the architected set/way maintenance instructions exist at
> further-out levels, and the higher Ctype fields must be ignored.
>=20
> The current reverse scan can therefore select a unified cache level from
> a Ctype field above the first no-cache level. Such a field is not part of
> the architecturally described CLIDR/CCSIDR cache hierarchy and should not
> be used for selecting the CCSIDR level.
>=20
> Scan Ctype fields from L1 upwards, stop at the first no-cache level, and
> keep the outermost unified cache observed before that point.
>=20
> This preserves the result for regular cache hierarchies, while avoiding
> selection of an architecturally ignored Ctype field.
>=20
> Fixes: f4985fce6f0b ("xen/arm: add initial support for LLC coloring on ar=
m64")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> This patch follows the xen-devel discussion:
> https://lists.xenproject.org/archives/html/xen-devel/2026-01/msg00345.htm=
l
>=20
> In that thread, Michal noted that the reverse scan was a simplification
> rather than an intentional requirement, and that changing the
> implementation would be fine.
>=20
> Testing performed:
> - standalone synthetic CLIDR tests covered both regular and pathological
>  Ctype sequences and showed that the forward scan ignores unified cache
>  levels above the first Ctype =3D=3D 0b000 while the reverse scan can pic=
k
>  them
> - Renesas H3ULCB booted with llc-coloring=3Don
> ---

The changes looks ok to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


