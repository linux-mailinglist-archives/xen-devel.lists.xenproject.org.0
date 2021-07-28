Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE823D890C
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 09:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161378.296320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8eDb-0004Np-Qo; Wed, 28 Jul 2021 07:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161378.296320; Wed, 28 Jul 2021 07:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8eDb-0004LF-Mn; Wed, 28 Jul 2021 07:43:07 +0000
Received: by outflank-mailman (input) for mailman id 161378;
 Wed, 28 Jul 2021 07:43:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ah7W=MU=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1m8eDZ-0004L9-Ma
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 07:43:05 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.52]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ffb618e-ef77-11eb-9777-12813bfff9fa;
 Wed, 28 Jul 2021 07:43:03 +0000 (UTC)
Received: from DU2PR04CA0328.eurprd04.prod.outlook.com (2603:10a6:10:2b5::33)
 by DBBPR08MB6012.eurprd08.prod.outlook.com (2603:10a6:10:205::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 07:43:00 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::27) by DU2PR04CA0328.outlook.office365.com
 (2603:10a6:10:2b5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 07:43:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 07:43:00 +0000
Received: ("Tessian outbound 5f693336bfca:v100");
 Wed, 28 Jul 2021 07:43:00 +0000
Received: from f71b53c1c9dd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0B4670B4-DF98-4D08-81E1-AC4D0176EB4A.1; 
 Wed, 28 Jul 2021 07:42:49 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f71b53c1c9dd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 07:42:49 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM6PR08MB4501.eurprd08.prod.outlook.com (2603:10a6:20b:b5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 07:42:47 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::655a:27ea:a020:248d]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::655a:27ea:a020:248d%9]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 07:42:47 +0000
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
X-Inumbo-ID: 6ffb618e-ef77-11eb-9777-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teL6mQevpWT1YoqVqscBADYVdmpjibcYEfn1dYIlU6g=;
 b=tgHEgU6DU4Ly+wvFzmw6FDbZqqlIJ/mnFm0gFgW7I7LdJzqJvAri8BSbSY8OLk+GXhoK7COLLZ0PPx4t0g7V8/SB0GmWE64M235Ur7jyQ1HoiDAlwvZTb9jQ5XStstoK0FOZEiAYKiRGxP0tsI0iMfdzhlsrC/Evc1z/124MMB4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6276463fa4f06bd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyOyUubl0LaeTCsSkrF+3kGOGx9zOfcKIQ0GGHY66mC8m+ghysnRicU6leGzDS0CspTiz9TbP9nXxDJLRy5M15ZN/ainxuMBXgkYbbV6wqz5n25mbRrQ5WcrfoLzCa7XTXumMIu9NMMbKJ1ZEvCWe5qjIobtWUhbnGioaAvxTQNeeIHN2kCqAaBpwDwFD1ll8EsGkwyuu277cB6DDrTOS1sYEHoh3CdIeZkTOzoWGLwgzZk28FuJBTULADYm4rXtnIImFOpH6PgK7w3fG/z7/MqIWYqtmBf3egqUO/Qycz08a+xGxyWk8HqU+7nOA0DisSC8BH2+ZsSKIlzwNlMF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teL6mQevpWT1YoqVqscBADYVdmpjibcYEfn1dYIlU6g=;
 b=T1kjgudYWZXR7C61ZnLK8LPUAL9Yb9TcS8RuQ0n04z8YRIuCNMV2ICveBr2XUq82q+G2shQrai7S/aHoaG+IK4hmCJi/iPSpMR1FtD49jElL5WLgB3tLZ6cNQSfoKoIvvSgOkjrioz9MNjff23tLr+/piNuk9FEHLiUXlmDBg3ffM5F4iXXVn7bPQYXvnPKQ7uiopRo1BPQt1AHh3JarH93cFlynNZ+7BqO+aWQgOAERyeOshbVDl9tjqJwpYSCqzEffCj//sgEsT7HxQYN3UElNz1o6M2N8lGVQCGVNpZ8gDa3++ccqkUZ+CXZEP5VkOrIKjRnRCfxlvbK1CsrPwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teL6mQevpWT1YoqVqscBADYVdmpjibcYEfn1dYIlU6g=;
 b=tgHEgU6DU4Ly+wvFzmw6FDbZqqlIJ/mnFm0gFgW7I7LdJzqJvAri8BSbSY8OLk+GXhoK7COLLZ0PPx4t0g7V8/SB0GmWE64M235Ur7jyQ1HoiDAlwvZTb9jQ5XStstoK0FOZEiAYKiRGxP0tsI0iMfdzhlsrC/Evc1z/124MMB4=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: [RFC PATCH] xen/arm: Replace vreg_emulate_{sysreg/cp}32 with
 vreg_emulate_{sysreg/cp}
