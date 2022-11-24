Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDAA63744C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Nov 2022 09:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447820.704464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy7p4-0003Ii-9W; Thu, 24 Nov 2022 08:43:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447820.704464; Thu, 24 Nov 2022 08:43:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oy7p4-0003GT-6K; Thu, 24 Nov 2022 08:43:06 +0000
Received: by outflank-mailman (input) for mailman id 447820;
 Thu, 24 Nov 2022 08:43:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GTCw=3Y=citrix.com=prvs=3201a854c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oy7p1-0003GN-PB
 for xen-devel@lists.xenproject.org; Thu, 24 Nov 2022 08:43:04 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff4207ba-6bd3-11ed-91b6-6bf2151ebd3b;
 Thu, 24 Nov 2022 09:43:00 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Nov 2022 03:42:55 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6071.namprd03.prod.outlook.com (2603:10b6:208:31b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Thu, 24 Nov
 2022 08:42:46 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%7]) with mapi id 15.20.5834.015; Thu, 24 Nov 2022
 08:42:46 +0000
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
X-Inumbo-ID: ff4207ba-6bd3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669279380;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0z4LmD34i12+UCVrk3eVM72ZarlKTHU7MChVujVRXaE=;
  b=dnk3g9VsBPIR9RCixG5VjvjJZ66MQyrub5+UKQLuYc1LCPGM4bhalcpX
   nj8ZBrMxfueC7ev2ca/sI5xT0T2QhVo+1na9AUyH5KigC8k6V52ZFH/GY
   1WHVpdQsmuZY3cGByNxBNqsY6vreSQ8CHDnjf0ZgLNAPRIHzZsB6/8WA9
   U=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 88016979
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OiJxj6ADV3acPxVW/xziw5YqxClBgxIJ4kV8jS/XYbTApDwq0TRVz
 zMdCmyEOavcN2P9fdpxPoS+oUpTscTSz4Q2QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtcpvlDs15K6o4WpC4gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw3bopAEdWr
 dskCBcpQz67grq7zKKfRbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTi7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVoir12L6QzEsXXqocEeyF2MJjv2a1y0gcDBo1Fkq3q9aA3xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JPF8Uq5QfLzbDbiy6BD3UAZi5MbpohrsBebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakc5oRAt5tDipMQ5iELJR9M6Saqt1ISrSXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:t5aFJaDSOYcWIrvlHejMsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ/OxoHJPwOU80kqQFmrX5XI3SJTUO3VHFEGgM1+vfKlHbak7DH6tmpN
 1dmstFeaLN5DpB/KHHCWCDer5PoeVvsprY49s2p00dMT2CAJsQizuRZDzrcHGfE2J9dOcE/d
 enl7x6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4kbEz5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDyqIiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/L8Zan4pWfjbQ9kJl5bhHoe
 p29lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nteIIlXRQXaYXdbcUh40C+0F+FosGAUvBmckaOd
 grKPuZyOddcFucYXyclm5zwOa0VnB2JRuCSlhqgL3h7xFm2FRCi2cIzs0WmXkNsLgnTYNf2u
 jCOqN00JlTU84/d8tGdak8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hwzP22eaYP0IA5lP
 36IRxlXFYJCgLT4PC1rd52GkinehT+Yd2t8LAT23FBgMy8eFKxWhfzDWzHkKOb0oci64PgKr
 KO0altco/exFvVaPh0NjLFKuhvwFklIbkoU4UAKiWzi/OODLHWncrmV9uWDIbRMF8fKxDC6z
 04LXXOGPk=
