Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426E33AE5B1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 11:12:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145401.267529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFyE-0001bD-ST; Mon, 21 Jun 2021 09:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145401.267529; Mon, 21 Jun 2021 09:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFyE-0001ZO-PP; Mon, 21 Jun 2021 09:11:54 +0000
Received: by outflank-mailman (input) for mailman id 145401;
 Mon, 21 Jun 2021 09:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvFyE-0001ZI-49
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 09:11:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.41]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e9e8742-e1f8-4dcc-8c69-2a869a513f7b;
 Mon, 21 Jun 2021 09:11:52 +0000 (UTC)
Received: from AM5PR0402CA0016.eurprd04.prod.outlook.com
 (2603:10a6:203:90::26) by AM5PR0802MB2386.eurprd08.prod.outlook.com
 (2603:10a6:203:9b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:11:45 +0000
Received: from AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::c5) by AM5PR0402CA0016.outlook.office365.com
 (2603:10a6:203:90::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Mon, 21 Jun 2021 09:11:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT012.mail.protection.outlook.com (10.152.16.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:11:44 +0000
Received: ("Tessian outbound 41e46b2c3cec:v96");
 Mon, 21 Jun 2021 09:11:43 +0000
Received: from 1c68c5b02afe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D5723455-03F0-4231-B1E7-36484E43BEAF.1; 
 Mon, 21 Jun 2021 09:11:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c68c5b02afe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 09:11:05 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5625.eurprd08.prod.outlook.com (2603:10a6:102:89::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:11:04 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:11:04 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP123CA0013.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18 via Frontend Transport; Mon, 21 Jun 2021 09:11:03 +0000
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
X-Inumbo-ID: 7e9e8742-e1f8-4dcc-8c69-2a869a513f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0S+LDj98BFOC45O6LsSQdEu3H3PdBd/n+fCFIcB5lA=;
 b=JMs8gUdYordMhYJSzeWj6f3ZsJ+FMdBkaHpUIDxwCSePmhi7rt5TduKaSYvM7LUuBVI/1XYR4mf3m2EXUtj7h3mtvivPTOwitSArLmhISVT5PF+OIg7hHIMB8hQWOVH/Y1kENK6GsyOhwkWsbJit3oldz6Ds1HANO6Uwk4D9K5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b45c6c42ae8a2686
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbQIy6WEYuLcfk59NGBdTIsDw64Dkabu91ra75Sp/PqvkMnZbA0F0xDaIDVgBeieSU11pYFuupt5qmLpGHOoBTbteIprF/YdWzdFtjFj9DwOl1c900zAQ3oTQQrRqvhqPxIdZHV3xrdhasJ0paoLjGYIY/Div2OGJ2wFuKfgJG19tsxMRDHBkLaSg84zEJjXHfFL1extLl56p6cs+XWagIiwkG/LknfpIBL4caVIVJhAIfpyxydfBrULV6AQ+9vaUrm517JTLlPyCTU/AhDh1SzLVNP1J5eFGiwAX5tubn1mA2p/NoPDQ7NcKvxAKi1pADf3l5Omi0j3FH/Q9Htc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0S+LDj98BFOC45O6LsSQdEu3H3PdBd/n+fCFIcB5lA=;
 b=kbdwogkorj3E4yeOzIakV3KsrMrG+JDKbcRFZElNr5MBoa3utZQIxmVILefyFceQ4jZmIlsuP73MG8YAoxFWmxVxg8YbpyFrN3nK00ZD0cENhRc10Y12hvP8ojHKw95Pq/O5ENg/AD4MESFLeHDNFP36nNq1alO3H45vbGGMtbb6jtpLVhz8tmlE9kYSHBmSOXEGTeAXYsbS9oe4afXcDWQANvPKjxRgT59dNWjo7f4Psokzu585Oepf8u5ayTZvlShQWPOYueqssgSQ4h/RhKO3UUVL9x2lfueiCPqkyRLOEuged9xOKSVIWISmalAYTX0VKI5S2dliZYHaU8UF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0S+LDj98BFOC45O6LsSQdEu3H3PdBd/n+fCFIcB5lA=;
 b=JMs8gUdYordMhYJSzeWj6f3ZsJ+FMdBkaHpUIDxwCSePmhi7rt5TduKaSYvM7LUuBVI/1XYR4mf3m2EXUtj7h3mtvivPTOwitSArLmhISVT5PF+OIg7hHIMB8hQWOVH/Y1kENK6GsyOhwkWsbJit3oldz6Ds1HANO6Uwk4D9K5k=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 06/10] tools/xenstored: Introduce a wrapper for
 conn->funcs->can_{read, write}
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-7-julien@xen.org>
Date: Mon, 21 Jun 2021 10:10:58 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <73401908-D406-4ED8-93FA-C0A0911651BF@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-7-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LNXP123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::25) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2065cfa-33a2-4738-57c8-08d93494972f
X-MS-TrafficTypeDiagnostic: PR3PR08MB5625:|AM5PR0802MB2386:
X-Microsoft-Antispam-PRVS:
	<AM5PR0802MB23869EB955249D955F25B26CE40A9@AM5PR0802MB2386.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hZmF8KDRGEdy97RZJTz/LXLMddt1Z6faKr0Dy3c7IJTU+Be1INI0HW7zz2tqloo7pXidQUi40Wr+ge+YEJRLh3/5nzRDyTYWBvSlivNUgMiYvtzrVK0x8s8U8ufBj9KWCE6syFSeuduUEnbSoqlIURaPJFhxMOd14VdATrl2wK3k4K3jo8rpeuWS1Z0ZMdOnTqQ2BHKMYHeEyYom9Wrfs03G0TKrFhTEK2i/+hIDbsVVYV3+8EEwvyDq4xs50pmhj0+cODduuy/I+4Xm5zHjuoQNPYIQ35REX6qxnkG1fspRlSRuiLuAIKiC5wiDxD4flIEensfMxK8NYgn3Fv87lNffZOHN9ZIhsFrFHRxtKhE3D2pbU2pavVFKzJGmLY9t9sQSU4NmcCZHFpGNj556YfaJwRdiOmsG8KnJ0CgdyN1aWhxy+y1RcNjA9J+vbJGU6QBNuGDjUO5NsdydGMpMvAlLZGUgyih++Ikg/HppPsDAKaJHWcN4SBGvYfK8G07/n6qfXrgOEaRibcZc4c3wteT0n7uBSFJEaSOycjgWtkurrT6gmssY23UsEOS41A/SIUT9zizpBWOfh+x8y013bru33BXDKp4hvomgXFPJIDla0RD0YQccN5vgx3yHnt8dcFnEV0A+GuCKAJd4pusdIXwEjjrZbLIxqVell9Q2J26VvRGjag+x07fR2AWCT3+e
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(86362001)(54906003)(66476007)(2906002)(8936002)(66556008)(2616005)(33656002)(53546011)(316002)(6506007)(956004)(52116002)(6666004)(6512007)(36756003)(66946007)(26005)(38350700002)(8676002)(5660300002)(44832011)(478600001)(6486002)(16526019)(186003)(6916009)(4326008)(83380400001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?DzH9BEKIRfrDnPLpCvBbVi0k/E7ZoYuhwR3Hwzbgqkfwb2I45hmONkxdF07M?=
 =?us-ascii?Q?SsrbxxGAmR2Ro8VWf+YbSJSoxXamYkK/EteT1EcWjtR+1Y5LiGje1mwfVUeY?=
 =?us-ascii?Q?Jqsly8RJjAoCual45KQk+psIu5NJHvLYcmAxtAeK0WqqMbvr33XrNV0tHshA?=
 =?us-ascii?Q?hHZTxO6QIeD5tFcINRhd8o+kVIA4L3Yxglp+ywgqdJnkoEN+dvjFG3/iSxUs?=
 =?us-ascii?Q?JNN5M9c1a4EEell0gS3uS6TXGHTIHpImbZeObdm+9wIxlXLRD+tDxJFHTiBo?=
 =?us-ascii?Q?EcHPkX9oh0HzXCWTV+rtt80ySFov3EdPNq2jksIjh0ETGjIAtjkfg1L1F+dI?=
 =?us-ascii?Q?agS+ana4LHHkdBJlkPDOH2G5MthhmGbFsZVwIfnoS0cTxPoh4iTHzhsAeKNj?=
 =?us-ascii?Q?JmEqtktAX/O4o49NyBXGagHEnmFylB6uAqE6gnR098AJ1rViD0ghN9XSbUmH?=
 =?us-ascii?Q?vzDT5uUN3vkZrSGB/6axvvZrITrRFvnAXBNdY23XBrxs2eU1Y/7UQnMuZsRR?=
 =?us-ascii?Q?Iu9G1zWPqbRHvVlG9gFtr7qt4aGU8VZuxJedzz9WVB5zzsQMhvLjlecvB4M/?=
 =?us-ascii?Q?eVXjEXGi/wbkxd+fWSwn6pE2LHwfXKu3wiouknHJUGavv69qeXiTj19gUP/3?=
 =?us-ascii?Q?m1zA/PonR1LI/k+WMn2CXp+Yy16ra5LCLeh7wcmAkFen0skHGlAGYyAVNiLe?=
 =?us-ascii?Q?TuGpjVA4OVqZKvP7GMd/cJUiqm4EeCeSlBol6TZm4Y7pPoe2EgCY1pSj3siE?=
 =?us-ascii?Q?a+/SUVt/sJyHOcnWFINUnv17NuAk2zCNS2BgU6b2PBhApDCIUClY5sFgfGmS?=
 =?us-ascii?Q?USKVHsSirJEnGW8Yelk45lrCdp0pYwnavkTaDskockeJrK/YSUMO3avCqQif?=
 =?us-ascii?Q?c6ZclGkc39DKTaFmevQPbMngqS3BOyxt9nWUCBupPF0+Ii3/DfND48ohfesK?=
 =?us-ascii?Q?zA1sbj7Li2ZBoaCJ8g9tT0Xu8aSku4/5sxe+hs/yBvZGGPitBlv7tTiOLxz8?=
 =?us-ascii?Q?dv5xMfXRXUTv2ZovjunOF66G0r3tRFaEoBBs2JvIMssQCA8ec6Nm9yHP3Rdl?=
 =?us-ascii?Q?hFpP+9bgdKM5x8FEwx/8bvu/bnhFi7ydk7Rs559OAG6GjsMLRd4Vwjm4RBLJ?=
 =?us-ascii?Q?kZbFqcb7NI4EPrHmPM9b2BS/VvP90cXRBzd8bFanDyF+FSEJUP5hvBpFQAJC?=
 =?us-ascii?Q?VUORiS387sea75siILCueXLi/4aEKBdBBQNk4DAWffZWklpbnwnYmYvh6Nmx?=
 =?us-ascii?Q?a6qIjZGXFoglPyPXjV1M9DOvUCgyO1fFDoqDHvKRcD1TsZGXk1ikeSNbIlxN?=
 =?us-ascii?Q?Wi7cIQ1Kxf1j+QU2qU6KeHSL?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5625
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	501a4c6e-9c06-45cc-1341-08d934947f23
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2TgeC4QP7Pspx7+WgRQn5Qzszvkd/VPtxdxn+fVhQ2YOT7sTEmUtBBt4wCDXAm8k5SHW8vWEr0/8MW5ihM6TftzKpB2nxe5vUHttX8EsxDKgqJUCh9Ghr9BnULZ3aniO6yxo3SRIdhXs1moTyAZDLCSS1ZZ2MkLG+YhhLKW8jHxZVVL4K2Yhe8/Aax+t0QIcpcYaSyE2Fc2MznxW8BE9a/VHz2lkvsIIg4IOQ1x19JHp3MQDTmc5fbEDsaXQBDk1plLeW8uyHqW/q10s4jDSWjpuiJwvsq/PjDKkErI/EGgkzcFLAdNpCkwQXI6ynTZFcaj1rxLrg7/b5X2dJEQJjWaVDpV7U4IGjmffMUczCq/UvzxffM5gqq5R2pd647sJVfDfFPfKoz3ByQBQnDPPcWIHDFxyjL2JGog343GsNgEsVrlxF43W1Z4FIm7nwVq86hlSXYTQgxBITSH/6D74ccpQ57ALilfGONnWQmCTs0VtZSQ+pDoh7HHdA3KhD1bRiG1TJQPIMqtyBSoSsew9ExIy9FUpQuw0U+wcXXtA017YFc5FGsr+ha88UOxceXsMMVzz2ek2i0HsSKVWKKxVcZqCW67KEUqYTBqH1IsUZjWHQhfkh5xUlDGCLdfdNUbISxAOV+OumqUkLU28tqAks6v64nDbg5dV+k/EBMj4fm4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(53546011)(6506007)(336012)(82310400003)(36860700001)(316002)(107886003)(478600001)(956004)(2616005)(44832011)(8676002)(54906003)(6512007)(70206006)(70586007)(6486002)(26005)(6862004)(81166007)(2906002)(47076005)(82740400003)(33656002)(5660300002)(16526019)(186003)(4326008)(83380400001)(356005)(6666004)(36756003)(86362001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:11:44.5142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2065cfa-33a2-4738-57c8-08d93494972f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2386



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, the callbacks can_read and can_write are called directly. This
> doesn't allow us to add generic check and therefore requires duplication.
>=20
> At the moment, one check that could benefit to be common is whether the
> connection should ignored. The position is slightly different between
> domain and socket because for the latter we want to check the state of
> the file descriptor first.
>=20
> In follow-up patches, there will be more potential generic checks.
>=20
> This patch provides wrappers to read/write a connection and move
> the check ->is_ignored after the callback for everyone.
>=20
> This also requires to replace the direct call to domain_can_read()
> and domain_can_write() with the new wrapper. At the same time,
> both functions can now be static. Note that the implementations need
> to be moved earlier in the file xenstored_domain.c to avoid
> declaring the prototype.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> tools/xenstore/xenstored_core.c   | 18 ++++++++++----
> tools/xenstore/xenstored_domain.c | 40 +++++++++++++------------------
> tools/xenstore/xenstored_domain.h |  4 ----
> 3 files changed, 31 insertions(+), 31 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_c=
ore.c
> index 51d210828922..2e5760fe4599 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -334,6 +334,16 @@ static int destroy_conn(void *_conn)
> 	return 0;
> }
>=20
> +static bool conn_can_read(struct connection *conn)
> +{
> +	return conn->funcs->can_read(conn) && !conn->is_ignored;
> +}
> +
> +static bool conn_can_write(struct connection *conn)
> +{
> +	return conn->funcs->can_write(conn) && !conn->is_ignored;
> +}
> +
> /* This function returns index inside the array if succeed, -1 if fail */
> static int set_fd(int fd, short events)
> {
> @@ -396,8 +406,8 @@ static void initialize_fds(int *p_sock_pollfd_idx, in=
t *ptimeout)
> 	list_for_each_entry(conn, &connections, list) {
> 		if (conn->domain) {
> 			wrl_check_timeout(conn->domain, now, ptimeout);
> -			if (domain_can_read(conn) ||
> -			    (domain_can_write(conn) &&
> +			if (conn_can_read(conn) ||
> +			    (conn_can_write(conn) &&
> 			     !list_empty(&conn->out_list)))
> 				*ptimeout =3D 0;
> 		} else {
> @@ -2325,14 +2335,14 @@ int main(int argc, char *argv[])
> 			if (&next->list !=3D &connections)
> 				talloc_increase_ref_count(next);
>=20
> -			if (conn->funcs->can_read(conn))
> +			if (conn_can_read(conn))
> 				handle_input(conn);
> 			if (talloc_free(conn) =3D=3D 0)
> 				continue;
>=20
> 			talloc_increase_ref_count(conn);
>=20
> -			if (conn->funcs->can_write(conn))
> +			if (conn_can_write(conn))
> 				handle_output(conn);
> 			if (talloc_free(conn) =3D=3D 0)
> 				continue;
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored=
_domain.c
> index 6d8d29cbe41c..47e9107c144e 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -172,6 +172,23 @@ static int readchn(struct connection *conn, void *da=
ta, unsigned int len)
> 	return len;
> }
>=20
> +static bool domain_can_write(struct connection *conn)
> +{
> +	struct xenstore_domain_interface *intf =3D conn->domain->interface;
> +
> +	return ((intf->rsp_prod - intf->rsp_cons) !=3D XENSTORE_RING_SIZE);
> +}
> +
> +static bool domain_can_read(struct connection *conn)
> +{
> +	struct xenstore_domain_interface *intf =3D conn->domain->interface;
> +
> +	if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
> +		return false;
> +
> +	return (intf->req_cons !=3D intf->req_prod);
> +}
> +
> static const struct interface_funcs domain_funcs =3D {
> 	.write =3D writechn,
> 	.read =3D readchn,
> @@ -290,19 +307,6 @@ void handle_event(void)
> 		barf_perror("Failed to write to event fd");
> }
>=20
> -bool domain_can_read(struct connection *conn)
> -{
> -	struct xenstore_domain_interface *intf =3D conn->domain->interface;
> -
> -	if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
> -		return false;
> -
> -	if (conn->is_ignored)
> -		return false;
> -
> -	return (intf->req_cons !=3D intf->req_prod);
> -}
> -
> static bool domid_is_unprivileged(unsigned int domid)
> {
> 	return domid !=3D 0 && domid !=3D priv_domid;
> @@ -314,16 +318,6 @@ bool domain_is_unprivileged(struct connection *conn)
> 	       domid_is_unprivileged(conn->domain->domid);
> }
>=20
> -bool domain_can_write(struct connection *conn)
> -{
> -	struct xenstore_domain_interface *intf =3D conn->domain->interface;
> -
> -	if (conn->is_ignored)
> -		return false;
> -
> -	return ((intf->rsp_prod - intf->rsp_cons) !=3D XENSTORE_RING_SIZE);
> -}
> -
> static char *talloc_domain_path(void *context, unsigned int domid)
> {
> 	return talloc_asprintf(context, "/local/domain/%u", domid);
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored=
_domain.h
> index 62ee471ea6aa..1e929b8f8c6f 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -51,10 +51,6 @@ void domain_deinit(void);
> /* Returns the implicit path of a connection (only domains have this) */
> const char *get_implicit_path(const struct connection *conn);
>=20
> -/* Can connection attached to domain read/write. */
> -bool domain_can_read(struct connection *conn);
> -bool domain_can_write(struct connection *conn);
> -
> bool domain_is_unprivileged(struct connection *conn);
>=20
> /* Remove node permissions for no longer existing domains. */
> --=20
> 2.17.1
>=20
>=20


