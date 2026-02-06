Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOn2C4AzhmneKQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 19:31:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBB5101E69
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 19:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223764.1531166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voQbr-0001gb-Ci; Fri, 06 Feb 2026 18:31:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223764.1531166; Fri, 06 Feb 2026 18:31:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voQbr-0001eA-9x; Fri, 06 Feb 2026 18:31:15 +0000
Received: by outflank-mailman (input) for mailman id 1223764;
 Fri, 06 Feb 2026 18:31:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1voQbq-0001e4-2y
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 18:31:14 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00946907-038a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 19:31:08 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6678.namprd03.prod.outlook.com (2603:10b6:510:b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 18:31:04 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:31:04 +0000
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
X-Inumbo-ID: 00946907-038a-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0ZUQZwStRCM7t78/44ASC442OIW3uCYcHZtDJaORgqzNmynoQ5Yv+/l8La/cZJo58jygiL45W2eJu+3CigJy9wtyrtPCbARJLO8ZjpoWwW6af+jXbVrB9dlz0wsuWs60gZu/d06mk7/xXhe6nv/ZAhPXbc98Z+VjJE5xBpwRwTFNq7Ze5emeQN2oQ/vrCAWSddi9EinYhkEbKpskcRM7JRYiTbaXHh7cG95uADmAl978ewCnCcM+ZLLkYYt2DT9jIjBDJD5aUqQMxYYybwe4FORNSAdS0zfs+KDTuByH3aZASlQBtzdSMchCAhWrJ7D6vfb4KHmtRg1Og21xzsXzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PU9mKuGzTDeoc44ezZO8dk6jHbXJ98spQcPpWZLAc04=;
 b=RMRafY8rA/lvMcaDjtqkT51BdoZSwXYeZuyLrMw+OFUcFlB1U9Y7I6IH8yribWjt3YNY4/Cq1biN3ohKbV43TzoXHz4sjd76wagEP6DK5aLOxbxnSLGjVxltv53pzN1Ces4LtrJ9b7MflRgjX9/z2xXko4o5L4dSAWyn6zV4MU3ep8y2yvv0NI63Q+RknBMLjRoOOeBhhbsCXVZg1SdYIsrrFeJ6ioUkuMhXxHyNCkn7JVfWRZZJP44aOyQFnkM2KiOncgeAm1ocPtNNXY5vTNJ5TBllqFlvM2ujjXEOYpKje4/Cjf+nkipSjbGbSs7FK87N55h1z+zFKY3QKpAF6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PU9mKuGzTDeoc44ezZO8dk6jHbXJ98spQcPpWZLAc04=;
 b=uGJpGwAq+1735ITUiSaLLxIRYx3gxR4y68iPJJPUNrZYgiwf5eSe/AvFcGyIoXjkfsh/fX+0sc7l50/5W12oKiJiATvybK/s5FpNN5ej86MboLvkzX0OFbYoniiYhUiFGSotv6xfGEGAAJ63wkJMgXHOGWPyVK53/brGQXwWC5E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH] xen/kexec: return error code for unknown hypercalls
