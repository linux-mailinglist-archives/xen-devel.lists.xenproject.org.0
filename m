Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6D7809EC1
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650446.1015984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWnT-0004Yr-OZ; Fri, 08 Dec 2023 09:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650446.1015984; Fri, 08 Dec 2023 09:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWnT-0004Vr-Kx; Fri, 08 Dec 2023 09:05:23 +0000
Received: by outflank-mailman (input) for mailman id 650446;
 Fri, 08 Dec 2023 09:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1wyI=HT=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBWnR-0004V6-V5
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:05:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e921e129-95a8-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:05:19 +0100 (CET)
Received: from AS9PR04CA0149.eurprd04.prod.outlook.com (2603:10a6:20b:48a::22)
 by VI0PR08MB10741.eurprd08.prod.outlook.com (2603:10a6:800:212::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 09:05:16 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a:cafe::e8) by AS9PR04CA0149.outlook.office365.com
 (2603:10a6:20b:48a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27 via Frontend
 Transport; Fri, 8 Dec 2023 09:05:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Fri, 8 Dec 2023 09:05:16 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Fri, 08 Dec 2023 09:05:16 +0000
Received: from 812f2fcc7c99.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 181E3887-D715-4A51-88F1-8CF810E60820.1; 
 Fri, 08 Dec 2023 09:05:09 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 812f2fcc7c99.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Dec 2023 09:05:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB10325.eurprd08.prod.outlook.com (2603:10a6:10:471::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 09:05:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 09:05:07 +0000
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
X-Inumbo-ID: e921e129-95a8-11ee-9b0f-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MaVXAC9xCKVQS6fwxnbd1BxrtN+5FsEWG0CthMsNGczLoj0SpxgM9zx8IwGRAHuQ07MzPPbooGS6xmqsLiHgKvPgH2qy2UL0quW0eqs6/b5NEdWxWGaEfFbzCkRX0p/+7iyUBw9/AB/SNDFoGqdU0W6U2oiIzeGJQRJdG5UiMKzcqh6b2mPsKJ7MmdfMORqmDi2XjXc8mKQTmsAVnqlGGu6GBiTUrK06Mz8EgxBHTrnbz5LcLJc76qz4te9LuJc/r0LL0jY3TVUrWoRvsISx/R59HC636NLVz8aN7azN1FiJoRH2KY9nRp9wi0V2w/vI2Ohlv+OGOgq0856k5NvsDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG8wieN9a2R+nD+GSP5TqEbozMuXdUaOHljYikQtWZM=;
 b=RmWYN/Kgu2Nz1L/pwfQ4zF0PNkypNgjPpPFADiuCyCNp6Pi5/ViyzXmr4gnIGkUCqwJ1eKsRMUPKx8J6yH3BtHTGeF0wo5K1koJwu6sfQ9lETozq2wJQbC7/FBcnHF4EeVFo81oEktyIgHig5ahOpxn0sS7+WLfF4gbVU3hJ5mkDDyavCVy3F2rxvy80t46f1vsUgxGtnOq/GpzYQqdqorvdiuNujfFDFrNDYBYM2HuC/DMOH2sAMEwCSjmckZS5EIIXcSuxJohAzboXbyglmXPqWvVod8tSRLBrQhKbkKCkzGuwxOHzb3c2kLCUK/XFyKXT0VFDcp1rr1FyALvVxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uG8wieN9a2R+nD+GSP5TqEbozMuXdUaOHljYikQtWZM=;
 b=2kkxsMlwlSeTGCd4DsS4+T2Vf7FcUcxhyWlELqVjy8Z0TsQ+cF4o2/B5ZtA9QGFh2mt6KJz8AUooDcWs4076jWsO8Iv3HlxFQcbl/EDgt56Z4zhDQMEV+keHZPp10qf2BXybzUA6b4qZKBXEOZsaglntlCl9Aze0+ngUglHEQAY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: be2605d3e5835d29
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FK189mmTq3bgXRhNTyvY/4mOu3o0twPQjrg1iXcfl9nSG2j5b9DWLAjMv1TNLJI34iTTJNMGflZxDBpJGfZ3j1jiwnifhIeoIAWcxFK9U5dSsFcL5BJR17BPmDMqLbLlfAKX/QgWQiFkg2W9EAVu3l7ixRQMEmP6GnSZ8peGOWatxcJL6cdC5rFL6qChzdVZB/Zw3SQzEWsxjddSGAxNIBWjpWICan6WWOiMG7LTzV438fmyv4T+734h9nS91uuzHacKMB8j1dVTN7eoCX9Qqxm7EhVDeKDnV4/+XtA5LbnKJAhECWNzZsdBNMb+IsGa0ohmGb9gNUjlZcsC4ltxJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uG8wieN9a2R+nD+GSP5TqEbozMuXdUaOHljYikQtWZM=;
 b=mU9J/RaYOjOIjXZvpE22wdXyn6YFQkTsmsAASkWXlJ0/KlZAKSqsI95uBUR3x4P/wysEVLLqLZYUw9bCIQdPSWCYyh5TIolNFPDlQ/nWzcUdEJpqrurL7p87cLa73Xi/ZEVOZZL8MFBQ8yKP6cL+VMBcGIQ03lGmvM9CkET4NUQkv4mpja8NGkIP6taseqOm45NNrgEAWcd8YhUkSUMHP2RLjm5aFBV5mq1Xz4ag2tA/sZA1fkb1/XjFZtIyMv0tGzraCtlq9BxpYSoG8jNUsDH2Zs9hG7qS4NPrqtlk1zaxkrQ0lYc+iy2UYI5Kol8/bmL2c0EsI438QD8gD86/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uG8wieN9a2R+nD+GSP5TqEbozMuXdUaOHljYikQtWZM=;
 b=2kkxsMlwlSeTGCd4DsS4+T2Vf7FcUcxhyWlELqVjy8Z0TsQ+cF4o2/B5ZtA9QGFh2mt6KJz8AUooDcWs4076jWsO8Iv3HlxFQcbl/EDgt56Z4zhDQMEV+keHZPp10qf2BXybzUA6b4qZKBXEOZsaglntlCl9Aze0+ngUglHEQAY=
From: Henry Wang <Henry.Wang@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen
	<Wei.Chen@arm.com>
Subject: Re: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Topic: [PATCH v2 3/5] automation: Add the expect script with test case
 for FVP
Thread-Index: AQHaKZoAVIHO2rCYDECWUL8sUR2sfLCfFe6AgAACFwA=
Date: Fri, 8 Dec 2023 09:05:07 +0000
Message-ID: <4609F9AA-44B6-40EA-A1A5-9D677679002D@arm.com>
References: <20231208054637.1973424-1-Henry.Wang@arm.com>
 <20231208054637.1973424-4-Henry.Wang@arm.com>
 <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
In-Reply-To: <213f2b46-2668-4dae-8c57-269a73eff1bb@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB10325:EE_|AM4PEPF00027A65:EE_|VI0PR08MB10741:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b6a1a45-411c-473a-0d31-08dbf7cccb8c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 xQCeZrr/5NO0PWiLqLnYGQMjf/5sebQTNgq65cmv+GEapLsJ5mWgeCX+0yC0o8Cf4ILQl9G+MVTKgxkHKpPljBtPOtQynf/krf6fU9ZMx3lT2KPi62r0+dXgcmTn0rkYhvf0f7HtR1mvbg7Q87+xNcDkV3y5xC6wkamQFO/5zBsF4bX48e/JMvUF4kqFU/92UegaT/8g4JUJ/AzYZ8hHqIp+JT7626ziioGVjekUZSc+J2Cuy+brsVBMiIqdFykygO0gQIGa2YNTLB24I0BvdW46Q+fuWQxC6gUUlA0Plz+eDVjpqoInBr3XR/ex9ysA2WywAGmIFU6iBsfYysp4p105F7o9uVGWhBXnLcxvnvOPo+aRcIOznYkqWTNfMiGBarXqNcUEumLNAzw+btwXbfp2bjoZty6CqP3SPGNoeQLUqzVjMeYALbL5bel65jIEWqNXiZicayHkN21Ixt4jLVtjGd1qFmb05WlReNwbDQucO+PdziZPV+qEOC4nn8ZiO4PksD0nCd6rnVaOqQNrsyHdVOr+auxtXjrUg3DN30WEqW9KkRDeWYGdKpV3qMpjaTuKUubCNr6DQjDC2srINekylAVu6btCvKYz0JDjO4iNNlVI+yF5fvSaxmLuZOOmFIqz+H5Qgtd7gLY//9c0mg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(366004)(39860400002)(396003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(122000001)(66446008)(76116006)(64756008)(66946007)(66476007)(6916009)(54906003)(91956017)(66556008)(5660300002)(316002)(33656002)(83380400001)(2906002)(478600001)(6486002)(71200400001)(8936002)(4326008)(8676002)(38100700002)(86362001)(6506007)(53546011)(6512007)(2616005)(26005)(36756003)(41300700001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C7C778B5E4555409405E15F2DADF7D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB10325
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84364dea-8cc4-4dad-71bf-08dbf7ccc648
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NYpVKkL/7KKMdFboSA3EcyULf6bA2m2bd+4r9M9eljbcC29huOP0Iwsl+HyTtrpoXS75caCqe9i1gxJFlPIfGV2ij/RjGM1xyJSZLe4KrgmEaRlaZpgjmCfcw0J0Bgdf/J9RStx4OFx5WG5H1aNOTWhTVCWdDfwIxXr5soS4p7Nb5yz0Htn5IwtJ85vl98w7sQFnOg6pk5MBVac/e2Wi5fbvyWa70keRDTdS853bRpd37vgFZPo0eZ2fHkfnpArjhNFz57Kip6ji3WBBlVVExV4GAXuHrLcJqRDnyuDOPMIk28/9v1Cq7fU8Y5QlsQKljv5yvC7thiYSZ6b1SB50bFMFpdHeRUO2ZaEQ6N0FvpZF/87qUQGIFjtQt1AOZArW4IPu+F28j9ic8GWf7QAKlgEnsnsGCOsHeUtDA66lkEHYvPkx9WMXUA2hpT3qR0b89HXKjWwwfPIx2z+rOqGXYiRgS9ENvik4+lXCWmoQJBDdZ5rMilCPUuwVGszdpn8u03VzjtfWjSLLG+fDKdJfHRIupk+lgzHLo5bwIs4Jv2bqLPfnUY416F8DUHe0LRIQR1eKgG0EKW6aFaYJpO3YRlPxqn05z55CkFxvSraHNk3BnkvrgJnkJsT+9N2/ZwNGVkv9C92F8FJe62SVcxcjiblXkrZGv9jCZtuMRdw0Lu2fIPp2FndOvKuoVAh8O/CqDPVLcJst5SUcYiosE6Oxnx/M3bBmEmwG356bNqWJ0jByou9d1qQGm+mr6dpcQHs6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(82310400011)(451199024)(64100799003)(186009)(1800799012)(46966006)(36840700001)(40470700004)(5660300002)(6506007)(2906002)(53546011)(40460700003)(478600001)(6486002)(6862004)(4326008)(8936002)(8676002)(86362001)(54906003)(316002)(70206006)(70586007)(33656002)(336012)(82740400003)(36756003)(83380400001)(40480700001)(26005)(47076005)(81166007)(356005)(6512007)(36860700001)(41300700001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 09:05:16.2930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b6a1a45-411c-473a-0d31-08dbf7cccb8c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10741

SGkgTWljaGFsLA0KDQo+IE9uIERlYyA4LCAyMDIzLCBhdCAxNjo1NywgTWljaGFsIE9yemVsIDxt
aWNoYWwub3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBIZW5yeSwNCj4gDQo+IE9uIDA4
LzEyLzIwMjMgMDY6NDYsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+PiANCj4+IA0KPj4gVG8gaW50ZXJh
Y3Qgd2l0aCB0aGUgRlZQIChmb3IgZXhhbXBsZSBlbnRlcmluZyB0aGUgVS1Cb290IHNoZWxsDQo+
PiBhbmQgdHJhbnNmZXJyaW5nIHRoZSBmaWxlcyBieSBURlRQKSwgd2UgbmVlZCB0byBjb25uZWN0
IHRoZQ0KPj4gY29ycmVzcG9uZGluZyBwb3J0IGJ5IHRoZSB0ZWxuZXQgZmlyc3QuIFVzZSBhbiBl
eHBlY3Qgc2NyaXB0IHRvDQo+PiBzaW1wbGlmeSB0aGUgYXV0b21hdGlvbiBvZiB0aGUgd2hvbGUg
ImludGVyYWN0aW5nIHdpdGggRlZQIiBzdHVmZi4NCj4+IA0KPj4gVGhlIGV4cGVjdCBzY3JpcHQg
d2lsbCBmaXJzdGx5IGRldGVjdCB0aGUgSVAgb2YgdGhlIGhvc3QsIHRoZW4NCj4+IGNvbm5lY3Qg
dG8gdGhlIHRlbG5ldCBwb3J0IG9mIHRoZSBGVlAsIHNldCB0aGUgYHNlcnZlcmlwYCBhbmQgYGlw
YWRkcmANCj4+IGZvciB0aGUgVEZUUCBzZXJ2aWNlIGluIHRoZSBVLUJvb3Qgc2hlbGwsIGFuZCBm
aW5hbGx5IGJvb3QgWGVuIGZyb20NCj4+IFUtQm9vdCBhbmQgd2FpdCBmb3IgdGhlIGV4cGVjdGVk
IHJlc3VsdHMgYnkgWGVuLCBEb20wIGFuZCBEb21VLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBI
ZW5yeSBXYW5nIDxIZW5yeS5XYW5nQGFybS5jb20+DQo+IFJldmlld2VkLWJ5OiBNaWNoYWwgT3J6
ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpUaGFua3MhDQoNCj4gd2l0aCAxIHF1ZXN0aW9u
Li4uDQo+IA0KPj4gLS0tDQo+PiB2MjoNCj4+IC0gTm8gY2hhbmdlLg0KPj4gLS0tDQo+PiAuLi4v
ZXhwZWN0L2Z2cC1iYXNlLXNtb2tlLWRvbTAtYXJtNjQuZXhwICAgICAgfCA3MyArKysrKysrKysr
KysrKysrKysrDQo+PiAxIGZpbGUgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKQ0KPj4gY3JlYXRl
IG1vZGUgMTAwNzU1IGF1dG9tYXRpb24vc2NyaXB0cy9leHBlY3QvZnZwLWJhc2Utc21va2UtZG9t
MC1hcm02NC5leHANCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9leHBl
Y3QvZnZwLWJhc2Utc21va2UtZG9tMC1hcm02NC5leHAgYi9hdXRvbWF0aW9uL3NjcmlwdHMvZXhw
ZWN0L2Z2cC1iYXNlLXNtb2tlLWRvbTAtYXJtNjQuZXhwDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDc1
NQ0KPj4gaW5kZXggMDAwMDAwMDAwMC4uMjVkOWE1ZjgxYw0KPj4gLS0tIC9kZXYvbnVsbA0KPj4g
KysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2V4cGVjdC9mdnAtYmFzZS1zbW9rZS1kb20wLWFybTY0
LmV4cA0KPj4gQEAgLTAsMCArMSw3MyBAQA0KPj4gKyMhL3Vzci9iaW4vZXhwZWN0DQo+PiArDQo+
PiArc2V0IHRpbWVvdXQgMjAwMA0KPiBEbyB3ZSByZWFsbHkgbmVlZCBzdWNoIGEgYmlnIHRpbWVv
dXQgKH4zMCBtaW4pPw0KPiBMb29raW5nIGF0IHlvdXIgdGVzdCBqb2IsIGl0IHRvb2sgMTYgbWlu
cyAocXVpdGUgYSBsb3QgYnV0IEkga25vdyBGVlAgaXMgc2xvdw0KPiArIHNlbmRfc2xvdyBzbG93
cyB0aGluZ3MgZG93bikNCg0KVGhpcyBpcyBhIHJlYWxseSBnb29kIHF1ZXN0aW9uLiBJIGRpZCBo
YXZlIHRoZSBzYW1lIHF1ZXN0aW9uIHdoaWxlIHdvcmtpbmcgb24NCnRoZSBuZWdhdGl2ZSB0ZXN0
IHRvZGF5LiBUaGUgdGltZW91dCAyMDAwIGluZGVlZCB3aWxsIGZhaWwgdGhlIGpvYiBhdCBhYm91
dCAzMG1pbiwNCmFuZCB3YWl0aW5nIGZvciBpdCBpcyBpbmRlZWQgbm90IHJlYWxseSBwbGVhc2Fu
dC4NCg0KQnV0IG15IHNlY29uZCB0aG91Z2h0IHdvdWxkIGJlIC0gZnJvbSBteSBvYnNlcnZhdGlv
biwgdGhlIG92ZXJhbGwgdGltZSBub3cNCndvdWxkIHZhcnkgYmV0d2VlbiAxNW1pbiB+IDIwbWlu
LCBhbmQgaGF2aW5nIGEgMTBtaW4gbWFyZ2luIGlzIG5vdCB0aGF0IGNyYXp5DQpnaXZlbiB0aGF0
IHdlIHByb2JhYmx5IHdpbGwgZG8gbW9yZSB0ZXN0aW5nIGZyb20gdGhlIGpvYiBpbiB0aGUgZnV0
dXJlLCBhbmQgaWYgdGhlDQpHaXRMYWIgQXJtIHdvcmtlciBpcyBoaWdoIGxvYWRlZCwgRlZQIHdp
bGwgcHJvYmFibHkgYmVjb21lIHNsb3dlci4gQW5kIG5vcm1hbGx5DQp3ZSBkb27igJl0IGV2ZW4g
dHJpZ2dlciB0aGUgdGltZW91dCBhcyB0aGUgam9iIHdpbGwgbm9ybWFsbHkgcGFzcy4gU28gSSBk
ZWNpZGVkDQp0byBrZWVwIHRoaXMuDQoNCk1pbmQgc2hhcmluZyB5b3VyIHRob3VnaHRzIGFib3V0
IHRoZSBiZXR0ZXIgdmFsdWUgb2YgdGhlIHRpbWVvdXQ/IFByb2JhYmx5IDI1bWluPw0KDQpLaW5k
IHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiB+TWljaGFsDQo+IA0KDQo=

