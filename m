Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02185809D7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 05:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374922.607129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGB3P-0001EW-Od; Tue, 26 Jul 2022 03:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374922.607129; Tue, 26 Jul 2022 03:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGB3P-0001B6-LM; Tue, 26 Jul 2022 03:16:15 +0000
Received: by outflank-mailman (input) for mailman id 374922;
 Tue, 26 Jul 2022 03:16:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=znrZ=X7=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oGB3N-0001B0-W4
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 03:16:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b9eb523-0c91-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 05:16:12 +0200 (CEST)
Received: from FR3P281CA0124.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::15)
 by GV1PR08MB8106.eurprd08.prod.outlook.com (2603:10a6:150:95::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Tue, 26 Jul
 2022 03:16:05 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::e7) by FR3P281CA0124.outlook.office365.com
 (2603:10a6:d10:94::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.1 via Frontend
 Transport; Tue, 26 Jul 2022 03:16:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 03:16:04 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Tue, 26 Jul 2022 03:16:04 +0000
Received: from 9203a51a8afd.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F5C24FA6-272A-4B88-8E8B-E7E5B75C5488.1; 
 Tue, 26 Jul 2022 03:15:53 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9203a51a8afd.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 03:15:53 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by VI1PR08MB3726.eurprd08.prod.outlook.com (2603:10a6:803:ba::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Tue, 26 Jul
 2022 03:15:51 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::f90a:69e3:64e7:fdc0%8]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 03:15:50 +0000
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
X-Inumbo-ID: 4b9eb523-0c91-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=PtivYfqHfRTq4dMhixuUNngkkRA1cFt6c/0Mn0w8Gt227f/YPq922YtfUbgIY1Dad9+T7C5nga94mbRPrqjHpMJCUW1xcgjk1Weskpa75MTfyuk01z0yqw0c4Oi6mBobmhJrWbPnxCMCj8Gs6D8oKsznlexDC2vsvvSZyPDs8bbDHjzhsSytNItdJVZ1eFAFK5gFnSk51ldA1Mf/xNRQacdgWCdPlxVDztPrRkgLrMCmWKRGrJcXbiyP13E61FiTtkwo4DX/Nmc2Bvey9+W6s6oWoS5A3xBjVTBo4UTaB1cSroevp5a4Oky1aVMjr8sxAX8y+AUZNgnY8f35KjyaiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EUfJweFe5RBt67MncQk4V6z7mqKjpeCFTB5GPYH/YE=;
 b=TC+DD3KJYaO6lCL6FQLWycm2bGHpQmn4+7q43lsfhtomGKeGyCUFLu1GpuZPQk2xIqNK/kKM4bDZ+0L6ClhSXIcvoAbUYi7JdppsJL34RjWzWwSpq+7B40nmHcrip7tiBU2RKRSwDzj/YOg3eZvn6tKlwqKnx7ItYuOLRJNC7vfx8LEMBtHZSrZJqnwairtqq+tB98sOhEPNP38tZPFGxSPtvU4rV/zy2Rk6Um/sEQAZ1FYaysAIVoCazTa2bINuQksKoeoCmUwODzy6NKunrXafTZReqtWigXi/xQsCjyR3BIPdqPFLizkKwCiV7rjVSd1d9kiNIoof5ATcrCnCwQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EUfJweFe5RBt67MncQk4V6z7mqKjpeCFTB5GPYH/YE=;
 b=3naZgR2BfJCxO2qIn7ZGeH9zGI6qqqpq3MdHmmSchbXlLKWThc2LbmNzYmplu2QMJO8P+ut252iI8ZVSnMgvxVRtGcNXOgySj7yB3MyUevisFnioUu7sSEpinintEi8mvIVKuch3hsuZzlRAkrw2yYpN9f8AwjA8acXXbx+otoM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW5ufMjq0ejkwB/Tec+6wC+D3K5atEwfqksRbgKQdV+IB9lZ1G0pxa4FJssTBjn0xWhXL9+H6wGN6W/8tTq6kMGPxhh37qZ8rl59NK0TyS/ibLCas5tCDTWk45rZHlyKaH+oX5PNj3lK1Rtsyf9zSVWx2Z4fUI2ax7ZErheaRa4TDjmfPyJsNaIrVpbHwyYJRUmkTl8aXMP9GIdA7zJ837EMIHFy9iNOqCIKoo9cTCmkwRtvVr7awRh+gqXkktPlA1w3SPHNCAAC5B3KohPDvQ5Cb4l6YjHL1t1EeXvnIfZzW/mYEHBFb+UIpb4huC1bHj+7LbshOT4bwP2R5lxNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EUfJweFe5RBt67MncQk4V6z7mqKjpeCFTB5GPYH/YE=;
 b=E3iNlYtB4YYtdpKP96TcCC413IqtsPjvGIbr8Jn/NnPqrdLB/ikKQuNfgBQG3q2jl3oMMcJRCcBJb1fSgkmAthpEMQhO+VEy4aN1M74bgbJXBDjJSJeI4pGV3w7/5f2UySml9jvJ31IHBpEH4bkvQEoRErfNVKDJG6DabLIPhpnFiG+Kzoq0ZtZYqgx4MJuL0xZpSHpFWfjMKft57HkAJwb7c/FUM6WgrZUEajMn+dCy3uqNXyNhJOFjH2/M0DyNPgXHRGeLcsi2qYOCUUS+qzXHZ7zOkBYLFM/H2noXsJ/RDbetnsaXVf0IDVwHK88rtbDXej65n1E9cUpL8TG3pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EUfJweFe5RBt67MncQk4V6z7mqKjpeCFTB5GPYH/YE=;
 b=3naZgR2BfJCxO2qIn7ZGeH9zGI6qqqpq3MdHmmSchbXlLKWThc2LbmNzYmplu2QMJO8P+ut252iI8ZVSnMgvxVRtGcNXOgySj7yB3MyUevisFnioUu7sSEpinintEi8mvIVKuch3hsuZzlRAkrw2yYpN9f8AwjA8acXXbx+otoM=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v9 2/8] xen: do not free reserved memory into heap
