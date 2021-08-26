Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2553F86FA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 14:09:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172971.315621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEBD-0003ub-Mu; Thu, 26 Aug 2021 12:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172971.315621; Thu, 26 Aug 2021 12:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJEBD-0003r9-Is; Thu, 26 Aug 2021 12:08:23 +0000
Received: by outflank-mailman (input) for mailman id 172971;
 Thu, 26 Aug 2021 12:08:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJEBC-0003r3-HB
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 12:08:22 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9864f177-6262-476b-9e51-f890fe925071;
 Thu, 26 Aug 2021 12:08:19 +0000 (UTC)
Received: from AM6P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::42)
 by AM8PR08MB6514.eurprd08.prod.outlook.com (2603:10a6:20b:36b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Thu, 26 Aug
 2021 12:08:18 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::8a) by AM6P195CA0029.outlook.office365.com
 (2603:10a6:209:81::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Thu, 26 Aug 2021 12:08:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 12:08:17 +0000
Received: ("Tessian outbound 8b41f5fb4e9e:v103");
 Thu, 26 Aug 2021 12:08:17 +0000
Received: from 0115b457d433.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC1803B7-2A1B-458D-993B-1B521381747F.1; 
 Thu, 26 Aug 2021 12:08:11 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0115b457d433.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 12:08:11 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB6281.eurprd08.prod.outlook.com (2603:10a6:10:1f6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 12:08:09 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 12:08:09 +0000
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
X-Inumbo-ID: 9864f177-6262-476b-9e51-f890fe925071
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oLweSJtCwqTAEnsOEJgf653dcWn2syINwRuJqI0+Nc=;
 b=tInKESJtQuV6gB1fkwgJ2kvL8y+zQlDiautUDDLyZAePl9jxGjsWh0IvNSnRHleqM08TF2c1zpuu9tBwUUzFYtEcA4RTib1mD9t9Zy185dBCgznjMovFxBBSlLzzZE1gByHwh93wrbpBy4Zrw36TbLL2rNvuy5mphDr9OA6Ea6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTqDJkdGYHpmikcTIS+2oe4EORXtl4tIcdStxI/l2HbEZnB3Cb5Fwj/L9CfUTn/NeC+rVCFZ7Yw74LxaAUaMlEATHkkpB9K8daP1E5XU+44y6jGDFynNBuoGY1aZ+FFptcK7H/65e4YKON2OliQxq59IXJG0959t3+6gO8dIkVyO1rRRSOyT5UsT4lB8Zv03z9fPJMyNbZmyVmjYdD3YqHh1iu2kGhWRsRHekWZ/xvTOD0XyUKrOLTMzCFomIYgIRQxiERw34Bg+a+2FRZhOJ0d2hafXunSCuTXO7BEankaq+dohms0j3f/jwXLcNgWGRE9mUr0ft7RWFvloY9xKsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oLweSJtCwqTAEnsOEJgf653dcWn2syINwRuJqI0+Nc=;
 b=Py3u3J13X+jiw/+DeCszudAsn7T4pP0a0k4UGdmQ6qOz12lkeQnAIjO0GERwsRrhio8gzb10qjfo9i1b2oPq98HNzfq1wQTxFaeGXLYx74GNoBBHgjGHBAAdSEhuP3laPeBmXAE1UYKnruwm4KeRm3THnFLiyPPzDKtI2bShaq8W07Z3MYNWZlk6XK3PKpra3NreuHqFHDiFWh4qj02aQMDXoy8AJfKr8Pd2gWC9Js5peGNBDSb77dmVEu6Tsw6hEdBH9URvWPzrrPEFvSQBB5qvWz5XjHJdlQHcVpZjuiql0yLAE+L57hshZ2az2Ii/WL3MVGq/lUdID6oI3eW32g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oLweSJtCwqTAEnsOEJgf653dcWn2syINwRuJqI0+Nc=;
 b=tInKESJtQuV6gB1fkwgJ2kvL8y+zQlDiautUDDLyZAePl9jxGjsWh0IvNSnRHleqM08TF2c1zpuu9tBwUUzFYtEcA4RTib1mD9t9Zy185dBCgznjMovFxBBSlLzzZE1gByHwh93wrbpBy4Zrw36TbLL2rNvuy5mphDr9OA6Ea6w=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>
Subject: RE: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to NUMA
 system
Thread-Topic: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to
 NUMA system
Thread-Index: AQHXjptLf/jfnZiVikStQBDm6XRL0auEh6AAgADr9fCAAB2+AIAADhiAgAAloMA=
Date: Thu, 26 Aug 2021 12:08:09 +0000
Message-ID:
 <DB9PR08MB6857D887C97A40E20F66B4069EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-27-wei.chen@arm.com>
 <35a57b18-4fab-522d-f39a-de21017abe57@xen.org>
 <DB9PR08MB6857FC8EA8C0D324426408709EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <d7ea4260-aec5-efb5-32e7-7f73d6ee206b@xen.org>
 <705eae88-2cb1-f3a5-3190-dd4ed553fe36@suse.com>
In-Reply-To: <705eae88-2cb1-f3a5-3190-dd4ed553fe36@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 72CB1601563222449DFD6249607BFC3E.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8e321700-243a-4fd7-6dde-08d9688a3070
x-ms-traffictypediagnostic: DBBPR08MB6281:|AM8PR08MB6514:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB65148C4066FB9AA66C5F65F39EC79@AM8PR08MB6514.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Lhzm4lViYZ06gEk4c6mErLHunT5+hdM/0X8O2BKF66/QK9elT1z5OPFhC8NasfargOlvQWnGhfrZNoIZ+skMLf+Ij+plTArkhuxNzGLC55qHrIdkp+16B+8OSPrIYCErVhGL7x9dy8gZZcEB+MmHY0j2dAW6DGNtDEYwgEg0E5YjP/IeeT65QhNWQHoIPNsQgZQv+vlsEm9ps6TMgCY14PhrC8RK0/hEwaF3rhe7FZA0am1F8tQAp9wo6XNQK0qpNOLYg9e9lBLkC20Syt3I5yC66DjO/ygyp71Mr08ryIzAkgzQlvtgOsX2gmLtJTpchxkyzRWp4Y1RMxnYNNPFzNSshZ8Z8OAd2tOHQ/qQ5KQYrDYaDXAFcxDCOrNWBuKxGDKfgo2OY3AEHDm5rH4Gk+bRkXIsC3Vbb0YGJPHOL3LVQboqAsX4usfIA3AW/Fmls0nUCY+Djae+Ht4hK5hnCZzFotauNQA17RcWymd/0O73uA9tFXgtXz7EdMzytGZQIRKeH3wnl07VPN8JpSCDFx7hKlj1JvngBQV5nTf4uL0g1/8ImiigbxnUjzOvGIwfWA3pCodhWAko9l+MTT6dKHiQTqk4jTJt5M+8vjUpBG/Qg2KAEKzRhPARhBTdrjRw8Kfa+gsR5DTuVRiJPtUUyo/v+nApFnMBEsqhmIFoYlx3DnfEJJRBP2JL1jAYQXDfLkclnbhMJsF5vzwt9V//Sg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(396003)(39850400004)(346002)(52536014)(86362001)(26005)(8936002)(478600001)(5660300002)(4326008)(8676002)(38100700002)(122000001)(186003)(2906002)(66946007)(6506007)(83380400001)(71200400001)(110136005)(55016002)(53546011)(7696005)(76116006)(33656002)(54906003)(316002)(38070700005)(66556008)(66446008)(64756008)(66476007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d0Rtd0F0UWNqVzB6SlRRVk42VDVOTTIyQUF2TlJVVXo3elgwL3d0WWNDMnNm?=
 =?utf-8?B?TTNGdWJzNTJoVzBnOEc4eUd1QVVhNDRQMWJOUlQ4Y1dpNG16LzhVUHBGNDFv?=
 =?utf-8?B?SzNzQ3plYThIWkg0eXJJczZCalNQOW5hc2lXR3Y3bkJXTFViU09iVUJoeUpN?=
 =?utf-8?B?S3k5aWFCVGdHTjVDN29rTXBvU0s3bllKZXhhbHBUdFdEd0hFb08yYmR1OVV6?=
 =?utf-8?B?Y3ZpTi83TG9DV25CcnhCWkFkNXJ2UjhuMEVxUytRZTV5bG8vbDhhbDlkYmdh?=
 =?utf-8?B?N1dnTXlHWDlzMG83RGxKbkVYZU14MWRNN1U1U0dKV3ZqeG5NL25sSTdDR3ND?=
 =?utf-8?B?QUF4dENySm51bTBHSm5YNGdKR1JhTEhyYmMzK2psdS9TdFpBOG1uL0w3aHZN?=
 =?utf-8?B?bGcrcFl1Tkc5RlVHdHVkRnVOelQ3emQ0VHZVc0FzSjUyMmVYQ1JDVWJhd0ly?=
 =?utf-8?B?V0M0cndsQ0xTbStDc3JhUDVVa2RaQVE2U2RXR0xMSmpVZ3k3Z3A4Y3RqcWRG?=
 =?utf-8?B?QW1DWlZ3MDFCN2JoYU50U3ZrVWlpdnExSnhzRU00aVVBbTdrT0xHaUZwMjRN?=
 =?utf-8?B?TG5keUlEU3RNbnZQMUhvQ3VZdk5tcEFKUHZaUDJTTWVCcnRwN1FnVTVvaFha?=
 =?utf-8?B?MTZqUUpIRTFxS1lMemxhL09mVGp6TTBtZnN5RUlMQU1FRVZveHVTY2RwcWpN?=
 =?utf-8?B?cm5jc0J6Ulg4aDZ1STFSTkpOSUlVcFdUT2RYN0lYMVNEOEtSZWh4VzRUUFBU?=
 =?utf-8?B?R0l5ZGpPYVNQUjNjUVBXQXhneS9wZmN0ajVpSDJXUzM5WTZzUnM0a2VpeEVw?=
 =?utf-8?B?d2NHckV0cnQ2SVQrcDFkcC81emVCbytielhxS1JaTVVvbzFWeTd5RFY2S0d3?=
 =?utf-8?B?WWQrNFpPU1VoY1YyYzRKNENRVHQ1N0JBYlMxYjErbHpnc24rQWdnQWo1WXNl?=
 =?utf-8?B?VUczOUZRWDRkdE9kLzNJY2g1ZU5kWk43b29mNFBhc09UUXRvUWowUnA3NnNJ?=
 =?utf-8?B?NjlsZW9oaFhueWtzNXJpbUhZWkZVdmVzTUU1UmhhWFU0SlhBUHZZT09zdlNW?=
 =?utf-8?B?NnA5MG04WGpOQ2M1S1ZVcDhHRng5YzNIcjNiMzQrd3NzSERFdlNKRXh6VUVu?=
 =?utf-8?B?MnN5NHBSZm83dWkxRTQxWWI0OUZBdURLalIrTjVONWRtVzk5SVlUVkdGSWsv?=
 =?utf-8?B?NzlOYXhvb3Vmb3BaMlNEeGQ0c3JubGlmVXVoRXN0eHF6V2l5TUNheitEOEQ0?=
 =?utf-8?B?aFBaeGw3RG1MRVF5TkpQTDJmMk1kdkI5V2ZibmdLZG9kaHd6MkRGOCt0YW1z?=
 =?utf-8?B?SkRIdmhCZlNid1dqR2Fxc1dVVkk5TE14THZFaHJGdkk3anhKY3MrM0tObzlX?=
 =?utf-8?B?YWxYZThHaGRqdWlZdGtNNW5YT2FoMzlhZmM5SFNUMzVJMzc0TFdTQTlXUEhG?=
 =?utf-8?B?eFc1a3hoWVkxMktRQVpSLzd1T3I1TDdXZlh1ZzM0WDdSaFB2NnBCQk1YVGVr?=
 =?utf-8?B?Wnl2M1cyYzlXZW1iWU5JS20rTk01TTNSRmVOTlpka3JUZlpCNXh1QTdBakFh?=
 =?utf-8?B?b1B6QWlYSm9GVHpwSG1zY0NQWVRkMDFrL3l3cFo4MHM4ajNna1JveWRac1ZC?=
 =?utf-8?B?ZTQyR3p6R0pjZlJVN0NaQStoeGdoR2NEM3lQMTcrT04xWFlZTDRBbVhEVFVz?=
 =?utf-8?B?TlJKdHFSenZDT3JvMWgvcEVYbTBXRlFJQ1J4VFMwbzlvWklsZGwrU1lkdEFT?=
 =?utf-8?Q?ca7ssMSR3OK/exF8zsq6hdx+wc20MEcdtfYxEmk?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6281
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5125adc7-709a-4b5e-6d2b-08d9688a2b72
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hTm3DKVphgwFsv2Z9HnW7jMeVcpBbzbMQk2VUfrHDK9D2giUcxbUYgEiEKF0yFY0esZ7UzXUzdtL5sQpSlJeQHIEleDYO1AWFDpODBEsUbU/pDQontH/UiiUliFXWsH5QYh+8VKj3scQm893jEJuneXrse+ciFa++HvUWvA2N1PsMUpDFd1urujeBVduK9EkhA9kq7xQwpcvYxagcKU2+qwnSoRssz0kPIvX0DE5A02TQp8tSzvM2hIhiHgkb6WRkb1hnBEXkSAy0gWqLvTf+u8ZrmOFddelQay+F2oUeA05S0kGKCN3eUX753qjAT6ywzr582d6VbeDF8QuAvnKu4SFiBsWvRJE7KKiS+SHSeE+Mz2rbCPt+BQEBNYnTM3rn12btK/d9xKZq3/p1Klpz6RanGl1glYP2hh6aWbn9DS+4xGZZSEBmuwkOop3/TNsv7Z13HnS9dpcZNphkaPcjh27fdB3yEw/YpfsHIeJ+MA9TC5t+3lWUc29s/t+TH0l+59702Jw/1KGpU18bLZNG5Pw5H/4dnxicvQ6YTGJzslmO86rZW2XIq1NO+tPipKO48+Z0UyR+/Ssbisk6F1QAylOJOj1nZckYwZHHNEGH0lihvyaUz+RfYPf2y908IsbTxcdfX6y+ZogwJUFhu1Apu/+Od96ux+z5JjrUIR6dkDgu51ln03FSOd/TR3G3mEnv3EXJ/J2ZE9NLHZqZ2wBDQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(70206006)(6506007)(70586007)(8676002)(83380400001)(7696005)(356005)(82310400003)(33656002)(53546011)(316002)(81166007)(2906002)(36860700001)(26005)(186003)(86362001)(107886003)(4326008)(336012)(52536014)(47076005)(5660300002)(9686003)(110136005)(54906003)(55016002)(508600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 12:08:17.6072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e321700-243a-4fd7-6dde-08d9688a3070
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6514

SGkgSmFuLCBKdWxpZW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiAyMDIx5bm0OOaciDI25pel
IDE3OjQwDQo+IFRvOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgV2VpIENoZW4gPFdl
aS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlz
QGFybS5jb20+OyB4ZW4tDQo+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGlu
aUBrZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyNi80MF0geGVuL2Fy
bTogQWRkIGJvb3QgYW5kIHNlY29uZGFyeSBDUFUgdG8NCj4gTlVNQSBzeXN0ZW0NCj4gDQo+IE9u
IDI2LjA4LjIwMjEgMTA6NDksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gPiBPbiAyNi8wOC8yMDIx
IDA4OjI0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+Pj4gU2VudDog
MjAyMeW5tDjmnIgyNuaXpSAwOjU4DQo+ID4+PiBPbiAxMS8wOC8yMDIxIDExOjI0LCBXZWkgQ2hl
biB3cm90ZToNCj4gPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vc21wYm9vdC5jDQo+ID4+Pj4gKysr
IGIveGVuL2FyY2gvYXJtL3NtcGJvb3QuYw0KPiA+Pj4+IEBAIC0zNTgsNiArMzU4LDEyIEBAIHZv
aWQgc3RhcnRfc2Vjb25kYXJ5KHZvaWQpDQo+ID4+Pj4gICAgICAgICAqLw0KPiA+Pj4+ICAgICAg
ICBzbXBfd21iKCk7DQo+ID4+Pj4NCj4gPj4+PiArICAgIC8qDQo+ID4+Pj4gKyAgICAgKiBJZiBY
ZW4gaXMgcnVubmluZyBvbiBhIE5VTUEgb2ZmIHN5c3RlbSwgdGhlcmUgd2lsbA0KPiA+Pj4+ICsg
ICAgICogYmUgYSBub2RlIzAgYXQgbGVhc3QuDQo+ID4+Pj4gKyAgICAgKi8NCj4gPj4+PiArICAg
IG51bWFfYWRkX2NwdShjcHVpZCk7DQo+ID4+Pj4gKw0KPiA+Pj4NCj4gPj4+IE9uIHg4NiwgbnVt
YV9hZGRfY3B1KCkgd2lsbCBiZSBjYWxsZWQgYmVmb3JlIHRoZSBwQ1BVIGlzIGJyb3VnaHQgdXAu
IEkNCj4gPj4+IGFtIG5vdCBxdWl0ZSB0b28gc3VyZSB3aHkgd2UgYXJlIGRvaW5nIGl0IGRpZmZl
cmVudGx5IGhlcmUuIENhbiB5b3UNCj4gPj4+IGNsYXJpZnkgaXQ/DQo+ID4+DQo+ID4+IE9mIGNv
dXJzZSB3ZSBjYW4gaW52b2tlIG51bWFfYWRkX2NwdSBiZWZvcmUgY3B1X3VwIGFzIHg4Ni4gQnV0
IGluIG15DQo+IHRlc3RzLA0KPiA+PiBJIGZvdW5kIHdoZW4gY3B1IGJyaW5nIHVwIGZhaWxlZCwg
dGhpcyBjcHUgc3RpbGwgYmUgYWRkIHRvIE5VTUEuDQo+IEFsdGhvdWdoDQo+ID4+IHRoaXMgZG9l
cyBub3QgYWZmZWN0IHRoZSBleGVjdXRpb24gb2YgdGhlIGNvZGUgKGJlY2F1c2UgQ1BVIGlzIG9m
ZmxpbmUpLA0KPiA+PiBCdXQgSSBkb24ndCB0aGluayBhZGRpbmcgYSBvZmZsaW5lIENQVSB0byBO
VU1BIG1ha2VzIHNlbnNlLg0KPiA+DQo+ID4gUmlnaHQsIGJ1dCBhZ2Fpbiwgd2h5IGRvIHlvdSB3
YW50IHRvIHNvbHZlIHRoZSBwcm9ibGVtIG9uIEFybSBhbmQgbm90DQo+ID4geDg2PyBBZnRlciBh
bGwsIE5VTUEgaXMgbm90IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyAoaW4gZmFjdCB5b3UgbW92ZSBt
b3N0DQo+ID4gb2YgdGhlIGNvZGUgaW4gY29tbW9uKS4NCj4gPg0KDQpJIGFtIG5vdCB2ZXJ5IGZh
bWlsaWFyIHdpdGggeDg2LCBzbyB3aGVuIEkgd2FzIGNvbXBvc2luZyB0aGlzIHBhdGNoIHNlcmll
cywNCkkgYWx3YXlzIHRob3VnaHQgdGhhdCBpZiBJIGNvdWxkIHNvbHZlIGl0IGluc2lkZSBBcm0g
QXJjaCwgSSB3b3VsZCBzb2x2ZSBpdA0KaW5zaWRlIEFybSBBcmNoLiBUaGF0IHNlZW1zIGEgYml0
IGNvbnNlcnZhdGl2ZSwgYW5kIGluYXBwcm9wcmlhdGUgb24gc29sdmluZw0KdGhpcyBwcm9ibGVt
Lg0KDQo+ID4gSW4gZmFjdCwgdGhlIHJpc2ssIGlzIHNvbWVvbmUgbWF5IHJlYWQgYXJjaC94ODYg
YW5kIGRvZXNuJ3QgcmVhbGl6ZSB0aGUNCj4gPiBDUFUgaXMgbm90IGluIHRoZSBub2RlIHVudGls
IGxhdGUgb24gQXJtLg0KPiA+DQo+ID4gU28gSSB0aGluayB3ZSBzaG91bGQgY2FsbCBudW1hX2Fk
ZF9jcHUoKSBhcm91bmQgdGhlIHNhbWUgcGxhY2Ugb24gYWxsDQo+ID4gdGhlIGFyY2hpdGVjdHVy
ZXMuDQo+IA0KPiBGV0lXOiArMQ0KDQpJIGFncmVlLiBBcyBKYW4gaW4gdGhpcyBkaXNjdXNzaW9u
LiBIb3cgYWJvdXQgZm9sbG93aW5nIGN1cnJlbnQgeDg2J3MNCm51bWFfYWRkX2NwdSBiZWhhdmlv
cnMgaW4gX19zdGFydF94ZW4sIGJ1dCBhZGQgc29tZSBjb2RlIHRvIHJldmVydA0KbnVtYV9hZGRf
Y3B1IHdoZW4gY3B1X3VwIGZhaWxlZCAoYm90aCBBcm0gYW5kIHg4Nik/DQoNCj4gDQo+IEphbg0K
DQo=

