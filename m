Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B630C4E6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 17:08:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80623.147568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yDZ-0006eq-IX; Tue, 02 Feb 2021 16:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80623.147568; Tue, 02 Feb 2021 16:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6yDZ-0006eS-FA; Tue, 02 Feb 2021 16:07:53 +0000
Received: by outflank-mailman (input) for mailman id 80623;
 Tue, 02 Feb 2021 16:07:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g09W=HE=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l6yDX-0006dn-TG
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 16:07:51 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 712f1330-0ad1-430e-a5de-7c06e6687c7f;
 Tue, 02 Feb 2021 16:07:50 +0000 (UTC)
Received: from DB6PR07CA0014.eurprd07.prod.outlook.com (2603:10a6:6:2d::24) by
 VI1PR0801MB1856.eurprd08.prod.outlook.com (2603:10a6:800:57::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Tue, 2 Feb
 2021 16:07:28 +0000
Received: from DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::8f) by DB6PR07CA0014.outlook.office365.com
 (2603:10a6:6:2d::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend
 Transport; Tue, 2 Feb 2021 16:07:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT023.mail.protection.outlook.com (10.152.20.68) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 2 Feb 2021 16:07:27 +0000
Received: ("Tessian outbound 2b57fdd78668:v71");
 Tue, 02 Feb 2021 16:07:27 +0000
Received: from d6c15b7036ca.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDD9D202-4167-4623-94B8-1EF00DCDA1B8.1; 
 Tue, 02 Feb 2021 16:07:10 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d6c15b7036ca.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Feb 2021 16:07:10 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB7PR08MB3881.eurprd08.prod.outlook.com (2603:10a6:10:77::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Tue, 2 Feb
 2021 16:07:08 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 16:07:08 +0000
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
X-Inumbo-ID: 712f1330-0ad1-430e-a5de-7c06e6687c7f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EztLR4nuMtzO5tLprYC7gPR+MPCHYmw5ocLwT05Q2N0=;
 b=163jTqINCBgbw7yg73JJMqKadFyoKRDB7WllaLyfow20pieqkPl9AqbnopSAPo4+n17fZc+fOw9i0EsQF8RqDNHwm6bs7m5bTSLzWVXAZH98HoSyNtuJP2hnUZA88JgvYpyz3xa1PAcK6r69NmPOWXIdanFODegcozlNbu6+k3I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4455107c76d9732c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpvafVGqkJpJSh6afI15GpR8s3kRyN6EGxe4rc8v5APehPeZpHlno1WCj8bWUzF7njIUl209uCdLlV7FwD2fm+9w2QgKODaTn1/rdpnHZ/9TmZRuWdaE0l/5hGYQ4sDAM0ErqIIwT27qns/9giZTmpJHh41ka53mj/ftDAJ+z2meDF7bXcQ7HPAvPSZVD127e65JyRruGc8HWd8B4Gd2bm1I/nzpptAu8/JjzWPJ2D+kmzmAnuBGd4jX5jfBAKJOuGhD1ioVztPvw3JHZsnTxVLMIl20VgA+AZ+6YLzWyDEVkBiex9H4vsPuJeGmLbUuGZ68Pl4gAlyKvdjtxRlzkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EztLR4nuMtzO5tLprYC7gPR+MPCHYmw5ocLwT05Q2N0=;
 b=nVihpXCYkk7NDXLdwRvSlAu0urF0QMiVk0JokrXdy/h668Se7U8P5BfgPmNbuJ5VjbZuWfOn903A7gWDg6g7BZwmd2pmCTiqsYumwdwNmA/BkxbR6sRVppFe1EIJcSuaWJnQ9cGR1qOgU8FOGZfRy+RHywkr0D/h1gWqq1mdeGu/Dy9WtNFG142694aWf9OFniwjyaqPkj0bkceU1HDO2pTpPVKpxYEkl3rIWxc4roRprT3cfjl5zYlHLzqyz/bn786XNnZIBrvWdOAAmZFGP4vNlN7yVAWF9oslFXgRK2ouE39myL+iGgFUER1EAB5Peq/iceiiyBnvPBCnyeHVDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EztLR4nuMtzO5tLprYC7gPR+MPCHYmw5ocLwT05Q2N0=;
 b=163jTqINCBgbw7yg73JJMqKadFyoKRDB7WllaLyfow20pieqkPl9AqbnopSAPo4+n17fZc+fOw9i0EsQF8RqDNHwm6bs7m5bTSLzWVXAZH98HoSyNtuJP2hnUZA88JgvYpyz3xa1PAcK6r69NmPOWXIdanFODegcozlNbu6+k3I=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "brian.woods@xilinx.com"
	<brian.woods@xilinx.com>
Subject: Re: [PATCH v3 0/3] Generic SMMU Bindings
Thread-Topic: [PATCH v3 0/3] Generic SMMU Bindings
Thread-Index: AQHW9DbnaDtcsjSAAUiKSXHzYBU+iapFEnqA
Date: Tue, 2 Feb 2021 16:07:08 +0000
Message-ID: <C094E054-885F-4363-ABF3-E0FB4DDD7A2A@arm.com>
References: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101261435550.2568@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 68d91f85-cb66-414c-ceda-08d8c794a2bb
x-ms-traffictypediagnostic: DB7PR08MB3881:|VI1PR0801MB1856:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1856F20691B2535090A0326DFCB59@VI1PR0801MB1856.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OtLftEk/TxVoM0wTJO5kiX1pRv+t+DSGrpNGiFqZS5336aMvfsYPj6O1/vLUYRDzzwmkjLAVZ+xpc/VBYjBlsuhZbv9q1LL2Kdu0U0dkACl4bRpm1o22BEuyLLYnYhTtfZlffevIq6OjX7puH766pAWtsTFRhFEYEsh35GJyR8wLiwxDCzGC9SS7eTseVMZUm1320TcaBHa4cwpELCnW9/oM4rtBEQHyaghFqNd9KCGLogopwpG/Fxx0I28InZF8fUfabuYj2sn4AT3v4j+5KR5/GTkbv7EdLlpbTqsaq8tGPMR6AlMS1DpM+iqp7ohcouA5dJFbZ8APTlWkD3M5JuYZ2muv5RxaWIuTg1JnfuomU1YqD3eutEna8NZL5oe6gOTO+4wgelahUwTelhVt8EPi1lehPKZ/+8c6jWe+OfvhcX7M+RiBX+BPXCwEYSL8t0pHRZVhHnsBhg1d3VFdQc9W/MKfx7kvc2pn34mBsdnfCyPijMnvuFoSYb4e+a9eMPQCsjJmRNHF7QwaJYhhF8HogiMgKXNofyCS4rwZViuTGwQ5QS4uqQAAT08wfwnzjwNjcBVsiuQ/+3sfLQbWsIkqpV9l/eUdlzQxQJ4hqrv/1m5ySenxOiy9mCJuPLcp9zyVV/n1bXY5o5xpeG1yn0iCUt+8dTh60xOVXjorxXZMe+oz1BT11Y0/lRbUm8X3AL3Heo84s0Bp6cMz1Z2dsg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(6486002)(54906003)(6512007)(86362001)(316002)(83380400001)(8936002)(2616005)(4326008)(66446008)(8676002)(36756003)(478600001)(64756008)(76116006)(66556008)(66476007)(66946007)(33656002)(91956017)(186003)(53546011)(5660300002)(6506007)(71200400001)(966005)(26005)(2906002)(6916009)(41533002)(45980500001)(6606295002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?s4PC+h5giPVtQOmkNZ3YlKgicMECEk4l05m0oqXMFi7SwWle1ruRBmykRR96?=
 =?us-ascii?Q?qq2ZGHu+8GlxdncIFK7BL+VbiOW2ickOrt/J26Uv9Zy7rJEpekdyaYtGt9Zc?=
 =?us-ascii?Q?12e74c5my7WXa1ciSLUqm5quNznnpcRybbpEhEml7pSuC2NQ/D4c0KDFcVng?=
 =?us-ascii?Q?KCahK/b/DDmrhjjD+fCMz0CsbPn+eG1z3RUzpYhNQppzSYrQHWwshVChCzk7?=
 =?us-ascii?Q?kZcQk67EBUg4h9pi/jbNKD5QYJ7gtK06HxtKlPD3GbdoP/a0sr6wCq/MStar?=
 =?us-ascii?Q?QVVHcdp7POwWWWNZEBT4j9fynHkbIcj6EWW1kF2IEHeHMkXshgDKzUC4MNNO?=
 =?us-ascii?Q?Ud2NiywNPoOL0zIYqY4quWg1NWZg3/85W6P89pX5paxPRdf8qC95UJViKVV0?=
 =?us-ascii?Q?q28lp+kbEtB8ue6uw0RxB90t4dB67u8dq3TDwE55cdhCPH+WwkZLF3kdNqHG?=
 =?us-ascii?Q?Aivxq6Y8jU3Z9lbikyZYING6s1QapcOkjmXPIZ9ioxiZzE8ze70axVBCD42A?=
 =?us-ascii?Q?odZTrjcY0zPSMOWmjoFueRr+lDiuKwWakUTnACBb0h7UmPbgeJna35XNoeeC?=
 =?us-ascii?Q?E/VTMmnuCr+lNQHr6jNmXtRpnlj+Ee3LhedOEoA1pHvYdyzL6igZ1M4L/m5X?=
 =?us-ascii?Q?fgC+bGAoTC45ChpsoCLjSkmGEopxvi0LZUZwP59LT8da549wRkbfsMwJxZ/C?=
 =?us-ascii?Q?9BxHtipZWrfgi0gorxd77WXGJQR4VTe0G3aqIki0PpFp8KLn+2e9R71Z25T8?=
 =?us-ascii?Q?eMqyvemrUVpnCK3nSnf7sA+Pz+wqrq1duXB9OSZMGP3bjp/3mJYMBrUOTxmB?=
 =?us-ascii?Q?BRfoz6FjON76tLcSLKcoyXn3QQoQDeLcIX/Vll7IRNR1XB7vaZIQsDvpDNFx?=
 =?us-ascii?Q?ct1T/+KyKLep6CVnZht3dhFsxwWifVlInGeB7GD/aN0ZAl1GeMjabBjklVEa?=
 =?us-ascii?Q?GQxTEJYxF+3NSKtnuBzkxtxX/+6jjU/Szjm/GVWSWH34DBnaY76LDsbbaHi/?=
 =?us-ascii?Q?higvo8lRgxXf5OiGsULOCc0idwJp+08a6BCgeMlV9L/1zrnfoWfsV80gEyPV?=
 =?us-ascii?Q?Qwl5P+DV?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <832E06F993C0A344BE7B3AA325D89B2C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3881
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a9e2212-3c77-4b15-837b-08d8c794975e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WJHVKmPBox8NCwR5lUxDws2E6y2pi3a3BjIfsVS8Vi6zfSHqzRt31j8DqcpG1tjdvFUaq/+F0uR00bSecgOf0N1xrJy1xF8OHNshzBDj8deDNRI4SE7EyegbM66DWERyhKDqYWz0vq/l/geZ+ztu42dhCuImGge4VgKTFZ48N2MtODVPF4zd1gnTIm+KWFptfoGxY/9d1BN5B/4+IdeMWRGXDgk3DgiJYqY75Z2Zp/Bc8GSlEnn1yLsiYP7ALvnDh4za9s2QEl8/xshZeVecBI303KXSsfvvym6aA7RLCGcfqjOdfg1N0QP6dZ2zE78N62sbdr0mhalGDGL5lJUpP5rmTIc0esnvV+Rr6mI29fOblYbuv2bLxsc2cVkr/fo8m7cIx+yRQov77v2OdwfliVyZbDjrJx0AoAv8FufdCfV4ku51TbmVIAhec6HHE7Vtw1e8dLMCuMlv8vum4I+Fn2KQarbkLRNKbxtARfozvdO9jKxtZ8Cfa739O9hl6+24zOdv8SKH0W58ycdMiiEMYKz3lg/SpaW02Dpp+PV07GRGK+AsdZILaBTEYBuOxBI8HFAFkZVBeGsesQ3MV+39lSClrwonh9dUzDhwB6auCvw22t/HihyE7yCh0ZV69003kgWx7/xkDYp4LAKfEIoruA9XR2x4rjgQOuGN91ZsSvp9v7b1t4PQgjJSmMC2BAPyKG6Xw7nsREfXR3te3IpPu0pAioiAahAApSRdrYmKZBrOf7V26SYRk9NKNOin5DbpBDFvxhtrtAbB/8/MZHtlJL4hAjodXUI+TrMtYWDRs48=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39860400002)(376002)(36840700001)(46966006)(4326008)(107886003)(5660300002)(336012)(54906003)(316002)(356005)(36860700001)(966005)(82310400003)(478600001)(53546011)(86362001)(8676002)(2616005)(33656002)(26005)(36756003)(6486002)(70586007)(82740400003)(70206006)(6862004)(83380400001)(2906002)(186003)(6506007)(81166007)(47076005)(6512007)(8936002)(41533002)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 16:07:27.2139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d91f85-cb66-414c-ceda-08d8c794a2bb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1856

Hello Stefano,

> On 26 Jan 2021, at 10:58 pm, Stefano Stabellini <sstabellini@kernel.org> =
wrote:
>=20
> Hi all,
>=20
> This series introduces support for the generic SMMU bindings to
> xen/drivers/passthrough/arm/smmu.c.
>=20
> The last version of the series was
> https://marc.info/?l=3Dxen-devel&m=3D159539053406643
>=20
> I realize that it is late for 4.15 -- I think it is OK if this series
> goes in afterwards.

I tested the series on the Juno board it is woking fine. =20
I found one issue in SMMU driver while testing this series that is not rela=
ted to this series but already existing issue in SMMU driver.

If there are more than one device behind SMMU and they share the same Strea=
m-Id, SMMU driver is creating the new SMR entry without checking the alread=
y configured SMR entry if SMR entry correspond to stream-id is already conf=
igured.  Because of this I observed the stream match conflicts on Juno boar=
d.

(XEN) smmu: /iommu@7fb30000: Unexpected global fault, this could be serious
(XEN) smmu: /iommu@7fb30000: 	GFSR 0x00000004, GFSYNR0 0x00000006, GFSYNR1 =
0x00000000, GFSYNR2 0x00000000


Below two patches is required to be ported to Xen to fix the issue from Lin=
ux driver.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/dri=
vers/iommu/arm-smmu.c?h=3Dlinux-5.8.y&id=3D1f3d5ca43019bff1105838712d55be08=
7d93c0da
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/dri=
vers/iommu/arm-smmu.c?h=3Dlinux-5.8.y&id=3D21174240e4f4439bb8ed6c116cdbdc03=
eba2126e

Regards,
Rahul=20
>=20
> Cheers,
>=20
> Stefano
>=20
>=20
> Brian Woods (3):
>      arm,smmu: switch to using iommu_fwspec functions
>      arm,smmu: restructure code in preparation to new bindings support
>      arm,smmu: add support for generic DT bindings. Implement add_device =
and dt_xlate.
>=20
> xen/drivers/passthrough/arm/smmu.c    | 162 ++++++++++++++++++++++++-----=
-----
> xen/drivers/passthrough/device_tree.c |  24 ++---
> 2 files changed, 123 insertions(+), 63 deletions(-)


