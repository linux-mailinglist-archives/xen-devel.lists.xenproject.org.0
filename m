Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4A07AFEFD
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 10:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608765.947468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQHC-0001Aj-GE; Wed, 27 Sep 2023 08:52:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608765.947468; Wed, 27 Sep 2023 08:52:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlQHC-00018t-DS; Wed, 27 Sep 2023 08:52:10 +0000
Received: by outflank-mailman (input) for mailman id 608765;
 Wed, 27 Sep 2023 08:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlQHA-00017G-Ai
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 08:52:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fead117-5d13-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 10:52:03 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 04:51:58 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB5701.namprd03.prod.outlook.com (2603:10b6:510:42::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 27 Sep
 2023 08:51:53 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 08:51:53 +0000
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
X-Inumbo-ID: 1fead117-5d13-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695804724;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ifczG3gDwzpZ09KzLREvMbXokeIBT1evuLOg7NU4WWQ=;
  b=U86qJrHKoeSgbO8bX65QqOAP2xtXmMfj9n4KoEDv6X/ghMaev+GKXKJN
   Atf9nX4M1bdZ9C6FvZ6s0twMksnyCppQgoQu6QNu9bp1HwaGlYgX0ix21
   GpOMyD5pGN1uz0DRZpHOTX1T1uTO1ErARz3lWSpy+HsyVLwPS1ynl+97I
   0=;
X-CSE-ConnectionGUID: 6fdC0PifRTyDk++B1Rp60g==
X-CSE-MsgGUID: SpR/CXaqTRu1pJTMZIp60A==
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 122561250
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:LH1JN6iWD8lclX7Lytuumie8X161rhEKZh0ujC45NGQN5FlHY01je
 htvXW7XPvzfZWDzfIh/O4zkoBkB6pGHyNc2TQVsq3tnFysb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyp0N8klgZmP6sT7QWBzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRGJjwmNiiCidiK0Z64CapG3/47cpHkadZ3VnFIlVk1DN4AaLWaG+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluG1abI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqhAt9MTeflrpaGhnWo3lZUIy0fTGeBvKChqHKbafNHd
 RQ9r39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnvx
 xiaoS54gK8c5fPnzI2+9FHDxj6p+J7AS1dt4h2NBzr8qARkeISieoqkr0DB6upNJ5qYSV/Hu
 2UYn8+Z76YFCpTleDGxfdjh1YqBv56tWAAwS3Y1d3X931xBI0KeQL0=
IronPort-HdrOrdr: A9a23:/2t/w6D0ou1PHy7lHemW55DYdb4zR+YMi2TDgXoBLiC9Ffbo9P
 xG/c566faasl0ssR0b8+xoW5PgfZq/z/FICNIqTNOftWDd0QOVxedZgLcKqAePJ8SRzIJgPQ
 gLSdkZNDVdZ2IK7/oTQWODYrMd/OU=
X-Talos-CUID: =?us-ascii?q?9a23=3AqetDMmghz158bqeyKe9vW+FYDTJuLHPR5y/oIkG?=
 =?us-ascii?q?CNXdFS/7WYwaq4P08nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AaP1NmwxxnQ8vKa7I7Ig7q/zyW1eaqJ+2MgcmoZw?=
 =?us-ascii?q?fh/OZbDRSBxKvrSzpGqZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,179,1694750400"; 
   d="scan'208";a="122561250"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8P/CFVPzWIjrVGBlvUh1TPh/2rodeKMpLJSMN4laOfkp2JhLntitPNVFHw+3l011wmklH64noIXuVQ7H6rJuTUvESfkPPMo9igmLG9SjnH3cjrhciE1kZP/5rAJ4I0Qr36NT+touwzFBJRTZtaVQ4nmzb8Mf+Ks3yhgYemnFgE0pXbg5zGOF9po5sSXFyePHbnrxnrY5WHZ0h27II7ifEdtZP8pHp+9QbMBEk+a/mOvn4VIQj2B/l//DId0KPBxR5C5NuX+GkvpZq+bT894NT/38otXY1lX99Zma1zTuzOnPEcwHCrDMmb46IzXN8G8umBY3yNrX+uNBfIggd6wNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBP2dem1+W3ItgTKgjV9ElVRPiBWNJq1NfzwdJ3YMOg=;
 b=b4b8wNfAHI0gMz36d2OsvKOzTES7ETaeM2J+wwQyize2w41EpdyDmkRgFGuiJS6q70fNh4Ym3tkgIO9ovKMpKeUjwOWezz7kdcg+HH8JcYRLo0lluMfhkrFWnYt+JFD18Xhh7NrY+I1B3rK68lczWD196TppXuoxPrxjRfZHZMBqaVhXMJSuSafFYaoVh7s6pSMI+ufsAPiIrbY0t+q73cGE/lIBxfQygdrFkSBVqNjWMvJ/d6uvKshIrjR9HU5zY1jO0stRmWYcp/tC8og9pAUm4/0s/7JQyeTmUthj1CpTZvL0+P5oIALETDFMqNkQiYDTvX1ugNoOI6I7IIht+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBP2dem1+W3ItgTKgjV9ElVRPiBWNJq1NfzwdJ3YMOg=;
 b=Ys2c2M4PvoqGcb6GXQ7xVeTGq+Xofr5if76XlyG+bWdr+++5FCzUb4VgDDl4KXNJElQBLg1+oduQqTgKfbQJC+TltE+7T53VbG0zbJRHTaTi4YJRXdtClugf8Usbty0AsFTeORZrFzl9rLrSSp+A1teBjlVTWtfGNGbtvPryUAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 10:51:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/8] domain: GADDR based shared guest area
 registration alternative - teardown
