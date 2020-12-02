Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46B2CBB4C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 12:13:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42628.76699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkQ3i-00070N-By; Wed, 02 Dec 2020 11:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42628.76699; Wed, 02 Dec 2020 11:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkQ3i-000701-8Y; Wed, 02 Dec 2020 11:12:30 +0000
Received: by outflank-mailman (input) for mailman id 42628;
 Wed, 02 Dec 2020 11:12:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=19jX=FG=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kkQ3h-0006zw-0e
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 11:12:29 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17817f11-7116-4496-932f-71c2005b44d9;
 Wed, 02 Dec 2020 11:12:27 +0000 (UTC)
Received: from MR2P264CA0189.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::28) by
 DBBPR08MB6314.eurprd08.prod.outlook.com (2603:10a6:10:20f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Wed, 2 Dec 2020 11:12:25 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:501:0:cafe::d9) by MR2P264CA0189.outlook.office365.com
 (2603:10a6:501::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Wed, 2 Dec 2020 11:12:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 11:12:25 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Wed, 02 Dec 2020 11:12:25 +0000
Received: from e68fdd47b439.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9C13AF4-53EF-4C44-901E-CEFBA07D9208.1; 
 Wed, 02 Dec 2020 11:12:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e68fdd47b439.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 02 Dec 2020 11:12:19 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4774.eurprd08.prod.outlook.com (2603:10a6:10:d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 11:12:17 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 11:12:17 +0000
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
X-Inumbo-ID: 17817f11-7116-4496-932f-71c2005b44d9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55YDo+2ySZR6FB/RCtllluDKqIZlFz0MgRXRLJ2YzL4=;
 b=whtWvXjwEH5IQRUA/B48svbADpGvk/Cfohu52tN6acxVDzmrpoik0R0/YSfi5UTa35mtG0KwU8y8b9b8g9CbvjuYnVVgp/npNwjH2IC0zvG5Qzo86nBgaVfHiGIOZaR0KcndCCjdnFe6FMDhoLgPIfl3C7l7ZI6rCCfvVpd7YNA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70a1a08dcc6b693c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWUOMJGvk2rr8pApZJFQhzYMgVoaFEBcFCcOh5icjy3N7LfPn8FDNWpFZRnSFN4l+j2tYAJcpbLzzN+qqKE27wMT0eWP/qJhdbnRvaMd6JeDCdP423sD5wjLl7YeG4eXJ8FSHPibJoQM1jWGDU1Y6AVoMYfG8xj2gm+Szd67b+aRyqR1fIIWxJT5vQEHAigDGH4+wDd3rwTj/13KKYVptneh2ORF1Hoi4FBQeBCl7n+wwdjMhrJi/58/iVwnKEGlnOgkpxLvcKqIeqWtsWySEDe2DkRCQ5UCuulWQ8/+u5HJ94pPmhBkjmV1DNdK8Ep0Gw2i8S7AXadb71Gk1aKawA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55YDo+2ySZR6FB/RCtllluDKqIZlFz0MgRXRLJ2YzL4=;
 b=FWdpz46PVemrnwxUtoUBNHwQQquD8YX2Mmwwo94zZmfaTEgQoPPv33Xn5Dg6RFw+A6hKEjomLm6xCiNyV2rJP6BjhiGHJosbm9/yhhW3NhaBd5lZKFQVItVIGClvy1o1pq2MIS2pqNlsHkjkSMJoeVL45F3w9rm/WvkFr/6tTsybL6WCDHtaHOKB40N7wCV6kA6/BvfhShuWntPaxOxXVOfHCCnbYYvFJSZiwPcjoUAT6XxMTEjqR0Y+nm0RYHpTtY9SRvqSVcgLNKYqxHfk6W+3YoneAmBSXT1I0bMqZhvpPMEDuiKwHAJFoCWSrHI1s9rFOJtXFyQ3qXQ1bRQp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55YDo+2ySZR6FB/RCtllluDKqIZlFz0MgRXRLJ2YzL4=;
 b=whtWvXjwEH5IQRUA/B48svbADpGvk/Cfohu52tN6acxVDzmrpoik0R0/YSfi5UTa35mtG0KwU8y8b9b8g9CbvjuYnVVgp/npNwjH2IC0zvG5Qzo86nBgaVfHiGIOZaR0KcndCCjdnFe6FMDhoLgPIfl3C7l7ZI6rCCfvVpd7YNA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Index:
 AQHWxyRuchSNSGGKDEyJCEQqqd6Vw6nhIUWAgAD/ugCAAAW5gIAAJWmAgAAq44CAATKvAA==
Date: Wed, 2 Dec 2020 11:12:17 +0000
Message-ID: <80D814EA-B0FC-4975-BB08-4D7DAE8C8B56@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
 <87lfei7fj5.fsf@epam.com> <AB32AAFF-DD1D-4B13-ABC0-06F460E95E1C@arm.com>
 <87sg8p687j.fsf@epam.com> <87243486-2A58-4497-B566-5FDE4158D18E@arm.com>
 <87h7p55uwj.fsf@epam.com>
In-Reply-To: <87h7p55uwj.fsf@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ee4714c2-7f3f-4841-5d38-08d896b325f6
x-ms-traffictypediagnostic: DBBPR08MB4774:|DBBPR08MB6314:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB63148D48271C4E013918164E9DF30@DBBPR08MB6314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p3ZMGsCzfM8hoXncZkz7waBRZ2eDiwU72kIGR5CaqOzrKNVk9fB9c3bEAlIZtuMoFwOq/Z+KdRa9PL79T88IU0BuJaX8r5uFkxdI7aNTj9g6d50vFj5vhX0FbjLYg0Iw8TbT+1kBt4sSy/6HLU4HMXXhjg0SyHamQcP9A0OgdwBOYa4x8HOkhdCwhxGXAVXyqnV6hV7mZJ0Zra4xzcbO3AKZ8sPzvzJ2cwWyLA27pcI2zdiZHmEwuw17uEaEuNVxuee5ACw4CV5EpL8E3DZUcxiAW4RXlnhhVSfEhP5f9urD3FuiGgIlbP8iDe67GtxXU5ZRMJZMPS33e/M4ZLxPENsh9g4R6wJ0OkpvlITi9ugsXdqpGWAYElc4l6ecj7pa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(396003)(39860400002)(346002)(6916009)(66556008)(66946007)(8936002)(76116006)(36756003)(316002)(71200400001)(86362001)(66476007)(91956017)(53546011)(33656002)(64756008)(66446008)(4326008)(2906002)(54906003)(2616005)(6486002)(6512007)(5660300002)(6506007)(83380400001)(8676002)(186003)(478600001)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?WXFuZWcvb1IxODlxdmdCTmV6NERKdzFIZTFlV2V0YmYzcXlxenNGaVBJSTJH?=
 =?utf-8?B?dWMrTmhpZXV1NXp0NmxDRkovMGlwUE90S1Bja1JoWUVIekNpcFJneVZnblFV?=
 =?utf-8?B?cFIzajZGQnE1TmZxUXZXMFZaYks2Z3diVC9WK2lFVDBKV2MwZ3c2akxBTllB?=
 =?utf-8?B?bVE2Um05OFFUbXRaK01pMHNqWmswU3J4T1hndWNmWE45ekVIMEkyMGhETDdP?=
 =?utf-8?B?cE1JNlh0U21KclQrcEg0UzkwQUxFdGl4b0hGR09CSkdTbHF4ZmZtMzlmV2dh?=
 =?utf-8?B?c0RRZ3hSdGJrRG44dFM3ZnFJeHlIVE9YeUErWkh6NVFYcXFOUlNkWXUycndO?=
 =?utf-8?B?N1ZudlJvT09UbFJtakREWjVLTGpOcVVENTYwMjVIeGNIdUVlREpmTk84MzZV?=
 =?utf-8?B?SVVEempUOGpmQmQ1aWVHK0JtUk1mRXMxTDMxYlhMaUNlclB4L3VTdzNjdFhL?=
 =?utf-8?B?Qmxnb1BZams0Mm5iSXZQRml2b1JKOW96alYzeDdsZTgvTEh5YjJxSnRjdFJy?=
 =?utf-8?B?YkR3U2g3b0gyYTExNDY5ZnVvT3VET0tXbkNoTG93elJxb0RWK09QUHU0dU54?=
 =?utf-8?B?L24ydGFmUFFiL0JlMjI5MVdSNWxnaGQrTy9JRFpkVlY2UjJaUHJpSVdyVFNO?=
 =?utf-8?B?RWw5NmRUS3c1b1llWmIwZkhMRndBWjY0bmV5dzJYNVZCaC9VQ05lajd3Zmcr?=
 =?utf-8?B?Y2Fsa2hHekZWWGg1SFNSRlJ5Um8zTytvQkQvb0t5WXgxRHM0SWozNDVvWkFl?=
 =?utf-8?B?SDkyRitGR2tlMUtzVUtuRUNOWER0VWoxSGxsSmxBeDBlZENNS29DK1BvWXJ2?=
 =?utf-8?B?MDJodDRRc01LN2VPTmxXb1FMdEFUNDZtc2tESWtMUkk5bHNValIwdGE4T01S?=
 =?utf-8?B?akQ5ZU00dFd2UmdmQVIwK1lGNExOTjkvcHl1cDdzNHp4YjVkV3dYNkp5dlRH?=
 =?utf-8?B?QnRESjJxYTFiVHRFdER4eU94aldHdjFLQ3R2OU9ta3RRSGZIdi9ob0pLWGJY?=
 =?utf-8?B?WFZXODBUb3NuakZwVEZEcmtsVEw3bGlLbjVUZEtidkJXODdwbWExT0Y2MjFo?=
 =?utf-8?B?MzUwSlZjelJadnVmNGtUbndtbTFGVlhicWxialFLQ215ZHFkT20yck5hRHZ2?=
 =?utf-8?B?Vm0zUnZXSlNiM3dJQWs3eFJhM2VDYXpyUHFkOFliVDZLZE4xK0R3b3labmRC?=
 =?utf-8?B?M3FwM0pDNnVjSW5BakxZRUE2VlBua1BTb3BtR2Fpc0h0ZjIra25zdExxTE4v?=
 =?utf-8?B?RDVZb3FnZzFNSUF1aG1TTTR6VTRVcEtmUXNkcjNLcHZuYVgwc0ZVYWFJTW91?=
 =?utf-8?Q?Ojtg4qMUxjgdPvO0+JA+T1YjyWeoXYqT8E?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <27A093D0A6887147ADC7DF6087671E90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4774
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f474106-ac64-46e7-5e9f-08d896b32167
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vUad7jZAqp9Zm56eq70bs0NuusMicYThSHnOUJLrTCRwsjlbnurd79c47fkcVIlNLU/ykWEPL3nl1WY0sXz6Dax4PiP/3A3uyI5a+SaMoDSzcgH8+xlroadffUv5pFnPfFtq8klV77qGW0JBnFog57BaVnzsl+4PcJHnZsUgmyqDJcyJLfL53dUMOCw5HxNfkQFmc3AT2VflaxnWhjYG1Bk/TDZ4tHZfmGdAGzGj07+LxylxdLFZ9PZ1weVvZI1WFcZIqwyZ4zrfjrlB9k29U5pkJ2Lh7Ms9vUDfsLzo8aeVeKLbKzKwdO31B8sIRJMcb71kQpyc7U36Wuh8NZTJ1Se3KWD2sDQLvjFAEfgzGYKVSG0MMIhKLIVxN4AfXJSSLRiWz+DQX/VNRWag+QsHqA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39860400002)(46966005)(6862004)(4326008)(53546011)(186003)(316002)(478600001)(336012)(6486002)(6506007)(47076004)(81166007)(70206006)(26005)(70586007)(82740400003)(6512007)(54906003)(82310400003)(2616005)(86362001)(356005)(2906002)(5660300002)(33656002)(8676002)(36756003)(83380400001)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 11:12:25.1391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4714c2-7f3f-4841-5d38-08d896b325f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6314

SEkgVm9sb2R5bXlyLA0KDQo+IE9uIDEgRGVjIDIwMjAsIGF0IDE2OjU0LCBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IEhpLA0K
PiANCj4gQmVydHJhbmQgTWFycXVpcyB3cml0ZXM6DQo+IA0KPj4gSGkgVm9sb2R5bXlyLA0KPj4g
DQo+Pj4gT24gMSBEZWMgMjAyMCwgYXQgMTI6MDcsIFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlt
eXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gDQo+Pj4gSGksDQo+Pj4gDQo+
Pj4gQmVydHJhbmQgTWFycXVpcyB3cml0ZXM6DQo+Pj4gDQo+Pj4+IEhpLA0KPj4+PiANCj4+Pj4+
IE9uIDMwIE5vdiAyMDIwLCBhdCAyMDozMSwgVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9C
YWJjaHVrQGVwYW0uY29tPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gDQo+Pj4+PiBCZXJ0cmFuZCBN
YXJxdWlzIHdyaXRlczoNCj4+Pj4+IA0KPj4+Pj4+IEFkZCBzdXBwb3J0IGZvciBlbXVsYXRpb24g
b2YgY3AxNSBiYXNlZCBJRCByZWdpc3RlcnMgKG9uIGFybTMyIG9yIHdoZW4NCj4+Pj4+PiBydW5u
aW5nIGEgMzJiaXQgZ3Vlc3Qgb24gYXJtNjQpLg0KPj4+Pj4+IFRoZSBoYW5kbGVycyBhcmUgcmV0
dXJuaW5nIHRoZSB2YWx1ZXMgc3RvcmVkIGluIHRoZSBndWVzdF9jcHVpbmZvDQo+Pj4+Pj4gc3Ry
dWN0dXJlLg0KPj4+Pj4+IEluIHRoZSBjdXJyZW50IHN0YXR1cyB0aGUgTVZGUiByZWdpc3RlcnMg
YXJlIG5vIHN1cHBvcnRlZC4NCj4+Pj4+IA0KPj4+Pj4gSXQgaXMgdW5jbGVhciB3aGF0IHdpbGwg
aGFwcGVuIHdpdGggcmVnaXN0ZXJzIHRoYXQgYXJlIG5vdCBjb3ZlcmVkIGJ5DQo+Pj4+PiBndWVz
dF9jcHVpbmZvIHN0cnVjdHVyZS4gQWNjb3JkaW5nIHRvIEFSTSBBUk0sIGl0IGlzIGltcGxlbWVu
dGF0aW9uDQo+Pj4+PiBkZWZpbmVkIGlmIHN1Y2ggYWNjZXNzZXMgd2lsbCBiZSB0cmFwcGVkLiBP
biBvdGhlciBoYW5kLCB0aGVyZSBhcmUgbWFueQ0KPj4+Pj4gcmVnaXN0ZXJzIHdoaWNoIGFyZSBS
QVouIFNvLCBnb29kIGJlaGF2aW5nIGd1ZXN0IGNhbiB0cnkgdG8gcmVhZCBvbmUgb2YNCj4+Pj4+
IHRoYXQgcmVnaXN0ZXJzIGFuZCBpdCB3aWxsIGdldCB1bmRlZmluZWQgaW5zdHJ1Y3Rpb24gZXhj
ZXB0aW9uLCBpbnN0ZWFkDQo+Pj4+PiBvZiBqdXN0IHJlYWRpbmcgYWxsIHplcm9lcy4NCj4+Pj4g
DQo+Pj4+IFRoaXMgaXMgdHJ1ZSBpbiB0aGUgc3RhdHVzIG9mIHRoaXMgcGF0Y2ggYnV0IHRoaXMg
aXMgc29sdmVkIGJ5IHRoZSBuZXh0IHBhdGNoDQo+Pj4+IHdoaWNoIGlzIGFkZGluZyBwcm9wZXIg
aGFuZGxpbmcgb2YgdGhvc2UgcmVnaXN0ZXJzIChhZGQgQ1AxMCBleGNlcHRpb24NCj4+Pj4gc3Vw
cG9ydCksIGF0IGxlYXN0IGZvciBNVkZSIG9uZXMuDQo+Pj4+IA0KPj4+PiBGcm9tIEFSTSBBUk0g
cG9pbnQgb2YgdmlldywgSSBkaWQgaGFuZGxlIGFsbCByZWdpc3RlcnMgbGlzdGVkIEkgdGhpbmsu
DQo+Pj4+IElmIHlvdSB0aGluayBzb21lIGFyZSBtaXNzaW5nIHBsZWFzZSBwb2ludCBtZSB0byB0
aGVtIGFzIE8gZG8gbm90DQo+Pj4+IGNvbXBsZXRlbHkgdW5kZXJzdGFuZCB3aGF0IGFyZSB0aGUg
4oCccmVnaXN0ZXJzIG5vdCBjb3ZlcmVk4oCdIHVubGVzcw0KPj4+PiB5b3UgbWVhbiB0aGUgTVZG
UiBvbmVzLg0KPj4+IA0KPj4+IFdlbGwsIEkgbWF5IGJlIHdyb25nIGZvciBhYXJjaDMyIGNhc2Us
IGJ1dCBmb3IgYWFyY2g2NCwgdGhlcmUgYXJlIG51bWJlcg0KPj4+IG9mIHJlc2VydmVkIHJlZ2lz
dGVycyBpbiBJRHMgcmFuZ2UuIFRob3NlIHJlZ2lzdGVycyBzaG91bGQgcmVhZCBhcw0KPj4+IHpl
cm8uIFlvdSBjYW4gZmluZCB0aGVtIGluIHRoZSBzZWN0aW9uICJDNS4xLjYgb3AwPT0wYjExLCBN
b3ZlcyB0byBhbmQNCj4+PiBmcm9tIG5vbi1kZWJ1ZyBTeXN0ZW0gcmVnaXN0ZXJzIGFuZCBTcGVj
aWFsLXB1cnBvc2UgcmVnaXN0ZXJzIiBvZiBBUk0NCj4+PiBEREkgMDQ4N0IuYS4gQ2hlY2sgb3V0
ICJUYWJsZSBDNS02IFN5c3RlbSBpbnN0cnVjdGlvbiBlbmNvZGluZ3MgZm9yDQo+Pj4gbm9uLURl
YnVnIFN5c3RlbSByZWdpc3RlciBhY2Nlc3NlcyIuDQo+PiANCj4+IFRoZSBwb2ludCBvZiB0aGUg
c2VyaWUgaXMgdG8gaGFuZGxlIGFsbCByZWdpc3RlcnMgdHJhcHBlZCBkdWUgdG8gVElEMyBiaXQg
aW4gSENSX0VMMi4NCj4+IA0KPj4gQW5kIGkgdGhpbmsgSSBoYW5kbGVkIGFsbCBvZiB0aGVtIGJ1
dCBJIG1pZ2h0IGJlIHdyb25nLg0KPj4gDQo+PiBIYW5kbGluZyBhbGwgcmVnaXN0ZXJzIGZvciBv
cDA9PTBiMTEgd2lsbCBjb3ZlciBhIGxvdCBtb3JlIHRoaW5ncy4NCj4+IFRoaXMgY2FuIGJlIGRv
bmUgb2YgY291cnNlIGJ1dCB0aGlzIHdhcyBub3QgdGhlIHBvaW50IG9mIHRoaXMgc2VyaWUuDQo+
PiANCj4+IFRoZSBsaXN0aW5nIGluIEhDUl9FTDIgZG9jdW1lbnRhdGlvbiBpcyBwcmV0dHkgY29t
cGxldGUgYW5kIGlmIEkgbWlzcyBhbnkgcmVnaXN0ZXINCj4+IHRoZXJlIHBsZWFzZSB0ZWxsIG1l
IGJ1dCBJIGRvIG5vIHVuZGVyc3RhbmQgZnJvbSB0aGUgZG9jdW1lbnRhdGlvbiB0aGF0IGFsbCBy
ZWdpc3RlcnMNCj4+IHdpdGggb3AwIDMgYXJlIHRyYXBwZWQgYnkgVElEMy4NCj4gDQo+IE15IGNv
bmNlcm4gaXMgdGhhdCB0aGUgc2FtZSBjb2RlIG1heSBvYnNlcnZlIGRpZmZlcmVudCBlZmZlY3Rz
IHdoZW4NCj4gcnVubmluZyBpbiBiYXJlbWV0YWwgbW9kZSBhbmQgYXMgVk0uDQo+IA0KPiBGb3Ig
ZXhhbXBsZSwgd2UgYXJlIHRyeWluZyB0byBydW4gYSBuZXdlciB2ZXJzaW9uIG9mIGEga2VybmVs
LCB0aGF0DQo+IHN1cHBvcnRzIHNvbWUgaHlwb3RoZXRpY2FsIEFSTXY4LjkuIEFuZCBpdCB0cmll
cyB0byByZWFkIGEgbmV3IElEDQo+IHJlZ2lzdGVyIHdoaWNoIGlzIGFic2VudCBpbiBBUk12OC4y
LiBUaGVyZSBhcmUgcG9zc2libGUgY2FzZXM6DQo+IA0KPiAwLiBJdCBydW5zIGFzIGEgYmFyZW1l
dGFsIGNvZGUgb24gYSBjb21wYXRpYmxlIGFyY2hpdGVjdHVyZS4gU28gaXQganVzdA0KPiBhY2Nl
c3NlcyB0aGlzIHJlZ2lzdGVyIGFuZCBhbGwgaXMgZmluZS4NCj4gDQo+IDEuIEl0IHJ1bnMgYXMg
YmFyZW1ldGFsIGNvZGUgb24gb2xkZXIgQVJNOCBhcmNoaXRlY3R1cmUuIEN1cnJlbnQNCj4gcmVm
ZXJlbmNlIG1hbnVhbCBzdGF0ZXMgdGhhdCB0aG9zZSByZWdpc3RlcnMgc2hvdWxkIHJlYWQgYXMg
emVybywgc28NCj4gYWxsIGlzIGZpbmUsIGFzIHdlbGwuDQo+IA0KPiAyLiBJdCBydW5zIGFzIFZN
IG9uIGFuIG9sZGVyIGFyY2hpdGVjdHVyZS4gSXQgaXMgSU1QTEVNRU5UQVRJT04gREVGSU5FRA0K
PiBpZiBIQ1IuSUQzIHdpbGwgY2F1c2UgdHJhcHMgd2hlbiBhY2Nlc3MgdG8gdW5hc3NpZ25lZCBy
ZWdpc3RlcnM6DQo+IA0KPiAyYS4gUGxhdGZvcm0gZG9lcyBub3QgY2F1c2UgdHJhcHMgYW5kIHNv
ZnR3YXJlIHJlYWRzIHplcm9zIGRpcmVjdGx5IGZyb20NCj4gcmVhbCByZWdpc3RlcnMuIFRoaXMg
aXMgYSBnb29kIG91dGNvbWUuDQo+IA0KPiAyYi4gUGxhdGZvcm0gY2F1c2VzIHRyYXAsIGFuZCB5
b3VyIGNvZGUgaW5qZWN0cyB0aGUgdW5kZWZpbmVkDQo+IGluc3RydWN0aW9uIGV4Y2VwdGlvbi4g
VGhpcyBpcyBhIGNhc2UgdGhhdCBib3RoZXJzIG1lLiBXZWxsIHdyaXR0ZW4gY29kZQ0KPiB0aGF0
IGlzIHRyaWVzIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBkaWZmZXJlbnQgdmVyc2lvbnMgb2YgYXJj
aGl0ZWN0dXJlDQo+IHdpbGwgZmFpbCB0aGVyZS4NCj4gDQo+IDMuIEl0IHJ1bnMgYXMgVk0gb24g
YSBuZXZlciBhcmNoaXRlY3R1cmUuIEkgY2FuIG9ubHkgc3BlY3VsYXRlIHRoZXJlLA0KPiBidXQg
SSB0aGluaywgdGhhdCBsaXN0IG9mIHJlZ2lzdGVycyB0cmFwcGVkIGJ5IEhDUi5JRDMgd2lsbCBi
ZSBleHRlbmRlZA0KPiB3aGVuIG5ldyBmZWF0dXJlcyBhcmUgYWRkZWQuIEF0IGxlYXN0LCB0aGlz
IGRvZXMgbm90IGNvbnRyYWRpY3Qgd2l0aCB0aGUNCj4gY3VycmVudCBJTVBMRU1FTlRBVElPTiBE
RUZJTkVEIGNvbnN0cmFpbnQuIEluIHRoaXMgY2FzZSwgaHlwZXJ2aXNvciB3aWxsDQo+IGluamVj
dCBleGNlcHRpb24gd2hlbiBndWVzdCB0cmllcyB0byBhY2Nlc3MgYSB2YWxpZCByZWdpc3Rlci4N
Cj4gDQo+IA0KPiBTbywgaW4gbXkgb3BpbmlvbiBhbmQgdG8gYmUgY29tcGF0aWJsZSB3aXRoIHRo
ZSByZWZlcmVuY2UgbWFudWFsLCB3ZQ0KPiBzaG91bGQgYWxsb3cgZ3Vlc3RzIHRvIHJlYWQgIlJl
c2VydmVkLCBSQVoiIHJlZ2lzdGVycy4NCg0KVGhhbmtzIGZvciB0aGUgdmVyeSBkZXRhaWxlZCBl
eHBsYW5hdGlvbiwgSSBrbm93IGJldHRlciB1bmRlcnN0YW5kIHdoYXQgeW91DQptZWFuIGhlcmUu
DQoNCkkgd2lsbCB0cnkgdG8gY2hlY2sgaWYgd2UgY291bGQgcmV0dXJuIFJBWiBmb3Ig4oCcb3Ro
ZXLigJ0gb3AwPTMgcmVnaXN0ZXJzIGFuZCB3aGF0DQpzaG91bGQgYmUgZG9uZSBvbiBjcDE1IHJl
Z2lzdGVycyB0byBoYXZlIHNvbWV0aGluZyBlcXVpdmFsZW50Lg0KDQpSZWdhcmRzDQpCZXJ0cmFu
ZA0KDQo+IA0KPiANCj4gDQo+PiBSZWdhcmRzDQo+PiBCZXJ0cmFuZA0KPj4gDQo+PiANCj4+PiAN
Cj4+PiANCj4+Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJl
cnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiBDaGFuZ2VzIGluIFYy
OiByZWJhc2UNCj4+Pj4+PiAtLS0NCj4+Pj4+PiB4ZW4vYXJjaC9hcm0vdmNwcmVnLmMgfCAzNSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+Pj4+IDEgZmlsZSBjaGFuZ2Vk
LCAzNSBpbnNlcnRpb25zKCspDQo+Pj4+Pj4gDQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS92Y3ByZWcuYyBiL3hlbi9hcmNoL2FybS92Y3ByZWcuYw0KPj4+Pj4+IGluZGV4IGNkYzkx
Y2RmNWIuLmQwYzY0MDZmMzQgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZjcHJl
Zy5jDQo+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3ZjcHJlZy5jDQo+Pj4+Pj4gQEAgLTE1NSw2
ICsxNTUsMTQgQEAgVFZNX1JFRzMyKENPTlRFWFRJRFIsIENPTlRFWFRJRFJfRUwxKQ0KPj4+Pj4+
ICAgICAgIGJyZWFrOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4+Pj4+PiAgIH0NCj4+Pj4+PiANCj4+Pj4+PiArLyogTWFjcm8gdG8gZ2Vu
ZXJhdGUgZWFzaWx5IGNhc2UgZm9yIElEIGNvLXByb2Nlc3NvciBlbXVsYXRpb24gKi8NCj4+Pj4+
PiArI2RlZmluZSBHRU5FUkFURV9USUQzX0lORk8ocmVnLGZpZWxkLG9mZnNldCkgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+Pj4+Pj4gKyAgICBjYXNlIEhTUl9DUFJFRzMyKHJlZyk6ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+Pj4+ICsgICAgeyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwNCj4+Pj4+PiArICAgICAgICByZXR1cm4gaGFuZGxlX3JvX3JlYWRfdmFsKHJlZ3MsIHJlZ2lk
eCwgY3AzMi5yZWFkLCBoc3IsICAgICBcDQo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgMSwgZ3Vlc3RfY3B1aW5mby5maWVsZC5iaXRzW29mZnNldF0pOyAgICAgXA0KPj4+Pj4+ICsg
ICAgfQ0KPj4+Pj4+ICsNCj4+Pj4+PiB2b2lkIGRvX2NwMTVfMzIoc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKnJlZ3MsIGNvbnN0IHVuaW9uIGhzciBoc3IpDQo+Pj4+Pj4gew0KPj4+Pj4+ICAgY29uc3Qg
c3RydWN0IGhzcl9jcDMyIGNwMzIgPSBoc3IuY3AzMjsNCj4+Pj4+PiBAQCAtMjg2LDYgKzI5NCwz
MyBAQCB2b2lkIGRvX2NwMTVfMzIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGNvbnN0IHVu
aW9uIGhzciBoc3IpDQo+Pj4+Pj4gICAgICAgICovDQo+Pj4+Pj4gICAgICAgcmV0dXJuIGhhbmRs
ZV9yYXpfd2kocmVncywgcmVnaWR4LCBjcDMyLnJlYWQsIGhzciwgMSk7DQo+Pj4+Pj4gDQo+Pj4+
Pj4gKyAgICAvKg0KPj4+Pj4+ICsgICAgICogSENSX0VMMi5USUQzDQo+Pj4+Pj4gKyAgICAgKg0K
Pj4+Pj4+ICsgICAgICogVGhpcyBpcyB0cmFwcGluZyBtb3N0IElkZW50aWZpY2F0aW9uIHJlZ2lz
dGVycyB1c2VkIGJ5IGEgZ3Vlc3QNCj4+Pj4+PiArICAgICAqIHRvIGlkZW50aWZ5IHRoZSBwcm9j
ZXNzb3IgZmVhdHVyZXMNCj4+Pj4+PiArICAgICAqLw0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElE
M19JTkZPKElEX1BGUjAsIHBmcjMyLCAwKQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZP
KElEX1BGUjEsIHBmcjMyLCAxKQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX1BG
UjIsIHBmcjMyLCAyKQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0RGUjAsIGRi
ZzMyLCAwKQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0RGUjEsIGRiZzMyLCAx
KQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0FGUjAsIGF1eDMyLCAwKQ0KPj4+
Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX01NRlIwLCBtbTMyLCAwKQ0KPj4+Pj4+ICsg
ICAgR0VORVJBVEVfVElEM19JTkZPKElEX01NRlIxLCBtbTMyLCAxKQ0KPj4+Pj4+ICsgICAgR0VO
RVJBVEVfVElEM19JTkZPKElEX01NRlIyLCBtbTMyLCAyKQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVf
VElEM19JTkZPKElEX01NRlIzLCBtbTMyLCAzKQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19J
TkZPKElEX01NRlI0LCBtbTMyLCA0KQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElE
X01NRlI1LCBtbTMyLCA1KQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIw
LCBpc2EzMiwgMCkNCj4+Pj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9JU0FSMSwgaXNh
MzIsIDEpDQo+Pj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjIsIGlzYTMyLCAy
KQ0KPj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIzLCBpc2EzMiwgMykNCj4+
Pj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9JU0FSNCwgaXNhMzIsIDQpDQo+Pj4+Pj4g
KyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfSVNBUjUsIGlzYTMyLCA1KQ0KPj4+Pj4+ICsgICAg
R0VORVJBVEVfVElEM19JTkZPKElEX0lTQVI2LCBpc2EzMiwgNikNCj4+Pj4+PiArICAgIC8qIE1W
RlIgcmVnaXN0ZXJzIGFyZSBpbiBjcDEwIG5vIGNwMTUgKi8NCj4+Pj4+PiArDQo+Pj4+Pj4gICAv
Kg0KPj4+Pj4+ICAgICogSENSX0VMMi5USURDUA0KPj4+Pj4+ICAgICoNCj4+Pj4+IA0KPj4+Pj4g
DQo+Pj4+PiAtLSANCj4+Pj4+IFZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0NCj4+PiANCj4+PiAN
Cj4+PiAtLSANCj4+PiBWb2xvZHlteXIgQmFiY2h1ayBhdCBFUEFNDQo+IA0KPiANCj4gLS0gDQo+
IFZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0NCg0K

