Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424083667C9
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114179.217476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8xK-000749-SG; Wed, 21 Apr 2021 09:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114179.217476; Wed, 21 Apr 2021 09:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ8xK-00073k-OQ; Wed, 21 Apr 2021 09:15:34 +0000
Received: by outflank-mailman (input) for mailman id 114179;
 Wed, 21 Apr 2021 09:15:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3IT8=JS=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lZ8xJ-00073f-3i
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:15:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec6a6890-df78-46be-a1c5-9a553af161d2;
 Wed, 21 Apr 2021 09:15:30 +0000 (UTC)
Received: from DB6PR07CA0085.eurprd07.prod.outlook.com (2603:10a6:6:2b::23) by
 VI1PR08MB4592.eurprd08.prod.outlook.com (2603:10a6:803:bc::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Wed, 21 Apr 2021 09:15:26 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::96) by DB6PR07CA0085.outlook.office365.com
 (2603:10a6:6:2b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.7 via Frontend
 Transport; Wed, 21 Apr 2021 09:15:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Wed, 21 Apr 2021 09:15:26 +0000
Received: ("Tessian outbound 82c2d58b350b:v90");
 Wed, 21 Apr 2021 09:15:26 +0000
Received: from c7ade08ce88a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9886CED3-5B11-40A0-8851-8BBBF400FC10.1; 
 Wed, 21 Apr 2021 09:15:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7ade08ce88a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Apr 2021 09:15:15 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM5PR0801MB1937.eurprd08.prod.outlook.com (2603:10a6:203:4b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 09:15:04 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::856e:d103:212c:8f50%4]) with mapi id 15.20.4042.024; Wed, 21 Apr 2021
 09:15:04 +0000
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
X-Inumbo-ID: ec6a6890-df78-46be-a1c5-9a553af161d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOfjzPhW/P5u5wzjqm8X5B35LQYp/uq42ylMuioZ9A8=;
 b=1hyP9CA/brcwGLEOg1CzJAGeinp7p3BWDwEWLd/eITnKSnffMK3s/6a5A7BAdvN5xnGVjj8QGMUYt2KRH/eM01AMhpfCwrAf1GRkug2KtbkAD46RAzj69sqHeF3Gt9keupNcHiVlIrUpV8bDqPMBHsmrPwvBd3VhCWwiLhqvPa4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6c74ef0a17b38d6b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhKx1Gq0EesFCwwM/sgtsr2B1sd3kpH3DeFFc+e6rQ1QPJTXlBx085BrTxzd4qY9smpkMVbESjGwq0sMVcNa5csFk2l5AMKY7XOutNK97aAqRCgg1R7AFtvz1VcPCdGzkMIFbg929u/HU4/g/AFWrystGkeH6yWqlpxRlzfb/9sgaf7SRwbuLj1SJHd2eOw4gbc3vXIUXSmjr6zb424p2HRA5ymdqnjdaceh4o1S9yXvtmvTsjUgIpeW1XcSsX4k5h3I+9HD40Q5T9TADK/47E/PrpqHphG7OMPtwzbMOJ7o+LvPX9CpNk+9C4Tqs9/s+GDdUbaJt3K/S28amnO8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOfjzPhW/P5u5wzjqm8X5B35LQYp/uq42ylMuioZ9A8=;
 b=Yav37TZO/VV46gG50iLuI9O0XZpLR12cIZU8oV/yCJ+tO8c7uj1zXv6qM0cacN/+UrxbagvzbqtN1H4b6TRjyLyqF9voCwPClwCdFrYVLWqoqQjZq/CvFxWToCQMiZce83pW0aOAdBG7I9jFv3zckJQw48bIXp8nMNF73f2uWrg6PIuf5oKcD/owgkaw3Ft3JTYnnx6dZb9771+dR4OIy4HWXB09WzXXrPP77uriiOOiLf7OLwFXe1/QWFhWg29TDpfyl9KbOYeuuotsrik5cIutjoLWGKnaMywVlYD0lv7+DMxJCa8Fy+fk+K2gCCXNgsvQCF3Evo7H3d3NTxuHxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOfjzPhW/P5u5wzjqm8X5B35LQYp/uq42ylMuioZ9A8=;
 b=1hyP9CA/brcwGLEOg1CzJAGeinp7p3BWDwEWLd/eITnKSnffMK3s/6a5A7BAdvN5xnGVjj8QGMUYt2KRH/eM01AMhpfCwrAf1GRkug2KtbkAD46RAzj69sqHeF3Gt9keupNcHiVlIrUpV8bDqPMBHsmrPwvBd3VhCWwiLhqvPa4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Topic: [PATCH v2] xen/pci: Refactor PCI MSI interrupts related code
