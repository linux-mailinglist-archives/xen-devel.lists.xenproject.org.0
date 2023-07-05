Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C95748469
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 14:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559168.873908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1yY-0004pb-3t; Wed, 05 Jul 2023 12:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559168.873908; Wed, 05 Jul 2023 12:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH1yY-0004mo-03; Wed, 05 Jul 2023 12:51:18 +0000
Received: by outflank-mailman (input) for mailman id 559168;
 Wed, 05 Jul 2023 12:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cLSs=CX=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qH1yW-0004Lv-Bx
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 12:51:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0998cc6-1b32-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 14:51:15 +0200 (CEST)
Received: from AS9PR01CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::9) by DB9PR08MB8267.eurprd08.prod.outlook.com
 (2603:10a6:10:3c5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 12:51:13 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::90) by AS9PR01CA0036.outlook.office365.com
 (2603:10a6:20b:542::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Wed, 5 Jul 2023 12:51:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Wed, 5 Jul 2023 12:51:12 +0000
Received: ("Tessian outbound 52217515e112:v142");
 Wed, 05 Jul 2023 12:51:12 +0000
Received: from 997c12af747f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 083DF943-F324-4B86-AF6E-82841F3EF1CE.1; 
 Wed, 05 Jul 2023 12:51:05 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 997c12af747f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 05 Jul 2023 12:51:05 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 12:51:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8f61:5b01:4db1:8363]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::8f61:5b01:4db1:8363%6]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 12:51:04 +0000
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
X-Inumbo-ID: a0998cc6-1b32-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ub/C/RLbS6rI+dxyw0fnlJ0n+0f8QBhZXs+h7BtJJuw=;
 b=TKssBKktVvd4dFjjPg8TttV4yPCie+/ezTrYxEI8dPKkYlRXfbZnhh0Jrew/bjOi5WPp2qKYO+xgpIiAd/fCmC1qwHWyRlXvioxkQS8UP0758wg0fPPZ3XOX88FBCV3apD1DkZagBgvWNbMnEADEhNmts/uKlNfMxAf7nRDS69Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6120206b02126603
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCoslujw56y/OSov1rHkDriXWhtOWQ6UFfrSlflNWJAv3VJF1Tt3CSGz7bApqjQkcp6bcJyWViA5i/3X2pQdk0dmGXIfUJYSsWmlyWzSemQlBkPxtRpNYDU8vNwQ7ybYqWl9ESElTX2UpFpYzwFQfkyWBs7GzjkuswXjWKxxGyM5ReFNHTA2paKRZyfukTl0DbcIGJYjhP1r3H5IU8atPRUrRgHTXciPNKamBhvPrpmsIRI08x32HhSveITb2d7EtVNZBPiV8oQVnFg5SOz6OulsGyjVrNnzzOz5kZstGBHwlPAkvOj88D1SpU8OkoIGKiGqI+bV2n/QDeEaz2/a5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ub/C/RLbS6rI+dxyw0fnlJ0n+0f8QBhZXs+h7BtJJuw=;
 b=W/G9znqQWbjUSmXK/eWMMLYQ5iswbdAO+3t+CsVeiN8XhsPy/nvNp7WBIyf7qWmLPJ7EuBSXeT4SeZHeOPNEkcXhRwI0GwSyMsZQcZMIZ+Z696NkeTCiDykuJm7uJE95Fn6B99O/SIVmk/tGEFTuxh1wUk9pvPsMZRATVGX7gjjHIWDfroTtP05zqzbrBb1LxXTrukMEFXeLdUnplAxPmHBg1kCUFUAVPGRECFeol2la6tyINAeMp9SzsWi+GPrJFLhDjOQYcrg04HmriENPHAfNS77j5G55Be2j+V/WPlKDLCTEAxnDqpcDSgE9oS6wPmIMjk8Ze2ru1P1awDWQig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ub/C/RLbS6rI+dxyw0fnlJ0n+0f8QBhZXs+h7BtJJuw=;
 b=TKssBKktVvd4dFjjPg8TttV4yPCie+/ezTrYxEI8dPKkYlRXfbZnhh0Jrew/bjOi5WPp2qKYO+xgpIiAd/fCmC1qwHWyRlXvioxkQS8UP0758wg0fPPZ3XOX88FBCV3apD1DkZagBgvWNbMnEADEhNmts/uKlNfMxAf7nRDS69Y=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Henry Wang
	<Henry.Wang@arm.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, Penny Zheng <Penny.Zheng@arm.com>, Wei Chen
	<Wei.Chen@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Thread-Topic: [PATCH] xen/arm: Kconfig: ACPI should depend on UEFI
