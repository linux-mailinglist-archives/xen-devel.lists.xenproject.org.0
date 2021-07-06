Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 035E13BDBFB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 19:10:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.151571.280131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0oZz-0007Jl-FO; Tue, 06 Jul 2021 17:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151571.280131; Tue, 06 Jul 2021 17:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0oZz-0007Ho-B9; Tue, 06 Jul 2021 17:09:51 +0000
Received: by outflank-mailman (input) for mailman id 151571;
 Tue, 06 Jul 2021 17:09:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cLt=L6=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m0oZy-0007EA-33
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 17:09:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.85]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f823172a-de7c-11eb-84ad-12813bfff9fa;
 Tue, 06 Jul 2021 17:09:49 +0000 (UTC)
Received: from DB6PR07CA0081.eurprd07.prod.outlook.com (2603:10a6:6:2b::19) by
 AM5PR0801MB1729.eurprd08.prod.outlook.com (2603:10a6:203:3b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 17:09:46 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::2a) by DB6PR07CA0081.outlook.office365.com
 (2603:10a6:6:2b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend
 Transport; Tue, 6 Jul 2021 17:09:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 17:09:46 +0000
Received: ("Tessian outbound 5d90d3e3ebc7:v97");
 Tue, 06 Jul 2021 17:09:46 +0000
Received: from dbfd1187cecb.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5BCC41B4-5A5C-47FE-8E42-CB51C24F99C5.1; 
 Tue, 06 Jul 2021 17:09:40 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dbfd1187cecb.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 17:09:40 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PA4PR08MB6111.eurprd08.prod.outlook.com (2603:10a6:102:e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.28; Tue, 6 Jul
 2021 17:09:39 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%9]) with mapi id 15.20.4264.026; Tue, 6 Jul 2021
 17:09:39 +0000
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
X-Inumbo-ID: f823172a-de7c-11eb-84ad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjJUiH96IYTbPVoFZr5RR6KjTNi7tXBgKw0jMmmQMcI=;
 b=YCpl5BSwAMA3C3odL0xxkD60EnKUmuuD2C+BeVEsHiYlsBvBOTuZLq0nmu4ioCYoeajFXN962oKtQaDASerwaUmHMX90Wptgsp6LaoBmcjEU3pRRH7cp/L0PBwSif8LR+LENWeTA9DspViPhOtvuo/668yJvZO1uosPifW7gClk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8b1fc6db8a0dc25a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOsWvAwxUEzcKPiRFQojQw0IaZIByyW7SkreKR5DtfSwgXhx821ACPT0atkqB2QOJzIbrhMbmVW6oNY1RS5ovgVrB5lGigv2L1EC9N6WES5f8zfL6Wvxmi1veFCzyUX2EUU76f3XYMsW2lbaebowmQKm8pqedDqj14uw3DkkSaJ0XkxwljSWsDGCtSN304BuNLcgcLqCa4JFCWTUsOk8iryMZqXt01YNkNMYtXXnknG0HIbhI1EtxEHGsPJY2M+9744wbD3I+u25iYjeZGNLmdntqx8wW39LV9tGxLyoJVgNCRQtazwJYpEapQnkoUTqfmPCYDAciSlQ/egelfweDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjJUiH96IYTbPVoFZr5RR6KjTNi7tXBgKw0jMmmQMcI=;
 b=A68eXCoDxiXLbj4Xw8m/XU9F/9JX5xs/IrUKdkdUYqFB+Y5KpO3OujoATqyAw4RbpPfjbnLVXzHBiNUIW8Xk8fIOZMiXbFqZV8IDGSYQI93RaFEdZTqNerbtxmrRmevjcb5nOO3fsx73c3OfYmCexqVa13jTk31vjSNmH/3hy9p9rvu0479HtxXXH8tXf09RulOwqgTbVa9LMf+UMFV8/d+6BLMgD1aWQUjEB6TNc6yyS4ajb4bkXHJMFGdVp3tOjCHVZFZbh46ENHdMG9Z/Pj+6VtdQdsGScBY0PHPPELJjQtIx0bS+iA47UmWIUBCyNio+3vYFwRr4uQeAydrfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjJUiH96IYTbPVoFZr5RR6KjTNi7tXBgKw0jMmmQMcI=;
 b=YCpl5BSwAMA3C3odL0xxkD60EnKUmuuD2C+BeVEsHiYlsBvBOTuZLq0nmu4ioCYoeajFXN962oKtQaDASerwaUmHMX90Wptgsp6LaoBmcjEU3pRRH7cp/L0PBwSif8LR+LENWeTA9DspViPhOtvuo/668yJvZO1uosPifW7gClk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] arm: Fix arch_initialise_vcpu to be unsupported
