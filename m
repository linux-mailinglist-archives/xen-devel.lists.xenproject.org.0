Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9E579E197
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 10:08:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601046.936946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKvV-0001f7-2P; Wed, 13 Sep 2023 08:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601046.936946; Wed, 13 Sep 2023 08:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgKvU-0001cj-Uz; Wed, 13 Sep 2023 08:08:44 +0000
Received: by outflank-mailman (input) for mailman id 601046;
 Wed, 13 Sep 2023 08:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rq8V=E5=citrix.com=prvs=6130a4f39=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgKvU-0001cd-0I
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 08:08:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be92059e-520c-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 10:08:40 +0200 (CEST)
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2023 04:08:38 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6488.namprd03.prod.outlook.com (2603:10b6:a03:397::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Wed, 13 Sep
 2023 08:08:33 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::efdb:990a:5b04:8783%6]) with mapi id 15.20.6768.029; Wed, 13 Sep 2023
 08:08:32 +0000
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
X-Inumbo-ID: be92059e-520c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694592520;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=d3SYyDLj69w+jZHpbV+6d8IXWpAbY5UOX3nlTjztC1E=;
  b=I4z2XQh4iFDcSqw7Iwe+GSyzxMjCmMi0j7hsdpHxv2zCWecoHs6z3n+S
   wigYZ42l2/mI0V0XfQxL3tptSLERKplYfhd8tB/XFOCPcsyRO9TXgCjTW
   uqTZvRwl6GQ8JXp1G6V+iw60kTsnvBQW5mjf6uFNoDx23/N030ZOB+2uJ
   0=;
X-CSE-ConnectionGUID: sxE0H4WMSZSjnwijWxNHhA==
X-CSE-MsgGUID: p1SheF/WSD+8KF+alI553A==
X-IronPort-RemoteIP: 104.47.55.108
X-IronPort-MID: 122343962
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:IsMt+KNcgiZreObvrR1VlsFynXyQoLVcMsEvi/4bfWQNrUp01zcHn
 GUdCDjQO/uLZTGhKNwgO4+3/E4HusTQnNQ1TAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/jrRC9H5qyo42tJ5wdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0v1nLDluq
 cM9EwI2bBachuCJ0JSbSsA506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCDpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyj23bOUzH2hMG4UPKXhzf5nrhqs/UBQWD44FlK/gKTk0WfrDrqzL
 GRRoELCt5Ma5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGRDNcbN0ttOctWCcnk
 FSOmrvBGjhHoLCTD3WH+d+8tjS2NC4YBWgaaCkOVgdD5MPsyKk2hwjKR8xuE4a0iMP0AjD6x
 z2WrCk4iK4XhMRN3KK+lXjLjjetjpnPUA8u5w/TU36l7wV2f4qsbcqj7l2z0BpbBIOQT13Eu
 WdencGbtbgKFcvUzHzLR/gRFra04frDKCfbnVNkA5gm8XKq5mKneodTpjp5IS+FL/o5RNMgW
 2eL0Ss52XOZFCLCgXNfC25pN/kX8A==
IronPort-HdrOrdr: A9a23:2eG/HquOCXbhGeYc1+sKVyq07skDe9V00zEX/kB9WHVpm6uj5q
 WTdZUgpH3JYVMqMxsdcL+7VZVoPkmskaKdjbN8AV7BZmjbURqTXeJfBOLZqlXd8kvFmdK1vp
 0BT0ERMrPN5FFB/KHH3DU=
X-Talos-CUID: =?us-ascii?q?9a23=3AhLwmTGm//VlMvYggwwAQWhY3i6/XOWbN4S/wf3C?=
 =?us-ascii?q?dMlRSSruKSF2v6IVEk+M7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aktujxg6FD27ncS9R+KArCI64xoxwup+uBW5Krq4?=
 =?us-ascii?q?q+JmnG295PxbA0W+eF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.02,142,1688443200"; 
   d="scan'208";a="122343962"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdwVW7EueMXyUCcik0eZLyrkyb+qsABC4L6aZ/Z14bgKgP0JTR0oRsLXhroCWYv9j7ewPnzDCDHF28oNxMQ+lcpA8C7uymfNdbJLpHTRFxDT/iqSRHW7W8X0ujnX8j4Q7FcxJdSUNElhxpUoEKoDWSvGH2dCUSz6QMozEjR31i+vpb1aDdIk7/uFFvRncG45ZhNlsr//3qmTPixMk65KqBPu8EQ2gXMEPi/IFuQcbagbHrOWjqrQs/aElP5PFCJ36Sm74fe69ErdJDqcA9klJVhJy9imGzjtohg+ixFw2MBe4P8yUagr/Ig/GNApeFHalkLMpwfPBt8JzixEj7y/7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juF3907G/TaZ8fxiP6f9qUJxjfaM8WA4dQTpVRAIDzE=;
 b=VzX7IiY9D9YENpXsEXVk/dlfRe/w0Rwm6MqFzz94LFHXx8zl2EPiRuGF8LLviNcUSIY4RpAPVyeIS8y9H9owj+zY4jsf61dXh1LipKKYWcFLgYGLHU44JggnrTavNWEnxoZ6LXWpo7V4K1vkQk4cVhiU0NQiVzWpKhoxas1ucuclQubkjsuD9ZhYYyrFTJhyPXdX0DWMsk56wEEUjM/wBl8QZhevjUZD0e9Y9PHxwmqL2DHtK4sBXOb2Ml0JWGRpB2Lgl9kJqD6vyFg5sdxFrK5UZLOIWfSCKvBiQo1F7CUDR5wvNBplG6cBtDw9KIJFDd/8mnMntL2EoQXYcFgTgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juF3907G/TaZ8fxiP6f9qUJxjfaM8WA4dQTpVRAIDzE=;
 b=DrC3/uv93DejLjqIJxxkFy0b7Y7gBwxtZLw+TOGFJekIITs7+ko//TotkWUi7M8/cQ1PsQVNm8Eok/lBEGSkuj3aCx1vFwQemaKlc2RU+1CBlB4ke13mwhGjJJJcEaXO4lketZPJwAdYKGKZ121VTjyt6UzCUdKBbU7agl+nnXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 13 Sep 2023 10:08:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>, solene@openbsd.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: [PATCH] x86/amd: do not expose HWCR.TscFreqSel to guests
Message-ID: <ZQFt-7x90QWL_Rmi@MacBook-MacBook-Pro-de-Roger.local>
References: <20230912162305.34339-1-roger.pau@citrix.com>
 <fc91c802-5f71-4ec9-8c11-68fd2c4ae672@citrix.com>
 <989ebefa-42f1-cac7-e2d3-f4bcd1e4b662@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <989ebefa-42f1-cac7-e2d3-f4bcd1e4b662@citrix.com>
