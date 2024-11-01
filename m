Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146009B9457
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 16:24:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829201.1244313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6tUE-0001Vj-1B; Fri, 01 Nov 2024 15:22:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829201.1244313; Fri, 01 Nov 2024 15:22:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6tUD-0001TL-Uk; Fri, 01 Nov 2024 15:22:53 +0000
Received: by outflank-mailman (input) for mailman id 829201;
 Fri, 01 Nov 2024 15:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JHQo=R4=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1t6tUC-0001TF-Lq
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 15:22:52 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2612::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2769214c-9865-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 16:22:49 +0100 (CET)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Fri, 1 Nov
 2024 15:22:47 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8093.027; Fri, 1 Nov 2024
 15:22:46 +0000
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
X-Inumbo-ID: 2769214c-9865-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMjo6NjA3IiwiaGVsbyI6IkVVUjA1LUFNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI3NjkyMTRjLTk4NjUtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDc0NTY5LjMxNjYzOCwic2VuZGVyIjoiZ3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLse6L7FF3PMJeW6a5y6GFWMNUN3rXnEAu+OP3CwRj+UtPi/T0mGWg7mop3KUBcTRARXvt+ZEV+KuNjgo2FhNml7L/mPFCa4Mv+mQUKsBPsabKnVWohhltsrBoW5mhgTBWTTKssuP0r4yEZFcGrT5t1IfONkJqp8hYFCQ5F7IN1cDUNJe+rvh5/gP+f4S+xXcPI9IZxiE6PaPMAdsVdwQv0U/6rdKbaeRuCT2EOu0f00XKB68Umf0ks5B5DaKsskWEFr1Fp/EL3i+DY3sy64dPV7FUS0ToK/ORKb3ydXDbRCLlvDonCp+zcR8nuSZ+URZufeP31vp4NWT6QvYHwM+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p747qis4hv3q8JtC+6KR77RM2orOOAuQW8MBO9tg8Cc=;
 b=E6viOkfEKNG4kl0xyG1Ai65X7VA8H3TiuzY/fK078Yh9daR9iWn9lF4JS51dgxCc7k7TO2Rai2c3SnZHufN6ntwqT2AjZ3QwN+kcQ7Jb3CgzP6I9RBmE5pF4AUKx2ZLzrvPw5CHhX018KWxN4oC1jLBhCQTzXvfqr9kgYS8v5ijRh2dd0u8JFuIe51LHVH6FghydD3ThreY7kl7zRBqqG1FDz3n2FplpcQTzm8+SP/OElshxlfXj/pzPWJKOk6zUDJKTukV2GovFb4ztK3XagHa1UETm+81hkydWcnkd2HNt8un9Xf/72j5lnUZ3K9FEHWb7ocnr2RNfaD+QS8T5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p747qis4hv3q8JtC+6KR77RM2orOOAuQW8MBO9tg8Cc=;
 b=R5fc0fgksUL+DxxY4W4ldZO/yFbiuRtVYRiMHxRFmt2N7PF20oS5fgniPsrfYvduO6yCyVOIvgoVXYU3b+nAuUdE04yEn+/nCWSr4z6ql2bKSoCrpo0ftGEq5BnPgYzE/9ibvo5pLP8Fy0UK+IAcFicOrKbXaT+FC0BzqM7WYqR73w4RyskcsGaPPBGNoQlTHE/KtO/QDImdYLVD6Opp7TQqdRJi7AKbKYmebddC+KH9g+3ApLC02k1VSsFTMkti9uJo9MEWsv3ZEv7OpUwqNhQnGvdzxcYbPs+A9yqIioT4A4JjlvUigEWBjzsMFBfqikY/o7w6dINmxVoqTfrNQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <59b54859-d893-4bf4-8118-7e4a00e7d87e@epam.com>
