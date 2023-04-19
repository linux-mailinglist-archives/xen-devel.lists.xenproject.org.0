Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBD26E7B04
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 15:36:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523475.813554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7zK-0003iO-0A; Wed, 19 Apr 2023 13:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523475.813554; Wed, 19 Apr 2023 13:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp7zJ-0003fm-T9; Wed, 19 Apr 2023 13:36:45 +0000
Received: by outflank-mailman (input) for mailman id 523475;
 Wed, 19 Apr 2023 13:36:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WAk3=AK=citrix.com=prvs=46623c849=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pp7zI-0003fS-LK
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 13:36:44 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37dbae19-deb7-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 15:36:43 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 09:36:40 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB7146.namprd03.prod.outlook.com (2603:10b6:806:335::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 13:36:37 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 13:36:37 +0000
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
X-Inumbo-ID: 37dbae19-deb7-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681911402;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oiujBh1zgNY4u3WSkT/hwx1Y74HixuxpZDiSlSutRuw=;
  b=U2bMztMOL/QPBlb14MUA6UktsDhRoY///ioUrDHS1lPLsuGO/J7oxAL+
   LpUpMrrtBQGLQ2UTe82yYh/nrbvqDN3fpQQYX7oAIUebNs8NTE0RWRl8I
   BHgtNN5c8SBdruRa8ZIx4Okb26LjTr5xe8dZd0rg0ExQ3ppEMZhOqGvzR
   8=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 105447036
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:GcBLKazn6/Bh13z9R/h6t+cRxyrEfRIJ4+MujC+fZmUNrF6WrkVSx
 2YYW2yHO//ZMWb0L9x0YIjg/E5UvsWDm4I1HgA9+yAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UIHUMja4mtC5QRiPKET5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXAN2
 9sRaxIBVxSGvfuEmJe1VNZGve12eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQguFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eSwX+kANlMfFG+3tpOrU+VwVciMicPfmq9n8G8sWuEZOsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwB6J4rrZ5UCeHGdsZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluP1TM9KGYDYWoISFUD6ty6+IUr1EuXH5BkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPuRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:kZvFmqwTrxSWoPoKoNKJKrPw6L1zdoMgy1knxilNoHxuH/Bw9v
 re+cjzsCWftN9/Yh4dcLy7VpVoIkmsl6Kdg7NwAV7KZmCP1FdARLsI0WKI+UyCJ8SRzI9gPa
 cLSdkFNDXzZ2IK8PoTNmODYqodKNrsytHWuQ/HpU0dKT2D88tbnn9E4gDwKDwQeCB2QaAXOb
 C7/cR9qz+paR0sH7+G7ilsZZmkmzXT/qiWGCI7Ow==
X-Talos-CUID: =?us-ascii?q?9a23=3AC5bKDGpgac00Cx8bannOyaTmUdFmXFrUj1XcGku?=
 =?us-ascii?q?9M39bEJibV2C6w4oxxg=3D=3D?=
X-Talos-MUID: 9a23:pt4p9AaLuWaYruBTkxvBljdlD/ZS2b2FOUYzqZA9nvO7DHkl
X-IronPort-AV: E=Sophos;i="5.99,208,1677560400"; 
   d="scan'208";a="105447036"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OkiwOZdh02YO6zwREs11PNCIe8tQui7KMLaz0WZdUnR/sD6iwiiDx/ZTEd4hRal/9gl7IBLScb1HeABAmwZJxjAeY+GknrucmmzJUbxzsJw1HCRJbYf0hI+Llb9fmx/oCVEfboTL+R2s79U76u7K4csD0e1ddEP9zdxhJ9PZqXfZ3J5YsmGn1kW4602Ry9DqarBAI8V2uCUyytKD0LY4/zFtSlI+VuXEfN4qRhYdV1ng65DE5nVj8S50rZO0MFVfbhMZRv9PoIaqgpCKg5Kg+Ber+W9GHIM/zEo/7HJ7MfRxUBl4lM3mMOR+Me1sTQNHGijQUkedxXsqHas6tJnEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HdGuTUn1srRQHQZM4vrpK/BDUTN31bZMdHTs2ip2RBo=;
 b=CIcpB9WogqlJP+kpipCdwMgtkekz0jkfWRraLTmeO7IFQDUPjSwAHVxsNvby2gnZ+oOya3h9lYcFSq4hef5msDtKnrXFpSn0JQIKCXo0YyuW0hBdmXpPx9sj1gAQc6DjPK2XU/yx/+aoPX+F7RdHMsAeIrtS/vkgdZfAqCpT78Mt9C2j8mGArcaib0GbCr1zVMnSNWkfymM+7t30bW0ZMQX1bEIwOPFlZXGCqXkJmydfRrRKorojo5r+35K0c876fZ+wglfDa4Jot1EvwW76C2eOrkwXOBfkUD5fBW7pAUctsl0rkVYedv50SCpOxR0AvlmH3o9JqiVd7zuaOXZhFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdGuTUn1srRQHQZM4vrpK/BDUTN31bZMdHTs2ip2RBo=;
 b=ptkdRrm2x75ygOndzIpml0iN7pu3Q0pS/KFENjKiVUK5R5UjzRGReht0ZKcdEGPvEnaSLbABeLhkOQOG4L/N1obNPOWUFLnsE3tT5GTTE3jpmtR4FpwRn5GQ4q0SIX+Fq1415C7iFdhLSF6ApzwEbnaWUu29sHR+EZbJLCGt7Ps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 19 Apr 2023 15:36:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Message-ID: <ZD/uX1VqYchQ4GgT@Air-de-Roger>
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <ab604666-e9a4-3656-73a6-c09b2ae9d3bd@suse.com>
 <ZD6V0wzw/VS/MMw/@Air-de-Roger>
 <d301e110-f840-a032-c406-2f7404752783@suse.com>
 <ZD+ljXSEPCmPMAtN@Air-de-Roger>
 <5c476b65-0340-2a0e-e436-46368d3236b7@suse.com>
 <ZD/UMyeckvCq0ivf@Air-de-Roger>
 <86823b76-6be1-da65-7608-af391ff48978@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86823b76-6be1-da65-7608-af391ff48978@suse.com>
X-ClientProxiedBy: LO0P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::8) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dcdebaf-ae8c-4fa2-84ff-08db40db1927
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46nxhnqJU7XCJ4Mj3HcEhZEPua/96qxD+MssvT5h8mS9M8Hq5KBgg7GMfwur+BA7gJa83/ITOv45wdKy1CtlqR1uds9axdnDDXjzDWGzLEDEAdOy9f+x7rJHAjwa8KSE46BnsN8LYZH+N0aOeUaJXr/b40+hNkeUJVr81VZRJWjZ0BILOwaqmp9s8+4nOvJuoAYNCOW/N5IrkVlmPlJWnDJ3p2VbbkzY9XtLS5P3gRxpuntyyJohvh3Em6k0jCPlxS9Sa+9PpKOk5PJCLQPrdJgZQXMq4+NgM8ASDQHn8WeVH1NCWvM/tUlyaBGYYJuuU9KkUH8hrSdP1rUTMvuBxIvjSRhWOQUZB3y3CrH/8Jwq0Xbf/LSPaPntSvj4Ae3pRd4SufAvSI9uJ7F3xcFpLE7VFYu50AxY4R88QnM2kz0Omd36RjWNjENq88TG5UztH3YqxtZidGszGSrl41Y2iuTAMGBSCfS97Ttoz1k+9I7g1IzKYB4YDpXmHHSZ7kavOSFLp6hnts+4wosT587MEQcJdOqgun8vxqw6oi/kslo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(376002)(366004)(39860400002)(346002)(136003)(451199021)(2906002)(478600001)(6666004)(86362001)(966005)(26005)(53546011)(6512007)(6506007)(33716001)(9686003)(6486002)(186003)(85182001)(82960400001)(41300700001)(54906003)(38100700002)(8676002)(8936002)(4326008)(66556008)(66476007)(83380400001)(66946007)(316002)(6916009)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vmt3VDJIeE5zL2cxbUFHTkphTjhSSFZmdVhTNXVNTU5ZZDY5c2hsbldicldn?=
 =?utf-8?B?UG1uL00yUlZUeTR4MC9ZeU1raWFrRnFUSUpXLzdjSkZsN1R6c29ZTUJJZ1h6?=
 =?utf-8?B?OTZHV2lDanZyZFNXbVNxemYvTmp2RlhySG04R1lGTmRVVndiNW1uTHZxUnht?=
 =?utf-8?B?YUs2TXVwUWRnUTB5eVQ3VUFEMUI2aW4wQUYrWUJTL1RRRUJYaEhaWGpZNHkz?=
 =?utf-8?B?eFcwZUNMdFFEcTdZUmdJQ0VVak83UjFIdllETTgwMDRQa0h3WkZ0V3F1TnRP?=
 =?utf-8?B?V3pCTlk2RTVDWVRud1ZuNWZOR1hLSFI1eUJRbkEwcVJNZjA1c2VPUmFxVzZu?=
 =?utf-8?B?RmRGaFVnYlRUYUhDL2NNZkJ0YjBhcHBiRWp1cjB1SzV5S0grSC91dzN4YzhE?=
 =?utf-8?B?bkJBYnhNYzNjbHlXeFk1dWdvOHZ4eForYXN6dVpOQnpzN0hBcjRzK1MrVStQ?=
 =?utf-8?B?dTB2aVIyTFFxbE82VUF3V0p1bUI1a0s2RkpIOVljbHJxZzUycnN1SklGc05C?=
 =?utf-8?B?ZVF2cDhRUG8vcTEvMDFDUFZ5NWVlTzkxYWFpa3NxdXVZR1VSUmlBeUVDQjlJ?=
 =?utf-8?B?WUthNndMY0d2MUJSK0daTkFHdWJoeVBxVlQwSXRwbTduSlQ5MzhBWGNOUFV3?=
 =?utf-8?B?WVh4NUFtRHNudURaM1h5L3FoREM2dWp2NG1CUVFJK1YrRjBqcVV1U3R2OEUv?=
 =?utf-8?B?UDNJS0dzci9EKzM0MUZQcU81SjdEenJHRmpUTlpzVUUvR1JlSkhTNlNxcUhu?=
 =?utf-8?B?MlQ0c1MwQ3NEWlhZd0NhbUpGMHhYV09seFlScnpFeU1ZdC9HS0ZOdHJ6N3lX?=
 =?utf-8?B?QjJMb2p2QmRMQ1Q0d1NGNzgvbnU0bC9ITkVraUJzZ21qUkYvZVlveG53SlVm?=
 =?utf-8?B?Uit5YVdLRVJwa1ROaU9ZK3MzbkIzZUhMTFdpa3FHZmRKVUVPd0k3RExobkNk?=
 =?utf-8?B?Vnl6emV4N3VMUW9EZlNrYUJDejJzWDE0N1o2bzZ4RWJISU1lSmNDeGFNZ3BK?=
 =?utf-8?B?NkJnUzN0OXFxV0MrdDhiYnhzSGs5cmJ0RjRWemlYNHNqc2RNc3BBZW80MkF2?=
 =?utf-8?B?aXFPNmx5SjBTWXBDdnpMT3gweGJQRkxCRUZqd3BnK3E3Z2xoZDJ5ZC9zRzJN?=
 =?utf-8?B?WUNaVkF3a3prMnBlZ3F0clloMThQRzdsa3ZyNXByZnRYWGVuUXVveC9MYUlM?=
 =?utf-8?B?SytFVUNscDhET21ldzBQKzZpejhFYk8xOU0vQ2QrYVoxM29rZitZTGRxcmtT?=
 =?utf-8?B?eVVrODBvTU1NaTlnc1V5SVhoRXdQbDhYbmhIVVRkNCthdTNBVVMyK1h1VldR?=
 =?utf-8?B?eFBRSnlzT1ozb05LQnUyUG5FdWhmSDRmQno2T0lUQ0JYaUxkOEE1b1NFZStz?=
 =?utf-8?B?VjhGdWxnNHNRb1lJcWljMjc2YWF0RkxtdmtGVlp2R2piazhSVllwVTRSUnZl?=
 =?utf-8?B?SG01OFZQdy8wbUVwYkJIQ1Q1K2RsYklEZDJXYWlDOHczWHlPUGhVZkRHK05C?=
 =?utf-8?B?a09pYWltSGhrWm5QYWJpRlBiWlVLS2tOamp3TFNoQnBqWHN1YURIOTh4YlMv?=
 =?utf-8?B?bHA4TnV5ZGtUU21tUEhVVTNObFA0Q2xieWp6WHBLWVd1OFNpcGRaWlNJTnFl?=
 =?utf-8?B?ZzZXUEt0MzVOYk9MVVcwS0lUdGpzU1R2R1ZkZFEwV2NKeXVQV21CeWNrUUhi?=
 =?utf-8?B?Z0ZnZEtqN1lmV0huVTNvcTlIdTNmSFRvQzJGaExSYThqSFprZVFuS3hhNHVP?=
 =?utf-8?B?YVF5TUN2ZmdieFFHWW1WSFp0YmdIcnkwUnlhRkdhaDJ5cFhKK0l0cnA1UUta?=
 =?utf-8?B?eWUycUozM1ozc0NId2RxZE1wYTY2RjM3VVVaZG1Nd1FPNW4rUCtFaloxd2pk?=
 =?utf-8?B?TTk0QTVqSXUwN3dtOTc4bmNxNGFJZS9CRFBwOHRqK3BvbWFCVE1BYlFFYUFi?=
 =?utf-8?B?UVBabnd0b09GL216bng4SXpKSmU4Mk02OUlqWjBHdzNQVDJMYkx3WUY4RDZK?=
 =?utf-8?B?OU1aRkxwM2hWZUsvZHFVTjJYODZsWWZwb0l6NFkxeWIybFNlYktTYVlYUFp1?=
 =?utf-8?B?a1MxY0ZrWnhtK0JDOHdhZDZrMzZYanRhUXl6WHQ5WHduYlltdXFNSUFaSWxC?=
 =?utf-8?B?Q2hFVS9ZWjN1M0JCNHNycGxBZ1NBK0VxU3B3dGJlY1lRUjl6eXF2US9vMUVp?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nDyUG99uy03lvhAlwk/4dmiaXlMEXFHv5mft10mSNpJ1H3q+/th4ZyzL7DaOXb1iUYtoUDudiebZ9yh7y+PF06ILcSGc1n9M/kMRRagh9D30Oeb9RIFKJ90kdQSRep5xeiM0y8LS5rKAQEtGVpYfawjmuWyN9z2kiehPHG+4IfHPWxwIacDtvtuUhI+JdhIdyx99CaW6vPiFbHOColItyiYD+gK9hIiGYtFMNfF+aWxAZktks4ofJNkY6JZ3owsO8OvDzGuIWCFSskAJy/nxDFT0Uw/t3TA24nm+cMfLMf7H5DDfHRuLDT5KtowbgplyOC8x5ymGZQxj6XTF4u8xXSne8Ed3NqX3q3EnmTCUQlKVkUEAYk82AhIK5m2smZ+IiqqoxwSyBbPs8W3LfoaNF906HQCDR/LzNNB7mksPqzXoMbeSIYfjVp9s5dC5BR35xJQLDl65zDDxLUfYs+6S0skaQFXnCTKJFittkC1NEMsym9MCk7NLNCZQPtfP+5ja3V2VWnbefPLsBsm0DGV5k9qCrGdG9LGxg4clUwlO9RDlRx5+K8f2czNFasgNrT7uCW3rxolGfvTRVrPBwPOHM0ZilOXfm81tj+eCN9bpb/ELA5xrdlja49+rifpYE7OD74hFuFz/IoRSJLB6BEGxYnTZNCAYVq1OTEUBPO1HeJjK9YAGgryUFZ481piNzO7MIBuJJMJVbqzmZuPMEuflbtslrocUYgWeenSNyS8fhvBOh/hHNc0V19BfyLt+tTu0RoANpktcflukUXN8/a1/Luh2WdajgoR+BdIWWHNKdFplCFGyOtgSE9mJpwUXKNlG
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dcdebaf-ae8c-4fa2-84ff-08db40db1927
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 13:36:36.9583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NedbuoDKVbKAh3Mb4hj2uir/CYBY8+KWlSmP9bZQpQaoaFDfuBLfpVT3iZAueijNoG5XqsovMDM+TwyvnAbGTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7146

