Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE79444A0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2024 08:43:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.769340.1180208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZPWO-0005Bx-Tj; Thu, 01 Aug 2024 06:42:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 769340.1180208; Thu, 01 Aug 2024 06:42:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZPWO-0005AH-Qw; Thu, 01 Aug 2024 06:42:44 +0000
Received: by outflank-mailman (input) for mailman id 769340;
 Thu, 01 Aug 2024 06:42:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sZPWN-0005AB-G3
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2024 06:42:43 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2608::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 403cc7bb-4fd1-11ef-bc02-fd08da9f4363;
 Thu, 01 Aug 2024 08:42:42 +0200 (CEST)
Received: from DB8PR03CA0009.eurprd03.prod.outlook.com (2603:10a6:10:be::22)
 by GV1PR08MB10837.eurprd08.prod.outlook.com (2603:10a6:150:163::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 06:42:37 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:be:cafe::c) by DB8PR03CA0009.outlook.office365.com
 (2603:10a6:10:be::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.35 via Frontend
 Transport; Thu, 1 Aug 2024 06:42:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7828.19
 via Frontend Transport; Thu, 1 Aug 2024 06:42:37 +0000
Received: ("Tessian outbound 4bc87b8a8d84:v365");
 Thu, 01 Aug 2024 06:42:36 +0000
Received: from Lb8b97da2985c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 511D26D6-078B-4A01-BFA2-6F50428150A4.1; 
 Thu, 01 Aug 2024 06:42:31 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb8b97da2985c.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Aug 2024 06:42:31 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com (2603:10a6:20b:36a::15)
 by AS8PR08MB9838.eurprd08.prod.outlook.com (2603:10a6:20b:615::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 06:42:29 +0000
Received: from AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5]) by AM8PR08MB6578.eurprd08.prod.outlook.com
 ([fe80::bb1a:3ac6:3110:e2d5%5]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 06:42:29 +0000
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
X-Inumbo-ID: 403cc7bb-4fd1-11ef-bc02-fd08da9f4363
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TVwYjaxZma7qwIK0Uu21uE460uop13NKeRbAOEtSFeeOf20Nov19Qvmh4Pxet02+xrWb78ldzGUjplChU7GCsDyng2dh9Q/qgijdSWxW3sX4UONKr5rU7XZ7mMCg/WTzV4SM51dhUdbrWfTREFpSaDeckz4rGDxLCdWeuXhDST44JC3KAEMpOuIogQ8MmT6Epp1chDVQdCIZX5FjGtTIXK/jtXJgXic+xs6hazogXt1w1Tm0YpSR5AQbekDIvKSx5S2XnQvCBassHJEh/Er4iXbTcQe+2F+NCiQEpJx4BCcckDB6ymFNvC3gWnj3ChS9e+YlZTAJaG8v6qklTr+WNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQoN8Ud7rJqiPdNkMiI1l2tpuMfqJQQm+TnR3AAqSgE=;
 b=hMujSMkP/PifH/FY6WBM7/HmBDyP8BCIMNfrm+4I/lYJgor8h+xYU5J7t2/jjsIHJtMZfJkhJO7GQZW5tSQuXdGKOEo+dWYITOoaqk+Hqy5U2zzhtKLSQ1M6aOHJWZXezMH+q2NQBHvagplslvzIs2+hAxZzldagE11Khhd60BCLZ6Rp2av0fB/m/5tXx9312NrgWoSeZYkaWc6NEsZVuIVp9MqiEZ5bblhshyHasX8lLnhN7QyYSjjYWcwK35+cNzwKEvgHNHDri/kcF4Gz7ORT8NBvzJYUT6hd85mwCTtRA0Oy7La9QJ35wS4q7RjLPmle8UjGJxdBgu/OgdXvrg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQoN8Ud7rJqiPdNkMiI1l2tpuMfqJQQm+TnR3AAqSgE=;
 b=YVFm9NqSjpFc5lRj4LGaj5myREL6TDhEhc0t1u2t5vr7qVdqlJv0Gj2aohVWlwjGi8NgdME7/1mCeBZLlL0SSmHKe9J8BgFrinBSoWTGIMn6J0jM7W+23AP0WYfX7Z7lXTZFkInMSe0y21uahHusj2AYpTed/f/lLiVN3auY/18=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cff413debb1eee5a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJm742jzN0393MwFPA//2yqBuhPRj+t3iqQlb00foGVGJ/sX20XSDtWIaNRA+S1h44LZHmyA0HYY1g5g38RMx9lWOfraqTng8y4lwKyHGGu4LTo3me1a4ov8nzdFsDmoAwG+mPIMG1h6VcgI6OOCNk2xmXRTWUgS119y7IHi2Fs8EsS0s4VmFWYQa8M3VSNbSgS0rlA5lypTQK/KZWpqrup11uM/aoMoaJ5HIPXN8ILCy414RHBm9HC3TLsOJo13htAEfN3Ou7IHxO2VYIhTKpetGa7auxnW8fW/7ryC/Z4KIgBTYlAF2lyLv6irZYX5GWT1PEQ7m9WrRDMZQauYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQoN8Ud7rJqiPdNkMiI1l2tpuMfqJQQm+TnR3AAqSgE=;
 b=Y09+GMLu6f1EUzUSKuNEn+JJK19W+u0FDNID2t+60DEV7aQXuVlnjipd8cnBwRgc9ggEdbSOekzo9S/UlR/K0ku9qqb8Yt65V1D9+UwXCqawSZGmcU4hF/oK/HD+OXq1CCzkSDIgLuK4BtYxb7BAXBc2qqSb7t9jcCNn+PbpN5F4z5IwndqrS45J8sF48p3puEfdm1+d5yFQd/1ORbtbuAd/oTmBWvr4brj8/n6mJCB1T16LNMkqRAnaT5xW6XpB8OmVm3omqy+tRz1LCn2SQ2c9wmxTERymtKJY7mKSZBRWmpcWbCsCtHHS7nxCzH5fmQC6kvq0uC+QrzvkyhE1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sQoN8Ud7rJqiPdNkMiI1l2tpuMfqJQQm+TnR3AAqSgE=;
 b=YVFm9NqSjpFc5lRj4LGaj5myREL6TDhEhc0t1u2t5vr7qVdqlJv0Gj2aohVWlwjGi8NgdME7/1mCeBZLlL0SSmHKe9J8BgFrinBSoWTGIMn6J0jM7W+23AP0WYfX7Z7lXTZFkInMSe0y21uahHusj2AYpTed/f/lLiVN3auY/18=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] docs/misra: add R13.2 and R18.2 to rules.rst