Date: Fri, 1 Nov 2024 17:22:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm: Add SCMI over SMC calls handling layer
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: S32@nxp.com, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com>
 <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20240930114715.642978-4-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PA4PR03MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: ba008048-e563-4d58-0ac2-08dcfa890a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzlFby9CRVl0YUFhZHpJSHZLS2hzeDVqb3BLdmFJT2tDMy9oU2lTK0FaTDVK?=
 =?utf-8?B?QnRYQlRodDdXSEMvSjB4OFF4VGpvZzBLenpQMkJ1b3AxejhneE4rWHNyemQ0?=
 =?utf-8?B?Nk91bWhxcHlqMkxLcEFqa3RjcjdYaU1HWGhEd0VMZHVHTW1LWVdrOGUwM2xz?=
 =?utf-8?B?aU43OE9abjlDbEE5NmZIcHhBVk5FcUlna09yV3B5aVBwSjN3Q0h5Q0l4UEZR?=
 =?utf-8?B?QjUrTE1jMVQrTFVoS1hqWW0vMVhkU0FDVEVxbStxbjlpNTk3aitHUERrRnhl?=
 =?utf-8?B?NDVUTit5ZlRsSGZ2QWg5eWt4NTJtZ3UyRmxQek5nL2hISkI0NjhzUjh3aVlG?=
 =?utf-8?B?cVE1eHcrRHdld2pDK0twajV4eVkveXBXTXN1TWdyMjQrOHBBcUlvdGZNT0tu?=
 =?utf-8?B?Umpuazdhck43SzR2ZUxiY1VKR1BEeDJBMjU2aHFsQmxTUVdFWEdXbWhpeW0y?=
 =?utf-8?B?a0xWdHJlM1FPcWgweFl6ZGdsd2J4YU5uNDloYU9uZzJtcmRkWkhHOEZiZmhP?=
 =?utf-8?B?RSszQjRXRSt3VWpLNDZyTm9OUWk5ajgrZnhzSHRHL1REdHVxQXVvSnBESDgw?=
 =?utf-8?B?U2paWWtSRjYvanFqejg0alhZM05sSTlQbCtoQVpkRHJUdTFJcnE1TjVxU1B4?=
 =?utf-8?B?aDZnU0tuTFF3M043VERxaUpoa29MNXJpQWEyc1lDVFJYL3ZkUTh1a2dwS0xT?=
 =?utf-8?B?dHZRekNYMnJoN3BoZTJtam9HOU9XN2wwVHIrdHdTVUNyNXd3b21MczlQdVN1?=
 =?utf-8?B?QmUzUmhNeHYrSlJDUWUwMTdDU2xwWkwwdnk2NmNLUVNFT2szYnIwQk9PU3VE?=
 =?utf-8?B?LzlJTHpZSDVyOEdtbU95UjByWk1VckdrVVB0M3hhNWN6ZjlmT05zZUdrYmpi?=
 =?utf-8?B?SzZnc1dOS1VNSlFLeHZIQzNkMmNXK29xU1B6SDQ5SFBGTFhFTHB0T2tFWm9D?=
 =?utf-8?B?U1lrWFNVQThPdjFJNldqalNMc0JMdzdrNTJJck8vUHc3QURLKy9lUTFCMmlL?=
 =?utf-8?B?S2ZXSEZ5ejMwZVhGa2d3eDVUcWozN1N0ZjFkYzk2OEJUZ1pCc0xsRTd5dW5m?=
 =?utf-8?B?N1ZCVkRvVi9qNW50U0V0RzNXRXhDTjg5eUVNNUlPT2VmUXhzVnJ0WXMxdXFq?=
 =?utf-8?B?ZC9yUGtjZTdDdUVoSHhCc2k0bkRuUHFHaWVJTTdJOEdwdWc2cFJlNnh3QTV5?=
 =?utf-8?B?eERRUTlmamdFSEJKY1Y2S1NxMW1SK3BSbkhONjU5Zk1UT1RoYUZoVDhoZEt4?=
 =?utf-8?B?a25qZWpmSkNSOFpxaDBKQUZVVmxtdXh0Q3JkVU5BZ05NZ1JyMkp6cXIwSXQy?=
 =?utf-8?B?NWNlTmFJTFpiL0J0NUMyNzZGR1NsL0p1YXV0SkZ0aFZ3MmpYWXF0VGJKQ2tu?=
 =?utf-8?B?WG5ZNDM4UHQ4cTB4dGZLOElKVWpZbFJ1MFNMTU5VVDkvOEwrNGdGRkNROHVX?=
 =?utf-8?B?MXB4WklOc1pkc0N6ZHZoTUNLZVY0TFpvSW1NSjZNWXNCRG9KK0JlbFIxajJr?=
 =?utf-8?B?TkxFL2tIazFqNmZ1UnN5TEo0WEZWVXprNjRVNlpzK3UrT2RVNUpPVjZFRVZz?=
 =?utf-8?B?aTdTT1lMSWJQeFE0bHAvVjU4MWxkRU01bnFlajd4Z1lGQmlKV0JEd3Nqd3d2?=
 =?utf-8?B?b1ZoQkFCc1BjV25jclUwZXI3MTByV0J6YmNMdFBudmVycW11UklUSEZVbkNk?=
 =?utf-8?B?bldmYmlWcjlEdlc1bVdoelYrL1U5dEJHVnpZTGZ0RDhVbW1aUGIvdzhsK0Rt?=
 =?utf-8?Q?Uk+GglHoX8NyC6ihUpeOHOOAy6+cmumsb6sqrwu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0NiVXBPSGIrRndDbkJ0NnZ5VmV4RjJvdXovVURyeGFHdVk4eWoyWW5QZmdu?=
 =?utf-8?B?UjR4UDBHNTZRVW1ZM1laY0pwbmFPWUJxdW40Tit3ZWRIaUlYR1dpeitLZHFv?=
 =?utf-8?B?dWpEK1h3ak04ejNhSGIwK1JLNnJ4Y1JibGJldmg3TGs0WU8zYzZKcE15M3hX?=
 =?utf-8?B?YXJ6TXRJWVcxd0h0YnBvazN4VWxlNG1DUEdiSmFObEZGV2RqVCtVNHdsREZY?=
 =?utf-8?B?MzdVQ3FqbnlXU3FTY3ptbzBtOWE4dXF2bkVKVHhiMWFTUlUvU25xQ0k2YXlY?=
 =?utf-8?B?WmFwaG1ZbzJ1WWk1clI2cFBsSmU3b3VNeEZwYWpZa0U4NkVhMjR2dFVWOEp3?=
 =?utf-8?B?UHBCaXhmL2d6eUhVcmpHY2dtSHk5eS81MDVRMkRHL1B0M25yYUdrQ05FRGZW?=
 =?utf-8?B?Ry9mb3ZNdytadHZvOVpaQ1lwMTdBQmFZNmlSQ3BPOGlQQ3dOTGRvQTI5cHdK?=
 =?utf-8?B?d0tMeGxjU01hK0c3c055L3NiL01HQm5rVC9tZXRhRnoxcHNUb0lpUkF4Vy85?=
 =?utf-8?B?TVh3QjBSUk45L3VKbnV1L1ZMRU9LOC9xR282SldTZ2c4cDl5UkNqN0lFeXNW?=
 =?utf-8?B?eUpwNVJYTVpHd2Z2d1hVbUkwREJNQmtSUEwxbUJRYlVDQXdNVWVuSkp0SHcx?=
 =?utf-8?B?Y1FEWmtkQU96S2dXMmNQbmFuTlI4bldiTURVTFpNdnBxQjRoOUt5LzJvbGE5?=
 =?utf-8?B?MU0wZDBpQjlrOUREUDJGTUZXZHpwQzdlQ3RLa1ByRlZZemh3ZndLaGVqRmdY?=
 =?utf-8?B?c2M0TFFwMzhvZnJMbEJoK2x6VDRYcmorMHpzcGFoM01lYVl5RnZHc2l1UzQ2?=
 =?utf-8?B?VmlobUdpeEtBL3BnUkZ0ZW1wd280UGFySXFNc1QxaGJ1RFVONEpJNHc1OEpC?=
 =?utf-8?B?aTRCS3JYcVRkS202RTFERk5mR3NrSEhpMTBKTkE3NUhsOTdxcldWWDhoMjVK?=
 =?utf-8?B?NUlLREc3OE1vZjNRVEExanYyU2lDNkQxTndlaHRGcHBaWFZpcjVLTXdhdHBP?=
 =?utf-8?B?dWROM20rN0FLVzlhajJHbmxmdkFhYlVESjQ1UTV6Zk9PWmxVZ2lqTGFXNms3?=
 =?utf-8?B?Q3pFS2tzVEVSQm9BTHVnQXNxZTc2U3JrRTNnS20yWk43ckpsMTJTNExEQ2lv?=
 =?utf-8?B?OTgxMGhYTXNkNnM0bEtVTVZPbWxRTVlUbTdxZzFBT241YzRQb3l4V2FYWUtQ?=
 =?utf-8?B?MkFZeTFaVUlpSmdvZ3ZYWm5tVGhCblVwa1hud3E4QXF1Ui9ueFg1YzBENG1p?=
 =?utf-8?B?WmRBZTJJdzBTY2xMdWVVNVhxdURUbkgwZFJEaUZZdG9GQWlUTnVlZjV5S3ZI?=
 =?utf-8?B?RkIrOGx3d21CenZiRDJyR2s4UmdmTUU0a0M4OHdmeVZIdm5McG9xMzJtek55?=
 =?utf-8?B?WldZVE13ODd5WVpVeVNzOEo5ZVhJYlFvQmFTdVVRMFRKN1hOb0Vpb0NDRHdj?=
 =?utf-8?B?ZGdybWUwUjVyaVQvOVRaNEoxTmJiWkwyaUZkU05QdmZpR0JuRnBqbHlPUlRI?=
 =?utf-8?B?citZWEtRZXQvUk5OeUVJOHF1QXRrT3NVMFBQQ1ErRjF4TVRTYlE1NlRYbGRj?=
 =?utf-8?B?Z25VUGNNdGtaeU0vT2VncEVqOTZGcDB4RlBOQlZMQVJYbVg1d1BpWkljM1pU?=
 =?utf-8?B?ZVd0U1JwbHgvSXIyclFJU3hJdXFBT3VLTitBRk9tU09wVDd2aDkxQ2htOHI4?=
 =?utf-8?B?MFdDSEUxbXMrTjVzaHR5YU4yZ2Z1by9JNk1wV2czVkx4eEszNlY5V1hZMitY?=
 =?utf-8?B?dk9ML0JkSk9kU2owUTAzSUs4cnNKQ0pQbktITGxjbWduZzlldzBySVB2Sk5Z?=
 =?utf-8?B?YkRBMjkzL3hYakdYWHl5Z3JNaGF6MW13VjJBTVRsSU5xSjlldHdIMHNNMDJX?=
 =?utf-8?B?MGsvT0VybzNHZ1FKa2NDUUJwZmMyalpDbE1peld6Mmh6eWxEaW5BNzJNeDZr?=
 =?utf-8?B?ODM3L1g1Q21ibG9KOER5ajZCRWNsWlRKeTdLNzZQekUreVdDd0tkWllkM0t3?=
 =?utf-8?B?NW9WN0N0LzZnYjVKMnUrWnUvR05HZGR6a0w3enRVUkgzRlYraEtmMWg3eits?=
 =?utf-8?B?QUpyREQ3QWhxY2NhMmcrcXpiQm9YMDN5RkpEZ0x3dWMxTUNFd21EeUVWeUtl?=
 =?utf-8?B?eHRlaWZERHk0Z1Y0andGNkpPWWdreU9aYnZHVlVNWXBFUkhHYW5YZFRacDFT?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba008048-e563-4d58-0ac2-08dcfa890a13
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 15:22:46.7440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYK8Mq3rQkLeA1MDWJbzk74RqMYf4Ls4iIKwfk4Zv9rQo7yBvCvP3BlFnVBdfhbsPpCVKdKrgwmymQ04bed9ycHrTTYJHkOY0leX9BGv77g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7136

