Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F255561EFA7
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 10:54:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439183.693190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oryoh-0005ry-Hq; Mon, 07 Nov 2022 09:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439183.693190; Mon, 07 Nov 2022 09:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oryoh-0005pI-DT; Mon, 07 Nov 2022 09:53:19 +0000
Received: by outflank-mailman (input) for mailman id 439183;
 Mon, 07 Nov 2022 09:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XaRo=3H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oryog-0005pC-Br
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 09:53:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20088.outbound.protection.outlook.com [40.107.2.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffa909f3-5e81-11ed-8fd1-01056ac49cbb;
 Mon, 07 Nov 2022 10:53:15 +0100 (CET)
Received: from AS9P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::24)
 by VI1PR08MB5326.eurprd08.prod.outlook.com (2603:10a6:803:12d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 09:53:12 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:532:cafe::59) by AS9P250CA0013.outlook.office365.com
 (2603:10a6:20b:532::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20 via Frontend
 Transport; Mon, 7 Nov 2022 09:53:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Mon, 7 Nov 2022 09:53:12 +0000
Received: ("Tessian outbound 0800d254cb3b:v130");
 Mon, 07 Nov 2022 09:53:11 +0000
Received: from 3c64637a45fc.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 02CAC80B-A1DD-4158-A8D9-162AD6AEE340.1; 
 Mon, 07 Nov 2022 09:53:01 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c64637a45fc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Nov 2022 09:53:01 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by AS8PR08MB8876.eurprd08.prod.outlook.com (2603:10a6:20b:5b6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Mon, 7 Nov
 2022 09:53:00 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%5]) with mapi id 15.20.5813.011; Mon, 7 Nov 2022
 09:53:00 +0000
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
X-Inumbo-ID: ffa909f3-5e81-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=n6aUsPpy/m8y/R8KEbFuwW+z83TClulDxQXYmtvyzcSScf/HO3aLbb1ls1VPZ3gRH0gepI7687Ytizdod3TChr8kcdvHhYiyHTVox5jY9YKI0LM2Lue07/8Lc9i98X5/aodWWkNx8OOvOJTQVIYfYqJ7dbtk840OQZd2vWTcRaHW5VPEuH1kO/Y/m6iDmLVkTIPzHlpIeCTL1FzVExDjnBJS0PCxqQZ35x+B9vXclDNxtLy7ZGoAxHGMNLGNemThs/ks9Q+p6mcfkFYvyWyWI6Xx+KNR5brZEcxyISgHPkpcGiEEZAz5iL09FfbDGw8gSl8ciSqYCEziEgEQYd0ncQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPfUGmEQHv5roDDeJy+dBXXqokxm5XWgIUp/LZUDb9k=;
 b=gXPzBdYJfZ8mTLjsAHUoyoWJlqKuQTo0MgUoslzcqW13sCIBhcMa59AyxAZiU4gyU94VFaBRq6x0tRQF+78obXkLrES0P0lHeGd47zsgIZioEmxKtCQ0YCJYISOvPRx7HSS7qkl4Huy+IswWSkka7fzQrt7F718Ne4Cidi29rTwMGnOJTCx79fvpBA1XYJ3qEOtFMZotkEh1qN+lG0mxX4WwUra8OnsxkDS62GuT6xtLvbrkxsxXcgDOusvWx1fQ3d1K6FL03lfDE4PPSXnasN65KJ0S1JmmiTwT3vPCAisI7KXw6eVyYZJNTDKQuCNaStPLtBq5fE2usfHcoiZCNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPfUGmEQHv5roDDeJy+dBXXqokxm5XWgIUp/LZUDb9k=;
 b=F5phwd7N0VjniMyanKDxqFzx9FCZW4dTbtokWB2MnNKG8seZHPJ+m4nH1bto8aEzFX4hPKcblQiHC0qCi7c9kW4QgH5VWBkuOgJ5HJ7mR5mEpgdhz0deM5gFmaTu/ShMBEQP8TlOg7DVlWFyEVHKiT92MkwYZFZqdK6UlP3Y194=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNL3dVNdkdVo3W7x4Jin8f+B3dhYn5DLhDtMLQYd/shg3oGB8DCiV1ZrvGbnq/3joroMSpDuiXuPJIAU8d7bJh8oIobaTFuXl0OFsA1w59beJ1obNA1+Rmyye1qRoMvbp/imROviw+cyekdS1D6Bh4C1yE4vcqmfTRZHyXnkqWbsNcjaQyNlIjjNccpKry+FKKYnxC208geV6WmLjSW+WavERWuarpRgCgPqb2DysBiLkvU/jHZTguY82shxth9Mp2lnj1t7dG0KP2ZOxPMthR3lh0DPn+ht0/jlr9VRUY/ziKtZJj2OVuuRUv/sGGwsdl0C+HiGKhk2rWCI2ai20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPfUGmEQHv5roDDeJy+dBXXqokxm5XWgIUp/LZUDb9k=;
 b=A9w5nJqEIJ04VDK90uMDzLfkcow6keS1XKBe7xGn1TXaf49sYrckdSErJt78cx7mAx0MFpX5rCX6n1ne3kGhoPtNbXf2LaL4E5Z2PCP4TcGS7D21iaD186733U4MmkFyk2ttr6ojYpSuRR+KZCoL7TGIjQ2PHzgwYjTr3pGZaJHSX1KKLOQESnZD+eHd/Y1LiglHdhvoqLq0VeQOGwzlL4HoCCfucPSzWKKn9+COdwP/CcLVbaIJzYrvH7iH08tXw7SUx00FjThKHaA/B1saxCg3pacCfhBIScALbIFYgGM8Cns9NNf5vBJiYUjwKY5UOzLrnqYRizK5wFJ/7p/s2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tPfUGmEQHv5roDDeJy+dBXXqokxm5XWgIUp/LZUDb9k=;
 b=F5phwd7N0VjniMyanKDxqFzx9FCZW4dTbtokWB2MnNKG8seZHPJ+m4nH1bto8aEzFX4hPKcblQiHC0qCi7c9kW4QgH5VWBkuOgJ5HJ7mR5mEpgdhz0deM5gFmaTu/ShMBEQP8TlOg7DVlWFyEVHKiT92MkwYZFZqdK6UlP3Y194=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Thread-Topic: [PATCH v6 00/11] xen/arm: Add Armv8-R64 MPU support to Xen -
 Part#1
