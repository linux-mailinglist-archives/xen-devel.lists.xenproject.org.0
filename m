Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5BD7D7E91
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 10:35:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623586.971563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvpn-0002Lo-Ha; Thu, 26 Oct 2023 08:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623586.971563; Thu, 26 Oct 2023 08:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvvpn-0002J1-Ds; Thu, 26 Oct 2023 08:35:19 +0000
Received: by outflank-mailman (input) for mailman id 623586;
 Thu, 26 Oct 2023 08:35:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iwvv=GI=citrix.com=prvs=656fec104=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvvpm-0002Ir-Al
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 08:35:18 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957b7d17-73da-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 10:35:15 +0200 (CEST)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2023 04:35:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB6861.namprd03.prod.outlook.com (2603:10b6:510:15e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Thu, 26 Oct
 2023 08:35:00 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Thu, 26 Oct 2023
 08:34:59 +0000
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
X-Inumbo-ID: 957b7d17-73da-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698309315;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=3phdeXiAJ6AAHPlM5qYPmNM9r6GQ2LDYGU9ek1Iy4jE=;
  b=GxGkAwivaZJbtmGrTfkj1R5b3Ylsb8XgfpudCNUsTpnqYF10aYtzz4qv
   PNhc4iAlfhFZcUX5HfLiGaZtuR0Z04Mlan8FIt5HbytXtc1D9TsbfwXww
   QOkQvVv6qSjuQmj/xm7iiCDs7aTeJ3XdqHso+57BWXN3mxaNUu9RBNYGP
   c=;
X-CSE-ConnectionGUID: vIMJivq3Qw+AW6JNEKRPbA==
X-CSE-MsgGUID: Xfko9Dm0SXC40Y/eM8lzxw==
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 129486066
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:XmuglKy231xJ465mdQl6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkUBx
 jRKXWvXPvyJZzGgf492aYXi/U8OuZKHztZkTlNlqyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjPzOHvykTrecZkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EgHUMja4mtC5QVmP64T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KX9v0
 N4ZNilWVw/Art3o4pSWadNUjO12eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVIguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WewXOlANxMfFG+3s5kg1rC6mlLMy09CQOK5vSc2kqsS80Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoISFUD6ty6+YUr1EuRH5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:sMYpKKo09lLs9zXF5PHy+eEaV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3AbJVVoGgXlUDILj3NdzjydZmo1zJubFz47nbOOhS?=
 =?us-ascii?q?BFiVAd+O3b3Kzwptuup87?=
X-Talos-MUID: 9a23:gV1p8gZAG783kOBThzHvg2BOMZ9T04/yUHFKnLBWv9uUKnkl
X-IronPort-AV: E=Sophos;i="6.03,253,1694750400"; 
   d="scan'208";a="129486066"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eaXY9ES/y00AkJ52vUBoe0U8ATn+H5PrK9ht3SaBSTT6ZLF8SL7JUHUe71ZfkMumIySMU+WKSSME51wG3ex3KPU0RdA61RARkvg+/1CPnYsvEULY5dOi3WLsC8r9aPHKIqcz1HUVoLz0Jels5BpD0Ch+X2KaMiTblIwMU4QsS21k6iPHtENofL2jSxywo9O877vlhEhZYaKK6Ne/tcWolfFBy02cjQKHdVVypo/VZq9zw+TDVl3rRqlFQI80y7Abj4GmAswKvLSeFAr9hj6++zwXr+qWaOf1LhERUbVRq8qisLpTFLpz9k7guwRh2asqJfPoTvFuWvdhU2g83eWJ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KEtr1uQSl4gc7Rcv3Qw2AlIEg5hI2vh1pQO39tsbxs=;
 b=GI7WM7xfNEIEMF+CcxKV3cSGmEPuAJW2bu2f1gb+3EDPyrSLPrVFSlNxyGNGrKzYVKMumHSdTDYxLwVnIAMLOSNvAnm4DLbkhsHga5PXehCXM03iIgwtIBpvxuVH9OslmrYNXteGbg6/q9JSQ4Jp//lsmW2BLpS5XIMhSzCpepFIHIEZPWjWa7ZtzPXzfay0UdBvCP6vqjH/l37I3fFrPAAA3xOCggEsETjAFp3iJk1nsiKG/rBwCL4BJbGq8P6o6Y3bqP1Vy3cP2jGWsYAIhgy4Z724gx2Kj6a6s4mpGSSL4NKST8tHvfaigdn58ddkdQQTYH8wHugA6hw/4npMdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KEtr1uQSl4gc7Rcv3Qw2AlIEg5hI2vh1pQO39tsbxs=;
 b=jy40cQTGN9BsfT7A4FjOHnABxQaLi0r32Zi26dUBZP+9QFFJfIwtykOS+KJ2FuC1j6A9Ejcz+2B7fc2lbNFujbkg4/ILNzL/8ceaDnWpg6QfElwPXWLcUEZWfqbxfBIUByCj0BG72mUhwfu9Ry2IX27SpFjBR2hna95gFHL0c1M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 26 Oct 2023 10:34:56 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Message-ID: <ZToksEP1Fg8MscdK@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com>
X-ClientProxiedBy: LO0P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB6861:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ad3e80-cc4c-4692-adb6-08dbd5fe70f0
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cxlbDmbYFL1l5KvEBEwsrmGw5ZjZu0MhebX5qTwBehoIU0b16u+7WKG8BBNFycZIYt3BCBFuBaRVj0374wkdhX2nqN5cTMbQ1AbUyTa++l7NtzqXRomeO8paQaRGTF5zcOYkl7D0YvZTDKinZt4rX5J6/eLfQwZJnzhBSpuYYHNfg3moAX6w8FinXP+G0A2vmg1Of+5yM+fLdPjDs/XcFJXofV3q8V4CjmSZAt+UZHoYsTyAORloh0TQO99+F3xyNjv9frR3iwlAzhpmBzV2tC8Tfr1IYKoKyG6lGbathYYehRR8jMufUeBQRp5oMDLFV8z8JA7XwrBegOdrFai98+WUvFElq8ybqFN8130vL+A77FE8HhEKORZVUP54DX85wp3N95fieJczsjTT2g3Qb8TNwECANr/AxZud9LAV/XCTRWhzf9tYVoBlTXRIgHrPsi1uePM7/oUAoYlzPIBtegxwH/cVLaIKgZVaVcCVediLaA5I5I4xxnjN2Yd7hesfW49SwnLFLbhoP/ohpJ2aegBN9NwyqgnHsiEEopzdjOoDTT1BGhpJ2B/NwUKlIKaB
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8936002)(8676002)(41300700001)(4326008)(2906002)(33716001)(5660300002)(9686003)(85182001)(82960400001)(6666004)(6512007)(6506007)(83380400001)(38100700002)(66946007)(86362001)(66556008)(26005)(6916009)(6486002)(478600001)(66476007)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ay9kdEdzZFh3a3JUb3ZzYW1xQzM0cjVRMXlZcHB2R2szNklGWThvT01EUE9n?=
 =?utf-8?B?dlc5d3JiVEV4Z3o5UU8wVTJZd0pIWjZMQkpuUDZ1dW1pNzVFSU56R2NnZUFS?=
 =?utf-8?B?QUJGWGNIUmMrOWcyS0dOMGpNRHdqWXN2MGFXUTE3SlM2a0xMK094cXpiMFBn?=
 =?utf-8?B?Yk1tOFMrSUVtcUhtWnB5T1Vhbjl3Q3lKS1dqbklIREdmN20zKzZ5Q0RVVUZh?=
 =?utf-8?B?QU4zQVAxbUhkblFrRXBoQ0ltNlVGbENLejRJZVdCWkFINjZJN3cwTzl2Y3hN?=
 =?utf-8?B?Nk1Ob04xWHROUDJjYXAzQXpBK0VCNi9MWmFvZDltUTJDdDhWQ3UzL0VIeTdt?=
 =?utf-8?B?bTFBOEZLVGdHTVJwR2ZXL2lCT1kxRUhlMEhKNEF3cWhIRHp1MVdTMXdpZUhB?=
 =?utf-8?B?cFhtd2dFZk5LeHlPZ1FPc0J2SGEvVlk5eXZFdUNLdFVUbkpLT3BUem01bGgr?=
 =?utf-8?B?YkhQNDkvZGd0SUVOWTJtMW1RcmQxMHdTSHdlK1dWQzZhaXp2QmUvNWtWa1Z1?=
 =?utf-8?B?SHRtczhoMDlKWFlCd09BeG9RWVVYV2w5Rm9nMWRlRlpJS2MwSGNoN2xDUmlr?=
 =?utf-8?B?eVY2NUgvS0RDb09uRm0zOGJ4eVlMWkJuajd0bGdvMjZuL1N2Sis4MHNZY20z?=
 =?utf-8?B?V3RReVIwZkFWU3hzcVd4ZHEyNXdCR2VkcE5NMUtjWXBVUGJYNVpIZWZMcmg0?=
 =?utf-8?B?SW1XM0diSnhRSHpXUEkyWE9kempEU2hSbFJwWTBxd2dFWmJiZFhUcDZMbGxX?=
 =?utf-8?B?OHJXbDhoY1M4anZBU0tRODJEbVBudjJ5TjJYZTh3U25veWd6UWFNWnZSQjlX?=
 =?utf-8?B?WVhjYzBHZzkrNDB5L3AxZ0FZeVFPeWdiaEN5MGViNlRsdlBSa1BxUTM0Smls?=
 =?utf-8?B?bUJUR1FiNE1XckpiWkpQOGFoSHhCdnMwd3UzanpJUlVBZGp5b29zajBDK0Mr?=
 =?utf-8?B?VEZ5a1JQRVRIZk5kWFJYTHQwcy9iUWV2eXZ1cWtLcWRQQVFoUjRQdERzOXFo?=
 =?utf-8?B?bi81MFVlNS9Vai9iY3I0Q3JGclRwWTBvZTVKOGhtcTNFYVgwVVQ1VVdPY041?=
 =?utf-8?B?TnZxTk5kdCtXWlE3TU1PRTdrOXRlL29BRHhRRFo4UjlyZzNMVHZmNS9KaHJq?=
 =?utf-8?B?U3lHTmhXRFZQb1Q1TWcydW50Sm85TXlCcEY3djd0MU05bitaVmZuYVZzSDBM?=
 =?utf-8?B?eE9nWmk2aHA2amZVSUNDWmFSc2V4WVphSUhGSFE2L3FHRFc0eThEY2NFM2dK?=
 =?utf-8?B?cWNvdDk0T2hmYmFEYUcweHdnUitIRnR6TklacHZrNWtDQVFjNFlOV2lIRFpi?=
 =?utf-8?B?NEFMZll0aVRzL2pFanQ0YXdCRnhPMy9LY2dnVUYydjZYanIwRk5RekZkWkVn?=
 =?utf-8?B?WTh0dTlBOU5KcG5GazRLdkRqd09RTWU4cDc1MjEwdUw3VC83ZHFqYnQrZHZB?=
 =?utf-8?B?WkFxTTZCa2V3Wmk0NXBERGx5SmhkL3l6SDZVZ3pqWSswRy9TczNuMnN4eklz?=
 =?utf-8?B?MTQxaWNJOHpZMlZQbEZZeU5MZTlPci9DUUl2TjBVQWoyOEhXbW80d0laTnU0?=
 =?utf-8?B?djBQMVVRZ0tRZEZxYi9Zazhud1hJcXI2RzUxVEdwZEpRRFpXVGJRSzJnNklL?=
 =?utf-8?B?dzQ4bmZJNFg5UXFRVVRaZWs0dmR6bHJjSGdkVGZkS0IyZHdHeWxHa0xNQVFK?=
 =?utf-8?B?dDBLTDQyVkpLL1AwRVQwT1JtblFHOTVHUzRVMW9pc3laSGVYUE9hWmczQy9Q?=
 =?utf-8?B?citmME8rVU9BeXd2NzNlbUNrZmp1cWRKNFBLQmt2czMvL21UR20vSDY0Qlcz?=
 =?utf-8?B?S3YwaVEwY2RBcUJJQ056R2FxQzdtSzd6dzVUeUhUakJDMzZVRU9Hdkd6d1hD?=
 =?utf-8?B?ekNmVVZzNGt0TFlQRTlPNU4reVdVK0JuNFowWEVmRzlaaS83ckJkK2Y2WmxV?=
 =?utf-8?B?cVFnVFNUdUp4Q1FUSnBWaW80S2o0bXkxbFEyaWlKdk5ONUtFcHNjRzQzVFFi?=
 =?utf-8?B?dlV3OFFkK3pFNCtEZG1zbFI1VXBuWnM4SFVjQ29MamdROEtHeE83em5oZks3?=
 =?utf-8?B?K0RSN0ovYTJmSldjeEQ1UHBQYmV5N214SGpxSldQQ0VLQ0IxZ2NkeVd0bWRS?=
 =?utf-8?Q?FdibISUbx9ychHop9f7V/JZTW?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ylQ0PWYLm4J4nI7pxaEgjt12yBn5+JwlxMQih/w/y+kZ04Em605YmabHbZDFcq+lEYQZ2wMShov+L0zwY7FZ5b6aFF5R30KJGuRMJUjfZbnieBjlmk85ilUcIV+pmMRpoqYpM0x09GPrqEx8xwsoq73pM05rmZVkl3GsMdmzwkFCRpd+s/jjf1dXz3hrCPB79HvewCK6G+T4qUfz5zIs1nswgRCX19CoF4h6VP4eER2XhMkrXt03cvmtASVoIkdDd/DOPpQaaKYSfYIzF/uIznAQFg0363CHN9nKx8CA6kfSHQ5OjzRZuj7dkg2l8U0b6CpYGpRfY43qeD7jxHYZzI+PXsyff0QDJvaBnnppYS59xFiSwT64iygyfVq4KL+HaOwHo8/gfnQ3WOHwAqKcdD7hteO8z6oM4ITFaldlvkDtImqOFpnOTAvtO4FZp6rmdapgZ/mVm4k4V54Hs/kkEdn4EhgR8oW3SkOqviLE6m9ixlfFed9rS3J1fgBoZm71Mcx3kGrJqzhDvPkhgJwl5F1U10k1AC6NIgmPZ7YvD/RBeFgj6oKyTFda1OQFYfCN/9kKlJyTzQZOMS9Ov74kEQvQISIgz1VP8bEOAQp7+QeIU58T9ZSOf+LlYm6Nbl6atUUQ9sZyHaZI6JMukreG3+hW/VJjjKEP/uon1pi0S45SJUG7ikXxIDxPevsPzYnNkRupTucRq4drjxpa+0XKZ4DabPVUIj8rDDWgcIQ2sLsBQ2YN45M7D9JLqcaRWp3+IsM/B62ypcjcKbci8NVxmhUpf9YHYmAMEpt2kjdlB6VKBUaRGP1ww9FiQKg8wYVEqwGW84fL8UVh2z5xCZTElg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ad3e80-cc4c-4692-adb6-08dbd5fe70f0
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 08:34:59.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUCIM4LT+o3HCniK0F1KnFwHjXiGq7hWcWfRs+nH2DTALpfRO8YlWxwOW63p1t5GKndfsQp8wgwPRrYWhE/UtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB6861

