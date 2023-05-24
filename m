Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D770F039
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 10:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538815.839069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jXD-00043R-Uk; Wed, 24 May 2023 08:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538815.839069; Wed, 24 May 2023 08:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1jXD-00041A-S0; Wed, 24 May 2023 08:07:51 +0000
Received: by outflank-mailman (input) for mailman id 538815;
 Wed, 24 May 2023 08:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1jXC-000414-5j
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 08:07:50 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11e971b9-fa0a-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 10:07:47 +0200 (CEST)
Received: from AM3PR07CA0148.eurprd07.prod.outlook.com (2603:10a6:207:8::34)
 by GV1PR08MB8033.eurprd08.prod.outlook.com (2603:10a6:150:9a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 08:06:59 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:207:8:cafe::a2) by AM3PR07CA0148.outlook.office365.com
 (2603:10a6:207:8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 08:06:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Wed, 24 May 2023 08:06:58 +0000
Received: ("Tessian outbound 99a3040377ca:v136");
 Wed, 24 May 2023 08:06:58 +0000
Received: from a303e1c0bd28.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8F477992-9084-4C47-9E84-6840C73B5DB2.1; 
 Wed, 24 May 2023 08:06:47 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a303e1c0bd28.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 08:06:47 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB8647.eurprd08.prod.outlook.com (2603:10a6:20b:55e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 08:06:44 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 08:06:44 +0000
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
X-Inumbo-ID: 11e971b9-fa0a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0VMxCLoQQPUr46kFOSiOFnCB4xFnkONu7nZ74zTObo=;
 b=Iq1wjs1bKwOszSNwffxMBH9HWgiAdgAGgziUimmP+/vVAHYBcKlDYyV4uchvGVZcU6hRnAcsImnzt5j0pEx9GNsWGIzFUqmE++iPRi1VT5YwYGCTKhmtZevz1C2X2R7rBtpgvIeGe/6aTfhyYy3TXBsW+Zvty97YUAwjMythm60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 090856cf2ef342ea
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geyn6l9T+apqosIKcCApIA6FieVvvUosXjKuez6ALBVZGytn0ixFznv7OEaveqg4W67KKcnNoc+qrwt9HOXbiH1v42wHJ5Co0YknnOa3mgxt8SdnL1lUl+pp6G+GfIUw4qtYJczo8h0586q0PZhK8D4bIVHjVInGjknbM44aunTogw3SJ6HFTP6RfVUoZ1uSTzlH6VN1hODIlSX6IBEyA2CFQHhaebp8dUB+LmUpEJl0Pu2CuN/ifdzPLAlhztx1/JAEEkic9Fa3do18Rw2GtPC2wggjKDLk6qafBQ4oZlTwDGOrq3uiwlrshnzcE1NAUVHQ7T4YFzDN5JfCqp2Ycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0VMxCLoQQPUr46kFOSiOFnCB4xFnkONu7nZ74zTObo=;
 b=Xh5IxK/qJMm0PSL1PsLpHVwm337yPmOSyQbDe/mQiRS4c2jWupH4kq+hNOIO5a3E1VgGyOUGkmwwyWHB9An/y3cW/XsBKq4Rea5IDtReSrHFC5emZ2sv/WYh3QSCjidz5p1gr4QDGU7/NGdAniccM+PsDQwBP3rHfsVDyV8aaRWnmFChN7AgQ048a8DW6Bx1duQ/cXrppwGedFl7Hx/aOAIYZHjXRisvsJjPk2lQHHFyPzu+k3zMigQvMXG09SqcRyvzTUdfhXWTXGWOTRMKZkEKWl3CiMRA4lrm5Nwl2sSuuhx2dj0Rq7f2BbJQOSt46/Xrba+q11XnsNJF5Im7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0VMxCLoQQPUr46kFOSiOFnCB4xFnkONu7nZ74zTObo=;
 b=Iq1wjs1bKwOszSNwffxMBH9HWgiAdgAGgziUimmP+/vVAHYBcKlDYyV4uchvGVZcU6hRnAcsImnzt5j0pEx9GNsWGIzFUqmE++iPRi1VT5YwYGCTKhmtZevz1C2X2R7rBtpgvIeGe/6aTfhyYy3TXBsW+Zvty97YUAwjMythm60=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [XEN PATCH 07/15] build: move XEN_HAS_BUILD_ID out of Config.mk
Thread-Topic: [XEN PATCH 07/15] build: move XEN_HAS_BUILD_ID out of Config.mk
Thread-Index: AQHZjZUa7+Qnm+197EOtmkiEO2C8y69pEiUA
Date: Wed, 24 May 2023 08:06:44 +0000
Message-ID: <04E10732-4D3A-497C-BA38-584B90216E17@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-8-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-8-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS2PR08MB8647:EE_|AM7EUR03FT055:EE_|GV1PR08MB8033:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb72240-3bc2-4bb5-1086-08db5c2dd934
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 EW4PJx4wluwgXPwAPOMpY2nAXSCq5LZNPRRf8v273UEvuu51b0iA8h1LUtpangv6jx3qMVZnn/jNXjM1DI3cvWEWN4IXqPKVNVRkjOY0cwOuRNhlsRVNMLDzmPoTzlAmyeP7fEvgS074DvJRElrIz/2YCYgvWNUGkYOxNPfweJWqbTcIYJf2nH9WNsIDBvQhvZIE5JfJ3z4RLlt2YbGnNBMJwFMSK84FJL96Sy0eKsYra8UNMRk9/FukYe+biH63U/RuwozqHDoQiy3+o5xG69L80zt4oi7w8Q+FSjt8F8Tf6z0eaqXB8vTXFmQv1PrrmsqIcSJkhNC2Bj/dBBL7jkvhys4W2X5p/s2zt0aPLwj6+3FriNQq9vpZ6DTRp4gagSCT2PcR9nFZZw+CiUyVxGCC3TEcjnfa0x3rLvAxuzuP7nejSbl/aGLAhs3EBrifiOc65UQiRPJRF6vH2fcEuRlNwMG3ln52kKAgX3LQI5PzAGXYFThM5D64DrjNUILfSKB0aIDtnqvBlncDuwaWRwdSRo+CVWq2sFLW1i8jrp9734Vrfyieeug5LUC0EYL3/d3theP/iaqf6jHdE1o47ZOMIkNgyiNS8YMd1nrqmJIV3IUxmLAamcilxuOfj34qIwFHC1hXKuy+6J5QNCpHYg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(451199021)(83380400001)(6916009)(4326008)(76116006)(91956017)(64756008)(66476007)(66556008)(66946007)(66446008)(6486002)(71200400001)(2616005)(6512007)(26005)(54906003)(6506007)(53546011)(478600001)(186003)(2906002)(4744005)(86362001)(8936002)(8676002)(7416002)(36756003)(33656002)(5660300002)(316002)(122000001)(38070700005)(41300700001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <ECC7305E4037FE49A447FCB8704D365B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8647
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	46c69587-32ef-4093-4698-08db5c2dd096
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nRr8G5F+tW2n+RZuwwmeOK+EVgEbIZ1K+vVJo1Q7MWcEMLumKT9Sc+QZxtx/fgVxAKl7TSnjVQfpuFD+UHV9GkoKS9YGhLKbPWE0PjZQaphnaO9z5N8DQMNDizxKFQrRAzWcTPdOxdLuIkbFFIE4cMRjuuae6ICKUJ6FXWhelp2xTxTCoi44BN0pf5oCTga1au3DLSF9/FI/ndFnyFVLyTH2oqykOIZkmZ037mVVRIml+X6x2h34Ng4U07Zw/G+tyPNLHpJYmYBybgERZcVQZ04SAkWtFlXeVhCdMZ8izihhCqZGMMUy1Tl7ByBdlPknjti4WyeAPacMhsq7Uep0mauitY0i6QU1jKyfia6AfEw3mvRR5zlVMSinAJG0HQ21HRnAMm8tSmbP5m8OD3WSi5NkbpKcqmNfZm7bgMFQ3nH8t7mmYgnWjQTtZ+a498+jOJxIz9d2or6kODRABtrLawW633NYtxTYxdPr8NOrfsCDflUAEDSWD827FQyq+SaRWfgliF7qYUm6Jg4LBJJLgJhJ+dPJ/O/DqZgP5qOgxtdFzwX44X/WU7md9zuSKFj1qGOqps1zPb5B1zQ7mqN1WTDqM+VsNXtOI+4a2dXgPJXd/3+kLsRdS2KXhIsjx73Lf+U59dUm95KjrYCptosWnPVuY2MkuqNtXBgH23BTreF6QG5zQWu5fjkBoZtN8qECqSQ+4XiWJc7A0oQgnslo8WtSWqvwMGDtNA5dvKdFsGs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(6486002)(478600001)(53546011)(54906003)(47076005)(40480700001)(2616005)(83380400001)(336012)(36756003)(86362001)(36860700001)(40460700003)(33656002)(26005)(4326008)(82310400005)(107886003)(6506007)(186003)(6512007)(316002)(4744005)(2906002)(70586007)(82740400003)(81166007)(356005)(8676002)(8936002)(41300700001)(6862004)(70206006)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 08:06:58.9783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb72240-3bc2-4bb5-1086-08db5c2dd934
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8033



> On 23 May 2023, at 17:38, Anthony PERARD <anthony.perard@citrix.com> wrot=
e:
>=20
> Whether or not the linker can do build id is only used by the
> hypervisor build, so move that there.
>=20
> Rename $(build_id_linker) to $(XEN_LDFLAGS_BUILD_ID) as this is a
> better name to be exported as to use the "XEN_*" namespace.
>=20
> Also update XEN_TREEWIDE_CFLAGS so flags can be used for
> arch/x86/boot/ CFLAGS_x86_32
>=20
> Beside a reordering of the command line where CFLAGS is used, there
> shouldn't be any other changes.
>=20
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>


Seems good to me!

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>



