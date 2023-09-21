Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3097A9337
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 11:43:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606247.944020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjGC3-00019k-SZ; Thu, 21 Sep 2023 09:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606247.944020; Thu, 21 Sep 2023 09:41:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjGC3-00016m-P9; Thu, 21 Sep 2023 09:41:55 +0000
Received: by outflank-mailman (input) for mailman id 606247;
 Thu, 21 Sep 2023 09:41:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wI4U=FF=citrix.com=prvs=62171ef32=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qjGC2-00016g-2s
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 09:41:54 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1531c866-5863-11ee-9b0d-b553b5be7939;
 Thu, 21 Sep 2023 11:41:49 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Sep 2023 05:41:45 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB5486.namprd03.prod.outlook.com (2603:10b6:a03:28d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 09:41:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 09:41:43 +0000
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
X-Inumbo-ID: 1531c866-5863-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695289309;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LO1NPurSuH1q5HMW7jiw4dZYkVSDMqT9K8I+A9WTMtI=;
  b=ey0B0R56MRZtI9Rbl0j/WbbRj6D2f+ThIOuUEapmqKXNT6jGb8UX+4jc
   huzU13Npw1/5yF/B0DyHE5TN6ie6kpKGOPs80eh49o6Ch2ku0OZXKwyfD
   xj2PmnIlElU4PxCq2v/GjSVsiDmZnxeWNt3QluWg6nI7phmICRiuECpBN
   M=;
X-CSE-ConnectionGUID: ehi558caQy+ANt1F+3SDcA==
X-CSE-MsgGUID: K36mXPDuQkyPb5kp95Xs5Q==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 123776067
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:MiLvH6ArJyLDiRVW/5Xiw5YqxClBgxIJ4kV8jS/XYbTApD1w0j0Ay
 WZNDWCDP/iCYDemf9tyOo/npEsAsJeAy9JgQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48D8kk/nOH+KgYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsMpvlDs15K6p4GJC5wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9+Z2XDwe/
 vUhOXMkSAzaqaHt+56wY7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvTi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCnz2bGXw3yTtIQ6N+bm885SrECqxX0rAkAVTQrmkeLksxvrMz5YA
 wlOksY0loAp6EG0R8PhGR25pHKJtAQVXdZ4Gug2rgqKz8L83QGdAWQVSy9bX/YvvsQ2WD8C2
 0eAmpXiAjkHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnadJuE7W8iNHvLhj2z
 yqXtyg1h7gVjskj2r2y+BbMhDfEjprDQxMx5w7Xdnm49Q4/b4mgD6S37XDL4PAGK5yWJnGDo
 X5CncGd5eIPCJillSqRTeFLF7asj96GPSPdhxhzHpAn3zWr53OnO4tX5VlWPE50Nu4UdDmvZ
 1Xc0T69/7dWNXquKKVxM4S4Dp1wybC6TIq1EPfJctBJf559Mhed+z1jblKR2Garl1UwlaY4O
 tGQdsPE4WsmNJmLBQGeH481uYLHDAhkrY8PbfgXFyia7Ic=
IronPort-HdrOrdr: A9a23:h5rYlq06aykMFnALMr1jpgqjBEQkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7gr5PUtLpTnuAsa9qB/nm6KdpLNhX4tKPzOW31dATrsSjrcKqgeIc0HDH6xmpM
 JdmsBFY+EYZmIK6foSjjPYLz4hquP3j5xBh43lvglQpdcBUdAQ0+97YDzrYnGfXGN9dOME/A
 L33Ls7m9KnE05nFviTNz0+cMXogcbEr57iaQ5uPW9a1OHf5QnYk4ITCnKjr20jbw8=
X-Talos-CUID: =?us-ascii?q?9a23=3AuDqPPWnG8Rc4vO4XcTR6b7aTgsfXOXDdzSqNc0S?=
 =?us-ascii?q?xMHcqYZuJEHHTo5hImOM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AhLyhcw4KgV2sOwgyoev5s7zaxoxLuPqrOHghjKw?=
 =?us-ascii?q?FqvGOaC9oamqtl2mOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,165,1694750400"; 
   d="scan'208";a="123776067"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezLrA1TD3HfmDS5IcNvwj7l5RhupPquAmFu8ZRxwjM/mzAOdOXTcOplrK96BZtZxLcqMxjcx5ZF3+yGJ3t5yzgG7MRELmQQMBXIcyEfC98cZKZvhj0NJ30fY6rg5Sri+u0vO9P9H8J19e/O+YOOqqbab3KYkpHDw/cT4fVBufOB75wiR5LJZ5/VOmhEXph18a8EyvFmCtZMRPzHbEPDJnmfPaa7a/ouoXTS5QNz/Ffnz1J/ov5a59qoiMOaNiOYgIqmYnfXckoGwIwGu3a3qA6goKuEqIY4G5yH4/fGTtAavSU89rEpBpB/pqJCwc+9hG4784kVbVv8/wCe/OR85mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58EkMiYuvw2X/nDSz9T5cQ4eBqI1y2kpolAtQxlah6A=;
 b=e3zKRXoJ7DWlwStzb9xfMEKrxgKlN5XJV7WekIZQqQaIlvTt+/NUVUnDp29H+nd/8mNQn99PxPyinZJ/HmbCJPCg48GAVpQcZq/hlA9UGc3FQgO4G7qGR1uLERUFregNynxraKyLpMaK8QCSCZcrZgCLBUK+xoviU6REpd7v81CMiUWh0JwWACJ3wvCJY12YNr9wvMIce2O2X2UJoEMtZwZ+TQMOmjflM8hML4hbeoklWLwsXxMLTNE2oIktJ3GumaO0pdzh0VJr3SOTKRIhSJFRCcSHk6YKqnEQnFRktFdEAMWhUU3XwqSwH7MUZLD1pwBff0iNEN+fUEEukojoJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58EkMiYuvw2X/nDSz9T5cQ4eBqI1y2kpolAtQxlah6A=;
 b=WPOcUANTnZCkVXV9eRAAqjQ4bfTeHYsjJHIS/un6SHZcNzFl/oKoXQgfMa1jMSSKmx39uUfb/U4FLfShQY2yC3mFFRRpv3HcRt0wodLQWv0eEcYQ5cy2ncF85xxyJDjQaC8QlRqgkNZeqziVQxCUdJp+QC4+GFRNVaYDclmEEvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 21 Sep 2023 11:41:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v9 02/16] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZQwP0YpgnGqt0X2Q@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-3-volodymyr_babchuk@epam.com>
 <ZQnAvNSDn0WB13Gn@MacBookPdeRoger>
 <0ee1b11b-17d8-0d53-6836-2c09bc083fd2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ee1b11b-17d8-0d53-6836-2c09bc083fd2@amd.com>