Thread-Index:
 AQHXLVmJnBz/2T+xZEqfD4R39q2wV6qwuDwAgAH9VwCAAPmtgIAADD+AgAHfkACAAAF1gIAF4LkAgAAXZQCAACuvgIAACpEAgAAKwACAAaaJgIAAHu8AgAEU14CAAAJ+AIAAEH4A
Date: Wed, 21 Apr 2021 09:15:04 +0000
Message-ID: <DA4D72F4-CD1E-46D0-9D32-D8AB01F445F9@arm.com>
References: <YHg+6rLN0rBWXcTs@Air-de-Roger>
 <788665ad-9815-e3e9-2d5a-851b35c566d0@xen.org>
 <AD2BC1CD-74AF-48FF-8B42-2853C0E7A7BE@arm.com>
 <YH1CBP8At7lVoHCz@Air-de-Roger>
 <a365ffbd-5b88-85c3-9e68-46a9a730a6fa@suse.com>
 <0d5539e3-32e3-8275-f695-351eda49cb29@xen.org>
 <6291effa-1589-1013-e89d-c795bce44d9c@suse.com>
 <D2D9A348-3B21-47FD-A9C6-4C66C5778F11@arm.com>
 <a1beaee4-0d6b-e38e-07f7-90a014c504b6@suse.com>
 <30D00B1B-ECB9-4A5B-ACBD-37E532285CCD@arm.com>
 <YH/fQpgEQyhiaj1Y@Air-de-Roger>
