Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BF9A397F7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 11:02:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891237.1300300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKQQ-0007Bz-VW; Tue, 18 Feb 2025 10:01:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891237.1300300; Tue, 18 Feb 2025 10:01:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkKQQ-0007A5-Sn; Tue, 18 Feb 2025 10:01:58 +0000
Received: by outflank-mailman (input) for mailman id 891237;
 Tue, 18 Feb 2025 10:01:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0q2U=VJ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tkKQP-00079z-Cr
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 10:01:57 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062a.outbound.protection.outlook.com
 [2a01:111:f403:260e::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61ce4b41-eddf-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 11:01:55 +0100 (CET)
Received: from AM0PR04CA0113.eurprd04.prod.outlook.com (2603:10a6:208:55::18)
 by AS2PR08MB8832.eurprd08.prod.outlook.com (2603:10a6:20b:5e6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 10:01:50 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:208:55:cafe::86) by AM0PR04CA0113.outlook.office365.com
 (2603:10a6:208:55::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.19 via Frontend Transport; Tue,
 18 Feb 2025 10:01:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Tue, 18 Feb 2025 10:01:50 +0000
Received: ("Tessian outbound 4fd325905615:v567");
 Tue, 18 Feb 2025 10:01:49 +0000
Received: from Ld138296394df.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EAA4A2B4-A394-4D23-B2CA-7B02A9E612E1.1; 
 Tue, 18 Feb 2025 10:01:43 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld138296394df.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 18 Feb 2025 10:01:43 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB5927.eurprd08.prod.outlook.com (2603:10a6:20b:292::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.21; Tue, 18 Feb
 2025 10:01:41 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 10:01:41 +0000
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
X-Inumbo-ID: 61ce4b41-eddf-11ef-9896-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vyKkF4M5LzBtkH3Sb4JhfZZ7r8k9Gzp+sO4pyXr9Bx4+6+/e3iv7rK20oMYT+/QIw0MRxVKC06kVVfN/93aENlAy9/o0vbNrviW4+TfyyLNmanvtzZpzm4bQrRyb/13tvAN4bjI3aOE92QlbD/D+rpjKuyNQ2GUCItQ6p7RUpOBU39AkSfWZrllNYbRlxAfb7kzLrwuWN7ScgAopXQqzyvAgTvmKKcHcWjkor5jFhtsB+4TqQ9tBZf7XxqZgxj8Ioydqa9lFnq3uezCFA66WG391bxrJ8aN8hhJE06B6G18xvjuo6jf/bJ2yKve8F/CyGkL9kmyvWl6YzMCyj6gDvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAXacDt/hoZkM8ckMVRfRHUSk1RK0+c5OtFG/U4VQaM=;
 b=GqC7fyWmYM2YR09Tdg0cqCHsSbN9HWxl4LM9VlNGWrimejqiYKPdIBS4m3Kuu7kAsQu+rwQL3xvQof+DQz0hIeTNl1YazsOZt88gSCPdldI+KLnFT6+nB7HYI7NfdStn6PYDwyfu38D9zgw78iqZ/9eEryJyl8sSIJ8M7gJf3iCHTKHvusXovE+pISHWvW7RtxH+yNo403e8fQG+FbHy2fuPSCFlJKccCLcmPzOXUZ3UL/Q60WP9Wmkyvrw5xEKYe3L4Tl14NsTUGFbXVjc1uDanysdQ/45eWf8Cy9/iMCdGuTlMuZK9K9/Wz9kLOHsILL95kmn49GVVky/peJ8lXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAXacDt/hoZkM8ckMVRfRHUSk1RK0+c5OtFG/U4VQaM=;
 b=J0jGHGH55j3HC028TNaFFWJbVLZGL5qFhRA0MStGFUsXLsBY+B+aweQUkb9PqBWf+Dmy55R9wjcUloCK6D2JwYdJUy2+YRe6TtUynTLDcQiASSdEOTAqEangp+FD4kXGvF0P8of8UYwSYuI0lHTv47ddrab2oyJRQUbL4joQidM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7aa85b3e4b5f7350
X-TessianGatewayMetadata: Wf4HP54oG+D35gIeoBxsl0rQrpWAHCZdPMhv6HJLYjW03k1v5qlOEmWvyBxUEZkRdPhSChMhRkH2JEZwO47E08jg+sk39fd6s0EeTn3+Up5QSuWutckNCB8OkpNd7zw+5XRQPXx9qiNhn1VuIuCD3pm0v9gdShOQA5CM4u2MM+4=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qe6ocFSCajHNMD2ed7VgXTwyEEvk/us9Px/PG0/gWeXksYbHqffxsblWQuG6VJDV6helBJe3LqgW9sSq97/sSjAjI77XZxNHwo2PbIthtAO+6FgdJeLKW10GQWOe4t5hqP5TsJSlIbI5CRq1EdWVKYSO72HQ5Z8NzCZrnvf9ysZXoeBZf4uk6sVn7Q5lPBnSb0KBj16Xf1K7FvaPWHQryit52fsWBF/HFn4nOe1rN/xRkE3VAgLodxVB1HjPWeA9d7+k0HvBki2Mdh0HShoFjno3Ceu7rWfG3DZwRGr2idya+Oo7HbrXvsU6H+17jr7iNt3ZLXwUKowydnyGN5M/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAXacDt/hoZkM8ckMVRfRHUSk1RK0+c5OtFG/U4VQaM=;
 b=w0sIx/Ut0hH1zyhen692V1Sx9aW8Frl5aNxZRh7aKKcuQqE16Zj0qI+l005Bz2vXFfzcIQ9qhWteaUb+h4QNkepvzP9BGwtLHQ0U2XK/KnT8YB2i+l4ZxZFMBss0YT3LwLjWdweEKewGkX8A1CJoWISst3RHcMuNdx0faG7NzfLasKl3gyWAiHDFiK/U7xgALpU1+lyEB/pT9MbVkzT+qm3iFHCbDGZoUmc5q8buJCKsMbwaAAIVyA+LN4Jk6sEQ83KFm6UYn4xD1DtHIuC7eUT0HhhyvM5f58qP9pgVxavlBz0/UUCi5ggTuDzVLkSYk2eIfIFYEw8yRmAYH1VwoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fAXacDt/hoZkM8ckMVRfRHUSk1RK0+c5OtFG/U4VQaM=;
 b=J0jGHGH55j3HC028TNaFFWJbVLZGL5qFhRA0MStGFUsXLsBY+B+aweQUkb9PqBWf+Dmy55R9wjcUloCK6D2JwYdJUy2+YRe6TtUynTLDcQiASSdEOTAqEangp+FD4kXGvF0P8of8UYwSYuI0lHTv47ddrab2oyJRQUbL4joQidM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "Artem_Mygaiev@epam.com"
	<Artem_Mygaiev@epam.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
	"roger.pau@citrix.com" <roger.pau@citrix.com>,
	"marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
	"anthony.perard@vates.tech" <anthony.perard@vates.tech>
Subject: Re: [PATCH 0/2] code style exercise: Drivers folder samples
Thread-Topic: [PATCH 0/2] code style exercise: Drivers folder samples
Thread-Index: AQHbgFyDw7d7PRHkQkOfzy3SKqeQMbNM11gA
Date: Tue, 18 Feb 2025 10:01:41 +0000
Message-ID: <7D6AA8B5-35F5-4C2C-92F3-CCBA624E5231@arm.com>
References: <20250216102108.2665222-1-andr2000@gmail.com>
In-Reply-To: <20250216102108.2665222-1-andr2000@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB5927:EE_|AM3PEPF0000A795:EE_|AS2PR08MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c50cee-81bb-46f9-7479-08dd50034371
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?pMB2Va2en0TE0Rt+UVwKPv2CDdcjd5HFK7B4YYZY6BQPBM/6kpLvsBH6q8Gn?=
 =?us-ascii?Q?F4dxBdqVaKza7sHns+wxFLmG9kFV7oJ6udFW/YXGEUYH8NNUVfBndSCjvW3m?=
 =?us-ascii?Q?oDRS0FCpZwC5h3SYi94fOYgmFfySJcRLsL5bloFeUoQFxWh7x4uupYSqLxGM?=
 =?us-ascii?Q?O5rowCfyuWPjATvBLPk8zJMjjygNQBKE/AJQG7WPaySecmlKLBHZIqdy9Py5?=
 =?us-ascii?Q?FMlN3siQVxdftme8nsivwK9FlEqwqUULRFp6APDjJIw3iVU3DcZonSoE58XD?=
 =?us-ascii?Q?gnOkG5ki6N03yZV2PqrhXkRm7bDqA+XXCqxWJypQntHzB64slaUphHyXkRRq?=
 =?us-ascii?Q?rFijJCHbG+dD05xTGG4cxWDA7Oe+Foe81L3vJgB5/+Ua5ELZzND3tS6Rmvub?=
 =?us-ascii?Q?yc8cFBNg8M8FqCWBXgE5iURal9/AhLv+Sn7IlccIMLgu9qBAYO9A5zgNLh0P?=
 =?us-ascii?Q?KPQ19t/fljcalqGnAnrbQlytqUC2RzuWHQDSx68yoWxvA6YYfcyZ7ZgclFRg?=
 =?us-ascii?Q?FrYukEcV5C/lvEWb8KKMqoh0zPnmWCyIHQqsCPvTnaSiBbNc3O2Wru90Dkqy?=
 =?us-ascii?Q?PEm4yDAhC2EaaC4RqJSwhBIpj1D2UhXRo7olRapCrGr62VFbGNFTtGCci1Jj?=
 =?us-ascii?Q?t6N0+9p8oKLu+ex0bkS7Q3ROdZfUDW83+ZFX2FDLiyFaDSoooTRF8Huj6Q7c?=
 =?us-ascii?Q?QMiZt0sbBrAB+ao+s2nE0rn1MgWVscVLjXBZeg1sfSvQcy6yF2r90oZmadTY?=
 =?us-ascii?Q?xo5JQ0uNvy7IDNW0CIMkW3jEzEqOlwZp3tqdq+GFBreJJMiM9t1SAulUAp63?=
 =?us-ascii?Q?3eOU2HiszGDRzy5myvCtnHTE+MNaRUMBy2Sy8O6T8Oi6C8K4S1nCLtz3Mcrq?=
 =?us-ascii?Q?5Ng5A4eAvZ158I512MK7OHBNN4MNb76DbKsQ9OR/nIfpcuThp9BqqIJuJRwP?=
 =?us-ascii?Q?Xx/hPUMycjYHb+FbnHwX8Sh4mfD/NlEPGmU5OsSAQqYAKHY3TopqAjH5me0z?=
 =?us-ascii?Q?YqqpyJFGQIu/Mg+yojJOUna3GIpmJISteKgLWnoHzGwbiznMDzvZ3BT27GZx?=
 =?us-ascii?Q?ol2sBEKaKZmwI7j/nVpi4LAFrg2A+ZLL3q47c3KgdIKvi1IfimS66akyrnHi?=
 =?us-ascii?Q?ysBKqrlNMaRJYvHfnXV7pD6pDt9DDIYz8Sk5fjPU2iEeU0RHVVt2FbALOVed?=
 =?us-ascii?Q?Mc4RFP5976gmX8aQ6knG1CIFVvkWE9aT2vphFCriTGue4aLrugrvyTwMnPdQ?=
 =?us-ascii?Q?oh35P6gCnVEYcShNAVDki80Qd629hAt/nS2cdF90TUA0zaxLXtxi9YoI3Iff?=
 =?us-ascii?Q?tK/cAIdEGrutUPxKyLGZ1maGa2vReY1MngfSDQ/pWgbjdLVuPqlkIfpauLOo?=
 =?us-ascii?Q?IILtHMQsgUgeFhtxWmZIo6tG3VHZBkZgmceylWZ81tJ7zYy9YFSZnIlFc4cz?=
 =?us-ascii?Q?jmxQ4mzOgU6jjZ/okMMegO38YUpTJtM2?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1D292AEC6F21EC4696E8578EDB4B2C2F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5927
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9eef83db-eadb-489d-c39d-08dd50033e0e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|376014|82310400026|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lh5f7rxsinh72s4GMAe6xnqNAF0o6hJaxg3AtXYllTjXb+qrtnsYfKO1JtTp?=
 =?us-ascii?Q?vt8AyH7oQcWlfuOrbFg6f4hJBaYEBYmc8OQXic+Fu1CG9j5z9VVOPsWhgfS8?=
 =?us-ascii?Q?AQvQpAJuy3pFvGDhQt9hqIIKehqmXNXkWblO160CUnQmIQXRRnJw7FoII7Ul?=
 =?us-ascii?Q?wjdBGXRSq9BbAATOGC2wcpkOQWLDN3EtypWuH9rrJ3T1DqQl1DjrZNg8aGOO?=
 =?us-ascii?Q?V+DNs3IJFpThLURkJcamCPIq1ei6pPjpA1NFzogAqUtVOwC0edREksoJMt7F?=
 =?us-ascii?Q?ZSTLa6fsug9Kdxszpd6VJ6cTyePyCdHTDmEPGlX4jyVctx0NdFMjclReehWW?=
 =?us-ascii?Q?73phkgw7FeBHBg48bYOcwGlXMrEZz6KCWyUKaYTO0Y7tsb0+BVJfShYxV/g6?=
 =?us-ascii?Q?enFxssm3KKJRe9y+5dTN/AkRq5EpbRUPQsVP2KimWb8iP1ZaPxs6xz45ONVl?=
 =?us-ascii?Q?vlh90dIu9JnY2o60J/5iK8Gizb7YRgIrignyUlVAZC982+/QkkDRvbQ/2jQ4?=
 =?us-ascii?Q?ARY6mQAu9MQdgkbQpNDDTxDcj9zyFX5BmosWwYaJ/nRw/5x8jkK+NF4070lk?=
 =?us-ascii?Q?ZixY0t2BpVye9h4LffNBp+pRcHALdnVgrijEhpu3eAnYgnF0/qSFOhy4Rhk4?=
 =?us-ascii?Q?gTq8naUoG5Yy6HKwxb4EtBm3e6GUVhHc3n5IdjqqnBlWzUVcP6q3OweY9XTw?=
 =?us-ascii?Q?RtzRhNBzeRxXYD7k1hvwaLUFMFgRTk7lzEqbIIgOON1uG9r5UVz/fMgJXuvC?=
 =?us-ascii?Q?2o0XwwP9yPgfwvGyiG6LjxTlRVp6Aqd2nlsPEFYHKHxVyIrTiChsNyLrPAwI?=
 =?us-ascii?Q?FqmF6ZFauy7uHJeQiTrdjz4U4Kn5bisLUJfs+QK5maYy6TJ6QZT6ty0xsfY3?=
 =?us-ascii?Q?WNlS3YLaS6orKTDUgJjQwbHJy1+V4f9Bw3tzggtz5fCxWLKYcQXCN8SfVqx2?=
 =?us-ascii?Q?d+elIpvMqwQ/T9J6a8aYOitVvTe7dhE1hEtN/mMLMtZnPJTs6bmRZ+0GbW+U?=
 =?us-ascii?Q?0lrgYp1FLSYmjyw/NvlrPxFrIirE5xsoYZC2JQyTmQyEgY2IKWhOat6cxQOm?=
 =?us-ascii?Q?Ptgg6nLu9X5dR3kSalMcIu3YH4D6o9pjaUrKVmmIQ6UDNIxgQZ431+LCpsGR?=
 =?us-ascii?Q?J3Nfu2Gd2GOiveJj6Ii1wph81Smm2iG1BF3A2nEdwdnR4Za6vOgnNMZdQ0YX?=
 =?us-ascii?Q?AilhoX9UrpuEPvs06oDAJsV1gWuDi65Zp9eEEsboPccZXTcGQ/PxRAt1ivxc?=
 =?us-ascii?Q?tF0/tdHyCWgMjTkKKAz9EBM+8vOznaX+3gMVbYxRPDQVPjxsaZLJqC+N+YwE?=
 =?us-ascii?Q?8eWr63xpFAesrt5Iit8TuL22/5hTp4O58Yofmvr/026wWe5AzZYgONc3l7r2?=
 =?us-ascii?Q?JQQbVCJO8kRZIct/dX2R0ckjqopdRgABunK/bx5cGp3L1vr5Gr1Ka4zqxSCM?=
 =?us-ascii?Q?eQqwsBrlvEgRhQ9SO/X5Rmfs1YYkPwG+3XsfSiVQFCau6nDBLipF6w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(376014)(82310400026)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 10:01:50.0455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c50cee-81bb-46f9-7479-08dd50034371
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8832

Hi Oleksandr,

>=20
> 2. Long strings in ptintk violations
> I filed an issue on printk format strings [5]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> @@ -225,9 +231,9 @@ void __init acpi_table_print_madt_entry(struct acpi_s=
ubtable_header *header)
>         printk(KERN_DEBUG PREFIX
> -       "GIC Distributor (gic_id[0x%04x] address[0x%"PRIx64"] gsi_base[%d=
])\n",
> -       p->gic_id, p->base_address,
> -       p->global_irq_base);
> +               "GIC Distributor (gic_id[0x%04x] address[0x%" PRIx64
> +               "] gsi_base[%d])\n",
> +               p->gic_id, p->base_address, p->global_irq_base);
>=20
> @@ -629,12 +628,14 @@ acpi_parse_one_rmrr(struct acpi_dmar_header *header=
)
> -           printk(XENLOG_ERR VTDPREFIX
> -                  "Overlapping RMRRs [%"PRIx64",%"PRIx64"] and [%"PRIx64=
",%"PRIx64"]\n",
> -                  rmrru->base_address, rmrru->end_address,
> -                  base_addr, end_addr);
> +            printk(XENLOG_ERR VTDPREFIX "Overlapping RMRRs [%" PRIx64
> +                                        ",%" PRIx64 "] and [%" PRIx64
> +                                        ",%" PRIx64 "]\n",
> +                   rmrru->base_address, rmrru->end_address, base_addr,
> +                   end_addr);

These kind of issues with line break could be adjusted using the right pena=
lty coefficients in the
clang format config.

>=20
> 7. Parentheses for empty functions
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -1311,7 +1307,9 @@ void panic(const char *fmt, ...)
> -static void cf_check suspend_steal_fn(const char *str, size_t nr) { }
> +static void cf_check suspend_steal_fn(const char *str, size_t nr)
> +{}

I think also this can be mitigated with penalty + a rule saying that empty =
function can have the brackets
on the same line.

Cheers,
Luca



