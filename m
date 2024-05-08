Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9EC8C01CC
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 18:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718872.1121414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4k05-0003jX-KG; Wed, 08 May 2024 16:18:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718872.1121414; Wed, 08 May 2024 16:18:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4k05-0003gv-HQ; Wed, 08 May 2024 16:18:37 +0000
Received: by outflank-mailman (input) for mailman id 718872;
 Wed, 08 May 2024 16:18:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=guPL=ML=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s4k04-0003gp-2w
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 16:18:36 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d3a52e0-0d56-11ef-b4bb-af5377834399;
 Wed, 08 May 2024 18:18:33 +0200 (CEST)
Received: from DUZPR01CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::14) by PAVPR08MB9379.eurprd08.prod.outlook.com
 (2603:10a6:102:300::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 16:18:28 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::31) by DUZPR01CA0066.outlook.office365.com
 (2603:10a6:10:3c2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Wed, 8 May 2024 16:18:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Wed, 8 May 2024 16:18:24 +0000
Received: ("Tessian outbound e46bb127ed3d:v315");
 Wed, 08 May 2024 16:18:24 +0000
Received: from cf8b32b6726a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 055DF03E-800D-44CC-A8D0-A73765D0CC25.1; 
 Wed, 08 May 2024 16:18:13 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cf8b32b6726a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 May 2024 16:18:13 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by PAVPR08MB9233.eurprd08.prod.outlook.com (2603:10a6:102:30a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 16:18:08 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::d987:3f45:3a0a:f56a]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::d987:3f45:3a0a:f56a%6]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 16:18:07 +0000
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
X-Inumbo-ID: 9d3a52e0-0d56-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ehqDRoyvk1S5vnKayQOFW5CSmDeCzdsY9Ms6OnY3SN2SN7eR22YgvupqtieehHiZ+aP4qj1QzHLUs2+VLAMKAuiIpjrdVEdgjhk/C43U8gAwkrnTqsgV1tsDS7ULCCZEGiMNPSR/JQg4NuWDUHrBj2PkLGzop+q2xqlbP0FV/K2s95EQM57a/OtIZgvC5MZEe36crcsKKOl/KlEF2AZ70pxBSJHLjW7mrQhwiA01CW5V2qolQQW1A6iWCzxrN1+VSaicXcLK9cNeY97wD4Bwqlgsza5RhOis3MWNAf+BRusKjqh23NWDwiXaApskTOIMyMlGL+E52+dCGz4PhY9E7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OH/AvRmA/KmgVttKawV+T8DCYZ/F9UF7C3uLjcrtSM=;
 b=f5jjZrp7OJUfkpIB7E+gj1sqE74w5V0aUKGLInodXgDFVg1PMa79ct+kXQW3u/QMB9P1ibMi8ahwTkbBRj4uMVp7Q0u5QcQT23nKMPTyCJ0KUmuG1eOz4hF9hYc8xxF3YWH/25eBIBJdJixSD8D90eRuVWyeM2ECtv01h7H/4MwjNUd2CBpdgO8oI/XZbBHWidk1nFgZ2oj4KSpFX3o9GMgH7RlBLz8UZJZTtMI4tjulraXHiyjwHabzEfVZidOBp/DPGT/W2JUS2ZjXFe7R5a1Gd53uGFIX4Yj/ivV83wCZraReOzcgfapcKUAdruXsWMrTXVHX3TCArSIdLLIMqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OH/AvRmA/KmgVttKawV+T8DCYZ/F9UF7C3uLjcrtSM=;
 b=V0iV8mrmIMpG2DUo04fllLgGeQaO3vWxR1i4S5kQ/o1NtbKisFdTHx2OstJFtJJapwCCAbDShOxXvZgv1S+cznGY8Y+lEjsvjauc/RFPAlNeH391yrdSKwE9AiRz3UOiFhpCweDIqUJThdsV6uO74g6/Xhx8Ae/0vYQtRZyQauw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 437280982cff6f78
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kv0rrcI3neHORlyJso6NAX2zrYVidb35zkJgI/eVipSkzJpejVcivYqcLq/qoPdQnCk9wQMs2zhbygXry8Lu8Z85ya+7ewEO4J0LbWzeEGyS05kdR7cIOC7xGHHfsZnptgFXjvIPL9xsgm5DtdCedPNTy5E8KFvSeQN0qDVX2/BSNl+MCawJcgru+VJpry6iPxNupYmTsl6h7J4Dkt8taoFXxslIq7RnV3slIim9FimuXvT8qwZx8bRudu+fptOCto19PhRFuu1/0CqmFqYlHv9bqu3XYnyfYoBqNpUYKvjlgkTX+y0DFPlbmNz9u4BIEZrqhAvpTN6SvSJszuFkFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OH/AvRmA/KmgVttKawV+T8DCYZ/F9UF7C3uLjcrtSM=;
 b=NtRbUN0YrZ84LKLxYPXwiJtDW8y6TPE9xiJBBMi2+51zccaftTGrvM8IhGn8XL3j2xYmu5Iy/pvQNs98q8vl7yb65HlMN/npgLl+gFfItHX/4U8FgtpP5h0ZP9zgogPwpvmLVFMiTOQiHQznIpql9W65YF2VZ+sI3q4MVUVvBGliVmFcQuVc5bXJ60PYxQr4U3V9sbRZHmlf4F9S0gCIBG4JVATWC4F9Hg7k41M2Z+oZaYq6ALgROYj2uJNp8E8KV7TNv/SWimP3Rd40RWCNLZq0T9zde/HYR6xwBHKy3OTr9wgdfL+7ODeWm01K5hXlLU2jMpddSvtGLCfdFlisDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4OH/AvRmA/KmgVttKawV+T8DCYZ/F9UF7C3uLjcrtSM=;
 b=V0iV8mrmIMpG2DUo04fllLgGeQaO3vWxR1i4S5kQ/o1NtbKisFdTHx2OstJFtJJapwCCAbDShOxXvZgv1S+cznGY8Y+lEjsvjauc/RFPAlNeH391yrdSKwE9AiRz3UOiFhpCweDIqUJThdsV6uO74g6/Xhx8Ae/0vYQtRZyQauw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "consulting @ bugseng . com"
	<consulting@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Thread-Topic: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible
 array member not at the end
