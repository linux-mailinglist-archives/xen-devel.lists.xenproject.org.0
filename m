Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 095A35FD34B
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 04:36:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421602.667072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oio3w-0003Y6-Gn; Thu, 13 Oct 2022 02:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421602.667072; Thu, 13 Oct 2022 02:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oio3w-0003Vz-Be; Thu, 13 Oct 2022 02:35:08 +0000
Received: by outflank-mailman (input) for mailman id 421602;
 Thu, 13 Oct 2022 02:35:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oio3t-0003RZ-S7
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 02:35:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80071.outbound.protection.outlook.com [40.107.8.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a364255b-4a9f-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 04:35:02 +0200 (CEST)
Received: from AS9PR06CA0333.eurprd06.prod.outlook.com (2603:10a6:20b:466::12)
 by AS8PR08MB7356.eurprd08.prod.outlook.com (2603:10a6:20b:447::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 02:35:00 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::e3) by AS9PR06CA0333.outlook.office365.com
 (2603:10a6:20b:466::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.25 via Frontend
 Transport; Thu, 13 Oct 2022 02:35:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Thu, 13 Oct 2022 02:34:59 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Thu, 13 Oct 2022 02:34:59 +0000
Received: from b8643861a16d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 437F7058-6EEE-4350-B020-ED82840B73F4.1; 
 Thu, 13 Oct 2022 02:34:52 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b8643861a16d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 13 Oct 2022 02:34:52 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by GV2PR08MB9878.eurprd08.prod.outlook.com (2603:10a6:150:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Thu, 13 Oct
 2022 02:34:51 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%7]) with mapi id 15.20.5709.015; Thu, 13 Oct 2022
 02:34:51 +0000
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
X-Inumbo-ID: a364255b-4a9f-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZarkQoaDxyE2/SmiTZH3JIZZOIY6tEWZATInuvtnlyKwRSd8GSgT5qbh/Lh821iqtYk4tHseUXAB+HLqedKzYrWlS8kR5QtbtJVRBN+oTYVgfx3buTYy4CEDKcG/lMlHS5lcgmzekzMFPuzy23Pfw+1WVWycwyhuV5Du7sjmAbe/XW1C9uK6Djf8bDyoF46A1XBwKo4beYEO7ryKUS95Fr2AYFjRnjOK/z3Qinn4zD2NRuE+pO/LX19I/HTyEogHjVNApov+WPZbHULkomlbkYM8qhNWWNowvWY3C2ka98NrpS3PhCu19iC/3JWZ8214UmRxJteqsQ8cOudaBl14Fw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKapJyO6y/fadcTC42/DuTDcVTUcOS604Lcc9O5P5O8=;
 b=c9/6Kj7ETZEIC1YccP9zVDWns6PkFuYwcKeBY/4OPcTbO4pReocoQfTEzqPy2drUMzU1BQgVtMspkGxDCBv8R7el8dUB+oL6CSaBS3DewCLR/UBLGBdl4jGkD35K5s31nsAfXpGgekD4eQt0+oNCBoRTx+uOBvrNwgwdQzoZxLgWasfVKdF+3n144IAOyW1kaSzAJnKagYyNjQ2upQuL7Alw164lMQRwis/YiY+39rFvFV6EEZbDOZ/Kow2j9Mp7Lx0logEMttnsDr4r2T1pMx8iliYCCNIpppW2onEXe2dVb8LUcKjYVqLVnGEeOaVDrBV14JSZSS/3E9dKZPpmzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKapJyO6y/fadcTC42/DuTDcVTUcOS604Lcc9O5P5O8=;
 b=4TWdjrvxMG6xMdT2Zyw70Jf62dpGt7MtEYpVGc2GiI27Wz5uD2Ar382587wuyB4oNnXiGkslSLJZUHV201fWVl+U2/HMD/I6pZzcskapx2Ztyq888s/L853J3r6VdNuDI3hi/K4PEc5uU2QtawR4k2HaLLXJM8wue0e/NldaSic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABZ2jgTRb9vC68mV167Q2q87NYNPUD39/f0poN1JDsVzvzGoTedZGJKixojOJ6TyuaRyHvVc7g5U/vfUNmhKNzj7SbldHb4NnB4+fAiSmms/I95btviefreM/ugF70E8a2k+dgzBK2Y1vyzKyRo+twPNRNzwJX7sNZS7la5Y5/aOqPTHK0Vf0RcR2uk1jM+5e5BACfmqoDSwEGH88hV2EWH4Z65219s48RcDw8WtbzpQD1984alNJJVZlFZm9uvaNdhgCBFSBUcaMWOwkk4Qnsq6NaTxeii8aX2P5izM0k0lFRIX4t7ZythGbhQSjbgZ8J+LYGkG0Cm/gqblAiSdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKapJyO6y/fadcTC42/DuTDcVTUcOS604Lcc9O5P5O8=;
 b=LSPVYTeKi8dL4uxpXtr6pCuYS1sTkpHIKOUx5i2M0p3zpWSdh1/n61HMHycWiirqkV5+0C7qMyKsQ3MphMIGU2KwVQ2HVPkwwwG6xXaaehqAbZo/xd5FAN4CJJD/W638vBWGZLqH4eB4pcciO+4hY9xIwUNkSuQFbWQmZNntRKbwVOXDjjDKom+2TmjsIoMokPjgbM9BGN3ZPzDk7nxxcFRyC6g9GAoN05OrS7VGFjH3qqh83FnGFPWTsTzu01po1s/l7o25KMBTSGgfy39J/qt9HDs4aFe1UNdIXeVx5WhZQRu4BjijQ5iWGoG+hj0Lzu5kCHeqE0t3mw7sVdvaOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKapJyO6y/fadcTC42/DuTDcVTUcOS604Lcc9O5P5O8=;
 b=4TWdjrvxMG6xMdT2Zyw70Jf62dpGt7MtEYpVGc2GiI27Wz5uD2Ar382587wuyB4oNnXiGkslSLJZUHV201fWVl+U2/HMD/I6pZzcskapx2Ztyq888s/L853J3r6VdNuDI3hi/K4PEc5uU2QtawR4k2HaLLXJM8wue0e/NldaSic=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Edwin Torok <edvin.torok@citrix.com>, Rob Hoes
	<Rob.Hoes@citrix.com>
Subject: RE: [PATCH 2/2] tools/ocaml/xc: Address ABI issues with physinfo arch
 flags
Thread-Topic: [PATCH 2/2] tools/ocaml/xc: Address ABI issues with physinfo
 arch flags
Thread-Index: AQHY3mggOd+/b8rDG0avfRBy32H2Yq4Lm9Sg
Date: Thu, 13 Oct 2022 02:34:50 +0000
Message-ID:
 <AS8PR08MB799143ECFEAD9EE44476E8F092259@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221012182552.26866-1-andrew.cooper3@citrix.com>
 <20221012182552.26866-3-andrew.cooper3@citrix.com>
In-Reply-To: <20221012182552.26866-3-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: B18DD78D47D52545ACA639AB6401C7A1.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|GV2PR08MB9878:EE_|AM7EUR03FT057:EE_|AS8PR08MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e3276e6-a5e5-4480-539c-08daacc3860d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3brve+I2refB32qxHu7Z8CwV6pOyC+EmVWRwParo3kr9gGj5PbIpoQcYWeJucXy2f4/C29eDnvbtUYJZ32fLvK1ulygz0a3i4gU7aQe8MwRGj1F2bysl59I2Z92e3dsrqaeVauCro70q9mHfHO4X9p3AuHgNlnx9jJeyDAEuYHz8WBPJGiZ0hPOBIUzRRIxLibANGJy0VZD3/S5qzuPQ3ekwQvf3EqY66ne+Yx4cxGA9E+QLrpoBDHJB4vzBMpwUY143rjVVhn4aKjJyysH6IAK42uFKSjlH6KfV/M2F5T7SvWoQ8QB4X5h/e6vwtdDaTN8MPZrV/uXgMAXzzt0iERtArHCTly37pd+3uRRUSFFgY0nF2kg7oRcLyj/ezf/THkvCy7ke9S7+nKF/5gBM8YX2KholnKDZ1PlaqMHO8ADRLwP38IL4iaxRiRY7m8MD4xLDSiaKiiGKy5sqAkS+jsv1WvJIIA/4+aDBAm+N56SCQf21gI9wI+IHyo7z5QmjaXUw/4jGSglJnvAeu47Z27L5AnZKMRraZAJL8Kr/tofVzXg9wRIpHIO5FIhn2LD51McU6bbgZ/Xuac0iGccikcXFzWSuuWFlAsjkoSkXOQh5EV+UT4Ycb6A8dq6/MCtxFu4ezpy4Z5X6MG9phYTg4pFiFdGnClcKeoYdwd0RNawpFp7qDfrfpso0XUYAPPew+7j7K2Rv6iO+IrgfBT/zPY+QAgDzc39PbtHooACjmIBo6h5NAl6mfYOxNV5PbYzWQ0AMIYPmOHwjHYcsdzCu4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(7696005)(52536014)(6506007)(55016003)(41300700001)(110136005)(33656002)(478600001)(54906003)(316002)(186003)(4744005)(9686003)(122000001)(8936002)(26005)(38070700005)(5660300002)(38100700002)(2906002)(83380400001)(66476007)(86362001)(64756008)(66446008)(8676002)(71200400001)(66946007)(76116006)(4326008)(66556008);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9878
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	72b3802c-6b47-4ad9-37ef-08daacc3810f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GYVRFULysOxRgY8H3dH/LNMLuNLvymaqnCT6ZeNsVmxQSDCQv0BS0+GOXla5jhYk8yibrDDoROIxL7CTbSahImQ+Ni6xM4z8+xna3NfJhGbQ1He1LM8i9jxEdwQwIhfw1tS2xG3ladSKlS2Fa3AyMeuZsRK3XEeoJdgqbiu1X2QvqxxZ3krcnpHrUS7RnmgRmKfPrtOL/qReK2tABSLKyTII29fppmrDO8NcF4ScmummeDkjBBRTBbi9iaeZEb8k0EK/vUhmQ2l2e8gb6uEQwxeNfmpZ2KhihsI1D8c9NzyEKQnBWCpiD7DxD7jCs5DLbA+YIOFungaUF+/r6OTnZnA3CO7bTIX6jh7WqfFmZB5UgiEZ5V39jVOtL35bTzisQuu8BsrlaE8Kz69paj5/2g90+EmsRwIzAuk58t3S4AvT6OKS/5tHxrIGXVWYlEQdm+JccnqjbxUmT8sq60buQgimL6+I32i1lbGyrrCV4lmhZlmOddY0v8QcHRUCuQCx3aXyhRBo2Z1FdM8WeG+bGmu2T9guMU2ZhVeu6H0DcxkrjLgVzWoC3bSDOoL6r8lmcBTZZzqUOoRJWjGdFaZo02mzbSd/f8pvaGAsXD3d9/JqSZftu+1nFM+ZmhIBVtLFYYgpW7PgV5s+3r1IgvlBng5jZnDFPxM+xgErFEosYFkLVDvGtNb3HvkKCjd9zBvRY7Bnk1yYReF8hOirtdrtqrJg+m6Fc4mPmr2CQZm0aciMfGwUS0dzKJJw2lEmDl1UAEmX9jmtf+4lJUz1XIta2g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(451199015)(46966006)(36840700001)(40470700004)(40480700001)(186003)(336012)(9686003)(26005)(55016003)(2906002)(82740400003)(52536014)(316002)(33656002)(110136005)(8936002)(54906003)(41300700001)(8676002)(4326008)(70586007)(70206006)(86362001)(107886003)(81166007)(356005)(7696005)(6506007)(82310400005)(478600001)(5660300002)(40460700003)(36860700001)(47076005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 02:34:59.3498
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e3276e6-a5e5-4480-539c-08daacc3860d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7356

Hi Andrew,

> -----Original Message-----
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> Subject: [PATCH 2/2] tools/ocaml/xc: Address ABI issues with physinfo arc=
h
> flags
>=20
> The current bindings function, but the preexisting
>=20
>   type physinfo_arch_cap_flag =3D
>          | X86 of x86_physinfo_arch_cap_flag
>=20
> is a special case in the Ocaml type system with an unusual indirection, a=
nd
> will break when a second option, e.g. `| ARM of ...` is added.
>=20
> Also, the position the list is logically wrong.  Currently, the types exp=
ress
> a list of elements which might be an x86 flag or an arm flag (and can
> intermix), whereas what we actually want is either a list of x86 flags, o=
r a
> list of ARM flags (that cannot intermix).
>=20
> Rework the Ocaml types to avoid the ABI special case and move the list
> primitive, and adjust the C bindings to match.
>=20
> Fixes: 2ce11ce249a3 ("x86/HVM: allow per-domain usage of hardware
> virtualized APIC")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


