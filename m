Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509FDA5EEE4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 10:04:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911578.1317990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseUZ-0004jn-1W; Thu, 13 Mar 2025 09:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911578.1317990; Thu, 13 Mar 2025 09:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tseUY-0004ha-V9; Thu, 13 Mar 2025 09:04:38 +0000
Received: by outflank-mailman (input) for mailman id 911578;
 Thu, 13 Mar 2025 09:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CkET=WA=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tseUX-0004NM-By
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 09:04:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2614::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ede0d7d-ffea-11ef-9898-31a8f345e629;
 Thu, 13 Mar 2025 10:04:34 +0100 (CET)
Received: from DB8PR06CA0012.eurprd06.prod.outlook.com (2603:10a6:10:100::25)
 by DU5PR08MB10823.eurprd08.prod.outlook.com (2603:10a6:10:528::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 09:04:31 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:100:cafe::73) by DB8PR06CA0012.outlook.office365.com
 (2603:10a6:10:100::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.24 via Frontend Transport; Thu,
 13 Mar 2025 09:04:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 13 Mar 2025 09:04:29 +0000
Received: ("Tessian outbound ae00a21450c4:v585");
 Thu, 13 Mar 2025 09:04:29 +0000
Received: from L150dd05d8bd2.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 74CE56A1-1F49-4B86-A144-8573E8A57FF4.1; 
 Thu, 13 Mar 2025 09:04:18 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L150dd05d8bd2.3 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 13 Mar 2025 09:04:18 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com (2603:10a6:803:4d::31)
 by DU2PR08MB10016.eurprd08.prod.outlook.com (2603:10a6:10:49e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 09:04:16 +0000
Received: from VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8]) by VI1PR08MB2989.eurprd08.prod.outlook.com
 ([fe80::a004:515d:5b93:9ec8%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 09:04:15 +0000
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
X-Inumbo-ID: 2ede0d7d-ffea-11ef-9898-31a8f345e629
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bHo3e9ppI5Kk355eE5S6tFVDlX+m9JVgHK7lIXAnw8zr6gHzI1QmQb7BpI9mvfrLIa7gl1NqfthB+Xf9rflVk7Dclli76N7Y3gLBp+qQvPQs87uLxyLBBnk9K8d3rP70udnz0l41QR9yO0EfrYTWfbIZmCWpWK446M4aji7v61vig9ZzIldAlMAmoWIg1KqOMSY/EEg2eUheCGdiNEGcnylBwnxLxXoddmHh/gE9moiPE7ayQvfh09y0CQmbUsGoYrKhX91kw2QqG0x3oI9OPOGsrlLHKCkwGwBya+6Jb3IOYX7yr6AiFOsWtT/6AJxr94w0IdM/MPdyEyJdxqyPOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IgjZWoCZnEqqL014+mdpXLizAP71/z55Ej1J/F+rvM=;
 b=lSndjbDMb2xhOIy6qusF+78pOfJHu8G43K0xIMBAwkNCAVYwhhy1QfLM3yaiPCiLlVZKF7XcTwxRTWGppdBDQ31dG3WxEbfB790Yvx0QCrWvdgM7lUtOavEVKVXte3PoAcIKAETO0DI3jKn7JIFnRQVMrnCIhLBrZBznpezNaDo+Lgd1pPr+cxZD3erhHIZb1Q7klPyYJ1EonjWid05EzjTozQQyv5N/cXNH9EpHPZ3vmuTA3w1ZXfBFDTPjgt6KgRIFoGf99OffWGNFQQmfLq5SzJ4Za4CYeQkA+tiOEaL4KW6+xU0Qfg34RHqGAz1wulSlTj6OA1XoZiZhfwWgFA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IgjZWoCZnEqqL014+mdpXLizAP71/z55Ej1J/F+rvM=;
 b=iP2eWUu6CWz/9t9A6skG/85vwGjdZCBwO5I8JQfdto4DA0aRDPgGa6sqdZ4lZmAZqGbb9Xn8V0G2cD6LLGrkb/sjelFSVpaXY7Ji7K+tIF7Nm4nIO9bwl5JDHkk4OSkxe1qbSnWYB58NSIBN1JMqZoJB04duB+muwcLvPh1reKE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c32522c51aa179e8
X-TessianGatewayMetadata: HNHLghL4bxehPmNA40Vz+W+vPT1EaajWyxiWVZWlm7lwgPzhPvhvIK/aBhOZieeXQtJmOSQ/NKxWzPkv3wmUhxv5dVlNM8GkxIk8olqusM+Q3YW3X6mtEZSre15ZS9xSIBuBVrEeNa6FGaVb+wySM0O/WMxyjZDc42RlInN3SCQ=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALIukiTdN1b4O13ghCJp1JdwgGrnwLtI4ZFPAH17HeqkOGdGAdtSojxTzOCcvmYAAMsAfzI3tYTOq+gKafr4SOBRJLe2xx+4yg7161Qsb+JyOBy6nSboHqGaGyVuKQFrogoI5ok4PbgIIHrzH5jGoWvdIuDVQfNSOYjcCxw8Wg4VRo2zziEvMHUfQjAnfHuM1lDMJFYKEbq6YxtjkJPa5tS24HeidQ95ng1mv3bZ10yxoWCOws0ukAYWU89HphN/1sA7j7KeTNW/a6Mf5tQaAi89vP6hPvVqRVDqs+wazEx24FeMlsHbqBdOqJTZklEd0yP4b2sxFZELdOFQNLIzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IgjZWoCZnEqqL014+mdpXLizAP71/z55Ej1J/F+rvM=;
 b=ookppOg6QpHxVI6hrBRRhFMNOzQkMqKEz/OiFPRrkJIgwwSZ7efMoMTILJdEHfqMo1aquBQu9q5l8+a7G/jU6d8K1T5flaSOc5spzkZQeED3cV8tuTqeWtrSKUTRpau+1WfzBDYK8e4gTWOYFlqcPYQXr6rx+FSwvROIMblrL9IAbhzcC7vIxawKj9T09b2/qeDUoGtoh02Sp9HOg+UD5GtPUvgYnAMBFIprcGBeN8IcxwTc2cfeBA2+yamNc0Oug39FQf/rcZcifIUi+u/VDlMBXHOaMtp+la5c2oQ2AfNJxDmdg0liuW2K20BP8tFxBAL+BBxyWutARSJTjtXR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IgjZWoCZnEqqL014+mdpXLizAP71/z55Ej1J/F+rvM=;
 b=iP2eWUu6CWz/9t9A6skG/85vwGjdZCBwO5I8JQfdto4DA0aRDPgGa6sqdZ4lZmAZqGbb9Xn8V0G2cD6LLGrkb/sjelFSVpaXY7Ji7K+tIF7Nm4nIO9bwl5JDHkk4OSkxe1qbSnWYB58NSIBN1JMqZoJB04duB+muwcLvPh1reKE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 04/10] arm/mpu: Implement virt/maddr conversion in MPU
 system
Thread-Topic: [PATCH 04/10] arm/mpu: Implement virt/maddr conversion in MPU
 system
Thread-Index: AQHbk1YjhSQHkM+61ES2Vr9M1l81tLNwwpUAgAAEWIA=
Date: Thu, 13 Mar 2025 09:04:15 +0000
Message-ID: <8187117A-5463-494C-B401-5D8B73634DFC@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
 <20250312135258.1815706-5-luca.fancellu@arm.com>
 <f16ff8ff-6d9f-4763-914c-4ada8d7ecee4@amd.com>
In-Reply-To: <f16ff8ff-6d9f-4763-914c-4ada8d7ecee4@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	VI1PR08MB2989:EE_|DU2PR08MB10016:EE_|DU2PEPF00028D05:EE_|DU5PR08MB10823:EE_
X-MS-Office365-Filtering-Correlation-Id: b8572b12-10f6-4e22-1bba-08dd620e1032
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cFRBKytQQkFscklDMG5HK21oaVVsWjdUWnlwblRlWjRDM1ZmUGRreWREdGhp?=
 =?utf-8?B?T1NIdnQ5OEduV0llbm10emszUVRoN0U4dzBZT3lwSVU1MWQzK285Z1BMMEx2?=
 =?utf-8?B?bXRpalJscWxwMDQySDR4NDZnVGVYamZoSUY3dGYzN0d5cEhHRXQrWHBmV3Fw?=
 =?utf-8?B?bWxBRWFvK2lyZmMxM2Y4SFp3TzFNWm80WjlmZllxUWc2aGFnZkY0Z09qdWVY?=
 =?utf-8?B?b2xNR1lyczE4S1QyL1AxMExuRGRyUnNiZCtkUDh1b0xUV1VCUzh6OSs0UkY5?=
 =?utf-8?B?M0hsVkE3YnhLZ0JPWWpCdDBQcktmcVgxbEw5T3FVMUE1RDVwUjBKVFZlaVVK?=
 =?utf-8?B?YU9hU1QvKzNienJrMi9MUTRQNlc1a1BmUHZ1K25IeEZkSkcvSW1Ha3RCVkVj?=
 =?utf-8?B?UGZNK1ZJc1JQaEVYY2doRlBQM0trQWRMTVF2QmJNV0QyUVF4RVVIQ3pHOFl5?=
 =?utf-8?B?dHJCcnoyRTd4Q3VMaVQyZUZxM3lZbDV3dGdnSkY2QkR6TFpseHRGRHdLYjNs?=
 =?utf-8?B?OXpMNXVRWVBOWGVCMkRNa2E0UTFLdm9CaWtHdmNnN0E2RHErQi9tZDZ2TG5C?=
 =?utf-8?B?dGRuUTFheXIwV3ZTbDdSVXZLdy9SYkJtU0V0dWxHbmY5K3NsUThrcGZDVDhx?=
 =?utf-8?B?MUR2YWpRTEJSZWZDL2RHNTZOWXBjVFRNdDg1NzlMdG1DTExpYU4xaHdWdWdP?=
 =?utf-8?B?NFJPRHdRMUlqLzdBUzdvc1JzNVdyUnNBVjF2NU1hWEcyMGFVNnN2MWlnc250?=
 =?utf-8?B?SHVZcWhMVDZ3akdmMDJtVW1nRWdtYnlNdFBxSWtuQVZEMDZneHNhRTJRUFRu?=
 =?utf-8?B?WXY4dnRJMXB2NmxWN01lNEtlYWJwVVNaRVUySkpWQmRQMUl2Q0h5M1Y3WWtY?=
 =?utf-8?B?bnRLb0VhRjh1K0FadlNKbmVGdC85bXdOUjNMVjBPNEp2aW1yZEF6amRsSlRT?=
 =?utf-8?B?K2oxN1Y2Y0g4WWtOaUN4RXQ5cVVQTWxkTXFhME96Qk1lN2hxSFI0MCtGU2s4?=
 =?utf-8?B?RTNKbTU4bDdqZy91Um9MNGRPeGRBSmN6clp5N0FTUU5ObjNLTzhVa3NVN1ph?=
 =?utf-8?B?NXVWNGpSVXEvM3dVTjIxbE5jZUlGTWkwYVRzNHZyTWVxejN6MGFCQ2U4aW05?=
 =?utf-8?B?RnlHbVlhcVBHWmpRdnRjYld1VkxRYTVuUFVmVWs5NjFjSWVYcnpvcG1rakxI?=
 =?utf-8?B?ajRtRUJkL2QxZ2ZTS2lSbms4L0JZbTY2QS9ldXl3SGttaFNqRXNhTGZpTXJG?=
 =?utf-8?B?aFNsaVoxQ25wcFJ2c1M0ZFJ2bzlIR2xBbXB0ampQeWdlL0c5K0FpSzR4WENR?=
 =?utf-8?B?NmZZTGp6NXdjRUxZNlc5WGVZREptQTVSdHhHdmdnS291dFU5aHV6OGlyMGtz?=
 =?utf-8?B?WGQzQitkeUZlT3NIVmgyUFErR283b2gyT1A2QVVobjhYbTdYYkI2TDlTTk5F?=
 =?utf-8?B?OEhJc3VaRHBjcGMxZldCbmM2b3lFYWE4QjE3VWp2MTdlZjRjZ1VxNmJyTTV4?=
 =?utf-8?B?b3BwRjZjYUt3TWdlcVBxMGFsRVU5VjVpbGpXN1NIcjBaRjNNM2pIbmtSMmJo?=
 =?utf-8?B?bHBYb3R5OWFhTG1jNTlFRXVDQkprWDFiZU1PSWxOL2I3T0tId3d5UHJrM0xS?=
 =?utf-8?B?cVMrLzRFc3F5VW5Nb3pKT2lCMXlWaGpQUDFUeGsvNE1QamdOM21Ta2dhK3JD?=
 =?utf-8?B?R0lxY0kwT0lSQ0J4TVpGR2NoUW0vVnFFbDhyaENhc2dGS2NIWnoxMXRleHJn?=
 =?utf-8?B?MGhjOHB5SFEyb3J1ZytoSXo1cHpHMTRCUEVyQjlYQ3plYkNISlFQY1d2ZStz?=
 =?utf-8?B?NWwrTTZCQ2hpM3RUUVc5T2I4eEUxYWtoNk5sc2RWZzg0QXREdjdyKy9SaVd0?=
 =?utf-8?B?eXB6bUdGdzJna0wxL2k1anl1bmQwdm84RGtzc3RvaFFDYzYxcU9OV2Z4Z1dP?=
 =?utf-8?Q?nRTFAf/JaNfPqcj3O9InJcuW7LqT6EbA?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB2989.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BE1FBD967ABF5C44BC37706AB0932B3B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10016
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:803:4d::31];domain=VI1PR08MB2989.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6caff389-f83a-49bf-0024-08dd620e0775
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUVJa2dJalE4OTB3aHVNdkJYbHpYSGlFaytEYS9USzM2YkNhMysyUThqU0xS?=
 =?utf-8?B?WXhZNFhYdks4QzdjenJaMGd5Z09POGsreUVGa3FuMDB5dk9jRXFNVEJJUEFS?=
 =?utf-8?B?dEZ5Z1FyZWtLTGpRbnhsQ2lUa2UzZ2ZTRHhpTHloYWlCdzh1VTUvYkJRWDdz?=
 =?utf-8?B?c1plcGdCakp1b0Y3cWh4SHEvK2lJbjQ5Zmp4VWI5RUo5UzRhK3B1dXVSYVFK?=
 =?utf-8?B?L1NnM3R5KzBvNlQ2SzNweFJ6Tm9kTmdUWXFlYlUvQTQxd2UzYWtScVByQ1Vv?=
 =?utf-8?B?TXBDQ0JVZW8yalN2RXBqbXgxVXk4VnpCSjRQcEhHM3VldEVocnRNWW9iWW9i?=
 =?utf-8?B?ZDRpMHM3djFWdmoyRTlYR2pTTkhQRElnNmZSTFBhVERMSVA5SEttWFV6QmZK?=
 =?utf-8?B?cEVVYXF4b2pUbitHR0JJbG1ZelUrWk1DMmRJeWltRW0ybmYwSkIwd2ZyK1FQ?=
 =?utf-8?B?RXhiRjgwQlhIeE8vMXlQQUFXM01aT3prMUl6c254RVZZVmZyU3pkb2FyVE01?=
 =?utf-8?B?a3luSDVXU1doQ0cxNVVUeEEwelVWR2RGM0tNTHRIZGlRd21BbFpCVlNHeFda?=
 =?utf-8?B?bFY4a3NjcUkzRFJRZ0lac0Q5cVp4c2oyTnVOdUwxQ09CS1FnTUFCU2pQb2JB?=
 =?utf-8?B?blZTaXhZVlNtLzhvd21ZQXg4cHBhR2g1RTRRbnA2QlJQSU01OUZHekNPK3Zh?=
 =?utf-8?B?UVdsSURoUWc0eDR1aVE0SXd1VDk1Vk5PUDk4YitPR1d6VVdJcFNYWEJISGtD?=
 =?utf-8?B?cm0zWTlNWkp2Y0xWcWRDV2gyVCt2QXQrVHc5WUozbXJJeUFETHdmcFRIMDFU?=
 =?utf-8?B?dVhKNzVsV2xhRmxPQnZJZUpXVS9IcHQrR3Evdmdrd0EwVXh5OGthajY1cElo?=
 =?utf-8?B?TDVuODM0LzEyT2dqOEJPTG10aEV4UGM5TWlyMzg5SVlnZUJ3YmJyWmZ4KzJK?=
 =?utf-8?B?OFdPWVpUSFBJSUgwNGNuem1sWGZJL21BYWJJR1FyYmpQaHZkbFVQSTVTTU1y?=
 =?utf-8?B?b3RKVTg3dkNDMTNLWUsveGd4a2hBSXZtNmtQb2RxMFVNZmlWbFJOeXFTc1lR?=
 =?utf-8?B?OEJFdS9leGl3ZWV4ZEcxQ2c0UWhqL1dGeGYva2pQV2VqaXZRa2RJd3U5anBQ?=
 =?utf-8?B?Nk1iVkI5dE9tWDFEMWpEQ2EvV3k4VEVEcG9KMmRIOG4zVmlzLzhrN2tHb3pU?=
 =?utf-8?B?bW9tZHMydDFyR2Q3U3V4di9aZDlWZjBZTmZIWUM2dERVa0VqZHlOMHVQWlVY?=
 =?utf-8?B?NWFTUWNVU2paWWdnY3hrL0NwSUk0eWhiR1o5bFd2VENNRk9OcDl6SUZSd3VV?=
 =?utf-8?B?MytOQTN1ZjA2SmhQSTYwcXBGY0RYcVdHMzFzNHlGMUVQSVo3aWllMWVYSHph?=
 =?utf-8?B?SXczK1doTUJJM2Nrd0RZYlBLWU1BYmFoYWY0Nk1xUUl5UXBJYTNKdDVsd3Rh?=
 =?utf-8?B?eUxnek4yUkRlRkZTVUtzNHdKakpxbFNJNC85RXZzbGkzZWEvbm1ra0F2VVA4?=
 =?utf-8?B?VDk4NmR1aFFHbkdRTGFJQTl6Mi9rbDJ6amZxWjJGekgvUDJVQ0kvclBzdmpl?=
 =?utf-8?B?cjZHaUYwdjN3M2NmQ1VDY0VyY2tMY0l2c3hQcXhBZlU2VlZvaUJQQy9BWTk1?=
 =?utf-8?B?MW0zVUxPWFFNUWVPeUlUbjIwQ3ZQN3JRcnd1dHFCUUFQaVpkNCtUNGFuTEx0?=
 =?utf-8?B?UmtSS1V0L1FNbWZVb0Jad0JnWjYydGJ2b0FHUTRZSUFDa0dMa1NmRXdHYUll?=
 =?utf-8?B?L3IrNS92TzFWVHZ6SWtGMktOZ0dFQ1ZYYTNpbG9vWitSVk9VWXRwZTRsZ3F3?=
 =?utf-8?B?Wm12ZFl5R1R5eWFiczgvUDZBTU9mRkhRbUl6clIxVTNUeHU1ZzFwNnorK0FR?=
 =?utf-8?B?NS9sR1BGTGRXak11RnBEMi9rdDdLSzRBVjdDSzQ3REFFTU5QNnVHenB0cmlI?=
 =?utf-8?B?Ym1hZURtZFJLQndYbXdveGtFeEtRUGZxUndVRUN0T0d3KytON2NSV3oxTG5Q?=
 =?utf-8?Q?8r9qwfzddHSguve9mU2s3VFP71T2ng=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 09:04:29.7262
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8572b12-10f6-4e22-1bba-08dd620e1032
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10823

