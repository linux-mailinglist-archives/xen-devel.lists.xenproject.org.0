Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B985E7DF16B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 12:43:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626866.977530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyW5z-0003xN-9p; Thu, 02 Nov 2023 11:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626866.977530; Thu, 02 Nov 2023 11:42:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyW5z-0003uC-53; Thu, 02 Nov 2023 11:42:43 +0000
Received: by outflank-mailman (input) for mailman id 626866;
 Thu, 02 Nov 2023 11:42:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wS6e=GP=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1qyW5x-0003u6-Io
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 11:42:41 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2048.outbound.protection.outlook.com [40.107.7.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed7e0ea5-7974-11ee-98d6-6d05b1d4d9a1;
 Thu, 02 Nov 2023 12:42:40 +0100 (CET)
Received: from AM6P191CA0104.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::45)
 by DBAPR08MB5670.eurprd08.prod.outlook.com (2603:10a6:10:1a6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 11:42:04 +0000
Received: from AMS0EPF000001A3.eurprd05.prod.outlook.com
 (2603:10a6:209:8a:cafe::b7) by AM6P191CA0104.outlook.office365.com
 (2603:10a6:209:8a::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21 via Frontend
 Transport; Thu, 2 Nov 2023 11:42:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A3.mail.protection.outlook.com (10.167.16.228) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 11:42:04 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Thu, 02 Nov 2023 11:42:04 +0000
Received: from 1575cde339b8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2AAB0CA1-BE1F-4C47-A776-6803876FAE37.1; 
 Thu, 02 Nov 2023 11:41:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1575cde339b8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 Nov 2023 11:41:57 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DU0PR08MB9584.eurprd08.prod.outlook.com (2603:10a6:10:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Thu, 2 Nov
 2023 11:41:55 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::76e6:a7e1:1592:866%3]) with mapi id 15.20.6954.021; Thu, 2 Nov 2023
 11:41:55 +0000
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
X-Inumbo-ID: ed7e0ea5-7974-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mXel+1hTGoFcN6kYzZKPyx6Q4jJ4Dk883BCssTGONAPxDtLfUGBSFuwis45iBMqoMEYm7BLgYRu4H2AF1X4ghLYLq1j1ca+TSRcZ6uil3puGYJwxpZCiApj4Q5cP3rcH2aePTBKZVt6H12+GEsI5bsRHCSPZqw7AI5sqTyW1S55zI8SfR9yATo8dcr1eT5aJjMbdk+VOR8dsXppMrTu+JBfxr26uHhOb40bE3NBUJyazrFG7Uf4VdBYnLg4pkJe9fZdB5YFxaLBtN8cONNkCoA/Xuh6JveO22RN62SjVW9t52EnlWgHlTLyERQeiJ+LdJjsDsF7XjqpKVklyZf7D9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7NjX8SCkzfViTzn5JyNACGHWqFlHkV2txgZSx65WU8=;
 b=JwuWMOiCCdXmN9swHajNuUwwMaUX9TJ7c2+h+fdQPjBXpP27Vd8Ac525IL5Sh2Srj6P+oyWgX44ZzYmYz2ewwcfxpxUewsN1gH1wFIWKMBNe5XclD2lKfqlkG5oUVXRb+cTf9NHOakqH+t5jSXgdk5D/35xscfjxM+TyMqTFVJigZR8Bi+/1pI59TpSU55/dlGEfUvDU+JQ4sEv1mro0iLtwzilKn3qROC2afib8WvS1DNJeQC8EVjKAAPGKnd/i66Punt1tP0k538zDlcI6d5lr0S9nlXE9tr80y37gfubrSrtpGJiz2mOWh8udDrmtC5apYhOgpvcrBogiVLDA3A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7NjX8SCkzfViTzn5JyNACGHWqFlHkV2txgZSx65WU8=;
 b=6PkcomXZNLPBna29U1TmINduR8NRVNXZ3AJHaamKqMVFs/ho0o0/qFmtzQ2DOCeCHF1jItr1X8ea0efCIrp/gLvG5t0iA9F0x4tcTdWwr1pfbE6ydEtcnzI7m0At1a7qfimQTD5BvetvDk23UkS2L7uJFXiY4gHQUDX/KRf2NZU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e21026ccccc410f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9NgHnBfAKMHPNDIENnIL0vlxj0Tlb0UCmiS+A0L58ALEKR1Z3Ef/ta+JZOv+aXG/Lbq0b/iBVc6gkFjwzxjgbGBWlaV6eZqjDyui9JFfS2sm7VtGkno9bBYR2djRVj4iZQIBxtE3srSfafRH/fNjaVRC41kQ/XvjryD4AsWvmCbRcVFjU1J20ZjWMBejDKtCn/GmhWpmvc75KNARw0oKihKz0Q/KVvxH3yu7DX9vobBTm7B+bMTDc+BBBMOy/TATGmCqQSRBxl1+3zvf1Z806zoZxLAxPrx2PcvxLztbcUs4s8O4kTOkE97oPO1+rUMJK6VYdSpg4X7Cqq1dr/TuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7NjX8SCkzfViTzn5JyNACGHWqFlHkV2txgZSx65WU8=;
 b=X0ONsZMvI8zJFyeWDyfbV3a9sF98My8CdZQkh+UGVb0qigDK6rXH4fHHHvQ8MuN1LzWleliZSL6MxnbmBSND6TIe0sA3AkWQiL1rOknjyXpMahqiBqCckPvxfXBiLhqb21Yf1Q5DNgGuohymb4hJdP0TFapTxi/ECLlzUfMI/S6Jb4yKPcF87TtJa6XHr+hf/0cn7zz3q6vVca6urtm/Gbu/8M2MlH8gnG77UnRAVVJkqvrmu6L7Hk8SgNdd8NiEvnVQMHCSurqhSfLn/pLWlFFb9xpVuTmrRJ/gV05q6w3twgeao47BTkCi3PR8iFrOMagG7uDR/8HdkSL4dys3IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7NjX8SCkzfViTzn5JyNACGHWqFlHkV2txgZSx65WU8=;
 b=6PkcomXZNLPBna29U1TmINduR8NRVNXZ3AJHaamKqMVFs/ho0o0/qFmtzQ2DOCeCHF1jItr1X8ea0efCIrp/gLvG5t0iA9F0x4tcTdWwr1pfbE6ydEtcnzI7m0At1a7qfimQTD5BvetvDk23UkS2L7uJFXiY4gHQUDX/KRf2NZU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v2 7/8] xen: Add clang-format configuration
