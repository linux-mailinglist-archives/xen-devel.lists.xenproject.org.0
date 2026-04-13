Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBypAdgA3Wk3YwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:42:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937B23ED69D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 16:42:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281211.1564234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIUW-0000Sj-6q; Mon, 13 Apr 2026 14:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281211.1564234; Mon, 13 Apr 2026 14:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCIUW-0000QK-3N; Mon, 13 Apr 2026 14:42:20 +0000
Received: by outflank-mailman (input) for mailman id 1281211;
 Mon, 13 Apr 2026 14:42:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCIUU-0000Po-On
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 14:42:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCIUU-007xxE-44
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 16:42:18 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dd00c3-2eae-0a2a0a5409dd-0a2a4506af1c-16
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:42:17 +0200
Received: from [40.107.130.60]
 (helo=MRWPR03CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dd00c9-0df0-0a2a45060019-286b823c2dd2-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 16:42:17 +0200
Received: from DUZPR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::13) by DB9PR08MB7536.eurprd08.prod.outlook.com
 (2603:10a6:10:304::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:42:15 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::8b) by DUZPR01CA0006.outlook.office365.com
 (2603:10a6:10:3c3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 14:42:15 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 14:42:15 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by PA4PR08MB6142.eurprd08.prod.outlook.com (2603:10a6:102:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 14:41:13 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 14:41:13 +0000
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
 b=jKJayHNtNkMzj04pay72zX2n/AZzuwPOCpmXEQTpB0nQL3KgrLq8pkrD9WTS8akst3j/XMGNYtrCvDo/Vd5cHVznXNBFA7NGiKIWDLYp6taCQfJYZHVr4ai6vFaMahUzmH8c0Y+G1mrsHRCSZEWd6x4gDha3FFiX1U+RfFSNBHOUadP4dAuOxP7qD7tRaIkue6lewWsIOQJivMyeGi+cAwic3qazK+Ro4i+D2Vx4GCd3qOvs3iCdVogKq7pqCos/Cec4SpQ/mM33/9kI1WzhDVzWov5R9ZCDln7Z2WiQ6RI0WATnitIIrnwAONH6k+sKE+pSmiPzCrxxj9mnFvAgWA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtPTZHVQFJOOxgS79tzBM52TNf/PIT4q/fs5VXC4URQ=;
 b=xrz/PXXgPbodSS3nGzv/oOR5PF8BTNkhlTWLjhid06svTF6Y/MyPa8JmqubfnRZXFEwziLiAGDMHjWGm2af71M9JpUvMnSqfZNp4eHE5Ukwf5qZPkefmJungKEIUWwRw5qQ9BkzHeMWdXhvu0T3Kx7ABr+AqaKb3QxNNGaZf8fRo5T2vJcz6oKyF3n1e3LZONaXSTuhHsW8vjc3cEdCXv0KnYyQKdRu7m+9AOpuPNMj50krjQ9GRU13xJ8q+ckHmuHV6secAPGerDBUA5hipTuAsmthFJUxuziFijJ+XuW76lXhE81dzENGh2oIWpdSgiKtifPy3ixywOeoqBedgQw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtPTZHVQFJOOxgS79tzBM52TNf/PIT4q/fs5VXC4URQ=;
 b=Ad4bdztB+6RSMUiB5G5RSF0BCmoeh4mF13oR89PpLrEO1NZFapR8CGBBRIIU0/IFL7DcCcwwlbaky1x7vyXSEX0VtbRosX4JhllOIBl7wOzMz/BSLesxIOFh6tzq+1cxTFE3DypABHrLDbiPckZQ+cXO8CNBSiOdCzTRNxPRtv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZSUgcp6lqR5nBUD3uoluVJJpWGRKHvT9WGBsbTQAdTooiYqgerR+8b01AobpzM+oBYjgpHC4z+jnmJITtvaI0dg6EEWKlogRoIawDlGEwRqI8Ok5J95HECXMde8UfLWKxbGDDkJ3h/grRriFm1Ewft2reIVspDey+NC3v7vXobEnvKOo4ZulH1FqsXqSzPtWkJTO/vbDfmsCdUf0Yrj8kJ5s+djiXinegxUU+3GsgWQIDuy8pwegyEegW/4HWV3XVigWGDDEkR1HCWx5Tit9knxGe8zlZX5aZuzv+8Em1875V19PQOADGsVPE+oCLNftwAL2rn4cuTSk/hLzMiKoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtPTZHVQFJOOxgS79tzBM52TNf/PIT4q/fs5VXC4URQ=;
 b=oM8DBLMH0UcHk0UBfHHawUlYwMAnoZZs/ODEqVUNCHZA9gRpJ1lW0rquZmqhBLaIHG3CcWt5HyL8meAQuR1A1Rq+J/9vnLyBPsLyPxK2RM9gWWZinJ4XLuRJyNt2bldLNJnaeFTTNDXV/GIdeNXz7JPOvnV9kXx1nl9kVNIypQxpJJ2BkucYA+C7n8uYn63IlDriY2gWZbQ2iU18QkftPfU1y7GZAYcERLtn+Ixn7CrNfXwBsM2JAA2Ca41sslg+trVvFlikOvXMmo2A3wRuE4+4PQIcd5/iC5wEPQiSMWX5uV7332NAFyYoKX5pwmpvlUaFU/Zupu5WegHYoKhP8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtPTZHVQFJOOxgS79tzBM52TNf/PIT4q/fs5VXC4URQ=;
 b=Ad4bdztB+6RSMUiB5G5RSF0BCmoeh4mF13oR89PpLrEO1NZFapR8CGBBRIIU0/IFL7DcCcwwlbaky1x7vyXSEX0VtbRosX4JhllOIBl7wOzMz/BSLesxIOFh6tzq+1cxTFE3DypABHrLDbiPckZQ+cXO8CNBSiOdCzTRNxPRtv0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 19/23] libxl/arm: vIOMMU: Modify the partial device
 tree for iommus
Thread-Topic: [PATCH v3 19/23] libxl/arm: vIOMMU: Modify the partial device
 tree for iommus
Thread-Index: AQHcy1OBPTTxiIivxUiCAbiXnDP/YQ==
Date: Mon, 13 Apr 2026 14:41:13 +0000
Message-ID: <451B2915-2A12-435D-A3E4-7450ACA0DD64@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <801f1c90347d66ce4427b9c5986809a781d94081.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <801f1c90347d66ce4427b9c5986809a781d94081.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|PA4PR08MB6142:EE_|DU2PEPF00028D09:EE_|DB9PR08MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: 27418ce0-b937-43ab-8a2a-08de996adb28
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 6nMypYdApnWlGI4WohlXvocRwNxIlJ7vQ93S29PdkqsAf6FjMy9i37523SvXUklNyrJWkW8h8wfA7AIIpr06N8fozWD2B7BMEC0CsDvA8iI0Ru5mYJf3Xr8waHULBc1LcgF5d5ULr/QXvGZHOpCxKeI/u2vT3lPvNVEXQPOrX7kr1IhoFjlSZXmK75w+D1Le18Tv6fHMH/5Y/vwKe2YACbIDeCYG3VFdWFp4CF8svvlfAiXYbX55xLsuMqjLPnK6URBfMXLVK/+H0CsuK6dwFj97qtd7JmWG5hS7J96Db1w7D2ezlTZDJ51B7TUjk/8FhHq1Y6JK5/4qS3JnvTZ6XcQdvEi9IPLZ3nfqqReXbbUNC1Vgex1tH8wKz77PF9MKGKMgLShKSSyZ8W3ZMVyA6K+EfeZDCdPxyKsA/96wPLiaNfJTCES8w7zE5H8EMN1nu5/ZDorTDVWqRtMqvY1LQLD1WGUXK+FBE4pdFN/YfJYyFqTTXePpmyMt3Fy9qrJ/sOszkpv/z0FEUyv+W/tpoUBvYBbCzR3XnJzhqXV/vCNdYFHSJWLLAvyGAC7m8pviYEcodfbl8qlHWJUznJmZrQCw4PDH3MiAo3Gyg3isok6b2fEvaFRUoy0U6i/D7iVbo/PkTRvyLtNm9wQGiavtagKW/feOw7TtAy9ilgaBEF7lT94xejpu4BKPzBFOO0MNu30OqSU9fprgx9hCs0TH77wiFm4ogVDHyR/qPk1kMrjs33tudmbSQZdp6UHfjg4yxVbykbHwzj6AqhR6btAcNr5WK04W5ideXFsxWW2Hj7Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <28B7ABE7D069014E82B1BE9123E0F6C3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 C4bzQGx90OfQ5Xi1o9/4ITeoK0WTr055ZLZZOL7bBZLD2znAx8XqDWKCbh/MJBeD8KQdVTnuyCA88TVqdQameehcJ9fk8p7pFua34DHasNlFbjJ79oX/QRnAIsUPb2ykvvjyA0V0mkVBNZs2PCWtPubCWv4hkmU27ObYt+PXdDJiusJmA4vaqaB+A73Ag9dFi+ZMZUme5GE0uBDNQSH2hYk0bRMn/VLVR1b5Hu5snz0aVDFdy8iwFAP17amuJC2yLX5WVJX4j/PMWUCSZIgd46Gnm4tLIykuhQ/y0Lqme1lOS6PER2li2n2GXroQ3H94KMKS2c8SHanOueNGi6ybqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6142
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f822d434-1526-4383-ccef-08de996ab60f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700016|14060799003|376014|82310400026|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	ENFsH1sFwBvH5/3iX5fnTS8EMqRShC2vG8T40lNtSPUmhD9Tw38hEpppU+bFmy/gS7R3tjY6RgMQyUSPq3r/OWzBUNBsUayRkSX7Ym2kcN135sxGiWiCVHShFxMLDNLmovs/DXxqmXzm0ZumY1z0LILIb0dK44Ykden2rLUl0mq1qGpkFFxvz7ORZyg01Pk749v1/99JZHZK56DTrMLgBSd13laTQPxHO6HItm6pHLFmjwOulfZirrFb5UuIza0S99kvrKGWYXLAC0B2MllEnBcSVbrZFTEwmFPKiNPv4gkZzV/rsUA5WGQm3P3rRbdl/oJVITsVTp62E6d2WH2VruDFjsCMzdzyBd7nFI1FCpp+P7YBV12NbEIOQznmUJ1KBpke9HZ5cZwETpwPFQtCxHehOQp7XP70q9ElfGcxneYMzgy8SgontKTaSsVcG7ChgPKb/K0arqIRjv0LReUKv9mOF2cnQvtxfSvb07hd7DRkNklmeJSAsMQqFEkZFOScdfLMl3QixjYzVRm5XkPkzfub0ixW3cLTWvr8yHyMk5qR2bXSErnkSX6Wb+vRbaeKs6HuVQrTN8jWKlSsH/g8OS7/rSPe7i9S3Kwr3sEQQIqubcJAu/vl6jTew0jGUEhIw8SlUUdXb39CYbM7DlfGtd7gT64hKZCI3+k/krEbGccHok8gZjBhXF5SVUIH5Qulw208VUknOSCqGarp9xt6np3VaZLsPj7vaMt6fpLoOpNDC+7gDiSZWbisyZg8kbndKShTwEYU6D2heA3HRMFilQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(14060799003)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LxdozWUekax1OH07VuZzGCcZhsKAMntzajkXFWaHSaIibLZRlhCyUqZQnL9Nw84Cva0YELLx4RdTpp5AhJh8sgZrQiwdx6rToLkt9jAvlCFnbvqnxteIREYOK4Daq+kUDkRhLl1knljHGEGN8gBZo+nSLz/ZQ9n82RSRQsS3NIiWPvWZEuHP1ARtrfnrZLzQf+gQ/yGXGGhtyY9s5n2ETjd4R5oovPtzuWHzwqe3alUsdS5YLQw2vClCCeHX5o6lf81mk6RNGn4xpzRyiNhiD7QrM1l1bHMZ4Z92eViOYljpwtLWxfhav3GVvtbENLIgX9W0sgWaLzuElovUiPdMKCp1SzohX7AsIWLg+hEOOovTFQ7rEIb1QpKSoNW7B4SLZVvXK11SAFqNs526NUkds9adzn6MBzyRcUyLHWjZxCI1tyOsWHTF1VEg6R6vE7DR
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 14:42:15.4532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27418ce0-b937-43ab-8a2a-08de996adb28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7536
X-purgate-ID: tlsNG-16d1c6/1776091337-AD92A3D8-E73AD811/0/0
X-purgate-type: clean
X-purgate-size: 513
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:anthony.perard@vates.tech,m:jgross@suse.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email]
X-Rspamd-Queue-Id: 937B23ED69D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

> On 31 Mar 2026, at 02:52, Milan Djokic <milan_djokic@epam.com> wrote:
>=20
> From: Rahul Singh <rahul.singh@arm.com>
>=20
> To configure IOMMU in guest for passthrough devices, user will need to
> copy the unmodified "iommus" property from host device tree to partial
> device tree. To enable the dom0 linux kernel to confiure the IOMMU

Typo s/confiure/configure/

The rest looks ok to me

with that addressed:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca


