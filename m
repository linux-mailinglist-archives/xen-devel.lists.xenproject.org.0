Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532549B4640
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 10:58:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827186.1241722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5izl-0000XQ-4U; Tue, 29 Oct 2024 09:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827186.1241722; Tue, 29 Oct 2024 09:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5izl-0000V6-1A; Tue, 29 Oct 2024 09:58:37 +0000
Received: by outflank-mailman (input) for mailman id 827186;
 Tue, 29 Oct 2024 09:58:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7Nu=RZ=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t5izj-0000V0-B8
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 09:58:35 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20631.outbound.protection.outlook.com
 [2a01:111:f403:2607::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b501fc5-95dc-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 10:58:33 +0100 (CET)
Received: from AM0PR03CA0091.eurprd03.prod.outlook.com (2603:10a6:208:69::32)
 by AS2PR08MB9716.eurprd08.prod.outlook.com (2603:10a6:20b:604::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.24; Tue, 29 Oct
 2024 09:58:30 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:208:69:cafe::e1) by AM0PR03CA0091.outlook.office365.com
 (2603:10a6:208:69::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29 via Frontend
 Transport; Tue, 29 Oct 2024 09:58:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.16
 via Frontend Transport; Tue, 29 Oct 2024 09:58:29 +0000
Received: ("Tessian outbound 4a86a9c66651:v490");
 Tue, 29 Oct 2024 09:58:29 +0000
Received: from L2ea9cea10691.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B60B730E-DE7E-4BF2-AA54-9782C2F247CE.1; 
 Tue, 29 Oct 2024 09:58:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L2ea9cea10691.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 29 Oct 2024 09:58:17 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com (2603:10a6:800:1b2::22)
 by AS8PR08MB7372.eurprd08.prod.outlook.com (2603:10a6:20b:448::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Tue, 29 Oct
 2024 09:58:13 +0000
Received: from VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a]) by VE1PR08MB5807.eurprd08.prod.outlook.com
 ([fe80::ee39:f31e:3c63:985a%4]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 09:58:13 +0000
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
X-Inumbo-ID: 5b501fc5-95dc-11ef-99a3-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eDObh0mTWyOPQ4DzeBb6DQLfmAGRD4OSWU1mDsS5MtaAz2onfG/FwgriS0QPqGrXc4tZf4O/jnzEwCQ4YIopbTlta52Vg55tQGbKQL/M/iW33G0wMRIpv6hD87iOGiIz8uOiHrN3ZXoScgbtsdsCnTGgEVIWUyUQHPJyze+qR4uTN10x/+MsG8x1zskxVyzmnqbIbOJEb5JPGNWaAuFIKu5tHni3ZqKGN6yJf9TxN4eLkVJdsHzdnD8I84leO9+xkZNbNpBW5S/M5UnEKZuID+lE3zH6/dTDj4DCq3g57xYP/R/BstB1KfQyE/EuTOm8SkV61G7nDNLG4KN3ZhxMIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv9mSlHCfOj3aiF7pIQMW8iPAsG24KHUU0/YBD2Uhuk=;
 b=Hg9ifLHFbsddk8KbCvQzg+xs0WkUZb4n0HYu6Lz235NU4Oz/Ol3neRVrxTUEeLFMr5T9F9zW/jDsY9NqoM3tSsNE/+ifSUJYalFeF+Y4Vecs8pvoihw4o8zytojuv4XGUj4J2KZxxe159bGYSMIFY4GiVtq1LUAkjJxaFQpueOuVlc9wJhajEhgOKf5ZSL4fO4LRIOO4ZbLX0tZrlN1ooJ1cZuTmnclJBJ3V09zTMmVYGrnyqnMvHQK0UUb3YSBKqWoZLsVRDZeNSRZZ3spIZurRWaO+ahP6E+Og1FFq8DelsvIgrsnRws2zwJgL7YJg8Zns6R3dunRxCJR9/+MzBA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv9mSlHCfOj3aiF7pIQMW8iPAsG24KHUU0/YBD2Uhuk=;
 b=n0HdFn782tWjqY3VTuqI3PmcypAABm+7KMM5L0mZo0aX0xhWFxVb3wjqmSBcLgOZVGi7KHTHKb+GvYnlshZVgQyaOz3/R6dsao76NcpQj+5/OsqRxsb2Vg+5SbkXO0HFKzj70/+PmLaqLhwYeiD5v8Mr79tfro1I0O3iH87n+Dk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 13d515b4710a0db8
X-TessianGatewayMetadata: N9mM649+BMrbSqC/9KtwkSlf2EGgvqAFWk8Oe3PE/6ZqeyBevVMveXtkV5YNTvWzKgXQs01aYF0PNZ46UyiUrypgsSeXM98QbYITN3PsXbHY0+Pyo7O/rcls9bMX+/eHq6sCh0enJbw0SzssLHhtFTu4zigBSJiHIi4Cis/OQ8U=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5JaT/fK03rfwxNx7N3B82lXUG4YhcjvaUx4MrBHiP740KGkAzjP0miQOGmihmoAW1C22EqhItrW+3ITCODwji+TF1NmNjqe+dbtHOzCabvZONZLvMp3tqrQ2lFpZ2x+Sna3g1h5eNXw5B0SBgCxoFTwt6GDiQGj16JAU1askL5VKl7QcTGOk8ZN0pQAnXNbnZRVwJRFzGHJTXHrcEy2g1eD1uPS76QY2fyiMd4QxbCRDNy/PJAtoQeu9jHMl7JHAIEK2mJUw37TLhXaQRjtfhuJliXdmM3S6brmC6SdlT06Am/c0cQjATNoJdzfSQoJeGuKIlZRojSG0WC2nPu6fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv9mSlHCfOj3aiF7pIQMW8iPAsG24KHUU0/YBD2Uhuk=;
 b=Qy2QUyGJ0Vl+MSE5tSrtRzIt3y2CufBWRYIEygiGBiQ9BRLTRnBPxbvm8eKkvtiYFjcytV7ctDPztnSZcNO45FksASE2neQttSKXS7dhtHQu6Tro4OGcHaVYQEoGvzrUltJarLnacMsFF5iAWUdhVyOzOlM58DmoYvL/DbCi/gUnrgslZWTYUt14qYHMF4dbSyNjx0vb1jM+9nKlDj0wQTAP+CXHTWHDM1SIBMUuej/LIyTVihI6hVtgKaKmm31z0Bv6w0t78ZBDEeXu/x6W5Gqjl9d9jVgAm709T3CbF1tINt3duBUnkcd+VNOCUobhuHjVHF8aGFY3RByyC+l93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv9mSlHCfOj3aiF7pIQMW8iPAsG24KHUU0/YBD2Uhuk=;
 b=n0HdFn782tWjqY3VTuqI3PmcypAABm+7KMM5L0mZo0aX0xhWFxVb3wjqmSBcLgOZVGi7KHTHKb+GvYnlshZVgQyaOz3/R6dsao76NcpQj+5/OsqRxsb2Vg+5SbkXO0HFKzj70/+PmLaqLhwYeiD5v8Mr79tfro1I0O3iH87n+Dk=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Thread-Topic: [PATCH v4 6/6] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
Thread-Index:
 AQHbKUc0cm81q6gzakCso/Bn+PcPfLKcQegAgAAr8wCAAPMaAIAAFveAgAADGoCAAASCgA==
Date: Tue, 29 Oct 2024 09:58:13 +0000
Message-ID: <51A0B8FB-DEB7-4131-93E9-C281B8784DE4@arm.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-7-ayan.kumar.halder@amd.com>
 <27be8d00-8260-460e-948d-81418b93662a@suse.com>
 <8fa530cb-4d70-4300-8d4e-1e7208f7c045@amd.com>
 <55728fdc-6247-4810-8696-a999713f4a7c@suse.com>
 <3231cc7b-4c2e-4939-a623-a7b9960d1641@amd.com>
 <5fb1ac28-395c-4065-8a70-4bac809c7f50@suse.com>
 <FF40F41F-D5E1-4EEB-865C-6E447D1CA043@arm.com>
 <0b27059b-a8ff-4dfb-9652-4f040b8aa08f@suse.com>
In-Reply-To: <0b27059b-a8ff-4dfb-9652-4f040b8aa08f@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VE1PR08MB5807:EE_|AS8PR08MB7372:EE_|AMS0EPF000001B1:EE_|AS2PR08MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a2e844b-0d8b-43a6-01bf-08dcf8003d4c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?R05jV2VCWi85UVlkVEdRb2VDMkZteFRNZ3c1eG54aGQxMkI2MzlMcXRFdmhW?=
 =?utf-8?B?MGV5OFh6VnRnYUJpMDBkZm43eC9GZ3ZnNGMrVjVhbW5DN1NkNEJtRG8zNEo0?=
 =?utf-8?B?VTdja0d4Qm12RnFVbUY2NVlqcmZUUWNFbHkwbkhhSHlaSmNjOU92Z1NFZG8y?=
 =?utf-8?B?TVZiSmxZY2NGcUVzeDRuWkdPRzBPVFVuK09oTjhIc2x2WERNRkdXcWMydlVL?=
 =?utf-8?B?TFBTdjIrK08wQzJEb3d6MVBIQ1VyV0RhN2FOVHF4Smsva0pWVm5GbmZ5K001?=
 =?utf-8?B?dFZ6UkY4emFHSnVlKzBVc3ZVY0pNWGg1SzU5eVZVSGt1SEdyNWVuUDFPT25X?=
 =?utf-8?B?aU12RXJlYWhYR3JpQjU5QmtKc1JsM0tDRHhyL0plWVltMTRVTFRBcDFibEl6?=
 =?utf-8?B?QzVyWXhpZkpYRGsycEpVYzNzZVNPWHN2OTdQdWJaM1VCZzdlQzJrbmIyMHM0?=
 =?utf-8?B?OVYwKy9hRndXVkZUVWh0eEtGVURHTGU4QmJzTVFXc1M0VVVHdHBtbmhMS1dG?=
 =?utf-8?B?Z0xuQ2FaWXhrOTk1dnB3ZStJb2Y4NFpMMXRNZG5LTE5XWlIvMkl3K0ZVaVZw?=
 =?utf-8?B?a21wZlY2Y2orNzJuQVU5a0lOYlhtRGRHd2ZtakpvTDRxenZpeXZtbGJ3Qzds?=
 =?utf-8?B?YzJVTWFiOUxHS09vMXVmYnNkeVorK2VjUGc2WE5DbjJnV0gxTjN6ZTE1M1hx?=
 =?utf-8?B?Q2M1QWhzWU9QdkdWSGttWnJmR2RhNHFybWJ1TWc1QUZFWGZrZVpKL0xHcGZp?=
 =?utf-8?B?U3RUV1RFcldkRTBybmpiaDQ3T1VaclZaNzdaR01Id2ZhcGFRMlEvNlRSZS92?=
 =?utf-8?B?QUpDd0U4Mzh5VFl4L0JmeHYzQ1VDRTdKelBUSWZ2M3BZcGtkT0VFbS9zWTdB?=
 =?utf-8?B?cDFGSHR1ajJZQkZScnRJR24rUUNNeXlKQTNSQkpmRnA2cDNOSVVTUWJtRFZV?=
 =?utf-8?B?RHRtOHBndkpMZnowb3owbTR1bEZPKzRJNTFhZDFwSnFOaDhQSGxzcjVzcm5W?=
 =?utf-8?B?VndNd3pLdE1KbXBqcm5sTFErOVlTMVd2WnFoY3VNNzN6em8wQXBPbXVsdnZE?=
 =?utf-8?B?K3JEUGZUSmgyTnpUMVFLNkpFa2NCbUh4QXNjeXRCT3RrRHdnVkVjWW9KTE5D?=
 =?utf-8?B?ZVArU2NKZ0NKZGFjNERhNWZSZHZjVVVNYllkSkVzN0ErTktmc2hqRXpmZEpn?=
 =?utf-8?B?TWtZTjFMcUIrc2N3WE1Qc2h1L3o3ZmpNN1B4U1dlVlZNbzJsSjR4ak4vQnND?=
 =?utf-8?B?UkQvZmhYZkZIbitMUGtXMDlpaHpXVVdVS0dIdE16RklHVU1pMUllTFN5VTBD?=
 =?utf-8?B?aEFtOVBpd095SkRadk1henhxQ0NZdkRhZHlYUGgyZk1wUjJrQlFYSVhkc0g5?=
 =?utf-8?B?NGhweldkT090Zk1IK0dHMXQ2enJLL0pQZzV5aHozZU8xTzVWYVY1c3ppYWU4?=
 =?utf-8?B?UEl4SjV2aE01c2htdGtZNlZRYzJhV01NMXNOS2w3VTdhaFNDbmtPaHdGd1o0?=
 =?utf-8?B?SXFvNVc3YzBpMmU3eDdrT2RmVmtXeGtxUndCeW5lazM4QlBCZEFhRGE3RzJ6?=
 =?utf-8?B?OStsem1Wa1dQaFpkdDdac3dtSnpwbElIYlcySmNBNGRMbllIODdFRVNYdGJH?=
 =?utf-8?B?b1d6UnpETkEzYmcrUW9qUlExTUZBTWdGbFozT0prSWpyVERLdkZtTWhsTnVW?=
 =?utf-8?B?THBNbXBLQW9NTlE0NFNPSlRLR2lyYnN6cjhKTnRSc0diQk5qT3ZGaE5sYVN1?=
 =?utf-8?Q?6Zlng2Uudh3w4IwFZsejRgL7050BXNW3BlkK3AT?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5807.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <31E793E06DA9E74090A06201E8C5ADC8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7372
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:800:1b2::22];domain=VE1PR08MB5807.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37879411-dc4b-4ff2-a600-08dcf8003418
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|35042699022|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2c3dkFLQUVqNWlqWVhTL2ZqQld4ekNySHZrbHFjZzNsQXFScWN3eTd2RXRU?=
 =?utf-8?B?OU5MY2U3cGh5V0RYTlBwT2Frd2Q1bVI5US9wSUpHNWZmeEcvTVdKelowaktr?=
 =?utf-8?B?ZTBiU0RqeWJ5NXhhOHhhRmlOeHBKdk1LMVBKMjJ1enJIakVFY3g0STdoZ1VF?=
 =?utf-8?B?MWlNZml0SG9DUmJFN1hGcGoyaHhxbkxqRUJScWFWMmdWZklIVXJyZ0xKc1pw?=
 =?utf-8?B?c0NtckZZbmppYVZpRmpTb3B4RVhyY2FGM09adDBXUHRiTm1MeHFhQUJSN09Q?=
 =?utf-8?B?VHk5c0JGUkdtVFZ1RnBiakF2bjd1MlBrMTRhd2pvSWFsejl3Ykl2VDNnRlJV?=
 =?utf-8?B?T1dINjFDZ2hjUTBJN3FJdjl4SVQwamNJcGVtUVFkc1BCZjRTZW5BNVBUK1I4?=
 =?utf-8?B?Z29LbE1md1V2S3V5NDJhN0p3Si82V2xjekt3eFhwY21aRE9PT21mOUJ3dkxY?=
 =?utf-8?B?R1JoQmp0bk5wSXA0RHZON2xKSU1ZenBrWnh2aVBZUnc3MjJwTExka0F5aFZH?=
 =?utf-8?B?dXl3RVB1WnBtdXo0NFRmaVJadnJkVW1Vb21EVE42d3U0eHAyVlhWQTZMbG9r?=
 =?utf-8?B?d25aazNWOFUxcjlSZlRFSFVWaTlZOEprc3RmTEY1UGM4eXBFdE5TQUp4c2Jw?=
 =?utf-8?B?T1NGUUE2azhrMDlVTXJIa2QwVGduR2xuS0o0ZTZCK3lCczhWNG13WDZCMWNk?=
 =?utf-8?B?Tjd5TldsT21YL2R3cHZpNys5UFBEYTlXVDEyZTduWUpnc3FYMllPRUo3Mm9h?=
 =?utf-8?B?M25UekFiUjlValV6akxKclhFc21jWDA0V1BPdUhxSHpEYTJlM1M4c1BHUVlx?=
 =?utf-8?B?a0cwK2diZTRvWHVPR0VhTEdOeVBJZDR5VWJwb2FEUVk3NnZJZjB2ektZa21G?=
 =?utf-8?B?bVRJd3hxaHRqbnNPR1h5aUJ4NkwybjV3UXBjcHltcStPZTJNalZXa2dubWRy?=
 =?utf-8?B?TmZBRUNGRUxIUURTSU50enRRajA0bGMxT3JoSnQyY0drTmJtbGcvV3hGc1pt?=
 =?utf-8?B?R0R1aXRPZTlmVzRhcGNTU0xjdE5IMSt1aGtIN0MyUFI4OEpEWWZ6cHFvaU1x?=
 =?utf-8?B?dUt2KzUxY2g2YUs2S0d0cEpLeU1PbVNOZlhpWjBpTWtjaDgrNFhFTU43WEdm?=
 =?utf-8?B?SVJTQnFWKzFVOFViZjlVYy84eCtlbnNPaVA2ZG5qWXlXR0d6SFBjOHZhcVMy?=
 =?utf-8?B?bTE3NWFtenA5ZDk1eVQ1ZWxaZkFJdjVrUTJ0MHdXSTQ0N3FhUGhLdjFEQlJM?=
 =?utf-8?B?YlR1L2xURXJHVFBjRXU1djZ0czRaWDl3eVFoR3hlUWRXSzRjMVRKZExzZFV4?=
 =?utf-8?B?bGRzYW5wb0JyT2RjOWxDQlUzMlFyY01ZWWR3L1BNclR2Y2F0ak1Wb2ZsemM5?=
 =?utf-8?B?NW9XakhEK25tZUFsbkwyMStienplVDJNOHA3S3VkOHo3YzRxUGpEbG9aRElL?=
 =?utf-8?B?ZFJxWW50dExnLytWaGpDM0o2OHRmTWx6K1p2WEROOE1aOElhMTdWRXNMd2V0?=
 =?utf-8?B?K2w1cHRvMnVvUzN6bC9lcExyRmxSN0RUY2ZKdFdwSlh1enNTMjB3WUdYcWxT?=
 =?utf-8?B?VU8xYUZTa1ZoU3hoeHgwenk5VjZRUFRPVUcvUlVwUWlOUzlWN2VPQi9NZ0dX?=
 =?utf-8?B?OHgwODEzQXh2MTN0ajRYNFdIZkw0bmJTZXN3SC9hZVpSTGlBbUFUVzNjd3JW?=
 =?utf-8?B?K3J2dVhWenlPVDVWQzRaYkpUQlJKT3pnNk5JTTM3d0pTbENKbnREaUMvY0tX?=
 =?utf-8?B?b1pmendQRWVINXNkbVZPeHlPUVhWdi80S2kzUEFSRHZSYnBBNVBjUXpTOEFX?=
 =?utf-8?Q?qSEQxwWXW1PPRbmA97IJzpwEmMz+5Pse+cLUc=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 09:58:29.1066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2e844b-0d8b-43a6-01bf-08dcf8003d4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9716

DQoNCj4gT24gMjkgT2N0IDIwMjQsIGF0IDA5OjQxLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjkuMTAuMjAyNCAxMDozMCwgTHVjYSBGYW5jZWxsdSB3
cm90ZToNCj4+IEhpIEphbiwNCj4+IA0KPj4+IE9uIDI5IE9jdCAyMDI0LCBhdCAwODowOCwgSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+PiANCj4+PiBPbiAyOC4xMC4y
MDI0IDE4OjM4LCBBeWFuIEt1bWFyIEhhbGRlciB3cm90ZToNCj4+Pj4gT24gMjgvMTAvMjAyNCAx
NTowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAyOC4xMC4yMDI0IDE1OjM5LCBBeWFu
IEt1bWFyIEhhbGRlciB3cm90ZToNCj4+Pj4+PiBPbiAyOC8xMC8yMDI0IDEyOjU1LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMjguMTAuMjAyNCAxMzo0NSwgQXlhbiBLdW1hciBIYWxk
ZXIgd3JvdGU6DQo+Pj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC9LY29uZmlnDQo+Pj4+Pj4+PiArKysg
Yi94ZW4vYXJjaC9LY29uZmlnDQo+Pj4+Pj4+PiBAQCAtNiwxMSArNiwxMyBAQCBjb25maWcgUEhZ
U19BRERSX1RfMzINCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gIGNvbmZpZyBOUl9DUFVTDQo+Pj4+Pj4+
PiAgCWludCAiTWF4aW11bSBudW1iZXIgb2YgQ1BVcyINCj4+Pj4+Pj4+ICsJcmFuZ2UgMSAxIGlm
IEFSTSAmJiBNUFUNCj4+Pj4+Pj4+ICAJcmFuZ2UgMSAxNjM4Mw0KPj4+Pj4+Pj4gIAlkZWZhdWx0
ICIyNTYiIGlmIFg4Ng0KPj4+Pj4+Pj4gIAlkZWZhdWx0ICI4IiBpZiBBUk0gJiYgUkNBUjMNCj4+
Pj4+Pj4+ICAJZGVmYXVsdCAiNCIgaWYgQVJNICYmIFFFTVUNCj4+Pj4+Pj4+ICAJZGVmYXVsdCAi
NCIgaWYgQVJNICYmIE1QU09DDQo+Pj4+Pj4+PiArCWRlZmF1bHQgIjEiIGlmIEFSTSAmJiBNUFUN
Cj4+Pj4+Pj4+ICAJZGVmYXVsdCAiMTI4IiBpZiBBUk0NCj4+Pj4+Pj4+ICAJaGVscA0KPj4+Pj4+
Pj4gIAkgIENvbnRyb2xzIHRoZSBidWlsZC10aW1lIHNpemUgb2YgdmFyaW91cyBhcnJheXMgYW5k
IGJpdG1hcHMNCj4+Pj4+Pj4gSSdtIGFmcmFpZCBJIGNhbid0IGVhc2lseSB0ZWxsIHdoZXRoZXIg
TVBVIGNhbiBiZSB1c2VkIHRvZ2V0aGVyIHdpdGggYW55IG9mDQo+Pj4+Pj4+IFJDQVIzLCBRRU1V
LCBvciBNUFNPQy4gSWYgaXQgY2FuLCB0aGUgbmV3IGRlZmF1bHQgbGluZSB3b3VsZCBuZWVkIHRv
IG1vdmUNCj4+Pj4+Pj4gdXAsIGFzIGl0J3MgdGhlIGZpcnN0IG9uZSB0aGF0IGhhcyBhIG1hdGNo
IG9uIGl0cyBjb25kaXRpb24gd2hpY2ggaXMgYmVpbmcNCj4+Pj4+Pj4gdXNlZC4NCj4+Pj4+PiBN
UFUgY2Fubm90IGJlIHVzZWQgd2l0aCBhbnkgb2YgdGhlIGV4aXN0aW5nIHBsYXRmb3Jtcy4NCj4+
Pj4+IFRoYXQgaXMgLSBxZW11IGNhbid0IGVtdWxhdGUgc3VjaCBhbiBlbnZpcm9ubWVudCwgaS5l
LiBldmVuIFFFTVUgYW5kIE1QVQ0KPj4+Pj4gZG9uJ3QgZ28gdG9nZXRoZXI/DQo+Pj4+IA0KPj4+
PiBRZW11IGhhcyBzdXBwb3J0IGZvciBBYXJjaDMyIE1QVSBhdCBFTDIgYW5kIEVMMSAoaWUgUjUy
KS4gQXMgZmFyIGFzIEkgYW0gDQo+Pj4+IGF3YXJlLCB0aGVyZSBpcyBubyBzdXBwb3J0IGZvciBB
YXJjaDY0IE1QVSBpbiBRZW11IChpZSBSODIpLg0KPj4+PiANCj4+Pj4gRXZlbiBmb3IgUjUyLCBJ
IGNvdWxkIG5vdCBnZXQgdGhlIHVwc3RyZWFtIFFlbXUgd29ya2luZyAoZW11bGF0aW5nIHNvbWUg
DQo+Pj4+IEFybSByZWZlcmVuY2UgcGxhdGZvcm0pLg0KPj4+PiANCj4+Pj4gSSBjb3VsZCBnZXQg
dGhlIFhpbGlueCBmb3JrIG9mIFFlbXUgKGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngvcWVtdSkg
DQo+Pj4+IHdvcmtpbmcgd2hpY2ggZW11bGF0ZXMgQU1EJ3MgU29DIHVzaW5nIFI1Mi4NCj4+Pj4g
DQo+Pj4+IEhvd2V2ZXIsIHRoaXMgc2hvdWxkIG5vdCBpbXBhY3QgdGhlIGN1cnJlbnQgcGF0Y2gu
IFRoZXJlIGlzIG5vIFFlbXUgaW4gDQo+Pj4+IHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvKi4NCj4+
PiANCj4+PiBBaXVpIHRoYXQncyBub3QgcmVsZXZhbnQuIFRoZXJlIGlzIGEgUUVNVSBpdGVtIGlu
IHhlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZy4NCj4+PiBJIGNvbnRpbnVlIHRvIGZhaWwg
dG8gc2VlIHdoeSB0aGF0IGNvdWxkbid0IGJlIHNlbGVjdGVkIHRvZ2V0aGVyIHdpdGggTVBVLiBZ
ZXQgaWYNCj4+PiBpdCBjYW4gYmUsIHlvdSdkIGVuZCB1cCB3aXRoIGEgZGVmYXVsdCBvZiA0LCBu
b3QgMSwgaWYgaXQgYWN0dWFsbHkgX2lzXyBzZWxlY3RlZC4NCj4+PiBBbHRlcm5hdGl2ZWx5IFFF
TVUgKGFuZCBtYXliZSBhbHNvIFJDQVIzIGFuZCBNUFNPQykgbmVlZCB0byBiZSBtdXR1YWxseSBl
eGNsdXNpdmUNCj4+PiB3aXRoIE1QVS4gSG1tLCBsb29rcyBsaWtlIHRoYXQncyBhbHJlYWR5IHRo
ZSBjYXNlLCBieSBwYXRjaCAyIHN1cHByZXNzaW5nIHRoZQ0KPj4+ICJQbGF0Zm9ybSBTdXBwb3J0
IiBwcm9tcHQuIFdoaWxlIHRoYXQgbG9va3MgZnJhZ2lsZSB0byBtZSwgSSdtIHNvcnJ5IGZvciB0
aGUNCj4+PiBub2lzZSB0aGVuLg0KPj4gDQo+PiBBcmUgeW91IHN1Z2dlc3RpbmcgdG8gbW92ZSAi
ZGVmYXVsdCAiMSIgaWYgQVJNICYmIE1QVeKAnSByaWdodCBhZnRlciDigJxkZWZhdWx0ICIyNTYi
IGlmIFg4NuKAnT8NCj4gDQo+IFllcy4NCg0KTWFrZXMgc2Vuc2UhIA0KDQpXaXRoIHRoYXQ6DQoN
ClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCj4g
DQo+IEphbg0KDQo=