Thread-Topic: [RFC PATCH v2 7/8] xen: Add clang-format configuration
Thread-Index: AQHaC/2DXZmPSKf8g0iXRwPyHo/7ZrBmwPcAgAAqKoA=
Date: Thu, 2 Nov 2023 11:41:55 +0000
Message-ID: <1B8E95BC-1633-4452-BFC3-D7F5C417E7C0@arm.com>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
 <20231031132304.2573924-8-luca.fancellu@arm.com>
 <b0c05564-eadb-5135-b465-e15dec71aa22@suse.com>
In-Reply-To: <b0c05564-eadb-5135-b465-e15dec71aa22@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DU0PR08MB9584:EE_|AMS0EPF000001A3:EE_|DBAPR08MB5670:EE_
X-MS-Office365-Filtering-Correlation-Id: a2895582-c352-4a9b-959b-08dbdb98bc48
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uY6+UKdCdAdPYjDonhmD23UBeuzxpmsTn3D+huI1wAWpP2AA4yBfGWG5nfRmXP4cmFFian7FNCzm/hEFJJ+6VUXGmXALyLYayPvXMGnLrLmoox3VDgciBe93Pj2jdOkgPcqIG1ZXShwYSAUfyVEch+7ZcM+S+orrcgy8q3+LBAEbAm+gcpSeWJiwuHPvQJwoGzqyUnuUmFfgSazG6yIdP7n38NHePRz/g54F/Ti1bqDb0+8okDDzc4MY1QYVjwehg2OLFhVT+6+Hpglq9bmvedg74tTjRF0jEV2fgELsO77gui/5qdFgNJNcYTMWivOXPM2SoLFDyGITO1jZ2jtObl6D4g88L8KHDVGl6iLkdYsoGCIqpQbvQHj/bnXj+yAAwZgWVw2laXtYs1eYVGC0R0bIz7UaR623V74BwZoC6AapV81vyZd5yKFgjagn2cTkXY6Cb5I1OFydZqFxdHaGDLpGtQbvlzAQZdk4iJUy/mgkH66TuxA8mIyk8TSYCHT8gNIMuL/LOCGdTriKSWO8e8rOdX7F2kHABtPkgB8UYuDYkjR1ZnPfRWpP0Nm+j1pFiBg8RpoawbCR6keDnVi64KGkgqaCRfuEzYp6SDd+tcYJdMjYrWhsF8XfiyD4m5so9UUZsfQIab2kbMvoo0JMOG8J1rADwnl94kOKNyttrNE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(376002)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2616005)(26005)(53546011)(6506007)(6512007)(38100700002)(36756003)(33656002)(86362001)(122000001)(38070700009)(83380400001)(2906002)(8676002)(4326008)(8936002)(5660300002)(316002)(6916009)(91956017)(66446008)(54906003)(66946007)(66556008)(64756008)(76116006)(66476007)(478600001)(71200400001)(41300700001)(6486002)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <25EBB6473FE5E0479AFEB2D072D8B52C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9584
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1e43566-9e89-4619-9a9c-08dbdb98b71f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	skODoaj+PnD6+EhAb9+JLX7vcrxo13EsWVGjvLpsjcF3PyO62VS1Prf7A6XqZ50f2yRXrTsi9SZCTiHBhtF4i0TOswGJ1RgPjAhUApQtMj1lRGrwztZCzRynhboWVl5tP7M+co7nitgbBfPg3Qb89QXu1oPiUDwPxDcBvi/K8Fc60Ecm9xwSxen6ZZilSjgM/xQG5OdDMz9SNe5fZubFkOPOraMHmPTn501PU0/FMV/u3FlRj6lSWUcX7EBRFSm8Tnj7d23bWNlkq3geUwFFOJhd5Ug2PNshSdTWL45VQ1EyZxJITRGtiiJUBph6R5GRDRpj991TeqDkwPgOAd742xqEcYZUvYsnYOlm65U5G8BprKYYHa1P8zKsS5PgCBVThxINAnHdkGkM+OzFAzP8ukVEi2KdKzGx1XZdNrh4qPU6tluovwyH5wnZLFMLghp3w78AIefzvby/KxLFlPKFwT6L5Gk+tVvHxgxY4ir1y0Tj6S5+jOoid1uNu9CoApC0ok6HvJaKgsMjoJu40xwJYGH/yUNswDpaHvQ/FJGIGjwP27vn7ah3nHLlp1QRlLcgOstU0Oq/h3LOfFnJ6YVZikSBmgB1ppyXsZETQLsjOACHuwy7AHzA8gQNMAYf2lG4TioetV58V63Opyg7pgLIToCJ+D3/d94UEmpbk1/7fCOORXbQ8RRqiJsHE5J4xZJLG4q0NE+4/6AA8tFOTfQpZx43cp7Bk+dTHPspn/CDi582afy9iZhEZpQ2bcmPGs3wrH4yAZwRBGlQ5ncYwO1vtQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39850400004)(346002)(396003)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799009)(46966006)(40470700004)(36840700001)(6512007)(40460700003)(336012)(2616005)(82740400003)(26005)(966005)(6486002)(5660300002)(4326008)(36756003)(6862004)(8676002)(8936002)(33656002)(2906002)(86362001)(41300700001)(54906003)(70206006)(70586007)(316002)(53546011)(6506007)(478600001)(40480700001)(36860700001)(47076005)(356005)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 11:42:04.2817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2895582-c352-4a9b-959b-08dbdb98bc48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5670

