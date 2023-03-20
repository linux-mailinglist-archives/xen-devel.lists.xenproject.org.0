Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41C6C1E8F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 18:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512038.791627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peJeU-00062V-Fh; Mon, 20 Mar 2023 17:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512038.791627; Mon, 20 Mar 2023 17:50:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peJeU-0005zj-Cl; Mon, 20 Mar 2023 17:50:34 +0000
Received: by outflank-mailman (input) for mailman id 512038;
 Mon, 20 Mar 2023 17:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xqGy=7M=citrix.com=prvs=436e66757=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1peJeS-0005zd-NX
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 17:50:32 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad9ad99d-c747-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 18:50:29 +0100 (CET)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Mar 2023 13:50:08 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB7125.namprd03.prod.outlook.com (2603:10b6:a03:4e4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:50:03 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 17:50:03 +0000
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
X-Inumbo-ID: ad9ad99d-c747-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679334629;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sk4hA6h7Bjyvk3aZ8cSe5deHsiLR8bA3E6PIAMeNHgg=;
  b=IuOqdx+Wxo+FKH5K1QSIgb+PDe9MiTi4Qa5fRcRpQAztt6gzfxGiBryp
   jNLraOwvB+BqZ9Jj3M5EP0nLDwlV4WiEoiWA1EOkw2qGWJH/eQp/pG+NV
   0CCEuWjouQGiwRiSt2cEv3xKuBCybPYrwiQfA7szToZ82tKlGMQoa5bUL
   4=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 104002259
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:V8ANaKNoW1gOIITvrR2OlsFynXyQoLVcMsEvi/4bfWQNrUp3gmZWy
 WMZWziFMq2DN2ejft5zbNy+9E8G78TXx9c1QQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5ARmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0shYG1Np9
 +EzEz4yNTCvpvKN2JSSYPY506zPLOGzVG8ekldJ6GiBSNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujCDpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxX+jANhISezQGvhCunu591MwBQYsaXC6q8TjqkCXecl6J
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wmlx6rZ5kWJC24sS2NZLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Y020BTGS487FLbv14WlXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:4L5rTqj3u1LApiMOW2a40d7ISnBQX6R23DAbv31ZSRFFG/Fwz/
 re7MjzECWE/Ar5K0tQyuxoWZPwE080kKQf3WB/B8bfYOCLghrQEGgm1/qS/9SCIVyzygc+79
 YeT0EWMrSZZzQU7KaKh3jfLz9j+qj4zEnBv5aR854Hd3AQV0gU1XYFNu/tKDwNeOApP+tAKH
 Op3LsHmxOQPVgHZMGyBn0IRMnEvcDGmajnbxkPGgI95BPLqT+z8rb1HyGC2B0TSSlCzN4ZgA
 v4uj28yrSotvm6zhPG92vL9JRQhfPq19tEA6W3+6woAwSpphejYYxgX7GYnDQtu+Gp9XMjjd
 XKqQdIBbUX11rhOk2lqx7k2w3tyw807W7z7FeEjXzosaXCNVAH4od69MVkmtSw0TtsgDnQu5
 gn40up875sST/QliX04NbFEzlsi0qPuHIn1dUeinROOLFuIIO4+eYkkn99IdMlJmbX+YonGO
 5hAIX3//BNa26XaHjfoy1G3MGsdm5bJGbbfmEy/uiulxRGlnFwyEUVgOYFmG0byZ47Q55Yo8
 zZL6VTkq1URMN+V9MhOA44e7rpNoXxe2OWDIvSGyW+KEg/AQOVl3cj2sRu2AmoEKZ4hafa1q
 6xHyIHiYb1E3ieSfFml6c7gSwle1/NKwgEEKllltpEU43HNfnW2GW4OSITeuub0rAi657gKr
 KO0GQ/OY6oEYMYcbw5lDEX3PJpWCkjuBl/gKdrZ7vJmLOMFmXn29arBco7DICdZgoZZg==
X-IronPort-AV: E=Sophos;i="5.98,276,1673931600"; 
   d="scan'208";a="104002259"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2TAvtQeZ8WYltUU4bv1ETFmHuVMYvMD7Faepdm7ZX/lJgz1jC/K5Xoq7zf0sQ5W4k+TLHquY0WNsfgnnHifVZ7vFTT4MrO3CGiqaGz/xRGnUv2JaEQKwRoKtVfD5OxKvs1hGIDU7RDfL2pZOYr3Og9iIDS669TmOjJg83zaQKZ9HezFjFP6STOJG+88UnUMGsdOPL38T4vDqItagF+pILcEHEhoAmptrg+d8NCARo+gEqMhYy0REqZVXNcifaAKib1MKZllU4ti5NYyXgK3wMV0WWQwguhYjLzzxJWsFFfWt0YO4aV3b2uROT0K4PeSyjqmUBIou0FnnhF/ZXeskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuN1LeBsUXFBsm+OrJGaDhnAvkYG6aUiE64AVMrKfc0=;
 b=Qjz0FNpKA3ReM4HoeqyiBn3fyylSJGo7vdnstweqkr8f8IXJ0EJRyK/UIkde/IlpX1phEz/p2/8/DfSi6PeO6BsMGbGlsAvZ+L0eoYCIE4AEJjDKec1jJKU7L/zKJqq0G8jEGaU2S7w5iLcaYo0Zby07e280/Z+Xy1Rs9XVLY929tqgY/201AgLaYke49T56IquD/EG29NppHrvcLzRC8GDjSfsWiPznIE4kCZSgJrg3wlvgGn4yA5eLCqxXK75lDcsiOq7xu2z4y6OC1h30bXEK9rFykwlRBrsvGMFQG7wv+a3l46Vuc/ennActLoy1nPe7ddrxusc2S06vJZnW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuN1LeBsUXFBsm+OrJGaDhnAvkYG6aUiE64AVMrKfc0=;
 b=mQCX5Tef5+C/MG3i8GKmy9ima5Q8rKZhrKz58uT9zcDXsczuN7uWFCkJxs+WBhEx2Oll0U7qT4lqJnopwVXqf2bWoPKBAQ/ub5m9TTXByG0C/sL2HL1LR6jU3SAZ2E2++dk4YzlMkKcbGiAW6JN3emW1q4grWvEt2Au3TcXwJh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <57438451-920f-2f59-333c-3ed0b5a1558b@citrix.com>
Date: Mon, 20 Mar 2023 17:50:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [BUG] x2apic broken with current AMD hardware
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org
References: <ZAiobgH4L0OAS6XP@mattapan.m5p.com>
 <a2e5cb62-9aef-4f91-b5e9-35fee6739fc8@suse.com>
 <ZAkVVhIldUv/xQqt@mattapan.m5p.com>
 <21436010-8212-7b09-a577-09d3f57156bf@suse.com>
 <ZAvGvokloPf+ltr9@mattapan.m5p.com>
 <f33c9b8a-f25d-caab-659d-d34ba21ebc25@suse.com>
 <ZBOSKo+sT/FtWY9C@mattapan.m5p.com>
 <e5b28dae-3699-cb0d-ab7e-42fdd42d3222@suse.com>
 <ZBSi2KfoQXo7hr6z@mattapan.m5p.com>
 <b2eaeacc-de5f-ebe9-a330-fbf9e20626b1@suse.com>
 <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <a2de5d87-ada8-46b9-090b-00dc43309362@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0065.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB7125:EE_
X-MS-Office365-Filtering-Correlation-Id: e20bdb03-a53f-4eeb-5626-08db296b87b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tT2zgiaI58g1xDXebYh40jFlQJOc1ppPbBXrb0NTZhQKyiUI3aSnfSP471IcixERhGMfork2tI3UH+eGcANGqOHySES+6NCT78pnVOSORs93IeuoCi/mSSn5zFBaltwTrd6SL7+BvvsK1JmJcHgABxUfFGuD286AQlQurd2waMD/bzJo8P5RreA7SNsHOamn9bAJ8hCVPsbAdRDgY0lo8jT01FBIEGF2FzKm0ZoyXTFeiWmQ8mjcdjhTIxBht15RpZafMzswYvYENiCkIf858VzWk8DAFaxgnFVAyLS9B8Q0CBpqX2Z32ZTDCOjJY/pJHwBm7uSXw8O2YPwvOcGLXHFjnqgj2YBUkXKcPSSaMN327/teu9bdTauf2Sc+TkNTrpeIxtPBq0v9q9TxQQl2wTvF7YJLiMBOmqz1FMiQUohwKzvFFK6ot4C4UguOciqATHsFu3v9ChnxGV5dvr30x0QMmvqnfx0XowzxjVtT2vpwNdJ818iAYFrsy/Fe3Ux/jCElqhKpk51GLNDvTZxzve9mwrznBShZzG/d5sptI58bqJbx1IpE8pJCYBPGrW00944pl10l625VqBmJvffYF5wsz1k1iV40udSf5Oarr2uq0EfktUV4MDu6fGfAMdY0T3USTCPwCMnbPVP9dpnWVfhk6p+SSIeJdp+7SUWEMjZX98LAaF4YX7hUlbGykJtrO6yNFtCjsAsDLkeoKLoXnLLmNkS/lAT+cbjsrT570eo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199018)(83380400001)(6506007)(6512007)(66476007)(26005)(84970400001)(2616005)(478600001)(186003)(66556008)(66946007)(8676002)(316002)(110136005)(4326008)(53546011)(31686004)(6486002)(5660300002)(41300700001)(8936002)(82960400001)(38100700002)(2906002)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUV3WmlKMkMyUVhzSXZWbnI1QjQ0bnNJYXBFWE8zVjlSNWNncnhYaWVzWGtz?=
 =?utf-8?B?S2RyOGtIcnkxVlVJNUNOTHdJZyt3VTViZTI4am52NkJkR2dwczY0aVBwUktj?=
 =?utf-8?B?OHR1UHNkRGpYWVBzOHpTYWx1aWx4eEpYWlN3NVRINnhZeG5CbjNyOUdaZ2N3?=
 =?utf-8?B?NHZhc3FKVjR6ZzZBR3ozUXdSTEpvYTFtVE5UVmtYNlNSRW1lTVJzUjFodnV2?=
 =?utf-8?B?SVBLc1ZBV1Z1YUVVcFdac1ZlM1dudnREeVEzRVBnYlRmQlZQU0tzamlyUWVq?=
 =?utf-8?B?ZjJuL1IwK2lzOHk2Vi9FZGFYMm1VeWd2TW5zMTZCQll1WlFTUHZtMlN2Z2Zq?=
 =?utf-8?B?dXVlanZKSlBhbmExK3JaZjQxeitDU0ZDUEJLWDIrNWZBVG54YzNDK0ljeGl6?=
 =?utf-8?B?VmdybDY4WjJ4WTFJR2loUVVaQ1QxQjJHYmVFL1dTN3JOY3N3ZDRRM1JIWnRz?=
 =?utf-8?B?cS83R1l4SE0wL0o0eDBJckcrUWtSV3JrRThsSUEvTFUrMER5MGZsZjZqSnZo?=
 =?utf-8?B?eVlnalBUWmx4aEhuMDh4aEdQQi9hRFpwc3g2ckRPOC9JUVk3ZXFyR1MweHMy?=
 =?utf-8?B?elpZQmZ2Y0pxZjAwRytKczkvRmdpVG5ienJRcTFDaHRzVUQ2NmtLUVBvUTVH?=
 =?utf-8?B?VFZQOWx0WlN1TFF5VFExQjhYQXhlcXBRQXBidFA3LzhVNDdReGxGM0kycEZx?=
 =?utf-8?B?VGtxaEIvMm9WZ05aU2lhdjJ0K0RQU0V0Q3FOak5rVDVqSUVJYzZ0d1F6QktG?=
 =?utf-8?B?ZlpRbmdZbitGZmFwWnVXckUxVkkvM0tsTTRkVnhFRnZjU1UyTnUxWUpXSGhp?=
 =?utf-8?B?czVxaVB2V2hneFY3ak9IYVRHSTZLY2pWRHNsNVFyK3JQQXNjRmFjTCtMM3Vz?=
 =?utf-8?B?dk5oYmd6K3VDTVVEQWJlZDFKQnhnTG45T3AyNzVCNi9xaWVWcS9sejVScjBQ?=
 =?utf-8?B?TTNuTXo3bW9vMnY3R2ovYVYreCt4RlZIMWcraUFJa1NvdGpGNG1QVWlPZ0FM?=
 =?utf-8?B?QUI3M2EzNWNITC9hVmNjTW5naTZUZ1RGQ0cvazdIZHNqeXJ6bGM5N0p6MnFO?=
 =?utf-8?B?cWZXSkpJQzFEQjJ4OXdBbTdVRXptcHNnQ3NpUHkvUXphbEdPMHlNQ2pUeGg0?=
 =?utf-8?B?SElZaHE4Vk5OSnF0VUxDaVhJZWREVjk5V2lvQ3Fkb2JWeDY0ZDhKSkcxQWtO?=
 =?utf-8?B?K1NVZFdEUzBSTnI4cW9Fc2FGbW9aMU95TDBxcUJXMHM5R1EvTEdBZXhzRHE5?=
 =?utf-8?B?OEZPOStidkxpWnhyWjVGbFpKU2cyL0xDQ3JMVUZaUkxZNGE4Tk4xVFdDNmlk?=
 =?utf-8?B?MWt4RUVVU3RITG9xOFRTWGNDSCs3UGtuVGR2ZHJaTzRyZklSK2JTTlNXOHVE?=
 =?utf-8?B?YWdqekVNUCtPVzg0T0g5VEFEMEcyc0hiMkpObGcvb1JzeCtsc2J2NGtRZFdP?=
 =?utf-8?B?Y2s3aW1iakkzN2V1K0lOQ0lkdUd2eVlFZC8zZHBGaXE5WEpVR0x6SHJOcVJW?=
 =?utf-8?B?NThzR29PbTZmbVJNVERCdXdrZGQ1VmRwSVZUTFRPd2d3U05UMG1mM3dXYW9H?=
 =?utf-8?B?K3JXTTF4azBtcUlTQVVkeXMzMi9pNlFqZk9vZGtpWUc4eDFXUkF2d2o2K2Iz?=
 =?utf-8?B?VTJYN0dEZy9lVHAvclBtSFRnL1R4RElxeTlyd3VoRjF6NytPOWJVanNrUlo1?=
 =?utf-8?B?TWdja3B0Z3JYNU9lMWpXNHpkQkNoeUxidjZqUTM2c1IvNjhWUW5ZRHIvdmJI?=
 =?utf-8?B?ZUg5ZUFrQ0ZNT3RlNTRZN0tWSVdiVnR0UE9BemR4Y3lLd05MODNRd2UzRmlR?=
 =?utf-8?B?MnNkQjQxa3lwZHVEN2E5ejBpanBFam1UdTVkYUpXYWZIU0V0RWpUZ1NXWmtk?=
 =?utf-8?B?dlBKQ1BrdjBMYkVhRGxTcDR3cEtSUkRySXJORTIrNnpQTjBoZDRHSXl3cksr?=
 =?utf-8?B?b2Y0bkQ2bjNla2FIKzRva1dqVFd4WmpqVGdWM1JvbVREelBIOEQrM1BINGo3?=
 =?utf-8?B?aStncEtPODZ4dTQ5Si9TcWRrWjFsNzVFbzNxaDJkZC83RTVheWZJbXJ1NVVS?=
 =?utf-8?B?bnMvUjRzR0lQajl1YnFPclBUWXRoazJoSUdWbDFNempTdUxoc2lremErd1JP?=
 =?utf-8?B?Z0pTaUp6RGZxbFZHdGpFUEtqK01KdzN4THc3Z2wwSkVJRENEdDBqYitMMERl?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MmaSOFztW/3vRfD1+DCy6Yl5n6TvvRx1viG9caN6GN/NpcFHNII+zZNC8AZlJ67NsulzDbFOpqfEvg6PVtPVS8GXW4V476j9/CdAiCRXB8K+3ZMS75Zf/LmSmquh+Z2DFMYKmuXey+zNeNVs46mQT0fU/GyKOf0B/pskHY9uNx8vgY1f+NVfuD5o2RCUXxE+1Jrxgffj5Lyj5iT1F16iaWUxWvq8HgtwsXeaRL3fhUflmTttw6+nBaPFFLrvlx1cn3ztbskYbZec9jmzrTboConCHSpUOl3/g1xYKltjV3c2EDhHmUXgrPQyMwgHq3TvY0e9/HW2cT8kAG/KTfCNgakoBJRHhv62wnV8MftxlzRECku3lG+/LPKm+EsIWzZz0J3Foninq0wmvHLQd38j02Z3bsqSHk9fIzLigkE6pGvTWXyJK5rOWRWm5dnwQvoUMZDfNy9YLjRiLYi35mwqRfZZHLC7fduAaP0JvQbFn6Wb//Jvq9drLBU1aENnSj1bR5/DpWdXeu9Q2Il74xoDiSxEjjrfDI++uvHvg2ahUUinJOtGJE8YOfxPZXO8wMXhIfFnEs3IQ5ZS+BZa3Dw7e4TruC4YozSaznNdOryzEalLlDODVGlcfeftM2bGqPwXK7iVKFlA29MN/w8GoLHMTh6rnXPnjE75DbvdVOp33FjWJiN2QVk3xcRIiSAOFUHhpdgqNYQEcC1UXnFZoC2/5sxJkNIdIehmR2ewiepgOt3YYiJblUWi5CIYTA6BluUB3V/e3EXyZQlmdQTcGhLkQYfoNu9cEgGhXVe5YwOYqtISQSygCy1iRqndtaYgp1uj
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20bdb03-a53f-4eeb-5626-08db296b87b3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:50:02.8910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unhC1sYQFfahWjSUd8o2xDqpMgU90sNi4RTT34QVBmmea/HjR0MTSrEPSOAEb5h1+BqHRlU/Z67ZydXQD2QRAwnQ2eLxZKSJmkE+WMckiDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB7125

