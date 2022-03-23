Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 451EF4E4E67
	for <lists+xen-devel@lfdr.de>; Wed, 23 Mar 2022 09:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293793.499208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWwYh-0001NW-85; Wed, 23 Mar 2022 08:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293793.499208; Wed, 23 Mar 2022 08:41:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWwYh-0001Kx-50; Wed, 23 Mar 2022 08:41:35 +0000
Received: by outflank-mailman (input) for mailman id 293793;
 Wed, 23 Mar 2022 08:41:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7r0c=UC=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nWwYf-0001KM-VV
 for xen-devel@lists.xenproject.org; Wed, 23 Mar 2022 08:41:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09a12a94-aa85-11ec-8fbc-03012f2f19d4;
 Wed, 23 Mar 2022 09:41:32 +0100 (CET)
Received: from AM6P191CA0058.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::35)
 by DB6PR0802MB2327.eurprd08.prod.outlook.com (2603:10a6:4:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Wed, 23 Mar
 2022 08:41:28 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:7f:cafe::b8) by AM6P191CA0058.outlook.office365.com
 (2603:10a6:209:7f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18 via Frontend
 Transport; Wed, 23 Mar 2022 08:41:28 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.14 via Frontend Transport; Wed, 23 Mar 2022 08:41:27 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Wed, 23 Mar 2022 08:41:27 +0000
Received: from 64ed93d38324.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E7A9CDC5-AAA0-4945-AB05-5AEAF317BD11.1; 
 Wed, 23 Mar 2022 08:41:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 64ed93d38324.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 23 Mar 2022 08:41:20 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by DB7PR08MB3195.eurprd08.prod.outlook.com (2603:10a6:5:1e::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.14; Wed, 23 Mar
 2022 08:41:17 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::8113:3b77:e3a2:b008%7]) with mapi id 15.20.5081.023; Wed, 23 Mar 2022
 08:41:17 +0000
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
X-Inumbo-ID: 09a12a94-aa85-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhTacJy/EhL/i7CwFmI02Q+n+Zg/gcViBEPvDF7NeqE=;
 b=CSx4x02CU2lNPmM/hzcoEREYVqMQ5an3NziQ/wu0gXNlaahhDKaffuOJ7iJ13InemdafvGQCJcU7MJ23H4UFBQ9VBHE6Iy72/xEHXwFK8cYqyuFG7E1/iipZDG9JqxMjdL/df9/fzyy1sT2cRcx/LMRcAvApUy/lQBQ3aLLSPgw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9161aa2d07b4c833
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J/a0xf/01i8cIrj9vV61AqmHyvIzTyCs0RGmHaMKJ2j9fEequKVUCDVJUH3mIE9TPqrS6t0wAnVkYnG9LknWGbmcd0brV/W8DmPpr054GTVHMxN7LU4WRJ3UFMea5g19y1VJakr9Ehk9taF86/ny06VWFEQ8UQ7tVr0tXDirCjUXzrBIzKOJ7CsHdRHeyUZcmSqy10ZxbS0+49YABJSFTsc3n9tqbE9vG+o1BxRRrtdtl76X6ozH8C1D1jrA0G48B/cluvk32GLy8YQ8XGK5e2JtYGzhJnB/W0DC2hJbsIEJempVXbemII5gU+/dvjCWb2qjHun99Ed9vobzJBMHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhTacJy/EhL/i7CwFmI02Q+n+Zg/gcViBEPvDF7NeqE=;
 b=XJx1ADnDtdNvE0eLHL7KHCJ1nhtk2wn55RgOO9s3IHwvjuFWYmwsujZocX4kwrYINdshanwyF+x4v8quhUuDpD4qefh48sizhDRhtwvVIbzy5J8Uw1SISa8wy20XZLG7F3LJgircDdT2z8YK8D/CthUD67mU5Q/YNlCawGw7dJRK3d2pOEBkZve+NM/4o/drz1+l3DYEAkPqkcRT8jwQjGkMWbMsf/EPao3Gv6uWM48CneRfcqlIWFOxJTQ/y5kQw222f3/dbCcqDedAk7kUtyHF+TA74J5GzvU5k57Q8xtnJlGhfuuZlyWQHXTGfmhycVWabVIY3QE76AYiBFOB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dhTacJy/EhL/i7CwFmI02Q+n+Zg/gcViBEPvDF7NeqE=;
 b=CSx4x02CU2lNPmM/hzcoEREYVqMQ5an3NziQ/wu0gXNlaahhDKaffuOJ7iJ13InemdafvGQCJcU7MJ23H4UFBQ9VBHE6Iy72/xEHXwFK8cYqyuFG7E1/iipZDG9JqxMjdL/df9/fzyy1sT2cRcx/LMRcAvApUy/lQBQ3aLLSPgw=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: provide and export ADDR2LINE
