Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6CF9F4619
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 09:31:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858583.1270837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNSzM-0006Cl-Td; Tue, 17 Dec 2024 08:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858583.1270837; Tue, 17 Dec 2024 08:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNSzM-00069c-Px; Tue, 17 Dec 2024 08:31:32 +0000
Received: by outflank-mailman (input) for mailman id 858583;
 Tue, 17 Dec 2024 08:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OFuF=TK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tNSzL-00069W-0D
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 08:31:31 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f90110a-bc51-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 09:31:28 +0100 (CET)
Received: from DU2PR04CA0342.eurprd04.prod.outlook.com (2603:10a6:10:2b4::21)
 by DU5PR08MB10493.eurprd08.prod.outlook.com (2603:10a6:10:518::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 08:31:25 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::1b) by DU2PR04CA0342.outlook.office365.com
 (2603:10a6:10:2b4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Tue,
 17 Dec 2024 08:31:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via
 Frontend Transport; Tue, 17 Dec 2024 08:31:24 +0000
Received: ("Tessian outbound 6a902d9511f9:v526");
 Tue, 17 Dec 2024 08:31:24 +0000
Received: from Le780b60c7bd3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D777679-1714-41F6-BD90-A605D6E8133B.1; 
 Tue, 17 Dec 2024 08:31:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Le780b60c7bd3.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 17 Dec 2024 08:31:18 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AS8PR08MB6008.eurprd08.prod.outlook.com (2603:10a6:20b:29d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 08:31:16 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 08:31:16 +0000
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
X-Inumbo-ID: 4f90110a-bc51-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oSQscCiZt97LJ5QTEhTHFiz4HhVzHFdKxZG7EBcuamh1t3YQKk4aCZTaiC/gPxpqqDtpWz4mxxMaMv9ZJGAW6UDPxWX/x7QIryjZGA43babRxjbuM5uQ1Ri0olR6RBDyc/mNxjiWiL6wBsAj7NbZiDy1yk8RUM5dGrR3h9CFfF6dkZY5V7kZCxo9megp6SyaOoM78hwmLXVczCakwMhUVaaeXVHRFT4StGlRnPpElTv/LSVA+PIMvOPSN4jB0DvPZdTqew4iAYIZhtBMt/EZGp0Weltvdli90evPvhHURlj8ZLyy0DeLAcxIwira8J8INY7hn7ozrMk+Atb4HK9hXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEC0tfqc/UUMUkKLI5fX0XqY+czKS6Zq2mVkenu/40o=;
 b=b7tyWBo5+cxASzeRkgoJK+aRC2QqAkKQoldSIwE+OUFR8ItUcdxSLY0nEhmiR2CzCSUeJlCll4U70tRT6HCNjoSQ6iJIStyWqHbw+PvRGsiubzQIVhoeLw4LflBsyARbOJ69E9P+dBgUWZkXzw5Z+8FNtI7TExb3O2fIw9mxAybuhPfit5ecFw66y+nzzDp6DrI5gcXCpPkg803NajfPkiRw0goloJ4OLogqxGNSB1Lx7XmtvxazImtNffuhOSxaJm/AZ9kJRZi4Eed7kHsRYTu/4G/M4LEDve4LmeeDSFG2D4wflGRDASs1VqqG81SSKQDAcb0L19M1z4PmpEJr/w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEC0tfqc/UUMUkKLI5fX0XqY+czKS6Zq2mVkenu/40o=;
 b=oLRC802PQIzrtXeGX5eOn47uPjQdi0JI4n04tdjwFChHxD7con/x7WCjVRTHBFcaxjgBPcDyDBl2HJncsc4LjkbFTDZkHAoK8spYVkXg3iIEgrqg9KUWvOGIKOsQWfyBxbMIMZaLSRhJOc40VxXYtGaf2lMpLHMrnV/Z7swMDNA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 356d39b222f130eb
X-TessianGatewayMetadata: Mn/2yvhyeb16slkJ8/p4Pe1Vq2aJRM/PdhUPBnecEL42LWQb8NSSaOVHh/QhVWcTD5I0bqKF91O3nwfHxW3jB8PTVyDVHWFqrXpdRbsoY/eAgpkquarWM8YjgTdANETOykCi65jlpjrQ537oG7sjSmKPp2feuVO820ZXc5pyRXE=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0Y1z8pu7heE2Clx2RSKefBGTQQBt2SjABMv1k+t79pYDIfZJg7mlvgazW0w6fdfvf0Afpz3J0sYg+2Ue9f8OEeFfS/K/WXfd05Hix65UVR8FDtzP71da+7ZOWIYEq2sd5HT0/jggZ9G1opg8hmSocul4doL5a/pyPrP3LnVlxPId1Ae/R0XGckRkHYFCO5O6rt3l0lOfcMGZFkwVxZp+VbuhaW7jpbXGxcnr8+mbiK3NGvzUUZCI4iAe/Uo4tdNzfiMd/9BBySUV3TqcXYjZYj39/rfTAs+NLwA6npehndew3u1AeztjaR5rym+/KZ07GE9xUGAHatPn5JIG1y93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEC0tfqc/UUMUkKLI5fX0XqY+czKS6Zq2mVkenu/40o=;
 b=MigWO1uDIAXElKxec+9ZyDBx2iNoTW7SQXPP4z73W18VR5zvC7cguhLM5zwZ9iVmWbTaD8EiBjt3neU2o5DDQ1ka+K02j7wQdv4M3pMDx2EJmfmzdGWWc18mrFRcYx91rRXNy6OcWNgiMi6tPTAyuvcpZwB5HPfm8XAQ2Ato2oRyMH0h13len2d7HZfVxRbF48iVW7h+YgSMFZagMsz5Z4ISdBDh2RagXvQUiGFs2KVB6kJwmrTb8IkZQ2ncnT0FruRK5He0K0WmEGhXPXdywCNgk43dBsRUiOeaJdrrAu7n8bhWBjD5jjP/xSUADd2UPX2tD1CyhcK2aIiBooVL8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEC0tfqc/UUMUkKLI5fX0XqY+czKS6Zq2mVkenu/40o=;
 b=oLRC802PQIzrtXeGX5eOn47uPjQdi0JI4n04tdjwFChHxD7con/x7WCjVRTHBFcaxjgBPcDyDBl2HJncsc4LjkbFTDZkHAoK8spYVkXg3iIEgrqg9KUWvOGIKOsQWfyBxbMIMZaLSRhJOc40VxXYtGaf2lMpLHMrnV/Z7swMDNA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/1] tools, xen/scripts: clear out Python syntax
 warnings
Thread-Topic: [PATCH v2 1/1] tools, xen/scripts: clear out Python syntax
 warnings
Thread-Index: AQHbUA/lHa/DXS8C6UW0n1kPYHB8v7LqG9AA
Date: Tue, 17 Dec 2024 08:31:16 +0000
Message-ID: <D7603E76-595B-4AD1-BF03-AC5EFD391E1B@arm.com>
References: <20241214161350.70515-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-1-Ariel.Otilibili-Anieli@eurecom.fr>
 <20241216231128.211648-2-Ariel.Otilibili-Anieli@eurecom.fr>
In-Reply-To: <20241216231128.211648-2-Ariel.Otilibili-Anieli@eurecom.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AS8PR08MB6008:EE_|DU6PEPF00009528:EE_|DU5PR08MB10493:EE_
X-MS-Office365-Filtering-Correlation-Id: ee571954-6e95-454f-fed3-08dd1e75318f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?SwDNINr3IQorvCVPSCW8SqaFkxEani5no1OnJ46SBFUH8w+7IQOiqMyauM4s?=
 =?us-ascii?Q?QAxmYBY63zWo8b0oUkxy7gSjgxin5RX5d4amgYzHKU4DOREjWBBE5fO7du4Y?=
 =?us-ascii?Q?6109LCLZe6nJdzsKrijJkws1wKiodgX3+2fYeyapLrbz2PRhgSdrOfDzIXEA?=
 =?us-ascii?Q?3JeCO3ocAQf87jFY3Vd9lTIwCtAy2KtilKn49c5zK/77vn7tOAOQ0cmIUDoN?=
 =?us-ascii?Q?TaPcAZ17p73Vs1xq4iYjilKO0EmnyTFrZk8nNKrREE4o3m5bYzXEbm+pR3Bm?=
 =?us-ascii?Q?sLkA5s/sn/X+wdqVdEnaSUIw/+FfvnoCWam64SBbSpxAUAvrsF7FpbntPsuO?=
 =?us-ascii?Q?gZkyQUqDJ9JDq7mFhfZEH9adrK5hmWym9cOwZ6oHqW70Vw1QKOCM9IyCuOBS?=
 =?us-ascii?Q?FQkJm+3DJYYf02XlFCAY0mAjVWbu86NMflgKHJF/gC3GnAu6gzcRTVzMZl6J?=
 =?us-ascii?Q?U62qTFTFI0nmD2o2sSA3yLJgF0+0bSHlI+Yv9ACC/ePJxFXJhknZEaa2H34B?=
 =?us-ascii?Q?f5rbRFZaerziV0zESgLJQ9ON49dnEwhr7nEFFv+AN1mtPlOhf8m8DoGZ7hQB?=
 =?us-ascii?Q?m1xd7vjNQDQGXQWYOgddIXaI808clT6AQKN0DrcK6iO4rGzIuI7rm64OEtAN?=
 =?us-ascii?Q?UnWZ4+uHFaxermAMgb9m1YwEN6zcvtw2YCVrc4v2xIo+nSMb8+TApdAGUSsZ?=
 =?us-ascii?Q?KOtxEKBJPTrGZPj0JApAX0o2zFggOjtcZTmBQKpnZawImyiaioimUJhHqHIg?=
 =?us-ascii?Q?euYqlZPtQUXiDEcMQ+mAQ93fdRtogrkRGPlDKZd5B7oHm9bj/MygPIixot5P?=
 =?us-ascii?Q?02Q6WjXKR26fHTWs6ZGCfT5IQpNFpZvj9xMfla8fOHM2biE1GFEXFvJCGKBs?=
 =?us-ascii?Q?+80tk11vqwLyzJ0ckfTP7uPmSSkYVn++cv9FyouS47kJWUoZG+54DMs9Qmml?=
 =?us-ascii?Q?27IhWxVCivEI7gWizP5LXQ4maZTfA2Z0cwehxT6NsVBC7sZs2rOb/P+FUk3J?=
 =?us-ascii?Q?JjhyJ3PMI0+m1wms8Sis3CP0Eu7gGeaRhxW62rOws6kGuJNacVShk5yJrxNn?=
 =?us-ascii?Q?ZChT0b+AEvatFCYgI8dJXyBvKwuv/tWJxja4wGvU5cA5vB4aXY6j1Hn+hgmZ?=
 =?us-ascii?Q?Hr9euhUfeieyOqfIKR4AtQck1V7kcOZbKCAvd3NivJHy6AwT4JyEeH8Z2Vuk?=
 =?us-ascii?Q?XXQjFBSjkxnAjtPxbhLEb6eeWJBk5uBULljbaEAF6/uFVmhKkkLhq1TStisq?=
 =?us-ascii?Q?8BZHIf4sfuYRei8YvF/zRC4dL/8p0gDAZKI7XQdV0O9DAiflr7uB0A51xAOf?=
 =?us-ascii?Q?UWiBVVe2bUBCzJ7tVOmbZk0uLGybQ5OK8/4RXZrp9tr4xnTpwKVICZkTYAhn?=
 =?us-ascii?Q?SS2iCg96yB5fZ2HBGMDCqvTkg45IHEJD70FvLMsvDGCeJwFeGldKbIKQQ4x/?=
 =?us-ascii?Q?G1X8z+dI4hwOEZS2IvtQMxTrGuzVyrQC?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE62AA5C660CF141870D85525643EDE0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6008
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1dd52016-3354-4551-c96d-08dd1e752ccb
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H/ovAJj4V6z4tzhDA7BmWDm0wR+lquf+xll28j3y2vi8+JSxdvQA/evslcYB?=
 =?us-ascii?Q?2BtznohloSiyppjg2inLKYxOjL80J8kP4yVXxFJ3pxnfgi0oTTSCDckw9Kdx?=
 =?us-ascii?Q?5QrDE0wVXHdpvGJyZLyMiFlzlBhKRcRCm6Eq/8oZ/YSmUFLs5HLTIzKlZIEF?=
 =?us-ascii?Q?QSJ1AjZL+f68nYohF8l2huZRGgDdRXsyR9ZRITE0KhKaBeT/rysv4ybBVhZH?=
 =?us-ascii?Q?Bag+FmrmKzeWXxL5v6LdjhnpsTpbCoqJAVSVauB8N36lBXg7CGe7/65hD5oh?=
 =?us-ascii?Q?6YIcxJlOu1ToefOP59/p1nhxNhyMEN5VyyaaaCSzWiubAWPLEeBDfr7OGkJQ?=
 =?us-ascii?Q?TN6+xZ/Y16LAjhTqk/GwaRQ1TUtEnvErPxOdcL1YZJ7JB9nkfr4lkdR0IyMG?=
 =?us-ascii?Q?R29XJzyT3JxJhFqj3P6vCBxBkysVyRwAqkzKqu/Sl0IBDnQcaxSoUzYnKPw/?=
 =?us-ascii?Q?NPLYtqt6DvVKAYHWEh4q4FSfJwi8Yij30+OazkzGUmd+hPMqPMKGcErCLIxE?=
 =?us-ascii?Q?Y4nJvSomt6fznYP5y/QTp5z6pYqxnfOQUcIMxqm22io3URnRdYcsB8/gVUz4?=
 =?us-ascii?Q?eCw/vFjE1CIdoRgnwXY4lcSqwy03ncqqIZaIiCvivT5zMpCRIbW6pWj4U5DU?=
 =?us-ascii?Q?E13vxMIRJ3x2UjbD+iatMDTY4lcTM3yUHkv1xpEWxN0WpfXBOQdbTcNmS5PP?=
 =?us-ascii?Q?lhXIKhGrARNYM5eUexF19NjDyv/q5UH06ntipDRgH1gnpy0qaXZIscJgCr0n?=
 =?us-ascii?Q?uIqEwC3yj3nnyh5jjisTdENvb9XhxYDdoixUiKw1Xeruu5Y14v39UpEXztbD?=
 =?us-ascii?Q?x0ICWFv6DSqV0muyQy4BaI2qPJLX9fbB3t2CNGaTyP/MV+dZ9E8TGRFbV6qZ?=
 =?us-ascii?Q?tDdW6PlLkYWCtqzzpsweSJ4lj0wyL/I93Ah44Qixw1MCJNrlul+wrAarV9mt?=
 =?us-ascii?Q?Bd5rcevma8seVA2TDNzHXUJmvFEBA+vlnbjVQxYaJk0BLksHJSn9q3PlcyFQ?=
 =?us-ascii?Q?/oz1HgzvR4F3klu3UWxxpc1HF92ku1icgH3SZvw79l/uER0lbIA9KmWdM1uF?=
 =?us-ascii?Q?MFyzGSJMHDORrwWP2LSqyZ4SNevvSaX7a81ToeqfghuiGD1CqjDCIsWJIEf7?=
 =?us-ascii?Q?LOWerO06S228vWDPjaS/sE90ZCOF2mMiYcUthbdWFsqgv/FqG6750aQjegoS?=
 =?us-ascii?Q?f6+1jtZ0Qg1Q59UzJiNShS+gJpDKyURxGZwTiPR8oM7GFrUtWhKBUVZIox+E?=
 =?us-ascii?Q?vbOFblc1EwJHvyoaHr3MfUeNlJ1fTpp+WECl+p93Pj4mJDzdVjElCzsRNHEy?=
 =?us-ascii?Q?0o6aniqdgfgj/HdkKnjdZtdPwkfVyihN/XnJ8fluNY47f4bfwH6DyWp0HTcH?=
 =?us-ascii?Q?UysTbCQe7Reegvyfs32LimVb3Xh1jYK56pAXP2blltVx4eCgyz35wL6/o87z?=
 =?us-ascii?Q?neuYE+U2oEsQ/+y+y5iy/hhD2Pbe//5wzSnCdBMHfFvVtC8MHoi/zvSIVENi?=
 =?us-ascii?Q?xHjmcCnqhvFQ7wY=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 08:31:24.7849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee571954-6e95-454f-fed3-08dd1e75318f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10493

Hi Ariel,

> On 16 Dec 2024, at 23:07, Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom=
.fr> wrote:
>=20
> * since 3.12 invalid escape sequences generate SyntaxWarning
> * in the future, these invalid sequences will generate SyntaxError
> * therefore changed syntax to raw string notation.
>=20
> Link: https://docs.python.org/3/whatsnew/3.12.html#other-language-changes
> Fixes: d8f3a67bf98 ("pygrub: further improve grub2 support")
> Fixes: dd03048708a ("xen/pygrub: grub2/grub.cfg from RHEL 7 has new comma=
nds in menuentry")
> Fixes: d1b93ea2615 ("tools/pygrub: Make pygrub understand default entry i=
n string format")
> Fixes: 622e368758b ("Add ZFS libfsimage support patch")
> Fixes: 02b26c02c7c ("xen/scripts: add cppcheck tool to the xen-analysis.p=
y script")
> Fixes: 56c0063f4e7 ("xen/misra: xen-analysis.py: Improve the cppcheck ver=
sion check")
>=20
> Cc: Anthony PERARD <anthony.perard@vates.tech>
> Cc: Luca Fancellu <luca.fancellu@arm.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>

For the xen_analysis tool:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



