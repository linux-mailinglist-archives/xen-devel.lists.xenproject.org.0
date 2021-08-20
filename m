Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C750A3F2A1A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 12:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169395.309424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH1hw-0007pG-Ip; Fri, 20 Aug 2021 10:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169395.309424; Fri, 20 Aug 2021 10:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH1hw-0007n9-Fk; Fri, 20 Aug 2021 10:25:04 +0000
Received: by outflank-mailman (input) for mailman id 169395;
 Fri, 20 Aug 2021 10:25:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pH7i=NL=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mH1hv-0007n3-45
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 10:25:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.62]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b4aa354-6733-4b76-af2f-f43d6e9f33af;
 Fri, 20 Aug 2021 10:25:00 +0000 (UTC)
Received: from AM6P193CA0137.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::42)
 by AM0PR08MB4289.eurprd08.prod.outlook.com (2603:10a6:208:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 10:24:56 +0000
Received: from AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::4c) by AM6P193CA0137.outlook.office365.com
 (2603:10a6:209:85::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Fri, 20 Aug 2021 10:24:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT035.mail.protection.outlook.com (10.152.16.119) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 10:24:56 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Fri, 20 Aug 2021 10:24:55 +0000
Received: from bd9ed4af69c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3A5D0ED6-5C7F-4B48-AD79-D9E6B6CD9092.1; 
 Fri, 20 Aug 2021 10:24:49 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd9ed4af69c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 10:24:49 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB7PR08MB3275.eurprd08.prod.outlook.com (2603:10a6:5:24::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Fri, 20 Aug
 2021 10:24:48 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 10:24:48 +0000
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
X-Inumbo-ID: 7b4aa354-6733-4b76-af2f-f43d6e9f33af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYDASW+GYpY+13bZub+EVONE3w99SG4BF+emqvkhvU0=;
 b=cK+q/ZrncE80rsef8z0RfrpDnBUiNwc1BvAQu6eqnXTZEOtfQ4I0sQHKs9qy1Yw1VMZyf8EF4OVmN3GDst7mN8ffxjHwqfzfLuZBscHdnv8r4GLKRgie1qT5R8L15Kl8TBHX+PLvYnr4T8EIFZuOfhTaXOd404TuTt6NQ8dI+I0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6a7816dafe8c7b2d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVb6pllqNLMZABMdDLq9yUvwWdXuHfrnccJuwFVHZRGv65AX8Yub+deVo0cluQ84dedVVzvdHKwYhZL4KmtpIm5VS042sYKjN3LmpjLCMlv92tS3c1iLGuD9ImHA0yODWgB/Qr2sNAvQCMPiINllMRrSbhX3fVE806cJ/eCcXeVBGLAQB3O2t1UH3fQOcZN/9X8X+fx5xH8LxyflVTtxqBuzdbwLXa1arPr+i7Q4Ldcg8JQPtOSY/xTFS1KoXJf/F3itjdDS15ftXTqV+vC37M5l/6dWYKqb6tBQN+Xm5gkpZJ+5TNMrbwnUNs6+9sFtOXy61kbEQowzoSTpOT/btQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYDASW+GYpY+13bZub+EVONE3w99SG4BF+emqvkhvU0=;
 b=B+0wagpO8334iU3NTmGuAiRdi81YUo7/aI1sP+ZhMKYtSNqCYJ8xOjBwNjQvHunHcNJRSnFKIjAD/O0bls+l1nV9ziFgLN2BbVFz87OSxwVmikxSbkuz8iAsbCdx+PvKdMCZGCeBpwzWRcgbpYnuHIoiNAxTgiBx2qYJ3s/vN972PWpj+jViQLo0hZR72YmfXK+4OchqkTkDI9UxQKTkklLuNdR82cxUQqEMvlvqnYghl4m+z8IvPMSCBwksPCZf0qfAtWGvL5RSEz1509fqZH+Xns5RgCE0FKG6ojffps3+mMsVV9QZd4pIfEftEXluqbPAMTQK2PTNRK4DfSY+Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYDASW+GYpY+13bZub+EVONE3w99SG4BF+emqvkhvU0=;
 b=cK+q/ZrncE80rsef8z0RfrpDnBUiNwc1BvAQu6eqnXTZEOtfQ4I0sQHKs9qy1Yw1VMZyf8EF4OVmN3GDst7mN8ffxjHwqfzfLuZBscHdnv8r4GLKRgie1qT5R8L15Kl8TBHX+PLvYnr4T8EIFZuOfhTaXOd404TuTt6NQ8dI+I0=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake NUMA
 API
Thread-Topic: [XEN RFC PATCH 07/40] xen/arm: use !CONFIG_NUMA to keep fake
 NUMA API
Thread-Index: AQHXjpsrCM0mCbgWfUKWYF7VHwpa+qt64JgAgADSDXCAAGmUAIAAFMHg
Date: Fri, 20 Aug 2021 10:24:48 +0000
Message-ID:
 <DB9PR08MB6857B5CEDA012C10B192F3F19EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-8-wei.chen@arm.com>
 <e9a45fe3-e4b0-6533-8b41-ac3f10ef386a@xen.org>
 <DB9PR08MB6857D0004A59BC90866AE4C89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <4de5b7ed-ada5-2114-2002-7f5e26a89417@xen.org>
In-Reply-To: <4de5b7ed-ada5-2114-2002-7f5e26a89417@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E3C4C55DD3533D4DB8064F8E6A8E0C0F.0
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: d1d6af10-fe7a-4827-0a24-08d963c4c18e
x-ms-traffictypediagnostic: DB7PR08MB3275:|AM0PR08MB4289:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4289210DCC5CB8B1333360329EC19@AM0PR08MB4289.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iOpJG2VGAKU2XjPOoIMTwWO11jlGfQq4d+Ee5l1BvC3KxS2pi3xUcJcBGgY/rSp9T0gIVXQ28J1B3YZLzyXLHHJzmC4PNfOA0vtb3DwWNiioFfaMrKAgZfXvBH73JUe+yfZ2yY/3FRUcxalIfxnlwCPfPy4zb3E2SwSehbcmdh5df/VmAMwpnuX6DPWfXf4O0Af7bZN7Cuec2q/w2Q0i2TKtf51ltgy3Ksd95tazNL41YqQxpzdgkICiuFLrnBWO+nmqxyMWA6mqm9n+VgrsLysBaDt/USzhYRa4ZXi/a9b/v0T/4RieosYWJKjYro0+NpYeFskMF7JRqq78VVjC4z+tRNRGKJufHVWIb7aB9tMpb+2vNDI6uBcATOfu9PIJie1uhTzloXFU8eYulCKgobCW1NK+Q2d547IFtsuB2eFRIOf3WymilNDazWCQufj2MTL/z3WX/RSibrFeBArF5A0Do24kndwufHkK1FaxmOtxYv8LV8BpRwnLkeb9uwWGEix1Enr+aRHB+jhpQIqkBN795kIxHPXXeAQeoILqqSacXxeJm7Fpon0+zzuml48bPGaaKie4TXhLb5DPWuAFvChc4Ruq1QA5nuUvpnNMiI+gLaq6BBrGxez2i2ETQ3mAsYkxy9R2MigtMz81Iw44i8kdV1U6GfuioDe0PQtuiVQrUqh55XaKhQnr8RitJQXmTtnqWmqcVzSPL9R0PNscKA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(76116006)(8936002)(53546011)(71200400001)(7696005)(122000001)(186003)(478600001)(38070700005)(55016002)(64756008)(66946007)(66556008)(66476007)(316002)(6506007)(2906002)(4326008)(66446008)(38100700002)(8676002)(110136005)(86362001)(9686003)(83380400001)(33656002)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N25MVkZmWE85Y3Q0a3RyeHFxeXJZbUJlOE16STZQRTdwd09NL0l5SjBORTJ4?=
 =?utf-8?B?ZVZ3K01WbzZWaHBCVXRLR1NUcWxZOTdacFdMQ2pIV3ZWWTdSSXF4TVBLQkUw?=
 =?utf-8?B?a29UbG5sVlRyOVJlbjBjYzBweXRLcU5YZnZTVU4veng4NlNGTzdQS3VORGNa?=
 =?utf-8?B?M0xBeHY2NXhpU2Y4TU8vNlM4MjV0R05yS3EremU5RHcyaXMyQ21hNVU2K3FJ?=
 =?utf-8?B?bVgxcGx1b3hHUHMwTzF0VU40K2JaT2lmNTBZeHAxcExyVTBWa1ExalJFVXF4?=
 =?utf-8?B?eS90YWFhTzE3NUM5enBNVHBXLzhEYXlmQkYwVVhsc0U1VEdCOFFubHBycjBK?=
 =?utf-8?B?bTBVVnQ2U2YraDU1TTBJdStSbVFpS1BVajR2R013RjZnUkNWVC9aNXIrbjYy?=
 =?utf-8?B?LzFGL041cEd1TTZKejJYTGtMQk1vVkN2ckVxNWFWNnRhbDk0cHp2eGkrWisr?=
 =?utf-8?B?ZU1sUFR4emVTd0xNNVB6cFZCcEZKd1g2cUZUMkJjL0FHSGRxSlh1ZHB4TnhI?=
 =?utf-8?B?dElEYnJYT1Z4VHhwME9pbmF0a0FSSTFQRmc4T0lTNlJTQUdRdFN3QVZlMnVj?=
 =?utf-8?B?R0ZTdVlPODhTamJReVE4bzdPTEJ5dVM1N2hZNVhRa2YrZzJyTUFqS1c2UjJF?=
 =?utf-8?B?U2JlY2ZjWFQ3WFpiOThST0R3K0NCZ0hsSUtnSldRTFl1MU9seXZXV2RIcmM1?=
 =?utf-8?B?Q1ZXblBiZjFxOXNSRFBPRXJ1dldHMG1uMENlcDdNMHVJandSMThBdU12RXl6?=
 =?utf-8?B?YWFwVXlxSC9POGlJTTNtTC9qV3VuL1VReG9RSTY1QXhaN1dpdmdQNUFRVW1G?=
 =?utf-8?B?OEthaWpoUGJaekVPR1JZcDN1cXdGellnV2Y3c2J6OXJUclBibkpDTzc0ZTVG?=
 =?utf-8?B?RmFjZGpCV1JoWndhMzZSSU85M1p0Q1BkZkZXb2pPRjhUWUdZKzkydG1VSkRo?=
 =?utf-8?B?OXluNURZRlljOE83c0pxNTFlSStQQWszSkNZeTVaRWY5YzR1eW1VSHdxTXJl?=
 =?utf-8?B?R2hHVE5rcG53d0NVN2hYQWtBUW9zTVN6RC9NME55M3VuUjhXa0dkMzZyTUlL?=
 =?utf-8?B?eWZQajZrVFBxZUJBaDBwaFlLVnArSHJTRmc2K201NC9BTENRZ052dG15eTJJ?=
 =?utf-8?B?bmo0cEloaTFZY0RWVnpPMmFkazZKakh5MmxuaGxQSVE0WEhQZGlteE03YW5J?=
 =?utf-8?B?WWZDRTVmR2hZTEg1cFhQVUVWMUE1SGlpanNNMVNxdlc1dEF4SmwyM3ErWjMv?=
 =?utf-8?B?MEpVQ0pMNm5leWRSOGRWbVlvMG83WFRITTh4cnh0ZmhOUUlSdEJjWXlrSEQ4?=
 =?utf-8?B?Ty9TQ2tIMk9qN0xMRERTcnlITHBtY2ZNU244b1ZQbmkvTXZPMTh3cmlDcGhT?=
 =?utf-8?B?ZTFlcU1nSHFoaUV3NGNCZTdFZEF4dG55UmRJdGtpd0hESzgrNDAvb1lSRC9s?=
 =?utf-8?B?V00rRGpaOGRrRVJpWUN1UEw3Mytxa0txSlNGMEJsSkFxTWcremRaRHVORlVk?=
 =?utf-8?B?elZNRXRDZk1raVM5VWNUa1RZUzFQREhmbkpYVk5FOTdRNUJEbVd0RmN1RkVu?=
 =?utf-8?B?a09IRnFTb1NSMFN3ajQ2TEU4cnpkdWJHSDZObDErOFhKTUlHQlkvYUl6Rmc4?=
 =?utf-8?B?NjUzbkJhRDcvMjFCS29yL2wyVGlVa3RpZnhxanhJaTd2bEZUMFFRYXJBSDhK?=
 =?utf-8?B?d0VCQVNCQVlCc2dOc2xBbE9aaTVmVWNVTEcwRnVXeWlGdWtHcnorMGFEWWRH?=
 =?utf-8?B?UERjdUZNNlJ0SEZ6dnRtV0NnU1JJdFJmVVV0dzN2dXBHbXJsR1RuZEFrQ1dU?=
 =?utf-8?B?bW9ZSWM3R0xaTUUzNUlibVFQRWplZXgxYjN0eWc2T0JrSjJuTWFUZmptd2RH?=
 =?utf-8?Q?VacodSNTZLisg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3275
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f074cf75-3dc5-47e3-4754-08d963c4bcbf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qVBBLnLuoBLheUJhi9MRiSnLgMSPcjZyiIpsNyPL1oiHbIJ5vpEFhUC57H7soRnvDzznTRbdR95ACh2jsstpiVNVWCRhIMF3hL+7x8xahWx1KDZi/VbRw+yfyjn+iokR47KuB1S574gr5MvwLsi6W1rqKTbfMZHzixPdW9Tc0U8Qh2MXXaZu/FzE6XfGyjZMs/AC1sj7XyKshemj3PXoqN8w4uBae762aTsyytJOxN/pEFdjEf4Z8jcKB2RryvXhUw5elG1yz7I4hzga4wB+5ChnfSKzKivBg31nRb6ygL4bbHVv68wQjk9FT57cU5nTxBNWUy5yODUbfGNGPeUCP09RugPkegB6GP9zDv2e1IoTYqG5BrnSMrSu1jtRe2TLQgyDO3/3Wglidib08Atv48oVZzY2J2v6D9D/Fq2DyWfeYVYDAxF2/bcb7EhmGYQrAjxvunEAbIePagnCzF0aPdTVhdPYSbG7k9YiPhFUTsihhJqRZHAI1ANTQ6TUkUvYXU/wdr6MR9ay7Zw9I5BotKE0RTcRBn+xdgR4dJ8b/t8JptO8KYazJavfAnuiVjHh3Y/fx54Dp/P75enPoPnww/OoRkoAlR62y0ahqshGh0YgD6WxdHRsJDfDpKNUKO9FFvIKrOQOWi0+dsA4Geqw/beGp6q00Ni6rNNliOfSkYS/3fPlfrrxKvDGAGTfvloTyZ7H0MHJbMVnz+59zImI0g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966006)(36840700001)(2906002)(8936002)(26005)(5660300002)(186003)(70206006)(8676002)(47076005)(33656002)(478600001)(82310400003)(52536014)(53546011)(6506007)(81166007)(55016002)(70586007)(9686003)(336012)(316002)(83380400001)(86362001)(4326008)(82740400003)(356005)(36860700001)(110136005)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 10:24:56.1097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d6af10-fe7a-4827-0a24-08d963c4c18e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4289

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjDml6UgMTY6MjQN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMDcvNDBdIHhlbi9hcm06IHVzZSAhQ09ORklHX05VTUEg
dG8ga2VlcCBmYWtlDQo+IE5VTUEgQVBJDQo+IA0KPiANCj4gDQo+IE9uIDIwLzA4LzIwMjEgMDM6
MDgsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwNCj4gDQo+IEhpIFdlaSwNCj4gDQo+
ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gPj4gU2VudDogMjAyMeW5tDjmnIgxOeaXpSAyMTozNA0K
PiA+PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7DQo+ID4+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2Uu
Y29tDQo+ID4+IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+
DQo+ID4+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAwNy80MF0geGVuL2FybTogdXNlICFD
T05GSUdfTlVNQSB0byBrZWVwDQo+IGZha2UNCj4gPj4gTlVNQSBBUEkNCj4gPj4NCj4gPj4gSGkg
V2VpLA0KPiA+Pg0KPiA+PiBPbiAxMS8wOC8yMDIxIDExOjIzLCBXZWkgQ2hlbiB3cm90ZToNCj4g
Pj4+IE9ubHkgQXJtNjQgc3VwcG9ydHMgTlVNQSwgdGhlIENPTkZJR19OVU1BIGNvdWxkIG5vdCBi
ZQ0KPiA+Pj4gZW5hYmxlZCBmb3IgQXJtMzIuDQo+ID4+DQo+ID4+IFdoYXQgZG8geW91IG1lYW4g
YnkgImNvdWxkIG5vdCBiZSBlbmFibGVkIj8NCj4gPg0KPiA+IEkgaGF2ZSBub3Qgc2VlbiBhbnkg
QXJtMzIgaGFyZHdhcmUgc3VwcG9ydCBOVU1BLCBzbyBJIHRoaW5rDQo+ID4gd2UgZG9uJ3QgbmVl
ZCB0byBzdXBwb3J0IEFybTMyIE5VTUEuDQo+IA0KPiBJIHVuZGVyc3RhbmQgdGhhdCB0aGVyZSBt
YXkgbm90IGJlIDMyLWJpdCBwbGF0Zm9ybSB3aXRoIE5VTUEuIEFuZCB0aGF0J3MNCj4gZmluZSBz
dGF0aW5nIHRoYXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLiBIb3dldmVyLi4uDQo+IA0KPiA+IElu
IHRoaXMgY2FzZSwgdGhpcyBLY29uZmlnDQo+ID4gb3B0aW9uIGNvdWxkIG5vdCBiZSBlbmFibGVk
IG9uIEFybTMyLg0KPiANCj4gLi4uIHlvdSBjb250aW51ZSB0byBzYXkgImNvdWxkbid0IGJlIGVu
YWJsZWQiIHdpdGhvdXQgY2xhcmlmeWluZyB3aGV0aGVyDQo+IHRoaXMgbWVhbiB0aGF0IHRoZSBi
dWlsZCB3aWxsIGJyZWFrIG9yIHRoaXMgd2FzIGp1c3Qgbm90IHRlc3RlZCBiZWNhdXNlDQo+IHlv
dSBkb24ndCBoYXZlIGFueSBwbGF0Zm9ybS4NCg0KT2ssIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNl
cm4uIFllcywgbXkgd29yZHMgd291bGQgbGVhZCB0byBtaXMtdW5kZXJzdGFuZGluZy4NCklmIHdl
IG1ha2UgQ09ORklHX05VTUEgZW5hYmxlZCBpbiBBcm0zMiwgaXQgbmVlZCBBcm0zMiB0byBpbXBs
ZW1lbnQgc29tZQ0KY29kZSB0byBzdXBwb3J0IE5VTUEgY29tbW9uIGNvZGUuIE90aGVyd2lzZSB0
aGUgQXJtMzIgYnVpbGQgd2lsbCBmYWlsZWQuDQpJIGhhdmUgbm90IHRyaWVkIHRvIGltcGxlbWVu
dCB0aG9zZSBjb2RlIGZvciBBcm0zMi4gQW5kIEkgZm91bmQgdGhlcmUgaXMNCm5vIEFybTMyIG1h
Y2hpbmUgc3VwcG9ydCBOVU1BLCBzbyBJIHdhbnRlZCBBcm0zMiB0byB1c2UgZmFrZSBOVU1BIEFQ
SQ0KYXMgYmVmb3JlLg0KDQo+IA0KPiBUbyBwdXQgaXQgZGlmZmVyZW50bHksIHRoZSBjb2RlIGZv
ciBOVU1BIGxvb2tzIGJpdG5lc3MgbmV1dHJhbC4gU28gSQ0KPiBjYW5ub3QgcmVhbGx5IHdoYXQg
d2hhdCBwcmV2ZW50IHVzIHRvIHBvdGVudGlhbGx5IHVzZSBpdCBvbiBBcm0gMzItYml0Lg0KPiAN
Cg0KWWVzLCB5b3UncmUgcmlnaHQsIGl0J3MgbmV1dHJhbC4gQnV0IGRvIHdlIHJlYWxseSBuZWVk
IHRvIGFkZCBjb2RlIHRvIGFuDQpBUkNIIHRoYXQgaXQgbWF5IG5ldmVyIHVzZT8gQW5kIGhvdyBj
YW4gd2UgdGVzdCB0aGlzIGNvZGU/IEJlZm9yZSB0aGlzIHBhdGNoLA0KSSBoYWQgY2hlY2tlZCBM
aW51eCwgYW5kIGZvdW5kIHRoYXQgT0ZfTlVNQSBvbmx5IHNlbGVjdGVkIGJ5IEFybTY0IG5vdCBB
cm0zMi4NCkJ1dCBpZiB5b3UgZmVlbCB0aGUgbmVlZCB0byBhZGQgdG8gYXJtMzIsIEkgaGF2ZSBu
byBwcm9ibGVtIHdpdGggdGhhdC4NCg0KPiA+DQo+ID4+DQo+ID4+PiBFdmVuIGluIEFybTY0LCB1
c2VycyBzdGlsbCBjYW4gZGlzYWJsZQ0KPiA+Pj4gdGhlIENPTkZJR19OVU1BIHRocm91Z2ggS2Nv
bmZpZyBvcHRpb24uIEluIHRoaXMgY2FzZSwga2VlcA0KPiA+Pj4gY3VycmVudCBmYWtlIE5VTUEg
QVBJLCB3aWxsIG1ha2UgQXJtIGNvZGUgc3RpbGwgY2FuIHdvcmsNCj4gPj4+IHdpdGggTlVNQSBh
d2FyZSBtZW1vcnkgYWxsb2NhdGlvbiBhbmQgc2NoZWR1bGVyLg0KPiA+Pj4NCj4gPj4+IFNpZ25l
ZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAg
ICB4ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaCB8IDQgKysrKw0KPiA+Pj4gICAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5j
bHVkZS9hc20tYXJtL251bWEuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4+PiBp
bmRleCAzMWE2ZGU0ZTIzLi5hYjljNGEyNDQ4IDEwMDY0NA0KPiA+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLWFybS9udW1hLmgNCj4gPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5o
DQo+ID4+PiBAQCAtNSw2ICs1LDggQEANCj4gPj4+DQo+ID4+PiAgICB0eXBlZGVmIHU4IG5vZGVp
ZF90Ow0KPiA+Pj4NCj4gPj4+ICsjaWYgIWRlZmluZWQoQ09ORklHX05VTUEpDQo+ID4+DQo+ID4+
IE5JVDogV2UgdGVuZCB0byB1c2UgI2lmbmRlZiByYXRoZXIgdGhhbiAjaWYgIWRlZmluZWQoLi4u
KQ0KPiA+Pg0KPiA+DQo+ID4gT0ssIEkgd2lsbCBjaGFuZ2UgcmVsYXRlZCBjaGFuZ2VzIGluIHRo
aXMgc2VyaWVzLg0KPiA+DQo+ID4+PiArDQo+ID4+PiAgICAvKiBGYWtlIG9uZSBub2RlIGZvciBu
b3cuIFNlZSBhbHNvIG5vZGVfb25saW5lX21hcC4gKi8NCj4gPj4+ICAgICNkZWZpbmUgY3B1X3Rv
X25vZGUoY3B1KSAwDQo+ID4+PiAgICAjZGVmaW5lIG5vZGVfdG9fY3B1bWFzayhub2RlKSAgIChj
cHVfb25saW5lX21hcCkNCj4gPj4+IEBAIC0yNSw2ICsyNyw4IEBAIGV4dGVybiBtZm5fdCBmaXJz
dF92YWxpZF9tZm47DQo+ID4+PiAgICAjZGVmaW5lIG5vZGVfc3RhcnRfcGZuKG5pZCkgKG1mbl94
KGZpcnN0X3ZhbGlkX21mbikpDQo+ID4+PiAgICAjZGVmaW5lIF9fbm9kZV9kaXN0YW5jZShhLCBi
KSAoMjApDQo+ID4+Pg0KPiA+Pj4gKyNlbmRpZg0KPiA+Pj4gKw0KPiA+Pj4gICAgI2VuZGlmIC8q
IF9fQVJDSF9BUk1fTlVNQV9IICovDQo+ID4+PiAgICAvKg0KPiA+Pj4gICAgICogTG9jYWwgdmFy
aWFibGVzOg0KPiA+Pj4NCj4gPj4NCj4gPj4gQ2hlZXJzLA0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiBK
dWxpZW4gR3JhbGwNCj4gDQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

