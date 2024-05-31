Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812DC8D6488
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 16:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733756.1140090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD3G6-0008N6-WD; Fri, 31 May 2024 14:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733756.1140090; Fri, 31 May 2024 14:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD3G6-0008KB-SD; Fri, 31 May 2024 14:29:30 +0000
Received: by outflank-mailman (input) for mailman id 733756;
 Fri, 31 May 2024 14:29:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tx2a=NC=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sD3G5-0008Hp-0i
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 14:29:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df94626-1f5a-11ef-b4bb-af5377834399;
 Fri, 31 May 2024 16:29:25 +0200 (CEST)
Received: from DU6P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::9) by
 DB3PR08MB10333.eurprd08.prod.outlook.com (2603:10a6:10:436::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Fri, 31 May
 2024 14:28:48 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::69) by DU6P191CA0030.outlook.office365.com
 (2603:10a6:10:53f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24 via Frontend
 Transport; Fri, 31 May 2024 14:28:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15 via
 Frontend Transport; Fri, 31 May 2024 14:28:48 +0000
Received: ("Tessian outbound 53b276c4c668:v327");
 Fri, 31 May 2024 14:28:47 +0000
Received: from 5763db377f5c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5747244C-149C-48BE-8E98-4E92799A1A78.1; 
 Fri, 31 May 2024 14:28:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5763db377f5c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 31 May 2024 14:28:41 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS8PR08MB8681.eurprd08.prod.outlook.com (2603:10a6:20b:565::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.23; Fri, 31 May
 2024 14:28:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7611.030; Fri, 31 May 2024
 14:28:39 +0000
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
X-Inumbo-ID: 2df94626-1f5a-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=X8zAoCVLAsnkt4E1yMb4o8JNzd3C4MhdUrsc0OcxZNWbMkaI98hqKDUrcDk9w95+FNE0sxHJzS3J8/2mBQSRopMVX+ul/dXoD8ZMfBjRrC+a76FOldS6k268p6HEzUjOU76YAnziYPPDFZhfF24MPKyed1xmihl8PMv7BfjtS4R53FVvVfglbCfUnPGVCFLiN8vKeQzq0H9cU12F1q9+6a9gwhdgznVE8/OLqOtvqIJntyRXm/tCvfEEMlVuUV/iHkPfzkBH0RFMzvrsiVsbwkzKL7qbRwjTwiK78VpHY2phNdtAWbBQD+1KwT5g8UDUiKHwC0oLaIha+op3U/8KSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DtbrsJxqKrugAtIsyvqPvAb/eDAOPvoEkuEbUb1ltI=;
 b=n+UdFUqlhNdZwx3EOqWySGZXly3yGXxt3Y94T+ZudMMfzGVoVB2Af6Oi/x+0lq7299KVQ9wkrMc+BqFRsvFUwJLMFCKW4ttOacmme89Ez3Mg4TWJstFKWaK5yvOQFofKnzAaN2UHPCSOQtHfZzCIOd6p3wyU7ItF3i9fJlPzf0QsHsbgbTvp7rjgwfM7Ee6WIyLXjhPoBYny/P5KnzKCVNciuRgycQCFtxwvDTOoALiu0c7VX/eLwf+kVK9j7/OkjMXhpNk5ito+CQIn965qelpCg8y8d2xP2+kCQmbmSnByuUQUqq7ameISBdGWd9h6NgOZw7shtsve62kXs5xA+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DtbrsJxqKrugAtIsyvqPvAb/eDAOPvoEkuEbUb1ltI=;
 b=XgwCPX2zfHSynm4nun54fjyuQUimS2S9O4gmBS/oE3HS0OWifjMiUuwaCZexiESoDONV7GfBDn1nsVHgMSbtf03PIBnYiTCywdDLVnZhP1BJPPt1slxDzaj3lJsvkYBJTSkFOw8lr1A0aOTtqeDat31ZvqlQXKEdUfaCEZSAzho=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 253bd17835a0ff02
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7lr/Be/PlcAKE9HdTEPWGPAiL/Qzkku/S0hi6VxKXlehXhvEqm8exEMuu3MOkP5o2K5gs2H01zkB4siUpt7Hw1L5so/v71fx8brcH9EO/XLA0Q6SVyGY3H4U6NOCGn8N4GYpmqEb6d1pRYshN6iHwAcwXHfdp/LagT2dIEFib7LKKFpHSTLJXXR8JqICgGsiKoExkNjH3o29Ezz7PBrZDh+yyCXFd7eyKHaehK/BAlWl4f4TcvWRvausOZMv0raLGCB77NgjG0Wrs01GruzDujcJfG2y+bWIeZxaR0Amzvc74DQXKNC9XKjayILfT7BRnmcYQA5wWtMnpzV3oISKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DtbrsJxqKrugAtIsyvqPvAb/eDAOPvoEkuEbUb1ltI=;
 b=NLn3Piav+1wiYEmKYXuDhjSAxLWQ0E2I5ReGrBtlTacvK8n43Ea/vWFw/4rlMIYsYlnpjnxI+cairUKByoQPCFqaGgUz+BnrAQyE6ZWrD6ULOzZMNAzxEexS+DpkYCYJmNzFHabDyHm9n+BWtxt33vughctrwnj0ymWHc83XqKNpJDVTri/2HIZDyyn3OdGFGrowwPTdsMEiaH1uEh5abJ4+vZOalwVBvLXAkY93Zk+O8WFcbCwp7CzFBG+gWA3z+OmdK9Jq/c7CLFCkcM58NYRbuNjH7gNTK3ie3ViQLojNF1wkqPMrcLCcv3ZFv24++GvRwPGWouGPki42jgZFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DtbrsJxqKrugAtIsyvqPvAb/eDAOPvoEkuEbUb1ltI=;
 b=XgwCPX2zfHSynm4nun54fjyuQUimS2S9O4gmBS/oE3HS0OWifjMiUuwaCZexiESoDONV7GfBDn1nsVHgMSbtf03PIBnYiTCywdDLVnZhP1BJPPt1slxDzaj3lJsvkYBJTSkFOw8lr1A0aOTtqeDat31ZvqlQXKEdUfaCEZSAzho=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "patches@linaro.org"
	<patches@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v5 7/7] xen/arm: ffa: support notification
Thread-Topic: [XEN PATCH v5 7/7] xen/arm: ffa: support notification
Thread-Index: AQHasZmLIIIAu+VRvk26HUXX7ib+FLGxammA
Date: Fri, 31 May 2024 14:28:39 +0000
Message-ID: <C52D6A7C-1136-4BF1-9060-600157F641F5@arm.com>
References: <20240529072559.2486986-1-jens.wiklander@linaro.org>
 <20240529072559.2486986-8-jens.wiklander@linaro.org>
In-Reply-To: <20240529072559.2486986-8-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS8PR08MB8681:EE_|DU6PEPF00009528:EE_|DB3PR08MB10333:EE_
X-MS-Office365-Filtering-Correlation-Id: 81361f87-126e-4594-38bc-08dc817dfc1e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?YOLIDN5xoq4MzrzCtPj/BKGxI5tF97/WWZVr1vSkAQUYYq5ZIIT1VPHlAWj6?=
 =?us-ascii?Q?9e1qS/s7TfoO4534SkRBF2ZOZ66f4sYnc25RbdUPDlmkt4awkPFd49D5ZIeR?=
 =?us-ascii?Q?ZgMA/qRNqBRSvh9OoA6lR5Ot0TXHMvAWPyRH3OZ5in58M+xT4Yu/bNI1B9uB?=
 =?us-ascii?Q?odf/G2fmpHLytujl4MT0+exSLfr/FrVgqdu7+vXnF8BuAReaNCUn0eNdJW6+?=
 =?us-ascii?Q?bbWRzGaFEyWUZ+LU0Nh2tyQ0PwG0p/oR1l105RQaWHKBIi4fxxKrviPc76T/?=
 =?us-ascii?Q?caUwaDjaTt5bvjpuJzHZy4TYMZdewH79lMKE85JM4/U14uPAj4w7/gyLO9zU?=
 =?us-ascii?Q?aCyTmj0qcGdGT5dNBw3yDgETJe23WFn3xaA/l6IyIvle4py19L9Cyao6JRBo?=
 =?us-ascii?Q?JcaxxIAi3TNI3xyT2Bl2UktIborwWU+L4qU++G6K0cxuLMPn7vkZEDBStHpb?=
 =?us-ascii?Q?DpOApfJnMnmI3sKpQj860gJA1eq52b9ZXeyYM3V2HtfKqtwcHTA966/xGd6l?=
 =?us-ascii?Q?EkjH6uc/3tMDT+AI1/5GvkEWg/SIbf5DVJR7m+afhqEmj5obxOLh1MS62fAE?=
 =?us-ascii?Q?YORg/zTaByjh6dU1sQIMOO+Bl7+zizE1Zi1g9FvTIirrsSRHvaUvNio5/dLc?=
 =?us-ascii?Q?1DLY25lQcJ4R4Wpn9nBaSfUBN8NFxk1GrSn+PWREg/eGs124zixryUAjpSFW?=
 =?us-ascii?Q?pJqsqvr9CIUscVXeKEdnKLMeOkulUUijtWlg4jM6uiPc8unr5pWD+KNxiQrr?=
 =?us-ascii?Q?BE3XTabeMj1bIOU8+Zr2RagBDABQeQfoWg0aKn2268MkVxhBy2Z6XCwRifae?=
 =?us-ascii?Q?eGP0yEmchOwdHGrFRn0OmrA81kLM2WRN6srcLYQZdYGN4yU2mNsPwd7dgdjv?=
 =?us-ascii?Q?+Het2vRYmOwMNe1R5wvyf3jalMq2Eejou5C5sByFV2lrBPaEZ7ytLZicH+fF?=
 =?us-ascii?Q?6S3+wDI+wXFIQ5CGUUFuGjpjrX6GoAoc0KTpL9hG75LcshX+nPWU6QX6AXId?=
 =?us-ascii?Q?tKtrqReq1SbI98wu+QcbVJGQELkrtaOCgqqpenFdG3KPcit5Yqmjk6J/ak6E?=
 =?us-ascii?Q?BOhvnWVdyQFQfkPRT2KbGl0GQp5t9pmDi++J3avXfzZTM963g7vMGUhY243R?=
 =?us-ascii?Q?EsgIe2jjx0gNZYi4jJn/tq7tUKgqH+w9p3b3kMDTVa1fw2VVqAKcK0M0/fez?=
 =?us-ascii?Q?noRyo6oXFGErjSLwdyFOVC3qbHkOmgU4335ovXkmx7Ee0XC1xlRGgbgGbPsI?=
 =?us-ascii?Q?GBS2P8hOxCfO1uaKODAm3DH7TWNBuUVscUpJszTMVQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AF6D4881E5DB1E4CBB3FF0E9772257BC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8681
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a0c55e5b-a51a-42ca-efe3-08dc817df713
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|35042699013|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q2m/3PZghvBmI43vetMRmQtX6KDV/QxagpUFEvPiD+JppaomMH/ZZz+k+a6l?=
 =?us-ascii?Q?V1Rc5ycqUK+e+XY1B8kuqZ6KhcCOqoL9AgqtyEk4mzF8yk9/lnlIDelVvEXC?=
 =?us-ascii?Q?2p5t0fmY+8QXQjkD0oDN2oSEcqzt3eMs/zTkbmtMuOpa7k3teIUKcqEbBnmO?=
 =?us-ascii?Q?ei0RDa50PJIC/dOJyEjGY8rLnwV6sqMbqteQu0VDEwHrWB1l9hMsdQoEd9eP?=
 =?us-ascii?Q?b8/7LBRU5mX9as228AEABfroo+H/T1R1IBIVlsQ212MvdlwujZAdXwwlyTTd?=
 =?us-ascii?Q?oOZC2rRPbbOqVrcxUBNXz/oZ2FmtWAotfojeRd/dYiil7MLCPSKyU+nvRH7A?=
 =?us-ascii?Q?Rnz91DswrJAwx7fO9rUPofAObQqlkXOZcZ7fido6bVD0oC+Wf5Q5xqX0Iin4?=
 =?us-ascii?Q?QSQkl3TzJXHzj0SScWwSgo1O9yh6EyB6nEncDxCEDA6pEpxKoL42UTa9rUqK?=
 =?us-ascii?Q?rJauL1HEzRyo9xihz1LeUUTSVQykAKSE6XK+G9Z3VQVF1YzD1ID49J0dJeCv?=
 =?us-ascii?Q?2m4+AZAXvQZ1Wv9OLzU5dbZbCQs4PzXvNhdJtaa5O+lKVcQN9KuA7JJxaS/B?=
 =?us-ascii?Q?QECUlj6tNyVn8w559FMLpFuFUDgrhhsQJLVHfw0O/GNUG2+m/d+Zfp1hVnTN?=
 =?us-ascii?Q?PmeerURmbpFgM2KstdpUwpvS4ZhL5Pel1qlUo+HQysLsWPXB10ZTCKb5Nan/?=
 =?us-ascii?Q?ES1FOwNVO/ni1wjk7ZrvJJAcuHK+VZfouVmPg4sEuix/xlfr4ajkPLlAHI47?=
 =?us-ascii?Q?Xg2J7MrtnoP4645PdzT9qEGRV9wMIFZZxRtdXFV67vJVSG1ScJiXKkuX5MpV?=
 =?us-ascii?Q?+eb+pcviHuq51f+6IhwfdZ/QSa3Rf5C1+rannQGzzQ5c7toALJ4yMtBrWRGs?=
 =?us-ascii?Q?iglMnpk5PcC4Y/8agLj1bFvww+JmuN4htO6lJIg1EDpX30rgFjI6f+3X2XF2?=
 =?us-ascii?Q?o38WlxKYKC3kHP4ZIpP0CnDYcE2bghXKP0QZUx74J2XA7LbryqJP26gnf2a5?=
 =?us-ascii?Q?VAbCpEljPE94wqOQdxCQveizkgI8FBeOxWb95fV/ktYxbI24/dS+l25LIvnL?=
 =?us-ascii?Q?2/fUFhHPuUEDE04dmRZv5CLnmAt7eavSuNY9xneiZZ8R/q6z2fXID8AXmHsg?=
 =?us-ascii?Q?993HHaEJe1F5eA29/RmVm8lm7K0x/w5yIF1x/tjyOSjZrhYz8aOW/QG5KTbx?=
 =?us-ascii?Q?RRvaKXlUwvOUoBY7joMtnYA3O+7HzNUSscJo+FUgQrcWTOEehAZz+NCvIPTR?=
 =?us-ascii?Q?zAPYw+ImlHvBlv/GjnnkTWvAvaju0kIR+pPyfC1pSy5XrCz1z8W328rkwxyK?=
 =?us-ascii?Q?8QZre7pqZ4xxSoEQj5SBCuMf?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(35042699013)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 14:28:48.0501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81361f87-126e-4594-38bc-08dc817dfc1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB10333

Hi Jens,

> On 29 May 2024, at 09:25, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Add support for FF-A notifications, currently limited to an SP (Secure
> Partition) sending an asynchronous notification to a guest.
>=20
> Guests and Xen itself are made aware of pending notifications with an
> interrupt. The interrupt handler triggers a tasklet to retrieve the
> notifications using the FF-A ABI and deliver them to their destinations.
>=20
> Update ffa_partinfo_domain_init() to return error code like
> ffa_notif_domain_init().
>=20
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> ---
> v4->v5:
> - Move the freeing of d->arch.tee to the new TEE mediator free_domain_ctx
>  callback to make the context accessible during rcu_lock_domain_by_id()
>  from a tasklet
> - Initialize interrupt handlers for secondary CPUs from the new TEE media=
tor
>  init_interrupt() callback
> - Restore the ffa_probe() from v3, that is, remove the
>  presmp_initcall(ffa_init) approach and use ffa_probe() as usual now that=
 we
>  have the init_interrupt callback.
> - A tasklet is added to handle the Schedule Receiver interrupt. The taskl=
et
>  finds each relevant domain with rcu_lock_domain_by_id() which now is eno=
ugh
>  to guarantee that the FF-A context can be accessed.
> - The notification interrupt handler only schedules the notification
>  tasklet mentioned above
>=20
> v3->v4:
> - Add another note on FF-A limitations
> - Clear secure_pending in ffa_handle_notification_get() if both SP and SP=
M
>  bitmaps are retrieved
> - ASSERT that ffa_rcu_lock_domain_by_vm_id() isn't passed the vm_id FF-A
>  uses for Xen itself
> - Replace the get_domain_by_id() call done via ffa_get_domain_by_vm_id() =
in
>  notif_irq_handler() with a call to rcu_lock_live_remote_domain_by_id() v=
ia
>  ffa_rcu_lock_domain_by_vm_id()
> - Remove spinlock in struct ffa_ctx_notif and use atomic functions as nee=
ded
>  to access and update the secure_pending field
> - In notif_irq_handler(), look for the first online CPU instead of assumi=
ng
>  that the first CPU is online
> - Initialize FF-A via presmp_initcall() before the other CPUs are online,
>  use register_cpu_notifier() to install the interrupt handler
>  notif_irq_handler()
> - Update commit message to reflect recent updates
>=20
> v2->v3:
> - Add a GUEST_ prefix and move FFA_NOTIF_PEND_INTR_ID and
>  FFA_SCHEDULE_RECV_INTR_ID to public/arch-arm.h
> - Register the Xen SRI handler on each CPU using on_selected_cpus() and
>  setup_irq()
> - Check that the SGI ID retrieved with FFA_FEATURE_SCHEDULE_RECV_INTR
>  doesn't conflict with static SGI handlers
>=20
> v1->v2:
> - Addressing review comments
> - Change ffa_handle_notification_{bind,unbind,set}() to take struct
>  cpu_user_regs *regs as argument.
> - Update ffa_partinfo_domain_init() and ffa_notif_domain_init() to return
>  an error code.
> - Fixing a bug in handle_features() for FFA_FEATURE_SCHEDULE_RECV_INTR.
> ---
> xen/arch/arm/tee/Makefile       |   1 +
> xen/arch/arm/tee/ffa.c          |  72 +++++-
> xen/arch/arm/tee/ffa_notif.c    | 409 ++++++++++++++++++++++++++++++++
> xen/arch/arm/tee/ffa_partinfo.c |   9 +-
> xen/arch/arm/tee/ffa_private.h  |  56 ++++-
> xen/arch/arm/tee/tee.c          |   2 +-
> xen/include/public/arch-arm.h   |  14 ++
> 7 files changed, 548 insertions(+), 15 deletions(-)
> create mode 100644 xen/arch/arm/tee/ffa_notif.c
>=20
> diff --git a/xen/arch/arm/tee/Makefile b/xen/arch/arm/tee/Makefile
> index f0112a2f922d..7c0f46f7f446 100644
> --- a/xen/arch/arm/tee/Makefile
> +++ b/xen/arch/arm/tee/Makefile
> @@ -2,5 +2,6 @@ obj-$(CONFIG_FFA) +=3D ffa.o
> obj-$(CONFIG_FFA) +=3D ffa_shm.o
> obj-$(CONFIG_FFA) +=3D ffa_partinfo.o
> obj-$(CONFIG_FFA) +=3D ffa_rxtx.o
> +obj-$(CONFIG_FFA) +=3D ffa_notif.o
> obj-y +=3D tee.o
> obj-$(CONFIG_OPTEE) +=3D optee.o
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 5209612963e1..d644ee97cd5b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -39,6 +39,12 @@
>  *   - at most 32 shared memory regions per guest
>  * o FFA_MSG_SEND_DIRECT_REQ:
>  *   - only supported from a VM to an SP
> + * o FFA_NOTIFICATION_*:
> + *   - only supports global notifications, that is, per vCPU notificatio=
ns
> + *     are not supported
> + *   - doesn't support signalling the secondary scheduler of pending
> + *     notification for secure partitions
> + *   - doesn't support notifications for Xen itself
>  *
>  * There are some large locked sections with ffa_tx_buffer_lock and
>  * ffa_rx_buffer_lock. Especially the ffa_tx_buffer_lock spinlock used
> @@ -194,6 +200,8 @@ out:
>=20
> static void handle_features(struct cpu_user_regs *regs)
> {
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>     uint32_t a1 =3D get_user_reg(regs, 1);
>     unsigned int n;
>=20
> @@ -240,6 +248,30 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>         BUILD_BUG_ON(PAGE_SIZE !=3D FFA_PAGE_SIZE);
>         ffa_set_regs_success(regs, 0, 0);
>         break;
> +    case FFA_FEATURE_NOTIF_PEND_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, GUEST_FFA_NOTIF_PEND_INTR_ID, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +    case FFA_FEATURE_SCHEDULE_RECV_INTR:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, =
0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
> +
> +    case FFA_NOTIFICATION_BIND:
> +    case FFA_NOTIFICATION_UNBIND:
> +    case FFA_NOTIFICATION_GET:
> +    case FFA_NOTIFICATION_SET:
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        if ( ctx->notif.enabled )
> +            ffa_set_regs_success(regs, 0, 0);
> +        else
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        break;
>     default:
>         ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
>         break;
> @@ -305,6 +337,22 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>                                                      get_user_reg(regs, 1=
)),
>                                    get_user_reg(regs, 3));
>         break;
> +    case FFA_NOTIFICATION_BIND:
> +        e =3D ffa_handle_notification_bind(regs);
> +        break;
> +    case FFA_NOTIFICATION_UNBIND:
> +        e =3D ffa_handle_notification_unbind(regs);
> +        break;
> +    case FFA_NOTIFICATION_INFO_GET_32:
> +    case FFA_NOTIFICATION_INFO_GET_64:
> +        ffa_handle_notification_info_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_GET:
> +        ffa_handle_notification_get(regs);
> +        return true;
> +    case FFA_NOTIFICATION_SET:
> +        e =3D ffa_handle_notification_set(regs);
> +        break;
>=20
>     default:
>         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> @@ -322,6 +370,7 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
> static int ffa_domain_init(struct domain *d)
> {
>     struct ffa_ctx *ctx;
> +    int ret;
>=20
>     if ( !ffa_version )
>         return -ENODEV;
> @@ -345,10 +394,11 @@ static int ffa_domain_init(struct domain *d)
>      * error, so no need for cleanup in this function.
>      */
>=20
> -    if ( !ffa_partinfo_domain_init(d) )
> -        return -EIO;
> +    ret =3D ffa_partinfo_domain_init(d);
> +    if ( ret )
> +        return ret;
>=20
> -    return 0;
> +    return ffa_notif_domain_init(d);
> }
>=20
> static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_=
time)
> @@ -376,13 +426,6 @@ static void ffa_domain_teardown_continue(struct ffa_=
ctx *ctx, bool first_time)
>     }
>     else
>     {
> -        /*
> -         * domain_destroy() might have been called (via put_domain() in
> -         * ffa_reclaim_shms()), so we can't touch the domain structure
> -         * anymore.
> -         */
> -        xfree(ctx);
> -
>         /* Only check if there has been a change to the teardown queue */
>         if ( !first_time )
>         {
> @@ -423,12 +466,18 @@ static int ffa_domain_teardown(struct domain *d)
>         return 0;
>=20
>     ffa_rxtx_domain_destroy(d);
> +    ffa_notif_domain_destroy(d);
>=20
>     ffa_domain_teardown_continue(ctx, true /* first_time */);
>=20
>     return 0;
> }
>=20
> +static void ffa_free_domain_ctx(struct domain *d)
> +{
> +    XFREE(d->arch.tee);
> +}
> +
> static int ffa_relinquish_resources(struct domain *d)
> {
>     return 0;
> @@ -502,6 +551,7 @@ static bool ffa_probe(void)
>     if ( !ffa_partinfo_init() )
>         goto err_rxtx_destroy;
>=20
> +    ffa_notif_init();
>     INIT_LIST_HEAD(&ffa_teardown_head);
>     init_timer(&ffa_teardown_timer, ffa_teardown_timer_callback, NULL, 0)=
;
>=20
> @@ -517,8 +567,10 @@ err_rxtx_destroy:
> static const struct tee_mediator_ops ffa_ops =3D
> {
>     .probe =3D ffa_probe,
> +    .init_interrupt =3D ffa_notif_init_interrupt,

With the previous change on init secondary i would suggest to
have a ffa_init_secondary here actually calling the ffa_notif_init_interrup=
t.

>     .domain_init =3D ffa_domain_init,
>     .domain_teardown =3D ffa_domain_teardown,
> +    .free_domain_ctx =3D ffa_free_domain_ctx,
>     .relinquish_resources =3D ffa_relinquish_resources,
>     .handle_call =3D ffa_handle_call,
> };
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> new file mode 100644
> index 000000000000..e8e8b62590b3
> --- /dev/null
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -0,0 +1,409 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024  Linaro Limited
> + */
> +
> +#include <xen/const.h>
> +#include <xen/cpu.h>
> +#include <xen/list.h>
> +#include <xen/notifier.h>
> +#include <xen/spinlock.h>
> +#include <xen/tasklet.h>
> +#include <xen/types.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/regs.h>
> +
> +#include "ffa_private.h"
> +
> +static bool __ro_after_init notif_enabled;
> +static unsigned int __ro_after_init notif_sri_irq;
> +
> +int ffa_handle_notification_bind(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst =3D get_user_reg(regs, 1);
> +    uint32_t flags =3D get_user_reg(regs, 2);
> +    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> +    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( flags )    /* Only global notifications are supported */
> +        return FFA_RET_DENIED;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the sen=
der
> +     * endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags, bitmap=
_hi,
> +                           bitmap_lo);
> +}
> +
> +int ffa_handle_notification_unbind(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst =3D get_user_reg(regs, 1);
> +    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> +    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /*
> +     * We only support notifications from SP so no need to check the
> +     * destination endpoint ID, the SPMC will take care of that for us.
> +     */
> +    return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitmap_=
hi,
> +                            bitmap_lo);
> +}
> +
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    if ( test_and_clear_bool(ctx->notif.secure_pending) )
> +    {
> +        /* A pending global notification for the guest */
> +        ffa_set_regs(regs, FFA_SUCCESS_64, 0,
> +                     1U << FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT, ffa_get_vm=
_id(d),
> +                     0, 0, 0, 0);
> +    }
> +    else
> +    {
> +        /* Report an error if there where no pending global notification=
 */
> +        ffa_set_regs_error(regs, FFA_RET_NO_DATA);
> +    }
> +}
> +
> +void ffa_handle_notification_get(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t recv =3D get_user_reg(regs, 1);
> +    uint32_t flags =3D get_user_reg(regs, 2);
> +    uint32_t w2 =3D 0;
> +    uint32_t w3 =3D 0;
> +    uint32_t w4 =3D 0;
> +    uint32_t w5 =3D 0;
> +    uint32_t w6 =3D 0;
> +    uint32_t w7 =3D 0;
> +
> +    if ( !notif_enabled )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        return;
> +    }
> +
> +    if ( (recv & 0xFFFFU) !=3D ffa_get_vm_id(d) )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
> +        return;
> +    }
> +
> +    if ( flags & ( FFA_NOTIF_FLAG_BITMAP_SP | FFA_NOTIF_FLAG_BITMAP_SPM =
) )
> +    {
> +        struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_NOTIFICATION_GET,
> +            .a1 =3D recv,
> +            .a2 =3D flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
> +                            FFA_NOTIF_FLAG_BITMAP_SPM ),
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +        int32_t e;
> +
> +        /*
> +         * Clear secure pending if both FFA_NOTIF_FLAG_BITMAP_SP and
> +         * FFA_NOTIF_FLAG_BITMAP_SPM are set since secure world can't ha=
ve
> +         * any more pending notifications.
> +         */
> +        if ( ( flags  & FFA_NOTIF_FLAG_BITMAP_SP ) &&
> +             ( flags & FFA_NOTIF_FLAG_BITMAP_SPM ) )
> +        {
> +                struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +                ACCESS_ONCE(ctx->notif.secure_pending) =3D false;
> +        }
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        e =3D ffa_get_ret_code(&resp);
> +        if ( e )
> +        {
> +            ffa_set_regs_error(regs, e);
> +            return;
> +        }
> +
> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SP )
> +        {
> +            w2 =3D resp.a2;
> +            w3 =3D resp.a3;
> +        }
> +
> +        if ( flags & FFA_NOTIF_FLAG_BITMAP_SPM )
> +            w6 =3D resp.a6;
> +    }
> +
> +    ffa_set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, w4, w5, w6, w7);
> +}
> +
> +int ffa_handle_notification_set(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst =3D get_user_reg(regs, 1);
> +    uint32_t flags =3D get_user_reg(regs, 2);
> +    uint32_t bitmap_lo =3D get_user_reg(regs, 3);
> +    uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +
> +    if ( !notif_enabled )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Let the SPMC check the destination of the notification */
> +    return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bitmap_=
lo,
> +                           bitmap_hi);
> +}
> +
> +/*
> + * Extract a 16-bit ID (index n) from the successful return value from
> + * FFA_NOTIFICATION_INFO_GET_64 or FFA_NOTIFICATION_INFO_GET_32. IDs are
> + * returned in registers 3 to 7 with four IDs per register for 64-bit
> + * calling convention and two IDs per register for 32-bit calling
> + * convention.
> + */
> +static uint16_t get_id_from_resp(struct arm_smccc_1_2_regs *resp,
> +                                 unsigned int n)
> +{
> +    unsigned int ids_per_reg;
> +    unsigned int reg_idx;
> +    unsigned int reg_shift;
> +
> +    if ( smccc_is_conv_64(resp->a0) )
> +        ids_per_reg =3D 4;
> +    else
> +        ids_per_reg =3D 2;
> +
> +    reg_idx =3D n / ids_per_reg + 3;
> +    reg_shift =3D ( n % ids_per_reg ) * 16;
> +
> +    switch ( reg_idx )
> +    {
> +    case 3:
> +        return resp->a3 >> reg_shift;
> +    case 4:
> +        return resp->a4 >> reg_shift;
> +    case 5:
> +        return resp->a5 >> reg_shift;
> +    case 6:
> +        return resp->a6 >> reg_shift;
> +    case 7:
> +        return resp->a7 >> reg_shift;
> +    default:
> +        ASSERT(0); /* "Can't happen" */
> +        return 0;
> +    }
> +}
> +
> +static void notif_vm_pend_intr(uint16_t vm_id)
> +{
> +    struct ffa_ctx *ctx;
> +    struct domain *d;
> +    struct vcpu *v;
> +
> +    /*
> +     * vm_id =3D=3D 0 means a notifications pending for Xen itself, but
> +     * we don't support that yet.
> +     */
> +    if ( !vm_id )
> +        return;
> +
> +    d =3D ffa_rcu_lock_domain_by_vm_id(vm_id);
> +    if ( !d )
> +        return;
> +
> +    ctx =3D d->arch.tee;
> +    if ( !ctx )
> +        goto out_unlock;

In both previous cases you are silently ignoring an interrupt
due to an internal error.
Is this something that we should trace ? maybe just debug ?

Could you add a comment to explain why this could happen
(when possible) or not and the possible side effects ?

The second one would be a notification for a domain without
FF-A enabled which is ok but i am a bit more wondering on
the first one.

> +
> +    /*
> +     * arch.tee is freed from complete_domain_destroy() so the RCU lock
> +     * guarantees that the data structure isn't freed while we're access=
ing
> +     * it.
> +     */
> +    ACCESS_ONCE(ctx->notif.secure_pending) =3D true;
> +
> +    /*
> +     * Since we're only delivering global notification, always
> +     * deliver to the first online vCPU. It doesn't matter
> +     * which we chose, as long as it's available.
> +     */
> +    for_each_vcpu(d, v)
> +    {
> +        if ( is_vcpu_online(v) )
> +        {
> +            vgic_inject_irq(d, v, GUEST_FFA_NOTIF_PEND_INTR_ID,
> +                            true);
> +            break;
> +        }
> +    }
> +    if ( !v )
> +        printk(XENLOG_ERR "ffa: can't inject NPI, all vCPUs offline\n");
> +
> +out_unlock:
> +    rcu_unlock_domain(d);
> +}
> +
> +static void notif_sri_action(void *unused)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_NOTIFICATION_INFO_GET_64,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int id_pos;
> +    unsigned int list_count;
> +    uint64_t ids_count;
> +    unsigned int n;
> +    int32_t res;
> +
> +    do {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        res =3D ffa_get_ret_code(&resp);
> +        if ( res )
> +        {
> +            if ( res !=3D FFA_RET_NO_DATA )
> +                printk(XENLOG_ERR "ffa: notification info get failed: er=
ror %d\n",
> +                       res);
> +            return;
> +        }
> +
> +        ids_count =3D resp.a2 >> FFA_NOTIF_INFO_GET_ID_LIST_SHIFT;
> +        list_count =3D ( resp.a2 >> FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT ) =
&
> +                     FFA_NOTIF_INFO_GET_ID_COUNT_MASK;
> +
> +        id_pos =3D 0;
> +        for ( n =3D 0; n < list_count; n++ )
> +        {
> +            unsigned int count =3D ((ids_count >> 2 * n) & 0x3) + 1;
> +            uint16_t vm_id =3D get_id_from_resp(&resp, id_pos);
> +
> +            notif_vm_pend_intr(vm_id);
> +
> +            id_pos +=3D count;
> +        }
> +
> +    } while (resp.a2 & FFA_NOTIF_INFO_GET_MORE_FLAG);
> +}
> +
> +static DECLARE_TASKLET(notif_sri_tasklet, notif_sri_action, NULL);
> +
> +static void notif_irq_handler(int irq, void *data)
> +{
> +    tasklet_schedule(&notif_sri_tasklet);
> +}
> +
> +static int32_t ffa_notification_bitmap_create(uint16_t vm_id,
> +                                              uint32_t vcpu_count)
> +{
> +    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_CREATE, vm_id, vcpu_c=
ount,
> +                           0, 0);
> +}
> +
> +static int32_t ffa_notification_bitmap_destroy(uint16_t vm_id)
> +{
> +    return ffa_simple_call(FFA_NOTIFICATION_BITMAP_DESTROY, vm_id, 0, 0,=
 0);
> +}
> +
> +void ffa_notif_init_interrupt(void)
> +{
> +    int ret;
> +
> +    if ( notif_enabled && notif_sri_irq < NR_GIC_SGI )
> +    {
> +        /*
> +         * An error here is unlikely since the primary CPU has already
> +         * succeeded in installing the interrupt handler. If this fails =
it
> +         * may lead to a problem with notifictaions.
> +         *
> +         * The CPUs without an notification handler installed will fail =
to
> +         * trigger on the SGI indicating that there are notifications
> +         * pending, while the SPMC in the secure world will not notice t=
hat
> +         * the interrupt was lost.
> +         */
> +        ret =3D request_irq(notif_sri_irq, 0, notif_irq_handler, "FF-A n=
otif",
> +                          NULL);
> +        if ( ret )
> +            printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\=
n",
> +                   notif_sri_irq, ret);
> +    }
> +}
> +
> +void ffa_notif_init(void)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_FEATURES,
> +        .a1 =3D FFA_FEATURE_SCHEDULE_RECV_INTR,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    unsigned int irq;
> +    int ret;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 !=3D FFA_SUCCESS_32 )
> +        return;
> +
> +    irq =3D resp.a2;
> +    notif_sri_irq =3D irq;
> +    if ( irq >=3D NR_GIC_SGI )
> +        irq_set_type(irq, IRQ_TYPE_EDGE_RISING);
> +    ret =3D request_irq(irq, 0, notif_irq_handler, "FF-A notif", NULL);
> +    if ( ret )
> +    {
> +        printk(XENLOG_ERR "ffa: request_irq irq %u failed: error %d\n",
> +               irq, ret);
> +        return;
> +    }
> +
> +    notif_enabled =3D true;
> +}
> +
> +int ffa_notif_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t res;
> +
> +    if ( !notif_enabled )
> +        return 0;
> +
> +    res =3D ffa_notification_bitmap_create(ffa_get_vm_id(d), d->max_vcpu=
s);
> +    if ( res )
> +        return -ENOMEM;
> +
> +    ctx->notif.enabled =3D true;
> +
> +    return 0;
> +}
> +
> +void ffa_notif_domain_destroy(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    if ( ctx->notif.enabled )
> +    {
> +        ffa_notification_bitmap_destroy(ffa_get_vm_id(d));
> +        ctx->notif.enabled =3D false;
> +    }
> +}
> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_parti=
nfo.c
> index dc1059584828..93a03c6bc672 100644
> --- a/xen/arch/arm/tee/ffa_partinfo.c
> +++ b/xen/arch/arm/tee/ffa_partinfo.c
> @@ -306,7 +306,7 @@ static void vm_destroy_bitmap_init(struct ffa_ctx *ct=
x,
>     }
> }
>=20
> -bool ffa_partinfo_domain_init(struct domain *d)
> +int ffa_partinfo_domain_init(struct domain *d)
> {
>     unsigned int count =3D BITS_TO_LONGS(subscr_vm_destroyed_count);
>     struct ffa_ctx *ctx =3D d->arch.tee;
> @@ -315,7 +315,7 @@ bool ffa_partinfo_domain_init(struct domain *d)
>=20
>     ctx->vm_destroy_bitmap =3D xzalloc_array(unsigned long, count);
>     if ( !ctx->vm_destroy_bitmap )
> -        return false;
> +        return -ENOMEM;
>=20
>     for ( n =3D 0; n < subscr_vm_created_count; n++ )
>     {
> @@ -330,7 +330,10 @@ bool ffa_partinfo_domain_init(struct domain *d)
>     }
>     vm_destroy_bitmap_init(ctx, n);
>=20
> -    return n =3D=3D subscr_vm_created_count;
> +    if ( n !=3D subscr_vm_created_count )
> +        return -EIO;
> +
> +    return 0;
> }
>=20
> bool ffa_partinfo_domain_destroy(struct domain *d)
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 98236cbf14a3..7c6b06f686fc 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -25,6 +25,7 @@
> #define FFA_RET_DENIED                  -6
> #define FFA_RET_RETRY                   -7
> #define FFA_RET_ABORTED                 -8
> +#define FFA_RET_NO_DATA                 -9
>=20
> /* FFA_VERSION helpers */
> #define FFA_VERSION_MAJOR_SHIFT         16U
> @@ -175,6 +176,21 @@
>  */
> #define FFA_PARTITION_INFO_GET_COUNT_FLAG BIT(0, U)
>=20
> +/* Flags used in calls to FFA_NOTIFICATION_GET interface  */
> +#define FFA_NOTIF_FLAG_BITMAP_SP        BIT(0, U)
> +#define FFA_NOTIF_FLAG_BITMAP_VM        BIT(1, U)
> +#define FFA_NOTIF_FLAG_BITMAP_SPM       BIT(2, U)
> +#define FFA_NOTIF_FLAG_BITMAP_HYP       BIT(3, U)
> +
> +#define FFA_NOTIF_INFO_GET_MORE_FLAG        BIT(0, U)
> +#define FFA_NOTIF_INFO_GET_ID_LIST_SHIFT    12
> +#define FFA_NOTIF_INFO_GET_ID_COUNT_SHIFT   7
> +#define FFA_NOTIF_INFO_GET_ID_COUNT_MASK    0x1F
> +
> +/* Feature IDs used with FFA_FEATURES */
> +#define FFA_FEATURE_NOTIF_PEND_INTR     0x1U
> +#define FFA_FEATURE_SCHEDULE_RECV_INTR  0x2U
> +
> /* Function IDs */
> #define FFA_ERROR                       0x84000060U
> #define FFA_SUCCESS_32                  0x84000061U
> @@ -213,6 +229,24 @@
> #define FFA_MEM_FRAG_TX                 0x8400007BU
> #define FFA_MSG_SEND                    0x8400006EU
> #define FFA_MSG_POLL                    0x8400006AU
> +#define FFA_NOTIFICATION_BITMAP_CREATE  0x8400007DU
> +#define FFA_NOTIFICATION_BITMAP_DESTROY 0x8400007EU
> +#define FFA_NOTIFICATION_BIND           0x8400007FU
> +#define FFA_NOTIFICATION_UNBIND         0x84000080U
> +#define FFA_NOTIFICATION_SET            0x84000081U
> +#define FFA_NOTIFICATION_GET            0x84000082U
> +#define FFA_NOTIFICATION_INFO_GET_32    0x84000083U
> +#define FFA_NOTIFICATION_INFO_GET_64    0xC4000083U
> +
> +struct ffa_ctx_notif {
> +    bool enabled;
> +
> +    /*
> +     * True if domain is reported by FFA_NOTIFICATION_INFO_GET to have
> +     * pending global notifications.
> +     */
> +    bool secure_pending;
> +};
>=20
> struct ffa_ctx {
>     void *rx;
> @@ -228,6 +262,7 @@ struct ffa_ctx {
>     struct list_head shm_list;
>     /* Number of allocated shared memory object */
>     unsigned int shm_count;
> +    struct ffa_ctx_notif notif;
>     /*
>      * tx_lock is used to serialize access to tx
>      * rx_lock is used to serialize access to rx
> @@ -257,7 +292,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)=
;
> int ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags);
>=20
> bool ffa_partinfo_init(void);
> -bool ffa_partinfo_domain_init(struct domain *d);
> +int ffa_partinfo_domain_init(struct domain *d);
> bool ffa_partinfo_domain_destroy(struct domain *d);
> int32_t ffa_handle_partition_info_get(uint32_t w1, uint32_t w2, uint32_t =
w3,
>                                       uint32_t w4, uint32_t w5, uint32_t =
*count,
> @@ -271,12 +306,31 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register=
_t tx_addr,
> uint32_t ffa_handle_rxtx_unmap(void);
> int32_t ffa_handle_rx_release(void);
>=20
> +void ffa_notif_init(void);
> +void ffa_notif_init_interrupt(void);
> +int ffa_notif_domain_init(struct domain *d);
> +void ffa_notif_domain_destroy(struct domain *d);
> +
> +int ffa_handle_notification_bind(struct cpu_user_regs *regs);
> +int ffa_handle_notification_unbind(struct cpu_user_regs *regs);
> +void ffa_handle_notification_info_get(struct cpu_user_regs *regs);
> +void ffa_handle_notification_get(struct cpu_user_regs *regs);
> +int ffa_handle_notification_set(struct cpu_user_regs *regs);
> +
> static inline uint16_t ffa_get_vm_id(const struct domain *d)
> {
>     /* +1 since 0 is reserved for the hypervisor in FF-A */
>     return d->domain_id + 1;
> }
>=20
> +static inline struct domain *ffa_rcu_lock_domain_by_vm_id(uint16_t vm_id=
)
> +{
> +    ASSERT(vm_id);
> +
> +    /* -1 to match ffa_get_vm_id() */
> +    return rcu_lock_domain_by_id(vm_id - 1);
> +}
> +
> static inline void ffa_set_regs(struct cpu_user_regs *regs, register_t v0=
,
>                                 register_t v1, register_t v2, register_t =
v3,
>                                 register_t v4, register_t v5, register_t =
v6,
> diff --git a/xen/arch/arm/tee/tee.c b/xen/arch/arm/tee/tee.c
> index cb65f187f51f..1e890ecc2932 100644
> --- a/xen/arch/arm/tee/tee.c
> +++ b/xen/arch/arm/tee/tee.c
> @@ -94,7 +94,7 @@ static int __init tee_init(void)
>     return 0;
> }
>=20
> -__initcall(tee_init);
> +presmp_initcall(tee_init);
>=20
> void __init init_tee_interrupt(void)
> {
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index 289af81bd69d..e2412a17474e 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -505,6 +505,7 @@ typedef uint64_t xen_callback_t;
> #define GUEST_MAX_VCPUS 128
>=20
> /* Interrupts */
> +
> #define GUEST_TIMER_VIRT_PPI    27
> #define GUEST_TIMER_PHYS_S_PPI  29
> #define GUEST_TIMER_PHYS_NS_PPI 30
> @@ -515,6 +516,19 @@ typedef uint64_t xen_callback_t;
> #define GUEST_VIRTIO_MMIO_SPI_FIRST   33
> #define GUEST_VIRTIO_MMIO_SPI_LAST    43
>=20
> +/*
> + * SGI is the preferred delivery mechanism of FF-A pending notifications=
 or
> + * schedule recveive interrupt. SGIs 8-15 are normally not used by a gue=
st
> + * as they in a non-virtualized system typically are assigned to the sec=
ure
> + * world. Here we're free to use SGI 8-15 since they are virtual and hav=
e
> + * nothing to do with the secure world.
> + *
> + * For partitioning of SGIs see also Arm Base System Architecture v1.0C,
> + * https://developer.arm.com/documentation/den0094/
> + */
> +#define GUEST_FFA_NOTIF_PEND_INTR_ID      8
> +#define GUEST_FFA_SCHEDULE_RECV_INTR_ID   9
> +
> /* PSCI functions */
> #define PSCI_cpu_suspend 0
> #define PSCI_cpu_off     1
> --=20
> 2.34.1
>=20

Cheers
Bertrand



