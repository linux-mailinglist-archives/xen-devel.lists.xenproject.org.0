Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D031B2D412D
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 12:34:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48151.85136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxjO-0005UP-7m; Wed, 09 Dec 2020 11:34:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48151.85136; Wed, 09 Dec 2020 11:34:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxjO-0005U0-4V; Wed, 09 Dec 2020 11:34:02 +0000
Received: by outflank-mailman (input) for mailman id 48151;
 Wed, 09 Dec 2020 11:34:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmxjM-0005Tv-3y
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 11:34:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.75]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbfc12ee-16db-4e23-8435-1ab9faf9db87;
 Wed, 09 Dec 2020 11:33:59 +0000 (UTC)
Received: from MR2P264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::26) by
 AM0PR08MB3921.eurprd08.prod.outlook.com (2603:10a6:208:130::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Wed, 9 Dec
 2020 11:33:55 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::c9) by MR2P264CA0014.outlook.office365.com
 (2603:10a6:500:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21 via Frontend
 Transport; Wed, 9 Dec 2020 11:33:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 11:33:55 +0000
Received: ("Tessian outbound 8b6e0bb22f1c:v71");
 Wed, 09 Dec 2020 11:33:54 +0000
Received: from 524ac13b9a38.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B622475F-6622-4468-AD04-47D7780CD928.1; 
 Wed, 09 Dec 2020 11:33:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 524ac13b9a38.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 11:33:49 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3852.eurprd08.prod.outlook.com (2603:10a6:10:7f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 11:33:47 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 11:33:47 +0000
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
X-Inumbo-ID: fbfc12ee-16db-4e23-8435-1ab9faf9db87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnuAxnuXMlv2SnleMKIqhOaNxzyLAcdqVkNdCcd9Qwo=;
 b=ZJtid9wDnXkvpVGNk60QAjIh2efA8RO0amSHERAXfL8DiG7iCH50EboIAbamXcqoWrCubBwptXJXRYsXqGcv7ryLV/BOOBtzfQ5hWBDYgrzuO0VOLaJPBWeT1ia9LxK2vVw8KGGwGvLVDlmjiKNRzMtMWjCOniQ8RWZtkDzUpks=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 530a1bad736a405e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgXYigpARm0z45LWPuzSWTnEcS8NHiqbhIV04qaWfA1WTsZhptEvuGGihYobYvkUKvJUDou517cjqE4SZyZwyx5Okz7Q9JXTCfz+iv2b8NuP3znMI3B2RtT8SMZkfs1ZqRkaNlEG1c2xKscy/EzS+tDjb4grcgNTmHcdDaIr2VKpfvbRQ86JyvWcaUZu8xUGNo8iL6V8TGOoeDryqlgtu2EGJKSw9bCEe/4BwqLXoHHKHlcfTdtnNufbRxBXzEgVE+ES64GJBaWDCtV7UfgISOkQOatxJCDyioA3MHUarUvg7FcMuY5S8/m3k1aX56tQyLADOHI6DXqYXcUR0Xf3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnuAxnuXMlv2SnleMKIqhOaNxzyLAcdqVkNdCcd9Qwo=;
 b=Fdj2kaz+52+uX6CmNpc/ih1oJFwNyvKOszLCOVYI8R1BJwp2IKJ7IxGFBo/ZBfRefUt/KjefrHfktEY4WU8vjYWgtRIpu6jAnNU0wMEzGcb6fid5f5b2MEDhuaMVY1QuVYe4rP3UV9sXaMbWp6sJ2GOa8DCAHjwjWoRZn/vE15b8JOGGV/6FTJp7ShZlhLmNCjGuP1AhTv7gbpd/65n47x17pwUZLQRKUq/LApvAVCDAAOycFvu3fUwTQL1qsjC34NOmkmsJ4N4SSI1TFVSN116F2QuTdSZeh5MDoJNESmIkcgSen9ejYmKZmMjENKMf46/8uuKOVU5lya6CoJIKGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnuAxnuXMlv2SnleMKIqhOaNxzyLAcdqVkNdCcd9Qwo=;
 b=ZJtid9wDnXkvpVGNk60QAjIh2efA8RO0amSHERAXfL8DiG7iCH50EboIAbamXcqoWrCubBwptXJXRYsXqGcv7ryLV/BOOBtzfQ5hWBDYgrzuO0VOLaJPBWeT1ia9LxK2vVw8KGGwGvLVDlmjiKNRzMtMWjCOniQ8RWZtkDzUpks=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 0/8] xen: beginnings of moving library-like code into
 an archive
Thread-Topic: [PATCH v3 0/8] xen: beginnings of moving library-like code into
 an archive
Thread-Index: AQHWwaul6ZNQ27c670WmXpdnGV75B6nuuvgA
Date: Wed, 9 Dec 2020 11:33:47 +0000
Message-ID: <509B2BDB-A226-4328-A75E-33AAF74BE45B@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
In-Reply-To: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c47407f-8123-4801-afed-08d89c364fe3
x-ms-traffictypediagnostic: DB7PR08MB3852:|AM0PR08MB3921:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3921F5DDDE7F5DF5DA2B90379DCC0@AM0PR08MB3921.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 1vTnTcBNqHQ8eDTTJdpKSkESxTmFTKs6UBA56OlyKhwjJ9K+dIvfL1L8F6uG16XSdbb94THp2fT007JRRf6I4W+LeFbwrghdkbYk1s4hr/hYsGO/BX6DxX8AkSQXhVmsSPMd8+MzvAtHKxU2R4E3sPGXm5Ws+Uu5pD3Cvk/bT6j5RC0eru3SKz9LMPJPkupvb3b9ST0s0JzNntVOhmALSH9F0Ne7Gy1USeHKCk/fz59hhw4JsEvlGlT/bIspL2tsywmQw1O9r2dOuhrHjsu9Njs2yst9te9omzn3DTNF42wFz8bsyBP+GDDrqDmZHl3wT7NrhHYRwA4OqFicsakS7fKnzYBUCi2pqg7At0l1DHFgmdsyvsSyjCmZCCHklDnW
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(186003)(2616005)(8676002)(8936002)(6486002)(6916009)(2906002)(5660300002)(86362001)(6506007)(54906003)(33656002)(6512007)(71200400001)(478600001)(316002)(66446008)(91956017)(76116006)(83380400001)(66556008)(64756008)(66946007)(66476007)(53546011)(36756003)(4326008)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?R2+l+ycms7e0wS/+VL5kxBq7d7KtSIiTO/zrNBTi6KLKqbe8D5veef9B7+Fb?=
 =?us-ascii?Q?igb38Org+Y3TIVeI3aieAA62R7GBCzLixhcrCVP6/Sr2rtyzL9JL4TGyR/m1?=
 =?us-ascii?Q?rXaHVfAruns69i1+LuCPfQ0nPIcvVhthqQTbos+77lP9uEgREd4qs8Y2HFlR?=
 =?us-ascii?Q?4MDAD7J6syvCXDCHhEIhbdyimyG9Ow9vTdIOrRjEGCI1SJOBdvbFzdfnNhh1?=
 =?us-ascii?Q?UHZWMRN4uKAfLMAc76ET4VNebqwWknsVvLycGkQjVMM3uYIuSdlYOPgD2jZ3?=
 =?us-ascii?Q?ZeNBqV0zHrOYh0nRhV5MQB6c7MHxPSg1qlUU6pRlBSmazOMgkzt30uLugdgm?=
 =?us-ascii?Q?vjxtIaxjRAkLKkGOCf2/qLu7iSQgbAHROaJ51qXQXEVVrE1LFcPkdeTamZRn?=
 =?us-ascii?Q?CiDoAtXcb5CV4IDL+hQrj6yV9N4RhMN74jV8QQ6XodJVNYPibpswUIq61wuA?=
 =?us-ascii?Q?JU+5yT8TmqKWYCe9A+KB1Mwkw3V7v4oZhCMXgpsMLg/PyOTlnbuEPw8A54og?=
 =?us-ascii?Q?/wuR+kGSap7kz8Nir6GTSVrxPPGkmoeJ958oHMoaEDg5JZ3IFs3hs3LqDJiw?=
 =?us-ascii?Q?ZdoHoFB3Dj/oTdEzr/ns7d33vvbBeocvhkoxyJKL4Dpha9K0RSUw3KbVawPu?=
 =?us-ascii?Q?3fiJSWUwX/mNj3Z4Jgc9i4Dd0UgM3NN8rbzhwkiwSws3ktD9KukOBkDo61q2?=
 =?us-ascii?Q?4h7jkC2hUgmYeV4vOKurT1QPFkUV2IZsCllsOlwIPDZ4Oda3YB3Jlscp49X/?=
 =?us-ascii?Q?77a+pPOAoEF4JYczal7C3D+iTVW+O4q4cTGvMt5AS4ISvtck3NV19PxVI0iv?=
 =?us-ascii?Q?5AUua1Y6/3kqvxSnglrB7Qt7WttC87JfiNJ+onqeulfD4VLvl68EafvXvCRK?=
 =?us-ascii?Q?YBKOmbqESXWhilZZfhsqrwks1Lc3g0q2d/FisikPr+frhcTX7h4CiM4u4oxW?=
 =?us-ascii?Q?8FiFz8TtrjSrnGqL5sUCn4w48/eJfO7PGb83UEopqec/G5yOsiN4BOq52KFo?=
 =?us-ascii?Q?Vn4F?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <54E70B608C2F28458F8B802E586752F6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3852
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	beb203f3-a084-40fe-afdf-08d89c364b53
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ciLPrGtJbFyxxeiVApQdEBU11lzQViIrXNqmDdElskr4ekdbz8kk++nOOs9mfaWthAsvsUXOmMNIhxEsngobLs+r6TcKQLAy8+h3Hg/+xkM26pxdMQF7P0tScmLzGpkows+DG70BYj9lBRCFh/g6+Ak/S6TbvscMBEV0C1Xod5TBFTCfPbx65BWsriYjegcsuYM9H5g8N9gqc+FOI24qBQYNE5snWIL+35iizldUp95Mk95Chfbg8K63oG35219QHcU6kV56YBYINwI+6UFeUFgfgvBxU9wylvyqMwTVU1ZwDdOubgCpBeRn+7wTuYabUDWAIPDHG01V+MmqFtDyRU6vmNTxD9O3DoOy4tDIB7zWXmzeavyCcH+QhPtbJOvzzOAEiKAsOi1Z/wNLYKEmA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(46966005)(54906003)(6506007)(81166007)(70206006)(70586007)(6862004)(508600001)(356005)(47076004)(336012)(186003)(36756003)(83380400001)(8676002)(26005)(8936002)(5660300002)(86362001)(107886003)(53546011)(2906002)(33656002)(6486002)(4326008)(2616005)(82310400003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 11:33:55.4134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c47407f-8123-4801-afed-08d89c364fe3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3921

Hi Jan,

I will review this today, sorry for the delay.

Regards
Bertrand

> On 23 Nov 2020, at 15:16, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> In a few cases we link in library-like functions when they're not
> actually needed. While we could use Kconfig options for each one
> of them, I think the better approach for such generic code is to
> build it always (thus making sure a build issue can't be introduced
> for these in any however exotic configuration) and then put it into
> an archive, for the linker to pick up as needed. The series here
> presents a first few tiny steps towards such a goal.
>=20
> Note that we can't use thin archives yet, due to our tool chain
> (binutils) baseline being too low.
>=20
> Further almost immediate steps I'd like to take if the approach
> meets no opposition are
> - split and move the rest of common/lib.c,
> - split and move common/string.c, dropping the need for all the
>  __HAVE_ARCH_* (implying possible per-arch archives then need to
>  be specified ahead of lib/lib.a on the linker command lines),
> - move common/libelf/ and common/libfdt/.
>=20
> v3 has a new 1st patch and some review feedback addressed. See
> individual patches.
>=20
> 1: xen: fix build when $(obj-y) consists of just blanks
> 2: lib: collect library files in an archive
> 3: lib: move list sorting code
> 4: lib: move parse_size_and_unit()
> 5: lib: move init_constructors()
> 6: lib: move rbtree code
> 7: lib: move bsearch code
> 8: lib: move sort code
>=20
> Jan
>=20


