Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C246DA416
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 22:53:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518986.806093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkWaW-0004M4-AW; Thu, 06 Apr 2023 20:52:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518986.806093; Thu, 06 Apr 2023 20:52:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkWaW-0004K2-6d; Thu, 06 Apr 2023 20:52:08 +0000
Received: by outflank-mailman (input) for mailman id 518986;
 Thu, 06 Apr 2023 20:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkWaV-0004Jw-6Q
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 20:52:07 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e001f678-d4bc-11ed-85db-49a42c6b2330;
 Thu, 06 Apr 2023 22:52:02 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 16:51:55 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5053.namprd03.prod.outlook.com (2603:10b6:208:1a8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 20:51:53 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 20:51:53 +0000
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
X-Inumbo-ID: e001f678-d4bc-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680814322;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FPJjCitQs70LnEKKEsJ07wEP56wcTZf3B05zZyNf+DM=;
  b=PRdwNKXLGVHxd0QvCWgkp1fChjhs4sFshEK9QCArP9BHmFHqB608RYtl
   oCBCupDVpDVg3yN2UyBAZjAR8DaBE3krakFyKtS7iw5qXcwtjVcaNjFJw
   2+7iJBxY1ryzh3RkyPwaIm1trlVUH0MQ7z1n7HGjLgrebLLCX1wPo64cA
   Y=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 107049219
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3MCJsa84GCDTWonvbsDoDrUDrX+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jMYW23QbPyLZTf3e49wO4m//RhX6pDRn9AxQQRrqSE8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmOagV5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklx+
 eMDchU3MCnThrma4OqRWMpIg+MKeZyD0IM34hmMzBn/JNN/G9XpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUujdABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdpNTOHprKc76LGV7nIKDiYMdgWWm9WWlVO8VO1aO
 mIS/iV7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq16bO8vT60fy8PIgc/iTQsSAIE55zpptE1hxeWFNJ7Svfq05vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:hwlrHKk2S1eFfl2Fw2rKfaGzNibpDfLZ3DAbv31ZSRFFG/FwWf
 re5sjzpiWE8Ar5P0tQ6OxoWZPwP080kKQb3WB/B8bHYOCLghrVEGgm1/qc/9SiIVyKygc/79
 YGT0EdMqyUMbEgt7eJ3ODQKb9Jq7PrnNHLuQ6d9QYRcegAUdAY0+4WMHfhLqQ7fnghOXP7Lv
 uhDwh8yQZItU52Uu2LQl0MX+3CoNOOsZL9fHc9dmoaAcC1/FCVAabBYmulNwklIkNy/Ys=
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="107049219"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f91vVwNxGoT3FOtshY/F4R5J0ZmMP5M8zphZ12SG301cyQlMxmLFEiZtIqSugUvafpiq7CvFOtIK7s0oATcCu+QlI+pfUgKMTyqEcR1yHo2ry5zU/emZVEU0GP4iIdrBhxcZoFQUycahNrvuQoDLWzTLj5M7F5WTNzt+AxWtCowgsSqlBeP/T8Obk4U8SbykqmfZIkWexQN/TYKsUSqOSKlVk30VZgU0uAXI0978UBWuUG0iFJrUtDYfZGsXsq+eUdmhGAoMGfHlyipc6nFF5DjZWbSFeJzDO6A6POIqTvrcYLws6df0eNbGccJvlioisKMlRIC9kEaD1bcMtW4K2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPJjCitQs70LnEKKEsJ07wEP56wcTZf3B05zZyNf+DM=;
 b=OqbKzQvRYmD73rOsp8gv00Uy5C9G1nKVFDjCGNO7JF37rRDByttpDW0rFZDFpNNUA7b6dYJ/gtVJvesuUko+DOX8O4tFXRChkc9imxw17BlFvvfSvuy2gmTeoCcq+SHJl4Y+18gPDwO1VQr2hy49at/OgmD0a4+z+5NHR7es6NzDao/FO3YmXobu+UZVVictnH/d/yYmzzKx1BUI7hql5nZgxucPpuXltgcBhR8U5geVXhtkq3TIJWK9P+sxUF7NpEfwX3lcxz537DiiyQwRu5E97p7s1P0iF9D2QXfD024nXNUJjcWV6s7KoLClsQkhJKAEJYA8G2z234YwMX/nnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPJjCitQs70LnEKKEsJ07wEP56wcTZf3B05zZyNf+DM=;
 b=gF05FE1j0VhAHCN77dNSVGP8+NaJI4q+ioq3CxSxN7ZRmUSWXrn14HL1dPZqJlF3vNiB/JUJtFdU68T9ifqMK5z293AdYYNUrceWAR6h2eZWmR8h1dse0Rg577qR1V/V7nkX8EGEB8sz0QlAWSCoD2SLOWBnotAmFXlfH7acncU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0c94594e-2eb9-b94f-11a2-1c7cb937534b@citrix.com>
Date: Thu, 6 Apr 2023 21:51:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/9] x86emul: support AVX-IFMA insns
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <c5358413-2638-23c2-4d44-a925c6f08d49@suse.com>
In-Reply-To: <c5358413-2638-23c2-4d44-a925c6f08d49@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0203.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5053:EE_
X-MS-Office365-Filtering-Correlation-Id: f81b2d59-eaa7-40cb-ea10-08db36e0bff8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S3WgowojS6ZA+a2EP/6xqud4B+A++/lONxzJd+dYVcG5+6fHQYOsGY0RY5mfagdDQlWYH2lnhJXUHxxFCjV3+QJ+G5Bm8p7VAHa0Hrwy/iPTM3K1PdzYXiUGJnBiqKq1keiRW1P6ReKNyKln6UR/gJzWiRj97i1sIfemg0OVPnpChr1vDayLiBWfLI3B+A1S6HhyLsL61fJp0hQTKOzMvwBqaOKXHFuR6bBrQd0Ge+KbVQiifPelsp9skMi0aTtvwt+bEqK5ynx2fAK2UA7oXSI3cmFl77wHFYw2636SWu/xvZRDeTirJ3moLoYrYcjFg+c/UN4cUFrE5ryZEZMs/u1d9yMBOTwIaX2WBD1uenVCkoRWoV0viHtbZzjHrosqZg343rgEYpE1+lkj7bBt/2qP+o7TlQX4UbnPcDX6FzjH78XLQxQjk4bHZtTl231+mgh9SfHclXZAkKLUTt8EpPhUOuvvq0bjxPGePLMwkPpE0aaikacLvB+7puz1scRommMP7UTYBTCPQCWyjtV5IZrO55HyfW2wIQtkFtOR295Ch8Rxel4I/1CjNpN99/rryN9lGpuJxPmMUU4Zc8B0cD5aKonQF1dFBd2M6VzGlZPNmPTRspylmtszoA1ZbfcXMECuiVtnqWUFHXrptVGyqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(31686004)(4326008)(41300700001)(38100700002)(36756003)(4744005)(66946007)(66556008)(8936002)(66476007)(86362001)(8676002)(31696002)(82960400001)(5660300002)(2616005)(2906002)(6512007)(110136005)(6486002)(186003)(83380400001)(6666004)(107886003)(6506007)(26005)(53546011)(478600001)(54906003)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck0rckw0THFsSVdDZ0pjQXdsM1lkTEdXVms0LzVOblBGQkNDTmhaS1NFOGM5?=
 =?utf-8?B?Mmo4YjZudElPVVFMUXNKdDFGQ0hpWlFqMlo5QnFyMFZHdG1heWlGM0dHQjdV?=
 =?utf-8?B?d21oQk1zWkcwa3ZPL2xwcTBaeUtrWFMwQUpRdjRna2FIUjRYK1BOcGRpS2lP?=
 =?utf-8?B?eHV1RXhoOG04c29ZWUM0akpMRjMxbTBocTduSUpscHJHdGgrL2pwRGRLSzgr?=
 =?utf-8?B?SHN4Z1gzSy9Cc1VCbzlmajJvUm91ak00ZXBKbDgxSjNqZXpnb0QxbDRocndl?=
 =?utf-8?B?MDBwUnVORm1Ba1N2Z1lRTkVBaWJxamJ3ZytmTWtkOE5EOW9uVVJHZ0lqOUZY?=
 =?utf-8?B?VzhZSE1TMDdlVTNXeW8vWTZ6cTNoakQ2bi9nUzdnWURlMDF1clUvdllQOHNL?=
 =?utf-8?B?Qko3eDhpUlF1MWhYQkw0MHA3TWFMR2pIVmp1TWx0L2thNitzb1FHS2wrWUw0?=
 =?utf-8?B?NVZ5UzYzMXBOTEljWE1iUFJqWGg0OXVYT0FHNlZvb2U5dmJ0UUhZQzZrRDdh?=
 =?utf-8?B?c0ZDRTFXRVN5emtkMEszbGFTMU1KSkVpeisxd0hPc0pFY01vd0J1eC9Ld05G?=
 =?utf-8?B?TGo5UzBqRVd3QzBYdU5IQmw2MnBHTWJJaGxCOHVGalFBWDluM3NlOHh4aWRY?=
 =?utf-8?B?Rlp3bWtmem54b05HVTFldVYvdjJCSlFrQVlkTjg4dnBDMUxUcm5sU1FOcjdM?=
 =?utf-8?B?bW9udG1GeVl2RGZITFZxV2ttYitxdE85cHBCSEkrck85NzNUdzBRYmJtZFR5?=
 =?utf-8?B?S0FIeWROQVZkcTgwaVFiYWh1bU5USk9uMnFzVjY2VjR3QXBReGxzdnlEN1BG?=
 =?utf-8?B?NWtOSXVpZjExdnUrZTBUWU9pbUxqVnV1dS9BNFBpUi9WdzRTcmtzd3E2Sm5y?=
 =?utf-8?B?SWoxS0Y4bDJDSXhWaDlYSUEyWmFRWGVvMnd6R3dBbkV0Nmk2bEIyMFB3enJX?=
 =?utf-8?B?Zks0YmdYaGMyL0NWOTZlRVBhdHlvWkFqZlNCU0VKNlpZeWVoRUxPWWkyaCtz?=
 =?utf-8?B?Y0l2aFI5S1hpSUFvSzRTdVN6U1ErYjcwVXJmOVJIV1FScUNiZXlXMXFQeW1M?=
 =?utf-8?B?NmZ4TU0rSlZiL0hJOVY1ZjR3SVQ4TEZKTUp3bFVTZ1F1RVFka3R5RzNtUGZW?=
 =?utf-8?B?THRRZ2ZRcUw1ZGhsOWdqaWJiaitjZTdsaWNidmtpNkxHZHRFL2Y2ZkxWalhx?=
 =?utf-8?B?c0dxL28xMFNvZ3RwbGJUSDJtZGIxR0l6ZzZyUHhsdGd2WVpKMStwY3JtLzlF?=
 =?utf-8?B?M1lyaUZzTTJSTUNkS0krd1ppNWV5SXJROXJMQ0IyRFUwWE5aMkF1REpIUTQ5?=
 =?utf-8?B?NmYrK0ZPUW5DcnE1NlFWMkg3RE5oTDN1T1hadXJFdHpJVFJxbWh2cDh1NHBx?=
 =?utf-8?B?amJCcTI4RTViekZwRXBubWJHVFBPUjFZU29TY1ZsNll3THFXdm9lYUloVDRJ?=
 =?utf-8?B?eFV1THZCandsdm9laXdLbXB4QzhGNGd4NWUvM1dtUmhHVExES3lzNnNtQmVL?=
 =?utf-8?B?b3Y1RmFZUFgwQm8zZXYzRW1qWDR4Vkg1ZE8raWswUms0cC82Mk9KL0tncit5?=
 =?utf-8?B?TFY4RkwveU5ZeEFzekVLK1FBeWh0Y1dPRTAvN3QzR204RElnRTJjS1VFWU1y?=
 =?utf-8?B?YkxvM3JFTTd1MENlcVJ4VXU1WEx3RE9XeEQ3ckp5WjRyNUg3KzJYK3JISjJ1?=
 =?utf-8?B?VUtocDJ6Ni95aHp3bHJNdHliVnV5NUsyUi9raUNpQmlaUDVxWHE0Sm5XRFlT?=
 =?utf-8?B?SU1GTnpwT21JYkFEdXJRMWFYWmNibHZ1OWp0VjlBQ3djUm5URzc4RVFmcGJG?=
 =?utf-8?B?VTNLYm15TXMvVUVuRHNmaWlvS3Znd3RUV2pqdDF4VnR5V0swWGs3Vk5EWDM0?=
 =?utf-8?B?MGRyckZSTC9pcUFhWmFUV1J4S0hTcDc1WUpzRjllUHd0eFc0MGhuMUM0cURE?=
 =?utf-8?B?REhnYkxyaUNGemNJZDRzTkUzV2c5OHFsdzF6UGZqVERtK2E1THF3c09QYmRv?=
 =?utf-8?B?Zk5tcCtHQU1GeDRjTE9ueEQxNnlxdTVKM2JtWnFrSXUvaEw0UmkrZUd1ZVgv?=
 =?utf-8?B?NWhtakR4SzUxU2hBUEs5M2h2KzRnOGdKRWYrTnU5U3VaVHFHdjJhcEtrNGUz?=
 =?utf-8?B?bXgwbGo3Uk04NWNqTnpQZ3RwZ2ZGcVoxUlUrZERWTTU1YnBTblZ6NHptZ0dj?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2RR74rlYCM+wQ0wfVRUJEgO4zba2qaJrjBMZd1R5ebeABfxRa/Pz5fJ8zd9b6O9z0eXbD3lINMKDQXVMaMD5i8Q+cQEO/J8NkIrALHneF+ALE9ovlUbh27qIg+NcQ/H1gRbAl+LTfJUHlK/jnlZLY5ilG5WUbyplhbcLROngh+REeeCKAklqGwVauxpHXyQ5SKAkjxFTc/BgTwZjuwyCuvTQEGEt9mEZHxJF/4tgDJZ+RYEtXbNmsVJh2EcXRShi+qoZhX56Q3ysFB+Xbkam+DMaWsE+abR33g/yhykR2S9uC28A287B0xi9/LYVB8950Z0LvJOYTbxMt/RWv5xQ1NOkcmyYaPxLEQeuDIlGZJx2XbK5lfrTkt3HO+DXv7ViE0odDqkmT6DhGgGiJgXEE/wluXewtpkWrcgz/HDprGue4Ohp65UxePSsgldkD9ha3khR7FDLW1LEEwOBMaxKE+uqt2kBScmwPxmFDdUPbDMg38cg5ZIa99pF7IsYRjh1iH9H3r1PRYv8SbKAGLs2q0p3i3aJ4blxM18wXuPzwxJ1foNex0xFkoiRLF1pevM3s9BNQrIL5w7QvXEtPt20fHe3BDqodvpHV//7Np52K//vmoIr+oCpKb8gFzBANgSVfuhwQ35G3XZj24UMJxwc8ofEAMV4NIjh8c/Eh+3oCzvN6KnKezkMDjdr5BhutHjZZCLpIKyJjXH2bchdRBE6mAkQGyvxcIiaVqujyx30A+nt1ygxBTT3KhIGOj3phIDxZF89d4wsx7RqxeHyEWy2oAZ7FEJivJwZ0J8JDcRinHJ3SbtLrU72KnwXttuGfdcr
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81b2d59-eaa7-40cb-ea10-08db36e0bff8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 20:51:52.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vy4dqYm7q+yK2KRRyDiLStU+oglfa8z9xBKRMkUTg2pvHdyXpkoDqgfxQCSyGKvzXTP4p7DHTE3dsnMABMUNs3EC7hg66DR7xO6Yzl+yAD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5053

On 04/04/2023 3:53 pm, Jan Beulich wrote:
> As in a few cases before (in particular: AVX512_IFMA), since the insns
> here and in particular their memory access patterns follow the usual
> scheme, I didn't think it was necessary to add a contrived test
> specifically for them.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

