Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214E65F7E17
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 21:36:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418247.663009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogt94-0001Fo-Gn; Fri, 07 Oct 2022 19:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418247.663009; Fri, 07 Oct 2022 19:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ogt94-0001Dv-Ch; Fri, 07 Oct 2022 19:36:30 +0000
Received: by outflank-mailman (input) for mailman id 418247;
 Fri, 07 Oct 2022 19:36:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PW8X=2I=citrix.com=prvs=2723e59b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ogt92-0001DS-Ru
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 19:36:28 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5468cdca-4677-11ed-964a-05401a9f4f97;
 Fri, 07 Oct 2022 21:36:26 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Oct 2022 15:36:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5341.namprd03.prod.outlook.com (2603:10b6:208:19f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Fri, 7 Oct
 2022 19:36:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5709.015; Fri, 7 Oct 2022
 19:36:17 +0000
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
X-Inumbo-ID: 5468cdca-4677-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665171386;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Tlb6xUuiyv3ehdq3dqr6CRWp/ClGMHT9k0urW2cDPLc=;
  b=TF7s40EryWt1VjNUlhtmJSFoohrR+kj8jExecovYFonjWSEB56b5g+po
   +IKlLctBRdcdgVOgzS8dEAf9glelt/ZKX7XQGe2pCXDc65HFhexNipglm
   cppgnd2kYWVxlcfXNcTb2zyhlZnT4sJSWJfOVhDjTRB51VTxkG3WDXQw3
   k=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 82246624
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AaopFOats0aSXX86J1CZ73bAOMefnOphVZv1Qm?=
 =?us-ascii?q?MifNp3fv4Xw3xbKv3m3sRAOTtXT8in+f9KLFo7KrYYkrBB+5gp36znrwqbCJ?=
 =?us-ascii?q?qyHHCV0Ikbv1gcjCz602xf45ielFaY0gBXBVjZFvyABWPxFTSkyH5tVnR22+?=
 =?us-ascii?q?F9zZS9nVaGRVYje02ZQKKt7F5a7EMhJDAuWrAiq6VmnuUBvHZ7WG2S1uU5g1?=
 =?us-ascii?q?5e/J8PhnYJNOnllo/IV78tqHeJz27alrEA5+zszpwFfNTOtAs+y2LDbYbR0f?=
 =?us-ascii?q?bMlQqIaM+SfRS3ZEVSc3ejLSWmMhIn6NJkfQLgtz7WgDiHfX0GeR3Zn6WO/p?=
 =?us-ascii?q?+6cyMQ2YtOeyJxxxrB2Ez6z0itkyoWFAY6PGFLyXnWBDfwgDXlwGGgFdIL9o?=
 =?us-ascii?q?Jaxv0Ee8KszNkOn/nwgCcTFKGv4HMYsFaj2Uy5yt3jhFaYqkms1fXJ9/s4jU?=
 =?us-ascii?q?oiSEVAwqaqqJc9sk/mM5AE7TJCs72gcG3Unp3xcaCgzqYnze58yJblKFocox?=
 =?us-ascii?q?v1U2R2dgeZjhMWAAHWo+NHxWm2389opQP79n/LpmapqQcsLmL0HN30he1/DM?=
 =?us-ascii?q?I4HgP58ndsyfo2GNxtrQCEaTiURU3hAI9sZF0oECCwIwvD2vKA6fw+dcvQ6a?=
 =?us-ascii?q?ZR5p70W+RrYYbx0cVeZOEYamK2p8+JxDeuG+GORwIuz5aRgGCvT1Cy8Dxocc?=
 =?us-ascii?q?X+6SdxjGJpkPPLaMlIHNyub2LFp7Cnbzk9Wm7EgXWgUaZHKTcpxqxyuaYpf2?=
 =?us-ascii?q?0+y5ngROJMCTvp26dG6Ifxm/83qkNRl3eIbMRaT1AKIkPhMm8o0ISXaKfhow?=
 =?us-ascii?q?/CaMtx+toJw6mZTu7x4mPAFLEBVaieA/KaLSwm0z3cKG370ZS8RiIcAUpHL4?=
 =?us-ascii?q?RWxEjlC9tqr4b1vOsICk5o7K90MHcUMXHovnBs8tbTavdNg6C6MgXwkaG/pV?=
 =?us-ascii?q?DeWB12hUDNvPOzZZawi7MfsnEV1WbYk8Gt2EBKMy+P4vzuzbxZJKy5hFbPr7?=
 =?us-ascii?q?dKh/7GQ2jWx5PwPJ8scEDOYZugFUIEPyyNsLjjD1vbK+CH1lTwq7hL8DiZHa?=
 =?us-ascii?q?zoSVRa5q5+oUHju3A6LPRsOzFsGcHcHX57aFdQo7DP270kYfgVa7MwTh7U23?=
 =?us-ascii?q?/cWQaI+cFeRttJ4JTy009X8yIaADFwcmLFj75D+QlDeUaYvswKd8zBNLlD23?=
 =?us-ascii?q?WQtL9VgsOT3uLudBjMK0WNkv1XuryNYKFyY869QS0TK/k4TEkBbtgokFtBej?=
 =?us-ascii?q?P16Vc08PbJG08kvRISoVfK+nf+jIIdlsH8vaM/r60mOhfqQtzl3z0Nz/Lt3G?=
 =?us-ascii?q?1FUd0x3JAeOhAxA1Z9l1R+sKpj41aniPKL4ggVG+FGEjjHpt6NlF+NzrhP9+?=
 =?us-ascii?q?fYyC1BlK4RZaoNhuiIXRVrWwYklUgTIHnzABMrIgD6MV9LrRsqNKArCtviQb?=
 =?us-ascii?q?NvuqBwrBpav2rhHnoulZKzWit97Kgi2M9IdcvoImG5wzLCEbf2Bg6/5lI8AT?=
 =?us-ascii?q?IrXC7kzd63VEQQr4GPZTQKHf7IXDmcrA0bKNjZbeTbNbYpmXMaOBOPnnqXlN?=
 =?us-ascii?q?sc03QX+06Ig76H/GqWix8DrnV6TAZuGN9DBAnoQlq+3UYqLobiDxxcd5uvwu?=
 =?us-ascii?q?0JMY1jvvQT3Upx/xtkVPzz7w4C3zXRWDEFrgjZVuoiPnxXxs/BrH5x8kLNlq?=
 =?us-ascii?q?u4Rz/ZP1qEZgJTBuhd1/skLCJexuZ6l4/HbM5MzfA6CE4gqhff21SjkWV/Pn?=
 =?us-ascii?q?zvRfUqVcU3xyZJGrNTWdIWFYz9taMwgw+3QyDJFAfL0S95qbuEZVd91Z9DaA?=
 =?us-ascii?q?bjcFmLhUiEt5lkdWZcsT16B3kS7d+jaWinCbQwkjt/sDDOEED5EySWnUTym/?=
 =?us-ascii?q?LqT/oNXlD0uFEkSh1ma3Uz0Vzqqad2jsSLO/VJXAJN/0H/7ylzPzLrWYJX+6?=
 =?us-ascii?q?rnHm758tqrJEFS/6c5c+2lycMSe4gOys/uEgYpoP7HEccAhni2YvWqceU6W9?=
 =?us-ascii?q?hcLRXR1t3huRLiMrIxbpSjnbWkP1foM0q7iRV/oMmFCyLtjVDLnFzQrrvicB?=
 =?us-ascii?q?0aLt+MLhoMn2ZEVCc09IqX/YLVU768mcIEtczwPXGWmsMxp5jKripZXPzBmf?=
 =?us-ascii?q?e/aNpQvuPB8JgnHyvi9lckA82xN45jUB8yjPURyrhiZwu0KGygw+RFO3g+e7?=
 =?us-ascii?q?C0Q56zQwWtICsXCv2WbX0uETfIzxCA7b/ZrJmOsmfwRuX+ewzeW9lhi7kZSw?=
 =?us-ascii?q?RKwST7NJHsmdXgiTl0RsPvL5otxqI1oPQMqV38JH3P/HxV/N7aGMMitX8J2j?=
 =?us-ascii?q?CEMlHvwz5bRGhvly1b+9X9VsGM7+BomraSpoA/DJT9q6I38gXd4zcBohI55P?=
 =?us-ascii?q?McloRiO+G+0w30wnRvRRq3aDGCruECl2UVaIl9+ghzp9w1SgZz+I1cwoxCOs?=
 =?us-ascii?q?7Eto2pJApkIjwZmKPxtrGJvFL3N71jeLmG5OiqDYDHrj9c+7ppYWAZTtsnvj?=
 =?us-ascii?q?3EI1fTDR+Xv/mchnoRIvfPV/3Ngu9uKMdm1NDYqoHoO4fJdCZv5F0CTJiVdY?=
 =?us-ascii?q?gXd6ms4z1dChyU1P3Cu2FnjGwgTJweX4fF+/+uvx55nwTpASmPxs3sxcB05u?=
 =?us-ascii?q?KhvFZp784pa/h0UqGu7IQgs?=
X-IronPort-AV: E=Sophos;i="5.95,167,1661832000"; 
   d="scan'208";a="82246624"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjjJI0RNrDlMOH9KJq+Whf3mcgs+bAdJfygyK/739DUQy0/tT541E+bGw6tr75bu0gvfw6WeJbeufPchFO8mJii0rXTV8mIJjmX00IxHo6WAhHnxoCgoaFbnODoL/gUKWk4q7AbvoNzNS1mbf8aisZuBoPVQuTQT6gDL2kcyoIqNY2+rNllzcb7HEmFvOXaOjehVSVPJRGk//NZmYGfjcfLkSMuMUnZ8NZuOSS88YaqzLb7oXTbho6qmkCrYIX6Lg+jKkC2ARYmo2FbMKipSYT7BWfbUy5Z5GPuW7/7v3ASDYFXeDVaoAvZtLdroEzEg8wxImUFDIkZ8Qfo0TIiQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tlb6xUuiyv3ehdq3dqr6CRWp/ClGMHT9k0urW2cDPLc=;
 b=I3oNz7Hz2ImA4OYDy3F2POu6UcUebBB9uZmJuBgyIQrxrVpnQR6V8rG7WaZe3GZveo7xppR9qC+I8k3z8OHP54LvdaIg19t10FVXgXfgsAPuoi1qUIhNb4vV0O18CfFEEWKbkaYDtPKU9QiAes0AF4H07l7lj1BSNzrK+6vgw0THYRbz6TCUqBLc8XL3bTd0iJ9AYGF29ZwMiQ0g3g11V9lHPQg1YAZOGFpoJNPQe7YVXi6qIUcWg9VbHHg1+OX83+RaU8D0cvoms4DKNBxmYBODMA6iDGhNGWCvyrevVRyuWlDyjl6e6zWQ0mdLKWiCZAW3R15bUa3Wdatf01R6JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tlb6xUuiyv3ehdq3dqr6CRWp/ClGMHT9k0urW2cDPLc=;
 b=vMRaBX1Jxr1SnDgAYlFDmxKwkVP1XMk7/vsJEALWZF3yIJB6cnSYlSswTTOrX4zh4Zn5xq4PL9X+uIOG52QbxIJWl/W2TzfpWMkFUUJ8UdnjuxBiU+BUpNG0TzwfCSv5UZVY5xHFS/hDRIxnd4ikDQLOAq/dZgwg4qhUNuQ0fUs=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <George.Dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH 8/9] gnttab: bail from GFN-storing loops early in case of
 error
