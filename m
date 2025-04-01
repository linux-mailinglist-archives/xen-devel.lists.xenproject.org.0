Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4AAA77B69
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 14:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934074.1335880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbBM-0004Yj-KX; Tue, 01 Apr 2025 12:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934074.1335880; Tue, 01 Apr 2025 12:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbBM-0004X0-GD; Tue, 01 Apr 2025 12:57:32 +0000
Received: by outflank-mailman (input) for mailman id 934074;
 Tue, 01 Apr 2025 12:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hrmQ=WT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tzbBL-0004Wu-LL
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 12:57:31 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df1f5f3a-0ef8-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 14:57:30 +0200 (CEST)
Received: from DU7PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::7) by DU4PR08MB11008.eurprd08.prod.outlook.com
 (2603:10a6:10:570::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 12:57:27 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::97) by DU7PR01CA0007.outlook.office365.com
 (2603:10a6:10:50f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.39 via Frontend Transport; Tue,
 1 Apr 2025 12:57:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Tue, 1 Apr 2025 12:57:27 +0000
Received: ("Tessian outbound 93207444acda:v604");
 Tue, 01 Apr 2025 12:57:26 +0000
Received: from Lf08b6128223b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 04696AE2-FD7D-416E-BA4D-C5FE93C0B36D.1; 
 Tue, 01 Apr 2025 12:57:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf08b6128223b.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 01 Apr 2025 12:57:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB10807.eurprd08.prod.outlook.com (2603:10a6:150:161::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 12:57:18 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 12:57:18 +0000
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
X-Inumbo-ID: df1f5f3a-0ef8-11f0-9ea7-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=B35vR+jSGAjA3+pe1LdziuaTfys+lz96DAkFkkHQ14jLfM5O6SsE+J4tRr4X0gN9EMY2jnwyuHKjDQePiEquJODqHml3B+vVGHbk5GgAs8HJpsrRgPLSwgRtbKhKScITei6kHaXJL5DfVqmW5r+2YgvsKwrtPYLtApcZCSUG0WdHFgDlGarlLJVst4x/0zwm5GsZbgEQrZXyTjPqGdxuDR2Qe8iBM+MC+2H+fS+B4RT3L946O6vevFx7bxk4PyMWrsg3id0Vsygi+8xRbhUHDjfoHS9vdLrpcjqEAnjfo2dgsSWEWYG0AeWgz9x5d3kJsj0PQSfIYnwCYdQnSlyYpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5AATKNPluFdCwzXm5L3oQURTFzDKmb8VieU9s77kaI=;
 b=jDXCsvAOYhaWg2XdMjyH9bHTxa+zoPJgS1FcLRAUBI3ivhP5EVFkA+auDQSicj1AMoFuCxPikK0WqQpDXGjvA2xy0/H0x1MqjyYzWx2wUIP0VBjSz8MaZzsKYdU7c5EqDtn4JnGubYEiGzgLs6E2fEzdsOUoq9KuTZy7bUaGaMQQ5cxvYQZNNa2NHfdiK55Q08PExFbqHFigruBVniA4YoYBvLi0wkBTGeay6NdHpBRnjGMYWWrEp+YP10jGm8YRrSI5KL5eU44C5ahWdKutXdUZA54lsMZQ+ErDcmu1k3wCEQ/atinUZwnbFjYIyqz76WL3scZiIlahYm2JKqqVdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5AATKNPluFdCwzXm5L3oQURTFzDKmb8VieU9s77kaI=;
 b=pHjBGs+V/+WAM5kmRlMEodCa6hQjF3UziLJo+eMC9WEMelwOViWAQ8veKW5MkNn1ECjERrnA9K+W8GNwdtEHol1dCSAWaZLCgvT69hTBNuTayNpwpFFRSsvdZ9fzWkvGDlFbe2QVbxCO+7RO2DvlWnUvBQNWHF+asLA6tVahxto=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a676e840ca0ebe73
X-TessianGatewayMetadata: bGrBQyz+VBwu66vwpNeOd9He312tOszC+SI2SgCZpBN6iw7tERjdwKIPPChLEYwH9YbqH2XQcy2Q5rsacWwtLDHu0LN2ng+6+W30lbB3vZvzE4tnxUNgg30G6HYhbS+gTBIfrlPgBbfmuAOSUHDJ6z+QMmeHjjjYyXpE5ExgpQI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXyBHVfhhpDgyzEAC83mAmfgm4hct4Ltd8dZufjkZiXBZAKM/e1TS153b1JQwoISrBOH/xpa3DVgbXE+JuFtbtwoRZaTeGh/jNDwfUKhnCfaj34YGh0Cv/b5Hk1NSZD/VeoJIifPwVPPO1VCiOmEQLIrcc9SnChUgxc2L7ZFMn2CBVqTMFIPPvTnWDGrgF7aqedt7NkpqBsTDuxNOu9+UHp+Hb/OlmYEZ5lglLVL002AN6DuZ5s0G65RDbAG+iALm9DJAzG4BYhyBrZYmcAV9b1uIK2yHMTVFtbdmIVmLi3mbkx2PWMfS5hLtGUZKFGXxIbYgu+zfiIZEsdIhJvQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5AATKNPluFdCwzXm5L3oQURTFzDKmb8VieU9s77kaI=;
 b=LQfeV+Ytd01KBawYKHSNlRFt0lOuu3FSc3tNl8gZwwy2D3tzzzhCogAAMKdoAaMUj3UdlI2dRNUoZJzp9AxSNs3thO5MBdqRoAqZeZcd6DEp4n7mS7VS6sdcfrq7NSpFBOhcEmg29kp7gQyBlMowcExSDtXsp05ZV7tq4u8aQjzEi5XT3ZsmdUdkHu6wB5fVhsu5PnWUCC2WW7A50ALdwLGQKzVVhP1CIYK8WGtp+tCXKAr2RIMDiXjCKSEtkY84Z9Zmr121ZLItPYi4uFcohkHc4ACBsMXFmgBQTBNiuXCk5HmHXy3qSF1/qOQkm7wmeiybl+aYs//0zw4sfYDJ6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5AATKNPluFdCwzXm5L3oQURTFzDKmb8VieU9s77kaI=;
 b=pHjBGs+V/+WAM5kmRlMEodCa6hQjF3UziLJo+eMC9WEMelwOViWAQ8veKW5MkNn1ECjERrnA9K+W8GNwdtEHol1dCSAWaZLCgvT69hTBNuTayNpwpFFRSsvdZ9fzWkvGDlFbe2QVbxCO+7RO2DvlWnUvBQNWHF+asLA6tVahxto=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Topic: [PATCH] xen/arm: Drop process_shm_chosen()
Thread-Index: AQHbouXQNh7nKprt5k2iUHPtnXy/N7OOxVgA
Date: Tue, 1 Apr 2025 12:57:18 +0000
Message-ID: <3D313BC0-75C9-4208-9067-C1F6153B3859@arm.com>
References: <20250401090937.105187-1-michal.orzel@amd.com>
In-Reply-To: <20250401090937.105187-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB10807:EE_|DU2PEPF00028D09:EE_|DU4PR08MB11008:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff1b743-b85f-46e0-006b-08dd711cc14b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?vs6Rk9IeaEK0DTW8eeOQ90zZvwAPxAEjI1t9IvCGgcbV9YorBkQEgxnM6yV6?=
 =?us-ascii?Q?QWLFNuZunZZ22QK/gDrlEam84ssnkgEL+77aW7mn8swAmJqn9PBSrSqFWS/m?=
 =?us-ascii?Q?C9DZ0zbiao/Iqr2dokUcRs2dBWkN1ftbh12xvmJAa75D/PMwgStP47h+lwQr?=
 =?us-ascii?Q?5O8VQd1vvqI1xMEAt/prUKn9lxmRiTJHzZ+GSIQE+cjsUb7SYL8vmEdJyFnN?=
 =?us-ascii?Q?3q6WB0/64Kn8JDE3rQR2DN1w7g9NCDowgLJD/Fu0N/ZxaRsWCV56SxPRyrru?=
 =?us-ascii?Q?PjyqJIURp1ASFAD9oetjoWWI6uK8vY5OGBqJ+jW6D85XYr5j7+z1B4mZhpnk?=
 =?us-ascii?Q?8sJFZ0/mm+heynPawsQKGAiZFS8kfhEfjpXuvJRJbCW15YKEVd2skPLczyV8?=
 =?us-ascii?Q?N8qyg7ifw9JGdmql8cmr13LomEzZ/m41/btWkvRjn7nNAGPmGq/pW78BZc9i?=
 =?us-ascii?Q?GRskgIqFo9H56SqyUGlf1RjnVYyFihYBmfMWDQA2dvHxHakWqCcOdu0MI70L?=
 =?us-ascii?Q?YNph63uFil96Sz2YuZOvqfmKzsmfSsoLgCCxtAe15w97Y8Pa5QYB0LfXrPak?=
 =?us-ascii?Q?x5JGF4ij5wn1xZ/nMBfPC9usCQKzetBDuRelYiy656bOF35cvTa79iubglmp?=
 =?us-ascii?Q?KFcMFbYD+F2ZTPqmg3LAloF8NQ2VrCnK2U/LZieelz9031EMDRMwGrO3Ys9E?=
 =?us-ascii?Q?WmSfXyydjBOMkmAeSjoCCiKnCOqOYmMPao1utz/WI6wghdr3SqwVD+Kr1u7J?=
 =?us-ascii?Q?o4CD9LXf8OEjY142+VXQei0y61cafXLCWRWQsj4DL6Va5osNIt8pt2TEZFBD?=
 =?us-ascii?Q?G/zhRmr4T80QyYTZi+trrj1+iUXmh4Szjl/zDjxoYG3AfR4YwW58c8UMUAuY?=
 =?us-ascii?Q?RiCbybSO7WfSN/jOvObYlK9uSp+DgRuLI0BAvjqx85Nv/Rx4JN48j950YAR5?=
 =?us-ascii?Q?eoovT6+xvjaTnQrVO6bfbVzhwEnFueOa7ViduDXYBBndQtX0fvko72Fo/mG3?=
 =?us-ascii?Q?pxJ94DY8vLD0fIVX4Kb0FHebu55ODE00DIQq5RqXEk1yvdWVAAdJtlXNWTL4?=
 =?us-ascii?Q?Aa0364FsJbTf3z389+2HbRQY0IcA8EJVfzi+nxnS39jSeBqFaYUlgRk31gPi?=
 =?us-ascii?Q?Gm+vh8FoMe1KEhICycD2xxO9sarXu7O4fOM7SFe/jONyokCF645e47bEZWa6?=
 =?us-ascii?Q?lmjl+dA8W2Fgt6AlROe3j9sgxQWu9EbTrYgptfDPQuD+g7pBvQj8r0e03558?=
 =?us-ascii?Q?ZgCE5nlHsp+Ru12gn3+byO89lDi3EBKCJdu+uOsYEcjuZVwRw3NPcX85nvkx?=
 =?us-ascii?Q?1z5Tq5cddzKWlsq1Jftm7mKlWkbqJZtbNJ/oV4gqcgfw67C3sOaGiHxjzoKf?=
 =?us-ascii?Q?ZEx0C0NSpmHcxcZFHd2T1susyMb8KIJNZ/lKw5N8zD6/JhqVyJ9MGhK/THrT?=
 =?us-ascii?Q?odaYnU27QOMY71BFir4TbUOSv7D2Oi4o?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <19FCD2424636B14CA0A926C9589565A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10807
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2235bce2-6046-4c36-9f7f-08dd711cbbd8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cZUmySSv+WOfSxMSaVaDlBCGyem4FBRSfeGpt4wK6l3Z/yzjmkqdhyy5YusO?=
 =?us-ascii?Q?WmmdLbrK/ECmCAZha4vYNpMcoStyuthEtpHj446aYDdrJknJ/IwZxx5kZdic?=
 =?us-ascii?Q?i/ukZmYSMgngcYv65AyVmoCqzHsKZcNQn7KVdJGRlj0AA434a1nnnGhJy2CB?=
 =?us-ascii?Q?Cx6Utot938EI2CIlOKcXaMsDZ3SbcHdToVT66+ssFMR6HOO6hQ5bgOCYIScy?=
 =?us-ascii?Q?pTfE/7fA0m25dxuQbrVe0apYL2zxJli28MJBXbx8kaPqyjnAOPEE34tKGoQY?=
 =?us-ascii?Q?XDaOb91zTMi6RsQvigS90+SuIJDg16x/VGa029WnVGIoJxOqf986PZ837NLn?=
 =?us-ascii?Q?JjW6ve7iwlUQO30qNYL1dCUG0KR7+CrqgIi9UiGSwQkdj3rKKTkJompp+i0q?=
 =?us-ascii?Q?p79x56H2/P/pvsW6AEDjPHofv9CzS/Po9zoBhGfCFg+K6nxH5BTO68onEzsz?=
 =?us-ascii?Q?tCJHfnrb3rlJjbiWLHfPO4lZJcu79Rj7hM9PHEGBkApJDlWRPemBjswhcG8M?=
 =?us-ascii?Q?OA6/IGtYqKaDoh2cBopVORSvVbnW+pp0vK2EYCTvaIzM90TU3HJvieKwzezU?=
 =?us-ascii?Q?I/EHmSajAgJkSfivdQ57hVV0stD6IalXrLAWmZWc84x1c/Zv2Qk/0XYzJ7Py?=
 =?us-ascii?Q?hZFc0tYMUeJU14Vvxh/OVG00roR3CHq7RRsAtlONJQRHxauMn2NEr3vkqurZ?=
 =?us-ascii?Q?1D87zOijZ19WuA1+sn1O7fM0iDiq3hB15EgjhBfadbwnKTg+IlYGzHoR7bw9?=
 =?us-ascii?Q?lSx2ma+wYN9uY2OYR3t3eyqZRR8+78F9gDNRu/Hk82jiPG1o7u+oXtkSyY/b?=
 =?us-ascii?Q?epCo2iTrS/h2c3+0exM2TjdSCKOh1ZXCD5/YmopaRYGKoEFaKmxVMCD9XIAj?=
 =?us-ascii?Q?/evuZP+sFGiJNB8V1XIsKd1BmsxbiW9oMvj79NQsEvE3Yz/ydp0T2ibAHoAC?=
 =?us-ascii?Q?gPbRzrkmd/3VBIbaoZCndIlbazVXTq7SiPQFD1jKYv5iyZvFhitNEVWQbUOd?=
 =?us-ascii?Q?dYjUDDIdXXQaWVIw5f653c37ApRxqLj0rMyw27JuNfeHUXBuFf1tonYeixoQ?=
 =?us-ascii?Q?y35Zsw2jIkXYckkfXacX0WTCi6G36Ooa5eTjQXUMf5TxLWTVfBQO67yHt2GL?=
 =?us-ascii?Q?hSgExO1+GX7e5guY3KiM7KAqfY8MJ7QRu+EjEQNlmLlWx4hUsa8QDXorb0No?=
 =?us-ascii?Q?YRRYswvDPfggRfjT0XlPxE85OFMjNouHDeJojgP14X/k0a7ZF882q8R1ML4G?=
 =?us-ascii?Q?/k0Du/nnuTlV0xQqtlk1AD3bWXa7eP3piBK6TXui4gqeGsTCUd/YrzrS4krE?=
 =?us-ascii?Q?skKyVZto76Ud58VvpUcsj3Xnbq9cHpVmYTldPqETfbFRCPu9RWtfqq8vWnnG?=
 =?us-ascii?Q?d/Jas+VvbqfjhIlnlmUA9OHPN6piPCCM8Pe3TQmR0ASFVLK7xUq0HQVi8o+N?=
 =?us-ascii?Q?iTf2S+3gQB9CU669D0T4u59HSwanxsvog5jf5Jrmu7BXg6tVP+Oj9M/ZGsfS?=
 =?us-ascii?Q?EwG3lrU9xdVVYOpwWfyWKYaDiamNIQxqARvR?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 12:57:27.2419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff1b743-b85f-46e0-006b-08dd711cc14b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11008

Hi Michal,

> On 1 Apr 2025, at 11:09, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> There's no benefit in having process_shm_chosen() next to process_shm().
> The former is just a helper to pass "/chosen" node to the latter for
> hwdom case. Drop process_shm_chosen() and instead use process_shm()
> passing NULL as node parameter, which will result in searching for and
> using /chosen to find shm node (the DT full path search is done in
> process_shm() to avoid expensive lookup if !CONFIG_STATIC_SHM). This
> will simplify future handling of hw/control domain separation.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> xen/arch/arm/domain_build.c             |  2 +-
> xen/arch/arm/include/asm/static-shmem.h | 14 --------------
> xen/arch/arm/static-shmem.c             |  4 ++++
> 3 files changed, 5 insertions(+), 15 deletions(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 2b5b4331834f..7f9e17e1de4d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2325,7 +2325,7 @@ int __init construct_hwdom(struct kernel_info *kinf=
o)
>     else
>         allocate_memory(d, kinfo);
>=20
> -    rc =3D process_shm_chosen(d, kinfo);
> +    rc =3D process_shm(d, kinfo, NULL);
>     if ( rc < 0 )
>         return rc;
>=20
> diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/inclu=
de/asm/static-shmem.h
> index fd0867c4f26b..94eaa9d500f9 100644
> --- a/xen/arch/arm/include/asm/static-shmem.h
> +++ b/xen/arch/arm/include/asm/static-shmem.h
> @@ -18,14 +18,6 @@ int make_resv_memory_node(const struct kernel_info *ki=
nfo, int addrcells,
> int process_shm(struct domain *d, struct kernel_info *kinfo,
>                 const struct dt_device_node *node);
>=20
> -static inline int process_shm_chosen(struct domain *d,
> -                                     struct kernel_info *kinfo)
> -{
> -    const struct dt_device_node *node =3D dt_find_node_by_path("/chosen"=
);
> -
> -    return process_shm(d, kinfo, node);
> -}
> -
> int process_shm_node(const void *fdt, int node, uint32_t address_cells,
>                      uint32_t size_cells);
>=20
> @@ -74,12 +66,6 @@ static inline int process_shm(struct domain *d, struct=
 kernel_info *kinfo,
>     return 0;
> }
>=20
> -static inline int process_shm_chosen(struct domain *d,
> -                                     struct kernel_info *kinfo)
> -{
> -    return 0;
> -}
> -
> static inline void init_sharedmem_pages(void) {};
>=20
> static inline int remove_shm_from_rangeset(const struct kernel_info *kinf=
o,
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index c74fa13d4847..cda90105923d 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -297,6 +297,10 @@ int __init process_shm(struct domain *d, struct kern=
el_info *kinfo,
> {
>     struct dt_device_node *shm_node;
>=20
> +    /* Hwdom case - shm node under /chosen */
> +    if ( !node )
> +        node =3D dt_find_node_by_path("/chosen");
> +

I would have 2 questions here:
- what if a NULL pointer is passed, wouldn't you wrongly look in the main d=
evice tree ?
- isn't there a NULL case to be handled if dt_find_node_by_path does not fi=
nd a result ?

Couldn't the condition also check for the domain to be the hwdom ?

Cheers
Bertrand

>     dt_for_each_child_node(node, shm_node)
>     {
>         const struct membank *boot_shm_bank;
> --=20
> 2.25.1
>=20