In-Reply-To: <YH/fQpgEQyhiaj1Y@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 98e1016e-06f8-4a28-5954-08d904a60057
x-ms-traffictypediagnostic: AM5PR0801MB1937:|VI1PR08MB4592:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4592CD1CF97723AF56C10F8DFC479@VI1PR08MB4592.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 o96iMtcLozrXs+GEhyZqCyI+9j/bMShqThpgFKqp0fR5w5znRm7+zaude2LRD2fzlmWBKWNRaF54JAmn6ZBTS6zViyp6qWVkBnfzPkp9iRSAGG9qhdtwDSgw7rmoJ/6Gx/1CHxAL1lJVpzqEzy6Eaj4a2fTjnd/h2GBCQrxLoPoKPp8cFFKlKsluBjnXgBw2n5qIKOXm4eA1HujyIzBvM0fCMZc2EMZBGH0hvYw2Wb0WcdoVrDfWR8F6+MkCTvh9RAXIiZRZ4uh3nc7H/BNy8P1UK22lpxwZzDGZRWxhBCnqYxuQd9ovRjL+3NrZqlxh/zSWomvD5flBalRFNEBH53m7/3VoJR2mW1EyP5vJLnGH3dCTT27OpOHg9HGN55yMi9DDy92ORfT3wYsVmzcolsv9gJEv63M98g/qJI1AmqSqYcX57mAnMlZ3nKmCa+81m+pgNEMQwjKr1sLd7Q/VG5l18s95hHDd11cxBFbJCf/3DlacBOVugNudu+UpUAWH8+nx7KMVoVEWCJJEZMsPp+Gms1J44PxGvKU/Rzt5283fO3aRsrfI6TrnBUBLx4F46pJcSPljVFdOOd9G3EsbZefhTXfx/h3RBOWyV4sCvhmluOrqZoFJmorK4oP598tZz/8FpC63M4PsYFggdUn1eu5Dh50negtUuOd07DbKaK2SM/aH9hjGECKvcGM2fftlp563OWcIZ9Do9xnjXoGr25Ul0hcitn61OZdFs9TRw+U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39830400003)(136003)(396003)(346002)(6486002)(5660300002)(64756008)(66476007)(53546011)(86362001)(478600001)(66446008)(66556008)(83380400001)(36756003)(66946007)(6512007)(966005)(26005)(33656002)(8676002)(8936002)(2906002)(71200400001)(54906003)(122000001)(316002)(38100700002)(76116006)(6916009)(91956017)(2616005)(186003)(4326008)(7416002)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?S2xjNWdRVUVPQUIvRXBwT1UvSmpUTm9MQUtlWXJWY3hMK1FMRlhVT2RGWFVt?=
 =?utf-8?B?MXYwWFlFeGZmcGM4TEVXSU1xaGVvNk1LTkhNeGQxMElJTVJWS3pBbzQ3YVdV?=
 =?utf-8?B?ZitvZWF6ZXNsTGVYWWd0Zm1PYkRuZDJUbVpHVUg2WFNYYU1ZR2FwQmw5SVRw?=
 =?utf-8?B?dUxicTdKOEJDbU1yL2FyNkJmNnV1cXM5cFBlODRFbWg4N2N3ZEs1dXdITWEy?=
 =?utf-8?B?dG52c3VTVWo4dEpmUndpWTR4TkM2Vk45bThZbFdKTi92ZVRycXI4WVd0akFB?=
 =?utf-8?B?OXhhYTN4U05tU2pPNDRhT3JYU1ZiRzkwdmZzTWs4SHdUdkFCU3BMTXpCdVBo?=
 =?utf-8?B?TFczeG5kS3BpUE9ZcldKV21XVmJnNFozQUlIZUozVDlLTnlybHVMV3p6ejZp?=
 =?utf-8?B?UUJpMmlQcDk1OVFRaG5TQ1RQZnMvTjBtSU9udlZoRGwvdnMvcEhpcTFVaGF2?=
 =?utf-8?B?dHZqWjJxbTZwVk4zZzA5d2Vyc0MwMXpkRHJOU2dWZ2E1S091TWlvbGZJVUFE?=
 =?utf-8?B?THN4b1hZNW8vUXh6a0x6c1AwUUxnSFh1NitTYlg2REV4OWdHR0lUdlQyQkQz?=
 =?utf-8?B?QWRnUnRhbWdhUjh5QnFpdFpDZEczUjFxUW5IM1JONllrYXVoM2FwOFdqNk9z?=
 =?utf-8?B?ZjJpZlZYTEsyMWJtSk5EaXB2c1E4TVVYTEhvMzdVbDVrWlFOcHlKWWVXblh5?=
 =?utf-8?B?dDVhcXUzS0lDck5vd29zT1Z2QzUxVjZ5bEtTMTVReVUxcThXNVRPc3pib3pq?=
 =?utf-8?B?ZWUyV2hJeWN2YTFVbXc1VUdVb3pJREJrc0pRUjlPTmtqNDF3aTdZaFZxWW9s?=
 =?utf-8?B?cG1XTWVlRWNCaXdadytacDRUbUROYzJTSWhycldIS1FRTlREa0Y2ck9xSStT?=
 =?utf-8?B?ZWlsSFJkc045eHpwTFU2aHZFcFg5V2ZwRDhZZG43WHhpa3c1TkR6UFVRSHBJ?=
 =?utf-8?B?N1MwL2pDeGNqanhLN0txTUpmT1d3WkVWWTdqUWlibUZ5dmxxYkg2QUs0eFhH?=
 =?utf-8?B?eGhtQytJcUhubmhoSlZaRG9QQUFQQlcvZXRGMTdQeldoc1h5ZVhXYUIrcHRu?=
 =?utf-8?B?VUZNN0Ixd2g2UjhYUHA3WDZTQ2NkRlRXbXFNMkEvbWo2akFLUVAxV2wyZ3VK?=
 =?utf-8?B?WXE1aTNwN0hoMHFybHZKOVZYdDE2am5Cc05nQldjTkZQUmloZCtFdVIrV0lJ?=
 =?utf-8?B?RkY3NitaL0IvWk5IMHIrb0x6RU9Rb0ZCWmZzeFFuMHlaOWdqclF2UlhCWmwr?=
 =?utf-8?B?VytsTzBJSVZYNmJ6MFk3aktHeU8vRjNnUHlnM3J5Q0kxTE5saGhReitBK1Fn?=
 =?utf-8?B?WHAxTXZnSzR4TmNHYXE2UVVvRndxNWNWMXpsQmhSWllnYUJtTEdEYndQV29z?=
 =?utf-8?B?b2kzSXJTQzN4V0J4NTVEVlFiMkZ3YVk4WFBVakhvbTB4bWpsUHJUQ1pPM29l?=
 =?utf-8?B?RXBZVW5oZWxGaGEyNk4zdTZEdVlSbGdKZ2pTSDdYRU50UjNrakhubUpZeG1i?=
 =?utf-8?B?TzZ3SjFvVnlpYUI1SnloVklXT1kyT2JkREZmTjBsK0lkL3luWCtVSGR5dWZj?=
 =?utf-8?B?SW5CTk56enpzamlmSk1IYW1lU0xEMTBObDZ2WldHUllUbHJCUTN4emZCZVZ4?=
 =?utf-8?B?dGNpa3M5cmJTNGlnZGZCUklOZEpheTZOYS9iNkx6ajBTak04d2N2S08zYldv?=
 =?utf-8?B?Rkl1ZjlhNFlGdHQwSk9PTENtMDFVQ2RId0o4LzNuZTBMc1VmYjhIZG5md1JB?=
 =?utf-8?Q?CqD2METjKRR8aHkxLkcQrHNPFVHHI1zKzOgWwij?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AC8ED2247020B4A970C7CC778CB28AD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1937
