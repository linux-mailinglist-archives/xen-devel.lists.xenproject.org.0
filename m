Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65DC3FC74D
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 14:31:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175657.319911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL2vW-0007KW-6s; Tue, 31 Aug 2021 12:31:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175657.319911; Tue, 31 Aug 2021 12:31:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL2vW-0007IF-2Y; Tue, 31 Aug 2021 12:31:42 +0000
Received: by outflank-mailman (input) for mailman id 175657;
 Tue, 31 Aug 2021 12:31:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ybvi=NW=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mL2vU-0007I2-Fz
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 12:31:40 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0a::60f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 630be33d-5c3f-4b11-aeb0-b0a9c11019b0;
 Tue, 31 Aug 2021 12:31:37 +0000 (UTC)
Received: from AS9PR06CA0068.eurprd06.prod.outlook.com (2603:10a6:20b:464::32)
 by AM0PR08MB4226.eurprd08.prod.outlook.com (2603:10a6:208:147::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 12:31:25 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::c4) by AS9PR06CA0068.outlook.office365.com
 (2603:10a6:20b:464::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24 via Frontend
 Transport; Tue, 31 Aug 2021 12:31:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Tue, 31 Aug 2021 12:31:24 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Tue, 31 Aug 2021 12:31:24 +0000
Received: from de16bf6d608f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B83CF38-44B1-4DBE-9BE6-396285FF0CE5.1; 
 Tue, 31 Aug 2021 12:31:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de16bf6d608f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 31 Aug 2021 12:31:13 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4358.eurprd08.prod.outlook.com (2603:10a6:20b:b6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Tue, 31 Aug
 2021 12:31:12 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::c8de:afad:1d5a:efd0%5]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 12:31:12 +0000
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
X-Inumbo-ID: 630be33d-5c3f-4b11-aeb0-b0a9c11019b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doXlI1H/seSBWDipksJOj6lV8HxeKRiPDmx1/UDGOvI=;
 b=ii8JCvoGg9MCoxJs5iK+mVgKkxFez30W+E2W0ot1l//1shO2FCz2DR0bpi+Awi/t01d1WFHSq2jXhQA6RnHXkapJ0WXbRo2DKrL9gGmfKQOoIgmMi81OqlOAiOH7BErclQSM92fYWCO8yaeUjjXtzuoVae/H12tbqyfxhccFxk8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7301560e4c0ed7fb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaSBTIt39P/cosk3qsSywjjyyyceo/VYVBHSIv8fuBeKYQ4bfk693zvRdsqWn+70DUy3v7My6Tj7xDm8C4wBBaV8tECbOOIru/g/kEPBGCH0EHF3sh+S9YvU9nfRK1UYMFaRjVMCymQ+2Y/S0GHjlSE9UPK0UFhsKHdbRHWeW9jUH2unuRh5nUybwQUWjXxNP6P7S7vHmaaT9GxeQMfySeu4fi+9k048IHaV8jdQG+bXIQgm1N8si/JGCfOMYUvpKVDRGOEjFB9jUR5RjzFak42rWGnFOpY9PD1L914wBcdHSfGBQ6xRLv/+AHgV1pfcEgo8yesHyRISoEQblM3I9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doXlI1H/seSBWDipksJOj6lV8HxeKRiPDmx1/UDGOvI=;
 b=BTJkaLdbigafpJwc7WhjJpgLD5wF8S+Rk2mFTuJeycn8Osgur+Xt3C2qFxSS8DaqZbPQ7JBnAfRRgIbIwSZAJ4mtQeKXY7qDxUBABBf7hLlNHOllSbPF+tkJF2C9kXPubdnmc/PyuCv8B7+OVwd5WOH/xBUMWfn/F944ePf1pJHsgZfJifXvR5Jcna0pRN5FooWt+lmODhclSSbnUhS8Y43H4IWsn5/Cs8wRbyGj/BiNqyidxj6tBOzGFvhLRvPubbEWX4gChUniEF4EZL74mc7w3CSHFx4TMXrNpXG5AbQfSV6mqk9Z30WITMgSjXbYRBbMXN5swR3mGmKS2F0KGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doXlI1H/seSBWDipksJOj6lV8HxeKRiPDmx1/UDGOvI=;
 b=ii8JCvoGg9MCoxJs5iK+mVgKkxFez30W+E2W0ot1l//1shO2FCz2DR0bpi+Awi/t01d1WFHSq2jXhQA6RnHXkapJ0WXbRo2DKrL9gGmfKQOoIgmMi81OqlOAiOH7BErclQSM92fYWCO8yaeUjjXtzuoVae/H12tbqyfxhccFxk8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant
	<paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Topic: [PATCH v1 01/14] xen/pci: Refactor MSI code that implements MSI
 functionality within XEN
Thread-Index: AQHXlPJtf5AaTUXmz0eDPPo+F/e1VKuC1pUAgArHsAA=
Date: Tue, 31 Aug 2021 12:31:12 +0000
Message-ID: <8A59CEFF-6910-43F8-9F4B-EC923ADA80F9@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <d0b7b457762d481b19c8da6c2d55ff4acb4d6291.1629366665.git.rahul.singh@arm.com>
 <0d787e5d-9232-20ba-bb9f-6b14a15d9e64@suse.com>
In-Reply-To: <0d787e5d-9232-20ba-bb9f-6b14a15d9e64@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e4ce4f18-c9d7-48b6-c828-08d96c7b3f6c
x-ms-traffictypediagnostic: AM6PR08MB4358:|AM0PR08MB4226:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4226804CFA9831AB3EE88E21FCCC9@AM0PR08MB4226.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 g1a3SSygHpiDniWAzEEatlrQF/fVooWNNZoox0Nn9sYqnNe4z+ZpCzYeV/nE51/3hBfzgRaW5+rSGKCUetRcAl/EF6NQXjTJ7F2WEv9vWrwYFAhwOnOKJ7dnim+m7gVHTY5pWcy4cG4lFVFd1lebnnLk6YkwWo8gp4UjxdW9rO9Eeg62vIJwBWgCCagLA9wsPwWo3ska93M2NzNvDthK8LLU/lFdiE98iwycXHU55gWOsYN/wk0FHdyGQVItUyMAZHWtrdIdgIjF/4UYOkaR/l14zf7FNM9eC7EeUrwOstx7+J97qGbpcTRO8/CBKgWZdTGqFvq5kUvo0aW7Af8xwRO7d/s8LerCDI0wL//d+IrcywzPykQsF/Wkzb3OyekWt6oHIiuOJR4hsi0ZSv+J2NEUxIQB6P90VAJ89IyanQPNq7wwtKJSuDxSx7uEoSD3dsjZ9ZVqB5wJDKpit1DCUMzKbsvmdHjcczgVIASF/u02S3TFzzjyE/M9y+kJI8P720IbHjRHyJ43V7RzXhIzgdRDS9J4n7BM2ghujGhbKsrzDeDtRIWqcL4vtIi8RL90DaZea8AOZmrk1YzmDMsL02Nyfov+oy3FhzrG+vweral4czu80imaY8qDsf63EXv95+u5OaATpAfpgfLxxcFUyse8xlFEzvB55rqSzmQgwrZz+QWM1H5nJZiS267e5EGAvNSCSeqZNXpSsbQBQIVN9L4l+YLZJO7zJ/V6pDz6a/X9FlZ60rN79H2MpKBgpDMPCYQK73REsC3ldDEVOa06I9OBqx5RdtlVt40R06YSYVpNER4bO1ztun2cDvTOkt4+MpvKZWIFHwXB/rbO6R992g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(2616005)(76116006)(6916009)(478600001)(66556008)(64756008)(6512007)(91956017)(71200400001)(8676002)(66446008)(66946007)(5660300002)(6486002)(26005)(186003)(2906002)(38100700002)(7416002)(33656002)(38070700005)(4326008)(66476007)(54906003)(316002)(86362001)(8936002)(53546011)(36756003)(122000001)(83380400001)(6506007)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlFpaEF1VGF2SXJiUmRLdTdtSDFreUtYak5rdGhYREZMT1dRSDFEblpaZ1Qy?=
 =?utf-8?B?MmNhWlo4S0dTRExhRHROUGhnWGdxa01pOW1Ram1FOXJKOUNseEpxSjdoMWgv?=
 =?utf-8?B?eVY1VnhUaUpscmhTM05hK1J0dnE4dlViOTcyS25rdzVSN2JjdVBTNUNEa2Ev?=
 =?utf-8?B?VEhlZXBWK1Zua3ZiNHB1T0FKTW9uVUVxeWJuL2UyK1VSaXErdy9PbVZEOTJT?=
 =?utf-8?B?SkZSQkJXNUJqelVaWG8vNXg1bENwdklKaXZEMUNPOGZ4dnh5dHdUM2dYbjBX?=
 =?utf-8?B?S1RZcHZGTTllcGxwdjZybTNBdXhVdnM1SllmRjRsRFV2MmJ5M09lS3E2Rzg3?=
 =?utf-8?B?VGd3YVlFb0ZFSTJlNFVaSDd3ejlGT2I2dzd4SXlEWW1JZVJaeXpmM2F3dmho?=
 =?utf-8?B?aTd3MndvV0RQVGFGTnYwL3pjMndrZVBWeGFTWURuZnVkNjQxZ05TZHcwcHBE?=
 =?utf-8?B?bmIvTm5pa2lUa3gyRVhQS2Q0MTM2dmJnNGFTSGp3MStuWWlUTlJ2cm9EQmJP?=
 =?utf-8?B?QVFEOCtyMkRhZzlsQTlUQnN1S3doOThvS0YzTDRpQUZJUExtVzNKY2lFSzBP?=
 =?utf-8?B?RS81bzM3SFptRUhYa2xaME9PRUdnSTN4N3U5TDhlS3poSlJiOHoxSlkzMHVZ?=
 =?utf-8?B?bzhKMEJHeDFDZVcydUNKZ1RtY1lLYUQ5alFrbW10MEdNZmsxSFZuNXdLdGl3?=
 =?utf-8?B?NVVtR2x2blJNNWZCbW5WS3FxT2FVUUpNb1pTVjBFT1h6NmxPRTQ0N2lZQ1J1?=
 =?utf-8?B?d3EvcXFWb29TbjlvcS9Bd2c2WmJEd1VyMTliUUdwU1RHMWR4UzFTeEQvd2xZ?=
 =?utf-8?B?dDY4NFJGR05uVWRYQjJSc3hqeTczMUJEaWFKUlNKR2lzbndpbjl1K2ZMMkp6?=
 =?utf-8?B?VEM4S0dISmpmZTB1aEVLZDdQS3FwejRINytlRDhBS0FYRUFNM1U1NFNiUURh?=
 =?utf-8?B?dS8xdSt5TkVaY29MZWJXUmMvUElxejkwOGtFbi9iTGxWdkhwY1dzOUhpR3Q4?=
 =?utf-8?B?UVkzN1lJUWlHSkROS1JONThMeUt6SklvcUIxQlBzQXlvOVQyNWxGQ1pucFBk?=
 =?utf-8?B?aVFNQkdPV1lXOHBWUDVrT1JiYmFIOWVCRlpLTmY4TDZZNjRWSWx1RjQrOGlw?=
 =?utf-8?B?ZzhtU2FldSs0RElpekJ1ams2RUcvNi9qNWxKUWNXMVJwNndJRmM2cWR5S1NY?=
 =?utf-8?B?OWFFdzZ6SEFsam5GdGNzSlE0SWQ0V2JwRzhDUDBRcGcrNE1tN0ZERmlHMnJ6?=
 =?utf-8?B?aEdDelR6YUg0S2lPdmRPY0tXQ2FldG50NXRLZUV1TkxiQWNEY3JtN3REOHpv?=
 =?utf-8?B?bXA5R2FXVEhoVThyTllxTkI0T08yR2VXekRIWGpMbkNLOGgvM1gxNGJpU2o0?=
 =?utf-8?B?UzBGM3ptYlZhanZIWlBVY1RGU2dwYk9FclNGWk9ta000VHFiUTNGRjVsa2Zw?=
 =?utf-8?B?QThqcGJva3JnZzhPeUpWQVJ1d29URW9HZm1rZ1hsMDM5d2ZSMlJMNjJqcXJm?=
 =?utf-8?B?dUgyaVBTUkpaQ1YyS0VQZjhCMHdGYjRFSmJaeXlRS0dNSFRGUzJiaHdubVp1?=
 =?utf-8?B?WXQ0dlpObkpqSllVd0RESFRoampIR2NMQ20yazdrQXR0WnRYeVVEdWRrclI2?=
 =?utf-8?B?M3VrdjU5WXo1MmtOUGwvZUZOSlVSR0tVV1lTd1JxdnVNL3drbmw2Qk51YVlk?=
 =?utf-8?B?MEh1QmxrU1pRU1FOMjVTZUVkV25zbUtRQ1laNkxxS2w4WWkyc085dnV2SDcy?=
 =?utf-8?Q?RZFRAbwuj91VLq5gqpNlEZoU/y16ADcava6UPHM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4710E253899DA49AAA44E5763167069@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4358
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7edcc682-70ac-4bb0-ba8e-08d96c7b3821
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t28/URmH3scxqDQyecQyclJQjCjvmC0FYg2ACMRWxQw5p/HcWJT7Bnka98brTFUEX6EdRFiEoe6r7OL5KCFr7ZvQ3euQtb/pOAcThgZs9hpMliDUlETewnFap0rKQtKeYDz17yL44jcPF/4XTMZQYDbsoxvvla/oY0MRnmooGA98LWDD8igmgmHIzG5iXUQuaW1OBWTjyn0if0Uk3CKiFSmew9Gp5DRkmvKhaYeicVrpAUCEYrhS6759OjKl6kyjJPGGuPtKIko4O/MqwAFBbjRO/y0S0Wpi9WeVVir86PzSELYpuzLpf2KcH/fyB+lU9a2uuJtutKIaxFjzpxPAg6m95cj3L1ua86OwonDsyh+dFVVvDSJz0yF6rcUt2hxpEgFeLKmnNM6YNCqqOuwN1qw5BGT3lIIpGiYoXe8xf4phxOz90QrK0cNr+q2xbIC03zV5hIXY30NW1S8gaVvwPgngB3qPcTnQrcky1gzBNg8a2oDS5KKISzW3l+/8p2Phpj2E1Tp9crwcO8d9a88Y2fQzAELnxW0F9LYJ9/rmc3zRltyASbZYewtYCuHwrOO/gV86flQp46iqUbVyQKenkBhmX706WFEszdX+oa3v0NRo4hNHAw394zQsbQbYWwfB9buY0FBDog77gHWOoqi4jUYp5HTFxN9SYJgi6MjaNzR2220PUHRvqwiGtpLhiYZbTUzF2DV+Hx2XE7MJdiXnRj2h8WNUAC8RKugyhuUMSRfe/sW6eBaUFUYhI1pLJQoUEIFhGjbwLRKBQpw7gdeTuIhxjowIW9uD4LR+6GkNhMV4wRQ+HehsNsHAzWh4fsJy
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(36840700001)(46966006)(2906002)(82310400003)(316002)(70586007)(86362001)(83380400001)(5660300002)(36860700001)(36756003)(4326008)(2616005)(6512007)(8676002)(6486002)(336012)(81166007)(53546011)(478600001)(6506007)(8936002)(26005)(82740400003)(6862004)(186003)(47076005)(54906003)(356005)(70206006)(33656002)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 12:31:24.8100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ce4f18-c9d7-48b6-c828-08d96c7b3f6c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4226

SGkgSmFuLA0KDQo+IE9uIDI0IEF1ZyAyMDIxLCBhdCA0OjUzIHBtLCBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMTkuMDguMjAyMSAxNDowMiwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9tc2kuYw0KPj4gQEAgLTAsMCArMSw5NiBAQA0KPj4gKy8qDQo+PiArICogQ29weXJp
Z2h0IChDKSAyMDA4LCAgTmV0cm9ub21lIFN5c3RlbXMsIEluYy4NCj4gDQo+IFdoaWxlIGdlbmVy
YWxseSBjb3B5aW5nIGNvcHlyaWdodCBzdGF0ZW1lbnRzIHdoZW4gc3BsaXR0aW5nIHNvdXJjZQ0K
PiBmaWxlcyBpcyBwcm9iYWJseSB3YW50ZWQgKG9yIGV2ZW4gbmVjZXNzYXJ5KSBJIGRvdWJ0IHRo
aXMgaXMNCj4gc3VpdGFibGUgaGVyZTogTm9uZSBvZiB0aGUgTVNJIGNvZGUgdGhhdCB5b3UgbW92
ZSB3YXMgY29udHJpYnV0ZWQNCj4gYnkgdGhlbSBhZmFpY3QuDQoNCkxldCBtZSByZW1vdmUgdGhl
ICJDb3B5cmlnaHQgQ29weXJpZ2h0IChDKSAyMDA4LCAgTmV0cm9ub21lIFN5c3RlbXMsIEluYy7i
gJ0gLiANCkNhbiB5b3UgcGxlYXNlIGhlbHAgbWUgd2hhdCBjb3B5cmlnaHQgSSB3aWxsIGFkZCBm
b3IgdGhlIG5leHQgcGF0Y2ggPw0KPiANCj4+ICsgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdA0KPj4gKyAqIHVu
ZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UsDQo+PiArICogdmVyc2lvbiAyLCBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbi4NCj4+ICsgKg0KPj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRl
ZCBpbiB0aGUgaG9wZSBpdCB3aWxsIGJlIHVzZWZ1bCwgYnV0IFdJVEhPVVQNCj4+ICsgKiBBTlkg
V0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZiBNRVJDSEFOVEFC
SUxJVFkgb3INCj4+ICsgKiBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yDQo+PiArICogbW9yZSBkZXRhaWxzLg0K
Pj4gKyAqDQo+PiArICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcgd2l0aA0KPj4gKyAqIHRoaXMgcHJvZ3JhbTsg
SWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lg0KPj4gKyAqLw0KPj4g
Kw0KPj4gKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPg0KPj4gKyNpbmNsdWRlIDx4ZW4vcGNpLmg+DQo+
PiArI2luY2x1ZGUgPGFzbS9tc2kuaD4NCj4gDQo+IFlvdSBzdXJlbHkgbWVhbiB4ZW4vbXNpLmgg
aGVyZTogSGVhZGVycyBsaWtlIHRoaXMgb25lIHNob3VsZCBhbHdheXMNCj4gYmUgaW5jbHVkZWQg
YnkgdGhlIHByb2R1Y2VyLCBubyBtYXR0ZXIgdGhhdCBpdCBidWlsZHMgZmluZSB3aXRob3V0Lg0K
PiBFbHNlIHlvdSByaXNrIGRlY2xhcmF0aW9ucyBhbmQgZGVmaW5pdGlvbnMgdG8gZ28gb3V0IG9m
IHN5bmMuDQpPayAuIExldCBtZSBpbmNsdWRlIGhlcmUg4oCceGVuL21zaS5o4oCdIGFuZCBtb3Zl
IG90aGVyIHJlcXVpcmVkIGluY2x1ZGVzIHRvIOKAnHhlbi9tc2kuaCINCj4gDQo+PiArI2luY2x1
ZGUgPGFzbS9odm0vaW8uaD4NCj4+ICsNCj4+ICtpbnQgcGRldl9tc2l4X2Fzc2lnbihzdHJ1Y3Qg
ZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+PiArICAgIGludCByYzsN
Cj4+ICsNCj4+ICsgICAgaWYgKCBwZGV2LT5tc2l4ICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAg
cmMgPSBwY2lfcmVzZXRfbXNpeF9zdGF0ZShwZGV2KTsNCj4+ICsgICAgICAgIGlmICggcmMgKQ0K
Pj4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4+ICsgICAgICAgIG1zaXh0YmxfaW5pdChkKTsN
Cj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiAraW50
IHBkZXZfbXNpX2luaXQoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gKyAgICB1bnNp
Z25lZCBpbnQgcG9zOw0KPj4gKw0KPj4gKyAgICBJTklUX0xJU1RfSEVBRCgmcGRldi0+bXNpX2xp
c3QpOw0KPj4gKw0KPj4gKyAgICBwb3MgPSBwY2lfZmluZF9jYXBfb2Zmc2V0KHBkZXYtPnNlZywg
cGRldi0+YnVzLCBQQ0lfU0xPVChwZGV2LT5kZXZmbiksDQo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUENJX0ZVTkMocGRldi0+ZGV2Zm4pLCBQQ0lfQ0FQX0lEX01TSSk7DQo+PiAr
ICAgIGlmICggcG9zICkNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdWludDE2X3QgY3RybCA9IHBj
aV9jb25mX3JlYWQxNihwZGV2LT5zYmRmLCBtc2lfY29udHJvbF9yZWcocG9zKSk7DQo+PiArDQo+
PiArICAgICAgICBwZGV2LT5tc2lfbWF4dmVjID0gbXVsdGlfbXNpX2NhcGFibGUoY3RybCk7DQo+
PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcG9zID0gcGNpX2ZpbmRfY2FwX29mZnNldChwZGV2LT5z
ZWcsIHBkZXYtPmJ1cywgUENJX1NMT1QocGRldi0+ZGV2Zm4pLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFBDSV9GVU5DKHBkZXYtPmRldmZuKSwgUENJX0NBUF9JRF9NU0lYKTsN
Cj4+ICsgICAgaWYgKCBwb3MgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBzdHJ1Y3QgYXJjaF9t
c2l4ICptc2l4ID0geHphbGxvYyhzdHJ1Y3QgYXJjaF9tc2l4KTsNCj4+ICsgICAgICAgIHVpbnQx
Nl90IGN0cmw7DQo+PiArDQo+PiArICAgICAgICBpZiAoICFtc2l4ICkNCj4+ICsgICAgICAgICAg
ICByZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICsgICAgICAgIHNwaW5fbG9ja19pbml0KCZtc2l4
LT50YWJsZV9sb2NrKTsNCj4+ICsNCj4+ICsgICAgICAgIGN0cmwgPSBwY2lfY29uZl9yZWFkMTYo
cGRldi0+c2JkZiwgbXNpeF9jb250cm9sX3JlZyhwb3MpKTsNCj4+ICsgICAgICAgIG1zaXgtPm5y
X2VudHJpZXMgPSBtc2l4X3RhYmxlX3NpemUoY3RybCk7DQo+PiArDQo+PiArICAgICAgICBwZGV2
LT5tc2l4ID0gbXNpeDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICByZXR1cm4gMDsNCj4+ICt9
DQo+PiArDQo+PiArdm9pZCBwZGV2X21zaV9kZWluaXQoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+
PiArew0KPj4gKyAgICBYRlJFRShwZGV2LT5tc2l4KTsNCj4+ICt9DQo+PiArDQo+PiArdm9pZCBw
ZGV2X2R1bXBfbXNpKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsgICAg
Y29uc3Qgc3RydWN0IG1zaV9kZXNjICptc2k7DQo+PiArDQo+PiArICAgIHByaW50aygiLSBNU0lz
IDwgIik7DQo+PiArICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBtc2ksICZwZGV2LT5tc2lfbGlz
dCwgbGlzdCApDQo+PiArICAgICAgICBwcmludGsoIiVkICIsIG1zaS0+aXJxKTsNCj4+ICsgICAg
cHJpbnRrKCI+Iik7DQo+IA0KPiBXaGlsZSBub3QgYW4gZXhhY3QgZXF1aXZhbGVudCBvZiB0aGUg
b3JpZ2luYWwgY29kZSB0aGVuLCBjb3VsZCBJDQo+IHRhbGsgeW91IGludG8gYWRkaW5nIGFuIGVh
cmx5IGxpc3RfZW1wdHkoKSBjaGVjaywgc3VwcHJlc3NpbmcgYW55DQo+IG91dHB1dCBmcm9tIHRo
aXMgZnVuY3Rpb24gaWYgdGhhdCBvbmUgcmV0dXJuZWQgInRydWXigJ0/DQpPay4NCj4gDQo+PiBA
QCAtMTI3MSwxOCArMTI0OSwxNiBAQCBib29sX3QgcGNpZV9hZXJfZ2V0X2Zpcm13YXJlX2ZpcnN0
KGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gc3RhdGljIGludCBfZHVtcF9wY2lfZGV2
aWNlcyhzdHJ1Y3QgcGNpX3NlZyAqcHNlZywgdm9pZCAqYXJnKQ0KPj4gew0KPj4gICAgIHN0cnVj
dCBwY2lfZGV2ICpwZGV2Ow0KPj4gLSAgICBzdHJ1Y3QgbXNpX2Rlc2MgKm1zaTsNCj4+IA0KPj4g
ICAgIHByaW50aygiPT09PSBzZWdtZW50ICUwNHggPT09PVxuIiwgcHNlZy0+bnIpOw0KPj4gDQo+
PiAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHBkZXYsICZwc2VnLT5hbGxkZXZzX2xpc3QsIGFs
bGRldnNfbGlzdCApDQo+PiAgICAgew0KPj4gLSAgICAgICAgcHJpbnRrKCIlcHAgLSAlcGQgLSBu
b2RlICUtM2QgLSBNU0lzIDwgIiwNCj4+ICsgICAgICAgIHByaW50aygiJXBwIC0gJXBkIC0gbm9k
ZSAlLTNkICIsDQo+IA0KPiBUb2dldGhlciB3aXRoIHRoZSByZXF1ZXN0IGFib3ZlIHRoZSB0cmFp
bGluIGJsYW5rIGhlcmUgYWxzbyB3YW50cyB0bw0KPiBiZWNvbWUgYSBsZWFkaW5nIGJsYW5rIGlu
IHBkZXZfZHVtcF9tc2koKQ0KT2suDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vaW5j
bHVkZS94ZW4vbXNpLmgNCj4+IEBAIC0wLDAgKzEsNTYgQEANCj4+ICsvKg0KPj4gKyAqIENvcHly
aWdodCAoQykgMjAwOCwgIE5ldHJvbm9tZSBTeXN0ZW1zLCBJbmMuDQo+PiArICoNCj4+ICsgKiBU
aGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yIG1vZGlmeSBpdA0KPj4gKyAqIHVuZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UsDQo+PiArICogdmVyc2lvbiAyLCBhcyBwdWJs
aXNoZWQgYnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4NCj4+ICsgKg0KPj4gKyAqIFRo
aXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSBpdCB3aWxsIGJlIHVzZWZ1bCwg
YnV0IFdJVEhPVVQNCj4+ICsgKiBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGll
ZCB3YXJyYW50eSBvZiBNRVJDSEFOVEFCSUxJVFkgb3INCj4+ICsgKiBGSVRORVNTIEZPUiBBIFBB
UlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
DQo+PiArICogbW9yZSBkZXRhaWxzLg0KPj4gKyAqDQo+PiArICogWW91IHNob3VsZCBoYXZlIHJl
Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcgd2l0
aA0KPj4gKyAqIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9s
aWNlbnNlcy8+Lg0KPj4gKyAqLw0KPj4gKw0KPj4gKyNpZm5kZWYgX19YRU5fTVNJX0hfDQo+PiAr
I2RlZmluZSBfX1hFTl9NU0lfSF8NCj4+ICsNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQ0lfTVNJ
DQo+PiArDQo+PiArI2luY2x1ZGUgPGFzbS9tc2kuaD4NCj4+ICsNCj4+ICtpbnQgcGRldl9tc2l4
X2Fzc2lnbihzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldik7DQo+PiAraW50
IHBkZXZfbXNpX2luaXQoc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4gK3ZvaWQgcGRldl9tc2lf
ZGVpbml0KHN0cnVjdCBwY2lfZGV2ICpwZGV2KTsNCj4+ICt2b2lkIHBkZXZfZHVtcF9tc2koY29u
c3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpOw0KPj4gKw0KPj4gKyNlbHNlIC8qICFDT05GSUdfSEFT
X1BDSV9NU0kgKi8NCj4+ICtzdGF0aWMgaW5saW5lIGludCBwZGV2X21zaXhfYXNzaWduKHN0cnVj
dCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPiANCj4gUGxlYXNlIGJlIGNvbnNp
c3RlbnQgd2l0aCBibGFuayBsaW5lcyB5b3UgYWRkOyBoZXJlIHlvdSBhbHNvIHdhbnQgb25lDQo+
IGFmdGVyIHRoZSAjZWxzZS4NCg0KT2suDQoNCj4gDQo+PiArew0KPj4gKyAgICByZXR1cm4gMDsN
Cj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGlubGluZSBpbnQgcGRldl9tc2lfaW5pdChzdHJ1Y3Qg
cGNpX2RldiAqcGRldikNCj4+ICt7DQo+PiArICAgIHJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgcGRldl9tc2lfZGVpbml0KHN0cnVjdCBwY2lfZGV2ICpwZGV2
KSB7fQ0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBwY2lfY2xlYW51cF9tc2koc3RydWN0IHBjaV9k
ZXYgKnBkZXYpIHt9DQo+PiArc3RhdGljIGlubGluZSB2b2lkIHBkZXZfZHVtcF9tc2koY29uc3Qg
c3RydWN0IHBjaV9kZXYgKnBkZXYpIHt9DQo+IA0KPiBFc3BlY2lhbGx5IGZvciAoYnV0IHBlcmhh
cHMgbm90IGxpbWl0ZWQgdG8pIHRoaXMgIUhBU19QQ0lfTVNJIGNhc2UNCj4gKHdoZXJlIHlvdSBk
b24ndCBpbmNsdWRlIGFzbS9tc2kuaCBhbmQgaXRzIHBvc3NpYmxlIGRlcGVuZGVudHMpDQo+IHBs
ZWFzZSBmb3J3YXJkLWRlY2xhcmUgc3RydWN0LXMgeW91IHVzZSBpbiBwcm90b3R5cGVzIG9yIGlu
bGluZQ0KPiBzdHVicyAob3V0c2lkZSB0aGUgI2lmZGVmLCB0aGF0IGlzKS4gVGhpcyB3aWxsIGFs
bG93IGluY2x1ZGluZw0KPiB0aGlzIGhlYWRlciB3aXRob3V0IGhhdmluZyB0byBjYXJlIGFib3V0
IHByZXJlcSBoZWFkZXJzLg0KDQpPay4gTGV0IG1lIGRvIG1vZGlmaWNhdGlvbiBpbiBuZXh0IHZl
cnNpb24uDQoNClJlZ2FyZHMsDQpSYWh1bA0KPiANCj4gSWYgeW91IGFncmVlIHdpdGggYW5kIG1h
a2UgYWxsIHRoZSBzdWdnZXN0ZWQgb3IgcmVxdWVzdGVkIGNoYW5nZXMsDQo+IGZlZWwgZnJlZSB0
byBhZGQNCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
DQo+IEphbg0KPiANCg0K

