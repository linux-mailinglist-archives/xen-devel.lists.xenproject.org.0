Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B509F9F6308
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860207.1272263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrL5-00077T-Mu; Wed, 18 Dec 2024 10:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860207.1272263; Wed, 18 Dec 2024 10:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrL5-00074b-JH; Wed, 18 Dec 2024 10:31:35 +0000
Received: by outflank-mailman (input) for mailman id 860207;
 Wed, 18 Dec 2024 10:31:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNrL4-00073J-7p
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:31:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2612::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f8a0126-bd2b-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:31:32 +0100 (CET)
Received: from AS9PR06CA0766.eurprd06.prod.outlook.com (2603:10a6:20b:484::22)
 by VE1PR08MB5808.eurprd08.prod.outlook.com (2603:10a6:800:1a1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:31:27 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:484:cafe::1d) by AS9PR06CA0766.outlook.office365.com
 (2603:10a6:20b:484::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Wed,
 18 Dec 2024 10:31:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 10:31:26 +0000
Received: ("Tessian outbound 7762b28e8285:v528");
 Wed, 18 Dec 2024 10:31:26 +0000
Received: from L8ead62827de2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6494DB7D-C8AB-44FE-9231-92A304A622F3.1; 
 Wed, 18 Dec 2024 10:31:19 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L8ead62827de2.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 10:31:19 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA6PR08MB10596.eurprd08.prod.outlook.com (2603:10a6:102:3d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:31:17 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:31:17 +0000
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
X-Inumbo-ID: 3f8a0126-bd2b-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y86I6R2MbDliKRzoTz3vf+HJaz+pEhUn1CdjpN9kNG0UsNHcaoYxkA+WdErtdCEbUIAO7EloQXVhz9rUgvu7ofZKOjw6cpe/nk9B2Vvkc0Tm87E4n7OivuKzjG2pZvOhsprL9NStq2lwz4HoazXP3rYB5hb3jj3KIYTPiuVv042XLYLo11ID6qNdVE6MirSiOOLsfnDOCD4A1bUSvQ62YnPoS9VhBUhyg5K7U+gl+sC7PPndxX7Nz6LXHBVU/UcOJCq8XYQL8DyHSb2T92KrT5kgH+cc27UGXEjnlsml4hGdf+tHkJWxXkO3XOkvuWBHph96yWttlP1ZAImP3RzQKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvFb/YkbOfvCQQaqPS0KwmlWw53m68Z8ywAQu3takZo=;
 b=HZlcYzyJrJf7Am42kHtA7taRxy3oj/j5gvg9fbtPEDc8hGWtRfq+6JJtgf11rOJCsvRViDviDT4zw0WbTiYJK0emD+0CMimSOVxEBn2Ev9WS/6Bl34hpOtCLicxUPfQCyEuFibNqQBk5jOAKi/lgvpMKMDQbLS9Ox+FPKteuoJzdt9Mgp6BxPHbseonMn8I3EjMs/jMbmSRUQkwtn1TIqGGpFu4/6m5XVrimyuOE2lPAnMoZxi+7EomuLekZnE5zdgzQqhMDlE2wLkkVhn08sGrgiyY8x095g9nQ7dFe3RyqF8c8QFYUx4yovoxwkwfPo4hZeVxjF05NcTMhKDo3fQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvFb/YkbOfvCQQaqPS0KwmlWw53m68Z8ywAQu3takZo=;
 b=LRhEFFUL5Kcq8CwRazGPVMxMu030CtvdKioTsSnnW2n+Z518WhMrpKovrcYvH7eT/DQuk3NW1Jh2uBjDwZKcfGpw90GqwxkJF78KSyLsr+s5L8Yypq7+mtOVltLLRciZ6HA2pDPA4vdJIWyCkl+G6vuRxw/rQcwCy058IXAzXEk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2483c5e19d521824
X-TessianGatewayMetadata: E/oToG7MS6fAHhfzcDreG68O3G39OaxoQJIuun9UEoNOmAOJpMzR7EAz9cGx5XYQttPdauINh2iYzP/0/rIRiPyAM8jjy88WGNaHu+ukaj7L+hRFarKMRuIj/+8+X5ddhWdWe2evmSnbz2QYBXAS2bzK+BuBgICjr0ryFYEzDKE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyIT9l9xZESCjxr5CmQdQSD4Pb6xo/RnzmNc/8pJ90ppSk7l4XvGb5jVWy8r4plpY2rvDJL1EaGqoJxbEWTg7BW2p7edcpyvk0hWZwYua9+8u0G0qOdAgepJA6LNhKMN/GaYle3/K10AbUM5UVE+6wIJDToZKAJgMHLW7y0RLeFPGiG0fX8n/9S+YohA/GA0AYndVMI9WyuA7AhB3HDU5Toy9rvoB6fHANflMIjIPt5qulVW9qaz5Dn/hMAZb2dAr8HSVqAMfsQg48wBX0TOVmPspfsCEkOvWwTO/ECff2pcbi0uWBhrNX4H+mmi3ONV41V1QZzpV0CYzK6dw7kaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XvFb/YkbOfvCQQaqPS0KwmlWw53m68Z8ywAQu3takZo=;
 b=SaChkPYmIcGlt8hEMwHzGuD0sjoV2c1ijEgXr+lbvBsytJVZ7cAEj3qb/NuS6J/7IRDI1lJuN3gaPcIDm+LpHDwASnlhCZEcoocg7dA14FB87RZ29BAFZaXD1TN0WJGYZiKF/tmNSeSrmaw1+UzujuWo4dSzHGU+H12QWZsJrGEOb7VucSnpwv/KJ1iowsbEAj/qxFr65Zkmbt/TFG3iXo4nUMIcUlazLW8W2ElfREBPIq8zMregmMWHpJCigUql6ggAKbEZNs1Q0nB8cWDNVIAmSIKFFDjmc5XZ4h9sfNyodzHCKDYNbBlb8C7WpYdL5jj07Sk2bUhg57gJMxnNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XvFb/YkbOfvCQQaqPS0KwmlWw53m68Z8ywAQu3takZo=;
 b=LRhEFFUL5Kcq8CwRazGPVMxMu030CtvdKioTsSnnW2n+Z518WhMrpKovrcYvH7eT/DQuk3NW1Jh2uBjDwZKcfGpw90GqwxkJF78KSyLsr+s5L8Yypq7+mtOVltLLRciZ6HA2pDPA4vdJIWyCkl+G6vuRxw/rQcwCy058IXAzXEk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: Re: [PATCH v3 4/6] CHANGELOG.md: Add NXP S32G3 and SCMI-SMC layer
 support mentions
Thread-Topic: [PATCH v3 4/6] CHANGELOG.md: Add NXP S32G3 and SCMI-SMC layer
 support mentions
Thread-Index: AQHbUTVpe1TKVZ0f70abV4SIRerMBbLrzWwA
Date: Wed, 18 Dec 2024 10:31:17 +0000
Message-ID: <81856AE8-57FE-403C-8986-2CDF4685D014@arm.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-5-andrei.cherechesu@oss.nxp.com>
In-Reply-To: <20241218101142.1552618-5-andrei.cherechesu@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA6PR08MB10596:EE_|AM3PEPF0000A795:EE_|VE1PR08MB5808:EE_
X-MS-Office365-Filtering-Correlation-Id: a357e087-478a-4928-408a-08dd1f4f20ae
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?PZKvb5rMk52VMzbSL7Y8J5G9ZD29/8xfASiwaA2SsYBWd4zwhYi8P0ci/vwj?=
 =?us-ascii?Q?6ojnkLqwygxV8V8N3DJRLa9BJWfkloCbZjGv38KQV7Re+ckP8VCe19tKuaN8?=
 =?us-ascii?Q?lTapR1YvTDad33A9x8I8GDHsYJ5sWp7VvW3DLTLdZmNMEAOgpWcozYaRxh2B?=
 =?us-ascii?Q?Wkk+rywKbTa8BtVA8FFvVUFN1Ns+ol8KNb4cxx0OzVQiOgFhlIAgKQmYpV0m?=
 =?us-ascii?Q?HeWpB986RZ+7MZjTA+wznWm23NbeT9kqpzByQRsul9GkP+jbryV7estXoFGd?=
 =?us-ascii?Q?f6YlmAtOPkACtw1hBzUXU1hiyoAl7GesY7h13mGlgmuhp4SSWFbjNO80BMxu?=
 =?us-ascii?Q?N1NfiK8BE0G6zAXZ64lvC7O98pqeTxEcWKxqbZz4vM3CsebUXFv7qvrlfmBe?=
 =?us-ascii?Q?yyYVxjLL6MyTd4ZDtG0+NDbmT92xS77kWHaWJRt7wvTAYOz22y/kwHz2+Ukm?=
 =?us-ascii?Q?86Vjb4KgxE3xbgnFoEKq2p0H8rXk4KrrCrkiMcLx6Ga2QAvnXEA/qqtA8iHx?=
 =?us-ascii?Q?I7tvEzZZnheiEtP1Pcm+EF+n7mV/zdDGuk0nPVOiNGfcuegg5c1EvOr8cFNz?=
 =?us-ascii?Q?XsBE8reTpNz5tuHzWgGEJxBP/DmASlUIQQGzjVGmFbZwCn2VGUbg8MzN4g5o?=
 =?us-ascii?Q?qFkCKHaVhdsvmP0ZtlJegH8fsUGnLDUho+U5qxfCgkfe26q72GdT+4BZRz7F?=
 =?us-ascii?Q?oPnuKY7lFTRQutwGFpmPhaFBee49tnaDQZNQoa6ytq3jT2GFtiRjgD7kZQNe?=
 =?us-ascii?Q?DD0nOjXyLbYfmVLzK60GmceVFnomhR13z0hLYjWOd8MnN3G8FG+ESP7Ox264?=
 =?us-ascii?Q?gzKd95EtbzXUbN/O8xpMU/6B7u4LY39hvrMU4OWho65FzJKqvG9hTU05EsCx?=
 =?us-ascii?Q?DFNZiMMONxjslYFoOyqj+Xd950iYDU/48kq7TwJo6qMuOckEd53M+mTTWE0Q?=
 =?us-ascii?Q?vn60XNOhInifg4JfbFFtWXvMrjThH2r20Dpdx7mCKmETisPbYD1Z2/ASFNQP?=
 =?us-ascii?Q?1o+9JOAiL81+shokimG6RiqKHPNTQDZ2yE3GVR/Wpaonxdp+QqirQ+wz/6K2?=
 =?us-ascii?Q?nngsgcnJqWOLPTy7oluzuHMpuJn4O4Q8IeJKV6BlGOHq4/OKodyvYVVmey1s?=
 =?us-ascii?Q?AK1vNR2VtJfFSwADGr/SX+88rzDoBX+iUbkxf8zGUuQ78/+zkrFjI/Ei7WEg?=
 =?us-ascii?Q?kD0689by20ovRQyf6tfNujcnmyjHxySjBDZ50FvmK8rHlRHDhikjjLKy98Np?=
 =?us-ascii?Q?7lFiu2zn+JEWvNCscr0C4PSY+DHUaYJF1Cy8G1Iac2gADkNcsC8c2dx6RGbB?=
 =?us-ascii?Q?Ua61KTbCbDYGiKOj8a4w8WTkb5t/kDY74S652cK9Ym5Q4xiLqansihJIzHeQ?=
 =?us-ascii?Q?6oN2ZxCVBzPsn1I5PitkZG+5dnk4?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AA0474FF86C4DC47A89CB126DA1A99CE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10596
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fbd51403-df42-487d-bb55-08dd1f4f1b60
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9LVXPxV80FtyP/tr/JRG9oLKFrKlwgDFovqVV0m1oVD5VqUIddZYaAeuqI1j?=
 =?us-ascii?Q?MQxWgKVxttXdDh8/bwuTYk7K8aEhpX3QXJ0Sx3vqrPOSucmIiOyHKJIN1EgV?=
 =?us-ascii?Q?d9wH+xUMtEEVhRnPoPj4nsbX2/Qe43Nu3yZ3nTFV3gf021ko1vLpm93hKJVS?=
 =?us-ascii?Q?ZnlTM0I0U72z8UV4LO7CmmqEfCUE0lu3wejorAFPuOKxbLfdTOK8C2wMU55x?=
 =?us-ascii?Q?R0IGq5SzB17qn3UD3lp1Z9ZbMP5T5xDE86ZPQxPNcC9jOmRS3YuuQXuIRGGD?=
 =?us-ascii?Q?9xW5o6j8xyUR4rGMnfN7MGlrWRPzLeJn6nn29RQbOrQboxiapNFCiSb/VOEv?=
 =?us-ascii?Q?ZaD7tpEWJavAHjuTQD1Q6KOXCtewGS3OPch6LwznxYSvEAmI7T7iLX7QDnZf?=
 =?us-ascii?Q?J+rwA7BhErOwTNhCd+SZjlNs02bswenOrd7YNqRdlBFUAdsl9oHYEE0tsJ6n?=
 =?us-ascii?Q?bQLedVEBUOudjj/3b6QcTj3eMQjtAUpI4EXJd344iB1I7swUOIb5f+vXgqsy?=
 =?us-ascii?Q?/V5j4aO+TK2Fq4Efxc5eIv72RsP8Z68vlvkofRqRLPIv1bAd6NoW23SYQMBJ?=
 =?us-ascii?Q?rM46sAJH+wLqoCQM8xzqOhHIxHpxZ69++O7xV8/9jzL/1ra8p7VmYeZXc6Cu?=
 =?us-ascii?Q?1UUoEQw1Arh04FabeqNET8WEkWh8Y+h0fOrvkzkO2BNkDMFmHiGwHeWB9x4+?=
 =?us-ascii?Q?h4ZnzjNU4XOTLgVGnqj27s4+sP4ODyHg1SYSof5G/ty1VCM9EpzS2g4qaY6/?=
 =?us-ascii?Q?fcvLE4Ww0DxgX7n6hzsrJdcS+dy+wjq1Zp+zuLUA9VygKgA+g0b/IFLJ3XpQ?=
 =?us-ascii?Q?vkiY4KVGIrhFZSWf3PW65fEZzDpVzma8SebqfaMif+V2l12HxWuZUfx1C1o8?=
 =?us-ascii?Q?NdrpxnnqYIvnfT/ge+zHI+CZiixb9UivkWSRwtEDMTYg+db+VJzyl6YiMXqm?=
 =?us-ascii?Q?3C2Kp7osZpamZxueDfkdKtu0dxC30tz08VDxrymgBi8wu0fzkIJG22WGMtl8?=
 =?us-ascii?Q?1zCS8jG3hiZtPCSLs2pvYWxISjbWUCwd7gJj9AFbS/ShIltXwq/4M3Q8s9dE?=
 =?us-ascii?Q?0zRxg0DcjXY/bISaOE9xBE0UvirxcEDzRS37TmdvOaNq5IxrUa4/HBb7/JG9?=
 =?us-ascii?Q?WVBwnjefytH0zjoQLYnU+fq4RaLyTMkMgyv2PSdAsZ7hqc2d9UQBhq2m7vEj?=
 =?us-ascii?Q?HQo3t5h9pUid2vG5zgbW69kXCveOuUvuLLZQGj1ONd4CDGnAt9yniHfGLG1c?=
 =?us-ascii?Q?7EmbE0Rw9ZbayIsVHqG/oO0P0OQyeK50sRgvigxU2vwriw6YnAD7Tak2EpNt?=
 =?us-ascii?Q?livZi8iSa0httic50B17WMv25hudZ6/OAlir9iXjdGC8U260TWvjUqNHzeEC?=
 =?us-ascii?Q?eMautz/GfbWclH8VW55mI7faZzoyCL+11Bzn63dGfO1rQAdJJhkwQbcIvmm4?=
 =?us-ascii?Q?mvdQR3e9U+e/g96/29gMVJloba775ogS?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:31:26.7021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a357e087-478a-4928-408a-08dd1f4f20ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5808

Hi Andrei,

> On 18 Dec 2024, at 11:11, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.=
nxp.com> wrote:
>=20
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> CHANGELOG.md | 3 +++
> 1 file changed, 3 insertions(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 15f681459f..bda43b1efb 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -16,6 +16,9 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
> ### Added
>  - On Arm:
>    - Experimental support for Armv8-R.
> +   - Support for NXP S32G3 Processors Family and NXP LINFlexD UART drive=
r.
> +   - Basic handling for SCMI requests over SMC using Shared Memory, by a=
llowing
> +     forwarding the calls to EL3 FW if coming from hwdom.
>  - On x86:
>    - xl suspend/resume subcommands.
>=20
> --=20
> 2.45.2
>=20
>=20


