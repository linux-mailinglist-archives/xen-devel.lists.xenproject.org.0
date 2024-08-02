Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCFB945B80
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:53:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770884.1181488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoxu-0004FY-Ir; Fri, 02 Aug 2024 09:52:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770884.1181488; Fri, 02 Aug 2024 09:52:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoxu-0004DM-G7; Fri, 02 Aug 2024 09:52:50 +0000
Received: by outflank-mailman (input) for mailman id 770884;
 Fri, 02 Aug 2024 09:52:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0M7b=PB=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sZoxt-0004DG-8A
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:52:49 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20604.outbound.protection.outlook.com
 [2a01:111:f403:260c::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8461b80-50b4-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 11:52:46 +0200 (CEST)
Received: from AS4P190CA0012.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::12)
 by GVXPR08MB11036.eurprd08.prod.outlook.com (2603:10a6:150:1f6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Fri, 2 Aug
 2024 09:52:43 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5de:cafe::15) by AS4P190CA0012.outlook.office365.com
 (2603:10a6:20b:5de::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Fri, 2 Aug 2024 09:52:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19
 via Frontend Transport; Fri, 2 Aug 2024 09:52:42 +0000
Received: ("Tessian outbound 4bc87b8a8d84:v365");
 Fri, 02 Aug 2024 09:52:42 +0000
Received: from L17de36cca420.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D9AD9BE-BFFB-4D70-B8C7-E08392DE0425.1; 
 Fri, 02 Aug 2024 09:52:35 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L17de36cca420.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Aug 2024 09:52:35 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB5895.eurprd08.prod.outlook.com (2603:10a6:20b:298::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Fri, 2 Aug
 2024 09:52:34 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%3]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 09:52:33 +0000
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
X-Inumbo-ID: f8461b80-50b4-11ef-bc03-fd08da9f4363
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tg3Sbl8YXsh1ZAhT3qe+hshjFndu5lMO5Y9AYrSk/o288bcqep/8Usbuz8lQGRoyRkGaT8YqWK9a9SQtrVjX58j2X6XM9zpAW1aD334FticfMHbr5J5kyxDXIF3Ihyrzd0+0kAHBFyLiwixTe8EU0yuqqZa7Hwc3OfNzPfKvEYK3y2ksHkJPe66X/lu/z11AldaXFm8v5YPrgqU/j3W3YAliPrENLGi1v7K8JZ1LEbOjdgDuLtmwCPBEQICVjoczxV29LE2v9/xyQ8uvd52/Ko0eieAz880Qfy7EWW6xzWe3rRf9Gpypua/f/drH4C5O0s2mfSlMsJSSN4JAYrL5Cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zny0u29PDwoKSUUaQ4Crr8XYTC3FaXx+RhNkv7KRZQ=;
 b=wjcySPO0NYTyisOuOt3/YkujZFjr5YeH133Jk36CQVwMwMknCkWLfl4TF3PG7HQXdk2edntuXkKkZA0P5z2WNJY9iUwz73K6dLPBt4f2wDJgE/nRDnq+G46VbnCSY7tutPUvr+UEypWRizzEaWNVptCgWkxBvaCWSugIFYUw83H39uU3JbZ9RB8FlFISC+UaGG4bAaepyod2QEW0Wxkg0y8VB+k6T7i1TykR5oCJsEPJ3a1q9B2khJieVKYkAgxWdILpGwkkf0jsdMKibCQs2HhvjJ8AO/05ShwBVHySk4yqGWLH8ykAkF5s9C077KzZOQAGrEi7LAoj+g8lok180g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zny0u29PDwoKSUUaQ4Crr8XYTC3FaXx+RhNkv7KRZQ=;
 b=aJmvCn0m52wMQ7fCHmt0op3jDj/J8JefQcWQY7MIxh66WghWBneBRqFqy7DzsnGhaL5sCdcXDODAxncn7eBuDKaqg6iTa2oNnkDji1E5Hh2WrABkcd0x+MygkB3HBWt0txjW16xArphYjLb80UfWwGmnI8Op0/x3PKs5uGfuIpY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d68d85d69b02cc6e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gU6tXNAjWjVQQ99UgTTReR4eb9J2vOktrteMVexQylsAU2LQHRetgGzZEISxZtHBZ4+rKWrnCiRP6EIVu6tju0Ter4vo5qYwBRYhUG3NgmEPgVK1hX8zxutHLom4b1zacjZYTYr2w7/PfqTcnQj4+DjB8FRv3TLUYzG5ESBLEy/FjR799Df7iwTlGQXVifyECMCOskY+1XsuZBaeYplaIReT24lubb15gT45bCGr59yYLsGSNaC7oFCZVqo2vZRsztxCznFH3OR2b2jQREpSvwTSxjz3NZFV5O2E4sz7MZpr4Ud6I5Cehc6JQyB+MdUjMNqUvnHN8c/yYnDbkQ2+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zny0u29PDwoKSUUaQ4Crr8XYTC3FaXx+RhNkv7KRZQ=;
 b=cJwWI7aZXczmwkyux0G0SI8+k8iTcijZMdoeKlDYxpjPCxuTRQJZEwZWbfqB9+yNrWGIrwbVNgdfQvJJAbiYwdTiTP+ZFTAVyeLqxhzkJhniAs6tr2Gw5a2I96GhRBE+mgMaFnA5AqxwAjlVYfECKywBISLLxCiOIxYtoFTv1dV/d3Kw66Xbrv5troMwpp7Fu+W94UffXnbYMuB4cKcPvQGNnTp0K/2RFU+bjdcWc22RM+t40a8+TsgxGu955rkGqpV+n+/tCiqxA8RGzyekiG0VnMfCbRAe4tkBMMWRpeo+2jdaRq8zR5lymYUEFqhagZS3WAXDlgrotNT/q6YX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zny0u29PDwoKSUUaQ4Crr8XYTC3FaXx+RhNkv7KRZQ=;
 b=aJmvCn0m52wMQ7fCHmt0op3jDj/J8JefQcWQY7MIxh66WghWBneBRqFqy7DzsnGhaL5sCdcXDODAxncn7eBuDKaqg6iTa2oNnkDji1E5Hh2WrABkcd0x+MygkB3HBWt0txjW16xArphYjLb80UfWwGmnI8Op0/x3PKs5uGfuIpY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "artem_mygaiev@epam.com" <artem_mygaiev@epam.com>,
	Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 3/3] docs: fusa: reqs: Added a requirements writing
 style guide
