Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C7E8D48C8
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 11:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732599.1138589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcHg-0005Vo-MC; Thu, 30 May 2024 09:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732599.1138589; Thu, 30 May 2024 09:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCcHg-0005Tc-JC; Thu, 30 May 2024 09:41:20 +0000
Received: by outflank-mailman (input) for mailman id 732599;
 Thu, 30 May 2024 09:41:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lthE=NB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sCcHe-0005TW-SF
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 09:41:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2062.outbound.protection.outlook.com [40.107.7.62])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c26ed9a8-1e68-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 11:41:16 +0200 (CEST)
Received: from DB8PR09CA0001.eurprd09.prod.outlook.com (2603:10a6:10:a0::14)
 by GV1PR08MB7777.eurprd08.prod.outlook.com (2603:10a6:150:55::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 09:40:43 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::35) by DB8PR09CA0001.outlook.office365.com
 (2603:10a6:10:a0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21 via Frontend
 Transport; Thu, 30 May 2024 09:40:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Thu, 30 May 2024 09:40:42 +0000
Received: ("Tessian outbound 7e38650a3f1f:v327");
 Thu, 30 May 2024 09:40:42 +0000
Received: from 4d74ecbe6518.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9D66A29-D9D7-47A0-B000-7BC43094032B.1; 
 Thu, 30 May 2024 09:40:35 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4d74ecbe6518.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 May 2024 09:40:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAWPR08MB8789.eurprd08.prod.outlook.com (2603:10a6:102:332::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 09:40:33 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 09:40:33 +0000
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
X-Inumbo-ID: c26ed9a8-1e68-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EX8AXS8dlzrpgaEfTKCePlXy+HEwrTPcXFB09Wkl2+hDVnYt5e3kTUrhI8EuC3f6FfM9LTrLwaeNA/01YjsRFxA3nZr935gZE0FnzEa7PYbTDpOPmLpZP9DUuGbHgjBAGmZgMhA+A3drnMntHNOemly2aJdy0yrlVhXOZJuiJnWi0atimPHEcTllqwjP3iTRJ0mD3YlPoIXtyxL7NNiF4q1s+APlM4h2Xukl9nSuXe9LkT4P9RjwNHw2zLn6OfphpwC5Dj0vLQC7HJxK+mFEAg8is91m7RE22WJowJ7gwDHiXqc4NMspOjQ5sfPRb2M8kq4pB76YaSwDqEYNLuOSJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RERca++Jkv+bFKsXzSH4ddrRDHhcxvb/w+O8l/W0HLM=;
 b=LhLeH4Cy4WZgDo54HA9c4NCt8qWdnAqAVolRaQGCOK9xWkWhcgTbpgdwG2ovyg6HrmI/29ebS/cMnGqiYVCw3QNI/o6s71FFe2b3zNWXJQCcC75Ov3BQf97AJsplF8YchsJFLPgsu0rCyZhQqJGIzGs+tE3WPvgtmA1PYV3s3OBEyp4MvTAFvFwyzIt2PvUQmbiLxG0ZQuWdD0rh/JXdV8AJ6dvTndAj7zoO7YbU1vJGFhaulvOE2OLN3PAmj+ynd3sKQt4mtVmvTxi1zvAtrTxB3UzwwAJuM8wxRpM8RJoNN3QVeUQbtmR90a8v7/wjN8oUVVzCeB04YEtgeuDzNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RERca++Jkv+bFKsXzSH4ddrRDHhcxvb/w+O8l/W0HLM=;
 b=HW8aXt9yRHt67d6LUS2QcWoKu1uzMbs+YcV/yLem7IHsDwFXCqdWs+Up61n7iFYn8x/oo0hNHaDzZYsAE/hfQO5v6zR5hCP6b5Kf2iG9qKOZkQUaPxPO0/ywGiZfZzJxTqbQG/96gj7jjjVN0MbAeVF+BGJti9Ta51IMY8YlD0g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8f4ae92c69ae20ca
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FuzZGisy3/XVMCNDMTNUFaEhAXiwoR6/M8Ed1GvskTmnDttqnKWKF4ty+GtUbk33c3JLGkolwLvU9OFCcDlkHhOjT8UozZGCV3e9tpTPRm06eoDMBHn5VaWf2D6ATpAYP7g8eUXIvOj7S4hag2+K3vFPcOKytWcKybKuBurJD/B+dTYxtrjB7N6jVoLkjqhSHPzhEPE74vAtlGCa3pMNNWKCXhxwqgm6lbiww5NaReiEoMH95iAsn/mO+IkY4ouKxop2YLpH9E+D2vhBkZ0RbOqaei7xBZyzpLsWFLI6rtFYS+lPlsvMEma9owRA4guR5GrDcuzRRq3wCJXtVNnJgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RERca++Jkv+bFKsXzSH4ddrRDHhcxvb/w+O8l/W0HLM=;
 b=FhDKbGctvvHsUA79WVdtpAFAHnCVOrB+cWBDImnUSaNqsb+NHpEBjEH88pdk92z8HXp/gtMSqviuPaf1vCO3MS9Pb/Ksa0FbRqHXDciRDzDbaWrxecSYOrnVF9LY9GKbgjAVak9feqan9VXN92lEu1slYAahDzw5BOob6/jrBySp6LFOfwcrFp8ROgjUj8Qa4r6uVYjl83fA2RVFBEKpXDCvUEE9G2hdZA45JX1q4tZgzmt62aJewdd6jfMdZaT0nmLiCKxC71gNNdYBvVD8GXRwYNc8++pxy2SY9pE7OzduHekXRpBOtj7Qqv1azZqlfD6zeCkgX3l0AEu9o3a5yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RERca++Jkv+bFKsXzSH4ddrRDHhcxvb/w+O8l/W0HLM=;
 b=HW8aXt9yRHt67d6LUS2QcWoKu1uzMbs+YcV/yLem7IHsDwFXCqdWs+Up61n7iFYn8x/oo0hNHaDzZYsAE/hfQO5v6zR5hCP6b5Kf2iG9qKOZkQUaPxPO0/ywGiZfZzJxTqbQG/96gj7jjjVN0MbAeVF+BGJti9Ta51IMY8YlD0g=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] arm: dom0less: add TEE support
Thread-Topic: [PATCH] arm: dom0less: add TEE support
Thread-Index: AQHasgjZKwS4pdCyJUe9LewXYMLHeLGutaSAgAAAkICAANCCAA==
Date: Thu, 30 May 2024 09:40:33 +0000
Message-ID: <CBB42DF2-94AE-4566-B83D-3AB3CB2E01DE@arm.com>
References: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
 <be133b0b-5b22-4b82-b5f6-3c257b45553f@xen.org> <87bk4oxpxk.fsf@epam.com>
In-Reply-To: <87bk4oxpxk.fsf@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAWPR08MB8789:EE_|DU2PEPF00028D00:EE_|GV1PR08MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d9ea9a-847a-4708-718a-08dc808c92b0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|366007|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?00KzUZtDkSDB27//bZRoxGA64zHlyNkS455319MKBup9eM3zEU3jASYvHgzG?=
 =?us-ascii?Q?0RwK+joQ5r+DfFpKAni5XfOXDyXIC4BaU072Y5aCaKXhWNlfNjVHn+5ht3Lw?=
 =?us-ascii?Q?EImUtMGzwwnNCtDCZ7vRswGqkwBUZvPXDratnquKVfDTv5s9YxfF4dbqWHaJ?=
 =?us-ascii?Q?ELZg+Eod1FFgU3ZG7uhHCmO/GfdJxBEi3ps+kQfB7wENLqRyeE1SYCuV1gbz?=
 =?us-ascii?Q?oCoYoTDtfswSel84gQEFuCtEgGkZRGJKw+5vRlvWcFhN/CnmAJ24AO2UtHkY?=
 =?us-ascii?Q?Xkbknxyp1YYBm9pYI15kOUpOkadTFhg56rVf3PvieFiF3z3jsHR67gyOKiGt?=
 =?us-ascii?Q?OwOEGH1nAjfEgkgqQ5/r3+VgsT8+AXgufaWUE5Q3tJJwEJDtNm6GuR6ef2J1?=
 =?us-ascii?Q?McbKevhIaq9PGcAIftSkcxE61yhNn6HETnR8Hjfopv66+8kWTsiOx/2d/1RA?=
 =?us-ascii?Q?PRtliqvGNM3dqbQc6DcqEjsHEBkZz+8EAwSgOaENIROvKZy8l46gmxN3R6dx?=
 =?us-ascii?Q?lSx0OfWDMW7WnyaqfYXxNQz8aK6Rj/9kiOlI0NXNFaEuB+MVEcFIg7cQtx2F?=
 =?us-ascii?Q?0NHINMKJeIdq9lzogPDi2lAI7mqGWdOSQOeESu/PxN05dCImWAQ3SJa5dDBr?=
 =?us-ascii?Q?MNTjvjm+HSd9Pu5i8k8tfGT88YVJmsXC3qE4QZgdS6kubtvE7KuRDxZlBKl7?=
 =?us-ascii?Q?FpKuwc+eLA0jKcPLoIEzfE1ozRsvmvYmBI7ZmyHOVng50XXgf8uFz/J8/ZcO?=
 =?us-ascii?Q?1H6IclYsAtWbMHY/v9FmFaTHYzkQ2aDXNT+PZti29V96mDbuTvNs80MioRxm?=
 =?us-ascii?Q?8veVANpCU0KvQhj8az1/hgjCq+lqPSUh93aHGcWH24mpegJqCU0h5/htbpnY?=
 =?us-ascii?Q?8qEz65xYiFk0V0vVzxgmbXhnRTuydhl9lJNKbCKz4jpMvmOI+OrGcuwfzQ0M?=
 =?us-ascii?Q?UMaaUHr3SDm1CPl+uXbnSSUupD7thbr4sDbCeoypG3RZ7NhqzznShRs9o4qf?=
 =?us-ascii?Q?ttL4VrsVBh7DF738pEtXfMlQrLFD9U98L6xwG1nwLSCnIgMPK02meaZe9+sj?=
 =?us-ascii?Q?//qqVFCfUQegHuB2XG//lCEFSWrVWXqPzjXSWc3BykS2j86SmsdTv/VSAmUq?=
 =?us-ascii?Q?j8ZpF1L9STKusuZWih/6P4HuRatUsB4Wh3I8Pf4DX1GHv/Z5BWjtZi5p8miV?=
 =?us-ascii?Q?qFAmtC96DKEfcjdjC54LyiUlGCNqP1R0IbPuKA1jTE6pKHF/MDeqBdSjuXOa?=
 =?us-ascii?Q?SFkfLLhuoKGetoAOCaxgS2ACvCcF9YBHo1ABDN1VlnzkP0ul2ShwyO7Ei3Yg?=
 =?us-ascii?Q?4MXvl7m7zlTPaxxseKgfzH94vB2V/fEojBHvLvOr1NLnDA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C0CA106A256ECD4386490A024D408DD8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8789
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d2be8740-873d-421e-8dc6-08dc808c8d24
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|82310400017|376005|36860700004|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5AEb8Di9GVGDMNQYdtuun+1Vs3Hc7eN8W+HVblMUpnnINuH7zhivrz3jdd8q?=
 =?us-ascii?Q?OjXgcljkUCXN8pNGRZ8b1DJlpZM0rp/LzQ1cMQ3vBXBtn0ga6iKmgHeLNy3p?=
 =?us-ascii?Q?Zz2gCNh/dQ+IedCOZ/+wfbKzEqQNHHYQGiPBwENs4GdIn/bDHUQtkyTj8Cac?=
 =?us-ascii?Q?gYT3wM0TbBQPCHn47cPhPGmn7YmOFdVimvdtOtcIwXKNq0CvxOLGsOgm+Y1d?=
 =?us-ascii?Q?6kpjgbV0yfRHz48QcpGHOc40bb1wgpVkZGXuyAUG8AeEdz2JEflQjmVtrVkC?=
 =?us-ascii?Q?iaQN6dfk8moqLXSvQR7vvh7c8kpjVcNEv51NJtJQt//C0cZImrfzPabVjtRy?=
 =?us-ascii?Q?j7mFy8eMAbaESxoXqkJvyUb70MInzyqbt0xkjdUIJhh2kQaIhK3sUznAetcD?=
 =?us-ascii?Q?UbI8Llec92/1sR1p2NBNPqw5Ydlff2hqzsJBj5usnzRPJ+zKtvZeoQfjLf3S?=
 =?us-ascii?Q?bR6ZkiVtpzlc9XscIY1oOOzltGn7iieS3VOq6HkbBU4XFbfYLCwDy+LuBXZ4?=
 =?us-ascii?Q?C2oI3oLvSuy99EFlMuHgCqO0DUKn7HOdrM6EXvtgGsJsFEC0IiE3N01+i8/p?=
 =?us-ascii?Q?hPSKlINHcbTolCOMhJDk/4mGfzaO0/R40F3oam9FoiXXZp67oB6oWNpnxlBZ?=
 =?us-ascii?Q?NmMA17XmeMmGIqooCqfO9uFAoloxuCSMyhyj+rMaQPR53/prQQt7QYIK1vSO?=
 =?us-ascii?Q?E+Q7R6Wzh+js4RrmjZIB0ZDghC8wbSHHzCVpuqopOxwmn5sCu9KmedqMrCL9?=
 =?us-ascii?Q?2pViD3B8rVMsuyP0KDGt6b3dfoKVQO+TnorO0363eX+nwzvfBXUQ/RW6VOo0?=
 =?us-ascii?Q?+6O79lQ/27kjuh7aHHk8G9L3Yn0wy9HNdxPHQAA5BLsN3UaZQzah5z9ONR0G?=
 =?us-ascii?Q?LDt4kHuV3BERmiQbTnggg+MB1gLxzYSshnMdu9eNJxBwYfPkjYAMShBY/f6M?=
 =?us-ascii?Q?GNfjTYlfqZpUeVetsj6xIULrll/33q7YdWhotUirya77ohw/pIIFSVE9xzKo?=
 =?us-ascii?Q?ce8iD+LKCLz/Ak6NCTCOREPe9xprMlp1Go8Ta8cIGixjXJzRjC6olhi5rowM?=
 =?us-ascii?Q?KR3LDukz4DKkHu8WyfU4uBKziUnEk0x8LvBwy1aIjXLeCdzg7hcD+9D4h/Cr?=
 =?us-ascii?Q?Jqiybv17qDQSYcOtcEEjHNw4QVvU5wjK+1O8SAFvGC9gKFKxpG/rmUWXRICl?=
 =?us-ascii?Q?XRh6MglrNz1/SjRwX5T1JkqKvdZUX+PbsIcFVprpog7gStyGzyG98u2405HS?=
 =?us-ascii?Q?q6eLiMhWnbrcNOYJyG+2Z8LjYc0gPB60wE0UT6bIkg7kO6NgNkMSH5S96Vfx?=
 =?us-ascii?Q?6iMDaa0S4YDaqC8+gHG4wGq+MX8K731XRW+B7gzbWxXI7StNzX9pjWVkXhil?=
 =?us-ascii?Q?ygos+5O622d6WiQwW+LSrrBboDCz?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(82310400017)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 09:40:42.4581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d9ea9a-847a-4708-718a-08dc808c92b0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7777

Hi Volodomyr,

First: thanks a lot for this as having a solution for selecting the tee
for guests on a dom0less configuration was something needed.

Let me answer a bit more on the rest of the patch,

> On 29 May 2024, at 23:34, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> =
wrote:
>=20
>=20
> Hi Julien,
>=20
> Julien Grall <julien@xen.org> writes:
>=20
>> Hi Volodymyr,
>>=20
>> Can you clarify whether this is intended for the next release cycle?
>=20
> Well, I don't think that this patch should be committed ASAP if this is
> what you are asking about.
>=20
>> On 29/05/2024 21:43, Volodymyr Babchuk wrote:
>>> Allow to provide TEE type for a Dom0less guest via "xen,tee"
>>> property. Create appropriate nodes in the guests' device tree and
>>> initialize tee subsystem for it.
>>=20
>> The new property needs to be documented in
>> docs/misc/arm/device-tree/booting.txt.
>>=20
>=20
> Yes, missed that.
>=20
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>> ---
>>>  xen/arch/arm/dom0less-build.c     | 69 +++++++++++++++++++++++++++++++
>>>  xen/arch/arm/include/asm/kernel.h |  3 ++
>>>  2 files changed, 72 insertions(+)
>>> diff --git a/xen/arch/arm/dom0less-build.c
>>> b/xen/arch/arm/dom0less-build.c
>>> index fb63ec6fd1..1ea3ecc45c 100644
>>> --- a/xen/arch/arm/dom0less-build.c
>>> +++ b/xen/arch/arm/dom0less-build.c
>>> @@ -15,6 +15,7 @@
>>>  #include <asm/domain_build.h>
>>>  #include <asm/static-memory.h>
>>>  #include <asm/static-shmem.h>
>>> +#include <asm/tee/tee.h>
>>>    bool __init is_dom0less_mode(void)
>>>  {
>>> @@ -277,6 +278,42 @@ static int __init make_vpl011_uart_node(struct ker=
nel_info *kinfo)
>>>  }
>>>  #endif
>>>  +#ifdef CONFIG_OPTEE
>>> +static int __init make_optee_node(struct kernel_info *kinfo)
>>=20
>> Please introduce a callback in the TEE framework that will create the
>> OPTEE node.
>=20
> This is the reason why this is RFC. I wanted to discuss the right method
> of doing this. "optee" node should reside in "/firmware/" node as per
> device tree bindings. But "/firmware/" node can contain additional
> entries, for example linux device tree bindings also define
> "/firmware/sdei". So, probably correct solution is to implement function
> "make_firmware_node()" in this file, which in turn will call TEE
> framework.
>=20

I think we need something in tee.c calling on the right tee implementation
depending on what is enabled for the guest as Julien suggested.


> But we are making assumption that all TEE implementation will have its
> node inside "/firmware/". I am not 100% sure that this is correct. For
> example I saw that Google Trusty uses "/trusty" node (directly inside
> the DTS root). On other hand, it is not defined in dts bindings, as far
> as I know.


Regarding the firmware part you can easily handle that by looking for /firm=
ware
and create it if it does not exist before creating your sub-node and this s=
hould
be node in the optee node creation function not in tee.c.

>=20
>>>  /*
>>>   * Scan device tree properties for passthrough specific information.
>>>   * Returns < 0 on error
>>> @@ -650,6 +687,15 @@ static int __init prepare_dtb_domU(struct domain *=
d, struct kernel_info *kinfo)
>>>      if ( ret )
>>>          goto err;
>>>  +#ifdef CONFIG_OPTEE
>>> +    if ( kinfo->tee_type =3D=3D XEN_DOMCTL_CONFIG_TEE_OPTEE)
>>> +    {
>>> +        ret =3D make_optee_node(kinfo);
>>> +        if ( ret )
>>> +            goto err;
>>> +    }
>>> +#endif
>>> +
>>>      /*
>>>       * domain_handle_dtb_bootmodule has to be called before the rest o=
f
>>>       * the device tree is generated because it depends on the value of
>>> @@ -743,6 +789,9 @@ static int __init construct_domU(struct domain *d,
>>>  {
>>>      struct kernel_info kinfo =3D {};
>>>      const char *dom0less_enhanced;
>>> +#ifdef CONFIG_TEE
>>> +    const char *tee;
>>> +#endif
>>>      int rc;
>>>      u64 mem;
>>>      u32 p2m_mem_mb;
>>> @@ -786,6 +835,18 @@ static int __init construct_domU(struct domain *d,
>>>      else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore")=
 )
>>>          kinfo.dom0less_feature =3D DOM0LESS_ENHANCED_NO_XS;
>>>  +#ifdef CONFIG_TEE
>>=20
>> I would rather prefer if this code is implemented in tee.c. We also...

ack

>>=20
>>> +    rc =3D dt_property_read_string(node, "xen,tee", &tee);
>>=20
>> ... want to return an error if "xen,tee" exists because CONFIG_TEE is
>> not set.

ack

>>=20
>>> +    if ( rc =3D=3D -EILSEQ ||
>>> +         rc =3D=3D -ENODATA ||
>>> +         (rc =3D=3D 0 && !strcmp(tee, "none")) )
>>> +    {
>>> +        if ( !hardware_domain )
>>=20
>>=20
>> I don't understand this check. Why would we require dom0 for OP-TEE?
>=20
> OP-TEE is enabled for Dom0 unconditionally in create_dom0(void);
>=20
> This is another topic I wanted to discuss, actually, Should we use the
> same "xen,tee" for Dom0? In this case we might want to alter Dom0 DTB to
> remove TEE entry if user wants it to be disabled.

This is only called for domU anyway so i do not think this check makes sens=
e.

More than that, the fact that we are enabling optee support by default in d=
om0
might need shortly to be revisited as one might want to have a Xen compiled
with both optee and FF-A so we should have a solution to select which one
(if any) is enabled in dom0 (command line argument or device tree entry).

>=20
>> In any case we should avoid to hide a feature behind the user back. At
>> minimum, we should print a message, but I would rather prefer a
>> panic() because the user asks for a feature and we denied it.

ack for the panic.

>>=20
>>> +            kinfo.tee_type =3D XEN_DOMCTL_CONFIG_TEE_NONE;
>> Why don't we have a else case? Are you assuming that tee_type is
>> initialized to TEE_NONE (which luckily happens to be 0)? If so, why do
>> we need the check above?
>=20
> Yes, you are right, I'll rework this part.
>=20
> [...]
>=20
>>> +    if ( kinfo.tee_type )
>>> +    {
>>> +        rc =3D tee_domain_init(d, kinfo.tee_type);
>>=20
>> Can you explain why do you need to call tee_domain_init() rather than
>> setting d_cfg.arch.tee_type just before domain_create() is called and
>> rely on the latter to call the former?
>>=20
>=20
> Because I was not familiar with dom0less code good enough. Your proposal
> is much better, I'll rework this.
>=20
> --=20
> WBR, Volodymyr

Cheers
Bertrand


