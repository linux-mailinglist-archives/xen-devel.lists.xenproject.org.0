Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93079A34A39
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 17:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887874.1297316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ticFx-0003FZ-1X; Thu, 13 Feb 2025 16:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887874.1297316; Thu, 13 Feb 2025 16:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ticFw-0003B0-Tl; Thu, 13 Feb 2025 16:40:04 +0000
Received: by outflank-mailman (input) for mailman id 887874;
 Thu, 13 Feb 2025 16:40:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qxZs=VE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ticFv-0002qv-BX
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 16:40:03 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ae5f61b-ea29-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 17:40:00 +0100 (CET)
Received: from DB7PR05CA0067.eurprd05.prod.outlook.com (2603:10a6:10:2e::44)
 by PAXPR08MB7317.eurprd08.prod.outlook.com (2603:10a6:102:230::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 13 Feb
 2025 16:39:56 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:2e:cafe::64) by DB7PR05CA0067.outlook.office365.com
 (2603:10a6:10:2e::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.31 via Frontend Transport; Thu,
 13 Feb 2025 16:39:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Thu, 13 Feb 2025 16:39:56 +0000
Received: ("Tessian outbound c79bb2535b53:v567");
 Thu, 13 Feb 2025 16:39:56 +0000
Received: from Lead7e398b745.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C0ED56B6-83F1-4BDA-BA95-755873B87E6B.1; 
 Thu, 13 Feb 2025 16:39:49 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lead7e398b745.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Feb 2025 16:39:49 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB9888.eurprd08.prod.outlook.com (2603:10a6:20b:5ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 16:39:46 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.011; Thu, 13 Feb 2025
 16:39:46 +0000
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
X-Inumbo-ID: 2ae5f61b-ea29-11ef-88c1-8ba37f82fa57
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aevzpFXAtz+d0tB9xkzX+9ZZrauLbDOQNXgC0SiLr+9CECJkZMdf60JA/RoRgXTy88dL/ShrUN/bKnP7F5pwHCZ0V37LmTy8fngffkOq8fIKBw+2JlltYu3pd0fG5+7HRhNwz56AF9xlpwxGv/H0GmMaLw159dEWS5r3CPdXcfTXUFCZJF2F7O8PzxLCQQS+aONNGqXP7uNo/MGcChhbZfyXvVrlNGhThG5fMVSwfG8c3My0mp06IVPpVHFssOp3TfW908GRf7KIgBinAW4n700wS46bnatbTSCaljTGfMGipI2dmAnlHyP/RbcdMD5A+TSR9tSkRuBrRvmxAjBfsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfWC9ZqZ4UHeqf7I0AYSJGl3vW3EU9uR590RXaMdVTo=;
 b=b5lqRViq5EL1+WzSvBm1wuFSqei8hx9aLDxYqU4z6PLoGFp+16k8IFDiv1RxWaOHhxWnwLUnYB/iXPlfmlYnWK/8g2lhxXM1HcKpkdwxZ4dgKq7irK+MfefzVHqWOtRB9eQOzhUOtEDDuUPmc/3eWjUjKX4ihHyrLYJTFo3HGiv4H5+ywXaKEKPYSNzOVtpGZCbpRIfc6C8SmsMQ1clhq/Ezo8wB6g2pTxrWu9sdYz6/fXPPEnVZNdE9RxRlmcHRCirHjb7LQmLiU2ZsIfgCxsgBbnDJ2gppA0VMHTr8ZQm7cMdyPUeDvdjTTjk8MX/t9hM++tkOKb/CKrjPj8V3BA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfWC9ZqZ4UHeqf7I0AYSJGl3vW3EU9uR590RXaMdVTo=;
 b=V788fiCUsCt8/KGIpSGVxaK4mZd3pzf+GsW+1Z+FaYjXZ/4LBH/KEPJnS+b7ciUJU8kjqPdqT4XgxLdE6YD7aj95e4qLsprR1QNGnX6VmDlAjz/CKOYfF6W6hSJGtAEMndovUOkD4qded3BXhDkR46YVKf7VF6mmyz6z1LGpDcg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8d49d665fb11f37f
X-TessianGatewayMetadata: RG1WubHwensXuE3iaDORO+HN0NocoWbnUbEVNLyl3Wl+o8ttdzMf8hZV2V87bFUIEk/i1p6L8k7FIYii7jxOsdGWXe/3MacPgzhx8bwQscUa8Nz+oNa80Kpxttsmy+/r1+2d+IXdlupGhDi++i5VxSNtXjmh4+jjn3eLtvxk/1Y=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uHOYDIFxbDRX8rkOd8yuhXXA3KgX0zDMUzT6OUwaXLkDNJn26QqnDRC12Gx/umdyX5BOKZyaX8AIh575NecUX0wrMhpPTqGSaVRk9Et2CMOyNRRD/7RRr1Wf1hxo5cm9i4hdObTQjtW0kToomdhEaZoZ0iYFDYBTWTeWULWsPbWWqSZJJxRZrDMkix5GMB63ZFc1yA1ZqknWd5nxZBofaXxISzZtwoes6ZC4pW8YcqfHDYUs2lzqyqlOaveYU0hzDiRP6yhfDSh5Bcv4mLPb+45xxUZiPbRyTp6b9Qzxzah9Q7z3+c125vNJLMrMyAPGdmdJfun+D5MVdSChyYtZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfWC9ZqZ4UHeqf7I0AYSJGl3vW3EU9uR590RXaMdVTo=;
 b=WdSQjwK4IR65EQT1BZksCNyvEqTGxdAoU95aNL4eAYD7tk3ztn/HaSycCtyLP/9S+QVLnC3ulF+C8foXi5Cr32HIDIxdzh1RtT3SPZa9O8pu3QsCxTwXPhVw4S90SlHl2SuZ3UF1RdFoCtjU+LWzfL6vpzYChJkA2nudnTO5OrzCZHgmMFy31wvr7e6NXC6GxhTMquMZPXOaCjhll+bRqGdZW+ydJk7OuuCUtM9k06U+w2uhXsxaqxLqCe2Mu4AaoUp4q15hZsmFdA3unnqo/zCt9e4nMAPt+lZGgGWhd7t98ZgyckXyOG4YpJadnPQVy/pgq1hd6WmBEx9CcAvvUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfWC9ZqZ4UHeqf7I0AYSJGl3vW3EU9uR590RXaMdVTo=;
 b=V788fiCUsCt8/KGIpSGVxaK4mZd3pzf+GsW+1Z+FaYjXZ/4LBH/KEPJnS+b7ciUJU8kjqPdqT4XgxLdE6YD7aj95e4qLsprR1QNGnX6VmDlAjz/CKOYfF6W6hSJGtAEMndovUOkD4qded3BXhDkR46YVKf7VF6mmyz6z1LGpDcg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel
	<michal.orzel@amd.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
Thread-Topic: [PATCH] radix-tree: don't left-shift negative values
Thread-Index: AQHbfiyFimU3wrEce0aiTSaEa4+3C7NFX46AgAAPvQA=
Date: Thu, 13 Feb 2025 16:39:46 +0000
Message-ID: <A7FE0F28-A75E-4CE1-B649-1D92BE334852@arm.com>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
 <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com>
 <2118904d-3a33-47f3-af68-7303bc17186c@suse.com>
 <e34113912d9886a876fd5f3bd094abb2@bugseng.com>
 <8ca92f7360385a5b4033cf22ef843775@bugseng.com>
In-Reply-To: <8ca92f7360385a5b4033cf22ef843775@bugseng.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB9888:EE_|DB1PEPF000509E4:EE_|PAXPR08MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec8e54d-9735-47b8-1d77-08dd4c4d0cad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?d/QYRna1bXv+wW+0wZeJPza81hmUdvtMFuxq2coRVAy/lQnFXI1hVLZ5qJ?=
 =?iso-8859-1?Q?5UVTFuNatZOs+DdVQeo47UTnmqNstpdilg2ayhD1CWJE+77w/eXDDepwZF?=
 =?iso-8859-1?Q?ekohv8wyp6k4kfuH5fYUZ72JSCpyOU4c464S/GKZJSHK67fxVzJxatku9U?=
 =?iso-8859-1?Q?2u/rzcRoxSuAvoy94CpFPdbR9Jwg/R/k7j0t+9Cwo4U1NcnCKB9OpMNVKU?=
 =?iso-8859-1?Q?KwwsJ1ypJKt1iTbOkUoAtsw6f8+oxEsjqlIrgyT+Un4/SlvyGCm+pT5kGD?=
 =?iso-8859-1?Q?SxIj+KZYbld6526yj9uX6pku3jkSE8cvJ+a+hU+VTEIbyUuw6x04qCT5Y7?=
 =?iso-8859-1?Q?6RotfyU2mS9QQ9FvZTDyfR0SCvxVhiKJoB5iqCghJKz/2uq/BUznjEm3xm?=
 =?iso-8859-1?Q?56X2+lutDQjnXitsfNX8ewwjVNpM4P+APi2jEnqr8H7RxXdGo7n3VOQe14?=
 =?iso-8859-1?Q?ZG8FG23kY3uDnSxmGfY/BPVxmlIf8la9kf44K1STicnpavahAIHaWpjAN0?=
 =?iso-8859-1?Q?scTzWhMenDgpEflbw9jC9vgIVyXy8M1vJYhAg4UexSIMII+nbyCwiosFJC?=
 =?iso-8859-1?Q?lA1UnDP0OADjBh9AFMz5Qs4rvZSIPu9qTmo5zSEBg7lDjxPyMA9jvwWY2l?=
 =?iso-8859-1?Q?Viqr1DA1cQBxsNQQ3blTWZ04skiEjNbjdzo1d1IuDJwlEYwvOYprKSUSIY?=
 =?iso-8859-1?Q?0WxF7q4w7q6BFiMGHkgiXfnjSRYCWoN0pwtkgPkU1Kdjv+yZt6p5h055zV?=
 =?iso-8859-1?Q?dKT3WzFT6kHyOmR6Rgh37xULn7VWMK1fksI15njKg2lMzRSaS/6f0RTZI9?=
 =?iso-8859-1?Q?bjIt8aa7eZ3SpRlkAd1/0nbs9j2+PY0k5AWbMeAwAX2bTILlj+c2RF1Sw/?=
 =?iso-8859-1?Q?1ciKWol+MuADKiZ7sygRxsbVksmP47fRkfZiuQaOTtZ0sdquI389KTD8Zj?=
 =?iso-8859-1?Q?2LwV9TmTQMU1842maRH+2gdllzudz5Lg+n7BCx2zxc2A69u0abOZ4AdmXV?=
 =?iso-8859-1?Q?8PxIz389BEt6BhnsQrLfWGP/JqDoGuMLijQEszwSrlbsodJvEw3WVEQler?=
 =?iso-8859-1?Q?uEkkVWB98XTqHUJAFSEMKQ+JGxzLpaZooIdCBloz+kciLA/0NetINKfKLT?=
 =?iso-8859-1?Q?qGuqNxg/j6K8y2mjyf/v2f6eUkTNcbFqO7C7ea+0O7INRa7hf6e3kCSs58?=
 =?iso-8859-1?Q?2cnFdaMqJx5ueuvM1D4HL91xvUXctJfLvVU0R7Va+jqQdhVk3+7LN3wDWl?=
 =?iso-8859-1?Q?XZTo/rAIiokCGsufOOY+363zULOh4zGfViUeNT+8EJs0qsfcgTLSQbi9FN?=
 =?iso-8859-1?Q?Dk6kZtVwCkGKBsIT52PFOhWqr7CoRY+qz1mrGDYSfiAutK+5zOKofGn4OM?=
 =?iso-8859-1?Q?l5lyMhmMt+sbuMteVjTHa5FgeXhovv2F6U14jfqxCQsaeRi9Qhn1oZbirf?=
 =?iso-8859-1?Q?tv8vhyQ0LYMeigiHyuRnnKj18l5OPeSVRks13jHwj5frx//ycWxaW0ooc4?=
 =?iso-8859-1?Q?oU5tDrhB106v9XxHKzS+qi?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <94D74A3FF426AB43B5CED0E572F079D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9888
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9d82c20-e9ee-43cc-2fd6-08dd4c4d06c6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35042699022|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?gkWHc7f3v7C9bAYIDxyMauTdJVw5MSCBf5dpd2M+FhBajb92MZioeJ/KTP?=
 =?iso-8859-1?Q?jAr8wpGMzyOlFFQz7O+9uQnFJ/RqAJzJbwxe5VPO0djtua1PpZDugLrJAm?=
 =?iso-8859-1?Q?+O7s4H35E3lCOsHxrzdbJDzo2eyU+SOBL4p2kZrpuBSWCZeRYiQGjXFWaW?=
 =?iso-8859-1?Q?DKIP3QnkHR/J2ZNPQBK6bDpvHGoz5X/o3f/5DmmN6AUrbF0UNzBaypUD0r?=
 =?iso-8859-1?Q?PLBMuqL/g+belK1k2LLzlF7iX6INOD3QeoyfHf2SDq70RbjwT7PxZU+tnK?=
 =?iso-8859-1?Q?eCCyP6aXASICMmi4aRffSPKihIuVku7eyLMS7Y8SH+K9BCqaJhlrE5VVse?=
 =?iso-8859-1?Q?02D1IwVhwYYZJSXuzzCJPNaKzyWjWhxR4VG4yzMKBoANLdKqVHsTF/wl3e?=
 =?iso-8859-1?Q?yOJrFgj+OPyOvPqtxqyrRwko24JNyDR/lLKeC6PoRAqNZsOWCly/NvbjxO?=
 =?iso-8859-1?Q?zmWyIrGTH+UGiVTdSQzOofhBdQ99Xgi1Pp+AKkaQ9RP/XBwV0qE1IxYMl+?=
 =?iso-8859-1?Q?43ip5MURrRp9kY2NkTm5HKWKJmfjqMXoIArlWSL/fkurnYPi9uRW5TADGn?=
 =?iso-8859-1?Q?NHwo/Sqx+lkWVSloAIVSGE5ee/ohKceRXupe7u4PVUaEB2Iqb2Av7gNKOf?=
 =?iso-8859-1?Q?kyyrKVvoB3vy2CP7XF4oFNtqmLDbaz9OOmh12PoWRyy4VR7gRCC4DCQYc+?=
 =?iso-8859-1?Q?GKtDrrk9YCVFiS7lFjDqBgXhh4AKTAptehlgBaQo8Jw+YEqa/V8PBK57KT?=
 =?iso-8859-1?Q?VP+AOdlGK1HIcZ7UBfZkRNUFo4UOe8Rl2GwcZJeGvJsSXQj8N5YFlKbk0I?=
 =?iso-8859-1?Q?Za2oA1yEKz/7ZbRnYGbfSOOZCf9J0qF9L2mGpaq41c+iPRmvbvxZUnhwzM?=
 =?iso-8859-1?Q?bOZCboYaai+TTqHfxVrdLG+qwp8IBPydMUTeICCrVsI0xGGkVEUALqyS7D?=
 =?iso-8859-1?Q?r1W3itla15hjOZct6vq9uHJg+Og8ezFArcCwnhcCOBq3rXvC4/4+byekm8?=
 =?iso-8859-1?Q?m4WBc02k2KjYxEuZDCOYsYgzxoAOjgV/txkeNceVCJ/ExPFaK0Im+HkcKj?=
 =?iso-8859-1?Q?5pptdHtBk6ePiYHTfb3bnp27Zs+hKVx2/LclejrXiVRTUAYNFy9yb8HEFF?=
 =?iso-8859-1?Q?UcXCDmnyD6X61qfk7HKHAANCl/VeNH3+0p4fxYonaXvG09HhUIgiouSqrl?=
 =?iso-8859-1?Q?TP6iynwDCVoU/GHNCTxBGOfB6Rmdq2rATGxz3aErjVIqqvqwzN/ePkYmwo?=
 =?iso-8859-1?Q?SUl4FBehidoqpLCQaxDfFc0NezBAUuSV9T7i307r4tfXa4KEjYzDKo5vFh?=
 =?iso-8859-1?Q?ypDyrWba3HawjqnzDQ0NMvm9G9dGlb7lTK98Ji/fEWI31QRTxcIFdAN2Cy?=
 =?iso-8859-1?Q?EqIKuYe1viWm3IXTWcl84Xd7/1vGfrAhBY80w1RX0TzFYTSEQg1GGeTp0Q?=
 =?iso-8859-1?Q?kz9yY5vcECXj8kPhBb072OvUJoMXxmSH6ue/JwV6Fr94WwfZ0T3bj1QimZ?=
 =?iso-8859-1?Q?0AXx0TCxCbJ+OOkJY2USX98HTC3yHCofTL5vB4eWJm7jLhNaOnfIPUuX/y?=
 =?iso-8859-1?Q?7lxfRFY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 16:39:56.5186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec8e54d-9735-47b8-1d77-08dd4c4d0cad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7317

Hi Nicola,

> On 13 Feb 2025, at 15:42, Nicola Vetrini <nicola.vetrini@bugseng.com> wro=
te:
>=20
> On 2025-02-13 16:32, Nicola Vetrini wrote:
>> On 2025-02-13 16:01, Jan Beulich wrote:
>>> On 13.02.2025 15:52, Nicola Vetrini wrote:
>>>> On 2025-02-13 15:22, Jan Beulich wrote:
>>>>> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), ye=
t
>>>>> left shifting negative values is UB. Use an unsigned intermediate typ=
e,
>>>>> reducing the impact to implementation defined behavior (for the
>>>>> unsigned->signed conversion).
>>>>> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric
>>>>> 'l'
>>>>> tag.
>>>>> No difference in generated code, at least on x86.
>>>>> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions)
>>>>> radix_tree_int_to_ptr()")
>>>>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>> ---
>>>>> Bugseng: Why was the 7.3 violation not spotted by Eclair? According t=
o
>>>>>         tagging.ecl the codebase is clean for this rule, aiui.
>>>> radix-tree.{c,h} is out of scope:
>>>> automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+=3D{ou=
t_of_scope,"^xen/include/xen/radix-tree\\.h$"}
>>>> docs/misra/exclude-list.json:153:            "rel_path":
>>>> "common/radix-tree.c",
>>> Is there a record of why they are excluded? Is it further explainable
>>> why exclude-list.json mentions only the .c file and out_of_scope.ecl
>>> mentions only the .h one? Shouldn't different parts be in sync?
>> exclude-list.json is used to generate a configuration file for ECLAIR ju=
st before the analysis starts, so effectively both are excluded. It's a goo=
d point however to have only one file to handle exclusions, and use that fi=
le to generate the exclusion list dynamically, but then someone might want =
to exclude certain files only in some analyses and not others, which is not=
 a good fit for exclude-list.json as it is now.
>> @Stefano, thoughts?
>=20
> I forgot to address the first question: the (vague) reasons are listed in=
 exclude-list.json as the "comment" field; in most cases, it's because the =
files have been imported from Linux, but the full rationale is something th=
at should be asked to the original author, which is Luca Fancellu.

So IIRC the full rationale is that since some files are imported from Linux=
, we would like to maintain them as they are
in order to ease backports. Misra fixes can be done, but they need to be up=
streamed to Linux and backported to Xen.

Probably a re-evaluation could be done by the maintainers to see if some of=
 these files could be removed from the exclusion
list.

Cheers,
Luca=

