Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C32737A7A7F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Sep 2023 13:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.605622.943209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qivUW-0006qi-8h; Wed, 20 Sep 2023 11:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 605622.943209; Wed, 20 Sep 2023 11:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qivUW-0006oo-4j; Wed, 20 Sep 2023 11:35:36 +0000
Received: by outflank-mailman (input) for mailman id 605622;
 Wed, 20 Sep 2023 11:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1ZV=FE=citrix.com=prvs=6207273cf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qivUT-0006oh-Np
 for xen-devel@lists.xenproject.org; Wed, 20 Sep 2023 11:35:34 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc6ea2b2-57a9-11ee-8789-cb3800f73035;
 Wed, 20 Sep 2023 13:35:31 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Sep 2023 07:35:27 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by BL1PR03MB6168.namprd03.prod.outlook.com (2603:10b6:208:319::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 11:35:13 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 11:35:12 +0000
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
X-Inumbo-ID: cc6ea2b2-57a9-11ee-8789-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695209731;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Dh0BfuhdfdtiPi74v6j7+V024uUypGoCqx8chXi80as=;
  b=IKxJHJCG1cqj+cxuqtDI66lijq8+iyTrH1sZUslVylfDr561i1kTn/8g
   K9B5tEh2Wyc8WNQeE8EGBDyxsAF+WEmKm9aOy8kha/UDf0P8BKV0fSx4L
   iUGNRZjATjsxBxHaK3UcZfxWGfpQBImy2SZITcO2c6WwE+ADpOkradNbk
   U=;
X-CSE-ConnectionGUID: BBDMwFY6QHO/bRgPQFuUjA==
X-CSE-MsgGUID: pYpRekUvTAyUIzjSH7zFwA==
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 123220503
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:P8U6t6Lhk+d8UG0BFE+RCZQlxSXFcZb7ZxGr2PjKsXjdYENS3jBWy
 WMdC2GAPfeMMGf2Kd13O4jj80MCsMLRnd9gGVFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7wZmPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5dK01r6
 tIpdgktSVeJve2O+Zymd+tF05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSMpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj33LWXwHugMG4UPKWJ7sRng2CN+kUCNTwEV2Cb/uuXlWfrDrqzL
 GRRoELCt5MaykuvSdXsWgyil1SNtBUcRtl4HvUz7UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq17auZsjqoJW4VLGsOaCUeRA0Jy9DmrMc4iRenZvFnHa2uh9v5AwbZx
 TyQsTM+jLUei80M/6ij9FWBiDWpzqUlVSYw7wTTG2e6tAVwYdf/Y5TysQSEq/FdMIyeU1+N+
 mAenNST5/wPCpfLkzGRROIKH/ei4PPt3CDgvGOD1qIJr1yFk0NPt6gKiN2iDC+F6vo5RAI=
IronPort-HdrOrdr: A9a23:6fauvqHW4bjMTwQVpLqEEseALOsnbusQ8zAXPiBKJCC9vPb5qy
 nOpoV+6faQslwssR4b9uxoVJPvfZq+z+8R3WByB8bAYOCOggLBQL2KhbGI/9SKIVydygcy78
 Zdm6gVMqyMMbB55/yKnDVRxbwbsaa6GKPDv5ah8590JzsaDJ2Jd21Ce32m+ksdfnghObMJUK
 Cyy+BgvDSadXEefq2AdwM4t7iqnayzqHr+CyR2fyIa1A==
X-Talos-CUID: =?us-ascii?q?9a23=3AX09jOGvKY/fBDm7+6iNFU27E6IsPWFH401nhfXa?=
 =?us-ascii?q?YLiFjcrKtcHGNxaFNxp8=3D?=
X-Talos-MUID: 9a23:lMIVBAQwjOoNaVVRRXT0tSlYOcRV/ZiHGX0sg5c9m5aWGzNZbmI=
X-IronPort-AV: E=Sophos;i="6.02,161,1688443200"; 
   d="scan'208";a="123220503"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=STH4Ypr+mbKUuu2f4nz99mxPcyFVl1QK0SKaA4jzC4BSg/zp+O4jF2nCHcr65TrOvrx6AVMucer8Vvy8GWUyRvj8mWLNONeDmoxhPBReboo2XO+H1jM8AFBEiaxRylESuI5Dt2Fnp3gG2YEOb6SoazS4nL2cFOm/mW/Hs1e4hVq5QN1WfljpIqtpOAa2vMSXEJIWqEb2FZpsH/7zAIFahRtW7WQH9sjQ05fS3NFWLurL+pxygdla7P7ZtcYqxFyGy/MffPArPIsLwN6CsqemPmducdsiPnLA48DGT0tFqRwfMuqWsjCKBWmKAqw3TyEbB9Uup4gAUTFzvAHf9jpmtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4MRD6gNFNJh61LVyeuvy3dTlHcFfDyJli0rfl97l1M=;
 b=Ong3YpJHv7+s9NkNPoB0683G+9zzN4PoZOTHyepiAlXOtYdc0TjYRjBvAlhq5BUwjyZHpu0U8ciAFYB+eJSkB+BSTSXb0o5/r/Yi32t0BZ8YB+c0HnkoOOyRZwCw720/pdZLMECynPl2NkJ8gLHUJwCPdAodlpUW5yCxeuPwwZavNvwB2NapuLQ/24+cNRx4IVc/I6oqPdX24wGvxWaY9N6UOXR05ereiEJMQzmhzUpLWZtokhilAtj1vh6+SSR7iIVVbXYvCsoH21CBQKEDcvU8b6G5f9Y34zhHMTx95A+SmMuKUpagf5UCWjP+8gYdttGg5q8UdpEsGGwjkoNuWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4MRD6gNFNJh61LVyeuvy3dTlHcFfDyJli0rfl97l1M=;
 b=W47cZ8AP5gbLzKddIH8G+vkJd1qI5vV8dLRD2YoPCq0GG17TqWaWMdTJzCFuTL0srNReBZ8wI91TQUBPKVYAu/+vGByoIqrmKIOn/z2BMbYVtj8QGZLCb1MTEzdCCvF/RkvSVuZ4yeoPVmHWqoaXPSuGlemDmT7qkcJuDDfPEyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 20 Sep 2023 13:35:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v9 08/16] vpci/header: handle p2m range sets per BAR
