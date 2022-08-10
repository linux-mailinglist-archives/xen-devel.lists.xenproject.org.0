Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F402258F2AC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 21:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383825.619026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLqvY-0007rK-VR; Wed, 10 Aug 2022 18:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383825.619026; Wed, 10 Aug 2022 18:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLqvY-0007ny-RU; Wed, 10 Aug 2022 18:59:36 +0000
Received: by outflank-mailman (input) for mailman id 383825;
 Wed, 10 Aug 2022 18:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLqvW-0007ns-Tt
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 18:59:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 908caaa6-18de-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 20:59:32 +0200 (CEST)
Received: from mail-dm3nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 14:59:23 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 18:59:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 18:59:21 +0000
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
X-Inumbo-ID: 908caaa6-18de-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660157972;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=v+FUkkNXUdsDRza/BZmXmza+uQtzxQ3xL7qWZY82AS0=;
  b=DGNDY+eEwiuQcJ49QyMbWanDy7q788nkfSYGxJZXwiVALONUgauAa+5R
   lddhnJ6XcCBnEw5hS6qiH9obvyKyhcs7jbUV8YHTOyKZS9i61z3paMexZ
   RZhCOzRXRUCDgvLHLMUULsvwWO3L+CvM21EjnENnRfGCoBa8gMVHdIrY9
   g=;
X-IronPort-RemoteIP: 104.47.56.44
X-IronPort-MID: 77572999
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Oy2rcqAFnqK0JhVW/zfiw5YqxClBgxIJ4kV8jS/XYbTApG53gzNSn
 WFNUWiPP6rZazT3fN4iYYqx9EkOuZSHytBmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E3ratANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq3uU0meaEu/Dga++2k
 Y608pa31GONgWYuaDpEsvrb83uDgdyp0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSq
 zHrlezREsvxpn/BO/v9+lrJWhRiro36ZGBivkF+Sam66iWukwRpukoN2FjwXm8M49mBt4gZJ
 NygLvVcQy9xVkHHsLx1vxW1j0iSlECJkVPKCSHXjCCd86HJWyqw/flADXERB9M/p8VNOHtg3
 qcIIhlYO3hvh8ruqF66Ys9Fo5x5aeXOZ8YYsHwmyizFB/E7R5yFW7/N+dJTwDY3gIZJAOraY
 M0aLzFoaXwsYTUWYgtRVM14wbnu2iWXnz5w8Tp5oYIe5WTJwRM3+7/qKNfPIfSBRNlPn1ber
 WXDl4j8Kk5FaYPFmGvUmp6qrvPT2hrKWKI3L4f70d5Wmwa59ksBJjRDADNXptH80CZSQel3K
 UYZ5y4vpqga71GwQ5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceWjgCx
 lKP2dTzClRSXKa9THuc8vKYqGi0MC1Nd2saP3dYEU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdv207gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:XNNvF6iFIufyRJvB3MoS6CXAKHBQX/J23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICRF4B8buYOCUghrTEGgE1/qv/9SAIVy1ygc578
 tdmsdFebrN5DRB7PoSpTPIa+rIo+P3v5xA592uqUuFJDsCA84P0+46MHfjLqQcfnglOXNNLu
 v52iMxnUvERZ14VKSGL0hAe9KGi8zAlZrgbxJDLxk76DOWhTftxK/mHwOe1hI+VSoK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtSJV9V6aEtDUVpvjqzFoxit
 HDrzopIsw2wXLMeWOepwfrxmDboXgTwk6n7WXdrWrooMT/Sj5/IdFGn5hlfhzQ7FdllM1g0Y
 pQtljp9KZ/PFflpmDQ9tLIXxZlmg6funw5i9MeiHRZTM83dKJRl4oC50lYea1wXh4SqbpXVd
 WGPvuso8q+QmnqKUwxeVMfmeBEa05DWituhHJy4vB9nQImx0yRhHFoufD31k1wiK7VDaM0p9
 gse54Y6o2nBKUtHN1ALfZETs2tBmPXRxXQdGqUPFT8DakCf2nAspjt/dwOlaiXkbEzvewPca
 76ISVlnH93f1irBdyF3ZVN/ByISGKhXS71wsUb45RioLXzSLfiLCXGETkV4oCdiuRaBteeV+
 e4OZpQDfOmJWzyGZxR1wm7X5VJM3ERXMAcp95+UVOTpcDALJHsq4XgAb7uDauoFSxhVnL0A3
 MFUjS2LMJc7lqzUnu9mxTVU2OFQD2KwXuxKtmuwwE+8vl8CmQXiHlltb2Q3LD5FRRS9qorYU
 B5PLTr1qumuGjexxe701lU
