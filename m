Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F36388652
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 07:04:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129814.243449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljEMJ-0008BV-VR; Wed, 19 May 2021 05:03:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129814.243449; Wed, 19 May 2021 05:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljEMJ-00088R-Rx; Wed, 19 May 2021 05:03:03 +0000
Received: by outflank-mailman (input) for mailman id 129814;
 Wed, 19 May 2021 05:03:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TeaP=KO=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1ljEMH-000889-M3
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 05:03:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 961d48c6-5a3d-4efa-abd9-7dd76b14e3cf;
 Wed, 19 May 2021 05:02:59 +0000 (UTC)
Received: from AM6P192CA0014.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::27)
 by AM8PR08MB5826.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 05:02:58 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::a7) by AM6P192CA0014.outlook.office365.com
 (2603:10a6:209:83::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.33 via Frontend
 Transport; Wed, 19 May 2021 05:02:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 05:02:57 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Wed, 19 May 2021 05:02:57 +0000
Received: from e012a13182cf.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0603CF9E-C432-4B8F-9366-2CC5697909BF.1; 
 Wed, 19 May 2021 05:02:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e012a13182cf.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 19 May 2021 05:02:50 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (20.179.30.225) by
 VI1PR08MB4511.eurprd08.prod.outlook.com (20.179.26.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25; Wed, 19 May 2021 05:02:39 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::9d05:1301:2f9c:80c5%6]) with mapi id 15.20.4129.032; Wed, 19 May 2021
 05:02:39 +0000
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
X-Inumbo-ID: 961d48c6-5a3d-4efa-abd9-7dd76b14e3cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5qXD2jGcni2Px+bNJpHHJZV6e6pW0k2rrjGwSL7V8k=;
 b=2XpVeT7Gr+azuNyTMaliE8cSqGVH/ODfzVe65WaUOZPSfYQgVR8BXJOo4U+HFYzoz3fSKBRNWtjy3suWAs2+84LlCmUFh8npCOnXrBDS9eWfVE0QCiWp1rDdQvcD701goJ37q94DvsL3eu8GswKaAtd93PRFy2bcMwk4t0gDuCA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yyg+5OmhZ1pCPJ8iQsp0TRJwlkJf2lEa0tpwYvZ0xFITTRGNdLDq3wp+rz3bJrm3XwLwHrWrzNOnYmKnhX9QajoTsYSDUFqtYuvs15hyIj3rDfyhZDZm/9Irsqxh3s8HT+bq14JGBZ3iHCnm+CRUcQ8vNxbMnlTESukC2VI2QuynbpTAnnsV2bErRH2K6vH/lBj9wlMBFlQawbFRcB+B6/r9YlW58aOvr+qSE0jsBA5mZgq//sqq95fbaT+qrs2JGm8lWJLPpw7kFVXIECiryRgA6uZodT+p/gQWypJpGUZFpu4VnKXEzAXDDs9EM1ms3098rCc4wERBykZhZAgGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5qXD2jGcni2Px+bNJpHHJZV6e6pW0k2rrjGwSL7V8k=;
 b=aZR+0Dgs5XwJohMuvEfyRMfMpg1ytJBeZ0ws3SBXt1VNKIXHT7Dmyupi2qsQvQjFE59XLKJUfY1Rakik6rMTXe2ahcXWiTMg/oLKiVmKuqS/m3fiXk0ahZlexmSz3WJflG2mH9VzpRor4HfWNihsSgYU1zV9lesEeJ1jQYIrw/yP3KUESbHh0s8b4RfP3vwsbsgx5bMAKyq1Q8kvwOgvcXZujH+q9N9fdc9fsUqWaIWNe7pRggAI5QAnyD8akhWWcZJy19lltYQo3WVlPyRGBPRasOLCxbjgkTtYFAWOUV0NyJ4w/hV8wdioIfSD4ub8Nj1fXnEAbuMD3SI3reuL9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5qXD2jGcni2Px+bNJpHHJZV6e6pW0k2rrjGwSL7V8k=;
 b=2XpVeT7Gr+azuNyTMaliE8cSqGVH/ODfzVe65WaUOZPSfYQgVR8BXJOo4U+HFYzoz3fSKBRNWtjy3suWAs2+84LlCmUFh8npCOnXrBDS9eWfVE0QCiWp1rDdQvcD701goJ37q94DvsL3eu8GswKaAtd93PRFy2bcMwk4t0gDuCA=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>
