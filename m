Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD8241484B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 14:00:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192671.343230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0uh-0002KG-El; Wed, 22 Sep 2021 11:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192671.343230; Wed, 22 Sep 2021 11:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0uh-0002IG-AD; Wed, 22 Sep 2021 11:59:47 +0000
Received: by outflank-mailman (input) for mailman id 192671;
 Wed, 22 Sep 2021 11:59:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mT0uf-0002IA-FS
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:59:45 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93150dfe-1b9c-11ec-b971-12813bfff9fa;
 Wed, 22 Sep 2021 11:59:44 +0000 (UTC)
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
X-Inumbo-ID: 93150dfe-1b9c-11ec-b971-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632311984;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=0TyejDRDGc7iyeKK8R6mgvQf6yLT6LqkSaIMAzfY578=;
  b=b3km3c9fyah/MMadc8Xh7+zMwg9pTVqcFV3CzwJ/V2pbKmCPZ/0C5n5g
   OpsFMbnZlfjf0MGj84ESJsvRQxT5M8TXZtP3Ho9VMTLIXmzZetX46SmEM
   pdMoF4yjv1NYuKLR7d4N/qtmFIIzTqV3tqQ8cey9U1zgmM18YKxczyb5/
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VynMwQLnE7NCGGc0ftO6ymvXmv1wD1Po1NkQkvdWWQ1elp6vTn+Ac8DyeENdl59A5e06hsq2Mb
 i99IaWAM6vBqV4HkIUweHpATNaLWDOiugffpeGOHsdsbuaTUXnAhPY3WKChaUzdsYsio+95GrD
 lX4rTKxvlHzzQO1KGlh8LhIdyXfKxVmfSjojM+PQlPYQQokmjeF0Yn6t7RB2nLj8QAPwuxEa7T
 dYY+A5H/P06zfz7epDog7OBw1zo7fmZe/8D728XkV/5uVFpLup6RQdhavjh5mXbypFX4CVdPgQ
 jhgQPugiXjEVcNQ+xtm610hn
X-SBRS: 5.1
X-MesageID: 55114958
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UFFDdK55dYESevzq/gqsxQxRtCbAchMFZxGqfqrLsTDasY5as4F+v
 mUaDG3XMvqKMWvwc9p/PYW1o05UucOBmIVmTFBt+X02Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVIMpBsJ00o5wrZo2NQw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 +lOlJq6RwYTOZLSvLgibzJnKAFuFPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgWpp35wfQKa2i
 8wxQyZtS036bwF0E14wA8McxuyJllzzfGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6Iq
 2SD82nnDxUyMN2E1SHD4n+qnvXIny7wRMQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaPgh09XdBeEtc91x+plpXoyDmiJngtG2sphMMdiCMmedA7/
 gbXxImwVWIz6OT9pWG1rejP/GjrUcQBBSpbP3ZVE1FdizX2iNxr1nryosBf/LlZZzEfMQr5x
 SyD5AM6jq8a5SLg//TmpQ2b695AS56gc+LU2uk1djn+hu+aTNT8D2BN1bQ8xawbRLt1tnHb4
 BA5dzG2tYji961hcRCwrBglRun1t55pzwEwcXYwRsJ8plxBClaIfJxK4SEWGXqFxv0sIGezC
 GeK4Fs5zMYKYBOCMP8mC6rsWp9C5fWxSrzYugX8M4Mmjm5ZL1TcokmDpCe4ggjQraTbuftuY
 cvEKZn8Uyly5GYO5GPeetrxGIQDn0gW7WjSWYr631Kg17+fb2SSUrALLB2FaeVR0U9OiFy9H
 w93O5TYxhNBfvf5ZyWLo4cfIUpTdSowBIzsqtwRfemGe1I0FGYkAv7X4LUgZ406wPgFyraWp
 imwCh1C1V7ypXzbMgHWOHptX6ziAMRkpnUhMC1yYVvxgyo/YZyi5bs0focseeV17/RqyPN5F
 qFXe8iJDvlVZC7A/jARMcv0oIB4LUz5jgOSJSu1JjM4esc4FQDO/9bleCrp9TUPUXXr5Zdv/
 eX421qCE5QZRglkAMLHU96Vzgu87SoHheZ/f0rUOd0PKk/ix5dndn7qhfgtLsBSdRianmmG1
 xybCAszrPXWp9Nn68HAgK2Jotv7E+Z6GUYGTWDX4azvaHvf92unh4RBTPyJbXbWU2atoPeuY
 uBczvfdNvwbnQkV79ogQugzla9utcHyo7J6zxh/GCSZZlumPbpsP32a0JQdraZK3LJY5VO7V
 0/nFgO24llV1BcJyGIsGTc=
