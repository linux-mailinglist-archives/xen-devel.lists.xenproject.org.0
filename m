Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2670F9FC
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 17:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539136.839718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qJo-000632-Is; Wed, 24 May 2023 15:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539136.839718; Wed, 24 May 2023 15:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1qJo-00060Q-F2; Wed, 24 May 2023 15:22:28 +0000
Received: by outflank-mailman (input) for mailman id 539136;
 Wed, 24 May 2023 15:22:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VEVP=BN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q1qJm-00060I-Ot
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 15:22:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8d260ef-fa46-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 17:22:24 +0200 (CEST)
Received: from DB9PR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::28) by AS8PR08MB6023.eurprd08.prod.outlook.com
 (2603:10a6:20b:291::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 15:22:21 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::ba) by DB9PR01CA0023.outlook.office365.com
 (2603:10a6:10:1d8::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Wed, 24 May 2023 15:22:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 15:22:21 +0000
Received: ("Tessian outbound 5154e9d36775:v136");
 Wed, 24 May 2023 15:22:20 +0000
Received: from c126a362e386.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6754B5D6-8066-452F-85FA-5E04F7E7D3B1.1; 
 Wed, 24 May 2023 15:22:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c126a362e386.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 15:22:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM8PR08MB5827.eurprd08.prod.outlook.com (2603:10a6:20b:1da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 15:22:06 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 15:22:06 +0000
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
X-Inumbo-ID: c8d260ef-fa46-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnFv3WfxmIdeNHqkTf+1Za3HrPZwsu4WLDuboSjxFp8=;
 b=Qoi3gY1rap1to1k+aOiZGO9T5ss7kSOBFVCCaoEZkt1RwDt/R86YobC7y17eqTvZoa3KWspIChVz4lHncwD8xcMm8sR9Q4UedksxZ/wKKWwaoD5EoucSne7qkxmHaZC0shQeeIU0zofehU+EObg9Cc8+VXIS2VZe5h4VwLSxmR4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: b8120e44f134aa86
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMX7GCMd49wjGEHJFj0+ridk+PeEk00l00b2J78LCgvAWaMbNP9hHD1modOuyV9h0hxrz6Z7tkZ4d6OximLsMeIbymzP4+ZDiwFsYhYQBXLT+7vE//uAYHcNe2apSkEgG61rVlVRM5TQ8b5O/aNhH4+7TKQwgIlqk4PFpPb4N30KVnYf2ieXTk+wmrOrtJH/czADAAI1yjecWrk8GTQetfKblWYU5BjIzV63GfuyBZ79jG68naJemAhVk5Cdu0oYSKAzhJfSFbAwZLbUxtoZm/btGbj4q0cuB/7jCa/Bu5Qrj82r0U2drG4/KEQa7nxPPqupEbSMTjGe3ql0XQG1PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnFv3WfxmIdeNHqkTf+1Za3HrPZwsu4WLDuboSjxFp8=;
 b=mHG75csgvuYLGaVtzuKXp3iM8kUa01fJwUwlGH5BkyDGRGYn0DJSThqt0OtBAZYa3DVXA3lAOqNw8597sywoASHovBNyP3kTJYRsi93CqUYyp7FO4AwyvTEfwoxOwXy0YNhU3OFCPebF/w+68M+6E/hgwmGOxzyS1zmEt/6KLDYYKJwfLFPLx3sZHV+1QkuaakeQEmmTW7oNfptVPeQ9bD8OES1owrK8rfFkdOWj6T07qcHonN7R+0DkPDinNNvXst+9j3iLMIE/+s8zNsJrqbIlLEq8vGxvopWD2YfllP2Rn2z5bwiJj7DacEcL/QZHKdwROWZkZosghJ+TRR82kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnFv3WfxmIdeNHqkTf+1Za3HrPZwsu4WLDuboSjxFp8=;
 b=Qoi3gY1rap1to1k+aOiZGO9T5ss7kSOBFVCCaoEZkt1RwDt/R86YobC7y17eqTvZoa3KWspIChVz4lHncwD8xcMm8sR9Q4UedksxZ/wKKWwaoD5EoucSne7qkxmHaZC0shQeeIU0zofehU+EObg9Cc8+VXIS2VZe5h4VwLSxmR4=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v7 12/12] xen/changelog: Add SVE and "dom0" options to the
 changelog for Arm
Thread-Topic: [PATCH v7 12/12] xen/changelog: Add SVE and "dom0" options to
 the changelog for Arm
Thread-Index: AQHZjUpdf9Q15ls77023F7OWvjvckK9pjF2A
Date: Wed, 24 May 2023 15:22:06 +0000
Message-ID: <84B6F092-8007-4217-9EA6-5325BADC66D8@arm.com>
References: <20230523074326.3035745-1-luca.fancellu@arm.com>
 <20230523074326.3035745-13-luca.fancellu@arm.com>
In-Reply-To: <20230523074326.3035745-13-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|AM8PR08MB5827:EE_|DBAEUR03FT008:EE_|AS8PR08MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa4387d-8be9-4961-ba9b-08db5c6aab24
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gu3GT+aRL/W/Orz6GtX9BMxzhgngOvTKUjVmtUoxDpSZ94qYAm5v/ecZfSJerxO0+Xm9MKRfBdLCCG9cjeRKRrhBwHgu7LRUdkv98t2MORGmn/sIGax0E6if1m8pf0cSXn6QJvBXbg1+twvkX4qvhiq5Xbn9wYUXEKObB0vHIfJtrlsCjuX4udlFt2AovIhnWXZDCH1ryFgb0wOim+A4yHvnz0rtDom4MBDKNPXzsV6RfNfzVuBQEFSgatfSg6Leupan3itM3kuSPpzllu8Jhu0a5TAI7vbRcXZj1xtJfTvhZtHQR1hIBVXbGKaIKsdX4HQcdID7t3LT1/UY7WtXNzEDSS2nFbca/fHs2I4elyCFM6OKMTbrrRC9cuJykO0V2NmVbcRU89Zsrl0DN9P/kZOYogF0rQkpPIuM9w1hmFuOXReH5zhkHNItOd68JDbiiRQfW4itY0HwzPOkmLV60tRMTFw/LBuUMmUruyqMOMGyMi7GHTLklywYAcGr+nXlIoepsnOA0q1gecNKCSx2v4xunrXB+gydpLTOSrw36mEgN1slarqp0Ws6qlW0jlOjChg3COZ5gR2+A3E2EcSBQavobGpTvLHutMnPLC9G/Jvx33vx3TSVXv2I+aPh944FCW7Dj4El+0uJbkI2v2yQjzz8MXajPP8vgeA1VnVmZ2haTSJTfCuxEVjEtwgxyeA80PXTcoC+Fkt9fLi/UZHjQhMIq6YI/5gnmDr/XP9Chfs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(451199021)(37006003)(54906003)(38070700005)(38100700002)(122000001)(66946007)(76116006)(66446008)(91956017)(66556008)(66476007)(478600001)(86362001)(64756008)(6636002)(4326008)(316002)(71200400001)(33656002)(83380400001)(41300700001)(6486002)(2616005)(36756003)(186003)(2906002)(4001150100001)(53546011)(6506007)(26005)(6512007)(5660300002)(8936002)(6862004)(8676002)(219803003)(207903002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27D5DB122B37B74498E778E284FBF16C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5827
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	abeb1eed-8ff2-4463-fe1f-08db5c6aa252
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bo1CFbJZdIoltmNognnpmrm+qSWZWCWZ7VkJMmQT9es9LTY4CV2RSKcrit9FUkZ7vsEg2lr54DHYGjMUmVMY168bZ8PMZ0s6f7V4QNXs7WQxEx9ccCe7PupTv6vyFEEpH4mNP/h+5d5zrQgcDNxjLh9fWjSVNBI9WhM3p+bjDLoXL3domK3Rm0NenFtNquR3yPaypx9LWHna95uV+zGrpQa6blS2zdBqtVgeJLx9leNlBctKiGcQJA9AM5m1tuZgjyEdTPwVjAYzCZRFTr7ErRchpE58EkGjEvmRtm9siMzXwdXk8+qLt5CIlK7f4hvRtxQ72DjfOI6+p8u0tiTL0M7opXCHq6Hzjh3W3VAbQuwoj2qOnAPp1HAYiDc3P5qKlLqCZREB+tDge48rI7SqvKOmzz80rl3hNDK2U2PfRLBPoh76mhYw7pWTCHNmjBhFxzJp5dy1lS/7pCwr4AEjPaIhfB5QvXpYOgs8PpMuhmr/DfwuEL0C+9msXRm4T4pJP6D3fL6mDaLvaj9WxFhSOF4mKmoUbKqQxsgrW/UixuZN/Zj9nG94CLhExWV6bkhQC/idQuzMsh7YItS/XtSFlOJLSgoUgsGass0wAYswUnP3VuqGrxfj6UQ+orQ0pyeoT0KBlRcRFZjho+RIQAnZZ8zlyIfA8bFPWXWMeyVMPGus5wpE2iT7dUa3FS0agoWUuxyhT8NcM3ZWcq6wR3i+B3h8AT0m4tGpkgWTlrpH0gibvsZeONJh1oF/Nq9WhdqOYHz9rqQK6gNl26qkc1LuF96kVzv9l9gyINdAI2g5SNbFMpo8T4gFCz2OLp0N+ZfOqeskLi1CqdM954LoiYVevw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(6862004)(54906003)(37006003)(82740400003)(70586007)(70206006)(82310400005)(478600001)(86362001)(4326008)(6636002)(316002)(81166007)(36860700001)(33656002)(47076005)(356005)(83380400001)(6486002)(41300700001)(336012)(186003)(36756003)(2616005)(2906002)(4001150100001)(5660300002)(40460700003)(6506007)(6512007)(53546011)(26005)(40480700001)(8676002)(8936002)(207903002)(219803003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 15:22:21.0500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa4387d-8be9-4961-ba9b-08db5c6aab24
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6023

Hi Luca,

> On 23 May 2023, at 09:43, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> Arm now can use the "dom0=3D" Xen command line option and the support
> for guests running SVE instructions is added, put entries in the
> changelog.
>=20
> Mention the "Tech Preview" status and add an entry in SUPPORT.md
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Acked-by: Henry Wang <Henry.Wang@arm.com> # CHANGELOG

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes from v6:
> - Add Henry's A-by to CHANGELOG
> Changes from v5:
> - Add Tech Preview status and add entry in SUPPORT.md (Bertrand)
> Changes from v4:
> - No changes
> Change from v3:
> - new patch
> ---
> CHANGELOG.md | 3 +++
> SUPPORT.md   | 6 ++++++
> 2 files changed, 9 insertions(+)
>=20
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5bfd3aa5c0d5..512b7bdc0fcb 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,8 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>    cap toolstack provided values.
>  - Ignore VCPUOP_set_singleshot_timer's VCPU_SSHOTTMR_future flag. The on=
ly
>    known user doesn't use it properly, leading to in-guest breakage.
> + - The "dom0" option is now supported on Arm and "sve=3D" sub-option can=
 be used
> +   to enable dom0 guest to use SVE/SVE2 instructions.
>=20
> ### Added
>  - On x86, support for features new in Intel Sapphire Rapids CPUs:
> @@ -20,6 +22,7 @@ The format is based on [Keep a Changelog](https://keepa=
changelog.com/en/1.0.0/)
>    - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the s=
ystem
>      wide impact of a guest misusing atomic instructions.
>  - xl/libxl can customize SMBIOS strings for HVM guests.
> + - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Prev=
iew)
>=20
> ## [4.17.0](https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dshortlog;h=3D=
RELEASE-4.17.0) - 2022-12-12
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6dbed9d5d029..e0fa2246807b 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -99,6 +99,12 @@ Extension to the GICv3 interrupt controller to support=
 MSI.
>=20
>     Status: Experimental
>=20
> +### ARM Scalable Vector Extension (SVE/SVE2)
> +
> +AArch64 guest can use Scalable Vector Extension (SVE/SVE2).
> +
> +    Status: Tech Preview
> +
> ## Guest Type
>=20
> ### x86/PV
> --=20
> 2.34.1
>=20


