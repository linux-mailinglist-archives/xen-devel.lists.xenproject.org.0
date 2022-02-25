Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92EC4C4011
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 09:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278817.476206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVx0-0002LX-Iq; Fri, 25 Feb 2022 08:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278817.476206; Fri, 25 Feb 2022 08:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNVx0-0002Jg-Fi; Fri, 25 Feb 2022 08:27:42 +0000
Received: by outflank-mailman (input) for mailman id 278817;
 Fri, 25 Feb 2022 08:27:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mSMM=TI=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nNVwy-0002Ja-Fy
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 08:27:40 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe07::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cae60e8c-9614-11ec-8539-5f4723681683;
 Fri, 25 Feb 2022 09:27:39 +0100 (CET)
Received: from AS9PR0301CA0002.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::15) by DB9PR08MB6412.eurprd08.prod.outlook.com
 (2603:10a6:10:23d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 08:27:23 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::d8) by AS9PR0301CA0002.outlook.office365.com
 (2603:10a6:20b:468::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25 via Frontend
 Transport; Fri, 25 Feb 2022 08:27:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Fri, 25 Feb 2022 08:27:22 +0000
Received: ("Tessian outbound 1f399c739551:v113");
 Fri, 25 Feb 2022 08:27:22 +0000
Received: from 09506247d506.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 37553FBC-CA8C-4460-A22F-264E714FA6DC.1; 
 Fri, 25 Feb 2022 08:27:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 09506247d506.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 25 Feb 2022 08:27:16 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by HE1PR08MB2873.eurprd08.prod.outlook.com (2603:10a6:7:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Fri, 25 Feb
 2022 08:27:14 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::aca7:79c4:fa65:dac6%5]) with mapi id 15.20.5017.022; Fri, 25 Feb 2022
 08:27:14 +0000
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
X-Inumbo-ID: cae60e8c-9614-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkd/1LMAIeDmVlc4RspthIUiwxY6FbLzuBtfbkw98OA=;
 b=HqA5H5WZHfyhR/aCr4R9l6Kvg+5/U77ythwHSeubE1v8QTczUUGaA/YwAY8R9SAT8t6NYA+LF/N7VJCHrD2sofQs07LKTs1HG+oor7CnkMg22cYuiNvvq/pmfUPXvR4WDECHXtiPHL4lKW7kk5xiUBX5MDSxYidV3UHwCERihxQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ca0ec0f4f462e3a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxIf4QKx0le80i26AsB+XGIi5U3Tj7be3LfHBMMu4N2FwuVrNBzzoglnfMrJYA5NQFXVa2weA/8n0Bij5d2ojh9mwgqg4Lw/VLteShCA2/T3xgDhYe2XJXmxZuxc0VsmmtL8p3FOvoWqW9xD4CBlhO4RcuKyevkDWC3M8qNTrff0ygVgZK3+gzY2DbH7DNWTg1FEKhe9aZg7K8KV4ka5R/sRH4C0jDttHdXKZKmKCJMhzAxo5mJRzSicmN/S4w420Xsu7/7GqkeEcQazfXNcrTHhW9VvaXoKlhDNEiSZcC473SrvoVNxNKQiUrM89krMnRc6RddrmE6LWqGFHq/K+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkd/1LMAIeDmVlc4RspthIUiwxY6FbLzuBtfbkw98OA=;
 b=Llna29zj+CiIIgANgRmzfuOJe2v1yCHBjrgEkVK0jHruN/CNfZsnO9hB0UhllzUM1w71/ha6YsemTNe+1HfJjcjjLxhYn4elZpcte+baEEfKB+5bfPpKYbzHYHTmkgdxK1kRxPNkbhEa3aHTt0tBPPhBRScFUrl8mAb6+l+y0zQrPU5JWAFHWGnaUrITmoAYlEXqy3KrQFqE+3WyFHXbSpc39LL6qMIM043OnhNBshLNUoHIh1FbogErlolha9ndEI6QrmGLOaFEmeQ3XiazSppdjlXGM+HFnOMUA79E+xZYMag8FXYb1yuSkjiJ2InBuTo34Q/aevuql1pKjlKMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkd/1LMAIeDmVlc4RspthIUiwxY6FbLzuBtfbkw98OA=;
 b=HqA5H5WZHfyhR/aCr4R9l6Kvg+5/U77ythwHSeubE1v8QTczUUGaA/YwAY8R9SAT8t6NYA+LF/N7VJCHrD2sofQs07LKTs1HG+oor7CnkMg22cYuiNvvq/pmfUPXvR4WDECHXtiPHL4lKW7kk5xiUBX5MDSxYidV3UHwCERihxQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 03/19] xen/arm: p2m: Replace level_{orders, masks}
 arrays with XEN_PT_LEVEL_{ORDER, MASK}
