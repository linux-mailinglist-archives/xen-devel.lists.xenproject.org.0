Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB12DA0FB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 21:02:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52678.91953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kou2I-0005h4-MX; Mon, 14 Dec 2020 20:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52678.91953; Mon, 14 Dec 2020 20:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kou2I-0005gi-JJ; Mon, 14 Dec 2020 20:01:34 +0000
Received: by outflank-mailman (input) for mailman id 52678;
 Mon, 14 Dec 2020 20:01:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PveR=FS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kou2G-0005gd-Ou
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 20:01:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::605])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd96f3cf-05c5-4800-86f2-eceeaa17ccae;
 Mon, 14 Dec 2020 20:01:29 +0000 (UTC)
Received: from MR2P264CA0160.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::23) by
 AM7PR08MB5414.eurprd08.prod.outlook.com (2603:10a6:20b:105::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Mon, 14 Dec
 2020 20:01:26 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::f9) by MR2P264CA0160.outlook.office365.com
 (2603:10a6:501:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19 via Frontend
 Transport; Mon, 14 Dec 2020 20:01:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 20:01:25 +0000
Received: ("Tessian outbound 39646a0fd094:v71");
 Mon, 14 Dec 2020 20:01:24 +0000
Received: from b49702949785.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B1BF0D58-AA54-47B9-9D19-E6CCCAEB6608.1; 
 Mon, 14 Dec 2020 20:01:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b49702949785.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Dec 2020 20:01:09 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB4632.eurprd08.prod.outlook.com (2603:10a6:10:db::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 20:01:07 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125%5]) with mapi id 15.20.3654.025; Mon, 14 Dec 2020
 20:01:07 +0000
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
X-Inumbo-ID: fd96f3cf-05c5-4800-86f2-eceeaa17ccae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8OenHzXt6Q1vtDdwB5EEOrKrVTMPFSG0ASsxJqAA3U=;
 b=9xdAmvNc1R4FZZZyB6pQs43OYEgE24Ue3JCujkwUf+L8s1ceyKAzDjeN0CdmJpAPdBRbsFY7DKO/cdalLryrdShF9A0Hzg0yxnibx5evgTvHOABK1ytqmKrHdB17ZYJhVd/wUG6b4bzw/bS9PrxnYLoEb5usDqUmNgGLIjAc3cw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f70ac79d4693f58d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBmM6FgfzDFddi+nFbYWbiUzJQ6NBl4/IED4OqxE3mU/nEtbp2Hb0nnKelzt8YiLzsTixYwOtopMELdTZm8c0/NUBGHt9PyE7D1JyEaAWX53GfnfgdfWU6SKElynpdV7AGGzejS9tySSBu7bPUDCzunIeUabxb9Kk5GeS46JYV+xDMm+79Ow2yJGFPk7kyBR5igb8QVzxt7Rnm9fkl77cD+A9uBhj6XwKG8XQ7cBOmUxix0RQ6p/WGhWZYw6bc1vDLpz8qLnss5zOCkhjrxiGVVk2ywCsnRriF93ZuOI9dxsdGMUsiGgbInLdmkewq4jSFA8PBoYBYufZMcxOAtGNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8OenHzXt6Q1vtDdwB5EEOrKrVTMPFSG0ASsxJqAA3U=;
 b=AfWTuBGwpMfXhDnbnDTf31qcpo7UrrbKKQKz4EUrDkqNBq6LBSoRhlumLuNYA2dsA3hRGtd1kJPasfKWJRRNMwxloovL+EURop2Bv6dQ8QnNIrXrbCGUNQ7ANVtYRchJQPAvoXeqSMicric/lltvT4PCgTiJje3ACA8WcD3S8Ad9VhTyXsaNR5rDM0vIXCahvxrRMoLcnd32F9x89pE9nR6urp8wf+yz7jR+h69VHAboOzO4O9o1JgdTAsNcXOaTrbdTThwn4CHJkYgtnQQKltQ4wYjFOJKCJsr8XkVDxs89VoX4lB46GW3cQmEXiTvkEqQtSmpxJlCf3R93fwxV6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8OenHzXt6Q1vtDdwB5EEOrKrVTMPFSG0ASsxJqAA3U=;
 b=9xdAmvNc1R4FZZZyB6pQs43OYEgE24Ue3JCujkwUf+L8s1ceyKAzDjeN0CdmJpAPdBRbsFY7DKO/cdalLryrdShF9A0Hzg0yxnibx5evgTvHOABK1ytqmKrHdB17ZYJhVd/wUG6b4bzw/bS9PrxnYLoEb5usDqUmNgGLIjAc3cw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v3 0/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v3 0/8] xen/arm: Add support for SMMUv3 driver
