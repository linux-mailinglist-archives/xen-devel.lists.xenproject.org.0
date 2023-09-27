Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A912C7B0215
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 12:42:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608869.947638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRzu-00082W-F6; Wed, 27 Sep 2023 10:42:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608869.947638; Wed, 27 Sep 2023 10:42:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlRzu-000801-CJ; Wed, 27 Sep 2023 10:42:26 +0000
Received: by outflank-mailman (input) for mailman id 608869;
 Wed, 27 Sep 2023 10:42:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WUTS=FL=citrix.com=prvs=6275c33bf=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qlRzs-0007zv-Uj
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 10:42:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89d2cbae-5d22-11ee-878a-cb3800f73035;
 Wed, 27 Sep 2023 12:42:23 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2023 06:42:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7486.namprd03.prod.outlook.com (2603:10b6:510:2ec::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 10:42:16 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::86fe:5402:9485:35c3%5]) with mapi id 15.20.6813.024; Wed, 27 Sep 2023
 10:42:16 +0000
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
X-Inumbo-ID: 89d2cbae-5d22-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1695811343;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=z6qq5C/sYlnh4VYQepfEZa/KFfbnD/dYKqD2VH8GbJo=;
  b=crz+WWkQ41J47f6wJB0T0Xfop4UT5VEARaaKT7hxuWm4IHQHVcRkm40q
   YoRHmyIYr5INl+yDbEjMXbmu4cRM2v4sRSMUQScIP2wTG15ItwX5WgviW
   pGsryHw7gGr56DKdGc01I0u7Gq42MeBKI7gjlqMUMNn8FdNJhbZv26fdk
   4=;
X-CSE-ConnectionGUID: jV9YSxI+QtiKy1+ui7WWzg==
X-CSE-MsgGUID: DxipL6MnTei1aNZ371hLaA==
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 126688408
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:Lqwy064mQLg0PE8j5GZ0wAxRtPbGchMFZxGqfqrLsTDasY5as4F+v
 jZLXGuHaPmCYWameNpxb9+y9xgF7JHdm9JmSQdprCkwHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU355wehBtC5gZlPaER4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 8JJGQsdT1O6m+OV0ev4V+gzufsxI5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+WF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWx32lCNJOTO3QGvhCrE2S3khNLRsqWFriqN+L0RHnW/ZWA
 hlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWXVHac+7G8vT60fy8PIgcqfjQYRAEI593ipoAbjR/VSNtnVqmvgbXdBjXY0
 z2M6i8kiN0uYdUj0qy6+RXLhmyqr52QFAotvFyIAySi8x9zY5Oja8qw81/H4P1cLYGfCF6co
 HwDnMvY5+cLZX2QqBGwrCw2NOnBz5643Pf02DaDw7FJG+yRxkOe
IronPort-HdrOrdr: A9a23:aLnUj66M4N0M/4tShAPXwNvXdLJyesId70hD6qkRc203TiX2ra
 qTdZgguCMc6wxwZJhDo7690cC7KBu2yXcS2+Us1NyZPTUO1lHGEGmnhrGSpgEJ3EbFh4xg6Z
 s=
X-Talos-CUID: 9a23:X163l2/CgMID98/e6bqVv0wqS/EeYlye9WvRAF7hSntoF4KqW1DFrQ==
X-Talos-MUID: 9a23:CtGYvwXCITLlvGHq/BP8hSlGauJu36mvUUkro85Z4smgPAUlbg==
X-IronPort-AV: E=Sophos;i="6.03,179,1694750400"; 
   d="scan'208";a="126688408"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B68sFV+rlF170qPeoy/8TBvAQm/dboRJbXNdIbSfllkh/7Eu5rxQy53T2LA/8e4+DdZlxwrTpNNfNxiZwe2iZ3JtUvFb2fP7+hqo+FHGz/3yP0uX9upk4W5BFG2fvxkoJlQjVtDfAVTMQudG+YCn4DHazprH7DS5DMmP/S+alWX/bJ7FHTx4z1qRurLTyNI/E8FJhOCBZ2ZYFVMCZJgxTz29Jklt3DCzqEEUSXcyGOghWgmsxWJEdqwtxJvzG+b7u0y/Z9EUHxxAz9RMWri03t547BqL+meNLkOwVm1Wuy8NX3dL7edRQZxLRPWXqIJASMU83a9sZhfrfSqhdHw2rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRi5VjQgfxrYjczCVYIBrMc33L8M0BLiOCDQ6a1hbKc=;
 b=JUrCcm+TTXFchOHe8zdogbGBXokrdnwXPV1lWhrZ90IC411RiLbCx54ip7sDBvn/9lwDnFmILWdaHm8AqKK1pLBQWo0HHj6d58nlK85iDJFLofwnsxc4f4jt9RnjSyhghaHP63iK1wf4sAFkKl2TwOV5pQZs0Pau27NliEEjNvq9GwVhEJZ45klPfTMYZvJF9kAdSnVwQccYEZTO/o4X3hTJsQbR64S5nP7w5Xtjw6d33xW0+z9ztI7pFf54XOOkbPBRE3OMp0BXnwDdOdzgj5X0dKo2h6c+uJoZzukSKZesjiZtrtZn31+EdNfrMIzEdiYqIcBfvpfiLOWTuA3O0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRi5VjQgfxrYjczCVYIBrMc33L8M0BLiOCDQ6a1hbKc=;
 b=tJO9nZposJMrj/ViXH/xG+t5uVxclm6AixuAOsvVQNe7gGl8vepW1oZhhvS49nBEbsfLrP+aN42tgt0f2SEWNriL/MNPdp5mBoIuIQHa59yYeT0XqKh0XO12InbHM2g2idSHwmM7NF7D/8P85F0m3J3Z8IhLS03xox89XRVqZyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 27 Sep 2023 12:42:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/8] domain: GADDR based shared guest area
 registration alternative - teardown
