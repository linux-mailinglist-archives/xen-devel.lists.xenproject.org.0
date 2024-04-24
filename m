Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 198CB8B0747
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 12:26:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711327.1111203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZoy-0005H0-Ry; Wed, 24 Apr 2024 10:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711327.1111203; Wed, 24 Apr 2024 10:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZoy-0005Ef-PE; Wed, 24 Apr 2024 10:25:48 +0000
Received: by outflank-mailman (input) for mailman id 711327;
 Wed, 24 Apr 2024 10:25:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jU53=L5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rzZox-0005EZ-Aa
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 10:25:47 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2608::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01fce660-0225-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 12:25:44 +0200 (CEST)
Received: from AM0PR05CA0073.eurprd05.prod.outlook.com (2603:10a6:208:136::13)
 by AS2PR08MB8670.eurprd08.prod.outlook.com (2603:10a6:20b:55d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23; Wed, 24 Apr
 2024 10:25:38 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:208:136:cafe::e) by AM0PR05CA0073.outlook.office365.com
 (2603:10a6:208:136::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22 via Frontend
 Transport; Wed, 24 Apr 2024 10:25:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Wed, 24 Apr 2024 10:25:36 +0000
Received: ("Tessian outbound caed45120527:v313");
 Wed, 24 Apr 2024 10:25:36 +0000
Received: from df1206216c38.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 88D9DF63-5D15-4A61-BBAA-4C8FA6AD9D7D.1; 
 Wed, 24 Apr 2024 10:25:29 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id df1206216c38.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Apr 2024 10:25:29 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB8297.eurprd08.prod.outlook.com (2603:10a6:20b:537::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 10:25:26 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 10:25:26 +0000
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
X-Inumbo-ID: 01fce660-0225-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SsvRdBvipvwUsv0n7QxSSv0DPTDFMugon+DxLKdx/APLMfmk9Ynp5MQtdoS3p/GEbp9FCOU2/8TaPSVmrqPlhCieVlrw41SSjM2of4NDDyTcsweGR8DVzjGY0MAsEjotvDgRZgVP1dmoxqEJwrb6hOeZ+Q4EQYUFnghw9M/vOCSJodmN86H/in6krfktJ/2O52+toeE7DBgzfqassN04inlo3/l8fGAlpnDVztdmhqRUQYYK2TnIszSAVoj/NfcFtZ2ipSneVpautXGCJqjS/7ojdHeARFDOsynQQ8B0Qo4HiEljRN49GT4n2rtFh6uh6NNCjK23SJa6YAehzjA2Bg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV/gqIdxqjGPxb1J7v8e4uu11UntEz5p1zujPTAwhPg=;
 b=cNo/mSUgfp+w96dXHjLLB+INaUixJzZFjeM33esOvVHo9bGwNsRnJa7V5iMDPkym2vKC8pHKF+K9WuhPrhqM+w+zYZPqolPb/fltj4BfO675hhzecd1o7kp7YIYViMiMsGByRC9JygwqF35ll8ammG0Z+i9IQCoWREHhXaEAGXE/1obBDJLao9ha8XXw87ZeAzRTG63f7vnUov/hx/TTZoXfcMTFgJixpXP2BjeTDLjc4coZ3eQdyulIILwx2kCLhRYryBvlMlAdaL3zB1V3mCY8gkOY2PTcvD72JUWENa1WnI+/jatUiiAJVY4LODh+mrpXrPd04kpSsANcrJMjoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV/gqIdxqjGPxb1J7v8e4uu11UntEz5p1zujPTAwhPg=;
 b=jCheha+oyWPfJ3uZm5HC7D+lbiTxK9jNyFwum5a/qcw2oZDoIKz3B3K4GgD+pZpeeQMV0CFSrE0Yv6oYY6uTomtuSgVwCMXwRpnT1gZpHKrkxCSMmRUb3POa0+sj8KPyzyM6Cwkmd6qwdBvpBH4iMNwBTKa6paH8ArqYXeMLiN4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d5cd144ff0eaace
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/xpH0b9q+KuyNur6s6nDqrWaMe7lIuzSTgfTltWKAnkIPn5xTLackt86PAVyl/vbNbssV/5eLq050qtQf7gr1Sy3klMmmWYiOwj2b5QYvlY/DQs+Tcalfp2tUDTVoDH7vFJFs1XkunnLCE5X7Vv3P2pVx2HzczyZCt4eNC6nKamyjcsQUhprgRbE+OPZ/TjoAmnBXiEAPGWfktxIvjf/pbmHQZPXLtz7IrFwx7JNzscOc1BemQAKALR0qPcG8hyF5AZ8m54Yh5lCI77qtublxKaZjptSTD4TCyAMSGXfJnGG92ypN+JKgjd6EO0v68kLJUT9/ES3/gsp6JhQuGiew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eV/gqIdxqjGPxb1J7v8e4uu11UntEz5p1zujPTAwhPg=;
 b=lEOA+73L2ULxbhbhzhUzP8mntDK0Rci91bLPSWv7JNuWd1Twbalaf07PL+/J+i3iGvLVt+74DB78PLsKP//XrfFFu7V0JAcd2Gy2gbl0ilyXFY6Emd6YHH+Qb6QwZTEXiAI9a4q6rX6o8JC2fizPHJNEnk78yM5b58xIsJpW0SwUMFmk1A5KyAxWVkUC0oC3HTzEg7p9YugAnMEsCVfGeODJAe26rBL1/0JXow6GnbeaYUd8wPMOVqMr0K7TH7qPA45PTFG/Lqp3+TsblLFilAKBtw1xyJzxAG5cU6h3pfXLReAYVmaN07KTRaxOIAmilUmpb6YWXv+cjiBnMJmNIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eV/gqIdxqjGPxb1J7v8e4uu11UntEz5p1zujPTAwhPg=;
 b=jCheha+oyWPfJ3uZm5HC7D+lbiTxK9jNyFwum5a/qcw2oZDoIKz3B3K4GgD+pZpeeQMV0CFSrE0Yv6oYY6uTomtuSgVwCMXwRpnT1gZpHKrkxCSMmRUb3POa0+sj8KPyzyM6Cwkmd6qwdBvpBH4iMNwBTKa6paH8ArqYXeMLiN4=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Michal Orzel <michal.orzel@amd.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Topic: [PATCH v3 12/12] xen/arm: List static shared memory regions as
 /memory nodes
Thread-Index:
 AQHakWRKhhfM1dXXeUO6IItBh4LVR7Fz8i4AgAADG4CAABZagIAAD/UAgAMjdwCAAAGNgA==
Date: Wed, 24 Apr 2024 10:25:26 +0000
Message-ID: <AF512D9D-FE17-4F79-8778-12DD9C4BA059@arm.com>
References: <20240418073652.3622828-1-luca.fancellu@arm.com>
 <20240418073652.3622828-13-luca.fancellu@arm.com>
 <a46e7e41-cbb8-44e8-9c69-533b949f6a4a@amd.com>
 <9A107B24-E606-4926-BE1C-6FC0C6E86CF7@arm.com>
 <f7318988-85fa-4a40-8242-67db3305a397@amd.com>
 <5de5dec4-7e2a-4e96-84c6-214ad781562a@xen.org>
 <57070924-9c38-4524-8e36-76584c7fb3df@xen.org>
In-Reply-To: <57070924-9c38-4524-8e36-76584c7fb3df@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS8PR08MB8297:EE_|AMS0EPF0000019E:EE_|AS2PR08MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 127ffecd-70b5-4f94-cee3-08dc6448e199
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?v3S2Ii6a/6chAImsIpF9U9yYa3iME+cP9uE/4GxCxy0eeCS8HaKc1+mTr6oa?=
 =?us-ascii?Q?9mpRtPXKix1a/XP4NtzKgFJuVaOEaNie8lUP42+fLji245G+r6/P+YVoLqtd?=
 =?us-ascii?Q?/8NYtHqrajGCGPcBZL6hvIKwFjFlA+gRs0wLkDRYYYgiVYaValy+9kp42mf1?=
 =?us-ascii?Q?f4sj7/ui3AoA5xf3+lNFHFI+ujGCfQKmc1HsHyBMQOr1O+cbrRAjXMSO5pf2?=
 =?us-ascii?Q?ZKEsSz8dtgU9OuPNWDCyxL+/Qkw7088GdrbtbfAqmbCzM4gZWmYL46q1P+OH?=
 =?us-ascii?Q?ZCdSGKiktIhY4IFQ2QDEuKWVv0b3qjYPFJVOQtRxyKVOAOHZNFoH3eEcrrNT?=
 =?us-ascii?Q?9oLONhV08kXVHyXuaG9HInqls2fLn7eBdfTymskOwtmOepsiJMpjkp43k2Ir?=
 =?us-ascii?Q?aPppLG4TsVmtjFldawBxYK3c7LHM3NtcLH4cEVt+oNhV7+YZM2duXvLxqWz3?=
 =?us-ascii?Q?sPUwv3IZVjVI2P79XqcROGqmAM80hxSKiKB41l4RR/xZ4Z07oxNivm3BOFkp?=
 =?us-ascii?Q?B2ZLMV3Q/5cqZdpiCjBErNdBpJiZX/aR98LSgiSnDTF2hDxBz9xOj+3s2sda?=
 =?us-ascii?Q?EbKBrQ4zsfbFetEySF77GxYQbyLQSTUdA/XMwAZRqnpUfNd7knS9cOUl/ZvL?=
 =?us-ascii?Q?bKSd+66qsR61hn6fRwHSCI7xqy5ilrG6KW5UpGmQ3i5JNZgfK5QchdmwFBt0?=
 =?us-ascii?Q?ix3ww+Nhu92cMJ+TZXzis8HYdWMtUsPSP6PY7cy3CCFLBVOdVbNztq1gREVK?=
 =?us-ascii?Q?YVZZ8FoxsVYIfOmrDj2bmSolkYxkZEgOnkPcOs7A1ZQFXMHcyUrJuucWn/Ro?=
 =?us-ascii?Q?FMUQJlVlv2avVh4+8/sOrZY9NFm2v4a5s/uaGIWaYTHbYRtKduBjf0twJir+?=
 =?us-ascii?Q?wZ61953AsU4t8wNS0kVnCZhEbs5IOd5jcqOJNRjIqbtWgoaX8dEMczMAyZjd?=
 =?us-ascii?Q?BjQiUPThy07czqXZL/aAv534j4ayOoxMMOqDYEiBOdAWHLoZ9/zmzLJWvprB?=
 =?us-ascii?Q?tPTGnN6liywSWvxcuGObjaXvT/dvet4t+dQKfOmU41GBf6u2SKMEP7jSXlOB?=
 =?us-ascii?Q?UpKf61HKjy5c7dCFvtCGzwMcaSYwtJrNjWkrNS5yrh5AYZrf/ZGK4BQckp45?=
 =?us-ascii?Q?1QL1KMyzds2xM201l5RgBa2X5dTEjWgjb/9cO4LfmJ8VGpWvH47TDTKWq/8H?=
 =?us-ascii?Q?pyXaRFG/c46BlDH/Iztuok2GQSlj8rizgjoYal2VDoHuq1mCdlemgp3Fujce?=
 =?us-ascii?Q?DsW4uuNwnw8XxKnIZY0LnRb01bBWyy/pOhW2dEhI+Au+hAlwHEeRnovRKYRp?=
 =?us-ascii?Q?HWJec9H/SL8s8s9bDyp6Y5KBkQZ9zxg0iXHbbw2CUlniKQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F1CD19147033D1419A321EFA379948AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8297
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	79dd971b-6be0-4b83-5176-08dc6448dbb8
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|82310400014|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MJrkCP5ooBzMHoOOHY5F5igegCgnugf52UMjNHpfKnljy6JoEhUkftqtxtng?=
 =?us-ascii?Q?uhk2nvcxxlb5OXYD8xF4T0vx4bPb/5gOiSMUg4skAyXvLGUm/KA+9LoD5BPx?=
 =?us-ascii?Q?TseVL1GOl6NmAU7UytWtOdo6SuFIzW8OsJwuvLxuAsvnSTSAoAYUgVanUEhl?=
 =?us-ascii?Q?aEwov7keG/QFgplt7KpsxsYEtRePDZpoFQWoeSKgGeYGjlBOFjAezstq8Qbw?=
 =?us-ascii?Q?d22wlNY8FuRTRlLMgYkW5LnkSLZ+AsoRQMFb7VX64kHbzpv3uJ0pCddiCeOY?=
 =?us-ascii?Q?DyxZ4z7k/wvg9DQ8JYLFrUgOZBwvx59eik/ICSGFginNKTB3z/hF6Ruo9oGq?=
 =?us-ascii?Q?xchns2iYCgZieUzZL2ENpyvQWpKjA/OFI8eymd2QYI0/rvDFZFATu+dW47kt?=
 =?us-ascii?Q?MnPrhf91GVJ6EVR9BO4kC7Lh2zDiuF0JQwd+byPCDwiyGrcnZen01daLPG4w?=
 =?us-ascii?Q?DGvOvYID5P0z4jUhfhbuTJKH0GpFNFFs+IloAYomzdewrDdqwwpvixR6f68S?=
 =?us-ascii?Q?+RrM3SsI8r/kuvKSWqAcBxaYvUlayeeCB3J/YTwNXycdpyCHuzVyi1SG55Jt?=
 =?us-ascii?Q?hURHYGm9WSZ3jQa9KpF/Mx/LV2ewDRF2QMi3ZGxYUTm/kt8DNFnnhAgY+dab?=
 =?us-ascii?Q?3GQILTShMd/BjtOucaLGg8D/glHsMExLad0LDJpSkVx5cySPEmswLdVmvvCq?=
 =?us-ascii?Q?L9K5BX8RQbYYX0AFb01IwMwUO8Es/RMM368gN4nDh8bSbOmke2t3fCF4MGCl?=
 =?us-ascii?Q?UEMIlLR0WMQANjKh6z4uIZJYMw8j9oXIP8C25lMeKPBP07lz/pntkWGNkWAL?=
 =?us-ascii?Q?bh6AHVu4s6jhgNqjB7as9M//1sNvU2+9qbtKlnEKqhzNij8aBl3i0wF0pI9W?=
 =?us-ascii?Q?ZWisPhqGUveReAvW6mG6kHt68rFMs01g7IMOjpvuoTg7+go2T5sJX6OzlNN3?=
 =?us-ascii?Q?c6QLtoXSaTq8RsKG+UakhkVKfT29oWMm3wv0kfHR3VJGtXULUuwUa49G0zGm?=
 =?us-ascii?Q?jqJ3wYxNnLSV7ETODgnbVqHmejqUvr4YB/MlZ5SIztDs5MJbdGq+Z1MY/iI/?=
 =?us-ascii?Q?NnqbRehsjEMksgoA0MN3C601G53JZG9v+tOUyavfvFeDv7YErHAQtAy4lPHt?=
 =?us-ascii?Q?7XgHjLnmVhN5p1AtoWbf2VaoiE3hWXfALw2J2P98o8XEjnWuukSfJG8e0OiL?=
 =?us-ascii?Q?IwhY/sKUG0TR5kpMfKe9uSHiIpA4TBjEtv1yq9QmCRNK325otfzRrY3lKq5w?=
 =?us-ascii?Q?NbWaApxtcQ15MwaUiMXKxJLaO6RWNA5XfOuzkTNcXyM89cKkwkls5ULBfuTb?=
 =?us-ascii?Q?HjHxiSFTV367GHoL87n0M0UgIdnYY3YtfyUA3qyW6/MAUeVGciZe0hzuM+RL?=
 =?us-ascii?Q?LuCe8ISXOX2G/nDAzUSrqqR7rPKe?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 10:25:36.4519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 127ffecd-70b5-4f94-cee3-08dc6448e199
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8670


Hi Julien,

>>>>=20
>>>>>=20
>>>>> Rest LGTM:
>>>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>>=20
>>>> Thanks, I will send the next one shortly.
>>> I don't think there is a need to respin the whole series just for these=
 fixes.
>>> You should wait for the committers opinion.
>> AFAICT, there are multiple changes requested in various line. So I would=
 rather prefer if this is respinned.
>> If this is the only patch that requires to change. You could send a new =
one in reply-to this patch. I think b4 is clever enough to pick up the new =
version in that case.
>=20
> I was wrong. b4 didn't picked up the new version. Anyway, I have applied =
the new patch and send to gitlab for testing. I will merge it once it passe=
s.

Thanks a lot for that!

Cheers,
Luca


