Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B115D6058EF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 09:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426243.674557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQFA-0000Vd-Th; Thu, 20 Oct 2022 07:45:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426243.674557; Thu, 20 Oct 2022 07:45:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olQFA-0000T3-PK; Thu, 20 Oct 2022 07:45:32 +0000
Received: by outflank-mailman (input) for mailman id 426243;
 Thu, 20 Oct 2022 07:45:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvbq=2V=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1olQF9-0000Sx-K5
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 07:45:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb0d336-504b-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 09:45:30 +0200 (CEST)
Received: from AS8PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:313::16)
 by AM0PR08MB5425.eurprd08.prod.outlook.com (2603:10a6:208:17d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 20 Oct
 2022 07:45:25 +0000
Received: from VI1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::a4) by AS8PR04CA0071.outlook.office365.com
 (2603:10a6:20b:313::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26 via Frontend
 Transport; Thu, 20 Oct 2022 07:45:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT053.mail.protection.outlook.com (100.127.144.132) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 07:45:24 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Thu, 20 Oct 2022 07:45:24 +0000
Received: from 02c7f9d7cb5a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C5C87A2F-37C4-49AB-8467-DB02F08208D4.1; 
 Thu, 20 Oct 2022 07:45:18 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02c7f9d7cb5a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 07:45:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5665.eurprd08.prod.outlook.com (2603:10a6:20b:1da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 07:45:17 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::a8c6:cf12:7155:de53%7]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 07:45:15 +0000
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
X-Inumbo-ID: 2bb0d336-504b-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XNsW2v1v9PTkpX7rMysTQymiQZTXy78X4Y2rTlxinvGbJ3FkDaZKuN5eTIMKX02uGN+CC8wVtT2MVFQwEkORmR9OlgFuziO1etWn2SlmnEQMIBMnTKgjHWmwRegKFik6rm5W8ART+WbsexT01U3vJb9BjO0MBUMU8gzS9TJNheKUVTmiOiPtfGOeOLXxIumF4AKv1mHB2Qz32shKr9O1Na8m3d89K6SybGtz8GfXCZ1UUlR3YM50RBun5S79cfWSP1w4n2cJ23Yuyp5IXZXS75EeF4dSfehy+0ZcH5JXLAZaf6XR5OZkdwsWUDlcZO6U8b8Nvq3B8ucfAt27/KUTeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pakc4jwgdwAmapOlRtJkMWGKWBnO41Nij/FL96uvn18=;
 b=NwwpffyN5TEgSpsDsHTBGfTN0djJtf9Rhk3TulOKCsE3/aeeudT7/hp8MMVf0G/gLrZcSJZn6tejY2dIRE7tRhnJ5EISwsWiDXIwAwAtr93xjb4rIMwvfUsBhkZaLDBG6OmJDV60HgqX6Sc2EcQFlwfRRWvaZMyKL3i/7mNMzrorju9mTSunpSY9agbf4y+9FDFp3T7a4FbbCwKGrVOR1IMpqw/X2p1XGmKLQToQF1AGGa2hY/VO1NFCiLMAC04kl4ZYYoOo073FJHRMW64HbDAlTcNJ+ycfdltoIeItZHSLtnUY5wbWeNiTIXauNmsZQiSEqb130L2SEP7vaGz3Cg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pakc4jwgdwAmapOlRtJkMWGKWBnO41Nij/FL96uvn18=;
 b=z8kBFDITuKjrXvcbQ1JxWC68PmAzTem7fQBzotc3ANwmANJE4q9ZU0kWqGeF6W/3ira32hvLqm/VolgVVwNFqn256wTYDzq1WUsgAuidNnxBw9GHUMZl6uwdSOgHMz4AKDSOthu7dfYweHruNQQyWDEpSs5b/f/aZMtoW107DNI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e765eca24e2a4053
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNwx7000mYo9GhqIyXLOcAWnaUmmvXTpVTtoos3TDkXAkr/QAHzJGNRrZkZO1kGjen1lGqDE5sxJw+WZ0sDhwBF+l+YyskK6PlRSsinoHPLhiVNvpwUV3OwUQdPdriX6xW1DK71fQZ7BzuX69ksDyetlknmx31mpc5NsCEp7yKiqJvAMDNPRaV1iwwYlNklq9fm0V7Uj1vrvXBsjpxzlctC7LS4yRa19BTGjypKoy56tKSLAq2k06uBaU767w+v2Ggdvfsqo5Aehp6dFeQVstYcWsXE4MyXeoWRldZULZn10pTQu/S42MHVm0QFayTykAfFFcu7Bc/Sggq2/YdvGFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pakc4jwgdwAmapOlRtJkMWGKWBnO41Nij/FL96uvn18=;
 b=ms3m+/nA2l89hz4YODGUIvJbz41XAsU8Q9bwAmPqFG6Fa4kRhqNl08qiDgcgPbjS2kE32GrNiywkWRL+a9mRcBY3s67Kv8wWlTlCwHTTAlT5n8NWeNQ4+IPqYe1tO+Mvnsi85gKgtD9WoUiJS4vMlqwbpljuOwP3ium18JmV/ZKBSHEUppTn9PtrASolNAhwRYAkLsGZp5G+vtuSUrFTLiAylv+Q9V79fpSst3Y3DcfE7B0SznpcE24GMwpXRK4VN2+qXW+XMxQD7D8nVcZhkqgRvkVjfiyptbmO9RbXWfqk2YYiZkNjZJS8RC0Cf/wxpHYd9oaR1/7p3agcf6iQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pakc4jwgdwAmapOlRtJkMWGKWBnO41Nij/FL96uvn18=;
 b=z8kBFDITuKjrXvcbQ1JxWC68PmAzTem7fQBzotc3ANwmANJE4q9ZU0kWqGeF6W/3ira32hvLqm/VolgVVwNFqn256wTYDzq1WUsgAuidNnxBw9GHUMZl6uwdSOgHMz4AKDSOthu7dfYweHruNQQyWDEpSs5b/f/aZMtoW107DNI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Andrew Cooper <Andrew.Cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Henry Wang <Henry.Wang@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY4lyDZWCrsBxeFk+1cow2xbojCa4TC2qAgAAU4ACAABPHgIADC1WAgAARXoCAAJpKAA==
Date: Thu, 20 Oct 2022 07:45:15 +0000
Message-ID: <B9C56976-BBC7-4A0B-9D9E-E26492FDA446@arm.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-3-andrew.cooper3@citrix.com>
 <0456d318-731f-8df7-297c-19ecde06ed96@xen.org>
 <cadcee69-e51b-99af-78c3-ab4a0e2e42d9@citrix.com>
 <5587f5bd-1694-a843-9e80-ad477527a576@xen.org>
 <dffdc951-91fd-2659-ec7f-5c213138d785@citrix.com>
 <f200534c-c001-3ec0-7e05-cdbb76f456e3@xen.org>
In-Reply-To: <f200534c-c001-3ec0-7e05-cdbb76f456e3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB5665:EE_|VI1EUR03FT053:EE_|AM0PR08MB5425:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f1eb0e-56dc-4343-d74b-08dab26f0cbc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jrEn6HO1y3Wx286us77T2kB0TzNJKotp5E3DWUMhtaFl1DifjZnufG4qnHTuKT/j32Ze71kZRmCUa3300FUtNTg+o8Z0c9zaNU6C26ToCBA3jfnzhaM1bC079cVWUMMzYY6rjR6qcNz8tt55iPYAogwHP5CYKt4sfctFwW06BWP6y/O7L+h1k/qEKkwKB4kAS+yPAxEpY9oBcbw9LCQFJlpThCXagZzb0RGcCjQz4Wzhb72qrfy76lazIiERwZ07+WsCGdoc+fNRB8mgZBgk9AiCDuKwx0Va9EQrYqka0di2nXta3UPTlRhzV8mAsnZf3kPToxdM7cAbTKgtH6zAt8frBiGPkouUnXBWvsA1uWoQ6372Q6dTxj3FZapbk/xGzM2l+CCWVStCTDf2swjFHmMeDvv+XV0D767jBRxErTpUoHLFArs8KwuMyNF1EDpiM+ZzCYfqj2/1iks3tE2zuk0+4UbiPkQi3AxKVXp3D3gI/w8YMmiSa3PeG7Y3tUlvcimEAOKJl7lirMu+pqdHHlu8eqw8+heSd8JPHj2twcjbWYnsjBiTBcrp92oY421LoVlrvFdahfT7QGvFQuqwIoOoSMNdslgzrXk+Yuz48UpRFga3LvWCWMqBOIewPB78R/5pnIh1lZ1mLcmcmjPQZYyDj46gPpt+TsZY0LKQpTunW98jwi3/vJgtthD0fY6B2e4cQmxmP/V1/wSOEAnBAbQ4dkHAg3xX3nW6cV5MtqW/f2CizdCoHWKtBJTvK18Z4/B5HrbURcYumgD7J2eRBY9vPM3YhOWt9nBGzhOPstI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(36756003)(86362001)(33656002)(122000001)(66476007)(41300700001)(66556008)(38100700002)(66446008)(66946007)(2616005)(38070700005)(83380400001)(64756008)(6506007)(186003)(478600001)(5660300002)(53546011)(2906002)(6916009)(316002)(76116006)(91956017)(8676002)(4326008)(8936002)(6486002)(26005)(71200400001)(54906003)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E3E28CCFC75AC34181A0F479690F603B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5665
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	924ffcd8-b143-41f7-23e2-08dab26f06eb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cX6evrQ2aWU28U05S2tYMGOHT40V6y5/IXYWPXuH50jPzJuEP9TOA5yU4IP78HE48fHpzqmlVnLa3FUp+tjt3C8FfBEkGhWNJrPegQzNSG/ilHI6g/deyXi50esF/w4bKi0XWyNvDvAHi2NoQpI5yjQHf3roAiV3+yX3cZiT/GbB5JILCryAyvuc9mLDJTdrarF8ME0TmNBGlWspCXv1Zpn3w6hzWAO9yjYgY7XjzeEn7m46ol+gmqszmxh1agdLX9mtPlUsIs1Tven022L+c7koP+ITAPWTrPXRN6H7gGQch5F+NYj4eudkGaEtekUBg8fL9TvNdZQr0Cp1lQ4AUKIZIA7ppsMwNM/VDWnePv9Usq/gzbrwgpUAOmNP006LajcR+buba3JU2B5GJBMPJcs5spMEcw40SmdYRYUlasonJ00V4DHlpmtg2qm4Am6gJ/pAOw7dZjgtHSxcrtO0ZV1avF1HDGzS7D+yurlt2CszfGo0XZrdSA5/vseidiDjUgUWeDD0Y6voxmrLdViML4XNnGnmJJzKiwWZTx3+uBbXBjisuFitmhY8MYJsU0HIX15nv6mPK831/U4UyWlJ+sjLeZ+JV7nN7X9qUJFutF6Eeap67kRBp457Jb6ZM2BBulyr0zZUAtRcccgZg5lNxCCXeq+wElDncDphlagu+hbqgfVVNk2/tRxCzAbxvRhT8azdQTnRr9OXycUD8N2TcjSW3XJXxnSo9e3t2X/al+Eve7tZ5oTiqU/k8niTLXfPeU/13JJZLnp+isSPKCrHbw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(2616005)(356005)(186003)(70206006)(26005)(81166007)(336012)(86362001)(36860700001)(54906003)(47076005)(5660300002)(82740400003)(4326008)(40480700001)(8936002)(107886003)(6862004)(36756003)(53546011)(40460700003)(6506007)(6512007)(82310400005)(478600001)(70586007)(6486002)(316002)(41300700001)(8676002)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 07:45:24.9756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f1eb0e-56dc-4343-d74b-08dab26f0cbc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5425

SGkgSnVsaWVuLA0KDQo+IE9uIDE5IE9jdCAyMDIyLCBhdCAyMzozMywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBBbmRyZXcsDQo+IA0KPiBPbiAxOS8xMC8y
MDIyIDIyOjMwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMTgvMTAvMjAyMiAwMDowMSwg
SnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gLi4uIHlvdSBhcmUgaGFyZGNvZGluZyBib3RoIHAy
bV90ZWFyZG93bigpIGFuZCBwMm1fc2V0X2FsbG9jYXRpb24oKS4NCj4+Pj4+IElNTyB0aGlzIGlz
IG5vdCBhbiBpbXByb3ZlbWVudCBhdCBhbGwuIEl0IGlzIGp1c3QgbWFraW5nIHRoZSBjb2RlIG1v
cmUNCj4+Pj4+IGNvbXBsZXggdGhhbiBuZWNlc3NhcnkgYW5kIGxhY2sgYWxsIHRoZSBleHBsYW5h
dGlvbiBvbiB0aGUgYXNzdW1wdGlvbnMuDQo+Pj4+PiANCj4+Pj4+IFNvIHdoaWxlIEkgYW0gZmlu
ZSB3aXRoIHlvdXIgcGF0Y2ggIzEgKGFscmVhZHkgcmV2aWV3ZWQgaXQpLCB0aGVyZSBpcw0KPj4+
Pj4gYSBiZXR0ZXIgcGF0Y2ggZnJvbSBIZW5yeSBvbiB0aGUgTUwuIFNvIHdlIHNob3VsZCB0YWtl
IGhpcyAocmViYXNlZCkNCj4+Pj4+IGluc3RlYWQgb2YgeW91cnMuDQo+Pj4+IA0KPj4+PiBJZiBi
eSBiZXR0ZXIsIHlvdSBtZWFuIHNvbWV0aGluZyB0aGF0IHN0aWxsIGhhcyBlcnJvcnMsIHRoZW4g
c3VyZS4NCj4+Pj4gDQo+Pj4+IFRoZXJlJ3MgYSByZWFsbHkgZ29vZCByZWFzb24gd2h5IHlvdSBj
YW5ub3Qgc2FmZWx5IHJlcHVycG9zZQ0KPj4+PiBwMm1fdGVhcmRvd24oKS4gIEl0J3Mgd3JpdHRl
biBleHBlY3RpbmcgYSBmdWxseSBjb25zdHJ1Y3RlZCBkb21haW4gLQ0KPj4+PiB3aGljaCBpcyBm
aW5lIGJlY2F1c2UgdGhhdCdzIGhvdyBpdCBpcyB1c2VkLiAgSXQgZG9lc24ndCBjb3BlIHNhZmVs
eQ0KPj4+PiB3aXRoIGFuIHBhcnRpYWxseSBjb25zdHJ1Y3RlZCBkb21haW4uDQo+Pj4gDQo+Pj4g
SXQgaXMgbm90IDEwMCUgY2xlYXIgd2hhdCBpcyB0aGUgaXNzdWUgeW91IGFyZSByZWZlcnJpbmcg
dG8gYXMgdGhlDQo+Pj4gVk1JRCBpcyB2YWxpZCBhdCB0aGlzIHBvaW50LiBTbyB3aGF0IHBhcnQg
d291bGQgYmUgd3Jvbmc/DQo+PiBGYWxsaW5nIG92ZXIgYSBiYWQgcm9vdCBwb2ludGVyIGZyb20g
YW4gZWFybHkgY29uc3RydWN0aW9uIGV4aXQuDQo+IA0KPiBZb3UgaGF2ZSBiZWVuIG1lbnRpb25p
bmcgdGhhdCBzZXZlcmFsIHRpbWUgbm93IGJ1dCBJIGNhbid0IHNlZSBob3cgdGhpcw0KPiBjYW4g
aGFwcGVuLiBJZiB5b3UgbG9vayBhdCBIZW5yeSdzIHNlY29uZCBwYXRjaCwgcDJtX3RlYXJkb3du
KCkgc3RhcnRzDQo+IHdpdGggdGhlIGZvbGxvd2luZyBjaGVjazoNCj4gaWYgKCBwYWdlX2xpc3Rf
ZW1wdHkoJnAybS0+cGFnZXMpICkNCj4gICByZXR1cm47DQo+IA0KPiBQZXIgdGhlIGxvZ2ljIGlu
IHAybV9pbml0KCksIHRoZSByb290IHBhZ2VzIGhhdmUgdG8gYmUgYWxsb2NhdGVkIChub3RlIHRo
ZXkgYXJlICpub3QqIGFsbG9jYXRlZCBmcm9tIHRoZSBQMk0gcG9vbCkgYW5kIHRoZSBWTUlEIGFz
IHdlbGwgYmVmb3JlIGFueSBwYWdlcyBjb3VsZCBiZSBhZGRlZCBpbiB0aGUgbGlzdC4NCj4gDQo+
Pj4gQnV0IGlmIHRoZXJlIGFyZSBwYXJ0IG9mIHAybV90ZWFyZG93bigpIHRoYXQgYXJlIG5vdCBz
YWZlIGZvcg0KPj4+IHBhcnRpYWxseSBjb25zdHJ1Y3RlZCBkb21haW4sIHRoZW4gd2Ugc2hvdWxk
IHNwbGl0IHRoZSBjb2RlLiBUaGlzDQo+Pj4gd291bGQgYmUgbXVjaCBiZXR0ZXIgdGhhdCB0aGUg
ZHVwbGljYXRpb24geW91IGFyZSBwcm9wb3NpbmcuDQo+PiBZb3UgaGF2ZSB0d28gdG90YWxseSBk
aWZmZXJlbnQgY29udGV4dHMgd2l0aCBkaWZmZXJlbnQgc2FmZXR5DQo+PiByZXF1aXJlbWVudHMu
ICBjL3MgNTU5MTRmN2ZjOSBpcyBhIHJlYXNvbmFibHkgZ29vZCBhbmQgY2xlYW4gc2VwYXJhdGlv
bg0KPj4gYmV0d2VlbiBwcmVlbXB0aWJsZSBhbmQgbm9uLXByZWVtcHRpYmxlIGNsZWFudXBbMV0u
DQo+IA0KPiBUaGUgcGFydCB5b3UgbWVudGlvbiBpbiBbMV0gd2FzIGRlY2lkZWQgdG8gYmUgZGVs
YXllZCBwb3N0IDQuMTcgZm9yIGRldmVsb3BtZW50IGN5Y2xlIHJlYXNvbnMuDQo+IA0KPj4gWW91
J3ZlIGFncmVlZCB0aGF0IHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIG5vbi1wcmVlbXB0aWJsZSBw
YXRoIHRvIHRoZQ0KPj4gcHJlZW1wdGlibGUgcGF0aCBpcyBhIGhhY2sgYW5kIGxheWVyaW5nIHZp
b2xhdGlvbiwgYW5kIHdpbGwgbmVlZCB1bmRvaW5nDQo+PiBsYXRlci4gIE90aGVycyBoYXZlIHJh
aXNlZCB0aGlzIGNvbmNlcm4gdG9vLg0KPiANCj4gWy4uLl0NCj4gDQo+PiBBbHNvIHJlYWxpc2Ug
dGhhdCB5b3UndmUgbm93IHNwbGl0IHRoZSBoZWxwZXIgYmV0d2VlbiByZWd1bGFyIGh5cGVyY2Fs
bA0KPj4gY29udGV4dCwgYW5kIFJDVSBjb250ZXh0LCBhbmQgcmVjYWxsIHdoYXQgaGFwcGVuZWQg
d2hlbiB3ZSBmaW5hbGx5DQo+PiBzdGFydGVkIGFzc2VydGluZyB0aGF0IG1lbW9yeSBjb3VsZG4n
dCBiZSBhbGxvY2F0ZWQgaW4gc3RvcC1tYWNoaW5lIGNvbnRleHQuDQo+PiBIb3cgY2VydGFpbiBh
cmUgeW91IHRoYXQgdGhlIHNhZmV0eSBpcyB0aGUgc2FtZSBvbiBlYXJsaWVyIHZlcnNpb25zIG9m
DQo+PiBYZW4/DQo+IEkgYW0gcHJldHR5IGNvbmZpZGVudCBiZWNhdXNlIHRoZSBQMk0gY29kZSBo
YXMgbm90IGNoYW5nZWQgYSBsb3QuDQo+IA0KPj4gV2hhdCBpcyB0aGUgbGlrZWxpaG9vZCB0aGF0
IGFsbCBvZiB0aGVzZSBhY3Rpb25zIHdpbGwgcmVtYWluIHNhZmUNCj4+IGdpdmVuIGZ1dHVyZSBk
ZXZlbG9wbWVudD8NCj4gQ29kZSBhbHdheXMgZXZvbHZlIGFuZCBuZWl0aGVyIHlvdSAobm9yIEkp
IGNhbiBjbGFpbSB0aGF0IGFueSB3b3JrIHdpbGwgc3RheSBzYWZlIGZvcmV2ZXIuIEluIHlvdXIg
cGF0Y2ggcHJvcG9zYWwsIHRoZW4gdGhlIHJpc2sgaXMgYSBidWcgY291bGQgYmUgZHVwbGljYXRl
ZC4NCj4gDQo+PiBEZXNwaXRlIHdoYXQgaXMgYmVpbmcgY2xhaW1lZCwgdGhlIGF0dGVtcHQgdG8g
c2hhcmUgY2xlYW51cCBsb2dpYyBpcw0KPj4gaW50cm9kdWNpbmcgZnJhZ2lsaXR5IGFuZCByaXNr
LCBub3QgcmVtb3ZpbmcgaXQuDQo+IA0KPiBJIGZpbmQgaW50ZXJlc3RpbmcgeW91IGFyZSBzYXlp
bmcgdGhhdC4uLiBJZiB3ZSB3ZXJlIGdvaW5nIHRvIG1vdmUgcDJtX3RlYXJkb3duKCkgaW4gZG9t
YWluX3RlYXJkb3duKCkgdGhlbiB3ZSB3b3VsZCBlbmQgdXAgdG8gc2hhcmUgdGhlIGNvZGUuDQo+
IA0KPiBUbyBtZSwgdGhpcyBpcyBub3QgdmVyeSBkaWZmZXJlbnQgaGVyZSBiZWNhdXNlIGluIG9u
ZSBjb250ZXh0IGl0IHdvdWxkIGJlIHByZWVtcHRpYmxlIHdoaWxlIHRoZSBvdGhlciBpdCB3b24n
dC4gQXQgd2hpY2ggcG9pbnQuLi4NCj4gDQo+PiAgIFRoaXMgaXMgYSBidWdmaXggZm9yDQo+PiB0
byBhIHNlY3VyaXR5IGZpeCBpc3N1ZSB3aGljaCBpcyB0b3RhbGx5IGRlYWQgb24gYXJyaXZhbDsg
bmV0IHNhZmV0eSwNCj4+IGVzcGVjaWFsbHkgaW4gb2xkZXIgdmVyc2lvbnMgb2YgdGhlIFhlbiwg
aXMgKnRoZSBoaWdoZXN0IHByaW9yaXR5Ki4NCj4+IFRoZXNlIHR3byBkaWZmZXJlbnQgY29udGV4
dHMgZG9uJ3Qgc2hhcmUgYW55IGNvbW1vbiBwcm9wZXJ0aWVzIG9mIGhvdyB0bw0KPj4gY2xlYW4g
dXAgdGhlIHBvb2wsIHNhdmUgZnJlZWluZyB0aGUgZnJhbWVzIGJhY2sgdG8gdGhlIG1lbW9yeQ0K
Pj4gYWxsb2NhdG9yLiAgSW4gYSBwcm9wZXIgZGVzaWduLCB0aGlzIGlzIHRoZSBoaW50IHRoYXQg
dGhleSBzaG91bGRuJ3QNCj4+IHNoYXJlIGxvZ2ljIGVpdGhlcg0KPiAuLi4gd2h5IGlzIHlvdXIg
ZGVzaWduIGJldHRlciB0aGFuIHdoYXQgSGVucnkncyBwcm9wb3NlZD8NCj4gDQo+PiBHaXZlbiB0
aGF0IHlvdSBkbyBleHBlY3Qgc29tZW9uZSB0byBzcGVuZCB5ZXQtbW9yZSB0aW1lJmVmZm9ydCB0
byB1bmRvDQo+PiB0aGUgc2hvcnQgdGVybSBoYWNrIGN1cnJlbnRseSBiZWluZyBwcm9wb3NlZCwg
aG93IGRvIHlvdSBlbnZpc2FnZSB0aGUNCj4+IGVuZCByZXN1bHQgbG9va2luZz8NCj4gDQo+IFRo
ZSBlbmQgcmVzdWx0IHdpbGwgYmUgcDJtX3RlYXJkb3duKCkgJiBjbyB0byBiZSBjYWxsZWQgZnJv
bSBkb21haW5fdGVhcmRvd24oKS4NCj4gDQo+IEFueXdheSwgdGhpcyBkaXNjdXNzaW9uIGRvZXNu
J3QgbWFrZSB1cyBjbG9zZXIgdG8gY29tZSB0byBhbiBhZ3JlZW1lbnQgb24gdGhlIGNvcnJlY3Qg
YXBwcm9hY2guIFdlIGhhdmUgYm90aCB2ZXJ5IGRpdmVyZ2luZyBvcGluaW9uIGFuZCBzbyBmYXIg
SSBoYXZlbid0IHNlZW4gYW55IHN0cm9uZyByZWFzb25zIHRoYXQgaXMgc2hvd2luZyB5b3VycyBp
cyBiZXR0ZXIuDQo+IA0KPiBTbyB1bmxlc3MgQmVydHJhbmQgb3IgU3RlZmFubyBhZ3JlZSB3aXRo
IHlvdSwgdGhlbiBJIHdpbGwgZ28gYWhlYWQgYW5kIG1lcmdlIEhlbnJ5J3MgcGF0Y2ggdG9tb3Jy
b3cgYWZ0ZXIgYSBmaW5hbCByZXZpZXcuDQoNCkF0IHRoaXMgc3RhZ2UsIEkgc3RpbGwgZG8gbm90
IGdldCB0aGUgTlVMTCBwb2ludGVyIGNhc2UgYXMgZnJvbSBteSBwb2ludCBvZiB2aWV3IHRoZSBs
aXN0X2VtcHR5IGRvbmUgYXQgdGhlIGJlZ2lubmluZyBpcyBtYWtpbmcgdGhhdCBjYXNlIGltcG9z
c2libGUuDQpXZSBoYXZlIGEgY3VycmVudGx5IGJsb2NrZWQgc3RhdHVzIHdoZXJlIGFueSBHSUN2
MiBiYXNlZCBib2FyZCBpcyBub3QgYm9vdGluZyBhbmQgd2UgYWxsIGtub3cgdGhhdCBIZW5yeeKA
mXMgc29sdXRpb24gd2lsbCBuZWVkIHRvIGJlIHJld29ya2VkIHBvc3QgNC4xNy4NCg0KU28gSSB3
aWxsIGdpdmUgbXkgcmV2aWV3ZWQtYnkgb24gSGVucnnigJlzIHBhdGNoIHNvIHRoYXQgd2UgaGF2
ZSBhIHNob3J0IHRlcm0gc29sdXRpb24gZ2l2aW5nIHVzIG1vcmUgdGltZSB0byBkaXNjdXNzIGFu
ZCBmaW5kIGEgcHJvcGVyIHNvbHV0aW9uLg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCg0KPiANCj4g
Q2hlZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KDQo=

