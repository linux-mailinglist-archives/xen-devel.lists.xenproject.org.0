Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F67C79A85B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 15:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599414.934828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhF4-0000pY-FR; Mon, 11 Sep 2023 13:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599414.934828; Mon, 11 Sep 2023 13:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfhF4-0000nG-C2; Mon, 11 Sep 2023 13:46:18 +0000
Received: by outflank-mailman (input) for mailman id 599414;
 Mon, 11 Sep 2023 13:46:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwba=E3=citrix.com=prvs=6119d0f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qfhF2-0000iA-Ps
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 13:46:16 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91fe6183-50a9-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 15:46:14 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2023 09:46:04 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6220.namprd03.prod.outlook.com (2603:10b6:510:ef::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 13:46:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 13:46:02 +0000
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
X-Inumbo-ID: 91fe6183-50a9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694439973;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S13IeH8BIsnUWs9a4X0eFDzpFzcgBHceO243phvM2n4=;
  b=H9jLDwL8QVkr9ja3sZ3exm7PcZjsAoN9UNNLEHnxv+bUoYjPMOuTKGLW
   JDc3sY2kP5uP/OJ2hd1A8yXm601nzNdlCf/FFLd3BPF/bnDSq2IIz7HwC
   vxb1iTgQ+3N2GXBtb7d/PE33sgCPqOt8VYAbCiS7ddmGgsXIhZI3tiS40
   8=;
X-CSE-ConnectionGUID: 1mu2UHPsThGu8+pFA4Q0Qw==
X-CSE-MsgGUID: U66NL5z6TMqlm7Mvx5AkVQ==
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 121530442
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:bWs1BKwC94sGx2+HvUV6t+cexyrEfRIJ4+MujC+fZmUNrF6WrkUPn
 GQWWW2Cb/jYYTOkf9olPt+w8BwAvsTXndNrSwA9rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EkHUMja4mtC5QRvPKkT5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KThL6
 KYlCAgWUhCsmrL12JySFtA0v9t2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIguFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAttPT+XkqqQCbFu7+zJNLjlLRwWHhOC9jxGbRcICA
 k8qw397xUQ13AnxJjXnZDW6qWCF+BsRQdtWFMUx7AaQxuzf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ5iELJR9M6Saqt1ISrSHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:leidka1BQQ89zP1KqBzo5AqjBahyeYIsimQD101hICG9Kvbo8P
 xHnJwguiMc+wxhPk3I+OrwcZVoLkmslqKdjbN9AV7mZniDhILKFvAr0WKB+UyDJ8SWzIc0vs
 1dmupFebjN5DNB4/oSlTPZLz9W+ri6Gc6T6ds2hE0dND2CI5sQlzuQ0mugYzBLrNIqP+tHKH
 JHi/A32wZJdRksH76G7rppZZm0m/Tb0JbtaRELCxMj8U2ShT3tsdfBYmal9wZbVzlGzrsv/G
 3d1xHw6OH62svLuiP0xivW5ZxYlNftz8IGGcSDzpN9EESeti+4IIBqU7KPsD0xuaWz4Fhvyr
 D30mUdFtU273nYcW24rB71nxTp3nJygkWSvGOwkD/mq8T3SD42DtMEmIpWNkex0TtVgPhslK
 ZA122Uu5dTFFfclCry69WgbWAaqqObmwtUrQal5UYvKrcjVA==
X-Talos-CUID: 9a23:G5Kojm7TWZLTV5EzvdssrUsJQP0FSmbhzFjNcwygJ081ceWsVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AWllu6A6xeYfywQkYHDKiN7frxoxVvfqILB0fz6k?=
 =?us-ascii?q?jos2BagluK2q0jwqOF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,244,1688443200"; 
   d="scan'208";a="121530442"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GORQZO65CBf55NzcsXCvzDWaV8hrGneAsj2K1ko70gtZon9jqMPFCTCh5+fvbmWo/1fR70zsSQyJLsPV3WkC/t2GBfDv4WUBeVT/9kMpEtZmIxenqHfnTE3kUE0JKYOTASITYvtGCOsNRxH8GBJejOY6hsrSDYcvEm9g5MHU+JEgKr9opAGmy7IU/6e0Es1y+eSWnpAXQSHJRlyP1WEqGqu9xWOvdYVvtzDu5cS26j1d4YGWE7ex8diIn6GVFYezOGjIGycHEplst++XfcYJFpQDFxggetK1dPai506x9pfdc3bGX02rmhbYnbBanCE/BPOxsQZ1AaTzg0hShV6zYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xiBAzcrfVe1ri4hEx1DSaJa3YaxZX0Fs1TA0n3S4yAc=;
 b=XIpEYGYggnq3VWFCM+ups6+iBhHOv5Abi+lvQX2NGkNqtxlduJB1TzqFneOalCJHGPi1UogBxhJAtq6kBDyTlYz8nHkzWHtENVAexenF+kRhYA11qdSbegSpaCrHTIzZEvg/H4nndnDbbavlPtZ+cZIavUr9U3tNziiwzQxUYkMo9We2pVJ9DOJ4AEiijWrwj90YOCDKmK8MMuA+fEiqzzS7dZDXViqNifmkB0cWUARPhXJnEWC/yyklQyl/ayL6hFnYsCXBSdp8q4VBrp1YpWsBDNnHq/ByK/vU1l7/TJB7rnoQTvvilPH7+1E0ujVlGmnKUCdFvedJGVMoevkxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xiBAzcrfVe1ri4hEx1DSaJa3YaxZX0Fs1TA0n3S4yAc=;
 b=NIgDgG6cX+3AuZkUN4z6BD2DcU+lWOaHKY9DIVuk8c4ecBNt7IvciaOOQR8k7fx+1uBnAcLvZj8tb1BWl+DrNLtZOVdkCfOkOVLb9I4M4Qs76ZFG6cdjBkUBqNdI3NpFCxbY54tyAQyQi0nFE5wWVShN3/FpVl9Gv2CkPji5TLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <daf0ec20-71bf-26cf-5587-848d94bab972@citrix.com>
Date: Mon, 11 Sep 2023 14:45:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] tools/xentrace/xentrace_format: Add python 3
 compatibility
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230906131616.7681-1-javi.merino@cloud.com>
 <eccd7f3e-abf6-2e6d-063f-477ccbdc6b5d@citrix.com>
 <lt77rwliauydvvzzm2vgaox5nqdt5a2sectcjvcyvq7edpq3ul@im3spknk7qcg>