Thread-Topic: [PATCH] build: provide and export ADDR2LINE
Thread-Index: AQHYPgDW0ExT1npxb0S4HRybiy8x26zMp4MA
Date: Wed, 23 Mar 2022 08:41:17 +0000
Message-ID: <460B770C-B754-41E2-8126-F59D32263B51@arm.com>
References: <45de6ac3-7701-0b37-8ada-b46f4237448a@suse.com>
In-Reply-To: <45de6ac3-7701-0b37-8ada-b46f4237448a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 3aeb7222-18ad-46c2-2fc5-08da0ca8ebda
x-ms-traffictypediagnostic:
	DB7PR08MB3195:EE_|AM5EUR03FT009:EE_|DB6PR0802MB2327:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2327D56249D84A87A4E140B9E4189@DB6PR0802MB2327.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x5fLt18LDRj57Rff+sadWb4ohTeVTlB+/PH3DRNKHzjToTNCEOuQynYd7VIJgemvRC6tHz+LfDOvLaDCOxN51Boy6QGKUGIVXiqOhTSLeFmyLG5raccMqr2MoTxBr7hCyjdX+2D1ms1YSHRm4yOs7TQ8eIoMK7/hufmostBOOZ4BD26EAsHAiIhyLgrLS76MOjujcaucVH/OsipM5vNZRhPU1tWAc9lYrt8K6Uq8sWn1dzLjWqJUtsZiJkyrEOzR6kVQXLtQyphYKbEpztCTm/MjcAGz7eDAHzYh2P0L17b1V4IRGUVSyDm3fzOIHsWnjyrrn8yR0CTw9tvDjKKlNR0d3tzj7dl0CcHxxwUCQ3wiFHuDsZiGz5+sUZmqwDPEwvxsqE0gm2Bxs3xRwLyk5EphYpGDwNW9D/hJPH2CFg1y8Px+borDew6Z5XphvQpYCk2gjKudx1/L8/pjuFZIES+RGMLOkJhYM6bISZqvOEw2DlqT8l6LV3r+78+1XCx5vcLy8nHsztgmT6pUzIvzFNIqACQE8Xs0H0uuddzRH/Gj7EyjJ1zYNJQvjnRqOgt0cJhpn7udVRcERf8aWwJRtYrOKoc8SgMCmJ4VYEyDg3tGJ98LoLc7+pt9Ht3CMzYZuATA2yYQSzwgS2Tg87hzAH/aMX1OQQBPgBnA0qylnvrwguvSGwRtd2N1j4ASjK4aZ2lyrTckH7r50U92407xuCPF1IFWK1cqp0AP0azjPcLJxIoa8MBsnc3yaHsasqMf
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(2616005)(33656002)(8676002)(66946007)(76116006)(64756008)(66476007)(4326008)(66556008)(5660300002)(66446008)(71200400001)(38070700005)(8936002)(91956017)(6916009)(38100700002)(86362001)(2906002)(316002)(122000001)(53546011)(6506007)(6512007)(508600001)(186003)(26005)(36756003)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <538A2E91122877459B6EDDA1BF09938C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3195
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe3dcb5d-4ada-4e53-feeb-08da0ca8e5ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	op/JFvU8Y4+5gCwDCOeN+R4B/4RuJFD0y8JL1WFuLzPMc3aAdD9ChBrOBkMxkJqKd+vPsXAl3tVv6Zqh05WgPZCwifTlH20DEK9W3fNFNM2+7XzElM9YdBBAzbEFkcJTQmXaO8zR9D1v80VIE1Sy8UFrVzQVkUxxBhy7Fn0vniMbzC6T/29S7loCddVMOc3vyVWvNlCOVfr+wNm5Qin0vWfTo6WLZlOA0KpbsGST70AXl6VGNkJAfmfyG01J1j6XThlJSMjgZ9dvkcOP6nwY7yIuhJdCgYIEkafbYtLXmCAOvUPz0XnWGeJawZPcamOZTY/Xj+h3m4EZbRRR56x3OAbLeRPUWYDS3s2HdJiDlV6RjGlqc2u23rfSL27n4tlNLkdwj80JZik0dHftgJa4gqm406+InXZh7XHzZaBvt0QRdc0yaf+PnlFKneZS1aAx56ehRh7SE0SbTD9WzSiFUxmDScyU2WN50TDGTUiA3RpBs86Iyx+05viAEz10sToMAXd91QyU7bNtGm47m8LN521szvGwhmWlwixbcGI6QaNkIMaj6g+/V6kX+JZV/GCVHvVzzA59I8i2s7/xil9bwQvz3wIw86fsa3FuMsXbK1q8RcxZFImpDGSB7knr1w66ry/cW8aCURZhSbzpiwPMn+bDyiLK0jLgHJe/wTw9lHzysdEBjBMguzMpYgrfXfXe
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(54906003)(6862004)(33656002)(4326008)(8676002)(36860700001)(70206006)(70586007)(316002)(81166007)(2906002)(356005)(26005)(186003)(6486002)(82310400004)(6512007)(508600001)(47076005)(86362001)(8936002)(40460700003)(5660300002)(53546011)(36756003)(336012)(2616005)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2022 08:41:27.6705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aeb7222-18ad-46c2-2fc5-08da0ca8ebda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2327



