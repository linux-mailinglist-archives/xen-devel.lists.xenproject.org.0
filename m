Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FD441DDAD
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 17:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200051.354432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVy7B-0001Y1-0x; Thu, 30 Sep 2021 15:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200051.354432; Thu, 30 Sep 2021 15:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVy7A-0001Vz-Ts; Thu, 30 Sep 2021 15:36:52 +0000
Received: by outflank-mailman (input) for mailman id 200051;
 Thu, 30 Sep 2021 15:36:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v5L4=OU=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVy79-0001Vt-Km
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 15:36:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.83]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ca52ed7-5219-47c7-8323-646980ee4403;
 Thu, 30 Sep 2021 15:36:48 +0000 (UTC)
Received: from AM7PR03CA0008.eurprd03.prod.outlook.com (2603:10a6:20b:130::18)
 by DB6PR08MB2869.eurprd08.prod.outlook.com (2603:10a6:6:22::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 15:36:46 +0000
Received: from AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::d1) by AM7PR03CA0008.outlook.office365.com
 (2603:10a6:20b:130::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Thu, 30 Sep 2021 15:36:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT029.mail.protection.outlook.com (10.152.16.150) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Thu, 30 Sep 2021 15:36:46 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 30 Sep 2021 15:36:42 +0000
Received: from 398c540e35e2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9462DF97-B7F6-4C44-9D1C-ABAAEBE104FF.1; 
 Thu, 30 Sep 2021 15:36:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 398c540e35e2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 30 Sep 2021 15:36:26 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB5965.eurprd08.prod.outlook.com (2603:10a6:102:f3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 30 Sep
 2021 15:36:25 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Thu, 30 Sep 2021
 15:36:25 +0000
Received: from smtpclient.apple (217.140.106.55) by
 LO4P123CA0077.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:190::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.15 via Frontend Transport; Thu, 30 Sep 2021 15:36:25 +0000
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
X-Inumbo-ID: 0ca52ed7-5219-47c7-8323-646980ee4403
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbSXGrRM3PmYmiIcZVj8Bzx7c4oZSm6muisaMMkEUAA=;
 b=ZRCglczKFt7Fn5yRyp116JcSrxQyKX1FTUrp0HtHqYciVc0TIrU7EtBAOan57xeIdLB+/WI9meqonkAfk1vgFu2NxnCGki5fDoXVoDXHL7rcQB/7BRs9ipRXjjPXHj50sBvhBGmHPmBvbkfawUhdKzDYJcqRArCq5BmMVd0pKBI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d57b9af516319f8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V+eQqDiSVYO6e1uHq6YyuGgNaX2pq9LjkxFfk8EAsxhierwoYcOBoP/MbwVLw/m1+JL5Jw1VjDqCRLorb8LUlpZcXzntkZpXQr5zZ/SBGy1KFTV1T39f+A6TV6evzLA5+j28CFgn2r9k2qqSeOIISJYeqtei282iOPXR/kgLKkWTYVoma7AupZ1FgR8AC62gnInz0yaCQYALO8ZGQSaVqWAPmJIvLaX/1sLmOKGxxCG73YCg2vCZ2tTprTkg90daImRj0Y0d4PdCOolPKimwv15at0aPXWlLb0KsywH6BakydUenRPMJ0GDhi0jdzT0B03ZA9sRL34nebJpReQdn3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=XbSXGrRM3PmYmiIcZVj8Bzx7c4oZSm6muisaMMkEUAA=;
 b=mD5IN4wPpjuP/QSk/f9kABdqQ6KaG9G6MdHsYW1OCyZwKPYEKrY8pJIYMHBRgCBI1baLmr45WnfSR/gl5t8zPhP0PSzk7F7SVDOwg9UDCvgcavb4qVzW3W6tH70IgRqXXFvUqJ3fxJP2l519Ym3+GO3hFeV7RK8mZxKJp0CFtMnYpt/Mq9I8tANxhvKhnTUzQD2BOSPVQdi09fWhosLXOs7nYD9FecFsfUq5zOpTDkiwAb6TdaycbOjlAwfgYN5HMpzxn4k9lIDKZUtOBgH+a6zbSSgZs6LnhZABPW6r9trmqov/Kc0TDbD+eWEoAlbdQNzx84LysIAAEVO/EuUoQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XbSXGrRM3PmYmiIcZVj8Bzx7c4oZSm6muisaMMkEUAA=;
 b=ZRCglczKFt7Fn5yRyp116JcSrxQyKX1FTUrp0HtHqYciVc0TIrU7EtBAOan57xeIdLB+/WI9meqonkAfk1vgFu2NxnCGki5fDoXVoDXHL7rcQB/7BRs9ipRXjjPXHj50sBvhBGmHPmBvbkfawUhdKzDYJcqRArCq5BmMVd0pKBI=
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH V4 2/3] xen/arm: Add handling of extended regions for Dom0
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <1632955927-27911-3-git-send-email-olekstysh@gmail.com>
Date: Thu, 30 Sep 2021 16:36:22 +0100
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F7174E14-CBD9-47E2-86BC-4EE70D388EEB@arm.com>
References: <1632955927-27911-1-git-send-email-olekstysh@gmail.com>
 <1632955927-27911-3-git-send-email-olekstysh@gmail.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0077.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::10) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bd425f2-5346-4cb2-b1c2-08d984281c8b