Thread-Topic: [PATCH v9 2/8] xen: do not free reserved memory into heap
Thread-Index: AQHYm/wkzpoqdfP5/kKS0Y1Fu7qjpq2PPrOAgADESLA=
Date: Tue, 26 Jul 2022 03:15:50 +0000
Message-ID:
 <DU2PR08MB73252119B3E6DDB28E429589F7949@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-3-Penny.Zheng@arm.com>
 <ee54bbc8-980a-7119-2e49-a12128ea3d88@suse.com>
In-Reply-To: <ee54bbc8-980a-7119-2e49-a12128ea3d88@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B63E34946A664C4B8CDA3C512FCE3E4A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 125a9e94-67d5-4e84-4102-08da6eb52d0a
x-ms-traffictypediagnostic:
	VI1PR08MB3726:EE_|VE1EUR03FT044:EE_|GV1PR08MB8106:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7Bjxfz+hRRSnTYlBysTystzBvriKVOFIdBU3RO0lUVz/DH0zkLoOA+WVn+vjUH5aidHg5v5dVwJ2M26j4piJH2sKi04TZIYZgkAXbPQOVHSzongSy6mYn/2NjquTuv401+YMnATGBvJS4rhKWCia+Y1EH3Zen6G781sTHxcjP0jqggsRlSXEkYBW4LOk32jn4yM/YgN2lH6SDk0uyIHSM1c4yTMlpuFbG0PTr2r1e264mQfvg/wY6DWXWX6Ku2gR6/JyTzKWb2tx57YmkmQMdDqMWSab/QKNHl1HkbGO4y9/VvJkaTg8aY5gAX7YxUCSENsTZe+MhYuD72VshwYrgqKc2PR4jVYsESVVYLtRDL37rbG/MeWmhfBn/SovMo84bLIoklht8Uyy2I4J2hwXlcz+GZwDgamG6ylIAuUVvOxs2cGlFlfsjtQI6nsG6PRXaESTRNdSUqoD1cHtG/PKzvO8tk9NXvgJ6xrB5SJmvBTGzkSYU9GmVAjbu4wLduGatECypAKi+PCoGmbDmKz65B+CQlqgLsrKcXKmLnVUJZ7QGxp/5HR/IPxDN+gaLrcxnTAnixRoWYoke3LMoAylzHoc8rz+jXzq/bt4pgvOBV9O2+ArKA5ZJHvp8BqrdmX8lUoB/mpYqcSiDRyb3mSxR/u4fZrerg+23RnRxiD8jbxTZKRXj3JesrR9FSImLrIf97RO+FgddoKYxjZpSk8BkNZQJeS4dJZ5pFn2nYNH/4w8f/3+7+O9B8dR6sdwvr1HCmgBvY3u+cNFz2sc28KN9zsXupd0yc/e2LYtY9e2HSQm8KaZi7FoWZz9b/wQ9GO7tdm6bFb2FDAgHkE+i+TV53TeBvAAWiAxCaDxoDZ2kaI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(66446008)(8676002)(83380400001)(38100700002)(66476007)(122000001)(54906003)(66556008)(66946007)(76116006)(8936002)(52536014)(33656002)(5660300002)(2906002)(6506007)(186003)(26005)(64756008)(9686003)(41300700001)(4326008)(71200400001)(316002)(55016003)(53546011)(38070700005)(478600001)(86362001)(6916009)(7696005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3726
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f6ded5a-40b1-42c6-6c4d-08da6eb5249d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PkLnpm36NKSzd86EMNrfqkAM7OC9tOJok94BSsdGUyeIvSGb8dFttF0MBkV0wC/y3NjCFoQ1oZj2v/xdwcf5fraCNJrDG1TGHeGiQy4R+9m4dmlH6avllRCYuLTgVtFANNriCSeQK3nMP++ZqZjeAjArM2ujMWggE9TqHGdtY7yvulY0M8GroQRwCgSETI6T8uPcatnXGxc/FGXnVXP+YAdiBFitwXNMgDOBbDuSFqIfXYGRxtAKKonsLgobXd9uMHD2LHmDcgRytRyoxSnj1qQ8oXdxVZQY5cMhnloNF1rZRdcslOc8Y390ZmyKeA0ffXEXWbubAtcosZY3EqbQgibzQdu2lfr6P0HgG54oQ+aw6MHi6nTG8EYlSPAZRPHUb2PtNeAZ5tp7UpR3JbzxLlgNUmWEdIJYRSLxQ7fBw1v4oIc6I+dgqlAj2xhNkjtbJAzRjPaHw9z9fhhIpwJlSEw77j5nC25HOEowg35iXHXiBPfPEj7ZmKIvBqtKlCiyMwy6uWWBEhTD0EnJiG9iSF7in26B37IrqJ2H4NE46eVlzUMaRx3cGlioRzWC3tRlu7aKM1YirtU9Jg76wQL7wLeQA0yN3BK4LDJMbacJZwbgweM+5fIE4NZtrzioVQulHU1KjprXR2xP0tGToyctPFI8O+ql4RW5tZRQiL1kaKgKmLhIyPGy05KlsH4yoX3mbEYAi1EEM20TR3HEd/HiMf2YLKy9LB973wncaQ+wI7G2JxCraNbCn2yefLzPlh7isjmmFwhqRz/oTL0wAsk+z8/byRB2NWP5J/ATEr0RL+qeERJvcIioZBxcV33qYsu5
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(40470700004)(36840700001)(26005)(82740400003)(53546011)(9686003)(81166007)(356005)(70586007)(70206006)(8676002)(4326008)(82310400005)(41300700001)(33656002)(6506007)(7696005)(2906002)(40460700003)(5660300002)(186003)(83380400001)(478600001)(6862004)(47076005)(86362001)(52536014)(8936002)(336012)(40480700001)(316002)(36860700001)(54906003)(55016003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 03:16:04.9191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 125a9e94-67d5-4e84-4102-08da6eb52d0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8106

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgMjUsIDIwMjIgMTE6
MzAgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPg0KPiBDYzogV2Vp
IENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgQmVydHJhbmQg
TWFycXVpcw0KPiA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgVm9sb2R5bXlyIEJhYmNodWsN
Cj4gPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT47DQo+IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OSAyLzhdIHhlbjogZG8gbm90IGZyZWUgcmVz
ZXJ2ZWQgbWVtb3J5IGludG8gaGVhcA0KPiANCj4gT24gMjAuMDcuMjAyMiAwNzo0NiwgUGVubnkg
Wmhlbmcgd3JvdGU6DQo+ID4gUGFnZXMgdXNlZCBhcyBndWVzdCBSQU0gZm9yIHN0YXRpYyBkb21h
aW4sIHNoYWxsIGJlIHJlc2VydmVkIHRvIHRoaXMNCj4gPiBkb21haW4gb25seS4NCj4gPiBTbyBp
biBjYXNlIHJlc2VydmVkIHBhZ2VzIGJlaW5nIHVzZWQgZm9yIG90aGVyIHB1cnBvc2UsIHVzZXJz
IHNoYWxsDQo+ID4gbm90IGZyZWUgdGhlbSBiYWNrIHRvIGhlYXAsIGV2ZW4gd2hlbiBsYXN0IHJl
ZiBnZXRzIGRyb3BwZWQuDQo+ID4NCj4gPiBUaGlzIGNvbW1pdCBpbnRyb2R1Y2VzIGEgbmV3IGhl
bHBlciBmcmVlX2RvbXN0YXRpY19wYWdlIHRvIGZyZWUgc3RhdGljDQo+ID4gcGFnZSBpbiBydW50
aW1lLCBhbmQgZnJlZV9zdGF0aWNtZW1fcGFnZXMgd2lsbCBiZSBjYWxsZWQgYnkgaXQgaW4NCj4g
PiBydW50aW1lLCBzbyBsZXQncyBkcm9wIHRoZSBfX2luaXQgZmxhZy4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBlbm55IFpoZW5nIDxwZW5ueS56aGVuZ0Bhcm0uY29tPg0KPiANCj4gVGVjaG5p
Y2FsbHkNCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4g
DQo+IE5ldmVydGhlbGVzcyB0d28gcmVtYXJrczoNCj4gDQo+ID4gK3ZvaWQgZnJlZV9kb21zdGF0
aWNfcGFnZShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKSB7DQo+ID4gKyAgICBzdHJ1Y3QgZG9tYWlu
ICpkID0gcGFnZV9nZXRfb3duZXIocGFnZSk7DQo+ID4gKyAgICBib29sIGRyb3BfZG9tX3JlZjsN
Cj4gPiArDQo+ID4gKyAgICBBU1NFUlQoZCk7DQo+IA0KPiBJIHdvbmRlciB3aGV0aGVyDQo+IA0K
PiAgICAgaWYgKCB1bmxpa2VseSghZCkgKQ0KPiAgICAgew0KPiAgICAgICAgIEFTU0VSVF9VTlJF
QUNIQUJMRSgpOw0KPiAgICAgICAgIHJldHVybjsNCj4gICAgIH0NCj4gDQo+IHdvdWxkbid0IGJl
IG1vcmUgcm9idXN0IGxvb2tpbmcgZm9yd2FyZC4NCj4gDQo+ID4gLS0tIGEveGVuL2luY2x1ZGUv
eGVuL21tLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaA0KPiA+IEBAIC04NSwxMyAr
ODUsMTIgQEAgYm9vbCBzY3J1Yl9mcmVlX3BhZ2VzKHZvaWQpOyAgfSB3aGlsZSAoIGZhbHNlICkN
Cj4gPiAjZGVmaW5lIEZSRUVfWEVOSEVBUF9QQUdFKHApIEZSRUVfWEVOSEVBUF9QQUdFUyhwLCAw
KQ0KPiA+DQo+ID4gLSNpZmRlZiBDT05GSUdfU1RBVElDX01FTU9SWQ0KPiA+ICAvKiBUaGVzZSBm
dW5jdGlvbnMgYXJlIGZvciBzdGF0aWMgbWVtb3J5ICovICB2b2lkDQo+ID4gZnJlZV9zdGF0aWNt
ZW1fcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsIHVuc2lnbmVkIGxvbmcgbnJfbWZucywNCj4g
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIG5lZWRfc2NydWIpOw0KPiA+ICt2b2lk
IGZyZWVfZG9tc3RhdGljX3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSk7DQo+ID4gIGludCBh
Y3F1aXJlX2RvbXN0YXRpY19wYWdlcyhzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBzbWZuLCB1bnNp
Z25lZCBpbnQNCj4gbnJfbWZucywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCBtZW1mbGFncyk7IC0jZW5kaWYNCj4gPg0KPiA+ICAvKiBNYXAgbWFjaGluZSBw
YWdlIHJhbmdlIGluIFhlbiB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuICovICBpbnQNCj4gPiBtYXBf
cGFnZXNfdG9feGVuKCBAQCAtMjEyLDYgKzIxMSwxMCBAQCBleHRlcm4gc3RydWN0IGRvbWFpbg0K
PiAqZG9tX2NvdzsNCj4gPg0KPiA+ICAjaW5jbHVkZSA8YXNtL21tLmg+DQo+ID4NCj4gPiArI2lm
bmRlZiBQR0Nfc3RhdGljDQo+ID4gKyNkZWZpbmUgUEdDX3N0YXRpYyAwDQo+ID4gKyNlbmRpZg0K
PiANCj4gVGhpcyBkaXNjb25uZWN0IGZyb20gYWxsIG90aGVyIFBHQ18qIHZhbHVlcyBpc24ndCB2
ZXJ5IG5pY2UuIEkgd29uZGVyIGFzIGhvdw0KPiBiYWQgaXQgd291bGQgYmUgc2VlbiBpZiBBcm0g
a2VwdCBpdHMgI2RlZmluZSB0byAwIHByaXZhdGUsIHdpdGggdGhlIGdlbmVyaWMNCj4gZmFsbGJh
Y2sgcmVtYWluaW5nIGluIHBhZ2VfYWxsb2MuYy4NCj4gDQoNCkl0LCByaWdodCBub3csIGlzIG9u
bHkgdXNlZCBpbiB4ZW4vYXJjaC9hcm0vbW0uYyBhbmQgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMu
DQpJdCBpcyBvayB0byBsZXQgQXJtIGtlZXAgaXRzICNkZWZpbmUgdG8gMCBwcml2YXRlLCB3aXRo
IHRoZSBnZW5lcmljDQpmYWxsYmFjayByZW1haW5pbmcgaW4gcGFnZV9hbGxvYy5jLg0KDQo+IEph
bg0K

