Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A50567FD7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:30:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361834.591567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUR-0004TI-EJ; Wed, 06 Jul 2022 07:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361834.591567; Wed, 06 Jul 2022 07:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zUR-0004RS-AU; Wed, 06 Jul 2022 07:30:27 +0000
Received: by outflank-mailman (input) for mailman id 361834;
 Wed, 06 Jul 2022 07:30:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zUP-0003d3-2d
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:30:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fa5fc24-fcfd-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 09:30:24 +0200 (CEST)
Received: from DB6P18901CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::30)
 by AM8PR08MB6420.eurprd08.prod.outlook.com (2603:10a6:20b:314::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 07:30:22 +0000
Received: from DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::64) by DB6P18901CA0020.outlook.office365.com
 (2603:10a6:4:16::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 07:30:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT039.mail.protection.outlook.com (100.127.142.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:30:19 +0000
Received: ("Tessian outbound 8e3d5168572a:v122");
 Wed, 06 Jul 2022 07:30:19 +0000
Received: from b3bf4f5880d5.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 450D59ED-2C3F-4988-858A-66354B4F0D0A.1; 
 Wed, 06 Jul 2022 07:30:13 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3bf4f5880d5.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:30:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR2PR08MB4731.eurprd08.prod.outlook.com (2603:10a6:101:18::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 07:30:11 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:30:11 +0000
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
X-Inumbo-ID: 7fa5fc24-fcfd-11ec-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=K7JCNv8kjfDFqDB/FbrXx3QjZprpyktbPmp0D55zTEb1mLK3CcCfMmhmZIS7pdIubEuxCyo+IaXOZr0rG8wRFaiGR9T7KUN80qv2D1nnBqeGCKcFvCV3mY9IDT/LjooZiv4wuo9z0sT1fxV5Gr7o3jpx4bm55scQCwUny26zmkdgZvkXqM9dMlXVPqMLDCN8xBcY0JYafLPgxRqNrM6UgQ0F6J6gufQkGVtZq5/jp2SSqn4nq4cyx2zjrYq63dDgHCiIZgZSjkA5WP3SWQU64pqc+LbqYRlvemTze1nEv9Z/+YyaCc0LMnoy1EqZjiw4fxJnkyLAufVPhpa4zFffmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31xSZXbvdsibcVIceV39U3OFfJH3Dlf23IBPFbdbs58=;
 b=lyS2vpd2VgBPzWAgB9vSCU9zG5uR+Q6IO10cfHphwjx6WFuC56bFUCZJZab+uWXATNkZrgvd+xkxouSdf+rmRz7EpPC8ao1Sc9mDXRc9vHY62aV1cqV5/f1y849tG8XGlHAvCkfTsUhkTNWWf0WreVbVsYugHLps49+ScWzZ4DbHb4MHjHD7VFjVjWBxihkG5dpOysgLJ3+0pp1oWj6N1L2Bowh2udd+dVMN6CqrkAF29CbSRrGq1T7ExYWu/YA9iDTE6HZ0IHW5JT2lVGZiRymDQEvOEc5NwdLeI42oAFPJJ22zfq016QU2WZ6tc3zQvMRP6mSzGNv7tIO+d6d1ww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31xSZXbvdsibcVIceV39U3OFfJH3Dlf23IBPFbdbs58=;
 b=8VEC20byYKg6mbo82+C/rLFXOL3C9AEjicIrh2+a/aYni0g/QhkzDG9j3PHkf+VrfQnLiOLJMiziW7g2L3wbjw05ns3FidpZVVyFmrCOypKEVm4rtxo+WXuMBOUTAHrG+AZon3waNEgFd9qIQQVoceb5Btv5wYNujteeBGVUYEQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChHgcHmMM3HivrGoq8e+P0iHQ4RMiK+SdN0f/xcZADkGZeWX8kIaKUcVBYbkVZ2phSZXOI0Lx6lJwUkpewmh/Jcaux0JyuCxWAfT9dVYn4Q63zGoeCVZ4ue34Cs9gLrBHU5nES7JVlF2aBjFYISbOqp8jHENeI3SorK5qqvlVKd+sVt2Ew4r+NJHkzYl8X7mcroj9Lg0rVYtOcyAmSr4p9QqajwJioxgtYg5/CPabF/ShQD2VlFgXnAD+9AXk2xKvyaG0zOer7VmAbPeIUnwKCDiLIUaR+8cW2GhNX3rsXPbfvn5zOBc5NegsNehsCT02dWA/p7b01dxVmm1sRSe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31xSZXbvdsibcVIceV39U3OFfJH3Dlf23IBPFbdbs58=;
 b=S9RNykFbEc9sTf0Xtr1qkGhUd7V5de2WMnmQqGTHJGxBcMOvFs/uyNz9Jcpqh/bcPrbVrfaSsJedU74ObxuYAZSM7ZV/OKp4J9MTiypxVZbK9ltRELHi7jj6Q0HNhBuYbhEAVR2h9VseBSooulKpA10RvoWpCmmm1uV6FTBsu5V05UOq0U81rF3a6Zo39vxYERQsMcMNWs9xW5907IC72xg2T7lisjV1o9iYUN7uNXQIe6Ks25LNabaxSCYMFslrzfqCD8XxmX768/tpsH5VocTK5hEvIZPXNfmbZwYlULm5p57OgU8tbqiHum/jC9SGBC+CevTyWjVhZ8DFdQD8Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31xSZXbvdsibcVIceV39U3OFfJH3Dlf23IBPFbdbs58=;
 b=8VEC20byYKg6mbo82+C/rLFXOL3C9AEjicIrh2+a/aYni0g/QhkzDG9j3PHkf+VrfQnLiOLJMiziW7g2L3wbjw05ns3FidpZVVyFmrCOypKEVm4rtxo+WXuMBOUTAHrG+AZon3waNEgFd9qIQQVoceb5Btv5wYNujteeBGVUYEQ=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: RE: [PATCH 0/5] x86/lbr: handle lack of model-specific LBRs
Thread-Topic: [PATCH 0/5] x86/lbr: handle lack of model-specific LBRs
Thread-Index: AQHYbE8ENIrU0fzd30KB0FdsdC25cq1xLOqQ
Date: Wed, 6 Jul 2022 07:30:11 +0000
Message-ID:
 <AS8PR08MB799176D1E94D709DDD82D95F92809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220520133746.66142-1-roger.pau@citrix.com>
In-Reply-To: <20220520133746.66142-1-roger.pau@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DF598EA93A31854096E91FE1C16CC599.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3543d3c5-ed98-438c-dd0b-08da5f216115
x-ms-traffictypediagnostic:
	PR2PR08MB4731:EE_|DBAEUR03FT039:EE_|AM8PR08MB6420:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YdeQVu+CDUQRRIO7S3zCHXjH1d200S1xV4o995edR0diN8fLTvsRi2w5zVXxBVQ0D3nYs9Wbkb6ULv67wEZtc0/rob6nF4kciNxijbEWwKRYSK7jwVbGIj551KCojb8UDCCNhvzYBeiUkv+VAZ6UOPdujpcZwEnmfP9do9q2eBrR+eQv0/ppCochProEUanDB+ap3bU4ukjaXuUMQloJcajKsSsUd+yLWn5Zl2cqIA8rwcrOPVXLZDDykSuTp4pY4+rntwfZkoiR5U3OL2JDA6vFAB4jC+BcyZoNCHEiJ0xhwH2Vl9ly2e8ESlerNGBKFkgj3p089RMVJAnaJEJrA3cllH0L363YkGSb0aZbprB/1C3M9SPXZTEtSkRDi9XVvV7RZ9hxgWQrIzK4Xqg/9Zf+TxGAdpagyYM+EH9Z0wusluIrJH8aioMy53TrIcm0rEtP+U57qBQpGT1YNh0CBFGjXODaE16gkO/ZZ+b8B+0n2WFpKEB03oLUQXNIvpb9lLp/oaOlWjrBSms/pb6/qXXkWIxKhN+8Xsio5DZSWjaEmqc2wDi4eGx1i2RO8JFUn5i+s5mPEtAdiFSYI3Ns3zqBqy7WE30TQw5BGM52ubzN6ZY9nQyfCPRYA9jc+ykmcunekXtikt+skbtOzgn3QVg3CvXxaeEqKPhMfhzHNu+K/UjX/lhGXU4OtOQyLX9a0JvZCtCGcxc1oWAqgFyUrN5uxC7FVMhN52maY5uZyvu5Hl0exti92Ykpl6ZQNO9QeHZ9gdp8yTMzBn8333dZFq2fhV78OwnRxa2l2Q3v5zN6RckNtJlX1qLVj6NMVPbK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(83380400001)(41300700001)(52536014)(186003)(8936002)(6506007)(7696005)(86362001)(5660300002)(2906002)(38070700005)(66556008)(478600001)(55016003)(8676002)(33656002)(38100700002)(4326008)(64756008)(66446008)(66476007)(76116006)(66946007)(9686003)(26005)(316002)(71200400001)(54906003)(122000001)(6916009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4731
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	365b1f8f-4d3e-453e-1b85-08da5f215c75
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bVkFCvOoM3vCnMvlIoJvhXBysG0VeyRI4EQPtghpu0rY2ajFZ7gT/l3UdW/RBmHBthFh9w36hkIP85WyTpgm/yGMYDONw9HKagBjGIKtOTd6PGW0B00S9Tgt5EtpBI9hvm8XOYt3eOB0lyGH+U+wH0wti+a886RqOtILWLvIAuRuDWjAf4EnIUtvxY6vHxH3dkeeKCuwhJB3mf2qLVxC60eKHzxrnq9QIKqzDM2MaArn9xR9Q1NGTBwXRXs1Tq9LtUweKMa5cZU/DvlqIQ4sIRtsn3D7z3sZEq1izqyPfpaI7MLs67ZisKe6Wv9dZQVcA/YMIt/IGI1SQVwMnhTBPekF/6bSFraE9/gqRmuADxHFh570Voc2VRnlzqJkpnEGaLC0AZXQGAKZcr3mDRVq4TcCAxXxk4+JFZPyFbmrfKUzl1Uh38y8sQf3N1zfdyF3DbuJj1bh2D0NITuOzW+9aeM8MdBEOBrkkJy+r6fHb+qaLEYKAM8e4ISsqZ4TDbk19TUvnsQ2BOobAZIUu2WeNoXMcjNKbzu+yQ1Yy2kRo1vGPIzqVA8ZAY/nnqcXdikpaAFyXQdTVF5k6h3QfYvRgNkAHP8qldGqMqsiafmBCC8LK0TUbcPBzwYYKVdqbCl3GpYNbIeEXUeOOII0n/ZuKGKk41SSbI40ybsVrDzrCwTMvCjRcLoy4xkphpRaqExnNPveJC4PQ2HEFLwonh0+B78E4eM763mjntleRuAGYERw94j4EbXkniyUhbQeV7wDY1qpIjryu/DjYxgpw1DbieU3RDYo9rDla2cq8MxCZKHKDnjHA9dp7KRMXI7+1HBA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(36840700001)(40470700004)(26005)(40460700003)(7696005)(6506007)(9686003)(186003)(83380400001)(82740400003)(336012)(107886003)(478600001)(40480700001)(2906002)(33656002)(55016003)(4326008)(8676002)(70206006)(70586007)(54906003)(86362001)(82310400005)(41300700001)(8936002)(81166007)(52536014)(5660300002)(36860700001)(6916009)(47076005)(316002)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:30:19.3572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3543d3c5-ed98-438c-dd0b-08da5f216115
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT039.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6420

SGksIA0KDQpJdCBzZWVtcyB0aGF0IHRoaXMgc2VyaWVzIGhhcyBiZWVuIHN0YWxlIGZvciBtb3Jl
IHRoYW4gYSBtb250aCwgc28gSSBhbSBzZW5kaW5nDQp0aGlzIGVtYWlsIGFzIGEgZ2VudGxlIHJl
bWluZGVyIHdpdGggY3VycmVudCBzdGF0dXM6DQoNClBhdGNoICMyLCAjMyBtaWdodCBuZWVkIGZ1
cnRoZXIgYWN0aW9ucyBmcm9tIHRoZSBtYWludGFpbmVycw0KDQpQYXRjaCAjNCBtaWdodCBuZWVk
IGZ1cnRoZXIgYWN0aW9ucyBmcm9tIHRoZSBhdXRob3IuDQoNClBhdGNoICMxICM1IGhhcyBiZWVu
IHJldmlld2VkL2Fja2VkLg0KDQpLaW5kIHJlZ2FyZHMsDQpIZW5yeQ0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFtQQVRDSCAwLzVdIHg4Ni9sYnI6IGhhbmRsZSBs
YWNrIG9mIG1vZGVsLXNwZWNpZmljIExCUnMNCj4gDQo+IEhlbGxvLA0KPiANCj4gSW50ZWwgU2Fw
cGhpcmUgUmFwaWRzIENQVXMgZG9lc24ndCBoYXZlIG1vZGVsLXNwZWNpZmljIE1TUnMsIGFuZCBo
ZW5jZQ0KPiBvbmx5IGFyY2hpdGVjdHVyYWwgTEJScyBhcmUgYXZhaWxhYmxlLg0KPiANCj4gRmly
c3RseSBpbXBsZW1lbnQgc29tZSBjaGFuZ2VzIHNvIFhlbiBrbm93cyBob3cgdG8gZW5hYmxlIGFy
Y2ggTEJScyBzbw0KPiB0aGF0IHRoZSBsZXIgb3B0aW9uIGNhbiBhbHNvIHdvcmsgaW4gc3VjaCBz
Y2VuYXJpbyAoZmlyc3QgdHdvIHBhdGNoZXMpLg0KPiANCj4gVGhlIGxhY2sgb2YgbW9kZWwtc3Bl
Y2lmaWMgTEJScyBhbHNvIGFmZmVjdHMgZ3Vlc3RzLCBhcyBzZXR0aW5nDQo+IERFQlVHQ1RMTVNS
LkxCUiBpcyBub3cgaWdub3JlZCAodmFsdWUgaGFyZHdpcmVkIHRvIDAsIHdyaXRlcyBpZ25vcmVk
KSBieQ0KPiB0aGUgaGFyZHdhcmUgZHVlIHRvIHRoZSBsYWNrIG9mIG1vZGVsLXNwZWNpZmljIExC
UnMuICBUaGUgTEJSIGZvcm1hdA0KPiByZXBvcnRlZCBpbiBQRVJGX0NBUEFCSUxJVElFUyBhbHNv
IG5lZWQgdG8gYmUgZXhwb3NlZCwgYXMgdGhhdCdzIGEgd2F5DQo+IGZvciBndWVzdHMgdG8gZGV0
ZWN0IGxhY2sgb2YgbW9kZWwtc3BlY2lmaWMgTEJScyBwcmVzZW5jZSAocGF0Y2hlcyAzDQo+IGFu
ZCA0KS4NCj4gDQo+IFBhdGNoIDUgaXMgYW4gaW5kZW50YXRpb24gZml4IHRoYXQgY2FuIGJlIG1l
cmdlZCBpbnRvIHBhdGNoIDQ6IGRvbmUNCj4gc2VwYXJhdGVseSB0byBoZWxwIHJlYWRhYmlsaXR5
IG9mIHBhdGNoIDQuDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KPiANCj4gUm9nZXIgUGF1IE1vbm5l
ICg1KToNCj4gICB4ODYvbGVyOiB1c2UgZmVhdHVyZSBmbGFnIHRvIGNoZWNrIGlmIG9wdGlvbiBp
cyBlbmFibGVkDQo+ICAgeDg2L2xicjogZW5hYmxlIGh5cGVydmlzb3IgTEVSIHdpdGggYXJjaCBM
QlINCj4gICB4ODYvcGVyZjogZXhwb3NlIExCUiBmb3JtYXQgaW4gUEVSRl9DQVBBQklMSVRJRVMN
Cj4gICB4ODYvdm14OiBoYW5kbGUgbm8gbW9kZWwtc3BlY2lmaWMgTEJSIHByZXNlbmNlDQo+ICAg
eDg2L3ZteDogZml4IGluZGVudGF0aW9uIG9mIExCUg0KPiANCj4gIHhlbi9hcmNoL3g4Ni9odm0v
dm14L3ZteC5jICAgICAgICAgICAgICAgICAgfCA1OSArKysrKysrKysrKysrKy0tLS0tLS0NCj4g
IHhlbi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3ItaW5kZXguaCAgICAgICAgfCAxOCArKysrKysr
DQo+ICB4ZW4vYXJjaC94ODYvbXNyLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDkgKysr
Kw0KPiAgeGVuL2FyY2gveDg2L3RyYXBzLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDI5ICsr
KysrKysrLS0NCj4gIHhlbi9hcmNoL3g4Ni94ODZfNjQvdHJhcHMuYyAgICAgICAgICAgICAgICAg
fCAgMiArLQ0KPiAgeGVuL2luY2x1ZGUvcHVibGljL2FyY2gteDg2L2NwdWZlYXR1cmVzZXQuaCB8
ICAzICstDQo+ICA2IGZpbGVzIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9u
cygtKQ0KPiANCj4gLS0NCj4gMi4zNi4wDQo+IA0KDQo=

