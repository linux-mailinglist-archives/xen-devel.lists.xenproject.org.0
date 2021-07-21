Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D7B3D0A0C
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 09:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159161.292796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6727-0005JB-Jd; Wed, 21 Jul 2021 07:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159161.292796; Wed, 21 Jul 2021 07:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6727-0005H4-GN; Wed, 21 Jul 2021 07:52:47 +0000
Received: by outflank-mailman (input) for mailman id 159161;
 Wed, 21 Jul 2021 07:52:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KCq8=MN=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m6726-0005Gy-3t
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 07:52:46 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.80]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d949b922-752a-4cbc-bdd8-09e96a58ac4c;
 Wed, 21 Jul 2021 07:52:43 +0000 (UTC)
Received: from PR0P264CA0265.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::13) by
 DB9PR08MB7039.eurprd08.prod.outlook.com (2603:10a6:10:2cf::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.31; Wed, 21 Jul 2021 07:52:40 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1:cafe::bb) by PR0P264CA0265.outlook.office365.com
 (2603:10a6:100:1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Wed, 21 Jul 2021 07:52:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 21 Jul 2021 07:52:40 +0000
Received: ("Tessian outbound b81a99a0393d:v99");
 Wed, 21 Jul 2021 07:52:39 +0000
Received: from 12315cd80173.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1CD8C61-09AD-4C33-9C33-4957257200B6.1; 
 Wed, 21 Jul 2021 07:52:30 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12315cd80173.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 21 Jul 2021 07:52:30 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VE1PR08MB4672.eurprd08.prod.outlook.com (2603:10a6:802:a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Wed, 21 Jul
 2021 07:52:28 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 07:52:28 +0000
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
X-Inumbo-ID: d949b922-752a-4cbc-bdd8-09e96a58ac4c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY7ZxzNpNzB8rIsM7J11jX6/cP1VaupkN8hcmc02UxM=;
 b=lFyR7g80FfU+ukMBgSw+8+orn4wGQ0trQbQr7zr62L1SJwqGmB8hTN08IGCr95oifIUHHa4QTZl6G7IXh890mOtGcMNP/HUHNC825okgID3t2ali27Pu+KG1Ntp2DhuW+miAj6PN7BsdgLGm4MgRt/WjOhLPLsK+O67rSfPna4g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dslnP5mN0uOcePF0+C81KhV1CXsG8WKTAuaCvJdVar9s4OsTxjApeEQSXqTd3OLGxVctpeOD/QSmvAATHmvA7BjTMw0mxKgX8OShlaYbShk2BfRoPSMq3BKisJyetQotYVJW3Iu99s8w6T/Q9Lji62bFeE5nRq/PqJYC0Vhsil3UskABTj7bYQv9M8hAX6LQPoXIvUYhSyK2M39g5rHMwqm2mnh+DYVVjviM0FoXeaNDKfxGLBkpxijMYt8tqf4Gi/MBbG7oBMy3whdae4+uUFhK3RK88mGxK8xKwa1UiSpPRTflvuGry9Oe/j4UQv97D08V8eIfq9wRYq/C2ec1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY7ZxzNpNzB8rIsM7J11jX6/cP1VaupkN8hcmc02UxM=;
 b=j1pojPEVVvr8ublDUWEuXHfgRFcrKkrZZGtVInXBq1I57aFcLceYNoUUzAT3wbF8oGUQjUad+Hzp0TQUu3LcfmdE70IWKlPWJc2KMuQcrsqj2nCZjM8Yx5Q73rqgIytSBGDyXqkCH90DCZ3tjjtmaCX0gxdr93Wyz5HPDDwCimi5xaJZTsxwiuIzToj74cnYdGWsksSyrgHTqw183GrOh4zxAR27Tmwoux0MxUKTRD/ggVSQA6PnuGh4qqJCfBTUiXtMxlur5UahsGTsn/3yz48By2XlmH0RskV4xK6QHbpkSzaRXOBLluffvCfq3SG4VD2aiEfLHus5tq9+h+jhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iY7ZxzNpNzB8rIsM7J11jX6/cP1VaupkN8hcmc02UxM=;
 b=lFyR7g80FfU+ukMBgSw+8+orn4wGQ0trQbQr7zr62L1SJwqGmB8hTN08IGCr95oifIUHHa4QTZl6G7IXh890mOtGcMNP/HUHNC825okgID3t2ali27Pu+KG1Ntp2DhuW+miAj6PN7BsdgLGm4MgRt/WjOhLPLsK+O67rSfPna4g=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	nd <nd@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Subject: RE: [PATCH V3 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
Thread-Topic: [PATCH V3 08/10] xen/arm: introduce acquire_staticmem_pages and
 acquire_domstatic_pages
Thread-Index: AQHXeTjq+y3FueirQkOYkBcn9nCNvqtKDb8AgAAJhwCAAvzIwA==
Date: Wed, 21 Jul 2021 07:52:27 +0000
Message-ID:
 <VE1PR08MB5215B20345ED4C5C915A337EF7E39@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
 <20210715051819.3073628-9-penny.zheng@arm.com>
 <48c59068-296e-7060-1352-f07338833378@suse.com>
 <7753fe1f-7a5c-6205-a184-25190ad43286@xen.org>
In-Reply-To: <7753fe1f-7a5c-6205-a184-25190ad43286@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 380849101CB4524B8B72DFE12CD8A749.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: aae5517f-7f82-40ab-21e4-08d94c1c83d2
x-ms-traffictypediagnostic: VE1PR08MB4672:|DB9PR08MB7039:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB703950D6DFDEA7EC597311B7F7E39@DB9PR08MB7039.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Qyf0L8o/eKZhj4rR8cDLyERB/JWXwXQ4ebLZoAqfiqCXaaLIzc+smhmnxP9aVHd9v7Fu38qVWssNjTel6yXyMHHBD3rRQXXs7nxdJjqHSpwhgpkVW54Quql9jHufLsXK/HjmvqyClG4PE9qFW13HQJ0xJcfjZ5bapXEukbr118jQSqlvVfrpPSHjjMw+e2VFuy0WlzgWcr8SYwYOt9Et3J5KkzwKEPUYQh0FxC+AiAdNqbNizCgUGm52+oSPJzs8Vu1Nr9JkN8YPk3GG9UAQ/7J67TqD0bWEe3tNXcunGi/2ZB4YrgSVpByDKI970TTHbYJClnvz/N4lmfLMSWwN4Ss7O5t8i5p1DNTnB8CofpmHw0fNsR7Yjhd4k83mjoyyA7ZrWaSjMRAmNR/l+XJ2ayZ7j8FYhKtRg/bsxt9IXpLjWTlR+yj4CAQ9xFF66xy6+xlZ7j3f8qqoRrKWZL8y9q3YgWopieuop0SC2uHDDrL+TeVbpIQ/vXd6KyY5B1MGmOuYGL4hH3GjG0T+d1mdVaZFlX50cN6wXfUP+225jAV/hYDBKJg+Ai05ufx7qxIqVru6JMuE+/1d4o8qF5Q1JCrgaxJZ7oQQixzW8eKEGpM5o0VJDpeb7/3cH5xzY/l0wdOyQtx4eW62SkjBJKRXUxEqGYHSI/Vzsc+jc8h+6pBy4/5MvS/BYnqx/wb7yGGf/dpw5RlH2e4YkP2MRNLRhQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(366004)(39850400004)(136003)(9686003)(66556008)(76116006)(66476007)(71200400001)(55016002)(122000001)(8676002)(5660300002)(316002)(83380400001)(38100700002)(86362001)(8936002)(2906002)(66446008)(64756008)(186003)(26005)(7696005)(54906003)(6916009)(53546011)(478600001)(66946007)(33656002)(6506007)(52536014)(4326008)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VUExMHNwYnFKZnBBREdzK2J0cmkraEVmZmo3d0lOckttMWRvV3MrRjEra2lE?=
 =?utf-8?B?NXNveSs2RGJkYVBiZ0REcXFjeFlQVXZ3aVJteFB1RlBHMUNORWtOL25Kc1JK?=
 =?utf-8?B?cmxqV0g2bW9pYUZnTkxtZWh2VmgwZlBMZ2tTUFN6b1prazN3dGRpbzYxcnk5?=
 =?utf-8?B?cTdvZ0U3YzhvaGsyWkpObDJ5U1FZRi8ybndUekkvb0F3bnZ1bU9XQVloR1RY?=
 =?utf-8?B?UnQxSWY3QWdFU0ZXSzIxTnU4VXoyNkZ2YjRzTU5FaEdvYXBldWFuUzBsR0tx?=
 =?utf-8?B?SHNEOVd4L2puMFl3ZEd0Zng2TW1IdkRWUm5GTTVPZjFIUnZSWmNjeWJFWWla?=
 =?utf-8?B?Tk9XQmxBdm0xbEFuOE9EMm5rQitSKzM2VHJCWmNEVW0vRjJKZEZlMmNmODNE?=
 =?utf-8?B?VDdDNDNmdStJdkVPb0M2V0xHOFFva0pENWs3ZitPbFdsZ21QbWtJUmVDZXRP?=
 =?utf-8?B?MXV0N3BCS0pIN0QydkNKV2NKL3F2TEoyLzc3WTJldUo2Tk84WE9IZWFSaDQ4?=
 =?utf-8?B?VjEwRkk5RzFuTXFHRE5ob0MrSk1NY1VFREJsaVdtQ1ZZaVd4Qk5hMkYzeERF?=
 =?utf-8?B?TC94YTdzQnZ0SER2TmdhNnpIeUlpNDl5RU4wZ3dROWRPbjdaMTByc0VVeHhT?=
 =?utf-8?B?czJSZ2FGWFZKeXBzVjVRZGJGWXgwNmhNQTU1bjRCQnBBUjk3RCtDUUdQSkpq?=
 =?utf-8?B?YnMrY3BxNGdSeUpONGpRT0J6NS85Zk5WZVdRZFhxRU16T1p5R0lQMEZjNHRQ?=
 =?utf-8?B?eGxBeUpWUDZWeGIxMlVvMzBHbjE1VDZEWFFvaExmcDdPN2JzTElyc09ReEtm?=
 =?utf-8?B?VDRDY3VFN0JaaURLOTFCeXlpdld4ZHloMjFSb2YxSExJcStFOTJUMFJqWjM0?=
 =?utf-8?B?cTUzd3hBY3l1TWY3WlpRL2FwZ2VLdVFISXZLYXFGcXJCNER1R0loKytYRVBG?=
 =?utf-8?B?NG9TWjFjSU1CVXJueDMrZVZ6S1gzNnlKbHh5Q1ZHMlJBaTZjTGc5cU5JVEpm?=
 =?utf-8?B?NS9nOW9tMWJBTUlRR2pOcXVESDNsdURMMDloY3lLV3ptVlhLT096enA1QVp3?=
 =?utf-8?B?RThSZEQvRDQ0SDc3NkdlMmNGNHRkQ2NaYS9TOUtDdmVTV1FHWVZvYnFla0dF?=
 =?utf-8?B?V2tPTXZHVDhESW9PYm8vMGNmL2ZFZmlUampmZk5QSjl5czJEeDJhZGR1YWJ5?=
 =?utf-8?B?ZmhKbytTSjY4cUY2bVd1UGc4MGtHdmJXZnlSSThPV25uL0xSdFV5S3JyMWI2?=
 =?utf-8?B?NlBORElMWjB1RXp4NjV3dWp3WktsaDdldUVvNlh0M2RGYmRmeGI5NmZGM0lm?=
 =?utf-8?B?engwUmRTcFNmdkdmZ01hcGtEeWh4U3NiMUEyQkF3b3paaUFuU2ErYXgzMkt5?=
 =?utf-8?B?Qld5a3VOKy9HTklyY3lHWnNWNmZrK29CM2lRTlFVeDM4b2FneDhiUFlkM09M?=
 =?utf-8?B?TUVqRkFydUE5Tks2cVgrelZ1V2pFQjZKamVtTy8wNEppaHFJTnZFcThNOS84?=
 =?utf-8?B?YUU0cFVwdTlQcEc0UzVUMHQzNkRRQStPQk5MMnlkakptRkMrcUVXTUs2b3dy?=
 =?utf-8?B?dE16OTFsT2M2N2pXWVd2OHQvUEVkb0JEZlhkUW5uSU04ZTlKbUw5VDFWenNz?=
 =?utf-8?B?cmQ2SUJOc1JmSDBnM0xDVmZyR25WR1VZeDYrSmhoS1JUZXY1ckYrWWFIZk9N?=
 =?utf-8?B?L3ZNSzZaTEx3U1pqaTJWZEFtb1ptbFQwTjhnWW44ODJIc3NPdTRHc1NJTStM?=
 =?utf-8?Q?y0vfpUmDvTeEsaoiwqHElgEw2ujkU6LokQFOsql?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4672
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d772a9a8-bd4e-4e6e-b7d8-08d94c1c7c78
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P2EQl2yAzdW76VTx5aCGiwD3oaReNfmN5CZMRJN+Hbu0bETodcM+GJo77zWf19C2jc6XhKpoAqeyMlSkxa9jMP9CLGIGeidFKRefYC3h/ZRPRyHMolHNZF5qKPbx/aVyU+GuSeslPaYv6UNE+QZddcCDj13T3kHnTYGsGa9lmcqHsMv+6NTUp8AQW3VTjHDSXmvP1TUY1MM6aRbQNh1rkc1xMMchAZ24na1BbvipZMy5mbmIzk37/DdYb5ikqzyRGmYf0SVWPelJVKJFOz2E4+jqScnPXVesifWqPkos9Azviq1MwCca0U2ywPZBZQ8nlU9RL9g44N3LPI+ei3CugIkclvtgJifDQsk3ZfJavt+rOM/nEuS+I5CJhy5ZEWnWvKiKa6AUKxfGFFGAVsQ1L0ihp7eK+FxFQ6OxtY18+TH+qvOmhy+UlDg36tzFRmuP70Y36F1D0/qrXVobspyFwRjmKNE25jdTsgXKPNCeubAjWDMnQVt1vlC64NeyyAlyB75ogIsne5TmL8GTJa6sUtIxd/7vbBR0kszc2pbX536bdNdAkzJRHNxM94NErCyO4RbvtcDxZK1u2QVWhMjYsOvNJBkm3yEBcYpaK2ZJ03DNU5brhuBV5tr2z2Fhd+UgZngCt6fYr8iDR2Bhgvx00mB/VAPMI7KHxTACepONQ43USEGFzcDRWXRQizSJcTTQ8Zaooop7ZbQRqQx1fznAVw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(36840700001)(46966006)(478600001)(8936002)(36860700001)(8676002)(4326008)(316002)(336012)(54906003)(2906002)(83380400001)(107886003)(6862004)(9686003)(70206006)(82740400003)(86362001)(33656002)(52536014)(5660300002)(53546011)(26005)(55016002)(7696005)(186003)(70586007)(82310400003)(356005)(81166007)(47076005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 07:52:40.2828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aae5517f-7f82-40ab-21e4-08d94c1c83d2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7039

SGkgSnVsaWVuIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAxOSwgMjAyMSA2
OjAwIFBNDQo+IFRvOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBQZW5ueSBaaGVu
ZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IEJlcnRyYW5kIE1hcnF1aXMgPEJlcnRyYW5k
Lk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+IDxXZWkuQ2hlbkBhcm0uY29tPjsgbmQgPG5k
QGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IHNzdGFiZWxsaW5p
QGtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBWMyAwOC8xMF0geGVuL2FybTogaW50
cm9kdWNlIGFjcXVpcmVfc3RhdGljbWVtX3BhZ2VzDQo+IGFuZCBhY3F1aXJlX2RvbXN0YXRpY19w
YWdlcw0KPiANCj4gSGkgSmFuLA0KPiANCj4gT24gMTkvMDcvMjAyMSAxMDoyNiwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+ID4gT24gMTUuMDcuMjAyMSAwNzoxOCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+
ID4+IEBAIC0xMDY1LDYgKzEwNjksNzMgQEAgc3RhdGljIHN0cnVjdCBwYWdlX2luZm8gKmFsbG9j
X2hlYXBfcGFnZXMoDQo+ID4+ICAgICAgIHJldHVybiBwZzsNCj4gPj4gICB9DQo+ID4+DQo+ID4+
ICsjaWZkZWYgQ09ORklHX1NUQVRJQ19NRU1PUlkNCj4gPj4gKy8qDQo+ID4+ICsgKiBBY3F1aXJl
IG5yX21mbnMgY29udGlndW91cyByZXNlcnZlZCBwYWdlcywgc3RhcnRpbmcgYXQgI3NtZm4sIG9m
DQo+ID4+ICsgKiBzdGF0aWMgbWVtb3J5Lg0KPiA+PiArICovDQo+ID4+ICtzdGF0aWMgc3RydWN0
IHBhZ2VfaW5mbyAqYWNxdWlyZV9zdGF0aWNtZW1fcGFnZXModW5zaWduZWQgbG9uZyBucl9tZm5z
LA0KPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG1mbl90IHNtZm4sDQo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50DQo+ID4+ICttZW1mbGFncykNCj4gPg0KPiA+IFRoaXMg
YW5kIHRoZSBvdGhlciBmdW5jdGlvbiBub3QgYmVpbmcgX19pbml0LCBhbmQgdGhlcmUgbmVpdGhl
ciBiZWluZw0KPiA+IGFueSBjYWxsZXIgbm9yIGFueSBmcmVlaW5nLCBhIHF1ZXN0aW9uIGlzIHdo
ZXRoZXIgX19pbml0IHdhbnRzIGFkZGluZzsNCj4gPiBwYXRjaCAxMCBzdWdnZXN0cyBzby4gVGhl
IGxhY2sgb2YgZnJlZWluZyBpbiBwYXJ0aWN1bGFyIG1lYW5zIHRoYXQNCj4gPiBkb21haW5zIGNy
ZWF0ZWQgdXNpbmcgc3RhdGljIG1lbW9yeSB3b24ndCBiZSByZXN0YXJ0YWJsZSwgcmVxdWlyaW5n
IGENCj4gPiBob3N0IHJlYm9vdCBpbnN0ZWFkLg0KPiANCj4gSSBhbSBvcGVuIHRvIHJlcXVlc3Qg
YW4gaG9zdCByZWJvb3QgaW4gY2FzZSBvZiBhbiBpc3N1ZS4gQWx0aG91Z2gsIGl0IHdvdWxkIGJl
DQo+IGdvb2QgdG8gaGF2ZSBjb2RlIGluIHBsYWNlIGZvciB0aGF0Lg0KPiANCj4gUmVnYXJkbGVz
cyB0aGUgcmVib290IHBhcnQsIEkgd291bGQgc3RpbGwgZXhwZWN0IHRoZSBkb21haW4gdG8gYmFs
bG9vbiBpbi9vdXQNCj4gbWVtb3J5LiBUaGlzIGlzIHByZXR0eSBicm9rZW4gdG9kYXkgYmVjYXVz
ZSBYZW4gd291bGQgZW5kIHVwIHRvIGdpdmUgdGhlDQo+IG1lbW9yeSB0byB0aGUgaGVhcCBhbGxv
Y2F0b3IgYW5kIHRoZSBuZXh0IGFsbG9jYXRpb24gd291bGQgYmUgdGhyb3VnaCB0aGUNCj4gaGVh
cCBhbGxvY2F0ZS4NCj4gDQo+IEZvciBydW50aW1lICJmcmVlL2FsbG9jYXRlIiwgd2UgbWF5IHdh
bnQgdG8gZm9sbG93IHRoZSBzYW1lIGJlaGF2aW9yIGFzDQo+IGRpcmVjdC1tYXBwZWQgZG9tYWlu
IChpLmUuIEdGTiA9PSBNRk4pOiB0aGUgcGFnZSB3aWxsIG5vdCBiZSBnaXZlbiBiYWNrIHRvDQo+
IGFueSBhbGxvY2F0b3IgYW5kIHdlIG9ubHkgY2hlY2sgaWYgdGhlIHBhZ2UgYmVsb25ncyB0byB0
aGUgZG9tYWluIG9uDQo+IGFsbG9jYXRpb24uDQo+IA0KPiBTbyBhZGRpbmcgX19pbml0IGZvciBh
Y3F1aXJlX3N0YXRpY21lbV9wYWdlcygpIGlzIHByb2JhYmx5IGZpbmUuDQo+IA0KPiBPbiBhIHNp
ZGUgbm9kZSwgb24gdjIsIEkgaGF2ZSByZXF1ZXN0ZWQgdG8ga2VlcCB0cmFjayBvZiB0aGUgbGlz
dCBvZiBtaXNzaW5nDQo+IHBpZWNlcy4gQFBlbm55LCB3aGVyZSBjYW4gSSBmaW5kIHRoZSBsaXN0
Pw0KPiANCg0KT2gsIHNvcnJ5Li4uIA0KDQpJIHRob3VnaHQgeW91IHdlcmUgcmVxdWVzdGluZyBh
IG5ldyBtYWlsIGxpc3QgaXNzdWUgdG8gdHJhY2sgYWxsIG1pc3NpbmcgcGllY2VzIGluIEFSTS4u
Lg0KQW5kIGEgc2Vjb25kIHRob3VnaCBoZXJlLCB5b3Ugc2hhbGwgb25seSBtZWFuIHRoZSBtaXNz
aW5nIHBpZWNlcyBmb3IgdGhpcyBwYXRjaCBzZXJpZS4NCg0KSSdsbCBkbyBhIHF1aWNrIHN1bS11
cCBoZXJlIGFuZCBwdXQgaW4gdGhlIFBhdGNoIHY0IGNvdmVyIGxldHRlcjoNCg0KVE9ETzoNCi0g
cmVib290IGRvbWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbi4NCi0gQWxsIG1lbW9yeS1vcHMoaHlw
ZXJjYWxscykgcmVnYXJkaW5nIGRvbWFpbiBvbiBzdGF0aWMgYWxsb2NhdGlvbiB0byBiYWxsb29u
IGluL291dCBtZW1vcnkNCi0gYXN5bmNocm9ub3VzbHkgc2NydWJiaW5nIFBHQ19yZXNlcnZlZCBw
YWdlcw0KLSBjb25zaWRlciBkb21haW4gb24gc3RhdGljIGFsbG9jYXRpb24gb24gTlVNQS1zdXBw
b3J0IHNjZW5hcmlvDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQoNCkNo
ZWVycywNCg0KLS0NClBlbm55IFpoZW5nDQo=