X-IronPort-AV: E=Sophos;i="5.96,189,1665460800"; 
   d="scan'208";a="88016979"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNrOSjcYIUqsonhiiol863pV34s+JcwFjWecNje51fY/b1HSm5DR2b9ew9AfkZs3P84hk8p0W7Oidau1zs3u7p5yaea4PPPewQKK5UVgygQ1T3asQTEasOwWMHy0vEfJomNeu+4r28FNx+o+wV50TxYXe/vmxu44LGoBJrB0qmtAQxtIGUNbqx5JeNiN8gZVFwt3hR+Pvx40aSATGoPubBzHJSSx3HjkWVqOdAUBGsvqvW3pCVKjrKxctgtwldtjNsDUz8GTQ99jCUYKYbFkiE+zQexEms8P1qAAtOJvbYa35ITrqWeliiOCVrzg1591zXPWJSn9uU9CpKuEoTDAGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8PUPNE2sewrawSxnsTAXyCLTgcWWuJXKdO2qWA8zXo=;
 b=Dd0pUXzjFYZQQJpaBhgKwUxUyr0YoKsjSmz8lNTKEtlg+TQQklmHwb9bsvAo3R3buxh2qmGWpTHOhajuRC+7zLGeLNzzl1URGmGS2AOOs0lRR77xBTgH+YBNd0ua3B8MCbmmvEmJOuokwmEJ8208zrJIBC1wsibv3vGFKfCMDvOgm03ubmXDDD513JL+PZgpgt+/ClP8JfGK48lX7WTcZI+/fFXmdwk/FEa4sRhRH3IxjCyoZ8gfL4E+OyDs1Kj7xD4/ol9ZONhb1apqpMlq6HNLpbzhqHUt2907Kcmw58lrV8q4Pwb9KKLDJdi9laz/D8OWnGWMNRcJCsfaUFcspg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u8PUPNE2sewrawSxnsTAXyCLTgcWWuJXKdO2qWA8zXo=;
 b=CMEwx8kByEh3jASq6jWPZrVQci1K7x5Us7l2kEpV/oZaD4gNORhynOlUInRY+buRwg157KLV34A+27NX/qCxR85SeE+PjOt56rwpNlere1yYotttd383kM/F2q+lFPz8f2CjAezSsmxvjF6Y90LsFEdiBHhWeGvRLSyYkQBkVlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 24 Nov 2022 09:42:40 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/HVM: don't mark evtchn upcall vector as pending when
 vLAPIC is disabled
Message-ID: <Y38ugExH9uGdw83a@Air-de-Roger>
References: <f0d73fa7-8fe3-3810-f4e7-ddb654ac0afd@suse.com>
 <eebc4393-c322-0a2e-f600-18d384fe2647@citrix.com>
 <9a1e9336-a3b4-530e-5ef5-abf193492380@suse.com>
 <5a2df843-1acd-ad78-baff-e47befd0703c@citrix.com>
 <878e635f-b116-3580-945f-f8acb711a5bc@suse.com>
 <69507b8d-1f31-39fb-7469-e240fbfdde44@citrix.com>
 <33a005bf-0596-c624-0e70-077a450ac2ae@suse.com>
 <Y34L/MwSFGUsSe2I@Air-de-Roger>
 <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <351a6e54-8002-aef0-993a-c6b8bdcc1e8e@suse.com>
