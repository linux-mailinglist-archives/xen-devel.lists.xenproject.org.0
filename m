Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B33AE625
	for <lists+xen-devel@lfdr.de>; Mon, 21 Jun 2021 11:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145436.267597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvGMl-0007AA-HD; Mon, 21 Jun 2021 09:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145436.267597; Mon, 21 Jun 2021 09:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvGMl-00077r-E8; Mon, 21 Jun 2021 09:37:15 +0000
Received: by outflank-mailman (input) for mailman id 145436;
 Mon, 21 Jun 2021 09:37:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YNPZ=LP=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lvGMj-00077l-IN
 for xen-devel@lists.xenproject.org; Mon, 21 Jun 2021 09:37:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::62e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89d918d2-37d8-4754-bb50-c6b85a0967e9;
 Mon, 21 Jun 2021 09:37:12 +0000 (UTC)
Received: from PR0P264CA0099.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::15)
 by AM0PR08MB4449.eurprd08.prod.outlook.com (2603:10a6:208:143::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:37:08 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:19:cafe::a2) by PR0P264CA0099.outlook.office365.com
 (2603:10a6:100:19::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend
 Transport; Mon, 21 Jun 2021 09:37:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Mon, 21 Jun 2021 09:37:08 +0000
Received: ("Tessian outbound 7799c3c2ab28:v96");
 Mon, 21 Jun 2021 09:37:05 +0000
Received: from 03717eeeeda5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6CF20D52-80BE-41F1-8426-E027FE529BED.1; 
 Mon, 21 Jun 2021 09:36:56 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 03717eeeeda5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 21 Jun 2021 09:36:56 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5625.eurprd08.prod.outlook.com (2603:10a6:102:89::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 21 Jun
 2021 09:36:54 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%8]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 09:36:54 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0056.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21 via Frontend Transport; Mon, 21 Jun 2021 09:36:53 +0000
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
X-Inumbo-ID: 89d918d2-37d8-4754-bb50-c6b85a0967e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka8N4Ch0f35EKm0tUvbUB0qb6lt5G0qJTeudjEJziC4=;
 b=2WWLYNcbMJEBayFvAvSHfTbEc3GkGuz/iOHwvszoCJb/ezkyjnlSbZBzyxxZg20AYCoBjmwlbD0sV247res9LbluggbukuEEGe8ctgmmV4RRQiAizjnyAP+BcuPDewtOTXgOAEIWyUu/RuLPOWYVZS6VVtGHlE3T01Yx7PRqSZc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b5731595b6848011
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPRZmp2/ePj/Wa+kQvGpwq3YdPCtLSk31aTz3ONJ2kQ2U96f6VISxMf9RlFEtzSMlyKMwrg7FKDwhW7/ZMRq6Mfpobdw3ODu205qgAlt4SS1S9Oho5T8XB0PnpMEanCBWf0VubauYMKF/V6ckgTmBzU82inMvV02qWup+bXAUl/QlIwCUGFqzJdx1jNLW72jKcStxTouyK8XM56uhCdE8PBhVkX00FnCdZgo+EInXaAy95CyNQs30jZgvJ1lNTL4zkFP9BVQsk47tgbkV5GgM9rm/08/TOtbCYR0YAOXO0Nwz5rYmsbNcwSJpXX+U6vMuPsEnGf8t1fYkr6OLT5pbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka8N4Ch0f35EKm0tUvbUB0qb6lt5G0qJTeudjEJziC4=;
 b=KTfdCUXvZUy6bstRVJoCcRl2M1Fn5150P3tgf6COm3TL+wZjo/qb3DzgDpn0iE4yVHT+cCPD6ICawsHDfllgies1bCshotBfvFWM0l39NnnK52QFf9If2ZNskAnIb1S+1/itO2W5l4Sz/Z66PxMEyY3RoDbbB1rnhYE29FYUMRJS0dPrLZeQaghuBmYUt8EijVTSboL+zb+g9LyBKPSVcl+71aW3g3N/bACKpOIqDsEM6WGzhnFGmaOR5HpqwhBvmVHUHEd7s762Q+sALendDED572kdoK1EhQSIbgEYXiBtbEBJUBQ/MAFb+dAcMvrINcBFLL9+xeydn4zhY1oJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ka8N4Ch0f35EKm0tUvbUB0qb6lt5G0qJTeudjEJziC4=;
 b=2WWLYNcbMJEBayFvAvSHfTbEc3GkGuz/iOHwvszoCJb/ezkyjnlSbZBzyxxZg20AYCoBjmwlbD0sV247res9LbluggbukuEEGe8ctgmmV4RRQiAizjnyAP+BcuPDewtOTXgOAEIWyUu/RuLPOWYVZS6VVtGHlE3T01Yx7PRqSZc=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] tools/xenstored: Don't crash xenstored when Live-Update
 is cancelled
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <20210617173857.6450-1-julien@xen.org>
Date: Mon, 21 Jun 2021 10:36:47 +0100
Cc: xen-devel@lists.xenproject.org,
 raphning@amazon.co.uk,
 doebel@amazon.de,
 Julien GralL <jgrall@amazon.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <3AC8670C-7FA8-4968-951A-E67E95B0AF97@arm.com>