Message-ID: <ZRQHA0u5wPXkuILV@MacBookPdeRoger>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <68cdb299-c41c-b6a5-c9ce-bd915508ecf2@suse.com>
 <ZRPtI9UfgpCfQ4HU@MacBookPdeRoger>
 <4e1e0b28-bb0b-03f9-d62e-dd04846dd2e4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e1e0b28-bb0b-03f9-d62e-dd04846dd2e4@suse.com>
X-ClientProxiedBy: LO4P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::16) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7486:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b6867e-6294-484c-bd99-08dbbf466aef
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fZFRlUcDXjb1cdptvvWlFL+NCqFTyTGTQE1uwiL9+DRt+9bZZzgacVcRt+7VvzoTfr83v+aO4DgctTXsXTPTwG2g+8ZaXO3Ow+18fbN2Y0bWb0dt0suTbBZj5T/7v2d6M1V/rb2z7bq87OwV198zAKzNeVOtSyyVuB+Zkic4+cPky0IzkySM9/J2xNWFoiNSdcVC2JzhVBjeKcjOczYhKw4wGLpcayAN67JmPBbiQF/M02NpGyWk0ckkLzWNnSegRYKlC4DTK7AW/FABRh7c5i1VPf1yIm4q1egc3XErzlomyX4B2TBZ6LTBm7eTP7C3TbmnZOHhZgj/4wLpiiu4/YMXzE5K43cHkbTiuhRXrfD7h3fCdujwbSJcphcULiNpTqfgFj5YR2Pu7M0TfjJKFDJm6MbevTgdef4NJMSLO+YVV5sELLVBKvVk8sC4tS4PpfupbReVThYbop7jjW49hi/poiPbG+nsee9l4X8kX3Ymtx1dF3GC0PaVPCKBE4mgTsVCE6rK7mO1FkxyBFe0dPS16jUHnWfDrjnkr6oZ089vLMvMSoaQjJOoKwcNNMjT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(396003)(136003)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(2906002)(5660300002)(66476007)(66556008)(54906003)(33716001)(478600001)(6666004)(53546011)(6512007)(9686003)(66946007)(6486002)(26005)(6506007)(8936002)(6916009)(4326008)(316002)(41300700001)(83380400001)(8676002)(82960400001)(38100700002)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVY0bmowVlc5Y0FpQTFPUXlLWm4xdTNKaXVBQmI5RC8zMTVVR05nNHlOV2JW?=
 =?utf-8?B?emJlNHFGL0phKzgwS2Z5V2p2M1pMeWdqTm1EVWxyQU1rSFFkT01PTVJ3YU4y?=
 =?utf-8?B?MnQ4Ui9hcjB4RVZtaEJvVGk5MzNCcVF6VjBLVDBQMEhCNVBNUUFYUU5WNVcy?=
 =?utf-8?B?aDJBK1RmRDhrYmdXTXc4eklaU2IxSEQ1cEFieFk5Z1JiWjhhUDcxbkhUaFNy?=
 =?utf-8?B?TXE5a2ZBNFJDdnZwQUo1aDdRTDVIT2U4SVhJYWRmckU4d0kwa093VEVpNmRj?=
 =?utf-8?B?Mi96aW5jVmpzaUVka2UzSTdzUTg1SndLZ2Nqdk1ld0VjZXJsM0o3RXVSSHUv?=
 =?utf-8?B?eEFOc1ROMlJ0aEp6RGF2cXF4RWNBTHFQQVh2SG90Y1c4WERIb0o1bHNhcDll?=
 =?utf-8?B?U0JoOHMxZjM1ZmNvdnNnTjhZNGJkT1dKWnZEcmFGUG9LUkNqWGNNalpReEZ6?=
 =?utf-8?B?WHh6bldsNTRnSDJqUEZZdjZ1dVN2blhzQXNYMGN5RU5aVUttQXljdTNqNXBG?=
 =?utf-8?B?YzlDL0ttOThSVjlFdVM1dDI2R1NOY0xGR1g3SUNNWm81TXhmbC9GZElTcjdk?=
 =?utf-8?B?OHRBVUZ5VWxFYkFjYkMyUlQyb0M0M1hhZGozT2tQRHg1TEV4RXNSZ05Na3Fu?=
 =?utf-8?B?djg3K2dJVjNSQmFiNHNSaWlScXVVMDJ3dGF4NlBqSjNMTjNsRDR2bytTUTda?=
 =?utf-8?B?NUNrMnB6RTlYYVcwZWlsU2xSM3VLL3BFNlZvL2dXY2h0QTZqYlBKNkVUbXND?=
 =?utf-8?B?NEZkYkk0ZUNCWTRtYmhTcU9TeUN2dFQzZTFTSHlUbzVhdEJ5aDFVaE9mMDRS?=
 =?utf-8?B?dkc2b2Z2VVhKenFhWFBoZ3lFZDI1aEVNK0pOZjlLS3lTd2V5WTBqQk5Rc1hs?=
 =?utf-8?B?c21URk5PaXNXaWdIUy8yQlhKTjFPcGwvOVpqeGtJclpQZWhhSjYrSUJ5N1lh?=
 =?utf-8?B?K1hDZU1Fd1Z0Zld2YkRzdCtqbkI4cldCczRvVFRySWxoUm9rdkVhdG5VdkN6?=
 =?utf-8?B?eHRVaWxGVlJQMHhsdGxaMlE2UCtqUzRwQTFNcHVpVzhaL0tGSXd4ekxKN0U0?=
 =?utf-8?B?eU9GTnhVVkVhOUMyM0dFaktyOXNsUHZYdjI0bUdrYUt0SnBLY01TRWlqZ1ZK?=
 =?utf-8?B?dXJSZHU1VDNGeGpTWGVIN1FNdkZUNVRwc2dXem9heXRZNC9TTkJVQXNLRm4y?=
 =?utf-8?B?cjlqb1ZOZmswbGJpcS9rTFpiS0hlSDVWNUlWSGJaVWQ1eGc4MVpBUFdwMlVt?=
 =?utf-8?B?ZldZS3Vtb05XNm9yeFdldmZ2di80K1lWSUU5MDlUR2RrL3U2anJkNStRczBC?=
 =?utf-8?B?ekEzeitxamxaRWZFUjBRN2lEU3dBWUZSUndCRWFQVjlPRlZDak9hTzl2NzJS?=
 =?utf-8?B?TzlaSE05a2lDTytiYk9IcXlubVRINUFBMjZhODRpeE1yeEY3MHZaZllDYTVy?=
 =?utf-8?B?WFpHc0xNdG1zWGNodzU5ckR5KzEvM1FuMUZWZVZvS2dTaVkxUGFlQzZjNnVr?=
 =?utf-8?B?YTFycCtTSGxPZ3M5Q3JiejllMFdrZ3dOVzBabjE1Ulh4S0cvazV2Sm5Fc2JQ?=
 =?utf-8?B?aGRjQXlUMjE4VHdSOWFFcGR2bTljZ0psdWZXWWN1WGltSEhvYU5xdUxZTUVU?=
 =?utf-8?B?RnhnKzhvYzhoZ0pJVTBkWDYxaWNMc21FWWowZXZ6anNSUkpSd2VieGdpQjBN?=
 =?utf-8?B?Zkx3b1BwVUZXV0dhaklidDJqayt6UmxyU1gxYjhZWjJOYXN6SDhkY1FlWHpI?=
 =?utf-8?B?dXRmRXpwMWd4aHBYekFobk9VTysrd0x3Y2tYUEJGM2JacE4vUnYrVVJVTDB4?=
 =?utf-8?B?RlEvbkd5aHRjQ29RS0s1RnE1TUtjaW92OWdRMm44MnFTbCtTYTNrZUJsUzcz?=
 =?utf-8?B?dkUzWWZHVVlzOXYwK0NGMHFhdnlQNllyMFhvQUNiMHFaVG1WR3NGeXpKb2Rl?=
 =?utf-8?B?SVNIK1pWbGNBTUQ0dzBZQXVETEdDajB5ZWVKZE5MYmt1RTVRTXU3NlJ2OThG?=
 =?utf-8?B?UjB3bEFMaGhJcFhqd2EybzA4Tm1hVXkxckMrV21TeXBmMUYyVFNjNGMzUVp3?=
 =?utf-8?B?UUIwY1dEK0N6a3lOeEpKMGh3aG9RNGhWZUFIdjF4SUxhRHRrTkc3OG5aVkl6?=
 =?utf-8?B?VDgvdDB2d1BnRjNjb1REYUtMd0tlREFJUFNNTkVIYlJqTFhxeXhxUDZyWVVl?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wXLBtl3TyxCSH4uhZ3q5bMoWvlddckmQ/59xO25W7gZ/xIOhjwlMg0OD2Ve+XEDnOg0QWiDy//g1tozTXgeCZ/zaipxYIXODewHFDBDBhHQ91XDx+YpdlziXzc/vD6xAoGtvMrJvgE7HhVJ3gDCR6rffKClJOu5yAyiQTkJsn9wdHU15czmSJaYBBm6BeLhapPFv+GKz7lBxNs+8n26CjxqMhN7MHTyohVT7RvsvlxW2tvk+FLE9IccjQRR43B7l1ST4wHObZHZAepGNNup2hB5dMwiWRnZrLad9yBFzlO703SO9lC7pwWO7zRoLDo7PsAvBDAIZJHEVhPzGW4YaX39kAcz0IVvONqAi6/l43itjuRePGjU+WhwKNWkx/3b4ppJkhd9h80+LXUFb7K5zrAQBWSnnfBGsOEwoqTzs7yOBoiVkOvSroVd+W61fpiqMRAD+JKpMHZ6lnfo2IvLI6GF7DABhCn/hdHtBmHHYL5cxPjyksc3MoaplAgLQpnC3KsHh3aWXCouXwuKEtW10lbEHzY7CZ4T0/cL0iCGI5pPZycTXEDpgiBW0NFVI9B7vMaI5yHYM3MAPwq4hdFS2mkYbfAFLrer0/7Rqxm6GH0FDAK+0gF89y++qtKig9GPnN41R97KdHqu8P3vWvgYF53PqGwXiCd0066Z6x/Sl9p2CR4Bnou0/zJSmZPFM9i5pLQijTwJlZAXYVeWVcP1wkOrLCd0GDNs7wEcsv3haGeheIEAosybz31SlsSCFlBpcmJ6UzwKqGKAPAGmqLuagIKm55Y3abhaQDkc154SaYA2TKEvODZMHEQ0yyfQE2K6uVPyzQ26tTo/Bp/Y+jEhmBztjfsyWQLCV3R7eZVGCXN8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b6867e-6294-484c-bd99-08dbbf466aef
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 10:42:16.8175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLt2DI3/TfjAkdQjq6zukoBL+z72uKpcWdjtMUCJn6WA+qJQM5hMK51gxgPDztARc7n+7ft5j/zDNI5qMuP5Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7486

