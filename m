Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004DD3ACA77
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 13:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144533.266016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luD4X-0000N2-2h; Fri, 18 Jun 2021 11:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144533.266016; Fri, 18 Jun 2021 11:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luD4W-0000LB-Vg; Fri, 18 Jun 2021 11:54:04 +0000
Received: by outflank-mailman (input) for mailman id 144533;
 Fri, 18 Jun 2021 11:54:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luD4V-0000L5-2a
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 11:54:03 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a86203d-3c7f-4a84-b293-b1aa12ff654c;
 Fri, 18 Jun 2021 11:54:02 +0000 (UTC)
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
X-Inumbo-ID: 0a86203d-3c7f-4a84-b293-b1aa12ff654c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624017241;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4J/pXe9Zt62kIfRU5iQIK0K/WoifOrN+5LbiCwaizSU=;
  b=JFnVoenskxfB1h8MQZvpSFfVdbz5RP5a1uI4u3BiFHS8YDaGF0awgUZZ
   WvKFodJqG0pX47omIVsDXX5HdzWRRhUjEXDl+mKAuG6ddXaJL1TZmKT/8
   ZRvZ3gf+WmwfsW/CgPFc3C+RMRONQgHk5rcf9LnZ5zHc+YpHlZJbwDMBa
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 7R8d5lzPhwnbscsORUUMIlLwzUpjHBZxqTm8U2sH6XAjzh6q+hTTUeURg0CQIVPaO+QGkjDEc0
 nxd1XUlYM2C9G1VDfjJ1Pw2EgD56aTVgnPotWylCJSnv+2hbycwR8O+DzkdCMO0ijWsU76W3BT
 IEECIuKakQPaHOll5nzpLspMPyXCq7jxfJyVmAE/jxUMNiktRRoLjo1Nh5xBr3Gh0J4FoQx9Ri
 8ajzkoj76EhC3fvlm8eribNUP6a9o/c0F2Gk2TkmBUCN/CYdOcxLA2QuSrTXIag+w35aPpnjvm
 ku8=
X-SBRS: 5.1
X-MesageID: 46522827
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BeP1JK5wuVjk2rs0qgPXwVOBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwXJVoMkmsi6KdhrNhQotKPTOWxFdASbsC0WKM+UyaJ8STzJ866U
 4kSdkCNDSSNykJsS+Z2njBLz9I+rDum8rE9ISurQYYcegpUdAG0+4QMHfpLqQcfng+OXNWLu
 v42iMKnUvbRZxBBf7LdkXtEtKz5uEi0/ndEFY7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpizuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyGIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ+O1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh6LD3xHklVqvoIRiKsbzOSI
 JVfZnhDbdtABGnhknizy5SKIfGZAVpIv/uKXJyz/B80FBt7TxEJgUjtZYidtppzuN3d3B+3Z
 WzDk1frsACciYnV9MLOA4/e7r/NoXse2OCDIvAGyWoKEk4U0i94aIft49Fld1CPqZ4kacPpA
 ==
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="46522827"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abu0kwg3UMTF0deug6nVxTOvsZzJaU6clh5fltpHGYf7kO7f7WxV5a8OoycgRrkkyiRWwe/0+WmEPLF/fvs1R7NTV8uzDrio3DA24FSV/ohfpdqG6pYC7L9S46lVfECquZBtn2R0rUUq1DiMokrBKwcGCbN+I+loVgz2Dk9KmBtdDngZ5oMb4P+Iqu1/qsNGIcryIsB1RBju1H2HY4Pu1NnLvJfiEbBo/pnlFZQO7F8veoHJB83uib6qR26lODJR1FWnl3i2mapekW+hQjvREbZCksb1iAr18+bvBwgfXyjFyVKRWt5Zdt8kQsLD3F7s4ICrDEKlmAigWOrCmyf1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PhQsZuKUsAcWxEPaVSWy0dBjr4KgKkVrqO+WXylHhQ=;
 b=Zmj9ORv0h+WOJiG4+cbSuBnUQ/lYz5ugWQR+B2YxjFGnGAKTnAeyLqI41F4zRAh9dHHSi1lpd5XXibms16GTvmt3t0jE7AJOXR7h15JC34TW6+rxWnlk5C7Zxj7UJfpARofnje3yNken8rvr7OgRkERrzkMjnpIngoxkazfog3u36elYEy9vXCKgMdxCSuP68QLPPqDwwTmBFELFr4qwSkhtuB93IhxGQBeq8hdX7C5qlXstQ3SrLBoRxRiyM5/rMqcEAknVy+Gw3jfhm23IChadU3XlH75n8h4dak4BjU89m/RYRWyEUq427GGdr942N2nOuZJFB8Cr5y2F4Za5NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PhQsZuKUsAcWxEPaVSWy0dBjr4KgKkVrqO+WXylHhQ=;
 b=cL06WBzzVnrhktQl8PCRO5U25gsDJM0JYPW/g4FzFnhyMkj49ptO+ofOxSHxBM0XEylJRerTFrohGd1c2azAolHywn2A7M6krUAuRZyrEL6KrE5fNArsKqsuFSWcAIhnAXqPZzDIMoMFWZfMO2zC/INWvg/bNL49L1IBT3PcrfE=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-4-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/6] xsm: enabling xsm to always be included
Message-ID: <a8d60866-b9d9-8a76-3acc-703799b204b6@citrix.com>
Date: Fri, 18 Jun 2021 12:53:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617233918.10095-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0082.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b697015-3717-4eed-17b1-08d9324fc14d
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5837:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5837109526936BA29C103108BA0D9@SJ0PR03MB5837.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flPA3IGSUEKnJgCLbji8MMJPb+sQbtv+rUbeQybBekNS5oBdX6gz1FP0YFFQXtSq7iaSZZAblyT9zRSj0X4dkPiczy27P5t5AngKAViowfxgvpRS2I323D+JqdICYodq1KvIiKeKK8okhZ2S+X3niAMfo/AI/RPrWQdu+FQUENeV3rzz1qdKWI4BZnYGhiCnv7+t2eXS5Oj5wJ07vW/NJgRZVCtL7bzGwO8xMjPxnBBkoRj0/SmkCM1igkO8WQqWryJ95NeOuOsmqV6JNlb9+piOvPBViPomXDGiJQoV1ktQX2FDrgNKJxVvQjf7mXr78JSil9BHobglkeimewWxXHzcgHsY8Nu3sT99YcHQJkVrX52HN1A65+skVQPdgjx5eaKkihzDz9xDte9xCORk96PXqiZ8NrE5mvInvsUk9tePrLoELaTOIH/49+HcoqfLqVA5R8zh2YEORTpY4uAKdRMYmKNCbwsBxCFKxjHfo71BHteBpD2+fXgjJtYL+UPFy4RV+9WLsiFG1ifBmYwY9sXtcrKBXGcnUB+Q0cw0hhKbuC8mL/FIt8qBe0r6PZtb8rSQkpTy35zMuABFaVs1mT+RlFUjEALWv5ZUeBKYi+nEQxgVokm3nOunMOvM9MJXRLnJX2AlNulTUjoq9yV/9//3vaIFgpw4gqMN2IUoAtyt1dvOobhP5c05NfnVUCy2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(6666004)(83380400001)(66476007)(66556008)(7416002)(16576012)(2616005)(956004)(8676002)(5660300002)(66946007)(36756003)(31696002)(2906002)(38100700002)(6486002)(316002)(8936002)(186003)(16526019)(53546011)(86362001)(478600001)(31686004)(54906003)(4326008)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWtJZjRzaGYrWXk2WVZudWRiR2l2NjNhTWlzc1pWaksrZlZOREticnc3U1lE?=
 =?utf-8?B?OW5oWXNzeVcvYWllanI0WUFqVHk3b3BtSmlJd2lyZUdNanlHSWtteGg2aVBN?=
 =?utf-8?B?WS9vZ0tCSStTeEREY3MyNWUxRVNVTlhmbWlLSHh5OUFOb3JqaE1UZGdlanl1?=
 =?utf-8?B?dFZRU1U3UXl5VmU2YUdGeGx1c1Bmam1ubTlPbnF6Q093RWgrK1g2Qzk3Rm1h?=
 =?utf-8?B?ZCtzNUZRcjRUUmdLU1ZGdm94MGdnY29nZnJ6UlJPWlcxLy83ZCtqcDRzR2th?=
 =?utf-8?B?Tk9LTXY3YVp0MXVNTFVGamdhOGhBT0RGSFJlL0hlR0F3VjMySG95UXR3Q2dn?=
 =?utf-8?B?RWhkbk9RamM1TER1QTBDNWZhT3UvQ1RIOXdSL0lKRkc4MDBxaSt6NlluSjhk?=
 =?utf-8?B?c0hmd09uTUI5SmdkbEUzVjR0Ulh3WHpmdHRqZ0tBTGZFUnpoL1ZNSDZxeTBJ?=
 =?utf-8?B?dEdFaGtJTFE1b05BY0pOSmtPdVVkaWJNZmNOTHZkYTRoNGo0a2V2bUVyWVhB?=
 =?utf-8?B?VVdYSll6c1pOMThUMDRSd21oVUlRakhsa21aZ0VlU0diTjdSSHUwVmg0K1BI?=
 =?utf-8?B?QWNSRXlkaEgwMjAxb1FnMDh5bjh6WEszOFgwNi9ycFFzRnBQbW5xSER3M3hu?=
 =?utf-8?B?bGxaeStTVmdrRVFtVy9OWkxzOWwwOS9iZk1WWitaSkNZNGtQTnBiNjJ0RE9O?=
 =?utf-8?B?a3VRaXNCYThhMlp3QnRwUXZMTXgzZUZCQ2JJVnRidStYdy92QWxJT083bzZR?=
 =?utf-8?B?WmRVZm1vTGQ0dHp4TDFLWXJ4eGhsMmdJdUJaRSttMDZxZVoweklObDdWZVlh?=
 =?utf-8?B?R3VHR1lCbjFZY3NPVXNoZURRSjNPZHRHQjEyMVI0SzBOYlc2TjBpeUhQWXBl?=
 =?utf-8?B?NjJnUk9TSElDb241RlR1Tm10NXMxSU9TL0N0QktLT1N0VE1EYWdDSVA2VERM?=
 =?utf-8?B?WGdaNXBHdE5LYWg5T2VualNZZGxJenBUdXVVNHpETHZHc2RwQ25iNHU3ZGdW?=
 =?utf-8?B?TURoeTZMSnNjR09KY2d0bmorMkMvNm02ZXJYaGQ3TGZDbTQwczg3MlRXek5N?=
 =?utf-8?B?bGJNYjNyTEdBc1JmMTdPZnNHUzRQd05vekFuS2Z2RWgrY3dYQU5oT3VtK0Fr?=
 =?utf-8?B?STErcWpiZjdVRG1KM1FiU3MvRW9pZWRoNWxYOVA1U0ZwVWcyWFNpNmxNQVI1?=
 =?utf-8?B?eVhkNENtaUVmek53cDQ1RFhmWTVpYVlrUVhRb2lhN2RldzhaZHY5azN2RXlr?=
 =?utf-8?B?azdrd2VQdjhwelFvWWoyWjVmTWY5cWFMRFRwbnZneXRkbUtDWU02V2RUdkxR?=
 =?utf-8?B?Q2I5bjhmdlJlckxEM1BhcXhvbVhqODZNRWJZTWtPVmMzSVh0aGxOMnRJSFV5?=
 =?utf-8?B?VWVMVklNVjlGTXRUMXZrbnhMeUhEQWRzTEJIMllLalFwWU9BdFpuaERqTDhw?=
 =?utf-8?B?dWNBalVwOWZ6NG0vcXRtRnRjU0tiYldZMmVrZ2VNbnU3VWJXN2FDLy9uZ01p?=
 =?utf-8?B?Y2ROZ3hLSmJNMGQxSUc4cStuQ1N0ZWxOcjkwb21kcW16RVpzUldpYTloN3lR?=
 =?utf-8?B?NWo3dGNuME0yMXg4V2djRHJvS042SzRYUXZlTDJqQXc4SnAycmZGZmFva0wy?=
 =?utf-8?B?cHVEeFY3QTdwRmdnQ0E5bFJqclprd2Z3aVo0WitjYmtxeHFtRkxsK2R5LzJ1?=
 =?utf-8?B?bUFsTThhQURVVGZNNllueHpsdjFTb25SMG1BV0p0NWhGYVZpM0JyVHlhZ0N3?=
 =?utf-8?Q?ajlMkSvVW5ftqH7lm6gFDp7KKIspC5scJcaFptC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b697015-3717-4eed-17b1-08d9324fc14d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 11:53:57.9194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bho7SMvTWV2vCFzkbdqmnrZYI+vznFn5XuDgn0DGZ/aUgJlLx4q8J0dEpYIGxGLjjLB5v5KRIwl4817lyGkCd3N/py1sGQG3X1ExKUPYALU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5837
