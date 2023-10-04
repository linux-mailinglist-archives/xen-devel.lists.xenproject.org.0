Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C97B8009
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 14:59:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612545.952487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1TF-0001Fl-7m; Wed, 04 Oct 2023 12:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612545.952487; Wed, 04 Oct 2023 12:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qo1TF-0001CR-52; Wed, 04 Oct 2023 12:59:21 +0000
Received: by outflank-mailman (input) for mailman id 612545;
 Wed, 04 Oct 2023 12:59:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8y1=FS=citrix.com=prvs=634504905=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qo1TD-0001CL-Ul
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 12:59:20 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d25d84e0-62b5-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 14:59:16 +0200 (CEST)
Received: from mail-dm3nam02lp2046.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.46])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 08:59:08 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6523.namprd03.prod.outlook.com (2603:10b6:303:126::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Wed, 4 Oct
 2023 12:59:07 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 12:59:07 +0000
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
X-Inumbo-ID: d25d84e0-62b5-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696424355;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8w9oI1qoOZzEug7xSfFIZ1QXiiGs1h2u5GRddbVru5E=;
  b=OR4s2eahnuRUtC0HQiLQ942lPhcFo7KHDshuHHrFsckhsBx36RbipS5b
   hX0TkK6fGIblJpWGCGxOSy2zRo47RYNm7GLUdgNLAQBiMbW/C8j8yCU6K
   ryNEjkrdwVlCOyqGs/jwjofPdnxjb0UZrrEYgFCp5b8ybQlgA5GTAE5Y7
   Q=;
X-CSE-ConnectionGUID: kMeHBSlCTLGhinhxBguR3g==
X-CSE-MsgGUID: NJyGuC3SRtG7D9uhVgywrQ==
X-IronPort-RemoteIP: 104.47.56.46
X-IronPort-MID: 127360427
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:gDnLnqMLGsANzSvvrR0ylsFynXyQoLVcMsEvi/4bfWQNrUoh0D0Hm
 GsYCj2BOvjbajD9L9skbd6+/UlV78CBzddrHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5gBmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uVSDEFkz
 vgzFBQibhGFh/Kcz6+BEeY506zPLOGzVG8ekldJ6GmDSNoDGtXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxvza7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqC332LeTx3yTtIQ6Mp+p2eNB22ap2kNMJEwLVWW0sOajsxvrMz5YA
 wlOksY0loAV8EGoVdD7UwePnG+fvhUcVtxTFMU38AiIjKHT5m6xBHUATzNHQMwrsokxXzNC/
 lKJktaqFTFpmLjIUTSW8bL8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXdAirsy
 jqHqCw/gbQ7jsMR0ai/u1fdjFqErJXTUhQ84AmRW2u/9x54f6asfYnu4l/ehd5+K4KeQkiEr
 WIzscGU5+ATDrmAjCWIBu4KGdmUC+2tNTTdhRtjGsIn/jH1oXq7J9gMvnd5OVtjNdsCdXnxe
 kjPtAhN5ZhVeny3catwZIH3AMMvpUT9KenYujnvRoImSvBMmMWvpUmCuWb4M7jRrXUR
IronPort-HdrOrdr: A9a23:3mgilKMR2LR26sBcTjujsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+MjzsCWftN9/Yh4dcLy7VpVoIkmskKKdg7NhXotKNTOO0AeVxelZhrcKqAeQeREWmNQ96U
 9hGZIOdeEZDzJB/LrHCN/TKade/DGFmprY+9s31x1WPGZXgzkL1XYDNu6ceHcGIjVuNN4CO7
 e3wNFInDakcWR/VLXAOpFUN9Kz3uEijfjdEGY7OyI=
X-Talos-CUID: 9a23:mzspuWBBHMe6DYf6EypC+W4+IcQOTlnyzHbWI1+SBntTE7LAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AxhoI6Q64u1d6lz1+ExO8Q5i3xoxOwbWBFWtWqq8?=
 =?us-ascii?q?alJaoZDFwBTiMky6OF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,200,1694750400"; 
   d="scan'208";a="127360427"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WODj7XDwth9fV61l4NFeCfcg8mcRHau5x7/QqWR5wcDCPFFn/qyn/+7y8Ngh8/wqI145juK4cnHdnSfOWcj7xQ1rF8q0Igx/hqGvH2D7/qbLpEmQBG8PLATabmIyQlwgUQnAU4oRKeylHx8hJEUu5WYN7UkLtHmqB83K5cz3E57/xRtZK5eEgp37p7ZFIQ1Qq50SvIs4ZzisyiZ4RdYOmpfc04sGcgHGTqMd5qZVCdHEO/CS8+cNbijxXU4UaKxfP09m28z+JqNdMIGyMMYJ+I+okYXWjzO1bD+3xGuyXlaKOwMy3R2PzpDJQrwZmhTiVWZosjLk6hzGWyGLk2V1Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVNOvd32f5UBcMAkpgUyu385fYKCUqijRhKV4I65DGw=;
 b=TiPtJUo6qWMnnKtq/FTM1TkLHc0AZ08TBytsvOGJ8ziJLaFZqbe0/ngRESVx8RD2wPS7Tl1PtVvzJaVk7+CAYspCsg4HX+JrMRW2AGVFVXAMG6Cl6+muhA0aMK5QQXXsGoRggDYadQ2f9XEfDbOz1VBAZN+OSYneGlMqcyqnhrIpwIIOAXKm+ybR3xdh3J/CVvVOp/VbFMt/n2vR66POCtkfvwbwNay1vO2VxxuacVqnY784vmy4Z41PWN56hJHHwBDxtcU6eR0gSlGOkra/zr9ZbAxC8Y2MB5kjVkQ+1XE1n5tJBeMrXcyzrMCpLdVN66hIzLEHBJQLJ1iasbWIBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVNOvd32f5UBcMAkpgUyu385fYKCUqijRhKV4I65DGw=;
 b=c37JrQauapRx3Nt3RKu87meP0HQ1qSYtSJ+nvZpr1m73K881SMOuj+40yEA8fNUIIivt9A3hBOo/i61iTp9IlGDI11UB0+LqmA0x/cgNULu5Q19iVwciXQfs7l09dCFSMwo/4TrxW7XR/rGHsUFGE/f/MpUnlo9TncvnE2GWC2I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Oct 2023 14:59:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: Julien Grall <julien@xen.org>, Elliott Mitchell <ehem+xen@m5p.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR1hliaiprDqCjyQ@MacBookPdeRoger>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
 <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
 <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
 <c0b67401-dfe5-475f-8640-b66ac32a80fb@xen.org>
 <aaf14d06-4e29-4de0-8e56-ff200f21b692@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaf14d06-4e29-4de0-8e56-ff200f21b692@epam.com>
X-ClientProxiedBy: LO4P265CA0310.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfda2e6-53f0-46be-592d-08dbc4d9b1d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LLTtkLp+cvw61cVncYFTKMXwugQeQz4DjQ/NoKY9VruSCYnkrETjIGlq2VossFjRoMLQMW6japEBFJ9J4mzHHXVpXiv/59/AhMW7htLFp5kRyntAFTkQMrUGxr1yxpfQU6wZnjkFnw5bn0d/BybUgmbT9o+gr4HmOvd2Qq07GPbEZh7ZBe3NA9aHp+yG/h9e0BXx7t9YZCyTdtcFGgssnlWAs+JmLu0AUKizM/daE5/36txiCUQk1hT/YI80WA5FuV0kXyg4RBXIeU/7msQUQb6a1GUY86lBfDRunQvMWMfuHLfa3h2/YdckUL2R7wnKdS1ichLI6pRx6Nytw5su+NOdto0pVsu0MW47o4H9vlaQ8Mx37df8NUOMsZ1fCKWto1iOO9ud7GzfqMmO3JBGH2K5cACjOCHAP7UJgVsIYABKspGatwfHGqaUfDAjFRpmOqPfCzepBCXb3ojSCiHyejWNVRyGK9oFn21AxfF3p8XJ8r8ERo8S/DkGls7RZZEe8bzA2eku6JYnNEhJF+p8LEqq9E8YS2ocqNGFKII0fHcA3s1t9KV4XvZEHB74ynkc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(346002)(396003)(366004)(376002)(39860400002)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(41300700001)(478600001)(5660300002)(66476007)(66946007)(66556008)(54906003)(83380400001)(6666004)(6486002)(316002)(6916009)(8936002)(8676002)(4326008)(6506007)(53546011)(6512007)(9686003)(2906002)(26005)(38100700002)(85182001)(82960400001)(86362001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qnc1MGNXSXY0MDZrOUd5b0JUTjV2R2tmNU41WmJhbjJoUUFNejF0NFlXQ2R4?=
 =?utf-8?B?S1ZsSU9GNW9yd2FxejcvQTA2blFnaUhsZjZLUm9jckFZd3pyTG9jM1NvamxI?=
 =?utf-8?B?ekk0eEU2UDRhdkV5TVpFRW4wTldhK2p3TXFlTkxCbGNFL3J6TVorT1E5NjZt?=
 =?utf-8?B?SHNla2R2a01ySG1lamtwcGp0KzZZSnVXZmF1VkV3NWxtdGJydmxlOTcrZGln?=
 =?utf-8?B?MmxQZEwyeWQ5eXZydXJ0Ykd4MCtkWHgxemEvKzFSTmlMTzk4a1FYQmhTdUlo?=
 =?utf-8?B?TFhKR1g3Y2JYcWJxckxPcEFocG11NnZnYmppbXRrKzZyaVBCYTFWQWpoS3do?=
 =?utf-8?B?OHRhUEc1MnV6anhOVzFFVHRqdjlHVzhBSkVEa1U2YjRFY1hHd3dteXFVU0xG?=
 =?utf-8?B?d3l0TWszZ1o3NkxGZm9TRFRyYzRFQ1p2SlB0U2owU01zR0ErVXc0YXJRcTY0?=
 =?utf-8?B?MjRZQm1mSEhtdGVvT1hLcEZJVEhaVHpGTGZCL1V1dlRPVVgyNUNVL3EyVW4y?=
 =?utf-8?B?bXB6SDNVcno3Uk1mNm14QU1DU2VFWS93QmtRZER4U2NKSkM5VlFtZ3Npanlk?=
 =?utf-8?B?Q2Q4Z3VXaVRYUjdoNlpsRTYzdHdMV3dSK0RUa2RMajE1MlhiSWs4eHFyZVhx?=
 =?utf-8?B?UkVBTnUyZStYeGVZbDhBSklXSlpGNjFGcWY3cnRDMkRoUUJ4cUJjWWIyM2dB?=
 =?utf-8?B?ekZ0eTd5VTViZGtuMGdOOEJjTitqcmNJYnRkQ2RhL1N5bmo4eXI0d3pFWW1B?=
 =?utf-8?B?QXBvbExQa0F6bHFyck5kNXlXcGxsckVEUjJmNGx0N3oxbTZiNTdjZFJoaHdw?=
 =?utf-8?B?Y3EwREFITDA3WUtCN01SM0VMSGp2U29VRnFRbVBmUEpTMnNIU3IxSEoxR254?=
 =?utf-8?B?OTVWUmlFU2Zxek1DUXJCV1lNNVBMMVpCek5tK01MNCtoL28wdWI0U2wwOThU?=
 =?utf-8?B?Wnc1bFNNV3c4UmV5c0pSRUl6MlREbWluZXMrV0E2UkxqRlRCd0dUU09wMXly?=
 =?utf-8?B?MG9zRnhwY1lmODRyY25yVHlKQkUwRk54SjVaSkM5T1kvYlkreTFxY1EzQnZi?=
 =?utf-8?B?bEpTYkc0WG1SUElzOE4zeFhnczc2dm5UdXF3Zk1rV0pwdXRaVFRSWC9QQ3Fn?=
 =?utf-8?B?SCt4YytteWJRVlhabWtkVXF0RWhhYUhtemZBQVhVcVNHeW5VaGt5RWhwOWJk?=
 =?utf-8?B?VCtiQ2ZNcGQrSmVqQUNnTFhCZUsyd29TSHJuenAxRXgyQUYrVTFObDdxSkVv?=
 =?utf-8?B?d0JrWUh3R0dtdnlYWGY0dGpoYVhaU1BMbDFzTUV1Y3RwQU10KzBzd29lRElI?=
 =?utf-8?B?bStybHFwY1RhYWpLNzhpZHY1WXV5SDdRQlZEVzlKQ0FVYm5QRDJ6TFlpZ1Vm?=
 =?utf-8?B?N2ZGMmh4UDkyeGd1U0dOYWpQcE1ibm9ENmN4QVluV1VXYUl2OE1iY0M0bFp5?=
 =?utf-8?B?aU1Fc204cjJFbytqOVI5aFlXdjdaUS9JSFVQQkI0cHFGcW1QOTRvOVdJYXhq?=
 =?utf-8?B?akR4REdBeHlsRkRvNXJKMGxvblBIR216YkQvTEhRRFF2VWZVVzN6UVNyMWJN?=
 =?utf-8?B?RENwOU9idnN0NXRxV2YxQndFby9qR1NFVDF0S2FTTVg2RmRtazk3Q0ZqTlQw?=
 =?utf-8?B?cUp0Y3RYUkl6NmMvcDJUdElPZ3RLUjlZVGxWQU96dnJvM1ZsMndmY3U5a2M3?=
 =?utf-8?B?a0hSNHkxa2ZzMko3V3puWTJzSlBKSjI4bythaGIzRTBYL09wMjc4dUpYNTFt?=
 =?utf-8?B?MmlqVjFKL0lYdHUreGl2YklMUmR0QmM5SUtxRXFvKzFab3BKcEl6d25yTmdF?=
 =?utf-8?B?TTQ2WVpxK2dobDc5SW8wRWJRcFRoRXk5VUREZXl1THc2T2JxNC9RSno4L2xx?=
 =?utf-8?B?ejFpSloraUJQU3A0UkFzdTRrdnA1R2k4NlZ5Yko0K1NYMTdtMjN2T0xud1lE?=
 =?utf-8?B?OElablJsdWNnUU1WOTlNMUpXcW1IU05kcm82T2paQ3dUMHB4YitOTGFjbndn?=
 =?utf-8?B?TmFqVExYdzUxK01EU09US0xHaTJGaXQrZ2FYWFB2akxKUzJ2NjV0U2IvZHBR?=
 =?utf-8?B?UnIxR1RtNGFFaXRscFk2MVpadTRhcEFUQ2FSYlhEeVJLVWN6MzhuVUpWYlFa?=
 =?utf-8?B?ejVVVk0zK1F2RjZlUDZRa0xKeW85WXBFT0JNNmZnUEtxUkJYVE0wZFVkUWJv?=
 =?utf-8?B?T3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VS98bqE42cdQyVoIlc2rT8STwcgUvHDCEh5kI2KNEmTbz3eWbQbOGlUl+LM0w/fY4APH1uk2eGfhksrgUxTbbDUfS/Yi6rP1n5GoIRJigPgC6jo1yFKcdMKJMkEAfDiCfOwz2EIdxoeiahR/NlfUwE0S7e68zS1XlPNHg0MFlRpv40r10UQ2noux77rubHnaHRpnXM20qtVtCpOjhP/J0QC1P+INj5OoyqmHwLLXm1k0cNr6Ttr6VFQmsFGmMBJyez1p3qA2Ag/tMYW/A+CsTj+wcqdFRLFUYwv0Vso9YLm66d5mRMKX8DSfYFXZg6so7dN5nGcllmR86ASWnkMH7IXBDqAbciOZH9BD/ibhUDrBSj6ct1Rb4F4G6+0SxDmamraYFcNU7x2okm0IwuAfaw94oThTvgFhKPvkoUwGFtQpkYiV6TEjugVwRG7xGDbScK3qiNe3WdnvxWpy0JeiXWJqoJKSRdULXTOEnUqDJu6VN8nlGui5qZQyd2nA9JFQTl/t0i6mK1Gc6KUwwVqPZPUP4sAIBtRdM+O/q1ujAqvhYeAFuO7WgFvwN+tIIweA1uLItDyThrrAAApPIW0TVO2/6UVUPtid4fxCWBe87Y6w1e3rDvIg2NoCxQU0poW2fPfg4c6je/CR/d9a9vtEBlqhA4K9wioFaCOCe/98RZIoonzY6m2hM3PR7yus2CkDJMEZjc+8owd9D8vVyZ7BUyuy9d2reQ/ZscpwZcKYy4y4qGRL4bB9LZB3PYUohwZJzJe9cnO8yU9sAF8Vku3vLpLhkuOsbZITszMD0Tc4rGs07j55YakjSpL3LW1zQT3vKUQUDpjxcd3TDci1nR4fvD8d/tYU3TTPnmpOTYhGM5VewHw/q5yAQkPRJd8nSNGQjxGoxlgjoURwpWl+l1+Wrg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfda2e6-53f0-46be-592d-08dbc4d9b1d3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 12:59:07.6293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3Jvqfw1m2gtAj2crqSvGcbSfMo/6WoEqb+Loj1rFcnvwB5UTGMcOX5udCxNFlp15bvtMcwmMConMC83HTlc6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6523

On Wed, Oct 04, 2023 at 11:42:32AM +0000, Oleksandr Tyshchenko wrote:
> 
> 
> On 04.10.23 13:55, Julien Grall wrote:
> 
> Hello all.
> 
> > Hi Roger,
> > 
> > On 04/10/2023 09:13, Roger Pau Monné wrote:
> >> On Tue, Oct 03, 2023 at 12:18:35PM -0700, Elliott Mitchell wrote:
> >>> On Tue, Oct 03, 2023 at 10:26:28AM +0200, Roger Pau Monné wrote:
> >>>> On Thu, Sep 28, 2023 at 07:49:18PM -0700, Elliott Mitchell wrote:
> >>>>> I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current 
> >>>>> issue is
> >>>>> the changes with the handling of the shared information page appear to
> >>>>> have broken things for me.
> >>>>>
> >>>>> With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
> >>>>> of the 4.17 release, mapping the shared information page doesn't work.
> >>>>
> >>>> This is due to 71320946d5edf AFAICT.
> >>>
> >>> Yes.  While the -EBUSY line may be the one triggering, I'm unsure why.
> >>> This seems a fairly reasonable change, so I had no intention of asking
> >>> for a revert (which likely would have been rejected).  There is also a
> >>> real possibility the -EBUSY comes from elsewhere.  Could also be
> >>> 71320946d5edf caused a bug elsewhere to be exposed.
> >>
> >> A good way to know would be to attempt to revert 71320946d5edf and see
> >> if that fixes your issue.
> >>
> >> Alternatively you can try (or similar):
> >>
> >> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> >> index 6ccffeaea57d..105ef3faecfd 100644
> >> --- a/xen/arch/arm/mm.c
> >> +++ b/xen/arch/arm/mm.c
> >> @@ -1424,6 +1424,8 @@ int xenmem_add_to_physmap_one(
> >>                   page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
> >>           }
> >>           else
> >> +        {
> >> +            printk("%u already mapped\n", space);
> >>               /*
> >>                * Mandate the caller to first unmap the page before 
> >> mapping it
> >>                * again. This is to prevent Xen creating an unwanted 
> >> hole in
> >> @@ -1432,6 +1434,7 @@ int xenmem_add_to_physmap_one(
> >>                * to unmap it afterwards.
> >>                */
> >>               rc = -EBUSY;
> >> +        }
> >>           p2m_write_unlock(p2m);
> >>       }
> >>
> >>>>> I'm using Tianocore as the first stage loader.  This continues to work
> >>>>> fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
> >>>>> While Tianocore does map the shared information page, my reading of 
> >>>>> their
> >>>>> source is that it properly unmaps the page and therefore shouldn't 
> >>>>> cause
> >>>>> trouble.
> >>>>>
> >>>>> Notes on the actual call is gpfn was 0x0000000000040072.  This is 
> >>>>> outside
> >>>>> the recommended address range, but my understanding is this is 
> >>>>> supposed
> >>>>> to be okay.
> >>>>>
> >>>>> The return code is -16, which is EBUSY.
> >>>>>
> >>>>> Ideas?
> >>>>
> >>>> I think the issue is that you are mapping the shared info page over a
> >>>> guest RAM page, and in order to do that you would fist need to create
> >>>> a hole and then map the shared info page.  IOW: the issue is not with
> >>>> edk2 not having unmapped the page, but with FreeBSD trying to map the
> >>>> shared_info over a RAM page instead of a hole in the p2m.  x86
> >>>> behavior is different here, and does allow mapping the shared_info
> >>>> page over a RAM gfn (by first removing the backing RAM page on the
> >>>> gfn).
> >>>
> >>> An interesting thought.  I thought I'd tried this, but since I didn't 
> >>> see
> >>> such in my experiments list.  What I had tried was removing all the 
> >>> pages
> >>> in the suggested mapping range.  Yet this failed.
> >>
> >> Yeah, I went too fast and didn't read the code correctly, it is not
> >> checking that the provided gfn is already populated, but whether the
> >> mfn intended to be mapped is already mapped at a different location.
> >>
> >>> Since this seemed reasonable, I've now tried and found it fails.  The
> >>> XENMEM_remove_from_physmap call returns 0.
> >>
> >> XENMEM_remove_from_physmap returning 0 is fine, but it seems to me
> >> like edk2 hasn't unmapped the shared_info page.  The OS has no idea
> >> at which position the shared_info page is currently mapped, and hence
> >> can't do anything to attempt to unmap it in order to cover up for
> >> buggy firmware.
> >>
> >> edk2 should be the entity to issue the XENMEM_remove_from_physmap
> >> against the gfn where it has the shared_info page mapped.  Likely
> >> needs to be done as part of ExitBootServices() method.
> >>
> >> FWIW, 71320946d5edf is an ABI change, and as desirable as such
> >> behavior might be, a new hypercall should have introduced that had the
> >> behavior that the change intended to retrofit into
> >> XENMEM_add_to_physmap.
> > I can see how you think this is an ABI change but the previous behavior 
> > was incorrect. Before this patch, on Arm, we would allow the shared page 
> > to be mapped twice. As we don't know where the firmware had mapped it 
> > this could result to random corruption.
> > 
> > Now, we could surely decide to remove the page as x86 did. But this 
> > could leave a hole in the RAM. As the OS would not know where the hole 
> > is, this could lead to page fault randomly during runtime.
> 
> 
> +1.
> 
> In addition to what Julien has already said, I would like to say the 
> same issue was faced due to U-Boot (running as a part of Xen guest 
> before OS) didn't perform a cleanup before jumping to OS. This is 
> already fixed to follow the current behavior. I didn't find 
> corresponding U-Boot mail thread, but can point to already upstreamed 
> commit in the main repo.

What about other bootloaders?

There might be other loaders that didn't unmap shared_info either, but
that removed the page where the shared_info is mapped from the
reported RAM ranges to the guest.  In such case not doing the
unmapping was benign, as the guest would never use that gfn as RAM
anyway.

Thanks, Roger.

