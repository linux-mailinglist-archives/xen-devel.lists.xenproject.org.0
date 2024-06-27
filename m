Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5A919F35
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 08:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749738.1157970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMiXi-0005eW-VO; Thu, 27 Jun 2024 06:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749738.1157970; Thu, 27 Jun 2024 06:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMiXi-0005c9-Sh; Thu, 27 Jun 2024 06:23:38 +0000
Received: by outflank-mailman (input) for mailman id 749738;
 Thu, 27 Jun 2024 06:23:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eOj3=N5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sMiXh-0005c3-8v
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 06:23:37 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2608::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c824beb3-344d-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 08:23:35 +0200 (CEST)
Received: from AM8P189CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::23)
 by AS8PR08MB5912.eurprd08.prod.outlook.com (2603:10a6:20b:29f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 06:23:32 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::27) by AM8P189CA0018.outlook.office365.com
 (2603:10a6:20b:218::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25 via Frontend
 Transport; Thu, 27 Jun 2024 06:23:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Thu, 27 Jun 2024 06:23:31 +0000
Received: ("Tessian outbound 41160df97de5:v347");
 Thu, 27 Jun 2024 06:23:31 +0000
Received: from c37c5bc6af17.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9FD5E58E-1EA5-4FB7-A1E5-B98A274CDF3C.1; 
 Thu, 27 Jun 2024 06:23:24 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c37c5bc6af17.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jun 2024 06:23:24 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB9987.eurprd08.prod.outlook.com (2603:10a6:20b:645::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 06:23:23 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 06:23:22 +0000
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
X-Inumbo-ID: c824beb3-344d-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mPDYXZAbyi2PkgBB/aIxzOUuKcDVjOtXkfMbcGaqpAt5ozb2GGFcE45W/m5FB1CGc5QWzD3H/Ni3jop4hEGi3WKiS5/HNRnu57rQ3ySPuwywZNGPJUUZqLfW/azqtm1D30Ap9lL/DpXiDuZrKV9UeSUBjfIfeSvwlKsXF224JPIi1wlwXIiOyx63McZDw440e9WZJh8FNqu1uF1u8ME8Z7a0r760ETJpuOWzBKGBBa33mk0ox6sr4m8n5V8u2r0QtrincDHG3ptGAKgVUTamRo0y3PzCVXnUga3R2oNyKLhUrCb+GgVxZcefmb1vK2RwFTZ3FWcVA+2fBhquScRU7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmreLS+xNi6TcSrdHmP9TzkHM54DKMzsDPK44F4YdpU=;
 b=YXoOZi8qmaoXNn5pZdCZ61ViPpcLLRVe3OrNv37oX9wMoTpXQMATq21CRaMUKy/61FLj3BCrNoI0sXCKzw6VxmyLRbTDMBwximuOx1FYl12qgXTNs54/7wj+5mn0GAaNfQQvEb29PErLmobwIdy1Sjc3BSgZBY4++yaFyGHT1XbJpZgXjNJKwdz0yPP6d98lQWTKj1zQFc7+Wu0/vjP1o4MpiCo//xa8/ONQtXvt8Pvoek+zoOUYlHIMeIgEmK35pRgUSfT9QVS4iPFLUiHQyqsORdJQ4YvU+gTcl5UUdiTYuz2BIphhN8l81vN20swM/3odZ6UbMw9X6r/KTLWIJw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmreLS+xNi6TcSrdHmP9TzkHM54DKMzsDPK44F4YdpU=;
 b=ZrXh0biOffmAgWZPDrsVRPgS4h0O7nVfMZ7nzsp6+ajPd1ilmUzXtkZrSrgIZfpsvMUHZGpXHtJVV2sajWiklbWcfRa/Njyu/FjD9JvC0HXYpJlj3cxV54RRAn8Kt1qqXUQYFDWFcgZ3JRbfUE/Nte+QWtX2xJ8q8+DaM9Z0LHM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: bbb2f1c4bde6cc7b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMqjvfSExvnLhXNjhITqmfMJj73mU4dMpxk2kYT24EC22qa1P+umB5VMPp9M77Ag0wchr/eJnNHyBaEavCM4jOGlpg0+RyfrhdhhddTZX3ac8nLiHpLYNp+BUi8ztv7euqRTxSpns2WGkxJCCCvecVKFl1He78F7OuDCaTmK7gNXctlhNCNi4hCl3XEEoqo5SJG0w/8B3IFlrYWfj2fOgrybfIFOvo2GwTcwqE968luVBDE/V9jzwzU6Z23qxL0jzgLyud5aYGwYA8Z0RtoiBdePxlIlvsahx7jVDDKwEGC/pPfMZ6+0c2TScXUQ/H8qajEa3Q9A4UaJ9s/Th761Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HmreLS+xNi6TcSrdHmP9TzkHM54DKMzsDPK44F4YdpU=;
 b=JS0dTImu3JNiSMs+3kuGy5b/zo58Jc9oWjfIoYIaZLiSQbLQSlWfJM58duPqEPbb90O1PLlLth3x4TVoj4PbPGXHY2wOev53S8juyr7EjrKQky/JKcMj67YfvPNNYmfeTc7CEDRPaBxUx2mL0Uhw+NEiMKQ72Yn7NnD/qFic9JqSTWzMZqkd6O6ciTWk99c3T2dyztWLgOOuKfkn20Mde/Ns3EZMMActo0/r31BqriAt0bj4qvSLsc+t91+22uR/a6f2eq9PFp/jTyCMRD2mXfcj7DtBBDxpMTU7+Io5Ohmxah52V0upqYsj8DtZv31I/Vk+F5BwKGA4hHu2Oa3kWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HmreLS+xNi6TcSrdHmP9TzkHM54DKMzsDPK44F4YdpU=;
 b=ZrXh0biOffmAgWZPDrsVRPgS4h0O7nVfMZ7nzsp6+ajPd1ilmUzXtkZrSrgIZfpsvMUHZGpXHtJVV2sajWiklbWcfRa/Njyu/FjD9JvC0HXYpJlj3cxV54RRAn8Kt1qqXUQYFDWFcgZ3JRbfUE/Nte+QWtX2xJ8q8+DaM9Z0LHM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: George Dunlap <george.dunlap@cloud.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Dario Faggioli
	<dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, Nick Rosbrook
	<rosbrookn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Step down as maintainer and committer
Thread-Topic: [PATCH] MAINTAINERS: Step down as maintainer and committer
Thread-Index: AQHax98S2U1KStNvs02rkvKONmneGbHbJToA
Date: Thu, 27 Jun 2024 06:23:22 +0000
Message-ID: <4B3393D9-2396-4FF4-8D92-62426DD3F040@arm.com>
References: <20240626151935.26704-1-george.dunlap@cloud.com>
In-Reply-To: <20240626151935.26704-1-george.dunlap@cloud.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB9987:EE_|AM3PEPF0000A79B:EE_|AS8PR08MB5912:EE_
X-MS-Office365-Filtering-Correlation-Id: 85bba2d8-d868-4ea3-6a52-08dc9671aab0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?Qyt3JO5weQ5RvrRPAfbSyx47D62Vky3E6QFliS9OVQ9UTq2Elk8slHVhAJAm?=
 =?us-ascii?Q?Liti3kJReoNFtmJJloeNZArp9RshOUTL6rA//NqBzhDRbv1ADMvlzSHVW6s+?=
 =?us-ascii?Q?tYuVfge2EbLvnu8YGrIiFO88v5MIdjmpjr/wVXLkoor6SuPK5Uf1Fs7hZArW?=
 =?us-ascii?Q?jUwuS/UfYoNwp93Xrnx1PY0ZkAWOy8vbSZhG8GGJG4qlh85O260ZxBG2Nigs?=
 =?us-ascii?Q?wsHU6xOUNNWBayj6nZp3JxEfjTHdhTOfYgJigPkRWLHJOXHoS+dzG3HTQCOa?=
 =?us-ascii?Q?Ksb85BoaQ/q2hekccNvw5cJPmc+a9IonlQpisziISsuytkeUVDHqu11Cwkpe?=
 =?us-ascii?Q?+OME8BIUAnLC6ijMTvAZ669OH+Fw8omjTL/cI0SENIh16SOW4E112XjKKqQq?=
 =?us-ascii?Q?P8FoVcovxYjwK2rWD7DVrJQN7nUkOonLrGTTY8TyvRrm71m9BcUJ58gAufvF?=
 =?us-ascii?Q?XUdkqHo7S3QJ+LGBwo3y9EDDDGGXDLHWUQBWn0YCFDscQ+cje5/3bBbWhacd?=
 =?us-ascii?Q?o4yKBib6FtlVrQdaPdIulEtZutp0kRhskLPmm9s+wHuIyU91lFQejGS810/Q?=
 =?us-ascii?Q?jzGc70gof3/bJcUMjIwDWO0bTRf94GekuVFjF6d7TWfKtyjN1TZ5+0dAv7Ef?=
 =?us-ascii?Q?F1VoabjCTUFQfczCxacAwxZ50ZWdPFFV4P8tfB3cCm5pQWzJbxmPUlV7xHZd?=
 =?us-ascii?Q?IQ4cUS8ul7/n8G/RkO/6r+zcU39G0uYdFlS6f7LamDgxMCmgkX4wY0X/W7AY?=
 =?us-ascii?Q?Cl7PGc+B52Ti7Mev7JIrTd5ekxW1aO3bagXBad+dTF5hNCT+wqceDPMa94dR?=
 =?us-ascii?Q?TugzaV5fs1Muee+aDqAoMZavOb22fzn1VAZ/IDjJSH3G0elaYg9YgQuH3rQQ?=
 =?us-ascii?Q?tOrj1nFdjdddENBW85zMyevlo0PW8IjoHpdDfW5E0675wdTAfpFTOGBLY2dM?=
 =?us-ascii?Q?rSOcgmXNTqqYiLOTLvVlEFODQnSH7yl/PEXigCFJZi40v4lc7bumgPH/G29n?=
 =?us-ascii?Q?JKrLyhs+aHV67OxQLbDunziieZnHz0isazANNkoEBuCB04lbLbxiYcvRlJd2?=
 =?us-ascii?Q?KU0okO44mfD+bQ4zNZ9b7a+fXKWUaE320D392OR33oflkq28bdty4vUlzax0?=
 =?us-ascii?Q?4kmF7c/ufNR4LuzNETuTIknNxkqhx+hNSE1/prNx1slO8lgmw0R5BV9c9Kbx?=
 =?us-ascii?Q?irmYI/vPfuHJoGkP+hoOOpN/5r1F6SENmhtdt/kgvztXALVwpQMzUiAaO81N?=
 =?us-ascii?Q?5rHNg6apqEO3Au+xAqRUvlBSE86TXQ3VV8jhknQNIINLy8YQXe43WdOMjtmx?=
 =?us-ascii?Q?43T9TYm/A2d0GLmGxAky+U3Pi2/Z0lGrxUebMvuADACMygwm1lZ1ZeZbddTN?=
 =?us-ascii?Q?7exjjZr/A6GbClhunNteW6Zz3omPgTiMohngVzgqsY1A9HrQMw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E9EE56750B1C4489B22BCE525C795BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9987
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4dc94fcd-8f72-43af-c70d-08dc9671a50e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AG2X7LsCsnYVHAcYuhqx2hgVm76U06UM0qvbvACVm7emYRz12NgqeVP7r/23?=
 =?us-ascii?Q?gE+8VYGksFWX04WBKIEzUr7A2yX8/0lQqPTMABo976VIWBKRVbysvZ3LRK3+?=
 =?us-ascii?Q?h0Hg9Tdi5EZt2PKu0Q10s8yO/IXs6qCYQG8QDnuQvQSeyPejRSeruBdI+HZC?=
 =?us-ascii?Q?Gfiihsrls8fU3YiGdAeaJv17iBes2mUkEEbu4T4a3FRxWPYqeoD5NR+PDdQe?=
 =?us-ascii?Q?Y8fmXAzxCfJ8dnM0GuDENXlD7TwuTvDHMhwir0oLDm3a2IcF56d4Lxw2VSUP?=
 =?us-ascii?Q?s7c3G2qV9cALSSvfzmW0UFW9Sknj/U6AIDPKc0DpbbxqyXwBba3Bu9VFsJ9h?=
 =?us-ascii?Q?FzKcxpp9htKRq/V0jwm6GDX+zSHJHgClH/r9Qcq55RIOkoGHVVlvH5IBGitf?=
 =?us-ascii?Q?9UvNqBOksZ4ACesluxNQakcLvM/FhNg4FHVRHyDuBudfH3vAg33WZQwoUr26?=
 =?us-ascii?Q?uLpDzGWMDheDVpc0r3xgh3VxYHHUph6POu7lOROLqYw/BN6fwmPe8t/JnP9g?=
 =?us-ascii?Q?di7+ORArLRwSVJ9q4CA5AAiBo7sVlk0mLjCQeU3eeNVh/cchnN5KdGefVVsQ?=
 =?us-ascii?Q?dOZMt9HXnCHjnJu7LifXcBkhSiGBjrqZCgpQljNUg7tgmOwiXs1gT7cE6kPM?=
 =?us-ascii?Q?RZsdX3efuwg6dJKSg2XEK4SpI3TuqHKjoS/jluFA8WuaDSF7eF+2x6F14DSo?=
 =?us-ascii?Q?dsEssh39+EtuBvQHdmbQgdZs7W1+iFWqS3G2OUARc/Qulvgkpmv9xK1/0Mws?=
 =?us-ascii?Q?UytzGOtKq+lPLYd0XKImWJOQwMSpxPY3WjPFuqH3PndHOGXJNv3AzkZ8ljbH?=
 =?us-ascii?Q?p0fgJmie3RXDAX1R0gr9lMPkowQpdY7Njx7WyTRCpz3ZusM/+JQ4BluuJBRg?=
 =?us-ascii?Q?aoI9hKW5HDKTf8/huBsEF0bfdEV+fkeHT5Fz5bXA20N3v6a7UwHySSo1Mvv1?=
 =?us-ascii?Q?Bq2xN430/NUI0HNJhB4p3ztu23y0eNUM3hpf9HwaJ6mATkulLNiwUwq9M1+L?=
 =?us-ascii?Q?uhbvT2V8JZMmcPgDHhi2G0yQoSU/nmMgLW4WvN/6+cLfXZiVee7dxOEKtZzB?=
 =?us-ascii?Q?oG4VjDGbhM8H2sN1T8jokMhUbxZtdNWjZ8sGB+wD1at2gNOLZ+SOkVzZFwmW?=
 =?us-ascii?Q?A31JOGXIKZlK3u4b0dAYfu00aCLjON7aD2AehwosBFoEnQBDu8fr9eH3ZqHM?=
 =?us-ascii?Q?XKzrXfRq1UMOAvKop1LymA9nIyw2rnP5oi7jrs65qanvQPjmhc1W4yutcusC?=
 =?us-ascii?Q?CgBtgoCGBpi7Jx5hSWaZ9jtHM6LZ41vqwSGuR3rlBC8qgvKFeuhTblBHAlL8?=
 =?us-ascii?Q?WOOJe0nxHYJmqr+xOkYYmqqzxYhqiuFtdBGA44QNMP+Ns08QWdHVtokMti6s?=
 =?us-ascii?Q?Jw4dwdR8YaVWBNzOisp3KmSCrGnksrPRnnBN9oke1QeUN8nctKRuGE9B24qv?=
 =?us-ascii?Q?1lX0OG95BRUL6EpzB8jcapOLeobtWArm?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:23:31.7676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bba2d8-d868-4ea3-6a52-08dc9671aab0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5912

Hi Georges,

> On 26 Jun 2024, at 17:19, George Dunlap <george.dunlap@cloud.com> wrote:
>=20
> Remain a Reviewer on the golang bindings and scheduler for now (using
> a xenproject.org alias), since there may be architectural decisions I
> can shed light on.
>=20
> Remove the XENTRACE section entirely, as there's no obvious candidate
> to take it over; having the respective parts fall back to the tools
> and The Rest seems the most reasonable option.
>=20
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

We will definitely miss you in the community.
Thanks for everything you have done for Xen.

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand


