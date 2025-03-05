Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23D2A4F9E4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901937.1309930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkzq-0007AJ-AL; Wed, 05 Mar 2025 09:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901937.1309930; Wed, 05 Mar 2025 09:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkzq-000786-6K; Wed, 05 Mar 2025 09:24:58 +0000
Received: by outflank-mailman (input) for mailman id 901937;
 Wed, 05 Mar 2025 09:24:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XpfQ=VY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tpkzo-00077t-NA
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:24:57 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2838939-f9a3-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 10:24:54 +0100 (CET)
Received: from PA7P264CA0092.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:348::17)
 by PAXPR08MB6496.eurprd08.prod.outlook.com (2603:10a6:102:df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 09:24:52 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:102:348:cafe::46) by PA7P264CA0092.outlook.office365.com
 (2603:10a6:102:348::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.16 via Frontend Transport; Wed,
 5 Mar 2025 09:24:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Wed, 5 Mar 2025 09:24:51 +0000
Received: ("Tessian outbound a60532193129:v585");
 Wed, 05 Mar 2025 09:24:50 +0000
Received: from Ld17594ce3a55.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1541F6B1-4B7E-4F3C-9D3C-F83AD891838B.1; 
 Wed, 05 Mar 2025 09:24:44 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld17594ce3a55.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 05 Mar 2025 09:24:44 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by VE1PR08MB5823.eurprd08.prod.outlook.com (2603:10a6:800:1a5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Wed, 5 Mar
 2025 09:24:41 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8489.028; Wed, 5 Mar 2025
 09:24:41 +0000
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
X-Inumbo-ID: b2838939-f9a3-11ef-9ab4-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WhswC5ivDlgGICy++OMMn2mpK45XE/71t8PlGxmdkL4N7Mj4rdY8n86hIK3FKYlyAb/NdmVi6/9ahzcZEDMa+iebcsUs4Z2nJACICZrpeFha1puushfFxbeCKdnA9+mHGDyaJanbE0ZfmO9J1/BEcEhsto/KC12Ws7sJTijIs465N6BcBrDEBl638FPY9EzkNkWu5CdJmzPINIbKU85mYR+7GwLhm9SNR2wPMCBsTaCa+A29kPqBJuVn/fOK55XjnmAaeUVKEy8qC1iG20z18/Oy0ebrcjLQ5wVbo+PsJEpXQtfvkHqvIZGo2gEBUzcGSJx8AeOo2jEh3KpQ+rkNDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYuYfwMKZ8me/M6QcsraPR/Mad2i7S8cyP8tNlCYxVI=;
 b=oDDkn8647Nr08i7QDBndCSYkbufqRxjufvZRutsbZdl0xH87CL3hBqF5doZdqBzGuUbnNfUByvYh0WcnrtwsOEdxjRaIGgjaBDQ1+npgp0gMcoVv61WESquLE8rJESgCDXstmcJHmzE4LRgAT2vNj9c/J6oBpMQauJ8lfFX3rZqFohoSmw1qIh1z9pdFXHjdcRtkeTOgwDeUW+i9vrKnHv/NqhwPh+tjYNg9w5btxNOddJ24DwDbe4f0N5aPB6g+26LUxOz1wRaP8bdz2j6gQuFjO5Qb0egLKK19zvm/7EuX8eIpNLRnbPhzhBEPdwO05lWQkK/7XJJ2SQ3Y2w6k4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYuYfwMKZ8me/M6QcsraPR/Mad2i7S8cyP8tNlCYxVI=;
 b=rWcrh6cJw1i5/qySMzC5d504wSgggNUI2oBxSkmtq+xFpIdXABJDg34+JIUfIDFkpHfgP8LyOkiActr/uqGzVzhAlKJbDQZGwxEDsglQAN1duGqkD8CC5gRC8fbFe/KU/c+4zJH/F0dY8uijRldNlwSaZYhMXkyO3SGcOw3S93Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1f979b957a858f3
X-TessianGatewayMetadata: tB8fe+M2AekLBv9G5sQvJFcfLjD/sjYSvhMoAAFlGU4QkIvpcT+eicgTUIBtMBclpKCvhj4yzAWCedIVPVxratdIbF7xTmMeRvXFAM9Ie4/efvn1ziIxhBjmAudsQYm/RHU15LMGQPWJYE5RJ6c/jAtI1jU8frkb+msJ4IwRwXI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZz+hpooeFJe4D6mKDwvQ9hx5uT1ZUlJzr04ngsx6WckpOTV9tGhCHMZ/Muc57wuSrlwYQcn5wxelJSN+ETwdbYRyQ53FsIHvy5lYTz+xoEdipqDsfVLJA3UbwoZNsviwLyyjiAU1bashmTLCb9SdpxuodxTl6uPvKvCbKEM6UznFs312R6g8aSh25ozTGdZTUkxf0LDet5TQwLSXa8aZzUkiR152F6TmfmDRM4DUShXlGaPqHxYrXTR+n6PvaGVPTo3PsaySv9g7SuZymuIJInSIxTRaXhcRl0sQRdVjjf6cyrdjml8Hd3tRWZ1H16M4GWKINV1P8HzIrwhSRZXzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYuYfwMKZ8me/M6QcsraPR/Mad2i7S8cyP8tNlCYxVI=;
 b=xlwJvx32teNRlrksyW89Htz+3r0Mz/uOvT6DAd5VvPNcHGVu4KCvhQRR1cinufBl58NxDIrx8j4CDi/2dmwGmsZd3+NflMrMa3hDdpKj76B0QZS8t7q4xMlQzaUHC4aLmsGGO3dGpscwO4pgzTypzHVXO+K/o9JEyKztExXjJulmiMWYAnpYGTS0+d6UKfyXsVEdMk+W9NjnExKOHaBjw9Qsw3XkDB4QXbMzkTUDnMMjSORMuRglh17BMbGyYoz4kLcbU158rAon4A6UYs9NRAC06Ezqjv4/Rm6T1ZH+zsV1baE7iIOGhuYzu/4L8HB1J7WGreqXJD3XZLLLEOs0Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYuYfwMKZ8me/M6QcsraPR/Mad2i7S8cyP8tNlCYxVI=;
 b=rWcrh6cJw1i5/qySMzC5d504wSgggNUI2oBxSkmtq+xFpIdXABJDg34+JIUfIDFkpHfgP8LyOkiActr/uqGzVzhAlKJbDQZGwxEDsglQAN1duGqkD8CC5gRC8fbFe/KU/c+4zJH/F0dY8uijRldNlwSaZYhMXkyO3SGcOw3S93Q=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "Orzel, Michal" <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
Thread-Topic: [PATCH v3 2/2] xen/arm: Restrict Kconfig configuration for LLC
 coloring
Thread-Index:
 AQHbgerA9DmOxi5W4Eufnv1ogXYtfbNNErSAgAAVW4CAAAFcgIAVxqqAgACA9ACAAOvXAA==
Date: Wed, 5 Mar 2025 09:24:41 +0000
Message-ID: <D9C8EF97-74F0-4DF1-A6D2-D5F95BBF1B1F@arm.com>
References: <20250218095130.2666580-1-luca.fancellu@arm.com>
 <20250218095130.2666580-3-luca.fancellu@arm.com>
 <eeb91fb4-ef2e-4f07-a1b8-1812f0371113@suse.com>
 <1133b3cc-4051-44d9-83ab-88c4c30f260a@amd.com>
 <4b31f272-2bb2-40d8-94d9-8137586b59fa@suse.com>
 <769DE9A1-0F3F-4564-9A37-0812ECCA3234@arm.com>
 <alpine.DEB.2.22.394.2503041119450.1303386@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2503041119450.1303386@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|VE1PR08MB5823:EE_|AMS1EPF00000042:EE_|PAXPR08MB6496:EE_
X-MS-Office365-Filtering-Correlation-Id: 08dff771-72c5-4573-868f-08dd5bc794f4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ZTqDSH0rUTTRNyZUSn0nG8kYRKN51eRBrDN0sgQkI/Gy42ijBwqUsHnEnW/A?=
 =?us-ascii?Q?vdgn4BSxM/SR127G4BlucOKmpFaOrX7DtIS7Sl8d0nGU90Xv1hGeznAFfdr5?=
 =?us-ascii?Q?kC6vwbkFprXFpPSjEn4QN6ahlM5u/DERvXWq7t3UbEpNWkX+6GR+H2rXoMBw?=
 =?us-ascii?Q?W4t1YDzw//fdVPx4DIdSn0qwX7hAWEKX0JY00tNkmWOO77I+HYcbfO4D+1h3?=
 =?us-ascii?Q?uxFsKEqqI7VgPvUdgDC7vbE8TZGTtWhGqOM4J0dicwBP2OProwFZLBX1+5KA?=
 =?us-ascii?Q?d2jO4oUznb2oltM9jNfokKgckVresbt16FNCQAc8qRsKaFHqklMGOaUW/mMV?=
 =?us-ascii?Q?7du1u8otsO/Kkae8/h7nYdUPSP8OgFOZWouUM8SgcaZ/qf1TR2N6S3yZW7nE?=
 =?us-ascii?Q?3UH/Qnn5yKkCHqcE0rc9EpF8vOxdeT8tOeiLdzHS8It283ur2XIg/rOAEbtS?=
 =?us-ascii?Q?fe7im+jbCh6Y/XwAaNOYtTGLVTbcBkbAAmJ73a+Z1jjLFDZ2yZYKUkWDpjoV?=
 =?us-ascii?Q?d0A93cFlGPaiBo+uTbkNywrnFyD+Pvwugadhwdae/jZoZMo03w888ZCoifow?=
 =?us-ascii?Q?98Vkkv9JPRqQBXdgrS/VD7DyQ26nyv+cAm4WPR0yG3xJfkfyVayj97qowcQX?=
 =?us-ascii?Q?GFXNo0k1UfECwDSFg7CNe4CdltXNVVj235Ksh5YlC3uCvkXvQBO/iebTuxXG?=
 =?us-ascii?Q?DdF458lIqL5nlW/MgZpDaapbAfakM1c+ipodlhaOcCE3qs2vUnClDJ5vyyPc?=
 =?us-ascii?Q?oRCesorDhKWtaBdnNTb8E7y1ig005eqAVtesLxWiNgooblu7sNpcaaWVFeJg?=
 =?us-ascii?Q?wcoiZvhO4mBAizjBDrj0z2sB/YLrF6RYJ+qsg4l330dSfD+NWfg+cruAkHmn?=
 =?us-ascii?Q?i7ZYSwvBUuYi3MDohfEgesXHR30RaojX8BtPzJloz6dO6GGdoNYSMa/NLZZe?=
 =?us-ascii?Q?rb/KsD0ITOSbvOu9uqAJQLDMpQVTzGMakFVPDTdHBQjGz9ua0nkegpwBxIPp?=
 =?us-ascii?Q?BJUBaY/f9+91zem2yyjs0n3nR7AihoI7aUms2BWjwpOV6AmX1MrwJtPEX8VW?=
 =?us-ascii?Q?txHJLaxJgA0wtuXpWf8M93B64eAmtmSrCjViaG7CidFiz6I8Z31ebUMb/PTq?=
 =?us-ascii?Q?acUmlpfRSwDXZJO4Pq+03Huq0vqPywG/1i04sgnDHmFOT6CEfHYeUHpozVV1?=
 =?us-ascii?Q?EVCJifGvIrZOpnQDW+gmyZBYkPwpxLCcZFPUQcBXBcmAob9SO2Eo3Ram8r9n?=
 =?us-ascii?Q?r1b4M0vxIkRaeefApC7huYaByqTbqWMG2hKD07YFTibpnFdYRqIx/2ee210c?=
 =?us-ascii?Q?o6QBLHJh4mPFA0rQN4WUfJAjMcK+SM43wfMgKHp1dcCojf2upx2yRrv9G8jx?=
 =?us-ascii?Q?AckzgE4zgR/ADqqsPc9YmXgnkJe15qTY03c5mTA6iehO6EfoJM2/yCwDB9Lw?=
 =?us-ascii?Q?JueAZrtpD0A83k7xof0SiwnOVo8NvTaj?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F61DB8FBD568474686D186C3DE2204CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5823
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7c55678f-f877-41a0-30f5-08dd5bc78f55
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|35042699022|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dqbQRqwtDJ/TDBOaY+5xZNVTun8j3VENEQ+J28U3urtgB8f13nmro8/KxDDl?=
 =?us-ascii?Q?VueqILlEIecHL9McvSdh47PuuaD8ZluI4M8FNEYfZNdfXSihjp4CEKxTYr9A?=
 =?us-ascii?Q?UyHRBEUG1C/drtqzyMTTpUOS4HWdu+ZNgyrVoGKY6iHeNv6WZBy2mClcc4+m?=
 =?us-ascii?Q?lJ2KN6j2bsw6N8LqcHzkUEL1Qm7DOe4ajlwgdlNA01MxUIM5xRq0SVVJqUQf?=
 =?us-ascii?Q?kllcY34ian9Er9HpmZY6rM1EHtGMYkFowvgLrKl2az2pTJ8a4W9wOMrmXay8?=
 =?us-ascii?Q?mPHT6v3KoDX099i5CSdWwGltWhJccrlyxdSgEw5AyAWsvqsbvmklApqrEcFa?=
 =?us-ascii?Q?AeozKsbmtPyAwE3VX2M5h5LloEoaR4CVkXAQXXOKPG8B2R8+QYyI/wOwn0Ix?=
 =?us-ascii?Q?Hg+Z7HYKN/6n6/j/5V30riko6Yh9e5QGKdFb4mcJmsOJGtap18HlTiNaFYyX?=
 =?us-ascii?Q?SBKpdYkictA7XzSKWOjPO0itMDo5LBUADtjuvq6RV0hyjZhcxZdo0wqpAp04?=
 =?us-ascii?Q?lZxuiY404n7ZfWPuvCn5/+1D44MaO/UJOYE5vH3jIxfsKu3aKPSZQwlgDsAI?=
 =?us-ascii?Q?h8vq32DJAvbpucvMjhz2xlBu3VhQ060sFN9Ziz10WLGR7++5D3z8HEm311VM?=
 =?us-ascii?Q?HNUE4PfyxUCdmbhmDL3tmthbbVZ8arQnhxzuhbJeZp7Qy3wDPMnVJ/aSGTNC?=
 =?us-ascii?Q?pFD536dXzPSNqHDWwUeOwGhVuWIHH5TxL6uwbDkM3GdrgwsECmi2N+59pv0P?=
 =?us-ascii?Q?H1lrxKf/g99SY1D7LkcZgvAaNuDjY1GKZnmZKytsbv5r27yzCSeBDLPdEwJo?=
 =?us-ascii?Q?yX4bwfKEwLpbDu31e+KSBxxtFT+/UtWEBZ6+792vZzEGeCo6uokKAyONT2Re?=
 =?us-ascii?Q?un5r/P7tvtTwhWGunineaZlbN8zb/4O6evwvtF0Mb+54C5eAcDCYCkVmZSvo?=
 =?us-ascii?Q?eore+S5eMPTH9RodertVGDSuK1JU/j/YHKWusd2Zw7S816vnQJNzQLfGX23e?=
 =?us-ascii?Q?ZgaftPL6+EoDtmciDwcvRKq83Pw1dxNTthWI7XH3tG4CXaRnr3Nu4kV481y4?=
 =?us-ascii?Q?VUycQ1Ltt8JM36/2cFvIeIVyfea4YdJr3oB0R64HaeyhuwIfLCAKfd8ts/kh?=
 =?us-ascii?Q?WebWDNRyJUIV2Y31cnlttv7RpZb+cqTmYX/SC2jZhdutaLqs9OAVN1SXY31H?=
 =?us-ascii?Q?d3JM98kRAzcvklplpDt2tycVnrZihagO56x4fQuxJS7LMYyBVhoUKd/UdjXi?=
 =?us-ascii?Q?1HG22l9nOoDfS0YSkegukrVRC7J25h44SKs/uxien9Tlj8WV/cpwhQRDFA4X?=
 =?us-ascii?Q?1/HT1VlmF2ff98OPEocdN2FBU2S+NCqn313u5p3KA+6Bq29zofnDZPkiIh0S?=
 =?us-ascii?Q?qUX+yBUCcPpEoPVaOZZVa4ZgaaUvCrcM6QrP/pwYUDUWsm1FEqPZ7vAA+Qxv?=
 =?us-ascii?Q?664UrKPzth4Kya1C9yWSNCqcPDB/owxPFntRIEDX9QNdjWMNeyurhW3NAQg1?=
 =?us-ascii?Q?goUuGO6nf/GFVMU=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 09:24:51.1682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08dff771-72c5-4573-868f-08dd5bc794f4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6496

Hi Stefano,

> On 4 Mar 2025, at 19:20, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 4 Mar 2025, Luca Fancellu wrote:
>> Hi,
>>=20
>>> On 18 Feb 2025, at 15:06, Jan Beulich <jbeulich@suse.com> wrote:
>>>=20
>>> On 18.02.2025 16:01, Orzel, Michal wrote:
>>>> On 18/02/2025 14:44, Jan Beulich wrote:
>>>>> On 18.02.2025 10:51, Luca Fancellu wrote:
>>>>>> LLC coloring can be used only on MMU system,
>>>>>=20
>>>>> Just for my own education: Why is this?
>>>> I read this as it refers to the feature we have in Xen, not the generi=
c concept.
>>>> You could in theory achieve cache coloring without MMU using static al=
location
>>>> or some custom allocator but in general we benefit from being able to =
map VA
>>>> to PA aligning with cache coloring scheme.
>>>=20
>>> Oh, okay. Then maybe the sentence would better be worded to express tha=
t
>>> it's our present choice, rather than an inherent limitation?
>>=20
>> Is this better? Can be addressed on commit?
>>=20
>> Xen LLC coloring feature can be used only on MMU system, move the code
>> that selects it from ARM_64 to MMU and add the ARM_64 dependency.
>=20
> Hi Luca, I think that's OK. Can this patch be committed without the
> previous patch in the series?

Yes it can, I think we need more time to get an agreement for the first pat=
ch,
probably Jan would like to see that together with the rest in order to unde=
rstand
if it goes to the right path or not.

Cheers,
Luca


