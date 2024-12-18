Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA019F62F8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:30:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860195.1272253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrJg-0005rd-9K; Wed, 18 Dec 2024 10:30:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860195.1272253; Wed, 18 Dec 2024 10:30:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrJg-0005q8-5f; Wed, 18 Dec 2024 10:30:08 +0000
Received: by outflank-mailman (input) for mailman id 860195;
 Wed, 18 Dec 2024 10:30:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNrJe-0005fS-1y
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:30:06 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2061d.outbound.protection.outlook.com
 [2a01:111:f403:260e::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0afc0f53-bd2b-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 11:30:04 +0100 (CET)
Received: from AM6P193CA0081.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::22)
 by DBBPR08MB10409.eurprd08.prod.outlook.com (2603:10a6:10:52c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:30:00 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:209:88:cafe::2e) by AM6P193CA0081.outlook.office365.com
 (2603:10a6:209:88::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.16 via Frontend Transport; Wed,
 18 Dec 2024 10:30:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 10:29:59 +0000
Received: ("Tessian outbound a83af2b57fa1:v528");
 Wed, 18 Dec 2024 10:29:59 +0000
Received: from L5b45ef019223.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A6AAE435-B818-46AB-8189-B2CE82B05F2C.1; 
 Wed, 18 Dec 2024 10:29:52 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5b45ef019223.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 10:29:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB7441.eurprd08.prod.outlook.com (2603:10a6:102:2b9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Wed, 18 Dec
 2024 10:29:49 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:29:49 +0000
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
X-Inumbo-ID: 0afc0f53-bd2b-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AEz+fc/gSDYGAy/j0pheN7JmZzUQ5WL1/9xqrvIeDv4Uk13hzJV0l7JkGTtKrYb50IdDhvMrLXHTWlLi26iHwLYIfBe4uiVMWvGVg76fYdtRAw+hZZpyYMT2dzha+jc/mLEOcIxGrSqKfOUD10i965DDq7hC0wec1uLo492F7Ld73hp1h7knGVMCvc2MNzt4kBHqkJT7rY/d/Rz6M6/lccDuCCYD+Ec5vWvr3cVbN6u9fMq+djAsEwpUBYTFVnT2VbapCcxs35rfFTusRKZSrcEUd2kAgueD4qbA8gJZ4iiOCgXgFpB+MInOUT4sEoSH9jopRObP2pmCbddh1VQ+bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpY5ky/zBA/dTqQohAVQY34Oc6qNSC/Fm0xgCQXpXZs=;
 b=pOYD/KWO4N0F0rCQOBhPolhvAMl8gcBNKytvhcjXe/HsCwBaJsN4Kpv6TjewB/Oix2TV+7gKWE4HOBk/XZ/nSvamoB3rl1xZtqlHKHNYPnP8B6ajTPAYhWO7k5l4pWSRiN9muVYfCFVuHGDsuyPGxJBiM+O+e2E1bZk3lZE65RUh760cINDh4ouAXFBz7qlNS6x4WRmsHF5NG/OB+eL9EsUSs40wRqMXBUIQ1GxIblqloWXcHmmF44XTRPBIVPTI50rIUsx2am7Rh+m9zBHAHUNyMeVgzSa+LGc/bLKrQtXYWtLj9XsMmB73hxjhg9IqiH8BLHgQT2Wv5FDlWguqZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpY5ky/zBA/dTqQohAVQY34Oc6qNSC/Fm0xgCQXpXZs=;
 b=bi2MfO0vkLq0ppHgoEKKPdeT2auYzYp5O3Qx1B05fYrez4ObFyhavv3m3bkWBqUcedbPi1rMST26MCV4yc1CWAD4vU3+FfC8GbOS3Wvcd8BHpK1oXeFHGfhlsN02af4RSaCWAOJVLh2XnDxv7viiHBP1EwAMoF79908Q/BXHxYU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f3509fde17742701
X-TessianGatewayMetadata: 99Z9Zy9+RKyCQeaZPLRrj8eisSow9/umlEYLGS7pptPSqVBFxOVlj2uMIaUfRSN6p4unlpGMnUss6yaiUMubMRqUpQvZU1Em3lQHJHrm4YQp7qIG6mpbyFLhO/2mjy/iujNsGJVa30AcQAyMoEL5nRvTmFXjl4xphXC7x4mzMHE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itwKjtN03OJNOLGkKX4xKx2xJHwCMfmyARdqLfuMraKfIVTQ8rcInK84vCoBX6iS/kbuO+Rh3aHWr9+3uNvi0HEVrdhFNKzBS7DgqyTJRkg2+wUMHCmPIm0KvycYTb7g+exYIVS3HV6WcgO8zs5jCtM5hRf9Q4BlcMxI1FMh6qmZP+bIybLNug0McIo0czjRIlC2GitavT+mRA4sRRHvEnbm+d3lMDermN8JYLEGZQ9HXbOZTxKhs3nlwJ3Uq0jw0IQtkKgydNEQH6c5whFpqWD4pqZAG9bAxFsJ3Jxr9c8zFDnci/pYxFZc1eY9nkdv0bZynGFMdOsOrOhhysYzPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KpY5ky/zBA/dTqQohAVQY34Oc6qNSC/Fm0xgCQXpXZs=;
 b=bAcNHisddOCh76TSklvA0igONX6pHF93St+G7wRm0G/t7Q96oNVDYjNaWtI2Rx6bCcDvNwVjIiFAJaGcxuPGOudA0TbMIA6Z6c9PsNuTvUSJpHm3J9Z/6ENeMnUhLtqqk5nwfX+CnNFvymzSQb3rLLS10tbyO8HE80Izcto1WfGZAmaJG9y8h5vEN3QMNUG7goh1MaliG1ciykv8yuD1h2sXp5Ug6Kq3cR/4MQ50hkklJM/lWtXu9fa+tiANE6pIYS86jm3Qa0pzv31pMjXJku2pey0XdOSgaHHIm0Liqg90fCHN7zlpn3+kvtJMXcwaQcXkqtwYTlHB66BcpcDUag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KpY5ky/zBA/dTqQohAVQY34Oc6qNSC/Fm0xgCQXpXZs=;
 b=bi2MfO0vkLq0ppHgoEKKPdeT2auYzYp5O3Qx1B05fYrez4ObFyhavv3m3bkWBqUcedbPi1rMST26MCV4yc1CWAD4vU3+FfC8GbOS3Wvcd8BHpK1oXeFHGfhlsN02af4RSaCWAOJVLh2XnDxv7viiHBP1EwAMoF79908Q/BXHxYU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 5/6] SUPPORT.md: Describe SCMI-SMC layer feature
Thread-Topic: [PATCH v3 5/6] SUPPORT.md: Describe SCMI-SMC layer feature
Thread-Index: AQHbUTVpexJk9aIxckuBUMUJS0lzQbLrzQ8A
Date: Wed, 18 Dec 2024 10:29:49 +0000
Message-ID: <9806AD58-30DD-41B8-BAC8-F408A9BB16D5@arm.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-6-andrei.cherechesu@oss.nxp.com>
In-Reply-To: <20241218101142.1552618-6-andrei.cherechesu@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB7441:EE_|AMS0EPF00000191:EE_|DBBPR08MB10409:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa02655-e0e6-4183-1916-08dd1f4eecd8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?kOIRrPWzL0stOQcP6J0zVPCETOZ129wXdjtXqR+znkM0/LmLoV19hblFtq?=
 =?iso-8859-1?Q?nQCwGMZS5rlkQKkjZzkZwh8FD3lqqNP5YMe4fzILUQWPL5SSH6HdJ64RtB?=
 =?iso-8859-1?Q?ROcVFjq93UYlALTOaokXGkzQaDhbaE0AAuYhArL+GsrMyTgvQ+LGmwL2tk?=
 =?iso-8859-1?Q?LrLVAhMPMa/FlmzH7lasb6eo6EEywdgC9YpJjebHO9lcbDtFBmFTRSwgrj?=
 =?iso-8859-1?Q?+yFKT+IfSOXuT+eLrAA4A6YrjK5jOgn60nfbxcvNfZW5XAY209aR7PAD3E?=
 =?iso-8859-1?Q?1DyydEsFx+uroTfrr8Ng/RV4wUQS0hOLsRE+EsHiZXILhTloWenunQ3qhw?=
 =?iso-8859-1?Q?TdXujKqur29Ow/TO+ZZiEiZDYSlTKInmmsrq/F+d9QARX1A+628/7dMcY9?=
 =?iso-8859-1?Q?CGhtDuz0gydU63R/MN1lnmVUTTc3n6tD/4Oo45kzfDSuJSODiPrhivOq5G?=
 =?iso-8859-1?Q?Eh3S4XJoPpTjeWvP8TLgalt4maj5hntUBIWDNIpqMxn7A5fTc7WAa8PS4W?=
 =?iso-8859-1?Q?8iSfSa+Jc1td1q/uIjSsthSkRz4meuUbM/EUrUpmnqMya4a8DNOtT5j8Mq?=
 =?iso-8859-1?Q?Ts9F7iTBZAy5bPpIr9CGNfBebpzGitoE6HKZGbBw2jqZFgmGp5imNq1XA+?=
 =?iso-8859-1?Q?F+yThBJp4mxdeIc9gX5fIvxSAIAnQZGN0XLyLIHM8ldPuPl+c6Bufo4gGo?=
 =?iso-8859-1?Q?GiIoX0RIr7Ljo8ZAydy6OH1NgygbeuCQfrakBwpklsdhgtcKBVW8jv3ttr?=
 =?iso-8859-1?Q?TlezcNd8VZZHd9It3TnVny7zA/B1syGtGygv+ifTpSvDtYOmK/pPqd+Htn?=
 =?iso-8859-1?Q?iHH5fKvDxfIdM7uLlGJIZNG8XjlVGyWyOyU471CUijbuxL9f76WL0d7xxS?=
 =?iso-8859-1?Q?Poh9S7msYZY7UduYlm6hJKO0ZR3QsQfxr8zWCLB7nq7IesKM2TY0YItSjS?=
 =?iso-8859-1?Q?lXVvckV6girAYkHkbfPJnJab224Zm7RHzZGEvrIx3JjvkWLD3TZnAlJY51?=
 =?iso-8859-1?Q?h+aRfyLhCZf+TlXorkjVTb9mApf8JPWS7qwh3dUGGMBQwuAWg94Zj1aA18?=
 =?iso-8859-1?Q?DF/j7slHB/WzIBPe734JZcfreF/45KseL8nNBPHwrhjsmFqXwr/IMYCyE+?=
 =?iso-8859-1?Q?Tq4pxzn2E/k1KXujBxWqQTwZOV6mqxKkHP1zg7yPjiaS1YloMMAxZUFZhW?=
 =?iso-8859-1?Q?Bw7MDI6KyIVABsBs/9VJJ8RYt4AI4wTXSSf+ViO6OG95Cd8afFt41Ik+qH?=
 =?iso-8859-1?Q?oIw56zp+k5gkAZKsmlN1PTPvS0uz+z9DucOdx9SNbCJdM6J/Z6fVW6HD1G?=
 =?iso-8859-1?Q?thxSGhTmy596zCNIqe4j7hDoD+7CjlG7nbmyDeied+bG8M42bzPiHWgiGd?=
 =?iso-8859-1?Q?PJN8m4D1XDhbXfhevEmFirfpjKqYvxRNicnjjNIF/jHCQsr9gNXSmNrBOL?=
 =?iso-8859-1?Q?9jhoBP/E4I8WSce0tW5UW052cDRtbbW432IjVV9PfviBbb7shuEDklL1Yk?=
 =?iso-8859-1?Q?xCdwdIgLBmoYk3xEPS6rd5?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2ABA8EC79B27EE4DBFEC565AF2A8E6C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	81f1f598-35d7-4a09-7a80-08dd1f4ee685
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|14060799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?jam3tIemTyklo25Pco0+408BQj0VKJIC+4C+BX2h9k3bakTxo0LAVu3MmP?=
 =?iso-8859-1?Q?tyBxtJSvJtDDaAbFdYDn6QH3I2me+LZhRUPiJs2TIhx6w2fqBYw+fGQodB?=
 =?iso-8859-1?Q?I1Oe450LrDX+v8sFmp4UMJTigb6y313+w5Y09qjfgtVmjVjInq0uhwK0Qw?=
 =?iso-8859-1?Q?xudFlBYgF7pXS4pYTk7WoKtq/twO4pQZpP6AF9kC0rJCBzJgp8hmPzG/0k?=
 =?iso-8859-1?Q?H6Riib0px6UYmMiyLUZRd4sIqY8e9/eRX/JVNLjKzA3HBfRKnvF/4orHYm?=
 =?iso-8859-1?Q?SeJ0jZbfpeSYfz47x1P3nCWJvN36y4jIIB+PlyPNGJHgRRmdbHAn3Kvafz?=
 =?iso-8859-1?Q?7ePrRgrkmHaTKNS05DQPLIC9eo5NJE1V0xf3jWiOhTr86AnK8ZDm77QPOw?=
 =?iso-8859-1?Q?rCabzIsBAyOT3Cv9rE1TxBw1cjC8LXbXrdZaE2PCWNZSIfejlFw89m29B8?=
 =?iso-8859-1?Q?brXC1Dwvmz65nwlhZdBscT08xpV9bxqodzZ0HF+brK2y9O9q0elJh4OJ46?=
 =?iso-8859-1?Q?olBJVjX0l0r48Gs/tmPIt+y40LLDRUBsRTgrpe5ZOPs3ZnWs3ldIuZCvqJ?=
 =?iso-8859-1?Q?74KZGwwZ7X0d3Bfv+ouzh7VXA3U3edspmqNWoS6ObsCPLgOkWLXp/Wy5hm?=
 =?iso-8859-1?Q?DfimWjGzYGiZcdVwbM+lVfyTwkV+XWi1vyHtYG6yzsGC0BHc4HWNwGXkk6?=
 =?iso-8859-1?Q?Hr7zOH3IQgxBs2sfayZQ+0f8ZkOC8YZjVl8JUGm6UqGswYeCXxNMciT3ma?=
 =?iso-8859-1?Q?NcuDe07ZC+7aa1lJzusd//xmUQQ6N19jT79GZBg/xqX/gbB35oFVRfCUsC?=
 =?iso-8859-1?Q?GumWmgQdeItopT68SR6S7N7tDqc8n7Behwi1VbbahJxG9UN80b2rytn3MR?=
 =?iso-8859-1?Q?AaRBVqpjSsrJfCRFnrj8Wi9rAZAb5T/Y0ufmw6GhEVw9lidW/qQHF8KNh+?=
 =?iso-8859-1?Q?pk96qCYWo07XY06ZuWej1VPiUwJsZRWXrNW3XC/IG2HFjpEDKomj4sDWOB?=
 =?iso-8859-1?Q?Bh1L1fw9l9rPYabjwtEBin+hvhG0GvhvYdKp0WcrZo2HJRYqiiTYjaF8Zh?=
 =?iso-8859-1?Q?s70x3lAYBK2MCFpR05qUDlTi0hxaW0aA+4Elyisij2Rm3dZVPshMb3Kh5B?=
 =?iso-8859-1?Q?krsKfriB7NWRN2+KLbGUK3eqFpb6snAxQSuzjHKxbI5mttLscR6qfSRdXQ?=
 =?iso-8859-1?Q?BLMjQKQ76Fo9Y2XpfTyiDIwp3Sgr5WPXxPOllArYQlluEyy2K9a4aKFwaw?=
 =?iso-8859-1?Q?tN64N9sKWRyrMVXFtoKzxy/7p7JmNhEzxW4fFSYWbwq8+1SFR5XLvqh6uy?=
 =?iso-8859-1?Q?vIECahMq+4OTsInsQIYBDZMl29lAEI2gsBGGnHvtNNSygnIHn8j9Ocxm+y?=
 =?iso-8859-1?Q?nkcSj3YAzpCDzQCydjM50ToZz780NPKhhU/ESU9kRXeTmLfD/mx4zf4qK9?=
 =?iso-8859-1?Q?hPSyA7kmUvbIH192gLLsq1uem0qzkmBnLSYVeTE5dl9YhXdP/gf0REE9Yg?=
 =?iso-8859-1?Q?oWtRIoJrkh2EwnAVR3k/I6ogCgIWy6+aXQTizSoLKDByb7tT1RAYDicShH?=
 =?iso-8859-1?Q?NCvErjk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(14060799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:29:59.6254
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa02655-e0e6-4183-1916-08dd1f4eecd8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10409

Hi Andrei,

> On 18 Dec 2024, at 11:11, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.=
nxp.com> wrote:
>=20
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> Describe the layer which enables SCMI over SMC calls forwarding
> to EL3 FW if issued by the Hardware domain. If the SCMI firmware
> node is not found in the Host DT during initialization, it fails
> silently as it's not mandatory.
>=20
> The SCMI SMCs trapping at EL2 now lets hwdom perform SCMI ops for
> interacting with system-level resources almost as if it would be
> running natively.
>=20
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
> SUPPORT.md | 8 ++++++++
> 1 file changed, 8 insertions(+)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 82239d0294..1f7867bd32 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -928,6 +928,14 @@ Add/Remove device tree nodes using a device tree ove=
rlay binary (.dtbo).
>=20
>     Status: Tech Preview
>=20
> +### Arm: SCMI over SMC calls forwarding to EL3 Firmware
> +
> +Enable SCMI calls using SMC as doorbell mechanism and Shared Memory for
> +transport ("arm,scmi-smc" compatible only) to reach EL3 Firmware if issu=
ed
> +by hwdom. Some platforms use SCMI for access to system-level resources.
> +
> +    Status: Supported
> +
> ## Virtual Hardware, QEMU
>=20
> This section describes supported devices available in HVM mode using a
> --=20
> 2.45.2
>=20
>=20