X-ClientProxiedBy: LO4P123CA0325.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB5486:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f23164-7e02-4ed7-3b1d-08dbba86f68e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/LVuu3LwAiJ0d96begokLwz7C61PrvNeTvYrLOkNxefBLAXNLXNWu45fvHVmZ2oliokcLqnG5hZivHd0NRG4nNnTYZYuzVE/CvdcV0TUjRoFc/e4u18Nrr+89dwVJu/iRPBh724/jWEumB0/6JuNHB7zrDq3PECbiR5kTiV8n1Jotsnq7nXxmIYYh8GokaFluweivYNT0pmMFOPuOorr1JrOVysoXo5gej5npCq1BgoQoPox+KZLcS1RFJqkvT61sN3ME4Gph4DYdGJEbHmVMB3o1r1eTHNe+IxslDhqhotK2j2YTr9KaADXzRPo2zJ49ZbD/UR6Q51/zkmYDFREclkRa7wrMXzugTim+knapLXVIubpdUAzK7Z/x/COB4AbiRCNpqfJS3XfuRwcdRlL16R9ZUSFCdv7NSEHAq9UC30pRmYM2sCo6hSOGxjdNDT0VuHmCDtbX5g28OvJgeeSu6NEqVhaFUOPchPiBG3RHbFCDehPaelBhMevJ3dvv2xpth7feDX4c4mcTEoNAi0OEEU8uNFFAlOgWNHAekf2Oq0NWMMMNd90oEMXU6gAeIgr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(376002)(136003)(346002)(39860400002)(186009)(451199024)(1800799009)(86362001)(9686003)(53546011)(6512007)(33716001)(6486002)(6666004)(6506007)(82960400001)(2906002)(38100700002)(85182001)(7416002)(316002)(6916009)(54906003)(66556008)(66476007)(66946007)(508600001)(83380400001)(26005)(8676002)(4326008)(5660300002)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUh0T2s0VW9QeGk1WG5ER2wxbzk3WUZhMUtObzdUQ3pHUlFxR0VSVTBnblJq?=
 =?utf-8?B?TTgzQ2J5bDR1S0ZmMjVlS2JvZ05xMmdxLzI1ZEVOK0lONjY3cGo3RHBmaVdH?=
 =?utf-8?B?Uy9XaHhYSEplWHExRjNZczdIUUd2bGFDbFdHOTRFM0FwUzc1Z0R5MkxFYUpv?=
 =?utf-8?B?MlgraDFpdTIvMWhoOG13aEt4QTYycUVKTW94WDlpQW1EYy9aajNlcytqVm1u?=
 =?utf-8?B?SHFraU1XREdsQW0rWlhLVEZPYzhReTRyNXVrQ0dnTnZMRE00djRGRTVUR3kw?=
 =?utf-8?B?bGZ4SmtiZDhpcDFqZGVmajV2bXlXMmlqYU1rNGlEckVpdVJyTzRrQ08rcVhx?=
 =?utf-8?B?NGdRcGloQmJCZkVHRWlYQ3lrTGoxeEZJbzBlY1RGN1pUdlFWZDI0ekhUa0M2?=
 =?utf-8?B?TWE0WWd2UVN6QXFGVkF1clRlcjdPUmQ4TWFkU1JaNlErRGx5UFIvajMxNUw3?=
 =?utf-8?B?SmkyVVFUeXEvYlkyOUYrVWl3NzdRMVhvbFFBOGxYdkZUZGRNeGxuTnA2d01U?=
 =?utf-8?B?VmZhU1licTA0Nmk5bzNCeHRIa1FkQlExY2d2UlNLQ0E3WkxwY2t5OHY2ejFM?=
 =?utf-8?B?cW5RcWdaWnl1R3pjUjVxU2xtRGJqUDl3NEsvOWtMQWd2VWlYMG53czlpNlFj?=
 =?utf-8?B?OTU5MWZPSkFLK2hla2V3anRXUVVsUHEzUjgzOVd3RkMzRmZudjRXR2NmbUFL?=
 =?utf-8?B?OWRYRE5nY3M1L1B2akcwd1pWM3d4RU9JaldaMVQ5d2hIU0Y0anFLZm1NUWx6?=
 =?utf-8?B?eDBrWWp6NnZwZHNRWEZGaGh0Wk5yUVUyUjQwQ21nMmxXODE4TlFHWGdHMVdB?=
 =?utf-8?B?QzJ0Rm0xSE9DZS8yVmp5VnRQSUZxZC91bE9tS3YrWlhOaUZhYTNuQWljNld0?=
 =?utf-8?B?QkxEZUJLcUdtR1l6ajlzZXFvVWowVVZQL1VwdmFCeVF6ZVNWa0I1MlVxSlB2?=
 =?utf-8?B?M1VjY21PRmdheEsyNm92amNqVTFSY1ErS2lrL0pGYmVZbEE4YWNLTmFYd0xm?=
 =?utf-8?B?ZzlBZGRJb2hDYUFqdFRuaUtTUEQ3c0VMTHFGZzcvazdYcVUxRUtBUmNlNUo4?=
 =?utf-8?B?dVdTRHI5aStFamlaS2ZsRGJycUdvcGloVGMwcUJZUHNjQzhxNzd3c1NOOWdC?=
 =?utf-8?B?Tjl2UkNpKzJwOEZydU5rQWJGNW1HMXdBNnhTRTFUci9vMC9MMkxYTHF5SWpR?=
 =?utf-8?B?OHVBYTIzejhYQ085Qk1OTmU1elhMZ1NybjExaXhKYnFGUkZ3QXFuZktlSTlZ?=
 =?utf-8?B?cUFlNnJTd2RiYnVJNDc4aTUvNXdlUUg3dWNRUHBHbG41ZXY2WVRnQnlKUG1I?=
 =?utf-8?B?KzJLNEhtSUgzWVduV0p1b3NjTjBraEQ3WlY4SzMzOVBPZkdFRjg2a2tEck9O?=
 =?utf-8?B?NWlnYm9ZK3JjSjJJKy8zTGQ2elZNYzA1dnRHQ2d5dXdkZ3RtZnhNaFZIVjA3?=
 =?utf-8?B?V1RNaWE5MUxITEsybnlldTdyWVV0VXIwWCt1Q25IQW12SUozQmV6Q1h5ZTdi?=
 =?utf-8?B?enAxZWlPWW5tbkY3eU9HTlFRZmdlV050NXZSSTVqQ0ZjTTJPbVp1b0d1YmVU?=
 =?utf-8?B?SnNjWnZGbHdHSzVLQkMvcGdXcWNMWm5hdDBXRTFNS3hwSENZeVk5MHR2UWdt?=
 =?utf-8?B?Y2g5YVJncExLN0hQeHI0aGlwWERLR1R5M283cHpmdjdCVGFidWlGaEl5YlRK?=
 =?utf-8?B?eURIUGhvQ2FPUndlcC9aQWJqY2NLT0VuZXBCMm4rZ1ROZXBVSGZJT1BnZUwx?=
 =?utf-8?B?YW9wbk1LUmxOMjM2QjhTVEMySEUxZ2pwbFhydEVxZk9YeURtVFFmYVZURkph?=
 =?utf-8?B?Rk5XbjNGT1J6K24wanNHUzNUNXBKNTgwR3RvcDVJQ0RtRDhRT3BCNUdtcEl1?=
 =?utf-8?B?SHZkSzJ0QUJFTzFjUU85a0F2MFhzRG91ZkYwdk5MUXBVV2o5YVVFcGwwcmFH?=
 =?utf-8?B?TmtzN0xuZTFjZGkxeE9qNnRTd0plM1ZXbEpWUWt3cFFSWnNCOUdsTk1DSzYx?=
 =?utf-8?B?blZNVUp1V3A1ZGhWRjlMYXVaT1VFUTBnMnIrQ1RXaFc5RXp2Yk1FR2VYT29p?=
 =?utf-8?B?WndFTVhEVDRGNjZEc3Z0STFXSXpWVkh0MUNEdzJ6SFhYYTJyalBvbDhsSzRh?=
 =?utf-8?Q?vEwRxhheIjvPFloR5Gt5zyB3V?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	U0BvmOmwVIzntOgS4M3F/hs1fk5iVwzA/WJXSFx2BUo90JxgHXAI9JB2mL8NBpoTzjYT01Ve9a67ye9+7QugsdzWFUndz9qMm7ynoAbQUEwGpF3LQTJLq8E0dfK8DGzTNsJuS3tqbyJiSe8+zO2IdbDEw+nC7fkt1G/1buVvPAEDBTyNssIc+VdWwvfycuRbWmmgK8yaHdxCBn/02nSZDAWu6S0ZoxQhxOg7/+rHgKQUoDMvnbRm01fXU1Ei8DIy1ZgLciGCsObHNWmwR9K2dYqqXsHYd3AEKzx9L8X+s42PJn1fNVCJZzLhV9ZK/kCX+jeh5VGf50s27radHA1h9Xw9FokihUU+aeRTnNaehInfEiVDXCEICDN6ejwRuLhZ1tsyR4mTH0l9cWEZmKd4JW7kwIfVR8EM6kIxy/BVhU8s8AaomgGAWfevTQ3EOvJMi5bpnrV80m/1snKeBeOfZm534kcNJpf/d4Ug7hw2DxHLAauSoj99I3cGhZ5OQGvjqIX5R+oAUkI5Dj7aqMxLxjZ/8BkAZP0SFS28rkR7svZBiiKJIXRoXE9hYT+ptb5KDk8ulvFFA2Cak1hwwG7A5Vw2wyFPwXR3mDCv/T9ShWsab1Y7TbIub8g07OwoNBpwqZV+wwcP5yCFm3vJlbQ2GB8Fu7x0ShoHbOsZ7XRCJBUaG7AVojFxjSpa3Si/kCe49Rux7cWXzxH88d+RlaYXIDvLbLLx7DuOAMPtjhA46azMPIlX4s+Yz41mmsq89ts3MPvay2pReTQexO5LkcPjSihYr0t7OXiEObVmlzqIhc2Ytmc3mDgR+6w8v4KvDmRcPXduIBrXO6Unwtz2tEzoI/PV6fsSdlqYU+qBdoAxBrGERnj3gXeH+5AE+wtOlHghFipGzQaPdZU1H8t4MaBM+w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f23164-7e02-4ed7-3b1d-08dbba86f68e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 09:41:42.9561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKOOhvBfDh6CXebRn/6EYGl8+nizFFbL2dt/juLUYHcc3TBIfA3B17f7hEuwq1YON9zEM4YfifiG7A9Zj8qjRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5486

On Wed, Sep 20, 2023 at 03:16:00PM -0400, Stewart Hildebrand wrote:
> On 9/19/23 11:39, Roger Pau Monné wrote:
> > On Tue, Aug 29, 2023 at 11:19:42PM +0000, Volodymyr Babchuk wrote:
> >> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> >> index 1edc7f1e91..545a27796e 100644
> >> --- a/xen/arch/x86/hvm/vmx/vmx.c
> >> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> >> @@ -413,8 +413,6 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
> >>
> >>      spin_unlock_irq(&desc->lock);
> >>
> >> -    ASSERT(pcidevs_locked());
> >> -
> > 
> > Hm, this removal seems dubious, same with some of the removal below.
> > And I don't see any comment in the log message as to why removing the
> > asserts here and in __pci_enable_msi{,x}(), pci_prepare_msix() is
> > safe.
> > 
> 
> I suspect we may want:
> 
>     ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock));
> 
> However, we don't have d. Using v->domain here is tricky because v may be NULL. How about passing struct domain *d as an arg to {hvm,vmx}_pi_update_irte()? Or ensuring that all callers pass a valid v?

I guess there was a reason to expect a path with v == NULL, but would
need to go trough the call paths that lead here.

Another option might be use use:

ASSERT(pcidevs_locked() || (v && rw_is_locked(&v->domain->pci_lock)));

