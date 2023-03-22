Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F84F6C4F5D
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 16:22:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513520.794637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0IH-0004CZ-IS; Wed, 22 Mar 2023 15:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513520.794637; Wed, 22 Mar 2023 15:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf0IH-0004A6-EZ; Wed, 22 Mar 2023 15:22:29 +0000
Received: by outflank-mailman (input) for mailman id 513520;
 Wed, 22 Mar 2023 15:22:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxM9=7O=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1pf0IG-0003e6-6o
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 15:22:28 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062e.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59d5509a-c8c5-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 16:22:26 +0100 (CET)
Received: from DB6PR0301CA0052.eurprd03.prod.outlook.com (2603:10a6:4:54::20)
 by AS2PR08MB10009.eurprd08.prod.outlook.com (2603:10a6:20b:64b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:22:18 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:54:cafe::ab) by DB6PR0301CA0052.outlook.office365.com
 (2603:10a6:4:54::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 15:22:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 15:22:18 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135");
 Wed, 22 Mar 2023 15:22:18 +0000
Received: from e740903bb7df.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B0FC001-014A-4674-9EAE-D81A26CD2EDD.1; 
 Wed, 22 Mar 2023 15:22:07 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e740903bb7df.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Mar 2023 15:22:07 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB4PR08MB8077.eurprd08.prod.outlook.com (2603:10a6:10:387::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 15:22:04 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6c10:9ef5:6e6d:56a3%7]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 15:22:04 +0000
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
X-Inumbo-ID: 59d5509a-c8c5-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS8IdW0ZgVWa9MP1baWDVlOvLAzK6/3o0few2DLWQmo=;
 b=IYm/TFF/n/YfD/EhYrN42iC9QlItZ4pMdQv/dtqWUCoA4B5+K8qXXNRw9A8xZgv8phmsYmVdYcD9WEADNSltHGYdGDxBRDNxGcaGkrFKxZXJm6oPvzVBxvkRW0+falwRRDIni1z0SdlGmk0M4v2PTLzsPI4te899bp22R10HBdg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41223d454be77806
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoT51Q+zLFCnClejhOSrwdwMCkeZf5eBvrJ+YoANCuypRoIKLbAyOChFRdfRQi/YXM8cahfskmsp1ad73V3rtk3C7pAGjbnd8n1naH3e+7SwydqXNp/lBvhbvGB1AKvF40UWDNC/VuSW9gByZ29oS3j6fLWNB0tFCdr3Q3+1flvs61u4NO0d8zPsn/nl/eIt0dyLeMqG8cXg4PPeMOiPin0qXk0cN5rHTJtLV4Ie0xJM3tV35lJVNvYVQ06NZwhAal7b0Ou5iSOh+aPkdlQnHzlPpynUAue2PkXp8+cimaRS6f7P7rlHkmI/wLGmEWAMVpFQdqWWCloBfpMD1CQimQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cS8IdW0ZgVWa9MP1baWDVlOvLAzK6/3o0few2DLWQmo=;
 b=JNYBS/H6KgOOp5DRf5QtIev1KIKSSetOpEXhst+5LVOVywSLm1hnqHFEwJriQXpwNBKwJNG3go4pb5SV4YdOYAPrjEIA2BzfndjPQ5d0jsxzKWNdYYjKKc2Ib9W2llf4rQRyFZZNwtUsSb46sgMzvMlLPag3Gfg4LNpD9Xk5R+4Wu6J4YOEbae79Xd470qBmjxWkTp+pM8CRBMXZd8QuIW9qsBA4UgfIEUM+Ryt1e0BBYfQ/AAvtW9+58HRICTYtEUNlVPDk56thx3+CekDN4EtE8TPCXjyS51U69y751oxQaBPSGzRaMhm2p8LbstAGPR1tYiKPC/Jih1uhVsRxaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cS8IdW0ZgVWa9MP1baWDVlOvLAzK6/3o0few2DLWQmo=;
 b=IYm/TFF/n/YfD/EhYrN42iC9QlItZ4pMdQv/dtqWUCoA4B5+K8qXXNRw9A8xZgv8phmsYmVdYcD9WEADNSltHGYdGDxBRDNxGcaGkrFKxZXJm6oPvzVBxvkRW0+falwRRDIni1z0SdlGmk0M4v2PTLzsPI4te899bp22R10HBdg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: domain_build: Check return code of
 domain_vpl011_init
Thread-Topic: [PATCH 1/2] xen/arm: domain_build: Check return code of
 domain_vpl011_init
Thread-Index: AQHZXKlUoZLZ+Or8ukSLI0BaT4Km/K8G6r2A
Date: Wed, 22 Mar 2023 15:22:03 +0000
Message-ID: <865C8083-8C22-4CEF-94EB-10CCC82DCC39@arm.com>
References: <20230322102941.959-1-michal.orzel@amd.com>
 <20230322102941.959-2-michal.orzel@amd.com>
In-Reply-To: <20230322102941.959-2-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB4PR08MB8077:EE_|DBAEUR03FT037:EE_|AS2PR08MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: b3aeb47d-f1e9-4bfd-ea98-08db2ae939cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 cMYFm+XO/iiEwuEaVDgzAyqh+1AneRoiofQqifoBZIkCXBtV8k8LbPey2CtHyveXRirnzeClJLHOO48Aox6GGvjKsElppsjGsup3g5I6yxVxN2UQ0rqB2NpjNGYDU7NQtwvTHRLyMtQca51ULDninY/LXyVCWFTc5d4Py5JZ3/JE8t86Z++fVJLwAqKuI6v6Sncy6vM1ejHsuK3nwvW8TEc/59PLdy6n+BN0xB+X3fO3vGYaufv0Q5X80GFBKBfgAZ52K5NzB+etH/1sZRS8kEO0gdz2E7EmMjCuQlS1SH5tQywSDj/IosUDnNzuXN7Wko9fdX+qwhu9H0IIVLSnDVHzDjS5Op628wxpGyxjJ2wQ0Cghah8w8fbg29o1rLUiyTqyWJhjxz2GipUh3E8+EMjYEFjtNujh0ETC0n8zYZVqyptkN+zpLZrZ91cXxM9awq7Yts65fakcLrqjWLBnlB39kz78+fXZKyK/pWcNmGhvw6yGe3iWuC9nOlvR0j/GP80rU1s66NzTxNNTjgt5fdb5usLtTm/O0GyHTJIiBOpKWzX4tIqLoqhb3K63/0Tt78tgdklfHDMvRo7Sz7lM52nhR5K6YdZ5VE8EnTceCJg8C7QAkwlvzUBluOhKiZIWyrHjBo8IzMR3hmTTA7uFACeSwH5lBwVf5vO3brHmWgQt6w9TdtAIcncC/8XxvgBlvRBFVkoY7t5IxttWg3lc1ZSJ2QRxgEkVD+KdAiso19M=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(39850400004)(396003)(136003)(346002)(376002)(451199018)(5660300002)(8936002)(4744005)(41300700001)(38100700002)(86362001)(38070700005)(33656002)(36756003)(2906002)(122000001)(6486002)(478600001)(83380400001)(2616005)(71200400001)(186003)(26005)(6512007)(6506007)(4326008)(54906003)(53546011)(66476007)(316002)(91956017)(8676002)(66946007)(66556008)(6916009)(76116006)(64756008)(66446008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EBC827F842C0EE4B96049F0958A651A1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8077
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	668c6f55-03ef-44ab-b716-08db2ae930e3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aC0oXfOZxriLG/sLpmjzWAHh6zzgnzfHB5kmoT4vDDPHNk4wHldDhZ4QR4s2rRl4fV/gQz9wADsnnhBS8M5Va8fofhH53LyFeceA/FwpQljFtl9ujb7KbvbSMKqm+mocVDsRz3L0C/T4D4/59C94IAeSIIKTkvJrH8WxVBNDCQCtp+IsbKn1uTNmkwI+t+GRkDpwoPTrvX5dai336ecxT0IXs1/1RNzrVLF+3KYGgVocG672DXrfuIXGKH81zmbAI/BoIwbUqaovjbrbH2MB/jZOuYweTy23hen8AeH7yXcMb0yESJhtToHgVCc2H6vPlqHJ3IjNoMLG0Cnf7KlnE0UetiejmWGv2GI/R9PkdEJsjGYrZKRvIpzQs9klYAK0pDMEdZjR/iskLzUD5yrGfoBncNEOlOpdPhZ0G8T1kXbexsTToyqU96BIz9vGDV9D2BsdpYjvwbieW2An58rfFeXNsr2RUadhL48gkg8PotjUzd0JccoaiXl7cNJyf+vsGhi3iygLP7PUIvKZJ3z+SyXZgzLA2llV15cNPZu0qhOz3BO1icWPiFdswbqnMtTSC6LshLPRL1ivj4NbJNxuVa+aJvMXbGe6KLY+n2XgDrIj0Dc64J4bMAvLwLlcezfNTmFrNVAnVq0tXebHSdtiVcSZMmFJ7BsLQVa5Etx4i4KiWVrymtz4ZlLDYWuwuaUjSE35u4fnAcpYvB6YQp5VYw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199018)(46966006)(36840700001)(40470700004)(2616005)(6512007)(6506007)(107886003)(336012)(53546011)(26005)(47076005)(4326008)(478600001)(6486002)(8676002)(83380400001)(316002)(4744005)(186003)(54906003)(70206006)(70586007)(5660300002)(82740400003)(6862004)(8936002)(81166007)(2906002)(36860700001)(41300700001)(356005)(82310400005)(40460700003)(86362001)(33656002)(36756003)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 15:22:18.8106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3aeb47d-f1e9-4bfd-ea98-08db2ae939cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10009



> On 22 Mar 2023, at 10:29, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> We are assigning return code of domain_vpl011_init() to a variable
> without checking it for an error. Fix it.
>=20
> Fixes: 3580c8b2dfc3 ("xen/arm: if direct-map domain use native UART addre=
ss and IRQ number for vPL011")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Hi Michal,

Looks good to me,

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>