Thread-Topic: [PATCH 8/9] gnttab: bail from GFN-storing loops early in case of
 error
Thread-Index: AQHXmmM/VphgVTklNkOGta5ws5Mbeq4F01sA
Date: Fri, 7 Oct 2022 19:36:16 +0000
Message-ID: <4808b724-31d3-bab4-e6b8-5e4bc5e0a104@citrix.com>
References: <eb7bbd51-1da3-9a7f-27c7-49dea1a41488@suse.com>
 <61775fdb-bf56-b6db-563e-81820e4248fd@suse.com>
In-Reply-To: <61775fdb-bf56-b6db-563e-81820e4248fd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5341:EE_
x-ms-office365-filtering-correlation-id: 4a670e3c-5b1c-4fff-5312-08daa89b33e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 SarGP9kUDzYiUOqxzUtZwZmEXtBBV6ZO9cZAW+GKZMDo6uR80xW83SBTIw4/eYO4vR006n0oWG5A44gV7SRHTRoZNpUi6W4Awzx8c8VhzBg+QlXitdAgI35y+GsWkE9wmLI3yTevpg0VggIFM3hIY1+zk2tRmrDeMZrjaypvCbPIWrI3FGDWgOrzRY2NNMKn1ki7iTEOuTWcYM2OuyAT3HynUPXymo+llWQw400OfDcOhLqO+8eTVXSogy6ZtiTVQk1Rix9504EPK2AfvRtem9VHgJhD/44S3xKPaaTCSp25bxYh+sE7P7IZHP6ET+8ySGn3mSG5xkImPGnT1L37Do0iufsEbeVQ6MDnKCWFE4Y09X9wkVs9MK718Wk0htJfKE9Rb1TsacV7JxGG7Hzq/UXdUtfNnAiBI1EssIPiR+Ak7R9VpyJeSxJjlMGuLDf3oCL1RUkBN83ygQIBab5F/jHArWVwMPVqWCDj7UMyz6i6xw9o0K4WlhIogsRR8F4yH+UsMFhNhghNBBvd5R2mAHlEpxYQtv9SzjXL1cXLtgLX0kTPR5dxil186xUd9nr2KMTJJ9M6Figm5yn2oWT0f0CcYU7uunN8+s2kX6dwzd+G1MZC4taRmWXvgtnmSS5P4eIEawRLXEmV4IqDJc4V+AnHeSan6po1c6pseZjYBd9lCAoE9LrpQIOkTDVXpjctqbhLrpafD2X9Itbcjae+e+1LxDfj5MiablkHONYVtOYVdm3G10gz7lhO14LVCrxym530pnAhOmXXLFYlTOPzWASqxhXnBsvI5+JGllPVdoSozJWSgN0L6y/j+fBKEiRIpBOeUYyKftaqhwen4/Ct+A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199015)(2616005)(186003)(83380400001)(38070700005)(82960400001)(122000001)(38100700002)(5660300002)(4326008)(41300700001)(2906002)(8936002)(478600001)(26005)(6512007)(6486002)(66556008)(8676002)(66476007)(64756008)(316002)(66946007)(6506007)(66446008)(76116006)(91956017)(53546011)(71200400001)(54906003)(110136005)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RGEwRmJqMXRxWWhYRk0yS2tMQWl4dkVxaWEyK1JGOWJOQjJqTWZRa2x4bUZC?=
 =?utf-8?B?Ly9abUlScGxYWC9FSVhBaTFzazdMaVRudkljd2JBZzcyam0zNXRndjVMaENP?=
 =?utf-8?B?YWZ5SzNySnppZy9YUUY3WkVqSEpSQm5KZk9lWWZtaWdKUU16VWNWS2lxL0tC?=
 =?utf-8?B?OEZvejJKYXhvV2pRdTEvclQ1R0EybEJLWlR5cE03cHJlMUpEaHFobU5HT2dM?=
 =?utf-8?B?SEhQOFRJWUY1eVpGVUNzNGUwT3dmc01OVlZrU0tobWczc2s5VUdwSHJycmMy?=
 =?utf-8?B?TEZWRlhuS3lkUmZ5VHk0OEZ3b3hNTG5rREpDQ3VFWmdLNnZIQkhxak4wN1VE?=
 =?utf-8?B?dFVNcEgySFdsN3FUUng4VVpsRE5RcnBTL1o2amIxbTRTRjhleDFzSVZGdGRJ?=
 =?utf-8?B?N082RnlPdGdxNXdvVlQrdkJJQ2xWRkluSENTMUcwdFU2WVV3ZFVVZWRGK0lt?=
 =?utf-8?B?U1JYUGloL1psTThnODdORlZzSVNPUDFSdi9ScVBlMDRaeSt4THZpVjd6cTdV?=
 =?utf-8?B?bTZLU2NTOUNSclg4NThqNVc5eWhiYWhBdGFSekgzRWpoTHZ4cFBOUXc1bXBH?=
 =?utf-8?B?bVN3TjB1QjNmb1diMlhhL1RBSGF3aXhzaUt1OVFBcTZqeE9qMzVtU0w1VWty?=
 =?utf-8?B?K3VGd0N5cEowa25OcXI0MDVmdG5KWnVIUHVJekRUajZSMEE2Tm55MVY5RXpZ?=
 =?utf-8?B?cFBjalJmMzNIa3BkYnUzdTlGMkZpb0wxQlhQa1I3MEFBS0VYczFKQkhQdUFX?=
 =?utf-8?B?RzNtTGJ6VU5qSWxWbEd3V0FUZXRJeEx5SEJPWGYxekhROTlOWEFpMVhpMTBG?=
 =?utf-8?B?NnE5bURWaXEza09rWnVyaFdGMktocWgrZW4zQVFNamJpcjJ1YWFqckNoMXJY?=
 =?utf-8?B?cGJTUUg2Uzh1c2xDL3hYZDUwZzhoS20rRElGckRyU09oYUcxTDZGWm5BT0Vu?=
 =?utf-8?B?c3J3MkcxSTF3bFFqb1VONnJyYURSQWpVZFNXOTJBL2xldU0xZ1FhOEhCY0FC?=
 =?utf-8?B?REY4WERqa1dodDkxSXMzYmk4bDdzSFdjMytoQkNqRDZudkY0MWJ5TzhSNm1j?=
 =?utf-8?B?ampTVlpWMFc2Um9yUE5uK3dWbXNHODJTc3N5YU5SS2VQVldGS0h0TGtJdnBI?=
 =?utf-8?B?Q3VFK2ZVajVWa095VlFRVU9xVlluTk1xZ294bEJjYzcxc1JNRXFoZlZQUE93?=
 =?utf-8?B?THY0NlJneG5oNmRTMVBrb0VKb0k3V09FaFgzbFNVdkpkbUs1YlJNZ1lEYlpp?=
 =?utf-8?B?cGtqTitGRXRCUmY2bDI1N0Q0Z2V5ZnpTT1ZCME84ZWtlZmJUclpETjcwNktk?=
 =?utf-8?B?VG5mQk9tMGE2UTJBWWhoVXh3OEZkYWJueXRxUUZ6RkgyaDNLdS9oREEyNzRH?=
 =?utf-8?B?N3BVU1dHcFNBOStQeFpkU3lkK0RleEUvUTl6REVWV3hvRUZ6NldnMUpybTVk?=
 =?utf-8?B?ZklWZVZpOTJkWjZOMHoyeDB5cXdydzRqNGVGU09lL2c1dVNrZVBteS9ZTXBO?=
 =?utf-8?B?RnRFR3doaWxLTzJwZ3JMVEI0cU5adGxLUmVlSXZoWlV1SHI0d3NlSStXaEJw?=
 =?utf-8?B?L0dlVWhyU2N1ZzRkK1dURWI5VHFPYmRuMjR6T3NhNGNjOHAyNitLcXJKTnBT?=
 =?utf-8?B?U0RmU3BJdEE0c0lSM2tMSVFUUlJYZGZlZ3FkY1dJTHZkOGNGcUdzV0svMkc4?=
 =?utf-8?B?QlBabnI4OFNOekxhR2lIWFlvaTlGaTZocjB0YU92eEd2cjd1cHJQdW5FTk5D?=
 =?utf-8?B?dTUrY2VLVmZEQjVqT0ludlNscWFlcURPS2E4MzFwakx5N0k3RFozdGxFMFRO?=
 =?utf-8?B?alphVHIydUJIbkVlcm5SSTBKaFd6VVJUQjVrU2xHRi9kWUQ2a1I3VzIrclg3?=
 =?utf-8?B?RGNzUUU3cVhKT25WVFRLZU05REZhcVdRdi9pTjBIbGdEbmpJT1pRdE5xcFNn?=
 =?utf-8?B?MmFaMEdZQWQvRnRXQjRicnc3MXZiVG5qK0lHNE1xVVRneUkwSVFnaGR4NWFx?=
 =?utf-8?B?VzdGVVphSzZBVGhzRVpxWHhhQkVIWlFXWllLUmpOVldMS1JNbzRxMmJzd3NX?=
 =?utf-8?B?NWc2YzNhZzBnRm5EK0Nua3BWWmdyUDFXN0huRzBTZW5vcVdrd3J6aHEvZzFF?=
 =?utf-8?Q?CSzsGtlUhhPRn8MGiLt8mHuN0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BFAF6F8322D2934DB4277A43E0B8C53F@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a670e3c-5b1c-4fff-5312-08daa89b33e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 19:36:17.0057
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +yUcbs/u063krRMnLJSqVJmTx3E84mXvLL/vozqVIEWH3Ff1XpeQmBKPj8lhViPMyGOFQqHavvYv+ORQrSq1XfFhIDDtVTqXcsacLhOn1V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5341

