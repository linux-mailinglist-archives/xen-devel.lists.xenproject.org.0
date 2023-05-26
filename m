Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72741712BEB
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 19:40:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540194.841793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2bPz-0008Lf-6B; Fri, 26 May 2023 17:39:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540194.841793; Fri, 26 May 2023 17:39:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2bPz-0008JF-2p; Fri, 26 May 2023 17:39:59 +0000
Received: by outflank-mailman (input) for mailman id 540194;
 Fri, 26 May 2023 17:39:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2bPx-0008J9-Lp
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 17:39:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5338a76e-fbec-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 19:39:56 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 May 2023 13:39:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5372.namprd03.prod.outlook.com (2603:10b6:5:24f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.19; Fri, 26 May
 2023 17:39:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::81d5:6cc1:5b52:3e0b%3]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 17:39:46 +0000
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
X-Inumbo-ID: 5338a76e-fbec-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685122796;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ExOwuS4NkhFIgCw2A0pWS2ykuSTUwNMkpuCajmdIFJs=;
  b=Wy+KO2oVQamiPG/zhMgkaOmUDlew3jNFWNTPHUi5+tk5rbi0dnWW84Qz
   kFRLXaZHEY/3QvSeyFMEebd8DU1KgbvnLFm8FaOznbes+Rt5AQ+Khrlw6
   si5wkDli0DDKyXMtpbTrxyl7jPovzY4yrODiZmpEonIRJDOjJTGQio9rv
   w=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 110459821
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:47amDaiO5XQuNO7sRC3JIZqsX161oREKZh0ujC45NGQN5FlHY01je
 htvWG2Fa6yCYTb2c4okPd+y9R9VucTRyIVkSgs4/yhmQigb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQDMDMGcwqAtd6455mGe/hN35wGKunCadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluSxWDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTeXkq6862gT7Kmo7Cw8Xf0WZ4v2F1xSkStJ4N
 1NM4ycvlP1nnKCsZpynN/Gim1aNuhMeUtxcCep89giJzqfW5C6SAm8ZQnhKb9lOnN87Q3km2
 0GEm/vtBCdzq/uFRHSF7LCWoDiufy8PIgcqZyUJUA8E6NnLu5wog1TESdMLOLGxps34H3f32
 T/ikcQlr7AajMpO0rrh+1nC2miovsKRElJz4RjLVGW46A8/fJSie4Gj9Vnc67BHMZqdSV6C+
 nMDnqBy8dwzMH1ErwTVKM1lIV1jz6/t3OH06bK3I6Qcyg==
IronPort-HdrOrdr: A9a23:mDnsTaqLyEpIkSNLnfIkfogaV5oZeYIsimQD101hICG9E/b2qy
 nKpp8mPHDP+VMssR0b+OxoQZPwIk80lqQa3WBuB8bBYOCOggLBRuwP0WKF+UyFJ8SUzI5gPM
 lbAtFDIey1IV9mjdvrpCmUeuxQuOVvKZrY4ts2GU0dKz1XVw==
X-Talos-CUID: 9a23:/Wsf7Gz230CtIHKK4QSOBgUPAsMub2fe/kveBGSFOHdIEeWwT3+5rfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A2LcbUw2++pxnzPf+UvLejtXxSTUj4LavIl4v0pE?=
 =?us-ascii?q?65pOeJCxXJyjFlTm2e9py?=
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="110459821"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oBn0EJNV4+Ro4kpzCAxBQ+gmFij3Ci2wKh+/fN5ybYkMG6zMnJYSNres6J97b44uFD32mazN6V7ArswNfXxaUjLmUbvKW+pmSq1rx95ObLxk4r9/sggJa1MeAlKvgWp9RLnFb+Ft4037q/kSDkYxYmpRilpVFFfekTzF5nSC96/9r6ztVktkEPLm1GIqZYyS6+ph2TTt1JFgzNjTQg4rsoDoJDGkYC59IEWuBfBjVl3TkwtIheLzI20pdEv5byjAQue7ZePL4UeqFUz5oUYlJ9FkhCJgyqAbnSUDVJNFTFBA+2ROpgYhC9i0OmKggeE/JiLVDzg301CC1Y0yRuFA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExOwuS4NkhFIgCw2A0pWS2ykuSTUwNMkpuCajmdIFJs=;
 b=HsyevtedgjW2CnGvOO3kFlU+pkzmI1vtMhngrYrOBMkl9K3NTQ65Zi+Yf0Y8B2Aqucz+ve8rW5DhnE5tAhR+agtWtE0bA1ckcbBwl6tNJpYUsIWkNZoQWuXMvZl6EtxUuWjPDeCAaM/rzp9tIEnaheh2dnXlOdjH8ITlKVdLoGlfQCJsphcjw1GLKxdC7x69QzYvo4ZpYKkrTQUzzlXmngBADK8urwnWCobbt0xp3Z1GcWksNcmzo/50KY1LYa/wAWIpm6cERSj3wRiEc1Xt1Yl3ifKFj4WhsoE9T70zQ0orf5CsJ6IQ7go2xRBVlc633xIUMFFbH49UMGbPtSmzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ExOwuS4NkhFIgCw2A0pWS2ykuSTUwNMkpuCajmdIFJs=;
 b=Ls01Jlf3yysfHiBu3dFmJ6FrmtABp2pkk7mhrccklRHxNxZgped0/7KWk/rg9I6T7piSjJWqd25bk5IUhwQvwOsi9zKVeB6ctFXxp9MK/3nHUPG//WxZxe+bPv4byJc3g7BoGpFFgDSFbQz6hLrE5/TXpb47JnRZuEC662dVv2g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0b35054e-6641-91b8-562e-cd5766300966@citrix.com>
