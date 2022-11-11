Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FBC6255B9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 09:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442361.696456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otPhm-0000aN-Cb; Fri, 11 Nov 2022 08:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442361.696456; Fri, 11 Nov 2022 08:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otPhm-0000XU-7t; Fri, 11 Nov 2022 08:48:06 +0000
Received: by outflank-mailman (input) for mailman id 442361;
 Fri, 11 Nov 2022 08:48:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4L/=3L=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1otPhk-0000XO-UI
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 08:48:05 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2042.outbound.protection.outlook.com [40.107.22.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bf78eb3-619d-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 09:48:03 +0100 (CET)
Received: from DB9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:1da::18)
 by AS2PR08MB9943.eurprd08.prod.outlook.com (2603:10a6:20b:546::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Fri, 11 Nov
 2022 08:47:57 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::7a) by DB9PR05CA0013.outlook.office365.com
 (2603:10a6:10:1da::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 08:47:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 08:47:57 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 11 Nov 2022 08:47:57 +0000
Received: from 585ade191016.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C5D9AE2E-4E69-4114-B3E4-426C167EE7D4.1; 
 Fri, 11 Nov 2022 08:47:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 585ade191016.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 08:47:51 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DBAPR08MB5735.eurprd08.prod.outlook.com (2603:10a6:10:1a1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 08:47:49 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 08:47:49 +0000
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
X-Inumbo-ID: 8bf78eb3-619d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UDoVX3EJoPm6h5Y2ep1ODqB2fG19GCV7hh/n051/Y6ldy54uW+gYXJbnUUoxXZL5wv83amukw2PfDBW0rSWWhRMysYjskRWQXwBHlIT2EfAdVm/LCb3QEuEuGgrzvqVsMpPXM7u9PbYQb4FVahJU/JK1C402HmN3iBDVIapK17MpT3q6D8IPTe8lpKt0U82YUu677wWgxf5bluGiVst0BHeoeOJePYctg/TNtsUbTDTF/HS65LiUkjY00P6NkDravqbzkfs+66SDdaghPC+yJIa0vBu/XNoqvU61bNCu+kGLUWEZ2dD8zaJLewWU/tFsUNwF9zQUOvrUk5c/CJKNkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XmmDx9oXfjzp+Pt4XxDc/KYVeY5G1xcwQlLS/djCSo=;
 b=DSXhFj663X1lUubjgve84OnnYi8IoYC5X0z0P8zQjnb52S8/w9h2bTdPvnfng1fnTYRqA3tID81bVpFrT4uLiwZQtf5aeiq0M5eZYayN6PGw4hCzwjUbblCqjQoike52h0k0bVDjXuwKgQ0kDzNav6Np/Atj8qo8wzlrBXf2pc3HZ3hkTwODMqGIa3ODfTyJm7SGnyRFp6uClKo9hE1wmLwEB/hJi1ZusK6Nn0m6dNrftOhUX//lo0cMiarT73++6jqFjo2FOzwDN8Q9zPrSRdBdP8NirrmmJsqMN0x1OAMYmTMYN9Uhqrydr/0MzVRu3AC/HqfBpP+aMJbvplGYQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XmmDx9oXfjzp+Pt4XxDc/KYVeY5G1xcwQlLS/djCSo=;
 b=wgmuxiS65oaV2JJFSgfQvxo+Ka7Bp0zu9c6gmS2RDQiS7iErWOdhDNhG8CfJkQWrWfOxcs0J87aBUJaq8e2Bjctu1/rgd4w27g7u9KHwmObRay7S0hwVnHI4EzMRjy3I3vEJHN1LPoZ0rNwQ8EUaR41t40bbu37vlBB2rYIZcOI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d3b40075698a225
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmNFCTf41CM3xxTjL+k2S3j2U8SoUxALHk3/7H38aY7yjUDs0ahWQornrMWkdLfjrM/qWkO1LeBRu3IF6pojLXkfQxQJs+DtiG3gxjP09GwrT+oZz+ZWoyQ64L5M4QsOOu0Isp4t5I6h3NfU/bK9zD0vrAKJ+bJdZyJrAchpjAf2r10o1asY+EvfLuuPILvytCx9vHRPfG9MRqPEE0Tx5xA1B1sFMsYDmHu48vsoULG400QE32WvSehdqWfY7C1VXb+/VQwV95F6gLWEc2z5VJH1/GhudvgMhHjYxfG0o4Al7NgcUuTPeF66VrM05ZNrd4Dl2Hc29MrNGu3k7mAP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XmmDx9oXfjzp+Pt4XxDc/KYVeY5G1xcwQlLS/djCSo=;
 b=X5O72lIfJ6w0M7ZDuc2CfCqECICRyRrV4BT9E0OZ+scDUhuZ1nvbVnrjSp4Ry+BsiF4BM0VZLXDYPiUWGoo20GQgR4G/kwy3JiYNx2PJyEwATluZyj6KqyUEnaf5MiXLN/KcabloPBYaLnkxv2w8HsWE75Bhp14yBFxlPxp4FZrZqaBIKc4C5tYUhIEA6MApQMaNL8Z2V2NMXNkKh/W15KDk9zs/t6mfR23zzOX92jMBkf2wsDTaWHMKr4CAx+SE7zDk69ZTR6p3ENCQGiZBuhGAxhPQxIHJTXB95+en+oc5alqgUZJhHo7+j5y1Z4j2CbzWuxCOS2JnfkYIOP1lnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XmmDx9oXfjzp+Pt4XxDc/KYVeY5G1xcwQlLS/djCSo=;
 b=wgmuxiS65oaV2JJFSgfQvxo+Ka7Bp0zu9c6gmS2RDQiS7iErWOdhDNhG8CfJkQWrWfOxcs0J87aBUJaq8e2Bjctu1/rgd4w27g7u9KHwmObRay7S0hwVnHI4EzMRjy3I3vEJHN1LPoZ0rNwQ8EUaR41t40bbu37vlBB2rYIZcOI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Topic: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Index:
 AQHY7TFh2hDh7VPqHUGkPo4tUdJZza4okuGAgAAFoQCACog5gIAEOL6AgAB51ICAANd5AIAAz2MA
Date: Fri, 11 Nov 2022 08:47:48 +0000
Message-ID: <B476DC51-3800-42EE-A423-95E3A19F11A1@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
 <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
 <alpine.DEB.2.22.394.2211091613160.50442@ubuntu-linux-20-04-desktop>
 <46c0e05f-47e1-39e6-d978-9f6c7d6db53a@amd.com>
 <alpine.DEB.2.22.394.2211101222230.50442@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2211101222230.50442@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DBAPR08MB5735:EE_|DBAEUR03FT058:EE_|AS2PR08MB9943:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a6d0d0-e4da-4338-a6ca-08dac3c16e50
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 8nqAuAk1zky22tWZMVfVl7JinUk/VBQzucZAAuLXr5AUxR2LeOgnZrSnrg3dH4UP3Vp/WHKwVJvT6wQKVPMZg8Mkw5/J1vlw5hFwBdG1Tw1on86AfCDsEZYHz61WnMmPTYs8X7XnTnA+RBrOveOlZDYyJmnvGNiUjBzP4883ZQ/oA5r/tN1a7/jkpob6U3QoRv+Mi5wnt+S8JqBIL4r59BWFYjPK9Yl0lKGxJIKealxApWkrenGyQSfqIJvylFShZsiZJpmUaG2vsHEeJctZe1xjf3Bo6lA8l1oFRCIgM3bs1CnAa1tgyp8zUJrfXoIceXjWexW/8iAyul+0DtyC+j3k6YlzjlPUOKnB6vrXPrq9B6TWY8PqSSiFuyRndyhaWYaFeVkl+DJ/4oD8328vMu4KNaDHmjR1ozUE0Z3JnvQuRc5HWMlTmpJ/psCtP5kNDCNgWCAF0I4EWpBXMNazhQjN1dciS+Xz3tV+kUIAKbIVBa1nKvtOtoWaSPpt0JcI/ZgJiYfmYruM71EuHf+QZPkjFS4101kOUdLLhI4LJa3fNBjoAuTZZuNa3bFXHjSITqe+lJc2GhQJUd7R5hKEYU91eAtG7XP10rY8X9qcGJExgHS4UitQMmHLkv0tJZ+6PI0I2B0d4g+HcIr7Nr93TmDQ++f6AuJ7EuZIiW7h6Qr8VtXvAdvLE+ZxcWyxPKtEz03yx4y0MC8mZ02Yyxo+4vZoYF21VgdiomXyFOUqAQhynG74S6tGVHcpMjfkwUS2TUBdiLu/HzSG64LaiBY+Vgr6XB+HspN/2/DxBWScYq5eUx/YYCnRXaG4Lgw6jJoKExz/cmf5r7V5Dv5D7YpX8A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199015)(33656002)(86362001)(36756003)(122000001)(38100700002)(5660300002)(2906002)(8936002)(26005)(186003)(83380400001)(2616005)(38070700005)(6512007)(66446008)(91956017)(54906003)(316002)(66476007)(64756008)(6916009)(76116006)(66556008)(41300700001)(8676002)(66946007)(4326008)(966005)(71200400001)(53546011)(6486002)(6506007)(45080400002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <77957D1AE399A540B3F45D2795C75AB6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5735
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	03e144a2-8ace-4610-1c07-08dac3c16954
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CVZoIEU4uUOxR+IEgLhKnAdl5k4fY3IB1jzK8BPte614JT4u/JfeeQK6iqR9pDYX3xo4/WTihpSsiVj2hZ9M//hzqGAcec6PhT5TQ8Ft0TCyiTL1S0MOCNG7YsTsSUDz+NMHEdF/1PgKRyN6SHGsRJdZshj8z4oeI0MU9OzvGuuakGFHTeHiK4Uy2rWNl5Op8RB8elr3/Knxzch/X1V5KUWrNPoOHftgWFUelnM1ImKQPICNZAQb91fgkeZ/hl/BexgMr8gxpvIBlif9JVk3ksCt4h9hmCiu4g4imKUtsxdcy2n1LRLFvybby3InpaYDGQISCMJ85GiinMEwZ1tO9g7NEvcUNap4m6ouR2cELRAGSgf47FFp6y5ZXNCxgzGnXgv710zpzCwoNISUZwjj4Pw8QTB2S/VOJZGOCVBrflEtesmiQFvobHj/ukPFzhfuQggxTRHyrJDw6n1g5KCFjL2vpkjByj2Ny+VbktWi0nR5x1pPdnFw83TMNgLU2b82uWncuGR2N9qCcTO217pbZ6f04zU/Kaw6RFkmKzI3ZkZSGeMQLPB0y8CTCD8aP2vLjZJdIOY8IQrAj/qCtmSU2v2zoM2rlc0Jsp7bomFQPUVDbzeGnZOPQb1G+wG4LERys6eIKfWsWya+huC+1yhgioIbjyDaxgsslvKngZUNVd375AaqIVCf/uUjzTfaG8grOHaOgakNE2wHZqnCsmBEa4S+NhBn3yjN4a0bDbW4iGVjoR1g0OnaG/uShpaE49oYwdNosSA/9teJDmKm1Th2Tayf7C7yo5Xtj6PVduDyWh4g59cD/bKFcDEypvuFKZ4y
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(396003)(346002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(2906002)(966005)(33656002)(356005)(40480700001)(81166007)(6486002)(478600001)(26005)(83380400001)(36860700001)(82310400005)(86362001)(6506007)(186003)(70586007)(336012)(45080400002)(8936002)(82740400003)(40460700003)(6512007)(107886003)(6862004)(5660300002)(2616005)(41300700001)(47076005)(8676002)(53546011)(70206006)(316002)(54906003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 08:47:57.3074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a6d0d0-e4da-4338-a6ca-08dac3c16e50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9943

Hi Stefano,

> On 10 Nov 2022, at 20:25, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Thu, 10 Nov 2022, Michal Orzel wrote:
>> Hi Stefano,
>>=20
>> On 10/11/2022 01:18, Stefano Stabellini wrote:
>>>=20
>>>=20
>>> On Mon, 7 Nov 2022, Michal Orzel wrote:
>>>> Hi Bertrand and Stefano,
>>>>=20
>>>> On 31/10/2022 16:00, Bertrand Marquis wrote:
>>>>>=20
>>>>>=20
>>>>> Hi Michal,
>>>>>=20
>>>>>> On 31 Oct 2022, at 14:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>>>>>=20
>>>>>> Hi Bertrand,
>>>>>>=20
>>>>>> On 31/10/2022 15:00, Bertrand Marquis wrote:
>>>>>>>=20
>>>>>>>=20
>>>>>>> This patch series is a first attempt to check if we could use Yocto=
 in
>>>>>>> gitlab ci to build and run xen on qemu for arm, arm64 and x86.
>>>>>>>=20
>>>>>>> The first patch is creating a container with all elements required =
to
>>>>>>> build Yocto, a checkout of the yocto layers required and an helper
>>>>>>> script to build and run xen on qemu with yocto.
>>>>>>>=20
>>>>>>> The second patch is creating containers with a first build of yocto=
 done
>>>>>>> so that susbsequent build with those containers would only rebuild =
what
>>>>>>> was changed and take the rest from the cache.
>>>>>>>=20
>>>>>>> The third patch is adding a way to easily clean locally created
>>>>>>> containers.
>>>>>>>=20
>>>>>>> This is is mainly for discussion and sharing as there are still som=
e
>>>>>>> issues/problem to solve:
>>>>>>> - building the qemu* containers can take several hours depending on=
 the
>>>>>>> network bandwith and computing power of the machine where those are
>>>>>>> created
>>>>>> This is not really an issue as the build of the containers occurs on=
 the local
>>>>>> machines before pushing them to registry. Also, building the contain=
ers
>>>>>> will only be required for new Yocto releases.
>>>>>>=20
>>>>>>> - produced containers containing the cache have a size between 8 an=
d
>>>>>>> 12GB depending on the architecture. We might need to store the buil=
d
>>>>>>> cache somewhere else to reduce the size. If we choose to have one
>>>>>>> single image, the needed size is around 20GB and we need up to 40GB
>>>>>>> during the build, which is why I splitted them.
>>>>>>> - during the build and run, we use a bit more then 20GB of disk whi=
ch is
>>>>>>> over the allowed size in gitlab
>>>>>> As we could see during v2 testing, we do not have any space restrict=
ions
>>>>>> on the Xen GitLab and I think we already decided to have the Yocto
>>>>>> integrated into our CI.
>>>>>=20
>>>>> Right, I should have modified this chapter to be coherent with your l=
atest tests.
>>>>> Sorry for that.
>>>>>=20
>>>>>>=20
>>>>>> I will do some testing and get back to you with results + review.
>>>> I did some testing and here are the results:
>>>>=20
>>>> In the current form this series will fail when running CI because the =
Yocto containers
>>>> are based on "From ubuntu:22.04" (there is no platform prefix), which =
means that the containers
>>>> are built for the host architecture (in my case and in 99% of the case=
s of the local build it will
>>>> be x86). In Gitlab we have 2 runners (arm64 and x86_64). This means th=
at all the test jobs would need
>>>> to specify x86_64 as a tag when keeping the current behavior.
>>>> After I built all the containers on my x86 machine, I pushed them to r=
egistry and the pipeline was successful:
>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgi=
tlab.com%2Fxen-project%2Fpeople%2Fmorzel%2Fxen-orzelmichal%2F-%2Fpipelines%=
2F686853939&amp;data=3D05%7C01%7Cmichal.orzel%40amd.com%7C2449f063e67341c3b=
95a08dac2b112a5%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63803636302770=
7274%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DEwTJrW2vuwQIugKc7mnzG9NNbs=
YLP6tw5UODzBMmPEE%3D&amp;reserved=3D0
>>>=20
>>> When I tested the previous version of this series I built the
>>> containers natively on ARM64, so that is also an option.
>>>=20
>>>=20
>>>> Here is the diff on patch no. 3 to make the series work (using x86 tag=
 and small improvement to include needs: []):
>>>> ```
>>>> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/tes=
t.yaml
>>>> index 5c620fefce59..52cccec6f904 100644
>>>> --- a/automation/gitlab-ci/test.yaml
>>>> +++ b/automation/gitlab-ci/test.yaml
>>>> @@ -65,6 +65,9 @@
>>>>     paths:
>>>>       - 'logs/*'
>>>>     when: always
>>>> +  needs: []
>>>> +  tags:
>>>> +    - x86_64
>>>>=20
>>>> # Test jobs
>>>> build-each-commit-gcc:
>>>> @@ -206,19 +209,13 @@ yocto-qemuarm64:
>>>>   extends: .yocto-test
>>>>   variables:
>>>>     YOCTO_BOARD: qemuarm64
>>>> -  tags:
>>>> -    - arm64
>>>>=20
>>>> yocto-qemuarm:
>>>>   extends: .yocto-test
>>>>   variables:
>>>>     YOCTO_BOARD: qemuarm
>>>> -  tags:
>>>> -    - arm32
>>>>=20
>>>> yocto-qemux86-64:
>>>>   extends: .yocto-test
>>>>   variables:
>>>>     YOCTO_BOARD: qemux86-64
>>>> -  tags:
>>>> -    - x86_64
>>>> ```
>>>>=20
>>>> Now, the logical way would be to build x86 yocto container for x86, ar=
m64 for arm64 and arm32 on arm64 or x86.
>>>> I tried building the container qemuarm64 specifying target arm64 on x8=
6. After 15h, only 70% of the Yocto build
>>>> was completed and there was an error with glibc (the local build of th=
e container for the host arch takes on my machine max 2h).
>>>> This enormous amount of time is due to the qemu docker emulation that =
happens behind the scenes (I checked on 2 different machines).
>>>>=20
>>>> So we have 3 solutions:
>>>> 1) Build and run these containers for/on x86_64:
>>>> - local users can build the containers on local machines that are almo=
st always x86 based, in short period of time,
>>>> - "everyone" can build/push the containers once there is a new Yocto r=
elease
>>>> - slightly slower CI build time
>>>> 2) Build and run these containers for specific architectures:
>>>> - almost no go for local users using x86 machine (unless using more th=
an 16 threads (which I used) and willing to wait 2 days for the build)
>>>> - faster CI build time (arm64 runner is faster than x86 one)
>>>> - someone with arm64 based machine (not that common) would have to bui=
ld and push the containers
>>>> 3) Try to use CI to build and push the containers to registry
>>>> - it could be possible but what about local users
>>>=20
>>> From a gitlab-ci perspective, given the runners we currently have, we
>>> have to go with option 2). We don't have enough resources available on
>>> the x86 runner to run the Yocto jobs on x86.
>>>=20
>> That is what I reckon too. Running the Yocto build/test on CI using x86 =
runner will always be slower.
>> So, if we go with this solution, then the following is needed:
>> 1. Modify test jobs so that yocto-qemu{arm64/arm} uses arm64 tag to be t=
aken by arm64 runner and use tag x86_64 for yocto-qemux86-64.
>> 2. Come up with a solution to build the yocto containers automatically f=
or the above platforms + possibility to specify the platform for local user=
s.
>>   Right now, these containers are being always build for the host machin=
e platform, so without doing tricks like adding --platform or prefix to ima=
ge name,
>>   one cannot build the Yocto containers that would be ready to be pushed=
 to registry. We need to have a clean solution without requiring user to do=
 tricks.
>>=20
>> The only drawback of this solution is that the person building the yocto=
-qemu{arm64/arm} container and willing to push it to registry,
>> needs to have access to arm64 machine.
>=20
> I am fine with this drawback for now.
>=20
> Due to resource constraints, we might want to avoid adding
> yocto-qemux86-64 (if yocto-qemux86-64 has to run on x86) for now, I
> worry it might choke the x86 ci-loop. Or we could add it but keep it
> disabled. We'll enable it when we get better x86 runners.=20


Yocto-qemux86 actually runs quite well on an arm64 platform :-)

Cheers
Bertrand



