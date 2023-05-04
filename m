Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C036F63DC
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 06:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529536.823996 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQGU-0007Uu-Jc; Thu, 04 May 2023 04:08:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529536.823996; Thu, 04 May 2023 04:08:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puQGU-0007SV-GO; Thu, 04 May 2023 04:08:22 +0000
Received: by outflank-mailman (input) for mailman id 529536;
 Thu, 04 May 2023 04:08:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ABSM=AZ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1puQGT-0007SP-Dp
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 04:08:21 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d88cf89-ea31-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 06:08:19 +0200 (CEST)
Received: from DB6PR1001CA0046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::32)
 by GV1PR08MB8178.eurprd08.prod.outlook.com (2603:10a6:150:92::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Thu, 4 May
 2023 04:08:14 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::68) by DB6PR1001CA0046.outlook.office365.com
 (2603:10a6:4:55::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Thu, 4 May 2023 04:08:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 04:08:14 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Thu, 04 May 2023 04:08:14 +0000
Received: from 766ddd8ff3a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A74EA22D-9AE0-4D17-BCA9-94B26A60CCA2.1; 
 Thu, 04 May 2023 04:08:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 766ddd8ff3a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 04 May 2023 04:08:08 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS2PR08MB9318.eurprd08.prod.outlook.com (2603:10a6:20b:59a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 04:08:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%6]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 04:08:06 +0000
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
X-Inumbo-ID: 4d88cf89-ea31-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWvM9wmLCUR6GOvCgPkahatkE9po1Rn73LzxnwCS/+Y=;
 b=sQ4+WLxRmFFVqd1gYweOBbK9jWht7Q7/XHL9e5jE0g3ni7GS7EVIfYY/Uf4B3ZQJogq9nhcDAXgqKeu4UQHWw3lDivpSTAEXnCgKCUIRP4WXevKYR2dm9y+m0JlxF7/3oFA6lAyCRiSvYCpCaMo0fBjYs3dBrfxVDppDtZSgjGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGFQcYUdgSBUTMm+Lw6cApFR/2rqnNOg4bjqpti2j9Ky2Oz4/i2Yh8TlpLJD+QEssBSCtyb7/vZzMkYt0FaeYPGm5GX4ElcEWczpbJvofBFfjeE5vJUKYXGPA3QBQNoUDOeVLTQYyrU6d1QTz4j9Zk+bkBfNtdUjEI9bNKwMi1pC8GRRCKyD4fOW28q7x/Prf+1Kcpc7p5sheclgnkhFhR7k4+pKoXXHMn6MDXU6fH0Fhu7mY7b8tKl/WSTYG62KIbvakAvZAIDCkqni/8lcqPEnmlO3gMnck9cNhoE+Dw1FkvPAr02vprGpHb7mTQNJfHhvMDVevS51IafZ0+E7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWvM9wmLCUR6GOvCgPkahatkE9po1Rn73LzxnwCS/+Y=;
 b=EXh/rqwQZJZ5wAUZn905Fs/ae7n9CzMheieKlhfVoBkwMag+WC+SDY7x+33Kx/Mxx6r+RnxaYxpRAiNFHVC3AR96PMxnFI7ui8RiuGQqUIreTW3KWn7B+t+j0Jgds5xOMjgGHH4hyGDSUrAo6MAxxji+dSjuykLJtbzWIZXhiiCsBG9B2eMdtRt4spuoZaMf2Xw4t9PfZAV+snB1u4JS5WKSdUvUxv9yDWIik+eW60hbS2S7dzjWxMTUmTI3JKI2aA3XaCF7Vc1ZOH2/GnI18cfQIWGZ5LpFX4INhTs2QHHfQHiIFLH31NBav2JypsmwGaWd09zf8NIZ1IS2qpKVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWvM9wmLCUR6GOvCgPkahatkE9po1Rn73LzxnwCS/+Y=;
 b=sQ4+WLxRmFFVqd1gYweOBbK9jWht7Q7/XHL9e5jE0g3ni7GS7EVIfYY/Uf4B3ZQJogq9nhcDAXgqKeu4UQHWw3lDivpSTAEXnCgKCUIRP4WXevKYR2dm9y+m0JlxF7/3oFA6lAyCRiSvYCpCaMo0fBjYs3dBrfxVDppDtZSgjGo=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: RE: [XEN][PATCH v6 04/19] common/device_tree.c:
 unflatten_device_tree() propagate errors
Thread-Topic: [XEN][PATCH v6 04/19] common/device_tree.c:
 unflatten_device_tree() propagate errors
Thread-Index: AQHZfU8dTUEoDGBGd0KIZrm/bdcnRK9JgM7A
Date: Thu, 4 May 2023 04:08:05 +0000
Message-ID:
 <AS8PR08MB79913746C549B68EAA72D240926D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-5-vikram.garhwal@amd.com>
In-Reply-To: <20230502233650.20121-5-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D3BF081E2E0A9140A7C268B1B873586D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS2PR08MB9318:EE_|DBAEUR03FT014:EE_|GV1PR08MB8178:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ce8015e-0feb-4fec-d84a-08db4c552ebd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 T3hdUIoV3LZho5cDGA3nt5Cta3CvRGAupxs3iy/sspzML0MnGIj5em75YaRxcF3IhSzGCLB9uCGkm9tVRtntALvn1YSFbUmvwHi+f+b191PmMWQNCGeLFXCu/6xQgS9Czc2GdblbUupowdu+1MTATWP2v9cMrbbwl3SJNJGzUAKeVH1Hwm/9wivwgBhZmRD19vYVueV+8VyT+MKEx34Vr5hqWOSjFeDbBsCRR57ZUvL6sJtJCcyx5ZHiIKn0hAg7mpM7FGuGcoYtbwi/OpCGCYK8lGcUtEf4MMvQ1dnQZe45ZM8L04oCA4RoBEyk32j15cQhEl/jZo9GrsqbO92rUT+PDb/q2zJ3laKaoNayrYMoNXm1AqzULMO22TylFQ2R5riaY97AI1LKOAC7RWLvC3nHvx4cqhLEO3u23i2I+WEeI1HGn9hd14nAyw7EfCQcvxD8Cuws9Z3xujR2Kq7iDGHD5ngOYWeOYpUziUZa6Vm9LW7OjVffVaCAAFspDrx8cDpxxeSrcmb+Gqm5r9fK4w7dfWWI+Tw811tTANkujwQ+GFAljwHMJPjXpwz4vNaNyF8/IH0vPS4+1i4Vr2R6G2oELtlWLorYyE+U2sqz8Dtor6rg32IARPwV3er8FZ0H
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199021)(316002)(186003)(66446008)(41300700001)(4744005)(2906002)(9686003)(33656002)(26005)(6506007)(54906003)(110136005)(71200400001)(86362001)(66476007)(7696005)(64756008)(4326008)(83380400001)(66556008)(66946007)(76116006)(478600001)(38070700005)(52536014)(8936002)(38100700002)(8676002)(5660300002)(122000001)(55016003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9318
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	03990af5-4397-4b7d-6504-08db4c5529c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zUFSVEjrVBptzOnu7Fzf+FHfOBWhkZ7OhgUPdVnw1Mw1geAz1qhU0qOUgEAmC/7bS6xs9Gtqwpj+W/gZthdtiUrgvIxE21ZSSDuFJuj6YoA48o63z5wvbiYd5GDoBhHihHUdxH3RdGP9ZArMGdMO6BsBO38PRu5znTa2/4/H1G3CNAL4FCJ5JX5tMI/sdNlkHIO8A8vqlpCzw9043oXz27sa48jx+PX2pCHm7FceZlbWWtBUR4qfgVu9EjM6DyLvJ7Dr4PIzd2JLFQs7cqKvLaHDh/3wRugpdnctvo/Oqf1Ir4xxeGE6FtEtnFiPIIQHpaowhTCYoMA2pLjMWuoBrD7p4KLdHf/AQH5svzM9AsSnXHR1Y7HBD+OEl9PMSfzQ6AuIGmjqufJ8JAPUqyXwk7rbwChuZLcM1jIhZHJScCkXKmJwXD6Lg9s5too7NEcdG/o5b9eylHoAFDkEEPMd3bp/PL3poUTT8Cp5aM71WNaT84LkLImEZeBWQk7J1q+DK+Z8Tet8x4SS985F7TvD56YXWKwljKstfZvtUygBNkutuDT0rfYPm/GnIRrbA1M2W2z2LctvsnvbAH5XX+Tiq04DI1ZyGommPYJMS0Jc1XxgueDe0zv6WMuYZRNxPa6PW3V2tMM20lfXcYvq71rPh2i06UfttPvKTQ+qsCbf45J0GkWTbChJd94IPMzDFe+Ayhi58HVFpqGBHivI/V6P9FgLQSh3D+5eEsrga79i4BM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(8676002)(8936002)(36860700001)(40480700001)(356005)(82310400005)(41300700001)(81166007)(34020700004)(4326008)(33656002)(70586007)(55016003)(86362001)(110136005)(478600001)(70206006)(316002)(54906003)(40460700003)(7696005)(82740400003)(4744005)(2906002)(336012)(52536014)(5660300002)(9686003)(6506007)(26005)(186003)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 04:08:14.3025
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce8015e-0feb-4fec-d84a-08db4c552ebd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8178

Hi Vikram,

> -----Original Message-----
> Subject: [XEN][PATCH v6 04/19] common/device_tree.c:
> unflatten_device_tree() propagate errors
>=20
> This will be useful in dynamic node programming when new dt nodes are
> unflatten

Typo: s/unflatten/unflattened/?

> during runtime. Invalid device tree node related errors should be propaga=
ted
> back to the caller.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

