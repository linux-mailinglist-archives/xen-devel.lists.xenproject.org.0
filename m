Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995995A9B61
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396731.637011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTlww-0007fL-Av; Thu, 01 Sep 2022 15:17:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396731.637011; Thu, 01 Sep 2022 15:17:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTlww-0007dP-7y; Thu, 01 Sep 2022 15:17:46 +0000
Received: by outflank-mailman (input) for mailman id 396731;
 Thu, 01 Sep 2022 15:17:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WzPc=ZE=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oTlwu-0007dJ-9K
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:17:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a04c846-2a09-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 17:17:43 +0200 (CEST)
Received: from FR3P281CA0061.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::9) by
 AM7PR08MB5368.eurprd08.prod.outlook.com (2603:10a6:20b:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 1 Sep
 2022 15:17:39 +0000
Received: from VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::ee) by FR3P281CA0061.outlook.office365.com
 (2603:10a6:d10:4b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.5 via Frontend
 Transport; Thu, 1 Sep 2022 15:17:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT061.mail.protection.outlook.com (10.152.19.220) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 15:17:38 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Thu, 01 Sep 2022 15:17:37 +0000
Received: from 8e2c5ef8123f.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D144BEE-D443-4E2A-839C-5D6C32FDB07B.1; 
 Thu, 01 Sep 2022 15:17:26 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e2c5ef8123f.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 01 Sep 2022 15:17:26 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB9441.eurprd08.prod.outlook.com (2603:10a6:10:457::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 1 Sep
 2022 15:17:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5566.021; Thu, 1 Sep 2022
 15:17:24 +0000
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
X-Inumbo-ID: 3a04c846-2a09-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=KTLw1S0dz4U4iGieDeHWuk8I80w65RVGp1IhD5TtuJ0GACwarNKnbejqaGvJCmJUvKOFX4R2FcCcDdd7Ig21izoB1RZZh115vwMyIpgG2BEAb+aHYAgy4nF887enLUSlyQQRvOL2c54+ablVpeOIBierqg/m0/skhwb2Ht/s9ks7Tz7O20K2ccYdg5eBhMYcly6RMNXplBBAC7Vb/394EbbGe1W/CGt2NedfdJlrnsolRh5pAgwBKLH8VyZ4hciXdxzklottA4cX24rGicnIe+xqwKCtMaVP9sb1xCvuQO2eNLzaX5DI1ptPwdfzLpkjdIZHr0cigpec7T4qo2XVmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lket6qHQ/Tzb4J0rZ8JxetF93xrK0ohOk8rdFqOIaso=;
 b=jIaASWkQL5sWY5eastISmVAtYXboP8QOmQl3cM9PCcxZD1AARzsEvgCAVTSL4+8Qj19SGCP/lN9pahYls5RKH5KtLJW+MFxOPjnDs0ji60Q8XNDZFLydI+0Utvy3FGlT1o9PbQV4JH1dzm9KQPoOsae5cBqk417QN7K9v+xYuwh3mTaRmS4GDHrc7jjTsoROyJr7BztxeFEwls7vhs59Esm1xE0UpYH01uLKtrv2mykqB6C0YOx7G1zJ0U4bcKniXjADXFIXPzPttR7l5DXmG7UeQa5i1/gvxGrLc/eIyx+9xpyBuEhMpZAODJVXnmZi75HdWS8bwuJoB+Q020yZEA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lket6qHQ/Tzb4J0rZ8JxetF93xrK0ohOk8rdFqOIaso=;
 b=9tK1UHZT5VXBdyAvj2t2wzRsgWApr4utVzK0xV3gY6ixoUGJ8niP0DwwtxjLqAe4AvHbHJ8K8WAIy0UP4RPea4jKhPolzkfgdupWEC56Jx5M+MUJpZurKb/XtFcrUaduYTdomfBtpPJlHz0Llndggi/9IW5ECpGbSoFuLXSxBq8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f288f12510204072
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVWumy0UIZ4gflU/DN0TfTLJ/9hjo6lPUd19wx5vQpR/hVpQjS76SEq9fuM9LM15R+B0+T+EpzfVJPTYX/10Prox87TB5tFOKQirxk56Pv+rUJQGzhNSIQKIDjr3KTrU31SD6EQJWJ0p+L0ZvavUV5r2wQNaQRglotj63HcOJxUxC3emDflsRGJprJliPNH2T+1Ng0nbHfmiFC4vb7ZS2eN4XkCVyibBDcUhQgJZb/m6IOl3eFhTVmgH6v+QyQnlGwkz3eR+vhvRJImLVAqLOg/djXoCq8Ym353EGaa6dS+FYu0Gto2kTWEQjn1JmC6CMdJOHflvVIR/lF+o9UN1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lket6qHQ/Tzb4J0rZ8JxetF93xrK0ohOk8rdFqOIaso=;
 b=E6bCSUrD4SXLkWAKMgSca5H+UajiYlo9gA+3rejsgv8sp8zPyA1AH2uZpjgMe8Dkt5gbHsHWxyIYYMSdcT4AmJ3e0axHV1FePGciIpIcyTvW8FQln+qDobXEW2tO33FAb9WnGayLSCe7p05vELKRYHo60eKvAxDTspK0WsRUTL5kqYj9Fa7A1XVHuY3X/xP3R7SlhkCFLgJEQCbS2w5hVos7NwdvL0pX6r/ih/KmwrIUWS0HMdfx8nzba+IYtWZ3pg05ZdFMvXY8JuMSzE3XDcsS9jOBB4fQmD49UdvuDW4DaKHRhqsZ1iJZcBBgZSrvikWCVS/m0U98Gpx6jAKEsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lket6qHQ/Tzb4J0rZ8JxetF93xrK0ohOk8rdFqOIaso=;
 b=9tK1UHZT5VXBdyAvj2t2wzRsgWApr4utVzK0xV3gY6ixoUGJ8niP0DwwtxjLqAe4AvHbHJ8K8WAIy0UP4RPea4jKhPolzkfgdupWEC56Jx5M+MUJpZurKb/XtFcrUaduYTdomfBtpPJlHz0Llndggi/9IW5ECpGbSoFuLXSxBq8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: xen-devel <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>, Anthony
 PERARD <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Push 4.17 Feature freeze and Code freeze one week later
Thread-Topic: Push 4.17 Feature freeze and Code freeze one week later
Thread-Index: AQHYvhXwY5ksNZUEbUKzv0CjRBnFYA==
Date: Thu, 1 Sep 2022 15:17:23 +0000
Message-ID: <2745BA23-B42E-49E2-89A2-59A0ED70388F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0d839000-9443-4a60-dab1-08da8c2d1b22
x-ms-traffictypediagnostic:
	DB9PR08MB9441:EE_|VE1EUR03FT061:EE_|AM7PR08MB5368:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Qt7IBazubFZoTl7nK/HoREZrIWmYlyWwsHa5Mf8kFuvoZTdsjV08t1XdVV2KcP7FwETJ0xfPi0Q7TQZRpcNKTU+sUFtEpSyO3JzYtW1m3k2hSSMOTGNC5uctqrIfZ5DAiTxwPIjYmw5T0sCzFolA2aYbl8LCgEOE5lz8j78ho6b1vHf1py6qEn09zj5wL+OWiEncuD89/rbqVEDzN8LzJS89ngEXFNEDpgPX71VDRMhVfUKH17FZQHQoUGoC4l8oKN82vgwy7hlfyl0dr2H3m7pn/6QBxYa+9vCgMDOnnKUMGazqjshV0VAymoe2vW4vBvRabXn0ebXfISn+gZqn8wcqB/Sw9ReE9l3t7tYN/l5XE9B8Z1XhSIorGg0wB1l9ctd7KIBdYh+OHa1icKUu3Vvr7a6b2sSrU+gvyGOPxoJesSNdsrtI4rkdso3zL6Rr4Radb+0uW12GtgSIoXViigGPz+UzC1zykjGjjxxCoKDsskIW/KWbu2cA+YvaWWauYEpDCGREknsiUJVKzeSThI1lF3QChkYD3tyl3gDac6Y7o8nepAV0nS8whOavglBa4rtvkkRvWWiD5JL1JmJ4je+UXWPL0cwBIQCTgPc0hAu4n8T+4bv+zqgG32h5XpoSY8INJSlTr0og3dWtlhssd3q2XEdWsqBNowbjLnDeUhqoQ+yVjF/Lq3ASpA82UoLsNEO7LLmojE98w1HlL4CEBRS7aX64S/gM1O3JdJ3yYhgG/UcpdZ2Hlp/iDwCKNiUbqF1ciMNMRBG1CaTjzIPYDIf+X9M6AqNKCtHJcYAmzlw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(33656002)(186003)(558084003)(36756003)(41300700001)(26005)(478600001)(6512007)(2616005)(6506007)(6486002)(66556008)(76116006)(66446008)(64756008)(66946007)(71200400001)(66476007)(5660300002)(91956017)(316002)(38070700005)(86362001)(2906002)(8936002)(8676002)(54906003)(6916009)(4326008)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F920992B3DF3AB4797378DAB75693DE5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9441
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee4bb652-77b3-4fce-8629-08da8c2d1296
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gwpqTNTk1SV1g5pjt9PgCccjp/W8efL2NTxJXgsej9ajOKf86knxOhLN4q34L/lzIIo8AZU8jkwQIzeAfWmLsAvu6H6FjSpneBSX+i0ZSJdfdSq01A7zDBnoswvb2f3YdSXysbDmIOLQSbvsLo7KOh832ChAMmR4i6JukV/gUKuW5UgddztMinLyWGvnOeld06LFLw2pbyf1JDc2BT7+Kt1Hx9X76MeR6yJKgTOWcdwZ5S2xkM27nA2MCh/voNgL/yWObAr9pfLadPEUyTVoN0T3lcPfpBRt+aTDfQQCRQXj+92/2GoVMHmjwucWYF1EQ2o2pzYEs0AZ2iE6iPHNMUzuR4ap4eZwvwjZ+04w8UaI7DskorJ13cpW/1aooEq8W9xPr4gU+fo+6Yz+bCObWX+o24j8G7+2ev21wNHx4zkx4/XLgg81wVKuJCDRAtKZFx1fQYS+IE5RnOd5OvOK/5sLdYmc0iS9IV4IYjGc6a49Tu+77iA6nXv0qL4YLjQv/01qrPO3U1C5cJ1jwgyYtEeO0IJ/IDRF8GN/2MWE+kxFIYlfAP5rnYBhdFv8uUhZ/YNcSJ1P9ntIouFkXv8qyf1u0DBVqZgHZjMAseTVWaXw7iHEHald9JRGA1fcdMqS0gAddcadAVwjFOpOCZjWn9NAbisiTw3Bs6YKmExBZ0WDlMULd52TnfC9TVTgzofMQm+27/hGsF1Ah2eO31wodO2Uow3sKj5VNfNTjW4Kc+sPBOoLJBjGJZ2YBJQakABONKyJmoYX/KOovHze2jUNZA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(346002)(40470700004)(46966006)(36840700001)(107886003)(26005)(6512007)(316002)(6916009)(86362001)(54906003)(558084003)(41300700001)(6506007)(6486002)(478600001)(82740400003)(36860700001)(40460700003)(2616005)(82310400005)(4326008)(336012)(186003)(47076005)(40480700001)(8676002)(356005)(81166007)(8936002)(70206006)(33656002)(5660300002)(2906002)(36756003)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 15:17:38.1782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d839000-9443-4a60-dab1-08da8c2d1b22
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5368

Hi,

Seeing that we have lots of series quite advanced in review but not already=
 merged, could we push
both Feature freeze and Code freeze deadline one week later to have a chanc=
e to finish those ?

Cheers
Bertrand


