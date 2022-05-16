Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E5E528769
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 16:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.329951.553246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqc15-00010O-BY; Mon, 16 May 2022 14:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 329951.553246; Mon, 16 May 2022 14:48:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqc15-0000xw-7g; Mon, 16 May 2022 14:48:11 +0000
Received: by outflank-mailman (input) for mailman id 329951;
 Mon, 16 May 2022 14:48:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LrNQ=VY=citrix.com=prvs=128f89ae0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nqc13-0000xS-5Y
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 14:48:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30ab11fa-d527-11ec-bd2c-47488cf2e6aa;
 Mon, 16 May 2022 16:48:07 +0200 (CEST)
Received: from mail-sn1anam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 May 2022 10:47:24 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB4596.namprd03.prod.outlook.com (2603:10b6:408:6c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.17; Mon, 16 May
 2022 14:47:20 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ac51:a410:14d4:de37%6]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 14:47:20 +0000
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
X-Inumbo-ID: 30ab11fa-d527-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652712487;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=GrZuouA6oEommE4sLjASyksaMTj+J+pY0ygEu41Tl/E=;
  b=e7LzdMoVp6ZzIEVMCILuKiO0aq69ErqRZqjXMsLDgE1pqQevB7Bq1FoI
   9v21qvWk2DfItGzpJKgs854IVBg9/2eSKLecwRlXbAO6Swu9mLBeYJJKd
   AWCtmsUYgziKXXF76gq15I0+7vnmsWYzppl8YVJcrcYFXeX6ED/FKTuGW
   c=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 71271839
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:75ZUU6/t9RWB+W36Q5DBDrUD8n+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 2BLDWyDP/7YYjShedpxOo3noRwGu5fTxtNrTQdpryw8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ44f5fs7Rh2NQw3IHnW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnayTRkR2Oq3oo90AWBRWPDsmAq5+xZaSdBBTseTLp6HHW13F5q00SXoQZMgf8OsxBnxS/
 /sFLjxLdgqEm++93LO8TK9rm9gnK87oeogYvxmMzxmAVapgHc+FHvqMuYMwMDQY36iiGd73Y
 cYDZCUpRxPHexBVYX8cCY4knffujX76G9FdgA3M//VuszOCpOB3+JWzb8uWXfuPfNtIv0GAu
 GzdpWrdPQ5PYbRzzhLAqBpAnNTnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM/pdI
 UEJ/islrYAp6VemCNL6WnWQv3qsrhMaHd1KHIUHBBqlz6PV50OCADENSDdEMIYirJVuGWBs0
 UKVldT0AzApqKeSVX+W6raTq3W1JDQRKmgBIyQDSGPp/uXenW36tTqXJv4LLUJ/poOlcd0s6
 1hmdBQDuog=
IronPort-HdrOrdr: A9a23:gyv/D6HLTBONcVojpLqFsZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskdrZJkh8erwW5Vp2RvnhNJICPoqTM2ftW7dySSVxeBZnMbfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj3Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnZ4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlXFtyssHfrWG1SYczHgNkHmpDp1L/sqq
 iLn/4UBbU315oWRBDtnfKi4Xi57N9k0Q6e9bbRuwqenSW+fkN6NyMJv/MmTvOSgXBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjx0C3fLFuHoO5l7ZvtX+90a1wbh7S+cQiCq
 1jHcvc7PFZfReTaG3YpHBmxJipUm4oFhmLT0AesojNugIm1kxR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVLQtUNZaxwCe8dSY+8C3DLQxjLLGWOSG6XX50vKjbIsdr68b817OaldNgBy4Yzgo
 3IVBdCuWs7ayvVeLqzNV1wg2TwqUmGLETQI5tllulEU5XHNcnWGDzGTkwymM29pPhaCtHHWp
 +ISedrP8M=