References: <20210617173857.6450-1-julien@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::20) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3acdb1c-c7ca-4092-3087-08d934982353
X-MS-TrafficTypeDiagnostic: PR3PR08MB5625:|AM0PR08MB4449:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4449517398A53B883BE89128E40A9@AM0PR08MB4449.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9Zrgyhw9kLLJdsub0GBsrDPhSADb5H29LXlMOIAbtQ+bsarsBzRTcV5XO1D+V6IfeR1lMBZ3EyyDNXWg5XDA5bOGOfOiydK5d2HPjyAnCF9WdfKZ4bA9HFShIvgs+43GvGkdd/e+0B+ncvjE4sdBNuGdGd/6XlJmlBwFC8wbpZDFow9psUJ3i/P1Oznzbus+17xmdnoPotT7q+mPkqiZ7NC7EpBuCdnH6jy29LiWFL6f/qj5KgqlRdG5AT/TjhI4qoc0D62hBgyZw2m7A3UOcd4mJzKuZYQWEDGITYWzjah3qrVSeJ84E3m50AjS1+E56/xTJjT+0DA3Vtvy8RphVuxlVa7Jnv3a9PZ3h4EqEig9rKv3ZhONbXapwBq/+sgF+j2DYMLTr9THLNH/wPA9+12hkuGd2zrj+NDnG2H3lyv3OvC9lJxySmZCtvh6cyuw5F347OaIw8Hs1j1YeFQIfkwauqz5GPXfMpQtMZFSs/+nenChiMa3YFeWckCIrY8vErL1ZUnZklhr9pf5VGVNal3n7QUv/q6Z9OaYFjRA+w9qHhEU7SXBEVQF51JU2GwoFwKwfF1b0aHvdFoF+Dfo0789gM9oeaI+aEK6rwIqi1gPGahDdWMtxMn+G1p2EwUic7s3Zzk+WtBuytGrwnkZCxwmQ219OQtyRfDixyFLmfa/YxCV1kb94BmL1PxpYTJIahYFOcFC9PEZLsrnu1YQ87Re9Li1gihaBgBSm+jyqleDeMbFOWLv62c6K/ipMBUb6krq91CAUwxtAyWVpULHAaPlrZHm0r3mCAUCU9XhBiYIpdv7bOnaX8qs9rCUYqNd
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(86362001)(54906003)(66476007)(2906002)(8936002)(66556008)(2616005)(33656002)(53546011)(956004)(316002)(15650500001)(6506007)(52116002)(6666004)(6512007)(36756003)(966005)(66946007)(26005)(44832011)(38350700002)(8676002)(5660300002)(478600001)(6486002)(16526019)(186003)(6916009)(4326008)(38100700002)(83380400001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?sVb82NCfDWVqyAeXtbrFk6fAkOi6NjjYRdSHmRcOP3He6D54FuKOYHJCyxOA?=
 =?us-ascii?Q?fK7/D2WEaq8sdRDUCxNd8+YmsUR4Tzdl/TLRYcAHkhf6DB0gMIcWQoyfNNcU?=
 =?us-ascii?Q?7wJAmpYzG24P77ev3DJYvfdW7x2ePstczm4MK82ExSEgbKmtrq1dVuM1mVKO?=
 =?us-ascii?Q?N25nNE4C9Em8097qJ0gdAEOcnBl2lJa46FHxBZ5WFiWjsflz7tFfNK1G5TCg?=
 =?us-ascii?Q?nlxcmwlg2FDSNm57DPRFnI7bLVfClISib/LueU4TBWQmmJsSQxt7ShR9FC9S?=
 =?us-ascii?Q?K4/GfSODeKsC3XQQuE/NackL9OvwZo5VRP2W2uLjYE76uR0s7DYNjKrtidYi?=
 =?us-ascii?Q?9O+1cTCACfHdeIXT+lhNPHaOuTDsyUObZNG5/l6kqdtR4xG2bdiBLWN89zcO?=
 =?us-ascii?Q?xEKWtvhOfBGKyc0pmsM5Cr2OTDqBDN+QXoC6DLk+hx0SK+Cd5YVZk6snUV+l?=
 =?us-ascii?Q?naSvclc/gwioFjUJyluBpxcJ3SAmU4TFNyDwz29PyGbarBpkxXmGLxpLg0aU?=
 =?us-ascii?Q?zvCPnUtzc6rIonX4FrqMHghQjFoVst4g4RoPkqdZlMuXF0cDXfIpdkSHcG93?=
 =?us-ascii?Q?o8admJW6kIdc2oYELzYaQx22kLCoFopXwZb9ZqFtnHHGdQWqA44O28tEUPnY?=
 =?us-ascii?Q?tSGyjWdCAPBc2wwD9emiG0Xd+YNoVQ7ZwgSipk5f6CjIH7Yz9LOKOrOcMbq7?=
 =?us-ascii?Q?f7yhMCbKYoMOPD/XJB9TArKZ9Eemd8lEjTAGc74TKuR7ww2lqX2j7/wCyCx+?=
 =?us-ascii?Q?jy5DPmmu6xIfg7HUWzO2i7gOwETmAUCJOboE9N0+oS4ukVHlgyp7Xk1q4Zzp?=
 =?us-ascii?Q?9ZapubpXqdnCnUoFXsVhjXJk3NKEeRCUS3YUggLK+cwPE9y/bsUHyaFOmHFA?=
 =?us-ascii?Q?hJJWvpEJ/twoaK40BPWiVMvbAakumjc3j53qRSLM+Lsdj75kxBuuKh4j9zQI?=
 =?us-ascii?Q?qnPPCU9w2r/jXPDfEr5ELxgOnLmK/zscFpI/lPFMANtm0MXVo8ihNjksLo2Q?=
 =?us-ascii?Q?9rZWecMDomv9Bc/KFhnDOT8mEuhBPo9AG2aM0kOu/7tHYSZ/SjFYOmpEhrtS?=
 =?us-ascii?Q?36e9mfaquE0zD5ISG2jgvBWdkQQ+NKPwhwO2O2hb7WymeVjNhibXFevj7fOP?=
 =?us-ascii?Q?hnIpNcSpTDnwiVtkt8MenGIpcq3ZHhIQugm4DAASrL8ZfYl3LWDVRnSJdcwf?=
 =?us-ascii?Q?pz8Xe4hUOtlao+f6XQY246DU/iMZRIfI3sK/7CS1/Y3ILkfhYcUv1Mr1Wxpd?=
 =?us-ascii?Q?CviT+0iU2FqwhgvK3Z0UfT7mcFGJfRUObk8fnCraMqNRNmO/rov96X9A5jbm?=
 =?us-ascii?Q?8MgetHnptyRgYH8evWCKj6ab?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5625
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25308b83-7505-43a1-8739-08d934981ae3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8D6KpN1A89VWu/aX2W8w3E2m8AzXZ1dC88rx0LA/GjDsXaYS/V45D9kDFQzVfCyzRaxJjEBe9y1slOD79M9ayncNdWC77Rmo9aUadibyeC9PJT9tpphk+5Gc7R6D8/5vInXf3kGL1CydDP0XAOEtlZrrloe12Lk0T8K1F9j857ScP9MTPDu21caDrkXfZDbRK2l5TJ9VqWhlUxKBCFH+DwnTD89fDFgzR0P/0yX9gvP/3hHHn6IQN58yaJiljkKfmRukq/nLkKWKT/OmHRgn9ixsGc3N5Ld/TTdXULQSdR1IoY9XfTxbFiwfZgw9hILWNcK//7LFWiO1k3Z5Wf8GOD6k3Qf1+1HDpr6Iaz8Qem/Mk6ocXFfqTeVYkXULs0ktTGCPKv57SfgAhgUs3koYOVmn1fFRWjb4HWp1QP19fwu/mBoT7KyvAVJqC0Hm9UZM8zQiSb5E522V1gDvmRABFEZe1kEXXOmCJ5CT4N/BkSXVFSe1QAcmoTKCFSKC74Ji78YRap298An0xFDPPPdSgFHsC/jYzaXDTcqg6Uq1AzK/5FQ+9Yc/sY49JFxsnTpkix6k2+TWSm2lazT/kt1DzFD+wmQcJMsgTbq9/qTuVjIYKj2o/jQ4RpbB+0rdTqmokfxTuIGsI4WaukKiHbnaha9jqxfYAOF6BFlcFP/fXOMDkl9NPFM0q4P8i8Ykzf/X+Z8hac5i4hbFFSSP5SHMBvHNLxkFIJzvrT7Ue2VtWYICjXIKshRj49SxBm3JSYbx4GtLnR8S6x3bNhRGTc63iw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(82740400003)(36756003)(36860700001)(966005)(6512007)(8676002)(47076005)(44832011)(356005)(53546011)(5660300002)(83380400001)(70206006)(4326008)(107886003)(186003)(6486002)(26005)(16526019)(478600001)(82310400003)(54906003)(6862004)(86362001)(15650500001)(2616005)(2906002)(8936002)(6506007)(316002)(336012)(33656002)(70586007)(81166007)(956004)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 09:37:08.0794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3acdb1c-c7ca-4092-3087-08d934982353
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4449



> On 17 Jun 2021, at 18:38, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien GralL <jgrall@amazon.com>
>=20
> As Live-Update is asynchronous, it is possible to receive a request to
> cancel it (either on the same connection or from a different one).
>=20
> Currently, this will crash xenstored because do_lu_start() assumes
> lu_status will be valid. This is not the case when Live-Update has been
> cancelled. This will result to dereference a NULL pointer and
> crash Xenstored.
>=20
> Rework do_lu_start() to check if lu_status is NULL and return an
> error in this case.
>=20
> Fixes: af216a99fb ("tools/xenstore: add the basic framework for doing the=
 live update")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

>=20
> ----
>=20
> This is currently based on top of:
>=20
> https://lore.kernel.org/xen-devel/20210616144324.31652-1-julien@xen.org
>=20
> This can be re-ordered if necessary.
> ---
> tools/xenstore/xenstored_control.c | 15 +++++++++++++--
> 1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xenstore=
d_control.c
> index a045f102a420..37a3d39f20b5 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -696,7 +696,18 @@ static bool do_lu_start(struct delayed_request *req)
> 	time_t now =3D time(NULL);
> 	const char *ret;
> 	struct buffered_data *saved_in;
> -	struct connection *conn =3D lu_status->conn;
> +	struct connection *conn =3D req->data;
> +
> +	/*
> +	 * Cancellation may have been requested asynchronously. In this
> +	 * case, lu_status will be NULL.
> +	 */
> +	if (!lu_status) {
> +		ret =3D "Cancellation was requested";
> +		conn =3D req->data;
> +		goto out;
> +	} else
> +		assert(lu_status->conn =3D=3D conn);
>=20
> 	if (!lu_check_lu_allowed()) {
> 		if (now < lu_status->started_at + lu_status->timeout)
> @@ -747,7 +758,7 @@ static const char *lu_start(const void *ctx, struct c=
onnection *conn,
> 	lu_status->timeout =3D to;
> 	lu_status->started_at =3D time(NULL);
>=20
> -	errno =3D delay_request(conn, conn->in, do_lu_start, NULL, false);
> +	errno =3D delay_request(conn, conn->in, do_lu_start, conn, false);
>=20
> 	return NULL;
> }
> --=20
> 2.17.1
>=20
>=20