X-IronPort-AV: E=Sophos;i="5.93,228,1654574400"; 
   d="scan'208";a="77572999"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MM/uom8E4dE7fdM7B3orRtpZAdRrh9n/8kcKCsszv4YxaX91XaMr0KIbhxMGKgM7C60UZ8YXfad+gxO/uZv8JbsiiWom3IDYRlYp+q5Z9g8NcExuRrPuSSQdye20W0TAizUPLGSYkVKHeEqE3sRDqvlpv2LQwwkYWOfQoB2b/zlxBxjZYZ0XzqTpGYbwWrxuJW1oAJ1BM3QLZRb1Dk8qnpWg4rIqUE18gE/wCaSNcxWpgjOPQJi8Gp5k9hWOZ1b1x3q5wBdwE2TnmS5mvVQj4FGLXDFfrx383fHF3GT2wVjDmRhHclqqxhxc42yjoAZhe/gYTrXJ2fvDip+qUdmxiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+FUkkNXUdsDRza/BZmXmza+uQtzxQ3xL7qWZY82AS0=;
 b=Zz2tMEa4atO9EAbGyxesTc7HtsmWxCJ7LACPqwqb88Sg3KtHzFEXxmXlTz7zQ5/RCrsMRn+vdUDTFbjksU4c5qLSzV7ZOC6G5eN5n2fuSUr0379N8LxlwD+8ZvPjQqc5EVZ7Hg5ElXpzqJYfC7kYY1bMiImsMcwijVQjSvLMj7kBPn79CyJGg9tsorCyz8bmGVDdCCku5nC8Nkf7lDGJKcq+ziSoc+HXELPRUMHl6uHPrG2dm5S/33ClxYtHAsezkKU3YXYVXPlDTT5YZuvOt/oPizM7i5vcXhwvAghamXwj2ftx+g+8u/oUbazghdWgVJiuVxYlQMuIdg8TV7Qudg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+FUkkNXUdsDRza/BZmXmza+uQtzxQ3xL7qWZY82AS0=;
 b=aQjzjeM8oDU34ktxmkPfRXBPCUJJFryPaYFT3OxcVCC3JH8VjBPC4sbabtZBkkQYX28daOCfLV5O1h/SJyi3Y/zeoYvSnbc4J4c7hJxaeIKyvlDMKfuPpzMASmlqkPDQdgjGrUMGgCWT45VU1T3Uqt3ozaZhCNll+7rsamybjHk=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 07/11] x86emul: handle AVX512-FP16 complex multiplication
 insns
Thread-Topic: [PATCH 07/11] x86emul: handle AVX512-FP16 complex multiplication
 insns