Message-ID: <ZQrY6q4WXkAq1cAm@MacBookPdeRoger>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
 <20230829231912.4091958-9-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230829231912.4091958-9-volodymyr_babchuk@epam.com>
X-ClientProxiedBy: LO4P123CA0293.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|BL1PR03MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 205e13c8-f74d-4d89-542d-08dbb9cda6f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b1fQ7uHLekBmQX5faYugPPSFVucFOYQdOo0RjEniuUmVS4nd+E/galtvwFo4eLAw7a74brpxLjnvD4di4kMKzGTzrHTpzrVJNzGDBv31KzHotjMreVzOnF3QVh2OVnSocp1wedFGMwt6MLL+0/Wl3kW53kwjfjnREFSwRvJLBcrM0QJ8eBpHbZjifd2ngTPGUZoq/SONm8lNqp1xuU49xdkxeWAtVeAEQ6h2i7a7PbuG7hIylvDw6bxMnL2qiddoNa8UWZEDM1hLVYUuzF8pfUe1VDsEWNDOHNcOTgfApsBFDCeqRMXOjMApftnf1PRGs0DaAWtCqZ3cOCeA4zCEzPDKgx2CCdqgE4VsdnIagVblaDHgIQksFKKLoMOp3+wq6wCmMih4+BYDPt/X4ojKuLgNinKRa7+OwnFa7RX4EA/zVPqwfO6FQR/9F0rckVwmUpi2dFIy7BNvcQJH11kT7+lQk2AhHyoS4nCB8b2Rf6UtXJ5OaepHJ2M74uZMWbrgVGyOpJo7ColzKR2qQ5xQtiNu+AjBjbnqbPQMX3cPlTayU4a99O+uRdxcCKkNk/Ns
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(39860400002)(136003)(376002)(396003)(186009)(451199024)(1800799009)(41300700001)(8676002)(4326008)(8936002)(6916009)(82960400001)(38100700002)(316002)(66476007)(54906003)(66556008)(66946007)(9686003)(6512007)(83380400001)(478600001)(5660300002)(26005)(6486002)(6506007)(6666004)(30864003)(2906002)(33716001)(66899024)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmNVZlFmUTNpaWE0eGNURUMwRklHdnpCWFB3R1lvRmVzelpkb0dSOFZLUnRZ?=
 =?utf-8?B?aHhqSzEwV1Zudk5SclZ5SGJzU1ZvWVJrK2lhOXQwUitMQ2xxN3c0YThBbVFZ?=
 =?utf-8?B?QUtYUWFnVVQxSklqUXl5cjRLN1pQSjJBcnpwelk2MXVtYVlWWG9NUzhiYXhU?=
 =?utf-8?B?Rzd5dUUwb01maW9ISDRVZ2I4ZElqbXVLcEh2UlVzU0lQUkc5UzVST3Fkemcw?=
 =?utf-8?B?RkJnaUU5VnY5ZFl0dVhlQlJjQ1NMbjdvUmprZG5WaW9acVR5ZTRQVm1MZmVs?=
 =?utf-8?B?YU1BL21oL1g2R3RYTUZpeWg1Y2NwVGhwcDN6U2dsL0xoaTJjbXNvU0hVd3BX?=
 =?utf-8?B?RlI2UHpCT2NXOVFjejJCVytMVXJJRnBmWW5hRHF5M0RCRVZ0KzlobzcyZ0o4?=
 =?utf-8?B?YW1jNS9YS05SWmRBTU5NOExhcksxUkQ5cUk0YVlvVU0wMXRkVDJRbnBvYURq?=
 =?utf-8?B?UlM5aXUyZkZiY3lNMmlJejk4Y0tselBsZkFoTGRkdlpDQVJaSUNjQSs4cHVi?=
 =?utf-8?B?MXBvTnplS3p4S0NPZ21UY1V5TXpKT25ldlFJUVcwSVRhdWJndFgvV1kzWEhM?=
 =?utf-8?B?SWRaUitvWWw1bVMvbjJSV1pyeEJacTlUcW0zOU5wUVZNMDZadFhWN2ZqWGFV?=
 =?utf-8?B?V0JDYnhnNWN5TEhzL2hIeTE3VWtUZ0ZrVnlpYitKY1Rjb25sdDRIcFZJOTRu?=
 =?utf-8?B?MXVVaElQRklpcFd2cDQ5WHdaeUVNOG9xVFJHK3pzeGJMcXgzcmJEK05FZk02?=
 =?utf-8?B?VEg5VWk3a0lnR0tWeGFUdDZTNFIzUkM5OGZUcDdRTEFlSURETjFrbnp5ZWEr?=
 =?utf-8?B?NkxoS2tCMWRFeVBkVzd1M3VZMjBlTUVSdFBtL0phRGhZQ1p6UDA2RkpKNG5Z?=
 =?utf-8?B?TGJLSkNzQVBDcmF4Z2FQdDcxSHhnRGRsZ1hCaFhwK21LcjhZU203T2NzS2xB?=
 =?utf-8?B?QVJ5ZE5sVnlQUDNCcVU0ZG5hbng3dThWZjNnazlYT29yR05IQVdRUTNLdGJV?=
 =?utf-8?B?R1J2c0hYMjkzZGVVQUkvQ2ZSQTJDUGpsWmdsSFN1ZWRKVVVpV2R4TjRFYU1n?=
 =?utf-8?B?TUdvSnF6Y0p0MERHdmN6bWpwZE1lNlRpTWNHRlFYa2drbUtPV29JdzNlaTBj?=
 =?utf-8?B?VWIxZ0FvQXN3SjJjR2J2Um1PdzI2c0Z6ZjFBYVNvSE9OR3QxRDM0Rm8yaVhE?=
 =?utf-8?B?cXdBQkNTbkhieERYc0NSOWRQaUtXTFZLWGlpSmZ1dW8xbmNPUXlzWksva0RL?=
 =?utf-8?B?cGhpeHM4L0R6V3RkRThySmx0eGFVNlhSUEE0U01wTlBlaExOMURXNEd5TE5p?=
 =?utf-8?B?bC9HQkxaR2tKTDRGbndldllRTGFKWWN5bmdPMzVCWDAyNWFFbDVnUms3QUM5?=
 =?utf-8?B?SHlZdlBjN2YwUTFjVkVvL0xaK3o0SndNQXlTNlMxTFpEUDlWcGF5czlCb0hK?=
 =?utf-8?B?WjFyYWlSK1hhR0RKS3dGZG1wU0NpMGNxdDBLRUxhd0Y2elg3RWxsTTBRU1hi?=
 =?utf-8?B?bFdiV05sRlpKUTJRSkx6WlNzL3NValh4aExoYk52eUtNdUZ0SVFvcHhBQjAw?=
 =?utf-8?B?aXFsTm15UVlxdFB6VXpOS2xOaGxvOWh3a0FWYkJoNXBwZ3ZqZmUvTjB4Wlpy?=
 =?utf-8?B?NkhvSWNtemFlS2V1KzFnYzlCOTRUWjE2VExka2tONlNmUkFiNm9PZ0VmNi92?=
 =?utf-8?B?ZmdlaC9KYnJBdnJ6L0FWL3h5ekJlbjVadDJJZmhwdjhxdTRJVDFnSFlYNEZn?=
 =?utf-8?B?bmZtckZCeWRYakdiNE9TQThQUmVxaTkvN3UyUERTYTdlSmxFL2E4S2xXNDI4?=
 =?utf-8?B?Uy9mcVg4WXBLSmpwbEJ2RVhpTytkKzhadHVnZDV4eUxYZFI0L1NVV3JuckZQ?=
 =?utf-8?B?bWZvaDhQODZaekh5SXI3MUhkRTB0NnpvNjlhU3V5bmdYOUVXU2dIRitjbzN1?=
 =?utf-8?B?ZmhidEZqT2JIdVJxblR0dER1MzdadHdmUDNrK1hreCs2WFArYXVsSElwYlAx?=
 =?utf-8?B?SlkyOGw0eEVvdkdyNXpkd2hTbjZlSUwwcHplZW0yV0g2aUsyT1VwVDBLMXg5?=
 =?utf-8?B?R3ZYTmdmTlZBQnpFRkZmamh5Q09scFB6dHlYa0Q1T2RFckhPUkN0NHI3aHR3?=
 =?utf-8?B?bVZRZ09nK0w1K3VVSnNrUUtnRkhUVVZJSzVleXUzNDRnY3ptYVB6czErMzRt?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mQeZldiapKZQQ0bx1Qw3m4t9dot6ZK94oZQKbQpMrfMTptcPMfEJUCa0IKipF1lld9uPedqSwIuaNMtUKI4r3N8kOncBYF/nf3s+ZkWA64l+JVSr42WSpArBJuS/HpokHGBEqjdUWqBPVBIthzM3VroPEpowtpEyaHSGZnEKNqqqljxKZE333Cy9g9aqpTt2PT5buhwHrj4poT4BWshpcTnRLJno2NSnQOW07UVWJSgo9wlSMqczSMI/mms87vPFWVJGiMJSJOBEtaukZVlqWzW1KRyxaztolWEQLATe3Sh6WWqN9lBBzqfgoGkJTbelU8uM+9EUYzpJQKuNrD6z1GKQYzX0cVufU79Woi5GB89SSaAIeAwKIjftO7rlJjhq6PhtYbyyKC9wL7752lsSv4JTsyaR8eNMrbEAmo35MwRdo8VYHud2a941OFp5LMCzFd6iC3OzFne7Yev+st1VoKGPU4cooPch1Tv14SRkiGx1WoUNMYpQ3VJBMeoHValplhel8n+AUxp72hgia6X9f0ZJD+4475tGWzjvGfV7m1Bie+JVso/QAn4/zDI//RAl/1xlAfYDmOd7SE7KBYA+0lVDZB8Gi5pL0dWFmvM5vuftGYV/qO4qt++STkSxEOO5DCEokjpfHSrHeoMmzwL5/wdY92OV2BbabqCJCA0g3iOZty0hv6w0euC06wQ8To/5qp1Y2Qbqvhcr2SmzPCTMR4U5AVZzvjKSy3UVDfqwJT9129kJnoAFnm418pJ2p4h1vgkrhjg4l2IAAs+1hzwShKB3fs1nSpWLnLkQbRBW/MekcLw8rD1jQ0fOZI0NYicE4xNp337PxaIjDDH5Y2NSNQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 205e13c8-f74d-4d89-542d-08dbb9cda6f9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 11:35:12.5812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hEL3Wff4salxDx1DUNQC7RMNize9cXUL83kdYZyDspEtOPDZ6uZvmzmtzwIaiI0ufEM1kLwjYuJZ+INmhRyQgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6168

