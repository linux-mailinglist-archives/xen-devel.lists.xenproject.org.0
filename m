Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D5099D6D3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2024 20:54:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818835.1232122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0QCQ-0006Q3-Ry; Mon, 14 Oct 2024 18:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818835.1232122; Mon, 14 Oct 2024 18:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0QCQ-0006MS-NW; Mon, 14 Oct 2024 18:53:46 +0000
Received: by outflank-mailman (input) for mailman id 818835;
 Mon, 14 Oct 2024 18:53:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7KN=RK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t0QCP-0006ML-Ev
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2024 18:53:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2613::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1f5aaa3-8a5d-11ef-99a2-01e77a169b0f;
 Mon, 14 Oct 2024 20:53:42 +0200 (CEST)
Received: from AS9PR04CA0033.eurprd04.prod.outlook.com (2603:10a6:20b:46a::8)
 by DB9PR08MB8289.eurprd08.prod.outlook.com (2603:10a6:10:3df::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 18:53:37 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:20b:46a:cafe::52) by AS9PR04CA0033.outlook.office365.com
 (2603:10a6:20b:46a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Mon, 14 Oct 2024 18:53:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Mon, 14 Oct 2024 18:53:35 +0000
Received: ("Tessian outbound cd6aa7fa963a:v473");
 Mon, 14 Oct 2024 18:53:35 +0000
Received: from Leb2dd2277323.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C5CDD8BC-DBD3-4C54-8085-D74F4683D4D1.1; 
 Mon, 14 Oct 2024 18:53:24 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Leb2dd2277323.3 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Oct 2024 18:53:24 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB9948.eurprd08.prod.outlook.com (2603:10a6:10:3d0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 18:53:20 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 18:53:20 +0000
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
X-Inumbo-ID: a1f5aaa3-8a5d-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I2kjcU4AzvF0jRaEbPfYQ8rwRcwDDzYUTX9oS4Wneonyh3Jgo6TPJdD+AXFniACEoHl89j3ftRXJ5wX5ZsaHzLk5AfsvDOf+K4vPpX2Of1SP7QsucmCldsq+aTH2DyboBRJwKNHxcJc0H5faNdsogT/C4gMQtGZYOVxInjcqeaf29ZZH30p8Xs0Yz0eNgBjLrhF3A7wC+T4yz6tf/0MLyeS44guZUHvR8p6GVPkTuFVKu+TSMiHnMKWZurndo0zRsgK1CoLSs3K2/ZZJ1jN7m7+tbUgB8Z2sqC6Zpo2AuICzTcrOVCkRt/ArEui94ZwfOc1x19F0zSzub5PhPapFCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsVmI/AJaNozcM/AJY1eFyfrw+h8i4iXeWgudEr49Ww=;
 b=XIwBJHTLr5YtYQh0DrvP04IE2KXdrzNhleJq5wwnTH5yIv5vtqN7XA91sFLLjn8BC0XmqirSnofzMjinSCfSrkkQlhpI1kCnVkFTXKVJ3pE2qOwdFDSFSUxfNKRo1vjlEcVMzK+XE8KTSSRzOc5jlPA8zhp+Q9YUEGV2xYxk10wmkvTAPshCxpgu8GqFjYIigx0zYpsDkUk1mNMqdlt2cWss3ghnsEUEgW+Na6FAspufyZPpFUoyXzhE7+Jpd0TWrn3kzo6isayNhRuhtYuEbYpixN9zhHGeCeDIMKlWSJFwAcw7CRkN6P+gaoyMPsm9VSniuPOSMi7riLb7tWn+mA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsVmI/AJaNozcM/AJY1eFyfrw+h8i4iXeWgudEr49Ww=;
 b=IIhKgXWqdxBerJxWbMwRnbC+jQzvoFGBSwNVXSHAsSoY0ERb8pjriLSYujHOYERDAmLcRCY0xbTdlmS3+CTQ/DJcHFuweZ2Gkea4xptY9OoTFv9eae0pQxrc/17mxwWMz1RehmMhX5eO2B45cht+oAMxj/gBRi6R7hFGLwYLAqg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee21c1b9dd453a04
X-TessianGatewayMetadata: c6FukzTMuwfGg9ODlreNgLLeV/29mwR/utgSkMt1qs3lmy8GnczzxB+Jw0nphLL8r/q0OS89ZsZfGfRje0Pxl+id1iWtz9v4fK/T/JlPHUI1yfAETg+QvbIApl03I7OfnZz4GAZ5iDNJsewuAg/+2HNQsq7MDW6Bz38HuU90iDk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fst7Cmp5r3CbnaUt6Xmahe2cQQSS9sUF0/r3TPrvuBrd2cCO72SOKz30pz9uJvvFWNpx+HzuIc64J7UWZ1ksosUex9iolg66eWPGy3ZLXjK1Bmyku0/LU/4p3usyFquW1bRoSbvluKP/jTWkmenqos0lH16oD6xYfIqFsWCzT+WEsqSJmJStzencIiBYQrW9d3afEL/wHjYZTm29azW7OaaSS9Mzao8WJ/kYFm7aIPjTOQjpMnhKobkaiGmZVRwAntbPwob6Slr3d7xNgE5SPSFtLt888PAKqfy70C9b090v36fPLcyNvG4RM265EHt2DU3EhIu9ljATUx/4IWClCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsVmI/AJaNozcM/AJY1eFyfrw+h8i4iXeWgudEr49Ww=;
 b=nePdSxctpVl7IZNyCt8sl5SEqpsV3wENR4lkjDhWcbIepqgClao8M1nhlNXZ3s2K6U6oeXms7aWQyrO4KO7OTONMkqBz4xsxaxqlAKZuaGvCgyAgC4BsHU8ayQHtlPJtHxLvFe08o8CPAspCEqymiEpcBrcAwapJFmUwy0c1lJADyMvLiKYJ2Thr20BeaeWplW0Pg52PSGX0nw1x7LYbXzYjJjMVinV2BF9WqWKnZx7STxzJC1R2nt9HTD3v9XLVUweQxzuCveBZK7Qlw6QN9/zn1+toB4NgECohCy0EnnRt49E5qHc48AOzkW4VLdFmuoX/r9KeB4q5yDKSewD38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsVmI/AJaNozcM/AJY1eFyfrw+h8i4iXeWgudEr49Ww=;
 b=IIhKgXWqdxBerJxWbMwRnbC+jQzvoFGBSwNVXSHAsSoY0ERb8pjriLSYujHOYERDAmLcRCY0xbTdlmS3+CTQ/DJcHFuweZ2Gkea4xptY9OoTFv9eae0pQxrc/17mxwWMz1RehmMhX5eO2B45cht+oAMxj/gBRi6R7hFGLwYLAqg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>, "frediano.ziglio@cloud.com"
	<frediano.ziglio@cloud.com>
Subject: Re: [PATCH v3 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Thread-Topic: [PATCH v3 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Thread-Index: AQHbGx17mFolmke5JEyORtvE+VZJJrKGnmUA
Date: Mon, 14 Oct 2024 18:53:20 +0000
Message-ID: <8AE12285-F017-4FC9-9F9C-6218257211F9@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20241010140351.309922-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB9948:EE_|AMS0EPF000001AA:EE_|DB9PR08MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 048890e1-b846-4822-dc0d-08dcec81820b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?52PradMKmQ5L++iUD7Yr0AoN/13mU/40SxauPviFFkxbb+/kZHyjZToIdRZn?=
 =?us-ascii?Q?N2gtobftmLEJN2G+T7fhMkA6SS7CFAzlpZnEqH0otZRezbB2/iYY/Y70MoJP?=
 =?us-ascii?Q?acTLRpZ3IL2pEeSW0TjSZipJNHVqs+Vk8BYzSy/LRxQs87Qunn4kPAzAINOt?=
 =?us-ascii?Q?MsYIcmehhlxSlMkNI/09NA7QozlFySSG+tDDQXi5NWOGQ1lWuE+unNlDGpAZ?=
 =?us-ascii?Q?LJDA9OJwVTIIHqep9Gm9T3kThv8eoX6GuP9WOZwbyXXf+kpv5x/4gp8/tyB7?=
 =?us-ascii?Q?Hr3dJm6eogkyVgFfJeSJbvDt0zqZKsALvDa1PjaxWVKVrrXziz9BCnppx0Z+?=
 =?us-ascii?Q?U6cvA8zuqrpSQjw4KsE6UHe9OZOmVuW9YY4crNRsU9pE3b1V3ErMMAxtqvjT?=
 =?us-ascii?Q?kQqjAmPkymjUgffu5mbX5YpFcwvX6AU8FAtQdg3S5IO3I4wxUbuuG7rlcEWw?=
 =?us-ascii?Q?19xpaAQBsqVp4gD6rfllKzcS/V+P2mIQbJTj2bUA652GCs2dDjzhf1nkc7Zh?=
 =?us-ascii?Q?HbDz3R2m7OMbYVSCqSr3bIThKN6IGxs+ZzuDZBcq+JO1ZzUZ0pdKfBbLDiXo?=
 =?us-ascii?Q?Z0/L9B4ZRjnrHpMAUS08pGwA5JiGv5GuF3QBneMCzbED/xQcGyi7GA5jyGmC?=
 =?us-ascii?Q?lS6T0d/jTDDScXKpmb4j7CzdNh6qyHAlfgUa2hI3zrAbHym/tfMkOfj5Wxdi?=
 =?us-ascii?Q?jGCum+xEG2rlnjSK+DvJ8NCHI6kUNpkGQpnNX4/vNjtQlgbv5L3U5+ryYxaG?=
 =?us-ascii?Q?N9yGg41zDaJRIU8CPFyBzS0rARzecYLPy/hYiDs4XlPMg97J/6APVELnuh9/?=
 =?us-ascii?Q?iPVTPmcuUnZLD0n3MnxK9Iry2kghR8Ynvic2D4TYybC2bpJvYCvf7nIf7cVZ?=
 =?us-ascii?Q?2XBQ2kA3pssh+ngCqTcdO74uDPDJilUPlkFpMThjJJLXGpnhjLQhVWF1zhRH?=
 =?us-ascii?Q?nIL6T89y/mRHWSE8nTf61HrY2Zw8rYSZ8MxuY+9b106+5V8U0QBA1xObgnkC?=
 =?us-ascii?Q?S2o9u22kGm3sun8hrEP+gDB64f9upA/1zGbPXpn1BRpX9p473tx9osQzLXtr?=
 =?us-ascii?Q?GwmxpF9dmTDruSgDuO38ro9Crq4J9d9LliLSD8s+ZeKrvSgXVKW6WZu3n7wr?=
 =?us-ascii?Q?gP0g3u0srA3soO1t3xNPgHs11YpheAjVhQCONR7Xjekr2fiVCLENb1ixVPeD?=
 =?us-ascii?Q?jSu7iSbTD76AmycwdK3KNN8kORWCpURSJLiI4gVUxQ49bncjywbldm+jHBTD?=
 =?us-ascii?Q?XmWVGUJiMXDRo+EtQvnW+QkJs3ur7Vr8VJg0fVQwaf6hV9i+a678wUDM/0Z8?=
 =?us-ascii?Q?znklduSlZ2ZzeOcj7piOTVNXF0hU4nfpFu+NwPvhzyYcYQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <92BF7F34C4896948A186F2286ADD8AA1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9948
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c8d2789b-748d-4cfe-2f5a-08dcec81790e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jPzV2MIxRhu+HMJLROZVNR7459/gUO/GV851ANA8YJNECq6OuHH823F1CHf4?=
 =?us-ascii?Q?U1herQAOvyJXb4OOznB68r0V8O6mApvdun3PbBUa/fuWzZ3OIZP4l6cOeCVv?=
 =?us-ascii?Q?NBbTMkSgOgjxEXKCOlomVXilpCwqgjx69xvWE6ePBd9ketEPmBZSQ5xqa4k0?=
 =?us-ascii?Q?YQNBay5g6A/GLIaYSwFJ+JrTQHcaOL+prWSQpZhj2qt45EaDeKrgOZLOjF46?=
 =?us-ascii?Q?IICYfaXWqJxx8kA8ybXoIUb8WzbouZ2KONKd6FjiP/Uf4PUAJVYjwXHWnXje?=
 =?us-ascii?Q?1ZZaVZTSjmAy9h19STAOicMAUNjMYw7bS7NlsZcboP+Nzw4ZIuubDmRNvilN?=
 =?us-ascii?Q?eLaA0zfikhXZV5Owa1CPe7MGBaSIMGVDnsgnrYqgZ4LgXRLoqcWYAY1B8b9l?=
 =?us-ascii?Q?eeC9Bbv6M3HpF/eUyYH6TOerGcWhdFoDboG7ntPusLViysyvlZ18JceMsCl4?=
 =?us-ascii?Q?o1w6icaDLTTqQj+nR1U3mkSAeP0FRF4biUY/gEUC5pXRF2yXeLL6Gepsx6Rz?=
 =?us-ascii?Q?QJqO0WMahYRJQ9qk8WyjA1bY/bfIMdtfsumqbAXwpdFrZkPTFbQPl7pc2HCH?=
 =?us-ascii?Q?bWxohP5X/3ndrtswC7HqYFWfsmYTmqsl/qMXK8TybwhgnXHC7oRfMp8tR4t/?=
 =?us-ascii?Q?lo5mXreSgyDtyT96VFBec+Xr2YxY/w2qncdgEGmLf34AtAYgfRYruz7GyF9/?=
 =?us-ascii?Q?GAHijCMJs7G3Km7jD4O/XsyTrgxMff5o7QrIbjEnW625aI3ISsf6NHsE+2pN?=
 =?us-ascii?Q?sWU2et7eVCRCL2nf+iNELhoPxVgT/fAzndBcKNLzQw3YUcOGH9TqdIqHHaoY?=
 =?us-ascii?Q?pKtQtoWQUPZFT6Lh6B8qwrcth69zVviHYDGZcrlCkHv46x0/PGdDfv3JWa5x?=
 =?us-ascii?Q?dO0MdOjlSVqaOZNuj7rmcBP5PsUsvB0Qx5NB/BeFQcHod1umqWAgL1clS6Nj?=
 =?us-ascii?Q?NW+NjH4/Si495dlyNlsp5O35IkZeHxSHSEWQRHQIiO68gOTfB2EXQj7XYC4Y?=
 =?us-ascii?Q?EOAeAjeFvyvY5l7mC+u5kQi+JWSMWnFJaANp5sYcPtTcCegUCN3rsZ6oxWEU?=
 =?us-ascii?Q?voa8vhojRy1wol8z7TypZLkABMfUUEm0Rk1XZzLvguWRNE2fN3KProPJSvx6?=
 =?us-ascii?Q?Jgcz727Xf2wSWPOJVU5u633IFMEw39DzYVF4lcM5HAJZA2nCsYpjj2/C1X+q?=
 =?us-ascii?Q?MCatOK2jxcikCSMFzYQCw23UulS+0c378jqn5DNkyHx+DaKgtqTu8AG36vHe?=
 =?us-ascii?Q?KtBm9MzpXGa5J9vOinexOSJ9I3kWTG0T4cQoiRQ9ZbAnn5my/GB3GOpBtLMN?=
 =?us-ascii?Q?Oqz2YmRdw0lvwWiPrIyxaYyExeordof4GWFxAIMrlrQi41cq9GbubaaddKLl?=
 =?us-ascii?Q?tJDTXNTK08EJIoscGkDvT+0KoB6Y?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 18:53:35.6052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 048890e1-b846-4822-dc0d-08dcec81820b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8289

+ Frediano for suggestion about header protection define name

> +++ b/xen/arch/arm/include/asm/mpu/layout.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ARM_MPU_LAYOUT_H__
> +#define __ARM_MPU_LAYOUT_H__

I think we are moving away from this notation:
https://patchwork.kernel.org/project/xen-devel/patch/20241004081713.749031-=
6-frediano.ziglio@cloud.com/
Shall this be ASM___ARM__MPU__LAYOUT_H ? @Frediano


> +
> +#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
> +
> +/*
> + * All MPU platforms need to provide a XEN_START_ADDRESS for linker. Thi=
s
> + * address indicates where Xen image will be loaded and run from. This
> + * address must be aligned to a PAGE_SIZE.
> + */
> +#if (XEN_START_ADDRESS % PAGE_SIZE) !=3D 0
> +#error "XEN_START_ADDRESS must be aligned to 4KB"
> +#endif
> +
> +/*
> + * For MPU, XEN's virtual start address is same as the physical address.
> + * The reason being MPU treats VA =3D=3D PA. IOW, it cannot map the phys=
ical
> + * address to a different fixed virtual address. So, the virtual start
> + * address is determined by the physical address at which Xen is loaded.
> + */
> +#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
> +
> +#endif /* __ARM_MPU_LAYOUT_H__ */

                   ^-- ASM___ARM__MPU__LAYOUT_H ?=20

Apart from that, the rest looks ok to me:
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



