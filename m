Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA476CD432
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 10:15:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516101.799682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQxM-0004bE-Hn; Wed, 29 Mar 2023 08:14:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516101.799682; Wed, 29 Mar 2023 08:14:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQxM-0004XZ-EC; Wed, 29 Mar 2023 08:14:56 +0000
Received: by outflank-mailman (input) for mailman id 516101;
 Wed, 29 Mar 2023 08:14:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOlf=7V=citrix.com=prvs=445effd08=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phQxL-0004XT-DG
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 08:14:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c66e4cc2-ce09-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 10:14:53 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 04:14:31 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM4PR03MB6998.namprd03.prod.outlook.com (2603:10b6:8:44::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 08:14:30 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 08:14:29 +0000
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
X-Inumbo-ID: c66e4cc2-ce09-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680077692;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=SZBSP41HP5lPnlHFPOFQaj4Q6AHyvqmSulO6E/pbBRM=;
  b=AswAKM7EMsyRhTxIou5yhxRlHze67HdYpnazQyElVkmyT7+aD3q56NyT
   TgJzJaPamaFGdG+TEY/CRjtNqW6WeGpBCWDaBQeScPuw02gAEg0mfw8Y/
   5Kv0V+Xes4waDlxtHFnN6iT2aHCcPy1mXUP03nHQGgM46qNwHjC7NhosW
   E=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 103502715
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:nRFGdK11+8o7ttwQU/bD5cFwkn2cJEfYwER7XKvMYLTBsI5bpzwBy
 TAXXT3XaK3eZWajeNl+OYjk80wOv8LXm9BhSFc6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdkNKgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWEdh8
 NkGKys3PkqvpsaxwJKYVup2r5F2RCXrFNt3VnBI6xj8VKxjZK+ZBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxpvS6PkGSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03bKXx3yiBer+EpWG/fRSjQKJ2FBNKy0dZ1md/fiSkEGhDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY86jOqzq3YHIRNTVaOXNCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlVpjukLdgpJNj9EWbM=
IronPort-HdrOrdr: A9a23:M8JPuapnAlQP4VpZztTfVJkaV5tBLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJE800aQFmbX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 xdmstFeaHN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMD2CAJsQizuRZDzrcHGfE2J9dOAE/d
 enl716jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kfEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDymIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/L8Zan4pWfjbQ9kJl5bhHoe
 t29lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nteIIlXRQXaYXdbcUh40C+0F+FosGAUvBmfYaOd
 grKPuZyOddcFucYXyclm5zwOa0VnB2JRuCSlhqgL3m7xFm2FRCi2cIzs0WmXkNsLgnTYNf2u
 jCOqN00JlTU84/d8tGdag8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hwzP22eaYP0IA5lP
 36IR9lXFYJCgPT4PC1rd12GkinehT/Yd2t8LAS23FBgMyzeFKxWhfzCmzHkKOb0oYi64PgKr
 OO0altco7exFvVaPl0NjLFKudvwFklIbgoU4UAKiazi/OODLHWncrmV9uWDIbRMF8fKxPC6z
 04LXLOGPk=
X-IronPort-AV: E=Sophos;i="5.98,300,1673931600"; 
   d="scan'208";a="103502715"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FM8z3jgZNIuyyHHiqwR6xs7j8HCM90bq5B3QdoB7LSApi2X3lxq08i9cw1hFWeb1i7BVvS3ASxzl6WHtaJlIDWimRebvghEOMigTrFcpe5u2O3ubrewx6ArTNlI8VBtT2NOasgadnOQT5GhyMrQWowDvBcNLcV+WxfEylyOb4yau5hnkq6mWYRGzAjU9pVoenWbQUOPE88tyobo6zSIPbC2ykrNxcMg8O5gfQcZDy0v19rIUt/qxnNQQwQzdQS1UCF1V9IZCq+LFJKWo8eVG2wUbNZjU2ldQh5HOKEu9wtMoLi46ewMXygnB75O/VP9Y1gapx9IaMPVC2VPmcsdoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ffu8UzT4EyYI0xuDQ4y8k/B7uxLU278y9xgVNBg13Y=;
 b=SwO+kG8ox4KKSzszGfxh1OT52gAmEWHqu6gYnXoezYfePsCKjZl4QqGNyiN7Ka19CQrSOYnsO0i9UstMlEaA3FmNABUngk3iMY4wEAZqh8hGVLiisjE5SLAnp+Nrbaads5NddfdIaaRO2wxKN2UNuTdjeRhrjvyVbp/b38N+JGp9NWJW8b7Sn3zBLqttekAVcBIPZS7zJEGuvjnS8niSH44ShcrAZRzj/sYn6JGrJI3XAiMlfFsoaGFGGWtkE/MX2P8/IEkc/iBiYlNLwFoRW6sCzU6UfuIYNPOv5inA6WLlP3SBX/KMYVUDcFawxqSpi0wgKypceX9IxatSdZGvYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ffu8UzT4EyYI0xuDQ4y8k/B7uxLU278y9xgVNBg13Y=;
 b=mXrzzk/ahUu+PlMsJVnMqnTTppR3S89drKPomiKio8vuAg6RM5+Qdno6ma3RJMhFl+o02RwAEFISkWDYVeHy6ruXCNpPubYgkfpFYgXM/S2esUJQyU5doZ8fEtL+a2PcNpgdG2F9pl6DfkrmPOddMsW0r/Pr8WmW1z+S9mNB6ik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Mar 2023 10:14:23 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] vpci/msix: handle accesses adjacent to the MSI-X table