Thread-Index: AQHamu72Eq1RpEGs60mNp9DIfY8mn7GESRmAgAlHnIA=
Date: Wed, 8 May 2024 16:18:07 +0000
Message-ID: <57F6E89F-F670-49BA-B77E-6C6121A6A95F@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <alpine.DEB.2.22.394.2405021135060.624854@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2405021135060.624854@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|PAVPR08MB9233:EE_|DU2PEPF00028D09:EE_|PAVPR08MB9379:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cbcb262-7565-468b-df4b-08dc6f7a7cb1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?GXo2rfW1TFbQG1P019xHklv2Cj/qWLH0HfslRrXkrq3dV21yN8hggAn65tsv?=
 =?us-ascii?Q?Mdk+DJTSG4/9eAgNpJjTBKu0ZEqDfq8j1ZS8zA18sHHqtBuuCqbh+UD8IyDg?=
 =?us-ascii?Q?5k1RvcE2pKjW/5LOzy855/ovVR1cZFhsegborcwJz5iMiGOdC5lvARebKzi8?=
 =?us-ascii?Q?2tLYe3Zs8P3x3qA9ME2MJg1K30UAXXpdD0WVZgh92T6r/zV1/FSfWa0Gu+I4?=
 =?us-ascii?Q?4+WdAHWMWnJiy7L9PLb95O46j4/6jWBcfEm9MP7ITb9DKw/ESL3wKHoMfsVj?=
 =?us-ascii?Q?wJZpHXDD5FKQFw9WjjXEROevijmXmk2Ey4do8yfWEx+RJTmT1CuG6xIldBO4?=
 =?us-ascii?Q?XOmisHhGaZ1039yQoIvt/P1RZQCTFAdkL2LReD0ec1KQXA1h1xGGdeiRbbda?=
 =?us-ascii?Q?10645rCUrYlQ739e2EMjGEhGQraucJVXbmd2n8P84N9MKwTtJjz6Zg/0zUfs?=
 =?us-ascii?Q?VnBlK0SSF7cPLJJcQ4HvD3qKr5wHZnxWM5uEQSsRpb1DiFVsBqSqY04HPuA7?=
 =?us-ascii?Q?WmekjM/pxC5wQP00TX9wzdvIbSgRSanhvCb8nbFJok/Oe9omF/Sa3v+GinOh?=
 =?us-ascii?Q?uz2vrYRv+fi689sVNTx8DWpKsbQF7eCR2eYLtfuYMreSu3Nv6iMzj2wKYE/E?=
 =?us-ascii?Q?DrE0e/nCqJe/UCOkjkQFHmybbMVUzrAvrMMvZrcmq0Wu/eaRRr32UxUyF2se?=
 =?us-ascii?Q?Qf/e5HPSOiK+9SFjednZBZGn1DyqwRy2Qnk1SUDp9FgJuX0bDtp1YS1lwCIJ?=
 =?us-ascii?Q?Pm2cupbjhayY0o2Lpe4OXCOSDsHk2Gq92/xSd4CRoFkrJMssu5rc9SwANz+C?=
 =?us-ascii?Q?VU96dhE6P28tMNwPeXo2+dlT3w0YRqyqsNf5chrXfXW/Yixo8nZwMBZPcfo4?=
 =?us-ascii?Q?I0c2hIRh3lS6N2tE6aXlejNOu2dlFiVZuBJFK+BX5d/D77ZatWSo9Dm9tl94?=
 =?us-ascii?Q?S+FmqjKBP9qNFyFsxx+y2DsIW2hfVUrLsC096jr9Ju6ub2KAVKyWjdE5Ki2O?=
 =?us-ascii?Q?1UxfrdN0H/VON4bEW+AZluJL1xdtrCVBBNyeEgQOGzZw493SRdiI402QcghI?=
 =?us-ascii?Q?VPQ1vfjH1ld+c1MGYZIPNoQkyrX4RYmMJU1/CEYId0pCX/zOHCf7wskKn8ea?=
 =?us-ascii?Q?0ETvhrOMtTpqVocB4to320gdIlwrJRrm5O3vCT6bO7YY87PMcJTnVg10BEk/?=
 =?us-ascii?Q?J0p4PxKwPBljmgLJX2u7n4M9ytjTOm30edcGCGo/26uuzX66rya27GzKTfpj?=
 =?us-ascii?Q?jDWwU5dpaWPYoAdj1dq60oUtrz+w5AZGN1uJQfUBZniWXjhRE45CLAkXDbSH?=
 =?us-ascii?Q?J63029YQdbCADrX8Mv57a8L92YNUtw76ggJD5xoYES4UWw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <57781801558DEC4693A76E4030FD3453@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9233
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9122885c-749e-4340-3685-08dc6f7a727e
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|35042699013|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OQC4mK5qQW2nevFFpZJ10BYBMDL1UMjP6BmJIX+Tkrb45UX6tgJuPrWGmOM2?=
 =?us-ascii?Q?26biQcRTcvPcKjWs9KymlpB3W5rJEoYzXeK7nd6f5sKui2fUHKpa5cJj/GG2?=
 =?us-ascii?Q?t4JVym0etwFQnO9gO4lDBnLF25Hn7PopoLuNM63SKJFHYiXBoLwyZkuVlxRq?=
 =?us-ascii?Q?tfpGLUQOPP8gc7qY1S64A4VYInp+8FY8GWlZzCQlA/kl//K8PdgLMrXCL0AD?=
 =?us-ascii?Q?3+eS/xSIQZ7BwDzp7CGOeZ/5NUCq7pe0fTvy2Ag0YFJoBpHhlwxQXsEsiWwv?=
 =?us-ascii?Q?8G2PCMDt6Rim+wLJF/1e+Ys7/GildlxVv6RGhALF6VFcZhPagsZ2xw+oKD9M?=
 =?us-ascii?Q?TAW9xd4WJsDaHVvU8DF0eu7UPb1FJdGE1scNW/9FK5U8irxPI8oL8jm+6DhW?=
 =?us-ascii?Q?dNvXK9bo6S9POmDDaAAYd03WIPcoGFrEV/edqPBG+Z5FUknqr0pp8t4yOp9R?=
 =?us-ascii?Q?yndD1XQhDfxQ+bpKG36MiQ8NDF3K2ZBUMx4R5yWbNDy1tkeq3HGdOpX7KiKV?=
 =?us-ascii?Q?3arVT1esEG0ml2Yn5eR2sYiwa+HVuExqOZ6xyjlwAtxu+PAwa772Q/LErCe3?=
 =?us-ascii?Q?yislCC2t1xpguofUiKYOW2tg6HjmQcWDODFWHqF6xZiE2cfdEE71tRsLj98u?=
 =?us-ascii?Q?PocCpNF+woWcAI+o801CfAetPNPMLYyaXlKU4COokcJvGPhhnuKUq7Ez0sLL?=
 =?us-ascii?Q?+3dHaM+AcLR3hxHFefccF+C+Tv4UUms6HoI/tIGzc3eXN1du8ImR3tGYy4z4?=
 =?us-ascii?Q?f71TCF0xfpykaU1Q2ecyd1vUgt8Y6A2sAH3oS5UPmE3k+C+6Fb/1BZPd0iSO?=
 =?us-ascii?Q?cnoz+Emlmg3m4fltrMHIXIYI4vl2Flb3tDbuHJOuNnd244/ww0qJY5KOw4hz?=
 =?us-ascii?Q?Kb8jOnNf92d+Vbl2Q51pb322HZPqRAPM2cGjKIlzrDCPTicpi7/DKaWUNvn5?=
 =?us-ascii?Q?4uM7HoyDbMJXE4ngG/hhkTHgO/Kad6VQWX5IdPIeZWW36zxNf8dyRxF/ZP5y?=
 =?us-ascii?Q?jYQddJf7sF/HXdEw0ms1nYOegFMZLifOF6EaFa+THmpL3lcO55ukt2IW2zxJ?=
 =?us-ascii?Q?U+6IkH7WCVvodF4kbGXME854neR/8ItaryrD9MkR9HZzjYjNC8U93NKbTe53?=
 =?us-ascii?Q?wEuhB7pNJH7kCCz7fFDnvP/9qmx3QwxLENDd61dfFBRQyIYKWj9Gv9HrOL5i?=
 =?us-ascii?Q?zo0dN29lDIujEIGJ9ZwvlCyrfjTDjqOMUB+vAmLf81vVa4HWeC6u7Kap8mDC?=
 =?us-ascii?Q?qOWlwF+woECjnGXNJU+qjHPcOGzxsj2d8VnWmT4SY1kMUfeU/Q0jCC6Apmmt?=
 =?us-ascii?Q?wvyM3Sb4YH9AnPxcAPzLWeNW8kzbu0qH17/WJndED8Ziva1Wnk+h9AlZixUU?=
 =?us-ascii?Q?Ww0fw79zgXTxjq7vgxhN1bTTjbmw?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(35042699013)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 16:18:24.8492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cbcb262-7565-468b-df4b-08dc6f7a7cb1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9379



