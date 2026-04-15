Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGnUNSOF32nSUgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:31:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1C404424
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2026 14:31:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282408.1565005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCzOf-0008I7-4T; Wed, 15 Apr 2026 12:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282408.1565005; Wed, 15 Apr 2026 12:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCzOf-0008Fb-1n; Wed, 15 Apr 2026 12:31:09 +0000
Received: by outflank-mailman (input) for mailman id 1282408;
 Wed, 15 Apr 2026 12:31:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Bertrand.Marquis@arm.com>) id 1wCzOc-0008FV-RB
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 12:31:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCzOc-002DD3-7e
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 14:31:06 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69df8500-bab6-0a2a0a5309dd-0a2a450bd5b0-36
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 14:31:05 +0200
Received: from [52.101.69.15]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Bertrand.Marquis@arm.com>)
 id 69df8509-bca8-0a2a450b0019-3465450fea9b-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 14:31:05 +0200
Received: from CWLP123CA0216.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::16)
 by AS4PR08MB7997.eurprd08.prod.outlook.com (2603:10a6:20b:580::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 12:31:00 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::ef) by CWLP123CA0216.outlook.office365.com
 (2603:10a6:400:19d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.50 via Frontend Transport; Wed,
 15 Apr 2026 12:30:58 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 15 Apr 2026 12:30:58 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DB9PR08MB11244.eurprd08.prod.outlook.com (2603:10a6:10:5e1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 12:29:51 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%5]) with mapi id 15.20.9769.018; Wed, 15 Apr 2026
 12:29:51 +0000
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
 b=pwnI9bgmt7ilD7OtBw6I3bNxeMW0iJNQjyZcwtqCRq10Hom8SskCAoDGPoKcYdgwnxlfrsiXEO/eog8EOrZeZ9034dbuPyLr9/YqwQLGn9rRuInIQUl+exyO+qytatkMKQxD67VTntjcT4cimWfEpPSfI5UOC6a9Qe/jvJsVv7tPFvlU6lYWfmKsJFtLhgL/N46QDt0AvUJs+mYwE1pvrwldpP36tWLylBtzQjPYmRJV7y4HSwOwVfsRMOCAY91hDPY1UFNdedTEAkXzE22F1pCEC/XAfgaStr/JdGGEUFAUViuY6uKJ7NiuMYguUTOKJKtbBTdf1bPI3rrUfiLpUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0acH5JpKmQYar14t/VnmlFLxigNyXg6z3yS5uUK+ws=;
 b=uFJT0LkW5Y8VCa/wj7zrNCicjEs6BP1gwWiPhQTj8FA39KIsuGQRjbqM1wg+Qy6yAanpTr8QfQxtmNK7qCWQrCdq2aO8osa21MHVOiTkO3+0ohuN6XB1R0/6nHlW3KtEPhmUucY65O1zLfqSw9PE6rpX/6C0B+ZXGZzyUQIA14LphBkYlOVjChq5sOFH58mFCd+OtmJv6rBgdfRVoBti4wSy5ECUVdpoRpQ0D6P8UWSGrSXlAhc633FQK0SPTJX5hvI1VV4gXkf82/Y2I0lQ42SZ21QZfQBN1nx7CAmvSMKPNkvlJjdzz1UHoUQsKDWUYVNb57b2bk4iGz8X6eIQ8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0acH5JpKmQYar14t/VnmlFLxigNyXg6z3yS5uUK+ws=;
 b=RpHkWxk8RGRxYNz5VI+R8eY4Or3ZnbZTej/vWTrFwg/8OW7PCxBzE71GFpWtC59YGrnaMIn66g2HWFyN37HcqC65Kph4zU/iCju8x+/yXLfn35qHEpqi6lt+S23aEphr99Xtd6pLjysVdRVHu5LXiS8/5+Af1xQxiJZ2uH+wrrQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BmJoT1hU4CMKp9OX8OTtjm9YNGIveOwjuxWiBz6f+zkWc5TGVnZoHGCzgfZ5xuC4onPqyajwXntdg5aKHbbrZT3PdE10T2JJXXldqcYpyE9WaL9ntG1WyUyeu2VuA/5GpAcJAIvNaEDEZ9U0yTKwkolBwG6g1amN0pbVFkOoHP2RgsxIziTDfAXRnrwYzg8VqWZt8Pn4TwzJE7MHpbGnTKeUQ0YWNYrJrlYChCjdHa9bhZIpE8bp/CdILwA+5WnkoSNiFGSXOKnop4Dnr2ARHx+Z3ezL5iOX0pJhbb4KJBicRTnpLOGX1RhkOavuhAbOV7oJx+iwOoEeLVlwGrkyTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0acH5JpKmQYar14t/VnmlFLxigNyXg6z3yS5uUK+ws=;
 b=IO1VJCsrjqgS/zUv9D5S8+nyYo7dzuNj0zXE9pGO4J7ltKbKPBwvI/ooAaYCl7gmE9R3DweAIn60PZVYps7UWGyyHKI0t/o7R/h5ceLylg7OKOJ307cWqlCHtPHjXK8l0amkfDmEEkGiBf0fiqvi/HjbR6BSu7MCNgwkKlYkY12eAsAD6vMczEYCMDrZp9WcFA5GYgTfz8yk/mACPNYV6uHuj/mqPjrcZr5vh767488NDWGRvkNJS+dygksefvSViPanSn71KdeaOXbui2G1d7xhYL7pb3C6oqNnuofHX2g7HSdVU7/hlQsw1GhU7x4QjNCJv9RWv3yi2SJ2std2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a0acH5JpKmQYar14t/VnmlFLxigNyXg6z3yS5uUK+ws=;
 b=RpHkWxk8RGRxYNz5VI+R8eY4Or3ZnbZTej/vWTrFwg/8OW7PCxBzE71GFpWtC59YGrnaMIn66g2HWFyN37HcqC65Kph4zU/iCju8x+/yXLfn35qHEpqi6lt+S23aEphr99Xtd6pLjysVdRVHu5LXiS8/5+Af1xQxiJZ2uH+wrrQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Mykola Kvach <xakep.amatop@gmail.com>, Mykola Kvach
	<mykola_kvach@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Thread-Topic: [PATCH v3] xen/arm: vpsci: ignore upper 32 bits for SMC32 PSCI
 arguments
