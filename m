Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F19A33C80
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 11:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887321.1296841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiWKu-0007z8-SH; Thu, 13 Feb 2025 10:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887321.1296841; Thu, 13 Feb 2025 10:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiWKu-0007xb-PF; Thu, 13 Feb 2025 10:20:48 +0000
Received: by outflank-mailman (input) for mailman id 887321;
 Thu, 13 Feb 2025 10:20:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qxZs=VE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tiWKt-0007xV-Lv
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 10:20:48 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f81170a-e9f4-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 11:20:45 +0100 (CET)
Received: from DU7P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::9) by
 GVXPR08MB10541.eurprd08.prod.outlook.com (2603:10a6:150:158::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.12; Thu, 13 Feb
 2025 10:20:40 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com (2603:10a6:10:552::4)
 by DU7P189CA0003.outlook.office365.com (2603:10a6:10:552::9) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.13
 via Frontend Transport; Thu, 13 Feb 2025 10:20:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.10
 via Frontend Transport; Thu, 13 Feb 2025 10:20:39 +0000
Received: ("Tessian outbound c2a0e6651601:v567");
 Thu, 13 Feb 2025 10:20:39 +0000
Received: from L92166c142c65.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 564C49FF-74B6-48B8-BDBB-20662178FB76.1; 
 Thu, 13 Feb 2025 10:20:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L92166c142c65.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Feb 2025 10:20:33 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAVPR08MB8919.eurprd08.prod.outlook.com (2603:10a6:102:324::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Thu, 13 Feb
 2025 10:20:30 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%2]) with mapi id 15.20.8445.011; Thu, 13 Feb 2025
 10:20:29 +0000
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
X-Inumbo-ID: 2f81170a-e9f4-11ef-b3ef-695165c68f79
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z16F756pew0YVhrZeVj2WaEHZ2fsC7ERNWWjTW6PL2hRMe8QVMIx3rpKQNTsfTtxYvZ2BUhbqdv5PjLYkCQPsvuU4233OWJ4yGtgLPQ4ISEdyrtQ/OCywPoxmRkJYdkBoR7nk69wEny6cjVwxF+exHa0W+RPnWmAusfy5fKsdxJcvMAcA/O5dysn4pH6DtaRRR9oYaNunST3AmKKbCgF1stI3Bm1hC/Lk8Fi74k4sKjzFdENKneLiSfay5/U1B4OSAQepiThpcvInayxxsVj3bRBeEqkTB1QwJgmbCb7wcBH3HtMYQpbdaDeoPJnzUv5WCBmZ5fGvKHFMx83NfBDGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0q2INw4wGjzYyiRoYPajrAIWZa0EoCr2/dWb+WbSXU=;
 b=SL7Sr8lGoOW6kja+TA9DaOfqkr0ZV8alQ4HMiPNNrExGGeOPdyuy/u+9TNWhHsVU3awSPY7G+V1QbCzgQl5UBruyU8Msz0ySrcTKgkY6L+MqrBYSweHiQgDA2Yfzhu5a09cxBybax+6mbiDOMzInbEa/JfSifcc2+P7K5ptPcZbgTP43grgpAAmhKsTHXoONuySqginjNxrx2zCjNs5AUpC3F3WhoyQrHDUEHpdp0gpbJjAgBWFLvxZsAOvoqPsOqRYWTcx97XusBJf7RXlRPIbU4vBKYfQeMB98xHKBpXLqeqWlf938iFPjXSFYyVgD0d678xttrwyU2xQXJcwDGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0q2INw4wGjzYyiRoYPajrAIWZa0EoCr2/dWb+WbSXU=;
 b=TBqoM31kmxx/EoV++M/4IQgMVUY83Uzd5+SFMfVZgYDT4EWPP5LlRUPxd+eQhjkKmq3HLOSdot+9GtG01z4sKmzKw6O6BD0v4hLpkaKz/TMmJMKsTeInLr3eZ3qPXL3EzFny+F7qBx30FeY+u/UrNnjujGmSuXpfLzytmQa84zQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 78bf29ae41d749eb