Original-Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e0c0e63d-f905-4f4e-5d0b-08d904a5f338
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FrcIHLD6ASlB4P8fl4jZPQYIko3q8HmT+5SEhgSb8devCUiKuJ9ESaoLAJibixxSl7im10jJVmg9Hi/KHcqI/9fsWz7t1lAVToZZGfB5SGoUxpnyb2XcOF1bFGayfL0YvxzULTEOUYCVqHV24jGk0A0v2SbHYjGRu057ZNMRMh+bDDaytRiw3UcF924r9S7LCdnbUC4jTc81Epi7d+MTopnK00rmfY4fvokz5JcHQidzUVBySdVMbsaMjjHdoqJzBla/3eF5+MwyXFP0/RM3DyLeb4Ws4kZ6fZhBVaYySkPMLbYfA/S10VlOJont0djiWu16vyXUMjrcRSmbCZp+neFCXSG6q8PSF6uu+3h6WwFOrAgy8hpHt95x1TF+y0vT+kh3UTAymCAmO4ko75KbDaZcM6jtyKTOe5n6oBhNv0EMR2fbfqF2pjTLbUCO7lWsHQOXLJlbjAbyrt9DEEftjMcnlRH1tFx4yOg31XCDRFXFKN86InXXfpZDFoPqii63yhGOB4McBW8vdt+O1UiWbZ4Iww3Tv/7Enylx7sShExE2y1B6iEWzH0CVGpUsP/OnO/wMTu7tHMYkbwh9FDSBBFhBPHtY6jS+44oM4+geRAAFRt/zL40LCbcb1xCW8zo/+Z1g8ZJKoDduWf4rvBCMd4VXHuViDAjKv4jAvrK2CqtIati0mhhOxTTUoKRjC5Chf9f5FmBDaUSUwo+K/D6dSt7kZf/x2OWNdnRYyPQyo8g=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(396003)(346002)(46966006)(36840700001)(966005)(47076005)(336012)(33656002)(8676002)(82310400003)(186003)(5660300002)(26005)(356005)(6512007)(83380400001)(82740400003)(36860700001)(6506007)(8936002)(6486002)(316002)(478600001)(6862004)(81166007)(54906003)(36756003)(70206006)(53546011)(86362001)(70586007)(2906002)(2616005)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 09:15:26.6372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e1016e-06f8-4a28-5954-08d904a60057
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4592