X-MS-TrafficTypeDiagnostic: PA4PR08MB5965:|DB6PR08MB2869:
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB28691D5B36E42F19E5A877F7E4AA9@DB6PR08MB2869.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:597;OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 mZgnuy3XUFDYzAhxr11pY0GpbyzofxJtnDLX4bolGU0Gv0BHyS+/2q+jmV3ns1y5V6sBLOhJSTttjSNaFrVFWltyOXH6YzNzLPv8lHAXnIM0PYQqZ8TVXnU/YeEFTJ5h/sHWdUurC/2zvVTkvKDzZbgNAs1xBxjshYB0+L2cLBSZ6IG/20Ob7GnyGIyfYukVWvBlTQ0fQ6oQ2WLzsI97kGb4/idQx7QT617EHdubBbqOKV+KzYIqJaoa4w4x99ZY3+GareVAEtZOGy0M10mpufxj+0YO3t2h8GbIIvLsjSSyuRDQFD23ApztdhTLaXdATnUL9qRTLtfsqj7mcSlFmHZSzEhS/a7QWVuq17LRFcY7huZWQNt1KK8c2aP8SzXR4mZ18sqtZ6q9Op6tWzCl8iQVFTR2Q32CbR6wyhzZ9b2quwOL9FKQCHfuro/HnfQHsA3frjM7mpvHYFX4tZrbSmaT6UsxQVm1iIGBDSnlPUVr+2xgvXg9FllJ2arvX/qoGV4ZSdW/mMJnQBbT5Dp1JGIvv9mR+PSowH/bBFM/KK/bUDwK33pcFyLdYONLnf2916DAjnodBFZ77ZtxYCNN4MBEtMhlAgaVrvC1y3bJBUhJxKNvUGbG30IIXwZ8kOSCxRQDI7EopW/ae7jR31mkStZFUBgIQub+L07m4DJugK0prdS6ZTtx7FXK6c6ajVxRMAPhkYJFuEC692eQaQnvqSWxiF/8hG74+wlvyZdTP1EeFwemTVkVJf0+6aNxbisc70DUT5lMF7+/sIrw9l5EGrMtPKKVlvpjgJQJZCCrlyHqesIxa78laUR8SGDtwp37
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(54906003)(6512007)(956004)(86362001)(5660300002)(6916009)(966005)(2616005)(33656002)(38350700002)(38100700002)(2906002)(30864003)(6666004)(44832011)(8676002)(36756003)(6486002)(4326008)(508600001)(6506007)(66476007)(66946007)(8936002)(66556008)(83380400001)(186003)(52116002)(316002)(53546011)(7416002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5965
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fffccbe-cc8c-467c-dc4d-08d984281012
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Rhk9hb1llXyydc5Rwej27Ild41Wy/8gs3dmhBitKucztpwpKzeDSsc3gvPcfPYniBrecGpiHect3X9jyMNDNy1yNBgz8uqP7n3VblVrv3L7YI15wH9Rdg8FUCDa2J16JEKkFLYyLMRIdOQ9/nwQ+drAwdtQTQUXM6tfcQ8IJnnHaW1pF5oiTN0xwqjZlJzojc64BUM6OwrEAl1nOdzJApKAAYif99PCuvHOIvJhx8aGfd3eoV1j5U6SqV4oXmFLeCuzR0stt75uSvptayBlwOi56/QXXDou55Kp98vItpdJrhQhm39PxSTsSmmgOKVx5p3OO+p0myrNjbqedAw2V6I1wPC3Hsph04tTgT+XscJQEi8Cb77T/Wu0KjT/bub+v3KHmebkt+wmyeR0YyTCS+GA1Rs8GmjxKQaRcv6KF5i1yfFmgOkKcpx3LidtwLTjLMhTbf6sPSfiM3jgw6l2QakeX19BghKPXkFK1O+yYHu7xBOQt0bj/aPb/3sa0+qjRK5ujUqn2AWXfzoN9eDGAPqSFmAodu6J/GobTk1cvFwRbsENPnqkU3W2QHfy3Dv4iWIPx097KyamZbA+BaoDHjQ2FZxveooCT0qvToXff0mnAw4eVPoU29d+HHh7QP461GTSmGDC8+rVom58iw1qDC1mI8rflyXVHkZJoBmlm1uZkPtc+krFdeTky2FiUF6t8OH3rUIJnJHhS4FcdyhIP6qbUqp1h6tcflTqPhkjZaCwhubc1QMroBJ/woef3WHxcCtUe9jeewGYjc9craM6TYApIf39ynFi+QiRIzVlE8F4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36756003)(508600001)(316002)(4326008)(44832011)(956004)(356005)(26005)(47076005)(2616005)(86362001)(966005)(186003)(107886003)(8676002)(6486002)(81166007)(336012)(6512007)(54906003)(33656002)(30864003)(8936002)(53546011)(70206006)(36860700001)(6666004)(2906002)(70586007)(6862004)(5660300002)(83380400001)(82310400003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 15:36:46.1351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bd425f2-5346-4cb2-b1c2-08d984281c8b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2869



> On 29 Sep 2021, at 23:52, Oleksandr Tyshchenko <olekstysh@gmail.com> wrot=
e:
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> The extended region (safe range) is a region of guest physical
> address space which is unused and could be safely used to create
> grant/foreign mappings instead of wasting real RAM pages from
> the domain memory for establishing these mappings.
>=20
> The extended regions are chosen at the domain creation time and
> advertised to it via "reg" property under hypervisor node in
> the guest device-tree. As region 0 is reserved for grant table
> space (always present), the indexes for extended regions are 1...N.
> If extended regions could not be allocated for some reason,
> Xen doesn't fail and behaves as usual, so only inserts region 0.
>=20
> Please note the following limitations:
> - The extended region feature is only supported for 64-bit domain
>  currently.
> - The ACPI case is not covered.
>=20
> ***
>=20
> As Dom0 is direct mapped domain on Arm (e.g. MFN =3D=3D GFN)
> the algorithm to choose extended regions for it is different
> in comparison with the algorithm for non-direct mapped DomU.
> What is more, that extended regions should be chosen differently
> whether IOMMU is enabled or not.
>=20
> Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
> holes found in host device-tree if otherwise. Make sure that
> extended regions are 2MB-aligned and located within maximum possible
> addressable physical memory range. The minimum size of extended
> region is 64MB. The maximum number of extended regions is 128,
> which is an artificial limit to minimize code changes (we reuse
> struct meminfo to describe extended regions, so there are an array
> field for 128 elements).
>=20
> It worth mentioning that unallocated memory solution (when the IOMMU
> is disabled) will work safely until Dom0 is able to allocate memory
> outside of the original range.
>=20
> Also introduce command line option to be able to globally enable or
> disable support for extended regions for Dom0 (enabled by default).
>=20
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> ---
> Please note, we need to decide which approach to use in find_unallocated_=
memory(),
> you can find details at:
> https://lore.kernel.org/xen-devel/28503e09-44c3-f623-bb8d-8778bb94225f@gm=
ail.com/
>=20
> Changes RFC -> V2:
>   - update patch description
>   - drop uneeded "extended-region" DT property
>=20
> Changes V2 -> V3:
>   - update patch description
>   - add comment for "size" calculation in add_ext_regions()
>   - clarify "end" calculation in find_unallocated_memory() and
>     find_memory_holes()
>   - only pick up regions with size >=3D 64MB
>   - allocate reg dynamically instead of keeping on the stack in
>     make_hypervisor_node()
>   - do not show warning for 32-bit domain
>   - drop Linux specific limits EXT_REGION_*
>   - also cover "ranges" property in find_memory_holes()
>   - add command line arg to enable/disable extended region support
>=20
> Changes V3 -> V4:
>  - update opt_ext_regions purpose and comment in code
>  - reorganize make_hypervisor_node() to move allocations after initial
>    checks, allocate only required amount of elements instead of maximum
>    possible
> ---
> docs/misc/xen-command-line.pandoc |  11 ++
> xen/arch/arm/domain_build.c       | 286 +++++++++++++++++++++++++++++++++=
++++-
> 2 files changed, 294 insertions(+), 3 deletions(-)
>=20
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-li=
ne.pandoc
> index 177e656..5cae4ad 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1081,6 +1081,17 @@ hardware domain is architecture dependent.
> Note that specifying zero as domU value means zero, while for dom0 it mea=
ns
> to use the default.
>=20
> +### ext_regions (Arm)
> +> `=3D <boolean>`
> +
> +> Default : `true`
> +
> +Flag to enable or disable support for extended regions for Dom0.
> +
> +Extended regions are ranges of unused address space exposed to Dom0 as
> +"safe to use" for special memory mappings. Disable if your board device
> +tree is incomplete.
> +
> ### flask
>> `=3D permissive | enforcing | late | disabled`
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d233d63..c5afbe2 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -34,6 +34,10 @@
> static unsigned int __initdata opt_dom0_max_vcpus;
> integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
>=20
> +/* If true, the extended regions support is enabled for dom0 */
> +static bool __initdata opt_ext_regions =3D true;
> +boolean_param("ext_regions", opt_ext_regions);
> +
> static u64 __initdata dom0_mem;
> static bool __initdata dom0_mem_set;
>=20
> @@ -886,6 +890,232 @@ static int __init make_memory_node(const struct dom=
ain *d,
>     return res;
> }
>=20
> +static int __init add_ext_regions(unsigned long s, unsigned long e, void=
 *data)
> +{
> +    struct meminfo *ext_regions =3D data;
> +    paddr_t start, size;
> +
> +    if ( ext_regions->nr_banks >=3D ARRAY_SIZE(ext_regions->bank) )
> +        return 0;
> +
> +    /* Both start and size of the extended region should be 2MB aligned =
*/
> +    start =3D (s + SZ_2M - 1) & ~(SZ_2M - 1);
> +    if ( start > e )
> +        return 0;
> +
> +    /*
> +     * e is actually "end-1" because it is called by rangeset functions
> +     * which are inclusive of the last address.
> +     */
> +    e +=3D 1;
> +    size =3D (e - start) & ~(SZ_2M - 1);
> +    if ( size < MB(64) )
> +        return 0;
> +
> +    ext_regions->bank[ext_regions->nr_banks].start =3D start;
> +    ext_regions->bank[ext_regions->nr_banks].size =3D size;
> +    ext_regions->nr_banks++;
> +
> +    return 0;
> +}
> +
> +static int __init find_unallocated_memory(const struct kernel_info *kinf=
o,
> +                                          struct meminfo *ext_regions)
> +{
> +    const struct meminfo *assign_mem =3D &kinfo->mem;
> +    struct rangeset *unalloc_mem;
> +    paddr_t start, end;
> +    unsigned int i;
> +    int res;
> +
> +    dt_dprintk("Find unallocated memory for extended regions\n");
> +
> +    unalloc_mem =3D rangeset_new(NULL, NULL, 0);
> +    if ( !unalloc_mem )
> +        return -ENOMEM;
> +
> +    /* Start with all available RAM */
> +    for ( i =3D 0; i < bootinfo.mem.nr_banks; i++ )
> +    {
> +        start =3D bootinfo.mem.bank[i].start;
> +        end =3D bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
> +        res =3D rangeset_add_range(unalloc_mem, start, end - 1);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> +                   start, end);
> +            goto out;
> +        }
> +    }
> +
> +    /* Remove RAM assigned to Dom0 */
> +    for ( i =3D 0; i < assign_mem->nr_banks; i++ )
> +    {
> +        start =3D assign_mem->bank[i].start;
> +        end =3D assign_mem->bank[i].start + assign_mem->bank[i].size;
> +        res =3D rangeset_remove_range(unalloc_mem, start, end - 1);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\=
n",
> +                   start, end);
> +            goto out;
> +        }
> +    }
> +
> +    /* Remove reserved-memory regions */
> +    for ( i =3D 0; i < bootinfo.reserved_mem.nr_banks; i++ )
> +    {
> +        start =3D bootinfo.reserved_mem.bank[i].start;
> +        end =3D bootinfo.reserved_mem.bank[i].start +
> +            bootinfo.reserved_mem.bank[i].size;
> +        res =3D rangeset_remove_range(unalloc_mem, start, end - 1);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\=
n",
> +                   start, end);
> +            goto out;
> +        }
> +    }
> +
> +    /* Remove grant table region */
> +    start =3D kinfo->gnttab_start;
> +    end =3D kinfo->gnttab_start + kinfo->gnttab_size;
> +    res =3D rangeset_remove_range(unalloc_mem, start, end - 1);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
> +               start, end);
> +        goto out;
> +    }
> +
> +    start =3D 0;
> +    end =3D (1ULL << p2m_ipa_bits) - 1;
> +    res =3D rangeset_report_ranges(unalloc_mem, start, end,
> +                                 add_ext_regions, ext_regions);
> +    if ( res )
> +        ext_regions->nr_banks =3D 0;
> +    else if ( !ext_regions->nr_banks )
> +        res =3D -ENOENT;
> +
> +out:
> +    rangeset_destroy(unalloc_mem);
> +
> +    return res;
> +}
> +
> +static int __init find_memory_holes(const struct kernel_info *kinfo,
> +                                    struct meminfo *ext_regions)
> +{
> +    struct dt_device_node *np;
> +    struct rangeset *mem_holes;
> +    paddr_t start, end;
> +    unsigned int i;
> +    int res;
> +
> +    dt_dprintk("Find memory holes for extended regions\n");
> +
> +    mem_holes =3D rangeset_new(NULL, NULL, 0);
> +    if ( !mem_holes )
> +        return -ENOMEM;
> +
> +    /* Start with maximum possible addressable physical memory range */
> +    start =3D 0;
> +    end =3D (1ULL << p2m_ipa_bits) - 1;
> +    res =3D rangeset_add_range(mem_holes, start, end);
> +    if ( res )
> +    {
> +        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
> +               start, end);
> +        goto out;
> +    }
> +
> +    /*
> +     * Remove regions described by "reg" and "ranges" properties where
> +     * the memory is addressable (MMIO, RAM, PCI BAR, etc).
> +     */
> +    dt_for_each_device_node( dt_host, np )
> +    {
> +        unsigned int naddr;
> +        u64 addr, size;
> +
> +        naddr =3D dt_number_of_address(np);
> +
> +        for ( i =3D 0; i < naddr; i++ )
> +        {
> +            res =3D dt_device_get_address(np, i, &addr, &size);
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR "Unable to retrieve address %u for %s\=
n",
> +                       i, dt_node_full_name(np));
> +                goto out;
> +            }
> +
> +            start =3D addr & PAGE_MASK;
> +            end =3D PAGE_ALIGN(addr + size);
> +            res =3D rangeset_remove_range(mem_holes, start, end - 1);
> +            if ( res )
> +            {
> +                printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx=
64"\n",
> +                       start, end);
> +                goto out;
> +            }
> +        }
> +
> +        if ( dt_device_type_is_equal(np, "pci" ) )
> +        {
> +            unsigned int range_size, nr_ranges;
> +            int na, ns, pna;
> +            const __be32 *ranges;
> +            u32 len;
> +
> +            /*
> +             * Looking for non-empty ranges property which in this conte=
xt
> +             * describes the PCI host bridge aperture.
> +             */
> +            ranges =3D dt_get_property(np, "ranges", &len);
> +            if ( !ranges || !len )
> +                continue;
> +
> +            pna =3D dt_n_addr_cells(np);
> +            na =3D dt_child_n_addr_cells(np);
> +            ns =3D dt_child_n_size_cells(np);
> +            range_size =3D pna + na + ns;
> +            nr_ranges =3D len / sizeof(__be32) / range_size;
> +
> +            for ( i =3D 0; i < nr_ranges; i++, ranges +=3D range_size )
> +            {
> +                /* Skip the child address and get the parent (CPU) addre=
ss */
> +                addr =3D dt_read_number(ranges + na, pna);
> +                size =3D dt_read_number(ranges + na + pna, ns);
> +
> +                start =3D addr & PAGE_MASK;
> +                end =3D PAGE_ALIGN(addr + size);
> +                res =3D rangeset_remove_range(mem_holes, start, end - 1)=
;
> +                if ( res )
> +                {
> +                    printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"=
PRIx64"\n",
> +                           start, end);
> +                    goto out;
> +                }
> +            }
> +        }
> +    }
> +
> +    start =3D 0;
> +    end =3D (1ULL << p2m_ipa_bits) - 1;
> +    res =3D rangeset_report_ranges(mem_holes, start, end,
> +                                 add_ext_regions,  ext_regions);
> +    if ( res )
> +        ext_regions->nr_banks =3D 0;
> +    else if ( !ext_regions->nr_banks )
> +        res =3D -ENOENT;
> +
> +out:
> +    rangeset_destroy(mem_holes);
> +
> +    return res;
> +}
> +
> static int __init make_hypervisor_node(struct domain *d,
>                                        const struct kernel_info *kinfo,
>                                        int addrcells, int sizecells)
> @@ -893,11 +1123,12 @@ static int __init make_hypervisor_node(struct doma=
in *d,
>     const char compat[] =3D
>         "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"=
\0"
>         "xen,xen";
> -    __be32 reg[4];
> +    __be32 *reg, *cells;
>     gic_interrupt_t intr;
> -    __be32 *cells;
>     int res;
>     void *fdt =3D kinfo->fdt;
> +    struct meminfo *ext_regions =3D NULL;
> +    unsigned int i, nr_ext_regions;
>=20
>     dt_dprintk("Create hypervisor node\n");
>=20
> @@ -919,12 +1150,61 @@ static int __init make_hypervisor_node(struct doma=
in *d,
>     if ( res )
>         return res;
>=20
> +    if ( !opt_ext_regions )
> +    {
> +        printk(XENLOG_DEBUG "The extended regions support is disabled\n"=
);
> +        nr_ext_regions =3D 0;
> +    }
> +    else if ( is_32bit_domain(d) )
> +    {
> +        printk(XENLOG_DEBUG "The extended regions are only supported for=
 64-bit guest currently\n");
> +        nr_ext_regions =3D 0;
> +    }
> +    else
> +    {
> +        ext_regions =3D xzalloc(struct meminfo);
> +        if ( !ext_regions )
> +            return -ENOMEM;
> +
> +        if ( !is_iommu_enabled(d) )
> +            res =3D find_unallocated_memory(kinfo, ext_regions);
> +        else
> +            res =3D find_memory_holes(kinfo, ext_regions);
> +
> +        if ( res )
> +            printk(XENLOG_WARNING "Failed to allocate extended regions\n=
");
> +        nr_ext_regions =3D ext_regions->nr_banks;
> +    }
> +
> +    reg =3D xzalloc_array(__be32, (nr_ext_regions + 1) * (addrcells + si=
zecells));
> +    if ( !reg )
> +    {
> +        xfree(ext_regions);
> +        return -ENOMEM;
> +    }
> +
>     /* reg 0 is grant table space */
>     cells =3D &reg[0];
>     dt_child_set_range(&cells, addrcells, sizecells,
>                        kinfo->gnttab_start, kinfo->gnttab_size);
> +    /* reg 1...N are extended regions */
> +    for ( i =3D 0; i < nr_ext_regions; i++ )
> +    {
> +        u64 start =3D ext_regions->bank[i].start;
> +        u64 size =3D ext_regions->bank[i].size;
> +
> +        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
> +                   i, start, start + size);
> +
> +        dt_child_set_range(&cells, addrcells, sizecells, start, size);
> +    }
> +
>     res =3D fdt_property(fdt, "reg", reg,
> -                       dt_cells_to_size(addrcells + sizecells));
> +                       dt_cells_to_size(addrcells + sizecells) *
> +                       (nr_ext_regions + 1));
> +    xfree(ext_regions);
> +    xfree(reg);
> +
>     if ( res )
>         return res;
>=20
> --=20
> 2.7.4
>=20
>=20