X-TessianGatewayMetadata: s/lvSnI4/NIS/7Bh+MXHpf3H2oS7sgUrFyB+/JmFwRk+SWH6ySKkc3lsJA+KeSV/ec2bhkFzshXTEiOGUS51DIkWx2TukaalkifL3n3P7YhBS0/heR4s0WNFv5n4NFr6a3sYO4YQz+6mghf0hMKTWNwIbxtEKXNdrfRvRHhW0b8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wbR25KCUTZWznKkUfYckJ1X1yUWr/mytiapO42R14PENvXCJ7xjEvk1g3qlebj3K9MBfyLKiy9986MfMctfVyNH+k+nAYw+07BaDXNatzOpuNsrXzJu0Oot0/M6U3d/Ut0NpLlVKMW05AtAs009ZrOYmKbQpooL0jqk56EFM4c/kFSs6YleOGk/Ij5iGXTVR0X+2WaqWRtiDY1g4Q5VCBhcnXbXu+GyuKy22TXm8DjVngoMYN1s+EW15jhyw8zxNlf8Es3oue0rkeA+Ril9ZDzL3J+YQaWu6uqLXzR68oyvCwG3++aFcdkRpLCTikL7MobPK62sLV1zd6X4davodZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0q2INw4wGjzYyiRoYPajrAIWZa0EoCr2/dWb+WbSXU=;
 b=ce5uzUM7k1Cjmxm7QhGcZlByj7K0/mTXeImsQPX8YQW2k7EH5LyurhVX/yZop4v+VcrSw9MxHLiY3AqJndcldwt9Sr+5fbfWQMD/KEtKm0+CC9QdPetFNP62lJqudewIXgX50i89qnR4Ah4Fo0zR6jLzkInFy6jEE/nqtIyEDM0nzk+4ZWCjhVTQNauFxOaRhoDbW5yMMoqsXaGXunojyhHnZI6k+SgyxgMrIYXe6g3DobdVDDotfDBziFhLAMNu1b92r2SLY++/nFBdLIH8ZiR3DQzgk41wdnlLzJdJzqb/dS7btb/scARm0/gE2oM95DTHZeLZ3IFNziC7C1Ozvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0q2INw4wGjzYyiRoYPajrAIWZa0EoCr2/dWb+WbSXU=;
 b=TBqoM31kmxx/EoV++M/4IQgMVUY83Uzd5+SFMfVZgYDT4EWPP5LlRUPxd+eQhjkKmq3HLOSdot+9GtG01z4sKmzKw6O6BD0v4hLpkaKz/TMmJMKsTeInLr3eZ3qPXL3EzFny+F7qBx30FeY+u/UrNnjujGmSuXpfLzytmQa84zQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] xen/arm: Move early mapping operations to new
 function
Thread-Topic: [PATCH 2/2] xen/arm: Move early mapping operations to new
 function
Thread-Index: AQHbfS8+dm16q6nrp0GkauzwoWX70bNERcyAgADBgYA=
Date: Thu, 13 Feb 2025 10:20:29 +0000
Message-ID: <CECDEFE3-44A3-4280-92F1-ECC8626F20D9@arm.com>
References: <20250212091900.1515563-1-luca.fancellu@arm.com>
 <20250212091900.1515563-3-luca.fancellu@arm.com>
 <935df716-15d1-4a3a-b41b-410173befadb@xen.org>
