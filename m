Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A6C60C58B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 09:41:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429606.680676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEYS-0004FW-LJ; Tue, 25 Oct 2022 07:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429606.680676; Tue, 25 Oct 2022 07:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEYS-0004Cn-HW; Tue, 25 Oct 2022 07:40:56 +0000
Received: by outflank-mailman (input) for mailman id 429606;
 Tue, 25 Oct 2022 07:40:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbGC=22=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1onEYQ-0004CG-L1
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 07:40:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061.outbound.protection.outlook.com [40.107.21.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ac18f86-5438-11ed-8fd0-01056ac49cbb;
 Tue, 25 Oct 2022 09:40:54 +0200 (CEST)
Received: from AM5PR1001CA0051.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::28) by AS8PR08MB8157.eurprd08.prod.outlook.com
 (2603:10a6:20b:54e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 07:40:42 +0000
Received: from VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::c4) by AM5PR1001CA0051.outlook.office365.com
 (2603:10a6:206:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Tue, 25 Oct 2022 07:40:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT060.mail.protection.outlook.com (100.127.144.243) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Tue, 25 Oct 2022 07:40:41 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Tue, 25 Oct 2022 07:40:41 +0000
Received: from 1f0fd2415263.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 47D6622E-CB28-4D76-9D1B-0A621E7DE117.1; 
 Tue, 25 Oct 2022 07:40:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1f0fd2415263.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 07:40:35 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AS8PR08MB8633.eurprd08.prod.outlook.com (2603:10a6:20b:565::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 07:40:31 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 07:40:31 +0000
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
X-Inumbo-ID: 5ac18f86-5438-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MBuHBkQZnmRCL1IP/Ma9ibELJnkuwAnZ7guGSMxQdno1jleXgt89CTLxmz09yq6Fj/FiwOTEBgfm8UlvaAMfJVYrE4EltO0pIA+onA5FtI0SSOtjryKMNDcdheMW1HOYi8LfhuSTFRK7v1j6vD+JEOA1univavFSgtXfKOMs5QjBK7cwHXOHuRM/gqbD0V1WPBtwIu94vAHjnYB5XijvfPutjP8ARKgDCxJqmuLPMXsf22LA6ggd12ZtdFIiRJaUtMxvTT2AMq0uX7QHLkurmoZJVgInzKc1dz/MPz7YQAkgVGmVhUsXQZK9SElgOSOQ1NLz+x/MFpTLD7W4yd2XSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ewpeZm/XYWzq/mwsQYghhUBYp76satYddO2KlgcCB8=;
 b=AKLGZR2c2IM6mWGYHQn+UfYjorikLGEBWJpc2ZjU9Gwxr7jheahWmuLbsQLYZLIsJ7yiVuptUKEgonIu8qe7+JDhBVo2kvavmI5Io7Q4pItvV71wfuabAokNkPimRWIIXVKnOCBFVoL6lwHreJB9LC5j25Yk/XbKzeDT5dm1F6tCPMkXIV5MUJftv3Kpw+XFMLvdMrbW7dih3fryXnZahYiWK+59NSNMJe7tdp//1blIiTvUNv+mXs2VQTfuIk3uDWN2WNIoXisDhVNKUO2lkozlMs5DIclDc3C3oJ+aUOO3papG+GJyosv3sDEuQzf5xod1GVBAfVHPQziADFvtGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ewpeZm/XYWzq/mwsQYghhUBYp76satYddO2KlgcCB8=;
 b=6SHlIfyQnI2yf+p0BT8EDfOu31UYilatPAOre8BvRGLyJOi8GUoBkZzvIybFClVsuxop4NnaXvtYsoC6QPQq2/gEHO9owAfzbWNfj2ZS9iGNxV2uG220UCU0SKidmjx/BKLP8z0cYYskpM12904V0RxWSYWr6YL1ptF/mCKLa9Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 98e6e87f2fc86f85
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4oW2FOS1JMhYqD/qCIDo2eHVHXmoPOVMSQYSEDgld9QI4clDi537ZRedMMWcjz2GXFC7oT0vhDZjGfPoL6+DqSVsaRUH+5sDyfdwm+qrf/hvHWRjjk17SJlUyPluTwNR4xpKXe5AF9ndB3fvciM82NPY0IuPs84c/C1iJFW9Dt+Wlqo6oQrUsB+3Pv6Y8y25z1GF8/gU4qsyLgRs5IE8UgVzIHNsJ7+QDpb4LSCJJhr/OtOV7lkd1+eOAoyv6jb+LfcO+FW4BvhjiOQyl8KLtFyBNGWyExYGFbPS+lwSsXx4NcK0dkHAECH3jxVs7ecUHzrAZiWAdi79fz4mR6vyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ewpeZm/XYWzq/mwsQYghhUBYp76satYddO2KlgcCB8=;
 b=KCzLMmh2YOSRejxVQxhx+2hyn6y03pDVGdW9b5ygJ7t7u7SlfxsSS5UMZSa1eSFTDGtoqNwZL5h1CuAjQbPqwSUM3xZsa0NdwE2qtdOI980i7KBxipSr+2/6jp1cdsmm39TwdTUKzzMJhggCncB9v+4UsLpAJJfbtVEWBYelK6q76A2EoQhUVsEy+ZB2+/FspWqM9Hvw6C004m3nD5LJT6lj0Vaw981Xq9GWDeqLIzUODl5TX5iZiGWksMeLJfDha+gUkQw6kkBnue01XTCy/0u3XPLRJUeqwvrniBUAU64dHnUHvJg6wFETRuF5QjQggE+4TD4b6K/crt6qzux5Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ewpeZm/XYWzq/mwsQYghhUBYp76satYddO2KlgcCB8=;
 b=6SHlIfyQnI2yf+p0BT8EDfOu31UYilatPAOre8BvRGLyJOi8GUoBkZzvIybFClVsuxop4NnaXvtYsoC6QPQq2/gEHO9owAfzbWNfj2ZS9iGNxV2uG220UCU0SKidmjx/BKLP8z0cYYskpM12904V0RxWSYWr6YL1ptF/mCKLa9Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "stefanos@xilinx.com" <stefanos@xilinx.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: [XEN v2] GICv3: Emulate GICR_PENDBASER correctly for 32 bit
 guests
Thread-Topic: [XEN v2] GICv3: Emulate GICR_PENDBASER correctly for 32 bit
 guests
Thread-Index: AQHY598RF0NcPOhi1keCFg9FvX7Ft64eul4A
Date: Tue, 25 Oct 2022 07:40:31 +0000
Message-ID: <E07E3398-73E5-44D3-AA63-B755EA039B91@arm.com>
References: <20221024193002.57888-1-ayankuma@amd.com>
In-Reply-To: <20221024193002.57888-1-ayankuma@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AS8PR08MB8633:EE_|VI1EUR03FT060:EE_|AS8PR08MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e7a10f-5444-4fea-cd1c-08dab65c381b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 zIIrgPl2gBNFt5JXb3raAP3UsypBSoOnhaw1DUcqo9ulF29e17lezmbl5wnUfXAKPjZfsVDhn0HH0yDiN7GlVE3tJiPATtSREwJZH2U1sltpC/51MlUzq9WV0zm7BUCD567Iw1a+uFDuQ2dMz6/KEFK0Cr0y2D+ntL3S2uslNdhfq4LM3X2ffpXSVqcZnjNgVN6HLpaal0HkliDGePuEUX1onDUZGvWq2i3GPpnc95RCAZrR1C53AEqDt1+BgpGRjTCIRz57N1t34/VRIqohM8iIW7u8YMV7SJM4+MRbJYLNqri9LEhN7yb1BnkRHoGm7nwqJ5VAn+t2UOoJVNFmS3OZd8Omm2pwImFSThvCfWC2DoJnm/0faj23tD+OEG3ejxVVVNe3vPIVngxwNUfGeovPa5Mw+2oJ8QUSz8p6ntvf1Xud6gYTMyeOxP4+rHDiDKtEPW6BzYaVI4NW97yEQW3uiEPKXHztJ0WMh18UZCAB1maGcUpPAGSeUrASZpiAgBVL2z3wpB2umeSOAYyDXQxOtQURmdtyA8NsWxBjq64pGeNPAyOYTy6fivYuNpW9XLXFfc82SZNB7ctSb8gTXEfnisjCBeXbGChSTmIw+CSOCfdiatBnJqK7T3iAwtpbC14vd4ekV/XiMwA1irz+pH/7OJBEs4NEyX8wFEX/bJJmYm6IW5fbpcNtfpR/efay7G22HTR3ClRu01k97BLtBsJGklo6MYUWK0XtziRbwJ8tJdmCQ+YLvGg8mYH23ICQfF/Uv/pUetPoe8q/OUF1j1+mwIVVED/hP7ljViPCWrc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199015)(33656002)(122000001)(6512007)(38100700002)(54906003)(6916009)(53546011)(36756003)(6506007)(26005)(316002)(8676002)(5660300002)(64756008)(8936002)(66946007)(4326008)(71200400001)(83380400001)(38070700005)(186003)(41300700001)(2616005)(86362001)(76116006)(91956017)(2906002)(6486002)(66446008)(66476007)(66556008)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6FECAFBB83EB4F46BF23C2F81B075BE2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8633
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	54bc8479-73fa-4a0a-d19b-08dab65c31e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GxHtT7LUb0XwPOkqRdeZ/tqzD5DVceCjlLfZOc/cLxgwXL2xjQXiRt7O2t0xOnny40j3F4XNq/kRaICRusFfWmfT7VoTOn8xPDconX1zxJD1CubN56Zf5l9LcKSJVEWy2LMzucy6rGgo6rgJsM6tc3Dpov3aQhJzOfWSj0z7BAeohUBzuNISgwYfiiSX6TTZRL8lohWQDv4fd9gezreov0JH8HrIhRGLH6yz47x4b33U5Gp+DCQ4F7oIkR1OkH8rc6SdKcG6gAvZgf3AwWwYpQ9SBo5Wov3wYA4DOXWnRknYVUuqctuqag7HLwjZN64KN0cieqw8tPYBsBFVE3FHc+M6mf6zjeefg3SVM7kKs04zDE4A/ZfJyTFjJWiTiSejCJN62A6rrzwfztkv5RdJeP+EpGaus8AZznDBTOiRohxA8TIZ9oEONSj9bn0K4eQNU+gTp1C4pcM2j7AwzbBFGZEYHMow63jlEkjUwefewQAbiIXy5TRhNZ0osfn/oOxBtf5Kj168mfF222U4JXp0iUqztVcKBx3GvT/PYuecpE+a2pXRWq6xj2tqX1ylLw5N0p2cSjUinnJ8p07yys4YfTy5BFsSOQkk/xChsUQ6idpuR2uNX7oqRI+aNiUtinnHUZrS0M/nnLwGTX1b7nTidGVv8Pv7uhD2NoleTDw4kR/fEXxJJrJg8cCRaCnyMLGyucUNfgaIXicvCRLtCl0QHXOCgLUjdwfJAWEECJmkIsR5H0KwTKh/ytUUSoU7uBhpRA1cZNiWcUrEZO1trx9TUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199015)(36840700001)(40470700004)(46966006)(186003)(83380400001)(47076005)(336012)(86362001)(36860700001)(81166007)(356005)(82740400003)(40460700003)(2906002)(41300700001)(5660300002)(8936002)(6862004)(82310400005)(40480700001)(2616005)(6486002)(478600001)(26005)(6512007)(53546011)(6506007)(4326008)(8676002)(70586007)(70206006)(316002)(54906003)(36756003)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:40:41.9845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e7a10f-5444-4fea-cd1c-08dab65c381b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8157

