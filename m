Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6F75EBE3
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 08:45:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568423.887706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNpJ8-00014O-Fd; Mon, 24 Jul 2023 06:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568423.887706; Mon, 24 Jul 2023 06:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNpJ8-00011Q-CD; Mon, 24 Jul 2023 06:44:38 +0000
Received: by outflank-mailman (input) for mailman id 568423;
 Mon, 24 Jul 2023 06:44:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTwZ=DK=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1qNpJ6-0000zG-Oo
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 06:44:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c76e5c8-29ed-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 08:44:33 +0200 (CEST)
Received: from DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) by AS8PR08MB8328.eurprd08.prod.outlook.com
 (2603:10a6:20b:56d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 06:44:28 +0000
Received: from DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:468:cafe::ee) by DUZPR01CA0042.outlook.office365.com
 (2603:10a6:10:468::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33 via Frontend
 Transport; Mon, 24 Jul 2023 06:44:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT060.mail.protection.outlook.com (100.127.142.238) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.42 via Frontend Transport; Mon, 24 Jul 2023 06:44:28 +0000
Received: ("Tessian outbound 95df046a2e2c:v145");
 Mon, 24 Jul 2023 06:44:28 +0000
Received: from ada7370f6c02.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D4E812EC-233D-4410-84F0-925C324AC1C9.1; 
 Mon, 24 Jul 2023 06:44:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ada7370f6c02.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 24 Jul 2023 06:44:22 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by PAXPR08MB6637.eurprd08.prod.outlook.com (2603:10a6:102:153::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 06:44:20 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::3861:1ade:9356:9970]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::3861:1ade:9356:9970%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 06:44:20 +0000
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
X-Inumbo-ID: 8c76e5c8-29ed-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbeeTScz0PRvsspk2KmeA4TGOByOz02SNak6YGybUhA=;
 b=5vuR2MEXivV6AE1JskcrpjgtK4la6EtRY0iylGBG4hQKpPdMqJ+AypOsOD4P36fMy5eg9XWUoWLQ6ag4/Zv0xofoSUhrSbEOROfaltCDl0YFMiQwPa6wJJ45d1rUaaMaXTI0E0OGnem9IBOCNjaZgRN4w9K8TyJTh7KLb6emkRQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b64a4c0cedd52501
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0Hu/vgR+rVGQeEZwX2S0QWHvoGABouIWsyJzLSChMd2xA1xhvKgRVR6amT8X1FccwnA9etgPO1UebSBh3dNx+out4IDRNefB0Fd7nAnAnhLElznVJ9CNt1pefHdref+fEGSvJrOMjwTWI2tlguy4zHhkBXExyU0JErCdLEAoefUeBLXwC51WGz8+JKvrRXfrKCoG89w68FgAhgVl9Jw4ZkZpRQPgqi3228+CUl4lOvVh2zipD2M9Rbq/VwPBu/ZqZNoOComyy+E3iIzHNyv3YsprmBb4ITxunLjrojbCPg+Zse5KJc8zWYOY0e2iISzjoQjcexYyd2UiDJi0lEMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbeeTScz0PRvsspk2KmeA4TGOByOz02SNak6YGybUhA=;
 b=nemov4xG9SWAqkoL6hW1fV/1CCgJ3/HtooiZ4Sdx1DBEQvooPmExkd4KXfLmKv1aEUmxMaJhGEJmpk3CsFHci6yQmHO38EQ13XCpHWnCgJ7sOcQx5dZ+ircMDzlVKL+BvTqGrqMuC5umN/iquNyHBwZe6N4jRcQRVyLpLwvlGXGm+Fveo+stxXvc45wbeAqoUHYlIAHSpfRIwGhB53ypuquu2s/JkxkYcvoiSpjsxa16dNxXm/zZfukM8nJAVq0pGBQ5NOU50WL2LfFqZ0iMJKuhuY77uizJA1Ev3bVvbhRZ2EpEri1BrZwVawBJT9x4zXIHRoHo2ToZY4SjKLkHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbeeTScz0PRvsspk2KmeA4TGOByOz02SNak6YGybUhA=;
 b=5vuR2MEXivV6AE1JskcrpjgtK4la6EtRY0iylGBG4hQKpPdMqJ+AypOsOD4P36fMy5eg9XWUoWLQ6ag4/Zv0xofoSUhrSbEOROfaltCDl0YFMiQwPa6wJJ45d1rUaaMaXTI0E0OGnem9IBOCNjaZgRN4w9K8TyJTh7KLb6emkRQ=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <1be55cf0-9e62-39b7-c5f3-bb7f4c25d21c@arm.com>
Date: Mon, 24 Jul 2023 14:44:12 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v5 4/4] automation: Add smoke test for ppc64le
To: xen-devel@lists.xenproject.org
References: <cover.1689958538.git.sanastasio@raptorengineering.com>
 <ade2e58251c506e4576424082623d9b232a435f9.1689958538.git.sanastasio@raptorengineering.com>
