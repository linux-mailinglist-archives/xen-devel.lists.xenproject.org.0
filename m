Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2478A40B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 03:54:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591347.923726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaRRn-00038I-QC; Mon, 28 Aug 2023 01:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591347.923726; Mon, 28 Aug 2023 01:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaRRn-00035X-NG; Mon, 28 Aug 2023 01:53:43 +0000
Received: by outflank-mailman (input) for mailman id 591347;
 Mon, 28 Aug 2023 01:53:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwb3=EN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qaRRm-00035R-1Q
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 01:53:42 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4f2ad63-4545-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 03:53:39 +0200 (CEST)
Received: from AM0PR06CA0109.eurprd06.prod.outlook.com (2603:10a6:208:ab::14)
 by PR3PR08MB5753.eurprd08.prod.outlook.com (2603:10a6:102:87::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 01:53:31 +0000
Received: from AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:ab:cafe::7c) by AM0PR06CA0109.outlook.office365.com
 (2603:10a6:208:ab::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 01:53:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT061.mail.protection.outlook.com (100.127.140.72) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.16 via Frontend Transport; Mon, 28 Aug 2023 01:53:30 +0000
Received: ("Tessian outbound c99fbc01d472:v175");
 Mon, 28 Aug 2023 01:53:30 +0000
Received: from e3e227bf4620.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DDF665C1-EBBD-4634-9182-245916FBD398.1; 
 Mon, 28 Aug 2023 01:53:19 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3e227bf4620.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Aug 2023 01:53:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5724.eurprd08.prod.outlook.com (2603:10a6:102:85::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 01:53:15 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 01:53:15 +0000
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
X-Inumbo-ID: b4f2ad63-4545-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suUPsCTViDXtxAyymCfoXUkrtE0Idkgmt9/T8BonYXg=;
 b=tZz7N5Zulf2+Jy9TzYkiVaP9kLAuRleN0rFHU7vygN4Wd3AMYDMGThecQmGMXHWyf2yVKYoOheQ2HhEM5WmusyMXkZGz2PFjjasNHK6iQwlf7kxydgtlsDlUTw/5jTZ+C5ldHvgPaWKCvzj+jS1V1whj3NWNld1gwXCFbHxbUIE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5157047afbbfeb11
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QB2fK0TCqO/GBDkPKkUWMfZ9ke49BBIcLfY7XHzjXmO/XnvdY3shA2Ape0yNWwAZSMvFTZlbg+nCbocFHi6KAFVyFGspNgaFNtz3DeYoC5CVxT1NhkfNHjgft5v8VbvSlv1NTA5grzC8cX5qXv+K0dgAQ/NVYoCmp8XAA7pwyotuQVPNSV0MjSS8Eao7aFlc39GNPb6m6P+hawqiQ9PackL9osEXj1GAf+GuKjYicArBG1ERNYb3S6hLD3B7bd/qDNZyLBoacwQNliyuDHoyfwQVz3mFwW8z4woXLAx3B0hC9amgQpDWTGUpLJ5jRjK7EWgOszJZTj0Hpq3CDOSaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suUPsCTViDXtxAyymCfoXUkrtE0Idkgmt9/T8BonYXg=;
 b=MrFNubq9atzMsSh2D+wgqpxfGreiyp+9VEbcxUjyJRa4E+PHIcnRpW9VOkce7W8GvipkaCFDdS0OO3Y0k55a0lCMg9eBVMuazqttuUxjPzgLEI4Vq1OMyQ5OZofxapFhGux+ZCNYZteI0lUSbx7BDdpgnRyX087V6OXMsWKy3i+2qZzv1QbKVwTGpwTyY6DHS7LijSoHcmkdYih3AHR+FCXZP48WQpoQMpyKFht3iXgRneZXbEZ8P3AGxhg9THJVX1w4jl+y4Ci9728MrGWrH4F3H3VC/pwNShUXkx3GCzJbbU9IyLpenWwE+KNABL033e32q1aMB2cBREmpLaJaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suUPsCTViDXtxAyymCfoXUkrtE0Idkgmt9/T8BonYXg=;
 b=tZz7N5Zulf2+Jy9TzYkiVaP9kLAuRleN0rFHU7vygN4Wd3AMYDMGThecQmGMXHWyf2yVKYoOheQ2HhEM5WmusyMXkZGz2PFjjasNHK6iQwlf7kxydgtlsDlUTw/5jTZ+C5ldHvgPaWKCvzj+jS1V1whj3NWNld1gwXCFbHxbUIE=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH v10 03/20] xen/arm/device: Remove __init from
 function type
Thread-Topic: [XEN][PATCH v10 03/20] xen/arm/device: Remove __init from
 function type
Thread-Index: AQHZ1yqggX5G5+V08E6Qji7ACNl+qa/+9m4A
Date: Mon, 28 Aug 2023 01:53:15 +0000
Message-ID: <2A11B6BD-60C3-49A6-9680-084E41EBCB6D@arm.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-4-vikram.garhwal@amd.com>
In-Reply-To: <20230825080222.14247-4-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5724:EE_|AM7EUR03FT061:EE_|PR3PR08MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b6d55a-677a-499a-8c7f-08dba7699433
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Lb3k/s8QBLOE7paK5GWllRpAWbl93Hd+zR+Rb2540oUHoR8vhckKf0D11iPIJGJf8Xi+S+TCLzrtOw0qsRyv1pIhgSVEfEtysiQH1TKttNPhcHnqvbuza74k4pomoMg6AH2ceKzS19Cl+0I8uzkIDMI5FLQQMx3VNXeHlPc+6X4KDwsZD/zMb0nWDnrQgdOm04GpEssCrkJOVvvf7jeFqnmVFMBDQKJfiBguQl1jCV1Fz54sfvBpRHF7hIlHPrIl5gJpVDeiv+7OdDf0lNqmJCbZvqjo3Wgrn3wIJ5fbOo9XbSc2IXPF8ZcVZJqqdojCiYhh2WhXQR6Pu2TU3i1p7Nf8Pccvo8BsZzicvzJj0JF6cFEko+DmBxA3NRuNDSUqau5jn3QO7f6dFRaDC8UGwFu+ss16dmYcfSzLL3yYvrWR8R5R50Bkn0mPRWCdFkxr/UwcTlQH+nBu336U+YFgIseVnQXXhcgCF2KOYbY3o2N+oFzsY+LPsZ1XEEsn5zatapQpVNCRgiD1PNuZhwWCB9e677dCmASVI+mVP2fBnypc1BEnSzDQo1eBwp8dw85zvv8+LULvTjY6+hKblj3zv8M18upkuwy8g8Cva/Lm6RaVRig515AxoZNgzl4a63jZM91cjrNpJRXfgnxX7m16ww==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(39860400002)(346002)(396003)(186009)(1800799009)(451199024)(71200400001)(6506007)(6486002)(53546011)(2616005)(966005)(4744005)(26005)(2906002)(478600001)(6916009)(6512007)(66556008)(316002)(64756008)(54906003)(66446008)(8676002)(76116006)(66946007)(5660300002)(66476007)(8936002)(91956017)(4326008)(33656002)(86362001)(36756003)(41300700001)(38100700002)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D336D50E664AA448A19A7ABE7A9075DB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5724
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	af9a038f-b657-431b-b5a4-08dba7698b2e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ttiPTi0KEdZE4Plf18WPRKUyKRMbiWMNeuITqh/5x3qahH2tXaFaK/QpbtyRIMomsbnLmekmbasIAFD2eJKioWJpKJIAbjHSc5nEr+WyIUEm+h0FCrKYAMNvVr1sTFRtkPp/x5/Gnmi0mIbNQweAZpzpb84FeI7Itzy7cdasjqTvnRl0MjFLsRccRmfWjMWq8kSWKK9jpOTC5IvACgNQfsQJk2MQFZ8NnWai/3P0n1C4cU2g+ndhLexFt3veKiZ5kuJQ3icgRTZYqncs3XGLmvLZ0P9onLL9kYWOTtlozYoH+gzl3eT3TxHvdQzwzUiW8RhgdMseihd7lWzMa1IfPHn9QFc1JKUhZYKdnIki031vOQJNmfJS98Agz5PilWuCNy/pgI4cvAbrUhfV5ASTMx17EcmR8yn8jL23lKGvfRX+XvlBTu6zV3pR4jgBrkYEjYLxquNLP02y8eqQghaLGoU6qSVXkHGWsbAyBab5cdlssvDDVR5ePR68hguixSOJd4oGgLgh4aS4GFHbASzGJRsCgIxKHAdEqAvVo02gB+ODWA/VzfEPBSZADGLxjARtk1U3+bZjXR/qnuu9nJfpJe7JOcWbeNWcQYofXQLpNLIX50Yd7t43PpumhUDcqfxBCda/DVP2uE7OfxjyYyzS8440/YikUo9rGbbg0/EhCTu/mAYLTNQhh75lpWC1pTMqCspcXYy6LSwd04/bEWzSag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199024)(1800799009)(82310400011)(186009)(36840700001)(46966006)(478600001)(356005)(81166007)(966005)(82740400003)(26005)(336012)(47076005)(36860700001)(6486002)(2616005)(107886003)(40480700001)(53546011)(6506007)(6512007)(5660300002)(86362001)(2906002)(33656002)(4744005)(6862004)(316002)(4326008)(70206006)(54906003)(70586007)(41300700001)(36756003)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 01:53:30.2243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b6d55a-677a-499a-8c7f-08dba7699433
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5753

