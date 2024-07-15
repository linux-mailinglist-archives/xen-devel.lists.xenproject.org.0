Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCFC931159
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 11:37:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758801.1168287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTI8G-0006XB-Co; Mon, 15 Jul 2024 09:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758801.1168287; Mon, 15 Jul 2024 09:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTI8G-0006Va-9c; Mon, 15 Jul 2024 09:36:32 +0000
Received: by outflank-mailman (input) for mailman id 758801;
 Mon, 15 Jul 2024 09:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9lNX=OP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sTI8E-0006U7-97
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 09:36:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2613::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b63b1fa9-428d-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 11:36:29 +0200 (CEST)
Received: from AM6P191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::48)
 by DU0PR08MB7413.eurprd08.prod.outlook.com (2603:10a6:10:351::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 09:36:24 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:209:7f:cafe::1) by AM6P191CA0071.outlook.office365.com
 (2603:10a6:209:7f::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Mon, 15 Jul 2024 09:36:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Mon, 15 Jul 2024 09:36:23 +0000
Received: ("Tessian outbound 5b0e0b3c9995:v359");
 Mon, 15 Jul 2024 09:36:22 +0000
Received: from 56f48b2c22c7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 375B9750-F8EA-49D2-874A-3ECCD90B3F00.1; 
 Mon, 15 Jul 2024 09:36:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 56f48b2c22c7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Jul 2024 09:36:16 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by PA4PR08MB5885.eurprd08.prod.outlook.com (2603:10a6:102:e6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Mon, 15 Jul
 2024 09:36:14 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 09:36:14 +0000
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
X-Inumbo-ID: b63b1fa9-428d-11ef-bbfb-fd08da9f4363
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=N54rAXrcoydKKVImcd3bDFnk6wRFDrq9AstEaqm5INpPMbc++o4WzZw54TKme9cyMc99nIHRYAuFPGyz6GpmFVXauWnDSkieqG3qRNG0xhFYW6uHsXLbJ7cgvOs1PKVc1TM0dj0tRnaPCozk8DN/VnJocuTIwa0KRp6zGiAyhNpK0UP7yVkZhGkUycyZmdOdXl8h4nYx0qJXN+sZsuPjqhzTjx1lOhEoegBP/D/EuhgFfpbjxiT7bJpRR+RWl4o4WTEVD0UsYESGzE/XvaUsenRB0/Q7eZ2Bzutb2tnEIfzr0yXJoLZGk30qraUlm/o8kv92GjNGs/UYarSgahAtDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnLdjVn8PkLdsHbiS/49cUWOPTqApqZ8xCUmAYvUVQM=;
 b=dqLDNA7HxNP/sKz0kXmGIkwTF4YQ6C8VsvggQaHyh1MiTgRjfCJ0xBSoSP8nh5PYv3y4TwH4RDahPYd3nQaR/1BMy90igOBse5M1Ojymnki76rjFgoQAoM2yz9qNeLm7RRbPs40S/kNh+UKedRkZUWgMCERtFNwBZRzjIzHk3S36olCrhs7uDdaCRr2eNoXKtQ8gFH+tqywP1A9WiPOpDkpo96yvYrY/NLicrY9xpJtu85eci/Wc4C7XeERbo57MD+XkHuxUG14+RSYNUP9+SCBk9xcp/O1zDhNBWyAS0+gT8ZbGSx8tunLBBv/5XT8sZn4E76NEVFq009kvS3W2PA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnLdjVn8PkLdsHbiS/49cUWOPTqApqZ8xCUmAYvUVQM=;
 b=ah/u0HdlznZvIf2voq8DGvmrUPbwoojNYpHVsgEiObuoY68fVsRw/nILw5N5n2OFrvbL0o3IxADmG8IGa8OV2hF5ar4tcOOIY7T4+lEcYijTwW7Ze7x8TGNaE3N2YHsUr66dyo7+haKCbFYXVHbxn3q4slAA6kQT62FfIpenHvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f2e7ff1e96cca88e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9+Rnu3iYi0iyGHThe1fKpYuqcZvXdcDhutqLlI6YX9d5DHi8tfTGnm5Bxec+7f4WK1h1pDiLg8d3yYmJ2iw8/VdgzqONTPkpuqncd5I779c1xI1BZq0AZOir3e98B0vJhsPp2NYQWuR8ts9VtBy/ImnFZ+vT4068mjB4ETIK5EO2PfLxrfRzqR0fDTUFdGbYpCjWcncjXisesQY1u1UAL+9v1396iMqXgJRpVlpB3p55ZbRDxPrEEFBWLxahyG4I316yWrZaHT2faHX8GhQcTTIrcoLuun9PfBUA0CW49QRRZr476vVj9xSC+Rrlj/aR3L+s322IBFYmc9O+J8R1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnLdjVn8PkLdsHbiS/49cUWOPTqApqZ8xCUmAYvUVQM=;
 b=CEve8X5wslobxP4xuUAY7GcRf88IaYxEATchh2DaNmpry+D1hZ/QpqHbuySQh6MT/H4JMcViSbpThMsM9Zlm7xfiAGk+/llly4/fkXg5F54XRhhVnAHvtKkEyrXkPtWwQHpw1VIP9cNHkIS0x8UD6kpSUpXE+LTWXYouC1JF4x3oVNpx0q3MwRnrhVBNZzhPQXHDur4HWGrSFojTP1LK2QWW1wqgzmFfHvVNL4Z0GbtIxHpMIqnhNRBNuXZZ1B0tH1E4OINqupVPbVRgioXmQjDS1XHriVI6ucLB9xr1h6GwCgKoFDP0B0HZCsMICZfPcnCnd+kBZYYlO/RQftiItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnLdjVn8PkLdsHbiS/49cUWOPTqApqZ8xCUmAYvUVQM=;
 b=ah/u0HdlznZvIf2voq8DGvmrUPbwoojNYpHVsgEiObuoY68fVsRw/nILw5N5n2OFrvbL0o3IxADmG8IGa8OV2hF5ar4tcOOIY7T4+lEcYijTwW7Ze7x8TGNaE3N2YHsUr66dyo7+haKCbFYXVHbxn3q4slAA6kQT62FfIpenHvA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.20] MAINTAINERS: Add me and Bertrand as device tree
 maintainers
Thread-Topic: [PATCH for-4.20] MAINTAINERS: Add me and Bertrand as device tree
 maintainers
Thread-Index: AQHa1poTDtSNYVwz3E2hgS1ZavrdMLH3h52A
Date: Mon, 15 Jul 2024 09:36:14 +0000
Message-ID: <E849833C-B1D5-46F8-84BB-DE788E126014@arm.com>
References: <20240715093251.35371-1-michal.orzel@amd.com>
In-Reply-To: <20240715093251.35371-1-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|PA4PR08MB5885:EE_|AMS1EPF0000004A:EE_|DU0PR08MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: f503c837-dbf6-407f-f514-08dca4b19736
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?ja6Q45/dTrQUwSsrqp17tTBV5HZTgQ0sNolTfmCzqdwb1m+a+DYJnsw2ooWu?=
 =?us-ascii?Q?5Gj9Tm3pN0cdn30gw6nIQgpDHt/YnUl4OVpsxLbjY6R6Z+EiUIZpUGVTRrbY?=
 =?us-ascii?Q?x1LEX115TEcrbyKEz/X8r7HRZ3XYISQA8o0KU3ssCM/w5K1mF5rtujF8UBKj?=
 =?us-ascii?Q?Z26Hk4SRGr/5zBqZrtV5ZZELNDyTBtwvVBfiNBCCcuC5SGf/tUB1hQj6IkMH?=
 =?us-ascii?Q?ClWKTCxewZp7xOYtweot9NOIQu+VU18/3LPFj2EF8uygmsA5vEuR1kcjc8b4?=
 =?us-ascii?Q?cjvE/WgB3Ux4HMoSjRxM9K7sozq07EZ0uR6ek13kYYZGIFca9YuvxoihDjcG?=
 =?us-ascii?Q?y3+cBbsPdPU5IM++fPpw31kPDrnYaWvb956Lubi78BpiwUIHTACi/dvLBiiH?=
 =?us-ascii?Q?nbYlmAUfErfxa08HvF5bfmNgdo+mJ3KBJAjTqiGLXvf3JRSSy0j3WYpyojqz?=
 =?us-ascii?Q?0OhychNSgxgqI5ZXDDAEx+e+PzW8/joco6KknBnOFWbb5hPv0lULbtpABgf+?=
 =?us-ascii?Q?8fSGArGNiTPvFbGsbWS313yqPVD0gLJTNaWyYlGzDjOiHNA0ASOpdi0Y/WFe?=
 =?us-ascii?Q?t9HxusLi7ON+IZfTT4LQ78zyWHi5A0sFM+JrsEiojNefE7Fj1gkGKoqBXNcP?=
 =?us-ascii?Q?r3MJ5Jtpz6WJ2v68S7+E7wVLsaLaVdBg7o+NZTTWYrsbSSE6T3nFfvGQ+vay?=
 =?us-ascii?Q?geVAmE0MsVNWH+qCU7GCOB8gTuDIjul8kI6l/8xSBM4bleoyCJc3iva7wC9m?=
 =?us-ascii?Q?d3GO/sHOpJ/4joIPV67Hw9rcNgwANkW5tHhfIeLBT+p6Fab8sVjkLmzhrKIm?=
 =?us-ascii?Q?okDZzvtHMzHPKYdgfdrZuc3G+O0hk7JHNmTVWAthOQ4DJBBNnvWPoYfvUycD?=
 =?us-ascii?Q?6nBvQnQKoWzqGAK+g2I81XEHckMHt+amhrjAsv3sSM/MdtYeLNoB5MYFXDBP?=
 =?us-ascii?Q?p6wGMOkF3ytOoByibdUDhGlSG9sM5ovBKEip1kcqzIJU9VSLhnryTi+7dtHn?=
 =?us-ascii?Q?3MIDFgXJeh33wfWCiHhaQWZcHycwrBOvm4z7q+RztOQfYplaOCpQnypjrl/9?=
 =?us-ascii?Q?TR8D4AJ2prwcaP8bhSZv7sucp15xjE3JTcyi4Bh8Yw76SkoKlLzgom1WGVUJ?=
 =?us-ascii?Q?MHFzHvJ073RpVSg+I8Bil/PQ0KErWbJQXMbeYoXr1IjMItKFltxAp3Epo96j?=
 =?us-ascii?Q?M2mhO/42ci6H2liFOWzJHjSQ+IHVzfpR3vNwEZ5LDGOJupGED8heCMAi219r?=
 =?us-ascii?Q?wQWGh3byc920CxH4v27xEwBE/fR2yuBJAYUmwuWaBCJxKtwdYwlJvZBGTOVV?=
 =?us-ascii?Q?mW7vhI0dXQVn1qE+slAhYIPT/N0kro6BLWgBl8PjbFe1h1lNnJHbmkx1v4uF?=
 =?us-ascii?Q?tarQXwtW0fYaRnvq7gWdIMsqj96/8+YCZDEuo6peju2fUsxP8w=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F6B40A4A65D18247ABD66D535D29C46D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5885
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4b67e1e4-7c2e-4407-3ba3-08dca4b191e7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7yIZh7HRSaTm/goaii+3XRhDNeF18LcPPFHt7zMnQQa5j+MQzXPpcIqF57rP?=
 =?us-ascii?Q?h0dZZlL0gi/MJSpZnPGY94g/O/TjLPM+gUE/XoS6C6lvkh8CSFJgVth9+b/l?=
 =?us-ascii?Q?tUHTtfbkBkiPol+7KIp0v5hIdmFdWO2d58LTjm+wFy9O6uLjaZWKv8oOyiHu?=
 =?us-ascii?Q?H6UfJwDUQklr18KuKuViRizh59iSsz3LSVh2LYSAIUudpsx5IjZlVOo6AmrG?=
 =?us-ascii?Q?xI/E+xCIoCYQNQoL97U6Xnx5hRvQLR1IyNV99pvCUzkBHpZ+1vHdJZK0L4fw?=
 =?us-ascii?Q?pbWBxC2xAsQ+opcRGmZGIVuMhly392tQ75kg00tpYYM5TcIxTCSG0CEvkCLu?=
 =?us-ascii?Q?600g4GKWfNN15dbzQD/949hpCR6eOvE2qWtyCugaSg4th1QjL6H5SqleUeyY?=
 =?us-ascii?Q?1aWbqsJWyrh4T8gG1+kzSvDYceuT5UF8imKZpdgb0W1OxK7ahZsbsMA354eb?=
 =?us-ascii?Q?NuHnSF3VzdBTlXgZj6MSOIaZGPv2vbBP59jPto6rpp6SQM6f8cwH8j1ZHvP4?=
 =?us-ascii?Q?SJPaQlpePZn9/9oa/hjBo3gls4go8TufJgOfMjW9w4TKXgDUQOiyU0wLPa3L?=
 =?us-ascii?Q?AJ4yDdM6NLJrlUzep+rtCAUGUmrInqZBGiYZltJPTOW3H5Qre0SoKLaCvvXB?=
 =?us-ascii?Q?Od3Xl4JsSKIO/OxqgdBH9VaKEkz3NC/ujHGEWJ0r/ZVbgospK99K/qzfacdQ?=
 =?us-ascii?Q?cpuCkYS9VTd/fw0ukaES49DsML2PgqI2gHLTqJTgZ4vtr0WgVDCnEeoKNP/I?=
 =?us-ascii?Q?jcKXGgAuxUuUS2v6iWn3QmFzeR5LKL6hyfWanQEqGYBSK0ceGW/6qyOQYjZf?=
 =?us-ascii?Q?4SFH1Vi0KmGtn54Qhsbke1blyxJmY0rX9nv6oB0MLvVdvp1O0HXi8j5qjKSa?=
 =?us-ascii?Q?RlgHvEe60okGlbHnVSQUY390acsd2/0oA+msn/9T+0VJsndq9T2uloBw4iz1?=
 =?us-ascii?Q?1LtqaiAW/+syYjzBh0lXT4DOWodV9xqgnAMnVVCDm5KiTCjTfr0jen1Kr7im?=
 =?us-ascii?Q?UdtcPTu8nO2KkOHHUVZS5AmXzGVY5Q6XYvqlVcDs2hm4U9fC20IBZ67NSjXc?=
 =?us-ascii?Q?Ec/fo+xY+yVbkfL6fYLI5SReDm0Faooa/WJ4k1omnORAJDylhODGfwDN12gS?=
 =?us-ascii?Q?FR69As/BMat9yYMU5shC0WMXHGxvxsEPN4x1zoshF55FGr/1RRZUCVZ3NodS?=
 =?us-ascii?Q?C/kcP01IO5KpmUTiUhNM35ogTGg1kV4IoY5RjgcKImR6P2kqBtnCfv8sA0s3?=
 =?us-ascii?Q?4VoQu7b5g2NexBeFtI04vmma2afqRQXUKRxj9f4ra9VBaYEzLpmFyBr+Nm4u?=
 =?us-ascii?Q?XCTerwfLmsb5XH9ktBo2+miRl5ZSZGguT+DJwmTLpUq45HomHFRkJf+ETJ52?=
 =?us-ascii?Q?6FRJd+folK+KaqI6x03onmjpEvQ0jhs2lNvlxILEq2s4JWCDoMU8Xr+/7Wd8?=
 =?us-ascii?Q?1xRhZm1vYEOGoX5pn2hhv4yfGGdCAjBV?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 09:36:23.2427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f503c837-dbf6-407f-f514-08dca4b19736
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7413

Hi Michal,

> On 15 Jul 2024, at 11:32, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> With Arm port being the major recipient of dt related patches and the
> future need of incorporating dt support into other ports, we'd like to
> keep an eye on these changes.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> MAINTAINERS | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2b0c8945270e..f47bdb33d510 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -293,6 +293,8 @@ F: xen/common/sched/*cpupool.c
> DEVICE TREE
> M: Stefano Stabellini <sstabellini@kernel.org>
> M: Julien Grall <julien@xen.org>
> +M: Bertrand Marquis <bertrand.marquis@arm.com>
> +M: Michal Orzel <michal.orzel@amd.com>
> S: Supported
> F: xen/common/libfdt/
> F: xen/common/device_tree.c
> --=20
> 2.25.1
>=20
>=20


