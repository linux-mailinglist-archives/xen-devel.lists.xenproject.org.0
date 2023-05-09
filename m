Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C26FC2B3
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 11:23:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532053.828033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwJYW-0004pe-2g; Tue, 09 May 2023 09:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532053.828033; Tue, 09 May 2023 09:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwJYV-0004mc-WF; Tue, 09 May 2023 09:22:48 +0000
Received: by outflank-mailman (input) for mailman id 532053;
 Tue, 09 May 2023 09:22:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vSxc=A6=citrix.com=prvs=486b9cf0a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pwJYU-0004mT-GE
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 09:22:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0adbe900-ee4b-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 11:22:43 +0200 (CEST)
Received: from mail-dm6nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 May 2023 05:22:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6755.namprd03.prod.outlook.com (2603:10b6:510:122::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Tue, 9 May
 2023 09:22:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 09:22:24 +0000
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
X-Inumbo-ID: 0adbe900-ee4b-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683624163;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZmZcjOA7Jca1zuLe5giIpkxa2HlNPYtOYeZERbqRYtE=;
  b=QLl/AmyfUMdVdjY3wgHWMXYkTVFpzkTuWgO7l38lSj7PeFd18Z/C+6xa
   E6LDaEvT02Qg/noG7S36qZEHDDCElDGofQBD0xfJIwnT1altZOGbMgkbS
   B7cFHhgD5B05WLPgGUsmYOoiXWNT6hSOlHzmAvQFqZCcJZ7Aew8AWCAB6
   g=;
X-IronPort-RemoteIP: 104.47.57.175
X-IronPort-MID: 108764916
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:STq5LqkZSQWSaXxBSqKuErDo5gy1J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXDWiPPPnYNzb2fNEnO961o08D6JPXydBgS1A5pSk3FCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5A6GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 aEUNzlKKRrdvrro+OOAUuVd28AIF8a+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3ieewWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTO3nqKI72QP7Kmo7Fi1Hcxi3i9iDrWG0C/JnB
 0dJ/ykTov1nnKCsZpynN/Gim1aVtxgaHdZRCfY97imTw7bZ+ECXHAAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRupPSEeLkcYbCUOTBdD58SLnW0ophfGT9ImHKvriNTwQGj02
 2rT83V4gKgPh8kW0an95UrAnz+nupnOSEgy+xnTWWWmqAh+YeZJerCV1LQS1t4YRK7xc7VLl
 CJc8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:lxFJgK7fcb8Sw6MKQwPXwa6CI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HnBEDyewK5yXcT2/htAV7CZnidhILMFu1fBOTZsl7d8kHFh5ZgPO
 JbAtND4b7LfCZHZKTBgDVQeuxIqLfnzEnrv5am854Ed3AUV0gK1XYdNu/0KDwQeOALP+taKH
 LKjfA32wZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeF+aP3CB+R2zYZSndqza05+W
 bIvgTl7uH72svLhyP05iv21dB7idHhwtxMCIiljdUUECzljkKFdZlsQLqLuREyuaWK5EwxmN
 fBjh88N4BY6m/XfEuyvRzxsjOQmgoG2jvH8xu1kHHjqcv2SHYTDNdAv5tQdl/851A7tN9x/a
 pX1ybB3qAnRi/orWDY3ZzlRhtqnk27rT4LlvMStWVWVc87ZKVKpYIS0UtJGNMrHT786qogDO
 5yZfusrMp+QBe/VTT0r2NvyNujUjAaGQqHeFELvoiv3z1fjBlCvj8l7f1auk1F2IM2SpFC6e
 iBGL9vjqtyQsgfar84LPsdQOOsY1a9AC7kASa3GxDKBasHM3XCp9rc+7Mu/tynf5QO0d8bhI
 nBalVFrmQ/EnieR/Fm5Kc7sSwlfV/NHwgEkqpllt1EU/zHNfXW2BS4ORATe5DKmYRaPiXZM8
 zDTa6+TcWTalcGIrw5rDEWa6MiWEX2b/dlyurTe2j+1f4jebeawNDzQbL0GIfHNwoCdyfWPk
 YjNQKDVvmoqHrbFkPFvA==
X-Talos-CUID: =?us-ascii?q?9a23=3AFZzaRGsF7i/mnZtoxAOv8Ht36It4fmLUizDafXb?=
 =?us-ascii?q?gV144c6WZeAKU05hrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A+WUMOwwG8esEnCop2hyV9CYaTgqaqLqeWWZOnb8?=
 =?us-ascii?q?nge6rP3xQAxuW0TG0f4Byfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,261,1677560400"; 
   d="scan'208";a="108764916"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilYhhijff+S1+ePxg+hb3gAw3SDssetTvML80WX2w6G9mUerW/XTN0RmT1ZGXoaKksIfOi7siRJLYJxyz1lF0IaQ++2q0XDUixyuR0ZyVAcdALl48sIK9WhzDLnt2/LQpccNr1v2qAf8t4g+5uK1ExHX0lNNl1/5EkiT8IanCzmoGBc6ecRRvPkFZ0pBdaaxwpxJVkyC/U/29Xr3Uku6PJDHz3MeV7KSX3iXyYFrAxFav8ZYiS2HYKcGXLzeU2OvHM/fQTeS2jJGS4f6WJUn5AcP2609+aTTgEeyx54VZZ8Sl8iDC890zUfSKrnsnI54SPEwtqZWCtlIDBVrF59Qbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmZcjOA7Jca1zuLe5giIpkxa2HlNPYtOYeZERbqRYtE=;
 b=SA0TbcIHgSFKtbcYnXlA0C72Hoki9h9xqSZfq5V6wIRh65lqk7Hhsavoz7wcgYULFRUqGwf+UId+58vGfjxjF6LVRTwtxlXeA1UjU3/S/+bvAQ3KjLe/Lt+NwJzdcJgdug0dCspkUOpiFBeWanXgbY9hvNFQS43oY/jljsUy5YzrDvJIag8yT4jN1H9G93dUqQcXytFt/nwoxnv3KdrZQu31oxI/szzvxmuXO5JnOvGbOQg83f4q3wP/mVI3Mzhu9OCQIDPUwSXIM2lkR3qwb31iJ8rPaxGlfYHUgkRkdAqSnmKUNLppNuxhvJDe0OidOMhKHhF2YhZ4mK01TupVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmZcjOA7Jca1zuLe5giIpkxa2HlNPYtOYeZERbqRYtE=;
 b=CBxZIhJR8RDrPFWyj98bDCHW7H8A7a3byyjMqh9iE7QyUYKPWkMq6UCmHnr6Pi16l7YWS554GLKcKOZRMfIuLDha3BgF6yGmkabcX2R7ZhFI1rIrzQsF/ffPNZLl8u3QBEM6x8mhX3WeDWh4DXssIwzG5u5IVDPDTyjFoibPM8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f310cd4e-8bef-e0f8-f49c-74eb58e47268@citrix.com>
Date: Tue, 9 May 2023 10:22:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] docs/man: fix xenstore-write synopsis
Content-Language: en-GB
To: Yann Dirson <yann.dirson@vates.fr>, xen-devel@lists.xenproject.org
Cc: zithro <slack@rabbit.lu>
References: <20230509090123.781644-1-yann.dirson@vates.fr>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230509090123.781644-1-yann.dirson@vates.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0196.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::6) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: f3852c3c-417a-45e1-2af0-08db506ee629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rbF153gS7brZznw6Wk0VGLGQJbIgF57POpPUmcnZf3BirvWor3E7xKDp1r2pg/gHVneCrnM+XeqJ3XJbjMhVcoE5wtRJtt8SIUQoZsNIyLRRPK22wZNzUHI6+ZyTGn6EVskwCTE+/qcJnEsUt892cdqWatBfZt5h3ycw/7NJWTD/cvXVd94C9j1I04p7UMZ1pV4aDi1x8pg2kfu1N/F+E9FL7bbl895WERZzz5QURu+CaAtT9f6w8wFjE4ncVsUUEW2BoR3RjkONsTN4CzU8s5Qq6u/eEDqdkXqjKgFksh9JE893ILk5RntS0+vaoNNn2uFEt/JRPK9NhnxoW+mfQnZLKdzpckPZUs/qOf+nkpdaAkUpU63F1zTIfDh/FWgwBxkQL7EX94rrytVD1pA4vLKuE28+dsnQqZTza6eEqkHRCpUOmW30TQ6DYR6W9OIQWXv3H4TsXPS5vs/OXM2QMME2xB4zdMcYuY8owGsEDvnnSX4GjxAoDosi0wd49qmn8DlAvSplqMuiorGoieN4/uFaOxNrS+SzkiUR2HYfGfHJqQeZIt8nIDjKu8VaJGKyfTrwRC21b9a18roZ6xzbi85EspZH/c6r6hbENcMo21sOu5o5HOJ6h8s60z+LvcA8NwNKzwbZHqAGIY/rAYMlGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(451199021)(558084003)(36756003)(31696002)(86362001)(316002)(478600001)(4326008)(66556008)(66476007)(66946007)(6486002)(8676002)(186003)(5660300002)(8936002)(2906002)(41300700001)(82960400001)(38100700002)(26005)(2616005)(53546011)(6506007)(6512007)(6666004)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dzhxeGdJSzlqcXVISjdic2MyeEkxSVgyZ0txWWQweks1Zkd0VEZ1R0JMUkpT?=
 =?utf-8?B?dGRONitCY2VGbE11K0VQdkovdExDN2JPNzRKTS93a2lCRHY5MHkwRGJHWm5V?=
 =?utf-8?B?V0pXSE4raUNWZ3c5bjhZdWFKcDFBSEUvSERzRWRHRGkwU2Fmd1BEZkFqMkhH?=
 =?utf-8?B?NisrL2xRRlRIUUpRWFlLb3V0VmFHaXNKVytSbUFuUkNPcGVjWnhSOC9PaHFI?=
 =?utf-8?B?NElaT2s0L2J3ZnRabjI1QzFEeDA0S2xlRUtRZUtJL1Nqd2hMNmJkdU1OMm5v?=
 =?utf-8?B?bDljVlAzTXJVcVR6cnFmTGhtN2NrUzZqTGJmRkJDbVROYTEvT2g0Y1BYdm56?=
 =?utf-8?B?SkgwdXROWjFaSTl0V1l2RWtZZ0pwOWcrbFVEL0srT2thZzNwQm1NNW1UUGpY?=
 =?utf-8?B?OGVrZWlkOEc4TTB6K01kaDhLUXBlRkpLcFNBWlJTY1VvVEZRUW9QeHNXcEJS?=
 =?utf-8?B?dkpvTk4rbnBVSitUV2tZd3pHTFJpTC9Hbll5Q0pqUnVsaTA2TTdxRkpFN0NF?=
 =?utf-8?B?WmlHeFNrSUw5ZUpVM3EvZGpzTm5ON3pVOHNmNjRsYTJNYVJyNUNGL21uZjdm?=
 =?utf-8?B?T1hJWEtzN0VyeG4wdmNNdXJsdEFlQkFnWS80eGd1VmtCSCtYYmlURGNjdjhV?=
 =?utf-8?B?YUFQTHN3R04reWJ5WDZvZFd1OVNZSTNrMEJwb3FTMWczQUw5Q0tHY0txTnlL?=
 =?utf-8?B?a05RYkowbzFSR21GQWdyeDN4TzdvN2R0L2R1STBmVFMxZk1PMk1FaTgyNXZm?=
 =?utf-8?B?dC8zSFdWZFNheWEvd3dSeHpHbGlaSUdlYktXc2MwTjZVSDlYOGF5SmgyTGZU?=
 =?utf-8?B?eFRwWGUvaDJySUx1QTJYcXZnbDZaYnpLamk1cTBPZnEyTktkc3dtTjdZd2pB?=
 =?utf-8?B?MjNTVitydldDUEZkNnNTU2tDdDdjbURSU3FjSWlRaU4wZTg3TFpFSUJ0enll?=
 =?utf-8?B?dFlzdjJWVDAvSEdqeFYrY1ZGZERLWHdJc1lhVDVnb1VVRWJ3d2F2V3k4WGVk?=
 =?utf-8?B?KzlBbm9Ud25VM25mS2ZoNGMyTm8vR0k0RVlXd2k3aUdSa0VqWjdQNEdJK0lm?=
 =?utf-8?B?blpSemR4RnAvRlNMNkM2bXgyRjdCeFZlblp0c0EzSSsrTzJxZTdNSDgrTDN3?=
 =?utf-8?B?ZndYNE5ONW1QWWF3WEJuTWk2MXpzOEt3YWhJbmo5clFYdyt3dG9KbkhVTnpw?=
 =?utf-8?B?azIyVi96MmZ5NDhiV2I0MmNxS1lPNUhpVjZnd1UxaXRIZkszODNmeHA5SCtN?=
 =?utf-8?B?YS8vQVc1dGcraGRuS3FzdmplK0NBSUlXY3hDbS9ZcjR4MzQ4RGY2dHVJMlJC?=
 =?utf-8?B?VzNkOXpla0xwU2pHcVplMWIxdCtyeTZOUDFPR285aWR5NVR5VW9DWFZkTFln?=
 =?utf-8?B?bFJIZzhjbGRGS0RwRThZQWRqUzYzQU95RUdNdGQ0d1FuVGUxTWJCd1FmeWdE?=
 =?utf-8?B?SDRiazU4S1RSOCt2RUI0bTNrc3ZrNFlrWTdtL2M3dGRtTTFNQ002UEdLMHll?=
 =?utf-8?B?U0I2M0JDelhoTHl0eVFMN1hLUDU1M3NDWitrVHdmUGFvbDBzTmFqZzY3WVFX?=
 =?utf-8?B?d2theGpnVDJzeThETlE0MGlJWStGVzdacFVPdkl2R2dnN094WkVKK3B5eC9j?=
 =?utf-8?B?NFM3RDZySEEvNWV2TmM0dE5EbzlKTVh3RDVsL0xhL1NwTlBPc2NvZWZQUmtQ?=
 =?utf-8?B?d2haOWJUL0lScjZGdzBNMXVDdWpwK244V0lrQVhTU3BvZVpSOVZRK3E1R20y?=
 =?utf-8?B?L0EvcGJrR0loZnh5LzJCb3ZZblQzckNpaWsrWWRKT0gweG1pM0dXZnZXZ2s3?=
 =?utf-8?B?SU9yMThkbGVCWEd5RTA4aHRWY0oxK1laa1paN3ArSnBET1lrdU5RdFZKczQv?=
 =?utf-8?B?ZmxpbjRXMFdURnJsUWpvSWw3RVJvRFRIL252V0t2L1J0TEdEcTFnR1BKQzZE?=
 =?utf-8?B?MTFseEJxbXA3N1BBcEkrUHRjZHRPMWIvUnJVaGxCMldvTHdmcXZ6RjJGRHlX?=
 =?utf-8?B?UjBXbVlRaE1RL1JpdU0vN2FnT3VDNXRMTkZjZ1dITlhuNEZVZlZESG5QQVJ3?=
 =?utf-8?B?bi91R2xBMWZWby9Nd2FncXhJYWtvUEJGeVBzcmdtZ2Z5bE1mT0VvTjZJQmNw?=
 =?utf-8?B?dVZuVnkvYkNkNVFPajhhYzliWFh4dW1PN0M5TWdCSHY4WFg5bWthSmxGRzVD?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/b33ZqtwM0EuUt3YjO3DsZ5BEws77CLkM/qFE/jXwdkSPs4S+y2xZyO8oVduRQMXrvQACFm6jGtpRMx7OgYBVj1JaPirMH3HcqIerTKCRNg1haOC96d7IDz6v5NZNSQIJysWEBQ3Wr0+WqLxqLmF9PG7QAd1L6Pdf+5letHrBL7dxR047nRXeLsP1bL6dT1212vlTFRr+UIV0+PD+V7xuRSXTpWx/2kV0Ld3MA9IagZEIv5ZOA5jsZdGb1dfEyW0ys2ZHJZZLwhS1xPony5O/bsI+rNALisGWyFvI8xuISh6ArpvCtJ4RaGfLGx8WkGFr/66QVeMLilH025qEAp93dN5nB2shmIK5Zbf+VgljKvxDMsY7a+OkQi4vbP0LvyuUgwcwX9N8rCnXse1DMZhHO/55tpSPfRn1SjYf2HHmBA/RchaYLyuOjf4Rplgja1vp1SZpWd6iT7YceTF4Bfi2PHg0X5Ti/fLlPRxxw/+YRzCGQ8CRmJ+eSVAATlLZ2+KGDW1/zOKwj53DYoWcFpc1DKQWK3+iKkGLT/nATQT7Bp1jHl8ZIgtf8/VjjJjU/wyB/vNcy7kk5i3zQ0D9mkko6sCom8nB8K/3mRng7TvJR86+2wQTFHGMVQXBme5RljG7/8Tbahbr6LbaIzSvvPakyRUKH1soO5ch2gVlUUdmdQ7hPoGi6aF69J/T434xfk8ThjlrkXATRCtwvQfURz1QQo+Y8kUMW831eoeEDG3g4xvUNZG/pIbtdm5MQHQRIXGEkOK5iL0z5zXh2qa5saJXQFnHwPphiuxXUESmHa3M7PUIaZZ2/p8PpZFrgg3uZ8a9BUo8PwYTC9JkQG86COXeA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3852c3c-417a-45e1-2af0-08db506ee629
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 09:22:24.5426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M9CEIaMqlpskY7Rj27BRIQnVKuWa4TdkUvD5KsDizJEhC5rQN7tqoEpfnCM8M+SlxJ8dojs/ypaaOqzapsANEvUUaU1Y0+GOLX3dYswxiHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6755

On 09/05/2023 10:01 am, Yann Dirson wrote:
> Reported-by: zithro <slack@rabbit.lu>
> Signed-off-by: Yann Dirson <yann.dirson@vates.fr>

Oops.

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

