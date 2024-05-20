Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2718C9D0C
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 14:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726060.1130310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s91yJ-0003L3-8v; Mon, 20 May 2024 12:18:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726060.1130310; Mon, 20 May 2024 12:18:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s91yJ-0003IT-5w; Mon, 20 May 2024 12:18:31 +0000
Received: by outflank-mailman (input) for mailman id 726060;
 Mon, 20 May 2024 12:18:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2329=MX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s91yH-0003IN-G9
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 12:18:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20600.outbound.protection.outlook.com
 [2a01:111:f403:2613::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f07cd15-16a3-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 14:18:26 +0200 (CEST)
Received: from DU2PR04CA0154.eurprd04.prod.outlook.com (2603:10a6:10:2b0::9)
 by VI0PR08MB11041.eurprd08.prod.outlook.com (2603:10a6:800:256::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Mon, 20 May
 2024 12:18:18 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::12) by DU2PR04CA0154.outlook.office365.com
 (2603:10a6:10:2b0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 12:18:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Mon, 20 May 2024 12:18:17 +0000
Received: ("Tessian outbound 082664cc04c1:v315");
 Mon, 20 May 2024 12:18:17 +0000
Received: from a6b9332de319.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 56771730-563E-4566-8D7C-27B2ED429720.1; 
 Mon, 20 May 2024 12:18:11 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a6b9332de319.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 May 2024 12:18:11 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB8043.eurprd08.prod.outlook.com (2603:10a6:10:3e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 12:18:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 12:18:08 +0000
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
X-Inumbo-ID: 0f07cd15-16a3-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eZJj6MsSFELARtQleGXiDxOa1EUEjN2ZC9grRkWN6CFeQAwI7ecWhhoycFb8va1uLeWV8BT5mfAyqChbNVDKYFtIQ3OUM4Ec/pYeGEhJJYbPGqO7aQOKlvCkRNKLLZ4bla8tla+MzsYaSIAsFjs1qPVIG4pI1eUNWQFS+qCvOl7dhXW5GViEktBSaifAoKJfygHusJWA0tXr6ilhbAxkzCwyPFSUEv2f2D5zCHoMsGzidzPCRu9ZNBv6hf6Qzhi7v6sA7ckfWhuEyRpdf7bHG8zZJ0htf6hEDnbypC5SNcrmBy1SJbORvyivMY0+gPr+Kq18MbZq/NZqiR4DsYD5Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUh//qIrrLC50lj3hr8be+GwwZhhSOoLCMvWd+b23UM=;
 b=Gr7aq9svVz5/W2iso9BBorj41tXPOE89xzp3SpS/Rc4Oh0nnoyn+mZD8q7++fwsTnzgg4UHN89s+RH8349USrRJ4YjcG5r9nDEwi8+NqJTOG0j8TUSXZZzgjlOpjvTyWUydYYuhCiYTweyuPpbYejXzSMMwmKYbj4NtXoOmtCsL77VEuqxDyTn/lqhVhzzyPfjyPkS51fIf+7DNi0eiEQZWGiTAQZwyBLj58AmyBRzy3ERnFWcbYQkHHpBAydAhqg4eU0ZZ/eoxfhBo8Z13AwzEhZl5OKZaYlR31l33h2dvTiZ7M59I1hwBPxzzMboLRKyWYY7DDt+H0R5+ste3KXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUh//qIrrLC50lj3hr8be+GwwZhhSOoLCMvWd+b23UM=;
 b=FRhvvvSbn8hjbEVU68jude7ZLpKjGvwKvfUuTNfAtoCo/vV8kePUQJ18aARhApmOEnrTIahy7t3gtvW3eNlTaeyew5ZKVqk9MJBukrj8OTnzNjxNR3pwKBHwB+NZ6tw0lusq+iDqGdwOamfeomN8gmxTCqpeQTyoJXxdrNKxgYE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c810c46770452edc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cnr4he1qs8KlnENWz+pDG9L0+ymC+0yqYspNQeeB5PUef7h3RtpPG82J+CIwMoufaC36UJ5bjX3543yBzaDr3CKEGTHpW/v8bUBzp+TMk57TdIH/O+9MeiK5WKZvxV26NkYhKzlRPj+pmfDNRGgQdmfaZDx3QAMOufzA6UjHQLpnoOsni4FUezVi47ly+drZSlvQmytKiewBjV2HkHNfcAC9ulfd/n8VwjHHIppIsWhZZxw/0y1VJoY+K+dQC4CY/GphvmMfCsxMZFfKP2a7rmi7KlI3xQ9jXM7uVAVgl+F2P8CxEIFvLA6XFqwsgFs2fYEQuwNGgGWC7cjugccVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUh//qIrrLC50lj3hr8be+GwwZhhSOoLCMvWd+b23UM=;
 b=IV9PHOatfMUVM64zzSE1Fe7h2rRbxnuDvx1GChjBrEfGiXu7zOazV3M5kIf//zbYkeF4a1PcPUEF3cYZ3Zg2yi5BL7e/wfDh4MnUVM/K7scuBtw4W6zdwYryVD9oisRVVqYtEBIF4UemKYllN0HAO8ZAeq1LfQzRDWJNkE+0u9/mwM9TK6UdhhZ/N7plqVeLKF3QmLz2iZdreFreHjBiUKv3sdq37Lbz1LK5HGQ4hoNXswjfyhOszJ3c+A8J7Vzrm+YxRSelQtt5e2zsC2Gj8KewpcPiS+qWXlyIFcbJOHtAqoMzUl/D2AcSDc9ksImezNVw4WjjQoQ2Z8JzSSH3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUh//qIrrLC50lj3hr8be+GwwZhhSOoLCMvWd+b23UM=;
 b=FRhvvvSbn8hjbEVU68jude7ZLpKjGvwKvfUuTNfAtoCo/vV8kePUQJ18aARhApmOEnrTIahy7t3gtvW3eNlTaeyew5ZKVqk9MJBukrj8OTnzNjxNR3pwKBHwB+NZ6tw0lusq+iDqGdwOamfeomN8gmxTCqpeQTyoJXxdrNKxgYE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Henry Wang <xin.wang2@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
Thread-Topic: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
Thread-Index: AQHaqqhXub4l7BSWRU+Wa81RtopbbLGgCi6A
Date: Mon, 20 May 2024 12:18:08 +0000
Message-ID: <CC1164A5-D7C4-4455-95BC-A688C0FF38BB@arm.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-2-xin.wang2@amd.com>
 <ee20798f-a459-492a-a7a1-308472878fe1@amd.com>
In-Reply-To: <ee20798f-a459-492a-a7a1-308472878fe1@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB8043:EE_|DB5PEPF00014B8E:EE_|VI0PR08MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 3110ba9f-94ba-4c40-c008-08dc78c6ee68
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dU5aVnczUTBxZkRLdFUwYytzM3Byb1B1MUg4ZDdDcE1rKzF6ZU9CSm1MN3Vp?=
 =?utf-8?B?Q1dURm5GWUp1M1BWK3YvME1qcUtadDdJUEVVWFN3dTdHcmRMVEJzSjRhVFBh?=
 =?utf-8?B?VmFpdlcvSERBY0o1LzhiVGZSMmdib0lZTUdySW5LRmNjRG1DN3Qva1pMTERa?=
 =?utf-8?B?Z0NBVmhIVU9NR3VXeGZHQXcvUWlMRXpGMmJLS1psOXpaSmNyR1NqU0l3SU9G?=
 =?utf-8?B?cjB5eFZzZnAyRVk0bXdBNTk1VHg5Y3VCNi9ZdHZxN0VSMkpOdU83cUlYUFhN?=
 =?utf-8?B?NVhiajYxTTNSUUVQbmY1d3EyS0dtK1g1TmZmYm5WVjdpSGVHbWhxZm1VOEZs?=
 =?utf-8?B?M01LQTYvTVJjWG9OSGRFUms2V2hmemZQRGd1WFpaNTdCcURKQUdRK2RWT2tX?=
 =?utf-8?B?eU9SbllsRHVMeGVLNTNJTnBlRWQ2TnZKTWN0ZHYrWUpkWXRwT3hxNjZBOWQy?=
 =?utf-8?B?ei8rMmxnL0NQQ2FMYTdodDRuUnN0N1NLUEJlVU83L3Z1ekdrakIxUGxVa0hF?=
 =?utf-8?B?TWpRTGo3aEU1eFZsU29qMlBERVZPZGJ4ejBDVzAvdzNLQ0dRSGs2VkVmWTdU?=
 =?utf-8?B?c210dXNjMjdUT0swSUxxN01JbStqRjlqR25EK0VlbW8zTFQ1L1lPWXdLNnFV?=
 =?utf-8?B?RWY0eW1mTHBCN1pZanhTckJ5UUdGekcraWVkcTlPRHUySXkvMHNVOE8yL0NE?=
 =?utf-8?B?Zm1xSFRHZHh0SG04RFhZbVRNcmg4aFFTcFBmODlaMDJuRnRTTmZieHhycU5m?=
 =?utf-8?B?K2tlRHI0aHpwRmpnWTdNR01lVWVYZEs0cGdVT3RjL3JYV1RrSTNWTyszNU9R?=
 =?utf-8?B?aEpGOFBsb0NBOXlXK1FKNU9kVWN0dmhlSGN5aXJVNERiY3NQUDdDL01ub0FC?=
 =?utf-8?B?VGxEODIwcUVXOEZ2UWlDUlFzOGcrcTN3a1Bsa3pMc0s2UlBYODN4WVEwM1FB?=
 =?utf-8?B?cG15ZXkxYW5ncVJKUTd4NGxvdzNqcFk2ZW53dkY5T2NsYTJxWHZENVA3cXd3?=
 =?utf-8?B?QndtN0hMcUFNRzZCOWphSGQvdWJ0VmltYjYrMk42NkJIenFtQi9VY2Z1N3Ja?=
 =?utf-8?B?THZWUHk0VFh3eUUyTnFNM2gwOWlrSEVzZTdDV1JwVGVsUVlveEtaVklZSHZy?=
 =?utf-8?B?aCtNeUpPRm9PSnl4VUlGamJHTzFLdFpzV1ZYQ0JyZHM1UGh0d1o4Y0RIbUNq?=
 =?utf-8?B?VmwyaVBWV3l0OVFvTjhFTDhaMTZrNlUxWTBYaHZjd3l6MDZUOWdyVEs4cFIv?=
 =?utf-8?B?MGJmUmV3MFdrTWtFaHhsV05zSDNpQTQ5dGVxbStzcWJhTGY5VURKWEhxaVJv?=
 =?utf-8?B?N3Q3aDViWk9SSVpFeWZ6USs1T3Y2d21xNkRRUS9xY1BPY3JYYlpjazJOSDZa?=
 =?utf-8?B?bUh0WGZkUkowSFFQeXlteHUreEJldmVDand4bXczOUlZejBhQjJ3V0RPU21h?=
 =?utf-8?B?b1UxcHJOYWJ0OHRSQzI4eWhuWU5TS2kxbmRkRExqSUFmRUxsUmxtVFJYSWJs?=
 =?utf-8?B?WHVCZUlGeFlRSDhuS1EwQ0pXa3A1d1NNZkN2d2V5dGY1by9nT2RNVE9kczlB?=
 =?utf-8?B?Yy9KVFk3QSszR3R1eCthalI5Vk5LSXpqTDBOS2JYZEpqQjh4d2FXZ0JlWWFH?=
 =?utf-8?B?SzlXa3ZnL2JJZlg2azIvWm85TFgyV2ZVRDFwVnN4L0d1byt3Unh6OEF4VUFY?=
 =?utf-8?B?dW1KWlVEWlBobWtzKy9uM1IwQUVydUtVRE1HU2prWGlTQll0eHErWVlCUUR2?=
 =?utf-8?B?Yy9BM2FsdUswWGRVcVZlZjYrbWNnRzd4clhIbHo5b1gxZkdkczBld0toZjdz?=
 =?utf-8?B?MUR6eS8ra3lVSHFkczZIUT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F5664407148F56429AA4E84FEB2178C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8043
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	bb3c3ed3-ce0e-4e92-0e2b-08dc78c6e8a9
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGIwZ1BhbUVRWlhJeTdWRkdINmJvakdsMjRoV3ZXQlRFckJhL2JRcVE0VllN?=
 =?utf-8?B?c0ZFWGY3eUo5d3NJWGdEMzh4M2FOa0pXbHVldTZFVjRiYVJFc3hEeXZXNGYr?=
 =?utf-8?B?dnIzTldDYkV1a0VwYTdQek1Iek1EaU1yUUNSeEIwYk1raEhORlFFUjJ2TE9E?=
 =?utf-8?B?UXZZVDZqNWI2N3lmZ21aWFZBRHlKWEcyTkI1d3NQWVFOelU5S2c0RGNMUlFK?=
 =?utf-8?B?ZTlFUytSYjhkNnRMVXBPaXVtNkhidDZaaDVVR3crOWtPREJ5ZXRuUFFNKzVL?=
 =?utf-8?B?TnhsQ0M3Njg5cW9wQlg2SmxnRFZaRFB4N1NheFI3aldUZVNOSm5vempqMWRp?=
 =?utf-8?B?SnBvLzR2Mm1iSU1pOU1LU3lrUFlTTlBiamJMRUEvWVo1ZFhVWVh3L1d4MHlt?=
 =?utf-8?B?VFJBRGN0TUVQeVNMM25NNk0rS05lQ0o4c0VuOWs5NXdmakhuYWduKzlITlM5?=
 =?utf-8?B?ZGlHeS9XNFBVNHVkZFNERGFUNkxUbFFCQU0yWTVlWkw5c1p4RFZJcnJGcGpG?=
 =?utf-8?B?MUdOc1NYRU5sanlCcUNOM3RZQzVHTnl6Tm14U21qSHhLVkRKeVR0ZFpzbGNv?=
 =?utf-8?B?YlRoSE9UdkpaUzI3WU96OHFjUVdSQXlCN0x5L0Ywc3lTZ3FkdHowWWh5MTVa?=
 =?utf-8?B?M1dLUDlwS2VRQXhBbHVSQWF3dHowU3pWUWxKNVZVMkRDK0V3bmp4ZDFmcFFJ?=
 =?utf-8?B?S2ZTWnVRSnhaRFgrUlVNRWVWWk45K0pDWkMwanhldEFURlNFd2FjV1hUNDlk?=
 =?utf-8?B?SFpLY1k5VUhXVVB1a2swbWZ6RzduYisrbDc4R3NndXNGc0h3dTIzc3FLVXJn?=
 =?utf-8?B?QTlVMDhDbmlqNXpCaHVxZFF2cXFSWGp1UmNhZGJEUWtiV0FKdUVIWnNVSmFO?=
 =?utf-8?B?NFl6REJ3YTVmdys4b2pqeDlOL0hvR1RpQXNCV2RoTHFleXQ0K3J2RHRIMWhl?=
 =?utf-8?B?S0I1RlFBeG1QdDUzdE1NU2UyR1hjSzllcDdReUc4dk9KWHlFY0pMTksydmhM?=
 =?utf-8?B?MlJyQnBEN3hFTGQwOUswL2hFaUZueHZDQ3I5eHFwZ05FeXRseXEva08vWllp?=
 =?utf-8?B?dGl5YWIzVWtCSE1GcytKWDY1WFl5amtVaXV5eGpEbHJvcFF4QmtTdkk1RTRq?=
 =?utf-8?B?UEZTL3E1NWd5aFozWVNFNzZJUmRPcHU4dEZrK09iNjkvWUY4d1U3NGxjMFBh?=
 =?utf-8?B?UndoRlAza1dwcFUxaGFlMzZWUkd0bzd6ZDJvR0Y3ZXZ2OVlTc2FrU1ZIeVZu?=
 =?utf-8?B?ZHowRmppUmJOL3lvQ1VEdFJBVVBnNTdzT2xIaFc5dTVvWlZLNzZoNGo2cTVu?=
 =?utf-8?B?blZkT0hSMmd5V2R2UlIvUE1sNFBrYzlSUjAyYkJRZ3BNQ09vWkt3d2kyVDRC?=
 =?utf-8?B?YlJ1NjJ3MHBUZkt6VnlRemxyYUxpMGNZRENyMy8zd0plYW1lZXhMVExqdEFi?=
 =?utf-8?B?cXk5K250YlpRbHVVd2xUUklHaVcvUEJ4T084a1VZUk5NRDhYbTRyVWJ0YnFr?=
 =?utf-8?B?S0IwSmNUa2pUYjVuaG85U0wwNjg3ek9YV2x6YzVxZDFkL3ZuVHZaWEdKdkdL?=
 =?utf-8?B?MjhzSjFWU2licWJxNXVScjhUUWJ5OXdGQTB3elFxWTVmME5yMUJsRHYyTmNS?=
 =?utf-8?B?Q3k3bmEwRzh3K3M2a2NNSVBiWS94dzJXOWVKeFJyakwxMmd3bGM0dDhzNTVW?=
 =?utf-8?B?S3FpZ3V2MXhHaTRIZFIwdGFnU1B3T1FwS0UyaFV3UTVwTTZ4V0dMb2pCSkVQ?=
 =?utf-8?B?eXUwNUxvRjQrWHlYREtVYTRDTUlYQnF5YXNqVlAvSHR1WkI3dUJLMUhabHV6?=
 =?utf-8?B?aGhxSkNkL3pwdUFHNXRGcnhYQVVaOE15a005S25kb0owd1U2ay96Rjd3WFJa?=
 =?utf-8?Q?aRQCUV80jF4JL?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 12:18:17.8311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3110ba9f-94ba-4c40-c008-08dc78c6ee68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11041

DQoNCj4gT24gMjAgTWF5IDIwMjQsIGF0IDEyOjI0LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4gK0NDOiBMdWNhDQo+IA0K
PiBPbiAxNy8wNS8yMDI0IDA1OjIxLCBIZW5yeSBXYW5nIHdyb3RlOg0KPj4gDQo+PiANCj4+IEN1
cnJlbnRseSwgdXNlcnMgYXJlIGFsbG93ZWQgdG8gbWFwIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGlu
IGENCj4+IG5vbi1kaXJlY3QtbWFwcGVkIHdheSBmb3IgZGlyZWN0LW1hcHBlZCBkb21haW5zLiBU
aGlzIGNhbiBsZWFkIHRvDQo+PiBjbGFzaGluZyBvZiBndWVzdCBtZW1vcnkgc3BhY2VzLiBBbHNv
LCB0aGUgY3VycmVudCBleHRlbmRlZCByZWdpb24NCj4+IGZpbmRpbmcgbG9naWMgb25seSByZW1v
dmVzIHRoZSBob3N0IHBoeXNpY2FsIGFkZHJlc3NlcyBvZiB0aGUNCj4+IHN0YXRpYyBzaGFyZWQg
bWVtb3J5IGFyZWFzIGZvciBkaXJlY3QtbWFwcGVkIGRvbWFpbnMsIHdoaWNoIG1heSBiZQ0KPj4g
aW5jb25zaXN0ZW50IHdpdGggdGhlIGd1ZXN0IG1lbW9yeSBtYXAgaWYgdXNlcnMgbWFwIHRoZSBz
dGF0aWMNCj4+IHNoYXJlZCBtZW1vcnkgaW4gYSBub24tZGlyZWN0LW1hcHBlZCB3YXkuIFRoaXMg
d2lsbCBsZWFkIHRvIGluY29ycmVjdA0KPj4gZXh0ZW5kZWQgcmVnaW9uIGNhbGN1bGF0aW9uIHJl
c3VsdHMuDQo+PiANCj4+IFRvIG1ha2UgdGhpbmdzIGVhc2llciwgYWRkIHJlc3RyaWN0aW9uIHRo
YXQgc3RhdGljIHNoYXJlZCBtZW1vcnkNCj4+IHNob3VsZCBhbHNvIGJlIGRpcmVjdC1tYXBwZWQg
Zm9yIGRpcmVjdC1tYXBwZWQgZG9tYWlucy4gQ2hlY2sgdGhlDQo+PiBob3N0IHBoeXNpY2FsIGFk
ZHJlc3MgdG8gYmUgbWF0Y2hlZCB3aXRoIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mgd2hlbg0KPj4g
cGFyc2luZyB0aGUgZGV2aWNlIHRyZWUuIERvY3VtZW50IHRoaXMgcmVzdHJpY3Rpb24gaW4gdGhl
IGRvYy4NCj4gSSdtIG9rIHdpdGggdGhpcyByZXN0cmljdGlvbi4NCj4gDQo+IEBMdWNhLCBkbyB5
b3UgaGF2ZSBhbnkgdXNlIGNhc2UgcHJldmVudGluZyB1cyBmcm9tIG1ha2luZyB0aGlzIHJlc3Ry
aWN0aW9uPw0KDQpIaSBNaWNoYWwsIEhlbnJ5LA0KDQpJIHRoaW5rIGl04oCZcyBzZW5zaWJsZSwg
SSBkb27igJl0IHRoaW5rIHdlIGhhdmUgYW55IHVzZSBjYXNlIGZvciBkaXJlY3QtbWFwcGVkIGRv
bWFpbnMgdXNpbmcNCm5vbiBkaXJlY3QgbWFwcGVkIHN0YXRpYyBzaGFyZWQgbWVtb3J5Lg0KDQpD
aGVlcnMsDQpMdWNhDQoNCg==

