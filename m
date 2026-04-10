Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO+SHsgE2WnolAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:10:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B5B3D87CE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 16:10:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279150.1563711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBCYN-00031G-Bo; Fri, 10 Apr 2026 14:09:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279150.1563711; Fri, 10 Apr 2026 14:09:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBCYN-0002zo-8B; Fri, 10 Apr 2026 14:09:47 +0000
Received: by outflank-mailman (input) for mailman id 1279150;
 Fri, 10 Apr 2026 14:09:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wBCYM-0002zi-G1
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 14:09:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBCYL-00CQXV-Rr
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 16:09:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d9049a-5cb7-0a2a0a5109dd-0a2a4501a578-30
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:09:45 +0200
Received: from [40.107.159.65]
 (helo=OSPPR02CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d904a7-6fc9-0a2a45010019-286b9f412e0c-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 16:09:44 +0200
Received: from CWLP123CA0025.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:58::13)
 by PAWPR08MB8791.eurprd08.prod.outlook.com (2603:10a6:102:334::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 14:09:40 +0000
Received: from AMS1EPF00000044.eurprd04.prod.outlook.com
 (2603:10a6:401:58:cafe::ac) by CWLP123CA0025.outlook.office365.com
 (2603:10a6:401:58::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 14:09:38 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000044.mail.protection.outlook.com (10.167.16.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Fri, 10 Apr 2026 14:09:38 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS8PR08MB6200.eurprd08.prod.outlook.com (2603:10a6:20b:292::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.42; Fri, 10 Apr
 2026 14:08:34 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 14:08:33 +0000
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
 b=gR5zBb9RQcxJhUs4crC2MPrOmYqJ+stSrP9ZPmymbAclULOHZkUyZtiNnNZscs9bv446i60Bzzz/JuqNMjarbvrqNWaSgk2yZ92mmSo8233bEWPCIF6XSFRWO8cjM0yZMYC00v5/TQsyU1ONdRjsufWesIKNcnqVL2yhmgwc5LTZaF2BOmstaDU1QcOcronuxnOv2Nk7A6Izrh/Dnv2ez3NA4Ecxe0WBthBuoJCqdIiXg6y8ZkTGXD5Df+D45FHr6NZswWjSAQELhdiqDF2cCtqmsQ4s9xTlNkjvvSo37xC3Q/DlbmCsyeyCuYs1uUEu3WbPjoAM0XT6Rx3qSbo5ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFxAov+Q1mrSh40X0k685aBU8TJe9+sKbdbQ2s/UYDY=;
 b=n9I73smWOMpwOMnTY5QQnhnA7JtFVF9q8y2otoj1q7LjLlOGBxELujrLVGpd01hNsZ/0k5BHg0Qi7tDl9RwQB8eIVjObrL1LXneXGrV3XaraRQU9PNKeKnkCQCUQvCxB8QEYAd9pbT8apkMv4ThTHYu+1yqxcSxfiNCTUgrzqH6ZjMV40lWtoE8Zpsl8twApODoh6+nXI6ta9974RLp9lRNya7hpssKhXjGmP8pCJgjq8RPN+Czt1N76cqH3CG0HgLHWVybomuP6aGWYRzH5LIb/ME+C1sfIvq/YBV6n71n8ftFRhqhscmH0jMpSrm14LbML2oF4bAzutSKwMkrw2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFxAov+Q1mrSh40X0k685aBU8TJe9+sKbdbQ2s/UYDY=;
 b=U5nrlF1jH5f+a3vabUsvl08XIDPMcmDC1WsoZlLdB4QTxH9sQzmYHcmhAdP4XJahV+ZaBujpsma0WQrJMq5YrJA5Ea3/CdRrMMzLOYLt7pKXM7dawpG45+UjnCbOiK60pRrstIVXgkvAdk0IERLeXuV1Icw3cFVmd8viMeiV9Rs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gz0Vl4GiS6dmoXBND1No/A5ruwM3A6fHeXergbRzxWsywhn5+RCkNGA0SblxmcI4TTmvdnRG+UwalnvsklkE7B3VzbR9VCYnWLpTx5Lq5AJMlTzyu2snG7OiWDQ5+BpcTm6c4FeO2llqihE/uX2LhxC0D16C7/BUp3C/c4WAxV6Xb1sSTYF4xuOx9voxa2I3+U7F9eghlcamPgMnJdKvIerAYhzj55FzT+IIKzvgz8hKgIuqzSi6+hw2ZzHoqjMRifI727of9eYyyuRgWTj44iA+4ct14TRl8f1B5V6E2PyR4QEjy1dPWDY8xhCibVr6il7whYWDgCQzuQCr5AIwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFxAov+Q1mrSh40X0k685aBU8TJe9+sKbdbQ2s/UYDY=;
 b=MOMZwx+dvRs6sfwttVV7KQ/0zeMlUzTxTXKx+r4tHGF81q2BJ9TSHfWsD3gVp/PgqIl4yn+Zidw0nmak09icEZNURDUrJyjaqpz01hiLXImxx09l5RoWungaxkVeAZjnYY2aJe2F5PpFayTlGwJ9pK4y2my4Y3UMjCTtmUCb0W6xavdYkZ0Kk9Jj019x6OpxS2MOmZQxnxsdk4EcFZs8pMMSdkgDznSbbKNi81g3yj+I/go8Rszcudolt3mNlAh4zdfaTn0C1pRY15FuV7z1bYs8FlAXnyHYtB/HMZKsqf5T7REmQG/BIlOqzz/+11/Wqc2mzuXuUZfOuEMmYOnu2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFxAov+Q1mrSh40X0k685aBU8TJe9+sKbdbQ2s/UYDY=;
 b=U5nrlF1jH5f+a3vabUsvl08XIDPMcmDC1WsoZlLdB4QTxH9sQzmYHcmhAdP4XJahV+ZaBujpsma0WQrJMq5YrJA5Ea3/CdRrMMzLOYLt7pKXM7dawpG45+UjnCbOiK60pRrstIVXgkvAdk0IERLeXuV1Icw3cFVmd8viMeiV9Rs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Anthony PERARD <anthony.perard@vates.tech>, Nick
 Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>, Juergen
 Gross <jgross@suse.com>
Subject: Re: [PATCH v3 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Topic: [PATCH v3 06/23] xen/domctl: Add XEN_DOMCTL_CONFIG_VIOMMU_* and
 viommu config param
Thread-Index: AQHcyPOEOpjixhIB40qHeKootzCrNQ==
Date: Fri, 10 Apr 2026 14:08:33 +0000
Message-ID: <A0DDCB63-B8E4-47DA-BD68-9A5D06F7C8F2@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <5bcbeb1d614be413c13196a38d13eb3de5c549e4.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <5bcbeb1d614be413c13196a38d13eb3de5c549e4.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS8PR08MB6200:EE_|AMS1EPF00000044:EE_|PAWPR08MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 33795c5b-b7bb-4b79-ef3e-08de970acd4f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 UQd/W1hn1uZ8+keFrW3oHhwuT6bhqMm46ovlWyn3o1w0TjYRAJQSsnzlo2kAiEmA/OHiPtKo7QYw9iQPK3/aGpn6X2AC6HIj5OBZdhuStSE6M3OVpnUDpBbHF8n2XlYe+jJYRnbfHxP+UR07MhlZCkSwt3+M+pgrgwm/um1xDOqk7ow0NoboY52UbwwTgxkYaT3BEZCxWxXLD3HznlwfI7aztdjd5hM6sScJK5/Kl0e8Jr/IJIwL3K0qdnGlGSzp/8r/zRKosgOfTOvUfr+E1wjJrlx5TDKQhpEUb68z28SoRQRnkN0zFqLL9WYZ6XVLX6QS8dpL0Goa5eX6fIGBu8Pm2W3oX1U1cK6m5D689jj6tp1agm4fbYoe8xilW13ZpBKB8IbISPkiS+s6+ifulV9tdcp9aJjjp3IUSWU+sX20AXCgWVwxcrH3V0kmvcHR3w12XdI1Xwql+ZF9okILQ5HrpbubUadYf0Hm7oeM9dzBPgtB0TwzZfjF0uzG3O66zHHDl1sc5l9XXeSobesN+63N0BVQI7Tue2LjXoEZAwgV5kBHHWU0Egv0tKK61OTjHBIrYED8aC8GtTeY4kCkI52pS/uTxdNm4rEh9KO4zODitNCl6rU8jKBbZ5NBw4QNXI3KeOFv7AX67unp/9pXS++4e0iW87ybc9Cr8xQChOl4PXyUmOXrJ7Sg3oZX04qQSBOFzusz4qkRhPzGVLUzdWXeo9ofKjK2ZfUhVxlf6QrSR4ChLx3kZwS9Ca9lT2DSKvcw4vhl4jm6g1D203Lt23fK6uFVg9xPlgE14Rpox/o=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <176C6D90BAC1C1499DB6721266A9C220@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 ij68yrtEtxgPcT2qz4rv4NJsrKVEXqjFnpoafqELDvyU6iY47UYpw6y77r2DPEQuDv5DsFNMVdXwl085BF0UbifkZ6s4zYhwKSHS9O+xQ0uR9pjkAomXFZl6FhGRIg0KO25l/tpoX3qAnSn3SAbvxrbwVesqd0eFmSR/jM0Si8y83Ju9BDHlkSyvWqqIuuen/BBa85ZPuk2Hev/opKMZKa8AOcEwfeqWqCwhO1vpRqWmcsWrxXkPA1/sUdzomMneJKQWWwmVdD9tWFnnwAYlotxLWpow66SsJJvOSF5qhYTu8EKV9d+2RS/gbpLFm+90QxeqebYIwwsJNyVbLaUmig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6200
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da7563c5-0ce9-4376-c543-08de970aa696
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|82310400026|36860700016|35042699022|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LjTEA4VIgdf3XZZTUl0JpyAfJ43/+3clp2//o1Ykn8KewPnHhI0Z6n4qjOrJz/cwQbl473rgGCsi1ZM/hFYjyO6tE3uHBCU9Ova2wEAAiHnljZ6tTzpNGWLWJ6DLwc49M92+wszfgGH/pYrdOJ01jY9xggn2JrU/yJVyPw76CJxjmzpsKWktWQ4vaUF2HnlleLnkuE92BFT501WFBW+yqH31ca9g9k/KthAsytEdnBVDPITFMAbMnfq7rN5hST5VjVrQ6C3yDahLHxFlgnEz5cG6Iywp8NSxt8sKY7mA9ROxizTf7EWkZKpWFdZf00qTOqkykXevdIPnwLENnMx6jo4DJ/kOo/Se9Sycc1V0WqLaYw2crprBrf+yxgIFMy6zxDyt1Ozot5fR0PvQrtR9keVsoyYQIum3/3wnqWmIMiAEPFUuVlfmMCTYhj86gKQcq+Dzhc7tXmxH7KNzZFJYwNjEuA44mnsVzx+mR2ZbullawOfeaG3I//dDlnaC245QgrQbjNTh9nAUCIHhFktNwqzA9RRETtv2FVZHA6pnQQKdnMpoq73NMtunsyHbbhx5CH7zpa/jsATf4x7g1V8V3aZQdymfEhxqkkAtM4s8PbvkIk3GjU3utLfNpi5kNLnv+sMh6o96DG3P7DtEJcj7/fYHJmny8MdAwZeEB51Wl32q0yXiz9TnsJysUw6luO0CqbWdTDw26UE5LnHYEplZWWyrShiU9DhnLAXB/nuvyMXnvbB36T2vs900mLBQ1hW11BlR7mCGiFOqTINTa+8+tw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(82310400026)(36860700016)(35042699022)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7aDXg1jLQv4JD3czsdARJpenu19XJ2BVfA8saxzpelRXOgtxMpnl8NVf3BxuScW53Yt4KS/+CGNekiC6JzK3EJ1HVHvNJ632fPmXHD02x4Vchqy/kr8W20y4YvjdOPpRL+VcJMP424NnSvH3fr3InVSuOQftpFHS7UdS02sDsUZ0944faqSqyfQtRVXQmOXT5kWFMnoTtxB2UuIMRiT6PFjMQoCr2LLUz6NZr4F1YAQ9F7rBxNOMJLsPjCF0pM9cDhJfyvhDMdUPnY0eidQvE6qqXC0C+mXYbl668NqURkSpm2akamekhZir1vytv2EBrnLlCZlzr5Bs0CcXlgf18YP0tuHxcQGBG5pCLxIFFQjrNmGIJjUJkrrXqP9177jOjPW49TSDoB6O+pTiX8ayZ/q1CNoYsQh5fzmj6HTES/7DCzDy+1ZWnmaxn9wLpMR/
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 14:09:38.2248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33795c5b-b7bb-4b79-ef3e-08de970acd4f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8791
X-purgate-ID: tlsNG-d62444/1775830185-BCD65185-28B441DC/0/0
X-purgate-type: clean
X-purgate-size: 2588
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:anthony.perard@vates.tech,m:enr0n@ubuntu.com,m:gwd@xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 94B5B3D87CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SEkgTWlsYW4sDQoNCj4gT24gMzEgTWFyIDIwMjYsIGF0IDAyOjUyLCBNaWxhbiBEam9raWMgPG1p
bGFuX2Rqb2tpY0BlcGFtLmNvbT4gd3JvdGU6DQo+IA0KPiBGcm9tOiBSYWh1bCBTaW5naCA8cmFo
dWwuc2luZ2hAYXJtLmNvbT4NCj4gDQo+IEFkZCBuZXcgdmlvbW11X3R5cGUgZmllbGQgYW5kIGZp
ZWxkIHZhbHVlcyBYRU5fRE9NQ1RMX0NPTkZJR19WSU9NTVVfTk9ORQ0KPiBYRU5fRE9NQ1RMX0NP
TkZJR19WSU9NTVVfU01NVVYzIGluIHhlbl9hcmNoX2RvbWFpbmNvbmZpZyB0bw0KPiBlbmFibGUv
ZGlzYWJsZSB2SU9NTVUgc3VwcG9ydCBmb3IgZG9tYWlucy4NCj4gDQo+IEFsc28gYWRkIHZpb21t
dT0iTiIgcGFyYW1ldGVyIHRvIHhsIGRvbWFpbiBjb25maWd1cmF0aW9uIHRvIGVuYWJsZSB0aGUN
Cj4gdklPTU1VIGZvciB0aGUgZG9tYWlucy4gQ3VycmVudGx5LCBvbmx5IHRoZSAic21tdXYzIiB0
eXBlIGlzIHN1cHBvcnRlZA0KPiBmb3IgQVJNLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmFodWwg
U2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1pbGFuIERqb2tp
YyA8bWlsYW5fZGpva2ljQGVwYW0uY29tPg0KPiBBY2tlZC1ieTogTmljayBSb3Nicm9vayA8ZW5y
MG5AdWJ1bnR1LmNvbT4NCj4gLS0tDQo+IGRvY3MvbWFuL3hsLmNmZy41LnBvZC5pbiAgICAgICAg
ICAgICB8IDEzICsrKysrKysrKysrKysNCj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2hlbHBlcnMu
Z2VuLmdvIHwgIDIgKysNCj4gdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3R5cGVzLmdlbi5nbyAgIHwg
IDcgKysrKysrKw0KPiB0b29scy9pbmNsdWRlL2xpYnhsLmggICAgICAgICAgICAgICAgfCAgNSAr
KysrKw0KPiB0b29scy9saWJzL2xpZ2h0L2xpYnhsX2FybS5jICAgICAgICAgfCAxMyArKysrKysr
KysrKysrDQo+IHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfdHlwZXMuaWRsICAgICB8ICA2ICsrKysr
Kw0KPiB0b29scy94bC94bF9wYXJzZS5jICAgICAgICAgICAgICAgICAgfCAgOSArKysrKysrKysN
Cj4gNyBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluDQo+IGlu
ZGV4IDNhYWMwYmM0ZmIuLjRkZThkYjQyYWMgMTAwNjQ0DQo+IC0tLSBhL2RvY3MvbWFuL3hsLmNm
Zy41LnBvZC5pbg0KPiArKysgYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4NCj4gQEAgLTMxNzUs
NiArMzE3NSwxOSBAQCBvcHRpb24uDQo+IA0KPiA9YmFjaw0KPiANCj4gKz1vdmVyIDQNCj4gKw0K
PiArPWl0ZW0gQjx2aW9tbXU9Ik4iPg0KDQrigJxO4oCdIGlzIG1pc2xlYWRpbmcsIEkgY2FuIHRo
aW5rIGFib3V0IGEgbnVtYmVyLiBJIHRoaW5rIHdlIGNhbiBoYXZlIOKAnFNUUklOR+KAnSBoZXJl
DQoNCj4gDQo+IGRpZmYgLS1naXQgYS90b29scy9pbmNsdWRlL2xpYnhsLmggYi90b29scy9pbmNs
dWRlL2xpYnhsLmgNCj4gaW5kZXggODBlM2VjOGRlOS4uMjMxZGJmZjVkOSAxMDA2NDQNCj4gLS0t
IGEvdG9vbHMvaW5jbHVkZS9saWJ4bC5oDQo+ICsrKyBiL3Rvb2xzL2luY2x1ZGUvbGlieGwuaA0K
PiBAQCAtMzE4LDYgKzMxOCwxMSBAQA0KPiAgKi8NCj4gI2RlZmluZSBMSUJYTF9IQVZFX0JVSUxE
SU5GT19BUkNIX0FSTV9TQ0kgMQ0KPiANCj4gKy8qDQo+ICsgKiBsaWJ4bF9kb21haW5fYnVpbGRf
aW5mbyBoYXMgdGhlIGFyY2hfYXJtLnZpb21tdV90eXBlIGZpZWxkLg0KPiArICovDQo+ICsjZGVm
aW5lIExJQlhMX0hBVkVfQlVJTERJTkZPX0FSTV9WSU9NTVUgMQ0KDQpJIHRoaW5rIHRoaXMgc2hv
dWxkIGJlIExJQlhMX0hBVkVfQlVJTERJTkZPX0FSQ0hfQVJNX1ZJT01NVQ0KDQpDaGVlcnMsDQpM
dWNhDQoNCg==