X-IronPort-AV: E=Sophos;i="5.91,230,1647316800"; 
   d="scan'208";a="71271839"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY9fGxznmxu2pna5gMyicrakYkbeOEdWer/kJTds3Xe0Cz3qph1TSxQmScXfsmZGaVr6OvFoiKtEXivjlDrJ68MNidQ9DCgWUjSn71icAxAES7oGIOGe/+yJWYGxouHonzmLOGvEkbWBLqkjiLlek3YP8YuIrfp32xLtLH0+DiL5HOMPbmy14Xghi6Gyk8ivqzyT7XoS4/mn8LpPgUPuFeHFdpQ099uX2SdMX3+SYCGdMhTc3ggZ6IIatWOSXnqkxvz5oZ4dPOvtg4D2GeM/C4OOfFxYNXXCIxbYgw/EOSw5vAl9TpLJwTYl+1hanG6XIOzjdeBE45OEIXJQD4w5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GrZuouA6oEommE4sLjASyksaMTj+J+pY0ygEu41Tl/E=;
 b=CcXgpDZIjiJ7cizXcs5xDrJgqukYMld70DE7kHa1R7nqLgN2hEbNW32uaMR6FXwdBa0ERWaIVOxhYhEyEVe15w3f5T6TwTXBf5Vg4jxz11BfeAIQPHIdxzzJrJgAsmkAtAVRn7DZd1M5lGvPAdBEYLEWTfZoFhMsZonlqZO2Yfluz3KDqTkgb9FvrCVK2WBa7zpg3x2Yjf7WNmEZOb+Lq1/1CdTM0H6oLGINLElsMj+bpAru+TcUATemWB4aAV0Krl1o0h1sm5tAgCRavIiPk2c4qpn83OD4s5vUrq0xRLQyKHZXjHr78vnvioW87QlguE6LEPJ972Kgr/E9I1fSYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrZuouA6oEommE4sLjASyksaMTj+J+pY0ygEu41Tl/E=;
 b=UQwRk4DeqIPocIyL3XK8b4I2Zi8NmgOUPR1XNqwZSXofAgtcApSdy3rTSgDDKdrKGPcQudYJU+nQStEdbruKVj9XIfwiqQ6+swk4wD/wICBVGv/PvTsglGjG3ZJqCCgAC0wwv0ThfRuvJqQB3YTAOwCuB8CS916Setrn77d0500=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/flushtlb: remove flush_area check on system state
