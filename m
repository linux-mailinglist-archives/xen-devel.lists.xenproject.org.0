Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426DA3F2B6D
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 13:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169456.309554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2tj-0004qp-PT; Fri, 20 Aug 2021 11:41:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169456.309554; Fri, 20 Aug 2021 11:41:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH2tj-0004nM-Lv; Fri, 20 Aug 2021 11:41:19 +0000
Received: by outflank-mailman (input) for mailman id 169456;
 Fri, 20 Aug 2021 11:41:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+ZW=NL=arm.com=Rahul.Singh@srs-us1.protection.inumbo.net>)
 id 1mH2ti-0004nG-Ng
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 11:41:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8c37772a-f12c-4c28-a9f3-4cd59068335d;
 Fri, 20 Aug 2021 11:41:16 +0000 (UTC)
Received: from AM5PR1001CA0013.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::26)
 by HE1PR0802MB2523.eurprd08.prod.outlook.com (2603:10a6:3:e1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 11:41:14 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::50) by AM5PR1001CA0013.outlook.office365.com
 (2603:10a6:206:2::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend
 Transport; Fri, 20 Aug 2021 11:41:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 11:41:13 +0000
Received: ("Tessian outbound f11f34576ce3:v103");
 Fri, 20 Aug 2021 11:41:12 +0000
Received: from caf75a431579.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FDCAFD7-1D39-44A3-8398-B663F459307F.1; 
 Fri, 20 Aug 2021 11:41:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id caf75a431579.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 20 Aug 2021 11:41:06 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AM7PR08MB5318.eurprd08.prod.outlook.com (2603:10a6:20b:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Fri, 20 Aug
 2021 11:41:04 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::6c11:19f8:1422:5dea%3]) with mapi id 15.20.4436.019; Fri, 20 Aug 2021
 11:41:04 +0000
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
X-Inumbo-ID: 8c37772a-f12c-4c28-a9f3-4cd59068335d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5rK+EobFOx6GLMcK0fCWxmzm62sBElQ0GJY/pOHMjM=;
 b=qMQGubwut+jdNdp2gyGYxufhfsZQR0QXAfPLNteVX8y0czMsW/s3AQkInZ9RkEWIq1ry3BB/CfAGAbU5G7HVa1Mpn1yvhicluCCNOsHbdE/4cIf5WS38XVAu1imxkh2P3sKJed3Islqi7k0Hi4tBbqLyqoX6CDrEz9zKetAMjvM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 112b2bb6f4914b38
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFjYqyebfwmRbxBTeQI1fHE3JcGRrkJsGDLUPbOU7XKVe2BWoqH4/qeOkV7gJpDnM//PZC6bbph2xcq+wpBaOaskQn0hSASKM0jW2msyVRoSAQEI9YfDZ+eDR9D73a/8xEiCCARbuwXTY9EF5v5Yyk6oy0f8usbgZmDv/SskqLoeg0Tmo1axINJn7emGp7xSCm79ii0OimJX8+XfSjHNX7qLeAOYaF8DDk8gUgsmTORQRo1UYdlILgf3l5RjmVf3hDhNzgQLLxyrxYwA7oo6fJFkYaaeWX2jkJ1Om7e27cGzb6qhKi7ujutxVWz2z1mI9D2d3asJ7l/3dU3Lv1li4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5rK+EobFOx6GLMcK0fCWxmzm62sBElQ0GJY/pOHMjM=;
 b=azo4sDe9OvNf6QAksihw0EodnnzZfyUYMk/c6yp24JGoGg0rqrZwZPlu87zgia4bjlVuXg1rGjSwLfQVaICOCrmYAVVYie0GOtQkCVfswB8nfnhdnjpgdG6VSz9IO8L7kMfeSHh+oZMx1eTbADjtkQ4mkcrm5gxGapD6gav5hXpkTONvoAntSw1v4YN0iOR0r2HXIsj+w69/8Rh1wZVFXOaTxYsAKU0eYv7FlVJnbpbkVTHXx+Q3c1lc8Nba085sG+08jYG81cQgebUCG4t9jw01JrPg4tms1iErw72FRflqq7IiX+IVG1NaCxqbtxpeAKAD2TAePinCpmpqRYao9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5rK+EobFOx6GLMcK0fCWxmzm62sBElQ0GJY/pOHMjM=;
 b=qMQGubwut+jdNdp2gyGYxufhfsZQR0QXAfPLNteVX8y0czMsW/s3AQkInZ9RkEWIq1ry3BB/CfAGAbU5G7HVa1Mpn1yvhicluCCNOsHbdE/4cIf5WS38XVAu1imxkh2P3sKJed3Islqi7k0Hi4tBbqLyqoX6CDrEz9zKetAMjvM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Paul Durrant <paul@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1 03/14] xen/pci: solve compilation error on ARM with
 ACPI && HAS_PCI
