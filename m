Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB38D7E61CA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 02:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629430.981685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0tkz-0003hV-TL; Thu, 09 Nov 2023 01:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629430.981685; Thu, 09 Nov 2023 01:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0tkz-0003fA-Qg; Thu, 09 Nov 2023 01:22:53 +0000
Received: by outflank-mailman (input) for mailman id 629430;
 Thu, 09 Nov 2023 01:22:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNjr=GW=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r0tky-0003f4-R6
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 01:22:52 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f4db1c7-7e9e-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 02:22:50 +0100 (CET)
Received: from AS9PR06CA0465.eurprd06.prod.outlook.com (2603:10a6:20b:49a::17)
 by VI1PR08MB5389.eurprd08.prod.outlook.com (2603:10a6:803:137::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 01:22:44 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:49a:cafe::1d) by AS9PR06CA0465.outlook.office365.com
 (2603:10a6:20b:49a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.26 via Frontend
 Transport; Thu, 9 Nov 2023 01:22:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.17 via Frontend Transport; Thu, 9 Nov 2023 01:22:43 +0000
Received: ("Tessian outbound 20615a7e7970:v228");
 Thu, 09 Nov 2023 01:22:42 +0000
Received: from 81814b3ee114.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B73D3D70-448E-4143-B8B4-730E6C4460E8.1; 
 Thu, 09 Nov 2023 01:22:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 81814b3ee114.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Nov 2023 01:22:36 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9249.eurprd08.prod.outlook.com (2603:10a6:10:418::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Thu, 9 Nov
 2023 01:22:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.6977.019; Thu, 9 Nov 2023
 01:22:33 +0000
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
X-Inumbo-ID: 7f4db1c7-7e9e-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=X72ljynSJ1Swphgi9RD/pAXDq8+CdzsYAYhonOEGC21C+17PMRngmOXsNaazRyC32JpBDUDRoKDLSx2Y9GB1hc60jNxxTUXtSiZpZpmDSp4QdFC/Y3clWmGpn9Rgj2PLIG6znAjV/ZO7N8XnDt2UI/EksP3H2J0F4W2GN9XbJD5E4NS28tHyn3OMFVkQjfODHgqyr2hio3CYqrc+OgsFf/do42uobTtkKbXo1Fai1u1656f/It8zyoQXV3VfQl1Hi1bUawx6CfEMiiLRQ7zaENrZx79y+NqwXfs+CWL/+PNWy7yfV5EF0aZ4rwDO7uH8IqXhW3qqhMb2eNdNhSEL8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai7ZYBrMvU1rgkvoWnti+Q683bt6Jnz0AJc6Zyl1acI=;
 b=EsPTbEWlOf6hpJFCz2Y9gYIOcKfbywHMcm3XSjLaXj6xf4skUS3RVR2WDBTEZI74HSHGDt9Yi1BW3lbKDMyfaafIE8gZRhFgrQnxCxwcZ9xBnFtmWG/co/sYPTUkI71DyiNIt98wlASTvgWtlthOxP0z5OoPZi8RmV9gwslVFd3SwzeBP2PWvIfg5ztgoViHtiy9UxB5YqRFT1YFA412GmHt9ZrcJipgbRkR/7FMVhJzC30zbFw+H+JSPzkjcrqvyheUVckdx+yR6cixuyyVSJV0MSAGopOMzeGeGohKYR0aripy4H8Fwjhp5qzenctc01+UpAfUUDL3U3dK6chceg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai7ZYBrMvU1rgkvoWnti+Q683bt6Jnz0AJc6Zyl1acI=;
 b=le3ePD7XFqwctrsmtGog4ggX2Li8qYte6vsPiTkfB4Yw15HOdNJqLVmwzkqTWY8g8i7nICDI+7r8D/OcyvvFg/UCk8rett+Lvj7dbQES2ZZ485rgE73RWu5GL8km9rlEM1KU4d7GydNxZW++rGDo7wTwDKimDI+biWd6ufoPCiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 21557497394adcba
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=af4TycDrJ9QEBeUDJd0fYxp0WnQSustSEk9Q72BX03JwnezT5wxUS/4+cs0NmfXCzYzVBlLSeC/XHHsmtv1+wWJLdeAPRFLFmjnsY02RqN67gecFcquh99QhBwV7Cd264UgzAclATiFkE2EpGLjIsEyFlKy+BBYWU6M4e9LTDAA9b6+i3z/C2j94+fsed0c62KLY252n0OiKx4FJSQOijCldR9DxZSiQEmT4fRJE10KHJL/Ywz4931dC5oPDEX3TPRq8I4aqjdoYl+QqgKA7HlROOgLy0A3s5m2tNy2WAsuzcQD9TzrstRX70ZUEYaZHgP2va/55AkFOCGENCW/UcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ai7ZYBrMvU1rgkvoWnti+Q683bt6Jnz0AJc6Zyl1acI=;
 b=JKZ1fas/xiCe5uhiLD8dl5qtwnf7xgUnI+bAqgHzm/wStwgC81xOUDKC1Q8jSujaymOEWBkUlEUHuI2xqLhlM0aQTy1we3C2L8tlbsCqA/NluGehAUUlPQppnlIX3S/IaoHXjUxcWP+Jm/RjFmx+kEiDFXoFxcYGxdNFeWVjMHZOpew4yo6e0yqqu8GZsrUTk6hL+U8ghAx4lq7ziXUlv0BHNhTIvsYvW5A7L/H41sidhn3mE4zDjhh/Khkfd4CF0y7R/BBvmFqCE9QWjs5ba5WCYKwJ1dMQ0N7stHl4XGD5EQ7cGieWGApKQARjfhBTgu2aoklDv6qimTHfgiaW6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ai7ZYBrMvU1rgkvoWnti+Q683bt6Jnz0AJc6Zyl1acI=;
 b=le3ePD7XFqwctrsmtGog4ggX2Li8qYte6vsPiTkfB4Yw15HOdNJqLVmwzkqTWY8g8i7nICDI+7r8D/OcyvvFg/UCk8rett+Lvj7dbQES2ZZ485rgE73RWu5GL8km9rlEM1KU4d7GydNxZW++rGDo7wTwDKimDI+biWd6ufoPCiM=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Christopher Clark <christopher.clark@starlab.io>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH for-4.18 1/3] docs/sphinx: Fix syntax issues in
 hyperlaunch.rst
Thread-Topic: [PATCH for-4.18 1/3] docs/sphinx: Fix syntax issues in
 hyperlaunch.rst
Thread-Index: AQHaElgrP0BFnpaP60CJZxz3PMML7rBxMbAA
Date: Thu, 9 Nov 2023 01:22:33 +0000
Message-ID: <F0D2B705-CA60-4A66-9EBE-919AAC8E9E24@arm.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
 <20231108152727.58764-2-andrew.cooper3@citrix.com>
In-Reply-To: <20231108152727.58764-2-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9249:EE_|AM2PEPF0001C714:EE_|VI1PR08MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: 915e0ee5-a5a3-4dfc-95e3-08dbe0c25fa4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pX2C4fK2V6soi0lcomczNp60UOxG5OVAV7S9TozRIKVnzjyxd/Ap5xW9GGucHT0j9K+rnqG0WhlJAtXbaBdwmPyskdeGQxU5souGYQI4FMHjBen4a18vwAwesQ7cjjvIOFlNRRE2zraT8C0qMrpB20dtvtashQjHLS9y6pM3EULIb3kBXKbjZs0Gi9vuWktw+6TR9ZguT1YW+HurVTWnl+uZpvGv0lSHhgpI+bI2GCMsYrO1tAaGjhx9ABU9qXW3aIaOOLH+RuWzTlDy43kVJHmc1D0og1HpIyftmYdjwalD3cy+/hrKGQW9vjE/JWWeiXgjoxqeIkZeGYiq8c94L2Flw9pkVc8rpek+YVMgPqHhchkS+gGGwj6NQjywwjHMGowtNLEh1c46YTtdpnN3AGizmRtp6Stqs7SNXiAEtjS6kFjXGFCS2iowd99SCR+EMrD8AU+cFsg7tRiKgXd5QJQdPki4W8vqby76RmIG8y8p4Z+KunPzLTa3novylrbtXX+NV8IfQ1Ndhyyes6+C0Jg4p4O11ljXaP/xYZ8IcGogx8Dd1KqbjguKKpeWUe6QExT7x6LLI6UQTPqfjHcAwJspPN3pEamK5djGXo1SQjv9Sf0VF/887ZWeYgy+czpAVyOsObYSNogj/CdR7JxNPcVUOhvlKqaDUB0h1/Zq1IDWqOE1ckm8VOkcSm9SIxWB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8936002)(36756003)(4326008)(8676002)(41300700001)(38100700002)(5660300002)(2906002)(6512007)(53546011)(6486002)(66476007)(33656002)(54906003)(6916009)(66446008)(64756008)(316002)(4744005)(86362001)(91956017)(66556008)(83380400001)(26005)(2616005)(122000001)(38070700009)(76116006)(66946007)(71200400001)(478600001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CA2DF9A9081B63498EB7295D4BCC939A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9249
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	08037531-882b-430d-dd81-08dbe0c25979
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8AseRn7kGjKZHwRhY0DNeZCnodXd5o9xzHdNxWPP1FoZEzM4M0Ocoq/n6/vv3S/cULLlnKMxXCyuIMupK6Hnb+CGvR6vRmyHGb33U2zQlErn2jYg9f+uMHMSsaQmoTqfQU8hs1fgTBW0znPoAN9CYgAPhhQsuf8J9FybkzZJcWBZMD1oVFOsWzsPTOIBJJgL0ucLVTR9zcXbpC5jKsigbySx4QG3u60mxjLnzJLjMbyFlEyn1//2KwDj02wek2QAM7IbIaFWln2ixywzykKC8/Pv2M8rJC5yz6mgotKJ6WZPdYa/y+mnvGTyj1PCK5dyDKQXqkKCGccAPh27RVcK5cnvKWXsyPjJXKkWv7JtB4vDICLvxMTxYmq/SLpydOqfP3gh9x/JsXa5Flv0rt5qMKDewFSoUVuPe1hmaVeHPYb1MucS8JtQHiM12cmI6cqvb1W/QDBdBnA3U8KZwcK2wCD39HbYg00HX/ew+KrdXNBJNoKN4dsDHS90ni1AgtCsroX9Q0eZY4seT66BtYZQ/LOCavWy+uKDR+mV2eKe2ikNJJl/xU99q3zeM0R7Lk37938usFtViGzJ4HhVrEgUYgse5HghdTDhB6NyIIhtgrlUZO74/FnnnEU7aNcZMRaTz+75LfCRmADkvSw6ITGeLN6KDyY2fcy27ncfFDHkFuNQuJCywiyex31jlFlENsDIU8Abv3VSIg50lpcHuFxoI5+XC723pOjWuIjsyJrw+CPlsEEjcrA2N+W/yDxp2iZnNeaUDqmT9ekEL7RXag+qPOHNxnq+zn61XPj+HmxrcQI=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39850400004)(346002)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(186009)(82310400011)(64100799003)(451199024)(1800799009)(36840700001)(40470700004)(46966006)(36860700001)(356005)(6506007)(53546011)(83380400001)(81166007)(40480700001)(47076005)(336012)(6512007)(40460700003)(107886003)(2616005)(86362001)(41300700001)(2906002)(4744005)(36756003)(8936002)(33656002)(5660300002)(4326008)(6862004)(70206006)(54906003)(316002)(70586007)(82740400003)(26005)(478600001)(6486002)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 01:22:43.5487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 915e0ee5-a5a3-4dfc-95e3-08dbe0c25fa4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5389

Hi Andrew,

> On Nov 8, 2023, at 23:27, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> sphinx-build reports:
>=20
>  docs/designs/launch/hyperlaunch.rst:111: WARNING: Title underline too sh=
ort.
>  docs/designs/launch/hyperlaunch.rst:203: WARNING: Unexpected indentation=
.
>  docs/designs/launch/hyperlaunch.rst:216: WARNING: Unexpected indentation=
.
>=20
> Nested lists require newlines as delimiters.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