Date: Fri,  6 Feb 2026 19:31:00 +0100
Message-ID: <20260206183100.28195-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0015.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::12) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 745461ae-47ab-42a7-1827-08de65ade2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEdDd2ZhRW0wcTJObUFoL0hpczNuYit2SzJnMzFmeWdsVHVQSWdaTFFMKzZh?=
 =?utf-8?B?cm9WVkluV0RJN0xGOHU5bVlLUEoyMXFNMXBFdzJIZWFpUFVjc1hwSTMvaDA1?=
 =?utf-8?B?OTFmMWw0QzJnemd2WUVPUjE0bm9heDNEYnd1YkxSVG1pVnFWUUNkQU5JQzU2?=
 =?utf-8?B?UUE5RmlJc0I3L2JweGZkR1R6STZ3amlod3RWN01odmI3UEpqMU9QcUFIQ2No?=
 =?utf-8?B?S1ZWaEpIaTlvT3hSTy9LZWI3SHArb2lReUd6TkJMS3dkb1RYTjQ5WGd4RVdF?=
 =?utf-8?B?Ym9PTnk5bzBIOWNSVkFBeUxaN0FNRUc2M2VJcFRCY1ZDUitJa3FGOVFIb0xB?=
 =?utf-8?B?VlJqb0oydTVJUHJmMkNqVlRkNVFUTGZsNWMyNEJ3Z3NPQkFtM01xSUcyVE81?=
 =?utf-8?B?azNTd1YyNEJGdVhMTllmVTRSdm9vWVh5cTdJanhOb2pYekxSeXBYc1dLamQy?=
 =?utf-8?B?azJJenZvM0g2c2Q5Sld2aEw0a0NveWhXWE90ckJ5MFVrdFlYaDl2Q1hURWND?=
 =?utf-8?B?K2Jjd3FnWS8zbVlXbnQ4ZVFSWWhBTGRqdnVGOFJVZWdTT3Q4MFZVSENsbm0r?=
 =?utf-8?B?M0lSRHhLNHU5SCtUS2hScDVDZXhFT2d3Rm9zcnAxdlFCNXB2dXBHQXB1SXRk?=
 =?utf-8?B?Qk03SXVDbWxWbEthL2M5RzdSY1hHbnFlYWlKY3pINTR3ckVoTUk3Nnhkdy9O?=
 =?utf-8?B?QWpYeS9oQ0grK3RkUzRFQmxsMjlLYnl1UkVpaVpYQVhBd0dtYnRaYzVBS0Jp?=
 =?utf-8?B?THRoMjZweXViZS9aK21ybW1CRHpwazlBYzNLV1FYdXRrM2E1NmIyVi9tYmZw?=
 =?utf-8?B?YWFtendLck5FRVViT2xld2JaTjQxZndVTFZnRU1veWJUVzIwWG5BcStybXBF?=
 =?utf-8?B?SDZEZ25SNlVGSUU5VjNUbm1OZno0UHRXSHczdUFidGYvU3Z1Y2RnYjVva3B2?=
 =?utf-8?B?OUxkNkxYRVFnNnpVYXN5SkVobVhaU0xxR1RyV25lMDY0RnlsV0dsNDBQUUR0?=
 =?utf-8?B?bGlTanpIMitKVTBMbFh3RnRzbWkzTExrUFhWWjlrb3J5NlJsQm1ZYnNHMjdp?=
 =?utf-8?B?QWJ1RHh6MDBaSElaZU9jT1JnYmJjZzZ2QXpVRlhmT3ZtQzN2SDk4Z2R3VnZm?=
 =?utf-8?B?bEx0UlZoVGRWRWVMK2xFM1BtVVVDZFVwTkN0UlpYbG10SUt6bEsrUkVGWjFk?=
 =?utf-8?B?aVZ6VjZmRzdPUGJrckc5VWRKczNiQU83a0syTVROdUdsc1RYc3BVUnZMTGVJ?=
 =?utf-8?B?eWp6Q3YwQmRQK3ZZb21jbkpXMTZsZ2twVkgwU3FmZlZPajcza1ZXZXlEQlpQ?=
 =?utf-8?B?bGFKenFTOHhSbnhhelFyem5raGdOemNoR1BlemFSQUo2SFlqVTdmdUlLYTl2?=
 =?utf-8?B?a3JiSGxOR1prRU1rMnAzRVZCaTFFK1loeUNYazlJcW1yMFZQKzV6VWdDMFlw?=
 =?utf-8?B?ZXVCUHZJejgzS1JveHZjd2gzOFZoMlRBTnhoelBlcmE3VmZ2dVRoTFJOSUZR?=
 =?utf-8?B?WWRjdG5Cd2NJRFJkak1TVnFrcW5wTVdLc0ttck1BREhNQzBxbVk1ZjdYd2dz?=
 =?utf-8?B?Zi9aSUdGdEdjcnE4dWdIbFBMSkc1cEZxZDRvNEFIalpBMGtwSXBhb3RlTm9l?=
 =?utf-8?B?UEJNRHc4UXVpVkNtSUV2TFVGaGk0aEJtS01EMzRUblUzK1MvMDVnL0NUYWZo?=
 =?utf-8?B?UlNWeFduOTVHUzRnWFVrQXhWVnk1WUNPZHhUcHhJV3N4RDIyYzdZSnhoajRM?=
 =?utf-8?B?MHFmWDFvcGFZU08zYkQyZ3pvdy8xWDRGTCtkRlVRZm5XTnM3ZEJkSkZSVGhZ?=
 =?utf-8?B?eUg2YVhlNTRSK01sZnV6cEVoZXhOa29ZekgwZSs0cnVUb1JybS9KS2NpM09h?=
 =?utf-8?B?L2xWczlORGdsc3F5OXdkVUxSTDVOZ0NSczlOM3V4cnpBL0RFNHpkSk5EaGZn?=
 =?utf-8?B?ZkROVUZuZHlkSlJLVGRYT3YxTSs2YzBxR1ViaXdRdHI2bGxNNDNPNExDYnBt?=
 =?utf-8?B?UEVjNStYaTd5RSt3K3RPaFJFVGNiVzlDbGc1b2w2UUljNWxOVzlxYlJnWkdV?=
 =?utf-8?B?OXRNdjVwM3A1OWVxNEQyakkzM2E1L2xwdjdBSmtDZ1NuRFRLMUxUVXd4VUhZ?=
 =?utf-8?Q?yg8Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzkxL1ZSWW9UM0tMNndOOXNFbXU4VUdHVWlQNzhHKzVxS2d6NDJra1hmNkpP?=
 =?utf-8?B?MEVwdFNiQXhEQXZzeTNDWVJpSHBoY3A2U3dQZTN4cnVGN05DYzBDb2hXbDNr?=
 =?utf-8?B?NnRFT2hFaFh5MTZwNFpmdU8xanA2bDFJdU16M1Q0Z2NKR1RrOFIxZ2M4eUxn?=
 =?utf-8?B?SFJKSFdvOEIwcjV2Uk5UUGJPczE1VGpHVzNLUzdKOFV4SjJQR2NhWE5BRmxR?=
 =?utf-8?B?a3dqVStDVEZtalFMRys4dVJCN0piS1kzRURHbDdLcE16WUNPck8zSlpVQXNH?=
 =?utf-8?B?dGFwVVpnTCtLWTZoWnpuNnZBUWRVQnNIT2tWODZ1Tm9zZnBIbUtORmZqT1I3?=
 =?utf-8?B?cEc5YlR3TjFCT1pFSkR2cnlQZEE3NFZMaW9KVTU0cU0rV2E0UkJtWGhPd2V5?=
 =?utf-8?B?Z1NZWXFZd1JFUkJrdmNJRitDTjZxeWZ2UDl3S0tpZjRiczE5NUdTbytIdHFi?=
 =?utf-8?B?ZW8vN0QyV1IxdnJzUkpDT2o5N3hFbVp0Q3BKRjNlT1RORms1cEY4K2F4VGhW?=
 =?utf-8?B?WUcxZHdSQm1Ed0swd1J4dmprNlVXZTdnNGFBTFRxc2YwaU1qekJwZnRSL29E?=
 =?utf-8?B?WjJldEluRERRbStpTTNFcTVKdjZHdTNEaUk2WWw3MFRQaGNEaFppTUVpQ3o5?=
 =?utf-8?B?cnpUREwxS01Sekw4c3hxZ0cwOVhJNDhmWVE4SmhBbHVqbGpDWHErYzNFby81?=
 =?utf-8?B?Z1Q5UWxCQy94dHZub1lPZ1k1T09YR1REd1EwSFFyOW54WUVKK2xnaEl4QWk1?=
 =?utf-8?B?NEJEemJJRG43VzhkdEZTVUdjVFVOaGl3WThTNEY1S2JXeThBYzQwaytDdlF5?=
 =?utf-8?B?RHAzbTJzWTRPN0xEZUpVM3ZJNU5ITG95Rkp5NFRrVXFUZXQxbG44amV3bVhU?=
 =?utf-8?B?V1g5QVd6dGJmeDgyZjM4aVp0d0Q0RFI2cWxINlhscTZ2TGx3NlNzakxJSGhq?=
 =?utf-8?B?NUtESk9EbVJnYlJkYURGcTBiRUVEb1owT2pydWR6S1Q1TkE1bnZFV0duekx0?=
 =?utf-8?B?ZDN5V1VmQ1pON1JnM3RBdDFtSkc4V01VZTRSZk9rNE5wZ2V0bm1Ea01DeEd5?=
 =?utf-8?B?bTJ3Vk1TYjVGbmZYQ3pER0hQa2owUDE4bnFia1NCTDJ6TjFDRUt1ZytCV3hs?=
 =?utf-8?B?UGYvODlVaUxzaW9CMG40ZkFQdFU4TllHQmF2dnJjVWtqa25EMVdqK0I2Y3d6?=
 =?utf-8?B?OVNheVdSYnd0UUlydE1IcVFyb3JDWTRaeEk0MnRsZHFkdzk0Vktlanowbjlj?=
 =?utf-8?B?RUlvb2tIVjFjNjQ3ZzBudStDR1ZwSTh1TkhJT2xOZmlBaWk0UldvTlI0dDE0?=
 =?utf-8?B?VmU3N3JHUElCTFRKdmhITTdVR1dhWlh5MzdYcTJWeVdvUVBNTlVCbThzYnBJ?=
 =?utf-8?B?NUZWM1VVM3M0WXVFZEJ5UGR6OU43L2FYQnRoUmRsVi9JZnRXZXp5Z01LK1ZC?=
 =?utf-8?B?VExsdXFMYmIxYkRCY1RrWmd4Y3hxL0pwLzBPWTR0M0dHN0hxc294ZjJ0YU1p?=
 =?utf-8?B?WlM0NHhyeHRpSUVTWDh5RDVGTTZqY0RTcHpNVnhxR3MrTlhia2gvcklwVFNR?=
 =?utf-8?B?N25BNHkwcW83c3hKSkViSXFWaU1KNEN5ZHI0S1BkT2hTYjR1Q0JGZ1RBS2Q0?=
 =?utf-8?B?Umtlc3FNaEhvTFpKbkI1L2cvWkJNVkhIZXlTeithL0F5a1k5b0s4c2dISnBX?=
 =?utf-8?B?Wi9icjdscWt4b2gwOHU3N1VyQzhuc1FFZ3MxU2l1T0VZTkduL3d1b1JlYm5l?=
 =?utf-8?B?SlRrYmtTZU1tZWx1am96ZE5iNmRsakd6NVVOSEh6MVhvdTYzdXYyMUdWbTdL?=
 =?utf-8?B?RHR3MlV1SkdHQ2NVL3VIOC9GVE1DcjNSTlBpMUxLVUdIMGFtejdVMUxrYWxa?=
 =?utf-8?B?eDIrcC9YMWtiUmRLZ055bGdxTFMxc3dmVis2SmduUDdKTDBhUm50MDc5MTR2?=
 =?utf-8?B?amhadU93RnM5WkJ2ZTZqeVlvQjdIRVlHcUUwRXVET1BrZE9vZjB6dXcrKzdp?=
 =?utf-8?B?WXJXa2FwcWNaL1E2Q2w3TThFa00vZ3ZQZEFWMEM5YkE3N2poblhUd3V1ZEsx?=
 =?utf-8?B?WGxqSGRIRWQ0M3NTd0tId3prTnFJNU1GOThHT0I3QXJzajZYQ25rR2dkNEVT?=
 =?utf-8?B?U1MvendtaVJkWDhNNlZoSk11UGVzQTY5Q2ZUaXQ0bmU3bzZoc01iRzA4UmpO?=
 =?utf-8?B?YTVnSWxROVYzVXVnMy85a3ArTDRvclA0TkNIN1FYekpPV3MxbVlxN25vRVRS?=
 =?utf-8?B?cmJvbzh3a1RHWUFzZGZEYmVLTzNLQkZacjBLd1lCY2Q4K0k4a1NwOHkzQyt1?=
 =?utf-8?B?aUhYSVg4TEsycXprVmN0UzJwR2laS1lnZG9RVkl1RCt4V1FjQVRTZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 745461ae-47ab-42a7-1827-08de65ade2bc
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:31:04.2961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvTtsTabneAWQ6Nu5oJ/LyuD6nz0BmZ4gSiqJqTLYShOJGimE7f1Gtuz3kJgR8Ay1c4O65yhXDCWSo3pwGtpBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6678
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8FBB5101E69
X-Rspamd-Action: no action

Currently do_kexec_op_internal() will return 0 for unknown hypercalls.  Fix
this by returning -EOPNOTSUPP instead.

Fixes: d046f361dc93 ("Xen Security Modules: XSM")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Arguably the error code for unsupported kexec hypercalls was already wonky
before the XSM addiiton, as it would return -EINVAL.  It's however way
worse after the XSM addition, as it returns 0.
---
 xen/common/kexec.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index 84fe8c35976e..8f52c5506d4a 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -1217,9 +1217,8 @@ static int do_kexec_op_internal(unsigned long op,
                                 XEN_GUEST_HANDLE_PARAM(void) uarg,
                                 bool compat)
 {
-    int ret = -EINVAL;
+    int ret = xsm_kexec(XSM_PRIV);
 
-    ret = xsm_kexec(XSM_PRIV);
     if ( ret )
         return ret;
 
@@ -1258,6 +1257,10 @@ static int do_kexec_op_internal(unsigned long op,
     case KEXEC_CMD_kexec_status:
         ret = kexec_status(uarg);
         break;
+
+    default:
+        ret = -EOPNOTSUPP;
+        break;
     }
 
     clear_bit(KEXEC_FLAG_IN_HYPERCALL, &kexec_flags);
-- 
2.51.0


