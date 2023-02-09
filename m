Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142DE690E8B
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 17:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492769.762471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9zP-0003zI-3Z; Thu, 09 Feb 2023 16:41:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492769.762471; Thu, 09 Feb 2023 16:41:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9zP-0003xa-0C; Thu, 09 Feb 2023 16:41:39 +0000
Received: by outflank-mailman (input) for mailman id 492769;
 Thu, 09 Feb 2023 16:41:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3QCz=6F=citrix.com=prvs=397b6fb01=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQ9zM-0003xT-My
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 16:41:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aebdaf4-a898-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 17:41:33 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Feb 2023 11:41:29 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6173.namprd03.prod.outlook.com (2603:10b6:5:398::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 16:41:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.017; Thu, 9 Feb 2023
 16:41:26 +0000
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
X-Inumbo-ID: 9aebdaf4-a898-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675960893;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ug7a1NPUTyNj/QHnZYpUUeMdmOMKtVrrzJhZrS1QEX4=;
  b=EBLEyRhQmHCq3cEWDC4Yaqq3qDGZ67FHZiFugBYTDsmpX9VEAbg0NXU7
   dbbxqNu+2c7b9HJZgy4TXCMCG2YF9QI2I27JXffMwXgQADadXH/1VIe2W
   hBRPuG47iNQAgSLFZiukKtuouNgtu+S3n5tbHKJRq2F5FnffI6LWMfHgR
   U=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 96306456
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QoPLaKpPDelKV2TzzPg5U5UqyTVeBmItZBIvgKrLsJaIsI4StFCzt
 garIBmPb6reYjP2c4tzat/g9UIEuZLTy4M3GlZp/Cg0ES5E85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyhNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADZXNjqvi+yn+eKcR8B3t/gtfJTqH6pK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSFEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpqKUy3gHOmAT/DjU3Z2bqg6PnmHWsGOliD
 VImoxdx9KEboRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC2
 laXkvvzCDdosbnTTmiSnp+ZoSyzP24JKnUFZgcPSQwY75/op4Rbs/7UZtNqEarwhNulHzj1m
 mmOtHJn2eVVitMX3aKm+1yBmyirupXCUg8y4EPQQ36h6QR6IoWiYuRE9GTm0BqJF67BJnHpg
 ZTOs5L2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:idELCa1CHZiJK6EkzQXk7wqjBIQkLtp133Aq2lEZdPU1SL3gqy
 nKpp9w6faaslossQ4b6LK90cW7LE80jKQFgrX5Xo3SOjUOxlHHEGgK1+KL/9SHIU3DH4Vmup
 uIHZIeNPTASXN9kcHx7E2AG8sgqeP3lZxA/d2uqEuFujsaD51d0w==
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="96306456"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bg2r4lX4pepouwrIr0nRAEy/GCwILgj0f6Ed+72zK7DhOe2WihSIpW/0Bw3r0lwv0ZzWTDYOSWetNbx9F+mFVxTbcTHzim9GFJzQiCXmrA85hclDgpjSHWUA+5xlbB0vh/I3NHpR6yv4hfETGyZUmhPArBp9sE6qF1TTjFEecAwrcWsPXFOb10QkYGwtJdkGJnDkXFe/goNZeSykny150cDvxL3bH6CPCUgDga9l4tpcQrGa82gdxCpWIBYnedNBRNO5z8w4mRaAkyxi8ITwPe3Ab/BgAtrdY1d/Axo/azQ1nOCvBXpEH3YvXMS3/L6oVR7YksV4KggZg4Ft/OHRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sufq3IKddfs6jvjPRMD7WCi0B2YbpDb61ilwYUwtVOY=;
 b=gMzNk2EoGc69xYcoHbMgY7SYEzWLbNrSL4Y9QW9NC0iO4lRz9i/3slx3X5DJ/PbPDSTrMUclbLKQtz6yBowUbUvnD//BCF3fqZO9T28O/25pk+LPHP87GatgTD6XYWiDrwcE1FlGwfpI4Py78kXMZIUsS9aU3Kkyl0mUxp1lDmIQ5PaI3ompg+XUURWU/3rqzxFaV1XN6RRG2f41oH+Z81HEal8L5StGkGKtZmZCvij/ZxgAucYiF36mH/0jcm7HvUHVskxvBkUuIYUri15ltP7hF1GjwN8XWfLPxzqTlvzk6B5dhza4BhVm/unHNd1lzFL4oGNP5D+RRafDPX6Vfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sufq3IKddfs6jvjPRMD7WCi0B2YbpDb61ilwYUwtVOY=;
 b=kZS/YG2Y7F4Xoh3uyUFFWVAOUlqiyq3vaVoLJxotrtjM6RzZm6nTae7Y/aqJ6mPaDbq0jYnn9LToSt+TU7XTdhpU37j4pZfF7QlnqA9APBOajyXhMoNiZBkbpgnFjA0HYuUVuJd8LiIURLyzL5wF5bcxohEXQnfIHbdeH1OGIg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <131d89b6-3681-3776-aae1-453ece0a0ead@citrix.com>
Date: Thu, 9 Feb 2023 16:41:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] tools/ocaml: Drop libxl bindings
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?=
 <edwin.torok@cloud.com>, Rob Hoes <Rob.Hoes@citrix.com>