SGkgUm9nZXIsDQoNCj4gT24gMjEgQXByIDIwMjEsIGF0IDk6MTYgYW0sIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgQXByIDIxLCAy
MDIxIGF0IDA4OjA3OjA4QU0gKzAwMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4gSGkgSmFuLA0K
Pj4gDQo+Pj4gT24gMjAgQXByIDIwMjEsIGF0IDQ6MzYgcG0sIEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4gDQo+Pj4gT24gMjAuMDQuMjAyMSAxNTo0NSwgUmFodWwg
U2luZ2ggd3JvdGU6DQo+Pj4+PiBPbiAxOSBBcHIgMjAyMSwgYXQgMTozMyBwbSwgSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToNCj4+Pj4+IE9uIDE5LjA0LjIwMjEgMTM6NTQs
IEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+PiBGb3IgdGhlIHRpbWUgYmVpbmcsIEkgdGhpbmsg
bW92ZSB0aGlzIGNvZGUgaW4geDg2IGlzIGEgbG90IGJldHRlciB0aGFuIA0KPj4+Pj4+ICNpZmRl
ZiBvciBrZWVwIHRoZSBjb2RlIGluIGNvbW1vbiBjb2RlLg0KPj4+Pj4gDQo+Pj4+PiBXZWxsLCBJ
IHdvdWxkIHBlcmhhcHMgYWdyZWUgaWYgaXQgZW5kZWQgdXAgYmVpbmcgI2lmZGVmIENPTkZJR19Y
ODYuDQo+Pj4+PiBJIHdvdWxkIHBlcmhhcHMgbm90IGFncmVlIGlmIHRoZXJlIHdhcyBhIG5ldyBD
T05GSUdfKiB3aGljaCBvdGhlcg0KPj4+Pj4gKGZ1dHVyZSkgYXJjaC1lcyBjb3VsZCBzZWxlY3Qg
aWYgZGVzaXJlZC4NCj4+Pj4gDQo+Pj4+IEkgYWdyZWUgd2l0aCBKdWxpZW4gbW92aW5nIHRoZSBj
b2RlIHRvIHg4NiBmaWxlIGFzIGN1cnJlbnRseSBpdCBpcyByZWZlcmVuY2VkIG9ubHkgaW4geDg2
IGNvZGUNCj4+Pj4gYW5kIGFzIG9mIG5vdyB3ZSBhcmUgbm90IHN1cmUgaG93IG90aGVyIGFyY2hp
dGVjdHVyZSB3aWxsIGltcGxlbWVudCB0aGUgSW50ZXJydXB0IHJlbWFwcGluZw0KPj4+PiAodmlh
IElPTU1VIG9yIGFueSBvdGhlciBtZWFucykuICANCj4+Pj4gDQo+Pj4+IExldCBtZSBrbm93IGlm
IHlvdSBhcmUgb2sgd2l0aCBtb3ZpbmcgdGhlIGNvZGUgdG8geDg2Lg0KPj4+IA0KPj4+IEkgY2Fu
J3QgYW5zd2VyIHRoaXMgd2l0aCAieWVzIiBvciAibm8iIHdpdGhvdXQga25vd2luZyB3aGF0IHRo
ZSBhbHRlcm5hdGl2ZQ0KPj4+IHdvdWxkIGJlLiBBcyBzYWlkLCBpZiB0aGUgYWx0ZXJuYXRpdmUg
aXMgQ09ORklHX1g4NiAjaWZkZWYtYXJ5LCB0aGVuIHllcy4NCj4+PiBJZiBhIHNlcGFyYXRlIENP
TkZJR18qIGdldHMgaW50cm9kdWNlZCAoYW5kIHNlbGVjdGVkIGJ5IFg4NiksIHRoZW4gYQ0KPj4+
IHNlcGFyYXRlIGZpbGUgKGdldHRpbmcgYnVpbHQgb25seSB3aGVuIHRoYXQgbmV3IHNldHRpbmcg
aXMgeSkgd291bGQgc2VlbQ0KPj4+IGJldHRlciB0byBtZS4NCj4+IA0KPj4gSSBqdXN0IG1hZGUg
YSBxdWljayBwYXRjaC4gUGxlYXNlIGxldCBtZSBrbm93IGlmIGJlbG93IHBhdGNoIGlzIG9rLiBJ
IG1vdmUgdGhlIGRlZmluaXRpb24gdG8gICJwYXNzdGhyb3VnaC94ODYvaW9tbXUuY+KAnSBmaWxl
Lg0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gaW5kZXggNzA1MTM3ZjhiZS4uMTk5Y2Uw
ODYxMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiAr
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4gQEAgLTEzMDMsMTMgKzEzMDMs
NiBAQCBzdGF0aWMgaW50IF9faW5pdCBzZXR1cF9kdW1wX3BjaWRldnModm9pZCkNCj4+IH0NCj4+
IF9faW5pdGNhbGwoc2V0dXBfZHVtcF9wY2lkZXZzKTsNCj4+IA0KPj4gLWludCBpb21tdV91cGRh
dGVfaXJlX2Zyb21fbXNpKA0KPj4gLSAgICBzdHJ1Y3QgbXNpX2Rlc2MgKm1zaV9kZXNjLCBzdHJ1
Y3QgbXNpX21zZyAqbXNnKQ0KPj4gLXsNCj4+IC0gICAgcmV0dXJuIGlvbW11X2ludHJlbWFwDQo+
PiAtICAgICAgICAgICA/IGlvbW11X2NhbGwoJmlvbW11X29wcywgdXBkYXRlX2lyZV9mcm9tX21z
aSwgbXNpX2Rlc2MsIG1zZykgOiAwOw0KPj4gLX0NCj4+IC0NCj4+IHN0YXRpYyBpbnQgaW9tbXVf
YWRkX2RldmljZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+IHsNCj4+ICAgICBjb25zdCBzdHJ1
Y3QgZG9tYWluX2lvbW11ICpoZDsNCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC94ODYvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jDQo+
PiBpbmRleCBiOTBiYjMxYmZlLi5jZjUxZGVjNTY0IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3g4Ni9pb21tdS5jDQo+PiBAQCAtMzQwLDYgKzM0MCwxMyBAQCBib29sIGFyY2hfaW9tbXVf
dXNlX3Blcm1pdHRlZChjb25zdCBzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gICAgICAgICAgICAgbGlr
ZWx5KCFwMm1fZ2V0X2hvc3RwMm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkpOw0KPj4gfQ0KPj4gDQo+
PiAraW50IGlvbW11X3VwZGF0ZV9pcmVfZnJvbV9tc2koDQo+PiArICAgIHN0cnVjdCBtc2lfZGVz
YyAqbXNpX2Rlc2MsIHN0cnVjdCBtc2lfbXNnICptc2cpDQo+PiArew0KPj4gKyAgICByZXR1cm4g
aW9tbXVfaW50cmVtYXANCj4+ICsgICAgICAgICAgID8gaW9tbXVfY2FsbCgmaW9tbXVfb3BzLCB1
cGRhdGVfaXJlX2Zyb21fbXNpLCBtc2lfZGVzYywgbXNnKSA6IDA7DQo+PiArfQ0KPj4gKw0KPj4g
LyoNCj4+ICAqIExvY2FsIHZhcmlhYmxlczoNCj4+ICAqIG1vZGU6IEMNCj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+PiBp
bmRleCBlYTBjZDBmMWEyLi5iZDQyZDg3YjcyIDEwMDY0NA0KPj4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2lvbW11LmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+PiBAQCAtMjQz
LDcgKzI0Myw2IEBAIHN0cnVjdCBpb21tdV9vcHMgew0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTggZGV2Zm4sIGRldmljZV90ICpkZXYpOw0KPj4gI2lmZGVmIENPTkZJR19IQVNfUENJ
DQo+PiAgICAgaW50ICgqZ2V0X2RldmljZV9ncm91cF9pZCkodTE2IHNlZywgdTggYnVzLCB1OCBk
ZXZmbik7DQo+PiAtICAgIGludCAoKnVwZGF0ZV9pcmVfZnJvbV9tc2kpKHN0cnVjdCBtc2lfZGVz
YyAqbXNpX2Rlc2MsIHN0cnVjdCBtc2lfbXNnICptc2cpOw0KPj4gI2VuZGlmIC8qIEhBU19QQ0kg
Ki8NCj4+IA0KPj4gICAgIHZvaWQgKCp0ZWFyZG93bikoc3RydWN0IGRvbWFpbiAqZCk7DQo+PiBA
QCAtMjcyLDYgKzI3MSw3IEBAIHN0cnVjdCBpb21tdV9vcHMgew0KPj4gICAgIGludCAoKmFkanVz
dF9pcnFfYWZmaW5pdGllcykodm9pZCk7DQo+PiAgICAgdm9pZCAoKnN5bmNfY2FjaGUpKGNvbnN0
IHZvaWQgKmFkZHIsIHVuc2lnbmVkIGludCBzaXplKTsNCj4+ICAgICB2b2lkICgqY2xlYXJfcm9v
dF9wZ3RhYmxlKShzdHJ1Y3QgZG9tYWluICpkKTsNCj4+ICsgICAgaW50ICgqdXBkYXRlX2lyZV9m
cm9tX21zaSkoc3RydWN0IG1zaV9kZXNjICptc2lfZGVzYywgc3RydWN0IG1zaV9tc2cgKm1zZyk7
DQo+IA0KPiBZb3UgYWxzbyBuZWVkIHRvIG1vdmUgdGhlIGZ1bmN0aW9uIHByb3RvdHlwZQ0KPiAo
aW9tbXVfdXBkYXRlX2lyZV9mcm9tX21zaSkgZnJvbSBpb21tdS5oIGludG8gYXNtLXg4Ni9pb21t
dS5oLCBvcg0KPiBtYXliZSB5b3UgY291bGQganVzdCBkZWZpbmUgdGhlIGZ1bmN0aW9uIGl0c2Vs
ZiBhcyBzdGF0aWMgaW5saW5lIGluDQo+IGFzbS14ODYvaW9tbXUuaD8NCg0KDQpPay4gSSB3aWxs
IG1vdmUgZnVuY3Rpb24gcHJvdG90eXBlIChpb21tdV91cGRhdGVfaXJlX2Zyb21fbXNpKSBmcm9t
IA0KaW9tbXUuaCBpbnRvIGFzbS14ODYvaW9tbXUuaC4NCg0KSSBmaXJzdCB0cmllZCB0byBtYWtl
IHRoZSBmdW5jdGlvbiBhcyBzdGF0aWMgaW5saW5lIGluICJhc20teDg2L2lvbW11LmgiIGJ1dCBh
ZnRlciANCnRoYXQgSSBvYnNlcnZlIHRoZSBjb21waWxhdGlvbiBlcnJvciBmb3IgZGVidWcgYnVp
bGQgYmVjYXVzZSAiYXNtL2lvbW11LmjigJ0gDQppcyBpbmNsdWRlZCBpbiAieGVuL2lvbW11Lmji
gJ0gYmVmb3JlIGlvbW11X2NhbGwoKSBpcyBkZWZpbmVkIGluICJ4ZW4vaW9tbXUuaOKAnS4NClRo
YXQncyB3aHkgSSBkZWNpZGVkIHRvIG1vdmUgaXQgdG8gdGhlICJwYXNzdGhyb3VnaC94ODYvaW9t
bXUuY+KAnSBmaWxlLg0KDQpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0
O2E9YmxvYjtmPXhlbi9pbmNsdWRlL3hlbi9pb21tdS5oO2g9ZWEwY2QwZjFhMmE0NTU4ZWFiNDQ4
ODQ2ODI3MmYzZWQzNWRkMWRjMDtoYj1IRUFEI2wyOTgNCg0KUmVnYXJkcywNClJhaHVsDQo+IA0K
PiBUaGFua3MsIFJvZ2VyLg0KDQo=