Thread-Index: AQHYgKLgKph3y+48mU+QAqm9zgIC462o1VOA
Date: Wed, 10 Aug 2022 18:59:21 +0000
Message-ID: <288e2b63-52d5-1ff6-ff4e-2b3398abe844@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <b4054ce2-7645-e467-ad91-93868d493845@suse.com>
In-Reply-To: <b4054ce2-7645-e467-ad91-93868d493845@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 13260cee-6294-4f2a-c833-08da7b026f7d
x-ms-traffictypediagnostic: PH0PR03MB6560:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 G9OZPrTgLLkgmz1GVKt/o62n8FWSblRF0lgzeCXrgPS8xvZZfveeqg6ghLBQbT+NB5ceNcCrpFEKTAI2RUwVj8rBshd3FmdhfuGtKEKT3dib1gptHhzDpwtOfNoza1jr3uZBCNSB4fMUC1aMoVRIe7F1j+FvjlZFchxRwdNWbuT+noUrBLHyv9HJPVDmsfK1xJr+O7/fWC36zspZgtpi/GqF28dvOe5kESUIg4DJjbNvYhM9BdJBMG06tpLCZ7nbWbvBuyLOEg6aIRbryQKYrkI2Tv8iqxLOfhbqbajs7hpVtwqtp6iFebTDIoR/lE8NPPMsoR79WtH1EjVuTsK2nQbM9zzvfBwpQnOymHQwdsQbamyxR/MTf6rWj3Vg53VBRLwFZd1SaPALbO6xQ50a1lAC/QK0qIAom/R6Fh30sI/9Qc+n88QoiclSMeTxnzDfz19k16gT6cwGc3ZhzJXrEQ815viqkIJLkpRp6gNOlbpwLqR+r/BsMre+LU5idJjgUOQZJt6/YquVvZHtNJSWMbGmztRIH+h/yEQspwCJqmVL/mka896P+GhK6Jsy82QaEuYIbPV73rV6oR4eApafClxZ9fhP8YfJBPJWhXKQHMsaVEyT87mSdMgQ44M3bCOa1rx0rv9+FoFaiPOsVhWpZb7cMVvgu2qOkTSWGihcIv1/yK62b40byRWdjIQFITtmBT4b9f6GcePyFRdo4RBZBRvgNryz1d2+1/nJTIgFeg1+gkrqvVACV/ZGeI1hSS0w17Q71GT8oI9sQBl0ipVbKsAjXMfoHDo51pScMMSk4W66cJGJ2tMJ6a+7NtixDWDpa/iK+MjmfGvTS2SrKd5oJHSrY3sg/zaBgPPgbH0IU1go1uhT3uRo8vezuVibC1t3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(64756008)(66946007)(66556008)(66476007)(66446008)(4326008)(76116006)(8676002)(5660300002)(316002)(54906003)(91956017)(2906002)(8936002)(38100700002)(122000001)(38070700005)(86362001)(558084003)(36756003)(31696002)(478600001)(6486002)(26005)(6506007)(6512007)(82960400001)(41300700001)(71200400001)(110136005)(53546011)(107886003)(2616005)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nm0vMDQrZno5RkJpRkpjZ0ZDVTA1UndZZCt3bDlLRmZNTlBWUnB0SWt5RHJC?=
 =?utf-8?B?aFkrd1FFdHY0UHM5Kzg4c0t6WURxNVpNaUlORHBmRE5yTkx4cjRWTk5nL0Zt?=
 =?utf-8?B?OHN0TnY1WC9lUEpCRVFFUVAycE9Xb3NGMFc3VkJRMnE3bmdhb240cEd1ODlC?=
 =?utf-8?B?OXQ3TnBEODhGTkhmb01oMnVKK3hHRHUwbUlMTldVc0YrQUszY05vZmlUT3Uw?=
 =?utf-8?B?UG03MGhITzF0cG1SZ1g5T3ovRitCV0wzZjRZM2l1SmVuUEhNd0lzZXdSb0dG?=
 =?utf-8?B?V3RjK2xET1pPemRHa1BVc2cyeXpqeHVnR3M0MmlOa1Q2R0NlSVpOK0N3dUhk?=
 =?utf-8?B?c3BYRlF4OXk2SnFoR0s5RWNWMm9yNXdWZlNBZXdJSSs4WVJOWng1MjAza3BX?=
 =?utf-8?B?eWJXT0lJa0tsWDdMdnNxN0VCU0d0ZXNCWHFVcFBVaHZUd2RPb3hHUVUvdkdr?=
 =?utf-8?B?YXhqY3VZU1Ntb2tycjdqOTg4UkMyT3ZvQkJKeHB3WmZ5SUZlMVlBRVBKRFN6?=
 =?utf-8?B?MzBIUk1lL1ZCenF6R1pMRjQrVDVWUkVyMjRFZDNCUTgreVhHN0R2bzJPZVpV?=
 =?utf-8?B?NGd6S3VPSjYxdiswSU9NQkE3TnlQUjU1RVBzWWlCRldmeEJjdTV5bmJ0VmRx?=
 =?utf-8?B?b1hCcjgxY3RHYThFQnFnMEErKzJUcld6WGQxeEJCN3NWNG01eDB0QVdibXRD?=
 =?utf-8?B?SmlQYlhmbUFzQ0xXOXVLcW9IR05QVjcxMkxoS3RhTitneTBwMEFlczdkK2Mw?=
 =?utf-8?B?K2lUREhSdmRTQ3VIQVJwdWpxeGJackR4cjhNdkRBdkZveElKY0kwTjE1eHZk?=
 =?utf-8?B?OStLamJKazNmMTFiclBPWkxGSXA1c3pYZHVuMEdNdldvUmxZZkFyVmtmL21n?=
 =?utf-8?B?Q292ZG5BcHRoZEJWOGxmcUZvOWxYTDVlaDN0czhNd3dCQUYzZnYyM2lNMlhx?=
 =?utf-8?B?ZVV0a29XMWR0OGhNUnEvRmpQb29JVEQ3Wk9YUjNleXJrcHVnQnZPYXhRNTA2?=
 =?utf-8?B?aXFjellxN2d0d3IyQWlVUEdySVowb1dwZmtKalR2STAyMEFlNUJiUzdwV2lL?=
 =?utf-8?B?Qmh6bzMwLzNXUTNtSUZRZ3dzMlAwOEU5Q0h0UEl2QzNkdnFLRmFRVks3dzEr?=
 =?utf-8?B?cGs4b2UxWnZSVUtleWRFaDNXL3BxYlBZWWg1NitEK1czakVlRzJkRHhGUWMr?=
 =?utf-8?B?eUxGcVh3SksxdlYyb3dhdHJ0aUtGbDIxMUpUREVvQlY4MDNrdS9pNktSc2Z3?=
 =?utf-8?B?dGdtME9QemZ2L01KbWxNNVk0d2c2SStlcnpFL25OVkg2YXpVSUVFMkJwT1ZX?=
 =?utf-8?B?ajd1ekFVR2pHTG5CLzhuL2gzbFhYNHhPOGFiOFduT242dXdaSFFhOUJ4dTdv?=
 =?utf-8?B?MXZyeGNQZG93Qks0T2hMSXBTWE1pVmlCU09ISWh2L2VmZGs3alNQNThKNE1Y?=
 =?utf-8?B?MzZNT1ZRdnJ5YnY1Zyt6UU5XdUJ1Z2RsSUk3cndxL3lSbWo1R0R5b1kxV2NS?=
 =?utf-8?B?Q0J1NVZwN0pic1lSWHB1N1drdXVCbU5sNnhZdFg0WUdGRVQrejUyRHJudUoz?=
 =?utf-8?B?SFJLSnpicjBSWFR5WEIrOFp3ZVVPbEgrOHNoWlM1L1lsWUozMzJ6OTdPdnls?=
 =?utf-8?B?UTd0TndIKzlsd1FCTkg2SWpmakJzQzNSaVc5KzkvVS9aR0RSRmcvaXpaajhG?=
 =?utf-8?B?R0d2TVNCTUxzS3RaTUZ2SDVLNUs2dGljUU5URlU2S1BIa1MyT0pEUVB3cWF0?=
 =?utf-8?B?bG9CWWovMmNFb2JkTWsvMG5NMWZNTGU4OUJRbFRkR0lTdFFFQ3F0ak1HSjVa?=
 =?utf-8?B?eGZyTXpycWZEL3QvUEsxZHpvTStyQWJjaEpoWDZEWVpFTEhpVmY0MDVDMm9i?=
 =?utf-8?B?dUdXdlpGZzg2YWVjNVp6VjZHRVBMS2FWQjZEb0N1TjB2Mm92WUplTXFrTDJX?=
 =?utf-8?B?MmpaUi9kR3MzT0VLR3EyWXJ1OENaTUs2WEtzZ0l5QlIxaTNRTURYNGltMG12?=
 =?utf-8?B?YVhRNkRDeXlIWjNvbE1MYk1PcnZzYUVtb0E0aXcvYVFMYWY5WGZrbERrV0ZF?=
 =?utf-8?B?alRva1IwdXptc1Y3S1pwd2R0am9zMmtMSCsraFJIVURkU2VrY1dLMVJFeDNF?=
 =?utf-8?B?ZjRHZUVBYUdIYmYwbkJWVkVqdHRzNlNyWVZ1c1F1emg5c2ZRd0ljejBTazFF?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC1924FA874CD34685A3A1D1533CEE36@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	rQQnJy1wzwESKlw7qAhAxgdx9UgULy66VQmwbfrXJ0CLpGNwRGNQr+UVXHDDt3dhxSz99yXmiZKpwN0lgRTha4xnco7zYdN5PmUTiykvlqc0Ddy90j+sYsxtL99QopNW4d1JMGZkBveKq+YWvysPIAhy2OZEzRGXjz9TWm89A6BeAPlQAsccaEyb2Mp84S6GqcCZeblmzcSzzXJ48EGWVGZjgqlPDaWgEn13Z1hmXmh+OamrCkPfmpBPEU3KqwmNrwc0GiHYWtXeIgYjNQvFXhKKVYKZE6Su7EvKuxmpQvoPJx0Dpo7vluKopa+byvQnB9QZya/ogpgmsgrfPt1VUTHtL73ydiosQk3TQRX/zPCeAXhNRAMFetnH+ebf0tf66IX/VBBLGrkQydiRuyymeOmqJxETgOLicUZcBp7Qw4GhrjC0ypn4ACdJZzhMyOOgqzWXk0kVZ6H/U6BobsCF2MHcmgnXyrDHxgrVPkVlTTnRO1kOjmW1RseopfnCj6oxXkWOqUxGk9dondQXxa+MlYUpWDizxr95J3twR3vwFLD435I4D69ha8Q/ZT6vFg0ccsXaQxYA/lN9KDVsIUOYiH8cRHhl58dYefMKOGfGsJqBe/WaQm4TsbLULqq5hvfVdCRd6Y5xoiSxkV7vbVFw2FtH8yujRC3CEpvL2KsDCUt3Ze+spUb1PCpKQVSi3Oc9NU98xr9dIwWtivXFz9wmiEwyy+emKmdn9vnvrAm5qu/d5+eNWLiFoEKv2We3H9VgHg3nj1MqmP3e3vs7AE0FI/1OO6RdGC6pny4t965nW8VSLJtUMb3gxCfpzoJ/+469
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13260cee-6294-4f2a-c833-08da7b026f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 18:59:21.6386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /HYbxqC6ODeaDUOFWMLv/Yqu7r/T8bzu7YBAw6SXaSXY4CVhNugb3HJ8f8cbrdt6v4mHdxRyjjNEMCsIySrq3xbhKwPh74nxsNmqmDGdVRY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6560

T24gMTUvMDYvMjAyMiAxMToyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEFzcGVjdHMgdG8gY29u
c2lkZXIgYXJlIHRoYXQgdGhlc2UgaGF2ZSAzMi1iaXQgZWxlbWVudCBzaXplIChwYWlycyBvZg0K
PiBGUDE2KSBhbmQgdGhhdCB0aGVyZSBhcmUgcmVzdHJpY3Rpb25zIG9uIHRoZSByZWdpc3RlcnMg
dmFsaWQgdG8gdXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+DQoNCkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPg0K

