Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1059560F3C7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 11:35:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430983.683378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzHo-00047e-1B; Thu, 27 Oct 2022 09:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430983.683378; Thu, 27 Oct 2022 09:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onzHn-00045o-UR; Thu, 27 Oct 2022 09:34:51 +0000
Received: by outflank-mailman (input) for mailman id 430983;
 Thu, 27 Oct 2022 09:34:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB4N=24=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1onzHm-00045i-Lc
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 09:34:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80087.outbound.protection.outlook.com [40.107.8.87])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99fd75d2-55da-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 11:34:49 +0200 (CEST)
Received: from DB6PR07CA0024.eurprd07.prod.outlook.com (2603:10a6:6:2d::34) by
 GV1PR08MB8177.eurprd08.prod.outlook.com (2603:10a6:150:93::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.21; Thu, 27 Oct 2022 09:34:40 +0000
Received: from DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::2a) by DB6PR07CA0024.outlook.office365.com
 (2603:10a6:6:2d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.13 via Frontend
 Transport; Thu, 27 Oct 2022 09:34:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT046.mail.protection.outlook.com (100.127.142.67) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 27 Oct 2022 09:34:40 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Thu, 27 Oct 2022 09:34:40 +0000
Received: from e969b8366bad.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 651E4A33-68AA-4033-BC3B-FDEC135F3780.1; 
 Thu, 27 Oct 2022 09:34:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e969b8366bad.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Oct 2022 09:34:34 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBBPR08MB6204.eurprd08.prod.outlook.com (2603:10a6:10:1f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 09:34:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5746.026; Thu, 27 Oct 2022
 09:34:32 +0000
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
X-Inumbo-ID: 99fd75d2-55da-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Mi3MTb3kJNWKubVMXZ8Ya9CBa6KuYXwtOvv9M53AEeOD8TUYqBQBNVvL9gVcBDgy9xMYxTz1knvRyDidCRB3+jdkOkv/XnNiAEfo8Y73NVE+pDhxDgrDxy0Fm3yUaRMhu7hOZPi4lXug806es1H2TJZHOrMIroOEWqhIh1fJ/kJlHaeNy2blTps+99X3bZ4oXKTRmYfq4oPmvQBZAKODynkrbzDl/fHHGSE5zmTPVHRw2sMqhM63pbGtX68LdUcpeYS5q6IdPP2CDoXdj5LnkUoyOu6+3k/k1vAPzlbwOBBbA0HtlkJNnNeaAz3mBQtwi/+Yz45spNJmwh4gZg7Fag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=680r0LKeV1ifl+jM/E3JSYDCiKPY6uzKvzbryl+Fs1k=;
 b=KxHR+Sbgm3MIz/E77LL7/P2c3+I8nuPVJoqg3bXyHuVVzy6ZbOhcRdIsW4o5ZOu7wgptUTIe3qV9jx2qY0WglvwJ0j1oWB3oGB+EcNL7LBlInd6DQg664oW8ck/UMMsq6z8PlZWRz7HTuJGrOroFV9wr6g4c91u3jUxrJ0kYHp2pqkfVuqHRV2dmtsbJAEb1LTE+lZjb5vv3gVpq/s2hir/hW/ZaHK4MRe7lCboazIPyCjLTCa8r/5DYqeRRgMt8QFjEsmyYJ/eqGyXiebJLWUGA2DWW6r4iGBSUHTe0+1c5kTfNf0e1k34DDaiGES6V7eUrP273DMcb8zHwL1oHhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=680r0LKeV1ifl+jM/E3JSYDCiKPY6uzKvzbryl+Fs1k=;
 b=NezOZhaTiy8tAL+VPkO6Cx8Yht4Eadwylaxg4lUTtIbPcSmYs6vJdK5HlhnLbpNmTCmnt1IwJxCcOUNhqi5c/cpGXcigDCEX/4yOSoI+CSegS/WKEF+zJW3iRgatdtuvAQK+xVpzG8SC28UMpISsagq8YxopYvXOvZdyXTdQMdk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fw8Z4jUCg85uUZUXt4sR3KEX+0Qrqxnx//bS6H+h5wqKdOVntB/pQ85u+fYGbD8o1X8QN+oExA2DyfQOlTD9b5wwMs0ryPvHWSS66Bj6vkqJ4EPffJslgDBut+M/BVva7YXhqqPl5HzH8n3uthko4cRPF+KYYZbijL1BzMnneI0kctRZPkkosSi4S+iB/OKo1CrQSJHLodj0H6Pxo2fCXvn+5OSRsFhwp4pHiGz7yi+lGTETQO3CpIo9Q0Txh8wbUP4ymu2kvp1MtR0p6CJ/Et5BzFgOFo8SBPM6FGzRDzQtui2BgGD6BGPHN71Ekpg3biz7PDcBuGvBfsE4AL+4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=680r0LKeV1ifl+jM/E3JSYDCiKPY6uzKvzbryl+Fs1k=;
 b=hD+ZguecrjKusAChMoZ8ZLPeQNlMSeXktX2ffWULNC47ZrYlZsOrLJ1Y9C1TwSe5Eq0iGTT1nlhYnnNNdbUZoYbLzXu341eVZnCrqJhehMmjmCNNYAQQEW0xFkWWhFeq0rJbqxweI241xZLCuTrLNhj7Bs+s8LNE3XDoR/pEUjOdXS7FTDLTiE57pamCqDWjQGakmSRwc5KguPoKdAM8DYv0+XdkjJhGNirfTnB/0dUgYYu18PhmE9jycTDXnuoNbUmUflMu0NioediLYDUHlT3fc4Qyj/v/B9S6m8Dqx849SbaRMbHuPTosv9sy3VytoyU1OZA2yGJOoKCH2TRcNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=680r0LKeV1ifl+jM/E3JSYDCiKPY6uzKvzbryl+Fs1k=;
 b=NezOZhaTiy8tAL+VPkO6Cx8Yht4Eadwylaxg4lUTtIbPcSmYs6vJdK5HlhnLbpNmTCmnt1IwJxCcOUNhqi5c/cpGXcigDCEX/4yOSoI+CSegS/WKEF+zJW3iRgatdtuvAQK+xVpzG8SC28UMpISsagq8YxopYvXOvZdyXTdQMdk=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Anthony Perard
	<anthony.perard@citrix.com>
Subject: RE: [PATCH][4.17] Arm32: prune (again) ld warning about mismatched
 wchar_t sizes
Thread-Topic: [PATCH][4.17] Arm32: prune (again) ld warning about mismatched
 wchar_t sizes
Thread-Index: AQHY6ebILjCZ5f5rwEOE6D43MoDXY64h+r1g
Date: Thu, 27 Oct 2022 09:34:31 +0000
Message-ID:
 <AS8PR08MB79919F3B1FFBB69FE1744FD092339@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <6a6df9c5-a527-63ac-60ec-fe7f3b6fadbd@suse.com>
In-Reply-To: <6a6df9c5-a527-63ac-60ec-fe7f3b6fadbd@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 04FAE19D423DB44E94A6454245CF9135.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DBBPR08MB6204:EE_|DBAEUR03FT046:EE_|GV1PR08MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 31786580-02fb-4ef3-ef9a-08dab7fe78b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 soA5nDnH4FGOf/DMXhg2QlU00M9bDVfhEM/YJDV+bFfX646vOaVEzcB99PY0+tHJqtEJlcER2e75kQystKtpmPeOROKDEezZbd1LvKgsiFdzdCdCQZCWBMRJ9Mjtezg6fHXNG/9V/jLQ/c0XjgFHuGmP8HJf++8NlQ6rU95NnN+UiU46/esfIkku5AL7H6OnlYosCtnIzAZS8gc8mol9ZedTCYK1XOVaoo7+SR0yyy7sCgU16U69ndiaycW/JOOhnZoQuAVqIybGD6gDPk7unoQLJPPGHPPfvMNXtBomv6XR1TcDHnjadUmzZ1y9UuC6KApXrAHNBKQZ6D2ustxu562ysWsAapcwqJ1eJr/qmvPIFDYzfDtxq6rdVu1+ArWdc+DRTUZoF2zY7Q/uUwuJ223lJXZVtaS0RiKLLcOJ4ZuOH1TOVh2RAPN/m9tCdPE2Td154oEEapK9h9/wQttvgMdZgsnAQNTjXU329uRU+Q7rF8gBXJV899xpsSjpjYqiB8FegAl2xc43Y1pyuwmK/X+siaTDJq0m/0Z1GzAqVdqCs72ly2nSacij+/6WUDwJmiKKJrD26DmEVNLESg06cVh4wv8PQUFE1mJmMsEGt7aomhTwLEIVbi5Q37GcaKkHmzHJTa5oZKK7mNotyDdMv2elqcd2YEQl5l/p97o0PfZFEK8F4rB6yg78DlX3hspiTirJi/xGlBoQLO0JFagftHTuUMVUk84iuZYxBMgE7yJcYSIgRstQipDIY8NcwCh5T6BNTJwx6f6Z47ME5W3mvQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199015)(86362001)(33656002)(38100700002)(38070700005)(122000001)(2906002)(9686003)(26005)(6506007)(478600001)(186003)(7696005)(83380400001)(71200400001)(110136005)(41300700001)(316002)(55016003)(64756008)(5660300002)(8676002)(54906003)(4744005)(66476007)(4326008)(8936002)(66446008)(76116006)(66556008)(52536014)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6204
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e9622c06-7428-4843-3c3b-08dab7fe73db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F10nXAtf2llVyzYKhxel7BVk3qNPJgVzeCA20HmGo/M0g8WhBslYVLTRbM6o6km1QVju61dMsyFH4/yRRCjO6JZkKx2d9mK7cpYXNBCJ16nFZgh2Qa9Z+Lev1lhRVtkhMYDRP04wPgEQQ5CTWRQAWf6izu7wnU2jymtWW3xC3dmQYLI886pBvnxAt/TgH5H84o5EuBDLjShk2lZppG0qmTLKmz4FOzb6ta6e6e9ChhViPA6DFoY6y6rIrE2cJF8p6GWZD4pTKKD3C+32AyES8s6Kgftdfmohu3BCoov5MKIukXlqzQXyTlPW+aThsQYXxDa1Lq0lvy/0JsX8H3p2AyWE1HiAYypgy+jDEeGKejH0CdrLk3AgUT4K27l6cbphDsG0xohUYlickUV6Pwgl2rb5tkK9MEqBz2SmCNztvLtIC7xISMEoac/Qx+/maHYUeS9uhF9XbJiRYmhCj+t4ctxfKJJcV0uooyVnzN+uHE+wDrkfh46PW7TMhh99Ba7EPxv3JlBzIID0PtHYZq1hNpQZeBKF2K6Ks736pox2J4apBDmWHVk6kQROnu+pZrD/7VCmiNXFZteYg+H/8bLD+7pFWM2OPb2zXGyxIIo6KxEoQEGrBEiX2raRFYr3+1mZbPGAAwCVZz6MR0aYRWxImsWeLXDR7JJ2s9xWI633kN3IrqHUbuO9w+wIxG6A2mBxm/XC+246zURvo6JJnrEvbW9s6QoT7gPwU5A7dZU3/QjSnkL7yVOPye5G8YrEQGYmGIU/mPDCLBTpVxvA/WqvEw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(40470700004)(46966006)(36840700001)(5660300002)(336012)(83380400001)(2906002)(47076005)(186003)(82740400003)(54906003)(36860700001)(81166007)(52536014)(26005)(40460700003)(356005)(4744005)(55016003)(8936002)(86362001)(82310400005)(478600001)(9686003)(6506007)(8676002)(110136005)(70206006)(70586007)(4326008)(316002)(41300700001)(107886003)(33656002)(40480700001)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 09:34:40.1152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31786580-02fb-4ef3-ef9a-08dab7fe78b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8177

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXVs0LjE3XSBBcm0zMjog
cHJ1bmUgKGFnYWluKSBsZCB3YXJuaW5nIGFib3V0IG1pc21hdGNoZWQNCj4gd2NoYXJfdCBzaXpl
cw0KPiANCj4gVGhlIG5hbWUgY2hhbmdlIChzdHViLmMgLT4gY29tbW9uLXN0dWIuYykgcmVuZGVy
ZWQgdGhlIGVhcmxpZXINCj4gd29ya2Fyb3VuZCAoY29tbWl0IGE0ZDRjNTQxZjU4YiBbInhlbi9h
cm0zMjogYXZvaWQgRUZJIHN0dWIgd2NoYXJfdCBzaXplDQo+IGxpbmtlciB3YXJuaW5nIl0pIGlu
ZWZmZWN0dWFsLg0KPiANCj4gRml4ZXM6IGJmZDNlOTk0NWQxYiAoImJ1aWxkOiBmaXggeDg2IG91
dC1vZi10cmVlIGJ1aWxkIHdpdGhvdXQgRUZJIikNCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxI
ZW5yeS5XYW5nQGFybS5jb20+DQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCg==