Thread-Topic: [PATCH v2 3/3] docs: fusa: reqs: Added a requirements writing
 style guide
Thread-Index: AQHa5MDknNNq96uHEUOMvzKrR1J1AbITudaA
Date: Fri, 2 Aug 2024 09:52:33 +0000
Message-ID: <A9ACD5AA-E2F4-4BCC-91BE-76450138FDA6@arm.com>
References: <20240802094614.1114227-1-ayan.kumar.halder@amd.com>
 <20240802094614.1114227-4-ayan.kumar.halder@amd.com>
In-Reply-To: <20240802094614.1114227-4-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB5895:EE_|AMS0EPF0000019A:EE_|GVXPR08MB11036:EE_
X-MS-Office365-Filtering-Correlation-Id: 975bc3ba-b4c8-4b8a-cc8e-08dcb2d8da86
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?UJ/BIezo2ECAGrGWn2sh5tHF+NQgDk30ZRCaKTPBf/IjmrChdFXU/Fg+FiFr?=
 =?us-ascii?Q?HKvzKHFNavdACClLLjg5GyKfH7dH8feoMgEDysmPo5TDaWas8JZLNWvmrsUL?=
 =?us-ascii?Q?pOsQhnHLPFMPGBEhBI02fdiJBg3i1lPkiQJHvgCUD4z0VXYt+IKK6Yow8uBZ?=
 =?us-ascii?Q?DoYms8bhSeAnZUhLRsG13Slu4RteVkDVnnlVIecR2wy99F48ONk+z7MNCTNI?=
 =?us-ascii?Q?Ry4ufZHGmMXLKJV4TQCtzGkndxnj/q9j2OS83Lnd0NTYndqDhiDwRSw4YT4w?=
 =?us-ascii?Q?2MOmDrzisDup8jC+LmtB6dWdY44+63gYf5ZKXDpyr0Cmx4UJ53f3TLXsurRn?=
 =?us-ascii?Q?gakpDQKLFmAUyybyUBgZ9liRbgbLyUSvXqcnFzbE6ehuVUZBgYU4J/WqV9Rs?=
 =?us-ascii?Q?0wbTxWAsvjk0S8cy3h5xXb6rDISk6bgE9S/qhVZ9UnFSq2H8Y8ayOohEBoXf?=
 =?us-ascii?Q?GmFwkTDaX9IsknZDO6wRjd1dqpYaMoT7Qvw9MSIO6dKaflJtp70I87ZM1eOW?=
 =?us-ascii?Q?zqbM3uph1YLY2pCMlzEmUC1bIrJbQMp4DZIO/MmXEbxyD5X9x3FaaeTZ5ZHT?=
 =?us-ascii?Q?a+pEum0cbcWg97h1d/t5mPrqDK2lAKWmLo7ZGpTCBpDPSfGwAqc41bC6fcaJ?=
 =?us-ascii?Q?2eYZSibR1X42TeYRtw7nDezT4jE/1nO89o2sw3a+dZ5ChwfPWMs6JlghPPk/?=
 =?us-ascii?Q?t5Y9zqRmWSTjpeKzFb48lIJYgMC+HAcT44AKLUaw63VPqOWndvjWycd0RbBc?=
 =?us-ascii?Q?xfg1ztiSub1RABcoxOM+tiw00gciCY1CbKqhd8qGv/goFZ418WJL8cnc8T0Z?=
 =?us-ascii?Q?rH0v1SL+xQn3PRaiAt0elOghR5t9Y93GkLdBRQJmkKP31WrqIbV4h76sEuiq?=
 =?us-ascii?Q?qT2pFHzPF86Bjn0nIhP2gwUbi1LyxqdiC0p3sljgjXTZLZfERn43I2e8ywNR?=
 =?us-ascii?Q?5Pb8Asv6gWah+JtUcAZQy5KxdxFnIw2II4qkZII37dXzlrZzh/LJwKTJ1mhn?=
 =?us-ascii?Q?HVaHRAkbhb1yjo9+MDV4K68E9SgTu/xLwOB2S7U5c+V6PlsuCBCpFkKuHlgt?=
 =?us-ascii?Q?k3VEVntl4A1QvSR3vy92NLtYnZT5pW9/yvJSDOWeKI8d81GuD+8q+GP0ns1j?=
 =?us-ascii?Q?Tm890BZfPNyUh7I4cF7thURwxQDfF2F10Y4VptCHg6z00wil/0I4bvMCnuhK?=
 =?us-ascii?Q?Btl/jUlNVF9q+ZiuNRlu6jVirfXSZ/1LHhFa+xVM3DAowt8CRg3hpwZd8y4M?=
 =?us-ascii?Q?DuF2XjhMNFG9c+zIF77Moi8fSvwE27mBxYUQ7zu3e6RhxvKF+2SGKBNCald3?=
 =?us-ascii?Q?4EbzKC4CtKc/Ncv2gM8TEgUydxRecPb9S9AxePkJizw+UO9q9humYBVMG31P?=
 =?us-ascii?Q?D0W2Jx7cjcqLxowWSBFgOzi5Mjh1mWwc9bK6pa20iDkWaqRPIA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60717A3E1DBB7649AC0A6CFCBB85ED38@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5895
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa003658-43eb-4dc1-3be6-08dcb2d8d536
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mU6C6oR09H1TtRwsvDdMfgcWc/s3qh7Kkn4qyZp+VlNi7Y4WZVhvfJ8z0o//?=
 =?us-ascii?Q?MyhQ8XsW3jZuDjb8tcrNADpNAs7mKv1gkn2gHHXkZD/CHGmjKGJTMjRZIJKh?=
 =?us-ascii?Q?BsdQz/ed7CpUpYNdOG/8w4wnQz1Ahg0YiJI3n8aQu1VUgjpY9eBktz7cjMPA?=
 =?us-ascii?Q?6NszI6xjFWNIWPGZWV2vf/RTqfdS6V/QTLG58dEKko8L9qorSkRFjd9Z4Li7?=
 =?us-ascii?Q?PArRw0T2cDMvkR7ViDNOjyIwyps8BKjrLelMBLTrR9Gd69bj/wM0zo1Ccs3E?=
 =?us-ascii?Q?Kbx2a061BHnGtFKUjYOg9c2Q7jQMub8PzEhJvpa7MdTjOartmgxG7Cvw9q4h?=
 =?us-ascii?Q?tYt4KdCX4V3KBty+0mxqvF2E2ySPR553Es0/O2cr5xdi9QxYGRWD0fpxC23m?=
 =?us-ascii?Q?kv0AA52190N3DTGD/7Rtsld8PLMY87cW8tFJ7qBbO2t3MmN1PrFFYN0SGkcL?=
 =?us-ascii?Q?m7QZcNU/1JopwhIPSm0kGTGqhRIRtdDsAQVP9babJYuvlwu15F/a5qQR9o2y?=
 =?us-ascii?Q?oZVls9AA1wn4XaHZ12HbrZRE6sMxY2pop88bPg/PC5rTAyz52z2QK98FyjUb?=
 =?us-ascii?Q?tUSgh/5g3wT4kmHrtGwH5Tc7b5gf6o44q/Srx87LSK44GQMrq4w8wnSlFqPb?=
 =?us-ascii?Q?5pKtWtU2k05OEe/+iCZ32+kVIjjB2k7S3FMIKEfltsH1t3xOzGDsbA+sibsY?=
 =?us-ascii?Q?31ZQp+Su8ujT4D0TQVvMFrMsls5g7k+BM6dxlUngX093NcPQtyFNnoa2Ofxc?=
 =?us-ascii?Q?BWefay7ws3rm8EnLCWj1WRufPnAebAET/gHgJSJzdLCf6iDkXXsf0idVxo+S?=
 =?us-ascii?Q?TjX5D2FJKHK35imW8gCJOx+vIEPoAOGdDXaYqRjkXCPfK1nU8vy7MUTRYZo3?=
 =?us-ascii?Q?n5tqnvrcDQTGRgS91oVd1KCKX2CCb/qD9HPPuPz7/qfb5k80ts40+D3lDayD?=
 =?us-ascii?Q?cJe2sCF4IFcOjAEXajtzKe/Eg2DPkQTgce4FocvXxUrepAt965UTqjy4z2Mm?=
 =?us-ascii?Q?TkAUWJ3RqVATXTlZUHLoKQ4ivbyUtYhBhMCkg7rpVUvcvYiWEaHYjEHvoq1X?=
 =?us-ascii?Q?ZtuvT0yCYZpgpGqSAbOH2zD32yOD6D0pAUOLLz/Z0CMmhWVQXGL63UGQUmOD?=
 =?us-ascii?Q?gzsWQGTtIRJveZ4LqYr6Eq0bG6m47Y+fQQ2iHUlubM/fq7M31VHki+/g3qXF?=
 =?us-ascii?Q?RHUnv8EYgXbziBot5IS84RtIpa4VxF6ZNTnN3qjwa2K52gvMJZftioy6krFG?=
 =?us-ascii?Q?YETWP3HIJsCc74ItQA+02FdMCfDaSjZrgKZuB1qS8SLoRO52cT+PqH6numSg?=
 =?us-ascii?Q?EScx0ZbiXinnHCS6Bm0XJcY3tAI1hwCOXoqEMyIkjPzGQTyCeWY+pp3GrNFJ?=
 =?us-ascii?Q?Nh4P75GfrWzgIB4J9h6aAczSxgU2+Gt20QH1eVlISJ2i8Lr1uc5OQRZNpsl+?=
 =?us-ascii?Q?YrHzBtchSw+o38v4qtUPazhg0Hq63sOx?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 09:52:42.8246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 975bc3ba-b4c8-4b8a-cc8e-08dcb2d8da86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11036