Thread-Topic: [PATCH] x86/flushtlb: remove flush_area check on system state
Thread-Index: AQHYaTGgFt663HYNJUGkqeLNHlrlz60hlU0A
Date: Mon, 16 May 2022 14:47:20 +0000
Message-ID: <b33a2b66-93b5-4c03-b5db-71ea47013cb7@citrix.com>
References: <20220516143116.28602-1-roger.pau@citrix.com>
In-Reply-To: <20220516143116.28602-1-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f8107ad-7e73-404b-2785-08da374afb10
x-ms-traffictypediagnostic: BN8PR03MB4596:EE_
x-microsoft-antispam-prvs:
 <BN8PR03MB45967601E15FBCDC68CF7A9FBACF9@BN8PR03MB4596.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ji3ercK24xTy/+meEpLfzaDqZvzT1e8n92hCrZySTK9jnYQ0d4r6C6/Liil6Rn3XXnriuq2LqSs/V5ZxVqPO0vHRZBJikAqk8lCIFiK0L0snCen8UC6Tyvkyw0HYhkhIMWAViPZTG7mChEP/Zg+T1sQPO3HzY8A3qPnm+mIWAwFPpiuB25Bzugy9eoZFZ8gSC3tWSgzym9JnxvKtSsTvOppFuitok75KzPGuOMDp7FrpVmrSvhNllCiRPzIoUWvdbG+CX8/1Gr/oomOLEAfJQpBdyoBAwWe2AJpsZEg/KsiVXtmVGo58D5RDIs56bJT26O59ZvdoTsqC48Cj/7zMY8c/d/nGOC6OtXopWrsOyExgjDQMfgKnX9a3IBCeOfi4Rwao87DIc7lQ6zoYOdK6/73QCz3vZDwOHAj+FSONI71okgC+MsNoD16nOlyq99y8AMm7uc965a05g+rBb8VevSi8pSyMKQDlYA0fhciqeH8cXY2nWzBXMv+AXqIvWTME68YYMpekFFXqGL42P1Tjv1eeezXKE02O1sOKR3ZXSgdSmbX6pVZUGfEVzEjUIsJc7a2WtxCWHqIEErq8+KFwjp7+Ta1vWrkiKc/Q7jwq/0h2Uzo0ieG86/r8gFkrbjrLqyGxGG6DgQY0McQ4FNNXWsUe2AEbAjng5KJU+v/lF/+NnwVHbIEV8EaBh9jyDLLJeEkguvkxh86qXVshLw7cU3e/71ylurrbqE21CYXL9XabrP6K38RfWGwHWsjKzMYQajwv0kgllP7htDLVK3eFmQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(316002)(38100700002)(83380400001)(26005)(8936002)(2906002)(66946007)(66556008)(66446008)(4326008)(82960400001)(8676002)(91956017)(54906003)(38070700005)(53546011)(64756008)(76116006)(122000001)(66476007)(6506007)(5660300002)(186003)(6512007)(71200400001)(508600001)(6486002)(31696002)(31686004)(86362001)(36756003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mk15YUtUN2RDRmJKS3hMbStCT3VUeWo4Z0pWaUNLcWtDYmU3cXM3WUxGQVdH?=
 =?utf-8?B?allna1RtNkJWbDROSGVSTWN4S2NXTUJYN1VKZGdBbEk2R1VHMjRHTTdnZlBP?=
 =?utf-8?B?Zk0wbk5FdzhFUmRhVm5yeXBEdFZyTlowMVFQaVhXTWRkdHBhKyt6UjMxYlhu?=
 =?utf-8?B?WDIrczc4eVVCK1cxd09OYTZNdTl6MFZFNFAwV2UydVk1N1o2NTREY3lJaVF6?=
 =?utf-8?B?eTE4bFVQUWdnT0NMUjQ4bVpxWENMOWVBV3JrZVVOYjdrRDVUa2p6SmFLblJ0?=
 =?utf-8?B?TWJ2MHpFSnh1ZHRnMEhSUWROZG9TZ3EwNjhTNXdaUFVHaVQ3K2dra2t1aHYy?=
 =?utf-8?B?Mnp0T3JuRVJTZmtXY1loYTZ6Zkk4bGkyeUs3RXl5NDJzcUt0V0p0RVdUdGVE?=
 =?utf-8?B?bUVSUU1ZdkdVQjlNUXREYSs3R2xjenhpeTFBWXFBQmFScWFIcUdkMXIxb2p5?=
 =?utf-8?B?c0wzTUo4cENwejErV3BtTms5VmFuNjVNem96WUdvQXM4MElpWHhTR3BuakU1?=
 =?utf-8?B?M0E4QXMyUkdEN2NEQTNqdVpNQVE4cllCVDlJeEVCblV5K3RQQW43d2h2RVdu?=
 =?utf-8?B?YW81dmpWc281aHdQbW9Zc2N3dXlTUXk0b3oxMzJIem1QcHJzaEVBTTJ4dGp0?=
 =?utf-8?B?Z3hTaXNIV2NEQlVIZ1k1aDBBVyt3OEVaL0VmcEk1ekVEc1ZEaC9SWlVGUFZs?=
 =?utf-8?B?Z0dYaHVRME1nN1J6LzZGSS9raVVPdCtPKzAvTFFRa3hmZ3hHNDRyQzRKZ1g1?=
 =?utf-8?B?dUdyT1NDZUVXUTdKbTBEU3pMQ2RXYzF6cm5sMUxuUStXWHllRkVJMTV0QjJi?=
 =?utf-8?B?b2NqWGwyelhIWFl3M1lVajZ6NUtyTHVlS285czAzZ0NtY1dRZy8rblN4RWYy?=
 =?utf-8?B?RHRwM1NPYmFrbjM1RzJCWi9NTTE4N0ROWEtBaTZ2WHJXMnloaVYvdnpTUVBi?=
 =?utf-8?B?NUNsL2txS1ZWaXVXcGU4a0hWVk1WWVk5eGY4aU1RV3lYMDJGYXFva05tTUgw?=
 =?utf-8?B?RUdjVHU0YklXMGNvNm5OeGdDRW96UUlDK1pOazg1M1NQUnZWYUVUQnp6MkNx?=
 =?utf-8?B?Rk5NQ1ZuckVOOXQ4dkYvU2FzVm5HWFVMeWpqb3N5dWFKNTZmSmcyQ1c0b0ZI?=
 =?utf-8?B?andYUG9VeHRHSCtXZHI5bWxjU3VxV2dqaHVqNmVQeFp3TkJuc1YzMlF4Zlhz?=
 =?utf-8?B?cGZKRVdyRVAvKy9PTThNbEhnQVc0M2VoYXBjRVc2OWJ4aUZReGdtMWtGY1VM?=
 =?utf-8?B?bDJQZ3B5MGxFZTlua1RySmpKM05idVIxZWNOZEp0S1lmcmlLVVduSlRrUFZM?=
 =?utf-8?B?djI2Zm03b3FpanRGVmpOMnhINklHbFRJKzdoeWJ0aGFKVjZvdFlWam12amZX?=
 =?utf-8?B?LzdlNzBCY0U5eGg4QXRDNHhYNWFocEVDNlRpVXlKQjJMcHM1cCthT3E1R3lm?=
 =?utf-8?B?b2hSaGIrd01JYmxGWThRMXU2aDJvOXJFRElkcEhwb2RzTkF6RzMrVUNtSTcw?=
 =?utf-8?B?YnJlNEpyT3RZZEdLM2tzUWVSVkYxSFduUGJRaDVFcDlmdWVnNHU2bVRQbkRj?=
 =?utf-8?B?b2k2d3RYVG1CU3Npb05WQzR4L2tXRkNkS1kwUWVCQ1RVYTRjY0ltRVE5ZlNm?=
 =?utf-8?B?bnJDS0FNNjRZQ2dqZUR1MFlyTEpPU1JrZFMxb1RMbTdJSEljcXE2cU9Ydi9s?=
 =?utf-8?B?UlBVWjVuU3lTektvREZ6aVhMY1lxcVhWYTRXOGZNTGdDV1dqdTg4dHFRL1pw?=
 =?utf-8?B?L1VQMlNmN3B1ZmZZT2p2Q2ZpUEY3MFBXdGxtclpxQW15U2JBVkhPRW42Z3N1?=
 =?utf-8?B?V0dBV3VocEw3NHNWN0RwYUxwWmt5Z3JYQ2kxVmQ4NFhnd3VoVlQraXlVNkZh?=
 =?utf-8?B?VGdIdU9CK2ovSUMvMjl4S3VUNEZEUFU5Qm8xVWwrbkJZejNYMHhmWE50d1hU?=
 =?utf-8?B?dGhwYnBGcmFSTE1ONWllMzJROVVyblM0NUtMZ3BLU2VLQ1RwT3p3SEhEREpj?=
 =?utf-8?B?SndrTDdIa2tKS0paNUIwamJKRlM5QlJkR0E1V2NZYkgyR1RxVk5UeDg2UitI?=
 =?utf-8?B?S0RTWng2SjgyUHJCbWp0b2tEMHhTR1lMbzlRRGYyYW5DakxGTUFRNzlGL0x1?=
 =?utf-8?B?d2ZPZjEzZkRNbzZhNjVoLzNWZWVza29sK2p2N1hUZ2xvWXUxQlhaZUtIQ0d2?=
 =?utf-8?B?VGFMZ0RSMWRaMmpFWExaWEhMcWtqcHdiQWx6TXhJR2pZblVDc3ROSXo0cWFL?=
 =?utf-8?B?LzllWnZSOC9IWDZmbTJpRW5pakZ1aHlaZUpKZDdrT01Vb1FNU05OVG1LUzFs?=
 =?utf-8?B?MWRaWTFMM1ZiUUIvM3pHQmV3WnZweVBWMkl3dWc3aUhSVXN6ZEtnR1FIWU9l?=
 =?utf-8?Q?0e1HLKytJWalDE5s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B74D784E0F47894BAF66652BEFD1391B@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8107ad-7e73-404b-2785-08da374afb10
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2022 14:47:20.4969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NN0njhalxBridqhUhJ/AzhobVjaTMykt476QD5f929seUNIlkU/JfDqq2ZEo7FLSSILpp1e8YkVUcuPRTXrMfDcYeTMPuh6DmB7MVOkr9B8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4596

T24gMTYvMDUvMjAyMiAxNTozMSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBCb290aW5nIHdp
dGggU2hhZG93IFN0YWNrcyBsZWFkcyB0byB0aGUgZm9sbG93aW5nIGFzc2VydCBvbiBhIGRlYnVn
DQo+IGh5cGVydmlzb3I6DQo+DQo+IChYRU4pIFsgICAxMS42MjUxNjZdIEFzc2VydGlvbiAnbG9j
YWxfaXJxX2lzX2VuYWJsZWQoKScgZmFpbGVkIGF0IGFyY2gveDg2L3NtcC5jOjI2NQ0KPiAoWEVO
KSBbICAgMTEuNjI5NDEwXSAtLS0tWyBYZW4tNC4xNy4wLTEwLjI0LWQgIHg4Nl82NCAgZGVidWc9
eSAgTm90IHRhaW50ZWQgXS0tLS0NCj4gKFhFTikgWyAgIDExLjYzMzY3OV0gQ1BVOiAgICAwDQo+
IChYRU4pIFsgICAxMS42Mzc4MzRdIFJJUDogICAgZTAwODpbPGZmZmY4MmQwNDAzNDUzMDA+XSBm
bHVzaF9hcmVhX21hc2srMHg0MC8weDEzZQ0KPiBbLi4uXQ0KPiAoWEVOKSBbICAgMTEuODA2MTU4
XSBYZW4gY2FsbCB0cmFjZToNCj4gKFhFTikgWyAgIDExLjgxMTI1NV0gICAgWzxmZmZmODJkMDQw
MzQ1MzAwPl0gUiBmbHVzaF9hcmVhX21hc2srMHg0MC8weDEzZQ0KPiAoWEVOKSBbICAgMTEuODE2
NDU5XSAgICBbPGZmZmY4MmQwNDAzMzhhNDA+XSBGIG1vZGlmeV94ZW5fbWFwcGluZ3MrMHhjNS8w
eDk1OA0KPiAoWEVOKSBbICAgMTEuODIxNjg5XSAgICBbPGZmZmY4MmQwNDA0NDc0Zjk+XSBGIGFy
Y2gveDg2L2FsdGVybmF0aXZlLmMjX2FsdGVybmF0aXZlX2luc3RydWN0aW9ucysweGI3LzB4YjkN
Cj4gKFhFTikgWyAgIDExLjgyNzA1M10gICAgWzxmZmZmODJkMDQwNDQ3NmNjPl0gRiBhbHRlcm5h
dGl2ZV9icmFuY2hlcysweGYvMHgxMg0KPiAoWEVOKSBbICAgMTEuODMyNDE2XSAgICBbPGZmZmY4
MmQwNDA0NGUzN2Q+XSBGIF9fc3RhcnRfeGVuKzB4MWVmNC8weDI3NzYNCj4gKFhFTikgWyAgIDEx
LjgzNzgwOV0gICAgWzxmZmZmODJkMDQwMjAzMzQ0Pl0gRiBfX2hpZ2hfc3RhcnQrMHg5NC8weGEw
DQo+DQo+DQo+IFRoaXMgaXMgZHVlIHRvIFNZU19TVEFURV9zbXBfYm9vdCBiZWluZyBzZXQgYmVm
b3JlIGNhbGxpbmcNCj4gYWx0ZXJuYXRpdmVfYnJhbmNoZXMoKSwgYW5kIHRoZSBmbHVzaCBpbiBt
b2RpZnlfeGVuX21hcHBpbmdzKCkgdGhlbg0KPiB1c2luZyBmbHVzaF9hcmVhX2FsbCgpIHdpdGgg
aW50ZXJydXB0cyBkaXNhYmxlZC4gIE5vdGUgdGhhdA0KPiBhbHRlcm5hdGl2ZV9icmFuY2hlcygp
IGlzIGNhbGxlZCBiZWZvcmUgQVBzIGFyZSBzdGFydGVkLCBzbyB0aGUgZmx1c2gNCj4gbXVzdCBi
ZSBhIGxvY2FsIG9uZSAoYW5kIGluZGVlZCB0aGUgY3B1bWFzayBwYXNzZWQgdG8NCj4gZmx1c2hf
YXJlYV9tYXNrKCkganVzdCBjb250YWlucyBvbmUgQ1BVKS4NCj4NCj4gVGFrZSB0aGUgb3Bwb3J0
dW5pdHkgdG8gc2ltcGxpZnkgYSBiaXQgdGhlIGxvZ2ljIGFuZCBtYWtlIGZsdXNoX2FyZWEoKQ0K
PiBhbiBhbGlhcyBmb3IgZmx1c2hfYXJlYV9tYXNrKCZjcHVfb25saW5lX21hcC4uLiksIHRha2lu
ZyBpbnRvIGFjY291bnQNCj4gdGhhdCBjcHVfb25saW5lX21hcCBqdXN0IGNvbnRhaW5zIHRoZSBC
U1AgYmVmb3JlIEFQcyBhcmUgc3RhcnRlZC4NCj4gVGhpcyByZXF1aXJlcyB3aWRlbmluZyB0aGUg
YXNzZXJ0IGluIGZsdXNoX2FyZWFfbWFzaygpIHRvIGFsbG93DQo+IGJlaW5nIGNhbGxlZCB3aXRo
IGludGVycnVwdHMgZGlzYWJsZWQgYXMgbG9uZyBhcyBpdCdzIHN0cmljdGx5IGEgbG9jYWwNCj4g
b25seSBmbHVzaC4NCj4NCj4gVGhlIG92ZXJhbGwgcmVzdWx0IGlzIHRoYXQgYSBjb25kaXRpb25h
bCBjYW4gYmUgcmVtb3ZlZCBmcm9tDQo+IGZsdXNoX2FyZWEoKS4NCj4NCj4gRml4ZXM6ICg3OGUw
NzJiYzM3ICd4ODYvbW06IGF2b2lkIGluYWR2ZXJ0ZW50bHkgZGVncmFkaW5nIGEgVExCIGZsdXNo
IHRvIGxvY2FsIG9ubHknKQ0KPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KDQpUZW50YXRpdmVseSBBY2tlZC1ieTogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KVGhpcyBzZWVtcyBsaWtlIHRoZSBsZWFz
dCBiYWQgb3B0aW9uIG9mIGEgbG90IG9mIGJhZCBvcHRpb25zLsKgIEknZCBzYXkNCml0J3MgbW9y
ZSB0aGFuIGp1c3QgcmVtb3ZpbmcgYSBjb25kaXRpb25hbCBmcm9tIGZsdXNoX2FyZWEoKTsgaXQn
cw0KcmVtb3ZpbmcgYSBydW50aW1lIHNwZWNpYWwgY2FzZSBmb3IgaW5pdC10aW1lIGNvZGUuDQoN
Cn5BbmRyZXcNCg==

