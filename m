Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FFE8FC952
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2024 12:46:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735702.1141816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEo97-0005LZ-Kk; Wed, 05 Jun 2024 10:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735702.1141816; Wed, 05 Jun 2024 10:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sEo97-0005J0-HE; Wed, 05 Jun 2024 10:45:33 +0000
Received: by outflank-mailman (input) for mailman id 735702;
 Wed, 05 Jun 2024 10:45:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JX9+=NH=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sEo95-0005Is-EU
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2024 10:45:31 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on20601.outbound.protection.outlook.com
 [2a01:111:f403:2602::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b935038d-2328-11ef-b4bb-af5377834399;
 Wed, 05 Jun 2024 12:45:28 +0200 (CEST)
Received: from DUZPR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::19) by DB3PR08MB8818.eurprd08.prod.outlook.com
 (2603:10a6:10:434::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Wed, 5 Jun
 2024 10:45:22 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::2e) by DUZPR01CA0041.outlook.office365.com
 (2603:10a6:10:468::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Wed, 5 Jun 2024 10:45:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Wed, 5 Jun 2024 10:45:22 +0000
Received: ("Tessian outbound 9d4318e1cabb:v327");
 Wed, 05 Jun 2024 10:45:22 +0000
Received: from 56c1d574a776.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F429AEC-BDF5-4D84-846E-ADD26D9B47FE.1; 
 Wed, 05 Jun 2024 10:45:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56c1d574a776.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jun 2024 10:45:15 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS1PR08MB7588.eurprd08.prod.outlook.com (2603:10a6:20b:474::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Wed, 5 Jun
 2024 10:45:12 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 10:45:12 +0000
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
X-Inumbo-ID: b935038d-2328-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VO4JDPCBqTpDnQXOt+tqICWLh5da9Yff8jF8dRxDHvlOf7TpeI6xAUWJnZp4aPeB3JwJCJzJMuEsLejXJaQTwe5AAHGwMDrM4W9NbSKuoeS7ffRsK9X9U7j5x2JD9pTs0G3XdCUKiBAV3iOcBAV/iiaA5Ri1dU/sBiX8IDeqPZxR81XPjfp3wSug/tP1ZfzBbxIE83mvF4EhBPpphtjlP9GCt91xy3GGoO2jWK6Un00gi+6Q1g0H/rSqsh+ub+3pNwuMcaOLyy9Xh6JQ4YY+ulQgDQhRBzPZYXCbSi8xdnhIkE9+pu3hpl87dQA2O+AwiahGButBxm8ncsIn6BaImw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTYS+Oeb4/va+Us/z7iMi2OVLLf4UT+d7XqTwufYGmQ=;
 b=jo20mTOHl64balE9sPwSEqM+lR7L1bQmwLGfiuKPC2dxivDnkTUfxy/jqBJ2mR1KAICwD3LikZ7eFqkK9DbAOaznxm2SQtWyYY+bSLnDSrEVCapa6OfuELZCdqOK7rYw/EuhzPM/mAKYWcRfOiO2h8ldUnbY+H7j6NBEOkadJydjjhXcoQ0R211BXXUnLZnODy7WLn5dQflVnLvb7AJ0lgVxW1pOduQ5I6hT450yQcQSpqfHqTUEHuPM9yiYcIdp/AQSbVw5zbFN/rTx9YRWvw/fJkic3aZSd1Db1wANl/73X5hpTYXU0S+aao949U/wbp4JUDcCgbrHi49YsC70ZQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTYS+Oeb4/va+Us/z7iMi2OVLLf4UT+d7XqTwufYGmQ=;
 b=YnjyPzOBmHtm8YjcIAtTVvbz7idK8x0NYOTL1KhE+llMLDLSnq0q3QjBAr5pUcc1uKaF+z/U3wngDvixU5bMafmMVzz7UwtQycCUDRW83H2msDxjlBn7F5K7EA/ST36LNB7xG3lnQA8pjkHklSUMvM6zJBKdTu6cKClnyLjQjOw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ef224ef629620261
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDmOlUcYejyN2awfXF4QX6pbJ+IjonMte7NfXrf7Rkwcd0TRxPr0Akb6nzMlHiNhsyQM4PDGXTHy6jHcVuDRB3DNO5sbc5Vo4bEDpLdFBWRyGX6CLtqV4qQIGw9lzxSUX9cTcddnztP5O8Ko7ZOiMgCytfXgb0jl8Y055V/R7W0xpSnDl5Kv/qs9UZuxK8Pa91kLsnoTMWmGfd7uSpV28+ZJ6GjhLwhm+v5iY9GkHWW51feIyDY1rtcxzVUgxlCIFO5uUDw7GWQZvajIAMxY6f4GeQdY7PfkBOWe8FA07n3Uw/v9BImaKKNTCcQaRu0R0F4jOJL5QtP95v90U0DXtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTYS+Oeb4/va+Us/z7iMi2OVLLf4UT+d7XqTwufYGmQ=;
 b=ZNG1PMTWB+gSKk1AdFQzdF5daF6tQZmnxc+cfViL8VXw9cgoy/M3L0sX20N4+eYoU3GgoEr5qIHFoNkBDcuer52N+T9mBYvpUWUBWGfGugsXO1EknYz17bIETToy2rfSAGot0F5G7/U2PpuDZVkspfh5r2WU2Eb/DDQlLHZVKynOM96yIHWPwJTysLwsSLsmQEae9PpL0ucrFTLx4Lvwe1gom3qCKpNcKvi+2nodj4xffYSp5GZ0k9mckPbnap3F4nFUutqqvxs6rqrtAYGCqxiH38z4mJ2LRwrkCvD+3yiDRbD+gvRATLSYkE0qZ1ZO3Um7UtD37h5Lovd9EzGPBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTYS+Oeb4/va+Us/z7iMi2OVLLf4UT+d7XqTwufYGmQ=;
 b=YnjyPzOBmHtm8YjcIAtTVvbz7idK8x0NYOTL1KhE+llMLDLSnq0q3QjBAr5pUcc1uKaF+z/U3wngDvixU5bMafmMVzz7UwtQycCUDRW83H2msDxjlBn7F5K7EA/ST36LNB7xG3lnQA8pjkHklSUMvM6zJBKdTu6cKClnyLjQjOw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v5 7/7] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v5 7/7] xen/arm: ffa: support notification
