Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1C7625BEC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 14:58:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442551.696807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUY7-0002kx-TC; Fri, 11 Nov 2022 13:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442551.696807; Fri, 11 Nov 2022 13:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUY7-0002ib-QA; Fri, 11 Nov 2022 13:58:27 +0000
Received: by outflank-mailman (input) for mailman id 442551;
 Fri, 11 Nov 2022 13:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoG2=3L=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1otUY6-0002iV-AX
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 13:58:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80054.outbound.protection.outlook.com [40.107.8.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8c851a2-61c8-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 14:58:25 +0100 (CET)
Received: from AM5PR1001CA0038.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::15) by PA4PR08MB6127.eurprd08.prod.outlook.com
 (2603:10a6:102:f3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 13:58:22 +0000
Received: from AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::51) by AM5PR1001CA0038.outlook.office365.com
 (2603:10a6:206:15::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Fri, 11 Nov 2022 13:58:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT011.mail.protection.outlook.com (100.127.140.81) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 13:58:22 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130");
 Fri, 11 Nov 2022 13:58:21 +0000
Received: from 6a33e3a41d09.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1EDE3BA0-0121-4D3D-8C65-636DD0069EEF.1; 
 Fri, 11 Nov 2022 13:58:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6a33e3a41d09.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 13:58:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB7958.eurprd08.prod.outlook.com (2603:10a6:10:38f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Fri, 11 Nov
 2022 13:58:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%8]) with mapi id 15.20.5813.009; Fri, 11 Nov 2022
 13:58:13 +0000
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
X-Inumbo-ID: e8c851a2-61c8-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iv3NcsxYsA1YcoeA/4oLtp2DQvO3N13+yDIrMS/28kzZGou1/8+9sMhYrGWXRvKc8DkD9G3bowPy6wKEAguqfW082A8JVXAw4PtDVKsZos6xfG+iC15MXe/XC2nBQ3uiwzCavw2/Z+iQiiYjqvlRZRGkNEfErGKJhy/X6/8aDWIfkqWAB0CqBfXAGFFbFNqCpav4xdCuM1UZDCFP7hmHsS/iZRHIvhWnNiBeGfVMHaGi1nlBLjDXKlOXCmZbGkhPCnFoSoc+deiIHyxxmiQ2Qy6QmHACTWW0ipnpobtBGef8lWG9G/jt4eEtuNt1XmEmZbpr2AsAIfRmdWsPOkrLqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxgM71bdUWDiIaORyQCjR1xnPaHpLLNXjJNEsaJFXEA=;
 b=j36Eh0eNZ+UGQbA/5NWIZkJvFmJ0ehfUnG5RKPa72fx6+qedu5eQnDBcWOQtXC1yzjOFQJXh4l7zawyWZXSvpF6Y9jTWXYIOlwWurR7onNLzpIq/Cyv0HN3sIbda7uSkN/kc15z8vZDxOsVQYOZX/pYREs79WUjB3f/ln/u4aARPPq1aXfkmU5j/FUtshAYAuOVL7eoQqLVni4joLShTi1r9dOo3ui5xszMCw2BKGd99PR1oS9CugwW9411eJ2GZZM6iJDe+EKc+FvtXAF3bRPif2p5mdmRehKf4tpY7AzDsnwLtPOiujAuY3l7fNwag9lBDGGIwvXREeRc56WRuDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxgM71bdUWDiIaORyQCjR1xnPaHpLLNXjJNEsaJFXEA=;
 b=0kHRcgPbRzMkr02NFD7Fui+Dl+mch244kiR1Nr6w6i5NGFTyO/7QJgNERUZlX6BRRVoBnSyV5J1dmyGxsAcPUXasAsnEAOfJuhKEpgrsk9Ia+yBbyAyjYHLz8hMpjhbbDnFhiPr7QWQ8Tfc6TQWK8gmxdqRlez4RXI75ILiyIig=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9iR2xoF7XKAAGzePg6vVoUV20eyTRJT15jtPfJFyUozjbbqPDUvhhcLOv+6sYvLpeusocEEGMuwY13XlaQxQKlaMbS0Nhm4TwB7uC5C4e9AsYWR65OqT+gS6aWHl8UXLE9ziFgRBMZuWjPLElYsAE8pQgM+vC+qK3MMEAUJESEqW/tOF61A3vqCEC4w9wu/qKCbN/HrM3d5VwHhWpXjW8nvbTs/9lbf9WT2OgP1BEJG5ak/tDgQj5665x8gmqE5n1vR9EBADf2l2clYWOSLVL+/0nSPfBJFqvWA5g+kH3Pmjk4me0CfYVZ/5UE9zhDGsJE4TpNcBVVMSb8io0K/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxgM71bdUWDiIaORyQCjR1xnPaHpLLNXjJNEsaJFXEA=;
 b=NbffnxFzB6WzYdWAebdAkAYU+3WwksBRlGEVitSXDqx5ZQD6RtmJV2kA3U+uYvKPaP7F1Ch0uWGHNtPWFEFem3xpZhwM6hlgcxYwgkAJOywW4Ko5ssohUULc3+J6M4O/qbKjOME5L/QiGGavrH/MMOkhjFnL4f6+5cPZsw9PqNFo/ojCCxFZ4zf5dnR9yZD8VwUlPbVmgcayIDVQ+JDfTUZHcN4J4BOJLZtKUP1lCpFQzJqDPaMmLPNEz3NSYMID/Xhs5pAkI3zgs3lmdcPb+IWUSBy85i23mBPUK/J1wET9wy17CamJMn0SIV3UbEDTnFgSSL10TC9jWLGSRxHFCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxgM71bdUWDiIaORyQCjR1xnPaHpLLNXjJNEsaJFXEA=;
 b=0kHRcgPbRzMkr02NFD7Fui+Dl+mch244kiR1Nr6w6i5NGFTyO/7QJgNERUZlX6BRRVoBnSyV5J1dmyGxsAcPUXasAsnEAOfJuhKEpgrsk9Ia+yBbyAyjYHLz8hMpjhbbDnFhiPr7QWQ8Tfc6TQWK8gmxdqRlez4RXI75ILiyIig=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Topic: [PATCH 2/3] CHANGELOG: Add missing entries for work during the
 4.17 release