Subject: RE: [PATCH 04/10] xen/arm: static memory initialization
Thread-Topic: [PATCH 04/10] xen/arm: static memory initialization
Thread-Index: AQHXS6WzoKPo0e3K4EKgzRPDOGKP8KrpAfyAgAEhnUA=
Date: Wed, 19 May 2021 05:02:39 +0000
Message-ID:
 <VE1PR08MB521574C4D5DCAEA658A8541CF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-5-penny.zheng@arm.com>
 <d492ca1a-b9d6-6250-750c-7f511b183735@xen.org>
In-Reply-To: <d492ca1a-b9d6-6250-750c-7f511b183735@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0B5365BAD35C22418AEF9B21A61010B8.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 093c47ec-facc-44c4-e8ba-08d91a835e75
x-ms-traffictypediagnostic: VI1PR08MB4511:|AM8PR08MB5826:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB582696FC09C14B896B2B3FA3F72B9@AM8PR08MB5826.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 D52edmj/pipEGZ5necsXBZn093nRTm9HQMYL+TTkFMfGu0fMOQjyy3SybacbYjLUdVvKK2E5oeltz+WNzh4YnuzooUibOL559owfDFBCdGwvr8BYpSa4pYjb9EO7zPXvLy3922konWPVFOlavLTpHSmrYOkCBczb4++e5Dvhr9Y9OGsumz2lXhfwhqC0Sq8kEM/9ryy8RkCrNn0/tvakm+K7Jt7VUzUs+A2qeEj7NsBDArz7yJF7YNMNMnI0PsP2HoAgPsoki1+P4FEan60AFOtdkbdRIVzzqKZiyEIedExSTTpLRWf6a8Ml+OWfCuiMMV6hlHFcSQSKl3YRKpPVYNTy3S18A/Xj8O5LMQG10rYrxxxnxQfaokSVPK6JEmR9yWKMA/4j2S+pLWDnsiIC/AMREbBil/GCtCCTCtlMQgXWyJTmalOW9VsVyq7CSrR+MScA9h+pcusfKfI+y6l1V/aQKsfhvwAGbpz7pZw4OtufqOKLp1B5vbfRgwcLUHT+a8jlh8X8rIoAtOETlmwAmbejoUiSSIdtUGU8GvjEFEkLEWr7jJpdFK5YGRs0HRSC0DRz+vGq1HLKEm7jcvmsjqlQIa9faO9Py9OeSy1fEAk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(186003)(122000001)(66556008)(66476007)(66946007)(76116006)(33656002)(52536014)(64756008)(66446008)(8676002)(6506007)(53546011)(478600001)(7696005)(54906003)(110136005)(71200400001)(4326008)(316002)(83380400001)(9686003)(8936002)(55016002)(5660300002)(26005)(38100700002)(86362001)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?N0NNZG9aa1JkSzlFWGpxM2txOHRudFpMTGRCcGx2cmZ3Tk05SktnYVFIWFhm?=
 =?utf-8?B?a2pnUXNqOElSME9JTGRpYVRHdzhFTURBYzJmZWg5bURTN084UURTelZOdTlS?=
 =?utf-8?B?OEdkazk3MHRMcnYweU5wbE5VOXFHR1JMWC85dEozc3A5YmxHUVRhTDcxOW9Z?=
 =?utf-8?B?ZE9hbExEbXA4cjJiSTBXZWcyMXlQbnlpTVdJRUs0M3lTalAzV3BVWW5kbHpx?=
 =?utf-8?B?Nno1Mnlra1E2MHhUUllFeURtTCtKT3RLWlB0bENvKzZia2R4UnRZNTZITzRN?=
 =?utf-8?B?VlpRNzdCY29FQjRpWE1EaG9iR0JBMy9mOVhjN1VwMFNBbVhlZ0pHYkt0MGha?=
 =?utf-8?B?YkdiaFhpcE5CanFIcDRYZmw4a3FnR1phN3JTakVvSElPOStMWGluS3dIWkR2?=
 =?utf-8?B?ODU2Sk1CUHNGclN6aUg1Mm9obk9ScHYvdkRIQS9UYXNiUDFKb0hxeGdRbmNF?=
 =?utf-8?B?SklGRTVtNkZIckp2V2NhZEhZTXY2Mi9wV2l0YzB6S1AxR2FsdXhmL2J0YWt4?=
 =?utf-8?B?OGozdVFycnhoSGJ2ck9nWENjTDhMRXdtTFpVUElTQml6bTh4TWhUVHpEeFpJ?=
 =?utf-8?B?MGlLdURxRTZSN0NlRXY4STFrSGxFNVR5K1BrTnMxZFNlT2FmYUNkdFFNZWNV?=
 =?utf-8?B?K21tV0w3S2swZEJLL0VHVnZRL2gwVzl5cUhsdTZ2MGErVExjSVl0NW1ycU4y?=
 =?utf-8?B?U296ZkR1dUM3U2pFTUp0ZENacktnNXQ0UTg3eW9weU1RY085Q002MHFvdFVi?=
 =?utf-8?B?RGsySENXajdmY1l1bmhZQlBieXg4NWtoZ3MrMlNVMmxnYngxaUp3K2xWcnhU?=
 =?utf-8?B?UE8vbW5TVGpEbzZIdndkR2Q0K0pOcE5BYnBsOTlZTDZOWGZ2WFRxZ0YzWWZC?=
 =?utf-8?B?TE1wQS9oK1BnMVhheGtQT0p2SlcvcTlaSmJFKzJNUzlVNk5SaFUrTnZWRlJY?=
 =?utf-8?B?YVJaMWc1WXRMZ20yZFA2SXJpZzFybHVjTU03cEc2SytLNkFkOFFoRXRMcU1D?=
 =?utf-8?B?U1RycWNHVnpUN0R1VnU3cU1UWU83eVZiMkVFeDczQXBmazY0aUpzRWVkWEtE?=
 =?utf-8?B?Unlnck5sYzZKd0tzclkrZG15MTNWZXNkUXlLTjZrQTI3c2RjMUVjVzUwUnI2?=
 =?utf-8?B?bGZYcTE1R0xrc0MvTTRhWlAzWjlza2c4Ky9XdTdhdytFdTFmdGhBQ0VKYTky?=
 =?utf-8?B?eDNQVkFiMVVKbXRFbmsxS0pkOWFXNExEZjdiV2M0TVkwUC9CQTV3K3d4eGcy?=
 =?utf-8?B?bWs1ODBnZ1FxRjlrTk53c2lMNlgzQUVoZHovNFZkbTdoSHhJTG9WUkFmdzVq?=
 =?utf-8?B?VU1VZzhFS1ZLOWVEcXJJVjBNOXJYZ3kzUEtaakp6Q0huWnNaMWJscG4yczdx?=
 =?utf-8?B?OG4xMFFVb2ROcVcyaHVqelN2UXdhNk96Z0lwTkVWSHB0R0NCcXJtWUdja29F?=
 =?utf-8?B?dFdWY2E4eTYxRDI0NXg2ekdFazNJaGdZd0d0NFQwS0lmWG1tT2ZDY3NHSW9T?=
 =?utf-8?B?NTRhR1h5N0xGT0xCYlFURmhZSVlIbnFtcG93V0pGL2tRelJFV1ROZkpYYTRa?=
 =?utf-8?B?ZWc3REI3MVF5Uy9jdStZVk1MajU1SUg4VGtIc3RkRGQzd2VzTUpPRlVERHg3?=
 =?utf-8?B?VjdwUVhRODlsY2RFWnNMYk1lL1FaMzlvRFlkZWo2dUUvLytSQXFJOWRKWXNx?=
 =?utf-8?B?M0FQL1ROR2doZTUzU2JibVh1bVNnM0VrS3crSjdYZ3FlenlMbkJTbUx6M0JF?=
 =?utf-8?Q?qf+WXwgqo+KK6URGMi3gzT5epsMPidEu97DNK0W?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4511
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f57dc015-f151-4bb5-f6a8-08d91a8353a5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AcO8q2Zf1omPcgbQX/JkxugaSpfucHY6iCuDYhWVescRDUwpgEc1O7lTJ6/MUiFVF0WC8kMZI2KUxW9xi4z7wzJ8zIbeVxCAoMUrW2C1w96xBxRiemvawYI6GHBBVFPeUFIZe0K4Hht2cBw4BoqOgs+IGDAwz9ogrIkxVxqGHsDRUfDVhVmwq02dSRem12ZO7reeGCCJBFyopw/oChBMzZIm6mZvjpCCOGwRKtSkIUZcynRZLH8oj44CbdbQaqRWHnmrKE8sqFWfumeASEuBlK63J5O8kSj9CFr30qAK1ZT5qxeLphCaDkuNniAixha6RCqfuWnGUebCckFCZipNsorDtCbunlE8esASpkhma1iFV+Ui0qYFzeHZ0YUDchk+ijBpa2gijCtPDG406Wg8YsT38Jjdbb/5s/yGAU3q8BDpr3x+qisIWK5YTqJV2u4Z+FSRFfEdIgAIJqjqSRdbVn3Zys8AOTkJAW89ys+ON61iquMcGUISBKsSrNfdsOcaHIYJInFIM37Rd/deBRBTzjzeCiCIumL0R3FmET9LSelcyoIVDPyPb7thpShFnXkbMctt9egsNRzIWQ5q+5W1xGaEmkHU2YHiHbUiAS98UVG92cFaSi88mgl9xvjNtNt4AQNuMC1keA9gOiBn1R8mSMd46Z20sp8R1+z5O+kObv4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(46966006)(36840700001)(86362001)(9686003)(186003)(2906002)(26005)(33656002)(47076005)(55016002)(8936002)(478600001)(4326008)(36860700001)(7696005)(82310400003)(83380400001)(70586007)(70206006)(336012)(8676002)(53546011)(356005)(54906003)(316002)(82740400003)(6506007)(5660300002)(81166007)(52536014)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 05:02:57.5697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 093c47ec-facc-44c4-e8ba-08d91a835e75
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5826

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgTWF5IDE4LCAyMDIxIDY6
MDEgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnDQo+IENjOiBC
ZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBXZWkgQ2hlbg0KPiA8
V2VpLkNoZW5AYXJtLmNvbT47IG5kIDxuZEBhcm0uY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENI
IDA0LzEwXSB4ZW4vYXJtOiBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0aW9uDQo+IA0KPiBIaSBQ
ZW5ueSwNCj4gDQo+IE9uIDE4LzA1LzIwMjEgMDY6MjEsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+
IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0aW9uLCBkdXJp
bmcgc3lzdGVtIFJBTSBib290DQo+IHVwLg0KPiA+DQo+ID4gTmV3IGZ1bmMgaW5pdF9zdGF0aWNt
ZW1fcGFnZXMgaXMgdGhlIGVxdWl2YWxlbnQgb2YgaW5pdF9oZWFwX3BhZ2VzLA0KPiA+IHJlc3Bv
bnNpYmxlIGZvciBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0aW9uLg0KPiA+DQo+ID4gSGVscGVy
IGZ1bmMgZnJlZV9zdGF0aWNtZW1fcGFnZXMgaXMgdGhlIGVxdWl2YWxlbnQgb2YgZnJlZV9oZWFw
X3BhZ2VzLA0KPiA+IHRvIGZyZWUgbnJfcGZucyBwYWdlcyBvZiBzdGF0aWMgbWVtb3J5Lg0KPiA+
IEZvciBlYWNoIHBhZ2UsIGl0IGluY2x1ZGVzIHRoZSBmb2xsb3dpbmcgc3RlcHM6DQo+ID4gMS4g
Y2hhbmdlIHBhZ2Ugc3RhdGUgZnJvbSBpbi11c2UoYWxzbyBpbml0aWFsaXphdGlvbiBzdGF0ZSkg
dG8gZnJlZQ0KPiA+IHN0YXRlIGFuZCBncmFudCBQR0NfcmVzZXJ2ZWQuDQo+ID4gMi4gc2V0IGl0
cyBvd25lciBOVUxMIGFuZCBtYWtlIHN1cmUgdGhpcyBwYWdlIGlzIG5vdCBhIGd1ZXN0IGZyYW1l
IGFueQ0KPiA+IG1vcmUgMy4gZm9sbG93IHRoZSBzYW1lIGNhY2hlIGNvaGVyZW5jeSBwb2xpY3kg
aW4gZnJlZV9oZWFwX3BhZ2VzIDQuDQo+ID4gc2NydWIgdGhlIHBhZ2UgaW4gbmVlZA0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGVubnkgWmhlbmcgPHBlbm55LnpoZW5nQGFybS5jb20+DQo+ID4g
LS0tDQo+ID4gICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICB8ICAyICsrDQo+ID4gICB4ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYyB8IDcwDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4gICB4ZW4vaW5jbHVkZS94ZW4vbW0uaCAgICB8ICAzICsrDQo+ID4gICAz
IGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jIGluZGV4DQo+ID4gNDQ0
ZGJiZDY3Ni4uZjgwMTYyYzQ3OCAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAu
Yw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ID4gQEAgLTgxOCw2ICs4MTgsOCBA
QCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfbW0odm9pZCkNCj4gPg0KPiA+ICAgICAgIHNldHVw
X2ZyYW1ldGFibGVfbWFwcGluZ3MocmFtX3N0YXJ0LCByYW1fZW5kKTsNCj4gPiAgICAgICBtYXhf
cGFnZSA9IFBGTl9ET1dOKHJhbV9lbmQpOw0KPiA+ICsNCj4gPiArICAgIGluaXRfc3RhdGljbWVt
X3BhZ2VzKCk7DQo+ID4gICB9DQo+ID4gICAjZW5kaWYNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jIGluZGV4DQo+
ID4gYWNlNjMzM2MxOC4uNThiNTNjNmFjMiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vY29tbW9uL3Bh
Z2VfYWxsb2MuYw0KPiA+ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jDQo+ID4gQEAgLTE1
MCw2ICsxNTAsOSBAQA0KPiA+ICAgI2RlZmluZSBwMm1fcG9kX29mZmxpbmVfb3JfYnJva2VuX2hp
dChwZykgMA0KPiA+ICAgI2RlZmluZSBwMm1fcG9kX29mZmxpbmVfb3JfYnJva2VuX3JlcGxhY2Uo
cGcpIEJVR19PTihwZyAhPSBOVUxMKQ0KPiA+ICAgI2VuZGlmDQo+ID4gKyNpZmRlZiBDT05GSUdf
QVJNXzY0DQo+ID4gKyNpbmNsdWRlIDxhc20vc2V0dXAuaD4NCj4gPiArI2VuZGlmDQo+ID4NCj4g
PiAgIC8qDQo+ID4gICAgKiBDb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBoZXhhZGVjaW1hbCBwYWdl
IG51bWJlcnMgY29udGFpbmluZyBiYWQNCj4gYnl0ZXMuDQo+ID4gQEAgLTE1MTIsNiArMTUxNSw0
OSBAQCBzdGF0aWMgdm9pZCBmcmVlX2hlYXBfcGFnZXMoDQo+ID4gICAgICAgc3Bpbl91bmxvY2so
JmhlYXBfbG9jayk7DQo+ID4gICB9DQo+ID4NCj4gPiArLyogRXF1aXZhbGVudCBvZiBmcmVlX2hl
YXBfcGFnZXMgdG8gZnJlZSBucl9wZm5zIHBhZ2VzIG9mIHN0YXRpYw0KPiA+ICttZW1vcnkuICov
IHN0YXRpYyB2b2lkIGZyZWVfc3RhdGljbWVtX3BhZ2VzKHN0cnVjdCBwYWdlX2luZm8gKnBnLA0K
PiA+ICt1bnNpZ25lZCBsb25nIG5yX3BmbnMsDQo+IA0KPiBUaGlzIGZ1bmN0aW9uIGlzIGRlYWxp
bmcgd2l0aCBNRk5zLCBzbyB0aGUgc2Vjb25kIHBhcmFtZXRlciBzaG91bGQgYmUgY2FsbGVkDQo+
IG5yX21mbnMuDQo+IA0KDQpBZ3JlZWQsIHRoeC4NCg0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBib29sIG5lZWRfc2NydWIpIHsNCj4gPiArICAgIG1mbl90IG1mbiA9IHBh
Z2VfdG9fbWZuKHBnKTsNCj4gPiArICAgIGludCBpOw0KPiA+ICsNCj4gPiArICAgIGZvciAoIGkg
PSAwOyBpIDwgbnJfcGZuczsgaSsrICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBzd2l0Y2gg
KCBwZ1tpXS5jb3VudF9pbmZvICYgUEdDX3N0YXRlICkNCj4gPiArICAgICAgICB7DQo+ID4gKyAg
ICAgICAgY2FzZSBQR0Nfc3RhdGVfaW51c2U6DQo+ID4gKyAgICAgICAgICAgIEJVR19PTihwZ1tp
XS5jb3VudF9pbmZvICYgUEdDX2Jyb2tlbik7DQo+ID4gKyAgICAgICAgICAgIC8qIE1ha2UgaXQg
ZnJlZSBhbmQgcmVzZXJ2ZWQuICovDQo+ID4gKyAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8g
PSBQR0Nfc3RhdGVfZnJlZSB8IFBHQ19yZXNlcnZlZDsNCj4gPiArICAgICAgICAgICAgYnJlYWs7
DQo+ID4gKw0KPiA+ICsgICAgICAgIGRlZmF1bHQ6DQo+ID4gKyAgICAgICAgICAgIHByaW50ayhY
RU5MT0dfRVJSDQo+ID4gKyAgICAgICAgICAgICAgICAgICAiUGFnZSBzdGF0ZSBzaGFsbCBiZSBv
bmx5IGluIFBHQ19zdGF0ZV9pbnVzZS4gIg0KPiA+ICsgICAgICAgICAgICAgICAgICAgInBnWyV1
XSBNRk4gJSJQUklfbWZuIiBjb3VudF9pbmZvPSUjbHgNCj4gdGxiZmx1c2hfdGltZXN0YW1wPSUj
eC5cbiIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICBpLCBtZm5feChtZm4pICsgaSwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8sDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICBwZ1tpXS50bGJmbHVzaF90aW1lc3RhbXApOw0KPiA+ICsgICAgICAgICAgICBCVUcoKTsN
Cj4gPiArICAgICAgICB9DQo+ID4gKw0KPiA+ICsgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICog
Rm9sbG93IHRoZSBzYW1lIGNhY2hlIGNvaGVyZW5jZSBzY2hlbWUgaW4gZnJlZV9oZWFwX3BhZ2Vz
Lg0KPiA+ICsgICAgICAgICAqIElmIGEgcGFnZSBoYXMgbm8gb3duZXIgaXQgd2lsbCBuZWVkIG5v
IHNhZmV0eSBUTEIgZmx1c2guDQo+ID4gKyAgICAgICAgICovDQo+ID4gKyAgICAgICAgcGdbaV0u
dS5mcmVlLm5lZWRfdGxiZmx1c2ggPSAocGFnZV9nZXRfb3duZXIoJnBnW2ldKSAhPSBOVUxMKTsN
Cj4gPiArICAgICAgICBpZiAoIHBnW2ldLnUuZnJlZS5uZWVkX3RsYmZsdXNoICkNCj4gPiArICAg
ICAgICAgICAgcGFnZV9zZXRfdGxiZmx1c2hfdGltZXN0YW1wKCZwZ1tpXSk7DQo+ID4gKw0KPiA+
ICsgICAgICAgIC8qIFRoaXMgcGFnZSBpcyBub3QgYSBndWVzdCBmcmFtZSBhbnkgbW9yZS4gKi8N
Cj4gPiArICAgICAgICBwYWdlX3NldF9vd25lcigmcGdbaV0sIE5VTEwpOw0KPiA+ICsgICAgICAg
IHNldF9ncGZuX2Zyb21fbWZuKG1mbl94KG1mbikgKyBpLCBJTlZBTElEX00yUF9FTlRSWSk7DQo+
IA0KPiBUaGUgY29kZSBsb29rcyBxdWl0ZSBzaW1pbGFyIHRvIGZyZWVfaGVhcF9wYWdlcygpLiBD
b3VsZCB3ZSBwb3NzaWJseSBjcmVhdGUNCj4gYW4gaGVscGVyIHdoaWNoIGNhbiBiZSBjYWxsZWQg
ZnJvbSBib3RoPw0KPiANCg0KT2ssIEkgd2lsbCBleHRyYWN0IHRoZSBjb21tb24gY29kZSBoZXJl
IGFuZCB0aGVyZS4NCiANCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCBuZWVkX3NjcnViICkNCj4g
PiArICAgICAgICAgICAgc2NydWJfb25lX3BhZ2UoJnBnW2ldKTsNCj4gDQo+IFNvIHRoZSBzY3J1
YmJpbmcgd2lsbCBiZSBzeW5jaHJvbm91cy4gSXMgaXQgd2hhdCB3ZSB3YW50Pw0KPiANCj4gWW91
IGFsc28gc2VlbSB0byBtaXNzIHRoZSBmbHVzaCB0aGUgY2FsbCB0byBmbHVzaF9wYWdlX3RvX3Jh
bSgpLg0KPiANCg0KWWVhaCwgcmlnaHQgbm93LCBpdCBpcyBzeW5jaHJvbm91cy4NCkkgZ3Vlc3Mg
dGhhdCBpdCBpcyBub3QgYW4gb3B0aW1hbCBjaG9pY2UsIG9ubHkgYSB3b3JrYWJsZSBvbmUgcmln
aHQgbm93Lg0KSSdtIHRyeWluZyB0byBib3Jyb3cgc29tZSBhc3luY2hyb25vdXMgc2NydWJiaW5n
IGlkZWFzIGZyb20gaGVhcCBpbiB0aGUgZnV0dXJlLg0KDQpZZXMhIElmIHdlIGFyZSBkb2luZyBz
eW5jaHJvbm91cyBzY3J1YmJpbmcsIHdlIG5lZWQgdG8gZmx1c2hfcGFnZV90b19yYW0oKS4gVGh4
Lg0KDQo+ID4gKyAgICB9DQo+ID4gK30NCj4gPg0KPiA+ICAgLyoNCj4gPiAgICAqIEZvbGxvd2lu
ZyBydWxlcyBhcHBsaWVkIGZvciBwYWdlIG9mZmxpbmU6DQo+ID4gQEAgLTE4MjgsNiArMTg3NCwz
MCBAQCBzdGF0aWMgdm9pZCBpbml0X2hlYXBfcGFnZXMoDQo+ID4gICAgICAgfQ0KPiA+ICAgfQ0K
PiA+DQo+ID4gKy8qIEVxdWl2YWxlbnQgb2YgaW5pdF9oZWFwX3BhZ2VzIHRvIGRvIHN0YXRpYyBt
ZW1vcnkgaW5pdGlhbGl6YXRpb24NCj4gPiArKi8gdm9pZCBfX2luaXQgaW5pdF9zdGF0aWNtZW1f
cGFnZXModm9pZCkgew0KPiA+ICsgICAgaW50IGJhbms7DQo+ID4gKw0KPiA+ICsgICAgLyoNCj4g
PiArICAgICAqIFRPRE86IENvbnNpZGVyaW5nIE5VTUEtc3VwcG9ydCBzY2VuYXJpby4NCj4gPiAr
ICAgICAqLw0KPiA+ICsgICAgZm9yICggYmFuayA9IDAgOyBiYW5rIDwgYm9vdGluZm8uc3RhdGlj
X21lbS5ucl9iYW5rczsgYmFuaysrICkNCj4gDQo+IGJvb3RpbmZvIGlzIGFybSBzcGVjaWZpYywg
c28gdGhpcyBjb2RlIHNob3VsZCBsaXZlIGluIGFyY2gvYXJtIHJhdGhlciB0aGFuDQo+IGNvbW1v
bi8uDQo+IA0KDQpZZXMsIEknbSBjb25zaWRlcmluZyB0byBjcmVhdGUgYSBuZXcgQ09ORklHX1NU
QVRJQ19NRU0gdG8gaW5jbHVkZSBhbGwNCnN0YXRpYy1tZW1vcnktcmVsYXRlZCBmdW5jdGlvbnMu
DQoNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBwYWRkcl90IGJhbmtfc3RhcnQgPSBib290aW5m
by5zdGF0aWNfbWVtLmJhbmtbYmFua10uc3RhcnQ7DQo+ID4gKyAgICAgICAgcGFkZHJfdCBiYW5r
X3NpemUgPSBib290aW5mby5zdGF0aWNfbWVtLmJhbmtbYmFua10uc2l6ZTsNCj4gPiArICAgICAg
ICBwYWRkcl90IGJhbmtfZW5kID0gYmFua19zdGFydCArIGJhbmtfc2l6ZTsNCj4gPiArDQo+ID4g
KyAgICAgICAgYmFua19zdGFydCA9IHJvdW5kX3BndXAoYmFua19zdGFydCk7DQo+ID4gKyAgICAg
ICAgYmFua19lbmQgPSByb3VuZF9wZ2Rvd24oYmFua19lbmQpOw0KPiA+ICsgICAgICAgIGlmICgg
YmFua19lbmQgPD0gYmFua19zdGFydCApDQo+ID4gKyAgICAgICAgICAgIHJldHVybjsNCj4gPiAr
DQo+ID4gKyAgICAgICAgZnJlZV9zdGF0aWNtZW1fcGFnZXMobWFkZHJfdG9fcGFnZShiYW5rX3N0
YXJ0KSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIChiYW5rX2VuZCAtIGJhbmtf
c3RhcnQpID4+IFBBR0VfU0hJRlQsIGZhbHNlKTsNCj4gPiArICAgIH0NCj4gPiArfQ0KPiA+ICsN
Cj4gPiAgIHN0YXRpYyB1bnNpZ25lZCBsb25nIGF2YWlsX2hlYXBfcGFnZXMoDQo+ID4gICAgICAg
dW5zaWduZWQgaW50IHpvbmVfbG8sIHVuc2lnbmVkIGludCB6b25lX2hpLCB1bnNpZ25lZCBpbnQg
bm9kZSkNCj4gPiAgIHsNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL21tLmggYi94
ZW4vaW5jbHVkZS94ZW4vbW0uaCBpbmRleA0KPiA+IDY2N2Y5ZGFjODMuLjhiMWEyMjA3YjIgMTAw
NjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL21tLmgNCj4gPiArKysgYi94ZW4vaW5jbHVk
ZS94ZW4vbW0uaA0KPiA+IEBAIC04NSw2ICs4NSw5IEBAIGJvb2wgc2NydWJfZnJlZV9wYWdlcyh2
b2lkKTsNCj4gPiAgIH0gd2hpbGUgKCBmYWxzZSApDQo+ID4gICAjZGVmaW5lIEZSRUVfWEVOSEVB
UF9QQUdFKHApIEZSRUVfWEVOSEVBUF9QQUdFUyhwLCAwKQ0KPiA+DQo+ID4gKy8qIFN0YXRpYyBN
ZW1vcnkgKi8NCj4gPiArdm9pZCBpbml0X3N0YXRpY21lbV9wYWdlcyh2b2lkKTsNCj4gPiArDQo+
ID4gICAvKiBNYXAgbWFjaGluZSBwYWdlIHJhbmdlIGluIFhlbiB2aXJ0dWFsIGFkZHJlc3Mgc3Bh
Y2UuICovDQo+ID4gICBpbnQgbWFwX3BhZ2VzX3RvX3hlbigNCj4gPiAgICAgICB1bnNpZ25lZCBs
b25nIHZpcnQsDQo+ID4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K
DQpDaGVlcnMNCg0KUGVubnkNCg==

