Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNWCH/7z/WlxlAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:32:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C110A4F7C08
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 16:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303675.1576933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMEi-00008i-JB; Fri, 08 May 2026 14:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303675.1576933; Fri, 08 May 2026 14:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLMEi-00005v-Fz; Fri, 08 May 2026 14:31:28 +0000
Received: by outflank-mailman (input) for mailman id 1303675;
 Fri, 08 May 2026 14:31:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wLMEg-00005p-K5
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 14:31:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLMEg-003HL7-0b
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 16:31:26 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fdf3b9-bab6-0a2a0a5309dd-0a2a4503d790-16
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:31:25 +0200
Received: from [52.101.83.21]
 (helo=GVXPR05CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69fdf3bc-672d-0a2a45030019-346553155a45-4
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 16:31:25 +0200
Received: from CWLP123CA0094.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::34)
 by DU0PR08MB7414.eurprd08.prod.outlook.com (2603:10a6:10:352::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Fri, 8 May
 2026 14:31:20 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:401:5b:cafe::c9) by CWLP123CA0094.outlook.office365.com
 (2603:10a6:401:5b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 14:31:19 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Fri, 8 May 2026 14:31:18 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by DU0PR08MB8345.eurprd08.prod.outlook.com (2603:10a6:10:40b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 14:30:15 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9891.008; Fri, 8 May 2026
 14:30:15 +0000
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
 b=FnjVv4Su5F6rH55wfX6KcZweMK/UnFbILLLOEco2aAN1VFkfjIkqLUpSXPgwjzdd2SipuEMStvWc3BTx1DqZ2QdhkqWduIAQ4RH/SpZshl3YtDcDJT+V/gpWcPq89l9sSbvpegPDLMLlo/qlqC+8swOU69KTblklF5bXyrEDubO+roqXWNJlbClqFNcHMu+ydZO9SJdiu2orth2pFmBCqAS0gwbRiPlF7TDrsjGSukikXGWkGCRzD1K55uQGRxBjp4+CWzMcmp9JOMy2QlBnwhKYz1fNpl+ckRmwZvXZ2Rdq+s7Z7HS1ALuwM4RFXwWzUWI5WZS/zsBjTvJkOTPO3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iKWRb5SMys4cCNq04uSSJ1M6DF+kI3YEVZCXIrJo5I=;
 b=nKMoMYMXn6WfMwxpFkLZhA2u5NE86TjrcDe7H0WqiOvqIbBMJ+ssXtjYZBzHJ2CWfR8glKd5Aw+wILtNlBUfcogqSuuXCessKxNHgiiV3laBv8aYaJB+OrLU5QZ5yGW2lTVfWU4idLYNnPoMPYu8d21QK4uWqJr0JMvSbNtat4b7Io7H+FRxr8kaR606MziGptnWSvpa/vpgAII4HVfXcDwkbxKeb720ML9g0jFfVFtTjKCyaR+rrC6mcylpCOrIHdpUTKN89iw3kWeDiqF/pnBw/qfC41DHAOh9ilSEJ363pDqPX3RSfyNlncE7rdJpvdI1paa2IIzhq8RZ86eXfA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iKWRb5SMys4cCNq04uSSJ1M6DF+kI3YEVZCXIrJo5I=;
 b=obehbobQd7c6hP7RLVwmje3Wio1JwFiyzUIGfOHsqv2XDB2FoPLdg8Z26I0Fx0keu/Kam1Eeb0UwZGoBZQMn2VB/gl6GPolY/Ak2TvghL9o2Fla6qz7pXbr12jyLEi1zEAfJqZfxMOHV4ADjeNI5fqqEC1+ccz9jbz9fmLnyz6c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6N7Kbymj45Oteag9NWPgvwGR12cgFxR4cCKyqhcXKmdhCk7QzOZdLkEr9pjgt7/8ehVqx/locHbMwBpygHkQkzbQIA/7Ims71k9otjAkB5i7tDdF8Kt19SnufZ3QPPrtgnw9QaKty0U1lVeYG2tKL/yj+sznORCHod3FE+h1dzPQP+CxmoqPboM5S0xz4dZEaKecoLdH3aIZkJrs2m3+hXbksMFTrKE+leR0nEdpwzvdBjPiAif9TKe33gAgPdfxRkLDQep3SVKmRkmOYVlT6kwmu9eLLZNP5fD3WXYbOypnpy7dn0xVpQC1p3gVRyAvFNX0Xz7FF3TBJosTYi4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iKWRb5SMys4cCNq04uSSJ1M6DF+kI3YEVZCXIrJo5I=;
 b=nYfUwfc/OUxPZ+gtS2o8j7D7yudLLqjMDSXNp5gaZGc4Pj0sqwo3DiHX3EOLNXcU2A9jgnw9C+GXDOiP7wK4YjN1cHDG8c2+neRYZ3+1Uqa/1Nw8gDfYbY5+HLBMObtSVt3H0mHqBcgxo3v9a0IO4ObijgZy6PdBSuL514ZKyqPEahf/Nci2X3pO3QPqZo+I0S82aRave/3HNnaFWSCkU7svpRgNREJLQsCm2IU2KGP7yqdevMcqQKnvibqquxVGtZqJuBd5OZR4L0ZCzMou4pkFFuTsXnb2H3nLYTxI+FCEIAE5IbFfwQ+ikCGOCi2t/euVToGTRJWyxPiQx9MNSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5iKWRb5SMys4cCNq04uSSJ1M6DF+kI3YEVZCXIrJo5I=;
 b=obehbobQd7c6hP7RLVwmje3Wio1JwFiyzUIGfOHsqv2XDB2FoPLdg8Z26I0Fx0keu/Kam1Eeb0UwZGoBZQMn2VB/gl6GPolY/Ak2TvghL9o2Fla6qz7pXbr12jyLEi1zEAfJqZfxMOHV4ADjeNI5fqqEC1+ccz9jbz9fmLnyz6c=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Mykola
 Kvach <mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<Rahul.Singh@arm.com>
Subject: Re: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Topic: [PATCH v8 13/13] xen/arm: Add support for system suspend
 triggered by hardware domain
Thread-Index: AQHc16717IQ0/wsQJ0u4S7T7zIC8eLX/7bkAgARRIwA=
Date: Fri, 8 May 2026 14:30:15 +0000
Message-ID: <A37EF531-9180-4410-8C01-0A591A10DC95@arm.com>
References: <cover.1775125380.git.mykola_kvach@epam.com>
 <9b0f8922cd33df2b8e8038d639c1b8d8d73ce401.1775125380.git.mykola_kvach@epam.com>
 <4977CF18-39CC-4CC0-936A-890BAE5E8615@arm.com>
 <CAGeoDV8WkRGubF0qEXd4+PsXuabz3914G7bTYxTbaxZ2DsnY6w@mail.gmail.com>
In-Reply-To:
 <CAGeoDV8WkRGubF0qEXd4+PsXuabz3914G7bTYxTbaxZ2DsnY6w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|DU0PR08MB8345:EE_|AMS1EPF00000094:EE_|DU0PR08MB7414:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e72159c-8899-4084-f6d2-08dead0e77ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original:
 UwmCmKIjQBnHVlbRryISiIeVsaSBh3xtTrcYhVJAS671b6jPUL2MzcCdBDSxkQSQFnjnkjAE8PIOmzNoz7A+4NfwN0s3uHY8WEQNxuOmS+xJa31dcCwkX4Q7XgpBfXxAmRDWI3WOt2K2SrS04YqMzq4bff1nxkNXJyRRprbi6NfIenrv2s8s7RNkNjAHI7cewvEt+Fa1AsFPEZ+nwj4rqIxTt1LVMv6SXtnxdNLPKGTgXHEW3xieJEPIx+sZ6WPclRwU1fAz1QT1OkUOF+bzC3MKBKNqc/mto3taXpj97PIaCyzuhtI1wcc9609rcXoDDpDGinCV2NjdUzLoIuomDUCf8J7OfVse96lSoijh5INsxZsaaVZyXFwMeL8WeB8EeCbpWHhXZmbbQXExb/FkDeJpnNjqxguOI3SJS3kwYZk8Lnnq311PGvEj9EztgLPzrXBs2zpJpSr8d4fVtenprr3RCplYj/Zan+ZXicEExwps8UpgSVLDy+7rYSj2oV0BOQbimDUZKLQyC6oQGzz/2MgjOtZCjP9FLs9yfELYuJTWSoZEGsRoA0VyZDNkXzmebT8uwGuGqC3AcmcVod1O25kbjieYrjjljVtfddmeAaH5SvQRZ7VA3/ALT9SS59Z7UH0ujEn5Hvxj6R6oUjIqIhxMpu7p2/v6IEBZgJ2tWRlDH/ep84BtrYOzYRC5uWw9PnRmltpKyXusQYg5i43qtsdfwhEtt5UKd1UM1i44blBbEMq0Odr92HfitINTyHC4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2756023018F6F14A879163FDE8E5B569@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 uN6KRtKbXAeXCvkPFFxHoV3Zh1c6Pv1FUC7ajZe9YnZGSh391lVHZHWbWB2oF7BHub2fUBHQ9dxy9/hBXIeVKsVcHtGX9fBBsy/chQruFS0/llLoBj3MT/l2Uj4NBF5BXnns1JqBrkds2/ss4l3mg9OFmYSdO/1ff3o3t/4Hw4P14cUazYXB7TkVOTi2yNvrJznDQjaJXFqnzM9hlLpMjWxRQT3PUvunaQA8IwZnmeA1aPaPq0rf6JvQhW1dnzytzk2q2RGf68LKZ9WMsL1TvuGhdFfdnNsA+sUhWc3vRzMDLsG7lsICzH68N1FjbDcy8HVqlavPqHDBqjQk7GjzIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8345
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	09eb5905-fea7-409d-0fcf-08dead0e520d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|14060799003|1800799024|82310400026|35042699022|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/Fisb4SyHRrB2ubw0R5nXlkaQEREHh1gr5ML9UBNlahFa+lNlIFP4RSsv9CbPUU7tVdLchoHQFry2IyPQZkmquterB+3n+Y9bp+GC50L4NdSqJbku7tis9kSOpKboC6FDKfaCQjrMlENJmXh3RjeJOCJSsvNNf99dRzIsFQ6IGdC6E24zMYOnwmcdR+rrrivP3GW5WTemVnfkXYVOU7yb+nz9CraWQx3ayDoICoHsJDm3JpM5aso2fqhOF33gd1sNHn0TpK9/XTACXgKsV7orTX0SzAZ8FpIlKTtqUU5WyblgVshJYqdu7yg5wXItDxLMOmUHdnELQqdPZrfmF+TDER5M9Qxby5c0Y65/uaS6Z6p/fSaXOgIxM4lvlnrnxutRT+aMeBwOLdhvjDfDEk3/udiBYreSWPemO4sKnaQc8DBmNqoST6j+/xmGDJPyGaUUnM7V0rzdMSvznJ3SVuwbGY1NpXF9mUVQwtglqfXU9KUdcQiFfJ/q6FP7oFE/te3wI+QR08jeOwISy4qHFqLWksYx8Z4UF/KVYhk5SYu0tPNH7VnSi7xcCXF8R/lCEXootB+fPj/y4o0PhJf6c4vOEEl69fbyBRyWWfXuTYhWJ58lFXUO/GrbrwqelS3sbXzcAmOOBAkCjq9CXnlTiPTl/7uuaVg4WGoOPhXw1X7nk8uNcGB2YOtH1WUiuOrJd8S4oEO9/FEAkpHxUB72wM9ydKfsvVjz2WZ7kbzC5aHy0w=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(14060799003)(1800799024)(82310400026)(35042699022)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KH+Dn1+JFATuQqkuP99BS7OR/JTQOJpsLUngWay+XPca8UDAjZTJWnyeGW11MVMJUq4iBBJxaj+sx4n0IOn0SRqHxPrILuYNgyIp/J0knHv6P2L5oMpWwQWA4DBvNVxp9FjJyfDz0tM3Y+fVUkrZiozHMXFezOHksZRE0FReA+XTd9Yu/If4SJsLrRNcbpi28bB94WYHLaJhgcb/riSEemPRmvMeSAlAKYGOy90ccMI4eF3vL2L0u8ZZOq5u188vOVByWRz/IE3cVx56sg2oLQnbbgJsg+6cy8SKpd50rElSs2IBw/SfbPm3ROMFzhCgakfec0GyUJUW4xdoPwPhm4mIpAHgB4ZSYqpfGmqwB7mM/UPE+vABak3IjtxbM4xfEEOLdjqIMDiiXCeX76mMOqJ3li3TACMnwRyZYqBLE49S3omdCMqNgZEiLmE/ubP6
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 14:31:18.6520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e72159c-8899-4084-f6d2-08dead0e77ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7414
X-purgate-ID: tlsNG-33051d/1778250685-41B92938-7E312B51/0/0
X-purgate-type: clean
X-purgate-size: 12338
X-Rspamd-Queue-Id: C110A4F7C08
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:Rahul.Singh@arm.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:dkim]
X-Rspamd-Action: no action

SGkgTXlrb2xhLA0KDQo+Pj4gKy8qIFhlbiBzdXNwZW5kLiBkYXRhIGlkZW50aWZpZXMgdGhlIGRv
bWFpbiB0aGF0IGluaXRpYXRlZCBzdXNwZW5kLiAqLw0KPj4+ICtzdGF0aWMgdm9pZCBzeXN0ZW1f
c3VzcGVuZCh2b2lkICpkYXRhKQ0KPj4+ICt7DQo+Pj4gKyAgICBpbnQgc3RhdHVzOw0KPj4+ICsg
ICAgdW5zaWduZWQgbG9uZyBmbGFnczsNCj4+PiArICAgIHN0cnVjdCBkb21haW4gKmQgPSAoc3Ry
dWN0IGRvbWFpbiAqKWRhdGE7DQo+Pj4gKw0KPj4+ICsgICAgQlVHX09OKHN5c3RlbV9zdGF0ZSAh
PSBTWVNfU1RBVEVfYWN0aXZlKTsNCj4+PiArDQo+Pj4gKyAgICBzeXN0ZW1fc3RhdGUgPSBTWVNf
U1RBVEVfc3VzcGVuZDsNCj4+PiArDQo+Pj4gKyAgICBwcmludGsoIlhlbiBzdXNwZW5kaW5nLi4u
XG4iKTsNCj4+PiArDQo+Pj4gKyAgICBmcmVlemVfZG9tYWlucygpOw0KPj4+ICsgICAgc2NoZWR1
bGVyX2Rpc2FibGUoKTsNCj4+PiArDQo+Pj4gKyAgICBzdGF0dXMgPSBjYW5fc3lzdGVtX3N1c3Bl
bmQoKTsNCj4+PiArICAgIGlmICggc3RhdHVzICkNCj4+PiArICAgIHsNCj4+PiArICAgICAgICBz
eXN0ZW1fc3RhdGUgPSBTWVNfU1RBVEVfcmVzdW1lOw0KPj4+ICsgICAgICAgIGdvdG8gcmVzdW1l
X3NjaGVkdWxlcjsNCj4+IA0KPj4gV2hlbiB3ZSBoYXZlIGFuIGVycm9yIGFuZCB3ZSBnZXQgdGhl
IHJlc3VtZV9zY2hlZHVsZXIgcGF0aCwgd2UgYXBwbHkgYmFjayB0aGUNCj4+IGNvbnRleHQgb2Yg
dGhlIGd1ZXN0IHNhdmVkIHByZXZpb3VzbHkgaW4gZG9fcHNjaV8xXzBfc3lzdGVtX3N1c3BlbmQo
KSwgc28gYW0gSQ0KPj4gY29ycmVjdCBzYXlpbmcgdGhlIGd1ZXN0IHdvbuKAmXQgZ2V0IGFueSBQ
U0NJIGVycm9yIGJhY2sgYW5kIHdlIHJlc3VtZSB0aGUgZ3Vlc3QNCj4+IGZyb20gdGhlIGd1ZXN0
IHJlc3VtZSBlbnRyeXBvaW50Pw0KPj4gDQo+PiBJbiBjYXNlLCBzaG91bGQgd2UgaGF2ZSBhIGRp
ZmZlcmVudCBwYXRoIHRoYXQgcmV0dXJucyBhIFBTQ0kgZXJyb3IgKFBTQ0lfKikgaW50byB0aGUg
Z3Vlc3QNCj4+IHgwLCBhbmQgc2tpcHMgdGhlIGNvbnRleHQgcmVzdG9yZT8NCj4gDQo+IFlvdSBh
cmUgcmlnaHQgYWJvdXQgdGhlIGN1cnJlbnQgY29udHJvbCBmbG93OiBvbmNlIHRoZSB2aXJ0dWFs
DQo+IFNZU1RFTV9TVVNQRU5EIHJlcXVlc3QgaGFzIGJlZW4gYWNjZXB0ZWQgYW5kIHRoZSBkb21h
aW4gaGFzIGJlZW4gcGFya2VkLCBhDQo+IGxhdGVyIGZhaWx1cmUgaW4gdGhlIFhlbi13aWRlIHN1
c3BlbmQgcGF0aCByZXN1bWVzIHRoZSBkb21haW4gdGhyb3VnaCB0aGUgbm9ybWFsDQo+IGRvbWFp
biByZXN1bWUgcGF0aCwgcmF0aGVyIHRoYW4gcmV0dXJuaW5nIGEgUFNDSSBlcnJvciBmcm9tIHRo
ZSBvcmlnaW5hbCBjYWxsLg0KPiANCj4gVGhpcyBpcyBpbnRlbnRpb25hbCBpbiB0aGUgY3VycmVu
dCBkZXNpZ24uIFRoZSB2aXJ0dWFsIFBTQ0kgU1lTVEVNX1NVU1BFTkQNCj4gcGF0aCBwYXJrcyB0
aGUgZG9tYWluIGFuZCBzYXZlcyBpdHMgcmVzdW1lIGNvbnRleHQuIFRoZSBhY3R1YWwgWGVuLXdp
ZGUgaG9zdA0KPiBzdXNwZW5kIGlzIGEgc2VwYXJhdGUgc3RlcCB0aGF0IGlzIGF0dGVtcHRlZCBv
bmx5IGFmdGVyIGFsbCBkb21haW5zIGFyZQ0KPiBzdXNwZW5kZWQuDQo+IA0KPiBTbyBhIGZhaWx1
cmUgaW4gdGhlIGxhdGVyIFhlbi13aWRlIHN1c3BlbmQgc3RlcCBpcyB0cmVhdGVkIGFzIGFuIGFi
b3J0IG9mIHRoZQ0KPiBob3N0IHN1c3BlbmQgYXR0ZW1wdCBhZnRlciB0aGUgZG9tYWluIHN1c3Bl
bmQgd2FzIGFscmVhZHkgYWNjZXB0ZWQuIFRoZSBkb21haW4NCj4gaXMgdGhlbiByZXN1bWVkIHRo
cm91Z2ggdGhlIGV4aXN0aW5nIGRvbWFpbiByZXN1bWUgcGF0aCwgc2ltaWxhcmx5IHRvIHRoZQ0K
PiB0b29sc3RhY2sveGwgc3VzcGVuZC1yZXN1bWUgZmxvdywgcmF0aGVyIHRoYW4gYnkgcmUtZW50
ZXJpbmcgdGhlIGd1ZXN0IFBTQ0kNCj4gY2FsbCBwYXRoIGFuZCBtb2RpZnlpbmcgdGhlIHNhdmVk
IHZDUFUgY29udGV4dCBhZ2Fpbi4NCj4gDQo+IEkgYWdyZWUgdGhpcyBkZXNpZ24gaXMgbm90IG9i
dmlvdXMgZnJvbSB0aGUgcGF0Y2guIEkgd2lsbCBjbGFyaWZ5IHRoZSBjb21taXQNCj4gbWVzc2Fn
ZSBhbmQgY29tbWVudHMuIElmIHlvdSBvciB0aGUgbWFpbnRhaW5lcnMgdGhpbmsgdGhhdCBmYWls
dXJlcyBiZWZvcmUgdGhlDQo+IHBoeXNpY2FsIFNZU1RFTV9TVVNQRU5EIGNhbGwgc3VjY2VlZHMg
c2hvdWxkIGJlIHJlcG9ydGVkIGJhY2sgdGhyb3VnaCB0aGUNCj4gb3JpZ2luYWwgdmlydHVhbCBQ
U0NJIGNhbGwsIHRoZW4gdGhpcyB3b3VsZCByZXF1aXJlIGEgZGlmZmVyZW50IGZsb3cuIEkgd2Fz
DQo+IHRyeWluZyB0byBhdm9pZCB0aGF0IGV4dHJhIGNvbXBsZXhpdHkgaW4gdGhpcyBzZXJpZXMu
DQoNCk9rIEkgdW5kZXJzdGFuZCwgSeKAmW0gd29uZGVyaW5nIGlmIGluc2lkZSBkb19wc2NpXzFf
MF9zeXN0ZW1fc3VzcGVuZCgpIHdlIGNvdWxkIGRvIHNvbWV0aGluZw0KbGlrZToNCg0KW+KApl0N
CmlmICggaXNfY29udHJvbF9kb21haW4oZCkgJiYgIW90aGVyX2RvbWFpbnNfcmVhZHlfZm9yX3N1
c3BlbmQoZCkgKQ0KICAgIHJldHVybiBQU0NJX0RFTklFRDsNCg0KW+KApl0NCg0KQnV0IEnigJlt
IG9rIGFsc28gdG8gb25seSBkb2N1bWVudCB0aGlzIGJlaGF2aW91ci4NCg0KDQo+Pj4gDQo+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cHNjaS5jIGIveGVuL2FyY2gvYXJtL3Zwc2NpLmMN
Cj4+PiBpbmRleCBiZDg3ZWM0MzBkLi44ZmI5MTcyMTg2IDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9h
cmNoL2FybS92cHNjaS5jDQo+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3Zwc2NpLmMNCj4+PiBAQCAt
NSw2ICs1LDcgQEANCj4+PiANCj4+PiAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4NCj4+PiAjaW5j
bHVkZSA8YXNtL2RvbWFpbi5oPg0KPj4+ICsjaW5jbHVkZSA8YXNtL3N1c3BlbmQuaD4NCj4+PiAj
aW5jbHVkZSA8YXNtL3ZnaWMuaD4NCj4+PiAjaW5jbHVkZSA8YXNtL3Zwc2NpLmg+DQo+Pj4gI2lu
Y2x1ZGUgPGFzbS9ldmVudC5oPg0KPj4+IEBAIC0yMzIsOCArMjMzLDcgQEAgc3RhdGljIGludDMy
X3QgZG9fcHNjaV8xXzBfc3lzdGVtX3N1c3BlbmQocmVnaXN0ZXJfdCBlcG9pbnQsIHJlZ2lzdGVy
X3QgY2lkKQ0KPj4+ICAgIGlmICggaXNfNjRiaXRfZG9tYWluKGQpICYmIGlzX3RodW1iICkNCj4+
PiAgICAgICAgcmV0dXJuIFBTQ0lfSU5WQUxJRF9BRERSRVNTOw0KPj4+IA0KPj4+IC0gICAgLyog
U1lTVEVNX1NVU1BFTkQgaXMgbm90IHN1cHBvcnRlZCBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiB5
ZXQgKi8NCj4+PiAtICAgIGlmICggaXNfaGFyZHdhcmVfZG9tYWluKGQpICkNCj4+PiArICAgIGlm
ICggIUlTX0VOQUJMRUQoQ09ORklHX1NZU1RFTV9TVVNQRU5EKSAmJiBpc19oYXJkd2FyZV9kb21h
aW4oZCkgKQ0KPj4+ICAgICAgICByZXR1cm4gUFNDSV9OT1RfU1VQUE9SVEVEOw0KPj4+IA0KPj4+
ICAgIC8qIEVuc3VyZSB0aGF0IGFsbCBDUFVzIG90aGVyIHRoYW4gdGhlIGNhbGxpbmcgb25lIGFy
ZSBvZmZsaW5lICovDQo+Pj4gQEAgLTI2Niw2ICsyNjYsOSBAQCBzdGF0aWMgaW50MzJfdCBkb19w
c2NpXzFfMF9zeXN0ZW1fc3VzcGVuZChyZWdpc3Rlcl90IGVwb2ludCwgcmVnaXN0ZXJfdCBjaWQp
DQo+Pj4gICAgICAgICAgICAiU1lTVEVNX1NVU1BFTkQgcmVxdWVzdGVkLCBlcG9pbnQ9JSMiUFJJ
cmVnaXN0ZXIiLCBjaWQ9JSMiUFJJcmVnaXN0ZXIiXG4iLA0KPj4+ICAgICAgICAgICAgZXBvaW50
LCBjaWQpOw0KPj4+IA0KPj4+ICsgICAgaWYgKCBpc19jb250cm9sX2RvbWFpbihkKSApDQo+PiAN
Cj4+IFdoeSBpc19jb250cm9sX2RvbWFpbigpIGhlcmUgYW5kIG5vdCBpc19oYXJkd2FyZV9kb21h
aW4oKSA/DQo+IA0KPiBUaGUgdXNlIG9mIGlzX2NvbnRyb2xfZG9tYWluKCkgaXMgaW50ZW50aW9u
YWwuDQo+IA0KPiBUaGUgaW50ZW5kZWQgbW9kZWwgaXMgdGhhdCBYZW4td2lkZSBob3N0IHN1c3Bl
bmQgaXMgb3JjaGVzdHJhdGVkIGJ5IHRoZQ0KPiBwcml2aWxlZ2VkIG1hbmFnZW1lbnQvY29udHJv
bCBkb21haW4uIFRoZSBjb250cm9sIGRvbWFpbiBjb29yZGluYXRlcyB0aGUNCj4gdG9vbHN0YWNr
IHNpZGUsIGFza3Mgb3RoZXIgZG9tYWlucyB0byBlbnRlciBzdXNwZW5kLCBhbmQgdGhlbiBpc3N1
ZXMgdGhlIGZpbmFsDQo+IFNZU1RFTV9TVVNQRU5EIHJlcXVlc3QgdG8gWGVuLg0KPiANCj4gVGhp
cyBkb2VzIG5vdCBoYXZlIHRvIGJlIHRoZSBzYW1lIGVudGl0eSBhcyB0aGUgaGFyZHdhcmUgZG9t
YWluLiBJZiB0aGUNCj4gaGFyZHdhcmUgZG9tYWluIGlzIHNlcGFyYXRlLCBpdCBpcyBvbmUgb2Yg
dGhlIGRvbWFpbnMgdGhhdCB0aGUgY29udHJvbCBkb21haW4NCj4gcGFya3MgYmVmb3JlIHRoZSBm
aW5hbCBob3N0IHN1c3BlbmQgc3RlcC4NCj4gDQo+IFRoZSBod2RvbS1zcGVjaWZpYyBjaGVja3Mg
aW4gdGhpcyBwYXRjaCBoYXZlIGEgZGlmZmVyZW50IHB1cnBvc2U6IHRoZXkgYXZvaWQNCj4gdGhl
IG9sZCBod2RvbV9zaHV0ZG93bigpIHBhdGggZm9yIFNIVVRET1dOX3N1c3BlbmQgYW5kIGFsbG93
IHRoZSBoYXJkd2FyZQ0KPiBkb21haW4gdG8gYmUgcGFya2VkIGFzIHBhcnQgb2YgdGhlIHN1c3Bl
bmQgc2VxdWVuY2UuIFRoZXkgZG8gbm90IGRlZmluZSB0aGUNCj4gcG9saWN5IGZvciB3aG8gaXMg
YWxsb3dlZCB0byB0cmlnZ2VyIFhlbi13aWRlIGhvc3Qgc3VzcGVuZC4NCj4gDQo+IFRoYXQgc2Fp
ZCwgdGhpcyBwb2xpY3kgbWF5IG5vdCBiZSBvcHRpbWFsIGZvciBhbGwgY29uZmlndXJhdGlvbnMs
IGVzcGVjaWFsbHkNCj4gd2hlbiB0aGUgY29udHJvbCBhbmQgaGFyZHdhcmUgZG9tYWluIHJvbGVz
IGFyZSBzcGxpdC4gSSB3b3VsZCBhcHByZWNpYXRlIHlvdXINCj4gdmlldywgYXMgd2VsbCBhcyB0
aGUgbWFpbnRhaW5lcnMnIHZpZXdzLCBvbiB3aGV0aGVyIHRoZSB0cmlnZ2VyIHNob3VsZCByZW1h
aW4NCj4gY29udHJvbC1kb21haW4gYmFzZWQsIGJlIHRpZWQgdG8gdGhlIGhhcmR3YXJlIGRvbWFp
biBpbnN0ZWFkLCBvciBiZSBleHByZXNzZWQNCj4gdGhyb3VnaCBhIHNlcGFyYXRlIGhvc3Qtc3Vz
cGVuZCBjYXBhYmlsaXR5L2hlbHBlci4NCg0KSW4gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZCB0aXRs
ZSBJIHNhdyBIVyBkb21haW4sIHNvIG1heWJlIHRoZSBjb21taXQgc2hvdWxkIGJlIHVwZGF0ZWQN
CnRvIHNheSBjb250cm9sIGRvbWFpbiBpbnN0ZWFkPw0KDQpBdCB0aGlzIHBvaW50IGhvd2V2ZXIg
SeKAmW0gd29uZGVyaW5nIGFib3V0IHRoaXMgY29kZSBhYm92ZToNCmBgYA0KICAgIGlmICggIUlT
X0VOQUJMRUQoQ09ORklHX1NZU1RFTV9TVVNQRU5EKSAmJiBpc19oYXJkd2FyZV9kb21haW4oZCkg
KQ0KICAgICAgICByZXR1cm4gUFNDSV9OT1RfU1VQUE9SVEVEOw0KYGBgDQphbmQgaW4gZG9fcHNj
aV8xXzBfZmVhdHVyZXMoKSwgc2hvdWxkbuKAmXQgd2UgdXNlIGNvbnNpc3RlbnRseSBpc19jb250
cm9sX2RvbWFpbigpPw0KDQo+IA0KPj4gDQo+Pj4gKyAgICAgICAgaG9zdF9zeXN0ZW1fc3VzcGVu
ZChkKTsNCj4+PiArDQo+Pj4gICAgcmV0dXJuIHJjOw0KPj4+IH0NCj4+PiANCj4+PiBAQCAtMjkw
LDcgKzI5MywxMCBAQCBzdGF0aWMgaW50MzJfdCBkb19wc2NpXzFfMF9mZWF0dXJlcyh1aW50MzJf
dCBwc2NpX2Z1bmNfaWQpDQo+Pj4gICAgICAgIHJldHVybiAwOw0KPj4+ICAgIGNhc2UgUFNDSV8x
XzBfRk4zMl9TWVNURU1fU1VTUEVORDoNCj4+PiAgICBjYXNlIFBTQ0lfMV8wX0ZONjRfU1lTVEVN
X1NVU1BFTkQ6DQo+Pj4gLSAgICAgICAgcmV0dXJuIGlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZW50
LT5kb21haW4pID8gUFNDSV9OT1RfU1VQUE9SVEVEIDogMDsNCj4+PiArICAgICAgICBpZiAoIElT
X0VOQUJMRUQoQ09ORklHX1NZU1RFTV9TVVNQRU5EKSB8fA0KPj4+ICsgICAgICAgICAgICAgIWlz
X2hhcmR3YXJlX2RvbWFpbihjdXJyZW50LT5kb21haW4pICkNCj4+IA0KPj4gU2hvdWxkIHRoaXMg
aGF2ZSBhbHNvIHRoZSBjb25kaXRpb24gdGhhdCDigJxpcyBoYXJkd2FyZSBkb21haW4gYW5kIHBz
Y2lfdmVyID49IFBTQ0lfVkVSU0lPTigxLCAwKeKAnT8NCj4+IE90aGVyd2lzZSBpZiB0aGUgaG9z
dCBtYWNoaW5lIGRvZXN0buKAmXQgc3VwcG9ydCBQU0NJIDEuMCB3ZSB3b3VsZCByZXR1cm4gT0sg
aGVyZSBidXQgdGhlIGNhbGwgd291bGQNCj4+IGZhaWwgbGF0ZXIgaW4gY2FsbF9wc2NpX3N5c3Rl
bV9zdXNwZW5kKCk/DQo+IA0KPiBHb29kIHBvaW50Lg0KPiANCj4gSSBhZ3JlZSB0aGF0LCBmb3Ig
dGhlIGRvbWFpbiBhbGxvd2VkIHRvIHRyaWdnZXIgWGVuLXdpZGUgc3VzcGVuZCwgWGVuIHNob3Vs
ZA0KPiBub3QgYWR2ZXJ0aXNlIFNZU1RFTV9TVVNQRU5EIGlmIHRoZSBob3N0IHN1c3BlbmQgcGF0
aCBjYW5ub3QgYmUgdXNlZC4NCj4gDQo+IEkgdGhpbmsgdGhpcyBzaG91bGQgYmUgY2hlY2tlZCBh
cyBhbiBleHBsaWNpdCBob3N0IFNZU1RFTV9TVVNQRU5EIGNhcGFiaWxpdHksDQo+IHJhdGhlciB0
aGFuIG9ubHkgYXMgcHNjaV92ZXIgPj0gUFNDSV9WRVJTSU9OKDEsIDApLiBUaGUgc2FtZSBjYXBh
YmlsaXR5IGNoZWNrDQo+IGFsc28gbmVlZHMgdG8gYmUgZW5mb3JjZWQgaW4gdGhlIGFjdHVhbCBT
WVNURU1fU1VTUEVORCBoYW5kbGVyIGJlZm9yZSBwYXJraW5nDQo+IHRoZSBkb21haW4sIGJlY2F1
c2UgYSBjYWxsZXIgbWF5IGludm9rZSBTWVNURU1fU1VTUEVORCBkaXJlY3RseSB3aXRob3V0IGZp
cnN0DQo+IHF1ZXJ5aW5nIFBTQ0lfRkVBVFVSRVMuDQo+IA0KPiBGb3Igb3JkaW5hcnkgZ3Vlc3Rz
LCB0aGUgcGh5c2ljYWwgUFNDSSB2ZXJzaW9uIGlzIG5vdCByZWxldmFudCBiZWNhdXNlIHRoZXkN
Cj4gY2Fubm90IHRyaWdnZXIgaG9zdCBzdXNwZW5kOyB0aGVpciBTWVNURU1fU1VTUEVORCBwYXRo
IGlzIHZpcnR1YWwuDQo+IA0KPiBJIHdpbGwgbWFrZSB0aGlzIGNvbnNpc3RlbnQgaW4gdjk6IFBT
Q0lfRkVBVFVSRVMgd2lsbCBhZHZlcnRpc2UgU1lTVEVNX1NVU1BFTkQNCj4gZm9yIHRoZSBob3N0
LXN1c3BlbmQtdHJpZ2dlcmluZyBkb21haW4gb25seSB3aGVuIHRoZSBob3N0IFNZU1RFTV9TVVNQ
RU5EIGJhY2tlbmQNCj4gaXMgYXZhaWxhYmxlLCBhbmQgdGhlIGFjdHVhbCBTWVNURU1fU1VTUEVO
RCBwYXRoIHdpbGwgZW5mb3JjZSB0aGUgc2FtZSBjaGVjay4NCg0Kb2sNCg0KPj4+IA0KPj4+IGRp
ZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYw0KPj4+IGluZGV4IDIyZDMwNmQwY2IuLjQ1ZjI5ZWY4
ZWMgMTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUuYw0K
Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LmMNCj4+PiBAQCAtMjk0
Nyw2ICsyOTQ3LDEzIEBAIHN0YXRpYyB2b2lkIGFybV9zbW11X2lvbW11X2RvbWFpbl90ZWFyZG93
bihzdHJ1Y3QgZG9tYWluICpkKQ0KPj4+IHhmcmVlKHhlbl9kb21haW4pOw0KPj4+IH0NCj4+PiAN
Cj4+PiArI2lmZGVmIENPTkZJR19TWVNURU1fU1VTUEVORA0KPj4+ICtzdGF0aWMgaW50IGFybV9z
bW11X3N1c3BlbmQodm9pZCkNCj4+PiArew0KPj4+ICsgcmV0dXJuIC1FTk9TWVM7DQo+Pj4gK30N
Cj4+PiArI2VuZGlmDQo+PiANCj4+IE1heWJlIHdlIHdhbnQgdG8gZ2F0ZSB0aGUgZmVhdHVyZSBh
bHNvIHRvICFDT05GSUdfQVJNX1NNTVUgPyBJIHdvdWxkIHdhaXQgZm9yIHRoZSBtYWludGFpbmVy
cw0KPj4gdmlldyBvbiB0aGlzLg0KPiANCj4gSSBmZWVsIHRoYXQgZ2F0aW5nIHRoaXMgc3RyaWN0
bHkgb24gIUNPTkZJR19BUk1fU01NVSBtaWdodCBub3QgYmUgdGhlIG1vc3QNCj4gb3B0aW1hbCBh
cHByb2FjaCBoZXJlLg0KPiANCj4gQ09ORklHX0FSTV9TTU1VIGlzIGEgYnVpbGQtdGltZSBvcHRp
b24gYW5kIGRvZXMgbm90IG1lYW4gdGhhdCBhbiBvbGQgU01NVXYxL3YyDQo+IGRldmljZSBpcyBh
Y3R1YWxseSBwcmVzZW50LiBVc2luZyBpdCB3b3VsZCBkaXNhYmxlIHN5c3RlbSBzdXNwZW5kIGV2
ZW4gb24NCj4gcGxhdGZvcm1zIHdoZXJlIG9ubHkgU01NVXYzIGlzIHVzZWQsIGJlY2F1c2UgQ09O
RklHX0FSTV9TTU1VIGlzIGVuYWJsZWQgYnkNCj4gZGVmYXVsdCBmb3IgQXJtLg0KPiANCj4gVGhl
IGNvbmRpdGlvbiBzaG91bGQgYmUgcnVudGltZS1iYXNlZDogd2hldGhlciB0aGUgYWN0aXZlL3By
b2JlZCBJT01NVSBkZXZpY2VzDQo+IGhhdmUgc3lzdGVtIHN1c3BlbmQvcmVzdW1lIHN1cHBvcnQu
IEZvciB0aGUgb2xkIEFSTSBTTU1VIGRyaXZlciB0aGlzIGlzIG5vdA0KPiBpbXBsZW1lbnRlZCB0
b2RheSwgc28gYSBwbGF0Zm9ybSB3aXRoIGFuIFNNTVV2MS92MiBpbnN0YW5jZSBzaG91bGQgbm90
IGV4cG9zZQ0KPiBvciBhdHRlbXB0IGhvc3Qgc3VzcGVuZC4NCj4gDQo+IEkgdGhpbmsgd2Ugc2hv
dWxkIGhhbmRsZSB0aGlzIGJ5IHRyYWNraW5nIHdoZXRoZXIgYW55IG9sZCBBUk0gU01NVXYxL3Yy
IGRldmljZQ0KPiB3YXMgYWN0dWFsbHkgcHJvYmVkLCBvciBieSBhZGRpbmcgYSBnZW5lcmljIElP
TU1VIHN1c3BlbmQgY2FwYWJpbGl0eSBjaGVjay4gVGhlbg0KPiB0aGUgaG9zdCBzdXNwZW5kIGF2
YWlsYWJpbGl0eSBjaGVjayBjYW4gcmVqZWN0IHN5c3RlbSBzdXNwZW5kIG9ubHkgd2hlbiBzdWNo
IGFuDQo+IHVuc3VwcG9ydGVkIElPTU1VIGlzIHByZXNlbnQsIGluc3RlYWQgb2YgZGlzYWJsaW5n
IHRoZSBmZWF0dXJlIGZvciBhbGwNCj4gQXJtIGJ1aWxkcw0KPiB3aXRoIENPTkZJR19BUk1fU01N
VSBlbmFibGVkLg0KPiANCj4gSSB3b3VsZCBiZSBpbnRlcmVzdGVkIHRvIGhlYXIgaWYgeW91IG9y
IHRoZSBtYWludGFpbmVycyBzZWUgYSBiZXR0ZXIgd2F5IHRvDQo+IGV4cHJlc3MgdGhpcyBjYXBh
YmlsaXR5Lg0KDQpvaywgbGV04oCZcyBhZGRyZXNzIEphbiBjb21tZW50IG5vdyBhbmQgd2UgY2Fu
IHNlZSB3aGF0IHRoZSBtYWludGFpbmVycyB0aGluayBhYm91dCB0aGlzLg0KDQpDaGVlcnMsDQpM
dWNhDQoNCg0K

