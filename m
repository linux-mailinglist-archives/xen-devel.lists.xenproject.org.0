Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611478C7788
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 15:25:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723324.1128079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7b6I-0004VG-Sz; Thu, 16 May 2024 13:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723324.1128079; Thu, 16 May 2024 13:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7b6I-0004TW-QJ; Thu, 16 May 2024 13:24:50 +0000
Received: by outflank-mailman (input) for mailman id 723324;
 Thu, 16 May 2024 13:24:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S4LL=MT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s7b6H-0004TQ-4C
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:24:49 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2606::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa0b4e39-1387-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 15:24:46 +0200 (CEST)
Received: from DUZPR01CA0231.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::12) by AM9PR08MB6243.eurprd08.prod.outlook.com
 (2603:10a6:20b:2db::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 13:24:37 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::99) by DUZPR01CA0231.outlook.office365.com
 (2603:10a6:10:4b4::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27 via Frontend
 Transport; Thu, 16 May 2024 13:24:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21 via
 Frontend Transport; Thu, 16 May 2024 13:24:36 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315");
 Thu, 16 May 2024 13:24:36 +0000
Received: from 213ed3c0f3d1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AB566322-554D-4906-9126-BA5EBF54EC6E.1; 
 Thu, 16 May 2024 13:24:29 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 213ed3c0f3d1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 May 2024 13:24:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB7353.eurprd08.prod.outlook.com (2603:10a6:20b:444::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 13:24:24 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 13:24:24 +0000
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
X-Inumbo-ID: aa0b4e39-1387-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bFA+GNPf8YhM63yJe4ZFBGYNNUsNOgxidhOdxgpOyT9J7et28uAiLHR/3FB4TWprz7spw4ey5yeDqcbLQCHPDuoNzIQiKypzILDI5HJzkaZ7KvC/dc57kIyZr/qjOr+BME8Wr1RVNttqDui741nzJuMehAnXeDaLuR5pUUhB5iSugQ/EpxLZy3WOOvo1R2PvC2oLyzqKmxnszEpdG5gYb6DIg5xLu39AMy1Z/H6bd7VByHeUw0RmzF1UVjWE2yWSYf/jJZ8nnwM8qUq9FmPmJ2NnkxODe7sunkVY+tb7nbMMqedws14cQErFeiSZtiokV1HcQeE0za4/HOdog0CXCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXXbJmbvR5oz9UhDa4nLJI+eTKj1bhiYZ1E+64sKjEA=;
 b=QclJ76Kx0v1hQs8i170OMcQSFcL8q19vLJKmt/O1HCa+pr9LmzFS7qdiaU2F0oIxuUJM2IUQkWbJfp+Cslj4zlEuZ3bwaXq37h+LfvSlOsBu0GzFh7550v8R4D+3i5nnZjtibjaW100XIT+IyiWOf3vWAifP/+oFegVGCWaAMRNXpN5BJGmviOqgcV15V7GB7nUmDR8i9JLyOKiOrn7MdGodSsfVmkiPKnPx3wwmvD0//vEpMrRGyIP4JBnmo0FqMcRVpdPkhyxMgTRiVqg1N+HI0vNQn5y3cL4i9m3hDqWp+TE9mjoA6AUwEbqRjcbechGvoNE2ZGQNLgc65y4P8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXXbJmbvR5oz9UhDa4nLJI+eTKj1bhiYZ1E+64sKjEA=;
 b=al04fV83ndiO9A4aoFF2OPG/T8PshLNW55jjZ2+fdpCidSfY/irboytpR5/n8jw9Uhkrheftmblv0J7hyXM9aznX6i6gC9vpqfFdN8LEF6X8WnI4N7A0+HAQgMgbgFcO+YaUmOliU7bwrjcynSlUNxC5BiXNyz9kqUKyE4Ivd5s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: efa1791889e6ca4d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tl/movNA4USbwPBnTMXmn1PsVLF2MIrtmgrbLQYzztsLvwru9cTe/fVqCLPKPIf++0XoEm7MFiAZ+FNB4/5jErqjjGRufs+ILCZxESTtrA4g7JYymSyHiueufLbWPhwAVXQk6l+NKtFZ0Zf1/d+FC6uZ6Cz+YsVx6Os1OuAW9PNF0wWJ2v85P0synMDiQ/Wr1BX6v4Kcibvpod8tgPyjyVd+FrW7o1Gub6kvxP11C7GixmPxnE8k6Ai6ivSkY0ydcjhcj33GODTPHI0iDf0nUB9pH1GOsxdo1FRj/tpbyn850XFRZGwGraZx7I7fjvkmoaD2REHN4Ju2bo5mHXWakA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXXbJmbvR5oz9UhDa4nLJI+eTKj1bhiYZ1E+64sKjEA=;
 b=fOmFww3OiM75NZnK2gmEqzj1b/foNGrVPbO59QMRPYPXNBU+K+0yg+xUY2i5NEaO+GVhO9jbcDxEevixkj+TYO3hA2mesLLozFTS89OGtUmlO2MUB447qWEtIT9fmKbi6seI9ayjsDTkK5SBOQGjGU+oi/jNopp1Moe71bsYGEPmc+tThi0rifmn9YItA9maI95BuR5m94E6zsobS2s3/bRBraZ0bNKzpTw1A0bVx1JHEY2J06UXxn3lxZ/56OcgoE+8NsauGK1jb5KHyHNzxABtPVljENwGJN2QJV/OVWc+KSVeS22uG9rnFuFzTkamzv7qZkJrNo/UeppYlZP4sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXXbJmbvR5oz9UhDa4nLJI+eTKj1bhiYZ1E+64sKjEA=;
 b=al04fV83ndiO9A4aoFF2OPG/T8PshLNW55jjZ2+fdpCidSfY/irboytpR5/n8jw9Uhkrheftmblv0J7hyXM9aznX6i6gC9vpqfFdN8LEF6X8WnI4N7A0+HAQgMgbgFcO+YaUmOliU7bwrjcynSlUNxC5BiXNyz9kqUKyE4Ivd5s=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/7] xen/arm: Wrap shared memory mapping code in one
 function
Thread-Topic: [PATCH v2 2/7] xen/arm: Wrap shared memory mapping code in one
 function
Thread-Index: AQHaptP615847oF42UGhJ4Bg9mW8m7GZ2dcAgAABMIA=
Date: Thu, 16 May 2024 13:24:24 +0000
Message-ID: <8509E09D-2CED-4DD0-AE4F-F6CEBC63AABE@arm.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-3-luca.fancellu@arm.com>
 <854f4353-6a02-48a1-99f3-0ce65950e790@amd.com>
In-Reply-To: <854f4353-6a02-48a1-99f3-0ce65950e790@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB7353:EE_|DU6PEPF00009528:EE_|AM9PR08MB6243:EE_
X-MS-Office365-Filtering-Correlation-Id: ff57a3cf-9919-4366-c2ef-08dc75ab8813
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aUcwZ0toWUNmT2drWEo5UEl6aEN5YWMrQUVNMXRKWFdPWldLQjJiWXBnSFor?=
 =?utf-8?B?T2ZlTnlzTjNxUG5VOTdvazdyVU5OWjR6ZXNqeldyMUd0UDA1MWl0dzE2RGJn?=
 =?utf-8?B?THJzWTc2dzByUElQaGwvZGRXYjgyMFJCWGpLRFVHNE9HdEVYTzZGdVErbUJ5?=
 =?utf-8?B?QjN1T3RSRjBvMWYydlhQcS95TTZwZWxxT0pYL2ZlcmlneHl2Y3ZVZnJXUVBR?=
 =?utf-8?B?dnQ4WW5yQkdvRjRXT2RxTm9oOGR3bkE2UFR1ckx6dDE1cUdPYUFOc0wxRVN6?=
 =?utf-8?B?VjJHcWZMcFplQy8rQVNZc0pTYnJ5NWxkcUlqZDdlMExVL0dSWkE5WnVLcktv?=
 =?utf-8?B?UUNTQnJ4MGhuTkIvL2pBK0hpZk5MNW1sL1c3SlVTaHdMbUV2VXEyalM5cmdU?=
 =?utf-8?B?YVY2YWtXcHBFZnhOSXNoZmdCZ3JDRWIxQnVFem04RUw0RUlyV3RCL3ZGcVlr?=
 =?utf-8?B?cVB1Y2txUjRwTkJockQxSW0xMDZJdk1TWFBkeEMyODlHVFMwR25DSXRqL09V?=
 =?utf-8?B?TGNDZE9USHpjNHZhaDNXL3BmV0kycmY2a0R5Z0EyeUFRRW9CVHo5UjFJS1Mv?=
 =?utf-8?B?b056Mis3eGdGdzdkZ21BK3d3NWg2UHJtUU1RWFdON1g3OUVQVjMrcXpHVFUr?=
 =?utf-8?B?bkJLMzlsYVowNTV6Rkx5R0wwaE9MRzY0VXlWVFl3MjdzenF0WlV0ZmtCNXdT?=
 =?utf-8?B?a2wzVVhIL3lmNU8xK3JhOElrTWs1cDRQZExiek54SlZqTXoyNXA0Nmc0eUpP?=
 =?utf-8?B?ZDN1OVEwQ24zSVdKT3NLMFpHYWVXajdVNzJuVG5LRTVYMkloVjdoaTgyYW1q?=
 =?utf-8?B?R3Q4VVZNTnVTOXNnK20wMEJpb040YlhrZTNlUjRKanUrTmZuRjh3am5TcHNF?=
 =?utf-8?B?MjV2a0ZaSXZxODFINWhXMVl5RGJsT2dielhCWlVqU21vSU5sU204UVZCTjBj?=
 =?utf-8?B?VEdiVlU5eUQwamg5UU1PMy9meG1ROWFERDNOSTVIMVdCYWtYdC9Fa21uSFhM?=
 =?utf-8?B?b2N4eEVsejhENlJQVEVUc3FkM3N2N0dNcGNkczU0L1RCTVRwRGdVM2dMcXo2?=
 =?utf-8?B?bWMrRlpJQ2Qzc09UM0tUdDRnZEhVcHRlYlR0ZVREa21MRHhvMWJmTmk5R0ll?=
 =?utf-8?B?bkNObGxXYUNuekl5eEtIVGNlUFFoTGRlc1g1YndWR1ppaEI4ajFnS1V3ejN6?=
 =?utf-8?B?SlltL2V0em8rM0dDVk1SYjB2T2RWT1A2WkN6bkFnQ0xsb2ttVFpwQ09KS2xE?=
 =?utf-8?B?bTM3UWQwNzVLOHVZUUFOVlJOZ0RhOWFneUJXM3dFenovNzR5dytQT2FxYmJX?=
 =?utf-8?B?eG13QjErcFdaMHdJM09DSkVQcEJIWHJJMm1iZzJKQlpGN1FPSU1VNDFhU3FZ?=
 =?utf-8?B?QVFnRDllYlh3dnRPRHFyM2NmdW5sTGMycHFObURCNjZybmthbVVabmtLazZw?=
 =?utf-8?B?TmtJZW1RVzhiZFlEOENISStIL1luWEEvdFdOcUZNa1dBSCtOOFl2cXkwZG8r?=
 =?utf-8?B?elRkY0lmMzNZMmpuemhDbUo2SHg3ejltdXdhZUtEZXFtVDN5UnA5TEJLclBE?=
 =?utf-8?B?eW4rZEJOMTJhRzJqMFBlQk1MejJzWDBjQ2NQbHVtVVl0YnNkUHd6OXgxdnMz?=
 =?utf-8?B?MW90ZWUxaFliRVkvbkNYTURtYndzRzJnMys0cFhDR08vTzVuL1VFQ21pczJU?=
 =?utf-8?B?UXBFVE5ha0dJNTF2NHg1Q1JaU2FYUUVWaXNLaTZLT1l5TUg5bS9ab01GM3kv?=
 =?utf-8?B?YWtraXppRTRDVXV6UURUSWpsY0cwM0EyWHJIRW8zUjFJTHhpVUt1YWJCZW5Y?=
 =?utf-8?B?L1lWczMvWHNFL21DRjRZdz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8CC11CF333AB4A43B057114406A1AD85@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7353
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	42d3e5de-901f-4963-b324-08dc75ab8102
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|35042699013|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVpmYzNsaENmS2RRZmRXbkxDd2EzekNmRVVCK2tvdlpEYzEvSm9pUDJYQjU5?=
 =?utf-8?B?NFJGRDZ5NnRNU05WOVZiRjBMdHZaY2NlWkJTYk9Bd2hiUEdiZnZkUEhncG8y?=
 =?utf-8?B?YzdsU1k1dmhwVkU1cDZyK0Fnd2tSd2dZN3p0eUxoL0RCSlBDeVYrT0dWRU9i?=
 =?utf-8?B?N0FrczVBSmhqZ3dVM3ZvLzBzYmcrdERBajdwcTFVanhoQ3VyWWJlOTVSTENX?=
 =?utf-8?B?MGdVMXJLbVFBYVNiUER2aUplKzg1Y3drTy9sYzYvT3dNMU5YS0RlQjJSaGg1?=
 =?utf-8?B?RG1sMUMvanJtSEd6bXBGMnlvTTNRMG8walorTWY1bm43UHd6ZDFMTlR6QU1o?=
 =?utf-8?B?M3dRZHZteXYxWU12NlpLRkh2MlBaNzVJVkxvazVpRHhocHpXMmRLblBubE1Q?=
 =?utf-8?B?K1pUN3JLeStHVGVHMG03UGE2Z3gycDhPU3hhWnJSMkczQ0VXMkVnT3AwbTUx?=
 =?utf-8?B?UGpiR3FPQk1keVFXd0hEWEdnMDZaNTJpakFzSU45V0c5azdnbU83U2VtWE00?=
 =?utf-8?B?bk83YjZwbVJmT0JSUW1TeXFldi9KU0VMb3p3MGZJU2h5QzhUL0dSVjg0UnRq?=
 =?utf-8?B?eElIU3RBNDBXYjRDbG5BMXBXaTFZbG9sa1B3SHVXK1M0YzJONUJHSjNvWHQz?=
 =?utf-8?B?aUZMRHM5YXgrdXIzNWJUQXo2NjdjbDNvODFkQWdXTHg3QXhsUjdGTWptTWtz?=
 =?utf-8?B?bnFBalZzR1ZBR2JlZmV3enpTVm5OQjhvZ0Y0WGI4RGdCUU82S0FTZXBOOHFh?=
 =?utf-8?B?YTlHRVNwYnpPemlGMWIwQkh2OElhMUpBUFNQc0pjTU1vVlNuNWdEdU1ZSGlU?=
 =?utf-8?B?RWRITHlpVXFMT1F5emM4b0dLUGZ0MVNnUnhLNDNyTFJ0ZXRTQ1Q3S1lQNXZP?=
 =?utf-8?B?TFk4b2hlWk9NbVkwWlVZZ1BaZGNZZjk2bWFVcUxJdTV3eFpGTlk4ZUNvVi9o?=
 =?utf-8?B?MmdGS09nTTFDb0Z4TUlBTFNlNzJpT1pJSlA5ODhLME8xYnlsenR2dk1FeU5m?=
 =?utf-8?B?NU1FamNQUFNEUXZ5N2RFOE5acE11NW0xeDZZZDdKTlE2eTY1ck1LSjY2d25r?=
 =?utf-8?B?Z0V5VXNBaFkvUFRPTEFIQXFLMmorUzJYWDBETEtvbHBjRnJ5M2E4KzVvWVRz?=
 =?utf-8?B?Ym5yMGJ2ZEVqU3R2MENDK2FhQk85Q2NRR05DbFhVZi9pK3VLaHhUQkc4aEJE?=
 =?utf-8?B?UnZUV2lkWENwV3phT1ptV3ZoMUdPUGI2djRpYnRUUzNqb0xMWFU2dEwxVmJm?=
 =?utf-8?B?am5wMkxWaWRTSUcwemY1Zkl4a3RWS3orRU9ZNThTQVI1SlJXTVFmNndvWWxx?=
 =?utf-8?B?aE1LdHZsd0l6Z1Z0M1hCUExKZ05YMThOemFpeUwveFNHYlVTeXJVSWR3RHBx?=
 =?utf-8?B?dmRERUI3T3ZRZlBjRkV6RmlwRndaNjNGMmJxaVMwTkdYQVRTdG15Z1k2cFIx?=
 =?utf-8?B?TkpTVFYwRFluMCtFNFNQUXhycUdoeGUzSXFOaUdxdHN4eUp6dWhJcDQ3T1Bu?=
 =?utf-8?B?WXZzWWhMSEFWb1pDNlBEYkRBbGlyR1hZZTdKeUxTdVlqM01rRmYyRE9RN01H?=
 =?utf-8?B?ZVRmeklrWEFRNXdxaS9wZnBTT3FoeHlQVnRoTVcxUG5ZRzdNRlNtNDdFdnRV?=
 =?utf-8?B?M21pbzBsamlyV0drOEVEUW9aQUdITE9LZlJ1ZVhKWjB5eVkxNjhHM3puckM4?=
 =?utf-8?B?a05PTmxIYk9QTXhRemhvaHRVQnRUNllYSXBzbVJMYXNnYld0TC82MXc5WWw5?=
 =?utf-8?B?VlhVb2daQ1pHaHdTMGc1SkI5Z0xMRkVib2tyTjJyaGY5dkRUVkRicnFiS2xa?=
 =?utf-8?B?RW1VM0RKMjJ2bEJtTTAvMUlIb1hUYTlFT1AzUDhobHlWMkZ6amFjMmN3UXlP?=
 =?utf-8?Q?s465g5wdjlEtK?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(35042699013)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 13:24:36.2465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff57a3cf-9919-4366-c2ef-08dc75ab8813
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6243

SGkgTWljaGFsLA0KDQo+PiANCj4+IC0gICAgICAgIC8qDQo+PiAtICAgICAgICAgKiAicm9sZSIg
cHJvcGVydHkgaXMgb3B0aW9uYWwgYW5kIGlmIGl0IGlzIGRlZmluZWQgZXhwbGljaXRseSwNCj4+
IC0gICAgICAgICAqIHRoZW4gdGhlIG93bmVyIGRvbWFpbiBpcyBub3QgdGhlIGRlZmF1bHQgImRv
bV9pbyIgZG9tYWluLg0KPj4gLSAgICAgICAgICovDQo+PiAtICAgICAgICBpZiAoIGR0X3Byb3Bl
cnR5X3JlYWRfc3RyaW5nKHNobV9ub2RlLCAicm9sZSIsICZyb2xlX3N0cikgPT0gMCApDQo+PiAt
ICAgICAgICAgICAgb3duZXJfZG9tX2lvID0gZmFsc2U7DQo+PiArICAgICAgICAvKiAicm9sZSIg
cHJvcGVydHkgaXMgb3B0aW9uYWwgKi8NCj4+ICsgICAgICAgIGR0X3Byb3BlcnR5X3JlYWRfc3Ry
aW5nKHNobV9ub2RlLCAicm9sZSIsICZyb2xlX3N0cik7DQo+IFRoaXMgbm93IHZpb2xhdGVzIGEg
TUlTUkEgcnVsZSBzYXlpbmcgdGhhdCBpZiBhIGZ1bmN0aW9uIHJldHVybnMgYSB2YWx1ZSwgdGhp
cyB2YWx1ZSBuZWVkcyB0byBiZSBjaGVja2VkLg0KPiBJIHRoaW5rIHlvdSBzaG91bGQgY2hlY2sg
aWYgcmV0dXJuIHZhbHVlIGlzIG5vbiB6ZXJvIGFuZCBpZiBzdWNoLCBhc3NpZ24gcm9sZV9zdHIg
TlVMTCAodGh1cyByZW1vdmluZyBzdWNoDQo+IGFzc2lnbm1lbnQgZnJvbSBhIGRlZmluaXRpb24p
Lg0KDQpTdXJlLCBJ4oCZbGwgZG8gaXQuDQoNCj4gDQo+IE90aGVyIHRoYW4gdGhhdDoNCj4gUmV2
aWV3ZWQtYnk6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+DQo+IA0KPiB+TWlj
aGFsDQoNCkNoZWVycywNCkx1Y2E=

