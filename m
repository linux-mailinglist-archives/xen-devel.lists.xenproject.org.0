Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1752A51A4C5
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 17:57:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320882.541871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHNl-0005XD-7B; Wed, 04 May 2022 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320882.541871; Wed, 04 May 2022 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmHNl-0005Ue-36; Wed, 04 May 2022 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 320882;
 Wed, 04 May 2022 15:57:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmHNj-0004qP-7r
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 15:57:39 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eaed3aa2-cbc2-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 17:57:38 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 11:57:35 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3143.namprd03.prod.outlook.com (2603:10b6:910:53::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 4 May
 2022 15:57:16 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 15:57:16 +0000
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
X-Inumbo-ID: eaed3aa2-cbc2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651679858;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/IXhLhDt0E9eeUcwEbn5PpCRkH1HoUzBsCIQ4h0GWmw=;
  b=aV26xk8TaeI0hQT3G+2RBNcjO8DiRmCBE2U6+veJi97Fe8Zd7nZ2mHbG
   Br92cq7SKrhpazGUIl+n8XvzB1Ksk+BFdXwwKkYmwFCJ8gNSi5EBYWRvU
   SCYVSm63kKZpUByydead68QvaZHbjTAiSTCNgollbxXkMYCvls9xV04gX
   U=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 70567504
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0EJejqkxgxmHcrky9tmsdF7o5gz3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWC2GBbqmONDP1e9AgO4/j80lSuZDRyt9rTgpk/3w0EyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkW1/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYUiYMMovsluAkSAh2NA1cPfB5opHVCC3q2SCT5xWun3rE5dxLVRtzF6tIv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXuJkBg2hYasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8A/L+vdvvwA/yiQv3eC8D/z6I+ayXMMMhHTC4
 UHI7WrAV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUHBBqlz6PV50OTADgCRzsYMtg+7pZpGnoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1LUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:pzn0KqvtAHe4Xg3x9zqT15pD7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.91,198,1647316800"; 
   d="scan'208";a="70567504"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AkeQO4+Dy5RtLiXPr8TW6iFLFCuVSxJKYpAVMAQv3vrbT3dvf1egNKeh34Ua4OZ+Ni5/vf2181eVoNjThXLSDjXxEZVy7gR+3kfwn+WKA/TiBPpeYexQfl65h/aPsr3ClO8BZB0FMYq8xlhX93vxiuNKNxp+cOlvBZRpA2uHe5sGd+mLFN393dAMnVvC5ad6h1ZuOlIWJxaKZ5c93tZRX/c0M02gjGkHqWv7G/JnE9SskwFLZiXkfZcz/PQ4nf5M+Ee5tVI6NKDOUCLlQoZqwZemNo0eOZctmT7NMhpVk4cE2pfLURDQF7ddb2UKioO+T5gTMfVJe5h7F7BVxJNtkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bviXjXfbxHmm9UZDT6v/R+s53wKEUsCNE2+bcKi18OQ=;
 b=ezOJCpJ92TNu+quIxGP2Pbe1yyGSIATJPhzUuoVBh2OCpSR0awmMyP2ffZKTTXd4FU0hinUCir8bf0L8oNxjpweY9AMvaUcKP0JtylsqYMsj7ua3lkyF2yxgmWAkN4BdHWPQRFXxhkeVHeyMdsxyL/Y6WDDG9R1SfGzPPyvoAd7iVbGh4n8Wmy5dnKVy4Yh6dAnSC2QT9tngSfdkXVSJpFcmiBdP7/3MNkpchq7hCAEyy3sNKBDlBFgvGK+1ozWUegMf36LgMKeHnjKQCRqukHDP5f4B9sE4FWn37MODnYgyY7cZ20mBmkw1bZxIKQgGYuOovF1W7n64L8IgxJ3X3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bviXjXfbxHmm9UZDT6v/R+s53wKEUsCNE2+bcKi18OQ=;
 b=XFvD32p8UyinAvmTeC83NAUubziA8BaIrJV6/hLw9Goxr6oh8Ejf9uGvAkuxTdSCGAAXxCxi6MTVRw7UNQgEGFOUocl2BH94Jebdykz/q3z75B18vWBhBPrKez4kaosf3/D4/FuFpaVp/iaJaWzvqJKV39x4Nrhz/AsZhLR2W0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 17:57:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 08/21] AMD/IOMMU: walk trees upon page fault