Thread-Topic: [RFC PATCH] xen/arm: Replace vreg_emulate_{sysreg/cp}32 with
 vreg_emulate_{sysreg/cp}
Thread-Index: AQHXgsz3bAy5uI+6sUKQYbE7qSsvQ6tYArSA
Date: Wed, 28 Jul 2021 07:42:47 +0000
Message-ID: <C87A9B80-1D7F-489A-BC83-B65F7B3EF091@arm.com>
References: <20210727095010.11103-1-michal.orzel@arm.com>
In-Reply-To: <20210727095010.11103-1-michal.orzel@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7bc1bcdc-930d-48ba-5df0-08d9519b52ea
x-ms-traffictypediagnostic: AM6PR08MB4501:|DBBPR08MB6012:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB6012E333D43ADF8FC6028E73FCEA9@DBBPR08MB6012.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tM51H9VfJeJjbke9w+AxcAw9y+dRv+1Dt5kiy27nDt6zqCM+dsUZo3IK1kFWxzne3z9TWnCbtRWsfgNovZDbbjh5GJmYTYeHa9DoVC586x5FuAmJapGufPo8TMzr9b5XrqMT13qAANmnRsr5xE2uRny9yLd1k6JpTsojQ5mY8Q5uTqyQVdpUUgUvsDhwNIJpmU5dxRE0nmFlPeUpPo5PoVyoonIbX4/rn7mIqrWKZ3est31U58tZXvxyVYofiGbPYSBVnyWOdpiQaRmVTkZSgMzfYt1h8nlEKPkfIwX4mOOR3DRkgv5DcTQyEiIOBzsMKZT5E90juGIlJqAyMDV90Wj9HkqDrA0gcQbDUYlMlMsuV39LEgokC1W7bqgUFR2fha41SRyfN4qcj9LtVMz9ROxha6fbV94uKmDmGMcgqueWAjA3GQiMPRNphpU8+TBvsnMx5mK3kVOjyko8hzORFfbsy9M2L7B2lLp9M+CM2TjAF7H0bqaVdpnqPH4bEwR7bA/KjriPo1TFVitkkEfkOSF5Ru2MG84F1ihz+s64rFTCtX9qY6N9g/cfWJ2d/jBzLf82xuI9zAHrzGFaeWSzUP6PZx30tKcCv5tOJmdqkDmic79mcJy6145DGo4fhjBsbzpJb6JpEqUzR+67QwwoOTpuHq9k3elldr+nqgvQXTSTjt6vq3Sm54u2ymfAw0HICscAZUI68knvRa9rBXJC7b+IqY50dVW66yndIW6onVCh/R8baOgMsZUDHsj8D8kM
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39860400002)(136003)(396003)(38100700002)(4326008)(71200400001)(91956017)(5660300002)(36756003)(66446008)(6636002)(54906003)(37006003)(66556008)(316002)(6506007)(53546011)(76116006)(66476007)(6512007)(33656002)(26005)(66946007)(186003)(8936002)(8676002)(83380400001)(122000001)(86362001)(2906002)(64756008)(6862004)(2616005)(6486002)(38070700005)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?iHIHuyL/pDvcciSxxod25iOec7LTK2niEpyhHSWq2Cm0Ns5yNQ1NIG/4fS67?=
 =?us-ascii?Q?tNG50y0LsIQnL1RTkQM/NKY7AEYYmMIDneJfxEU7qa465EynaYY5ZEsabIlN?=
 =?us-ascii?Q?ZfFYIJPu9EHXawp+AI3rwQHYb5OW3m0ZPBX5pIJfasK+K1b8RRKoAFHyP6fE?=
 =?us-ascii?Q?FeJey/6CK00FhjpnG4bjc/Ahb6rar6jgH+IRR+Kxy/lwhjbPcAi36xjORopQ?=
 =?us-ascii?Q?Kxiv2mzaaiGVQyOca2jH2+c8Mp5/kraD1JnMO6vFs03tsaVYzAfFESqoTKwd?=
 =?us-ascii?Q?Uzl1bZNUCeU6P8CAs0hEy7kHPhsxdYQA775tyrtxJmw8ZbyAs5CY3CA9dkm+?=
 =?us-ascii?Q?A6nqU73fEvuwXUSTFJUQ84ImfInuP0wEdKhZPA6viDkSV1rj4ZdI1vwqSjXp?=
 =?us-ascii?Q?W1i172PScxb5L2g9ZZA2pBeEfhsnJhP/LAl2F1/yLsxJ6BpGDFYTypdWsXya?=
 =?us-ascii?Q?Es6lf7OL3qpX2TcsKJhtlV5rKd39xuXzkoG+1FVf8TzQA6BPwqC49wdS5fGI?=
 =?us-ascii?Q?djA+kaT+tr4eMX/7ChtwJv5GQH+ayx8Y13yAqjsVOLJBdHSVTD0Rj+4bjqhz?=
 =?us-ascii?Q?nkXMLi971rlup7iC+oixsBzfLh8VYTGdJdRJ2ZOhUpHUXtdJZxxb/+OQIo1R?=
 =?us-ascii?Q?ZBzBeoTlskM+wiX1gOW52+VCU737klQ8PdqMcmBZeSaZKDM1Eec4j1ia+X8f?=
 =?us-ascii?Q?TQo20MQppszm4lM50qZoeo4hz3zOn+U5rIebC7J7X0sxIOJDFVToYrG7SJJT?=
 =?us-ascii?Q?W8KntUBq7z0S/zQfLrzMvPGYWmn7AmIn9OgE+YBG3Cg9dxk8LxHDXVB5/Q52?=
 =?us-ascii?Q?dk0VqixLqFRGJa1ll75bUG4sqP/5ceFyMiatCOsUGfkAR/ECi5j/fJm2mKP/?=
 =?us-ascii?Q?MZb5p3/Mq2ydKnfJ2SVD1PRqOcafREHuo5v1ShbRu5/xcfU7eFltEMqz7S6z?=
 =?us-ascii?Q?XFLxj3AfLbgbGcrd5xzy1TR1iW/1ZQUxPH5ObRyEVjnoSJj9Abgg/s/Vrg05?=
 =?us-ascii?Q?aXxwF350QY+10k1SD9SqcL0fTD9+G7ww0KLRuL6jJClfqekRMWgR0bRxDR2w?=
 =?us-ascii?Q?Ug4Z5QjXkbAmZbOs3o5cLCjWCj8JoFTbh6pqcI7c8f348njrJXxkfLIUJjkH?=
 =?us-ascii?Q?ZGIqD2qNymI82pnsCmQ2VxFqYxcbhQdLl43QLwwe7sFrzDaPIaDXyiJXs5+L?=
 =?us-ascii?Q?1QNhPsCvYEvOONOH0b8IHxxqB33BXqpKU5iEmGm3c8cD0L0u/AEU2K9gamk3?=
 =?us-ascii?Q?x3I9CG/7j1yclJZXRRPG5GeegJyBmQxJ5e4F7OGSlCAEGJABybokHEr/5pmZ?=
 =?us-ascii?Q?4xDu2t/AtTIb1eNpPM8PGSRZ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C757D47457221749BFF46DEF0B189E1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4501
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	540af450-0ea7-446d-cf46-08d9519b4b75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oHC7GHiLvpZOZY+U5M4AVSPjSYUZAf0A8iAXMmYqREGqb446ivV2+cpKNX0lPT65jl7RYQjTfFrIoat8KCLRgxgXHMElIPG4iIOZIoe+fXVG5vvjfwscqQaozKIn8OxsjqaVvTvmvQOHjoVuLFZAUhjdU+x1KCJPv1vLzPsh0hWP/wiFSZsYvA/sEAGyUj3CTrLUfah+bz7168iTlz+p0IqcFtUqr/wnAYF9WWDuF0KysLzD3e8jX43EkjptkzF1+dSGOPBhoe0cbVVCRrCY1egGQYuOHftik4GbWF3U1GAbN48wn86tjBtVqooRkS2Fkc54gefROTT2sbxxSZo4b3rJiOPa/f5w1Ji1pJImJ0HEKdj+LF/7hugqLnUIeRgKpPHMhRFU23tUeMHKQnXLc4b0vtcNn+uzeD/yorCE74gXWeOBx4hIh0mMwwM7vcC2XUxPp98P82QIHBFwT/ywe4edO+cVq9MfpV/eWtudaPkfK6pdxf14UNm7m07Ys6EoLdrt6KPzS+9YrzrTK4pz7nu2LDpZF+hyoNhvaVd8Efyru71tQf31d8OPGYgn+hlQUA9dCCt5MTHMGboAiZC/qjFpJqUWgxLwAwlbjcbZrLMHMstcdSYwTTWeUH42qqV1qgJuI177kDoOGNNiFYkU9vGR7T6wFqphGu9CCUcVdxCH9+5WHpTtjEqHpQ19AQIKOJIToSpeqsvGa74jKotJfQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(36840700001)(6486002)(4326008)(6862004)(8936002)(6636002)(2616005)(316002)(36756003)(82310400003)(70206006)(478600001)(8676002)(37006003)(70586007)(54906003)(6512007)(6506007)(53546011)(2906002)(81166007)(82740400003)(47076005)(86362001)(33656002)(26005)(186003)(5660300002)(356005)(83380400001)(336012)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 07:43:00.2417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc1bcdc-930d-48ba-5df0-08d9519b52ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6012