On Tue, Aug 29, 2023 at 11:19:44PM +0000, Volodymyr Babchuk wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> Instead of handling a single range set, that contains all the memory
> regions of all the BARs and ROM, have them per BAR.
> As the range sets are now created when a PCI device is added and destroyed
> when it is removed so make them named and accounted.
> 
> Note that rangesets were chosen here despite there being only up to
> 3 separate ranges in each set (typically just 1). But rangeset per BAR
> was chosen for the ease of implementation and existing code re-usability.
> 
> This is in preparation of making non-identity mappings in p2m for the MMIOs.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> ---
> Since v9:
> - removed d->vpci.map_pending in favor of checking v->vpci.pdev !=
> NULL
> - printk -> gprintk
> - renamed bar variable to fix shadowing
> - fixed bug with iterating on remote device's BARs
> - relaxed lock in vpci_process_pending
> - removed stale comment
> Since v6:
> - update according to the new locking scheme
> - remove odd fail label in modify_bars
> Since v5:
> - fix comments
> - move rangeset allocation to init_bars and only allocate
>   for MAPPABLE BARs
> - check for overlap with the already setup BAR ranges
> Since v4:
> - use named range sets for BARs (Jan)
> - changes required by the new locking scheme
> - updated commit message (Jan)
> Since v3:
> - re-work vpci_cancel_pending accordingly to the per-BAR handling
> - s/num_mem_ranges/map_pending and s/uint8_t/bool
> - ASSERT(bar->mem) in modify_bars
> - create and destroy the rangesets on add/remove
> ---
>  xen/drivers/vpci/header.c | 252 ++++++++++++++++++++++++++------------
>  xen/drivers/vpci/vpci.c   |   6 +
>  xen/include/xen/vpci.h    |   2 +-
>  3 files changed, 180 insertions(+), 80 deletions(-)
> 
> diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
> index e96d7b2b37..3cc6a96849 100644
> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -161,63 +161,101 @@ static void modify_decoding(const struct pci_dev *pdev, uint16_t cmd,
>  
>  bool vpci_process_pending(struct vcpu *v)
>  {
> -    if ( v->vpci.mem )
> +    struct pci_dev *pdev = v->vpci.pdev;
> +    struct map_data data = {
> +        .d = v->domain,
> +        .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> +    };
> +    struct vpci_header *header = NULL;
> +    unsigned int i;
> +
> +    if ( !pdev )
> +        return false;
> +
> +    read_lock(&v->domain->pci_lock);
> +    header = &pdev->vpci->header;

You should likely check that pdev->vpci != NULL before accessing it,
and that the device is still assigned to the domain, v->domain ==
pdev->domain.

> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        struct map_data data = {
> -            .d = v->domain,
> -            .map = v->vpci.cmd & PCI_COMMAND_MEMORY,
> -        };
> -        int rc = rangeset_consume_ranges(v->vpci.mem, map_range, &data);
> +        struct vpci_bar *bar = &header->bars[i];
> +        int rc;
> +
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
> +
> +        rc = rangeset_consume_ranges(bar->mem, map_range, &data);
>  
>          if ( rc == -ERESTART )
> +        {
> +            read_unlock(&v->domain->pci_lock);
>              return true;
> +        }
>  
> -        write_lock(&v->domain->pci_lock);
> -        spin_lock(&v->vpci.pdev->vpci->lock);
> -        /* Disable memory decoding unconditionally on failure. */
> -        modify_decoding(v->vpci.pdev,
> -                        rc ? v->vpci.cmd & ~PCI_COMMAND_MEMORY : v->vpci.cmd,
> -                        !rc && v->vpci.rom_only);
> -        spin_unlock(&v->vpci.pdev->vpci->lock);
> -
> -        rangeset_destroy(v->vpci.mem);
> -        v->vpci.mem = NULL;
>          if ( rc )
> -            /*
> -             * FIXME: in case of failure remove the device from the domain.
> -             * Note that there might still be leftover mappings. While this is
> -             * safe for Dom0, for DomUs the domain will likely need to be
> -             * killed in order to avoid leaking stale p2m mappings on
> -             * failure.
> -             */
> -            vpci_deassign_device(v->vpci.pdev);
> -        write_unlock(&v->domain->pci_lock);
> +        {
> +            spin_lock(&pdev->vpci->lock);
> +            /* Disable memory decoding unconditionally on failure. */
> +            modify_decoding(pdev, v->vpci.cmd & ~PCI_COMMAND_MEMORY,
> +                            false);
> +            spin_unlock(&pdev->vpci->lock);
> +
> +            v->vpci.pdev = NULL;
> +
> +            read_unlock(&v->domain->pci_lock);
> +
> +            if ( is_hardware_domain(v->domain) )
> +            {
> +                write_lock(&v->domain->pci_lock);

This unlock/lock dance is racy, and I'm not sure there's much point in
removing the vPCI handlers for the device, it's not likely to be
helpful to dom0.  It might be better to just unconditionally disable
memory decoding and empty all the rangesets.  Not sure whether there's
more cached state that would need dealing with in pdev->vpci.

Maybe as a bodge you could leave the current vpci_deassign_device()
call and check that pdev->domain == v->domain after having taken the
pci_lock.

> +                vpci_deassign_device(v->vpci.pdev);
> +                write_unlock(&v->domain->pci_lock);
> +            }
> +            else
> +            {
> +                domain_crash(v->domain);
> +            }
> +            return false;
> +        }
>      }
> +    read_unlock(&v->domain->pci_lock);
> +
> +    v->vpci.pdev = NULL;
> +
> +    spin_lock(&pdev->vpci->lock);
> +    modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
> +    spin_unlock(&pdev->vpci->lock);

Why do you drop the pci_lock before calling modify_decoding()?  It
needs to stay locked until operations on pdev have finished, iow:
after modify_decoding(), or else accessing the contents of pdev->vpci
is not safe, and the device could be deassigned in the meantime.

>  
>      return false;
>  }
>  
>  static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
> -                            struct rangeset *mem, uint16_t cmd)
> +                            uint16_t cmd)
>  {
>      struct map_data data = { .d = d, .map = true };
> -    int rc;
> +    struct vpci_header *header = &pdev->vpci->header;
> +    int rc = 0;
> +    unsigned int i;
>  
>      ASSERT(rw_is_locked(&d->pci_lock));
>  
> -    while ( (rc = rangeset_consume_ranges(mem, map_range, &data)) == -ERESTART )
> +    for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        /*
> -         * It's safe to drop and reacquire the lock in this context
> -         * without risking pdev disappearing because devices cannot be
> -         * removed until the initial domain has been started.
> -         */
> -        read_unlock(&d->pci_lock);
> -        process_pending_softirqs();
> -        read_lock(&d->pci_lock);
> -    }
> +        struct vpci_bar *bar = &header->bars[i];
>  
> -    rangeset_destroy(mem);
> +        if ( rangeset_is_empty(bar->mem) )
> +            continue;
> +
> +        while ( (rc = rangeset_consume_ranges(bar->mem, map_range,
> +                                              &data)) == -ERESTART )
> +        {
> +            /*
> +             * It's safe to drop and reacquire the lock in this context
> +             * without risking pdev disappearing because devices cannot be
> +             * removed until the initial domain has been started.
> +             */
> +            write_unlock(&d->pci_lock);
> +            process_pending_softirqs();
> +            write_lock(&d->pci_lock);
> +        }
> +    }
>      if ( !rc )
>          modify_decoding(pdev, cmd, false);
>  
> @@ -225,10 +263,12 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,
>  }
>  
>  static void defer_map(struct domain *d, struct pci_dev *pdev,
> -                      struct rangeset *mem, uint16_t cmd, bool rom_only)
> +                      uint16_t cmd, bool rom_only)
>  {
>      struct vcpu *curr = current;
>  
> +    ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
> +
>      /*
>       * FIXME: when deferring the {un}map the state of the device should not
>       * be trusted. For example the enable bit is toggled after the device
> @@ -236,7 +276,6 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>       * started for the same device if the domain is not well-behaved.
>       */
>      curr->vpci.pdev = pdev;
> -    curr->vpci.mem = mem;
>      curr->vpci.cmd = cmd;
>      curr->vpci.rom_only = rom_only;
>      /*
> @@ -250,33 +289,33 @@ static void defer_map(struct domain *d, struct pci_dev *pdev,
>  static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  {
>      struct vpci_header *header = &pdev->vpci->header;
> -    struct rangeset *mem = rangeset_new(NULL, NULL, 0);
>      struct pci_dev *tmp, *dev = NULL;
>      const struct domain *d;
>      const struct vpci_msix *msix = pdev->vpci->msix;
> -    unsigned int i;
> +    unsigned int i, j;
>      int rc;
>  
>      ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>  
> -    if ( !mem )
> -        return -ENOMEM;
> -
>      /*
> -     * Create a rangeset that represents the current device BARs memory region
> -     * and compare it against all the currently active BAR memory regions. If
> -     * an overlap is found, subtract it from the region to be mapped/unmapped.
> +     * Create a rangeset per BAR that represents the current device memory
> +     * region and compare it against all the currently active BAR memory
> +     * regions. If an overlap is found, subtract it from the region to be
> +     * mapped/unmapped.
>       *
> -     * First fill the rangeset with all the BARs of this device or with the ROM
> +     * First fill the rangesets with the BAR of this device or with the ROM
>       * BAR only, depending on whether the guest is toggling the memory decode
>       * bit of the command register, or the enable bit of the ROM BAR register.
>       */
>      for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>      {
> -        const struct vpci_bar *bar = &header->bars[i];
> +        struct vpci_bar *bar = &header->bars[i];
>          unsigned long start = PFN_DOWN(bar->addr);
>          unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
>  
> +        if ( !bar->mem )
> +            continue;
> +
>          if ( !MAPPABLE_BAR(bar) ||
>               (rom_only ? bar->type != VPCI_BAR_ROM
>                         : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
> @@ -292,14 +331,31 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>              continue;
>          }
>  
> -        rc = rangeset_add_range(mem, start, end);
> +        rc = rangeset_add_range(bar->mem, start, end);
>          if ( rc )
>          {
>              printk(XENLOG_G_WARNING "Failed to add [%lx, %lx]: %d\n",
>                     start, end, rc);
> -            rangeset_destroy(mem);
>              return rc;
>          }
> +
> +        /* Check for overlap with the already setup BAR ranges. */
> +        for ( j = 0; j < i; j++ )
> +        {
> +            struct vpci_bar *prev_bar = &header->bars[j];
> +
> +            if ( rangeset_is_empty(prev_bar->mem) )
> +                continue;
> +
> +            rc = rangeset_remove_range(prev_bar->mem, start, end);
> +            if ( rc )
> +            {
> +                gprintk(XENLOG_WARNING,
> +                       "%pp: failed to remove overlapping range [%lx, %lx]: %d\n",
> +                        &pdev->sbdf, start, end, rc);
> +                return rc;
> +            }
> +        }
>      }
>  
>      /* Remove any MSIX regions if present. */
> @@ -309,14 +365,21 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>          unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
>                                       vmsix_table_size(pdev->vpci, i) - 1);
>  
> -        rc = rangeset_remove_range(mem, start, end);
> -        if ( rc )
> +        for ( j = 0; j < ARRAY_SIZE(header->bars); j++ )
>          {
> -            printk(XENLOG_G_WARNING
> -                   "Failed to remove MSIX table [%lx, %lx]: %d\n",
> -                   start, end, rc);
> -            rangeset_destroy(mem);
> -            return rc;
> +            const struct vpci_bar *bar = &header->bars[j];
> +
> +            if ( rangeset_is_empty(bar->mem) )
> +                continue;
> +
> +            rc = rangeset_remove_range(bar->mem, start, end);
> +            if ( rc )
> +            {
> +                gprintk(XENLOG_WARNING,
> +                       "%pp: failed to remove MSIX table [%lx, %lx]: %d\n",
> +                        &pdev->sbdf, start, end, rc);
> +                return rc;
> +            }
>          }
>      }
>  
> @@ -356,27 +419,34 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>  
>              for ( i = 0; i < ARRAY_SIZE(tmp->vpci->header.bars); i++ )
>              {
> -                const struct vpci_bar *bar = &tmp->vpci->header.bars[i];
> -                unsigned long start = PFN_DOWN(bar->addr);
> -                unsigned long end = PFN_DOWN(bar->addr + bar->size - 1);
> -
> -                if ( !bar->enabled ||
> -                     !rangeset_overlaps_range(mem, start, end) ||
> -                     /*
> -                      * If only the ROM enable bit is toggled check against
> -                      * other BARs in the same device for overlaps, but not
> -                      * against the same ROM BAR.
> -                      */
> -                     (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
> +                const struct vpci_bar *remote_bar = &tmp->vpci->header.bars[i];
> +                unsigned long start = PFN_DOWN(remote_bar->addr);
> +                unsigned long end = PFN_DOWN(remote_bar->addr +
> +                                             remote_bar->size - 1);
> +
> +                if ( !remote_bar->enabled )
>                      continue;
>  
> -                rc = rangeset_remove_range(mem, start, end);
> -                if ( rc )
> +                for ( j = 0; j < ARRAY_SIZE(header->bars); j++)
>                  {
> -                    printk(XENLOG_G_WARNING "Failed to remove [%lx, %lx]: %d\n",
> -                           start, end, rc);
> -                    rangeset_destroy(mem);
> -                    return rc;
> +                    const struct vpci_bar *bar = &header->bars[j];
> +                    if ( !rangeset_overlaps_range(bar->mem, start, end) ||

Missing newline between local variable definition and code.

> +                         /*
> +                          * If only the ROM enable bit is toggled check against
> +                          * other BARs in the same device for overlaps, but not
> +                          * against the same ROM BAR.
> +                          */
> +                         (rom_only && tmp == pdev && bar->type == VPCI_BAR_ROM) )
> +                        continue;
> +
> +                    rc = rangeset_remove_range(bar->mem, start, end);
> +                    if ( rc )
> +                    {
> +                        gprintk(XENLOG_WARNING,
> +                                "%pp: failed to remove [%lx, %lx]: %d\n",
> +                                &pdev->sbdf, start, end, rc);
> +                        return rc;
> +                    }
>                  }
>              }
>          }
> @@ -400,10 +470,10 @@ static int modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>           * will always be to establish mappings and process all the BARs.
>           */
>          ASSERT((cmd & PCI_COMMAND_MEMORY) && !rom_only);
> -        return apply_map(pdev->domain, pdev, mem, cmd);
> +        return apply_map(pdev->domain, pdev, cmd);
>      }
>  
> -    defer_map(dev->domain, dev, mem, cmd, rom_only);
> +    defer_map(dev->domain, dev, cmd, rom_only);
>  
>      return 0;
>  }
> @@ -595,6 +665,20 @@ static void cf_check rom_write(
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> +static int bar_add_rangeset(const struct pci_dev *pdev, struct vpci_bar *bar,
> +                            unsigned int i)
> +{
> +    char str[32];
> +
> +    snprintf(str, sizeof(str), "%pp:BAR%d", &pdev->sbdf, i);

%u for i.

> +
> +    bar->mem = rangeset_new(pdev->domain, str, RANGESETF_no_print);
> +    if ( !bar->mem )
> +        return -ENOMEM;
> +
> +    return 0;

Could be simplified as:

return !bar->mem ? -ENOMEM : 0;

But I don't have a strong opinion, I understand some people might find
this obscure.

> +}
> +
>  static int cf_check init_bars(struct pci_dev *pdev)
>  {
>      uint16_t cmd;
> @@ -675,6 +759,10 @@ static int cf_check init_bars(struct pci_dev *pdev)
>          else
>              bars[i].type = VPCI_BAR_MEM32;
>  
> +        rc = bar_add_rangeset(pdev, &bars[i], i);
> +        if ( rc )
> +            return rc;

Don't you need to use the fail label in order to restore the previous
command register value on the device? (here and below)

Thanks, Roger.