Message-ID: <YnKiV0wGyfGr7ck1@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <bc32c611-53cb-8c4c-1f97-355d58efad4d@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bc32c611-53cb-8c4c-1f97-355d58efad4d@suse.com>
X-ClientProxiedBy: MR2P264CA0085.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::25) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21951acb-ea24-4fbb-ecaa-08da2de6c2f4
X-MS-TrafficTypeDiagnostic: CY4PR03MB3143:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB31434F861E6743C18CCC43BA8FC39@CY4PR03MB3143.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n8aGBsr8id6y+7iNFynoyRwTJhkbiyGCAhcf0SYMp4eeIhJMYe1/LxhDxjyfktCN1hLyL9Gy+u58730yrbL/LXTpoACiNTvWYWgbLkjS2BoAKwfg+dSgF6XDj3u++Rbw99tspDqF4vYdgzKZjHy2KwBSLDesQCACu1jwui8eDfR9mBetEagpgicVKjsL1ehGzF5/ATz8R6HDvnwpHYHzPvsjv2lfbANoZmQ2y+vNAOwpz46AbvHVGjW1a52AjddS0fM2p0mL+zc5YBSvJfoLwF3RY5iFfI7O78k8PIP8E5WuGPRg3R4IJa24MPF3zAT0TV2A5SBJgbMplYaLltCbIEr+gCL9ewzMyRUd90Mx+Je/X3ET3LAtBdT4+Lq+DUj3WXy4EmNjcGY40kEoD6noayNhWRypKDXnHta7tPFERSlaVHA9e+Rdsil1b2OJUWfBg2VIkbgw5/GN+ft6XuC4y6zHPq0W1qViijT5NKYvFMoKuI5VYar4AnJUcTZR7aGzCEqBJAPktrblEn/1jSZ7Hj7gP2FFx98lLciTYpMDm6qcBmWU0Be4a2pVzyeJL4aM9wEgLiai9bKMBHcCg4RWkH8bgVq5IdEAXAZFJsimV8O9Gxy8PYfsH+wpWpNlsSDJWX5MlA21O4nalsPGhWyjgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(4744005)(9686003)(4326008)(508600001)(26005)(5660300002)(66476007)(66946007)(83380400001)(66556008)(85182001)(6916009)(316002)(54906003)(6512007)(33716001)(8676002)(82960400001)(2906002)(8936002)(6486002)(86362001)(38100700002)(6506007)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHhNeDRJY1dMWnlqZzN0TXhRbGlndGI2UGNEK0JsZXVvU25yWmR2OFh1amhS?=
 =?utf-8?B?ZjMyRm9lVWs4VjlUaGVHQVpMNGpNNGRXdVVjdDAvQXkveVBwYkJHQXZxRVhG?=
 =?utf-8?B?ejRkZGVOVmxQNW9wWUgyWEFNZUtrZlVSYlNmcTZuSzlRdDVzLzZpdGhIYnpt?=
 =?utf-8?B?S1o0ZjladFNGWGVucDh2R0Y5dFhvWFd5dWJ3c3E0SktBZkYxMnBkNTQ1U0xk?=
 =?utf-8?B?Vll2VDVFTk51SWlGelEra2lYWnFKMHJWT0ZMVHBOTWVLMTA1NExRclU1UFdY?=
 =?utf-8?B?aWlOdmJlTWdoalliWmtUcEp6clowSWJqNlkyaGFVSEdUSy9KWnBqRWt0WVVR?=
 =?utf-8?B?YTRHK1dwU081VlV3c2tCdktFZm9NQ09zZTZRSmxFY1d0WHV0dXcvbENlc05K?=
 =?utf-8?B?UVVEa0Z1cWR5b2NsY0NBNC9rS1JpdUZBNnlTeHhkWlFNd3NNRldJL0ZPemFi?=
 =?utf-8?B?STVvU3p1UDVWdUVVbUdTek1mSThkNjd5ZjhybW04cXlZRUJnWFVrVmVsYlVw?=
 =?utf-8?B?bGo0bE1ERmVmZTY4aGxHbXdTVi9hQXF2bXhOd3dzTjQ4K28yUkI0VEwxcFk2?=
 =?utf-8?B?UjlvZzFsdkdhZlFDc3VhYTl6M1lSaXI1empHei8wSE9ZakhwVVBHdFNrRklz?=
 =?utf-8?B?amNaME1QQ1pCUWw4b2d4VXByTW5UM0VmajI3U0ZwRExkS3pFdnZweHYwclBQ?=
 =?utf-8?B?cW5zdVlBb1dkYnRqaHZNNTI1cmFzU1BzcG9ZNUlTZkdoSk83SlpBTjRiMlBB?=
 =?utf-8?B?RFJjYzJHR3VJeUdIaEtlOEF6b2NQbkpKRmF6N2c3Z1owMWl6VXZBQXN0M0Fm?=
 =?utf-8?B?NUIvMFZvbDNlWFVqTy9adEE4cTM0SGIrTUVrQzQ5c0FyaXZPZWxpNmZKRGdS?=
 =?utf-8?B?MUFWSEovaTBQYnJvaWtGSGxsNXBGVndWUFhaNDdQWjNyMFRIcDJGNDRDRyty?=
 =?utf-8?B?REE1eUpkUW4yOFJ3S1dPalZsVTZ2b2JoZmhBbzQrVWV5S0JVTEtKR1hQSzMv?=
 =?utf-8?B?cG02b3E0RlExMlBHUXVodFlkd3FxQ0hSRU1JSEs1YUJXTnUrNFdDTGhxRUV0?=
 =?utf-8?B?aUJ6MkdQdmlxcEFVL1czOXRVcjJObjFjQ1hJVUtvY0VtVlFxVG9DV2wvdnY4?=
 =?utf-8?B?OC84YlVqRU14RVJ0MzBiRFNUTDYrL0V1VC9wendMNXM5V1NXTHRRRU1xTXNo?=
 =?utf-8?B?Nm10aTI1a0pXZGlsMElqYndOMVVTYnM1WDRva21XTDQvNEhOSUJoOVhEMzNG?=
 =?utf-8?B?a0xnY3pVNHhkVmhKM29Sc2RlYnhNUzdybXV5UitCMWRXVWMycEtCMmtvTjR5?=
 =?utf-8?B?QWtaN3BudStWbU85T1JRN2F4U0UrZ0RuVFlDc3dnS3dHZlNJMWtFNXMwSDZM?=
 =?utf-8?B?RVpVWGJaMG5HSS9EQnRzNThCSUdseHpOeU1DT1MvRDlBMysrL3BVUjlkMWVm?=
 =?utf-8?B?TE9LTU5xdmNBUGR0dFI3ZEo3ck1tWWN3bmtqeVo5ZkZPMzlGa1BoWkQ3aXlL?=
 =?utf-8?B?SE8vT0d3R3BzZEh5UE8raEdEME93cUpBK0wrNGpCMlEwNHRFQXc3TjRUMFBJ?=
 =?utf-8?B?Q3gwYnZIanpoZVN1S1BhNVN0YTF5RDg4QmZLcitaUVNJem1OT04wTXRMQ3cz?=
 =?utf-8?B?WGU4Y2RLWmZ2M3ljQ0ZmMGl1ZUN3akN5Z0Z4VDR5R0pFSUcwbWVLV1JETHZH?=
 =?utf-8?B?M0VENnNkNlMrL0tOWmVPdi9kV1o5dDlnUlQ4WmdFemphb0F3UEdmaW9RSFJX?=
 =?utf-8?B?MU94djNOVCtMV3JuekhqNUV3K3lOR1Q5c0hsa1d1akYvQ0ZyUWt3ZFE3NkZI?=
 =?utf-8?B?b2xuOWRldnRTcEN5SFZSUlZMOFBVblVvTG1Za0Rzbm52aWVNRFpwcGNIK3A4?=
 =?utf-8?B?N2haeU1zOWJrdzV3cTVFRkcxV0QzZU5BaWtBQ094dWxkNEZqTnJjS3JXN09G?=
 =?utf-8?B?aERad3BUcW01UVdEQjhOTTFKUTlxUzc5S0I5eWhqa0NjSk94L3ZCeDhBb0tS?=
 =?utf-8?B?YkdMUXdvNFgvUXVPaXNpUEJzaFV2K24vWWJtTjFxck9DYmZLRmt6cWcrdDNu?=
 =?utf-8?B?alFlOFZvYTdTY0hvM29KWFAzeTNmNzhJeXpaY0w0UWQ3RWRQaUVCcEFuRmw2?=
 =?utf-8?B?UWFwRjE4U05PcEtReWRKdXRZMVg3R0JockQ5ZWRRaG1yb2pIeWNCbVV4eGlt?=
 =?utf-8?B?NmRNNTROa2oyN2xhS1ZHWWZHNTFqeTZ2aE1uSml5NFhuaDVBNzgxbVpjWEwz?=
 =?utf-8?B?bXhBbm55aTk4RGFwOWRaQlBpVjNRV0IwNEJOWGI4SnV1NXlIWTlDVmhPbk9j?=
 =?utf-8?B?SWVPM3pVTUdMRXlOZlNwVDBUOVAwQmM5OEE2d0h2ZWhna1ZQdEFhL1hmM3Q3?=
 =?utf-8?Q?dNTu+HHnVmDB/XFM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21951acb-ea24-4fbb-ecaa-08da2de6c2f4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 15:57:16.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P0XK614R0OF7RZ8jDgjMMim8uY8TjOW3GS8Yo7hXsMbFI7qo38OUyK+6k6okxBEd5HsA1eU7u/Or2OptRiT1Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3143

On Mon, Apr 25, 2022 at 10:36:42AM +0200, Jan Beulich wrote:
> This is to aid diagnosing issues and largely matches VT-d's behavior.
> Since I'm adding permissions output here as well, take the opportunity
> and also add their displaying to amd_dump_page_table_level().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Note: "largely matches VT-d's behavior" includes the lack of any locking
>       here. Adding suitable locking may not be that easy, as we'd need
>       to determine which domain's mapping lock to acquire in addition to
>       the necessary IOMMU lock (for the device table access), and
>       whether that domain actually still exists. The latter is because
>       if we really want to play safe here, imo we also need to account
>       for the device table to be potentially corrupted / stale.

I think that's fine.

Thanks, Roger.