SGkgSmFuLA0KDQo+IE9uIDIgTm92IDIwMjMsIGF0IDA5OjEwLCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMzEuMTAuMjAyMyAxNDoyMywgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+IEFkZCBhIGNsYW5nIGZvcm1hdCBjb25maWd1cmF0aW9uIGZvciB0aGUg
WGVuIEh5cGVydmlzb3IuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgRmFuY2VsbHUgPGx1
Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCj4+IC0tLQ0KPj4geGVuLy5jbGFuZy1mb3JtYXQgfCA2OTMg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gMSBmaWxl
IGNoYW5nZWQsIDY5MyBpbnNlcnRpb25zKCspDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuLy5j
bGFuZy1mb3JtYXQNCj4gDQo+IEkgdGhpbmsgdGhpcyBuZWVkcyBzcGxpdHRpbmcgYW5kIGV2ZXJ5
IHNldHRpbmcgdGhlbiBpbmRpdmlkdWFsbHkgY29ycmVsYXRpbmcNCj4gd2l0aCB3aGF0IHdlIGhh
dmUgaW4gLi9DT0RJTkdfU1RZTEUuIFRoYXQgd291bGQgZW50YWlsIGV4dGVuZGluZyAuL0NPRElO
R19TVFlMRQ0KPiBieSBhbnl0aGluZyBub3QgcHJlc2VudGx5IHdyaXR0ZW4gZG93biwgYnV0IGlu
dGVuZGVkIHRvIGJlIGNoZWNrZWQgZm9yLg0KDQpEbyB5b3UgbWVhbiBpbnRyb2R1Y2luZyBvbmUg
cGFyYW1ldGVyIGZvciBlYWNoIHBhdGNoIHdpdGggdGhlIGNvcnJlc3BvbmRpbmcgZW50cnkgaW4N
CkNPRElOR19TVFlMRT8NCg0KSXQgd291bGQgbWFrZSBzZW5zZSwgaG93ZXZlciB0aGVyZSBhcmUg
MTE2IHBhcmFtZXRlcnMsIGZyb20gdGhvc2UgSSB0aGluayBhdCBsZWFzdCA1NiBuZWVkcw0KdG8g
aGF2ZSBhIGNvcnJlc3BvbmRpbmcgZW50cnkgaW4gQ09ESU5HX1NUWUxFIChtYXliZSBpbiB0aGUg
ZW5kIHRoZXkgd2lsbCBiZSBsZXNzLCBidXQgSSBkb27igJl0IGV4cGVjdA0KdGhlbSB0byBiZSBs
ZXNzIHRoYW4gNDApLCBzbyBnaXZlbiB0aGUgYW1vdW50IG9mIHBhdGNoZXMsIEnigJltIGFmcmFp
ZCB0byBmbG9vZCB0aGUgbWFpbGluZyBsaXN0Lg0KDQpJIHdhcyB0aGlua2luZyB3ZSBjb3VsZCBk
aXNjdXNzIHRoZW0gaW4gY2h1bmtzIGFuZCB1cGRhdGUgdGhlIHNlcmllIGR1cmluZyB0aW1lLCB3
ZSBjb3VsZCBwdXQgaW4gdGhpcw0KcGF0Y2ggYWxzbyB0aGUgdXBkYXRlIHRvIHRoZSBDT0RJTkdf
U1RZTEUgZmlsZS4gU29tZXRoaW5nIGxpa2UgdGhlIE1JU1JBIHJ1bGUgYWNjZXB0YW5jZSwgd2hh
dA0KZG8geW91IHRoaW5rPyBTaGFsbCB3ZSBkbyB0aGUgZGlzY3Vzc2lvbiBieSBNTCBvciBieSBt
ZWV0aW5ncz8gRXZlcnkgdGltZSBJIGNvdWxkIGJyaW5nIHVwIGEgbnVtYmVyDQpvZiBwYXJhbWV0
ZXJzIGFuZCB1cGRhdGUgdGhlIHNlcmllIHdoZW4gdGhlIGRpc2N1c3Npb24gb24gdGhlbSBpcyBm
aW5pc2hlZC4NCg0KDQoNClRoaXMgaXMgbXkgYnJlYWtkb3duOg0KDQoxMTYgdG90YWwgY29uZmln
dXJhYmxlcw0KDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KMTMgc3RyYWlnaHRmb3J3YXJkDQoN
CkF0dHJpYnV0ZU1hY3JvczoNCiAgLVsuLi5dDQoNCkNvbHVtbkxpbWl0OiA4MA0KDQpJbmRlbnRX
aWR0aDogNA0KDQpMYW5ndWFnZTogQ3BwDQoNCk1hY3JvQmxvY2tCZWdpbjogJ15QTEFURk9STV9T
VEFSVHxeRFRfREVWSUNFX1NUQVJUfF5BQ1BJX0RFVklDRV9TVEFSVCcNCg0KTWFjcm9CbG9ja0Vu
ZDogJ15QTEFURk9STV9FTkR8XkRUX0RFVklDRV9FTkR8XkFDUElfREVWSUNFX0VORCcNCg0KU3Rh
bmRhcmQ6IEMrKzAzDQoNClN0YXRlbWVudE1hY3JvczoNCiAgLSBbLi4uXQ0KDQpUYWJXaWR0aDog
NA0KDQpUeXBlbmFtZU1hY3JvczoNCiAgLSAnWEVOX0dVRVNUX0hBTkRMRScNCiAgLSAnWEVOX0dV
RVNUX0hBTkRMRV82NCcNCiAgLSAnWEVOX0dVRVNUX0hBTkRMRV9QQVJBTScNCiAgLSAnRUxGX0hB
TkRMRV9ERUNMJw0KDQpVc2VUYWI6IE5ldmVyDQoNCldoaXRlc3BhY2VTZW5zaXRpdmVNYWNyb3M6
DQogIC0gJ19fc3RyaW5naWZ5Jw0KDQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KNTYgdGhhdCBy
ZXF1aXJlcyBkaXNjdXNzaW9ucw0KDQpRdWFsaWZpZXJBbGlnbm1lbnQ6IEN1c3RvbQ0KUXVhbGlm
aWVyT3JkZXI6IFsnc3RhdGljJywgJ2lubGluZScsICdjb25zdCcsICd2b2xhdGlsZScsICd0eXBl
J10NCg0KQWxpZ25BZnRlck9wZW5CcmFja2V0OiBBbGlnbg0KDQpBbGlnbkFycmF5T2ZTdHJ1Y3R1
cmVzOiBMZWZ0DQoNCkFsaWduQ29uc2VjdXRpdmVBc3NpZ25tZW50czoNCiAgRW5hYmxlZDogZmFs
c2UNCiAgQWNyb3NzRW1wdHlMaW5lczogZmFsc2UNCiAgQWNyb3NzQ29tbWVudHM6IGZhbHNlDQoN
CkFsaWduQ29uc2VjdXRpdmVCaXRGaWVsZHM6IE5vbmUNCg0KQWxpZ25Db25zZWN1dGl2ZURlY2xh
cmF0aW9uczogTm9uZQ0KDQpBbGlnbkNvbnNlY3V0aXZlTWFjcm9zOg0KICBFbmFibGVkOiBmYWxz
ZQ0KICBBY3Jvc3NFbXB0eUxpbmVzOiBmYWxzZQ0KICBBY3Jvc3NDb21tZW50czogZmFsc2UNCg0K
QWxpZ25Fc2NhcGVkTmV3bGluZXM6IFJpZ2h0DQoNCkFsaWduT3BlcmFuZHM6IEFsaWduDQoNCkFs
aWduVHJhaWxpbmdDb21tZW50czogZmFsc2UNCg0KQWxsb3dBbGxBcmd1bWVudHNPbk5leHRMaW5l
OiBmYWxzZQ0KDQpBbGxvd0FsbFBhcmFtZXRlcnNPZkRlY2xhcmF0aW9uT25OZXh0TGluZTogZmFs
c2UNCg0KQWxsb3dTaG9ydEJsb2Nrc09uQVNpbmdsZUxpbmU6IE5ldmVyDQoNCkFsbG93U2hvcnRD
YXNlTGFiZWxzT25BU2luZ2xlTGluZTogZmFsc2UNCg0KQWxsb3dTaG9ydEZ1bmN0aW9uc09uQVNp
bmdsZUxpbmU6IE5vbmUNCg0KQWxsb3dTaG9ydElmU3RhdGVtZW50c09uQVNpbmdsZUxpbmU6IE5l
dmVyDQoNCkFsbG93U2hvcnRMb29wc09uQVNpbmdsZUxpbmU6IGZhbHNlDQoNCkFsd2F5c0JyZWFr
QWZ0ZXJSZXR1cm5UeXBlOiBOb25lDQoNCkFsd2F5c0JyZWFrQmVmb3JlTXVsdGlsaW5lU3RyaW5n
czogZmFsc2UNCg0KQmluUGFja0FyZ3VtZW50czogdHJ1ZQ0KDQpCaW5QYWNrUGFyYW1ldGVyczog
dHJ1ZQ0KDQpCaXRGaWVsZENvbG9uU3BhY2luZzogTm9uZQ0KDQpCcmVha0JlZm9yZUJyYWNlczog
Q3VzdG9tDQpCcmFjZVdyYXBwaW5nOg0KICBBZnRlckNhc2VMYWJlbDogdHJ1ZQ0KICBBZnRlckZ1
bmN0aW9uOiB0cnVlDQogIEJlZm9yZUVsc2U6IHRydWUNCiAgQWZ0ZXJFeHRlcm5CbG9jazogdHJ1
ZQ0KICBBZnRlckVudW06IGZhbHNlDQogIEFmdGVyU3RydWN0OiBmYWxzZQ0KICBBZnRlclVuaW9u
OiBmYWxzZQ0KICBBZnRlckNvbnRyb2xTdGF0ZW1lbnQ6IEFsd2F5cw0KICBCZWZvcmVXaGlsZTog
ZmFsc2UNCiAgSW5kZW50QnJhY2VzOiBmYWxzZQ0KICBTcGxpdEVtcHR5RnVuY3Rpb246IGZhbHNl
DQogIEFmdGVyQ2xhc3M6IGZhbHNlDQogIEFmdGVyTmFtZXNwYWNlOiBmYWxzZQ0KICBBZnRlck9i
akNEZWNsYXJhdGlvbjogZmFsc2UNCiAgQmVmb3JlQ2F0Y2g6IGZhbHNlDQogIEJlZm9yZUxhbWJk
YUJvZHk6IGZhbHNlDQogIFNwbGl0RW1wdHlSZWNvcmQ6IHRydWUNCiAgU3BsaXRFbXB0eU5hbWVz
cGFjZTogdHJ1ZQ0KDQpCcmVha0JlZm9yZUJpbmFyeU9wZXJhdG9yczogTm9uZQ0KDQpCcmVha0Jl
Zm9yZVRlcm5hcnlPcGVyYXRvcnM6IHRydWUNCg0KQnJlYWtTdHJpbmdMaXRlcmFsczogZmFsc2UN
Cg0KSW5jbHVkZUJsb2NrczogUHJlc2VydmUNCg0KSW5kZW50Q2FzZUJsb2NrczogZmFsc2UNCg0K
SW5kZW50Q2FzZUxhYmVsczogZmFsc2UNCg0KSW5kZW50R290b0xhYmVsczogdHJ1ZQ0KDQpJbmRl
bnRQUERpcmVjdGl2ZXM6IE5vbmUNCg0KSW5kZW50V3JhcHBlZEZ1bmN0aW9uTmFtZXM6IGZhbHNl
DQoNCkluc2VydEJyYWNlczogZmFsc2UNCg0KS2VlcEVtcHR5TGluZXNBdFRoZVN0YXJ0T2ZCbG9j
a3M6IGZhbHNlDQoNCk1heEVtcHR5TGluZXNUb0tlZXA6IDENCg0KUG9pbnRlckFsaWdubWVudDog
UmlnaHQNCg0KUFBJbmRlbnRXaWR0aDogLTENCg0KUmVmbG93Q29tbWVudHM6IGZhbHNlDQoNClNl
cGFyYXRlRGVmaW5pdGlvbkJsb2NrczogQWx3YXlzDQoNClNvcnRJbmNsdWRlczogTmV2ZXINCg0K
U3BhY2VBZnRlckNTdHlsZUNhc3Q6IGZhbHNlDQoNClNwYWNlQWZ0ZXJMb2dpY2FsTm90OiBmYWxz
ZQ0KDQpTcGFjZUFyb3VuZFBvaW50ZXJRdWFsaWZpZXJzOiBBZnRlcg0KDQpTcGFjZUJlZm9yZUFz
c2lnbm1lbnRPcGVyYXRvcnM6IHRydWUNCg0KU3BhY2VCZWZvcmVDYXNlQ29sb246IGZhbHNlDQoN
ClNwYWNlQmVmb3JlUGFyZW5zOiBDb250cm9sU3RhdGVtZW50c0V4Y2VwdEZvckVhY2hNYWNyb3MN
Cg0KU3BhY2VCZWZvcmVTcXVhcmVCcmFja2V0czogZmFsc2UNCg0KU3BhY2VJbkVtcHR5UGFyZW50
aGVzZXM6IGZhbHNlDQoNClNwYWNlc0JlZm9yZVRyYWlsaW5nQ29tbWVudHM6IDENCg0KU3BhY2Vz
SW5Db25kaXRpb25hbFN0YXRlbWVudDogdHJ1ZQ0KDQpTcGFjZXNJbkNTdHlsZUNhc3RQYXJlbnRo
ZXNlczogZmFsc2UNCg0KU3BhY2VJbkVtcHR5QmxvY2s6IGZhbHNlDQoNClNwYWNlc0luTGluZUNv
bW1lbnRQcmVmaXg6DQogIE1pbmltdW06IDENCiAgTWF4aW11bTogLTENCg0KU3BhY2VzSW5QYXJl
bnRoZXNlczogZmFsc2UNCg0KU3BhY2VzSW5TcXVhcmVCcmFja2V0czogZmFsc2UNCg0KPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT0NCjEwIGRvbid0IHJlYWxseSBuZWVkIGEgZGlzY3Vzc2lvbg0KDQpQ
ZW5hbHR5QnJlYWtBc3NpZ25tZW50OiAzMA0KDQpQZW5hbHR5QnJlYWtCZWZvcmVGaXJzdENhbGxQ
YXJhbWV0ZXI6IDMwDQoNClBlbmFsdHlCcmVha0NvbW1lbnQ6IDEwDQoNClBlbmFsdHlCcmVha0Zp
cnN0TGVzc0xlc3M6IDANCg0KUGVuYWx0eUJyZWFrT3BlblBhcmVudGhlc2lzOiAxMDANCg0KUGVu
YWx0eUJyZWFrU3RyaW5nOiAxMA0KDQpQZW5hbHR5RXhjZXNzQ2hhcmFjdGVyOiAxMDANCg0KUGVu
YWx0eUluZGVudGVkV2hpdGVzcGFjZTogMA0KDQpQZW5hbHR5UmV0dXJuVHlwZU9uSXRzT3duTGlu
ZTogNjANCg0KQ29tbWVudFByYWdtYXM6ICdeIElXWVUgcHJhZ21hOicNCg0KPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCjM3IG5vbiByZWxhdGVkIHRvIEMgbGFuZ3VhZ2UNCg0KQWx3YXlzQnJlYWtU
ZW1wbGF0ZURlY2xhcmF0aW9uczogZmFsc2UNCg0KQnJlYWtDb25zdHJ1Y3RvckluaXRpYWxpemVy
czogQmVmb3JlQ29tbWENCg0KQWNjZXNzTW9kaWZpZXJPZmZzZXQ6IC00DQoNCkFsbG93U2hvcnRM
YW1iZGFzT25BU2luZ2xlTGluZTogTm9uZQ0KDQpCcmVha0FmdGVySmF2YUZpZWxkQW5ub3RhdGlv
bnM6IGZhbHNlDQoNCkJyZWFrQmVmb3JlQ29uY2VwdERlY2xhcmF0aW9uczogTmV2ZXINCg0KQnJl
YWtJbmhlcml0YW5jZUxpc3Q6IEJlZm9yZUNvbG9uDQoNCkNvbXBhY3ROYW1lc3BhY2VzOiBmYWxz
ZQ0KDQpDb25zdHJ1Y3RvckluaXRpYWxpemVyQWxsT25PbmVMaW5lT3JPbmVQZXJMaW5lOiBmYWxz
ZQ0KDQpDb25zdHJ1Y3RvckluaXRpYWxpemVySW5kZW50V2lkdGg6IDQNCg0KQ3BwMTFCcmFjZWRM
aXN0U3R5bGU6IGZhbHNlDQoNCkVtcHR5TGluZUFmdGVyQWNjZXNzTW9kaWZpZXI6IExlYXZlDQoN
CkVtcHR5TGluZUJlZm9yZUFjY2Vzc01vZGlmaWVyOiBMZWF2ZQ0KDQpGaXhOYW1lc3BhY2VDb21t
ZW50czogZmFsc2UNCg0KSW5kZW50QWNjZXNzTW9kaWZpZXJzOiBmYWxzZQ0KDQpJbmRlbnRSZXF1
aXJlc0NsYXVzZTogZmFsc2UNCg0KSW5zZXJ0VHJhaWxpbmdDb21tYXM6IE5vbmUNCg0KSmF2YVNj
cmlwdFF1b3RlczogTGVhdmUNCg0KSmF2YVNjcmlwdFdyYXBJbXBvcnRzOiB0cnVlDQoNCk5hbWVz
cGFjZUluZGVudGF0aW9uOiBOb25lDQoNCk9iakNCaW5QYWNrUHJvdG9jb2xMaXN0OiBBdXRvDQoN
Ck9iakNCbG9ja0luZGVudFdpZHRoOiA0DQoNCk9iakNCcmVha0JlZm9yZU5lc3RlZEJsb2NrUGFy
YW06IGZhbHNlDQoNCk9iakNTcGFjZUFmdGVyUHJvcGVydHk6IHRydWUNCg0KT2JqQ1NwYWNlQmVm
b3JlUHJvdG9jb2xMaXN0OiB0cnVlDQoNClBhY2tDb25zdHJ1Y3RvckluaXRpYWxpemVyczogTmV2
ZXINCg0KUGVuYWx0eUJyZWFrVGVtcGxhdGVEZWNsYXJhdGlvbjogMA0KDQpSZWZlcmVuY2VBbGln
bm1lbnQ6IFJpZ2h0DQoNClNvcnRVc2luZ0RlY2xhcmF0aW9uczogZmFsc2UNCg0KU3BhY2VBZnRl
clRlbXBsYXRlS2V5d29yZDogdHJ1ZQ0KDQpTcGFjZUJlZm9yZUNwcDExQnJhY2VkTGlzdDogZmFs
c2UNCg0KU3BhY2VCZWZvcmVDdG9ySW5pdGlhbGl6ZXJDb2xvbjogZmFsc2UNCg0KU3BhY2VCZWZv
cmVJbmhlcml0YW5jZUNvbG9uOiB0cnVlDQoNClNwYWNlc0luQW5nbGVzOiBmYWxzZQ0KDQpTcGFj
ZXNJbkNvbnRhaW5lckxpdGVyYWxzOiBmYWxzZQ0KDQpTcGFjZUJlZm9yZVJhbmdlQmFzZWRGb3JM
b29wQ29sb246IHRydWUNCg0KSW5kZW50RXh0ZXJuQmxvY2s6IE5vSW5kZW50DQoNCj4gDQo+PiAt
LS0gL2Rldi9udWxsDQo+PiArKysgYi94ZW4vLmNsYW5nLWZvcm1hdA0KPj4gQEAgLTAsMCArMSw2
OTMgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkNCj4+ICsj
DQo+PiArIyBjbGFuZy1mb3JtYXQgY29uZmlndXJhdGlvbiBmaWxlLiBJbnRlbmRlZCBmb3IgY2xh
bmctZm9ybWF0ID49IDE1Lg0KPj4gKyMNCj4+ICsjIEZvciBtb3JlIGluZm9ybWF0aW9uLCBzZWU6
DQo+PiArIw0KPj4gKyMgICBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvY2xhbmctZm9ybWF0LnJzdA0K
Pj4gKyMgICBodHRwczovL2NsYW5nLmxsdm0ub3JnL2RvY3MvQ2xhbmdGb3JtYXQuaHRtbA0KPj4g
KyMgICBodHRwczovL2NsYW5nLmxsdm0ub3JnL2RvY3MvQ2xhbmdGb3JtYXRTdHlsZU9wdGlvbnMu
aHRtbA0KPiANCj4gLi4uIHBvaW50aW5nIHRvIGZ1cnRoZXIgZG9jIGlzIGhlbHBmdWwgaW4gZ2Vu
ZXJhbCwgYnV0IGltbyBpbnN1ZmZpY2llbnQgZm9yDQo+IHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhl
IHZhcmlvdXMgc2V0dGluZ3MuDQoNClllcyBJIHJlYWxpc2Ugbm93IHRoYXQgSeKAmXZlIGNvcGll
ZCB0aGlzIGZyb20gTGludXggYW5kIEkgc2hvdWxkIGhhdmUgZHJvcHBlZCBhdCBsZWFzdA0KdGhl
IGxpbmUgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2NsYW5nLWZvcm1hdC5yc3QgYW5kIGh0dHBzOi8v
Y2xhbmcubGx2bS5vcmcvZG9jcy9DbGFuZ0Zvcm1hdC5odG1sLg0KVGhlIGxpbmUgaHR0cHM6Ly9j
bGFuZy5sbHZtLm9yZy9kb2NzL0NsYW5nRm9ybWF0U3R5bGVPcHRpb25zLmh0bWwgSSB0aGluayBt
YWtlcyBzZW5zZQ0KYmVjYXVzZSBpdOKAmXMgYSBkb2N1bWVudGF0aW9uIHRvIHRoZSBjbGFuZy1m
b3JtYXQgcGFyYW1ldGVyIHByZXNlbnQgaW4gdGhlIGZpbGUuDQoNClRoYW5rcyBmb3IgeW91ciBy
ZXZpZXcuDQoNCkNoZWVycywNCkx1Y2ENCg0K

