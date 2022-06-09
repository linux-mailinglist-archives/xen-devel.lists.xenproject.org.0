Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97DB54437A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 07:59:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344639.570191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzBC8-0002EY-KN; Thu, 09 Jun 2022 05:59:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344639.570191; Thu, 09 Jun 2022 05:59:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzBC8-0002C7-HA; Thu, 09 Jun 2022 05:59:00 +0000
Received: by outflank-mailman (input) for mailman id 344639;
 Thu, 09 Jun 2022 05:58:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jl5s=WQ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nzBC7-0002Bx-34
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 05:58:59 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0626.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40431253-e7b9-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 07:58:58 +0200 (CEST)
Received: from DB6PR0601CA0007.eurprd06.prod.outlook.com (2603:10a6:4:7b::17)
 by AM6PR08MB4641.eurprd08.prod.outlook.com (2603:10a6:20b:d1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Thu, 9 Jun
 2022 05:58:52 +0000
Received: from DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::ed) by DB6PR0601CA0007.outlook.office365.com
 (2603:10a6:4:7b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12 via Frontend
 Transport; Thu, 9 Jun 2022 05:58:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT044.mail.protection.outlook.com (100.127.142.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Thu, 9 Jun 2022 05:58:52 +0000
Received: ("Tessian outbound 4ab5a053767b:v120");
 Thu, 09 Jun 2022 05:58:52 +0000
Received: from b6fed9fb339c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F22561D-E5E6-4725-90F3-B2351FC55E9A.1; 
 Thu, 09 Jun 2022 05:58:46 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6fed9fb339c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Jun 2022 05:58:46 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7)
 by AM9PR08MB6673.eurprd08.prod.outlook.com (2603:10a6:20b:307::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.11; Thu, 9 Jun
 2022 05:58:44 +0000
Received: from DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8]) by DU2PR08MB7325.eurprd08.prod.outlook.com
 ([fe80::50e5:8757:6643:77f8%7]) with mapi id 15.20.5332.012; Thu, 9 Jun 2022
 05:58:44 +0000
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
X-Inumbo-ID: 40431253-e7b9-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UxSWc5Sil4Y7AsYsmph20zaW1fk9R5dKnSbmZjyGqMVAsD7g6t9chzKpk7SdKKnnlyA6IcHd5r5NdbnzOK/i+mmUEg2/EIxfUOtQ96+EPgzu2KfmPq2medsoKUEPZ4k7E8e4YWwIweCDJ77oHoy/gXLo1G2GqoWzjcKjMxFpX9rFFRPUYJjpwMrr9L/so920QjeUTL9YLf+1795o/HxA9v9kCidN7xAGfQYKon1gEr+HTLF8HW72YD/ft7Pmq1eVE3vtBzG40vns+XGKQLRaZ6+m4Ty0zmpYbDsWfmAW7l9yTFhnFgqbrPKuEsuoK+2QpAIA1ZLWKUnous6t5fEchQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWAEh1+OLJV9Xdv58lHsoPOV4yHsCh0rjQy+NPOPoOs=;
 b=AskxFymftaOyRu1BaCFTFHkSE8dn0XFrwmDLhPNdUQIws1XV4uWom9lk/bnnUvT/nlcpcvRgK4BeAocrGrEKMQg52SpgYKRD2gpF0zD27m71EtI5rC5iKE0Dchls7rSSqwIb+edaaR+WMcTlspmcmxhTlcQTtynD1QfH/v40OwAUOpT9y7GS3NzJcO5lCPfhInPnhCrXW6iMX/3Oj5ywEOTdIhBgN8Yj+G43R9ixfnyxCudeJA5VgRZchWsim5rHqklrLXP+B63sjqzFz5dsjSPxSFc9vQfeX+0VG0qzx8P/uwM6F7LQVc/Yvlx9lJNMpM8ftY16ctXF16LxYe4M9g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWAEh1+OLJV9Xdv58lHsoPOV4yHsCh0rjQy+NPOPoOs=;
 b=yfaISNp+PmNoSIFIwwd41LfjGOQcdS6vNzcDYZB7ssJr+3nawEKrQxyGg0Cxah/gm6oABBCNcM10Yd+LWEqq35BtSVI5PDycbXN2Ry5BiSB6f2NQSLCTB4mgEFWv5anN2tOyQItmMUn4hUgcYwczXdQSwbx6GfwG6TkMrht6Sfs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IysKou5d/5XJzVm2vbpBvFdsC8iGAlUg0T/Et+Eu3Be/7o/4edW3HFRLUrFv2AbkOfktcsoJIA6FCXaCUFjOu71Gwn0ObYm5FeUmIXcdpyCbzbnVoiSvO7w4b9+NQFHZN5AvikzbXyyQWepQAqgGPrbpdMU+XJeNPkXhhHLJHmbWkBfWsLEmWYxiQaRKQTbPFrPaRBx1sDG4fLOUJ0xSZXfQlRhySszB4j1Jux+NVOdP7+dnkmI4frv89F6sGd13VekIvPJ5uJXPVLvh2bnohOWKK8/xpQnl5uhriQZS/giD/fw2LQ0bs0yvJwjeyINrVflaw+dopJfzbwckWYJEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWAEh1+OLJV9Xdv58lHsoPOV4yHsCh0rjQy+NPOPoOs=;
 b=UsPh3IwKrl8OJRJYuo4N/YF7YbnHcxrhshRgZYTgAIZIR2YICrLCA1FBr2DvRgNR0vlJ9n9fAow7uqhrtTCyWYck7KyMLsN+3DB31Cn2WHyaCv4F/asWvfGndmHQPgH0UwMHtSHvFNT8tL2lGsgJ0uN+f7Q9E77zfjE0gquUMUcm0RraxpqvPv8+unwq6iakxnBL3TUbI6Ex3P6ey7fBzdBKdX+8f9jfNXp8/+ocKp8cZaP1u05CMNXQLmw2Zr17xCX1ZerGXwWw+bp7HGRRg5NnMesHkMWBO/hwD9zImd1iQKjtLMt+jcWSPy1h4v0pG3Oj1jZXf+zu/gzI+dSnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWAEh1+OLJV9Xdv58lHsoPOV4yHsCh0rjQy+NPOPoOs=;
 b=yfaISNp+PmNoSIFIwwd41LfjGOQcdS6vNzcDYZB7ssJr+3nawEKrQxyGg0Cxah/gm6oABBCNcM10Yd+LWEqq35BtSVI5PDycbXN2Ry5BiSB6f2NQSLCTB4mgEFWv5anN2tOyQItmMUn4hUgcYwczXdQSwbx6GfwG6TkMrht6Sfs=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 9/9] xen: retrieve reserved pages on populate_physmap
