Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F27179E1E2
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 10:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601062.936966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgL6z-00067j-CV; Wed, 13 Sep 2023 08:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601062.936966; Wed, 13 Sep 2023 08:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgL6z-00065c-9T; Wed, 13 Sep 2023 08:20:37 +0000
Received: by outflank-mailman (input) for mailman id 601062;
 Wed, 13 Sep 2023 08:20:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rq8V=E5=citrix.com=prvs=6130a4f39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgL6x-00065Q-MQ
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 08:20:35 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67add714-520e-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 10:20:33 +0200 (CEST)
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2023 04:20:31 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH7PR03MB7106.namprd03.prod.outlook.com (2603:10b6:510:2b4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Wed, 13 Sep
 2023 08:20:29 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 08:20:29 +0000
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
X-Inumbo-ID: 67add714-520e-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694593233;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LPDmIiqH8yAZfkg/eB4m0M6j0xlp2M1/aKe7W2E5I/w=;
  b=YTk2FYzpfJmRIwEj0W+/uriYx/stk23d1mEWPxmgIeCYMK2pi0TxLI1G
   2iu3aSFsrdkk6yVSsffyBgeckWwQ2WUD5gAY3UfF4ZvHqNzF14DaG9XVR
   B0Fvb2EMDp/fuvBPrsgu0tUQain7CB0jJ7N4SfVG7MtBj0Adzt93HNtKk
   k=;
X-CSE-ConnectionGUID: 4sJ9wMZBRz2TKrf5eRoZWg==
X-CSE-MsgGUID: dcEjXJC4TE6CUB40bsiVKg==
X-IronPort-RemoteIP: 104.47.55.107
X-IronPort-MID: 122345395
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:S/3E4Kv1bduVNI1Jok553tTYz+fnVHBfMUV32f8akzHdYApBsoF/q
 tZmKW7Xaf7famD8e4pzb4++8EJVu5fXn4JqGgBr+ylgEyxH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVaicfHg3HFc4IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4lv0gnRkPaoQ5A6HzCFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwdCsvPw+mtciM0uiHafNi28kZK/vUM9ZK0p1g5Wmx4fcOZ7nmGv2PwOACmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osjf60aIW9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAuiAthJSODjp6MCbFu7ymc+Ci00fgeHjKeSt2TiA9hEK
 nI39X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRVLufgcBRAoBptz8+oc6i0uXSs45SfbqyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CChRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:n4aGnKPBiyUacsBcTgWjsMiBIKoaSvp037BK7S1MoH1uA6mlfq
 WV9sjzuiWatN98Yh8dcLO7Scu9qBHnlaKdiLN5VduftWHd01dAR7sSjrcKrQeAJ8X/nNQtr5
 uJccJFeaDN5Y4Rt7eH3OG6eexQv+Vu6MqT9IPjJ+8Gd3ATV0lnhT0JbTqzIwlNayRtI4E2L5
 aY7tovnUvaRZxGBv7LYEXsRoL41qT2qK4=
X-Talos-CUID: 9a23:3C2cZmx+bwCaWrRymx7cBgVIAeJ0bVjv5k3CeXObE2g0RYeSe2CfrfY=
X-Talos-MUID: 9a23:yQVN/wb9x3NtPeBTuzTBhgFAH5tUzvqFNWpRyZ8duvenOnkl
X-IronPort-AV: E=Sophos;i="6.02,142,1688443200"; 
   d="scan'208";a="122345395"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJOaGqWbNdLLtio/P4zW5CfkxbCLU3PBB5jej7USnQWbdIQjl5n6RkupE+UgjkVX9HcQHsZ0A3n2tX9Hxw+H3IquvXJfA9klj0Scfybc+/0ISPwG8J1xclDLLmIAXGSAbXfbk/PaBmd5zzWbZ4IiTdHYmb7d9usrN4QhPKdX3D5XFnLu2lvSwdrQVYdeT6qLADzBbm2le5qUUSTRs1WSZpjRdjhNVtcqHm30Z47U5kK3Eevj+Ii7i6iKuhCz2CnHuwU55uDKtmOZHSptXpkywQ3t+s56N2hKFL/bLuC2thRfR9EwiSQBP5lOD0iRovWip5x3wyOSDCneO3C9jWhcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbTlCQGtfirLcereGu77XLUfeIP1sO4pDHnx8mrxqoM=;
 b=QtgwtOJCg4ij8FmTS+O6rVvFJkbkHYHca6fdkki0SUmDu5wCizqdGUDmN8Pxvj2yhOGe9fR3iBLk2d8OCMcJf+GmgDvOH2aBWLq/m2c8GFgzW68NMGqISecGKdOmGtTwMyHuoPIznUBY1NnYZDmv/OL0sINpRDHJ+AOV6ql3wMsS7Z3eKZmdisssiiTv/YwuxjyZUEiAVFBqYHm67z8JXbws2ayzZEs/5i7B/0orDpLUHQIsbCxXkSI05Opv/0rbA4lzjZJWGAGMwOxWc75FWD5clIakaKDMGphsH84QZVqgcE3wX2RdJvq92dJajxJo41j4MrUL38VL3lL3rnX/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbTlCQGtfirLcereGu77XLUfeIP1sO4pDHnx8mrxqoM=;
 b=Kdu7A+CETT+f79usWq0roorOyHTnKrhWXgOkvz9Z9+ymvzvsutgSAfcZ3mdVTfqI97zAjXOw7zgNGgyRa5V2VYJkcflCdx88VV8O5a9po27MuCWq3BtV0CndXuW3qdlopVlvagnbNsEgdGK1TuBVYx/9ahEOdDNA9Gu5CRcj/JA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 Sep 2023 10:20:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Message-ID: <ZQFwyG3FwCzpezTR@MacBook-MacBook-Pro-de-Roger.local>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <809ef122-7060-c033-e50d-6e372ab89de9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <809ef122-7060-c033-e50d-6e372ab89de9@suse.com>
X-ClientProxiedBy: LO4P302CA0020.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::9) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH7PR03MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: e491b1f3-cc84-4248-85d9-08dbb4324a53
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	thHI0n6qzOrbpiTjkTtA9OPf0/eUafLpKqX775S2GPD3SvD8tDsr9bVMRHMt3CvZ2EqdWDX7gWv1ju2woxiIeQI8uG7D6f5K7YtFxma6/QuNq4WrKHNQfWlwHN2FFIQqvsHO4MG+YyrUQ77deLfU+7JxWPDNSBPs5WGM/+lYCIjgp/SN9l5oc37qA4ehITTUp2fdy+raeKZ488RcDtu7SPEGD0l6uAyyXQbaS5aIfi7uwQzjDs6LZtA/4cjppLua5gPFO/amG8GEiSJ8GEPasbJm0JygEYbDeOjtuWOt7MOTv5ulIldbupaobRWgsQ/aBWNiIUrrCiEPWmfyawyMQGSoVQkRzvDX/lrf5LdWNbdubSd6VKGiBT4v7wB5EiR++HyRSLTUFEpeOQIlTNIKOviPLr/QgRINr1vtU6rZ/pbSsZnWYE5moZwpbuM3UlxtJPBJLFLMXiHWuBTN8b0hi1utbOJH+yXSBrpjsulU4n4uEeOEPQ0dqNBhYrRe5j8WTgVQLEnm5Qd0/hM16jHu5Hf7ARP+VF+vGAGk97oMYAfDvm8oR5SpzbpivcZzEgLD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(39860400002)(366004)(136003)(1800799009)(451199024)(186009)(5660300002)(8676002)(8936002)(4326008)(26005)(6486002)(82960400001)(6506007)(53546011)(6666004)(9686003)(6512007)(83380400001)(6916009)(478600001)(316002)(41300700001)(66476007)(54906003)(66946007)(66556008)(85182001)(86362001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dEYxaTI0VnJvelI0M3pKQjd3RFRDNzhYUlgxOTZOQ2hBMGhpNHJzaGV3UFNz?=
 =?utf-8?B?RVZJNDRhK0F3dlZQV1QzWlJhTzF0QXltRkh6L2gzZDRYc2toSytEblhDdmln?=
 =?utf-8?B?c2VRaVZYV3ltNzc1eWlQTkpYdFkxYTFrcXlRVmpQRGs2SWpFK2JDYlltR1E4?=
 =?utf-8?B?NEp1UUdvRXlGK1ZtcGI3TjRrNTJ5cEUrU2tkV0VNUXcvbWIzUGI3V0NaMmxP?=
 =?utf-8?B?dFlWczZ3WXVoMDhLY2VxOWo1dGc4Ui81bUhReVl3aVlEMXdQUUlmUEhrT0N5?=
 =?utf-8?B?Sy9VNU5Zd2p4V01pdkd1Qkc2U2lCZ0lvVTBLR3ZEL3lYaDRnbHhCMk9xNFhh?=
 =?utf-8?B?M2RqT25ER3ZSQ1lNMWlOaWZhcE8rZ2o3NWpXUjVUOXhMTEtvQXhseC9SSVdQ?=
 =?utf-8?B?SjM4M2pLMzBhSVpmeDBJM3RFakorRWtRcDRicW9XZ3NWdjQyK1R1YTNuTGdp?=
 =?utf-8?B?SENxRnlKbFFYU0lxUURWTXlNWVVPc0xrU1B4enQxczdna3EzTnFGSjE4bCtI?=
 =?utf-8?B?V1dlNkpEemgzLzFINXVRUzVhYXRpcDFxcjV6SFpBZytlUXlMSXVXWHdLSG1I?=
 =?utf-8?B?Njd2S1lRMWI2am9uN3dlL2luZFg5L0t0OHZkd1J3K3ZhY1NVakpIN1pESUY1?=
 =?utf-8?B?T21weDRjVHpCQW02d2NMK1ZQUlNnOUxhYlNtc1RsTTJscW11Q0llTmxiTVk3?=
 =?utf-8?B?SGpKUkJBcE5CZDdLTXRGUy9Ybkdrb0orYm1QMlgyL1VobHA0NVUxblNLanpK?=
 =?utf-8?B?ZEtnM1E4V2FEYjlzRWE2YXVoSjdvSS9lMDVuQm9DM1BXU3Y3MFJDd2E3Ynpl?=
 =?utf-8?B?V1YxU29sVS9acGNwdlR0Y1ZuN1BUSUFHVXl2cnhGaWZ0TkY1c0NYa2cyMW9h?=
 =?utf-8?B?cTE4bFpHdWRobXRjSUlhRzZ6V1dVSmxyMDBiREl2cjViMXc0M0NmcFF1STJT?=
 =?utf-8?B?bkpsOW01NmF0ZHBlMXR0K0Q3NC9jeTJGeFJubWVJOHgwUno0RFdVWXdyQ3Qz?=
 =?utf-8?B?d2EyRXZDNXpwZ2RabTZHUjVrMHhHQm5IdnhvNkgvZGRjR3R0c1R3V1U4azJz?=
 =?utf-8?B?R2ZQanNiRTNxQzBOVVVqTHhsVGtKdEVHL2FaL3R4bldlaUFXTG5TU0FEM2Nw?=
 =?utf-8?B?cDBtTVQxRDVrV0d0YUVOZ1lnY3VqK1BlQktTdmpDek4zdEpHdnpsQmxKRGxy?=
 =?utf-8?B?b2d1d1RNOTdEaWp4U3VSc3B4S1o1K2NmUHhkOFU4cmI3OGlsK3d4bDEwaXlS?=
 =?utf-8?B?dW9acS9qZ2xwcmpNNG8yeXFMeDcvZkdKTlJmaU96QWFycW1jVW80VWZqbkRR?=
 =?utf-8?B?V1Fnb3dmN3psQ1ptZ2I5Mjg0TGdmQjBCditrUWRCNTBHRWU3cmVMOU1aUzl2?=
 =?utf-8?B?empscTU0cThPcDBFYkNJVFMrWW5GQzhuSWFVM1BsdzNFV0RjRFdvRWg4YS9m?=
 =?utf-8?B?eWFZb2dRblovWW5zNVA2M3B4TXppb2l2MnBrd01OWTh3d3JzaFBTdkZjVGRP?=
 =?utf-8?B?MWVrSVhCVk8rSk1qTWczUXg0bS9rR0s0ZXcxa1FrbmdsZXg3aGdJa1pCM0lX?=
 =?utf-8?B?Mk43bzU1alRPVThBbDZYOUtBVjY1N3EwUSs1ZTMvSUthNDFWTTZrK0h1NUpO?=
 =?utf-8?B?SUNGblJFdENPZHB6UHdpRTNScDJqQnlrT3VTeHZoNnN2L3crRG9oVk1zdG5I?=
 =?utf-8?B?cEJHOEpNLzRybjV0V1NmaVJidHRwWDdUdk9ORUpXcHpUenh1T3FMaXBRN2ZU?=
 =?utf-8?B?RWpKcnF0UzJ2d1orWWxUTDU0eGY0bmpBU0I4T0F1WFVxcGxQZDBtUVBPLzlh?=
 =?utf-8?B?L3BHNVNwandGRy9qcGxMdno5bmhFSGkvOVZQTjUrQkVuSmt1UkJYc2lCU2pV?=
 =?utf-8?B?REN0b3Q2dWk1WTl0T3FkbHQ1dGtYaldkZUJsUTNROGszZmVVMzNPbTF5aTJi?=
 =?utf-8?B?WERZTEdDRnRuNmhsNUtEeDNHTnd0L2VkS2xaWUJDbEhxZElHKzJ5VlVvWEVp?=
 =?utf-8?B?eHJKMDhSaFVVT2EwR3BYbWhTd2lrdldqREhwZm1icWM0SlpWYnBpK3BhcEFo?=
 =?utf-8?B?dTJxK2g2ZlR6WUlWenVnRk5yQkpkY0ZIa1NjVnBlNkpSRzYxYVZTWnczekE2?=
 =?utf-8?B?UG4rWWRRVTM0MEUwbU9pTG9HMHZBYUV3c1VUZzlZdnhhaUVlaFcrcW9sQU9U?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4sYf/frugkmAtpQwGB+VAok1ud2bOwnSqcJj4XRqQgdc9L5/LfGr+D4LlyGpHc095WvJQIw1lu3D0MTO40PuvhreZd6dmskUSMbhT5cerHvr4u7xM7UCT6vyCNvFJr2NIGdjOqHT3mfdsH1HrhwArEBw46o0PUsSz5POfyVOOQLmopI3lxpSccjHu+cQ8mwBzh/IwQHD4bXsfyrkgmPJShJ0pEROsxQogdY3I9pHgsm2O8ww5QPoCZ9545POp3uBIiZHiFMnvwbfZcodRw9VgEj3x/sA/94gHdGD5E9a6IVfa3/kjCbuc4KBE1vBS0oVroK3/vOf84q9vx3oZ9+SHA3Xn44SPyNlyJJTmrxwGUodxqhpig5vecIfwVsZKx2z0yp5uxJYbpDsiL2Le8GUMotLpxDH6Unk6Dnv1otU6hAdRlCtO7bd5JRiQ862YizovzA+692dQEI5u492TaYTdis2HcZTCXz0pGzzk2MB064BLdOFVPmIKVZKqw9PPUWLNLTYP+VwYS/6OpC+rdhQYpomYy8vuasmBDg+lNj4G1kKdQkay5/D4bc0BMW+5VwOPtdoFB/oLGNV9jH9cNVRAhHaz7SeTriBaOLyJHwe4pwu/Coi0hcozEglIQXIulWhGcrGHFtPVgWNOXAHnRMLMFIh4yUWuHrRxs0803/8i8O0tSfdYoXD7BDs4U2ovROjY3Td6xG1udtzHbw3taG8a+LGflPRmJ8Tn3yWbQ9fqxIYak1z9Lm3Cko7BnKvKBhNX/16Gcj6Exw3VNfBAESK7p3TzsMVPC0ssdFBDutxs3PqMlvTDmvT+5h2vM8bJU0V
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e491b1f3-cc84-4248-85d9-08dbb4324a53
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:20:29.4258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E3xRU1tyOZdvIMyiGP3yJYPnY3lkma5OA+zvFtPBDabEFzf3nbw3NTV2Ug5iXrRIv+93+L4Ddv2arZTWPDPt+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7106

On Wed, Sep 13, 2023 at 08:14:46AM +0200, Jan Beulich wrote:
> On 12.09.2023 18:23, Roger Pau Monne wrote:
> > OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
> > set, and will also attempt to unconditionally access HWCR if the TSC is
> > reported as Invariant.
> > 
> > The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
> > (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
> > a suitable solution.
> 
> Why is the warning bogus? The PPR doesn't even state what the bit being
> clear means; it's a r/o one. On respective families it cannot possibly
> be correct to expose it clear.

There are other bits in the same MSR that only state the meaning of
one value and are not r/o, so my take is that being clear means "The
TSC doesn't increment at the P0 frequency".

Since it's model specific, it should be possible for some models to
have the bit clear.

> > In order to fix expose an empty HWCR.
> > 
> > Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Not sure whether we want to expose something when is_cpufreq_controller() is
> > true, seeing as there's a special wrmsr handler for the same MSR in that case.
> > Likely should be done for PV only, but also likely quite bogus.
> 
> Well, keying to is_cpufreq_controller() is indeed questionable, but is
> there any reason to not minimally expose the bit correctly when a
> domain cannot migrate?

We would then also need to expose PSTATE0 at least to make OpenBSD
happy (and any otehr guest that makes the connection between
TscFreqSel and getting the P0 frequency from PSTATE0.

Thanks, Roger.