X-OriginatorOrg: citrix.com

On 18/06/2021 00:39, Daniel P. Smith wrote:
> The only difference between !CONFIG_XSM and CONFIG_XSM with !CONFIG_XSM_S=
ILO and !CONFIG_XSM_FLASK
> is whether the XSM hooks in dummy.h are called as static inline functions=
 or as function
> pointers to static functions. As such this commit,
>  * eliminates CONFIG_XSM
>  * introduces CONFIG_XSM_EVTCHN_LABELING as replacement for enabling even=
t channel labels
>  * makes CONFIG_XSM_SILO AND CONFIG_XSM_FLASK default to no
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/common/Kconfig            |  55 ++++-----
>  xen/include/xen/sched.h       |   2 +-
>  xen/include/xsm/xsm-core.h    |  26 ----
>  xen/include/xsm/xsm.h         |   8 --
>  xen/xsm/Makefile              |   4 +-
>  xen/xsm/dummy.c               |   4 +-
>  xen/{include =3D> }/xsm/dummy.h | 220 ++++++++++++++++------------------
>  xen/xsm/silo.c                |  17 +--
>  xen/xsm/xsm_core.c            |   4 -
>  9 files changed, 142 insertions(+), 198 deletions(-)
>  rename xen/{include =3D> }/xsm/dummy.h (63%)
>
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 0ddd18e11a..203ad7ea23 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -197,22 +197,33 @@ config XENOPROF
> =20
>  	  If unsure, say Y.
> =20
> -config XSM
> -	bool "Xen Security Modules support"
> -	default ARM
> -	---help---
> -	  Enables the security framework known as Xen Security Modules which
> -	  allows administrators fine-grained control over a Xen domain and
> -	  its capabilities by defining permissible interactions between domains=
,
> -	  the hypervisor itself, and related resources such as memory and
> -	  devices.
> +menu "Xen Security Modules"
> =20
> -	  If unsure, say N.
> +choice
> +	prompt "Default XSM module"
> +	default XSM_SILO_DEFAULT if XSM_SILO && ARM
> +	default XSM_FLASK_DEFAULT if XSM_FLASK
> +	default XSM_SILO_DEFAULT if XSM_SILO
> +	default XSM_DUMMY_DEFAULT
> +	config XSM_DUMMY_DEFAULT
> +		bool "Match non-XSM behavior"

