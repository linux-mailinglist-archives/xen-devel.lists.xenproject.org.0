Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C379A771
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:53:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599282.934623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeXN-0005R8-1f; Mon, 11 Sep 2023 10:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599282.934623; Mon, 11 Sep 2023 10:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfeXM-0005OX-Uj; Mon, 11 Sep 2023 10:53:00 +0000
Received: by outflank-mailman (input) for mailman id 599282;
 Mon, 11 Sep 2023 10:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwba=E3=citrix.com=prvs=6119d0f35=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qfeXL-0005OR-61
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:52:59 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d034074-5091-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 12:52:56 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Sep 2023 06:52:55 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB5983.namprd03.prod.outlook.com (2603:10b6:5:38a::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 10:52:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 10:52:49 +0000
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
X-Inumbo-ID: 5d034074-5091-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694429576;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hjZ1hmru5NkxkEm/Xo7rC/S+CmWd2NAbVZfbmjxWFg8=;
  b=evamnB0vM7ofp8hUoCBskrFvbtZxuJxKz9WgsQqrH2hiAjtOX5Wa5q8K
   /EAYIiyR0Uhf+nyb/vF+Be103eScO0ppx+Yo68vmgejbMhvVZgvK1SJIl
   E3EmnAW6U7rVkRyfu9gsDq7P4vuncTUsPiwZBM2BZjP7zfTd8f/yCrLRA
   c=;
X-CSE-ConnectionGUID: PWCrwTziTi6Xuccx3nnfBA==
X-CSE-MsgGUID: GsFYIFVlTEGEEHtLHA5ecQ==
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 120907919
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:HKugD6kNvRhyBvcYlauf4bTo5gyoJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcDzrUbP/cMGTyLt5waN7gp00Ev8fSzodrHlM5rH9jFSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K6aVA8w5ARkPqga5QeGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cQnAyoSUgKCu+Po8K+wQfk3gMItBuC+aevzulk4pd3YJdAPZMmZBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkV03iea9WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTuXprqE72Qz7Kmo7JwY4ZHqVn/2Fp2GTdvJDD
 2w9pycllP1nnKCsZpynN/Gim1aGtwAdHd9dCew87ymGzq3J70CSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaJiw9PWIEIygeQmM4D8LLpYgyilfDS4hlGavs1NntQ2iuk
 3aNsTQ0gKgVgYgTzaKn8FvbgjWq4J/UUgoy4QaRVWWghu9kWLOYi0WTwQCzxZ59wEyxFDFtY
 FBsdxCi0d0z
IronPort-HdrOrdr: A9a23:mr70zKgIr9V7Iuo0+fcttIPTznBQX8d23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK7yXcH2/h0AV7EZniahILIFvAZ0WKG+VHd8kLFh41gPM
 tbAtBD4ZjLfCNHZKXBkXeF+rQboOVvmZrA7Ym+854ud3ASV0gJ1XYHNu/xKDwSeOApP+tfKH
 PR3Lskm9L2Ek5nEvhTS0N1F9Qq4Lbw5eDbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK7aY+/X
 PDmwnZ4Lzml/2g0BfT20La8pwTwbLau5d+Lf3JrvJQBiTniw6uaogkc7qevAotqOXqxEc2nM
 LKqxIAOd02z3/KZGm6rTbkxgGl+jcz7H3Jz0OenBLY0IHEbQN/L/AEqZNScxPf5UZllNZg0J
 hT12bck5ZMFxvPkAn0+tCNDnhR5wCJiEtntdRWo21UUIMYZrMUhYsD/HlNGJNFOC7h8ogoHM
 RnEcmZzvdLdlGxaWzfowBUsZeRd0V2Oi3DblkJu8ST3TQTtHdlz3EAzMhapXsE/IJVcegy28
 30doBT0J1eRM4faqxwQM0bR9GsN2DLSRXQdEqPPFXODsg8SjLwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rIdGS3adM7gvGTAyGLHXQI/llltpEU4DHNf/W2XXpciFrryLgmYRQPiTjYY
 fxBHoMaMWTalcHGu5yrnnDstdpWD8jufYuy6UGsmK107P2w7LRx5zmmdboVczQ+GUfKyrCK0
 pGegTPD+N9yW3uckPEoXHqKgbQkwrEjN1NLJQ=
X-Talos-CUID: =?us-ascii?q?9a23=3ADqRwtWqKeJDDm0OrGxlMb7TmUfgaWWfC8GXRH07?=
 =?us-ascii?q?mOXtiQ63OT1me0ooxxg=3D=3D?=
X-Talos-MUID: 9a23:kyXKbAsCFbvXEtwlNM2nqypMBeZG3aCSJW8gvLUan+mtaCF7AmLI
X-IronPort-AV: E=Sophos;i="6.02,243,1688443200"; 
   d="scan'208";a="120907919"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOtHYu5Sl4a6qv55gROCFo2zW/7yay7s8pE4P5M8WpASrMiKaoILtgEjYE7l4zYzluS0MVuVYCzEFamIJvg6Z3YyEmg3rdT4TL2xJKxz+jj+gCkszbI1FE3UcXhTWPyfOWlLFaU7CFiWjktxkG7+358tZyO3IH4u5jrdidPWm40x/uEtHy5AUUO9ng4U5rAG1cM9Xb9CxTbrwDaURAOj9Vxgl0/H26XSchvyIGfvIF9cUHQK1ZTMHRlzLAdnQ8HJJhm+yToyFA5nwHeGLfgbO5kzA1WQqFI39hmDEvv9gSFtiE5Mk1MuwuraL2vTkZ3sZ+xCXLodG8xpmtHb5Psgdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xelWf9d6rI5cqVeQqpNe4QKfNCKLQbSwLeta34xxgx8=;
 b=GGLZTVsybYsLyw8VCvpJObhlq9Rzfgx8Zc34R86x3R2qB3zw0ClcEjljdFGagJzAF8r3C7zufGbprZE19pYs6gwmHrBb95wZhDouDb1Nbu/CnuCUy+nJY2VqSamqldJryK7JAPIYmPNYGLrdPxDcHE6YcfzuGcSrDxmtngKF4XYOWR0tAviVVJz13CJWIu+LEnk00wLXxsuNWrfBoA1oMBhPFPuvwK5Y4cPBlctcdAotL6beaHcygQzz5deIMr/LJEXB45OQ9mAaenhvfUSi1N4T7rAeDj/T3lJdE8gyzCxd/eE1ICgdP1KTVV9UP4WZaE4y+C0ERMdlJiBiHpQ7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xelWf9d6rI5cqVeQqpNe4QKfNCKLQbSwLeta34xxgx8=;
 b=MlUR1inOdxk2fKSjpXloSRYC1+S+zZCmNKiaLaOMJ8/dfEWEwoEHovK+EK5uh1ipyKHyRSKzkXKuL1f9oPxydbOYY/s4j1ZSwgKJ8Bl09cimdw5vdXRLSXwQSWeTrXjlLJTglruXCE6Zl5nEKZ0JCDI1TpGLX2zbxBVwG+Ik0Ys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <eccd7f3e-abf6-2e6d-063f-477ccbdc6b5d@citrix.com>
Date: Mon, 11 Sep 2023 11:52:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1] tools/xentrace/xentrace_format: Add python 3
 compatibility