References: <20230209154300.22130-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230209154300.22130-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0034.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::22)
 To BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: b377a220-2509-4981-0e2c-08db0abc7c92
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SYbrJPk/kbJIarzqoRZpWD86GclxSwRjt2AG8lp6QIvS3jVnUGQhaaDXcsMAsgi/39va4+dmczLYidySw+ru1DFPdsYQ+csTZVINMLlpeDdM9ojYlGj78TRYzht9oOVOPjZb/s7rA4p0TDWTXWHyOmu9pd0eON/G3w3GlioEYoJua6N2jti78ziJit6Gm3+QsLsia/oWz2t6ZIYfHKXwOx71FfYXVvWix1c9X2Bs7azMSMnsPTyUyffpj5vg76EYv5rU6K4nZ2GdV0KdUwEnDl7oifzuN9qi0klTyoZO1vbCiHrIbOayvzS4Trr5tYTN2eXLypCBzSRAjuUdrO8yZyV/AK3w/F040J3ia44RLKtebmELAWmLrx3rQLJfVAf9dEynhUyMAT8LuZqyUKqN0jngcnusTWO2fdlkd1vRKzQXQ62tjhQeCiay2mk4NWMZ9KbF7/Pip0zQxrdGVACrhhA5jY0NyWUIgvQWEzNFJ4vPh4CcgBlA769SUJREeZp538bBHQMpHbPG7jY0nno7BFB7WzQFTwRrigiAbgfGzEj0oxGKl6Ig4/AqgOHTpwj0C/VxD3YeGQ1AW9/I5PGZaJ+Pj6ad3rulCvWYtywm7/xv/cH2k5b28hHwmu1VxSpPJXCTHXGjAV+yLqb2BhGjM3XsyHjOCtU/hL39+7v4dZgePzYi5FNg+TxJCLG4RIXtoI6w0iVTIJ4CPm8WBPuRtS5QMVUI78OyXTpXx7SArU2YE0fdO9m3NUWe5niXiOqu0rV8etdvCZqsl6YjEai0mA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199018)(31686004)(83380400001)(66574015)(36756003)(2906002)(41300700001)(966005)(6486002)(478600001)(31696002)(107886003)(53546011)(26005)(6506007)(186003)(6512007)(6666004)(38100700002)(86362001)(2616005)(82960400001)(316002)(8676002)(6916009)(66946007)(4326008)(5660300002)(8936002)(66476007)(66556008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnJHaC9VMlVtbzhLVytHYjBWaEZhb0tvS09oditpTFdPbTVoUDYzQk03bm90?=
 =?utf-8?B?UWtXbVVGaXMyaEJRTUdjd2hINzhYUTRNRzBlU2NkbzdwRUJPTGxHeGtmMDk4?=
 =?utf-8?B?NUtLaG5NNWRPUXlHeFdibm9rclFZZWI0RzF3Ym9HZkFzK3hOWGtlTldHK0Q2?=
 =?utf-8?B?QVF3ajZCMUgvQkljZHZobHBVMCtUUkI1NGgxbWtvOVFkbW1VUDY1OXlDN0dN?=
 =?utf-8?B?VXYxcnNuaWJUOXdaQ0tLUTNrL1hGeHo5RWIrMGZUSDVha1IrNW5lTXlLeU5C?=
 =?utf-8?B?OW5FQWt5ZEpURXVzUTZYN2k5cnM2TVB5alRxWThNZ3dsVmlrZ0JFamtrdGhx?=
 =?utf-8?B?enpkaGJxL2hiZVJhOU1YYlBaS3loU09BNC8wY3BiY3VsWGlqazZVc25FUXBi?=
 =?utf-8?B?TkdZMi94QVVaZncxOXdYc3lJd1FJVUlLUWhadVR5Y0pDUUdBV3phbFBLbUNs?=
 =?utf-8?B?ektPd0t2eEIrSDlqYXJ6NXNTKzhvem9ZMGFaN2FKNXJQMVRBWERLeHNGdVpm?=
 =?utf-8?B?Yk4zMmRDcktKajN4eWJuOEQ2UlQ5NEpIRXJ4OFBkNW9kT0tlQ1hDb2lNSElP?=
 =?utf-8?B?M3NUOFRTdEp0cHZPRnJTWk9WVWpsTEJaN1Q3UXdLd2NFMFpmVWpOUUFTS2Qv?=
 =?utf-8?B?dzd3MEpDRG1zL0drQWxnQUdVNUROREx5WTJMNTNCUlF0ZlA2WE40VHlKenhz?=
 =?utf-8?B?dWtLcFpGZnBoQW5wOXZlZ05kTE9kdG1GamVYYk9zKzlQekw4d1NMY3lQTzNB?=
 =?utf-8?B?UGR3OFVCS2VwNnIrL1NuV1BpRkZzMGMxWmhrV0pEWEdxam5jejMwNFhhTWxm?=
 =?utf-8?B?TWxLR2k3QmJUSFZNekxocDVjaEFoUzdNZTc1Y0pXS2N6djJhb2daV0p2ME41?=
 =?utf-8?B?amo3Qy9yQjVQVy9IVnBBLzlOVm96N0NtWlhEbzRJM0hiemphMHkyMExWaUF2?=
 =?utf-8?B?bVhUNHFMb3RKQ2pkV2xFUEkrQ1NzciszaE9Lc2RMdEp1bWZvR3QyQTA3Qm1W?=
 =?utf-8?B?VVI5R3JqVGxkbXBTWVRmYk5wMnowRUg1U3Q1VFhuR0wxV2tnQTVvZ0JIelJJ?=
 =?utf-8?B?VDRjRnV0dVRUd3QwWFVRWk1BZTdjOXUra2NiSTNtbGhSRjE1MDFiSWdGSEFO?=
 =?utf-8?B?bW1GZ0N3SmNEcHJtaFJvNXErcklvWjNyeVFSQ3grajlZMlhONk5HQTJNNk1V?=
 =?utf-8?B?d1VsNlJldFE5emdSS21vUVE2NTB0YVY0M2FkU0tnbHBQWWdTRC8vc0RYeU1P?=
 =?utf-8?B?QnRVS2tzcytiUDdmckpEYmh6ZDFMZjFkcjRhRzUweW8yakhCaTRjL2dIM0Fm?=
 =?utf-8?B?dThKNjhoNkdPVEtDbkRTZWJHQlhrWUI2enJLZTVjMUtwYmxNQ3daKytIcW5t?=
 =?utf-8?B?eG10NXdpYTBUaDNDTm4rRC9HQnZVTnZWc0RHNVlIbktoeStBUzk1aDZRSk1F?=
 =?utf-8?B?bENsS2p3RVBsYXBvWnZJRDYzd2hOZWhxNFliREdvOGtmSVFycHRadWpBZzB3?=
 =?utf-8?B?empNSkFxZHRjWmFQUlcyNytiZ3dqQklaeHNRWlZNaXV0U242YTFVblJndXh4?=
 =?utf-8?B?VjQya3dYQVF0d3JldGdBa3RHWnV6YlRveHR0TkJhdjJaRGxEU2xVS0M5eCsy?=
 =?utf-8?B?eWd0Y1g5WEc4eGg2d1NiOEZ2YUc5aVRiQjZYZ1Niajc5dWRJSytUQS9aNU9j?=
 =?utf-8?B?eFhOa0ZtS3gxZGtTMUZhaU1kaEZwS1N3L3JJUXhzVlozWi9iSUFpdmFtM2dO?=
 =?utf-8?B?NmpXeVVhYWdlL2o3SE9MK0tPbEFUUjM3ejd4dGY4SFpLRGlYOE9FTldZekRG?=
 =?utf-8?B?eG9GaTFyZVRLSGw5TEcxL3ZOQmtUNnNUUDJoSU1XekhMTTNoRTEydCt4bHVT?=
 =?utf-8?B?NHFvNGVPMG10WEltdEVlYnV0blNkcExLdzNiQ0VNN3pJdHZzWlM2ZThVZHRn?=
 =?utf-8?B?UTRmV2QwWHdyRWNQTlRnRzYxTFp2Z0E5TlVVVHRwTG1aRjBwOTlkc3lBTFhw?=
 =?utf-8?B?UlI5RW40c2EveFlCSmRuRHd4UjlyQndQWWwzZy9nbjk2ZDVZVSszeTdnd2ln?=
 =?utf-8?B?dWpRNmg2RHFqU2pvSS9rMHM4dFcwM0g3M0xCemRBcVdkR0RYanh4aWhrVy84?=
 =?utf-8?B?bHBHQzVDS05ZTUh3QmtEYUV1elJzYVllWHIzWlFQb2NqUDJSUTNCa2xLdnBU?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	41eiVw7BWPaZarhTfGQNdOrUVWjGG+exjkzSvYKV/5qgnndLpjv6STE5wtWv+Ttl7IAbHjOHWCAui0dq6B+wjTUrYYielG3HUp4YRGjUFraAHwWpRE/MZy+c1YriSb7HC44PeVIXK98Trf/YiOMMq8WOmoNuoixA9WofyZivBPaNbQk1STgCDY0ssBN4LwTg0+7AkCFJAGP0Hq39YxDBqPhtafOaUZq0HCnvQtpDPGJ+eWye++TN0EWEQbf2wT6UeAKVvFqk0mN/zQChnRYlgIVCq5VWZrbg9XxkFWy0/Oc77aShXYS0JcokRNtAEuF0Pu0Py/Ah7ciqNhbrlLlrazxhL21WM5JVsCB/IDbnntsM+YBXUYX9f6KujICo1+UrSfQRqlLSzHF7wk2jeevIrz/6/dgsaglKpN4yfO1qUJoKuzq93zw+vk9q1yrPEqJKknyGitcy3kyw7yhEL2YW5TdbwGzX1GtEB38el0LlMH/vIVyNKvswyXPUX4nE151TZBI/NDeXmZ83Ri8rIqK9olrxasO/NQ4xFxzCfXKJKxc57BlrbabwAORrbEnnC+W50WBQOaiXVne3SaIGLUMS9nelnDSJorgcqrK3T+VyuKXTyxUPwGgHvIdluejePguq2piRx6ClF2QyxKskl5FvU9hC7+E0eXIeW5hP+ZXf4H3ywdCFOuibHB7IzJjWYCi2ApCv2HoBW4xwO0iLItDchwyO54UZ+0bujCEc0IruJrM2JneKqz4QDYV5JL/CqRmhac8qEs3+3uXCjreiI63kV4O0tRzXy+pdVEsHT/QcJJt0nf4mi0iNLATJSwAbSKmLyR6xJMXljiX4Dp9qCp1OzA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b377a220-2509-4981-0e2c-08db0abc7c92
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 16:41:26.6570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiqEU5TsBSqoRJ66XvC325xpHR6V0IXICDB969nPMt2eU6rY9cCP85SWteaw54v2g9zmUntsZ4ARp9MCXw+uAnKBAUy4R3RfqhFW4hlzfno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6173

On 09/02/2023 3:43 pm, Andrew Cooper wrote:
> There are significant issues with these bindings, and their companion half in
> Xapi was deleted in 2018
>
>   https://github.com/xapi-project/xen-api/commit/203292ebe0c487d7ae4adb961a6d080f4fbe933d
>
> owing to there having been no development of these bindings since 2014.
>
> In the unlikely event that we'd want to reinstate them, they'd need reworking
> basically from scratch anyway.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Christian Lindig <christian.lindig@citrix.com>
> CC: David Scott <dave@recoil.org>
> CC: Edwin Török <edwin.torok@cloud.com>
> CC: Rob Hoes <Rob.Hoes@citrix.com>
>
> I'm unsure whether to drop xentoollog.  They're technically orphaned by this
> change, but could be used in principle by the other bindings.

It turns out that the xentoollog bindings segfault anyway, and are an an
equal state of disrepair to the libxl bindings.  In agreement with Edvin
and Christian, I've dropped them too in this change, but I won't bother
reposting an extra several thousand line deletion.

~Andrew

