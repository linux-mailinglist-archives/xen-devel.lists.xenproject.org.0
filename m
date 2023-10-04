Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBD7B79D9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 10:15:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612433.952327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnx13-0003ci-Rs; Wed, 04 Oct 2023 08:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612433.952327; Wed, 04 Oct 2023 08:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnx13-0003bC-P6; Wed, 04 Oct 2023 08:13:57 +0000
Received: by outflank-mailman (input) for mailman id 612433;
 Wed, 04 Oct 2023 08:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O8y1=FS=citrix.com=prvs=634504905=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qnx12-0003b1-VL
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 08:13:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3ed1867-628d-11ee-98d3-6d05b1d4d9a1;
 Wed, 04 Oct 2023 10:13:54 +0200 (CEST)
Received: from mail-mw2nam04lp2168.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Oct 2023 04:13:45 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6573.namprd03.prod.outlook.com (2603:10b6:510:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 4 Oct
 2023 08:13:40 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::66ca:3a42:baeb:9ecf%6]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 08:13:40 +0000
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
X-Inumbo-ID: f3ed1867-628d-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1696407234;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=jj+YFxbeddV10CbJV7fsht+hAg1WQVJIegWrdF2AqiY=;
  b=dwa84STyhLGwDifZJbXOAl23POL1QZgbwlZj5SdvhUpCZejxrTt/eFn7
   2heRh6TjNqaXoqc6Q69x+weCSSt3KA2fSTTa2tg/T2oEG3AYAOvdwY7m+
   YIae4Bbo0opAtyuN6xoMuvfXnTEEBtkV/o9JXIwWtgwa4K7Uym+vL/Uuk
   8=;
X-CSE-ConnectionGUID: CFHO8LoNSLm6XA0Un6QEog==
X-CSE-MsgGUID: /cwS0uhtTa+lF1umlES/0Q==
X-IronPort-RemoteIP: 104.47.73.168
X-IronPort-MID: 127337172
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:m8psua0DKxLcVyBHbvbD5UVwkn2cJEfYwER7XKvMYLTBsI5bpz0Fy
 jQfCmGBPfjeamryftl1Oo6//E0PvsXczoM1TwNqpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliOfQAOK6UbaYUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb83uDgNyo4GlD5wRmOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfKk9u0
 qw8LxY2ShXdt8vu/bTlc8RriZF2RCXrFNt3VnBI6xj8VapjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6KklwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r13LCUxnyiB9h6+LuQsfV1uwWOxnAvAV4SewKmpP2UsQnmYocKQ
 6AT0m90xUQoz2SmTtT4HA21plaB4wZaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBLSd0rLSfRHaZ97GVhTC/Iy4YKSkFfyBsZQkY59jupqkjgxSJScxseIa/g8fpAzj2z
 3aPpTInmrQIpccR0uOw+lWvqwyrop/FXwsk/DL9V2iu7h56TIO9bonu4l/ehd5HKIuaVVCHs
 GIzh9mF7OsOAJeOkwSAWOwIWrqu4p643Cb0hFduG9wk6G6r8nv7IYRIumggdAFuL9oOfiLvb
 AnLowRN6ZRPPXysK6hqf4a2DMdsxq/lfTj4as3pghN1SsAZXGe6EOtGPCZ8A0iFfJAQrJwC
IronPort-HdrOrdr: A9a23:Ci6mJKD8cFPwXf7lHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: =?us-ascii?q?9a23=3AzdOU5Gi385wsqkLsySI/1UPxGzJuWVP96yf0JGm?=
 =?us-ascii?q?DLWM3eJTNdFnOwY5jnJ87?=