Hi Michal,

> On 27 Jul 2021, at 10:50 am, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> According to ARMv8A architecture, AArch64 registers
> are 64bit wide even though in many cases the upper
> 32bit is reserved. Therefore there is no need for
> function vreg_emulate_sysreg32 on arm64.
>=20
> Ideally on arm64 there should be only one function
> vreg_emulate_sysreg(using register_t) or
> vreg_emulate_sysreg64(using uint64_t) but in the Xen code
> there is a lot of functions passed both to the
> vreg_emulate_cp* and vreg_emulate_sysreg*.
> This would require to duplicate them which is not
> a good solution.
>=20
> The easiest/minimal solution to fix this issue is
> to replace vreg_emulate_{sysreg/cp}32 with
> vreg_emulate_{sysreg/cp}. The modifed functions
> are now taking function pointer:
> -typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs,
>                              register_t *r, bool read);
> instead of:
> -typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs,
>                                uint32_t *r, bool read);
>=20
> This change allows to properly use 64bit registers on arm64
> and in case of 32bit guest the cast is done by the hardware
> due to the 32bit registers being the lower part of 64bit ones.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul
> ---
> The reason for this change is to clean up the mess related to types.
> This patch achieves that but it does not reduce the code size.
> I'm not sure whether we want such change hence it is pushed as RFC.
> ---
> xen/arch/arm/vcpreg.c      | 16 +++++++++++-----
> xen/arch/arm/vtimer.c      | 18 +++++++++---------
> xen/include/asm-arm/vreg.h | 14 +++++++-------
> 3 files changed, 27 insertions(+), 21 deletions(-)
>=20
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index e3ce56d875..376a1ceee2 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -57,9 +57,12 @@
> #define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysreg=
)
> #endif
>=20
> +#define type32_t register_t
> +#define type64_t uint64_t
> +
> /* The name is passed from the upper macro to workaround macro expansion.=
 */