Thread-Topic: [PATCH] docs/misra: add R13.2 and R18.2 to rules.rst
Thread-Index: AQHa4th7a04MjZhS7kqv2Ue56V1pDLIQXpSAgAEkjwCAAHMTAA==
Date: Thu, 1 Aug 2024 06:42:28 +0000
Message-ID: <83ABB601-629D-4D95-B124-E50896EB12B0@arm.com>
References:
 <alpine.DEB.2.22.394.2407301626460.4857@ubuntu-linux-20-04-desktop>
 <6575beb5-645a-470a-89a1-8485adeace60@suse.com>
 <alpine.DEB.2.22.394.2407311647170.4857@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2407311647170.4857@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM8PR08MB6578:EE_|AS8PR08MB9838:EE_|DU2PEPF00028CFD:EE_|GV1PR08MB10837:EE_
X-MS-Office365-Filtering-Correlation-Id: 941860b2-631a-4975-8ba1-08dcb1f521c3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?RnnQMn9xVkjHeN8U2+NMmuG7uVRnCR3rUt98OStzLoTFLcbejTFi10/UOk?=
 =?iso-8859-1?Q?BwVb/Pb2XChDNw5ynuYB6ll3SHkqsg/HD0tkuUCk5lYZuSJmcBbvM8BHax?=
 =?iso-8859-1?Q?sN5X30Ovq/I34HkLs6rKyR2SRgqa2V39DoOzR+aIFkPBFj1L1NEEnxvmXx?=
 =?iso-8859-1?Q?FbRshhc3QjGl3xEjEmYv3QgaJLHpIpED6mlupCpp93kvV3IFeGdnJ71Hgk?=
 =?iso-8859-1?Q?XPf7Q8F2IDLhQyKDAbNrZt7Wovp1Vl4Qvvron/x3sihdB3oEtF1BTKMdL3?=
 =?iso-8859-1?Q?gIw6ox+ccHYe7yKUEAM1ZV3T/lIBYb7w1OL0moiPhma/ofPVSmb7qMAlJL?=
 =?iso-8859-1?Q?Xo21Zsq50D87rjcOexp2r7f0vCUPhMH66dWDcu2+vEOh88UFEGYu15LuL6?=
 =?iso-8859-1?Q?6G8wB8vh95/4x8yKipmld48EIjLE2vvDcjQzy1CqsIRFqPpE3DVpTepSpn?=
 =?iso-8859-1?Q?da8HNCj6y3x9F+0uFNwSPayPeGfdJcArBDrX5mTCAF3NjUfnk7pzf5UDgl?=
 =?iso-8859-1?Q?5czIboMVXdQg624PirtgpupE8qIl1xrVKq+BuGVJTe7IXVKUfIKpRPsx7w?=
 =?iso-8859-1?Q?srd+mBHaPsvOT2/7AHABzU46cgvru8eEm3RL6RHsLTTsmc+EnEROwqj7Ky?=
 =?iso-8859-1?Q?19n2IyQfPy41oM6qNajQNbRl43EiAOGHTW3x3yjzHOI6DrYX2h31K2Vb98?=
 =?iso-8859-1?Q?KGFzowBAGu/8h4LE4of7P0mZuC6TRtJ6PazUyqr3ADxZczUzlzCvQUOOtX?=
 =?iso-8859-1?Q?4aqgF+HerEvqhQGGV/cGZ+rVOW3PuWgb/i/kqFjVgY8ZlGZxL5hGOHaw26?=
 =?iso-8859-1?Q?Rgx3mtWzFCV3bGbMszVxK+GPxHQh7Yj6uZGRJbmr3hh29vInX06fy2U652?=
 =?iso-8859-1?Q?DFA6p9o3hfCm3v77Wy72rlhCYqW3tOd2+N7Db4+pqiZjjPWqt7fkF/CTUG?=
 =?iso-8859-1?Q?uo+hjyPUqfScA1AXSsvSKLmotcaCG7/WnoNE7pwdGdjhBiZDO/GjyDqN4K?=
 =?iso-8859-1?Q?wqZyxzkHee8zBR5yivMIqz+q0LkhyIBWnIC26LPk7TJDpfyuxm45FXFGJb?=
 =?iso-8859-1?Q?4+5WX4Oiq2Ewh2k5s/bffRyjV8DptWjPdi/ZdfZsVUgBZycKjzdKHc88mK?=
 =?iso-8859-1?Q?FK3W+0S/NGcF6tH/hmFIXftTTYNokgTAUdy7zOxvRFw30orujvR8dQzgSY?=
 =?iso-8859-1?Q?j0IGCucycMyD1QKet0ZcXH+pav+7KYR5TjwCXlmLLjMCOzoOMF4O6rhRmO?=
 =?iso-8859-1?Q?kvAxxzimaOEvz+RG9FkRgW5NxPIuSuC8Ex8mdbIXA6Sl25PCldgASqsqgS?=
 =?iso-8859-1?Q?EVpdXn7YuNwPhBRVt1H8oXRZ7w/99H/EOo177gv1sDrKc2n6VTlJKQPzn7?=
 =?iso-8859-1?Q?QzA7v14sGlu3as9lgEpkWLY72qdRhngNVGEF23aftwFQOQa9Qq0TE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR08MB6578.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <C4AECF08B4B715428647E5B85E7E51A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9838
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:20b:36a::15];domain=AM8PR08MB6578.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3c8d2339-ec19-4cf8-7412-08dcb1f51ced
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?2CjTufVNqXnnsp2m9pnZpW4du39U2V5IIOTr0to7+0zcn+TwRLGvKdW8EU?=
 =?iso-8859-1?Q?C1tIeN4XU+mUOv7CtTvQ1dbAop+lwjgE2DypFCAPBJwqlVdZnM2+Debtt1?=
 =?iso-8859-1?Q?6MbICKYOkIiTRUbJW7Ul2PDS9TJu18pq+a55JW1K/wyy8sdBP5naqOk4Jy?=
 =?iso-8859-1?Q?/EHqFWEgrhji+ljy5H5GbTNuQf4FFTbcvsagVQZvu9g0k//Ka6sxTJ0G10?=
 =?iso-8859-1?Q?FGGnY0eHtPozHFnbvPxdtJMIoV9u2sHIAHbk6GYVz9gD77FpypG5bJVzcX?=
 =?iso-8859-1?Q?0rFO/NZPxBNTR6mg2Es5RHek5B/vy69qH8kQRZ2lv+mWuwVWRQDO8DW9GY?=
 =?iso-8859-1?Q?tWao1aIADl6mjRDTIariTDer/mRb/ngu9as5D/W8VQ+f/sJF5dw83zsRVN?=
 =?iso-8859-1?Q?Zp6BTpdSut9xWkTYMEKMNjk+KPv95yeSZ03KAHlVRRiRFyYs2J+giNLGy5?=
 =?iso-8859-1?Q?pSkwNpBPT6fahBFvLen+RcyOJdJF1A66gJoVLPHRQS2SR+52gt9keWLr3q?=
 =?iso-8859-1?Q?TMHgFuFUYhIOWMg2W9hbwXwtB7yczSk956gUGCVzM/hULOgHUU2dgBwltW?=
 =?iso-8859-1?Q?6fQfs/mviIhOwr0mKa8P65aKaishfNHIupwS3iRLDLhRoIBHwy3awSADGQ?=
 =?iso-8859-1?Q?wSQyMoxqvnPRxeYJ1HNozt6/z7xBd5DhkP78gy7aL2dtJArWcqt0zroodN?=
 =?iso-8859-1?Q?H/c9RncBz8KBq3CQz/7VSo+m34KmRUq+9I8+6dGPYlRVDDbaerda0t39kH?=
 =?iso-8859-1?Q?iY3f+3apZZtvIzoHCL7y/eMZnWZMaAKqYQHfDQKos7Afj/XZXgcTclGG0l?=
 =?iso-8859-1?Q?qUlfX7YUIHX/x/IIbbxuWCOh/kE17+vHe51d0QHT948RnCAqKVR+i12OH+?=
 =?iso-8859-1?Q?HFUuyZzkKCWYkPrgarF9g21GrXeTdmL26iLNpuU4WVzLnw32TctUV6IMoL?=
 =?iso-8859-1?Q?1DjdXalwOvXsy+r7ckYGpKjLK6+sH/sttd9b9RFmyo22BYvILueaGBrQhi?=
 =?iso-8859-1?Q?U4gSA72IJQ+TNPYiMUzqjfo5Ty1kntAdA6+zMqlcTownv9pDj9E98vgyQI?=
 =?iso-8859-1?Q?DhjSjCzBKLpHdyLvKBuFSKD2BxzzrKj3TthGiDbc+cBsvPiGlA9n8ahExH?=
 =?iso-8859-1?Q?x12fpAHzDseVmKTusN2eK3JXE4+QUZy8T7GhfvGthVXLjd4OgXO3ylx1zI?=
 =?iso-8859-1?Q?4dQKZ0+VrT/PKV1ta2EnwFCVsNuCDGt4zYaJO3cxYXrwJxJS8CcM3fCVEQ?=
 =?iso-8859-1?Q?nii1y7pqnaOl8mkBAwSVVWLd14Igvd63FT6ufKDGhSQ3LTIS82OIJM8pfb?=
 =?iso-8859-1?Q?LCu0CppJ5KAaoif2PpaoLfSl3Pz2Y5jO7F79+09Bekwh6ylk9IIudB1qXl?=
 =?iso-8859-1?Q?3PokoanBR4eG3LTFAtqd6cLnxxYJeWQztzDA0s785WW29n12ASc9T99LMF?=
 =?iso-8859-1?Q?oeiyd8pGnSgzaeivzyDyKk+IWrrulA9T4nUGtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 06:42:37.1178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 941860b2-631a-4975-8ba1-08dcb1f521c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10837