On 20/03/2023 8:28 am, Jan Beulich wrote:
> On 20.03.2023 09:14, Jan Beulich wrote:
>> On 17.03.2023 18:26, Elliott Mitchell wrote:
>>> On Fri, Mar 17, 2023 at 09:22:09AM +0100, Jan Beulich wrote:
>>>> On 16.03.2023 23:03, Elliott Mitchell wrote:
>>>>> On Mon, Mar 13, 2023 at 08:01:02AM +0100, Jan Beulich wrote:
>>>>>> On 11.03.2023 01:09, Elliott Mitchell wrote:
>>>>>>> On Thu, Mar 09, 2023 at 10:03:23AM +0100, Jan Beulich wrote:
>>>>>>>> In any event you will want to collect a serial log at maximum verbosity.
>>>>>>>> It would also be of interest to know whether turning off the IOMMU avoids
>>>>>>>> the issue as well (on the assumption that your system has less than 255
>>>>>>>> CPUs).
>>>>>>> I think I might have figured out the situation in a different fashion.
>>>>>>>
>>>>>>> I was taking a look at the BIOS manual for this motherboard and noticed
>>>>>>> a mention of a "Local APIC Mode" setting.  Four values are listed
>>>>>>> "Compatibility", "xAPIC", "x2APIC", and "Auto".
>>>>>>>
>>>>>>> That is the sort of setting I likely left at "Auto" and that may well
>>>>>>> result in x2 functionality being disabled.  Perhaps the x2APIC
>>>>>>> functionality on AMD is detecting whether the hardware is present, and
>>>>>>> failing to test whether it has been enabled?  (could be useful to output
>>>>>>> a message suggesting enabling the hardware feature)
>>>>>> Can we please move to a little more technical terms here? What is "present"
>>>>>> and "enabled" in your view? I don't suppose you mean the CPUID bit (which
>>>>>> we check) and the x2APIC-mode-enable one (which we drive as needed). It's
>>>>>> also left unclear what the four modes of BIOS operation evaluate to. Even
>>>>>> if we knew that, overriding e.g. "Compatibility" (which likely means some
>>>>>> form of "disabled" / "hidden") isn't normally an appropriate thing to do.
>>>>>> In "Auto" mode Xen likely should work - the only way I could interpret the
>>>>>> the other modes are "xAPIC" meaning no x2APIC ACPI tables entries (and
>>>>>> presumably the CPUID bit also masked), "x2APIC" meaning x2APIC mode pre-
>>>>>> enabled by firmware, and "Auto" leaving it to the OS to select. Yet that's
>>>>>> speculation on my part ...
>>>>> I provided the information I had discovered.  There is a setting for this
>>>>> motherboard (likely present on some similar motherboards) which /may/
>>>>> effect the issue.  I doubt I've tried "compatibility", but none of the
>>>>> values I've tried have gotten the system to boot without "x2apic=false"
>>>>> on Xen's command-line.
>>>>>
>>>>> When setting to "x2APIC" just after "(XEN) AMD-Vi: IOMMU Extended Features:"
>>>>> I see the line "(XEN) - x2APIC".  Later is the line
>>>>> "(XEN) x2APIC mode is already enabled by BIOS."  I'll guess "Auto"
>>>>> leaves the x2APIC turned off since neither line is present.
>>>> When "(XEN) - x2APIC" is absent the IOMMU can't be switched into x2APIC
>>>> mode. Are you sure that's the case when using "Auto"?
>>> grep -eAPIC\ driver -e-\ x2APIC:
>>>
>>> "Auto":
>>> (XEN) Using APIC driver default
>>> (XEN) Overriding APIC driver with bigsmp
>>> (XEN) Switched to APIC driver x2apic_cluster
>>>
>>> "x2APIC":
>>> (XEN) Using APIC driver x2apic_cluster
>>> (XEN) - x2APIC
>>>
>>> Yes, I'm sure.
>> Okay, this then means we're running in a mode we don't mean to run
>> in: When the IOMMU claims to not support x2APIC mode (which is odd in
>> the first place when at the same time the CPU reports x2APIC mode as
>> supported), amd_iommu_prepare() is intended to switch interrupt
>> remapping mode to "restricted" (which in turn would force x2APIC mode
>> to "physical", not "clustered"). I notice though that there are a
>> number of error paths in the function which bypass this setting. Could
>> you add a couple of printk()s to understand which path is taken (each
>> time; the function can be called more than once)?
> I think I've spotted at least one issue. Could you give the patch below
> a try please? (Patch is fine for master and 4.17 but would need context
> adjustment for 4.16.)
>
> Jan
>
> AMD/IOMMU: without XT, x2APIC needs to be forced into physical mode
>
> An earlier change with the same title (commit 1ba66a870eba) altered only
> the path where x2apic_phys was already set to false (perhaps from the
> command line). The same of course needs applying when the variable
> wasn't modified yet from its initial value.
>
> Reported-by: Elliott Mitchell <ehem+xen@m5p.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I think it's worth saying that for diagnosing purposes, if
x2apic_phys=true also resolves the issue, then it is likely related to this.

~Andrew

>
> --- unstable.orig/xen/arch/x86/genapic/x2apic.c
> +++ unstable/xen/arch/x86/genapic/x2apic.c
> @@ -236,11 +236,11 @@ const struct genapic *__init apic_x2apic
>      if ( x2apic_phys < 0 )
>      {
>          /*
> -         * Force physical mode if there's no interrupt remapping support: The
> -         * ID in clustered mode requires a 32 bit destination field due to
> +         * Force physical mode if there's no (full) interrupt remapping support:
> +         * The ID in clustered mode requires a 32 bit destination field due to
>           * the usage of the high 16 bits to hold the cluster ID.
>           */
> -        x2apic_phys = !iommu_intremap ||
> +        x2apic_phys = iommu_intremap != iommu_intremap_full ||
>                        (acpi_gbl_FADT.flags & ACPI_FADT_APIC_PHYSICAL) ||
>                        (IS_ENABLED(CONFIG_X2APIC_PHYSICAL) &&
>                         !(acpi_gbl_FADT.flags & ACPI_FADT_APIC_CLUSTER));
>
>
>