Hi

I'd be apprcieated if could consider my comments below.

On 30.09.24 14:47, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Introduce the SCMI layer to have some basic degree of awareness
> about SMC calls that are based on the ARM System Control and
> Management Interface (SCMI) specification (DEN0056E).
> 
> The SCMI specification includes various protocols for managing
> system-level resources, such as: clocks, pins, reset, system power,
> power domains, performance domains, etc. The clients are named
> "SCMI agents" and the server is named "SCMI platform".
> 
> Only support the shared-memory based transport with SMCs as
> the doorbell mechanism for notifying the platform. Also, this
> implementation only handles the "arm,scmi-smc" compatible,
> requiring the following properties:
> 	- "arm,smc-id" (unique SMC ID)
> 	- "shmem" (one or more phandles pointing to shmem zones
> 	for each channel)
> 
> The initialization is done as 'presmp_initcall', since we need
> SMCs and PSCI should already probe EL3 FW for supporting SMCCC.
> If no "arm,scmi-smc" compatible node is found in Dom0's
> DT, the initialization fails silently, as it's not mandatory.
> Otherwise, we get the 'arm,smc-id' DT property from the node,
> to know the SCMI SMC ID we handle. The 'shmem' memory ranges
> are not validated, as the SMC calls are only passed through
> to EL3 FW if coming from Dom0 and as if Dom0 would be natively
> running.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
>   xen/arch/arm/Kconfig                |  10 ++
>   xen/arch/arm/Makefile               |   1 +
>   xen/arch/arm/include/asm/scmi-smc.h |  52 +++++++++
>   xen/arch/arm/scmi-smc.c             | 163 ++++++++++++++++++++++++++++