> On 2 May 2024, at 19:35, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 30 Apr 2024, Luca Fancellu wrote:
>> Commit 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory
>> bank structures") introduced a MISRA regression for Rule 1.1 because a
>> flexible array member is introduced in the middle of a struct, furthermo=
re
>> this is using a GCC extension that is going to be deprecated in GCC 14 a=
nd
>> a warning to identify such cases will be present
>> (-Wflex-array-member-not-at-end) to identify such cases.
>>=20
>> In order to fix this issue, use the macro __struct_group to create a
>> structure 'struct membanks_hdr' which will hold the common data among
>> structures using the 'struct membanks' interface.
>>=20
>> Modify the 'struct shared_meminfo' and 'struct meminfo' to use this new
>> structure, effectively removing the flexible array member from the middl=
e
>> of the structure and modify the code accessing the .common field to use
>> the macro container_of to maintain the functionality of the interface.
>>=20
>> Given this change, container_of needs to be supplied with a type and so
>> the macro 'kernel_info_get_mem' inside arm/include/asm/kernel.h can't be
>> an option since it uses const and non-const types for struct membanks, s=
o
>> introduce two static inline, one of which will keep the const qualifier.
>>=20
>> Given the complexity of the interface, which carries a lot of benefit bu=
t
>> on the other hand could be prone to developer confusion if the access is
>> open-coded, introduce two static inline helper for the
>> 'struct kernel_info' .shm_mem member and get rid the open-coding
>> shm_mem.common access.
>>=20
>> Fixes: 2209c1e35b47 ("xen/arm: Introduce a generic way to access memory =
bank structures")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>=20
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Hi Stefano,

Thanks!

Is it possible to add, eventually on commit, this tag?

Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>



