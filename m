Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1C36375AD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 10:57:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447914.704551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8yO-0007Rw-Mo; Thu, 24 Nov 2022 09:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447914.704551; Thu, 24 Nov 2022 09:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy8yO-0007PX-K4; Thu, 24 Nov 2022 09:56:48 +0000
Received: by outflank-mailman (input) for mailman id 447914;
 Thu, 24 Nov 2022 09:56:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTCw=3Y=citrix.com=prvs=3201a854c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oy8yM-0007PR-7c
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 09:56:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c37eb96-6bde-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 10:56:43 +0100 (CET)
Received: from mail-sn1nam02lp2043.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 04:56:40 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5721.namprd03.prod.outlook.com (2603:10b6:806:117::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Thu, 24 Nov
 2022 09:56:39 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 09:56:39 +0000
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
X-Inumbo-ID: 4c37eb96-6bde-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669283803;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=CMr5dIXXsXUxFLdjgkH7KyXgDdtkWRXsS4KPsec63cA=;
  b=Z5KPqekrvTcAGi0rruEQuPVXt3aw2E+pwgFlC8Gfi+xmMBv98kC8S2Vz
   lGxNShHnnJ60NKrawulkV7sClYMekAGJNtHf2Ap+WAkNMcd85ie25RY0V
   +ks6N4lfzIqQUelgesuFxFRa1kOMO2sAWahhw8JFIJ1t0o6QtFk7swPBI
   I=;
X-IronPort-RemoteIP: 104.47.57.43
X-IronPort-MID: 85058349
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+AcPn6kpfMRxGmz9fOz7B2no5gxvJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCmiAM/+OMGv3fNwlPIvj9hwD78LRzNVjTwE4qC8zQiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eQ+Mg9cZ0invL31z5LldMtl2sF8BfC+aevzulk4pd3YJdAPZMiZBp7svJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3jOOF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efwHumCNlORdVU8NZY2m2r41Y3VyY9SHywsPaQhGCEY/Nmf
 hl8Fi0G6PJaGFaQZtz0RRixunOHlh8aRdtLEuc+5R2Ny6zb+AKQDC4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y6
 zKXqCkzgZ0DgMhN0L+0lXjcmC6lrJXNSg8z5y3UU3ij4wc/Y5SqD7FE8nDe5PdEaZ2fF1+Iu
 SBen9DEtLxVS5aQiCaKXeMBWqmz4OqIOyHdhlgpGIQ98zOq+DioeoU4DCxCGXqF+/0sIVfBC
 HI/cysIvPe/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:ebvEYanvlbJAypFtu5lQIZNqF3npDfNMiWdD5ihNYBxZY6Wkfp
 +V8cjzhCWftN9OYhodcLC7V5Voj0mskKKdxbNhRYtKOzOWw1dATbsSlLcKpgeNJ8SQzI5gPM
 tbAstD4ZjLfCJHZKXBkXaF+rQbsb66GcmT7I+xrkuFDzsaDZ2Ihz0JdjpzeXcGIDWua6BJdq
 Z1saF81kedkDksH7KGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu1Xh/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboX0Twk6n7WXdrWrooMT/Sj5/I81dhbhBeh+cz0Y7ptlz3I
 9Cwmrc7vNsfFv9tRW4w+KNewBhl0Kyr3ZnuekPj0ZHWY9bTLNKt4QQ8G5cDZ9FNiPn74IMFv
 VoEajnlb9rWGLfS0qcknhkwdSqUHh2NhCaQnIassjQ6DRSlGAR9Tps+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqeEAX2MFzxGVPXBW6iOLAMOnrLpZKyyq4y/vuWdJsBy4Z3sI
 jdUWlfqXU5dyvVeIKzNaVwg1DwqViGLHfQIpk03ek6hlS8fsumDcS7ciFuryP6yM9vR/EyWJ
 6ISeBr6rHYXC/T8L1yrn3DsqlpWAcjufIuy6cGsnK107b2w97Rx5vmWceWAobROhAZfU66Kk
 c/fVHIVbZ9BwaQKzLFvCQ=
X-IronPort-AV: E=Sophos;i="5.96,190,1665460800"; 
   d="scan'208";a="85058349"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ALxt2gkS1TShh5eNx35E8SNs2wcjwFVDgK4EFDrGU4JjQnrUupGRSxuk9VZEr78sBJqxCJNc0rtBmD24rcYGgr9cJzFYRjUU4zGW5qSSqu6kW0pWH0srarSs4GmTCJicIqs8CQ5cMbJj0Sm/W+pbgMr4DRdivJEB3+YKzFXBmXeS/GrHaf/CTkQUCnXjSi2OXzeKAQ/P4YtbJqlA4+v/97LVxCt1rz6wMBq/AvjStncnDdwOVvbZk64dUu9OeD7tZiETQdHJCfILrMZ8b3amAHptMjtFgoEbINZG0BEfHjG0hfHJFv+9Ng6pYlnG3Dg1PKIjLScALIkKwTPAlPgeTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8jsLsQCrq0Picplk8ufZMvebnhipSQQ+qeftmyG23SI=;
 b=Ogo95xLM7omq3W9wS7a37AxKwj4sK7/a7gnosQfVPZ9BJric7nkgpTuL6BRbWlQ9PrjaGt6ryt+L2AeJ37zRz3etSMljsr/I5VpNQJ1uDV/nWEsv3LWteyYQsIERYLlktV0kEYYv5jjWpaNeDIDf+/Jc/b09JIqKreFCaF9UpccSR7s5jZbmoQG9Dyx/EisRe1Zd+wP234WxKfJ34A+SfxPADBMGR5I3w7wx5hFUBUmp/jfqwIojWRafCVsLNdz82rvt++LLkw6sZdTSRpp/LkCVjiPCbpQJGcejlqxtvJP5Ju5ZwUMkN7qaAQIcSMLmxVETS/7640jj/5/Gac+i1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8jsLsQCrq0Picplk8ufZMvebnhipSQQ+qeftmyG23SI=;
 b=TSCdIUPsNHN/opN2cVP96gn5sWbWxD1xeO/YbiI4x8yQM51cKksM3NSC/iDLOQdSkiuzjs65SBgo5WrfTybHNzbinyf66EPMZd8NWvZLvUEVbGaqiOOMNJHEwWGA//7k7/1zcaR5TH2S5yGGonoZyVDRJ93rVszVhEmX3PB/u3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 24 Nov 2022 10:56:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 0/5] gfx: improvements when using multiboot2 and EFI +
 misc
Message-ID: <Y38/0QEmDkwAHRIB@Air-de-Roger>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <Y37940yMRg2iX3IN@mail-itl>
 <Y38ybQwCk9drdgxw@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y38ybQwCk9drdgxw@Air-de-Roger>
X-ClientProxiedBy: LO4P123CA0264.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: fbd07622-d658-47f2-f80b-08dace022e27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bgT4tbuPiAFkWUYYJs7loZjXPuwsSR2pwyQmJa4tbj4j3G1ILNvTQDZtFwTpMywdLh26eH4K3wk2ym/GoirHD+tmUTqsA0shA3dRdmgBV8CnA0XJN7vmLN2s/xF4ZLf75VhQvVxypoiDOTqF0bAuFnU6uNn2KQ9XjF3dBs3g2+6mnj5b8BHIfSrBJLoOk/D3JE4AU8bm5cnyH3/YcriPL8w9JWsVtmAxso7MmsDXK9bduRri4u+2d16noDrzUspT28W3Zh3jY2xSLmndRsEMiTDF5Oni27nHx7RuuTYMeH7QVl3J0nYdQE3e9z6a17fA5EEy9bl+pmoE2XxW3h0+6eq4qdGhXa2khozXHWicsjj0UjGTI5N42Z8LJOXPqrR+hz3MkRdymnvuMrh7BqcQrc26TMo0naWso0aGd7zOP3P/zb2jk8KhZOV97NCNkFz9evwZDGmfB9IdoM0Hk5FX0i5aRUFxULWiCPjz3ylb10widsYrNTrQSsPq7S9PL9QoQeIVGDTRFRS1u3QUo9BYOUlMtUusjqfM7ll1A10cCbskuOC9eeNZnVzHbn2hfFWNF93V7QLltPGND2vgL0anNcCkyT8jM24OgN2Df3Ly+7LeaxHM+qDUCAXUyNNEieIrj7XWTWG4uukA5eB2g6FBRalpADtxD6LnBiKlSDNcLD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199015)(6506007)(8936002)(26005)(41300700001)(83380400001)(2906002)(6916009)(54906003)(316002)(6512007)(6666004)(186003)(85182001)(4326008)(66946007)(5660300002)(66574015)(33716001)(66476007)(66556008)(8676002)(6486002)(966005)(9686003)(82960400001)(478600001)(38100700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFdSTGJWY3kwdXVQSkJhU3hPV21xVFlYVEFoWk9KTHlWRk1nY1YrcjVXUmpL?=
 =?utf-8?B?bDJCbnU1YTV5RnZyRHdZOUxncEJEZkpUN3BiamFzSGd4T0pJanlLVDdXV0Mw?=
 =?utf-8?B?a3ZvcVY3NzZkMUNVU2ZtTGJuMVRoSFJvVnpCckxiRzh2aWxYdEdrWGtjSGtp?=
 =?utf-8?B?SVByV3NTcmV3YURiLzBtdDVjRktYRytjUU9BcGxVVDk3U1BKRkZ1d0p2Wmhx?=
 =?utf-8?B?T3JuYXYzK0tPZ2ZCSWpnRVlVZ2wzTjUySUpINzNXZHQ1RUxPbkxkREZ3Z0pu?=
 =?utf-8?B?N1lYYXRRMmxMcjdEWk45ZUl0UHdnR1RPaWQrQVBRTzMwL2d0RkZpRXc1dnVz?=
 =?utf-8?B?bVR2c1RmQU5IUHdhOUR0M3dsU3doTmp4VUxXSTR2cGQ4TVdjdnpRYXhkd3Ax?=
 =?utf-8?B?MWFDN3lBVkVudCt1aDNjVnpMaE0xdVpHWTFRQ2VNNGFXTUI4eGtTZXZiWmlt?=
 =?utf-8?B?dVNaMlpSenVSc3NHQWE2SW52eXJPeUhNdnByaE1TTXVLdWY1WlA4T3lkN1U3?=
 =?utf-8?B?N1A0TUdaM3NsUGd3WWdMOTN0aG03RlFyTWF5dGFubW5LNVkyd0hjSUhHZXR1?=
 =?utf-8?B?dXRvNG5ORjRlcDQrai93SjRDSTd4bGQ3ZzlaRHBEZ3IzdEFKa2djV002UUxJ?=
 =?utf-8?B?bmFvVjFrYWFLV3NnTmRJVFFEUnVUWm15MDRrQVU3N1RpcDJjNjZBNXljNW9i?=
 =?utf-8?B?ZkJKK3loSUpvOEhib2JFTHZzcjg0NEZuMXRMb2d0ZW1RQ2JyMkdBQUlaMStk?=
 =?utf-8?B?b09DbjZOZUFiZjRSNUM5czdiSlBMSnVmYjIwdmpwSU1WSm9mamdaWGkwMld2?=
 =?utf-8?B?NUwzdkpIaW5ka0E2ZzYrYmtOMDZFOGtIZk9SUWxoQy9DckMwS1MxcHBqQytM?=
 =?utf-8?B?d3Vpd2Z5MStSK3VPaWl4M241MFR1UC9KbUwvRGZYcjBrTmF0aGJmUHJHUTEz?=
 =?utf-8?B?MEplcldYU0lHVE1FN3ZuTEZkYkh3TXc3NGlxb2R4eTR6M21OZC9YTXVwc05P?=
 =?utf-8?B?N1FpSThyN2Z6dkVFVTJuZTFDL3lqOGNZMHA1SEhCcS95Tmd6elVKcTNZc0pG?=
 =?utf-8?B?Z3d0MHUyejRCWG5WakRQeS9ZM1d4VnZBOEMyUk5lOGkwUC9nWGJhbE9obTkv?=
 =?utf-8?B?MU9SNTJYOWd3UnR3WlA1S2ViRldnSi9uVVBMN3p3NVRBNXN2RHRiSG5tUFUy?=
 =?utf-8?B?YnJSZXg2VXJhcHlIWTZ0WmR2MDhFd3dmVE5QTHgxSnZhaVNkT1VsSjgrN1FY?=
 =?utf-8?B?T1FzdEdxSnhxZmtXL0w5UldVQXpFcnpuOFpXSXJkbk9GeU5CU2J3RXd4TmZj?=
 =?utf-8?B?Kys4ZHRtK0dsa3Z6TXRXWEQ2TitaV0I5bFFsc245dnd3RlFNSzBPUXNVdEFZ?=
 =?utf-8?B?WnlKS2E0UnR1V3JIdWxwTDN6NEdIZDlWYXEwK2hmMnlJSG1CWXQ4K29YY2gv?=
 =?utf-8?B?TU0vYnZBSzVDZ3hVMVNldEhKbzRYcmhpalY4a2J0SE1MOXhSZkxRY3UzWTFR?=
 =?utf-8?B?bUR6N09WUHFBeEpac1l6aUhuWWZ3YU5ZWFdhRUNwZzVjcEFrQ0h4RktIa3d0?=
 =?utf-8?B?am16UmVIRmpsNVExRjh4NzV3Y2NDZWtPUG9MMVRGY1VWMkhDd09XSGNWem1y?=
 =?utf-8?B?M3YxV3Q4ZjNxNjQ5TXBVOWZJNmdCRGt4MGVpWjc5YkhsYW1MUEh4bmRSbStG?=
 =?utf-8?B?d2pURVRDRXV4dXorbm4zTGFBOWo0UndvSzk5Vm1GZGE3RGR1VzZrc0FXclAx?=
 =?utf-8?B?TXZNZ1ZRMDR5MG00c3cyODNmWXVCL2tuTUR0TjlmSjNFc1JSMllmM1diK3Zy?=
 =?utf-8?B?eEJXMVpkRUtOTElxYkZxeGNnaWlmeDVjYzVZQzdETEpwak5iVWd1dVlKTSs4?=
 =?utf-8?B?TEg3QWppelhPZ1I3OSt2Mnl1WEtsdnVxVkFkNkdrYjJRNDZGUEgvMm96QW0y?=
 =?utf-8?B?K3hkUm1zSU1HQzhsSllISCtCTVFrK3FSUmtGTG4wdGpwVjFtT0IveHE0a3JT?=
 =?utf-8?B?dUliNnc4c0hlMnlCdWMrOWpqbVpmdnRvejVHQUdpdVhuT0JzSXdUZzgrMEVq?=
 =?utf-8?B?Q1N4NFRuVzc2eDc4UDMveFg2cXBGQ2VKaFdaQ2pkMjhDcmpIR3ZhVmZKazBO?=
 =?utf-8?B?SlBtaDVPMWwzenRmY1RzZjl4THJ1V1VscHdlM000MXpUS2RHQmNwZXdLcUZW?=
 =?utf-8?B?aWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?L2M4Tk5CTm1Nc2w5TEtRQ2E2S3J4UFVtMzVJaGZ2cTZEYWx0anhmSFIyTlMv?=
 =?utf-8?B?eUVmaWs0R3RCaXlSTEZZOWtyaDNockRidGwyMW04c0lxVGdMalREMDUwalFW?=
 =?utf-8?B?c3RLdHFhc1drS2pQaGdiVkZpZ0w3NlJ5bVh0SDd5YnQ4N2M4SURzYWI2VTEz?=
 =?utf-8?B?emIxY2pYamFUWXVNcWkxZE1NQndiMzl5OFdQMHNqNWZSbFpVeTlpaHFLZFdW?=
 =?utf-8?B?cC9zanlVT0JVbXpxVWxtUE54MVZUVE10UHViQXhJN2cwVjRlSWNjQUk1Mk9U?=
 =?utf-8?B?eUdGdC9BQ1RqUzhmT1UrbFB4SWJHNlo0TU9USHVTQ3F3dGdoR3hqUDZLVVRQ?=
 =?utf-8?B?VStKQllxbHovd1Ezd0wrR2xYd1VTSktKV0VrVERFbktBQTJHaS96UzQ1WUh4?=
 =?utf-8?B?SVNPN1dIdWVmSFgzZVVQTkFzL0o2SG9YbGs4WEJvdWU0cnp6TEJ3R0Zid0tO?=
 =?utf-8?B?R3RVdkkrcHg1TS9VSE5HSkZuSzB6a3BQL2Q0bGdaTTlwZ3BPMVdLUjRPZ2sr?=
 =?utf-8?B?OUpjYU8wTWxmQjRnbFBjdlpvV2E0UFFMZS9iZzR0c09ZdVo4RU5KazkvSXFq?=
 =?utf-8?B?OHc1OVNoOC8rUUttajlIY0IzdXNkVk1GQnZKRG0wQWVYd3hIRXlBbGxoaGF4?=
 =?utf-8?B?ZDh5M2poRmVJOWZxQ0MzOUx1ZVpSMEVHTmw5ZlBoYTIxSXN3TWxQbmI1N1hn?=
 =?utf-8?B?SlJyd21iRk45VEE3MXBRWDdPY29qYWZJQm9DeURHMDN5dlpSNVl1Nkl5TkhI?=
 =?utf-8?B?R21oejY3bXZvdG9NU2RESjhoSU04c0NadHUza3RsZnBkSU1pSExkb2I3SklH?=
 =?utf-8?B?MUs4TkxONVVKZ2hGQy9SYkZ6S3liUXlMUGYzU2VwdFdwMzk2KzlSa0dkMDFJ?=
 =?utf-8?B?SVlKRWd6YTNyTVlKVy9jbCtZN3pWNkxNUCtyYjN6SmJ5b1dJYXZ6NzExZlp2?=
 =?utf-8?B?d2hNalRTb0trS3NWOXdrTis0aXN5cTAvMnljYnZCaitsRjVGOEEva2xPaXRH?=
 =?utf-8?B?QjNKVWRiS2VaNGlsSnVXSDVwaWZHRzlSR2kxWm9BYWViRWU2dUNrbWVjSEpj?=
 =?utf-8?B?SkM4bzhYUHRTYUZOUEFSUiswc3V6TTJPNklsem84VXorbFBWL25pcW5pWU5i?=
 =?utf-8?B?bFhEZ1hFNTRHK0xTMFJnYWF2akRiOGdoUGJRaGcyTmtaVk9GWjhPVGxtTTkr?=
 =?utf-8?B?NHpaNGpkVVlYMHJyNk9jT0hlcURBMzJMenppVVZ2ZlJBcDlsK2hpZkRYeDJ6?=
 =?utf-8?Q?/0qjKEbGjIcjhvX?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd07622-d658-47f2-f80b-08dace022e27
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 09:56:39.1926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaPamEZy/Tbik2AykysvXeJ1ERmUfV5S5bZntaXQWwbBYohkPaq56TWNGKvjOy+OLbUyNyGJ03F/OWQ5SAW0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5721

On Thu, Nov 24, 2022 at 09:59:25AM +0100, Roger Pau Monné wrote:
> On Thu, Nov 24, 2022 at 06:15:15AM +0100, Marek Marczykowski-Górecki wrote:
> > But to get dom0 display image from BGRT, it seems something else is
> > needed too. Linux complains "Incorrect checksum in table [BGRT]". The
> > only relevant google result I get is this: https://support.citrix.com/article/CTX460227/citrix-hypervisor-acpi-warning-incorrect-checksum-in-table-bgrt
> > It blames firmware. But then, it's suspicious that it's also about Xen.
> > And also, native Linux on the same hw does not complain about the
> > checksum. So, I think it's rather Xen to blame...
> > The table lives in area marked as EfiACPIReclaimMemory in memory map, so
> > I think it shouldn't be clobbered by Xen, at least in theory. I'll look
> > into it later. It's getting off-topic for this thread anyway.
> 
> See commit 89238ef7797023f318f82f4f9dddef59c435b8bd.  I wonder whether
> the BGRT image region is marked as EFI_MEMORY_RUNTIME, I will have to
> check on my system.

Just checked on my system, and the BGRT image is placed in a
EfiBootServicesData section with no EFI_MEMORY_RUNTIME attribute.

To fix this we would need to change efi_arch_process_memory_map() so
it takes the BGRT image address into account and marks the region
where it's placed as reserved.  I'm not aware of anyway to get such
address from EFI data, so we would likely need to parse the BGRT in
efi_arch_process_memory_map().

Thanks, Roger.

