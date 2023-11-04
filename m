Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26677E0D48
	for <lists+xen-devel@lfdr.de>; Sat,  4 Nov 2023 03:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627381.978390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz6D4-0001jP-T1; Sat, 04 Nov 2023 02:16:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627381.978390; Sat, 04 Nov 2023 02:16:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qz6D4-0001ef-PK; Sat, 04 Nov 2023 02:16:26 +0000
Received: by outflank-mailman (input) for mailman id 627381;
 Sat, 04 Nov 2023 02:16:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4ux=GR=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qz6D3-0001HP-PH
 for xen-devel@lists.xenproject.org; Sat, 04 Nov 2023 02:16:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 26a0a523-7ab8-11ee-9b0e-b553b5be7939;
 Sat, 04 Nov 2023 03:16:24 +0100 (CET)
Received: from AM8P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::8)
 by DB9PR08MB9610.eurprd08.prod.outlook.com (2603:10a6:10:454::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.24; Sat, 4 Nov
 2023 02:16:16 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::28) by AM8P189CA0003.outlook.office365.com
 (2603:10a6:20b:218::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Sat, 4 Nov 2023 02:16:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Sat, 4 Nov 2023 02:16:15 +0000
Received: ("Tessian outbound 7671e7ddc218:v228");
 Sat, 04 Nov 2023 02:16:15 +0000
Received: from e58922b0c441.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 391AD7E4-C7D5-4400-AB02-1035345D0B10.1; 
 Sat, 04 Nov 2023 02:16:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e58922b0c441.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 04 Nov 2023 02:16:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PR3PR08MB5691.eurprd08.prod.outlook.com (2603:10a6:102:82::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Sat, 4 Nov
 2023 02:16:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::ae6e:f96c:f2f3:efc9%4]) with mapi id 15.20.6954.024; Sat, 4 Nov 2023
 02:16:07 +0000
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
X-Inumbo-ID: 26a0a523-7ab8-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HvjITBzraaf9crlP7QaPnvRt80NO+UN5A2V58BTkrSaSujttvL2g131nQXiEPa23uFLNALO8VoLpEZ/oYSb4uF/3LnSRoxs+4kAoJiURlLeKu/4Am6ixoOzrYGDhlkl69VVMtLjoaCIDp1UtOwAbniDjF4J0VRgQZO/n89Pf3Zlxbr/es84bEuENTtHxJ5rrdXBtha3RBE4cj8s86lNeBB/GFvC4H2r4RxaI9wXkrSTJnhs+WiYRI75n+kofkZLNbcVkl3p59isVBJzMDLXlXsrl3ou4LUyGNFRn6CXQdL01Kii3nUY+kl7LPBH4bbn34OiYvm4CADv6waXVoiZUiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23ocd15KxNKHpMt7BDapiYDfvLJQwt/++ZubtLmI0bo=;
 b=OfU94rgCfl5GerroLYIsj2xLNaEgSXdZACaQZpwHhc6un4jt8bRnqwwYlpSlnSwz512OT4kUEGLqMIwRNp7vyDAtQe8/vzEp71CjM3J8stsOnxGAqpo43owTR1M14yvAd6SGNXvcxzc/8WmHIlS8RIrN0j/7AElKPlKoK3ttsunpM4+vNFRLZJgYb52kEJ5OnkUTaXETTm68+oPNPHNhMW023JuI9G4gmU1Hzbx7/3B/5sYqi2yGve4d3B0w9efs7poBZIvqDTkcEeMGNMLuQ/l1iHbHkPiN0eWIA6VFnQTJIGjf45ydhRgLPv0Kk0caPTURPCNx1Lqiz+zdGZJK8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23ocd15KxNKHpMt7BDapiYDfvLJQwt/++ZubtLmI0bo=;
 b=MlacfVB7oaGbvoi/4ntunbkbqTbIGv4RIbmSUUrySAGp8o6LSVBH1Ias/mWXEyP6ceBP3TCFNi4YrTRhEZHR62kTxlsIQuOgkj5Q8XSoqqFSOI3acLdT/mVOtZR5vD6YDHkyuJm/XEqkqb9I6aByNEagcbf4EiZ3kxL0yfID8uk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9758cee7acf8c0c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVF2snktdroo1BWppp5Cf1Xy16fe9Swp6Ga+qWnmZAQVlC8zBHbZqVk/A7AraJZ6mDLbLTXOzPQmadJunFBUiXiqBFBNGJAaF+rMzy7LeF3X9tFqNMe08NWdJSFs4/LFfD4hkdKG80WpCXwdjrtr2qlTGcSdwmiD9/yzhT7NIlFEP95OPnP3j9u6M6kIudrBwQ8njXC/o3tszlQtI5VGq0XYFRK+N0nnP3W+cwjiPMiv3rZJDVrNwSTW+JlpmZQ4O14OolMrrokitQka0KL/x2of89j++UIvPC5/2iKWSOMOWou8zzOsiO68Ld9ESRrYfVM3ZQz1C/CN3wp4KuhanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23ocd15KxNKHpMt7BDapiYDfvLJQwt/++ZubtLmI0bo=;
 b=GMdU/Y0SoG2W3ConjG5t3PxANJhUXMHEjSPS1+zDDGEvSSP2xvmfuPpDuSeoBBM57wyA2Eq+N4/tS1Hre4XbYSzKQJd20oEqZii9Q7wb/ojOE/qjtVZbphP+JqGepytP7mcXg7lwNoON7WYUyCyXcv0z5QgddpecuEMSGllBP/IVpVvx6xxBQhhQaTxNZfdaHeMKOZWGMvdu0Yn9NGqlAeIYPQWVGQa3dzCdN47Ak65pxEoX08nh+agokaDmFtsM0ynDd5LZFbLJ+vu6GXSHfP54XvbfzqgH7/4LdWLA0bRqHMwnm5xx0QfNnm7FDmQlHrzPzB1wNcF9L4JKxwmDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23ocd15KxNKHpMt7BDapiYDfvLJQwt/++ZubtLmI0bo=;
 b=MlacfVB7oaGbvoi/4ntunbkbqTbIGv4RIbmSUUrySAGp8o6LSVBH1Ias/mWXEyP6ceBP3TCFNi4YrTRhEZHR62kTxlsIQuOgkj5Q8XSoqqFSOI3acLdT/mVOtZR5vD6YDHkyuJm/XEqkqb9I6aByNEagcbf4EiZ3kxL0yfID8uk=