There is no non-XSM behaviour any more.

Is it time to rename Dummy to "traditional dom0-all-powerful" or
something suitable?

> +	config XSM_FLASK_DEFAULT
> +		bool "FLux Advanced Security Kernel" if XSM_FLASK
> +	config XSM_SILO_DEFAULT
> +		bool "SILO" if XSM_SILO
> +endchoice
> +
> +config XSM_EVTCHN_LABELING
> +	bool "Enables security labeling of event channels"
> +	default n
> +	---help---
> +      This enables an XSM module to label and enforce access control ove=
r
> +      event channels.

Please use help rather than ---help--- for new options (its changed in
upstream Kconfig).=C2=A0 The indentation of the help message wants to be on=
e
tab, then two spaces.=C2=A0 (Yes, sadly...)

>  config XSM_FLASK
> -	def_bool y
> +	def_bool n
>  	prompt "FLux Advanced Security Kernel support"
> -	depends on XSM
> +	select XSM_EVTCHN_LABELING
>  	---help---
>  	  Enables FLASK (FLux Advanced Security Kernel) as the access control
>  	  mechanism used by the XSM framework.  This provides a mandatory acces=
s
> @@ -250,9 +261,8 @@ config XSM_FLASK_POLICY
>  	  If unsure, say Y.
> =20
>  config XSM_SILO
> -	def_bool y
> +	def_bool n

I'm not sure we want to alter the FLASK/SILO defaults.=C2=A0 SILO in
particular is mandatory on ARM, and without it, you're in a security
unsupported configuration.

~Andrew


