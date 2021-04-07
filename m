Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B035718B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 18:06:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106805.204217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAhB-0001kt-An; Wed, 07 Apr 2021 16:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106805.204217; Wed, 07 Apr 2021 16:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUAhB-0001kU-7g; Wed, 07 Apr 2021 16:06:21 +0000
Received: by outflank-mailman (input) for mailman id 106805;
 Wed, 07 Apr 2021 16:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IknL=JE=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lUAh9-0001kP-NB
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 16:06:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa955036-e246-4763-930d-2fb88c3abbc0;
 Wed, 07 Apr 2021 16:06:18 +0000 (UTC)
Received: from AM3PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:207::12) by
 AM6PR08MB3000.eurprd08.prod.outlook.com (2603:10a6:209:43::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26; Wed, 7 Apr 2021 16:06:15 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:0:cafe::72) by AM3PR04CA0128.outlook.office365.com
 (2603:10a6:207::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 16:06:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 7 Apr 2021 16:06:15 +0000
Received: ("Tessian outbound 47ca92dabae7:v90");
 Wed, 07 Apr 2021 16:06:14 +0000
Received: from 1de273d857ba.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7C2EE12D-3C85-44BF-B9C3-C2E63318A12C.1; 
 Wed, 07 Apr 2021 16:06:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1de273d857ba.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Apr 2021 16:06:08 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4045.eurprd08.prod.outlook.com (2603:10a6:803:dd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Wed, 7 Apr
 2021 16:06:06 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::b538:7f7:f4f3:8c0e%7]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 16:06:05 +0000
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
X-Inumbo-ID: fa955036-e246-4763-930d-2fb88c3abbc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlk+T9rRcT6ZGDUSxCupr6DRZJAHHK+sRj+4q1WIIns=;
 b=O3LWUXv6p8VJ6xqY/TxYO835gQG0ZKb+LkWFK8bKOE5pZe1VD9q6wUwUf+xx4R+T/k9BCHR9lWeqHBli7qFr1NIzLzr60lwl8ubY6W9t3ELXN0+qPJGY9ONFeMgliNzYcMagnMy0/pKkhdCSZjOHduzEOoLZDKdyFPiOQwDfE4s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 641010b1613f92c5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6Tz24zppQVeMLXDwMTg2loB7QuyA9YxJpFdCXHgcQSEuyOnFHP4YIQ4ujptUSh/wHuJYPBbH9ri8TxWy72wQpfAxJIyYo3WkovVAfvY3m06a3pFkIul0WFzUQBZGIkLFp3N2IcDCeDoEON01JYcrdg7uQZGFtpqKV1IsbAIj2snviXdwwWKDrTojhbSZi+xOo8hSwH8KiWpTrIjzyMi0gKnb1fcoX6UJuYfCAP7ABRfOqtCjf4nK8Qb/se0zyhfp+s5gnKJNu13G+K5RlG12MO/frHogJtjIlCOxlQ0lvxBUnxyJGEoTAXGXwRukquk2IokYyZ/oAX8gisd6yhyVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlk+T9rRcT6ZGDUSxCupr6DRZJAHHK+sRj+4q1WIIns=;
 b=oBUOo2GGVyKjR3QDqNKX9aVAheVCueI0VjKXOO+szkIwzbgETJnpo25owDplH+x591KoXcaQXQP7Szcesm4CJ8nnkMfCtOZUbenFZ2p0Ik/f7RsYnuDjxRGfMOxtbWFSOmqxNOhnEo3fn9g+YDMqhR3CXJ6WDcLvb+eN/ILK3eNXJ+if2q26lj2fAZsSM1N+nWVba9HporFAcaThCEqlpiQmouzy+8VDBcUXZNSLNo3ix0xpDO+9eWTLYECBF2yZLd5Gr5YIjzbsm+bv/vGxAsmwBKSXJw+w446e0kQg4tjze09qzi9OA1VlIesWu2mbfM8sw1ko25bgkzKME5JeMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jlk+T9rRcT6ZGDUSxCupr6DRZJAHHK+sRj+4q1WIIns=;
 b=O3LWUXv6p8VJ6xqY/TxYO835gQG0ZKb+LkWFK8bKOE5pZe1VD9q6wUwUf+xx4R+T/k9BCHR9lWeqHBli7qFr1NIzLzr60lwl8ubY6W9t3ELXN0+qPJGY9ONFeMgliNzYcMagnMy0/pKkhdCSZjOHduzEOoLZDKdyFPiOQwDfE4s=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ian Jackson <iwj@xenproject.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Chen
	<Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
Thread-Topic: [PATCH 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
Thread-Index:
 AQHXKtDW6d1uIaHDNEirYTRFGCHHX6qpCgoAgAABvgCAACFYgIAAAteAgAAHPACAAAL+gA==
Date: Wed, 7 Apr 2021 16:06:05 +0000
Message-ID: <9B8BD2C5-297C-4BE3-8476-5D10699712E2@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <7f143615-acdf-5a97-5e07-57cab49031d6@xen.org>
 <0F20064C-418C-4A4F-9883-4452A726B038@arm.com>
 <24685.52599.234444.705703@mariner.uk.xensource.com>
 <03084EF9-F130-41F7-9D8D-9AF86A87717F@arm.com>
 <8b0fafe2-989e-5a5a-05ec-f55e096e4b54@xen.org>
In-Reply-To: <8b0fafe2-989e-5a5a-05ec-f55e096e4b54@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.60.0.2.21)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [212.20.154.75]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 76fe772b-a4ed-47d0-765a-08d8f9df1258
x-ms-traffictypediagnostic: VI1PR08MB4045:|AM6PR08MB3000:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB3000D51F10417FD5AC28C3AC9D759@AM6PR08MB3000.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3YIR9u7goQAM3s5fRM4wfapHDyH2/57c1B0A6LdMCrA2YvTgSXt5gQC0XxOCM/4NA3W1FuzwKqAnvFYjS9K1au9mIdjJHR2Hn90J2ld30mSbl5ezD/ps23Pnwt4MV3sClo/lQC5EU6tw5Uy+9dK6wajw/YOiZmnJnbmubWJZcy3FHyq1LWaRIx5DqeGPW8Y1fux+17kqYp/PlXAi24ZtBDvcCsJe78WfSPbWus6Uik5inKc3P+HzKVWV4iQBP6yjcCW6ZqySCiphj10s4aHvgMswu3Xjpt2GedDyqaL04Qj7n9eMHy5CC3jCFfxe4cdte7zzqX6KiqxPp9Cq5pDF3OKNRODLrJuczMu+zagx3c3uVsiJaCs9E7LllQCkl5IjiYpHBsay1e8WineHEQbTQcWM+oa/obyD45iMaB2hC1qoTQD8hG/yZeYBfHuzdzMv4xcicQrcPiO25YIX4frDXrE8bYk7o5GJv5BuUK7n6InyXkqn2SglzU5HHbY8SSPj2nVABS9wdRizZDUS8mvwNpeSkuVvE9aeM75RGyeykWyPRSeDY8sqAjB6/bQvgeMj6Kz8H+U9m99uX6guZMQgxvgPttu0EGrio3mKlQmqhZCu9LtaxS77oqcTv6KqB0k1dlRUYvODaJ14RXh+E3USVM7JL4/TDN24AIAzUc2wH2Y0Zw3tqxw0Qz6M/GlBx+Ml
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(2616005)(33656002)(4326008)(83380400001)(8936002)(36756003)(86362001)(6486002)(54906003)(316002)(478600001)(76116006)(91956017)(5660300002)(6916009)(66946007)(71200400001)(8676002)(6506007)(53546011)(186003)(38100700001)(6512007)(66476007)(26005)(2906002)(66446008)(64756008)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?U3hiQWhyV0Z6eHBiVlErdlc3RW9uUlVTSDlzV0twVmRGRzg4czFHRmpXS1hB?=
 =?utf-8?B?WUdYRzJmK3pTNWs2OEttTjRocHBtQnRkL3htY05lT2lGQS9LbXdNS1ZpTGgv?=
 =?utf-8?B?bHV2T25ydlpGQ0FqNExXeFpXWnF2YkpGTEN4ME0rd3JEU0VESEsrMzFYelVE?=
 =?utf-8?B?TFAxQk9ENlRESVlqTUhpa29kejVMZ0lsOXlrNzhqYU0rQ0FqVWt3U0o4NFND?=
 =?utf-8?B?T0dWYk83UDZxRTBVOXdiUERBeDk3Y3U0eE9wUTZGbi94a3VUdWZBanVmMlc5?=
 =?utf-8?B?Z0d6alo5NmlmYkQveXlVenh5QlFIcmhUTHJiTEMzNFR4ZVRSdzQrSUhzVmF3?=
 =?utf-8?B?U0R0bk53TWNTK0t5RTY5cG83OVFwMG5JbUNUQ1NlbkNndGFLV25OT0tVWFNq?=
 =?utf-8?B?TUtkNjZQWks3bkRFMnRHNjZaNTdqOWFLUW90ZGYza1ovWFY0bmlMeUhiVXU5?=
 =?utf-8?B?R3g2bjZuWlYremJsb2tKdk05SjI3ZGdoclhOd0syTDQ3NnF6VmdNWTRQeHVp?=
 =?utf-8?B?ZGxNNk5qdU1jYThRVmJMWlIwVTBRVkpZRXF0SFNrZGlDbGVkOGR0YmpqMWd4?=
 =?utf-8?B?YVAzK1htL1NzQnIzSDFseG9wOXlnN2JlWFA0RVlPYW9zUHh4VmtwOEdSZFhx?=
 =?utf-8?B?OG85UnZ6TjRRTDE4MFNaejhkdXhmNVIzRlhDN0EwejVSeUVwbHYxK2grS24y?=
 =?utf-8?B?UkEyMHdLbUl2RklsTDRwVDVmcnpsbkxoUFZvVllBRWZCdzNaOHFUcG1hSWhW?=
 =?utf-8?B?V1pxb250VllucHI5N290a2NjV3o4REg2RW1sbjYxekJ4ZUpXUnRCemh2TFBH?=
 =?utf-8?B?NEhPaWFJRXI3OWtzamRlV2NkL0ZZVlZVRjk0TzlHaXBmcVg4SVA5MkpLWG1s?=
 =?utf-8?B?dy83bHFoUjFzRTBvbDJiT2I2NmNJL0x0NnhQYTkvK0FpdS9rdEN0N0Q2WWpI?=
 =?utf-8?B?WUloelhhalFxMnR4YTY3ZmNtaU8wNDVMWVQ0ak9WRjY1Z0JZdHlTVkZUZHlP?=
 =?utf-8?B?UzNjY09Cdi9YNUswWStmSWZTRS9ueE1hczg4OWZ5WHZldEczdXZyMHJYRklV?=
 =?utf-8?B?azM4NHJ6WGV1MW9CRUl2OXdvWnhDRm9nOFpOUkRTWis3WlByTzNWNDNzMXl2?=
 =?utf-8?B?dUJFZTArVVI3aDk2b1Jsa3ZXQzhOV1pZeXl3V3FKemVnUXEvM0tXeTB5emtz?=
 =?utf-8?B?bWR5elRDQWI0bmN2SWtlVmtHdlMzRHE1LzA2TkJkcVIyUTdGM1AwU2ZVY0I1?=
 =?utf-8?B?M3FSV3lmTGlMczRFd3E1K3kxdndXYWhucWk3T0dMSnR4Y1VObkhRUlhJVjZI?=
 =?utf-8?B?elZ4bW5kZ3NTbG0yMTR4OVB6U0lvL2JiVU51alkwaXJzZVc2dFdXM3NoMXBu?=
 =?utf-8?B?d3F1dUpUTGFjNTlrakh6S2VXcG1IbVNyQmNzYzB0cDErVEw0Q1FBWlBEQ1NH?=
 =?utf-8?B?QjRmODMvTHNpR1IzT0R2SGk4R0RtNHdQL1crL1FyNThQSlNmeTk4TGRIRllq?=
 =?utf-8?B?L1BVWDg4OXRiNS9JM1dyT3lzYiswMTNHemtKSnVyUTJVS2lUZ3dqSUFUTXJi?=
 =?utf-8?B?V3YvUnJyQXZNMDRKdSt0M3RzS1UrMlVlZ0ovbzJyNmEvRDBFS3RtQW9FdStk?=
 =?utf-8?B?YVlISVVHN1BxbEdldjNvRTRFRmFHeW5YbWFXOEw4R1EzSVYzdjJVMWxRM01J?=
 =?utf-8?B?TVhTSDFackpSamwvOUp1MEs3MmZWRlVzNWRIK0U5elNjTEJEK2xLcUxRNERk?=
 =?utf-8?Q?3kAiCTVWATU7zw2ns/50zRv8Ro/2hO939cY+FQ9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B78620BC60D1BC4A87E7BBF97CFCF9C6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4045
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	564dd829-354f-497f-01f3-08d8f9df0cad
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EYJv+O9bqviGyekhjtmBm5nNJlNU5QqhToJ87NQW6pTagRatGeeYlJRthuRI9oVd7osedPBknO2+caN3PqNn7fn0kDTLI00pINK3xUxiFrN9G7/NrTwj3bniDv8DNqbHq3mOFD7SI+BgAliZy0FgHtR6ZKun5e8GbPfYOe5lecrYo0YQsHUOK1cCktyXIKQXVeVZ4q+oGRCTjwkmYV0mEFf+6sIcw8o+QnQT4VXYBfpLeVau9GvkqYD02J7i6unHyIvvZ0VlCwCJnbLXWlVmuLkafrCW3WxoShBrgtsJRjy0POYMvWmjS2wFB/j6hxxb+dPMaSgPrgkRpERIqbZ9svWWRciEqpEhK7qnCR8lkLHhrMoZZ3NgajDUuNPWNR57M4xloXAKNZB4VzEIZs7xeJa19Fu5jUvN4A2XuXO5yv6WlJeejklBn3nGRKiIOUMxgR63v1n5dnG/A/snY4M1YfLBPj/Xz6ku9IjAnTrF9HMob/69d0Pdom2wngSG5eEpul89mxMuKxHx3I725z2yRDmtdG2MpLDP6P1+h1mxHNvK9i5yD+GCsfB0F8MNSvR3d4+flU9/u6Cd94Hnx02ZVsk0wPyd7N2LMthjimCdCp/lPpk49baTlOFgvZLX0YZCpcTb4RHyuWymEWuGdQvBLYyDfZ4tuAFv1eVyRhjEziM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966006)(36840700001)(478600001)(53546011)(36756003)(83380400001)(4326008)(82740400003)(33656002)(47076005)(6512007)(26005)(336012)(81166007)(5660300002)(186003)(356005)(70586007)(2616005)(316002)(8936002)(8676002)(82310400003)(70206006)(6862004)(6486002)(6506007)(2906002)(86362001)(54906003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 16:06:15.3166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fe772b-a4ed-47d0-765a-08d8f9df1258
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3000

SGkgSnVsaWVuLA0KDQo+IE9uIDcgQXByIDIwMjEsIGF0IDE2OjU1LCBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMDcvMDQvMjAyMSAxNjoyOSwg
QmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+IEhpIElhbiwNCj4+PiBPbiA3IEFwciAyMDIxLCBh
dCAxNjoxOSwgSWFuIEphY2tzb24gPGl3akB4ZW5wcm9qZWN0Lm9yZz4gd3JvdGU6DQo+Pj4gDQo+
Pj4gTHVjYSBGYW5jZWxsdSB3cml0ZXMgKCJSZTogW1BBVENIIDMvM10gZG9jcy9kb3h5Z2VuOiBk
b3h5Z2VuIGRvY3VtZW50YXRpb24gZm9yIGdyYW50X3RhYmxlLmgiKToNCj4+Pj4gVGhlIHByb2Js
ZW0gaXMgdGhhdCBEb3h5Z2VuIGNhbuKAmXQgZ2VuZXJhdGUgcHJvcGVyIGRvY3VtZW50YXRpb24g
Zm9yIGFub255bW91cyB1bmlvbi9zdHJ1Y3R1cmUsIGl0IGVuZHMgdXAgd2l0aCB3YXJuaW5nIGFu
ZC9vciBwcm9kdWNpbmcgd3JvbmcgZG9jdW1lbnRhdGlvbiBsaWtlDQo+Pj4+IGNoYW5naW5nIG5h
bWVzIG9yIGdpdmluZyBmaWVsZCBkZXNjcmlwdGlvbiB0byB0aGUgd3JvbmcgZmllbGQuDQo+Pj4g
DQo+Pj4gVGhpcyBkb2VzIG5vdCBzZWVtIGxpa2UgaXQgd291bGQgYmUgYW4gaW1wb3NzaWJseSBo
YXJkIGZlYXR1cmUgdG8gYWRkDQo+Pj4gdG8gZG94eWdlbi4NCj4+IE1vZGlmeWluZyBkb3h5Z2Vu
IGlzIG5vdCByZWFsbHkgaW4gb3VyIHBsYW5uZWQgZWZmb3J0cyBhbmQgaWYgc29tZW9uZSBkb2Vz
IGl0IHRoYXQgd291bGQgcHV0IGFuIGhhcmQgY29uc3RyYWludCBvbiB0aGUgdmVyc2lvbiBvZiBk
b3h5Z2VuIHBvc3NpYmxlIHRvIHVzZS4NCj4gDQo+IEFyZSB5b3Ugc2F5aW5nIHRoYXQgYW55b25l
IHdobyB3YW50IHRvIHVzZSBkb3h5Z2VuIGhhcyB0byB3YWl2ZSBvZmYgdGhlIHVzZSBvZiBhbm9u
eW1vdXMgdW5pb24vc3RydWN0PyBJcyBpdCB0aGUgb25seSB0aGluZyBkb3h5Z2VuIGNhbid0IGRl
YWwgd2l0aD8NCg0KVGhhdCBpcyB0aGUgbWFpbiBvbmUgd2UgY2FtZSBpbnRvIHdoaWxlIGRvaW5n
IHRoaXMgYnV0IHRoZXJlIG1pZ2h0IGJlIG90aGVyIGdvaW5nIGZvcndhcmQsIGhhcmQgdG8gYmUg
c3VyZSBhdCB0aGlzIHN0YWdlLg0KDQo+IA0KPj4gQnV0IGlzIGFkZGluZyBuYW1lcyB0byBhbm9u
eW1vdXMgZWxlbWVudHMgcmVhbGx5IGFuIGlzc3VlIGhlcmUgPw0KPj4gSWYgd2UgYWdyZWUgb24g
bmFtZXMgb3Igb24gYSBjb252ZW50aW9uIGZvciBuYW1lIHRoZSByZXN1bHQgd2lsbCBub3QgaW1w
YWN0IHRoZSBjb2RlIG9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHkuDQo+IA0KPiBJIHRoaW5rIHRo
ZSBuYW1pbmcgaXMgb25seSB0aGUgdGlwIG9mIHRoZSBwcm9ibGVtLiBPbmUgYWR2YW50YWdlIG9m
IGFueW1vdXMgdW5pb24vc3RydWN0IGlzIHlvdSBtYWtlIGNsZWFyIHRoZXkgYXJlIG5vdCBtZWFu
dCB0byBiZSB1c2VkIG91dHNpZGUgb2YgdGhlIGNvbnRleHQuIFNvIHRoZXkgc2hvdWxkIG1vc3Rs
eSBiZSBzZWVuIGFzIGFuIGVhc3kgd2F5IHRvIGFjY2VzcyBzb21lIHBhcnQgb2YgdGhlICJwYXJl
bnQiIHN0cnVjdHVyZSBkaXJlY3RseS4gVGhlcmVmb3JlLCBJTUhPLCB0aGV5IGRvbid0IGRlc2Vy
dmUgdG8gYmUgZG9jdW1lbnRlZCBzZXBhcmF0ZWx5Lg0KDQpTb21laG93IGluIHRoZSBkb2N1bWVu
dGF0aW9uIHdoZW4geW91IGhhdmUgYSB1bmlvbiB5b3Ugd2lsbCBuZWVkIHRvIGRvY3VtZW50IHRo
YXQgaXQgaXMgYSB1bmlvbiBhbmQgdGhlIHBvc3NpYmxlIGVudHJpZXMuDQpIYXZpbmcgYSBuYW1l
IHRvIHJlZmVyIHRvIGl0IHNvdW5kcyB0byBtZSBhIGxvdCBlYXNpZXIgdGhhbiBtYWtpbmcgaXQg
YW5vbnltb3VzLg0KDQpPbmUgd2F5IG9yIGFuIG90aGVyIG1vc3Qgc3RhbmRhcmRzIGxpa2UgTUlT
UkEgYXJlIGZvcmJpZGRpbmcgYW5vbnltb3VzIGVudHJpZXMgYXMgdGhleSBjYW5ub3QgYmUgcmVm
ZXJyZWQgdG8uDQoNCj4gDQo+IEluIGZhY3QsIHRoaXMgaXMgdGhlIGZpcnN0IHRoaW5nIEkgbm90
aWNlZCB3aGVuIGJ1aWxkaW5nIHRoZSBkb2N1bWVudGF0aW9uIGJlY2F1c2UgJ3VuaW9uIGEnIHdh
cyBpbiBnbG9iYWwgaW5kZXguDQoNCkRlZmluaXRlbHkgSSBhZ3JlZSB0aGUg4oCcYeKAnSBpcyBu
b3QgYSBnb29kIHNvbHV0aW9uIGFuZCB3ZSBuZWVkIHRvIGZpbmQgbWVhbmluZ2Z1bCBuYW1lcy4N
CkJ1dCB0aGlzIGlzIGluIGZhY3QgdHJ1ZSBmb3IgdGhlIHN1Yi1lbGVtZW50IGluIHRoZSBzdHJ1
Y3R1cmUgKGZyb20gd2hpY2ggdGhlIG5hbWUgd2FzIHRha2VuKSwgdXNpbmcg4oCcYeKAnSBhcyBh
biBpZGVudGlmaWVyIGlzIG5vdCByZWFsbHkgZXhwbGFuYXRvcnkgb2Ygd2hhdCB0aGF0IGlzLg0K
4oCcdeKAnSBmb3IgdW5pb24gY2FuIGJlIHNlZSBhcyBhIHN0YW5kYXJkIHRob3VnaC4NCg0KVGhp
cyBpcyB3aHkgaSB0aGluayB3ZSBzaG91bGQgcHV0IG5hbWVzIHdoaWNoIGEgbWVhbmluZyBidXQg
dGhpcyBpcyBub3QgYWx3YXlzIGVhc3kgdG8gZmluZC4NCg0KQ2hlZXJzDQpCZXJ0cmFuZA0KDQo+
IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