Thread-Topic: [PATCH] arm: Fix arch_initialise_vcpu to be unsupported
Thread-Index: AQHXclHJWHwKNGJKDUOBs2jUzEf/E6s2LsEA
Date: Tue, 6 Jul 2021 17:09:38 +0000
Message-ID: <D3CC15ED-E3F4-4EF5-98F4-3858284C48E4@arm.com>
References: <20210706102853.10251-1-michal.orzel@arm.com>
In-Reply-To: <20210706102853.10251-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 61f8a5c4-28a2-4a49-9e55-08d940a0db57
x-ms-traffictypediagnostic: PA4PR08MB6111:|AM5PR0801MB1729:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB172932A69FB2425BB09A4D3C9D1B9@AM5PR0801MB1729.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pGDjPuD0c1vPhL2VSFFw0JqEbpkAff14zNE4vbMjkh8fFHQxNGncRK1y3xWkJaU2KKTcg2g2swfDxC1k/VwsNSnJX6DPyw+W/+CnC/nS8ADWDSmzq3DmoL18rQ4qnI2/E1X4Pp5/aw5CCGe1eyDeF4mb/CYzxwiI9Bt2wIQzxJfj89DCsAzaWh/qsydRux++xT7Vut9ql6GYcfesoyO/bzR+f4XxCWTwJV4qBNl3s3oQk8o1qRT0QDMmK/x9uCIW9a9ENdTidq1Mlz78/vq0e4zZEAbqzhGxXiS+xcDwfWjDkdVc8e5TvKsQ0NS00xjtYygjEgG1fA4XzUWXrd46XionsVsjv8D6+1LLEqpH0kWvmlf9d5fNhGCjVrt+8PmvH32N7O/IXdzIqWD16E+DMbNdcDIHx2Lb8ewMYMkLUHLkp9kXUIC4mYidXrAXaImaMAFsp9uCdfuFtNQHbaiWZ48qn2jBQe7dtcTPENOqLTIRTBkomBV2nViGnUh+kLN1FdLkfTEddkEHy5DacGqEbeYwDxHDvkrJI97opIY2Kvfdu0wayyTEqeSQ/wkoW8ASpEbaMUmCl+8pT8mSzxM4J+NM4Sc7cs1wC8TbRf2sX6YG+YQiLAxmFq8d3VrkWbltF2tKmSZyF+97ebrm44001dNUkRFKehk0jlbWq3+mvCSkZOQGBhlHYPKEOKq216JyEoLkL+aEY8ir+5AjphF9hA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(4326008)(71200400001)(91956017)(33656002)(6862004)(66556008)(6636002)(8936002)(6486002)(76116006)(86362001)(4744005)(2616005)(83380400001)(8676002)(316002)(2906002)(37006003)(64756008)(66446008)(478600001)(122000001)(5660300002)(36756003)(66946007)(186003)(6512007)(6506007)(38100700002)(66476007)(54906003)(26005)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PahD9umDCr9DlsSIZ7oMn+MXvtNXmoMXxdVUoMJ9R0KoRD9XY2mSivw5nKxH?=
 =?us-ascii?Q?+teWEz5I8BuA0LMO9zkj2YSiDqQhvCQ5Cjb3mkP3EsOG28lPHzvCjCbZJU/K?=
 =?us-ascii?Q?HBUgBIvM5unQog1SR08pSos6h/TOvVfXdYNAvTxmfdzYr/WCFJReZCLzWKRM?=
 =?us-ascii?Q?O7GS+c/7r/NR3qocmUAmxWC7ajixqiJZvhqxN64WlrQWroSUUNVassTEvBRk?=
 =?us-ascii?Q?P2zdYtYNEhLV2QaPssAPYtiQY+fEw2HvORx56E12aT2w5VDZfrhMgo4uovJy?=
 =?us-ascii?Q?mnIeJMc/Rk+5xbFWDRO0Yts+R1erLLp8rqVgp+iUG1lMRSe+xnr812zTKvNC?=
 =?us-ascii?Q?AqYFvrZBaFoh46TilJSQdmNnkjz8EmJuoxvN1K0l6zUPNkt3ziI5WQ9n6deG?=
 =?us-ascii?Q?1ecPvLf2yl5ERfHa1Q1zFdZGQHCAtI4ItDWZaUn8rNENYVCY1sxd10tr6dYa?=
 =?us-ascii?Q?URiSrUOpLwM3FzO0Tuo093PxqjQ82ec9ci+gcgoMttLzjyXZwv6UE0vK5pMm?=
 =?us-ascii?Q?3WMZG+HfSExKrdMGzD8S68rpvyGNZepRHrIs0DBYeSYLAI1bkYVU91Xt03iV?=
 =?us-ascii?Q?0OIkW5Ni3OQosQ942/FrAe196rsyvLeJ/rxXPFPHcCQaScmpjJeuiLmCb705?=
 =?us-ascii?Q?Ngy1m/Nzh+QWtmBuuJYSynkKQ4Y/Np3Nqy+MWiHgQ8y7qp+KY1+u/yasZKYC?=
 =?us-ascii?Q?lxKeBHiPqQQ1mnC4IAAbkswQCyrtco/bMU9n7d3vBVGz3s/mvJvwNhjB/mW7?=
 =?us-ascii?Q?oWGi4yEv3QHggtvU5ciyrPNXDvRvGRAiYwGGWb7q1oaIax91nhF4thIkZMoW?=
 =?us-ascii?Q?U/ysxpBZwYQXkdkYzUZkBKUlxjGGCwZUMeKBzIVkyJHIdN+6SUfgf3JST1a+?=
 =?us-ascii?Q?Yj1Lfzdpezrat0XBoea6IpoDhV701gH96xJGGtnzcZn+h68axjLxyecWqloe?=
 =?us-ascii?Q?DBhzuEngnAb76julNRNW27EzRUa9TlLkJAhctCymOBIpv94GoPIw/PySIenF?=
 =?us-ascii?Q?JZjmoDSLQvfsM+l0bJdXcVALtZGSErcSshlO+ooOZ0/5rGuuFT1QSzrPuV6k?=
 =?us-ascii?Q?fNCHLjbhbIidrzATORMVZkXlIe/uqqizPOmBM2oLp6R2YObD4D3nwt+Zvf90?=
 =?us-ascii?Q?bdMLVmNm/iHPd5E9dwW2J/srlWXP6q9TW+iiwtSZgBGeNjoE2/fMqUoqV2Dc?=
 =?us-ascii?Q?eK6g1+sfct9Nz+SNEUZHrvVLHtHBxB+Ypwtfat9WV8Zw5yDGStHuRel7z55j?=
 =?us-ascii?Q?+gi0Zr8QJVVhGqy3lLFLgWeUqIZveM/2Z3DlbxrSWnBVG1zd8NFbw29Q80Xn?=
 =?us-ascii?Q?ZNV1RIcnP+3S45Eq/G8pnSxL?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <911E629055C87C4A9C11FB565E85D19B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6111
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a01ce23a-1e2e-4dc2-416a-08d940a0d6ab
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wgVaPwH8FdrsumO6GxyLCXIQ13Rc/j0a9gpdlNm5nNQrHVTTncmV9FVYOXGDXX3ac93lNO3xe/JbLm9pzFyk/D5CYpCbaoRuzaZvRp55PdHR566aOBZROOqlNrN24Mr+Cgz3ksMNbeBns+qwySBBi/y0snY1e2t/wF+VZTM+JT+sUNpKHtZ5E4YkQnfDp3gVS3p5JMCFEEdo0OBmasFUKNcugiVE/HFqNiz8R4idYSzZPxrQnBOKjoUwH8rtjTJ8TiUe6S11nBmiTDAa5i2LqWT2Y5VSGqrEJAz8eEMEcmpWZwd23IksZb07CHG33AF2naE2/6KqfG8tVKZ1JO+1EUbPiTmGpSTNnPgTV4fIhPVeb51T4bpA3BeuZX5rMXztZhA+17nq+iWciJSm2BylPXY4zyqUM9MgGJv4VbvnryVKLnbud3i0/pxcbjCk3p0YPRJKSjJB+JBAK78hnNirdWz4WR/lzgCAOdy6k7QZhFmrli1I3HZW5zvc30HEBz79ZXyBWg8y4wtr5HiUJhF1r7xhJWzPvG7JsZbk7boJLZyTU7MJ6Xmyq49FsEP1AMrngxllMF6FvlOPe723RXe02zWbqmkYV0o8ZD6ffPD8cInmi4Nr9M4Z+OXArNfFdLtzwbQrocpR0IRX5Vgro9Gs0dHSrfLhmww2LYXPFqcd1feARF7cnbZSy+SphSZ+PX6vJ37cxI+mGjGq0LLCuBr8Cw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39850400004)(376002)(396003)(46966006)(36840700001)(2906002)(54906003)(356005)(70206006)(81166007)(107886003)(37006003)(186003)(47076005)(2616005)(4326008)(316002)(70586007)(82740400003)(6862004)(86362001)(336012)(36756003)(6486002)(33656002)(6506007)(6636002)(83380400001)(8936002)(82310400003)(8676002)(478600001)(26005)(5660300002)(4744005)(36860700001)(6512007)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 17:09:46.8453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f8a5c4-28a2-4a49-9e55-08d940a0db57
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1729

Hi Michal,

> On 6 Jul 2021, at 11:28, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Function arch_initialise_vcpu is not reachable as the
> VCPUOP_initialise is an unsupported operation on arm.
> Modify the function by adding ASSERT_UNREACHABLE() and
> returning -EOPNOTSUPP.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/domain.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index c021a03c61..a2aa8b77ad 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -923,7 +923,8 @@ int arch_set_info_guest(
>=20
> int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg=
)
> {
> -    return default_initialise_vcpu(v, arg);
> +    ASSERT_UNREACHABLE();
> +    return -EOPNOTSUPP;
> }
>=20
> int arch_vcpu_reset(struct vcpu *v)
> --=20
> 2.29.0
>=20


