Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6556329F5
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 17:48:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446794.702611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9yB-0006wt-FC; Mon, 21 Nov 2022 16:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446794.702611; Mon, 21 Nov 2022 16:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox9yB-0006uW-BS; Mon, 21 Nov 2022 16:48:31 +0000
Received: by outflank-mailman (input) for mailman id 446794;
 Mon, 21 Nov 2022 16:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qFi4=3V=citrix.com=prvs=317825b77=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ox9yA-0006uQ-AX
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 16:48:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 510f4f17-69bc-11ed-8fd2-01056ac49cbb;
 Mon, 21 Nov 2022 17:48:27 +0100 (CET)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Nov 2022 11:48:21 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SN4PR03MB6781.namprd03.prod.outlook.com (2603:10b6:806:214::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 16:48:19 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 16:48:19 +0000
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
X-Inumbo-ID: 510f4f17-69bc-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669049307;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=cK4n6ewWgm8jKlO6BsummbS5B6NZxoFXAz6FPcIK/QI=;
  b=Oz5dZNQF4HN6B/DiRWdX3aVeNRtEUi0gTT85fJbG1KRkbt0eUs+iWR8b
   p1DAmPKfsQbCsEC/k14I8gVWk91SXYzYrLLbrYJRx9hF3UZ6uW6KxzN+s
   h6aH+kcnRG2nO396ZB2ErnJiYlwmJkQOzFLmcJQtHO24rXhwJLxPfrD10
   4=;
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 87810426
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FBdvmqNQDnT9XqLvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUonhTIFn
 WdKWDuGaP2DZ2HyfNFzaY6+oR9Tvp+GmtMyGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5AVmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vlpXU9W1
 8EcEjo2NheC26WG0aymZ+Y506zPLOGzVG8ekldJ6GiDSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujaDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toi3837eTx32TtIQ6TeCi+fB63n2qwjIXLgZRdAG1gtWhhRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4A+A8rQ2A1KfQywKYHXQfCC5MbsQ8s807TiBs0
 UWG9/vrCiZoq6a9Um+G+/GfqjbaBMQOBWoLZCtBRw1V5dDm+ds3lkiWEIYlF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:eP9X86o9BAyLsAvFlAAu0UAaV5tBLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 xdmstFeaHN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMD2CAJsQizuRZDzrcHGfE2J9dOAE/d
 enl716jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kfEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDymIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/L8Zan4pWfjbQ9kJl5bhHoe
 t29lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nteIIlXRQXaYXdbcUh40C+0F+FosGAUvBmfYaOd
 grKPuZyOddcFucYXyclm5zwOa0VnB2JRuCSlhqgL3m7xFm2FRCi2cIzs0WmXkNsLgnTYNf2u
 jCOqN00JlTU84/d8tGdag8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hwzP22eaYP0IA5lP
 36IR9lXFYJCgPT4PC1rd12GkinehT/Yd2t8LAS23FBgMyzeFKxWhfzCmzHkKOb0oYi64PgKr
 OO0altco7exFvVaPl0NjLFKudvwFklIbgoU4UAKiazi/OODLHWncrmV9uWDIbRMF8fKxPC6z
 04LXLOGPk=
X-IronPort-AV: E=Sophos;i="5.96,181,1665460800"; 
   d="scan'208";a="87810426"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dC0+mc9sSBchedzBzcJtUQh+rKksYpZvYvs8eGLHiBow09lDb0uJbRevVVcvUM3HkAtSOaOPBOPOnedq0mY3W4/JjozJsLYP6IjZ7OqsBs1+fj5qmCwtyVboGJUwNKFy3NZUYeY/Y81TjC2I8FCoUbwfbgkZ/GzL9ELo5CLeejLGimw+YIsJ9IiOI+amewpwRVGu3VdcbKdoJIsXN506hkdMwiI6LggxQcxTfvKvdTuf1bfLkbRnBszbtnTjuowO7XA481rujjqEyg65DCCHD1LKOUDCNznb3tAcOjV/Ysy0AEtV0s1PqFjfwje8BbTM0al35PNmhUl4c99lAF1cfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qL8ehkCJaIYXdYnKzFISbnqCkUUCDtOxfQ/QkHU4+28=;
 b=ANCyyRxuHfIY61b4Q6eBPZLZ8sHtADVUDBDjEsyXkCSXEBItCjCHlsaEo/7MWYh3vixQt/lk+jyC+ckHIyMqIr56bDlQrplJo4Bv3B7yMmjRb18+XmHW9oHdbeR1Pz1zOmo/MYDWblBVaT6mjZ4DbjkQSA7dQfsnSXo+mu2DPEP9+7vUKAgXOj+LxKZjwt9Vw5ZsZihjC76pODle3lmlRS/VCMYbnHBQU/NmtDNcjs1rJSmAAdzvk7fe3fz2L/cWKqYxYYnGm9QGOAKSdndKRCXB+YV1fYhXJec5iJM2wjgHuWaL6FLg4TT4jCdmVK3jQ4AnhTqQS34ziujtcAgzzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qL8ehkCJaIYXdYnKzFISbnqCkUUCDtOxfQ/QkHU4+28=;
 b=s/afmezUlDFEcc1vT72HA5pV824DCJ08HRI2B9GjpFyD+ZG+kHIE8OgIge8Ssn6Q1EaDIQE6vdA5PVMUrjlYXw6hNSjqHY0+lCha1urnL6M1UHeYL2WNfwSJJikjCeMfU7r2PAd4owry+L2a3nSZ5aXKSF27mqUZ9jqmWYVjNnw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 21 Nov 2022 17:48:10 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: EFI's -mapbs option may cause Linux to panic()
Message-ID: <Y3uryky3urmQlIjs@Air-de-Roger>
References: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60663f81-09cd-e46b-bb94-1afe50519086@suse.com>
X-ClientProxiedBy: LO4P265CA0052.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SN4PR03MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b580b67-b308-4372-e6f9-08dacbe02f7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7d1oLo8Q6hZjzXUnlPReYJuYgs+3rNPOJXiUwgeyjGUmkXOwjcF0K52SQsYvq9NH0Ag2LQ/o9nSBAiIqEbOM9N+OIIN0OnQIIPCRNqaSHLUNHl6wnUKWqSI32irJnVSedIyE0bWDkKd9kaYXgFxG95bWcI+s/XpVcStViMg9ouIsdeyEJQZyqY8+097Pfl1FeD0y011LqFv4+5QItIr3xSxGuR5BKl9GfP37gmtPBeW3ZLY3g8kz33naE96uQM0G6zIF7z5uO1I5q1cQ0PtNgYLqvMST7B9n7XO/qoG6S0LXDlIjFSZqcC8kkkpOs3gFyDnsVR8JK6Q0BkoOPWHG84dJ9Gh9wS0pbBF4JuFtXVbPk1ON9cE5XxsiqwWNZDEsnE1N8sPhonsgjJ5+bU5Wu9/t25DLvuWiwezjRlL9y2St1s/PwIhSNDSyi3CTfC/+WSEcG7pjyHa8qH4M8kbDqKwd71rK0MV7Y7J8TwQwgHaVGE+QSc9PdlQxKKDwtcSrmpfcRi3xmPEDYv9ZIwjyPgDrG3QNoGhGxLbs1dG9eJhBe5eVdK5otrMlgoK56rYOJwVdyvJvCt7a/04krmr8dlBDq9+d6inQK+7YspPGLQl/i35MukXiYeg7aTIFEDMIVUm4fOMz0MgD2k/lyO4agA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199015)(5660300002)(4326008)(9686003)(66476007)(66556008)(8676002)(41300700001)(66946007)(316002)(85182001)(6512007)(26005)(6916009)(54906003)(186003)(6506007)(8936002)(38100700002)(82960400001)(33716001)(83380400001)(2906002)(86362001)(6666004)(107886003)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWdVOGtwZFN6UjJRS2FVaU1pY1FtUThkd2tpM05NNVhiR3cyWXlRTmZvZEFq?=
 =?utf-8?B?V0Nwc3VaRGc3QVFYOE9KR21rejNHSmxkWU43R09XTnU4eDJ1am53YUViVytM?=
 =?utf-8?B?Q1NEZ05IS0xrenRnUVZVTThwYUJkYlJhTG82N2pMcWI0azViUnlGcnBWeDVO?=
 =?utf-8?B?VC84NGlQNnAzUk9KMWNZT0h2UWdNOWw5eUFnWHFJU0E0TU54L0Rqc3p2VEhK?=
 =?utf-8?B?ZWdjL0NWWlRodUpPbkJNc2wvbmVpdmg0TnZONXNRZStBaDVPTVVQWGlXcDhM?=
 =?utf-8?B?c1JaRE1ySTZoaGQxZXpIUUo3MUpqTTg5OWRSS2dUUEN3VUppYktyajA2MmFq?=
 =?utf-8?B?dmh5MzY5aFBZYnZzc1FnRUhkMjFNU3lhaUI5TVJQb1RhMUZmMFd0aEJhS1JU?=
 =?utf-8?B?blJVWUpRRCtNYkxBcE1heGNoYVlwU1llWXhSWkZmWEpiZnk1enR3K29WQVN0?=
 =?utf-8?B?Y0NyNmNUSkd4enhtWk0zamcyK3JUUWFKQUJMdlhwc1FzRDQ0V20rbzZsS1pr?=
 =?utf-8?B?U25rdUp1a21LdkxpdjhpbXlWUmViT0xTQ05PaXlobzN0b2dvVGtZemdSOXBk?=
 =?utf-8?B?bEdjVUZteVlVanRlS2tQQm94M2RPNUpoQ2c5dW5OZHVPc0dtNmJIbnZvMUFS?=
 =?utf-8?B?OEMrT08xSGUvRiswTFZjQnQxdVNkekRWVW1IelM3ZXJ5bThpYi9kcmRTKzlW?=
 =?utf-8?B?MTU2UjZRVyswOHpiZC9uVUd5eHU3NTNTc2g3MTFXR0VtRzM5dVcxUGxCMDdX?=
 =?utf-8?B?Mm52TGtpeTAzMXRvT0tsU2dzMzBGUkZRTkczcDJMVFZBT2RTL2tzVEFCdXZI?=
 =?utf-8?B?MjhzQWZJOFg3THdCN1BVRUZZNEQrczdFNGtubUh5NGRtdTZ1bG1IdnMxeFMv?=
 =?utf-8?B?eVNyWU1TWUdDWkMzSGhIdzVRb1JBaEg0OUREU0VLc2k3V0hQazlwZXd4b2Zo?=
 =?utf-8?B?WEd0aWxSaVlrMGVNZ3dDbWxCTzB4UHNtRWNrbGg0VE1jMGk5WmtIQ1NGQkQw?=
 =?utf-8?B?U3hZUzVFRGlCSGo5ZFFidWlrYlo0cnQrVzJjV0swQnJVa21NUlY3RS8xa0Fy?=
 =?utf-8?B?NmpzQ1JRMDh3OWlyT3R6OWRaMDI3SXBaQ21wZmZHbHVtemtSQ05KQVNCSjFN?=
 =?utf-8?B?WTNscnVjRElqSkNYSyt4UkluQzRUWTZCWCtCR2pGYjR3U3FBMXczYVRrTFpU?=
 =?utf-8?B?ZDRYR0xPK3c1azRVcy9ad1FjK243aU1OSnkvSENGZmVJRFdiejFhQkI4em9z?=
 =?utf-8?B?RzJmMXZkaU41K0c2S2FrUGNzemg5MmFreFFxeHdiTmdxZWpoVnZCRHRscUFt?=
 =?utf-8?B?RjNFZmZkc2JCNFZhRUZ0S2VxUXBQRFZjNmZZVEZ4L0ZJZk5aclMwbkZhTTZh?=
 =?utf-8?B?WUlIWWZsUmFJN1gzRElsL3ZwK243aWt1WnJOdW5FdllFcU96eXZhc21GMFpX?=
 =?utf-8?B?WVVDdXBDRDFrQmJRMWJDWXZ1TnhHTjBsTmlRS3dGSjdFSVB6YlJnYk5hWTIx?=
 =?utf-8?B?cERKYSt0dnExS0x4alpjZjB2Z2JCNTJRQ25KRERoR1N0cGZsYTNXRW9DYnpz?=
 =?utf-8?B?Mkx4UlphVy9uTUlGeEJnUnpucnV6RllrT3dLUDN0MjUyQWxlUllzY2JsWDF4?=
 =?utf-8?B?RlloeGNqQW1RdHlwOUVCMFNPYmVtQVpjVmVOcER4NVlia3VlZDU2SUgzSkxI?=
 =?utf-8?B?bVJha08rR29zcVhKNFZWVng2ZlB3RnBXWnRMalNLTmZacVp0cHhrRUlhNEl3?=
 =?utf-8?B?bHRKSjZ1YkpMZ2NQQjV1YjF2alc5TjRITGo2dGRQSDBiNFl5TDlINUlVanVZ?=
 =?utf-8?B?T1NOOWhZa2IvUktSakFYUU4zOGlMQjBHK2pjeWs2YzlxTkpINzY1VTZKYmwy?=
 =?utf-8?B?WUVEcmd5WVdqOEJER3cvQkhjOUN3WTNuTUQ2N0NMZk53SDBrYnljc3JudENp?=
 =?utf-8?B?cmFpQkVZeGFsTXBYT29rV2MrWWZXSHRMbVlXMElUMVpReXVic3o5WlZnY3BO?=
 =?utf-8?B?VmtRS3VKOGFUbjM0QlZKRTcvRGNWRDY0LzIxbjFjQnhMUWE1TzNpQjFpb05W?=
 =?utf-8?B?VDdLOTd6dDlFQ1hNbVJvdVljMnhOMWFFNU9WUUZQWWRUUWk2U3o3RDN5Mmlv?=
 =?utf-8?Q?RRd2R6rv6dkhU7QV8hE43UjLE?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DKAxLgjPJbYWsa10CveSYLtbCgRQAqsCxtQQyVoVnPzcRsGIr5eslchPa1eG7oG+aY5sXbXdepdWNl2gAhj8cPHKwH6f2y13nPyQ9iTrppo4qSzCphUlKaaUtdLPhkIwbpRYYXMhjF9+Fut6YzK0oxINIlN7BEkoSjPvPj36pGEifF18gGvNQ91KTwAqOnX682cfoPMJJvYE8U51Kx75z16WI4eLSJHuaak7nmZ0c3qlYMhesN8StHjLWO4H2vb2qmKid7JiC2TzCwQQH8tzcWvvUUu02yMWTHZscxAOco9s17a3i2DEjL+hPw17Y5cRefgFbgRQ++fKTYp94I9+dRTlGeUrWYtQVMwRL1XQEC0YV17h1XKsCABZgRXG1YD21GzOnPDCIypOB1uh6Vj9ZED2AHdg31qMHhsk6nH+vi+17LZVbajFvyadECxZucrKYq5SpK/aCflVRpl7S+Xk6ozp8jqsLB2awfTIFxvbaWmZt0P841CIDtCYaXcxISX3o3xk5A0205E44N/5z5qgLG2cRDXnRL93qmOiRCBES7+l9UAH5q0PCfXSKVWIU5hy0IIyIi7Nyl9yVDNw4TUNhiFKiCLr0zt+wVHgukJnwhnsgcBBQKoz4OlyayzoKG+qoiKWTEuJynkE3+oEbsR+Nnzu9KP7CsO9Est1csDa8j8eeYlKc6tWAJvOjTxCfiKaQfV/CwNUrhhw5WzuTp39Nwdg8GCywKLpEI+aGem0TtqfInwvVrycB/WCPCJd/SkjGZLBDSX/VsMJbMmBR0ry9sPv21Dvs+qJd967YOJGW7DsqUNouOmA2CYvBKM3k8uMPlpLLQKYiPD+UnahZvgGbA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b580b67-b308-4372-e6f9-08dacbe02f7c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 16:48:18.9569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flDbE6xhAwACwFLKcMiPv2nRR9ag+oyRDT4Utx6jjcJ5I64+T1p5GNnkaZFhg05uEa9YoMBg1rcSMt1z2r2WnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6781