> #define TVM_REG(sz, func, reg...)                                        =
   \
> -static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read)=
    \
> +static bool func(struct cpu_user_regs *regs, type##sz##_t *r, bool read)=
    \
> {                                                                        =
   \
>     struct vcpu *v =3D current;                                          =
     \
>     bool cache_enabled =3D vcpu_has_cache_enabled(v);                    =
     \
> @@ -83,7 +86,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##=
_t *r, bool read)    \
>=20
> #else /* CONFIG_ARM_64 */
> #define TVM_REG32_COMBINED(lowreg, hireg, xreg)                          =
   \
> -static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, uint32_t *r,=
    \
> +static bool vreg_emulate_##xreg(struct cpu_user_regs *regs, register_t *=
r,  \
>                                 bool read, bool hi)                      =
   \
> {                                                                        =
   \
>     struct vcpu *v =3D current;                                          =
     \
> @@ -108,13 +111,13 @@ static bool vreg_emulate_##xreg(struct cpu_user_reg=
s *regs, uint32_t *r,    \
>     return true;                                                         =
   \
> }                                                                        =
   \
>                                                                          =
   \
> -static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, uint32_t *=
r,  \
> +static bool vreg_emulate_##lowreg(struct cpu_user_regs *regs, register_t=
 *r,\
