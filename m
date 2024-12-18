Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB5F9F630A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:32:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860214.1272273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrLS-0007iH-UY; Wed, 18 Dec 2024 10:31:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860214.1272273; Wed, 18 Dec 2024 10:31:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNrLS-0007gE-RN; Wed, 18 Dec 2024 10:31:58 +0000
Received: by outflank-mailman (input) for mailman id 860214;
 Wed, 18 Dec 2024 10:31:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=auIu=TL=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1tNrLR-0007ZH-4g
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:31:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20621.outbound.protection.outlook.com
 [2a01:111:f403:2613::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4e3c1b16-bd2b-11ef-a0d6-8be0dac302b0;
 Wed, 18 Dec 2024 11:31:56 +0100 (CET)
Received: from AS4PR09CA0017.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::11)
 by PAWPR08MB11014.eurprd08.prod.outlook.com (2603:10a6:102:46c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Wed, 18 Dec
 2024 10:31:51 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::8d) by AS4PR09CA0017.outlook.office365.com
 (2603:10a6:20b:5d4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Wed,
 18 Dec 2024 10:31:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Wed, 18 Dec 2024 10:31:51 +0000
Received: ("Tessian outbound b519d6c64997:v528");
 Wed, 18 Dec 2024 10:31:50 +0000
Received: from Lde0024bb5d6e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BFA3AF59-3423-4220-808F-33BF3B81EC32.1; 
 Wed, 18 Dec 2024 10:31:44 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lde0024bb5d6e.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 18 Dec 2024 10:31:44 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA6PR08MB10596.eurprd08.prod.outlook.com (2603:10a6:102:3d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:31:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 10:31:41 +0000
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
X-Inumbo-ID: 4e3c1b16-bd2b-11ef-a0d6-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ObLEyuxRWhB1lkELL09SyeW1o4Gndfi/r+kGO9B2Un9VtOHmODY80o+1+b2cdCBTZHxOKMkEnBwghMP62oFP+RbWFkdUW612rNwEaA/Wd8uCW0k0+8Nmh8TmrHEQvrwyH2hFYIi58uvZFjbraZT54qnmLWd45j52+iBvX1iv/kGtIYHlhZm0Q+rWJ4i57AYVCpvImpQtY0P9ge4ND0+HdN04JGIiuzbDooYbFBWR4/MIukubzCl2YsUdBlVgLdeT+2HugxNf/LqZGv/6D9Snx5tgS3EspaFtnydwUqazzHWPxKp4cfkEAJfKVARZAHRN+ycfeEq35n4fCouKTodAhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9NO3Yll58klsWYsc7Yfogrf8i1iIfdmFWfjsnwcgCg=;
 b=nsMTTPqfmlAWSDC8PvKo+0tFVXq4d8YdR76MJpNzHv0HFgjqUrarzGVjdFhYvMEDcYcaAMwrwWw6AYpoZi0Cfrwg69KKzp1Lrtg1OXDIA688/2U/GsRMsSGI6Q5rvcjaB8tPEb7kPALeZqkgLdb5++Ip0ovJfTM3WZnlmoFG230zi1I8fQe3fvlr5GSYVQikzubod/+Ja1YQ59i7fUCoSo2L7z4luRz+5hdRKU+HDhrxECLLL0Aro10MsJwnivGz818A1tjNNr7WrLbemA0JhQu/fuYBEw2KQRMutB7b8fIb6rE/EWZpBH7rnIQwIHWM6BqA3vm5NYrla61xeJ1QuA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9NO3Yll58klsWYsc7Yfogrf8i1iIfdmFWfjsnwcgCg=;
 b=rJ8V2nSGrAi/+xiGZDdby+Z4pZmebvr6bz8RUsQPobScMG/LDuyOP8IWSHbTMq8knzem/lgecaOxAv5gO8Y+NYL32M14m7kjEvhVgk8bR3Vgsj4otYsXBltPqP7UpH5otDFUCDXyoJToy2JwhmKbiw+g/IxrFLWlYanS+CEY8mc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2692d6dc6b5fb320
X-TessianGatewayMetadata: 9ENoPp9Ixky5j6WeDY69lb0faonl3F2HGauVML5yFvhJqX1dB0V2nRpEduqWBhnaMljCjArQLaPRszUvxEL2LWSrOazvBdaTw2C+WLX98e6jJQadvOOvIM7B7mkuIgEIMVjByCJMQ8cHlTSzhWKcYzwxCv6SZbXrn/rIxlL6d98=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaIOTe/w9mzQfE8qenhu+YJcS40zxXiovZV323gTorZ380/GgA1MxST+y0Lrvd/1mTX+Fkx329DU13okUVaUrYEW+K77T/Bcpa1XSEMl95nRv0ciwaO13qom8acerzPpMT3tQ2ZPhcOA7Mpp3/AlJCgIDbVHnYXmisuKPUAB+33ZizP7e7aLhhhwBVaNXHGUw4vfvvxplndILoyz9BX88ZJmWCWgv9vyupMh2F0DbPuZAiy7VIeIQfyysgp2b2ml+XDQKUv24PVhHB2lNHBoeoaUniicCzER1Wx8fug2gbTPqx06rEROfSmgcF9uGcUrOj/7L5u7Lf/8PjpqglkibQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9NO3Yll58klsWYsc7Yfogrf8i1iIfdmFWfjsnwcgCg=;
 b=yuPEnQiWaR31yIwfja5zw3nNssjVRTcA9U9AeE/06TeyvMpxAa1+ycvMxKatuoiRaYkQvZ8aKD4Jn0CAsgduh7JSF3ktwZR88h8HtqnR/9jixlyKQYRF/nDPxkq/HnfogyJQvxOuu2VXv9zH4gVF9mVARdE6bJTUMYqZG3D0Kblj3jBIDUxblpzFpBXCI7Nhx4VsSxY3srdKt2LXBKHyizMNVnEG4WwXKbUGZlvKu2o9mblrxzyiHGvY5IDZdbFRZDqtN6ylCldHe7aLP81z+afZIwCl2SN24kBCf/fA0A5tT2yn/el+8PKMnHJuGCHTRs8ZZBFjrXIuc23Pv668TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9NO3Yll58klsWYsc7Yfogrf8i1iIfdmFWfjsnwcgCg=;
 b=rJ8V2nSGrAi/+xiGZDdby+Z4pZmebvr6bz8RUsQPobScMG/LDuyOP8IWSHbTMq8knzem/lgecaOxAv5gO8Y+NYL32M14m7kjEvhVgk8bR3Vgsj4otYsXBltPqP7UpH5otDFUCDXyoJToy2JwhmKbiw+g/IxrFLWlYanS+CEY8mc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"S32@nxp.com" <S32@nxp.com>, Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v3 6/6] MAINTAINERS: Add myself as maintainer for NXP
 S32G3
Thread-Topic: [PATCH v3 6/6] MAINTAINERS: Add myself as maintainer for NXP
 S32G3
Thread-Index: AQHbUTVvnKw37S+On0GrV1HlnzKNyLLrzZaA
Date: Wed, 18 Dec 2024 10:31:41 +0000
Message-ID: <B54A5591-EBAD-4CA6-BB2E-0DC7BE4987DE@arm.com>
References: <20241218101142.1552618-1-andrei.cherechesu@oss.nxp.com>
 <20241218101142.1552618-7-andrei.cherechesu@oss.nxp.com>
In-Reply-To: <20241218101142.1552618-7-andrei.cherechesu@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA6PR08MB10596:EE_|AMS0EPF000001B3:EE_|PAWPR08MB11014:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0e7ace-a3b6-437a-c49e-08dd1f4f2f4e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?nvY0RyPlHuDnUMJZXhjosy3qivNxBRwDqTM63h2YvCZ3yeBs2fDKDehXEb?=
 =?iso-8859-1?Q?f9/oesI2W3y4e9qeW4V+AAGTB8bW7dU8cYvOyBEPkflMXVww+WaoopTfUb?=
 =?iso-8859-1?Q?Lg0YrJXZn+/cbbijTffbX0HoWmxlKb0TE3hbrQKWO7IUf9FLX3NrW5iri3?=
 =?iso-8859-1?Q?A9SOFrUBMA8D/A22WjtctEBOO/3mod7nfAcY498ENe+YSREzRGoR5bC74I?=
 =?iso-8859-1?Q?tgEN3ruY0tdG07VzLhSxSHEeB36Q/sN4RMQUNcL4YCw0NJhCpz5IZnRabH?=
 =?iso-8859-1?Q?ML/6ymbFJN3n+clG5A9RHbp5Rl2ZWJKe8roYPaKqHOs1P3psHTJUZkuPlZ?=
 =?iso-8859-1?Q?upvFrwO+x0qmWChd5dC4T7oMSMdedsKJzVNNSy6ZviIaDoXRqSStlxUiL5?=
 =?iso-8859-1?Q?5ohQ5/ZtzhdIOCc9IkwL09JrsLzkow0nTFa3ZBQV8PmtQThcU0aB6mbvH6?=
 =?iso-8859-1?Q?N10zs3ATOBZJ1ODxgNv6xrFvs6VNzKadj8T94cfDMRGj/ZXtV0ir+z+yFm?=
 =?iso-8859-1?Q?sTr+xaXRvDytZ5U1ufEQ6Yx99K9Uw1UNJ84ag2iZ1hfDMWBU1+AJfsgmYa?=
 =?iso-8859-1?Q?qXZvmMVRsz7A2o4BeiRMp2zjPNV9C/gV/hq3jSNXUj88yLYw93drrjjTig?=
 =?iso-8859-1?Q?lUE5Xhq9OHh6xKIHZPYnR+yMrKfQ7lUxUKX8OgAmvli5Q1nhirf8uhPves?=
 =?iso-8859-1?Q?mrL6kZonF61qJvmDDwLwdSb8HaVCORlv7iGZ7OvXOweKmcEsNCAoqasjSy?=
 =?iso-8859-1?Q?QpVUGTOPmfy8TxRq5VEKV4YaHIY3hBAynjq/Jv33djkN32heMxOaUTzt9i?=
 =?iso-8859-1?Q?6Iz5lXNwCx2/TsGcOtn3ThhEuG260GeLpy4BHZun1Rp09nVmw0Kq5TUk9u?=
 =?iso-8859-1?Q?+eoWztSaY0qJg08ncws77v76Omd+VmitdgWIIwK33i2h4QxjW0iG3a7nux?=
 =?iso-8859-1?Q?Vhpsec14PDawC96bRT0qQztRMBi/fvZ5A33xvX9xpAVnGt6IdGCOkfUZJ6?=
 =?iso-8859-1?Q?I7xmM0BP5+iqALXg36sOCIf/OCh4S075EmbLfRblbJAHuEBSMKeqRentYF?=
 =?iso-8859-1?Q?K2rWRyx7ngBJQqIAuNkIdsPYXFhpt+8sEmyqeRRG2FAvNm5kB/N3ingKsz?=
 =?iso-8859-1?Q?GhD5PrPPS6trq5WFegAStbAFAVC+hJbwyN8CzQvsk2UZCOFS6lKj9NByyq?=
 =?iso-8859-1?Q?ZAH+t5QcsMyAVmy9ZAqHSp9LWheTDbFOpfny1T2+I4lVFIaE3Jj4aCKA+d?=
 =?iso-8859-1?Q?/CdGjsrV6SLg7rVDeX3T1AuLXoWxSt4UcCkRsSIixcgZxuKHKld1fSz3nK?=
 =?iso-8859-1?Q?mS5yXzeWwfZzQMm3ZGa63n/fhPbw81T26vTRHjTZ6YcCgYgS1ZabwpAZ5v?=
 =?iso-8859-1?Q?rETBWb9+Nb9raEyPkYH1Ko7bfcJ1R8giBcpSm3KGy+ndFB2p3jLZBtU4O/?=
 =?iso-8859-1?Q?iKEfPm4t5CDLAHgg?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <66E23108C7B297438C3E8423BD212314@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10596
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ae7c98e1-a03d-44ed-a896-08dd1f4f29a0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?ysQ/ZzfE5Ljpc7OSAs523ehnNsgY8pcOTX8NMptUJLxa4PVL8zSTkWo0mV?=
 =?iso-8859-1?Q?GoXrGRkaZZkqInRM/daeBrFvDQxufur4om/C9xNgMnRePAlzYKtHLRFbbd?=
 =?iso-8859-1?Q?DwEDovZZr06Mch5au3X68aPM+dty2xFyw5PkwZDWN2Kxixv79dQomy6kVm?=
 =?iso-8859-1?Q?jqEZoXzq77T1qDjEs1Qvk5PddsgRv6fprJFDFIXz888YoeGEWDKlOgusau?=
 =?iso-8859-1?Q?FCi4NMDfaCkP9ImXfWoniSXCBNZnmAoBcRnC/UsXvOX1JHVTnAGGlj0kt5?=
 =?iso-8859-1?Q?7ji8obJlS4y918qQLw9Gs7wLKgkw/zZHDxG7G0tdk8mD5spCTXlSylBY2t?=
 =?iso-8859-1?Q?KpfhIOzaqiFlcpzEL5bpR5+YT1y/Wsv/uxfhSowmcl9ogJ4bvRML+kO91R?=
 =?iso-8859-1?Q?ekSEGaxSS0JqHL+5WyYznoaHVnpmC+6oTSdMCsBI40aaOZ5dKu9+4I9TFi?=
 =?iso-8859-1?Q?oQKG+bIvEnJHfal/jR+y3s/uV8LsVbKpf3UdU06C1u/gpcsDYQ64hxzhuP?=
 =?iso-8859-1?Q?fvwBdS581k35aDxNP4cTqCiSyzQQZ2730qmBpUv4g2swE+CcYp2Wq6ZWaB?=
 =?iso-8859-1?Q?oiaAyJUmV1THRjsPL/KvXCNvTXfU866x01QeZ1l8P1sWkN3HhgEPl0q/4Y?=
 =?iso-8859-1?Q?ECGMwZRHFfSxCrZesWsIaeg+ZxvQjbDebXhSLwxtsuOxa5eXU4EUaDGpQ2?=
 =?iso-8859-1?Q?I9h+NE0+iuO10hYKQQTVmORCqYknJIlv118sDYnhgPT4nBQ21oXJkxdwyr?=
 =?iso-8859-1?Q?TV4j+oAEpuJ3DlKenIIzgi7qs5UbqRbK+9Aa8KgR1pBkDMhuRRV91VcwET?=
 =?iso-8859-1?Q?qlZqUmtsiUEH3ITE1b4nUqkyAWRxJzndnFjJwI859rH5BHNT3bQzNl/AsH?=
 =?iso-8859-1?Q?zsOpiz8dsBwpjtk+lXR++fbdvI5Hdcnjc5oOEB12jY4Lr1PKwkfM4e3Cgn?=
 =?iso-8859-1?Q?wXxObbNiel0IOq9fzRN9NlNOGwW5ANZCOu59Fe0nCnK9GisikrB3aAbI9W?=
 =?iso-8859-1?Q?0zAdpcX3tHQcmBH0AP+ERuJ4yV5ftdVOHC3TPnRGH8TWFhcrPQIWY1chRN?=
 =?iso-8859-1?Q?i/zKLVH4msWx9J+jR5WNeQL0zgkvAAg8A5T6y6NBzljuRcdpYfSEWMQcak?=
 =?iso-8859-1?Q?ELXZVy0rZ3g+tlrqduCJ/TTwgl9PeLRbfd1b1SG9Y8u3uJ6Mfo6KijSysO?=
 =?iso-8859-1?Q?ZP13ugA/V+DDKavOIWnVVLtrJMSXnQOhPFRYIwjGKwkOt/7sfCKPUN0DGz?=
 =?iso-8859-1?Q?PpUOWTvBDowrMgpc3z7bAyo+4Cmd+9sR51SMqVNerptdCuufMhIaBVgJ7X?=
 =?iso-8859-1?Q?UM24Vp8Fs+nCKVnXDjKyYTWka8oT6JqwQPM7ohv2npB7GgDuEaJmuu/J8u?=
 =?iso-8859-1?Q?hzID7RrdH+aWHZZqiinrfIbU2C73oWRjLdDYrPlUjVa6m/nEofAFoph85d?=
 =?iso-8859-1?Q?rQHHbASPvVzyyRLbo6v+Fsbi2C9Xfs1jA4wqVxRLhN51oeU4OQOCsZA/bx?=
 =?iso-8859-1?Q?HWAbIZ2RoIY5og2dqdcX7c?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 10:31:51.2422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0e7ace-a3b6-437a-c49e-08dd1f4f2f4e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11014

Hi Andrei,

> On 18 Dec 2024, at 11:11, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.=
nxp.com> wrote:
>=20
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>=20
> Add myself as maintainer for NXP S32G3 SoCs Family,
> and the S32 Linux Team as relevant reviewers list.
>=20
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> MAINTAINERS | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34ad49bc39..392f780f76 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -426,6 +426,12 @@ L: minios-devel@lists.xenproject.org
> T: git https://xenbits.xenproject.org/git-http/mini-os.git
> F: config/MiniOS.mk
>=20
> +NXP S32G3 PROCESSORS FAMILY SUPPORT
> +M: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
> +L: NXP S32 Linux Team <s32@nxp.com>
> +F: xen/arch/arm/include/asm/linflex-uart.h
> +F: xen/drivers/char/linflex-uart.c
> +
> OCAML TOOLS
> M: Christian Lindig <christian.lindig@citrix.com>
> M: David Scott <dave@recoil.org>
> --=20
> 2.45.2
>=20
>=20