IronPort-HdrOrdr: A9a23:H+QAG6gbirak4j2nIJP0qPenVXBQX0F13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskqKdxbNhR4tKPTOWw1dASbsN0WKM+UyDJ8STzJ856U
 4kSdkCNDSSNykFsS+Z2njALz9I+rDum8rJ9ISuvkuFDzsaE52Ihz0JdTpzeXcGIjWua6BJcK
 Z1saF81kadkDksH46GL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftzLLhCRCX0joXTjsKmN4ZgC
 T4uj28wp/mn+Cwyxfa2WOWx5NKmOH5wt8GIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmRsXue
 iJhy1lE9V46nvXcG3wiRzx2zP42DJr0HPmwU/wuwqrneXJABYBT+ZRj4NQdRXUr2A6ustn7a
 5N12WF87JKEBLphk3Glpn1fiAvsnDxjWspkOYVgXAae5AZcqVtoYsW+14QOIscHRj99JssHI
 BVfY/hDc5tABCnhk3izytSKITGZAV3Iv7GeDlMhiWt6UkXoJgjpHFogPD2nR87heQAotd/lq
 P52gkBrsA6ciYsV9MPOA42e7rBNoX8e2O9DIusGyWUKEgmAQOEl3el2sR/2AmVEKZ4uKfa3q
 6xFm9liQ==
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="55114958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCfynWNEghLVfmU6NvvcQq3t5d09L1ulPV3NJL40J/tMe2jV+TjIB0+CR6F1vtSn06kLndCdwFbo7m/IMjfaTe57C9Cb/ZbHr/jd8sSgOaVN3hKC8Wqbio8PENPsxd7NOmfKw1yOFm6iwREiw9+1oxQhkMCbcQSHWO8j+rpHBhc3NzN8Qq4lTTZBDB5sN3+/mLbUDeYwOijZbWOJqd7fBxITbR+uXlXoq7pOLYUaSd/4POGScWsUPWTQDgCABIDWQ8Tx4WjrylUGdq8az7tKQnEc+bPB5aJHZetnt8ARyHx5OPgmbFRvmRiVVq480cLZ2u5VGfUyxyZzBMTmR+XadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=jcxbyfjmLXpGC4OTqSxH5SWNRDCeJod75k5ifshS7ME=;
 b=DGrrB3zLtSSG3G+mPLfmzA6lelxCJEQ9GWEVq4KKdBKyIq9LeBFygm28I+XqG4c7fBYwzVsi6nYlZOrjgWOFZis/9pG/3ihgydV1fhs49MdpIQo5zFAiuTEoMa85c8pxSLx/aUPXS/lSP21lF9mJpU8XDFPY3OTe4d6PNWYSTK1PXZh5kGEJh8u2epmEehAspIaUl2GLQNkZ9u/UbqfqLneOebrrZVX98eXgOoUR1bRggv/jQMTuSOT9mRj6QacQZvHNjDLk74GTEjW421GvIwoggtLT9yV5dET4kPmjJYWYtjPBUskSDpVXTAtG36x4u4IjETms/n91M9ZEP9ivlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcxbyfjmLXpGC4OTqSxH5SWNRDCeJod75k5ifshS7ME=;
 b=ssGdBxmq9cKWk+XjBm1fCO94wek++uLDO0Khz7cSx+jAKllGY1E9LJjfIy1JuD1t/PWPFpJmowhpt1O3Df7QgShy7ITHiva6dVfFOs1MPn9ZRmRwtir2GtxGyCdN4+++XqED0QAq8CssNxJC+pwjBRqRZ71ksw5HOqVVxeTVcYY=