Thread-Topic: [PATCH v6 9/9] xen: retrieve reserved pages on populate_physmap
Thread-Index: AQHYekCd/J/B/CFgukmRW4QioUnzda1DlC2AgAMCXbA=
Date: Thu, 9 Jun 2022 05:58:44 +0000
Message-ID:
 <DU2PR08MB7325F42617DF4F6B36D1E777F7A79@DU2PR08MB7325.eurprd08.prod.outlook.com>
References: <20220607073031.722174-1-Penny.Zheng@arm.com>
 <20220607073031.722174-10-Penny.Zheng@arm.com>
 <c0dd7fcf-28b5-d206-701c-8c3e62597eb6@suse.com>
In-Reply-To: <c0dd7fcf-28b5-d206-701c-8c3e62597eb6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: AF0C719B3786A64C955C9D9DCAE50B04.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 892b37f3-e882-40af-4918-08da49dd21a2
x-ms-traffictypediagnostic:
	AM9PR08MB6673:EE_|DBAEUR03FT044:EE_|AM6PR08MB4641:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB464162ACD60F9E19C6DB1323F7A79@AM6PR08MB4641.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0MHFjwYA2ZhrCgQ29Pf53WAWcib/x7bshB9t02ar7nKd08hnKIdBPyXzWgjNLlWW9/cuttbuKuFV6G3mSSwBhTPd235XMSFoPWpH3t+2TKLSoI/gioT3cACphO5ZpWmg9AmmOOn7V/xWw/SuM+gugNXJOKc/OaWnbcJX1vvbEfdHM7MoaU0cX8Lsu+R4s28qEqsWiiwBFgZc0A7hoD4dO+LLBq1v9dMsqnIpo7P17yXLj25LnURag05D0yKeiAkleztQGWLQdg7bB2mQkfrPtLMgaoS2L7bKPuqDa8k458OV4NqRRusKBPkHLCxiYvPJx2FcCgJQ5yMexNCOHttxA1xT8A5GN6Ew9hWK09Zjiu8nbU0abXej7Oq6j6PgG9oeFIeiZNGzkVzouGNF5SP181tfs5R4xDYimwburoq93biAQeXONXujpQk3WAzcjScWrOKEUSOf0Ch/BwFfZombQwJmjq5y6IUYwHnxB/wPPbWPy1HNQw6s67y1pMUTA99MJ+3SpzlSIA+5kLVRpqcMOE6exMHW0v0y4CwssdTMyVE1ZelYODNrwY4J2YsBxZQ+GM5/9dh9cUvHW7v7WRSBKK7HiQx7iaXWDU/ghb07p1EKMl2Fi3nz1fHtMbp+/tOJoVDhfBnAfdtyG6vOLflbmiKAj1pTWGCPnNTp8JM8QwQW3UxLZRVqpg8Wr5kIGTiuGt/Qp88NeQd7r5PCdp604Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7325.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(7696005)(26005)(4326008)(186003)(71200400001)(9686003)(76116006)(66946007)(64756008)(86362001)(53546011)(8676002)(66476007)(66446008)(66556008)(55016003)(508600001)(5660300002)(122000001)(83380400001)(2906002)(38070700005)(52536014)(8936002)(316002)(54906003)(38100700002)(6916009)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6673
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	170cfa42-278f-48dd-ebd7-08da49dd1cc0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k32ZWnfp9mzcfBl55k7QHBas4KdtkOWU5/Bxluvjdn/VkZ1hsMTh5IN79xlm4Cqh7dFPI4CH9ignqUZ5qxXxHw7fPPi6GY6UYtbZxBm2c4827lmnku90mPA/0siDDptZqn4zqpOWsLiuU3lam/K3qV8zvt9L61v2x2vPptL2o0nqvs8t37RCkxRnWDHhbVw/Rx28Ij/bbGAJQrHUWFPZTsCkBitZV7+Ehx0MyaBJ3Mloi3imCdJjX6UpgpuhkxNk3DExugu3bQ7vNLoUKPFj4tTXX9zGilY8aHa9JgCyPhTSjwb/jA69a9z8t5Y7btyVZsPeIAyEcED9+/SQZCpWpdoQQ8MswDhSjYzua6a3RurEorlgktTO7K0Sy+ZNKcjZbsmVN9TvZc3lC50XxJon3Hp1IcVhBtdSGYFPEcm8HZF/5sMPBdk9LqloQo/Vuo21fvwFhIRj9jiE0UctPGXan43gyaimcW6XtIcpfjHnk3cIMKPnRo0aqSEY/12CQ/qHs5yC0BHeOCbn1cQoTBfnlw44uWRrZdvVQtssbR9WYVZQHWsQ8v3R7+AR0sImeHn4/nHCYubzLTrAzh1+c4BCd60XFwUVuTioj9knwbMAsdEwjnj2IqHvTQuvIseKgb4JTfBiHhYPj6LAuGsSezPKWUfdd/Ka9fUDme2RYKOU/XuJ73Qjhs1lsmQkKNk1h79L
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(83380400001)(81166007)(8676002)(4326008)(54906003)(86362001)(316002)(356005)(55016003)(70206006)(70586007)(82310400005)(36860700001)(336012)(2906002)(186003)(47076005)(508600001)(8936002)(5660300002)(52536014)(6862004)(7696005)(6506007)(53546011)(40460700003)(26005)(33656002)(9686003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 05:58:52.7230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 892b37f3-e882-40af-4918-08da49dd21a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4641

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKdW5lIDcsIDIwMjIgMzo1
OCBQTQ0KPiBUbzogUGVubnkgWmhlbmcgPFBlbm55LlpoZW5nQGFybS5jb20+DQo+IENjOiBXZWkg
Q2hlbiA8V2VpLkNoZW5AYXJtLmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0K
PiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgV2VpDQo+IExpdSA8d2xAeGVuLm9yZz47IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDkvOV0geGVuOiBy
ZXRyaWV2ZSByZXNlcnZlZCBwYWdlcyBvbiBwb3B1bGF0ZV9waHlzbWFwDQo+IA0KPiBPbiAwNy4w
Ni4yMDIyIDA5OjMwLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPiArLyoNCj4gPiArICogQWNxdWly
ZSBhIHBhZ2UgZnJvbSByZXNlcnZlZCBwYWdlIGxpc3QocmVzdl9wYWdlX2xpc3QpLCB3aGVuDQo+
ID4gK3BvcHVsYXRpbmcNCj4gPiArICogbWVtb3J5IGZvciBzdGF0aWMgZG9tYWluIG9uIHJ1bnRp
bWUuDQo+ID4gKyAqLw0KPiA+ICttZm5fdCBhY3F1aXJlX3Jlc2VydmVkX3BhZ2Uoc3RydWN0IGRv
bWFpbiAqZCwgdW5zaWduZWQgaW50IG1lbWZsYWdzKQ0KPiA+ICt7DQo+ID4gKyAgICBzdHJ1Y3Qg
cGFnZV9pbmZvICpwYWdlOw0KPiA+ICsNCj4gPiArICAgIHNwaW5fbG9jaygmZC0+cGFnZV9hbGxv
Y19sb2NrKTsNCj4gPiArICAgIC8qIEFjcXVpcmUgYSBwYWdlIGZyb20gcmVzZXJ2ZWQgcGFnZSBs
aXN0KHJlc3ZfcGFnZV9saXN0KS4gKi8NCj4gPiArICAgIHBhZ2UgPSBwYWdlX2xpc3RfcmVtb3Zl
X2hlYWQoJmQtPnJlc3ZfcGFnZV9saXN0KTsNCj4gPiArICAgIHNwaW5fdW5sb2NrKCZkLT5wYWdl
X2FsbG9jX2xvY2spOw0KPiANCj4gV2l0aCBwYWdlIHJlbW92YWwgZG9uZSB1bmRlciBsb2NrLCAu
Li4NCj4gDQo+ID4gKyAgICBpZiAoIHVubGlrZWx5KCFwYWdlKSApDQo+ID4gKyAgICAgICAgcmV0
dXJuIElOVkFMSURfTUZOOw0KPiA+ICsNCj4gPiArICAgIGlmICggIXByZXBhcmVfc3RhdGljbWVt
X3BhZ2VzKHBhZ2UsIDEsIG1lbWZsYWdzKSApDQo+ID4gKyAgICAgICAgZ290byBmYWlsOw0KPiA+
ICsNCj4gPiArICAgIGlmICggYXNzaWduX2RvbXN0YXRpY19wYWdlcyhkLCBwYWdlLCAxLCBtZW1m
bGFncykgKQ0KPiA+ICsgICAgICAgIGdvdG8gZmFpbDsNCj4gPiArDQo+ID4gKyAgICByZXR1cm4g
cGFnZV90b19tZm4ocGFnZSk7DQo+ID4gKw0KPiA+ICsgZmFpbDoNCj4gPiArICAgIHBhZ2VfbGlz
dF9hZGRfdGFpbChwYWdlLCAmZC0+cmVzdl9wYWdlX2xpc3QpOw0KPiA+ICsgICAgcmV0dXJuIElO
VkFMSURfTUZOOw0KPiANCj4gLi4uIGRvZXNuJ3QgcmUtYWRkaW5nIHRoZSBwYWdlIHRvIHRoZSBs
aXN0IGFsc28gbmVlZCB0byBiZSBkb25lIHdpdGggdGhlIGxvY2sNCj4gaGVsZD8NCg0KVHJ1ZSwg
U29ycnkgYWJvdXQgdGhhdC4NCkxpa2UgSSBzYWlkIGluIGFub3RoZXIgdGhyZWFkIHdpdGggSnVs
aWVuLCBJJ2xsIGFkZCB0aGUgbWlzc2luZyBoYWxmIHBhcnQNCiINCkZvciBmcmVlaW5nIHBhcnQs
IEkgc2hhbGwgZ2V0IHRoZSBsb2NrIGF0IGFyY2hfZnJlZV9oZWFwX3BhZ2UoKSwNCndoZXJlIHdl
IGluc2VydCB0aGUgcGFnZSB0byB0aGUgcnN2X3BhZ2VfbGlzdCwgYW5kIHJlbGVhc2UgdGhlIGxv
Y2sgYXQgdGhlIGVuZCBvZg0KdGhlIGZyZWVfc3RhdGljbWVtX3BhZ2UNCiINCg0KPiANCj4gSmFu
DQoNCg==

