Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C6C8D6446
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 16:17:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733739.1140070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD34d-0005ii-OT; Fri, 31 May 2024 14:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733739.1140070; Fri, 31 May 2024 14:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD34d-0005fm-K9; Fri, 31 May 2024 14:17:39 +0000
Received: by outflank-mailman (input) for mailman id 733739;
 Fri, 31 May 2024 14:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tx2a=NC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sD34c-0005Ad-F3
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 14:17:38 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88515dd7-1f58-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 16:17:38 +0200 (CEST)
Received: from DU6P191CA0047.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::12)
 by AS2PR08MB9023.eurprd08.prod.outlook.com (2603:10a6:20b:5ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 31 May
 2024 14:17:29 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::de) by DU6P191CA0047.outlook.office365.com
 (2603:10a6:10:53f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23 via Frontend
 Transport; Fri, 31 May 2024 14:17:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15 via
 Frontend Transport; Fri, 31 May 2024 14:17:28 +0000
Received: ("Tessian outbound 7e38650a3f1f:v327");
 Fri, 31 May 2024 14:17:28 +0000
Received: from dc7523588bca.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 51C0A907-C550-4B67-B67A-4C3D4AD7D21D.1; 
 Fri, 31 May 2024 14:17:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dc7523588bca.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 May 2024 14:17:21 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9749.eurprd08.prod.outlook.com (2603:10a6:10:447::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 14:17:20 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7611.030; Fri, 31 May 2024
 14:17:20 +0000
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
X-Inumbo-ID: 88515dd7-1f58-11ef-90a1-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GNJZbCGIgDIGDdAj6CqWZRAyhG8ggKWFC0d1tCidm/orur47Ut2C8FYusq5KtUiX14/MIwRx4SV71fKZTPAYMC/o8jo0OKdIt9Fmu9Pf/phVCh+ZDchSYZrl2PiDdVNn6KFVHXyL4BBmN2Il/5400RHXBmNsk9cPDMej0l0fwKND5JN0m2rTr/wtGVo1fedTmwD2mab/pmUm45fWdG74/0CT7S9COwuWxQcbM8aHh4Ybb9k94wEwqz2EXDZ04cRXAJ0vzrm4boQz0w4L37YhZ/OBv64kzaPhOBamYZt5g6a2Q0Uc+G2nYUs+1v/oq6W2KEYQ0YDrh6evtxAC0BcYUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dITFB1iRQXWXAw/4BmCnEF2oLlLW8hTxmBdl72Izwns=;
 b=FdqhbyWSl0BKnV+nB/87IWkgOEnV2hVGsBrd37ELqCSNAX41wQEdGPr6wtkBV+xQDAqwguFohpaFvExSod/tj58QjsiIjTXnGgfW4CD/un0+L9YXOjNW6pz3/C5I3ZmrmYNmfTO0HdPA20fcxSLTis3jDxD1BdhTlBtAyVDslz2iQN/0EgFADkH7aCv5Gev3wlIXapZBSodCr19Vkm/WMgpL+GKHwbUGwsNZYL2GCtZPfGb3xQXnzGngcoPt0ruSiROCXEHpvTU5bcVzn2XMu8dQEryLLSq9f67LErEbMWdihPr4Sflmj855wIMAH8Adqrip2ROEhOPPvbFwT5iiyA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dITFB1iRQXWXAw/4BmCnEF2oLlLW8hTxmBdl72Izwns=;
 b=eexWKA8g0su/5D+hZl/vFl9A4qn/5s2CS9lukKkG4RV/fk2gbilgz7NpzZ+fYuYzY27Ff0oeFNJLL3/yZPAv0tbyEYVzFZCBOli+0MB1o8bbpU6Y/0l8PVHGqBA3fx/MamdHEOd5QOmD3pzjES3FCZxt76KvHtd3ySuqPkgM9Hg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e582799644bf5fc1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrHWc6/GB+vsdX0ua8y90pAuBOkxHjG2Qn10ZatW9ZaY9jH4Nr/fTGv2+J4iuchOv7d1vZd4GMy2ByMGx4guhWS4LKbwYBLjSirvqgM1vbkPDHaVnZWweoir9GFN1qVawUcYkLF98IKTop1EQIQPOeeQrqn4+yRMdeGdRYiakjA/D1i5qVSgQb1TsbLehqfPh8d6V1fnY5ln49pZwrSG4HXEgAEb5/bIwrWHKYi46ujdQ1zr8hryNE1rHQm6yWt/YCxJz30NHX9HrWaxhSjrlNb4TyIjZRTa8V4tSlRV/folX5Dw4EzCEJeCyo1GdySmwccjDSh5TrXMMJtUJn0OTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dITFB1iRQXWXAw/4BmCnEF2oLlLW8hTxmBdl72Izwns=;
 b=IMjpDJ+jCyhv37PonIsePur9b8UMYhtv/hGXybgBF93iXwLgfIC85Ayrtpxnmjg8JIGSol6tyoHqsuS9I49Xq8PKXyJzX5B/NZW7XL23+OxCy8QRsgKVui4UY8rGU68XQTkWvPIkNqSM0HBimsU4uFXijL57l4sXcNKKDYDRyEpNiEQpuvjfaIeSHulyG/rneyyjOefBQPuNgn6xG/PTQB0k4fQWyW8k3oWkYnZ9VPeDBV+Kft6/f+Teu9Hqm3+574DWsfVs6T4mwJ8SRSnwALSH8C5qsPNzQnULXDgraIYKtqMvDXGCMIO0EK6gFakNcQ0sby+GX+fWuHxBg7N30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dITFB1iRQXWXAw/4BmCnEF2oLlLW8hTxmBdl72Izwns=;
 b=eexWKA8g0su/5D+hZl/vFl9A4qn/5s2CS9lukKkG4RV/fk2gbilgz7NpzZ+fYuYzY27Ff0oeFNJLL3/yZPAv0tbyEYVzFZCBOli+0MB1o8bbpU6Y/0l8PVHGqBA3fx/MamdHEOd5QOmD3pzjES3FCZxt76KvHtd3ySuqPkgM9Hg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v5 6/7] xen/arm: add and call tee_free_domain_ctx()
Thread-Topic: [XEN PATCH v5 6/7] xen/arm: add and call tee_free_domain_ctx()
Thread-Index: AQHasZmGvrbSer/b/kmljSykDWQao7GxZz6A
Date: Fri, 31 May 2024 14:17:20 +0000
Message-ID: <958BBE21-DF91-4D48-93E2-E49E733EE7A0@arm.com>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-7-jens.wiklander@linaro.org>
In-Reply-To: <20240529072559.2486986-7-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9749:EE_|DU2PEPF0001E9BF:EE_|AS2PR08MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc5b3cf-c21f-4b5b-4cd4-08dc817c6725
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?erxfUy4ZBTv60Ckcl9gw6QElcW+6rR0bm+3nDVa0EEBc3KNN2SzlCTfOUVkl?=
 =?us-ascii?Q?npBXq1ejWcRvMAB4STFBW34fMRF4fd3yV20O8r6CPOitBLh1UHL7jBWinuCL?=
 =?us-ascii?Q?yx4Qn3tlFd01q9g1q9mkIC3Pmg60dsFMGU7fWM8JttE0i7BOnwYsI61ZA8gU?=
 =?us-ascii?Q?jsifCGHggqGJsCWZ+RBMp7VQp9IwklJWOi2tv2Esg1+SAYfa914MlHpbBy6D?=
 =?us-ascii?Q?AgGh03Inct8F6bMLnGObr2xxqzW6dncrFk3UH/1cvGBMOlb82+vesYAUG1Lg?=
 =?us-ascii?Q?nHKOBaqvQZJeY2PJtv5OlT2vXA9wktFDC1wwVUI5h0sgl0O9MQe2G9oC9a8r?=
 =?us-ascii?Q?J3mWQZ+n1BPYlkZ39DpoaJqYI4+e1A3NQnR0jAVhpqN9hnf7uGcgk3sv748p?=
 =?us-ascii?Q?9FM4pEa4AQaOUcy/jJtb7mVpm5zHD0B0aLOfdDnDLP6Rf7B8sziJGHAI+Yfa?=
 =?us-ascii?Q?Ke53r+yu34pM8Yap2+J/B4HK0dLi7eOavmD4cGH6tTS6Luy45gBZLXT0wgzA?=
 =?us-ascii?Q?AxuZgg8HEFVxCrE0aijseTZEl9ClEZv0/cxHfA/mm2h1gkKz+PaUAVaSR21e?=
 =?us-ascii?Q?V2f5BFqwtbiHaejZ2YMKUDNpwd6EX2JAwbrWLHBN11IGPqwNZWprGx0FKe2n?=
 =?us-ascii?Q?/xXypoXsoWrhmkjzSrugobiVG1VN5EyOsxle7wW+xasbioJyFPuF8g8ReDSM?=
 =?us-ascii?Q?JJV9dHYfn6l1f6wDlM3ShMYFbgAwCd0IFj5C8jlTa/QYe4Es5icHO1c6FjDU?=
 =?us-ascii?Q?Ye+pBB5AJnVb5nHBxxKLUBPns3nP+DQNzUiiVNhLWus6YBILkBY+Cmel10qc?=
 =?us-ascii?Q?q83cKvb+eLN9WmlKmgdgdVlKoicx/D+rZUppWD50UqVX9m73D0xit/oZP9ZF?=
 =?us-ascii?Q?gE2M4zPkyTVi1iprhYe7XPUQeBk35n06W6OJ0Auy8p6ge3InAhLOWrKDD1Ar?=
 =?us-ascii?Q?h9h+jGtPTzVSjSkaHtaRUHXs9Asbk3z+l8vWAeHCB2fpBZS0eDUCMeyyQL/2?=
 =?us-ascii?Q?uoBf6mz38UCNkEd4T9kVDCJPgkaubIW5m2LoiTR1OGYEZZiPxUOIzdWfF8Bu?=
 =?us-ascii?Q?U68nBAwJvyW8aA7yuKGTQaR8OMsAdO5KlqBU9V+hKLsvlmWzqQ22kaLFXxnV?=
 =?us-ascii?Q?5B/LiOfAos4CzNSzp4EkV3MAFX5qUtc3MlKAwqR+6Z6lDBdOUSmQwhiz3jrO?=
 =?us-ascii?Q?FTqkuAdqi7HWuCSglZmTIFdlGqexg0foA6e60QxBlwIDK4pSWCEdr62lVRrc?=
 =?us-ascii?Q?y1FsIiB8hfOVRPrWB31RtNpi7QxHu6ZLA0HJn0YSmy8J3Gc5fWPbzFPwnLz3?=
 =?us-ascii?Q?m7SGVro2gFYNXEnQmvBeTvMm2RhU3YJUx28CZtqs9wOweA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <13D9C7C2D661B34B8BDB06C4ECAB3E08@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9749
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0083712-e882-4d7d-8be3-08dc817c621f
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|35042699013|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tBDD6fRNI6IRwlofEXcWZXV3wnm2c5NllgaM8cXbpI8zvw+3tH5j7HPn2Uy4?=
 =?us-ascii?Q?G27GyA0C5y8ppzLCpwK5su7oNCFoHHjhCmNkZeg+hE0xMDwH9pfwxSOYJgCg?=
 =?us-ascii?Q?5905iR1IJO/vCo46Ezo3ercu47iaTRG7kQjonTetQUj1KflZRUZmYrmA6v6P?=
 =?us-ascii?Q?ntP/yJ15WvhhJoRiDVubiLPNeBSxO/l21GBfL9dgnpCaEk+XcEXqy6cs/fkG?=
 =?us-ascii?Q?jB5LMTX4WKeh5RSgoOn7yRRHte8ie+9zIBlXRKmAioFvtfpfFCnVL7zkpk2t?=
 =?us-ascii?Q?z9hM6fEpimfsG0wHnzaTw7P8z8YBcw0t0NhXhzWV/MATqd8oxfrSZubeEll6?=
 =?us-ascii?Q?hUQ1n1EYGNp2oGeDIh6O2oF5o7idUtDpdCqY1ogn5sOS/jDZLM6dmQiFARzT?=
 =?us-ascii?Q?1zg5AVAnQXAHjBJ9zQudEEzbCk+zhv5N/f5mPXtEt4tbMD07zM5JvbnjeIHZ?=
 =?us-ascii?Q?WSGTJ1Qvpl/A2w2uWdstGbv+D2qXb0pvkUeFnmFFQ9SRPk8tiG/ugPvMWiyE?=
 =?us-ascii?Q?hgD3w+/N5i9VRAMKnpHyEDTY8MHVsbtnTRWONxjIIHZDGvHijEZtRuyB8r4L?=
 =?us-ascii?Q?/rC0RCLq7P9YUV19/UNYJwSbeswsrB2yIyHE8KmnXXksvaKNHk7FKQpvWC1U?=
 =?us-ascii?Q?SPaF0iiOASvpin73/hiQjiIF2wSLNIURdU1oCiFX4krt77tHEouJJk2BC37X?=
 =?us-ascii?Q?eevf7r0vttB71CaOl6vekBuKjS+Wb8nWkOGu2MnKa6ancas0XPwAk01DojvZ?=
 =?us-ascii?Q?7kWrGqnSXVa+DnsUvm1v+jGVii2f7mxDI5UIhQ5RxM9a3ktFrhmW5aKoqYSW?=
 =?us-ascii?Q?NvlAzV8z7BIkP4RN3Rz2MxC3vkhbQLw5IEBbBbc/oBFNevbvXjyPIHBkgbYd?=
 =?us-ascii?Q?8fP577dc7Zav47VXVTyqlJRjVrmbg4HSs76Lhkj8U8zA+biNWyotludDuPEv?=
 =?us-ascii?Q?Sm2cNsFOFc+U9fuQ2UlGF4cpSt/6K4Nlfb1QdZaT0kO3R/Jk2EQhy+UHej8G?=
 =?us-ascii?Q?y/f7bOtW3AkPNHeoKhaIDsakpfmQ+epvZmjM8F/7fON8LnWYcSuMzVXltWuw?=
 =?us-ascii?Q?Qf97iD9QpwiYOrrKe7y+dsO58MAlRTBPflE+Loc+F5DInPqk+7S+yCwDnPOP?=
 =?us-ascii?Q?cJH/jdghFnf8X/jK1Lnpe3NGoFN9jbuNr30K5RrniQIK1Cz/9FbI3k2Sj81T?=
 =?us-ascii?Q?0/fYSP5WI1NNjNJAJTdWn2A8SLI7hDk/xLvSFGaxaFODU7f2i0CG7T2KsdYY?=
 =?us-ascii?Q?d4aAKSPykVaI9F/o3PLMt9kNFBgbFJa4Mp/6R29Atc2frUupOY+OEPqR9fti?=
 =?us-ascii?Q?p4lPwJ6kke3+yYkFZ9svz4u9E9wIFsBVS1Bom55tV1aOqm6mlf+meVbkgIP8?=
 =?us-ascii?Q?7MIDnz5uPXnUw2u9tT+kFkq5EoEW?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(35042699013)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 14:17:28.6193
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc5b3cf-c21f-4b5b-4cd4-08dc817c6725
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9023

Hi Jens,

> On 29 May 2024, at 09:25, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Add tee_free_domain_ctx() to the TEE mediator framework.
> tee_free_domain_ctx() is called from arch_domain_destroy() to allow late
> freeing of the d->arch.tee context. This will simplify access to
> d->arch.tee for domains retrieved with rcu_lock_domain_by_id().
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/domain.c              | 1 +
> xen/arch/arm/include/asm/tee/tee.h | 6 ++++++
> xen/arch/arm/tee/tee.c             | 6 ++++++
> 3 files changed, 13 insertions(+)
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 34cbfe699a68..61e46a157ccc 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -837,6 +837,7 @@ int arch_domain_teardown(struct domain *d)
>=20
> void arch_domain_destroy(struct domain *d)
> {
> +    tee_free_domain_ctx(d);
>     /* IOMMU page table is shared with P2M, always call
>      * iommu_domain_destroy() before p2m_final_teardown().
>      */
> diff --git a/xen/arch/arm/include/asm/tee/tee.h b/xen/arch/arm/include/as=
m/tee/tee.h
> index eda8a8aa38f2..2e99a38184be 100644
> --- a/xen/arch/arm/include/asm/tee/tee.h
> +++ b/xen/arch/arm/include/asm/tee/tee.h
> @@ -38,6 +38,7 @@ struct tee_mediator_ops {
>      */
>     int (*domain_init)(struct domain *d);
>     int (*domain_teardown)(struct domain *d);
> +    void (*free_domain_ctx)(struct domain *d);
>=20
>     /*
>      * Called during domain destruction to relinquish resources used
> @@ -70,6 +71,7 @@ int tee_domain_teardown(struct domain *d);
> int tee_relinquish_resources(struct domain *d);
> uint16_t tee_get_type(void);
> void init_tee_interrupt(void);
> +void tee_free_domain_ctx(struct domain *d);
>=20
> #define REGISTER_TEE_MEDIATOR(_name, _namestr, _type, _ops)         \
> static const struct tee_mediator_desc __tee_desc_##_name __used     \
> @@ -113,6 +115,10 @@ static inline void init_tee_interrupt(void)
> {
> }
>=20
> +static inline void tee_free_domain_ctx(struct domain *d)
> +{
> +}
> +
> #endif  /* CONFIG_TEE */
>=20
> #endif /* __ARCH_ARM_TEE_TEE_H__ */
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index 8117fd55123e..cb65f187f51f 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -102,6 +102,12 @@ void __init init_tee_interrupt(void)
>         cur_mediator->ops->init_interrupt();
> }
>=20
> +void tee_free_domain_ctx(struct domain *d)
> +{
> +    if ( cur_mediator && cur_mediator->ops->free_domain_ctx)
> +        cur_mediator->ops->free_domain_ctx(d);
> +}
> +
> /*
>  * Local variables:
>  * mode: C
> --=20
> 2.34.1
>=20


