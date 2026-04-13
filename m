Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLxgFMvY3GmcWQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:51:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB493EB91A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Apr 2026 13:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281110.1564156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCFpC-0002sT-0f; Mon, 13 Apr 2026 11:51:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281110.1564156; Mon, 13 Apr 2026 11:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCFpB-0002qk-Tz; Mon, 13 Apr 2026 11:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1281110;
 Mon, 13 Apr 2026 11:51:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Luca.Fancellu@arm.com>) id 1wCFpA-0002qe-6l
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 11:51:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCFp7-002nLI-Fh
 for xen-devel@lists.xenproject.org; Mon, 13 Apr 2026 13:51:27 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcd8b7-5cb7-0a2a0a5109dd-0a2a450b8990-38
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:51:26 +0200
Received: from [52.101.69.9]
 (helo=AM0PR83CU005.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <Luca.Fancellu@arm.com>)
 id 69dcd8be-bca8-0a2a450b0019-3465450905b0-3
 for <xen-devel@lists.xenproject.org>; Mon, 13 Apr 2026 13:51:26 +0200
Received: from CWLP265CA0468.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::21)
 by AS8PR08MB9744.eurprd08.prod.outlook.com (2603:10a6:20b:614::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:51:21 +0000
Received: from AMS0EPF000001B4.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::be) by CWLP265CA0468.outlook.office365.com
 (2603:10a6:400:1d4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 11:51:21 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B4.mail.protection.outlook.com (10.167.16.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 13 Apr 2026 11:51:21 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by GV1PR08MB11147.eurprd08.prod.outlook.com (2603:10a6:150:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 11:50:14 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 11:50:14 +0000
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
 b=xZNQVCzCKkXZPF9ecR6BtXQFLFJZvs0SeAoR4SLmsMwSI2JAK3na7TBfWkF03DtRo7/3CPGQ1rMCpye8fDItxPj+Z3+ByLH/o2DGGblDQI8kmnqNwl3FCfwMv6l7JVHB16gxXx03hViqU2L2dAHRqZYEz+CEWnXlgNnHuZIYp213Wf5LJoEZOPmRvbhg48/7HA+ZhDvpnozunwMxq+g7tN4KGLx7lk7NyhgoOxZXUs0x4uqGuw8QIARIZh2qrb01qh6nBOvKvV8AQ3vEpg5Xk/X8tN+FpmO1zfQrf82Ysh7WdKix+hsDWftVt4HQ1b0g1vXXnTNkwO67rfL5Y8Kulw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YwGIOcxhYngTLwhIGyiIMx6vouGo3F+MNrV+Lkof/8=;
 b=CIFrSkiET6+FPlf/CSTMdXrwCTZou8JBBZ2WI8JejLgpvvQGQAgrFz8egn5iZFuUzNgJu9ladNUerfNsuhTXNc71dok0M8FXa/jBCTEVnGJ6PiICau3UfGHHCjLODzy+Wz9G+qakRH/9z3hu/TKILCw37BCm72vxJ6N+iEHUQ4C2P8vbtoBY13dPc8F+hRXxGfKtCte/NdnGPhs5QAdXbKJhOKZ/WouIaRWFdI7EYxsMuUI8Y9cdd5fWxFiDoDAOBn1Ay19RUmQuZa9eDNhXwUTxI6xsiZGGnJ0IthuRLpiEpnWrAwM0QQ/H3N02Z7HgrVNeqZpI4jTnaoDeA3MfAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=epam.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YwGIOcxhYngTLwhIGyiIMx6vouGo3F+MNrV+Lkof/8=;
 b=qZsjj1urdw3X4zjNSYu5dOZNs7gE1KSgXmMBGX6xg03apUrFD/vbn24s99xhUQ48RQbklkqNRtPUbTF/i5WV2lAZgLBPKRV8WcgB+dPDk9nhQeoVW/rx3irlxhsGGrXScGJa5Yxv/YW+e2o7MDkZzn4sEJYkwLWFRlQ+Wl1+PHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VatQjqs56JPiMH8ucqBUnCMDKw/NoDoL3CYcM5suzhLjoUCsrGIYIpGYjX/uc7tPN3VrBL78IJtVApTynWR/2IC6sSbSO/SwlH8OtbQ2zdLjK4P75TlmgFF5qA42kSJCBCNQfvWgW3KE5DxUMO4mhJTXL0yl+DBN9jVaoGUKJB3wBHbz2bWmn392jFrCsQfVylPiZpEGl94cwuJ28WLxPW/bZrpQqGjLNbK66B06Uc630SMlj7qSalP2CRJZkHpZJyQ5F0shMmdFy0NRfsafxXn4n1OtRopjLcfFtBwrJdZ4r1yVelfdjhib9dcQbfx+KxfeAUaZwHlZgEPvx2asRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YwGIOcxhYngTLwhIGyiIMx6vouGo3F+MNrV+Lkof/8=;
 b=ni3JbeJtXwurtiO7alZidsWtKLF9Sh6pmSZVR3/IbPdYGg0QeiIhJ0tOyVNstHRKTTex+1N8cuZuauS/ZX4fmeN7oOIKtKmmYuZQRZJGFXxy1qdUUhy4W1h7nMB1AHsWYW+jr1EWTxh7BUCs/MOd93o6Ykwh0mr6kEBjLnmj118t6qg+YU6uNxBw90TD5sbe+XZbBimfUSbfvL+WXEjKBhtnwPNnKQ82m27o3KlJlqJiQsAfA/L3ynM4lHYVe0Gy8WH1gV4rS1v/VgG3u3oHejbpkW+hhrMswPlFgNkiTXiXCXE/lqk3ZejzdH22WSf6wY+2yM/Ajuab8nMUV24WHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YwGIOcxhYngTLwhIGyiIMx6vouGo3F+MNrV+Lkof/8=;
 b=qZsjj1urdw3X4zjNSYu5dOZNs7gE1KSgXmMBGX6xg03apUrFD/vbn24s99xhUQ48RQbklkqNRtPUbTF/i5WV2lAZgLBPKRV8WcgB+dPDk9nhQeoVW/rx3irlxhsGGrXScGJa5Yxv/YW+e2o7MDkZzn4sEJYkwLWFRlQ+Wl1+PHI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Milan Djokic <milan_djokic@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Rahul
 Singh <Rahul.Singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 15/23] xen/arm: vsmmuv3: Emulated SMMUv3 device tree
 node for dom0less
Thread-Topic: [PATCH v3 15/23] xen/arm: vsmmuv3: Emulated SMMUv3 device tree
 node for dom0less
Thread-Index: AQHcyzuw/Pcnjl0pp0C7t77+0BHaBQ==
Date: Mon, 13 Apr 2026 11:50:13 +0000
Message-ID: <39A65150-0D12-4CA8-AF1B-C14CFE30FB12@arm.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <c2eadb067d706e0f6f4289644d30cd4b1167c4df.1774918270.git.milan_djokic@epam.com>
In-Reply-To:
 <c2eadb067d706e0f6f4289644d30cd4b1167c4df.1774918270.git.milan_djokic@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|GV1PR08MB11147:EE_|AMS0EPF000001B4:EE_|AS8PR08MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: b762f554-c274-42c1-cf41-08de9952fb28
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 Tlt0gzFfCMPSjMK2EJQwtS3tBtlaljRF0fzxQYq62GGKgVKTEySg6fjomMx6/eXhQgHJ3IT0i95RW+dZPUzAN6oyUZqP0KuJfu9UsMuvJyjQ5opuzPnAWd+w/iZlynLvvA93hIzV+oHeMDsXvCf6Ys3dG3uf71Kg2xcDBm12VmfEyyHnU17pwZpDKhXMO3J2Ne+1v76lR/8VYnGLGvDfZRtw8GUlQ8FL6N5og+jFfY4dgJu5XNtAYcTj6Ir6glqoBVg+Ez33BjdbCh/ryTGe53uvwqtOQlZLdAiVJXM3xDacGanD2cx39HLEYhk2jAuOyrSc/XkD4O4/Q5Xw1B3kPs7jNWYKCgABKWH8bqtFhcy5gQdDGQyTfZZ6DSJCMsdCjDt24pPcTZCtMMZOP/m2RpQl+E+rxqLNa2ZAq7+JdjMPHhd/GdSsd0IhZ6kucvxKpsoLAVYQ3u5wnSOREotZl606vCoqqaACgcFgQ8ktd07Gt1ueC0W3VEg42lP8XsYwJOuqLC3d6mTAnkVJP+cJBc8tODuRSoV5cfMr78LmMyrbQ+XC88XHvHeZ39uclo1vupahkisYxl7hgCF6AbXAmis4lDtEgrXMzjs6FCyHWF9EDsD7cZ2wr7UvaD4YbTWjWo5j7xq2gOTT50SF1n+zL8p/Sr9jd8VjF+lxWrudel/vgmN/LcVsN2JRONDxV867+lRddsoTfJCyHns23M498fnCzwvQE0YL8+ezWIRjlmUzyy8b9SJrTtLwqDtMhIxX1s8qTVlNZRx7ngcAiUkxtJiGvBvT5j6SlKTrhIPRBU8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <2A591FDE10F2B646ABA3D47C638638A2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 lbMfACPDFIKpi6fy3Hm/+ycV7IomMErqthru7IIL9SFLAjIcsO96NawbNRaLPvt3xpy3tk+kqZzC2bH4I073KKZM2DJ0JUNujZWTfU+ZauStap4ZbRfgHTAOXKwEJTA9F05Nj/k0NPEknC10GVR/NPgSwiU49TlyPNa6GHm3K3GIW3Szbs/3hmJj8g6i1ThlzXtt+xqgKZcTJ/FNZYYc7Tq3oGSRh4o5UGgGVB1piTGDD2fndEARK/4yHa0Qk9zeZNl5LRN34m7U1CXdqwpaCBkv051EouoEZWcbXHFhkMZXM3DeSclMXOpVBQt+KQaLeJJOCYOn8UnNvyKXALaaoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11147
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a85cbf41-137b-4c68-9245-08de9952d30b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|14060799003|82310400026|35042699022|1800799024|7416014|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DkbRdkjJBj48f05W7xnId8TcqydTXRnqr13L5wkeIGxrk/AFGMQy4VBkGNqjTsLxMNfzUxO01nnVrPglD5vAlYv5unfkR1QbYpN/jIKGrYO9XJGV0gRC7n85gZ86RprnIejqtsRrsX2MVgj7P9dAeGBBJ+XabgsM/DASfDOJq87M8bdy5nGr8zIQCwnuU3YhP5emVzMiBiu+vbw6343+Ml6+XHgLpgjxSNBP9UswTGWdR/mpnQRUXsta99efFMUPq89tlyUeDXiSSEO17z/97ZKIzxlHpQX7VkTQy02pG26eMjkCDLRTbEFoeFJEswZzHoaz2m5ZxAFsi4NhxhszabmbMCexWfMEp9bgoIRo6404mGxp+lPr5X0pPLVCQX/G77U3zgJmDkofdIpylYskXEOo4IZlsOAjUGfB1fomeH1LFJXjKgC97w9zgKYSe/VXpcLmVN/y50rlKMgbXHOavUM/TxIB+f4QmP3nFzCDUeQmkMpppXUMGQuEewjRI9av+iHp2V9GzoGbj5v9ZjF5it5n/EWgO6qBSEyvDB8eJ0Aj+z4Gp1kNGyFmLt4xQmK46boetkxVUkqtLc3J3B8fZ2J2fuubdUQ3HRnk7hv6kgvWGbUIEhg59hfBwH7fzsf5MGEQkXl1qs/f+5rO34wbDd1Mah/jktYFmpTQ/T6mYytHDQNPgfzYZLYisZm/fGroKjNU7yzg6TgBHYC0D2w65dwTBPnkF1rgG2iLwBx5Mjal82djZWeGzEouQWtEN5r/O3zMhFGY85kZTFxZ2Cf/Ug==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(82310400026)(35042699022)(1800799024)(7416014)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NgMv1DWsCj05U9MwExrDKshHq8vNxCW+EGaZv+/A1DcCxdiAXDHD6ytiYUWvnEmp2M5VR7BCkiLkxuZH5H7Tif2E8vHoSwg9YvXRseKGH6TqYHOup+SaCMtzLQVjSsgJHwGWWXIpJKuHmqi+65r3n/dyK7xc13SOFzOWimmb9hjP7sHXAapnv2ydu4hP+XCdv3sNxuLZdKVhqtETX5hwqIaunBbJkGzgJrQbFsvxBVgyyW55JBt5OXjVkQl8oAeCcSfhjwcEvvnSjmkIMIt2tktR0WjatuWM56iDhsFpz8Xi2lwj7oR3j+nzaACVEjoLGqFuNpQCb/SP8vAqK8Y6iwTCP7+mRXRfx1COBGwftBuLX992eTHg2YZ6eSpHZyW00vAj4+iWaTkYpBbpLlnk6ldWrhXW84c2DWOcWtQFx52cqxFf38g8Q8XZiSZY00mY
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 11:51:21.2345
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b762f554-c274-42c1-cf41-08de9952fb28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9744
X-purgate-ID: tlsNG-42698a/1776081086-EE74A2A1-7F60D61F/0/0
X-purgate-type: clean
X-purgate-size: 1482
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:Rahul.Singh@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[Luca.Fancellu@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:dkim,arm.com:email,arm.com:mid]
X-Rspamd-Queue-Id: AAB493EB91A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

> On 31 Mar 2026, at 02:52, Milan Djokic <milan_djokic@epam.com> wrote:
>=20
> From: Rahul Singh <rahul.singh@arm.com>
>=20
> XEN will create an Emulated SMMUv3 device tree node in the device tree
> to enable the dom0less domains to discover the virtual SMMUv3 during
> boot. Emulated SMMUv3 device tree node will only be created when cmdline
> option vsmmuv3 is enabled.
>=20
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
> xen/arch/arm/dom0less-build.c         | 53 +++++++++++++++++++++++++++
> xen/include/public/device_tree_defs.h |  1 +
> 2 files changed, 54 insertions(+)
>=20
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.=
c
> index 067835e5d0..a48edb9568 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -218,10 +218,63 @@ static int __init make_vpl011_uart_node(struct kern=
el_info *kinfo)
> }
> #endif
>=20
> +#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
> +static int __init make_vsmmuv3_node(const struct kernel_info *kinfo)
> +{
> +    int res;
> +    char buf[24];
> +    __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
> +    __be32 *cells;
> +    void *fdt =3D kinfo->fdt;
> +
> +    snprintf(buf, sizeof(buf), "iommu@%llx", GUEST_VSMMUV3_BASE);

PRIx64 ?

The rest looks ok to me, with that fixed:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca



