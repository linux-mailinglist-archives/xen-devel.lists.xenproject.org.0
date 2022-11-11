Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A1625B88
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 14:53:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442547.696796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUS3-0001xF-8Y; Fri, 11 Nov 2022 13:52:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442547.696796; Fri, 11 Nov 2022 13:52:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUS3-0001uD-5d; Fri, 11 Nov 2022 13:52:11 +0000
Received: by outflank-mailman (input) for mailman id 442547;
 Fri, 11 Nov 2022 13:52:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4L/=3L=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1otUS1-0001u7-E7
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 13:52:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07fc675a-61c8-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 14:52:07 +0100 (CET)
Received: from DB7PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:10:72::36)
 by DU0PR08MB8836.eurprd08.prod.outlook.com (2603:10a6:10:47d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Fri, 11 Nov
 2022 13:51:53 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::10) by DB7PR03CA0095.outlook.office365.com
 (2603:10a6:10:72::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Fri, 11 Nov 2022 13:51:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 13:51:53 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Fri, 11 Nov 2022 13:51:52 +0000
Received: from c7df5f06e025.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FDAD0144-DC77-4C0A-8B1B-34A7BA91A0D1.1; 
 Fri, 11 Nov 2022 13:51:41 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c7df5f06e025.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Nov 2022 13:51:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB6578.eurprd08.prod.outlook.com (2603:10a6:20b:36a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 13:51:39 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 13:51:39 +0000
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
X-Inumbo-ID: 07fc675a-61c8-11ed-8fd2-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=emnQ+k3LSt2VIAKXCCaCPd2/QsyJYTt8xQki67RR2TDSHUwri0eIiB+N3XFbucwLOW+hsVUVS4+qpIV7l3Q7ZpPA8al3+fj98f1rWHR7yI8Te/f5BHbTZgyeRG8gW7G5unypB9fAibD1Mst1HjPX+E+znGYBe/kHLljs2BFZe/WBLFFO6/Xz1TaLRc6sbxS1Ul/MN+B5DF3c7b4pEHD0y60OKrHfO5W7JsXM2HGbSMex4/ISnKRfXFEuDqI6uEQb4LKtSPrB+2XEtD8N9G6e3rz1BKFaklJ3CfmL3RAhstMompKIrs9oFsSdpkDO4RXYSg/vJIt2zjYs2oRWi6uDbA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfqVXyaICvmhK25swRZqBbV0EKJoVYmMb+psTFZtFgk=;
 b=kZW+KGWA+5UXyYRVuCksTnKl90GOgaTfUdYc3YFjJLTEVVtUVSKL0NQbfA8MEWjhiXePXQQDIOQ+qBlSQcfl4y1mPpDWNFaCjBWvhY0rA/1K3fppSr2MkXqydY3sS+MzbqTtiljb7SxDi0iLy/q7fvLgBwmAq/gvBSyuwi9OLjChUuAzVczuXN0XF3eIcmajpSXYojtElGDcKj85gEUk1Wf3kVf/j9P0jG1iW7JOtWXeqmbpMCUKqTfrAH8/hhICubZmei97XXO4teYurYCuU3jAv2b+G23GP83aJ19yg4OP3K5rEQ9O+JDXzrqktP9rIGNTpb0/OizA4/r9t/9Mkg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfqVXyaICvmhK25swRZqBbV0EKJoVYmMb+psTFZtFgk=;
 b=oB5+5k8YiNUzwyfUeI+H3XABKiufNok3t23kjWa827a+zNSDUgwvkfStUA2OzKfQmrhzvN6w45BoaYJKWxEwPyj1rZUzknrpRhnyGx72RhMCVoFfxvfHvTvLxOFqIr3F1CKnc1tnzpTrHf7EUoaJeqQG9HMXNYvxa4J4XjO0r14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79ec041c3eb3595d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLdEqURQhmZdtck3DgpSphR1gcHonRhyrTFyqtErBFh5Hrh/PnmAga0/fqVJZ0fG0H/JiTex+2WcNL7lNbUvE9391B0FzQLvtBYEHkPpqWxSD3Jh+H1ONaB/Q/7FDWJSWhseKzpa/9OQMD7BI5IWrcMOOKnFVDypwcl7cFgGbSHFI9dR610wDwLGADS5keu6ZezUfvHluLQbHta8GctBx5Tn0c+DGzs02yMLQKm9ebTTM/HAsV5g5+J7Yfrn2OB5+nAEuwx7QbqcOVgv83HAcqzikYIn5HX4GlkgpceWjmprJmxxyvaUIye5ewsYQV+nmOzwbhs6GJQm9hNNwWyuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfqVXyaICvmhK25swRZqBbV0EKJoVYmMb+psTFZtFgk=;
 b=OyJu+swHReFdaDbzpKSrSPRai4bBh5wGbrYRp/Qfe2euy+8ZTJIfAiARMaBx8QM2kYNWAAmNpVCpKMWlJc5VA37AY/r8PoQCIs/PaKpi37GQe8iJUQ09upqifWPTb7cJ07M5X1T60UZ7GVAUdzRJ9b5cEBjD5acdbn0z7EvbqB2H2k5bJuZNovME2Yc9wmEeJ4FFQA5iG7A/HeJfIjYxLzTZc59iy24e7XuZdvvCCdaTjTnm20iqAGAu9qJxF3++MRY3rdhbJz5ig67KkGnSyOJ8LUY3L7CIwWs0ILYGa0SPeLJxeXpu+wGqj2uc/8NhYkf6SPwpaq7lli0c8jn7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfqVXyaICvmhK25swRZqBbV0EKJoVYmMb+psTFZtFgk=;
 b=oB5+5k8YiNUzwyfUeI+H3XABKiufNok3t23kjWa827a+zNSDUgwvkfStUA2OzKfQmrhzvN6w45BoaYJKWxEwPyj1rZUzknrpRhnyGx72RhMCVoFfxvfHvTvLxOFqIr3F1CKnc1tnzpTrHf7EUoaJeqQG9HMXNYvxa4J4XjO0r14=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>, "grant.likely@linaro.org"
	<grant.likely@linaro.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Henry Wang
	<Henry.Wang@arm.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George
 Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Andrew Wafaa <Andrew.Wafaa@arm.com>
Subject: Re: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Thread-Topic: [XEN PATCH for-4.17 3/4] xen: Add licence header to
 device_tree_defs.h
Thread-Index: AQHY7q5sdhpegtQed02rRUz1XHl2w645zBMA
Date: Fri, 11 Nov 2022 13:51:39 +0000
Message-ID: <D374491A-0C9B-4A99-9276-44831EB4BCB2@arm.com>
References: <20221102112854.49020-1-anthony.perard@citrix.com>
 <20221102112854.49020-4-anthony.perard@citrix.com>
In-Reply-To: <20221102112854.49020-4-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB6578:EE_|DBAEUR03FT008:EE_|DU0PR08MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d49211a-bb9a-43b0-e58f-08dac3ebe3a9
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9AQ60l2gKyqA8sQ2iHsRu05dOPDIarUO4psjfSoNTwonoaRirK8J0QJ2zWJM53tRp1jZhg3KlMcfyKLrmIOvtZP6GdkjPVg4YjiMxX6eccwarNm3TEwivlprCKHno/P1Xd3ct2nBnvmMb3uOLLhOph/q3QIsjIkZZDPsUyzcIt2rMb3PBYg1vf1CWgaGrcHwkqQZurGDXuZ6eiNOwqyX/u+dT2a0F9tEAnP4Y0KMKNrhxEWNJJWJP43FXUVIP2IFQW3wd7jYIKaxlpWxQm+w2JiB8RWAIGDBzPHvI+FNwdGg+5aR+TDfGCgKk64SAFo3KDLy8ic5Hf25Qc/bk0Wn0Qh78hMszhR6inC3sxAfMEN4mq0mIxsfY2SRVUd75cGSoH7+we1KKwcs8IEcJBRiUyE85hspIpYmHvP+8+um8HtjKSTRlI60Q1AebbGK+cecoNqJ4SKwFVRGo2zX7sdXeuaJk37Jdo5jPmYjOH5dtX4Mb3T3/5/9GsKbDIX5VBAGoxSRpzEKpw1lULVG+2uzxu5Koq0ar+SVD8VzzjKySj8NqVH7ljFCen1hfvjmlnLCpesDA5BBG5vvn1zYhdg2MfacZww5OEX2Y9kDELCWAJv60bLwr7Tqbe72/fbUCr4dQ9mQ3zTnM9bKNAYI65MYdSCw4g0pdO+fixqE++CRshm4EFsbdLIILaSLAxy+if6efdFj47AJn1mfziVwC2SOhfVkI8wu4HlXtv36b5s++q2Mhm2U69Hv4kEO9raUUUqmQEYYqFx3SsFVYxYBUgm5t1LaIfPYmzPGTHSM+hqlyGc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(451199015)(316002)(86362001)(36756003)(33656002)(8676002)(64756008)(66446008)(4326008)(66476007)(8936002)(66556008)(83380400001)(66946007)(5660300002)(41300700001)(38100700002)(122000001)(76116006)(6486002)(186003)(478600001)(110136005)(71200400001)(54906003)(26005)(6512007)(2616005)(38070700005)(53546011)(6506007)(91956017)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A10B3751AFFD6244937DA02DD61B6109@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6578
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e3c8b7d2-88ee-434f-ec83-08dac3ebdb52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9EoYgMyOtHM7472dYZ1V/llgoh7i/V+b/bh2YrZsXGTTrdovCiDQ37ImFhmrLwy8iYsE8FWftljTbwEDIOh5Znza2iSUOaJsJ4KDdvZdhQUqSE0BaunNduyHevg5AswYcUqIC985P1kTlwKthb253jLN8yMOoD+k7YEUBCE1RMMzXbB9D5g+d5o7JLd7MZeoHXLNoDvWdrj6LwPyOjY9HP/Y40m9Xnr/Qa7XfHqFVYbOkOzm54NhFiljAbmD6IEPT1l5pzSOC+TZkfPirlBsSWuFMuK/bMhnt2KNkudOnzTjhEV/ljLhczfBxB/M0x9a7pEvVEJuYvsbcCqK7SQyH+grjFR1ISYexCzU73kme7I+9DY5qWK63+ThFl3ah5n5urbhuHG+SHrHNI/nvy03TB6gTrhcaM4jJ710uMNaQ7DCwuaNQeYo08bV3CyfaNbFFYKimVufEdKyI2U+QZA17nNecqFmA4UIy9uMtFqNQU95cE/K176G4neSLcVjG6zsAXfN5aWRNmPV7cKoE4qVXoBdOG7LdaQw7CXJBumeroROXw/3yGUwG584xIwnbMFTd95eeonTLKpbB9tKOyUbfzHSOlAuQFho83hOuti/mujgMsPoPuQW06hnAcl6TzGSBVNWInG2fcd0NoZE9CuMF7YE6zN6xfSk+qPWwIV+hAS9X1NLpEwia3IyhBcE9YKAM7ahi+Z84pYiI23EzS+vrPTumIq76Cg5RGaw2d/hcoyUt+2osOrLYTd9XvDVclvVUhu/++rrqE9eV7C3nAFdeg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(5660300002)(82740400003)(8676002)(40480700001)(2906002)(36860700001)(8936002)(186003)(336012)(6506007)(6486002)(70586007)(70206006)(33656002)(54906003)(4326008)(110136005)(316002)(356005)(86362001)(83380400001)(81166007)(40460700003)(41300700001)(26005)(6512007)(47076005)(53546011)(2616005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 13:51:53.0483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d49211a-bb9a-43b0-e58f-08dac3ebe3a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8836

Hi,

+Grant Likely from Linaro.

In the following change, we need to change the license to MIT (from GPL) of=
 one of Xen public headers which has a Linaro copyright.

@Grant Likely: could you confirm that Linaro is agreeing for Xen Project to=
 do such a change ?

Kind regards
Bertrand Marquis

> On 2 Nov 2022, at 11:28, Anthony PERARD <anthony.perard@citrix.com> wrote=
:
>=20
> This header have been created by moving code from other part of the
> project and miss a licence header. The original source code was some
> version of GPL or LGPL but we intend to have the public header to be
> MIT so they can be included easily in other projects.
>=20
> Part of device_tree_defs.h were moved from libxl_arm.c which is
> LGPL-2.1-only. And part were moved from device_tree.h that is
> GPL-2.0-only.
>=20
> Part of the original code were added by Julien Grall @ Citrix with a
> Linaro "hat" in commits c3ba52a84dd8 and 405c167f0ec9 and
> 886f34045bf0. The other part were added by Ian Campbell @ Citrix, with
> commit 0c64527e7fc9.
>=20
> Resolves: xen-project/xen#35
> Fixes: 1c898a9fec7e ("xen/arm: move a few DT related defines to public/de=
vice_tree_defs.h")
> Reported-by: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>=20
> Notes:
>    Julian was working @citrix until 2015.
>=20
> xen/include/public/device_tree_defs.h | 6 ++++++
> 1 file changed, 6 insertions(+)
>=20
> diff --git a/xen/include/public/device_tree_defs.h b/xen/include/public/d=
evice_tree_defs.h
> index 228daafe81..9e80d0499d 100644
> --- a/xen/include/public/device_tree_defs.h
> +++ b/xen/include/public/device_tree_defs.h
> @@ -1,3 +1,9 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2013 Linaro Limited
> + * Copyright (c) 2015 Citrix Systems, Inc
> + */
> +
> #ifndef __XEN_DEVICE_TREE_DEFS_H__
> #define __XEN_DEVICE_TREE_DEFS_H__
>=20
> --=20
> Anthony PERARD
>=20
>=20


