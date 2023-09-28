Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D37A7B1809
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 12:05:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609428.948525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnt9-0007o6-3Q; Thu, 28 Sep 2023 10:04:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609428.948525; Thu, 28 Sep 2023 10:04:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlnt8-0007la-WC; Thu, 28 Sep 2023 10:04:55 +0000
Received: by outflank-mailman (input) for mailman id 609428;
 Thu, 28 Sep 2023 10:04:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qJIK=FM=citrix.com=prvs=6283bbd10=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlnt7-0007iw-08
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 10:04:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 761408ee-5de6-11ee-878a-cb3800f73035;
 Thu, 28 Sep 2023 12:04:51 +0200 (CEST)
Received: from mail-sn1nam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Sep 2023 06:04:39 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5176.namprd03.prod.outlook.com (2603:10b6:610:97::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 10:04:34 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Thu, 28 Sep 2023
 10:04:32 +0000
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
X-Inumbo-ID: 761408ee-5de6-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695895491;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/kycG0XxaITPfv+yY8by2OTz3zrG7EZckwkORPOzhmM=;
  b=MJKegY8MKL39Ws4itdYK+gsjfGKrk7m31p/+UfO+JUVpeWAVvFtmu4Bc
   WSlWc72BVpXcVbmviMuL87FA/OPGwaMIRGozQvPDEDg3s7QuzDNHZjZs3
   xbZTxjF4pWqMiCpQEwr28dio4/Zxfv75UtIpmKfOmpJOwpLvl36Qfwl9L
   o=;
X-CSE-ConnectionGUID: D75XRfOuSvWm2oGddJiHyg==
X-CSE-MsgGUID: HJ1TuFGlTSiJJ0WgCa6k8Q==
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 126798090
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:hGQ8ua9zfWKLK1/Pd78QDrUDW3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DAbUWnTM6mJazP1fYglPYqxpk1Q6MDcmtdlSFY9+C08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks01BjOkGlA5AdmNKob5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkliq
 qEoEj4qcyuduOfsx523RsttptUseZyD0IM34hmMzBn/JNN+G9X4ZfyP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWMilAuuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37WRwnKrANNKfFG+3t5I2WGO6EMXNCYXd3njnvaSgxC9C+sKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHsqCRSH+b3qeZq3W1Iyd9BXQZeSYOQA8B4t/iiII+lBTCSpBkCqHdpsLxMSH9x
 XaNtidWr5Uei9QakZqy+1/viiip4JPOS2YICh7/W2uk6kZiYtejbonws1zDt64cc8CeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWfi+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:067Xa6+VhRNPiXChm+Ruk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdkTN9VLXJOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6Q60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdl11bSjXujxVfzq83wQzw3T+JHmIJiaxPcr24tpst13q
 5n13+Q88M/N2KKoA3No/zzEz16nEu9pnQv1cYVknxkSIMbLJtct5YW8k95GIoJWAj69IckOu
 9zC9y03ocfTXqqK1Ti+kV/yt2lWXo+Wj+AX0g5o8SQlwNbmXhopnFosPA3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMoXda3Inale2OMDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJjs3IocU6GM7zB4HRyyGGPfIyBZ0Wu9ikHjKIJ/4EUBYCbfhFrcWpe0/dJ+J4kc4nms/
 XaAuMiPxasFxqoJW9z5XyPZ3BjEwhhbCQrgKdLZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-Talos-CUID: 9a23:aNvIGmMIuBRVi+5DdHY6xHQaPd0ebELYlnD/L0OaCEZ4R+jA
X-Talos-MUID: 9a23:8BaMdAmbBvvCdU3x8bVidnpCFp5U/oqBDHw2kLck4/aLHiUuOGek2WE=
X-IronPort-AV: E=Sophos;i="6.03,183,1694750400"; 
   d="scan'208";a="126798090"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THOPFS/e5cQtxhDmvFB8Pf3i19JmqTBMjHb8qfoHR9yOEMqNrqcPOij7UA9g5i8pfv0gzSUs64vs3IIkiG0aCt2NujhFPx2l2+MauOnIu+rVOnoLVlNfSYzU9RczcFjM6hbuuwA0nY1qE7ZPUV2P/oc9rk/ZR5VxPnYPAKk/v+5RZy6Ief1zxSGxDcI28ho132vIdTmFHmqMTmWCkrt1M/LXl/74qTGLWYYmtQPytJR5zqqjUXi88i19P6XzyFNg7t7x3xgSJoownKr84BadUilFj3wxPcyp5PpJQbS9+Mbt5odq4xhBQ6U0uDjHUry9yVePd7pqbsjozvrwP6ec/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPJL4F6Muxwvcbd1+7+UbRxgAoi/5KhWAtvuw5wuwzw=;
 b=CbF3OhdSIOo9amTW78c62kn1/v7CimA9idvN2CG/jskfD3yhE+rQI8K7p3ytTZW1Cw3lz9i+xQBJfXNHIGH54rx+7fG/Pcdt1hzss55taVlceyBhu3+Z3gd1NFNkB+6KorxgRxV8YuQTNRrCRunrHWRSwerTWzL7k/WwdwW6KyOktzQQHmnMEIFBp7mpF393avsn1rsOkrOKfQluXV8CaLKptK/l7tHArzGOpLoctXOIw5uaukAVgYB03RD6Xp3tfwaf/q9cmeMQgOMiG5M2ISQxCHnNSaoYdWEKu8fZrmK43uN6Reg8GLcO0BJ4UvfSJZ+P8WnLppk5iGOdIlMMYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPJL4F6Muxwvcbd1+7+UbRxgAoi/5KhWAtvuw5wuwzw=;
 b=ELZDDv+ecOyNJBO6tQ60bpDjsd+eDoE99gm2zrmto0L1rMOldVrcahM2AzGARJYM3TGs6d7iOBz/uLx/QiUgGA5oVyLSIqK0bAZOrE4IWIdU9cK13jK4UPBWCisSMJkmhP4R9Fbp4oVl1TbLn7VFGYJsYd+YDmPWL1uInj4SCqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 28 Sep 2023 12:04:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH v4 6/9] domain: map/unmap GADDR based shared guest areas