X-Talos-MUID: 9a23:JoqotwhLPEKAub1Z27oMfsMpc8x32PyzCFwxmNYClZCZMChdAHDFtWHi
X-IronPort-AV: E=Sophos;i="6.03,199,1694750400"; 
   d="scan'208";a="127337172"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AT5AF2caR99mazJ7PEtr3f8+sq0bH97qzur+rbRnxhfZ54sguC5y/iq8d1xneQNk2Z0EWiSKrz1EywKDQngVnv2WVCzMYM59RBOIavgEa7nbOc+jXfPYv4YrU2xtH8a2IJVYVNGMNKN9D/qbugWOV8qEClncn0BNuSptQyN56U2jGH9rJZA4OPeOsi4cE4/hN4n/qS01bfDQ5is7Vff7O3YX7sAwOgZEYCpXCZHQutYDZFKqKFJ7a4/4/TVtXUlIUFZ5tU/LjuN6+Rg9CVfMT+DEfuewtZUWa1+x8MTQgnXJJaTlFHmVxtSxwFI9c/IGXlEFWim4u/oArAu5RHOrRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kp65wMsZlM232+31C8VxqOQgiHgmxud/yoiUbxhO2Pk=;
 b=MurMGma2ld67sBiLQjg9JLyeJaxWUgYhPBU4PMNStk6Bx+kke4U6oPVZJrv3q6j5zuKScx0tLaZNZ0ztwqBCBD0WncXPkQyS8fm4dslmxt9HljTzbY35QGumI7e4Zd83xvN/INGUiPIoU/CLR1tC2NAPa9DyMopH+p8CWqVm6nqTAWQV1iZcQ4Nnl0d7O0vmLfzpPKfjPK0zxLFRR4TxTlolvOzA8AoXBoHMZ5wfHforZCorQg9HVT0FU+IUY7zTLte4bpeJ9Dbk1f2Ky51mPVJ9EtlMaSN2qvglDHtNsHB7yRosZd8w2PMrgIq/WIa0AnIbejhoOuzNAe5oKrhAYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kp65wMsZlM232+31C8VxqOQgiHgmxud/yoiUbxhO2Pk=;
 b=xkRESnr39SfC1a9rqc0a8Lx+AX2Q82O3mdbxpoeygmX6XYRDa9yeF4btl1Ub0HJBceCNVHxY8GbpLJC4cGl2Y6SRqr3SwaNmJAQNB7c2cX174GeZFlosjPT3uy7HMxb8rZdPlUAfDCYDm8kUCm0mpdCdhJIGI9QwabtTPlpQb6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 Oct 2023 10:13:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: Issue with shared information page on Xen/ARM 4.17
Message-ID: <ZR0erl_OSkNgIQjx@MacBookPdeRoger>
References: <ZRY7Ls3p6M6pakMq@mattapan.m5p.com>
 <ZRvQNKyYpLDVTs0i@MacBookPdeRoger>
 <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZRxpC7ukhiYvzz5m@mattapan.m5p.com>