Thread-Index: AQHY8DVcKFNDls96akm0LlhB1cf9B64yRBkAgADyKCA=
Date: Mon, 7 Nov 2022 09:52:59 +0000
Message-ID:
 <PAXPR08MB742097DFF1BD4E9BF19B41459E3C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <9c3bfa0c-2c8f-2160-46d1-3be234b5bcaf@xen.org>
In-Reply-To: <9c3bfa0c-2c8f-2160-46d1-3be234b5bcaf@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AE924A1660C1B445B58870C16871251E.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PAXPR08MB7420:EE_|AS8PR08MB8876:EE_|AM7EUR03FT046:EE_|VI1PR08MB5326:EE_
X-MS-Office365-Filtering-Correlation-Id: 50d36046-5d8d-41d9-ecc3-08dac0a5e213
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GlLaXI6ai48Jf44/aRqXggBZnOttNBh7i/oQXMMe2h4DYmf8hob/qcXz8QHtqrTMjPFi+jfAB5IO5x/nBBhfqEi5Fy59MuF01zPvquItMEh9Bheo/X5kyxkEbrJRwWkuWsW3xUB4bZk1ZdN2KczMpJAjyxvNw4umP7+FKwKa5KRBbSfApow24A8iogHm5+AeVAK+Go8AN0Au9NGpHEa+j6aqYL4+7rGnUn22cqnrsxpSMi8Nj3XOUi+bcNkXPDoaVXV8U0a+SHJVhgwWNT43IeW82S6Ch9teog/ZZmOOBtyPE8Io0xnSCnlp/rtvAh/KUWiGHDB+K26fMDxOvZKg5g9nicClWYhbTMDgqJPmMMNyoqZLS1IOZTtHc9l4lj+IzVuzs/s8nt1H5zenXltxGWdcS/Nd7OHYad1wf7niFpaaKzrOJzbEJWqeQiaYQmVi1I+ESGiA2rZ46LBMfsJB/j8WBRss4BSoA0avGX3CqSa6s0QwrPuqKqh+Uip/fog8GOmi6TFe1bbyR2jtLt3cuViEgY9/gG/NrQpvF6gR00HwOyqoBRkCWKiZ11IdYGBqdqpAzeGjE2y3KOfSB9aSA6dzVJ6bt8HivB+7foaGLt56hBJ+OQ7Kywi0/O8kCT6XDzyU8zbQXO3Dw0fkWZjgBS7Xyl9nHz19MkSLbf5PuD+wrGOJCwU7DFWB1O6uUIC8kfb03lkerbVni+SjC6GUYRjM7UzFpZHL35SHyEMczcgRh42UWQa5OHHyDY6Pssztfm+0dwrfK5cyLpmjy3/u89q8busfVLqQBGJMyZKUTzQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199015)(55016003)(8676002)(66446008)(66476007)(76116006)(66556008)(66946007)(4326008)(54906003)(33656002)(316002)(110136005)(122000001)(71200400001)(8936002)(2906002)(41300700001)(38100700002)(52536014)(64756008)(5660300002)(6506007)(7696005)(83380400001)(186003)(26005)(9686003)(478600001)(38070700005)(86362001)(17413003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8876
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad73168e-cf76-41cf-4b8e-08dac0a5dac9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UZIImxrf6NtthIgxvLreRPzmd3b5m/zHmusVXbKIB1/L3e6K8ZDTZCvyvZPm1oWDvufri9jXgQSLAM7uWOwMVhTFPQ2IoX0o1x9nSdccZAJgsO3WY5/ssoWbxYYPnzk4XzsZMwt4xsQzjjAsNz27l77njlFDXcZASV7LTymo/qXBFvMZIRah1SkEJJJ5XbYYZEyZ0ck959TYMYqWpNT0FosqwsH4JqiGXIdwXFx+/uhA5WGvgJifF0Nha+b3kpDnMicc3lBhtBz+zeuAVId53sqgXFnJoiGQ4H1FZuV4v4xyMfef0soQAmF+GjvsS4I+Pi+DdbAfHrCp9XpOU8x95I6Eo1hU4OrCCHoNhfdCtgIvo+AMeI+KaRHA+YGRY6Z5N67g3y0a9D/Ug5xk8NGalTk2CHiPtDkRuCxi9Z9I/vXJNe8Agnq7yRU5/VupTExfEzYPnrYuhdkSuXDZeDOfMQKK6PCIbkj9/2SDFX80Plvidxa0Q3cT3Iz1jwmf+pH/9oMjqu5l7OuNvGkVL0NWXzcgEw9+kuJq5/nHturoszagSAtok50vuwokgAZTVvD9dKyz+atHWCdnIeDrH8ZSzDPZiGXLe4cC+V6kR+spKQ86nhoRolSVBlrgGqCCpKxJGDizMXuFfvXvgP18lPCXMJuVzi6b8SeQiDE1RIJUaqYlAd36cmIU8618o8zXpwJIPF8lxkh3mDRQdoj8zRdXM1yWnZnHPnOQKToSdS0G124EZbxX0DF9xcpN9KytbCgAg4IpqBTeUCrBQymS4nUcQA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39850400004)(451199015)(36840700001)(46966006)(55016003)(40480700001)(8936002)(478600001)(5660300002)(52536014)(2906002)(33656002)(316002)(54906003)(110136005)(70586007)(41300700001)(70206006)(4326008)(8676002)(81166007)(356005)(83380400001)(82740400003)(36860700001)(7696005)(107886003)(6506007)(86362001)(186003)(336012)(47076005)(9686003)(26005)(82310400005)(17413003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 09:53:12.0814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d36046-5d8d-41d9-ecc3-08dac0a5e213
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5326

SGkgSnVsaWVuLA0KDQo+ID4gICAtIFN1cHBvcnRzIG9ubHkgYSBzaW5nbGUgU2VjdXJpdHkgc3Rh
dGUgLSBTZWN1cmUuDQo+ID4gICAtIE1QVSBpbiBFTDEgJiBFTDIgaXMgY29uZmlndXJhYmxlLCBN
TVUgaW4gRUwxIGlzIGNvbmZpZ3VyYWJsZS4NCj4gPg0KPiA+IFRoZXNlIHBhdGNoIHNlcmllcyBh
cmUgaW1wbGVtZW50aW5nIHRoZSBBcm12OC1SNjQgTVBVIHN1cHBvcnQNCj4gPiBmb3IgWGVuLCB3
aGljaCBhcmUgYmFzZWQgb24gdGhlIGRpc2N1c3Npb24gb2YNCj4gPiAiUHJvcG9zYWwgZm9yIFBv
cnRpbmcgWGVuIHRvIEFybXY4LVI2NCAtIERyYWZ0QyIgWzFdLg0KPiA+DQo+ID4gV2Ugd2lsbCBp
bXBsZW1lbnQgdGhlIEFybXY4LVI2NCBhbmQgTVBVIHN1cHBvcnQgaW4gdGhyZWUgc3RhZ2VzOg0K
PiA+IDEuIEJvb3QgWGVuIGl0c2VsZiB0byBpZGxlIHRocmVhZCwgZG8gbm90IGNyZWF0ZSBhbnkg
Z3Vlc3RzIG9uIGl0Lg0KPiANCj4gSSByZWFkIHRoaXMgYXMgSSBjYW4gYnVpbGQgWGVuIGFuZCBz
ZWUgaXQgYm9vdHMgKG5vdCBjcmVhdGluZyBkb21haW4pLg0KPiBIb3dldmVyLi4uIEhBU19NUFUg
aXMgbm90IGRlZmluZWQgYW5kIEkgd2FzIGV4cGVjdGluZyBtbS5jIHRvIGJlDQo+IG1vZGlmaWVk
IHRvIGNhdGVyIHRoZSBNUFUgc3VwcG9ydC4gU28gSSBhbSBhIGJpdCBlbnN1cmUgd2hhdCB0aGUg
c2VyaWVzDQo+IGlzIGFjdHVhbGx5IGRvaW5nLg0KPiANCg0KVGhlc2UgMTEgcGF0Y2hlcyBhcmUg
cGFydCMxIG9mIHN0YWdlIzEsIHRoZSBmdWxsIHN0YWdlIzEgaGFzIGFib3V0IDMwDQpwYXRjaGVz
LiBXZSBoYXZlIHNvbWUgY29uY2VybnMgaWYgd2Ugc2VuZCBzbyBtYW55IHBhdGNoZXMgYXQgb25j
ZSwgdGhlDQpyZXZpZXcgcHJlc3N1cmUgb2YgbWFpbnRhaW5lcnMgbWF5IGJlIHZlcnkgaGlnaCwg
c28gd2Ugb25seSBjaG9vc2UgYWJvdXQNCjEwIHRvIHNlbmQgYXMgcGFydCBvZiBpdC4gQnV0IHRo
aXMgYWxzbyBtZWFucyB0aGF0IHdlIGNhbid0IGRvIGEgcmVsYXRpdmVseQ0KY29tcGxldGUgdGhp
bmcgaW4gdGhpcyBwYXJ0IzEgc2VyaWVzLg0KDQpXZSB3YW50IHRvIGhlYXIgc29tZSBzdWdnZXN0
aW9ucyBmcm9tIHlvdSB0byBtYWtlIHNvIG1hbnkgcGF0Y2hlcyBjYW4gYmUNClJldmlld2VkIGVm
ZmljaWVudGx5LiBDYW4gd2Ugc2VuZCB0aGUgcGF0Y2hlcyBieSBzdGFnZXMsIGV2ZW4gdGhlIHN0
YWdlIzENCndpbGwgaGF2ZSBhYm91dCAzMCBwYXRjaGVzPw0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0K
DQo+IENoZWVycywNCj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