Hi Ayan,

> On 2 Aug 2024, at 11:46, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> Added a guide to help write and review requirements. The requirements
> are written to enable safety certification of Xen hypervisor.
>=20

Just a reminder if someone commits this serie:
PATCH 2 MUST NO BE COMMITED !!

Would have been a good idea to have it at the end of the serie and this one=
 before.

In any case:

> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from :-
>=20
> v1 - 1. No change.
>=20
> docs/fusa/reqs/REQUIREMENTS-STYLE | 34 +++++++++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
> create mode 100644 docs/fusa/reqs/REQUIREMENTS-STYLE
>=20
> diff --git a/docs/fusa/reqs/REQUIREMENTS-STYLE b/docs/fusa/reqs/REQUIREME=
NTS-STYLE
> new file mode 100644
> index 0000000000..cd2408b9f2
> --- /dev/null
> +++ b/docs/fusa/reqs/REQUIREMENTS-STYLE
> @@ -0,0 +1,34 @@
> +Requirements writing style for the Xen Hypervisor
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The requirements writing style described below is the style used for wri=
ting the
> +requirements of the Xen hypervisor to enable functional safety certifica=
tion.
> +
> +The requirements writing style is inspired from the ANSI/IEEE guide to S=
oftware
> +Requirements Standard. Specifically, the requirements should satisfy the
> +following validation checklist.
> +(Source - https://www.nasa.gov/reference/appendix-c-how-to-write-a-good-=
requirement)
> +
> +Clarity -
> +The requirements should be clear, unambiguous, consise and simple. Each
> +requirement should express a single thought. Each requirement stated sho=
uld have
> +a single interpretation.
> +
> +Consistency -
> +Any requirement shouldn't contradict with any other requirement. The req=
uirements
> +should be categorized correctly (the categories have been explained in t=
he
> +README). The tone of each requirement should be definitive (ie "Xen shal=
l ..."
> +should be present in each requirement).
> +
> +Traceability -
> +Any market requirement should be linked to the product requirement/s and
> +vice versa. Any product requirement should be linked to the design requi=
rement/s
> +and vice versa. Full bi-directional traceability should be maintained be=
tween
> +market, product and design requirements.
> +
> +Correctness -
> +The requirements should be feasible and technically correct (at the time=
 of
> +writing). However, it is not expected that the requirements will be kept=
 upto
> +date with the code.
> +
> +The requirements follow the same license and line length as the code.
> --=20
> 2.25.1
>=20


