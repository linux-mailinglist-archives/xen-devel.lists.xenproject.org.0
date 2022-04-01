Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 510624EEBD0
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 12:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297334.506475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEpv-000667-Oi; Fri, 01 Apr 2022 10:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297334.506475; Fri, 01 Apr 2022 10:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naEpv-000637-Kd; Fri, 01 Apr 2022 10:48:59 +0000
Received: by outflank-mailman (input) for mailman id 297334;
 Fri, 01 Apr 2022 10:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JkNZ=UL=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1naEpt-00062j-R3
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 10:48:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54648ea8-b1a9-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 12:48:56 +0200 (CEST)
Received: from AS9PR06CA0149.eurprd06.prod.outlook.com (2603:10a6:20b:467::31)
 by AM0PR08MB4241.eurprd08.prod.outlook.com (2603:10a6:208:140::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Fri, 1 Apr
 2022 10:48:49 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::6a) by AS9PR06CA0149.outlook.office365.com
 (2603:10a6:20b:467::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26 via Frontend
 Transport; Fri, 1 Apr 2022 10:48:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Fri, 1 Apr 2022 10:48:49 +0000
Received: ("Tessian outbound 9511859e950a:v118");
 Fri, 01 Apr 2022 10:48:49 +0000
Received: from fe45112dfa0e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AED46784-3976-4A29-AE50-AB64376804F7.1; 
 Fri, 01 Apr 2022 10:48:42 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe45112dfa0e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Apr 2022 10:48:42 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by VI1PR0802MB2463.eurprd08.prod.outlook.com (2603:10a6:800:bb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.25; Fri, 1 Apr
 2022 10:48:40 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310%7]) with mapi id 15.20.5123.021; Fri, 1 Apr 2022
 10:48:39 +0000
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
X-Inumbo-ID: 54648ea8-b1a9-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEKykf52DuEtf1a1mew0plP3vJPU1E8gyopbvTGoZGk=;
 b=udlT5s7Jur0o5KWOyqvfT0OFUS09fSrmlfzR5s2Yf2h4Acqga69j/VfX3lQN5hhCE00UWz0aFyNx+cfQq5IkGr/64HDjWm8NrHG4WSkVPOlEcVOP+STqpM8DtSz/ZbqHKTvMOdauWX4cfbzYo0amqCWiit/Az5j8L2dIPBT9HNU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 01a669ab249d34bd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1RMgAfn7FM7pznBpDiwAhzxaEb1JfLAvMggA75zSExEeSCQPspmAz3K1eb+4aHGnhjETLTnc+HsbLHzNCXoz3wIfRgy2OMSDlk0z4v4oXhyC3U8qjTZchXyLZSA8AmMJoymfgS/PJouu1lawU72xADmW7Cvnh7xHgVEgpYUEKcrAGgE7ldyv6rDsFv7Dimb4wOIHiJK66gk80olxfdWpvJqUmiclrWfsZ6cjBJc7v5GAJsdsFB4ZgkSRDBnmm5Dk2RG4n0yl1dEApWpu/EErsIuOgSnj11waDVcS4p7L5LNJ9OCmsFSS9R6XzF8QljZNO7PsB4Dflqgsfn294JePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEKykf52DuEtf1a1mew0plP3vJPU1E8gyopbvTGoZGk=;
 b=G9cfuZm7zcnofEC4IdWwXDiWWNsEtq0AG3hWf3k3sBQqeRHcyY5ElsaUBb+BSN7W0xWxdrkyEkP8Uz0nuKGFcUqsrpSjoNlhpTc3eWHKa+GELIGefQHgmzlZ7SHDhN2kLWnrG3ocS7f0v7qOwzkIpHAWE09lVgCnqO75/Bc9Ia/n4GQPJ0WqfbQL5E9XVZjqAqhhk8drGRv9fwAyfpyd5cyBkixGkA/ThyUsceeLGFZapE5eatw7zgdotAceQ9xzdzkd03q6mc0wCX/4REAyXg6TqNAaCPmv/Ze8vuC4fZH/AqbyooldpFiDW0TsbIsZV+k0aad/H+ms5CQx05FzOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEKykf52DuEtf1a1mew0plP3vJPU1E8gyopbvTGoZGk=;
 b=udlT5s7Jur0o5KWOyqvfT0OFUS09fSrmlfzR5s2Yf2h4Acqga69j/VfX3lQN5hhCE00UWz0aFyNx+cfQq5IkGr/64HDjWm8NrHG4WSkVPOlEcVOP+STqpM8DtSz/ZbqHKTvMOdauWX4cfbzYo0amqCWiit/Az5j8L2dIPBT9HNU=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "Volodymyr_Babchuk@epam.com"
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v4 9/9] docs: document dom0less + PV drivers
Thread-Topic: [PATCH v4 9/9] docs: document dom0less + PV drivers
Thread-Index: AQHYRWD5icllAQcba0eQJpqKG1AfDqza4VQA
Date: Fri, 1 Apr 2022 10:48:38 +0000
Message-ID: <E19EE48D-4B06-4D02-9DF1-21830FA56AB1@arm.com>
References:
 <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-9-sstabellini@kernel.org>