Thread-Index:
 AQHcwTztA0BB9cGvO0qBEZxru/k/mbXJvzqAgAAMSgCAABEHgIAACdaAgAAJKoCAAAgSAIAAKwOAgBYB9QA=
Date: Wed, 15 Apr 2026 12:29:51 +0000
Message-ID: <DDF9A244-22CB-416E-A855-D85FECE0A3C2@arm.com>
References:
 <e1d18d55557ebe232fd62174f186b1cf228e48e5.1774981189.git.mykola_kvach@epam.com>
 <dc5550d7-5a2d-4ca1-85de-5a17c24aeac4@suse.com>
 <CAGeoDV-ffZsOW+Cu0-oPA1obBOv_1nWU8_PAdaqaoy6=YUHGig@mail.gmail.com>
 <5b16e00e-9a4d-4a18-8a5e-dde10b42a043@suse.com>
 <CAGeoDV_Cdpa6beFemKaVcCguwmo95x0g0rsRYbS1x5dAUxFPLQ@mail.gmail.com>
 <5fb9b5ee-ee71-49ec-b545-62c8ec27fc15@suse.com>
 <CAGeoDV-HCKUXZ-CZBASLik=xkR02w-n=5+HVsYGwfDf4zD-3zA@mail.gmail.com>
 <425cdc68-5e25-4e01-b5d9-6469e2d08abb@suse.com>