Could it be moved in separate folder - for example "sci" or "firmware"?
There are definitely more SCMI specific code will be added in the future
as this solution is little bit too simplified.

>   4 files changed, 226 insertions(+)
>   create mode 100644 xen/arch/arm/include/asm/scmi-smc.h
>   create mode 100644 xen/arch/arm/scmi-smc.c
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 323c967361..adf53e2de1 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -245,6 +245,16 @@ config PARTIAL_EMULATION
>   	  not been emulated to their complete functionality. Enabling this might
>   	  result in unwanted/non-spec compliant behavior.
>   
> +config SCMI_SMC

Could you please rename it to clearly specify that it is only dom0/hwdom
specific? Like SCMI_SMC_DOM0 or SCMI_SMC_HW_DOM.

> +	bool "Enable forwarding SCMI over SMC calls from Dom0 to EL3 firmware"
> +	default y
> +	help
> +	  This option enables basic awareness for SCMI calls using SMC as
> +	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
> +	  compatible only). The value of "arm,smc-id" DT property from SCMI
> +	  firmware node is used to trap and forward corresponding SCMI SMCs
> +	  to firmware running at EL3, if the call comes from Dom0.
> +
>   endmenu
>   
>   menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 7792bff597..b85ad9c13f 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -45,6 +45,7 @@ obj-y += platform_hypercall.o
>   obj-y += physdev.o
>   obj-y += processor.o
>   obj-y += psci.o
> +obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
>   obj-y += setup.o
>   obj-y += shutdown.o
>   obj-y += smp.o
> diff --git a/xen/arch/arm/include/asm/scmi-smc.h b/xen/arch/arm/include/asm/scmi-smc.h
> new file mode 100644
> index 0000000000..c6c0079e86
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/scmi-smc.h
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/include/asm/scmi-smc.h
> + *
> + * ARM System Control and Management Interface (SCMI) over SMC
> + * Generic handling layer
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2024 NXP
> + */
> +
> +#ifndef __ASM_SCMI_SMC_H__
> +#define __ASM_SCMI_SMC_H__
> +
> +#include <xen/types.h>
> +#include <asm/regs.h>
> +
> +#ifdef CONFIG_SCMI_SMC
> +
> +bool scmi_is_enabled(void);
> +bool scmi_is_valid_smc_id(uint32_t fid);
> +bool scmi_handle_smc(struct cpu_user_regs *regs);
> +
> +#else
> +
> +static inline bool scmi_is_enabled(void)
> +{
> +    return false;
> +}
> +
> +static inline bool scmi_is_valid_smc_id(uint32_t fid)
> +{
> +    return false;
> +}
> +
> +static inline bool scmi_handle_smc(struct cpu_user_regs *regs)