SGkgVmlrcmFtLA0KDQo+IE9uIEF1ZyAyNSwgMjAyMywgYXQgMTY6MDIsIFZpa3JhbSBHYXJod2Fs
IDx2aWtyYW0uZ2FyaHdhbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+ICsNCj4gKy8qDQo+ICsgKiBo
YW5kbGVfZGV2aWNlX2ludGVycnVwdHMgcmV0cmlldmVzIHRoZSBpbnRlcnJ1cHRzIGNvbmZpZ3Vy
YXRpb24gZnJvbQ0KPiArICogYSBkZXZpY2UgdHJlZSBub2RlIGFuZCBtYXBzIHRob3NlIGludGVy
cnVwdHMgdG8gdGhlIHRhcmdldCBkb21haW4uDQo+ICsgKg0KPiArICogUmV0dXJuczoNCj4gKyAq
ICAgPCAwIGVycm9yDQo+ICsgKiAgIDAgICBzdWNjZXNzDQo+ICsgKi8NCj4gK2ludCBoYW5kbGVf
ZGV2aWNlX2ludGVycnVwdHMoc3RydWN0IGRvbWFpbiAqZCwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsDQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGJvb2wgbmVlZF9tYXBwaW5nKQ0KDQpJIHRoaW5rIHlvdSBtaXNzZWQg
b25lIG9mIEp1bGllbuKAmXMgY29tbWVudCBpbiB2OSB0aGF0IHRoaXMgZnVuY3Rpb24gaXMNCnN1
Z2dlc3RlZCB0byBiZSByZW5hbWVkIHRvICJtYXBfZGV2aWNlX2lycXNfdG9fZG9tYWluIiBbMV0u
DQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvNTkwOGI2MzgtZjQzNi00
MDYwLWE0MjYtOTgzOWZjNTYzYzYzQHhlbi5vcmcvDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoN
Cg==