Hi Ayan,

> On 24 Oct 2022, at 20:30, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
> If a guest is running in 32 bit mode and it tries to access
> "GICR_PENDBASER + 4" mmio reg, it will be trapped to Xen. vreg_reg64_extr=
act()
> will return the value stored "v->arch.vgic.rdist_pendbase + 4".
> This will be stored in a 32bit register.
>=20
> The 32bit register is then modified bitwise with a mask (ie GICR_PENDBASE=
R_PTZ,
> it clears the 62nd bit) which is greater than 32 bits. This will give an
> incorrect result.
>=20
> The correct thing to do here is to store the value of
> "v->arch.vgic.rdist_pendbase" in a temporary 64 bit variable. This variab=
le is
> then modified bitwise with GICR_PENDBASER_PTZ mask. It is then passed to
> vreg_reg64_extract() which will extract 32 bits from the given offset.
>=20
> Fixes: fe7fa1332dabd9ce4 ("ARM: vGICv3: handle virtual LPI pending and pr=
operty tables")
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>

Looks good to me to.

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Changes from:-
>=20
> v1 - 1. Extracted this fix from "[RFC PATCH v1 05/12] Arm: GICv3: Emulate
> GICR_PENDBASER and GICR_PROPBASER on AArch32" into a separate patch with =
an
> appropriate commit message.
>=20
> xen/arch/arm/vgic-v3.c | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 0c23f6df9d..7930ab6330 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -250,14 +250,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcp=
u *v, mmio_info_t *info,
>     case VREG64(GICR_PENDBASER):
>     {
>         unsigned long flags;
> +        uint64_t val;
>=20
>         if ( !v->domain->arch.vgic.has_its )
>             goto read_as_zero_64;
>         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>=20
>         spin_lock_irqsave(&v->arch.vgic.lock, flags);
> -        *r =3D vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
> -        *r &=3D ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
> +        val =3D v->arch.vgic.rdist_pendbase;
> +        val &=3D ~GICR_PENDBASER_PTZ;      /* WO, reads as 0 */
> +        *r =3D vreg_reg64_extract(val, info);
>         spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>         return 1;
>     }
> --=20
> 2.17.1
>=20


