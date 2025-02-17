Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 019A9A388F1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 17:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890609.1299762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3m3-0001oF-Na; Mon, 17 Feb 2025 16:15:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890609.1299762; Mon, 17 Feb 2025 16:15:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk3m3-0001lX-Jv; Mon, 17 Feb 2025 16:15:11 +0000
Received: by outflank-mailman (input) for mailman id 890609;
 Mon, 17 Feb 2025 16:15:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bV9=VI=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tk3m2-0001RW-Ek
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 16:15:10 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2608::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5aca0d3a-ed4a-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 17:15:08 +0100 (CET)
Received: from DB8P191CA0002.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::12)
 by GV1PR08MB7828.eurprd08.prod.outlook.com (2603:10a6:150:5c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Mon, 17 Feb
 2025 16:15:04 +0000
Received: from DB1PEPF000509F0.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::ce) by DB8P191CA0002.outlook.office365.com
 (2603:10a6:10:130::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.18 via Frontend Transport; Mon,
 17 Feb 2025 16:15:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F0.mail.protection.outlook.com (10.167.242.74) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Mon, 17 Feb 2025 16:15:04 +0000
Received: ("Tessian outbound e4b26383420a:v567");
 Mon, 17 Feb 2025 16:15:04 +0000
Received: from Ldc32e2a200c8.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E46C3241-D69E-42D0-8DBF-50CC9EFAC636.1; 
 Mon, 17 Feb 2025 16:14:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ldc32e2a200c8.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 17 Feb 2025 16:14:57 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by DB9PR08MB6684.eurprd08.prod.outlook.com (2603:10a6:10:26d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 16:14:56 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 16:14:56 +0000
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
X-Inumbo-ID: 5aca0d3a-ed4a-11ef-9896-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tWkKVywdGIvUAGGE24yaJqW9Xxuvb/Jv9nxUojILdMgMEgTC145u9RyTEa7vs8Foq4SRCxo7FCME9mLjm45Al8solSEiYp0VecQ9FZlVqofBOb/gTgJQh+lWUrtnfHZqltIMp6/x3Rcdi8jiJVDm2GHFlkdGbesVVxLFgAZeZuTP3KvjZXOx2RE8bhHj2yTYC63s5Sfom8zYnmqE9awU1qVAj/iQcroZ7D2t9dASqwDS3TF3Yyi0nIdmcvPRzI5jHDwGicOirLjOvQgwY2t2K1wQgHhOpjNt+zsZ8Q5faB8ZCKl30mgbIYGoR4il2gERYqsc+/LTLsz+P1ZJpXxd5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPwu5aubfqCJm8LhTtMOnoWbtLgU/4F7JPv8KL/X3Kc=;
 b=IfskkI811Os+oZTD8FCd9ELVAo2v5ME8cJjayFzANFDg3vMtt0FeTbmPfbC4YojB/DcMPgXTgUxBXj3h7J3NqS3WW+u2w7evgTMK0WK1T/ywyt45jCrz4tb3+CU3xVyPRHzrQl5vIqZp9XeK9PagEAkvdKb0wl7cXpeEQaiM/437zZ6N2UbzbHDlHxdbiYLo1QMOeCKdZB1lEhLMnDRL0OmWkWTLLsymD/FQUZGWMLPBiKzMCq7TNhFojqz+bBWeoqqlE3GKcasY8AiJnHwgA8sQmpoLaPACUbY4Lf5TN9KVXRuBG08vR4YQhyEFncyxn6xF1xCQjDQ/u6jNev8H5w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPwu5aubfqCJm8LhTtMOnoWbtLgU/4F7JPv8KL/X3Kc=;
 b=rhePy5yWTs/tZwWYMT8c4x9A7s73ysYO9DxHw6r7S2B7XezzegfL2O6zEbweovBm/IrY/B3uK/m9B32P8UglgMAPC2UlWDukaFk9Ss12FB7ILbXqHWRrsjyo+gb7DTyoU0B9Fz9CdPw9uaDGZKmEuC+DhBsM2iuEfwnGos+L0KU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3de406ad476759d8
X-TessianGatewayMetadata: ooTl/QS5R3aXGDVUwya2f0yqRKGv2pqGD542eUIZ7HjETwvADzeGKgEIpLccJStJgay9b6UlDHaAUoNSjZjoTSIolK0d9Vj7221ZkGbleT7ZehKOuww1TZQCI7yunJZHhuvbqWVKAsskZqdwQ0H0T/sm2qBKWOCGIIhG0a9kfug=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXdGh1ZsStwEyUdY1ZKdRq/lMd3GEIPA/5kE5J7OB3ImIlcM+Io/ruPd0D2FK0sDQD6I39ukPDmaDYXwF858KOFmRjoOTJESLXyCeoRPrCN4FAUlsNRJpsgDCJ5ESOvsRlI1Uav+3A2NAA++0lj8hI54GudbUQ7/UuFhnsg6CbOofJW4qUNMmCNhoGTvRM88rPCKouEp+JwnMwy+G8bxRMeuP6VwuSOshWabSIaGeefG4QGsF4wSfSCKl9HDkbrR8Bpj/Vw/gx+q6t9HdoOwScXaD7FmZTUn+SMUI/PSBah7k+rgm27Zf9vj3ljYNTK3ieAu7bPsMOYgrt+qbKG18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPwu5aubfqCJm8LhTtMOnoWbtLgU/4F7JPv8KL/X3Kc=;
 b=Rrib8D7ZbdGFsD5REmB6tKmCJp523dsdq/iaLKw/ceIZt01olKkM2cYNR6hmtz6eUHr6q6rHsKAFF4E0a1yeyMw/ws2wrpKBrV//H4HIlOUXBlMp48PQRz0bgMlAzhpXxYFl4uIERwJsm2wTg7l0dXeTAN27CwhSzTHbAVPFCt1UPABWQH1wQJhEmjx9XRtkUXI3OulJOsOMlP7Cyel3vl3Gyc/Vs0dleGPIFYdV83rpCtRzW5KxNUpE8wOXU/gX8QT1iTGk2dpLjHlpjKieJg0fKtSgapQk8ziswjtPoISdgwSJT9eieMne1ane5MdQpp3wSzNmzKUZhOQlPKC6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPwu5aubfqCJm8LhTtMOnoWbtLgU/4F7JPv8KL/X3Kc=;
 b=rhePy5yWTs/tZwWYMT8c4x9A7s73ysYO9DxHw6r7S2B7XezzegfL2O6zEbweovBm/IrY/B3uK/m9B32P8UglgMAPC2UlWDukaFk9Ss12FB7ILbXqHWRrsjyo+gb7DTyoU0B9Fz9CdPw9uaDGZKmEuC+DhBsM2iuEfwnGos+L0KU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH v2 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbgSah9ICbo4twrEWuXsaPYY+0drNLUUYAgAAR4YCAAAR4gIAARBmA
Date: Mon, 17 Feb 2025 16:14:55 +0000
Message-ID: <6B58EB7A-1A39-40FC-94CF-C871AA3AE06C@arm.com>
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-2-luca.fancellu@arm.com>
 <cbea397a-e919-4b00-a56a-f706ddc13e53@suse.com>
 <5CB44FBF-09A3-4587-B5A5-3D4BBB9D58A5@arm.com>
 <51ebbaee-7927-488c-b69c-2bec1ba3b34c@suse.com>
In-Reply-To: <51ebbaee-7927-488c-b69c-2bec1ba3b34c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|DB9PR08MB6684:EE_|DB1PEPF000509F0:EE_|GV1PR08MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 7130690b-81ed-466a-344d-08dd4f6e3cea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V3dKTGdENUNFSHhJUHFzTjBnUkI0bGVsY1lkQWRuajZRdnBWOXh2cTZ6cEVW?=
 =?utf-8?B?b0JEd3RNV2o3K3V6czNLcllmMXUxT2pVZSszbFgxckFxWkR4UmdEYmVIN1NB?=
 =?utf-8?B?S3ZVeG5aeDdkSVNZOCtiWEJuZUxVTitPeGdHbXZrVm4weEV0WEs1a21rTlFR?=
 =?utf-8?B?L1FPcXFlYy9OUzVZQURZWVBZY0lXc2ltT3pmQmEwVDVDSkMwYTBldGNWV3Jv?=
 =?utf-8?B?T0dsdTJpM3ZFS1RpRkJWTTFXY3JhUjZSeWNOblcydXJJV0FFUk9xWkY3eUtn?=
 =?utf-8?B?VDlnbG5qYUdYZ3pYcjQ5Tmp0ZW8yOFJlUXdra0ZieVNUakhoQ3dSeHAvZWZG?=
 =?utf-8?B?RzhUeUpiRVg3TGcvbXQ2M2JkY1kxU2RrNWoyMUVyNW5OZWdMMmtGdEJBOW5S?=
 =?utf-8?B?aE83MHVUTzZpUHdqNk1QSTBJMERrc0RBWndaNjVudTB4dWIvalk2MmJDcURN?=
 =?utf-8?B?d3NmSk5WYWg0WjJxd0pPQWtROE1EL2F6V00vVjFNS2JqZWhQQnBiaFlVcGNF?=
 =?utf-8?B?MkxvcVRvZGhPTlRSZG56cEM3TEJVUGRLQ3NRek14V0Zod0JmNjNSNWJ0QWh1?=
 =?utf-8?B?ZkI1a3R3TEJKZEFDQVI1QUFiNGdsNnZUSElsRmJlZzJKU3lhUEpiZ25wOEZY?=
 =?utf-8?B?RzZSMFN3eDEvditUcmJCK1l6Y0JaRVloUDV3VEFkdUcya0haNUtSaUlJVXVx?=
 =?utf-8?B?aUYrRlFERnNBWkUyOHJmTURMR3FiWHhtMXZJK2h5SFY4aUJWQ2lKUFR4Y2RL?=
 =?utf-8?B?SjFjdWtNRkFuMHVrVk80MWlwR0dsRCtDMklWc2xlMWMrdGswWU1COEs2RjE4?=
 =?utf-8?B?OFhkc3FZNkpTcWJ6ZzhUYllpb29PYjhTQ1grUzFoZkIxSzhYaXNxMjI3dzlQ?=
 =?utf-8?B?VnRsenZEV1FLa3VTN0MrbkhWWlNBWTFqeUxBNmdMWWQwSkJMQlFBdVFiTlBz?=
 =?utf-8?B?TkR5V0N6ZzZURkk1Ym80YkNWd0pOMWhEaVltMjdPajdXS1RrbkJlMXRHbml1?=
 =?utf-8?B?TERMcStqNXUyRTRWbEduNlBtSjRGVkdBSE9RRXN0MXF5d25rczdPbmhOTHZt?=
 =?utf-8?B?K1Q5VVZXUnV4RHF4RFlGTllyWDRaK1ZaK1VLQTFpeFo1OVNtQkVnZEJrNnJZ?=
 =?utf-8?B?enVpTWhuN2pJNmNwNGJoZzlPQ3o2bjBWZVFDSThVWGhIMGViMWxkdmU3Q0Vs?=
 =?utf-8?B?WTJPMlMzcElZZjRFOTRLQ1VyWEtXNmk0OWFya01nSGlOaXk5Y1hwb1B1eVhw?=
 =?utf-8?B?dlZCZ2NOQWFIajdSK1JmNDJoT2RxM1dZamNTa055YTBUS0x1dzhyeGR1VXIw?=
 =?utf-8?B?VWF0UG5ETUF4M0lVRVJsV3R4SnhvbHlmOEpHNktNQ1dqTW8yK290UzdKQkFT?=
 =?utf-8?B?SzlPNlJEdm43OUJyL1NQajJOaklUN0EzR3U4eVdMcTZIY3dhQ3d1QnhnMDB1?=
 =?utf-8?B?L1Mxa1pTUUVuOHROMFY4YVVyNXUyamZSUSs3c0l0cU5mUVE4MmVXZFZZWkdI?=
 =?utf-8?B?cUl1K0dCWm1YZFMzS3ZXclk3SkhGMmVRbk5hTDV1aTZoMERzQ0hFRkNPM2xE?=
 =?utf-8?B?OEd6N1JkYWpuQjhEYldxQkdoNG94NVAxbEVmb1U5SG5CVUpFc0FQNXVGUk9a?=
 =?utf-8?B?MUxjYnc0aFZKNW1uSDdlT3ZGc0R0RXNUcTVucllaaHI3TGtUcXdiSnJvU211?=
 =?utf-8?B?ZzZja0pocHVKVUZGZjVCUUVibDJLRkdiTUZNWkpGc2tPckFDTGV6dkJkZFRn?=
 =?utf-8?B?Sjh6RDFEUk96MXpjaVBPWElydW5QUnJnUDEvL2R3TXNuc0VuSENmT3Nzcmpu?=
 =?utf-8?B?cUlIeFFSUzdiNGl5S1RPN3ltQ000TlNmZDk5d2NYL09ON0wweUxRbFhyS1Rm?=
 =?utf-8?B?T3J5S2xBRTZacXJoN04rdHFiVkxEYkVRajhPenBpSGtFRWpYeFJBankySUxT?=
 =?utf-8?Q?UgHhcZmI/zSK9cLjkHoi23Dm+ruoNb2f?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A90BCC1C4150C419D4496AFEE79B3A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6684
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ef10fb53-0be9-4906-f671-08dd4f6e37ee
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXlsc05CTFhuV3pxMFlHcDRUTEk1cnZocDlaZ1oxbnN4cjBDaks1WE1sZzho?=
 =?utf-8?B?U2NJM1J4Sm5kcEFKTWNoWTZicUgxcldFbUR4RVZFek5nbEdmWFd2dkl6TWwy?=
 =?utf-8?B?R0FGSzFILzNpSEsyVWVnT3dFVm4zYXNhcG14bkhYeWMvaXdoSHpBRlFQbFVR?=
 =?utf-8?B?M3MweE5nak5yS1hjbkd3NU1zcEVXYU5EZFNVTHVqVGxMY2pDRDQ2MHhGTjJq?=
 =?utf-8?B?SE4vWk5qYWVTbjVxdmFYTjQ1cmhhQ3E5aXRPVG8wMEZ2dUdIeUtLTnJQdEcx?=
 =?utf-8?B?cVRYVXJGaGY1SWpWK3V3YjRVOGJpOCtRdGNMcWREY1RXZU1US2hjUVpzSjlF?=
 =?utf-8?B?ME1paUR4VkUzc2ZwQllOV3lOZHFzRlVCWGlicThEdU5USERzbkJielVTS3I3?=
 =?utf-8?B?NmZpREwxVGEzYkhPMXRsR1RLeUJNRkhJNmpPU2ZnRG9tbHJ1Yi95ZUI2WFF0?=
 =?utf-8?B?WERhQXA5Z2g4eW5oWVNYekJIWVJjemdTR0Q1a2dqUEN1d0JRZVBnQzVPa1Av?=
 =?utf-8?B?TVdmbC9PTnh6NEEvNkg0Uy9GQmM5WDlyOHV5dHMxckpUL2dJM0JSZE1VTHZ2?=
 =?utf-8?B?VjlWNno3M0g3TjBqaEhwbnE0UU5CSUphRURlZDFDcTVNNytaV1l6TTlLbnk0?=
 =?utf-8?B?R2F0Zm8vVUszQnJFSERRbmZHaEJHVFQ1OExzc2VFbGk4UWhYYVplcVA3YUg1?=
 =?utf-8?B?dzJ1ZThraDhCUHMyanBITEE2Vld1M3NnYkRoUXQzU0xZc0k4cnNNbDd5VGdR?=
 =?utf-8?B?ZmRLS0hGZVRCZGVjanU0TlIwV2ZEM2Q1ZHB3bTg0R29MUXNKcGlKQmFuV3Ba?=
 =?utf-8?B?THNUSkZmU1Jvb1pEMTlIRG5OYldYa29MVEMvR2FJQ3VKazQ5bGlHdnJnM1Vz?=
 =?utf-8?B?NDA0cktkeCs1T2puVnZrRUFXNXFyQm13UHBoN0lQLzM5dUxDSVpZc0dmZm5N?=
 =?utf-8?B?V1RRQW5EYjlFaG5xTlZVL1VSTjhYUjNQN3dSNjFHZkhsaG56bVpTZGVpRFF1?=
 =?utf-8?B?TzBPWVEvSko2ZVdUdTQwYjRVSnNrVVFOeGNXVWFNYkRhYmRHeTRNVTFYcDlY?=
 =?utf-8?B?djlIQ3pZSmVOV1R6M2YwbG1Kb09kWE9mSkk2OGtZclJDNzJiejZ3RCtpQkU2?=
 =?utf-8?B?OVc0VVZoZW9PSHRpUGRVRCtRSDJ0WlQxMmoxU2pFUWEzQjMrN04wWXRwb1A3?=
 =?utf-8?B?VnRmbVhBcU9QNWhGTVBnM3NqSTEwSGoyVC9LQTRUSWxyOFVCcW9JTTQwOEJT?=
 =?utf-8?B?UEtvUXduOHhIYmJQMmNOYXpJdlhBZ2FwbTYwZXlOblFMU1gxaGdIdHg1dGtD?=
 =?utf-8?B?MFJJV2o0dDBLOWMvUDZ3bFRvNGpaUjJhODBwL2MzZnZyOVYzR25ac1RGQnk1?=
 =?utf-8?B?OGxQWXFVUVUzQmxzS1g5aXhxU2JHWTlYKzV3R3dybkgyT2xVL0pwcEZIMXg1?=
 =?utf-8?B?MjRjVTNWNWZLcnppWFFzZVdRTk5IT0pMRHQ1Sm40SmZqanJkakNsdDZLb0Fu?=
 =?utf-8?B?aVhzUE0yclpnb0NtaVczQ3laRElJVVV1R3BtcTdyOURqZTdicHZIU0hGSGU2?=
 =?utf-8?B?SzJBTGgvdEhaZE56eFBMdk1NYkhSUU41U3ZNZUpUcEV1VG85TkdCZUlKOFRZ?=
 =?utf-8?B?Y0F5NHMvRzY0MUZkQVpKK0lnUC9vbjNCeEQ1M3FqZVU5aTlqL2tnaGpNaGg1?=
 =?utf-8?B?bTl1SEkrRFRxZkg0eTNXY2hCTjlEemxLU3lxU0VrcjJKaHlqUXZvc1FDWEFL?=
 =?utf-8?B?QUFubGF5SkIrVDdjVGEzT2IzZkxTSmJpbk1MaW84a1Eveld4dFVVdlBFbTJx?=
 =?utf-8?B?bmc0TXZMWURBZ1VOL3JoM3drQlQvaVpqdEFNV25HN1lTTCsyTDBLMkdKNEo2?=
 =?utf-8?B?cU5KbEhQRm5TdzdlWWk0NGpXZXY3U0tkcUdWWUtDMEt0Y3pqb1htbzlYY3lk?=
 =?utf-8?B?TXJhdEhDZ3NxK1pGYXl2anROTmsxVFZack1YV3dra2kvQW5WSFVNTVJXZzhG?=
 =?utf-8?Q?IEI1rtFjaUzqr0CC+uD6jpTumdy/0U=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 16:15:04.3300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7130690b-81ed-466a-344d-08dd4f6e3cea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7828

PiANCj4+Pj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgNCj4+Pj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL2lvbW11LmgNCj4+Pj4gQEAgLTExMCw2ICsxMTAsOCBAQCBleHRlcm4gaW50OF90
IGlvbW11X2h3ZG9tX3Jlc2VydmVkOw0KPj4+PiANCj4+Pj4gZXh0ZXJuIHVuc2lnbmVkIGludCBp
b21tdV9kZXZfaW90bGJfdGltZW91dDsNCj4+Pj4gDQo+Pj4+ICsjaWZkZWYgQ09ORklHX0hBU19Q
QVNTVEhST1VHSA0KPj4+PiArDQo+Pj4+IGludCBpb21tdV9zZXR1cCh2b2lkKTsNCj4+Pj4gaW50
IGlvbW11X2hhcmR3YXJlX3NldHVwKHZvaWQpOw0KPj4+PiANCj4+Pj4gQEAgLTEyMiw2ICsxMjQs
MjQgQEAgaW50IGFyY2hfaW9tbXVfZG9tYWluX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7DQo+Pj4+
IHZvaWQgYXJjaF9pb21tdV9jaGVja19hdXRvdHJhbnNsYXRlZF9od2RvbShzdHJ1Y3QgZG9tYWlu
ICpkKTsNCj4+Pj4gdm9pZCBhcmNoX2lvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7
DQo+Pj4+IA0KPj4+PiArI2Vsc2UNCj4+Pj4gKw0KPj4+PiArc3RhdGljIGlubGluZSBpbnQgaW9t
bXVfc2V0dXAodm9pZCkNCj4+Pj4gK3sNCj4+Pj4gKyAgICByZXR1cm4gLUVOT0RFVjsNCj4+Pj4g
K30NCj4+Pj4gKw0KPj4+PiArc3RhdGljIGlubGluZSBpbnQgaW9tbXVfZG9tYWluX2luaXQoc3Ry
dWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IG9wdHMpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgcmV0
dXJuIDA7DQo+Pj4gDQo+Pj4gU2hvdWxkbid0IHRoaXMgZmFpbCB3aGVuIGlzX2lvbW11X2VuYWJs
ZWQoZCkgaXMgdHJ1ZT8gKFRoZSB1c2Ugb2YgdGhlDQo+Pj4gcHJlZGljYXRlIGhlcmUgYXMgd2Vs
bCBhcyBpbiB0aGUgcmVhbCBmdW5jdGlvbiBpcyBzbGlnaHRseSBzdHJhbmdlLCBidXQNCj4+PiB0
aGF0J3MgdGhlIHdheSBpdCBpcy4pDQo+PiANCj4+IFJpZ2h0LCBwcm9iYWJseSB5b3Uga25vdyBi
ZXR0ZXIgdGhpcyBjb2RlIHRoYW4gbWUsIEkgc3RhcnRlZCBmcm9tIHRoZSBhc3N1bXB0aW9uDQo+
PiB0aGF0IHdoZW4gIUhBU19QQVNTVEhST1VHSCwgJ2lvbW11X2VuYWJsZWQnIGlzIGZhbHNlLg0K
Pj4gDQo+PiBpc19pb21tdV9lbmFibGVkKGQpIGNoZWNrcyBpZiB0aGUgZG9tYWluIHN0cnVjdHVy
ZSDigJhvcHRpb25z4oCZIGZpZWxkIGhhcw0KPj4gWEVOX0RPTUNUTF9DREZfaW9tbXUsIHRoaXMg
ZmxhZyBpcyBzZXQgb24gZG9tYWluIGNyZWF0aW9uIHdoZW4g4oCYaW9tbXVfZW5hYmxlZCcNCj4+
IGlzIHRydWUgb24gYXJtIGFuZCB4ODYuDQo+PiANCj4+IFNvIHdoZW4gIUhBU19QQVNTVEhST1VH
SCBjYW4gd2UgYXNzdW1lIGlzX2lvbW11X2VuYWJsZWQoZCkgZ2l2ZSBmYWxzZT8NCj4+IE9yIHNo
YWxsIHdlIHJldHVybiBmb3IgZXhhbXBsZSB0aGUgdmFsdWUgb2YgaXNfaW9tbXVfZW5hYmxlZChk
KT8NCj4gDQo+IFNpbmNlIEhBU19QQVNTVEhST1VHSCBiZWluZyBzZWxlY3RlZCBjb25kaXRpb25h
bGx5IGEgKHByZXR0eSkgbmV3LCBJDQo+IGZlYXIgdGhhdCBhc3N1bXB0aW9ucyBzaG91bGRuJ3Qg
YmUgbWFkZS4gSXQncyBwb3NzaWJsZSB0aGUgc3R1YiBjb3VsZA0KPiByZW1haW4gYXMgaXMsIHll
dCBldmVuIHRoZW4gLSBpZiBvbmx5IGZvciBkb2N1bWVudGF0aW9uIHB1cnBvc2VzIC0gSSdkDQo+
IHN1Z2dlc3QgdG8gaGF2ZSBzb21lIEFTU0VSVCgpIHRoZXJlLiBJbiB0aGUgZW5kIGl0IGFsbCBk
ZXBlbmRzIG9uIGhvdw0KPiBYRU5fRE9NQ1RMX0NERl9pb21tdSBpcyBoYW5kbGVkIHdoZW4gIUhB
U19QQVNTVEhST1VHSC4NCg0KSeKAmXZlIHRyaWVkIHRvIGFkZCBhbiBBU1NFUlQoIWlzX2lvbW11
X2VuYWJsZWQoZCkpOyBidXQgaXTigJlzIG5vdCBidWlsZGluZywgSeKAmW0gc3RhcnRpbmcgdG8g
dGhpbmsgdGhlcmUNCmlzIHNvbWUgcmVhc29uIHdoeSBJIGNhbuKAmXQgZG8gdGhhdCBidXQgSSBk
aWRu4oCZdCBmaWd1cmUgb3V0IHdoeSwgSeKAmXZlIGFkZGVkIHRoZSBpbmNsdXNpb24gZm9yIHhl
bi9zY2hlZC5oLA0KYnV0IGl0IHN0aWxsIHNheXMgaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVu
Y3Rpb24g4oCYaXNfaW9tbXVfZW5hYmxlZOKAmeKApg0KDQpCdXQgSSBjb3VsZCBhc3NlcnQgZm9y
ICFpb21tdV9lbmFibGVkOiBJIGNoZWNrZWQgaW50byBjb21tb24vZG9tYWluLmMsIHNhbml0aXNl
X2RvbWFpbl9jb25maWcsDQppZiBhIGRvbWFpbiBpcyBjYWxsZWQgd2l0aCBYRU5fRE9NQ1RMX0NE
Rl9pb21tdSBzZXQsIHRoZSBmdW5jdGlvbiB3b3VsZCBmYWlsIGlmICFpb21tdV9lbmFibGVkLA0K
c28gSSB3b3VsZCBzYXkgdGhhdCB0aGUgc3R1YiByZXR1cm5zIHRoZSBleHBlY3RlZCB2YWx1ZSAo
MCkgc2luY2UgZm9yIHN1cmUgaW9tbXVfZW5hYmxlZCBpcyBmYWxzZSBhbmQNCnRoZXJlIGNhbm5v
dCBiZSBhIGRvbWFpbiB3aXRoIHRoYXQgZmxhZyBzZXQgdGhhdCBoYXMgdGhlIGlvbW11X2VuYWJs
ZWQ9dHJ1ZSB1bmRlciAhSEFTX1BBU1NUSFJPVUdILg0KDQpCdXQgd291bGQgaXQgYmUgb2sgdG8g
YWRkIHRoaXMgYXNzZXJ0IChBU1NFUlQoIWlvbW11X2VuYWJsZWQpOykgZXZlbiBpZiB3ZSBrbm93
IHRoYXQgaW9tbXVfZW5hYmxlZA0KaXMgZmFsc2UsIHNpbmNlICFIQVNfUEFTU1RIUk9VR0ggPw0K
DQpQbGVhc2UgbGV0IG1lIGtub3cgeW91ciB0aG91Z2h0cyBvbiB0aGlzLg0KDQpDaGVlcnMsDQpM
dWNhDQoNCg0K