Date: Fri, 26 May 2023 18:39:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/3] x86: Expose Automatic IBRS to guests
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230526150044.31553-1-alejandro.vallejo@cloud.com>
 <20230526150044.31553-4-alejandro.vallejo@cloud.com>
In-Reply-To: <20230526150044.31553-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0065.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5372:EE_
X-MS-Office365-Filtering-Correlation-Id: 8680d15b-2611-4bfe-4018-08db5e103196
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RQUE2zMMGieKzeXDEse4PuosqKx6DxXq0P8vxf51WYUPU3+EsUsigE0RYsdp1l82RarptpNNF+VbECiPb49wn3wog7pLmNdkMW6LVRu/etDUftkbsS/9jesPUbkxH/4eGsWWMrYSNpxa5G+qh6Q7/hs6NvmEZadLjBOWf1I+mr0DuGtDarIyTwPvpy0IXN4SRWNZDE33WvJMQYKRit9qjOHkmGJZpP8v1EhGz0Y528TymRGZVPQZXDC5Pi2sTmrqaROV1MPcjZQsBACLzNsesavRhzEjSjvEmGIQdKnuRUOPMfvBlH+QmFPUYgUHoAwjupZJ6z9B4b/zM+hD1xD25Rs0YyHQmpSIU3uWdW2r6ozFJJWspmLRdoTl0OXPxsfjMuUZBDxAKnF+cfbAvSWS16BwcD0kg2YjLxuQumngsypQss/nRXTiOeH5wkJXP7OpBPewyvbCxbz704svW7IgfCxRIfLLli265+6735TGZ5IeT0wOfW5ZM/2fd3sz8y7M2sRHJVGPIRUrw15l1N4VUGm+1kLuKc7AElByAyu6YcnsHOw4E2aX7ieexF+4vud7zELiwEmGSwcXwRIbgK864UUvV2SMaxgGgC9IfnWtGCLYTL+AdBSoHexaREAfCVptTZW/xzis0tde/Aj8RNChwA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199021)(31686004)(54906003)(110136005)(186003)(86362001)(83380400001)(478600001)(31696002)(2616005)(2906002)(4744005)(82960400001)(66476007)(36756003)(66556008)(53546011)(6512007)(6506007)(26005)(38100700002)(66946007)(4326008)(316002)(41300700001)(6666004)(6486002)(8936002)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3l1Zjk3NzN2dkZ4RFMvcjFwNEZ2clF3aWhIVkQ3djlvZ2J0ZzhKUVNzVDNE?=
 =?utf-8?B?YlVLUkVVTUowVmZreURRS2hvZmpGaC9ZOFMrUGF5UnFiM2ZQMkg2T0pkb3dG?=
 =?utf-8?B?V1NxRUx5bGFJcDAyTnRneFpWdk5rQ01BbWNvRmlBTm1zdGR1dGJES1ViNm9a?=
 =?utf-8?B?Q05ZVHphS1gyZzhPTDJPd1E3QkJBRFFVek9FOUQ0S3NXNVgvRUNWQ2MwUWRN?=
 =?utf-8?B?M0R1WSs4Y3dhVlllU0hJV1Z1Rit6b1FvamJGUlNTclhaVWEvUk1ZMmkyWStI?=
 =?utf-8?B?S0MvVDhSMlFiYXh2RWk0SVVFTk94YXNDRERjeUM5aDFkQWc4cXlySksySndO?=
 =?utf-8?B?VkhDM05XUjZndkN3dGdRMlMvR2VNYTF5dk91dG1pTXVHN3JDdWpnYUdtWHda?=
 =?utf-8?B?MFhCeCtLYUV1Z1JWZEdudHhNcm41ZDIvM2VPa0ZiNnlONW1mUGk1TmxiMUVO?=
 =?utf-8?B?QWJoWGU4Yy9ySzFGUFcxWkZTMTkvdFR0d1Q1M2wxN2xLbjBoV2hJNVVqZzF2?=
 =?utf-8?B?cmZCeEFYbTlFT25zcWZTT2FrcTZ1RzVVakpOSGZJR3crVUxML2ZMZmlRNkJn?=
 =?utf-8?B?RlBqZWpLa2pwUFA0MGprNGdZMUR0OHl2Y216bm05SmVvWHRFbW1MV3gyM0FZ?=
 =?utf-8?B?L1ZaQ3VZcVN1L1c4c1ZyRDZsa1RrbGdSbHFXK0Fra0ZWdDA1U0VrVmo3TkMz?=
 =?utf-8?B?cms5aE9GVGpzYzlvdmJNKzByb0Z6bUJmdEdseDUzTmtxcGVFdVJJT1BGODFX?=
 =?utf-8?B?WlRseFQrVEg5d2pTckhjUzM5TXRLUzVENDdHVjVpejBRcENaNUFGeU1xYS9D?=
 =?utf-8?B?TlpETFRkTW41SmdmWEl0bzVnelU4dGxBRTArcnY0U3d0akNtc3VlY3pWRlRG?=
 =?utf-8?B?NmtZWjNHYWF4czZtTG5LUVJkWUxobXVDL1c2cFZoK21kTllkV1BPMkVmUlJX?=
 =?utf-8?B?L2JJOEZ3L3VLa3h0V1FqK3lFbVgrWGU2SjE0ditCUGg2MXlzM0xzUkJTdG1U?=
 =?utf-8?B?dC9BTDk4Z0IwUFhMUlUzd0FHamlBSDJiZlJVTGhVWVFMdnV0YURHMGlGUndS?=
 =?utf-8?B?Vzh1eUJqY2ZKL2NtVWswOTMzL08zWnV6bGVlbzh2VFFOUGgxeng5MFJraTg5?=
 =?utf-8?B?Z1FBbXZOdEl0Z2JyZmdpL3JEN094NitiWjVucWVRNW8zb2kvaUdqdlhLeVp5?=
 =?utf-8?B?ZnBPT0JkeUhDUXFBNXFBeGVSZWZtTlJJY3ViSWlKVkN1MDZQYkN3Tm1ROE1C?=
 =?utf-8?B?V1pTTTc2VzE1VmFnR1QzZ3QzNHlPZXNLeERRMHVhUmd2ZytrNzBuZE5NeFlF?=
 =?utf-8?B?dFFRUlM4TjVOZWZnd2QwdVBkNk9tVmJZRnJUb0RaT3p3MzVacllCclRkaXky?=
 =?utf-8?B?L3RpTFlJTGUwelBISEZYWWxaWldyaTd1eTkxdnEzUXNCVERqQjROWmhhRTVz?=
 =?utf-8?B?dXFicEVsWmVlUHg0S0tnY3RqWjUyYks4Q2J5ek02eHZnQUpWTWx5bXNyRmg0?=
 =?utf-8?B?UVJwTkwzc2F6WW1zQ0NBNVNRUmNXUTlsRTJaNThPTVRVY1YxR0ozaFRhUkRl?=
 =?utf-8?B?Qm1XRmxRRWh0NVhoTStSZmtxZFo0T0J6UTRQTnAyREcyeGw4K0wyb25sbEpr?=
 =?utf-8?B?V2F1T3ZvUllSdEhuR29OOTd5SGR1MUxidVhPMUltZlJxSzVBNzBoWURxaFdV?=
 =?utf-8?B?YnRvTEFRcGJwMGxFNGV4RzFXQ011UUp5K1lkcUd2d2NxQk5wUm9QcHo5bkI1?=
 =?utf-8?B?S0lQYXpuOGI0a2Jxb01IR2QvMjZrajJERjBYNUtZbUZUYkcwRGdwZktqU2E1?=
 =?utf-8?B?Q1c5T0Q3bXp2ZzVyRmNGaUF5YXp0OEpkNXdWZ2orNThnR3pRdU9NM2FDejNX?=
 =?utf-8?B?alNXOUU3L2YwbjVHQ0VzN1QwTFMwaDJRK3NudW84WXJZRTFubVhRVHI5bmwz?=
 =?utf-8?B?TkUzaEo2V2x6dGlaQ1Vjd0oyUUd0dTE3dDM3VjgzaTUvNVdDQXIvb1FYMkpP?=
 =?utf-8?B?UVdPamYvSmhPcVJGZVRsVHcxTGw4L3Z1L2lPSnhpbkVNRXg4YTFkWERzS1dT?=
 =?utf-8?B?dm53SVg2MFNqc1pURVREMFZFeWJlUjRxYW1hYlBNT0ZLdHpackdaM2hwTmY0?=
 =?utf-8?B?elhaNVNpZEdaVW1hWlBDYjE4and4UUJMaGJlVEJyRXhzQzhJSWN4anhJYmlC?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sbhvQkBkfuEowAOw+yYefy0wYLcZI3PSggr/bih4oFJpioARN9GQyNkX35JN9pmFnxpl8s10I4mdCkNe+w7J4i1F35cJBZ8VFSSdRJVs3uNo5UCmP3rA26pj1VYILRuVRAL/B/8MoAndu5EsYTdWXUf0Er9CmmNBb16A7ShZQEoWN70Y9Dhh42yENoqCYnCYr0Z6/ps9jvKwc1dZbRiqfrGs022lYqubV4gY30tBXU9DtQbnm0vxCrh2LzK8Zw+S0GGD7XU0eRT504LCKkheyYx12jN1JYLburl71MdaGw2Fd9/5fYVeNl88zTN8+eyi2sZy1XEwpJ7PiGuaph10vtcNizW9+UbWtM12ASImF6GVi0FwHMQToP5ScV3l7dYFK9LMNzYuD4eh6yOAahfAaHkBvf8uFZYI7/4BK6MvT+HhKFpmlEkKDpwyXKpuYOBgN3lrUMkbAKIzBuGn7lXapd4XPwcUXUtCwULq5P3uk0Lf5N4m6FVahdcnQiFIhRoi2UnRJDg0OXHv9Z7KjHAAOj+vMdStQCq2BTZzyW8GesfOoCv+KsTdfAjLLsf+O/Lgr2VfeU/zv/6tTH3Q8v9GmHx34C1FuS2KkLsFootTkH3NFeMkNGqYoPyTsJGxziT85UgXiRF+uREjWEmf26xqbioTu7C1D8LBSHdXuu865xxy8vj34+bE2fBKc+PRT2JBwyd6VUGWTLzVR3nGWm2cjygF7PuJhmOj3uNFUh5dyke0nUZ8oI9sKSkAwxKlEmmrfKdVCQ7qDCNg6bPPr5JPFYSE4miX8T+WXXeCNeHRQDvW7/PLAP5Xt6RA22aNuqFLQvWKRSJZVJJgpeUGv05jgDhaZGi3b4RLyLsviMD1xEw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8680d15b-2611-4bfe-4018-08db5e103196
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 17:39:45.8515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yloj8zeNe5ZGjHg3FLUcveUJyC3+7DeT0QCdwRuwPj290OB6W67OqIJgcMD96WJMvdy+C/fGCoyx2mSEDEkvWO8PNJiCOFrUthkrIRViXZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5372

On 26/05/2023 4:00 pm, Alejandro Vallejo wrote:
> Expose AutoIBRS to HVM guests, because they can just use it. Make sure
> writes to EFER:AIBRSE are gated on the feature being exposed. Also hide
> EFER:AIBRSE from PV guests as they have no say in the matter.
>
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

It's worth saying "EFER is fully switched by VMRUN, so there's nothing
further for Xen to do in order for HVM guests to use AutoIBRS".

We can in principle support AutoIBRS on PV guests, but it's fine not to
for now.

This patch probably wants reordering to #2, because it is entirely
independent of what Xen is doing with AutoIBRS for spec safety.

It will need a minor rebase over the bit name shortening, but otherwise
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