Hi Stefano,

> On 1 Aug 2024, at 01:50, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Wed, 31 Jul 2024, Jan Beulich wrote:
>> On 31.07.2024 01:30, Stefano Stabellini wrote:
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -462,6 +462,15 @@ maintainers if you want to suggest a change.
>>>      - Initializer lists shall not contain persistent side effects
>>>      -
>>>=20
>>> +   * - `Rule 13.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Examp=
le-Suite/-/blob/master/R_13_02.c>`_
>>> +     - Required
>>> +     - The value of an expression and its persistent side-effects shal=
l
>>> +       be the same under all permitted evaluation orders
>>> +     - Be aware that the static analysis tool Eclair might report
>>> +       several findings for Rule 13.2 of type "caution". These are
>>> +       instances where Eclair is unable to verify that the code is val=
id
>>> +       in regard to Rule 13.2. Caution reports are not violations.
>>=20
>> Which doesn't make clear what our take is towards new code people may
>> submit.
>=20
> Good point, see my comment below
>=20
>=20
>>> @@ -583,6 +592,15 @@ maintainers if you want to suggest a change.
>>>        submitting new patches please try to decrease the number of
>>>        violations when possible.
>>>=20
>>> +   * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Examp=
le-Suite/-/blob/master/R_18_02.c>`_
>>> +     - Required
>>> +     - Subtraction between pointers shall only be applied to pointers
>>> +       that address elements of the same array
>>> +     - Be aware that the static analysis tool Eclair might report
>>> +       several findings for Rule 18.2 of type "caution". These are
>>> +       instances where Eclair is unable to verify that the code is val=
id
>>> +       in regard to Rule 18.2. Caution reports are not violations.
>>=20
>> And while the same wording is used here, I think it is pretty clear for
>> this that we'd reject changes where bad subtractions are used. IOW even
>> more so important to clarify the (possibly different) positions on what
>> is going to be added into the code base.
>=20
> In both of these cases, we would reject code that doesn't follow R13.2
> and R18.2. I'll change it to the following:
>=20
>=20
> Be aware that the static analysis tool Eclair might report several
> findings for Rule 18.2 of type "caution". These are instances where
> Eclair is unable to verify that the code is valid in regard to Rule
> 18.2. Caution reports are not violations. Regardless, new code is
> expected to follow this rule.

I think that in both cases it is wrong to state that "cautions reported are
not violations" where those are cases where the tool is not sure so they
might be or not violations.
So I would change the sentence to "cautions might not be violations. The
rule should be followed in any case in new code submitted".

Cheers
Bertrand