Content-Language: en-GB
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20230906131616.7681-1-javi.merino@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230906131616.7681-1-javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0333.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 800c16af-7d08-471e-fd92-08dbb2b53d64
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hBjZ5wM02DPaagSBIkiCVOow9TkvqGXeXoMQ/jd2Q2S1rYkSeaiTmxPidvgm+pCWz/z0/Wys4+s2CxCytwR99FHOAozHmORsW3B+AK3Qg9w/6XIndSbd7RjgQrzlYh/nafnQyjC6mSeIEUj5ieAJDuTPThQdjKlICBN9Mdm7t5bekZRRrnD5xcntjrc1LiND3AsCKx65UakBpP5/o7XhV1jRycKfsMLefBCfd+3mheA0NzihaOndy3E1meoTuTl//sYE7QHvzYQDQ5ih2bPNjMuMyhvFiZJFIXUp1s01ZBrhw28I2oNnRc9d5r+d5htYBr3r5mWWKUj0qaSLki1MEN0BLsJY6L9T0AhxSJkXAT1aLtsdxMljbCPwcVQEoCpnsAdHi7yM35ZeTOmbY3Hfji3KKej57tZ+KL6uJZyP/n7JX0RqVkdn2H5X3R5hh1auEeXC9JxGllGLODXo2TmCT20LRxlLY7wPVWi/k1stfrOtY3bqf72oE586AskNxaASlQOKEwCaUh/cIatJxbYCIOl8WpfXrX8nw/8WOFapIyTrErgHTyva+77IfnlUuLYLjO+HmU5GgGHcXTalyN9S2qHbXiCOn//Jycn30vhWuF6rMKNCtlvm36sOHngfqc692/Ot9kGXiwPdd3giniQ4jw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(346002)(39860400002)(366004)(186009)(451199024)(1800799009)(31696002)(107886003)(26005)(86362001)(4744005)(2906002)(6506007)(2616005)(53546011)(6666004)(6486002)(82960400001)(6512007)(38100700002)(478600001)(36756003)(5660300002)(31686004)(8936002)(8676002)(4326008)(316002)(66556008)(66476007)(66946007)(54906003)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFlhN1IxQjBoU0RwQ0drUEg0b2ZlMXRnTFZpL2ZsREdPMEE0QURQMFlhSXdJ?=
 =?utf-8?B?WHo2SENWSWFRM09pa0VXSGlKUHJoR0lpUFRwdUhMTkdWYkdMWnc0cGdLeFQ0?=
 =?utf-8?B?NzBMalU5WGN2STBvaEovUGhnSVNVTTR3Q0g2djErL1ZpYlBOQldUR2MyOWpD?=
 =?utf-8?B?NGJTTW1melY3UFd4NWxoYTJqbWFNNmw2Y1pvYjc3UkUwY0RWVUVMemh2cmsz?=
 =?utf-8?B?YXJoN3NmVWhiWFRtb3lEblk0M2QrMEFNN3VGVU8yam5jTDlxUCt6RFZkaHZS?=
 =?utf-8?B?cldtQWh0WGdBSWRhZ24rVnN0Um1YT1FEUTlPc1hlZHp3dmR0MjdxUzdSOWJa?=
 =?utf-8?B?UUIzMFJuejd5WDZ4eFdOcFZncWJybU1IOFNHaUJpZWx4RWs2cWMwRS83QndN?=
 =?utf-8?B?enNoaVJ5ejZBRWVDY1lKNXdEZmVGamhnYzdKRm5ydGRzYU1FVHYxUzZaNVRB?=
 =?utf-8?B?clk4UGNkd2NBV3NONkREdGswL1I2Y2NHMnR5SG1yREFKL0FmZXhQWDJTVDFJ?=
 =?utf-8?B?MWZHTVMwNW5wR2RYZzY0amlzQ3UzQkpDS2EramJQdXJpVU5TNzJtVVdPVE02?=
 =?utf-8?B?b3oyc1BidUkvellRaUZrOWd0em5mVkp3S0hVRkhnRnB3bDZlaHlIZGJPd3Rs?=
 =?utf-8?B?eFk0REpwd1dLd2RiVlJRZ2xNaXdrV0pCaXFxUkNvSlVSQzJUWlc2b3VKZHc3?=
 =?utf-8?B?aFlYcFNIamFnL0N3RG00T0ptdTkzQWRZMW91K0RGZWlkaEgwZXRyODhIS0Zq?=
 =?utf-8?B?SVgzQ2UvVWwzREk1T1ZPenpNREE5SU5yTmRXSjFNcHJZbjhoc1ZBdUZEalZh?=
 =?utf-8?B?empwNks2MDhYRERueEYyUWF5akVRS0lsOGE1UU1qQWJyR09aMWdIYUYvcWZL?=
 =?utf-8?B?S1ZJRk95eCs1eDdRM0MvWENkZXJWSUQ4Zmd4WUVrWjdFWUNTRHlqaWQ1Q0da?=
 =?utf-8?B?azJVdkJjUFlGbTNFTkpRSUlqR1VEVExCTE01MmxpVnVlNzZoaHJmVmY3cWly?=
 =?utf-8?B?Ylc3WWYwV2p2UTJySkpyc2luK1lMaFRXcXpjMjRxZjNoSzlPeTIxZCtZOXBa?=
 =?utf-8?B?OVpLUzBiQTNZdUVEaXdGK2hVOTRKYnpwUHBBc2hzN3dIYytWd2w2aVVyWFYv?=
 =?utf-8?B?L25aSUR0NFlVNzZKek9SemN0bWpOL2hhUjE3dEoxWVVmZ0sycnpqZnJWSmJh?=
 =?utf-8?B?Mlk5L2RtZnRGcnh5UTlKS1BhNisvM1VsbEV1TjJRUHdkS2phbE5oQm1mRlds?=
 =?utf-8?B?TEZPZE9JWXkrejg2YkU3MUNCcFlaeldsZk4za0wyNlJkKzY5bEppYWZ2VEpm?=
 =?utf-8?B?QXVBMDhKZUhLeTd5cGp1dklPME5XT0R2K05XK2hYTU96TlBBbjlMWnVpN2hn?=
 =?utf-8?B?dEE4YktsL2xmeXdwQkJpbm14TTdUdEtDSERsY3B6SjlsM3JlaWJHcVJSMUZo?=
 =?utf-8?B?M3F3RTlneUlFLzdjZnZRS3B6TVovSnlVOURhYVdXeVJzbFI5TVYyUG16eVho?=
 =?utf-8?B?UUN2NUJRZnVsWm5WakcvZUVnOUV4VFpDSWhoNUZpUjhSSmZ3WWdMcmxNdTBP?=
 =?utf-8?B?N0VsSGpaTHBPRS8zbjd0MUxNdWFoWUpncm0wOVhROE5yREZRTXY2SDQ1TlNM?=
 =?utf-8?B?SndjQVA5Y0dwVmdQSWY5b01Fa3dVNWhsYXIxN3Q5YnJjV0p1amVITEd4ZkhT?=
 =?utf-8?B?NEttN1FxbEtHVGF2V3JWUHZPOWhPMkdmQUJ1T2RsZ253SGlxR1A1RFJzK3Bj?=
 =?utf-8?B?V1k4bW5BYy93NlJGamJGamk3Mnl4d0VFanFkaUVLNDBlMEJqWm5lbDRYZnRk?=
 =?utf-8?B?aVBrK2l0Z2Npd2Q1NUhZcmpvaHpzYm5CamVTTk96eDBFNklJTGdkcFlHU1Jo?=
 =?utf-8?B?QUk3dTBVRUJ3QmxFYXloVkt1SlhMcTdYb1hpa0Y4VzFSbzRxN0FyVFlNOElS?=
 =?utf-8?B?MTdvZUdCZi81LzBqQ3htR3AzZmMzbDU2QUFJbmdDSk1IZFhpcURHTFF2WGxn?=
 =?utf-8?B?dGs1UEQxamROUkxYTDB2V0UyZDdneTR5N2QvVkh2czFSVkxiY0gwV1dIN2o5?=
 =?utf-8?B?cjRUblZEQWZpVklUa0hiK3pUTzZWNnlBTVB4R2RTUGhZeUEreVpFVStVejFh?=
 =?utf-8?B?T1RFckFxcHBzU29DQTc3RytTdjJMVGppUS9VNUlQVlZqRHpRbEFxY1dTTkJ3?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dKaH+TroXK83qzuKDIcE4UinjpMOueMsGHaQIeAJP3ZBGkBTqGZycip0wo7cvc9kWxDW5IR7FHtttK7QMjoj+vJfwL4ZZbnshj2FzXuDkBdxDCG4SYZ4IKrhT3DNu3I5UQyYatpqgGH1TTZIYyr2FU5uRDHmuM9AvGMR2HDd9kFDidxVrSMq2i56SU8F3sS2+JtIQlC/OIBj+qA3s5/4wToQUUFmR1ZS0mxXGZg6lv1KBL8VJMAsnRwM355W9LlvVNNMn8aLmKlqwgYduaAqF7/oD69Po0GvRaPRFZ0oUuC+e/p8w4ime/gc+2rPtcNuwObakkX9ZnwxktmqvMmnPqszT6/f9JX8XdVmiB0V0it6x3I/naNyucAAEMcDMb8CroLmDvfLsdeGHGQ6m73S5ylIlnNqR03RR/2Uv3UGaAn7yXqYsvfy8d2TasPHJP8o4rmq52KrSrq6He43fRb8yWlZdtDJnMb7Eq8gV9ODZapHAYJ74C0/84OduRU0afXSMlxC4faT85/2EX85tIDrjBe2CFYARrOTQ31E5MipZZ8TZzvbSrtPRz1iFfA00eG5r05jB6mF3HR6kyhJSSPLuH35KiLtePWd4j22i6m6L7hssV33aQBdxMnQvUTX3SqIgTV0JVwoBRNiqDAjCAT4XpyUM5d2IOrnrbdVahVuktA6k73lOTP0K8wpC+9A01YkJbAyM7NC7ahYW/z1YLCkXl89UmVDMsvg+X2WhYl8/3nx4yQatd0qnw0bQ+LOYFIlRrm59kKMd8XJPRNUjZuJiAaGkU7dqo2WElOURuqYZY9gH+4TWpydMeyb8h5YCzek2HLauVFkBvf5deTsAAD9mA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 800c16af-7d08-471e-fd92-08dbb2b53d64
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 10:52:49.5621
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MY7fjreUQOGlP6w5KRJmZdRcZeiLjg50VtROYK7/yNrWH4BGtAWDtmdinth79zQNOO/ksKD/AQ5np0OgTnCy0f4qctqek6LUHdubqA75KKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5983

On 06/09/2023 2:14 pm, Javi Merino wrote:
> diff --git a/tools/xentrace/xentrace_format b/tools/xentrace/xentrace_format
> index 5ff85ae2e8..166ebae325 100644
> --- a/tools/xentrace/xentrace_format
> +++ b/tools/xentrace/xentrace_format
> @@ -4,11 +4,15 @@
>  
>  # Program for reformatting trace buffer output according to user-supplied rules
>  
> +from __future__ import division
> +from __future__ import print_function
> +from __future__ import unicode_literals
> +from builtins import str
> +from past.utils import old_div

This adds a new dependency on a package we (upstream Xen) don't
currently use.  AFAICT, it's only for...

> @@ -223,7 +232,7 @@ while not interrupted:
>              last_tsc[cpu] = tsc
>  
>          if mhz:
> -            tsc = tsc / (mhz*1000000.0)
> +            tsc = old_div(tsc, (mhz*1000000.0))

... this, which is always int / float and doesn't fall into Py2's
int/int behaviour in the first place.

I'm pretty sure the code can just stay as it is, without needing to use
old_div().

~Andrew

