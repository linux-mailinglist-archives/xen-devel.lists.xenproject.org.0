Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA91E97B13E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2024 16:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799985.1209920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqZ27-0003jb-B1; Tue, 17 Sep 2024 14:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799985.1209920; Tue, 17 Sep 2024 14:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqZ27-0003gV-7p; Tue, 17 Sep 2024 14:18:23 +0000
Received: by outflank-mailman (input) for mailman id 799985;
 Tue, 17 Sep 2024 14:18:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4wfS=QP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sqZ25-0003gO-GQ
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2024 14:18:21 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20620.outbound.protection.outlook.com
 [2a01:111:f403:2613::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af774ed4-74ff-11ef-99a2-01e77a169b0f;
 Tue, 17 Sep 2024 16:18:18 +0200 (CEST)
Received: from DU2P251CA0029.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::31)
 by AS8PR08MB8634.eurprd08.prod.outlook.com (2603:10a6:20b:564::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Tue, 17 Sep
 2024 14:18:03 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::9c) by DU2P251CA0029.outlook.office365.com
 (2603:10a6:10:230::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Tue, 17 Sep 2024 14:18:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Tue, 17 Sep 2024 14:18:02 +0000
Received: ("Tessian outbound 279d974a0de1:v441");
 Tue, 17 Sep 2024 14:18:01 +0000
Received: from Le12516c0255b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9CF3B26B-33DF-4A2F-8488-07A325E4E80A.1; 
 Tue, 17 Sep 2024 14:17:55 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le12516c0255b.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Sep 2024 14:17:55 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS4PR08MB7901.eurprd08.prod.outlook.com (2603:10a6:20b:51c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.14; Tue, 17 Sep
 2024 14:17:52 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7982.012; Tue, 17 Sep 2024
 14:17:52 +0000
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
X-Inumbo-ID: af774ed4-74ff-11ef-99a2-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Fd1F0xxFsB8TOIQ4/zXoMwaKIMZ7YuNo2H2uwb0iqQgx4QbQW9EJWBxxVM7py9LT9jq96Kes5FmtK3A+zO9NsKW/3YcrAYOjBEB+EDJ3rQfBib4I3n1aIKR+bxbooRZhfm5WwMc7YG56tvLN6IfHGD4mg8L0AzVc3eZmC/HBB5Mx8PXf21aZGGE1ses8xK1EBrMIKVJyildZamAD0SKSPNDU4d0P0B6c4183dyXaieEtST3sEqrAPBOXXZtEcntn5yf1V6euvP1oz+kFmuY8nCOWnTHBJVR6wwGKRiVNyonOMNRERP+woPO8h1ltX9slE0pNI9X53wIDvM+FyWiW2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3AwAuZEJ1BVDnKExD9JdctcLBHzTG0JO/4WRmWq6Zg=;
 b=arkssxPDhqMDk6fciZMApzDeuOIPPM65IiiWMykdG9VZk5CLuNKXLpoyvHeEWg7Yg7hZncPJZFox+zmk2QHl2Mh/4SbB5+8eIh6fgl4meD0AmjMQvYSAvpAp/xZwydi8LBmUDJQ5gxIGFPaFAlFMRGrekeLy+g8Ze/JyZ/W5lkT/LI9pzinTzcDsARaTetw+9YEG74UU3UmvUq4lUEOSEzrKAuBkG9PNBYsi9AcOstRDYqt5c4cd45K9Pveubd8dvdHjR57WCUFXDxgw27vp/GLDco4nscFLWs2oMm59HXriTfCRAvSihKfpDlLbJhdoMjtVFHHVdGtnsJsxHle1Nw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3AwAuZEJ1BVDnKExD9JdctcLBHzTG0JO/4WRmWq6Zg=;
 b=mg1VX+0RCq+CcnB/BzqOMJH1e3DN2/ksx9QOs/yT7SJlWDRnn4TjyLO1U78VlX4eiA8W63PLs3Ft5dUDGPxqjtpttP5Ai3kAbHkiOpPHuujVLFZS/qT7+bDzncuXdSPKKm1sKgg8THNTkdItynpwHcE43Ay3gKNXFxjpYmsNlbo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7db087b0f2d86993
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOPBTOHF4Zn7hNhbJsGglBJWbsuz0DQimR+4bnGRI3aPyF0OzH49BABmjmPPBirHRj6m8yHTy4qT41YyXIxm4rSiIokER0OdQ+WBYBPlJ2hpaDP8gpv75Al8xmfCNF6ou6JUy8FgEbCQksJp06ARRP9SMfPzksD8IluG+myJqYleTtyR4M+pIqKnJJbUazT0K3JvtvZzWIeiKbl/mwrAUZjq9JKGLyxQ4FekFuVMnGoKNotz3GIkNuP+ENlAoJM2oJ44Q/BUfIBTW/SPYq5bGQlPaD0tMsn8lsDXa/aAdKxU4zSrtK7r7YwvoXmZxxdFRMMD2JJMJBEACJw80kQymA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3AwAuZEJ1BVDnKExD9JdctcLBHzTG0JO/4WRmWq6Zg=;
 b=kMLSJ/H1RcCMHJhPgWfqwxs7IgJUNb+BS9Q4GxyHXoguxQeaoLI/FRC0jL9BzGoWrhT2Vf3vHJHdLU71SSGsCtPf4IALR8VOMnnncz7l8qpTMatdm35Kvo0OWuc3aItDhZY35grv6+Eh+ViYnAnii5IwILu/1vIIV+50B0HSyhos0j+d1JtmvD2x+c85tSCD0ovtxq6CnJFhj3szgqC+QpQutV1MY8Iihbn3YZWPvGg15/QMEZ27XIioAKRtQPgtlHG0N3m2OD5TvqJhdQa5NsVMVdgo35kFRcl/0Ri+piidnboEhbw9Nr0+SuHGjdBDFvN0o+WzDBz3k6cIMYPuaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3AwAuZEJ1BVDnKExD9JdctcLBHzTG0JO/4WRmWq6Zg=;
 b=mg1VX+0RCq+CcnB/BzqOMJH1e3DN2/ksx9QOs/yT7SJlWDRnn4TjyLO1U78VlX4eiA8W63PLs3Ft5dUDGPxqjtpttP5Ai3kAbHkiOpPHuujVLFZS/qT7+bDzncuXdSPKKm1sKgg8THNTkdItynpwHcE43Ay3gKNXFxjpYmsNlbo=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Michal Orzel
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Artem
 Mygaiev <artem_mygaiev@epam.com>, Hisao Munakata
	<hisao.munakata.vt@renesas.com>
Subject: Re: [PATCH v2] docs: fusa: Add requirements for emulated uart
Thread-Topic: [PATCH v2] docs: fusa: Add requirements for emulated uart
Thread-Index: AQHbCQN2xvsCqJ/dYEabFdsS63+QfLJcBq+A
Date: Tue, 17 Sep 2024 14:17:52 +0000
Message-ID: <DC3FCBBB-786B-413A-A8C2-2D8A888B70CA@arm.com>
References: <20240917131336.3783112-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20240917131336.3783112-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS4PR08MB7901:EE_|DB1PEPF000509E9:EE_|AS8PR08MB8634:EE_
X-MS-Office365-Filtering-Correlation-Id: a735b752-fa8c-46bb-d664-08dcd7238a21
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?SQnmMlcZYqW7t01MK6VtpNlP2xH7RIVk3VXTOcNKCHls2qKPqr8EMcVq53Hl?=
 =?us-ascii?Q?msu1RYgcA7uOYNyeAA8l7NrcbBy/NoeVY5jJ+arQYjfCNPC/IKpLo+zKfhjW?=
 =?us-ascii?Q?EiEsubJpwoUd1w4nw0s/rShmq51Oejo8IvwtR3tfZ44ncYoFhCexI+FQwE0m?=
 =?us-ascii?Q?z7yWgBBsSrWP7hGEej2vptBB2UORJt7cIvWsYRNCHjVEtyw13vGbYN5BFr9c?=
 =?us-ascii?Q?ZoZhHwAOpEvzjowzm4AnhY4S5yn7oW7qk+N7nyONI3QMpLRK6Z5FcxyzSC7N?=
 =?us-ascii?Q?xwiOziBV7iLDdffdFrlsJOfkHzP21fs5HPDTEScRT64neAU+LhVlQnJuvS/b?=
 =?us-ascii?Q?r3wVFAhLT2W1FdT36rKC7Exv47dMuLyS4vj75xz33r1TPGKFpMe1ZhzPyRkw?=
 =?us-ascii?Q?9BYQ7dvjKCqLwkFR2rfchfJivgOlkd8NEqEg47qilznDljbPZk9h5mHiPXZ1?=
 =?us-ascii?Q?Hq5I7Suhg+SmnuDhxXIsHSlrr2NDDfDlF4CFKYA0YBf2RMA77IARW1UEvdIB?=
 =?us-ascii?Q?U2NezvLsdZuN1jO52SLY1vPax4/l6+NdiePDfUZqUGZlguWgM4O3+6Keha1F?=
 =?us-ascii?Q?jAWHn8C6klcbEXGO6VfNuUmeIJar9mIuJihMSHcSlSZnLq9nEd8SybgL1RZR?=
 =?us-ascii?Q?7CV23lrJ0CdbUYlVBetc/NWp5NWSnTQRMvBBdpCcVs3/r/FfgQtb06dTUcf6?=
 =?us-ascii?Q?BEV2oThpclciu6ouenNytCywjBBwMhPQFyiRiPEBD5fbUKca7m5zVT7yXm9j?=
 =?us-ascii?Q?xBFEYVRppNDYcvFN7bJ4TYgN6TlcS8KnLV9pgYJJ87ZDucm0QXLzNNkPDZGY?=
 =?us-ascii?Q?Cs/S1atKw6S/lDSvrmvkTtibAUg4AGaIJeL/UJ9nNEUyM/a46yk4gCrT6QhY?=
 =?us-ascii?Q?E2NNVRN5RSJiGbhIwpI3ex2LITzloKO1U3192oHfYxX91e4vPPOt+tCbTEoK?=
 =?us-ascii?Q?xZYCOOM0ofotZaG8L2Waj9vlBsqDi2UCbw923J0R3jSGsPnewyPPAfQUvCZp?=
 =?us-ascii?Q?HMh4KzoWT9kOiR+nw84QezwPcVbdgW6z6oYGM4tsE9xsOKqv0TFh/OwgS9c5?=
 =?us-ascii?Q?x3gXX7EKX2Qv1u/6IsY+GYhOklU/v+HYKQQsc5Dkp9hcbCCE/J1Rx/yqR7/I?=
 =?us-ascii?Q?O4qkZf/oXRLM8hoAUutR0vqUtKSjohfqOhGdvvSBicayXJk8FXMntEhAE2nz?=
 =?us-ascii?Q?ynI7zfaR8TSc404/9141yYCv93rZ0+aWR9baNdPk4Hd3r7C/S9sE7fMAXGzP?=
 =?us-ascii?Q?NYFYwpb3A57HidniA/op4oObQE8JuXl4TG6qmA5eyaxphrsBwZAK1CkNz1XW?=
 =?us-ascii?Q?igahPcotXyEr1wgFBZmg20ZSvO3POUMt38YxnCZeOE1vgXl6BVb+cAefkZx1?=
 =?us-ascii?Q?xuLJTCxGIjoaoY6R8gLx3hP7oVFoMT3iCbhZUR0SSUGmeJNKYg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <944BC5CD8FB4B44B8AA786D071C6B6F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7901
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0116c140-e835-4882-659a-08dcd7238463
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8o7wCwlLySRgpKBcFlKE18BcPI6WH0OBdd2rYRn1uNjKcl9BgTFEuVQbOshT?=
 =?us-ascii?Q?Jh9poIxBVrmAUtD/U610YaofYj07L+xI/G7rpegBy8y84jllmUr9Lk56X/N6?=
 =?us-ascii?Q?Gbw7W4bvPkTY6Y74Wj+mxMn4r7V+GOrejocKd2JNMY05vJforcGhA9hBI2WW?=
 =?us-ascii?Q?DQdYxwPZp2HQW9UDsVBhyHKDPwVgDcopBkGR0bwgrx6XvwGUsWQF2JhvFaZB?=
 =?us-ascii?Q?cpTzfCYwXTlgeRtts+UfoAzrkWn5X9ehZQUOgL1nqb8qBaE3yFan3oXXMts6?=
 =?us-ascii?Q?rB4kRwuzF9WJ99/kecalCa+DTBv/9jCjOlE7m5h4CAqn6Bg1TFQ5WeZxgiV7?=
 =?us-ascii?Q?Ev6ZHZdN8tt7Camhuy8XnYdnfSvZB/SOlD4sjgZpnd4Gsuf7SqZidj3dLqt5?=
 =?us-ascii?Q?xjTQV1JhrtJgZNyH+PG2YmFNBt96mddutFo2SCWcG8rHnHfQsP3pJPgZAcTu?=
 =?us-ascii?Q?iUIVMHEAFZ9JpnZCRNU/CCFCdBqS/iovHuaDJhxgAhhyJ8rg8ewiw5RExAn8?=
 =?us-ascii?Q?NvkFB6DL/uhHwmXWrUL+NoAEde0tYPAKe1CuxmIcf/oakvoRsZ1t3BFEXd5R?=
 =?us-ascii?Q?HYm6uVlwQVW/zvvPPve/fwcH/drU9FaG5Y5G6I7NdIR0ArvjdxyBVQ9LRY30?=
 =?us-ascii?Q?Ie0f3yzOe0V15YZbitUEhU5BmMu8DPwpZUevnVwCqwAP+A8GzMvjZjDrk+9c?=
 =?us-ascii?Q?tURODb7Fbkwuk7FxiULELtAg+x/icYMTJ2CkhrAA0R6Ot6DAerZky4+CQ2jH?=
 =?us-ascii?Q?nIbF/yo4qzfxxvEwC91qcP7l1gezuek2ydLb6PDVSApaGsql1mjcn0TLu/zN?=
 =?us-ascii?Q?4ri0QUXTMBeSJpJM5Jkoz1AtpkjsOsj5CMcAXeiGWVZWItyMbJ51N6MQq9vv?=
 =?us-ascii?Q?9Bxa37a2vX7AgWGaDkdy9HBgXz5Iray3Aw7PPGwq8MBzhJhKSFPFEXC4+tFw?=
 =?us-ascii?Q?+VfxYFE+4jSYmksIz049gvE+Gjoi55VAUSaXQV6fMCKuXSN+Ify6fU5uK3Va?=
 =?us-ascii?Q?UL38kK2JokvqIAWlIOL1tERxUx2KcUe3T+avVKEQNbdTowblDa4HkuyO4Bd+?=
 =?us-ascii?Q?lRQyl0pkITeY5uB4rapw0MN5Jb2vfzfcPg/XagIy0W+SU46+drnrJvLxu39l?=
 =?us-ascii?Q?1iw+Uo9ZX3t7WrqT20HZ1YQvZcTBcl8153OOu7pbpABykz+/AlzNwxGgfBIh?=
 =?us-ascii?Q?2TYMIEGVXNhgypjal9p1UF8lrdoLJL8tOEyF5vOTt0yD6p0lhkQgcO9FVHxx?=
 =?us-ascii?Q?xHWAab70NT83CIEz2bhSl4+hDxOOUhiOLU8Es5OHGIK1j5G1OmeRZrubxp7n?=
 =?us-ascii?Q?cjZhCcczqT8USa8pAoewkRxtJrRqVz2kGH31RwoVtXPME8mbcGlaD3ESLFLv?=
 =?us-ascii?Q?9Ert2q3RVsiVeRskdBOgEk9MnTL6lf22J5t9u04o/17oLv1G1ynz/XvrzsVo?=
 =?us-ascii?Q?frLQpOgBxGPszYT/ZDYfZn3zwVEKbvgv?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 14:18:02.0599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a735b752-fa8c-46bb-d664-08dcd7238a21
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8634

Hi Ayan,

> On 17 Sep 2024, at 15:13, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> From: Michal Orzel <michal.orzel@amd.com>
>=20
> Add the requirements for emulated SBSA UART.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from :-
>=20
> v1 - 1. Reworded the requirements to remove any ambiguity.
> 2. Dopped the "virtualization unaware VMs" requirement as it is not easy =
to
> define "virtualization unaware".
>=20
> .../fusa/reqs/design-reqs/arm64/sbsa-uart.rst | 224 ++++++++++++++++++
> docs/fusa/reqs/market-reqs/reqs.rst           |  15 ++
> docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  19 ++
> 3 files changed, 258 insertions(+)
> create mode 100644 docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
>=20
> diff --git a/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst b/docs/fusa/r=
eqs/design-reqs/arm64/sbsa-uart.rst
> new file mode 100644
> index 0000000000..89598fa8a5
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/arm64/sbsa-uart.rst
> @@ -0,0 +1,224 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +SBSA UART
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following are the requirements related to SBSA UART [1] emulated and
> +exposed by Xen to Arm64 domains.
> +
> +Probe the UART device tree node from a domain
> +---------------------------------------------
> +
> +`XenSwdgn~arm64_uart_probe_dt~1`
> +
> +Description:
> +Xen shall generate a device tree node for the SBSA UART (in accordance t=
o Arm
> +SBSA UART device tree binding [2]) in the domain device tree.
> +
> +Rationale:
> +
> +Comments:
> +Domains can detect the presence of the SBSA UART device tree node.
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Transmit data in software polling mode
> +--------------------------------------
> +
> +`XenSwdgn~arm64_uart_transmit_data_poll_mode~1`
> +
> +Description:
> +Xen shall support transmission of data in polling mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Transmit data in interrupt driven mode
> +--------------------------------------
> +
> +`XenSwdgn~arm64_uart_transmit_data_interrupt_mode~1`
> +
> +Description:
> +Xen shall support transmission of data in interrupt driven mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Receive data in software polling mode
> +-------------------------------------
> +
> +`XenSwdgn~arm64_uart_receive_data_polling_mode~1`
> +
> +Description:
> +Xen shall support reception of data in polling mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Receive data in interrupt driven mode
> +-------------------------------------
> +
> +`XenSwdgn~arm64_uart_receive_data_interrupt_mode~1`
> +
> +Description:
> +Xen shall support reception of data in interrupt driven mode.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART data register
> +-------------------------
> +
> +`XenSwdgn~arm64_uart_access_data_register~1`
> +
> +Description:
> +Xen shall emulate the UARTDR register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART receive status register
> +-----------------------------------
> +
> +`XenSwdgn~arm64_uart_access_receive_status_register~1`
> +
> +Description:
> +Xen shall emulate the UARTRSR register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART flag register
> +-------------------------
> +
> +`XenSwdgn~arm64_uart_access_flag_register~1`
> +
> +Description:
> +Xen shall emulate the UARTFR register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART mask set/clear register
> +-----------------------------------
> +
> +`XenSwdgn~arm64_uart_access_mask_register~1`
> +
> +Description:
> +Xen shall emulate the UARTIMSC register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART raw interrupt status register
> +-----------------------------------------
> +
> +`XenSwdgn~arm64_uart_access_raw_interrupt_status_register~1`
> +
> +Description:
> +Xen shall emulate the UARTRIS register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART masked interrupt status register
> +--------------------------------------------
> +
> +`XenSwdgn~arm64_uart_access_mask_irq_status_register~1`
> +
> +Description:
> +Xen shall emulate the UARTMIS register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Access UART interrupt clear register
> +------------------------------------
> +
> +`XenSwdgn~arm64_uart_access_irq_clear_register~1`
> +
> +Description:
> +Xen shall emulate the UARTICR register.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Receive UART TX interrupt
> +-------------------------
> +
> +`XenSwdgn~arm64_uart_receive_tx_irq~1`
> +
> +Description:
> +Xen shall generate UART interrupt when the UART transmit interrupt condi=
tion is
> +met.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +Receive UART RX interrupt reception
> +-----------------------------------
> +
> +`XenSwdgn~arm64_uart_receive_rx_irq~1`
> +
> +Description:
> +Xen shall generate UART interrupt when the UART receive interrupt condit=
ion is
> +met.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~emulated_uart~1`
> +
> +[1] Arm Base System Architecture, chapter B
> +[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/devicetree/bindings/serial/arm_sbsa_uart.txt
> \ No newline at end of file
> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-=
reqs/reqs.rst
> index 9c98c84a9a..e98f348cf4 100644
> --- a/docs/fusa/reqs/market-reqs/reqs.rst
> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
> @@ -32,3 +32,18 @@ Comments:
>=20
> Needs:
>  - XenProd
> +
> +Provide console to the VMs
> +--------------------------
> +
> +`XenMkt~provide_console_vms~1`
> +
> +Description:
> +Xen shall provide a console to a VM.
> +
> +Rationale:
> +
> +Comments:
> +
> +Needs:
> + - XenProd
> \ No newline at end of file
> diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/=
product-reqs/arm64/reqs.rst
> index 7aa3eeab6a..97e90813ec 100644
> --- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> +++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
> @@ -21,3 +21,22 @@ Covers:
>=20
> Needs:
>  - XenSwdgn
> +
> +Emulated UART
> +-------------
> +
> +`XenProd~emulated_uart~1`
> +
> +Description:
> +Xen shall provide an "Arm SBSA UART" compliant device to the domains.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenMkt~run_arm64_vms~1`
> + - `XenMkt~provide_console_vms~1`
> +
> +Needs:
> + - XenSwdgn
> \ No newline at end of file
> --=20
> 2.25.1
>=20