> On 22 Mar 2022, at 15:23, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Now that x86'es check-endbr.sh script uses it, also make it available
> consistently with other tool chain components.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Cheers,
Luca

>=20
> --- a/config/StdGNU.mk
> +++ b/config/StdGNU.mk
> @@ -10,6 +10,7 @@ endif
> LD_LTO     =3D $(CROSS_COMPILE)ld
> endif
> CPP        =3D $(CC) -E
> +ADDR2LINE  =3D $(CROSS_COMPILE)addr2line
> AR         =3D $(CROSS_COMPILE)ar
> RANLIB     =3D $(CROSS_COMPILE)ranlib
> NM         =3D $(CROSS_COMPILE)nm
> --- a/config/SunOS.mk
> +++ b/config/SunOS.mk
> @@ -3,6 +3,7 @@ LD         =3D $(CROSS_COMPILE)gld
> CC         =3D $(CROSS_COMPILE)gcc
> CPP        =3D $(CROSS_COMPILE)gcc -E
> CXX        =3D $(CROSS_COMPILE)g++
> +ADDR2LINE  =3D $(CROSS_COMPILE)gaddr2line
> AR         =3D $(CROSS_COMPILE)gar
> RANLIB     =3D $(CROSS_COMPILE)granlib
> NM         =3D $(CROSS_COMPILE)gnm
> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -55,7 +55,7 @@ export TARGET_ARCH     :=3D $(shell echo $
> # Allow someone to change their config file
> export KCONFIG_CONFIG ?=3D .config
>=20
> -export CC CXX LD NM OBJCOPY OBJDUMP
> +export CC CXX LD NM OBJCOPY OBJDUMP ADDR2LINE
>=20
> export TARGET :=3D xen
>=20
>=20
>=20


