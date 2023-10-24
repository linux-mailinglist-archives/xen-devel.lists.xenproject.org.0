Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30A7D4D6E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 12:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621800.968602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEQU-00085g-3w; Tue, 24 Oct 2023 10:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621800.968602; Tue, 24 Oct 2023 10:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvEQU-00082g-0c; Tue, 24 Oct 2023 10:14:18 +0000
Received: by outflank-mailman (input) for mailman id 621800;
 Tue, 24 Oct 2023 10:14:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtWs=GG=citrix.com=prvs=654e64a5b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvEQS-00082a-E4
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 10:14:16 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13d634d1-7256-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 12:14:13 +0200 (CEST)
Received: from mail-bn1nam02lp2040.outbound.protection.outlook.com (HELO
 NAM02-BN1-obe.outbound.protection.outlook.com) ([104.47.51.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2023 06:14:10 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6341.namprd03.prod.outlook.com (2603:10b6:a03:38c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 10:14:04 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 10:14:04 +0000
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
X-Inumbo-ID: 13d634d1-7256-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698142453;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=1P4YEdcjuvpk6xC4NTMlXx8sMifyHknO/8IXYwqeVVQ=;
  b=L59ML0TLZvzEirCg3bMWLLNTos2o3p3ogA9Mm0ZyB4p90q2Rh2YrZ57L
   UFqNi0lx1PVm68bRTA8GnF5yf+pYS7+9Rba6EjjBEzsSb/UScBvJe6nyy
   JS2GGJreu4LpiZaXQiarncj4ZFcCFwKzD5FvwFfF/AI8KdzMq2ncFXStD
   E=;
X-CSE-ConnectionGUID: HOPolqqxSe+seLYXO6844g==
X-CSE-MsgGUID: 3kz92tzKQZq8YZ/obKD7lw==
X-IronPort-RemoteIP: 104.47.51.40
X-IronPort-MID: 126911180
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:b2/Oq6OEaiN45W/vrR2ClsFynXyQoLVcMsEvi/4bfWQNrUp01jQPx
 2JMWG/TPPbcY2Wjfo13YImyoEsBusPSnN41SAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/nrRC9H5qyo42pA5ABmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sZQOWZK7
 OUIEz1OdR2nttKRnuLnFuY506zPLOGzVG8ekldJ6GmDSNwAGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PNxvzC7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqCz937aWzXuTtIQ6T76qp6R2kn6q9HVDOS9RUlGYjaa9lRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4DOkS+AyLjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thu3MCkRaGUEPCkNSFNf58G5+N1ryBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:JLNmu6gapOQxlxiaCtWH7/9D4nBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: 9a23:zOo7/m1fUPiwXqRZjaclWbxfOucddXnE1WfrLgyjBEJYeJrLGQPM9/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AeyP92Q9KS25huehwzEFDKiaQf5xr8fX0FFIuqKc?=
 =?us-ascii?q?f6/i2cit6GBvCiCviFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,247,1694750400"; 
   d="scan'208";a="126911180"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYMkjT4lT6oZFQakKXtaPgEqy3PQeSbgI/jg9zKFHKGMoHP7FkvvIOUSWixImX0QlxGFcyxbRYie5lP5SgFaeNApYx54NPXVRw9PixBfpKQ+4931JswWNXqGTrn5IRD4kCqhi9ARWf8rUxzuf+TIqodR/tWrg1QQrJfuqRr6TigI7L88xQFSxVyoV1lZ35noVXbEB9iGwNbn5H+kDZ5WFXW0wwC0R6gxIVQdOSdwoSzNsMlxgqpEQ0h6+1u6rsmlHt1mYe+x3v4gIgT/8PSaxovsnP3/V0/3efMPwUmE/ZLWlz8iSDcWhr8xg3qVhOI1iFhdEgHFCbifjXPSoDA9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4pDAbM2NuNwAOp5cZ4BqnSbLnPSw7QgU4Gks1MLb/o=;
 b=igsk1tySomFBjtD2KSUg6GnGA+vPZQF1lTgtOOXoS6vJP4hricbQNQfdTJ0CG4w1jbNeC9skOJlpumPqnu4aLzXO6nxMIXOeqQN+4t3fNE1AHRxlTuCVtV1hckPaZcXtb2b0k4g1o0+gqwZh/5dB8+dZpCEdDD8uz2XkgchihY/qZJmyzzI/9SEK1+/CeoXlf8AXaumBxCHPzG9j5dJabrsoq3vCiWDxmA/v8u4KFwFj/yDUy9bZtXSFbe6slYLLU95b1muBh9MwQ4rVBHXNez8+Z7YGKyWGJ08svBO1KVAqGRhBt2TtNRjQDe6xDx9VeGfTUElJiwZI2xc+Ft227w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4pDAbM2NuNwAOp5cZ4BqnSbLnPSw7QgU4Gks1MLb/o=;
 b=d2jyy5wxMdlcrIjRqCagvGHUbnISdZq5jx9iF4orG8ZYFTUPdu2X4M9UQnEEllYrYRfSPnkBE/Ta2S5Ej7KPkRDJa4QFGPH+AOBqRvgDTImy1DO3jrPDWyDHqZTlwyqUBKmzGxlNQ1orgzYpzR4k4rTE7qad2K+SUYnhQcy4v70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Oct 2023 12:14:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/i8259: do not assume interrupts always target CPU0
Message-ID: <ZTeY6JNbNfTVCpib@macbook>
References: <20231023124635.44266-1-roger.pau@citrix.com>
 <a525cc49-69e7-c509-61d4-a2456b3fdbcc@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a525cc49-69e7-c509-61d4-a2456b3fdbcc@suse.com>
X-ClientProxiedBy: LO4P302CA0037.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 63d23f7b-8545-4367-74c0-08dbd479f324
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K7svcU7BaMG2AH4ijA/nkVnvbH/Q/QAfEPr6uXka8hCE165Hm/tnX4QTbrkwHeaFpUzQXyhpKsu4DFQjOhtxJ5HpfAQw3jdQZvxa/BXj0TvwzIfNCPj4JTiFzX4IOk3hXF80/sgCcVDUlQQQAkv0ZoFJAlJNyv0cEtO4p68rjo2qiaRgKOXMSRPqWewaQHiClHP+j8Akxjkb85yFeHTTiN3Rhy+f19wXDPWpHNA5I30AK2rhl5BkrYcC+PNezd3XSyx9XLtoJ3H28TyS6ssBoxv9Kisns9abifmhU8YfSL3Z5esXTQgOp9hEjanSW4F+J6H4iJo4MgDcmFyVINz27RR5qTO/FQKk4hProJeJyaVNAtEwcytxNZqBJhbkAyVtw9B7QoAi4i5qeoBBWrHIPzOL+q/mx+vXqwZlRaasJ2LA7Njt4vHhc5ctH2/hMuhtkF65m8f7ibS7I3az34FRXTiK/UAtBWf78XCS+6cgiPZegEdGbNuUVNkLME1kva000AaY54y5UzT0OzqH+fKzWC1/p3C5ekK3VcuifB7EDg8ekzHVV/APQt0QqgDkzO8x
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(8936002)(4326008)(8676002)(41300700001)(2906002)(5660300002)(33716001)(53546011)(85182001)(6666004)(6512007)(82960400001)(6506007)(9686003)(83380400001)(38100700002)(86362001)(66946007)(26005)(66556008)(6486002)(66476007)(6916009)(478600001)(54906003)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTFPOW8wWFlHRGsveE1iTE1KNnZmT2RBYUNMYWcySkxhUE9CVEVNWUVzb2ZH?=
 =?utf-8?B?bG1XdmE3eGd4d3AzOHJLNUVCK1RGbnpDYnNTU2dTdHRubFNrZFd1SWJQSzNo?=
 =?utf-8?B?TEp4SzFZVE5uYXdLMlRkaHB5Q0krNUFCUmRXUHFNdm9UQWIwZGZhR0xpRElE?=
 =?utf-8?B?MXg2bFZpKzNZOXh2UGtZR2lIMjQxVm5hZEZFQUdrSVNleGFEUXZrbk11TklU?=
 =?utf-8?B?VWdJUnlCbjRUTzBtRTBGS3JmVWd3ai9yeFpQRG90NWVJcGRnQzhWck9MTE9q?=
 =?utf-8?B?dlA5ajFTS0FCSy9OMlQ4clBNYTYvTVI1eWNrczZ5OWNlTzl1WDIxNkdZWUR1?=
 =?utf-8?B?ZitVQjZBL3ZxVWduaTVhYWlaQ0graC9DYnRhRHRjUVNKUGR0SXdUNGtjMkpQ?=
 =?utf-8?B?R0VybEdIWHpPZWtZUUMvVDlUOGZlakY4dHRvbUVxZFVmSmpaMFNaU3FhaTJ1?=
 =?utf-8?B?b3hVcDNhN0FlTEVqV3U1L2kwWG5ObXJxeG5SZlFEWEo1M2J1Z1doejdPSjFO?=
 =?utf-8?B?QWVQeVJwUi8wTTgxRmhudzZGUkRDaXErK3YvYjJlK3RMcEthTmFjOS96Snoy?=
 =?utf-8?B?cTNQVTRmUk42WkMxOXEwYTF1NVZQUStFRStwN3ZjS0U0c3psTjkvSjhTTTM2?=
 =?utf-8?B?QlVRZTlDVXZQU0lMcnhuRnNUUThXOUxvMlltWUo2K0gzK1VtSjJhcEFsWVJ4?=
 =?utf-8?B?a2VWL2JQTWczZ0x1d2dpOEhMTXVqTTFkNTlBUU9DWGxnMEI1TkpiK2QrU3Ny?=
 =?utf-8?B?V1FRZ0NseE9KT1JhOU1ZQjlBcngwRytzQ1ZrUDFXd2luaTA4U1RKTFZIYTU4?=
 =?utf-8?B?dHRIcVhHMFdMK0pMM016NHQ2VTFkRHJ4NWpxOXU4N1dHd2tOQStnMHJLNUFU?=
 =?utf-8?B?TGw4MjBhaitJUDgxOEhuRjg1NkRGbXJYNnM3U1lQTHVEQXVSWitTcW5vVWdn?=
 =?utf-8?B?YzlSdkkrY1FaWlhrT0I2M0ppWHRFOThlMmQyREFzNjlWU3VCMlRrelU0Ny9x?=
 =?utf-8?B?TjZUb00xVW1hRG13NlNUdUk3dHY5S1F6cmNOMXBFT085N25nZE5jazFTdXpv?=
 =?utf-8?B?azF5a204dDRiLzJETG9ERG1IYXhKd1VkZ1k2RXVCR1dGWkg2MytUVCtGaHNP?=
 =?utf-8?B?cktHOCtFcDF6dXMxNHJCMU9oTjBjS3NJRGdrYUwwMEVJOHh5MklrYzQ5Rjho?=
 =?utf-8?B?QVhqbmhHcHBIR09VOG1ycVQvaXgrRlYxbU5FS2w2T0FkdkZVK0g4S1BKNHhw?=
 =?utf-8?B?NHkzQmRKM1R3QTFNYkRPKy9kaktkTEs5UnlhQ0ZLdmkrdmFtaXV3bUNuL1hv?=
 =?utf-8?B?QzJUZVg5L1c4RWN5U3pqdVJKRFRqS1ptNGxzeHFhS1VMbXJqZExrUWlTZkRL?=
 =?utf-8?B?NkVOQkZXSGpUcmRSTzRWSzF5TWdtYUFTc2QzaWtyQm54T1FhemtuMG5ORWRr?=
 =?utf-8?B?eVJrQ0MzMEMxeGpDYXEzV2NncUJrb3MxS0wwK2RtcWZldXJYQ2V0Q1FBb3Fa?=
 =?utf-8?B?MUZzVUdrUG5VREdvOVBVZWJmVERZeGdaSW9HWDI0bGorNWw5Mm5QUW44bkh5?=
 =?utf-8?B?U0NKRVlsS2tKRU8yck9SdHRQaC85SnNiRk5hMzl3eFZ6NDdsK2NjTmMrTGdF?=
 =?utf-8?B?bURkQWFVaVFpVTZMdEpaa0tRRFU1SGJLUmtBdjFYSFpJaXQzYUpXQlJRTTFj?=
 =?utf-8?B?Vi84eHZFaTkxN25Ed0JzRlh2WVd2QmtQRjhKRFI2Q1FYdDhPUG9qR25LZWVI?=
 =?utf-8?B?WmNtVkpha0FzWlpIVWU3RWRzYkJxakZuYTVtdUluRTFFdmVDOVZubUVWUjQ2?=
 =?utf-8?B?Zkt6RVgyMkg2OHZabGpxUHE2R29HUFd3Q215aWs1dXZ1TWJvaGJUWFVHd3ht?=
 =?utf-8?B?MUgwNi8rYkEwb2cxeFFHT0JWb2dWT0d5WUNaS1JER3ZpNWszUW4xd1VtdUsy?=
 =?utf-8?B?M29PYkZmakFUSEt6aHVNUW14eUhGeEVub0NwVXJDMFg2RWFJQjllTHJ0N2JN?=
 =?utf-8?B?VXlNOTJOY2VEUHl1YithZ1YzNll2Z0JLY3ZJdW00SFBiS0c4REpCdDJRaUV4?=
 =?utf-8?B?ZU1GUXdVQWp1OGVRQ21FUmR1Yk1hVk05VHYwZEd6czlVazh1T2c5RWFwWWdF?=
 =?utf-8?Q?1W3vkx6wqcxJWDLvSQcNWUOp0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zxAReSDiyukwelk43iLI2pbG5Jw9/SX9o1Rv98twY6a/6NtrSeQOaD4jo2J9VrUZp6NNnyr4xCnAdbIi429HAAoM00+h4N3VqRtgXEP4zHO4Vcw9khKyBwwsydvIrq3LXUzjh8H5EEFGAAP+nkPFzi6r08NvzqjGMAZM68kuyq5eQdQfanblMOtvK24r/3gzLWyn+VmidReL/eA5kHmXAx//DW1EMwZ1ggjiH+3gyQUP7vlKOGq0QPTQBL7TDQn/uotWXOAE6cfr9NsEqfXa6WA7D3gtRYq0c2uDJwez1X7FMtvOULFUM5ChVOnctlxdGQv10HAEY5Q4VgNcDC2iqEzQZdlBJItL/7I/U6hxQrRQruzesI904FR1TMaLXslKFFpZyusR4vT3Ao7lVEFQpLy4XCqeYlqI02Vw2p6sR0AG6b40B4MeRqWoqLcIGdEMUv0U9gZo+tuRNx13fB5/Ei7p9++Sa/6SEbhhPwJlLMk1h68rdqbkkF+8JdNjIfrRlEw5hgCfNGxoQAD4b/TKjDCNMEL3cGFLB/G2nv1MNZQynDiLGw35lmgaWapRTGditAgfBEnB8Q4n/GW2IatSWF3/oTyY/zTrnhGS3onV2MltDQb8oL7DZtcSm+mij09FlOGUm0Nl9tQ7tVcIX24ckl+6KXMqy+lnFRaF8OMf20ozzbLUm5+tt369D6MMj1xFBjXBizw+Aq4odLIQKRlDUtkMOAsGsCqYsTSR46ohUvYOp8H4WOrCH+LisB8hcqBUAl8hPQJXE5nuEvC9VkVDMYfM7gqLYb1szP1E5Ftc8A6S/5uTgXOyp+oFNOwrPPFqXN8ot6NMwdKIf9Rtj3NnSw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63d23f7b-8545-4367-74c0-08dbd479f324
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 10:14:04.2510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hDoaBoDf9sc9XzUoPDukokd5oSUr6KrbjWB9024FWMd9traZoPOhlUv7dUiD+aGnBXuMtSIbkH6iu1E018Paw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6341

On Tue, Oct 24, 2023 at 11:33:21AM +0200, Jan Beulich wrote:
> On 23.10.2023 14:46, Roger Pau Monne wrote:
> > Sporadically we have seen the following during AP bringup on AMD platforms
> > only:
> > 
> > microcode: CPU59 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > microcode: CPU60 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> > CPU60: No irq handler for vector 27 (IRQ -2147483648)
> > microcode: CPU61 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > 
> > This is similar to the issue raised on Linux commit 36e9e1eab777e, where they
> > observed i8259 (active) vectors getting delivered to CPUs different than 0.
> > 
> > On AMD or Hygon platforms adjust the target CPU mask of i8259 interrupt
> > descriptors to contain all possible CPUs, so that APs will reserve the vector
> > at startup if any legacy IRQ is still delivered through the i8259.  Note that
> > if the IO-APIC takes over those interrupt descriptors the CPU mask will be
> > reset.
> > 
> > Spurious i8259 interrupt vectors however (IRQ7 and IRQ15) can be injected even
> > when all i8259 pins are masked, and hence would need to be handled on all CPUs.
> > 
> > Do not reserve the PIC spurious vectors on all CPUs, but do check for such
> > spurious interrupts on all CPUs if the vendor is AMD or Hygon.
> 
> The first half of this sentence reads as if it was describing a change,
> but aiui there's no change to existing behavior in this regard anymore.
> Maybe use something like "continue to reserve PIC vectors on CPU0 only"?
> 
> >  Note that once
> > the vectors get used by devices detecting PIC spurious interrupts will no
> > longer be possible, however the device should be able to cope with spurious
> > interrupt.  Such PIC spurious interrupts occurring when the vector is in use by
> > a local APIC routed source will lead to an extra EOI, which might
> > unintentionally clear a different vector from ISR.  Note this is already the
> > current behavior, so assume it's infrequent enough to not cause real issues.
> > 
> > Finally, adjust the printed message to display the CPU where the spurious
> > interrupt has been received, so it looks like:
> > 
> > microcode: CPU1 updated from revision 0x830107a to 0x830107a, date = 2023-05-17
> > cpu1: spurious 8259A interrupt: IRQ7
> > microcode: CPU2 updated from revision 0x830104d to 0x830107a, date = 2023-05-17
> > 
> > Fixes: 3fba06ba9f8b ('x86/IRQ: re-use legacy vector ranges on APs')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >  - Do not reserved spurious PIC vectors on APs, but still check for spurious
> >    PIC interrupts.
> >  - Reword commit message.
> > ---
> > Not sure if the Fixes tag is the most appropriate here, since AFAICT this is a
> > hardware glitch, but it makes it easier to see to which versions the fix should
> > be backported, because Xen previous behavior was to reserve all legacy vectors
> > on all CPUs.
> 
> I'm inclined to suggest to (informally) invent an Amends: tag.
> 
> > --- a/xen/arch/x86/i8259.c
> > +++ b/xen/arch/x86/i8259.c
> > @@ -37,6 +37,15 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq);
> >  
> >  bool bogus_8259A_irq(unsigned int irq)
> >  {
> > +    if ( smp_processor_id() &&
> > +         !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> > +        /*
> > +         * For AMD/Hygon do spurious PIC interrupt detection on all CPUs, as it
> > +         * has been observed that during unknown circumstances spurious PIC
> > +         * interrupts have been delivered to CPUs different than the BSP.
> > +         */
> > +        return false;
> > +
> >      return !_mask_and_ack_8259A_irq(irq);
> >  }
> 
> I don't think this function should be changed; imo the adjustment belongs
> at the call site.

It makes the call site much more complex to follow, in fact I was
considering pulling the PIC vector range checks into
bogus_8259A_irq().  Would that convince you into placing the check here
rather than in the caller context?

> > @@ -349,7 +359,22 @@ void __init init_IRQ(void)
> >              continue;
> >          desc->handler = &i8259A_irq_type;
> >          per_cpu(vector_irq, cpu)[LEGACY_VECTOR(irq)] = irq;
> > -        cpumask_copy(desc->arch.cpu_mask, cpumask_of(cpu));
> > +
> > +        /*
> > +         * The interrupt affinity logic never targets interrupts to offline
> > +         * CPUs, hence it's safe to use cpumask_all here.
> > +         *
> > +         * Legacy PIC interrupts are only targeted to CPU0, but depending on
> > +         * the platform they can be distributed to any online CPU in hardware.
> > +         * Note this behavior has only been observed on AMD hardware. In order
> > +         * to cope install all active legacy vectors on all CPUs.
> > +         *
> > +         * IO-APIC will change the destination mask if/when taking ownership of
> > +         * the interrupt.
> > +         */
> > +        cpumask_copy(desc->arch.cpu_mask, boot_cpu_data.x86_vendor &
> > +                                          (X86_VENDOR_AMD | X86_VENDOR_HYGON) ?
> > +                                          &cpumask_all : cpumask_of(cpu));
> 
> Nit: Imo this would better be wrapped as
> 
>         cpumask_copy(desc->arch.cpu_mask,
>                      boot_cpu_data.x86_vendor &
>                      (X86_VENDOR_AMD | X86_VENDOR_HYGON) ?
>                      &cpumask_all : cpumask_of(cpu));
> 
> or (considering how we often prefer to wrap conditional operators)
> 
>         cpumask_copy(desc->arch.cpu_mask,
>                      boot_cpu_data.x86_vendor &
>                      (X86_VENDOR_AMD | X86_VENDOR_HYGON)
>                      ? &cpumask_all : cpumask_of(cpu));
> 
> or
> 
>         cpumask_copy(desc->arch.cpu_mask,
>                      boot_cpu_data.x86_vendor &
>                      (X86_VENDOR_AMD | X86_VENDOR_HYGON) ? &cpumask_all
>                                                          : cpumask_of(cpu));
> 
> , possibly with the argument spanning three lines additionally
> parenthesized as a whole.
> 
> (Of course an amd_like() construct like we have in the emulator would
> further help readability here, but the way that works it cannot be
> easily generalized for use outside of the emulator.)

I think the last one could be my preferred indentation, will adjust to
that.

Thanks, Roger.

