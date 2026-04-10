Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH+NN0/U2GmuiwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:43:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285863D5C8D
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 12:43:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278698.1563464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9KC-0005qv-FO; Fri, 10 Apr 2026 10:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278698.1563464; Fri, 10 Apr 2026 10:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB9KC-0005oj-Cf; Fri, 10 Apr 2026 10:42:56 +0000
Received: by outflank-mailman (input) for mailman id 1278698;
 Fri, 10 Apr 2026 10:42:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wB9KB-0005ob-1g
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 10:42:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB9KA-00Glrr-Dq
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 12:42:54 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8d423-2eae-0a2a0a5409dd-0a2a450ad1ee-40
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:42:54 +0200
Received: from [52.101.70.23]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69d8d42d-ee98-0a2a450a0019-34654617b727-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 12:42:54 +0200
Received: from AS4P195CA0037.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::26)
 by DU5PR08MB10580.eurprd08.prod.outlook.com (2603:10a6:10:51e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 10:42:48 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::9) by AS4P195CA0037.outlook.office365.com
 (2603:10a6:20b:65a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.43 via Frontend Transport; Fri,
 10 Apr 2026 10:42:48 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Fri, 10 Apr 2026 10:42:48 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV2PR08MB8194.eurprd08.prod.outlook.com (2603:10a6:150:74::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 10 Apr
 2026 10:41:39 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 10:41:38 +0000
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
 b=AhFtIVAzsbEkSbAplJTcovX/5a3U2BHiE9fydpyjJy6EIPt5ikuYdlf/b/qTIqPZsbaY1scSQnZd48npWik0ykahzPMIluVhziDggJ9/FUzcoI3EDT3p+373k4MJy7sdWSlFKfhpYfjQ+JA9WdeGxAWdxOGF1LmpxsBWNsH6uMQVu7j3E5FeJ+6WOBcsi7I/N8fXo5nR46ZHNQO2pYJNSaRcvYhM7X5Wu8yWqux6worPqIFcd4bJ+QVYHX2b9vF6h0Y25yzM0EwXRkcluAutVVw2mzPNjIud/GXV/jJBgte3H99A4xjdyCDpREN4hFifkW/+F4UU8BUuICBILG1vsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Y0h4D2uREcCtl3/VD2+58DxeULjDUZqfHr4du9xmAY=;
 b=AvKJgndaQqJuey797Da1rQ9Fwe0b5kS2kRVs/VtXWP+uTERoSDKz8Te3ZIDARTyY+RGvaZ2NVex8zANQUcvKnTa+hRSCWRUBB5HGh8kc/26Jcg/Gujp//ZZ6UIi02KZUYka7oGoQnV4a0kmckZIPOoCwcWkTC6C/q3/cQHua+eWuvoqImgPj9GBQqdGXMwOtxGQ6RGsFJfgzbuYpYwAVQxEKGPlurHaTVPkV1FDvPDKYHsXz+hxFRZQTzLjLxZyiapgZkkz7w0tBMhn/MB+IOPSfW2OUjgbF4M+2cvxqtA3EX9Ry5IsbuHNg0lngmsxd1UudjSGl8CNOpwa+H0GqYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y0h4D2uREcCtl3/VD2+58DxeULjDUZqfHr4du9xmAY=;
 b=sDZUxKgjxzOig837tvVXlqFRiWNDM/vGtDbBFspIS0VVuXPMokXDW/1EulOlasPaGPzzNyWafIhpJWI8etGybORwOuKnZVCA4tBG5nQQ6d+oUXVEUceYAqRMQNzfvPzs13NnKPnZMM88YEl4YSE/Se+nWpHZldCx4izEmC5r07Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnmNn23T5qZ0Yry3ugsMsjDKioFD7q20cuy+C18QtNwKH6lWzCr+/you3e0axOrPo+WCP/W5jBIiqASJNgqyZrghhI9pLLtdQeYuxZwy69QyAZK7+dIsZEa/9Z+GSzHQ/qiMIvoWL6yDoteyz4veKyGrolJ3YJCb243HKr7rR6NdsexEUQWZ0ZdLe0Ey2NesEvEcku0MD5z4Ec2/U89xj7X62Rao/jfFDEMAb9uYJrn9LZrPeZfph4yCodm6TjTFxsmL7meXggiVEDrjok4qD3LfjMAH1EfiqU76HDhHC3GhkPOFTmi+781MIsX5LDA8HRmHj+p66oFEnSPTbyNZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Y0h4D2uREcCtl3/VD2+58DxeULjDUZqfHr4du9xmAY=;
 b=vQpAv0qgbmxJyr/kLqVvtjtNYawat4t/9mPII7XqUai7RWPZGJmFN/1dWFoRcyZuaKygG+GUyUwjcDzixW4Y/bm0dOCVK2nlYx0aP4BTPcY+CQ58Mcd9iuHIhfv/8KeIDGyO6yRCya3SeOs/EeRlM7eOYnsvsfsTUDOuKXbdl4EZ4dCGpV49g561XJX8dDtSB68v6ntfMwdGJbgNOK9QUwBNy1491sXxPeDY+t5F7HVwRKqzsu1aKBCmRsu9hPABL2sZw9M44exxAGcL1VvxTBvQGLYMp3fZ02GtYGeQgNVjm/QC0mOHMUZNXU4sCJnx7kfKx47h/L7pTwjFsphCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Y0h4D2uREcCtl3/VD2+58DxeULjDUZqfHr4du9xmAY=;
 b=sDZUxKgjxzOig837tvVXlqFRiWNDM/vGtDbBFspIS0VVuXPMokXDW/1EulOlasPaGPzzNyWafIhpJWI8etGybORwOuKnZVCA4tBG5nQQ6d+oUXVEUceYAqRMQNzfvPzs13NnKPnZMM88YEl4YSE/Se+nWpHZldCx4izEmC5r07Y=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Topic: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Thread-Index: AQHcyNactGZ7ugIU+0mvCG28OqL5ew==
Date: Fri, 10 Apr 2026 10:41:38 +0000
Message-ID: <93490E9C-4D22-4EAB-965E-B20DA8189C60@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV2PR08MB8194:EE_|AM4PEPF00027A60:EE_|DU5PR08MB10580:EE_
X-MS-Office365-Filtering-Correlation-Id: 275b7df6-ca29-449e-a258-08de96ede840
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 79zIz4WpKP0oEX5WGuR8mEGMviIQJmGKcbpdkRFAAD+iVHCYZXrLpK6HrsrK4C+pfGYBDyfOQz7+9Zv5Ywsn4/lg9Rhgxn+UG+zNVyZtK9HvNgc7oCBU9Qb1ViGyCLglqma7Bb9MvtKPqaUzhqee/rln30a/ELD0abxQ8LbiBhAzZcFtzdb8RK8WiCEni+myZ/rU7bIrg4Y+xcKi1sNkbAjipNMVTMHhSFW16D0OzC2/QgXH15vXK/VdjXbH1eh6asaKOicjXb+mT0+uRfkS35zPate7hbpr6S2O7fv2DOg9k2hARujRZqXSWhHhlHefP/AHynZ9jj2FxJj3uTYUk09RPPHbL47VDYKGj+hvi/Aq35dfdCCLJzUZZCbpkVmGtTwPs9AnJY/xNcrS62pOUSeIs3Utt1apcnta4ScQlptBqMHfvSbWkFXZm5CLtDe3D20piQ9xNdFXIjpb+uhfSqxkcvPPeyVjsbcUv9+bGlIEyYmGANSR3UjyYV67okvboAEpMQwNCk4MxrG+ZijbHTXksWfcwb3vLZqhK4eCIdaXmcNzxQUXnk06ddQgwW7aEibkEgreVICAAPkIsGGWxll33h/tXc1j0G+0iWgkmvDk9q1vjWPCdmc/npUISMgXU3B8AKjZCTXVCYfAjYayX6B1oV4nw2iNThiWMV7gvtlX1+Dd4OngNRSNWqo1ZX2Zn4eS36DLgakX1tQoz5pFSZGHf7/AO7yEz50lv94atYpU9v5RE3DowryaiuFj0xUVoE8/jKBNyT8LiGT9c2QMZ5bxVSQzqHovtD6nuyFyjSI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <41C3DC3E0DE90A49932C1BFA6657C44D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 twM/Igy+97XB/1Gbixry5z7tMkUFhN7puBvPW5KQpLamM/jRxLPkf1Pw+Jl1nhhhPwIJZdDUBQ8NQO35b89coKjlaoENf2sCxARbyRWfqWiXS2HBrIwpyJvQwWwXeZge9m6kS/7KvVG/Oze8hUPBYVr6OkS7hQvlZkWH6kR415jqdHZT86wEi7CSW8bbhYdy15QzSYcOPcfBaGWUTI7CeYatST6gEbX3UPlayFnMpojGVIJvjzOUY3AyqBUVz1XrssymMsB4feTn4fBmYjJ4QtlMjKl2YGh+w+bPrW5zKSkbYTFMRcgXgA6QtgNFBiEpQAfDN6cRMAMOd7XwNy9ZjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8194
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	988e0eda-62cd-49fa-cdb0-08de96edbefd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|35042699022|1800799024|7416014|376014|82310400026|14060799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	QO5JWdV0Wyr174bq8HGhb6uP98kUJEgAJ22UDQP6vi2L+BbVgWy3yGrbcwCgYIn50wK5+es5Zjpf1XFAgP68D55f924T9jcYw0/j2vyCkYGEubxJJ+NGYwzVM3DlwJJjzPRp6IP2kqfFKbVjOmqR1gKujQREITSrYFjEtGU0m7kr2zZsuuxfcETkoAJNP/GgrLo+LPLzHFyN887KexPbaefjDVHP4REjUYTbFXnQjPUB7/9Z7tWMwQILzGbGw6fXdEd4BGs9+SZuHg8s3doOb7kqLUS+8QpQY3dRaOwZR+sRCqYFZlxR9OI358FoWiRXgCWqwXyFOy6SuPw03g6FJRKGWmlr5ufj8TeHxxVrsSPvwEEI9ejiM/7XMuL2K8wPy9bta2D1jRhEEpSqzd6zIOs1WJkjaAY+1i7ERRxgFgnathfbKEHV5x7RtPNJ2OAcKWgg9EAkAeX+HGD0FFax6WXTKM+HiPyLvfjms7AL4pm7d5z30Qtde5dQUaXN2RUCsF7L6rOpgKxadjKhV4wO+KUGpwh7LS7UHlPIZACTNs3GLYFZRJHgPOC78ioZS9SUedv3ogCZqsLWBdMKvv02Mj2SzLa0aT4Uly9mjgGsXpSr86eGLNYtaQjv2oV7KIeClE7choDBJFjR+TNTASzhVIXakQVARvLv8QAWktxGMKc0j9I9hw8NsqqeB0ZJVtId7I7bvAFZqzW3WQzW420H5Daqg5fZTOoivIcZh/rWfSgyIv4sxMXRdE7VV3I+g3IjO7XrPxHrxZgursTXDHyNnQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(1800799024)(7416014)(376014)(82310400026)(14060799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pOw0zKuPx5WDQr73M1c9B+BcDkL8r1lRkGQkfkbHFqSQfWAkE8B4+zsfq9wCrVK+9NfRDbdLDVYZd/XONHw+gwvVk6MsagVKfi9HjOJ9hUJ9b7W3f9zAVxe9Ne9HZUxdOy/nQk64Uc70OkuWqq1g/qWktIDe73RmqXF0PFrhsSs5NPr2QiRNlpywtR9LTEIThX8JSQ6fpUTpf8YknNh05z3bkbsU3kTPoW+Fx9UJfY1zl6hEyhiKIjlZagiCc060Qi4f7WPqBs9+Qim+vrYrb1ztUmJOV3K36pKAVNsl5VFw7ZaoQTthNjwaNf2fzRP3HlIRQ342g1a48hlF5qSVJPNqsZFGs276JHpMYLUBuQYCHljlVP7bLTUec5wtbhRv3Hu4je1vIkxbdtc2LPK8pxUujBpBM8QItsXlZ47JbgEi4/OG5lx2F9kwHvAxdPBB
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 10:42:48.0105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 275b7df6-ca29-449e-a258-08de96ede840
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10580
X-purgate-ID: tlsNG-4011c0/1775817774-BEB4D0B1-0ADCCE42/0/0
X-purgate-type: clean
X-purgate-size: 6048
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[arm.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 285863D5C8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTWlsYW4sDQoNCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBiL3hlbi9h
cmNoL2FybS9kb21haW4uYw0KPiBpbmRleCA5NGI5ODU4YWQyLi4yNDFmODczODZiIDEwMDY0NA0K
PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMNCj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFp
bi5jDQo+IEBAIC0yOCw2ICsyOCw3IEBADQo+ICNpbmNsdWRlIDxhc20vdGVlL3RlZS5oPg0KPiAj
aW5jbHVkZSA8YXNtL3ZmcC5oPg0KPiAjaW5jbHVkZSA8YXNtL3ZnaWMuaD4NCj4gKyNpbmNsdWRl
IDxhc20vdmlvbW11Lmg+DQo+ICNpbmNsdWRlIDxhc20vdnRpbWVyLmg+DQo+IA0KPiAjaW5jbHVk
ZSAidnBjaS5oIg0KPiBAQCAtNTUwLDYgKzU1MSwxNCBAQCBpbnQgYXJjaF9zYW5pdGlzZV9kb21h
aW5fY29uZmlnKHN0cnVjdCB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbiAqY29uZmlnKQ0KPiAgICAg
ICAgIHJldHVybiAtRUlOVkFMOw0KPiAgICAgfQ0KPiANCj4gKyAgICAvKiBDaGVjayBjb25maWcg
c3RydWN0dXJlIHBhZGRpbmcgKi8NCj4gKyAgICBpZiAoIGNvbmZpZy0+YXJjaC5wYWQgKQ0KPiAr
ICAgIHsNCj4gKyAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywNCj4gKyAgICAgICAgICAgICJJ
bnZhbGlkIGlucHV0IGNvbmZpZywgcGFkZGluZyBtdXN0IGJlIHplcm9cbiIpOw0KPiArICAgICAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gKyAgICB9DQo+ICsNCg0KVGhpcyBmZWVscyBvayBidXQgdW5y
ZWxhdGVkIHRvIHRoZSBwYXRjaCwgYnV0IGFsc28gdGhlIHRleHQgbWF5YmUgc2hvdWxkIGJlIHNv
bWV0aGluZyBsaWtlIOKAnEludmFsaWQgZG9tYWluIGNvbmZpZ3VyYXRpb24gZHVyaW5nIGRvbWFp
biBjcmVhdGlvblxu4oCdLg0KDQo+ICAgICAvKiBDaGVjayBmZWF0dXJlIGZsYWdzICovDQo+ICAg
ICBpZiAoIHN2ZV92bF9iaXRzID4gMCApDQo+ICAgICB7DQo+IEBAIC02MjYsNiArNjM1LDIxIEBA
IGludCBhcmNoX3Nhbml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRl
ZG9tYWluICpjb25maWcpDQo+ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICAgICB9DQo+IA0K
PiArICAgIGlmICggIShjb25maWctPmZsYWdzICYgWEVOX0RPTUNUTF9DREZfaW9tbXUpICYmDQo+
ICsgICAgICAgICBjb25maWctPmFyY2gudmlvbW11X3R5cGUgIT0gWEVOX0RPTUNUTF9DT05GSUdf
VklPTU1VX05PTkUgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywN
Cj4gKyAgICAgICAgICAgICAgICAidklPTU1VIHJlcXVlc3RlZCB3aGlsZSBpb21tdSBub3QgZW5h
YmxlZCBmb3IgZG9tYWluXG4iKTsNCj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+ICsgICAg
fQ0KPiArDQo+ICsgICAgaWYgKCBjb25maWctPmFyY2gudmlvbW11X3R5cGUgIT0gWEVOX0RPTUNU
TF9DT05GSUdfVklPTU1VX05PTkUgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgZHByaW50ayhYRU5M
T0dfSU5GTywNCj4gKyAgICAgICAgICAgICAgICAidklPTU1VIHR5cGUgcmVxdWVzdGVkIG5vdCBz
dXBwb3J0ZWQgYnkgdGhlIHBsYXRmb3JtIG9yIFhlblxuIik7DQo+ICsgICAgICAgIHJldHVybiAt
RUlOVkFMOw0KPiArICAgIH0NCj4gKw0KPiAgICAgcmV0dXJuIHNjaV9kb21haW5fc2FuaXRpc2Vf
Y29uZmlnKGNvbmZpZyk7DQo+IH0NCj4gDQo+IEBAIC03MjEsNiArNzQ1LDkgQEAgaW50IGFyY2hf
ZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLA0KPiAgICAgaWYgKCAocmMgPSBzY2lfZG9t
YWluX2luaXQoZCwgY29uZmlnKSkgIT0gMCApDQo+ICAgICAgICAgZ290byBmYWlsOw0KPiANCj4g
KyAgICBpZiAoIChyYyA9IGRvbWFpbl92aW9tbXVfaW5pdChkLCBjb25maWctPmFyY2gudmlvbW11
X3R5cGUpKSAhPSAwICkNCj4gKyAgICAgICAgZ290byBmYWlsOw0KPiArDQo+ICAgICByZXR1cm4g
MDsNCj4gDQo+IGZhaWw6DQo+IEBAIC05NjUsNiArOTkyLDcgQEAgZW51bSB7DQo+ICAgICBQUk9H
X3BjaSA9IDEsDQo+ICAgICBQUk9HX3NjaSwNCj4gICAgIFBST0dfdGVlLA0KPiArICAgIFBST0df
dmlvbW11LA0KPiAgICAgUFJPR194ZW4sDQo+ICAgICBQUk9HX3BhZ2UsDQo+ICAgICBQUk9HX21h
cHBpbmcsDQo+IEBAIC0xMDIxLDYgKzEwNDksMTEgQEAgaW50IGRvbWFpbl9yZWxpbnF1aXNoX3Jl
c291cmNlcyhzdHJ1Y3QgZG9tYWluICpkKQ0KPiAgICAgICAgIGlmIChyZXQgKQ0KPiAgICAgICAg
ICAgICByZXR1cm4gcmV0Ow0KPiANCj4gKyAgICBQUk9HUkVTUyh2aW9tbXUpOg0KPiArICAgICAg
ICByZXQgPSB2aW9tbXVfcmVsaW5xdWlzaF9yZXNvdXJjZXMoZCk7DQo+ICsgICAgICAgIGlmIChy
ZXQgKQ0KPiArICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gKw0KPiAgICAgUFJPR1JFU1MoeGVu
KToNCj4gICAgICAgICByZXQgPSByZWxpbnF1aXNoX21lbW9yeShkLCAmZC0+eGVucGFnZV9saXN0
KTsNCj4gICAgICAgICBpZiAoIHJldCApDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9t
YWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4gaW5kZXggZTg3OTU3
NDVkZC4uYTUxNTYzZWUzZCAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYw0KPiBAQCAtMzUsNiArMzUs
NyBAQA0KPiAjaW5jbHVkZSA8YXNtL2FybTY0L3N2ZS5oPg0KPiAjaW5jbHVkZSA8YXNtL2NwdWZl
YXR1cmUuaD4NCj4gI2luY2x1ZGUgPGFzbS9kb21haW5fYnVpbGQuaD4NCj4gKyNpbmNsdWRlIDxh
c20vdmlvbW11Lmg+DQoNCk5JVDogSW4gbXkgbG9jYWwgYnJhbmNoIEnigJl2ZSByZWJhc2VkIHRo
aXMgb24gdG9wIG9mIG5ldyBzdGFnaW5nDQoNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9wdWJsaWMvYXJjaC1hcm0uaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+IGlu
ZGV4IGNkNTYzY2Y3MDYuLmQ0OTUzZDQwZmQgMTAwNjQ0DQo+IC0tLSBhL3hlbi9pbmNsdWRlL3B1
YmxpYy9hcmNoLWFybS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5oDQo+
IEBAIC0zMzAsNiArMzMwLDggQEAgREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUodmNwdV9ndWVzdF9j
b250ZXh0X3QpOw0KPiAjZGVmaW5lIFhFTl9ET01DVExfQ09ORklHX0FSTV9TQ0lfTk9ORSAgICAg
IDANCj4gI2RlZmluZSBYRU5fRE9NQ1RMX0NPTkZJR19BUk1fU0NJX1NDTUlfU01DICAxDQo+IA0K
PiArI2RlZmluZSBYRU5fRE9NQ1RMX0NPTkZJR19WSU9NTVVfTk9ORSAgIDANCj4gKw0KPiBzdHJ1
Y3QgeGVuX2FyY2hfZG9tYWluY29uZmlnIHsNCj4gICAgIC8qIElOL09VVCAqLw0KPiAgICAgdWlu
dDhfdCBnaWNfdmVyc2lvbjsNCj4gQEAgLTM1NSw2ICszNTcsOSBAQCBzdHJ1Y3QgeGVuX2FyY2hf
ZG9tYWluY29uZmlnIHsNCj4gICAgIHVpbnQzMl90IGNsb2NrX2ZyZXF1ZW5jeTsNCj4gICAgIC8q
IElOICovDQo+ICAgICB1aW50OF90IGFybV9zY2lfdHlwZTsNCj4gKyAgICAvKiBJTiAqLw0KPiAr
ICAgIHVpbnQ4X3QgdmlvbW11X3R5cGU7DQo+ICsgICAgdWludDE2X3QgcGFkOw0KDQpIYXZpbmcg
dGhlIHBhZGRpbmcgZXhwbGljaXQgZmVlbHMgb2sgdG8gbWUsIGJ1dCBJIHdvdWxkIHJlbHkgb24g
bWFpbnRhaW5lcg0KY2hvaWNlLg0KDQo+IH07DQo+ICNlbmRpZiAvKiBfX1hFTl9fIHx8IF9fWEVO
X1RPT0xTX18gKi8NCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3Rs
LmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gaW5kZXggOGY2NzA4YzBhNy4uMjMx
MjQ1NDdmMyAxMDA2NDQNCj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oDQo+ICsr
KyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaA0KPiBAQCAtMzAsOSArMzAsOSBAQA0KPiAg
KiBmaWVsZHMpIGRvbid0IHJlcXVpcmUgYSBjaGFuZ2Ugb2YgdGhlIHZlcnNpb24uDQo+ICAqIFN0
YWJsZSBvcHMgYXJlIE5PVCBjb3ZlcmVkIGJ5IFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04h
DQo+ICAqDQo+IC0gKiBMYXN0IHZlcnNpb24gYnVtcDogWGVuIDQuMTkNCj4gKyAqIExhc3QgdmVy
c2lvbiBidW1wOiBYZW4gNC4yMg0KPiAgKi8NCj4gLSNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZB
Q0VfVkVSU0lPTiAweDAwMDAwMDE3DQo+ICsjZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZF
UlNJT04gMHgwMDAwMDAxOA0KDQpJIGRvbuKAmXQgdGhpbmsgdGhlIGNoYW5nZXMgaW4gdGhpcyBw
YXRjaCBhcmUgYnJlYWtpbmcgdGhlIEFCSSwgc28gdGhpcyBzaG91bGQgbm90IGJlIGJ1bXBlZDsN
CnNhaWQgc28sIEkgd291bGQgcmVseSBvbiBAQW5kcmV3IG9yIGFub3RoZXIgbWFpbnRhaW5lciBm
b3IgdGhpcw0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

