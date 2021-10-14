Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924CD42D42C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 09:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209043.365388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mavYT-0001QB-VJ; Thu, 14 Oct 2021 07:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209043.365388; Thu, 14 Oct 2021 07:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mavYT-0001Nh-Rp; Thu, 14 Oct 2021 07:53:33 +0000
Received: by outflank-mailman (input) for mailman id 209043;
 Thu, 14 Oct 2021 07:53:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iCUr=PC=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1mavYR-00019b-P0
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 07:53:31 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d261dbda-2cc3-11ec-81b3-12813bfff9fa;
 Thu, 14 Oct 2021 07:53:30 +0000 (UTC)
Received: from AM6P193CA0096.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::37)
 by PAXPR08MB6624.eurprd08.prod.outlook.com (2603:10a6:102:dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 07:53:26 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::a0) by AM6P193CA0096.outlook.office365.com
 (2603:10a6:209:88::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Thu, 14 Oct 2021 07:53:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Thu, 14 Oct 2021 07:53:26 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 14 Oct 2021 07:53:26 +0000
Received: from 1c877b85bad2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DEB1E27D-77BC-44B6-AE78-8E09361C4E14.1; 
 Thu, 14 Oct 2021 07:53:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c877b85bad2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Oct 2021 07:53:15 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (2603:10a6:4:74::9)
 by DB6PR08MB2822.eurprd08.prod.outlook.com (2603:10a6:6:1d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Thu, 14 Oct
 2021 07:53:13 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.030; Thu, 14 Oct 2021
 07:53:12 +0000
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
X-Inumbo-ID: d261dbda-2cc3-11ec-81b3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J79vioLckscLcM6JqhblayZZ63O2BK/HjMKwlN2DRDU=;
 b=D7V6mvmO3d8GBlcxbCaquv3i3xY7SUrcSCQzml5YANA7QierbiMokvFeX5wWu2H2UJIO1kiaB9o4eyikUDORfMH+hOdOIEECpb/zsytthGjxBlI3EtCUTFf0WwLlo0TCKR8ZY1OeBxLV57BU+JoVmy+4r4ftSdj9BlRXdXWeBiA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bd5f277f30b3a19e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcTfA52+CX08PPq3mdWBiyPD50WiGcOE+SeDnCInwArTMuE4QieOMbbon5yWWTFn/YqfLSjmEzBbOti8hdbYho+KG5tp3KLfjn8/9PdRrV/EY0Yp0uTjqc5dqf9QLA9jdVZbORHZdhHRDePUPI1YFQsmXxnGb+CnJFflrWyG2pBgJZWf9I1btmZnvCsxTY/RNs5vAmecijaFFWEXVsJNtXRufpQv+R7NwfqAgLSPlK8OjS6tRO9M8ysbKcn9U/aYFqfWEaWT2HXXTuH4wNJj3Dhi6VikkUpAARK/epB6qxtdJ4x5F+wZ2QK0jt1jAzjC2QHoTg4qT9Rt38l36redDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J79vioLckscLcM6JqhblayZZ63O2BK/HjMKwlN2DRDU=;
 b=mAZSluxuYRAIKLV0lyjTLARDCkAk3jA0y8KbvWkSXAp1WlqF9XC9QHVbQqnvEU4Ji13QSzb7GAYdBk3Is89sGA90Po7BrOZwfjTFBkqp/D7Li+YbVpctHjkpMCgPAhhiLVw+LbRkbfs6Q0xDbddZrJ9+SD8o6Mjj6CjceyeMnpdFx4qSWrlsMRNDp7p+dFEG5nCRb/1RH7X9IKhR5teQcG7knbiDButlfU55Zk4/Wk0dwb2o4jkAwpZqY2X/qKkf+chLyCWHKSJdOMfiY5AKAE5GlYjjiuEP6kiucwO8vc6lsRUgqHA2U4+oC1mNhtYC9yFE3DEY8gvQPg1wAYjAiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J79vioLckscLcM6JqhblayZZ63O2BK/HjMKwlN2DRDU=;
 b=D7V6mvmO3d8GBlcxbCaquv3i3xY7SUrcSCQzml5YANA7QierbiMokvFeX5wWu2H2UJIO1kiaB9o4eyikUDORfMH+hOdOIEECpb/zsytthGjxBlI3EtCUTFf0WwLlo0TCKR8ZY1OeBxLV57BU+JoVmy+4r4ftSdj9BlRXdXWeBiA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Andre Przywara <Andre.Przywara@arm.com>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Rahul Singh <Rahul.Singh@arm.com>, George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index:
 AQHXutl3YqS5dHXsYk6KpdKt4d14RavQp5+AgABHSICAAB7yAIAABuOAgABGSACAALogAIAAFjsA
Date: Thu, 14 Oct 2021 07:53:12 +0000
Message-ID: <0209BA09-920C-4505-BA91-27254F1AE891@arm.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
 <6d75f604-6938-b185-61e1-a6684d9fca14@suse.com>
 <2b943774-072e-20a1-b97c-d88b24adf340@epam.com>
 <ed4876ca-7384-42a8-6fba-e73c1840402a@suse.com>
 <alpine.DEB.2.21.2110131223210.9408@sstabellini-ThinkPad-T480s>
 <fa345819-068d-0049-f0e8-8b96379b4247@suse.com>
In-Reply-To: <fa345819-068d-0049-f0e8-8b96379b4247@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c7f63154-b2fa-4ce0-af8d-08d98ee7b47c
x-ms-traffictypediagnostic: DB6PR08MB2822:|PAXPR08MB6624:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB66244F0DDEDB0615E602C8739DB89@PAXPR08MB6624.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7Lhj9DI7qoAVCXqQpQCfTSHTkFDPytj0Tl53juY4HSdVu8D0PBJjme5+5dQJfOT7m++yMn3fAgP2BYPmPY6gwEB8E/0qhQChqsZt+KgVETNvef3mvO/UWg8x1ZEgIwSgXiuzBFVerIZ+bm4LtYRlSAckjpp73L3pBRezi1ClBPHRiYFxv2eD74gskO8mWrfIxPKpPefhso/lMsDhKeg+qaVwvjsvzeJozaCTLPDUOcIzN9Een5fW95gLpyNFkYck0NTb4XcJ25LVkMBAjcoHgX1e4GW4TA/T40VZl4L49cNRrE/EbmRXDraYE8FGIPl5QL92DxyWCXsdYPKR94bl1yxpAiLaQxW8Z8fSRix3XPx3YDAm1Mjtjq0Q3O5gRXQ64SxFQ7gJ8DqB/cU863GIHj8Yq08fh7PwFLyuD8KwmE631WVzIpBIRUE1OVlkefWg2+NB+z4eXZc+c+RV43bR6wgYwODX4so4w4BnxLV5RsX1tM6U2Sfpq/L9FkTsI3oTDB3qT7cMhSYO4RbxaX41lhDnFVJYVphb8sSkRVQ6BadyvZnxSqp9tQ1CV9UF3FTotLMDErb4Z8FYryhHG7S37Djn5ufwAh4HmV5k7FzACOcewF18HJrPe6wvrIn84t992hzH515MmlDphhy7dQbWvczju89JSImQRlCPdxM++6TJJlUCr6lVHNtI+QeD7dkxzJIdJhx8ZeSd5oU+/PDFC6jEmhlCcl6swL3gzCw9Hw2FpDVJmHcgFbO+3Hgjca84bulNwUq/GfDInZbGLGYbb7yG8Njtzwu3fJB+eUnvVyQnRrguNlPUL7RNoA3BS79a75wGEYkQ/M+xSnjgloj7KA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(33656002)(2906002)(6512007)(122000001)(71200400001)(86362001)(38100700002)(7416002)(4326008)(186003)(91956017)(64756008)(66446008)(36756003)(66946007)(2616005)(26005)(316002)(54906003)(76116006)(66556008)(66476007)(8676002)(53546011)(6506007)(8936002)(83380400001)(6486002)(38070700005)(6916009)(508600001)(966005)(2004002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A06ECD37E84E24E89C31E4376A96B60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2822
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ed74bc46-9933-468c-540e-08d98ee7ac5c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ABtoxPiPQsOeti7WEeWM54+N4OLavPFdUB1Ugv/oZ90CdyXzn3BPjfUSm+XGg/7SLoERq8BVcFJZ5BtWYwbnFUATcw8cVKpGrlOSz8uvvte2R1M/QeP9IhUcO3PQUpoZmrqnQrH5LWYmcin4Lu10iwf7K9Ml3PBNxzktcfu5GcXeGntODsz7PAcd1jNqH6Iqbb+FvlIPV5AC77eGDaC5gVO8r4fBMKjZK1nBq+Wafq6ba71e37g+ZnVD9fbli7OMPBiqaiHEEV+U7+keZVD69gCCtupn/ZkmdEAcRVyL0f5btIt/1jDFZGmCCmtkDHTwWGZpRyo06R/ZU6uXvidjpvy37EjCVukl1H3OSmzloKEpibak/8wG+uWGCAS27ChTeo7UPPOOQ/R/GbSQL4ZItYHmPiFAf024Uf36rW8A/LRKLyqDhMYeCNpWjhhDU+GMmVzr470rNWoFK3/J6fvnGHfkVJd/1vz8ivqHmyQ4KYESIpR7wcFu3EZMYIqq8U1ISy8UYbloj3YS26G8iJuPER7V8bQs9kt0fViLvUczWzxiQuV/esoEPGzlsJ84w3Brc98TIL0Eo5nCu9tc8Yex8OP2V5+FMRqo3nu4yVSkwxU+IWmgYg895mgslb4955Rl8L9WhzyC05tW8oNeG1cmqZmBoScXwFmgWrAyKJqQcMfSM7NhudKOXIrqG67AmnR5CWSciIo8/lm6Dm2ZBbHrNNzFSl6xc90KB9ZFs7rCG0OWlWeWR2J2QVOTzTZHNQAlyokygnPikWlf7/a69QU+ILFYXLfOui4jnesX3DKV3zGpYzD8Q/XYSyq0/306JKR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(81166007)(4326008)(54906003)(6486002)(26005)(8936002)(8676002)(356005)(316002)(508600001)(36860700001)(966005)(36756003)(47076005)(2906002)(6862004)(82310400003)(83380400001)(86362001)(70206006)(53546011)(6506007)(2616005)(107886003)(6512007)(33656002)(186003)(70586007)(336012)(5660300002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 07:53:26.4916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f63154-b2fa-4ce0-af8d-08d98ee7b47c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6624

SGksDQoNCj4gT24gMTQgT2N0IDIwMjEsIGF0IDA3OjMzLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTMuMTAuMjAyMSAyMToyNywgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOg0KPj4gT24gV2VkLCAxMyBPY3QgMjAyMSwgSmFuIEJldWxpY2ggd3JvdGU6
DQo+Pj4gT24gMTMuMTAuMjAyMSAxNjo1MSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6
DQo+Pj4+IE9uIDEzLjEwLjIxIDE2OjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDEz
LjEwLjIwMjEgMTA6NDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4gT24gV2VkLCBP
Y3QgMDYsIDIwMjEgYXQgMDY6NDA6MzRQTSArMDEwMCwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4+
Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4+
Pj4+PiBAQCAtMCwwICsxLDEwMiBAQA0KPj4+Pj4+PiArLyoNCj4+Pj4+Pj4gKyAqIHhlbi9hcmNo
L2FybS92cGNpLmMNCj4+Pj4+Pj4gKyAqDQo+Pj4+Pj4+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQ0KPj4+Pj4+
PiArICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5z
ZSBhcyBwdWJsaXNoZWQgYnkNCj4+Pj4+Pj4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yDQo+Pj4+Pj4+ICsgKiAoYXQg
eW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLg0KPj4+Pj4+PiArICoNCj4+Pj4+Pj4gKyAq
IFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLA0KPj4+Pj4+PiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2
ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YNCj4+Pj4+Pj4gKyAqIE1FUkNIQU5UQUJJTElUWSBv
ciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUNCj4+Pj4+Pj4gKyAq
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+Pj4+Pj4+ICsg
Ki8NCj4+Pj4+Pj4gKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4NCj4+Pj4+Pj4gKw0KPj4+Pj4+PiAr
I2luY2x1ZGUgPGFzbS9tbWlvLmg+DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyNkZWZpbmUgUkVHSVNU
RVJfT0ZGU0VUKGFkZHIpICAoIChhZGRyKSAmIDB4MDAwMDBmZmYpDQo+Pj4+Pj4+ICsNCj4+Pj4+
Pj4gKy8qIERvIHNvbWUgc2FuaXR5IGNoZWNrcy4gKi8NCj4+Pj4+Pj4gK3N0YXRpYyBib29sIHZw
Y2lfbW1pb19hY2Nlc3NfYWxsb3dlZCh1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgbGVu
KQ0KPj4+Pj4+PiArew0KPj4+Pj4+PiArICAgIC8qIENoZWNrIGFjY2VzcyBzaXplLiAqLw0KPj4+
Pj4+PiArICAgIGlmICggbGVuID4gOCApDQo+Pj4+Pj4+ICsgICAgICAgIHJldHVybiBmYWxzZTsN
Cj4+Pj4+Pj4gKw0KPj4+Pj4+PiArICAgIC8qIENoZWNrIHRoYXQgYWNjZXNzIGlzIHNpemUgYWxp
Z25lZC4gKi8NCj4+Pj4+Pj4gKyAgICBpZiAoIChyZWcgJiAobGVuIC0gMSkpICkNCj4+Pj4+Pj4g
KyAgICAgICAgcmV0dXJuIGZhbHNlOw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsgICAgcmV0dXJuIHRy
dWU7DQo+Pj4+Pj4+ICt9DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gK3N0YXRpYyBpbnQgdnBjaV9tbWlv
X3JlYWQoc3RydWN0IHZjcHUgKnYsIG1taW9faW5mb190ICppbmZvLA0KPj4+Pj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICByZWdpc3Rlcl90ICpyLCB2b2lkICpwKQ0KPj4+Pj4+PiArew0K
Pj4+Pj4+PiArICAgIHVuc2lnbmVkIGludCByZWc7DQo+Pj4+Pj4+ICsgICAgcGNpX3NiZGZfdCBz
YmRmOw0KPj4+Pj4+PiArICAgIHVuc2lnbmVkIGxvbmcgZGF0YSA9IH4wVUw7DQo+Pj4+Pj4+ICsg
ICAgdW5zaWduZWQgaW50IHNpemUgPSAxVSA8PCBpbmZvLT5kYWJ0LnNpemU7DQo+Pj4+Pj4+ICsN
Cj4+Pj4+Pj4gKyAgICBzYmRmLnNiZGYgPSBNTUNGR19CREYoaW5mby0+Z3BhKTsNCj4+Pj4+Pj4g
KyAgICByZWcgPSBSRUdJU1RFUl9PRkZTRVQoaW5mby0+Z3BhKTsNCj4+Pj4+Pj4gKw0KPj4+Pj4+
PiArICAgIGlmICggIXZwY2lfbW1pb19hY2Nlc3NfYWxsb3dlZChyZWcsIHNpemUpICkNCj4+Pj4+
Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICBkYXRhID0gdnBj
aV9yZWFkKHNiZGYsIHJlZywgbWluKDR1LCBzaXplKSk7DQo+Pj4+Pj4+ICsgICAgaWYgKCBzaXpl
ID09IDggKQ0KPj4+Pj4+PiArICAgICAgICBkYXRhIHw9ICh1aW50NjRfdCl2cGNpX3JlYWQoc2Jk
ZiwgcmVnICsgNCwgNCkgPDwgMzI7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICAqciA9IGRhdGE7
DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICByZXR1cm4gMTsNCj4+Pj4+Pj4gK30NCj4+Pj4+Pj4g
Kw0KPj4+Pj4+PiArc3RhdGljIGludCB2cGNpX21taW9fd3JpdGUoc3RydWN0IHZjcHUgKnYsIG1t
aW9faW5mb190ICppbmZvLA0KPj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
aXN0ZXJfdCByLCB2b2lkICpwKQ0KPj4+Pj4+PiArew0KPj4+Pj4+PiArICAgIHVuc2lnbmVkIGlu
dCByZWc7DQo+Pj4+Pj4+ICsgICAgcGNpX3NiZGZfdCBzYmRmOw0KPj4+Pj4+PiArICAgIHVuc2ln
bmVkIGxvbmcgZGF0YSA9IHI7DQo+Pj4+Pj4+ICsgICAgdW5zaWduZWQgaW50IHNpemUgPSAxVSA8
PCBpbmZvLT5kYWJ0LnNpemU7DQo+Pj4+Pj4+ICsNCj4+Pj4+Pj4gKyAgICBzYmRmLnNiZGYgPSBN
TUNGR19CREYoaW5mby0+Z3BhKTsNCj4+Pj4+Pj4gKyAgICByZWcgPSBSRUdJU1RFUl9PRkZTRVQo
aW5mby0+Z3BhKTsNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArICAgIGlmICggIXZwY2lfbW1pb19hY2Nl
c3NfYWxsb3dlZChyZWcsIHNpemUpICkNCj4+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4+
Pj4+ICsNCj4+Pj4+Pj4gKyAgICB2cGNpX3dyaXRlKHNiZGYsIHJlZywgbWluKDR1LCBzaXplKSwg
ZGF0YSk7DQo+Pj4+Pj4+ICsgICAgaWYgKCBzaXplID09IDggKQ0KPj4+Pj4+PiArICAgICAgICB2
cGNpX3dyaXRlKHNiZGYsIHJlZyArIDQsIDQsIGRhdGEgPj4gMzIpOw0KPj4+Pj4+IEkgdGhpbmsg
dGhvc2UgdHdvIGhlbHBlcnMgKGFuZCB2cGNpX21taW9fYWNjZXNzX2FsbG93ZWQpIGFyZSB2ZXJ5
DQo+Pj4+Pj4gc2ltaWxhciB0byB0aGUgZXhpc3RpbmcgeDg2IG9uZXMgKHNlZSB2cGNpX21tY2Zn
X3tyZWFkLHdyaXRlfSksIHVwIHRvDQo+Pj4+Pj4gdGhlIHBvaW50IHdoZXJlIEkgd291bGQgY29u
c2lkZXIgbW92aW5nIHRoZSBzaGFyZWQgY29kZSB0byB2cGNpLmMgYXMNCj4+Pj4+PiB2cGNpX2Vj
YW1fe3JlYWQsd3JpdGV9IGFuZCBjYWxsIHRoZW0gZnJvbSB0aGUgYXJjaCBzcGVjaWZpYyB0cmFw
DQo+Pj4+Pj4gaGFuZGxlcnMuDQo+Pj4+PiBFeGNlcHQgdGhhdCBwbGVhc2UgY2FuIHdlIHN0aWNr
IHRvIG1jZmcgb3IgbW1jZmcgaW5zdGVhZCBvZiBlY2FtDQo+Pj4+PiBpbiBuYW1lcywgYXMgdGhh
dCdzIGhvdyB0aGUgdGhpbmcgaGFzIGJlZW4gbmFtZWQgaW4gWGVuIGZyb20gaXRzDQo+Pj4+PiBp
bnRyb2R1Y3Rpb24/IEkndmUganVzdCBncmVwLWVkIHRoZSBjb2RlIGJhc2UgKGNhc2UgaW5zZW5z
aXRpdmVseSkNCj4+Pj4+IGFuZCBmb3VuZCBubyBtZW50aW9uIG9mIEVDQU0uIFRoZXJlIGFyZSBv
bmx5IGEgZmV3ICJiZWNhbWUiLg0KPj4+PiBJIGRvIHVuZGVyc3RhbmQgdGhhdCB0aGlzIGlzIGhp
c3RvcmljYWxseSB0aGF0IHdlIGRvIG5vdCBoYXZlIEVDQU0gaW4gWGVuLA0KPj4+PiBidXQgUENJ
IGlzIG5vdCBhYm91dCBYZW4uIFRodXMsIEkgdGhpbmsgaXQgaXMgYWxzbyBhY2NlcHRhYmxlIHRv
IHVzZQ0KPj4+PiBhIGNvbW1vbmx5IGtub3duIEVDQU0gZm9yIHRoZSBjb2RlIHRoYXQgd29ya3Mg
d2l0aCBFQ0FNLg0KPj4+IA0KPj4+IEFDUEksIGFmYWlrLCBhbHNvIGRvZXNuJ3QgY2FsbCB0aGlz
IEVDQU0uIFRoYXQncyB3aGVyZSBNQ0ZHIC8gTU1DRkcNCj4+PiBhY3R1YWxseSBjb21lIGZyb20s
IEkgYmVsaWV2ZS4NCj4+IA0KPj4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0ICJNQ0ZHIiBpcyB0
aGUgbmFtZSBvZiB0aGUgQUNQSSB0YWJsZSB0aGF0DQo+PiBkZXNjcmliZXMgdGhlIFBDSSBjb25m
aWcgc3BhY2UgWzFdLiBUaGUgdW5kZXJseWluZyBQQ0kgc3RhbmRhcmQgZm9yIHRoZQ0KPj4gbWVt
b3J5IG1hcHBlZCBsYXlvdXQgb2YgdGhlIFBDSSBjb25maWcgc3BhY2UgaXMgY2FsbGVkIEVDQU0u
IEhlcmUsIGl0DQo+PiBtYWtlcyBzZW5zZSB0byBjYWxsIGl0IEVDQU0gYXMgaXQgaXMgZmlybXdh
cmUgaW5kZXBlbmRlbnQuDQo+PiANCj4+IFsxXSBodHRwczovL3dpa2kub3NkZXYub3JnL1BDSV9F
eHByZXNzDQo+IA0KPiBPa2F5LCBJIGNhbiBhY2NlcHQgdGhpcywgYnV0IHRoZW4gSSdkIGV4cGVj
dCBhbGwgZXhpc3RpbmcgdXNlcyBvZg0KPiBNQ0ZHIC8gTU1DRkcgaW4gdGhlIGNvZGUgd2hpY2gg
YXJlbid0IGRpcmVjdGx5IEFDUEktcmVsYXRlZCB0byBnZXQNCj4gcmVwbGFjZWQuIE90aGVyd2lz
ZSBpdCdzIG5lZWRsZXNzbHkgaGFyZGVyIHRvIGlkZW50aWZ5IHRoYXQgb25lDQo+IHBpZWNlIG9m
IGNvZGUgcmVsYXRlcyB0byBjZXJ0YWluIG90aGVyIHBpZWNlcy4NCg0KVG8gc3VtIHVwIG9uIHRo
aXMgc3ViamVjdCwgaGVyZSB3aGF0IEkgd2lsbCBkbyBpbiB2ZXJzaW9uIDY6DQotIG1vdmUgdnBj
aV9lY2FtX3tyZWFkL3dyaXRlfSB0byB2cGNpLmMgYW5kIHJlbmFtZSB0aGVtDQotIHNhbWUgZm9y
IGFjY2VzcyBhbGxvd2VkIGFuZCBJIHdpbGwgcmVuYW1lIGl0IHRvIHZwY2lfZWNhbV9hY2Nlc3Nf
YWxsb3dlZA0KDQpJIHdpbGwgd29yayBvbiB0aGlzIGFuZCB0cnkgdG8gcHVzaCB2NiBiZWZvcmUg
dGhlIGVuZCBvZiB0aGUgZGF5IChhbHNvIGhhbmRsaW5nIG90aGVyIHJlbWFya3Mgb24gdGhpcyBw
YXRjaCkuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gSmFuDQo+IA0KDQo=

