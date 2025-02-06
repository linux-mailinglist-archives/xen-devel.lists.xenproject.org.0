Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2232FA2ABD2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 15:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882880.1292962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3Bj-0006m4-8H; Thu, 06 Feb 2025 14:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882880.1292962; Thu, 06 Feb 2025 14:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg3Bj-0006kL-3s; Thu, 06 Feb 2025 14:49:07 +0000
Received: by outflank-mailman (input) for mailman id 882880;
 Thu, 06 Feb 2025 14:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUPl=U5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tg3Bh-0006jU-JV
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 14:49:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20621.outbound.protection.outlook.com
 [2a01:111:f403:2614::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8207779f-e499-11ef-b3ef-695165c68f79;
 Thu, 06 Feb 2025 15:49:03 +0100 (CET)
Received: from DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) by DB9PR08MB8268.eurprd08.prod.outlook.com
 (2603:10a6:10:3c4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 14:48:59 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::e3) by DUZPR01CA0219.outlook.office365.com
 (2603:10a6:10:4b4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 14:49:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.14
 via Frontend Transport; Thu, 6 Feb 2025 14:48:58 +0000
Received: ("Tessian outbound c79bb2535b53:v567");
 Thu, 06 Feb 2025 14:48:57 +0000
Received: from Lc8f493a1d239.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 495E9799-AD0D-47F7-920C-68D88F7BA326.1; 
 Thu, 06 Feb 2025 14:48:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lc8f493a1d239.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 06 Feb 2025 14:48:51 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB8352.eurprd08.prod.outlook.com (2603:10a6:20b:56a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 14:48:48 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 14:48:48 +0000
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
X-Inumbo-ID: 8207779f-e499-11ef-b3ef-695165c68f79
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iKIJCKAmxlRRmTIM8C5Q5E/by1xtGWiwsxb0bHu3IQZtpKHqEdFRZZLlJRvNL9BgJ0z/DW//JCXBoM+dnbOY+ZUIIyF3frZXcF3yBm22Tl/aVbPDivbQxwp1najlQSeT2NPHuLaQzupB9QPMrF4SwDR/PxJVSpwnRq/K9DW+OLD5rmeGKQPrndzw+vcVBxhFRKXEqZ2M7BPL7J9+R8jAWeXOodz+c113nqCE1y9/e6qNUWNjJi6sgw70UTZ827/dG9RGSc9O/znm6sPBXie/AWSoTbR4zQny6FtZlT00MUKPz3VXNqma90XFVKOQ6uJt1OE/JpEK2r8madOEsmzS4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvYeLjhRMVix6j3+b+I1nzZTZB9MQX1UmICd5i77dN4=;
 b=F6QEvdG0TCAUcm90E1HDxvv/rkBwyNLR4alGDecGF9KQZaPeIE71sPAuUN1BkxSCJndAixD/enh+bXQ/jXNQcqFIrsUwMgKtLplYNrYTYz2whVR/hHGsrv4PzdrGOrrnL3ageRVGBa08VlA3o740FEZQTvpafKTByJEL/H0Hl7p15mogPF4KtBsrYARG18owhNjMtxG2EeWXm7sqrYS/+UylAKgtLA3iU29ZNeM89x7qEYfnhMNCVetmYtvRVBUpnrme2KCcIHDGr9ElsSjVM2VDZGbzHkfDgk/lPm+sTC8UUWPc9hJiUhD3uRqCLJh1Em7RPOk27Cn/osa+EuT/8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvYeLjhRMVix6j3+b+I1nzZTZB9MQX1UmICd5i77dN4=;
 b=RSkhSY+597q5HAuVoXcmlDPY+YfzMLzp1aK3huMN7vTmb4crCfXJukBb4AhEHSbjI2GnlUk40orAiTdG34nxQG45h/AXVxv4S58uobSbpUCdu4a6EScHTtjNO07f1LjLbC/KGwgYfKwOPf7OLlVEfHvTQy9HO4LSAxzfnDlQg3o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6f16ea9095e27852
X-TessianGatewayMetadata: IK5U51KGQH0qJnFrEExBiou+Id9+QKFuLO0/6jFZ6PqKOkWfvKyKqNRcYsD3MoNHprCYqnLHFqotz+0vST7X7fUiVdSa6IPrH/hA9roHUP03XH2NKTYnmUveFrib0EH078NL5ZXX3BBbxYtA93SxjgRgNyUDWHj9sqoLhdb2/ls=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oBcRemQh33pvjKjWJaJnGn8/1NYVKHJY0B71WYQYs30Ashj2O8rS1wrKJm2edkPAjqcpa/KPJ7raU7vwE0A8pz4TLzafBZl79eqfgX3SsrykUjs14oAI1jZAGXCyh4Ec2zlDLKTppVfP9DnOGdOK1/PyyuGkV379Dm/RcPhwj2N/SKGmYMkKpM8Z+5i0TvXqe3tJxapx403Yl74CiUfH4XYJNXILTs/7yVNKYFAZKO/q0rwabfIrcmmAJMnscO3OjyhF29Gb+biZsOBfmPg/JTHp9rw36ClgczFpRmysx6p4Jt+Sz7+9VdYKxzL5IB47+J0/xfVkY0A3B+Juo1pOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvYeLjhRMVix6j3+b+I1nzZTZB9MQX1UmICd5i77dN4=;
 b=FrEDcVvA+88SqAODDapOyIv1PHRy2/Tc3cxzH7MmeTgul3/+kn+E8pVxVOuwGglNqODtcBmXL4Uho/2ndvE7K6Pxf7ujTHOxhPmssNFKYHXHjSyu6u+Ky+90uFSncBRh5fe6jyX6CfJbl4E95x9XJbqkk8cktuL40sIlXYLalE46xtEAQ0dKwpTxOe7c3Aw8nCA+WMGzmK5b54MWjlFvdOUl26rC99FS8o4doqFng/4VEhR8AfFIo+hkYLZH/DtfKVuxdZ1dkpmenobxmUHGID/vd8Ed+Af8L/pIRDm72WhPW/XaIhXErMAO3/SA3ld1oi/Yk+5w3Bojdx/S3yHbyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvYeLjhRMVix6j3+b+I1nzZTZB9MQX1UmICd5i77dN4=;
 b=RSkhSY+597q5HAuVoXcmlDPY+YfzMLzp1aK3huMN7vTmb4crCfXJukBb4AhEHSbjI2GnlUk40orAiTdG34nxQG45h/AXVxv4S58uobSbpUCdu4a6EScHTtjNO07f1LjLbC/KGwgYfKwOPf7OLlVEfHvTQy9HO4LSAxzfnDlQg3o=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/5] xen/arm: mpu: Enclose access to MMU specific
 registers under CONFIG_MMU (arm32)
Thread-Topic: [PATCH 2/5] xen/arm: mpu: Enclose access to MMU specific
 registers under CONFIG_MMU (arm32)
Thread-Index: AQHbdzpqJMaBGUVj3UeUNZWdRXxdfLM6XfYA
Date: Thu, 6 Feb 2025 14:48:48 +0000
Message-ID: <0C7E90FC-B76E-4293-A716-1C74B1F89DA5@arm.com>
References: <20250204192357.1862264-1-ayan.kumar.halder@amd.com>
 <20250204192357.1862264-3-ayan.kumar.halder@amd.com>
In-Reply-To: <20250204192357.1862264-3-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB8352:EE_|DB3PEPF0000885C:EE_|DB9PR08MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 7351e2fa-c1bc-4657-a47f-08dd46bd6361
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?CSmxWvtcSvGISftHm3AbeieaipjIWOW9w7A4O210IyzC+rsPri7NmCjyGnBZ?=
 =?us-ascii?Q?Dvoi3ry8az1T+QfsNLtPrbs8EJEU1x6aFLZYQ1Z7NPQOoEqvw6OU9zsTJR8s?=
 =?us-ascii?Q?S77BHe9NHcbaCR3uC9+AeDhU+LAa5xNInb50+G93xNjpE1G3J4GzTzyR6nsc?=
 =?us-ascii?Q?Z+GM8dQlEPVnaeuOTxAUpaRfe2morsKUTZbvj4HvI1FHkIrTULsvRlm2bF8r?=
 =?us-ascii?Q?7ZBssd3R5lU47M+coILnQODLVJ10hdBGewJ0c+j3dhVAwJRpdFN5DkpYD+lU?=
 =?us-ascii?Q?cl2uAXAKLxGhZwu+WxX+AHnxmj955ByscVedCOyDspbZt+31n5xsb8sSKt1p?=
 =?us-ascii?Q?3BTet0wqtdLsKAVFvGcLE13HHUt2MsG6Ic3J0wLnYkw/W0RgFvcxBZ+HZcVk?=
 =?us-ascii?Q?t8Gpu5/9wBwJroWqd0aoCGiyF751QUywsQQ6rkEriWqiI4llnEd1+onBbFjH?=
 =?us-ascii?Q?cQlbWsqE2qwJANs4i2X9qLe15Copl0dp/1JqlOZENmAf4kkLGdKIHHH9ocXl?=
 =?us-ascii?Q?OXbbrLcK7YjGdXFbyNU0erK1ltYfWJwpOFFf1fm91Vvcl3z7Z87XhdMOe6L2?=
 =?us-ascii?Q?0TXBsYKFtlkPBgyb9rR09Cz4bKW+ke1/Fmbmj9IqA5D8vPTAnnxRSUfMAtum?=
 =?us-ascii?Q?rh2n1iG9EJEOmDhXw1IF9rMCTwcGr21b+dCjGMOvL0nlSX4r7VlMCXRb7Meo?=
 =?us-ascii?Q?5n4Xd8+IRBfjBe503VVo3urwJjY5Xr5e7x1yZNy3PzhJRUdWUJ2WSw8xOSV9?=
 =?us-ascii?Q?oOGCBmKw1l+4v2/Erfl/uDm/ELblxJko0G7QklrXtJrkj8vvuDAHRNq/1PH8?=
 =?us-ascii?Q?YsZj8QTchnnoPI1tMoIfkiA8VS2dasDSIXnOYoS5dNC49XV8jQipUL0PbgDz?=
 =?us-ascii?Q?iFe24rsyY519rDUfYBUEpx6Z20WfJ8PK+dRZqbGCX4BnqSZlfkHTKC3+fVPp?=
 =?us-ascii?Q?bVLzab+ziTxi27Y/OHN3RfcvoT35O2G3rnAx5wGu7WkqxSkRTz/787T47os5?=
 =?us-ascii?Q?wOhhk73EB4LKkk0qafNDMh6f3L3GrG3VzwN7y2Y/5OF37MXScHCQ8WpBMAV0?=
 =?us-ascii?Q?CIZ3hzVcO0zcY0jzTqOxYfk3+qkzrrOgdEGAYZOeHJv41FO07HnV57jKRyss?=
 =?us-ascii?Q?qyR/zrYRpT2UQVB39w2WP/sUGyXsaQkU2xBCQ6fx6j5RhlZUXPX5s4Q8mhJf?=
 =?us-ascii?Q?lN2GSh2ZvmIj2Kbqak6i7aNBpoRRsIxQUMoK6iHVImEmYGlyW4TORDNGnq4L?=
 =?us-ascii?Q?N4LhfqvsJhDF3XnsobTLqeFI1mvbwhwrRMflli/JPaYyLWJI+RHWysWJpz/s?=
 =?us-ascii?Q?u8pCgzbAD9aSo6fS8otbJG899FTOKXnlX2V2+Jz4Ha/DErDZgB/hhBeeTIP8?=
 =?us-ascii?Q?2taogbtbW9da+ZY2zhndoqy61y0b4OfMEQcEZIAsNRY7yfZ4jkRZQxFBupln?=
 =?us-ascii?Q?ePGF+Pa+KQcbnA3QYksg5k8uV4yUl5Rz?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E77D1C0656EEF43A790F1DCF2C52A15@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8352
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	678073c6-6482-48e3-c1af-08dd46bd5d8e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MbIS/cqqZXrwPe57l51roloJHzW78i9FglrHt4nHkXwmiQLd/Hv750J1otlS?=
 =?us-ascii?Q?gncf0uporzVTgNe89GRk23yk0SmW7EbDLFWGQ+AlcTT2dpl5r1eTHqsf0b8X?=
 =?us-ascii?Q?X7oBo5YDXrfV8xoet/fEv2N1Oi5v7fTdub5hEvZcwAoGdu68PkGsOBUarbf2?=
 =?us-ascii?Q?S47p8JfC6zQk1iNqGUu04l2+7BX7RXg1cJj+s1eDPLktVDcx4yBic4hWphfi?=
 =?us-ascii?Q?gWjeA0YAfjCw6q2tiggH29KuJZE7zTxcVC/mxl9SEM/SBj4bmyPyuDofTeZz?=
 =?us-ascii?Q?TROk1w2/3NO0gnxYc3+4g1iZXVtuHD5mrVtTqvlJeGK3iUyg5ZLwL0Ie4d3c?=
 =?us-ascii?Q?K+HCZOs7SlU/5ajJ3eM8yIU3qPhXExFO6H25RHGIngZNAIVKqzaVnfjLwdig?=
 =?us-ascii?Q?zwIQS8Rvs3Rd/ooKkiOk1WxFAu4kI8QU3SNmwwC1Entav6rcJL6fP3QZU5GW?=
 =?us-ascii?Q?feuaRXfXOguiXAYwEprPgOWPMlU98twq8TO6aehaBp0JiL5PqKNNSnBvs9Dp?=
 =?us-ascii?Q?SBqX5GV12+cVzY6rz571f4DFgC4UM0tKD9HqFv73gQMUKSt9Pon81lcP24Xs?=
 =?us-ascii?Q?TICxf3QLW9/WFrCBloWbf/4MHoYY1HUIaOF6AhBO4mXqxlm5r7ye+P9WDsgX?=
 =?us-ascii?Q?KYzrbrlPrJgw7ndcXdWEP7VnlyobEm8aX5IGcWlaEHdE9eoZK8mgto4dXl82?=
 =?us-ascii?Q?JT0IDq++CeImwvXxwDwSRRDYZZF0XFE6JHTLA9K28r1+QT5AA5Wo9Kr+XnXn?=
 =?us-ascii?Q?lMItZXZKo6abLG1jssvo4gpl5qScjlW05WA6P8XMYwv0u3ou2AqdJ5VzghET?=
 =?us-ascii?Q?XR+qaYkSOw+5RWkpLthBmPwFohFmCG7D8+odKoeop2aQJ3iliPdvwI5CYRJ7?=
 =?us-ascii?Q?TUmnyQs9l9MsXsq7gdVpisc8VKMZSA1vlcSMY9zoelt+S1BaSdS5BM/cJRf+?=
 =?us-ascii?Q?C2gOo0PTOBbKG93cCpOLKE8OLQOYJjQBQa5dWFwtF5tqG2v9jxAP/250mV2j?=
 =?us-ascii?Q?ryE9CVS0ofEpK1qnBK1B8ANvcAyYo138caYEbUZlolw9lZlrp9OgnEaLdxpp?=
 =?us-ascii?Q?Hg8TKAOgAWHlLsViwSjQcxP9QNImu0D9Q4q7c0PSonmkTv92lbHG6UyoaE4a?=
 =?us-ascii?Q?4yB7k9g4Ly/+qRX+aOQaj2N9wPUA3Wsy5jSh/QBDnef7FjCV2Ucjd+1Js12j?=
 =?us-ascii?Q?If+rjGEUs2dS5adWn/9Cv0ATe+3krHDK2+HV81WwNilfbUzzs741ApfpKJG9?=
 =?us-ascii?Q?TjsqGA3PokrxRfrveP8j3GivzEb/GodaUiJv1boydVO2BEsmhGSehltFlzBk?=
 =?us-ascii?Q?6XgOHRMbsZP5vUcSJOTUf6kMCN8Sx/RJR2iKmbNQ9IFur2CL3o84WtFykKcd?=
 =?us-ascii?Q?GOFMwV+/hYlGE50SDMqLumtnAAVlsSVCCCHc3s85gm5pgbqA8jmdznDt2FyW?=
 =?us-ascii?Q?Cp0nVdJWwjStIXgKCUdESJ44NRgdEXsfRwhcxwbZvXMQeEu2zIMlUO+OPcp0?=
 =?us-ascii?Q?u9grxpjGmtasjkk=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:48:58.6585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7351e2fa-c1bc-4657-a47f-08dd46bd6361
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8268

Hi Ayan,

> On 4 Feb 2025, at 19:23, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> All the EL2 MMU specific registers in head.S are enclosed within CONFIG_M=
MU.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> xen/arch/arm/arm32/head.S | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 4ff5c220bc..1d0f84b18f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -224,6 +224,7 @@ cpu_init_done:
>         mcr   CP32(r0, HMAIR0)
>         mcr   CP32(r1, HMAIR1)
>=20
> +#ifdef CONFIG_MMU
>         /*
>          * Set up the HTCR:
>          * PT walks use Inner-Shareable accesses,
> @@ -232,6 +233,7 @@ cpu_init_done:
>          */
>         mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_=
T0SZ(0))
>         mcr   CP32(r0, HTCR)
> +#endif

I was wondering if here it was better, for readability, to have this part d=
efined in the arm32/mmu/head.S and
arm32/mpu/head.S could have implemented a stub, maybe the maintainer could =
help with that.

Anyway this solution works for me.

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

>=20
>         mov_w r0, HSCTLR_SET
>         mcr   CP32(r0, HSCTLR)
> --=20
> 2.25.1
>=20
>=20