Thread-Index: AQHZrzemFhjMGQXcTkKAEu+0mA/HSq+rIDqA
Date: Wed, 5 Jul 2023 12:51:03 +0000
Message-ID: <FE3E6650-ECCE-4E3D-9515-FDB589FF025D@arm.com>
References: <20230705115534.26004-1-julien@xen.org>
In-Reply-To: <20230705115534.26004-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6588:EE_|AM7EUR03FT059:EE_|DB9PR08MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f6b45e-a0b6-44e0-d31e-08db7d568348
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 HXE0NfzYtwKvpJhA5uay40i66KVaVK18qRjyg0dhWaxOYxAZSmbrWam5fYrgMEfNC0C5lko667wpfgyTArs7Ei+iWO6GjbHneZvdRnL0VL84qJQOeIHguWbRhUqIn+tcbwROUK4Q5aKKEFRUV9U8B97uke2kNSEYuCPkErLCgZYtjYI5U62Q+bY8vVi98xJatcozJRbCAQqpfZSulsn7ltuu+1K6GaN+vYX5SetVqAAZ7brz7Zh7a/z/PYJlm1zlXLY9xBbPuvK9Q5FQ6AqfldHh34o5Afs4QktI4kUykHdJc9FqRWnx+bWUgcBmzX134pTDuGNJ4vh6pqm/M8fHJt1ys3CXKJ4IqmUTB5ZsQj411j7ygXxVC5wC2ah0zVLf241eqvjZS5FQz2Nn406SOMhoLUEGWxUuZE2Qsy0nik+/vt1bdWWv0shVTNnvd9AioZkKGdW5yvdwxYIUoxH7DLvfTuiw68+XiPWCmfGvsDti3mSwAIqaUd1wnXJs2sg/qblEYgmc2V/yz4jncpst7c+HOnGft6GMV7dTKUlOjj+exhB5QA07jgbiQnjMD+BTMGh3OAWaZMOKjYhVqrfJbtpybBNAS7uhecTKDE/Wu07vW78NQNPay4EO8YVxs5hIf3tubBh49ybB3s8KTrIR2g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(451199021)(36756003)(38070700005)(86362001)(33656002)(2906002)(5660300002)(6512007)(83380400001)(186003)(6506007)(53546011)(91956017)(54906003)(6486002)(122000001)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(38100700002)(316002)(2616005)(66946007)(76116006)(478600001)(71200400001)(8936002)(8676002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1E10B91C0C8264A8584D68678EDEDF6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6588
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ad7d4547-45b0-4728-eca4-08db7d567e29
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xgfL8gbZ+fRwNzBvVILQFBdz04hFPDjn0xYFJUKkvrce0l5FgeeHqEEaD/fv0SJog7F3SEYP9lngAyHBNqLrhTFb5msG5RqALWbQgSU56FKxffN1VWajCR7igwMlOLp3vEydPyIGNNtwiz+MHHNBDWxTzDlAg7rgF19yrVqmnOYRnWNPQ432BQijVMOo5n/AzHoP9+TF6jq17lB+XcVdgjiDK1Iz81Jy1Txva7Me1fjeZ6l+dGjkwXvKMMb8QbncAK6ZKGyMUPhSBxt7qHTvNc5Qz2JFLN8ueyCiNOLbQg8IbdXl2cUuwYc6m0nUqH2ZcRRlVe7scaSs1JEd7xuvUZv1QkVhzdzi5275RQKr+MV90u69tIK0zvCpAewdU+kXF/e52Hwsu3N3un4bDbExV7UOB0bGbJDBQ5rULVAhQ55wqaatmlEq2ppSj1XhbVtTW/tBPE/X1tdCRGuknJe/+NvmTfL974/nQwc8W3vRXzmG3d4SfI7QH1ASQPkTBKpJlN69JC+AZKRzCXlHn3iqdcwsFCreQ2vy7V+axKhJjDQuE68fe/mHLtto/UsigAKafq3cYZypktZhvMy1JiSCuzitmIAANO5SzyZImBzGA2nJ4TEYeDnJpd9aAlH3N6+s0M47BW4ocvmoD8juA3AIObwa7qWMPEDz4TgRx5CvDiTGeOIZLBHqyws3BFvlIwl4iOh52igwlTqdqhzT6DwiYPlo+K349p1XaQy173OxHhBpSgb49ZXHC3dy+drEf5zG
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(70206006)(8676002)(8936002)(6862004)(2906002)(2616005)(70586007)(40480700001)(5660300002)(6506007)(53546011)(26005)(186003)(336012)(41300700001)(40460700003)(107886003)(82740400003)(356005)(81166007)(6486002)(4326008)(47076005)(33656002)(36756003)(316002)(83380400001)(54906003)(36860700001)(478600001)(6512007)(82310400005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 12:51:12.5679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f6b45e-a0b6-44e0-d31e-08db7d568348
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8267

Hi Julien,

> On 5 Jul 2023, at 13:55, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> On Arm, it is not possible to use ACPI without UEFI. In fact disabling
> UEFI but not ACPI will lead to a compilation error:
>=20
> ld: prelink.o: in function `acpi_os_get_root_pointer':
> /builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:
> undefined reference to `efi'
> /builds/xen-project/people/andyhhp/xen/xen/drivers/acpi/osl.c:73:(.init.t=
ext+0x8ac0):
> relocation truncated to fit: R_AARCH64_ADR_PREL_PG_HI21 against
> undefined symbol `efi'
>=20
> So make the dependency clear in the Kconfig.
>=20
> This was spotted by the randconfig build in gitlab CI.
>=20
> Fixes: 12314be5749e ("xen/arm: make ARM_EFI selectable for Arm64")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/Kconfig | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index c30f32457388..439cc94f3344 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -63,11 +63,11 @@ source "arch/Kconfig"
>=20
> config ACPI
> bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPOR=
TED)" if UNSUPPORTED
> - depends on ARM_64
> + depends on ARM_64 && ARM_EFI
> ---help---
>=20
>  Advanced Configuration and Power Interface (ACPI) support for Xen is
> -  an alternative to device tree on ARM64.
> +  an alternative to device tree on ARM64. This requires UEFI.
>=20
> config ARM_EFI
> bool "UEFI boot service support"
> --=20
> 2.40.1
>=20