In-Reply-To: <935df716-15d1-4a3a-b41b-410173befadb@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAVPR08MB8919:EE_|DU6PEPF0000B621:EE_|GVXPR08MB10541:EE_
X-MS-Office365-Filtering-Correlation-Id: e07e9c4e-91c4-43de-b6b1-08dd4c18109c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TjI1MUpLczdFWUp2emNGQ01VeWlXdS9iM0pxNzAraUE0WGhQM09yYit0K0h5?=
 =?utf-8?B?NE1ra3ZjclVwZk85cEJOYXdpcEk5MnVWaGNmOUdHMjd0bDdkYnRPQ0E2SThC?=
 =?utf-8?B?Z0NtcUJEeEw3N1dMMENoTFlZYVZUaEJXZStONmVJd0dkRzJpZjlMNENOZ2RX?=
 =?utf-8?B?RHRSZTRYMW03QnJwb2RZaElEN0pRcUdnM3lZNW1aMWZqaXlsU3JlS3Q0VzZs?=
 =?utf-8?B?emtBUE9ETmZmcVdhczEzakdsT25FQjdUVCt3QUtoUWttdHloMVhnZVNqVWhF?=
 =?utf-8?B?QUNRZXNIZnZpaGJHb3NIQzFsaFZlRXA4a3pEQmJnUjlEQkh0TkJlZFdyTWhU?=
 =?utf-8?B?WkxxU3k4REdFMlJvaDFTZTJIcGtYeFMzQThmOE0vOEN2cWhySmJ2anB6YVl1?=
 =?utf-8?B?dERSbzBNbHVLaUh3ZFRUdkU4VVVwUjJBUWZlYjFmTDUveHdLTDVJTC9jcTBS?=
 =?utf-8?B?MXByVmFuZ3VNSXREL1U3d1h0ZVY1ZWJna3BTa093SVd2NVFpYTRUMWUrMVhv?=
 =?utf-8?B?TS9DdWJEM0xPYlhwMlExT01JRDhSK1NZRXdGYm1JL3JzSkNJNk9odENFdkNJ?=
 =?utf-8?B?THF1QWNkdVpoS2JtRWRYeEs1M05Vb2t3ZDJQUFhhekdNOWNRMnlDSlgyd2pp?=
 =?utf-8?B?R05vTExSVWJiTWpDczlpdVFSK2lmNlBKV0dUakFkVEw1ZVlkWjRieGJJdzRw?=
 =?utf-8?B?WXRwamM0VnZ0bVRKamJBRXBXc1oxUHZ6QS9HNFM2VGZWRDBQZ2ptb1JEWGlZ?=
 =?utf-8?B?dUZoYUluTWZReW4yM05Hekp5TGpreGZwdlFBZW5UTUVZQzQzcE5paFlSRU5w?=
 =?utf-8?B?R0tiWFpCcE1TdkZQL1pUNThGMm1wdVcwVXZ0SzFqOG9NbEZPMEF4OWphcU9q?=
 =?utf-8?B?N0ZZNVMwcXBoZ0NlM2xhWDV4OEJvUGdubDNodTBwK3UwRUtPQTlZaGkyMUE2?=
 =?utf-8?B?K2dmOWRyVzl2WGE1cmhzeHptL0I1bjlXdzJkaDBsdmw0WXBFRFZFZnNxa2FD?=
 =?utf-8?B?UlNqNDJremF0VmlpVVdZNzRTaGNNTnozU3NXOERodUt5V1V3L29rQnh3L21B?=
 =?utf-8?B?eDBveldnRU5GdEUzajBnUkZXck5qMTFmaEI4RUgyd2FxREJuMVBhK0tCRTFX?=
 =?utf-8?B?dUlDZ1NRSHVTVjlKc1c5b3VYNHh1N1Zna0RqNS9JZlhPMjQrVUQ4ZmZkVy9L?=
 =?utf-8?B?U3AxWktXT2lYbGFxTmlrYnVzUmo3akttcXU1OGYrTGZXbWdaMEg5aGdRZ1Qw?=
 =?utf-8?B?WnphVXpzTDhvWGhqMW9BK3ZmVjVyUnc0RmFZNkZkT053R2RwWGpKak9QSnY4?=
 =?utf-8?B?MzlBcTdRcnIxUUpGRjZTZUVLa3lHUGFoc1ZZVDV0bkNhUXdXUW54NzRFZGMy?=
 =?utf-8?B?Zkd5dUFPU3MxMXJieER0eGk3ODdsTksxQWVWK2E0di9jUkVwZms4Y21xOGxQ?=
 =?utf-8?B?WXpHZ1puT2w3TUJ6U1NkUzlkK1lha2F4TjVNaFE1UEhYdVRZZVY2bGcrczJM?=
 =?utf-8?B?OGNLWTN5R21XcWY5WGRqUVRwbzRyaXk0c1h1WndiSVJiV1E0MUdETWxPRU5r?=
 =?utf-8?B?TG5EM3kralJtcVZtcGNpRkZuckpiUDdWbHZjLzJYc1JFMWZ4R3orUXU1RXIr?=
 =?utf-8?B?dlduYmwwUS8vT3ZjVThVZ0hZV0xZbFNrakJ6Ymwwem9QSlNzL1RMRXFvR0RU?=
 =?utf-8?B?TDduR3RQakQvNEIrY0xEbDhJOE1yWTQ4RUNUaUlFQXpRNCsvMTNFMUpJalNL?=
 =?utf-8?B?eTc5SGxZa2xQVm1UMlFJWlgrcHNPVldtUGNVei9XRnpjTXNGUVNTL0FGcXBE?=
 =?utf-8?B?SXJEbm50eHE2N3JvRmltWGlKVUwvQ2JBQ3NNcGVqeU5ScWlqczdSOENpZU80?=
 =?utf-8?B?TzhCalR2WGxyZ1JSNnpIMkh6aXV0TGZWK2Y2bEVYSDJQU3NxMWlOTm9IYnJK?=
 =?utf-8?Q?EszURml4VgFXivpIyRoDNBHLZsMjDDpk?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <821626DA17C9DB47864909B03CFB3F82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8919
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3406f22-3e81-47ca-a2f9-08dd4c180a5d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFFIOVRjM2ZSalVKeHJuRGoxa1h5bEowR0pPYkRBaUFKYjdPYy82Ylp1d3Zo?=
 =?utf-8?B?L3ZiM0RCQnpFaEluYlRweU5FWmpTVDN2VUhOYnlkbGpuL3dwc0Fjb1FPNzJX?=
 =?utf-8?B?cUROZlpoQTArL3VnQitRb0dsR2tVRmVoTmhidjZwS0hDQjJ6WkR4bEgzV3Z6?=
 =?utf-8?B?eFIzSEsvRWFNN01rOWVhRjhuaXZXNWltd09FWnRtZk51K1JxdzQvZmRCdm5N?=
 =?utf-8?B?ZE82M3ZKQ2c1dThadzhFMHhuMlQvMWgxOWsvVGJXOFBFZHcyUEtoSFdwRUFv?=
 =?utf-8?B?YmtLTjlFVnNBTXZCM1RhMEFzb3BWRW1rVlpwbmZQTk1pVVVHbGhLZlJlYitn?=
 =?utf-8?B?S3BkenI2YkR2cGFBZC92OFBzRzhZd21RUklMNUI2QjZwWXNVelp4NXJUMDNJ?=
 =?utf-8?B?WnRKV2JkWWhxcDFyb3p1MWVhRld5UUJ1cVppRE1FdEhER0V6SWkzU2xqOXFw?=
 =?utf-8?B?U0xHd2c4WXhISm9yd1lsQi9SV2Zld1crVWh0bGNmcjhOM1J0SE02R2NyeExn?=
 =?utf-8?B?S1ljVWVXUmVpeUFOdUt6QTZicUtaRW9VaHM2aTNhMEU4cDc4SU9mbVNnQ2gr?=
 =?utf-8?B?SE5hVEpmaUx2UE5MVGYyc0NiS3hvYzkwb0xLT1FKVmZpa0JEWGl0NGNqLzg1?=
 =?utf-8?B?NHc4RWt3QTRUd1IyMS85d2d5cXMzblo4MExwRTc4eldjS1NzYjBtTTN6Tll6?=
 =?utf-8?B?eThqZ01Ja2NDMm9VVTVUUC9KRnpwd1E1aktZcWozYkZ5U29rRHBYWjA2K2cy?=
 =?utf-8?B?VUtCWVl5QVNBa0lNSlVZeno1clEyMktpOXlhQ3QybkxuK3VtUi9NdjNiWmln?=
 =?utf-8?B?cDVtb1dFM0dtTDFnTkRnZkNuK3VmYlhVWVJZR0RNUUZLcHliQkdmdHZkeFRo?=
 =?utf-8?B?VE1uZGR4L1duc3hpMjBIL0owK2NLNnhpRTB4OVB1czdxcnlaQVFQSWt5Q2xE?=
 =?utf-8?B?N3haOHcvbFNlZ2tPajZDcXlDMGE4V1BTeGdiRmhLVDB0bFEyaEYvTGswNkdy?=
 =?utf-8?B?dVNRam80WmJ2TnJkcDNMaisvYlBkYW0zc2s3ZGlZUm1RU2FQQmZzSmpTRnp0?=
 =?utf-8?B?NjJQZktTaGxNRWVJTy9uQ0w3S29IaGZRTVRiUWptc2laTWtGVXcrSTRNQ3py?=
 =?utf-8?B?aGFCZUd2T2V3bEEwNTh4b1ZsbHlzd0tJZHNETjQ3ZXdlcTMwSFdyaktjMVBw?=
 =?utf-8?B?SHBjWGZvbCsrWUNRdFRpR3hLL3NhcnFRWnhScjF4emY4TU40MzNZa1BTdTg1?=
 =?utf-8?B?NmF1WGkzaDd3UmFUMGN3SytwcDBKKzU3WFloZ3JGVkZRRUtsbk0rOTd1OVB5?=
 =?utf-8?B?RjJDSkcreVo1ZTlkVy9mazFxZFdSSEFGM3hUR3doZTRxTHA4a2tCNmExbW11?=
 =?utf-8?B?bHF0YVBkby9IaS9UeEtnTUlONitFT2piMElCY21SZHBNTWVmcldPMVd0MTQ0?=
 =?utf-8?B?V2lsNDVaMUxiRTNKQ2dMSUt5L0Z5WmFMakV5aFNuOG9LLy85MG5DdXBiQ3Zz?=
 =?utf-8?B?R0tPTEFibUR2SkQ4OHVQZzlHTmNzUDNQcWFDMXhTUGlhVG1aSEQ1KzdHSTBx?=
 =?utf-8?B?MWRyTHBUU1lZN1d1bGcycWR1QWVQWmN3RGhzN0hackpGdFRvOUVJb3A0dVdv?=
 =?utf-8?B?b2FkcmhadG9aVHlGdFNtZnh3cFdhdkRoeitUdHJyZnRpSEhobEh6ZGdPWUp1?=
 =?utf-8?B?T012UGgxTFl6OHFoZU9tWnA2ckZJUXNYQnlMcklRN2cwNVo0NEJ5WC8xV2d2?=
 =?utf-8?B?c3A0SUwzQ0kzODVqbU1oM3pLdDRNZEx2R3hKZnVmamljMEd5S3FRVy9lcFVz?=
 =?utf-8?B?SlE3T2pWR0RLbmlLaWR4bWx1UUIwMTV6b0F0K2JIMGM5Z1RlLzVXQ3hZVTZm?=
 =?utf-8?B?RFZ5RjF5cnB5eVdzTVZieW9tU0R2YmxpWDQyUTNtWS9CdHpiWmRWdnY2ZlRz?=
 =?utf-8?B?cTFrK2QwQWlnbU5MaTNTYVJtZkc5N1Z0cW1STmJOV3lDMHRFbUFtWnNZelN6?=
 =?utf-8?Q?tKLQjfpFB2u9L/8x34cr0Fl5yhDbrw=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 10:20:39.8110
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e07e9c4e-91c4-43de-b6b1-08dd4c18109c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10541

