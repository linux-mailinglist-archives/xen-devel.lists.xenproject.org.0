Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839BF67F458
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jan 2023 04:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486051.753524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLbzR-0000sM-1i; Sat, 28 Jan 2023 03:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486051.753524; Sat, 28 Jan 2023 03:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLbzQ-0000pj-Us; Sat, 28 Jan 2023 03:34:52 +0000
Received: by outflank-mailman (input) for mailman id 486051;
 Sat, 28 Jan 2023 03:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dFBb=5Z=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1pLbzP-0000pd-E9
 for xen-devel@lists.xenproject.org; Sat, 28 Jan 2023 03:34:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b700052c-9ebc-11ed-a5d9-ddcf98b90cbd;
 Sat, 28 Jan 2023 04:34:48 +0100 (CET)
Received: from DUZPR01CA0166.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::9) by AS4PR08MB7529.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f8::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Sat, 28 Jan
 2023 03:34:38 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b3:cafe::63) by DUZPR01CA0166.outlook.office365.com
 (2603:10a6:10:4b3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.37 via Frontend
 Transport; Sat, 28 Jan 2023 03:34:38 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.21 via Frontend Transport; Sat, 28 Jan 2023 03:34:38 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132");
 Sat, 28 Jan 2023 03:34:37 +0000
Received: from ef6069c63589.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1404F001-9059-4362-9726-ED0C8D282907.1; 
 Sat, 28 Jan 2023 03:34:32 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef6069c63589.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Jan 2023 03:34:32 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU2PR08MB10201.eurprd08.prod.outlook.com (2603:10a6:10:496::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.28; Sat, 28 Jan
 2023 03:34:29 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::d1d7:166d:6c34:d19e%5]) with mapi id 15.20.6043.023; Sat, 28 Jan 2023
 03:34:29 +0000
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
X-Inumbo-ID: b700052c-9ebc-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OW/rBcIsElCeCi/+9OoWfqxAhGbJ2nZaJF2gZuC1x44=;
 b=L03VvvX8j+vICHNYIBF+cWpkc9QDsVQwy+L93iD8cXCQPOKYIwvomldp0wa3DrIOkci9HEFiLfmHjbmeCDtsf8P8IK0Z8G+iDJyL5t4twlbV3qY9pOrapyqC9vjTU2RNDObwpFpeVIX4fgypCvRtliJajMVtym2H1t1O7o4uz5g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDkrG601KRc7pMl3w81H1cZyXLkS7wNz2tbswAtRhvJJMDvwj2Xub6nFWnTNLRwjMLgGnu244ZjMfOXUrN4Icb91mWJdhqZHZYjrats7gJUEH2zWlysg7Yth6gqSy27kYkOTi86Elg3eOK6geeaY6uqrOmYyTSVc8gPRCXilo5fGnS/x3X69h2KyPAbVD5ImHH6iHDWsh4kEaRQinfS7rVo6fk4hK7dRz53K3kXlJ8E6VjlOra7y/Y+x6xPL9miuTl3faqmsWryBbfVrQy/v7M4d2tRyVEFRybkDWl3yKyvI0FbvECq55CALzoD8LVqFZlQ91sqJ3E24ObzCXFii0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OW/rBcIsElCeCi/+9OoWfqxAhGbJ2nZaJF2gZuC1x44=;
 b=m2rcNmDxslwPbZWPmyrPw6hLLfu7z0s5iRcvNjhgKE+b6cMfiX8EepxXyINRlA1vFYAD78PneqbeLa52MRaEPNqhJ3EZCn+tBmVmVzyZvPyYYYWe6Azpgj2MKZX5RfkeqnRI9t1mL8W8nThlKs56jwZ2OsfEHr1GqNQsog+LTvtvBl64plCHjXKQjmr85QGCbwmuQQo2wzoaFT3DYijrNdGp01PFQdnwwPYiu+Bpac4fMxCO7aIjWoqInT5oImQtXKyc0JgVeSEtz3OTmUYMt+hzQ4HnsaiM/B+Kl0kaq2wyKmP3pKWnd8LlK11s0MheqV1alq1j3xrSif3INKivAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OW/rBcIsElCeCi/+9OoWfqxAhGbJ2nZaJF2gZuC1x44=;
 b=L03VvvX8j+vICHNYIBF+cWpkc9QDsVQwy+L93iD8cXCQPOKYIwvomldp0wa3DrIOkci9HEFiLfmHjbmeCDtsf8P8IK0Z8G+iDJyL5t4twlbV3qY9pOrapyqC9vjTU2RNDObwpFpeVIX4fgypCvRtliJajMVtym2H1t1O7o4uz5g=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>
Subject: RE: [PATCH] xen/common: Constify the parameter of _spin_is_locked()
Thread-Topic: [PATCH] xen/common: Constify the parameter of _spin_is_locked()
Thread-Index: AQHZMoJm2PD2ghcl7Emq47YXKIuaKq6zEkOw
Date: Sat, 28 Jan 2023 03:34:29 +0000
Message-ID:
 <AS8PR08MB79916E7213108E3960B79AEA92CD9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230127190516.52994-1-julien@xen.org>
