Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E383C26A7
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jul 2021 17:12:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153740.284034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sAR-0000Xm-KE; Fri, 09 Jul 2021 15:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153740.284034; Fri, 09 Jul 2021 15:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1sAR-0000Vh-Gm; Fri, 09 Jul 2021 15:11:51 +0000
Received: by outflank-mailman (input) for mailman id 153740;
 Fri, 09 Jul 2021 15:11:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bo+/=MB=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m1sAP-0000VI-Me
 for xen-devel@lists.xenproject.org; Fri, 09 Jul 2021 15:11:49 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fae34f96-e0c7-11eb-85f9-12813bfff9fa;
 Fri, 09 Jul 2021 15:11:48 +0000 (UTC)
Received: from AM6PR0202CA0054.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::31) by HE1PR08MB2666.eurprd08.prod.outlook.com
 (2603:10a6:7:2f::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.32; Fri, 9 Jul
 2021 15:11:46 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::79) by AM6PR0202CA0054.outlook.office365.com
 (2603:10a6:20b:3a::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Fri, 9 Jul 2021 15:11:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 15:11:45 +0000
Received: ("Tessian outbound 329e6475aa72:v98");
 Fri, 09 Jul 2021 15:11:45 +0000
Received: from 73943b131325.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C98C05F4-34C3-44E4-94F8-3867ADE80521.1; 
 Fri, 09 Jul 2021 15:11:03 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 73943b131325.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 09 Jul 2021 15:11:03 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PR3PR08MB5770.eurprd08.prod.outlook.com (2603:10a6:102:87::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Fri, 9 Jul
 2021 15:11:01 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%8]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 15:11:01 +0000
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
X-Inumbo-ID: fae34f96-e0c7-11eb-85f9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly/jGwJSTuKTo5IM7EFHb6rlW8MzAtRJMEWFJ8/GNTc=;
 b=IQ7QTyFfobR0BTVewjgHipRRT47aAkAM9lab/+i3pd6gwRnHEJgTargPxLyBrupWm3upQd3Fh9VUq0mSh7L1apSeDwVe6bTiyXYsX5aDApwOUHYOpsXE2DHnRD4txVaFiqkMXvnq/9IHC8+/lgPF6ms2LIdBOJGodxGO31an2Fk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 19aa48cda8627b84
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnmxTgv7kxm7v2qBdIjvkYQzrT8umNs+4ln/SE8wu6vUlchvaBzckFma2fKVhkW7E93vPNRNoqqpI+uO3IGj1uxa6VpHE2StKVHja9mIoArEi1tJV19nlmhixCjirCdxFUTGE81ad7Ol0L+YJoHd8M9cCgu4Fet+ttvT2R180M9m1nWdyxwn9j/GT3H/YHfs2U+ITZisSXo9f6/mtW3ueRjaHv11aU2Z38CLDpuF6TcCzu43S79/kpSIGuPeRV9EpB2AaVFEbBAVSSz9f50cxZtm9aM5xoagXGastQVCerOS6+ovApTR2QgoERqgKMkZWZakyS5GPSz00SNZPygaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly/jGwJSTuKTo5IM7EFHb6rlW8MzAtRJMEWFJ8/GNTc=;
 b=WoGZHmA3/NSqh2a63BUX/4zPfo04Q71PtoSJ2fe/vTDl5y7pgqhtRSHRFKykKMsUdgbJqRcXl0YadqUwZTiOBa+sRvsoXXoeK5EWl2LopRUpa6Vf2+pZWJ0UHS8qDmFZQ7b3YQ1uhiOjAQE0gL0o3l2uKu1LzAasWCSdAIQjKNipiSQ/JvwgzC73z7drdEDQgjphQQkzGlVnKnj1PSnMlg/aDoTalFO8VvdQSFw5zFWwe3dOynDYR+PUmz2pU9qRz8fM6MJUQAaLyO31dWvwNhCBd6dmD0jQphiejgRrZi2KMYu/D7f5uE9cLSMHEXyoGpjefAZaS8qiXz7Dhxpw+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ly/jGwJSTuKTo5IM7EFHb6rlW8MzAtRJMEWFJ8/GNTc=;
 b=IQ7QTyFfobR0BTVewjgHipRRT47aAkAM9lab/+i3pd6gwRnHEJgTargPxLyBrupWm3upQd3Fh9VUq0mSh7L1apSeDwVe6bTiyXYsX5aDApwOUHYOpsXE2DHnRD4txVaFiqkMXvnq/9IHC8+/lgPF6ms2LIdBOJGodxGO31an2Fk=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
Thread-Topic: [PATCH v2] xen/arm64: Remove READ/WRITE_SYSREG32 helper macros
Thread-Index: AQHXdL+w0n2h/dQ/DEuP6N84Q1GgYKs6v8AA
Date: Fri, 9 Jul 2021 15:11:01 +0000
Message-ID: <FB2FEF37-4BA3-41C0-B517-3834D7B1EAB9@arm.com>
References: <20210709124035.5520-1-michal.orzel@arm.com>
In-Reply-To: <20210709124035.5520-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6ff2e220-b86a-49e6-834f-08d942ebddfc
x-ms-traffictypediagnostic: PR3PR08MB5770:|HE1PR08MB2666:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2666BA4869BFB4B732EAB2C19D189@HE1PR08MB2666.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GvaXmtd1T+QrYuzI/k31K+hh5p/OJIP2a8z99QP7mi+1FgjZP+C/EKxRbeUQ99LrOOqjp3at3oc8zUnXf8sslpkHqbCsrCSs9cHm2rFlJrZLsn1vQK2RtFDyqxhk1iRF4PSaMzYBKLq62y7khWD/ahmiVZivM5fpbrwdpc28XwiGd7HrLdrdJ/vf7cAB+5PeCM8o+x8cHN4yULGKYn9takDeAZDallJHE4/+N9bm8MkmZCpGk6lRgVbkgNxLD3RkMYiBysqprvNf2Nqpr88z/OzLsqzQBO66gMmXYm6qlu2OP0X29k4suvLgDzaanmufAT36WZgiXUGwUfi3VHnpPvuWR+CWl7Gq3h7PQbaCoApX5L3p2lI329r2jQkp/udBafq79zvp+knmeELVAj+LP/XHNOQBrGA+/ADYzU4vm+kKpwu8ZBR78f2oN4tFc17+sp4St8gm712JEtjdn+SZd1ZO4qI26eI0WCoechu2Bagaa6Z3urKMczgoebU5F0QMuruF4eUXH/tC6s8MYQBZYPAYc5ajoxfikcNeCVkhMRw8G9JH9lOebHRMvBMJ9KsJ3QMzdo4cv7Edz5xxe8qpAUOiGV+MzfuyDodA/jfhuUSJHfhzl37mG+dPr+ASlNp4laRQqm4E788tLNDK92WGsrinRLMTIQuejpqQsJnxFGP/PzAdmm2rRzG6pIE86Og1wv0E+68JruzCEJPLt4WWuQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(71200400001)(6862004)(86362001)(33656002)(6636002)(122000001)(2906002)(36756003)(6486002)(478600001)(53546011)(6506007)(76116006)(4326008)(37006003)(316002)(6512007)(91956017)(8676002)(5660300002)(64756008)(54906003)(186003)(38100700002)(66946007)(66556008)(83380400001)(2616005)(26005)(66476007)(8936002)(66446008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nZTwppuf+UR8Tn92xQ6eARDI1g/yEP5YpBj7oMg7kLfzj6EoHywnY6DjoQw1?=
 =?us-ascii?Q?mc9SLL6PGKinIvK0lhgRTb9EH0SDYlKFpzaphQia3ghdZjDx6PFBznV+iyZS?=
 =?us-ascii?Q?mQ24xIyYk3oOvQOfkAp0WSPPz0ayZmxqOILHonYSyr7najA/un70bVm2uzFj?=
 =?us-ascii?Q?C8RJVfAxnjPSZgBm6XyoWPEFcsHBoKhjJNZi9WTfBjl/NGKS0kEh3N2o6ZqW?=
 =?us-ascii?Q?L+HSDzKYdOpWoMTs0cPVIbw5r6FYei6vZCelJLSNJ753+G637ICQemiuZkk/?=
 =?us-ascii?Q?3Esn1TbkP2oFuuBcoXllhJmlqVmUuWsheTO99aQjireHooyRam0qVZOmUQAh?=
 =?us-ascii?Q?uw+/Bx1fe8eAO86+lM7+JCf3IdgtTsOo+2h5+WzG2YCBvRpScv5Ece0rSQgD?=
 =?us-ascii?Q?7DctNadm+Bsmesp8k4dPNBBPyXhHtB202pyVTUZqUw6VrgI9qkSsLm48vhTR?=
 =?us-ascii?Q?YV3pXomwX1UcwYwPz/kDbRucnbBwx8/K3q4lIHe51z/Q897wsFciytJCt5LA?=
 =?us-ascii?Q?KJdmvihL1qcH1m2oC9mt924WANdMgu7JDRCy1+lnN1JKSOZrHsOL8+VSL44z?=
 =?us-ascii?Q?z/H9dcYnUYQazSG1lzbwl2qUnHbPHJyIYBvaBBRzIeTsEJwv5dqwldGR5xdf?=
 =?us-ascii?Q?6IkwrkepdsFHhrCK3HinPUqtuPwxdQddvMhz6IS2dgpKKe9+cgdiuJnfJppb?=
 =?us-ascii?Q?lgEFVXusqBYT20o0KhypPqtC81idHhaZ629Zi7pYETxxDmVuesWeqwwuPyvj?=
 =?us-ascii?Q?od8ZO+05jkgTTzJZOedyGQCO1C1y+dl5wOQZzqcMX40et6vviwdy55vl2+8F?=
 =?us-ascii?Q?5DtGG0rDMu8lpOIzdFBR/xGrWyQvMviQtkwxfYBYmxuU6Lk+tSrhqCe0T5g8?=
 =?us-ascii?Q?phNdUnpbcdiqvnLD7Y6LPRNojSlmnQx6UD/Xw9I/tuzPr9uDJLTQz2koSQWf?=
 =?us-ascii?Q?JkZhJ5X+VSfefXGqo4ZnyJK+w8yBy+FlDdlqAqzJoBNOhw+Vn3sr49IiNxuF?=
 =?us-ascii?Q?jWcOODNijkPmUOs7C44L9Uh7Yyf5jRIHi000ppLM+OR3OjThtnzdcTImhwX7?=
 =?us-ascii?Q?SFq1u3NBa90gm/9SRZmzDCw/tXSthm2qmee+rajIyeQiiK7WNjBx7BplcCUd?=
 =?us-ascii?Q?KhnqnUsmmx3oSYCCLz+YuO/fRlKqcZoaH5QSUqwtqylnsfhLCtmoaUlDeYyl?=
 =?us-ascii?Q?/U2rdnhYWeq9AmZ0h/4fWDJy03NVpf3EM4kvjw1dWeLP3DFJXw0upjqi3YOu?=
 =?us-ascii?Q?Z5neDx78gx9og4ffdmruT5ZdCZSXuRWdhVF3ws6+2R89PJ0vLJhxhnuGNq3p?=
 =?us-ascii?Q?mzNqbpzz5aU4uHrM5RlUFIhb?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <40ADF417DEF1CA49A07497577745C937@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5770
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c3e4092-a9d0-4f57-2142-08d942ebc375
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gbVmNCe5pCw/L93EonLp+nWfTKvTi274axpnSWRBwI56qh9tWGh+lXm8pP0DoNu3R8LGcQso3AibZ57ybC3s/njiEDmTdfAtWGOMR047z9Ny4blBju5CSD6bG4Yzg07tSoEtYQU93gP4IJY3xfoF+SKQ2f1g8iC4RGiwgQjIFgcvY9aFrFxiaEL82OG78CKnVW8hIHAshMmSIhaPK3nFeThcWhSl0pUAcgnsoXeVpFvud8Ea4HZsmkazbmit8+wsznE4YgbJ28PFJEFSL9wzXh0cRWYCPCYWXDpW8LdhI5OizljaIN+ILY50PIYNz/3/I4WGxDh080L9ieHbYGFCmlWkyD+qhd4auB4LiMYesw6JVNJ642zXE/svk9upqZwgK+w/VAM7FvcYx1tDwdkabxOftqkRrcfNpWXl9ch5S46VZTl9oDEewwRUe9Z0JwuumBHXf8Fs/trd1SxPOrOqbqcqmmduM9Ay7ezP5GNBw8jdHxEhBaNx4+OKep/trZ6HUxtvZtyjCGazK0w9mDSccaivA8AMaj9Xv4nU+TzT9sYtcY2Go+K2vqZ897hA/bd0qYzEBq01fCsXd+VdXyZ1vVxClIEPYJ+Yf9p4OwaFmz0IsAw+lys1wil6tK28bIVgipWg3YPWF81d/Rq/Auknup9Rvtp0qoJp9MDLfM5NZY4Yc8a5peQJkVWCVIhcqVLyVeGlbmPJ+AxN3VS9Re2Cyg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(39850400004)(36840700001)(46966006)(33656002)(316002)(6506007)(2616005)(26005)(47076005)(356005)(6636002)(8676002)(83380400001)(478600001)(336012)(81166007)(53546011)(5660300002)(82740400003)(82310400003)(37006003)(2906002)(70586007)(8936002)(4326008)(186003)(6862004)(36860700001)(107886003)(54906003)(6512007)(36756003)(86362001)(70206006)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 15:11:45.7977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff2e220-b86a-49e6-834f-08d942ebddfc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2666

Hi Michal,

> On 9 Jul 2021, at 13:40, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> AArch64 system registers are 64bit whereas AArch32 ones
> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
> we should get rid of helpers READ/WRITE_SYSREG32
> in favour of using READ/WRITE_SYSREG.
>=20
> The last place in code making use of READ/WRITE_SYSREG32
> on arm64 is in TVM_REG macro defining functions vreg_emulate_<register>.
> Implement a macro WRITE_SYSREG_SZ which expands as follows:
> -on arm64: WRITE_SYSREG
> -on arm32: WRITE_SYSREG{32/64}
>=20
> As there are no other places in the code using these helpers
> on arm64 - remove them.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes since v1:
> -implement WRITE_SYSREG_SZ instead of duplicating the TVM_REG
> ---
> xen/arch/arm/vcpreg.c               | 12 +++++++++++-
> xen/include/asm-arm/arm64/sysregs.h |  4 ----
> 2 files changed, 11 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index f0cdcc8a54..10c4846954 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -47,6 +47,16 @@
>  *
>  */
>=20
> +#ifdef CONFIG_ARM_64
> +#define WRITE_SYSREG_SZ(sz, val, sysreg)     WRITE_SYSREG(val, sysreg)
> +#else
> +/*
> + * WRITE_SYSREG{32/64} on arm32 is defined as variadic macro which impos=
es
> + * on the below macro to be defined like that as well.
> + */
> +#define WRITE_SYSREG_SZ(sz, val, sysreg...)  WRITE_SYSREG##sz(val, sysre=
g)
> +#endif
> +
> /* The name is passed from the upper macro to workaround macro expansion.=
 */
> #define TVM_REG(sz, func, reg...)                                        =
   \
> static bool func(struct cpu_user_regs *regs, uint##sz##_t *r, bool read) =
   \
> @@ -55,7 +65,7 @@ static bool func(struct cpu_user_regs *regs, uint##sz##=
_t *r, bool read)    \
>     bool cache_enabled =3D vcpu_has_cache_enabled(v);                    =
     \
>                                                                          =
   \
>     GUEST_BUG_ON(read);                                                  =
   \
> -    WRITE_SYSREG##sz(*r, reg);                                          =
    \
> +    WRITE_SYSREG_SZ(sz, *r, reg);                                       =
    \
>                                                                          =
   \
>     p2m_toggle_cache(v, cache_enabled);                                  =
   \
>                                                                          =
   \
> diff --git a/xen/include/asm-arm/arm64/sysregs.h b/xen/include/asm-arm/ar=
m64/sysregs.h
> index 077fd95fb7..795901e1ba 100644
> --- a/xen/include/asm-arm/arm64/sysregs.h
> +++ b/xen/include/asm-arm/arm64/sysregs.h
> @@ -87,10 +87,6 @@
>=20
> /* Access to system registers */
>=20
> -#define READ_SYSREG32(name) ((uint32_t)READ_SYSREG64(name))
> -
> -#define WRITE_SYSREG32(v, name) WRITE_SYSREG64((uint64_t)v, name)
> -
> #define WRITE_SYSREG64(v, name) do {                    \
>     uint64_t _r =3D v;                                    \
>     asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
> --=20
> 2.29.0
>=20
>=20


