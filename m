Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E67EC21B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 13:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633608.988603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3EsY-0007Ps-0o; Wed, 15 Nov 2023 12:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633608.988603; Wed, 15 Nov 2023 12:20:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3EsX-0007Nl-U6; Wed, 15 Nov 2023 12:20:21 +0000
Received: by outflank-mailman (input) for mailman id 633608;
 Wed, 15 Nov 2023 12:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8lFI=G4=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r3EsW-0007MP-Ae
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 12:20:20 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2078.outbound.protection.outlook.com [40.107.13.78])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 563fa80e-83b1-11ee-9b0e-b553b5be7939;
 Wed, 15 Nov 2023 13:20:17 +0100 (CET)
Received: from AS4PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::18)
 by VI1PR08MB5469.eurprd08.prod.outlook.com (2603:10a6:803:132::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19; Wed, 15 Nov
 2023 12:19:40 +0000
Received: from AM3PEPF0000A78F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::8f) by AS4PR10CA0014.outlook.office365.com
 (2603:10a6:20b:5dc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29 via Frontend
 Transport; Wed, 15 Nov 2023 12:19:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A78F.mail.protection.outlook.com (10.167.16.118) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.19 via Frontend Transport; Wed, 15 Nov 2023 12:19:39 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Wed, 15 Nov 2023 12:19:39 +0000
Received: from 2d737cb443ea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C6FD596F-8887-4230-8DF3-A79F6EA41BDD.1; 
 Wed, 15 Nov 2023 12:19:33 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2d737cb443ea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Nov 2023 12:19:33 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AM0PR08MB5297.eurprd08.prod.outlook.com (2603:10a6:208:18a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 12:19:30 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 12:19:30 +0000
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
X-Inumbo-ID: 563fa80e-83b1-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iY8kQpeEQCxO98q5zu7xqp+DGfeF8lsfgyOeZ+CtpbH8893Zz5lOlp2dcmI+lYehKNMldBjeRvgUfygCb68g4heQPPZvn4Qi8SEAvlFluwkRXefCIs22TBrUvXppN43KCmDHkH7fGCYldaAM1epCWdP2ZyL5aTc9f7kExeeeom75owDEHHOoj3CrLLor5gMQvchPItt9XdIY0V1A+EDPMY6LokCzu/uENm5c8g5Qxlnkl5l9PjNICNQVONnjfFyY+k7lJEAKULa5fktX150S+2G98KtMYfXMbOICjmynljoh+wrqaPuY95FdDDGArknSdn8rJi1p3YE3UsZbkjrT2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMUSBK4IYSmq+QQjGjD6+8lgvnoxXeaGvpwIQ28Ac4c=;
 b=CysDmM6vVcddgAZcR5ozmCOtgplRkenhQzrxhWzwHHb6mYs0ZBhD0U0QExe42e0chJ9JmCrsD7iKN3lr9sztHLG/xVgDJsTit8j5iIIYcAaHfnLpxqFlhVfXxqu/Aslf7Gbff1eJXvXH93umhwaT7kbZKkaYsCxSD3zTqiJjV+rzQBWA7IqTSI7kZ3PQL4Ihch+NFKlKUp7EiYbYKLgbAPHpvnuCxRFZ+nMUQurtzVambunrZUEr5N1Qz+H8yZYQ2GgpqyQfQSmdQINy0DQySQ++vL1u76YUP6n7rKCfaE0jSEfLFbQ6c2VOdmIUurgnZ78MDE9qUask/pp+SC20BQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMUSBK4IYSmq+QQjGjD6+8lgvnoxXeaGvpwIQ28Ac4c=;
 b=hHuO7bsMI3YfjdJxVqXHd6WOmkRfNd4oCJW5qjAtWWCAkLf4t1Lhz5k++3lnz4OjMa3YDz5sP2kU1Nqvxbqpf3srHO17HRCl1WDvzQqRpUwiLRnY6A/7py/eYGh/wT3KWAtJ/2C4YB9FFDUeHA6J9hOs7drjRN0Q1nhcGx3IJ7E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a260af88de8efeb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dq7mXNs3aRXbXUkfeFf1mCB5CLw7m+z69lTRh/PWsmLusSxInQ3XiNRRCBptUUceTvxx/CdmsePUWWe1rqO1KExGhP4Oxxs3KPqg6qe2bVpe5rQ1c/LAip+N1cXuNhVKmjFtQMnBNLjLlqsXX76olZYwz4K06Eialr6xNunUPfD/re9kmLCIePtOlhlaPYoTtXwUJQ3HbNNhPN91kxMCZb9Xwq48S0eg2rzD+5C4Tg/vtx6bwZhxtvnTovmb7DfSr9/YqgHRKiMnTomvwvgJvh6VDpyYPF9pZks2/14sOxlmcbjWv8xKetVXTsviANCVdZ/rr+vjfDJVKpZpePoQbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMUSBK4IYSmq+QQjGjD6+8lgvnoxXeaGvpwIQ28Ac4c=;
 b=gkE3rbk6mNJv5OlVbTBXrI+ynf8qE0p0/YfrGo8BQsajKg128jOkVEHoHf4dsOQrKxXuP4GGF+lurK9EIg2d/TRgxynDDj5xehphQm3WKe2f9LTYFayDdTvk3gRwUq4SwNTv5F6hEY8o1o5PwU6PA/Jmb9jJoCL9nrq/VMCCY9AGm0koZ7RsLsV0LAw8BSIi/foyQBhqtN3DQjXe5BRBsHI0Euz+x0LjuB982U1yeDgMWnoE+O8Q1p5NjBnP8lpe8aCpx/AXVGERhCQG6/4Ea3XNnkxLvta0Jn9mzJSVDoXCcolO0Hp427IXwOJqRQxxvbAFouoifvR57k8Uhx9w6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMUSBK4IYSmq+QQjGjD6+8lgvnoxXeaGvpwIQ28Ac4c=;
 b=hHuO7bsMI3YfjdJxVqXHd6WOmkRfNd4oCJW5qjAtWWCAkLf4t1Lhz5k++3lnz4OjMa3YDz5sP2kU1Nqvxbqpf3srHO17HRCl1WDvzQqRpUwiLRnY6A/7py/eYGh/wT3KWAtJ/2C4YB9FFDUeHA6J9hOs7drjRN0Q1nhcGx3IJ7E=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Thread-Topic: [PATCH for-4.18] SUPPORT.md: Define support lifetime
Thread-Index: AQHaF72b8CvvI5/pmESXrW//HT9C3LB7TG0A
Date: Wed, 15 Nov 2023 12:19:29 +0000
Message-ID: <7DFD3C42-3B57-4F36-82A8-8076E8A46601@arm.com>
References: <20231115121632.63868-1-julien@xen.org>
In-Reply-To: <20231115121632.63868-1-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AM0PR08MB5297:EE_|AM3PEPF0000A78F:EE_|VI1PR08MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: e207e6e8-8084-4326-110b-08dbe5d523e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0HqkPwWjszONakK/huKmcu6uKRwryFLSMkbVCUQU+EpDpZ44IoUdeCgfmbntyTqfG7skV3CqsAerzqQepKZvH9GnCO8OOiKoHhSjjcDbUe7w8TYyALCzd46rBfphpWYgPDw+mFuBeIMW7AX+R0aF94tAkPP4IHyCesbAasDrMY0T7IA7r/7md6ITEUW+OTSDTiIGlxeNnUKgJ+5YBGMG+hMdRh6egq5wsZ1wWZ7SLqcSk+vtZTrObINPXMMOxLm5LgOR6Cb5ZkrLnwRK0P/f3utqbatKJJBhd9g3L8Odbly3+z/Ipq/NjOOXqhDtiukWzcDUGxIp4FAZhVJbokTCg5rHlkrf8W3GuPgS4fsMIWBbIdOURr2Uh9HNEN97p725X9uunuaGYV4w91u7NPljE/ZsCk08RFKweQ8Bbno4kfbuktmad/dGBlmC1esXkziYk5Z5X5a3exv8lDZn4Q4zTQsxmldh66QEL+nf7aGaNNpLn+cZC6xrOuc50f7XmEAD9PCr6NZCOERS/SN5ELo5M37Qk9aPJK5O/vc4RF2LZiTiqq6DT2hQlwkOWetrAYNHlMHpSgmUMfetSM2RwaR0THKYtgXSZ6Lm9+ZVesqDhbtDMxD1xV05eWvLnU78QwmB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(136003)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(33656002)(4326008)(8936002)(8676002)(91956017)(36756003)(86362001)(316002)(6486002)(478600001)(6506007)(38070700009)(71200400001)(66446008)(66556008)(66476007)(66946007)(54906003)(64756008)(76116006)(53546011)(6916009)(6512007)(5660300002)(2616005)(4744005)(26005)(4001150100001)(83380400001)(2906002)(41300700001)(38100700002)(122000001)(166002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <81AFB55BE8E0024BB37F9866B374980F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5297
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d84080a-2bb6-47fd-df60-08dbe5d51e2f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IW9kJXLZk2SQzBa0WPWMV82pf+Jij0ISaNZMlA/elUA0WIqP7RafL2bfbH54cXuEnBEyogIg9/vMSHebFb+xOGoWgSwGv4lZx8W9r200OD5S3XsOH/xfYOfiptRryLYYQL3JYN1z1YFAaOh4/Clz8kQMdMALTK4SrUQKxzkiRPD+hLwr+XiMW95PkIH8YdeNDWP5aKJ6CTLDn4Bip6Krif1LzVJpwDEgvSlmBPP8O5ahtA2X0jF8djbILwOmzpWnbti18ewmoiFYRno5sbqguf7XO2D01Mz4LrSd0FCNT+YIQXzOX4y3O2LwCbYPAziYoOM6gdvp1mBhc6xKUJZJn87s4u/UrJXiofs4FO6NRDUvYIG8DSUlSj8kQJKDBdqj2L0QUcQlAQTkPtKjXKir2g1CdpG7i+8E9FxaohYJLpIZUYbgJkkpgHTK3zAD5JbyYBhsljzO70yK99241ABTInvxMLUrA2vlRO0v39FOl9ClNsExcujYVNHMg29TX8/ab4I17vt7XeTauoWamF1AZ2SEvL+4iNjSIX2onzav3IEMWVREd9fN7hNoVp8hOoIENDiBw+lR4sQPGvjEjZzK7KmZUuDV0fBZi0iyMKh+Pn7tpbcflCsRb+aEp7KlMU5ncJUZ3msQ2hIQMr8nwCl/NSjwF1pRZw8oO+JNSlwEGc588fmg91tOzj5sfPrvZ9Su
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(396003)(136003)(346002)(376002)(230922051799003)(82310400011)(451199024)(64100799003)(1800799009)(186009)(36840700001)(46966006)(41300700001)(81166007)(356005)(166002)(2906002)(5660300002)(4001150100001)(36860700001)(33656002)(86362001)(4744005)(36756003)(82740400003)(2616005)(53546011)(6862004)(4326008)(8676002)(8936002)(478600001)(6512007)(83380400001)(316002)(26005)(336012)(6486002)(70586007)(47076005)(54906003)(70206006)(6506007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 12:19:39.5859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e207e6e8-8084-4326-110b-08dbe5d523e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A78F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5469

Hi Julien,

> On Nov 15, 2023, at 20:16, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Thanks for the patch and all your effort during the release period!

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
> SUPPORT.md | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index fff4b4c5bad6..c452635eb552 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -9,10 +9,10 @@ for the definitions of the support status levels etc.
>=20
> # Release Support
>=20
> -    Xen-Version: 4.18-rc
> -    Initial-Release: n/a
> -    Supported-Until: TBD
> -    Security-Support-Until: Unreleased - not yet security-supported
> +    Xen-Version: 4.18
> +    Initial-Release: 2023-11-16
> +    Supported-Until: 2025-05-16
> +    Security-Support-Until: 2025-11-16
>=20
> Release Notes
> : <a href=3D"https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_No=
tes">RN</a>
> --=20
> 2.40.1
>=20