Message-ID: <ZCPzX+fpEhQUxZZm@Air-de-Roger>
References: <20230324121738.4920-1-roger.pau@citrix.com>
 <85db0f26-7f3b-7956-a25b-f5b09db217f7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85db0f26-7f3b-7956-a25b-f5b09db217f7@suse.com>
X-ClientProxiedBy: LO4P265CA0217.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM4PR03MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 706a8d9a-6998-46ef-53c3-08db302d9e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q9SE69WSyzKFp9q9gyB2eJUdcX8IWLFZgarEbSvyB4AImhivejmXLGuTuC4SjzuJu46cMhxnKn1SPY4m3EWQNP3Lb6yLO8VHVVrWypdJ/wK3ztF683zv5gJ0Sp9wIlqwNA0+Cp/6/wTl01SYcvpwAXUzIGWGPY8EdDAcgJhybtfbHIUscMlojCFprdJXdezfr6bSQuaIBgFrEhiQiljs0pZsCP56EVluh/VQvLbJeTRv9PJiSY6PN03hFDhtokj4sanCTRACYRORYsBN6/nGbUKbZzIXiLStQAtcm/fnvbixyE0nprNYC2iv/wW+pmLjPBU9BVAdITjnkP3DpOE1Loyjn112LW0fIS8TsOcPGxCaghGHv3DcWE3H1uCADwKE0I0UxBxGrVBvNU6TniWVHuVxT4b7/kGVpXOpIhW8VeG9k2Cq6SwX4bKcyvGwXfWf7LXveF7CDblFuoHq3XGAFQ2Kwe9eQ/bIFHGS8zXJUR0mwQtNxfek1kJKbzKSLTOVJ9/iI1gehLKJdnCNYKLEalAabCgpKnIiVynUNaVIvkTFbui980KIaA61MvIbZw79Tw08kpWWFvwFgMzzxHketbYIhNDsk6EFJG6YAds+2zU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(83380400001)(6506007)(9686003)(6512007)(26005)(53546011)(86362001)(186003)(82960400001)(38100700002)(41300700001)(8936002)(85182001)(5660300002)(6666004)(478600001)(6486002)(33716001)(66946007)(4326008)(6916009)(8676002)(66476007)(66556008)(316002)(2906002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1hYTHZ0UE94elBmWTQ5bmZ3OTBFT01tWGxFTWtPUXgybDlHU2NqSlJOWGJ4?=
 =?utf-8?B?dnNmUG5UTXduVnR1QnVNU2Z3dXM3dXdnWFZjeDZuODZKRndxYzJsR0xBSjBG?=
 =?utf-8?B?ZkpUMENVd1ZhRmdKaW00cXZkanZ4ZnpxeE9YalZCRVBQNlBZeXV6aStqN3ps?=
 =?utf-8?B?aTNvQmtLbC9wbGhRa0NHa2lRQlVGeThaNnNIWEpYU3p6NXdVbk91dm5tb0x2?=
 =?utf-8?B?Uzd3MGJ0bXFtTkdieHRjWlN4SW5CaEdHN0Vhd1QvQnRlMUxxMlErSFgwd0ll?=
 =?utf-8?B?QVJrWmhOTnkrcEViZW1KR2plYVBBTmxTOC9BaW04WmtCWXcwTFBqYUZETXB4?=
 =?utf-8?B?cXNCelNKZkxlZ1hrdUZERmlWNHR0enIrdnI3bGcyc2FLS1hQeUt5cDhram9I?=
 =?utf-8?B?ajlZT0l6bCt6QTJyY1Q2ZHpud3M3d2xpSkt4QTNONlFsQjJVVFpSRlluZ2JJ?=
 =?utf-8?B?eStxTXlTZEtoY1BnSlJGZFlJcTV1NCttd1dYMC9STFV3aG5MTHlaNWQ3K3ZH?=
 =?utf-8?B?ZGkrNDZlZkUvMC9lMWFjUEJvMG5aM3g4QkhyeXNoM2pZa2EySUo0WDN2VGVi?=
 =?utf-8?B?ZVR3U1lrT3p5Q0xsMGZLbVNQaUZpN3VaeFR2VU1qa2M0Wm9zajZMWjdlQWx4?=
 =?utf-8?B?R29CRko2b1dKNlRQWUlGb0FaNFppM0JjM0s2ampsb01HWjV5Skg4WnZTZzlt?=
 =?utf-8?B?bjNZZldET3BSUExYbzUvTlJuQzdFWFJKWTZnQWRQV3J3RDZHYU9VOWhqT1hi?=
 =?utf-8?B?em1FYjVpeVRQYUl1WUtlNDBpejlMNHdZSm11eEM0MFcyY0NDMkxPbmg3Sllu?=
 =?utf-8?B?RmswVUNHMWlhVU4ybkNlRUNiNStoc2xFaGtFZk1sbkxlYUtSSCtyRExNMzR3?=
 =?utf-8?B?YnI3VW00eS9CMkd3RjRwam84VlEzTDBnVXJXbFdzZVY2WVk4WHFMU0FZWWhv?=
 =?utf-8?B?TWd6UTZGdkVmSE95WERMQ3JVRGVMampLSjl5SElITGJzU1ZRSUNoN2FrSUVG?=
 =?utf-8?B?VUtDU2J5QmFaWTZoaVRDZWdzbWpNQ01jeEVBRzZybXZXbzZ1Q0g4ODUvZGtQ?=
 =?utf-8?B?bmxiK1lSQzU5bkJoTVlZckN0TmVjWUtyQ2dNWml2bGNoU3oyQllFcFp5MGYv?=
 =?utf-8?B?UnJRejUzdlFWdmZkQ2t5OVhQbllxWHV3aXZENWxlNWlFTjZndnB1Yzgza1R0?=
 =?utf-8?B?SXJOc2JHUXpQS0Qzcjk0eTBOZmdTQ2pPL1F3eGtrSlFGcVVscVg3b2ZncTFx?=
 =?utf-8?B?cVM1dzJJaWlMVXU4VXEybFA0VEtuWXNsSzFyK0wxN01MRTRSZC9lNkVPU1Ur?=
 =?utf-8?B?eUlVMlNWdG5ZcTAxZjBhemd4UTZKeUcrUmQrZkRhUDdtTW1OYmVJSmdiYjdB?=
 =?utf-8?B?NUJHT1ZLaVFLd09sYXdnd0lqUDY3RituWTVIOVhWdnBBOVZwUHh2RlY5aTMw?=
 =?utf-8?B?MGxvUzF1aE5tK25WQVkyWEQrRHErLytkU1lmVkhQWDdDeU1oZDI4aHhNTVc3?=
 =?utf-8?B?N01WM0M3cjRSeTRvbkFkcDZoSXptVFg1WU10ZExrWDh3dzk1MGMzUGdmelVZ?=
 =?utf-8?B?eDhxL2g0WG5Ta0tycXhBMEFUUkVOTDhndEpOaFZxcHJ5aXh4UmRqMlA0V012?=
 =?utf-8?B?YzI1NGRwa25OOUgvd2FIWXQ3QldUd1p3UUxjMGhqdyt2TEtQS1dnN2tGQnlu?=
 =?utf-8?B?VGdxd3ZNMllyTUpKK2lGWEVEZTJZY1BPbEs2V1NPeHpQNlNPMk1nRzl2SzFh?=
 =?utf-8?B?MkhrdFUrVDl1UnlIT1RUdHg4eDdtTkQvbVhnV0lMaFgyZlp3eHlocFN1TENm?=
 =?utf-8?B?eTV3M01kY1htVmxPdllRcTFnVC9aTm40UkdDdldYQ3pVelpudThUVWNvei80?=
 =?utf-8?B?K05uay9od1JsY3NHWFoyWHg3VVhIclU1U0RFc3dFRjUwZ2NLRHYxa0ZJWXcz?=
 =?utf-8?B?NVBpL3hXODc5R2l0ano1SzQ3dWY5NUVvblJaRjZMTGJBQ2tweWpBaVA4TVdy?=
 =?utf-8?B?VUVsWDdtTUdOOEkrYXg5SDI3MjVmaFE5ZE1OdXJ2cUtMdkpzNVQ4STF3R0VN?=
 =?utf-8?B?dTN5NmpJMXM2di9Nallhd01QbUlTZXdkQ1ZwSGIwVVgvU3FRUzRKSXJrQWQy?=
 =?utf-8?Q?Bn19IbDqEvwyJP6X6zOeZPsIg?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Di0TtcGF99kz76t0x65DHEd4ofRIF6WraIkvC6/rJVpRAN0R5bgTEIQP+hLa6OplStMEavzOVbIV9StkoqOYr4OEZGB4ifB9HRcSvBXiqyoML4U417MlFxbID78CnBBoqA0OAoaF/G3QnCu90gld46L7Lm3J6SJ40/8hrFV8OcKJljp+MhqdI2Oh502odRkTx17PQUaIoKzREHHGUHSBNt+sY9t5NahrjHZ7q5YonIhnpUHTmXvL5GJey31ComFvvl+mG/x893kHQd54n3K+a9/BHzxHTMmsemovjnn71uAhqDbT5viXykM9a0E5QE6WVKcS5py47KUubM2JuQMZRtBrmroHX0HLgFYPel95Yclz4q6OMyMMVk7Bxln3eoRC5g2xJgqAjtSwI7EdXLwi5zhJMBHpBz3lbHOPNOxKs3TnobxomwTOL1cqwPLPCkKz/MF8dtX4UM5Idw+nrcw6oKB8fy1Utz9g8xoWIY+EKeP3lkhxMlIkOV6UHltn7ZmPXbkm6ZMsIpjzbxJEKF8hLqDM+/tfDOk0Bp0Va9bgv/lBCwRKn4avAX+rOGVvpl/WOmgbbpgt2b0MP/g6chsZNeu972LcuaLfpPJSUjdFLXs91+pkkiL1H3eG36XTUyiEZDp/8IQMHfmP3il/eFLoEHoxefggqMHRm+HkcRVL6zrP3Yk8Tgy3q0L1v5Bz2DARAcfAPBYxyLnEzepzNP8sDYu0Bd0DDJY0EBmKGQosgtghsnryf8F+Hae9hMXvqw+ge83q7lF/odiSTRjd7UyNVQ7Z24CKcY9GsTAGB39fzu0=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706a8d9a-6998-46ef-53c3-08db302d9e80
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 08:14:29.8771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYEgG3DGhRwrUKeOBJUc+uFRKUm/pe0inqRUXOmxIupOGKrLKiSk45g7VDp2irRDYskivYGZX8vdG9Uy7hqMLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6998

On Wed, Mar 29, 2023 at 09:55:27AM +0200, Jan Beulich wrote:
> On 24.03.2023 13:17, Roger Pau Monne wrote:
> > The handling of the MSI-X table accesses by Xen requires that any
> > pages part of the MSI-X related tables are not mapped into the domain
> > physmap.  As a result, any device registers in the same pages as the
> > start or the end of the MSIX or PBA tables is not currently
> > accessible, as the accesses are just dropped.
> > 
> > Note the spec forbids such placing of registers, as the MSIX and PBA
> > tables must be 4K isolated from any other registers:
> > 
> > "If a Base Address register that maps address space for the MSI-X
> > Table or MSI-X PBA also maps other usable address space that is not
> > associated with MSI-X structures, locations (e.g., for CSRs) used in
> > the other address space must not share any naturally aligned 4-KB
> > address range with one where either MSI-X structure resides."
> > 
> > Yet the 'Intel Wi-Fi 6 AX201' device on one of my boxes has registers
> > in the same page as the MSIX tables, and thus won't work on a PVH dom0
> > without this fix.
> > 
> > In order to cope with the behavior passthrough any accesses that fall
> > on the same page as the MSIX tables (but don't fall in between) to the
> > underlying hardware.  Such forwarding also takes care of the PBA
> > accesses, so it allows to remove the code doing this handling in
> > msix_{read,write}.  Note that as a result accesses to the PBA array
> > are no longer limited to 4 and 8 byte sizes, there's no access size
> > restriction for PBA accesses documented in the specification.
> 
> I should have (re)checked the spec. There is a restriction, common to table
> and PBA: "For all accesses to MSI-X Table and MSI-X PBA fields, software
> must use aligned full DWORD or aligned full QWORD transactions; otherwise,
> the result is undefined."

Thanks for noticing, I really wasn't able to spot it when I checked.
I guess because of the intermixed "Implementation Note" sections in
the spec.

Will amend and resend v5 then.

Roger.