In-Reply-To: <20230127190516.52994-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2CA0B27134ADB64989C2FFFE3D86D772.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU2PR08MB10201:EE_|DBAEUR03FT023:EE_|AS4PR08MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: 53967866-590e-4c7c-63af-08db00e09556
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j6V1fq56GcOuTHdC0SZ3hdr4TLXzShvn97/LZorKSEoFjwWgVFif/aFVMqGtyF5a8ElcsuORch6xHohTZ19TrninEa91G8KQ22qxoXQQqCWd+kb8BgDUnCiaFYbWEU/w0LbZWKeDJQbC1i9btS1HdqoIOlfbce9HNmNMMLbP4MyPN1MigTdf1NKMTgFJ/WcS0iv6vSVrp34C9ooi38ymP0GU66DOS8AxDyitq8j+jux7J99lI9H4yp8Tq9XPKI2wLF9PIztlSQroYdr2uIsrBWi9Oj/vPpRJYc28m1Z8y7aUOxS50sk067jtyARSj/tc+FfaxYScwMDuc1Gw1Yl15yuq3YzswMM4oYNQAGBYBH3tAaGlThFjLvCwe6mmxaG1MdNhsKabOnIZvQONXMZEG4s3u6PJLxMKLAP1L8eqJLa4fo3sbdDrTzQABTq72/LURe2feycgEtjq/WTlEOPLgnW6jgOe216VUCIOiZARD/f/IpLGvigHu3H4Xi6Unv3jHTySQWGTM6uUHZz4OlKihQFtYePAWhV2ZTRlNrfj/8kIUuTBOQeI9qU1yMeoljjzCpDbcJC5GEpd9aZDxbJtnE7ZwwZP/NGbBoh58x1HIUNLd8DzCvF42WYSzjVnGI/dyUIYKSmrGpXaIQUN2Rsvi9na+6vU2rwO2xKXk1ibrhzn/6P3KZoReuIxSrEATXfud5bPwiffgpMzadeainS8mw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39860400002)(346002)(376002)(136003)(451199018)(2906002)(83380400001)(71200400001)(7696005)(38070700005)(478600001)(9686003)(26005)(6506007)(38100700002)(122000001)(4326008)(8676002)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(5660300002)(4744005)(8936002)(41300700001)(33656002)(52536014)(86362001)(186003)(316002)(55016003)(110136005)(54906003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3cf1ffe7-75cd-40d5-39db-08db00e08ff2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Mjwy6oN/X1X6D2W5xRXp8cuqYYy5+xcy6BgIrGuOqJh2qTHFhNBmme+N7D5nm/+4ivxIKKvEHMLVAwrOnCMcMg6Wa1Ow+aOv6OTLkbCxfizvYvkQ5mxZHCtfqKc9YR6mzvN5yCOhWyFkmlmi42MFzrIgoLGT0zzWJqvJA+8GPIUWCmyyTeZiLGW46PvX0vXMn4cNezMvJRWy25pitDkArRGh76F4Jg2EZS1gpNAKa7x6SVXUtfn0DkwLljVhUfeLxqdpnuOpvPJO3vVawyuqqNPNtZCZDOILjtvimoaB62v251Na8JG101prt1z46CMn+cuRsA5AUkNIDQPbi9RgxCVw/jMjjWghyddoeiMaNZYvkag0tG0KChx7YCy7YjdynAUNXfzKRiX+mJ4MbReYsx6qhnPfo/eA0LVCD26HMp1HUAoistyXh+WqUiAZYp2AWxWtIHnGUIoXwiAD1eksuTFduNWkZWBqJAak/wo8Gy4jyFRJdGetl47mA7AbnSCnGKL8D61j5sxc8rsNOlxxM0z/gSXGkwaZwHKNV7Efu8J1Kbty3G0ldvOlMkLhuvcgdKwCTEVACbbi53hIBljNKCSA/HaPm/6vV4xVfRU2MJul9jrHi9ljRuodbosbsElZLCoLAhNFVGzP3cdM/kGBFs9SAu9VLVRMrm2SjoO6l/VrRp78ihS0kfHC8wScpcvkt4Op/PFVGgDiTtdPB1/VlQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199018)(36840700001)(40470700004)(46966006)(33656002)(41300700001)(5660300002)(36860700001)(8936002)(52536014)(47076005)(40480700001)(7696005)(356005)(86362001)(55016003)(81166007)(83380400001)(40460700003)(70206006)(316002)(110136005)(82740400003)(70586007)(8676002)(82310400005)(54906003)(4326008)(9686003)(336012)(26005)(478600001)(6506007)(186003)(4744005)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 03:34:38.1198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53967866-590e-4c7c-63af-08db00e09556
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7529

Hi Julien,

> -----Original Message-----
> Subject: [PATCH] xen/common: Constify the parameter of _spin_is_locked()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> The lock is not meant to be modified by _spin_is_locked(). So constify
> it.
>=20
> This is helpful to be able to assert the locked is taken when the

Nit: s/locked/lock/
This definitely can be fixed on commit.

> underlying structure is const.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I tried to test this patch on FVP (both Arm32 and Arm64) to play safe.
This patch is good (as expected of course :)), so:

Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Tested-by: Henry Wang <Henry.Wang@arm.com> #Arm

Kind regards,
Henry

