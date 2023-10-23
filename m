Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B87D2F6E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 12:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621214.967480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quroJ-0006FD-23; Mon, 23 Oct 2023 10:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621214.967480; Mon, 23 Oct 2023 10:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quroI-00069k-Ra; Mon, 23 Oct 2023 10:05:22 +0000
Received: by outflank-mailman (input) for mailman id 621214;
 Mon, 23 Oct 2023 10:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdWI=GF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1quroH-00064O-5x
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 10:05:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8b2ee42-718b-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 12:05:14 +0200 (CEST)
Received: from DB9PR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::23) by PA4PR08MB5903.eurprd08.prod.outlook.com
 (2603:10a6:102:e9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 10:05:12 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::ec) by DB9PR01CA0018.outlook.office365.com
 (2603:10a6:10:1d8::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Mon, 23 Oct 2023 10:05:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Mon, 23 Oct 2023 10:05:11 +0000
Received: ("Tessian outbound 470906b1fe6c:v215");
 Mon, 23 Oct 2023 10:05:11 +0000
Received: from e0491b2fa382.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3F681EE-1CD1-42B2-863E-4F1538CAEC43.1; 
 Mon, 23 Oct 2023 10:05:05 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0491b2fa382.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 23 Oct 2023 10:05:05 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB9PR08MB6668.eurprd08.prod.outlook.com (2603:10a6:10:2a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 10:05:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6907.030; Mon, 23 Oct 2023
 10:05:02 +0000
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
X-Inumbo-ID: a8b2ee42-718b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRJZGlmODslim3JkZ8F1GneHdrbVDxNJ3q9KxDTK+Wc=;
 b=cHhRve41HdF80J0azdbABTwK97EHEF466tW0V0ESw6qE/CbkLOA+9gaXhE2p2kT6U/cPAGEQZp9pXexql5Q7CkOengf0cWReWHGeTKDD8LL+3H0cESwIRxIpKcfo4iYw7tpgb3nshQLRsltUGhbiPiA6hueDk68+fF2nU9TYPOI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d23b4b01d6c424f4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bj5F/pQshZHl49/Z2W0n5MsgVr5B1RHBx6m1e0YTkh4k+WPWCsIiPpuD+IGOPmPlLK9KzvHlpzTw+YfqKLBgDMACtJ3LsuXU88DRJqtVKm5Qtfmk5kMdo7wsDtz1PEl3IL+yfXZamhnGgiEcqFhpK/ChInEaZ/jNpeLApv7UTERKHHR6TF6O4DeP5Px/6yinCKoy+iY913f69puureXk1JziiYFYyHmieTd+2g6w8HiA5nk4JjMX8ePH3iSIySHJNeFPtuHkJ8jUnV9wMOjqTnjuR4dXzlxALqruxfwWZvnCaOmuzcNfI+fIYTugwgC0tpofTKX64ZdfqkPgAaLkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRJZGlmODslim3JkZ8F1GneHdrbVDxNJ3q9KxDTK+Wc=;
 b=Lr/ND22/n9XOP6gI0/RsAh7/pbOHHuuP2JVuMk7EFpD4aD+9kKs/JKmcxPw3mKhr6I8jLETzKxF2khNMGqQlUXDz+6MOhkIcMFPkZhOKygtrFXX0zpeXTcCrhBGdCnD0co0L21r3XyZdKa8Pv6ruMLjzB+APOCqjbX7dweaCd8Bdvs54kZre7SDkiHB6anvIjFUxgKM/kulHOKr9wl75IZ91Ha6PgXUSHI7cMcB/GrPsGmM4Q29oDixdHYxl/+2LEue1riMKO8+3r3QSz2QgLr1+kv7x3V+RGdYQQqEWOk5fl3WM6NWFO5M1HGaXOIaLc08bR8WODX2NugUb17SU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRJZGlmODslim3JkZ8F1GneHdrbVDxNJ3q9KxDTK+Wc=;
 b=cHhRve41HdF80J0azdbABTwK97EHEF466tW0V0ESw6qE/CbkLOA+9gaXhE2p2kT6U/cPAGEQZp9pXexql5Q7CkOengf0cWReWHGeTKDD8LL+3H0cESwIRxIpKcfo4iYw7tpgb3nshQLRsltUGhbiPiA6hueDk68+fF2nU9TYPOI=
From: Henry Wang <Henry.Wang@arm.com>
To: Xen-devel <xen-devel@lists.xenproject.org>,
	"xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
	Xen-users <xen-users@lists.xenproject.org>
CC: Community Manager <community.manager@xenproject.org>
Subject: Xen 4.18 rc4
Thread-Topic: Xen 4.18 rc4
Thread-Index: AQHaBZhjhgOGkDUvoEaydBO0wndSqA==
Date: Mon, 23 Oct 2023 10:05:02 +0000
Message-ID: <1B64131E-599A-448F-B702-DFDF890F5837@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB9PR08MB6668:EE_|DU6PEPF0000B620:EE_|PA4PR08MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: fb92c3e5-b229-4b3c-fd3f-08dbd3af8b92
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KJHIUhDe9E8FTr8mW6Wh5bRpr55zKRhUrxirM458kN2CpBQ35NOJkd2R2fgTK8ybfXFVdH8eFpsTTtPUMJKcKmmQKalItPfU0kFv1YiDn5nU0e3B5NV4857pm0+5edozd9MwNoEHZp97SriVG8442uPrS4ImFpR6sbSkiPRVPoqcAUjwICQJMBNOQhYoqTOhRS94deEG/rGLYTQMmll1osomBO9JdLXEXctUW6eHfjcd0YGg2qu9bxYFeKBmUT/f7Ea/z6QLbyWB/7R+VIfrdn+lt+V/1ksoRNL+gWxK4JCRRbB8VI6UHOsz/9nfTrJwo9VQP+xhE4CrlIamiRGfKDub6M8WhJG0O+blRCRxacCodJZjw9tEbD7pCSoUPJEIrggxXY+A7A6AV31zYtemX+k68J5Pg3fYmDpALwRmn4oL4GvXc4DtU82DDp3/aXTkfgU78krPA7yGxhBIk0jFxEkA09qtDib9dj3pZRQ+1wdSozNSHrDQAhoIFiKtX1PrE/TEV0fVzZyFU+pYrHTts3Qu7MwLSiNpu064Rhiz943dKFQqAjazhDbBPMwLFP5fEN6XOHo1PrKqW8lPQLkRUesBHCIj+5yc3ziNKqtkCnq/b2sCySB7RKDQ5HWxCRu7
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(4744005)(2906002)(38100700002)(91956017)(66446008)(76116006)(66556008)(316002)(66946007)(64756008)(66476007)(122000001)(110136005)(2616005)(6506007)(478600001)(71200400001)(6486002)(966005)(6512007)(83380400001)(7116003)(41300700001)(86362001)(36756003)(5660300002)(4326008)(33656002)(8936002)(8676002)(38070700009)(26005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F88DB66D808320469C3C59BD0DCDF5A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6668
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	530384fa-98fa-4631-b054-08dbd3af864b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9e/BOJZmbIGadXuTBnYRypi10IwDBh0vqdE+AJDuB+OEiX2frAueTT9jipgRJ9K9WInGud2zMQzRiFzLQnzSu/W2lbmrcrl1h1tgstOx5Q1FLtMElj1mD39iK5sRtpPmzVw/H0v8jSJ8E1ISmdAhhNZg7rPipmUP9m1GVp+s7o/I0CwkHU5/8EaGyPkf/hRO3enTcsJzyT0DI8yQl/+fUm61nqbe77bCCd56wnquW4NWevexEUjYD8IeF4wYEO4L11gkb5hMdJ7tH9K6VjKCd9TmYGhyEY7L3b5T3ulq+zzL1d9wcQebRdyLX4WlOQEvFE/8Z69sPTOe3c6rdavCCPEL849+iTuodMXpO38NOkXg0gorVcsC+1WSdRcSGesGgDir+2CMQEM17YPdFyvZKR9gO0B/Ebmf47VxMfzIi9dmNVd2WcFja0oV7kcgphQTzTeU6pYge64MCmpKyF9JZmicqk4gRQfMNvO3wRlgL/KhNQUKc+EiGX8zzrY9tt+jiKqdSMjFoBMMhY9CzgO965mpKLv/9wbt6HizwWSufu+yZbcLnw1BDdnrSZDRFtpiKU3tzeDfLY1PNw3YrjLXwPtENOERNAUesH2OmBAek8xR6NtKCYOIfGiEW3K5ldMVH/6fpN/NdPyxDuAjVEhakunvRIMhLYIgzNcYHeUFTw3zM93kNqRSKYq1VRsLKdfP90zbiGjzV7Q51tnBY8qmEVgcYFmipOjD2cm8Yke92QA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(82310400011)(1800799009)(451199024)(64100799003)(46966006)(40470700004)(36840700001)(2906002)(4744005)(41300700001)(7116003)(40460700003)(450100002)(86362001)(5660300002)(36756003)(36860700001)(8676002)(8936002)(33656002)(4326008)(6506007)(478600001)(26005)(110136005)(316002)(82740400003)(81166007)(356005)(2616005)(70206006)(70586007)(83380400001)(966005)(40480700001)(6486002)(6512007)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 10:05:11.6835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb92c3e5-b229-4b3c-fd3f-08dbd3af8b92
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5903

Hi all,

Xen 4.18 rc4 is tagged. You can check that out from xen.git:

git://xenbits.xen.org/xen.git 4.18.0-rc4

For your convenience there is also a tarball at:
https://downloads.xenproject.org/release/xen/4.18.0-rc4/xen-4.18.0-rc4.tar.=
gz

And the signature is at:
https://downloads.xenproject.org/release/xen/4.18.0-rc4/xen-4.18.0-rc4.tar.=
gz.sig

Please send bug reports and test reports to xen-devel@lists.xenproject.org.
When sending bug reports, please CC relevant maintainers and me
(Henry.Wang@arm.com).

Kind regards,
Henry

