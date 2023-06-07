Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D12725963
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544549.850412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6p6L-00032Y-ER; Wed, 07 Jun 2023 09:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544549.850412; Wed, 07 Jun 2023 09:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6p6L-000307-BM; Wed, 07 Jun 2023 09:05:09 +0000
Received: by outflank-mailman (input) for mailman id 544549;
 Wed, 07 Jun 2023 09:05:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqqK=B3=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1q6p6J-0002zx-QI
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:05:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6424841f-0512-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 11:05:04 +0200 (CEST)
Received: from AM5PR1001CA0054.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::31) by DB9PR08MB6729.eurprd08.prod.outlook.com
 (2603:10a6:10:2ac::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 09:04:31 +0000
Received: from AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::f8) by AM5PR1001CA0054.outlook.office365.com
 (2603:10a6:206:15::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 09:04:31 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT045.mail.protection.outlook.com (100.127.140.150) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.22 via Frontend Transport; Wed, 7 Jun 2023 09:04:31 +0000
Received: ("Tessian outbound 8b05220b4215:v136");
 Wed, 07 Jun 2023 09:04:30 +0000
Received: from aaaf3ab06462.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 509EAF6D-243E-40EA-876E-10E2F62ADF32.1; 
 Wed, 07 Jun 2023 09:04:24 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aaaf3ab06462.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Jun 2023 09:04:24 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6458.eurprd08.prod.outlook.com (2603:10a6:10:258::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:04:22 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6455.034; Wed, 7 Jun 2023
 09:04:22 +0000
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
X-Inumbo-ID: 6424841f-0512-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F64Mo46Eja+CcpQHdAyeauc/jy1QchVAqlyZ9Ot8T0E=;
 b=IukwhkVYjmimS3nx80DDqHeLfy+BvbN1BgTnkle3oS4zKnxrlV/apAa9+jd5n6+Ugi2CDh+D5RlvWqxJkRQkigJxv1ZFCnifXSUH+Est5IaUxfK1/iFK9TSts5kWx4V9UymQFSwEHpwKXjB81HWL1zCXeV2aDi1jX1iAIAQf+Ak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: feea83a7af251028
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/JjqVspf8phfdg+n2mA9yh3FFnsWnm3Q5t7SCXY4SzvdX8K9l2FWQhHpaiG0XB/nIylebP/WeTDHIqBwsO2dzy0liq547+fC+U2OcsfxTzXjBgaRN6XVWqOI8BMESL38hTpxyTtIxLyiGL+Mqx8HeuOnOg+sZxHITDy/tzb2zbGvqSQnbCusqzlfqimB5lqsZ24X+H4DnJK6A8XaFktT1PeY9OCsoa2QLqknjLvotHC1bEfD5SuTqSJAS+RIHAjRHWJV/JAH7SK1KnZZihepJ2/YupHTCnm8qjjxKEwzDwNQjCpdt7AQlbMXB3Z5AhcxzGpI4r9CpfLrTkd/lxBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F64Mo46Eja+CcpQHdAyeauc/jy1QchVAqlyZ9Ot8T0E=;
 b=k1c84AQmT33IeFKV33ZdNkulLWpaqqLFgRgQg5w2tDJEkfrtr4OZJTZUZ3DRRBCY6iJdk8qtNsCBu1LrYPhP9QHSQcpxexaZCQpdTExaQiKhtudD1r8W8cC81n/POdXOdxuf9vT0GgX3xbKT03pE681SMpD4edWa+dbSwSN8VwRAf+hhy28YmkHlUhH+s0xSvI1yZhhKIlLrzFvM/DpyrvuaRgRgZ0B4MVi9duGUexVTc/HDo+73c7ItjZEp6t8tw8CIKNyA4oGzJKnl96d6d7gt8P87zNb4S5QGMSscFz+5nZXgj1Nv42xA3BTxblKNHX7z8xr3t2FxFgDJWgQouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F64Mo46Eja+CcpQHdAyeauc/jy1QchVAqlyZ9Ot8T0E=;
 b=IukwhkVYjmimS3nx80DDqHeLfy+BvbN1BgTnkle3oS4zKnxrlV/apAa9+jd5n6+Ugi2CDh+D5RlvWqxJkRQkigJxv1ZFCnifXSUH+Est5IaUxfK1/iFK9TSts5kWx4V9UymQFSwEHpwKXjB81HWL1zCXeV2aDi1jX1iAIAQf+Ak=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen: Fix incorrect taint constant
Thread-Topic: [PATCH v2] xen: Fix incorrect taint constant
Thread-Index: AQHZl6An0ZVCR8BjEkS3vk0sA5g2C69+/+QAgAAEh4CAAApegA==
Date: Wed, 7 Jun 2023 09:04:19 +0000
Message-ID: <297AC2D4-B9AA-493E-AA67-850F749A8D31@arm.com>
References: <20230605112303.1764183-1-andrew.cooper3@citrix.com>
 <1f356d3b-7068-088a-a59b-eadbfb3f59cd@suse.com>
 <ea007739-75a0-7c67-75ec-15851729c2de@citrix.com>
In-Reply-To: <ea007739-75a0-7c67-75ec-15851729c2de@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6458:EE_|AM7EUR03FT045:EE_|DB9PR08MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: 670493f4-3522-44d7-b875-08db673634a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SBeq2Hqy7Pkk9QYqSx5ajpOm/do7t8xzP+pP/UhWMZrT1A4utl09Io3CPQpJ3J2gVQ/TVZGCaMYfGtJsQDGwrHaNVOpH95N+BtHfvZMFbZAnyUsWwqWBH6MFihSCQ2+XewgPLzrVt7TSB/YdKyIVtALeXQAeb0if4ejgH+Lqaa0LZ9SJb+FOhjSd3ECWGCtykJ2pQQMqPacyDwACX9XPiWP6us5o6zH/u0yBCq0tHYnvcIPlGlpkVYZdTYnoA03Ulv9Hgimo/CY2uTdVzQVw1Oa3SeFlT5kpM4iEnJiNgdn2724wsy1EV25FrugAO16vlmUQtavbjR7rMIIPP5fcrxfFgRmbrBnpqs621EikTZthoJWiEm3Mih+v6d9SpGM3NzXMuhW0Uze1MzohPgVj5lUKOBoAyqS41zPlTYeaC/d5yXCbqKFn8lNGiHo38aDPQVVx4QQHOE6I9sVq8SO1zQ6fUo7uCYkx85DnAX5xhz2YvJ+KypQAuSPvqyzpMVtCGrjcRUIUR4LaR/hWL/MkxIDhtiDzrujyZOcMRLFOPFzm5QPGaApw2SSOcCuJS5V1WPoNDYVYpZ2y4z+E4n9N13XJfjrtJconLJjj/Th0sEayGEf/oH4jnwDfPB6NBBxLR2oM1QKVOQEiWt2PAmT8Rg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(451199021)(4326008)(66946007)(8676002)(6916009)(8936002)(91956017)(66556008)(66476007)(76116006)(36756003)(6486002)(478600001)(6666004)(86362001)(66446008)(64756008)(316002)(41300700001)(5660300002)(54906003)(2906002)(4744005)(33656002)(71200400001)(186003)(38070700005)(38100700002)(122000001)(53546011)(2616005)(83380400001)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <0D535A1A683DEF49AAFDE7BA74C8FE82@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6458
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4bd80aee-86da-48c3-bb31-08db67362def
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G5mmXVULnrnTQNoqKQl+WhgsTlEvZpKZhhA9feYNHh+yQ0DLmWg67uCMJ44XpNDCJ+8Szx40GZj6vW+eSO+7lZJ3x1ZWhYlS0dkq+XThIwTPkD5xOjD3d7TU/7WcDFoV+7SdwzdLor50fy3801tIiNQzxwmG4Goxqrs9/bZdqaghJzp/xQ/sf0txZX06sZu3+7SFGhp7mxnWSGqQQnlYLYwsmDF678s3EvYXqEeOelph9ENsus3xOZBHff9beVwbnTkYdX7GKJtRU887B+17Yl+Y41Hq7mHLnDIgZQqMm0dBewAdgV4ggdaaYXx2uqjKD0Iix6EWsZBFt/XkIMsyLubdU9BBCg54AaREkuh2KwZDqPIYgV1FRbez5ofRGXdLrMldcwlkcswitY1pDGhIQEPVUef+uQYPqOlKVv4yfzcEmVMl99YbEAk25I4wzX64Crh3EoyLVL3WKSqoLZAlGewBR9Ks1e7YQVR/NQ86aMbRSJtW1YuMjNO9cCz5dgUlFJUMHRU86OFF4l6az8beT1xTI6GFCn5k5/D+KTWmdKS3xEYiEZhJuU3XKRpRGf99XdS843wUnV8l+XIvxm5+HPhIvMFNc7GwSpZTgICiE/Yv6AqQsKW9VjmUWLC0kNwbFasTSjzn3oaQeiFP0ApbpyH9YjN47FAcf1haVTHpCsyUO5oLRWaUQ40ABLhS2j3nHAbGdQQUV1sPH7USQM2BCxUWU+bF/PwhvsvspUf7gQW+udyAykmvlK1gahHZ/TYZ
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(47076005)(53546011)(2616005)(26005)(6512007)(6506007)(83380400001)(41300700001)(36860700001)(6486002)(6666004)(186003)(336012)(40460700003)(478600001)(54906003)(81166007)(70586007)(70206006)(82310400005)(82740400003)(356005)(4326008)(40480700001)(316002)(5660300002)(8936002)(6862004)(2906002)(4744005)(86362001)(8676002)(33656002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:04:31.1824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 670493f4-3522-44d7-b875-08db673634a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6729

Hi Andrew,

> On 7 Jun 2023, at 10:27, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> On 07/06/2023 9:10 am, Jan Beulich wrote:
>> On 05.06.2023 13:23, Andrew Cooper wrote:
>>> v2:
>>> * Fix commmit message
>>> * Update comment ahead of print_tainted()
>>> * Change the emitted char from 'U' to 'I'
>> Just to mention it: With this additional change I'm no longer
>> considering this applicable to stable trees. I realize that one could
>> argue that by taking it we could accelerate learning that we broke
>> someone (if anyone), but I'm not inclined to follow this line of
>> thinking. If Arm maintainers (seeing that only Arm uses this right
>> now) think they want the change nevertheless, I'd include it,
>> though.
>=20
> I'm not overly fussed.  It's not hard to rebase around.

I agree with Jan here and I do not think we should backport.

This is not fixing a bug and could induce some misunderstanding if
we backport this change on a stable version.

Cheers
Bertrand

>=20
> ~Andrew


