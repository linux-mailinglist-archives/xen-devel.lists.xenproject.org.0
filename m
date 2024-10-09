Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00EC995FE7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 08:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813736.1226746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQJg-0007Dy-Aq; Wed, 09 Oct 2024 06:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813736.1226746; Wed, 09 Oct 2024 06:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQJg-0007A1-6I; Wed, 09 Oct 2024 06:37:00 +0000
Received: by outflank-mailman (input) for mailman id 813736;
 Wed, 09 Oct 2024 06:36:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iX4b=RF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1syQJe-00079u-8Z
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 06:36:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2613::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e096f7e8-8608-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 08:36:56 +0200 (CEST)
Received: from AS9PR06CA0050.eurprd06.prod.outlook.com (2603:10a6:20b:463::13)
 by AS4PR08MB7531.eurprd08.prod.outlook.com (2603:10a6:20b:4fa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Wed, 9 Oct
 2024 06:36:48 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:463:cafe::ae) by AS9PR06CA0050.outlook.office365.com
 (2603:10a6:20b:463::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24 via Frontend
 Transport; Wed, 9 Oct 2024 06:36:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Wed, 9 Oct 2024 06:36:47 +0000
Received: ("Tessian outbound 5b65fbeb7e07:v473");
 Wed, 09 Oct 2024 06:36:46 +0000
Received: from Le7b52f86f994.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBF20473-F0C1-409F-8D3F-F982DE258895.1; 
 Wed, 09 Oct 2024 06:36:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le7b52f86f994.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Oct 2024 06:36:40 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB8400.eurprd08.prod.outlook.com (2603:10a6:10:404::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Wed, 9 Oct
 2024 06:36:37 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 06:36:36 +0000
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
X-Inumbo-ID: e096f7e8-8608-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Hp11hgb1V0BmIMKxmdDPe6JCdFbVwxYYgdKzEqJHis2A+khAHAhA7auZwwUDaCsfXGg5ViUf3R4cZw48BgWJej0GcQMcYCdr8k5IHKoV+2WpgWd80KxV++oBGuxx1Y71olCOJlpB/C4BxkpYNykG+jUN5fqUORWHTdOSDTW/WEr8sLK7aEbCXKQYoFeKRVpm8HxN/emvgzef2fyaWd0y1PW4Vm1Q0GGmfLZEPPjOOvEydHaKl8JQBaMTka4P4QC3sXeavDGMKbM3+O5+KbALWO9krqjoSz4YwGKwGNYB4W/t8NuR8q0eFx98b83LY/ZVdEldj0xv5bQb9K5Frq3N4A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpqGCi7bTLYWWiY8OgykfpefYZTfRH7I0a5ljfAdvEI=;
 b=QntaW/1oCKUsZtCxYt+M+yVhCugV23AL7TnSS2Hpb5H2cbMRb9XlIiwUxzxQvlJjd7lMuGCL4qtMhmt7ZNpdWnt8lyLIItM0Kj9rZVjBy1PmlpZyfLVymvbz4hCX8Ny5C10zSdx69NhE4vftCkrZDD+P/ULKZMfim77fjUtbk8bBRnGI75CoPJICVLequqiGTProCERBw2wmx28mx2LRPxuIAYpWgQQO5fbo//wY/ZcRizfdtihcYRimFLBFeJ/UR6/nYM8kqTpw/UfRvU69M8usnkZZp9A8cpkzXOsY/JwmtLbzzK9CMEsXMf+IbvcuLie6wERhOIyx3m0p9Cb3bA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpqGCi7bTLYWWiY8OgykfpefYZTfRH7I0a5ljfAdvEI=;
 b=UnZBsNzn+NbfrZxghK+C/1Lp42uXgOrVM5GgtRQ18GzvqixzQT65RtP//yON2lz96pV0PsJdYS5IiymPn0Ec8l0jtwhqC3xzMDaRbkQ/804W5AGC2HJRj1/HbKDMdiWilLQUTHAJuf+TKGwZAKu1CkRGmJ+wDGB+TAU25UtizfM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: ea6e90edc277444c
X-TessianGatewayMetadata: Zg2P02ZjL7zf6hcKy6s9LFcQ/WXlcARC4LUH29sVV83cZqfMntL+/0oZgV7JJUbMpMHFlttLB1dAvkA2pxmXCjrn1plWWWiTEKgRLR6NnstryV/8/iSBChsipoq5ULqFGjBgPkV6q9vap2KgHvodOU3u0w4twq6rliFsuRT940I=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A12crVEAUem/tEp0PK9n2q86B+Nxf5UG9PM9X20radSx+72HiFttguG4x1g4DO2U++ObldlZYhhihuF63L4/dYnwIUY02+7u732BvEH//I95td2hSs1e2jNvQqzi+C0Jz8n8BCbs6r9kHlAFf0CXPlm0xTkkfF9l2Z3P1Te0WoFdE8zrAc4kMjj7fq/ueG8QHZoJW+/wtDZdg35DOJy73M9DM59hGf/ab5QbFnt2hy7l80Ky8s+S2D9sAnWrDA8TfgVKfOI/PW485UWguuIgPb7e35AmwayB/QUw+3nbLozzLi5NSqEgPcLIz1jNhbAHUeL9rYUODYxsuYB4ROCGHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpqGCi7bTLYWWiY8OgykfpefYZTfRH7I0a5ljfAdvEI=;
 b=BYganAAiHlbP8F9VCUqNjOkS41rgXMhoBGZmF/UDFSNQRHcmZzoiOvLPnk6AylRquS1afgdl9yc1sytmqCjouIPWMKVMsZUUon5/0IXPYuz3NAj+PdzrP6XPWFfHBYNPc9nl7n+qQJIKkZFfbum7Z3NuUOv5t+aqTB1E652M6QHgU0h6WwXRRr7Kcl9B9nPLpKLkxBlXWlS2M1MG6dn1pgagbAAanXs2+ysPLdFzI3CTeftewxhaob2F6lIs0V5SDpnzT22B1sphtaG2GrIyIQcNm+mcVkRVepACnxl4g8TwMsidTuwkgkbBKdmA02X7BNQO7jXJieqoJgGJf9X6dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpqGCi7bTLYWWiY8OgykfpefYZTfRH7I0a5ljfAdvEI=;
 b=UnZBsNzn+NbfrZxghK+C/1Lp42uXgOrVM5GgtRQ18GzvqixzQT65RtP//yON2lz96pV0PsJdYS5IiymPn0Ec8l0jtwhqC3xzMDaRbkQ/804W5AGC2HJRj1/HbKDMdiWilLQUTHAJuf+TKGwZAKu1CkRGmJ+wDGB+TAU25UtizfM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>, Hisao
 Munakata <hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Topic: [PATCH] docs: fusa: Add requirements for Device Passthrough
Thread-Index: AQHbGOqFqldnvX8xNEmI4LnFnImSpbJ8YaSAgADTLwCAAMR5AA==
Date: Wed, 9 Oct 2024 06:36:36 +0000
Message-ID: <9C3AD765-C165-4B46-AEEB-8C5F87861947@arm.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
In-Reply-To: <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB8400:EE_|AMS0EPF000001A5:EE_|AS4PR08MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f4fbb5-f686-4a24-7294-08dce82cc00a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3Pok7tdth3b6KVEcDNI9kwiwMu9HSevVQxre5m0I6tgX2TkUWvHxi/i36ITi?=
 =?us-ascii?Q?fzJzWnqbsOfDMVdIZBxrtY01pzTY5MvFlLSgdHf/qvQjgukMbq0EosdjoUjX?=
 =?us-ascii?Q?rrcVjGyMAIlmhq1nlhRwYQyp28DrShiN+6LOgCujjr2gnpvuBofhbibSoPlu?=
 =?us-ascii?Q?kXFIZebEE0Bx5bdGWH7owJ88N8NKHOQ6w1Yf2HVVsMf7dP06epKSW0eVnq7v?=
 =?us-ascii?Q?Mfn+bpdcJ7gRQ4sMCU3H5ZmeLuQDC2uFKdCVNZxgnQWtf9pQQ/yXiGOZUE4J?=
 =?us-ascii?Q?7WPg1YDu18VNRCfaKPNGHi5y0xblS7CYwmrBPxqwdgUIk/0rSoKWdAjILVhp?=
 =?us-ascii?Q?Et22dHIMKrYG5RoJJCI2OCs305dq+gr43r/CH5A5C0DQSo94C42W+qbBdlhj?=
 =?us-ascii?Q?1BcRqj6pX87FCGXk6cBxhZ/g+5MKOfp52nB1w/JcB7G6TT/6zasWiRNPXwhb?=
 =?us-ascii?Q?cFJF3antbbK46sK1rpKARRRgi7e+Pyl365zIBRY/m9b0maLQ7ezT6H/v9yrM?=
 =?us-ascii?Q?eTWjvmUqoTtilKcZEG/kOiWGBSbQA0kYPK662SoAmqoGuJnAl4rPQG/lcPgW?=
 =?us-ascii?Q?XUfjm2+7cgKmQt+bDSFelt3wfebMHLZ0REB+e9bJOV20XLLSofCWx7QQUV96?=
 =?us-ascii?Q?u6k8q7Sy9XVuizCpwhV0KBvcmWk12wxyHZ1tofebElbpCPsF0quflMZuPDvF?=
 =?us-ascii?Q?iZ0maZOitJIxJVBRqcfM7JJEnDU3KivF7F0Wu2x6eizFqOPYzMjpzwiW6Za/?=
 =?us-ascii?Q?YRMKCT4f4Nqaqj5alKl/NY+aNfkuIpOTY/dBGtYiZp4TfelptQ9iW8A3BZgp?=
 =?us-ascii?Q?UCT8eeKmsTFowvJw9l5cw1Uspxa27+gchV2w2j7gQKEGkbLHXs2IVi2nBZR5?=
 =?us-ascii?Q?ALnwY442BvFB4GOt+GvS4+yR6OBCG4i7NmfaXtN99IfQC0xATHRc9Y0ebfxo?=
 =?us-ascii?Q?eZLDGtsjxZAdLtKpU3hkyR4XhKG9WJxeBw1h5bet/7bTZPvzEm2UmBlWEJOL?=
 =?us-ascii?Q?el2ms9wAgS1N+bwh2duon6adHYzOb6617rXuvfiNRgpiu39D+qE1vk/kUqsd?=
 =?us-ascii?Q?WshcI9rnMfBMMZm8efZ1tvQRsHazkOdHjsr+YNlOBG0s6O5wBHICU4bJMwso?=
 =?us-ascii?Q?Od/FW5injge1Q1c32JSTUTdIU+dJs6FCw759iZExTiUXisP+2kJpNf0f3wj7?=
 =?us-ascii?Q?TGX1CfESLytBRXsG75wJpwzGbnP+LAQkY/TaRZTeERv/XnALm22Ewg9xQFY7?=
 =?us-ascii?Q?UwhxXEKyOMM3cxEaSEVG+X/YZa5qKQlfsYAhzsGpfw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D3752A723D2E61478AA7B4E48EDC74BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8400
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	99a1bfac-81cc-42e4-1897-08dce82cb993
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MIBF7zWBFLdpKSP4GELPiFEXwxEhPB3UexV8v3SDAwcGkhP5juvlCsijvbLI?=
 =?us-ascii?Q?m1AokqOs1+L9kexvun9BoadK18VnA8+Iyz6HdrYhPbUUR+624hOibynTFFqw?=
 =?us-ascii?Q?1bEb3FwPxG/56rsEZc9JA3eWpJ/W5cyySvU/YtGvkAdmpadNGWMGJJMUmrWh?=
 =?us-ascii?Q?47w5Q3CO6AVghfUqAHTuQYt0SHUfz1RsZtXLDKeOSyajRZX4s2sBkjH6r10w?=
 =?us-ascii?Q?dPkjCpeyuXky87Zemv8MwwpQa6gXsaYaZo/C2sH/Z6NXCDScKhqFWLzdGPTk?=
 =?us-ascii?Q?vNSxr9OmXJKAld5XGa+/M4cJ700JfPKNt8rr7/ccAviZB5sWMancK7a0UoSV?=
 =?us-ascii?Q?TIWL09eTExngMRu5nfV3vSi7gUSgAM8Z2cvAYA5A4powfbhkUR/+gAfggz/1?=
 =?us-ascii?Q?nn0f5lqrSHdSAGcw36T/MvExy4qpQsRVvy2Rh2uxTF4swG2V9IVKUZ8J4HQZ?=
 =?us-ascii?Q?RDaROT/EAYO0necrwTJrzAA5MEd3hvoxJWp7vTKeAhWoXDjGyq+ruknmMbH6?=
 =?us-ascii?Q?4uHR44i4vYrBIs+qRF+qNfiFQPes0GRxchalbvQ9QTXZ9HTb8pEFfio8sDch?=
 =?us-ascii?Q?TPi2r3yiHgIKRBl5QN5Gaj7ZDkYRlFLDjoHR8Hcw6rExGQOS+CKjKftFGzlE?=
 =?us-ascii?Q?oFnsB6iujN2vR16audhEao669fL4ICdR7rQIdenIdIr11gNF4luOiOwCl02+?=
 =?us-ascii?Q?26pGCgLXARZ1DNlXM5drCrbowYP6m1NpCymgEx1z00tJnTlyaioaMcl8j8DK?=
 =?us-ascii?Q?x3wDE8ntYv5eKJXIs9lRV4nJnuEhBq9qtuN37sPDFD0rVbj7n/8fkeeQli3w?=
 =?us-ascii?Q?dqbWzeUAcGwD+dZPFxlj+0dcX8so7zx1i/AkKSAcO0oCXUcVoc9WGaCc+bF0?=
 =?us-ascii?Q?lnWgLBPDCENXkparvj+ORr9bVQ3mtJRCnC9x2QpOMGpu+cOeMrP9L+gJSr5P?=
 =?us-ascii?Q?FVMzUE7bbep4h9GKvuTo59arXmujy2kEvUHiHkeyF42wrhL3dXomoCfWjiKG?=
 =?us-ascii?Q?z29+20vaIZZzGnDW6ibjOoAWy3nswOYl1SlrtK04/BCMse08WSmNZcFAWIHf?=
 =?us-ascii?Q?ZAAhEshdLV5SHLVW+uHXw4m5QzhRXlIPVTyFIQ+zurT+iAEojIO6Xwc9WuRR?=
 =?us-ascii?Q?BEFSaXLflI2O3xRBeMBx8hUH3/nqAjNtf7LrAkNAf3rXCXjrslHyNRmHNQyE?=
 =?us-ascii?Q?DFbNjipCp8CmICyzFjsyc4Pu3KsSZITYO4EnSYjEVgVguOkCpT/aN+CJC0t6?=
 =?us-ascii?Q?mn1iQK2MQlinE+2xhBHAf7nnr6CRvvEA1KpEhTo9lF1IFzTRyp9b9OXhDjDu?=
 =?us-ascii?Q?VE02WTufjmGIvCh4YmYgDs+f?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 06:36:47.7258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f4fbb5-f686-4a24-7294-08dce82cc00a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7531

Hi Oleksandr,

> On 8 Oct 2024, at 20:53, Oleksandr Tyshchenko <olekstysh@gmail.com> wrote=
:
>=20
>=20
>=20
> On 08.10.24 09:17, Bertrand Marquis wrote:
>> Hi,
>=20
> Hello Bertrand
>=20
>=20
>>> On 7 Oct 2024, at 20:55, Oleksandr Tyshchenko <olekstysh@gmail.com> wro=
te:
>>>=20
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>=20
>>> Add common requirements for a physical device assignment to Arm64
>>> and AMD64 PVH domains.
>>>=20
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> Based on:
>>> [PATCH] docs: fusa: Replace VM with domain
>>> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.c=
om/
>>> ---
>>> ---
>>> .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
>>> docs/fusa/reqs/index.rst                      |   1 +
>>> docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
>>> docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
>>> 4 files changed, 428 insertions(+)
>>> create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
>>> create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
>>>=20
>>> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst b/docs/f=
usa/reqs/design-reqs/common/passthrough.rst
>>> new file mode 100644
>>> index 0000000000..a1d6676f65
>>> --- /dev/null
>>> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
>>> @@ -0,0 +1,365 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Device Passthrough
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +The following are the requirements related to a physical device assign=
ment
>>> +[1], [2] to Arm64 and AMD64 PVH domains.
>>> +
>>> +Requirements for both Arm64 and AMD64 PVH
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +
>>> +Hide IOMMU from a domain
>>> +------------------------
>>> +
>>> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
>>> +
>>> +Description:
>>> +Xen shall not expose the IOMMU device to the domain even if I/O virtua=
lization
>>> +is disabled. The IOMMU shall be under hypervisor control only.
>>> +
>>> +Rationale:
>> I think there should be a rationale here to explain why we do not want t=
he IOMMU
>> in particular to be assigned to a domain.
>=20
>=20
> ok, will add. I propose the following text:
>=20
> Xen having the whole picture of the host resources and device assignment =
unlike the individual domain makes use of the IOMMU to:
> - perform DMA Remapping on Arm64 and AMD64 platforms, which is also known=
 as stage-2 (or 2nd stage) address translations for DMA devices passed thro=
ugh to domains and Interrupt Remapping on AMD64 platforms.
remove arm64 or amd64, this is always true

> - provide access protection functionalities to prevent malicious or buggy=
 DMA devices from accessing arbitrary memory ranges (e.g. memory allocated =
to other domains) or from generating interrupts that could affect other dom=
ains.

I would turn this in positive: restrict DMA devices to only have access to =
the memory of the Domain there are assigned to or no memory at all if not a=
ssigned (maybe 2 reqs here).

>=20
>=20
>> Added to that, I am not completely sure that there is a clear way to tes=
t this one
>> as for example one could assign registers not known by Xen.
>=20
> I am afraid you are right, valid point. For example, on Arm64, if there i=
s no corresponding driver in use, we will end up exposing IOMMU dt node to =
Dom0.
>=20
>=20
>> Shouldn't this requirement in fact be an assumption of use ?
>=20
> Assumption of use on Xen? From my PoV sounds reasonable, will do.

As was suggested by stefano, i agree with him on turning it differently. Pl=
ease see his answer.

>=20
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Discover PCI devices from hardware domain
>>> +-----------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
>>> +
>>> +Description:
>>> +The hardware domain shall enumerate and discover PCI devices and infor=
m Xen
>>> +about their appearance and disappearance.
>> Again this is a design requirement telling what should be done by a doma=
in.
>> This is an interface or an assumption of use but not a Xen design req.
>=20
> I agree, will convert to Assumption of use on domain.
>=20
>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Discover PCI devices from Xen
>>> +-----------------------------
>>> +
>>> +`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
>>> +
>>> +Description:
>>> +Xen shall discover PCI devices (enumerated by the firmware beforehand)=
 during
>>> +boot if the hardware domain is not present.
>> I am a bit wondering here why we would not want Xen to always do it if w=
e have
>> the code to do it in Xen anyway.
>=20
> Makes sense, will drop "if the hardware domain is not present".
>=20
>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Assign PCI device to domain (with IOMMU)
>>> +----------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
>>> +
>>> +Description:
>>> +Xen shall assign a specified PCI device (always implied as DMA-capable=
) to
>>> +a domain during its creation using passthrough (partial) device tree o=
n Arm64
>>> +and Hyperlaunch device tree on AMD-x86. The physical device to be assi=
gned is
>>> +protected by the IOMMU.
>> This is a very long and complex requirement.
>> I would suggest to split it in 3:
>> - generic: Xen shall support assign PCI devices to domains.
>> - arm64 one: Xen shall assign PCI devices based on device tree (explain =
how this is configured in dts)
>> - amd: xxxx based on hyperlaunch
>=20
> I agree, will split, but ...
>=20
>> - Xen shall use the IOMMU to enforce DMA operations done by a PCI device=
 assigned to a domain to be restricted to the memory of the given domain.
>=20
>=20
> ... does this need to be a separate 4th requirement here (and for the sim=
ilar requirement for the platform device down the document) or this sentenc=
e is meant to be added to all resulting generic/arm64/amd requirements?
>=20
> I would like to clarify, there are two groups of requirements to cover DM=
A-capable devices in this document:
> - for devices that are behind the IOMMU and IOMMU can be used for them, t=
hose requirements description explicitly mention "device xxx is protected b=
y the IOMMU" in addition to "(with IOMMU)" in the subject.
> - for devices that are not behind the IOMMU or IOMMU cannot be used for t=
hem, those requirements description explicitly mention "device xxx is not p=
rotected by the IOMMU" in addition to "(without IOMMU)" in the subject.

I think you need to be more generic and any DMA engine that is not protecte=
d by an IOMMU shall not be assigned to a non trusted domain.
This is in fact a requirement on the integrator, Xen cannot do much about t=
his.

>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Deassign PCI device from domain (with IOMMU)
>>> +--------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_deassign_pci_device_with_iommu~1`
>>> +
>>> +Description:
>>> +Xen shall deassign a specified PCI device from a domain during its des=
truction.
>>> +The physical device to be deassigned is protected by the IOMMU.
>> Remove second sentence or turn it into a req to say that the PCI device =
shall not be allowed to do DMA anymore somehow.
>=20
>=20
> I would like to clarify, the second sentence here is just to indicate wha=
t type of device (in the context of IOMMU involvement) the requirement is t=
alking about, not about special care for denying any DMA from it after deas=
signing.
>=20
> If you still think that we need a new requirement to explicitly highlight=
 that, I will be ok to create, in that case, I assume, the platform device =
will want to gain the similar requirement. Please let me know your preferen=
ce.

As said in the mail to stefano, i think we should try to generalise more.
So i would say we should handle:
- register assignments
- DMA engine handling
- interrupt handling

A device is a just a logical construct which may or may not contain or use =
several of those elements.

>=20
>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Forbid the same PCI device assignment to multiple domains
>>> +---------------------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_forbid_same_pci_device_assignment~1`
>>> +
>>> +Description:
>>> +Xen shall not assign the same PCI device to multiple domains by failin=
g to
>>> +create a new domain if the device to be passed through is already assi=
gned
>>> +to the existing domain. Also different PCI devices which share some re=
sources
>>> +(interrupts, IOMMU connections) can be assigned only to the same domai=
n.
>> Please split and simplify
>> - Xen shall assign a single device to a single domain
>> - Xen shall assign PCI devices sharing resources to the same domain.
>=20
> Good point, will split.
>=20
>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Requirements for Arm64 only
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>> +
>>> +Assign interrupt-less platform device to domain
>>> +-----------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_assign_interrupt_less_platform_device~1`
>>> +
>>> +Description:
>>> +Xen shall assign a specified platform device that has only a MMIO regi=
on
>>> +(does not have any interrupts) to a domain during its creation using p=
assthrough
>>> +device tree.
>>> +The example of interrupt-less device is PWM or clock controller.
>> I am a bit puzzled by this req. Why making a specific case for interrupt=
 less ?
>=20
>=20
> Those devices exist and can be assigned to a domain, they are configured =
slightly differently in comparison with devices with interrupts ("xen,path"=
 is not needed for the former), other code paths are executed in Xen.
>=20
> More technical details:
> The allowance of the platform device assignment which is not behind an IO=
MMU (for both non-DMA-capable and DMA-capable devices) is specified using d=
evice tree property ("xen,force-assign-without-iommu") in the device node d=
escribed in the passthrough device tree. The said property also allows the =
interrupt-less platform device assignment (a device that has only a MMIO re=
gion) without specifying the corresponding node in the host device via devi=
ce tree property ("xen,path").

Please see upper.

>=20
>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Deassign interrupt-less platform device from domain
>>> +---------------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_deassign_interrupt_less_platform_device~1`
>>> +
>>> +Description:
>>> +Xen shall deassign a specified platform device that has only a MMIO re=
gion
>>> +(does not have any interrupts) from a domain during its destruction.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Assign non-DMA-capable platform device to domain
>>> +------------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_assign_non_dma_platform_device~1`
>>> +
>>> +Description:
>>> +Xen shall assign a specified non-DMA-capable platform device to a doma=
in during
>>> +its creation using passthrough device tree.
>>> +The example of non-DMA-capable device is Timer.
>> Again why making a specific case here ?
>=20
> Almost the same answer as for interrupt-less device. Here "xen,path" is n=
eeded.
>=20
>=20
>> Wouldn't it me more logic to describe device passthrough and then what X=
en should do for interrupts and for DMA ?
>=20
> I can add more details on how this is configured/what properties are used=
, etc in rationale for each requirement mentioning device tree. Or do you m=
ean something else?
>=20
>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Deassign non-DMA-capable platform device from domain
>>> +----------------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_deassign_non_dma_platform_device~1`
>>> +
>>> +Description:
>>> +Xen shall deassign a specified non-DMA-capable platform device from a =
domain
>>> +during its destruction.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Assign DMA-capable platform device to domain (with IOMMU)
>>> +---------------------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_assign_dma_platform_device_with_iommu~1`
>>> +
>>> +Description:
>>> +Xen shall assign a specified DMA-capable platform device to a domain d=
uring
>>> +its creation using passthrough device tree. The physical device to be =
assigned
>>> +is protected by the IOMMU.
>> This requirement is not a design but an higher level as it does not tell=
 anything about implementation.
>=20
> Ok, will add details regarding passthrough/host device trees.
>=20
>=20
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Deassign DMA-capable platform device from domain (with IOMMU)
>>> +-------------------------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_deassign_dma_platform_device_with_iommu~1`
>>> +
>>> +Description:
>>> +Xen shall deassign a specified DMA-capable platform device from a doma=
in during
>>> +its destruction. The physical device to be deassigned is protected by =
the IOMMU.
>>> +
>>> +Rationale:
>>> +
>>> +Comments:
>>> +
>>> +Covers:
>>> + - `XenProd~device_passthrough~1`
>>> +
>>> +Assign DMA-capable platform device to domain (without IOMMU)
>>> +------------------------------------------------------------
>>> +
>>> +`XenSwdgn~passthrough_assign_dma_platform_device_without_iommu~1`
>>> +
>>> +Description:
>>> +Xen shall assign a specified DMA-capable platform device to a domain d=
uring
>>> +its creation using passthrough device tree. The physical device to be =
assigned
>>> +is not protected by the IOMMU.
>>> +The DMA-capable device assignment which is not behind an IOMMU is allo=
wed for
>>> +the direct mapped domains only. The direct mapped domain must be eithe=
r safe or
>>> +additional security mechanisms for protecting against possible malicio=
us or
>>> +buggy DMA devices must be in place, e.g. Xilinx memory protection unit=
 (XMPU)
>>> +and Xilinx peripheral protection unit (XPPU).
>> Please split in several reqs.
>=20
>=20
> I agree, will do. I feel it should be split into the following requiremen=
ts:
> - Assign DMA-capable platform device to domain (without IOMMU)
> - Create direct mapped domain
> - Enable additional security mechanisms in direct mapped domain
>=20
> To be honest, I'm not quite sure whether it is worth creating the last re=
quirement ...

I do not think the last one is needed here.
It could be an integrator guidance at best.

Cheers
Bertrand

>=20
>=20
>> Stopping here my review for now
>=20
> Thanks for the review.
>=20
>=20
>> Cheers
>> Bertrand
>=20
> [snip]