From: Henry Wang <Henry.Wang@arm.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH for-4.18 2/2] golang: Fix bindings after XSA-443
Thread-Topic: [PATCH for-4.18 2/2] golang: Fix bindings after XSA-443
Thread-Index: AQHaDo6Aq26qQwXlX02gTo8hbJL1+rBpbJIA
Date: Sat, 4 Nov 2023 02:16:07 +0000
Message-ID: <0440F4B8-5099-43C9-9A5C-4786B3310E73@arm.com>
References: <20231103194551.64448-1-jandryuk@gmail.com>
 <20231103194551.64448-3-jandryuk@gmail.com>
In-Reply-To: <20231103194551.64448-3-jandryuk@gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PR3PR08MB5691:EE_|AM4PEPF00027A63:EE_|DB9PR08MB9610:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ac28bf-710a-447e-d9d2-08dbdcdc062c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u4uYJf2WU7FTZfGIDxDDvg6n6melAOpxbTPB6j6aW2WUtkYyAQPi2gFLqGRXm63SJNsKDpoPbyaAqP7wtuiOOUT8qGze8AbPL4fZSK7k9ToiozOwppcQiH0yaRDjlzidI1MILX6oNQwzhtae7kSXUYvtt1nRuX9I+iSec1sUMeW+cK2rnykowWPQerlbxF0n8NMUTfUjKy9xAXFz0Kl3u8bWJGxNBYHc4vj2IBZZrEyCKKCizapvXosoLapNbRxk3JEE/ehO0yUO4zdmdVmMF8eqNcUEBKkjRyc0k6eEB/RmiS+AaxqvhZwZtm+Xf6DpKF8Ikzsf1d/UNtlB/m7QVkPSYsXJ7nQ3jAWak+g4NyJDu016rtggp9W4QqdYfe04A1McOFxFlVHHMsxFfmAYc6bCIiDTmLleKDxUj8UQR20GqCUuAw38XmezuXE57xn1vyAtFmVb/qRO4ftjJCFH9v7I7UBAV7T+dQRIMd/Z8AXrgQhp0Mtp0UQoA0XagP4g8z1zVILrDvDP/MMyks7KmRbdT40/SOftx/Kjl2druhmZbin0VtVRjB55dZp9p+nSwmwB19fwfTlDPtPZO57XgW9r4jYfiAFfxzmYEj4TproNIQf2xpCOwjucSimbQqGtcjngDJh1b9lUJbJaeQxfVQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(39860400002)(366004)(136003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2616005)(6512007)(478600001)(53546011)(6506007)(4326008)(2906002)(5660300002)(54906003)(41300700001)(91956017)(71200400001)(6486002)(76116006)(64756008)(8936002)(66946007)(316002)(8676002)(6916009)(66556008)(66446008)(66476007)(38070700009)(83380400001)(122000001)(26005)(38100700002)(36756003)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <27F26ED12AA7074BB360C46346BDF8F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5691
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	27d4213f-465d-414d-632a-08dbdcdc0123
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	12nCnXW923ztBbKB0bqBxdazCDQfK9o1onJaZsbuFVV8SyunZNv7lb7A48KGtt78+mqSKBlxtwqgpiNtmhymB9hhzMMAKzqfC3XzS+U4Y1uuGH4dMeAcJpdvrg3k3G0sMOHUSBktZmpKDDzU4jZII3/kqQA6V1TxDiF0508iG/a1urThg8iHTPDomWo8wy0zTMCMzGByfrLHQXofmwztWKnVWtKTXGD3+Ioi7hVVYzcq+YCvFNjlslIhOD9zX+6BLJ/uGfsbIlLkZuhjMzHlmLlUSaLRA4Diwmwr09kIuKyXC4FFUPz1hQ9Z9LxjfeBsd+0AUt5UxFCEzywnIWAe30PlYoN61Yk7etXvVr1J30D5Uw5NGQS2Hk/QQw9ZnYFYBanrE/KijZi5IjpX9wkjBE741WodZUj6OSwL6Dh12mFCAVKCRg4lws2aM4jH3UgYp/cnq/+0iqm83I26YE41luvsEvLU404Zxw1FESr6HqMmUXlaxNi8F/DDyqbjy23xSfsahTYhylU6Mlh1Mo8HguY+zLv59YqexJyoMX1YSbLWdZESmSGKMXtT6gmTYc5DWgkX3N9DhTaat45os5rJ+1A86L4NtOVaGTJYIslGBmlkPzE4uLb9MsQT9eJ/glxe2Fa/UP8/c5ADCf0rN8wpQNCVdjXv+EBREKOgJo4ezI+HUStZ4O41GmbamFzjDcnhFz3xY59rgk1snV4PDiJIqJFsPtLI/Ae6u/xqgwRHQzACC9xodwLtKFHEZyL70FAm
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(82310400011)(40470700004)(36840700001)(46966006)(81166007)(356005)(82740400003)(40480700001)(53546011)(6506007)(40460700003)(36860700001)(86362001)(33656002)(36756003)(47076005)(26005)(2616005)(336012)(107886003)(2906002)(6486002)(4326008)(6512007)(83380400001)(478600001)(70206006)(70586007)(316002)(6862004)(8676002)(8936002)(5660300002)(54906003)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2023 02:16:15.7106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ac28bf-710a-447e-d9d2-08dbdcdc062c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9610

