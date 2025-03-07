Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1FA56390
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 10:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904784.1312618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTsh-000215-16; Fri, 07 Mar 2025 09:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904784.1312618; Fri, 07 Mar 2025 09:20:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTsg-0001xx-T4; Fri, 07 Mar 2025 09:20:34 +0000
Received: by outflank-mailman (input) for mailman id 904784;
 Fri, 07 Mar 2025 09:20:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ceor=V2=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tqTsg-0001xr-0Z
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 09:20:34 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b01a38b-fb35-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 10:20:32 +0100 (CET)
Received: from AS4P189CA0038.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::10)
 by DU2PR08MB7374.eurprd08.prod.outlook.com (2603:10a6:10:2f2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 09:20:28 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::7f) by AS4P189CA0038.outlook.office365.com
 (2603:10a6:20b:5dd::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.22 via Frontend Transport; Fri,
 7 Mar 2025 09:20:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Fri, 7 Mar 2025 09:20:27 +0000
Received: ("Tessian outbound bc832f6acacf:v585");
 Fri, 07 Mar 2025 09:20:27 +0000
Received: from L7d429e545f6f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C53AF3C4-7A72-40D6-A134-9D2B69BE8FA1.1; 
 Fri, 07 Mar 2025 09:20:20 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L7d429e545f6f.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 07 Mar 2025 09:20:20 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB9268.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 09:20:18 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Fri, 7 Mar 2025
 09:20:18 +0000
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
X-Inumbo-ID: 6b01a38b-fb35-11ef-9ab5-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fzrJMHvDHcTD/QXFnkRO1TSXWr7ty2Y0TGI5/Kee4yE9VwZuKV14TuJkxULkrN/lCoPEJ8+7MNeIwwOg1gjSqrT3ZFerdsmIIzq6u43Fg3gzAzvTBGLsbiN34tYU0qSyR7CwyjQugqJiw3OxZsONpbv6wQigrqjem+Ml6IxBuIBXuOuYenfCD2MUOTpi4vHB8NT+QSSLSceWM4OqMypfOieLhJ9A29GuD25fqupg5kcCEHa/NI9DVfvthkaAf9VZZ7vF9qHwOAuWowy7Ip7FTDELs5RJDINZDJBUgh5iG0/uoLmn9cIdIEm+FKhM07sbKQNQS4N0zGvvFcHnCkp0lw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYL4OYVij4c+8oBG6Tjq29RndlZHUzxVFHP4bAybbfc=;
 b=em/OgqgUfXxsymgTuMiNwlT72XUlpcVvu+jJVMbWf/QR7q/JGWPOJCRzvBEgAup9qtrKG1M8YDwRqLAYTiGGW4FG4mB1pbEFgZrcekW1tDbQz99ltPi4RMe8BIJ45De3TbkGj+eyjnSjbSCG1waLmVf96hXXfYH6oY6jbKCuc9NvczYY1IScigrKBCMbNdcffk7s7Gbzu8NSDNTVQ4/BblJdd8e7sJeHD750+xAT83PNH7oAHopxYPqyQV9H/pAqb/8WJyi32iliP7d38nizL6CAM6mzy9yzVw4T0OCKJxrs1Ac9Cc04081MSg9nln7HwVfIu5xiJtmsn5EtjaEA8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYL4OYVij4c+8oBG6Tjq29RndlZHUzxVFHP4bAybbfc=;
 b=HU8d+sVtBCpTaH6QRXuq53Zx45NNLUFh77on21vtP4LsMBwkYa5hDMBnkmmVdXyEFxFA+DPnGWyuanzNE/lrr0tCi/KZO7YOIVcE64Wjg5jdPxPBv4BKYK6gK8KQKlrCzskz/5X5Cgbo5eHDhALpmUm1vLfDjkONqdQ8RXR3WFU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 899bc6055df7dd41
X-TessianGatewayMetadata: rfVWmk5wODMGhHOimxGu5QKRX6jKbIHkk8NMsABisP2sUq0phyGDUvphtkUFgvqbpHW6ZksFHvs5Jo6LMVylQMVJgHBi0BYYUY0aWgP3TdmpF1eTvBiUKQ324CeyDdgiYV/yyWoCt1u8kxx+FHG6QmILOTpBK7OM4PAw/a3v0GA=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERAWiv7btaYTQaday9k/QR4QoU87p7YgMTjST6nRxgUKZQIAtIJyqdnKhnRzjFHk8OqC2vaGDTHsv/6uOCSg6c0I1MKLGFmBWNJaQX4PoOW96Y/Zr5Bsd801V7Q3RhPQA9WANYJa37Qhf0O813j0O0TojA4IQD75bHrZqpw1Kpoy93eqtaw+lDhPJ8OpUxgDZbKj0slUdMvgQ8FjjGwQrQwBwxBRpr4mKo1fVfUFGbav1pnnRn1tDLVGjYr7y7fBCebUopwTJPmHERCYszkGMU+5Y2YEdmh9Cu/lewrziMIquKjXKRndi3GEGHpFOaCm8My6M5F9YLjRFwNJMC+LVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYL4OYVij4c+8oBG6Tjq29RndlZHUzxVFHP4bAybbfc=;
 b=yIg78nCF1ovGHX5/iwursHG6q+UnRd34MmLhELvZ2LuThvL1qInpW3GN71AdYi3/Qy72a5cC1L95y1kSH6XfMIV/5PD9ULTyygLKuMB8Paye9nZbg2os2yNmQC012w85vMfA0a66SJN05iDhtBNmh18agM0QIaJuLVcK7+DJUFiGwsHJ8Vq2RpcGRmN/qqwsUMlTPbVfdRAplZiMM2OeHsPMJD/YlrYgUp1qqyEBjA+TbGWOdZAsFY3qYUaO077Q+artPRJ+/5enqi8IMnEwWRKuatLLC7eMgZ4BMQFSCSgHzopqpqyuMHdTXUq2BY5j9gAoi2suWOCaYTSACBEVVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYL4OYVij4c+8oBG6Tjq29RndlZHUzxVFHP4bAybbfc=;
 b=HU8d+sVtBCpTaH6QRXuq53Zx45NNLUFh77on21vtP4LsMBwkYa5hDMBnkmmVdXyEFxFA+DPnGWyuanzNE/lrr0tCi/KZO7YOIVcE64Wjg5jdPxPBv4BKYK6gK8KQKlrCzskz/5X5Cgbo5eHDhALpmUm1vLfDjkONqdQ8RXR3WFU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Topic: [PATCH v4 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
Thread-Index: AQHbjzbI53lezYd1hUSXD4RbGtfICrNnYsoAgAAC7IA=
Date: Fri, 7 Mar 2025 09:20:18 +0000
Message-ID: <F4801232-DC72-44D4-AF0D-EFDF5D2B3202@arm.com>
References: <20250307075818.740649-1-luca.fancellu@arm.com>
 <20250307075818.740649-2-luca.fancellu@arm.com>
 <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
In-Reply-To: <9a257d60-3047-4d8a-b461-ce793d5f89e8@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB9268:EE_|AM3PEPF0000A79B:EE_|DU2PR08MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bfd6348-5bb5-4a86-b00f-08dd5d594ca6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dFBzWTk4Z3Q1NlA2V3hZbUpYR09qZll6V1Y2UThQaXdDS1M0Y0owRmtKSkRT?=
 =?utf-8?B?NEE5d1Z3OEo1TktnV0FMOWh0b3BERlNzT25aMmVUbUlUNWVxQWJhc3RVRlRJ?=
 =?utf-8?B?OHNiVEx3S1Z4djZqYkJ5RGlDSmN1SW1BZHB6eHk1YmJlZmhaTmZzN0RaWnJT?=
 =?utf-8?B?Q2J5QVlFSUh4M1J3NllyVEJEV2V3RDR1Vm1GOTVKMDBybWZFMnRBbStRZXgx?=
 =?utf-8?B?bXgzSHJUSy92U3cybGp1dCs0T0VkVlJYQ1d2ZGN5eGppZ0xaRVpYaUlQV3U1?=
 =?utf-8?B?UWpieUU4VmF2dkhiM3VRWmF6T3N6NjBwS2cyRlFwMjlVTEZKOEo3Z1BaUUFz?=
 =?utf-8?B?MjM0bkVQcVR1TitabEpoMStmWHlXcTkyTkR0Mjg3bTR6RU91SzZCM0xFSzg0?=
 =?utf-8?B?VlVtRmtyNEZUazY2UFg2bnIxaldFak9saW9JbjZHMjVwSCtUM21aN2hteW0z?=
 =?utf-8?B?S29KQ0dlaTAwclREeUNFSzFkaXYzYWNhcFVHYy9SMTVYZU1oUnIreGtHRjBl?=
 =?utf-8?B?akx0UUhVSytzY0pLZFcxdGpxaUowakxIek5TQWlqU0UzNlVEa2UxQXZFcUph?=
 =?utf-8?B?dFJvY2V1WmlHNWwyMWR4TlhhZGlGOFA5UDhJb1lnMGJTZFFkSlFSNm1hRUN4?=
 =?utf-8?B?YkRIRzZNbi8wV2ZoU1RtMkRNeWRQNmRVM3JRYW82YUNFM2JqM083V3R4SjJH?=
 =?utf-8?B?eUVkMGlVUUxJZnBORG5jaU4vd3FiRXo3TWM1WS9KZGhSNWFTZW1EQlRucmo0?=
 =?utf-8?B?dGlCYXovMFpmOUtYbG5JZUp2VUxzeHo3MzluOW1mQmZMcXN0eDdobDNnbVJv?=
 =?utf-8?B?cDkrdEwrTE9OVTlZbzhENmhtYUFkUVJiWjhrcGMrQ08vZE9Jbk9RM0NkYm5x?=
 =?utf-8?B?Tkx2dEs0WDJxbGtXeGkzaGRlNGxiSXpSTzh4djZEZWp1QVNjYks4Z2ZmU0tN?=
 =?utf-8?B?RWVNWjNVNmRJVWtsOVdWNUNSRVJtbXFHTzJyNnVKVlhua0ZpcUhVQk1TSGw1?=
 =?utf-8?B?bnhHNTQzKzdJbm1vcEV6RzVSQ0JRZ25RWmQ3RzNCYzgxUWN4bTdBdUJNdmdH?=
 =?utf-8?B?THBjNXZWdlIrbk9pamYxclM3VU4vV2hKUTFTYWZScEVJTEQvRnV0Y2FqNHhT?=
 =?utf-8?B?QXQ4TmpqdUFEZkJGd0NHeTRUdUNiQjkyQUZwR2p6dGJ2MGlNMDgwRUZYMUpB?=
 =?utf-8?B?a2N2b2VRVjFXVVpLWDZjekh6ZnBQWEp3ZDY1Q2RnV1V2aU9kbjc1TlpnSEls?=
 =?utf-8?B?enE1RUR6Slc3UEtzdzlyYlRhUVhOcnFGcEZ5enc0N0xoUHk0bTQyN2I1VnNj?=
 =?utf-8?B?WjJVVTVBUms3QVk5Qk9tMk5KR1d4d1dQbHhaWkRSejZ6bjlFMVBkY3dPcXBD?=
 =?utf-8?B?TW5nU29NQzVxWTY0bzc2cFZvOVpobUZnNWdKTWwvYkRXaDgwUnRzV1BleURa?=
 =?utf-8?B?SVVpdzIrUE9zOWlOREx1NDRCK0hiWlNOTjZqZTBwNWNxeG8wQ2IyTG51dnl3?=
 =?utf-8?B?dlJScHFWMDZHRHFqUG1NNDdPSnIxZXdCb1dpdlFxK1pQMm9hRlRzeFBPSVk4?=
 =?utf-8?B?L2I3ZmxVMTFjOTdqRmsvVVlrRU5yb1VpTmtRMkRjdCtvN2FZWHl1SE5aZlp1?=
 =?utf-8?B?Y0ZVV2FJczZYb2VFUzJzZUxFeUpzQ0ZVVW1wWXZDN1JwaDFiVU9IMGI5ZjVJ?=
 =?utf-8?B?dHpFNURNcnJmb1ErUDJENm1oSEV5bDlSTEQ3dDN3NmszclNEM3IvcXZFZFBG?=
 =?utf-8?B?VUMwbEQ0Y3NYaUcrZ0crRFI5RVFsVVNMTHVPc1EyUFNYYmE3OXlQa1BkbXZm?=
 =?utf-8?B?dTdiMmYzUVJYTUthSE5YeDFZU0puVXRBVUpvM3N5bERpblB2L2RzZW4zaXVL?=
 =?utf-8?B?dkpvZ1lEbGdzZjVFOGw3V0RCVHQybkRmeVA4QmtmM2pGMjJOTXJpVCtHNWsr?=
 =?utf-8?Q?TTnwD2e/mNbMWQ98x8iYQyzbB8cyB/ol?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <894FF18736BF14448738BD8A3742AD89@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9268
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55b04427-56d5-498f-32ba-08dd5d594718
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|376014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cUx5VUl0VFI3QXlHK2h0aWlvUGhqU2x6TmVCQjVaOWRKMG5ZTWluUklyOTkw?=
 =?utf-8?B?MmhOZmp5YU1qa0RLRUVrMDREc2ZVcEtxR21DSjFacGg0ZExJYkkvSFR2MDhE?=
 =?utf-8?B?b3pqZVQ0Mm5IcWVGTk1FZ2ttWmkwSTFEVWl2VzBzWnNxZ0NuSyt3K0lDQVQ0?=
 =?utf-8?B?RWN3VlZJSCtCMmFkZjJWUWt2dE12S1FJZ2VOMXVYRG12dFVlanZuaEo2Z1NB?=
 =?utf-8?B?UmovcnRzR3lNTFMrUnRqQU9rQnZjeHRKZUtwSFNvMmZMcTZHdk0xOEs0N1hG?=
 =?utf-8?B?Q3pDWTBDVmpSZVpMdVptVFdVRVQ5Snc2a0NnNmZpaTArRUFxVVFCZnB2OE1O?=
 =?utf-8?B?YjFkZXBqSC9XQ1FRNFBrNVduTlVtc3JYQ1VQY3diMzI2T2dpNmlUQ0d4S09U?=
 =?utf-8?B?K3R2UWRWT045Z0JVYWZEemNNVWVnM3AvT3VoQlJuM3QxTE84dWpSNGwyWTdq?=
 =?utf-8?B?L3hFRkN1cWxqcGpmV3NHYk1VZStyZzlyTVJHbUlGYnVTWDcwc2l0V2hoWkhN?=
 =?utf-8?B?ZlZFSTlmd2Z2cWFLRHlBVUNpMzZ0b1lLZzFwM0graDluUThTSXR3bDh6cmFp?=
 =?utf-8?B?aW5RMWNZUVBYTHE3dmNXSHBHdTN3MmxITVd4Nk9oL0tpQVE5YW14NXh3M2Jk?=
 =?utf-8?B?SHJmOUF5eVg1c1BrREhIN0hnRWUycjJpSFVzOVJ3aTQ4WXd3VFliRWNIRFJt?=
 =?utf-8?B?MWxjcEorVFArOVJibXZZS1R6RWF3UW1UWVQweWVZVGFweW9KdWovL0ptejJQ?=
 =?utf-8?B?bStoYTRxOGtNdGw5RmFSdDNMbW16TS9aYkVIY21FKzd4TWxRQzE5R3B0NS83?=
 =?utf-8?B?YllqeXdYT2Fmd3BRNkhia0Njei85RlN0U0xWWEpzTU9ldmU4VjV1dmZSQ251?=
 =?utf-8?B?Z3VYUG5GTjcxQmtDdDRvUjNhZWo4TzU1U0ljYVdyTjloSGpvVWdiQmR1Um82?=
 =?utf-8?B?YXA3MCt5cnBpUzRqc09SZjFRcmJZMDJXU3NFbU4raGdrSkMzdlplZnhUK2JM?=
 =?utf-8?B?TUlDQ3Z4SHZyV1dKMW9SbW9TaHVsS2F6aUtZemF1OURPRlFhSUtiaHQrcGdZ?=
 =?utf-8?B?cmlQS0FaOGZ0N3ZJbnpVZ29YQnlaUjhLZnV2a05qNUJaTnZyVDFJNnlTKzB1?=
 =?utf-8?B?SW5ibTdDc29INWxIb3M3V2pyaTN4Y2NYRFUvQmVMRlJxbFd6L1pnRXgwZWhy?=
 =?utf-8?B?aTVXQmh4WU5mMmhadzEwZEo2QTBaS29wQzduYnR6MUJkeFl2NlAycDVRUUt0?=
 =?utf-8?B?WWd5VlVmMFZ1UThTeUxSbnlQakduTmpvMVdZdlVxOHEvaTZwUjFXcXE0SVV4?=
 =?utf-8?B?bDZjT0JiRmF2bUtIc01mV05BS2w4ekRQM045MDEzRHQ5bStPVG8vRE11NEdH?=
 =?utf-8?B?UkhxOGhRa09UUU4vYU94eVp0VUUrL213bWxyMzF3ZjZaT3RkTkl5MEIxTUZB?=
 =?utf-8?B?OGZwd2VDRE0wcTdNa1lESFIxQklBcktpK1h5cEltWGUxOE0wN3BXU1pTa0Ey?=
 =?utf-8?B?TStRQ21QZUh1UVFVK05GOWozT2I4Q0gzcFdoZzd4azNHNFN5OTJiMWErSm13?=
 =?utf-8?B?UW1VRGhiN1hFc0Irb2pnTzZ2WU5MaENRNUtKaUI4TVg0VWtwOXVRZTAxM1Js?=
 =?utf-8?B?Y2dnL1lMdmNBak5HZkQ0MDVMdTRPT1RTUUkzNmxmQ1pySnFpNVpiNnNkMFFw?=
 =?utf-8?B?MkFSSWxJVk90a0gyakpoRG9namt6TGNsZ0dicVJCYkZqRTVKUkt6eFhSRkRZ?=
 =?utf-8?B?d2doNE1YMEdNa2pMQlVMTHp3NE52aVgxS2x6UXJDSGFOM0k5YnZmaUtUc00r?=
 =?utf-8?B?bndlT2JrNjA3Z0xQaS9WMnFCZG9wR0sza29iUVd4K05LNzdpdDJyQ1NuSGxt?=
 =?utf-8?B?ODg1WkxjYmMzM1ZKdkFzdDJmSTUvZFdybTA5YzlqYjBiR1ZFaktCWFRPVXZa?=
 =?utf-8?B?d0VDRUxQbHhPcHdHbFVrNyt4Q1lXbDZKV0p3SFZUR2JnbkR2V3YvUkEzMGFX?=
 =?utf-8?Q?cPAQfNtwJQRJ9+/4wkYcj2YT9IokdE=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(376014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 09:20:27.5318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bfd6348-5bb5-4a86-b00f-08dd5d594ca6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7374

SGkgSnVsaWVuLA0KDQo+IE9uIDcgTWFyIDIwMjUsIGF0IDA5OjA5LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAwNy8wMy8yMDI1
IDA3OjU4LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gV2hlbiBYZW4gaXMgYnVpbHQgd2l0aG91
dCBIQVNfUEFTU1RIUk9VR0gsIHRoZXJlIGFyZSBzb21lIHBhcnRzDQo+PiBpbiBhcm0gd2hlcmUg
aW9tbXVfKiBmdW5jdGlvbnMgYXJlIGNhbGxlZCBpbiB0aGUgY29kZWJhc2UsIGJ1dA0KPj4gdGhl
aXIgaW1wbGVtZW50YXRpb24gaXMgdW5kZXIgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2ggdGhhdCBp
cw0KPj4gbm90IGJ1aWx0Lg0KPj4gU28gcHJvdmlkZSBzb21lIHN0dWIgZm9yIHRoZXNlIGZ1bmN0
aW9ucyBpbiBvcmRlciB0byBidWlsZCBYZW4NCj4+IHdoZW4gIUhBU19QQVNTVEhST1VHSCwgd2hp
Y2ggaXMgdGhlIGNhc2UgZm9yIGV4YW1wbGUgb24gc3lzdGVtcw0KPj4gd2l0aCBNUFUgc3VwcG9y
dC4NCj4+IEZvciBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nKCkgaW4gdGhlIEFybSBwYXJ0LCBt
b2RpZnkgdGhlIG1hY3JvDQo+PiB0byB1c2UgSVNfRU5BQkxFRCBmb3IgdGhlIEhBU19QQVNTVEhS
T1VHSCBLY29uZmlnLg0KPj4gRml4ZXM6IDAzODhhNTk3OWIyMSAoInhlbi9hcm06IG1wdTogSW50
cm9kdWNlIGNob2ljZSBiZXR3ZWVuIE1NVSBhbmQgTVBVIikNCj4+IFNpZ25lZC1vZmYtYnk6IEx1
Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4gdjQgY2hhbmdl
czoNCj4+ICAtIHJlLWludHJvZHVjZWQgc3R1YiBmb3IgaW9tbXVfdXNlX2hhcF9wdCwgU3RlZmFu
byBzdWdnZXN0ZWQNCj4+ICAgIGl0IGlzIG9rIHRvIGhhdmUgaXQgaW4gaW9tbXUuaC4NCj4+ICAt
IFJld29yZGVkIGNvbW1lbnQgaW4gaW9tbXVfZG9tYWluX2luaXQgZnJvbSBKYW4gc3VnZ2VzdGlv
bg0KPj4gdjMgQ2hhbmdlczoNCj4+ICAtIHJlbW92ZWQgc3R1YiBmb3IgaW9tbXVfdXNlX2hhcF9w
dCwgYW5vdGhlciBzb2x1dGlvbiB3aWxsIGJlDQo+PiAgICBkb25lIGZvciB0aGUgaW5zdGFuY2Ug
aW4gY29tbW9uIGFybSBjb2RlLg0KPj4gIC0gTW92ZWQgYSBjb21tZW50IGNsb3NlIHRvIHRoZSBt
YWNybyBpdCB3YXMgcmVmZXJyZWQgdG8NCj4+ICAtIGFkZCBjb21tZW50IHRvIGlvbW11X2RvbWFp
bl9pbml0KCkgc3R1Yg0KPj4gIC0gbW9kaWZpZWQgY29tbWl0IG1lc3NhZ2UNCj4+ICAtIEFkZCBm
aXhlcyB0YWcNCj4+IHYyIENoYW5nZXM6DQo+PiAgLSBtb2RpZnkgZ250dGFiX25lZWRfaW9tbXVf
bWFwcGluZyB0byB1c2UgSVNfRU5BQkxFRA0KPj4gIC0gcmVtb3ZlZCBtYWNybyB0aGF0IGRpZG4n
dCBhbGxvdyBzb21lIG9mIHRoZSBwYXJhbWV0ZXIgdG8gYmUNCj4+ICAgIGV2YWx1YXRlZA0KPj4g
IC0gQ2hhbmdlZCBjb21taXQgbWVzc2FnZQ0KPj4gLS0tDQo+PiAtLS0NCj4+ICB4ZW4vYXJjaC9h
cm0vaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaCB8ICA1ICstLQ0KPj4gIHhlbi9pbmNsdWRlL3hl
bi9pb21tdS5oICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrKysrKysrKysrKy0N
Cj4+ICAyIGZpbGVzIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dyYW50X3RhYmxlLmggYi94
ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ3JhbnRfdGFibGUuaA0KPj4gaW5kZXggZDNjNTE4YTky
NmI5Li5jNWQ4N2I2MGM0ZGYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vZ3JhbnRfdGFibGUuaA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dyYW50
X3RhYmxlLmgNCj4+IEBAIC03Myw4ICs3Myw5IEBAIGludCByZXBsYWNlX2dyYW50X2hvc3RfbWFw
cGluZyh1aW50NjRfdCBncGFkZHIsIG1mbl90IGZyYW1lLA0KPj4gICNkZWZpbmUgZ250dGFiX3N0
YXR1c19nZm4oZCwgdCwgaSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
DQo+PiAgICAgIHBhZ2VfZ2V0X3hlbmhlYXBfZ2ZuKGdudHRhYl9zdGF0dXNfcGFnZSh0LCBpKSkN
Cj4+ICAtI2RlZmluZSBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nKGQpICAgICAgICAgICAgICAg
ICAgICBcDQo+PiAtICAgIChpc19kb21haW5fZGlyZWN0X21hcHBlZChkKSAmJiBpc19pb21tdV9l
bmFibGVkKGQpKQ0KPj4gKyNkZWZpbmUgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArICAgIChJU19FTkFCTEVEKENP
TkZJR19IQVNfUEFTU1RIUk9VR0gpICYmIGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICYmIFwN
Cj4+ICsgICAgIGlzX2lvbW11X2VuYWJsZWQoZCkpDQo+PiAgICAjZW5kaWYgLyogX19BU01fR1JB
TlRfVEFCTEVfSF9fICovDQo+PiAgLyoNCj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
aW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+PiBpbmRleCA3N2E1MTQwMTljYzYu
LjVhYzAzODUyMWUyMyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaA0KPj4gQEAgLTExMCw2ICsxMTAsOCBAQCBl
eHRlcm4gaW50OF90IGlvbW11X2h3ZG9tX3Jlc2VydmVkOw0KPj4gICAgZXh0ZXJuIHVuc2lnbmVk
IGludCBpb21tdV9kZXZfaW90bGJfdGltZW91dDsNCj4+ICArI2lmZGVmIENPTkZJR19IQVNfUEFT
U1RIUk9VR0gNCj4+ICsNCj4+ICBpbnQgaW9tbXVfc2V0dXAodm9pZCk7DQo+PiAgaW50IGlvbW11
X2hhcmR3YXJlX3NldHVwKHZvaWQpOw0KPj4gIEBAIC0xMjIsNiArMTI0LDI4IEBAIGludCBhcmNo
X2lvbW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpOw0KPj4gIHZvaWQgYXJjaF9pb21t
dV9jaGVja19hdXRvdHJhbnNsYXRlZF9od2RvbShzdHJ1Y3QgZG9tYWluICpkKTsNCj4+ICB2b2lk
IGFyY2hfaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKTsNCj4+ICArI2Vsc2UNCj4+
ICsNCj4+ICtzdGF0aWMgaW5saW5lIGludCBpb21tdV9zZXR1cCh2b2lkKQ0KPj4gK3sNCj4+ICsg
ICAgcmV0dXJuIC1FTk9ERVY7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IGlv
bW11X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBvcHRzKQ0KPj4g
K3sNCj4+ICsgICAgLyoNCj4+ICsgICAgICogUmV0dXJuIGFzIHRoZSByZWFsIGlvbW11X2RvbWFp
bl9pbml0KCkgd291bGQ6IFN1Y2Nlc3Mgd2hlbg0KPj4gKyAgICAgKiAhaXNfaW9tbXVfZW5hYmxl
ZCgpLCBmb2xsb3dpbmcgZnJvbSAhaW9tbXVfZW5hYmxlZCB3aGVuICFIQVNfUEFTU1RIUk9VR0gN
Cj4+ICsgICAgICovDQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMg
aW5saW5lIHZvaWQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKSB7fQ0KPj4gKw0K
Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBpb21tdV9kb21haW5fZGVzdHJveShzdHJ1Y3QgZG9tYWlu
ICpkKSB7fQ0KPj4gKw0KPj4gKyNlbmRpZiAvKiBIQVNfUEFTU1RIUk9VR0ggKi8NCj4+ICsNCj4+
ICAvKg0KPj4gICAqIFRoZSBmb2xsb3dpbmcgZmxhZ3MgYXJlIHBhc3NlZCB0byBtYXAgKGFwcGxp
Y2FibGUgb25lcyBhbHNvIHRvIHVubWFwKQ0KPj4gICAqIG9wZXJhdGlvbnMsIHdoaWxlIHNvbWUg
YXJlIHBhc3NlZCBiYWNrIGJ5IGxvb2t1cCBvcGVyYXRpb25zLg0KPj4gQEAgLTIwOSw2ICsyMzMs
OCBAQCBzdHJ1Y3QgbXNpX21zZzsNCj4+ICAjaWZkZWYgQ09ORklHX0hBU19ERVZJQ0VfVFJFRQ0K
Pj4gICNpbmNsdWRlIDx4ZW4vZGV2aWNlX3RyZWUuaD4NCj4+ICArI2lmZGVmIENPTkZJR19IQVNf
UEFTU1RIUk9VR0gNCj4+ICsNCj4+ICBpbnQgaW9tbXVfYXNzaWduX2R0X2RldmljZShzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRldik7DQo+PiAgaW50IGlvbW11X2Rl
YXNzaWduX2R0X2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUg
KmRldik7DQo+PiAgaW50IGlvbW11X2R0X2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQpOw0K
Pj4gQEAgLTIzOCw2ICsyNjQsMjYgQEAgaW50IGlvbW11X2RvX2R0X2RvbWN0bChzdHJ1Y3QgeGVu
X2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLA0KPj4gICAqLw0KPj4gIGludCBpb21t
dV9yZW1vdmVfZHRfZGV2aWNlKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbnApOw0KPj4gICsjZWxz
ZQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IGlvbW11X2Fzc2lnbl9kdF9kZXZpY2Uoc3Ry
dWN0IGRvbWFpbiAqZCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KQ0KPj4gK3sNCj4+ICsgICAgcmV0dXJuIC1F
SU5WQUw7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbmxpbmUgaW50IGlvbW11X2FkZF9kdF9k
ZXZpY2Uoc3RydWN0IGR0X2RldmljZV9ub2RlICpucCkNCj4+ICt7DQo+PiArICAgIHJldHVybiAx
Ow0KPiANCj4gSSB3b3VsZCBzdWdnZXN0IHRvIGFkZCBhIGNvbW1lbnQgZXhwbGFpbiB3aGF0IDEg
bWVhbnMuIElJUkMsIHRoaXMgbWVhbnMgIm5vIGlvbW11IiBwcmVzZW50Lg0KDQpXb3VsZCBpdCBi
ZSBvayBzb21ldGhpbmcgbGlrZSBpbiBpb21tdV9kb21haW5faW5pdDoNCg0KLyoNCiAqIFJldHVy
bnMgYXMgdGhlIHJlYWwgaW9tbXVfYWRkX2R0X2RldmljZSgpIHdvdWxkOiBFcnJvciDigJxubyBp
b21tdSIgYmVjYXVzZQ0KICogIWlvbW11X2VuYWJsZWQgZHVlIHRvIHRoZSBmYWN0IHRoYXQgIUhB
U19QQVNTVEhST1VHSA0KICovDQoNCj4gDQo+IE90aGVyIHRoYW4gdGhhdDoNCj4gDQo+IEFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KPiANCg0K

