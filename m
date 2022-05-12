Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2C2524CFB
	for <lists+xen-devel@lfdr.de>; Thu, 12 May 2022 14:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327635.550460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np81X-00031z-KX; Thu, 12 May 2022 12:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327635.550460; Thu, 12 May 2022 12:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1np81X-0002yV-HS; Thu, 12 May 2022 12:34:31 +0000
Received: by outflank-mailman (input) for mailman id 327635;
 Thu, 12 May 2022 12:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U0YA=VU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1np81V-0002yP-Kg
 for xen-devel@lists.xenproject.org; Thu, 12 May 2022 12:34:29 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcd94585-d1ef-11ec-8fc4-03012f2f19d4;
 Thu, 12 May 2022 14:34:27 +0200 (CEST)
Received: from AM7PR03CA0018.eurprd03.prod.outlook.com (2603:10a6:20b:130::28)
 by AM6PR08MB4135.eurprd08.prod.outlook.com (2603:10a6:20b:a9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Thu, 12 May
 2022 12:34:25 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::1c) by AM7PR03CA0018.outlook.office365.com
 (2603:10a6:20b:130::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14 via Frontend
 Transport; Thu, 12 May 2022 12:34:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 12:34:24 +0000
Received: ("Tessian outbound 9a0893f586e2:v119");
 Thu, 12 May 2022 12:34:24 +0000
Received: from 20e722909153.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5DFB9C95-105D-43D8-A3C5-D9BDBD27C99F.1; 
 Thu, 12 May 2022 12:34:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 20e722909153.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 May 2022 12:34:18 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM4PR0802MB2354.eurprd08.prod.outlook.com (2603:10a6:200:64::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Thu, 12 May
 2022 12:34:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5227.023; Thu, 12 May 2022
 12:34:16 +0000
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
X-Inumbo-ID: dcd94585-d1ef-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZO+oHt/giriSoPGBPV9OP3ab+1Is/bKiIgOuiRC6FMaTXDwNP2SenyW+3VqRB5+AV11goM3FjTaR90zEXzOzf6KQDGyXIjYO7Jd7tql45XmvuYhx/c7AirrEmnOjwJrkSkl5XMvbGnyCc26DHnTyAnMK5Rh4ZnEy9xZ+XZ31pF94T7rDdiW+LOxpEd8FBDICypXQF0fOxcPxPMcm/BcvNe9/l3EaUlV1Qplxb9rUW10/kWLy+E3DXYDHVP9iRiTQGi+IB/Km+dvhthksltdDs8X4oJiYkPKC6FlvwwBhW/pwteTiR12um2s2vBB8fJY7tuV0Pk21deodVSBvGFHQJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2Q/38xcpv8UQaVzBlDUMVAfUbm9EH+bnJFJB7hp5TQ=;
 b=l7HvUIHWNmaH4oa7Zh3tn6jloNUDO5VPUQQ7leyTpMHuPTj/19Q5cRARsjCxykA1SGwdPkl0Ni1DACmbANhOgSxXEOmo+vnRkBEEzp1WWa/jivvBp53BRbXdvBc7RTLe3DCZ0QLP9yvjU05uPeg49cmR854Lxso0UrE/FC5XCFMPGN0ym61atYPXMcXQ1WO97gsNEt/nHwprMDf7IRvkW49HIxVovBVvOwhNE5GqRCfDor6r1J2hh5BUdPTrnduzEPQLZOSEnAcEqh9Ft7RPTDJCL9ez46gODfwrxvj17d+gLh0QHP9ONF/SgVzBV0pRshLnyEwtoHbsHBJcHqowTw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2Q/38xcpv8UQaVzBlDUMVAfUbm9EH+bnJFJB7hp5TQ=;
 b=MkYFTyHBBxQuQ69Z68E1NmXpUBLHat8JQ5hvAhrUsgCUANJfNZXf5GjrNSjrxokpCRM8SCpIlwAgI8KlJoPpe/H4VB7JnlPvcUDzwsr4TQ/rUGmoweYfUGZ0qzPpN63cUWS0cNDmiahxdyrrUW/USkFR/TijDRyEpnEhM5YC5zI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7047d2a2adeb6d72
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXwD+lfVHWF7nHPhyMcJd+739k6umkDmNvpWhkS3ZeFmtdxFd4eN6O39TnebyB6cRotnY/Y1jI6dNuK83Eau66nzqLQuEMpeHt1Ee9HZNNtSXG8A4f8ocU6uQFLatSoulJlMsEkeQRYnJcAqW6LEYryhY9cipkq1C6IJWRu+4O1jcbyYrM9Sdkev7LylPVmyAyzE3e/S5NvIeEmflzoNsTx0006hNNY2krX01e1xvSr40/n9Nqv9iNf0RHGrRub/t4bu1aV3qO/qJFzQMQrF6j0FvFsqowbU0Hq2yFrXSl+ofrX6ZzlrvqdMsai5LdcookUKM/FBr6C/r3JlZPU/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2Q/38xcpv8UQaVzBlDUMVAfUbm9EH+bnJFJB7hp5TQ=;
 b=hD9GVjwGOo7bNw0BMMnDDCq/9WuxQhbKBB8hwLGPSgvtAPzVx6vR106HbR2uHJqKe/CuJcH3vT9GTE7d41x8pqCnCE4DDElu4Lx58FkL0jTkSE6kRlaYEnlSq2FWuZBZhL7kr6PcnjtrYkrzq9feMdrrrTiAcbpdZwXstItIjIlXHKlK/nTuE9KzzHS2/bh6BY2MZL7QPELrYHbdjA4eUuHps3bV4ho8Tk9Q0racDs6cKB3lCchXgkCD78GVbXTVHgm3/ypbc729peHTGKAjMO/H1hc1vSoQC6tT+FtXdKw6CrPKrJ6s4DfgMCnnrZvMQbgRKY4Uy6UJ4KUpZ5RUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2Q/38xcpv8UQaVzBlDUMVAfUbm9EH+bnJFJB7hp5TQ=;
 b=MkYFTyHBBxQuQ69Z68E1NmXpUBLHat8JQ5hvAhrUsgCUANJfNZXf5GjrNSjrxokpCRM8SCpIlwAgI8KlJoPpe/H4VB7JnlPvcUDzwsr4TQ/rUGmoweYfUGZ0qzPpN63cUWS0cNDmiahxdyrrUW/USkFR/TijDRyEpnEhM5YC5zI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
Thread-Topic: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux
 5.18-rc3
Thread-Index:
 AQHYXtGhqgeBKorGIE+S3ZHm07cmGK0Nc+GAgADisYCAAAtXAIAAGQ0AgAAhcYCACMpfgIACZduAgAALAICAAAXAAIAAShgAgAEUEoA=
Date: Thu, 12 May 2022 12:34:16 +0000
Message-ID: <D170A7FA-3BEB-4B78-A27B-AEF4BD51EE21@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
 <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org>
 <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com>
 <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org>
 <alpine.DEB.2.22.394.2205091857230.43560@ubuntu-linux-20-04-desktop>
 <BCE017C4-53AA-4918-AEBD-D3CCEF0913F4@arm.com>
 <19a140a9-f8a3-79d6-54fa-a873dab6ff42@xen.org>
 <F60293D4-0A44-4365-939E-5C1A80D7A159@arm.com>
 <alpine.DEB.2.22.394.2205111247030.43560@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2205111247030.43560@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: fd830f96-dd38-4749-b85c-08da3413bf63
x-ms-traffictypediagnostic:
	AM4PR0802MB2354:EE_|AM5EUR03FT009:EE_|AM6PR08MB4135:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4135D66A9A991BB1E2DE11F89DCB9@AM6PR08MB4135.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0boLfDxxaE/8Mn7ZClofKuRYIszBoMsLKXgA2sTONb9vK0iy2mutVs5o3qOb8Lp5H3uuDZthBd6E/HxBMpJBEScY0JN5BCiWbH/cPkym1yI3k9GWW4jVLsvDrzxRdpFuP/53/YxYPbmdwx47W9F5MRx5MbGLA1/AgT/+dN1AoT4+icom8ooGxkZFzKBl8ezbYd4kPlXnxmXgr+Xqz/A1kLZOdOWc9X7x2Imuo28Uuc+NNlMILkV+apupTun5ks7aTNtpOSmZfoomeHz1KjcT0S7C2E4xOMY/GcmQ2rnV5YrgYb0K1SDpXgr/fcC0MjDj+doQywMM+eEBFe6f0/6NtV98G44/+TBJL9hleh/a6AgmvDWXSj8cxLdPsvkaDkruvgBtwRBJpHdru8Ji577bySP3v86p7Nf1AyLZuD++WQyCugqKOyZVBoLq38FDMLYWPkgjKKZFTdLi776RZn3+t4/SaP98RYpXPBbeeIEPPKjQTwtbWesuYHxAwqHf06tuSPv52S6F1sN4s+9NX4Sk3MaeMkFU3+uVYh3BBvvxkPnXWsWFTlLVumhpen4gZ10QcFdoH3cteX9BYm2iwO6XRDvs9SdrPqXSDpgYedUzUNGcT1GVMb/4j1gkBk6bhOAn5VOtS1QoGYf4lzW3S9Xmf+D1znDxHD3t0rtTmJkcxEyAaWNBDqCevyNRQCoN97tWly8+fz9zAeKNBmKGwG4u/2xOm0nYdfGYHPfmo0D/mnMJ7rU4I2NhAZMKMiEybdC7NJD3hpSjQ30IVZduGo2etxDLau4KotM98b5yqZnTG74iDDq/EJsoYT1ojEp5JGno
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(6916009)(66446008)(64756008)(66476007)(83380400001)(2616005)(76116006)(66556008)(508600001)(53546011)(33656002)(6486002)(966005)(6506007)(26005)(186003)(5660300002)(8936002)(122000001)(86362001)(38100700002)(6512007)(91956017)(2906002)(316002)(54906003)(4326008)(36756003)(8676002)(38070700005)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <51F2F2A74BCB344E99D17DC8D00F59CA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2354
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	31e31b2f-47a2-4fe8-ee7d-08da3413ba55
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CqMc7fvQnokzcr6VfzdGdbMr+J9+GYPdLP2nNW9YutUIFtQg9VWlXsGUrOBEoqD0s7hodV9TbivcRx6t8ZJTzpECT1bohr+82uzoYxA4685KU7WyNVyqCZbLkwPVYe77B1P5DsoGo/wQyBGMRuiJuDZZWQ0DTyBZl02ThqcgFRJTCapWCeZ0BRveAkiKjm4NTuSnM81PW9OcMbz30lKngvoC6Tx9020TlewCoF7Gx2OhQ2/Z2s1Db+KkhlsReridOLApvvX4O9mm7bNOfcFGtTQXvXGlqXXNUXPyv4mINd+VZ8UZaje6YGXz8WBM6rx5ZhsnN4iEAH60ubbtqSxBtY4YljMCV51Xoa7NQMHcuKsiLrwoDPPxgikEdZITwVT0caTE1uzOk7JmU84FSHb+UJT9dxkqLZZzAh+8meTG9GHn1glF2MsVBt34vXjy7nz5XUFV8gQrGrMTWdFXbqrsPECzUaePDTzDiLzckPkiCvb+KhHEIb0/dkMiAJyuUQpvZ16j2/zF4gEsOiAO2Gqhqz5sw8JT1o0vWoOv1psrjSZcLkRyo9M2Mz20h9CpddJMNT5KVebaJMFAX7E8DEyEpJkBV40td3kVNq5/mesyGsy2rBGQkgp8C6Jq0LPZCvvgQ78Uqfq2TeqLgBSra+rP5aoRmy9aqjA1F20VEwjO5U12iVlbGikLBgrV1hpANEs5OgX1J8hwmklrfuZDTTcylbWt8r+XcvidFda7XN/WFjchdMqBrsIbw9fez6KaeBAw
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(83380400001)(82310400005)(53546011)(6486002)(356005)(36756003)(81166007)(8936002)(33656002)(26005)(6512007)(2616005)(8676002)(70206006)(54906003)(70586007)(6862004)(4326008)(107886003)(316002)(336012)(966005)(36860700001)(47076005)(40460700003)(508600001)(2906002)(5660300002)(186003)(6506007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 12:34:24.5728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd830f96-dd38-4749-b85c-08da3413bf63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4135

SGkgU3RlZmFubywNCg0KPiBPbiAxMSBNYXkgMjAyMiwgYXQgMjE6MDYsIFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBXZWQsIDExIE1h
eSAyMDIyLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3RlOg0KPj4+IEkgdW5kZXJzdGFuZCB0aGUgcGF0
Y2ggaXMgYWxyZWFkeSB3cml0dGVuLCBzbyBJIHdhcyBPSyBpZiB5b3Ugc2ltcGx5IGxpc3Qgb2Yg
dGhlIGNvbW1pdHMgd2l0aCB0aGUgYXV0aG9ycy90YWdzIGZvciB0aGlzIHRpbWUuDQo+PiANCj4+
IEkgd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIHdoZXJlIHRoaXMgcmVxdWlyZW1lbnQgaXMgY29t
aW5nIGZyb20uDQo+PiANCj4+IEBHZW9yZ2U6IGlzIHRoZXJlIHNvbWUga2luZCBvZiBsZWdhbCBy
ZWFzb24gZm9yIHNvbWV0aGluZyBsaWtlIHRoYXQgPw0KPiANCj4gSSBhbSBub3QgR2VvcmdlIGJ1
dCBJJ2xsIGFuc3dlciB0aGUgbGVnYWwgcXVlc3Rpb24uIE91ciAibGVnYWwiIGRvY3VtZW50DQo+
IGlzIHRoZSBEQ086DQoNCkkgYWdyZWUgd2l0aCB5b3VyIGFuYWx5c2lzIGJ1dCBJIHN0aWxsIHRo
aW5rIHRoaXMgaXMgYW4gYXJlYSB3aGVyZSB3ZSB3b3VsZA0KbmVlZCB0aGUgY29uZmlybWF0aW9u
IGZyb20gR2VvcmdlLg0KDQo+IA0KPiBodHRwczovL2RldmVsb3BlcmNlcnRpZmljYXRlLm9yZy8N
Cj4gDQo+IFRoaXMgZmFsbHMgdW5kZXIgY2FzZSAoYik6DQo+IA0KPiAoYikgVGhlIGNvbnRyaWJ1
dGlvbiBpcyBiYXNlZCB1cG9uIHByZXZpb3VzIHdvcmsgdGhhdCwgdG8gdGhlIGJlc3QNCj4gICAg
b2YgbXkga25vd2xlZGdlLCBpcyBjb3ZlcmVkIHVuZGVyIGFuIGFwcHJvcHJpYXRlIG9wZW4gc291
cmNlDQo+ICAgIGxpY2Vuc2UgYW5kIEkgaGF2ZSB0aGUgcmlnaHQgdW5kZXIgdGhhdCBsaWNlbnNl
IHRvIHN1Ym1pdCB0aGF0DQo+ICAgIHdvcmsgd2l0aCBtb2RpZmljYXRpb25zLCB3aGV0aGVyIGNy
ZWF0ZWQgaW4gd2hvbGUgb3IgaW4gcGFydA0KPiAgICBieSBtZSwgdW5kZXIgdGhlIHNhbWUgb3Bl
biBzb3VyY2UgbGljZW5zZSAodW5sZXNzIEkgYW0NCj4gICAgcGVybWl0dGVkIHRvIHN1Ym1pdCB1
bmRlciBhIGRpZmZlcmVudCBsaWNlbnNlKSwgYXMgaW5kaWNhdGVkDQo+ICAgIGluIHRoZSBmaWxl
OyBvcg0KPiANCj4gU28gZnJvbSB0aGUgbGVnYWwgcG9pbnQgb2YgdmlldyBvbmx5IHlvdXIgU2ln
bmVkLW9mZi1ieSBsaW5lIGlzDQo+IHJlcXVpcmVkLg0KPiANCj4gSSByZW1lbWJlciB0aGlzIHdl
bGwgYmVjYXVzZSBJIHdhcyBjb25mdXNlZCBhYm91dCB0aGlzIGEgZmV3IHllYXJzIGFnbw0KPiBp
biBhbm90aGVyIGNhc2Ugb2YgdGFraW5nIGNvZGUgZnJvbSBMaW51eC4NCj4gDQo+IA0KPj4+IElm
IGJvdGggU3RlZmFubyBhbmQgeW91IGFncmVlIHRvIG5vdCBrZWVwIHRoZSBhdXRob3JzaGlwcywg
dGhlbiBJIHdpbGwNCj4+PiBub3Qgc3RhbmQgYWdhaW5zdCBpdC4gSG93ZXZlciwgSSB3aWxsIG5v
dCBnZXQgaW52b2x2ZWQgaW4NCj4+PiBjb21taXR0aW5nIGFuZCBhZGRpbmcgbXkgYWNrLg0KPiAN
Cj4gSSBhbSBmaW5lIGVpdGhlciB3YXkuIE15IG9ubHkgcmVxdWVzdCBpcyB0byBtZW50aW9uIHRo
ZSBMaW51eCBjb21taXQtaWQNCj4gdGhhdCBCZXJ0cmFuZCB1c2VkIGFzIGEgYmFzZSBhbmQgQmVy
dHJhbmQgaGFzIGFscmVhZHkgZG9uZSB0aGF0Lg0KDQpPaw0KDQo+IA0KPiANCj4+IEkgd2FudCBm
aXJzdCB0byBjbGVhciB1cCB0aGlzIHByb2Nlc3MgYW5kIHVuZGVyc3RhbmQgd2h5IHlvdSBhcmUN
Cj4+IHJlcXVlc3RpbmcgdGhpcyB0byBrbm93IGhvdyBJIHNob3VsZCBkbyBhbnl0aGluZyBsaWtl
IHRoYXQgaW4gdGhlDQo+PiBmdXR1cmUuDQo+IA0KPiBJdCBsb29rcyBsaWtlIG91ciBwcm9jZXNz
IGRvY3MgYXJlIG5vdCB2ZXJ5IGdvb2Qgb24gdGhpcyBwb2ludCBhbmQgbWlnaHQNCj4gYmVuZWZp
dCBmcm9tIGEgY2xhcmlmaWNhdGlvbi4gSSBob3BlIHlvdSBhcmUgdm9sdW50ZWVyaW5nIDotKQ0K
PiANCj4gT3JpZ2luIGlzIGRlZmluZWQgYXMgIml0IHNwZWNpZmllcyB0aGUgc291cmNlIG9mIHRo
ZSBwYXRjaCIgYnV0IGl0DQo+IGRvZXNuJ3Qgc2F5IHdoYXQgYWN0dWFsbHkgaXMgY29uc2lkZXJl
ZCBhICJzb3VyY2UiLg0KPiANCj4gSSBzdWdnZXN0IHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhl
IGNhc2Ugd2hlcmUgY29tbWl0cyBhcmUgcG9ydGVkDQo+IGluZGl2aWR1YWxseSBmcm9tIHRoZSBj
YXNlIHdoZXJlIGNvZGUgaXMgY29waWVkIG92ZXIgKGxpa2Ugd2hlbiB3ZQ0KPiBpbnRyb2R1Y2Vk
IFNNTVV2My4pIElmIGNvbW1pdHMgYXJlIGNvcGllZCBpbmRpdmlkdWFsbHksIEkgdGhpbmsgd2UN
Cj4gcHJvYmFibHkgd2FudCBhbiBPcmlnaW4gdGFnIGZvciBlYWNoIG9mIHRoZW0gYW5kIHRoZSBz
b3VyY2UgaXMgdGhlDQo+IG9yaWdpbmFsIGNvbW1pdC1pZC4gSWYgdGhlIGNvZGUgaXMgY29waWVk
IGZyb20gTGludXggKGxpa2UgdGhlIFNNTVV2Mw0KPiBjYXNlKSB0aGVuIHdlIHByb2JhYmx5IG9u
bHkgd2FudCB0byByZXF1ZXN0IGEgc2luZ2xlIE9yaWdpbiB0YWcgKG9yIGENCj4gbmV3IHRhZz8p
IHdpdGggdGhlIGJhc2UgTGludXggdmVyc2lvbiAoNS4xOC1yYzMpIHJhdGhlciB0aGFuIHRoZQ0K
PiBjb21taXQtaWQgYmVpbmcgYmFja3BvcnRlZC4gSW4gdGhhdCBjYXNlIHRoZSBzb3VyY2Ugd291
bGQgYmUgdGhlDQo+IHJlcG9zaXRvcnkgYmFzZWxpbmUuDQoNCkJlZm9yZSBkZWZpbmluZyBvdXIg
b3duIHdheSB0byBkbyB0aGF0IG1heWJlIHdlIHNob3VsZCBjaGVjayBob3cNCm90aGVycyBhcmUg
aGFuZGxpbmcgdGhvc2UgY2FzZXMgdG8gbm90IHJlaW52ZW50IHRoZSB3aGVlbC4NCg0KQW55Ym9k
eSBoYXMgYSBzdWdnZXN0aW9uIG9mIGFuIG90aGVyIG9wZW4gc291cmNlIHByb2plY3Qgd2UgY291
bGQNCmNoZWNrIHdoaWNoIGNvdWxkIGhhdmUgdGhlIHNhbWUga2luZCBvZiDigJxuZWVkc+KAnSA/
DQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gU3RlZmFubw0KDQo=