Thread-Index: AQHWzxWmv96s8jlSw0aSETONfL1Dbanx9eOAgAUTqAA=
Date: Mon, 14 Dec 2020 20:01:07 +0000
Message-ID: <8ED5EAAF-48B0-4289-BCB0-232F70001134@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <ea121c23-4deb-c566-4d1d-bb9dd4959015@xen.org>
In-Reply-To: <ea121c23-4deb-c566-4d1d-bb9dd4959015@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94781a9d-408a-4fe4-23c5-08d8a06b098d
x-ms-traffictypediagnostic: DBBPR08MB4632:|AM7PR08MB5414:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB5414F330F5ABC34E1DD0BDA6FCC70@AM7PR08MB5414.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yCoi0nuTtXt0q23IAoS4zkITEhhkO6TydrrVUVauZiG5NKfUXDqaIgezNWRVOs0oYzVs1vyqTRTLvLY62NPPY/b9bw0Lyg8n1OAG7XxP7Zheatz8Gov+udCeWd8KXQHbQEk/R84uI6z1YakpjjCNI/yIXzPbPgnM68tLzumzSdLYYBOUvxGWlSa9TL8MQPGKw1EF3DuD0vO60Y51O+h0l8e2j+ipBuBTTvon6a//cWVB/wLzfPav0u2QAYQXXJIoNw6rma/1mSPrg+bSqBxEz3AfRdOuGzH3SeA59Z5+yc/CG9ewUNtaOQGFlsDntruJvISC5nw6/8RKCrWhsMJVfo4ZFWtpJ99vcp3ayofcMl+bMmf4DHuZFUAznuGUU1G1
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39850400004)(71200400001)(5660300002)(83380400001)(478600001)(33656002)(6486002)(6506007)(91956017)(8936002)(26005)(86362001)(53546011)(76116006)(66946007)(186003)(4326008)(6512007)(64756008)(8676002)(7416002)(66446008)(66476007)(36756003)(2616005)(54906003)(66556008)(316002)(6916009)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?cXliME9HRm16alNlTXVFNHdMOE00ZzRqWVNpNmFGZWF5ajgxSUNQaDlWdERS?=
 =?utf-8?B?YURUNWhzTHZ6QlhXbCtMM3JMY0NOdm9Zb21tUEVub1JhVmhxdmVndTczOHdr?=
 =?utf-8?B?NmJJVG5JdkZQai8wSHVPL2hkVzltVWI5aFp4Ny9SZ3kzS25hUkMrRSt0a3dK?=
 =?utf-8?B?R2VHNFp5eURSWlZmdk9Bd29mNXhVamsrNWFhVFo2allVNHBjTis4Y0Q1MDND?=
 =?utf-8?B?N2tvc2FCWGZReGkzRmpGUnU0bzR2a2IweXdpcHdLZDlYUXFzTnhZTzBGV2RP?=
 =?utf-8?B?QVIxSXg4cUFDSzdZSDZGaG1xRmRGWlJHL2xkL0J4bjIramFrKy9QcUs0MERp?=
 =?utf-8?B?ZjNSR240TXB1S20yMzc4N1RlSnRCZjBBOXVVOFVzbkNmZzAvbFI0Nm0rY293?=
 =?utf-8?B?S0dpbzVoWXNjNkZkZUhLdWN3OGNaZHNqRHRHa0ErSlBHdFRSZnRTdGwvN3pF?=
 =?utf-8?B?Nzg1QTBwQ0tYOTJLczZLeVdJTDJRajdlNTBIWldWZWxsM0hhOEFzeTdPbURP?=
 =?utf-8?B?d1BIZUpwR20zbDRaRlVNRTYzQk5ubTd1TkdZNUtQblBraGR4dFR4TStLRjUr?=
 =?utf-8?B?dVhoVGJsUFp6WVlJdjdkU1pqZHVQc3Y0c1pWb2RZL1h2SzdKVDVqQXg1R0h1?=
 =?utf-8?B?QnZzbXFHemFFQXBUQk8zVDVwSy8vb1pXRENucFN4akx4b1pSNlk4UEg3Ny84?=
 =?utf-8?B?NGhXYWN6Rk5yZW0rV1pQTGpIeVE5NkNqV2ZhZFErczEzZTR2WTN2OXdYK1N5?=
 =?utf-8?B?cmdrU3lpd1lzWitNREVIcStjaHB5T28xdXR3dmQrSDNVMzcySkNNQU5nVmxv?=
 =?utf-8?B?L215VkQvVExud1hhcHQ2TjhFY2JITEhTQTMxU2c5cjM5cFhjcnc4aXovSGpK?=
 =?utf-8?B?UHJFZ3NySk84YVpmM29DSmZQUkVnMnMrdDFnRGlHVzhqVFpzNTBjVzNUZ1JN?=
 =?utf-8?B?RzJzSVo2QzFxUVpxMkxpdlhsRjlXblA4cFllTFdyNVNnMXZVZloweUxwUlBG?=
 =?utf-8?B?TWRSc2EvOGlPbXB2OW4zSURMRVdMNGdqcm50VGVEaUxhY2dOUjVKUGIxSXRW?=
 =?utf-8?B?Y0xYQTl4TkIwaWgxWVRkSzdxODVaa2NsNGVTUEdSQjZNdXlyVXozU0k1c2J6?=
 =?utf-8?B?di9nM0lFZmdrOGNlL2trcUR6WCtjaE1WVUR5cTNjM2luc2o5V2g1c3hHa2NS?=
 =?utf-8?B?VzZZUUhLRENmcGR3a2hXWnFuZkhKcWkzNkRDMkNGMXYvRDdkb3JwN0dLOFBk?=
 =?utf-8?B?bCtzQnpIejJQOHVJdlptQm50OFVMQS9jZFZhMWxCTDZEcWhuOGZJdytabG0y?=
 =?utf-8?Q?fpFLTscblnfM+Uu5Ocie/x7/FmIXL4WaHy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAEA1E316DC2174CA124B93A8311D1BB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4632
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	50f44467-c899-4ac6-937c-08d8a06afec9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Fn2goNbYig/lKcSyRJmbJNaLaOOG6Vc/6JgQkUyB5AhlHYZOx243dBgHhEQgP+O4bOcpCJS3HX/+bArqh39zz2/Aon+yo7cmpPtYmLpQUXGKUtJgaIKVMROaDuEsyBRMwiRjj/+M/NF5aKn+wCHnf+zBBHUt44G3HU8RkEM0rLOthOtfdPiXALTjXMwnE3wYLH3KM2pNpwZdO2e67XWm99Yew6Gsgp8riDNtFFjjXK7+SYCDH/MBLDqnCo+olAPGuGLynSp8Hvg9iKnQMqEAtyFHL2XBp+oi3tw+1Z0FXpLByzIDVCBe18VEGm0imWKyt3lk0bO5tGJTgdxxoAkB2bHw2WoPbm+HbDFx0s4AfmKvZimeh5lLW3cZg1XH49kijMLDcBkZpf5a4LFy+7bFfA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(46966005)(6506007)(186003)(36756003)(6486002)(82310400003)(53546011)(86362001)(316002)(82740400003)(6862004)(81166007)(2906002)(47076004)(478600001)(5660300002)(4326008)(70206006)(356005)(26005)(8676002)(8936002)(70586007)(336012)(83380400001)(33656002)(54906003)(6512007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 20:01:25.3775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94781a9d-408a-4fe4-23c5-08d8a06b098d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5414

SGVsbG8gSnVsaWVuLFN0ZWZhbm8NCg0KPiBPbiAxMSBEZWMgMjAyMCwgYXQgMjoyOSBwbSwgSnVs
aWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiBIaSBSYWh1bCwNCj4gDQo+
IE9uIDEwLzEyLzIwMjAgMTY6NTYsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gVGhpcyBwYXRjaCBz
ZXJpZXMgaXMgdjMgb2YgdGhlIHdvcmsgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBTTU1VdjMgZHJp
dmVyLg0KPj4gQXBwcm9hY2ggdGFrZW4gaXMgdG8gZmlyc3QgbWVyZ2UgdGhlIExpbnV4IGNvcHkg
b2YgdGhlIFNNTVV2MyBkcml2ZXINCj4+ICh0YWcgdjUuOC4xOCkgYW5kIHRoZW4gbW9kaWZ5IHRo
ZSBkcml2ZXIgdG8gYnVpbGQgb24gWEVOLg0KPj4gTVNJIGFuZCBQQ0kgQVRTIGZ1bmN0aW9uYWxp
dHkgYXJlIG5vdCBzdXBwb3J0ZWQuIENvZGUgaXMgbm90IHRlc3RlZCBhbmQNCj4+IGNvbXBpbGVk
LiBDb2RlIGlzIGd1YXJkZWQgYnkgdGhlIGZsYWcgQ09ORklHX1BDSV9BVFMgYW5kIENPTkZJR19N
U0kgdG8gY29tcGlsZQ0KPj4gdGhlIGRyaXZlci4NCj4+IENvZGUgc3BlY2lmaWMgdG8gTGludXgg
aXMgcmVtb3ZlZCBmcm9tIHRoZSBkcml2ZXIgdG8gYXZvaWQgZGVhZCBjb2RlLg0KPj4gRHJpdmVy
IGlzIGN1cnJlbnRseSBzdXBwb3J0ZWQgYXMgdGVjaCBwcmV2aWV3Lg0KPj4gRm9sbG93aW5nIGZ1
bmN0aW9uYWxpdHkgc2hvdWxkIGJlIHN1cHBvcnRlZCBiZWZvcmUgZHJpdmVyIGlzIG91dCBmb3Ig
dGVjaA0KPj4gcHJldmlldw0KPj4gMS4gSW52ZXN0aWdhdGUgdGhlIHRpbWluZyBhbmFseXNpcyBv
ZiB1c2luZyBzcGluIGxvY2sgaW4gcGxhY2Ugb2YgbXV0ZXggd2hlbg0KPj4gICAgYXR0YWNoaW5n
IGEgIGRldmljZSB0byBTTU1VLg0KPj4gMi4gTWVyZ2VkIHRoZSBsYXRlc3QgTGludXggU01NVXYz
IGRyaXZlciBjb2RlIG9uY2UgYXRvbWljIG9wZXJhdGlvbiBpcw0KPj4gICAgYXZhaWxhYmxlIGlu
IFhFTi4NCj4+IDMuIFBDSSBBVFMgYW5kIE1TSSBpbnRlcnJ1cHRzIHNob3VsZCBiZSBzdXBwb3J0
ZWQuDQo+PiA0LiBJbnZlc3RpZ2F0ZSBzaWRlLWVmZmVjdCBvZiB1c2luZyB0YXNrbGV0IGluIHBs
YWNlIG9mIHRocmVhZGVkIElSUSBhbmQgZml4DQo+PiAgICBpZiBhbnkuDQo+IEluIHlvdXIgbGFz
dCBlLW1haWwsIHlvdSB3cm90ZSB0aGF0IHlvdSB3b3VsZCBpbnZlc3RpZ2F0ZSBhbmQgdGhlbiBj
b21lIGJhY2sgdG8gdXNlLiBJdCB3YXNuJ3QgY2xlYXIgdGhhdCB0aGlzIG1lYW50IHlvdSB3aWxs
IG5vdCBkZWFsIHdpdGggaXQgaW4gdGhpcyBzZXJpZXMuDQo+IA0KDQpZZXMsIEkgd2lsbCBpbnZl
c3RpZ2F0ZSB0aGUgc2lkZS1lZmZlY3Qgb2YgdXNpbmcgdGFza2xldCBidXQgbm90IHBhcnQgb2Yg
dGhpcyBwYXRjaCBzZXJpZXMuIEl0IHdpbGwgYmUgZ3JlYXQgaWYgd2UgcHJvY2VlZCBvbiB0aGlz
IHBhdGNoIHNlcmllcyBhcyBpdCBpcyAodXNpbmcgdGFza2xldCBpbiBwbGFjZSBvZiB0aHJlYWRl
ZC1JUlEpLg0KDQo+PiA1LiBmYWxsdGhvcnVnaCBrZXl3b3JkIHNob3VsZCBiZSBzdXBwb3J0ZWQu
DQo+IA0KPiBUaGlzIG9uZSBzaG91bGQgcmVhbGx5IGJlIGRvbmUgbm93Li4uIEl0IGlzIG5vdCBh
IGNvbXBsaWNhdGVkIG9uZS4uLg0KDQpPay4gSSB3aWxsIGltcGxlbWVudCBpbiBuZXh0IHZlcnNp
b24uDQogDQo+IA0KPj4gNi4gSW1wbGVtZW50IHRoZSBmZnNsbCBmdW5jdGlvbiBpbiBiaXRvcHMu
aCBmaWxlLg0KDQpXaGlsZSBpbXBsZW1lbnRpbmcgdGhlIGNvZGUgSSBmb3VuZCBvdXQgdGhhdCBM
aW51eCBpcyB1c2luZyB0aGUgYnVpbHQtaW4gZnVuY3Rpb24g4oCcX19idWlsdGluX2Zmc2xsKCkg
4oCcIGZvciBmZnNsbCBhbmQgdGhlcmUgaXMgbm8gaW1wbGVtZW50YXRpb24gYXZhaWxhYmxlIGlu
IExpbnV4IGZvciBmZnNsbC4NCklmIHdlIGltcGxlbWVudCB0aGUgZmZzbGwgaW4gWEVOIHdlIHdp
bGwgZGl2ZXJnZSBmcm9tIExpbnV4LiBJIGFtIHRoaW5raW5nIG9mIGFkZGluZyB0aGUgYmVsb3cg
Y29kZSBpbiAieGVuL2luY2x1ZGUvYXNtLWFybS9iaXRvcHMuaOKAnS4gDQpQbGVhc2Ugc3VnZ2Vz
dCBpZiBpdCBpcyBva2F5Pw0KDQpzdGF0aWMgYWx3YXlzX2lubGluZSBpbnQgZmZzbGwobG9uZyBs
b25nIHgpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIA0KeyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICANCiAgICByZXR1cm4gX19idWlsdGluX2Zmc2xsKHgpOyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICANCn0NCg0KUmVnYXJk
cywNClJhaHVsDQoNCj4gDQo+IC4uLiBzYW1lIGhlcmUuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAt
LSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