Thread-Index:
 AQHasZmLIIIAu+VRvk26HUXX7ib+FLGxammAgARbjQCAAAMkAIAACp2AgAGsrYCAAYc/AA==
Date: Wed, 5 Jun 2024 10:45:12 +0000
Message-ID: <D56844C2-D602-4109-BF9D-6FCD59B532EC@arm.com>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-8-jens.wiklander@linaro.org>
 <C52D6A7C-1136-4BF1-9060-600157F641F5@arm.com>
 <CAHUa44GRNQV4X61YPZTxO+tkkwJS9hoqQ07U9vP1k6n1zUt9rQ@mail.gmail.com>
 <39045a8f-ea18-4264-b540-66645751d27d@xen.org>
 <CAHUa44Hrm7p9MyTwsp+XU+EAMPXb+bi0a7P8sbhsvz2Tobozow@mail.gmail.com>
 <ad94bed4-42a1-4c59-afc1-a542c9a406ea@xen.org>
In-Reply-To: <ad94bed4-42a1-4c59-afc1-a542c9a406ea@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS1PR08MB7588:EE_|DB5PEPF00014B8D:EE_|DB3PR08MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ad0a8d-3998-48e3-8753-08dc854c99b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WG5zSWpBZmRuK05KUGs0MGtUMGxHVGtxNmZRK2YxU09RdlY1RVU5OXllS1lw?=
 =?utf-8?B?VndqZmt4STcvb3VockhiM3c2U0g2Nk1rWm9CTytWUUVwTDA3ZmZDYVc3VnFh?=
 =?utf-8?B?cHpWS0FBcUJHcnhDVDYvSXk2TWtCYnJKZy84dFRjdmpXRytVdWlWOERiak9U?=
 =?utf-8?B?QTdNK1R2M3VZNlVwaUpib0JoZjFIUmdkOEc0V21KbWhMV1FBZVVsUnlreUMv?=
 =?utf-8?B?ZFhYYUZ5Y3J4eklWN2wySCs3eWRLdUpHTnd1a2hoNytLL1A1b3J0MU5DMlo3?=
 =?utf-8?B?WjRZTXo0QW05cUovRVBueHNreHpEMTlBVEVPL3Z1aFEvNTJFeGRrQVk4NHQ1?=
 =?utf-8?B?bXJmN2Z0K09kV3VhUE1DMG9KMlc2UEZRbkNUOUM4MThSRmFDRkduV2t1bDNQ?=
 =?utf-8?B?TWVvYW5Mc1BLQ1hXcHQxc2ZVQUhvb3RXNG1CVkVhYWVlVnJNZTlkUENUQ3dZ?=
 =?utf-8?B?QXY2QUZieC8xZHdjKzJwQ3Y1b2R2Y28wUTh0MkgxWit6bGxUTVFOYTJZa05p?=
 =?utf-8?B?dXZ3elRxaEtsVjY5N3lCM0R0cEtxN0pBcWxudWZOaWwxQXFhbEpjQmJXWGJ0?=
 =?utf-8?B?bVcwOFo1bmlYR2VQZDhOQUhNdHdERlgwUXJ2K0tpblZEY3JDMFhwQVp2SXdl?=
 =?utf-8?B?ZEkwUkx3aHloOTJuakVkVTFYRWxnMUdCLzFBb0s1blpSSjhPdGdrRGFjUWxo?=
 =?utf-8?B?MDFxenRQS3lSZUZRcUErbjg0ZVJoa0Q5TExneElwNUFobExjMStkd3ZQMkdo?=
 =?utf-8?B?VFY3ZnVjT2RIYmx1V3pDOUw4V3RpSGpMU2h0QTlEUEpISUkyUTdnVDRxVmtV?=
 =?utf-8?B?bWxISHZESXMzTmpPNG5uVkNBZTFoWDIrb3pzRjdiK2s2Rjd5WWttWVVNK0N5?=
 =?utf-8?B?VXRYNnc5N1VnRlgvZ0YxajVwMnlNNXQ1Wlp6VVZUQ05RK054MVRqUnU0Y1lw?=
 =?utf-8?B?NCtLMkZqbjlxSENNdmpMVE5RWmtySG1JOW5aS1U5RTlYYkIyNmE5SlRpRUFE?=
 =?utf-8?B?Rk9EcDA1MUp1T1ZMdVRyMkFXc1l5eGhLVmdVOTkwOXI4NGZxeW5PYWdyY05h?=
 =?utf-8?B?Zk4yaWtLcitEaXVJNEtHak11dHpwK1lmWjR0b0g3cnNzLzBFSVpicTNHMkxF?=
 =?utf-8?B?azJCN1ZnQ1NBSXBxcUR3b0h5VTJsN3NBUEVSTU5TaGgrbnlxQUYyMkRYUysy?=
 =?utf-8?B?N2pRVEpveWxWejQ0RzJ4MFZsU2lmVitBVWVDYmhuZDFPMGloMkNxUHNSZmtM?=
 =?utf-8?B?bjRjSVBvRFZuVlpjc3I4WHMvMTgrdHhySEFBYVNJRmN4MWtlU0xUM1BrMkxx?=
 =?utf-8?B?M3FHRnFWcUFUbHhBN3RlSFpTYUxwdUVEYXJlZFB0VlJpdm04Q0hkUjBBdEZr?=
 =?utf-8?B?T0xWMTlsbTBHdFhvS3VVN1NBbmkzVnpxdUhyQVBDd2pMWE5CL2wvUXhLNmlF?=
 =?utf-8?B?WUU2MTdwdWF1UlpPei9KYVh5MDcxdUhwV2psUVdjcDloS0g2L1F4MisyM1J5?=
 =?utf-8?B?aGs4K1FnYzdyUXVlcUZ5NGs0NnFHTml3b2doZHM3cjhMb2xiRUpzQ2xvRkVm?=
 =?utf-8?B?S1JvR3lkOTVCNGQ5MlQwY1c5WlI0ZHNwTmZudkdTbnZlZlIraC93U2NxYVEy?=
 =?utf-8?B?VGNrNGs4QmRlcVdTS2dwdGJlbkk2MEZjODZYTlhkRENuT29IQ1hVelF4SHJm?=
 =?utf-8?B?K3lrdzk3czQySjZSYlh3VXRScGplS1ZaMzV4RHBUUDBjM1BHQnF4TzhHMnhi?=
 =?utf-8?B?dytBSGQ1V1dUb3hWQnZmbnJFYnlxWldpUmRaUFRGUitmZnB1Zkc1c1pnb0VR?=
 =?utf-8?Q?2SdwYqBcephSnQxWignBdWznuitHmP5u9+U4k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6082E90B1E056F469866944D8890B770@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7588
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3fa1cfb3-1822-41de-5173-08dc854c93e3
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|35042699013|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVZuUVlXZ1pJOVJLRmRleVo5TlZsMlREMWpOMzZucVV4a2F6d0Z5TGxTUm80?=
 =?utf-8?B?Z3M4aDhoa0RUYWx0bFJYR0JMT1B5THNJUW9qM0d4eVZ4N0FwRkZWVTBJRkdk?=
 =?utf-8?B?R09pTWlYLytLODJadzFuMGJqUlpZcXk2UUhTbWxHUVJRTmRCNkx4REhyekZ4?=
 =?utf-8?B?L0tiellMQnFyMjVHSlNjUDlFYlRGamhqWDUrT2ZWeXhodnVWZ0lYbmlUREVR?=
 =?utf-8?B?eWlrbXZGR1RCOW9BNmhoYklrRHhzMDJ1RWxGaFFlQWcwWjJBcFBSWEJLbjV3?=
 =?utf-8?B?c2diUFBhSng4eFBEM3ZyQ3VrZlNRLzNKR1ZTaVNEM0loSS8zT3ltcnBETisw?=
 =?utf-8?B?V1lNL0ZjSklFaXJ4WkJoU0QrUmNXRGJDMU9uN2tuNEdqVVcwOE5zVXpwek9k?=
 =?utf-8?B?WlR6d1prV0ZnUG9JbVZsWnlyWGNOMm1lUkV0bnVsc1NwZmY2bzJPTHFtREMy?=
 =?utf-8?B?eVRjcDA5c25YNUhVME1hSEExaXNJOWpKV0Q2YzRETnlKRzRFZEIwTytRNG1i?=
 =?utf-8?B?S2hoUHlsc2wyT3prc1pScFRRQUxyS2xBL09xZVRONi9jV3dZVFB6NHhhWXdP?=
 =?utf-8?B?eW9NYnFPRkNsNVY0alVPYlJjdmpwcFZ1Z2x5a3ZVa1NkbHpRRG02VkpNYktR?=
 =?utf-8?B?ZkZncDNuTmR3dDB4UVVhRnRKWjdGaE1OOXAreFJIT29HYmFuUEhHVVZORTlB?=
 =?utf-8?B?NWorL2RkeTJIR3lKVkNSVWlUNXp4QVR1SWVtR3RSYUJrb3R5U0xid0ZaZmlG?=
 =?utf-8?B?bmxmWm42eE56emZTUEI1MFhYMm0xOUxyYnpmRXhOSE1OM1lIUU5NVXk0bnJv?=
 =?utf-8?B?Y3FsTm5xMUowWjJ2eHEveHBmNzdsL0hRTE5CcW1NOW96Qkp0Yjl6c1ZxNktj?=
 =?utf-8?B?YWhDSVk2NFdkSDBnTUNBS0NLU3l1bWgxMlJpYnErS3U3V0U0YWhCcGNxRU1q?=
 =?utf-8?B?ZTRiWFdlaU9hdEFjdjZhbStSTXRTWmV1RndnN0tDZ0NFTmltOXhvZHFaSHIr?=
 =?utf-8?B?dDRGS0loYStmMERCdVlNM3FHVlFHdUFLb1lyYnV3LzQzSlViYysxVlFBU05I?=
 =?utf-8?B?LzBnUzU2djdPYm1KK0kyK0lHZzhSUFAyZGE3eVY4VWphbjZ6YnpkN293NUVr?=
 =?utf-8?B?a2JFZjVaMEhtZUcrSmQ3SU5MWS9pc2dnUm9mbkJNQThDU1JVQURKRDFyTWM1?=
 =?utf-8?B?Uit2SmdzejAwZ3NzNStkbVFrTUYrbno4NXQyV0J6dFR0WlRqSkpGMkFuUThp?=
 =?utf-8?B?cFY2ek4xUi9MMEJVZ3BKeld6NWpWT0RiQkx6L2NrVjlWRmRnOWVaSmtjZXRu?=
 =?utf-8?B?eStreDNPTVYxbkpFdStKNmw0bnV1L3N4a1pUOXJNemkrdTVJdHlIaVRRSmZI?=
 =?utf-8?B?dWE4WFo1T1FtWWNuMmlTUmVqNElGeXNzV2tOY0I2bUlUcFlrbFlOREl1NGZY?=
 =?utf-8?B?VmMyYktHeUdLanFTcXZrbzllQ084QkcrbjRnamRnbTczWnczMDdCbWl4YWlh?=
 =?utf-8?B?dFVUSlFHU1NzajBtVk1KbWNIdzI2eGNhSTU1Yk9PQmZZdVNNUGRTS2EyWEJN?=
 =?utf-8?B?UkJsNVd4VUFaZVZUa1RwWXI4d2NIcEdEV2E5YjFHRUwrMkorYzgwaXhHM2x2?=
 =?utf-8?B?MHRMcDNvaFh2Z2JkbmlyVXl0OXlXYWR0eVBNNHlEV2lxT2RTM0dIdnBhcFdl?=
 =?utf-8?B?b2dtbjFEQzJWYlF1cFdJS2FrUU0wYWl0ZGtjUjJJemgrN0hvVjE0c29INVF1?=
 =?utf-8?B?L3JZVUgxdU1oRVJKSkY2S2ZtQ0FuUTRhTnRETFFwQzVLc0lrSy83MjhXNVpN?=
 =?utf-8?B?UHYycjVnbzJ6a2tTMmM4aFUzRGxPZFR1ZWVuaEZoUXZjNzFydDhuTEZBWXU1?=
 =?utf-8?Q?AiC/bCqZ9vmmg?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(35042699013)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 10:45:22.2299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ad0a8d-3998-48e3-8753-08dc854c99b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8818