Thread-Index: AQHY9cAA3X9w+pjMxES5dLMt0fkbDa45tnoAgAABRRA=
Date: Fri, 11 Nov 2022 13:58:13 +0000
Message-ID:
 <AS8PR08MB799165ABD2B1FA2BFD7B48D592009@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221111112208.451449-1-Henry.Wang@arm.com>
 <20221111112208.451449-3-Henry.Wang@arm.com>
 <4482952f-86a9-d232-6cf5-afa6523012dc@suse.com>
In-Reply-To: <4482952f-86a9-d232-6cf5-afa6523012dc@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2993D9F48A2B1046B4DF9B38069EE25D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB7958:EE_|AM7EUR03FT011:EE_|PA4PR08MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 4810428d-24d4-4f1a-82e9-08dac3eccb89
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 G+/M5ApMYz+Z8ttnqfDHAkmlYaHepU+NPxrdYkF5cXz66hL4/jfzL9aF5RQxgL/0vccigfHdiCs2VzMoPNORGPsxFRTp1q+r/+bCBurCWOWkgGvZh+Qb+hXLfPLaajgJv/8hrnuQSKQMMmjm/QMyMKrk7E/Bgk/jZXF4hiYw65yTDd9KzWYevrxnqFu2VVjTriYWE+Ldn6fl8dQc7uWnSehB45l0fNJhcQlRk5abfP5e/nAHXWH6soA+HDHmduCErN1Ut2OEFe+cnl9HcpQR0Exe5vkq/CL31ztCthHLXzLlnnRSCitVa3xXMfLkcnqAKPpnHIgZpRAksYsqyuha0fGF3BaXDX1yFXzoPlIyk/mrlJdcloCqFHshM1Gl9e5WoxX1/sg72PAmJvReA2n4F1sknAS+69Nenc+nZliJS3hIRHpfefoSTToStpfZlY1or0CB4RLIi4cbBNEjmaFk/cv8xXqbqvq6Z5cBUNloaTigWvi765I2C7jzwXLZSEnyRZGOmjMVXkoNRtO+QvZstwSktNicBCHegcKgERu84BeJYbR5n30bFICxCrHrOIMpv3E5cjM9CG7vphFlBqZ6kUonM086sDv6WAqdJ0B2rc/7ra8+jK9ZN6maWBI2KdbIOWoduADYa16YG4AEw4KltCfJwpcGeIKMdjcDq8ZL7ZuXCn9BJsLeXuWTRGE1YhlJgiXLQTROZAY6jeagpiwjclpaWMqK+iArlTQRedhc15ePn07EkFErCHB5y0GPNFbg6eGxgUQi4frlXm6FgP+yonL71UWqDcNR7BsNWdluY94t8Ka0nQZk37Fv0E5tmOKDw/TNOtIkVUYn+khMjfzyeohvXpwEefF+05sH/skF9bs9LkQ7SJP+6nQj3x9z6spn
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199015)(8936002)(53546011)(33656002)(6916009)(8676002)(966005)(55016003)(4326008)(38070700005)(83380400001)(66946007)(478600001)(2906002)(7696005)(76116006)(52536014)(66476007)(41300700001)(316002)(66446008)(64756008)(71200400001)(122000001)(66556008)(26005)(186003)(9686003)(5660300002)(6506007)(86362001)(38100700002)(59356011)(207903002)(219803003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7958
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1c445d06-8781-4b16-49ff-08dac3ecc634
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0nTdUQNRO0R7IyqMWOhQ85tdTSx+u6rgLCXWOq9Uh6MgeOM40T7bXzCBew/Mb6j0EaranJBCp3ZQGx381do+OgyY8aPxNL4w50p4xy7i+3bLLtVzytRqLWcv6m3cbcGWdbZ0zGz6YMb63cuddh1m8g+J2ETT5vdIkk87IKdE4RYhJpHxn+CGaQwjcsQSisrrjgO3kDvqVgskMoxcp2TsNzso9O7d3lQdbznDxGchNrwnHthP0NBT7YblzHVfUZ+dzVa0a2HNDDCdMmYTPiid4ucwaGi1uTahI4f6X1geAHPbGMoPb31b7ufwnxPOPPUe1Pt3hQfoO6fi/hgyG0O6KNlMw2TCBzvXQ2oPDt+anM9eg6zbHMLldjMSO1jnlEZ9aihzjdIJmehuJCk7vbfjVUw3Vs7t15ZfHX5nMbs0twM9m8trzaVvgACX2a0KhR2lLKdnn1ToMa+PNt+OHqQKKEg0/04XBtRhUvP+5nci71910pfMeyAsfX54HIJ+jXS9CBVq3/eXkGscBN9YNa4dyYANDFGMOmveimjvgCQpnjFMJy4B44rYDKi7mTRpwEWCFGPz5nG3XOP6Umi4BTGvvEfPkY4FOM8m5OOHYOy8Lg97vDfcsqDI6kDB6e9ioeIymSPAoF66i3S+ScYwNOdt5vCrs2Fg7qrt1UfH0bOo/3FmN7fWRKekE7CjXcl54IJbgtC2+K6anUzzI09Bi2h0wAZMqmviabnhpX1iTGVhZyQu4UzFvKdlpXF6MvdHN4bpmVTus1F64u002P3xoDT7wFwmQLmLo+rIR+P8P28r72cmzoX4LXATY0fAbzJ7x/U/06GBYnHIVDgzf4YfvFBxdrGy7IZcfbHsy4+PObujZgte79ggQvlxi0Q+AcVKluG4
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(81166007)(6506007)(4326008)(40460700003)(33656002)(7696005)(26005)(356005)(70206006)(2906002)(82310400005)(86362001)(70586007)(47076005)(186003)(52536014)(5660300002)(83380400001)(336012)(82740400003)(966005)(8936002)(36860700001)(41300700001)(478600001)(53546011)(316002)(9686003)(55016003)(8676002)(6862004)(40480700001)(59356011)(219803003)(207903002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 13:58:22.0206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4810428d-24d4-4f1a-82e9-08dac3eccb89
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6127

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8zXSBDSEFOR0VMT0c6IEFkZCBtaXNzaW5nIGVudHJpZXMgZm9yIHdvcmsgZHVyaW5n
DQo+IHRoZSA0LjE3IHJlbGVhc2UNCj4gDQo+IChyZWR1Y2luZyB0aGUgQ2MgbGlzdCB0byBqdXN0
IHhlbi1kZXZlbEApDQoNClRoYW5rcyBmb3IgZG9pbmcgdGhpcyA6KSBJIHdhcyBqdXN0IG5vdCBz
dXJlIHdobyB3b3VsZCBiZSBpbnRlcmVzdGVkIGluIHRoZSBzZXJpZXMuDQoNCj4gDQo+IE9uIDEx
LjExLjIwMjIgMTI6MjIsIEhlbnJ5IFdhbmcgd3JvdGU6DQo+ID4gICMjIyBBZGRlZCAvIHN1cHBv
cnQgdXBncmFkZWQNCj4gPiArIC0gT3V0LW9mLXRyZWUgYnVpbGRzIGZvciB0aGUgaHlwZXJ2aXNv
ciBub3cgc3VwcG9ydGVkLg0KPiA+ICsgLSBUaGUgcHJvamVjdCBoYXMgb2ZmaWNpYWxseSBhZG9w
dGVkIDQgZGlyZWN0aXZlcyBhbmQgMjQgcnVsZXMgb2YgTUlTUkEtQywNCj4gPiArICAgYWRkZWQg
TUlTUkEtQyBjaGVja2VyIGJ1aWxkIGludGVncmF0aW9uLCBhbmQgZGVmaW5lZCBob3cgdG8gZG9j
dW1lbnQNCj4gPiArICAgZGV2aWF0aW9ucy4NCj4gPiAgIC0gSU9NTVUgc3VwZXJwYWdlIHN1cHBv
cnQgb24geDg2LCBhZmZlY3RpbmcgUFYgZ3Vlc3RzIGFzIHdlbGwgYXMNCj4gSFZNL1BWSCBvbmVz
DQo+ID4gICAgIHdoZW4gdGhleSBkb24ndCBzaGFyZSBwYWdlIHRhYmxlcyB3aXRoIHRoZSBDUFUg
KEhBUCAvIEVQVCAvIE5QVCkuDQo+ID4gLSAtIFN1cHBvcnQgVklSVF9TU0JEIGZlYXR1cmUgZm9y
IEhWTSBndWVzdHMgb24gQU1ELg0KPiA+ICsgLSBTdXBwb3J0IFZJUlRfU1NCRCBmZWF0dXJlIGZv
ciBIVk0gZ3Vlc3RzIG9uIEFNRCBhbmQNCj4gTVNSX1NQRUNfQ1RSTCBmZWF0dXJlIGZvcg0KPiA+
ICsgICBTVk0gZ3Vlc3RzLg0KPiA+ICsgLSBJbXByb3ZlZCBUU0MsIENQVSBmcmVxdWVuY3kgY2Fs
aWJyYXRpb24gYW5kIEFQSUMgb24geDg2Lg0KPiANCj4gTWF5YmUgYmV0dGVyICJJbXByb3ZlZCBU
U0MsIENQVSwgYW5kIEFQSUMgY2xvY2sgZnJlcXVlbmN5IGNhbGlicmF0aW9uIG9uDQo+IHg4NiI/
DQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayBmb3IgdGhpcyBhbmQgbXkgcHJldmlvdXMgZW1h
aWwuIFRoZXkgYXJlIHJlYWxseQ0KdXNlZnVsLg0KDQpZZXMgb2YgY291cnNlLCBJIGd1ZXNzIEkg
bWlzdW5kZXJzdG9vZCB0aGUgb3JpZ2luYWwgc2VyaWVzIGFuZCB0aG91Z2h0DQp0aGVyZSBpcyBh
bm90aGVyIGltcHJvdmVtZW50IGZvciB0aGUgQVBJQy4NCg0KPiANCj4gPiArIC0gSW1wcm92ZWQg
c3VwcG9ydCBmb3IgQ0VUIEluZGlyZWN0IEJyYW5jaCBUcmFja2luZyBvbiB4ODYuDQo+ID4gKyAt
IEltcHJvdmVkIG13YWl0LWlkbGUgc3VwcG9ydCBmb3IgU1BSIGFuZCBBREwgb24geDg2Lg0KPiAN
Cj4gU1BSIGFuZCBBREwgc3VwcG9ydCBpcyBuZXcgaW4gdGhlIGRyaXZlciwgbm90IGltcHJvdmVk
Lg0KDQpJIHdpbGwgY29ycmVjdCB0aGlzIGluIFYyLg0KDQpBbm90aGVyIHF1ZXN0aW9uIGZvciBh
ZGRpbmcgYW5vdGhlciBlbnRyeSBmb3IgeDg2IHRoYXQgd29ydGggdG8NCmJyYWcgYWJvdXQgYSBs
aXR0bGUgYml0OiBJIGRpZCBhbm90aGVyIGRpZyBpbnRvIHBhdGNod29yayBhbmQgZm91bmQgdGhh
dA0KdGhpcyBbMV0gbWlnaHQgYmUgYSBnb29kIGNhbmRpZGF0ZS4gSUlVQyBfX3JvX2FmdGVyX2lu
aXQgaXMgYSBnb29kDQpmZWF0dXJlIHRoYXQgYm90aCB4ODYgYW5kIEFybSBoYXZlIGxldmVyYWdl
ZCBpbiBkaWZmZXJlbnQgbGV2ZWwgdG9kYXksDQpzbyBwcm9iYWJseSB0aGUgX19yb19hZnRlcl9p
bml0IG1pZ2h0IHdvcnRoIGFuIGVudHJ5IGluIENIQU5HRUxPRy4NCg0KSG93ZXZlciBJIHNhdyB5
b3VyIGNvbW1lbnRzIGluIFsxXSBzbyBJIGFtIG5vdCByZWFsbHkgc3VyZSBpZiB5b3UgYXJlDQpo
YXBweSB3aXRoIHRoYXQsIG1heWJlIHdlIG5lZWQgdG8gY2hhbmdlIHRoZSB3b3JkaW5nIGEgbGl0
dGxlIGJpdCB0bw0KcmVtb3ZlIHlvdXIgY29uY2Vybj8gV291bGQgeW91IG1pbmQgc2hhcmluZyBz
b21lIHRob3VnaHRzPw0KDQpUaGFua3MhDQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QveGVuLWRldmVsL3BhdGNoLzIwMjIwMzA5MTIzOTM2LjE2OTkxLTMtYW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbS8NCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCj4gDQo+IEphbg0K

