Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6007BB5D0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 13:03:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613534.954108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoibe-00063n-FI; Fri, 06 Oct 2023 11:02:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613534.954108; Fri, 06 Oct 2023 11:02:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qoibe-00061d-CB; Fri, 06 Oct 2023 11:02:54 +0000
Received: by outflank-mailman (input) for mailman id 613534;
 Fri, 06 Oct 2023 11:02:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Twl1=FU=citrix.com=prvs=63654eace=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qoibd-00061V-5V
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 11:02:53 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e22a22ae-6437-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 13:02:48 +0200 (CEST)
Received: from mail-bn8nam04lp2043.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.43])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Oct 2023 07:02:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6119.namprd03.prod.outlook.com (2603:10b6:208:318::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Fri, 6 Oct
 2023 11:02:34 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 11:02:34 +0000
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
X-Inumbo-ID: e22a22ae-6437-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696590168;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=eYRPzH+0npMSXMQ3zf6SEA4wzt0YhvJur0jdRIAJaJ0=;
  b=VG2cutIn02VLGBYk43i1M+RCGGrvBeN0Af2vTbDiBYpOeuAb3WqFEE6v
   kw6wLeYLTS6dIDcarCdsapRzPi5siJpWovpue/tEh5VI4ma1y57Vw4um3
   9fS5JB3QpzwjiKaPMIWcxcRkqLfiur05DNZRHArwd6vRqgjXnb+AKk44A
   U=;
X-CSE-ConnectionGUID: Dd/EhDJISIGvSNPZJUB46g==
X-CSE-MsgGUID: 3Mum9GEDSUSNnWmI2r6znw==
X-IronPort-RemoteIP: 104.47.74.43
X-IronPort-MID: 123432574
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:wxKOQK/Azh/pHk6LtlblDrUDBX+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zBNXTuOaP+KYmLxedx/aI+x8kxQ75WEx983TgNt/ns8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdnPagW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkli+
 bs1KBwvTyuiqPyN5oqJaNRG2poseZyD0IM34hmMzBn/JNN+HdXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTePilAquFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WUwXihBd1OfFG+3qVPnVjC6UE/MyAtc12EpNjjkBCsXc0Kf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZhZdo8pYkJTDol/
 laTmpXiAjkHmLaSTHeA8LaIvHW3MC4cImIYTT8JSxMf5Nvuq511iQjAJv5hGqOoitz+GRnr3
 iuH6iM5gt07j9MP1qi91UDKhXSrvJehZhUu+gzdU2ah7wV4TI2ofYql7R7c9/koBJmdZkmMu
 j4Dgcf20QwVJZSElSjISuNdGrisv6qBKGeE3QUpGIQ9/TOw/XLlZZpX/Dx1OEZuNIADZCPtZ
 0jQ/whW4fe/IUeXUEO+WKrpY+xC8EQqPY2Nuiz8BjaWXqVMSQ==
IronPort-HdrOrdr: A9a23:s5XvR6zds9B5Gqd2gYuoKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-Talos-CUID: =?us-ascii?q?9a23=3AgzqrMmisPQro0w1CAEdmIZr91zJuXnGa4Xf8AW6?=
 =?us-ascii?q?DKEl3c5ute32t0v86nJ87?=
X-Talos-MUID: 9a23:nrMqcgrfKg9NV8Bt7AQez2pHKcI5zImCM302t5M5vujeL3JiPSjI2Q==
X-IronPort-AV: E=Sophos;i="6.03,203,1694750400"; 
   d="scan'208";a="123432574"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAyfpvPyOtBW6Qz177fsBaeI+YpmHm0BifaRM6llxp7E1+DiCW2HgMz4RLAcr6JVm6/JqhYR5trvAHdTlpP/jS3RgnFXhCBl+8caQ4U5NRunWqTCc8ciFZx3M5Jn0+NIugNv8PxAOtSd0Fe0GMfyFgyXqcqSMLnc1DGVRoKiwfAmm+VCRCe5/p731/MCyGx4chIr3PtcqI8V7qnOByiR4O0/nHBOrQTZVWLHG1al+0PtTFQn2VpXKUdHWWpdn9Tv/4C2Hb1H+SrrsiZMhknv84gXVf4XoJ+yrYvYdYg9q+uki8T08hbeVggFGTmKVclLqMw5j4+RP4YigCt3Ec6QwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06RCNd/zs+ztDoGXCOafYvpDQUuKCIOV2pbc8RZUWzg=;
 b=Yrqoy4LCDfpf28GM7LFSecxnCJ8BEdtF6NmrSkapw/aGluDP6vXLMbmQKomCoK7EfmSMgHwl2Zw+A7SdPlipjKTnoSnFhXZUegB7ewLV3jrDYFXd4ZK0KG4DkNlk2C4169TGsBmC8LXQnLvLJLYsSR9aTPbXD2wcWEm09CPrjX3ucHpripEokX7n2l1vVaHHgQf6nvUYVQYdcAoHMRlkQa7eEgqNIB4Mj36oT9v+qetUPl2E/s3b4uCzSmurJ4diI5tlXYSC+q3F0w817efwh5uvbKsqj4aOkpU52vPSF84Isg1WfcAAXThIwZ2226pVnBbmLLhgyimcEe1zvkGy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06RCNd/zs+ztDoGXCOafYvpDQUuKCIOV2pbc8RZUWzg=;
 b=ma+Y8hBe+itbMaR0ppn+4WGtptXra4uBuW4GCyjuY1Ba+UO9/e/f8aTAb6R9eqEWttpRDHUABa7bC01aEWKuKrpWcalu4cBbL+mNyXP1PULvHYR4ioomZc8iEVvv7Q7k4vPET3DEirsygQIeYlFkQlCMfSFMEjTaCL6iX/qNDYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 6 Oct 2023 13:02:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] domain: expose newly introduced hypercalls as XENFEAT
