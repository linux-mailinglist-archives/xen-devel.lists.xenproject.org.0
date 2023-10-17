Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9936E7CB7BA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 03:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617960.961123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYRW-0002wt-Op; Tue, 17 Oct 2023 01:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617960.961123; Tue, 17 Oct 2023 01:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsYRW-0002rA-LQ; Tue, 17 Oct 2023 01:00:18 +0000
Received: by outflank-mailman (input) for mailman id 617960;
 Tue, 17 Oct 2023 01:00:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qhkS=F7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qsYRV-0002Vw-MR
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 01:00:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 886fdccf-6c88-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 03:00:15 +0200 (CEST)
Received: from DUZP191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::8) by
 AM9PR08MB6019.eurprd08.prod.outlook.com (2603:10a6:20b:2da::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.34; Tue, 17 Oct 2023 01:00:11 +0000
Received: from DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4f8:cafe::be) by DUZP191CA0048.outlook.office365.com
 (2603:10a6:10:4f8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34 via Frontend
 Transport; Tue, 17 Oct 2023 01:00:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT003.mail.protection.outlook.com (100.127.142.89) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 01:00:10 +0000
Received: ("Tessian outbound 6d14f3380669:v211");
 Tue, 17 Oct 2023 01:00:10 +0000
Received: from 310385ba5b92.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 16FD52E7-63E3-46DA-8A50-D76D5D6A90C0.1; 
 Tue, 17 Oct 2023 01:00:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 310385ba5b92.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 17 Oct 2023 01:00:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB8405.eurprd08.prod.outlook.com (2603:10a6:20b:558::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 01:00:02 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::e1f8:1b40:67d1:6f41%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 01:00:02 +0000
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
X-Inumbo-ID: 886fdccf-6c88-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZNQ+C/iNvo0PqydzP2mEbiPdg73nPbPcmlonhX1kKE=;
 b=AAXRnwO4ToRWpwSfQL6MCP/J92tR+ErbCs4uIVdO+AJ97C3Zlv9o9mDDewT6h0h9pnDwHyTB3OP9r72gpcvMtJ8QGbvHK2JP37YMKuFjpPju7PoLoN1VyG4MgfGmkL6wgSL9wacKffooFneRbdpzAdeDX36BTRjjIMUzjiNQqp4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c59971aa749a35d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvKeGiHuacbzEvZZj/pN2H/iiSFdiqRAnT+KgC6lkYW2uLvc0MBfqZgk8DS5s3df8ud0upz8aZnx03KJ0vW9R8v76ungiIExufpxjfejerqAXlzAWAVRaHU+rjmVYi9R+iPfjj2EwXCiGyVUmYO2uohH09wmsCThbSFGmsqnv5HiXs46yjave2TOFFUSkSYt7vxRXaZlegv0v909B+NHSiyjjG4ydLFeC5RL12capwbmtHWy9VypdOtlmOFdDRWKj9I86lYD+3w5uva2b9TOv8wRUh+Uc/ncvIDsi68wkm4Ur0A32/X27llAJRffC+VIQxrV2Ajwva/bjWpW2//fjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZNQ+C/iNvo0PqydzP2mEbiPdg73nPbPcmlonhX1kKE=;
 b=d9G70tGBgc4JcIV27vA7FmYqSGBNQYT1Ib+dmf6k5JztB7a67BYgF9q4ntC0zsP9G4WtXmF61y3mk2eNR6bZNwJrmjlT5btx/lPp+QNNBefDNdx+fhiYzY0KQo2xnKWZDT0KlpC4yNGQw//88y2qU8Nzf4ZdntaTNHbgcWEV9iZoJyCsCo2eCVuovW3yM/vS2iwsXr6vN5l4unE76VVP/ZX8u43bRQWZrlHc8ySIJaZMULxIlbmkueX94AvKwI0W+I7ovg+Bt2rNDfEWPkFNSU3GV+XBDEFPl3XXe4IJ1DFDwT8Au0/rLxpLrRuA9dyjK6LnkWZWjw80y/VsyCgwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZNQ+C/iNvo0PqydzP2mEbiPdg73nPbPcmlonhX1kKE=;
 b=AAXRnwO4ToRWpwSfQL6MCP/J92tR+ErbCs4uIVdO+AJ97C3Zlv9o9mDDewT6h0h9pnDwHyTB3OP9r72gpcvMtJ8QGbvHK2JP37YMKuFjpPju7PoLoN1VyG4MgfGmkL6wgSL9wacKffooFneRbdpzAdeDX36BTRjjIMUzjiNQqp4=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Federico Serafini <federico.serafini@bugseng.com>, Xen-devel
	<xen-devel@lists.xenproject.org>, "consulting@bugseng.com"
	<consulting@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] x86/paging: address a violation of MISRA C:2012 Rule
 8.3
Thread-Topic: [XEN PATCH] x86/paging: address a violation of MISRA C:2012 Rule
 8.3
Thread-Index: AQHZ9Ta/NlvugOvKeE2dpjYrdI/xh7A3GhEAgAAZ7QCAFWfTgIAApDaA
Date: Tue, 17 Oct 2023 01:00:01 +0000
Message-ID: <B209AFD3-2295-4DF2-86CC-BBCE0D0BD067@arm.com>
References:
 <5a304ffd4fbdd0d5809dc68b857410bbc02f32a0.1696252375.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2310021546070.2348112@ubuntu-linux-20-04-desktop>
 <3D657AA0-676B-4681-B980-26BCCC98B092@arm.com>
 <0ee1b2df-25eb-fc57-3d44-7de0e9cef478@suse.com>
In-Reply-To: <0ee1b2df-25eb-fc57-3d44-7de0e9cef478@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB8405:EE_|DBAEUR03FT003:EE_|AM9PR08MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 685aa3e5-4bca-454c-f0d5-08dbceac69c7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xxjthwrEsLEsZN8YKWl9oDb0KwVyd9tDYkVzqOF3NWApcrar9ltVp6KOqydOhjIQ/aSobnKYhM9mnWSPnk24dMpoUoIFjFQWt4QFJjwyUIHeLXKmzNw+z9Al18VQqrBLN/oHcuRdRKVCbq+9WbJULDO49pdcaDOkZfuppNc9vGBDyiGwHYep626T9xvQ0LoNXuh3eH25TVNIuNvOPoPnwvIoVQo+N7n7Emlq9Zp+VWAfev7TKmNt4RO537Vorqt/UBSX8I9GoBBv1N6pYfFWyKc65LOlva1+byGonIzkCz3o0P8OfzjHTNYCLt2ftOgz+NCLJ11Nk3U9vO1Zs/AqHQB4qRgeFpxRbKNAF7mCUDMSbfqncQQTFFijqGQwQG6tG+U/elDWb+DGQFsR+7AJboFO9njb8pWSzrO7dvDvFRi2/W5DY7EDtxiisXj1wftvlgcw500ALNMCIGs3nUtw01PK3mPvxjh6YjnQu2fvU+uYKlYCta5RYQdHbq8ryr88CCy8+8F2fH4ktiF+ltjLpaC/OHE7zk2vRFKtdABMJoxEQFtYjjd4MNeJEI9eiS20P1oIFa+CJua8P2SFGAeIIr99jLCd+xFYqm/9VMiE4etK3VWy2+MVqYBIoC1PDuaQr43kpeOGbyUe/n+DSj03+Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(346002)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(478600001)(6486002)(91956017)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(54906003)(71200400001)(6916009)(83380400001)(86362001)(38100700002)(2616005)(6512007)(26005)(53546011)(6506007)(33656002)(38070700005)(41300700001)(36756003)(122000001)(5660300002)(8936002)(4326008)(316002)(2906002)(4744005)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B3700E8787785643B51217CC94F9680E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8405
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	566f9d18-73f2-488d-0ef2-08dbceac6490
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FF7BFa2l4QYBtPhNc9RiganZL/QSpFV7KcoROJxoTwO8JGlCPJNqh2UlA0FAbKZV7huBuInVtCnhvnl/s+WwYueRJCAvBpAx5SI8kAhW3wTjr9Q4/XftRqUeI5ZJ9jtUNmFANw/XIoG8IqnwpTQ0bJs/45Xx0n0DZNsPpCY6tD8bUKRaV8UEIR4AODEwd2xQcIRIVek9C3bsY8eEt9HiRPLK1fgl8QqVzvm3Jr8vLp+gzk6z7U1Jh+oRvUEfOUIpRzwpLvYXGXcwaig0iOfO8Scn5OB00SebBI6Vir4u72DF2rkw/54Von9Ta01eoUaOkxnwRgsR/AkIo9OQFxTaIw0VQvBHHSmUj4W1oW3ZdEAqPSJvhdZeFJQ5B7ijBYcQc+2MB2LAjTgCvp9c5Gx6hqOtap4sDdEPyW+pxJKl6bfKu4o2/51DTBQeRux/aPtHqFuumcV62NEgHBaxoJ8nmWpJuQ2omoFATMYhNoeLYcvB7c3wJx2k/aoJXS9dYTbMQjjm+DiUydqWqCe4u6NPn8h2v4qmfmwxqjutKSBrRzlHPnKgzyVV1Dw5a5H9woNOh1WzEwZXbeKg+E9Q2AXu6QiidtLT3/EkKYdJKHBA7WMgrpVuGuzNF9AUvCvnrDSWTbPmcZC3B5TElk2bEqvn8M5OvKbFEy+Mf7sjKEh5MQG8jx7y6NTzC9S+KmubHACvu6UnuAgPolwnSrDq/ONX5nPKt3UfNgo1ZUwBAFwiFnWlFcvh5HNwnaUhkUcBsLS8
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(36840700001)(40470700004)(46966006)(40460700003)(107886003)(2616005)(336012)(26005)(6506007)(6512007)(53546011)(36860700001)(83380400001)(47076005)(41300700001)(4326008)(6862004)(5660300002)(8676002)(2906002)(478600001)(6486002)(8936002)(70206006)(70586007)(316002)(54906003)(82740400003)(356005)(81166007)(86362001)(36756003)(40480700001)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 01:00:10.7152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 685aa3e5-4bca-454c-f0d5-08dbceac69c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6019

SGkgSmFuLA0KDQo+IE9uIE9jdCAxNiwgMjAyMywgYXQgMjM6MTIsIEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMy4xMC4yMDIzIDAyOjE5LCBIZW5yeSBX
YW5nIHdyb3RlOg0KPj4+IE9uIE9jdCAzLCAyMDIzLCBhdCAwNjo0NiwgU3RlZmFubyBTdGFiZWxs
aW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90ZToNCj4+PiANCj4+PiBPbiBNb24sIDIg
T2N0IDIwMjMsIEZlZGVyaWNvIFNlcmFmaW5pIHdyb3RlOg0KPj4+PiBNYWtlIGZ1bmN0aW9uIGRl
Y2xhcmF0aW9uIGFuZCBkZWZpbml0aW9uIGNvbnNpc3RlbnQuDQo+Pj4+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlLg0KPj4+PiANCj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVkZXJpY28gU2VyYWZpbmkgPGZl
ZGVyaWNvLnNlcmFmaW5pQGJ1Z3NlbmcuY29tPg0KPj4+IA0KPj4+IFJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+PiANCj4+IFJlbGVhc2Ut
YWNrZWQtYnk6IEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbT4NCj4gDQo+IFdlJ3JlIHBh
c3QgUkMzLCBzbyBJJ2QgbGlrZSB0byBjb25maXJtIHdoZXRoZXIgdGhpcyBzdGlsbCBob2xkcy4N
Cg0KVGhhbmtzIGZvciByZWFjaGluZyBvdXQuIEFsdGhvdWdoIHdlIHJlYWNoZWQgYW4gYWdyZWVt
ZW50IHRoYXQgd2UgbmVlZCBhIGNhc2UNCmJ5IGNhc2UgYW5hbHlzaXMgZm9yIGlmIG1lcmdpbmcg
TUlTUkEgcGF0Y2hlcyBvciBub3QgdG8gNC4xOCwgYW5kIHRlY2huaWNhbGx5IE1JU1JBDQpwYXRj
aGVzIHNob3VsZCBiZSBjb21taXR0ZWQgYnkgUkMyLCB0byBiZSBob25lc3QgZm9yIHN1Y2ggYSBz
aW1wbGUgcGF0Y2ggSSBhbSBub3QNCmdvaW5nIHRvIGJsb2NrIGl0IGJlY2F1c2UgSSByZWFsbHkg
ZG9u4oCZdCB0aGluayBpdCB3aWxsIGNhdXNlIGEgYmVoYXZpb3JhbCBjaGFuZ2UsIHNvDQp5ZXMg
bXkgcmVsZWFzZS1hY2sgdGFnIHN0aWxsIGhvbGRzLiBGZWVsIGZyZWUgdG8gY29tbWl0IGl0Lg0K
DQpLaW5kIHJlZ2FyZHMsDQpIZW5yeSANCg0KDQo+IA0KPiBKYW4NCg0K