In-Reply-To: <20220401003847.38393-9-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: a92cf5cb-6a36-4532-f8df-08da13cd3452
x-ms-traffictypediagnostic:
	VI1PR0802MB2463:EE_|AM5EUR03FT024:EE_|AM0PR08MB4241:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB424168573000606CE52A526CE4E09@AM0PR08MB4241.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rb9GBvRYV2/PqDY+TculpqR+Gd9Zj8oZq5uBJjsivHgm2dpCQMR1BM0t+zQocvQclOUtI1q6p5oPfUoFMJECmYy/lsMAg6a6euBXsH9y8YL2K542hoEDZY0xnPBC8qfDV1VQ3FJ+whK8oaqmUx1wguyUVx1ywGm9ZobEkM9b5HydYglv9QU4huDCKapvU77hI1ERNmk1jnnWGQ8jfCDYx40dvdPjeEUdhe8Js39YCL8JfpuBBnRP07sXbFC6s6C7qsNC7W5r0B/pCT3S6lyidCL4JXglE5YYW6P8s00Hnv5beBsvHjF9Yt9QkyQBAyKdz2rT/wLJivHOI1ZivFhUt23P4H6esxcZ1i79ikW/B/2CmV+SVpmR2xZOn8c8hQ/VCLnH2ULFX5ftxwc+YBD9NulLhUCpRvZ5ZoUvywh/skAyldiLn/Jx8bwpSitSuQYcnGLCsYmvsk0nsWjjDbO9rryrcn9rDdw5GVXmpMuio0Ac0aEp3RNIcrbahip/JMBmig+mgNWuIRezaILcZ0TBco/mMaHPS74HQwP1oo+QrQIFc9BNvLSnQk+85aMsaIfgt7ta0ZjFd+qdVLOKeIXDGHYkh/kqoVTfpEkcKfF16IgsFSaFad+xEUfPASEN5GCqN8OZGjmDXety6HOAelQ3N+JpvrJ3Hu6U9Ug24OlS3YkKMre4y13pmaCo7WYOApy4zpDQ5y26R7k3RsMj2bx8C4jFxk3jQdJGkvV6MACRamorgnn5p5PHys4FGqcl9QcJfMaIckNEfXnhbVtBN48Olw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(2616005)(558084003)(38070700005)(186003)(2906002)(26005)(36756003)(122000001)(76116006)(6486002)(71200400001)(8936002)(86362001)(508600001)(5660300002)(8676002)(4326008)(38100700002)(91956017)(64756008)(6512007)(54906003)(33656002)(66476007)(66446008)(66556008)(6916009)(66946007)(53546011)(6506007)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7D7B7919B2B885409C48ECF339ADE65B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2463
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dcc138e2-6b48-4dfb-3816-08da13cd2ea4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V884ht4JSFf3xjSvMMd0HhseL6nSeIM6/txyze9C2gdsxRREaTWv6OQZDeCa++rxzbGRLL+rUeuxPUw1P+u5SAspARjpljHw1LchmDXqB4tjZ+10wSMaxqm5YrVAknVfFvdMJ8czOweIXTJE/VEN4dZ4ARk13QCgCsgZF72mn9QFe/tZskQsC0CsbrByleDC6QWAkS5SeGZJ9+4UVRFODykuoe6tfGMxSxZCXkRmsvwQX6Z0Sz+g8aZP1p0wazh93ieei/sM/hPqR3+gHPjaRV/3k3IvK28ls+wfMweWkQT2n00/kw1fsyYJDubGbQwtpxGQFyFrMbTBt6k8LcEaRt32qFzxGFjMAYkumtBXRcPm/dbR0iYI9xfFKScUce09HxAHI6DoCnl7jqS/+sCXaVJ7AKPKfWgKXiIP04SyX/n0SqRmbj6ui3NZW/31DGYZMBsl7ek1dCw0GPrg/dafI/eO0TBUiFdrpS2wiEgTnk5OkgXRx17TkcBPtfml9CAAOQb3N2ecqnSd730XZ4ttpxJwjY1BVS9zSCVCld4MLbP6L1iIquOQRRtvc2KnDrqgDPqtlJ/Ic7Gu8Syr0KxsmvVx0Ld4P66aNgzo/0QnbbyH+7W/kzVLKMYcM/bfF8mr46zfvNoat3ZvPmkLEJoU1fVn/gywT+Gzg7L4w4XpkX+365Y6AM/1p7XH2IbNho4x+v2GzhvHljpfkKxHMoM5sA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(26005)(54906003)(82310400004)(186003)(47076005)(6486002)(336012)(86362001)(6512007)(508600001)(107886003)(36860700001)(2616005)(81166007)(6506007)(40460700003)(4744005)(2906002)(36756003)(8676002)(316002)(70586007)(70206006)(6862004)(356005)(8936002)(5660300002)(53546011)(4326008)(33656002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 10:48:49.2797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a92cf5cb-6a36-4532-f8df-08da13cd3452
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4241



> On 1 Apr 2022, at 01:38, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>=20
> Document how to use the feature and how the implementation works.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Hi Stefano,

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>


