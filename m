Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE1C7D6660
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 11:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622738.969837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZvl-0007Io-K8; Wed, 25 Oct 2023 09:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622738.969837; Wed, 25 Oct 2023 09:12:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvZvl-0007GF-H3; Wed, 25 Oct 2023 09:12:01 +0000
Received: by outflank-mailman (input) for mailman id 622738;
 Wed, 25 Oct 2023 09:11:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ/a=GH=citrix.com=prvs=655ba0516=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvZvj-0007G7-MX
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 09:11:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ab7c1a6-7316-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 11:11:57 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2023 05:11:46 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6731.namprd03.prod.outlook.com (2603:10b6:a03:406::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Wed, 25 Oct
 2023 09:11:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 09:11:42 +0000
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
X-Inumbo-ID: 8ab7c1a6-7316-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698225117;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=TtO6HGN7JdXUcEtN50jbHRoMt0VX0vHRV4bLB+Lx3Ho=;
  b=KExyPrfFiHF4OXwySiZRh+pnMSa/mscwkeaQwalW9txwh44Ei5tCwcGa
   9FW9LNKf7C3CMYWaSjyQ9+/GUtWPJ3nUOsqT3pbYDDZn5OpnBwY+WWbxH
   V9fZxym3IhTLLbSUAkMDVYw0FQK8rCfMFEJuyriuGX8eetblesQK8Jkmu
   w=;
X-CSE-ConnectionGUID: S89lukk5TdKlQIsnE9xmbQ==
X-CSE-MsgGUID: s12R2LrgQFGJg5G2C/G7uw==
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 125820453
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:CKUbeqlW9uqhIb8ccj4NCmjo5gynJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWmzUMvyDMTP2e4hzaI6/oEIEvJTTx4NgSgRr+HtmQSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5gKGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cdIeTQQbRPeu+6VxIuaUe9B19QmJvC+aevzulk4pd3YJdAPZMmaBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVw3iea9WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHmmCNhKSODjnhJsqEbKnFZJLAcZbHWUg/bkpRSVHP0AN
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4P5YnlqYRq1xbXFI89QOiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:vKxMrK4sdVIszHFmxAPXwUCCI+orL9Y04lQ7vn2ZFiYlFfBwxv
 re+MjziyWE7Qr5AEtQ6+xo/ZPwCE819fZOkPMs1MSZLXzbUQqTXcFfBO7ZshHd8kLFh5BgPM
 tbAtBD4ZjLfCtHZKXBkUqF+rQbsai6GcmT7I+0oxgCPGIaDdAY0+pgMGam+w9NNXl77PECZe
 ehD7981kWdkAMsH7iG7xc+LpP+TwGiruOFXTc2QzMq9QWFkDWyyJO/KgOf1BsFST9DqI1Su1
 QtpzaJo5lL/svLkSM1GAfontVrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHkCEprPqp4FMKls
 CJhxs7Jcx8517YY2nw+HLWqlTd+Qdrz0Wn5U6TgHPlr8C8bDUmC/BZjYYcXgrF51EmtNRc1r
 sO+26CrZJYAT7JgSy4zdnVUBNBkFayvBMZ4LQupk0adbFbRK5arIQZ8k8QOJAcHBji4IRiK+
 VqBNG03ocbTbvPBUq5gkBfhPiXGlgjFBaPRUYP/uaP1SJNoXx/x0wEgOQCg3Yp7vsGOst5zt
 WBFp4tuKBFT8cQY644LvwGW9GLBmvERg+JGH6OIG7gCLoMNxv22s3KCY0OlbSXkaEzvcoPcd
 X6IQ1lXFcJCh3T4Bi1rc12GhOkehTxYd2i8LAdlsxEUnuVfsuuDcTJciFbryKamYRVPiUAM8
 zDfq6+M8WTalcGUbw5qDEWe6MicEX2A/dl4urSrTq104z2wnqDjJ2VTB+UHsuwLd5IMlmPVU
 crbXzPAIFp402qXTvRnAXRMkmdUHDXzNZMNOzz8uUSz8w1LYtArgIJo1K16qiwWBB/m51zQW
 87Db/jkry2vi2N/WjO53h0IRY1NDd/3JzQF05v4SsjE2axSpool/WhVU0X4VuiCnZEJf/+IU
 pjgxBS0YKTa6Ct5Q1KMb+a2qfztQo6mJpPJ61ss5FqIq/eC8UF5ppKYt0GKeziLW08pTpX
X-Talos-CUID: =?us-ascii?q?9a23=3AYgpbKGhlcydR1WPOHrbHwSRQmDJuSS2MyGrTIBK?=
 =?us-ascii?q?EBUVtcZyOT3LB6KZuqp87?=
X-Talos-MUID: 9a23:bslrqwvRAQ8/Kbl3+c2nn2g4Dp1M+auXJm8vnsgp4eLDGnNtJGLI
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="125820453"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=acc3tksCMCiFt+uLBayGCdSTHWSG1rJllpQcp6flghuYMAOkUjTVrd4CYDixUSsj/GflmQ6EjwB09wLfz1A2sio2kKqTN7chGMFdiTYoGdyy9mRAkMHDlbFGZNNZjzKQGWwZH+ceTwacUn5vuH/BnkNpzKrbBuOqEedZysc7eTitakt1kgkmJ1wqXl0N2R0EhPNq2ElNL4pfr3yW8bmB8vMLA2s/1pLDtDqlspD5ARuRKDRwvGIY+zj6ZmQoj0FUz7AQ+Tp0cOgcOc0m4dM3M9zP2vqAKek9A40viTKbiGhUP/UJGjrNoM+XACRcrM+kKdTgMpaN+imSKpRyuQA4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNCFQPV10RxB9LnKmmM1SlcJ3j9u9u2eVdfyiig0OkQ=;
 b=SPo41nnUl/v/MlAe/BhWzlhCIxwhqXYC2qK1SiygmDq0YWW2uCRFH3PoNDxyi20qx5nbGMmTorUZ96VRpdDsZiaNSoc2vXou7aLVjDl1WcJ2kZeh7VAznEDA7+LisJ1kk7n4CWlr1F3xg2dn750Zay3+v8sioSOr+bi7CfvZzOV5//+59YiHQJSBVH3tW5h6+y2Rj0hBWVN/hvO7s5Pe+4HQPGin8b+KVaQ49KHD6MN9fmxlrtFYu3kLOJGoXjKdhSchSyQsQVyy0YsInPCi+b0i7ePZPxN2FJgOjoxIW7W5aK91x9NoaucF4kCt+VlU3rr8PLBaffvc2mt1Sy0psA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNCFQPV10RxB9LnKmmM1SlcJ3j9u9u2eVdfyiig0OkQ=;
 b=EsWdKFCHffVsc2Q9K+L4dVY7Vyq/W/kng6bnRxDHVZEfcWYCWg7C/6HEER6BMOfN6evTtODDEQAwqxjOGC/d9hpTi7svoNcGLU1Keloyj/bHUf5vDeB4+UH08u8gfOHNMz7Uo+zbxQWQohimnmlvNorFWuJdWBUR3r0/S0N99Js=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 25 Oct 2023 11:11:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/vPIT: check/bound values loaded from state save
 record
Message-ID: <ZTjbygYgCYTNtc-W@macbook>
References: <f83213df-2433-ec51-814c-436ce5ea4967@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f83213df-2433-ec51-814c-436ce5ea4967@suse.com>
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9acf0f-41a7-4876-cba6-08dbd53a6785
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OYTGvysRg9apnKljTQOoEGpngZc7Jf7fagCFYPoSLMktWNpZCBjbQbcneUFHvpBbMybFLC7OndZK4Q8oxYz3nuELHMmUzP4VIaXhRHooHQL7KnnmO9mITHBUNR63gz9aqjpeWKV68QdabyPW8gxuEBRDLFumF+7QV6W0noKsTUAcqEYXAvvwqtQmKqJCUfVRnvT0CCuUKTcQUY1pRCgMFyAMDz05eS1u9y8X8dl9p0IqGQSCwxXS9TW22lNA33l+2A9kuL1k0C6uiLJYXhzuMUArux+e63h/Q7oHRuPQ5qVPoYqKX7UX81ob2lt3Dfp6APXevyJ0Hse4bg1aeU6JkHCvdRnFu1Hes8ab9ym/nx5cwLYUSUzGJ3VddWp41rfM5M5T/VPNQ2xIehOa28K44XFmCL/vqNtfPb/3N8sGPyfxRLDy2mw9IGPpu+K7ojbpw0hVMmYE6xvCD1+nJ46rSPc2VrBE4fv1+bDMtEE+BVafJjcKISsMj/8ctWa8ePX0N09MEYx0Po8EleCh2En62fRIrgiaKKiUhEEnNjEAvN9/EBcOrRkgIwbi41bpGXQt
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(396003)(39860400002)(346002)(366004)(136003)(376002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(6916009)(2906002)(478600001)(5660300002)(85182001)(8936002)(8676002)(4326008)(41300700001)(66476007)(66556008)(66946007)(33716001)(6666004)(6486002)(86362001)(6512007)(9686003)(6506007)(26005)(82960400001)(316002)(38100700002)(83380400001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnZjaGVyT2kzbE1kaDBnSlFZRCthNDZvNXpyRGFtWVVpbDlYTmRFWlJQTjdm?=
 =?utf-8?B?bDZTYWFqdi9QSzltMzR2ZHliVHRUQ1J2Uk8zdEwrWnY1blpBM1pvK0hVWGdK?=
 =?utf-8?B?OHpEMy9BZEhZZm8wMXFVYXBoU1drZGVVSjc1N015V0lpSVdEOGdsS2ZScnhz?=
 =?utf-8?B?WnVoZHVNRnBPY05kQW9jZ0hkbXpJQlJFdHBJd1lKWC9YbHFBbTYwdTFYdEtx?=
 =?utf-8?B?ZHViTjMvR2JETzFHU0ZaUU9ReWFCN1kzaDhpalBuRWFKL3RIY0h5TjlMSVFn?=
 =?utf-8?B?L1FVYUIxMndxMFVBTmtnM2J6NUhNNjhxdVRmUTI5ZlNzQnRjSEh5ZERnSEZk?=
 =?utf-8?B?RHBIYzlheDdHcnhIbjI5UUFyRjJMbldPSjJCWlcxWXc3VWxBVDZZendGKzV2?=
 =?utf-8?B?N1NxQUNDYU9hN29Hb2R0VFRNZlNUSmF4YVpPb2V6SW5HRGxwL0tIMDRkZFpE?=
 =?utf-8?B?SWUzWjJCT1BWUzFtaEN1YUhXUmZ6OUhnWWl6RG5ON1ZSYWRQREhQeTFLT1p0?=
 =?utf-8?B?R29RY1VGdlpSdndDQXBIVHJyTzBuWmpPS2dJOFFlTm04Vnk1WE5PNjltU3B1?=
 =?utf-8?B?OGxsQTZ4cFZCeGZGeG5CYmZPb2xJUWlnSk05S2ZjNE1RREhmalQ0K3RDa0Zm?=
 =?utf-8?B?RTg2M0VWUWRFMFlUZ1NOeDRybERNbk1vV0NpeVc4ejV0aCtvV3RrUGtURFVx?=
 =?utf-8?B?TC9mVit2T1YreDFQYW5Hczh6TnBBY2JWdW5VdTl0Yk9UU1dTUDg1S1pHZHlB?=
 =?utf-8?B?TEpocHBLZXVOemRjd2pIcGN0ODM0TWo3MzlPbDA3YVdCcHA1emdxNnRXUW1C?=
 =?utf-8?B?KysrM09vNDdIcXpzWXBHTXR3aW1GM0NNTUxkTjh3N1VuY3hRWUlLS3BEWnox?=
 =?utf-8?B?VHZXdENGbHE3RzRUNklRWG1YMG9Eckd1YStSS3U0MGZhU3lLUkRLUnhrWGdj?=
 =?utf-8?B?ekgvVnpJb3JLOHJYU0JyS2xtSUg2WUpLUXozWDhTRmdIbmNkTVJGOFZWUXdp?=
 =?utf-8?B?djhzczhVNjFnNDdYU2RQeGFmMlpCR3BhNG55NUpqMHloais1eTVpSW1rbnpW?=
 =?utf-8?B?Y1VSSFRHSFk3VklZZDJ1d2ExTjNGMVdJekRlVVVBeDJHVjYzNWk1QVVhREM2?=
 =?utf-8?B?NktyNGdYQ2ttLzQ3WUsyaENmczdnUTliZFFsdEo2NmJMYnZjQmRkUElZV2FD?=
 =?utf-8?B?V0JPSWJHQTJzdDM4N3hTUEszMjhHbHQ3OGVlZy9iUUZxUEowNjVzQzJCbEox?=
 =?utf-8?B?VDlCVWMyYmtGTzF6YUIzb2RqVzdKSWJoQ1k1ZThNVmVwK0Z2ZjB1cHZjODE1?=
 =?utf-8?B?Sm1FWnpCV1hkZGxDM0hLRnZiVE8wQjVkeG5ObllhTHBQSStwanZHbmFuQmZP?=
 =?utf-8?B?QWhiYS82WEdUT1J5S1BONkc2MU5rN2N6ZmVxY1REUFJhMEt6WDUwcndVNkZU?=
 =?utf-8?B?VFdFaHR5VlhwTCtjZ0daK2tLYXlPZXZ0RGlOY3ZMNjUzdnVuVHVIdHJhd1dQ?=
 =?utf-8?B?aHVGSlZiT2c3OE5STkp4L01zV2Rrb2d5eG90blppUGhPakRaOUJtM0k1Mko0?=
 =?utf-8?B?cWk5Vk1JNWxUMlo0S1paSktmV0ttS2tCYzMwVnFhLzBTeDB6djFTSmt0bGRD?=
 =?utf-8?B?NEo1bGhwbk56TnFpeVJlOUJIeXQ2WGxKZkdRSkk4ZmlLNU1uRHpBV3FKVHJk?=
 =?utf-8?B?QXBwYWk1dTBTamIyWEdZL0N3ejhkK1drMktCWnluT2s3dExqTllwckwyRFF6?=
 =?utf-8?B?OTR0N0VQWWZUdUNKeUhkTi9aQ3dmWGY2WDNBdStVclNROHdJQ0VqMTNwZTVD?=
 =?utf-8?B?S1RFTFE0eGVIenBLTEI2Sm5hYkJ4M1NaN1VXQ0Nvb1djKy9hNjZPb3MxdHcx?=
 =?utf-8?B?cmVYOWcrR25lVG5CYlQ5cVorQXNHVXFVTDlqMEVxbEJIQXFIR0F0WFF3eTFh?=
 =?utf-8?B?VHlGSnllYTdVWGlLbC9MUGJjTG9xejNhZ1pZaTl5NWFiY29uMWdud1pWSnNx?=
 =?utf-8?B?S1dtRVQzTDZ5MEE5NUs0Tnc2eTk4Ykw4R0xJTW1VU0YzVDllaHJQdWptbUdY?=
 =?utf-8?B?NTFXTTYvZ1ZvY0tyMUxUdlVkUmFtTXlRV3NtSGFnbzN4WGpJalpuSmh0MlZ6?=
 =?utf-8?B?Wm5lamZFTVIzSnpnTktSYnpnZCtxaU4vZ3loWndyd3JGdmc2SDY4U1d2a2I4?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tqsbfpo7HNRiJuFTzsqRU70bHFIjflWLAw/Jxx7n7L4ztyX2SPHxpo1cjbXyUZSp2hSbKmbECM/Qu/YQqrnEK35OwlOLD857Ayssw37mAOC2WdYGc06FTBnBmtxU16yXhA6fh3aXEFFUKLrOwHR4SdwO5PfLKTI1FqJiQn5AgPHckhNQ8a2VvKxkVEW7EoawBblFH1AkxiO6G/omdfS1o9jb4Uxxyr5hfBVXw9iJmxrivXKiGDytEGNLuiilZx9zMWnkriYxtyUQXjB3Q49wAlYRB4wIslCbHvOt9zYoJcWb8p+Cwruj2MxA0O0x0MI/Ez9dMgdALlrF9ajD7Lfs9adMhkBh11patbIdiqXyuvBQMb4rwt8Dhn+24h0i7TG97aFQB7ZXMY0G5toJWQ7d32rq9bGq/sP0ZFuZg7Vpl1ai79Uo/6/T8hujk8d2WyHNMsepIeVWaaKOFobmbvH0CoHsaXT6vSwWaGG1Jgs4j/2Mgh+U+sMtOyvlKEiKZ60uh3/zlu+VEr05FJdRNdGISZp3KO+LiLPCstH3qgBqyFRcOoiZdrAD7mSVzHluo/01gicEBRF434EfhWxUinC2S78fjwxQ70Wgu4lfF1Ktm4I+s7/D4V5Uhk80l1hhNpxsbhDeyWCL0C9amwGmjZb1jbjjnKE9sfODoxx6JaebCAUI/r356CVQiGoREAY57zKlafFFF3Cfm4ncRn3QVdiZaf5oJ1ta0ukBEZpSmJEDQS5s0sZhBcYYLNDA9EIHVOzMfx0IrCucAcum+SO6YbFq2R0j1DxJv0ijYmWHpj2AmHA5/I5PLM8DO0M6TT0/Q70D7RlALIinSyKIjO/4AnjuJA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9acf0f-41a7-4876-cba6-08dbd53a6785
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 09:11:42.7568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUek+tJD3XRTQtZByI/B+3F9OmyprMWAQak1rOyAsrzOUqk9we356Le9d7XjuXeKXaefM0bcEktx6uw/2iRbfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6731

On Thu, May 11, 2023 at 01:50:05PM +0200, Jan Beulich wrote:
> In particular pit_latch_status() and speaker_ioport_read() perform
> calculations which assume in-bounds values. Several of the state save
> record fields can hold wider ranges, though.
> 
> Note that ->gate should only be possible to be zero for channel 2;
> enforce that as well.
> 
> Adjust pit_reset()'s writing of ->mode as well, to not unduly affect
> the value pit_latch_status() may calculate. The chosen mode of 7 is
> still one which cannot be established by writing the control word.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Of course an alternative would be to simply reject state save records
> with out of bounds values.

I've been taking a look at how we load other records, and
lapic_load_hidden() for example will return error when invalid values
are found.

IMO that seems safer, I think there's a risk in the adjustments
done below to also lead to not safe combinations of fields.

So we either reject the state and return an error, or we silently
reject and leave the PIT in the reset state.

Unless there's a reason we need to handle such bogus state.

> --- a/xen/arch/x86/emul-i8254.c
> +++ b/xen/arch/x86/emul-i8254.c
> @@ -47,6 +47,7 @@
>  #define RW_STATE_MSB 2
>  #define RW_STATE_WORD0 3
>  #define RW_STATE_WORD1 4
> +#define RW_STATE_NUM 5
>  
>  static int cf_check handle_pit_io(
>      int dir, unsigned int port, unsigned int bytes, uint32_t *val);
> @@ -426,6 +427,33 @@ static int cf_check pit_load(struct doma
>      }
>      
>      /*
> +     * Convert loaded values to be within valid range, for them to represent
> +     * actually reachable state.  Uses of some of the values elsewhere assume
> +     * this is the case.
> +     */
> +    for ( i = 0; i < ARRAY_SIZE(pit->hw.channels); ++i )
> +    {
> +        struct hvm_hw_pit_channel *ch = &pit->hw.channels[i];
> +
> +        /* pit_load_count() will convert 0 suitably back to 0x10000. */
> +        ch->count &= 0xffff;

Might be helpful to have this in a define, as it's also used by
pit_get_count().

Thanks, Roger.

