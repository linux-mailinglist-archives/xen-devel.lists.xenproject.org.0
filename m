Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C10397A764F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 10:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605332.942945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisuN-0003GE-4X; Wed, 20 Sep 2023 08:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605332.942945; Wed, 20 Sep 2023 08:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qisuN-0003E9-1S; Wed, 20 Sep 2023 08:50:07 +0000
Received: by outflank-mailman (input) for mailman id 605332;
 Wed, 20 Sep 2023 08:50:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1ZV=FE=citrix.com=prvs=6207273cf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qisuL-00037a-Oj
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 08:50:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af96c6e6-5792-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 10:50:03 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2023 04:50:00 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA2PR03MB5722.namprd03.prod.outlook.com (2603:10b6:806:110::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 08:49:58 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 08:49:58 +0000
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
X-Inumbo-ID: af96c6e6-5792-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695199803;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bKsiO8S3/FCAAs4k53sSlu7YUWSKTQOMwi2IzEQmXDg=;
  b=dkcykiG91RumrY6+0+vEyZlT6SBtXNUOCzyBafamgORQd5GO+PQ9hSGH
   UGP3FMknswhj2yMRYle43HeLAsMoD7hnXh3ou7Z0S+dAArD51i31cW0IQ
   S57zQdTmNKvA3UHznTtMpOoXiEyey9hW+29wERgV3CUMA0nZJfo05e10K
   4=;
X-CSE-ConnectionGUID: qCf5QH9JT02aK5qznyM82Q==
X-CSE-MsgGUID: eUR5U9zYSxKkHtALnUsCcQ==
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 123612205
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:1LnF/q6IBFub8Gn3oNKT/QxRtAHGchMFZxGqfqrLsTDasY5as4F+v
 modDWGGOviOZjakKtB3at++9RwC7Z7Qy4RhTQU9+SBmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35pwehBtC5gZlPaER5AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 NcWdQktPzK/37i/4++iWO99o5R5FZy+VG8fkikIITDxK98DGMiGaYOVoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6MlEooiOSF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx3ilAdhITODQGvhCjWCpm1FCGiwtRXi4geWQrkiDQPlUE
 hlBksYphe1onKCxdfHDWBm/rG+BrwQrcdNaGO0n6ymA0qPRpQ2eAwAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRupJSUKJHUeIy8FSQcI6cPqpo0bhxfDCN1kFcaIYsbdHDjxx
 3WAqnc4jrBK1coTjfzjoRbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzkRhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:NROAb6/j2su5U2fG609uk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3Afd5q+GoFvaZGZbu9MpJlSN/mUdkOfCDk7CbyHxf?=
 =?us-ascii?q?iAEU0Ua+TWHrAopoxxg=3D=3D?=
X-Talos-MUID: 9a23:YZkMCQmLqFNfrs2fMTwVdnpvCf013vW8OXsdspYmp+CgMxFrEDyk2WE=
X-IronPort-AV: E=Sophos;i="6.02,161,1688443200"; 
   d="scan'208";a="123612205"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDedsowe+/j/pgoDuGIHILxauZgKfcP+hqvjhBjFsBLgQnGgjE3uFAdavfvSrY9yJv4cl+USShTk+BICALs5+g5u8DpQRRRaiP6Zg1OXolytxIGwe/icZGcL1Myfd2Pn/WqK0dlsaW1vyxFoRpPPeOXWcXRoS1tI/4QHj9QySYuqIAPc/6HuynTPZO0deU76f7XBxtKObcYAr8WX4cdv1rthtnRPm1vcl+4c4hEUgys1Qz7/c4cs1hg6NPipvV3nyKepAHrpdsbF9z8kFtpCyfM+uTe6O6uN6V5Y8K/gDE5YowRuH7EhhVyhK3s14otXpQNrrWzq57YMMMTIXWD5sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEfNjB83SoK3B+/q8Gn85XQ+4AIz7pDO5meLctimCr4=;
 b=KlVAz+lHYhIkUEBZF7O6x7z95NSUmuaLtKKnZQlLQSZXELAcQMhzkC9YGcLqNroOMbGwWkD4lrDEQWmw1C3kv1NEqSe/APbr4G3rLB7vwy6F04yTPKx/BQe3W0qYw3AcNWkZpMykj4P5+A/IENwecFZE1r+cSreaEQ0iG7Y0siC0ZtCFff8H5u20f1Sj2Lw8ynQs9WnBAZ3bw75muyyQFH0SeMDksPXLgxC7wTAa6IeViU/ans8slbtAD5scmglnIj12U+o9aojAGfSv5Yl1eWWi/c/Z52T4j3Bo/1DOnVz7HzN+L7iX7v6+R5SBxaAcKo7KFFP2wbwmTA+1zVXlug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEfNjB83SoK3B+/q8Gn85XQ+4AIz7pDO5meLctimCr4=;
 b=UlGyrxRkdVCUyvMy/NH8dEKsTRNrxAMObaqcpoajnKkxcO1FR4nXtNlECEd2X2niiLweuJlOHzbJdmHEeVD5xeHVT4T7ZrKgP3fdCjsdyeHn9PNXFS7mTKMd5RP31uWS4tbyIJVGbkBR5iuwjmIgTRNSy6/NfwUUcE0mKG0wCE8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 Sep 2023 10:49:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v9 05/16] vpci/header: rework exit path in init_bars