SGksDQoNCj4gT24gNCBKdW4gMjAyNCwgYXQgMTI6MjQsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAwMy8wNi8yMDI0IDEwOjUwLCBKZW5zIFdp
a2xhbmRlciB3cm90ZToNCj4+IEhpIEp1bGllbiwNCj4gDQo+IEhpIEplbnMsDQo+IA0KPiANCj4+
IE9uIE1vbiwgSnVuIDMsIDIwMjQgYXQgMTE6MTLigK9BTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBKZW5zLA0KPj4+IA0KPj4+IE9uIDAzLzA2LzIw
MjQgMTA6MDEsIEplbnMgV2lrbGFuZGVyIHdyb3RlOg0KPj4+PiBPbiBGcmksIE1heSAzMSwgMjAy
NCBhdCA0OjI44oCvUE0gQmVydHJhbmQgTWFycXVpcw0KPj4+PiA8QmVydHJhbmQuTWFycXVpc0Bh
cm0uY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gSGkgSmVucywNCj4+Pj4+IA0KPj4+Pj4+IE9u
IDI5IE1heSAyMDI0LCBhdCAwOToyNSwgSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxp
bmFyby5vcmc+IHdyb3RlOg0KPj4+Pj4+IA0KPj4+Pj4+IEFkZCBzdXBwb3J0IGZvciBGRi1BIG5v
dGlmaWNhdGlvbnMsIGN1cnJlbnRseSBsaW1pdGVkIHRvIGFuIFNQIChTZWN1cmUNCj4+Pj4+PiBQ
YXJ0aXRpb24pIHNlbmRpbmcgYW4gYXN5bmNocm9ub3VzIG5vdGlmaWNhdGlvbiB0byBhIGd1ZXN0
Lg0KPj4+Pj4+IA0KPj4+Pj4+IEd1ZXN0cyBhbmQgWGVuIGl0c2VsZiBhcmUgbWFkZSBhd2FyZSBv
ZiBwZW5kaW5nIG5vdGlmaWNhdGlvbnMgd2l0aCBhbg0KPj4+Pj4+IGludGVycnVwdC4gVGhlIGlu
dGVycnVwdCBoYW5kbGVyIHRyaWdnZXJzIGEgdGFza2xldCB0byByZXRyaWV2ZSB0aGUNCj4+Pj4+
PiBub3RpZmljYXRpb25zIHVzaW5nIHRoZSBGRi1BIEFCSSBhbmQgZGVsaXZlciB0aGVtIHRvIHRo
ZWlyIGRlc3RpbmF0aW9ucy4NCj4+Pj4+PiANCj4+Pj4+PiBVcGRhdGUgZmZhX3BhcnRpbmZvX2Rv
bWFpbl9pbml0KCkgdG8gcmV0dXJuIGVycm9yIGNvZGUgbGlrZQ0KPj4+Pj4+IGZmYV9ub3RpZl9k
b21haW5faW5pdCgpLg0KPj4+Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEplbnMgV2lrbGFu
ZGVyIDxqZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+IHY0LT52
NToNCj4+Pj4+PiAtIE1vdmUgdGhlIGZyZWVpbmcgb2YgZC0+YXJjaC50ZWUgdG8gdGhlIG5ldyBU
RUUgbWVkaWF0b3IgZnJlZV9kb21haW5fY3R4DQo+Pj4+Pj4gICBjYWxsYmFjayB0byBtYWtlIHRo
ZSBjb250ZXh0IGFjY2Vzc2libGUgZHVyaW5nIHJjdV9sb2NrX2RvbWFpbl9ieV9pZCgpDQo+Pj4+
Pj4gICBmcm9tIGEgdGFza2xldA0KPj4+Pj4+IC0gSW5pdGlhbGl6ZSBpbnRlcnJ1cHQgaGFuZGxl
cnMgZm9yIHNlY29uZGFyeSBDUFVzIGZyb20gdGhlIG5ldyBURUUgbWVkaWF0b3INCj4+Pj4+PiAg
IGluaXRfaW50ZXJydXB0KCkgY2FsbGJhY2sNCj4+Pj4+PiAtIFJlc3RvcmUgdGhlIGZmYV9wcm9i
ZSgpIGZyb20gdjMsIHRoYXQgaXMsIHJlbW92ZSB0aGUNCj4+Pj4+PiAgIHByZXNtcF9pbml0Y2Fs
bChmZmFfaW5pdCkgYXBwcm9hY2ggYW5kIHVzZSBmZmFfcHJvYmUoKSBhcyB1c3VhbCBub3cgdGhh
dCB3ZQ0KPj4+Pj4+ICAgaGF2ZSB0aGUgaW5pdF9pbnRlcnJ1cHQgY2FsbGJhY2suDQo+Pj4+Pj4g
LSBBIHRhc2tsZXQgaXMgYWRkZWQgdG8gaGFuZGxlIHRoZSBTY2hlZHVsZSBSZWNlaXZlciBpbnRl
cnJ1cHQuIFRoZSB0YXNrbGV0DQo+Pj4+Pj4gICBmaW5kcyBlYWNoIHJlbGV2YW50IGRvbWFpbiB3
aXRoIHJjdV9sb2NrX2RvbWFpbl9ieV9pZCgpIHdoaWNoIG5vdyBpcyBlbm91Z2gNCj4+Pj4+PiAg
IHRvIGd1YXJhbnRlZSB0aGF0IHRoZSBGRi1BIGNvbnRleHQgY2FuIGJlIGFjY2Vzc2VkLg0KPj4+
Pj4+IC0gVGhlIG5vdGlmaWNhdGlvbiBpbnRlcnJ1cHQgaGFuZGxlciBvbmx5IHNjaGVkdWxlcyB0
aGUgbm90aWZpY2F0aW9uDQo+Pj4+Pj4gICB0YXNrbGV0IG1lbnRpb25lZCBhYm92ZQ0KPj4+Pj4+
IA0KPj4+Pj4+IHYzLT52NDoNCj4+Pj4+PiAtIEFkZCBhbm90aGVyIG5vdGUgb24gRkYtQSBsaW1p
dGF0aW9ucw0KPj4+Pj4+IC0gQ2xlYXIgc2VjdXJlX3BlbmRpbmcgaW4gZmZhX2hhbmRsZV9ub3Rp
ZmljYXRpb25fZ2V0KCkgaWYgYm90aCBTUCBhbmQgU1BNDQo+Pj4+Pj4gICBiaXRtYXBzIGFyZSBy
ZXRyaWV2ZWQNCj4+Pj4+PiAtIEFTU0VSVCB0aGF0IGZmYV9yY3VfbG9ja19kb21haW5fYnlfdm1f
aWQoKSBpc24ndCBwYXNzZWQgdGhlIHZtX2lkIEZGLUENCj4+Pj4+PiAgIHVzZXMgZm9yIFhlbiBp
dHNlbGYNCj4+Pj4+PiAtIFJlcGxhY2UgdGhlIGdldF9kb21haW5fYnlfaWQoKSBjYWxsIGRvbmUg
dmlhIGZmYV9nZXRfZG9tYWluX2J5X3ZtX2lkKCkgaW4NCj4+Pj4+PiAgIG5vdGlmX2lycV9oYW5k
bGVyKCkgd2l0aCBhIGNhbGwgdG8gcmN1X2xvY2tfbGl2ZV9yZW1vdGVfZG9tYWluX2J5X2lkKCkg
dmlhDQo+Pj4+Pj4gICBmZmFfcmN1X2xvY2tfZG9tYWluX2J5X3ZtX2lkKCkNCj4+Pj4+PiAtIFJl
bW92ZSBzcGlubG9jayBpbiBzdHJ1Y3QgZmZhX2N0eF9ub3RpZiBhbmQgdXNlIGF0b21pYyBmdW5j
dGlvbnMgYXMgbmVlZGVkDQo+Pj4+Pj4gICB0byBhY2Nlc3MgYW5kIHVwZGF0ZSB0aGUgc2VjdXJl
X3BlbmRpbmcgZmllbGQNCj4+Pj4+PiAtIEluIG5vdGlmX2lycV9oYW5kbGVyKCksIGxvb2sgZm9y
IHRoZSBmaXJzdCBvbmxpbmUgQ1BVIGluc3RlYWQgb2YgYXNzdW1pbmcNCj4+Pj4+PiAgIHRoYXQg
dGhlIGZpcnN0IENQVSBpcyBvbmxpbmUNCj4+Pj4+PiAtIEluaXRpYWxpemUgRkYtQSB2aWEgcHJl
c21wX2luaXRjYWxsKCkgYmVmb3JlIHRoZSBvdGhlciBDUFVzIGFyZSBvbmxpbmUsDQo+Pj4+Pj4g
ICB1c2UgcmVnaXN0ZXJfY3B1X25vdGlmaWVyKCkgdG8gaW5zdGFsbCB0aGUgaW50ZXJydXB0IGhh
bmRsZXINCj4+Pj4+PiAgIG5vdGlmX2lycV9oYW5kbGVyKCkNCj4+Pj4+PiAtIFVwZGF0ZSBjb21t
aXQgbWVzc2FnZSB0byByZWZsZWN0IHJlY2VudCB1cGRhdGVzDQo+Pj4+Pj4gDQo+Pj4+Pj4gdjIt
PnYzOg0KPj4+Pj4+IC0gQWRkIGEgR1VFU1RfIHByZWZpeCBhbmQgbW92ZSBGRkFfTk9USUZfUEVO
RF9JTlRSX0lEIGFuZA0KPj4+Pj4+ICAgRkZBX1NDSEVEVUxFX1JFQ1ZfSU5UUl9JRCB0byBwdWJs
aWMvYXJjaC1hcm0uaA0KPj4+Pj4+IC0gUmVnaXN0ZXIgdGhlIFhlbiBTUkkgaGFuZGxlciBvbiBl
YWNoIENQVSB1c2luZyBvbl9zZWxlY3RlZF9jcHVzKCkgYW5kDQo+Pj4+Pj4gICBzZXR1cF9pcnEo
KQ0KPj4+Pj4+IC0gQ2hlY2sgdGhhdCB0aGUgU0dJIElEIHJldHJpZXZlZCB3aXRoIEZGQV9GRUFU
VVJFX1NDSEVEVUxFX1JFQ1ZfSU5UUg0KPj4+Pj4+ICAgZG9lc24ndCBjb25mbGljdCB3aXRoIHN0
YXRpYyBTR0kgaGFuZGxlcnMNCj4+Pj4+PiANCj4+Pj4+PiB2MS0+djI6DQo+Pj4+Pj4gLSBBZGRy
ZXNzaW5nIHJldmlldyBjb21tZW50cw0KPj4+Pj4+IC0gQ2hhbmdlIGZmYV9oYW5kbGVfbm90aWZp
Y2F0aW9uX3tiaW5kLHVuYmluZCxzZXR9KCkgdG8gdGFrZSBzdHJ1Y3QNCj4+Pj4+PiAgIGNwdV91
c2VyX3JlZ3MgKnJlZ3MgYXMgYXJndW1lbnQuDQo+Pj4+Pj4gLSBVcGRhdGUgZmZhX3BhcnRpbmZv
X2RvbWFpbl9pbml0KCkgYW5kIGZmYV9ub3RpZl9kb21haW5faW5pdCgpIHRvIHJldHVybg0KPj4+
Pj4+ICAgYW4gZXJyb3IgY29kZS4NCj4+Pj4+PiAtIEZpeGluZyBhIGJ1ZyBpbiBoYW5kbGVfZmVh
dHVyZXMoKSBmb3IgRkZBX0ZFQVRVUkVfU0NIRURVTEVfUkVDVl9JTlRSLg0KPj4+Pj4+IC0tLQ0K
Pj4+Pj4+IHhlbi9hcmNoL2FybS90ZWUvTWFrZWZpbGUgICAgICAgfCAgIDEgKw0KPj4+Pj4+IHhl
bi9hcmNoL2FybS90ZWUvZmZhLmMgICAgICAgICAgfCAgNzIgKysrKystDQo+Pj4+Pj4geGVuL2Fy
Y2gvYXJtL3RlZS9mZmFfbm90aWYuYyAgICB8IDQwOSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKw0KPj4+Pj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3BhcnRpbmZvLmMgfCAgIDkgKy0N
Cj4+Pj4+PiB4ZW4vYXJjaC9hcm0vdGVlL2ZmYV9wcml2YXRlLmggIHwgIDU2ICsrKystDQo+Pj4+
Pj4geGVuL2FyY2gvYXJtL3RlZS90ZWUuYyAgICAgICAgICB8ICAgMiArLQ0KPj4+Pj4+IHhlbi9p
bmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oICAgfCAgMTQgKysNCj4+Pj4+PiA3IGZpbGVzIGNoYW5n
ZWQsIDU0OCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4+Pj4+PiBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3RlZS9mZmFfbm90aWYuYw0KPj4+Pj4+IA0KPj4+PiBbLi4u
XQ0KPj4+Pj4+IA0KPj4+Pj4+IEBAIC01MTcsOCArNTY3LDEwIEBAIGVycl9yeHR4X2Rlc3Ryb3k6
DQo+Pj4+Pj4gc3RhdGljIGNvbnN0IHN0cnVjdCB0ZWVfbWVkaWF0b3Jfb3BzIGZmYV9vcHMgPQ0K
Pj4+Pj4+IHsNCj4+Pj4+PiAgICAgIC5wcm9iZSA9IGZmYV9wcm9iZSwNCj4+Pj4+PiArICAgIC5p
bml0X2ludGVycnVwdCA9IGZmYV9ub3RpZl9pbml0X2ludGVycnVwdCwNCj4+Pj4+IA0KPj4+Pj4g
V2l0aCB0aGUgcHJldmlvdXMgY2hhbmdlIG9uIGluaXQgc2Vjb25kYXJ5IGkgd291bGQgc3VnZ2Vz
dCB0bw0KPj4+Pj4gaGF2ZSBhIGZmYV9pbml0X3NlY29uZGFyeSBoZXJlIGFjdHVhbGx5IGNhbGxp
bmcgdGhlIGZmYV9ub3RpZl9pbml0X2ludGVycnVwdC4NCj4+Pj4gDQo+Pj4+IFllcywgdGhhdCBt
YWtlcyBzZW5zZS4gSSdsbCB1cGRhdGUuDQo+Pj4+IA0KPj4+Pj4gDQo+Pj4+Pj4gICAgICAuZG9t
YWluX2luaXQgPSBmZmFfZG9tYWluX2luaXQsDQo+Pj4+Pj4gICAgICAuZG9tYWluX3RlYXJkb3du
ID0gZmZhX2RvbWFpbl90ZWFyZG93biwNCj4+Pj4+PiArICAgIC5mcmVlX2RvbWFpbl9jdHggPSBm
ZmFfZnJlZV9kb21haW5fY3R4LA0KPj4+Pj4+ICAgICAgLnJlbGlucXVpc2hfcmVzb3VyY2VzID0g
ZmZhX3JlbGlucXVpc2hfcmVzb3VyY2VzLA0KPj4+Pj4+ICAgICAgLmhhbmRsZV9jYWxsID0gZmZh
X2hhbmRsZV9jYWxsLA0KPj4+Pj4+IH07DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS90ZWUvZmZhX25vdGlmLmMgYi94ZW4vYXJjaC9hcm0vdGVlL2ZmYV9ub3RpZi5jDQo+Pj4+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmU4ZThiNjI1
OTBiMw0KPj4+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vdGVl
L2ZmYV9ub3RpZi5jDQo+Pj4+IFsuLi5dDQo+Pj4+Pj4gK3N0YXRpYyB2b2lkIG5vdGlmX3ZtX3Bl
bmRfaW50cih1aW50MTZfdCB2bV9pZCkNCj4+Pj4+PiArew0KPj4+Pj4+ICsgICAgc3RydWN0IGZm
YV9jdHggKmN0eDsNCj4+Pj4+PiArICAgIHN0cnVjdCBkb21haW4gKmQ7DQo+Pj4+Pj4gKyAgICBz
dHJ1Y3QgdmNwdSAqdjsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAvKg0KPj4+Pj4+ICsgICAgICog
dm1faWQgPT0gMCBtZWFucyBhIG5vdGlmaWNhdGlvbnMgcGVuZGluZyBmb3IgWGVuIGl0c2VsZiwg
YnV0DQo+Pj4+Pj4gKyAgICAgKiB3ZSBkb24ndCBzdXBwb3J0IHRoYXQgeWV0Lg0KPj4+Pj4+ICsg
ICAgICovDQo+Pj4+Pj4gKyAgICBpZiAoICF2bV9pZCApDQo+Pj4+Pj4gKyAgICAgICAgcmV0dXJu
Ow0KPj4+Pj4+ICsNCj4+Pj4+PiArICAgIGQgPSBmZmFfcmN1X2xvY2tfZG9tYWluX2J5X3ZtX2lk
KHZtX2lkKTsNCj4+Pj4+PiArICAgIGlmICggIWQgKQ0KPj4+Pj4+ICsgICAgICAgIHJldHVybjsN
Cj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICBjdHggPSBkLT5hcmNoLnRlZTsNCj4+Pj4+PiArICAgIGlm
ICggIWN0eCApDQo+Pj4+Pj4gKyAgICAgICAgZ290byBvdXRfdW5sb2NrOw0KPj4+Pj4gDQo+Pj4+
PiBJbiBib3RoIHByZXZpb3VzIGNhc2VzIHlvdSBhcmUgc2lsZW50bHkgaWdub3JpbmcgYW4gaW50
ZXJydXB0DQo+Pj4+PiBkdWUgdG8gYW4gaW50ZXJuYWwgZXJyb3IuDQo+Pj4+PiBJcyB0aGlzIHNv
bWV0aGluZyB0aGF0IHdlIHNob3VsZCB0cmFjZSA/IG1heWJlIGp1c3QgZGVidWcgPw0KPj4+Pj4g
DQo+Pj4+PiBDb3VsZCB5b3UgYWRkIGEgY29tbWVudCB0byBleHBsYWluIHdoeSB0aGlzIGNvdWxk
IGhhcHBlbg0KPj4+Pj4gKHdoZW4gcG9zc2libGUpIG9yIG5vdCBhbmQgdGhlIHBvc3NpYmxlIHNp
ZGUgZWZmZWN0cyA/DQo+Pj4+PiANCj4+Pj4+IFRoZSBzZWNvbmQgb25lIHdvdWxkIGJlIGEgbm90
aWZpY2F0aW9uIGZvciBhIGRvbWFpbiB3aXRob3V0DQo+Pj4+PiBGRi1BIGVuYWJsZWQgd2hpY2gg
aXMgb2sgYnV0IGkgYW0gYSBiaXQgbW9yZSB3b25kZXJpbmcgb24NCj4+Pj4+IHRoZSBmaXJzdCBv
bmUuDQo+Pj4+IA0KPj4+PiBUaGUgU1BNQyBtdXN0IGJlIG91dCBvZiBzeW5jIGluIGJvdGggY2Fz
ZXMuIEkndmUgYmVlbiBsb29raW5nIGZvciBhDQo+Pj4+IHdpbmRvdyB3aGVyZSB0aGF0IGNhbiBo
YXBwZW4sIGJ1dCBJIGNhbid0IGZpbmQgYW55LiBTUE1DIGlzIGNhbGxlZA0KPj4+PiB3aXRoIEZG
QV9OT1RJRklDQVRJT05fQklUTUFQX0RFU1RST1kgZHVyaW5nIGRvbWFpbiB0ZWFyZG93biBzbyB0
aGUNCj4+Pj4gU1BNQyBzaG91bGRuJ3QgdHJ5IHRvIGRlbGl2ZXIgYW55IG5vdGlmaWNhdGlvbnMg
YWZ0ZXIgdGhhdC4NCj4+PiANCj4+PiBJIGRvbid0IHRoaW5rIEkgYWdyZWUgd2l0aCB0aGUgY29u
Y2x1c2lvbi4gSSBiZWxpZXZlLCB0aGlzIGNhbiBhbHNvDQo+Pj4gaGFwcGVuIGluIG5vcm1hbCBv
cGVyYXRpb24uDQo+Pj4gDQo+Pj4gRm9yIGV4YW1wbGUsIHRoZSBTUE1DIGNvdWxkIGhhdmUgdHJp
Z2dlciB0aGUgaW50ZXJydXB0IGJlZm9yZQ0KPj4+IEZGQV9OT1RJRklDQVRJT05fQklUTUFQX0RF
U1RST1kgYnV0IFhlbiBkaWRuJ3QgaGFuZGxlIHRoZSBpbnRlcnJ1cHQgKG9yDQo+Pj4gcnVuIHRo
ZSB0YXNrbGV0KSB1bnRpbCBsYXRlci4NCj4+IFlvdSdyZSByaWdodCwgdGhlcmUgaXMgYSB3aW5k
b3cuIERlbGF5ZWQgaGFuZGxpbmcgaXMgT0sgc2luY2UNCj4+IEZGQV9OT1RJRklDQVRJT05fSU5G
T19HRVRfNjQgaXMgaW52b2tlZCBmcm9tIHRoZSB0YXNrbGV0LCBidXQgdGhlcmUgaXMNCj4+IGEg
d2luZG93IGlmIHRoZSB0YXNrbGV0IGlzIHN1c3BlbmRlZCBvciBhbm90aGVyIGNvcmUgZGVzdHJv
eXMgdGhlDQo+PiBkb21haW4gYmVmb3JlIHRoZSB0YXNrbGV0IGhhcyBjYWxsZWQgZmZhX3JjdV9s
b2NrX2RvbWFpbl9ieV92bV9pZCgpLg0KPj4gU28gZmFyIGl0J3MgaGFybWxlc3MgYW5kIEkgZ3Vl
c3Mgd2UgY2FuIGFmZm9yZCBhIHByaW50Lg0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBjb25mdXNl
IG1vcmUgdGhlIHVzZXIgdGhhbiBhbnl0aGluZyBlbHNlIGJlY2F1c2UgdGhpcyBpcyBhbiBleHBl
Y3RlZCByYWNlLiBJZiB3ZSB3YW50ZWQgdG8gcHJpbnQgYSBtZXNzYWdlLCB0aGVuIEkgd291bGQg
YXJndWUgaXQgc2hvdWxkIGJlIGluIHRoZSBjYXNlIHdoZXJlLi4uDQo+IA0KPj4+IA0KPj4+IFRo
aXMgY291bGQgYmUgYXQgdGhlIHRpbWUgd2hlcmUgdGhlIGRvbWFpbiBoYXMgYmVlbiBmdWxseSBk
ZXN0cm95ZWQgb3INCj4+PiBldmVuIHdoZW4uLi4NCj4+PiANCj4+Pj4gSW4gdGhlIHNlY29uZCBj
YXNlLCB0aGUgZG9tYWluIElEIG1pZ2h0IGhhdmUgYmVlbiByZXVzZWQgZm9yIGEgZG9tYWluDQo+
Pj4+IHdpdGhvdXQgRkYtQSBlbmFibGVkLCBidXQgdGhlIFNQTUMgc2hvdWxkIGhhdmUga25vd24g
dGhhdCBhbHJlYWR5Lg0KPj4+IA0KPj4+IC4uLiBhIG5ldyBkb21haW4gaGFzIGJlZW4gY3JlYXRl
ZC4gQWx0aG91Z2gsIHRoZSBsYXR0ZXIgaXMgcmF0aGVyIHVubGlrZWx5Lg0KPj4+IA0KPj4+IFNv
IHdoYXQgaWYgdGhlIG5ldyBkb21haW4gaGFzIEZGQSBlbmFibGVkPyBJcyB0aGVyZSBhbnkgcG90
ZW50aWFsDQo+Pj4gc2VjdXJpdHkgaXNzdWU/DQo+PiBJbiB0aGlzIGNhc2UsIHdlJ2xsIGluamVj
dCBhbiBOUEkgaW4gdGhlIGd1ZXN0LCBidXQgd2hlbiBpdCBpbnZva2VzDQo+PiBGRkFfTk9USUZJ
Q0FUSU9OX0dFVCBpdCB3aWxsIGdldCBhY2N1cmF0ZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBTUE1D
Lg0KPj4gVGhlIHdvcnN0IGNhc2UgaXMgYSBzcHVyaW91cyBOUEkuIFRoaXMgc2hvdWxkbid0IGJl
IGEgc2VjdXJpdHkgaXNzdWUuDQo+IA0KPiAuLi4gd2UgaW5qZWN0IHRoZSBpbnRlcnJ1cHQgdG8g
dGhlICJ3cm9uZyIgZG9tYWluLiBCdXQgSSBhbHNvIHVuZGVyc3RhbmQgdGhhdCBpdCB3b3VsZCBi
ZSBkaWZmaWN1bHQgZm9yIFhlbiB0byBkZXRlY3QgaXQuDQo+IA0KPiBTbyBJIHdvdWxkIHNheSBu
byBwcmludCBzaG91bGQgYmUgbmVlZGVkLiBCZXJ0cmFuZCwgd2hhdCBkbyB5b3UgdGhpbms/DQoN
ClllcyBpIGFncmVlIHRoYXQgaXQgY291bGQgY29uZnVzZSB0aGUgdXNlci4NCkkgd291bGQganVz
dCBwdXQgY29tbWVudHMgdG8gZXhwbGFpbiB0aGUgc2l0dWF0aW9ucyB3aGVyZSBpdCBjb3VsZCBv
Y2N1ciBpbiB0aGUgY29kZS4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+IA0KPiBDaGVlcnMsDQo+
IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg0K