On Thu, May 11, 2023 at 02:06:46PM +0200, Jan Beulich wrote:
> ... in order to also deny Dom0 access through the alias ports. Without
> this it is only giving the impression of denying access to both PICs.
> Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
> operation later on.
> 
> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> from the probed alias port won't have side effects in case it does not
> alias the respective PIC's one.

I'm slightly concerned about this probing.

Also I'm unsure we can fully isolate the hardware domain like this.
Preventing access to the non-aliased ports is IMO helpful for domains
to realize the PIT is not available, but in any case such accesses
shouldn't happen in the first place, as dom0 must be modified to run
in such mode.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -479,7 +479,7 @@ static void __init process_dom0_ioports_
>  int __init dom0_setup_permissions(struct domain *d)
>  {
>      unsigned long mfn;
> -    unsigned int i;
> +    unsigned int i, offs;
>      int rc;
>  
>      if ( pv_shim )
> @@ -492,10 +492,17 @@ int __init dom0_setup_permissions(struct
>  
>      /* Modify I/O port access permissions. */
>  
> -    /* Master Interrupt Controller (PIC). */
> -    rc |= ioports_deny_access(d, 0x20, 0x21);
> -    /* Slave Interrupt Controller (PIC). */
> -    rc |= ioports_deny_access(d, 0xA0, 0xA1);
> +    for ( offs = 0, i = pic_alias_mask & -pic_alias_mask ?: 2;
> +          offs <= pic_alias_mask; offs += i )

I'm a bit lost with this, specifically:

i = pic_alias_mask & -pic_alias_mask ?: 2

Which is then used as the increment step in

offs += i

I could see the usage of pic_alias_mask & -pic_alias_mask in order to
find the first offset, but afterwards don't you need to increment at
single bit left shifts in order to test all possibly set bits in
pic_alias_mask?

> +    {
> +        if ( offs & ~pic_alias_mask )
> +            continue;
> +        /* Master Interrupt Controller (PIC). */
> +        rc |= ioports_deny_access(d, 0x20 + offs, 0x21 + offs);
> +        /* Slave Interrupt Controller (PIC). */
> +        rc |= ioports_deny_access(d, 0xA0 + offs, 0xA1 + offs);
> +    }
> +
>      /* Interval Timer (PIT). */
>      rc |= ioports_deny_access(d, 0x40, 0x43);
>      /* PIT Channel 2 / PC Speaker Control. */
> --- a/xen/arch/x86/i8259.c
> +++ b/xen/arch/x86/i8259.c
> @@ -19,6 +19,7 @@
>  #include <xen/delay.h>
>  #include <asm/apic.h>
>  #include <asm/asm_defns.h>
> +#include <asm/setup.h>
>  #include <io_ports.h>
>  #include <irq_vectors.h>
>  
> @@ -332,6 +333,55 @@ void __init make_8259A_irq(unsigned int
>      irq_to_desc(irq)->handler = &i8259A_irq_type;
>  }
>  
> +unsigned int __initdata pic_alias_mask;

Should this be __hwdom_initdata?  I see it gets used in an __init
function, so I guess this all permissions stuff is not really indented
for a late hardware domain to use?

> +
> +static void __init probe_pic_alias(void)
> +{
> +    unsigned int mask = 0x1e;
> +    uint8_t val = 0;
> +
> +    /*
> +     * The only properly r/w register is OCW1.  While keeping the master
> +     * fully masked (thus also masking anything coming through the slave),
> +     * write all possible 256 values to the slave's base port, and check
> +     * whether the same value can then be read back through any of the
> +     * possible alias ports.  Probing just the slave of course builds on the
> +     * assumption that aliasing is identical for master and slave.
> +     */
> +
> +    outb(0xff, 0x21); /* Fully mask master. */
> +
> +    do {
> +        unsigned int offs;
> +
> +        outb(val, 0xa1);
> +
> +        /* Try to make sure we're actually having a PIC here. */
> +        if ( inb(0xa1) != val )
> +        {
> +            mask = 0;
> +            break;
> +        }
> +
> +        for ( offs = mask & -mask; offs <= mask; offs <<= 1 )
> +        {
> +            if ( !(mask & offs) )
> +                continue;
> +            if ( inb(0xa1 + offs) != val )
> +                mask &= ~offs;
> +        }
> +    } while ( mask && (val += 0x0d) );  /* Arbitrary uneven number. */
> +
> +    outb(cached_A1, 0xa1); /* Restore slave IRQ mask. */
> +    outb(cached_21, 0x21); /* Restore master IRQ mask. */
> +
> +    if ( mask )
> +    {
> +        dprintk(XENLOG_INFO, "PIC aliasing mask: %02x\n", mask);
> +        pic_alias_mask = mask;
> +    }
> +}
> +
>  static struct irqaction __read_mostly cascade = { no_action, "cascade", NULL};
>  
>  void __init init_IRQ(void)
> @@ -342,6 +392,8 @@ void __init init_IRQ(void)
>  
>      init_8259A(0);
>  
> +    probe_pic_alias();

Could we use 8259A instead of pic in the function name and mask
variable?  Just so that it's consistent with how we refer to the PIC
in other parts of the code.

Thanks, Roger.