On Mon, Nov 21, 2022 at 05:27:16PM +0100, Jan Beulich wrote:
> Hello,
> 
> on a system with these first two EFI memory map entries
> 
> (XEN)  0000000000000-000000009dfff type=4 attr=000000000000000f
> (XEN)  000000009e000-000000009ffff type=2 attr=000000000000000f
> 
> i.e. except for 2 pages all space below 1M being BootServicesData, the
> -mapbs option has the effect of marking reserved all that space. Then
> Linux fails trying to allocate its lowmem trampoline (which really it
> shouldn't need when running in PV mode), ultimately leading to
> 
> 		panic("Real mode trampoline was not allocated");
> 
> in their init_real_mode().
> 
> While for PV I think it is clear that the easiest is to avoid
> trampoline setup in the first place, iirc PVH Dom0 also tries to
> mirror the host memory map to its own address space. Does PVH Linux
> require a lowmem trampoline?

Yes, it does AFAIK.  I guess those two pages won't be enough for
Linux boot trampoline requirements then.

I assume native Linux is fine with this memory map because it reclaims
the EfiBootServicesData region and that's enough.

> While the two pages here are just enough for Xen's trampoline, I still
> wonder whether we want to adjust -mapbs behavior. Since whatever we
> might do leaves a risk of conflicting with true firmware (mis)use of
> that space, the best I can think of right now would be another option
> altering behavior (or providing altered behavior). Yet such an option
> would likely need to be more fine-grained then than covering all of
> the low Mb in one go. Which feels like both going too far and making
> it awkward for people to figure out what value(s) to use ...
> 
> Thoughts anyone?

I'm unsure what to recommend.  The mapbs option is a workaround for
broken firmware, and it's not enabled by default, so we might be lucky
and never find a system with a memory map like you describe that also
requires mapbs in order to boot.

Any native OS would also have problems booting in such system if it
has any option similar to mapbs, so I don't see much solution.

Thanks, Roger.