X-ClientProxiedBy: LO4P123CA0459.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::14) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 889a87ac-eec6-4ac6-47f3-08dbc4b1d148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	28fUrvc3rAXu8AwxzJHHYhjK/I3FIqel+bSc7g+1KLKuYTa3Y7HT8fc9Q1aItnO5b6A+vhxKU/WNTaNbWGwjI5WTrTL6hfWATGfMaY4ks8a6VHcWYomNaEF1gctH5AkHPm8YlR3bluEjP5HrswLo2YfYmzhsIBU5Xr5Rr9O+eS70519z2FCy3PDilvBtDX1E4IOIxOE32VeWuXZYTW8MJOqRJ7pwzPdgpgaIcbzrgBon5OMWnIXwQNHoPZn40kgyhxinaihJFXH7Ck6xP+PP6oSpfpVq3h9anbm+E8lnpjcbIoIjy737B3O3QqXw7BPdEt7UrUs2fD+q2+jlaKJsMRzc3YgQBlrArFA8JjQ0oq1E8CTZ3HF147cemhn1wtuPmZLiCMpbI6CO5wRuLrDaA12ym0TJTOZzlhbBDel61aoXpzftaFhJr8cEed1bnRVXY282uIQMbrdqb9QRUB1cJdOKg1Z2CO3ZSGRmZ6zOcfgM2rySoDLDVcA9pmGxsPj7DJx01Ps2Ku2J/YT7MtQFkYjQLbGxjoYvB0Rumye0xUGXhPIRboJnM3KDcNZ7XfSY
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(39860400002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(316002)(6486002)(6666004)(66556008)(4326008)(2906002)(54906003)(66476007)(8676002)(66946007)(33716001)(8936002)(478600001)(6512007)(6506007)(41300700001)(5660300002)(85182001)(9686003)(26005)(82960400001)(86362001)(83380400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlUrNEY2bURSUFlLRlZ0aytvVW9EbUdkRWhNUGVuVDdHTWJlajRFakFtQ3d4?=
 =?utf-8?B?VHJoV2prd2NoVVRxckcwNTcrcmptRnF1d09XaTgreC9IZ2FIYml1djdURWpX?=
 =?utf-8?B?dm50ek96T25zQlBnd3kyNTR2SmxVdy84dFNJcEk3TjlBcUNqZHZqbVhaVlRm?=
 =?utf-8?B?L1RaYnRKRDQya3U0SlpwMkpLalEyT0Z5dGl4SEQxVVVGQWdUcWZ2Qys2L1FI?=
 =?utf-8?B?TGk2LzZKaFdLei9tRW00bndZcGhYN3lWNFgxY05RZE00elZDb2JqREdpR2Fm?=
 =?utf-8?B?RWMxV1Z4MXZkdlNmZDFLMjAzcndzeEN1TnRHM1ROa0FweCs5ei83am1qODZx?=
 =?utf-8?B?R2p3VDg4dCtuTGdmWFl5cUx2ajlLeHc1bzE1WDdwM0hZalNKTlk2VWxVT04x?=
 =?utf-8?B?L3FGTEFNaHhmSExDZSs0dGpZVEpzRUpVVVZxaCtrSmdoT0Z1Q0lvOWRQZENG?=
 =?utf-8?B?K04xdlpwYXRjQWVBckJGOWlMSVgyNUtweWkvMlN6dHdaZ3E0UmZDaHB6OFpr?=
 =?utf-8?B?TXZlNEpFaDRKQWltVEtmL3dERmZ0eFVVVDc2OUxPZHpYSElEeVdmU3dXcXJs?=
 =?utf-8?B?S0JpNjM0SWREQUZBU2c4WXhhS1g1dW9nOXN4dkdFY3duK2N4MU5ZUWJpd2lP?=
 =?utf-8?B?RXJUSi9GM1FMWVhiM2U3ZjVVWEVyajMrOGs1QzExZkdrNWpobG9xNFczbE54?=
 =?utf-8?B?ZHJLc2orZDJoZEpsUXczbFJaUzdSNjJXSE9SSXZKd2tDZnkvZUpDNFdsckgw?=
 =?utf-8?B?N1h6UHFUV0crWnQxNytuSCszNEVmSTk0ZElIN0lSUTYwMjl1TEtxcFFIakEz?=
 =?utf-8?B?aVd0bTBvdGZkcVM4R2RkK2czYmgwM01QOGpWY3FKUm05Nml2d0VzVWtkQUFJ?=
 =?utf-8?B?akxsbXBRWUdFbjNKNC9ONldMdmVhcWNXbjFtWmNaM082MmIvUk0wNnZrNGhV?=
 =?utf-8?B?SmZvLzF2ZHJIMXdxa2dTTVd1NDhFeEZhMERnc0FNenR0WkNEbWY4TkdFcGNi?=
 =?utf-8?B?QVE1MVpHZlZFQkRtTmFPeXZUZ3J6Um1yN1dzdVpuOEFNTnhLRFo1ZDFBMWRp?=
 =?utf-8?B?a1NQOFJsVktTcXY1YWFvQzhHWko1cU5HYWlEdGliYkowandsT09MS3ZSTTFH?=
 =?utf-8?B?M1JYWWZvd3FrOTByUTNHYWVBaCtzNzFqcWJXYlMwVUZ5ZmY1YXVacmcwelcw?=
 =?utf-8?B?eTgvZXk0cEI0aEl5VTFoZDhvRzdiM2s4cXJGRlk0YWc0dUhDL0liRzFBNE83?=
 =?utf-8?B?Q2RIalJnMGhlWThoVFZxcTZKOVZOd2lhZkVqRkdvd0dQdmZBNFBqdlgyNDVQ?=
 =?utf-8?B?NDNITENHTjBCclpndmJWM3RYWllIREFEK1ZzdGdEM2RwR1NOdWR2TXpjY2FV?=
 =?utf-8?B?aFhRWFJYeFl0OVI3M1lKNUV1SGJyUjNmeVBMMXlMSUVmQ2FJQVkwblk4VHFJ?=
 =?utf-8?B?Y0ZqWi9NcSs3RXh3V1ZDbGQrVWRXclJ3UGRsUktJRGhQcThFdVlyU1d6SFNF?=
 =?utf-8?B?Z2IzQkFwaCtGby9tODE5UTRpR0JRaG9SdGlIeHVmVkNsM0wwZGRYcWRMZEwr?=
 =?utf-8?B?RmRoS2k0a3VMY2ZZSFN2ZTJUVTV4R1NPdmVFMDhVTkE1U2NvaHo2LzF0Vk5V?=
 =?utf-8?B?SWExZHE2c1JRbllHL2lVMElZQXBIZnVBT21FczBWRlBVNXk1cmJCUHFlNXJi?=
 =?utf-8?B?bGNoWGpjZ0c2anB3YXBKdVBheWd0ZW5VRFRLY3JFTmtWNHpiMzZnYys3VnBH?=
 =?utf-8?B?RlFUQTk0dURET2M0SHo3S1RLVnl1aXlVS1JiZklBdUxXa1pnRUV5YXFqQkFY?=
 =?utf-8?B?Z0ZaVkJGV0pnSWRHdDBsem01OGMwTjFiOFFzWm05REZ2cGxVRnpsdzVWeU5X?=
 =?utf-8?B?ajZvUU4yNnJhQkV4eHFBQVJSYlE5ZjYwSi9oWXp0WTRmZVNBVENodndvS3Ur?=
 =?utf-8?B?U2dsMFU3Z2x4eFlRZmo3MWp1WTFLc09kdDFYTjlFcjIxckUyeU9pUDUwUjY1?=
 =?utf-8?B?TTZhenZGNmtmaGViYnp2RXBaMjM5OWIwZGF2RXhWVG9ZUjg2WC9OeGx1S2pT?=
 =?utf-8?B?RnNsUVBxeWQ0WlF4Vm5RYXFEZ2VJUmEvaGwwZW1nWklVWWJ1aUhXUlpydmYz?=
 =?utf-8?Q?CCw0rIJn1ZcV0DhQProDklH/0?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	xaJc0QPmBlcJfNqWrm65kpVzInsxSlokKeg7oGw1W7RpUx3K9PH7NChPR2VWd7pbj8yPr4CCSVQIO6cx3z904MPK2fJhFHuMKm5mnjafq566rlrkIx+v/tAjGbM6r+t2xHRQtQW7JlU+6tUQfkNgv5IDORX7XsLW7xGJzU4FZ4ze0JjngZxnFJ3OABRiS4tvWB4In0lak9of2BhnSfY844/mhN98h9RjsoEKbWwN3F9rbB0WmWfD67nvFaieIFvluGUXgOvamDSBc/q+8UMVaN9pJuNjMR2ObWnRB9Q2C0TNbdSdic6Et8NS4lN4w3780gpW8nq26L+0JH396MqZyVBSKDfGdLo3tZQT9x/Zt4b7rMp5cA81nFUIW7c+OBiSmcMvTMw7VttK0dJmrMhNxB0S7wwHXLR4YVkyTnCWUfa6LDw3iF+Wf8MNFD0KfIDyLyvtZkGjvAHb6nkM00xAuotxEBAHJjr+XlwdNeqDNHfpe48+OUp5zSqk5h02+yrdqvsfHEm+DI77PsQ8+0IWlPKOjHD0xaRZQgR3XhEjuyMk9cwPzcG4+OimTbXzpt27tGpASZSxw7YbcJhpggb4QGoH4QOo060bPceNRtEYMt4lComZoQ2xYxAynqtFLG1cz3kYIt7148bcOAhnk2CS00Dw8yVuup4W7iUPz8zA7hYvpIpJbWi0pNf5bioDWRzANrZJDuZrErLbtCGJkreSOCLDxm/EpSMGnZqadU1MtB2/AhX4PKvSPYDYbTTbNYOHsRKWh1vbPQCSwNWmVaX5eY8MCkDSF73FqTiGICQEZjwBneWDcjDesyKszO4Q0pNF8HmDh2Pn6U2T+DUnHp4ZTAjycPYj5Zpukdk1eFn7IHSe9w8N0MyhPzSBfK6T4HHrZNwbFjfrbv2pk2i49XJf9A==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 889a87ac-eec6-4ac6-47f3-08dbc4b1d148
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 08:13:40.5501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlNRbmMNF2MvztacnABsk166ZmAMqA+iYxLHxmvVoTL8+HnsN+P4F+d061asP6hQY8X3uSUekO3/vLLZlkrpEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6573

On Tue, Oct 03, 2023 at 12:18:35PM -0700, Elliott Mitchell wrote:
> On Tue, Oct 03, 2023 at 10:26:28AM +0200, Roger Pau Monné wrote:
> > On Thu, Sep 28, 2023 at 07:49:18PM -0700, Elliott Mitchell wrote:
> > > I'm trying to get FreeBSD/ARM operational on Xen/ARM.  Current issue is
> > > the changes with the handling of the shared information page appear to
> > > have broken things for me.
> > > 
> > > With a pre-4.17 build of Xen/ARM things worked fine.  Yet with a build
> > > of the 4.17 release, mapping the shared information page doesn't work.
> > 
> > This is due to 71320946d5edf AFAICT.
> 
> Yes.  While the -EBUSY line may be the one triggering, I'm unsure why.
> This seems a fairly reasonable change, so I had no intention of asking
> for a revert (which likely would have been rejected).  There is also a
> real possibility the -EBUSY comes from elsewhere.  Could also be
> 71320946d5edf caused a bug elsewhere to be exposed.

A good way to know would be to attempt to revert 71320946d5edf and see
if that fixes your issue.

Alternatively you can try (or similar):

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 6ccffeaea57d..105ef3faecfd 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1424,6 +1424,8 @@ int xenmem_add_to_physmap_one(
                 page_set_xenheap_gfn(mfn_to_page(mfn), gfn);
         }
         else
+        {
+            printk("%u already mapped\n", space);
             /*
              * Mandate the caller to first unmap the page before mapping it
              * again. This is to prevent Xen creating an unwanted hole in
@@ -1432,6 +1434,7 @@ int xenmem_add_to_physmap_one(
              * to unmap it afterwards.
              */
             rc = -EBUSY;
+        }
         p2m_write_unlock(p2m);
     }
 

> > > I'm using Tianocore as the first stage loader.  This continues to work
> > > fine.  The build is using tag "edk2-stable202211", commit fff6d81270.
> > > While Tianocore does map the shared information page, my reading of their
> > > source is that it properly unmaps the page and therefore shouldn't cause
> > > trouble.
> > > 
> > > Notes on the actual call is gpfn was 0x0000000000040072.  This is outside
> > > the recommended address range, but my understanding is this is supposed
> > > to be okay.
> > > 
> > > The return code is -16, which is EBUSY.
> > > 
> > > Ideas?
> > 
> > I think the issue is that you are mapping the shared info page over a
> > guest RAM page, and in order to do that you would fist need to create
> > a hole and then map the shared info page.  IOW: the issue is not with
> > edk2 not having unmapped the page, but with FreeBSD trying to map the
> > shared_info over a RAM page instead of a hole in the p2m.  x86
> > behavior is different here, and does allow mapping the shared_info
> > page over a RAM gfn (by first removing the backing RAM page on the
> > gfn).
> 
> An interesting thought.  I thought I'd tried this, but since I didn't see
> such in my experiments list.  What I had tried was removing all the pages
> in the suggested mapping range.  Yet this failed.

Yeah, I went too fast and didn't read the code correctly, it is not
checking that the provided gfn is already populated, but whether the
mfn intended to be mapped is already mapped at a different location.

> Since this seemed reasonable, I've now tried and found it fails.  The
> XENMEM_remove_from_physmap call returns 0.

XENMEM_remove_from_physmap returning 0 is fine, but it seems to me
like edk2 hasn't unmapped the shared_info page.  The OS has no idea
at which position the shared_info page is currently mapped, and hence
can't do anything to attempt to unmap it in order to cover up for
buggy firmware.

edk2 should be the entity to issue the XENMEM_remove_from_physmap
against the gfn where it has the shared_info page mapped.  Likely
needs to be done as part of ExitBootServices() method.

FWIW, 71320946d5edf is an ABI change, and as desirable as such
behavior might be, a new hypercall should have introduced that had the
behavior that the change intended to retrofit into
XENMEM_add_to_physmap.

Thanks, Roger.