Message-ID: <ZRPtI9UfgpCfQ4HU@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <68cdb299-c41c-b6a5-c9ce-bd915508ecf2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <68cdb299-c41c-b6a5-c9ce-bd915508ecf2@suse.com>
X-ClientProxiedBy: LO4P265CA0248.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:350::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB5701:EE_
X-MS-Office365-Filtering-Correlation-Id: 76986c3a-7bd5-4020-4a02-08dbbf36ff1e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1XAHv586ey27BFTjVRWAj0xMfhnJgX1BT2tH0NOaFeInCiCAQgzjZEpyaU4Gz/24zSiElFPkw9p+2IW5ZV+1gfLWcQ6UAVs+MSUymJ8xagBtN/fQOX2W4TFhzGZJtzftWb/DtFtEnmBoMeSnYO9yvtYDTlJIHgz92Y2R1lLZhylhbXX4FeZwfr2zYA0vDp+kNSjv3BHb0nNwQ2SRpFNgpigJtLEzAMb7YyOnQDlL2PoJ/DWUqK/Dujw16cFxFymEpCxsQHuRFd0+VOOkMyxSOWeoiu4zqpv9PQDTDTO2HMzP6LKBwo9znWdCn+TaNJcrJ7Ps39Q5u7LioRZnSoEbCbkENkGc1UgoQyWzFS6jLSOVlZjb33bMsajqlGoxGs/GRCDJlMYXAp8OP1gNp/Z7R/xzjt7i7tbMreL+i4H3tUc4wEE0kRfsqxXfmc8j1KQlr2yo0YGfqXPaIOnRPWUAgMCVepy/z+FyG/UxEy927ZGM7aaziIrvQB2VCftx+OCMURDk/cPi7Js9m9WrbJNqj8MDohCpb7j89PBHpxXo3K/xReksaGvJPt/J3nx7Ute+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(366004)(376002)(346002)(136003)(230922051799003)(451199024)(1800799009)(186009)(316002)(54906003)(6916009)(66556008)(66476007)(66946007)(5660300002)(8936002)(41300700001)(8676002)(4326008)(83380400001)(6666004)(9686003)(6506007)(6486002)(6512007)(33716001)(85182001)(38100700002)(478600001)(82960400001)(86362001)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekxRMC9JODQ0SWJQVDExYkVvcGRjNWswRlF4elNKMDg4OG0yQXFhWGhPdHZD?=
 =?utf-8?B?ZE5NcnhWbWdCR1cwOUJTZUI3MXUxVHF6SFh1WW9ITnZCa254Zk1hY29OTEJz?=
 =?utf-8?B?ZzRZWm1nZ2NLZ2JYY2hRaVlPOC90SGZuRElPa0hpRHkxZFVsSVlqbkJVelBT?=
 =?utf-8?B?Z0FQU0RJOG1SWWFSN2xteWVDWDhOWGVDT3BKWHZ6K0xTR0YrRmxCQytaMnZY?=
 =?utf-8?B?blptUHlvSjYvbExXTkdUVTRIMGduaThmVDcwTUZIbEp4Y1A4b2syVVJBUEVQ?=
 =?utf-8?B?OU5CSUZtVGNZT2RUREl2T0g1czdPSDJuTjlUaEZJQmYwVUZxMGpjTDVvZUsv?=
 =?utf-8?B?L0xPMy9sNUtBdXpRdTlTNExROXF3QTJ2ZC8ydmo3UTlKaGRobzgvWmZkVmkw?=
 =?utf-8?B?eWY1K3RVd1dkSFVDSzN0UTRMYzBYNnBPa1I1TXdBWlVtb2FzRUZOVVlUM2Mz?=
 =?utf-8?B?N0ZjOVlZdjYyMUhUMnI2YVNlSC9TeldtWm0zajlhaWgvSE5hdTloU2YwYVdy?=
 =?utf-8?B?UkR4OXd0ajR6cEw4SkFOeWFOLzltbm0xNFN4N3NWWjVkVzhhd2U4MGJSSEky?=
 =?utf-8?B?cFB2RnlXMCtBdjhIOC9mK2loQVVSelpITFlOWnU2WlR4bkhnZ0lvUGJCeENn?=
 =?utf-8?B?RHpIK0ZrUkNZemtXOGR5N1BrMnZGd1dueUdwUU1udjZLMFBkOHZ3YXZ6TGtG?=
 =?utf-8?B?VFFRRllFUXlGVmdkaU9zM3RRaUVTVUljK0pLaEx6aDc3MVhJekw4L0NKOUU3?=
 =?utf-8?B?ZXhNRGROUzl4T3hBNGVmYUphMDhVazhRZzJIK3BaRjZWTG43VEVMdFdEUHdM?=
 =?utf-8?B?Qlh2VXN3MkRvVjVVS0NXYWI1KzdJTCtOalNjRmYzaFB4RlY5ekVQanMzUXM5?=
 =?utf-8?B?YlFvUDgwbVltWWdWOHNGUFlCM3QyREttbmtEQzdsVTNKT3hpYnE1QS80YjFS?=
 =?utf-8?B?dmMwZzVWRVl1U2ZudXFUSU1FSWU0bUd5R0lya0IzN1RsM09BWEJtRE5JTG4y?=
 =?utf-8?B?VGxYR1Fya1JxL1ozTk50K2VrODhyQnpOVnJnS1VQeHl3djY5VHFkK216QUxP?=
 =?utf-8?B?cGU1YXEvL1N0UDJ4YTFLVVkvb0tEQkpuaEdsbnJtc1NWQWNtUXB6ZlR4K2tY?=
 =?utf-8?B?cTZMbGVseGxGZDVxdFQ1M3dEd1hPNEpBVnFmc0ZjYnRuVFFmRVhkZ29FV0hM?=
 =?utf-8?B?U1JzN3NkRHU0SENNSFZmSEFhT2hmd1ZualM3LzN6c1V0b1BWTm85MnpXNEcx?=
 =?utf-8?B?RXhvUEJLdDN3d2dvYXc4ekJ4TnJmZUEzdWYyVCtrckhpdkhPbitHdS9BUEM1?=
 =?utf-8?B?b3VKdWs3N3h5b0N4aFkrV0s3ZzlGbnhLNFErakRoTEJsZDhmcFd5Z2MrdzBO?=
 =?utf-8?B?NURZcWJOeFpIWm9QYXhzd3FVMTVmZWRHNE1LTGNVVTZTR0RPWVZ2RWpMeThB?=
 =?utf-8?B?NUR3NFo2UmpSSTViWCt0YUVxQXdkSzBzQzBPck5GeUdXVTdWV3dudkdnTUtD?=
 =?utf-8?B?Vk95RThNU2l6bzBCVXYzM01LeWszMEVrQWs1NnQrdmdQbnBhOEtJcXJJUnJ4?=
 =?utf-8?B?eW9Db0IzN3QyTjVsMVhJcTBMSjdZWmNpMTliSGhDQTlvNzc3ZjNXMGgrSzNP?=
 =?utf-8?B?bmk1QXovZUluUk1zUUdiWk4zb0RqTFZrcXFGS1prNHFIR0xKU2paYlRyVzZG?=
 =?utf-8?B?ZVRhWisvbDBtSVVHLzVQbm1qZzZKcjF6SjFpWGhlN0ZheHdzU3JYV1dsRUhz?=
 =?utf-8?B?Q2pTQ0s0ZEM4cGk1Z0dRbEpvWDdrOGVTQmR1dng5ZEE4VWhKOWNaT29wWHVz?=
 =?utf-8?B?NWpuL1RiZ3pqSDZRajgzNk4yRU4xcWRLbVoxTzBMSDRMdjd2RmQ0b2VBanRk?=
 =?utf-8?B?VHdlV2daYlUxeTlyMVhubXdSU0FCaXBzYjJtZGRLd3dCVlVrQXpHUW96ay9X?=
 =?utf-8?B?NlprZ2ZLbEZsMWNMdmFSQjB1VFdhM3BtQWRkb0o2aUlZeHlYVCt6Nk5MaWJC?=
 =?utf-8?B?K2RlY3BlN0dBc2xwUVFZZ09yVUZkOU5EUUF6S094RklmbjhOdkZTQ3RwTHBS?=
 =?utf-8?B?UDZRVWFuYzFiR0dQTEczZHQwV2Y0eUFKQnkyYTVwcVdmTTNadkRsRDJKRDJo?=
 =?utf-8?B?TVh1cnFoYWx1bHV0WFFaWVhCSlBhVmxndUhVNU9DWUF3dDVnSGJLZVJORFZI?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OPRd6fXb13tq2bQ9X79/kf3y6OpJf6bdA/JTeuyxyNnzplHdKJGWIGp6EXSfS6e5zfRleqqdbN1ppYoIoqhoYWbllEbKyaDv/1oQ+MfwesFaPsGU3/X+fJGHkIQPpjprbPOXMl2zgeE3u+PEt31oazvpNpjKmn+ywR0DRbTj3L0rwyawO9iELoHo95rh6e4nkF/j++Jt+Ajl/YF2/We8ENn+1Mq5eNUoVF4Ms2qHqoSpbFthaVUMnwKHld5d+CR/Ft73IU9tOn9dZ7sz5JZ2B/mUSSRrww3LG/bhkphveeOrsJWpvs72J/yt5T1yxUXXg1Ie9P0JbDhjoXJJHUSl79yLAVFF2LMSMhzY5XEOujDZn05lllduEnzzK4xPhEYr1Zo67EoZtVnMCzPwD5+QKcJe0FgwMlP/lj1jphYp9CwbXYVNMdEtmRTO/AWgL+XQVlc4z100gK1tOAcds353SBsSzvaVC0d+lIThKgpXjoAgjgXIEOwIHd5gO07rX/XhHRHM8dEec1bVPM08aH7HjNy8GCkhADhYkwo20VvMMJippti/74aAFfx2LBU6gjD4kefkreqAEYbuHYTd5xrgnqTEc1shORlU/TNG2HtRj4+QZcF5llLzMAyYZ+kANEoCkedhnI1jTUFH0AsZTxhxLCzgeULViyl64Dca2y/VIMpLOybigOegb5NxQhF0jFdQM+bD53fFi7rl4tM4x2BuBFfBzmtx8Fmq2ZNRVcnymszqNBbKDFfRVQNlAWTD42mef6MYRUoimgcLJMysYbCDlj0h6tQTH8unXHwv7XQw37JsTEFvvnn3FxmyFMVGwMMSUCtdot9Szb0HgKSU3fVey2fKkh3EYB9Epj2ZK0+3+zs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76986c3a-7bd5-4020-4a02-08dbbf36ff1e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:51:53.5620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vd91kUZ38TNCHBwt+GjSUGuKoJfoZelj0gMc3J9WdHW1tiz4S4nJUi47NaimR8bWLKrsuXlAT3b8zltXVj8WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5701