But we would need some understanding of the call site of
vmx_pi_update_irte().

> 
> >>      return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
> >>
> >>   unlock_out:
> >> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> >> index d0bf63df1d..ba2963b7d2 100644
> >> --- a/xen/arch/x86/msi.c
> >> +++ b/xen/arch/x86/msi.c
> >> @@ -613,7 +613,7 @@ static int msi_capability_init(struct pci_dev *dev,
> >>      u8 slot = PCI_SLOT(dev->devfn);
> >>      u8 func = PCI_FUNC(dev->devfn);
> >>
> >> -    ASSERT(pcidevs_locked());
> >> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
> >>      pos = pci_find_cap_offset(seg, bus, slot, func, PCI_CAP_ID_MSI);
> >>      if ( !pos )
> >>          return -ENODEV;
> >> @@ -783,7 +783,7 @@ static int msix_capability_init(struct pci_dev *dev,
> >>      if ( !pos )
> >>          return -ENODEV;
> >>
> >> -    ASSERT(pcidevs_locked());
> >> +    ASSERT(pcidevs_locked() || rw_is_locked(&dev->domain->pci_lock));
> >>
> >>      control = pci_conf_read16(dev->sbdf, msix_control_reg(pos));
> >>      /*
> >> @@ -1000,7 +1000,6 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
> >>      struct pci_dev *pdev;
> >>      struct msi_desc *old_desc;
> >>
> >> -    ASSERT(pcidevs_locked());
> >>      pdev = pci_get_pdev(NULL, msi->sbdf);
> >>      if ( !pdev )
> >>          return -ENODEV;
> 
> I think we can move the ASSERT here, after we obtain the pdev. Then we can add the pdev->domain->pci_lock check into the mix:
> 
>     ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));

Hm, it would be better to perform the ASSERT before possibly accessing
the pdev list without holding any locks, but it's just an assert so
that might be the best option.

> 
> >> @@ -1055,7 +1054,6 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc)
> >>      struct pci_dev *pdev;
> >>      struct msi_desc *old_desc;
> >>
> >> -    ASSERT(pcidevs_locked());
> >>      pdev = pci_get_pdev(NULL, msi->sbdf);
> >>      if ( !pdev || !pdev->msix )
> >>          return -ENODEV;
> 
> Same here
> 
> >> @@ -1170,8 +1168,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
> >>   */
> >>  int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc)
> >>  {
> >> -    ASSERT(pcidevs_locked());
> >> -
> 
> This removal inside pci_enable_msi() may be okay if both __pci_enable_msi() and __pci_enable_msix() have an appropriate ASSERT.

Hm, yes, that's likely fine, but would want a small mention in the
commit message.

> >>      if ( !use_msi )
> >>          return -EPERM;
> >>
> 
> Related: in xen/drivers/passthrough/pci.c:pci_get_pdev() I run into an ASSERT with a PVH dom0:
> 
> (XEN) Assertion 'd || pcidevs_locked()' failed at drivers/passthrough/pci.c:534
> (XEN) ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> ...
> (XEN) Xen call trace:
> (XEN)    [<ffff82d040285a3b>] R pci_get_pdev+0x4c/0xab
> (XEN)    [<ffff82d04034742e>] F arch/x86/msi.c#__pci_enable_msi+0x1d/0xb4
> (XEN)    [<ffff82d0403477b5>] F pci_enable_msi+0x20/0x28
> (XEN)    [<ffff82d04034cfa4>] F map_domain_pirq+0x2b0/0x718
> (XEN)    [<ffff82d04034e37c>] F allocate_and_map_msi_pirq+0xff/0x26b
> (XEN)    [<ffff82d0402e088b>] F arch/x86/hvm/vmsi.c#vpci_msi_enable+0x53/0x9d
> (XEN)    [<ffff82d0402e19d5>] F vpci_msi_arch_enable+0x36/0x6c
> (XEN)    [<ffff82d04026f49d>] F drivers/vpci/msi.c#control_write+0x71/0x114
> (XEN)    [<ffff82d04026d050>] F drivers/vpci/vpci.c#vpci_write_helper+0x6f/0x7c
> (XEN)    [<ffff82d04026de39>] F vpci_write+0x249/0x2f9
> ...
> 
> With the patch applied, it's valid to call pci_get_pdev() with only d->pci_lock held, so the ASSERT in pci_get_pdev() needs to be reworked too. Inside pci_get_pdev(), d may be null, so we can't easily add || rw_is_locked(&d->pci_lock) into the ASSERT. Instead I propose something like the following, which resolves the observed assertion failure:
> 
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 572643abe412..2b4ad804510c 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -531,8 +531,6 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
>  {
>      struct pci_dev *pdev;
> 
> -    ASSERT(d || pcidevs_locked());
> -
>      /*
>       * The hardware domain owns the majority of the devices in the system.
>       * When there are multiple segments, traversing the per-segment list is
> @@ -549,12 +547,18 @@ struct pci_dev *pci_get_pdev(const struct domain *d, pci_sbdf_t sbdf)
>          list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>              if ( pdev->sbdf.bdf == sbdf.bdf &&
>                   (!d || pdev->domain == d) )
> +            {
> +                ASSERT(d || pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));

Hm, strictly speaking iterating over the pseg list while just holding
the d->pci_lock is not safe, we should instead iterate over d->pdev_list.

We might have to slightly modify pci_enable_msi() to take a pdev so
that the search can be done by the caller (holding the right lock).

Thanks, Roger.

