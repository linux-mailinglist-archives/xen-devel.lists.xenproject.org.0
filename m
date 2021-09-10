Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04738406A14
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 12:23:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184238.332817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdgP-0007Uv-HI; Fri, 10 Sep 2021 10:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184238.332817; Fri, 10 Sep 2021 10:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdgP-0007SE-Di; Fri, 10 Sep 2021 10:22:57 +0000
Received: by outflank-mailman (input) for mailman id 184238;
 Fri, 10 Sep 2021 10:22:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wql=OA=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mOdgN-0007S8-Cj
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 10:22:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3ce8180-b45a-49c0-8710-afcc2e1f8bd0;
 Fri, 10 Sep 2021 10:22:52 +0000 (UTC)
Received: from AS8PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:20b:313::30)
 by AM9PR08MB6787.eurprd08.prod.outlook.com (2603:10a6:20b:2fe::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 10:22:49 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::e8) by AS8PR04CA0085.outlook.office365.com
 (2603:10a6:20b:313::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15 via Frontend
 Transport; Fri, 10 Sep 2021 10:22:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 10:22:48 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Fri, 10 Sep 2021 10:22:48 +0000
Received: from 5f710def0c6b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF75DACF-A543-4192-8E30-A52C2B37F692.1; 
 Fri, 10 Sep 2021 10:22:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5f710def0c6b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 10:22:38 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB5142.eurprd08.prod.outlook.com (2603:10a6:20b:d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 10:22:37 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 10:22:36 +0000
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
X-Inumbo-ID: a3ce8180-b45a-49c0-8710-afcc2e1f8bd0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IH2HzNoNfuCeV/9Zst8NrF5laXRyY0kXLZMgIrX9IQ=;
 b=L0zomk+/V965H9I60qIVlPItBkbpR4lZGQGq0+iGu+xAytQGJRrog2HgiRGc/968UxKQ71R0DN+MkP93uE9gDtAgDtdC40NklGXdizlxhppeoC3QDxprRHUG+KbWW7FjNQOpJFG8xE7N5LQ0pp1NNuVyKFCJb7HyWX04F+/60Ks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fc5448fffb42a874
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lp292GZZnetE+LimbD9HvWHr/eAIEx5moK+JG4tT+mmChNGLf0TFD7P/YrSaTpF6Ajg3qB3EiJZxbCdjda7N3Z5w073uT40juOcfNeofXHQwH5aA6Tojzh2lZB+ckMLojPXZEZ7j3RtNcub1Dylyf+7etlGvJVMS+s7YI86YzQd6PJrkzX3mxbb0pYjg9v0uZz9JWlurbgXsHnAYL9hfxtT+ZppTwu2zOD5OIpH0q9Xa86ekcDymQG56miQo+Iu+WSeKFVk4tvIle7u5pPzMxZDy/DtZSZOe26girHUM8R4WwjBas/kWfsbHFh618dlIC98AuZgmYiETy88kyFv9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=0IH2HzNoNfuCeV/9Zst8NrF5laXRyY0kXLZMgIrX9IQ=;
 b=PseFCo/tp8n89tNyGC1fIR/19NKoywAkMYUmsE3S2MiO0MgyzOIYJIFl1N8s4YBsv/y8LfYr0t7tnUWRk53bMlB1V92yGPTRiy50A9T5rYUw4AX9/7DdbFwsB8f4Bv5653Pkj7AVsy2L3l908I/plrQQO+6auV4JvRf27bAmT7nubMufgjQOfctyD3BSKogzH4fw07MUngj1hY03vqSQb4BqU13bGbmbDkfPU52K7lETyiAnVhZ8Con6HBX2R7aFJRe/EfgZZWC9K7ShI/B9TbbgCOzDCAM+EQ2xzXhN6PbuIUI/9epfBO5s1NFEk1HyF5Uy+3xJxh7AGJJdeykq/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IH2HzNoNfuCeV/9Zst8NrF5laXRyY0kXLZMgIrX9IQ=;
 b=L0zomk+/V965H9I60qIVlPItBkbpR4lZGQGq0+iGu+xAytQGJRrog2HgiRGc/968UxKQ71R0DN+MkP93uE9gDtAgDtdC40NklGXdizlxhppeoC3QDxprRHUG+KbWW7FjNQOpJFG8xE7N5LQ0pp1NNuVyKFCJb7HyWX04F+/60Ks=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 03/14] xen/pci: solve compilation error on ARM with
 ACPI && HAS_PCI
Thread-Topic: [PATCH v1 03/14] xen/pci: solve compilation error on ARM with
 ACPI && HAS_PCI
Thread-Index: AQHXlPKNppsGoVMjlkS0HQqYv0RYK6t7+ecAgABMtoCAAAOrgIAeuwQAgAIsWAA=
Date: Fri, 10 Sep 2021 10:22:36 +0000
Message-ID: <4CECF64B-EFAC-43B6-9D47-4C3040C9A286@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <97d39d3ee398d6018bdcaf745f00d039df6a92ef.1629366665.git.rahul.singh@arm.com>
 <5fad114f-06c4-120e-0a48-da7045fb85c5@suse.com>
 <76520AA8-D02C-4207-A722-33D935E76776@arm.com>
 <a8982dae-0928-3230-f10d-ada277bc8397@suse.com>
 <alpine.DEB.2.21.2109081802190.10523@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109081802190.10523@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5fb3432c-2425-42b0-2864-08d97444f03e
x-ms-traffictypediagnostic: AM6PR08MB5142:|AM9PR08MB6787:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB678757E47643AEBD5AC5F031FCD69@AM9PR08MB6787.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xW3ULkzwZYk5HIevKRj6ymHp+lB/sDqJ4CJ0mymkSAkbLpCbpQ52Tno9UOKfhPxc8YW1Y5GpFQc+Qi4qnTKdUByCNLWd6KRwDqUuow8pOMGxyAhemkyxoNCB2WfIjiCfiIxienT0e3eau6WBUz/CF1ngLumOpr1p138d/QS8Z61GLLaPYbxgV8h7+MQOcGknNee5Ixo231RFflbSgvV08Upc5tPIXS5M4OohvyGzTuENM2SgHyWk1t2eVfASyJ1mhk2BzTgArZt4MNfEVyz97p+uCqeO/K4OEx3IzUrJY+2DNWHrwn9rusZEwHtXO8fDAdQ1KtQOZQDMRyyT3aU8qgjfkIPNRF8EVG4K2iX+msiWvZ5kYLhwG05cdk6aWVf5VZptnPYKMJ8h/rCk6Rcuwm8qNl+TZDlJRPz2DwqQcuP4IuK5t+n2EjVtutwEMG+0Olnhmdc5ASMmMNkEZDFR+HMYO/cpFAdI+ltKPcTjumfsE/8U0OymiHesBHo7UmLFvW1P4SpykiPgZPTcQvA0XouPql793mYXx4cfNR//qum+i2Ew1MkZ4TeN59FTICJPn6NHxq2mRbunB7pzTChC2NDZnM0Uia6SgYLePZ7XG912+IqKu43Yrc/Py0Lqop0tDERee/Y2+dAVw/W6g4XqShu3MDJDtlxSa8oCEVdjzkMvyqAp2pt0Bk0aNu8WbfKBsE+52GXK69cXatBthD6RjvZQxR6g8EMmcc1NZLZiyw/wox8MA70y4F0cGwqTRP9k
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(5660300002)(38070700005)(316002)(6506007)(53546011)(71200400001)(36756003)(6916009)(54906003)(478600001)(66946007)(33656002)(4326008)(8936002)(76116006)(26005)(2616005)(66556008)(66476007)(6486002)(122000001)(6512007)(38100700002)(83380400001)(186003)(8676002)(66446008)(64756008)(2906002)(86362001)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D461B4BFA540E4EABFC5669A51CB09F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5142
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3bf1e85f-d6c0-4d9f-80dc-08d97444e8de
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HQEla8JVcJ/dfdiKImrQaxvXD9jIwNs/VTTs+/1ig3n6mXYxOicL5QyObDJMB1MrYvouEdPmluD0Kp8ssJIcET2Yk5TVXGSWM2SDh77CoxwA5y6UrduPhrQc6lTS6AuKmHptZHa+LbB3BJxEo2Q94k0Z3QTeSOftcbG0Lzbc+oD5BaMxZ+ik+JWm9OXMdpO6vUPQ73mHuog2q7xsVQbxqOTSBcUWz+mheBCGLzAsmpj5bfMeflgo0BjLQ1X0KfZxHffL1isj8r9KgUDO76n+Fgtfk/Hi6kFDSO5m5pRpcmF18NApnHeBp6Op3arzOpLKAA68Q/XZpyay+WvodHJZSxsoMwy0XzSxbOWoJKAJV1iMBHzf9RUpFPzJ18Rj2F7rVhQDBK11A3OCgAsuCgvUYKeqDzaEeZPhfsu6G7RayWnoF4tCgrG4tx8/SchJ2vbZt5yyeVmDtqpji7QZ7cYI4YA0rPRornIueMl5QhMwldVnnszBpLyZ66KU8FpX6qWFhAajr4B0GydxyNruxeyBwxPqrqD5TfhknZtHQnQKPp7icGrgMxVe1t1Z4GpSvogvuaPxlOnegUGCjCMD6wLcxjHLyLyv+O5y5BfQOiPDYSCz64ozcbkpRJOuYczAMM3PUDBGKN+k+kgyrGmhPQ/KGD2Rl+CcDA8O+7rM3IZ636lp6fdE+Y3L4c0+ZhEO0o0h0L043Aj7GV232muJeGubeA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(36840700001)(46966006)(36756003)(8676002)(82310400003)(316002)(6506007)(6862004)(82740400003)(53546011)(70206006)(83380400001)(356005)(4326008)(2616005)(26005)(8936002)(33656002)(70586007)(6512007)(54906003)(86362001)(336012)(186003)(2906002)(478600001)(5660300002)(36860700001)(6486002)(47076005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 10:22:48.6029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb3432c-2425-42b0-2864-08d97444f03e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6787

SGkgU3RlZmFubywNCg0KPiBPbiA5IFNlcCAyMDIxLCBhdCAyOjExIGFtLCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gRnJpLCAyMCBB
dWcgMjAyMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyMC4wOC4yMDIxIDEzOjQxLCBSYWh1
bCBTaW5naCB3cm90ZToNCj4+PiBIaSBKYW4NCj4+PiANCj4+Pj4gT24gMjAgQXVnIDIwMjEsIGF0
IDg6MDYgYW0sIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+IA0K
Pj4+PiBPbiAxOS4wOC4yMDIxIDE0OjAyLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+Pj4+IENvbXBp
bGF0aW9uIGVycm9yIGlzIG9ic2VydmVkIHdoZW4gQUNQSSBhbmQgSEFTX1BDSSBpcyBlbmFibGVk
IGZvciBBUk0NCj4+Pj4+IGFyY2hpdGVjdHVyZS4gTW92ZSB0aGUgY29kZSB1bmRlciBDT05GSUdf
WDg2IGZsYWcgdG8gZ2F0ZSB0aGUgY29kZSBmb3INCj4+Pj4+IEFSTS4NCj4+Pj4gDQo+Pj4+IFBs
ZWFzZSBnaXZlIGF0IGxlYXN0IG9uZSBleGFtcGxlIG9mIHdoYXQgaXQgaXMgdGhhdCBmYWlscyB0
byBjb21waWxlLg0KPj4+PiBXaGF0IGFuIGFwcHJvcHJpYXRlIGFjdGlvbiBpcyBkZXBlbmRzIG9u
IHRoZSBuYXR1cmUgb2YgdGhlIGVycm9yKHMpLA0KPj4+PiBhbmQgZnJvbSBsb29raW5nIGF0IHRo
ZSBlbmNsb3NlZCBjb2RlIEkgY2Fubm90IGVhc2lseSBzZWUgd2hhdCBpdA0KPj4+PiBtaWdodCBi
ZSB0aGF0IGJyZWFrcyBmb3IgQXJtLg0KPj4+IA0KPj4+IEkgYW0gb2JzZXJ2aW5nIGJlbG93IGVy
cm9yIHdoZW4gZW5hYmxlZCBBQ1BJICYmIEhBU19QQ0kgZm9yIEFSTS4NCj4+PiANCj4+PiBwcmVs
aW5rLm86IEluIGZ1bmN0aW9uIGBwY2llX2Flcl9nZXRfZmlybXdhcmVfZmlyc3TigJk6DQo+Pj4g
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jOjEyNTE6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYGFwZWlfaGVzdF9wYXJzZScNCj4+PiBhYXJjaDY0LWxpbnV4LWdudS1sZDogL2hvbWUvcmFo
c2luMDEvd29yay94ZW4vcGNpLXBhc3N0aHJvdWdoLXVwc3RyZWFtL3hlbi94ZW4vLnhlbi1zeW1z
LjA6IGhpZGRlbiBzeW1ib2wgYGFwZWlfaGVzdF9wYXJzZScgaXNuJ3QgZGVmaW5lZA0KPj4+IA0K
Pj4+IEkgZm91bmQgdGhhdCBhcGVpLyBpcyBvbmx5IGVuYWJsZWQgZm9yIHg4NiBhbmQgcGNpZV9h
ZXJfZ2V0X2Zpcm13YXJlX2ZpcnN0KCkgaXMgb25seSBjYWxsZWQgZnJvbSB4ODYgY29kZS4NCj4+
PiBvYmotJChDT05GSUdfWDg2KSArPSBhcGVpLw0KPj4+IA0KPj4+IEkgYW0gbm90IHN1cmUgd2hl
dGhlciB3ZSBuZWVkIHRoaXMgY29kZSBmb3IgQVJNIGFyY2hpdGVjdHVyZSANCj4+PiB0aGF0IGlz
IHdoeSBJIGdhdGUgdGhlIGNvZGUgZm9yIEFSTSB2aWEgQ09ORklHX1g4Ng0KPj4gDQo+PiBTbyB5
b3UgQXJtIGZvbGtzIHdpbGwgcHJvYmFibHkgd2FudCB0byBzZXR0bGUgb24gdGhhdCBhc3BlY3Qg
Zmlyc3QuIFdoYXQNCj4+IGlzIHdhbnRlZCB0byBrZWVwIHRoaW5ncyBidWlsZGluZyBkZXBlbmRz
IG9uIHRoYXQuDQo+IA0KPiBSZWFkaW5nIHRoZSBBUEVJIGRlc2NyaXB0aW9uLCBpdCBsb29rcyBs
aWtlIHRoZXJlIG1pZ2h0IGJlIHNvbWUgdXNlIGZvcg0KPiBpdCBvbiBBUk0gYnV0IGl0IHdvdWxk
IHdvcmsgYSBiaXQgZGlmZmVyZW50bHkgZnJvbSB4ODYgYXMgdGhlcmUgYXJlIG5vDQo+IE5NSXMg
b24gQVJNLiBTbyBlbmFibGluZyBBUEVJIG9uIEFSTSBpcyBub3QganVzdCBhIG1hdHRlciBvZiBl
bmFibGluZw0KPiB0aGUgYnVpbGQgb2YgYXBlaS8sIGl0IGlzIG5vdCBnb2luZyB0byBiZSBzdHJh
aWdodGZvcndhcmQuDQo+IA0KPiBGb3IgdGhlIHNjb3BlIG9mIHRoaXMgc2VyaWVzICh3aGljaCBp
cyBhY3R1YWxseSBhYm91dCBQQ0kpLCBJIHdvdWxkDQo+IGxlYXZlIGl0IGFsb25lLCBhbmQga2Vl
cCBhcGVpLyB4ODYgb25seSwgd2hpY2ggbWVhbnMgI2lmZGVmaW5nDQo+IHBjaWVfYWVyX2dldF9m
aXJtd2FyZV9maXJzdC4NCj4gDQo+IEkgd291bGQganVzdCBhZGQgYW4gaW4tY29kZSBjb21tZW50
IHNheWluZyAiQVBFSSBub3Qgc3VwcG9ydGVkIG9uIEFSTQ0KPiB5ZXTigJ0uDQogDQpPay4gSSB3
aWxsIGFkZCB0aGUgY29tbWVudCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gQW5vdGhlciBvcHRpb24g
d291bGQgYmUgdG8gaW50cm9kdWNlIGEgc3ltYm9sIGxpa2UgSEFTX0FDUElfQVBFSQ0KPiBidXQg
aXQgaXMgYSBiaXQgb3ZlcmtpbGwgZm9yIHRoaXMuDQoNClJlZ2FyZHMsDQpSYWh1bA==

