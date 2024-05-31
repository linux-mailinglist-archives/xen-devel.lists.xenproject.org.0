Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D698D642A
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 16:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733730.1140049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD2zY-0004bA-QE; Fri, 31 May 2024 14:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733730.1140049; Fri, 31 May 2024 14:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD2zY-0004Ys-Mk; Fri, 31 May 2024 14:12:24 +0000
Received: by outflank-mailman (input) for mailman id 733730;
 Fri, 31 May 2024 14:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tx2a=NC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sD2zW-0004Yh-Sq
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 14:12:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cad66a19-1f57-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 16:12:20 +0200 (CEST)
Received: from DU7PR01CA0030.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::19) by GV2PR08MB8485.eurprd08.prod.outlook.com
 (2603:10a6:150:c3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 14:12:16 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::43) by DU7PR01CA0030.outlook.office365.com
 (2603:10a6:10:50e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24 via Frontend
 Transport; Fri, 31 May 2024 14:12:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Fri, 31 May 2024 14:12:15 +0000
Received: ("Tessian outbound 6a5ce4665eb8:v327");
 Fri, 31 May 2024 14:12:14 +0000
Received: from bdf609efa8fe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3410EFDA-39EE-431F-84F1-55ABE1C838CB.1; 
 Fri, 31 May 2024 14:12:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bdf609efa8fe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 May 2024 14:12:09 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB4PR08MB9215.eurprd08.prod.outlook.com (2603:10a6:10:3f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 14:12:06 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7611.030; Fri, 31 May 2024
 14:12:06 +0000
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
X-Inumbo-ID: cad66a19-1f57-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=V8N7X9cXprRFcQgodZTZWm/0hNoL6I9VkJ4J4o/TCOD47QIZNhudypPbmuSPzLhcpXAFwsdDI0AQzsMEWSXR54vZp+QnPfj+pAJpYiP98F0rrAVbbOjrjCjKJQuQMx62ScV6VKB26drG+/+Bo9kK76MhE8uy7Mj0SY1s+uF+P6aWybW94SUVEpTbUSaXQvxyP7PrqbwP/FzrQQc2DQWA22EYdJUnEqP76FDfcng0G8xoZ7VvH6DhooygvUkayuIeznmMLmSk94KsxhGgOU+q82qcmfoWC2VrmTtx6Tw3/fHCwMNEZIViZwA21kKzqD8DOoXXOv66sA3mADtsbaYQLg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jInNIhdvRlovQ+I9As8WX1J+NR9g5ZKOmf2Zxb/tb9c=;
 b=Yy/Li4RyH2H2RrN8TRbwa6eWfiG8uiiiLHEaQGzN7j03N/u6XFq7MdlXHyhSDYHsEEI0oaXJgyRZczGoXiUaqK/0cLnz7Q1sFDOJoDuiNiD8TVVP6jt8liqlv++soVeuRmGsFaqHsdbczGp7eqhq2/8rpE7ifh15j6RBfDDB+0zz4373+Aovb4xDLfE7jHCdswOd1w05P+4MzJfwlEBYBPIXkZsvEYT4QBXNxR+EEQoi7ralB/PYSUc4orTLWuIWGRM9FGUXsfZ1nbEry2MJNC/oDe0yk+QgITKpAWPXKMADuJ+lmnXi1c7rOOjj+q5hNIH2yhOvLfAkoG1qJzfGZw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jInNIhdvRlovQ+I9As8WX1J+NR9g5ZKOmf2Zxb/tb9c=;
 b=dgNA22nBo0TeTJGwXmmKVxW0atW2ZWQ93cYHtOJJlkMOB4OrkhHgRQGlP7iUNmBaNOwJCfqLNz8HS4T+yS2+/yeMIYOOiqgbeuRBBclJt/7IJ634nRhYFUZaE0+sDKiFq87PubWYSICWOyxjWP1yZ/ytMZ2a9u73Um7P2qoRcC0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c4f40f3c8131a210
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NbhycE7XLPSn4NkZeG+yQQDP/U9FGBViiIz+QtT5uSwepzVoC9dPvIEUsMys8mSbEQ3hq5r9K/MoGngIDVGVwn00MMIuIntv5i3DESfHpnwalkI/CBO+88u85qvhr/OFNPw0HhFB5YmgbWC2RfNZFfM1f8oeW0wVjzxXAKj2xo+NOetOUUVmxjhRJ46HX3/sLGxRse7t9hQZEW7CBGBoTz2O1gG0a9oz2nkPuV7sz73aN6PDpLv2yNAuontGR2mntfaQO64gUmsaGYGfcswU6kOa/CZSRKAtpD3u0dSee/Id7mLWdcKs7vKW9OXvUkBQeUnxGkXFLmf0QqKdoTwK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jInNIhdvRlovQ+I9As8WX1J+NR9g5ZKOmf2Zxb/tb9c=;
 b=eGr9aataHBGBnt/LNaQ1IzeDpxrItuNYnm7p1I4u+sYaXVFRkJPUvbAF1gXQvJB4M+uIW/zmHqP5PG2pP3H3czMStcySnecWAYWd10RuzY8jjmVagMT3gKf8R0IqZdjK2/mxUZfO/kTY8j7/6kLkQPa7AlyQ7pg7QwTqBIB9hF2FWk0Crs8DbiAD1DKkFz20GI4gjmIGbVzvwbOFu3GXUbNiU/O7/BRM13URs/jlK2NwjX3ECtThWN9mTydF3AgCdOedPUp0zP3g5ULfFODIDIFROB5+m396l9KQZyhZW9Zd06JJinFjN12avf6WQnn5Yb+crpSSI4aOUsfQXFtknQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jInNIhdvRlovQ+I9As8WX1J+NR9g5ZKOmf2Zxb/tb9c=;
 b=dgNA22nBo0TeTJGwXmmKVxW0atW2ZWQ93cYHtOJJlkMOB4OrkhHgRQGlP7iUNmBaNOwJCfqLNz8HS4T+yS2+/yeMIYOOiqgbeuRBBclJt/7IJ634nRhYFUZaE0+sDKiFq87PubWYSICWOyxjWP1yZ/ytMZ2a9u73Um7P2qoRcC0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v5 4/7] xen/arm: allow dynamically assigned SGI
 handlers
Thread-Topic: [XEN PATCH v5 4/7] xen/arm: allow dynamically assigned SGI
 handlers
Thread-Index: AQHasZmDYpRVB5hNBU2Zi0KwxSKfZbGxZckA
Date: Fri, 31 May 2024 14:12:06 +0000
Message-ID: <04870ABA-2208-401A-B1CE-2FC9A9D75F04@arm.com>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-5-jens.wiklander@linaro.org>
In-Reply-To: <20240529072559.2486986-5-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB4PR08MB9215:EE_|DU2PEPF00028CFF:EE_|GV2PR08MB8485:EE_
X-MS-Office365-Filtering-Correlation-Id: db9285d8-d86b-4fef-b4fa-08dc817bac51
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?0QvAAnRsz2lZbdqRT4JNuigSpulSXQdX1GgslRi2zvCL6MunMGBqEREvf/yA?=
 =?us-ascii?Q?jKaeadz3EhWidRjNVWOR9DbHyy9TM1EURzZenQ2aKg8X/aWBrnFQXlI+PA/e?=
 =?us-ascii?Q?Gjt7MTQBFucuNK78Rnm+BFW5oge7XDiam38HR2Zout1Xn1lUNLyLEFYRBogp?=
 =?us-ascii?Q?PzVNVnVNvppdxi/0XU6xeH+uhlZeLBxcbNKJanT530YvQwpeUU/EyZLDPQrR?=
 =?us-ascii?Q?9xOy8Xmxk7ZJAwJsSa98SXBe0voWj1fyVq+8EQI2c7YWkLy+XGA4gPGUWapX?=
 =?us-ascii?Q?YbUqLCW98h/W2P55vt4INw/lltAsumQDQgMLcC0BEpAv+NbysDTqs+sL55N/?=
 =?us-ascii?Q?lcyM8ieV8txMgyviOLr/3hSus1nhQVrdyyOc+BY/Wv7015cgytThI2iBly/R?=
 =?us-ascii?Q?En6jH0W4aODLzlYuSKaxH62W7QDu+VZ9JskYAG2TU0FF6S2OwqHVP1K5wJtl?=
 =?us-ascii?Q?0nVV7A8I558qxMzpvP98kOkK8iQwRPGG5zPd6k42VWXcUZqxfkcJPfPFz8vR?=
 =?us-ascii?Q?HkTE483hktIQuX00QVPDWR/FeL0+Kn1KsyfW9+2NqDjb6UR71L6Fyiivxhpz?=
 =?us-ascii?Q?5v6GXy290rQb41s3/yD1fr6c13W5WVDNreVOk51KXL7sKM2fufOULpcKdBRk?=
 =?us-ascii?Q?TP/VyjAeVo7VEDQDYN2rkIWWFg3hiqczNH1IkVVz9/V3alz04h6Z7gE2j9kU?=
 =?us-ascii?Q?ZKMvr5bOkvp8j/mzzMCheIWA0ft5aMXdbKVK8289WdSDQHuhYK7k9kreJIfo?=
 =?us-ascii?Q?0q4MSvMmuZo6RKfoEOlFRkBSMLebn7i+5hJG1ZJLfDhVi7obZffAyW6fLMSt?=
 =?us-ascii?Q?VrZelRscRCgUg8rv5DB/Nyxt8j1vWJKDlgfvJ+BPbtOrWtM5k6g/bOI/gPtR?=
 =?us-ascii?Q?xDJ01Lg99M5+GEWk/sbQUB40v7zRHd8msAjtgnf5lWCInaUOJqpQeTiyrKIK?=
 =?us-ascii?Q?Qjm74lt7cslIv04cOmCJoSXo8hxXBySxLfliTEFuRYsVGruLVOlLfJsbsGoX?=
 =?us-ascii?Q?u6c7Ngbz73apVI0k0CqnXZD7EeAuKU8T2FccfP1Bjxy6jkLW3Koq1egl+WIa?=
 =?us-ascii?Q?pjXQJrQlVeZhNyhLyEBB/gKR06BqL/F5168VzhxKHNYQ1u9IdJxxFAN2JHMF?=
 =?us-ascii?Q?pMIsk8woS+P7/eoHzgFb4SRGHNvpbEBk4hL2LJrzD6pWbIh8V1E9CzleQsfJ?=
 =?us-ascii?Q?60KiSBP4Mxz6dvJD1UpS6f4F9U15kqgCQkj/Wrop+S4cztconp9i2CE2ZrfT?=
 =?us-ascii?Q?mqDWw7cVZvg8heR3vCSvyactlI/vs30TWjQbcvRrgQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <44787716E97C1048A24E75E12A658AEF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9215
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08d6c476-839e-4fbd-a0c7-08dc817ba742
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017|35042699013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kFeI0sowbtz9ldk9h23N9D8KZLdQVqHBpkF8J3ZCgDc4MjYp1XANKaDNWHm8?=
 =?us-ascii?Q?EWUvsQR5cDhXfz1Bs7c+ofhUjs2jLN0yqhja/5B1o2B4PgZCsCJvs3sd0vDW?=
 =?us-ascii?Q?75wNjxfueRbmci5ns1f7yQQvkYSYz5tfaxnioMS3jVfb9eon3ljA6wgzUJfc?=
 =?us-ascii?Q?ppLNz9+IkOl93b321cCtwodh2G+ZahwYTxag+jL0hoDvOXJeXm1Sj9M2jTU1?=
 =?us-ascii?Q?0l5lJMJOJ1Wi+Vz6i0EZ7r1Q2gdNeQVgTbC+fByVPAQF/KWygp5qitRHgVTh?=
 =?us-ascii?Q?SwPHMqo4y87yxutXFFwZojTBbWAU8D4L7cLbIBLnA/l0w5+EOPjwYMUs/a8Q?=
 =?us-ascii?Q?/m1gWhGC9dz4zxN7qAFc+Z7Tn1ZRxnrSGmBAwsXjGRR3J//GONr9pfXucV58?=
 =?us-ascii?Q?XbcUkgRnMFUD+eAbtN2JVwaL38LvVy8K7AdJHqfJEsbVQfFOP2OC6cQVU+Vq?=
 =?us-ascii?Q?3WbpkzCMzbqdWEYEiBhwd0hSWP/2+OPsJsl2apJm+Z2XTM7pDeail9SaNxL1?=
 =?us-ascii?Q?YYBMk+cgcuzsP1vKL9tR53yp309BxNbt3tCFc7DOiTdFk29bztEICFGFwtWZ?=
 =?us-ascii?Q?C0h6IYDoaxzE4H41CxQ2Ll3+ks2OJp+878hn8hKwHV+t6ZPKQhF9K1mmoLUp?=
 =?us-ascii?Q?4/6En19ZZZS3Dpxxm1PS5Hi/Herpxaz3YFaqvS8Qrod9XMp3CVYn89TBh5mI?=
 =?us-ascii?Q?rx4dviF20nWfkwcwwHwRjGy//xVMrH+lXDn7ZxLRiEQDWkPlPqFqCgiwxy7a?=
 =?us-ascii?Q?7N/zBuMprCTTfU2AN8oOj/OtvGUrvqN4o+GCeWIqdzHjX4I1VKLdop7+gt/T?=
 =?us-ascii?Q?20ynWWzbJPzDFqKxm2Ykxo31ctmEkS+t4A/SmFAvAdUTwiXgekcH5gHTuuk/?=
 =?us-ascii?Q?Rrmzr/jsV+jI03u+zAqzAyJOIUy2Eh1BriTpZWHVzt8O9Le6F5YOcWthSIjj?=
 =?us-ascii?Q?IMRieWWYBJ9r0mryHWWNQ5USwwUJHZl3IBnF+lxI7foCHg2ADu0KmTVg/x2U?=
 =?us-ascii?Q?56zbK2oV6ew+EDDUqDI6NFcsOp3cnCZWg8HapQQ/nB/aZ4RcwZTTKnae8+ze?=
 =?us-ascii?Q?9IIoY5BamtZlZrbLxIwLr4PIekuZ2JSmSRjx9j2GTWO3RVJFrlxelK21Tl9x?=
 =?us-ascii?Q?KXotXCvX2/NLgOZDrpvBtGxaoYirJ61K67OQt7OYWdTdk73RzRDrxa47Jkn7?=
 =?us-ascii?Q?asOSiUZQzjBIZrNF6lcxpWCmFDvl7TBkDsj7uL6/6W4UyLQrWZd7y6G/6yrd?=
 =?us-ascii?Q?AWe83aWAomG3CX/xCOl26LHoNQAy3oEYe3n/3f2xBVZjYT6ZXj/5VlMPzosi?=
 =?us-ascii?Q?RVq4qAA0hZ1SG+//kGc+7MFA?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017)(35042699013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 14:12:15.1764
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db9285d8-d86b-4fef-b4fa-08dc817bac51
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8485

Hi Jens,

> On 29 May 2024, at 09:25, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Updates so request_irq() can be used with a dynamically assigned SGI irq
> as input. This prepares for a later patch where an FF-A schedule
> receiver interrupt handler is installed for an SGI generated by the
> secure world.
>=20
> From the Arm Base System Architecture v1.0C [1]:
> "The system shall implement at least eight Non-secure SGIs, assigned to
> interrupt IDs 0-7."
>=20
> gic_route_irq_to_xen() don't gic_set_irq_type() for SGIs since they are
> always edge triggered.
>=20
> gic_interrupt() is updated to route the dynamically assigned SGIs to
> do_IRQ() instead of do_sgi(). The latter still handles the statically
> assigned SGI handlers like for instance GIC_SGI_CALL_FUNCTION.
>=20
> [1] https://developer.arm.com/documentation/den0094/
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


