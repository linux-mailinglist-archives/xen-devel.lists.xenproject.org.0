Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAC2819B9A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657562.1026479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFt7Z-0000ec-Cx; Wed, 20 Dec 2023 09:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657562.1026479; Wed, 20 Dec 2023 09:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFt7Z-0000bj-99; Wed, 20 Dec 2023 09:44:09 +0000
Received: by outflank-mailman (input) for mailman id 657562;
 Wed, 20 Dec 2023 09:44:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KgnP=H7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1rFt7Y-0000Ss-Gc
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:44:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51b12c8b-9f1c-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:44:07 +0100 (CET)
Received: from DU2PR04CA0332.eurprd04.prod.outlook.com (2603:10a6:10:2b4::20)
 by PAVPR08MB8822.eurprd08.prod.outlook.com (2603:10a6:102:2ff::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.36; Wed, 20 Dec
 2023 09:44:04 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::2e) by DU2PR04CA0332.outlook.office365.com
 (2603:10a6:10:2b4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 09:44:04 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 09:44:04 +0000
Received: ("Tessian outbound 385ad2f98d71:v228");
 Wed, 20 Dec 2023 09:44:03 +0000
Received: from 4ef01deac82f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9205073-64A4-4A65-BA05-C0D3A85BAAD6.1; 
 Wed, 20 Dec 2023 09:43:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ef01deac82f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 20 Dec 2023 09:43:53 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by DU5PR08MB10657.eurprd08.prod.outlook.com (2603:10a6:10:51f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 09:43:50 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::ab65:955d:ff82:80e%3]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 09:43:50 +0000
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
X-Inumbo-ID: 51b12c8b-9f1c-11ee-98eb-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eIsiqRQyjHxn6VvOmQHv/cMURrYHMCubejA4X+4WvpKltkLlXf1Ckkm88QLAllRnB7jnKJpwj5k4z5ZYMuzu1XnJAc8cECQxgFdjpDusjGtF+4YYDOPNVt3HGCu1gR+mcFzG2WRabXxvbrs/6g0SZ02GLrVIqyXih0gdnGk5iOnw+iVtdJmLGyCDV3DlHDsa/m1KgwRv+lmxGTo6nepiEh7QEG98URJ/TuQvBqJ2HldKrwM/nJk3HSsYKOwKOXnYnrLnem+UBfG1txo5bOqSWGKCMhQ96+a+BODgfHZvXjOQo3kKxZtG6eMCj7bYe4MozP5UmLLpYfIIrKYDR7TFBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1R1e2KVCZufzrdc9uuRCntOMeYjLt63btfagz1c7mA=;
 b=QSnrphnOZoxYfCsiEzmTUSyTi3ZeAZISiWpo0V7pXB3bz8xB/e+2DCU5I4hfvQ2vAxi14bNG9AeyF4kWKcdCdFfterfQmmF65k17bIORjSxbk84NTaS/f5aXKcCDQna6PGJxd7pFXSrC/juPLTBniri+/xRPJfBIeAFNKwzojba/1SE5/LW/FDm4ZZp+U5vy5mhbsv0J4rIySomUVEVAYAznhj6GmEzKMs/YLtiNsa3WOgdd/LQ5e9fdC+GZQmaNxAXUSEm9DoifbTmJvc7RKe4aKKejH3IHUT0F8wRQqkYOaVEYeGsnU3pPMrmZ8dU5ASZsDKYxz1jKr5vwfcf1+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1R1e2KVCZufzrdc9uuRCntOMeYjLt63btfagz1c7mA=;
 b=KJt3cdPXMJIQ3Wthq4k/6kZhDiEOf9YswqwctpJZBHsvG7620/hYcDPlqq4z6dS142LWPv404b2VHKBGC21ZATzOU2WvZp9t4lOjtslnRXczcPTmL89cjCG3W5zI0FgW9Q3qarwc2W8V7flpaHzPu4JCshzSL+uGr4bLztkDW5M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a391aa585ffd153e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWhFPLvltNNX6Pomj3dBRa2JIH29n/NjQtd21gt2dKu+5ywj8NwVQHz0tkxKRxHVm9GYpgec2n06NawRJCFS0brFzGc0etG3oumXou4ac3qZ1cOE4H9kzrM0BRpV4xZOHZgJW8GJGR33QoOzTd2E5BI7Rw0OKEaGmPGFIj3YJ3jD//2L3PyyV4f//T3OjfoAzz2SEesnuSzQZxVFD/Uo20qH2VM7WzJhkaABFyzF8TJOTSi+mUdqBQUCqhMbNkK1B+GZLRU/JPY35/g1UNYSjT2RxIBkDCsEFEwKhPhqaANrQLlEqBEqtyqwa82p4CLC71XtWwAVs0hLSktaTUnA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1R1e2KVCZufzrdc9uuRCntOMeYjLt63btfagz1c7mA=;
 b=ADKub6jVF/SBZEXmE+c0xi8aotddKJmKtt70B1cgioL81XpinGsOyG2p6KpuD209luownRj2dv9dx0+cYY+U7pSzVV2G0c5luz9WG9cjL0mpfX/kqFFQ8t+3+E2EMR2D/HFoLmYjy86Z2UYK8atxjMX1vYEyxchhC64yp9p89bVzEOuOymXtAQuM2WVrSN0vb2sabLPepT/IjvL3jYyNaDriNfPBi3EK+h4JBet/IiYsf+i0CPO6jq+ulg+romR6jOrFVCodz6p0O9z3E4EzrvfBBYoEMJRaNrL/eMXuQz5LpBP+3VZqKnzkMSiVpMlDnA//LmtxBrPyLpPyPBE4bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1R1e2KVCZufzrdc9uuRCntOMeYjLt63btfagz1c7mA=;
 b=KJt3cdPXMJIQ3Wthq4k/6kZhDiEOf9YswqwctpJZBHsvG7620/hYcDPlqq4z6dS142LWPv404b2VHKBGC21ZATzOU2WvZp9t4lOjtslnRXczcPTmL89cjCG3W5zI0FgW9Q3qarwc2W8V7flpaHzPu4JCshzSL+uGr4bLztkDW5M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, "stefano.stabellini@amd.com"
	<stefano.stabellini@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Thread-Topic: [PATCH v2 0/3] xen/arm: Add emulation of Debug Data Transfer
 Registers
Thread-Index: AQHaMfEa7o9h58xZgUaSJIw5Lcks+LCx6kEAgAAD4AA=
Date: Wed, 20 Dec 2023 09:43:49 +0000
Message-ID: <5E9E5368-8AD3-490E-8034-78F5BAF23006@arm.com>
References: <20231218202959.1390114-1-ayan.kumar.halder@amd.com>
 <F1A640BE-0CDC-4026-BBB3-637ABE7D996C@arm.com>
In-Reply-To: <F1A640BE-0CDC-4026-BBB3-637ABE7D996C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|DU5PR08MB10657:EE_|DU6PEPF0000B61C:EE_|PAVPR08MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: f84140fe-7b33-457b-478e-08dc014033ea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B+lAbNgfasiKiTIYZsiBgYtFxTqRlruwnoH3V6m+Vb7SoyyailtRk3fPhbtl2ahO5fI58YAvd77UddC7shT5NBBS+DCNuSE4Ynr0QzXABBwaLPyP4XfXFjx8ocHmD4HLLdnlkstD9nrt/9EPbEKSKFX2w6bTqO5jzRVXcypBQ1zqX4CNqbeQRB6JlADuk+SxxcaWmYEht41ekrIP6IUyG9+/Y0aau4vbiGUSTF7hy0assjL3VmJkEoRLqdXsa8a3EFjSkFiNgh3I4LkQnHl/hP25UotILTeAXrIWVsSLFkI6z05XV+Ip0neXEkugsPetMSE+V7vHOsRYBFXDcICx4dZcheqvvVWD2A+SZl396yuJQt3Ae8JXhzZYSmPFWrxyrh9z+zMpZ6I2WagM8KmlwwFS9Xn7IiBigUZMJV6wdjsCkg3KRX7mSeQn3yU9un77VJYs2D0xPYRi1PIz/sFLpREcQIG4EWS/YStCFKgD9DlNXrsF44v6yO1JjihqT5LicSxl36MHX10C70cq5vJFkOe3MJX4/j9Nz+GseDv17DM878Mex8qwyutTsm5La/9H9jXF34BALUsk1FBTE+DRB1fPLrxHw/vM7pXEU7ebfdHDXmJdzUPU8bm4ul6+5DBF6v4sBgQp2snJ/Gl99brLYg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(39860400002)(346002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(316002)(54906003)(66556008)(6916009)(64756008)(66446008)(91956017)(66946007)(76116006)(8936002)(8676002)(66476007)(4326008)(6506007)(6512007)(53546011)(71200400001)(6486002)(478600001)(966005)(41300700001)(38070700009)(36756003)(2906002)(5660300002)(122000001)(38100700002)(83380400001)(86362001)(26005)(2616005)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <55932FE8D474384583348F9C1DBB9BDA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10657
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44ff356b-017d-45d1-f31b-08dc01402b8e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gEcZV7JXA1OFjYxZBFnPINnsQXYUJg6CxxcBlnHrJNkzcr8p/JzqKaR+5jbVLNpamyimG/jzI154IBqhaDBiu9MoyllNZHoFSmr1tG7dVUJrwCjn8pdvPNLc7U5wyjBF2zfTqIIx7ea0kvkD8FIxxodUCtmamb4HrCEUyrUQ2vQs+XW2sXsUus3k6yUY/u7Icfg+jzILDnrVrWFqe7o2/PjOOoTPgOsMnrJbwjYSvUzZaEibv+HQqvLcd58JWJNDLcFNKgLxrB08jqcUOyrabw+sF0xX6hTAA5xnVWxr5Qwufy1YtxM3V5D5qqjLdbIOvyDrecvOsCHVlmplhuB7EoN/+5IsJhK5ybZ29B51gI5IjF5nirZTZLntNh+QdDUS+e7jGK1/lBNU/eaHKXYy5n44RwLalUwlj5oRbfd0g+QW1ABL6Aps6ds3yIxNhC1IUCMVSeAq8Qr1IpHMa0+9Eh7B5yJdqM+iNPZKgO/hWZWbVztHutbK1Ukv3IfnFk66GAw+xHzXzlk3Sd5MJfx5OkjcTWGCIAXez6UF8bLDr/22hM71KBpB3WHfyEg7LjDsCxuVUSTzLpWIJKrIb3LMMJqscvzXqoFx2r2kUmGEfN8Zq76wRTJ8vYmCeeh5luyRsPaBFLjb1W2al9qSDDWqS87L+8iB78K9kiH/NVF8H1X/ssZjYt1UwT48zVUQ+d9EFMP7qsZ2bKlXWAHh4630Mcmb9Qos7gSMGJLP8fMqN0Y=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799012)(46966006)(40470700004)(36840700001)(2906002)(5660300002)(41300700001)(86362001)(33656002)(36756003)(82740400003)(81166007)(356005)(336012)(478600001)(26005)(966005)(6486002)(40480700001)(2616005)(83380400001)(36860700001)(70586007)(70206006)(54906003)(316002)(53546011)(6506007)(6512007)(40460700003)(6862004)(4326008)(47076005)(8676002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 09:44:04.0294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f84140fe-7b33-457b-478e-08dc014033ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8822

DQoNCj4gT24gMjAgRGVjIDIwMjMsIGF0IDA5OjI5LCBMdWNhIEZhbmNlbGx1IDxMdWNhLkZhbmNl
bGx1QGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgQXlhbiwNCj4gDQo+PiBPbiAxOCBEZWMgMjAy
MywgYXQgMjA6MjksIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1bWFyLmhhbGRlckBhbWQuY29t
PiB3cm90ZToNCj4+IA0KPj4gSGksDQo+PiANCj4+IFJlZmVyIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9hbHBpbmUuREVCLjIuMjIuMzk0LjIzMTIwNzEzNDE1NDAuMTI2NTk3NkB1YnVudHUt
bGludXgtMjAtMDQtZGVza3RvcC9ULw0KPj4gZm9yIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIG9u
IHRoaXMgaXNzdWUuDQo+PiANCj4+IEFsc28sIHRoZSBsaW51eCBlYXJseWNvbiBodmMgZHJpdmVy
IGhhcyBiZWVuIGZpeGVkLg0KPj4gU2VlIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L2dyZWdraC90dHkuZ2l0L2NvbW1pdC8/aD10dHktbmV4dCZpZD0wZWMw
NThlY2UyZjkzM2FlZDY2Yjc2YmQ1Y2I5YjVlNjc2NDg1M2MzDQo+PiANCj4+IENoYW5nZXMgZnJv
bSB2MTotDQo+PiAxLiBTcGxpdCB0aGUgY2hhbmdlIGFjcm9zcyAzIHBhdGNoZXMgYXMgcGVyIHRo
ZSBkZXNpZ24gY29uc2Vuc3VzLg0KPj4gDQo+PiBBeWFuIEt1bWFyIEhhbGRlciAoMyk6DQo+PiB4
ZW4vYXJtOiBBZGQgZW11bGF0aW9uIG9mIERlYnVnIERhdGEgVHJhbnNmZXIgUmVnaXN0ZXJzDQo+
PiB4ZW46IGFybTogSW50cm9kdWNlIENPTkZJR19QQVJUSUFMX0VNVUxBVElPTg0KPj4geGVuL2Fy
bTogSW50cm9kdWNlICJwYXJ0aWFsLWVtdWxhdGlvbiIgeGVuIGNvbW1hbmQgbGluZSBvcHRpb24N
Cj4gDQo+IEnigJltIGEgYml0IHB1enpsZWQgYWJvdXQgdGhlIG9yZGVyIG9mIHRoZXNlIGNoYW5n
ZXMsIHdvdWxkbuKAmXQgYmUgYmV0dGVyIHRvDQo+IEludHJvZHVjZSB0aGUgcGFydGlhbCBlbXVs
YXRpb24gS2NvbmZpZyBhbmQgY29tbWFuZCBsaW5lIGFyZ3MgaW4gdGhlIHNhbWUNCj4gcGF0Y2gg
dG9nZXRoZXIgd2l0aCBzb21ldGhpbmcgdGhhdCB1c2VzIGl0Pw0KPiANCj4gSSB0aGluayBoZXJl
IHlvdSB3YW50ZWQgdG8ga2VlcCBNaWNoYWwgcGF0Y2ggdW50b3VjaGVkLCBidXQgSSBmZWVsIHRo
YXQgYQ0KPiBjb3JyZWN0IHNwbGl0IGZvciB0aGlzIHNlcmllIHdvdWxkIGJlIG1heWJlIGludHJv
ZHVjaW5nIEtjb25maWcsIGJvb3QgYXJncyBhbmQNCj4gb25lIG9mIHRoZSBhcm02NC9hcm0zMiBl
bXVsYXRpb24sIGFuZCBvbiBhIHNlY29uZCBwYXRjaCB0aGUgb3RoZXIgb25lDQo+IChPciB2aWNl
LXZlcnNhKT8NCg0KIF5eXl5eXl4tLS0tLT4gZm9yIHRoZSB2aWNlLXZlcnNhLCBJIG1lYW50IDFz
dCBwYXRjaCBBcm02NCwgMm5kIEFybTMyDQogb3IgdmljZS12ZXJzYS4NCg0KPiANCj4gSWYgdGhl
cmUgaXMgc29tZXRoaW5nIHRoYXQgSeKAmW0gbWlzc2luZyBsZXQgbWUga25vdy4NCj4gDQo+PiAN
Cj4+IGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyAgICB8ICA3ICsrKysrDQo+PiB4
ZW4vYXJjaC9hcm0vS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgOCArKysrKw0KPj4geGVuL2Fy
Y2gvYXJtL2FybTY0L3ZzeXNyZWcuYyAgICAgICAgIHwgMzIgKysrKysrKysrKysrKysrKy0tLQ0K
Pj4geGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2FybTY0L2hzci5oIHwgIDMgKysNCj4+IHhlbi9h
cmNoL2FybS9pbmNsdWRlL2FzbS9jcHJlZ3MuaCAgICB8ICAyICsrDQo+PiB4ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vcmVncy5oICAgICAgfCAgNiArKysrDQo+PiB4ZW4vYXJjaC9hcm0vaW5jbHVk
ZS9hc20vdHJhcHMuaCAgICAgfCAgNCArKysNCj4+IHhlbi9hcmNoL2FybS90cmFwcy5jICAgICAg
ICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysNCj4+IHhlbi9hcmNoL2FybS92Y3ByZWcuYyAg
ICAgICAgICAgICAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4+IDkgZmls
ZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiAt
LSANCj4+IDIuMjUuMQ0KPj4gDQo+PiANCj4gDQoNCg==

