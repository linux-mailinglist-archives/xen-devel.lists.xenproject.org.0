Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9144E581937
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 19:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375638.608087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOlR-0008BV-RG; Tue, 26 Jul 2022 17:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375638.608087; Tue, 26 Jul 2022 17:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGOlR-00089E-Nd; Tue, 26 Jul 2022 17:54:37 +0000
Received: by outflank-mailman (input) for mailman id 375638;
 Tue, 26 Jul 2022 17:54:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CAXX=X7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1oGOlQ-000898-1K
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 17:54:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2057.outbound.protection.outlook.com [40.107.20.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0112c3e1-0d0c-11ed-924f-1f966e50362f;
 Tue, 26 Jul 2022 19:54:33 +0200 (CEST)
Received: from DB6PR0802CA0048.eurprd08.prod.outlook.com (2603:10a6:4:a3::34)
 by AM0PR08MB4481.eurprd08.prod.outlook.com (2603:10a6:208:148::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Tue, 26 Jul
 2022 17:54:30 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::df) by DB6PR0802CA0048.outlook.office365.com
 (2603:10a6:4:a3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 26 Jul 2022 17:54:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 17:54:29 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Tue, 26 Jul 2022 17:54:29 +0000
Received: from 7c4cde0860f9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0CD7A060-B7A9-456F-B227-5A7952886530.1; 
 Tue, 26 Jul 2022 17:54:18 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7c4cde0860f9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 17:54:18 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by DBBPR08MB4458.eurprd08.prod.outlook.com (2603:10a6:10:c8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 17:54:15 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::4ca:af1b:4380:abf9%5]) with mapi id 15.20.5458.024; Tue, 26 Jul 2022
 17:54:15 +0000
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
X-Inumbo-ID: 0112c3e1-0d0c-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lMfMiMxNPx1DQd8nddOfMoejmp5FZNb/fpXoXiU2GqMqoo7w916UJdmUxMnRsfYBebFUBVSV0g7+Q0S2Uj7HYvmJqVJ0Z1kFjoDKY1ElyGEJtGzXqdl+0ZcdKGNovOPzz4k7HaCBYFnzL5T8YhVOfcIFdnQZukrBr5P54t7WE6jD5PKEVnER+GqexrOaDpMNasyi1FV9YpcDzlqHb2IpKkuV8IS0Y7A1CHoWesVC0IZ6pvsE+zFn638sNH+T1Xq+rwo3PRHY8ro3bvxJmzra/0bwBvEgFjWI0/QtCwyuVB1VDZTxlrODnWyvuO23KmIDyRuKES9qjpNWDuGUWulaMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqf2HrM5cwNlZb1sRn9sgOYekHVMARMf1nskCLjgsNg=;
 b=K/H57BJN82CpPgw+NFmq5wTe0FpJFdpzWoGKvE7aYkuGgk4ntRsDxwSgj+b50gs/Gg3BbqGiXSGOHOaaeFA/IdqxG2EQM3Fw7SgV4Pa+L49T9LdhchLy+fMA1narwvnJr0B9HtI/0q/vG4VHc//Djn2XbONoCjFkK1uadF1TJq0KPYZE8+1kNLPt4+9IH3GY+kMbgCVopZUAl3I2iKdKkG57ATNnPdeupkM7zD0rizLKJrOl9MhO15Y+ULF1XObLaAuS8eydjHMvwXq82sQ2dv3QyZeDa95gQ23NmDs1JVk980Cnayev4+b97nUeir2zW94tpNKmOPEB1BA0ICsljQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqf2HrM5cwNlZb1sRn9sgOYekHVMARMf1nskCLjgsNg=;
 b=jc3Fy6IQ/+1I36nflsVl1KbnwmqzaUhaHL4wS7sqgUVMxHE1l38FRiwLld2MN6sTYrEDz8Wc/lHYElQKo8E4Ff12zbQneC+sugX/IYLsu0sF7DU1kNOFhcw7cjYG3fCsKq5/kPdHvW7q1lgHkyi8RoPTZ8D46AbbIepRa3oBKqo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3451fc0f16a722b7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EgSr1P95KSyHfx747T17Qgmot+/m0ni0bJzUVw/LdGAd9NcoRGdWFpVRoiLqzO+2Wd4ztt8VHy0XbefFs9+dY7QcQWrvotp2mvfOGF4M3gPzAoAMkknNMpHC/KexpN2I947x4M3xP6w3nMWyVpKTgWolH+8j2h1HodtelixNdUApKbAOe/G/Bo6ftccNFT0PVfGCo5IRD4kmBS/kpfN1VdoOdI/mz5uTqLStsrIscUGHbIgntXsNP+SSg9eNWkgoWE7uih9cKZ8p41K/x+KUIhOjfha4aQ16aY/my3UWLQbO/22GCLMMhiEkzkpj36AZz4StnZZQjhnM0O2YOmUQGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqf2HrM5cwNlZb1sRn9sgOYekHVMARMf1nskCLjgsNg=;
 b=Ws/ztLCFgwEleruslGLhVZYT2q8reFcFrQaDWah53cp7LEfQZbvnXBZl4ch7tbXFlUV4fzPii0S/73LNT1Iu8x/J/1misOzVkmtE9CwsYR8a9gYZR/QESKXxnqb/SyPX+/IGyrae60fewqRwOSAReiDI1VvmZBuP543qpwyHqWha/r3VXwKoLicIDCguPo0WTORWCtUu2TtlAe7EBZNc67VOkQbLqVtuBWdDv4FJlhdcuQntTF/W/8RAIxaBrpfSTdS8oPA5ek1U7uxsMtnqxKtGqWV1ozhuJn+AhiXyZq4pCbZLXL8+cWVrVvvDpPlwnA45QVOP7g74+jLmF/YG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqf2HrM5cwNlZb1sRn9sgOYekHVMARMf1nskCLjgsNg=;
 b=jc3Fy6IQ/+1I36nflsVl1KbnwmqzaUhaHL4wS7sqgUVMxHE1l38FRiwLld2MN6sTYrEDz8Wc/lHYElQKo8E4Ff12zbQneC+sugX/IYLsu0sF7DU1kNOFhcw7cjYG3fCsKq5/kPdHvW7q1lgHkyi8RoPTZ8D46AbbIepRa3oBKqo=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Hongda Deng <Hongda.Deng@arm.com>, Xen development discussion
	<xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/vgic-v3: fix virq offset in the rank
Thread-Topic: [PATCH] arm/vgic-v3: fix virq offset in the rank
Thread-Index: AQHYmDhKpSlCCmBtRkalGlTcUHBM2q2Q/kQAgAACugA=
Date: Tue, 26 Jul 2022 17:54:15 +0000
Message-ID: <64095CA8-C1FC-4EF1-874C-E3E1962567EA@arm.com>
References: <20220715104620.3929121-1-Hongda.Deng@arm.com>
 <b19be266-82f5-eb14-36df-14a5b21b40bc@xen.org>
In-Reply-To: <b19be266-82f5-eb14-36df-14a5b21b40bc@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 21e0c7f0-0f35-4785-f97f-08da6f2fe362
x-ms-traffictypediagnostic:
	DBBPR08MB4458:EE_|DBAEUR03FT026:EE_|AM0PR08MB4481:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qUEO9GG6IIaWyc2TeXxMcPUWgP18I2HeaFNu1h+UkC4Z38H3QXdjiMO7mAPL67ynlav0Ax4EARvGrHc2Y+i7QsQffPgbF7Y7EBSBEZIWqhzzcI5FPojHz2qfCPM9usEADrc+7TKDb5MJ8n5Ji0JROkcs3AGcjvKOTE/r+d1Tdul3Jtt4esEmc4vfPuA+BuOaZsilhugCIz+xuW7OVoP9wXuBt1Res0WcuLae2+2k64Q2jp/O3WkFBjy8Fv7XN3ZF0h8bfU+YksDa1STLET47bLJXaPdZInFqP4okHAxICvmSBEh98R2rgUoE63Vf9Kx7aEpvGLt+DZth7b8MyE151yogLhCDKzSKVsQtjomV8LPpXWKaULmzgMRZ8r8T4S0OUgHIScatBC++VWmhiBkQ9pwQ0z9B8rhL2XP0LHMsMJb8RpgIvRPnVBH+vTWGiJMTyS2bEqkw2M1jhPnfnIv6OYCHJEajF1GnUqdAtiU9EcPrq2hXCRnX2E+GZHuinfjvu+ALttnn4G0rVcYn897OXdezoZdV2c/YutOGlR5DDJWf4ZvlRwJtk9bvdEn1xrv7uTHLmk2VFxoYUrG68qIyEF34P3U9cCOh3TMsUuRIpOlEfudYJXtL3etzSJjuNy12Ew3TA7FWtQIwOQWrrJvqz4Fejea0q/T2uxUqlbaDEVQq6IAKxfGIS1ReuO1fIEcP36M1QFgE/0Rl/cByLGdbUZGT6+S+SwZDZ7sYIrSy7Ub37QVyhZs+NeHsr07jHAnfO5v2WgV60MpK9L1dM+HO3rf1qzQrCDlFANJqcsHZ0bO3WnyDzWmd8kh/xgQ+rtR6yFgFv3/xZP2PCmzgpt12IA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(5660300002)(26005)(6512007)(38100700002)(6506007)(64756008)(4744005)(8936002)(36756003)(186003)(6486002)(478600001)(83380400001)(66946007)(41300700001)(76116006)(33656002)(91956017)(66476007)(2906002)(86362001)(4326008)(122000001)(6916009)(2616005)(8676002)(66446008)(38070700005)(71200400001)(54906003)(66556008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <91E4CF8F3C1E0640A27B195B2896AA2D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4458
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ee71a0b7-8dff-4385-aca5-08da6f2fdaca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0OyPMJYEuJKY0ShbM3H0Zt2yM0fCOwsNwji5Ko92YokZiFa7qELPJw1V4glGzhxUesfTwwCQmKB/bSu/EJsNwScdfFywo39c0JvPKH84FmFEP2DjWhEp5FZK56b2L0fUi4E4lovOEw9xtgeU6D9M3IyCE0L6Tpep3bvElg2uszFJN1hFFmS20NDfaxPVoXAiIRtKtd9mvlvdfYM1M+0yR+S2Pta/LQfeQ9xVqL/8VB0QTIAsUA6/wTQVDMgCSyA8UlLo9E9dSxyx6Y8XqYaoGtk+zcTJZP1Md/I+2cIPfRHf/rmZizgtCM/uyv7DKXY0lkYsSjLxRMa7Cu8i2UId8q/3U6W4nY0U/MFY3LVRa9Gn652XLvTcwX31llKAOGugUBSo3R006X0eTtqkVayoeXJ6SWXz8MILdTUzO7UV6sZNxsI/L/bHpjTeBS68Ti4ixFblpvyKyvlTvdVe8WIUQfOZTmmo7Wf9bB44RqX22Mene+5FXD/3wGhrsdXM1/YZmGE56Jc5jUqGA//7tvldHYp1glefBAPKYA8KhkAyEVrVldYSjlUV2tBfnOiqzE9aU4rG6ttZ6MfpoDZmNA0wwZRFwcscQpmxAwF9RpDMG+AOsiArOnnl10zHdAPwx4FnmHysgy6+eRe9jlRf77LnoFhVS6SmnQaFAYo2y9PF+O8YmTtwEZyI7y2Kvr88wW0sTvJvkJFb1KtJ42LOmZoDDTYi/2V2uJuIsbyWdYyfDCwbh9SzsL+Z9kUeQxxpUKepOV7dEgQO8YLauee0XwkJx2rJkcTRtXhUdW8meXzMrFAEEAh3Tpv6mZbtz/9GaRsC
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(376002)(396003)(36840700001)(46966006)(40470700004)(6506007)(36860700001)(4744005)(8936002)(6512007)(40480700001)(107886003)(6862004)(2906002)(186003)(33656002)(5660300002)(26005)(47076005)(41300700001)(2616005)(40460700003)(36756003)(356005)(4326008)(70206006)(478600001)(8676002)(83380400001)(54906003)(82740400003)(82310400005)(316002)(6486002)(336012)(70586007)(86362001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 17:54:29.5406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e0c7f0-0f35-4785-f97f-08da6f2fe362
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4481

DQpIaSBKdWxpZW4sDQoNCj4+IC8qIEdldCB0aGUgaW5kZXggaW4gdGhlIHJhbmsgKi8NCj4+IC0g
b2Zmc2V0ICY9IHZpcnEgJiBJTlRFUlJVUFRfUkFOS19NQVNLOw0KPj4gKyBvZmZzZXQgPSB2aXJx
ICYgSU5URVJSVVBUX1JBTktfTUFTSzsNCj4gDQo+IEFGQUlDVCwgdmdpY19mZXRjaF9pcm91dGVy
KCkgaGFzIHRoZSBzYW1lIHByb2JsZW0uIENhbiB5b3UgdXBkYXRlIGl0IGhlcmUgYXMgd2VsbD8N
Cg0KSSB0aGluayB0aGF0IGZ1bmN0aW9uIGlzIG9rLCBiZWNhdXNlIGluIHRoZXJlIHdlIGhhdmU6
DQoNCi8qIFRoZXJlIGlzIGV4YWN0bHkgMSB2SVJRIHBlciBJUk9VVEVSICovDQpvZmZzZXQgPSBv
ZmZzZXQgIC8gTlJfQllURVNfUEVSX0lST1VURVI7DQoNCi8qIEdldCB0aGUgaW5kZXggaW4gdGhl
IHJhbmsgKi8NCm9mZnNldCA9IG9mZnNldCAmIElOVEVSUlVQVF9SQU5LX01BU0s7DQoNCldoaWNo
IGlzIGJhc2ljYWxseSBvZmZzZXQgPSAob2Zmc2V0ICAvIE5SX0JZVEVTX1BFUl9JUk9VVEVSKSAm
IElOVEVSUlVQVF9SQU5LX01BU0s7DQoNCkxpa2UgaW4gdGhlIGNvdW50ZXJwYXJ0ICh1cGRhdGVk
IGJ5IHRoaXMgcGF0Y2gpIHZnaWNfc3RvcmVfaXJvdXRlciB3aG8gaGFzOg0KDQovKiBUaGVyZSBp
cyAxIHZJUlEgcGVyIElST1VURVIgKi8NCnZpcnEgPSBvZmZzZXQgLyBOUl9CWVRFU19QRVJfSVJP
VVRFUjsNCg0KW+KApl0NCg0KLyogR2V0IHRoZSBpbmRleCBpbiB0aGUgcmFuayAqLw0Kb2Zmc2V0
ID0gdmlycSAmIElOVEVSUlVQVF9SQU5LX01BU0s7DQoNCldoaWNoIGlzIHRoZSBzYW1lIGFzIGFi
b3ZlDQoNCkNoZWVycywNCkx1Y2E=