X-ClientProxiedBy: LO4P123CA0409.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: 910430c5-3d86-49d1-1a90-08dacdf7dc15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	72/1iZc4/U3oFWb+Ee1E+yZq+JiPYwwfPGvs43b48gu828iy66Dq3NjTP0u+gltAdndrllqt46wqKn4Nyf+kikW6rD8H3tvrkr6jEH+u4oltHE2iW3Epo91jx4WMRWSuM58STNHPJ4uTWuUVrKA1QJ0DBLz6deMcpxhHs3NeC3liTTffy4EOd2Tgs69FCLF6IxzstInVOoFH/bSIE5nWO8oH0tIIhU1ZSg+3j8ojzifg4mp1nt5Xow0nmzaBgAKntCYYa1gYY1V9ExtviFLLrESwaZ0q4FeU/x0XYNm/GbkGHBnw5mCss20r6yEHxfzkjpDWcTwfsiYn8ZYxIiTSW5OlEcGHkrfz/MZypGtn83iVhQUcN7QH2DN4ySTyXas73ZL01Gp+BXf/MTm+WiuAnD8fM6PTZsOFd9xrubC5L6wqUSJUuKnY2za+Pm3BtW+Gq3043FtdV7mVI8I42msV/KcVzj015nf/795Q9AIx2mbyzTJzUQSNH/SlbtyaYmZO2IH2qIHPCK2kPBcPgUKl0WLDVgs4FyECbe1HKp3Nr+uB26MN6NRSHJwdBYjDSz/X9qDuHxfA9xLRspj5l9sodeBzCWI/0uivr9IfDj36zvhJy3VxejiOh37v1s4SyRxj4wUcdZioM/yyD62YThiq8Ude/vJi36i0GnJnhKLWD9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(83380400001)(6512007)(26005)(9686003)(186003)(82960400001)(38100700002)(2906002)(5660300002)(8936002)(33716001)(966005)(6486002)(478600001)(6666004)(6506007)(53546011)(4326008)(66946007)(66476007)(66556008)(8676002)(41300700001)(316002)(6916009)(54906003)(66899015)(86362001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUJNQUF3TThXNmVsRGZYd0pPZ2g4aHJXSkhVY3hEZ2h2d2p2Nm1KcTQ0STZN?=
 =?utf-8?B?NGVDcUh1SDhUckx2eExEcWF1L0Y3dW1SYkhpSVJacFprS2VMYUVLOUVuWGRU?=
 =?utf-8?B?cTJseTVMOUhxbHVXRXdrWktrR0VMYVhaNXpYOEo1dERKbUpKcTE2dUJhSDZz?=
 =?utf-8?B?Ymw5dlowM1FSZTlBOW5IUjRFWVBaaFg0MktCNkpIVWcxK2VlYW1zeHVSYUJI?=
 =?utf-8?B?MGF5U080RGhtV2dZOFlKZTl1c3NQUXNGNUE5Z0ZnZ0dST0Qvb3p5dVhXcVJG?=
 =?utf-8?B?clAyM3JmL1BLV0tTSWZoUXo3K2RYNXdWM0tRcGFOWnp4eUtYRkNNcklWTnow?=
 =?utf-8?B?YWl3YUxoVXZvaTZOV0NlTzh4eFZkVU9KVlRaMEtDdWpCK252QTNDanp2NTdm?=
 =?utf-8?B?em9Galp1cHpHZXV2bTVOQ2pjM0hFZ0Jzb3N2ZlJHMFRtNlF0VGVQK3dkNFZR?=
 =?utf-8?B?RW4rVjRyNXJxSkJnK1FBelgxUDJmMzR3UDdBc25SeHBqRVAwYVlZQ2piVXIr?=
 =?utf-8?B?emhWZS9JcnY5bUZldFRMZ29hMmdZOENmNnNNdmRGYS9aeFR0bStjZjFkQzJw?=
 =?utf-8?B?Z3EyeUszSzUvTWJIUTRoK3VNUmhaeTBiVEVIN3F4Sk82MG1sZTdkVEpUVHhv?=
 =?utf-8?B?S013c1BJeUdUdVV3bnFjRzhOMGQ1c0ZqeEVZcEs5b2QxTzErcWpvNnM5MkJO?=
 =?utf-8?B?U1EyOHFGNEhwbllreTdHaHZ4Q0M5Z3N5c2o1aVJlR0tPTEZsdGNHZ1pxOTVj?=
 =?utf-8?B?SjdvcVE4TUdlMHZiS1Rzc3lPdVloZWpJb2ZBaUpPR3VLN0ZEM0FYQndFSjAx?=
 =?utf-8?B?QjlST0M0d0xVOVo2NWd3aldrZXlOVWxmQ25GUDhIdjRNTUdOVjhrYVo5dlYw?=
 =?utf-8?B?QUs2WnJ2SVlUNFJTZXRVc3NkMDdDT0VSeUN1Umx5cWlkdE1uZ3Zyc0wrTWxo?=
 =?utf-8?B?SlA5UFJvYk1Wb0xTTUM2YjdaTGlhaU5pUWRDandxb21UUlpOdFA3YW11b1Bz?=
 =?utf-8?B?TUl2dCtSd1YrZ3g0c2QxOGVUUG9HNUhWTzdVTTJMWXBQY3BwUnlMWW9WV0Nn?=
 =?utf-8?B?bWhIeUY5S2xpUENCVkM5bVU1MFh3ZExRTVBzZHYrN1dhOW4vRGFZdWEyMCsz?=
 =?utf-8?B?MXk0MW5GdE1KalB0OW5lU3Y0VWJIakNuc1BYKzdZaTdOaXp6VFJWN0FnMlh2?=
 =?utf-8?B?VmpHYVZTY0w2SE1UM01jdk9OZERJRytlclBzRGg5R3pieUcrbjhmTWpwYTRN?=
 =?utf-8?B?cHZJYzlEelZRYzFxZ29EM05DT3NYdjlXTXNCaDNodk85bzUybEFsSXBCTDVv?=
 =?utf-8?B?eURUME9GQmdCNFcwNnBIQzNRMkNvNWpOejNQeCtnUm5sdjROU0xRYWFKVkRl?=
 =?utf-8?B?MExOaU5wb0dVTHdSNFczRFYrMWE1cDdvOW5KNWorUTlmMVBmVW04WW1zK3N6?=
 =?utf-8?B?dEFqdnhTZ3k0cHZiWWROaXJJWnFuL2pFTEFsYVlOWDViSEVHRFRSdk9pWkRh?=
 =?utf-8?B?RVhXbzBWR0JEdUVVdUFTb05vT2g3VnNZSm14STA0MFY4dFF5YmFuUGQ3SEp2?=
 =?utf-8?B?SXhvdHBNdTU1ZDJOU21KUTFPVlpHaGNCQTQ5WHYvOCtJK1VNMEJuSS9sWVFm?=
 =?utf-8?B?QVREMGo3OUx3SVJxRlBwaW5UeHB1dmFQbnZlcXc0dEVNeXJnMGFsV2dQby9X?=
 =?utf-8?B?b1RmaXkrQXJtTU5UdUxoVDljWHNjRlNNT0lZWHQwTERwZllNUlJRY1F4enM2?=
 =?utf-8?B?Ukl2aHNVOW04bTEzU2NZMUd4Q0dxNWVoWUhkYzVhcEFrT3ZzOHNyNytLcmdq?=
 =?utf-8?B?Z1Z6ekdDbG92aFZYb2twRFJreUhpSlNPM211OG5TWkNGb3JTMm5rQmxOenh2?=
 =?utf-8?B?REhIZXBzQUZZeER6TU1tbkg0bnIyZ2VXdGR4Q3NWV0ZYSSt3TjM2QzZTV2Ny?=
 =?utf-8?B?QjQvMHNJblRJTUMwd05vdDZmQVB5S1htRndjTzVVRVRZUWUwVVh1SHdXRDdN?=
 =?utf-8?B?R0xNZTFySUpRaVhrc3lESUo5QTJ0QjlybW1vekVPTGpjM2tVUnhPY1o5ZFV1?=
 =?utf-8?B?cGp2ZVh1THpvMThoN2R6RVN6UGZraDhsTCtPMDVOU1NhNk5IZWFMSTZ1RXR3?=
 =?utf-8?Q?IHynbHHopR0YNw0svMsqeJ81C?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	GmLRizlKOkKyYINPrBdc7OntDZWb1eYtFBlFQvyTazoJjSD3b6IsQyC8OVqyd92OGFkeCTj/q0CPTvHhwanTvAPNCzFoOiVXJx7g4HMAxpO1FMkjwXE7c6LSB5y1JmPyNPCi+r0oUlKEAcC3zIUX7ziHvTzqcNHRc4YflDiRuU48GUkgowdoBwVDsmO9bBBFzVaKNK7NX0HSagP0kL3lPo020OEdKWFhHYPgx7tXTa2jtCnNSW4KocD9/VUQ4a4CaRqydymkT4VW5iNPRZ33J+ir4rp16kYfOD9+V3VcOA7b2v02/YJloQcHArq5wWdZdpwXL99cwtzrIGNiKc8wPYY6rnSiebyMHYabr89/cqorC/lUjFeByB72o4M10ZygJaH2aW2jHECog71AkPebk3NCqpLjqmGzN1s7e/LNnNavfcVOvdhMUO9sosQKign6ORDcO+0iAiz4r34c0JC/LzpFCHFQrxkJGZzWe3aPUY+JhlHHBNk/MzR1/pNsCcM+bKoKNngc9BrVOBV9gwWuSPBL1Di/yNmH7nwpK0AxmxoHoV6UH3xWh177H6SAachYBDu9HVbZ8KFYVQwoJV+cpmWvxbBUY9hM4hJOyuQ+6GxOLcaMkfmpuJUGl3LZHGNX+b2pDzhSZAtK+a3+Yz+jp4rkO/WD5pyv+vAhvd5fHXMGdT4bTcZbNL82mkGIxVi1psvLOJnVcNdEI3mGlOEFs2fgkGf0jfJbye0zt4he6/zmjwQtlLFDdciCTN32hV2WOt2kRFf029O3Wb3rFBKGqBil7+91bBkpzvCeG1EJAC3t50g8Ig/UsUL7LO0crljsoh140yvMfz0sFeyLnzJBaPDse7r+iLveP3h0VdMGawI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910430c5-3d86-49d1-1a90-08dacdf7dc15
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2022 08:42:46.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2WKkJcoIV/yZCLp6pdxRO1mp10Q3T+bYb3SBZVsNWWHsUvQMp5fJrSF91QR11GLLxu7YcbZ5ETrXTEM88vE7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6071

On Thu, Nov 24, 2022 at 08:59:00AM +0100, Jan Beulich wrote:
> On 23.11.2022 13:03, Roger Pau Monné wrote:
> > On Mon, Nov 21, 2022 at 01:34:38PM +0100, Jan Beulich wrote:
> >> On 21.11.2022 13:23, Andrew Cooper wrote:
> >>> On 21/11/2022 08:56, Jan Beulich wrote:
> >>>> On 18.11.2022 15:27, Andrew Cooper wrote:
> >>>>> I even got as far as writing that maybe leaving it as-is was the best
> >>>>> option (principle of least surprise for Xen developers), but our
> >>>>> "friend" apic acceleration strikes again.
> >>>>>
> >>>>> Xen doesn't always get a VMExit when the guest clears SW_DISABLE,
> >>>>> because microcode may have accelerated it.
> >>>> But as per "APIC-Write Emulation" in the SDM we'd still get an APIC-write
> >>>> VM exit.
> >>>
> >>> Intel isn't the only accelerated implementation, and there future
> >>> details not in the public docs.
> >>>
> >>> There will be an implementation we will want to support where Xen
> >>> doesn't get a vmexit for a write to SPIV.
> >>
> >> I see.
> >>
> >>>> If we didn't, how would our internal accounting of APIC enabled
> >>>> state (VLAPIC_SW_DISABLED) work?
> >>>
> >>> It doesn't.
> >>>
> >>> One of many problems on the "known errors" list from an incomplete
> >>> original attempt to get acceleration working.
> >>>
> >>> There's no good reason to cache those disables in the first place (both
> >>> are both trivially available from other positions in memory), and
> >>> correctness reasons not to.
> >>>
> >>>>  And the neighboring (to where I'm adding
> >>>> the new code) pt_may_unmask_irq() call then also wouldn't occur.
> >>>>
> >>>> I'm actually pretty sure we do too much in this case - in particular none
> >>>> of the vlapic_set_reg() should be necessary. But we certainly can't get
> >>>> away with doing nothing, and hence we depend on that VM exit to actually
> >>>> occur.
> >>>
> >>> We must do exactly and only what real hardware does, so that the state
> >>> changes emulated by Xen are identical to those accelerated by microcode.
> >>>
> >>> Other than that, I really wouldn't make any presumptions about the
> >>> existing vLAPIC logic being correct.
> >>>
> >>> It is, at best, enough of an approximation to the spec for major OSes to
> >>> function, with multiple known bugs and no coherent testing.
> >>
> >> But can we leave resolving of the wider issue then separate, and leave
> >> the change here as it presently is? Yes, mimic-ing the same behavior
> >> later may be "interesting", but if we can't achieve consistent behavior
> >> with yet more advanced acceleration, maybe we simply can't use that
> >> (perhaps until a complete overhaul of everything involved in LAPIC
> >> handling, possibly including a guest side indicator that they're happy
> >> without the extra signaling, at which point that yet-more-advanced
> >> acceleration could then be enabled for that guest).
> >>
> >> Otherwise - do you have any suggestion as to alternative logic which I
> >> might use in this patch?
> > 
> > Maybe the underlying issue is that we allow executing
> > HVMOP_set_evtchn_upcall_vector against remote vCPU.  This could be
> > solved by only allowing HVMOP_set_evtchn_upcall_vector against the
> > current vCPU and with the LAPIC enabled, but I guess we are too late
> > for that.
> 
> Allowing things like this ahead of bringing a vCPU online can be
> helpful for the OS side implementation, I think.

