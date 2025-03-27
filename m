Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF65A72BC5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 09:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928723.1331393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txit2-0002jh-3Z; Thu, 27 Mar 2025 08:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928723.1331393; Thu, 27 Mar 2025 08:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txit2-0002hB-05; Thu, 27 Mar 2025 08:46:52 +0000
Received: by outflank-mailman (input) for mailman id 928723;
 Thu, 27 Mar 2025 08:46:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yWE1=WO=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1txit0-0002h5-QH
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 08:46:50 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c201::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 052bf424-0ae8-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 09:46:48 +0100 (CET)
Received: from AS4P195CA0023.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::14)
 by DB3PR08MB8793.eurprd08.prod.outlook.com (2603:10a6:10:429::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Thu, 27 Mar
 2025 08:46:46 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::45) by AS4P195CA0023.outlook.office365.com
 (2603:10a6:20b:5d6::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 08:46:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 08:46:45 +0000
Received: ("Tessian outbound eb3c789b7dfa:v604");
 Thu, 27 Mar 2025 08:46:45 +0000
Received: from Ldcce8aa5b17c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D83DB1D-2E6C-4FA0-A87C-8FFD16B6150F.1; 
 Thu, 27 Mar 2025 08:46:39 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ldcce8aa5b17c.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 27 Mar 2025 08:46:38 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS4PR08MB7478.eurprd08.prod.outlook.com (2603:10a6:20b:4e5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:46:32 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:46:32 +0000
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
X-Inumbo-ID: 052bf424-0ae8-11f0-9ffa-bf95429c2676
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=PaAzVZroQehIN9/fWwYlfZhNATlJOs3mKDJelQ9MJIsDKuOMmEt74lJZDcEM6jpnyd2/0Xkv6DjBEN6LjyPbkNZYaTCF9djVUr+jV9K/suGUSPZg7PxJK0pRrnM9fFht/sopEguY/Vf94HBip1Ac75XfSrgVJk4axqiHynAgPet69YOZ6sOQ0+rmwR19kaQClGVR4I7xKcE/kmFYQxCOuYa82KJp9hP4ctrMAtjBmO39c+NlM7p6p06ZuTkJhQfD6TFAVY2Mo1bNKli9gSVmd0x9sImqbWzrOH+0NWVmt6Bm00yIoB0zjPGNn+5uob2HMMa2MirqE4s69MKXpYYetQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI1GXSp91ZqWwTxDJmq6owfxW+3ZqdNpan591mDbQUQ=;
 b=qzcIua4Gz1LmeHONQ9AJNXFsv8CaejI5wXE+QjCwwYjRR89htuMLu529dnXP/cJ6KtZLs/PsRyoTIcB/sMxtJy2D1xJEO4NFrnI73x7sLknVpgpGaXBOf3a6ePxa5oH1T5jfn946bnCTJyrSfhO8brY1ymOuVSA2hE+x/3GL22NpEiEwvwxqaMTNCfqJmLPS8pSzQBlUayci7+1gmwd9XL57cLTGR9I23iG/H7rc+QzPuaxlgM8S6RP/NRd3TCv6FR56VPnYco2/d6ESUR1hh0EKUfOwVS/MxGsOaiKRRCKNnLB3puRPmQ7gVA3JppzmbPAPcz6OllKUEBeGBl3gzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI1GXSp91ZqWwTxDJmq6owfxW+3ZqdNpan591mDbQUQ=;
 b=mC1ZOKvypnNqrKSz1iMS81mCYVCHB1lBkjgAw2qBR2uqqN0xiXy9zxIw0ZQqZEIry+K3ri7pq1wINuuQGSUFJHcHZHi27yreajKqaTNmRFKPn5dpIHlofy9KC0qWAj0lYNXhpHR3ayZqGnHjU5OVDW0fBFY4BbpBan8ft40VwLQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6459362899eb1778
X-TessianGatewayMetadata: bOyTF9vdHup3qHNrP2OynbPSi2OMq7MCpYbGVTRcwwwp9gRqjrJHmpJN8HmbxvvPBhd3AMecNraOfUnW7VGXcgBwQvA3WYIiyXvRVouovXmGpwHz2pMjlQJCi3LSv7VkzHlwGPVVu7WCy55ieXmin25HAPYT+uSlBW1BokVRiL4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QBxWuJ89q40f+OkzPTbr8piyQjn2Vr9VhMtAzhrCbXc7Dyvil/AqDwScDQMzn8E7E0N3Vanz+LZW9ZDQxTdSsAyGIuIOQn3XumVtF/D31p0FdpO/RdZzZa/LfNPe/YdPm7mgnO6G9DeTr4hFGL5nAAvRi7gjlfc0buFoT0G54qbOi5Qg/cvAURKAm/rH+c5Cl8QWCzAK6Mic0uVr+cTqDfR2TKuL+DAsJVYEWNr8jlYoh3wWPSsZwCoNvj76orGPLEVMgG1fCE039m8jMdjPw2GOCsT/zyOH7+5Q0ffGWPUjXowqaApJifXoRIgvb0kduSOnxkypgP8ZV3T/UMTSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI1GXSp91ZqWwTxDJmq6owfxW+3ZqdNpan591mDbQUQ=;
 b=c2htxv7hkYa4HufKFFWpWwCIHB4mhJ07OPxVjQ5J1HrBjiifd7JWGv5rD7GWLyZn+1w2PkzRu3/WQWdXuvvqiQfS2//4ERjFOLouFkAYTSwP8FN4RGoqDiZpkQXe/Jss5ZprtlzRsnBJR8WfY3Xzbs7ZqFM88DbuIfnos0VcwXjGk++XJlEapqaceeJkiKaglX5USFJze0ql/go+o9RyJjy2wnOctHXx7CWnHWojtYknKmZxtWhID+SOuLBvJjNMgihR4C0DTx1QasGRDguOz9xWxfRb/LpnF4JcfB1PbdPHIe2M1XwN9khtu7RbIj93f2utGxAZeCzUabgUoFk6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI1GXSp91ZqWwTxDJmq6owfxW+3ZqdNpan591mDbQUQ=;
 b=mC1ZOKvypnNqrKSz1iMS81mCYVCHB1lBkjgAw2qBR2uqqN0xiXy9zxIw0ZQqZEIry+K3ri7pq1wINuuQGSUFJHcHZHi27yreajKqaTNmRFKPn5dpIHlofy9KC0qWAj0lYNXhpHR3ayZqGnHjU5OVDW0fBFY4BbpBan8ft40VwLQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Anthony
 PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Luca
 Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v2] tools/arm: Fix nr_spis handling v2
Thread-Topic: [PATCH v2] tools/arm: Fix nr_spis handling v2
Thread-Index: AQHbnXUrXnaixHRQxUWMvvonoQrE9LOGroKA
Date: Thu, 27 Mar 2025 08:46:32 +0000
Message-ID: <6480C1E3-1AB1-4886-8639-27DB4BC98F61@arm.com>
References: <20250325110029.399838-1-michal.orzel@amd.com>
In-Reply-To: <20250325110029.399838-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS4PR08MB7478:EE_|AMS0EPF0000019F:EE_|DB3PR08MB8793:EE_
X-MS-Office365-Filtering-Correlation-Id: f151ea1c-cb4d-46af-d6f7-08dd6d0be7c0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?3iGgXcdLFewbcMaAUIYVUPGQUxOD7lFH+juwDKZYsgL8d+c9F5SbU4Rj0cfj?=
 =?us-ascii?Q?6e4nD4QqfYqDamJJNAguOWweIWr/QtGr4z2el6lppoGbU3Qg7itL3Uu+fgh0?=
 =?us-ascii?Q?SoOCH/1x/ERAoBfuRun04etZpOVDpsDvxLvrol13Z3aHRDHX4nyt0W0fqxr3?=
 =?us-ascii?Q?iQEGpKJLPDYBwkzaC4gBj/wt0F5COMBIxqe/LTaljsu29U3CxKe6ZOD4SGNU?=
 =?us-ascii?Q?VC9N5SpHcLk/Imos8rC7WpbcIPCPB4/pEQaCOOx0wNl/8S7VZmXb0mBUiaFa?=
 =?us-ascii?Q?ekv4dmFz0sUHz2mytPP61Q5ikbRtG4EzURiGJPze8qAEWfodG4OmUKeDIuzH?=
 =?us-ascii?Q?OC+rDDCJCUhrxOZdOzJPT11JHTAwgoA7dbXfZVYW6pCfKUanDh38jtxgLVUA?=
 =?us-ascii?Q?EhcXMaWUTIoHmn13FGZLXDJ3bS8kHx4o/gl3gx+O95smpGoxgutHStJTSU+J?=
 =?us-ascii?Q?BoKLuCDgfNWJpf9yQOxnTeHiEfrBxsyuPNriBPjctJ3jh5hXFxJQmi4L4w86?=
 =?us-ascii?Q?1hq4w4FQbiHKF6fNumyDtNh9mDmTbGwBaee/x2pIB3wA3fzXRmAJAXQK+epH?=
 =?us-ascii?Q?ITEUtiHxYmIOQqja0miwKDkvcs+MMuFzuP09cj9cAi2+yjxF8Gr5RjjOxaBP?=
 =?us-ascii?Q?h93llgArafhjSCOlxQL67YrfItEjcO+XqFIn8OmyFwnH6hJ3ExEHVR1/mGML?=
 =?us-ascii?Q?d5xapA7gacfuGLgbKabBn4ew2KG6o0UkeUx5t4DTaCgiC0hpJlIR9+b/MlDw?=
 =?us-ascii?Q?MjpdRjXV2udhLMdvt5KaGeshvvRSvRtocDJn4U4o8CB1B607eUhwdbEYlhvA?=
 =?us-ascii?Q?50P9KVu4B+10poxSUL5K6YdzFlPkmoPuGoHoQ5UNY3MrMjKGnQ13eNQrrySp?=
 =?us-ascii?Q?34r3l/TwdQO43So9KUHMtJUlVLeQlgqKMOaYnqhcqzjB6bi4aSyoK8jwPGdq?=
 =?us-ascii?Q?LiHbVD+AT4FDfkLkeSkZxX8rYJUPwNWv2sfhWKxRwJUcV0pzaX3pONOdG0yq?=
 =?us-ascii?Q?iWi22J0DN31aBkn3HeROW2KYYVxrkamj6wq6uOiJK728GJAPT3IAu7aAtm+O?=
 =?us-ascii?Q?3PGS5GiryzuA0hbaiABBUoOLIbY7TmlJYQleUoU41KP8c4j7R+1JXhiqkSqO?=
 =?us-ascii?Q?kHbXjyGik6uVQR6spFfP/hIiedWQ87EVnBLHbSisYH1Ql6kceIBiSTjqi9Ik?=
 =?us-ascii?Q?z78GG0Z1QnPHOoosM00tn4lauLSABnFJPMJbNjrJd2EcUNLYv9MOAazTn/JY?=
 =?us-ascii?Q?PXzldXbbRfUvu1LTEAzNpw5qN8lfkPyKZdHfEacNz3kTD84GbVIs/GsTYTvG?=
 =?us-ascii?Q?t94M1yDVZE3Zs6gdDsDKXo9Zcz/LL9wASf9gTZzdFJMIRIYPefc/wZd3uYnE?=
 =?us-ascii?Q?lKrRpmQ3J6n8ap/RXlAzP5E33a1gvNCST91Z1iIltTlIzoCQ6n1rfs4BLiXB?=
 =?us-ascii?Q?p731tzUbPX4+Kkdq5K74t8fYVsAgr2Cw?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <54BDB84D78E06C448EB8276FC208971F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7478
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	410e8d34-e2fc-4505-c3e4-08dd6d0bdfc3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|1800799024|82310400026|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i+lOc3SRuIT7IQBt6r+lAIgg8lhw1IucerllgNizpCGRIZrE1tsfp8ILZ2eX?=
 =?us-ascii?Q?ToYDsvsVkfp0G5BzLG06R35NLXpVBwRzqKEtGDagwgn41Yzg4FF1TAcRedoy?=
 =?us-ascii?Q?7bl0FMvfgRl0sPTeSEnO5ignTjBUOCQJTYiPzKg6QxTEhmDBLdyAse6auEyd?=
 =?us-ascii?Q?68dSrlC4Wr5Mp5GrHXUgfz1VkptMXTsHtGXcQd+O8S+WzrCcPOphooVQIJqK?=
 =?us-ascii?Q?owEaBvJGRSkY8BCAGAfkhmTXl9tdy29aRBAloqmqsCjLAcdcL/HzvZsrWGi+?=
 =?us-ascii?Q?FvN8sRHWhhJSAKYUFBttafxfBR+x+0u6wW7Y5qD7vkTdZYSstVo6olFvXbmT?=
 =?us-ascii?Q?p75VmuYofOb7w+Kc5xcDdMJMpDY40xhl+mlR8nmvqT4hFDVtB3O2VebHm0eN?=
 =?us-ascii?Q?UH5HVAvtGm8j6EpopY14GoqVPHlXDGY/sXIo/dWAxGhhEs52IWcu9+B7ksRT?=
 =?us-ascii?Q?hp8EY6WjjoeU6Qs0HsIcGp2E5Q6ZYZAbjI6g5cN9lkfQwrcPtRIksLPdmRs9?=
 =?us-ascii?Q?Pw60pb8HgODfefhNaWUi1eBbyQlUMb1hmu8JRPdrtRMy4jsgFUWgO2DTf1Nx?=
 =?us-ascii?Q?/1YITy6gT/eLX9yij1CpWzzI83fg6lVZAnquRgemuTsGc/fvMXx5tEBpo2YC?=
 =?us-ascii?Q?rICvFM1gG8aneVxrP8PgXs4jCqDcdJhT8nuvwa+fws3ErxceZMooGmsL3eyT?=
 =?us-ascii?Q?eGWY46A+sGPznISydgjNvSpz7c7ks4xnDNWQMSnbmcRuJFxLORiaz+lndYMs?=
 =?us-ascii?Q?qu6qZ7R/ie+chdLu/esv0Fl/rpu7NFOoM9iIh0AHBrpDLjl53viBypn+xmvv?=
 =?us-ascii?Q?IsqRLiKGUzpQMlHUeSOxw6JODn0g+LLm7ryr0R6zlcgBOFm82WgyYZ+SqpVU?=
 =?us-ascii?Q?lzvDqzaZINw6IlWoVu8RCxMSN6GL2cOW9jsHcpiX1xLsyhkUwDIQSrRWZMUg?=
 =?us-ascii?Q?B7xwEYX0n0iD9+68d7fzZttqf/PNOp+4vAzDNMQSuXw7ZvUEz+jgkdZays61?=
 =?us-ascii?Q?nitlvnfehO61pRTadfLFpY8pLDyr+qJfQfzQscZVzJ0lBsjYEoR2MFNjvz8X?=
 =?us-ascii?Q?cTAjIA4ZXGOUtFyNIRdZ09hM4ouZiO/kA1D2rWdSqTEdHi8UckYJGQnLODE5?=
 =?us-ascii?Q?cuo2MuAITGhw8ugDEifgY5gE5/tdC3I2eAf/isQ+BDEH4WIUcxzr6yriIQKy?=
 =?us-ascii?Q?oW71bORmJUY1SkX+RdwGaBRjdDi3gtMoFasJnlPoiIwpbq6ynAg9dRjRGGfA?=
 =?us-ascii?Q?GTvSjRTLeOlncsvIXwHcz5fE7U9CKKJJsNMUERNu8IkaIvcl8aO2IgPlcfSJ?=
 =?us-ascii?Q?skG/e6tWWxCE6rFbEVfvc9WqAdHqMMXMRUx69auBh+9H62B9UWBq/D3o2FJf?=
 =?us-ascii?Q?Gw23Q96P3zUx6fQz3bOG6fgxt8soacbCRhkWsPU01YoafbtjGvrSPur4yuKy?=
 =?us-ascii?Q?/S9G5gcwZNhBAAf0FzGM9Ppo+zyCEwqG+zpUTHd6GK34N+VAd6thq+nSajgy?=
 =?us-ascii?Q?x/NhrZkQ1qBJAec=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(82310400026)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:46:45.5939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f151ea1c-cb4d-46af-d6f7-08dd6d0be7c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8793

Hi Michal,

> On 25 Mar 2025, at 12:00, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> We are missing a way to detect whether a user provided a value for
> nr_spis equal to 0 or did not provide any value (default is also 0) which
> can cause issues when calculated nr_spis is > 0 and the value from domain
> config is 0. Fix it by setting default value for nr_spis to newly added
> LIBXL_NR_SPIS_DEFAULT i.e. UINT32_MAX (max supported nr of SPIs is 960
> anyway).
>=20
> Fixes: 55d62b8d4636 ("tools/arm: Reject configuration with incorrect nr_s=
pis value")
> Reported-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Sounds good to me, so for Arm side of things:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v2:
> - add LIBXL_NR_SPIS_DEFAULT, rearrange checks
> ---
> tools/include/libxl.h            |  1 +
> tools/libs/light/libxl_arm.c     | 17 +++++++++++------
> tools/libs/light/libxl_types.idl |  2 +-
> 3 files changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index f8fe4afd7dca..b7ad7735ca4c 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -1579,6 +1579,7 @@ bool libxl_defbool_val(libxl_defbool db);
>=20
> const char *libxl_defbool_to_string(libxl_defbool b);
>=20
> +#define LIBXL_NR_SPIS_DEFAULT (~(uint32_t)0)
> #define LIBXL_TIMER_MODE_DEFAULT -1
> #define LIBXL_MEMKB_DEFAULT ~0ULL
>=20
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 2d895408cac3..0adcaa373b54 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -84,7 +84,7 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>                                       libxl_domain_config *d_config,
>                                       struct xen_domctl_createdomain *con=
fig)
> {
> -    uint32_t nr_spis =3D 0;
> +    uint32_t nr_spis =3D 0, cfg_nr_spis =3D d_config->b_info.arch_arm.nr=
_spis;
>     unsigned int i;
>     uint32_t vuart_irq, virtio_irq =3D 0;
>     bool vuart_enabled =3D false, virtio_enabled =3D false;
> @@ -181,13 +181,18 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc=
,
>=20
>     LOG(DEBUG, "Configure the domain");
>=20
> -    if (nr_spis > d_config->b_info.arch_arm.nr_spis) {
> -        LOG(ERROR, "Provided nr_spis value is too small (minimum require=
d %u)\n",
> -            nr_spis);
> -        return ERROR_FAIL;
> +    /* Check if a user provided a value or not */
> +    if (cfg_nr_spis !=3D LIBXL_NR_SPIS_DEFAULT) {
> +        if (nr_spis > cfg_nr_spis) {
> +            LOG(ERROR, "Provided nr_spis value is too small (minimum req=
uired %u)\n",
> +                nr_spis);
> +            return ERROR_FAIL;
> +        }
> +        config->arch.nr_spis =3D cfg_nr_spis;
>     }
> +    else
> +        config->arch.nr_spis =3D nr_spis;
>=20
> -    config->arch.nr_spis =3D max(nr_spis, d_config->b_info.arch_arm.nr_s=
pis);
>     LOG(DEBUG, " - Allocate %u SPIs", config->arch.nr_spis);
>=20
>     switch (d_config->b_info.arch_arm.gic_version) {
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index bd4b8721ff19..9bb296993199 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -723,7 +723,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                ("vuart", libxl_vuart_type),
>                                ("sve_vl", libxl_sve_type),
> -                               ("nr_spis", uint32),
> +                               ("nr_spis", uint32, {'init_val': 'LIBXL_N=
R_SPIS_DEFAULT'}),
>                               ])),
>     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                               ])),
> --=20
> 2.25.1
>=20


