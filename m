Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9937E568011
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 09:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361886.591673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zcH-0001Xf-Jd; Wed, 06 Jul 2022 07:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361886.591673; Wed, 06 Jul 2022 07:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8zcH-0001VS-Fw; Wed, 06 Jul 2022 07:38:33 +0000
Received: by outflank-mailman (input) for mailman id 361886;
 Wed, 06 Jul 2022 07:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o8zVT-0004kS-4K
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 07:31:31 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20051.outbound.protection.outlook.com [40.107.2.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6fb688c-fcfd-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 09:31:30 +0200 (CEST)
Received: from DB8PR03CA0017.eurprd03.prod.outlook.com (2603:10a6:10:be::30)
 by AM4PR0802MB2164.eurprd08.prod.outlook.com (2603:10a6:200:5a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 07:31:28 +0000
Received: from DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::13) by DB8PR03CA0017.outlook.office365.com
 (2603:10a6:10:be::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.22 via Frontend
 Transport; Wed, 6 Jul 2022 07:31:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT038.mail.protection.outlook.com (100.127.143.23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 07:31:28 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Wed, 06 Jul 2022 07:31:28 +0000
Received: from aac9df073a6c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A4E254E7-A22F-42D2-A8D5-9ADD8DB29EBB.1; 
 Wed, 06 Jul 2022 07:31:22 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aac9df073a6c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 07:31:22 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DBAPR08MB5815.eurprd08.prod.outlook.com (2603:10a6:10:1ab::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 07:31:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 07:31:20 +0000
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
X-Inumbo-ID: a6fb688c-fcfd-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=USwZgIFYz9Nbllup+16eu6V0jYh2oq5y3Z1ymy4MdM6HcEQ/qZbA4889g0dQ2KRs/3gutgKglJ9A1f8pHze3DLNJZXATu2KlRSAsxIlm00v4oKYXp1RsBpmRjJ3bwdR2oTa4FDz/Q5DVACk25/8GXXmlGqdpFp8hbTYMM1rKCpE3MjVB6LeakgPuVuRpaNWu96er2tqSxRxhF5aEwzcSs4S5irVCxOU6Oyd/345oIcDxvEJaEeKdlOIwyUZSv8kS2cVNUFYln9anfmfi72enbMHJQR+rXL8EWn+9giG0ve1mi4RG6qBuNBCPxgDek5t2dfbYLMkZme1bK0LMmtAkaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7b1ELNsPHQzKLrMVcd7b8TftPA9NpV2UUza1FeAtlc=;
 b=YPq4eatGwnYdMb0z9Hv/XGgYrc9S4Gk2feiyKVtUkiM+ai6lHF21AkBDcJCRRD+TbmEqExdG1OsVjgfwuIPtOc/pizhn2fWZL4+/9mb9CGy5yiBS+Jm5DyRYJhVKb3QGrCcVd4Dkq3WwksVPSDbelx9fQrWoN+IeLSTJnDxQcM2dsAKoGVxieK/hh4RaOKZN/je15yhELNdwStVieoKUX1fMgybAR0nhCec8whHboEixlpW9rdrxU3HXne7Yhii5EDQJEjOov1uUSIvDXm3hWUmH1sCocukChK4s/G3/PVDz3x0PrULy/7sYsiQR+gr7LJbbiGIez2kXWbBEa0lffg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7b1ELNsPHQzKLrMVcd7b8TftPA9NpV2UUza1FeAtlc=;
 b=kGJ0FqEPh+Xdz1KjJoCC4yZk9078JJas9jNq4f5GkQs37pQjnlFfOPOTfvl4lRJLNed3vvxnTz5h5NbXhQHriH51wATc1prRHLHZe2kip9XN4JmSx3Jk9gKAgyV8yQvutVDtH12CvV+k5+oIHlavS1mb/PSEKtAcaSzOeAOSEzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=So9oIWIuf4Z6iklaR/WHxHMUT7FO1DZ4bH34uaDHXX43685EzLnvqBW4ZgtcZHSK4yGQ9tNwT4ajD96Fw6JPF+9NRNgQAS+t3obtdRJ0O5//iGc7MrlMTYkTuujDlmCewESbuQ7Dtn2aGmOuu1YC+sT3VEkJo82AO6oMmxLZA7ZuvhPoy7blKil0VmTtAsM31fo0Qzj7tyj2pG7aoZOgJoKLlEsYIIWGXqT1qreoZ8H0qw8qEz7H9ykGW1wlcu7LXxwYfq9jtxedmA1q0hPJWxwb8RSLBzhHqia5IJ3jZRzoudv/JEfa0fvpLJPp3yXrvjvkSNSXCqlWmr4INoZw1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7b1ELNsPHQzKLrMVcd7b8TftPA9NpV2UUza1FeAtlc=;
 b=Mu0tPUt7oEslVz51CHkePlI1pPlisuxZGs0IyVsX8WNZ0+Y7oCC7/yaeKN9J7C4NUdqZ/oYTUNy3hrUuABKUHZjnKNasfzrGn2WojdfcI86qqCjqSau5MHnqHrv7junmenbyUAWC8MkFDiPOmDyEU95fz+Vgyp/PJAMOxFlXP7fO1CqqHo09GRIaUTu0K24pcFottBcU/kig0M1+N0ycqkWcIbNCn061j/xt4gDdtiFZN88RvhGnRR1KpuDMZUEzxD9SoLJK0jrqnl/vX2xnRWrUN5KYUGQ6zTfoqpEOosseti8+r139fMlePh40xAcnW8jKOel4asUPfzWIRRRZUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7b1ELNsPHQzKLrMVcd7b8TftPA9NpV2UUza1FeAtlc=;
 b=kGJ0FqEPh+Xdz1KjJoCC4yZk9078JJas9jNq4f5GkQs37pQjnlFfOPOTfvl4lRJLNed3vvxnTz5h5NbXhQHriH51wATc1prRHLHZe2kip9XN4JmSx3Jk9gKAgyV8yQvutVDtH12CvV+k5+oIHlavS1mb/PSEKtAcaSzOeAOSEzk=
From: Henry Wang <Henry.Wang@arm.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: RE: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Thread-Topic: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Thread-Index: AQHYgJ6R51Cg7cLRXES97vjccXbkla1xEZQA
Date: Wed, 6 Jul 2022 07:31:20 +0000
Message-ID:
 <AS8PR08MB7991F4C747E3520491B9E1A292809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
In-Reply-To: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 07CFC9DA19D33E459D83F559D061E325.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 33b511cd-b989-45f1-b808-08da5f218a03
x-ms-traffictypediagnostic:
	DBAPR08MB5815:EE_|DBAEUR03FT038:EE_|AM4PR0802MB2164:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bTJNihQN399R5xCxwk8Ninr04Id/DvlflVFN71GW/xjnA7Tc1M9GhMHiyVRSlA9NSYOQbpQSK5poAkXQAuq0YvToVwgeeXH5RosYLogCL5DvDL9tnhV/DlyRG/J9Nc6VM3IgyimiRx1uRue9H8OBPyPfLUTXrgTDTLYjgPGRLu/lSuAj5Sg5tw9YqFinCfVEhGrsGJ8zg8U9E3PwCDYiQrHri6tlu/vRKvNCT2VRr2d8AVkvW+F2X0n+iwW7Uj21zKhMbSSdbHZomZGJsSaAXVIwlSbpqQkXZIoLYt2dtsE0bf8B6xsaST+S7tozLn6j4LPz/1ew2qGkogCZtB7LJFcUONuhzCdoMQDKzIbM03jUB858ZzvM3U2367eYsUt7rARvC7eL9PkRgqP/B1dB2w5wfdTC1pTG7rdIYtdf8IEp6OjahPHQm7wXJWY/JyDas1FolYYDYKXpTjPHEZNMhv0sWTFEJY/X0W1WGHQxT+w1VLXNjqzPfmcSApAOvOPOdHldfTKurWSDo8PbgGBZi5/mA9eJQDwcOeBO6CtMHIYvR5SUDeWL9H2L/9pmIXC5rjdVaKUukQ9ro1vVOJvUCrYkNAS8YrJvbfjQAN8oYxjziBNyZ+7Qi/LLPItR13ReD/Y/0WH/HPWm2dMr4sbqHajsan8MrHXqXlNgN9ryHdpviqI6WDOs7l3S34g57Qspf+QQjGyOpn821epn7pA02C+kdTjslg7H2cPzMDVEagNx10eF6HaXQGH7WaBL3MLucIB4eenn8Db65tj2AikH8sezMl5NDejjA/0vgKv9vqn4NcaqKvcinbwW/gGMsZUz
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(478600001)(54906003)(41300700001)(71200400001)(9686003)(55016003)(26005)(316002)(52536014)(122000001)(6916009)(8936002)(5660300002)(38070700005)(86362001)(186003)(8676002)(66556008)(4326008)(66476007)(66446008)(64756008)(66946007)(76116006)(38100700002)(7696005)(2906002)(6506007)(33656002)(83380400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5815
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	010e940b-5b0a-43fe-1345-08da5f2185c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aaShANSQGVkF+eVtNLdHZOJkkK0Dw5fvEoULAh9HvYXGQ96So5/TmHVc3E4tejErAVdK5+Bhp9+j+34T6mT7jjOou394saD7ItXEnaUV6Fwg4x5d/CandxYbmHDXHsVRT/KoX0fx7kbwayqrdKCGzNUAHIFlLiFjdvEsRUom4b6K9/lZsjVfO8bip4zYWOeAdcr9LolfSDINbERKswRXFaJjdM85ZgoXWqtyJiGMrJBtEU+5356S0e1HEXE7KBbfJZArD+67e1tvuMptJS+vdcUOhyN3rW2F3rCL678zYQu6Cikllaaa+LaJwX7j2rrvVs/0T+cdsdVxG6e6cmsGl4COsUh5nXROp7/VfM6gkC4SuiEc86PKJa/4KdpTtUdoLZGNL8L4ktNYz9ZEcAg/xYCQ5m/qLb7MYcyWWfOH9oHxmwrK2sXstz/FEQdNnxrpRuNEwpybO6FgKJASEaoTtUYNC08bE8FKsTaYpoKdGZKIckwAO3qIezgWLPC89aA+NEeGep2QtbrwzbktNIspvTq6mxaAaWUAqVEL8KDIr17C/PcWDCRZoWfHv0y6H/CqkxC4pRUGnIAdXQUEjVYJJqvfd1D2r2eSqg4a2y8Z6nI0ODT7TRr32MqSiixcyCkN2/6/S0/FTJ0leF/yIAs5smdBLCfb1lGCp6OBibN0yaiwQ2+5Ie25w0jBMEe8Aw3kMvvXtlN5s/tbb7a6vW6OpuEinhvVzRLTIlumtBJ3htLZssLUIcTApKcAWLcGW0iDvLqhikLF3FjGA0RegJ3aL9eL7MZybY16KjNBJ9v+nipZW8pSLKHYpC5dkDKsB78t
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(136003)(46966006)(40470700004)(36840700001)(7696005)(6506007)(356005)(81166007)(40480700001)(54906003)(6916009)(36860700001)(316002)(86362001)(82740400003)(55016003)(82310400005)(2906002)(8676002)(83380400001)(41300700001)(4326008)(107886003)(5660300002)(336012)(9686003)(47076005)(26005)(70206006)(70586007)(40460700003)(186003)(33656002)(8936002)(52536014)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 07:31:28.0405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b511cd-b989-45f1-b808-08da5f218a03
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2164

SGksDQoNCkl0IHNlZW1zIHRoYXQgdGhpcyBzZXJpZXMgaGFzIGJlZW4gc3RhbGUgZm9yIG5lYXJs
eSBhIG1vbnRoLCB3aXRoIG5vdGhpbmcgaGVhcmQNCmZyb20gbWFpbnRhaW5lcnMuIFNvIEkgYW0g
c2VuZGluZyB0aGlzIGVtYWlsIGFzIGEgZ2VudGxlIHJlbWluZGVyIGZvciBtYWludGFpbmVycy4N
ClRoYW5rcyENCg0KS2luZCByZWdhcmRzLA0KSGVucnkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC84XSB4ODZlbXVsOiBhIGZldyBzbWFsbCBz
dGVwcyB0b3dhcmRzIGRpc2ludGVncmF0aW9uDQo+IA0KPiAuLi4gb2YgdGhlIGh1Z2UgbW9ub2xp
dGhpYyBzb3VyY2UgZmlsZS4gVGhlIHNlcmllcyBpcyBsYXJnZWx5IGNvZGUNCj4gbW92ZW1lbnQg
YW5kIGhlbmNlIGhhcyB0aGUgaW50ZW50aW9uIG9mIG5vdCBpbmN1cnJpbmcgYW55IGZ1bmN0aW9u
YWwNCj4gY2hhbmdlLg0KPiANCj4gSXQgaGFzIG5vdyBiZWVuIGFsbW9zdCBhIHllYXIgc2luY2Ug
dGhlIHYxIHN1Ym1pc3Npb24sIHdpdGhvdXQgaGF2aW5nDQo+IGhhZCBhbnkgZmVlZGJhY2suIFNv
bWUgcmUtYmFzaW5nIHdhcyBuZWNlc3NhcnkgaW4gdGhlIG1lYW50aW1lLCBhbmQgYQ0KPiBuZXcg
cGF0Y2ggKHRoZSBsYXN0IG9uZSkgaGFzIGJlZW4gYWRkZWQgLSBldmVuIGlmIHNlZW1pbmdseSB1
bnJlbGF0ZWQsDQo+IGl0IHdhcyBpbiB0aGlzIGNvbnRleHQgd2hlcmUgSSBkaWQgdGhpbmsgb2Yg
dGhhdCBwb3NzaWJsZSBhZGp1c3RtZW50DQo+ICh3aGljaCBtYXkgd2FudCB0byBiZSB2aWV3ZWQg
c29tZXdoYXQgUkZDLCBhcyBJIGtub3cgdGhlcmUgYXJlDQo+IHJlc2VydmF0aW9ucyBhZ2FpbnN0
IHRoZSB1c2Ugb2YgLU9zKS4NCj4gDQo+IDE6IHNwbGl0IG9mZiBvcGNvZGUgMGYwMSBoYW5kbGlu
Zw0KPiAyOiBzcGxpdCBvZmYgb3Bjb2RlIDBmYWUgaGFuZGxpbmcNCj4gMzogc3BsaXQgb2ZmIG9w
Y29kZSAwZmM3IGhhbmRsaW5nDQo+IDQ6IHNwbGl0IG9mZiBGUFUgb3Bjb2RlIGhhbmRsaW5nDQo+
IDU6IHNwbGl0IG9mZiBpbnNuIGRlY29kaW5nDQo+IDY6IG1vdmUgeDg2X2VtdWxfYmxrKCkgdG8g
c2VwYXJhdGUgc291cmNlIGZpbGUNCj4gNzogbW92ZSB2YXJpb3VzIHV0aWxpdHkgZnVuY3Rpb25z
IHRvIHNlcGFyYXRlIHNvdXJjZSBmaWxlcw0KPiA4OiBidWlsZCB3aXRoIC1Pcw0KPiANCj4gSmFu
DQoNCg==