Content-Language: en-US
From: Jiamei Xie <jiamei.xie@arm.com>
In-Reply-To: <ade2e58251c506e4576424082623d9b232a435f9.1689958538.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To AS8PR08MB7696.eurprd08.prod.outlook.com
 (2603:10a6:20b:523::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7696:EE_|PAXPR08MB6637:EE_|DBAEUR03FT060:EE_|AS8PR08MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfc1f23-b18d-4c82-a7b0-08db8c116d74
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ekny9J5psSrUgsbV1Or3BX5Pj/LCrQn/WLC/kg9b952DKAimtjUfkHHBnR1Psi7QNI47Po242vlUWYvwYp5mzazpcnDiHmMmS7tiSJWC44AuDlj4dsMC1d24FlPZpXelHdv9hzrK4OzBInHoJve6Cbv9jwrsnAZRWFwiJs24xDboKZGZ3hJaK9PG0sjs9999Rx3A/dSTX7jCHGECwVDx/4EEd64nma+qi5c0qQngkN68sr0E/zcsWDjBmb9ulAfDZnXAxPHN/40EiE8rfwjtZcb4xIqM5VUESNf4YuRNjUWQ9MdbsKHmLWBL7b7u+EP9AhNmf5r3wWDZV5J326m/hx07tqHcYo5EnbB5WeqAyJqGEIHpRGDf+io9M7KYUEttxViBK5wy+6/kHXlBsNyjxlBsEYVz3NAzUiK9klhUH1l6h0U0vQC4pkwv31VqgdZPAaanR4Z264ZENPm1QnRdrzH/1O8Tsc2oK0i4n2fup+UFMr+XEmQ9RD7zqS+ZwO6lPO1eNugt9/fuefn45ph5BCMEfkxxRIS7PlQpPJHC6E6R9Fl9MHU5UXIlqhXJ/i8XDZG/XzT1AlHdxSul91Wv8bQC8IpI8jeoVVJy27iA4U7BMisfxmZXNveb2z7xJXF/0HFOylEkvGcOjUYXlUrfCg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(8676002)(8936002)(478600001)(6486002)(5660300002)(6666004)(316002)(38100700002)(66946007)(6916009)(66476007)(66556008)(41300700001)(53546011)(186003)(36756003)(2906002)(4744005)(6506007)(26005)(31686004)(31696002)(86362001)(2616005)(6512007)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6637
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	442e1958-6c59-41b1-121f-08db8c11686b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j1dTZUabkyabzrFf20wPOsxGEV/T16NeKv5kSq2oblIzOw4pKb0cAJimTUcpM/TvLEMLymZsgvqctCfqH2CZmMp/Eo/hiFhLriR8eCzDFVEwSULR9vpIK5zPyId+PTh0F5ug5WMb4gkYLcmwSEgkIQS+vfxudvXSltnj1jFGGyUvYyvxOGvvG0ExRYrw9+K8ZSkWTufAjwhoibwGTuswcRCdTunKESsq4BuSeji5Wan8vsZGQFitdG8zdGeh66iWm64hUzrTrJrc8Q9xklGbhH2lL2fj0NJIBFbfDihTnutLEQH0zxlSRmhMOY26hSOuh7YrppSJfM86WAg5hOXFVrSn3hUGUZzeXkDPk6iP4CuDDtNrkB/1lCm5srliV0DhxnWpa8Mwq0ivI2zFlfTz7A/9CZY6Ugd7nq2uOQyDuf0QmPFPLODnq+aRadKPlSl4qP6INpSso8HC71yUFyfqiOhvq9Na8ldXNzWkWN9PF/e+Zn1QD+yq1iKw5rETjfpi4YTAdxchQrJxhtxfHrg9uT/otAesFVN3FlZgaw+yU4PZZEMmql7jAQkuZQC86zS1b+ugtTP146OchTRF9eY2Q9xSMHnOM2ijubNOahoncExXr4PFXAR2kxFfa8pfV8ZIlOt2AwFkXiuUq8KJS/zJxD9C/ZtOtXglDnZgzYUTmT47qN34pcsP0F8FAkELoO8DyQ7Uz6chtGb7EOjrrVV3fr9udpcyIAfh4lONqyVGT34hcHHdE9EJlPCk4tmTTA8oCsyCgbmY6Tb8kyXmzLrP5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199021)(82310400008)(46966006)(40470700004)(36840700001)(36860700001)(5660300002)(2616005)(4744005)(2906002)(8936002)(8676002)(6486002)(47076005)(31686004)(44832011)(6506007)(53546011)(478600001)(81166007)(356005)(40460700003)(26005)(186003)(336012)(41300700001)(40480700001)(6666004)(6512007)(82740400003)(86362001)(31696002)(6916009)(316002)(70586007)(70206006)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 06:44:28.1595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfc1f23-b18d-4c82-a7b0-08db8c116d74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8328


On 2023/7/22 01:02, Shawn Anastasio wrote:
> Add an initial smoke test that boots xen on a ppc64/pseries machine and
> checks for a magic string. Based on the riscv smoke test.
>
> Eventually the powernv9 (POWER9 bare metal) machine type will want to be
> tested as well, but for now we only boot on pseries.
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Jiamei Xie <jiamei.xie@arm.com>