SGkgTWljaGFsLA0KDQp0aGFua3MgZm9yIHlvdXIgcmV2aWV3LA0KDQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS9tbS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUv
YXNtL21wdS9tbS5oDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAw
MDAwLi41N2YxZTU1OGZkNDQNCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9tcHUvbW0uaA0KPj4gQEAgLTAsMCArMSwyNyBAQA0KPj4gKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkgKi8NCj4+ICsNCj4+ICsjaWZuZGVmIF9f
QVJNX01QVV9NTV9fDQo+IE1pc3NpbmcgX0g/IFNob3VsZCBiZTogX19BUk1fTVBVX01NX0hfXw0K
PiANCj4+ICsjZGVmaW5lIF9fQVJNX01QVV9NTV9fDQo+PiArDQo+PiArI2luY2x1ZGUgPHhlbi9t
YWNyb3MuaD4NCj4gSSBndWVzcyB5b3UgYWxzbyBuZWVkIHhlbi90eXBlcy5oDQo+IA0KPj4gKw0K
Pj4gKyNkZWZpbmUgdmlydF90b19tYWRkcih2YSkgKHsgIFwNCj4+ICsgICAgKHBhZGRyX3QpdmE7
ICAgICAgICAgICAgICBcDQo+PiArfSkNCj4gV2h5IG11bHRpbGluZT8gQWxzbywgc2hvdWxkbid0
IHdlIHRha2UgUEEgYml0cyBpbnRvIGFjY291bnQ/DQo+IEknZCBpbWFnaW5lOg0KPiAoKHBhZGRy
X3QpKCh2YWRkcl90KSh2YSkgJiBQQUREUl9NQVNLKSkNCj4gDQo+PiArDQo+PiArLyogT24gTVBV
IHN5c3RlbXMgdGhlcmUgaXMgbm8gdHJhbnNsYXRpb24sIG1hID09IHZhLiAqLw0KPj4gK3N0YXRp
YyBpbmxpbmUgdm9pZCAqbWFkZHJfdG9fdmlydChwYWRkcl90IG1hKQ0KPj4gK3sNCj4+ICsgICAg
cmV0dXJuIF9wKG1hKTsNCj4gV2h5IGRvIHdlIG5lZWQgdG8gY2FzdCBwYWRkcl90IHRvIHVuc2ln
bmVkIGxvbmcgYmVmb3JlIGNhc3RpbmcgdG8gdm9pZD8NCj4gV2h5IG5vdDoNCj4gcmV0dXJuICh2
b2lkICopKG1hKTsNCg0KU28gaXQgd2FzIHBvaW50ZWQgb3V0IG9uIGEgcHJldmlvdXMgcmV2aWV3
IHRoYXQgaXTigJlzIG9rIHRvIHVzZSBfcCgpIGluc3RlYWQgb2YgZG9pbmcgc3RyYWlnaHQgdGhl
IGNhc3Q6DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QveGVuLWRldmVsL3Bh
dGNoLzIwMjMwNjI2MDMzNDQzLjI5NDMyNzAtMjktUGVubnkuWmhlbmdAYXJtLmNvbS8jMjU0MDQx
MDUNCg0KcGxlYXNlIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodCBhYm91dCBpdC4NCg0KPiANCj4+
ICt9DQo+PiArDQo+PiArI2VuZGlmIC8qIF9fQVJNX01QVV9NTV9fICovDQo+IF9fQVJNX01QVV9N
TV9IX18NCj4gDQoNCknigJlsbCBmaXggYWxsIHRoZSBvdGhlciBwb2ludHMgeW91IG1lbnRpb25l
ZC4NCg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