In-Reply-To: <425cdc68-5e25-4e01-b5d9-6469e2d08abb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.500.181)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DB9PR08MB11244:EE_|AMS1EPF00000091:EE_|AS4PR08MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: e580d7a6-ad44-4a88-cea6-08de9aead8f9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 hrUXsHhkMxb0/e+xP4bzfziYl8LFNCcDZuchl+X3/3t9lAzS8NVnFexvfMuFnQFAbhjlVTbu0kRJ8AfFlq4BAeewDxuA/PEuLNAld36b2HJa3NAasEFGbxz8xKmj/KlXA00UrNF7skUTQJV31F4bKrz/WU35iGtLfM/ckp6fHuN9afH5G7FBU2WqJTQRW83HTemo4e0Ye2skjyVva8OdDpJ5LKsskmM0D5OWHgPVN+fIe7N4RtMJ//w7j1W9rTYQFMYf/BJqIXHd5Hb/A6lmBMffDHVpmb+e/HYwTWTkbuvsM5NNm23YL5aOlKN5IgsbqIdj9ZMlIRJ32cjz9/vrCsiv8WYYhNki56y0nyhrhZ3p4PwZVri5gEWlibzOvUdgTJ9dcQEKzfxDGRHqf1Q5SsZ0LBx2wwfTpDMcuROk5xrzuWL8RIE5r7pM67Xibc636Ztl7slBE99X0Go0a5eb2HVyeva3T5v0DL2XrePnXzvZgm2Raxt9s09xzCSytD5knytlq3tnd+6gp4DoZzaGEWQm67lCqnMJ5NVAdCJ/lgHjwDtUUh0Ia16K8HGR+2B9E1YrY6FpJaS2G0IVNsKMjR1vkjDacOKPd/zyykETNA/rDwEnC7N767LKFTASrw+SJyb+ZipRyop0q4ocpbOco3H0LG/Ae1xFwt9hSvBtMdvbckcvYYenKvZIkvsQK++2FNbqSajWGmPzn9VWhi3By0UCmORIig6o/A3ez47m5r1IZs/iQ+w+M8E2tl6vDMQ1YI66GAdDPJ1oC/wVXHBfcCo9w3KqPWOy9W1ltXRGCOk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB4989F6D387AF4493DA08FB4AD46208@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 pvIkVlTQwThmqbYinq6u2v046JmJOigADSUpuhu/KFfnoaPuzIrH474bOycs84mjCgaegZyFLFJ+Ls0ZTGxPzyrFVL/iTbQZlya+Nl6WkDhr9dongCqC6J1mqJy3l4smce7UrxZCyeAfigd/HjcfYHVPLKO0M1scNoq+9+6w5zg9EEjIB6uldOk4PrI8dxWDR2rZgtQBJT7Wt4QNoenydkmic2Cm96G03MfD9nCH1b343q/Z6sebA7IjtjclyCscgbVt4tT3KX+NVnlKdbWoUjxWl/DcIO8BSHZJlXru1+37VEnG2ASBa2W53NrQbJVzqsoJswaUC26Wi/XjI7Wl9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11244
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9cd6aa2-7091-40a8-bfbd-08de9aeab0f9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|376014|35042699022|82310400026|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PPQ10RYZ39pMwU2dxW1FgWePtPLZUbe5L74bOX/K8u/YKE3DGPaOslpgl/Ft83fa8mukGJt6M9yL2QeFIEldCpPgZ64gSzMcr2yU8LzDIR5829RIuS3ytdkpCbMshgDU93yJLGt+rWgGqRNUKnSVmU0EWEd00qTacLVjSP7FpUuwRDv/wbJHzh734ZxO5uKfAwL6+MkFw0TW3IwwQ5doAIjMqsNKuCJKDHy9/pfN9yI3GAU8g8u/P0g9nVNz0kEr6kjMudGJuRU8A9aa9IBd4LG7OCgB5dAz6iKL2ImB798nT2l+zIqzhcgfBbT/QDRtINeuwh0wbXq8uV78TFUK1Azac/kqLDBhhUDfSiOl6UBS5zoGLbMOFpg16//6rchbfrHjPyRviDGz4yo8cRuoYlE6QlP3dKHSvuBLzJcPKU+to5G9eJ88nX6nvSAyadG2Ub033S1v2JJ3wYq6MrmLT4ZSSVHha+Aytx7NUJwf3i01EVT+UTHcosnmGPCwWim7pwX/5RYqgVINzkcwFQoM8xPFnh4Rv3FuQ86yiedBkJzIbh+G9oLlOTlfGzE79JNOBTXOIMozwpSRopymfWuRziqCwx147DEQabo7u+NnHkuaveLtj3bM1iIE3sLROzRMGgzGfptdk+qATovwb/BiqqYQIcoJwQa7d6P25VneIOv0PSARQib2Bys9tPtHpMBTXKPv6mNzlEPlC/+G8/REDXwe9qK8mx7IqQKRKMo2iut+pxrtkEfcEATJWrGhPt8igE7H3GrgEMvWUiPALCq/jw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(376014)(35042699022)(82310400026)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YmFwNv6HyuIjQzRHa+D0OhowdzXmj7YS2bfgBy2/w/UALAfHnZo+/IydT2KDOwZQYksfML4yNQU40EBPqsRxBLlwXExz/07Tl8Ep5sBQWI4IRkIVJJIrd+JwNdgTE29/phofRiWPijqL4C/wYUs1jEtKWcLpN0N/Iziuysvj0qLa3FFAHD+8hZy55GZc4quI3m2iYWQjjcB9VOWlqmGyU8i6XrP627MhUVIR6GGLW8FeoaVBcM+8TI7+C6bpuVyqNso2KwyXTV3Kd5bR2DcTwuav03Wr816Dwyt79zOfHn5hShwVbUNpfdrXJ9pY2XTh6MomHhfBt8d0Vih+whaJLp5wFMFk4zk3xXVbYcZiIlU7ehqf1nAxmpDpqOsjpqitwXD8JZPjd3HmmdAvORp1tcJoNAcBe7qaUV0IOSEQgR7RMitfHTdTZJ1e9u3jQLy2
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 12:30:58.5392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e580d7a6-ad44-4a88-cea6-08de9aead8f9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7997
X-purgate-ID: tlsNG-42698a/1776256265-F5BC22A1-037FB8AC/0/0
X-purgate-type: clean
X-purgate-size: 9492
X-Spamd-Result: default: False [-0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,epam.com,kernel.org,xen.org,amd.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xakep.amatop@gmail.com,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	APPLE_MAILER(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: EDA1C404424
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSmFuIGFuZCBNeWtvbGEsDQoNCj4gT24gMSBBcHIgMjAyNiwgYXQgMTQ6MjQsIEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMS4wNC4yMDI2IDExOjUx
LCBNeWtvbGEgS3ZhY2ggd3JvdGU6DQo+PiBPbiBXZWQsIEFwciAxLCAyMDI2IGF0IDEyOjIy4oCv
UE0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiBPbiAwMS4wNC4y
MDI2IDEwOjQ5LCBNeWtvbGEgS3ZhY2ggd3JvdGU6DQo+Pj4+IE9uIFdlZCwgQXByIDEsIDIwMjYg
YXQgMTE6MTTigK9BTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+
Pj4gT24gMDEuMDQuMjAyNiAwOToxMywgTXlrb2xhIEt2YWNoIHdyb3RlOg0KPj4+Pj4+IE9uIFdl
ZCwgQXByIDEsIDIwMjYgYXQgOToyOeKAr0FNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4gd3JvdGU6DQo+Pj4+Pj4+IE9uIDMxLjAzLjIwMjYgMjA6MzEsIE15a29sYSBLdmFjaCB3cm90
ZToNCj4+Pj4+Pj4+IEZyb206IE15a29sYSBLdmFjaCA8bXlrb2xhX2t2YWNoQGVwYW0uY29tPg0K
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBTTUNDQyBERU4wMDI4Rywgc2VjdGlvbiAzLjEsIHN0YXRlcyB0
aGF0IGZvciBBQXJjaDY0IFNNQy9IVkMgY2FsbHMNCj4+Pj4+Pj4+IHVzaW5nIFduLCBvbmx5IHRo
ZSBsZWFzdCBzaWduaWZpY2FudCAzMiBiaXRzIGFyZSBzaWduaWZpY2FudCBhbmQgdGhlDQo+Pj4+
Pj4+PiB1cHBlciAzMiBiaXRzIG11c3QgYmUgaWdub3JlZCBieSB0aGUgaW1wbGVtZW50YXRpb24u
DQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+IFNvIGZvciBTTUMzMiBQU0NJIGNhbGxzLCBYZW4gbXVzdCBu
b3QgdHJlYXQgbm9uLXplcm8gdXBwZXIgYml0cyBpbiB0aGUNCj4+Pj4+Pj4+IGFyZ3VtZW50IHJl
Z2lzdGVycyBhcyBhbiBlcnJvci4gSW5zdGVhZCwgdGhleSBzaG91bGQgYmUgZGlzY2FyZGVkIHdo
ZW4NCj4+Pj4+Pj4+IGRlY29kaW5nIHRoZSBhcmd1bWVudHMuDQo+Pj4+Pj4+PiANCj4+Pj4+Pj4+
IEFybSBBUk0gRERJIDA0ODdKLmEgKEQxLTU0MDYpIGFsc28gbm90ZXMgdGhhdCB0aGUgdXBwZXIg
MzIgYml0cyBtYXkgYmUNCj4+Pj4+Pj4+IGltcGxlbWVudGF0aW9uIGRlZmluZWQgd2hlbiBlbnRl
cmluZyBmcm9tIEFBcmNoMzIuIFhlbiB6ZXJvcyB0aGVtIG9uDQo+Pj4+Pj4+PiBlbnRyeSwgYnV0
IHRoYXQgZ3VhcmFudGVlIGlzIG9ubHkgcmVsZXZhbnQgZm9yIDMyLWJpdCBkb21haW5zLg0KPj4+
Pj4+Pj4gDQo+Pj4+Pj4+PiBVcGRhdGUgUFNDSSB2MC4yKyBDUFVfT04sIENQVV9TVVNQRU5ELCBB
RkZJTklUWV9JTkZPIGFuZCBTWVNURU1fU1VTUEVORA0KPj4+Pj4+Pj4gdG8gcmVhZCBTTUMzMiBh
cmd1bWVudHMgdmlhIFBTQ0lfQVJHMzIoKSwgd2hpbGUga2VlcGluZyB0aGUgU01DNjQNCj4+Pj4+
Pj4+IGhhbmRsaW5nIHVuY2hhbmdlZC4NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2UgaXMgaW50ZW5kZWQgZm9yIFBTQ0kgMC4xLg0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBT
dWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+Pj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBNeWtvbGEgS3ZhY2ggPG15a29sYV9rdmFjaEBlcGFtLmNvbT4NCj4+Pj4+Pj4+
IFJldmlld2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+
DQo+Pj4+Pj4+IA0KPj4+Pj4+PiBJIHRob3VnaHQgSSBtaWdodCBhcyB3ZWxsIGluY2x1ZGUgdGhp
cyBpbiBteSBuZXh0IGNvbW1pdCBzd2VlcCwgYnV0IGlzbid0DQo+Pj4+Pj4+IHRoaXMgUi1iIGJl
aW5nIGludmFsaWRhdGVkIGJ5IC4uLg0KPj4+Pj4+PiANCj4+Pj4+Pj4+IC0tLQ0KPj4+Pj4+Pj4g
djM6DQo+Pj4+Pj4+PiAtIHVzZSBQU0NJX0FSR19DT05WIGZvciBTWVNURU1fU1VTUEVORA0KPj4+
Pj4+PiANCj4+Pj4+Pj4gLi4uIHRoaXMgY2hhbmdlLiBUaGF0J3MgLi4uDQo+Pj4+Pj4+IA0KPj4+
Pj4+Pj4gQEAgLTQyMiwxNCArNDI3LDggQEAgYm9vbCBkb192cHNjaV8wXzJfY2FsbChzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyAqcmVncywgdWludDMyX3QgZmlkKQ0KPj4+Pj4+Pj4gICAgIGNhc2UgUFND
SV8xXzBfRk4zMl9TWVNURU1fU1VTUEVORDoNCj4+Pj4+Pj4+ICAgICBjYXNlIFBTQ0lfMV8wX0ZO
NjRfU1lTVEVNX1NVU1BFTkQ6DQo+Pj4+Pj4+PiAgICAgew0KPj4+Pj4+Pj4gLSAgICAgICAgcmVn
aXN0ZXJfdCBlcG9pbnQgPSBQU0NJX0FSRyhyZWdzLCAxKTsNCj4+Pj4+Pj4+IC0gICAgICAgIHJl
Z2lzdGVyX3QgY2lkID0gUFNDSV9BUkcocmVncywgMik7DQo+Pj4+Pj4+PiAtDQo+Pj4+Pj4+PiAt
ICAgICAgICBpZiAoIGZpZCA9PSBQU0NJXzFfMF9GTjMyX1NZU1RFTV9TVVNQRU5EICkNCj4+Pj4+
Pj4+IC0gICAgICAgIHsNCj4+Pj4+Pj4+IC0gICAgICAgICAgICBlcG9pbnQgJj0gR0VOTUFTSygz
MSwgMCk7DQo+Pj4+Pj4+PiAtICAgICAgICAgICAgY2lkICY9IEdFTk1BU0soMzEsIDApOw0KPj4+
Pj4+Pj4gLSAgICAgICAgfQ0KPj4+Pj4+Pj4gKyAgICAgICAgcmVnaXN0ZXJfdCBlcG9pbnQgPSBQ
U0NJX0FSR19DT05WKHJlZ3MsIDEsIGlzX2NvbnZfNjQpOw0KPj4+Pj4+Pj4gKyAgICAgICAgcmVn
aXN0ZXJfdCBjaWQgPSBQU0NJX0FSR19DT05WKHJlZ3MsIDIsIGlzX2NvbnZfNjQpOw0KPj4+Pj4+
Pj4gDQo+Pj4+Pj4+PiAgICAgICAgIHBlcmZjX2luY3IodnBzY2lfc3lzdGVtX3N1c3BlbmQpOw0K
Pj4+Pj4+Pj4gICAgICAgICBQU0NJX1NFVF9SRVNVTFQocmVncywgZG9fcHNjaV8xXzBfc3lzdGVt
X3N1c3BlbmQoZXBvaW50LCBjaWQpKTsNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IC4uLiB0aGlzIGh1bmsg
YWl1aSwgd2hpY2ggaXMgZmFyIGZyb20gbWVyZWx5IGNvc21ldGljIGltby4gV2hpbGUNCj4+Pj4+
PiANCj4+Pj4+PiBOb2JvZHkgc2FpZCB0aGF0IHRoZSBjaGFuZ2UgaGFkIHRvIGJlIHB1cmVseSBj
b3NtZXRpYyBpbiBvcmRlciB0byBrZWVwDQo+Pj4+Pj4gdGhlIHRhZy4gSSB1bmRlcnN0b29kIGl0
IGRpZmZlcmVudGx5IGZyb20gdGhlIG9mZmljaWFsIFhlbg0KPj4+Pj4+IGRvY3VtZW50YXRpb24g
cGFnZXMuDQo+Pj4+Pj4gDQo+Pj4+Pj4+IGJlaGF2aW9yIGxvb2tzIHRvIHJlbWFpbiB0aGUgc2Ft
ZSBmb3IgUFNDSV8xXzBfRk4zMl9TWVNURU1fU1VTUEVORCwgaXQNCj4+Pj4+PiANCj4+Pj4+PiBF
eGFjdGx5LiBJZiB0aGUgY2hhbmdlcyBhcmUgbm90IHN1YnN0YW50aWFsLCBJIGRvIG5vdCBzZWUg
YSByZWFzb24gdG8NCj4+Pj4+PiBkcm9wIHRoZSB0YWcgLi4uDQo+Pj4+Pj4gDQo+Pj4+Pj4+IGNs
ZWFybHkgY2hhbmdlcyBmb3IgUFNDSV8xXzBfRk42NF9TWVNURU1fU1VTUEVORC4gVGhhdCBtYXkg
YmUgaW50ZW5kZWQNCj4+Pj4+Pj4gYW5kIGZvciB0aGUgYmV0dGVyLCBidXQgdGhlIGNoYW5nZSBj
bGVhcmx5IHdhc24ndCByZXZpZXdlZCBieSBCZXJ0cmFuZCwNCj4+Pj4+Pj4gbm9yIC0gd2hlbiBv
ZmZlcmluZyB0aGUgUi1iIC0gZGlkIGhlIGFzayBmb3IgdGhpcyBleHRyYSBjaGFuZ2UuDQo+Pj4+
Pj4gDQo+Pj4+Pj4gLi4uIGFuZCB0aGlzIGlzIGFsc28gaG93IEkgdW5kZXJzdG9vZCB0aGUgWGVu
IHBhdGNoIHN1Ym1pc3Npb24NCj4+Pj4+PiBndWlkZWxpbmVzIFsxXSwgd2hpY2ggc2F5Og0KPj4+
Pj4+IA0KPj4+Pj4+ICJOb3RlIHRoYXQgaWYgdGhlcmUgYXJlIHNldmVyYWwgcmV2aXNpb25zIG9m
IGEgcGF0Y2gsIHlvdSBvdWdodCB0bw0KPj4+Pj4+IGNvcHkgdGFncyB0aGF0IGhhdmUgYWNjdW11
bGF0ZWQgZHVyaW5nIHRoZSByZXZpZXcuIEZvciBleGFtcGxlLCBpZg0KPj4+Pj4+IHBlcnNvbiBB
IGFuZCBwZXJzb24gQiBhZGRlZCBhIFJldmlld2VkLWJ5OiB0YWcgdG8gdjEgb2YgeW91ciBwYXRj
aCwNCj4+Pj4+PiBpbmNsdWRlIGl0IGludG8gdjIgb2YgeW91ciBwYXRjaC4gSWYgeW91IG1ha2Ug
c3Vic3RhbnRpYWwgY2hhbmdlcw0KPj4+Pj4+IGFmdGVyIGNlcnRhaW4gdGFncyB3ZXJlIGFscmVh
ZHkgYXBwbGllZCwgeW91IHdpbGwgd2FudCB0byBjb25zaWRlcg0KPj4+Pj4+IHdoaWNoIG9uZXMg
YXJlIG5vIGxvbmdlciBhcHBsaWNhYmxlIChhbmQgbWF5IHJlcXVpcmUgcmUtcHJvdmlkaW5nKS4i
DQo+Pj4+Pj4gDQo+Pj4+Pj4gU28gbXkgdW5kZXJzdGFuZGluZyB3YXMgdGhhdCB0YWdzIHNob3Vs
ZCBub3JtYWxseSBiZSBrZXB0IGFjcm9zcw0KPj4+Pj4+IHJldmlzaW9ucywgdW5sZXNzIHRoZSBj
aGFuZ2VzIGFyZSBzdWJzdGFudGlhbCBlbm91Z2ggdG8gbWFrZSB0aGVtIG5vDQo+Pj4+Pj4gbG9u
Z2VyIGFwcGxpY2FibGUuDQo+Pj4+PiANCj4+Pj4+IE1heWJlIG91ciB1bmRlcnN0YW5kaW5nIG9m
ICJzdWJzdGFudGlhbCIgZGlmZmVycy4gVG8gbWUgdGhhdCdzIGFueXRoaW5nDQo+Pj4+PiBjaGFu
Z2luZyBmdW5jdGlvbmFsaXR5LiBTdHlsZSBhZGp1c3RtZW50cywgdHlwbyBjb3JyZWN0aW9ucywg
YW5kIGFsaWtlDQo+Pj4+PiBnZW5lcmFsbHkgYXJlbid0IHN1YnN0YW50aWFsIChhbGJlaXQgZXZl
biB0aGVuIHRoZXJlIG1heSBiZSBleGNlcHRpb25zKS4NCj4+Pj4gDQo+Pj4+IFRoYW5rcyBmb3Ig
Y2xhcmlmeWluZyB3aGF0IHlvdSBjb25zaWRlciBzdWJzdGFudGlhbC4NCj4+Pj4gDQo+Pj4+IEV2
ZW4gdW5kZXIgdGhhdCBpbnRlcnByZXRhdGlvbiwgSSBkbyBub3Qgc2VlIGEgZnVuY3Rpb25hbGl0
eSBjaGFuZ2UNCj4+Pj4gaGVyZS4gIlJlZmFjdG9yaW5nIiBzZWVtcyBsaWtlIHRoZSBtb3JlIGFj
Y3VyYXRlIHRlcm0gaW4gdGhpcyBjYXNlOg0KPj4+PiB0aGUgaW50ZXJuYWwgZm9ybSBjaGFuZ2Vz
LCBidXQgdGhlIGludGVuZGVkIGV4dGVybmFsIGJlaGF2aW9yIGRvZXMNCj4+Pj4gbm90Lg0KPj4+
PiANCj4+Pj4gSXQgbWF5IGJlIHRoYXQgd2UgYXJlIHVzaW5nICJmdW5jdGlvbmFsIGNoYW5nZSIg
aW4gc2xpZ2h0bHkgZGlmZmVyZW50DQo+Pj4+IHNlbnNlcyBoZXJlLg0KPj4+PiANCj4+Pj4gRm9y
IHYzLCB0aGUgc3dpdGNoIHRvIFBTQ0lfQVJHX0NPTlYoKSBpbiBTWVNURU1fU1VTUEVORCB3YXMg
bWVhbnQgdG8NCj4+Pj4gbWFrZSB0aGlzIGNhc2UgY29uc2lzdGVudCB3aXRoIHRoZSBoZWxwZXIt
YmFzZWQgYXJndW1lbnQgZGVjb2RpbmcgdXNlZA0KPj4+PiBlbHNld2hlcmUsIG5vdCB0byBjaGFu
Z2UgYmVoYXZpb3IuDQo+Pj4+IA0KPj4+PiBJbiBwYXJ0aWN1bGFyLCBJIGRvIG5vdCBzZWUgYSBm
dW5jdGlvbmFsIGNoYW5nZSBmb3INCj4+Pj4gUFNDSV8xXzBfRk42NF9TWVNURU1fU1VTUEVORDog
djIgdXNlZCBQU0NJX0FSRyhyZWdzLCAxLzIpLCBhbmQgaW4gdjMNCj4+Pj4gUFNDSV9BUkdfQ09O
VihyZWdzLCAxLzIsIGlzX2NvbnZfNjQpIHNob3VsZCByZXNvbHZlIHRvIHRoZSBzYW1lIHRoaW5n
DQo+Pj4+IHdoZW4gaXNfY29udl82NCBpcyB0cnVlLg0KPj4+IA0KPj4+IElzbid0IHRoZSB3aG9s
ZSBwb2ludCBvZiB0aGUgcGF0Y2ggdG8gYWx0ZXIgYmVoYXZpb3Igd2hlbiBpc19jb252XzY0IGlz
DQo+Pj4gZmFsc2U/IEZvciB0aGF0IGNhc2UgUFNDSV8xXzBfRk42NF9TWVNURU1fU1VTUEVORCBi
ZWhhdmlvciBsb29rcyB0bw0KPj4+IGNoYW5nZSBpbiB2Mywgd2hlbiBpdCBkaWRuJ3QgaW4gdjIu
IFdoZXJlYXMgZm9yDQo+Pj4gUFNDSV8xXzBfRk4zMl9TWVNURU1fU1VTUEVORCB0aGUgdjMgY2hh
bmdlIGluZGVlZCBvbmx5IGVsaW1pbmF0ZXMgb3Blbi0NCj4+PiBjb2RpbmcsIHdoaWNoIG9uZSBt
YXkgb3IgbWF5IG5vdCByZWdhcmQgYXMgInN1YnN0YW50aWFsIi4NCj4+IA0KPj4gSSB0aGluayB0
aGUgcG9pbnQgSSB3YXMgdHJ5aW5nIHRvIG1ha2UgaXMgc2xpZ2h0bHkgbmFycm93ZXI6IGluIHRo
aXMNCj4+IGNvZGUgcGF0aCwgaXNfY29udl82NCBpcyBkZXJpdmVkIGRpcmVjdGx5IGZyb20gZmlk
IHZpYQ0KPj4gc21jY2NfaXNfY29udl82NChmaWQpIGJlZm9yZSB0aGUgc3dpdGNoIChmaWQpLg0K
Pj4gDQo+PiBTbyBmb3IgUFNDSV8xXzBfRk42NF9TWVNURU1fU1VTUEVORCwgSSBkbyBub3Qgc2Vl
IGhvdw0KPj4gaXNfY29udl82NCA9PSBmYWxzZSBjb3VsZCBhcmlzZSBoZXJlOiBpZiB3ZSBhcmUg
aW4gdGhlIEZONjQgY2FzZSwNCj4+IHRoZSBmdW5jdGlvbiBJRCBhbHJlYWR5IGVuY29kZXMgdGhl
IDY0LWJpdCBjb252ZW50aW9uLg0KPj4gDQo+PiBDb252ZXJzZWx5LCBpZiBpc19jb252XzY0IGlz
IGZhbHNlIGhlcmUsIHRoZW4gdGhpcyBjYW5ub3QgYmUgdGhlDQo+PiBGTjY0IGNhc2UuDQo+IA0K
PiBBaCwgSSBzZWUuIFRvIGZpZ3VyZSB0aGF0IG91dCwgSSB3b3VsZCBoYXZlIGhhZCB0byBkbyBh
IHByb3BlciByZXZpZXcuIEkNCj4gd2FzIGFmdGVyIGNvbW1pdHRpbmcgb25seSwgd2hpY2ggb3Vn
aHQgdG8gYmUgYW4gZW50aXJlbHkgbWVjaGFuaWNhbCBzdGVwLg0KPiANCj4+IE9uIHRoYXQgYmFz
aXMsIEkgZG8gbm90IHNlZSBhIGJlaGF2aW9yYWwgY2hhbmdlIGZvciB0aGUgRk42NA0KPj4gU1lT
VEVNX1NVU1BFTkQgY2FzZSBpbiB2My4NCj4gDQo+IEkgYWdyZWUgKG5vdykuIEknbSBzdGlsbCBu
b3QgZ29pbmcgdG8gcGljayB1cCB0aGF0IHBhdGNoLCBidXQgcmF0aGVyDQo+IGxlYXZlIGl0IHRv
IHRoZSBBcm0gbWFpbnRhaW5lcnMuIFdoaWxlIG5vdCBhcyBjbGVhciBjdXQgYXMgaXQgZmlyc3QN
Cj4gc2VlbWVkIHRvIG1lLCBJIHN0aWxsIGNvbnNpZGVyIGl0IHdpdGhpbiB0aGUgZ3JleSBhcmVh
Lg0KDQpTb3JyeSBmb3IgdGhlIGRlbGF5LCB0aGlzIGZlbHQgdGhyb3VnaCBpbiBteSBmaWx0ZXJz
IGFzIGl0IHdhcyByZXZpZXdlZC1ieSBhbHJlYWR5Lg0KDQpJIGFtIG9rIHdpdGggdGhlIGNoYW5n
ZXMgZG9uZSB3aGljaCBtYWtlIHNlbnNlIChtYXNrIGlzIG5vdyBkb25lDQpkaXJlY3RseSkuDQoN
ClJldmlld2VkLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+
DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQoNCg0K

