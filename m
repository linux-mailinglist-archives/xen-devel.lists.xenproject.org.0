Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7211C5182C2
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 12:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319468.539716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqCn-0004ud-TZ; Tue, 03 May 2022 10:56:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319468.539716; Tue, 03 May 2022 10:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlqCn-0004sI-Pu; Tue, 03 May 2022 10:56:33 +0000
Received: by outflank-mailman (input) for mailman id 319468;
 Tue, 03 May 2022 10:56:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f3B0=VL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nlqCl-0004sC-UU
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 10:56:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af256557-cacf-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 12:56:29 +0200 (CEST)
Received: from DB8PR06CA0042.eurprd06.prod.outlook.com (2603:10a6:10:120::16)
 by PR2PR08MB4857.eurprd08.prod.outlook.com (2603:10a6:101:1c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Tue, 3 May
 2022 10:56:27 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::22) by DB8PR06CA0042.outlook.office365.com
 (2603:10a6:10:120::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Tue, 3 May 2022 10:56:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 10:56:27 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Tue, 03 May 2022 10:56:27 +0000
Received: from 9917ff95df96.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7840B239-B704-4DDE-80AB-B2530EF158BC.1; 
 Tue, 03 May 2022 10:56:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9917ff95df96.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 03 May 2022 10:56:15 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by PAXPR08MB6638.eurprd08.prod.outlook.com (2603:10a6:102:df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 10:56:14 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::c9b3:a7d5:f4ee:8c40%5]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 10:56:13 +0000
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
X-Inumbo-ID: af256557-cacf-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mCQ8DFYPuOVeF87G3NpQjrx5juH8TgTDojf66j3sHQqkHpHKa2Uu+8wIQOF4/h45joQ2ZyiNZj2QqNfJkpvL2KlLBTPyDNbL+bkrVUXdn7p6A4133IQP1tuFXTNy+zmWl/IZO+Ppl6AXTLeooXKqAmzbx4aHdsJLIz8ANx6aekDDu5SHrLEqHyt41ZauStLNGRq5AJd95Lq6MIl1p6pgtpFE3JQ8lT+5LOzSUm6+IOLQBtXOODKAKWoFmYiKsRfhk5jGdAJsbT11zHbghtUGcDXXHXg9y+EpJt9Wa+o/QFwF08KdAzvVmwr6DK5CYxcKiZxhcOPtkuE/CpCSLdeByQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkSfPy6w4X5rzEA4+t/N/FsrgPhYgvR9diesA20FcxQ=;
 b=SFZDdeWKbl0hFem9GODEyHJTKR2ZprU1+yTC1YWHxUEcbZrLBHaJMoIXuAXZzzQip6bpL9Qqk3IHL6huDsYHjD6VX0VIIkCJ/bxe6JVPrQ8NJ6o6ywRjn96SApawxz5ExPDVNp1tkc8n3xNPJah28xSpkPYW+vtofq2k022SOCeQdWuQvnGsnr4r1tLGXVqr82BMDJJCJQ7GsBDnhSzrLjaPGUGL0JUO3zJc2SNFCzkGnDUyNtBwj/nqBDDKwClvEMpjHn6rjtvDlEGDX+oGCcWy49H77liCy40Xw144QORswCccMrKJzFWLegaJmCBcWqmF0sJn5qa9DDl3B4vJbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkSfPy6w4X5rzEA4+t/N/FsrgPhYgvR9diesA20FcxQ=;
 b=bc7yRA4Q1VBCPxr+oTPS6dGGy3R6nToU2g1USV2XDnhN+alzEvkMs8ZwMm0kZ6t00JWfBiJHX6plWTrwFvRtzN8XFSHzFb1dCtfx7QIWNqbNuqzIp/xPSC73ZBBMMqf94xeWIwkpPjlVqJwGIXPHsmGYi0t5fUjNRy6lbR9giUQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a3320a4d6c9ca40f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UAwyACyp8jqevKdu2awSpF9Z+A9iv/lXa+Q2xRgqT7O9NRD98YH+3VwPdwXb4PlHdkNci0qTcKCogcY/ApeZorQY8SOiN9Lw8P5dLh7Y1D03N+ukrHpa0ffBAQHdRxTA1rPPCYgap1OrSN9bCTbooYgTQg9KZZzN5s5112d6D7iZp9OONC5wIb9kobRcNPVb5m9MWg53jCrS2Q1ED9meLMJh9gcXwk9w68OMWueJuSL2/8Aj9Zwgy6m6XwiZqk+IHCxslhaPwl/UyOsyL7Mv8jRQmfYENpc0GJngTXD2E03iuolXo1QNFXsv9WaMVsCti5QhCDrWHAb+xNrbK1ZT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkSfPy6w4X5rzEA4+t/N/FsrgPhYgvR9diesA20FcxQ=;
 b=cfZxPR37qP7MM8QYmqpj+k3PQOF9/taO1V4/opIlF916NaHlGvaytsGbvlRSgHvrpt31FHxv6XQUPaRNKdyQmJXoNeOqwD15ilCdNL6ReibPQkXUIInT0izUcn/VElTjH7og/4kYYVV7f/xcViSw2tS0em/k9FWPenfAWLghqQ4p2BChkKM12eR6+0hMLNO/dtPIQ+W/c1T5wgmDEudhI56YHQrrNQ/BbcumrpmUYCMk2su2RwFH6xDE6CDs7tiXI/EhIOpT3HhWJKUXW3y9lfIaOjvjXNpNgU4R+g2it87GaKPnT5yDGBvkQZRGfOpokVEAPVwdNCryt2DM2gVBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkSfPy6w4X5rzEA4+t/N/FsrgPhYgvR9diesA20FcxQ=;
 b=bc7yRA4Q1VBCPxr+oTPS6dGGy3R6nToU2g1USV2XDnhN+alzEvkMs8ZwMm0kZ6t00JWfBiJHX6plWTrwFvRtzN8XFSHzFb1dCtfx7QIWNqbNuqzIp/xPSC73ZBBMMqf94xeWIwkpPjlVqJwGIXPHsmGYi0t5fUjNRy6lbR9giUQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, "jgross@suse.com"
	<jgross@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v5 7/7] docs: document dom0less + PV drivers
Thread-Topic: [PATCH v5 7/7] docs: document dom0less + PV drivers
Thread-Index: AQHYXAvORBZMXv5aPUSsbnB/Fi2OYK0M+vkAgAAFvoA=
Date: Tue, 3 May 2022 10:56:13 +0000
Message-ID: <61359FAA-56EA-4F05-BFCA-F56C66C6FB85@arm.com>
References:
 <alpine.DEB.2.22.394.2204291354050.1947187@ubuntu-linux-20-04-desktop>
 <20220429205732.2030094-7-sstabellini@kernel.org>
 <3072B061-DFB3-4D43-90F4-9964C648B96A@arm.com>
In-Reply-To: <3072B061-DFB3-4D43-90F4-9964C648B96A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: de9e5825-4614-47d2-0482-08da2cf39280
x-ms-traffictypediagnostic:
	PAXPR08MB6638:EE_|DB5EUR03FT025:EE_|PR2PR08MB4857:EE_
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB4857EFE9A07CF23B7011D635E4C09@PR2PR08MB4857.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ZPiKd+cW3wQvk127oYxmMrT28cCCBJhUR3LEspc0GuK8ocxQHLuPyXF6ANFaL5mpDtJl8CRvx7TQx0eao9FUV2AEo0L4Ovrp8vC43TZ4NzaMdjlXHvXsp2MoIXAhbsaNLGOzuIfp7eiBP8XZOx+ac6X1iPtTLOimtdGse+QMDU0ttPZraI7EnhuUvIUB19s9BBhl/sXMUIbKjt4FCIQBhMOaMoAMkSgM9FQURexWbZyAC5AbLuUhe/Trfo4PxcnSZehyRAeXUgX0MG8+2toOaabMjBC0peXyQnI6fKAxerSiTw5pyqbJ8BJJduOhIvLe5+SDDCstilCGNgFAObXb9yY6Qty/lsolr0RSBHgu2R61InUXJ6N/np631C0v7TCzjWJdT4FA2Fda3wD5Eh1OBuH9lPQ/FmgP2YW2sAJCvfMMBoby6nS9fdP79P7vIiFxxTHMq0PiegNafGE2MnWogzkb6tglcpy8Je2INagjeQ+848713S7UeRivrnc42NFGKCCIm52LTVBgKsiZmqwvX3jZwedjL9NnqUTC3KWnfXpYvt+vAW/FXt2yBwIUkwoP0IdOGLqtlqRLM+Ubn1UQ0feKAP5KNDBRX/olxQIG/1lI2b1o0igGB8xaZEjqEHic69HWdqAXAe73urorPN313KVxEf2Rb0HTLCg8l63PUGa/7UStQwdMWkTfM0AGrLwpgOZBOn0dj3/Hh5JCWUbOx5Cv5aChhweV1ak0ouwnJX0mm+6UqU9hIhCe8u1ZNI7R22y/bop3qOSrQFeIlkDpeA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66556008)(66946007)(66446008)(26005)(64756008)(66476007)(76116006)(53546011)(8676002)(186003)(4326008)(4744005)(71200400001)(36756003)(6512007)(6506007)(86362001)(6486002)(316002)(38070700005)(122000001)(8936002)(2616005)(6916009)(508600001)(54906003)(38100700002)(5660300002)(33656002)(2906002)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF2605E2CDFB2547A83440FE0B83F27C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6638
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67f0c01a-7436-45c9-68fb-08da2cf38a89
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LS2H0nl+fx5vbeApANbkqAgOeZs1rUMvigR67KVWqqiQFoKkt/9uS5nUZtQgpV/CG2lErgS3tjr/mUm7wEMWNFph7qf1f7E0FTc+HeUUvHb/6UNGvHxZjTdDzvO7K1g9PgHRzKgECLBaRCgq36jTT4V16iG+nQlnkvpDT/8UMdugE7IvTm33f+fs4AQikfB/WPOYt2QY0CpInCYOGqbXK7nnodHNnm7kp6uCCUZyqzff/gxO097K1WtZF8TC2WPnMpiVjdCGfpHesVmdbw1aa7voGUjgSemfouHlwbP1MfDIXeN5/3td0Y7o3cxVNleGm1pSmBw4hhPuF87bTWLwwFIMYUBMsGf8EUZ2GS22Ra1gvodoSrAGatZMC6USZZFV2RvVR3v35i2FHWb0s++aFH4hHTSUkI05GAGMnbgYOqQIvfxztZ94nsnCJ4nHndDd9gf+pIBNvaJEq04Qw48mr1zTgvLXQ47ctoxjH/Owvy3chWhHNCRbXwPQtsT5jwO9GtKVgGWO6r7YKSjUZSa+ogUNSjkvVK+pGM7IYfEkeSKcYpo9LL3ZeD2gx4o65RWPyUwVxIF2IOZZdN/3Qf8j4A6JAtDuYfXrfi8ZGfiPFxz8uFeoe7UbcqpJjtmm3yop0qEkOoH/mEhDxf9VuGc5+OcGdQNEnSQnmcLJF9Niyb27sZHBsU4svY8EsCzyaY6bzlqpFn7wkk58G+I6jfLvQA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(8676002)(2906002)(356005)(186003)(70206006)(70586007)(8936002)(81166007)(6862004)(86362001)(82310400005)(107886003)(508600001)(4744005)(2616005)(40460700003)(26005)(6512007)(54906003)(33656002)(47076005)(336012)(53546011)(36860700001)(6506007)(36756003)(316002)(6486002)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 10:56:27.2728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de9e5825-4614-47d2-0482-08da2cf39280
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4857



> On 3 May 2022, at 11:35, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
>=20
>=20
>> On 29 Apr 2022, at 21:57, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>=20
>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>=20
>> Document how to use the feature and how the implementation works.
>>=20
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> Reviewed-by Luca Fancellu <luca.fancellu@arm.com>
>=20

Ops, sorry, typo:

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



