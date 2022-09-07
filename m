Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2D15B01E6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401145.642861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsG8-00037g-Oy; Wed, 07 Sep 2022 10:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401145.642861; Wed, 07 Sep 2022 10:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsG8-00035s-MB; Wed, 07 Sep 2022 10:26:16 +0000
Received: by outflank-mailman (input) for mailman id 401145;
 Wed, 07 Sep 2022 10:26:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ME67=ZK=citrix.com=prvs=2424a236d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oVsG7-00035k-BB
 for xen-devel@lists.xen.org; Wed, 07 Sep 2022 10:26:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7df87fc7-2e97-11ed-af93-0125da4c0113;
 Wed, 07 Sep 2022 12:26:13 +0200 (CEST)
Received: from mail-mw2nam04lp2174.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 06:26:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5143.namprd03.prod.outlook.com (2603:10b6:a03:1f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Wed, 7 Sep
 2022 10:26:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 10:26:04 +0000
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
X-Inumbo-ID: 7df87fc7-2e97-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662546373;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=TiL0jYb8DTdxoqpJP6MT/ctPplOKePX4WB7k4yoTRMM=;
  b=XGGmYfBW3mQekVX/+n/wD/HCscwYwvANOfe6DwuBPdxSpFaW4FvRcE7o
   fS5oQaGn2suogW7WwEUF5tFWCiuAA47uqSYs2xnDGvsm5+ZxG6Av7PcF8
   lDN969pc5d77tHAMDbeurw+3lO2mF431KEfBfLwrbmVNpQ+bn46ZGkgMb
   g=;
X-IronPort-RemoteIP: 104.47.73.174
X-IronPort-MID: 79638744
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lrWIkqmf9zfV9s5sJfZssVfo5gykJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdXG3Tb/eIZGCjeN0nPYnk/U1QvZ6BztdnQFA6qH82FSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8mk/ngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8vWo4ow/jb8kk37ayt4GlwUmEWPpingnePzxH5M7pHTU2BByOQapVZGOe8W
 9HCwNmRlo8O105wYj8Nuu+TnnwiGtY+DyDX4pZlc/HKbix5jj4zys4G2M80Mi+7vdkrc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzdFSfqV/wmWfG0YAzcmCA2kxBoETpftxI1sUq
 /4mLmAHT0+61rOplefTpulE3qzPLeHNFaZH5jRF8mucCvwrB5feX6/N+NlUmi8qgdxDFurfY
 MxfbidzaBPHYFtEPVJ/5JAWxb/0wCWgNWID7gvK+cLb4ECKpOB1+JHrPMDYZZqhQsJNk1zDj
 mnH4374ElcRM9n3JT+trSPy3b+QwX+TtIQ6TZ+6y9xyn2ev2n0vUkMOUXSdoveUoxvrMz5YA
 wlOksY0loAw+1asVcLVRACjrTiPuRt0c8RRCeAh6EeO16/d+S6dB24NVDkHb8Yp3OcmSDpv2
 lKXktfBAT10rKbTWX+bsLCOoluP1TM9KGYDYWoBUlED6ty7/IUr1EuQEpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPORENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:46edgq9LoFyNt2FO1PJuk+F0db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcUjpAtjLfZquz+8P3WB3B8buYOCGghriEGgG1+ffKlLbaknDH4JmtJ
 uINpIOceEYbmIKwfoSgjPIdOrIqePvmM/HuQ6d9QYKcegAUdAC0+4NMHf/LqQAfnglOXNWLv
 qhz/sCgwDlVWUcb8y9CHVAdfPEvcf3mJXvZgNDLwI76SGV5AnYpoLSIly95FMzQjlPybAt/S
 zuiAri/JiutPm911v1y3LT1ZJLg9Hso+EzRfBky/JlagkEuDzYJriJaIfy+QzdZ9vfrGrCpe
 O84CvI+f4DrE85MFvF5ycFkDOQqgrGo0WStGNwx0GT7vARDQhKdPaoz+hiA2fkwltls9dm3K
 1R2WWF85JREBPbhSz4o8PFThdwiyOP0AwfeMMo/ghiuLElGchshJ1a+FkQHIYLHSr85oxiGO
 5yDNvE7PITdV+BdXjWsmRm3dTpBx0Ib1+7a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/e
 zLPqlhibkLRM4LaqB2AvsHXKKMeyXwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvY5AMxItaou
 W1bLqZjx9BR6vDM7z+4HQQyGGyfIyUZ0Wc9uhOo55kp7b7WL3ndSWeVVFGqbrSn8ki
X-IronPort-AV: E=Sophos;i="5.93,296,1654574400"; 
   d="scan'208";a="79638744"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmHDOQl0DoiZRICMGRIYQvuAnbTJOVMF4WTOXr5QCg+PGk0MHpRbNL4v96oa5PGUJz8LUaZKQcguR0Ie8LmJayKvABv24Mik0yAzzLiD6QLnNSlJi22Uk8Lhz8jV6j7Zj6R3dkcpK5ruP/8psQ6BG+G7qJ9JBchU2hb8fOlAYrRfBCoLJaeX7/iTtdLAEPh5KIJSw2GzIzvFs6gTf0tLK5YgevrfTFgksdXgJx9NiV2S0+qYvSOqcnpxMdOsKNugkQZCwrYLmF6Za7DT4hniiVXv0A+JjGR7EWt3LFhLKeXcjDW4/V4Td5SMOz9grsL8b4k1CKx9iqFYhz58TnIQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiL0jYb8DTdxoqpJP6MT/ctPplOKePX4WB7k4yoTRMM=;
 b=NoVM+aDqQDHzJ3148OfcbK+DjOk+7fG4av1YHwCPhr++z3WhyzU5Ml9dKbqsjL47xhg6E7CxHR0zjLveSdCqRYDuhUYKG5rdum8MofjVFJFNH5ClO7MiGLSIO6MfI/CzVAmwWoJyrpIDGcDPFVnCyhkMG2wsdBti/deesnfxr5Bv18ll83TxxANG4fmTz7GVkUM/cEttOU9S/FLfpCS7h3aFpqNOlMbKWZS/ZymHqycaz0uPng95RPLsmyuOhMocouOvU5nTNbzJG2BiwkvpLeZMg7kENyr6QWNwv5o7uxvou5rMEK5WcpVQfWkP1OIVn/v/HTGNBAzPTP98Oz3PJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiL0jYb8DTdxoqpJP6MT/ctPplOKePX4WB7k4yoTRMM=;
 b=mxWKDkLDwhxCgaWNLuXq1jAU2VUbLjlilj4rmLETBVsYcQiiwlrdSnyB8nqYUrM+va61JGHmrh2lN0+ccpeg2KekMn5c/1p8u9xFsL01P72rnnjJd4r/37bRPxF0iwM0C0SKUyRHrgD1IesBOiMPGYt7U2tVy3d4wuB7d0613J0=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Juergen Gross <jgross@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Subject: Re: [PATCH] .gitignore: Add *.patch
Thread-Topic: [PATCH] .gitignore: Add *.patch
Thread-Index: AQHYwqFtDIEPHIBXikmzc+iQP+t5RK3Tvp8AgAAElQA=
Date: Wed, 7 Sep 2022 10:26:04 +0000
Message-ID: <760d73b1-8796-37f1-d687-5dd3215bc5e6@citrix.com>
References:
 <cd8683878852a55f1b28807a470e078d21a5e689.1662545140.git.viresh.kumar@linaro.org>
 <aaa317f6-f2d4-a2e4-aff6-f5053964102c@suse.com>
In-Reply-To: <aaa317f6-f2d4-a2e4-aff6-f5053964102c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39dc3acf-40b3-4125-6796-08da90bb5e8c
x-ms-traffictypediagnostic: BY5PR03MB5143:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xTR7w+FxUMuR2Ujv2IusbDEBRnfV+7pyAZv5wKWeI7v3XgTgam+WeNSvxoJDLNMgZ7YrmiWQrcMOLSN95MFovu96fUHZ7qqrpCBHTVOQxb2iiOhfZ+JxyJ/MwM1mSVBM+cmdxG2K1aY4l0EJO+UEnFD7JiBEWTZAVjqcWh3BqjelIgnJiGaqDfj97DRiG8VDHOXymGUzc9a2xyNrNrJ9oo4snvPp9IU+39ynODUYgf6bQjDSUTHYX4xKIo4ZP43feDyMOVDdDTivSmvdDqxT6eqULOng1N/zhvfv2VTo5lSXSxx5znIbLlevwvnTzHXpbf/wsonmOjrdEoNi3+98jyRePwomKwlE2f7iuY1xKaRbtZB6v5zWdslrdSRTNms4HdQMmY+2Ho2/EbBm8aiw6JImSZGsA0JiHtfPqOsneBv1qTTLShr4ftLNk838jbVKjhfyu+C+0Wzni4xAr55km9L81bOfWwwQMt8hndODGEd0pRsPsUC1cMnnJmkB75mHKXqB38G7qoyNZt6zShOa3oXmGOGgaj9bWzwKYhYHpa/uOyzEwhmFADa+nHR9+c/IsI+QL4TQH2Z0TjnNtXI1FnxxbQsWbj4O7SznzNtDYm7l8BvhQOa6Z1pzOWmaWOtZJhiauGzgQKg+89pLb+BYvhzhPVnFni9P173YRjVohYwi9M/+MBvOkr4ljdYunzFFfz076bTb9OIERzpVMnprZTyA+HO70yyKBP9x4ssBguMKxP+0vibElbIQPWKWYhnbT2WM9KJsd/h1cspAYuNoKkGvgSqemkciGN3zYCwY/DOwDTh05XmJ34IY2HGSkql6qb59ojVq1vNBGrX3r0YuuA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(8676002)(26005)(2906002)(31696002)(86362001)(6506007)(53546011)(71200400001)(66556008)(66446008)(66476007)(64756008)(91956017)(478600001)(66946007)(6486002)(122000001)(110136005)(36756003)(31686004)(316002)(76116006)(82960400001)(38100700002)(5660300002)(8936002)(41300700001)(4744005)(6512007)(186003)(38070700005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WkhLdDlZcW93UjUwNXcyNlJocGJDSnhRR1I0L2liUjRZdmlaMWp5UnBaSUtm?=
 =?utf-8?B?bkpTd2ZpblYyT29GdCs2S1ZpTVdVYTdtYmdmVnZGZmsvOW95VFNXZUhQcHhv?=
 =?utf-8?B?UDQ3NkwyZlg4Mk9YcDEwNXlFa1hQSnl1cUoxZUtxeWJ1QWdMNkxmWFZrUXNl?=
 =?utf-8?B?aWpzUDlnNVVtaThONTFaSXBHb1RoRXN2TDZvbllCVzFYeDJ3M1d6bVRRZUVx?=
 =?utf-8?B?YStReko5TDBPTTdYM3AxZG1JUDlsSXUwTEx1VVg5bVp4MHJXNjNPNE5wODBO?=
 =?utf-8?B?VEVUNHRVd2xhNDRyMDE5bDRwa0xQcTRVMWRNa3VsMlpJL0VJcUlKdVBrT1Yv?=
 =?utf-8?B?RXhaWjMxb21CNnpzVjFtRXRXT2RCbDg1NVB3dU5TRHhOaFE4TDZweGlzMnhs?=
 =?utf-8?B?WkhmbWRIR2V3Qm1wSEV3ZzBVclA3YUpCbUJQOXBkSVBaa2tJTmZESC9UZFFq?=
 =?utf-8?B?STFMcnM1MnFkOWNZVUJ5OEplclRIL2d0Z3VRNzNSWUhiTTVidmd6Qmd3emhl?=
 =?utf-8?B?eFNKdUR4QzZuNXhWcWRZWTlNdWI2RCs0UXd5RjQzeUI5UUxiNE42ekJTWDRD?=
 =?utf-8?B?ME01bmlJbE0weXVWVVZSSHR4bllPY1hMZXNsb3JZTlF4TnQ2RW9GRDljN0E3?=
 =?utf-8?B?L01wMHFmTHk4THdLQ1pDcm9FTmdVaWtPcWUvZmF2bnVaK0Y5b1ZIdFRjcmVH?=
 =?utf-8?B?WlF2TjFzeGtHQ3NJZ2tnTVZFOWJSWXdBYzJXQjZGSU9GVy9JVHpyVEhRWVpv?=
 =?utf-8?B?WnNGQXU0ZWl5cUZKRit5ODVWZEMwY0Z4bzFHYWhMb1c4emhQK3pPUjZsWWVI?=
 =?utf-8?B?M3RUQ2VWU1ZEZXFuTHJEMDRENW14enIza1ZYNTdiampKZ1dJQ1F2QXl3dGxr?=
 =?utf-8?B?TG5uN0M5dVdXSk5iUkFMRENyNWFERFRsc1ZEWkN5QUIzeXJvT2MxT2NvWFpl?=
 =?utf-8?B?YkVTMGFqUDF0N2NZUGlFblV1ckNoSlVUOGhoZTBZMzhOR0R5WHdraHF5VE5R?=
 =?utf-8?B?d2ZFa0NUT3N4cExrL0YrVFQySjNXK1dPNUJ5c2lkZDJhbTBiMTNuUTRkaU9K?=
 =?utf-8?B?blh3L2dManVLdE1yc2NQbTFOYWNlakoxTEl6ZHRvQSsvc0NXV3RsL3ZLWHZC?=
 =?utf-8?B?MmdzdnZsTFowMjBhTm9TM2pXZnlmblI4djdQekhNTlc0RzRQTGJIbGQveDZS?=
 =?utf-8?B?NFVnMmpVaThWUGFGWWRKWTJLU2RxTHRmS2kveGJDaXdpajhnWXYwbm1JV0hs?=
 =?utf-8?B?bEpLTWpIcjhzQUJqa1J6aVlYc1ZvcTZRMzl5Zm4rUmFIWWxScnFHd0JzVzJZ?=
 =?utf-8?B?K0ovaUFyWVZIZElKZzZ0dk5zSjErYTFPS2hjNk5zWFJMbWE4SnVsRnBaVjBD?=
 =?utf-8?B?NnpNRnRUeThJQ0hLcUtic0JCZk4rYTBoV1dpbkJ6VmZpaXFCbU1SZklBR01m?=
 =?utf-8?B?K3dQRXpyNXlDaHZ5T1RqNHd0S0lycFlBN3BSdFArejVTWGFZLzN1U1hsZDdq?=
 =?utf-8?B?ODlsRzdobnp3WW9YODVZaW1rbHlPNjJZNE51RlVoc2dIbWMyalVyVXY4OXdR?=
 =?utf-8?B?c3JEelQzVndMMDRkZFhyUkJoOGx3ZHVOWmtKT3QzNnR2b054RzU4Uit1SHZR?=
 =?utf-8?B?UzFybGhHVDZaMTJWemRnT0VDMlV2WlhvS0VSdDF2cFhLRFF2MFBjZXJsRG5N?=
 =?utf-8?B?cldJWERJb1hab0tsZmNYWkNzMlNlS3I2Z29hOXVXajlHTDdpWHpUOUhYdHND?=
 =?utf-8?B?UWR1WUt1aWkva0pubDdYaU81UStFZjFuM2ZhWHE0cnExSmYrK2NyeW9JZ2w4?=
 =?utf-8?B?RkpQY0hjN0g5UjlSdlR0b0RYOWxhQm1iSm5nRG1KcDhQSFZsQ3JFUGFETTkx?=
 =?utf-8?B?UHlkS21ZVjJhYmhTL2JmUG1sRGFkZFBCamppczIyU1c1dGNibnB4REc0dEpY?=
 =?utf-8?B?eEtjN0VVekJZMWlxZGhyaFBsV2tSMllqcFFFQmpKMFczRnhISm1PSlNXTGZs?=
 =?utf-8?B?QWNoS1U4ZEpXcE55SEFENWdDUU5INTFSWndDa0V4Q0h5TkFiTFFSU0hLektV?=
 =?utf-8?B?WVlOanBWQmhrWHQxMjM2SGZ3cy8rbEQxaXA2Q0J6L2hjNU90U2JnUzRrYjJP?=
 =?utf-8?Q?IOIS//W4+BuMx/pu3tHv1kAIa?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09AB45EA1D980646BAFEE726AC7F5117@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39dc3acf-40b3-4125-6796-08da90bb5e8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 10:26:04.5734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oet8mESaNonpUIAe9vZLFkX2aaIH0cpa1PpRvC1t2kBERhsIhMqsNVppxpsOTzkCsjoE6uMcCeZSgo+XVe+z7f3ArwzULqKkYtdjPqsesUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5143

T24gMDcvMDkvMjAyMiAxMTowOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gT24gMDcuMDkuMjIg
MTI6MDUsIFZpcmVzaCBLdW1hciB3cm90ZToNCj4+IEFkZCAqLnBhdGNoIGVudHJ5IHRvIC5naXRp
Z25vcmUgZmlsZSB0byBzdG9wIHNob3dpbmcgZ2l0IGdlbmVyYXRlZA0KPj4gcGF0Y2hlcyBpbiBj
b21tYW5kcyBsaWtlICdnaXQgc3RhdHVzJy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBWaXJlc2gg
S3VtYXIgPHZpcmVzaC5rdW1hckBsaW5hcm8ub3JnPg0KPj4gLS0tDQo+PiDCoCAuZ2l0aWdub3Jl
IHwgMSArDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvLmdpdGlnbm9yZSBiLy5naXRpZ25vcmUNCj4+IGluZGV4IDlmOWYxOGM5N2Q1Zi4u
ZDlhNGZkMDM4MTQ1IDEwMDY0NA0KPj4gLS0tIGEvLmdpdGlnbm9yZQ0KPj4gKysrIGIvLmdpdGln
bm9yZQ0KPj4gQEAgLTIwLDYgKzIwLDcgQEANCj4+IMKgICouZ2Nubw0KPj4gwqAgKi5nY2RhDQo+
PiDCoCAqLnB5W29jZF0NCj4+ICsqLnBhdGNoDQo+PiDCoCBUQUdTDQo+PiDCoCBHVEFHUw0KPj4g
wqAgR1JUQUdTDQo+DQo+IE5BSy4NCj4NCj4gV2UgaGF2ZSBzb21lIGZpbGVzIG5hbWVkICoucGF0
Y2ggaW4gb3VyIHRyZWUgKGUuZy4NCj4gc3R1YmRvbS9wb2xhcnNzbC5wYXRjaCkuDQoNCkFncmVl
ZCwgYW5kIHNvbWUgZnV0dXJlIHVzZWNhc2VzIHdhbnRpbmcgdG8gYWRkIG5ldyBwYXRjaGVzDQoo
bGl2ZXBhdGNoLWJ1aWxkLXRvb2xzIGFuZCBsaXZlcGF0Y2hpbmcgdGVzdGluZykuDQoNClZpcmVz
aDogSWYgeW91IHdhbnQgdG8gaGlkZSBwYXRjaGVzLCB5b3UgY2FuIGFkZCBpdCB0byB5b3VyIGxv
Y2FsDQouZ2l0L2luZm8vZXhjbHVkZSBmaWxlLCBidXQgaXQgaXMgYmV0dGVyIHRvIGdldCBpbnRv
IHRoZSBoYWJpdCBvZg0KbWFpbnRhaW5pbmcgYSBjbGVhbiB3b3JraW5nIHRyZWUuDQoNCn5BbmRy
ZXcNCg==

