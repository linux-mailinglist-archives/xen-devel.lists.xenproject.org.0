Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320294582C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 08:50:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770204.1181143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZm7K-0005IO-Iw; Fri, 02 Aug 2024 06:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770204.1181143; Fri, 02 Aug 2024 06:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZm7K-0005FF-EW; Fri, 02 Aug 2024 06:50:22 +0000
Received: by outflank-mailman (input) for mailman id 770204;
 Fri, 02 Aug 2024 06:50:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0M7b=PB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sZm7J-0005F8-3p
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 06:50:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20600.outbound.protection.outlook.com
 [2a01:111:f403:260d::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b2554ac-509b-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 08:50:19 +0200 (CEST)
Received: from AM9P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::11)
 by GV2PR08MB8123.eurprd08.prod.outlook.com (2603:10a6:150:78::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 06:50:16 +0000
Received: from AMS0EPF00000192.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::e9) by AM9P250CA0006.outlook.office365.com
 (2603:10a6:20b:21c::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 06:50:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000192.mail.protection.outlook.com (10.167.16.218) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19
 via Frontend Transport; Fri, 2 Aug 2024 06:50:15 +0000
Received: ("Tessian outbound ca8e5f27f95f:v365");
 Fri, 02 Aug 2024 06:50:14 +0000
Received: from L54c7aa3e0c7c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F169BDBE-0E18-446D-AC6C-10C6D8EC219E.1; 
 Fri, 02 Aug 2024 06:50:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L54c7aa3e0c7c.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Aug 2024 06:50:08 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB7918.eurprd08.prod.outlook.com (2603:10a6:20b:539::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 06:50:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 06:50:06 +0000
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
X-Inumbo-ID: 7b2554ac-509b-11ef-8776-851b0ebba9a2
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xP+8sAaX/1tOJIxmCZNsh5YOsNanOWBvSCwkqfxya5+YoF3J4Lz0wh02LUj3OIZQz5iaKE5TtOct06RJEro/5aHcATSC2pgrBo/HMCt7Jjl8LMSJcvRJhQCEWhmDl42L+ENcImuax55VfC6ezlkNEPMHeLel2JRaGCUq66NeWj7HMmDArVn6DOsxVjQPz0QDqq8qds4A8ZvFf49tzpdrLCEOVCJ7rZbl/1l+5PEIvceFacO+UC3OtvqWGmcbbMXVAe+JdPO5M1peLZZ6bPKD1ginHjdqFej1rWN7nhtyHwo5C2uFNaKehjXgLoidE7g+wT09hp3SeNRDxXK4sqMPVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W974462qlr+13/yGCFc1g0TBYCavo5uct3zZg86InZk=;
 b=ttthh5JWsAT8P2iUzMfpFIUJUdcXG7Oi42ZRtZBjbMfw2XpLze0bUV2wAhPQzy9Fa+z5FUSXTQkBEoPnBaRegae4zY1msbs2Z8GM8yjPLQr3rV+9+TyxjTmw+rzKC7AKG1XcLsG+9eoMbjj5LSgZIKOwyrIrkgZSPK0BTbZyJrjuCfaALjR1Lk8tZhk9e/PGTaYDDOClyeYRl9ipyGbc7h/VpbrZWN6iDPmSi/7jrQW6axAzdlqnjPTpB/3psTbxC/CljIww+1kvMYSgMwd6a+ZLRgF606gr3pgtVmzd+OwaHtisg7rA3zQdA/3Z4J7Wrx99rEJ2nuDTTaQRxiZYbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W974462qlr+13/yGCFc1g0TBYCavo5uct3zZg86InZk=;
 b=R+FEYKoUS8aQRty1/NGJI0vOdvKaOt+MYOPn2ktvseGgddUcM57WMXdl4s+oq8jblrJu5PglqGDpPAG2zw4+E8LvXf0H5hmacOEzqk7cA730m9a1j78r0loxrADo1/EsH1mnXeNlze0olwYt1BcCHjkKtar+rABMWT/pyq/aJyc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cae9b2a675ca3886
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNYwoqS+rSiv/82DkAjCjo91Hwp3/cZLgvh4dXS6vuhVRAbRMRIprD2VRhEz6VwdS5xgl88eWPB4GJpvy/ETpUv/Pl39XrkomXKlfEKbQ+EfzPM7hdmUTpKU+Xbjq9vILb2VSBA8mzeHZha3vy9VsZq73ORJeclTNatieqXm1jk5ZAgpPFjPzvnw2Qm14FKnRstz+U3XidEyH/UtPZHG0EX7LT7Ri2DJdyxdy6aHe28ueqZJBjxlyJp05mSpuGW8GXgmbyW/bJFzN4d201A+ze6huKQfLnhTSEUyvZeNNu7uR2mlSOl6JMm/GkJc9Yi1fdiwskmovqpPeNWVT6OhkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W974462qlr+13/yGCFc1g0TBYCavo5uct3zZg86InZk=;
 b=iZgLKTTwIK3MIG8V232cncEMqXuwSLXZeFe6nmCsgtJu+70Go05SVoSaAq0/5Hca+QLb6HUHhsRq+4lwPmklNsYUbAkU73wq8SVeHFph+FlaDbu+lKp893B079TtPko0unZclazSdYV5s1JOm9eIZg/TP60IuPvqKp1iLkvya9nx8AmI/+L2lUE30095yw4gWcvelz+sIlkXuv1CZpTjOZidWkl33sZL+8efrp8EQRhg9mWU19XVjTvemrBQr4sRmFp/RA74iQAL8HvdadMrIcClsvBTky4jCVVWLTLv7lIbY20LF4JN/WEgdUjmwZJd9m2lallbg/JDYmvF6yb5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W974462qlr+13/yGCFc1g0TBYCavo5uct3zZg86InZk=;
 b=R+FEYKoUS8aQRty1/NGJI0vOdvKaOt+MYOPn2ktvseGgddUcM57WMXdl4s+oq8jblrJu5PglqGDpPAG2zw4+E8LvXf0H5hmacOEzqk7cA730m9a1j78r0loxrADo1/EsH1mnXeNlze0olwYt1BcCHjkKtar+rABMWT/pyq/aJyc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Michal Orzel
	<michal.orzel@amd.com>, "artem_mygaiev@epam.com" <artem_mygaiev@epam.com>,
	Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] docs: Introduce Fusa Requirement and define
 maintainers
Thread-Topic: [PATCH 1/2] docs: Introduce Fusa Requirement and define
 maintainers
Thread-Index: AQHa42fbGCmFAEygKEmXqoJI7sDdCrIRgPiAgAIIlYA=
Date: Fri, 2 Aug 2024 06:50:06 +0000
Message-ID: <3BD6C548-242D-4DF3-92B0-9B02019A2830@arm.com>
References: <20240731163614.616162-1-ayan.kumar.halder@amd.com>
 <20240731163614.616162-2-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2407311517480.4857@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2407311517480.4857@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB7918:EE_|AMS0EPF00000192:EE_|GV2PR08MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7f4409-e969-460c-b4e6-08dcb2bf5d56
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?LUbOHw9dDRWo6Sg7tm7nTKX3hX0FGSpj5IOfq8uScruev97ZY0fZcu+6yuL+?=
 =?us-ascii?Q?F4SThSE/davn7PtgyYhRJaHhb5S4Mgihzg0yX9rLHAGlMudmwQo6GoKwZooN?=
 =?us-ascii?Q?iuPHneH9X6rXLw1Vf9l6/KOzTm//ifDvMD0yfLxzmQiRGk6rsnAuGwHP3CG9?=
 =?us-ascii?Q?PPVNy6YocPXuQT1+ejdIXBWBq5n5xpQuAusb6lcjEekpZnD4aKYJ3kFa+TXS?=
 =?us-ascii?Q?2pJTqfax6yiS3++y+2HRmiv2foqzHTFT+9LQkmSl1tytDo62Q54uc+7asjq+?=
 =?us-ascii?Q?fTNqjfgckKZMGakJSTv+HXXmjDNRYjMjJbLCTkSPtxtz4COrkB7Hy+vMcljw?=
 =?us-ascii?Q?dA5iIFTvE1Em7KCuAWxR8rAM94peh+7smng0n/QvppvN0g1io3Gnj3aqXgg6?=
 =?us-ascii?Q?3h72Hx6Rro3XzszrsqydlMswRs1QSzQOn7r30XUu1od+xDua/tdJXHg7vlRq?=
 =?us-ascii?Q?mQ4BPupZ6OOgsWQI9c3Sh/JGov2PZ6NS0aP2zh441XHha+NNyM3jIv81SFDY?=
 =?us-ascii?Q?cAPoVLpiBJixdKgcAhs1L3PYSYcTskoiVwzA4o0BogbMh2yQ60XPB2cMdzaS?=
 =?us-ascii?Q?FiiIhnfly0pZ0+X/fheo3MaDsf+5FHkDrHLFP0k3cRqwS9N3Hyr6NY5Vz6yu?=
 =?us-ascii?Q?QBJNV0SRtSt5iG6kai4yNGzPGqDExu1YyRfjV6c7UVNB+tdklUZraFqMi14I?=
 =?us-ascii?Q?2uibIOS+X44jzwhQxBMgQ29X+PSyg7P1uvmr1eF9aX6NtGhXEyUA+K0SUH7z?=
 =?us-ascii?Q?Bu2gG9D6KCeNKHSCxRHEf/8gc4Mr/D8VdIDw2y/r85TkCJhWxvqTFZBJ84kw?=
 =?us-ascii?Q?PCYJ13/Vu6WDN3Y4Wkc1UidLhTFe+9U2hLF19fX7R3M/x3WN5YICI7pQ4++J?=
 =?us-ascii?Q?cBiFzgq5Y01xCoFzQtU4w/MEnJ8OPSuXLxjFungcePfsEdcQQ2fM2LGh1fxt?=
 =?us-ascii?Q?BkKSPZs23l22YpQcxsdqT6i7CXUf77bAWj9A3AfCkV1+IuGRStCw7XTXjonW?=
 =?us-ascii?Q?5bZWMtSc1EvqKaRooTeBg1lgwIRmW9M6eFVbR1//HhLVWHffsF1SE1mRV87T?=
 =?us-ascii?Q?KsMyfZ19pv7AUBfieSgO0+JOfViN7hbATQBoTx397EeVArTrQiI/RFOQBN49?=
 =?us-ascii?Q?FgMK8/mJbt/W0RJDnOqsbPxQnFedfGJFzD3koEvNlVlANBcyJ+p+tzetIm4H?=
 =?us-ascii?Q?7ljNLqYgbiUBdXxbShWjthjzZJU8b90DPF/pzKoeR4HRlJZM7Iyjw4PpLvqq?=
 =?us-ascii?Q?t8fxPmZa8B7UcJVqbeJqvG0l6b3+Elf/GXXpuiFI3rQbk3lJAPCIUWjE5rrE?=
 =?us-ascii?Q?jp/9+sv3d4dsnpNeA0akRoDAVmaWZGc3uF0Npqui99ECy/OxkU7L5o2f+8NY?=
 =?us-ascii?Q?5pHGZRGziqT/D1DO16jui4M29zWs7sJtN8RNNR6zQZHimCQIJA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9125E7D5C079E94683C122EB4BF8CA16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7918
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2212d8b-70fa-4c82-f825-08dcb2bf57d2
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8PHWsVO5++8aK8m1JHZO22eObt/pLvNLvjtAvHe2Cn74IuJrImHzOhE4NC7l?=
 =?us-ascii?Q?pe1Ia7ZnqFm8l0+ewkpufbg2L+vEejL/aISatv4+1poT9hI2aEaxrjubL+gS?=
 =?us-ascii?Q?fS2hP3V4+acr5o141SgKyWYfkw7oG1Kn9Vd3wz3t8btziZHwDkRZT5m6EgYS?=
 =?us-ascii?Q?Na6I7IvLTWgpi3wa7PY7YyixklM0CNk+Fw/D68UF6yeMmaNynAj4+b8VDCpb?=
 =?us-ascii?Q?QgivzaFz1R+u4WmI1ssgNjkp02uvuaoHTSXqvgDdh7Bvay3nodkrY1GRTWWy?=
 =?us-ascii?Q?hAnjnH56cln3fhK8Pid+p0RJ5PwmOVrXPkWPyBHPSCOE3rWhtkZ35s9A8z7M?=
 =?us-ascii?Q?pgW8q2Ic7Sip9QRRtzbv3UJNAlsTVGxCuIDU5IdSNAkufJVmRvFev/en1zFu?=
 =?us-ascii?Q?ychWZD48zoPMqb7SHvHaeTJOGACvUvAiVhu4rG6M4nqlA/MrgrXUMJYhPcjJ?=
 =?us-ascii?Q?ZVQEdKT6Z7PgmmZxTHAKwU0U1cdJxTs77p0c1lnGQEudvp1HPYmIuwTQyaFp?=
 =?us-ascii?Q?u7zzAiOVFh5qRYO9paE0gTh54Jb9oUDlCle3ELUKEJ4+mKewizuH4arFK1Ya?=
 =?us-ascii?Q?Ggh1+i2yFwcFXYMbOO9bAxno0m4idPkWnODAUNi3ROwK+Fo/UzgEGhnM4n2q?=
 =?us-ascii?Q?DiameRduRdBUpQtbsQSVjbge7e8+WbPi8Bcn3slLoopUA1b4nOKDENq3M/FI?=
 =?us-ascii?Q?X6zr8xiOAZ0WnUqtLUIqZVDH/TzvNdgVFCOuwqRA77EkL7xE6n5Ar7DBSKSR?=
 =?us-ascii?Q?cak+w7ZTMkraVquTLAPodswYQtrMZz7V/0Y8S20WycZ8iGoUrphpLYO/HMC9?=
 =?us-ascii?Q?3HnyR7lDXfdH+bKKXxn77nC38BKJuTYe9FCtOITqrpLZfk+HRIo8yv43dcbr?=
 =?us-ascii?Q?WV61G4C8kUmIt1zLTtHhVOT99JvCJrzhprjfHQp7xcv1u/1z8bdhCXHDK6ok?=
 =?us-ascii?Q?EOrswj+k9Z+VAxN2zV45Meubb8yJzbtkU9Qwq0yGVQVZMKOLDhNFo7YUc+AE?=
 =?us-ascii?Q?QZveGTGG/Nw1s1uGc9b1aeu4/ZePwwroYF32Xiqt9AC0lm0stpBWV9+hk2pf?=
 =?us-ascii?Q?/temRGSLEyCrFiDuTAuprYLpO0Bp9o+3/1QQtg56khGkULShrcFqS17KTKF5?=
 =?us-ascii?Q?LM2monu4oSNd51pqrrfDosEdnGox/EH1GXsTnOptZvxcqI39g/iunXNlsZ4a?=
 =?us-ascii?Q?B60d6rKpSX+0i1hVXJoNgUBLQJipIh2zumrpv6gxzhhvJHgq/XPiSXK9ayQP?=
 =?us-ascii?Q?nSCd4LxPNDyjTgp6w8UwqeETFcy0dcSzDYvLZzkl1I7j9l9rlntu291uqeaC?=
 =?us-ascii?Q?+hQkLN3lzgR8aLim/ehWZz2OZMOXMwNyEZ9w3aW7owd09H8Cwov+D3/SKqJF?=
 =?us-ascii?Q?TSk4qnqdZTF9nAWIAQHlf82IBE5dZ2gn2Vv2eTq1G9rYa36YEXIRpzgaCX07?=
 =?us-ascii?Q?lqnWAphwGZlDTCQCFtvLPY/ftIwByz2i?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 06:50:15.2822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7f4409-e969-460c-b4e6-08dcb2bf5d56
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000192.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8123

Hi Ayan,


> On 1 Aug 2024, at 01:46, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 31 Jul 2024, Ayan Kumar Halder wrote:
>> The FUSA folder is expected to contain requirements and other documents
>> to enable safety certification of Xen hypervisor.
>> Added a README to explain how the requirements are categorized, written
>> and their supported status.
>>=20
>> Added maintainers for the same.

I think this is a good start and we will revisit the details along the way.

>>=20
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

With the comment from Stefano handled:
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