>                                   bool read)                             =
   \
> {                                                                        =
   \
>     return vreg_emulate_##xreg(regs, r, read, false);                    =
   \
> }                                                                        =
   \
>                                                                          =
   \
> -static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, uint32_t *r=
,   \
> +static bool vreg_emulate_##hireg(struct cpu_user_regs *regs, register_t =
*r, \
>                                  bool read)                              =
   \
> {                                                                        =
   \
>     return vreg_emulate_##xreg(regs, r, read, true);                     =
   \
> @@ -154,13 +157,16 @@ TVM_REG32_COMBINED(MAIR0, MAIR1, MAIR_EL1)
> TVM_REG32_COMBINED(AMAIR0, AMAIR1, AMAIR_EL1)
> TVM_REG32(CONTEXTIDR, CONTEXTIDR_EL1)
>=20
> +#define VREG_EMULATE_CP32(regs, hsr, fn)  vreg_emulate_cp(regs, hsr, fn)
> +#define VREG_EMULATE_CP64(regs, hsr, fn)  vreg_emulate_cp64(regs, hsr, f=
n)
> +
> /* Macro to generate easily case for co-processor emulation. */
> #define GENERATE_CASE(reg, sz)                                      \
>     case HSR_CPREG##sz(reg):                                        \
>     {                                                               \
>         bool res;                                                   \
>                                                                     \
> -        res =3D vreg_emulate_cp##sz(regs, hsr, vreg_emulate_##reg);   \
> +        res =3D VREG_EMULATE_CP##sz(regs, hsr, vreg_emulate_##reg);   \
>         ASSERT(res);                                                \
>         break;                                                      \
>     }
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 167fc6127a..17b5649a05 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -162,7 +162,7 @@ void virt_timer_restore(struct vcpu *v)
>     WRITE_SYSREG(v->arch.virt_timer.ctl, CNTV_CTL_EL0);
> }
>=20
> -static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, uint32_t *r, boo=
l read)
> +static bool vtimer_cntp_ctl(struct cpu_user_regs *regs, register_t *r, b=
ool read)
> {
>     struct vcpu *v =3D current;
>     s_time_t expires;
> @@ -176,7 +176,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs *reg=
s, uint32_t *r, bool read)
>     }
>     else
>     {
> -        uint32_t ctl =3D *r & ~CNTx_CTL_PENDING;
> +        register_t ctl =3D *r & ~CNTx_CTL_PENDING;
>         if ( ctl & CNTx_CTL_ENABLE )
>             ctl |=3D v->arch.phys_timer.ctl & CNTx_CTL_PENDING;
>         v->arch.phys_timer.ctl =3D ctl;
> @@ -197,7 +197,7 @@ static bool vtimer_cntp_ctl(struct cpu_user_regs *reg=
s, uint32_t *r, bool read)
>     return true;
> }
>=20
> -static bool vtimer_cntp_tval(struct cpu_user_regs *regs, uint32_t *r,
> +static bool vtimer_cntp_tval(struct cpu_user_regs *regs, register_t *r,
>                              bool read)
> {
>     struct vcpu *v =3D current;
> @@ -211,11 +211,11 @@ static bool vtimer_cntp_tval(struct cpu_user_regs *=
regs, uint32_t *r,
>=20
>     if ( read )
>     {
> -        *r =3D (uint32_t)((v->arch.phys_timer.cval - cntpct) & 0xfffffff=
full);
> +        *r =3D (register_t)((v->arch.phys_timer.cval - cntpct) & 0xfffff=
fffull);
>     }
>     else
>     {
> -        v->arch.phys_timer.cval =3D cntpct + (uint64_t)(int32_t)*r;
> +        v->arch.phys_timer.cval =3D cntpct + (uint64_t)(register_t)*r;
>         if ( v->arch.phys_timer.ctl & CNTx_CTL_ENABLE )
>         {
>             v->arch.phys_timer.ctl &=3D ~CNTx_CTL_PENDING;
> @@ -274,10 +274,10 @@ static bool vtimer_emulate_cp32(struct cpu_user_reg=
s *regs, union hsr hsr)
>     switch ( hsr.bits & HSR_CP32_REGS_MASK )
>     {
>     case HSR_CPREG32(CNTP_CTL):
> -        return vreg_emulate_cp32(regs, hsr, vtimer_cntp_ctl);
> +        return vreg_emulate_cp(regs, hsr, vtimer_cntp_ctl);
>=20
>     case HSR_CPREG32(CNTP_TVAL):
> -        return vreg_emulate_cp32(regs, hsr, vtimer_cntp_tval);
> +        return vreg_emulate_cp(regs, hsr, vtimer_cntp_tval);
>=20
>     default:
>         return false;
> @@ -316,9 +316,9 @@ static bool vtimer_emulate_sysreg(struct cpu_user_reg=
s *regs, union hsr hsr)
>     switch ( hsr.bits & HSR_SYSREG_REGS_MASK )
>     {
>     case HSR_SYSREG_CNTP_CTL_EL0:
> -        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_ctl);
> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_ctl);
>     case HSR_SYSREG_CNTP_TVAL_EL0:
> -        return vreg_emulate_sysreg32(regs, hsr, vtimer_cntp_tval);
> +        return vreg_emulate_sysreg(regs, hsr, vtimer_cntp_tval);
>     case HSR_SYSREG_CNTP_CVAL_EL0:
>         return vreg_emulate_sysreg64(regs, hsr, vtimer_cntp_cval);
>=20
> diff --git a/xen/include/asm-arm/vreg.h b/xen/include/asm-arm/vreg.h
> index 1253753833..cef55aabea 100644
> --- a/xen/include/asm-arm/vreg.h
> +++ b/xen/include/asm-arm/vreg.h
> @@ -4,13 +4,13 @@
> #ifndef __ASM_ARM_VREG__
> #define __ASM_ARM_VREG__
>=20
> -typedef bool (*vreg_reg32_fn_t)(struct cpu_user_regs *regs, uint32_t *r,
> +typedef bool (*vreg_reg_fn_t)(struct cpu_user_regs *regs, register_t *r,
>                                    bool read);
> typedef bool (*vreg_reg64_fn_t)(struct cpu_user_regs *regs, uint64_t *r,
>                                    bool read);
>=20
> -static inline bool vreg_emulate_cp32(struct cpu_user_regs *regs, union h=
sr hsr,
> -                                     vreg_reg32_fn_t fn)
> +static inline bool vreg_emulate_cp(struct cpu_user_regs *regs, union hsr=
 hsr,
> +                                     vreg_reg_fn_t fn)
> {
>     struct hsr_cp32 cp32 =3D hsr.cp32;
>     /*
> @@ -18,7 +18,7 @@ static inline bool vreg_emulate_cp32(struct cpu_user_re=
gs *regs, union hsr hsr,
>      * implementation error in the emulation (such as not correctly
>      * setting r).
>      */
> -    uint32_t r =3D 0;
> +    register_t r =3D 0;
>     bool ret;
>=20
>     if ( !cp32.read )
> @@ -64,11 +64,11 @@ static inline bool vreg_emulate_cp64(struct cpu_user_=
regs *regs, union hsr hsr,
> }
>=20
> #ifdef CONFIG_ARM_64
> -static inline bool vreg_emulate_sysreg32(struct cpu_user_regs *regs, uni=
on hsr hsr,
> -                                         vreg_reg32_fn_t fn)
> +static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, union=
 hsr hsr,
> +                                         vreg_reg_fn_t fn)
> {
>     struct hsr_sysreg sysreg =3D hsr.sysreg;
> -    uint32_t r =3D 0;
> +    register_t r =3D 0;
>     bool ret;
>=20
>     if ( !sysreg.read )
> --=20
> 2.29.0
>=20
>=20