Message-ID: <ZRVPqiRHXMJC3Bo9@MacBookPdeRoger>
References: <3ba59868-101d-b68a-d8b7-767ee94910ec@suse.com>
 <a34cef71-d60f-43ae-f61d-13d6c846eaa4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a34cef71-d60f-43ae-f61d-13d6c846eaa4@suse.com>
X-ClientProxiedBy: LO4P265CA0117.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::20) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: f123d2cd-4647-4cda-fe8a-08dbc00a4fab
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hPov307Tsj4rYTovYnjCTBX4OwWrS7WsmZd/fzE7LZUunG9i5i/W2iDFrbgXtEqhbREf/96/ICp6q4TJr6mtvq2zcYNdKd6zPpfSlnQZvMT6NTvVTjkvFv8/EUs/QmCahFDR6LBwvp/IZgUvYJvzNpIz5a71EE/U19WEoqz0xQn8NmsvmhJ45j0YikQeBCM0MlYAHPuk6kaRx4Dk7WU+crNFeocbDzWd8psgm03WcbySV1shxqoMcJIfVvjJ1EIlLtODwqYDIOa+5v7YuLAHxvIWbW74rbiLGGm3RC3uB47/VERKIadVNdy5KP6/2jyGAeeHFyPw8ACDnq+llLnAr5g0eU+4kIbifJqcdCkWvGc6GKl4ELlNApuegtwmm9fjazVWzGylqMBx02/rraiYek84/fNLTaDGZTMMCRKT4zIjLIZNYoVqinDBYpoYXHJ+Hh+4e54rFVfpGY2EuGCSAkpXTZQlKhUgAqYbuiCQQkQXXVe1tYDmThbMFoxixnyHNP+xs+PLiidx1qkqzApo6VqOfdPWsFEbiZrCb2tppQIYslHa+yCSaiGAV/EgAxtq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(346002)(136003)(39860400002)(376002)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(9686003)(6512007)(66946007)(316002)(6916009)(2906002)(66476007)(66556008)(54906003)(41300700001)(8936002)(8676002)(4326008)(478600001)(6666004)(5660300002)(38100700002)(6506007)(85182001)(82960400001)(86362001)(26005)(33716001)(6486002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c3ZSSVU1dUJLVkpzbjFnQmNzVXE3YW5HL1UwV2ZiWXRlK05nUHczZjF0dmZY?=
 =?utf-8?B?QjhCU0RKY3J6WGdDbEJwcGphWkQ2bjh3THBleHFQU3k1UDJ4UFBCdWMwM1VN?=
 =?utf-8?B?blJnaHN1cnFVNDVvZ0p1Y1ZzUXpMNTUwK2pwNytzR0dGSzBoYjZGLzZFMDRT?=
 =?utf-8?B?aHQyMEJmZDZYd0tSYUI4Y0lJSlNONnkxS0ZMYXdyeE1sTzdHSmZId3NYV3pl?=
 =?utf-8?B?MG1PR21ZVk5ETzhJR2VNckZLYy9yZzZzQWFIcDhLcFEyczBieWdTUEJ5NEVv?=
 =?utf-8?B?a2NlKzRDQmg3VlNQZzQ4ZkpweGZyNzZBWlNKSWZEWEl4VzFnWHdKdDN6dVo2?=
 =?utf-8?B?cTVDWnNmWEVMbWhZcWE0THl3VkZOSWZVOTlQTmpmNEpPcStzZVpVYURYSFhm?=
 =?utf-8?B?dDdNNEYxb3RZZzU1LzVIdGtiZW9ITHNhYk5pcnMyVnhRc2RJTlNwTE9xSUZS?=
 =?utf-8?B?S2kwZllMaXM4Um50ZTl5alJlM0RQVjRaVWFTZmZacThhZUQzNjdicEoyN0Nm?=
 =?utf-8?B?MjdNaVFteUp4MlhRWWdmNVhjb0hBM0FhVEN1UURFY1g1L2YzTDJIcmlWWVZ6?=
 =?utf-8?B?VzBQWG1qMWVYdjRoUnRaNWt0L3IwMEFRMWJTdldJdGc2bm1qWnY3WU45V1Bs?=
 =?utf-8?B?eU5weUMwcjg1M2RCR2JDMDR5TmtYRlhrc2czTGp0M3BGT2tGbkpGSVUxbDV0?=
 =?utf-8?B?SnY2OXY3cXJwQnl5QlRRTmJHTlA5OUdDeThEdkNsZkNrT3kvVDVmazg2b3d1?=
 =?utf-8?B?OEtHVyt1b1doY1FTblE5ZGtTZ3ZnUFRONHVTRmlrU0luSVoxRllYWGFXYjIx?=
 =?utf-8?B?RmdHd2hyaTluc0RrZUNHYWpTUWtyYkVxWU14YnE1b3FWYktQT1JEUEhOWERa?=
 =?utf-8?B?MEo1OEUzNE5OM0JkVW9EM2pOekVYemZtc3JmeFgvWDRvRFV2Tnd0WVcyZmk1?=
 =?utf-8?B?NVJRdmE4cSt0RzdjTDIxS1RSc3RxcFJCcURXa01aSWNzelJWaGpHdmRKcy9u?=
 =?utf-8?B?MDFWVTRtTUFRU3NiczNjcEdOcTgveC9iWlhjaUczQ2QrUDF0MlZrSHYwR2dw?=
 =?utf-8?B?ejEvK2tpTmVFaE9ZMkUzZFo2Wm9zZ1lYSE9CUGlqQUsyT3JjelFaVzJiUXU2?=
 =?utf-8?B?UE5jZTR5WVVsazBKVlRraFcyeHpWY25BdjBKUW1XOFlHeWZoS1JpTDEzdGlq?=
 =?utf-8?B?eCtEUlZBd0trQmxrRWtPWGRBc1dHdXV6di9uYVRSMTNiOVNobCtiM0dlNzVY?=
 =?utf-8?B?WU9wWVVvd0g3ZG1FMFFQRTExSU1PbjJIQ053WmNqd29KR2FOcE5kcE5MTDVW?=
 =?utf-8?B?V2ZXbHZOaEJsKzl5QXprOVc4RjgzTzhGZjdXaGQ1cXFydVBYWHRFZk1yb0p6?=
 =?utf-8?B?ZnZ5V0JmZVVxK1pJUWFqUCtyOGtYSng4bTVHTUZOemR3eDVsYXlFbXJiMW52?=
 =?utf-8?B?cHFHOC9ORzFZaFhwZDE3L2E2dUVuN05OOUhITW0vT3VSOFhtS2FrY0x5alp6?=
 =?utf-8?B?emsvcUxiV08zckpLY0VEbVRYbENLS2l3ZXRSNlBONnQ4c0lEbG5mQk12SCs0?=
 =?utf-8?B?MHllYkE5QTR6aFdsK2N5NENlSko3Q21iYVM4c2ZibnpaNldMN3AvQ3FNcm9J?=
 =?utf-8?B?QThhbHhvTEJpNWtVVzZrVjZ1dW1SU29vMFZ6RkdwQ3Rtc3RISGg5SzVuUGQz?=
 =?utf-8?B?RG1aVzB5VFIxNmc0cUdES2poWHFkTm8valJ2Q2hjdmRIcWJyL1dRYlNrK0Vm?=
 =?utf-8?B?NzZDTzd3UFBkanVVbURKRlltTGhXc1BEM1ZJOE9UblpoTXQyK1FHTjRRTm95?=
 =?utf-8?B?VWxiR05tWGhia0tHUXM5cDVTZzVsZUFwLzhtWVl1Z1BrZ2h5clJWcFpuZmdE?=
 =?utf-8?B?empwN2FtanFoQjRzREViSk1ZSVlOTVluMDBoaDhMVjNWWmpqWUI0b3RKQXFl?=
 =?utf-8?B?TWpHSGVzV0VoV0NzMjRxTkhxaGZndFprdFFvbkc4TFA2Rm5EelVOeklvWENZ?=
 =?utf-8?B?NUNIaXUyYkg5cUVId0l3TXRNZ1BkaUdPWk9qQkhsT2RYWG1KNVh1Y2wyMmtR?=
 =?utf-8?B?RUthaHNpekh4SVVxVm4zNXo2cEdBOVpmVUVhbGs0QU0ydU01UkxNYUVIbFAz?=
 =?utf-8?B?dkNkcDBoQ29hcU5obitjYXZmR2VUelRmaU9DaWxzU0NkSm00aGp2aXJFWEZL?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F8q8VLt0o2qSfRiuLKahNLTGY+O/uHkZTHmh6KU/Gy0fsf1newjQGgcoFLUyN0YMWruqb2ajNADl22Pg0l2TEyYqjz9Bwo3q8p7F9HqBDbfkpByfUl17JG3J4NKyb7P5bLHJEU1ENyoeiIPnx9ZlFq/EDFFwH5PPpncEEpMlIUiB16tAlvWCxb5YL12yAa15/FDq6/qOMRYF3IgQA+fBdGx/S3wL1CrprytqotM7+/KD8myK5Z0KUhljCnmUNmFFJxvq8N/NvfQnie2911lGtwSQsVOy4O3imoAoj3XMBXzzt1Qa16oucSUeh1MFtlSoRagGezNlJJcPYfLh+DG1HqAKArc4gh0q0roalWxD9UZYusqiEmQDWmvwWIbtyfuwQdPmlyhihHrVpGg4e03ekcunRVlOLFjiAGFs1kfFtXNfgdO0oSab3FfFac5VcYPmbjAyjhUsESyxDdDLkXYEICHADYCbztMImJzJLLv7sOsWKT+iTiDN37q2Ihq7kwvgTOg0Xd9GNkHVrS5ylgc7AoAdORGZGQtxpx3GG0zEelWfLSacMnfSehroc3mZ3nZ2b42DQD0jROF3ynMD0IKhfh5qaMmuYHHrjQEb3bD3gkUWtAjuoa8r/hhHs5teq9IWH2FvQF7bJSSEjy7LURi+D10b5+MJlm9X4aAZTZsuiEHo1TPzGMfXspZeGSnWMR+0VGnTkAUXbRitCBKtphoWkhbWhPUQPx1qHCjeyD40uz3KmANpKJtxMUvrfGTiqbp54VuLj2B+bJG9VsTIQJhkCPpbGfnA6fq1y3YxPe+ytUBNSYV8Ty7WJTiR/QFM1/dCdoNsreiLMKGhkntQjfHMwX5IjvclqXKhlZRBQwAaZJDy947ymigqMHGrKMKYDuAi
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f123d2cd-4647-4cda-fe8a-08dbc00a4fab
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 10:04:32.3571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGRT5NKI0HXzOXMvWrbcX/QTpmw8/4uVVNSrgNVRZUErXjs+ZIw1vwFzPiynmDMvZXu31B2q94qTELpZk6TkaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5176

On Thu, Sep 28, 2023 at 09:16:48AM +0200, Jan Beulich wrote:
> The registration by virtual/linear address has downsides: At least on
> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
> PV domains the areas are inaccessible (and hence cannot be updated by
> Xen) when in guest-user mode, and for HVM guests they may be
> inaccessible when Meltdown mitigations are in place. (There are yet
> more issues.)
> 
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, flesh out the map/unmap functions.
> 
> Noteworthy differences from map_vcpu_info():
> - areas can be registered more than once (and de-registered),
> - remote vCPU-s are paused rather than checked for being down (which in
>   principle can change right after the check),
> - the domain lock is taken for a much smaller region.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

