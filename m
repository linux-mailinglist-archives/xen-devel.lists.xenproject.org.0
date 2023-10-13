Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AC97C80C4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 10:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616321.958226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDts-00044O-79; Fri, 13 Oct 2023 08:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616321.958226; Fri, 13 Oct 2023 08:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrDts-00041t-4F; Fri, 13 Oct 2023 08:52:04 +0000
Received: by outflank-mailman (input) for mailman id 616321;
 Fri, 13 Oct 2023 08:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7lwD=F3=citrix.com=prvs=64352611f=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qrDtr-00041n-8T
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 08:52:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4bf108a-69a5-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 10:52:00 +0200 (CEST)
Received: from mail-bn8nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Oct 2023 04:51:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH0PR03MB5970.namprd03.prod.outlook.com (2603:10b6:610:e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Fri, 13 Oct
 2023 08:51:55 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%7]) with mapi id 15.20.6863.043; Fri, 13 Oct 2023
 08:51:55 +0000
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
X-Inumbo-ID: c4bf108a-69a5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697187120;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Jtc0kBA2dM1p2NltlwNqdpfuxBZ6tAYQas1elQ4vSQc=;
  b=WAYpWgRP3cdZZqUvuAiRDoEZCDIEhH5p65pB564KmacEvChWYaXFLvAx
   ku2PGEST0Yd/tk92FeWAIH5vPm61B/4k+CEy4tCv/RjFsEtv11jRe9yeO
   BwMHXz1IItLai+Cv1K32O8yXLaN+GveiCFAh4vD4w11YGDJ38rdbEjqx0
   E=;
X-CSE-ConnectionGUID: EyyqB5OVSBiI9+4SYKj3yw==
X-CSE-MsgGUID: K58QH5UyRBijjw8eZ0EanA==
X-IronPort-RemoteIP: 104.47.55.168
X-IronPort-MID: 125466777
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:icN9zatXn0bib5Ld42cwPc6AsOfnVGRfMUV32f8akzHdYApBsoF/q
 tZmKWCHO/uIYGLyKY12bIXloBwHu8Dcmt8ySAs+qn8yEiwb+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq41v0gnRkPaoQ5QeHzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBSEcdzreoNyN6rOaG6owvfUALpL6I9ZK0p1g5Wmx4fcOZ7nmGv+Pz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60boq9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAt9OSuPnqaECbFu75TFDMT1LaEqBi/i7iFHuVuAHB
 kUS0397xUQ13AnxJjXnZDWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnO87QyY7k
 GCAmdzBDCZq9raSTBq19L2ZsDezMig9NnIZaGkPSg5ty8bniJE+iFTIVNkLLUKuptj8GDW1y
 TbaqiE73u8XlZRSifX9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcjlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:xyBck6wXU1r/ZGaLNUcEKrPxVeskLtp133Aq2lEZdPWaSL3+qy
 nIpoVl6faQslkssR4b6Km90Ze7MDzhHPJOkOws1PKZLXPbUIXBFvAo0WPNqweQVhEW3NQtnJ
 uJSsBFeZfN5bITt7e33ODAKadp/DDlytHVuQ6h9QYUcegwUdAX0+4RMG/yeScaKHglOXcgLu
 vj2iMEnUvcRZ05VLX0OpBvZZmkmzSkruODXfbGbyRXnDVmTgnI1Fc5KXalN9slMw+nuY1Sil
 QsHGTCl9KeWjiAu3zh/l6W1Y1fnO3owMZCAsvksLlhFhzczjywbIBWULWY1QpF092H2RIRid
 HJlQwtJsJp9hrqDxOIiCqo4RDp1AA14Xn4xTaj8AveiP28fiszD/xaj4RDfi3Y7FdIhqAM7J
 52
X-Talos-CUID: 9a23:vRNI3G6oFOWHWekpcdss2V8FA+p4VUPm5nbxcgzkMldKSuaEVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AYAlRFw0agE6kls+/tNoFurKSnjUjwPn+MWBQrIQ?=
 =?us-ascii?q?8kciGNzMgNgXFoT2xa9py?=