Thread-Topic: [PATCH v1 03/14] xen/pci: solve compilation error on ARM with
 ACPI && HAS_PCI
Thread-Index: AQHXlPKNppsGoVMjlkS0HQqYv0RYK6t7+ecAgABMtoA=
Date: Fri, 20 Aug 2021 11:41:04 +0000
Message-ID: <76520AA8-D02C-4207-A722-33D935E76776@arm.com>
References: <cover.1629366665.git.rahul.singh@arm.com>
 <97d39d3ee398d6018bdcaf745f00d039df6a92ef.1629366665.git.rahul.singh@arm.com>
 <5fad114f-06c4-120e-0a48-da7045fb85c5@suse.com>
In-Reply-To: <5fad114f-06c4-120e-0a48-da7045fb85c5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb62fe8-fee5-4ad2-2dd7-08d963cf6a09
x-ms-traffictypediagnostic: AM7PR08MB5318:|HE1PR0802MB2523:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR0802MB2523922CB81928C05EFB4F19FCC19@HE1PR0802MB2523.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YTy8BwAHI8Irc77ceGXO89bZ4WZjyxbIzloON3my3AEn3iIL9GpDmje7UstuUePfVsa2kJoaEiZsmG6BEMeDSSdhimCmn1I++JzVtIcIy49zJJsAdUWjwKLLYid2Ikr/li69MecpXiljDZLeedoGcOgusSXwfWbPLpx7ot1jfOnDV/9L/TeFArFBkQxjYDpDu3ZVL9Z/wtz1z7DM34i9pcGGaUopThH1Pz5mglHRYyIUPfVS8c63Z4/z3v9stEuYXiexS2R0IOnN61hkM57I3GJX2exJ5zgcrnmQPTVHy9F+yFmCi2Wj8mMbPbYvKkqcMyx2Kxl66GLvEGvrLZkoH4XeKPg7lfgNWUnDoIEsNPvBrY5lK9ehXFLAAgRu4NcAMrAVufK5lZcCl9Hk4NYn0drAiaVOITMKUhjvcSfyyyBRUTielpOedbnHmHUAAoSC7m64Ztw9AQ4oWxdeVUBnqEdfB5Et1qgzlmIVKDg464CUUNqUajpLq7H0AWgUKjx5qU89FuNbma0sgUn8e6UU86oErjHVybzbft+H4Mbvf607dYz/wXOcolkWZSJ+X/im7M96NCrLx+Pc5pje3nYzchPODx8UTdSsVUIfPRALRdNzzUvldqiTerlY6lfJI6syWZXSCVjsf5hzu4bLt97gZZVk8q3/TQpoQH8bfvr3VwV9Bi47+fTbIei7VqncrQ0EIqBFBUvdbcyPYf+ZCDVmIII4wO+H6UabCYx5IN6zeA5uNuZdOCXBTH0ze2s0ZQY4
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(64756008)(66556008)(66476007)(186003)(6506007)(53546011)(2616005)(2906002)(4326008)(26005)(122000001)(38100700002)(38070700005)(6486002)(71200400001)(5660300002)(91956017)(66946007)(76116006)(36756003)(33656002)(83380400001)(8676002)(8936002)(86362001)(54906003)(66446008)(316002)(6916009)(508600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c3l0ZlM5MTM2dDYzTlF1WVFEMXdqanlCWVh6MjZlcXV1MVF2QXlnWXpldGJw?=
 =?utf-8?B?aHdRQ01idVRJTXFyaTIraldrTDBvWkVockFocHRpbkVWckFHbHhBVXZUUmw4?=
 =?utf-8?B?M1YxTUZXK1RDdEN0L3Z5S3BLQyt4L0ZVNFZ6OE1FbzFpR0xTVitRVFNIdDFn?=
 =?utf-8?B?T3Vrd1dyR05yOXBFNEx4ZmRXSVRHOE9TRlBuY2U2M1JkcGNxRktMVnZDMFZC?=
 =?utf-8?B?aUpERHBLVkJkMjdYRklodFBteHhzQ1lrZU0rWjBHZlBpdWx6dSs0SjZyV25p?=
 =?utf-8?B?K1JSWm1QOGU2WTdtSG9INDIxdXZWRnhJUHBLenl4REJLU0pNVnZlWThlZy9x?=
 =?utf-8?B?bno0K01PZ29ONTI2b3picC96MUR0aTlQTENlWTVRZG1hVlFyY1A0UHNNcFFS?=
 =?utf-8?B?anhkN0cyUUZWV0I4RWVNU1QwSHNPN2VEeE5IQmFZbFo2VEs5a0JvY3c3Q1Uw?=
 =?utf-8?B?MWxTV3lQZjFiZXF0cHFaWkNVRnJNaVdNZWowUFVFeHhGeko1MGFFb2toeVVi?=
 =?utf-8?B?cUNrSGpENUY1NkhSMUdVNVJkZVNHZjE4S3k2Qm9BM3p2U21Ca3hJZUs3Qm9K?=
 =?utf-8?B?NG5uRGNHZ1FHQUhaUHc3clBicmpNSDJ1b0VLaTF5L1NBNmFuYXFsUk9wTkUr?=
 =?utf-8?B?NFlBbDkxRmF2VGJzZ2owSGdxTHEvck5OWGtlS0pVbWtLZ0d0czZyeFdGU3Y1?=
 =?utf-8?B?VGVRckJtYi93enpqa2x5bituU0QxcEJKSVluOWh5L0Rmd2pFMDJ0RHhrRkkr?=
 =?utf-8?B?bysya3VNejc0U2hsSVpLUWsrdjFXMWhlbXVWS3pDVThUVWVNa0dkMzM0ZCti?=
 =?utf-8?B?MXVXK2ptbk1vdXVGdFFDaks3MDQ3cGlid1Y3MStnbG13UHJSbWJsenVITXBC?=
 =?utf-8?B?KzZsYzdnL3dneSt2eVlMcHRUQ2FPOVQzMXc4Qjd4eG5TeXUwa1FKY3VmMitw?=
 =?utf-8?B?T3llZGZvSm41YzNQa1Q0cFMzWU9HYmplMXJsVVBJQ01qNHdmd09hSndHc3dT?=
 =?utf-8?B?TGgvZ3FCTTVzQkcyRUhFRW9OcnVMdWd2SXhKS0xsMk01bndSK1g1bFR4SkJQ?=
 =?utf-8?B?eXljSzNWQWlIR204Qm1xOHhueXJpeXk1L1hqeXNqck41Mkt3NlFERmwvUEx5?=
 =?utf-8?B?TnZENWI5VzVicERZVC8zdHdOYVdVeWRNQzVnT3RnTENTV2dSenRLYU1RR21U?=
 =?utf-8?B?QThaL1JoUjBYSVFDT3FQOGpRS0tobzY2WHdGRU9zZERtaVcxWS9LU25ObjVP?=
 =?utf-8?B?R3VjUG1tQ3lrRGo5OE9TSnR0cTl6bXJ5b3FlbDVZR2RLenVXUzRpM1NYcVZo?=
 =?utf-8?B?NGRINzJycUp6YVBpcFZZa1JqOVdhWldKU05NU1VqN2g2ZXQ4YnhOMXVQQUcv?=
 =?utf-8?B?cDRoczBaSUphanVUSDFhbU9haXhXeWJOZmJCNlU2Qk10d3hGNDI4Zi9mQjVX?=
 =?utf-8?B?LytHNjMrSlZlNTk3eVJSVTk3ZVlzK2ZqMlNQWFpId09UT2c1K3Fld2gwUEl6?=
 =?utf-8?B?RGhYa0RucThPblBJWmIzYUdZaUJvazhIUEpJV3RnMXFJNThjTXkzaEJoTURQ?=
 =?utf-8?B?b1oxYlVQOHpaWDlnU0pEdkROZ3IzK0tva0hLaXQ0UHQwRUlUWUthRDBoRWRU?=
 =?utf-8?B?S2NaUHFMcnZ3MThlUXI1dWU3bDl4RjVxWXJmTUIyWi9Bb041ZWhDZXBuNDdr?=
 =?utf-8?B?R3Yxc1JZWlRCZ0Q3ZXBwK0hiNks5bVRiY2FPN2hsTk1rZE01MXdzRzdhZlVO?=
 =?utf-8?Q?p3Fn3wzuEetzWCA2ZEgY7StKSEEytkm/IhchOgY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC359B91DAF16143A27668F6098934D3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5318
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ac3407a1-2e53-4830-b0f3-08d963cf645e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0S1IQYG4nfF/8ektFe1RKyPcUvaq3XZ1cu0jJyMbR58erDve/kMN/9M6RLiTOtfPTqcxG8jKCcl+qE8QQOzYa5aIXaKLx9PpG3grdcwAx1XRm8lybyEMsLqSuG2W26m6/5uXC3qATBIrhFCY5eX/nHaVoBfpmM9eTsAXiaEpr0QFomKOvJVx4UUZO7nXY53de/UjmBEguQEVgYkBp6hyv6/Fcealy9RplgraYBs+oZwYOxj6umAIDCEfzxUilZGKnaF/30cAs5BkHD2qjF2vORo5z28aJuQY7/vJJjXowWEQLfE29px3uUc8t9NRaRtVA9LbHDBC8Xv0QznR6r2WXTziyXoXBDMj6IiBGQGSjFuqh6/OOmG/Kzy/6NxiBcGW4y22WlDg1eVWrHF11hLQxAglTenpwGgUg5SM97wRIdCv+hWSihAOFwI0cgdQgh6Cyj57CnE2IzU4QyUMEPtmDuxOhW3h/UyF/sg9AdK1YfS/o+3ddl7ZGGS/N0s1MLv1uyyAMY/dGba41rRZvrozsJYLzOpH41Pps8J5UZvcuVHfw066rK84TTArslXRLJr+OKt1qSrI9Q40oVG5QFwESIcyETckpe+V48YM8fM5kYDETq0XobsiYKnSK2nIW6OhIv7jP41K97WtrCCLrMve3+NKULwJafnhanw+khnHf+c2EMIiRO7ZCdovbyLCtLziSTTFVG7vdlF5+5mJUyQItw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(36840700001)(46966006)(4326008)(53546011)(54906003)(5660300002)(82740400003)(82310400003)(6506007)(81166007)(70206006)(70586007)(36756003)(83380400001)(186003)(478600001)(6862004)(6486002)(26005)(8676002)(356005)(336012)(8936002)(2616005)(33656002)(6512007)(316002)(36860700001)(86362001)(47076005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 11:41:13.7382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb62fe8-fee5-4ad2-2dd7-08d963cf6a09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2523

SGkgSmFuDQoNCj4gT24gMjAgQXVnIDIwMjEsIGF0IDg6MDYgYW0sIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAxOS4wOC4yMDIxIDE0OjAyLCBSYWh1bCBT
aW5naCB3cm90ZToNCj4+IENvbXBpbGF0aW9uIGVycm9yIGlzIG9ic2VydmVkIHdoZW4gQUNQSSBh
bmQgSEFTX1BDSSBpcyBlbmFibGVkIGZvciBBUk0NCj4+IGFyY2hpdGVjdHVyZS4gTW92ZSB0aGUg
Y29kZSB1bmRlciBDT05GSUdfWDg2IGZsYWcgdG8gZ2F0ZSB0aGUgY29kZSBmb3INCj4+IEFSTS4N
Cj4gDQo+IFBsZWFzZSBnaXZlIGF0IGxlYXN0IG9uZSBleGFtcGxlIG9mIHdoYXQgaXQgaXMgdGhh
dCBmYWlscyB0byBjb21waWxlLg0KPiBXaGF0IGFuIGFwcHJvcHJpYXRlIGFjdGlvbiBpcyBkZXBl
bmRzIG9uIHRoZSBuYXR1cmUgb2YgdGhlIGVycm9yKHMpLA0KPiBhbmQgZnJvbSBsb29raW5nIGF0
IHRoZSBlbmNsb3NlZCBjb2RlIEkgY2Fubm90IGVhc2lseSBzZWUgd2hhdCBpdA0KPiBtaWdodCBi
ZSB0aGF0IGJyZWFrcyBmb3IgQXJtLg0KDQpJIGFtIG9ic2VydmluZyBiZWxvdyBlcnJvciB3aGVu
IGVuYWJsZWQgQUNQSSAmJiBIQVNfUENJIGZvciBBUk0uDQoNCnByZWxpbmsubzogSW4gZnVuY3Rp
b24gYHBjaWVfYWVyX2dldF9maXJtd2FyZV9maXJzdOKAmToNCi94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYzoxMjUxOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhcGVpX2hlc3RfcGFyc2Un
DQphYXJjaDY0LWxpbnV4LWdudS1sZDogL2hvbWUvcmFoc2luMDEvd29yay94ZW4vcGNpLXBhc3N0
aHJvdWdoLXVwc3RyZWFtL3hlbi94ZW4vLnhlbi1zeW1zLjA6IGhpZGRlbiBzeW1ib2wgYGFwZWlf
aGVzdF9wYXJzZScgaXNuJ3QgZGVmaW5lZA0KDQpJIGZvdW5kIHRoYXQgYXBlaS8gaXMgb25seSBl
bmFibGVkIGZvciB4ODYgYW5kIHBjaWVfYWVyX2dldF9maXJtd2FyZV9maXJzdCgpIGlzIG9ubHkg
Y2FsbGVkIGZyb20geDg2IGNvZGUuDQpvYmotJChDT05GSUdfWDg2KSArPSBhcGVpLw0KDQpJIGFt
IG5vdCBzdXJlIHdoZXRoZXIgd2UgbmVlZCB0aGlzIGNvZGUgZm9yIEFSTSBhcmNoaXRlY3R1cmUg
DQp0aGF0IGlzIHdoeSBJIGdhdGUgdGhlIGNvZGUgZm9yIEFSTSB2aWEgQ09ORklHX1g4Ng0KDQo+
IA0KPiBBbmQgYXMgc3VnZ2VzdGVkIGJ5IEp1bGllbiBmb3IgdGhlIGVhcmxpZXIgcGF0Y2ggLSB5
b3Ugd2lsbCB3YW50IHRvDQo+IHJlLW9yZGVyIHRoaW5ncyBzdWNoIHRoYXQgY29tcGlsYXRpb24g
ZG9lc24ndCAiYnJlYWsiIGluIHRoZSBmaXJzdA0KPiBwbGFjZS4gVGl0bGUgYW5kIGRlc2NyaXB0
aW9uIHdvdWxkIHRoZW4gd2FudCBhZGp1c3RpbmcgYWNjb3JkaW5nbHkuDQoNCkxldCBtZSByZW9y
ZGVyICB0aGUgcGF0Y2ggc2VyaWVzIGluIG5leHQgdmVyc2lvbi4NClJlZ2FyZHMsDQpSYWh1bA0K
PiANCj4gSmFuDQo+IA0KDQoNCg0KDQo=

