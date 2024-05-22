Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46B78CBB44
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 08:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727225.1131646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9fRP-0001F1-BO; Wed, 22 May 2024 06:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727225.1131646; Wed, 22 May 2024 06:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9fRP-0001CT-8T; Wed, 22 May 2024 06:27:11 +0000
Received: by outflank-mailman (input) for mailman id 727225;
 Wed, 22 May 2024 06:27:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dzh3=MZ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1s9fRN-0001CN-VZ
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 06:27:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fe5b250-1804-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 08:27:07 +0200 (CEST)
Received: from AM0PR02CA0013.eurprd02.prod.outlook.com (2603:10a6:208:3e::26)
 by DB9PR08MB6633.eurprd08.prod.outlook.com (2603:10a6:10:23d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 06:27:04 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::78) by AM0PR02CA0013.outlook.office365.com
 (2603:10a6:208:3e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Wed, 22 May 2024 06:27:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Wed, 22 May 2024 06:27:04 +0000
Received: ("Tessian outbound ba75727f6dca:v315");
 Wed, 22 May 2024 06:27:03 +0000
Received: from d881921c12bc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E55CA698-EF52-4777-8797-632A1869EC93.1; 
 Wed, 22 May 2024 06:26:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d881921c12bc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 May 2024 06:26:57 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PAXPR08MB6478.eurprd08.prod.outlook.com (2603:10a6:102:159::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18; Wed, 22 May
 2024 06:26:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 06:26:51 +0000
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
X-Inumbo-ID: 4fe5b250-1804-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Tj+ICPQDdeOcvfW0ROMbV+YmydkT56QD1hc/xW32T3ISNX2Vc6wRh/jb4uoEnzDuADSzqQap6oS+8anh2LXokEwyG9UuMEu+cyr+3vjrbMC2XJPeWpW65AYDkBxOATlgGaYMaPWHllGAEeJOATKu3G3zN1Wr0UxsDfexlSBh/SjPjE7bo6j/gXDfCMXINrZ/jKGC70UWgHz5mcm5jKlkQGpavfyBAHS7Cxvvf/EMwMIWtZLkcO8tt76TqoI093ZnkztgZVMaUNBatT+dQyASPIFS1drLoub77uPnZtm529L3FYwHcNy4HwF9I49A3KWSfYcBHY8h8KBRsqy+LhGhPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZEpCOmpNmuIPw/Yy9KgxrXyWOZlbKX61cWq1sUfZMg=;
 b=hsRo5tKeR+QPCynKL1L7bi9B2FPbbMMXCMbDt61LEDB3RE7To/qy3BxD/HYGuPI1SxkchAtdN26yKenJ7XLXlz/cN13auRg3kI3iUiUXH4ujzfHwzjo72vSMZlRdVBR2+noJ1IpjiySZ3foBp/IINYoZdNHWaIa365KWzxpX29JICu+psSazMZhTyMd01CGN1Xsww8tbkX2TkJ+bcbQ3cxNMlHivfx03SJV5xCKPJGHg2tvFcbgOxc6ooyMb9GtF2uzEzfEQcjqwy5lMJGz6l+dBfBzm6WKiMlhQx7vGow5cix1iKihTrbilrQ7UNfCsBnKa+zspGMJ7DTdsL+g3yg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZEpCOmpNmuIPw/Yy9KgxrXyWOZlbKX61cWq1sUfZMg=;
 b=S8lqTr1nc7Ya5oBMP/mWgsdqgOMsyGnEmi1mRBFWFGy5OLoZi2/CzVn5GJwvlzztclUzrpbJHQjx9HnbG0hERDDngDpK8WcH6lXaoBhBV59ln0yTgSeEJRLp64iXlLlUmOlctyaKouRX6Xffw85/PvXh0W3qkzNgfowOfTxSaAE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 29cf0c3dd70de103
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VU/QvnW39OfSIjRtlk+4jdvnAicFKjQQN2iIqgmqJMMaKVP8Pwt+I3FJI3ss3oBD66RCbW818GbTsOoHQvZXgU5Qa1eIDt2c91QvDp8mCCKovXI/JkkjTOHx1hQjgFdT8925DyoLZAmOb+3UvYO3HyeX9jZMiALAkKsKqHjF3PQCFNQ4RI2NKM0wzBWQMK/RpC4uG4W6VmMNWVOgZumiC1qRNY26xaJ6Eo1kJhu2ZVvSsHAU9A07v5ejRlC8UN9F/LKh8m9Y54fUM8G1KO2ZJN/WvujX0b/AOFfTurHAzGGCFDr3zczr5N86F+VgXVIKCDHE0BpJSmb9MaAdMbPDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZEpCOmpNmuIPw/Yy9KgxrXyWOZlbKX61cWq1sUfZMg=;
 b=ml0phyu0EjRnxlIF0hPt7rGQ3L81ek47F+LRbNIc6SUVReY+naXjL+DWymep8V1OTWgMvm7IThyiJ1D/Fv5id3i/obz2YzvR3nfgf7szl94Cn12gW0UfgaIlzK1YO6867BMimLcpzYDgJBQ+bxru0kOTWdw3/r48K7GzE86Quj0fQs/aRMRnPzSL19BszXcce7keGCE2veYWZF5CTEFR5qr0M2NxTVudNkqwCggBFOOVYeXCd8GNHJJ0ev5b+TWgHBLKnyluBmcNcJez72Ek5USNIXiAKmeQCoIfQ0nkTkXZlYHZsx2tUwZRauQbUc86bWpuh5/5LEv2IXWuOsjukA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZEpCOmpNmuIPw/Yy9KgxrXyWOZlbKX61cWq1sUfZMg=;
 b=S8lqTr1nc7Ya5oBMP/mWgsdqgOMsyGnEmi1mRBFWFGy5OLoZi2/CzVn5GJwvlzztclUzrpbJHQjx9HnbG0hERDDngDpK8WcH6lXaoBhBV59ln0yTgSeEJRLp64iXlLlUmOlctyaKouRX6Xffw85/PvXh0W3qkzNgfowOfTxSaAE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v3] docs/misra: add R21.6 R21.9 R21.10 R21.14 R21.15
 R21.16
Thread-Topic: [PATCH v3] docs/misra: add R21.6 R21.9 R21.10 R21.14 R21.15
 R21.16
Thread-Index: AQHamCHZQDAooijVSkmDWqQKzv2AALGi8cCA
Date: Wed, 22 May 2024 06:26:51 +0000
Message-ID: <92270667-FB5D-4275-94C5-7D6D3C54FED8@arm.com>
References:
 <alpine.DEB.2.22.394.2404261435010.3940@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2404261435010.3940@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PAXPR08MB6478:EE_|AMS1EPF0000004B:EE_|DB9PR08MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc546c9-db43-43fa-9935-08dc7a28325d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?ZFX9lSslO41hZgWOGYb23Hr0VX+Vd62PIEH1N+ez4h0IcUHrXx6AHruEe5?=
 =?iso-8859-1?Q?TkbtnIP23Bdk7OeEcY/Fxgl0FUz1v29lF1koIEjetXRXeFUzeQThAk6I8u?=
 =?iso-8859-1?Q?IckgELw3lhvBiO4XYhSWCwGv6zGSRTEN59sOoK0LAAXm6cbe4Lu61r67/d?=
 =?iso-8859-1?Q?mMTh9NJUCiiEtHnu16DSebk86Gdo56+5OAZcqOBsXNOjrXvnrzBRL6a9kA?=
 =?iso-8859-1?Q?BJLpLVO7/ZIABu2ls/r6sA3AoCRH+YiFcuKUKTrxg2Iv/Pp0EkWsJjKp9R?=
 =?iso-8859-1?Q?FXpn16Eyh0jAP8rfuphsI/5qKmwf+UJQtgQL3v7zUu06L7xmbjsx7iOXS4?=
 =?iso-8859-1?Q?aeWbDzZ1NEbM5dQyIRlhQBqh5MBJDECY8Z/QXKqApclTp25Vdgmkj88yt2?=
 =?iso-8859-1?Q?/74c+ebACQFxzsIr6aUTp04+d1/428Cqb2ZnXswFl6QpA3lRpNH691Apj0?=
 =?iso-8859-1?Q?GQxcUvkMjovO1CiGnY1plhNm2SrAwEOmfNaKbI09R45e6CilVXkibU9kzA?=
 =?iso-8859-1?Q?zqMarMBWJRBXO3jdCDpAEH/iKEiAbvmgN70VTyf3bn0eboim3NhnF28P+J?=
 =?iso-8859-1?Q?yCcAopqtrfH/GUPhf+NNEjFd7zbAwgvgLsIPQjoJrlikrtD8jA5nBz+cow?=
 =?iso-8859-1?Q?sp/YSHXA9CDiwKNXs6DDw7El2uiY86qsAfDtbjpFdu3BY1oZbOVPRtx34/?=
 =?iso-8859-1?Q?nT1PSS26zcgYYyAlGJ/RfU2bGiWPPxuCjijhAkA2UELEluohCYP906l1b4?=
 =?iso-8859-1?Q?510NSwxa7yFs+KDRWnhySFugErXEuz+xrqlagwdnq1mvG7E5126Czo3ULu?=
 =?iso-8859-1?Q?qDS1KJLJGXSOrevS7H61lgats6+UCLGjE/cz7t/P00feUAPBud46Yk3jCK?=
 =?iso-8859-1?Q?w3Bmt5bAF4gofEbNyHBQnzMnBbQ9e74DmdM9XO50/m8AG/p/8Z7nChzPKc?=
 =?iso-8859-1?Q?OaE822l2vUQo33s4cFXAhq5j9bGcH4b12CkGBEq9Uvrlhr8o3W+JTujBhf?=
 =?iso-8859-1?Q?xVdM1J90HB0Cg6ZL2yzD7PTBLyR0s8JsxpqytpwMOQZEdqnQMzDxfjeHO/?=
 =?iso-8859-1?Q?rviStwqeToAyzaFE07lGdquaEBl1E2hwlpkzmSZ4hxgWA+HX3UafTkmM8W?=
 =?iso-8859-1?Q?qp+V7Q+ku7TltDmQkVoXCmkfr9XwqWHHpJPXOQkLC5+VFby+QN0kI8osBQ?=
 =?iso-8859-1?Q?TBReo/ssvDflHZHzSS6g/TY+S3wDYSIdLX6jhrJ1MaQIqLlHj30dtyjCwG?=
 =?iso-8859-1?Q?QoMMG2e6cxCnf2xMq7qTow4hK35p44Ls5CwtmfCMmpaT3kLq3HWtxZkvys?=
 =?iso-8859-1?Q?D5RBTo9XnZbRSgtVm32MXowoSWhd/Rxx/FFfGQAou6FvcN0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CC3461F9018E684CBFB1F8F9DAE8F7E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6478
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a8560f8-c439-4ac8-542a-08dc7a282ae9
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?+Hk8RigbvTUqNhbCuE6zjCKDeJiNScCe6H4yUCpndsk/T5cto2qn36eFqg?=
 =?iso-8859-1?Q?CG+7paZZvFaAh7KBwiB7Mzo1636vP/p5Xqg7ROkQtHFH/P9cLkXgWbXApk?=
 =?iso-8859-1?Q?vYNsapkTbYZ1t9IvB0rAB3s5GqxAJSG696Xs+YEXSGZgkth34yr9WGF8+D?=
 =?iso-8859-1?Q?QTTqO19YNMQYM2TNDo/JC91+XfK03bSMXZMsJNbtQenQX0mouNmW8avxHu?=
 =?iso-8859-1?Q?DHmp/RfG9f9S8B4upIKaeljJVevlYkQVYTy9z7G2uzczX9VD9iwyvsTnX6?=
 =?iso-8859-1?Q?ZY8browknTjnh1HcLeRDwL4OxC9Iij76DS+OFRaKGZzcy4OHAABnmCKamU?=
 =?iso-8859-1?Q?PjP1nVplW9Xf0zyHkKh2X4e6+Ts8VkW3XubVoPrP+s/UIKCVBzpQl+fAY9?=
 =?iso-8859-1?Q?2Rp+UfnN1pWr686shdITN8jER8lQ1AyBNSHT9ay6hpd80FOCYxK3u7X2ow?=
 =?iso-8859-1?Q?ZXUsfquLafQfngHAN3lJpaGkp+iitSgXMVthNcQOrJSbhHTOqSOktRkEeL?=
 =?iso-8859-1?Q?/GxPMmRSiV53YS4wqE8clbaCO+Xawneqsrke4Vfer9WCaglp6JqJbiZsVu?=
 =?iso-8859-1?Q?d5ggN7prV8hXPtyyxp+3+3c4LdMeLeh8cnd7u0AEmQ9ZJAN/txxAcT8QzP?=
 =?iso-8859-1?Q?3c6eXDJ98mAuImvhNLHLLhztK2zPE1yHTJNii68M08YpC/Wa4NflAeQO9b?=
 =?iso-8859-1?Q?uMS4u4izBKIAY37Ulhwvvbe5fHKFzHdZEy7ifBg9Cf5Pbwj5NDyVycxAZ/?=
 =?iso-8859-1?Q?R/oiNQmNmQJGLaFN9FJQg+32BHgwHP27Chih47roL0v8qwdsxs4Wh8n/QM?=
 =?iso-8859-1?Q?RkDcMhG6v7bxOin8u3DYRRvgIlmmGCUD1tfrzc+jSaHdH9A/8JwCgGpwE4?=
 =?iso-8859-1?Q?bw1mAbADyHlbu+9AnCuNdAl32nlbo5HJ6jeb9CE0TQ7rvjndRq6XHFx+BJ?=
 =?iso-8859-1?Q?ITyZdz6LFaQ8nv2qo+QkSWUmSl9F134MuqsqTtrtkzA4G4b+5YNn6QG8PC?=
 =?iso-8859-1?Q?7ChPwZir+1/pqKF4VIVa2ioHun+MBYEAVXuqqwoiGQwv+XTaVMGR7IyTG4?=
 =?iso-8859-1?Q?GibFgpL6pGVI8bPmVMa7U48Gm9OGNIG+Y5lZPq/6D26Ao55e79fXnpTJ3n?=
 =?iso-8859-1?Q?xtYnvXVvpCoezDjiQjgDkv23b/698JRmX5OVCAyWyazkXvG/dWyiH79tp2?=
 =?iso-8859-1?Q?D8PnvOob9srsHrQPjhLgjReAespH1pfIuGniMzlbP23UZlgoDL8p6FircN?=
 =?iso-8859-1?Q?o/8vXogxwIYJsM4ZriaHzHQrUABlaWq1XCi+iMMMjVydSin3ogqRnoV4xi?=
 =?iso-8859-1?Q?ikHLtX0f5CU2zJTlzgZqKoZCLsAclmng33DotxH7yKGt/60jfYT++AB2mP?=
 =?iso-8859-1?Q?lY1rDhPK9QTAd5T1f1B9/l9zZkOJv62A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 06:27:04.1574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc546c9-db43-43fa-9935-08dc7a28325d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6633

Hi Stefano,


> On 26 Apr 2024, at 23:36, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

You might want to answer to Andrew on the footnote and agree or not on his =
way to fix.

Appart from that:
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


> ---
>=20
> Changes in v3:
> - add explanation in footnote
> - remove comment from 21.14, 21.15, 21.16
>=20
> docs/misra/rules.rst | 42 ++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 42 insertions(+)
>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index b7b447e152..5ba7394f05 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -652,12 +652,48 @@ maintainers if you want to suggest a change.
>        declared
>      - See comment for Rule 21.1
>=20
> +   * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_21_06.c>`_
> +     - Required
> +     - The Standard Library input/output routines shall not be used
> +     - Xen doesn't provide, use, or link against a Standard Library [1]_
> +
> +   * - `Rule 21.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_21_09.c>`_
> +     - Required
> +     - The library functions bsearch and qsort of <stdlib.h> shall not b=
e used
> +     - Xen doesn't provide, use, or link against a Standard Library [1]_
> +
> +   * - `Rule 21.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_10.c>`_
> +     - Required
> +     - The Standard Library time and date routines shall not be used
> +     - Xen doesn't provide, use, or link against a Standard Library [1]_
> +
>    * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_21_13.c>`_
>      - Mandatory
>      - Any value passed to a function in <ctype.h> shall be representable=
 as an
>        unsigned char or be the value EOF
>      -
>=20
> +   * - `Rule 21.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_14.c>`_
> +     - Required
> +     - The Standard Library function memcmp shall not be used to compare
> +       null terminated strings
> +     -
> +
> +   * - `Rule 21.15 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_15.c>`_
> +     - Required
> +     - The pointer arguments to the Standard Library functions memcpy,
> +       memmove and memcmp shall be pointers to qualified or unqualified
> +       versions of compatible types
> +     -
> +
> +   * - `Rule 21.16 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_21_16.c>`_
> +     - Required
> +     - The pointer arguments to the Standard Library function memcmp
> +       shall point to either a pointer type, an essentially signed type,
> +       an essentially unsigned type, an essentially Boolean type or an
> +       essentially enum type
> +     - void* arguments are allowed
> +
>    * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_21_17.c>`_
>      - Mandatory
>      - Use of the string handling functions from <string.h> shall not res=
ult in
> @@ -712,3 +748,9 @@ maintainers if you want to suggest a change.
>      - The value of a pointer to a FILE shall not be used after the assoc=
iated
>        stream has been closed
>      -
> +
> +
> +.. [1] Xen implements itself a few functions with names that match the
> +       corresponding function names of the Standard Library for develope=
rs'
> +       convenience. These functions are part of the Xen code and subject=
 to
> +       analysis.
> --=20
> 2.25.1
>=20


