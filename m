Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26439C6C99
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 11:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835258.1251111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAP8-0004QG-Hk; Wed, 13 Nov 2024 10:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835258.1251111; Wed, 13 Nov 2024 10:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBAP8-0004Np-EZ; Wed, 13 Nov 2024 10:15:18 +0000
Received: by outflank-mailman (input) for mailman id 835258;
 Wed, 13 Nov 2024 10:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DKyd=SI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tBAP6-0004Nj-Fw
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 10:15:16 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20626.outbound.protection.outlook.com
 [2a01:111:f403:2606::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a768e5d-a1a8-11ef-99a3-01e77a169b0f;
 Wed, 13 Nov 2024 11:15:11 +0100 (CET)
Received: from AM6P194CA0095.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::36)
 by AM7PR08MB5365.eurprd08.prod.outlook.com (2603:10a6:20b:109::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Wed, 13 Nov
 2024 10:15:07 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:209:8f:cafe::90) by AM6P194CA0095.outlook.office365.com
 (2603:10a6:209:8f::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17 via Frontend
 Transport; Wed, 13 Nov 2024 10:15:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.1 via
 Frontend Transport; Wed, 13 Nov 2024 10:15:07 +0000
Received: ("Tessian outbound 860cf2c1e826:v490");
 Wed, 13 Nov 2024 10:15:06 +0000
Received: from L5984f6c60f3e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 447CC59F-6DD1-4B17-ADC5-F75D4BACB537.1; 
 Wed, 13 Nov 2024 10:14:58 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5984f6c60f3e.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 13 Nov 2024 10:14:58 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS2PR08MB10321.eurprd08.prod.outlook.com (2603:10a6:20b:5e4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Wed, 13 Nov
 2024 10:14:52 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 10:14:51 +0000
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
X-Inumbo-ID: 2a768e5d-a1a8-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwNjo6NjI2IiwiaGVsbyI6IkVVUjAyLUFNMC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjJhNzY4ZTVkLWExYTgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNDkyOTExLjM1NjE1Niwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YR7fAcKAGkNV/TjplHdM//lRAmp7cnlTsEC94EuLzKbJevfplgrA4GaHPhfXlbXu/GO+XfaCaLPM2U84ZfuzfySEIAH2azEuLy1sgzSo0vHuqyrinaZClIycpC/t32Mkd69BWkgKJ+TXVzTmEFvqFunPcIr+CBPEgD19BEq+mytfWJZlqIJK+TJIlShrIBMhq5geQAXIGYnxJHbmy8K5rWuENENJxYEnCWJ8X1YiAlhpOQzQh9qEKjcbtichSHQIRouBMDnCxNNkY27uhr0YH1AoysxMglaUnLdEYC+1xFsUveXYGmuWN/Au2MgfpUQnhKMy8hkDAjadms1EEUunFw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx12dp2gMou03yYYP/XFki/VVIVbniq2YRuI9Mj5z94=;
 b=qt7l57lp5FwF4z398qREII9m2NadteXVIcj5qsktYUsMJKUM8MNa5MJ35hJHF3GhQQFKeIFrKpxFsY2OPoDSqKGT8Qa4bPuxKF/yuGmdUBL74w4n9x75XkMXy10gEdTpxYlliMQmEzRzFw3sMIwIcOKZwPshuijj33Rn1G4byBXBOCUr+DQYNWMblXam289kWa/sDcmngnWc8/xdBOkkBkFKfoLxxmgHVs9W6tRQ4Lh2uPLuofmVPHamXrCR3y1lH9KLIQoYlKUHMEfuKwZfSvI9Mu+XB3XfKDz6RToxzDafrzM1MgbYgMNjwNLKKihJsr/O06P1v8w9teayjNhwcQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx12dp2gMou03yYYP/XFki/VVIVbniq2YRuI9Mj5z94=;
 b=ZUJwADUUXzEXlgDrj5xMOmhXTON+lNhEQWktn4SyDqQhVVcnvDNzIfBSpNqbx7YBHeUiOFZsDLj9YNrpApT9TDKi11tqJpY0+OQpoyX8AQlsVtSbzCwHd6hVWZhSqn3CWKjTos2LIaM/5o0FEWwLs35Szo2DkjDLjqarbGXHZGU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d4ace07f8bcf593
X-TessianGatewayMetadata: ueMb9BKhHoCziVE6DvsEwTl5v+O/Fq1oFbSrTjDVE9wUvCXK7rX4XGWso0V9Tzx+CY1IMxmTOwmbfA30+qp0f//93Wh5CpmydKMSHjsbV20ZlWIxXKYsN8n11ufJBmGw4NcH8te0TfVPkiQt4tzv68nyW5GwV6T/u6eKW/lJXt0=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WEfrNTNLpYdgdFxB1u6FVLLK0X+r7mw14jVHbvrermgJwsP4CI5LgSKyu0ua3NaTeG36f/qw59WnYGhthekv+f1L1xqMO0FN6BjsJLcOEulxI6Ifux+dJLZJAAsZNYeyOcw6Adl0XFkb7LhiIEx/eHSLNxU8EhepPH+UrcT44bIv2YKI7RO8dv1oc0zg6v3yJzKhXcCRyTln5OhLMcEHoDqPUzSkFN3vIFU1PO9UztotoIf+OSNu9k8LD5RsWtQTdF77U3gJIoPblAxFGBmr6jZHulCMbLTW7CghZubfeSQ7NlrMm7M+NSE3NkNIB2UhLRdbdaGj/qN47TGFnNeBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xx12dp2gMou03yYYP/XFki/VVIVbniq2YRuI9Mj5z94=;
 b=fY7+9opyivRWH5Rif0UWAIDNKvI14Gk41dY+bPBsq/z6qbQSYWXcb9ERKt5T11MriKELohA9kU/F6v3QAJfE/W7eP3gthxT2jw6cZDe/z1FcNy0eXkfqpIesJ9mnN4ZixDqGbgzqDkUoBCEzDbWDdiPzp7OCW29+Lq+a7w5FcCnYmhwuExrWsljFQxvYxnJXiqTDPIWSUPklu2sGd9W9KxFk33c/Go98ODZ2mXMdx1KlVAzu1w2neRUoFE+4XXvbBId9/mnQ/LbedMb+VhWsGq1U3Il1hy3CdKdlMwMZBv+FBwxPhH/LOrwzcXjrPyElExUEF1s0Rlq1LCcJhloVgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xx12dp2gMou03yYYP/XFki/VVIVbniq2YRuI9Mj5z94=;
 b=ZUJwADUUXzEXlgDrj5xMOmhXTON+lNhEQWktn4SyDqQhVVcnvDNzIfBSpNqbx7YBHeUiOFZsDLj9YNrpApT9TDKi11tqJpY0+OQpoyX8AQlsVtSbzCwHd6hVWZhSqn3CWKjTos2LIaM/5o0FEWwLs35Szo2DkjDLjqarbGXHZGU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Kelly Choi <kelly.choi@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [ARM] preparations for 4.19.1
Thread-Topic: [ARM] preparations for 4.19.1
Thread-Index: AQHbNbTgNRvdpigHGEmv1MoPEjZo0A==
Date: Wed, 13 Nov 2024 10:14:51 +0000
Message-ID: <FD24D223-1EDF-414F-BA41-112A72F894CD@arm.com>
References: <ddc41c9d-9754-4fde-bac0-6389511a7f7c@suse.com>
 <4aa24b39-5734-4b0a-8969-dc3eb4942975@amd.com>
 <718c2a9c-15b0-4f21-941a-5094c06787c7@xen.org>
In-Reply-To: <718c2a9c-15b0-4f21-941a-5094c06787c7@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS2PR08MB10321:EE_|AM4PEPF00025F96:EE_|AM7PR08MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c17e963-52fd-4d6b-d014-08dd03cc0c47
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?aRhq08Gjg1smiOa6zMl3IVOxiVUYqdl3bvNVsaFS3KilWKMNha5GxQqAjOGP?=
 =?us-ascii?Q?k3+22XXaFr2EtXZdob+btJli9XQjCLH+Le/+pVSXwTc80RvjyputuWemocyG?=
 =?us-ascii?Q?4fsWDX0TzU1wDKJbosVdzWhmb974VAPYokLClEDIBYk6LQpmLAZymrOOhTL0?=
 =?us-ascii?Q?U+3q9vc6b8a8KzUykwpRu+AKlUUINESmRVgumXI44Dbc2WlPPdMDfoMliYnY?=
 =?us-ascii?Q?TXxo57NMI/woOuFDi34zAaWF0u+8i+QqgiDPCKibmxZK9z39O+OM7lo1w2jM?=
 =?us-ascii?Q?moiHTFcP1D+/vP5xKqsDL0K/yMp10HdLiePHyo6q1+xCtq1+cnNlS7mKxdDJ?=
 =?us-ascii?Q?5RI5WR8lbl0glpOHDJ+mUCOJNqMUD61k2wm5tIx2FIgW2HN+vnmEeTscoeYH?=
 =?us-ascii?Q?Q6y+re57P9QyNAavNeN4ABfe0Ssqy4SdUmbtnR6zTnGZf/Q/4CrDTSWVoBXg?=
 =?us-ascii?Q?710YuafkJIm3jkU8XpHn9P+dXSrYqD/k2pLLzkMIaf8bgMbimVBdW8PmqeX5?=
 =?us-ascii?Q?uxD4eLnfyuKHJ7YjdYfnTay/I76lp4k+T05nwvMX/A0C6SOigBJBRW8aKEfI?=
 =?us-ascii?Q?EL7OGE0EYqrKft9O2YBFbumT1kgrByVqiAhy5eS5xFYzxcpL9eZGgkufDz/g?=
 =?us-ascii?Q?jbMV5wapGBDVuE9fKaUZyJkcBNjpyaf5eoiOowXMCcnWLUFEh9YL1hgCE/or?=
 =?us-ascii?Q?3Lc1a0afagwZXd2hvj3f+7KqNtBM+26E1tZJNBsCSGcigSeyIWu70EDAKVRa?=
 =?us-ascii?Q?P7NJVH3FNB0dq3qSWNaD2R4ZKWVKjTy5W1w9UUmioj9scSXkGjKXc4FiPJO6?=
 =?us-ascii?Q?H6PPKW9eSaBCA8ynYZvP/71tnU9d6SGIOWWrTRE2iTWuAUQI7zOEIMrS9kQJ?=
 =?us-ascii?Q?0A4hiTVvLnVvygHZx6BB97kj/2QFsPCgWZMo8dCktLvRx/wz7Kq+8DelmlNj?=
 =?us-ascii?Q?aL9WeIGHgxdZqfCN54CpySzoEPaHtE7rQ4MPGMIdSid77rIgU2N0jEyhJbSf?=
 =?us-ascii?Q?j6ibBU5G/FEBfXnUXtOZz0i88oJYLTXOKvwv6yXV2CKPRDA0ri5OyqtEjMqx?=
 =?us-ascii?Q?RH+8mUOBHRfzeyE6FQR1kXTtPNJ8nmzxzGuoiuGVDHPygmwHFK9AKcCWe4aw?=
 =?us-ascii?Q?7V1vHVP2JTYAa4oyHtwmhAkF4khEeW+iFFwFOWgA/jqIjyDDwFXZivV9zboN?=
 =?us-ascii?Q?20YU/E9+w6LxwWA8KeV+wDdbr3WJ/7jel04rK0cRrpo3ZckXhENteuGh4tjw?=
 =?us-ascii?Q?NZraeR09LHhzbXicSChp49yHqtpAVRtS5QA8THBpQtKWinceIAjB0C5U5a9y?=
 =?us-ascii?Q?5y1fs+643+9NwAHOeFoQlkPtatJHeMC2uZoLMIcRMEsbhjEy8TkDJbLHbeIX?=
 =?us-ascii?Q?4NTUNPKLJ4xq1NS3jBsQr7hrZF+O?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: multipart/alternative;
	boundary="_000_FD24D2231EDF414FBA41112A72F894CDarmcom_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10321
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9ddaf0c5-a481-44c0-1208-08dd03cc02d1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|1800799024|376014|35042699022|4076899003|8096899003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nbBrDG2Wg0EkaqigcUOaPZh6Ht0U6SRg8jODWnGRw7ecnabIkdAzHb8c/hBH?=
 =?us-ascii?Q?r0uXU51lxKGEj/B2X6fxFqMTsbRNSPFO6zw4dp+2ugoVnFoif0iR8s6xa37R?=
 =?us-ascii?Q?bRYtLk72k7JxnNZjT2s/JGx8UFdZDmt1dIP4r5S5VJ/wOSSpa8kVu8lT3YZI?=
 =?us-ascii?Q?NvKyMbBUG+MoSNZV7QfLfrcQiNFvDvzQyUG/7eM2PUkoMwVll1D6F3VH9fIP?=
 =?us-ascii?Q?QMzRbHHp+w6t/Pyb6ZQgWqhOTcZoslU/ISSqvk4LtR5+R8drd/K9aIK2eCYl?=
 =?us-ascii?Q?jJUEJlr8cnU84RCoGbudrPebONqzzPSZxtzzmJhCAyfUDUzb8pOJORwba8Hs?=
 =?us-ascii?Q?EUZps+69sBoGOsZh6fvmAcF+6OjzS8cZfzpqgccsge7lph1+Cli0wEn6ukbB?=
 =?us-ascii?Q?bITIM67/J+1VjWIC3rhQuUIBBJ/O0axY78Elq6lwNfkykjhXOld/jPZ88tOO?=
 =?us-ascii?Q?lW42nqUdqB9BBdQ6+5ugylZx7Ci60jQWkaLCp0HaryN7uYPPZgNLXnvQZUjK?=
 =?us-ascii?Q?KnVHomyPYayfZuYDtbxj7zqzDfDK1DGXNt9YkbFqumVXiII5Fk4WjAcpr4hz?=
 =?us-ascii?Q?dV/lGMSEPOGIIuRf2d0w6n6dRNnte1wEY70WC1xT++Rv2bw87Ln7R6jDIB4a?=
 =?us-ascii?Q?tx7AyRo2E7mfPTbvaDaNq045XNMyoHP0Azu0kIyi5IEFAYtodzch3o17xSVE?=
 =?us-ascii?Q?6Afjia9flSWFrQMaA7BnolHNVnhyobAOvgn2YKG8QY0mTFGUNSl68/y1AXtY?=
 =?us-ascii?Q?PjZX4MM9bWpja4lTQUldfRKcctOoH1W7Vti2l/PxHuj0Bq1+hQybyVBGYCNp?=
 =?us-ascii?Q?n7yRgbt+Pi22kwKLR9hALbU2qQS2S/9BnPqztAxayiUT3TKzOePoczP/WzWI?=
 =?us-ascii?Q?WGD/j6mnW4c5B0fmr9Eo1tIxD4l5D39Ho34q6un+dCrhhhCEi6OG/eJ5fjNZ?=
 =?us-ascii?Q?kHuS3+NGUwBPY+cIEGRXt11CFPfXRuo90gW4+SHW35RHdhqMuPz+cDv+9g/C?=
 =?us-ascii?Q?zMfxsKj5DWgYY+w41JsWARFpMvsh94r57BeOueKpxdwx7WOQTC8i+9VwgL6c?=
 =?us-ascii?Q?Bo47YowWIYW2AVG37lcEF3MX+G1PdDumyKApNAZUhyF0ckIs/RoZGnHkaDlG?=
 =?us-ascii?Q?gB+XX2BEAZ2y3HaEAznXCGc9hL2hktGV5w8M/gQ6KGn8LnV+G6f0cFxw8IPz?=
 =?us-ascii?Q?P4tKmST75x/I2P73imoGr5sFNbnTsPuILeYLVwwu7oQG0b118WTe6EN7qvMa?=
 =?us-ascii?Q?ydiF4LXx6fCVVF3kJ910QBNQOMIy1O4qlXjC0AnQHtznXQLib1YgvJfgSdFG?=
 =?us-ascii?Q?r8DGnNQM/zj/zcdv7fp+vl5upNb9vmGBjGqVHNJAaKPVShskRl5f94qAqtlI?=
 =?us-ascii?Q?MeObfucNfj14ylfZVSOTBe1c7IH2liSA4c016YzPnVsYKff74f01Bo7fv5zB?=
 =?us-ascii?Q?kzdMrL7fL0E=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(1800799024)(376014)(35042699022)(4076899003)(8096899003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2024 10:15:07.0098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c17e963-52fd-4d6b-d014-08dd03cc0c47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5365

--_000_FD24D2231EDF414FBA41112A72F894CDarmcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

On 12 Nov 2024, at 16:11, Julien Grall <julien@xen.org> wrote:

Hi,

On 12/11/2024 16:00, Stewart Hildebrand wrote:
On 11/12/24 08:00, Jan Beulich wrote:
All,

the release is due by the end of the month. Please point out backports you =
find
missing from the respective staging branch, but which you consider relevant=
.

Advance notice: 4.18.4 ought to follow about two weeks later.

Jan

Looking for Julien's input on this one:
35c64c3dce01 ("xen/arm64: entry: Actually skip do_trap_*() when an SError i=
s triggered")
As mentioned in the post-commit notes [0] it's a candidate for backport.

In the past, Stefano handled backports for Arm. I am not sure if this is st=
ill case. Stefano?

[0] https://lore.kernel.org/xen-devel/20240806124815.53492-1-julien@xen.org=
/

Cheers,

--
Julien Grall



Regarding back porting to the 4.19, there is a regression for Arm discussed=
 in the ML and on Matrix, do we want to address it now?

<https://patchwork.kernel.org/project/xen-devel/patch/302647e409d91ea7ed39e=
568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com/>
[v5,1/3] xen/device-tree: Let DT reserve map entries overlap reserved-memor=
y - Patchwork<https://patchwork.kernel.org/project/xen-devel/patch/302647e4=
09d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineerin=
g.com/>
patchwork.kernel.org<https://patchwork.kernel.org/project/xen-devel/patch/3=
02647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptoreng=
ineering.com/>
[X]<https://patchwork.kernel.org/project/xen-devel/patch/302647e409d91ea7ed=
39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering.com/>


<https://patchwork.kernel.org/project/xen-devel/patch/20241106134132.218549=
2-1-luca.fancellu@arm.com/>
xen/device-tree: Allow exact match for overlapping regions - Patchwork<http=
s://patchwork.kernel.org/project/xen-devel/patch/20241106134132.2185492-1-l=
uca.fancellu@arm.com/>
patchwork.kernel.org<https://patchwork.kernel.org/project/xen-devel/patch/2=
0241106134132.2185492-1-luca.fancellu@arm.com/>
[X]<https://patchwork.kernel.org/project/xen-devel/patch/20241106134132.218=
5492-1-luca.fancellu@arm.com/>


Cheers,
Luca

--_000_FD24D2231EDF414FBA41112A72F894CDarmcom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <8AC5EBD7DAC1554097B4C4AF44826FC2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
Hi all,<br id=3D"lineBreakAtBeginningOfMessage">
<div><br>
<blockquote type=3D"cite">
<div>On 12 Nov 2024, at 16:11, Julien Grall &lt;julien@xen.org&gt; wrote:</=
div>
<br class=3D"Apple-interchange-newline">
<div>
<div>Hi,<br>
<br>
On 12/11/2024 16:00, Stewart Hildebrand wrote:<br>
<blockquote type=3D"cite">On 11/12/24 08:00, Jan Beulich wrote:<br>
<blockquote type=3D"cite">All,<br>
<br>
the release is due by the end of the month. Please point out backports you =
find<br>
missing from the respective staging branch, but which you consider relevant=
.<br>
<br>
Advance notice: 4.18.4 ought to follow about two weeks later.<br>
<br>
Jan<br>
<br>
</blockquote>
Looking for Julien's input on this one:<br>
35c64c3dce01 (&quot;xen/arm64: entry: Actually skip do_trap_*() when an SEr=
ror is triggered&quot;)<br>
As mentioned in the post-commit notes [0] it's a candidate for backport.<br=
>
</blockquote>
<br>
In the past, Stefano handled backports for Arm. I am not sure if this is st=
ill case. Stefano?<br>
<br>
<blockquote type=3D"cite">[0] https://lore.kernel.org/xen-devel/20240806124=
815.53492-1-julien@xen.org/<br>
</blockquote>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
<br>
<br>
</div>
</div>
</blockquote>
</div>
<br>
<div>Regarding back porting to the 4.19, there is a regression for Arm disc=
ussed in the ML and on Matrix, do we want to address it now?</div>
<div><br>
</div>
<div>
<div style=3D"display: block;">
<div style=3D"-webkit-user-select: all; -webkit-user-drag: element; display=
: inline-block;" class=3D"apple-rich-link" draggable=3D"true" role=3D"link"=
 data-url=3D"https://patchwork.kernel.org/project/xen-devel/patch/302647e40=
9d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@raptorengineering=
.com/">
<a style=3D"border-radius:10px;font-family:-apple-system, Helvetica, Arial,=
 sans-serif;display:block;-webkit-user-select:none;width:300px;user-select:=
none;-webkit-user-modify:read-only;user-modify:read-only;overflow:hidden;te=
xt-decoration:none;" class=3D"lp-rich-link" rel=3D"nofollow" href=3D"https:=
//patchwork.kernel.org/project/xen-devel/patch/302647e409d91ea7ed39e568dade=
edc572976c3b.1727388925.git.sanastasio@raptorengineering.com/" dir=3D"ltr" =
role=3D"button" draggable=3D"false" width=3D"300">
<table style=3D"table-layout:fixed;border-collapse:collapse;width:300px;bac=
kground-color:#E5E6E9;font-family:-apple-system, Helvetica, Arial, sans-ser=
if;" class=3D"lp-rich-link-emailBaseTable" cellpadding=3D"0" cellspacing=3D=
"0" border=3D"0" width=3D"300">
<tbody>
<tr>
<td vertical-align=3D"center">
<table bgcolor=3D"#E5E6E9" cellpadding=3D"0" cellspacing=3D"0" width=3D"300=
" style=3D"table-layout:fixed;font-family:-apple-system, Helvetica, Arial, =
sans-serif;background-color:rgba(229, 230, 233, 1);" class=3D"lp-rich-link-=
captionBar">
<tbody>
<tr>
<td style=3D"padding:8px 0px 8px 0px;" class=3D"lp-rich-link-captionBar-tex=
tStackItem">
<div style=3D"max-width:100%;margin:0px 16px 0px 16px;overflow:hidden;" cla=
ss=3D"lp-rich-link-captionBar-textStack">
<div style=3D"word-wrap:break-word;font-weight:500;font-size:12px;overflow:=
hidden;text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-capti=
onBar-textStack-topCaption-leading">
<a rel=3D"nofollow" href=3D"https://patchwork.kernel.org/project/xen-devel/=
patch/302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@ra=
ptorengineering.com/" style=3D"text-decoration: none" draggable=3D"false"><=
font color=3D"#272727" style=3D"color: rgba(0, 0, 0, 0.847059);">[v5,1/3]
 xen/device-tree: Let DT reserve map entries overlap reserved-memory - Patc=
hwork</font></a></div>
<div style=3D"word-wrap:break-word;font-weight:400;font-size:11px;overflow:=
hidden;text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-capti=
onBar-textStack-bottomCaption-leading">
<a rel=3D"nofollow" href=3D"https://patchwork.kernel.org/project/xen-devel/=
patch/302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@ra=
ptorengineering.com/" style=3D"text-decoration: none" draggable=3D"false"><=
font color=3D"#808080" style=3D"color: rgba(0, 0, 0, 0.498039);">patchwork.=
kernel.org</font></a></div>
</div>
</td>
<td style=3D"padding:0px 12px 0px 0px;" class=3D"lp-rich-link-captionBar-ri=
ghtIconItem" width=3D"30">
<a rel=3D"nofollow" href=3D"https://patchwork.kernel.org/project/xen-devel/=
patch/302647e409d91ea7ed39e568dadeedc572976c3b.1727388925.git.sanastasio@ra=
ptorengineering.com/" draggable=3D"false"><img src=3D"data:image/png;base64=
,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3D=3D" draggable=3D=
"false" style=3D"pointer-events:none !important;display:inline-block;width:=
30px;height:30px;" class=3D"lp-rich-link-captionBar-rightIcon" width=3D"30"=
 height=3D"30"></a></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</a></div>
</div>
<br>
</div>
<div><br>
</div>
<div>
<div style=3D"display: block;">
<div style=3D"-webkit-user-select: all; -webkit-user-drag: element; display=
: inline-block;" class=3D"apple-rich-link" draggable=3D"true" role=3D"link"=
 data-url=3D"https://patchwork.kernel.org/project/xen-devel/patch/202411061=
34132.2185492-1-luca.fancellu@arm.com/">
<a style=3D"border-radius:10px;font-family:-apple-system, Helvetica, Arial,=
 sans-serif;display:block;-webkit-user-select:none;width:300px;user-select:=
none;-webkit-user-modify:read-only;user-modify:read-only;overflow:hidden;te=
xt-decoration:none;" class=3D"lp-rich-link" rel=3D"nofollow" href=3D"https:=
//patchwork.kernel.org/project/xen-devel/patch/20241106134132.2185492-1-luc=
a.fancellu@arm.com/" dir=3D"ltr" role=3D"button" draggable=3D"false" width=
=3D"300">
<table style=3D"table-layout:fixed;border-collapse:collapse;width:300px;bac=
kground-color:#E5E6E9;font-family:-apple-system, Helvetica, Arial, sans-ser=
if;" class=3D"lp-rich-link-emailBaseTable" cellpadding=3D"0" cellspacing=3D=
"0" border=3D"0" width=3D"300">
<tbody>
<tr>
<td vertical-align=3D"center">
<table bgcolor=3D"#E5E6E9" cellpadding=3D"0" cellspacing=3D"0" width=3D"300=
" style=3D"table-layout:fixed;font-family:-apple-system, Helvetica, Arial, =
sans-serif;background-color:rgba(229, 230, 233, 1);" class=3D"lp-rich-link-=
captionBar">
<tbody>
<tr>
<td style=3D"padding:8px 0px 8px 0px;" class=3D"lp-rich-link-captionBar-tex=
tStackItem">
<div style=3D"max-width:100%;margin:0px 16px 0px 16px;overflow:hidden;" cla=
ss=3D"lp-rich-link-captionBar-textStack">
<div style=3D"word-wrap:break-word;font-weight:500;font-size:12px;overflow:=
hidden;text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-capti=
onBar-textStack-topCaption-leading">
<a rel=3D"nofollow" href=3D"https://patchwork.kernel.org/project/xen-devel/=
patch/20241106134132.2185492-1-luca.fancellu@arm.com/" style=3D"text-decora=
tion: none" draggable=3D"false"><font color=3D"#272727" style=3D"color: rgb=
a(0, 0, 0, 0.847059);">xen/device-tree: Allow
 exact match for overlapping regions - Patchwork</font></a></div>
<div style=3D"word-wrap:break-word;font-weight:400;font-size:11px;overflow:=
hidden;text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-capti=
onBar-textStack-bottomCaption-leading">
<a rel=3D"nofollow" href=3D"https://patchwork.kernel.org/project/xen-devel/=
patch/20241106134132.2185492-1-luca.fancellu@arm.com/" style=3D"text-decora=
tion: none" draggable=3D"false"><font color=3D"#808080" style=3D"color: rgb=
a(0, 0, 0, 0.498039);">patchwork.kernel.org</font></a></div>
</div>
</td>
<td style=3D"padding:0px 12px 0px 0px;" class=3D"lp-rich-link-captionBar-ri=
ghtIconItem" width=3D"30">
<a rel=3D"nofollow" href=3D"https://patchwork.kernel.org/project/xen-devel/=
patch/20241106134132.2185492-1-luca.fancellu@arm.com/" draggable=3D"false">=
<img src=3D"data:image/png;base64,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
ABJRU5ErkJggg=3D=3D" draggable=3D"false" style=3D"pointer-events:none !impo=
rtant;display:inline-block;width:30px;height:30px;" class=3D"lp-rich-link-c=
aptionBar-rightIcon" width=3D"30" height=3D"30"></a></td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</a></div>
</div>
<br>
</div>
<div><br>
</div>
<div>Cheers,</div>
<div>Luca</div>
</body>
</html>

--_000_FD24D2231EDF414FBA41112A72F894CDarmcom_--

