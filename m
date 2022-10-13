Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 136CA5FD92F
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 14:30:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421961.667698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixLn-0002SV-4t; Thu, 13 Oct 2022 12:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421961.667698; Thu, 13 Oct 2022 12:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixLn-0002P9-2A; Thu, 13 Oct 2022 12:30:11 +0000
Received: by outflank-mailman (input) for mailman id 421961;
 Thu, 13 Oct 2022 12:30:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oixLl-0002P3-W5
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 12:30:10 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2071.outbound.protection.outlook.com [40.107.104.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba2b59aa-4af2-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 14:29:48 +0200 (CEST)
Received: from AM7PR03CA0029.eurprd03.prod.outlook.com (2603:10a6:20b:130::39)
 by AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 12:30:03 +0000
Received: from AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::70) by AM7PR03CA0029.outlook.office365.com
 (2603:10a6:20b:130::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Thu, 13 Oct 2022 12:30:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT058.mail.protection.outlook.com (100.127.140.247) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 12:30:03 +0000
Received: ("Tessian outbound 937eed45f6ed:v128");
 Thu, 13 Oct 2022 12:30:03 +0000
Received: from c9f94786ab37.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6B214FC-FB90-48E0-8E23-C194D2F6CCA8.1; 
 Thu, 13 Oct 2022 12:29:57 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c9f94786ab37.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 12:29:57 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6249.eurprd08.prod.outlook.com (2603:10a6:10:203::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 12:29:54 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 12:29:54 +0000
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
X-Inumbo-ID: ba2b59aa-4af2-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UeNV6aHXJr1+nh6w9Mx5jsCk8enV/kZ3zgRnwGFaOYCdpmHcw4dy9cnfRFvxST7+kDdXeGdFJISP2Q8tD7I8foxXDsvvcmZ/yq0tJwjNUHuWcVclp7tGSDYaoyU5rGFn/NNtD/57SkUaSNZ3a0ldIspOTzcTHl6/nb6DwOj3b/e111UirUY5VfD/XLbR2wtKfK5jzLtECOWZ9sRO+ZHZRLC6cSzi20tedVaoZdVbc5vhjsGQ/va/B7IoE0VRe8lcomCnJk/PXcYxm9JIJXDtfdb86e99yZ4mnPC+dqcMaRfX0IC8WyVvDi4CaimfctqFJvjT0yWEvJvgjQTHizdGGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80VGvy7d2kxHrODTWZaQh4wvixCx3KfWxSemWDn8P/0=;
 b=X17SHu67VXPj14REDad1XpjQj+vKFzkhe78zAZc53G7Lx5wwvJ1CYEgqiJ19kgAcCmn448Xr/qR/5hFJnhDFKk9aw/vET3ZH6DK5vU7dBuFp7rIadVF50R4iM6Y0dw7oGli30vCMO6dhTYjK9Pyo9CmxS38mqnlnD+f2aymz9Qy2DrsYhEdEMMJbyZ8JDoDUVZUXrvo5JFzuGpAr+G0T4jnwFKh9ODXk5QWKRqN4V95tr8COqQmGrS8TNIc3/1XQBouqBZSk17dPhb5uageoncCGm82MuJZTmQT2kjb1g4DmiPy2mz4HYHVCV8kkPyLKWSkvl3QrtwZrymVtShHNqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80VGvy7d2kxHrODTWZaQh4wvixCx3KfWxSemWDn8P/0=;
 b=uVfT2zLnvaWyv5ngfA4QoURrtJuKfiwfBWO71ApFVTSgFL7t19l63GceVADdv1/UrXYprNVc/N46W0jWHDTrRbSCFDg71T+Le6jNyHRkSFJrOUuj0gJhjKfMfkVJKIauCKTXqb5ZGQs0joOdYpGRw41VwVCb5PoLt3xGY2KN7mQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKHarzTbXSia/GmErKImzCzge8ko6rssMu3LkhL3cuxPw2kWSX6R4hAi0PmWlW6K7fmBaPt1o1iiuHLaZ/ZT/YX0ttvO5YxUoMbn1clbTqUyOpQqi1RVrBvt8i8TwMBJs/MCYrpv4OSMLuowKO++6lC8vZRMsCXWJrBMpoqWscJzqacG6siDaMxp1gVTiDloEA6VL8Q7Z1IYJcCZ1Hwh12WdzExwaNLiw53Lcv9K2l92e0YPObPq+NhhWjfQhldx5RrKv2jZyrGSBNd2iGGJpI8xUAD50aGebP0x2k8DbG+CbL0AiT0M1eLkvF5JqICK8CkLb9LRB+3Rm19n674u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80VGvy7d2kxHrODTWZaQh4wvixCx3KfWxSemWDn8P/0=;
 b=VZNdIzrCRM6aphUIWs3U3LT242zltMvqYLuhnmLzObZYRvEcdjC/hH4emYH17T127/SBkVItioQHibYMq15j2AXzd8pAK0N2WyNRfz2oMaPcq+A626qk8xZbnrxpQGYL7OOMAfZ+0+RWuLg6V6dXLW5KgPv9xO5JZ39NVanzIo97pV7191czvaw4arjygN1YWLDw8CqWF+Q+Dn5nXAJmwNA5F0bMSAAMkenD5I+g1MIbQNn14hwRA7OiYM43j9r+RZqb2zhcr1Oxfb72Q90DwHNY52WKeis7rcq68dnvzVjYMgdiSaoyaWP/MHggV5h8hd07jrDXzmT94xNd7P7wCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80VGvy7d2kxHrODTWZaQh4wvixCx3KfWxSemWDn8P/0=;
 b=uVfT2zLnvaWyv5ngfA4QoURrtJuKfiwfBWO71ApFVTSgFL7t19l63GceVADdv1/UrXYprNVc/N46W0jWHDTrRbSCFDg71T+Le6jNyHRkSFJrOUuj0gJhjKfMfkVJKIauCKTXqb5ZGQs0joOdYpGRw41VwVCb5PoLt3xGY2KN7mQ=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>
Subject: RE: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Topic: [PATCH] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
Thread-Index:
 AQHY3t81xdeRddBbSEGLoF20gErPe64MCngAgAAAYwCAABzHgIAAAcyAgAAAK9CAAAi5AIAADecg
Date: Thu, 13 Oct 2022 12:29:54 +0000
Message-ID:
 <AS8PR08MB7991AD5D30E4EBADD0A7582592259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221013083818.36209-1-Henry.Wang@arm.com>
 <c1020b65-491f-e1c5-3ef3-7edb99e0435c@xen.org>
 <AS8PR08MB7991F3222D1C616AEF9C771092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2c2b3e8f-34fc-1ef2-c086-233964e29e43@xen.org>
 <03419318-275a-1f9d-6e00-1a3489659f22@suse.com>
 <AS8PR08MB79917792FD8A7695C969020992259@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <05c4def0-321e-c864-7d92-b4dfe110d030@suse.com>
In-Reply-To: <05c4def0-321e-c864-7d92-b4dfe110d030@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F6B749C9B5090A49AF7D9A5FA2D4AC6F.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6249:EE_|AM7EUR03FT058:EE_|AS4PR08MB7429:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f623462-e94b-4582-d0d4-08daad16a739
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 RgFBwPCZ2gBeteaFXn30cbf940bJfklTAwlBQ3aPi1kqoijN+U65c2glneDgNaUgBMR0/NfpEqZ4Zg+uAPsdYUj3qktWwHPTJXlLal9mAgwfoZk36QSW/a89pRr9k8gXHN2P11WBVhXy7SBfv7kUeXKGCn5NBNVUiO4puavcOnRkZwjBmUVmKW/qJqxt9hn2PACPb7HgpxMj9fzEkrSvXMb61biy0MEmZxP+p9SyrsVL/nea9uoe1+US90Jh3mOcf09sT6MCaFYFK3uEt/E9gfhNI4FSMQln80u2ApkGTt8jUAfcllvDuIr1qCuRFA2zqDVEVZA9IbZShcsrU5638X2Otu4JFlpl1XXP/GGdJK+yXKsc8MmYd+sWjDDiHTxZvQV5DOjCvq7Ldn4Cposm6LyrAWVIWnr6VFv0ZB9+Z+bfUQeU6uIErfPoXcJciTnxZbm7KYjyos6i5+CWrCFPwaaAz/ZHFbepbV7K1zM27e4K2etZ4SJHMs4qXh1vL3NuZNkiHC9bpbuLvX1OmFeVW0bSAOgYv1r7sFdGrVlNSkKXmm5ze6BJLFuCYEjbpzkG0623BuaexizPNIglWq4I/cOVPTqXNcJrHBZmH5l4UhV4IKJpNR6VGPUWcXNj0XBWkv9vulxGC4ZhcSWr17MrOgt8qHnenAMwp19YSCIpOQbaKp2Of4Idoh9prBtPvnGlGlQiiwvFTZFKRPSHytjNJUs10dc3uxIrC2TQOGNDtTXh9vABSM7SPKw+ZDCgwTxRw4srbxGSuLEPDra4zlLV4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199015)(54906003)(6506007)(316002)(38070700005)(71200400001)(8676002)(4326008)(83380400001)(9686003)(7696005)(2906002)(55016003)(26005)(4744005)(41300700001)(38100700002)(6916009)(52536014)(33656002)(8936002)(5660300002)(186003)(64756008)(66446008)(66556008)(66476007)(86362001)(478600001)(66946007)(76116006)(122000001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6249
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	71a403a2-aa20-4952-b078-08daad16a20c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rv0MfpZ2R7249lHrsmO9k1612O0hCWJ2gd4cgrSoYA99oW6Oz8ZMTewqyWeeSK+E4Odj89GLiAZ3lJE9qEB5MwkFWIstR8CWM2AyjieoITX7f5EHpCpBdp/CTZICaRT37i6xi+BCZi26tLpmNHf86CFEPsn5Rw+WvDTx5aUXRiPds/EANqRK1VbGdxonHC9VDwZDJ1h3CzZLsGYN4ED51coHMCP9KKzYnMnuLAy22HreeKLFvQ6C1D01Z5QGoNyUxvapi0ccOwsoFrUsfIwkPjeOcSldBXNJ++OshFb3wAmbbhijrw8VIL6MxH0b0IxjN01pfBwQp1Zf8qWNv2CuoQQOaZultuTRRMPhoA4oRr9A8EOF5mIMHozsZab6hB7jaBYqr+dIbJhINXoETmZokJ2bxvkVMMYl0ra7irPKQ5rnrL3rmdFM/W+ED7eD64eosKGA7Gd+ysZUTvq2L0RE/rBRTn2A7LtJCWuHjWhahbqaXeuehbu3y2A+MP3fS9IrLWrl6GD+kxb37oEuklAP6X9cIT2whd7jP5WGL8U9YCnrvY8Z3Aflajji1/X/LDBOqwTHHcc9krr3sI2EWz1WX823BONe1yRWtc0Jw7uQCs6OocQHOYQaWNHM8lF+Q8pDLm/IooO+3WupZK1/dQ+SaAy4XP4kLr0edT3jINKuf7mz0J1zjNou+SZRdVDCeWWfPn5X6TMYcqk+6vh1j5bFFHoFqcIx7ys8GBXtCFfuaLIg3PLR57pO5HxBVAKpIT+HFR2APmh+afD4XHFOq9zeYA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(7696005)(9686003)(54906003)(316002)(4326008)(8676002)(82310400005)(356005)(36860700001)(81166007)(82740400003)(41300700001)(70206006)(70586007)(478600001)(6506007)(26005)(4744005)(52536014)(47076005)(336012)(83380400001)(186003)(86362001)(2906002)(5660300002)(8936002)(33656002)(6862004)(40460700003)(55016003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 12:30:03.2191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f623462-e94b-4582-d0d4-08daad16a739
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7429

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPj4gQXNzdW1pbmcgeW91IGhhdmUgNCAoTikgcGFn
ZSB0YWJsZSBsZXZlbHMsIGlzbid0IGl0IDcgKDEgKyAyICogKE4gLSAxKSk/DQo+ID4+IE9yIGlz
IHRoZSByb290IHRhYmxlIG5vdCB0YWtlbiBmcm9tIHRoZSBwMm0gcG9vbD8NCj4gPg0KPiA+IENv
cnJlY3QsIG9uIGFybSB0aGUgcm9vdCBpcyBub3QgdGFrZW4gZnJvbSB0aGUgcG9vbC4NCj4gDQo+
IElzbid0IHRoYXQgYSAocGVyaGFwcyBqdXN0IG1pbm9yKSBtaXN0YWtlPw0KDQpOb3QgcmVhbGx5
LCBpbiB0aGUgY29kZSByZXZpZXcgcGhhc2UsIHRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIHdlIGlu
Y2x1ZGUNCnRoZSByb290IGluIHRoZSBwMm0gcG9vbCB3YXMgZGlzY3Vzc2VkIGFuZCB0aGUgY29u
Y2x1c2lvbiBhdCB0aGF0IHRpbWUNCndhcyBub3QgaW5jbHVkaW5nIHRoaXMgcGFnZSBmb3Igbm93
LCBhcyB0aGlzIGlzIHN1cHBvc2VkIHRvIHJlcXVpcmUgYSBsb3QNCm9mIGV4dHJhIHdvcmsvcmVm
YWN0b3IuIFByb2JhYmx5IHRoZXJlIHdpbGwgYmUgYSBzZXJpZXMgZnJvbSBteSBzaWRlIHRvDQph
ZGQgdGhlIHJvb3QgdG8gdGhlIHBvb2wsIGJ1dCBhdCBsZWFzdCBub3Qgbm93Lg0KDQpLaW5kIHJl
Z2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiBKYW4NCg==

