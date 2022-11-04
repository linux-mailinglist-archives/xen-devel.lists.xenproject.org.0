Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F07619D56
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 17:33:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437774.692250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzcd-00036J-Ti; Fri, 04 Nov 2022 16:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437774.692250; Fri, 04 Nov 2022 16:32:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzcd-00033u-Qc; Fri, 04 Nov 2022 16:32:47 +0000
Received: by outflank-mailman (input) for mailman id 437774;
 Fri, 04 Nov 2022 16:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAq3=3E=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oqzcc-00033o-5B
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 16:32:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20062.outbound.protection.outlook.com [40.107.2.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee23a7e-5c5e-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 17:32:44 +0100 (CET)
Received: from AM6P191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::35)
 by DB5PR08MB10312.eurprd08.prod.outlook.com (2603:10a6:10:3c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Fri, 4 Nov
 2022 16:32:41 +0000
Received: from VI1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::58) by AM6P191CA0058.outlook.office365.com
 (2603:10a6:209:7f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Fri, 4 Nov 2022 16:32:41 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT022.mail.protection.outlook.com (100.127.144.146) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Fri, 4 Nov 2022 16:32:40 +0000
Received: ("Tessian outbound 58faf9791229:v130");
 Fri, 04 Nov 2022 16:32:40 +0000
Received: from fefdb8aea9c3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C63A29B1-2812-42BA-B182-8097DEC3F36A.1; 
 Fri, 04 Nov 2022 16:32:33 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fefdb8aea9c3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Nov 2022 16:32:33 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6142.eurprd08.prod.outlook.com (2603:10a6:102:ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.8; Fri, 4 Nov
 2022 16:32:30 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 16:32:30 +0000
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
X-Inumbo-ID: 4ee23a7e-5c5e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aZVqpJuZ1HYAgA1Y4VKdBE5PBiAx5edNoVkQDgaSbhHxymUyFT3oCXibiD5y1KI6yPHk1wTJUDUGcMTUwod5FBt+L9CA0h1w1j7IUr4bDY8WMybMeyynIzqM1d98dbT9EvceKy4KylWQIEuwLIqtwsluzOL6xwgpLQSDaknyERk0BnunUzoGOofU3sW5orHscmFppeyUsQl6cntRd1UQo3x7NB4n9yvfgB8WlzXYM/Ydad1UFqLh8qTHbYuIoJ+vqoydcLhNMzsClQVFlw++6tbBirRhAkmmP0Opv33A8xEjg+nX+yRatLKx/XfX9lvuFF72lzATWF2B1wvBLP+/hQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80AthlkCP9ESVYijKAHCQxARwimk0xrGDbtTfMDxJok=;
 b=LkuZcl66SYRb8ogCkV2OqgjHilB+gtQxx31q4nPTs9Oj+2puC0d5jMCg1T7IY8mizS8YqGyZshfdxE/XRepUSdxruSkSx/Yzemnz36zVNqQQqufFUkxtTQczRSF75DCVkwwcLfsnnAAvwg63xP7KC8pz9+TMJiOjIV4HydtD4katoK+QBv+Ur0gKbHRx0ycie0XYQMNVymi2VNTJ41EoHjpEgIvl+b+IH7TFx9NYCHhV/aAZYIhUnSm5625GifJwbn6nFm2/RRcBj+amJBAmUBVxXVODBmpzFyPsWpuVn+cNiofjSlkA3Nfiq0QzaQY94oXvSFsEjIJNmvclopsuHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80AthlkCP9ESVYijKAHCQxARwimk0xrGDbtTfMDxJok=;
 b=78tU/8JtnmzBQ1CGRoIhpiDq/ElKEjwRU08pggAA7pLsuvo7hXRR7KyxiCcgBB/kQpoCq4e20YQwuzuXXoYwhWpX/+0huws3VfK3Xzd1jUv8rtEVrQgD9dXSSVWyNb+CYuGVMbnlMb9xs6uS95IPPG7bpkwzBOVHxVBmiFKRjeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0cf7705b7e31f43e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N6kx0H6/1GDouflvF4qBS89iYR/y6dMD7b9TZ/yKvHU8yuCNnHEN+sS3/9REeiWC47nDGX8NFKQFBlUznEZDq8M8KAaTXVIO+PfYuV3TJnygGXp4/cgi9hKch5F8M2LgF5Tw9qNK9PkIjE5dKQa7UGu8M7WaP6zNUh14PV67IMGFwRAERYOaP9fk0i7BVMG8zo7xmIhSJViu8Lg9sZRxKt6Wk6vk9XxCEeZl9PZjfctPUJ0fnN8Xj27r3uFYFj9vqU4hn5Ryq3GRdBfXdq5dg11j2AqXwYlKHorQU3WcdRhFnhVTVk7ltonKEC9FGtkD05HH7PGkZmbWZyXk/uYqhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80AthlkCP9ESVYijKAHCQxARwimk0xrGDbtTfMDxJok=;
 b=mI3mK7qj5GQKbILAF+puEUVfDbAcbIKJBIkJCkOjGQqO+J5jrNogulKPndMM5GNMWwdKirM54n/PRbjcKSqK92hoC+P7svWCgObp8/2BQ6XOeJVrF0+1mvIreWtK5zTfzK1CHxArc5HcYXY4ncupPvoQ/lVjb/nbYaf2Daf8wkXiHvo1i9mbIjtfwZAKGbopD2QVWyxoDsgiZnB558t8ATAgFrmncaDyx9iXUsxawI4ufRWZPfPDvFgco84T4WBiuDy4JSgh5PITEE8pY23V56WjJl9E1LL4EG48GwZl8Iv8t+8yL8XhHEF7f4jBWuTpx6XJJC+TuJNeG3cotGC2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80AthlkCP9ESVYijKAHCQxARwimk0xrGDbtTfMDxJok=;
 b=78tU/8JtnmzBQ1CGRoIhpiDq/ElKEjwRU08pggAA7pLsuvo7hXRR7KyxiCcgBB/kQpoCq4e20YQwuzuXXoYwhWpX/+0huws3VfK3Xzd1jUv8rtEVrQgD9dXSSVWyNb+CYuGVMbnlMb9xs6uS95IPPG7bpkwzBOVHxVBmiFKRjeQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, "stefanos@xilinx.com"
	<stefanos@xilinx.com>, "julien@xen.org" <julien@xen.org>,
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
	"michal.orzel@amd.com" <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayankuma@amd.com>
Subject: Re: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
Thread-Topic: [XEN v2] xen/Arm: Enforce alignment check for atomic read/write
Thread-Index: AQHY8Gnh8hKxIKIkAUWHK4BT2/fYBK4u9TuA
Date: Fri, 4 Nov 2022 16:32:30 +0000
Message-ID: <3169C761-EA1E-40BD-B423-38399A798842@arm.com>
References: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20221104162355.23369-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PA4PR08MB6142:EE_|VI1EUR03FT022:EE_|DB5PR08MB10312:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d263a71-fb4b-4507-9099-08dabe823156
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JP0NnYLGOkviv7HxRwIAEYsMBadmymE24a4DW0D6IoTaapNDtVQhdoduZ3IZM3DocVr5d+K0hqnlno4EjNgX8clPnvzZZStAZikGNW8uE0B7fb6tmkZwevT77OyPjXUS6vljuTztRA143VdzWzUGeSZ7GRd5LDuN4P8VdWCZrxEKgAclAWakns6p5uxEtceyEHDx8HS15XsSdiUmi9IXEadvgY4yvFCSyy2Ip6jVXQ5bM7oIe3zmnUMY8+L7/N6Eh1ux/mk/6hPeWQPYBB8mSuXn9p3gAx2i/MyIC8SYncqSFotRbtz33kaK095C2mIOj2nY3v1C+PMftfsVB4EgP4iNVha+aXsygrgcV1oyK+RTEEibNMvRKppH6X9cGW7Na+09YXe8UCj7NbU3NfPsEnfIe9stvfbspwqNgDPXTWR51q5QsGjXtAyZxyZq6HLwDU4CHKsAYJwx2YrvtdFWoo96EgUZ3wMACbarY9kVq8dnZdzigSoJNH2OY7gCohKefa5SQYdgFL21RrQEcLxz6cqdcHKi16JHnOvTKt3XXw3m3E6tX5WRljUfaYqBxpb0x9NCWBmDplkdFfw/7Oh/l2aRjx1mw9iUGTmL5a4qA43UUnkOTdQbe+saeIFMJnQESrcd02wUjO1PPt6WhRnq8wtVYfFtzyWzPiPuxQcDZ93ge+RpIFAUoql0enE+VTvOG8h70jR34mTZeGx6ImqVrJCyL7kQdZg/D90Dp+SsQQDNc+NoeDBPpWIWEX3LnNyFZuS5exwX+0EZKcVMLVmGAdpxhbPsuZnDn/NOnaf0/8w=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(83380400001)(2906002)(36756003)(4326008)(6512007)(8676002)(64756008)(76116006)(26005)(66556008)(33656002)(41300700001)(86362001)(38070700005)(66446008)(66476007)(66946007)(122000001)(316002)(38100700002)(5660300002)(54906003)(8936002)(186003)(91956017)(6506007)(6916009)(53546011)(6486002)(71200400001)(478600001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <39CBFC446C96844FA404B94189EDCA4C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a2048373-f35d-4634-7841-08dabe822af0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/zlvNRe95CC82E7/mYY8oyA0JIfWxHZCU87Mj+qkKk9ALasMDIxxh7AWxsti4NgpNALvNMBxC1Q0IDIsJuLV+7Uss8jEldfMiMB+t2AjaOkEUjPg4AQd67zmFSNfl4TFTi3frq+opuj/Ma5TLtBheNqd+heQu/uEUxwjGA++JIL5LaEHmuEsOBIUHmtV7OmIzzXeEd31Q1xmgQRMeQWEyG84DAgDwAn2/GUb5k223PtgzOsKEnw7/9gi3rDXRzJNRV5dd0dDQO67XSi6nWMCt3gsjn9JpK2Oheumq3bIrC4Fl3SjQb2f2poRLfL5TTId8/8AzkFzuqK85Qic2JZvcB0qFnrrIprXoz3dHt6U1UE/4bTM9Vd1d45i//AvgBjgsi4Du3wKopbSEqvovtTPLkMbEcMGf+MyuzpCf41PoW29zT+gh9l8u1xLOepy6UgBEH+rGM/15FRGrIvHxhqVzzSiUVRBQQAX8pF0ZGq55hb/OaanLDb2O8nGmD9FI9HQJncgqvJxZR2WsSInGcXW3lW++lKwekYsz5xU2MNfjZPRStO7zBhSwlVCUFTp2mSu2kCUYp8BYtvzqLiKBO7w30nl+71X/lUPWQMw/yaZ0QTge0yF6n1HXhLvNQmNyheuNPw5v8NbrrfdW/EMPmppslz09yieuqUxKnxkHsLxps4xAI4Ijk3kc8Vjbbb7AnzEyHGOO1QJUHQ47e1c3Wp/DKG2v4/rP2d1mMXmF043Mdm+9POhWvmEuYsXIwQmi5QDlp9HLkeJo23EgXs7zkSfEQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(6506007)(33656002)(5660300002)(6486002)(53546011)(26005)(82310400005)(6512007)(82740400003)(36860700001)(478600001)(86362001)(2906002)(36756003)(2616005)(54906003)(316002)(47076005)(40480700001)(40460700003)(186003)(41300700001)(81166007)(336012)(356005)(4326008)(8676002)(70586007)(8936002)(6862004)(70206006)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 16:32:40.8035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d263a71-fb4b-4507-9099-08dabe823156
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10312

Hi Ayan,

> On 4 Nov 2022, at 16:23, Ayan Kumar Halder <ayan.kumar.halder@amd.com> wr=
ote:
>=20
> From: Ayan Kumar Halder <ayankuma@amd.com>
>=20
> Refer ARM DDI 0487I.a ID081822, B2.2.1
> "Requirements for single-copy atomicity
>=20
> - A read that is generated by a load instruction that loads a single
> general-purpose register and is aligned to the size of the read in the
> instruction is single-copy atomic.
>=20
> -A write that is generated by a store instruction that stores a single
> general-purpose register and is aligned to the size of the write in the
> instruction is single-copy atomic"
>=20
> On AArch32, the alignment check is enabled at boot time by setting HSCTLR=
.A bit.
> ("HSCTLR, Hyp System Control Register").
> However in AArch64, alignment check is not enabled at boot time.
>=20
> Thus, one needs to check for alignment when performing atomic operations.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com

Seems like the R-B is missing a >

With that fixed (can be done on commit):
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
>=20
> Changes from :-
> v1 - 1. Referred to the latest Arm Architecture Reference Manual in the c=
ommit
> message.
>=20
> xen/arch/arm/include/asm/atomic.h | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/xen/arch/arm/include/asm/atomic.h b/xen/arch/arm/include/asm=
/atomic.h
> index 1f60c28b1b..64314d59b3 100644
> --- a/xen/arch/arm/include/asm/atomic.h
> +++ b/xen/arch/arm/include/asm/atomic.h
> @@ -78,6 +78,7 @@ static always_inline void read_atomic_size(const volati=
le void *p,
>                                            void *res,
>                                            unsigned int size)
> {
> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>     switch ( size )
>     {
>     case 1:
> @@ -102,6 +103,7 @@ static always_inline void write_atomic_size(volatile =
void *p,
>                                             void *val,
>                                             unsigned int size)
> {
> +    ASSERT(IS_ALIGNED((vaddr_t)p, size));
>     switch ( size )
>     {
>     case 1:
> --=20
> 2.17.1
>=20


