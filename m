Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639987257A9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544491.850311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oYy-0002gw-6m; Wed, 07 Jun 2023 08:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544491.850311; Wed, 07 Jun 2023 08:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6oYy-0002dX-1K; Wed, 07 Jun 2023 08:30:40 +0000
Received: by outflank-mailman (input) for mailman id 544491;
 Wed, 07 Jun 2023 08:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f6c5=B3=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q6oYw-0002dR-0C
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 08:30:38 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9272d6d7-050d-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 10:30:35 +0200 (CEST)
Received: from AM0PR02CA0213.eurprd02.prod.outlook.com (2603:10a6:20b:28f::20)
 by PA4PR08MB5967.eurprd08.prod.outlook.com (2603:10a6:102:e7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 08:30:33 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:28f:cafe::f0) by AM0PR02CA0213.outlook.office365.com
 (2603:10a6:20b:28f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Wed, 7 Jun 2023 08:30:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 08:30:32 +0000
Received: ("Tessian outbound 3570909035da:v136");
 Wed, 07 Jun 2023 08:30:32 +0000
Received: from dcd5d1960048.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EA3B9769-7C9C-429D-8E91-D444BE00E3C6.1; 
 Wed, 07 Jun 2023 08:30:19 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcd5d1960048.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 07 Jun 2023 08:30:19 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS4PR08MB8024.eurprd08.prod.outlook.com (2603:10a6:20b:587::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Wed, 7 Jun
 2023 08:30:18 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6457:d14f:abe0:be0e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6457:d14f:abe0:be0e%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 08:30:18 +0000
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
X-Inumbo-ID: 9272d6d7-050d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRnWqtyjSOfTIuj0u2e9fajLhII/WBb8MtvnsrmMI64=;
 b=+ASReKMlhNp/NYwVsc3hHPIOcGuRJ8jUqZiTPO39LB5YWt5VMpcZV+NKRSz0rCQetO5vcNMqqYmFi0biYe5z4wtqvyHlUpjJFkE4laweH2jRTgvhd6pGbeTde9Sm4vcj0TDWPAkaJRN2zZJPuwK5Dj6PLFE9z4ZcIuVkFUXefss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4dc014d794ecc3b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0PyH02yxrtAs4OAADfw8oWNmu03/kscVLBfps89YB+rnvz7NJz7/6gQD564RWKhaaHMnPUJ0gyoX0kUEmHwfX8HOIyIQRXYQrALeEvz1mi4YINKnZGvQcCiK/V7NwC19Jw7+GNYLmY1mZsxpmy5vbPD7zpTTZKkmuVS0JpeFUpmU/7+W8s8s8it8Lm0epF0A59hh1QsGS7f9sXoI0y9UBr+gZ4nEUI2KRuY0I3tOYOFca7riEF+ppUeVQyUsNJfWw1igczWLZ9ncm1fxdtBgEOKtLpxBHycwA8kOddzeNf2xcnE98DaoTwRWlAfFbTyTjqkjoMZLnFk/CpWMED3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRnWqtyjSOfTIuj0u2e9fajLhII/WBb8MtvnsrmMI64=;
 b=hNsH0oOP08Gu1oid4+RUxyFgiDfPkctyyNVnXG2S+1cztSI16UCrIIufM/qiZRL1LqrtpYnW0T/cMflWeMYMm9R6LS/Z4nKd37s6QuEFE0fFESq9KdY4iI/Sv3MR9Hd1Mz8rTyUlYUVM8c/d3oOGKIg/XVT87546xpZRCv3zthdpG0xzXOLnlZl8mByfyBGmSKA4Fpc8bUhG9fPe0J+3cLYxwWh7ZIScyQeGY/dM54ntM4Rk3ipp8zUMpSqAh3XhlZyCQ3t9f4lY18oNbjhNjSJrtGivLinEOB9kehmL80xlhZa41XjzeEJ7insUNSFA4++zjE49+06KwI+n2z0OjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRnWqtyjSOfTIuj0u2e9fajLhII/WBb8MtvnsrmMI64=;
 b=+ASReKMlhNp/NYwVsc3hHPIOcGuRJ8jUqZiTPO39LB5YWt5VMpcZV+NKRSz0rCQetO5vcNMqqYmFi0biYe5z4wtqvyHlUpjJFkE4laweH2jRTgvhd6pGbeTde9Sm4vcj0TDWPAkaJRN2zZJPuwK5Dj6PLFE9z4ZcIuVkFUXefss=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, Henry Wang <Henry.Wang@arm.com>
Subject: Re: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Topic: [XEN][PATCH v7 08/19] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Index: AQHZmLWi8+vNVoAZ4kq/761cbXnoFa9/AxyA
Date: Wed, 7 Jun 2023 08:30:18 +0000
Message-ID: <5CECD509-2C18-4BC9-9A47-15BD4E5FD41C@arm.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-9-vikram.garhwal@amd.com>
 <d6a40e00-e2e3-81d9-b596-45dcfb2becd6@xen.org>
 <007122c9-1ab2-dd5e-bed4-64333113e55a@amd.com>
In-Reply-To: <007122c9-1ab2-dd5e-bed4-64333113e55a@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|AS4PR08MB8024:EE_|AM7EUR03FT006:EE_|PA4PR08MB5967:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8e05a1-9046-4f76-cdeb-08db6731758e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 69cL/dKXqqd/v+VNTe96yVJ3Y9smhdqIgmr+OOt8WecA862CuTNKij4cxMc9SfqPpHInDn82BHPLnGevn7ypIcnTDMvNFyUODfLAZnco4vI8RwLRt3KRBHaJJSRq6hq2xDV1XDv3xoFJbfgjnWM+Eg264O/zaWrFZuro/luYbXuIT30H38ZVfdM0HO7Kf5e1auisBVVwfoR5mvHLiQ5UhVuouNbfgdG9UBUK9iz0NE/I++Q8X9GNaQJWr186IJBnWWUSmeE2J6c4edzu/nlZTSyzIwbFNH+JMxYQfnfWNSAbu+F/g/xAPuYfX/nNjyXKep0kBx79Ezj+elU7rX7IpP5GPrT3sqfxrnKmYOJ2vH9KmK4C8xdMAjUXkWgLAQZKGfAFxEWVsGQTXqMk5XMiOb04MG2xLbhovsm7fQti+FkVo/3FQQdAKRbbZjz/iCKPd5VaA2vbVGfRT1Xdzlfd62oYBlktWwobaNIJ9V1fDcGSQUTkE/vojf+fED9gIJad2L0XVy6XJK2fhSCMGYjH33FyvkZC2LIfPkmb/7Ri0mD0snuy8Hn7rKeIL6E3RDWYDZzZ4f26WpfsiT2rioLRa8z9hqxuRgzNkhgt4wljuONJTo8Oxs6d1DHlM2DDluXYBG55XL3qD1tP7PXiki6s6VEBOw333p348/ptmml8zOc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(451199021)(316002)(6486002)(41300700001)(2616005)(86362001)(38070700005)(53546011)(6512007)(6506007)(186003)(26005)(2906002)(4744005)(33656002)(122000001)(38100700002)(5660300002)(36756003)(8936002)(8676002)(91956017)(66946007)(76116006)(54906003)(478600001)(71200400001)(6916009)(64756008)(4326008)(66556008)(66476007)(66446008)(37363002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6B345BA571A4DD4F9E495D1A993A8E30@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8024
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	28b91d9e-013d-40f7-7f3f-08db67316cf5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SnHMV0Dvp6qEYAvvR2hKVNQzNtORvOqomDmDIbExolzy9d5xGw2fI6ii/wPYrI3WWVDQRGx/agNRKju8U/UeM/4+BHSKyNRG+hXfKccbWB4x8h1wMgxqEG/ILjEmCsr7Nyr8eVLOnvrYE60+1aNhm26EoSNj+Ft+ORa5C/ThUfQTQo7bvHlB+SyQsajUuIz48Z6QXGdrbPSx9rsVfgeg6gwDmlGUJEI2i2IpDniYvXOknwSb9PRn05G33FZwZR1RLXBOOP1rnHwpyDOJ26XHPwxX2BNVPqkp47FBVlcNTMHLIHEl2UugcInAs/5bnYIgdt9QMPvwRYExJR4twKXkCWnubM5t164OQ+5r264pO2SsDgAOORTZUF7LjU6LJQSvWJDw7C4hurDyruT9dK+j6OMLcp92J6J8VZwj8qStxtNWemJrhMZzTYxOfJpX19jNO4ehL7gjnnOy+cwi3lSuJgfnm9V/GyF6Em7sM7Skk1qs9ZLGTfYMgaCXg95jhvKDM4KoAmGp35Xrjz/ZC69I26geHlz7tgJSqKIDkZ9GU3wwcDMArFZfyU74qN1akPHB6x9WYqGRjKsHaMo9ol4RGmONS/kzh2STdu7b43VUfv1GPkg5Yo4hWuFEYTLtcnNWmkqMH2dlG109QP29C/eynEQeeptCEiGhXE86QF+e28MoJDfKg7Oecav55JETH44SLRlOPEeHYlFnV0K8bMX95JJlZEsHtXbi3e7mMGT9M/zr/kHDQEmouw4W36wlZacVQrqDu+8PA5N7eryJFMqJ0w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(186003)(40460700003)(47076005)(2906002)(336012)(2616005)(86362001)(36756003)(33656002)(82310400005)(36860700001)(81166007)(82740400003)(40480700001)(356005)(316002)(6486002)(41300700001)(5660300002)(8936002)(8676002)(6862004)(54906003)(478600001)(53546011)(70206006)(4326008)(70586007)(6512007)(6506007)(26005)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 08:30:32.5783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8e05a1-9046-4f76-cdeb-08db6731758e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5967



> On 6 Jun 2023, at 21:29, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>=20
> Hi,
>=20
> On 6/5/23 12:12 PM, Julien Grall wrote:
>> Hi,
>>=20
>> On 02/06/2023 01:48, Vikram Garhwal wrote:
>>> Add device_tree_find_node_by_path() to find a matching node with path f=
or a
>>=20
>> AFAICT, the only difference in name between the new function and the exi=
sting one is "device_tree" vs "dt". The latter is just a shorthand of "devi=
ce tree", so it feels to me the name are a bit too similar.
>>=20
>> From my understanding, the main difference between the two functions are=
 that the current one is starting from root whereas the current one is star=
ting from a given node. So how about "dt_find_node_by_path_from()"?
> Thank you for the suggestion. This name was added in v3 as Luca Fancellu =
suggested to rename this function to "device_tree_find_node_by_path". I am =
okay with renaming it to dt_find_node_by_path_from().
>=20
> Luca, Michal and Henry: Does the dt_find_node_by_path_from() name works f=
or you?

Sure, go for it!

Cheers,
Luca=

