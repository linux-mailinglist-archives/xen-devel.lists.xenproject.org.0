Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC0F4377A2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 15:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215068.374024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mduAP-0001eW-VJ; Fri, 22 Oct 2021 13:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215068.374024; Fri, 22 Oct 2021 13:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mduAP-0001bn-SK; Fri, 22 Oct 2021 13:01:01 +0000
Received: by outflank-mailman (input) for mailman id 215068;
 Fri, 22 Oct 2021 13:01:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OBiv=PK=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mduAO-0001bh-9K
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 13:01:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f462fbe7-8c26-49a7-a497-6034438ba69d;
 Fri, 22 Oct 2021 13:00:59 +0000 (UTC)
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
X-Inumbo-ID: f462fbe7-8c26-49a7-a497-6034438ba69d
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634907659;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7qrrWglLfZm9wjXodColNFfYak6vODQdGBXV+AfFEgA=;
  b=AiqakuVESTAx3drPPUCLUynfILL93OLOFq5YMCRU/w+Z8LSQ5t+H9Xfs
   iVD6EsGTScUovExh6gIFEM73yyFKT2qh+DehRCLCNbLglJ2qDmlvKEHtO
   14RcG2grSSAqmv5LYIALnbJkzfW3UQ9/z3plOpFv29yozqYN9U3v0+yE4
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: UqWzL73xkdXDdmwk5bjX8ACNeYna+uCqMW8qQeh4o5euTTVCTFWdm70t+4iPM/C9wwyf+4m1Dc
 eryOmkfl4KjetD6sn4GeUtrvd9GFHO7woPlyXI6Yz4/1K6t2Dbsh4uDoljQYzeEu/g13fkWFVC
 eVsyyCfMAr8Oyeuktm52FzkSxgRmIj7JGBzy6iDgkasLn1pVN6es9tM7wIXooKegVVJxfegO6n
 +TIpZOo8ObMwJXDx8oHVhqdHt+E/n2WTddQhzw+kDoW5pNbmNUc7uDY49t/yginJrrw2cnUQd+
 w0+gxkgnyYx5Yr1lmvZUPU3J
X-SBRS: 5.1
X-MesageID: 56218149
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kKE8+KmAbK2mzBjGL0j2Ewjo5gwqIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXWmqGO/2Ma2P3c4wnPdiy90kHvsLUndBqHQc5pXs3QSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2tQy2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MhA76KWWAcGBbTNn+0gcF5qVHhAPbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQKiEP
 ppANWsHgBLoOhkXGEslFZQHu7n0iV6kaTZ+o1+LnP9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTuuKlg0SzX9ZeL
 U08+Sc0q6U2skuxQbHVRAG1rneCuVgHR9NaHuk+6QeM4rrV5wefFi4PSTspQMMinN87Q3otz
 FDht9jgHzBovZWeQGiR8brSpjS3URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDoaog4fLPyDw7
 AuTrS83upZUv4lS6aWkqAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bc97HFgjpU
 Gws3pHEtrhXXM7leDmlGb1VRNmUC+C53CowaLKFN6Iq8Cix4DaddIRU7SAWyKxBY5tcJ2GBj
 KM+v2psCH5v0JmCMfAfj2GZUZ1CIU3c+TLNDKy8gj1mOcAZSeN/1HsyDXN8Jki0+KTWrYkxO
 I2AbeGnBmsABKJswVKeHrlGje93n39unTiOFPgXKihLN5LEOBZ5rp9eaDOzgh0RtvvY8G05D
 f4PXyd19/mveLKnOXSGmWLiBVsLMWI6FfjLRz9/LYa+zv5dMDh5UZf5mOp5E6Q8xvg9vrqYr
 xmVBx4DoHKi1CKvFOl/Qi06AF8Zdc0k9ixT0O1FFQvA5kXPlq72vf5BLcNuIOF7nAGhpNYtJ
 8Q4lwy7Kq0nYhzM+igHbIm7q4pndR+xghmJMTbjaz86F6OMjSSUkjM9VgewpiQIEAStss4y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg69lOdwIJDXC2iCei
 1ScDyAHqLSfuIQy6tTI2/yJ9t/7D+tkE0NGNGDH9rLqZzLC92+uzNYYAuaFdDzQTk3u/6Cma
 bkHxv3wKqRfzl1Lr5B9A/Bgyqdnv4njoLpTzwJFGnTXbgv0VuM8cyfehcQW7/9D3L5UvweyS
 3mjwNgCNOXbIt7hHX4QOBEhMraJ28YLl2SA9v8yOkj7unN6peLVTUVIMhCQoyVBN78pYpg9y
 OIstcNKuQyyjh0mboSPgixOrjneK3UBV+Mst40AAZ+tgQ0ukwkQbZvZAy7wwZeOd9QTbRV6f
 m7K3PLP1+ZG207PU3svDnycj+NSiKMHtA1O0FJfdU+CncDIh6Nv0RBcmdjtot+5EvmTPzpPB
 1VW
IronPort-HdrOrdr: A9a23:le0zHKw/Sz6QCTq4FvLfKrPxvOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjkfZquz+8L3WB3B8bfYOCGghrUEGgG1+XfKlLbalXDH4JmpM
 Bdmu1FeafN5DtB/LbHCWuDYq8dKbC8mcjC74eurAYfcegpUdAF0+4QMHfrLqQcfnghOXNWLu
 v/2iMKnUvaRZxBBf7LeEXtEtKz6uHjpdbDW1orFhQn4A6BgXeB76P7KQGR2lM7XylUybkv3G
 DZm0ihj5/T/M2T+1v57Sv+/p5WkNzuxp9qA9GNsNEcLnHJhhyzbIpsdrWetHQeof2p6nwtjN
 7Qyi1Qc/hb2jf0RCWYsBHt0w7v3HIH7GLj80aRhT/ZrcnwVFsBeoJ8rLMcViGcx1srvdl63q
 4O9XmerYBrARTJmzm4z8TUVjlx/3DE4UYKoKo2tThyQIEeYLheocg050VOCqoNGyr89cQODP
 RuNsfB//xbGGnqLkwxhlMfguBEY05DWytvGiM5y4ioOnlt7T5EJnIjtY8idixqzuN7d3FGj9
 60e5iA2os+CPP+VpgNcdvpd/HHfFAlcSi8Ql56Hm6XYJ3vG0i94KIfs49Frt1DRvQzvewPcd
 L6IQpliVI=
X-IronPort-AV: E=Sophos;i="5.87,172,1631592000"; 
   d="scan'208";a="56218149"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn7xK+mQ/kuLljvk5YIPKwWswjRviiXm5jEDZSuOjBFdncUFcbRFdso1Q2e+YWu1kIfHRfqAWxg1XBIVK4tjnhRhMtgh5Uk4gkhaoUzecVbUayZIynSwlaW6Ubf4DjXdUSrYFJYJpykLFWeASvqVwhnB2fxNdscdK1HdIaOzmFlS187/tIAOdKrsTD7jcM7XlZwSfB9/iO1Qh56oBKw5JMRynbgIbwcLsqGBrjQC+7ZZDyOzTJd/OCs6LzKM3Xgigc9NomH99vArEefsY9D8NCQlKigl0NdpMcS5F693LE99rMUmPaBC9hzHtRDZOfs454BJCV/pV2HnewkwzJl0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9oVjQeHOPjwhu27cRAxj83zXUe3eQo7qXwba7aAw3E=;
 b=T0QybBqrO7zsnJO6ZyDFvt+/6MGCdVI3T/kefdg3AYmE4NOw4X0ohZqWbBIW0PLA2J1+JbbPfLEaZcI9XF0SJkhyU81M2BuWvTJgBesmQoWMoGRTJYbHqb+io5GEWtX7DPSMWqETNsAJsIzWDfXal1sGePAsEP1PYA7/z/6FfrC5oAG2RnVCt/nqMYP5151EB0x1PoMBmS8ymdXAZVBlXOggJwg/UQkui/eAtmrU2DTXPcoayR1pyflnVbNUAcz0J2pEcySyxuaq64q3ZUzXQ/AvcgzDZBnBmyQRtFkUqVrcmcF4bO0z1+0AStvregf+K/yjZpOEa7JGR5QEojWfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9oVjQeHOPjwhu27cRAxj83zXUe3eQo7qXwba7aAw3E=;
 b=tssZ+LnGmUXeaAe7YYF1AdllTBMe3tqY20jsU7judPe7PVpzONynGGSc/Pxc1P1TgyNifHikOR1x2Hu1QI26oKp7qTJUADYG8xyKAl0q1WIGYqnwCJsvEgeA5hWy10+aicHpmJpoW6l+jIsOpehmwtSbiL7fJjYt0WjRBtUJ58k=
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <iwj@xenproject.org>, <cardoe@cardoe.com>, <wl@xen.org>,
	<anthony.perard@citrix.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-2-sstabellini@kernel.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
Message-ID: <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com>
Date: Fri, 22 Oct 2021 14:00:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211021230839.10794-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0409.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdf93295-8a68-422f-c1c4-08d9955bf932
X-MS-TrafficTypeDiagnostic: BYAPR03MB4871:
X-Microsoft-Antispam-PRVS: <BYAPR03MB48711DE2CBDE74C8443B93A6BA809@BYAPR03MB4871.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OgLfVxOdUc6nDkYLiQoP0nTIppDuDOEgZvE23ivXGYZ1nxyve/xuDG7lrZKV/hR5Oc9q1iXT//u5Ku8yRo1UjrcamrqdH5XAoaAqTTwjGAZQpzWvJIzNnoEOPKUH1berrghw+esQvvGHMgSzlSURha1JTPuAxGjOJBmN9vDzpI2gKoRT19wl6CcuurKtxfWdxMdFXdi8A/OfwBZQSOHx+AMONH67oW7whGCKMbIDKJB2W8H5QWu7/sFQPahl2Yg0sUku4Y+ONvHPhz2m0Bi3P6l2SjnrNqeP5WXyRtpCJRSIXXDYt/S2NoQ1tPG8peKtF2GC0pegb5OjRZmoYfhmOZB7QW9qLSC9D60E5RSGcelECcGJxwYvPs+AfEJgjQj7HmOYpYCXloLL0ovjA7+p9Bh+Q9i26uX9lerkzBhIbdhg/5YWwrzFFVNIJXQFZHxG+eiVeCdvtDIy9/qovAzbkWGVWBICTaINo/gprHyP9FEe3CelwiH8oE3RpR1TkZB75u4Z1HY+yHwfRhsp8GGFCwlKxluMXJNTE+WMh+a3wGvXEGzdiDpXCJChc0Ws5QMALYAr+kt9sfPbsD598tJ0z8O5k7nv5VIbQnQFITJTY50TEiQa1NNmrsUuYmaSWx0QgIQFYR/5QoMiCJQD4oWqFPWRJC2g6v1mkauMvaFUrgAKwQ08v8YH6YF0Ix3U6MJrGDQO7jZWqxMHlTdJ33Fm+Ig9yaaxi2nZ+0N0/2LaYidE0qnhMlh8JWnR4sF+3y5zFPFSxm7grxWe02w1zvICsWJ792InRbzuZLTxS7Vfe+dujtla+WP2yR34mhYL9boH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(38100700002)(83380400001)(8676002)(6666004)(956004)(186003)(53546011)(508600001)(6486002)(31696002)(16576012)(316002)(82960400001)(5660300002)(66946007)(66556008)(66476007)(36756003)(86362001)(966005)(2906002)(4326008)(4744005)(2616005)(26005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEtDMHdjMUY0SW92VXNQbWszVEZUMVJBVERtM1BmZkxPcTdjVDg5TVJRTVdZ?=
 =?utf-8?B?WWsxM3FHYTVNUWMwclFURVBpekR5NS9JQ2RmRUdQeHh5RVNoOWFnWWE0eG5w?=
 =?utf-8?B?TkhpcW50VjF0TFptaGJVckxzbHVsSGpFdkU3SC8yZ3BSYVB0UDduMm1abDha?=
 =?utf-8?B?Ry9Nbmp5ZGdRZERuem9yZ1h2akxzdDZtNTg4Uy9uTlVwYUZLc1JPT2E4MExW?=
 =?utf-8?B?dnpkMFc1SnNIalpZWEw3VWNPdXZXTjViRXZQT05CQnNOZXRkbVl6dzJjOFFX?=
 =?utf-8?B?VXowVUVWSyt5MUxzUmt5cWMrVlZVUDg3cTJQQTY0MnpxLytIbUZpcDg3MFJF?=
 =?utf-8?B?NzRKWmJTcmJ0c2E4Z25FbzZ1NjVobTRUcUtUNEZaWTNsS2hEZ09BV3BGbitX?=
 =?utf-8?B?Nnd2a1FaT1VZelJZMURUUmxjMzVWWHVNd0ZUc1ZSeFFoSDVUaVdldlVhVlRk?=
 =?utf-8?B?aWJsMUVlNFlUWjQ2ZzVGSDR1YXJFMkI4UHJYTW5tRlhha2dyWVRhSTVZZEhm?=
 =?utf-8?B?bEpZSC9FNEZlNTgvNVViOTAzWnptZDR5YTVFMFBjalQrc0VaTm1MUE1tMkN0?=
 =?utf-8?B?NzNIR2xZaFFWdG84T1d4OEdVdHI1Qks1TkNtdkhMdTdNQXRtd3FKa1VadlJq?=
 =?utf-8?B?THhTWFovYW9rSWNZOGgrNFJYalBTTUNrN3Z4dE1tdXA0c2pEVWRSZ3hLN0FJ?=
 =?utf-8?B?Y2puSzlXM2NkM29kcFNhNW9DMkRlVjkzMFhVU1F6YkNLTC92eXhIaUwxZVIw?=
 =?utf-8?B?Wnh5eXAxemFkQk8zUGtkejhJcEY2VkMzbWdiRThTQmtRaGhYK0xxSjhNeFh3?=
 =?utf-8?B?M2dmNHFnUnZKRTdVcmVWWFhEY2VOMUNTUGZBQzRRUDJRVS9md0l4cTZXcmpp?=
 =?utf-8?B?V1lwR2lTZ3hCcEt1SERZeE1RQzN0cjFUMG4rbUhBbHdaQlhOOS91UEdEQXN4?=
 =?utf-8?B?K21GMnFxMTI2eld1Z1J5d0xVUTBFSUdHL0VaSS9zR1VKTWY3UHFVZmZqU2Jr?=
 =?utf-8?B?aEl3MVlXWC9xTHhIc1ErMVcrSFBqR0Y4OTZBaVNNVm1DMllWVmJDSHQxSVJh?=
 =?utf-8?B?azhxcjljRUJhVE5rM0ZnbG1ZdldoaHBsYWtHMERQQnJ1N3J3WC9xTWViS2Ir?=
 =?utf-8?B?SXFPOGVGSHZLclpQOERnTlJVbHhici84TTdMUm9ZbURuVUVTMjljR2p2aU42?=
 =?utf-8?B?aUs1V3FQTHJhc0o1eWc2dWlhR1hYcXlrOFpNcXFFWDRUUW5HQ0ZCL2dMUVZL?=
 =?utf-8?B?c3dZQ0ZaVlhKYnR6amZhNGRoaFVIV1JYVGlsS0J6aktTYnp2amY0NlYzbFNj?=
 =?utf-8?B?cnJjVkFwd2JGT2lKS3o4cHEwQXduOUVMM2hzUGJTQnUzWFJMSGExZEF1UitV?=
 =?utf-8?B?bXEwTTFLNnJ0NjRzUXZVM0hrRlpSNnVmTUwvODEwc2h4Vnl4enljYkdVdzhs?=
 =?utf-8?B?TFdnSCsvNzAybWFLRVNsUnBDSVVCWEZ4b24wN1lCOVBpRWt6c1ZzbVExYlpi?=
 =?utf-8?B?dmtncGVmZnluYkhETjVrOVVoeXZhTFQ3UGJqNlFMSDVmTUcwVS9LRTdXd2VG?=
 =?utf-8?B?bnhLbEt1OGJTZVQ4cm96cFQrMHp1YTBIelI0MEVBSE4vei9LdCs0dHl6QnhD?=
 =?utf-8?B?cWxydThGK2d1cGVPY3FMek04Ymd3K2dER08rODM0OG5CVGNVcGd5UW1EMUI3?=
 =?utf-8?B?U0tXVVVyK2FWblltV21oSzd2c1k1Z01TTHZrN2pQQUNNTXdtVWlETHoyWTV4?=
 =?utf-8?B?enRsMUR0Z09lV0JDWkdsT1hrMWszVEg4Slg0OEU1T2o4cWk1YmFYRC9Nbitn?=
 =?utf-8?B?Z3RJYk50bjVZR0hraU1nVlcrUStJSEd3cThBOGkwTE1ydW5ySTJQOTZ1UnV3?=
 =?utf-8?B?RXJ2UGlRSnJ2MTN1a2lKWW5WeWFRRm1salFjc29QS21xWjdCcEZNUVRVanZP?=
 =?utf-8?Q?y6QvvAegn1rAi8laq2Zim7x2DVT/WO5e?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdf93295-8a68-422f-c1c4-08d9955bf932
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2021 13:00:50.6210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: andrew.cooper3@citrix.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4871
X-OriginatorOrg: citrix.com

On 22/10/2021 00:08, Stefano Stabellini wrote:
> +# build depends
> +RUN apt-get update && \
> +    apt-get --quiet --yes install \
> +        build-essential \
> +        libssl-dev \
> +        bc \
> +        curl \
> +        flex \
> +        bison \
> +        libelf-dev \
> +        && \
> +    \
> +    # Build the kernel
> +    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LIN=
UX_VERSION".tar.xz && \
> +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> +    cd linux-"$LINUX_VERSION" && \
> +    make defconfig && \
> +    make xen.config && \
> +    cp .config .config.orig && \
> +    cat .config.orig | grep XEN | grep =3Dm |sed 's/=3Dm/=3Dy/g' >> .con=
fig && \
> +    make -j$(nproc) bzImage && \

defconfig is huuuuge.=C2=A0 Can we use tinyconfig instead?

Also, you want to turn off CONFIG_MODULES seeing as you only copy
bzImage to the test.

This also fixes the fact that `grep XEN` also matches CONFIG_NETXEN_NIC
which has nothing to do with Xen.

~Andrew