X-IronPort-AV: E=Sophos;i="6.03,221,1694750400"; 
   d="scan'208";a="125466777"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqIrEkqi9ui2q7VBRSzurL6IkUIFiO2boc8jR7AyvjuI4ZNvukGy4D2JmgkUQiMiobPbyDjeXLu6RjaOJI4vFMgTWMHMkJMCj1OIKlexKue/wgJGZqS3zn4U/Z+rlV6HREZTBa6xAEajSvzdouWvdzVreHXAvesMJMf782ZqLqmHDz75h/M00WagqULFq0/MTnt4QwuWAHhQARQ+ADbosHfe0M/Brb4go80bsBXYmlVUnNUTrQ+sek6kPrWYm1auhc+GsvmXCFMcKzFl3anAL1J5e3uOdPUuCSDg+dxLeQe69rTjUFR/f41JxLDYJssdHcsHczsXvt9CyDnFkQwAjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f78559kXZUfqQlZuqKdgqCSShwUT/jXJHI3JRvyX+5k=;
 b=GvZo+n1xnh5HU2ZYQZ2C+GnQimnQf5oyhdeZ3WViViNQisCgLORfeueLfoy+eBmIaJ6MenV5KcemhRYbGNbygJLrx8BKgqxCm0m1b8Gh3A/fFokuTG1a3HZ8gA3PScACSups2M5qiqahxqYR1EmvSpN5+cRMOhZrNWfou+diglKMld72jvAebVD4aZH8MYnpJzMUJIUqFRCXP1nxBhhTcaoa9dpRhiUh7BE+sIdmAbPIWD9zbV+d9FWKNymxkX0//xSb2zDNb9EUqPvB2Mtt17UIlNPGR9EUZExfp3wUOSH3KTk5W1/XxM6rK4l93Gp80qwYKYkLPyQoU4PE1RVyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f78559kXZUfqQlZuqKdgqCSShwUT/jXJHI3JRvyX+5k=;
 b=qCiRxTI7D13XfoClh4rRgYn/uiBBEJ/2AZT67bT5bTQ0FGfTuSJEMF1O1McETKxefh7jwtxtZIvWGB9daRuU7wyZZHjd//fUTeHxH1bhMLmVyATnG2JztFOuzapJTVOFil05rhcHNrMg0L3GPea85FU5jgdByyYt9ROteBjxg7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 Oct 2023 10:51:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/pvh: fix identity mapping of low 1MB
Message-ID: <ZSkFJoF0kSv555Yi@macbook>
References: <20231011153756.16714-1-roger.pau@citrix.com>
 <75e8aca0-1e2f-4c19-9fee-20bb4e4ae00f@citrix.com>
 <ZSkCKkJjcCiJsIGp@macbook>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZSkCKkJjcCiJsIGp@macbook>