T24gMjYvMDgvMjAyMSAxMToxNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoZSBjb250ZW50cyBv
ZiB0aGUgb3V0cHV0IGFycmF5cyBhcmUgdW5kZWZpbmVkIGluIGJvdGggY2FzZXMgYW55d2F5DQo+
IHdoZW4gdGhlIG9wZXJhdGlvbiBpdHNlbGYgZ2V0cyBtYXJrZWQgYXMgZmFpbGVkLiBUaGVyZSdz
IG5vIHZhbHVlIGluDQo+IHRyeWluZyB0byBjb250aW51ZSBhZnRlciBhIGd1ZXN0IG1lbW9yeSBh
Y2Nlc3MgZmFpbHVyZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPg0KDQpOb3QgcmVhbGx5IEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPg0KDQpUaGlzIGlzIGFuIGV4YW1wbGUgb2YgYSBiYWQgbG9vcCBh
ZGp1c3RtZW50LsKgIFRha2luZyBqdXN0IG9uZSBleGFtcGxlIHRvDQpkZW1vbnN0cmF0ZSB3aXRo
LA0KDQo+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYw0KPiArKysgYi94ZW4vY29tbW9u
L2dyYW50X3RhYmxlLmMNCj4gQEAgLTMyODksMTcgKzMyOTIsMTUgQEAgZ250dGFiX2dldF9zdGF0
dXNfZnJhbWVzKFhFTl9HVUVTVF9IQU5ETA0KPiAgICAgICAgICAgICAgICAgICAic3RhdHVzIGZy
YW1lcywgYnV0IGhhcyBvbmx5ICV1XG4iLA0KPiAgICAgICAgICAgICAgICAgICBkLT5kb21haW5f
aWQsIG9wLm5yX2ZyYW1lcywgbnJfc3RhdHVzX2ZyYW1lcyhndCkpOw0KPiAgICAgICAgICBvcC5z
dGF0dXMgPSBHTlRTVF9nZW5lcmFsX2Vycm9yOw0KPiAtICAgICAgICBnb3RvIHVubG9jazsNCj4g
ICAgICB9DQo+ICANCj4gLSAgICBmb3IgKCBpID0gMDsgaSA8IG9wLm5yX2ZyYW1lczsgaSsrICkN
Cj4gKyAgICBmb3IgKCBpID0gMDsgb3Auc3RhdHVzID09IEdOVFNUX29rYXkgJiYgaSA8IG9wLm5y
X2ZyYW1lczsgaSsrICkNCj4gICAgICB7DQo+ICAgICAgICAgIGdtZm4gPSBnZm5feChnbnR0YWJf
c3RhdHVzX2dmbihkLCBndCwgaSkpOw0KPiAgICAgICAgICBpZiAoIF9fY29weV90b19ndWVzdF9v
ZmZzZXQob3AuZnJhbWVfbGlzdCwgaSwgJmdtZm4sIDEpICkNCj4gICAgICAgICAgICAgIG9wLnN0
YXR1cyA9IEdOVFNUX2JhZF92aXJ0X2FkZHI7DQo+ICAgICAgfQ0KPiAgDQo+IC0gdW5sb2NrOg0K
PiAgICAgIGdyYW50X3JlYWRfdW5sb2NrKGd0KTsNCj4gICBvdXQyOg0KPiAgICAgIHJjdV91bmxv
Y2tfZG9tYWluKGQpOw0KPg0KDQoNCklmIGluc3RlYWQsIHRoaXMgd2VyZSB3cml0dGVuDQoNCsKg
wqDCoCBmb3IgKCBpID0gMDsgaSA8IG9wLm5yX2ZyYW1lczsgaSsrICkNCsKgwqDCoCB7DQrCoMKg
wqDCoMKgwqDCoCBnbWZuID0gZ2ZuX3goZ250dGFiX3N0YXR1c19nZm4oZCwgZ3QsIGkpKTsNCsKg
wqDCoMKgwqDCoMKgIGlmICggX19jb3B5X3RvX2d1ZXN0X29mZnNldChvcC5mcmFtZV9saXN0LCBp
LCAmZ21mbiwgMSkgKQ0KwqDCoMKgwqDCoMKgwqAgew0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBv
cC5zdGF0dXMgPSBHTlRTVF9iYWRfdmlydF9hZGRyOw0KwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIHVubG9jazsNCsKgwqDCoMKgwqDCoMKgIH0NCsKgwqDCoCB9DQoNCnRoZW4gdGhlIGRlbHRh
IHZzIHlvdXIgdmVyc2lvbiBpcyAtMzYgYnl0ZXMsIGFuZCBmYXN0ZXIgdG8gcnVuIGJlY2F1c2UN
CnRoZSBsb29wIGRvZXNuJ3QgbmVlZCBhIG1lbW9yeSByZWFkIGFuZCBjb21wYXJlIG9uIGV2ZXJ5
IGl0ZXJhdGlvbiB3aGVuDQp5b3UgY2FuIGV4aXQgYmFzZWQgcHVyZWx5IG9uIGV4aXN0aW5nIGNv
bnRyb2wgZmxvdy4NCg0KRnVydGhlcm1vcmUsIHRoZSB2ZXJzaW9uIHdpdGggYSBnb3RvIGlzIGNs
ZWFyZXIgdG8gZm9sbG93LCBiZWNhdXNlIHRoZQ0KZXhpdCBjb25kaXRpb24gaXMgbXVjaCBtb3Jl
IG9idmlvdXMuwqAgVGhlIGNvbXBhdCBjaGFuZ2UgY2FuIGRvIHRoZSBzYW1lDQp3aXRoIGJyZWFr
cyByYXRoZXIgdGhhbiBnb3RvcywgZm9yIGEgc2xpZ2h0bHkgbW9yZSBtb2Rlc3QgLTExIHNhdmlu
Zy4NCg0KQSBmb3JtIHdpdGggdGhlIG9wLnN0YXR1cyBjaGFuZ2VzIGFkanVzdG1lbnRzICpub3Qq
IGFkZGVkIHRvIHRoZSBsb29wDQpjb25kaXRpb24sIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KDQoNCkluIHJlZmVyZW5jZSB0byB0aGUgaHlw
ZXJjYWxsIEFCSSBhZGp1c3RtZW50cywgaXQgb2NjdXJzIHRvIG1lIHRoYXQNCmxvb3BzIGxpa2Ug
dGhpcyAod2hpY2ggd2UgaGF2ZSBsb2FkcyBvZiwgZXZlbiBpbiBoeXBlcmNhbGwgaG90cGF0aHMp
IGFyZQ0KaG9ycmlmeWluZyBmb3IgcGVyZm9ybWFuY2UuwqAgRm9yIEhWTSwgd2UncmUgcmVkb2lu
ZyB0aGUgbmVzdGVkIHBhZ2V3YWxrDQpmb3IgZXZlcnkgdWludDY0X3QgZWxlbWVudCBvZiBhbiBh
cnJheS7CoA0KDQpBICJjb3B5IGFycmF5IHRvIGd1ZXN0IiBwcmltaXRpdmUgd291bGQgbW9yZSBl
ZmZpY2llbnQgc3RpbGwgdGhhbiBhDQpwbGFpbiB2aXJ0LT5waHlzIHRyYW5zbGF0aW9uLCBiZWNh
dXNlIHdlJ2QgYmUgYWJsZSB0byBkcm9wIHRoZSBwMm0gd2Fsa3MNCnRvby4NCg0KT2J2aW91c2x5
LCB3ZSBkb24ndCB3YW50IGV2ZXJ5IGluc3RhbmNlIGxpa2UgdGhpcyB0byBiZSBkb2luZyBpdHMg
b3duDQptYW51YWwgYm91bmNlIGJ1ZmZlcmluZywgc28gcGVyaGFwcyB3ZSBzaG91bGQgaW52ZXN0
IGluIHNvbWUgYnVmZmVyZWQNCmNvcHkgaGVscGVycyBhcyBwYXJ0IG9mIHRyeWluZyB0byBpbXBy
b3ZlIGh5cGVyY2FsbCBwZXJmb3JtYW5jZS4NCg0KfkFuZHJldw0K

