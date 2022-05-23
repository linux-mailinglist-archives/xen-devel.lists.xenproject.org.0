Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630753115C
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 16:38:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335905.560108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9C1-00029h-35; Mon, 23 May 2022 14:37:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335905.560108; Mon, 23 May 2022 14:37:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt9C0-00027H-Vn; Mon, 23 May 2022 14:37:56 +0000
Received: by outflank-mailman (input) for mailman id 335905;
 Mon, 23 May 2022 14:37:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/tb=V7=citrix.com=prvs=135606018=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nt9By-000278-VZ
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 14:37:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb822438-daa5-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 16:37:51 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2022 10:37:48 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3110.namprd03.prod.outlook.com (2603:10b6:910:54::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 14:37:36 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.023; Mon, 23 May 2022
 14:37:36 +0000
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
X-Inumbo-ID: eb822438-daa5-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653316671;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ykIWMxp9S/25JW1KhJzZmsAmJp57CxXQWyf1K7UkVvE=;
  b=MZ4ovHK0W0gdoZoxIJc+7LEOFoj8BolCVqxnJhkjm8ywJy6W/2pVRQtR
   RFExFskVmTeskYnJUNilerRNaOUIew21wVm06WFe42R6/u8K0dOWzJ0i5
   GdoIGaR1pr66FPaA4zrXmhzYZd8MQ7S6+UB4ewCqBQGzFEU2TSyF2/bV0
   I=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 71960180
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:K7wCVKnBEZJKiHiP2efxMMHo5gz0J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcUD+HPvnbNGD3fdFxPYqy8UhSv5HVn4BhHAZk/yg2FyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkWVjV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYERYmHP2VisIhTyJfCixvJr0Y05D7CC3q2SCT5xWun3rE5dxLVRtzGLJCv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOUu5kEhF/chegXdRraT
 9AeZjd1KgzJfjVEO0sNCYJ4l+Ct7pX6W2IB+QzN/Ppvi4TV5AxDgLznMZnVQd2PW/4WpUSx/
 CXauGusV3n2M/Tak1Jp6EmEhOXCgCf6U4I6D6Cj+7hhh1j77nMXIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YS7QiMzu/R/FyfD21dFDpZMoR67IkxWCAg0
 UKPk5XxHztzvbaJSHWbsLCJsTe1PitTJmgHDcMZcTY4DxDYiNlbpnryohxLTMZZUvWd9enM/
 g23
IronPort-HdrOrdr: A9a23:t3g80K2k6kr/wmj5T7cNSgqjBEgkLtp133Aq2lEZdPU0SKGlfg
 6V/MjztCWE7Ar5PUtLpTnuAsa9qB/nm6KdgrNhWItKPjOW21dARbsKheffKlXbcBEWndQtt5
 uIHZIeNDXxZ2IK8PoT4mODYqodKA/sytHWuQ/cpU0dMz2Dc8tbnmBE4p7wKDwMeOFBb6BJcq
 a01458iBeLX28YVci/DmltZZm4mzWa/KiWGCLvHnQcmXGzsQ8=
X-IronPort-AV: E=Sophos;i="5.91,246,1647316800"; 
   d="scan'208";a="71960180"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWuThzWFEo55aF/dx5FzZ4jPUjxy+WOy8hnRSyUP4pEvrYTJjIYmxumb2gxLIPOouN2mcH3+LhuMvpI/mAkjEIx1eJHiqm+X7CRWf2CqE5AmZ36D/WWgxrcc5icfkpQ9kpGpMdp2a4U+hPdLwFgovG9gEOEs/7cXELXzIyUleaOIyPQ1abbbM6+n8LOE5ZbGd6Ot7PCobf45HvZfRm5A1LIWdFm+ajLN3WDaNIK0+SYA/T0OGD/R4hqYmqQ5ZJjVcb6jEcnK5lBhzQ7Y2eObvDRWgZwI4Rg9bdvlXMte+rtCxaP0Nbxx3Mv5hlBqaKfMXAcLA4VD3P9ce5wLpwshtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2ACdcgDh55CBtYDnC2JEEp/kSVONdmEgJM7SZUQMlo=;
 b=K6gw/5zVRHR87B32M8p94aEmjn5bQz6se99cGN+foUFIIpBafndOgUs0DNH2aXLQNUVefUxlqDDIMatRhL1Nj90itHHoSbw/3FP2qZDw9XW9nS2IPECJXLMOoW7g1CBffE8lI4scDLyZX9mfKrIEOWLv4VixAn086z86ODERE70vMVf4aMKRB1AYOc9UQtl9E6Psmne9u6vKbEAjZ3g6wvDgsTMCv0w5pFtEmzHBYyI9S76tNrh7FGuutzi3kzUsf92alGqgh6y9trbBewPAhtfQgIFmUYWJu7uuhTNVyAls1iB2gbqMuFZekX6HyDQrtVuCqKXmYZZfBljKPflUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2ACdcgDh55CBtYDnC2JEEp/kSVONdmEgJM7SZUQMlo=;
 b=YJBdDaG1kXRzQn0gsRoEDyKEk+d7RIRaQaSqTMk34uQxIaF24fptSVA9KNI/Q4Q1VagkYxCx3CfjBTBXzh6P33Ps36REy0MudWvjcWhDtnxW7wbDhbJkboFnDJKoU/ST8QaUJGkZjxpF39hUevyKcAWw8MMTQgwNaWbdpn0579k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 23 May 2022 16:37:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/flushtlb: remove flush_area check on system state
Message-ID: <YoucK13m0y3CqDl1@Air-de-Roger>
References: <20220516143116.28602-1-roger.pau@citrix.com>
 <c7878c92-41e7-4628-34b1-1cb409335bf1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7878c92-41e7-4628-34b1-1cb409335bf1@suse.com>
X-ClientProxiedBy: LO4P123CA0161.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73fe121f-5d47-4bc0-b85c-08da3cc9c762
X-MS-TrafficTypeDiagnostic: CY4PR03MB3110:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB3110678BA47DF839CF73D3308FD49@CY4PR03MB3110.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	idLofqqP98PkPjvascG22wTx8uVF7aVhtCga8iBtlf6naAt5zGrEbyOZyoUsgua0Qsfk9H2gwyuTbNa0RaSG4zEvR2UNc9vtj65nB0M9f8wK/StnKg+zG5NYyl48l8yf7CEJTb1qmUjla2IkByDc+MsILbCAviaAcGhaA42Rmj4pDM0ttbuaY4um7ZNawbtSLRAZ348D8WEuVSxFI9qbt5CgNXVM+ICJt5yHpUXpYOvlnEWik3m/Jvij/6lpSoKf/tmZWFMe/BVAMS4Z6ITL6zgTu4CoMFkUY8GJLHK60NE6w3eEMc8A/h5daG3ePz+JKlJorywgTwedn+7tNPG8xd/yobUrgJkAWQWRBrFCT5YDIAqSJpxqbz9SrTTbpvOs8sk0EZsa9uT6WMwFGxJ74JV2iZH5u3INcsic4YnJU9UvjZdRn+qDh0gdlwFRoJiR6eC89pbCO5t/4rzdpAj0Ujk1t7sUeYVP0gyVn4FTgM5v52eYlaO17IGaQw3YQvLUdo7/vjUgtrne1NeUNDCqXj2yKOSjoXdU/9RHuX/R5vdsBw9QvSimbtwBrImNsOeceqHjjQtSbuPEOUZOe1iv1ktZM7xUfvrm1MBj83fR0leLoN5FlewcB6XEhIEoS76Ak1xO192c+oOlT9m/Qnl6Cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66476007)(8676002)(66946007)(86362001)(316002)(4326008)(66556008)(38100700002)(6916009)(6486002)(508600001)(54906003)(186003)(6666004)(8936002)(5660300002)(82960400001)(85182001)(6512007)(26005)(2906002)(53546011)(6506007)(33716001)(9686003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bE1aczJtYkpYaDdPeXNzNVkwM3FVYnArY2tIWTdtSHc0N3lSbG1BTU5aYVRs?=
 =?utf-8?B?OXhrQkpuYjZ1MVNuL0p5eVhkc01ucjI5OUJMV3BDbURleUhhallod0dlM1c5?=
 =?utf-8?B?NU9hMjU0VFN2NWROUEhHM2wraDVzLysrQjBIMHk4bDMzZndORGpaS3hrdkN4?=
 =?utf-8?B?aTY5WU9WMWNsbUZQcTFoMXo0TkF1RGhXNjRQbjh5dDY3WEhjeEF2U056ajRt?=
 =?utf-8?B?dU5WVGdCN0VRSERjZXh3U2Y0TFhRZ3FkMDljWHhlUFQ1VFd6bmhLOTA2QlUy?=
 =?utf-8?B?VE8wMU5DTGMrbEIwUFFnNG9XMExzd0FCRUNPSzNBRThmazVZVUNLLzRPY1pB?=
 =?utf-8?B?S09iSm1JcWNRUEtFby8xNUMyaVlyZVpadlZMNVVCSkN0RXJMc2NlNEQxK1A2?=
 =?utf-8?B?UW10OFFRN3RHcFFzWVlkeTdQcTRXbXRkWDRSTis3TVNaMTI2cWVDTjkvMFFz?=
 =?utf-8?B?RXhkSHM4Q3JmbnA3aCs3VFlBYnFtUkFMdWdhRlJvWk5kM1doZFBRcWJ1WEV0?=
 =?utf-8?B?Zks2eU9vbkRFS3JzVGNKZDZ6UG11Y242b2hwS0o1Y3ZIbWtwbEZYdEV0ajh4?=
 =?utf-8?B?eTVmTzRYOGFFQ0tITHVOa1RxYkN5WDlFME5jUWxyaFAxMHZNcU9sM3BOV0Zq?=
 =?utf-8?B?c2w1TFpDQjFhMExteldYK3dWb2tPMkRJK1Z3cEhpWTQ3Q2hpRERxcjc4TVkx?=
 =?utf-8?B?WWtoSms3azdIVXBqdHVpeGpkRjMxTjJNcUNSdlJJWW5WYzlpWkFVbkNvbVVq?=
 =?utf-8?B?dlpNMWtWSVJlZ3JsRStpWnphU2lpU2s0YzlnOUFqNGEyaEdXbEtnK3R2TzAv?=
 =?utf-8?B?eWY1N3Bsa3h4WlE1Qlo5dWcyNDAzWS82YTZPc0FIYTNVaFZKaXIzVFhoYzNi?=
 =?utf-8?B?MU1zRFhmWDZEWDExeTZVY3lidzlSTUtQV245ZktZa0JGeGtuUWFkT1QxUFlC?=
 =?utf-8?B?R1NuNXRZS1NxTTVjTytDck9YN0ZERDlOV3pGK0Z0MzZvdFR4MGc1dTBaVCtF?=
 =?utf-8?B?V1d0d05YQUR0SThoZWdtMnVmWEVxSTIzZ0Y0MHEzUWk0cXV5ZUtLRlNmNldk?=
 =?utf-8?B?ek4wbjJJL0c0QWFURnlyT0NxdUJyN1prdW1NMG5McEFyQU4rRVJXem1OdnQy?=
 =?utf-8?B?Y1YwbnFIWDBvbVJLS2hBcHY5YlJTZlplMEEzb1NmWTdJemY0Z0RLdlJSaEFm?=
 =?utf-8?B?dG9pblpCRXZBNjZ3QVhXNFZUVTM1elAreEF0N0E0cklreitTQWhla0pBY0xZ?=
 =?utf-8?B?YVdNZ3hFM21OQURwRUdQS09RQlR2bzhzTG41Z2tjcXZpOXdaajZuZkptZkR3?=
 =?utf-8?B?bkM0QXV4TmZ3UmNaYk43K3RvMExDUGhyZ1ZnNkZZN0JnVkxZRFNIZ1JCWXpY?=
 =?utf-8?B?dGdIOGhoUUkrY1I1akJkRTNWYjRUbXd0K1BIQ2swZjZOa1dLTXh3NCthUWVw?=
 =?utf-8?B?QzBXRzBYT1E3V2tDZ205dStlUVpZbUEzT1E2T25NNVBSazlUcHIrRlU1eldx?=
 =?utf-8?B?aUZYU2dHZ2sxLzJJVVpBOTRQcHRZbHZQT21mUXREcmJTSXVBczJOL3c3YkNu?=
 =?utf-8?B?SlVlVGdNbUFZWHFIMXlTVU5YVW1PYTg0Y2xxWUcrdXBoSFIzMWtZVURDbVB3?=
 =?utf-8?B?dExHYW5YbW96ajdUdG51NmZITEQxSXpkWUpTVC9zMzBQRFVqZkJIc3d4dlU2?=
 =?utf-8?B?OFhzelFpZnNqMExFaG5DdXAxZGVNRnFjTmxyK01kY0pPdEErdVpmKy9OV0ZO?=
 =?utf-8?B?a2o3MzNXRkI1TDk5Q1dHQTExaEtoODVybCt0aGtlem1pWmpIdThGRmYxVExU?=
 =?utf-8?B?R1R6b3MrdVcrdkFBdEdMYUlLa09zYnpmcGZNTUptOXF3STRiTzR6b0Q5eEZz?=
 =?utf-8?B?TlFFL1lVNGtvYVJWbmtEYmtKRmJNMklya203b1hiN3cxaDlmamtOQ2w4L1NQ?=
 =?utf-8?B?alZlM29MdmhDQ1VWemNPdmxJaDJtc2NDYm1QcllhWkdDMVVQeDBWYkxDangr?=
 =?utf-8?B?em93cFVGaUwyalc4UVczSFl4d1QxUTY4OWZ1V2IyQm9ZTnFYdDdya3lKR3F1?=
 =?utf-8?B?NnM5VHZMb3YrME1EZHlqMWt2b3lnM29IM3JGSGFmelNjdU9EaGtJcDRXSkE4?=
 =?utf-8?B?dU9FcnpGMVVJSzZZTHlPcGJNMXlNU2lrWVNRNUxYMXorR1c5ekVWWENHc0Nw?=
 =?utf-8?B?RXIxY0ptMGpTZmVNT2NZallmVllaUjJXdXBnc0MrU01PZ2lncm5hbUhWdXp3?=
 =?utf-8?B?TjRjTFNQMUhDV1p1OVJhOFo0a3FvQXFWS3hSKzU0RXJ2V25jZWE2dTlIbGZ0?=
 =?utf-8?B?UzFBU25BcVc3dFJxdFh5MHFFbk5UcmpGMGU5V0FuZHZldEVud2NEQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fe121f-5d47-4bc0-b85c-08da3cc9c762
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 14:37:35.9918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aul2ait6i622QdG8/9AMphBYdZc+kjQOoVQFhtbwWUZiZrh1bb+tmOr47MtCaKfCqoWTxxZxVwdXhleAo3ZUOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3110

On Wed, May 18, 2022 at 10:49:22AM +0200, Jan Beulich wrote:
> On 16.05.2022 16:31, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/include/asm/flushtlb.h
> > +++ b/xen/arch/x86/include/asm/flushtlb.h
> > @@ -146,7 +146,8 @@ void flush_area_mask(const cpumask_t *, const void *va, unsigned int flags);
> >  #define flush_mask(mask, flags) flush_area_mask(mask, NULL, flags)
> >  
> >  /* Flush all CPUs' TLBs/caches */
> > -#define flush_area_all(va, flags) flush_area_mask(&cpu_online_map, va, flags)
> > +#define flush_area(va, flags) \
> > +    flush_area_mask(&cpu_online_map, (const void *)(va), flags)
> 
> I have to admit that I would prefer if we kept the "_all" name suffix,
> to continue to clearly express the scope of the flush. I'm also not
> really happy to see the cast being added globally now.

But there where no direct callers of flush_area_all(), so the name was
just relevant for it's use in flush_area().  With that now gone I
don't see a need for a flush_area_all(), as flush_area_mask() is more
appropriate.

> > --- a/xen/arch/x86/smp.c
> > +++ b/xen/arch/x86/smp.c
> > @@ -262,7 +262,8 @@ void flush_area_mask(const cpumask_t *mask, const void *va, unsigned int flags)
> >  {
> >      unsigned int cpu = smp_processor_id();
> >  
> > -    ASSERT(local_irq_is_enabled());
> > +    /* Local flushes can be performed with interrupts disabled. */
> > +    ASSERT(local_irq_is_enabled() || cpumask_equal(mask, cpumask_of(cpu)));
> 
> Further down we use cpumask_subset(mask, cpumask_of(cpu)),
> apparently to also cover the case where mask is empty. I think
> you want to do so here as well.

Hm, yes.  I guess that's cheaper than adding an extra:

if ( cpumask_empty() )
    return;

check at the start of the function.

> >      if ( (flags & ~(FLUSH_VCPU_STATE | FLUSH_ORDER_MASK)) &&
> >           cpumask_test_cpu(cpu, mask) )
> 
> I suppose we want a further precaution here: Despite the
> !cpumask_subset(mask, cpumask_of(cpu)) below I think we want to
> extend what c64bf2d2a625 ("x86: make CPU state flush requests
> explicit") and later changes (isolating uses of FLUSH_VCPU_STATE
> from other FLUSH_*) did and exclude the use of FLUSH_VCPU_STATE
> for the local CPU altogether.

If we really want to exclude the use of FLUSH_VCPU_STATE for the local
CPU, we might wish to add this as a separate ASSERT, so that such
checking doesn't depend on !local_irq_is_enabled():

ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(cpu));
ASSERT(!cpumask_subset(mask, cpumask_of(cpu)) || !(flags & FLUSH_VCPU_STATE));


> That's because if such somehow made
> it into the conditional below here, it would still involve an IPI.

Sorry, I'm confused by this: if the mask is empty there should be no
IPI involved at all?  And we shouldn't even get into the second
conditional on the function.

Thanks, Roger.