Hi Jason,

> On Nov 4, 2023, at 03:45, Jason Andryuk <jandryuk@gmail.com> wrote:
>=20
> The new bootloader_restrict and bootloader_user fields in the libxl idl
> change the bindings.  Update them.
>=20
> Fixes: 1f762642d2ca ("libxl: add support for running bootloader in restri=
cted mode")
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> tools/golang/xenlight/helpers.gen.go | 9 +++++++++
> tools/golang/xenlight/types.gen.go   | 2 ++
> 2 files changed, 11 insertions(+)
>=20
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight=
/helpers.gen.go
> index 3ecffdf0ef..35e209ff1b 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -1112,6 +1112,10 @@ x.Bootloader =3D C.GoString(xc.bootloader)
> if err :=3D x.BootloaderArgs.fromC(&xc.bootloader_args);err !=3D nil {
> return fmt.Errorf("converting field BootloaderArgs: %v", err)
> }
> +if err :=3D x.BootloaderRestrict.fromC(&xc.bootloader_restrict);err !=3D=
 nil {
> +return fmt.Errorf("converting field BootloaderRestrict: %v", err)
> +}
> +x.BootloaderUser =3D C.GoString(xc.bootloader_user)
> x.TimerMode =3D TimerMode(xc.timer_mode)
> if err :=3D x.NestedHvm.fromC(&xc.nested_hvm);err !=3D nil {
> return fmt.Errorf("converting field NestedHvm: %v", err)
> @@ -1465,6 +1469,11 @@ xc.bootloader =3D C.CString(x.Bootloader)}
> if err :=3D x.BootloaderArgs.toC(&xc.bootloader_args); err !=3D nil {
> return fmt.Errorf("converting field BootloaderArgs: %v", err)
> }
> +if err :=3D x.BootloaderRestrict.toC(&xc.bootloader_restrict); err !=3D =
nil {
> +return fmt.Errorf("converting field BootloaderRestrict: %v", err)
> +}
> +if x.BootloaderUser !=3D "" {
> +xc.bootloader_user =3D C.CString(x.BootloaderUser)}
> xc.timer_mode =3D C.libxl_timer_mode(x.TimerMode)
> if err :=3D x.NestedHvm.toC(&xc.nested_hvm); err !=3D nil {
> return fmt.Errorf("converting field NestedHvm: %v", err)
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/t=
ypes.gen.go
> index 6a9ebb3fec..7907aa8999 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -577,6 +577,8 @@ DeviceTree string
> Acpi Defbool
> Bootloader string
> BootloaderArgs StringList
> +BootloaderRestrict Defbool
> +BootloaderUser string
> TimerMode TimerMode
> NestedHvm Defbool
> Apic Defbool
> --=20
> 2.41.0
>=20


