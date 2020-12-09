Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 607732D413A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 12:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48163.85160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxnb-0005n2-3K; Wed, 09 Dec 2020 11:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48163.85160; Wed, 09 Dec 2020 11:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmxna-0005md-Vm; Wed, 09 Dec 2020 11:38:22 +0000
Received: by outflank-mailman (input) for mailman id 48163;
 Wed, 09 Dec 2020 11:38:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiOm=FN=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kmxnZ-0005mY-Fq
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 11:38:21 +0000
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (unknown
 [40.107.9.89]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3f74adc-5408-4342-a952-f1d44500b9a1;
 Wed, 09 Dec 2020 11:38:19 +0000 (UTC)
Received: from AM6P194CA0085.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::26)
 by PR2PR08MB4780.eurprd08.prod.outlook.com (2603:10a6:101:1a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Wed, 9 Dec
 2020 11:38:17 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::19) by AM6P194CA0085.outlook.office365.com
 (2603:10a6:209:8f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 11:38:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 9 Dec 2020 11:38:16 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Wed, 09 Dec 2020 11:38:16 +0000
Received: from 076082c5ce7d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C5A348F-2D42-45B5-B784-F43B837967F2.1; 
 Wed, 09 Dec 2020 11:38:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 076082c5ce7d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 09 Dec 2020 11:38:00 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB6075.eurprd08.prod.outlook.com (2603:10a6:10:207::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Wed, 9 Dec
 2020 11:37:59 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.023; Wed, 9 Dec 2020
 11:37:59 +0000
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
X-Inumbo-ID: c3f74adc-5408-4342-a952-f1d44500b9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+muicTQYv5AUi/cxy5BXbMIrHWiNucm/gPOaEvKUXU=;
 b=0u4Pcp32N1C1x2A8uvIM1DNd1fnFFaQtpDAoMm1E9iK+MajTz5ZIPjYo1RUW8Ie47KCu7vidRXih/cZ9udl5UXNs40ROoqPXKAsqETs6wEwJm6AhTL37J5YB3qOGEYLpXDKKkYT06JCJ2aUzt498Fbb4FkulklfViJfAbzjj718=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12c22f426be2257c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtZDoaqOvOBrRSVBz9zGX/s0qUOQWtf6Ygyi/1WbpmgXWUSlovhH+6yABDaxRKtBcOMq2skjOPhenhT0UqlUwzkfAaKGITDYOOGuPjAgFHNpPsNJww7lxc3tV9PAV19X4G4VLzWrLfhtJa21fCsZsgbZ1LBiM9E+HGQq5JPOEsFN+G8C6ohZ8/lVT0nB0e5ADvrka8Uq19lGTKYAs1wgJ4oErEwG/ytmYruuO1Dp58yH9pHhx0s5VViVgh6eHgXDOYkqyGswAD8WZzVGtwo5hvC71gIKEluqYCBeFQiRnsVUDeVnIEIxZ3gOxurT5wjXhALzMevgJglRkdR4QTD6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+muicTQYv5AUi/cxy5BXbMIrHWiNucm/gPOaEvKUXU=;
 b=Bp23UCsVYxlLysXPaex59cxIIBPRnn3ofk9pZX7HklwAmewKVCFr/bjTaBUrNKyy5ijPRBcMZJZWw/+9HU2SQj4WWPYQts5CqhO3kst0/IOKnriZAEOrkiQAr+FzTux8ug1Q0UnomFJGqFpADWxD9JSPtRtRIidTrVpuiPwOZsagvP3tTbjLhf0HBe3e7jai3C3pF0gQ2svVLth7zbpCVyjWtXeBQpCzSWEeB6uUVYAwvfc59CchFQ1to7ACTmH3WlZpfSEGBHNH+v9B2va9Gnu04xecSI1T9gxM3YhwErT6BEkGNwz4eO3p23JCON/sB1MMof5lnYFH5S9h/r5wlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+muicTQYv5AUi/cxy5BXbMIrHWiNucm/gPOaEvKUXU=;
 b=0u4Pcp32N1C1x2A8uvIM1DNd1fnFFaQtpDAoMm1E9iK+MajTz5ZIPjYo1RUW8Ie47KCu7vidRXih/cZ9udl5UXNs40ROoqPXKAsqETs6wEwJm6AhTL37J5YB3qOGEYLpXDKKkYT06JCJ2aUzt498Fbb4FkulklfViJfAbzjj718=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 2/8] lib: collect library files in an archive
Thread-Topic: [PATCH v3 2/8] lib: collect library files in an archive
Thread-Index: AQHWwaxzwnlkqyYO/Ea2tJ3MHVbjvKnuvCIA
Date: Wed, 9 Dec 2020 11:37:59 +0000
Message-ID: <E7B41B4F-98F9-4C52-8549-F407D6FB8251@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
In-Reply-To: <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7dcee07b-d579-42c5-5eaa-08d89c36eb9d
x-ms-traffictypediagnostic: DBBPR08MB6075:|PR2PR08MB4780:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB47800D2D0BFA09999054EFE19DCC0@PR2PR08MB4780.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 TrMjizt6lOTNCxkAct3wYWoG3tvISX3xOh9uBlaQkDdFD293arJIkoq9/DNmKyHFD5KED2WBe2FVMlOB9Ij6dD2Y+szYopCnyvS8MRCkVzcMv62rrmpBXc5k30SS5McMUEf1JMbhmtfaE1u6l2E8s7rYnAjKYRf4iOu8j7tsPBB66UyhpwoClFStrKaPFwVorzy6bHfm60Fo+Gb8nZD2TpSGqIOdVpgjvXPOTz5J5qhc+wRG0HXBZuWEItat+DDp8pBVdUjgoxk1a5Gxd567cFoMg/nF2Nh7qO/DCZuIIeT33tt+jAVgoJQBXMv/JA1TOs+2mZvLJViEZ8VzYJWCF1ulreit/Kh3npYO10LpEY9yKAvjtcY3LqJ1b1IIi6bk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(6512007)(5660300002)(6486002)(8936002)(53546011)(66446008)(66556008)(71200400001)(36756003)(66476007)(26005)(6506007)(186003)(4326008)(91956017)(478600001)(8676002)(6916009)(66946007)(2616005)(76116006)(33656002)(64756008)(83380400001)(316002)(2906002)(86362001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?poRg2x9oa8Ski2W7piryDpikcHyDbBSi4sefBFhJk2MK76YFJFZk3dkj7BWN?=
 =?us-ascii?Q?vSjHZkKLd+MHfMYUq5tkhifVONnKfw8lKmsZDMR6CHQWvkpuE4oFsEqAmvtk?=
 =?us-ascii?Q?TPhfq1gmAtzPEwQ/znaSKY6xVkl3KEC0rGnt2iY9mpeXqgXYdi0CYS0fEOra?=
 =?us-ascii?Q?Lp7g8LO1GAkoxBMcBFClxrHw6eQSGbnFgWD5rsa5UqGpmqN9Paha8rpWGCCO?=
 =?us-ascii?Q?4K8g0tWJuxClb07Hwn1xzU62ssKFgY7biZKTlWvZ34PMRw0dyDwobSikhHWq?=
 =?us-ascii?Q?AaQHO9tZVxuhrzq8OklbSEI+HqYp6eN23dl4O95mkqqVViejn760hMivQ2e5?=
 =?us-ascii?Q?NypR5ENLSzlxlM9AgKHIouVMbmObLAulHh9vm3KWhPGVflUIGMKhWVbOuqeI?=
 =?us-ascii?Q?+E3TbobLBPZ8X6e9p8Mj9oDyfx8qgvv93H4/VbpqKkeCgBPCUETkOGxE3a52?=
 =?us-ascii?Q?IIjlaS+KzxHONyfjXGgXl3z8/jzhtRuhgHV7ench5NcO7XiUXAhwiChVO4fe?=
 =?us-ascii?Q?nEF3sXnoU/++cLolNb3EFMfEhm+REy6pfaO7ypzIh1rfuShGAl97cgbZXMDv?=
 =?us-ascii?Q?pZ7DHBUtamgOckFThW2PG+zSiVHRbxaZLfGrB7HXh3SJWxAvBK9rePCyQe0G?=
 =?us-ascii?Q?7HcqhEgmgVZvLKz/02KjbbDf4JJlg1Nex7tv8bGGZPRipWmIAmqqg9h3EYnC?=
 =?us-ascii?Q?xutIpT38Gd0fCOikKEOmUcbIAGprjkDiBsRArFp6B552D/1sKZxERcR9B0D3?=
 =?us-ascii?Q?AZCKmTDpsqPvfevuWRJA2niV2BROxB7mX0t5UK5dcFkbwUzXXLo6oU9kZsYa?=
 =?us-ascii?Q?rc8TDkP+wFl5YxY0TVZ07Q2vjviiwaDypQ92T3r68prUevvYNVt7qgvXw9UI?=
 =?us-ascii?Q?Hsx6BzOrozn7T4TdO0A6hC982IEdEL8roAuzkbqp0teiTHPKCWari1SA1J7G?=
 =?us-ascii?Q?QKzQEnJbmkQ+Yoz4ydzsI2rNJnz3icBlKsbowi924yWw5bwuAHP2gWTgCg+U?=
 =?us-ascii?Q?3ztx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <77984E269CF54740A87039565766E0AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6075
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	611b7996-78da-4cbe-c44e-08d89c36e12b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ZA7Lx53osHa1vcD5P3ZMKka+Rx23uGTUKAMVYkbhT/bg7OxWs8EVdqXpnArZw42eylVIcJaa7pOaYpiKA/8PKq8je1weRTJNqJPMHhxC0jOCP0QFSid9mUFJT0PpaVdTIW1J4UHx4a8qd3LYS5rPjUHF+AKoOp/w5fW90ExPgeVp69gm7TKYkduyeRgfQU+s2VANnAa8tzdYKgiHcOjWXRbL1gMtcGP6zAk4k1IGfH2NtaQ9KaCGsu8v5cIPc/ae6nkNar9aG2lsnYW2lsmrHrhdpdcV5aFMu7ylnYHn4/L1cEZiQTJgePrLz9BnFaZMbK0JcJq2YUCESuOqoBK2oQjZM9PT+H8cxvTIS7BAjNISxS0EiBf4Xd1FxU5bEFceW1M9W+mS/V83Bl24YHU2w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(46966005)(107886003)(336012)(8676002)(8936002)(54906003)(70206006)(33656002)(508600001)(4326008)(70586007)(5660300002)(83380400001)(186003)(6486002)(6862004)(26005)(82310400003)(6512007)(6506007)(53546011)(2906002)(36756003)(2616005)(47076004)(356005)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 11:38:16.6712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dcee07b-d579-42c5-5eaa-08d89c36eb9d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4780

Hi,

> On 23 Nov 2020, at 15:21, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
> just to avoid bloating binaries when only some arch-es and/or
> configurations need generic library routines, combine objects under lib/
> into an archive, which the linker then can pick the necessary objects
> out of.
>=20
> Note that we can't use thin archives just yet, until we've raised the
> minimum required binutils version suitably.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

with one remark...


> ---
> xen/Rules.mk          | 29 +++++++++++++++++++++++++----
> xen/arch/arm/Makefile |  6 +++---
> xen/arch/x86/Makefile |  8 ++++----
> xen/lib/Makefile      |  3 ++-
> 4 files changed, 34 insertions(+), 12 deletions(-)
>=20
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index d5e5eb33de39..aba6ca2a90f5 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -41,12 +41,16 @@ ALL_OBJS-y               +=3D $(BASEDIR)/xsm/built_in=
.o
> ALL_OBJS-y               +=3D $(BASEDIR)/arch/$(TARGET_ARCH)/built_in.o
> ALL_OBJS-$(CONFIG_CRYPTO)   +=3D $(BASEDIR)/crypto/built_in.o
>=20
> +ALL_LIBS-y               :=3D $(BASEDIR)/lib/lib.a
> +
> # Initialise some variables
> +lib-y :=3D
> targets :=3D
> CFLAGS-y :=3D
> AFLAGS-y :=3D
>=20
> ALL_OBJS :=3D $(ALL_OBJS-y)
> +ALL_LIBS :=3D $(ALL_LIBS-y)
>=20
> SPECIAL_DATA_SECTIONS :=3D rodata $(foreach a,1 2 4 8 16, \
>                                             $(foreach w,1 2 4, \
> @@ -60,7 +64,14 @@ include Makefile
> # -----------------------------------------------------------------------=
----
>=20
> quiet_cmd_ld =3D LD      $@
> -cmd_ld =3D $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
> +cmd_ld =3D $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prereqs=
)) \
> +               --start-group $(filter %.a,$(real-prereqs)) --end-group

This might be a good idea to add a comment to explain why the start/end-gro=
up
is needed so that someone does not change this back in the future.

Something like: put libraries between start/end group to have unused symbol=
s removed.

Cheers
Bertrand

> +
> +# Archive
> +# ----------------------------------------------------------------------=
-----
> +
> +quiet_cmd_ar =3D AR      $@
> +cmd_ar =3D rm -f $@; $(AR) cPrs $@ $(real-prereqs)
>=20
> # Objcopy
> # -----------------------------------------------------------------------=
----
> @@ -86,6 +97,10 @@ obj-y    :=3D $(patsubst %/, %/built_in.o, $(obj-y))
> # tell kbuild to descend
> subdir-obj-y :=3D $(filter %/built_in.o, $(obj-y))
>=20
> +# Libraries are always collected in one lib file.
> +# Filter out objects already built-in
> +lib-y :=3D $(filter-out $(obj-y), $(sort $(lib-y)))
> +
> $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y +=3D -DINIT=
_SECTIONS_ONLY
>=20
> ifeq ($(CONFIG_COVERAGE),y)
> @@ -129,7 +144,7 @@ include $(BASEDIR)/arch/$(TARGET_ARCH)/Rules.mk
> c_flags +=3D $(CFLAGS-y)
> a_flags +=3D $(CFLAGS-y) $(AFLAGS-y)
>=20
> -built_in.o: $(obj-y) $(extra-y)
> +built_in.o: $(obj-y) $(if $(strip $(lib-y)),lib.a) $(extra-y)
> ifeq ($(strip $(obj-y)),)
> 	$(CC) $(c_flags) -c -x c /dev/null -o $@
> else
> @@ -140,8 +155,14 @@ else
> endif
> endif
>=20
> +lib.a: $(lib-y) FORCE
> +	$(call if_changed,ar)
> +
> targets +=3D built_in.o
> -targets +=3D $(filter-out $(subdir-obj-y), $(obj-y)) $(extra-y)
> +ifneq ($(strip $(lib-y)),)
> +targets +=3D lib.a
> +endif
> +targets +=3D $(filter-out $(subdir-obj-y), $(obj-y) $(lib-y)) $(extra-y)
> targets +=3D $(MAKECMDGOALS)
>=20
> built_in_bin.o: $(obj-bin-y) $(extra-y)
> @@ -155,7 +176,7 @@ endif
> PHONY +=3D FORCE
> FORCE:
>=20
> -%/built_in.o: FORCE
> +%/built_in.o %/lib.a: FORCE
> 	$(MAKE) -f $(BASEDIR)/Rules.mk -C $* built_in.o
>=20
> %/built_in_bin.o: FORCE
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 296c5e68bbc3..612a83b315c8 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -90,14 +90,14 @@ endif
>=20
> ifeq ($(CONFIG_LTO),y)
> # Gather all LTO objects together
> -prelink_lto.o: $(ALL_OBJS)
> -	$(LD_LTO) -r -o $@ $^
> +prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
> +	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) =
--end-group
>=20
> # Link it with all the binary objects
> prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_=
lto.o
> 	$(call if_changed,ld)
> else
> -prelink.o: $(ALL_OBJS) FORCE
> +prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
> 	$(call if_changed,ld)
> endif
>=20
> diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
> index 9b368632fb43..8f2180485b2b 100644
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -132,8 +132,8 @@ EFI_OBJS-$(XEN_BUILD_EFI) :=3D efi/relocs-dummy.o
>=20
> ifeq ($(CONFIG_LTO),y)
> # Gather all LTO objects together
> -prelink_lto.o: $(ALL_OBJS)
> -	$(LD_LTO) -r -o $@ $^
> +prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
> +	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) =
--end-group
>=20
> # Link it with all the binary objects
> prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_=
lto.o $(EFI_OBJS-y) FORCE
> @@ -142,10 +142,10 @@ prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o=
,$(ALL_OBJS)) prelink_lto.o $
> prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prel=
ink_lto.o FORCE
> 	$(call if_changed,ld)
> else
> -prelink.o: $(ALL_OBJS) $(EFI_OBJS-y) FORCE
> +prelink.o: $(ALL_OBJS) $(ALL_LIBS) $(EFI_OBJS-y) FORCE
> 	$(call if_changed,ld)
>=20
> -prelink-efi.o: $(ALL_OBJS) FORCE
> +prelink-efi.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
> 	$(call if_changed,ld)
> endif
>=20
> diff --git a/xen/lib/Makefile b/xen/lib/Makefile
> index 53b1da025e0d..b8814361d63e 100644
> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -1,2 +1,3 @@
> -obj-y +=3D ctype.o
> obj-$(CONFIG_X86) +=3D x86/
> +
> +lib-y +=3D ctype.o
>=20
>=20