On Wed, Sep 27, 2023 at 11:55:19AM +0200, Jan Beulich wrote:
> On 27.09.2023 10:51, Roger Pau Monné wrote:
> > On Wed, May 03, 2023 at 05:54:47PM +0200, Jan Beulich wrote:
> > I guess we should also zap the runstate handlers, or else we might
> > corrupt guest state.
> 
> So you think the guest might re-register a different area post resume?
> I can certainly add another patch to zap the handles; I don't think it
> should be done right here, not the least because if we see room for
> such behavior, that change may even want backporting.

For correctness it would be good to zap them, but there's no rush, as
I do think guests will set to the same address on resume.

> >> @@ -1568,6 +1572,19 @@ void unmap_vcpu_info(struct vcpu *v)
> >>      put_page_and_type(mfn_to_page(mfn));
> >>  }
> >>  
> >> +/*
> >> + * This is only intended to be used for domain cleanup (or more generally only
> >> + * with at least the respective vCPU, if it's not the current one, reliably
> >> + * paused).
> >> + */
> >> +void unmap_guest_area(struct vcpu *v, struct guest_area *area)
> > 
> > vcpu param could be const given the current code, but I assume this
> > will be changed by future patches.  Same could be said about
> > guest_area but I'm confident that will change.
> 
> True for both.
> 
> >> +{
> >> +    struct domain *d = v->domain;
> >> +
> >> +    if ( v != current )
> >> +        ASSERT(atomic_read(&v->pause_count) | atomic_read(&d->pause_count));
> > 
> > Isn't this racy?
> 
> It is, yes.
> 
> >  What guarantees that the vcpu won't be kicked just
> > after the check has been performed?
> 
> Nothing. This check isn't any better than assertions towards an ordinary
> spinlock being held. I assume you realize that we've got a number of such
> assertions elsewhere already.

Right, but different from spinlock assertions, the code here could be
made safe just by pausing the vCPU?

Thanks, Roger.