On Wed, Apr 19, 2023 at 02:00:38PM +0200, Jan Beulich wrote:
> On 19.04.2023 13:44, Roger Pau Monné wrote:
> > On Wed, Apr 19, 2023 at 10:43:22AM +0200, Jan Beulich wrote:
> >> On 19.04.2023 10:25, Roger Pau Monné wrote:
> >>> On Wed, Apr 19, 2023 at 08:17:45AM +0200, Jan Beulich wrote:
> >>>> On 18.04.2023 15:06, Roger Pau Monné wrote:
> >>>>> On Tue, Apr 18, 2023 at 01:00:53PM +0200, Jan Beulich wrote:
> >>>>>> On 18.04.2023 11:24, Roger Pau Monne wrote:
> >>>>>>> --- a/xen/arch/x86/include/asm/config.h
> >>>>>>> +++ b/xen/arch/x86/include/asm/config.h
> >>>>>>> @@ -44,6 +44,20 @@
> >>>>>>>  /* Linkage for x86 */
> >>>>>>>  #ifdef __ASSEMBLY__
> >>>>>>>  #define ALIGN .align 16,0x90
> >>>>>>> +#ifdef CONFIG_LIVEPATCH
> >>>>>>> +#define START_LP(name)                          \
> >>>>>>> +  jmp name;                                     \
> >>>>>>> +  .pushsection .text.name, "ax", @progbits;     \
> >>>>>>> +  name:
> >>>>>>> +#define END_LP(name)                            \
> >>>>>>> +  .size name, . - name;                         \
> >>>>>>> +  .type name, @function;                        \
> >>>>>>> +  .popsection
> >>>>>>> +#else
> >>>>>>> +#define START_LP(name)                          \
> >>>>>>> +  name:
> >>>>>>> +#define END_LP(name)
> >>>>>>> +#endif
> >>>>>>>  #define ENTRY(name)                             \
> >>>>>>>    .globl name;                                  \
> >>>>>>>    ALIGN;                                        \
> >>>>>>
> >>>>>> Couldn't END_LP() set type and size unconditionally? (But see also
> >>>>>> below.)
> >>>>>
> >>>>> I see, so that we could also use it for debug purposes.  I guess at
> >>>>> that point it might be better to use {START,END}_FUNC() to note that
> >>>>> the macros also have an effect beyond that of livepatching.
> >>>>>
> >>>>> Maybe also introduce a START_ENTRY() that replaces ENTRY()?  Albeit I
> >>>>> find START_ENTRY a weird name.
> >>>>
> >>>> So do I. {START,END}_FUNC() or whatever else are in principle fine, but
> >>>> I take it that you're aware that we meanwhile have two or even three
> >>>> concurring proposals on a general scheme of such annotations, and we
> >>>> don't seem to be able to agree on one. (I guess I'll make a design
> >>>> session proposal on this topic for Prague.)
> >>>
> >>> Oh, I wasn't aware we had other proposals, I've been away on an off
> >>> quite a lot recently, and haven't been able to keep up with all
> >>> xen-devel email.  Do you have any references at hand?
> >>
> >> Andrew said he had posted something long ago, but I didn't recall and
> >> hence have no reference. My posting from about a year ago is
> >> https://lists.xen.org/archives/html/xen-devel/2022-04/msg00876.html
> >> Subsequently Jane went kind of the Linux route:
> >> https://lists.xen.org/archives/html/xen-devel/2022-08/msg00236.html
> >>
> >>>> One thing needs to be clear though: Macros doing things solely needed
> >>>> for LP need to not have extra effects with it disabled, and such
> >>>> macros also better wouldn't e.g. insert stray JMP when not really
> >>>> needed. Hence I expect we still want (some) LP-specific macros besides
> >>>> whatever we settle on as the generic ones.
> >>>
> >>> The stray jmp can be inserted only in the livepatch case, if we end up
> >>> having to add it.
> >>>
> >>> Maybe we should just go with Linux names, so initially I would like to
> >>> use:
> >>>
> >>> SYM_FUNC_START{_NOALIGN}(name)
> >>> SYM_FUNC_START_LOCAL{_NOALIGN}(name)
> >>> SYM_FUNC_END(name)
> >>
> >> As said in replies on the earlier threads, I think these are overly
> >> verbose and come in overly many variations.
> > 
> > Right, I would only introduce the ones above and as lonog as I have at
> > least one user for them. I don't think there's much value in importing
> > the file wholesale if we have no use case for a lot of the imported
> > macros.
> > 
> > The main issue with ENTRY() and ENDPROC() / ENDDATA() is that we still
> > need a tag for local function-like entry point labels, would you then
> > use PROC() for those? ENTRY_LOCAL()?
> > 
> > I have to admit I prefer the FUNC_START{_LOCAL} for that purpose as I
> > think it's clearer.  I would agree on dropping the SYM_ prefix from
> > the Linux ones if there's consensus.
> 
> Okay, I'm glad we can agree on no SYM_. But what value does START have?
> And why would the type be (re)specified via ..._END()? FUNC(), DATA(),
> and END() ought to be all we need.

Does it imply that we would then drop ENTRY()? (seems so, would just
like to confirm).

> The type would be set by the entry
> point macros, and the size by END(). To cover local vs global I could
> live with _LOCAL suffixes, but personally would prefer e.g. LFUNC()
> and GFUNC(). We could also limit ourselves to FUNC() plus DATA(), and
> have (non-)global expressed by END() and e.g. LEND() or END_LOCAL().
> One less macro, but maybe slightly odd to have the .global directives
> then at the end rather than at the beginning.

Hm, yes, I do find it odd to have the .global at the end.  FUNC and
FUNC_LOCAL would be my preference, I do find {L,G}FUNC a bit
confusing.

> 
> Note that this is different from my proposed patch, where I aimed at
> the change being unintrusive. This includes that this was matching
> what Arm has (and hence required no change there at all). I think it
> would certainly be nice if these constructs were as similar as
> possible between arch-es; some may even be possible to share.

Well, yes, that would seem desirable as long as we can agree on a set
of helper names.

Thanks, Roger.

