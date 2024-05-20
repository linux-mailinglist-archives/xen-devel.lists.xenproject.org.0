Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0A8C9DE8
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 15:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726100.1130360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92nS-0005Ha-36; Mon, 20 May 2024 13:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726100.1130360; Mon, 20 May 2024 13:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s92nR-0005G1-Vp; Mon, 20 May 2024 13:11:21 +0000
Received: by outflank-mailman (input) for mailman id 726100;
 Mon, 20 May 2024 13:11:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2329=MX=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s92nQ-0005Fq-68
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 13:11:20 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7145dff8-16aa-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 15:11:17 +0200 (CEST)
Received: from AM5PR1001CA0042.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::19) by PAVPR08MB8991.eurprd08.prod.outlook.com
 (2603:10a6:102:32f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Mon, 20 May
 2024 13:11:15 +0000
Received: from AMS0EPF000001AA.eurprd05.prod.outlook.com
 (2603:10a6:206:15:cafe::c0) by AM5PR1001CA0042.outlook.office365.com
 (2603:10a6:206:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 13:11:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AA.mail.protection.outlook.com (10.167.16.150) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7611.14
 via Frontend Transport; Mon, 20 May 2024 13:11:15 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315");
 Mon, 20 May 2024 13:11:14 +0000
Received: from 94c9b09d5798.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 50818A00-B6D1-4413-9AC9-F3E143171A7A.1; 
 Mon, 20 May 2024 13:11:08 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 94c9b09d5798.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 May 2024 13:11:08 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU5PR08MB10514.eurprd08.prod.outlook.com (2603:10a6:10:527::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 13:11:06 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7587.030; Mon, 20 May 2024
 13:11:06 +0000
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
X-Inumbo-ID: 7145dff8-16aa-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Mm/O9+H6YxgMI/CpF5dCTgtObRIrF81eGOzZ/Ld5VqK0xcktspXCAgo1A5+UzAxwNdzfAysOnLkjjl3cOG1ulDbDdizjRGBX6FZz5zLVdEzCIg7KK5OkCzW6f/kkjzNYWDPdze2sp/wQ257N2OnVqQaHtzU6XLTqNia4x3tKbEM3s0gSyv/T9uEcdDSBP0xnNSub8x4ZoNh6PPLeBS2oW3qMdHVRabI22kaiekcbNXkgWt9/AJuugUP/2ZqR6CcWKM4/EmG6GWg2+ZKTJaqjU7/49Lt3oXdNcs082qFzU8XZ89f2G10Po0HVMfsOu0HfS7V2ha3cRe3EU0pp9G03Tw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp1DqpcJayaK20Ky8dRfa8nfdAjnU/mEShlYoSbGCJ4=;
 b=lkOvmo8jUkhZbQWkUDS3ArVfSpufDSrGrbxHiH/s479cqiEbvh8pQLduerR9QWTmqUbRcEE0AZUpN286kOSsmbapBaQWSQjMvl1bP/rLIDN1QAVXm0smz9ZxbN7R7Zi82yUCrWyvh0LgTIK0Q7cYJ1silbPH1wBaPAOulseIisGSMiTXlJu0B7332U9VgdWGuuSF8BXCaT+2c2Pm0KkSZkfwX4gRR9WLA5eYctkWM8U9BGVElr+/ix2Nf9n1szctM36W1V4k+n3Tu6rVDDCcuCPpg2hIroPH7w2csFmb68wWWVbuh/HQh3++No0BqTY7p1OrWrptDR3n/jX6Ql2QRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lp1DqpcJayaK20Ky8dRfa8nfdAjnU/mEShlYoSbGCJ4=;
 b=mY0ftl9KF9F4vPTGpRc+I1iPU6wnJp8IScG8kbWICDzuCW2cNRIjxO/CkT+xVE3D8XN6I9S+Jgjuulgvo3RgrigqP9d+oYjnBZCBzJgeB9aOG1kl6XFHLkHZgViaSYazyIn+2zkzjmI+xLlOyT/arv+robIPBDYEmrqxB7uq5yE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e31f63481a28dfb0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZB9ioESLKFMRHxSQTcFKgJ0jNB7rZfXHEQINCrxYQ1hcH/lfr7dRsY8pOOJOB0F9NZemNEWr7axN7AJnXyHcX+56ibYP6N6M5pIaHEf5Fwt9IuGlykcFbmexwFv8rNxzae4VQ0Q9xmqCOKQvDf4KiDeRiv6LzuBBked5/+QI7ah6oasfQQX4DEOYhsem4DAojPI+VcxrdIM6qKxSIs/L5T5r8EpQ9PeiG86W4wK60DPzZ0OUZ2IAXJVQQ/sktaebviXaAcmVboOFLZMNY+jIql4A/T56nJ0zbRKmmBnsqAh/794Fm9+E9aPJ93MVxDy4d9w449xk16FRkwV2U3ofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp1DqpcJayaK20Ky8dRfa8nfdAjnU/mEShlYoSbGCJ4=;
 b=UrWbugpAiJOkgdHyKK15d4Ol/UYOCs10r+fOk/R5qgqRlnyco1CwzDCi00HH4UN+gsRwxBGNDZHEM1o/Jy9yicxUNTRTRMt2CFup7SmIAutKszJ1GcXnewGXfSLKli2CKHK3z7dFjyC6ZXiUhBuHPnz7rMFjTOsvUoYtn8E//r90FBeJkv+nrqHoTSkH1+pgOfPd/Zj9/7CwyDCS1LFluVPT8d36Taih4fwLHiq8f7rzinTavRYuOP4o4bJL77mG5edAJlsOxNwpy8mMsWz6EfqUUY970iZJOoNUfYq8UnnsB2T/fcKCz7+evrDZhtC2nDjTxz23ixLSEFkF4vElwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lp1DqpcJayaK20Ky8dRfa8nfdAjnU/mEShlYoSbGCJ4=;
 b=mY0ftl9KF9F4vPTGpRc+I1iPU6wnJp8IScG8kbWICDzuCW2cNRIjxO/CkT+xVE3D8XN6I9S+Jgjuulgvo3RgrigqP9d+oYjnBZCBzJgeB9aOG1kl6XFHLkHZgViaSYazyIn+2zkzjmI+xLlOyT/arv+robIPBDYEmrqxB7uq5yE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
Thread-Topic: [PATCH v2 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
Thread-Index: AQHaptP4l1WkDlPwC0KOp+ZDl+nOHbGgALAAgAAYgICAAASzAIAAAsEA
Date: Mon, 20 May 2024 13:11:06 +0000
Message-ID: <6AC54D50-7277-44ED-8C69-9E4984C3531C@arm.com>
References: <20240515142626.3480640-1-luca.fancellu@arm.com>
 <20240515142626.3480640-7-luca.fancellu@arm.com>
 <cbe1fb4a-9c2b-48eb-acb0-6726aecdfe85@amd.com>
 <03C2DB73-2B91-4E74-9CBE-ACA21CDA0783@arm.com>
 <e9fe1ee4-15ea-402f-8418-0c308afbf1db@amd.com>
In-Reply-To: <e9fe1ee4-15ea-402f-8418-0c308afbf1db@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU5PR08MB10514:EE_|AMS0EPF000001AA:EE_|PAVPR08MB8991:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c46a7d-a2c5-4d2d-7d0b-08dc78ce5453
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RDZpR2wzS2h2TzFKMUg1V1FaRlpOOW9WdGVhMWlQNFVqb2ZZb1h2WnltN3Yr?=
 =?utf-8?B?M2xXZmhOQWpMSTFORmtWTzBaMHdnNGtRQUdmMmtlL2hWanhkZmhBbXhvdmVj?=
 =?utf-8?B?Wk1veHRxM0h3V05QczFxU3ZhL3IzbSsvVFA5cTcvaTY4a0F1QVpveG9uMXRj?=
 =?utf-8?B?MGNxVURjR1l0VVJCNGU0b1pmWHpZZVZtemRyckFJT29zbDNjczJXNFhYWEk1?=
 =?utf-8?B?bDEyQStZb3NqS21jbitvdHpPZnd3RnRXRFVzK1JXMHNhUDVUM0Nham9iYUho?=
 =?utf-8?B?dU1mRk51WExaUXUyMElNdnM3d0JyMFlWei9JN1NYbzRBTk4ySU11Ti83MG42?=
 =?utf-8?B?MlBCRUpRdk9xSkltRCtYN3lBNE1EYkJ1UzByYWNSbTF5cFpsVWdJbVphR1Y2?=
 =?utf-8?B?SXM1clJLYVFsUS9TczJIRjdGV0FDdXp4RFNXSnRNeDd6bmwxQTIrRVM5cHZn?=
 =?utf-8?B?cU9yekFrdjBoTW9LWGQ5Z3NsZkpPVmNNajJLeWVHVXNra0xMVnhYUGdDakJQ?=
 =?utf-8?B?NWFySUFGbUVyb05ERDJDMFR1RlR3dmJTcnJjdUl2d2J2SDBQT3k5M0JmUi85?=
 =?utf-8?B?QkZMaVl6eFFKc3Y2TEhaWmJtZHRlb2Q0a3lJUndwejJlMUM2NUJkZGhXb3BQ?=
 =?utf-8?B?cm4xSFltUnN3QUNIV0hScW1RN05nOVpUL3B4UWZOaTJCdzlNaGsweDZObDVS?=
 =?utf-8?B?ajFDenBoR3kzT1RVRG9uQTB2aEZtQ00xTjRvU1l0c3FreGl4akV0YlRpYjlT?=
 =?utf-8?B?cXk5R3l2VjdMeDROa3c2cHlWelVTRElkYXdvV2RkVFA3L3NWVWh1V3kwOC9t?=
 =?utf-8?B?VXhwWEcvZXZBc1lJZktRV0JvdlQ0c0Z5bytJSk15OUJ4Y0c4VGVlWHFkNFNz?=
 =?utf-8?B?c0IwRXFVaFZBckgyM1BSMUMxVXJ5K1JoZSttcCtOYWhOVFRhdDRQblNQL1NW?=
 =?utf-8?B?Y1hhSHJkaDYrNkl1Nmg4NTBXWVFqSlF2dW9LNFoxWS9OOHFUY1dyM1BRS2F3?=
 =?utf-8?B?NlltOFJkTzVnaDB1VHFVV2NITTF3b2lpQkF6dEMvK2ZiSFI5VzgyWFdBa09m?=
 =?utf-8?B?ZVZMb2ZjbEc5U2tJRlNUWXI5bnU4UmNQaWZOQlFZbVE3Nk8rVHdId0hGVWxV?=
 =?utf-8?B?VzVJR1pic1llajFmUGNGeFM1Smt4RjR5UjlVbVF2MUtIWHFSVXhjbTlWajRI?=
 =?utf-8?B?Z2JBcm94WU94MkE0NmRqK3paRG9lTGlVVmJVS0ZFTEhMOC90dzl2a2VIdXdt?=
 =?utf-8?B?R2lBb25DQWJhV3dWMjc4TWR5VktUOGsydFFqSDBBM1UyM0lGTnpCMTBLSVUx?=
 =?utf-8?B?Ym1nYXcyc0g4N1RCMEJvRnJDY3dHMVZOWU9PSUpQc0xrbjhzR2pyR1kyUVk5?=
 =?utf-8?B?YjlFVGhKMDZKYVFOTjVUUVFMbERHYmg3V3VHdk5GMWVTQ2dRTmIwYkpJT3F4?=
 =?utf-8?B?Z21ValNNVFp4Zit1cXF2czh3bzR5dEhFOEN2VmtNY1c5QTBpWDJIMFVzTEFJ?=
 =?utf-8?B?OEZLVEllUmVpUjlBd3hSaldzWldtdWFZaUw4b1p1WWoxd1RjcVAwR3lRaHJI?=
 =?utf-8?B?YWIxQVF2SjhXMG9vcEk5WFU5bDMyMFdpbVJ0aHB0b0VvTFREc29kMURqaStQ?=
 =?utf-8?B?a2plYk1NaFljTi9xcmJDbFJGOTg2TXl3T1BUS21OYjYzSXJlL01ES0FSYlp2?=
 =?utf-8?B?a2ZhOXBhZThCd1lHbjVtdko2ZnZQeXp2UFdxWlJYY0d4VnFkOGJJUWc3cmxo?=
 =?utf-8?B?dlJOUXhPWHZxdUVZUjd1RVV4Wm1WVzUyaWNTd0RhT0dhUXNIbUkwM2V3VW8r?=
 =?utf-8?B?VStXWE9zWDVjMXNQOWhwQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAF75BF59172814195B37D3E25583A6B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10514
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	32dc8a4e-d276-486f-55e6-08dc78ce4f3c
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|35042699013|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHViSkp0TVo5QytTd0RrK2R2TnBXU0ZjOVJtdzc1ZzFSWGMwOXB6eTdUVmdn?=
 =?utf-8?B?bmEzZ1VkUlhZbC9tM0RiNzEvd2pIQ3oydVpidlRHOTY0dUZDVy9tYlArUE9O?=
 =?utf-8?B?T0NRb3EzQ0ZpUVVvZ1pyL09iMGtIMVQxaU5vMTZVN2x2M01YTERqSlRxTTM3?=
 =?utf-8?B?VFlkV25ldW1yYzJHVUVpL1NsSVlzeU1PQ2tyazBrcDQ3WGh1V2pMdmJ0TFhl?=
 =?utf-8?B?bG01azlSQmtwb3pQd0x1dytOdEFwU3NORlBIYUFnMTB6enJLNGcxdkxqbXZL?=
 =?utf-8?B?VXRNcEZKcEw3cVJnWDRZajl4Rk9DQ3dtVm1iRHNCS1pnb2JVUndjZ0l3NnFL?=
 =?utf-8?B?WE12L2NrRDJWNEJQSFVnMWVPZkxBWXY4dGg3RHlPSmRKak5MUTVJOEw0Uk1v?=
 =?utf-8?B?YldRT2NaOWNBSmtUa296cVlrcHgvOUcyLzJnUENKZFZYL1ZHWDdMNlB4ZFNm?=
 =?utf-8?B?b0pYVFIyQzNhRWoyZ1FGK3BLM3JPWmNUUU11VHRjd0xVRVdJc3lFc3FEMDBG?=
 =?utf-8?B?MzE2WTZlWlFwaHFqVlY2OGlSZklWeVk2QWdMc0UraUhlMmVTUXBHM09rN0pq?=
 =?utf-8?B?eHBtUXFLSEVVanF6QWNYU2tWZXJ0ZjliZ2hQR2o1NnAvNUJvZ2wxZVp6WVI3?=
 =?utf-8?B?MUJJb1pxVFRQSmFqZVM3UDM2aE4wQmxoNUEwYWovaFRTQUdYdTY0RVdSVjRI?=
 =?utf-8?B?WHk4dEp3MlVmRk9Pbm9XUWRwd3YrOHZ0Z0ptU1FuMUNtdktoQlBxYnpIdERt?=
 =?utf-8?B?T0htT3pVczA5RWFXT2FDVmZ3cWpibUJHejY5KzZOWXRBVUxSSVl3VnY1NUJm?=
 =?utf-8?B?amdManNkOFFOaTYwRitOc2RTbUg2ZThDMW1DWk1acWRER3pxeCtLa2JSM1dy?=
 =?utf-8?B?MzdBUzB6V2FLcnFMVEsxZXRjNDduODF5d056Y0ErR1BWcXpsNXpXYnd6NjNC?=
 =?utf-8?B?R05jREdFQzlLNERSTUYrRkIwUHMraDRobXB3VWdPM2ZZazByZStVYWQzOWs4?=
 =?utf-8?B?alRzZXJJS1NwMHAzOWlacVBtUDVnU2s2cC9TTkNqbFIyRU5JazhHRVhHYnpr?=
 =?utf-8?B?MW9ERE9VWDhtb1dSVE5kV0JNTXlMUXYwN2tqL3loZHMyL004VEswZm1vdFFr?=
 =?utf-8?B?cU8vMitQZmdIZjBtaWcwMjI2SUF4dlArZTNWVEE2eU42djZwSFJGMmdYRzJL?=
 =?utf-8?B?TDh0dGxPREFuZnFPVk50MFJ6dWdsUnhDeDlZSmhUa3RIczZPNEtVU3lLZ21w?=
 =?utf-8?B?cmFpTVJxT2h6L0hhZkNBWnd4VVRGSGNEVFRuWk12Q3NlcXpaNk1UNjFKK2hw?=
 =?utf-8?B?VnZEeE1HZzN4VzM5Tk5qQ0VJUTVRVFkxbDdCaFZOMTJneGkxMnFJVlN3dEVa?=
 =?utf-8?B?WmdlOUFvVmdES3h0L1NJZGs4dzlROUMyTnljaE5iQTZ5ZGsrSlUzMFFhdldo?=
 =?utf-8?B?QlZIb2lreDd5VmRnZFN5UkZDQnlLZHlMQzhPVFZ3bnpUSDV5MHU1RUtJYUhC?=
 =?utf-8?B?UjNjKy9Bb1JDMWdSVEJXWVRKQlMzSjcwdjd6bmhHRFY2MFVBaXF4TUlic3M4?=
 =?utf-8?B?bEtTUFk1VVlxdWhMS1BIK2wzVlNpdUtxZGxYMDgzT1JsQVFFK1lqQ25KVUZj?=
 =?utf-8?B?TWNxbVBCZnBOa09hak91Zy9rRUhhVUtOSnEvYlNCa0lmamQzSU9OdzloSldx?=
 =?utf-8?B?R3RnbkhUSXhRdW81UnhSS25YSUNKeHBZRXlPSzRQWUNOWEdHb0Z6aG1tTlNq?=
 =?utf-8?B?YUZzU0NzZEtnbnZKWVYzeUhOSTFpUDZqSXRHSnRRcDVrMXdWUFVLaTVEL2Nm?=
 =?utf-8?B?ektiNWRwa0MxQit5OGpHbXFodktTb1RIdTdSVksrbWVnclZuMFhaV0t0Y1lq?=
 =?utf-8?Q?GG2GlMBunmFOQ?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(35042699013)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 13:11:15.2340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c46a7d-a2c5-4d2d-7d0b-08dc78ce5453
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8991

Pj4gDQo+Pj4gDQo+Pj4+ICsgICAgc3RydWN0IHNobWVtX21lbWJhbmtfZXh0cmEgKmJhbmtfZXh0
cmFfaW5mbzsNCj4+Pj4gK30gYWxsb2NfaGVhcF9wYWdlc19jYl9leHRyYTsNCj4+Pj4gKw0KPj4+
PiArc3RhdGljIHN0cnVjdCBtZW1pbmZvIF9faW5pdGRhdGEgc2htX2hlYXBfYmFua3MgPSB7DQo+
Pj4+ICsgICAgLmNvbW1vbi5tYXhfYmFua3MgPSBOUl9NRU1fQkFOS1MNCj4+PiBEbyB3ZSBleHBl
Y3QgdGhhdCBtYW55IGJhbmtzPw0KPj4gDQo+PiBOb3QgcmVhbGx5LCBidXQgSSB3YXMgdHJ5aW5n
IHRvIGRvbuKAmXQgaW50cm9kdWNlIGFub3RoZXIgdHlwZSwgZG8geW91IHRoaW5rIGl04oCZcyBi
ZXR0ZXIgaW5zdGVhZCB0bw0KPj4gaW50cm9kdWNlIGEgbmV3IHR5cGUgb25seSBoZXJlLCB3aXRo
IGEgbG93ZXIgYW1vdW50IG9mIGJhbmtzPw0KPiBJJ2QgYmUgb2sgd2l0aCBtZW1pbmZvIHByb3Zp
ZGVkIHlvdSBhZGQgYSByZWFzb25pbmcgYmVoaW5kIHRoaXMgYmVpbmcgbWVtaW5mbyBhbmQgbm90
IHNoYXJlZF9tZW1pbmZvLg0KPiANCj4+IA0KPj4gQmVjYXVzZSBpZiB3ZSB0YWtlIHN0cnVjdCBz
aGFyZWRfbWVtaW5mbywgd2Ugd291bGQgd2FzdGUgbWVtIGZvciBpdHMg4oCYZXh0cmHigJkgbWVt
YmVyLg0KPiBXb3VsZCBpdCByZXN1bHQgaW4gYSBzbWFsbGVyIGZvb3RwcmludCBvdmVyYWxsPw0K
DQpXZWxsIG92ZXJhbGwgeWVzLCBtZW1pbmZvIG5vdyBpcyAyNTUgYmFua3MsIHNoYXJlZF9tZW1p
bmZvIGlzIDY0IGluIHRvdGFsLCBldmVuIGlmIHdlIHVzZSAzMiBvZiB0aGVtIGFuZA0KMzIgYXJl
IHdhc3RlZC4NCg0KT3RoZXJ3aXNlLCBhcyBJIHNhaWQsIEkgY291bGQgZG8gc29tZXRoaW5nIGxp
a2UgdGhpcyBpbiB0aGlzIG1vZHVsZToNCg0Kc3RhdGljIHN0cnVjdCBzaGFyZWRfaGVhcF9tZW1p
bmZvIHsNCiAgICBzdHJ1Y3QgbWVtYmFua3NfaGRyIGNvbW1vbjsNCiAgICBzdHJ1Y3QgbWVtYmFu
ayBiYW5rW05SX1NITUVNX0JBTktTXTsNCn0gX19pbml0ZGF0YSBzaG1faGVhcF9iYW5rcyA9IHsN
CiAgICAuY29tbW9uLm1heF9iYW5rcyA9IE5SX1NITUVNX0JBTktTDQp9Ow0KDQo+Pj4+IA0KPj4+
PiAgICBib29sIG93bmVyX2RvbV9pbyA9IHRydWU7DQo+Pj4+IEBAIC0xOTIsNiArMjE5LDkgQEAg
c3RhdGljIGludCBfX2luaXQgaGFuZGxlX3NoYXJlZF9tZW1fYmFuayhzdHJ1Y3QgZG9tYWluICpk
LCBwYWRkcl90IGdiYXNlLA0KPj4+PiAgICBwYmFzZSA9IHNobV9iYW5rLT5zdGFydDsNCj4+Pj4g
ICAgcHNpemUgPSBzaG1fYmFuay0+c2l6ZTsNCj4+Pj4gDQo+Pj4+ICsgICAgcHJpbnRrKCIlcGQ6
IFNITUVNIG1hcCBmcm9tICVzOiBtcGh5cyAweCUiUFJJcGFkZHIiIC0+IGdwaHlzIDB4JSJQUklw
YWRkciIsIHNpemUgMHglIlBSSXBhZGRyIlxuIiwNCj4+Pj4gKyAgICAgICAgICAgZCwgYmFua19m
cm9tX2hlYXAgPyAiWGVuIGhlYXAiIDogIkhvc3QiLCBwYmFzZSwgZ2Jhc2UsIHBzaXplKTsNCj4+
PiBUaGlzIGxvb2tzIG1vcmUgbGlrZSBhIGRlYnVnIHByaW50IHNpbmNlIEkgZG9uJ3QgZXhwZWN0
IHVzZXIgdG8gd2FudCB0byBzZWUgYSBtYWNoaW5lIGFkZHJlc3MuDQo+PiANCj4+IHByaW50ayhY
RU5MT0dfREVCVUcgPw0KPiBXaHkgd291bGQgeW91IHdhbnQgdXNlciB0byBrbm93IHRoZSBtYWNo
aW5lIHBoeXNpY2FsIGFkZHJlc3M/IEl0J3MgYSBoZWFwIGFkZHJlc3MuDQoNCk9oIG9rIHlvdXIg
Y29tbWVudCB3YXMgYWJvdXQgcmVtb3ZpbmcgaXQsIG9rIEkgZG9u4oCZdCBoYXZlIHN0cm9uZyBv
YmplY3Rpb25zIHRvIHRoYXQuDQoNCg0KPj4gDQo+PiANCj4+Pj4gDQo+Pj4+IC0gICAgICAgIHJl
dCA9IGhhbmRsZV9zaGFyZWRfbWVtX2JhbmsoZCwgZ2Jhc2UsIHJvbGVfc3RyLCBib290X3NobV9i
YW5rKTsNCj4+Pj4gLSAgICAgICAgaWYgKCByZXQgKQ0KPj4+PiAtICAgICAgICAgICAgcmV0dXJu
IHJldDsNCj4+Pj4gKyAgICAgICAgICAgIGlmICggIWFsbG9jX2JhbmsgKQ0KPj4+PiArICAgICAg
ICAgICAgew0KPj4+PiArICAgICAgICAgICAgICAgIGFsbG9jX2hlYXBfcGFnZXNfY2JfZXh0cmEg
Y2JfYXJnID0geyBkLCBnYmFzZSwgcm9sZV9zdHIsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
IGJvb3Rfc2htX2JhbmstPnNobWVtX2V4dHJhIH07DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAvKiBzaG1faWQgaWRlbnRpZmllZCBiYW5rIGlzIG5vdCB5ZXQgYWxsb2NhdGVkICovDQo+
Pj4+ICsgICAgICAgICAgICAgICAgaWYgKCAhYWxsb2NhdGVfZG9taGVhcF9tZW1vcnkoTlVMTCwg
cHNpemUsIHNhdmVfbWFwX2hlYXBfcGFnZXMsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJmNiX2FyZykgKQ0KPj4+PiArICAgICAgICAgICAgICAg
IHsNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlINCj4+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gYWxsb2NhdGUgKCUiUFJJcGFkZHIi
TUIpIHBhZ2VzIGFzIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGZyb20gaGVhcFxuIiwNCj4+PiBXaHkg
bGltaXRpbmcgdG8gTUI/DQo+PiANCj4+IEkgdGhpbmsgSSB1c2VkIGl0IGZyb20gZG9tYWluX2J1
aWxkLmMsIGRvIHlvdSB0aGluayBpdOKAmXMgYmV0dGVyIHRvIGxpbWl0IGl0IG9uIEtCIGluc3Rl
YWQ/DQo+IFVzZXIgY2FuIHJlcXVlc3Qgc3RhdGljIHNobWVtIHJlZ2lvbiBvZiBhcyBsaXR0bGUg
YXMgMSBwYWdlLg0KDQpPayBJ4oCZbGwgY2hhbmdlIHRvIEtCDQoNCj4gDQo+PiANCj4+Pj4gDQo+
Pj4+ICsgICAgICAgICAgICAgICAgZm9yICggOyBhbGxvY19iYW5rIDwgZW5kX2Jhbms7IGFsbG9j
X2JhbmsrKyApDQo+Pj4+ICsgICAgICAgICAgICAgICAgew0KPj4+PiArICAgICAgICAgICAgICAg
ICAgICBpZiAoIHN0cm5jbXAoc2htX2lkLCBhbGxvY19iYW5rLT5zaG1lbV9leHRyYS0+c2htX2lk
LA0KPj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFYX1NITV9JRF9MRU5H
VEgpICE9IDAgKQ0KPj4+IHNobV9pZCBoYXMgYmVlbiBhbHJlYWR5IHZhbGlkYXRlZCBhYm92ZSwg
aGVuY2Ugbm8gbmVlZCBmb3IgYSBzYWZlIHZlcnNpb24gb2Ygc3RyY21wDQo+Pj4gDQo+PiANCj4+
IEkgYWx3YXlzIHRyeSB0byB1c2UgdGhlIHNhZmUgdmVyc2lvbiwgZXZlbiB3aGVuIHJlZHVuZGFu
dCwgSSBmZWVsIHRoYXQgaWYgc29tZW9uZSBpcyBjb3B5aW5nIHBhcnQgb2YgdGhlIGNvZGUsDQo+
PiBhdCBsZWFzdCBpdCB3b3VsZCBjb3B5IGEgc2FmZSB2ZXJzaW9uLiBBbnl3YXkgSSB3aWxsIGNo
YW5nZSBpdCBpZiBpdOKAmXMgbm90IGRlc2lyYWJsZS4NCj4+IA0KPj4gQ2hlZXJzLA0KPj4gTHVj
YQ0KPj4gDQo+PiANCj4gDQo+IH5NaWNoYWwNCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

