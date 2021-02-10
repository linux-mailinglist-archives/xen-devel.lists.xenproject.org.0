Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBBE316E14
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 19:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83690.156422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tvE-00019d-Fz; Wed, 10 Feb 2021 18:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83690.156422; Wed, 10 Feb 2021 18:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9tvE-00019E-CR; Wed, 10 Feb 2021 18:09:04 +0000
Received: by outflank-mailman (input) for mailman id 83690;
 Wed, 10 Feb 2021 18:09:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5iL=HM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l9tvC-000199-BB
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 18:09:02 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1904d8a-4de3-42e6-9bcd-c7595eeedab0;
 Wed, 10 Feb 2021 18:08:59 +0000 (UTC)
Received: from DU2PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:10:234::29)
 by AM8PR08MB5649.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Wed, 10 Feb
 2021 18:08:57 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234::4) by DU2PR04CA0054.outlook.office365.com
 (2603:10a6:10:234::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25 via Frontend
 Transport; Wed, 10 Feb 2021 18:08:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Wed, 10 Feb 2021 18:08:56 +0000
Received: ("Tessian outbound 587c3d093005:v71");
 Wed, 10 Feb 2021 18:08:56 +0000
Received: from be1b077e8999.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 49CEC92F-79DC-40E3-8D86-AD43C57453F1.1; 
 Wed, 10 Feb 2021 18:08:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id be1b077e8999.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Feb 2021 18:08:43 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR08MB2774.eurprd08.prod.outlook.com (2603:10a6:6:23::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Wed, 10 Feb
 2021 18:08:42 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 18:08:42 +0000
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
X-Inumbo-ID: c1904d8a-4de3-42e6-9bcd-c7595eeedab0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cqf+jDfoi52ndV4YBOidannMXCAThow9Oqn/kBBPSTc=;
 b=o4gglPRU/tfxPJtYYvYHZTMxLj2keNH4dtQCLhsJUlm5JE6G0eX6saP3j4uVOaExqT3KQUTcRKpyjfGLcj7nEONJ35exBtJO9tU2bx6T32HDwa/8HQ+fgixLPfR95AjvoCEAhGUcTYD7kWvgNtwpldCy5BlpwrZkTyQiX/WBGiY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a7b105e680586bd2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L6ceJI/HPQMFOLYTdAMlJIjkkIM1Hj9ZILXJLCgycu4eJA3eMU9af6f4cN+6tD7rmLnNQ8y1NQPGk5TXLCAwjTdckfJlR36Eixkfg16B7JQ0t8mD25L+mOtexYc5EbSxIq47yWTUvmj24dxmufqNiVSbki2Ww8bF+HoLvHYCCxEgG5XTYmLL0Hf9tksLOQf5hTlnoLQnLYyfPgM5B/Ag3OnFkm3KO6QZ7gZC7xw1BDA30n697wLYN+ucYZn+nCQ52uW6+PYgvPRPeNWoBQqoAhNU6qQlqpc4hfRSDeY0v6JtwLsZ14CPbnvxFu8c/AwjqiP3hJ8ln2pRUW/xSq79Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cqf+jDfoi52ndV4YBOidannMXCAThow9Oqn/kBBPSTc=;
 b=iV96E4oCgXpkSXdSws4nJHiS/pSq2QypgrA5MriBLy8xMvcC2rEt3kehI0S+6hN6+rKS33W7ocXZZ5hY40yZKOQt30YuzNOxJimtV1gipfZmSKcNeKPQaXC3R+XYf+wkDYiqFKdPgL/lfX2GOK1OMkH9FHKNN0cKw8flBoIBS+UdlWgQXdLYxVhUEF0I6zX6dBoGWaEFtykMPnaNKe5ulRKKhodqYPWI90uMFqdxiEsvMoBqLsJc6/WjMKztw0uiFgIm3QP5AcPYaiuOP2VFjPVAdOH/JaUmFQvhzNZXvv4b2u4/oTi2mD3QvPYxeOKZ0P8v5GDQGlc7w53oM1JPtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cqf+jDfoi52ndV4YBOidannMXCAThow9Oqn/kBBPSTc=;
 b=o4gglPRU/tfxPJtYYvYHZTMxLj2keNH4dtQCLhsJUlm5JE6G0eX6saP3j4uVOaExqT3KQUTcRKpyjfGLcj7nEONJ35exBtJO9tU2bx6T32HDwa/8HQ+fgixLPfR95AjvoCEAhGUcTYD7kWvgNtwpldCy5BlpwrZkTyQiX/WBGiY=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index: AQHW/ks46k4kUfhzpk6LTniK0S/PbqpPzhoAgAB7ugCAATYRAIAAKYkAgAAJgAA=
Date: Wed, 10 Feb 2021 18:08:42 +0000
Message-ID: <ECC82E19-3504-4E0E-B3EA-D0E46DD842C6@arm.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
 <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
 <4e4f7d25-6f5f-1016-b1c9-7aa902d637b8@xen.org>
In-Reply-To: <4e4f7d25-6f5f-1016-b1c9-7aa902d637b8@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fc0e6730-902e-40c4-2fbb-08d8cdeeef07
x-ms-traffictypediagnostic: DB6PR08MB2774:|AM8PR08MB5649:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB56496806EF9A89C8C58B5026FC8D9@AM8PR08MB5649.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 W3x+MESzKLTZyDI6NfBrE5BpFdONG1iqBm0ISEYqHyICcEVfj+OdlOXNa74HXvAIXpDSJtudeoV+vzhDC3/BxdI0bCVkkkWcrOP/tUVoITQ10QNgbG63FoAQvp/FwNsR5YSweJTyYmrZqgEHsMD24ngsB0KpbDKutNbv26d32nURqbK/h+HzkEDtSGq3mf62p/SgNI6fxc3J2YrBVGuAMX+h+tgCrBJ2BRNXgd/d4fcpsetLl79c+QEmpu+F9pUDMDpNmYWNysBjPS5njyDGuqnY8vw9xkBERSA8JQHRSgO2LJjAQuC8fekmP2brx6f9Fpp/AeyvrN7qKMUQDuDTV/ZnR8VQpkKJ90HR/5/zClQyAuDQ9WPJisRpCy1h2nT1NQTofQVznqphjfvBPSokKzViogCeVXKGtTOOB37Gwl37X5NCF8+++sH3mV5ASLNDaIxuTNH2IhtMLWRSnF7oORv6C3ycjvCuCDAC/VMwY202PWetZvNBOTWDVCoM9SRHxK7us32SaSgIdw9Ibe8KgAcdD8l9uaDb21vRVKmaVEDPc+ieYjQuwOqYO5pdBJJEbaG7fUC7BdeVzR5AF9BfP0WoDAaSpH1gw8MboPkq9jKaH0rQIJP9xRhdL357yx/s+NIFCjgj4WnaWBlE3/baOUJjv031LxKsVUfxC2TrndU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(71200400001)(26005)(6512007)(316002)(5660300002)(53546011)(6506007)(8936002)(2616005)(186003)(8676002)(91956017)(33656002)(54906003)(966005)(6486002)(2906002)(6916009)(4326008)(478600001)(76116006)(66446008)(66476007)(66556008)(64756008)(66946007)(86362001)(36756003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?bHYzSFRyYnhoYTdnRW9aRWNkVldKc3I5eFYrRkNIUGJuK0ZaYUdZRVJMdmdx?=
 =?utf-8?B?Q2tDR2l5YTNsUEJXVkZEbUhrTDNCK3VTeEZWT3gzbkYvZG80UjZEQUUxb3hp?=
 =?utf-8?B?YzRBVFRFWmFkdFB2dHhWaVZkM3VNYnlqc1A4MThrbzBXVkhLTnVNMnVSWjJy?=
 =?utf-8?B?Mk1nRkJGZTJiaGxCVCtoeUNUWWZyMlEwR2FaRmF2b1ZvblBnVzFzUndKUHla?=
 =?utf-8?B?U2t3eWYwN0V2QzRDSDFBeTNZNTllUkRTOXJZLzhMalNFQ1FnV1E2WE1HQkk4?=
 =?utf-8?B?RG1yVDdrR3VyamxsMDJ3V1BZbzN0QkdrL0dHd29kbGh6RGxCR0NwNktxb0wy?=
 =?utf-8?B?b1grQ1FFZ0RTbDBNc0lKN1dqV0xTMGlZc1I4cGlJTjk0aWJNM3hNVmx0V2pV?=
 =?utf-8?B?bVRCZjlDS3dmWW1Ta1ViRC81UENaV3VneGlLY25YUWR6Q1JZb2tsTGlEa3Mx?=
 =?utf-8?B?VjV4QmoyL2xiRCswaTk2SENQVzNzQlFQTGdnUFFsUzkzOVJiektaSitDTU5B?=
 =?utf-8?B?Y1JWMHFMT1RSOHdXTVIyWnNZL1JwY0wvZGRlS0tVaUJyOUtsOFZhSjJ4Z250?=
 =?utf-8?B?UUJ2WVprb0JEeTNlZnFqWW51b1B2T0dpaW9Pa1JqR1pvdVJ1RUNLaWNxck9t?=
 =?utf-8?B?aU9sL1doTXVQYXN2QXVYbWc3dmVmRU44WVp2VlRaazBOcTY1SlFDOVc0aU1t?=
 =?utf-8?B?cWVNZkh5c28zcm9UOG1qclkrNWNCUkVXQkhiR2hMTDdsaXJORW5nZlovcTIr?=
 =?utf-8?B?ZTMwWDVBZ1RYOXhBYU51dndsUEZOdHQ3cTZqSjZEQTZZcjR2VXhRYmxBOUJq?=
 =?utf-8?B?REhUdlJjTkcvYlc0YU5Yd1FXcmRTYkR2dmFXVW05cjdybGZ5N05UNU90amx5?=
 =?utf-8?B?cjRpdXNQUXY3d3M3NFAvOWFPdHpMRjBZc3RMV1JKVWROOGRKZzBKS2N6TXZY?=
 =?utf-8?B?RGxOM2NIMlpmV1RZUUpjUnRRMHdpSmxrbHBmQU12VVp2L2dqTEZaRWlJRko2?=
 =?utf-8?B?cjR5U0xjS2hPaitWbkMxYTlneDdkMHJ4Rm9LY2h6bmk0VGFqWlNSZXhOanF3?=
 =?utf-8?B?MU4wa3NybHRUd1BCWjdCYklZMVo3N2ZkeW9hQm9ZaHd4RlUrY3pXRm8rbXND?=
 =?utf-8?B?OFhlSTJ5eEFBVXNlSFZTcTd6VjZwdkJPVHFQaCt1ZjNUeEV4cmdocDRVQk01?=
 =?utf-8?B?eU9XV0dERnlNclM5UDZabW5VZFVlTDBYNnpZOWgxUitGdmNEZFA0TWprOHIx?=
 =?utf-8?B?UWFrSXFwL0NlQnNTRksvVTc4QUdXNXovQ1VPbS8yWms0WC9oUHBUR0ViK2ZB?=
 =?utf-8?B?WWVRNUdsOUpyK2dlNVJtdkovMGhnODc3a1p1UWRZVVVMMmRIeC9EN2pma2pY?=
 =?utf-8?B?K25ieFB6cy9VaGJkaDFWRzJ4VnRZM25qaXdqZGljUkpicEh6RXR1THdOMllS?=
 =?utf-8?B?eWdoRGxOa0VxblFEc2o1dVNnaUhmMWdxVXU5bWdhb3VpWm5XcWs1VHJ5SjE5?=
 =?utf-8?B?S01wZlNoc0wwZk8yMHErbS9jYktzcHdBV2wzSTNXUk5FOUQ4Y0w2c1JkVDMv?=
 =?utf-8?B?azJmUmZyQzR0a3RrTFllOW40YkRYNmpnWHJvYWtNak8zODNuVlNJYW5TcU9O?=
 =?utf-8?B?d204eHVxaFRxait1RzhwR2t4RVIrRlJBRmZNeHBkbVdYWUVseElOeVpaSUg0?=
 =?utf-8?B?c202S0huRDhIZ3EyODcvYk93TFl3QVRDWHkxbHQvdUh5U25qZUZQT2x2WURG?=
 =?utf-8?Q?U+ripc1GnMlqzmnOfFR9XTtQ33zb3ASj2m2RDNN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7E21B0351B02048A2F7DAB142C67F7A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2774
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ffdbb2cf-0e0a-401b-e522-08d8cdeee657
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vSDFZm0OJCTz7mkvXXHnhCj3t1C3KzMg8Sj8Ic0jz0OdIgA8UbEhRC7xcyMWBUwxfpF9LLNo2AfEYBBR8j3OCqCnxjz/x1rpX+Df5l5EQ6eEzeHzssWp/gjdXUyjYhpMA4BHxZ/bI+KT/WfjozCyfHRbnKLx37vIYXiruT9Rt6OKSsnviUodrGzdA/OpgOIgIXE5l6ZdfH3NLGARQG/092Rj1jZrV6WZHG2cAMNc2SfqOnomFQ7rEI9kcrkHLiK2//oYGOCQl/K/I85KSPAm5HEwGCIsvhBAZoBUzcPxUZzrUvzb0iAp3910h1kyk3zndt6SWDe7+p9jFbNwp43OgSpNdyUvPL+tvbWDkOkGmO0vmGSJRyyGeSVN2GxCpH0LTO5OltwzLfuEP4dnyszrnrlFzkQhb/TvQ8mdN/H901hSCY3jAVhpOeokJY4H+y69cvgMlwsog6NEju4Mm+3b/1ZJv6xzA/5BpF0kCk3DUz1j6cXI5Neh5Wh2WK+ztoAkTX9QKzE6v2zTM8SvNEMI1/K7H7n60+hCj6HZwSlyuJ9uX8r/9yrqrqdIzKz6jfxELi3VT52hk+tipFVNFZ+lxVi6mWlDc9pH/aRkRchki8bfF4YGUep2vdLtz+/OogutNqY5KabhB3bFvGcuJDNdi6lyA8XLZDvFLm6X4f05XvkrTnveY0hb/G20w+E68DmV1uxyJ8zhMwI8hx5s1ls7w7NDy5C73cUSLbhdfuUr1KU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(39860400002)(36840700001)(46966006)(54906003)(2906002)(86362001)(8676002)(33656002)(6512007)(36860700001)(107886003)(336012)(2616005)(186003)(316002)(4326008)(53546011)(81166007)(82740400003)(6486002)(5660300002)(83380400001)(26005)(6862004)(47076005)(6506007)(82310400003)(966005)(70206006)(70586007)(8936002)(356005)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 18:08:56.8971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc0e6730-902e-40c4-2fbb-08d8cdeeef07
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5649

SGVsbG8gSnVsaWVuLA0KDQo+IE9uIDEwIEZlYiAyMDIxLCBhdCA1OjM0IHBtLCBKdWxpZW4gR3Jh
bGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhpLA0KPiANCj4gT24gMTAvMDIvMjAy
MSAxNTowNiwgUmFodWwgU2luZ2ggd3JvdGU6DQo+Pj4gT24gOSBGZWIgMjAyMSwgYXQgODozNiBw
bSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+
PiANCj4+PiBPbiBUdWUsIDkgRmViIDIwMjEsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+Pj4gT24g
OCBGZWIgMjAyMSwgYXQgNjo0OSBwbSwgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPiB3cm90ZToNCj4+Pj4+IA0KPj4+Pj4gQ29tbWl0IDkxZDRlY2E3YWRkIGJyb2tl
IGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcgb24gQVJNLg0KPj4+Pj4gVGhlIG9mZmVuZGluZyBj
aHVuayBpczoNCj4+Pj4+IA0KPj4+Pj4gI2RlZmluZSBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5n
KGQpICAgICAgICAgICAgICAgICAgICBcDQo+Pj4+PiAtICAgIChpc19kb21haW5fZGlyZWN0X21h
cHBlZChkKSAmJiBuZWVkX2lvbW11KGQpKQ0KPj4+Pj4gKyAgICAoaXNfZG9tYWluX2RpcmVjdF9t
YXBwZWQoZCkgJiYgbmVlZF9pb21tdV9wdF9zeW5jKGQpKQ0KPj4+Pj4gDQo+Pj4+PiBPbiBBUk0g
d2UgbmVlZCBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nIHRvIGJlIHRydWUgZm9yIGRvbTAgd2hl
biBpdCBpcw0KPj4+Pj4gZGlyZWN0bHkgbWFwcGVkIGFuZCBJT01NVSBpcyBlbmFibGVkIGZvciB0
aGUgZG9tYWluLCBsaWtlIHRoZSBvbGQgY2hlY2sNCj4+Pj4+IGRpZCwgYnV0IHRoZSBuZXcgY2hl
Y2sgaXMgYWx3YXlzIGZhbHNlLg0KPj4+Pj4gDQo+Pj4+PiBJbiBmYWN0LCBuZWVkX2lvbW11X3B0
X3N5bmMgaXMgZGVmaW5lZCBhcyBkb21faW9tbXUoZCktPm5lZWRfc3luYyBhbmQNCj4+Pj4+IG5l
ZWRfc3luYyBpcyBzZXQgYXM6DQo+Pj4+PiANCj4+Pj4+ICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9t
YWluKGQpIHx8IGlvbW11X2h3ZG9tX3N0cmljdCApDQo+Pj4+PiAgICAgICBoZC0+bmVlZF9zeW5j
ID0gIWlvbW11X3VzZV9oYXBfcHQoZCk7DQo+Pj4+PiANCj4+Pj4+IGlvbW11X3VzZV9oYXBfcHQo
ZCkgbWVhbnMgdGhhdCB0aGUgcGFnZS10YWJsZSB1c2VkIGJ5IHRoZSBJT01NVSBpcyB0aGUNCj4+
Pj4+IFAyTS4gSXQgaXMgdHJ1ZSBvbiBBUk0uIG5lZWRfc3luYyBtZWFucyB0aGF0IHlvdSBoYXZl
IGEgc2VwYXJhdGUgSU9NTVUNCj4+Pj4+IHBhZ2UtdGFibGUgYW5kIGl0IG5lZWRzIHRvIGJlIHVw
ZGF0ZWQgZm9yIGV2ZXJ5IGNoYW5nZS4gbmVlZF9zeW5jIGlzIHNldA0KPj4+Pj4gdG8gZmFsc2Ug
b24gQVJNLiBIZW5jZSwgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSBpcyBmYWxzZSB0b28s
DQo+Pj4+PiB3aGljaCBpcyB3cm9uZy4NCj4+Pj4+IA0KPj4+Pj4gQXMgYSBjb25zZXF1ZW5jZSwg
d2hlbiB1c2luZyBQViBuZXR3b3JrIGZyb20gYSBkb21VIG9uIGEgc3lzdGVtIHdoZXJlDQo+Pj4+
PiBJT01NVSBpcyBvbiBmcm9tIERvbTAsIEkgZ2V0Og0KPj4+Pj4gDQo+Pj4+PiAoWEVOKSBzbW11
OiAvc21tdUBmZDgwMDAwMDogVW5oYW5kbGVkIGNvbnRleHQgZmF1bHQ6IGZzcj0weDQwMiwgaW92
YT0weDg0MjRjYjE0OCwgZnN5bnI9MHhiMDAwMSwgY2I9MA0KPj4+Pj4gWyAgIDY4LjI5MDMwN10g
bWFjYiBmZjBlMDAwMC5ldGhlcm5ldCBldGgwOiBETUEgYnVzIGVycm9yOiBIUkVTUCBub3QgT0sN
Cj4+Pj4+IA0KPj4+Pj4gVGhlIGZpeCBpcyB0byBnbyBiYWNrIHRvIHNvbWV0aGluZyBhbG9uZyB0
aGUgbGluZXMgb2YgdGhlIG9sZA0KPj4+Pj4gaW1wbGVtZW50YXRpb24gb2YgZ250dGFiX25lZWRf
aW9tbXVfbWFwcGluZy4NCj4+Pj4+IA0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGlsaW54LmNvbT4NCj4+Pj4+IEZpeGVzOiA5MWQ0
ZWNhN2FkZA0KPj4+Pj4gQmFja3BvcnQ6IDQuMTIrDQo+Pj4+PiANCj4+Pj4+IC0tLQ0KPj4+Pj4g
DQo+Pj4+PiBHaXZlbiB0aGUgc2V2ZXJpdHkgb2YgdGhlIGJ1ZywgSSB3b3VsZCBsaWtlIHRvIHJl
cXVlc3QgdGhpcyBwYXRjaCB0byBiZQ0KPj4+Pj4gYmFja3BvcnRlZCB0byA0LjEyIHRvbywgZXZl
biBpZiA0LjEyIGlzIHNlY3VyaXR5LWZpeGVzIG9ubHkgc2luY2UgT2N0DQo+Pj4+PiAyMDIwLg0K
Pj4+Pj4gDQo+Pj4+PiBGb3IgdGhlIDQuMTIgYmFja3BvcnQsIHdlIGNhbiB1c2UgaW9tbXVfZW5h
YmxlZCgpIGluc3RlYWQgb2YNCj4+Pj4+IGlzX2lvbW11X2VuYWJsZWQoKSBpbiB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZy4NCj4+Pj4+IA0KPj4+Pj4gQ2hh
bmdlcyBpbiB2MjoNCj4+Pj4+IC0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQ0KPj4+Pj4gLSBhZGQg
aXNfaW9tbXVfZW5hYmxlZChkKSB0byB0aGUgY2hlY2sNCj4+Pj4+IC0tLQ0KPj4+Pj4geGVuL2lu
Y2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oIHwgMiArLQ0KPj4+Pj4gMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+PiANCj4+Pj4+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmggYi94ZW4vaW5jbHVkZS9hc20tYXJt
L2dyYW50X3RhYmxlLmgNCj4+Pj4+IGluZGV4IDZmNTg1YjE1MzguLjBjZTc3ZjlhMWMgMTAwNjQ0
DQo+Pj4+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2dyYW50X3RhYmxlLmgNCj4+Pj4+ICsr
KyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUuaA0KPj4+Pj4gQEAgLTg5LDcgKzg5
LDcgQEAgaW50IHJlcGxhY2VfZ3JhbnRfaG9zdF9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgZ3BhZGRy
LCBtZm5fdCBtZm4sDQo+Pj4+PiAgICAoKChpKSA+PSBucl9zdGF0dXNfZnJhbWVzKHQpKSA/IElO
VkFMSURfR0ZOIDogKHQpLT5hcmNoLnN0YXR1c19nZm5baV0pDQo+Pj4+PiANCj4+Pj4+ICNkZWZp
bmUgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSAgICAgICAgICAgICAgICAgICAgXA0KPj4+
Pj4gLSAgICAoaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgbmVlZF9pb21tdV9wdF9zeW5j
KGQpKQ0KPj4+Pj4gKyAgICAoaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgaXNfaW9tbXVf
ZW5hYmxlZChkKSkNCj4+Pj4+IA0KPj4+Pj4gI2VuZGlmIC8qIF9fQVNNX0dSQU5UX1RBQkxFX0hf
XyAqLw0KPj4+PiANCj4+Pj4gSSB0ZXN0ZWQgdGhlIHBhdGNoIGFuZCB3aGlsZSBjcmVhdGluZyB0
aGUgZ3Vlc3QgSSBvYnNlcnZlZCB0aGUgYmVsb3cgd2FybmluZyBmcm9tIExpbnV4IGZvciBibG9j
ayBkZXZpY2UuDQo+Pj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y0LjMvc291
cmNlL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMjTDI1OA0KPj4+IA0KPj4+IFNv
IHlvdSBhcmUgY3JlYXRpbmcgYSBndWVzdCB3aXRoICJ4bCBjcmVhdGUiIGluIGRvbTAgYW5kIHlv
dSBzZWUgdGhlDQo+Pj4gd2FybmluZ3MgYmVsb3cgcHJpbnRlZCBieSB0aGUgRG9tMCBrZXJuZWw/
IEkgaW1hZ2luZSB0aGUgZG9tVSBoYXMgYQ0KPj4+IHZpcnR1YWwgImRpc2siIG9mIHNvbWUgc29y
dC4NCj4+IFllcyB5b3UgYXJlIHJpZ2h0IEkgYW0gdHJ5aW5nIHRvIGNyZWF0ZSB0aGUgZ3Vlc3Qg
d2l0aCAieGwgY3JlYXRl4oCdIGFuZCBiZWZvcmUgdGhhdCwgSSBjcmVhdGVkIHRoZSBsb2dpY2Fs
IHZvbHVtZSBhbmQgdHJ5aW5nIHRvIGF0dGFjaCB0aGUgbG9naWNhbCB2b2x1bWUNCj4+IGJsb2Nr
IHRvIHRoZSBkb21haW4gd2l0aCDigJx4bCBibG9jay1hdHRhY2jigJ0uIEkgb2JzZXJ2ZWQgdGhp
cyBlcnJvciB3aXRoIHRoZSAieGwgYmxvY2stYXR0YWNo4oCdIGNvbW1hbmQuDQo+PiBUaGlzIGlz
c3VlIG9jY3VycyBhZnRlciBhcHBseWluZyB0aGlzIHBhdGNoIGFzIHdoYXQgSSBvYnNlcnZlZCB0
aGlzIHBhdGNoIGludHJvZHVjZSB0aGUgY2FsbHMgdG8gaW9tbXVfbGVnYWN5X3ssIHVufW1hcCgp
IHRvIG1hcCB0aGUgZ3JhbnQgcGFnZXMgZm9yDQo+PiBJT01NVSB0aGF0IHRvdWNoZXMgdGhlIHBh
Z2UtdGFibGVzLiBJIGFtIG5vdCBzdXJlIGJ1dCB3aGF0IEkgb2JzZXJ2ZWQgaXMgdGhhdCBzb21l
dGhpbmcgaXMgd3JpdHRlbiB3cm9uZyB3aGVuIGlvbW1fdW5tYXAgY2FsbHMgdW5tYXAgdGhlIHBh
Z2VzDQo+PiBiZWNhdXNlIG9mIHRoYXQgaXNzdWUgaXMgb2JzZXJ2ZWQuDQo+IA0KPiBDYW4geW91
IGNsYXJpZnkgd2hhdCB5b3UgbWVhbiBieSAid3JpdHRlbiB3cm9uZyI/IFdoYXQgc29ydCBvZiBl
cnJvciBkbyB5b3Ugc2VlIGluIHRoZSBpb21tdV91bm1hcCgpPw0KDQoNCkkgbWlnaHQgYmUgd3Jv
bmcgYXMgcGVyIG15IHVuZGVyc3RhbmRpbmcgZm9yIEFSTSB3ZSBhcmUgc2hhcmluZyB0aGUgUDJN
IGJldHdlZW4gQ1BVIGFuZCBJT01NVSBhbHdheXMgYW5kIHRoZSBtYXBfZ3JhbnRfcmVmKCkgZnVu
Y3Rpb24gaXMgd3JpdHRlbiBpbiBzdWNoIGEgd2F5IHRoYXQgd2UgaGF2ZSB0byBjYWxsIGlvbW11
X2xlZ2FjeV97LCB1bn1tYXAoKSBvbmx5IGlmIFAyTSBpcyBub3Qgc2hhcmVkLiANCg0KQXMgd2Ug
YXJlIHNoYXJpbmcgdGhlIFAyTSB3aGVuIHdlIGNhbGwgdGhlIGlvbW11X21hcCgpIGZ1bmN0aW9u
IGl0IHdpbGwgb3ZlcndyaXRlIHRoZSBleGlzdGluZyBHRk4gLT4gTUZOICggRm9yIERPTTAgR0ZO
IGlzIHNhbWUgYXMgTUZOKSBlbnRyeSBhbmQgd2hlbiB3ZSBjYWxsIGlvbW11X3VubWFwKCkgaXQg
d2lsbCB1bm1hcCB0aGUgIChHRk4gLT4gTUZOICkgZW50cnkgZnJvbSB0aGUgcGFnZS10YWJsZS4g
TmV4dCB0aW1lIHdoZW4gbWFwX2dyYW50X3JlZigpIHRyaWVzIHRvIG1hcCB0aGUgc2FtZSBmcmFt
ZSBpdCB3aWxsIHRyeSB0byBnZXQgdGhlIGNvcnJlc3BvbmRpbmcgR0ZOIGJ1dCB0aGVyZSB3aWxs
IG5vIGVudHJ5IGluIFAyTSBhcyBpb21tdV91bm1hcCgpIGFscmVhZHkgdW5tYXBwZWQgdGhlIEdG
TiBiZWNhdXNlIG9mIHRoYXQgdGhpcyBlcnJvciBtaWdodCBiZSBvYnNlcnZlZC4NCg0KU2VxdWVu
Y2Ugb2YgZXZlbnRzIHRoYXQgcmVzdWx0cyB0aGUgaXNzdWUgOg0KDQpnbnR0YWJfbWFwX2dyYW50
X3JlZiAoR0ZOPWE5OWZiIE1GTj1hOTlmYikNCmFybV9pb21tdV9tYXBfcGFnZSgpIERPTUlEOjAg
ZGZuID0gYTk5ZmIgbWZuID0gYTk5ZmIgDQoNCmdudHRhYl9tYXBfZ3JhbnRfcmVmICggR0ZOPWQ5
OTEzIE1GTj1kOTkxMykNCmFybV9pb21tdV9tYXBfcGFnZSgpIERPTUlEOjAgZGZuID0gZDk5MTMg
bWZuID0gZDk5MTMNCg0KZ250dGFiX21hcF9ncmFudF9yZWYgKCBHRk49ZDk4NDYgTUZOPWQ5ODQ2
KQ0KYXJtX2lvbW11X21hcF9wYWdlKCkgRE9NSUQ6MCBkZm4gPSBkOTg0NiBtZm4gPSBkOTg0NiAN
Cg0KZ250dGFiX21hcF9ncmFudF9yZWYgKEdGTj1hODQ3NCBNRk49YTg0NzQpDQphcm1faW9tbXVf
bWFwX3BhZ2UoKSBET01JRDowIGRmbiA9IGE4NDc0IG1mbiA9IGE4NDc0DQoNCmFybV9pb21tdV91
bm1hcF9wYWdlKCkgRE9NSUQ6MCBkZm4gPSBhOTlmYg0KYXJtX2lvbW11X3VubWFwX3BhZ2UoKSBE
T01JRDowIGRmbiA9IGQ5OTEzDQphcm1faW9tbXVfdW5tYXBfcGFnZSgpIERPTUlEOjAgZGZuID0g
ZDk4NDYNCmFybV9pb21tdV91bm1hcF9wYWdlKCkgRE9NSUQ6MCBkZm4gPSBhODQ3NA0KDQpUcnkg
dG8gbWFwIHRoZSBzYW1lIGZyYW1lIHRoYXQgaXMgdW5tYXBwZWQgZWFybGllciBieSBpb21tdV91
bm1hcCBjYWxsKCkNCmdudHRhYl9tYXBfZ3JhbnRfcmVmIChHRk49YTk5ZmIgTUZOPTB4ZmZmZmZm
ZmYpLi0+IE5vdCBhYmxlIHRvIGZpbmQgdGhlIEdGTiBpbiBwMm0gZXJyb3IgaXMgb2JzZXJ2ZWQg
YWZ0ZXIgdGhhdC4gDQoNCj4gDQo+PiBZb3UgY2FuIHJlcHJvZHVjZSB0aGUgaXNzdWUgYnkganVz
dCBjcmVhdGluZyB0aGUgZHVtbXkgaW1hZ2UgZmlsZSBhbmQgdHJ5IHRvIGF0dGFjaCBpdCB3aXRo
IOKAnHhsIGJsb2NrLWF0dGFjaOKAnQ0KPj4gZGQgaWY9L2Rldi96ZXJvIG9mPXRlc3QuaW1nIGJz
PTEwMjQgY291bnQ9MCBzZWVrPTEwMjQNCj4+IHhsIGJsb2NrLWF0dGFjaCAwIHBoeTp0ZXN0Lmlt
ZyB4dmRhIHcNCj4+IFNlcXVlbmNlIG9mIGNvbW1hbmQgdGhhdCBJIGZvbGxvdyBpcyBhcyBmb2xs
b3dzIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWU6DQo+PiBsdnMgdmcteGVuL215Z3Vlc3QNCj4+IGx2
Y3JlYXRlIC15IC1MIDRHIC1uIG15Z3Vlc3QgdmcteGVuDQo+PiBwYXJ0ZWQgLXMgL2Rldi92Zy14
ZW4vbXlndWVzdCBta2xhYmVsIG1zZG9zDQo+PiBwYXJ0ZWQgLXMgL2Rldi92Zy14ZW4vbXlndWVz
dCB1bml0IE1CIG1rcGFydCBwcmltYXJ5IDEgNDA5Ng0KPj4gc3luYw0KPj4geGwgYmxvY2stYXR0
YWNoIDAgcGh5Oi9kZXYvdmcteGVuL215Z3Vlc3QgeHZkYSB3DQo+PiBsaWJ4bDogZXJyb3I6IGxp
YnhsX3hzaGVscC5jOjIwMTpsaWJ4bF9feHNfcmVhZF9tYW5kYXRvcnk6IHhlbnN0b3JlIHJlYWQg
ZmFpbGVkOiBgL2xpYnhsLzAvdHlwZSc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCj4+IGxp
YnhsOiB3YXJuaW5nOiBsaWJ4bF9kb20uYzo1MTpsaWJ4bF9fZG9tYWluX3R5cGU6IHVuYWJsZSB0
byBnZXQgZG9tYWluIHR5cGUgZm9yIGRvbWlkPTAsIGFzc3VtaW5nIEhWTQ0KPj4gWyAgMTYyLjYz
MjIzMl0geGVuLWJsa2JhY2s6IGJhY2tlbmQvdmJkLzAvNTE3MTI6IHVzaW5nIDQgcXVldWVzLCBw
cm90b2NvbCAxIChhcm0tYWJpKSBwZXJzaXN0ZW50IGdyYW50cw0KPj4gWyAgMTYyLjc2NDg0N10g
dmJkIHZiZC0wLTUxNzEyOiA5IG1hcHBpbmcgaW4gc2hhcmVkIHBhZ2UgOCBmcm9tIGRvbWFpbiAw
DQo+PiBbICAxNjIuNzcxNzQwXSB2YmQgdmJkLTAtNTE3MTI6IDkgbWFwcGluZyByaW5nLXJlZiBw
b3J0IDUNCj4+IFsgIDE2Mi43Nzc2NTBdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0t
LS0tLQ0KPj4gWyAgMTYyLjc4MjE2N10gV0FSTklORzogQ1BVOiAyIFBJRDogMzcgYXQgZHJpdmVy
cy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYzoyOTYgeGVuX2Jsa2lmX2Rpc2Nvbm5lY3QrMHgy
MGMvMHgyMzANCj4gDQo+IEp1c3QgdG8gY29uZmlybSwgdGhpcyBzcGxhdCBjb21lcyBmcm9tOg0K
PiANCj4gV0FSTl9PTihpICE9IChYRU5fQkxLSUZfUkVRU19QRVJfUEFHRSAqIGJsa2lmLT5ucl9y
aW5nX3BhZ2VzKSk7DQo+IA0KPiBJZiBzbywgd2hhdCBhcmUgdGhlIHZhbHVlcyBmb3IgaSBhbmQg
YmxraWYtPm5yX3JpbmdfcGFnZXM/DQoNCkxldCBtZSBmaW5kIG91dCBhbmQgd2lsbCBzaGFyZSB3
aXRoIHlvdS4NCg0KUmVnYXJkcywNClJhaHVsDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4g
SnVsaWVuIEdyYWxsDQoNCg==