On Wed, May 03, 2023 at 05:54:47PM +0200, Jan Beulich wrote:
> In preparation of the introduction of new vCPU operations allowing to
> register the respective areas (one of the two is x86-specific) by
> guest-physical address, add the necessary domain cleanup hooks.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
> RFC: Zapping the areas in pv_shim_shutdown() may not be strictly
>      necessary: Aiui unmap_vcpu_info() is called only because the vCPU
>      info area cannot be re-registered. Beyond that I guess the
>      assumption is that the areas would only be re-registered as they
>      were before. If that's not the case I wonder whether the guest
>      handles for both areas shouldn't also be zapped.

IIRC the reason was to unset v->vcpu_info_mfn so that it could be set
again on resume from suspension, or else the hypercall will return an
error.

I guess we should also zap the runstate handlers, or else we might
corrupt guest state.

> ---
> v2: Add assertion in unmap_guest_area().
> 
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1019,7 +1019,10 @@ int arch_domain_soft_reset(struct domain
>      }
>  
>      for_each_vcpu ( d, v )
> +    {
>          set_xen_guest_handle(v->arch.time_info_guest, NULL);
> +        unmap_guest_area(v, &v->arch.time_guest_area);
> +    }
>  
>   exit_put_gfn:
>      put_gfn(d, gfn_x(gfn));
> @@ -2356,6 +2359,8 @@ int domain_relinquish_resources(struct d
>              if ( ret )
>                  return ret;
>  
> +            unmap_guest_area(v, &v->arch.time_guest_area);
> +
>              vpmu_destroy(v);
>          }
>  
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -669,6 +669,7 @@ struct arch_vcpu
>  
>      /* A secondary copy of the vcpu time info. */
>      XEN_GUEST_HANDLE(vcpu_time_info_t) time_info_guest;
> +    struct guest_area time_guest_area;
>  
>      struct arch_vm_event *vm_event;
>  
> --- a/xen/arch/x86/pv/shim.c
> +++ b/xen/arch/x86/pv/shim.c
> @@ -382,8 +382,10 @@ int pv_shim_shutdown(uint8_t reason)
>  
>      for_each_vcpu ( d, v )
>      {
> -        /* Unmap guest vcpu_info pages. */
> +        /* Unmap guest vcpu_info page and runstate/time areas. */
>          unmap_vcpu_info(v);
> +        unmap_guest_area(v, &v->runstate_guest_area);
> +        unmap_guest_area(v, &v->arch.time_guest_area);
>  
>          /* Reset the periodic timer to the default value. */
>          vcpu_set_periodic_timer(v, MILLISECS(10));
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -963,7 +963,10 @@ int domain_kill(struct domain *d)
>          if ( cpupool_move_domain(d, cpupool0) )
>              return -ERESTART;
>          for_each_vcpu ( d, v )
> +        {
>              unmap_vcpu_info(v);
> +            unmap_guest_area(v, &v->runstate_guest_area);
> +        }
>          d->is_dying = DOMDYING_dead;
>          /* Mem event cleanup has to go here because the rings 
>           * have to be put before we call put_domain. */
> @@ -1417,6 +1420,7 @@ int domain_soft_reset(struct domain *d,
>      {
>          set_xen_guest_handle(runstate_guest(v), NULL);
>          unmap_vcpu_info(v);
> +        unmap_guest_area(v, &v->runstate_guest_area);
>      }
>  
>      rc = arch_domain_soft_reset(d);
> @@ -1568,6 +1572,19 @@ void unmap_vcpu_info(struct vcpu *v)
>      put_page_and_type(mfn_to_page(mfn));
>  }
>  
> +/*
> + * This is only intended to be used for domain cleanup (or more generally only
> + * with at least the respective vCPU, if it's not the current one, reliably
> + * paused).
> + */
> +void unmap_guest_area(struct vcpu *v, struct guest_area *area)

vcpu param could be const given the current code, but I assume this
will be changed by future patches.  Same could be said about
guest_area but I'm confident that will change.

> +{
> +    struct domain *d = v->domain;
> +
> +    if ( v != current )
> +        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));

Isn't this racy?  What guarantees that the vcpu won't be kicked just
after the check has been performed?

Thanks, Roger.

