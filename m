Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7DC3AE591
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 11:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145394.267511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFqu-00008y-0N; Mon, 21 Jun 2021 09:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145394.267511; Mon, 21 Jun 2021 09:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvFqt-00005Z-TF; Mon, 21 Jun 2021 09:04:19 +0000
Received: by outflank-mailman (input) for mailman id 145394;
 Mon, 21 Jun 2021 09:04:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvFqs-00005S-1Z
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 09:04:18 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14e2e508-8cd9-4dc8-ae2a-a4403b58f767;
 Mon, 21 Jun 2021 09:04:16 +0000 (UTC)
Received: from DB6PR07CA0171.eurprd07.prod.outlook.com (2603:10a6:6:43::25) by
 PA4PR08MB6319.eurprd08.prod.outlook.com (2603:10a6:102:e8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.18; Mon, 21 Jun 2021 09:04:07 +0000
Received: from DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::81) by DB6PR07CA0171.outlook.office365.com
 (2603:10a6:6:43::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend
 Transport; Mon, 21 Jun 2021 09:04:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT033.mail.protection.outlook.com (10.152.20.76) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:04:07 +0000
Received: ("Tessian outbound f945d55369ce:v96");
 Mon, 21 Jun 2021 09:04:07 +0000
Received: from b7f4a495dbdc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA823434-BD8F-4375-9AEF-44C40CEAF9A5.1; 
 Mon, 21 Jun 2021 09:03:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b7f4a495dbdc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 09:03:35 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6286.eurprd08.prod.outlook.com (2603:10a6:102:f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 09:03:33 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:03:33 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19 via Frontend Transport; Mon, 21 Jun 2021 09:03:32 +0000
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
X-Inumbo-ID: 14e2e508-8cd9-4dc8-ae2a-a4403b58f767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIn4QFZpjWQFUKJu9q89YMpvDVKYdNvpKtom6uEO1e8=;
 b=SSNbsR92ZnoCG5w7QXRvO3D50A3icmohar3ibWn63bg1hyUAJbP+1/ANxGL0+60puRutS1z7Zj9oIKkDj3h8xjvnhQmEZ/JJaP0AxnM3i6bMueADgbz7aMalYydbv1h73MMlrJ9lZcnQ1HxkAtlEnxOKfS0BaO4q9k/or5Tpev8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0b529280689042f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMMMIV345Z5wytheB9+VHeSlQtgJHUcc/7NfxbBu97Rv9QAjO6XedTt3uWeMZu12p/U6wo0wWRCLrR6rnLpsi7RZwUM2cmx0WPiE0xiIymuTBWGDyfFmy+zKWKfjFlCzqrX+hZuYZqY8B0T+NjtBUWl54di9wfN/5BuK/tctcC4XyuCnYbYJiEeaZiC08oyX1C+tcFwpPT01Jz64uLrFZbOpTNGZKoxpA7+SKJiVFeFdUSAywynyDsq7RqL9/+0Cg4AEiaMxv3KXvOwDJXsW/COITgk5BzwHoRTgF4mYqSy6eryFJRsaE4uQim0zoNzCA+DlDTaPZfpqA0jjIshf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIn4QFZpjWQFUKJu9q89YMpvDVKYdNvpKtom6uEO1e8=;
 b=VA/UuaPNQ9W2rx+yAREDOQAh/FRnTjxpCJxh4hLzTkznmCb3agOKRxPvaNoF192jKTbou1oAyjJECM4tNKZEp1RbXF5DvKkgQrphO/obrW1M1GL2RlNTy9hYklAwOaja4/aslv0B3bMCQBkQE/RsV5bai3pQzt/bZ12C4rHCI5mjevifNh229I0UDFMXZWy7ycB3JPU5yeSIsx82ivCeVtmAcrCt0c1g8CkNii1m0mAVfiVDCfeCuR6LhOjwVR5Sp0BymVWFTNd2brLFmefnnJ4jPXcRFNkNcrL8v1DxhFXDjnDb7emxKpvYZYeszaLQTEQZj66nfOs78yGSWBgoMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIn4QFZpjWQFUKJu9q89YMpvDVKYdNvpKtom6uEO1e8=;
 b=SSNbsR92ZnoCG5w7QXRvO3D50A3icmohar3ibWn63bg1hyUAJbP+1/ANxGL0+60puRutS1z7Zj9oIKkDj3h8xjvnhQmEZ/JJaP0AxnM3i6bMueADgbz7aMalYydbv1h73MMlrJ9lZcnQ1HxkAtlEnxOKfS0BaO4q9k/or5Tpev8=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 05/10] tools/xenstored: xenstored_core.h should include
 fcntl.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210616144324.31652-6-julien@xen.org>
Date: Mon, 21 Jun 2021 10:03:26 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien Grall <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3CF3D42A-DFC8-48CA-A46D-CB2166F820AB@arm.com>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-6-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0091.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::31) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca37b43c-d785-47b2-eaaa-08d9349386ea
X-MS-TrafficTypeDiagnostic: PA4PR08MB6286:|PA4PR08MB6319:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB631971E0E70096373DF5DC7EE40A9@PA4PR08MB6319.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nNPzBSfi//WjkmHgB27Vw+H55d8oY+kVmobuuO1yp2TfCGkRIIZJicXcPI86SL0CCJTRywH4CN0YheUSP35ImFP7EPAxVSlG9XK+bSFud0lpf4QBwfh8k/Fgp7dvO1ZC8Eo+xNS/bLGIxoCyEwqw2bvhkQU8VkuGCzif2xkzxMriNoq0kEEzt8OFFf38iTXVbNVL+4nt4TCrO1fKp4CqQ2rZJcd2FUzejd/yTV9AIZiXdxEBBeYug+K8MKLE6wu4VXSURIJzdYtwlWirMAhEz/MmWr0nC3mbw7X5DQrJDz72XlIPMXLTPfu5gSwhjoPHjf/6I8XM3M8KZl56nPBjYMf8BXo4zCvAwJaRWAFJloI1rv9438ROj38IpK9JyZoNrmNE+FfrHJ6tw13YjruNP9Sj43Jxax8KyN3Ggpw9/yDF92VhUQxL8h5LZOi3oDcUo0Oa/HpqOBzNoYnZ/jrK3ojOknUIUfZNh1nSdZ/6a8mSJs5AvWrEKj9AJCUN1iRCuEDZ4/jHCDVCeY/KtwIhqpz5QzGRRk4PveyH/N5G7jbz6aAU8+SEhjvF/C6XbOoLP1m/iQtJ+ahUtJ6/lwhz7BTpRsyd+5Aq6s4M41vZ5zouZJ5a4e6vEUCZmFd0SyZDKODgmAGZxS3Q/tNCj95l3Qk/lQhmxBMXc5Bi5vJTdiTh1x0ftaFKjDi3+evYczTu
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(86362001)(38350700002)(83380400001)(2906002)(8676002)(8936002)(6486002)(2616005)(478600001)(44832011)(38100700002)(36756003)(956004)(54906003)(316002)(33656002)(5660300002)(186003)(26005)(66946007)(53546011)(66556008)(66476007)(52116002)(6666004)(4326008)(6506007)(6512007)(6916009)(16526019)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?38LskC+TtNC5Yi7e6PGZdMKVmqKWPw1Lx/kuwGtMJJg17DseTs7AL0svvA8u?=
 =?us-ascii?Q?91eCmXom73b/FDkpT3qEkIlpXBbhizn8F4aIsRYZRAweKtrnMDDfMPLi5Dzv?=
 =?us-ascii?Q?8pMzMvhv3mcVEU9tTfZThI52EkekP1WV4qGX8z0cWUIm0CkrEKDf5mGSUEL1?=
 =?us-ascii?Q?9APm6os/VnfMLSPnaNFyvyK0iP26fcChrPnh5YnV+LtBq5ktsOuUQe3czNWi?=
 =?us-ascii?Q?P7+4g0sQsupVs2SsSNjPoGgFkwiRFJibwK2vrm6102Ie7X9AhY/S7tp+Z1tO?=
 =?us-ascii?Q?i6l1XUdnlWmB1+R2U0vovGK4eWhOpsKJGe2jtC35smrO3AiGZaWQM6vdFRjL?=
 =?us-ascii?Q?lBJIiRGHsqu9L6ONRcxot+6wMnXk8lIpNH8LJdr+cPwWy1Wvp5VYm5fdRn4r?=
 =?us-ascii?Q?P1YeG9Wh20snv2Qa7WVnp3x6Q2MhCu0hESiHNnocMYiMD7m1RVg8CecNflWg?=
 =?us-ascii?Q?Hv/OxRUv8iHV3MDeQO3t23YU2oeh5ZTVd18z4tzdZ7izusiC/WnjmmZ8VE4G?=
 =?us-ascii?Q?DtGFleHPSVbGDVlYK/tU7Q+YBYwkivOiutrS1b8a+SCWO8BwZH+DsKF8WDx3?=
 =?us-ascii?Q?wV2WGTDpequIIoxKHyXLAk3eibgwvBk/Hu1KxH+ZD93htisqaJR53QZ/VAyy?=
 =?us-ascii?Q?9CbG5oIVU/jMPpbJZSY06TTg9+suthlgsti3juyZuy/569zN2FT/MkFIYxlp?=
 =?us-ascii?Q?1srByegtKJ9z8mYJy2JZAzi+nlmX9aURDQpw21RMCsjDePcFPYVplN6WMPXa?=
 =?us-ascii?Q?YsLwuWrACMWkPP5io9516MpqyMmEsAuBVRRhqeavErOnYZLQW67iPnf6PcTZ?=
 =?us-ascii?Q?JR+kZ86k+rEO/x3zAwB6ROh9qwT6Ng2ujsvDUdCpwEQgGruvc8sbhRK+YGK2?=
 =?us-ascii?Q?nSSv5XU3y3DtA50e9ziLK27rWLD//EVHvmXmpTlG9rDamyGo138CACEBLEbd?=
 =?us-ascii?Q?CQFndcqqFrubPoP65Q1kAxrzJJTVpHVIR++wk7oGmzt7atbQUyssCgL/itUQ?=
 =?us-ascii?Q?Fqz0UpAowxrw15wj9w5Y466BMoQFaUoYjqRpYeSN3mH7JFGOYgbcUoSUbe67?=
 =?us-ascii?Q?18gflJ7DskZKZtzpKWJ97oC+2qd8tjIEErnUYcSrX9jpM9LWl727MHD5OprD?=
 =?us-ascii?Q?ghp38FY/FBznX1MGQAcdWTdB/Co051HAgtjRE9DnWeXSQmeq/osaphVkzvQw?=
 =?us-ascii?Q?hszsiu7Nrng8dISIQ/3oO93BMcCuzREHfHACR+FiE0Ed0GAVy6kNMvEQf62a?=
 =?us-ascii?Q?bEMEEcN4vAFwUduixZvIpqmJ2Uj0ajNxbeX72uvnfqiAgAAcV/WhKzI069To?=
 =?us-ascii?Q?WdyRjLM8Xlm6qxS2Ko2OLdVL?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6286
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	64545849-5cab-4d54-a043-08d934937210
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j1yfZ/qUSIEJ+QCmGIZWg+rlEuJ5d+A5sMF6lRKZDzSG0TXfRhaGQPC4OVpWZU/tVKLfCLpP24WA4ZtpcS+X1yghixuTky+Gaqd4JVnKBlyJSVZR1hWyLbYx7mH+ii6YviroQHGwxfXeuJHZdIvWedhQ3YEIZOArrdfAnUug5+Wlco9pAewwp3i5eL4oId7qxmeU0RkICAmghAnEZnM8SSS8jBZrCcTTa72WV0veQhM+nD2YMfspMribF079hQu1tNoXvLqs3rUDjJrQp3/zdplARNbbmYNAkArIzoQq9IoM9G8STCop/3hCUn2q7w5OIgD00bGv2iR5PwwQcOesme8P1gf+W/SFrEkvA7AEcJfcPzYHw58Y1ge718M6UhlSPR7j/ThLOx/QE1igEoaLHWbwAvblbEzNI9BHKY98brjCYiKo5H41o6psVDT4mBLNuZ5xjg3ldXGI0XZfYbtaQwiQqZSc/tsrFbxTSIkxxhDEOIfCHd7QaYGQ9voWxd99nSGSeVuZfvtNJdYyvbQVFW1fXiNlH0Xx+H6UP5dWns1dIlmDGHqDBa0bU06cJpwrsD7cqFLc+wQBEsJ8dnCksPu2PyMP1PnRJWmiNmAlZUGxjHV3mZi81HMtwTWVIsz7VfP9LdrUjuvKNOtlM0DrTuTpWI/9V2eqPJP+NMx52Rw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(44832011)(70206006)(8676002)(83380400001)(6512007)(107886003)(26005)(36860700001)(2906002)(6862004)(356005)(6486002)(47076005)(70586007)(478600001)(81166007)(82740400003)(54906003)(2616005)(86362001)(36756003)(8936002)(6506007)(16526019)(53546011)(186003)(5660300002)(4326008)(82310400003)(316002)(336012)(6666004)(956004)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:04:07.7895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca37b43c-d785-47b2-eaaa-08d9349386ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6319



> On 16 Jun 2021, at 15:43, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> xenstored_core.h will consider live-udpate is not supported if
> O_CLOEXEC doesn't exist. However, the header doesn't include the one
> defining O_CLOEXEC (i.e. fcntl.h). This means that depending on
> the header included, some source file will think Live-Update is not
> supported.
>=20
> I am not aware of any issue with the existing. Therefore this is just
> a latent bug so far.
>=20
> Prevent any potential issue by including fcntl.h in xenstored_core.h
>=20
> Fixes: cd831ee438 ("tools/xenstore: handle CLOEXEC flag for local files a=
nd pipes")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> tools/xenstore/xenstored_core.h | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/tools/xenstore/xenstored_core.h b/tools/xenstore/xenstored_c=
ore.h
> index 34839b34f6e9..dac517156993 100644
> --- a/tools/xenstore/xenstored_core.h
> +++ b/tools/xenstore/xenstored_core.h
> @@ -24,6 +24,7 @@
>=20
> #include <sys/types.h>
> #include <dirent.h>
> +#include <fcntl.h>
> #include <stdbool.h>
> #include <stdint.h>
> #include <errno.h>
> --=20
> 2.17.1
>=20
>=20