X-ClientProxiedBy: LO4P123CA0535.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH0PR03MB5970:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cfd3f3-81f3-40dc-070f-08dbcbc9a6ee
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dpmi5aa8BRA3J61VE3mP1hha+tani37kUAGwVf3F9G/Aw5EmdrOPKyTOxGkhZrIB5tMJBci6eDNCoQ3ftwgOvJuHLcKBAteXTuVRYjbb5hLlqaK/px8xelNsh0v7UP3+A9To5ue7RXWC84tjN2WYVpF3Fv1n1INtkQOPqGXU0Vvhu9ciqAofvcXLCeDC+sYM/bx2swdFBwglEOzfdZ0nEpyy1t1R6+ouePJakmGDzuaLBqflsEpPPz3dh+t5x5ZA8NfsI7lpqlhbDp/5e5VoQMoC0N1R2bp0MDWRHRN6npF1DmyfBhs93QmPXjw4P8KjWjXHVqeMFkAcDWhYFSpbLuDLSdCahtzDNfzrxPmO/cmnNdgInV7pXoAJFfXeXvzKpWWa9EjKqzHzbxUl67Aitvg8+GMD/L7LJ63zBMOFgG2FvQvv+JJs7h351YFpRKAuiuqfLHCSViG4oxn0HqoX7ABSASaJi0t8elI9zewGN9dLosZuxyGIMSiJYQEEfNKW4Ikop3zywMNdfDXys/Q3yx5870K7S5bWV98NNpjhJj22+rATjZ0OTb+AGItH5VOq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(396003)(366004)(376002)(39860400002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(6506007)(53546011)(83380400001)(26005)(82960400001)(38100700002)(6512007)(9686003)(4744005)(86362001)(4326008)(33716001)(2906002)(6486002)(5660300002)(8936002)(8676002)(66476007)(6666004)(85182001)(316002)(66946007)(6636002)(54906003)(66556008)(41300700001)(6862004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzB6YzhCUnE3YitUaGc1d2pJZjZyZXBRdVMyYnRPNDA5aDdLTWxPU0hjS0ht?=
 =?utf-8?B?UnVKWHdubzh0SHhtV2NQTWx6RGxhT2c0N3dET2FuZ29MUHZRbjQ2THp4UWEy?=
 =?utf-8?B?L0tnb2J2VkZIVDRScmE5UGhHajFTZ2szczVnSWpBcTdsZ1ZZbVhObmRRRU9r?=
 =?utf-8?B?SisxWStKTEF5akY3TVVQUitDdjNNbHBYbVZNYzRTUWVsR3M3dEZRcUdpalhR?=
 =?utf-8?B?NXpQeWpzWnpPY2g2VGV4ZHM5R1VOZVlpQWdXM1RwK0Q3c3VyRTlCdktXVzdp?=
 =?utf-8?B?MG9kYzN6UGFLdzNPVnRIQ05uRGZ4RVVqbzhQNjRQMmN0QjFBOHU5alBoSkVB?=
 =?utf-8?B?QUR3eEFSUGNjcldlUmR2bjBodTRPVWt0UHFjU0lHcGJQbWYva1RENyt3M01Q?=
 =?utf-8?B?RVMzV3dlNktpeXZFZmpVU0p2VGVFY1Y4MUx2dkRMTjAxNWdVL1FOZzIrckJ3?=
 =?utf-8?B?OXh5MXF3U1hjc2V3by91SWRiYUtKbDUvUXozZGxDNUZjMmcxaHB3N0ExODhB?=
 =?utf-8?B?ZVlpUkQ0THJ1NTFtTk9JVnRtZmRBS2tUeGFFelpmRmNUUUhYNHlTVUFqNDBU?=
 =?utf-8?B?K0pkTXNOellvOTNxQS9KWmNiZ2JEUE1udUROaHlQK0hjbjd1ZHA0d0gxNWNi?=
 =?utf-8?B?bXZMRmVVdlBmMjV0MkZpaWpRUksrR0RxbTY2aDdqUFFkUnh5SDlxWCt4RmhH?=
 =?utf-8?B?eHJIWU8vMG15UzRsTTh1WFZmREM3NkJSWkRxVDUyVExtNmtBb01xRWtRdE9R?=
 =?utf-8?B?My8rM210dFZydHAybnFVSm5JeWV6cEZ5YTFtUjdmZmU5aVlCbXByYVZkOVRu?=
 =?utf-8?B?bE1lODRsQXBHNlpCL0dyeFlBcmZoRWdlWm9BMURqTEVsRmtpdzg4ZXI1WThj?=
 =?utf-8?B?eDI2eDcxY21pb2dObk1rdlAyOXdmL2pJd1RlVUxKRCtJT0Z2cFcvMDhaL1Zt?=
 =?utf-8?B?REJ5WWZyOXkwTHk2dktNeTV5dGE4RzQ5L05NZ0VDV2Y1U3FyTEFGdXJJVXJj?=
 =?utf-8?B?MTg2R0dKQi83TTdkSFdsMkJZbjZkYXVoNjdQLzBJWjVRZDU1M0VwNTVOVHc1?=
 =?utf-8?B?aVBWbGYwdERkT2ZyN003SUpQbExMeWswSURDd0liN0l3ejRBbVN3VS9QQjRx?=
 =?utf-8?B?RHpHUHZtRGpUMzVCUDVqeGF4OGpVbHlBaTRtdVRTSTRiQldPV0E4dXRlb2xY?=
 =?utf-8?B?azFlbmdkOFY2Qkx4U1pWYnFKTUs2TnBHUm02TGJlbklUajBsaXNkVzVLeElN?=
 =?utf-8?B?dm16aVdiV2NZQkJMWmh2ZkRWemViTHZVSmFreTVidFpWZkZyTTgrcEltb1B5?=
 =?utf-8?B?cTJrQXJsZnUrM3pwTkg3VXNWODlidmw1NXJUeFdscWwyYTVyaVc5b0xRSmkw?=
 =?utf-8?B?OUh3UGllWUxFSGwrNGtFQ2Y0dHhCZDRrcjJmcmtlUUY3WG5VaTh6RmtlSDhX?=
 =?utf-8?B?OVVoNVhlcTI1dVdTMmNhNURRVUE2ampucnpRVmxHODlnYTIycE1ic3BQOXlP?=
 =?utf-8?B?dFRlNm5udmlBbTh4TE9ZWUJzSlM4S3pxS2ZCeHUzYjBSTlVMd3c2a1kyUVJh?=
 =?utf-8?B?emRLZjh4cm9SU0daVTVCSk05cDYyL3dFZ1FuL2UvVzBWanF6VHhFelpXT1FP?=
 =?utf-8?B?bHNETGlIZ1hSQW9ZYkloclBIMU5IWTdiN1NaYjNqQXl6TUE2Qk5lMDJsbnNZ?=
 =?utf-8?B?QXJ3Rnc0TFZWVldzV25GMDR0U1pGbGIyZi95YlJjalMrT01jcGJpYU52a3RJ?=
 =?utf-8?B?WjVHNEhiZCtyWTB6aU42c0o1NW5OQmgrTEZCYWtSVTlJL3d1VWtwUkhySDUw?=
 =?utf-8?B?MGpZQXNkMTFjK1lGYUg0b1NtWksvWWRNanpEekpacXJhRXVZajVCdHk2NTAv?=
 =?utf-8?B?aW5QVGpEdURib2F3WkExaHFpeklPYUZkdHlMTVJFTUZ5eTBMR2JteG1mQTJy?=
 =?utf-8?B?bWEvTlNQSGo5a2REYk9TR2wxZXh6dW5sOU1PT3V1dkdkR3hhd21SdXVNcmlC?=
 =?utf-8?B?QUNBajZsRHlwYmsvWCt5Q3BrbVlMWWY3RTZLaE12MkdJUTNUNzRuUHhzQzAy?=
 =?utf-8?B?QUpwR0lVUWorU0tKYjgwRG56eDFKcVFjZ2ladEloZ2Y5U09mTTlZMmpYL1E5?=
 =?utf-8?Q?MPJZcOax3MGorEsRRR7YnzwV3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	HvIGUzfcDra3aq891j07exafWJJVQjbLODoG6byXrfAWEd7BBkQ0nPC4OiO7XVuRpm1mEeTuCFSG73DdMYMXKOV0X8SVYjfIQchN+52AGPVNxrYj2WCqBoOi2lax5mKsQ13IV3eNDLNaDmhJDYbBsyM6IMSu7FHlUS7xQPyS316IrZrWpttKqHm0TQ1b95C3wo1gOw7fnmeC9BenCxwyo/47DEVsUGab5wIvQswQ6YjmfKTAJKizbZhryfz2cOakQyYFKBpbqjMqQbaML+q2DC/QoMKRoKmbp3Z2hveUkab5LCWY5s8ijvJZSVXnGGOdO9V8sobzsw1eLLJ+05LR9oGDiVKjgjY0YpKPl20hpsLjJ0mDYk7B0vFH8u3pYNexoGQIqrFUHqH4ucUo9l+6Huz21XGiM+Upn8Tp40Hm6i1Qr1mBFfTq2zMx7MGchkvZVBAxXtICsK8AZE4phhba0BAy+UN26v2cA4n2y86TO5UO6HNDiQf0tIV4Kf/GxTUc4SltWfaP/bNDZ8C2u9S+comzqg1YyITjiSQZp7tQiwH0uTLxoYxrXs8JymL58+VLkDJRwUY/VVlvDnAaaCItbaFubydWzmRfmsoscPPkB4635ZFieKpVsNEJxlWrsZ4s8YP9+a3PB/2eKTVM5yL1EfXSWimySs5vfwX0me+CsgsUn/DpNjZhfFR6a8n0nblzqeHj5eEYr2RhiO0gSygvqogV9l+CKZV6Mb/QyrW4rFwmvanjWXfZAUuXC+QiOPL52/IZXD7FR3WApAj5/zpLBUV39HWFXZo5CnxY9iww08k4IMX/OsxFnuUUgpiz4foBrGgK/nqY8o48GS4kHwxU1lvxAKx8b3eIug7ND5EnmKk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cfd3f3-81f3-40dc-070f-08dbcbc9a6ee
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2023 08:51:55.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mkZhe31iJgWtxoDewHTot+52Ay48+JglGWdXWjg51KdrgjpOVv/EYxhP4rYtr26bm5uzEGfBHpXQG1BclSxsAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB5970

On Fri, Oct 13, 2023 at 10:39:06AM +0200, Roger Pau Monné wrote:
> On Thu, Oct 12, 2023 at 12:48:20AM +0800, Andrew Cooper wrote:
> > On 11/10/2023 11:37 pm, Roger Pau Monne wrote:
> > But a question first.  Is this from debugging the XSA-442 fallout?  If
> > so, it's probably worth mentioning the hardware we saw this on (which
> > IIRC was fairly old AMD), and that XSA-442 unmasked a pre-existing bug. 
> > And we think it's USB/PS2 emulation?
> 
> Yeah, can add this all.  It is triggered by pinot{0,1} which is AMD
> Fam15h (AMD Opteron(tm) Processor 3350 HE).

Just re-checked this in order to be sure, and no, the IOMMU faults are
already there prior to XSA-442 for the dom0pvh tests, but they don't
cause issues to osstest, and hence we didn't realize.  I just came
across those as I was triaging a different issue and looking at the
serial log.

Hence I won't add any mentions to XSA-442 in the commit message.

Thanks, Roger.