Message-ID: <ZR_pRUvNLXQ0ftt1@MacBookPdeRoger>
References: <20231006091353.96367-1-roger.pau@citrix.com>
 <20231006091353.96367-3-roger.pau@citrix.com>
 <ac4842a9-7f62-4c64-9a3a-2ec2b1e97699@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ac4842a9-7f62-4c64-9a3a-2ec2b1e97699@citrix.com>
X-ClientProxiedBy: LNXP123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::33) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d217e3-ee5a-4bb5-5312-08dbc65bbe8a
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zmW11JT5nr4Ao2PJBLnIcAwMbGVz6U0yiL+83f/LwbdWL8NxBL+aN/LGQKWxcXD+BwlfQcEDqShIuoA4w45omMh+0nh+KkXPJMX4RCkJkr6FGNBFoP9tcbrd5FTzKhuyODW1dB6Bwgo97rB5I0yuUbyJH2FoNPDHtjBXdTkUobRCv7adTDQcZUhSruDARykoA7lov1P2KdC3ij7NyyKi3CrgIAlx0Qw/da3Clv2QHeF3tMxIn5sYibxaGxTqDUN3KqDX64Ku1m8KuhTnqLOmJkdc4N1giA93aY9/RE6nX+hxrn7VmutcXRgd1xOmDT9Fm2/U8UFe21aKZaWTZhbK2y92nVTNj0AOG3TePDaGSujuDaWmDJXD2eMt4zveiFDLs7fbae+/f/YsgATXEFMcDwKi1ilLg1+kNt5SGD1w2Dm+YveNkK5uQluGh5xbg8FlR83W5Cio5rDX/+drp0KVEYYMfyxmvi+HELwJN8k5tyO1GOClngqc3ztXa8d7gJq9ctRuhHyYNIAzifuiQ+dvJHuEqrTgf+kwi5Zphqo0Iwg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(53546011)(6506007)(6666004)(478600001)(6486002)(6512007)(83380400001)(9686003)(26005)(33716001)(2906002)(316002)(41300700001)(54906003)(66476007)(66556008)(66946007)(5660300002)(6862004)(4326008)(8676002)(8936002)(85182001)(6636002)(38100700002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzRDbVFEQ1VaNjdWd3o3b1hiS0JlL0V5ZzNZVTA1MkdyR2kzaXZOR0J0b05C?=
 =?utf-8?B?RXZxMnZ1SkdqaEE1VnM2Nm8xNUVYZ3J0c2d5VXkyemx3N2d5RjVYRVJoRUNH?=
 =?utf-8?B?d0hMYmt4NVNDQk5mWWJWVEFHQlBqa2dBYURmWXA0RTFCbmUzNmVITUtweFFa?=
 =?utf-8?B?UjJrMHNyU2pwS0VBSm15YUtCdW1VbUZFdlRCVGJQWmRZTU1GMVhNVi9lL1kw?=
 =?utf-8?B?UHpPZVFlZGhvY0w3M0xjUnNpWnY2eGx3eHVmTlhOTGNmTmJYRHFqdEJkQUFm?=
 =?utf-8?B?Y09CakN3TmtmTmVKZlZxNi8yMzB6TGVsN2xWM3N1MCt5cVJuUlFMeDdrQUNp?=
 =?utf-8?B?VmNZakttaG1UM09ZYkpUVUVyUkJpSWNDM1g0M2lldGlvUittQnR4Y2tkeWpW?=
 =?utf-8?B?Vlg4UVk2TE1UTTkzM3BBOHk5b1k1OHRMS1BEaXB0VjdaSFJKelpSN3dxVEpo?=
 =?utf-8?B?ZVJ1RWFvMnQ5TEhTTFNLQXhOZXluQzFKM3NjTk1QNjhTT1p1bGx0MEg1eDR4?=
 =?utf-8?B?a3FvbjdPbTRmb1NHU0w5M2RQZXN4bi9RTEtqemlCWC9aakdZNkRaeExkcElD?=
 =?utf-8?B?OVV1M0xvcHRNSXJ1VGxuZUxJSXZGTU8vR00vN3FQOWVPL09yazJPa2ZuMkRC?=
 =?utf-8?B?NStXKyt1ZFhBbjlwY2RmSE5nTTJGZkNZN3hEVG53NDNnQUluRTAxUldLcXNS?=
 =?utf-8?B?ZzFkby9naUplSEMxWGM2NHNuajBmRGlMVEVORktUZ1AvdHBNbzAzOUNaMm9G?=
 =?utf-8?B?YkRNS2JtYWE2TlZHSmdqSW4xRzZXajZLODA5UnZuTGZWVkM2RlRoUHBzSStq?=
 =?utf-8?B?NnpRbkNmVWNYMGtXUEZnYlQ2dU9GRXpPeXo4Vkl4WmRETkkvU0x6QnRWV3J0?=
 =?utf-8?B?VWF0cjVTazBuV2xuNm5xa1E2NnI0dzg4a2FnS3dIM04xVDVPTG5EdlFXcjll?=
 =?utf-8?B?MG5oVk9nemN6MWptYWR1cURVeGhGSnJFQXQwVlNjcUN4clBqd3VmTHZBUFhH?=
 =?utf-8?B?WHN3Yy9YcWNVS1Vid0lnbjdwM2FrUjl1VnhCK3ViQmhVOXJmTjg4amExbFRN?=
 =?utf-8?B?R0QzSkk4YldabXdwbG45VUU2b1FZbDRjY2hueE10QkpmYnc5cysvNmp1YVFF?=
 =?utf-8?B?d0Z5Y2hzYzBYRUEyRmZGZ3Z0R25CbVQwY28weXJyMXg1anBjS0lLc0kzMlNK?=
 =?utf-8?B?d3hDdzROck5jdUFiYi9oeGVyKzgvNHo0aU1SWTkvaTZHT00rUytCZStsaytz?=
 =?utf-8?B?L05wcUtBRnhobm5pQWtqS0tUZHVqT3prOSsvMEZDY0lIUmg1eEtTakxjQTdi?=
 =?utf-8?B?WVRwRlJMWWpYNFB4RFJyUC82M3ZVTHU5TTlFS25rWWJTNmMvUTlMVHhEMDlJ?=
 =?utf-8?B?ZTByRnBIODlUZG5vWU5nc05MZ1crUUZIbUVQc1hvNDh2OTZsaG9vQzFzdTkv?=
 =?utf-8?B?eE5HS01ZUWNadWxHNDVDY0lUZFNnNTBoVUZ5WXhKRTJQbXJ5WWhZWEgySjlO?=
 =?utf-8?B?VEY3UENPdUpuTDlGeXJhb2R2M0tUZW05UlpxbE54M2RQYU1OQmFxb2lxMlpj?=
 =?utf-8?B?YTFwQ0k3Y0dYa0NPMjBQSXgvVUpPUkJQTW55NVpDK0ZhWWhVSThPVVpadEhV?=
 =?utf-8?B?UTk3emtYTnVFckF1NnFCeFpjaGVMQnFRelZaSDE5QmtHM1U4SUV6bXdEQzZ6?=
 =?utf-8?B?Y2hZV3o1d2tUZ29yamFRSW12Y1R1NGNZek1zZE5xK3I5RU9xalNkbUpmOHNH?=
 =?utf-8?B?SlRoVmhGR2gvMlFUMWlKcGZGNmtxK0MzYmlFYVY3MkFvV0hmTGNpalRMVTBt?=
 =?utf-8?B?VCt4dXN6TjFvR2VIK3IvSVRhVjZqc0ZkVzdiTFN5VEVGZWdWL0pobDRZTitl?=
 =?utf-8?B?QzhDRXhORCtrcVRaRUhpTDRwODJ6YW9CNlU1azJ0WGlEZFRPL05DZjZGRlI4?=
 =?utf-8?B?eXdlUHE3QkVoQUplOFNZQS8ydThEZlNzRnJGY0dIMW91TW5hNnE0UFJSK1hC?=
 =?utf-8?B?aUFUd1J0bVRnSENKTFQyMnVINThKK3hucEZnK0ppR2JQQklDM0s2MTJ5UGVs?=
 =?utf-8?B?cm9nZlY2ZFNGL0VRYVZPRkxSNUNDajlwV2syaE5wS1h0VlJZaXZCQVNZR3Jo?=
 =?utf-8?Q?6XhP0hWLCPsBcHLpig+D7XLKc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YnyJDkYqCzEdxIrn9GQ8p2+JQ7MpLbb88LiWifNfmcVsE/hKFWTQftusAKC1Gq8Eq1SgmzboClRdu/h0YPi/q3EELgIBolJcyE3ir7hpiZD1bpIhQn8q2fKEtqht4108jYTd80yeXRiR8J2Vlgbr0FdVKjorQ9hrU0CEGx4EncFoeeSouo/DI4GJD9pNRHhvRucn8503GXvcS4/0kqhucQsDuQM/O4kNfapoDrUNygDC6ocrOL9CJY1OA3K3LQxvFp4hZxjhrna/hNeFstAVXm+7KhRrNB/gsuXEA1j7/L1b1hLJJuHgy4+7YvZCjq0dtPKu4oCJ8XVaQ5UY5RByBSXccFwCcCnMruhhllPjnTgkRSkjBtk/7/0xCUojfMTf+RDCXVqvxCy8h8/AvBKCaQOm1xsCDJ+uHB4ao/VSdmSNwVHl2JeGoQXJrKfCwn2ipjS8R/NMlmU7KX/vnJWfnW35BETW0/o/HNjlFtSJsruEsL9uG+e2uV8TAawNHu+mftJWS8i26BFZBV8C4lgdyZa2eHKeLF/8oU5ifn+EqNqZ6F61ZQN0UM5jR0MVhRGtReDq8U3V/vpiUpx9N7zln6rfGkbwelW8ERmpWtp5VycOq9ZeYJRTphamb69HV2QYaKNbl0DUilWlcN9lP5XNN7naI5C1NTdaR4IDYGxGKcCZ+4F9Hjm+zhAivig/Zyr30ZGmkF+2C6d9sOIAqjCZw/pg3decl44HdH1aBB+vCeYmjMwpCdgeBz4YBGxurlNdKTVx0+90PfHKZ9ldHH0Q/d0veqUAPxjG5TNIFheyE+POb876hEOiLn06ZE/j+jnLdyTDQJXyPfW2oi77E/Gd3n8WDUMOLOE2AuZ4IlJFToZxyZDbowK2204xqyOcjsWhbtgskVnAFwK/IRASsHRs7wDXLuMwyWQYNv5bVwrOp3A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d217e3-ee5a-4bb5-5312-08dbc65bbe8a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 11:02:34.6911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fXcs2+I2Wuv4eXFbS3WIF9D2Xax45S7r9wT0uUBhYmY1sk67uJbJAtqakBFByY3llDemTVIwGHtxDuXyoLufWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6119

On Fri, Oct 06, 2023 at 11:47:48AM +0100, Andrew Cooper wrote:
> On 06/10/2023 10:13 am, Roger Pau Monne wrote:
> > XENFEAT_runstate_phys_area is exposed to all architectures, while
> > XENFEAT_vcpu_time_phys_area is currnelty only implemented for x86, and hence
> > the feature flag is also only exposed on x86.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks for doing this.
> 
> > ---
> >  CHANGELOG.md                  | 2 ++
> >  xen/common/kernel.c           | 6 +++++-
> >  xen/include/public/features.h | 9 +++++++++
> >  3 files changed, 16 insertions(+), 1 deletion(-)
> >
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index e33cf4e1b113..41da710426f6 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -31,6 +31,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >   - Add Intel Hardware P-States (HWP) cpufreq driver.
> >   - On Arm, experimental support for dynamic addition/removal of Xen device tree
> >     nodes using a device tree overlay binary (.dtbo).
> > + - Introduce two new hypercalls to map the vCPU runstate and time areas by
> > +   physical rather than linear addresses.
> 
> I'd suggest linear/virtual here.  Linear is the correct term in x86, but
> virtual is the correct term in pretty much every other architecture.
> 
> > diff --git a/xen/include/public/features.h b/xen/include/public/features.h
> > index d2a9175aae67..cffb2f14a562 100644
> > --- a/xen/include/public/features.h
> > +++ b/xen/include/public/features.h
> > @@ -111,6 +111,15 @@
> >  #define XENFEAT_not_direct_mapped         16
> >  #define XENFEAT_direct_mapped             17
> >  
> > +/*
> > + * Signal whether the hypervisor implements the following hypercalls:
> 
> This is not what the hypervisor implements.  It's what the domain is
> permitted to use.
> 
> There also needs to be a matching patch to public/vcpu.h to require
> implementations to check for these feature bits before using the new
> hypercalls.
> 
> Also,
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index b8281d7cff9d..df994bd30fd2 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1998,6 +1998,10 @@ long common_vcpu_op(int cmd, struct vcpu *v
>      {
>          struct vcpu_register_runstate_memory_area area;
>  
> +        rc = -ENOSYS;
> +        if ( 0 /* TODO: Dom's XENFEAT_runstate_phys_area setting */ )
> +            break;
> +
>          rc = -EFAULT;
>          if ( copy_from_guest(&area.addr.p, arg, 1) )
>              break;
> 
> and a matching one for XENFEAT_vcpu_time_phys_area because I'm even more
> serious about this becoming a domain controllable setting following what
> OSSTest had to say overnight.

While this is all fine, please note that the newly added code
{,un}map_guest_area() is also used by the existing
VCPUOP_register_vcpu_info hypercall, and that one can't be disabled.

IOW: even if we add knobs to make the new hypercalls selectable, most
of the newly added code could still be reached from
VCPUOP_register_vcpu_info.

Thanks, Roger.

