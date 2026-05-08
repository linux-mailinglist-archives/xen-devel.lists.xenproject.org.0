Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMW/E9zJ/WkpigAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 13:32:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922004F5CCB
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 13:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303512.1576865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLJR2-0006el-RI; Fri, 08 May 2026 11:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303512.1576865; Fri, 08 May 2026 11:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLJR2-0006dD-O1; Fri, 08 May 2026 11:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1303512;
 Fri, 08 May 2026 11:31:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wLJR1-0006d5-K0
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 11:31:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLJR0-00CcuM-MU
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 13:31:58 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fdc9a2-bab6-0a2a0a5309dd-0a2a4503c20a-38
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 13:31:58 +0200
Received: from [52.101.66.47]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fdc9ae-672d-0a2a45030019-3465422fc098-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 13:31:58 +0200
Received: from CWXP123CA0001.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::13)
 by VI1PR08MB5469.eurprd08.prod.outlook.com (2603:10a6:803:132::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 11:31:51 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:401:73:cafe::8f) by CWXP123CA0001.outlook.office365.com
 (2603:10a6:401:73::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 11:31:51 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 11:31:50 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB9419.eurprd08.prod.outlook.com (2603:10a6:10:422::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 11:30:45 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 11:30:45 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"; dkim=pass header.s=selector1 header.d=arm.com header.i="@arm.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gWrTilIqcL7CflzwETbISR34sZe3FAr3gk9jeaAL9SnWOcO3iSAKM8wncKNRGI9nbL9ghqVxp17BHS3eOCB11aPR/YcaIO4csHWAuuTGDi0Jc7XYxYTIc4qdoGAdn9fQrgT2s1WWUM7HRtYUWwBykw1bcB5rSSW5Je9raqNBXcYDhuRNOIrafkTZjQGFgFnH2rMryNMAbxlGQyQrOlXyYhe7912LfOQKLyTN2tFzNHnb5NPQ+t6/iKWtCtV2rx8jVdvfgcCjcHiwvNdSC6cVQghURLh6oj12oMIGZrSnVz0HKp/uV/SJgRTjL34xz3bkWeSysoTzwDdI/4BIcSKQPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXrmYd9cObh5a/fjr3BcrO3AayHA1BYx1QIStZJvvbA=;
 b=MKJEkQLf6Nxivp7H1gkrvy3IQQXQ9jqTTPL2Df2ao3z8XfMQHsVpnZefOaJHqdgPIiaI4sLdT76YoUo2oLDx5UoIqGC/ZVHpSaiOi/4Yg9bkxl/xaWfgDT+Vc2cAs//GwKwk7MqjP/GzPfVOn7TDANUlb3PnbbCNgnUK2mNyLDhCPxD6QUq/PPILmy3z+paFi82FPi3aCiIIa1SKlY0u/zhnt0I6r7GLGb7Iy3lqmV6iJZNJX5/jcVSkP6Me9N/d65VAfZL4lCyobkOBCnfZm7fg1wARFnW4BgleP10tAuRr3YAIXv7qLj0vG3rH5+/RvrMRL6UKikJ+HgPFswm2kg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXrmYd9cObh5a/fjr3BcrO3AayHA1BYx1QIStZJvvbA=;
 b=iiFVkOWXJv6erEPmj/9jGeOO3XcBK8m6J+oyA/qsVpNpK2pnvA2b+4wjJgzPVbBsWDT2hB/MLY5x3lnY5O6Cuj/JitF9+iwcQhjyCtMcMR6bqlXEn+ciZHLq7LavK0S3O8xdXcFLNRDNTcNZT6yPxjN6VlA7RM3LMJH8bafBAY8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ie9/Fz95TFJUinsjZUxRf/nYkC1wPres7l9AXKp38dyDzjy6YGnhIwWnUQw1yTNQ7QIdH1eEY27pCPWjDDJdaeN8kIkSkFdKOUu1Fs0ICcKpAi4QKdxni4nwYWdoipPUpC2y6eOwpAs3X6fs9hjlPxfWGAmEsN95WGdU0D5e132K+tb4l850QxlLi9ApsYGoQn6qMMHGzbNOvya38cHuAbfxR7XxXEiBpqTLE2PqWYB/Dw255yZKLq0SxY7fTZ4kPxJ6ouMG2MvMD/zrMpaSr4lmaUrToqwxOTIO+J549wEC32cT09bqrMBEEG/pIVP4tp/d2FRhRmj/ojQuRi8USw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXrmYd9cObh5a/fjr3BcrO3AayHA1BYx1QIStZJvvbA=;
 b=yBVBd7vMiv0d3g6EbhGJJTw7f4YIbHwauOS1t4qYagQK4FstiPRFfWWkiPJgNXWNWBcvjgpMICM2Rw2bSVCuvgfnG/xjF+xXAB78FnKZCUF7aP/kEz79+tHVwaS4EtENlL625mLX2qNPXEZyvGEy08AQ/Ri6G6wiDBUQjyeUCeSS3srvwb5x74PnCNOUfvrDqJo/k9tJf4NVhxZVULoAQejDWIN6skCRBtVM5vj7Umi57t1enmrAY9jGsSdzrupIcj10ngmW6KYNAprXSv9o06UAQfza82X3bxLCNhFa9H1Bp7fb0v9pcVlivlMkkGkMthcbzGF+imxeFdKBDNgtmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXrmYd9cObh5a/fjr3BcrO3AayHA1BYx1QIStZJvvbA=;
 b=iiFVkOWXJv6erEPmj/9jGeOO3XcBK8m6J+oyA/qsVpNpK2pnvA2b+4wjJgzPVbBsWDT2hB/MLY5x3lnY5O6Cuj/JitF9+iwcQhjyCtMcMR6bqlXEn+ciZHLq7LavK0S3O8xdXcFLNRDNTcNZT6yPxjN6VlA7RM3LMJH8bafBAY8=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v8 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Topic: [PATCH v8 05/13] xen/arm: gic-v3: add ITS suspend/resume support
Thread-Index: AQHc09iFdDokLL12tkS/bPm2SonHDLX/RtUAgATNjQA=
Date: Fri, 8 May 2026 11:30:44 +0000
Message-ID: <0BBBB87D-4A54-4378-BC30-4CFAB7553286@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <5a42b7c32fadf21262b8342f27e685916d0e5812.1775125380.git.mykola_kvach@epam.com>
 <FDA8FF59-989D-42A8-9E75-1300E0B5EBD0@arm.com>
 <CAGeoDV_OkizsZj0hNXM3W84FpoeVjgSnzoRmAr3YtZj1Ri_3eA@mail.gmail.com>
In-Reply-To:
 <CAGeoDV_OkizsZj0hNXM3W84FpoeVjgSnzoRmAr3YtZj1Ri_3eA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB9419:EE_|DB5PEPF00014B98:EE_|VI1PR08MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: 54bca822-3db0-47fc-4298-08deacf565cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 hANcNN98R3JKD4M3vKkCVZrQWpaTnAl1GkhNGBR0ew/TfScU0EklSBXZ+NHk8LvGm4hNZRvN5NGf2cOTWcW5EtxDUF00Zw223sd6nQxbO7KFko/ddZwRFrboBz97vK2ztVX6+JPGHJlrJRynt2fJb6yLcLRXZWt9tzP+RHk+QHGUa0SmVnvBhMFf9DHghfeVw1hqB/KDQXXPwR06edCI5E5CzrhjE6AyZeOD7LLdXmLT/CeBwHJ9Bw60vFGj+vkyNfmT9YVNYxNFKVmZHFn4+CCNrxuuxJvFGSL4phjUs+eki7+bU+UKgnUvMoxWoyOa5hEyC25IhmarDCBhCK+JEr8nGynHY3f8NY8/wavRhzDesiRud9P/p3Fq9Gk1ek3rpNbSqzFv9H7WtdxLIendJX5TUyTtstuvVLOGpBEhh+n9F5Bc/LYC0MMzQ6403preohkb1DykEuM/2KwO3PwWx/ZKzuIIRYzv0uRHHRMt7uJm60z+TkUa3a0roHA6oo8dGO9bjcic/O/HGU++91RfhQOxN++hjk0WW/Gjo7OIjOTvp1u5up6LVSN2mvBmYhDXri7dDi6ypSw1mLSBTnECdzYxzMXPCNNd6pwp2+ZrDEAb1/Zaigt5shJpJeFeVsJ5N3rL5eGCeMR73S+iOGRREHv6dj1/6vdDlVE+SLOZ90OHaISDofPcCKzSqMfDwhfi2QQY09/r0qUG/w/pLHnzKPcgxbiwpRW2r2T4nMuRS3KYCQUx7A5xTpA1eU4zCUjp
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E69A7E1EBFDC4E4AA144248ACEC0FE21@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 poS2T9ChR2VaMFlXyS7PbfdvEtFThqjCRYRePuwXeAk8Qdx08c7FPpFx72qVK0eaV4PImqNSQ8bq7BKAWlrgtLssSsUtn19bliRM/BTXl++Bx+OIpTVmtBIx6M2l/coczfLvBzMEChIpGDrR4aQvr5ebmwYZk+9wbV7hIHSt0EuVq53DtzfpwuwU96ysyAGI1PKjzIjQGnOuslBahcd8CDd8EKTHEn0g9IBd2q/j26eYQRXLdIHMJGVUdGnR/2Z2YUpaMl1159W8nlUAPNk/BgxOIZpzETuXlGdlAefGl0/Xf/rnHxbUoedZ7ci70eqTWwuB6q4APS0Ag61pU0T7Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9419
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	496f355d-e68a-4b4a-6e66-08deacf53e92
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|14060799003|35042699022|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	83I1KyOlO3/fPGNqyR8IztVgNzexj7eMmD9zB4zXtcAihE89IWTnTF7UsF3/Jj+NVAyenNXsIb4bd5ie6sq8Jj2T1dh4rjPfW6/hnBCOinObhEQ9C43AoaNteAPEtBXoXHlGAUos+DOZHDffFU3vULcMsOXencl2NA9cCNO50TAbkXVBbptHqwINU+4+1hsSr3YfqPxa7RjAsDMjrn+nSRw8/eKXsmYQD49JBVvdlairYamf1Ba9OJTaLgj2sGXo+9TOzvgXRtv8bB1ZZ5vFuiffTX+kQ3eBDIQxDcORWCE1Kt/WR9GDn1UXs/SrOoG8+OkvJh6r9FK6M/5kTWSDKdvm/nJK5cYDN4DIeJpIJUOmPtJr8qzrmuQ4rTOGB7HOhAMKYnxd56JmfNcaoGY7n7bTGoGyhgpePLhLhZS67ykCwirX3PTwkJNc07QLWeUb+vUgJr0l3krOS6QuldpGAHHIAeTLafEgjg5HBvxDzGzEaK6Db6lXSJgksquOob64IMsDEy7izPxbToUMK2OVj/kJaONdC/RtNNlcXMeq/fXOkX2kpiVFf9jtme1cnhhdqIQ4WAqzELZSfoGoWT4JJEVNs1loPi/5aa3HMfLfLut9P9Ol0W6VCQIRD/wv0dGK8jk/rUTAsfOkBzFVAtIXxJl4A9DI3ATMFm8sw6joW44xBa+sZjeNrB5ejaNus/xXJFBtU50E+EwASb3Kvj4FAcW6N74S1tNGMC2kvmHwM90=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(14060799003)(35042699022)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ICNgz5KVBxJHFyfd13naK7U6My9HhYTlgW+sB7F3lPRKdtl+L+x7sF5zjThcaWqVtBZObXLZkfGRjWCEjcQLi+9UsQuHuwyQhcQl/amvrcelKqcoXvLeGOWOE3ETpAXyy3FENdsHgez0NVlCqDW9N1mvgqd8of1t8OEnYjmqUOrkGd36E0u9YHHfqV41gceKzqW4r0NOes4tpG/PGQHrRNPnQakVnAStmuJoeMefQbCWFWm48V/X7/y4mxXkPPi50SNQnzcnx2KjzSuS8ZI974A9VyO4RlXzFbDoVCQnu5pvF4WDNAku9Kc9Ro0vqYFVd716Xw9msapMTeEsnP6f/2NQ+zh/wnSUhJEW6FnQDJA/I8/7rBoBcYyAxk4q3G0F/DU/zymjnAVUTELugCzRg3esEALY9aTyZYzwOkaRy5MCs6zfMvQB4CXZJqEHGZtl
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 11:31:50.7223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54bca822-3db0-47fc-4298-08deacf565cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5469
X-purgate-ID: tlsNG-33051d/1778239918-38776938-A8DADC0F/0/0
X-purgate-type: clean
X-purgate-size: 4020
X-Rspamd-Queue-Id: 922004F5CCB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+IA0KPiBPbiBGcmksIEFwciAyNCwgMjAyNiBhdCAxOjU04oCvUE0gTHVj
YSBGYW5jZWxsdSA8THVjYS5GYW5jZWxsdUBhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gSGkgTXlr
b2xhLA0KPj4gDQo+Pj4gT24gMiBBcHIgMjAyNiwgYXQgMTE6NDUsIE15a29sYSBLdmFjaCA8eGFr
ZXAuYW1hdG9wQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gRnJvbTogTXlrb2xhIEt2YWNo
IDxteWtvbGFfa3ZhY2hAZXBhbS5jb20+DQo+Pj4gDQo+Pj4gSGFuZGxlIHN5c3RlbSBzdXNwZW5k
L3Jlc3VtZSBmb3IgR0lDdjMgd2l0aCBhbiBJVFMgcHJlc2VudCBzbyBMUElzIGtlZXANCj4+PiB3
b3JraW5nIGFmdGVyIGZpcm13YXJlIHBvd2VycyB0aGUgR0lDIGRvd24uIFNuYXBzaG90IHRoZSBD
UFUgaW50ZXJmYWNlLA0KPj4+IGRpc3RyaWJ1dG9yIGFuZCBsYXN0LUNQVSByZWRpc3RyaWJ1dG9y
IHN0YXRlLA0KDQrigJxTbmFwc2hvdCB0aGUgQ1BVIGludGVyZmFjZSwgZGlzdHJpYnV0b3IgYW5k
IGxhc3QtQ1BVIHJlZGlzdHJpYnV0b3Igc3RhdGXigJ0gaGFwcGVuZWQgaW4gdGhlIGNvbW1pdCBi
ZWZvcmU/DQoNCj4+PiBkaXNhYmxlIHRoZSBJVFMgdG8gY2FjaGUgaXRzDQo+Pj4gQ1RMUi9DQkFT
RVIvQkFTRVIgcmVnaXN0ZXJzLCB0aGVuIHJlc3RvcmUgZXZlcnl0aGluZyBhbmQgcmUtYXJtIHRo
ZQ0KPj4+IGNvbGxlY3Rpb24gb24gcmVzdW1lLg0KPj4+IA0KPj4+IEFkZCBsaXN0X2Zvcl9lYWNo
X2VudHJ5X2NvbnRpbnVlX3JldmVyc2UoKSBpbiBsaXN0LmggZm9yIHRoZSBJVFMgc3VzcGVuZA0K
Pj4+IGVycm9yIHBhdGggdGhhdCBuZWVkcyB0byByb2xsIGJhY2sgcGFydGlhbGx5IHNhdmVkIHN0
YXRlLg0KPj4+IA0KPj4+IEJhc2VkIG9uIExpbnV4IGNvbW1pdCBkYmEwYmM3Yjc2ZGMgKCJpcnFj
aGlwL2dpYy12My1pdHM6IEFkZCBhYmlsaXR5IHRvIHNhdmUvcmVzdG9yZSBJVFMgc3RhdGUiKQ0K
Pj4+IFNpZ25lZC1vZmYtYnk6IE15a29sYSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0K
Pj4+IC0tLQ0KW+KApl0NCj4gDQo+PiANCj4+PiArICAgIHsNCj4+PiArICAgICAgICB1bnNpZ25l
ZCBpbnQgaTsNCj4+PiArICAgICAgICB2b2lkIF9faW9tZW0gKmJhc2UgPSBpdHMtPml0c19iYXNl
Ow0KPj4+ICsNCj4+PiArICAgICAgICBpdHMtPnN1c3BlbmRfY3R4LmN0bHIgPSByZWFkbF9yZWxh
eGVkKGJhc2UgKyBHSVRTX0NUTFIpOw0KPj4+ICsgICAgICAgIHJldCA9IGdpY3YzX2Rpc2FibGVf
aXRzKGl0cyk7DQo+PiANCj4+IFRoaXMgaXMgY2FsbGVkIGZyb20gc3lzdGVtX3N1c3BlbmQoKSwg
YWxvbmcgdGhlIHBhdGggaW9tbXVfc3VzcGVuZCBhbmQNCj4+IGNvbnNvbGVfc3VzcGVuZCgpIGFy
ZSBjYWxsZWQsIGZpbmFsbHkgcmVhY2hpbmcgZ2ljX3N1c3BlbmQoKSBhbmQgdGhpcyBvbmUuDQo+
PiANCj4+IEluIHRoZSBJSEkgMDA2OUguYiwgNS42LjIgRGlzYWJsaW5nIGFuIElUUywgaXQgc2F5
czoNCj4+IOKAnEVuc3VyZSB0aGF0IGFsbCBpbnRlcnJ1cHRzIHRoYXQgdGFyZ2V0IHRoZSBJVFMg
dGhhdCBpcyBiZWluZyBwb3dlcmVkIGRvd24gYXJlDQo+PiBlaXRoZXIgcmVkaXJlY3RlZCBvciBk
aXNhYmxlZOKAnSwgaXMgaXQgY29ycmVjdCB0byBhc3N1bWUgYWxsIHRoZSBJVFMgdGFyZ2V0aW5n
IHNvdXJjZQ0KPj4gYXQgdGhpcyBwb2ludCBhcmUgZGlzYWJsZWQgYmVjYXVzZSBkb21haW5zIHNo
b3VsZCBiZSBhbHJlYWR5IHN1c3BlbmRlZD8NCj4gDQo+IFllcywgdGhhdCBpcyB0aGUgYXNzdW1w
dGlvbiBoZXJlLg0KPiANCj4gQmVmb3JlIFhlbiByZWFjaGVzIHRoaXMgcGF0aCwgZWFjaCBkb21h
aW4gbXVzdCBhbHJlYWR5IGhhdmUgZW50ZXJlZA0KPiBTSFVURE9XTl9zdXNwZW5kLiBJbiBvdGhl
ciB3b3JkcywgdGhlIGd1ZXN0IE9TIGhhcyBhbHJlYWR5IHJlcXVlc3RlZA0KPiBTWVNURU1fU1VT
UEVORCBvbmx5IGFmdGVyIGNvbXBsZXRpbmcgaXRzIG93biBzdXNwZW5kIGZsb3csIHNvIHRoZQ0K
PiBJVFMtdGFyZ2V0aW5nIGludGVycnVwdCBzb3VyY2VzIG93bmVkIGJ5IHRoYXQgT1MgYXJlIGV4
cGVjdGVkIHRvIGJlDQo+IHF1aWVzY2VkIGF0IHRoaXMgcG9pbnQuDQo+IA0KPiBTbyB0aGlzIGNv
ZGUgcmVsaWVzIG9uIHRoZSBvd25pbmcgT1MgaGF2aW5nIGRpc2FibGVkIG9yIG90aGVyd2lzZQ0K
PiBxdWllc2NlZCB0aG9zZSBzb3VyY2VzIGJlZm9yZSBpc3N1aW5nIFNZU1RFTV9TVVNQRU5ELCBy
YXRoZXIgdGhhbiBYZW4NCj4gZXhwbGljaXRseSBkb2luZyB0aGF0IGluIGdpY3YzX2l0c19zdXNw
ZW5kKCkuDQoNCk9rISBJIHdvdWxkIGJlIGZvciBhIGNvbW1lbnQgc3RhdGluZyB0aGlzIGFzc3Vt
cHRpb24sIHVubGVzcyB0aGUgbWFpbnRhaW5lcnMgZGlzYWdyZWUNCg0KPiANCj4+IA0KPj4gDQo+
Pj4gKyAgICAgICAgaWYgKCByZXQgKQ0KPj4+ICsgICAgICAgIHsNCj4+PiArICAgICAgICAgICAg
d3JpdGVsX3JlbGF4ZWQoaXRzLT5zdXNwZW5kX2N0eC5jdGxyLCBiYXNlICsgR0lUU19DVExSKTsN
Cj4+IA0KPj4gaGVyZSBhbmQgaW4gdGhlIG90aGVyIHBsYWNlcyB3ZSB3cml0ZSBHSVRTX0NUTFIs
IHRoaXMgcmVnIGhhcyBRdWllc2NlbnQgYXMgUk8sDQo+PiBtYXliZSB3ZSBzaG91bGQgbWFzayB0
aGUgd3JpdGUgdG8gb25seSB0aGUgb3RoZXIgYml0cyB0aGF0IGFyZSB3cml0YWJsZT8NCj4gDQo+
IFllcywgdGhpcyB3YXMgaW5oZXJpdGVkIGZyb20gdGhlIExpbnV4IElUUyBzdXNwZW5kL3Jlc3Vt
ZSBjb2RlLCB3aGljaCByZXN0b3Jlcw0KPiB0aGUgc2F2ZWQgR0lUU19DVExSIHZhbHVlIGRpcmVj
dGx5Lg0KPiANCj4gVGhhdCBzYWlkLCBtYXNraW5nIHRoZSB3cml0ZSB0byB0aGUgd3JpdGFibGUg
Yml0cyBpcyBjbGVhbmVyLCBhbmQgSSB3aWxsIGRvDQo+IHRoYXQgaW4gdGhlIG5leHQgdmVyc2lv
bi4NCg0Kb2sNCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