I thinks it's more natural to do the vector callback setup as part of
the CPU bringup path, like any other CPU related setting that need to
be applied, but I guess that's a question of taste.

> > Actually, what about only injecting the spurious event if the vCPU is
> > online, ie:
> > 
> > diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> > index ae4368ec4b..4b84706579 100644
> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -4105,7 +4105,8 @@ static int hvmop_set_evtchn_upcall_vector(
> >      printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, op.vector);
> >  
> >      v->arch.hvm.evtchn_upcall_vector = op.vector;
> > -    hvm_assert_evtchn_irq(v);
> > +    if ( is_vcpu_online(v) )
> > +        hvm_assert_evtchn_irq(v);
> 
> While this would match what hvm_set_callback_via() does, see my post-
> commit-message remark suggesting to key this to evtchn_upcall_pending.
> Tying the call to the vCPU being online looks pretty arbitrary to me,
> the more that this would continue to be
> - racy with the vCPU coming online, and perhaps already being past
>   VCPUOP_initialise - after all VCPUOP_up is little more than clearing
>   VPF_down,

If the OS attempts to setup the callback at the same time the CPU is
being brought online all bets are off I think, and the OS gets to keep
the pieces.

> - problematic wrt evtchn_upcall_pending, once set, preventing event
>   injection later on.
> As you may have inferred already, I'm inclined to suggest to drop the
> the is_vcpu_online() check from hvm_set_callback_via().
> 
> One related question here is whether vlapic_do_init() shouldn't have
> the non-architectural side effect of clearing evtchn_upcall_pending.
> While this again violates the principle of the hypervisor only ever
> setting that bit, it would deal with the risk of no further event
> injection once the flag is set, considering that vlapic_do_init()
> clears IRR (and ISR).

That would seem sensible to me, and was kind of what I was suggesting
in:

https://lore.kernel.org/xen-devel/Y3eO0bMKRPYJc2yQ@Air-de-Roger/

Thanks, Roger.

