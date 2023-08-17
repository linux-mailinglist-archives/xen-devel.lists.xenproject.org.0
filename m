Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8B677FB26
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 17:49:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585489.916638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfF2-000459-UT; Thu, 17 Aug 2023 15:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585489.916638; Thu, 17 Aug 2023 15:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfF2-00042G-RI; Thu, 17 Aug 2023 15:48:56 +0000
Received: by outflank-mailman (input) for mailman id 585489;
 Thu, 17 Aug 2023 15:48:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E+2S=EC=citrix.com=prvs=586922e9e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qWfF1-00042A-4D
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 15:48:55 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9069258d-3d15-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 17:48:53 +0200 (CEST)
Received: from mail-sn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 17 Aug 2023 11:48:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by LV3PR03MB7430.namprd03.prod.outlook.com (2603:10b6:408:1a4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 15:48:42 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:48:42 +0000
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
X-Inumbo-ID: 9069258d-3d15-11ee-877b-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692287334;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8+8z5Otw+v2Pq1kLymvwrcxF1IpnD1u3tSLmev4/sEg=;
  b=fiEkBgXwEZlK/MZxZJF61DCXUyTZA49TcO4dPSZkEBFXYBZaDkjkD0q/
   gKYujSV8hA9S6QKNEwSAxr01ClFA+KXm0vPM21fwb8fWJpQlE1Ie5y+eh
   ZhArMFNIKhv7C50imvTyoYyjjKYtyLTFjX/jKzgZe6qMh2FmJKxDtVMZt
   A=;
X-IronPort-RemoteIP: 104.47.57.40
X-IronPort-MID: 119674853
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:G4MwK6PjjUwLksrvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUp21mBSz
 2EZCmCEP/uONjTxKIhxb9mx/BsB78eBmoBnSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/vrRC9H5qyo42tI5wNmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rcoWUZNq
 OIkEhQALR6IruWXxJm4ENA506zPLOGzVG8ekldJ6GmDSM0AGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxvzC7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWzH2kBNJPT9VU8NY00VGDgW00IiEUVACRjqGUjmq7Ctt2f
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmSzoLE7gDfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBVg1c5dDm+Ns3lkiXEo4lF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:f8NHLa92IXUrefKCsmduk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:Y+Sm3G76FVobGlTAONsspRFMPcN4bEHn6HqTLUSRDkdtY77PcArF
X-Talos-MUID: 9a23:oH80RAgw26zJUQFw+0fWScMpapZk8+OvL2oxk5RdkebcGChUPmaUpWHi
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="119674853"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwA0vdCQnCHUUUcsMT6OeHnCCiqkxbeqvRntG+ai/uLvUQLjRIhDE2vGANuRxllTB15qXUuMJp9bk3dl0n7LGQot8DpiAofTiyWzKGU536H+YSNRgsPJzVd7wGN4YUGs9GOJfOQthkr6r18r54jhSsmW9o/hIMKFfbqpIwaT7F89fI6I0Ik3cjkg/z29e14zJXi3/5BOHCCV/JHAwPe3yY4FRpvb8ovAlI1atp9ORtFswBtrx2i+XySZImuKbxuIjunobWrcEX2XysyzGYdlvNOcE14v7f2n4lnGHGmgQr/G5QXcdQ2mSuRUszuisnhfuhWQ/9/fxtFTAWtFwmtf0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+8z5Otw+v2Pq1kLymvwrcxF1IpnD1u3tSLmev4/sEg=;
 b=H0z5H9UotqTnBvAMj6/aUu8gGzV03ODQL5ifEVX5XvG9MPe9qNoNF9eASwhOTbIpipRMzfxeKD2LP0PPeH/vaUCwhOCJy475FV6W5MkojL4cg2yGxMyzbhTuHZP3ia/kBLt8OREvICfNpoRQ9IC3UhUw47yUuuWdMESq3c7fwOjny5HyjFeMgLGlEgn7pnNweWvh84kzA2ggIJYCF5gO5NSDRT0nKRO5GRxh09n3sCAzn/TNH/suuggudgCtv0EhYhd4iSmbPcWknBKbrrt5AR5wcNL4+XK69R5KaQ0vxc+D/lbH1jCODD5fZgFpacGXBqkMM6tzswIDzyzcdvOz1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+8z5Otw+v2Pq1kLymvwrcxF1IpnD1u3tSLmev4/sEg=;
 b=ZAiiJn8lK4/VumBcB/+qm/8ez8fcY5q9SBWVAtvTLV3dJn1D4OYkr4r2YljKedrzq40x8FwZH2yeq6f5JrHWguwnZxgagF19JNYeUIJym+czAnEWBRg9shWmwgjhZTAJTGSv3oEwIMPqH7h0Ano5KWMXXAgmX8ISyaCjlGtF9+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <5e3328cb-a34a-deba-9b0d-e956e131953f@citrix.com>
Date: Thu, 17 Aug 2023 16:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86emul: rework wrapping of libc functions in test and
 fuzzing harnesses
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a67c2fa3-ba1c-3783-c3ee-250aff6903d5@suse.com>
 <defbf6e0-28ee-4276-7535-0ed2e23ededa@citrix.com>
 <e954ab9a-8319-1eb3-913e-738171148462@suse.com>
In-Reply-To: <e954ab9a-8319-1eb3-913e-738171148462@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0332.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|LV3PR03MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: ad3b0ee9-f36c-4862-bd75-08db9f396e40
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ma5Hq4CeBeiizsHzI66vDN/wxU846XjIhvPMJdTT+ZiD5K3gEWr7T5l/MhIq88o8PjyrZUQjfT2bsreCBbjItn0y50xAMLnhR0TFWpuO9XbOBPYw75znK2Cub9j7m+vDrRWl3Ngzbh/boJDR9pkTYBBdT5bLNQOWdpPDlkEI/zuQeyyyC/Gyv8HAyCfwXa7J4okl53qOfViWa8WRYkKG1RW2spefLRAXJ0Zo0jkkmI5ZeBWoS6yKAzTy+bsmosD/CVZhJ7QY7XWdg+PfeTQE0YWwS9bdrvMD1UyijTLeCaHhz6xLk5WiPM6QNbX6mQFkpDE2t0tQ60jeTVa2r09/LKhMC6fEjSCkqh/fQidjNJnwieiJAeB2fLgqAknFC9DgWsDsVOuIZaB6l+qJdATEteu5VGDyT7Q0LpTlD7GtEp961VoijOnsrxBI9Cn1V3dyyDgw2W+tWm3v6ICIMLywfifyuqyzTqU7CNqI0vnsOenN4qm+1v1jeWXGWN13r/9ZUAOBu0cCj7Rw39wstEC7gXBKOYlHj9iQ82cla9k2WoDMq55J1XjJ4GALEWwZPSQeFdWfiD/Sn6r0GsRKCUKg+7bzaK0Ke4gdfQ04ZrHl5nTbBrvISzNk9Uytzg8cCyvy2LYCp7Y79M0SckG4Qgn08A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(39860400002)(366004)(451199024)(1800799009)(186009)(31686004)(86362001)(31696002)(36756003)(82960400001)(38100700002)(2616005)(5660300002)(66556008)(478600001)(6506007)(66476007)(66946007)(316002)(53546011)(6666004)(54906003)(6486002)(6916009)(26005)(6512007)(41300700001)(4326008)(8676002)(8936002)(83380400001)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emJ2UlJQaXZTMEpESkNuU3FkS0krTHZqNmtHWGRod000dDgrd2lHYkIvS0w2?=
 =?utf-8?B?b2dUYlNvNGtZeDdzUTFpYW92Y2h0VTkwbHFGcG5kdTA0Z293Y1ZEZGI5dkVz?=
 =?utf-8?B?SjhNL3ZBOGVONllQK2tzdjFqdi9RQlA4WitFQm13VjlPZUNRdkNiZVo0UkYw?=
 =?utf-8?B?RDZWZUF1V0xsQnVGREV2S01wZzRVOG5ZZDFWdVpsVFFTNmdiWGNoaVlJK1lo?=
 =?utf-8?B?SWRuNWdWdXBieFRldFNGQVZUUlkzUVoyU0lpQUNiUnlqVjZoeFoyQktUL25z?=
 =?utf-8?B?WE9wVERTZXh1M2UvUUV4YkV5OEpPU3o1MnVZckF0MTgvZExneC95eFowQmlX?=
 =?utf-8?B?TXMyNFo1d2JXVGJsY0F5cmtaZGtxSk9remZEMTI2enk2cDhtZHVEWFpUcGdM?=
 =?utf-8?B?bkZlUnh3T3kyMUNwNnUxbzd4QnpxYjRGUXFaR1Ird1kxbzBnVVFtb3AxdXZU?=
 =?utf-8?B?TU9SWGNGVTRTWDJFdkg0L3ptcGN4NGtCNzV6SzZaeWJHMmU5c2czZHpGS3Ax?=
 =?utf-8?B?cUtWRDBHdkhDSTlLdTIwamZQQm9ROGd4dFlzakNRUVVlNExYMzZiS1RiTkpZ?=
 =?utf-8?B?ZEJFTHRQYmY0RkRIWENxZGtudE03ZWd1cVJaVVJiOGUrcFBkUHBnTWJjRDhE?=
 =?utf-8?B?Rm41dkpVMjFPS2MxUVljT3Vld1EvSC9aaGluZ3d3Nm5mVkFzbGk5NnRyWmxN?=
 =?utf-8?B?RmhOOVF2K0x1c2d4d2VTTEJWWjVtWUgwbzVycDlyTzRMTDZFNkpUUVpUNS83?=
 =?utf-8?B?aTgyOFJLdXJlbkp2eWNYbzBUVmZ4N1c5MThXWEFPampyeXk0R2ZLaEpXeU9Y?=
 =?utf-8?B?d2sveE5EVEFTclZGVFV1d1A4UXRiWWhLUGdURUNXZGU3blQvSVA4dG9mNDhG?=
 =?utf-8?B?STZIeUlhbXVCdlk3ZklyY3ZJakVDRmV2Z3d5Uk9Ycnl2WnczVmZYUzk5MzdH?=
 =?utf-8?B?ZzRRNDFURHZOQ0doMW4vMGxneER0UFhZRER2anROUzJSbVVKRkdIYzlud2ZX?=
 =?utf-8?B?VUV2RS84TWpZaXBEbDNwa1YzTDJ6ZzBmOFFINmt0VEZUTTRrSlVqbytjRmtV?=
 =?utf-8?B?UTZ5R0tRMlVzeWVseFNnd1B2b0V0VmdNZ28wOGl1cGQrd0p4K1AzUVpYd1ox?=
 =?utf-8?B?RVNWMFphbjFXT05tWlMxZlBHQndqdE9SdmRIdEtWelR5VWs3RHBmMmtqcXVN?=
 =?utf-8?B?UmluN1hTdWR4eUhmeUpzZEoyMU1TeWFYNENWbWs1Z0VEWjVTZDJIa2JLejFN?=
 =?utf-8?B?Z1dWTXk4Y09BajNhMUtZQTZhdDFJbDBhc1BPK0ZXL2Z1d1NWUDFSNU9HbjJs?=
 =?utf-8?B?ZnVCbEVMTTdEYjV1SDBiU3EzZzZ6WGZMK2pCMGcvRjloQ2dYNDBScGpqU1lZ?=
 =?utf-8?B?OWFWaFVENGtoTEpJdVA0Qkw5WDk0cVdUQUlnazE0SnRlT1o2bmhkbWpXbWdm?=
 =?utf-8?B?VWlMQkNYNGUzNEU3ekNMeUI4UzBzSUZ1ZHZqdVlzVWtTcG03RjdRZ2NXbDNz?=
 =?utf-8?B?U0tZTXgrNmFIZ1lIUUpaditMT2J4RytuMzdXVFBUMERJU1FCcEdTLzdlZW9K?=
 =?utf-8?B?VmFsL0E3VEtoWEhpSHdEU095WnJjWU8wakJ6NW5BQlhOVnYyR2xZVlBNN0VU?=
 =?utf-8?B?QjhyT1ByOW5obkxPK0JVbmFpWlVpOGZNSHlCeDJPN3hOc0ZqSVpvbjRkSzhy?=
 =?utf-8?B?YXlDUjM4MldzVE9XblVIb0VMMU9BWTd6T21ETFBkbGZRbSthbkdyRUpyTURr?=
 =?utf-8?B?VGlNL0F2OExSeHl2YVhPd3Voa3NBQ0svWmZpRFdMZDhwYjJCcXBybXA4ajhI?=
 =?utf-8?B?Q3R6YnB1M2QwdEI1MTlqTnZBcDBQOEltay9zK2d6OFVHWDhrNXZpbzJQOFJS?=
 =?utf-8?B?aHlTdUNBUmd6MTZMTGxQQzB0UFRhU0FtWGQyZjRibVdvWDR4UlB3WkEwR0sr?=
 =?utf-8?B?dG1UZ0hEOTZsV1U5ZTdyakJmamJ1UThtU1RVbWphTnh2UnZKQWNBOEpvZSty?=
 =?utf-8?B?WDQwS25Vc09kQnczSVVOUEFVVmUrczdNbnh0dUVtTGFrUklVNHVEMC9NY1hx?=
 =?utf-8?B?U2VXaC9PUCtjSlpEVVQzRTgvV1FFWHZMOVBzemkzS1NuWG50WGxFUDZxdFQy?=
 =?utf-8?B?aWpiZG9YMGFsS3NCZGl2L3dMNE80UysraTVsZE5LTXptM1N5SnJobVdWbDVm?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PFohiFE/KyajYnNwV/ONU6QSLCtBaMvyyFkKSJ4oGWLqoPN5HdXAieoCgE8vP+B0lp3YlzTA87zTf+gs+xRx+ej4E2ER4Z90OWkCV6IU84PHoHSjhGjobS8JuOZfl97l/GeiobRfvV9iHEtgkDHQkJeqUpzAgj9GcQ3CKmOyO6+9AOeS/R+/E+2ksOK6rF/Ao/+rCNF6ZtryZlDZEz2hsLGL6ZePxMt6z0L5PL10TK0uw2JuIhfq5JLSH7cwjNjW59PoNjt2SYTpWQcBYkbuLkJSAraT2d94rXZI+vKyAJpbmF0uPYcdM9RQ1FYySoCoWQMUayqDfAXH5MKt6G9a9DmfRuH87vqwB/laNgvJtPt4zyoXtzppa9qCZf3t5Ruc4tXZTMmKfTrTIC8HL5Mn/qfyZ5RKKLhZg4dK4Hq3c0GGyHSdfy9GBIF9tUEBsUN5eMduCBZimPtN1FW3i2v5sxRKuiTc8KCq/ORFFXk5pReDW/YRwc9oLW4mmz111t2jQRg7VypwyHG5csf3jOJhESpPcl21dDd+9pqIsjdE6nXtimmuZCMUKH657A7wXAm/3MacQrA3/imEOXF85W1d8b6mJApyFoNHLLD35jsfC3xFVp7zJIJXQTuzoVLYfOqXRXtCYOjq7hi08VqK9/Yigr8GS+Ot8MHMZmMvOw2fdEPZKWmJA7oKieTRr1Uv8/CqOOhsCGZ6a6+Zn+qmNRE5fQ8kGIkZoZ7r+e/ZcGb5c3CtU/QZhh7Ts6AE6YTc/qfqGftp8hdpVa+SkKoMJWuQsCC3RF72jAt4dabdNxzTMVWKSUfgZoBwDTPM61VnjAqZ
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad3b0ee9-f36c-4862-bd75-08db9f396e40
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:48:41.8650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+P23aweGWDCfN2oqNi0NPPSS+lQ8Ub+52QPgCqUk6tlLaVonatwI1uUVFZNBOqlAtSuK2Vot+hMhbjlTopRB+RMiKbq9mTtiQnzrEWdE+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7430

On 17/08/2023 2:13 pm, Jan Beulich wrote:
> On 17.08.2023 14:58, Andrew Cooper wrote:
>> On 17/08/2023 12:47 pm, Jan Beulich wrote:
>>> Our present approach is working fully behind the compiler's back. This
>>> was found to not work with LTO. Employ ld's --wrap= option instead. Note
>>> that while this makes the build work at least with new enough gcc (it
>>> doesn't with gcc7, for example, due to tool chain side issues afaict),
>>> according to my testing things still won't work when building the
>>> fuzzing harness with afl-cc: While with the gcc7 tool chain I see afl-as
>>> getting invoked, this does not happen with gcc13. Yet without using that
>>> assembler wrapper the resulting binary will look uninstrumented to
>>> afl-fuzz.
>>>
>>> While checking the resulting binaries I noticed that we've gained uses
>>> of snprintf() and strstr(), which only just so happen to not cause any
>>> problems. Add a wrappers for them as well.
>>>
>>> Since we don't have any actual uses of v{,sn}printf(), no definitions of
>>> their wrappers appear (just yet). But I think we want
>>> __wrap_{,sn}printf() to properly use __real_v{,sn}printf() right away,
>>> which means we need delarations of the latter.
>>>
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> This does resolve the build issue.  I do get a binary out of the end, so
>> Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>.
> Thanks.
>
>>   I presume that you've smoke tested the resulting binary?
> The fuzzer one? No. I didn't think it is of any use when not driven by afl.
> I did a proper test of the test harness one, albeit not with LTO in use (I
> focused on the fuzzer one with the LTO issue).

The fuzzer is only built because it's active-by-default in tools/, not
because it's used.

The test harness is the one that gets used routinely in testing.

>
>> However, I do see something else in the logs which is concerning. 
>> Likely unrelated.
>>
>> make[6]: Entering directory
>> '/builddir/build/BUILD/xen-4.18.0/tools/tests/x86_emulator'
>> gcc -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall
>> -Wstrict-prototypes -Wdeclaration-after-statement
>> -Wno-unused-but-set-variable -Wno-unused-local-typedefs -g3 -Werror -Og
>> -fno-omit-frame-pointer
>> -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
>> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs
>> -fno-pie -fno-stack-protector -fno-exceptions
>> -fno-asynchronous-unwind-tables -fno-builtin -g0 -D_64f2 -mavx512fp16
>> -ffixed-xmm0 -Os -DVEC_SIZE=64 -DFLOAT_SIZE=2 -c avx512fp16.c
>> make[6]: Leaving directory
>> '/builddir/build/BUILD/xen-4.18.0/tools/tests/x86_emulator'
>> /tmp/ccrznrqa.s: Assembler messages:
>> /tmp/ccrznrqa.s:98: Error: no such instruction: `vmovw .LC0,%xmm3'
>> /tmp/ccrznrqa.s:99: Error: no such instruction: `vmovw %xmm3,58(%esp)'
>> /tmp/ccrznrqa.s:105: Error: no such instruction: `vcvtsi2shl
>> %eax,%xmm1,%xmm1'
>> /tmp/ccrznrqa.s:106: Error: no such instruction: `vmovw
>> %xmm3,382(%esp,%eax,2)'
>> /tmp/ccrznrqa.s:107: Error: no such instruction: `vmovw
>> %xmm1,-2(%edx,%eax,2)'
>> /tmp/ccrznrqa.s:108: Error: no such instruction: `vcvtsi2shl
>> %ecx,%xmm1,%xmm1'
>> /tmp/ccrznrqa.s:109: Error: no such instruction: `vmovw
>> %xmm1,318(%esp,%eax,2)'
>> /tmp/ccrznrqa.s:113: Error: no such instruction: `vaddph
>> 256(%esp),%zmm7,%zmm5'
>> <snip many>
>> simd-fma.c:208: Error: no such instruction: `vfmaddsub231ph
>> 60(%esp){1to32},%zmm6,%zmm5'
>> simd-fma.c:209: Error: no such instruction: `vfmaddsub231ph
>> 60(%esp){1to32},%zmm6,%zmm1'
>>
>> GCC is 12.2.1, binutils is 2.37
>>
>> AVX512_FP16 was added in bintuils 2.38 so I understand the simd-fma.c
>> complains,
> Right. I assume the gcc is not the system one, or else I'd find it
> odd to have a compiler backed by a less capable assembler.

It is the system one, but it's entirely possible that there has been a
bootstrapping error.  We're trying something a bit new.

There are tasks to update both.  I'll keep an eye on the result.

~Andrew