I propose to add "struct domain *d" as the first parameter to make it
more abstract from Xen internals.

> +{
> +    return false;
> +}
> +
> +#endif /* CONFIG_SCMI_SMC */
> +
> +#endif /* __ASM_SCMI_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/scmi-smc.c b/xen/arch/arm/scmi-smc.c
> new file mode 100644
> index 0000000000..373ca7ba5f
> --- /dev/null
> +++ b/xen/arch/arm/scmi-smc.c
> @@ -0,0 +1,163 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * xen/arch/arm/scmi-smc.c
> + *
> + * ARM System Control and Management Interface (SCMI) over SMC
> + * Generic handling layer
> + *
> + * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> + * Copyright 2024 NXP
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +
> +#include <asm/scmi-smc.h>
> +#include <asm/smccc.h>
> +
> +#define SCMI_SMC_ID_PROP   "arm,smc-id"
> +
> +static bool scmi_support;
> +static uint32_t scmi_smc_id;
> +
> +/* Check if SCMI layer correctly initialized and can be used. */
> +bool scmi_is_enabled(void)
> +{
> +    return scmi_support;
> +}
> +
> +/*
> + * Check if provided SMC Function Identifier matches the one known by the SCMI
> + * layer, as read from DT prop 'arm,smc-id' during initialiation.
> + */
> +bool scmi_is_valid_smc_id(uint32_t fid)

I do not think this API is required at all as it's driver's internals.

> +{
> +    return (fid == scmi_smc_id);
> +}
> +
> +/*
> + * Generic handler for SCMI-SMC requests, currently only forwarding the
> + * request to FW running at EL3 if it came from Dom0. Is called from the vSMC
> + * layer for SiP SMCs, since SCMI calls are usually provided this way.
> + * Can also be called from `platform_smc()` plat-specific callback.
> + *
> + * Returns true if SMC was handled (regardless of response), false otherwise.
> + */
> +bool scmi_handle_smc(struct cpu_user_regs *regs)

[...]

I'd propose to squash patch "[v2,4/8] xen/arm: vsmc: Enable handling
SiP-owned SCMI SMC calls" to clearly show how API interface is going to
be used.


BR,
-Grygorii