In-Reply-To: <lt77rwliauydvvzzm2vgaox5nqdt5a2sectcjvcyvq7edpq3ul@im3spknk7qcg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0276.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::24) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: bb07d7b0-71ce-46c7-c1bb-08dbb2cd6fd6
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gx/tZe1xhu8ImRv1m+/VGeAH1Ao353O3q2rfIoiR2e9mi+X9I3THp7k1aV/m/FRh5weM9H++MgcS23lljvwG1wvlWm1cVQtmKoOpoJF1x2g9QJJebld82XPG/n0cCqIueNTeoF8xFVE1CnRAEA/2tJyHH2O923xAikHFEbCeboPz7G2E7RpkRbI9cop4lTAlC3Ue/YokkmfyQMK3taHn9X31iVPdwYNtIBS3E9UCORzxHHzw+GD7yxJHDP+UxQ/e8r4TbyaWEv+4NrXycc9GF+FB2IS2Rc/zuYVI/qa4BfjcmRNK1B+uBzQovHDVDeMjjDPnegnH17pmnYoIDOIrapQsaxppoSR7KjZc1kUbBOd5VF0AxiWSmLk0tQQ/0GwmldUJnGVD+KZwOjPOFLXRPOej4x36mcwj9qPSoLtlSOpvmNquobWuOL9w8SA3aupVUgM1MYwasZahYurlyRF1sIXIUZ6uDBThoYMyp+ZGL0Q2eDWAKZFBaQcHkvn8AatqJempS+UYokoAbZP1oMtxTSThIyR2/75IVio1a9ub1kusfrd2gLg/YtI1zbCHgJNwR61PjWEVTeiFB640qgIVSytIsal65BtSsXGcBDkLSkUXiTOqF3YYwhiL0M/wgMvYsE9sHF+0JLPs8l0lGzwc/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(1800799009)(451199024)(186009)(2616005)(107886003)(82960400001)(36756003)(6512007)(38100700002)(66476007)(5660300002)(2906002)(66946007)(66556008)(86362001)(54906003)(31696002)(478600001)(4326008)(8676002)(8936002)(53546011)(6506007)(6486002)(6916009)(41300700001)(6666004)(316002)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFM2cmpVTk5lME9lQklBSUhoTFZZc3ZObjFoWEUzaXBCSVYrcmlYdWhVRDFw?=
 =?utf-8?B?YUpKaWJ6NHFHY1UwKzFqU2dhWG81NDU5ZzUyc2puMmt2Wlk5S1l0c3RjM2pO?=
 =?utf-8?B?OElFc3J5dDdnVlZKNVpGZmZ2MTdkTjVDNEY4cmxEdzV4UUY5cC9IVWRJeGox?=
 =?utf-8?B?R3FPQkk2dDcwWHdNaWkzV2R5QmxUcjRxSjEvWnlja2Yydi9seHY4Z0x1ZDhD?=
 =?utf-8?B?NUZrNHoycG0zc2U1WHJ3Y2FFaExjUWg0dGMrT3lsWlRzRlRXZWRSUEN6M09M?=
 =?utf-8?B?RDBHbkNaZSt4aEpSQWU0dzhHS3FyM3BYamhkS2lhaXEzd1NyM3Fja2g0WVBC?=
 =?utf-8?B?SmNBODJCc3liSnFzQ0hVaUhsbjFxUFlyZllWYk1tOU8xcmV1TVFXNmd4V0c0?=
 =?utf-8?B?cFJveS94WStxMHVpQlprSGdmaTRvV3JvMzhIeTFITmxMd0JIOWRYc21YNldH?=
 =?utf-8?B?KzUvMHd3VE93WUpmV0FYbC9Idk16OGFpd3pIMTZwazBrNzlhVmk2RGF0Z3g3?=
 =?utf-8?B?ekVIazRKVDBkd21BQ2lJZE1iQVkzV3NHS2x2ZjY2MmtqM2NTd2xXZ1BnOTNU?=
 =?utf-8?B?RnhTVThkQmQ3KzRSZ2NlWDBUMnM1ZEF0U1QveXVtelRrQjJkSkc2R25VUDkz?=
 =?utf-8?B?R25EemNWamNyc2dDd3JQUzVheC9rR0p3U29SaXJSVGNXYmRQdlg4dW9ZWGhn?=
 =?utf-8?B?OG9EZngrUW9kUFlsMlFmUkJDcHMvWUV0UTBDTDhmbGFLTG5GWnNqVUcxaGlG?=
 =?utf-8?B?VXlOZUxreEpXeWJIRGpWVE9VZWd5TERqMXFoaXpRd1pnWmtneE5PdmsrbHRx?=
 =?utf-8?B?M2xld3dYVTdiSk5qbGVZZ2YyWjhJQ2prQzMxUW5rOUQzaWQ4b1AwbVNpd0dm?=
 =?utf-8?B?M3RnR0N1S3Y3cythT2dTeWdCQXFyRU0rK2J5bWIyWHJOREJxcUpRcW9RUnQv?=
 =?utf-8?B?YUZRa0FwMFZNSjdHcVY1RlBvSjhSeTFJRmVuakVaaDE1K2F1amppU1dLTmxT?=
 =?utf-8?B?MThpTzdqdEVNTk5tOG5lVC9jTWt3dDlnVzlKV09EWmQ1ZlJ1R3Vramd5eVdy?=
 =?utf-8?B?aUtkcDZlV3YrYWNlUm5zazFlYzZ0N1d2TlE1M0J0bzUvVGVxNnEyOFNlL1lW?=
 =?utf-8?B?TmpKZXl1R2tRZ3FCeWx6aEpoSEluUGJqbXFNRzJsSkVqZ3d5N21RTllvYUht?=
 =?utf-8?B?U1pZVkN2cVlydzFpQWhjWGdjdU1FR0c1VDRudzFscVBKSEZYaEJmck1Za3Nz?=
 =?utf-8?B?c1F0QWM3NG1vVURqblFqTWRKcUpSYmRmLzhKdU9iMllEZjFUSGpJb0V0UHpG?=
 =?utf-8?B?L0lrRXdGWWJnUHZGZ25EL1c5SEdMWUJHTVhOWkdLMGl3bVRic21lRGdVTnp4?=
 =?utf-8?B?aVVBNGtDQStDL0ZtV0kxTXdvM1YyOFdOWThxYXhJeTAyNldLOEJFTjR2U3BU?=
 =?utf-8?B?R28wbzUwQkh4NTBpRGRubEtLSHpLU29xMll1QkdJeTB2T0Z1cnhCQjlGZWVr?=
 =?utf-8?B?ekRkRzE2eUpjTGk4Y3NaTlhNUVZSdEJ5Y21ZN3dVSVVwRHB5ekdPdG1Pd3RC?=
 =?utf-8?B?QXBscC9kaW50S1ZFTEt1eE83aVIrczc3RGxtSUJTSDhXZFNXWENUb3dYc3Rv?=
 =?utf-8?B?c1NuWFNhOE0yWEhwVFY4SEVTQnJNYjloaVhUTE16UkJZQjZhVVIwdjVDYVVV?=
 =?utf-8?B?MDJKeGg2SzBHT0QrU0xSS0NmanJBNEI3RWVvVEFNb2pFbzVFMFV0ek9LVEIx?=
 =?utf-8?B?ZURqSytSQkxsRkMwL0orSHhPY0hHWWRBWnNmVWk0YWxhVG1LN3FOT0pic0ZL?=
 =?utf-8?B?a3FUajA1SnRZZThxZFoybDkwa2RiQU55VDkwWUg2azRYd1A2WXNBUHNFZ2tV?=
 =?utf-8?B?OXZCL1ovbHFxNkY2VytFY0RJYWRwWEQ0dTZCTWJEMVNpWDdhbmFzbXREZUN6?=
 =?utf-8?B?am4rZ2EveXljbythdzFzSGZWR0g5WmxreUE4NTluQWUvOFlYVlEzR2k0NjJH?=
 =?utf-8?B?cHJrL2xvZmZUS1Y5RkdmWkYwOU5HYjBOaUd3ZEFBWEt5RklYenhoaHJFNk1x?=
 =?utf-8?B?STBDcHlSKy9HSll6anRZdXlsakhyVzhiZzlLOXhOK0dkMXl6bTJDeWpmYjdE?=
 =?utf-8?B?Q05teEZYQ01JbG5YL1Arb3JNUjdrSk0yd2JrKzlNcGpBbUoxNVlNT0tQR2xt?=
 =?utf-8?B?dUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mJt6gFdlcX9soWobcWMFpHCMd7ID3fw3I8TawReSyUdO7htN5wLxTADwAicL1e6XfFvF/qEpNfNI106fF5CTQNShEbt3eLekeMMdoji37Ljpl24pPehvQWfA63aacVF5Z1q4p4Gq6GqP9qB6VxCHsuwx35AbQS9imRzHWXX+y9gAgHJQ/ehdhRzUqRGXxEOEMSVUXc2oIVzi7gyHpqyVtnETGUQ46qHGI5ego9MnknJ++YvyHRDwIaYSS/OPoFxg62w8uzWo8SfDEzxzUAvqdRG8hs9K1y8HvkAHDmv306/MwuEAjwJWBFAwvNfr5vW2LwRk6fSSgiqC0imGfu8lp2tN8Tq/14TQkW5BZ4l4DDkUjk7IaaBGgJ1lvU7iCRjeyT9a0t/5VI8/mtvgXksc1tU2duCaO+JyikAWafKvCSLKdAREFafSG96tLzvRprTE2Q7B3xXKFCe06uOTPQMX8/D9wNfJQIfi+VASDNNFeFS/meWZLjWBvqwQmiNHFZhfFemKvi/QxpOlhb2zSbgxy1MHgyy9AO0xnH2h9o2ramaM2R3026B/NkqqQdPgZkDIqeR3LCg7GgfDvOlsZN8ahKhR3GjFC1KfI1xchDFFRE8ybo0/ilIX9u7WM+fDZftitMkJvGIyrPnYDrbdfGijY0opJHS1GKOCQ91uzdGLMRsEKzj07hfif1CYgeJWGhol6z5Ft1Xm468usqvnLMKUic5b+vxpi1DZY7xv1KeUZ4jzehPhfJcsULxUXslCwC2ATg44ZIzB0E0rlhAOwBh5TuF1MheJkgZ4Zo5dn8XDybSjzu+VeywZljqWYBlq5u2kVdotW4P9Duuj3Bmjn5p4yA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb07d7b0-71ce-46c7-c1bb-08dbb2cd6fd6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 13:46:02.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9x25PiGMMPw2uczNAOxz+3mOpKdkZL6a0U7jUwO/Qr+nTwiW3J7WZ0b7uTqmov5kt+OYMXfY4YQcnwIS5PL24YVAFHvMjjOBQSlCCElbYr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6220