Date: Wed, 22 Sep 2021 13:59:33 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/9] x86/PVH: improve Dom0 memory size calculation
Message-ID: <YUsapfsfoL+ODa6+@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <562a9ee5-102e-ee25-e4cd-721e44b7409a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <562a9ee5-102e-ee25-e4cd-721e44b7409a@suse.com>
X-ClientProxiedBy: LO4P123CA0207.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 198073da-c64b-4fc8-5c12-08d97dc0743b
X-MS-TrafficTypeDiagnostic: DM5PR03MB2972:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB29721084AC4D6E8B1DD71E398FA29@DM5PR03MB2972.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S8U07EXYl1veRrXjNCgPS7/kJ9xfo9zVs2QrXX6FCN+/3/jbxpN0IpmdULMDngcyMiQwNi9LEiudVJYnrh5/KLB+pIyE0h20ieFlJdLY5G48majzldR2cjugYgGuq43m9Nt3JbuMVAYRx4/G+a+QpjhGdcyX6HNJyH5jSPEPIVUpJQyzjlKBhIcYW2CYWMUROTnQj1Z0hrLaVLmoSb3BoCRix+QvOB055nOKX/E3g7qfypXZYrdkrFOlwzzwaHpa2saNW8hrpyIhFl5jClWmfc+IYL8MW1sBpTlHpd2MLDp3/ENo9FgwaYEmr6g9IUC0x8fc/ZhldcECe6xme4kpVQur6pkw4NM7Xkold0dbabUawlqKEe+64Nc34yOr0ARW5/DNpznIlAQlkG1Uib7FQP7WflzYQvp2s8HkoPRBqHmaaGG2zpGooLntVnxxt9VExqowmtZoTR8sA+aTgOz+xLoFQI4vmGqh4MxMmpzSEe9kcu0KJ8wAivtnk4llLDxf2+DJIBangm9X5JXN+y/g4GTSAAV3jTA+7spOIph4lMfBiSxhC0UXPTMA501snEsyPyjQG2sQA5Cf6EMLL/qoF1st70+Ag8rDrN+2j9FWryibV0/0KiKEOTX+K994k+/pmhF6svjm7Gnw08tKsNzaZoqqZk7JPKFFUWND5umurKaADPZ42pIcdwnB/aDnlwjrOLwEqwufpbnAucoSDi+0SQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(9686003)(2906002)(83380400001)(5660300002)(6486002)(8676002)(8936002)(6666004)(85182001)(956004)(186003)(316002)(54906003)(6496006)(38100700002)(26005)(66946007)(6916009)(508600001)(4326008)(86362001)(66556008)(66476007)(25903002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjJtanoyU0s0ME16Vmw2TlB2dWJVUlFqdzVDRVpsckZCV1FiSkhaNjMrL1k1?=
 =?utf-8?B?cEdZakZuNmNqUDBtRU8vbDFWRmczY3RrVVN5VitRbkNJWDB2WkV0bHV4VXNv?=
 =?utf-8?B?bjl6NjB3bUpyYzc3S0EyVUE1TlE4K3ZyMHc5RzhFRFN2SC9TUWxOZlFMNXhS?=
 =?utf-8?B?dnVwUW50QW1qbkpnUjZ6ZytnYU01c0dHTDJLaldGQWVGUk0wQzN4c2FWY1VL?=
 =?utf-8?B?dzJaYmd1UmltUThKdkpSTHBvSFF0SEJiZGlUVHc1QlVkaUFKTmd4VWQrT1FV?=
 =?utf-8?B?QnFudmxLbHFVNDFFR0lFSnZEWk9xZ0xZUVVSS21TekxJWWlWRWFOdUsxOGlM?=
 =?utf-8?B?RlZud2tHSEtGUDJJODVGOHlXSVJnNUFTdjFOSjNadTlsWjNTNEd1emZWbDU1?=
 =?utf-8?B?YmZGTGxPY1YzSFNXZnRVOTgyakpiQ0pPaEFhL1BhWWRVc0tzOUl1M3hOTWxY?=
 =?utf-8?B?cnZkQVhNUGx6U2EvUVlHVlgxaUxUWjVzaUVRcmtzTnNTTGh6S2RqYW5rUkRB?=
 =?utf-8?B?S3NRemJtZzNGTWRaNVpkdm5aZFJDdzhyK0Vlc3FSakk3MzVBUXZGMUp1U1Mw?=
 =?utf-8?B?dWZGTTUwVHRPaVp0aDZvejJZU3pVMW00dVlnZWlKRldrUEhmUnRxazg1RG1l?=
 =?utf-8?B?WWFEb2MrTkhTLzQxc01wM3Vhb0luaUxBYmFGdG1HNCtpSDNnR1lUcDlqQUNm?=
 =?utf-8?B?ZUh3QWpSZ3ppbnc4d2pnRkxla1B4SDZadGRxWG9KS1ZWaTJpYnVPeGNtUzdG?=
 =?utf-8?B?eVpONWcwY0syelFEa1ZaMzlNMUdOUVBlVzU3QmdaRmhSMHNwaWVHWnMyMnNh?=
 =?utf-8?B?Um5BY0NNaW42ZC8vTE9MMVVUaXhpVVBpZHl4Y2NOckNvSXZCUkN6aEI1OWhi?=
 =?utf-8?B?cXU4WUpOcXcwOTVNWHBRQkxtbmxkNkxiNy9ITmU2ZDg4emwyNG5nRExsUWhD?=
 =?utf-8?B?RlROSGZSVi9ORVJqK2NXeUs2dHlBT3FpSWpJSVU2YU5Yclc3aCt5RWJoRjE3?=
 =?utf-8?B?c0tRTS9aanJTczZVVG1FZDViREtUbmo0TlJLYU91UkxCQmpXaGRpQ0JudWh4?=
 =?utf-8?B?L1BmdnY4cjNPK1JvcWxDZngwVmN6djhNWmljUmVNRjdlYzVpQVdQYkVLZmww?=
 =?utf-8?B?cnkzdDNjRG91NHgrM0xlODBDRzNML1IrVWd2cmwybDJEUWVnWUxtVG5CdVRG?=
 =?utf-8?B?NHdXUGVycmxCZmlmblRPZ0RrNFZxeFY5N28reWMrRXBLUW85YkRnS1U1Uk40?=
 =?utf-8?B?OGR0Uy9jRmU3M2piTXozK1NFUTBlYWJmNGdlUitFMzArcXdEeDlWRlJRd29s?=
 =?utf-8?B?Um9sbUxJRXB0RzZpWTMyTXlNNklGQkxHQ0lyUjlqY0ZvRUN3VkxsZ0tNcXNH?=
 =?utf-8?B?V0QrNHN2bnRIUzUveW9hV05vVFhvTHo0VVlpSjc5QnpJc0g5azBIcW1KNmxJ?=
 =?utf-8?B?bXlhL1lTUU16cG1xMGVqYjBtQXNGMlN0RU95V3NDM2VBUys4bnk4OWI4MENG?=
 =?utf-8?B?WmR0TmF3cEJPbDhlYURjbkZCNTE4Mk9meFFBaTUyMHVUenZWS1h6eUFNelBK?=
 =?utf-8?B?dWlXWkhNQXU3Uk8rTFVhQnQ3aWkvRE9TMzl1d1pWbExjblZ5WDFQa3lLYjRW?=
 =?utf-8?B?YjNSVHh5eGxYNFFsckZTeHoyaHdRaGVXbXB3NnZSY2s3Q3AyaXBGNUxwZjRa?=
 =?utf-8?B?b1EwNm1NSmUrbTRCM0kraVo3RTVqSGhtck41azJ1WWRqRFNvTlUvN3dmN3J1?=
 =?utf-8?Q?BBZx4DbxlbohwnOGLEi2kk6FVdol1sGQqA4Vdni?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 198073da-c64b-4fc8-5c12-08d97dc0743b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 11:59:38.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHT1HVq8ak4RBmJk4RPdZwe4ywJzTF2C5gvW9h1HqyDwtOZJD/U3svkGwiFxQqyygNZ5542ztCqcV39eW4dwPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2972
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:16:44AM +0200, Jan Beulich wrote:
> Assuming that the accounting for IOMMU page tables will also take care
> of the P2M needs was wrong: dom0_paging_pages() can determine a far
> higher value, high enough for the system to run out of memory while
> setting up Dom0. Hence in the case of shared page tables the larger of
> the two values needs to be used (without shared page tables the sum of
> both continues to be applicable).
> 
> While there also account for two further aspects in the PV case: With
> "iommu=dom0-passthrough" no IOMMU page tables would get allocated, so
> none need accounting for. And if shadow mode is to be enabled, setting
> aside a suitable amount for the P2M pool to get populated is also
> necessary (i.e. similar to the non-shared-page-tables case of PVH).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -318,7 +318,7 @@ unsigned long __init dom0_compute_nr_pag
>      struct domain *d, struct elf_dom_parms *parms, unsigned long initrd_len)
>  {
>      nodeid_t node;
> -    unsigned long avail = 0, nr_pages, min_pages, max_pages;
> +    unsigned long avail = 0, nr_pages, min_pages, max_pages, iommu_pages = 0;
>      bool need_paging;
>  
>      /* The ordering of operands is to work around a clang5 issue. */
> @@ -337,18 +337,23 @@ unsigned long __init dom0_compute_nr_pag
>          avail -= d->max_vcpus - 1;
>  
>      /* Reserve memory for iommu_dom0_init() (rough estimate). */
> -    if ( is_iommu_enabled(d) )
> +    if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
>      {
>          unsigned int s;
>  
>          for ( s = 9; s < BITS_PER_LONG; s += 9 )
> -            avail -= max_pdx >> s;
> +            iommu_pages += max_pdx >> s;
> +
> +        avail -= iommu_pages;
>      }
>  
> -    need_paging = is_hvm_domain(d) &&
> -        (!iommu_use_hap_pt(d) || !paging_mode_hap(d));
> +    need_paging = is_hvm_domain(d)
> +                  ? !iommu_use_hap_pt(d) || !paging_mode_hap(d)
> +                  : opt_dom0_shadow;
>      for ( ; ; need_paging = false )
>      {
> +        unsigned long paging_pages;
> +
>          nr_pages = get_memsize(&dom0_size, avail);
>          min_pages = get_memsize(&dom0_min_size, avail);
>          max_pages = get_memsize(&dom0_max_size, avail);
> @@ -377,11 +382,20 @@ unsigned long __init dom0_compute_nr_pag
>          nr_pages = min(nr_pages, max_pages);
>          nr_pages = min(nr_pages, avail);
>  
> -        if ( !need_paging )
> -            break;
> +        paging_pages = paging_mode_enabled(d) || need_paging
> +                       ? dom0_paging_pages(d, nr_pages) : 0;
>  
>          /* Reserve memory for shadow or HAP. */
> -        avail -= dom0_paging_pages(d, nr_pages);
> +        if ( !need_paging )
> +        {
> +            if ( paging_pages <= iommu_pages )
> +                break;
> +
> +            avail -= paging_pages - iommu_pages;
> +        }
> +        else
> +            avail -= paging_pages;
> +        iommu_pages = paging_pages;
>      }

I always found this loop extremely confusing to reason about. Now that
we account for the iommu page tables using separate logic, do we
really need a loop here?

In fact I would suggest something like:

unsigned long cpu_pages = 0;

if ( is_iommu_enabled(d) && !iommu_hwdom_passthrough )
{
    unsigned int s;

    for ( s = 9; s < BITS_PER_LONG; s += 9 )
        iommu_pages += max_pdx >> s;
}

[perform all the nr_pages adjustments]

if ( paging_mode_enabled(d) ||
     opt_dom0_shadow /* shadow paging gets enabled later for PV dom0. */ )
    cpu_pages = dom0_paging_pages(d, nr_pages);

if ( is_hvm_domain(d) && iommu_use_hap_pt(d) && paging_mode_hap(d) )
    avail -= max(iommu_pages, cpu_pages);
else
    avail -= cpu_pages + iommu_pages;

There will be a slight over estimation of cpu_pages, as the value
passed in doesn't account for the iommu pages in case they are used,
but still it's better to over estimate than to under estimate.

Roger.