Message-ID: <ZQqyMG1eQMUTrRo-@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-6-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829231912.4091958-6-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA2PR03MB5722:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd83cc2-b911-48d9-3747-08dbb9b69193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hZ9B9dUfRqiS7MWd1mk9S0e/+EApkv9f2KBp8HHvUfI8aOkUgpmc72YQOa328g7uZce5dMo/dbtx5UhcRCTQB6xUHvorHBjE/YbIyiSjEIZEsf9iFXF+QBR8ZSgIv+tFsBgwgNtOLXKORST9eps5lBkHy/IDrrzrzpxmV/PzZwdLuFv9aSdXhk/qqJtIIOELyST1o8j2KfNl2+NNEkiS0Z8rm4sPXkoFvQ1nytbzmzKJL+bTpcT9MbnTnHawwhxlKXTcah1UIJ9aDy1mcXth6kZZRCszzCoaRlWaFdJkfoVfK+zEqoS2IBoiVaUN5GmYIOAkzeYhJXfgEiq+MOHiPzUnn3vbeB6wjRG/q2cDNag73iYtFpEWDoP8U0BrJ+0dI7VesXmdwTVezx9Aec+gCTtUJGsaYThtLjxMnnyHgmSOxle93L256zTyJ5kn9Ac128eg/ORSyJJqdGjPeF9CyaVHJUCHLOoVhdTvkmVSlV2/FpMJTvERy1DPZnR07KssM4dNrSPkjuTPJFQQYdkZCzpGuPlEZ50pfcMjktboMo3GbFN9G9DoAcO9ePzm7FMc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(376002)(346002)(136003)(366004)(39860400002)(186009)(451199024)(1800799009)(54906003)(66556008)(41300700001)(316002)(66476007)(8936002)(8676002)(66946007)(6916009)(6486002)(6506007)(9686003)(6512007)(4326008)(6666004)(478600001)(82960400001)(33716001)(38100700002)(2906002)(86362001)(26005)(5660300002)(4744005)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlRiRHNSRVRwdWVjeDhmSjBIcEEyY1lCeXh6VDRyWVk1VStlbEgxQkVEM0NK?=
 =?utf-8?B?OWYwOXBaMk1Na3pXOG5ZK3c0cnVDdXJicnJoR2dQMDFFMnVYTytPR01xaGk4?=
 =?utf-8?B?QU50OGZiMnN1SjhCd1E5VEgwVXUxWmRDVUMrdW50cWUwM1hDN0FnNlhBeDAx?=
 =?utf-8?B?TTZ1amVhbko5VVc0a3ZPV3FzSC9wWnBRdGIybzdneFJTb3daTFJoYUk5bHRW?=
 =?utf-8?B?SUw4bEtWYmE0Q3RjTW94T2tWSTJzWURqSU5zaEw0bGNjQUlZOHBxMEdRcnZ0?=
 =?utf-8?B?YW83d2lBOSs5K21DQTdqaTNCMHF1YXFmVjFvSmg1a2NHOGNkMkZDcC8rQWRo?=
 =?utf-8?B?Ty85Ym5nVEpYQzBrOXJJUUxwaGt1QmVzT3ZVbE1oanRZOG9lZzlJQnRCUDBP?=
 =?utf-8?B?YUw1c29RL0FOY1NnY2xTUGxjNUE5ZGJwVUtIa25QZ3lkenRUbDQ1UFErNHhn?=
 =?utf-8?B?aUpMNDQwVkJZZVdIWnU5eVhsMVVQazFPZEc0SG50UE9UaFRCdGFweFZzZXBw?=
 =?utf-8?B?RjRud0lRREFEZmJHMnpxVXAwcS9vSWJQY0FvYWJyS2VVUE5CUlBFZElaSTJR?=
 =?utf-8?B?dHlYa1MvSTZZQmpnOU1jbnhFam1FK1BSR3RWTEZZR21CczFaRnJIckJFUjgz?=
 =?utf-8?B?SjVDa1UzcGlFcUdQMWYxMm1IeFZiN0N6T2h6TjNDaVhDMjhOdWtjdHAwZmZ2?=
 =?utf-8?B?SlRCR3ZzNktidnBNZVBVZG9MR3pqUGErdngwSlc5RlYwSHU2S1h4L1RzbENL?=
 =?utf-8?B?VTNHMkliOTIyVGxQY3ZYVjB4VURubHp4UVFXNXhnak9PRzVyTDJGUy9TTE5Y?=
 =?utf-8?B?bmZPbkFmSGJtclc5elJwbVNTZ05WdGl2MVgvbDErWGw2NUJLOWNRcTRubDh5?=
 =?utf-8?B?bWUxVFdTZjhaakpyL1pHa3BVTWZCSHRiNHF6ZW11M2xmU05IQXMzN2ZOVHh4?=
 =?utf-8?B?TC9wK2xISHpGdjN4SXQvdlFXQlRvbkZvS3BCelBWZVFLS0t5MktGZmVMTVVB?=
 =?utf-8?B?QWg4MGhlNDZBZGNKM3pmRWJ1S1FaK3p5NUVUdzJNSkVBcWpicUFUWjM1L3BV?=
 =?utf-8?B?YlhyUTJRTG8wcGU1KysrclhMY2dHcUs1bUFyN25CNlVsUWUwdWFEOWIzdzlT?=
 =?utf-8?B?NE40ZFlKOEVKVFUvQzl5aTAveWJ5RVRhUnd3QW5vN3ExY2ZnR2FQdmZEVGRl?=
 =?utf-8?B?Q3ZZYWExRDNRQWF5T3ZhSzZmU0NxY3ZYMXdDYnhQQmxjQkVrWFBUZ2k2eHVv?=
 =?utf-8?B?VlZiVU5WNjNRemVYL2NPdXRpUjZJWmRtelhWaUFQamhVUjhwK05aZlRTeStE?=
 =?utf-8?B?WktnbDlXY0FMeTZmaUJmdExLQUQ0Y21PeWYraU13QWRMRHhKZlBYRXdXTkFp?=
 =?utf-8?B?YVRPNFc2TkdIcVNYZDgwSUtsWnNkMkdyV243aWFVYUViMEdoZFRLL1d6MFk0?=
 =?utf-8?B?UmNtYm1kYzlja2s1d3NhSmlXcXUxSFJpdDl3ZEtvUlpBQ2MzY2RXZ0gzUXFD?=
 =?utf-8?B?ZFpobExrMzR1L3lGTlB5UW1BKy9pWlM2RjdTbWxSa3FUYmVhRGV1RENyU0p4?=
 =?utf-8?B?TmRudnFmbjZVeXBSU3U0RzF3YThLSWtpMFg3YVBZQTdmMys1NERhTGtVSTB2?=
 =?utf-8?B?RTdGN1hFQzhsbEc1aUdzbEpJU2YyUW1Ga0ltQmx1Z1BwRVhOYTFsYWpSSG4w?=
 =?utf-8?B?TWVSMmZGUG0zQXRObFJ6QmdUQzZxcUlXWFB3N3R6Q1FXM3hPb1JSdjJ0Q1l1?=
 =?utf-8?B?RURXaXNJV1drZEhQR3kzUDJ3cEF5V0hzWThhRlI5V2dzUVZVY1BWVm4wRzVD?=
 =?utf-8?B?QitHWEhxYTBtOXBzOHZFZDFrSXFrSDBwYTBKVkN3RzdhMWRqVzNRT09LdUlT?=
 =?utf-8?B?UDI4VFdMNE5STkxrZFFUZk5JL3RVa0xncElTTzNtN2NRS3N6ZWM0c3NGY3B5?=
 =?utf-8?B?aEg5by9tOWZHVHViSWZIbnVjbHBuZGNQY0dudVdxQ1FGWUhsbHdwUC9ZdFlI?=
 =?utf-8?B?NE1ERmVMWFRqNFJvYkh0YWQrZi9YMkNWa2QwTTBFZkVCMTVxd2hFQ2Z3bEth?=
 =?utf-8?B?aHN5eld6ZzFkcEUvK1hkS2l6a0JkZVhSRkRxQUxvaDBIdkVTK1RPdHNYRTV4?=
 =?utf-8?B?QUtTdzRLVUVJMWkyY3dNdnBOdXZsZFBVMjJSY2dnV1ZOYWtqanFidkJtWEhJ?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dpIh41ELivT+S82UIF/OoQ+rvaz85AUl7myaLmXbspzZuE2raRs9C+mTnL0M43rd7Gw+FWeO+lE9kxUsUBet5vwW3Qp9U5nbJBLFHVOxDtCNrROc6FTIws4hOO0vO81zlSn5mgxmoOOHClM1Mbu3B0e01qXnFxMjNeyRAioDEi+EUn8ujCIjbUQtdRMgxyTvL5OUYlmfgtwazgxNmJu6QYRIZSL8QSnuXWxUdogJqpEsKnOSDj9xzeyyJgICJgCXafLtBlnC8Hcnxc7ZLTjhqT4L98ftq1ZCP04ZLq6/oUkjpF3VgFyb6jssE456mkK2xBef7t7Uzs06bJMe5F33Gij5gAA7HQfVp6MGbkywLPJziZmquk/PEt5sPb0U2QlWtPOjj3D22rknroJfk4b/n3KIQGRuXVyXn+GXGX9dcUesLECkoU36X/U0Wnbs9EPDZa6NkBSuufFsLXOET29AM5I4/GSEL2gQOIQghxN+WwmZvkiqGEqxNJ/XCOayXUj6Fu5KrxZFprO0dBGLz1pQ5v7mtu0Rl5Twyi0cyD2LgI9+FsEe7lyTMWabNk9v6IK6lEUs2oKYu5Gqbn+pJiJp/W0ANNH0fFGQU6y92Vf/LHyDdmxQtIPYD16nSmeUCnQcwp3js8zEUPVNdSCGLJ2fu2pfYUwyXNn790jpfXOUZipcqvU2K5SX4jZXnB3bGg/YFBuqL7y8L3Vd9quF5IBDiCn6aK1z3tv+cTyv3Br6kpuepMcuN48LpHA5SqSDvitxLd9J3DYSvkKURzww76IbpWB7J2h/QICdS1k37kqQcfioj9jqeuz8kcPPGzmm9Pgy
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd83cc2-b911-48d9-3747-08dbb9b69193
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 08:49:58.2512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J657CyAt/807163WhAyVeUMPWTxlcUfNfKVecD3soZ/uZ+QnxgXxxc934NBXKa9UjHhtBDKd4nD7DTIWcHlx3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5722

On Tue, Aug 29, 2023 at 11:19:43PM +0000, Volodymyr Babchuk wrote:
> Introduce "fail" label in init_bars() function to have the centralized
> error return path. This is the pre-requirement for the future changes
> in this function.
> 
> This patch does not introduce functional changes.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