On 11/09/2023 2:44 pm, Javi Merino wrote:
> On Mon, Sep 11, 2023 at 11:52:43AM +0100, Andrew Cooper wrote:
>> On 06/09/2023 2:14 pm, Javi Merino wrote:
>>> diff --git a/tools/xentrace/xentrace_format b/tools/xentrace/xentrace_format
>>> index 5ff85ae2e8..166ebae325 100644
>>> --- a/tools/xentrace/xentrace_format
>>> +++ b/tools/xentrace/xentrace_format
>>> @@ -4,11 +4,15 @@
>>>  
>>>  # Program for reformatting trace buffer output according to user-supplied rules
>>>  
>>> +from __future__ import division
>>> +from __future__ import print_function
>>> +from __future__ import unicode_literals
>>> +from builtins import str
>>> +from past.utils import old_div
>> This adds a new dependency on a package we (upstream Xen) don't
>> currently use.  AFAICT, it's only for...
>>
>>> @@ -223,7 +232,7 @@ while not interrupted:
>>>              last_tsc[cpu] = tsc
>>>  
>>>          if mhz:
>>> -            tsc = tsc / (mhz*1000000.0)
>>> +            tsc = old_div(tsc, (mhz*1000000.0))
>> ... this, which is always int / float and doesn't fall into Py2's
>> int/int behaviour in the first place.
>>
>> I'm pretty sure the code can just stay as it is, without needing to use
>> old_div().
> Ok, I will the dependency on python3 future and the old_div() for v2.

My point is that I don't think we need this dependency at all, and I
don't think you need to change this line at all.

~Andrew