SGkgSnVsaWVuLA0KDQp0aGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+PiAgK3ZvaWQgX19pbml0
IHNldHVwX2Vhcmx5X21hcHBpbmdzKHBhZGRyX3QgZmR0X3BhZGRyKQ0KPj4gK3sNCj4+ICsgICAg
Y29uc3QgY2hhciAqY21kbGluZTsNCj4+ICsgICAgc3RydWN0IGJvb3Rtb2R1bGUgKnhlbl9ib290
bW9kdWxlOw0KPj4gKw0KPj4gKyAgICBkZXZpY2VfdHJlZV9mbGF0dGVuZWQgPSBlYXJseV9mZHRf
bWFwKGZkdF9wYWRkcik7DQo+PiArICAgIGlmICggIWRldmljZV90cmVlX2ZsYXR0ZW5lZCApDQo+
PiArICAgICAgICBwYW5pYygiSW52YWxpZCBkZXZpY2UgdHJlZSBibG9iIGF0IHBoeXNpY2FsIGFk
ZHJlc3MgJSMiUFJJcGFkZHIiLlxuIg0KPj4gKyAgICAgICAgICAgICAgIlRoZSBEVEIgbXVzdCBi
ZSA4LWJ5dGUgYWxpZ25lZCBhbmQgbXVzdCBub3QgZXhjZWVkIDIgTUIgaW4gc2l6ZS5cblxuIg0K
Pj4gKyAgICAgICAgICAgICAgIlBsZWFzZSBjaGVjayB5b3VyIGJvb3Rsb2FkZXIuXG4iLA0KPj4g
KyAgICAgICAgICAgICAgZmR0X3BhZGRyKTsNCj4+ICsNCj4+ICsgICAgLyogUmVnaXN0ZXIgWGVu
J3MgbG9hZCBhZGRyZXNzIGFzIGEgYm9vdCBtb2R1bGUuICovDQo+PiArICAgIHhlbl9ib290bW9k
dWxlID0gYWRkX2Jvb3RfbW9kdWxlKEJPT1RNT0RfWEVOLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdmlydF90b19tYWRkcihfc3RhcnQpLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKHBhZGRyX3QpKHVpbnRwdHJfdCkoX2VuZCAtIF9zdGFydCksIGZhbHNlKTsN
Cj4+ICsgICAgQlVHX09OKCF4ZW5fYm9vdG1vZHVsZSk7DQo+IA0KPiBEb24ndCB5b3UgbmVlZCB0
aGUgY29kZSBhYm92ZSBmb3IgdGhlIE1QVT8NCj4gDQo+PiArDQo+PiArICAgIGNtZGxpbmUgPSBi
b290X2ZkdF9jbWRsaW5lKGRldmljZV90cmVlX2ZsYXR0ZW5lZCk7DQo+PiArICAgIHByaW50aygi
Q29tbWFuZCBsaW5lOiAlc1xuIiwgY21kbGluZSk7DQo+PiArICAgIGNtZGxpbmVfcGFyc2UoY21k
bGluZSk7DQo+IA0KPiBJIGZpbmQgY29uZnVzaW5nIHRoaXMgaXMgcGFydCBvZiBlYXJseSBtYXBw
aW5ncy4gU2hvdWxkbid0IHRoaXMgYmUgcGFydCBvZiBjb21tb24gY29kZT8NCj4gDQo+PiArDQo+
PiArICAgIGxsY19jb2xvcmluZ19pbml0KCk7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAq
IFBhZ2UgdGFibGVzIG11c3QgYmUgc2V0dXAgYWZ0ZXIgTExDIGNvbG9yaW5nIGluaXRpYWxpemF0
aW9uIGJlY2F1c2UNCj4+ICsgICAgICogY29sb3JpbmcgaW5mbyBhcmUgcmVxdWlyZWQgaW4gb3Jk
ZXIgdG8gY3JlYXRlIGNvbG9yZWQgbWFwcGluZ3MNCj4+ICsgICAgICovDQo+PiArICAgIHNldHVw
X3BhZ2V0YWJsZXMoKTsNCj4+ICsgICAgLyogRGV2aWNlLXRyZWUgd2FzIG1hcHBlZCBpbiBib290
IHBhZ2UgdGFibGVzLCByZW1hcCBpdCBpbiB0aGUgbmV3IHRhYmxlcyAqLw0KPj4gKyAgICBkZXZp
Y2VfdHJlZV9mbGF0dGVuZWQgPSBlYXJseV9mZHRfbWFwKGZkdF9wYWRkcik7DQo+PiArfQ0KPj4g
Kw0KPj4gIHZvaWQgKl9faW5pdCBhcmNoX3ZtYXBfdmlydF9lbmQodm9pZCkNCj4+ICB7DQo+PiAg
ICAgIHJldHVybiAodm9pZCAqKShWTUFQX1ZJUlRfU1RBUlQgKyBWTUFQX1ZJUlRfU0laRSk7DQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAu
Yw0KPj4gaW5kZXggYzFmMmQxYjg5ZDQzLi5iMmYzNGJhMmE4NzMgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vc2V0dXAuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMNCj4+IEBA
IC0xMiw3ICsxMiw2IEBADQo+PiAgI2luY2x1ZGUgPHhlbi9kZXZpY2VfdHJlZS5oPg0KPj4gICNp
bmNsdWRlIDx4ZW4vZG9tYWluX3BhZ2UuaD4NCj4+ICAjaW5jbHVkZSA8eGVuL2dyYW50X3RhYmxl
Lmg+DQo+PiAtI2luY2x1ZGUgPHhlbi9sbGMtY29sb3JpbmcuaD4NCj4+ICAjaW5jbHVkZSA8eGVu
L3R5cGVzLmg+DQo+PiAgI2luY2x1ZGUgPHhlbi9zdHJpbmcuaD4NCj4+ICAjaW5jbHVkZSA8eGVu
L3NlcmlhbC5oPg0KPj4gQEAgLTMwMCw4ICsyOTksNiBAQCBzaXplX3QgX19yZWFkX21vc3RseSBk
Y2FjaGVfbGluZV9ieXRlczsNCj4+ICB2b2lkIGFzbWxpbmthZ2UgX19pbml0IHN0YXJ0X3hlbih1
bnNpZ25lZCBsb25nIGZkdF9wYWRkcikNCj4+ICB7DQo+PiAgICAgIHNpemVfdCBmZHRfc2l6ZTsN
Cj4+IC0gICAgY29uc3QgY2hhciAqY21kbGluZTsNCj4+IC0gICAgc3RydWN0IGJvb3Rtb2R1bGUg
Knhlbl9ib290bW9kdWxlOw0KPj4gICAgICBzdHJ1Y3QgZG9tYWluICpkOw0KPj4gICAgICBpbnQg
cmMsIGk7DQo+PiAgQEAgLTMxNSwzNSArMzEyLDEwIEBAIHZvaWQgYXNtbGlua2FnZSBfX2luaXQg
c3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgZmR0X3BhZGRyKQ0KPj4gICAgICAgIHNtcF9jbGVhcl9j
cHVfbWFwcygpOw0KPj4gIC0gICAgZGV2aWNlX3RyZWVfZmxhdHRlbmVkID0gZWFybHlfZmR0X21h
cChmZHRfcGFkZHIpOw0KPj4gLSAgICBpZiAoICFkZXZpY2VfdHJlZV9mbGF0dGVuZWQgKQ0KPj4g
LSAgICAgICAgcGFuaWMoIkludmFsaWQgZGV2aWNlIHRyZWUgYmxvYiBhdCBwaHlzaWNhbCBhZGRy
ZXNzICUjbHguXG4iDQo+PiAtICAgICAgICAgICAgICAiVGhlIERUQiBtdXN0IGJlIDgtYnl0ZSBh
bGlnbmVkIGFuZCBtdXN0IG5vdCBleGNlZWQgMiBNQiBpbiBzaXplLlxuXG4iDQo+PiAtICAgICAg
ICAgICAgICAiUGxlYXNlIGNoZWNrIHlvdXIgYm9vdGxvYWRlci5cbiIsDQo+PiAtICAgICAgICAg
ICAgICBmZHRfcGFkZHIpOw0KPiANCj4gSSB1bmRlcnN0YW5kIHdoeSB5b3UgZG9uJ3QgbmVlZCB0
byBjYWxsIGVhcmx5X2ZkdF9tYXAoKSB0d2ljZS4gQnV0IEkgYW0gYSBiaXQgc3VycHJpc2VkIHdo
eSB0aGUgdHdvIGNhbGxzIGFyZSBtb3ZlZCB0byB0aGUgTU1VIGNvZGUuIEkgdGhpbmsgaXQgd291
bGQgYmUgYmV0dGVyIGlmIG9uZSBvZiB0aGUgY2FsbCBpcyBrZXB0IGhlcmUgYW5kIGVhcmx5X2Zk
dF9tYXAoKSBpcyBpbXBsZW1lbnRlZCBmb3IgdGhlIE1QVS4NCj4gDQo+PiAtDQo+PiAtICAgIC8q
IFJlZ2lzdGVyIFhlbidzIGxvYWQgYWRkcmVzcyBhcyBhIGJvb3QgbW9kdWxlLiAqLw0KPj4gLSAg
ICB4ZW5fYm9vdG1vZHVsZSA9IGFkZF9ib290X21vZHVsZShCT09UTU9EX1hFTiwNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZpcnRfdG9fbWFkZHIoX3N0YXJ0KSwNCj4+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIChwYWRkcl90KSh1aW50cHRyX3QpKF9lbmQgLSBfc3Rh
cnQpLCBmYWxzZSk7DQo+PiAtICAgIEJVR19PTigheGVuX2Jvb3Rtb2R1bGUpOw0KPj4gKyAgICBz
ZXR1cF9lYXJseV9tYXBwaW5ncyhmZHRfcGFkZHIpOw0KPj4gICAgICAgIGZkdF9zaXplID0gYm9v
dF9mZHRfaW5mbyhkZXZpY2VfdHJlZV9mbGF0dGVuZWQsIGZkdF9wYWRkcik7DQo+IA0KPiBUaGlz
IGZ1bmN0aW9uIHdpbGwgcGFyc2UgdGhlIG1lbW9yeSBiYW5rcy4gVGhpcyBpcyByZXF1aXJlZCBi
eSAuLi4NCj4gDQo+PiAgLSAgICBjbWRsaW5lID0gYm9vdF9mZHRfY21kbGluZShkZXZpY2VfdHJl
ZV9mbGF0dGVuZWQpOw0KPj4gLSAgICBwcmludGsoIkNvbW1hbmQgbGluZTogJXNcbiIsIGNtZGxp
bmUpOw0KPj4gLSAgICBjbWRsaW5lX3BhcnNlKGNtZGxpbmUpOw0KPj4gLQ0KPj4gLSAgICBsbGNf
Y29sb3JpbmdfaW5pdCgpOw0KPiANCj4gLi4uIGxsY19jb2xvcmluZ19pbml0KCkuIFlldCB5b3Ug
bW92ZSBpdCBlYXJseS4gU28gSSB0aGluayBpdCBtZWFucyB0aGUgY2FjaGUgY29sb3JpbmcgY29k
ZSB3b3VsZCBzdG9wIHdvcmtpbmcuDQoNCndvb3BzLCBJIGRpZG7igJl0IHNlZSBib290X2ZkdF9p
bmZvIHdhcyBwYXJzaW5nIHRoZSBtZW1vcnkgYmFua3MsIHNvcnJ5IEkgb3Zlcmxvb2tlZCB0aGF0
LA0KSSBzYXcgbm8gZGVwZW5kZW5jaWVzIG9uIHZhcmlhYmxlcyBhbmQgZ2l2ZW4gdGhhdCBJIGRv
buKAmXQgaGF2ZSBhIHdvcmtpbmcgY2FjaGUgY29sb3Jpbmcgc2V0dXANCkkgZGlkbuKAmXQgbm90
aWNlLiBJ4oCZbGwgYmUgbW9yZSBjYXJlZnVsIG5leHQgdGltZS4NCg0KPiANCj4gDQo+ID4gLT4g
LSAgICAvKg0KPj4gLSAgICAgKiBQYWdlIHRhYmxlcyBtdXN0IGJlIHNldHVwIGFmdGVyIExMQyBj
b2xvcmluZyBpbml0aWFsaXphdGlvbiBiZWNhdXNlDQo+PiAtICAgICAqIGNvbG9yaW5nIGluZm8g
YXJlIHJlcXVpcmVkIGluIG9yZGVyIHRvIGNyZWF0ZSBjb2xvcmVkIG1hcHBpbmdzDQo+PiAtICAg
ICAqLw0KPj4gLSAgICBzZXR1cF9wYWdldGFibGVzKCk7DQo+PiAtICAgIC8qIERldmljZS10cmVl
IHdhcyBtYXBwZWQgaW4gYm9vdCBwYWdlIHRhYmxlcywgcmVtYXAgaXQgaW4gdGhlIG5ldyB0YWJs
ZXMgKi8NCj4+IC0gICAgZGV2aWNlX3RyZWVfZmxhdHRlbmVkID0gZWFybHlfZmR0X21hcChmZHRf
cGFkZHIpOw0KPj4gLQ0KPj4gICAgICBzZXR1cF9tbSgpOw0KPj4gICAgICAgIHZtX2luaXQoKTsN
Cg0KU28geWVzIEkgd291bGQgaGF2ZSB1c2VkIHNvbWUgZHVwbGljYXRpb24gZm9yIHRoZSBNUFUg
cGFydCBkb2luZyB0aGlzOg0KDQp2b2lkIF9faW5pdCBzZXR1cF9lYXJseV9tYXBwaW5ncyhwYWRk
cl90IGZkdF9wYWRkcikNCnsNCiAgICBjb25zdCBjaGFyICpjbWRsaW5lOw0KICAgIHN0cnVjdCBi
b290bW9kdWxlICp4ZW5fYm9vdG1vZHVsZTsNCg0KICAgIDxzZXR1cF9tcHU+DQoNCiAgICBkZXZp
Y2VfdHJlZV9mbGF0dGVuZWQgPSBlYXJseV9mZHRfbWFwKGZkdF9wYWRkcik7DQogICAgaWYgKCAh
ZGV2aWNlX3RyZWVfZmxhdHRlbmVkICkNCiAgICAgICAgcGFuaWMoIkludmFsaWQgZGV2aWNlIHRy
ZWUgYmxvYiBhdCBwaHlzaWNhbCBhZGRyZXNzICUjIlBSSXBhZGRyIi5cbiINCiAgICAgICAgICAg
ICAgIlRoZSBEVEIgbXVzdCBiZSA4LWJ5dGUgYWxpZ25lZCBhbmQgbXVzdCBub3QgZXhjZWVkIDIg
TUIgaW4gc2l6ZS5cblxuIg0KICAgICAgICAgICAgICAiUGxlYXNlIGNoZWNrIHlvdXIgYm9vdGxv
YWRlci5cbiIsDQogICAgICAgICAgICAgIGZkdF9wYWRkcik7DQoNCiAgICAvKiBSZWdpc3RlciBY
ZW4ncyBsb2FkIGFkZHJlc3MgYXMgYSBib290IG1vZHVsZS4gKi8NCiAgICB4ZW5fYm9vdG1vZHVs
ZSA9IGFkZF9ib290X21vZHVsZShCT09UTU9EX1hFTiwNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdmlydF90b19tYWRkcihfc3RhcnQpLA0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAocGFkZHJfdCkodWludHB0cl90KShfZW5kIC0gX3N0YXJ0KSwgZmFsc2UpOw0KICAgIEJVR19P
TigheGVuX2Jvb3Rtb2R1bGUpOw0KDQogICAgY21kbGluZSA9IGJvb3RfZmR0X2NtZGxpbmUoZGV2
aWNlX3RyZWVfZmxhdHRlbmVkKTsNCiAgICBwcmludGsoIkNvbW1hbmQgbGluZTogJXNcbiIsIGNt
ZGxpbmUpOw0KICAgIGNtZGxpbmVfcGFyc2UoY21kbGluZSk7DQp9DQoNCkkgZGlzY3Vzc2VkIHdp
dGggTWljaGFsIGJlZm9yZSBhbmQgaGUgc3VnZ2VzdGVkIHRvIHNldHVwIHRoZSBNUFUgZnJvbSB0
aGUgZWFybHkgQVNNIGNvZGUsDQppdCBzb3VuZGVkIGEgZ29vZCBpZGVhIHRvIGRvIHRoYXQgaW4g
dGhlIG1wdSBlbmFibGVfYm9vdF9jcHVfbW0sIGJ1dCB0aGVuIEkgcmVhbGlzZWQgbXkNCk1QVSBy
ZWdpb24gdGFibGUgc2l0cyBpbiAuYnNzLg0KDQpTbyBJIGhhZCBzb21lIGNob2ljZXM6DQoxKSBw
bGFjZSB0aGUgTVBVIHJlZ2lvbiB0YWJsZSBpbiAuZGF0YT8gSSB3b3VsZCBzdGlsbCBsaWtlIGl0
IHRvIGJlIHplcm9lZCBidXQgSSBjb3VsZCBkbyB0aGF0IGluIGEg4oCcc2V0dXBfbXB1KCnigJ0g
ZnVuY3Rpb24uDQogICAgVGhlcmUgaXMgc3RpbGwgdGhlIERUIGFkZGl0aW9uYWwgZWFybHlfZmR0
X21hcCBjYWxsLCBidXQgbWF5YmUgSSBjb3VsZCBtb3ZlIHRoYXQgaW50byBzZXR1cF9wYWdldGFi
bGVzKCkgPw0KICAgIE9yIEkgY291bGQgaGF2ZSBhIHJldHVybiB2YWx1ZSBmcm9tIGxsY19jb2xv
cmluZ19pbml0KCkgYW5kIG1ha2UgdGhlIHNlY29uZCBlYXJseV9mZHRfbWFwIGNhbGwgZGVwZW5k
aW5nIG9uIGlmDQogICAgY2FjaGUgY29sb3JpbmcgaXMgc2V0dXAgb3Igbm90Pw0KICAgIEkgd291
bGQgdGhlbiBwcm92aWRlIGFuIGVtcHR5IHN0dWIgZm9yIHNldHVwX3BhZ2V0YWJsZXMoKSBvbiBN
UFUgc3lzdGVtcy4NCg0KMikgUHJvdmlkZSBhIGNvbW1vbiBmdW5jdGlvbiBsaWtlIHdoYXQgSeKA
mXZlIHRyaWVkIHRvIGRvIGluIHRoaXMgcGF0Y2gsIHNvIHRoYXQgZGlmZmVyZW50IG1lbW9yeSBt
YW5hZ2VtZW50IHN1YnN5c3RlbQ0KICAgICBjb3VsZCBwcm92aWRlIHRoZWlyIGltcGxlbWVudGF0
aW9uLiBLZXkgZGlmZmVyZW5jZXMgYXMgd2Ugc2F3IGFyZToNCiAgICAgIGEpIE1NVSBkb27igJl0
IGNhbGwgYW55dGhpbmcgYmVmb3JlIGVhcmx5X2ZkdF9tYXAgYmVjYXVzZSBpdCBoYXMgYWxyZWFk
eSBzb21lIGRhdGEgc3RydWN0dXJlIGluIHBsYWNlIGF0IHRoaXMgc3RhZ2UNCiAgICAgIGIpIE1N
VSBuZWVkcyB0byBjYWxsIGxsY19jb2xvcmluZ19pbml0LCBzZXR1cF9wYWdldGFibGVzIGFuZCBh
biBhZGRpdGlvbmFsIGVhcmx5X2ZkdF9tYXAuDQogICAgIFdvdWxkIHNvbWV0aGluZyBsaWtlIHBy
ZV9mZHRfbWFwKCksIHBvc3RfZmR0X21hcCgpIHdvcms/IHByZV9mZHRfbWFwKCkgd291bGQgYmUg
ZW1wdHkgZm9yIE1NVS4NCg0KUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdmlldyBvbiB0aGlzLCBt
YXliZSB5b3UgaGF2ZSBzb21lIGJldHRlciBkZXNpZ24uDQoNCkNoZWVycywNCkx1Y2ENCg0KDQoN
Cg==

