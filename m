Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B83679AACF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 20:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599722.935263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qflaT-0006sd-Fc; Mon, 11 Sep 2023 18:24:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599722.935263; Mon, 11 Sep 2023 18:24:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qflaT-0006pR-CV; Mon, 11 Sep 2023 18:24:41 +0000
Received: by outflank-mailman (input) for mailman id 599722;
 Mon, 11 Sep 2023 18:24:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwba=E3=citrix.com=prvs=6119d0f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qflaS-0006pJ-25
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 18:24:40 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76fc347f-50d0-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 20:24:38 +0200 (CEST)
Received: from mail-dm6nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2023 14:24:12 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN8PR03MB5089.namprd03.prod.outlook.com (2603:10b6:408:7d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Mon, 11 Sep
 2023 18:24:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 18:24:10 +0000
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
X-Inumbo-ID: 76fc347f-50d0-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694456678;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ba0jAnX04BnhsMflxVKDpQ60VTZObeZi4l5/fmwXIN4=;
  b=PcWcQbcIxs2xXiePth2+gpiRz4F6rYtfCFBuGfXL8kMtvEEtl3PWq1q1
   FkeSSkKR08T+f490fjBapUYLHN4wiwKx3Mzv5h8uibBYUC+poCAk/1C7C
   YOSjYPRjB1W9z5Eq0tddNgoZ2184JSh7gZYTLxXOE+EwU8R9WMzZGmYyV
   4=;
X-CSE-ConnectionGUID: vtP5KIh/TLO7wj4nTWT9Mw==
X-CSE-MsgGUID: 67SuR4/ESM+vrc2P2+rNuQ==
X-IronPort-RemoteIP: 104.47.59.172
X-IronPort-MID: 121561698
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:cDkzxKhrhQ1BEAK1rwiGPPPBX161xxEKZh0ujC45NGQN5FlHY01je
 htvDTyGbquJMDehL9snO4/loENS6JTTmtRjSVdv/3xhFS8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyo0N8klgZmP6sT7QaHzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQGNAhQTTGDwN6S5+2kSLVquvsffez0adZ3VnFIlVk1DN4AaLWaGeDmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEgluGyarI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Tefhq6Az3gzDroAVIENJbkaB/b6UsWv9RchUc
 XROuTAIsJFnoSRHSfG4BXVUukWspQUAUtBdF+k77gClyafO5QudQG8eQVZpatYrqcs3TjwCz
 UKSkpXiAjkHmKaUTHWb3raSszKpOCIRIHMCZCkLVg8M6Z/op4RbphnIS9NiDLK4lMbdCTz22
 yqNriU1m/MUl8Fj/6Cy51XOmT+vjpnPUA8u5w/TU36l7wV2f4qsbcqj7l2zxeZNKsOVQ0eMu
 FAAmtOC96YeAJeVjiuPTe4RWraz6J6tLDLYkXZrHp886y6q/X+zO4xdiAySP29sO8cAPDPsP
 knavFoL4IcJZSTwK6hqf4i2FsImi7D6EsjoXezVadwIZYVtcAiA/2dlYkv4M33RrXXAWJoXY
 f+zGftAx15BYUi75FJan9sg7II=
IronPort-HdrOrdr: A9a23:m4Po/Kq/Ce6chS2GYin90HwaV5tNLNV00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssREb9uxo9pPwJ080hqQFhbX5Wo3SITUO2VHYVr2KiLGP/9SOIVycygcw79
 YZT0E6MqyKMbEYt7eF3ODbKbYdKbC8mcjH5Ns2jU0dND2CA5sQkDuRYTzrd3GeKjM2YqbRWK
 DshPau8FGbCAgqh4mAdzA4dtmGg+eOuIPtYBYACRJiwA6SjQmw4Lq/PwmE0gwYWzZvx65n1W
 TeiQT26oiqrvn+k3bnpiLuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkd6yesCszqOSP7k9vtN
 XXuR8vM+l69nuUVGCophnG3RXmzV8VmjXf4G7dpUGmjd3yRTo8BcYErYVFciHB405lmN1nyq
 pE00+QqpISVHr77W/AzumNcysvulu/oHIkn+JWp3tDUbEGYLsUiYAE5ktaHLoJASq/woE6F+
 tFCt3a+Z9tABunRkGcmlMq7M2nX3w1EBvDak8euvaN2zwTp3x9x1tw/r1qol4wsLYGD7VU7e
 XNNapl0JtUSNUNUK57DOAdBeOqF23kW3v3QSOvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtFQ1Z1nlBaS1rdN2Gyj2MSaAtAnWu4NjD8ATgMy4eFOrC1zNdLkWqbrhnx1FaferH8
 paO/ptcorexCXVaMF0NjbFKupvwEklIbwoU+kAKiKzS+LwW/rXX7/gAYDuDYuoNwoYcUXCJV
 ZGdATPBax7nzKWsznD8VTsZ08=
X-Talos-CUID: 9a23:+/XNpmMiMU29ou5DRjVfqW01GocZVlqC03WMJXOHNTdMV+jA
X-Talos-MUID: =?us-ascii?q?9a23=3Arfatww8xESDJ95Vu0FxUV2uQf5k32LmUVAcgqrB?=
 =?us-ascii?q?FpdOPbxQqeC27kQ3iFw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.02,244,1688443200"; 
   d="scan'208";a="121561698"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRT2+A02ayKE+ChELhr70ge80CK497cr+QiXDxoR/1iAuxXneJCCgClFdyOEnIlaVwYL2N6m0ibdmt+LMGYhI0rkSALsHuumHZErOmahk9Xcj0XYvIqjfHqY3nUHIeT/0bKgZ/bCUZK6QNyRkXGcoTo8Pseio4MMfRbhkBF/hR6HO7NeJDLupZ09VwPl+qND/VOIhyXB6QoDom9EGTOO7NzpRsXw47NFs4DBmMMmVnWaPjfIm44ZfG33hxfdlU5xAQRYaxL18sflaTWml+4aG9vzqeEo2SB362Y49Q+RTC4DiBBlrnE8UTtPKnKhDFJd/PEoW2LamIdJq0TScqP5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EkMyWrDKQ7Ucj4+TT2XkwLPwIWkV9G6AU7PoQlAAdA8=;
 b=DQ/CKldEEFFFeEmdnRe002fuJqIQa04OB2phAKNMNuwen0ohv7m0b4fgdUx0cwdyglOgrgM2L16sGzXtd3RpTQ2/KapktsHWl5YWqeegFaNjYrbDi4hC878rUxy1WnFA0tc9gwMw2fd3l9RHpQNPXS8WF40hA04cHJKe1wNZ0axGXJ6nj0qEnNgnKm85ZAPOr4Yrj/k25fCe4rxW1eAHrTmUjbuX6Z9RTVxnkcTAXNLr2Ei3SlA2z9po2y3G6rtoGd4Ciy+hITtBmL9FaUiyIz48tbWl3mQfyGwC3HIqysZhP5gRjvgbIKJmnGxXQxLWxE7b3CgWh19XlPyt1QIOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EkMyWrDKQ7Ucj4+TT2XkwLPwIWkV9G6AU7PoQlAAdA8=;
 b=hrKLkDUuxBliahWW9aSqzv5SYOpSI/+ARFjOuqfEiwQlatMB2D5YdeJjGH2+J1IieKFiyDFCoJDy7vI6o9QoCNx86MT7rF43wuJwJnfT2jnJvais11agZJm5K0rELn0RxFf2k/hOkESVj13dBIGj5R+hnaNYTh0bAhk+6rCkXOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <27ae69b6-bc57-dee3-2528-8311a38decda@citrix.com>
Date: Mon, 11 Sep 2023 19:24:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>,
 "committers@xenproject.org" <committers@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <fa86cd2b-9670-ace7-3bcb-799f55ca283d@suse.com>
 <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <alpine.DEB.2.22.394.2309061346410.6458@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0461.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN8PR03MB5089:EE_
X-MS-Office365-Filtering-Correlation-Id: ddce24b2-a0df-4aca-116e-08dbb2f44b11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NvQRTIXyT0YNg6UiufHuFE+TT28tjWnF0ATvCkNeWUV6uCpOejfBVDnK+xt1Ph12kC3nvhTXTMWsu3hlfuR8GuVwAhdC8rWWw8uklKw3txSux5TYxMHJ+iL0YHeJMTMhgPfXzxoYalIortlue1OFS7lcNDSvlYTCv2RuWk8HR/iyz82NbijxabtjYgclXLo2/rhSoeAFc9XC/dcvWPwTKPSJMQIMUeoUenfKRnQIFqD9IcT1ubas0eTHeAKcn7/LfN8bkTsPQz5BwbCCYhHcqxQ6aAUMQ7SUwsgQdsCF2Uhx5xdiFnB+8kQkm9wMCbZ006s6n5mJxC0wOD0FE9vplgjh9GQS331X0PEfYXFR4Jbs/It6P8xwFeVMlW1Uwe72yrx4cnYPPe2xJmv91VekNRkv35cLUWeYltVHcf6VaCmUZMlPSs3kjvRwm4wF8lfEQslmhOrG/kCvd6mZYsITaaDEuY050HZzVFOJejSlvwkZr3nIURdywvwD0AZv2/ZiTe4z+HUDqTKIPaPwXuSZxGBM4cp5f2XeHowYHSJDq9aa8nRB1/h2kMAiHfi5GC69CkrKIq3rimUNmG32ZfV0xQ+hKpDdZ34SyijmyxgAQ/7ZO16Sge5J6AG3Qb9zdBC7A6PuHJOACGKQHwM33lbX/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(186009)(451199024)(1800799009)(41300700001)(2906002)(316002)(26005)(31686004)(66556008)(110136005)(478600001)(8936002)(66946007)(66476007)(8676002)(4326008)(54906003)(966005)(5660300002)(6666004)(53546011)(6486002)(6506007)(6512007)(36756003)(2616005)(83380400001)(82960400001)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkdoZmMzcW5scG5QVDhrV1UydHV6UTZmNEJLdkF5dk1LN3d1bi8yZTRLQ015?=
 =?utf-8?B?aTBWZnl6RkI4Y1YxQUY2NmUvc2dCZk4zTjRqN2srN3h6T3lya05jM1NMeE5O?=
 =?utf-8?B?NGV3Qk5oUStFdFZEWGIvRzRMMUg0Z2VGRFVpR2JrZWNTMXc5ZmZ5OW1PSHNY?=
 =?utf-8?B?S2d5RUJZdllGYVFKeGo2Z1VDSERSRGc3ck8wU1k1SlVRbU1iRmJ5ZUxmclo1?=
 =?utf-8?B?L2J6MCtjdFBxRWRubTBrLzZROFBXWUpoK1RvYnlxRDBjaVhYRzBoTTEvb0tB?=
 =?utf-8?B?MnZqWHpRd2hCOC9MYnBpMy9LWFZUSkNyaGw1Qk9iM3dMSUx0UVQvOVg1R0ZI?=
 =?utf-8?B?SHBqQ1pjYm1HdGFlY05kMDF0NGdtUUhjR0pNS1gwejVlOTNvdThzdTlJOFBZ?=
 =?utf-8?B?bVF4cGdvKys0eUhHNXZCS2tEcWN1RWFHaXNreHdCZUU4SGtIaWZEUkhGaG8z?=
 =?utf-8?B?YmpINVVOT01GSFJyL1k0Nm92a0trWit1QVRxQ2xRaGdXeDJwT2VxdEJSVHA4?=
 =?utf-8?B?ZUR6U29nYlliN0VUNHpFOHdDVy96ZWZwSHcwenhmSWt4UFVYQ0drckg0ck5H?=
 =?utf-8?B?alVZMlQydFZtZXdBZGNKVE9uUWU1Z2JuQXJ5c3J2cnZxbWtKaTdnL3VGRTgv?=
 =?utf-8?B?WnE2SkhQQXpiWlpWeUhmWndCQ251aS9ZNHVkdGxVUEhEUFBTajhDR1F6QXpN?=
 =?utf-8?B?MW40dkh5NW9nMzRyZjdlT3JLZ05qWHhOdGVpNnFSK2kxYlluSEhJNGJDcEpz?=
 =?utf-8?B?bnVhKzlodm5mcXRwVmJqVHNUU2ZYVTVKZnlnNmw0YnowNzVvQUpIYzU4cnQ5?=
 =?utf-8?B?dTJ1czlxaUNFWmJOcVFEcG9ZUDMva2N3cmc1WjFrZVJUeTAwcFFyUGtNTXZF?=
 =?utf-8?B?TDhIendvMzBYc0hnRTlzRS9jbWdBc21ianFsQ1VoK0VRd3ZkV1BtdnZ3YURs?=
 =?utf-8?B?MnVQWmw1bnhhbjlPbk5mUGNFWXpQcnpoTmdkcjMwS1lEdEZCbERtMGxleDgw?=
 =?utf-8?B?RzdqczdYbGs3TzZQelhPWkJXaUNTNk5iZTYwTHpVQkZ0UTNPVHFVYWIycUZ6?=
 =?utf-8?B?TWNFNTVaVmsxQkE3K2dtOUtGTWZYcUJxTkh5NXowRmc5dGRhd3crbU5IWU8w?=
 =?utf-8?B?bDhHUnREdGhNaWRFLzJkdkJLSWhRRXNPYnR1ZTYrSFNkNUhVZEYycEU1L0d6?=
 =?utf-8?B?NDZSWmwxb3FYWjRhenFMSnZTeWFMSXIyNzNCcUJyZzB6b2ViVzNtNk92UWtr?=
 =?utf-8?B?aENEWlpUTXpobFJqSEdCblNZMDB0OVB2WlhGY1ZGZTQyaGJBTmtuRTh3OWc4?=
 =?utf-8?B?Y0pScnI3SUR6aSsxOUgyVitISVlwSzlISk1WaVdBMFVJeFgyTW83MzFoWXdp?=
 =?utf-8?B?Z0ZNVHVFNUttald2UFJCZUYyRWpzcU1BcDVKU01RTW9acFVCcGNMeVJEL1FF?=
 =?utf-8?B?UzRZQmFxT2NRQTlnS3BMRTFoUWVzbDczY2JiTGNEUGMxeTBHclhTdmhZTlJX?=
 =?utf-8?B?bmdtVjNyemVTQWd3MGZ5VVJlMVFJODVlcVh0QkZ3OW5yVzVLMnQ3VE90Y3M2?=
 =?utf-8?B?RE5jUzRsQzhqNWhlSjB2aHRLeHp6eVFvTU9RTDJSd25HYUtQMzMybEtIdUhT?=
 =?utf-8?B?andHbC83bUswUThrbzhrYnNKdmx2WjNMbkxJN0VHUUdDTWs2Q0pzcHlNdGF1?=
 =?utf-8?B?TjlEaW5kOHQ2ckZhVXdCVVJPSFppSldEbWNibzJVK0MvcW9KSG92TTFKcDBV?=
 =?utf-8?B?bDd2T0JQdStEMEJMUmEzSmJhcGhVTUJ2cWV2aFBMU0gzV0treGwyMi9YVFZ2?=
 =?utf-8?B?NEdEdTdaWk9adzU0WUxCRGxydUFPQmlkbndsc2szQ1dTUWxCVzB2U3hLV0FK?=
 =?utf-8?B?QzB6dGlqaUt5SG43ZG8wT2tKOFR2Z3NENmhNUlpva0NUcWo2V2Faa2k3UEtk?=
 =?utf-8?B?VWlUUTk0cHI1U2FQZmJaTWdHQ0g1U0ZiNms3b2xzRFUyNlUrUVc2eWVPVG5n?=
 =?utf-8?B?QW5MZ0RnZ2tvSVJIVG9qVTJIWEt3K3RSTStmMmV1YmxNaG5BSzJIU3FYaThR?=
 =?utf-8?B?TDFEOFM3N2NjZFU1T2cxUmQ1Wk9iRjA5bE5FMTU4eFRXQXlJNXE1U09zMUQz?=
 =?utf-8?B?em93NUt3OUMvZnA3Q3lDN0I0V2tWYnVsL3QwZTVpZmV6ZTF3ZUhGRlpxVzlJ?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?eEJCM29uSG5NdFBiRHFNRlpxUlVYN3pCVW16WG9WOHR3dDF0L2tjYjNMTldO?=
 =?utf-8?B?WVZsWE9FTWU3bUZ5YzV2ZEtBNWkvb3VQNTdhV1FJZ1dRTlVmZDZ5bEFOT1JV?=
 =?utf-8?B?V3dGem1kdUlhTDRZZmcvQ29BbGhKNUlNKzI2UlRLRE03NU9qSXBoNFFIUE8w?=
 =?utf-8?B?RTQ4eVBPalo3a0YxbEpQZWFoZWNxNHJhUFprQXo3NXoxYmdhMGNxS1pwUkFB?=
 =?utf-8?B?TWxTNWwveHZKTFJndGh1MVQ5WldwZ3d6bEl2ZERFMk9kMVVCNmI3QXNVYWxM?=
 =?utf-8?B?eHI3V0hNTUo4MDVMUlFNTFVhTVJkVVpBVS9jNk04Uzl1QTU1WUI5TnE5TENu?=
 =?utf-8?B?cUxrOUxkTkZpS21BQThsZW5EOXgzWVJibCtYQllFc1NRQ2ZFc3Q5MitwS1pp?=
 =?utf-8?B?Q0hHT1R0UXVISHllRGFUMllYZmlFa1EyUDVxNlJOOE9mQ2NWSzA4b1d5WTZ6?=
 =?utf-8?B?VVpsa0NBdlNoQ2xGcmY4c281SG5zOXJKbm1BL3BCVTFHcm1neDJVZXl2dXFt?=
 =?utf-8?B?U2djeEFqM2lySVU4Tm9lWEJ2cUtkSHNjS1pjSlZvQzIxbDJJb2QzbE91Tmc1?=
 =?utf-8?B?WGJ2dDZMeDJ6OXRIUG1HTUc3b1ZMa0o2R3MrNUtvcUc4RHJ1dzBPNGNqdTRM?=
 =?utf-8?B?ZHNhaWh2QlhCQkZnVXZzaExBZzY4b3FjSmtFM253cWNaY3pob1FjUHlIYU9H?=
 =?utf-8?B?MGUvMUcwa2RzSmowck9DaTczNGpiWm5vaW1mcEp0YzBUQkFEUGZ2UUw0eDVs?=
 =?utf-8?B?KzNxVisvQlErNFBZakg1RUFiUmZVRk9qMmJhazB1cDVyU2VPN3lVUTluM0Rk?=
 =?utf-8?B?T0V2Yyt4Yy9LRzV3dkhCTk9qY3lEN2lEYmw2S2ZqS1BRK3ZselN6Yit2amZp?=
 =?utf-8?B?bVZEekU5SjdGaXk2VGVXR2w2ampQY2xIczFBU1I3eDRlNllVZ1czWE00OWtx?=
 =?utf-8?B?RnBoUFV3RHZPMDIvYzNSREZlK0UrSVpSWDZqWDIvZk9SVlBWN3BoTUpvOHlH?=
 =?utf-8?B?dCtsVnpOQllLcmVsbEpOZjZPNmE1TUNUaEN0NDdGaDdSb2VrUTBLT2RBZ25R?=
 =?utf-8?B?WmJ0MWRZdVlXM2dzN045anZpaWQ2VkZWblppQkFodndlYWoxVG1YTndsbSs1?=
 =?utf-8?B?TmdkUHZrQ1ZLRlF6QjdnSlZTNG9VMkJpSmZ0Ukg2R3B5ZDl1bUFvVTczanVx?=
 =?utf-8?B?YVBVRzRPWUZ5R3ZscU1PaHVKK2UwRE5FWmtpQ1Z3bFpmOHBLaUdPZ3Z3WE82?=
 =?utf-8?B?ZnlQdjIxcHk3YWJwM2x3akRrSml4TXcwcW02YWdMY001SE9wZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddce24b2-a0df-4aca-116e-08dbb2f44b11
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 18:24:10.7325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDV91D2V7QDlKG7BjAWOHyF/wxw4+tdDiR8WZ6CLLFOs7Bu29LgvQB55KXnQzYvY9h9OqMOW23yDOc7wMutrPnziHc4FL+UxbBdy43NvSQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5089

On 06/09/2023 9:49 pm, Stefano Stabellini wrote:
> On Fri, 1 Sep 2023, Jan Beulich wrote:
>> On 07.08.2023 11:38, Simon Gaiser wrote:
>>> It seems some firmwares put dummy entries in the ACPI MADT table for non
>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>> 0xff. Linux already has code to handle those cases both in
>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>> same check to Xen.
>>>
>>> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
>>> entries with a valid APIC ID. Linux would still ignore those because
>>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
>>> this check is only active for madt_revision >= 5. But since this version
>>> check seems to be intentionally I leave that alone.
>>>
>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
>>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>> This patch was committed with unaddressed review comments.

Count the number of x86 maintainer tags on the patch, and see that they
were given after discussion, not before.

You're outvoted 2:1 by Xen x86 maintainers alone, and more than 2:1 if
you include the x86 maintainers from other projects who participated in
the discussion.


I'm not willing to let Xen keep on malfunctioning on millions of systems
just because you think an unfinished spec is more correct that practical
reality which invalidates it.

>>  The normal action
>> in such a case would be to revert, expecting a v2 to arrive. One alternative
>> here would be a timely incremental patch submission. Another alternative,
>> considering in particular Thomas's most recent reply, would be to properly
>> downgrade CPU hotplug support in SUPPORT.md (with a corresponding entry in
>> CHANGELOG.md).
> I am in favor of downgrading physical CPU hotplug support in
> SUPPORT.md.

SUPPORT.md does look bogus and wants correcting, but it is laughable to
claim that this ever worked, let alone that it's supported.

Intel got half way through specifying ACPI CPU Hotplug, and abandoned it
as a technology because they couldn't get it to work.  Hence the feature
has never been tested.

Furthermore, cursory testing that Thomas did for the Linux topology work
demonstrates that it is broken anyway for reasons unrelated to ACPI parsing.

Even furthermore, it's an area of the Xen / dom0 boundary which is
fundamentally broken for non-PV cases, and undocumented for the PV case,
hence why it's broken in Linux.


Physical CPU Hotplug does not pass the bar for being anything more than
experimental.  It's absolutely not tech-preview level because the only
demo it has had in an environment (admittedly virtual) which does
implement the spec in a usable way demonstrates that it doesn't function.

The fact no-one has noticed until now shows that the feature isn't used,
which comes back around full circle to the fact that Intel never made it
work and never shipped it.

~Andrew