Thread-Topic: [PATCH v3 03/19] xen/arm: p2m: Replace level_{orders, masks}
 arrays with XEN_PT_LEVEL_{ORDER, MASK}
Thread-Index: AQHYJwz3/5rVW4vmxU2XDig/F0ROyKyfuzqAgAOV+oCAAKOsgA==
Date: Fri, 25 Feb 2022 08:27:14 +0000
Message-ID: <17D9F4AB-0FB1-4827-A564-4EBBDECF977A@arm.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-4-julien@xen.org>
 <66B2C3AB-A61C-4CC7-8249-AA925B2774FD@arm.com>
 <7a92b31a-ff09-3263-c25f-aba420adcce3@xen.org>
In-Reply-To: <7a92b31a-ff09-3263-c25f-aba420adcce3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: eafc2b5b-f631-4db8-fb86-08d9f838a59d
x-ms-traffictypediagnostic:
	HE1PR08MB2873:EE_|AM5EUR03FT038:EE_|DB9PR08MB6412:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6412D747DFA8954550D52F549D3E9@DB9PR08MB6412.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 4270IHDxsOitbZLwpQtRuvok8jmoYo9y9Dv865FZqLClfO0N5jz/5EDyOjNiP/P+AO93Kl5+HOh9vaM/O+HSylK/u9YAypA2Xf7+qO4zkjDa/eHzd1Zkb+xIsKrYXcAps5+2hULXwgT00w7pmIo0+fCUda6j+zM5987Epo9ed/f+z4L7A1w6oWjfxtnqhCLrrZSQ8DokQ0irRJVfji3m0nbypzScNhdQghxqPU5EHdIVnEBWQkaAe3IjDF27CbTwRq77WrvISioIrH54MCZVJIhGbcQgfj4k1W4JKlx3c0NA2vnIs4YsVt+zpv5WobhEZPVSITiFqjwAGDC2hoF6lSCCM+/ZgE7oZnBEHPiHJgrRmzu4pd6KDtW+4m2ME0qxNgPZJqhsZVS4l8NAxGh0wvNtbRcQxbZ2kNKmc468u5IuP+nLJcZDGJVNmokrAoB6U+KOtMP8X/b3TPvo/N6yrcIXFfSQaXjeYMv2YLntsIJ9YUGfUo+cnbTPH108z00wH0vDTu6CeIptjNLEUEiXa0tbQ1QQGJerlwYoFE4ElQp1boYssHiFoCbTSU1hf6bpVQ0yLx7WF9RPL80eDuu2dYbWovWnVqtNCieiPgfU5x0ZswN3/jIXyMLJCQbi7P9ouJZhRX0//7PMf/DGjsg/GVYN11wK1YwpV2CXlMK/e3rnkwui/y76yYe+A/RlaUSYLJPWyGr/1+qgJjIs7n4oJ/Cpma/DdmBamXxzZVGDJiJghDeWN752RxQ2G5+z10k2
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(6506007)(122000001)(53546011)(86362001)(6512007)(186003)(26005)(38100700002)(71200400001)(83380400001)(66446008)(6486002)(36756003)(8936002)(5660300002)(76116006)(316002)(33656002)(38070700005)(91956017)(2906002)(54906003)(66476007)(66946007)(8676002)(64756008)(508600001)(4326008)(6916009)(66556008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B8E4D97F09018E4B822501F5EF725362@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2873
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	83ee994d-a96d-4d9a-e848-08d9f838a08a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2YDC/LnFLSmTP49PtvYIAhU532YhoFgXQ4957wND/5GaOfW8AX5IiG1RH/AxA7cfCsxEOlFdMwL52KIp3kpqLUnSWLpRtrPeibxfC3dY+XENbaGH542qNN6tdTbXyOKku6ZJtzTqCSMlVl6Nim45Lo7sFixFHcjSCtduAcFuBANk9QJ2m96dN9owe01ACAaE+1nhknz12UY18DzU3Hi4DE6cJG7eCmhr4tMJAifHu3HhbmHlrTSoIal48xoVtdyHwTzDQyvedbCX2JtqAQwqKJAz3cqOeL3xV4PVnRSoXfq6kRV24D4Vf+BLDXcpsbyj18yWmyPN6n0xI0lqOCsn5De3M6+JU4/0mLOUiS6JrpJ1i0FI9B9eKvZtVFyRO5NfPgiUOmrkwVDmFsM9LXCDs5jUfQWsJbm+tS5VnFiwZR8G8H2u4uG5Uo+hk+pFIZGap+iDhTaSKknQntrTgpRYTC6+zjiSfogZt0pH0WwN17idaR3dGPElEImyXO1MOfGEepjxyRFlqVge+w+52MSKn9Kce04jizAlAVpVLGxBdCAziuRHE1/HDk3SWqee2M8B/pkIGEWQ6OXe2zpK0lGGDOJ3Ut7YYfkv47k868TIVKgeaG2wClY9jxeAaXJRLj+WouNAmkFj/UW88HvAujygVZiLQZ0gGb83WD4V9uLuucMeOuHsoWyu79W+CBiJRevt
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(53546011)(508600001)(6506007)(336012)(54906003)(8936002)(33656002)(86362001)(2906002)(6512007)(70586007)(8676002)(70206006)(316002)(4326008)(6862004)(5660300002)(6486002)(82310400004)(47076005)(83380400001)(26005)(186003)(107886003)(36860700001)(36756003)(356005)(81166007)(40460700003)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:27:22.9462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafc2b5b-f631-4db8-fb86-08d9f838a59d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6412

Hi Julien,

> On 24 Feb 2022, at 22:41, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 22/02/2022 15:55, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 21 Feb 2022, at 10:22, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> From: Julien Grall <jgrall@amazon.com>
>>>=20
>>> The array level_orders and level_masks can be replaced with the
>>> recently introduced macros LEVEL_ORDER and LEVEL_MASK.
>>>=20
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> One open question: At this stage the convenience aliases that you
>> kept in include/asm/lpae.h are used in a very limited number of places.
>=20
> I am not sure I would call it very limited:
>=20
> 42sh> ack "(FIRST|SECOND|THIRD)_(ORDER|SHIFT|MASK)" | wc -l
> 65
>=20
> That's including the 9 definitions.

My bad I looked with your full serie in my tree.

>=20
>> Could we remove those and use only XEN_PT_LEVEL_* to make the
>> code a bit more coherent.
>=20
> I made an attempt in the past and it resulted to longer line in assembly.=
 So I am on the fence to whether the aliases should be completely removed.
>=20
> At the same time, XEN_PT_LEVEL(...) is handy for places where we don't kn=
ow at compile time the level.

One other big argument for making the switch is that XEN_PT_LEVEL is far mo=
re specific then FIRST_ORDER and others which are very unspecific names.

Anyway definitely something that we could do after your serie.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