X-ClientProxiedBy: MR1P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:54::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: df1edda6-5b35-4dc6-237d-08dbb4309f2b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mI2sSadtS/+LSpzOvArCep6LQTGMte7ew3nqDUgP8x1ifRmJu4txo3DkPgqY48/eyC3SFaR7/boc2S/DACBL+LhuGJCU5KYpeY+soea/ZW+Q82MU80vzx7GOX5fnQVOAGj2Oh97GhnNqls80KYvBZ/2fOIgnGIsWTTiJxQLCy+J4UzH7rWG1M+o0l1uPnEm+X1sdFvSyuma5gsWxOCLM95IkmeKbk6Z0Y26hz8qeWf/rBlGC8RFRiJjYNwXlTa66HfG+j4DtaptHzqaeIiO6tZxKv1wpfNR/VQLlMoCZ0fEH4jiTKzHnF7NsdMXXOGI1lfIesK/eVeG18dJglLayxqdJErDmT8g8v8LBaHvD1YuAj2oiV1jWuQ2P1DgrU9a9pivhPh54/4/F0ZoJ0rBUFvNgj+PgY8e/DUUlLGKteT9orFUhY5BENcmzLV0qom+mRhg9MdiK92Tpuqk6mSQWcDVkDULDcmXOwEzqBIyENdDGNi/NcikL6UASzFJ/El9Zrc53IkumaXAyPUt2OWbOaE/Ez3fafowfvD+nuA5JiNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(451199024)(1800799009)(186009)(83380400001)(53546011)(6512007)(9686003)(82960400001)(8676002)(2906002)(85182001)(5660300002)(316002)(6636002)(6862004)(4326008)(8936002)(41300700001)(66476007)(54906003)(66556008)(966005)(6666004)(6506007)(6486002)(478600001)(38100700002)(86362001)(26005)(66946007)(66574015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkFIajZaOHR5ODFYTnZxcHZwUVFsRUdoNzFxWVdncmNWc1QwaXhFZU1KTDQy?=
 =?utf-8?B?eDdwU0NLc3oyTHYyRk9MUmp3Wk4zMzVPNG4rZDcxRjdaT2todlByc2plOXFR?=
 =?utf-8?B?SmNPVHNFZzJyY1RYTFZ0QlpYMXcyUkQ5ZnhBelFwcXQyVStKSlJlZUtHTk1S?=
 =?utf-8?B?WElRM2JxSW1iTjB0TGs2R0J5MitpYWJxbHM2S2VCK3NZN1lVcXo3N3lWRzFJ?=
 =?utf-8?B?TUlPVjBCdTRMbHNqR1MvNzJEaFNiUUdOQW9pTlBWK3NjZXhtc1JFb1VxMXBq?=
 =?utf-8?B?V0VLNldhUkJzbFJsc2plQk13NkhhcnJWQXFxYnBJWTFKSGl4b056L05LV2Nm?=
 =?utf-8?B?UkRWRE1vYlVWSUZabVhKeUp6UVYxaG1TMDVaVVZWcmRHc3JEenpKbFFsMWhX?=
 =?utf-8?B?RXMzOXV5UW9WOFFwUCs4N3ZjVzQxTW9yenNYK0YyNzZKejZpRDdIUU1nRHRL?=
 =?utf-8?B?U3dsRm5jdElMLzdIVWY3eDR6QVVjYlNVRGwvd1QxRHdyNXkzOGU2YlA2dXMz?=
 =?utf-8?B?RzhDUWhBTjA1WnZnc2ZMcUxnZDhoRWVZVnU2SVlXam5DWnl3cVJGd0k0Q09O?=
 =?utf-8?B?b3pLMWVvSkU1SjJzYTh5UEtZMkpKSzJmbUt6ZDJMbVpram0zYTdVUVVYc2dp?=
 =?utf-8?B?cGhUR3VnMDFhcE95Si9oYzZJUHRNVDZWTXVReUROTHc0VzBiTEZvMVFyeDN0?=
 =?utf-8?B?cjNZVjhTUkRuR0FQSHBRMkZaRlkyRUlkTVYvNTBCdjFaY28zQk13N2lEeC8x?=
 =?utf-8?B?dnVMQkh5bkdNQ3hqMC9EQ3RrQlAycTlVai9nY05nTENHNEJEdENqQUVCWHFD?=
 =?utf-8?B?WE9OdWo5NlVuOVlqZk1SUHNqWlJyN282Q1lDWTdxUSszRHB5UUsvYnRtak1K?=
 =?utf-8?B?NGlnZm9vVW91d1lBWE1RZGlPUUdTSStJN3Eza0xWcWl6TkEwY1YvVjkvV2k2?=
 =?utf-8?B?VHU1eVBvNEJBRU1QUFJrWjV1bEl2QjNlRUUza3hVWjhJQURPK09UVFRHeXdN?=
 =?utf-8?B?SWQyaTl3M3UvUVhRQTBzMWp1blBpTitCT2ZsV2VzdUJHTmg5OGpuaHYrUE1v?=
 =?utf-8?B?R2p4ZHVKVHlLaytBU1hoTVpoZlk5Vndzb08xZTU4Q2o3RUdOWERLTTlTVWph?=
 =?utf-8?B?RTJDeVhrRWhmbXVVTXBYU0JtWmx5TlFDSXZqZ2I2R0pLR1cvOFdkMnZFVU5k?=
 =?utf-8?B?Sm9VNDFuaEx5VmJGYXRwK3FVSk9pb0FTZlVqaVJleiszZXU2bEZ6OEN4TFF2?=
 =?utf-8?B?UDY3cDhKbjdIaXZiSm5KN2pHUmRNSFFNMU9VK2xUWkVSK256V3FxeGlvanlk?=
 =?utf-8?B?WStYazVWcDY2cWVSZEMwL1BURjFNNndTTXptbVJ6aXo0VFhvTGtoMm95NHJp?=
 =?utf-8?B?azg1MFUwdzZWVFhRWEFuNUw4dUlnK1dzZVYyU3JxbVZ0VGZMOTBQQkVsV3RG?=
 =?utf-8?B?ZkNBUDlzSUJubXZ5cUdoYTRpYWZOT05lYVpQV2dWUXJDQnVyKzJwNmJOblVo?=
 =?utf-8?B?cWRnclFJSVVSQW5qT29DbnA5QUxjMFNuRFZCNFpJVUdaRnRTL2drVjE0ZXd1?=
 =?utf-8?B?Q0FaVmpWMEdpL01mVE5QT0FzWXo0RVJ1QXY5VU5Ocmo2VWg5STVBNTQ0endR?=
 =?utf-8?B?dzU1UFF3V2U1S1h3UVBaMUo0TlhvKzEvNC9lT2FrTC9oQTB1NDUreTVXWGpU?=
 =?utf-8?B?REo1ekpoeEhhS0pDZWRLYy8yZ2tlRzUwelBiMmUrYnlRVGpvdjNWNkpBMEU2?=
 =?utf-8?B?OWI5bG5IZ3drWUNEVXFPVmFYR0dJaW14a3dMWFR1S2VsbjNqWldDS0Z6NmU0?=
 =?utf-8?B?R3VGQXF3bjl3eEJIcUc5Q3V0Z0JxY0FSNWJiY3J1NzZab2pQTlFOTHp1QTRK?=
 =?utf-8?B?eG9CazQ2OUNOdTVlVEZhQThRQjBrMVp6R0Frc3hJaWdZODVEclNWb1Q1OW5V?=
 =?utf-8?B?aEU4eS8vdHErODd2WkczRXdWMEpjemNTbzc1bVZRalZ2L1I3TjZaV0dlbFBC?=
 =?utf-8?B?Z0JTME42QTQ4SUJ4dElrNkZNdHZldWo5MExXbXhWdkRZMEd6VkJ2b0tFMHZP?=
 =?utf-8?B?eXVsNzJ4eUdnOThlUWtCaFZiNVdJOVBZdmYxMkZDWWhqRlI5L0RUWGF4TEs3?=
 =?utf-8?B?L2Y5THY3cVZsV1dweHg2YmxRMHFXSFJ2cnd5TkZVWWNkQ1BqSkQvNVRwRi90?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pG51OLJ5EHNlaZYGEr4GzDUOqYB9djDzkoe5DEU7UEdV0oD61iWrf+1y6TGEmoH75unNeiIqvkpuhCvmAAI8pid5cikdsrY3zw5VU6Uy+gMwWJM0bwKh0wsfcz7uYWCxGdbHmPhzr9rI5+MX1GzHCkVRfjFhYYhM+a59UlLRFvilElDY+KOES8CnZc5+ZGvaV/nd7Q94xITFOBxNhNxKrXgq5HQwPanu++RFW+mYPJDDqPqmnlStefuztU5nn7z8W0XIM+AuFEWVvDbPolxT/alvXrb+4XrYToMN5+EsEC3Ib4+NkV9uHtkWOju1Qxy4+gzwFNTusKILQH+yytFVogBAFGUuz0xzYclSsrBRdc6+/IPPgTOEX4dKFcNLbdngO4HyUDUCGurIrlBDLjjRRc0GFs2Ni9yM9yZiAGhxCsVwEz2fhNbjMI3KE0dwOT/XPp8vtxbSNDGCeESZEYGFL8mncZZT50oDJ2LTmUaT2Tilp7BObzT0VEzd9vNrqaM038bVNyYSe6mvcUyLJ6pefno/U1YLk5dtRR9gvPOrSw0G0ZCq/h4nwmw9bjXR0aVvayKN95feCEeQuJ1LEatqmaUcWJw85RpJA2wRukuEMi65xpB42ry+wqholmt+8a+Q/KYGR/ZdY9AVbM9RhRcny6zTakzxP8JzlhY+yxRR9aD7A3HhLbAUgLJzxq3SYjaN5KGATs2GNiHd8CuqVznry6B500Kg+vYEDI3jzcR7GsPE29dAckSvKT3Ri8SIqPhmSLiv+LgH796r7GoYHe6RHQu1FNhgVxD0+6gl9u/LOgSj6b6WNchZ3GMOsd3MiGtcmV3GeqywqHtDCkfnquiZGOqYq6cMOkdswlzI9gZsguF/PEsYuvu6m88iBSHigFVOGcBHXOYf4hwp7ph+PkGNsqjG48+e2I1JrBasih0X8H8=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1edda6-5b35-4dc6-237d-08dbb4309f2b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 08:08:32.7579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCkiMEPbvb3EMLvkYZBIBMMPk88kMjQl02GSGsYbEAbA1jeoGN8RDucW7yke+oDFPZLLuIW4KFXzBEMzU0bpmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6488

On Tue, Sep 12, 2023 at 05:36:53PM +0100, Andrew Cooper wrote:
> On 12/09/2023 5:35 pm, Andrew Cooper wrote:
> > On 12/09/2023 5:23 pm, Roger Pau Monne wrote:
> >> OpenBSD will attempt to unconditionally access PSTATE0 if HWCR.TscFreqSel is
> >> set, and will also attempt to unconditionally access HWCR if the TSC is
> >> reported as Invariant.
> >>
> >> The reasoning for exposing HWCR.TscFreqSel was to avoid Linux from printing a
> >> (bogus) warning message, but doing so at the cost of OpenBSD not booting is not
> >> a suitable solution.
> >>
> >> In order to fix expose an empty HWCR.
> > At first I was thinking a straight up revert, but AMD's CPUID Faulting
> > is an architectural bit in here so it's worth keeping the register around.
> >
> >> Fixes: 14b95b3b8546 ('x86/AMD: expose HWCR.TscFreqSel to guests')
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >> ---
> >> Not sure whether we want to expose something when is_cpufreq_controller() is
> >> true, seeing as there's a special wrmsr handler for the same MSR in that case.
> >> Likely should be done for PV only, but also likely quite bogus.
> >>
> >> Missing reported by as the issue came from the QubesOS tracker.
> > Well - we can at least have a:
> >
> > Link: https://github.com/QubesOS/qubes-issues/issues/8502
> >
> > in the commit message, and it's probably worth asking Solène / Marek
> > (both CC'd) if they want a Reported-by tag.
> >
> >> ---
> >>  xen/arch/x86/msr.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
> >> index 3f0450259cdf..964d500ff8a1 100644
> >> --- a/xen/arch/x86/msr.c
> >> +++ b/xen/arch/x86/msr.c
> >> @@ -240,8 +240,12 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
> >>      case MSR_K8_HWCR:
> >>          if ( !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> >>              goto gp_fault;
> >> -        *val = get_cpu_family(cp->basic.raw_fms, NULL, NULL) >= 0x10
> >> -               ? K8_HWCR_TSC_FREQ_SEL : 0;
> >> +        /*
> >> +         * OpenBSD 7.3 accesses HWCR unconditionally if the TSC is reported as
> >> +         * Invariant.  Do not set TSC_FREQ_SEL as that would trigger OpenBSD to
> >> +         * also poke at PSTATE0.
> >> +         */
> > While this is true, the justification for removing this is because
> > TSC_FREQ_SEL is a model specific bit, not an architectural bit in HWCR.
> >
> > Also because it's addition without writing into the migration stream was
> > bogus irrespective of the specifics of the bit.
> >
> > I'm still of the opinion that it's buggy for OpenBSD to be looking at
> > model specific bits when virtualised, but given my latest reading of the
> > AMD manuals, I think OpenBSD *is* well behaved looking at PSTATE0 if it
> > can see TSC_FREQ_SEL.
> >
> > In some theoretical future where the toolstack better understands MSRs
> > and (non)migratable VMs (which is the QubesOS usecase), then it would in
> > principle be fine to construct a VM which can see the host TSC_FREQ_SEL
> > and PSTATE* values.
> >
> > Preferably with an adjusted comment, Reviewed-by: Andrew Cooper
> > <andrew.cooper3@citrix.com>
> 
> Sorry - I meant to be clearer here.  I'd suggest just deleting the
> comment and leaving an unconditional return of 0 (which will become
> conditional when we wire up CPUID Faulting).
> 
> MSR_HWCR *is* an architectural MSR on any 64bit AMD system, so shouldn't
> fault.

Hm, I think it's worth to at least keep a note that if TSC_FREQ_SEL is
exposed PSTATE0 must also be exposed to prevent OpenBSD 7.3 from
panicking.

Thanks, Roger.

